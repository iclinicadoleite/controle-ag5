unit UFIN.DRE.Data;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr,
  Datasnap.Provider, ReportTypes, Generics.Collections, UFIN.DRE.Common, Tc.Data.SQLExpr ;

type

  TdtmFIN_DRE = class(T_dtmBASE)
    cdsDRE_Caixa: TClientDataSet;
    dspDRE_Caixa: TDataSetProvider;
    sqlDRE_Caixa: TTcSQLDataSet;
    sqlDRE_CaixaKFIN_PLANOCONTA: TStringField;
    sqlDRE_CaixaMES: TSQLTimeStampField;
    sqlDRE_CaixaDEBITO_CREDITO: TStringField;
    sqlDRE_CaixaVALOR: TFloatField;
    cdsDRE_CaixaKFIN_PLANOCONTA: TStringField;
    cdsDRE_CaixaMES: TSQLTimeStampField;
    cdsDRE_CaixaDEBITO_CREDITO: TStringField;
    cdsDRE_CaixaVALOR: TFloatField;
    cdsDRE_Competencia: TClientDataSet;
    dspDRE_Competencia: TDataSetProvider;
    sqlDRE_Competencia: TTcSQLDataSet;
    sqlDRE_CompetenciaKFIN_PLANOCONTA: TStringField;
    sqlDRE_CompetenciaMES: TSQLTimeStampField;
    sqlDRE_CompetenciaDEBITO_CREDITO: TStringField;
    sqlDRE_CompetenciaVALOR: TFloatField;
    cdsDRE_CompetenciaKFIN_PLANOCONTA: TStringField;
    cdsDRE_CompetenciaMES: TSQLTimeStampField;
    cdsDRE_CompetenciaDEBITO_CREDITO: TStringField;
    cdsDRE_CompetenciaVALOR: TFloatField;
    cdsTiposProduto: TClientDataSet;
    cdsTiposProdutoKCAD_TIPOS: TStringField;
    cdsTiposProdutoDESCRICAO: TStringField;
    cdsDRE_CaixaKEST_GRUPOPRODUTO: TStringField;
    sqlDRE_CaixaKEST_GRUPOPRODUTO: TStringField;
  private
    { Private declarations }
    FParams : ReportTypes.TReportParamsFIN_DRE ;
    FSubTitleContas : string ;
    FPlanoContas : TClientDataSet ;
    FInitialMonth : integer ;
    procedure SetParamsCaixa ;
    procedure SetParamsCompetencia ;
    function MonthIndex( ADateTime : TDateTime ) : integer ; inline ;
    procedure GetCaixa( AProcAddToTreeView: TProcAddToTreeView ) ;
    procedure GetCompetencia( AProcAddToTreeView: TProcAddToTreeView ) ;
    procedure GetDepreciacoes( AProcAddToTreeView: TProcAddToTreeView ) ;
  public
    FLog : TStringList ;

    function GetDescricaoGrupo( const LKey : string ; var ADescricaoGrupo: string): boolean;

    property  Params : ReportTypes.TReportParamsFIN_DRE read FParams ;
    procedure GetPlanoContas ;
    procedure AddPlanos ( const AClassificacao : string ; const AExclude : TArray<string> ; ALoaderProc : TPlanoContasLoader ; AUseFirstNode : boolean  );
    property SubTitleContas : string read FSubTitleContas ;
    procedure OpenTables; override ;
    procedure SetReportParams ( AParams : ReportTypes.TReportParamsFIN_DRE ) ;
    procedure GetGruposProdutos(CDS: TClientDataSet; Tipo: Integer);
    procedure ProcessCaixa( const AProcAddToTreeView: TProcAddToTreeView ) ;
    procedure ProcessCompetencia( const AProcAddToTreeView: TProcAddToTreeView ) ;
    constructor Create ( AOwner : TComponent ) ;override ;
 end;

implementation

uses   Exceptions
     , UDBFinanceiro
     , DateUtils
     , SqlTimSt
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
     , UFIN_PlanoContasReceitasDespesasClass
     , CLAg5SvcEstoqueCadastroTipos
      ;

{$R *.dfm}


{ TrdmFIN_DRE }

{$IFDEF _DSServer}
{$ELSE}

{ TdtmFIN_DRE }

constructor TdtmFIN_DRE.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;

  FLog := TStringList.Create ;

  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;

{$ENDIF}

{ TdtmFIN_DRE }

procedure TdtmFIN_DRE.GetGruposProdutos(CDS: TClientDataSet; Tipo: Integer);
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


