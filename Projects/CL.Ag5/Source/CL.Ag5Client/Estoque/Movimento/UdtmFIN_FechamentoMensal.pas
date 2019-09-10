unit UdtmFIN_FechamentoMensal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DBClient, Tc.Data.SQLExpr ;

type
  TdtmFIN_FechamentoMensal = class(T_dtmBASEDBListEdit)
    cdsLstFechamentoMensal: TClientDataSet;
    cdsFechamentoMensal: TClientDataSet;
    dspLstFechamentoMensal: TDataSetProvider;
    dspFechamentoMensal: TDataSetProvider;
    sqlLstFechamentoMensal: TTcSQLDataSet;
    sqlFechamentoMensal: TTcSQLDataSet;
    dtsList: TDataSource;
    sqlLstFechamentoMensalKEST_ENCERRAMENTO_MES: TStringField;
    sqlLstFechamentoMensalANO_MES: TStringField;
    sqlLstFechamentoMensalENCERRADO: TStringField;
    sqlLstFechamentoMensalDATA_STATUS: TSQLTimeStampField;
    cdsLstFechamentoMensalKEST_ENCERRAMENTO_MES: TStringField;
    cdsLstFechamentoMensalANO_MES: TStringField;
    cdsLstFechamentoMensalENCERRADO: TStringField;
    cdsLstFechamentoMensalDATA_STATUS: TSQLTimeStampField;
    sqlFechamentoMensalKEST_ENCERRAMENTO_MES: TStringField;
    sqlFechamentoMensalANO_MES: TStringField;
    sqlFechamentoMensalENCERRADO: TStringField;
    sqlFechamentoMensalDATA_STATUS: TSQLTimeStampField;
    cdsFechamentoMensalKEST_ENCERRAMENTO_MES: TStringField;
    cdsFechamentoMensalANO_MES: TStringField;
    cdsFechamentoMensalENCERRADO: TStringField;
    cdsFechamentoMensalDATA_STATUS: TSQLTimeStampField;
    dtsFechamentoMensal: TDataSource;
    cdsFechamentoProdutos: TClientDataSet;
    sqlFechamentoProdutos: TTcSQLDataSet;
    sqlFechamentoProdutosKEST_ENCERRAMENTO_MES: TStringField;
    sqlFechamentoProdutosKEST_PRODUTO: TStringField;
    sqlFechamentoProdutosNOME: TStringField;
    sqlFechamentoProdutosQTDE_ESTOQUE: TFloatField;
    sqlFechamentoProdutosCUSTO_MEDIO: TFloatField;
    sqlFechamentoProdutosVALOR_ESTOQUE: TFloatField;
    cdsFechamentoMensalsqlFechamentoProdutos: TDataSetField;
    cdsFechamentoProdutosKEST_ENCERRAMENTO_MES: TStringField;
    cdsFechamentoProdutosKEST_PRODUTO: TStringField;
    cdsFechamentoProdutosNOME: TStringField;
    cdsFechamentoProdutosQTDE_ESTOQUE: TFloatField;
    cdsFechamentoProdutosCUSTO_MEDIO: TFloatField;
    cdsFechamentoProdutosVALOR_ESTOQUE: TFloatField;
    cdsFechamentoProdutosSOMA_VALOR_ESTOQUE: TAggregateField;
    procedure cdsLstFechamentoMensalNewRecord(DataSet: TDataSet);
    procedure cdsFechamentoMensalNewRecord(DataSet: TDataSet);
    procedure cdsLstFechamentoMensalBeforeOpen(DataSet: TDataSet);
    procedure cdsLstFechamentoMensalENCERRADOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsLstFechamentoMensalANO_MESGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsFechamentoProdutosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure EncerrarMes ;
    procedure ReabrirMes ;
    constructor Create ( AOwner : TComponent ) ;override ;
    {$IFNDEF _DSServer}
    destructor Destroy; override;
    {$ENDIF ~_DSServer}
  end;


implementation

uses UDBFinanceiro, Exceptions
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
       ;

{$R *.dfm}


{ TrdmdtmFIN_FechamentoMensal }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmFIN_FechamentoMensal.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;


{$ENDIF}



{$IFNDEF _DSServer}
destructor TdtmFIN_FechamentoMensal.Destroy;
begin
  TCdsSuppl.PersistIndexes( cdsFechamentoProdutos );
  inherited;
end;
{$ENDIF ~_DSServer}

{ TdtmCustomListaFicha }

procedure TdtmFIN_FechamentoMensal.OpenTables;
const
  CLEAR_ENCERRAMENTO_MES =
    'EXECUTE PROCEDURE EST_CLEAR_ENCERRAMENTO_MES %s' ;
begin
  TTcAbstractDB.GetByAlias('FINANCEIRO').ExecuteDirect (
      Format( CLEAR_ENCERRAMENTO_MES, [ QuotedStr( LoggedUser.DomainID ) ] ) ) ;
  inherited;
  cdsLstFechamentoMensal.Locate ( 'ENCERRADO', 'T', [] )  ;
end;

procedure TdtmFIN_FechamentoMensal.ReabrirMes;
begin
   if not cdsFechamentoMensalENCERRADO.asBoolean then
      raise Warning.Create('O mês já esta aberto.');
   self.EditRecord ;
   cdsFechamentoMensalENCERRADO.asString := 'F' ;
   try
      self.ApplyUpdates ;
   except
     begin
      self.CancelUpdates ;
      raise
     end ;
   end;
end;

procedure TdtmFIN_FechamentoMensal.cdsFechamentoProdutosAfterOpen(
  DataSet: TDataSet);
begin
  TCdsSuppl.PersistIndexes( cdsFechamentoProdutos );
  TCdsSuppl.LoadPersistedIndexes( cdsFechamentoProdutos );
end;

procedure TdtmFIN_FechamentoMensal.cdsLstFechamentoMensalANO_MESGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.DataSet.IsEmpty then
    Text := Copy ( Sender.asString, 5, 2 ) + '/' + Copy ( Sender.asString, 1, 4 )
end;

procedure TdtmFIN_FechamentoMensal.cdsLstFechamentoMensalBeforeOpen(
  DataSet: TDataSet);
begin
  cdsLstFechamentoMensal.Params.ParamByName('KSYS$DOMAIN').AsString := LoggedUser.DomainID ;
end;

procedure TdtmFIN_FechamentoMensal.cdsLstFechamentoMensalENCERRADOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.DataSet.Active then
    if Sender.asBoolean then
       Text := 'Encerrado'
    else
       Text := 'Aberto'
end;

procedure TdtmFIN_FechamentoMensal.cdsLstFechamentoMensalNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TdtmFIN_FechamentoMensal.EncerrarMes;
begin
   if cdsFechamentoMensalENCERRADO.asBoolean then
      raise Warning.Create('O mês já esta encerrado.');

   self.EditRecord ;
   cdsFechamentoMensalENCERRADO.asString := 'T' ;
   try
      self.ApplyUpdates ;
   except
     begin
      self.CancelUpdates ;
      raise
     end ;
   end;
end;

procedure TdtmFIN_FechamentoMensal.cdsFechamentoMensalNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
end;

end.
