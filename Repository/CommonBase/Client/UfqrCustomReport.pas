unit UfqrCustomReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Datasnap.DBClient, MConnect, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils,
  SysWizardReportDialog,
  SysReportTypes, ReportTypes,  Wrappers ;

type

  TSpecificReportParams = SysReportTypes.TReportParams ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TfqrCustomReport = class(TfqrSYS_BaseReport)
    cdsMaster: TClientDataSet;
    dspMaster: TDataSetProvider;
    sqlMaster: TSQLDataSet;
    sqlDetalhes: TSQLDataSet;
    dtsSQLMaster: TDataSource;
    cdsDetalhes: TClientDataSet;
    scRdm: TSharedConnection;
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

//uses UDBResources;

{$R *.dfm}

{ TfqrCustomReport }


class function TfqrCustomReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TfqrCustomReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TfqrCustomReport.Initialize;
begin

  with TSpecificReportParams ( Parameters ), cdsMaster.Params do
     begin
       //ParamByName( 'DATAINICIO' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( DataInicio ) ) ;
       //ParamByName( 'DATAFIM' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( DataFim ) ) ;
     end ;

  cdsMaster.Open ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;


end;

end.
