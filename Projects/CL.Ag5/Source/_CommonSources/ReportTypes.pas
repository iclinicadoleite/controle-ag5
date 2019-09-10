unit ReportTypes;

interface

uses System.SysUtils, System.Classes, DateUtils, SysReportTypes, DBClient ;

{$SCOPEDENUMS ON}


type
  TContasBancarias = array of String;

  TReportParamsFIN_APagar = class ( TReportParams )
    ExibirQuitados : boolean ;
    KFIN_APAGAR    : string ;
    FTODOS         : Boolean;
    KCAD_ENTIDADE  : string ;
    Ordem          : string ;
    Filtro         : string ;
    FDataModule       : TDataModule ;
  end ;

  TReportParamsFIN_PagamentosRecebimentos = class ( TReportParams )
  type
    TTipoCentroCusto = ( ccdAll, ccdEmpty, ccdSpecific ) ;
  public
    IncluirDebitos    : boolean ;
    ProvisaoDebitos      : boolean ;
    ProgramacaoDebitos   : boolean ;
    IncluirCreditos   : boolean ;
    ProvisaoCreditos     : boolean ;
    ProgramacaoCreditos  : boolean ;
//    ExibirQuitados    : boolean ;
//    ExibirDuvidosos   : Boolean ;
//    ExibirAtrasadas   : Boolean ;
    TodasContas       : Boolean;
    Contas            : string ;
    KFIN_PLANOCONTA   : string ;
    TodosCentros      : Boolean ;
    KFIN_CENTROCUSTO  : string ;
    RatearCentroCusto : boolean ;
    TipoCentroCusto   : TTipoCentroCusto ;
    KCentroCusto      : string ;
    ClassificacaoCC   : string ;
    RatearContaContabil : boolean ;
    KPlanoContas      : string ;
    Classificacao     : string ;
    KCAD_CLIENTE      : string ;
    KCAD_FORNECEDOR   : string ;
    FDataModule       : TDataModule ;
  end ;

  TReportParamsFIN_DRE = class ( TReportParams )
  type
    TTipoCentroCusto = ( ccdAll, ccdEmpty, ccdSpecific ) ;
  public
    Provisao           : boolean ;
    Programacao        : boolean ;
    TodosCentros       : Boolean ;
    TipoCentroCusto    : TTipoCentroCusto ;
    KCentroCusto       : string ;
    CentroCustoDefault : boolean ;
    ClassificacaoCC    : string ;
    FDataModule        : TDataModule ;
  end ;

  TReportParamsFIN_Despesas = class ( TReportParams )
  type
    TTipoCentroCustoDespesa = ( ccdAll, ccdEmpty, ccdSpecific ) ;
  public
    RatearCentroCusto : boolean ;
    TipoCentroCusto   : TTipoCentroCustoDespesa ;
    KCentroCusto      : string ;
    ClassificacaoCC   : string ;
    KPlanoContas      : string ;
    Classificacao     : string ;
    FDataModule       : TDataModule ;
    KCAD_FORNECEDOR   : string ;
  end ;

  TReportParamsFIN_DespesasReceitas = class ( TReportParams )
  type
    TTipoCentroCustoDespesa = ( ccdAll, ccdEmpty, ccdSpecific ) ;
  public
    Despesas : boolean ;
    Receitas : boolean ;
    RatearCentroCusto : boolean ;
    TipoCentroCusto   : TTipoCentroCustoDespesa ;
    KCentroCusto      : string ;
    ClassificacaoCC   : string ;
    KPlanoContas      : string ;
    Classificacao     : string ;
    FDataModule       : TDataModule ;
    KCAD_FORNECEDOR   : string ;
    KCAD_CLIENTE   : string ;
  end ;

  TReportParamsEST_Entradas = class ( TReportParams )
  type
    TTipoGrupoProduto = ( gpedAll, gpeEmpty, gpeSpecific ) ;
    TTipoProduto      = ( pedAll, peEmpty, peSpecific ) ;
  public
    TipoGrupoProduto   : TTipoGrupoProduto ;
    KGrupoProduto      : string ;
    TipoProduto   : TTipoProduto ;
    KProduto      : string ;
    FDataModule       : TDataModule ;
  end ;


  TReportParamsEST_Depreciacoes = class ( TReportParams )
  type
    TTipoCentroCustoDepreciacoes = ( ccdAll, ccdEmpty, ccdSpecific ) ;
  public
    //RatearCentroCusto : boolean ;
    FDataModule       : TDataModule ;
    TipoCentroCusto   : TTipoCentroCustoDepreciacoes ;
    KCentroCusto : string ;
  end ;

  TReportParamsFIN_Cheques = class ( TReportParams )
    FDataModule       : TDataModule ;
  end ;

