// ************************************************************************
// ***************************** CEF4Delphi *******************************
// ************************************************************************
//
// CEF4Delphi is based on DCEF3 which uses CEF3 to embed a chromium-based
// browser in Delphi applications.
//
// The original license of DCEF3 still applies to CEF4Delphi.
//
// For more information about CEF4Delphi visit :
//         https://www.briskbard.com/index.php?lang=en&pageid=cef
//
//        Copyright © 2017 Salvador Díaz Fau. All rights reserved.
//
// ************************************************************************
// ************ vvvv Original license and comments below vvvv *************
// ************************************************************************
(*
 *                       Delphi Chromium Embedded 3
 *
 * Usage allowed under the restrictions of the Lesser GNU General Public License
 * or alternatively the restrictions of the Mozilla Public License 1.1
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
 * the specific language governing rights and limitations under the License.
 *
 * Unit owner : Henri Gourvest <hgourvest@gmail.com>
 * Web site   : http://www.progdigy.com
 * Repository : http://code.google.com/p/delphichromiumembedded/
 * Group      : http://groups.google.com/group/delphichromiumembedded
 *
 * Embarcadero Technologies, Inc is not permitted to use or redistribute
 * this source code without explicit permission.
 *
 *)

unit CLAg5.EmbeddedBrowser ;

{.$I cef.inc}

interface

