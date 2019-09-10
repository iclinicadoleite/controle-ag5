// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//                (impressao)
// License      : veja readme.txt





unit UEST_SaidasReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes,
  ReportTypes, UEST_SaidasReportDatamodule, Wrappers, System.Actions,
  Vcl.ActnList, Tc.VCL.Application ;

type

  TSpecificReportParams = ReportTypes.TReportParamsEST_Saidas ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TEST_SaidasReport = class(TfqrSYS_BaseReport)
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
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    dtmSaidas : TEST_SaidasReportDatamodule ;
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


class function TEST_SaidasReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TEST_SaidasReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TEST_SaidasReport.Initialize;
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      QuickRep.ReportTitle  := ReportTitle;
      _qrlDescricao.Caption := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate , EndDate ) ;

      dtmSaidas := TEST_SaidasReportDatamodule( FDataModule ) ;

      qrDBDocumento.DataSet     := dtmSaidas.cdsSaidas ;
      QRDBText2.DataSet         := dtmSaidas.cdsSaidas ;
      qrDBDescricao.DataSet     := dtmSaidas.cdsSaidas ;
      qrDBContaContabil.DataSet := dtmSaidas.cdsSaidas ;
      qrDBCentroCusto.DataSet   := dtmSaidas.cdsSaidas ;
      QRDBText6.DataSet         := dtmSaidas.cdsSaidas ;
      QRDBText8.DataSet         := dtmSaidas.cdsSaidas ;
      QRDBText7.DataSet         := dtmSaidas.cdsSaidas ;

      QuickRep.DataSet := dtmSaidas.cdsSaidas ;

    end ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;
end;

procedure TEST_SaidasReport.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  FTotal := FTotal + dtmSaidas.cdsSaidasCUSTO_MEDIO.AsCurrency ;
end;

procedure TEST_SaidasReport.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
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

procedure TEST_SaidasReport.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLabel11.Caption := '' ;
  QRLabel11.Caption := FormatFloat( '#,0.00', FTotal );
end;

end.
