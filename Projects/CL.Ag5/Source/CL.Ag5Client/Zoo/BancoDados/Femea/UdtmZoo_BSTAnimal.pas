unit UdtmZoo_BSTAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TdtmZoo_BSTAnimal = class(T_dtmBASE)
    cdsBST: TClientDataSet;
    cdsBSTKZOO_ANIMAL_FEMEA: TStringField;
    cdsBSTBRINCO: TStringField;
    cdsBSTNOMEESTABULO: TStringField;
    dspLactacoes: TDataSetProvider;
    sqlBST: TTcSQLDataSet;
    sqlBSTKZOO_ANIMAL_FEMEA_BST: TStringField;
    sqlBSTKZOO_ANIMAL_FEMEA: TStringField;
    sqlBSTDATA: TSQLTimeStampField;
    sqlBSTOBSERVACAO: TMemoField;
    cdsBSTKZOO_ANIMAL_FEMEA_BST: TStringField;
    cdsBSTDATA: TSQLTimeStampField;
    cdsBSTOBSERVACAO: TMemoField;
    sqlBSTKCAD_FUNCIONARIO: TStringField;
    sqlBSTNOMEFUNCIONARIO: TStringField;
    cdsBSTKCAD_FUNCIONARIO: TStringField;
    cdsBSTNOMEFUNCIONARIO: TStringField;
    sqlBSTLOTE: TStringField;
    cdsBSTLOTE: TStringField;
    cdsLactacoes: TClientDataSet;
    sqlLactacoes: TTcSQLDataSet;
    sqlBSTKZOO_LACTACAO: TStringField;
    sqlBSTAPLICADO: TStringField;
    sqlBSTMOTIVO_INTERRUPCAO: TIntegerField;
    sqlLactacoesKZOO_LACTACAO: TStringField;
    sqlLactacoesKZOO_ANIMAL_FEMEA: TStringField;
    sqlLactacoesNL: TIntegerField;
    sqlLactacoesDATALACTACAO: TSQLTimeStampField;
    dtsSQLLactacoes: TDataSource;
    cdsLactacoesKZOO_LACTACAO: TStringField;
    cdsLactacoesKZOO_ANIMAL_FEMEA: TStringField;
    cdsLactacoesNL: TIntegerField;
    cdsLactacoesDATALACTACAO: TSQLTimeStampField;
    cdsLactacoessqlBST: TDataSetField;
    sqlLactacoesDATA_SECAGEM: TSQLTimeStampField;
    cdsLactacoesDATA_SECAGEM: TSQLTimeStampField;
    cdsBSTKZOO_LACTACAO: TStringField;
    cdsBSTAPLICADO: TStringField;
    cdsBSTMOTIVO_INTERRUPCAO: TIntegerField;
    cdsMotivoInterrupcaoBST: TClientDataSet;
    cdsMotivoInterrupcaoBSTTIPO: TStringField;
    cdsMotivoInterrupcaoBSTVALOR: TStringField;
    cdsMotivoInterrupcaoBSTDESCRICAO: TStringField;
    cdsMotivoInterrupcaoBSTORDEM: TIntegerField;
    cdsBSTDESC_MOTIVO_INTERRUPCAO: TStringField;
    procedure cdsBSTNewRecord(DataSet: TDataSet);
    procedure cdsBSTBeforePost(DataSet: TDataSet);
    procedure cdsBSTDATAValidate(Sender: TField);
    procedure cdsBSTNOMEFUNCIONARIOSetText(Sender: TField; const Text: string);
  private
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, Exceptions,CDSSuppl, ClAg5Types ;

{$R *.dfm}

procedure TdtmZoo_BSTAnimal.cdsBSTBeforePost(DataSet: TDataSet);
begin
  if cdsBSTDATA.IsNull then
     raise Warning.Create('Data inválida');

  if cdsBSTKCAD_FUNCIONARIO.IsNull then
     raise Warning.Create('Pesquise o funcionário');
end;

procedure TdtmZoo_BSTAnimal.cdsBSTDATAValidate(Sender: TField);
begin
//  if Sender.AsDateTime < (Date - 30) then
//     raise Warning.Create('Data não pode ser inferior a 30 dias.');

  if Sender.AsDateTime > Date then
     raise Warning.Create('Data não pode ser superior a data atual.');
end;

procedure TdtmZoo_BSTAnimal.cdsBSTNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsBSTKZOO_ANIMAL_FEMEA_BST ) ;
  cdsBSTKZOO_ANIMAL_FEMEA.Value := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).Value ;
end;

procedure TdtmZoo_BSTAnimal.cdsBSTNOMEFUNCIONARIOSetText(Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsBSTKCAD_FUNCIONARIO.Clear ;
end;

procedure TdtmZoo_BSTAnimal.OpenTables;
begin
   DBResources['ZOOTECNICO'].GetSystemTypes( _ST_MOTIVO_INTERRUPCAO_BST, cdsMotivoInterrupcaoBST ) ;
   TCDSSuppl.SetMasterSource(cdsLactacoes, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open ( cdsLactacoes ) ;
end;


procedure TdtmZoo_BSTAnimal.SetFuncionario(AKFuncionario, ANomeFuncionario: string);
begin
  if not ( cdsBST.State in [dsInsert, dsEdit] ) then
    cdsBST.Edit ;
  cdsBSTNOMEFUNCIONARIO.Text      := ANomeFuncionario ;
  cdsBSTKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TdtmZoo_BSTAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;


end.
