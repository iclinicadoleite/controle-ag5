unit UCAD_PatrimonioReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes, ReportTypes,
  System.Actions, Vcl.ActnList, Tc.VCL.Application, Wrappers, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsPatrimonio;

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TqrCAD_PatrimonioReport = class(TfqrSYS_BaseReport)
    cdsPatrimonio: TClientDataSet;
    dspPatrimonio: TDataSetProvider;
    sqlPatrimonio: TTcSQLDataSet;
    sqlDepreciacao: TTcSQLDataSet;
    dtsPatrimonio: TDataSource;
    cdsDepreciacao: TClientDataSet;
    sqlPatrimonioKCAD_PATRIMONIO: TStringField;
    sqlPatrimonioCODIGO: TStringField;
    sqlPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField;
    sqlPatrimonioDESCRICAO: TStringField;
    sqlPatrimonioQUANTIDADE: TIntegerField;
    sqlPatrimonioVALOR_UNITARIO: TFloatField;
    sqlPatrimonioVALOR_FINAL: TFloatField;
    sqlPatrimonioVIDA_UTIL: TIntegerField;
    sqlPatrimonioATIVO: TStringField;
    sqlPatrimonioOBS: TMemoField;
    cdsPatrimonioKCAD_PATRIMONIO: TStringField;
    cdsPatrimonioCODIGO: TStringField;
    cdsPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField;
    cdsPatrimonioDESCRICAO: TStringField;
    cdsPatrimonioQUANTIDADE: TIntegerField;
    cdsPatrimonioVALOR_UNITARIO: TFloatField;
    cdsPatrimonioVALOR_FINAL: TFloatField;
    cdsPatrimonioVIDA_UTIL: TIntegerField;
    cdsPatrimonioATIVO: TStringField;
    cdsPatrimonioOBS: TMemoField;
    QRSubDetail1: TQRSubDetail;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    sqlDepreciacaoDATA: TSQLTimeStampField;
    sqlDepreciacaoVALOR: TFloatField;
    sqlDepreciacaoVALOR_DEPRECIACAO: TFloatField;
    sqlDepreciacaoPLANO_CONTA: TStringField;
    sqlDepreciacaoCENTRO_CUSTO: TStringField;
    sqlDepreciacaoPORCENTAGEM: TFloatField;
    cdsDepreciacaoDATA: TSQLTimeStampField;
    cdsDepreciacaoVALOR: TFloatField;
    cdsDepreciacaoVALOR_DEPRECIACAO: TFloatField;
    cdsDepreciacaoPLANO_CONTA: TStringField;
    cdsDepreciacaoCENTRO_CUSTO: TStringField;
    cdsDepreciacaoPORCENTAGEM: TFloatField;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    cdsPatrimoniosqlDepreciacao: TDataSetField;
    QRLabel12: TQRLabel;
    cdsPatrimonioVALOR_TOTAL: TFloatField;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText15: TQRDBText;
    procedure cdsPatrimonioATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPatrimonioCalcFields(DataSet: TDataSet);
  private
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

uses UDBFinanceiro;

{$R *.dfm}

{ TfqrCustomReport }


procedure TqrCAD_PatrimonioReport.cdsPatrimonioATIVOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'ATIVO' ).asString = 'F' then
      Text := 'Inativo'
    else
      Text := 'Ativo';
end;

procedure TqrCAD_PatrimonioReport.cdsPatrimonioCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsPatrimonioVALOR_TOTAL.AsFloat := ( cdsPatrimonioQUANTIDADE.AsFloat * cdsPatrimonioVALOR_UNITARIO.AsFloat );
end;

class function TqrCAD_PatrimonioReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TqrCAD_PatrimonioReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TqrCAD_PatrimonioReport.Initialize;
begin
  with TSpecificReportParams ( Parameters ), cdsPatrimonio.Params do
     begin
      if KCAD_PATRIMONIO = '' then
        ParamByName( 'ALL' ).AsString             := 'T'
      else
        ParamByName( 'KCAD_PATRIMONIO' ).AsString := KCAD_PATRIMONIO ;

      ParamByName( 'KSYS$DOMAIN' ).AsString       := KSYS_DOMAIN ;
      ParamByName( 'DSP_INATIVO' ).AsString       := ATIVO ;
     end ;

  cdsPatrimonio.Open ;

//  with TMailSuppl.GlobalMail do
//     begin
//       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
//       Message := 'Segue em Anexo ... ' ;
//     end ;
end;

end.
