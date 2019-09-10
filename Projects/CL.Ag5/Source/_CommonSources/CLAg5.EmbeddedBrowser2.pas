unit CLAg5.EmbeddedBrowser2;

interface

{.$I cef.inc}

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  VCL.StdCtrls, VCL.Buttons, VCL.ActnList, VCL.Menus, VCL.ComCtrls, VCL.ExtCtrls, XPMan, System.Actions,
  Vcl.OleCtrls, SHDocVw, ActiveX, shellAPI ;

type

(*
  TWebBrowser = class(SHDocVw.TWebBrowser, IOleCommandTarget)
  private
    function QueryStatus(CmdGroup: PGUID; cCmds: Cardinal; prgCmds: POleCmd;
      CmdText: POleCmdText): HRESULT; stdcall;
    function Exec(CmdGroup: PGUID; nCmdID, nCmdexecopt: DWORD;
      const vaIn: OleVariant; var vaOut: OleVariant): HRESULT; stdcall;
  end;
*)

  TEmbeddedBrowser2 = class(TForm)
    Splitter: TSplitter;
    StatusBar: TStatusBar;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  protected
    procedure DoInitPage ; virtual ; abstract ;
    procedure OpenApp(const aPath: string ; AParams : string ) ;
  private
    FLoading: Boolean;
    procedure InitPage;
  public
    procedure AfterConstruction ; override ;
  end;

implementation

uses
  Registry, ThreadSuppl ;

const
  CUSTOMMENUCOMMAND_INSPECTELEMENT = 7241221;

{$R *.dfm}

procedure TEmbeddedBrowser2.OpenApp(const aPath: string ; AParams : string );
var
  LParams : string ;
  Rec: TShellExecuteInfo;
  Dir: String;
  fAppHandle: Hwnd;
  function GetAppHandle(aProcessID: DWORD): Hwnd;
  type
    PAppProcInfo = ^AppProcInfo;

    AppProcInfo = record
      ProcessID: DWORD;
      Hwnd: Hwnd;
    end;
  var
    DaHandle: Hwnd;
    pi: AppProcInfo;
    function EnumProc(Hwnd: Hwnd; lParam: lParam): BOOL; stdcall;
    var
      dwProcessID: DWORD;
    begin
      GetWindowThreadProcessId(Hwnd, @dwProcessID);
      if dwProcessID = PAppProcInfo(lParam)^.ProcessID then
      begin
        PAppProcInfo(lParam)^.Hwnd := Hwnd;
        Result := False;
      end
      else
        Result := True;
    end;

  begin
    pi.ProcessID := aProcessID;
    pi.Hwnd := 0;
    EnumWindows(@EnumProc, lParam(@pi));
    Result := pi.Hwnd;
  end;

begin                                                                                                                                        //ExtractFilePath( ParamStr(0)
  LParams := AParams  + Format ( ' --ppapi-out-of-process --register-pepper-plugins="pepflashplayer.dll;application/x-shockwave-flash"', [  'c:\' ] ) ;
  Dir := ExtractFilePath(aPath);
  ZeroMemory(@Rec, SizeOf(Rec));
  Rec.cbSize := SizeOf(Rec);
  Rec.fMask := SEE_MASK_NOCLOSEPROCESS;
  Rec.lpVerb := 'open';
  Rec.lpFile := PChar(aPath);
  Rec.lpParameters := PChar ( LParams );
  Rec.lpDirectory := PChar(Dir);
  Rec.nShow := SW_HIDE;
  if ShellExecuteEx(@Rec) then
  begin
(*
    WaitForInputIdle(Rec.hProcess, 5000);
    fAppHandle := GetAppHandle(GetProcessID(Rec.hProcess));
    CloseHandle(Rec.hProcess);
    if fAppHandle <> 0 then
    begin
      WinAPI.Windows.SetParent(fAppHandle, Handle);
      ShowWindow(fAppHandle, SW_SHOW);
    end;
*)
  end;
end;


(*
function TWebBrowser.QueryStatus(CmdGroup: PGUID; cCmds: Cardinal;
  prgCmds: POleCmd; CmdText: POleCmdText): HRESULT; stdcall;
begin
  Result := S_OK;
end;

function TWebBrowser.Exec(CmdGroup: PGUID; nCmdID, nCmdexecopt: DWORD;
  const vaIn: OleVariant; var vaOut: OleVariant): HRESULT; stdcall;
begin
  // presume that all commands can be executed; for list of available commands
  // see SHDocVw.pas unit, using this event you can suppress or create custom
  // events for more than just script error VCL.Dialogs, there are commands like
  // undo, redo, refresh, open, save, print etc. etc.
  // be careful, because not all command results are meaningful, like the one
  // with script error message boxes, I would expect that if you return S_OK,
  // the error dialog will be displayed, but it's vice-versa
  Result := S_OK;

  // there's a script error in the currently executed script, so
  if nCmdID = OLECMDID_SHOWSCRIPTERROR then
  begin
    // if you return S_FALSE, the script error dialog is shown
    Result := S_FALSE;
    // if you return S_OK, the script error dialog is suppressed
    Result := S_OK;
  end;
end;
*)

{ TMainForm }

procedure TEmbeddedBrowser2.InitPage;
begin
//  Chromium.Visible := True ;
//  Chromium.HandleNeeded ;
  DoInitPage ;
end;


procedure TEmbeddedBrowser2.AfterConstruction;
begin
  inherited;
end;

procedure TEmbeddedBrowser2.FormActivate(Sender: TObject);
begin
  InitPage ;
  self.OnActivate := nil ;
end;

procedure TEmbeddedBrowser2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree ;
end;

procedure TEmbeddedBrowser2.FormCreate(Sender: TObject);
begin
  FLoading := False;
end;


initialization

finalization
  SetErrorMode(SEM_NOGPFAULTERRORBOX);
end.