procedure TdtmFIN_DRE.ProcessCaixa( const AProcAddToTreeView: TProcAddToTreeView ) ;
begin
  GetGruposProdutos( cdsTiposProduto, CLAg5SvcEstoqueCadastroTipos._TIPO_PRODUTO );
  SetParamsCaixa ;
  TCdsSuppl.Open( cdsDRE_CAIXA ) ;
  GetCaixa ( AProcAddToTreeView ) ;
//  GetLitrosLeiteCaixa ( AProcAddToTreeView ) ;
end;

procedure TdtmFIN_DRE.ProcessCompetencia( const AProcAddToTreeView: TProcAddToTreeView ) ;
begin
  SetParamsCompetencia ;
  TCdsSuppl.Open( cdsDRE_COMPETENCIA ) ;
  GetCompetencia ( AProcAddToTreeView ) ;
  GetDepreciacoes( AProcAddToTreeView ) ;
//  GetLitrosLeiteCompetencia ( AProcAddToTreeView ) ;
end;



procedure TdtmFIN_DRE.GetPlanoContas;
const
(*
    _PLANO_CONTAS =
           'SELECT KFIN_PLANOCONTA, CLASSIFICACAO, ANALITICO_SINTETICO, NOME FROM'
    +#13#10'('
    +#13#10'WITH RECURSIVE PLM'
    +#13#10'AS ('
    +#13#10' SELECT'
    +#13#10'  KFIN_PLANOCONTA, TIPO_PLANOCONTAS, CODIGO, NOME, KMFIN_PLANOCONTA,'
    +#13#10'  ANALITICO_SINTETICO, DEVEDORA_CREDORA, FLUXOCAIXA,'
    +#13#10'  TIPO_APRD, FIXA_VARIAVEL, MOVIMENTA_ESTOQUE, CLASSIFICACAO, ATIVO, SYS$DU'
    +#13#10' FROM FIN_PLANOCONTAS'
    +#13#10' WHERE KMFIN_PLANOCONTA IS NULL'
    +#13#10'  AND TIPO_PLANOCONTAS = -3'
    +#13#10' UNION ALL'
    +#13#10' SELECT'
    +#13#10'  KFIN_PLANOCONTA, TIPO_PLANOCONTAS, CODIGO, NOME, KMFIN_PLANOCONTA,'
    +#13#10'  ANALITICO_SINTETICO, DEVEDORA_CREDORA, FLUXOCAIXA,'
    +#13#10'  TIPO_APRD, FIXA_VARIAVEL, MOVIMENTA_ESTOQUE, CLASSIFICACAO, ATIVO, SYS$DU'
    +#13#10' FROM FIN_PLANOCONTAS PL'
    +#13#10' JOIN PLM ON PLM.KFIN_PLANOCONTA = PL.KMFIN_PLANOCONTA'
    +#13#10' WHERE'
    +#13#10'     TIPO_PLANOCONTAS = -3'
    +#13#10')'
    +#13#10'SELECT'
    +#13#10' KFIN_PLANOCONTA, TIPO_PLANOCONTAS, CODIGO, NOME, KMFIN_PLANOCONTA,'
    +#13#10' ANALITICO_SINTETICO, DEVEDORA_CREDORA, FLUXOCAIXA,'
    +#13#10' TIPO_APRD, FIXA_VARIAVEL, MOVIMENTA_ESTOQUE, CLASSIFICACAO, ATIVO, SYS$DU'
    +#13#10'FROM PLM'
    +#13#10'ORDER BY (SELECT * FROM ORDER_CLASSIFICACAO(CLASSIFICACAO))'
    +#13#10')' ;

*)

    _PLANO_CONTAS =
           'SELECT'
    +#13#10' KFIN_PLANOCONTA, TIPO_PLANOCONTAS, CODIGO, NOME, KMFIN_PLANOCONTA,'
    +#13#10' ANALITICO_SINTETICO, DEVEDORA_CREDORA, FLUXOCAIXA,'
    +#13#10' TIPO_APRD, FIXA_VARIAVEL, MOVIMENTA_ESTOQUE, CLASSIFICACAO, ATIVO, SYS$DU'
    +#13#10'FROM FIN_PLANOCONTAS'
    +#13#10'WHERE '
    +#13#10'  TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )'
    +#13#10'ORDER BY (SELECT * FROM ORDER_CLASSIFICACAO(CLASSIFICACAO))' ;

