unit UFIN.DespesasReceitasRealizadas.Data ;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr,
  Datasnap.Provider, ReportTypes, Generics.Collections, Tc.Data.SQLExpr ;

type

  TEntidadeInfoDict = TDictionary<string,string> ;

  TdtmFin_DespesasReceitasRealizadas = class(T_dtmBASE)
    cdsDespesasReceitas: TClientDataSet;
    dspDespesasReceitas: TDataSetProvider;
    sqlDespesasReceitas: TTcSQLDataSet;
    sqlDespesasReceitasDOCUMENTO: TStringField;
    sqlDespesasReceitasDATALANCTO: TSQLTimeStampField;
    sqlDespesasReceitasHISTORICO: TStringField;
    sqlDespesasReceitasCONTACONTABIL: TStringField;
    sqlDespesasReceitasCENTROCUSTO: TStringField;
    sqlDespesasReceitasPORCENTAGEM: TFloatField;
    sqlDespesasReceitasDESPESA: TFloatField;
    cdsDespesasReceitasDOCUMENTO: TStringField;
    cdsDespesasReceitasDATALANCTO: TSQLTimeStampField;
    cdsDespesasReceitasHISTORICO: TStringField;
    cdsDespesasReceitasCONTACONTABIL: TStringField;
    cdsDespesasReceitasCENTROCUSTO: TStringField;
    cdsDespesasReceitasPORCENTAGEM: TFloatField;
    cdsDespesasReceitasDESPESA: TFloatField;
    sqlDespesasReceitasQTDE: TFloatField;
    cdsDespesasReceitasQTDE: TFloatField;
    cdsDespesasReceitasTOTAL_DESPESAS: TAggregateField;
    sqlDespesasReceitasCODIGO: TStringField;
    sqlDespesasReceitasNOME: TStringField;
    cdsDespesasReceitasCODIGO: TStringField;
    cdsDespesasReceitasNOME: TStringField;
    sqlInfoEntidade: TTcSQLDataSet;
    sqlInfoEntidadeCPF_CNPJ: TStringField;
    sqlDespesasReceitasKCAD_ENTIDADE: TStringField;
    cdsDespesasReceitasCPF_CNPJ: TStringField;
    sqlDespesasReceitasCPF_CNPJ: TStringField;
    sqlDespesasReceitasRECEITA: TFloatField;
    cdsDespesasReceitasRECEITA: TFloatField;
    cdsDespesasReceitasTOTAL_RECEITAS: TAggregateField;
    sqlDespesasReceitasDOCUMENTO_: TStringField;
    cdsDespesasReceitasDOCUMENTO_: TStringField;
    procedure sqlDespesasReceitasCalcFields(DataSet: TDataSet);
    procedure _dtmBASEDestroy(Sender: TObject);
  private
    { Private declarations }
    FParams : ReportTypes.TReportParamsFIN_DespesasReceitas ;
    FEntidadeInfoDict : TEntidadeInfoDict ;
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables; override ;
    procedure SetReportParams ( AParams : ReportTypes.TReportParamsFIN_DespesasReceitas ) ;
    constructor Create ( AOwner : TComponent ) ;override ;
    destructor Destroy; override;
  end;


implementation

uses Exceptions, UDBFinanceiro, DateUtils, Data.SQLTimSt, UFIN_PlanoContasReceitasDespesasClass
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
 ;

{$R *.dfm}


{ TrdmFin_DespesasReportDatamodule }

{$IFDEF _DSServer}
{$ELSE}


constructor TdtmFin_DespesasReceitasRealizadas.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;


  FEntidadeInfoDict := TEntidadeInfoDict.Create  ;

  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}

{ TdtmFin_DespesasReceitasRealizadas }

destructor TdtmFin_DespesasReceitasRealizadas.Destroy;
begin
  TCdsSuppl.PersistIndexes( cdsDespesasReceitas );
  inherited;
end;

procedure TdtmFin_DespesasReceitasRealizadas.OpenTables;
begin
  SetParams ;
