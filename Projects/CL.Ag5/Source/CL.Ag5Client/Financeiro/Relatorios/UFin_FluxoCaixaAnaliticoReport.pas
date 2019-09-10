// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Fluxo de caixa Analítico
//
// License      : veja readme.txt





unit UFin_FluxoCaixaAnaliticoReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes, ReportTypes,
  UdtmFIN_FluxoCaixa2, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFluxoCaixa ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TFIN_FluxoCaixaAnaliticoReport = class(TfqrSYS_BaseReport)
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    procedure rbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    FDtmFluxo : TdtmFIN_FluxoCaixa2;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

{ TfqrCustomReport }


class function TFIN_FluxoCaixaAnaliticoReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFIN_FluxoCaixaAnaliticoReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFIN_FluxoCaixaAnaliticoReport.Initialize;
begin
  // Datamodule herdado da tela de fluxo de caixa
  with TSpecificReportParams ( Parameters ) do
     begin
       FDtmFluxo := TdtmFIN_FluxoCaixa2( FDataModule ) ;
       QuickRep.DataSet := FdtmFluxo.cdsFluxo ;
       QRDBText2.DataSet := FdtmFluxo.cdsFluxo ;
       QRDBText3.DataSet := FdtmFluxo.cdsFluxo ;
       QRDBText4.DataSet := FdtmFluxo.cdsFluxo ;
       QRDBText5.DataSet := FdtmFluxo.cdsFluxo ;
       QRDBText6.DataSet := FdtmFluxo.cdsFluxo ;
     end ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;
end;

procedure TFIN_FluxoCaixaAnaliticoReport.rbDetailBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if FDtmFluxo.cdsFluxoTIPO.asInteger in [
        _TIPO_ANALITICO_SUMARIO_SALDO,
        _TIPO_ANALITICO_SUMARIO_NC,
        _TIPO_ANALITICO_SUMARIO_EMATRASO,
        _TIPO_ANALITICO_SUMARIO_AVENCER,
        _TIPO_ANALITICO_SUMARIO ] then
     begin
        QRDBText2.Font.Style := [fsBold] ;
        QRDBText3.Font.Style := [fsBold] ;
        QRDBText4.Font.Style := [fsBold] ;
        QRDBText5.Font.Style := [fsBold] ;
        QRDBText6.Font.Style := [fsBold] ;
        exit ;
     end ;

end;

end.