begin
   if Assigned( FPlanoContas ) then
     FreeAndNil ( FPlanoContas ) ;
   TTcAbstractDB.GetByAlias('FINANCEIRO')
     .populateClientDataSet( FPlanoContas, _PLANO_CONTAS );
end;

function TdtmFIN_DRE.GetDescricaoGrupo( const LKey : string ; var ADescricaoGrupo: string): boolean;
begin
  Result := ( LKey <> '' ) and cdsTiposProduto.Locate(  'KCAD_TIPOS',  LKey, [] ) ;
  if Result then
     ADescricaoGrupo := cdsTiposProdutoDESCRICAO.AsString
end;


procedure TdtmFIN_DRE.GetCaixa(AProcAddToTreeView: TProcAddToTreeView);
begin

  cdsDRE_Caixa
    .First
    .Iterate (
       procedure ( const ADataSet : TDataSet ; var AContinue : boolean )
       var
        Data : TDataInfo ;
       begin

          Data.KeyPlano          := cdsDRE_CaixaKFIN_PLANOCONTA.asString  ;
          Data.KeyGrupoProduto   := cdsDRE_CaixaKEST_GRUPOPRODUTO.asString  ;
          Data.Estoque           := cdsDRE_CaixaKFIN_PLANOCONTA.asString  = TPlanoContasDespesasReceitas.GetKeyEstoque ;
          Data.Mes               := MonthIndex( cdsDRE_CaixaMES.asDateTime ) ;
          Data.DebitoCredito     := cdsDRE_CaixaDEBITO_CREDITO.asString ;
          Data.Valor             := cdsDRE_CaixaVALOR.asFloat ;

          AProcAddToTreeView( @Data ) ;
       end
    ) ;

end;

procedure TdtmFIN_DRE.GetCompetencia(
  AProcAddToTreeView: TProcAddToTreeView );
begin

  cdsDRE_Competencia
    .First
    .Iterate (
       procedure ( const ADataSet : TDataSet ; var AContinue : boolean )
       var
        Data : TDataInfo ;
       begin

          Data.KeyPlano          := cdsDRE_CompetenciaKFIN_PLANOCONTA.asString  ;
          Data.KeyGrupoProduto   := ''  ;
          Data.Estoque           := False ;
          Data.Mes               := MonthIndex( cdsDRE_CompetenciaMES.asDateTime ) ;
          Data.DebitoCredito     := cdsDRE_CompetenciaDEBITO_CREDITO.asString ;
          Data.Valor             := cdsDRE_CompetenciaVALOR.asFloat ;

          AProcAddToTreeView( @Data ) ;
       end
    ) ;

end;

procedure TdtmFIN_DRE.GetDepreciacoes( AProcAddToTreeView: TProcAddToTreeView );
const
    _SELECT_DEPRECIACOES =
         'SELECT'
  +#13#10'   DATA - EXTRACT( DAY FROM DATA  ) + 1 MES'
  +#13#10' , SUM ( VALOR ) VALOR'
  +#13#10' FROM'
  +#13#10'(SELECT'
  +#13#10'  DATEADD ( MONTH,  -(CAST( ST.SYS$VALUE AS INTEGER )), D.DATA ) DATA,'
  +#13#10'  COALESCE( (( AP.PORCENTAGEM * D.VALOR / 12 )/100 ), D.VALOR / 12 ) VALOR'
  +#13#10'FROM CAD_PATRIMONIOS P'
  +#13#10'LEFT JOIN CAD_PATRIMONIO_DEPRECIACOES  D ON D.KCAD_PATRIMONIO  = P.KCAD_PATRIMONIO'
  +#13#10'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = P.KFIN_PLANOCONTA'
  +#13#10'LEFT JOIN FIN_APROPRIACAO  AP ON AP.TABLENAME = ''CAD_PATRIMONIOS'' AND AP.TABLEKEY = P.KCAD_PATRIMONIO'
  +#13#10'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_CENTROCUSTO'
  +#13#10'LEFT JOIN SYS$TYPES ST ON ST.SYS$TYPE = ''MONTH'''
  +#13#10'WHERE ( P.KSYS$DOMAIN = :KSYS$DOMAIN AND P.ATIVO = ''T'')'
  +#13#10'  AND (        (  :TIPOCC = 0 )'
  +#13#10'            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS NULL ) )'
  +#13#10'            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = :CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
  +#13#10'         )'
  +#13#10')'
  +#13#10'WHERE ( DATA BETWEEN :DI AND :DF )'
  +#13#10'GROUP BY 1'
  +#13#10'ORDER BY 1' ;
