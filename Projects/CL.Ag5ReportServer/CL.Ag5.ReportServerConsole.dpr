program CL.Ag5.ReportServerConsole ;

{$APPTYPE CONSOLE}

uses
  WinApi.Windows,
  System.SysUtils,
  ServerContainerApp in 'Source\Server\APP\ServerContainerApp.pas' {AppServerContainer: TDataModule},
  ServerModule in 'Source\Server\ModuleClasses\ServerModule.pas' {ServerMethods1: TDSServerModule} ;

procedure RunDSServer;
var
  LModule: TAppServerContainer;
  LInputRecord: TInputRecord;
  LEvent: DWord;
  LHandle: THandle;
begin
  Writeln(Format('Starting %s', [TAppServerContainer.ClassName]));
  LModule := TAppServerContainer.Create(nil);
  try
    LModule.DSServer1.Start;
    try
      Writeln('Press ESC to stop the server');
      LHandle := GetStdHandle(STD_INPUT_HANDLE);
      while True do
      begin
        Win32Check(ReadConsoleInput(LHandle, LInputRecord, 1, LEvent));
        if (LInputRecord.EventType = KEY_EVENT) and
        LInputRecord.Event.KeyEvent.bKeyDown and
        (LInputRecord.Event.KeyEvent.wVirtualKeyCode = VK_ESCAPE) then
          break;
      end;
    finally
      LModule.DSServer1.Stop;
    end;
  finally
    LModule.Free;
  end;
end;

begin
  try
    RunDSServer;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.

