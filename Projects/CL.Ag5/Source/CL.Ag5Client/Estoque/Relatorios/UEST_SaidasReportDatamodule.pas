unit UEST_SaidasReportDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr,
  Datasnap.Provider, ReportTypes, Tc.Data.SQLExpr ;

type
  TEST_SaidasReportDatamodule = class(T_dtmBASE)
    cdsSaidas: TClientDataSet;
    dspSaidas: TDataSetProvider;
    sqlSaidas: TTcSQLDataSet;
    sqlSaidasDOCUMENTO: TStringField;
    sqlSaidasDATALANCTO: TSQLTimeStampField;
    sqlSaidasHISTORICO: TStringField;
    sqlSaidasCONTACONTABIL: TStringField;
    sqlSaidasCENTROCUSTO: TStringField;
    sqlSaidasPORCENTAGEM: TFloatField;
    sqlSaidasVALOR: TFloatField;
    cdsSaidasDOCUMENTO: TStringField;
    cdsSaidasDATALANCTO: TSQLTimeStampField;
    cdsSaidasHISTORICO: TStringField;
    cdsSaidasCONTACONTABIL: TStringField;
    cdsSaidasCENTROCUSTO: TStringField;
    cdsSaidasPORCENTAGEM: TFloatField;
    cdsSaidasVALOR: TFloatField;
    sqlSaidasCUSTO_MEDIO: TFloatField;
    cdsSaidasCUSTO_MEDIO: TFloatField;
    sqlSaidasQTDE: TFloatField;
    cdsSaidasQTDE: TFloatField;
  private
    { Private declarations }
    FParams : ReportTypes.TReportParamsEST_Saidas ;
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables; override ;
    procedure SetReportParams ( AParams : ReportTypes.TReportParamsEST_Saidas ) ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;


implementation

uses Exceptions, UDBFinanceiro, DateUtils, SqlTimSt
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;

{$R *.dfm}

{ TrdmEST_SaidasReportDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TEST_SaidasReportDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}

{ TEST_SaidasReportDatamodule }

procedure TEST_SaidasReportDatamodule.OpenTables;
begin
  SetParams ;
  inherited;
end;

procedure TEST_SaidasReportDatamodule.SetParams;
begin

  with cdsSaidas.Params do
    begin
      ParamByName( 'KSYS$DOMAIN' ).AsString         := LoggedUser.DomainID ;
      ParamByName( 'DI' ).asSQLTimeStamp            := DateTimeToSQLTimeStamp ( StartOfTheDay (  FParams.StartDate ) ) ;
      ParamByName( 'DF' ).asSQLTimeStamp            := DateTimeToSQLTimeStamp ( EndOfTheDay (  FParams.EndDate ) ) ;
      ParamByName( 'TIPOGRUPO' ).asInteger          := Ord ( FParams.TipoGrupoProduto ) ;
      ParamByName( 'KGRUPO' ).asString              := FParams.KGrupoProduto ;
      ParamByName( 'TIPOPRODUTO' ).asInteger        := Ord ( FParams.TipoProduto ) ;
      ParamByName( 'KPRODUTO' ).asString            := FParams.KProduto ;
      ParamByName( 'TIPOCENTROCUSTO' ).asInteger    := Ord ( FParams.TipoCentroCusto ) ;
      ParamByName( 'KCENTROCUSTO' ).asString        := FParams.KCentroCusto ;
      ParamByName( 'CLASSIFICACAO_CC' ).asString    := FParams.ClassificacaoCC + '.%' ;
      ParamByName( 'TIPOCONTACONTABIL' ).asInteger  := Ord ( FParams.TipoContaContabil ) ;
      ParamByName( 'KCONTACONTABIL' ).asString      := FParams.KContaContabil ;
      ParamByName( 'CLASSIFICACAO_PC' ).asString    := FParams.ClassificacaoContabil+ '.%' ;
    end;

  TCdsSuppl.Open( cdsSaidas ) ;
end;

procedure TEST_SaidasReportDatamodule.SetReportParams(
  AParams: ReportTypes.TReportParamsEST_Saidas);
begin
   FParams := AParams
end;


end.