/////  inherited;
end;



procedure TdtmFin_DespesasReceitasRealizadas.SetParams;
const
  _BOOL : array[boolean] of string = ( 'F', 'T' ) ;
begin

  with cdsDespesasReceitas.Params do
    begin
      ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID ;
      ParamByName( 'DI' ).asSQLTimeStamp     := DateTimeToSQLTimeStamp ( StartOfTheDay (  FParams.StartDate ) ) ;
      ParamByName( 'DF' ).asSQLTimeStamp     := DateTimeToSQLTimeStamp ( EndOfTheDay (  FParams.EndDate ) ) ;

      ParamByName ( 'DESPESAS'  ).AsString      := _BOOL[ FParams.Despesas ] ;
      ParamByName ( 'RECEITAS'  ).AsString      := _BOOL[ FParams.Receitas ] ;

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

      if FParams.KPlanoContas = '' then
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

      ParamByName( 'PLANOCONTA_IMPOSTOS_TAXAS' ).asString       := TPlanoContasDespesasReceitas.GetKeyImpostosTaxas ;
      ParamByName( 'PLANOCONTA_DESPESAS' ).asString             := TPlanoContasDespesasReceitas.GetKeyDespesas ;
      ParamByName( 'PLANOCONTA_RECEITAS' ).asString             := TPlanoContasDespesasReceitas.GetKeyReceitas ;
      ParamByName( 'PLANOCONTA_JUROS_FINANCIAMENTO' ).asString  := TPlanoContasDespesasReceitas.GetKeyJurosFinanciamentos ;
      ParamByName( 'PLANOCONTA_FINANCIAMENTO' ).asString        := TPlanoContasDespesasReceitas.GetKeyFinanciamentos ;

      if FParams.KCAD_FORNECEDOR = '' then
        begin
          ParamByName ( 'TODOS_FORNECEDORES'     ).AsString      := 'T' ;
          ParamByName ( 'KCAD_FORNECEDOR'     ).AsString         := '' ;
        end
      else
         begin
          ParamByName ( 'TODOS_FORNECEDORES'     ).AsString      := 'F' ;
          ParamByName ( 'KCAD_FORNECEDOR'     ).AsString         := FParams.KCAD_FORNECEDOR ;
         end;

      if FParams.KCAD_CLIENTE = '' then
        begin
          ParamByName ( 'TODOS_CLIENTES'     ).AsString      := 'T' ;
          ParamByName ( 'KCAD_CLIENTE'     ).AsString         := '' ;
        end
      else
         begin
          ParamByName ( 'TODOS_CLIENTES'     ).AsString      := 'F' ;
          ParamByName ( 'KCAD_CLIENTE'     ).AsString         := FParams.KCAD_CLIENTE ;
         end;


    end;

  TCdsSuppl.Open( cdsDespesasReceitas ) ;
end;

procedure TdtmFin_DespesasReceitasRealizadas.SetReportParams( AParams : ReportTypes.TReportParamsFIN_DespesasReceitas ) ;
begin
   FParams := AParams
end;

procedure TdtmFin_DespesasReceitasRealizadas.sqlDespesasReceitasCalcFields(
  DataSet: TDataSet);
var
  LCPF_CNPJ : string ;
begin

  if not FEntidadeInfoDict.TryGetValue( sqlDespesasReceitasKCAD_ENTIDADE.asString, LCPF_CNPJ ) then
    begin
     sqlInfoEntidade.ParamByName('KCAD_ENTIDADE').AsString := sqlDespesasReceitasKCAD_ENTIDADE.asString ;
     sqlInfoEntidade.Open ;
     LCPF_CNPJ := sqlInfoEntidadeCPF_CNPJ.asString ;
     sqlInfoEntidade.Close ;
    end;
  sqlDespesasReceitasCPF_CNPJ.asString := LCPF_CNPJ ;

end;

procedure TdtmFin_DespesasReceitasRealizadas._dtmBASEDestroy(Sender: TObject);
begin
  FEntidadeInfoDict.Free
end;

end.



