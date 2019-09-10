unit UEST_ServicosReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes, ReportTypes,
  Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsProdutos ;

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TEST_ServicosReport = class(TfqrSYS_BaseReport)
    cdsServico: TClientDataSet;
    dspServico: TDataSetProvider;
    sqlServico: TTcSQLDataSet;
    sqlServicoCODIGO: TStringField;
    sqlServicoNOME: TStringField;
    sqlServicoDESCRICAO: TMemoField;
    sqlServicoULTIMO_FORNECEDOR: TStringField;
    sqlServicoQTDE_PRODUTO: TFloatField;
    sqlServicoCUSTO_MEDIO: TFloatField;
    sqlServicoTOTAL: TFloatField;
    sqlServicoBAIXA_ESTOQUE: TStringField;
    sqlServicoQTDE_MINIMA: TFloatField;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    sqlServicoUNIDADE: TStringField;
    cdsServicoCODIGO: TStringField;
    cdsServicoNOME: TStringField;
    cdsServicoDESCRICAO: TMemoField;
    cdsServicoULTIMO_FORNECEDOR: TStringField;
    cdsServicoQTDE_PRODUTO: TFloatField;
    cdsServicoUNIDADE: TStringField;
    cdsServicoCUSTO_MEDIO: TFloatField;
    cdsServicoTOTAL: TFloatField;
    cdsServicoBAIXA_ESTOQUE: TStringField;
    cdsServicoQTDE_MINIMA: TFloatField;
    procedure cdsServicoBAIXA_ESTOQUEGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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


procedure TEST_ServicosReport.cdsServicoBAIXA_ESTOQUEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    if Sender.DataSet.FieldByName( 'BAIXA_ESTOQUE' ).asString = 'T' then
      Text := 'Sim'
    else
      Text := 'Não';
end;

class function TEST_ServicosReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TEST_ServicosReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TEST_ServicosReport.Initialize;
begin
  inherited;

  with TSpecificReportParams ( Parameters ), cdsServico.Params do
    begin
      if (IS_PRODUTO = 'T') and (IS_INSUMO = 'F')then
        Caption := 'Relação de Produtos';

      if (IS_PRODUTO = 'F') and (IS_INSUMO = 'T')then
        Caption := 'Relação de Insumos';

      if (IS_PRODUTO = 'T') and (IS_INSUMO = 'T')then
        Caption := 'Relação de Produtos/Insumos';

      if (IS_SERVICO = 'T') then
        Caption := 'Relação de Serviços';

      ParamByName( 'KSYS$DOMAIN' ).AsString := KSYS_DOMAIN ;
      ParamByName( 'IS_PRODUTO' ).AsString   := IS_PRODUTO;
      ParamByName( 'IS_INSUMO' ).AsString    := IS_INSUMO;
      ParamByName( 'IS_SERVICO' ).AsString   := IS_SERVICO;
      ParamByName( 'DSP_INATIVO' ).AsString  := ATIVO;
    end ;

  cdsServico.Open ;

//  with TMailSuppl.GlobalMail do
//     begin
//       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
//       Message := 'Segue em Anexo ... ' ;
//     end ;
end;

end.
