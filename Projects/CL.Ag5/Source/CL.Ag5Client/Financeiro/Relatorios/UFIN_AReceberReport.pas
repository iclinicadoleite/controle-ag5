unit UFIN_AReceberReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Data.SQLTimSt, QRCtrls, QuickRpt, VCL.ExtCtrls, Datasnap.Provider,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, jpeg, QRPDF995Suppl, MailSuppl, DateSuppl, DateUtils,
  UfqrSYS_BaseReport, SysReportTypes, SysWizardReportDialog, ReportTypes, UFIN_ContasAReceberReportDataModule,
  System.Actions, Vcl.ActnList, Tc.VCL.Application, Wrappers, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_AReceber ;

  TSpecificReportDialog = T_WizardReportDialog ; // substituir pela classe de
                                                 // dialogo do relatorio

  TFIN_AReceberReport = class(TfqrSYS_BaseReport)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
    cdsFIN_AReceber2: TClientDataSet;
    dspFIN_AReceber2: TDataSetProvider;
    cdsFIN_AReceber2HISTORICO: TStringField;
    cdsFIN_AReceber2DOCUMENTO: TStringField;
    cdsFIN_AReceber2VENCTO: TSQLTimeStampField;
    cdsFIN_AReceber2VALOR: TFloatField;
    cdsFIN_AReceber2PREVISAO: TStringField;
    cdsFIN_AReceber2CONTAS: TStringField;
    sqlFIN_AReceber2: TTcSQLDataSet;
    sqlFIN_AReceber2HISTORICO: TStringField;
    sqlFIN_AReceber2NOMEENTIDADE: TStringField;
    sqlFIN_AReceber2DOCUMENTO: TStringField;
    sqlFIN_AReceber2VENCTO: TSQLTimeStampField;
    sqlFIN_AReceber2VALOR: TFloatField;
    sqlFIN_AReceber2CONTA: TStringField;
    sqlFIN_AReceber2PREVISAO: TStringField;
    cdsFIN_AReceber2NOMEENTIDADE: TStringField;
    sqlFIN_AReceber2DATALANCTO: TSQLTimeStampField;
    cdsFIN_AReceber2DATALANCTO: TSQLTimeStampField;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    sqlFIN_AReceber2KFIN_ARECEBER: TStringField;
    sqlFIN_AReceber2KFIN_ARECEBER_PARCELA: TStringField;
    cdsFIN_AReceber2KFIN_ARECEBER: TStringField;
    cdsFIN_AReceber2KFIN_ARECEBER_PARCELA: TStringField;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    sqlFIN_AReceber2PARCELAS: TStringField;
    cdsFIN_AReceber2PARCELAS: TStringField;
    procedure rbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    nBand: Integer;
    DiaAPagar : Currency;
    TotalAPagar : Currency;
    FIN_ContasAReceberReportDataModule: TFIN_ContasAReceberReportDataModule;
  protected
      class Function  GetDialogClass : IReportDialog ; override ;
      class Function  GetParametersClass : TReportParamsClass ; override ;
      procedure Initialize ; override ;
  public
    { Public declarations }
  end;

implementation

uses UDBFinanceiro, MaskUtils;

{$R *.dfm}

class function TFIN_AReceberReport.GetDialogClass : IReportDialog ;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFIN_AReceberReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFIN_AReceberReport.Initialize;
begin
  inherited ;

 // cdsFIN_AReceber.Close;

  with TSpecificReportParams( Parameters ){, cdsFIN_AReceber.Params} do
     begin
       {ParamByName('KSYS$DOMAIN').AsString  := LoggedUser.DomainID;
       ParamByName('TODOS').AsString         := BoolToChar( FTODOS );
       ParamByName('KCAD_ENTIDADE').AsString := KCAD_ENTIDADE;
       ParamByName('DATAINI').AsSQLTimeStamp := DateTimeToSQLTimeStamp( StartDate ) ;
       ParamByName('DATAFIM').AsSQLTimeStamp := DateTimeToSQLTimeStamp( EndDate );}
       FIN_ContasAReceberReportDataModule:= TFIN_ContasAReceberReportDataModule( FDataModule );

       //QuickRep.ReportTitle := QuickRep.ReportTitle + ' - ' +
       //_qrlDescricao.Caption := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate, EndDate ) ;
       if Assigned (Parameters) and (Parameters.Description <> '') then
          _qrlDescricao.Caption := Parameters.Description;

           {
        else If KCAD_ENTIDADE <> 0 then
          begin
            sqlFIN_APAGAR.CommandText := Format( sqlFIN_APAGAR.CommandText, ['and ' + Filtro + ' = :KCAD_ENTIDADE',Ordem] );
            sqlFIN_APAGAR.ParamByName('KCAD_ENTIDADE').AsInteger := KCAD_ENTIDADE;
           end
        else
          sqlFIN_APAGAR.CommandText := Format( sqlFIN_APAGAR.CommandText, ['',Ordem] );
          }

       //QRGroup1.Expression := 'cdsFIN_ARECEBER.VENCTO'
       QRGroup1.Expression := 'FIN_ContasAReceberReportDataModule.cdsFIN_ARECEBER.VENCTO'
  end ;

 // cdsFIN_AReceber.Open;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;

end;

procedure TFIN_AReceberReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  nBand := 0;
  DiaAPagar := 0;
  TotalAPagar := 0;
end;

procedure TFIN_AReceberReport.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//procedure TfqrFIN_APagar.OpenQuery(dIni, dFim: TDate; MostrarPagos: Boolean; KCAD_ENTIDADES: Integer=0);

  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

  DiaAPagar   := DiaAPagar + FIN_ContasAReceberReportDataModule.cdsFIN_AReceberVALOR.AsCurrency;
  TotalAPagar := TotalAPagar + FIN_ContasAReceberReportDataModule.cdsFIN_AReceberVALOR.AsCurrency;
end;

procedure TFIN_AReceberReport.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value       := '' ;
  Value       := FormatFloat( '#,0.00', TotalAPagar ) ;
  TotalAPagar := 0 ;
end;

procedure TFIN_AReceberReport.QRLabel14Print(sender: TObject; var Value: String);
begin
  Value     := '' ;
  Value     := FormatFloat( '#,0.00', DiaAPagar ) ;
  DiaAPagar := 0 ;
end;

procedure TFIN_AReceberReport.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := ( QRGroup1.Expression <> 'TRUE' ) ;
end;

end.

