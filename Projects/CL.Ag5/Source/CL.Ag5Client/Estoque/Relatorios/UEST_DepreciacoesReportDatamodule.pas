unit UEST_DepreciacoesReportDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr,
  Datasnap.Provider, ReportTypes, Tc.Data.SQLExpr ;

type
  TEST_DepreciacoesReportDatamodule = class(T_dtmBASE)
    cdsDepreciacoes: TClientDataSet;
    dspDepreciacoes: TDataSetProvider;
    sqlDepreciacoes: TTcSQLDataSet;
    sqlDepreciacoesDOCUMENTO: TStringField;
    sqlDepreciacoesHISTORICO: TStringField;
    sqlDepreciacoesCONTACONTABIL: TStringField;
    sqlDepreciacoesCENTROCUSTO: TStringField;
    sqlDepreciacoesPORCENTAGEM: TFloatField;
    sqlDepreciacoesVALOR: TFloatField;
    cdsDepreciacoesDOCUMENTO: TStringField;
    cdsDepreciacoesHISTORICO: TStringField;
    cdsDepreciacoesCONTACONTABIL: TStringField;
    cdsDepreciacoesCENTROCUSTO: TStringField;
    cdsDepreciacoesPORCENTAGEM: TFloatField;
    cdsDepreciacoesVALOR: TFloatField;
    sqlDepreciacoesDATA_IMOBILIZADO: TSQLTimeStampField;
    sqlDepreciacoesDATA_DEPRECIACAO: TSQLTimeStampField;
    cdsDepreciacoesDATA_IMOBILIZADO: TSQLTimeStampField;
    cdsDepreciacoesDATA_DEPRECIACAO: TSQLTimeStampField;
  private

    { Private declarations }
    FParams : ReportTypes.TReportParamsEST_Depreciacoes ;
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables; override ;
    procedure SetReportParams ( AParams : ReportTypes.TReportParamsEST_Depreciacoes ) ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;


implementation

uses Exceptions, UDBFinanceiro, DateUtils, SqlTimSt
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;

{$R *.dfm}

{ TrdmEST_DepreciacoesReportDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TEST_DepreciacoesReportDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}



{ TEST_DepreciacoesReportDatamodule }

procedure TEST_DepreciacoesReportDatamodule.OpenTables;
begin
  SetParams ;
  inherited;
end;

procedure TEST_DepreciacoesReportDatamodule.SetParams;
begin
  with cdsDepreciacoes.Params do
    begin
      ParamByName( 'KSYS$DOMAIN' ).AsString     := LoggedUser.DomainID ;
      ParamByName( 'DI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  FParams.StartDate ) ) ;
      ParamByName( 'DF' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay (  FParams.EndDate ) ) ;
      ParamByName( 'TIPOCC' ).asInteger  := Ord ( FParams.TipoCentroCusto );
      ParamByName( 'CC' ).asString       := FParams.KCentroCusto  ;
    end;

  TCdsSuppl.Open( cdsDepreciacoes) ;
end;

procedure TEST_DepreciacoesReportDatamodule.SetReportParams(
  AParams: ReportTypes.TReportParamsEST_Depreciacoes);
begin
   FParams := AParams
end;

end.
