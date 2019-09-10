unit SearchsFinanceiro;

interface

uses SearchsEntidades, SysFormSearch, UApplResources, Data.DB, Tc.Data.DB.Helpers, Data.SQLTimSt,
     System.Classes, UDBFinanceiro, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
     CLAg5SvcFinanceiroApropriacao,
     CLAg5SvcEstoqueProdutos,
     Wrappers ;

type
     TTipoReceitaDespesa = CLAg5SvcFinanceiroApropriacao.TTipoReceitaDespesa ;

     TTipoPlanoAPRD = CLAg5SvcFinanceiroApropriacao.TTipoPlanoAPRD;

     TTiposPlanoAPRD = CLAg5SvcFinanceiroApropriacao.TTiposPlanoAPRD ;

     TPlanoFilter = CLAg5SvcFinanceiroApropriacao.TPlanoFilter ;

     TPlanoAnaliticoSintetico = CLAg5SvcFinanceiroApropriacao.TPlanoAnaliticoSintetico ;

const
    StrTiposPlanoAPRD : array [ TTipoPlanoAPRD ] of string =  ( 'A', 'P', 'R', 'D' ) ;

type
     TSearchEntidade         = SearchsEntidades.TSearchEntidade ;
//     TSearchCliente          = SearchsEntidades.TSearchCliente ;
     TSearchClienteAtivo     = SearchsEntidades.TSearchClienteAtivo ;
//     TSearchFornecedor       = SearchsEntidades.TSearchFornecedor ;
     TSearchFornecedorAtivo  = SearchsEntidades.TSearchFornecedorAtivo ;
