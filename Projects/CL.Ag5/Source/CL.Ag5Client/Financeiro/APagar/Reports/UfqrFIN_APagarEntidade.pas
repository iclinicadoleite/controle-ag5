unit UfqrFIN_APagarEntidade;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, QRCtrls, QuickRpt, VCL.ExtCtrls, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  UfqrSYS_BaseReport, jpeg, QRPDF995Suppl, MailSuppl, DateSuppl, DateUtils,
  UfdrFIN_APagarEntidade, SysReportTypes, ReportTypes, Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_APagar ;

  TSpecificReportDialog = TfdrFIN_APagarEntidade ;

  TfqrFIN_APagarEntidade = class(TfqrSYS_BaseReport)
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
    cdsFIN_Apagar: TClientDataSet;
    dspFIN_APAGAR: TDataSetProvider;
    cdsFIN_ApagarKFIN_APAGAR: TStringField;
    cdsFIN_ApagarHISTORICO: TStringField;
    cdsFIN_ApagarENTIDADE: TStringField;
    cdsFIN_ApagarDOCUMENTO: TStringField;
    cdsFIN_ApagarKFIN_APAGAR_PARCELA: TStringField;
    cdsFIN_ApagarNOMECONTA: TStringField;
    QRLabel14: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    sqlFIN_APagar: TTcSQLDataSet;
    sqlFIN_APagarKFIN_APAGAR: TStringField;
    sqlFIN_APagarHISTORICO: TStringField;
    sqlFIN_APagarENTIDADE: TStringField;
    sqlFIN_APagarDOCUMENTO: TStringField;
    sqlFIN_APagarKFIN_APAGAR_PARCELA: TStringField;
    sqlFIN_APagarVENCTO: TSQLTimeStampField;
    sqlFIN_APagarVALOR: TFloatField;
    sqlFIN_APagarPAGTO: TSQLTimeStampField;
    sqlFIN_APagarPAGO: TFloatField;
    sqlFIN_APagarPREVISAO: TStringField;
    sqlFIN_APagarNOMECONTA: TStringField;
    cdsFIN_ApagarVENCTO: TSQLTimeStampField;
    cdsFIN_ApagarPAGTO: TSQLTimeStampField;
    cdsFIN_ApagarPREVISAO: TStringField;
    cdsFIN_ApagarVALOR: TFloatField;
    cdsFIN_ApagarPAGO: TFloatField;
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

class function TfqrFIN_APagarEntidade.GetDialogClass : IReportDialog ;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TfqrFIN_APagarEntidade.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TfqrFIN_APagarEntidade.Initialize;
begin
  cdsFIN_APAGAR.Close;

  with TSpecificReportParams ( Parameters ), cdsFIN_APAGAR.Params do
    begin
      if Trim ( KCAD_Entidade ) <> '' then
        begin
          sqlFIN_APAGAR.CommandText := Format( sqlFIN_APAGAR.CommandText,
                                              ['  AND A.KCAD_ENTIDADE = :KCAD_ENTIDADE' +
                                               '  AND P.VENCTO BETWEEN :DATAINI AND :DATAFIM' ] );
          sqlFIN_APAGAR.ParamByName('KCAD_ENTIDADE').AsString   := KCAD_ENTIDADE ;
         end
      else
        sqlFIN_APAGAR.CommandText := Format( sqlFIN_APAGAR.CommandText,
                                             ['  AND P.VENCTO BETWEEN :DATAINI AND :DATAFIM' ] );

      sqlFIN_APAGAR.ParamByName( 'DATAINI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp( StartDate ) ;
      sqlFIN_APAGAR.ParamByName( 'DATAFIM' ).asSQLTimeStamp := DateTimeToSQLTimeStamP( EndDate   )  ;
    end ;

  cdsFIN_APAGAR.Open;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToLisA.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;


end;

procedure TfqrFIN_APagarEntidade.FormCreate(Sender: TObject);
begin
  nBand := 0;
  Total := 0;
  TotalGeral := 0;
end;


procedure TfqrFIN_APagarEntidade.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00EFEFEF;
  Inc(nBand);

  Total      := Total      + cdsFIN_APAGARVALOR.AsCurrency;
  TotalGeral := TotalGeral + cdsFIN_APAGARVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarEntidade.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, TotalGeral);
  TotalGeral := 0;
end;

procedure TfqrFIN_APagarEntidade.QRLabel14Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, Total);
  Total := 0;
end;

end.