begin
    TTcAbstractDB
       .GetByAlias( 'FINANCEIRO' )
       .ISQL( _SELECT_DEPRECIACOES )
       .SQLParamValues( 'KSYS$DOMAIN',     LoggedUser.DomainID )
       .SQLParamValues( 'DI',              FParams.StartDate  ) //DateTimeToSQLTimeStamp (
       .SQLParamValues( 'DF',              FParams.EndDate    ) //DateTimeToSQLTimeStamp (
       .SQLParamValues( 'TIPOCC',          Integer(Ord ( FParams.TipoCentroCusto )) )
       .SQLParamValues( 'CC',              FParams.KCentroCusto  )
       .SQLParamValues( 'CLASSIFICACAOCC', FParams.ClassificacaoCC  + '.%'  )
       .GetDS
       .Iterate(
          procedure ( const ADataSet : TDataSet ; var AContinue : boolean )
          var
            Data : TDataInfo ;
          begin

            Data.KeyPlano          := TPlanoContasDespesasReceitas.GetKeyDepreciacao ;  //  '3ns@vOQ\)eP!`UDVI#n}'
            Data.KeyGrupoProduto   := ''  ;
            Data.Estoque           := False ;
            Data.Mes               := MonthIndex( ADataSet.FieldByName (  'MES'  ).asDateTime ) ;
            Data.DebitoCredito     := 'D' ;
            Data.Valor             := ADataSet.FieldByName (  'VALOR' ).asFloat ;

            AProcAddToTreeView( @Data ) ;
          end
       ) ;
end;

function TdtmFIN_DRE.MonthIndex(ADateTime: TDateTime): integer;
var
  LYear, LMonth, LDay: Word;
begin
   DecodeDate( ADateTime, LYear, LMonth, LDay);

   Result := ( LYear * 12 + LMonth )
           - FInitialMonth
           + 1 ;

end;

procedure TdtmFIN_DRE.OpenTables;
begin
///  inherited;
end;

procedure TdtmFIN_DRE.SetParamsCaixa;
const
  _BOOL : array[boolean] of string = ( 'F', 'T' ) ;
begin


  with cdsDRE_Caixa.Params do
    begin
      ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID ;
      ParamByName( 'DI' ).asSQLTimeStamp     := DateTimeToSQLTimeStamp ( FParams.StartDate ) ;
      ParamByName( 'DF' ).asSQLTimeStamp     := DateTimeToSQLTimeStamp ( FParams.EndDate   ) ;

      ParamByName( 'KFIN_PLANOCONTA_LEITE' ).asString := TPlanoContasDespesasReceitas.GetKeyLeite ;

      ParamByName ( 'PROVISAO'     ).AsString  := _BOOL[ FParams.Provisao ] ;
      ParamByName ( 'PROGRAMACAO'  ).AsString  := _BOOL[ FParams.Programacao ] ;


      ParamByName( 'USE_APROPRIACAO' ).asString  := 'T' ;
      ParamByName( 'TIPOCC' ).asInteger      := Ord ( FParams.TipoCentroCusto ) ;

      if ParamByName( 'TIPOCC' ).asInteger in [ 0,1 ] then
        begin
         ParamByName( 'CC' ).Bound              := False ;
         ParamByName( 'CLASSIFICACAOCC' ).Bound := False ;
        end
      else
        begin
         ParamByName( 'CC' ).asString              := FParams.KCentroCusto  ;
         ParamByName( 'CLASSIFICACAOCC' ).asString := FParams.ClassificacaoCC  + '.%' ;
        end;


//      ParamByName( 'PLANOCONTA_IMPOSTOS_TAXAS'      ).asString := TPlanoContasDespesasReceitas.GetKeyImpostosTaxas ;
      ParamByName( 'PLANOCONTA_DESPESAS'            ).asString := TPlanoContasDespesasReceitas.GetKeyDespesas ;
      ParamByName( 'PLANOCONTA_JUROS_FINANCIAMENTO' ).asString := TPlanoContasDespesasReceitas.GetKeyJurosFinanciamentos ;
      ParamByName( 'PLANOCONTA_FINANCIAMENTO'       ).asString := TPlanoContasDespesasReceitas.GetKeyFinanciamentos ;
      ParamByName( 'PLANOCONTA_RECEITAS'            ).asString := TPlanoContasDespesasReceitas.GetKeyReceitas ;


    end;

end;

procedure TdtmFIN_DRE.SetParamsCompetencia;
const
  _BOOL : array[boolean] of string = ( 'F', 'T' ) ;
