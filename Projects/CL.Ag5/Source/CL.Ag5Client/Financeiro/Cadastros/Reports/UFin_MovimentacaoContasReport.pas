unit UFin_MovimentacaoContasReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes,
  ReportTypes, UFin_MovimentacaoContasDialog, UFin_MovimentacaoContasDataModule, System.Actions,
  Vcl.ActnList, Tc.VCL.Application, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsContasBancarias ; // substituir pela classe
                                                         // de parametros do relatorio

  TSpecificReportDialog = TFIN_MovimentacaoContasDialog ; // substituir pela classe de
                                                          // dialogo do relatorio

  TFIN_MovimentacaoContasReport = class(TfqrSYS_BaseReport)
    qrGroup: TQRGroup;
    qrlPeriodo: TQRLabel;
    qrGroupFooter: TQRBand;
    qrlTotalCreditos: TQRLabel;
    qrlTotalDebitos: TQRLabel;
    qrlTotalSaldo: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrCredito: TQRDBText;
    qrDebito: TQRDBText;
    qrlSaldo: TQRLabel;
    QRLabel7: TQRLabel;
    qrlSaldoAnterior: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    qrlSaldoGeral: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    procedure qrGroupBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrGroupFooterBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    FLastConta : string ;
    FContas : TContasBancarias;
    FSaldoInicial : double ;
    FSaldoAnterior : Double ;
    FSaldo : Double ;
    SaldoConta :Double;
    TotalCreditos : Double;
    TotalDebitos  : Double;
    SaldoGeral    : Double;
    FIN_MovimentacaoContasDataModule : TFIN_MovimentacaoContasDataModule ;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
    class procedure ExecuteByForm(CDSMov, CDSSaldo: TClientDataSet);
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBfinanceiro ;

{$R *.dfm}

{ TfqrCustomReport }

class procedure TFIN_MovimentacaoContasReport.ExecuteByForm(CDSMov, CDSSaldo: TClientDataSet);
var
  ThisForm : TFIN_MovimentacaoContasReport ;
begin

  ThisForm := Create ( nil ) ;
 // ThisForm.CDSMovimentacaoSender:= CDSMov;
 // ThisForm.CDSSaldoSender:= CDSSaldo;
  ThisForm.Initialize ;
  //ThisForm.DoPrint ;
  ThisForm.QuickRep.Preview;
  ThisForm.free ;

end;

class function TFIN_MovimentacaoContasReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFIN_MovimentacaoContasReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFIN_MovimentacaoContasReport.Initialize;
begin

  with TSpecificReportParams ( Parameters ) do
   begin
      FIN_MovimentacaoContasDataModule:= TFIN_MovimentacaoContasDataModule( FDataModule );
      QuickRep.ReportTitle := ReportTitle ;
      qrlPeriodo.Caption := 'Período de ' + DateToStr( StartDate ) + ' até ' + DateToStr( EndDate ) + '.';
   end;


end;


procedure TFIN_MovimentacaoContasReport.qrGroupBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  LForcePrint : boolean ;
begin
  inherited;
  LForcePrint := False ;

  LForcePrint := FIN_MovimentacaoContasDataModule.cdsMovimentacao.FieldByName( 'KFIN_CONTA' ) .AsString <> FLastConta ;
  if ( LForcePrint ) then
    begin
     FIN_MovimentacaoContasDataModule.cdsSaldoContas.Locate( 'KFIN_CONTA', FIN_MovimentacaoContasDataModule.cdsMovimentacaoKFIN_CONTA.AsString, [] );
     FSaldoInicial  := FIN_MovimentacaoContasDataModule.cdsSaldoContas.FieldByName( 'SALDOCC' ).AsFloat;
     FSaldoAnterior := FSaldoInicial  ;
     FSaldo         := FSaldoAnterior ;
     TotalCreditos  := 0.00 ;
     TotalDebitos   := 0.00 ;
     FLastConta     := FIN_MovimentacaoContasDataModule.cdsMovimentacaoKFIN_CONTA.AsString ;
    end ;
  qrlSaldoAnterior.Caption := FormatFloat(  '#,0.00', FSaldoAnterior );
  PrintBand := ( not QuickRep.Exporting ) or  LForcePrint ;
end;

procedure TFIN_MovimentacaoContasReport.qrGroupFooterBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlTotalCreditos.Caption := '' ;
  qrlTotalDebitos.Caption  := '' ;
  qrlTotalSaldo.Caption    := '' ;
  qrlTotalCreditos.Caption := FormatFloat(  '#,0.00', TotalCreditos ) ;
  qrlTotalDebitos.Caption  := FormatFloat(  '#,0.00', TotalDebitos ) ;
  qrlTotalSaldo.Caption    := FormatFloat(  '#,0.00', FSaldo ) ;

  SaldoGeral := SaldoGeral + FSaldo ;
end;

procedure TFIN_MovimentacaoContasReport.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  FLastConta     := '' ;
  FSaldo         := 0.00;
  FSaldoAnterior := 0.00 ;
  TotalCreditos  := 0.00;
  TotalDebitos   := 0.00;
  SaldoGeral     := 0.00;
end;

procedure TFIN_MovimentacaoContasReport.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  PrintBand := FIN_MovimentacaoContasDataModule.cdsMovimentacaoTIPOREG.AsInteger = _TIPO_MOV_BANCARIA_ITENS ;
  if ( not PrintBand ) then
      exit ;

  if FIN_MovimentacaoContasDataModule.cdsMovimentacaoCREDITO.AsFloat > 0 then
    begin
      FSaldoAnterior := FSaldo ;
      FSaldo         := FSaldo + FIN_MovimentacaoContasDataModule.cdsMovimentacaoCREDITO.AsFloat;
      TotalCreditos  := TotalCreditos + FIN_MovimentacaoContasDataModule.cdsMovimentacaoCREDITO.AsFloat;
      qrCredito.Mask := '#,0.00' ;
      qrDebito.Mask  := '' ;
    end
  else if FIN_MovimentacaoContasDataModule.cdsMovimentacaoDEBITO.AsFloat > 0 then
    begin
      FSaldoAnterior := FSaldo ;
      FSaldo         := FSaldo - FIN_MovimentacaoContasDataModule.cdsMovimentacaoDEBITO.AsFloat;
      TotalDebitos   := TotalDebitos + FIN_MovimentacaoContasDataModule.cdsMovimentacaoDEBITO.AsFloat;
      qrDebito.Mask  := '#,0.00' ;
      qrCredito.Mask := '' ;
    end;

  qrlSaldo.Caption := FormatFloat( '#,0.00', FSaldo );
end;

procedure TFIN_MovimentacaoContasReport.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlSaldoGeral.Caption := FormatFloat(  '#,0.00', SaldoGeral ) ;
end;

end.