//     TSearchFuncionario      = SearchsEntidades.TSearchFuncionario ;
     TSearchFuncionarioAtivo = SearchsEntidades.TSearchFuncionarioAtivo ;

     TSearchTipoProduto = SearchsEntidades.TSearchTipoProduto ;


     TSearchDBFinanceiro = class ( TSearchObject )
     public
        constructor Create ; override ;
     end ;

     TSearchPedidoCompra = class ( TSearchDBFinanceiro )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
        procedure SetFiltro ( FDataIni, FDataFim : TDateTime; FAtivo : string ) ;
     end ;

     TSearchPedidoCompraAtivo = class ( TSearchPedidoCompra )
     public
        constructor Create ; override ;
     end ;

     TSearchDevolucao = class ( TSearchDBFinanceiro )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
        procedure SetFiltro ( FDataIni, FDataFim : TDateTime; FAtivo : string ) ;
     end ;

     TSearchDevolucaoAtivo = class ( TSearchDevolucao )
     public
        constructor Create ; override ;
     end ;

     TSearchPedidoVenda = class ( TSearchDBFinanceiro )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
        procedure SetFiltro ( FDataIni, FDataFim : TDateTime; FAtivo : string ) ;
     end ;

     TSearchEstoqueOutrasEntradasSaidas = class ( TSearchDBFinanceiro )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        ///procedure SetFiltro ( FTipo : string); // E = ENTRADA / S = SAIDA
        constructor Create ; override ;
     end ;

     TSearchEstoqueOutrasSaidas = class ( TSearchEstoqueOutrasEntradasSaidas )
     public
        constructor Create ; override ;
     end ;

     TSearchEstoqueOutrasEntradas = class ( TSearchEstoqueOutrasEntradasSaidas )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchPedidoVendaAtivo = class ( TSearchPedidoVenda )
     public
        constructor Create ; override ;
     end ;

     TSearchPlanoContasBase = class ( TSearchDBFinanceiro )
     private
       FAPRD: TTiposPlanoAPRD;
       FAnaliticoSintetico: TPlanoAnaliticoSintetico ;
       procedure SetAPRD(const Value: TTiposPlanoAPRD);
       procedure SetAnaliticoSintetico(const Value: TPlanoAnaliticoSintetico);
     protected
       procedure CLASSIFICACAOGetText(Sender: TField; var Text: string;DisplayText: Boolean);
       procedure TIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
       property  APRD : TTiposPlanoAPRD  read FAPRD write SetAPRD;
       property  AnaliticoSintetico : TPlanoAnaliticoSintetico  read FAnaliticoSintetico write SetAnaliticoSintetico;
       constructor Create ; override ;
     end ;

     TSearchPlanoContas = class ( TSearchPlanoContasBase )
     public
       constructor Create ; override ;
     end ;

     TSearchPlanoContasDefault = class ( TSearchPlanoContasBase )
     public
       constructor Create ; override ;
     end ;

     TSearchPlanoContasNotHideByUser = class ( TSearchPlanoContas )
     public
       constructor Create ; override ;
     end ;

     TSearchPlanoContasEstoque = class ( TSearchPlanoContas )
     public
       constructor Create ; override ;
     end ;

     TSearchPlanoContasEstoqueNotHideByUser = class ( TSearchPlanoContasNotHideByUser )
     public
       constructor Create ; override ;
     end ;

     TSearchPlanoContasSemEstoqueNotHideByUser = class ( TSearchPlanoContasNotHideByUser )
     public
       constructor Create ; override ;
     end ;

     TSearchPlanoContasCategoriaPatrimonio = class ( TSearchPlanoContas )
     public
       constructor Create ; override ;
     end ;

     TSearchPlanoContasCategoriaPatrimonioNotHideByUser = class ( TSearchPlanoContasNotHideByUser )
     public
       constructor Create ; override ;
     end ;


     TSearchCentroCusto = class ( TSearchDBFinanceiro )
     protected
       procedure CLASSIFICACAOGetText(Sender: TField; var Text: string;DisplayText: Boolean);
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchCentroCustoSintetico = class ( TSearchCentroCusto )
     public
        constructor Create ; override ;
     end ;

     TSearchCentroCustoAnalitico = class ( TSearchCentroCusto )
     public
        constructor Create ; override ;
     end ;

     TSearchCentroCustoSetor = class ( TSearchDBFinanceiro )
     protected
       procedure CLASSIFICACAOGetText(Sender: TField; var Text: string;DisplayText: Boolean);
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchCentroCustoSetorAnalitico = class ( TSearchDBFinanceiro )
     public
        constructor Create ; override ;
     end ;

     TSearchCentroCustoSetorSintetico = class ( TSearchDBFinanceiro )
     public
        constructor Create ; override ;
     end ;

     TSearchUsuario = class ( TSearchDBFinanceiro )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchFazenda = class ( TSearchObject )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchCidade = class ( TSearchObject )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchPatrimonio = class ( TSearchDBFinanceiro )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchPatrimonioAtivo = class ( TSearchPatrimonio )
     public
        constructor Create ; override ;
     end ;

     TSearchPatrimonioItem = class ( TSearchPatrimonioAtivo )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchProdutoInsumoServico = class ( TSearchDBFinanceiro )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchProdutoInsumoServicoAtivo = class ( TSearchProdutoInsumoServico )
     public
        constructor Create ; override ;
     end ;

     TSearchProdutoInsumo = class ( TSearchProdutoInsumoServico )
     protected
        procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end;

     TSearchProdutoInsumoAtivo = class ( TSearchProdutoInsumo )
     public
        constructor Create ; override ;
     end;

     TSearchServico = class ( TSearchProdutoInsumoServico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchServicoAtivo = class ( TSearchServico )
     public
        constructor Create ; override ;
     end ;

     TSearchCFOP = class ( TSearchDBFinanceiro )
     public
        constructor Create ; override ;
     end ;

     TSearchCST = class ( TSearchObject )
     public
        constructor Create ; override ;
     end ;

     TSearchCFISCAL = class ( TSearchObject )
     public
        constructor Create ; override ;
     end ;

     TSearchNaturezaFinanceira = class ( TSearchDBFinanceiro )
     public
        constructor Create ; override ;
     end ;

     TSearchBanco = class ( TSearchDBFinanceiro )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
       constructor Create ; override ;
     end ;

     TSearchConta = class ( TSearchDBFinanceiro )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchContaAtiva = class ( TSearchConta )
     public
        constructor Create ; override ;
     end ;

     TSearchContaAPagar = class ( TSearchDBFinanceiro )
     protected
       procedure GetTextProvisao(Sender: TField; var Text: string; DisplayText: Boolean);
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create; override ;
        procedure SetFiltro(FProvisao : String; FDataIni, FDataFim : TDateTime );
     end ;

     TSearchFinanciamentoGeral = class ( TSearchDBFinanceiro )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create; override ;
     end ;

     TSearchContaAReceber = class ( TSearchDBFinanceiro )
     protected
       procedure GetTextProvisao(Sender: TField; var Text: string; DisplayText: Boolean);
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create; override ;
        procedure SetFiltro(FProvisao : String; FDataIni, FDataFim : TDateTime );
     end ;

implementation

uses Tc.DBRTL.AbstractDB
  , SysUtils
  , CLAg5Types
  , UFIN_PlanoContasReceitasDespesasClass
  , Exceptions ;

{ TSearchDBFinanceiro }

constructor TSearchDBFinanceiro.Create;
begin
  inherited;
  AbstractDB := TTcAbstractDB.GetByAlias('FINANCEIRO') ;
  if not Assigned ( AbstractDB )  then
    RaiseException( nil, UnitName, ClassName, 'TSearchDBFinanceiro', 'AbstractDB[''FINANCEIRO''] não inicializado' ) ;
end;

constructor TSearchProdutoInsumoServico.Create ;
begin
   inherited ;
   Caption := 'Produtos/Insumos/Serviços' ;
   TableName           := 'EST_PRODUTOS P' ;
   KeyFields.CommaText := 'P.KEST_PRODUTO' ;
   Fields.CommaText    := 'P.CODIGO, P.NOME' ;
   DisplayFields.Add( 'P.DESCRICAO, P.UNIDADE, P.QTDE_PRODUTO, P.VALOR_VENDA, P.CUSTO_MEDIO, ' +
                      '(P.QTDE_PRODUTO * P.CUSTO_MEDIO) TOTAL ' );
   Where.Add( Format ( 'P.KSYS$DOMAIN = ''%s'' ', [ LoggedUser.DomainID ] ) ) ;
   Self.NewFastRegister := SvcProdutoInsumoServicoNewFastRegister ;
end;

{ TSearchCFOP }

constructor TSearchCFOP.Create;
begin
  inherited;
  Caption := 'CFOP' ;
  TableName           := 'FAT_CFOP FC' ;
  KeyFields.CommaText := 'FC.CFOP' ;
  Fields.CommaText    := 'FC.CFOP, FC.DESCRICAO' ;
//  DisplayFields.Add ( 'IIF ( CC.ANALITICO_SINTETICO = ''A'', ''Analítico'', ''Sintético'' ) ANALITICO_SINTETICO' ) ;
//  Where.Add ( Format ( 'CC.KSYS$DOMAIN=''%s''', [ LoggedUser.DomainID] ) ) ;
end;

{ TSearchCST }

constructor TSearchCST.Create;
begin
  inherited;

end;

{ TSearchCFISCAL }

constructor TSearchCFISCAL.Create;
begin
  inherited;

end;

{ TSearchNaturezaFinanceira }

constructor TSearchNaturezaFinanceira.Create;
begin
  inherited;
   TableName           := 'FIN_PLANOCONTAS PL' ;
   JoinTables.Add( 'FIN_GET_STRPLANOCONTAS( PL.KFIN_PLANOCONTA ) PS ON 1=1' ) ;
   KeyFields.CommaText := 'PL.KFIN_PLANOCONTA' ;
   Fields.CommaText    := 'PS.RESULT' ;
   Where.Add ( Format ( 'KSYS$DOMAIN=''%s''', [ LoggedUser.DomainID] ) ) ;
end;

{ TSearchConta }

constructor TSearchConta.Create;
begin
  inherited;
  Caption             := 'Contas';
  TableName           := 'FIN_CONTAS C' ;
  KeyFields.CommaText := 'C.KFIN_CONTA' ;
  Fields.CommaText    := 'C.NOME' ;
  DisplayFields.Add( 'B.CODIGO || '' - '' || B.NOME BANCO, C.AGENCIA, C.CONTA_CORRENTE');
  JoinTables.Add (    'FIN_BANCOS B ON B.KFIN_BANCO = C.KFIN_BANCO' ) ;
  JoinTables.Add (    'FRISIA_MATRICULA_CONTAS F USING ( KFIN_CONTA )' ) ;
  Where.Add ( Format ( 'C.KSYS$DOMAIN = ''%s''', [ LoggedUser.DomainID] ) ) ;
  Where.Add ( 'AND F.KFRISIA_MATRICULA_CONTA IS NULL' ) ;
end;


procedure TSearchConta.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('NOME').DisplayLabel           := 'Conta' ;
  AFields.FieldByName('BANCO').DisplayLabel          := 'Banco' ;
  AFields.FieldByName('AGENCIA').DisplayLabel        := 'Agência' ;
  AFields.FieldByName('CONTA_CORRENTE').DisplayLabel := 'Conta corrente' ;
end;

{ TSearchFazenda }

constructor TSearchFazenda.Create;
begin
   inherited;
   Caption             := 'Fazendas';
   TableName           := 'CAD_FAZENDAS F' ;
   KeyFields.CommaText := 'F.KSYS$DOMAIN' ;
   Fields.CommaText    := 'C.CODIGO, C.APELIDO, C.NOME' ;
   JoinTables.Add (    'CAD_ENTIDADES C ON C.KCAD_ENTIDADE = F.KSYS$DOMAIN' ) ;
   JoinTables.Add (    'CAD_USUARIOS_FAZENDA UF ON UF.KSYS$DOMAIN = F.KSYS$DOMAIN' ) ;
   Where.Add ( Format ( 'UF.KSYS$USER = ''%s''', [ LoggedUser.UserID ] ) ) ;
end;

procedure TSearchFazenda.CustomFormatResult(AFields: TFields);
begin
    AFields.FieldByName('CODIGO').DisplayLabel  := 'Código' ;
    AFields.FieldByName('APELIDO').DisplayLabel := 'Apelido' ;
    AFields.FieldByName('NOME').DisplayLabel    := 'Nome' ;
end;

{ TSearchUsuario }

constructor TSearchUsuario.Create;
begin
   inherited;
   Caption := 'Usuário' ;
   TableName           := 'SYS$USERS U' ;
   KeyFields.CommaText := 'U.KSYS$USER' ;
   Fields.CommaText    := 'C.CODIGO, U.LOGIN, C.APELIDO, C.NOME' ;
   JoinTables.Add (    'CAD_ENTIDADES C ON C.KCAD_ENTIDADE = U.KSYS$USER' ) ;
end;


procedure TSearchUsuario.CustomFormatResult(AFields: TFields);
begin
  inherited;
    AFields.FieldByName('CODIGO').DisplayLabel  := 'Código' ;
    AFields.FieldByName('LOGIN').DisplayLabel   := 'Login' ;
    AFields.FieldByName('APELIDO').DisplayLabel := 'Apelido' ;
    AFields.FieldByName('NOME').DisplayLabel    := 'Nome' ;
end;



{ TSearchProdutoAtivo }

constructor TSearchProdutoInsumoServicoAtivo.Create;
begin
  inherited;
  Where.Add( 'AND P.ATIVO = ''T'' ' ) ;
end;

{ TSearchServico }

constructor TSearchServico.Create;
begin
  inherited;
  JoinTables.Add( 'FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = P.KFIN_PLANOCONTA ' );
  DisplayFields.Add( ' PL.KFIN_PLANOCONTA, PL.NOME DESCR_PLANOCONTA' );
  Where.Add( 'AND P.PRODUTO_INSUMO_SERVICO = 3 ' ) ;
end;


procedure TSearchServico.CustomFormatResult( AFields : TFields );
begin
  inherited ;
  AFields.FieldByName('KFIN_PLANOCONTA'  ).Visible := False;
  AFields.FieldByName('DESCR_PLANOCONTA' ).Visible := False;
end;

{ TSearchServicoAtivo }

constructor TSearchServicoAtivo.Create;
begin
  inherited;
  Where.Add( 'AND P.ATIVO = ''T'' ' ) ;
end;

{ TSearchCidade }

constructor TSearchCidade.Create;
begin
  inherited;
   Caption := 'Cidades';
   TableName           := 'glb_dtb_municipios m' ;
   KeyFields.CommaText := 'M.CIBGE' ;
   Fields.CommaText    := 'M.NOME CIDADE, U.SIGLA UF' ;
   JoinTables.Add (    'glb_dtb_uf u on u.kglb_dtb_uf = m.kglb_dtb_uf' ) ;
end;

procedure TSearchCidade.CustomFormatResult(AFields: TFields);
begin
  inherited;
    AFields.FieldByName('CIDADE').DisplayLabel  := 'Cidade' ;
    AFields.FieldByName('UF').DisplayLabel      := 'UF' ;
end;

procedure TSearchProdutoInsumoServico.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CODIGO').DisplayLabel       := 'Código' ;
  AFields.FieldByName('NOME').DisplayLabel         := 'Nome' ;
  AFields.FieldByName('DESCRICAO').Visible         := False;
  AFields.FieldByName('UNIDADE').DisplayLabel      := 'Unidade' ;
  AFields.FieldByName('QTDE_PRODUTO').DisplayLabel := 'Quantidade em estoque' ;
  TFloatField ( AFields.FieldByName('QTDE_PRODUTO') ).DisplayFormat := '#,0.00' ;
  AFields.FieldByName('VALOR_VENDA').DisplayLabel  := 'Valor de venda' ;
  TFloatField ( AFields.FieldByName('VALOR_VENDA') ).DisplayFormat := '#,0.00' ;
  AFields.FieldByName('CUSTO_MEDIO').DisplayLabel  := 'Custo médio' ;
  TFloatField ( AFields.FieldByName('CUSTO_MEDIO') ).DisplayFormat := '#,0.00' ;
  AFields.FieldByName('TOTAL').DisplayLabel        := 'Total' ;
end;

{ TSearchBanco }

constructor TSearchBanco.Create;
begin
  inherited;
  Caption             := 'Bancos';
  TableName           := 'FIN_BANCOS B' ;
  KeyFields.CommaText := 'B.KFIN_BANCO' ;
  Fields.CommaText    := 'B.CODIGO, B.NOME' ;
end;

procedure TSearchBanco.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CODIGO').DisplayLabel := 'Código' ;
  AFields.FieldByName('NOME').DisplayLabel   := 'Banco' ;
end;

{ TSearchPlanoContas }

constructor TSearchPlanoContasBase.Create;
begin

  inherited;
  TableName           := 'FIN_PLANOCONTAS PC' ;
  KeyFields.CommaText := 'PC.KFIN_PLANOCONTA' ;
  Fields.CommaText    := 'PC.CODIGO, PC.NOME, PC.CLASSIFICACAO' ;
  JoinTables.Add( 'FIN_PLANOCONTAS EQV ON EQV.KFIN_PLANOCONTA = PC.KEQV_PLANOCONTA' );
  //DisplayFields.Add ( 'IIF ( PC.ANALITICO_SINTETICO = ''A'', ''Analítica'', ''Sintética'' ) ANALITICO_SINTETICO' ) ;
  //DisplayFields.Add ( 'IIF ( PC.DEVEDORA_CREDORA = ''D'', ''Devedora'', ''Credora'' ) DEVEDORA_CREDORA' ) ;
  //DisplayFields.Add ( 'IIF ( PC.FLUXOCAIXA = ''T'', ''Sim'', ''Não'' ) FLUXOCAIXA' ) ;
  //DisplayFields.Add ( 'IIF ( PC.FIXA_VARIAVEL = ''F'', ''Fixa'', ''Variável'' ) FIXA_VARIAVEL' ) ;
  DisplayFields.Add ( 'PC.TIPO_APRD, '''' ORDENA' ) ;
  Where.Add ( Format ( 'PC.KSYS$DOMAIN=''%s''', [ LoggedUser.DomainID] ) ) ;
  OrderBy.CommaText   := 'PC.CLASSIFICACAO' ;
