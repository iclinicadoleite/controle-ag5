// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//                (impressao)
// License      : veja readme.txt





unit UFIN.DRE.Rpt;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes,
  ReportTypes, UFIN.DRE.Data, System.Actions,
  Vcl.ActnList, Tc.VCL.Application, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_PagamentosRecebimentos ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TrptFIN_DRE = class(TfqrSYS_BaseReport)
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
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    FExporting : boolean ;
    FdtmFIN_DRE  : TdtmFIN_DRE ;
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


class function TrptFIN_DRE.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TrptFIN_DRE.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TrptFIN_DRE.Initialize;
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      QuickRep.ReportTitle  := ReportTitle;
      _qrlDescricao.Caption := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate , EndDate ) ;

      FdtmFIN_DRE  := TdtmFIN_DRE ( FDataModule ) ;
    end ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;
end;

procedure TrptFIN_DRE.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
//  FTotalCredito := FTotalCredito + FdtmFIN_DRE .cdsPagamentosRecebimentosCREDITO.AsCurrency ;
//  FTotalDebito  := FTotalDebito + FdtmFIN_DRE .cdsPagamentosRecebimentosDEBITO.AsCurrency ;
end;

procedure TrptFIN_DRE.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  LAutoStretch, LAutoSize, LWordWrap : boolean ;
  LFontSize : integer ;
begin
  inherited;
  FExporting := Sender.Exporting ;
  FTotalCredito := 0 ;
  FTotalDebito  := 0 ;

  LAutoStretch := not Sender.Exporting ;
  LAutoSize := not LAutoStretch ;
  LWordWrap   := (* not *) LAutoStretch;

  qrDBDocumento.AutoStretch     :=  LAutoStretch ;
//  qrDBData.AutoStretch          :=  LAutoStretch ;
//  qrDBCodigo.AutoStretch        :=  LAutoStretch ;
  qrDBFornecedor.AutoStretch    :=  LAutoStretch ;
//  qrDBCPFCNPJ.AutoStretch       := LAutoStretch ;
  qrDBDescricao.AutoStretch     :=  LAutoStretch ;
  qrDBContaContabil.AutoStretch :=  LAutoStretch ;
  qrDBCentroCusto.AutoStretch   :=  LAutoStretch ;

  qrDBDocumento.AutoSize     :=  LAutoSize ;
//  qrDBData.AutoSize          :=  LAutoSize ;
//  qrDBCodigo.AutoSize        :=  LAutoSize ;
  qrDBFornecedor.AutoSize    :=  LAutoSize ;
  qrDBCPFCNPJ.AutoSize       := LAutoSize ;
  qrDBDescricao.AutoSize     :=  LAutoSize  ;
  qrDBContaContabil.AutoSize :=  LAutoSize  ;
  qrDBCentroCusto.AutoSize   :=  LAutoSize  ;

  qrDBDocumento.WordWrap     :=  LWordWrap ;
//  qrDBData.WordWrap          :=  LWordWrap ;
//  qrDBCodigo.WordWrap        :=  LWordWrap ;
  qrDBFornecedor.WordWrap    :=  LWordWrap ;
  qrDBCPFCNPJ.WordWrap       := LWordWrap ;
  qrDBDescricao.WordWrap     :=  LWordWrap ;
  qrDBContaContabil.WordWrap :=  LWordWrap ;
  qrDBCentroCusto.WordWrap   :=  LWordWrap ;

  if Sender.Exporting then
    begin
      LFontSize := 11 ;
//      FdtmFIN_DRE.cdsPagamentosRecebimentosDEBITO.DisplayFormat := '#,0.00###' ;
//      FdtmFIN_DRE.cdsPagamentosRecebimentosCREDITO.DisplayFormat := '#,0.00###' ;
    end
  else
    begin
      LFontSize := 8 ;
//      FdtmFIN_DRE.cdsPagamentosRecebimentosDEBITO.DisplayFormat := '#,0.00' ;
//      FdtmFIN_DRE.cdsPagamentosRecebimentosCREDITO.DisplayFormat := '#,0.00' ;
    end ;

  qrDBDocumento.Font.Size       := LFontSize ;
  qrDBData.Font.Size            := LFontSize ;
  qrDBDescricao.Font.Size       := LFontSize ;
  qrDBContaContabil.Font.Size   := LFontSize ;
  qrDBCentroCusto.Font.Size     := LFontSize ;
  qrDBRateio.Font.Size          := LFontSize ;
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

procedure TrptFIN_DRE.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
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
