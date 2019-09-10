unit UdtmEST_Produtos;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  CLAg5SvcEstoqueProdutos, JvStringHolder, Tc.Data.SQLExpr ;

type

  TProdutosJunction = class
  private
    NEW_KEST_PRODUTO      : string ;
    NEW_DATA_SALDOINICIAL : TDateTime ;
    NEW_QTDE_INICIAL      : Double ;
    FCDS : TClientDataSet ;
    procedure InternalExecute ;
    procedure ReabrirMeses ;
    procedure EncerrarMeses ;
    procedure CheckPrincipal ;
    procedure FilterCDS;
    procedure GetSaldoInicialData ;
    procedure UpdateSaldoInicial ;
    procedure UpdateDataSaldoInicial ;
    procedure UpdateCompras ;
    procedure UpdateDevolucoes ;
    procedure UpdateVendas ;
    procedure UpdateMovimento ;
    procedure InitativarProduto ;
    procedure UpdateJunctions ;
    procedure UpdateLancamentos ;
    procedure RemoverFiltroCDS ;
  public
    class procedure Execute( const ACDS : TClientDataSet ) ;
  end;


  TdtmEST_Produtos = class(T_dtmBASEDBListEdit)
    cdsLstProdutos: TClientDataSet;
    cdsProduto: TClientDataSet;
    dspLstProdutos: TDataSetProvider;
    dspProduto: TDataSetProvider;
    sqlProduto: TTcSQLDataSet;
    dtsList: TDataSource;
    sqlLstProdutos: TTcSQLDataSet;
    sqlLstProdutosKEST_PRODUTO: TStringField;
    sqlLstProdutosCODIGO: TStringField;
    sqlLstProdutosNOME: TStringField;
    sqlLstProdutosDESCRICAO: TMemoField;
    sqlLstProdutosQTDE_MINIMA: TFloatField;
    sqlLstProdutosQTDE_PRODUTO: TFloatField;
    sqlLstProdutosCUSTO_MEDIO: TFloatField;
    sqlLstProdutosVALOR_VENDA: TFloatField;
    sqlLstProdutosATIVO: TStringField;
    sqlProdutoKEST_PRODUTO: TStringField;
    sqlProdutoKSYSDOMAIN: TStringField;
    sqlProdutoCODIGO: TStringField;
    sqlProdutoATIVO: TStringField;
    sqlProdutoNOME: TStringField;
    sqlProdutoDESCRICAO: TMemoField;
    sqlProdutoQTDE_INICIAL: TFloatField;
    sqlProdutoCUSTO_INICIAL: TFloatField;
    sqlProdutoVALOR_VENDA: TFloatField;
    sqlProdutoQTDE_PRODUTO: TFloatField;
    sqlProdutoCUSTO_MEDIO: TFloatField;
    sqlProdutoBAIXA_ESTOQUE: TStringField;
    sqlProdutoQTDE_MINIMA: TFloatField;
    sqlProdutoOBS: TMemoField;
    sqlProdutoPRODUTO_INSUMO_SERVICO: TIntegerField;
    sqlLstProdutosPRODUTO_INSUMO_SERVICO: TIntegerField;
    cdsUnidades: TClientDataSet;
    sqlProdutoKTIPO_PRODUTO: TStringField;
    cdsUnidadesKCAD_TIPOS: TStringField;
    cdsUnidadesDESCRICAO: TStringField;
    sqlProdutoKCAD_UNIDADE: TStringField;
    sqlLstProdutosKCAD_UNIDADE: TStringField;
    sqlLstProdutosKTIPO_PRODUTO: TStringField;
    cdsProdutoKEST_PRODUTO: TStringField;
    cdsProdutoKSYSDOMAIN: TStringField;
    cdsProdutoCODIGO: TStringField;
    cdsProdutoATIVO: TStringField;
    cdsProdutoNOME: TStringField;
    cdsProdutoDESCRICAO: TMemoField;
    cdsProdutoPRODUTO_INSUMO_SERVICO: TIntegerField;
    cdsProdutoKTIPO_PRODUTO: TStringField;
    cdsProdutoKCAD_UNIDADE: TStringField;
    cdsProdutoQTDE_INICIAL: TFloatField;
    cdsProdutoCUSTO_INICIAL: TFloatField;
    cdsProdutoVALOR_VENDA: TFloatField;
    cdsProdutoQTDE_PRODUTO: TFloatField;
    cdsProdutoCUSTO_MEDIO: TFloatField;
    cdsProdutoBAIXA_ESTOQUE: TStringField;
    cdsProdutoTOTAL_ATUAL: TFloatField;
    cdsProdutoTOTAL_INICIAL: TFloatField;
    cdsTiposProduto: TClientDataSet;
    cdsTiposProdutoKCAD_TIPOS: TStringField;
    cdsTiposProdutoDESCRICAO: TStringField;
    sqlProdutoUNIDADE: TStringField;
    cdsProdutoUNIDADE: TStringField;
    cdsLstProdutosKEST_PRODUTO: TStringField;
    cdsLstProdutosCODIGO: TStringField;
    cdsLstProdutosNOME: TStringField;
    cdsLstProdutosDESCRICAO: TMemoField;
    cdsLstProdutosKTIPO_PRODUTO: TStringField;
    cdsLstProdutosKCAD_UNIDADE: TStringField;
    cdsLstProdutosQTDE_MINIMA: TFloatField;
    cdsLstProdutosQTDE_PRODUTO: TFloatField;
    cdsLstProdutosCUSTO_MEDIO: TFloatField;
    cdsLstProdutosVALOR_VENDA: TFloatField;
    cdsLstProdutosPRODUTO_INSUMO_SERVICO: TIntegerField;
    cdsLstProdutosATIVO: TStringField;
    sqlLstProdutosUNIDADE: TStringField;
    cdsLstProdutosUNIDADE: TStringField;
    cdsLstProdutosDESC_TIPO: TStringField;
    cdsProdutoQTDE_MINIMA: TFloatField;
    cdsProdutoOBS: TMemoField;
    sqlProdutoDATA_CADASTRO: TSQLTimeStampField;
    cdsProdutoDATA_CADASTRO: TSQLTimeStampField;
    sqlLstProdutosDATA_CADASTRO: TSQLTimeStampField;
    cdsLstProdutosDATA_CADASTRO: TSQLTimeStampField;
    sqlProdutoULTIMO_FORNECEDOR: TStringField;
    cdsProdutoULTIMO_FORNECEDOR: TStringField;
    sqlLstProdutosULTIMO_FORNECEDOR: TStringField;
    cdsLstProdutosULTIMO_FORNECEDOR: TStringField;
    sqlLstProdutosTOTAL: TFloatField;
    cdsLstProdutosTOTAL: TFloatField;
    sqlProdutoDATA_SALDOINICIAL: TSQLTimeStampField;
    cdsProdutoDATA_SALDOINICIAL: TSQLTimeStampField;
    sqlProdutoKFIN_PLANOCONTA: TStringField;
    sqlProdutoDESCR_PC_NOME: TStringField;
    sqlProdutoDESCR_PC_CODIGO: TIntegerField;
    sqlProdutoDESCR_PC_CLASSIFICACAO: TStringField;
    cdsProdutoKFIN_PLANOCONTA: TStringField;
    cdsProdutoDESCR_PC_NOME: TStringField;
    cdsProdutoDESCR_PC_CODIGO: TIntegerField;
    cdsProdutoDESCR_PC_CLASSIFICACAO: TStringField;
    cdsApropriacaoProduto: TClientDataSet;
    cdsApropriacaoProdutoKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoProdutoKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoProdutoNOME: TStringField;
    cdsApropriacaoProdutoCODIGO: TIntegerField;
    cdsApropriacaoProdutoCLASSIFICACAO: TStringField;
    cdsApropriacaoProdutoPORCENTAGEM: TFloatField;
    cdsApropriacaoProdutoTABLENAME: TStringField;
    cdsApropriacaoProdutoTABLEKEY: TStringField;
    cdsApropriacaoProdutoTOTAL_PORCENTAGEM: TAggregateField;
    sqlApropriacaoProtuto: TTcSQLDataSet;
    sqlApropriacaoProtutoKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoProtutoKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoProtutoPORCENTAGEM: TFloatField;
    sqlApropriacaoProtutoNOME: TStringField;
    sqlApropriacaoProtutoCODIGO: TIntegerField;
    sqlApropriacaoProtutoCLASSIFICACAO: TStringField;
    sqlApropriacaoProtutoTABLENAME: TStringField;
    sqlApropriacaoProtutoTABLEKEY: TStringField;
    dtsSQLProduto: TDataSource;
    cdsProdutosqlApropriacaoProtuto: TDataSetField;
    sqlProdutoDESCR_PC_TIPO_APRD: TStringField;
    cdsProdutoDESCR_PC_TIPO_APRD: TStringField;
    cdsProdutoTIPO_PRODUTO: TStringField;
    sqlProdutoTIPO_PRODUTO: TStringField;
    sqlProdutoSYSORIGIN_TYPE: TIntegerField;
    cdsProdutoSYSORIGIN_TYPE: TIntegerField;
    cdsJunctionProdutos: TClientDataSet;
    cdsJunctionProdutosKEST_PRODUTO: TStringField;
    cdsJunctionProdutosCODIGO: TStringField;
    cdsJunctionProdutosNOME: TStringField;
    cdsJunctionProdutosKTIPO_PRODUTO: TStringField;
    cdsJunctionProdutosDESC_TIPO: TStringField;
    cdsJunctionProdutosKCAD_UNIDADE: TStringField;
    cdsJunctionProdutosUNIDADE: TStringField;
    cdsJunctionProdutosULTIMO_FORNECEDOR: TStringField;
    cdsJunctionProdutosQTDE_MINIMA: TFloatField;
    cdsJunctionProdutosQTDE_PRODUTO: TFloatField;
    cdsJunctionProdutosCUSTO_MEDIO: TFloatField;
    cdsJunctionProdutosTOTAL: TFloatField;
    cdsJunctionProdutosVALOR_VENDA: TFloatField;
    cdsJunctionProdutosDATA_CADASTRO: TSQLTimeStampField;
    cdsJunctionProdutosPRODUTO_INSUMO_SERVICO: TIntegerField;
    dspJunctionProdutos: TDataSetProvider;
    sqlJunctionProdutos: TTcSQLDataSet;
    sqlJunctionProdutosKEST_PRODUTO: TStringField;
    sqlJunctionProdutosCODIGO: TStringField;
    sqlJunctionProdutosNOME: TStringField;
    sqlJunctionProdutosKTIPO_PRODUTO: TStringField;
    sqlJunctionProdutosKCAD_UNIDADE: TStringField;
    sqlJunctionProdutosUNIDADE: TStringField;
    sqlJunctionProdutosULTIMO_FORNECEDOR: TStringField;
    sqlJunctionProdutosQTDE_MINIMA: TFloatField;
    sqlJunctionProdutosQTDE_PRODUTO: TFloatField;
    sqlJunctionProdutosCUSTO_MEDIO: TFloatField;
    sqlJunctionProdutosTOTAL: TFloatField;
    sqlJunctionProdutosVALOR_VENDA: TFloatField;
    sqlJunctionProdutosPRODUTO_INSUMO_SERVICO: TIntegerField;
    sqlJunctionProdutosDATA_CADASTRO: TSQLTimeStampField;
    cdsJunctionProdutosCHECKED: TIntegerField;
    JvMultiStringHolder1: TJvMultiStringHolder;
    cdsJunctionProdutosPRINCIPAL: TIntegerField;
    cdsJunctionProdutosSUM_PRINCIPAL: TAggregateField;
    cdsJunctionProdutosSUM_CHECKED: TAggregateField;
    sqlJunctionProdutosDATA_SALDOINICIAL: TSQLTimeStampField;
    sqlJunctionProdutosQTDE_INICIAL: TFloatField;
    sqlJunctionProdutosIS_FRISIA: TStringField;
    cdsJunctionProdutosDATA_SALDOINICIAL: TSQLTimeStampField;
    cdsJunctionProdutosQTDE_INICIAL: TFloatField;
    cdsJunctionProdutosIS_FRISIA: TStringField;
    cdsLstProdutosDESC_TIPO_: TStringField;
    cdsJunctionProdutosDESC_TIPO_: TStringField;
    procedure cdsLstProdutosNewRecord(DataSet: TDataSet);
    procedure cdsProdutoNewRecord(DataSet: TDataSet);
    procedure cdsLstProdutosBeforeOpen(DataSet: TDataSet);
    procedure cdsProdutoQTDE_INICIALValidate(Sender: TField);
    procedure cdsProdutoCODIGOValidate(Sender: TField);
    procedure cdsProdutoNOMEValidate(Sender: TField);
    procedure cdsProdutoCUSTO_INICIALValidate(Sender: TField);
    procedure cdsProdutoBeforePost(DataSet: TDataSet);
    procedure cdsProdutoCalcFields(DataSet: TDataSet);
    procedure cdsLstProdutosPRODUTO_INSUMO_SERVICOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsProdutoPRODUTO_INSUMO_SERVICOChange(Sender: TField);
    procedure cdsProdutoNOMESetText(Sender: TField; const Text: string);
    procedure cdsLstProdutosATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsLstProdutosBeforeDelete(DataSet: TDataSet);
    procedure cdsProdutoBeforeDelete(DataSet: TDataSet);
    procedure cdsProdutoBeforeEdit(DataSet: TDataSet);
    procedure cdsProdutoDESCR_PC_NOMESetText(Sender: TField;
      const Text: string);
    procedure cdsApropriacaoProdutoNewRecord(DataSet: TDataSet);
    procedure cdsJunctionProdutosCalcFields(DataSet: TDataSet);
    procedure cdsJunctionProdutosBeforeOpen(DataSet: TDataSet);
    procedure cdsJunctionProdutosPRINCIPALChange(Sender: TField);
    procedure cdsJunctionProdutosCHECKEDChange(Sender: TField);
    procedure cdsLstProdutosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FShowInativos : Boolean ;
    FPrincipal : string ;
    function SearchFornecedor( KFornecedor : string): string;
    procedure SetParams ;
    procedure ListaTiposCadastro(CDS: TClientDataSet; Tipo: Integer);
    function VerificaMovimentacao( FTipo: Integer) : Integer;
  public
    { Public declarations }
    FProdutoInfo : PProdutoInfo ;
    FSomenteServicos : Boolean ;
    FNewCadastro     : Boolean ;
    procedure SetFilter ( ShowInativos : Boolean );
    procedure ApplyUpdates ; override ;
    procedure ReOpenTables ; override ;
    procedure OpenTables ; override ;
    procedure SetTipoProduto( Key, TipoProduto: string ) ;
    procedure SetListaTipos( CDS: TClientDataSet; Tipo: Integer );