end;

procedure TSearchPlanoContasBase.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CODIGO').DisplayLabel              := 'Código' ;
  AFields.FieldByName('CODIGO').DisplayWidth              := 55 ;
  AFields.FieldByName('NOME').DisplayLabel                := 'Descrição' ;
  AFields.FieldByName('NOME').DisplayWidth                := 215 ;
  //AFields.FieldByName('ANALITICO_SINTETICO').DisplayLabel := 'Analítica/Sintética' ;
  //AFields.FieldByName('DEVEDORA_CREDORA').DisplayLabel    := 'Devedora/Credora' ;
  //AFields.FieldByName('FLUXOCAIXA').DisplayLabel          := 'Fluxo de caixa' ;
  //AFields.FieldByName('FIXA_VARIAVEL').DisplayLabel       := 'Fixa/Variável' ;
  AFields.FieldByName('CLASSIFICACAO').DisplayLabel       := 'Classificação' ;
  AFields.FieldByName('CLASSIFICACAO').DisplayWidth       := 95 ;
  AFields.FieldByName('CLASSIFICACAO').OnGetText          := CLASSIFICACAOGetText;
  AFields.FieldByName('TIPO_APRD').DisplayLabel           := 'Tipo' ;
  AFields.FieldByName('TIPO_APRD').DisplayWidth           := 50 ;
  AFields.FieldByName('TIPO_APRD').OnGetText              := TIPOGetText;
  AFields.FieldByName('TIPO_APRD').Visible                := True;
  AFields.FieldByName('ORDENA').Visible                   := False;
