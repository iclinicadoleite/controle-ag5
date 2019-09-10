unit UfqrFIN_APagar;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Data.SQLTimSt, QRCtrls, QuickRpt, VCL.ExtCtrls, Datasnap.Provider,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, jpeg, QRPDF995Suppl, MailSuppl, DateSuppl, DateUtils,
  UfqrSYS_BaseReport, SysReportTypes, ReportTypes,
  UfdrFIN_APagar, Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_APagar ;
  TSpecificReportDialog = TfdrFIN_APagar ;  // substituir pela classe de
                                            // dialogo do relatorio

  TfqrFIN_APagar = class(TfqrSYS_BaseReport)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand7: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    cdsFIN_APAGAR: TClientDataSet;
    dspFIN_APAGAR: TDataSetProvider;
    cdsFIN_APAGARKFIN_APAGAR: TStringField;
    cdsFIN_APAGARHISTORICO: TStringField;
    cdsFIN_APAGARDOCUMENTO: TStringField;
    cdsFIN_APAGARKFIN_APAGAR_PARCELA: TStringField;
    cdsFIN_APAGARVENCTO: TSQLTimeStampField;
    cdsFIN_APAGARVALOR: TFloatField;
    cdsFIN_APAGARPAGTO: TSQLTimeStampField;
    cdsFIN_APAGARPAGO: TFloatField;
    cdsFIN_APAGARPREVISAO: TStringField;
    cdsFIN_APAGARCONTAS: TStringField;
    sqlFIN_APAGAR: TTcSQLDataSet;
    sqlFIN_APAGARKFIN_APAGAR: TStringField;
    sqlFIN_APAGARHISTORICO: TStringField;
    sqlFIN_APAGARNOMEENTIDADE: TStringField;
    sqlFIN_APAGARDOCUMENTO: TStringField;
    sqlFIN_APAGARKFIN_APAGAR_PARCELA: TStringField;
    sqlFIN_APAGARVENCTO: TSQLTimeStampField;
    sqlFIN_APAGARVALOR: TFloatField;
    sqlFIN_APAGARPAGTO: TSQLTimeStampField;
    sqlFIN_APAGARPAGO: TFloatField;
    sqlFIN_APAGARCONTA: TStringField;
    sqlFIN_APAGARPREVISAO: TStringField;
    cdsFIN_APAGARNOMEENTIDADE: TStringField;
    sqlFIN_APAGARDATALANCTO: TSQLTimeStampField;
    cdsFIN_APAGARDATALANCTO: TSQLTimeStampField;
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
      class Function  GetDialogClass : IReportDialog ; override ;
      class Function  GetParametersClass : TReportParamsClass ; override ;
      procedure Initialize  ; override ;
  public
    { Public declarations }
    class procedure ExecuteDialogPorDocumento;
    class procedure ExecuteDialogPorPagamento;
  end;

implementation

uses UDBFinanceiro, MaskUtils;

{$R *.dfm}

