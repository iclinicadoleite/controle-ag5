unit UfqrFIN_AReceberEntidade;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, QRCtrls, QuickRpt, VCL.ExtCtrls, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  UfqrSYS_BaseReport, jpeg, QRPDF995Suppl, MailSuppl, DateSuppl, DateUtils,
  SysReportTypes, UfdrFIN_AReceberEntidade, ReportTypes, Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_AReceber ;

  TSpecificReportDialog = TfdrFIN_AReceberEntidade ;

  TfqrFIN_AReceberEntidade = class(TfqrSYS_BaseReport)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
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
    QRLabel16: TQRLabel;
    cdsFIN_AReceber: TClientDataSet;
    dspFIN_AReceber: TDataSetProvider;
    cdsFIN_AReceberKFIN_AReceber: TStringField;
    cdsFIN_AReceberHISTORICO: TStringField;
    cdsFIN_AReceberENTIDADE: TStringField;
    cdsFIN_AReceberDOCUMENTO: TStringField;
    cdsFIN_AReceberKFIN_AReceber_PARCELA: TStringField;
    cdsFIN_AReceberNOMECONTA: TStringField;
    QRLabel14: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    sqlFIN_AReceber: TTcSQLDataSet;
    sqlFIN_AReceberKFIN_AReceber: TStringField;
    sqlFIN_AReceberHISTORICO: TStringField;
    sqlFIN_AReceberENTIDADE: TStringField;
    sqlFIN_AReceberDOCUMENTO: TStringField;
    sqlFIN_AReceberKFIN_AReceber_PARCELA: TStringField;
    sqlFIN_AReceberVENCTO: TSQLTimeStampField;
    sqlFIN_AReceberVALOR: TFloatField;
    sqlFIN_AReceberPAGTO: TSQLTimeStampField;
    sqlFIN_AReceberPAGO: TFloatField;
    sqlFIN_AReceberPREVISAO: TStringField;
    sqlFIN_AReceberNOMECONTA: TStringField;
    cdsFIN_AReceberVENCTO: TSQLTimeStampField;
    cdsFIN_AReceberPAGTO: TSQLTimeStampField;
    cdsFIN_AReceberPREVISAO: TStringField;
    cdsFIN_AReceberVALOR: TFloatField;
    cdsFIN_AReceberPAGO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
  private
    nBand: Integer;
    Total: Currency;
    TotalGeral: Currency;
    { Private declarations }
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;

implementation

uses UDBFinanceiro, Data.SQLTimSt, MaskUtils;

{$R *.dfm}

class function TfqrFIN_AReceberEntidade.GetDialogClass : IReportDialog ;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TfqrFIN_AReceberEntidade.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;


procedure TfqrFIN_AReceberEntidade.Initialize;
begin
  cdsFIN_AReceber.Close;

  with TSpecificReportParams ( Parameters ), cdsFIN_AReceber.Params do
    begin
      //ParamByName( 'DATAINICIO' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( DataInicio ) ) ;
      //ParamByName( 'DATAFIM' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( DataFim ) ) ;
      If KCAD_Entidade <> '' then
        begin
          sqlFIN_AReceber.CommandText := Format( sqlFIN_AReceber.CommandText,
                                                 ['  AND A.KCAD_ENTIDADE = :KCAD_ENTIDADE' +
                                                  '  AND P.VENCTO BETWEEN :DATAINI AND :DATAFIM' ] );
          sqlFIN_AReceber.ParamByName( 'KCAD_ENTIDADE' ).asString := KCAD_Entidade ;
        end
      else
        sqlFIN_AReceber.CommandText := Format( sqlFIN_AReceber.CommandText,
                                             ['  AND P.VENCTO BETWEEN :DATAINI AND :DATAFIM' ] );

      sqlFIN_AReceber.ParamByName( 'DATAINI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp( StartDate ) ;
      sqlFIN_AReceber.ParamByName( 'DATAFIM' ).asSQLTimeStamp := DateTimeToSQLTimeStamP( EndDate   )  ;
    end ;

  cdsFIN_AReceber.Open;

  with TMailSuppl.GlobalMail do
    begin
      Clear ;
      //ToLisA.Add ( cdsMasterEmail.asString ) ;
      Message := 'Segue em Anexo ... ' ;
    end ;
end;

procedure TfqrFIN_AReceberEntidade.FormCreate(Sender: TObject);
begin
  nBand := 0;
  Total := 0;
  TotalGeral := 0;
end;

procedure TfqrFIN_AReceberEntidade.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

  Total      := Total      + cdsFIN_AReceberVALOR.AsCurrency;
  TotalGeral := TotalGeral + cdsFIN_AReceberVALOR.AsCurrency;
end;

procedure TfqrFIN_AReceberEntidade.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, TotalGeral);
  TotalGeral := 0;
end;

procedure TfqrFIN_AReceberEntidade.QRLabel14Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, Total);
  Total := 0;
end;

end.