end;

procedure TSearchPlanoContasBase.SetAnaliticoSintetico(const Value: TPlanoAnaliticoSintetico );
begin
  FAnaliticoSintetico := Value;

  case FAnaliticoSintetico of
    pasAnalitico : Where.Add ( ' AND PC.ANALITICO_SINTETICO = ''A'' '  ) ;
    pasSintetico : Where.Add ( ' AND PC.ANALITICO_SINTETICO = ''S'' '  ) ;
  end;
end;

procedure TSearchPlanoContasBase.SetAPRD(const Value: TTiposPlanoAPRD);
var
  i : TTipoPlanoAPRD ;
  StrIn : string ;
begin
  FAPRD := Value;

  StrIn := '' ;

  for I := low( TTipoPlanoAPRD ) to High( TTipoPlanoAPRD ) do
    if I in FAPRD then
      StrIn := Format ( '%s%s,', [ StrIn, QuotedStr( StrTiposPlanoAPRD[ i ] ) ] ) ;;

  if ( StrIn <> EmptyStr ) then
    begin
      StrIn := Copy( StrIn, 1, length( StrIn ) - 1 );
      Where.Add( Format( ' AND PC.TIPO_APRD IN ( %s ) ', [ StrIn ] ) ) ;
    end;

end;


procedure TSearchPlanoContasBase.TIPOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin

   if(Sender.AsString = 'A')then
     Text := 'Ativo'
   else if(Sender.AsString = 'P')then
     Text := 'Passivo'
   else if(Sender.AsString = 'R')then
     Text := 'Receita'
   else if(Sender.AsString = 'D')then
     Text := 'Despesa'

end;

procedure TSearchPlanoContasBase.CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString );
end;

constructor TSearchPlanoContasNotHideByUser.Create ;
begin
  inherited ;
  Where.Add ( 'AND PC.HIDE_BY_USER = ''F''' ) ;
end;


{ TSearchPlanoContas }

constructor TSearchPlanoContas.Create;
const
  _SQL = 'SELECT GEN_ID( TIPO_PLANOCONTAS, 0 ) AS RESULT FROM RDB$DATABASE' ;
var
  cds : TClientDataSet ;
  LTipo_PlanoContas : integer ;
begin
  inherited;

  cds := nil ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL ) ;
  LTipo_PlanoContas := cds.Fields[0].AsInteger ;
  cds.Free ;

  if LTipo_PlanoContas = 0 then
     LTipo_PlanoContas := -3 ;

  Where.Add ( Format ( 'AND PC.TIPO_PLANOCONTAS=%d', [ LTipo_PlanoContas ] ) ) ;
end;