class function TfqrFIN_APagar.GetDialogClass : IReportDialog ;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TfqrFIN_APagar.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TfqrFIN_APagar.Initialize;
begin

  inherited ;

  cdsFIN_APAGAR.Close;


  with TSpecificReportParams( Parameters ) do
     begin
        if Ordem = '' then
          Ordem := 'P.Vencto';

        if Filtro = '' then
          Filtro := 'P.Vencto';

        _qrlDescricao.Caption := '' ;

        if StartDate <> 0 then
          begin
            sqlFIN_APAGAR.CommandText := Format( sqlFIN_APAGAR.CommandText, ['and ' + Filtro + ' Between :DATAINI and :DATAFIM', Ordem] );
            sqlFIN_APAGAR.ParamByName('DATAINI').asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( StartDate ) ) ;
            sqlFIN_APAGAR.ParamByName('DATAFIM').asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( EndDate ) ) ;
            //QuickRep.ReportTitle := QuickRep.ReportTitle + ' - ' +
            _qrlDescricao.Caption := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate , EndDate ) ;
           end
        else If Trim ( KCAD_ENTIDADE ) <> '' then
          begin
            sqlFIN_APAGAR.CommandText := Format( sqlFIN_APAGAR.CommandText, ['and ' + Filtro + ' = :KCAD_ENTIDADE',Ordem] );
            sqlFIN_APAGAR.ParamByName('KCAD_ENTIDADE').asString := KCAD_ENTIDADE;
            _qrlDescricao.Caption := 'da Entidade' ;
           end
        else
          sqlFIN_APAGAR.CommandText := Format( sqlFIN_APAGAR.CommandText, ['',Ordem] );

        If ExibirQuitados then
          begin
              sqlFIN_APAGAR.ParamByName('PAGO').AsInteger := 1 ;
              if _qrlDescricao.Caption = '' then
                  _qrlDescricao.Caption := 'Incluso Quitados'
              else
                  _qrlDescricao.Caption := _qrlDescricao.Caption + '- Incluso Quitados' ;
          end
        else
          sqlFIN_APAGAR.ParamByName('PAGO').AsInteger := 0;

        If Ordem = 'P.Vencto' then
          QRGroup1.Expression := 'cdsFIN_APAGAR.VENCTO'
        Else If Ordem = 'P.Pagto, P.Vencto' then
          QRGroup1.Expression := 'cdsFIN_APAGAR.PAGTO'
        Else
          QRGroup1.Expression := 'TRUE';
  end ;

  cdsFIN_APAGAR.Open;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;

end;

procedure TfqrFIN_APagar.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  nBand := 0;
  DiaAPagar := 0;
  DiaPago := 0;
  TotalAPagar := 0;
  TotalPago := 0;
end;

procedure TfqrFIN_APagar.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//procedure TfqrFIN_APagar.OpenQuery(dIni, dFim: TDate; MostrarPagos: Boolean; KCAD_ENTIDADES: Integer=0);

  If cdsFIN_APAGARPAGTO.IsNull or (TSpecificReportParams ( Parameters ).Filtro <> 'P.Vencto') then
    Sender.Font.Style := Self.Font.Style -[fsStrikeOut]
  else
    Sender.Font.Style := Self.Font.Style +[fsStrikeOut];

  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

  If cdsFIN_APAGARPAGTO.IsNull then
    begin
      DiaAPagar   := DiaAPagar + cdsFIN_APAGARVALOR.AsCurrency;
      TotalAPagar := TotalAPagar + cdsFIN_APAGARVALOR.AsCurrency;
    end
  else
    begin
      DiaPago   := DiaPago + cdsFIN_APAGARPAGO.AsCurrency;
      TotalPago := TotalPago + cdsFIN_APAGARPAGO.AsCurrency;
    end;
end;

procedure TfqrFIN_APagar.QRLabel8Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat(Value, TotalPago);
  TotalPago := 0;
end;

procedure TfqrFIN_APagar.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, TotalAPagar);
  TotalAPagar := 0;
end;

procedure TfqrFIN_APagar.QRLabel14Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, DiaAPagar);
  DiaAPagar := 0;
end;

procedure TfqrFIN_APagar.QRLabel15Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, DiaPago);
  DiaPago := 0;
end;

procedure TfqrFIN_APagar.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := (QRGroup1.Expression <> 'TRUE');
end;

class procedure TfqrFIN_APagar.ExecuteDialogPorDocumento;
var
  Parameters : TReportParamsFIN_APagar ;
begin
  inherited;
  Parameters := TReportParamsFIN_APagar.Create ;

  Parameters.Ordem := 'A.DOCUMENTO';
  TfqrFIN_APagar.ExecuteDialog( Parameters );
  Parameters.Free;

end;

class procedure TfqrFIN_APagar.ExecuteDialogPorPagamento;
var
  Parameters : TReportParamsFIN_APagar ;
begin
  inherited;
  Parameters := TReportParamsFIN_APagar.Create ;

//    frmPeriodo.cbxPagos.Checked := True;
//    frmPeriodo.cbxPagos.Visible := False;
  Parameters.ReportTitle := 'Titulos Pagos';
  Parameters.Ordem := 'P.Pagto, P.Vencto';
  Parameters.Filtro := 'P.Pagto';
  Parameters.ExibirQuitados :=  True ;
  TfqrFIN_APagar.ExecuteDialog ( Parameters ) ;
  Parameters.Free;
end ;

end.

