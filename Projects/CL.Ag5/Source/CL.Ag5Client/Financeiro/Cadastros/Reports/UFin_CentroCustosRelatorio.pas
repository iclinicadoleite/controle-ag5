unit UFin_CentroCustosRelatorio;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes,
  ReportTypes,
  CLAg5Types, Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsCentroCustos ;

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TFin_CentroCustosReport = class(TfqrSYS_BaseReport)
    cdsCentroCustos: TClientDataSet;
    dspCentroCustos: TDataSetProvider;
    sqlCentroCustos: TTcSQLDataSet;
    sqlCentroCustosCODIGO: TIntegerField;
    sqlCentroCustosCLASSIFICACAO: TStringField;
    sqlCentroCustosNOME: TStringField;
    sqlCentroCustosATIVO: TStringField;
    sqlCentroCustosANALITICO_SINTETICO: TStringField;
    sqlCentroCustosDATA_ENCERRAMENTO: TSQLTimeStampField;
    sqlCentroCustosSYSDI: TSQLTimeStampField;
    cdsCentroCustosCODIGO: TIntegerField;
    cdsCentroCustosCLASSIFICACAO: TStringField;
    cdsCentroCustosNOME: TStringField;
    cdsCentroCustosATIVO: TStringField;
    cdsCentroCustosANALITICO_SINTETICO: TStringField;
    cdsCentroCustosDATA_ENCERRAMENTO: TSQLTimeStampField;
    cdsCentroCustosSYSDI: TSQLTimeStampField;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    procedure cdsCentroCustosCLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsCentroCustosATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsCentroCustosANALITICO_SINTETICOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

uses UDBFinanceiro;

{$R *.dfm}

{ TfqrCustomReport }

procedure TFin_CentroCustosReport.cdsCentroCustosANALITICO_SINTETICOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'ANALITICO_SINTETICO' ).asString = 'A' then
      Text := 'Analítica'
    else
      Text := 'Sintética';
end;

procedure TFin_CentroCustosReport.cdsCentroCustosATIVOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'ATIVO' ).asString = 'T' then
      Text := 'Ativo'
    else
      Text := 'Inativo';
end;

procedure TFin_CentroCustosReport.cdsCentroCustosCLASSIFICACAOGetText(Sender: TField; var Text: string;
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

class function TFin_CentroCustosReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFin_CentroCustosReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFin_CentroCustosReport.Initialize;
begin
  inherited;
  Fmask := _ST_CENTROS_CUSTO_MASK ;

  with TSpecificReportParams ( Parameters ), cdsCentroCustos.Params do
     begin
       ParamByName( 'KSYS$DOMAIN'  ).AsString := KSYS_DOMAIN ;
       ParamByName( 'CENTRO' ).AsString       := CENTRO;
     end ;

  cdsCentroCustos.Open ;

//  with TMailSuppl.GlobalMail do
//     begin
//       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
//       Message := 'Segue em Anexo ... ' ;
//     end ;

end;

end.
