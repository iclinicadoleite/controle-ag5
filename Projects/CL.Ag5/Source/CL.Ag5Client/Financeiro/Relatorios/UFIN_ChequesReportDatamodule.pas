unit UFIN_ChequesReportDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr,
  Datasnap.Provider, ReportTypes, Tc.Data.SQLExpr ;

type
  TFIN_ChequesReportDatamodule = class(T_dtmBASE)
    cdsCheques: TClientDataSet;
    dspCheques: TDataSetProvider;
    sqlCheques: TTcSQLDataSet;
    sqlChequesORIGEM: TIntegerField;
    sqlChequesNOMECONTA: TStringField;
    sqlChequesBANCO: TStringField;
    sqlChequesAGENCIA: TStringField;
    sqlChequesCONTA_CORRENTE: TStringField;
    sqlChequesVENCTO: TSQLTimeStampField;
    sqlChequesPAGTO: TSQLTimeStampField;
    sqlChequesHISTORICO: TStringField;
    sqlChequesDOCUMENTO: TStringField;
    sqlChequesCHEQUE: TStringField;
    sqlChequesVALOR: TFloatField;
    sqlChequesDT_COMPENSACAO: TSQLTimeStampField;
    sqlChequesOBS: TMemoField;
    cdsChequesORIGEM: TIntegerField;
    cdsChequesNOMECONTA: TStringField;
    cdsChequesBANCO: TStringField;
    cdsChequesAGENCIA: TStringField;
    cdsChequesCONTA_CORRENTE: TStringField;
    cdsChequesVENCTO: TSQLTimeStampField;
    cdsChequesPAGTO: TSQLTimeStampField;
    cdsChequesHISTORICO: TStringField;
    cdsChequesDOCUMENTO: TStringField;
    cdsChequesCHEQUE: TStringField;
    cdsChequesVALOR: TFloatField;
    cdsChequesDT_COMPENSACAO: TSQLTimeStampField;
    cdsChequesOBS: TMemoField;
  private
    { Private declarations }
    FParams : ReportTypes.TReportParamsFIN_Cheques ;
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables; override ;
    procedure SetReportParams ( AParams : ReportTypes.TReportParamsFIN_Cheques ) ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;


implementation

uses Exceptions, UDBFinanceiro, DateUtils, SqlTimSt
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;

{$R *.dfm}

{ TrdmFIN_ChequesReportDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFIN_ChequesReportDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


{ TFIN_ChequesReportDatamodule }

procedure TFIN_ChequesReportDatamodule.OpenTables;
begin
  SetParams ;
  inherited;
end;

procedure TFIN_ChequesReportDatamodule.SetParams;
begin
  with cdsCheques.Params do
    begin
      ParamByName( 'KSYS$DOMAIN' ).AsString     := LoggedUser.DomainID ;
      ParamByName( 'DI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  FParams.StartDate ) ) ;
      ParamByName( 'DF' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay (  FParams.EndDate ) ) ;
      ParamByName( 'COMPENSADO' ).asString := 'T' ;
    end;

  TCdsSuppl.Open( cdsCheques) ;
end;

procedure TFIN_ChequesReportDatamodule.SetReportParams(
  AParams: ReportTypes.TReportParamsFIN_Cheques);
begin
   FParams := AParams
end;

end.
