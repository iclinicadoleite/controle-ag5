unit UfqrFIN_AReceber;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Data.SQLTimSt, QRCtrls, QuickRpt, VCL.ExtCtrls, Datasnap.Provider,
  jpeg, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, QRPDF995Suppl, MailSuppl, DateSuppl, DateUtils, UfqrSYS_BaseReport,
  SysReportTypes, ReportTypes, Wrappers  ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_AReceber ;
//  TSpecificReportDialog = TReportDialog ;  // substituir pela classe de
                                          // dialogo do relatorio

  TfqrFIN_AReceber = class(TfqrSYS_BaseReport)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    qryAreceber: TSQLQuery;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    qryAreceberKFIN_ARECEBER: TStringField;
    qryAreceberHISTORICO: TStringField;
    qryAreceberENTIDADE: TStringField;
    qryAreceberDOCUMENTO: TStringField;
    qryAreceberKFIN_ARECEBER_PARCELA: TStringField;
    qryAreceberVENCTO: TSQLTimeStampField;
    qryAreceberVALOR: TFloatField;
    qryAreceberPAGTO: TSQLTimeStampField;
    qryAreceberPAGO: TFloatField;
    qryAreceberPREVISTO: TStringField;
    qryAreceberCONTA: TStringField;
    QRGroup1: TQRGroup;
    QRBand7: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    cdsAReceber: TClientDataSet;
    dspAreceber: TDataSetProvider;
    cdsAReceberKFIN_ARECEBER: TStringField;
    cdsAReceberHISTORICO: TStringField;
    cdsAReceberENTIDADE: TStringField;
    cdsAReceberDOCUMENTO: TStringField;
    cdsAReceberKFIN_ARECEBER_PARCELA: TStringField;
    cdsAReceberVENCTO: TSQLTimeStampField;
    cdsAReceberVALOR: TFloatField;
    cdsAReceberPAGTO: TSQLTimeStampField;
    cdsAReceberPAGO: TFloatField;
    cdsAReceberPREVISTO: TStringField;
    cdsAReceberCONTA: TStringField;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    procedure FormDestroy(Sender: TObject);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    nBand: Integer;
    DiaAPagar, DiaPago: Currency;
    TotalAPagar, TotalPago: Currency;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    Ordem: String;
    Filtro: String;
    { Public declarations }
    class procedure ExecuteDialogPorDocumento;
    class procedure ExecuteDialogPorPagamento;
  end;

implementation

uses UDBFinanceiro, MaskUtils;

{$R *.dfm}

procedure TfqrFIN_AReceber.Initialize;
begin
  inherited;
  cdsAReceber.Close;

  with TSpecificReportParams( Parameters ) do
     begin
        If Ordem = '' then
          Ordem := 'd.Vencto';

        If Filtro = '' then
          Filtro := 'd.Vencto';

        If StartDate <> 0 then
          begin
            qryAReceber.SQL.Text := Format( qryAReceber.SQL.Text, ['and ' + Filtro + ' BetWeen :DATAINI and :DATAFIM',Ordem] );
            qryAReceber.ParamByName('DATAINI').asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( StartDate ) ) ;
            qryAReceber.ParamByName('DATAFIM').asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( EndDate ) ) ;
            QuickRep.ReportTitle := QuickRep.ReportTitle + ' - ' + DateSuppl.TDateSuppl.GetStringPeriodo( StartDate , EndDate ) ;
           end
        else If TriM ( KCAD_ENTIDADE ) <> '' then
          begin
            qryAReceber.SQL.Text := Format( qryAReceber.SQL.Text, ['and ' + Filtro + ' = :KENTIDADE',Ordem] );
            qryAReceber.ParamByName('KENTIDADE').AsString := KCAD_ENTIDADE ;
           end
        else
          qryAReceber.SQL.Text := Format( qryAReceber.SQL.Text, ['',Ordem] );

        If ExibirQuitados then
          qryAReceber.ParamByName('PAGO').AsInteger := 1
        else
          qryAReceber.ParamByName('PAGO').AsInteger := 0;

        If Ordem = 'd.Vencto' then
          QRGroup1.Expression := 'cdsAReceber.VENCTO'
        Else If Ordem = 'd.Pagto' then
          QRGroup1.Expression := 'cdsAReceber.PAGTO'
        Else
          QRGroup1.Expression := 'TRUE';
  end ;

  cdsAReceber.Open;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;


end;

class function TfqrFIN_AReceber.GetDialogClass : IReportDialog ;
begin
//   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TfqrFIN_AReceber.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

class procedure TfqrFIN_AReceber.ExecuteDialogPorDocumento;
var
  Parameters : TReportParamsFIN_AReceber ;
begin
  inherited;
  Parameters := TReportParamsFIN_AReceber.Create ;

  Parameters.Ordem := 'A.DOCUMENTO';
  TfqrFIN_AReceber.ExecuteDialog( Parameters );
  Parameters.Free;

end;

class procedure TfqrFIN_AReceber.ExecuteDialogPorPagamento;
var
  Parameters : TReportParamsFIN_AReceber ;
begin
  inherited;
  Parameters := TReportParamsFIN_AReceber.Create ;

//    frmPeriodo.cbxPagos.Checked := True;
//    frmPeriodo.cbxPagos.Visible := False;
  Parameters.ReportTitle := 'Titulos Pagos';
  Parameters.Ordem := 'P.Pagto, P.Vencto';
  Parameters.Filtro := 'P.Pagto';
  Parameters.ExibirQuitados :=  True ;
  TfqrFIN_AReceber.ExecuteDialog ( Parameters ) ;
  Parameters.Free;
end ;



procedure TfqrFIN_AReceber.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  nBand := 0;
  DiaAPagar := 0;
  DiaPago := 0;
  TotalAPagar := 0;
  TotalPago := 0;
end;


procedure TfqrFIN_AReceber.FormDestroy(Sender: TObject);
begin
  qryAReceber.Close;
end;

procedure TfqrFIN_AReceber.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If cdsAReceberPAGTO.IsNull or (Filtro <> 'd.Vencto') then
    Sender.Font.Style := Self.Font.Style -[fsStrikeOut]
  else
    Sender.Font.Style := Self.Font.Style +[fsStrikeOut];

  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

  If cdsAReceberPAGTO.IsNull then
    begin
      DiaAPagar   := DiaAPagar + cdsAReceberVALOR.AsCurrency;
      TotalAPagar := TotalAPagar + cdsAReceberVALOR.AsCurrency;
    end
  else
    begin
      DiaPago   := DiaPago + cdsAReceberPAGO.AsCurrency;
      TotalPago := TotalPago + cdsAReceberPAGO.AsCurrency;
    end;

end;

procedure TfqrFIN_AReceber.QRLabel8Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat(Value, TotalPago);
  TotalPago := 0;
end;

procedure TfqrFIN_AReceber.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, TotalAPagar);
  TotalAPagar := 0;
end;

procedure TfqrFIN_AReceber.QRLabel14Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, DiaAPagar);
  DiaAPagar := 0;
end;

procedure TfqrFIN_AReceber.QRLabel15Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, DiaPago);
  DiaPago := 0;
end;

procedure TfqrFIN_AReceber.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := (QRGroup1.Expression <> 'TRUE');
end;

end.





