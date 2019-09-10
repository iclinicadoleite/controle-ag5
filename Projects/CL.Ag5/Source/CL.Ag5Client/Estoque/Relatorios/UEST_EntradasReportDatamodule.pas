unit UEST_EntradasReportDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr,
  Datasnap.Provider, ReportTypes, Tc.Data.SQLExpr ;

type
  TEST_EntradasReportDatamodule = class(T_dtmBASE)
    cdsEntradas: TClientDataSet;
    dspEntradas: TDataSetProvider;
    sqlEntradas: TTcSQLDataSet;
    sqlEntradasDOCUMENTO: TStringField;
    sqlEntradasDATALANCTO: TSQLTimeStampField;
    sqlEntradasHISTORICO: TStringField;
    sqlEntradasCONTACONTABIL: TStringField;
    sqlEntradasCENTROCUSTO: TStringField;
    sqlEntradasPORCENTAGEM: TFloatField;
    sqlEntradasVALOR: TFloatField;
    cdsEntradasDOCUMENTO: TStringField;
    cdsEntradasDATALANCTO: TSQLTimeStampField;
    cdsEntradasHISTORICO: TStringField;
    cdsEntradasCONTACONTABIL: TStringField;
    cdsEntradasCENTROCUSTO: TStringField;
    cdsEntradasPORCENTAGEM: TFloatField;
    cdsEntradasVALOR: TFloatField;
    sqlEntradasQTDE: TFloatField;
    cdsEntradasQTDE: TFloatField;
  private
    { Private declarations }
    FParams : ReportTypes.TReportParamsEST_Entradas ;
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables; override ;
    procedure SetReportParams ( AParams : ReportTypes.TReportParamsEST_Entradas ) ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;


implementation

uses Exceptions, UDBFinanceiro, DateUtils, SqlTimSt
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;

{$R *.dfm}




{ TrdmEST_EntradasReportDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TEST_EntradasReportDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


{ TEST_EntradasReportDatamodule }

procedure TEST_EntradasReportDatamodule.OpenTables;
begin
  SetParams ;
  inherited;
end;

procedure TEST_EntradasReportDatamodule.SetParams;
begin

  with cdsEntradas.Params do
    begin
      ParamByName( 'KSYS$DOMAIN' ).AsString   := LoggedUser.DomainID ;
      ParamByName( 'DI' ).asSQLTimeStamp      := DateTimeToSQLTimeStamp ( StartOfTheDay (  FParams.StartDate ) ) ;
      ParamByName( 'DF' ).asSQLTimeStamp      := DateTimeToSQLTimeStamp ( EndOfTheDay (  FParams.EndDate ) ) ;
      ParamByName( 'TIPOGRUPO' ).asInteger    := Ord ( FParams.TipoGrupoProduto ) ;
      ParamByName( 'KGRUPO' ).asString        := FParams.KGrupoProduto ;
      ParamByName( 'TIPOPRODUTO' ).asInteger  := Ord ( FParams.TipoProduto ) ;
      ParamByName( 'KPRODUTO' ).asString      := FParams.KProduto ;
    end;

  TCdsSuppl.Open( cdsEntradas) ;
end;

procedure TEST_EntradasReportDatamodule.SetReportParams(
  AParams: ReportTypes.TReportParamsEST_Entradas);
begin
   FParams := AParams
end;


end.
