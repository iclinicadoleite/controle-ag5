unit UfqrFIN_APagarTitulo;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Data.SQLTimSt, QRCtrls, QuickRpt, VCL.ExtCtrls, Datasnap.Provider,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, jpeg, QRPDF995Suppl, MailSuppl, DateSuppl, DateUtils,
  UfqrSYS_BaseReport, SysReportTypes, UfdrFIN_APagar, ReportTypes, Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_APagar ;
  TSpecificReportDialog = TfdrFIN_APagar ;  // substituir pela classe de
                                          // dialogo do relatorio

  TfqrFIN_APagarTitulo = class(TfqrSYS_BaseReport)
    QRLabel6: TQRLabel;
    qrlPago: TQRLabel;
    qrlAPagar: TQRLabel;
    QRLabel12: TQRLabel;
    cdsFIN_APAGAR: TClientDataSet;
    dspFIN_APAGAR: TDataSetProvider;
    sqlFIN_APAGAR: TTcSQLDataSet;
    sqlParcelas: TTcSQLDataSet;
    QRSubDetail1: TQRSubDetail;
    cdsParcelas: TClientDataSet;
    dtsSqlFIN_APAGAR: TDataSource;
    sqlParcelasKFIN_APAGAR_PARCELA: TStringField;
    sqlParcelasVENCTO: TSQLTimeStampField;
    sqlParcelasVALOR: TFloatField;
    sqlParcelasPAGTO: TSQLTimeStampField;
    sqlParcelasPAGO: TFloatField;
    cdsParcelasKFIN_APAGAR_PARCELA: TStringField;
    cdsParcelasVENCTO: TSQLTimeStampField;
    cdsParcelasVALOR: TFloatField;
    cdsParcelasPAGTO: TSQLTimeStampField;
    cdsParcelasPAGO: TFloatField;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    sqlFIN_APAGARKFIN_APAGAR: TStringField;
    sqlFIN_APAGARHISTORICO: TStringField;
    sqlFIN_APAGARDOCUMENTO: TStringField;
    sqlFIN_APAGARDATALANCTO: TSQLTimeStampField;
    sqlFIN_APAGARVALOR: TFloatField;
    cdsFIN_APAGARKFIN_APAGAR: TStringField;
    cdsFIN_APAGARHISTORICO: TStringField;
    cdsFIN_APAGARDOCUMENTO: TStringField;
    cdsFIN_APAGARDATALANCTO: TSQLTimeStampField;
    cdsFIN_APAGARVALOR: TFloatField;
    cdsFIN_APAGARsqlParcelas: TDataSetField;
    sqlParcelasCONTA: TStringField;
    cdsParcelasCONTA: TStringField;
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    nBand: Integer;
//    DiaAPagar, DiaPago: Currency;
    TotalAPagar, TotalPago: Currency;
  protected
      class Function  GetDialogClass : IReportDialog ; override ;
      class Function  GetParametersClass : TReportParamsClass ; override ;
      procedure Initialize  ; override ;
  public
    { Public declarations }
    class procedure Execute2 ( KFIN_Apagar : string ) ; overload ;
  end;

implementation

uses UDBFinanceiro, MaskUtils;

{$R *.dfm}

class function TfqrFIN_APagarTitulo.GetDialogClass : IReportDialog ;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TfqrFIN_APagarTitulo.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TfqrFIN_APagarTitulo.Initialize;
begin
  inherited ;

  cdsFIN_APAGAR.Close;

  with TSpecificReportParams( Parameters ), cdsFIN_APAGAR.params do
    begin
       QuickRep.ReportTitle := ReportTitle ;
       paramByName ( 'KFIN_APAGAR' ).asString := KFIN_APAGAR ;
    end ;

  cdsFIN_APAGAR.Open;

  with TMailSuppl.GlobalMail do
    begin
      Clear ;
      //ToList.Add ( cdsMasterEmail.asString ) ;
      Message := 'Segue em Anexo ... ' ;
    end ;
end;

procedure TfqrFIN_APagarTitulo.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  nBand       := 0 ;
  TotalAPagar := 0 ;
  TotalPago   := 0 ;
//  DiaAPagar   := 0 ;
//  DiaPago     := 0 ;
end;

procedure TfqrFIN_APagarTitulo.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlAPagar.Caption := '' ;
  qrlPago.Caption   := '' ;
  qrlAPagar.Caption := FormatFloat( '#,0.00', TotalAPagar );
  qrlPago.Caption   := FormatFloat( '#,0.00', TotalPago );
end;

procedure TfqrFIN_APagarTitulo.QRLabel14Print(sender: TObject; var Value: String);
begin
//  Value := FormatFloat(Value, DiaAPagar);
//  DiaAPagar := 0;
end;

procedure TfqrFIN_APagarTitulo.QRLabel15Print(sender: TObject; var Value: String);
begin
//  Value := FormatFloat(Value, DiaPago);
//  DiaPago := 0;
end;

class procedure TfqrFIN_APagarTitulo.Execute2(KFIN_Apagar: string );
var
  Parameters : TReportParamsFIN_APagar ;
begin
  inherited;
  Parameters := TReportParamsFIN_APagar.Create ;
  Parameters.KFIN_APAGAR := KFIN_Apagar ;
  Parameters.ReportTitle := 'Título(s) a pagar';
  TfqrFIN_APagarTitulo.Execute ( Parameters ) ;
  Parameters.Free ;
end;

procedure TfqrFIN_APagarTitulo.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
//  If cdsFIN_APAGARPAGTO.IsNull or (TSpecificReportParams ( Parameters ).Filtro <> 'P.Vencto') then
//    Sender.Font.Style := Self.Font.Style -[fsStrikeOut]
//  else
//    Sender.Font.Style := Self.Font.Style +[fsStrikeOut];

  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00EFEFEF;
  Inc(nBand);

  If cdsParcelasPAGTO.IsNull then
    begin
//      DiaAPagar   := DiaAPagar + cdsFIN_APAGARVALOR.AsCurrency;
      TotalAPagar := TotalAPagar + cdsFIN_APAGARVALOR.AsCurrency;
    end
  else
    begin
//      DiaPago   := DiaPago + cdsFIN_APAGARPAGO.AsCurrency;
      TotalPago := TotalPago + cdsParcelasPAGO.AsCurrency;
    end;
end;

end.

