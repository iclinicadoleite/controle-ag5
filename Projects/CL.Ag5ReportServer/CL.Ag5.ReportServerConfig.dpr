program CL.Ag5.ReportServerConfig;

uses
  VCL.Forms,
  WinApi.Windows,
  System.SysUtils,
  ShellAPI,
  Registry,
  Wrappers in '..\CL.Ag5\Source\_CommonSources\Wrappers.pas',
  ShadowBox in '..\CL.Ag5\Source\_CommonSources\ShadowBox.pas',
  GBlur2 in '..\CL.Ag5\Source\_CommonSources\GBlur2.pas',
  SysTypes  in '..\CL.Ag5\Source\_CommonSources\UI\SysTypes.pas',
  SysFormDialog  in '..\CL.Ag5\Source\_CommonSources\UI\SysFormDialog.pas' {_FormDialog},
  SysFormWizard in '..\CL.Ag5\Source\_CommonSources\UI\SysFormWizard.pas' {_FormWizard},
  AppProfileIntf in '..\CL.Ag5\Source\_CommonSources\AppProfileIntf.pas',
  AppProfile in '..\CL.Ag5\Source\_CommonSources\AppProfile.pas',
  //ClAg5.Consts in '..\CL.Ag5\Common\ClAg5.Consts.pas',
  UReportServerConfig in 'Source\Common\UReportServerConfig.pas',
  UZoo_ConfigurarImpressaoAutomatica in '..\CL.Ag5\Source\CL.Ag5Client\Zoo\Atividades\UZoo_ConfigurarImpressaoAutomatica.pas' ;

{$R *.res}

var
  Zoo_ConfigurarImpressaoAutomatica : TZoo_ConfigurarImpressaoAutomatica ;

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
 sei.nShow := SW_SHOWNORMAL; //Integer;
 Result := ShellExecuteEx(@sei);
end;


function NeedRegisterServerStartup : boolean ;
var
  Registry: TRegistry;
begin
  Registry := Tregistry.Create;
  Registry.rootkey := HKEY_LOCAL_MACHINE;
  Registry.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', false);

  Result := (not Registry.ValueExists('CL.Ag5.ReportServerApp'))
        or  (Registry.ReadString('CL.Ag5.ReportServerApp' ) <> ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.ReportServerApp.exe');

  Registry.CloseKey;
  Registry.Free;
end;


procedure InitServerApp ;
begin
  ShellExecute( 0, 'open', PChar ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.ReportServerApp.exe' ), nil, nil, SW_SHOW ) ;
end;

begin

  if not FindCmdLineSwitch('elevate') then
   begin
    RunAsAdmin( 0, ParamStr ( 0 ), '/elevate' ) ;
    exit ;
   end;

(*
  if FindCmdLineSwitch('elevate') then
    RegisterServerStartup
  else if NeedRegisterServerStartup
      and RunAsAdmin( 0, ParamStr ( 0 ), '/elevate' ) then
    exit ;
*)
  InitServerApp ;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TZoo_ConfigurarImpressaoAutomatica, Zoo_ConfigurarImpressaoAutomatica);
  Application.Run;
end.
