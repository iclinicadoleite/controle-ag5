program CL.Ag5.ReportServerApp;

uses
  MidasLib,
  VCL.Forms,
  UServerForm in 'Source\Server\App\UServerForm.pas' {ReportServerForm},
  ServerContainerApp in 'Source\Server\App\ServerContainerApp.pas' {AppServerContainer: TDataModule},
  ServerModule in 'Source\Server\ModuleClasses\ServerModule.pas' {ServerMethods1: TDSServerModule},
  Exceptions in '..\CL.Ag5\Source\Core\Exceptions.pas',
  CLAg5Types in '..\CL.Ag5\Source\_CommonSources\CLAg5Types.pas',
  UDBZootecnico in '..\CL.Ag5\Source\CL.Ag5Client\Zoo\UDBZootecnico.pas' {DBZootecnico: T_DBResources},
  UQuickReport in '..\CL.Ag5\Source\_CommonSources\QReports\Base\UQuickReport.pas' {_QuickReport: TTcForm},
  UCustomQuickReport in '..\CL.Ag5\Source\_CommonSources\QReports\Base\UCustomQuickReport.pas' {_CustomQuickReport: TTcForm},
  UfqrSYS_BaseReport in '..\CL.Ag5\Source\_CommonSources\QReports\UfqrSYS_BaseReport.pas' {fqrSYS_BaseReport: TTcForm},
  UZoo_QRDiarioDaMastite in '..\CL.Ag5\Source\CL.Ag5Client\Zoo\Atividades\UZoo_QRDiarioDaMastite.pas' {Zoo_QRDiarioDaMastite: TTcForm},
  UZoo_AtividadesDiarioDaMastiteDatamodule in '..\CL.Ag5\Source\CL.Ag5Client\Zoo\Atividades\UZoo_AtividadesDiarioDaMastiteDatamodule.pas' {Zoo_AtividadesDiarioDaMastiteDatamodule: T_dtmBASE},
  Wrappers in '..\CL.Ag5\Source\_CommonSources\Wrappers.pas',
  UThreadSchedPrintJob in 'Source\UThreadSchedPrintJob.pas',
  UAppl in 'Source\UAppl.pas' {App: TDataModule},
  UReportServerConfig in 'Source\Common\UReportServerConfig.pas',
  ClAg5.DatabaseIntf in '..\CL.Ag5\Source\_CommonSources\ClAg5.DatabaseIntf.pas',
  ClAg5.Common.Journaling in '..\CL.Ag5\Source\_CommonSources\ClAg5.Common.Journaling.pas',
  ClAg5.Common.RLogTriggers in '..\CL.Ag5\Source\_CommonSources\ClAg5.Common.RLogTriggers.pas',
  UDBZootecnico.Update in '..\CL.Ag5\Source\CL.Ag5Client\Zoo\UDBZootecnico.Update.pas',
  UDBUpdate in '..\CL.Ag5\Source\_CommonSources\UDBUpdate.pas',
  UZoo_AtividadesTarefasDatamodule in '..\CL.Ag5\Source\CL.Ag5Client\Zoo\Atividades\UZoo_AtividadesTarefasDatamodule.pas' {Zoo_AtividadesTarefasDatamodule: T_dtmBASE},
  UZoo_QRTarefasAExecutar in '..\CL.Ag5\Source\CL.Ag5Client\Zoo\Atividades\UZoo_QRTarefasAExecutar.pas' {Zoo_QRTarefasAExecutar: TTcForm};

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm := False ;
  Application.Title := 'Agenda 5.0 - Servidor de impressão' ;
  Application.MainFormOnTaskbar := False ;
  Application.CreateForm(TReportServerForm, ReportServerForm);
  Application.Run;
end.



(*

  UCustomQuickReport in '..\CL.Ag5\Source\QReports\Base\UCustomQuickReport.pas' {_CustomQuickReport : TTcForm},
  UfqrSYS_BaseReport in '..\CL.Ag5\Source\QReports\UfqrSYS_BaseReport.pas' {fqrSYS_BaseReport : TTcForm},
  UZoo_QRTarefasAExecutar in '..\CL.Ag5\Source\Client\Zoo\Atividades\UZoo_QRTarefasAExecutar.pas' {Zoo_QRTarefasAExecutar: TTcForm},
  UZoo_ConfigurarImpressaoAutomatica in '..\CL.Ag5\Source\Client\Zoo\Atividades\UZoo_ConfigurarImpressaoAutomatica.pas' {Zoo_ConfigurarImpressaoAutomatica: TTcForm},
  UZoo_AtividadesTarefasDatamodule in '..\CL.Ag5\Source\Client\Zoo\Atividades\UZoo_AtividadesTarefasDatamodule.pas' {Zoo_AtividadesTarefasDatamodule: T_dtmBASE},
*)