//  deprecated
//    procedure SetPlanoConta( Key, Nome, Classificacao: string; Codigo: Integer ) ;
    procedure UpdateFromInfo ( var AProdutoInfo : TProdutoInfo ) ;
    procedure CheckCentroCustoPadrao() ;

    procedure ProcessJunction ;
    function JunctionOK : boolean ;

    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses
    Tc.DBRTL.AbstractDB
    ,UDBFinanceiro
    , UDBEntidades
    , Exceptions
    , Data.SQLTimSt
    , CDSSuppl
    , DateUtils
   //, CLAg5SvcEntidadesCadastroTipos
    , CLAg5SvcEstoqueCadastroTipos
    , CLAg5SvcFinanceiroApropriacao
    , DataSnap.DSConnect
     ;

{$R *.dfm}


{ TrdmdtmEST_Produtos }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmEST_Produtos.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;


{$ENDIF}

{ TdtmCustomListaFicha }


procedure TdtmEST_Produtos.CheckCentroCustoPadrao;
begin
  if    (cdsProduto.state in [dsInsert, dsEdit])
    and ( cdsProdutoKFIN_PLANOCONTA.asString <> '' )
    and cdsApropriacaoProduto.IsEmpty then
  begin
    TCDSSuppl.PostIfNeed ( cdsProduto ) ;
    SvcFinanceiroApropriacaoDefault.AddCentroCustoPadrao( cdsApropriacaoProduto )
  end;
