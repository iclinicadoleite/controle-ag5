unit UFIN_APagarReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Data.SQLTimSt, QRCtrls, QuickRpt, VCL.ExtCtrls, Datasnap.Provider,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, jpeg, QRPDF995Suppl, MailSuppl, DateSuppl, DateUtils,
  UfqrSYS_BaseReport, SysReportTypes, SysWizardReportDialog, ReportTypes, UFIN_ContasAPagarReportDataModule,
  System.Actions, Vcl.ActnList, Tc.VCL.Application, Wrappers, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_APagar ;

  TSpecificReportDialog = T_WizardReportDialog ; // substituir pela classe de
                                                 // dialogo do relatorio

  TFIN_APagarReport = class(TfqrSYS_BaseReport)
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
    cdsFIN_APAGAR2: TClientDataSet;
    dspFIN_APAGAR2: TDataSetProvider;
    cdsFIN_APAGAR2KFIN_APAGAR: TStringField;
    cdsFIN_APAGAR2HISTORICO: TStringField;
    cdsFIN_APAGAR2DOCUMENTO: TStringField;
    cdsFIN_APAGAR2KFIN_APAGAR_PARCELA: TStringField;
    cdsFIN_APAGAR2VENCTO: TSQLTimeStampField;
    cdsFIN_APAGAR2VALOR: TFloatField;
    cdsFIN_APAGAR2PREVISAO: TStringField;
    cdsFIN_APAGAR2CONTAS: TStringField;
    sqlFIN_APAGAR2: TTcSQLDataSet;
    sqlFIN_APAGAR2KFIN_APAGAR: TStringField;
    sqlFIN_APAGAR2HISTORICO: TStringField;
    sqlFIN_APAGAR2NOMEENTIDADE: TStringField;
    sqlFIN_APAGAR2DOCUMENTO: TStringField;
    sqlFIN_APAGAR2KFIN_APAGAR_PARCELA: TStringField;
    sqlFIN_APAGAR2VENCTO: TSQLTimeStampField;
    sqlFIN_APAGAR2VALOR: TFloatField;
    sqlFIN_APAGAR2CONTA: TStringField;
    sqlFIN_APAGAR2PREVISAO: TStringField;
    cdsFIN_APAGAR2NOMEENTIDADE: TStringField;
    sqlFIN_APAGAR2DATALANCTO: TSQLTimeStampField;
    cdsFIN_APAGAR2DATALANCTO: TSQLTimeStampField;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    sqlFIN_APAGAR2PARCELAS: TStringField;
    cdsFIN_APAGAR2PARCELAS: TStringField;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
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
    FIN_ContasAPagarReportDataModule: TFIN_ContasAPagarReportDataModule;
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

class function TFIN_APagarReport.GetDialogClass : IReportDialog ;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFIN_APagarReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFIN_APagarReport.Initialize;
begin
  inherited ;

 // cdsFIN_APAGAR.Close;

  with TSpecificReportParams( Parameters ){, cdsFIN_APAGAR.Params} do
     begin
       FIN_ContasAPagarReportDataModule:= TFIN_ContasAPagarReportDataModule( FDataModule );

       {
       ParamByName('KSYS$DOMAIN').AsString  := LoggedUser.DomainID;
       ParamByName('TODOS').AsString         := BoolToChar( FTODOS );
       ParamByName('KCAD_ENTIDADE').AsString := KCAD_ENTIDADE;
       ParamByName('DATAINI').AsSQLTimeStamp := DateTimeToSQLTimeStamp( StartDate ) ;
       ParamByName('DATAFIM').AsSQLTimeStamp := DateTimeToSQLTimeStamp( EndDate );}

       //QuickRep.ReportTitle := QuickRep.ReportTitle + ' - ' +
       //_qrlDescricao.Caption := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate, EndDate ) ;
       if assigned ( Parameters ) and ( Parameters.Description <> '' ) then
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

       //QRGroup1.Expression := 'cdsFIN_APAGAR.VENCTO'
       QRGroup1.Expression := 'FIN_ContasAPagarReportDataModule.cdsFIN_APAGAR.VENCTO'
  end ;

 // cdsFIN_APAGAR.Open;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;

end;

procedure TFIN_APagarReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  nBand := 0;
  DiaAPagar := 0;
  TotalAPagar := 0;
end;

procedure TFIN_APagarReport.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//procedure TfqrFIN_APagar.OpenQuery(dIni, dFim: TDate; MostrarPagos: Boolean; KCAD_ENTIDADES: Integer=0);

  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

  DiaAPagar   := DiaAPagar + FIN_ContasAPagarReportDataModule.cdsFIN_APAGARVALOR.AsCurrency;
  TotalAPagar := TotalAPagar + FIN_ContasAPagarReportDataModule.cdsFIN_APAGARVALOR.AsCurrency;
end;

procedure TFIN_APagarReport.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value := '' ;
  Value := FormatFloat('#,0.00', TotalAPagar);
  TotalAPagar := 0;
end;

procedure TFIN_APagarReport.QRLabel14Print(sender: TObject; var Value: String);
begin
  Value := '' ;
  Value := FormatFloat('#,0.00', DiaAPagar);
  DiaAPagar := 0;
end;

procedure TFIN_APagarReport.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := ( QRGroup1.Expression <> 'TRUE' ) ;
end;

end.

