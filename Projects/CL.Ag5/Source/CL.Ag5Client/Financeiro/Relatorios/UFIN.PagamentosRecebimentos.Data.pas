unit UFIN.PagamentosRecebimentos.Data;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr,
  Datasnap.Provider, ReportTypes, Generics.Collections, Tc.Data.SQLExpr ;

type
  TContasInfoDict = TDictionary<string,string> ;
  TEntidadeInfoDict = TDictionary<string,string> ;

  TdtmFIN_PagamentosRecebimentos = class(T_dtmBASE)
    cdsPagamentosRecebimentos: TClientDataSet;
    dspPagamentosRecebimentos: TDataSetProvider;
    sqlPagamentosRecebimentos: TTcSQLDataSet;
    cdsPagamentosRecebimentosKCAD_ENTIDADE: TStringField;
    cdsPagamentosRecebimentosDOCUMENTO: TStringField;
    cdsPagamentosRecebimentosDATA: TSQLTimeStampField;
    cdsPagamentosRecebimentosHISTORICO: TStringField;
    cdsPagamentosRecebimentosCODIGO: TStringField;
    cdsPagamentosRecebimentosNOME: TStringField;
    cdsPagamentosRecebimentosCONTACONTABIL: TStringField;
    cdsPagamentosRecebimentosCENTROCUSTO: TStringField;
    cdsPagamentosRecebimentosPORCENTAGEM: TFloatField;
    cdsPagamentosRecebimentosQTDE: TFloatField;
    cdsLstContas: TClientDataSet;
    cdsLstContasKFIN_CONTA: TStringField;
    cdsLstContasKFIN_BANCO: TStringField;
    cdsLstContasSELECT: TIntegerField;
    cdsLstContasNOME: TStringField;
    cdsLstContasBANCO: TStringField;
    cdsLstContasAGENCIA: TStringField;
    cdsLstContasCONTA_CORRENTE: TStringField;
    dspLstContas: TDataSetProvider;
    sqlLstContas: TTcSQLDataSet;
    sqlLstContasKFIN_CONTA: TStringField;
    sqlLstContasKFIN_BANCO: TStringField;
    sqlLstContasNOME: TStringField;
    sqlLstContasBANCO: TStringField;
    sqlLstContasAGENCIA: TStringField;
    sqlLstContasCONTA_CORRENTE: TStringField;
    sqlPagamentosRecebimentosKCAD_ENTIDADE: TStringField;
    sqlPagamentosRecebimentosDEBITO_CREDITO: TStringField;
    sqlPagamentosRecebimentosDOCUMENTO: TStringField;
    sqlPagamentosRecebimentosDATA: TSQLTimeStampField;
    sqlPagamentosRecebimentosHISTORICO: TStringField;
    sqlPagamentosRecebimentosCODIGO: TStringField;
    sqlPagamentosRecebimentosNOME: TStringField;
    sqlPagamentosRecebimentosCONTACONTABIL: TStringField;
    sqlPagamentosRecebimentosCENTROCUSTO: TStringField;
    sqlPagamentosRecebimentosPORCENTAGEM: TFloatField;
    sqlPagamentosRecebimentosQTDE: TFloatField;
    sqlPagamentosRecebimentosCREDITO: TFloatField;
    sqlPagamentosRecebimentosDEBITO: TFloatField;
    cdsPagamentosRecebimentosDEBITO_CREDITO: TStringField;
    cdsPagamentosRecebimentosCREDITO: TFloatField;
    cdsPagamentosRecebimentosDEBITO: TFloatField;
    sqlPagamentosRecebimentosTIPO_PRODUTO: TStringField;
    cdsPagamentosRecebimentosTIPO_PRODUTO: TStringField;
    sqlPagamentosRecebimentosCPF_CNPJ: TStringField;
    cdsPagamentosRecebimentosCPF_CNPJ: TStringField;
    sqlInfoEntidade: TTcSQLDataSet;
    sqlInfoEntidadeCPF_CNPJ: TStringField;
    cdsPagamentosRecebimentosTOTAL_CREDITO: TAggregateField;
    cdsPagamentosRecebimentosTOTAL_DEBITO: TAggregateField;
    sqlPagamentosRecebimentosCONTA: TStringField;
    sqlPagamentosRecebimentosNUM_CHEQUE: TStringField;
    sqlPagamentosRecebimentosPROVISAO: TStringField;
    cdsPagamentosRecebimentosCONTA: TStringField;
    cdsPagamentosRecebimentosNUM_CHEQUE: TStringField;
    cdsPagamentosRecebimentosPROVISAO: TStringField;
    sqlInfoContas: TTcSQLDataSet;
    sqlInfoContasNOME: TStringField;
    sqlPagamentosRecebimentosNOMECONTA: TStringField;
    cdsPagamentosRecebimentosNOMECONTA: TStringField;
    sqlPagamentosRecebimentosPARCELA: TStringField;
    cdsPagamentosRecebimentosPARCELA: TStringField;
    sqlPagamentosRecebimentosDOCUMENTO_: TStringField;
    cdsPagamentosRecebimentosDOCUMENTO_: TStringField;
    procedure _dtmBASECreate(Sender: TObject);
    procedure sqlPagamentosRecebimentosBeforeOpen(DataSet: TDataSet);
    procedure sqlPagamentosRecebimentosCalcFields(DataSet: TDataSet);
    procedure _dtmBASEDestroy(Sender: TObject);
    procedure cdsPagamentosRecebimentosPROVISAOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    FParams : ReportTypes.TReportParamsFIN_PagamentosRecebimentos ;
    FSubTitleContas : string ;
    FSQL : string ;
    FEntidadeInfoDict : TEntidadeInfoDict ;
    FContasInfoDict : TContasInfoDict ;
    procedure GetContas ;
    procedure SetParams ;
  public
    { Public declarations }
    property SubTitleContas : string read FSubTitleContas ;
    procedure OpenTables; override ;
    procedure SetReportParams ( AParams : ReportTypes.TReportParamsFIN_PagamentosRecebimentos ) ;
    procedure InvertSelecaoContas;
    procedure InvertAllContas(ASelectAll: Boolean);
    constructor Create ( AOwner : TComponent ) ;override ;
 end;

