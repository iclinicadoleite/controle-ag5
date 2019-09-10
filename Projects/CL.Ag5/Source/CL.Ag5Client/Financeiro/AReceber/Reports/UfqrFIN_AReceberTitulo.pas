unit UfqrFIN_AReceberTitulo;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Data.SQLTimSt, QRCtrls, QuickRpt, VCL.ExtCtrls, Datasnap.Provider,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, jpeg, QRPDF995Suppl, MailSuppl, DateSuppl, DateUtils,
  UfqrSYS_BaseReport, SysReportTypes, UfdrFIN_AReceber, ReportTypes, Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_AReceber ;
  TSpecificReportDialog = TfdrFIN_AReceber ;  // substituir pela classe de
                                          // dialogo do relatorio

  TfqrFIN_AReceberTitulo = class(TfqrSYS_BaseReport)
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    cdsFIN_AReceber: TClientDataSet;
    dspFIN_AReceber: TDataSetProvider;
    sqlFIN_AReceber: TTcSQLDataSet;
    sqlParcelas: TTcSQLDataSet;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    cdsParcelas: TClientDataSet;
    dtsSqlFIN_AReceber: TDataSource;
    QRLabel11: TQRLabel;
    QRLabel3: TQRLabel;
    sqlParcelasKFIN_ARECEBER_PARCELA: TStringField;
    sqlParcelasVENCTO: TSQLTimeStampField;
    sqlParcelasVALOR: TFloatField;
    sqlParcelasPAGTO: TSQLTimeStampField;
    sqlParcelasPAGO: TFloatField;
    sqlParcelasCONTA: TStringField;
    cdsParcelasKFIN_ARECEBER_PARCELA: TStringField;
    cdsParcelasVENCTO: TSQLTimeStampField;
    cdsParcelasVALOR: TFloatField;
    cdsParcelasPAGTO: TSQLTimeStampField;
    cdsParcelasPAGO: TFloatField;
    cdsParcelasCONTA: TStringField;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    sqlFIN_AReceberKFIN_ARECEBER: TStringField;
    sqlFIN_AReceberHISTORICO: TStringField;
    sqlFIN_AReceberDOCUMENTO: TStringField;
    sqlFIN_AReceberDATALANCTO: TSQLTimeStampField;
    sqlFIN_AReceberVALOR: TFloatField;
    cdsFIN_AReceberKFIN_ARECEBER: TStringField;
    cdsFIN_AReceberHISTORICO: TStringField;
    cdsFIN_AReceberDOCUMENTO: TStringField;
    cdsFIN_AReceberDATALANCTO: TSQLTimeStampField;
    cdsFIN_AReceberVALOR: TFloatField;
    cdsFIN_ARecebersqlParcelas: TDataSetField;
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    nBand: Integer;
//    DiaAReceber, DiaPago: Currency;
    TotalAReceber, TotalPago: Currency;
  protected
      class Function  GetDialogClass : IReportDialog ; override ;
      class Function  GetParametersClass : TReportParamsClass ; override ;
      procedure Initialize  ; override ;
  public
    { Public declarations }
    class procedure Execute2 ( KFIN_AReceber : string ) ; overload ;
  end;

implementation

uses UDBFinanceiro, MaskUtils;

{$R *.dfm}

class function TfqrFIN_AReceberTitulo.GetDialogClass : IReportDialog ;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TfqrFIN_AReceberTitulo.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TfqrFIN_AReceberTitulo.Initialize;
begin

  inherited ;

  cdsFIN_AReceber.Close;


  with TSpecificReportParams( Parameters ), cdsFIN_AReceber.params do
     begin
         paramByName ( 'KFIN_AReceber' ).asString := KFIN_AReceber ;
     end ;

  cdsFIN_AReceber.Open;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;

end;

procedure TfqrFIN_AReceberTitulo.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  nBand := 0;
//  DiaAReceber := 0;
//  DiaPago := 0;
  TotalAReceber := 0;
  TotalPago := 0;
end;

procedure TfqrFIN_AReceberTitulo.QRLabel8Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat(Value, TotalPago);
  TotalPago := 0;
end;

procedure TfqrFIN_AReceberTitulo.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, TotalAReceber);
  TotalAReceber := 0;
end;

procedure TfqrFIN_AReceberTitulo.QRLabel14Print(sender: TObject; var Value: String);
begin
//  Value := FormatFloat(Value, DiaAReceber);
//  DiaAReceber := 0;
end;

procedure TfqrFIN_AReceberTitulo.QRLabel15Print(sender: TObject; var Value: String);
begin
//  Value := FormatFloat(Value, DiaPago);
//  DiaPago := 0;
end;

class procedure TfqrFIN_AReceberTitulo.Execute2(KFIN_AReceber: string );
var
  Parameters : TReportParamsFIN_AReceber ;
begin
  inherited;
  Parameters := TReportParamsFIN_AReceber.Create ;
  Parameters.KFIN_AReceber := KFIN_AReceber ;
  TfqrFIN_AReceberTitulo.Execute ( Parameters ) ;
  Parameters.Free ;
end;

procedure TfqrFIN_AReceberTitulo.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
//  If cdsFIN_AReceberPAGTO.IsNull or (TSpecificReportParams ( Parameters ).Filtro <> 'P.Vencto') then
//    Sender.Font.Style := Self.Font.Style -[fsStrikeOut]
//  else
//    Sender.Font.Style := Self.Font.Style +[fsStrikeOut];

  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

  If cdsParcelasPAGTO.IsNull then
    begin
//      DiaAReceber   := DiaAReceber + cdsParcelasVALOR.AsCurrency;
      TotalAReceber := TotalAReceber + cdsParcelasVALOR.AsCurrency;
    end
  else
    begin
//      DiaPago   := DiaPago + cdsParcelasPAGO.AsCurrency;
      TotalPago := TotalPago + cdsParcelasPAGO.AsCurrency;
    end;
end;

end.

