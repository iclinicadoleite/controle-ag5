unit TeamViewerMon;

interface

uses
  WinApi.Windows, System.Classes, Dialogs ;

type

  TTVMonitor = record
    TEXT_INFO        : string ;
    EDIT_ID          : string ;
    EDIT_PASSWORD    : string ;
    TEXT_SESSIONCODE : string ;
    EDIT_SESSIONCODE : string ;
    TEXT_YOURNAME    : string ;
    EDIT_YOURNAME    : string ;
    TEXT_STATUS1     : string ;
    TEXT_STATUS2     : string ;
    BUTTON_CLOSE     : string ;
    TEXT_WEBSITE     : string ;
  end;

  TTvCallBackProc = procedure ( ATVMonitor : TTVMonitor ) of object ;

  TTeamViewerMonitor = class(TThread)
  private
    { Private declarations }
    FTVHandle : HWND ;
    FTVWindows : TList ;
    FTVInfo : TTVMonitor ;
    FCallBack: TTvCallBackProc;
    FChanged : boolean ;
    FEndSession: TNotifyEvent;
    FUpdateInfo : function : boolean of object ;
    procedure GetWindowsList ;
    function  UpdateInfo8 : boolean ;
    function  UpdateInfo9 : boolean ;
    procedure SetTVHandle(const Value: HWND);
    procedure SetCallBack(const Value: TTvCallBackProc);
    procedure SetEndSession(const Value: TNotifyEvent);
  protected
    procedure Execute; override;
    procedure DoCallBack ;
    procedure DoEndSession ;
  published
    property  TVHandle : HWND  read FTVHandle write SetTVHandle;
    property OnCallBack : TTvCallBackProc read FCallBack write SetCallBack;
    property OnEndSession : TNotifyEvent  read FEndSession write SetEndSession;
  end;


implementation

uses Messages ;

const
  _TEXT_INFO_8        = 0 ;
  _EDIT_ID_8          = 1 ;
  _EDIT_PASSWORD_8    = 2 ;
  _TEXT_SESSIONCODE_8 = 3 ;
  _EDIT_SESSIONCODE_8 = 4 ;
  _TEXT_YOURNAME_8    = 5 ;
  _EDIT_YOURNAME_8    = 6 ;
  _TEXT_STATUS1_8     = 7 ;
  _TEXT_STATUS2_8     = 8 ;
  _BUTTON_CLOSE_8     = 9 ;
  _TEXT_WEBSITE_8     = 10 ;


  _TEXT_INFO_9        = 0 ;
  _EDIT_ID_9          = 1 ;
  _EDIT_PASSWORD_9    = 2 ;
  _TEXT_STATUS1_9     = 3 ;
  _TEXT_STATUS2_9     = 4 ;
  _BUTTON_CLOSE_9     = 5 ;
  _TEXT_WEBSITE_9     = 6 ;
  _TEXT_STATUS_X      = 7 ;

function GetTextFromWindow(wnd: HWND): string;
var
  count: Cardinal;
begin
  result := '';
  if SendMessageTimeout(wnd, WM_GETTEXTLENGTH, 0, 0,
    SMTO_ABORTIFHUNG, 1000, count) <> 0 then
  begin
    if count = 0 then
      Exit;
    SetLength(result, count);
    if SendMessageTimeout(wnd, WM_GETTEXT, count + 1, lparam(@result[1]),
      SMTO_ABORTIFHUNG, 1000, count) = 0 then
      result := '';
  end;
end;


{ TTeamViewerMonitor }

procedure TTeamViewerMonitor.DoCallBack;
begin
  if FChanged and Assigned ( FCallBack )  then
     FCallBack( self.FTVInfo ) ;
  FChanged := False ;
end;

procedure TTeamViewerMonitor.DoEndSession;
begin
  if Assigned ( FEndSession )  then
     FEndSession( self ) ;
end;

procedure TTeamViewerMonitor.Execute;
begin
  if not IsWindow ( FTVHandle ) then
     exit ;

  FTVWindows := TList.Create ;
  GetWindowsList;

  if (FTVWindows.Count = 8) or (FTVWindows.Count = 9) then
     FUpdateInfo  := UpdateInfo9
  else
     FUpdateInfo  := UpdateInfo8 ;

  while IsWindow ( FTVHandle ) and not Terminated do
    begin
        FUpdateInfo ;
        Synchronize ( DoCallBack ) ;
        Sleep( 100 ) ;
    end;

  FTVWindows.free ;

  if not IsWindow ( FTVHandle ) then
     Synchronize ( DoEndSession ) ;

end;



procedure TTeamViewerMonitor.GetWindowsList;
    function EnumWindowsCallback( hwnd: HWND; AList : TList ) : BOOL  ; stdcall;
    begin
       AList.Add( Pointer ( hwnd ) ) ;
       Result := True ;
    end;
begin
  FTVWindows.Clear ;
  EnumChildWindows ( FTVHandle, @EnumWindowsCallback, Integer ( FTVWindows ) ) ;