implementation

uses Exceptions, UDBFinanceiro, DateUtils, SqlTimSt
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
     , UFIN_PlanoContasReceitasDespesasClass
     ;

{$R *.dfm}


{ TrdmFIN_PagamentosRecebimentos }

{$IFDEF _DSServer}
{$ELSE}


constructor TdtmFIN_PagamentosRecebimentos.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;

  FEntidadeInfoDict := TEntidadeInfoDict.Create  ;
  FContasInfoDict := TContasInfoDict.Create  ;

  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


{ TdtmFIN_PagamentosRecebimentos }


procedure TdtmFIN_PagamentosRecebimentos.OpenTables;
begin
  SetParams ;
///  inherited;
end;

procedure TdtmFIN_PagamentosRecebimentos.SetParams;
const
  _BOOL : array[boolean] of string = ( 'F', 'T' ) ;
begin
  GetContas  ;

  with cdsPagamentosRecebimentos.Params do
    begin
      ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID ;
      ParamByName( 'DI' ).asSQLTimeStamp     := DateTimeToSQLTimeStamp ( StartOfTheDay (  FParams.StartDate ) ) ;
      ParamByName( 'DF' ).asSQLTimeStamp     := DateTimeToSQLTimeStamp ( EndOfTheDay (  FParams.EndDate ) ) ;

      ParamByName ( 'DEBITOS'     ).AsString      := _BOOL[ FParams.IncluirDebitos ] ;
      ParamByName ( 'PROVISAO_DEBITO'     ).AsString  := _BOOL[ FParams.ProvisaoDebitos ] ;
      ParamByName ( 'PROGRAMACAO_DEBITO'  ).AsString  := _BOOL[ FParams.ProgramacaoDebitos ] ;
      ParamByName ( 'TODOS_FORNECEDORES'  ).AsString  := _BOOL[ FParams.KCAD_FORNECEDOR = '' ] ;
      ParamByName ( 'KCAD_FORNECEDOR'     ).AsString  := FParams.KCAD_FORNECEDOR ;


      ParamByName ( 'CREDITOS'            ).AsString  := _BOOL[ FParams.IncluirCreditos     ] ;
      ParamByName ( 'PROVISAO_CREDITO'    ).AsString  := _BOOL[ FParams.ProvisaoCreditos    ] ;
      ParamByName ( 'PROGRAMACAO_CREDITO' ).AsString  := _BOOL[ FParams.ProgramacaoCreditos ] ;
      ParamByName ( 'TODOS_CLIENTES'      ).AsString  := _BOOL[ FParams.KCAD_CLIENTE = ''] ;
      ParamByName ( 'KCAD_CLIENTE'        ).AsString  := FParams.KCAD_CLIENTE ;

      ParamByName( 'USE_APROPRIACAO' ).asString  := _BOOL[ FParams.RatearCentroCusto   ] ;
      if FParams.RatearCentroCusto then
        ParamByName( 'TIPOCC' ).asInteger      := Ord ( FParams.TipoCentroCusto )
      else
        ParamByName( 'TIPOCC' ).asInteger      := 0 ;

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

      ParamByName( 'USE_PLANOCONTAS' ).asString  := _BOOL[ FParams.RatearContaContabil ]  ;
      if (not FParams.RatearContaContabil ) or (FParams.KPlanoContas = '') then
        begin
          ParamByName( 'TIPOPC' ).asInteger      := 0 ;
          ParamByName( 'PLANOCONTA' ).Bound      := False ;
          ParamByName( 'CLASSIFICACAO' ).Bound   := False ;
        end
      else
        begin
          ParamByName( 'TIPOPC' ).asInteger       := 1 ;
          ParamByName( 'PLANOCONTA' ).asString    := FParams.KPlanoContas ;
          ParamByName( 'CLASSIFICACAO' ).asString := FParams.Classificacao + '.%' ;
        end ;

