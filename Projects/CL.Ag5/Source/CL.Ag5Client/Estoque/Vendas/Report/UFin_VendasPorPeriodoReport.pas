// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Vendas por periodo
//
// License      : veja readme.txt





unit UFin_VendasPorPeriodoReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes,
  ReportTypes, UFin_VendasPorPeriodoDialog, Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsVENDAS_Periodo ; // substituir pela classe
                                                                    // de parametros do relatorio

  TSpecificReportDialog = TFin_VendasPorPeriodoDialog ;  // substituir pela classe de
                                                         // dialogo do relatorio

  TFin_VendasPorPeriodoReport = class(TfqrSYS_BaseReport)
    cdsMaster: TClientDataSet;
    dspMaster: TDataSetProvider;
    sqlMaster: TTcSQLDataSet;
    sqlMasterNOTA_FISCAL: TStringField;
    sqlMasterSERIE: TStringField;
    sqlMasterDATA_EMISSAO: TSQLTimeStampField;
    sqlMasterNOMEENTIDADE: TStringField;
    sqlMasterTOTAL_NOTA: TFloatField;
    sqlMasterNOMECONTA: TStringField;
    cdsMasterNOTA_FISCAL: TStringField;
    cdsMasterSERIE: TStringField;
    cdsMasterDATA_EMISSAO: TSQLTimeStampField;
    cdsMasterNOMEENTIDADE: TStringField;
    cdsMasterTOTAL_NOTA: TFloatField;
    cdsMasterNOMECONTA: TStringField;
    cdsMasterCPF_CNPJ: TStringField;
    sqlMasterKCAD_ENTIDADE: TStringField;
    cdsMasterKCAD_ENTIDADE: TStringField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    qrlTotal: TQRLabel;
    sqlMasterPARCELAS: TIntegerField;
    cdsMasterPARCELAS: TIntegerField;
    procedure cdsMasterCalcFields(DataSet: TDataSet);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    { Private declarations }
    FTotalPeriodo : Double ;
    function GetCpfCnpj( KCAD_ENTIDADE : string ) : string ;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;


implementation

uses Tc.DBRTL.AbstractDB,UDBFinanceiro ;

{$R *.dfm}

{ TfqrCustomReport }


procedure TFin_VendasPorPeriodoReport.cdsMasterCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsMasterCPF_CNPJ.AsString := GetCpfCnpj( cdsMasterKCAD_ENTIDADE.AsString );
end;

function TFin_VendasPorPeriodoReport.GetCpfCnpj(KCAD_ENTIDADE: string): string;
const
  SQL_ENTIDADES = 'SELECT CPF_CNPJ FROM CAD_ENTIDADES WHERE KCAD_ENTIDADE = :KCAD_ENTIDADE';

var
  p : TParams;
  cds : TClientDataSet ;

begin
  p   := TParams.Create;
  cds := nil;

  P.CreateParam( ftString, 'KCAD_ENTIDADE', ptInput ).AsString := KCAD_ENTIDADE;

  TTcAbstractDB.GetByAlias('ENTIDADES').populateClientDataSet( cds, SQL_ENTIDADES, p );

  Result := cds.Fields[0].AsString ;

  cds.Free;
  p.Free;
end;

class function TFin_VendasPorPeriodoReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFin_VendasPorPeriodoReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFin_VendasPorPeriodoReport.Initialize;
begin
  with TSpecificReportParams ( Parameters ), cdsMaster.Params do
     begin

       ParamByName( 'KSYS$DOMAIN' ).AsString   := LoggedUser.DomainID ;
       ParamByName( 'DATAINI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( StartDate ) ) ;
       ParamByName( 'DATAFIM' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( EndDate ) ) ;
       ParamByName( 'TODOS' ).AsString         := BoolToChar( TODOS_ENTIDADE ) ;
       ParamByName( 'KCAD_ENTIDADE' ).AsString := KCAD_ENTIDADE ;

       _qrlDescricao.Caption  := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate , EndDate ) ;
     end ;

  cdsMaster.Open ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;
end;

procedure TFin_VendasPorPeriodoReport.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  FTotalPeriodo := 0 ;
end;

procedure TFin_VendasPorPeriodoReport.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  FTotalPeriodo := FTotalPeriodo + cdsMasterTOTAL_NOTA.AsFloat ;
end;

procedure TFin_VendasPorPeriodoReport.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlTotal.Caption := '';
  qrlTotal.Caption := FormatFloat(  '#,0.00', FTotalPeriodo ) ;
end;

end.
