// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//                (impressao)
// License      : veja readme.txt





unit UEST_DepreciacoesReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes,
  ReportTypes, UEST_DepreciacoesReportDatamodule, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsEST_Depreciacoes ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TEST_DepreciacoesReport = class(TfqrSYS_BaseReport)
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    dtmDepreciacoes : TEST_DepreciacoesReportDatamodule ;
    FTotal : Currency ;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;

implementation

//uses UDBResources;

{$R *.dfm}

{ TfqrCustomReport }


class function TEST_DepreciacoesReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TEST_DepreciacoesReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TEST_DepreciacoesReport.Initialize;
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      QuickRep.ReportTitle  := ReportTitle;
      _qrlDescricao.Caption := DateSuppl.TDateSuppl.GetStringPeriodo( StartDate , EndDate ) ;

      dtmDepreciacoes := TEST_DepreciacoesReportDatamodule( FDataModule ) ;
      QuickRep.DataSet := dtmDepreciacoes.cdsDepreciacoes ;

    end ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;
end;

procedure TEST_DepreciacoesReport.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  FTotal := FTotal + dtmDepreciacoes.cdsDepreciacoesVALOR.AsCurrency ;
end;

procedure TEST_DepreciacoesReport.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  FTotal := 0 ;
end;

procedure TEST_DepreciacoesReport.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLabel11.Caption := '' ;
  QRLabel11.Caption := FormatFloat( '#,0.00', FTotal );
end;

end.
