// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//                (impressao)
// License      : veja readme.txt





unit UFIN.PagamentosRecebimentos.Rpt;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes,
  ReportTypes, UFIN.PagamentosRecebimentos.Data, System.Actions,
  Vcl.ActnList, Tc.VCL.Application, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_PagamentosRecebimentos ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TrptFIN_PagamentosRecebimentos = class(TfqrSYS_BaseReport)
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrDBDocumento: TQRDBText;
    qrDBData: TQRDBText;
    qrDBDescricao: TQRDBText;
    qrDBContaContabil: TQRDBText;
    qrDBCentroCusto: TQRDBText;
    qrDBRateio: TQRDBText;
    qrDBCredito: TQRDBText;
    qrDBDebito: TQRDBText;
    QRLabel12: TQRLabel;
    qrDBGrupoProduto: TQRDBText;
    qrDBCodigo: TQRDBText;
    qrDBFornecedor: TQRDBText;
    qrDBCPFCNPJ: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlTotalDebito: TQRLabel;
    qrlTotalCredito: TQRLabel;
    QRLabel11: TQRLabel;
    qrDBConta: TQRDBText;
    QRLabel15: TQRLabel;
    qrDBCheque: TQRDBText;
    QRLabel16: TQRLabel;
    qrDBProvisao: TQRDBText;
    qrDBParcela: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrDBQtde: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrDBDocumentoPrint(sender: TObject; var Value: string);
    procedure qrDBCodigoPrint(sender: TObject; var Value: string);
  private
    { Private declarations }
    FExporting : boolean ;
    FdtmFIN_PagamentosRecebimentos  : TdtmFIN_PagamentosRecebimentos ;
    FTotalDebito : Currency ;
    FTotalCredito : Currency ;
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


class function TrptFIN_PagamentosRecebimentos.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TrptFIN_PagamentosRecebimentos.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TrptFIN_PagamentosRecebimentos.Initialize;
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      QuickRep.ReportTitle  := ReportTitle;
      _qrlDescricao.Caption := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate , EndDate ) ;

      FdtmFIN_PagamentosRecebimentos  := TdtmFIN_PagamentosRecebimentos ( FDataModule ) ;

      QuickRep.DataSet          := FdtmFIN_PagamentosRecebimentos.cdsPagamentosRecebimentos ;
      qrDBDocumento.DataSet     :=  QuickRep.DataSet  ;
      qrDBData.DataSet          :=  QuickRep.DataSet  ;
      qrDBCodigo.DataSet        :=  QuickRep.DataSet  ;
      qrDBFornecedor.DataSet    :=  QuickRep.DataSet  ;
      qrDBCPFCNPJ.DataSet       :=  QuickRep.DataSet  ;
      qrDBDescricao.DataSet     :=  QuickRep.DataSet  ;
      qrDBGrupoProduto.DataSet  :=  QuickRep.DataSet  ;
      qrDBContaContabil.DataSet :=  QuickRep.DataSet  ;
      qrDBCentroCusto.DataSet   :=  QuickRep.DataSet  ;
      qrDBRateio.DataSet        :=  QuickRep.DataSet  ;
      qrDBQtde.DataSet          :=  QuickRep.DataSet  ;
      qrDBConta.DataSet         :=  QuickRep.DataSet  ;
      qrDBCheque.DataSet        :=  QuickRep.DataSet  ;
      qrDBParcela.DataSet       :=  QuickRep.DataSet  ;
      qrDBProvisao.DataSet      :=  QuickRep.DataSet  ;
      qrDBCredito.DataSet       :=  QuickRep.DataSet  ;
      qrDBDebito.DataSet        :=  QuickRep.DataSet  ;

    end ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;
end;

procedure TrptFIN_PagamentosRecebimentos.qrDBCodigoPrint(sender: TObject;
  var Value: string);
begin
  if FExporting then
     Value := ' ' + Value ;
end;

procedure TrptFIN_PagamentosRecebimentos.qrDBDocumentoPrint(sender: TObject;
  var Value: string);
begin
  if FExporting then
     Value := ' ' + Value ;
end;