//      ParamByName( 'PLANOCONTA_IMPOSTOS_TAXAS'      ).asString := TPlanoContasDespesasReceitas.GetKeyImpostosTaxas ;
      ParamByName( 'PLANOCONTA_DESPESAS'            ).asString := TPlanoContasDespesasReceitas.GetKeyDespesas ;
      ParamByName( 'PLANOCONTA_JUROS_FINANCIAMENTO' ).asString := TPlanoContasDespesasReceitas.GetKeyJurosFinanciamentos ;
      ParamByName( 'PLANOCONTA_FINANCIAMENTO'       ).asString := TPlanoContasDespesasReceitas.GetKeyFinanciamentos ;
      ParamByName( 'PLANOCONTA_RECEITAS'            ).asString := TPlanoContasDespesasReceitas.GetKeyReceitas ;

      ParamByName ( 'TODAS_CONTAS'                  ).AsString  := _BOOL[ FParams.TodasContas   ] ;

    end;

  sqlPagamentosRecebimentosBeforeOpen( nil ) ;
  TCdsSuppl.Open( cdsPagamentosRecebimentos ) ;
end;

procedure TdtmFIN_PagamentosRecebimentos.SetReportParams(
  AParams: ReportTypes.TReportParamsFIN_PagamentosRecebimentos);
begin
   FParams := AParams
end;

procedure TdtmFIN_PagamentosRecebimentos.sqlPagamentosRecebimentosBeforeOpen(
  DataSet: TDataSet);
const

  _OR_CONTA_IN_LIST_TOKEN =
   '/*OR_CONTA_IN_LIST*/';

  _OR_CONTA_IN_LIST =
   'OR COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) IN ( %s )' ;

begin
  if FSQL = '' then
      FSQL := sqlPagamentosRecebimentos.CommandText ;

  if FParams.TodasContas then
    sqlPagamentosRecebimentos.CommandText := FSQL
  else
    sqlPagamentosRecebimentos.CommandText := StringReplace (
        FSQL
      , _OR_CONTA_IN_LIST_TOKEN
      , Format ( _OR_CONTA_IN_LIST
        , [
            FParams.Contas
          ]
       )
      , [
          rfReplaceAll
        ]
    ) ;

end;

