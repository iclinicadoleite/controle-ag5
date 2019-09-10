// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//                (impressao)
// License      : veja readme.txt





unit UFIN.DespesasReceitasRealizadas.Rpt ;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes,
  ReportTypes, UFIN.DespesasReceitasRealizadas.Data, System.Actions,
  Vcl.ActnList, Tc.VCL.Application, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_DespesasReceitas ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TFIN_DespesasReceitasReport = class(TfqrSYS_BaseReport)
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
    qrDBData: TQRDBText;
    qrDBCodigo: TQRDBText;
    qrDBContaContabil: TQRDBText;
    qrDBCentroCusto: TQRDBText;
    qrDBRateio: TQRDBText;
    qrDBValor: TQRDBText;
    qrDBQtde: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    qrDBDescricao: TQRDBText;
    qrDBFornecedor: TQRDBText;
    QRLabel13: TQRLabel;
    qrDBCPFCNPJ: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel15: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    dtmDespesas : TdtmFin_DespesasReceitasRealizadas ;
    FTotalDespesas : Currency ;
    FTotalReceitas : Currency ;
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


class function TFIN_DespesasReceitasReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFIN_DespesasReceitasReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFIN_DespesasReceitasReport.Initialize;
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      QuickRep.ReportTitle  := ReportTitle;
     // _qrlDescricao.Caption := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate , EndDate ) ;
      if Assigned (Parameters) and (Parameters.Description <> '') then
        _qrlDescricao.Caption := Parameters.Description;

      dtmDespesas := TdtmFin_DespesasReceitasRealizadas( FDataModule ) ;
      QuickRep.DataSet          :=  dtmDespesas.cdsDespesasReceitas ;
      qrDBData.DataSet          :=  QuickRep.DataSet  ;
      qrDBDocumento.DataSet     :=  QuickRep.DataSet  ;
      qrDBCodigo.DataSet        :=  QuickRep.DataSet  ;
      qrDBFornecedor.DataSet    :=  QuickRep.DataSet  ;
      qrDBCPFCNPJ.DataSet       :=  QuickRep.DataSet  ;
      qrDBDescricao.DataSet     :=  QuickRep.DataSet  ;
      qrDBContaContabil.DataSet :=  QuickRep.DataSet  ;
      qrDBCentroCusto.DataSet   :=  QuickRep.DataSet  ;
      qrDBRateio.DataSet        :=  QuickRep.DataSet  ;
      qrDBQtde.DataSet          :=  QuickRep.DataSet  ;
      qrDBValor.DataSet         :=  QuickRep.DataSet  ;
    end ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;
end;

procedure TFIN_DespesasReceitasReport.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  FTotalDespesas := FTotalDespesas + dtmDespesas.cdsDespesasReceitasDESPESA.AsCurrency ;
  FTotalReceitas := FTotalReceitas + dtmDespesas.cdsDespesasReceitasRECEITA.AsCurrency ;
end;

procedure TFIN_DespesasReceitasReport.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  LAutoStretch, LAutoSize, LWordWrap : boolean ;
begin
  inherited;
  FTotalDespesas := 0 ;
  FTotalReceitas := 0 ;

  LAutoStretch := not Sender.Exporting ;
  LAutoSize := not LAutoStretch ;
  LWordWrap   := (* not *) LAutoStretch;

  qrDBDocumento.AutoStretch     :=  LAutoStretch ;
  qrDBCodigo.AutoStretch        :=  LAutoStretch ;
  qrDBFornecedor.AutoStretch    :=  LAutoStretch ;
  qrDBCPFCNPJ.AutoStretch       :=  LAutoStretch ;
  qrDBDescricao.AutoStretch     :=  LAutoStretch ;
  qrDBContaContabil.AutoStretch :=  LAutoStretch ;
  qrDBCentroCusto.AutoStretch   :=  LAutoStretch ;

  qrDBDocumento.AutoSize     :=  LAutoSize ;
  qrDBCodigo.AutoSize        :=  LAutoSize ;
  qrDBFornecedor.AutoSize    :=  LAutoSize ;
  qrDBCPFCNPJ.AutoSize       :=  LAutoSize ;
  qrDBDescricao.AutoSize     :=  LAutoSize  ;
  qrDBContaContabil.AutoSize :=  LAutoSize  ;
  qrDBCentroCusto.AutoSize   :=  LAutoSize  ;

  qrDBDocumento.WordWrap     :=  LWordWrap ;
  qrDBCodigo.WordWrap        :=  LWordWrap ;
  qrDBFornecedor.WordWrap    :=  LWordWrap ;
  qrDBCPFCNPJ.WordWrap       :=  LWordWrap ;
  qrDBDescricao.WordWrap     :=  LWordWrap ;
  qrDBContaContabil.WordWrap :=  LWordWrap ;
  qrDBCentroCusto.WordWrap   :=  LWordWrap ;
end;

procedure TFIN_DespesasReceitasReport.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLabel11.Caption := '' ;
  QRLabel15.Caption := '' ;
  QRLabel11.Caption := FormatFloat( '#,0.00', FTotalDespesas );
  QRLabel15.Caption := FormatFloat( '#,0.00', FTotalReceitas );
end;

end.