begin


  with cdsDRE_Competencia.Params do
    begin
      ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID ;
      ParamByName( 'DI' ).asSQLTimeStamp     := DateTimeToSQLTimeStamp ( FParams.StartDate ) ;
      ParamByName( 'DF' ).asSQLTimeStamp     := DateTimeToSQLTimeStamp ( FParams.EndDate   ) ;

      ParamByName( 'KFIN_PLANOCONTA_LEITE' ).asString := TPlanoContasDespesasReceitas.GetKeyLeite ;

      ParamByName ( 'PROVISAO'     ).AsString  := _BOOL[ FParams.Provisao ] ;
//      ParamByName ( 'PROGRAMACAO'  ).AsString  := _BOOL[ FParams.Programacao ] ;


      ParamByName( 'USE_APROPRIACAO' ).asString  := 'T' ;
      ParamByName( 'TIPOCC' ).asInteger      := Ord ( FParams.TipoCentroCusto ) ;

      if ParamByName( 'TIPOCC' ).asInteger in [ 0,1 ] then
        begin
         ParamByName( 'CC' ).Bound              := False ;
         ParamByName( 'CLASSIFICACAOCC' ).Bound := False ;
        end
      else
        begin
         ParamByName( 'CC' ).asString              := FParams.KCentroCusto  ;
         ParamByName( 'CLASSIFICACAOCC' ).asString := FParams.ClassificacaoCC  + '.%' ;
        end;

//CAST ( :PLANOCONTA_IMPOSTOS_TAXAS AS SYS$FKGUID20 )

      ParamByName( 'PLANOCONTA_IMPOSTOS_TAXAS'      ).asString := TPlanoContasDespesasReceitas.GetKeyImpostosTaxas ;
      ParamByName( 'PLANOCONTA_DESPESAS'            ).asString := TPlanoContasDespesasReceitas.GetKeyDespesas ;
      ParamByName( 'PLANOCONTA_JUROS_FINANCIAMENTO' ).asString := TPlanoContasDespesasReceitas.GetKeyJurosFinanciamentos ;
      ParamByName( 'PLANOCONTA_FINANCIAMENTO'       ).asString := TPlanoContasDespesasReceitas.GetKeyFinanciamentos ;
      ParamByName( 'PLANOCONTA_RECEITAS'            ).asString := TPlanoContasDespesasReceitas.GetKeyReceitas ;


    end;

end;

procedure TdtmFIN_DRE.SetReportParams(
  AParams: ReportTypes.TReportParamsFIN_DRE);
begin
   FParams := AParams ;

   FParams.StartDate := StartOfTheMonth( FParams.StartDate ) ;
   FParams.EndDate   := EndOfTheDay( EndOfTheMonth( FParams.EndDate ) ) ;
   FInitialMonth     := YearOf( FParams.StartDate ) * 12 + MonthOf( FParams.StartDate ) ;

end;



procedure TdtmFIN_DRE.AddPlanos( const AClassificacao : string ; const AExclude : TArray<string> ; ALoaderProc : TPlanoContasLoader ; AUseFirstNode : boolean  );
var
 nodeLevel : integer ;

 function IsExcluded() : boolean ;
 begin
   Result := False ;
   for var LExclude in AExclude do
     if FPlanoContas.FieldByName('CLASSIFICACAO').asString.StartsWith ( LExclude ) then
        Exit ( True ) ;
 end;

begin
//  CLASSIFICACAO, ANALITICO_SINTETICO, NOME ****

  if not FPlanoContas.Locate( 'CLASSIFICACAO', AClassificacao, [] ) then
    exit ;

  nodeLevel := FPlanoContas.FieldByName('CLASSIFICACAO').asString.CountChar('.') ;

  if FPlanoContas.FieldByName('ANALITICO_SINTETICO').asString = 'S' then
//  if not AUseFirstNode then
    begin
      FPlanoContas.Next ;
      Inc( nodeLevel )
    end;

  with FPlanoContas do
     while ( not eof ) and ( FieldByName('CLASSIFICACAO').asString.StartsWith ( AClassificacao ) ) do
       begin
        if not IsExcluded() then
          ALoaderProc(
              FieldByName('KFIN_PLANOCONTA').asString
            , FieldByName('NOME').asString
            , FieldByName('ANALITICO_SINTETICO').asString = 'S'
            , FieldByName('CLASSIFICACAO').asString.CountChar('.') - nodeLevel
          ) ;
        next ;
       end;
end;

end.