procedure TrptFIN_PagamentosRecebimentos.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  FTotalCredito := FTotalCredito + FdtmFIN_PagamentosRecebimentos .cdsPagamentosRecebimentosCREDITO.AsCurrency ;
  FTotalDebito  := FTotalDebito + FdtmFIN_PagamentosRecebimentos .cdsPagamentosRecebimentosDEBITO.AsCurrency ;
end;

procedure TrptFIN_PagamentosRecebimentos.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  LAutoStretch, LAutoSize, LWordWrap : boolean ;
  LFontSize : integer ;
begin
  FExporting := Sender.Exporting ;
  FTotalCredito := 0 ;
  FTotalDebito  := 0 ;

  LAutoSize    := FExporting ;
  LAutoStretch := not FExporting ;
  LWordWrap    := not FExporting ;

  if FExporting then
    qrDBData.Width :=  80
  else
    qrDBData.Width :=  73 ;

  qrDBDocumento.AutoStretch     :=  LAutoStretch ;
//  qrDBData.AutoStretch          :=  LAutoStretch ;
  qrDBCodigo.AutoStretch        :=  LAutoStretch ;
  qrDBFornecedor.AutoStretch    :=  LAutoStretch ;
  qrDBCPFCNPJ.AutoStretch       :=  LAutoStretch ;
  qrDBDescricao.AutoStretch     :=  LAutoStretch ;
  qrDBContaContabil.AutoStretch :=  LAutoStretch ;
  qrDBCentroCusto.AutoStretch   :=  LAutoStretch ;
  qrDBConta.AutoStretch         :=  LAutoStretch ;

  qrDBDocumento.AutoSize      :=  LAutoSize ;
//  qrDBData.AutoSize          :=  LAutoSize ;
  qrDBCodigo.AutoSize        :=  LAutoSize ;
  qrDBFornecedor.AutoSize     :=  LAutoSize ;
  qrDBCPFCNPJ.AutoSize        := LAutoSize ;
  qrDBDescricao.AutoSize      :=  LAutoSize  ;
  qrDBContaContabil.AutoSize  :=  LAutoSize  ;
  qrDBCentroCusto.AutoSize    :=  LAutoSize  ;
  qrDBConta.AutoSize          :=  LAutoSize  ;

  qrDBDocumento.WordWrap     :=  LWordWrap ;
