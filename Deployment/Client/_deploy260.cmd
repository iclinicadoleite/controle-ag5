@echo off

SETLOCAL

cd /d "%~dp0"

SET _7z="%ProgramFiles%\7-Zip\7z.exe"
IF EXIST %SYSTEMROOT%\SYSWOW64 (
 SET FIREBIRD=%ProgramFiles%\Firebird\Firebird-2.5.7.27050-0_x64
) else (
 SET FIREBIRD=%ProgramFiles%\Firebird\Firebird-2.5.7.27050-0_win32
)

SET GBAK="%FIREBIRD%\bin\gbak"
SET GBAK="..\..\Deployment\FBC\FBC257-27050\x64\gbak.exe"

call "%ProgramFiles(x86)%\Embarcadero\Studio\20.0\bin\\rsvars.bat"
call _deploy.cmd X_RIO 260 
ENDLOCAL