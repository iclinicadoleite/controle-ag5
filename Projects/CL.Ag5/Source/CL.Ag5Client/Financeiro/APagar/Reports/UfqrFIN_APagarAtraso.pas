unit UfqrFIN_APagarAtraso;

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

  TfqrFIN_APagarAtraso = class(TfqrSYS_BaseReport)
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand7: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel14: TQRLabel;
    cdsFIN_APAGAR: TClientDataSet;
    dspFIN_APAGAR: TDataSetProvider;
    sqlFIN_APAGAR: TTcSQLDataSet;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    Descriçlão: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    sqlFIN_APAGARKFIN_APAGAR: TStringField;
    sqlFIN_APAGARHISTORICO: TStringField;
    sqlFIN_APAGARDATALANCTO: TSQLTimeStampField;
    sqlFIN_APAGARKFIN_APAGAR_PARCELA: TStringField;
    sqlFIN_APAGARDOCUMENTO: TStringField;
    sqlFIN_APAGARVENCTO: TSQLTimeStampField;
    sqlFIN_APAGARVALOR: TFloatField;
    sqlFIN_APAGARPAGTO: TSQLTimeStampField;
    sqlFIN_APAGARPREVISAO: TStringField;
    sqlFIN_APAGARCONTA: TStringField;
    cdsFIN_APAGARKFIN_APAGAR: TStringField;
    cdsFIN_APAGARHISTORICO: TStringField;
    cdsFIN_APAGARDATALANCTO: TSQLTimeStampField;
    cdsFIN_APAGARKFIN_APAGAR_PARCELA: TStringField;
    cdsFIN_APAGARDOCUMENTO: TStringField;
    cdsFIN_APAGARVENCTO: TSQLTimeStampField;
    cdsFIN_APAGARVALOR: TFloatField;
    cdsFIN_APAGARPAGTO: TSQLTimeStampField;
    cdsFIN_APAGARPREVISAO: TStringField;
    cdsFIN_APAGARCONTA: TStringField;
    procedure rbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure cdsFIN_APAGARBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    nBand: Integer;
//    DiaAPagar : Currency;
    TotalAPagar : Currency;
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

procedure TfqrFIN_APagarAtraso.cdsFIN_APAGARBeforeOpen(DataSet: TDataSet);
begin
  cdsFIN_APAGAR.Params.ParamByName('KSYS$DOMAIN').AsString := LoggedUser.DomainID ;
  inherited;
end;

class function TfqrFIN_APagarAtraso.GetDialogClass : IReportDialog ;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TfqrFIN_APagarAtraso.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TfqrFIN_APagarAtraso.Initialize;
begin
  inherited ;

  cdsFIN_APAGAR.Close;

  with TSpecificReportParams( Parameters ) do
     begin

       //QuickRep.ReportTitle := QuickRep.ReportTitle + ' - ' +
       _qrlDescricao.Caption := 'até ' + DateSuppl.TDateSuppl.GetStringPeriodo( Date ) ;

           {
        else If KCAD_ENTIDADE <> 0 then
          begin
            sqlFIN_APAGAR.CommandText := Format( sqlFIN_APAGAR.CommandText, ['and ' + Filtro + ' = :KCAD_ENTIDADE',Ordem] );
            sqlFIN_APAGAR.ParamByName('KCAD_ENTIDADE').AsInteger := KCAD_ENTIDADE;
           end
        else
          sqlFIN_APAGAR.CommandText := Format( sqlFIN_APAGAR.CommandText, ['',Ordem] );
          }

       QRGroup1.Expression := 'cdsFIN_APAGAR.VENCTO'
  end ;

  cdsFIN_APAGAR.Open;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;

end;

procedure TfqrFIN_APagarAtraso.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  nBand := 0;
//  DiaAPagar := 0;
  TotalAPagar := 0;
end;

procedure TfqrFIN_APagarAtraso.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//procedure TfqrFIN_APagar.OpenQuery(dIni, dFim: TDate; MostrarPagos: Boolean; KCAD_ENTIDADES: Integer=0);

  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

//  DiaAPagar   := DiaAPagar + cdsFIN_APAGARVALOR.AsCurrency;
  TotalAPagar := TotalAPagar + cdsFIN_APAGARVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarAtraso.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, TotalAPagar);
  TotalAPagar := 0;
end;

procedure TfqrFIN_APagarAtraso.QRLabel14Print(sender: TObject; var Value: String);
begin
//  Value := FormatFloat(Value, DiaAPagar);
//  DiaAPagar := 0;
end;

procedure TfqrFIN_APagarAtraso.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := (QRGroup1.Expression <> 'TRUE');
end;

end.

