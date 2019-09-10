unit UServerForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ExtCtrls, UThreadSchedPrintJob, VCL.StdCtrls, UReportServerConfig,
  JvAppInst, JvComponentBase, JvTrayIcon, jpeg, VCL.Buttons, JvChangeNotify,
  Vcl.ComCtrls, Vcl.ToolWin ;

type

  TReportServerForm = class(TForm)
    Memo1: TMemo;
    TrayIcon: TJvTrayIcon;
    JvAppInstances1: TJvAppInstances;
    Panel4: TPanel;
    Image2: TImage;
    Label1: TLabel;
    btnEncerrarMonitor: TBitBtn;
    ChangeNotify: TJvChangeNotify;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnEncerrarMonitorClick(Sender: TObject);
    procedure ChangeNotifyChangeNotify(Sender: TObject; Dir: string;
      Actions: TJvChangeActions);
  private
    {Private declarations }
    FIniFileName : string ;
    FThreadSchedPrintJob : ThreadSchedPrintJob ;
    FReportCfg : TReportCfg ;
    FDOWToPrint : string ;
    procedure WMQueryEndSession (var Msg : TWMQueryEndSession) ; message WM_QueryEndSession;
    procedure ConfigReload ;
    procedure Log ( ALog : string ) ;
    procedure Print ;
    procedure LoadReportCfg ;
    procedure InitChangeMonitor ;
    procedure InitThreadParams ;
    procedure DoTray ;
  public
    { Public declarations }
  end;

var
  ReportServerForm: TReportServerForm;

implementation

uses DateUtils, Math, UZoo_QRTarefasAExecutar, UDBZootecnico, UAppl, Datasnap.DBClient,
     ThreadSuppl ;

{$R *.dfm}

procedure TReportServerForm.btnEncerrarMonitorClick(Sender: TObject);
begin
  Application.Terminate
end;

procedure TReportServerForm.ChangeNotifyChangeNotify(Sender: TObject;
  Dir: string; Actions: TJvChangeActions);
begin
  Log ( Dir ) ;
  ConfigReload ;
end;

procedure TReportServerForm.ConfigReload;
begin
  Log ( 'monitor - config changed' ) ;
  FThreadSchedPrintJob.Suspended := True ;
  LoadReportCfg ;
  InitThreadParams ;
  FThreadSchedPrintJob.Suspended := not FReportCfg.Active ;
end;

procedure TReportServerForm.DoTray;
begin
   TrayIcon.Active := True ;
   TrayIcon.HideApplication ;
end;

procedure TReportServerForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if not Application.terminated then
      begin
        TrayIcon.HideApplication ;
        CanClose := False ;
      end ;
end;

procedure TReportServerForm.FormCreate(Sender: TObject);
var
  cds : TClientDataSet ;
begin

   try
     TApp.Create ( self ) ;

     LoadReportCfg ;

     InitChangeMonitor;

     With TDBZootecnico.Create( self ) do
       begin
         //LoggedUser.DomainCode := FReportCfg.FarmCode ;
         SQLDB.Open ;
         cds := nil ;
         ADBZootecnico.populateClientDataSet ( cds, 'SELECT KCAD_FAZENDA FROM CAD_FAZENDAS' ) ;
         //LoggedUser.DomainID := cds.FieldByName('KCAD_FAZENDA').asString  ;
         cds.free ;
       end;

     FThreadSchedPrintJob := ThreadSchedPrintJob.Create ( not FReportCfg.Active ) ;
     InitThreadParams ;
     Log ( 'monitor - thread initialized' ) ;

     ThreadSuppl.TSyncThread.Create( DoTray );

   except on E: Exception do
     begin
      Log ( E.Message ) ;
//     TrayIcon.ShowApplication ;
     end;

   end;
end;


procedure TReportServerForm.InitChangeMonitor;
begin

  with ChangeNotify.Notifications.Add do
   begin
      IncludeSubTrees := False ;
      Directory := ExtractFilePath ( FReportCfg.ConfigFileName ) ;
      Actions   := [caChangeLastWrite];
   end;

  // ignore error if network diretory
  try
    ChangeNotify.Active := True;
  except
  end;

end;

procedure TReportServerForm.InitThreadParams ;
begin
   with FThreadSchedPrintJob do
     begin
      DOWToPrint   := FReportCfg.DOW ;
      TimeStr      := FReportCfg.Time ;
      JobStartDate := Date;
      Job          := Print ;
      Logger       := Log ;
     end;
end;

procedure TReportServerForm.LoadReportCfg;
begin
  UReportServerConfig.LoadReportCfg( FReportCfg ) ;
end;


procedure TReportServerForm.Log(ALog: string);
begin
   Memo1.Lines.Add ( ALog ) ;
end;

procedure TReportServerForm.Print;
begin
(*
    FPrinterName : string ;
    FNextDays : string ;
    FOrder : string ;
    FPagBreak : boolen ;
*)


  TZoo_QRTarefasAExecutar.PrintAte( Date + FReportCfg.NextDays, TPrinterOrder ( FReportCfg.Order ), FReportCfg.PageBreak, FReportCfg.PrinterName, FReportCfg.Preview );
end;

procedure TReportServerForm.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
    OnCloseQuery := nil ;
    Msg.Result := 1 ; // allow logoff ... 0 no allow
    Application.Terminate ;
end;

end.




