unit UdtmZoo_CMTAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TdtmZoo_CMTAnimal = class(T_dtmBASE)
    cdsCMT: TClientDataSet;
    dspCMT: TDataSetProvider;
    sqlCMT: TTcSQLDataSet;
    sqlCMTKZOO_ANIMAL_FEMEA_CMT: TStringField;
    sqlCMTKZOO_ANIMAL_FEMEA: TStringField;
    sqlCMTDATA: TSQLTimeStampField;
    sqlCMTAD: TStringField;
    sqlCMTAE: TStringField;
    sqlCMTPD: TStringField;
    sqlCMTPE: TStringField;
    sqlCMTWMT: TIntegerField;
    sqlCMTOBSERVACAO: TMemoField;
    cdsCMTKZOO_ANIMAL_FEMEA_CMT: TStringField;
    cdsCMTKZOO_ANIMAL_FEMEA: TStringField;
    cdsCMTDATA: TSQLTimeStampField;
    cdsCMTAD: TStringField;
    cdsCMTAE: TStringField;
    cdsCMTPD: TStringField;
    cdsCMTPE: TStringField;
    cdsCMTWMT: TIntegerField;
    cdsCMTOBSERVACAO: TMemoField;
    cdsCMTBRINCO: TStringField;
    cdsCMTNOMEESTABULO: TStringField;
    sqlCMTKCAD_FUNCIONARIO: TStringField;
    sqlCMTNOMEFUNCIONARIO: TStringField;
    cdsCMTKCAD_FUNCIONARIO: TStringField;
    cdsCMTNOMEFUNCIONARIO: TStringField;
    cdsTipoCMTAD: TClientDataSet;
    cdsTipoCMTADTIPO: TStringField;
    cdsTipoCMTADVALOR: TStringField;
    cdsTipoCMTADDESCRICAO: TStringField;
    cdsTipoCMTADORDEM: TIntegerField;
    cdsTipoCMTAE: TClientDataSet;
    cdsTipoCMTAETIPO: TStringField;
    cdsTipoCMTAEVALOR: TStringField;
    cdsTipoCMTAEDESCRICAO: TStringField;
    cdsTipoCMTAEORDEM: TIntegerField;
    cdsTipoCMTPE: TClientDataSet;
    cdsTipoCMTPETIPO: TStringField;
    cdsTipoCMTPEVALOR: TStringField;
    cdsTipoCMTPEDESCRICAO: TStringField;
    cdsTipoCMTPEORDEM: TIntegerField;
    cdsTipoCMTPD: TClientDataSet;
    cdsTipoCMTPDTIPO: TStringField;
    cdsTipoCMTPDVALOR: TStringField;
    cdsTipoCMTPDDESCRICAO: TStringField;
    cdsTipoCMTPDORDEM: TIntegerField;
    cdsCMTDESC_AD: TStringField;
    cdsCMTDESC_AE: TStringField;
    cdsCMTDESC_PD: TStringField;
    cdsCMTDESC_PE: TStringField;
    sqlCMTLOTE: TStringField;
    cdsCMTLOTE: TStringField;
    procedure cdsCMTNewRecord(DataSet: TDataSet);
    procedure cdsCMTBeforePost(DataSet: TDataSet);
    procedure cdsCMTDATAValidate(Sender: TField);
    procedure cdsCMTNOMEFUNCIONARIOSetText(Sender: TField; const Text: string);
  private
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    function AddBrinco ( ABrinco : string ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, Exceptions, ClAg5Types,
     CDSSuppl  ;

{$R *.dfm}

procedure TdtmZoo_CMTAnimal.cdsCMTBeforePost(DataSet: TDataSet);
begin
  if cdsCMTDATA.AsDateTime < 1 then
     raise Warning.Create('Data inválida.');

  if cdsCMTKCAD_FUNCIONARIO.IsNull then
     raise Warning.Create('Pesquise o funcionário');

  if (cdsCMTAD.IsNull and cdsCMTAE.IsNull and cdsCMTPD.IsNull and cdsCMTPE.IsNull) then
     raise Warning.Create('Deve ser preenchido ao menos um dos campos (AE / AD / PE / PD)');
end;

procedure TdtmZoo_CMTAnimal.cdsCMTDATAValidate(Sender: TField);
begin
//  if Sender.AsDateTime < (Date - 30) then
//     raise Warning.Create('Data não pode ser inferior a 30 dias.');

  if Sender.AsDateTime > Date then
     raise Warning.Create('Data não pode ser superior a data atual.');
end;

procedure TdtmZoo_CMTAnimal.cdsCMTNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsCMTKZOO_ANIMAL_FEMEA_CMT ) ;
  cdsCMTKZOO_ANIMAL_FEMEA.Value := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).Value ;
end;

procedure TdtmZoo_CMTAnimal.cdsCMTNOMEFUNCIONARIOSetText(Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsCMTKCAD_FUNCIONARIO.Clear ;
end;

procedure TdtmZoo_CMTAnimal.OpenTables;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_CMT, cdsTipoCMTAE ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_CMT, cdsTipoCMTAD ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_CMT, cdsTipoCMTPE ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_CMT, cdsTipoCMTPD ) ;

   TCDSSuppl.SetMasterSource(cdsCMT, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open ( cdsCMT ) ;
end;


procedure TdtmZoo_CMTAnimal.SetFuncionario(AKFuncionario, ANomeFuncionario: string);
begin
  if not ( cdsCMT.State in [dsInsert, dsEdit] ) then
    cdsCMT.Edit ;
  cdsCMTNOMEFUNCIONARIO.Text      := ANomeFuncionario ;
  cdsCMTKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TdtmZoo_CMTAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

function TdtmZoo_CMTAnimal.AddBrinco(ABrinco: string ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
var
    cds : TClientDataSet ;
    p : TParams ;
begin
    Result := cdsCMT.Locate( 'BRINCO', ABrinco, [] ) ;
    if Result then
      begin
         cdsCMT.Edit ;
         cdsCMTKCAD_FUNCIONARIO.asString  := AKFuncionario ;
         cdsCMTNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
         cdsCMTDATA.asDateTime            := AData ;
         exit ;
      end ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
    cds := nil ;
    try
       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;
       Result := not cds.IsEmpty ;

       if Result then
         with cds do
           begin
             cdsCMT.Append ;
             GetKey ( cdsCMTKZOO_ANIMAL_FEMEA_CMT ) ;
             cdsCMTKZOO_ANIMAL_FEMEA.asString := fieldByName ( 'KZOO_ANIMAL' ).asString  ;
             cdsCMTBRINCO.asString            := fieldByName ( 'BRINCO' ).asString       ;
             cdsCMTNOMEESTABULO.asString      := fieldByName ( 'NOMEESTABULO' ).asString ;
             cdsCMTKCAD_FUNCIONARIO.asString  := AKFuncionario ;
             cdsCMTNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
             cdsCMTDATA.asDateTime            := AData ;
           end
         else
            raise Warning.Create('Brinco não encontrado');

    finally
       cds.Free ;
       p.free ;
    end;

end;

end.