procedure TdtmFIN_PagamentosRecebimentos.sqlPagamentosRecebimentosCalcFields(
  DataSet: TDataSet);
var
  LCPF_CNPJ : string ;
  LNomeConta : string ;
begin

  if not FEntidadeInfoDict.TryGetValue( sqlPagamentosRecebimentosKCAD_ENTIDADE.asString, LCPF_CNPJ ) then
    begin
     sqlInfoEntidade.ParamByName('KCAD_ENTIDADE').AsString := sqlPagamentosRecebimentosKCAD_ENTIDADE.asString ;
     sqlInfoEntidade.Open ;
     LCPF_CNPJ := sqlInfoEntidadeCPF_CNPJ.asString ;
     sqlInfoEntidade.Close ;
    end;
  sqlPagamentosRecebimentosCPF_CNPJ.asString := LCPF_CNPJ ;

  if not FContasInfoDict.TryGetValue( sqlPagamentosRecebimentosKCAD_ENTIDADE.asString, LCPF_CNPJ ) then
    begin
     sqlInfoContas.ParamByName('KFIN_CONTA').AsString := sqlPagamentosRecebimentosCONTA.asString ;
     sqlInfoContas.Open ;
     LNomeConta := sqlInfoContasNOME.asString ;
     sqlInfoContas.Close ;
    end;
  sqlPagamentosRecebimentosNOMECONTA.asString := LNomeConta ;

end;

procedure TdtmFIN_PagamentosRecebimentos._dtmBASECreate(Sender: TObject);
begin
  inherited;
  cdsLstContas.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID ;
  TCDSSuppl.Open (  cdsLstContas ) ;
end;

procedure TdtmFIN_PagamentosRecebimentos._dtmBASEDestroy(Sender: TObject);
begin
  FEntidadeInfoDict.Free  ;
  FContasInfoDict.Free  ;
  inherited;
end;

procedure TdtmFIN_PagamentosRecebimentos.InvertSelecaoContas;
begin
  cdsLstContas.Edit ;
  if cdsLstContasSELECT.asInteger = 0 then
    cdsLstContasSELECT.asInteger := 1
  else
    cdsLstContasSELECT.asInteger := 0 ;

  cdsLstContas.Post ;
end;

procedure TdtmFIN_PagamentosRecebimentos.InvertAllContas(ASelectAll: Boolean);
var
  checked : integer ;
begin
  if ASelectAll then
     checked := 1
  else
     checked := 0 ;

  if not cdsLstContas.active then
    exit ;

  with cdsLstContas do
    begin
      DisableControls ;
      First ;
      while not eof do
         begin
           cdsLstContas.Edit ;
           cdsLstContasSELECT.asInteger := checked ;
           cdsLstContas.Post ;
           next ;
         end;
      First ;
      EnableControls ;
    end;
end;

procedure TdtmFIN_PagamentosRecebimentos.cdsPagamentosRecebimentosPROVISAOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if Sender.AsString = '' then
     exit
   else if Sender.AsBoolean then
     Text := 'X'
   else
     Text := ' '
end;

procedure TdtmFIN_PagamentosRecebimentos.GetContas  ;
var
 LRecno : integer  ;
begin
   FParams.TodasContas := True ;
   FParams.Contas      := ''   ;
   FSubTitleContas     := ''   ;
   with cdsLstContas do
     begin
       DisableControls;
       LRecno := RecNo ;
       First;
       while not Eof do
         begin
           FParams.TodasContas := FParams.TodasContas and ( cdsLstContasSELECT.AsInteger = 1 ) ;
           if cdsLstContasSELECT.AsInteger = 1 then
             begin
              FParams.Contas  := Format ( '%s%s,', [FParams.Contas,  QuotedStr ( cdsLstContasKFIN_CONTA.AsString ) ] ) ;
              FSubTitleContas := Format ( '%s%s,', [FSubTitleContas, cdsLstContasNOME.AsString ] ) ;
             end;
           Next;
         end;
       RecNo := LRecno ;
       EnableControls;
   end;
   FParams.Contas := Copy( FParams.Contas, 1, length( FParams.Contas ) - 1 ) ;

end;

end.
