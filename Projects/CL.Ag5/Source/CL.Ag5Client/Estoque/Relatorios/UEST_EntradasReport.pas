// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//                (impressao)
// License      : veja readme.txt





unit UEST_EntradasReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes,
  ReportTypes, UEST_EntradasReportDatamodule, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsEST_Entradas ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TEST_EntradasReport = class(TfqrSYS_BaseReport)
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrDBDocumento: TQRDBText;
    QRDBText2: TQRDBText;
    qrDBDescricao: TQRDBText;
    qrDBContaContabil: TQRDBText;
    qrDBCentroCusto: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    dtmEntradas : TEST_EntradasReportDatamodule ;
    FTotal : Currency ;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;

implementation

//uses UDBResources;

{$R *.dfm}

{ TfqrCustomReport }


class function TEST_EntradasReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TEST_EntradasReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TEST_EntradasReport.Initialize;
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      QuickRep.ReportTitle  := ReportTitle;
      _qrlDescricao.Caption := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate , EndDate ) ;

      dtmEntradas := TEST_EntradasReportDatamodule( FDataModule ) ;

      qrDBDocumento.DataSet     := dtmEntradas.cdsEntradas ;
      QRDBText2.DataSet         := dtmEntradas.cdsEntradas ;
      qrDBDescricao.DataSet     := dtmEntradas.cdsEntradas ;
      qrDBContaContabil.DataSet := dtmEntradas.cdsEntradas ;
      qrDBCentroCusto.DataSet   := dtmEntradas.cdsEntradas ;
      QRDBText6.DataSet         := dtmEntradas.cdsEntradas ;
      QRDBText8.DataSet         := dtmEntradas.cdsEntradas ;
      QRDBText7.DataSet         := dtmEntradas.cdsEntradas ;

      QuickRep.DataSet := dtmEntradas.cdsEntradas ;

    end ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;
end;

procedure TEST_EntradasReport.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  FTotal := FTotal + dtmEntradas.cdsEntradasVALOR.AsCurrency ;
end;

procedure TEST_EntradasReport.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  LAutoStretch, LAutoSize, LWordWrap : boolean ;
begin
  inherited;
  FTotal := 0 ;

  LAutoStretch := not Sender.Exporting ;
  LAutoSize := not LAutoStretch ;
  LWordWrap   := (* not *) LAutoStretch;

  qrDBDocumento.AutoStretch     :=  LAutoStretch ;
  qrDBDescricao.AutoStretch     :=  LAutoStretch ;
  qrDBContaContabil.AutoStretch :=  LAutoStretch ;
  qrDBCentroCusto.AutoStretch   :=  LAutoStretch ;

  qrDBDocumento.AutoSize     :=  LAutoSize ;
  qrDBDescricao.AutoSize     :=  LAutoSize  ;
  qrDBContaContabil.AutoSize :=  LAutoSize  ;
  qrDBCentroCusto.AutoSize   :=  LAutoSize  ;

  qrDBDocumento.WordWrap     :=  LWordWrap ;
  qrDBDescricao.WordWrap     :=  LWordWrap ;
  qrDBContaContabil.WordWrap :=  LWordWrap ;
  qrDBCentroCusto.WordWrap   :=  LWordWrap ;
end;

procedure TEST_EntradasReport.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLabel11.Caption := '' ;
  QRLabel11.Caption := FormatFloat( '#,0.00', FTotal );
end;

end.