end;

procedure TdtmEST_Produtos.ApplyUpdates;
begin

 {Validação retirada conforme solicitado na demanda 1216
   if ( cdsProdutoKFIN_PLANOCONTA.AsString.Trim <> '' ) then
    if SvcFinanceiroApropriacaoDefault.NeedCC ( cdsProdutoKFIN_PLANOCONTA.AsString ) then
      if cdsApropriacaoProduto.IsEmpty then
          raise Warning.Create('é necessário informar ao menos um centro de custos.');}


  if (( cdsProdutoDATA_SALDOINICIAL.IsNull ) or ( cdsProdutoDATA_SALDOINICIAL.AsDateTime = 0 )) {and
     ( cdsProdutoBAIXA_ESTOQUE.AsBoolean ) } then
      raise Warning.Create('Data de saldo inicial não pode estar em branco.');


  inherited;

  if Assigned ( FProdutoInfo )  then
    begin
      FProdutoInfo.KEST_PRODUTO := cdsProdutoKEST_PRODUTO.AsString   ;
      FProdutoInfo.Codigo       := cdsProdutoCODIGO.AsString   ;
      FProdutoInfo.Nome         := cdsProdutoNOME.AsString   ;
    end;

//  CDSSuppl.TCDSSuppl.ApplyUpdates( cdsProduto ) ;
end;

