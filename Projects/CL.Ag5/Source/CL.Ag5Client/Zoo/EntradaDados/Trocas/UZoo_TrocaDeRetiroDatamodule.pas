unit UZoo_TrocaDeRetiroDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_TrocaDeRetiroDatamodule = class(T_dtmBASE)
    cdsTrocaRetiro: TClientDataSet;
    dspTrocaRetiro: TDataSetProvider;
    sqlTrocaRetiro: TTcSQLDataSet;
    sqlTrocaRetiroKZOO_ANIMAL_FEMEA: TStringField;
    sqlTrocaRetiroBRINCO: TStringField;
    sqlTrocaRetiroNOMEESTABULO: TStringField;
    sqlTrocaRetiroRETIROORIGEM: TStringField;
    sqlTrocaRetiroRETIRO: TStringField;
    cdsTrocaRetiroKZOO_ANIMAL_FEMEA: TStringField;
    cdsTrocaRetiroBRINCO: TStringField;
    cdsTrocaRetiroNOMEESTABULO: TStringField;
    cdsTrocaRetiroRETIROORIGEM: TStringField;
    cdsTrocaRetiroRETIRO: TStringField;
    sqlTrocaRetiroDATARETIRO: TSQLTimeStampField;
    cdsTrocaRetiroDATARETIRO: TSQLTimeStampField;
    sqlTrocaRetiroBRINCO_: TStringField;
    cdsTrocaRetiroBRINCO_: TStringField;
    procedure dspTrocaRetiroBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure cdsTrocaRetiroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
    function AddBrinco ( ABrinco : string ; ARetiro : String ; AData : TDateTime ) : boolean ;
    procedure RemoveRecord ;
  end;

implementation

uses Exceptions, UDBZootecnico, CDSSuppl;

{$R *.dfm}

procedure TZoo_TrocaDeRetiroDatamodule.ApplyUpdates;
begin
  CDSSuppl.TCDSSuppl.ApplyUpdates( cdsTrocaRetiro ) ;
  OpenTables ;
end;

procedure TZoo_TrocaDeRetiroDatamodule.cdsTrocaRetiroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if Trim ( cdsTrocaRetiroRETIRO.asString ) = '' then
    raise Warning.Create('Campo Novo Retiro deve ser preenchido');
end;

procedure TZoo_TrocaDeRetiroDatamodule.dspTrocaRetiroBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin

  sqlTrocaRetiro.SQLConnection.ExecuteDirect(
     Format (
      'UPDATE ZOO_ANIMAIS_FEMEA SET RETIRO = %s, DATARETIRO = %s WHERE KZOO_ANIMAL_FEMEA = %s',
        [ QuotedStr ( DeltaDS.FieldByName ( 'RETIRO' ).asString ),
          QuotedStr ( FormatDateTime ( 'dd.mm.yyyy', DeltaDS.FieldByName ( 'DATARETIRO' ).asDateTime ) ),
          QuotedStr ( DeltaDS.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString ) ] ) ) ;
  Applied := True ;

end;

procedure TZoo_TrocaDeRetiroDatamodule.OpenTables;
begin
  TCDSSuppl.CreateDataSet( cdsTrocaRetiro ) ;
  cdsTrocaRetiro.IndexFieldNames := 'BRINCO_' ;
end;


procedure TZoo_TrocaDeRetiroDatamodule.RemoveRecord;
begin
   if not cdsTrocaRetiro.isEmpty then
      cdsTrocaRetiro.Delete ;
end;

function TZoo_TrocaDeRetiroDatamodule.AddBrinco(ABrinco, ARetiro: String ; AData : TDateTime ): boolean;
var
    cds : TClientDataSet ;
    p : TParams ;
begin
    Result := cdsTrocaRetiro.Locate( 'BRINCO', ABrinco, [] ) ;
    if Result then
      begin
         cdsTrocaRetiro.Edit ;
         exit ;
      end ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
    cds := nil ;
    try

      DBResources['ZOOTECNICO'].populateClientDataSet( cds,
              'AF.KZOO_ANIMAL_FEMEA,  A.BRINCO, A.BRINCO_, A.NOMEESTABULO, AF.RETIRO'
       +#13#10'FROM ZOO_ANIMAIS_FEMEA AF'
       +#13#10'INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
       +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( A.BRINCO = :BRINCO )', p ) ;
       Result := not cds.IsEmpty ;

       if Result then
         with cds do
           cdsTrocaRetiro.AppendRecord( [ fieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString,
                                   fieldByName ( 'BRINCO' ).asString,
                                   fieldByName ( 'BRINCO_' ).asString,
                                   fieldByName ( 'NOMEESTABULO' ).asString,
                                   fieldByName ( 'RETIRO' ).asString,
                                   ARetiro,
                                   AData ] )
         else
            raise Warning.Create('Brinco não encontrado');

    finally
       cds.Free ;
       p.free ;
    end;

end;

end.