{ TSearchCentroCustoAnalitico }
constructor TSearchCentroCusto.Create;
begin
  inherited;
  TableName           := 'FIN_CENTROSCUSTO CC' ;
  KeyFields.CommaText := 'CC.KFIN_CENTROCUSTO' ;
  Fields.CommaText    := 'CC.CLASSIFICACAO, CC.CODIGO, CC.NOME' ;
  DisplayFields.Add ( 'IIF ( CC.ANALITICO_SINTETICO = ''A'', ''Analítico'', ''Sintético'' ) ANALITICO_SINTETICO, CC.KDEF_CENTROCUSTO' ) ;
  Where.Add ( Format ( 'CC.KSYS$DOMAIN=''%s''', [ LoggedUser.DomainID] ) ) ;
end;

procedure TSearchCentroCusto.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CLASSIFICACAO').DisplayLabel := 'Classificação' ;
  AFields.FieldByName('CLASSIFICACAO').OnGetText := CLASSIFICACAOGetText;
  AFields.FieldByName('CODIGO').DisplayLabel := 'Código' ;
  AFields.FieldByName('NOME').DisplayLabel   := 'Descrição' ;
  AFields.FieldByName('ANALITICO_SINTETICO').DisplayLabel   := 'Analítico/Sintético' ;
  AFields.FieldByName('KDEF_CENTROCUSTO').Visible  := False ;
end;

procedure TSearchCentroCusto.CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskCentroCusto( Sender.AsString );
end;

{ TSearchCentroCustoSintetico }

constructor TSearchCentroCustoSintetico.Create;
begin
  inherited;
  Where.Add ( 'AND CC.ANALITICO_SINTETICO=''S''' ) ;
end;

{ TSearchCentroCustoAnalitico }

constructor TSearchCentroCustoAnalitico.Create;
begin
  inherited;
  Where.Add ( 'AND CC.ANALITICO_SINTETICO=''A''' ) ;
end;


{ TSearchCentroCustoSetor }

constructor TSearchCentroCustoSetor.Create;
begin
  inherited;
  TableName           := 'FIN_CENTROSCUSTO CC' ;
  KeyFields.CommaText := 'CC.KFIN_CENTROCUSTO' ;
  Fields.CommaText    := 'CC.CLASSIFICACAO, CC.CODIGO, CC.NOME' ;
  DisplayFields.Add ( 'IIF ( CC.ANALITICO_SINTETICO = ''A'', ''Analítico'', ''Sintético'' ) ANALITICO_SINTETICO' ) ;
  Where.Add ( Format ( 'CC.KSYS$DOMAIN=''%s''', [ LoggedUser.DomainID] ) ) ;
end;

procedure TSearchCentroCustoSetor.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CLASSIFICACAO').DisplayLabel := 'Classificação' ;
  AFields.FieldByName('CLASSIFICACAO').OnGetText := CLASSIFICACAOGetText;
  AFields.FieldByName('CODIGO').DisplayLabel := 'Código' ;
  AFields.FieldByName('NOME').DisplayLabel   := 'Descrição' ;
  AFields.FieldByName('ANALITICO_SINTETICO').DisplayLabel   := 'Analítico/Sintético' ;
end;

procedure TSearchCentroCustoSetor.CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskCentroCusto( Sender.AsString );
end;

{ TSearchCentroCustoSetorSintetico }

constructor TSearchCentroCustoSetorSintetico.Create;
begin
  inherited;
  Where.Add ( 'AND CC.ANALITICO_SINTETICO=''S''' ) ;
end;

{ TSearchCentroCustoSetorAnalitico }

constructor TSearchCentroCustoSetorAnalitico.Create;
begin
  inherited;
  Where.Add ( 'AND CC.ANALITICO_SINTETICO=''A''' ) ;
end;

{ TSearchPatrimonio }

constructor TSearchPatrimonio.Create;
begin
  inherited;
  TableName           := 'CAD_PATRIMONIOS P' ;
  KeyFields.CommaText := 'P.KCAD_PATRIMONIO' ;
  Fields.CommaText    := 'P.CODIGO, P.DESCRICAO' ;
  Where.Add ( Format ( 'P.KSYS$DOMAIN=''%s''', [ LoggedUser.DomainID] ) ) ;
end;

procedure TSearchPatrimonio.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CODIGO').DisplayLabel       := 'Código' ;
  AFields.FieldByName('DESCRICAO').DisplayLabel    := 'Descricao' ;
end;

constructor TSearchPatrimonioAtivo.Create;
begin
  inherited;
  Where.Add ( 'AND P.ATIVO= ''T'' ' ) ;
end;

{ TSearchContaAPagar }

constructor TSearchContaAPagar.Create;
begin
  inherited;
  TableName           := 'FIN_APAGAR A ' ;
  JoinTables.Add( 'FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = A.KFIN_PLANOCONTA ' );
  KeyFields.CommaText := ' A.KFIN_APAGAR' ;
  Fields.CommaText    := ' A.DOCUMENTO, A.HISTORICO, A.DATALANCTO ';
  DisplayFields.Add( ' A.DOCUMENTO_, PL.NOME, A.PROVISAO, A.VALOR ' );
  Where.Add( Format ( ' A.KSYS$DOMAIN = ''%s''', [ LoggedUser.DomainID ] ) ) ;
  Where.Add( ' AND A.ATIVO = ''T'' ' );
  Where.Add( ' AND ( A.TABLENAME IS NULL OR ( A.TABLENAME IS DISTINCT FROM ''CMP_PEDIDOS'') ) ' ) ;
  OrderBy.CommaText := 'A.DATALANCTO' ;
end;

procedure TSearchContaAPagar.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('DOCUMENTO').DisplayLabel  := 'Documento' ;
  AFields.FieldByName('DOCUMENTO_').Visible      := False ;
  AFields.FieldByName('HISTORICO').DisplayLabel  := 'Descrição' ;
  AFields.FieldByName('DATALANCTO').DisplayLabel := 'Data compra' ;
  AFields.FieldByName('NOME').DisplayLabel       := 'Conta contábil' ;
  AFields.FieldByName('PROVISAO').DisplayLabel   := 'Provisão' ;
  AFields.FieldByName('PROVISAO').OnGetText      := GetTextProvisao ;
  AFields.FieldByName('VALOR').DisplayLabel      := 'Valor' ;
end;