uses
  {$IFDEF DELPHI16_UP}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Menus,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Types, Vcl.ComCtrls, Vcl.ClipBrd,
  System.UITypes, Vcl.AppEvnts,
  {$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Menus,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Types, ComCtrls, ClipBrd, AppEvnts,
  {$ENDIF}
  uCEFChromium
  , uCEFWindowParent
  , uCEFInterfaces
  , uCEFApplication
  , uCEFTypes
  , uCEFConstants
  , uHelloScheme, uCEFWinControl
  //, uCEFChromiumWindow
  ;


const
  MINIBROWSER_CREATED       = WM_APP + $100;
  MINIBROWSER_SHOWDEVTOOLS  = WM_APP + $101;
  MINIBROWSER_HIDEDEVTOOLS  = WM_APP + $102;
  MINIBROWSER_COPYHTML      = WM_APP + $103;
  MINIBROWSER_VISITDOM      = WM_APP + $104;

  MINIBROWSER_INIT          = WM_APP + $105;

const
  CEFBROWSER_DESTROYWNDPARENT = WM_APP + $110;
  CEFBROWSER_DESTROYTAB       = WM_APP + $111;

  MINIBROWSER_HOMEPAGE = 'https://www.google.com';

  MINIBROWSER_CONTEXTMENU_SHOWDEVTOOLS = MENU_ID_USER_FIRST + 1;
  MINIBROWSER_CONTEXTMENU_HIDEDEVTOOLS = MENU_ID_USER_FIRST + 2;
  MINIBROWSER_CONTEXTMENU_SHOWJSALERT  = MENU_ID_USER_FIRST + 3;
  MINIBROWSER_CONTEXTMENU_SETJSEVENT   = MENU_ID_USER_FIRST + 4;
  MINIBROWSER_CONTEXTMENU_COPYHTML     = MENU_ID_USER_FIRST + 5;
  MINIBROWSER_CONTEXTMENU_VISITDOM     = MENU_ID_USER_FIRST + 6;
  MINIBROWSER_CONTEXTMENU_JSWRITEDOC   = MENU_ID_USER_FIRST + 7;
  MINIBROWSER_CONTEXTMENU_JSPRINTDOC   = MENU_ID_USER_FIRST + 8;
  MINIBROWSER_CONTEXTMENU_REGSCHEME    = MENU_ID_USER_FIRST + 9;
  MINIBROWSER_CONTEXTMENU_CLEARFACT    = MENU_ID_USER_FIRST + 10;

type
  TEmbeddedBrowser = class(TForm)
    NavControlPnl: TPanel;
    NavButtonPnl: TPanel;
    URLEditPnl: TPanel;
    BackBtn: TButton;
    ForwardBtn: TButton;
    ReloadBtn: TButton;
    CEFWindowParent: TCEFWindowParent;
    Chromium: TChromium;
    StopBtn: TButton;
    DevTools: TCEFWindowParent;
    Splitter: TSplitter;
    StatusBar: TStatusBar;
    URLCbx: TComboBox;
    ConfigPnl: TPanel;
    ConfigBtn: TButton;
    PopupMenu: TPopupMenu;
    DevToolsMenuItem: TMenuItem;
    N1: TMenuItem;
    Preferences1: TMenuItem;
    GoBtn: TButton;
    N2: TMenuItem;
    PrintinPDF1: TMenuItem;
    Print1: TMenuItem;
    N3: TMenuItem;
    Zoom1: TMenuItem;
    Inczoom1: TMenuItem;
    Deczoom1: TMenuItem;
    Resetzoom1: TMenuItem;
    SaveDialog: TSaveDialog;
    ApplicationEvents: TApplicationEvents;
    OpenDialog: TOpenDialog;
    N4: TMenuItem;
    Openfile1: TMenuItem;
    procedure BackBtnClick(Sender: TObject);
    procedure ForwardBtnClick(Sender: TObject);
    procedure ReloadBtnClick(Sender: TObject);
    procedure ChromiumAfterCreated(Sender: TObject;
      const browser: ICefBrowser);
    procedure ChromiumLoadingStateChange(Sender: TObject;
      const browser: ICefBrowser; isLoading, canGoBack,
      canGoForward: Boolean);
    procedure ChromiumTitleChange(Sender: TObject;
      const browser: ICefBrowser; const title: ustring);
    procedure ChromiumAddressChange(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const url: ustring);
    procedure ChromiumBeforeContextMenu(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; const model: ICefMenuModel);
//    procedure ChromiumContextMenuCommand(Sender: TObject;
//      const browser: ICefBrowser; const frame: ICefFrame;
//      const params: ICefContextMenuParams; commandId: Integer;
//      eventFlags: TCefEventFlags; out Result: Boolean);
    procedure ChromiumProcessMessageReceived(Sender: TObject;
      const browser: ICefBrowser; sourceProcess: TCefProcessId;
      const message: ICefProcessMessage; out Result: Boolean);
    procedure ChromiumStatusMessage(Sender: TObject;
      const browser: ICefBrowser; const value: ustring);
    procedure PopupMenuPopup(Sender: TObject);
    procedure DevToolsMenuItemClick(Sender: TObject);
    procedure Preferences1Click(Sender: TObject);
    procedure ConfigBtnClick(Sender: TObject);
    procedure GoBtnClick(Sender: TObject);
    procedure PrintinPDF1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure Inczoom1Click(Sender: TObject);
    procedure Deczoom1Click(Sender: TObject);
    procedure Resetzoom1Click(Sender: TObject);
    procedure ChromiumFullScreenModeChange(Sender: TObject;
      const browser: ICefBrowser; fullscreen: Boolean);
    procedure ChromiumPreKeyEvent(Sender: TObject;
      const browser: ICefBrowser; const event: PCefKeyEvent; osEvent: PMsg;
      out isKeyboardShortcut, Result: Boolean);
    procedure ChromiumKeyEvent(Sender: TObject;
      const browser: ICefBrowser; const event: PCefKeyEvent; osEvent: PMsg;
      out Result: Boolean);
    procedure ApplicationEventsMessage(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Openfile1Click(Sender: TObject);
    procedure URLCbxKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ChromiumContextMenuCommand(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; commandId: Integer;
      eventFlags: Cardinal; out Result: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChromiumTextResultAvailable(Sender: TObject;
      const aText: ustring);
//    procedure ChromiumClose(Sender: TObject; const browser: ICefBrowser;
//      out Result: Boolean);

  protected
    procedure AddURL(const aURL : string);

    procedure ShowDevTools(aPoint : TPoint); overload;
    procedure ShowDevTools; overload;
    procedure HideDevTools;

    procedure HandleKeyUp(const aMsg : TMsg; var aHandled : boolean);
    procedure HandleKeyDown(const aMsg : TMsg; var aHandled : boolean);

    procedure BrowserCreatedMsg(var aMessage : TMessage); message MINIBROWSER_CREATED;
    procedure ShowDevToolsMsg(var aMessage : TMessage); message MINIBROWSER_SHOWDEVTOOLS;
    procedure HideDevToolsMsg(var aMessage : TMessage); message MINIBROWSER_HIDEDEVTOOLS;
    procedure CopyHTMLMsg(var aMessage : TMessage); message MINIBROWSER_COPYHTML;
    procedure VisitDOMMsg(var aMessage : TMessage); message MINIBROWSER_VISITDOM;
    procedure WMMove(var aMessage : TWMMove); message WM_MOVE;
    procedure WMMoving(var aMessage : TMessage); message WM_MOVING;

    procedure BrowserDestroyWindowParentMsg(var aMessage : TMessage); message CEFBROWSER_DESTROYWNDPARENT;


  private class var
     FNumber : integer  ;
  private
    FClosing : boolean ;
    FParent: TWinControl;
  protected
    FInited : boolean ;

    procedure SetParent(Value: TWinControl); override ;
    procedure InitPage(var aMessage : TMessage); message MINIBROWSER_INIT ;
    procedure DoInitPage ; virtual ; abstract ;
    function CreateField(const AValue: string ): ICefPostDataElement;
  public
    procedure LoadFile ( const AFileName : string ) ;
    procedure AfterConstruction ; override ;
    procedure BeforeDestruction ; override ;
  end;

//var
//  MiniBrowserFrm : TEmbeddedBrowser;

function IsCDLLocal : boolean ;
function EncodeUrl(source:string):string;


implementation

{$R *.dfm}

uses
    WinSock
  , ThreadSuppl
  , UCEFPostDataElement
  , UCEFProcessMessage
  , UCEFSchemeHandlerFactory
  , uPreferences ;

function HostByIP(IP: PAnsiChar): string;
var
  wVersionRequested: WORD;
  wsaData: TWSAData;
  Addr: LongWord;
  p: PHostEnt;
begin
  Result := '';

  { Start up WinSock }
  wVersionRequested := MAKEWORD(
    1,
    1);

  WSAStartup(
    wVersionRequested,
    wsaData);

  { Get the Host Name by address }
  Addr := inet_addr(IP);
  p    := GetHostByAddr(
    @Addr,
    128,
    AF_INET);

  { Shut down WinSock }
  WSACleanup;
  if p <> nil then
    Result := String ( p^.h_Name ) ;
end;

procedure ipx;
var
  wVersionRequested: WORD;
  wsaData: TWSAData;
  p: PHostEnt;
  s: array [0 .. 128] of ansichar;
  //p2: PAnsiChar;
begin
  wVersionRequested := MAKEWORD(
    1,
    1);
  WSAStartup(
    wVersionRequested,
    wsaData);
  GetHostName(
    @s,
    128);
  p := GetHostByName(@s);
  // Memo1.Lines.Add(\ 'Nome do seu computador: \' + p^.h_Name);
  //p2 := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
  WSACleanup;
end;

function EncodeUrl(source: string): string;
begin
  Result := '';
  for var i := 1 to length(source) do
    if CharInSet (
           source[i]
         , ['A' .. 'Z', 'a' .. 'z', '0', '1' .. '9', '-', '_', '~', '.']
       ) then
      Result := Result + source[i]
    else
      Result := Result + '%' + inttohex(ord(source[i]), 2)
end;

function IsCDLLocal: Boolean;
var
  H : string  ;
begin
  H := HostByIP('172.16.0.4').ToUpper ;

  if  (H = 'CDL-AD-02.CDL.LOCAL')
   or (H = 'CDL-AD-01.CDL.LOCAL') then
    Exit (True) ;

  H := HostByIP('172.16.0.12').ToUpper ;

  Result := (H = 'CDL-APP-PROD01')
         or (H = 'CDL-APP-PROD01.CDL.LOCAL')

end;

procedure TEmbeddedBrowser.BackBtnClick(Sender: TObject);
begin
  Chromium.GoBack;
end;

procedure TEmbeddedBrowser.BeforeDestruction;
begin
//  ApplicationEvents.OnMessage := nil ;
//  CEFWindowParent.Parent := nil ;
//  CEFWindowParent.Free ;
  //Chromium.Parent := nil ;
//  Chromium.CloseBrowser( True );
  inherited;
end;

procedure TEmbeddedBrowser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FClosing then
     exit ;
   FClosing := True ;
   Chromium.CloseBrowser( True );
   ApplicationEvents.OnMessage := nil ;
   Action := caFree ;
end;

procedure TEmbeddedBrowser.FormShow(Sender: TObject);
begin
  Chromium.CreateBrowser(
    CEFWindowParent,
    '');
end;

procedure TEmbeddedBrowser.ForwardBtnClick(Sender: TObject);
begin
  Chromium.GoForward;
end;


procedure TEmbeddedBrowser.GoBtnClick(Sender: TObject);
begin
  Chromium.LoadURL(URLCbx.Text);
end;

procedure TEmbeddedBrowser.ReloadBtnClick(Sender: TObject);
begin
  Chromium.Reload;
end;

procedure TEmbeddedBrowser.Resetzoom1Click(Sender: TObject);
begin
  Chromium.ResetZoomStep;
end;

procedure TEmbeddedBrowser.ChromiumAddressChange(
  Sender       : TObject;
  const browser: ICefBrowser;
  const frame  : ICefFrame;
  const url    : ustring);
begin
  AddURL(url);
end;

procedure TEmbeddedBrowser.ChromiumAfterCreated(
  Sender       : TObject;
  const browser: ICefBrowser);
begin
  PostMessage(
    Handle,
    MINIBROWSER_CREATED,
    0,
    0);
end;

procedure TEmbeddedBrowser.ChromiumBeforeContextMenu(
  Sender       : TObject;
  const browser: ICefBrowser;
  const frame  : ICefFrame;
  const params : ICefContextMenuParams;
  const model  : ICefMenuModel);
begin
  model.AddSeparator;
  model.AddItem(
    MINIBROWSER_CONTEXTMENU_SHOWJSALERT,
    'Show JS Alert');
  model.AddItem(
    MINIBROWSER_CONTEXTMENU_SETJSEVENT,
    'Set mouseover event');
  model.AddItem(
    MINIBROWSER_CONTEXTMENU_COPYHTML,
    'Copy HTML to clipboard');
  model.AddItem(
    MINIBROWSER_CONTEXTMENU_VISITDOM,
    'Visit DOM');
  model.AddItem(
    MINIBROWSER_CONTEXTMENU_JSWRITEDOC,
    'Modify HTML document');
  model.AddItem(
    MINIBROWSER_CONTEXTMENU_JSPRINTDOC,
    'Print using Javascript');
  model.AddItem(
    MINIBROWSER_CONTEXTMENU_REGSCHEME,
    'Register scheme');
  model.AddItem(
    MINIBROWSER_CONTEXTMENU_CLEARFACT,
    'Clear schemes');

  if DevTools.Visible then
    model.AddItem(
      MINIBROWSER_CONTEXTMENU_HIDEDEVTOOLS,
      'Hide DevTools')
  else
    model.AddItem(
      MINIBROWSER_CONTEXTMENU_SHOWDEVTOOLS,
      'Show DevTools');
end;

//procedure TEmbeddedBrowser.ChromiumClose(Sender: TObject;
//  const browser: ICefBrowser; out Result: Boolean);
//begin
// PostMessage(Handle, CEFBROWSER_DESTROYWNDPARENT, 0, 0 {TempPageIndex});
// Result := False;
//end;

procedure TEmbeddedBrowser.ChromiumContextMenuCommand(
  Sender: TObject;
  const browser: ICefBrowser;
  const frame: ICefFrame;
  const params: ICefContextMenuParams;
  commandId: Integer;
  eventFlags: Cardinal; //TCefEventFlags;
  out Result: Boolean);
var
  TempParam: WParam;
  TempFactory: ICefSchemeHandlerFactory;
begin
  Result := False;

  case commandId of
    MINIBROWSER_CONTEXTMENU_HIDEDEVTOOLS:
      PostMessage(Handle, MINIBROWSER_HIDEDEVTOOLS, 0, 0);

    MINIBROWSER_CONTEXTMENU_SHOWDEVTOOLS:
      begin
        TempParam := ((params.XCoord and $FFFF) shl 16) or
          (params.YCoord and $FFFF);
        PostMessage(
          Handle,
          MINIBROWSER_SHOWDEVTOOLS,
          TempParam,
          0);
      end;

    MINIBROWSER_CONTEXTMENU_SHOWJSALERT:
      if (browser <> nil) and (browser.MainFrame <> nil) then
        browser.MainFrame.ExecuteJavaScript(
          'alert(''JavaScript execute works!'');',
          'about:blank',
          0);

    MINIBROWSER_CONTEXTMENU_SETJSEVENT:
      if (browser <> nil) and (browser.MainFrame <> nil) then
        browser.MainFrame.ExecuteJavaScript(
          'document.body.addEventListener("mouseover", function(evt){' +
          'function getpath(n){' +
          'var ret = "<" + n.nodeName + ">";' +
          'if (n.parentNode){return getpath(n.parentNode) + ret} else ' +
          'return ret' +
          '};' +
          'myextension.mouseover(getpath(evt.target))}' +
          ')',
          'about:blank',
          0);

    MINIBROWSER_CONTEXTMENU_COPYHTML:
      PostMessage(Handle, MINIBROWSER_COPYHTML, 0, 0);

    MINIBROWSER_CONTEXTMENU_VISITDOM:
      PostMessage(Handle, MINIBROWSER_VISITDOM, 0, 0);

    MINIBROWSER_CONTEXTMENU_JSWRITEDOC:
      if (browser <> nil) and (browser.MainFrame <> nil) then
        browser.MainFrame.ExecuteJavaScript(
          'var css = ' + chr(39) +
          '@page {size: A4; margin: 0;} @media print {html, body {width: 210mm; height: 297mm;}}'
          + chr(39) + '; ' +
          'var style = document.createElement(' + chr(39) + 'style' + chr(39) +
          '); ' +
          'style.type = ' + chr(39) + 'text/css' + chr(39) + '; ' +
          'style.appendChild(document.createTextNode(css)); ' +
          'document.head.appendChild(style);',
          'about:blank',
          0);

    MINIBROWSER_CONTEXTMENU_JSPRINTDOC:
      if (browser <> nil) and (browser.MainFrame <> nil) then
        browser.MainFrame.ExecuteJavaScript(
          'window.print();',
          'about:blank',
          0);

    MINIBROWSER_CONTEXTMENU_REGSCHEME:
      if (browser <> nil) and
        (browser.host <> nil) and
        (browser.host.RequestContext <> nil) then
        begin
          // You can register the Scheme Handler Factory in the DPR file or later, for example in a context menu command.
          TempFactory := TCefSchemeHandlerFactoryOwn.Create(THelloScheme);
          if not(browser.host.RequestContext.RegisterSchemeHandlerFactory
            ('hello', '', TempFactory)) then
            MessageDlg(
              'RegisterSchemeHandlerFactory error !',
              mtError,
              [mbOk],
              0);
        end;

    MINIBROWSER_CONTEXTMENU_CLEARFACT:
      if (browser <> nil) and
        (browser.host <> nil) and
        (browser.host.RequestContext <> nil) then
        begin
          if not(browser.host.RequestContext.ClearSchemeHandlerFactories) then
            MessageDlg(
              'ClearSchemeHandlerFactories error !',
              mtError,
              [mbOk],
              0);
        end;
  end;
end;


procedure TEmbeddedBrowser.ChromiumFullScreenModeChange(
  Sender       : TObject;
  const browser: ICefBrowser;
  fullscreen   : Boolean);
begin
  if fullscreen then
    begin
      NavControlPnl.Visible := False;
      StatusBar.Visible     := False;

      if (WindowState = wsMaximized) then
        WindowState := wsNormal;

      BorderIcons := [];
      BorderStyle := bsNone;
      WindowState := wsMaximized;
    end
  else
    begin
      BorderIcons := [biSystemMenu, biMinimize, biMaximize];
      BorderStyle := bsSizeable;
      WindowState := wsNormal;

      NavControlPnl.Visible := True;
      StatusBar.Visible     := True;
    end;
end;

procedure TEmbeddedBrowser.ChromiumKeyEvent(
  Sender       : TObject;
  const browser: ICefBrowser;
  const event  : PCefKeyEvent;
  osEvent      : PMsg;
  out Result   : Boolean);
var
  TempMsg: TMsg;
begin
  Result := False;

  if (event <> nil) and (osEvent <> nil) then
    case osEvent.message of
      WM_KEYUP:
        begin
          TempMsg := osEvent^;

          HandleKeyUp(
            TempMsg,
            Result);
        end;

      WM_KEYDOWN:
        begin
          TempMsg := osEvent^;

          HandleKeyDown(
            TempMsg,
            Result);
        end;
    end;
end;

procedure TEmbeddedBrowser.AfterConstruction;
  function FindUniqueName(const Name: string): string;
  var
    I: Integer;
  begin
    I := 0;
    Result := Name;
    while not IsUniqueGlobalComponentName(Result) do
    begin
      Inc(I);
      Result := Format('%s_%d', [Name, I]);
    end;
  end;

begin


  Name := ClassName.Substring(1) + TEmbeddedBrowser.FNumber.ToString  ;//  FindUniqueName( self.Name ) ;
  Inc ( TEmbeddedBrowser.FNumber ) ;
  inherited;



end;

procedure TEmbeddedBrowser.ApplicationEventsMessage(
  var Msg    : tagMSG;
  var Handled: Boolean);
begin
  case Msg.message of
    WM_KEYUP:
      HandleKeyUp(Msg, Handled);
    WM_KEYDOWN:
      HandleKeyDown(Msg, Handled);
  end;
end;

procedure TEmbeddedBrowser.HandleKeyUp(
  const aMsg  : TMsg;
  var aHandled: Boolean);
var
  TempMessage: TMessage;
  TempKeyMsg: TWMKey;
begin
  TempMessage.Msg    := aMsg.message;
  TempMessage.WParam := aMsg.WParam;
  TempMessage.lParam := aMsg.lParam;
  TempKeyMsg         := TWMKey(TempMessage);

  if (TempKeyMsg.CharCode = VK_F12) then
    begin
      aHandled := True;

      if DevTools.Visible then
        PostMessage(
          Handle,
          MINIBROWSER_HIDEDEVTOOLS,
          0,
          0)
      else
        PostMessage(
          Handle,
          MINIBROWSER_SHOWDEVTOOLS,
          0,
          0);
    end;
end;

procedure TEmbeddedBrowser.HandleKeyDown(
  const aMsg  : TMsg;
  var aHandled: Boolean);
var
  TempMessage: TMessage;
  TempKeyMsg: TWMKey;
begin
  TempMessage.Msg    := aMsg.message;
  TempMessage.WParam := aMsg.WParam;
  TempMessage.lParam := aMsg.lParam;
  TempKeyMsg         := TWMKey(TempMessage);

  if (TempKeyMsg.CharCode = VK_F12) then
    aHandled := True;
end;

procedure TEmbeddedBrowser.ChromiumLoadingStateChange(
  Sender                            : TObject;
  const browser                     : ICefBrowser;
  isLoading, canGoBack, canGoForward: Boolean);
begin
  BackBtn.Enabled    := canGoBack;
  ForwardBtn.Enabled := canGoForward;
  ReloadBtn.Enabled  := not(isLoading);
  StopBtn.Enabled    := isLoading;
end;

procedure TEmbeddedBrowser.ChromiumPreKeyEvent(
  Sender                        : TObject;
  const browser                 : ICefBrowser;
  const event                   : PCefKeyEvent;
  osEvent                       : PMsg;
  out isKeyboardShortcut, Result: Boolean);
begin
  Result := False;

  if (event <> nil) and
    (event.kind in [KEYEVENT_KEYDOWN, KEYEVENT_KEYUP]) and
    (event.windows_key_code = VK_F12) then
    isKeyboardShortcut := True;
end;

procedure TEmbeddedBrowser.ChromiumProcessMessageReceived(
  Sender       : TObject;
  const browser: ICefBrowser;
  sourceProcess: TCefProcessId;
  const message: ICefProcessMessage;
  out Result   : Boolean);
begin
  if (message <> nil) and (message.Name = 'mouseover') and
    (message.ArgumentList <> nil) then
    begin
      // Message received from the extension
      StatusBar.Panels[0].Text := message.ArgumentList.GetString(0);
      Result                   := True;
    end
  else
    Result := False;
end;

procedure TEmbeddedBrowser.ChromiumStatusMessage(
  Sender       : TObject;
  const browser: ICefBrowser;
  const value  : ustring);
begin
  StatusBar.Panels[0].Text := value;
end;

procedure TEmbeddedBrowser.ChromiumTextResultAvailable(Sender: TObject;
  const aText: ustring);
begin
   clipboard.AsText := aText;
end;

procedure TEmbeddedBrowser.ChromiumTitleChange(
  Sender       : TObject;
  const browser: ICefBrowser;
  const title  : ustring);
begin
  if (title <> '') then
    caption := 'CDL Browser - ' + title
  else
    caption := 'CDL Browser';
end;

procedure TEmbeddedBrowser.BrowserCreatedMsg(var aMessage: TMessage);
//var
//  x: ustring;
begin
  Chromium.ProxyType := 2;
  Chromium.NotifyMoveOrResizeStarted;
(*
 if (Chromium.browser <> nil) and
    (Chromium.browser.host <> nil) and
    (Chromium.browser.host.RequestContext <> nil) then
    begin
      // You can register the Scheme Handler Factory in the DPR file or later, for example in a context menu command.
      //FXMLScheme :=
      TCefSchemeHandlerFactoryOwn.Create(uHelloScheme.TXMLScheme);
      if not(Chromium.browser.host.RequestContext.RegisterSchemeHandlerFactory
        ('xml', '', FXMLScheme)) then
        MessageDlg(
          'RegisterSchemeHandlerFactory error !',
          mtError,
          [mbOk],
          0);
    end;
*)
  NavControlPnl.Enabled := True;
  Application.ProcessMessages;


    PostMessage(
    Handle,
    MINIBROWSER_INIT,
    0,
    0);


//  ThreadSuppl.TSyncThread.Create(InitPage);

  // AddURL(MINIBROWSER_HOMEPAGE);
  // Chromium.LoadURL(MINIBROWSER_HOMEPAGE);

end;

procedure TEmbeddedBrowser.BrowserDestroyWindowParentMsg(
  var aMessage: TMessage);
begin
//  CEFWindowParent.Free ;
end;

procedure TEmbeddedBrowser.AddURL(const aURL: string);
begin
  if (URLCbx.Items.IndexOf(aURL) < 0) then
    URLCbx.Items.Add(aURL);

  URLCbx.Text := aURL;
end;

procedure TEmbeddedBrowser.ShowDevToolsMsg(var aMessage: TMessage);
var
  TempPoint: TPoint;
begin
  TempPoint.x := (aMessage.WParam shr 16) and $FFFF;
  TempPoint.y := aMessage.WParam and $FFFF;
  ShowDevTools(TempPoint);
end;

procedure TEmbeddedBrowser.URLCbxKeyPress(
  Sender : TObject;
  var Key: Char);
begin
  if Key <> #13 then
    exit;
  Key := #0;
  GoBtnClick(Sender);
end;

procedure TEmbeddedBrowser.HideDevToolsMsg(var aMessage: TMessage);
begin
  HideDevTools;
end;

procedure TEmbeddedBrowser.Inczoom1Click(Sender: TObject);
begin
  Chromium.IncZoomStep;
end;

procedure TEmbeddedBrowser.InitPage(var aMessage : TMessage);
begin
  // Chromium.Visible := True ;
  // Chromium.HandleNeeded ;
  FInited := True ;
  DoInitPage;
  Repaint;
end;

procedure TEmbeddedBrowser.LoadFile(const AFileName: string);
var
  LFileName: string;
begin
  LFileName := StringReplace(
    AFileName.Replace('\', '/'),
    ' ',
    '%20',
    [rfReplaceAll]);
  Chromium.LoadURL(format('file:///%s', [LFileName]));
end;

procedure TEmbeddedBrowser.Openfile1Click(Sender: TObject);
begin
  if OpenDialog.Execute then
    Chromium.LoadURL('file:///' + OpenDialog.FileName);
end;

procedure TEmbeddedBrowser.PopupMenuPopup(Sender: TObject);
begin
  if DevTools.Visible then
    DevToolsMenuItem.caption := 'Hide DevTools'
  else
    DevToolsMenuItem.caption := 'Show DevTools';
end;

procedure TEmbeddedBrowser.Preferences1Click(Sender: TObject);
begin
  PreferencesFrm.ProxyTypeCbx.ItemIndex  := Chromium.ProxyType;
  PreferencesFrm.ProxyServerEdt.Text     := Chromium.ProxyServer;
  PreferencesFrm.ProxyPortEdt.Text       := inttostr(Chromium.ProxyPort);
  PreferencesFrm.ProxyUsernameEdt.Text   := Chromium.ProxyUsername;
  PreferencesFrm.ProxyPasswordEdt.Text   := Chromium.ProxyPassword;
  PreferencesFrm.ProxyScriptURLEdt.Text  := Chromium.ProxyScriptURL;
  PreferencesFrm.ProxyByPassListEdt.Text := Chromium.ProxyByPassList;
  PreferencesFrm.HeaderNameEdt.Text      := Chromium.CustomHeaderName;
  PreferencesFrm.HeaderValueEdt.Text     := Chromium.CustomHeaderValue;

  if (PreferencesFrm.ShowModal = mrOk) then
    begin
      Chromium.ProxyType         := PreferencesFrm.ProxyTypeCbx.ItemIndex;
      Chromium.ProxyServer       := PreferencesFrm.ProxyServerEdt.Text;
      Chromium.ProxyPort         := strtoint(PreferencesFrm.ProxyPortEdt.Text);
      Chromium.ProxyUsername     := PreferencesFrm.ProxyUsernameEdt.Text;
      Chromium.ProxyPassword     := PreferencesFrm.ProxyPasswordEdt.Text;
      Chromium.ProxyScriptURL    := PreferencesFrm.ProxyScriptURLEdt.Text;
      Chromium.ProxyByPassList   := PreferencesFrm.ProxyByPassListEdt.Text;
      Chromium.CustomHeaderName  := PreferencesFrm.HeaderNameEdt.Text;
      Chromium.CustomHeaderValue := PreferencesFrm.HeaderValueEdt.Text;

      Chromium.UpdatePreferences;
    end;
end;

procedure TEmbeddedBrowser.Print1Click(Sender: TObject);
begin
  Chromium.Print;
end;

procedure TEmbeddedBrowser.PrintinPDF1Click(Sender: TObject);
begin
  SaveDialog.DefaultExt := 'pdf';
  SaveDialog.Filter     := 'PDF files (*.pdf)|*.PDF';

  if SaveDialog.Execute and (length(SaveDialog.FileName) > 0) then
    Chromium.PrintToPDF(
      SaveDialog.FileName,
      Chromium.DocumentURL,
      Chromium.DocumentURL);
end;

procedure TEmbeddedBrowser.ConfigBtnClick(Sender: TObject);
var
  TempPoint: TPoint;
begin
  TempPoint.x := ConfigBtn.left;
  TempPoint.y := ConfigBtn.top + ConfigBtn.Height;
  TempPoint   := ConfigPnl.ClientToScreen(TempPoint);

  PopupMenu.Popup(
    TempPoint.x,
    TempPoint.y);
end;

procedure TEmbeddedBrowser.CopyHTMLMsg(var aMessage: TMessage);
begin
  Chromium.RetrieveHTML;
end;

function TEmbeddedBrowser.CreateField(
  const AValue: String ): ICefPostDataElement;
var
 LValue : AnsiString ;
begin
  LValue := AnsiString ( AValue ) ;
  Result := TCefPostDataElementRef.New;
  Result.SetToBytes(
    length(LValue),
    PAnsiChar(LValue)
  );
end;

procedure TEmbeddedBrowser.VisitDOMMsg(var aMessage: TMessage);
var
  TempMsg: ICefProcessMessage;
begin
  // Only works using a TCefCustomRenderProcessHandler.
  // Use the ArgumentList property if you need to pass some parameters.
  TempMsg := TCefProcessMessageRef.New('retrievedom');
  // Same name than TCefCustomRenderProcessHandler.MessageName
  Chromium.SendProcessMessage(
    PID_RENDERER,
    TempMsg);
end;

procedure TEmbeddedBrowser.WMMove(var aMessage: TWMMove);
begin
  inherited;
  if (Chromium <> nil) and Showing then
    Chromium.NotifyMoveOrResizeStarted;
end;

procedure TEmbeddedBrowser.WMMoving(var aMessage: TMessage);
begin
  inherited;
  if (Chromium <> nil) and Showing then
    Chromium.NotifyMoveOrResizeStarted;
end;

procedure TEmbeddedBrowser.Deczoom1Click(Sender: TObject);
begin
  Chromium.DecZoomStep;
end;

procedure TEmbeddedBrowser.DevToolsMenuItemClick(Sender: TObject);
begin
  if DevTools.Visible then
    HideDevTools
  else
    ShowDevTools;
end;

procedure TEmbeddedBrowser.ShowDevTools(aPoint: TPoint);
begin
  Splitter.Visible := True;
  DevTools.Visible := True;
  DevTools.Width   := Width div 4;
  Chromium.ShowDevTools(
    aPoint,
    DevTools);
end;

procedure TEmbeddedBrowser.SetParent(Value: TWinControl);
begin
  FParent := Value;
  if not Assigned ( FParent ) and FInited then
    begin
//     Chromium.CloseBrowser( True );
//     CEFWindowParent.Free ;
    end;
    try
      Hide ;
      inherited SetParent ( FParent ) ;
    except

    end;
end;

procedure TEmbeddedBrowser.ShowDevTools;
var
  TempPoint: TPoint;
begin
  TempPoint.x := low(Integer);
  TempPoint.y := low(Integer);
  ShowDevTools(TempPoint);
end;

procedure TEmbeddedBrowser.HideDevTools;
begin
  Chromium.CloseDevTools(DevTools);
  Splitter.Visible := False;
  DevTools.Visible := False;
  DevTools.Width   := 0;

  //ChromiumWindow1.Create();
end;

const
  _EWB = 'EWB2';

var
  LEWBPath: string;

  (*
    procedure OnbeforeCmdLine(const processType: ustring; const commandLine: ICefCommandLine);
    const
    _PPAPI_FLASH_DLL = '%spepflashplayer.dll' ;
    begin
    commandLine.AppendSwitch('enable-ppapi');
    commandLine.AppendSwitchWithValue('ppapi-flash-path', Format( _PPAPI_FLASH_DLL, [LEWBPath] ));
    commandLine.AppendSwitchWithValue('plugin-policy', 'allow');
    end;
  *)
procedure InitializeEmbeddedWebBrowser;
const
  _PPAPI_FLASH_DLL = '%spepflashplayer.dll';
begin
  TEmbeddedBrowser.FNumber := 0 ;

  LEWBPath := format(
      '%s%s\'
    , [
        ExtractFilePath(ParamStr(0))
      , _EWB
      ]
    );

  SetEnvironmentVariable(
    'Path'
    , PChar(
        format(
           '%s;%s'
         , [  LEWBPath
            , GetEnvironmentVariable('Path')
           ]
        )
      )
  );

  GlobalCEFApp            := TCefApplication.Create;
  GlobalCEFApp.FastUnload := True;
  // Enable the fast unload controller, which speeds up tab/window close by running a tab's onunload js handler independently of the GUI
  GlobalCEFApp.FrameworkDirPath := LEWBPath;
  GlobalCEFApp.ResourcesDirPath := LEWBPath;
  GlobalCEFApp.LocalesDirPath   := LEWBPath + '\locales';

  // In case you want to use custom directories for the CEF3 binaries, cache, cookies and user data.
  {
    GlobalCEFApp.cache                := 'cef\cache';
    GlobalCEFApp.cookies              := 'cef\cookies';
    GlobalCEFApp.UserDataPath         := 'cef\User Data';
  }

  // GlobalCEFApp.RemoteDebuggingPort := 9000;
  // GlobalCEFApp.RenderProcessHandler := TCustomRenderProcessHandler.Create;
  // GlobalCEFApp.BrowserProcessHandler := TCefBrowserProcessHandlerOwn.Create;

  GlobalCEFApp.SingleProcess         := False ; //True; //

  GlobalCEFApp.BrowserSubprocessPath := format(
    '%sTc%s.exe'
    ,
    [
        LEWBPath
      , 'EWB' //_EWB
    ]
    );

  GlobalCEFApp.FlashEnabled := True;
  GlobalCEFApp.AddCustomCommandLine('enable-ppapi');
  GlobalCEFApp.AddCustomCommandLine(
    'ppapi-flash-path',
    format(_PPAPI_FLASH_DLL, [LEWBPath]));
  GlobalCEFApp.AddCustomCommandLine(
    'plugin-policy',
    'allow');

  GlobalCEFApp.StartMainProcess;

end;

initialization
  RegisterClass( TEmbeddedBrowser ) ;
  InitializeEmbeddedWebBrowser

finalization
// SetErrorMode(SEM_NOGPFAULTERRORBOX);
  GlobalCEFApp.Free;

end.