(*
  TReportParamsFIN_OutrasReceitas = class ( TReportParams )
    ExibirQuitados    : boolean ;
    ExibirDuvidosos   : Boolean ;
    ExibirAtrasadas   : Boolean ;
    TodasContas       : Boolean;
    KFIN_PLANOCONTA   : string ;
    TodosCentros      : Boolean ;
    KFIN_CENTROCUSTO  : string ;
    FDataModule       : TDataModule ;
  end ;
*)
  TReportParamsFIN_Receitas = class ( TReportParams )
  type
    TTipoCentroCustoReceita = ( ccrAll, ccrEmpty, ccrSpecific ) ;
  public
    RatearCentroCusto : boolean ;
    TipoCentroCusto   : TTipoCentroCustoReceita ;
    KCentroCusto      : string ;
    ClassificacaoCC   : string ;
    KPlanoContas      : string ;
    Classificacao     : string ;
    FDataModule       : TDataModule ;
    KCAD_CLIENTE      : string ;
  end ;


  TReportParamsEST_Saidas = class ( TReportParams )
  type
    TTipoGrupoProduto   = ( gpsdAll, gpsEmpty, gpsSpecific ) ;
    TTipoProduto        = ( psdAll, psEmpty, psSpecific ) ;
    TTipoCentroCusto    = ( ccdAll, ccsEmpty, ccsSpecific ) ;
    TTipoContaContabil  = ( ccdAll, ccsEmpty, ccsSpecific ) ;
  public
    TipoGrupoProduto      : TTipoGrupoProduto ;
    KGrupoProduto         : string ;
    TipoProduto           : TTipoProduto ;
    KProduto              : string ;
    TipoCentroCusto       : TTipoCentroCusto;
    KCentroCusto          : string;
    ClassificacaoCC       : string;
    TipoContaContabil     : TTipoContaContabil;
    KContaContabil        : string;
    ClassificacaoContabil : string;
    FDataModule           : TDataModule ;
  end ;

  TReportParamsFIN_AReceber = class ( TReportParams )
    ExibirQuitados : boolean ;
    KFIN_ARECEBER  : string ;
    KCAD_ENTIDADE  : string ;
    FTODOS         : Boolean;
    Ordem          : string ;
    Filtro         : string ;
    FDataModule    : TDataModule;
  end ;

  TReportParamsEntidades = class ( TReportParams )
    KCAD_ENTIDADE  : string ;
    IS_CLIENTE     : string ;
    IS_FORENECEDOR : string ;
    ATIVO          : string ;
    POR_GRUPO      : string ;
    GRUPO          : string ;
  end ;

  TReportParamsProdutos = class ( TReportParams )
    KSYS_DOMAIN   : string ;
    IS_PRODUTO   : string ;
    IS_INSUMO    : string ;
    IS_SERVICO   : string ;
    ATIVO        : string ;
    POR_TIPO     : string ;
    TIPO         : string ;
    DATAINI      : TDateTime;
    DATAFIM      : TDateTime;
  end ;

  TReportParamsBalancoProdutos = class ( TReportParams )
    KSYS_DOMAIN   : string ;
    TipoTodosGrupoProduto : integer ;
    ProdutoInsumo    : integer ;
    DataInicial      : TDateTime;
    DataFinal        : TDateTime;
    KGrupo           : string ;
    KProduto         : string ;
  end ;

  TReportParamsContasBancarias = class ( TReportParams )
    KSYS_DOMAIN : string ;
    FContas      : TContasBancarias ;
    FDataModule  : TDataModule;
  end ;

  TReportParamsPatrimonio = class ( TReportParams )
    KSYS_DOMAIN    : string ;
    KCAD_PATRIMONIO : string ;
    ATIVO           : string ;
  end ;

  TReportParamsPlanoContas = class ( TReportParams )
    KSYS_DOMAIN : string ;
    PLANO        : string ;
  end ;

  TReportParamsCentroCustos = class ( TReportParams )
    KSYS_DOMAIN   : string ;
    CENTRO       : string ;
  end ;

  TReportParamsCOMPRAS_Periodo = class ( TReportParams )
    TODOS_ENTIDADE    : Boolean ;
    KCAD_ENTIDADE     : string ;
    TodasContas       : Boolean;
    KFIN_PLANOCONTA   : string ;
    TodosCentros      : Boolean ;
    KFIN_CENTROCUSTO  : string ;
    ComNota           : Boolean ;
  end ;

  TReportParamsVENDAS_Periodo = class ( TReportParams )
    TODOS_ENTIDADE    : Boolean ;
    KCAD_ENTIDADE     : string ;
    TodasContas       : Boolean ;
    KFIN_PLANOCONTA   : string ;
    TodosCentros      : Boolean ;
    KFIN_CENTROCUSTO  : string ;
  end ;

  TReportParamsFluxoCaixa = class ( TReportParams )
    FDataModule    : TDataModule ;
    TotalAReceber  : Double ;
    TotalAPagar    : Double ;
    SaldoContas    : Double ;
  end;

  TReportParamsMemoList = class ( TReportParams )
    StringList : TStrings ;
  end ;

  TReportDiarioMastite = class ( TReportParams )
    PorFuncionario : boolean ;
    SourceClientDataSet : TClientDataSet ;
  end ;

  TReportBOFemea = class ( TReportParams )
    KZOO_ANIMAL_FEMEA : string ;
  end ;

implementation

{ TReportParams }

{ TReportParamsMemoList }

end.