procedure TSearchContaAPagar.GetTextProvisao(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if      Sender.AsString = 'T' then Text := 'Sim'
  else if Sender.AsString = 'F' then Text := 'Não'
  else Text := '';
end;

procedure TSearchContaAPagar.SetFiltro(FProvisao : String; FDataIni, FDataFim : TDateTime );
begin
  Where.Add( '   AND ( :DSP_PROVISAO = ''T'' OR ( A.PROVISAO = ''F'' ) ) ' +
             '   AND ( A.DATALANCTO BETWEEN :DATAINI AND :DATAFIM ) ' ) ;

  params.CreateParam( ftString, 'DSP_PROVISAO', ptInput ).AsString     := FProvisao ;
  params.CreateParam( ftTimeStamp, 'DATAINI', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataIni );
  params.CreateParam( ftTimeStamp, 'DATAFIM', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFim );
end;

{ TSearchContaAtiva }

constructor TSearchContaAtiva.Create;
begin
  inherited;
  Where.Add( ' AND C.ATIVA = ''T'' ' );
end;

{ TSearchContaAReceber }

constructor TSearchContaAReceber.Create;
begin
  inherited;
  TableName           := ' FIN_ARECEBER R ' ;
  JoinTables.Add( 'FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = R.KFIN_PLANOCONTA ' );
  KeyFields.CommaText := ' R.KFIN_ARECEBER ' ;
  Fields.CommaText    := ' R.DOCUMENTO, R.HISTORICO, R.DATALANCTO ';
  DisplayFields.Add( ' R.DOCUMENTO_, PL.NOME, R.PROVISAO, R.VALOR ' );
  Where.Add( Format( ' R.KSYS$DOMAIN = ''%s''', [ LoggedUser.DomainID ] ) ) ;
  Where.Add( ' AND R.ATIVO = ''T'' ' );
  Where.Add( ' AND ( R.TABLENAME IS NULL OR ( R.TABLENAME IS DISTINCT FROM ''VND_PEDIDOS'' )) ' ) ;
end;

procedure TSearchContaAReceber.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('DOCUMENTO').DisplayLabel  := 'Documento' ;
  AFields.FieldByName('DOCUMENTO_').Visible      := False ;
  AFields.FieldByName('HISTORICO').DisplayLabel  := 'Descrição' ;
  AFields.FieldByName('DATALANCTO').DisplayLabel := 'Data venda' ;
  AFields.FieldByName('NOME').DisplayLabel       := 'Conta contábil' ;
  AFields.FieldByName('PROVISAO').DisplayLabel   := 'Provisão' ;
  AFields.FieldByName('PROVISAO').OnGetText      := GetTextProvisao ;
  AFields.FieldByName('VALOR').DisplayLabel      := 'Valor' ;
end;

procedure TSearchContaAReceber.GetTextProvisao(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if      Sender.AsString = 'T' then Text := 'Sim'
  else if Sender.AsString = 'F' then Text := 'Não'
  else Text := '';
end;

procedure TSearchContaAReceber.SetFiltro(FProvisao : String; FDataIni, FDataFim : TDateTime );
begin
  Where.Add( '  AND ( :DSP_PROVISAO = ''T'' OR ( R.PROVISAO = ''F'' ) ) ' +
             '  AND ( R.DATALANCTO BETWEEN :DATAINI AND :DATAFIM ) ' );

  params.CreateParam( ftString, 'DSP_PROVISAO', ptInput ).AsString     := FProvisao ;
  params.CreateParam( ftTimeStamp, 'DATAINI', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataIni );
  params.CreateParam( ftTimeStamp, 'DATAFIM', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFim );
end;

{ TSearchPedidoCompra }

constructor TSearchPedidoCompra.Create;
begin
  inherited;
  TableName           := 'CMP_PEDIDOS P ' ;
  KeyFields.CommaText := 'P.KCMP_PEDIDO ' ;
  Fields.CommaText    := 'P.NOTA_FISCAL, P.SERIE, P.NOMEENTIDADE, P.DATA_EMISSAO, P.DATA_ENTRADA ' ;
  DisplayFields.Add ( 'P.NOTA_FISCAL_, P.TOTAL_NOTA ' ) ;
  Where.Add ( Format( 'P.KSYS$DOMAIN = ''%s''', [ LoggedUser.DomainID ] ) ) ;
end;

procedure TSearchPedidoCompra.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('NOTA_FISCAL').DisplayLabel  := 'Nota Fiscal' ;
  AFields.FieldByName('NOTA_FISCAL_').Visible      := False ;
  AFields.FieldByName('SERIE').DisplayLabel        := 'Série' ;
  AFields.FieldByName('NOMEENTIDADE').DisplayLabel := 'Fornecedor' ;
  AFields.FieldByName('DATA_EMISSAO').DisplayLabel := 'Data emissão' ;
  AFields.FieldByName('DATA_ENTRADA').DisplayLabel := 'Data entrada' ;
  AFields.FieldByName('TOTAL_NOTA').DisplayLabel   := 'Total' ;
end;

procedure TSearchPedidoCompra.SetFiltro(FDataIni, FDataFim: TDateTime; FAtivo : string );
begin
  Where.Add( ' AND P.DATA_EMISSAO BETWEEN :DATAINI AND :DATAFIM' );

  if FAtivo = 'T' then
    Where.Add( Format ( ' AND P.ATIVO = ''%s''', [ FAtivo ] ) ) ;

  params.CreateParam( ftTimeStamp, 'DATAINI', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataIni );
  params.CreateParam( ftTimeStamp, 'DATAFIM', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFim );
end;

{ TSearchPedidoCompraAtivo }

constructor TSearchPedidoCompraAtivo.Create;
begin
  inherited;
  Where.Add ( ' AND P.ATIVO = ''T'' ' ) ;
end;


{ TSearchDevolucao }

constructor TSearchDevolucao.Create;
begin
  inherited;
  TableName           := 'DEV_PEDIDOS P ' ;
  KeyFields.CommaText := 'P.KDEV_PEDIDO ' ;
  Fields.CommaText    := 'P.NOTA_FISCAL, P.SERIE, P.NOMEENTIDADE, P.DATA_EMISSAO, P.DATA_ENTRADA ' ;
  DisplayFields.Add ( 'P.NOTA_FISCAL_, P.TOTAL_NOTA ' ) ;
  Where.Add ( Format( 'P.KSYS$DOMAIN = ''%s''', [ LoggedUser.DomainID ] ) ) ;
end;

procedure TSearchDevolucao.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('NOTA_FISCAL').DisplayLabel  := 'Nota Fiscal' ;
  AFields.FieldByName('NOTA_FISCAL_').Visible      := False ;
  AFields.FieldByName('SERIE').DisplayLabel        := 'Série' ;
  AFields.FieldByName('NOMEENTIDADE').DisplayLabel := 'Fornecedor' ;
  AFields.FieldByName('DATA_EMISSAO').DisplayLabel := 'Data emissão' ;
  AFields.FieldByName('DATA_ENTRADA').DisplayLabel := 'Data entrada' ;
  AFields.FieldByName('TOTAL_NOTA').DisplayLabel   := 'Total' ;
end;

procedure TSearchDevolucao.SetFiltro(FDataIni, FDataFim: TDateTime; FAtivo : string );
begin
  Where.Add( ' AND P.DATA_EMISSAO BETWEEN :DATAINI AND :DATAFIM' );

  if FAtivo = 'T' then
    Where.Add( Format ( ' AND P.ATIVO = ''%s''', [ FAtivo ] ) ) ;

  params.CreateParam( ftTimeStamp, 'DATAINI', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataIni );
  params.CreateParam( ftTimeStamp, 'DATAFIM', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFim );
end;

{ TSearchDevolucaoAtivo }

constructor TSearchDevolucaoAtivo.Create;
begin
  inherited;
  Where.Add ( ' AND P.ATIVO = ''T'' ' ) ;
end;

{ TSearchProdutoInsumo }

constructor TSearchProdutoInsumo.Create;
begin
  inherited;
  JoinTables.Add( 'FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = P.KFIN_PLANOCONTA ' );
  DisplayFields.Add( ' PL.KFIN_PLANOCONTA, PL.NOME DESCR_PLANOCONTA, P.BAIXA_ESTOQUE, PL.TIPO_APRD' );
  Where.Add( 'AND P.PRODUTO_INSUMO_SERVICO IN (1,2) ' ) ;
end;

procedure TSearchProdutoInsumo.CustomFormatResult( AFields : TFields );
begin
  inherited ;
  AFields.FieldByName('KFIN_PLANOCONTA'  ).Visible := False;
  AFields.FieldByName('DESCR_PLANOCONTA' ).Visible := False;
  AFields.FieldByName('BAIXA_ESTOQUE'    ).Visible := False;
  AFields.FieldByName('TIPO_APRD'        ).Visible := False;
end;

{ TSearchProdutoInsumoAtivo }

constructor TSearchProdutoInsumoAtivo.Create;
begin
  inherited;
  Where.Add( 'AND P.ATIVO = ''T'' ' ) ;
end;

{ TSearchPedidoVenda }

constructor TSearchPedidoVenda.Create;
begin
  inherited;
  TableName           := 'VND_PEDIDOS P ' ;
  KeyFields.CommaText := 'P.KVND_PEDIDO ' ;
  Fields.CommaText    := 'P.NOTA_FISCAL, P.SERIE, P.NOMEENTIDADE, P.DATA_EMISSAO ' ;
  DisplayFields.Add ( 'P.NOTA_FISCAL_, P.TOTAL_NOTA ' ) ;
  Where.Add ( Format ( 'P.KSYS$DOMAIN = ''%s''', [ LoggedUser.DomainID] ) ) ;
end;

procedure TSearchPedidoVenda.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('NOTA_FISCAL').DisplayLabel  := 'Nota Fiscal' ;
  AFields.FieldByName('NOTA_FISCAL_').Visible      := False ;
  AFields.FieldByName('SERIE').DisplayLabel        := 'Série' ;
  AFields.FieldByName('NOMEENTIDADE').DisplayLabel := 'Cliente' ;
  AFields.FieldByName('DATA_EMISSAO').DisplayLabel := 'Data emissão' ;
  AFields.FieldByName('TOTAL_NOTA').DisplayLabel   := 'Total' ;
end;

procedure TSearchPedidoVenda.SetFiltro(FDataIni, FDataFim: TDateTime; FAtivo: string);
begin
  Where.Add( ' AND P.DATA_EMISSAO BETWEEN :DATAINI AND :DATAFIM' );

  if FAtivo = 'T' then
    Where.Add( Format ( ' AND P.ATIVO = ''%s''', [ FAtivo ] ) ) ;

  params.CreateParam( ftTimeStamp, 'DATAINI', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataIni );
  params.CreateParam( ftTimeStamp, 'DATAFIM', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFim );
end;

{ TSearchPedidoVendaAtivo }

constructor TSearchPedidoVendaAtivo.Create;
begin
  inherited;
  Where.Add ( ' AND P.ATIVO = ''T'' ' ) ;
end;

{ TSearchPatrimonioItem }

constructor TSearchPatrimonioItem.Create;
begin
  inherited;
  DisplayFields.Add( 'P.VALOR_UNITARIO, P.QUANTIDADE, P.UNIDADE' );
end;

procedure TSearchPatrimonioItem.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('VALOR_UNITARIO').DisplayLabel := 'Valor unitário' ;
  AFields.FieldByName('QUANTIDADE').DisplayLabel     := 'Quantidade' ;
  AFields.FieldByName('UNIDADE').DisplayLabel        := 'Unidade' ;
end;

{ TSearchEstoqueOutrasEntradasSaidas }

constructor TSearchEstoqueOutrasEntradasSaidas.Create;
begin
  inherited;
  TableName           := 'EST_OUTRAS_ENTRADAS_SAIDAS M' ;
  KeyFields.CommaText := 'M.KEST_OUTRA_ENTRADA_SAIDA' ;
  Fields.CommaText    := 'M.CODIGO_LANCAMENTO' ;
  JoinTables.Add( 'EST_PRODUTOS P ON P.KEST_PRODUTO = M.KEST_PRODUTO' );
  DisplayFields.Add( 'M.DATA, P.CODIGO, P.NOME, P.UNIDADE, M.QTDE');
  Where.Add( Format ( 'M.KSYS$DOMAIN = ''%s'' ', [ LoggedUser.DomainID] ) ) ;
end;

procedure TSearchEstoqueOutrasEntradasSaidas.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CODIGO_LANCAMENTO').DisplayLabel  := 'Código lançamento' ;
  AFields.FieldByName('DATA').DisplayLabel               := 'Data' ;
  AFields.FieldByName('CODIGO').DisplayLabel             := 'Código produto' ;
  AFields.FieldByName('NOME').DisplayLabel               := 'Nome' ;
  AFields.FieldByName('UNIDADE').DisplayLabel            := 'Unidade' ;
  AFields.FieldByName('QTDE').DisplayLabel               := 'Quantidade' ;
end;

//procedure TSearchEstoqueOutrasEntradasSaidas.SetFiltro(FTipo: string);
//begin
//  Where.Add( Format ( ' AND M.TIPO = ''%s'' ', [ FTipo ] ) ) ;
//end;


{ TSearchEstoqueOutrasSaidas }

constructor TSearchEstoqueOutrasSaidas.Create;
begin
  inherited;
  Where.Add( ' AND M.TIPO = ''S'' ' );
end;

{ TSearchEstoqueOutrasEntradas }

constructor TSearchEstoqueOutrasEntradas.Create;
begin
  inherited;
  DisplayFields.Add('M.CUSTO, M.TOTAL');
  Where.Add( ' AND M.TIPO = ''E'' ' );
end;

procedure TSearchEstoqueOutrasEntradas.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CUSTO').DisplayLabel := 'Valor unitário' ;
  AFields.FieldByName('TOTAL').DisplayLabel := 'Total' ;
end;

{ TSearchPlanoContasEstoque }



constructor TSearchPlanoContasEstoque.Create;
begin
  inherited;
  Where.Add ( 'AND PC.MOVIMENTA_ESTOQUE=''T''' ) ;
end;

constructor TSearchPlanoContasEstoqueNotHideByUser.Create;
begin
  inherited;
  Where.Add ( 'AND PC.MOVIMENTA_ESTOQUE=''T''' ) ;
end;

constructor TSearchPlanoContasSemEstoqueNotHideByUser.Create;
begin
  inherited;
  Where.Add (
       Format(
            'AND PC.KFIN_PLANOCONTA <> %s'
          , [
               QuotedStr( TPlanoContasDespesasReceitas.GetKeyEstoque )
            ]
       )
  ) ;
end;



{ TSearchPlanoContasCategoriaPatrimonio }


constructor TSearchPlanoContasCategoriaPatrimonio.Create;
begin
  inherited;
  //Where.Add ( 'AND PC.CLASSIFICACAO STARTING WITH ''1.3.''' ) ; //*****-----
  {Where.Add ( 'AND (   (PC.TIPO_PLANOCONTAS < 0 AND PC.CLASSIFICACAO STARTING WITH ''1.3.'') '
            + '     OR (PC.TIPO_PLANOCONTAS = 1 AND EQV.CLASSIFICACAO STARTING WITH ''1.3.'') )' ) ;}
  Where.Add ( 'AND (   (PC.TIPO_PLANOCONTAS <= 0 AND PC.CLASSIFICACAO STARTING WITH ''1.3.'') '
            + '     OR (PC.TIPO_PLANOCONTAS > 0 AND EQV.CLASSIFICACAO STARTING WITH ''1.3.'') )' ) ;
end;

constructor TSearchPlanoContasCategoriaPatrimonioNotHideByUser.Create;
begin
  inherited;
  //Where.Add ( 'AND PC.CLASSIFICACAO STARTING WITH ''1.3.''' ) ; //*****-----
  {Where.Add ( 'AND (   (PC.TIPO_PLANOCONTAS < 0 AND PC.CLASSIFICACAO STARTING WITH ''1.3.'') '
            + '     OR (PC.TIPO_PLANOCONTAS = 1 AND EQV.CLASSIFICACAO STARTING WITH ''1.3.'') )' ) ;}
  Where.Add ( 'AND (   (PC.TIPO_PLANOCONTAS <= 0 AND PC.CLASSIFICACAO STARTING WITH ''1.3.'') '
            + '     OR (PC.TIPO_PLANOCONTAS > 0 AND EQV.CLASSIFICACAO STARTING WITH ''1.3.'') )' ) ;
end;

{ TSearchPlanoContasCategoriaPatrimonioNotHideByUser }


{ TSearchPlanoContasDefault }

constructor TSearchPlanoContasDefault.Create;
begin
  inherited;
  Where.Add ( Format ( 'AND PC.TIPO_PLANOCONTAS=%d', [ -3 ] ) ) ;
end;

{ TSearchFinanciamentoGeral }

constructor TSearchFinanciamentoGeral.Create;
begin
  inherited;
  TableName           := 'FIN_FINANCIAMENTOS_GERAL F ' ;
  JoinTables.Add( 'FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = F.KFIN_PLANOCONTA ' );
  KeyFields.CommaText := ' F.KFIN_FINANCIAMENTO_GERAL' ;
  Fields.CommaText    := ' F.DOCUMENTO, F.HISTORICO, F.DATALANCTO ';
  DisplayFields.Add( ' F.DOCUMENTO_, PL.NOME, F.VALOR ' );
  Where.Add( Format ( ' F.KSYS$DOMAIN = ''%s''', [ LoggedUser.DomainID ] ) ) ;
  Where.Add( ' AND F.ATIVO = ''T'' ' );
  OrderBy.CommaText := 'F.DATALANCTO' ;

end;

procedure TSearchFinanciamentoGeral.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('DOCUMENTO').DisplayLabel  := 'Documento' ;
  AFields.FieldByName('DOCUMENTO_').Visible      := False ;
  AFields.FieldByName('HISTORICO').DisplayLabel  := 'Descrição' ;
  AFields.FieldByName('DATALANCTO').DisplayLabel := 'Data financiamento' ;
  AFields.FieldByName('NOME').DisplayLabel       := 'Conta contábil' ;
  AFields.FieldByName('VALOR').DisplayLabel      := 'Valor' ;
end;

end.