//  qrDBData.WordWrap          :=  LWordWrap ;
  qrDBCodigo.WordWrap        :=  LWordWrap ;
  qrDBFornecedor.WordWrap    :=  LWordWrap ;
  qrDBCPFCNPJ.WordWrap       := LWordWrap ;
  qrDBDescricao.WordWrap     :=  LWordWrap ;
  qrDBContaContabil.WordWrap :=  LWordWrap ;
  qrDBCentroCusto.WordWrap   :=  LWordWrap ;
  qrDBConta.WordWrap         :=  LWordWrap ;


  if Sender.Exporting then
    begin
      LFontSize := 11 ;
      FdtmFIN_PagamentosRecebimentos.cdsPagamentosRecebimentosDEBITO.DisplayFormat := '#,0.00###' ;
      FdtmFIN_PagamentosRecebimentos.cdsPagamentosRecebimentosCREDITO.DisplayFormat := '#,0.00###' ;
    end
  else
    begin
      LFontSize := 8 ;
      FdtmFIN_PagamentosRecebimentos.cdsPagamentosRecebimentosDEBITO.DisplayFormat := '#,0.00' ;
      FdtmFIN_PagamentosRecebimentos.cdsPagamentosRecebimentosCREDITO.DisplayFormat := '#,0.00' ;
    end ;

 QRLabel1.AutoStretch  :=  LAutoStretch ;
 QRLabel2.AutoStretch  :=  LAutoStretch ;
 QRLabel3.AutoStretch  :=  LAutoStretch ;
 QRLabel4.AutoStretch  :=  LAutoStretch ;
 QRLabel5.AutoStretch  :=  LAutoStretch ;
 QRLabel6.AutoStretch  :=  LAutoStretch ;
 QRLabel7.AutoStretch  :=  LAutoStretch ;
 QRLabel8.AutoStretch  :=  LAutoStretch ;
 QRLabel9.AutoStretch  :=  LAutoStretch ;
 QRLabel12.AutoStretch :=  LAutoStretch ;
 QRLabel13.AutoStretch :=  LAutoStretch ;
 QRLabel14.AutoStretch :=  LAutoStretch ;
 QRLabel11.AutoStretch :=  LAutoStretch ;
 QRLabel15.AutoStretch :=  LAutoStretch ;
 QRLabel16.AutoStretch :=  LAutoStretch ;
 QRLabel17.AutoStretch :=  LAutoStretch ;
 QRLabel18.AutoStretch :=  LAutoStretch ;

 QRLabel1.AutoSize  :=  LAutoSize ;
 QRLabel2.AutoSize  :=  LAutoSize ;
 QRLabel3.AutoSize  :=  LAutoSize ;
 QRLabel4.AutoSize  :=  LAutoSize ;
 QRLabel5.AutoSize  :=  LAutoSize ;
 QRLabel6.AutoSize  :=  LAutoSize ;
 QRLabel7.AutoSize  :=  LAutoSize ;
 QRLabel8.AutoSize  :=  LAutoSize ;
 QRLabel9.AutoSize  :=  LAutoSize ;
 QRLabel12.AutoSize :=  LAutoSize ;
 QRLabel13.AutoSize :=  LAutoSize ;
 QRLabel14.AutoSize :=  LAutoSize ;
 QRLabel11.AutoSize :=  LAutoSize ;
 QRLabel15.AutoSize :=  LAutoSize ;
 QRLabel16.AutoSize :=  LAutoSize ;
 QRLabel17.AutoSize :=  LAutoSize ;
 QRLabel18.AutoSize :=  LAutoSize ;

 QRLabel1.Font.Size  := LFontSize ;
 QRLabel2.Font.Size  := LFontSize ;
 QRLabel3.Font.Size  := LFontSize ;
 QRLabel4.Font.Size  := LFontSize ;
 QRLabel5.Font.Size  := LFontSize ;
 QRLabel6.Font.Size  := LFontSize ;
 QRLabel7.Font.Size  := LFontSize ;
 QRLabel8.Font.Size  := LFontSize ;
 QRLabel9.Font.Size  := LFontSize ;
 QRLabel12.Font.Size := LFontSize ;
 QRLabel13.Font.Size := LFontSize ;
 QRLabel14.Font.Size := LFontSize ;
 QRLabel11.Font.Size := LFontSize ;
 QRLabel15.Font.Size := LFontSize ;
 QRLabel16.Font.Size := LFontSize ;
 QRLabel17.Font.Size := LFontSize ;
 QRLabel18.Font.Size := LFontSize ;

  qrDBDocumento.Font.Size       := LFontSize ;
  qrDBData.Font.Size            := LFontSize ;
  qrDBDescricao.Font.Size       := LFontSize ;
  qrDBContaContabil.Font.Size   := LFontSize ;
  qrDBCentroCusto.Font.Size     := LFontSize ;
  qrDBRateio.Font.Size          := LFontSize ;
  qrDBQtde.Font.Size            := LFontSize ;
  qrDBCredito.Font.Size         := LFontSize ;
  qrDBDebito.Font.Size          := LFontSize ;
  qrDBGrupoProduto.Font.Size    := LFontSize ;
  qrDBCodigo.Font.Size          := LFontSize ;
  qrDBFornecedor.Font.Size      := LFontSize ;
  qrDBCPFCNPJ.Font.Size         := LFontSize ;
  qrDBConta.Font.Size           := LFontSize ;
  qrDBCheque.Font.Size          := LFontSize ;
  qrDBProvisao.Font.Size        := LFontSize ;
  qrDBParcela.Font.Size         := LFontSize ;
  qrlTotalDebito.Font.Size      := LFontSize ;
  qrlTotalCredito.Font.Size     := LFontSize ;

end;

procedure TrptFIN_PagamentosRecebimentos.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlTotalDebito.Caption := '' ;
  qrlTotalCredito.Caption := '' ;

  if FExporting then
    begin
     qrlTotalDebito.Caption := FormatFloat( '#,0.00000', FTotalDebito ) ;
     qrlTotalCredito.Caption := FormatFloat( '#,0.00000',FTotalCredito ) ;
    end
  else
    begin
     qrlTotalDebito.Caption := FormatFloat( '#,0.00', FTotalDebito ) ;
     qrlTotalCredito.Caption := FormatFloat( '#,0.00',FTotalCredito ) ;
    end;

end;

end.
