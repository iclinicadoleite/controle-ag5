unit UCAD_EntidadesReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes,
  ReportTypes, grimgctrl, UCAD_EntidadesReportDialog, // <=== inclui a unit do dialogo
  Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr;

type

  TSpecificReportParams = ReportTypes.TReportParamsEntidades ;

  TSpecificReportDialog = TCAD_EntidadesReportDialog ;  // substituir pela classe de
                                                       // dialogo do relatorio

  TqrCAD_EntidadesReport = class(TfqrSYS_BaseReport)
    dspEntidade: TDataSetProvider;
    dtsEntidades: TDataSource;
    qrsEnderecos: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    cdsEntidade: TClientDataSet;
    cdsEndereco: TClientDataSet;
    cdsEnderecoKGLB_ENDERECO: TStringField;
    cdsEnderecoENDERECO: TStringField;
    cdsEnderecoNUMERO: TStringField;
    cdsEnderecoCOMPLEMENTO: TStringField;
    cdsEnderecoBAIRRO: TStringField;
    cdsEnderecoCEP: TStringField;
    cdsEnderecoCIDADE: TStringField;
    cdsEnderecoUF: TStringField;
    cdsEnderecoCXPOSTAL: TStringField;
    cdsEnderecoCONTATO: TStringField;
    cdsEnderecoFONE: TStringField;
    sqlEntidade: TTcSQLDataSet;
    sqlEndereco: TTcSQLDataSet;
    sqlEnderecoKGLB_ENDERECO: TStringField;
    sqlEnderecoENDERECO: TStringField;
    sqlEnderecoNUMERO: TStringField;
    sqlEnderecoCOMPLEMENTO: TStringField;
    sqlEnderecoBAIRRO: TStringField;
    sqlEnderecoCEP: TStringField;
    sqlEnderecoCIDADE: TStringField;
    sqlEnderecoUF: TStringField;
    sqlEnderecoCXPOSTAL: TStringField;
    sqlEnderecoCONTATO: TStringField;
    sqlEnderecoFONE: TStringField;
    sqlEntidadeKCAD_ENTIDADE: TStringField;
    sqlEntidadeCODIGO: TStringField;
    sqlEntidadeATIVO: TStringField;
    sqlEntidadeAPELIDO: TStringField;
    sqlEntidadeNOME: TStringField;
    sqlEntidadeCPF_CNPJ: TStringField;
    sqlEntidadePESSOA: TStringField;
    sqlEntidadeGRUPO: TStringField;
    sqlEntidadeFONE: TStringField;
    sqlEntidadeFAX: TStringField;
    sqlEntidadeKENDERECO: TStringField;
    cdsEntidadeKCAD_ENTIDADE: TStringField;
    cdsEntidadeCODIGO: TStringField;
    cdsEntidadeATIVO: TStringField;
    cdsEntidadeAPELIDO: TStringField;
    cdsEntidadeNOME: TStringField;
    cdsEntidadeCPF_CNPJ: TStringField;
    cdsEntidadePESSOA: TStringField;
    cdsEntidadeGRUPO: TStringField;
    cdsEntidadeFONE: TStringField;
    cdsEntidadeFAX: TStringField;
    cdsEntidadeKENDERECO: TStringField;
    qrlGrupo: TQRLabel;
    qrDBGrupo: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    cdsEntidadesqlEndereco: TDataSetField;
    QRHRule2: TQRHRule;
    procedure cdsEntidadeATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsEntidadePESSOAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  protected
    { Protected declarations }
    class Function GetDialogClass : IReportDialog ; override ;
    class Function GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;

implementation

uses UDBEntidades;

{$R *.dfm}

{ TfqrCustomReport }

procedure TqrCAD_EntidadesReport.cdsEntidadeATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'ATIVO' ).asString = 'F' then
      Text := 'Inativo'
    else
      Text := 'Ativo';
end;

procedure TqrCAD_EntidadesReport.cdsEntidadePESSOAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'PESSOA' ).asString = 'F' then
      Text := 'Física'
    else
      Text := 'Jurídica';
end;

class function TqrCAD_EntidadesReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TqrCAD_EntidadesReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TqrCAD_EntidadesReport.Initialize;
begin
//  inherited;
  with TSpecificReportParams ( Parameters ), cdsEntidade.Params do
    begin
      QuickRep.ReportTitle := ReportTitle ;

      if IS_CLIENTE = 'T' then
        Caption := 'Lista de Clientes';

      if IS_FORENECEDOR = 'T' then
        begin
        Caption := 'Lista de Fornecedores';
        qrlGrupo.Enabled := False ;
        qrDBGrupo.Enabled := False ;
        end;

      if KCAD_ENTIDADE = '' then
        ParamByName( 'ALL' ).AsString := 'T'
      else
        ParamByName( 'KCAD_ENTIDADE' ).AsString := KCAD_ENTIDADE ;

      ParamByName( 'DSP_CLIENTE' ).AsString    := IS_CLIENTE ;
      ParamByName( 'DSP_FORNECEDOR' ).AsString := IS_FORENECEDOR ;
      ParamByName( 'DSP_INATIVO' ).AsString    := ATIVO ;
      ParamByName( 'POR_GRUPO' ).AsString      := POR_GRUPO ;
      ParamByName( 'GRUPO' ).AsString          := GRUPO ;
    end ;

  cdsEntidade.Open ;
end;

procedure TqrCAD_EntidadesReport.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if cdsEntidadePESSOA.AsString = 'F' then
    begin
      QRLabel2.Caption := 'Nome:';
      QRLabel4.Caption := 'Apelido:';
      QRLabel6.Caption := 'CPF:';
    end;
  inherited;
end;

end.