end;

procedure TTeamViewerMonitor.SetCallBack(const Value: TTvCallBackProc);
begin
  FCallBack := Value;
end;

procedure TTeamViewerMonitor.SetEndSession(const Value: TNotifyEvent);
begin
  FEndSession := Value;
end;

procedure TTeamViewerMonitor.SetTVHandle(const Value: HWND);
begin
  FTVHandle := Value;
end;

function TTeamViewerMonitor.UpdateInfo8 : boolean ;
var
  FieldChanged : boolean ;
  TempString : string ;
begin
 FChanged := False ;

 with FTVInfo do
   begin

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_INFO_8        ] ) ) ;
     FieldChanged := (TEXT_INFO <> TempString) ;              // informe o ID
     if FieldChanged then
       TEXT_INFO  :=  TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _EDIT_ID_8          ] ) ) ;  //-      ID
     FieldChanged := (EDIT_ID <> TempString) ;
     if FieldChanged then
       EDIT_ID    := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _EDIT_PASSWORD_8    ] ) ) ; //-  SENHA
     FieldChanged := (EDIT_PASSWORD <> TempString) ;
     if FieldChanged then
       EDIT_PASSWORD  := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_SESSIONCODE_8 ] ) ) ;     /// inicialziando ...
     FieldChanged := (TEXT_SESSIONCODE <> TempString) ;
     if FieldChanged then
       TEXT_SESSIONCODE  := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _EDIT_SESSIONCODE_8 ] ) ) ;  // ''
     FieldChanged := (EDIT_SESSIONCODE <> TempString) ;
     if FieldChanged then
       EDIT_SESSIONCODE  := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_YOURNAME_8    ] ) ) ;   // cancelar
     FieldChanged := (TEXT_YOURNAME <> TempString) ;
     if FieldChanged then
       TEXT_YOURNAME     := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _EDIT_YOURNAME_8    ] ) ) ;    // wwww
     FieldChanged := (EDIT_YOURNAME <> TempString) ;
     if FieldChanged then
       EDIT_YOURNAME     := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_STATUS1_8     ] ) ) ;  // --
     FieldChanged := (TEXT_STATUS1 <> TempString) ;
     if FieldChanged then
       TEXT_STATUS1      := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_STATUS2_8     ] ) ) ;
     FieldChanged := (TEXT_STATUS2 <> TempString) ;
     if FieldChanged then
       TEXT_STATUS2      := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _BUTTON_CLOSE_8     ] ) ) ;
     FieldChanged := (BUTTON_CLOSE <> TempString) ;
     if FieldChanged then
       BUTTON_CLOSE      := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_WEBSITE_8     ] ) ) ;
     FieldChanged := (TEXT_WEBSITE <> TempString) ;
     if FieldChanged then
       TEXT_WEBSITE      := TempString ;
     FChanged :=  FChanged or FieldChanged ;
   end;

end;


function TTeamViewerMonitor.UpdateInfo9 : boolean ;
var
  FieldChanged : boolean ;
  TempString : string ;
begin
 FChanged := False ;

 with FTVInfo do
   begin

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_INFO_9     ] ) ) ;
     FieldChanged := (TEXT_INFO <> TempString) ;              // informe o ID
     if FieldChanged then
       TEXT_INFO  :=  TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _EDIT_ID_9          ] ) ) ;  //-      ID
     FieldChanged := (EDIT_ID <> TempString) ;
     if FieldChanged then
       EDIT_ID    := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _EDIT_PASSWORD_9   ] ) ) ; //-  SENHA
     FieldChanged := (EDIT_PASSWORD <> TempString) ;
     if FieldChanged then
       EDIT_PASSWORD  := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_STATUS1_9 ] ) ) ;     /// inicialziando ...
     FieldChanged := (TEXT_STATUS1 <> TempString) ;
     if FieldChanged then
       TEXT_SESSIONCODE  := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_STATUS2_9 ] ) ) ;  // ''
     FieldChanged := (TEXT_STATUS2 <> TempString) ;
     if FieldChanged then
       EDIT_SESSIONCODE  := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _BUTTON_CLOSE_9  ] ) ) ;   // cancelar
     FieldChanged := (BUTTON_CLOSE <> TempString) ;
     if FieldChanged then
       TEXT_YOURNAME     := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_WEBSITE_9    ] ) ) ;    // wwww
     FieldChanged := (TEXT_WEBSITE <> TempString) ;
     if FieldChanged then
       EDIT_YOURNAME     := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_STATUS1_9     ] ) ) ;  // --
     FieldChanged := (TEXT_STATUS1 <> TempString) ;
     if FieldChanged then
       TEXT_STATUS1      := TempString ;
     FChanged :=  FChanged or FieldChanged ;

     TempString := GetTextFromWindow( HWND( FTVWindows [ _TEXT_STATUS_X     ] ) ) ;
     //ShowMEssage ( TempString ) ;
   end;

end;


end.

