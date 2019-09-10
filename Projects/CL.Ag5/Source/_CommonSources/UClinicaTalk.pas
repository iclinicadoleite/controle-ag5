unit UClinicaTalk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Tc.VCL.Form,
  JvExExtCtrls, JvExtComponent, JvPanel,
  CL.Ag5.NSMsgs, TeamViewerMon, System.Actions, Vcl.ActnList, Tc.VCL.Application;

type
  TClinicaTalk = class(TTcForm)
    _PanelSuporte: TPanel;
    ImageSuporte: TImage;
    lblSuporte_Fone: TLabel;
    lblSuporte_ID: TLabel;
    lblSuporte_Status: TLabel;
    lblSuporte_Info: TLabel;
    _SupporteConnect: TLabel;
    _SupporteConnectImg: TImage ;
    procedure _SupporteConnectClick(Sender: TObject);
    procedure TcFormDeactivate(Sender: TObject);
    procedure _SupporteConnectImgMouseEnter(Sender: TObject);
    procedure _SupporteConnectImgMouseLeave(Sender: TObject);
    procedure TcFormCreate(Sender: TObject);
    procedure TcFormShow(Sender: TObject);
  private
    { Private declarations }
    FHideOnDeactivate : boolean ;
    procedure CheckStartSuporteOnLine ;
    function  SuporteOnLine : boolean ;
    procedure SuporteShowInfo;
    procedure SuporteHideInfo;
    procedure OnSuporteUpdateStatus(ATVMonitor: TTVMonitor);
    procedure OnSuporteEndSession(Sender: TObject);
    procedure SupportUpdated ( AMsg : TCLAg5NSMsg ) ;
    procedure SupportFinished ( AMsg : TCLAg5NSMsg ) ;
    procedure ShowTalk( AMsg : TCLAg5NSMsg ) ;
    procedure HideTalk( AMsg : TCLAg5NSMsg ) ;
    procedure SubScribe ;
    procedure UnSubscribe ;
    procedure CheckTeamViewerIsOpen;
  public
    { Public declarations }
    destructor Destroy ; override ;
  end;

var
  ClinicaTalk: TClinicaTalk;

implementation

{$R *.dfm}

uses
    ShellAPI
  , System.Threading ;

procedure TClinicaTalk.SuporteShowInfo;
begin
 lblSuporte_Info.Visible   := False ;
 lblSuporte_ID.Caption     := '' ;
 lblSuporte_Status.Caption := 'iniciando suporte remoto' ;
 lblSuporte_ID.Visible     := True ;
 lblSuporte_Status.Visible := True ;
 _SupporteConnect.visible  := False ;
 _SupporteConnectImg.visible  := False ;
 Application.ProcessMessages ;
end;


procedure TClinicaTalk.TcFormCreate(Sender: TObject);
begin
  Subscribe;
  CheckTeamViewerIsOpen;
end;

procedure TClinicaTalk.TcFormDeactivate(Sender: TObject);
begin
  if FHideOnDeactivate then
   self.hide
end;

procedure TClinicaTalk.TcFormShow(Sender: TObject);
begin
  ITask(
    TTask.Create (
      procedure
      begin
        TThread.Synchronize ( nil,
          procedure
            begin
              CheckStartSuporteOnLine ;
            end
        )
      end
    )
  ).Start ;
end;

procedure TClinicaTalk.ShowTalk(AMsg: TCLAg5NSMsg);
begin
   OnShow := nil ;
   Show ;
   OnShow := TcFormShow ;
end;

procedure TClinicaTalk.SubScribe;
begin
  TCLAg5NSMsgSupportUpdateStatus.Subscribe ( SupportUpdated ) ;
  TCLAg5NSMsgSupportFinished.Subscribe ( SupportFinished ) ;
  TCLAg5NSMsgShowTalk.Subscribe ( ShowTalk ) ;
  TCLAg5NSMsgHideTalk.Subscribe ( HideTalk ) ;

end;

procedure TClinicaTalk.UnSubscribe;
begin
  TCLAg5NSMsgSupportUpdateStatus.UnSubscribe( SupportUpdated ) ;
  TCLAg5NSMsgSupportFinished.UnSubscribe( SupportFinished );

  TCLAg5NSMsgShowTalk.UnSubscribe( ShowTalk ) ;
  TCLAg5NSMsgHideTalk.UnSubscribe( HideTalk ) ;

end;

procedure TClinicaTalk.SuporteHideInfo;
begin
 lblSuporte_Info.Visible     := False ;
 lblSuporte_ID.Visible       := False ;
 lblSuporte_Status.Visible   := False ;
 _SupporteConnect.visible    := True ;
 _SupporteConnectImg.visible    := True ;
 Application.ProcessMessages ;
end;

var
  InternalTVMonitor : TTVMonitor ;

procedure TClinicaTalk.CheckStartSuporteOnLine;
begin
 FHideOnDeactivate := True ;
 if MessageDlg( 'Iniciar suporte on-line?', mtConfirmation ) <> mrYes then
   begin
     Visible := False ;
     Exit ;
   end;
 FHideOnDeactivate := False ;
 SuporteShowInfo ;
 if not SuporteOnLine then
   begin
    FHideOnDeactivate := True ;
    MessageDlg( 'Suporte remoto não iniciado.' ) ;
    SuporteHideInfo ;
   end
 else
  begin
    SupportUpdated(nil);
  end;