procedure TdtmEST_Produtos.cdsApropriacaoProdutoNewRecord(DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoProdutoKFIN_APROPRIACAO );
  cdsApropriacaoProdutoTABLENAME.AsString := 'EST_PRODUTOS';
  cdsApropriacaoProdutoTABLEKEY.AsString  := cdsProdutoKEST_PRODUTO.AsString ;
end;

procedure TdtmEST_Produtos.cdsJunctionProdutosBeforeOpen(DataSet: TDataSet);
begin
  with cdsJunctionProdutos.Params do
    begin
       ParamByName( 'KSYS$DOMAIN'  ).asString := LoggedUser.DomainID ;
    end ;
end;

procedure TdtmEST_Produtos.cdsLstProdutosATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'ATIVO' ).asString = 'T' then
      Text := 'Ativo'
    else if Sender.DataSet.FieldByName ( 'ATIVO' ).asString = 'F' then
      Text := 'Inativo';
end;

procedure TdtmEST_Produtos.cdsLstProdutosBeforeDelete(DataSet: TDataSet);
begin
  if ( VerificaMovimentacao( cdsLstProdutosPRODUTO_INSUMO_SERVICO.AsInteger ) > 0 ) then
    raise Warning.Create('Ítem não pode ser excluído' + #13#10 + 'Possui movimentação(ões)');
end;

procedure TdtmEST_Produtos.cdsLstProdutosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams
end;

procedure TdtmEST_Produtos.cdsLstProdutosCalcFields(DataSet: TDataSet);
begin

  if DataSet.State in [dsInternalCalc] then
    if cdsLstProdutosKTIPO_PRODUTO.asString <> '' then
      cdsLstProdutosDESC_TIPO_.asString :=
        cdsLstProdutosDESC_TIPO
           .LookupDataSet
           .Lookup(
             cdsLstProdutosDESC_TIPO.LookupKeyFields
           , cdsLstProdutosKTIPO_PRODUTO.asString
           , cdsLstProdutosDESC_TIPO.LookupResultField
        ) ;

end;

procedure TdtmEST_Produtos.OpenTables;
begin
  ListaTiposCadastro( cdsUnidades, CLAg5SvcEstoqueCadastroTipos._UNIDADE_MEDIDA );
  ListaTiposCadastro( cdsTiposProduto, CLAg5SvcEstoqueCadastroTipos._TIPO_PRODUTO );
  inherited;
end;


procedure TdtmEST_Produtos.ReOpenTables;
var
  FKEst_produto : string;
begin
  FKEst_produto := cdsProdutoKEST_PRODUTO.AsString;
  inherited;
  cdsProduto.CancelUpdates ;
  cdsProduto.refresh ;
  cdsLstProdutos.Locate( 'KEST_PRODUTO', FKEst_produto, [] ) ;
  cdsProduto.Refresh;
end;

procedure TdtmEST_Produtos.cdsLstProdutosNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TdtmEST_Produtos.cdsLstProdutosPRODUTO_INSUMO_SERVICOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'PRODUTO_INSUMO_SERVICO' ).AsInteger = 1 then
      Text := 'Produto'
    else
    if Sender.DataSet.FieldByName ( 'PRODUTO_INSUMO_SERVICO' ).AsInteger = 2 then
      Text := 'Insumo'
    else
    if Sender.DataSet.FieldByName ( 'PRODUTO_INSUMO_SERVICO' ).AsInteger = 3 then
      Text := 'Serviço';
end;

