unit UfqrFIN_AReceberAtraso;

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

  TfqrFIN_AReceberAtraso = class(TfqrSYS_BaseReport)
    QRLabel1: TQRLabel;
    Descricao: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand7: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel14: TQRLabel;
    cdsFIN_AReceber: TClientDataSet;
    dspFIN_AReceber: TDataSetProvider;
    sqlFIN_AReceber: TTcSQLDataSet;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    sqlFIN_AReceberKFIN_ARECEBER: TStringField;
    sqlFIN_AReceberHISTORICO: TStringField;
    sqlFIN_AReceberDATALANCTO: TSQLTimeStampField;
    sqlFIN_AReceberKFIN_ARECEBER_PARCELA: TStringField;
    sqlFIN_AReceberDOCUMENTO: TStringField;
    sqlFIN_AReceberVENCTO: TSQLTimeStampField;
    sqlFIN_AReceberVALOR: TFloatField;
    sqlFIN_AReceberPAGTO: TSQLTimeStampField;
    sqlFIN_AReceberPREVISAO: TStringField;
    sqlFIN_AReceberCONTA: TStringField;
    cdsFIN_AReceberKFIN_ARECEBER: TStringField;
    cdsFIN_AReceberHISTORICO: TStringField;
    cdsFIN_AReceberDATALANCTO: TSQLTimeStampField;
    cdsFIN_AReceberKFIN_ARECEBER_PARCELA: TStringField;
    cdsFIN_AReceberDOCUMENTO: TStringField;
    cdsFIN_AReceberVENCTO: TSQLTimeStampField;
    cdsFIN_AReceberVALOR: TFloatField;
    cdsFIN_AReceberPAGTO: TSQLTimeStampField;
    cdsFIN_AReceberPREVISAO: TStringField;
    cdsFIN_AReceberCONTA: TStringField;
    procedure rbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure cdsFIN_AReceberBeforeOpen(DataSet: TDataSet);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    nBand: Integer;
//    DiaAReceber : Currency;
    TotalAReceber : Currency;
  protected
      class Function  GetDialogClass : IReportDialog ; override ;
      class Function  GetParametersClass : TReportParamsClass ; override ;
      procedure Initialize  ; override ;
  public
    { Public declarations }
  end;

implementation

uses UDBFinanceiro, MaskUtils;

{$R *.dfm}

procedure TfqrFIN_AReceberAtraso.cdsFIN_AReceberBeforeOpen(DataSet: TDataSet);
begin
  cdsFIN_AReceber.Params.ParamByName('KSYS$DOMAIN').AsString := LoggedUser.DomainID ;
  inherited;
end;

class function TfqrFIN_AReceberAtraso.GetDialogClass : IReportDialog ;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TfqrFIN_AReceberAtraso.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TfqrFIN_AReceberAtraso.Initialize;
begin
  inherited ;

  cdsFIN_AReceber.Close;

  with TSpecificReportParams( Parameters ) do
     begin
       QuickRep.ReportTitle := QuickRep.ReportTitle + ' - ' + DateSuppl.TDateSuppl.GetStringPeriodo( Date ) ;
           {
        else If KCAD_ENTIDADE <> 0 then
          begin
            sqlFIN_AReceber.CommandText := Format( sqlFIN_AReceber.CommandText, ['and ' + Filtro + ' = :KCAD_ENTIDADE',Ordem] );
            sqlFIN_AReceber.ParamByName('KCAD_ENTIDADE').AsInteger := KCAD_ENTIDADE;
           end
        else
          sqlFIN_AReceber.CommandText := Format( sqlFIN_AReceber.CommandText, ['',Ordem] );
          }

       QRGroup1.Expression := 'cdsFIN_AReceber.VENCTO'
  end ;

  cdsFIN_AReceber.Open;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;
end;

procedure TfqrFIN_AReceberAtraso.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  nBand := 0;
//  DiaAReceber := 0;
  TotalAReceber := 0;
end;

procedure TfqrFIN_AReceberAtraso.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//procedure TfqrFIN_AReceber.OpenQuery(dIni, dFim: TDate; MostrarPagos: Boolean; KCAD_ENTIDADES: Integer=0);

  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

//  DiaAReceber   := DiaAReceber + cdsFIN_AReceberVALOR.AsCurrency;
  TotalAreceber := TotalAReceber + cdsFIN_AReceberVALOR.AsCurrency;
end;

procedure TfqrFIN_AReceberAtraso.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel10.Caption := FormatFloat( QRLabel10.Caption, TotalAReceber );
  inherited;
end;

procedure TfqrFIN_AReceberAtraso.QRLabel14Print(sender: TObject; var Value: String);
begin
//  Value := FormatFloat(Value, DiaAReceber);
//  DiaAReceber := 0;
end;

procedure TfqrFIN_AReceberAtraso.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := (QRGroup1.Expression <> 'TRUE');
end;

end.