end;

procedure TClinicaTalk.SupportFinished(AMsg: TCLAg5NSMsg);
begin
  SuporteHideInfo;
end;

procedure TClinicaTalk.SupportUpdated(AMsg: TCLAg5NSMsg);
begin
  lblSuporte_Info.Visible     := True ;
  lblSuporte_ID.Visible       := True ;
  lblSuporte_Status.Visible   := True ;
  lblSuporte_ID.Caption       := 'ID : ' + InternalTVMonitor.EDIT_ID ;
  lblSuporte_Status.Caption   := InternalTVMonitor.TEXT_STATUS1  ;
  _SupporteConnect.Visible    := False ;
  Application.ProcessMessages ;
end;

procedure TClinicaTalk._SupporteConnectClick(Sender: TObject);
begin
  CheckStartSuporteOnLine ;
end;

procedure TClinicaTalk._SupporteConnectImgMouseEnter(Sender: TObject);
begin
  _SupporteConnect.Font.Style := _SupporteConnect.Font.Style  + [fsUnderline]
end;

procedure TClinicaTalk._SupporteConnectImgMouseLeave(Sender: TObject);
begin
  _SupporteConnect.Font.Style := _SupporteConnect.Font.Style  - [fsUnderline]
end;

function RunAsAdmin(hWnd: hWnd; filename: string; Parameters: string): Boolean;
 { See Step 3: Redesign for UAC Compatibility (UAC)    http://msdn.microsoft.com/en-us/library/bb756922.aspx }
var
 sei: TShellExecuteInfo;
begin
 ZeroMemory(@sei, SizeOf(sei));
 sei.cbSize := SizeOf(TShellExecuteInfo);
 sei.Wnd := hWnd;
 sei.fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
 sei.lpVerb := PChar('runas');
 sei.lpFile := PChar(filename); // PAnsiChar;
 if parameters <> '' then
    sei.lpParameters := PChar(parameters); // PAnsiChar;
 sei.nShow := SW_SHOWMINNOACTIVE ; //Integer;
 Result := ShellExecuteEx(@sei);

end;


function TClinicaTalk.SuporteOnLine : boolean ;
var
 H : HWND ;
 Iterate : integer ;
 temp : cardinal ;
const
//  _TEAM_VIEWER = 'TcRA-idcqsehtkz.exe' ;
  _TEAM_VIEWER = 'TcRA.exe' ;
begin

   if FileExists ( 'c:\' + _TEAM_VIEWER  ) then
     begin
       if not RunAsAdmin ( self.Handle, 'c:\' + _TEAM_VIEWER, '' ) then
         exit ( False ) ;
     end
   else
    if not RunAsAdmin ( self.Handle, ExtractFilePath( ParamStr( 0 ) ) +  _TEAM_VIEWER, '' ) then
       exit ( False ) ;

 iterate := 0 ;
 H := 0 ;
 Repeat
   //h :=  FindWindow ( nil, 'CDL - Assistência remota' ) ; //GetHandle ( 'TurboCode - Assistência Remota' ) ;
   h :=  FindWindow ( nil, 'Controle MDA - Assistência remota' ) ;
   Inc ( iterate ) ;
   if h = 0 then
      sleep ( 100 ) ;
   Application.ProcessMessages ;
 Until ( H <> 0 ) OR ( Iterate = 1000 ) ;

 if ( H = 0 )  then
   exit ( False ) ;

 SendMessageTimeout( h, WM_SYSCOMMAND ,SC_MINIMIZE ,0, SMTO_ABORTIFHUNG, 1000, temp )  ;

 with TTeamViewerMonitor.Create ( True ) do
   begin
     TVHandle := h ;
     OnCallBack := OnSuporteUpdateStatus ;
     OnEndSession := OnSuporteEndSession ;
     Start
   end;

 Result := True ;

end;

//var
//  InternalTVMonitor : TTVMonitor ;

procedure TClinicaTalk.OnSuporteUpdateStatus(ATVMonitor: TTVMonitor);
begin
  InternalTVMonitor := ATVMonitor ;
  TCLAg5NSMsgSupportUpdateStatus.CreateAndDispatch( self ) ;
end;


procedure TClinicaTalk.CheckTeamViewerIsOpen;
var
  H : HWND ;
  temp : cardinal ;
begin
  h :=  FindWindow ( nil, 'Controle MDA - Assistência remota' ) ;
  if h = 0 then
    exit;

 SendMessageTimeout( h, WM_SYSCOMMAND ,SC_MINIMIZE ,0, SMTO_ABORTIFHUNG, 1000, temp )  ;

 with TTeamViewerMonitor.Create ( True ) do
   begin
     TVHandle := h ;
     OnCallBack := OnSuporteUpdateStatus ;
     OnEndSession := OnSuporteEndSession ;
     Start
   end;
end;

destructor TClinicaTalk.Destroy;
begin
  UnSubscribe;
  inherited;
end;

procedure TClinicaTalk.HideTalk(AMsg: TCLAg5NSMsg);
begin
   Hide ;
end;

procedure TClinicaTalk.OnSuporteEndSession(Sender: TObject);
begin
  TCLAg5NSMsgSupportFinished.CreateAndDispatch( self ) ;
end;


initialization
  RegisterClass  ( TClinicaTalk ) ;
end.
