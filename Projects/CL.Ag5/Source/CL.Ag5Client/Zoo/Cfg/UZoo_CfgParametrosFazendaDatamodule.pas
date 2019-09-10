unit UZoo_CfgParametrosFazendaDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE,
  UDBEntidades ;

type
  TZoo_CfgParametrosFazendaDatamodule = class(T_dtmBASE)
    cdsParametrosFazenda: TClientDataSet;
    dspParametrosFazenda: TDataSetProvider;
    sqlParametrosFazenda: TTcSQLDataSet;
    sqlParametrosFazendaKCAD_FAZENDA: TStringField;
    sqlParametrosFazendaDSA_ESTQ_MACHO: TStringField;
    sqlParametrosFazendaDIAS_PROX_CIOSCOB: TIntegerField;
    sqlParametrosFazendaDIAS_PROX_TAREFAS: TIntegerField;
    sqlParametrosFazendaDIAS_PROX_SECAGENS: TIntegerField;
    sqlParametrosFazendaDIAS_INTERVALO_BST: TIntegerField;
    cdsParametrosFazendaKCAD_FAZENDA: TStringField;
    cdsParametrosFazendaDSA_ESTQ_MACHO: TStringField;
    cdsParametrosFazendaDIAS_PROX_CIOSCOB: TIntegerField;
    cdsParametrosFazendaDIAS_PROX_TAREFAS: TIntegerField;
    cdsParametrosFazendaDIAS_PROX_SECAGENS: TIntegerField;
    cdsParametrosFazendaDIAS_INTERVALO_BST: TIntegerField;
    sqlParametrosFazendaESCALA_PRODUCAO: TIntegerField;
    cdsParametrosFazendaESCALA_PRODUCAO: TIntegerField;
    sqlParametrosFazendaEXIBIR_PARTOS_SEMCONFIRMACAO: TStringField;
    cdsParametrosFazendaEXIBIR_PARTOS_SEMCONFIRMACAO: TStringField;
    sqlParametrosFazendaEXCLUIR_TAREFAS_DESCARTE: TStringField;
    cdsParametrosFazendaEXCLUIR_TAREFAS_DESCARTE: TStringField;
    sqlParametrosFazendaDIAS_PRE_SECAGEM_BST: TIntegerField;
    cdsParametrosFazendaDIAS_PRE_SECAGEM_BST: TIntegerField;
    sqlParametrosFazendaCONSIDERAR_NAOPRENHE_SEMCONFIRM: TStringField;
    sqlParametrosFazendaCONSIDERAR_NAOPRENHE_DESCARTADO: TStringField;
    cdsParametrosFazendaCONSIDERAR_NAOPRENHE_SEMCONFIRM: TStringField;
    cdsParametrosFazendaCONSIDERAR_NAOPRENHE_DESCARTADO: TStringField;
    procedure cdsParametrosFazendaNewRecord(DataSet: TDataSet);
    procedure cdsParametrosFazendaBeforeOpen(DataSet: TDataSet);
    procedure cdsParametrosFazendaDIAS_PROX_CIOSCOBValidate(Sender: TField);
    procedure cdsParametrosFazendaDIAS_PROX_TAREFASValidate(Sender: TField);
    procedure cdsParametrosFazendaDIAS_PROX_SECAGENSValidate(Sender: TField);
    procedure cdsParametrosFazendaDIAS_INTERVALO_BSTValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
  end;

implementation

uses Exceptions;

{$R *.dfm}

procedure TZoo_CfgParametrosFazendaDatamodule.OpenTables;
begin
  inherited;
  //
end;


procedure TZoo_CfgParametrosFazendaDatamodule.cdsParametrosFazendaBeforeOpen(
  DataSet: TDataSet);
begin
  cdsParametrosFazenda.Params.ParamByName ( 'KCAD_FAZENDA' ).AsString := LoggedUser.DomainID ;
end;

procedure TZoo_CfgParametrosFazendaDatamodule.cdsParametrosFazendaDIAS_INTERVALO_BSTValidate(
  Sender: TField);
begin
  if sender.AsInteger < 1 then
     raise Warning.Create('Não pode ser menor que 1 dia');
end;

procedure TZoo_CfgParametrosFazendaDatamodule.cdsParametrosFazendaDIAS_PROX_CIOSCOBValidate(
  Sender: TField);
begin
  if sender.AsInteger < 1 then
     raise Warning.Create('Não pode ser menor que 1 dia');
end;

procedure TZoo_CfgParametrosFazendaDatamodule.cdsParametrosFazendaDIAS_PROX_SECAGENSValidate(
  Sender: TField);
begin
  if sender.AsInteger < 1 then
     raise Warning.Create('Não pode ser menor que 1 dia');
end;

procedure TZoo_CfgParametrosFazendaDatamodule.cdsParametrosFazendaDIAS_PROX_TAREFASValidate(
  Sender: TField);
begin
  if sender.AsInteger < 1 then
     raise Warning.Create('Não pode ser menor que 1 dia');
end;

procedure TZoo_CfgParametrosFazendaDatamodule.cdsParametrosFazendaNewRecord(DataSet: TDataSet);
begin
  inherited;

  cdsParametrosFazendaKCAD_FAZENDA.AsString := LoggedUser.DomainID ;
  cdsParametrosFazendaDSA_ESTQ_MACHO.asString           := 'F' ;
  cdsParametrosFazendaDIAS_PROX_CIOSCOB.asInteger       := 7 ;
  cdsParametrosFazendaDIAS_PROX_TAREFAS.asInteger       := 7 ;
  cdsParametrosFazendaDIAS_PROX_SECAGENS.asInteger      := 7 ;
  cdsParametrosFazendaDIAS_INTERVALO_BST.asInteger      := 14 ;
  cdsParametrosFazendaDIAS_PRE_SECAGEM_BST.asInteger    := 20 ;
  cdsParametrosFazendaEXCLUIR_TAREFAS_DESCARTE.asString := 'F'  ;


end;


end.
