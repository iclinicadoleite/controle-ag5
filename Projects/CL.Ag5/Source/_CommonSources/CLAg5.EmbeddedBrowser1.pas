unit CLAg5.EmbeddedBrowser;

interface

{.$I cef.inc}

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  VCL.StdCtrls, VCL.Buttons, VCL.ActnList, VCL.Menus, VCL.ComCtrls, VCL.ExtCtrls, XPMan,
  ceflib, cefvcl, System.Actions
  ;

type
  TEmbeddedBrowser = class(TForm)
    ActionDevTool: TAction;
    ActionDoc: TAction;
    ActionDom: TAction;
    ActionExecuteJS: TAction;
    ActionFileScheme: TAction;
    ActionGetSource: TAction;
    ActionGetText: TAction;
    ActionGoTo: TAction;
    ActionGroup: TAction;
    ActionHome: TAction;
    ActionList: TActionList;
    ActionNext: TAction;
    ActionPrev: TAction;
    ActionPrint: TAction;
    ActionReload: TAction;
    ActionZoomIn: TAction;
    ActionZoomOut: TAction;
    ActionZoomReset: TAction;
    ButtonGoto: TSpeedButton;
    ButtonHome: TSpeedButton;
    ButtonNext: TSpeedButton;
    ButtonPrev: TSpeedButton;
    ButtonReload: TSpeedButton;
    Chromium: TChromium;
    DevTools: TChromiumDevTools;
    EditAddress: TEdit;
    MainMenu: TMainMenu;
    MenuItemDevelopperTools: TMenuItem;
    MenuItemDocumentation: TMenuItem;
    MenuItemExecuteJavaScript: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItemFile: TMenuItem;
    MenuItemFileScheme: TMenuItem;
    MenuItemGetSource: TMenuItem;
    MenuItemGetText: TMenuItem;
    MenuItemGoogleGroup: TMenuItem;
    MenuItemHelp: TMenuItem;
    MenuItemPrint: TMenuItem;
    MenuItemTest: TMenuItem;
    MenuItemVisitDOM: TMenuItem;
    MenuItemZoomIn: TMenuItem;
    MenuItemZoomOut: TMenuItem;
    MenuItemZoomReset: TMenuItem;
    PanelControl: TPanel;
    SaveDialog: TSaveDialog;
    Splitter: TSplitter;
    StatusBar: TStatusBar;
    Memo1: TMemo;
    DevToolsPanel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionDevToolExecute(Sender: TObject);
    procedure ActionDocExecute(Sender: TObject);
    procedure ActionDomExecute(Sender: TObject);
    procedure ActionExecuteJSExecute(Sender: TObject);
    procedure ActionFileSchemeExecute(Sender: TObject);
    procedure ActionGetSourceExecute(Sender: TObject);
    procedure ActionGetTextExecute(Sender: TObject);
    procedure ActionGoToExecute(Sender: TObject);
    procedure ActionGroupExecute(Sender: TObject);
    procedure ActionHomeExecute(Sender: TObject);
    procedure ActionHomeUpdate(Sender: TObject);
    procedure ActionNextExecute(Sender: TObject);
    procedure ActionNextUpdate(Sender: TObject);
    procedure ActionPrevExecute(Sender: TObject);
    procedure ActionPrevUpdate(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionReloadExecute(Sender: TObject);
    procedure ActionReloadUpdate(Sender: TObject);
    procedure ActionZoomInExecute(Sender: TObject);
    procedure ActionZoomOutExecute(Sender: TObject);
    procedure ActionZoomResetExecute(Sender: TObject);
    procedure ChromiumAddressChange(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; const url: ustring);
    procedure ChromiumBeforeContextMenu(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; const model: ICefMenuModel);
    procedure ChromiumBeforeDownload(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const suggestedName: ustring; const callback: ICefBeforeDownloadCallback);
    procedure ChromiumContextMenuCommand(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; commandId: Integer;
      eventFlags: TCefEventFlags; out Result: Boolean);
    procedure ChromiumDownloadUpdated(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const callback: ICefDownloadItemCallback);
    procedure ChromiumProcessMessageReceived(Sender: TObject;
      const browser: ICefBrowser; sourceProcess: TCefProcessId;
      const message: ICefProcessMessage; out Result: Boolean);
    procedure ChromiumStatusMessage(Sender: TObject;
      const browser: ICefBrowser; const value: ustring);
    procedure ChromiumTitleChange(Sender: TObject;
      const browser: ICefBrowser; const title: ustring);
    procedure EditAddressKeyPress(Sender: TObject; var Key: Char);
    procedure MenuItemExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChromiumConsoleMessage(Sender: TObject;
      const browser: ICefBrowser; const message, source: ustring; line: Integer;
      out Result: Boolean);
    procedure ChromiumCertificateError(Sender: TObject;
      const browser: ICefBrowser; certError: Integer; const requestUrl: ustring;
      const sslInfo: ICefSslInfo; const callback: ICefRequestCallback;
      out Result: Boolean);
    procedure ChromiumBeforePopup(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; const targetUrl, targetFrameName: ustring;
      targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean;
      var popupFeatures: TCefPopupFeatures; var windowInfo: TCefWindowInfo;
      var client: ICefClient; var settings: TCefBrowserSettings;
      var noJavascriptAccess: Boolean; out Result: Boolean);
    procedure ChromiumBeforeResourceLoad(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const request: ICefRequest; const callback: ICefRequestCallback;
      out Result: TCefReturnValue);
    procedure ChromiumPluginCrashed(Sender: TObject; const browser: ICefBrowser;
      const pluginPath: ustring);
    procedure ChromiumJsdialog(Sender: TObject; const browser: ICefBrowser;
      const originUrl: ustring; dialogType: TCefJsDialogType; const messageText,
      defaultPromptText: ustring; callback: ICefJsDialogCallback;
      out suppressMessage, Result: Boolean);
    procedure ChromiumLoadEnd(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; httpStatusCode: Integer);
    procedure ChromiumLoadStart(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; transitionType: TCefTransitionType);
  protected
    procedure DoInitPage ; virtual ; abstract ;
    function CreateField(const AValue: AnsiString): ICefPostDataElement;
  private
    FLoading: Boolean;
    procedure InitPage;
    function IsMain(const b: ICefBrowser; const f: ICefFrame = nil): Boolean;
  public
    procedure LoadFile ( const AFileName : string ) ;
    procedure AfterConstruction ; override ;
  end;

  TCustomRenderProcessHandler = class(TCefRenderProcessHandlerOwn)
  protected
    procedure OnWebKitInitialized; override;
    function OnProcessMessageReceived(const browser: ICefBrowser; sourceProcess: TCefProcessId;
      const message: ICefProcessMessage): Boolean; override;
  end;

  TTestExtension = class
    class function hello: string;
  end;


implementation

uses
  Registry, ThreadSuppl ;

const
  CUSTOMMENUCOMMAND_INSPECTELEMENT = 7241221;

{$R *.dfm}

{ TMainForm }

procedure TEmbeddedBrowser.InitPage;
begin
  Chromium.Visible := True ;
  Chromium.HandleNeeded ;
  DoInitPage ;
  Repaint;
end;

procedure TEmbeddedBrowser.ActionDevToolExecute(Sender: TObject);
begin
  if TAction(Sender).Checked then
  begin
    Splitter.Visible  := True  ;
    Splitter.Top      := Chromium.Top +  Chromium.Height  ;
    DevToolsPanel.Visible  := True  ;
    DevToolsPanel.Top      := Splitter.Top + Splitter.height ;
    DevTools.ShowDevTools(Chromium.Browser);
  end else
  begin
    DevTools.CloseDevTools(Chromium.Browser);
    Splitter.Visible := False;
    DevToolsPanel.Visible := False;
  end;
end;

procedure TEmbeddedBrowser.ActionDocExecute(Sender: TObject);
begin
  Chromium.Load('http://magpcss.org/ceforum/apidocs3');
end;

procedure TEmbeddedBrowser.ActionDomExecute(Sender: TObject);
begin
  Chromium.browser.SendProcessMessage(PID_RENDERER,
    TCefProcessMessageRef.New('visitdom'));
end;

procedure TEmbeddedBrowser.ActionExecuteJSExecute(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    Chromium.Browser.MainFrame.ExecuteJavaScript(
      'alert(''JavaScript execute works!'');', 'about:blank', 0);
end;

procedure TEmbeddedBrowser.ActionFileSchemeExecute(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    Chromium.Browser.MainFrame.LoadUrl('local://c/');
end;

procedure CallbackGetSource(const src: ustring);
var
  source: ustring;
begin
  source := src;
  source := StringReplace(source, '<', '&lt;', [rfReplaceAll]);
  source := StringReplace(source, '>', '&gt;', [rfReplaceAll]);
  source := '<html><body>Source:<pre>' + source + '</pre></body></html>';
//  MainForm.Chromium.Browser.MainFrame.LoadString(source, 'source://html');
end;

procedure TEmbeddedBrowser.ActionGetSourceExecute(Sender: TObject);
begin
  Chromium.Browser.MainFrame.GetSourceProc(CallbackGetSource);
end;

procedure CallbackGetText(const txt: ustring);
var
  source: ustring;
begin
  source := txt;
  source := StringReplace(source, '<', '&lt;', [rfReplaceAll]);
  source := StringReplace(source, '>', '&gt;', [rfReplaceAll]);
  source := '<html><body>Text:<pre>' + source + '</pre></body></html>';
//  MainForm.Chromium.Browser.MainFrame.LoadString(source, 'source://text');
end;

procedure TEmbeddedBrowser.ActionGetTextExecute(Sender: TObject);
begin
  Chromium.Browser.MainFrame.GetTextProc(CallbackGetText);
end;

procedure TEmbeddedBrowser.ActionGoToExecute(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    Chromium.Browser.MainFrame.LoadUrl(EditAddress.Text);
end;

procedure TEmbeddedBrowser.ActionGroupExecute(Sender: TObject);
begin
  Chromium.Load('https://groups.google.com/forum/?fromgroups#!forum/delphichromiumembedded');
end;

procedure TEmbeddedBrowser.ActionHomeExecute(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    Chromium.Browser.MainFrame.LoadUrl(Chromium.DefaultUrl);
end;

procedure TEmbeddedBrowser.ActionHomeUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Chromium.Browser <> nil;
end;

procedure TEmbeddedBrowser.ActionNextExecute(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    Chromium.Browser.GoForward;
end;

procedure TEmbeddedBrowser.ActionNextUpdate(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    TAction(Sender).Enabled := Chromium.Browser.CanGoForward
  else
    TAction(Sender).Enabled := False;
end;

procedure TEmbeddedBrowser.ActionPrevExecute(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    Chromium.Browser.GoBack;
end;

procedure TEmbeddedBrowser.ActionPrevUpdate(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    TAction(Sender).Enabled := Chromium.Browser.CanGoBack
  else
    TAction(Sender).Enabled := False;
end;

procedure TEmbeddedBrowser.ActionPrintExecute(Sender: TObject);
begin
  Chromium.Browser.Host.Print;
end;

procedure TEmbeddedBrowser.ActionReloadExecute(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    if FLoading then
      Chromium.Browser.StopLoad else
      Chromium.Browser.Reload;
end;

procedure TEmbeddedBrowser.ActionReloadUpdate(Sender: TObject);
begin
  if FLoading then
    TAction(sender).Caption := 'X' else
    TAction(sender).Caption := 'R';
  TAction(Sender).Enabled := Chromium.Browser <> nil;
end;

function TEmbeddedBrowser.IsMain(const b: ICefBrowser; const f: ICefFrame): Boolean;
begin
  Result := (b <> nil) and (b.Identifier = Chromium.BrowserId) and ((f = nil) or (f.IsMain));
end;

procedure TEmbeddedBrowser.LoadFile(const AFileName: string);
var
  LFileName : string ;
begin
  LFileName := StringReplace ( AFileName.Replace('\','/'), ' ', '%20', [rfReplaceAll] ) ;
  Chromium.Load( format('file:///%s', [ LFileName ] ) ) ;
end;

procedure TEmbeddedBrowser.ActionZoomInExecute(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    Chromium.Browser.Host.ZoomLevel := Chromium.Browser.Host.ZoomLevel + 0.5;
end;

procedure TEmbeddedBrowser.ActionZoomOutExecute(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    Chromium.Browser.Host.ZoomLevel := Chromium.Browser.Host.ZoomLevel - 0.5;
end;

procedure TEmbeddedBrowser.ActionZoomResetExecute(Sender: TObject);
begin
  if Chromium.Browser <> nil then
    Chromium.Browser.Host.ZoomLevel := 0;
end;

procedure TEmbeddedBrowser.AfterConstruction;
begin
  inherited;
  ThreadSuppl.TSyncThread.Create( InitPage ) ;
end;

procedure TEmbeddedBrowser.ChromiumAddressChange(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const url: ustring);
begin
  if IsMain(browser, frame) then
    EditAddress.Text := url;
end;

procedure TEmbeddedBrowser.ChromiumBeforeContextMenu(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const params: ICefContextMenuParams; const model: ICefMenuModel);
begin
  model.AddItem(CUSTOMMENUCOMMAND_INSPECTELEMENT, 'Inspect Element');
end;

procedure TEmbeddedBrowser.ChromiumBeforeDownload(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const suggestedName: ustring; const callback: ICefBeforeDownloadCallback);
begin
  callback.Cont(ExtractFilePath(ParamStr(0)) + suggestedName, True);
end;


procedure TEmbeddedBrowser.ChromiumBeforePopup(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const targetUrl,
  targetFrameName: ustring; targetDisposition: TCefWindowOpenDisposition;
  userGesture: Boolean; var popupFeatures: TCefPopupFeatures;
  var windowInfo: TCefWindowInfo; var client: ICefClient;
  var settings: TCefBrowserSettings; var noJavascriptAccess: Boolean;
  out Result: Boolean);
begin
//   prevent popup
//   Chromium.Load(targetUrl);
//  Result := True;
end;

procedure TEmbeddedBrowser.ChromiumBeforeResourceLoad(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; const callback: ICefRequestCallback;
  out Result: TCefReturnValue);
var
  u: TUrlParts;
begin
  // redirect home to google
  if CefParseUrl(request.Url, u) then
    if (u.host = 'home') then
    begin
      u.host := 'www.google.com';
      request.Url := CefCreateUrl(u);
    end;
end;

procedure TEmbeddedBrowser.ChromiumCertificateError(Sender: TObject;
  const browser: ICefBrowser; certError: Integer; const requestUrl: ustring;
  const sslInfo: ICefSslInfo; const callback: ICefRequestCallback;
  out Result: Boolean);
begin
  // let use untrusted certificates (ex: cacert.org)
  callback.Cont(True);
  Result := True;
end;

procedure TEmbeddedBrowser.ChromiumConsoleMessage(Sender: TObject;
  const browser: ICefBrowser; const message, source: ustring; line: Integer;
  out Result: Boolean);
begin
  Memo1.Lines.Add( message ) ;
end;

procedure TEmbeddedBrowser.ChromiumContextMenuCommand(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const params: ICefContextMenuParams; commandId: Integer;
  eventFlags: TCefEventFlags; out Result: Boolean);
var
  mousePoint: TCefPoint;
begin
  Result := False;
  if (commandId = CUSTOMMENUCOMMAND_INSPECTELEMENT) then
  begin
    mousePoint.x := params.XCoord;
    mousePoint.y := params.YCoord;
    Splitter.Visible := True;
    DevTools.Visible := True;
    ActionDevTool.Checked := True;
    DevTools.CloseDevTools(Chromium.Browser);
    Application.ProcessMessages;
    DevTools.ShowDevTools(Chromium.Browser, @mousePoint);
    Result := True;
  end;
end;

procedure TEmbeddedBrowser.ChromiumDownloadUpdated(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const callback: ICefDownloadItemCallback);
begin
  if downloadItem.IsInProgress then
    StatusBar.SimpleText := IntToStr(downloadItem.PercentComplete) + '%' else
    StatusBar.SimpleText := '';
end;


procedure TEmbeddedBrowser.ChromiumJsdialog(Sender: TObject;
  const browser: ICefBrowser; const originUrl: ustring;
  dialogType: TCefJsDialogType; const messageText, defaultPromptText: ustring;
  callback: ICefJsDialogCallback; out suppressMessage, Result: Boolean);
begin
  ShowMEssage ( 'jsDialog' ) ;
end;
(*
procedure TEmbeddedBrowser.ChromiumLoadEnd(Sender: TObject; const browser: ICefBrowser;
  const frame: ICefFrame; httpStatusCode: Integer);
begin
  if IsMain(browser, frame) then
    FLoading := False;
end;
*)
procedure TEmbeddedBrowser.ChromiumLoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer);
begin
  if IsMain(browser, frame) then
    FLoading := False;
end;
procedure TEmbeddedBrowser.ChromiumLoadStart(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  transitionType: TCefTransitionType);
begin
  if IsMain(browser, frame) then
    FLoading := True;
end;

(*
procedure TEmbeddedBrowser.ChromiumLoadStart(Sender: TObject; const browser: ICefBrowser;
  const frame: ICefFrame);
begin
  if IsMain(browser, frame) then
    FLoading := True;
end;
*)
procedure TEmbeddedBrowser.ChromiumPluginCrashed(Sender: TObject;
  const browser: ICefBrowser; const pluginPath: ustring);
begin
  memo1.Lines.Add( pluginPath )
end;

procedure TEmbeddedBrowser.ChromiumProcessMessageReceived(Sender: TObject;
  const browser: ICefBrowser; sourceProcess: TCefProcessId;
  const message: ICefProcessMessage; out Result: Boolean);
begin
  if (message.Name = 'mouseover') then
  begin
    StatusBar.SimpleText := message.ArgumentList.GetString(0);
    Result := True;
  end else
    Result := False;
end;

procedure TEmbeddedBrowser.ChromiumStatusMessage(Sender: TObject;
  const browser: ICefBrowser; const value: ustring);
begin
  StatusBar.SimpleText := value
end;

procedure TEmbeddedBrowser.ChromiumTitleChange(Sender: TObject; const browser: ICefBrowser;
  const title: ustring);
begin
  if IsMain(browser) then
    Caption := title;
end;

function TEmbeddedBrowser.CreateField(
  const AValue: AnsiString): ICefPostDataElement;
begin
  Result := TCefPostDataElementRef.New;
  Result.SetToBytes(Length(AValue), PAnsiChar(AValue));
end;

procedure TEmbeddedBrowser.EditAddressKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if Chromium.Browser <> nil then
    begin
      Chromium.Browser.MainFrame.LoadUrl(EditAddress.Text);
      Abort;
    end;
  end;
end;

procedure TEmbeddedBrowser.MenuItemExitClick(Sender: TObject);
begin
  Close;
end;

procedure TEmbeddedBrowser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree ;
end;

procedure TEmbeddedBrowser.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//var
//  t: TDateTime ;
begin
  // avoid AV when closing application
//  if CefSingleProcess then
//  begin
    Chromium.Load('about:blank');
    while Chromium.Browser.IsLoading do
       Application.ProcessMessages ;
//    Chromium.Destroy ;
//    t := Now + EncodeTime( 0, 0, 5, 0 ) ;
//    while Now < t do
//      begin
//       sleep ( 0 ) ;
//       Application.ProcessMessages ;
//      end;
//  end;
  CanClose := True;

end;

procedure TEmbeddedBrowser.FormCreate(Sender: TObject);
begin
  FLoading := False;
end;

{ TCustomRenderProcessHandler }


function getpath(const n: ICefDomNode): string;
begin
  Result := '<' + n.Name + '>';
  if (n.Parent <> nil) then
    Result := getpath(n.Parent) + Result;
end;

function TCustomRenderProcessHandler.OnProcessMessageReceived(
  const browser: ICefBrowser; sourceProcess: TCefProcessId;
  const message: ICefProcessMessage): Boolean;
begin
//{$IFDEF DELPHI14_UP}
//  if (message.Name = 'visitdom') then
//    begin
//      browser.MainFrame.VisitDomProc(
//        procedure(const doc: ICefDomDocument) begin
//          doc.Body.AddEventListenerProc('mouseover', True,
//            procedure (const event: ICefDomEvent)
//            var
//              msg: ICefProcessMessage;
//            begin
//              msg := TCefProcessMessageRef.New('mouseover');
//              msg.ArgumentList.SetString(0, getpath(event.Target));
//              browser.SendProcessMessage(PID_BROWSER, msg);
//            end)
//        end);
//        Result := True;
//    end
//  else
//{$ENDIF}
    Result := False;
end;

procedure TCustomRenderProcessHandler.OnWebKitInitialized;
begin
{$IFDEF DELPHI14_UP}
  TCefRTTIExtension.Register('app', TTestExtension);
{$ENDIF}
end;

{ TTestExtension }

class function TTestExtension.hello: string;
begin
  Result := 'Hello from Delphi';
end;



const
  _EWB = 'EWB' ;
var
 LEWBPath : string ;

 procedure OnbeforeCmdLine(const processType: ustring; const commandLine: ICefCommandLine);
 const
   _PPAPI_FLASH_DLL = '%spepflashplayer.dll' ;
 begin
  commandLine.AppendSwitch('enable-ppapi');
  commandLine.AppendSwitchWithValue('ppapi-flash-path', Format( _PPAPI_FLASH_DLL, [LEWBPath] ));
  commandLine.AppendSwitchWithValue('plugin-policy', 'allow');
end;

procedure InitializeEmbeddedWebBrowser ;
begin

 LEWBPath := Format(
   '%s%s\'
   , [   ExtractFilePath ( ParamStr( 0 ) )
       , _EWB
     ]
 ) ;

 SetEnvironmentVariable(
     'Path'
   , PChar(
       Format('%s;%s'
         , [   LEWBPath
             , GetEnvironmentVariable('Path')
           ]
       )
     )
 ) ;

//  CefRemoteDebuggingPort := 9000;
//  CefRenderProcessHandler := TCustomRenderProcessHandler.Create;
//  CefBrowserProcessHandler := TCefBrowserProcessHandlerOwn.Create;
  CefSingleProcess                 := False ;//
  CefOnBeforeCommandLineProcessing := OnbeforeCmdLine;
  CefBrowserSubprocessPath         := Format(
     '%sTc%s.exe'
     , [  LEWBPath
        , _EWB
       ]
  ) ;

end;

initialization
  InitializeEmbeddedWebBrowser
finalization
//  SetErrorMode(SEM_NOGPFAULTERRORBOX);
  CefShutdown
end.

