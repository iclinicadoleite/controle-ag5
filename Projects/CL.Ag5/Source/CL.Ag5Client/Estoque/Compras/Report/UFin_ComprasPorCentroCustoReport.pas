// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Compras por centro de custo
//
// License      : veja readme.txt





unit UFin_ComprasPorCentroCustoReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysReportTypes, ReportTypes,
  UFin_ComprasPorCentroCustoDialog, Wrappers, System.Actions, Vcl.ActnList,
  Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsCOMPRAS_Periodo ;

  TSpecificReportDialog = TFin_ComprasPorCentroCustoDialog ;

  TFin_ComprasPorCentroCustoReport = class(TfqrSYS_BaseReport)
    cdsNotas: TClientDataSet;
    sqlNotas: TTcSQLDataSet;
    sqlItens: TTcSQLDataSet;
    dtsNotas: TDataSource;
    cdsItens: TClientDataSet;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    sqlItensCODIGO: TStringField;
    sqlItensNOME: TStringField;
    sqlItensCUSTO: TFloatField;
    sqlItensQTDE: TFloatField;
    sqlItensPORCENTAGEM: TFloatField;
    sqlItensTOTAL: TFloatField;
    sqlItensCONTACONTABIL: TStringField;
    sqlItensCENTROCUSTO: TStringField;
    QRLabel8: TQRLabel;
    sqlNotasNOMEENTIDADE: TStringField;
    sqlNotasNOTA_FISCAL: TStringField;
    sqlNotasSERIE: TStringField;
    sqlNotasDATA_EMISSAO: TSQLTimeStampField;
    sqlNotasTOTAL_NOTA: TFloatField;
    sqlNotasOBS: TMemoField;
    cdsNotasNOMEENTIDADE: TStringField;
    cdsNotasNOTA_FISCAL: TStringField;
    cdsNotasSERIE: TStringField;
    cdsNotasDATA_EMISSAO: TSQLTimeStampField;
    cdsNotasTOTAL_NOTA: TFloatField;
    cdsNotasOBS: TMemoField;
    cdsItensCODIGO: TStringField;
    cdsItensNOME: TStringField;
    cdsItensCUSTO: TFloatField;
    cdsItensQTDE: TFloatField;
    cdsItensPORCENTAGEM: TFloatField;
    cdsItensTOTAL: TFloatField;
    cdsItensCONTACONTABIL: TStringField;
    cdsItensCENTROCUSTO: TStringField;
    sqlNotasKCMP_PEDIDO: TStringField;
    cdsNotasKCMP_PEDIDO: TStringField;
    sqlItensKCMP_PEDIDO: TStringField;
    cdsItensKCMP_PEDIDO: TStringField;
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    dspNotas: TDataSetProvider;
    cdsNotassqlItens: TDataSetField;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    FTotal : Currency ;
  protected
    class Function GetDialogClass : IReportDialog ; override ;
    class Function GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;

implementation

uses UDBFinanceiro, SqlTimSt ;

{$R *.dfm}

{ TfqrCustomReport }

class function TFin_ComprasPorCentroCustoReport.GetDialogClass: IReportDialog ;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFin_ComprasPorCentroCustoReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFin_ComprasPorCentroCustoReport.Initialize;
begin
  with TSpecificReportParams ( Parameters ), cdsNotas.Params do
    begin
      QuickRep.ReportTitle := ReportTitle;

      ParamByName( 'KSYS$DOMAIN' ).AsString    := LoggedUser.DomainID ;
      ParamByName( 'DATAINI' ).asSQLTimeStamp   := DateTimeToSQLTimeStamp( StartDate ) ;
      ParamByName( 'DATAFIM' ).asSQLTimeStamp   := DateTimeToSQLTimeStamp( EndDate ) ;
      ParamByName( 'TODOS' ).AsString           := BoolToChar( TODOS_ENTIDADE ) ;
      ParamByName( 'KCAD_ENTIDADE' ).AsString   := KCAD_ENTIDADE ;
      ParamByName( 'TODASCONTAS' ).AsString     := BoolToChar( TodasContas ) ;
      ParamByName( 'KFIN_PLANOCONTA' ).AsString := KFIN_PLANOCONTA ;

      sqlItens.Params.ParamByName( 'TODOSCENTROS' ).AsString      := BoolToChar( TodosCentros ) ;
      sqlItens.Params.ParamByName( 'KFIN_CENTROCUSTO' ).AsString  := KFIN_CENTROCUSTO ;

      _qrlDescricao.Caption  := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate , EndDate ) ;
    end ;

  cdsNotas.Open;

  with TMailSuppl.GlobalMail do
    begin
      Clear ;
      //ToList.Add ( cdsMasterEmail.asString ) ;
      Message := 'Segue em Anexo ... ' ;
    end ;
end;

procedure TFin_ComprasPorCentroCustoReport.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  FTotal := 0 ;
end;

procedure TFin_ComprasPorCentroCustoReport.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  FTotal := FTotal + cdsNotasTOTAL_NOTA.AsCurrency ;
end;

procedure TFin_ComprasPorCentroCustoReport.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLabel9.Caption := '' ;
  QRLabel9.Caption := FormatFloat(  '#,0.00', FTotal ) ;
end;

end.
