unit UFin_PlanoContasRelatorio;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes,
  ReportTypes,
  CLAg5Types, System.Actions, Vcl.ActnList, Tc.VCL.Application, Wrappers, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsPlanoContas ;

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TFIN_PlanoContasRelatorio = class(TfqrSYS_BaseReport)
    cdsPlanoContas: TClientDataSet;
    dspPlanoContas: TDataSetProvider;
    sqlPlanoContas: TTcSQLDataSet;
    sqlPlanoContasKFIN_PLANOCONTA: TStringField;
    sqlPlanoContasKSYSDOMAIN: TStringField;
    sqlPlanoContasCODIGO: TIntegerField;
    sqlPlanoContasCLASSIFICACAO: TStringField;
    sqlPlanoContasNOME: TStringField;
    sqlPlanoContasATIVO: TStringField;
    sqlPlanoContasANALITICO_SINTETICO: TStringField;
    sqlPlanoContasDEVEDORA_CREDORA: TStringField;
    sqlPlanoContasFLUXOCAIXA: TStringField;
    sqlPlanoContasTIPO_APRD: TStringField;
    sqlPlanoContasFIXA_VARIAVEL: TStringField;
    sqlPlanoContasKMFIN_PLANOCONTA: TStringField;
    sqlPlanoContasKDEF_PLANOCONTA: TStringField;
    cdsPlanoContasKFIN_PLANOCONTA: TStringField;
    cdsPlanoContasKSYSDOMAIN: TStringField;
    cdsPlanoContasCODIGO: TIntegerField;
    cdsPlanoContasCLASSIFICACAO: TStringField;
    cdsPlanoContasNOME: TStringField;
    cdsPlanoContasATIVO: TStringField;
    cdsPlanoContasANALITICO_SINTETICO: TStringField;
    cdsPlanoContasDEVEDORA_CREDORA: TStringField;
    cdsPlanoContasFLUXOCAIXA: TStringField;
    cdsPlanoContasTIPO_APRD: TStringField;
    cdsPlanoContasFIXA_VARIAVEL: TStringField;
    cdsPlanoContasKMFIN_PLANOCONTA: TStringField;
    cdsPlanoContasKDEF_PLANOCONTA: TStringField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    sqlPlanoContasMOVIMENTA_ESTOQUE: TStringField;
    cdsPlanoContasMOVIMENTA_ESTOQUE: TStringField;
    procedure cdsPlanoContasCLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasANALITICO_SINTETICOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasDEVEDORA_CREDORAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasFLUXOCAIXAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasTIPO_APRDGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasFIXA_VARIAVELGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    Fmask : String;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;


implementation

uses UDBFinanceiro,
     CLAg5SvcFinanceiroApropriacao ;


{$R *.dfm}

{ TfqrCustomReport }


procedure TFIN_PlanoContasRelatorio.cdsPlanoContasANALITICO_SINTETICOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'ANALITICO_SINTETICO' ).asString = 'A' then
      Text := 'Analítica'
    else
      Text := 'Sintética';
end;

procedure TFIN_PlanoContasRelatorio.cdsPlanoContasATIVOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'ATIVO' ).asString = 'T' then
      Text := 'Ativa'
    else
      Text := 'Inativa';
end;

procedure TFIN_PlanoContasRelatorio.cdsPlanoContasCLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
var
  aux, codigo : String;
  list : TStringList;
  listMask : TStringList;
  tamanho, i : integer;
begin
  if (DisplayText) then
  begin

    try
      listMask := TStringList.Create;
      listMask.Delimiter := '.';
      listMask.DelimitedText := Fmask;

      list := TStringList.Create;
      list.Delimiter := '.';
      list.DelimitedText := Sender.AsString;

      codigo := '';
      for i := 0 to list.Count - 1 do
      begin
        tamanho := length(listMask[i]);

        aux := '0000000000' + list[i];
        aux := copy(aux,  length(aux)-tamanho+1 , tamanho);

        if codigo = EmptyStr then
          codigo := aux
        else
          codigo := codigo + '.' + aux;
      end;

      Text := codigo;

    except
      Text := Sender.AsString;
    end;
  end;
end;

procedure TFIN_PlanoContasRelatorio.cdsPlanoContasDEVEDORA_CREDORAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'DEVEDORA_CREDORA' ).asString = 'D' then
      Text := 'Devedora'
    else
      Text := 'Credora';
end;

procedure TFIN_PlanoContasRelatorio.cdsPlanoContasFIXA_VARIAVELGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'FIXA_VARIAVEL' ).asString = 'F' then
      Text := 'Fixa'
    else
      Text := 'Variável';
end;

procedure TFIN_PlanoContasRelatorio.cdsPlanoContasFLUXOCAIXAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'FLUXOCAIXA' ).asString = 'T' then
      Text := 'Sim'
    else
      Text := 'Não';
end;

procedure TFIN_PlanoContasRelatorio.cdsPlanoContasTIPO_APRDGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'TIPO_APRD' ).asString = 'A' then
      Text := 'Ativo'
    else if Sender.DataSet.FieldByName ( 'TIPO_APRD' ).asString = 'P' then
      Text := 'Passivo'
    else if Sender.DataSet.FieldByName ( 'TIPO_APRD' ).asString = 'D' then
      Text := 'Despesa'
    else if Sender.DataSet.FieldByName ( 'TIPO_APRD' ).asString = 'R' then
      Text := 'Receita'
    else
      Text := '';
end;

class function TFIN_PlanoContasRelatorio.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFIN_PlanoContasRelatorio.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFIN_PlanoContasRelatorio.Initialize;
begin
  inherited;

  if Assigned ( SvcFinanceiroMascaraPlanoContas ) then
    Fmask :=  SvcFinanceiroMascaraPlanoContas.GetMascara
  else
    Fmask :=  _ST_PLANO_CONTAS_MASK ;

  with TSpecificReportParams ( Parameters ), cdsPlanoContas.Params do
     begin
       ParamByName( 'KSYS$DOMAIN' ).AsString  := KSYS_DOMAIN ;
       ParamByName( 'PLANO' ).AsString        := PLANO;
     end ;

  cdsPlanoContas.Open ;

//  with TMailSuppl.GlobalMail do
//     begin
//       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
//       Message := 'Segue em Anexo ... ' ;
//     end ;
end;

end.
