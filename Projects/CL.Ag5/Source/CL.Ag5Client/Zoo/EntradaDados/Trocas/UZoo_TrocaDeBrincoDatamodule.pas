unit UZoo_TrocaDeBrincoDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_TrocaDeBrincoDatamodule = class(T_dtmBASE)
    cdsTrocaBrinco: TClientDataSet;
    dspTrocaBrinco: TDataSetProvider;
    sqlTrocaBrinco: TTcSQLDataSet;
    sqlTrocaBrincoKZOO_ANIMAL: TStringField;
    sqlTrocaBrincoBRINCOORIGEM: TStringField;
    sqlTrocaBrincoBRINCO: TStringField;
    sqlTrocaBrincoNOMEESTABULO: TStringField;
    cdsTrocaBrincoKZOO_ANIMAL: TStringField;
    cdsTrocaBrincoBRINCOORIGEM: TStringField;
    cdsTrocaBrincoBRINCO: TStringField;
    cdsTrocaBrincoNOMEESTABULO: TStringField;
    sqlTrocaBrincoDATABRINCO: TSQLTimeStampField;
    cdsTrocaBrincoDATABRINCO: TSQLTimeStampField;
    cdsTrocaBrincoBRINCOORIGEM_: TStringField;
    sqlTrocaBrincoBRINCOORIGEM_: TStringField;
    procedure dspTrocaBrincoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure cdsTrocaBrincoBeforePost(DataSet: TDataSet);
    procedure cdsTrocaBrincoBRINCOValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
    function AddBrinco ( ABrinco : string ; AData : TDateTime ) : boolean ;
    procedure RemoveRecord ;
  end;

implementation

uses Exceptions, UDBZootecnico, CDSSuppl,
     ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

procedure TZoo_TrocaDeBrincoDatamodule.OpenTables;
begin
  TCDSSuppl.CreateDataSet( cdsTrocaBrinco )  ;
  cdsTrocaBrinco.IndexFieldNames := 'BRINCOORIGEM_' ;
end;


procedure TZoo_TrocaDeBrincoDatamodule.RemoveRecord;
begin
   if not cdsTrocaBrinco.isEmpty then
      cdsTrocaBrinco.Delete ;
end;

function TZoo_TrocaDeBrincoDatamodule.AddBrinco( ABrinco: string ; AData : TDateTime ) : boolean ;
var
    cds : TClientDataSet ;
    p : TParams ;
begin
    Result := cdsTrocaBrinco.Locate( 'BRINCOORIGEM', ABrinco, [] ) ;
    if Result then
      begin
         cdsTrocaBrinco.Edit ;
         exit ;
      end ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
    cds := nil ;
    try

       DBResources['ZOOTECNICO'].populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, BRINCO_, NOMEESTABULO'
        +#13#10'FROM ZOO_ANIMAIS_FEMEA AF'
        +#13#10'JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
        +#13#10'WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;

       Result := not cds.IsEmpty ;

       if Result then
         with cds do
           cdsTrocaBrinco.AppendRecord( [ fieldByName ( 'KZOO_ANIMAL' ).asString,
                                   fieldByName ( 'BRINCO' ).asString,
                                   fieldByName ( 'BRINCO_' ).asString,
                                   fieldByName ( 'NOMEESTABULO' ).asString,
                                   fieldByName ( 'BRINCO' ).asString,
                                   AData ] )
         else
            raise Warning.Create('Brinco não encontrado');

    finally
       cds.Free ;
       p.free ;
    end;

end;

procedure TZoo_TrocaDeBrincoDatamodule.ApplyUpdates;
begin
  CDSSuppl.TCDSSuppl.ApplyUpdates( cdsTrocaBrinco ) ;
  OpenTables ;
end;

procedure TZoo_TrocaDeBrincoDatamodule.cdsTrocaBrincoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if Trim ( cdsTrocaBrincoBRINCO.asString ) = '' then
    raise Warning.Create('Campo novo brinco deve ser preenchido');

end;

procedure TZoo_TrocaDeBrincoDatamodule.cdsTrocaBrincoBRINCOValidate(Sender: TField);
begin
  inherited;
  if Sender.asString = cdsTrocaBrincoBRINCOORIGEM.asString then
    Exit ;

  if TAnimalFemea.CheckBrincoExists ( LoggedUser.DomainID, Sender.asString, cdsTrocaBrincoKZOO_ANIMAL.asString ) then
     raise Warning.Create('Brinco em uso por outro animal.');
end;

procedure TZoo_TrocaDeBrincoDatamodule.dspTrocaBrincoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  sql : string ;
begin
  sql := Format (
      'UPDATE ZOO_ANIMAIS SET BRINCO = %s, DATABRINCO = %s WHERE KZOO_ANIMAL = %s',
        [ QuotedStr ( DeltaDS.FieldByName ( 'BRINCO' ).asString ),
          QuotedStr ( FormatDateTime ( 'dd.mm.yyyy', DeltaDS.FieldByName ( 'DATABRINCO' ).asDateTime ) ),
          QuotedStr ( DeltaDS.FieldByName ( 'KZOO_ANIMAL' ).asString ) ] ) ;

  sqlTrocaBrinco.SQLConnection.ExecuteDirect( sql ) ;
  Applied := True ;
end;

end.
