// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Vendas por centro de custo
//
// License      : veja readme.txt





unit UFin_VendasPorCentroCustoReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes, ReportTypes,
  UFin_VendasPorCentroCustoDialog, Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsVENDAS_Periodo ;

  TSpecificReportDialog = TFin_VendasPorCentroCustoDialog ;

  TFIN_VendasPorCentroCustoReport = class(TfqrSYS_BaseReport)
    cdsMaster: TClientDataSet;
    dspMaster: TDataSetProvider;
    sqlMaster: TTcSQLDataSet;
    sqlDetalhes: TTcSQLDataSet;
    dtsSQLMaster: TDataSource;
    cdsDetalhes: TClientDataSet;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    sqlMasterKVND_PEDIDO: TStringField;
    sqlMasterNOMEENTIDADE: TStringField;
    sqlMasterNOTA_FISCAL: TStringField;
    sqlMasterSERIE: TStringField;
    sqlMasterDATA_EMISSAO: TSQLTimeStampField;
    sqlMasterTOTAL_NOTA: TFloatField;
    sqlMasterOBS: TMemoField;
    sqlDetalhesKVND_PEDIDO: TStringField;
    sqlDetalhesCODIGO: TStringField;
    sqlDetalhesNOME: TStringField;
    sqlDetalhesCUSTO: TFloatField;
    sqlDetalhesQTDE: TFloatField;
    sqlDetalhesPORCENTAGEM: TFloatField;
    sqlDetalhesTOTAL: TFloatField;
    sqlDetalhesCONTACONTABIL: TStringField;
    sqlDetalhesCENTROCUSTO: TStringField;
    cdsMasterKVND_PEDIDO: TStringField;
    cdsMasterNOMEENTIDADE: TStringField;
    cdsMasterNOTA_FISCAL: TStringField;
    cdsMasterSERIE: TStringField;
    cdsMasterDATA_EMISSAO: TSQLTimeStampField;
    cdsMasterTOTAL_NOTA: TFloatField;
    cdsMasterOBS: TMemoField;
    cdsDetalhesKVND_PEDIDO: TStringField;
    cdsDetalhesCODIGO: TStringField;
    cdsDetalhesNOME: TStringField;
    cdsDetalhesCUSTO: TFloatField;
    cdsDetalhesQTDE: TFloatField;
    cdsDetalhesPORCENTAGEM: TFloatField;
    cdsDetalhesTOTAL: TFloatField;
    cdsDetalhesCONTACONTABIL: TStringField;
    cdsDetalhesCENTROCUSTO: TStringField;
    cdsMastersqlDetalhes: TDataSetField;
    QRLabel5: TQRLabel;
    qrlTotal: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel9: TQRLabel;
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    { Private declarations }
    FTotalSaldo    : Double;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;

implementation

uses UDBFinanceiro ;

{$R *.dfm}

{ TfqrCustomReport }


class function TFIN_VendasPorCentroCustoReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFIN_VendasPorCentroCustoReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFIN_VendasPorCentroCustoReport.Initialize;
begin
  with TSpecificReportParams ( Parameters ), cdsMaster.Params do
    begin
      QuickRep.ReportTitle := ReportTitle;

      ParamByName( 'KSYS$DOMAIN' ).AsString    := LoggedUser.DomainID ;
      ParamByName( 'DATAINI' ).asSQLTimeStamp   := DateTimeToSQLTimeStamp( StartDate ) ;
      ParamByName( 'DATAFIM' ).asSQLTimeStamp   := DateTimeToSQLTimeStamp( EndDate ) ;
      ParamByName( 'TODOS' ).AsString           := BoolToChar( TODOS_ENTIDADE ) ;
      ParamByName( 'KCAD_ENTIDADE' ).AsString   := KCAD_ENTIDADE ;
      ParamByName( 'TODASCONTAS' ).AsString     := BoolToChar( TodasContas ) ;
      ParamByName( 'KFIN_PLANOCONTA' ).AsString := KFIN_PLANOCONTA ;

      sqlDetalhes.Params.ParamByName( 'TODOSCENTROS' ).AsString     := BoolToChar( TodosCentros ) ;
      sqlDetalhes.Params.ParamByName( 'KFIN_CENTROCUSTO' ).AsString := KFIN_CENTROCUSTO ;

      _qrlDescricao.Caption  := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate , EndDate ) ;
    end ;

  cdsMaster.Open ;

  with TMailSuppl.GlobalMail do
    begin
      Clear ;
      //ToList.Add ( cdsMasterEmail.asString ) ;
      Message := 'Segue em Anexo ... ' ;
    end ;
end;

procedure TFIN_VendasPorCentroCustoReport.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  FTotalSaldo := 0 ;
end;

procedure TFIN_VendasPorCentroCustoReport.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  FTotalSaldo := FTotalSaldo + cdsMasterTOTAL_NOTA.AsFloat ;
end;

procedure TFIN_VendasPorCentroCustoReport.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlTotal.Caption := '';
  qrlTotal.Caption := FormatFloat(  '#,0.00', FTotalSaldo ) ;
end;

end.
