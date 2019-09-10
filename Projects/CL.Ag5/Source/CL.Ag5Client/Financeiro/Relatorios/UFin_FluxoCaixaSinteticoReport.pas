// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Fluxo de caixa sintético
//
// License      : veja readme.txt





unit UFin_FluxoCaixaSinteticoReport;

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

  TFIN_FluxoCaixaSinteticoReport = class(TfqrSYS_BaseReport)
    ChildBand1: TQRChildBand;
    QRLabel14: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrmConta: TQRMemo;
    qrmSaldoConta: TQRMemo;
    qrmTipoSumario: TQRMemo;
    qrmDescSumario: TQRMemo;
    qrmDebitoSumario: TQRMemo;
    qrmCreditoSumario: TQRMemo;
    qrmSaldSumario: TQRMemo;
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


class function TFIN_FluxoCaixaSinteticoReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFIN_FluxoCaixaSinteticoReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFIN_FluxoCaixaSinteticoReport.Initialize;
begin
  // Datamodule herdado da tela de fluxo de caixa
  with TSpecificReportParams ( Parameters ) do
     begin
       FDtmFluxo := TdtmFIN_FluxoCaixa2( FDataModule ) ;
       QuickRep.DataSet := FdtmFluxo.cdsFluxo ;
       QRDBText2.DataSet := FdtmFluxo.cdsFluxo ;
       QRDBText4.DataSet := FdtmFluxo.cdsFluxo ;
       QRDBText5.DataSet := FdtmFluxo.cdsFluxo ;
       QRDBText6.DataSet := FdtmFluxo.cdsFluxo ;


       with FDtmFluxo, cdsContas do
         begin
            First ;
            while not eof do
              begin
                qrmConta.Lines.Add      ( cdsContasNOME.Text ) ;
                qrmSaldoConta.Lines.Add ( cdsContasSALDOCC.Text ) ;
                next ;
              end;
         end;

       with FDtmFluxo, cdsSumarioAtraso do
         begin
            First ;
            while not eof do
              begin
                qrmTipoSumario.Lines.Add    ( cdsSumarioAtrasoTIPO.Text ) ;
                qrmDescSumario.Lines.Add    ( cdsSumarioAtrasoDESCRICAO.Text ) ;
                qrmCreditoSumario.Lines.Add ( cdsSumarioAtrasoCREDITO.Text ) ;
                qrmDebitoSumario.Lines.Add  ( cdsSumarioAtrasoDEBITO.Text ) ;
                qrmSaldSumario.Lines.Add    ( cdsSumarioAtrasoSALDO.Text ) ;
                next ;
              end;
         end;

       while qrmSaldoConta.lines.Count <> qrmTipoSumario.Lines.Count do
         begin
            if qrmSaldoConta.lines.Count < qrmTipoSumario.Lines.Count then
              begin
                qrmConta.Lines.Add      ( '' ) ;
                qrmSaldoConta.Lines.Add ( '' )
              end
            else
                qrmTipoSumario.Lines.Add    ( '' ) ;
         end;

       qrmConta.Lines.Add      ( 'Saldo total das contas :' ) ;
       qrmSaldoConta.Lines.Add ( FormatFloat ( '#,0.00 ;(#,0.00) ;- ', FDtmFluxo.SaldoInicialContas ) );
       qrmTipoSumario.Lines.Add( '' ) ;

     end ;


  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;
end;

procedure TFIN_FluxoCaixaSinteticoReport.rbDetailBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if QuickRep.PageNumber = 1 then
    begin
      if ( FdtmFluxo.cdsFluxo.RecNo mod (40 - qrmConta.Lines.Count ) = 0 ) then
        QuickRep.NewPage
    end
  else if ( (FdtmFluxo.cdsFluxo.RecNo - (40 - qrmConta.Lines.Count )) mod 40 = 0 ) then
        QuickRep.NewPage ;

end;

end.