procedure TdtmEST_Produtos.cdsProdutoBeforeDelete(DataSet: TDataSet);
begin

  if cdsProdutoSYSORIGIN_TYPE.asInteger = 2 then
    raise Warning.Create( 'Produto incluido via sincronismo.' + #10#13 + 'Não pode ser excluído.' );

  if ( VerificaMovimentacao( cdsProdutoPRODUTO_INSUMO_SERVICO.AsInteger ) > 0 ) then
    raise Warning.Create('Ítem não pode ser excluído' + #13#10 + 'Possui movimentação(ões)');
end;

procedure TdtmEST_Produtos.cdsProdutoBeforeEdit(DataSet: TDataSet);
var
  dt_final : TDate;
begin
{
  dt_final := EndOfTheMonth( IncMonth( cdsProdutoDATA_CADASTRO.AsDateTime, 1 ) );

  if Date > dt_final then
    begin
      cdsProdutoQTDE_INICIAL.ReadOnly  := True;
      cdsProdutoCUSTO_INICIAL.ReadOnly := True;
    end;
}
end;

procedure TdtmEST_Produtos.cdsProdutoBeforePost(DataSet: TDataSet);
begin
  if not FNewCadastro then
    if cdsProdutoQTDE_INICIAL.IsNull then
      raise Warning.Create('Quantidade inicial deve ser preenchida');

//  removido conforme EV-3787 - Normal - Interna - Melhoria - Financeiro - Apropriação favorita obrigatória
//
//  if    ( cdsProdutoBAIXA_ESTOQUE.AsBoolean )
//    and ( cdsProdutoKFIN_PLANOCONTA.isNull ) then
//      raise Warning.Create('Produtos que baixam estoque devem ter a ''Apropriação favorita'' preenchida');

  if    ( cdsProdutoBAIXA_ESTOQUE.AsBoolean )
    and (    cdsProdutoUNIDADE.isNull
          or (cdsProdutoUNIDADE.asString.Trim = '')
        )then
      raise Warning.Create('Produtos que baixam estoque devem ter a ''Unidade'' preenchida');
end;

procedure TdtmEST_Produtos.cdsProdutoCalcFields(DataSet: TDataSet);
begin
  if DataSet.State = dsInternalCalc then
    begin
      if (not cdsProdutoQTDE_INICIAL.IsNull) and (not cdsProdutoCUSTO_INICIAL.IsNull) then
        cdsProdutoTOTAL_INICIAL.AsFloat := cdsProdutoQTDE_INICIAL.AsFloat * cdsProdutoCUSTO_INICIAL.AsFloat;

      if (not cdsProdutoQTDE_PRODUTO.IsNull) and (not cdsProdutoCUSTO_MEDIO.IsNull) then
        cdsProdutoTOTAL_ATUAL.AsFloat := cdsProdutoQTDE_PRODUTO.AsFloat * cdsProdutoCUSTO_MEDIO.AsFloat;
    end;
end;

procedure TdtmEST_Produtos.cdsProdutoCODIGOValidate(Sender: TField);
begin
  if (Sender.IsNull) or (Sender.AsString = EmptyStr) then
    raise Warning.Create('Deve digitar um código');
end;

procedure TdtmEST_Produtos.cdsProdutoCUSTO_INICIALValidate(Sender: TField);
begin
  if (Sender.IsNull) or (Sender.AsFloat < 0) then
    raise Warning.Create('Custo inicial deve ser preenchido');
end;

procedure TdtmEST_Produtos.cdsProdutoDESCR_PC_NOMESetText(Sender: TField;
  const Text: string);
begin
   cdsProdutoKFIN_PLANOCONTA.clear ;
   Sender.AsString := Text ;
end;

procedure TdtmEST_Produtos.cdsProdutoNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsProdutoKSYSDOMAIN.Value               := LoggedUser.DomainID ;
  cdsProdutoATIVO.AsString                   := 'T';
  cdsProdutoBAIXA_ESTOQUE.AsString           := 'F'; //#1197
  cdsProdutoPRODUTO_INSUMO_SERVICO.AsInteger := 1;
  cdsProdutoQTDE_INICIAL.AsFloat             := 0;
  cdsProdutoCUSTO_INICIAL.AsFloat            := 0;
  cdsProdutoDATA_CADASTRO.AsDateTime         := Now;
  cdsProdutoSYSORIGIN_TYPE.asInteger         := 0 ;
end;

procedure TdtmEST_Produtos.cdsProdutoNOMESetText(Sender: TField; const Text: string);
begin
  if Trim ( Text ) = EmptyStr then
    Sender.Clear
  else
    Sender.asString := Text ;
end;

procedure TdtmEST_Produtos.cdsProdutoNOMEValidate(Sender: TField);
begin
  if ( Sender.IsNull ) or ( Sender.AsString = EmptyStr ) then
    if cdsProdutoPRODUTO_INSUMO_SERVICO.AsInteger = 3 then
      raise Warning.Create('Nome do serviço inválido.')
    else
      raise Warning.Create('Nome do produto/insumo inválido.')
end;

procedure TdtmEST_Produtos.cdsProdutoPRODUTO_INSUMO_SERVICOChange(Sender: TField);
begin
  if cdsProdutoPRODUTO_INSUMO_SERVICO.AsInteger = 3 then
    begin
      cdsProdutoQTDE_INICIAL.AsInteger := 1;
      cdsProdutoQTDE_MINIMA.AsInteger  := 1;
      {cdsProdutoQTDE_INICIAL.AsInteger := 1;
      cdsProdutoQTDE_MINIMA.AsInteger  := 1;}
      cdsProdutoBAIXA_ESTOQUE.AsString := 'F';
      cdsProdutoQTDE_MINIMA.Clear;
    end;
end;

procedure TdtmEST_Produtos.cdsProdutoQTDE_INICIALValidate(Sender: TField);
begin
  if (Sender.IsNull) or (Sender.AsFloat < 0) then
    raise Warning.Create('Quantidade inicial inválida');
end;

procedure TdtmEST_Produtos.ListaTiposCadastro(CDS: TClientDataSet; Tipo: Integer);
const
  SQL_LISTA = 'SELECT ' +
              ' KCAD_TIPOS, ' +
              ' DESCRICAO ' +
              'FROM CAD_TIPOS ' +
              'WHERE KSYS$DOMAIN = :KSYS$DOMAIN ' +
              '  AND TIPO = :TIPO ' +
              'ORDER BY DESCRICAO ';
var
  p : TParams;

begin
  p := TParams.Create;
  p.CreateParam( ftString, 'KSYS$DOMAIN',  ptInput ).AsString  := LoggedUser.DomainID;
  p.CreateParam( ftInteger, 'TIPO',         ptInput ).AsInteger := Tipo;

//  if Tipo = CLAg5SvcFinanceiroCadastroTipos._UNIDADE_MEDIDA then
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( CDS, SQL_LISTA, p ) ;
//  else
//    TTcAbstractDB.GetByAlias('ENTIDADES').populateClientDataSet( CDS, SQL_LISTA, p );

  p.Free;
end;

function TdtmEST_Produtos.SearchFornecedor(KFornecedor: string): string;
const
  SQL_FORNECEDOR = 'SELECT NOME FROM CAD_ENTIDADES ' +
                   'WHERE KCAD_ENTIDADE = :KFORNECEDOR ' +
                   '  AND IS_FORNECEDOR = ''T'' ';
var
  cds : TClientDataSet;
  p : TParams;
begin
  cds := nil;
  p := TParams.Create;

  p.CreateParam( ftString, 'KFORNECEDOR', ptInput ).AsString := KFornecedor;

  DBResources['ENTIDADES'].populateClientDataSet( cds, SQL_FORNECEDOR, p );

  if cds.RecordCount > 0 then
    Result := cds.FieldByName( 'NOME' ).AsString
  else
    Result := Null;

  cds.Free;
  p.Free;
end;

procedure TdtmEST_Produtos.SetFilter( ShowInativos : Boolean );
begin
  FShowInativos := ShowInativos ;
  SetParams ;
  self.RefreshList;
end;

procedure TdtmEST_Produtos.SetListaTipos(CDS: TClientDataSet; Tipo: Integer);
begin
  ListaTiposCadastro( CDS, Tipo );
end;

procedure TdtmEST_Produtos.SetTipoProduto(Key, TipoProduto: string);
begin
   if not ( cdsProduto.State in [dsInsert,dsEdit] ) then
      cdsProduto.Edit ;

   cdsProdutoKTIPO_PRODUTO.asString := Key ;
//   cdsProdutoTIPO_PRODUTO.AsString  := TipoProduto ;
end;

procedure TdtmEST_Produtos.UpdateFromInfo(var AProdutoInfo: TProdutoInfo);
begin
  FProdutoInfo := @AProdutoInfo ;
  try

    //if AProdutoInfo.TipoProduto <> 0 then
     cdsProdutoPRODUTO_INSUMO_SERVICO.AsInteger := Ord( AProdutoInfo.TipoProduto ) + 1 ;

    if AProdutoInfo.Codigo <> '' then
      cdsProdutoCODIGO.AsString  := AProdutoInfo.Codigo ;

    if AProdutoInfo.CodigoFornecedor <> '' then
      ;

    if AProdutoInfo.EAN <> '' then
       ;

    if AProdutoInfo.Nome <> '' then
      cdsProdutoNOME.AsString  := AProdutoInfo.Nome ;

    if AProdutoInfo.NCM <> '' then
       ;

    if AProdutoInfo.ExTIPI <> '' then
    ;

    if AProdutoInfo.Unidade <> '' then
      cdsProdutoUNIDADE.AsString  := AProdutoInfo.Unidade ;

    if AProdutoInfo.DataEstoque <> 0 then
      cdsProdutoDATA_SALDOINICIAL.asDateTime := AProdutoInfo.DataEstoque ;

    if AProdutoInfo.BAIXA_ESTOQUE <> '' then
        cdsProdutoBAIXA_ESTOQUE.AsString :=  AProdutoInfo.BAIXA_ESTOQUE  ;

    if AProdutoInfo.KFIN_PLANOCONTA <> '' then
      begin
        cdsProdutoDESCR_PC_NOME.asString          := AProdutoInfo.PLANOCONTA      ;
        cdsProdutoDESCR_PC_CODIGO.AsString        := AProdutoInfo.CODIGOPLANO     ;
        cdsProdutoDESCR_PC_CLASSIFICACAO.AsString := AProdutoInfo.CLASSIFICACAO   ;
        cdsProdutoDESCR_PC_TIPO_APRD.AsString     := AProdutoInfo.TIPO_APRD       ;
        cdsProdutoKFIN_PLANOCONTA.asString        := AProdutoInfo.KFIN_PLANOCONTA ;
      end;
  except On E: Exception do
     Raise ; //ShowMessage ( E.Message ) ;
  end;

end;

function TdtmEST_Produtos.VerificaMovimentacao( FTipo: Integer) : Integer;
const
  SQL_PRODUTO_INSUMO =
    'SELECT COUNT(1) FROM EST_MOVIMENTO WHERE KEST_PRODUTO = :KEST_PRODUTO ' +
    ' AND TABLENAME IS DISTINCT FROM ''EST_PRODUTOS'' ';

  SQL_SERVICO = 'SELECT COUNT(1)                                                      ' +
                'FROM EST_PRODUTOS P                                                  ' +
                'LEFT JOIN CMP_PEDIDO_SERVICOS CS ON CS.KEST_PRODUTO = P.KEST_PRODUTO ' +
                'LEFT JOIN VND_PEDIDO_SERVICOS VS ON VS.KEST_PRODUTO = P.KEST_PRODUTO ' +
                'WHERE P.KEST_PRODUTO = :KEST_PRODUTO ';
var
  cds : TClientDataSet;
  p   : TParams;
begin
  cds := nil;
  p := TParams.Create;
  p.CreateParam( ftString, 'KEST_PRODUTO', ptInput ).AsString := cdsLstProdutosKEST_PRODUTO.AsString ;

  if FTipo = 3 then
    DBResources['FINANCEIRO'].populateClientDataSet( cds, SQL_SERVICO, p)
  else
    DBResources['FINANCEIRO'].populateClientDataSet( cds, SQL_PRODUTO_INSUMO, p);

  Result := cds.FieldByName( 'COUNT' ).AsInteger;
end;

procedure TdtmEST_Produtos.SetParams;
begin
  with cdsLstProdutos.Params do
    begin
       ParamByName( 'KSYS$DOMAIN'  ).asString := LoggedUser.DomainID ;
       ParamByName( 'DSP_INATIVO'   ).asString := BoolToChar ( FShowInativos ) ;
       ParamByName( 'NOVO_CADASTRO' ).asString := BoolToChar ( FNewCadastro ) ;
       ParamByName( 'DSP_SERVICOS'  ).asString := BoolToChar ( FSomenteServicos ) ;
    end ;
end;

// deprecated
(*
procedure TdtmEST_Produtos.SetPlanoConta(Key, Nome, Classificacao: string;
  Codigo: Integer);
begin
  if not ( cdsProduto.State in [dsInsert,dsEdit] ) then
    cdsProduto.Edit ;

  cdsProdutoDESCR_PC_CODIGO.AsString    := Nome ;
  cdsProdutoKFIN_PLANOCONTA.asString    := Key ;
  cdsProdutoDESCR_PC_CLASSIFICACAO.AsString      := Classificacao ;
  cdsProdutoDESCR_PC_CODIGO.AsInteger := Codigo ;
end;
*)


{Junction}

procedure TdtmEST_Produtos.cdsJunctionProdutosCalcFields(DataSet: TDataSet);
begin
  if ( DataSet.State in [dsInternalCalc] ) and ( cdsJunctionProdutosCHECKED.IsNull  ) then
    begin
        cdsJunctionProdutosCHECKED.asString := '0' ;
        cdsJunctionProdutosPRINCIPAL.asString := '0'

    end;

  if DataSet.State in [dsInternalCalc] then
    if cdsJunctionProdutosKTIPO_PRODUTO.asString <> '' then
      cdsJunctionProdutosDESC_TIPO_.asString :=
        cdsJunctionProdutosDESC_TIPO
           .LookupDataSet
           .Lookup(
           cdsJunctionProdutosDESC_TIPO.LookupKeyFields
         , cdsJunctionProdutosKTIPO_PRODUTO.asString
         , cdsJunctionProdutosDESC_TIPO.LookupResultField
        ) ;

  cdsJunctionProdutosPRINCIPAL.OnChange := nil ;
  cdsJunctionProdutosCHECKED.OnChange := nil ;
  if cdsJunctionProdutosKEST_PRODUTO.asString = FPrincipal then
    cdsJunctionProdutosPRINCIPAL.asString := '1'
  else
    cdsJunctionProdutosPRINCIPAL.asString := '0' ;

  if ( cdsJunctionProdutosPRINCIPAL.asString = '1' ) and ( cdsJunctionProdutosCHECKED.asString = '1' ) then
    cdsJunctionProdutosCHECKED.asString := '0' ;

  cdsJunctionProdutosPRINCIPAL.OnChange := cdsJunctionProdutosPRINCIPALChange ;
  cdsJunctionProdutosCHECKED.OnChange := cdsJunctionProdutosCHECKEDChange ;

end;

procedure TdtmEST_Produtos.cdsJunctionProdutosCHECKEDChange(Sender: TField);
begin
  if ( Sender.AsString = '1' ) and ( cdsJunctionProdutosKEST_PRODUTO.asString = FPrincipal  ) then
     FPrincipal := '' ;
  cdsJunctionProdutos.Post ;
end;

procedure TdtmEST_Produtos.cdsJunctionProdutosPRINCIPALChange(Sender: TField);
begin
  if Sender.AsString = '1' then
     FPrincipal := cdsJunctionProdutosKEST_PRODUTO.asString
  else
     FPrincipal := '' ;
  cdsJunctionProdutos.Post ;
end;

procedure TdtmEST_Produtos.ProcessJunction;
begin
  TProdutosJunction.Execute( cdsJunctionProdutos );
  if cdsJunctionProdutos.IndexName = '__Idx' then
    cdsJunctionProdutos.DeleteIndex('__Idx') ;
  cdsJunctionProdutos.Close ;
  cdsJunctionProdutos.Open ;
end;

function TdtmEST_Produtos.JunctionOK: boolean;
begin
   Result :=
           cdsJunctionProdutos.Active
     and ( cdsJunctionProdutosSUM_PRINCIPAL.Value  > 0 )
     and ( cdsJunctionProdutosSUM_CHECKED.Value  > 0 )
end;

{ TProdutosJunction }


class procedure TProdutosJunction.Execute( const ACDS: TClientDataSet);
begin
   with Create do
     try
       FCDS := ACDS ;
       InternalExecute ;
     finally
       Free ;
     end;
end;

procedure TProdutosJunction.InternalExecute;
begin

 CheckPrincipal ;
 ReabrirMeses;
 FilterCDS;

 GetSaldoInicialData ;
 UpdateSaldoInicial ;
 UpdateDataSaldoInicial ;
 UpdateLancamentos ;
 EncerrarMeses ;
 RemoverFiltroCDS ;
end;

procedure TProdutosJunction.ReabrirMeses;
begin
 TTcAbstractDB.GetByAlias('FINANCEIRO')
   .ISQL
   .ExecuteDirect ( 'EXECUTE PROCEDURE EST_REABRIR_MESES' ) ;
end;


procedure TProdutosJunction.CheckPrincipal;
begin
 if not FCDS.Locate('PRINCIPAL', 1, [] ) then
    raise Exception.Create('Não localizado produto princiapal' );
 NEW_KEST_PRODUTO      := FCDS.FieldByName ( 'KEST_PRODUTO' ).asString ;
 NEW_DATA_SALDOINICIAL := FCDS.FieldByName ( 'DATA_SALDOINICIAL' ).asDateTime ;
 NEW_QTDE_INICIAL      := FCDS.FieldByName ( 'QTDE_INICIAL' ).asFloat ;
end;

procedure TProdutosJunction.EncerrarMeses;
begin
 TTcAbstractDB.GetByAlias('FINANCEIRO')
   .ISQL
   .ExecuteDirect ( 'EXECUTE PROCEDURE EST_ENCERRAR_MESES' )
end;

procedure TProdutosJunction.UpdateDataSaldoInicial;
begin
 TTcAbstractDB.GetByAlias('FINANCEIRO')
   .ISQL(
             'UPDATE EST_PRODUTOS '
      +#13#10'  SET QTDE_INICIAL = :NEW_QTDE_INICIAL'
      +#13#10'WHERE '
      +#13#10'      KEST_PRODUTO = :NEW_KEST_PRODUTO '
      +#13#10'  AND QTDE_INICIAL <> :NEW_QTDE_INICIAL'
   )
   .SQLParamValues ( 'NEW_QTDE_INICIAL', NEW_QTDE_INICIAL )
   .SQLParamValues ( 'NEW_KEST_PRODUTO', NEW_KEST_PRODUTO )
   .SQLExec ;
end;

procedure TProdutosJunction.UpdateJunctions;
const
 _UPDATE_JUNCTIONS =
       'UPDATE OR INSERT INTO EST_PRODUTO_JUNCTION'
 +#13#10'('
 +#13#10'   KEST_PRODUTO'
 +#13#10' , KEST_PRODUTO_JUNCTION'
 +#13#10')'
 +#13#10'VALUES'
 +#13#10'('
 +#13#10'   :KEST_PRODUTO'
 +#13#10' , :KEST_PRODUTO_JUNCTION'
 +#13#10')'
 +#13#10'MATCHING ( KEST_PRODUTO )' ;
begin
  TTcAbstractDB.GetByAlias('FINANCEIRO')
    .ISQL(
       _UPDATE_JUNCTIONS
    )
  .SQLParamValues('KEST_PRODUTO',         FCDS.FieldByName( 'KEST_PRODUTO' ).asString )
  .SQLParamValues('KEST_PRODUTO_JUNCTION', NEW_KEST_PRODUTO)
  .SQLExec;
end;

procedure TProdutosJunction.UpdateSaldoInicial ;
begin
  TTcAbstractDB.GetByAlias('FINANCEIRO')
    .ISQL(
             'UPDATE EST_PRODUTOS '
      +#13#10'  SET DATA_SALDOINICIAL = :NEW_DATA_SALDOINICIAL'
      +#13#10'WHERE '
      +#13#10'       KEST_PRODUTO = :NEW_KEST_PRODUTO'
      +#13#10'  AND  DATA_SALDOINICIAL > :NEW_DATA_SALDOINICIAL'
    )
    .SQLParamValues('NEW_DATA_SALDOINICIAL', NEW_DATA_SALDOINICIAL)
    .SQLParamValues('NEW_KEST_PRODUTO', NEW_KEST_PRODUTO)
    .SQLExec;
end;


procedure TProdutosJunction.FilterCDS;
begin
  FCDS.Filter := 'CHECKED = 1';
  FCDS.Filtered := True;
end;

procedure TProdutosJunction.GetSaldoInicialData;
begin
 FCDS.First ;
 while not FCDS.EOF do
   begin
     NEW_QTDE_INICIAL := NEW_QTDE_INICIAL + FCDS.FieldByName ( 'QTDE_INICIAL' ).asFloat ;
     IF ( FCDS.FieldByName ( 'DATA_SALDOINICIAL' ).asDateTime < NEW_DATA_SALDOINICIAL ) THEN
       NEW_DATA_SALDOINICIAL := FCDS.FieldByName ( 'DATA_SALDOINICIAL' ).asDateTime ;
     FCDS.Next ;
   end;
end;


procedure TProdutosJunction.UpdateCompras;
begin
 TTcAbstractDB.GetByAlias('FINANCEIRO')
   .ISQL(
           'UPDATE CMP_PEDIDO_ITENS'
    +#13#10'  SET KEST_PRODUTO = :NEW_KEST_PRODUTO'
/////    +#13#10'    , NOME = (SELECT NOME FROM EST_PRODUTOS WHERE KEST_PRODUTO = :NEW_KEST_PRODUTO)'
    +#13#10'WHERE '
    +#13#10'      KEST_PRODUTO = :KEST_PRODUTO'
   )
   .SQLParamValues('NEW_KEST_PRODUTO', NEW_KEST_PRODUTO)
   .SQLParamValues('KEST_PRODUTO',     FCDS.FieldByName( 'KEST_PRODUTO' ).asString  )
   .SQLExec;
end;

procedure TProdutosJunction.UpdateDevolucoes;
begin
 TTcAbstractDB.GetByAlias('FINANCEIRO')
   .ISQL(
           'UPDATE DEV_PEDIDO_ITENS'
    +#13#10'  SET KEST_PRODUTO = :NEW_KEST_PRODUTO'
    +#13#10'WHERE '
    +#13#10'      KEST_PRODUTO = :KEST_PRODUTO'
   )
   .SQLParamValues('NEW_KEST_PRODUTO', NEW_KEST_PRODUTO)
   .SQLParamValues('KEST_PRODUTO',     FCDS.FieldByName( 'KEST_PRODUTO' ).asString  )
   .SQLExec;
end;


procedure TProdutosJunction.UpdateVendas ;
begin
 TTcAbstractDB.GetByAlias('FINANCEIRO')
   .ISQL(
           'UPDATE VND_PEDIDO_ITENS'
    +#13#10'  SET KEST_PRODUTO = :NEW_KEST_PRODUTO'
    +#13#10'WHERE '
    +#13#10'      KEST_PRODUTO = :KEST_PRODUTO'
   )
   .SQLParamValues('NEW_KEST_PRODUTO', NEW_KEST_PRODUTO)
   .SQLParamValues('KEST_PRODUTO',     FCDS.FieldByName( 'KEST_PRODUTO' ).asString  )
   .SQLExec;
end;


procedure TProdutosJunction.UpdateMovimento;
begin
 TTcAbstractDB.GetByAlias('FINANCEIRO')
   .ISQL(
           'UPDATE EST_OUTRAS_ENTRADAS_SAIDAS'
    +#13#10'  SET KEST_PRODUTO = :NEW_KEST_PRODUTO'
    +#13#10'WHERE '
    +#13#10'      KEST_PRODUTO = :KEST_PRODUTO'
   )
   .SQLParamValues('NEW_KEST_PRODUTO', NEW_KEST_PRODUTO)
   .SQLParamValues('KEST_PRODUTO',     FCDS.FieldByName( 'KEST_PRODUTO' ).asString  )
   .SQLExec;
end;


procedure TProdutosJunction.InitativarProduto;
begin
 TTcAbstractDB.GetByAlias('FINANCEIRO')
   .ISQL(
         'UPDATE EST_PRODUTOS '
     +#13#10'  SET ATIVO = ''F'''
     +#13#10'WHERE '
     +#13#10'  KEST_PRODUTO = :KEST_PRODUTO'
   )
   .SQLParamValues('KEST_PRODUTO',     FCDS.FieldByName( 'KEST_PRODUTO' ).asString  )
   .SQLExec;
end;

procedure TProdutosJunction.UpdateLancamentos;
begin
 FCDS.First ;
 while not FCDS.EOF do
   begin
    UpdateCompras ;
    UpdateDevolucoes ;
    UpdateVendas ;
    UpdateMovimento ;
    InitativarProduto ;
    UpdateJunctions;
    FCDS.Next ;
   end;
end;

procedure TProdutosJunction.RemoverFiltroCDS;
begin
   FCDS.Filtered := False ;
   FCDS.Filter   := ''  ;
end;


end.
