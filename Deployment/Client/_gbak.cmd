rem @echo off

SETLOCAL
pushd "%~dp0"
SET FBV=-v

IF EXIST %SYSTEMROOT%\SYSWOW64 (
 SET FIREBIRD=%ProgramFiles%\Firebird\Firebird-2.5.3.26778-0_x64
) else (
 SET FIREBIRD=%ProgramFiles%\Firebird\Firebird-2.5.3.26778-0_win32
)

SET GBAK="%FIREBIRD%\bin\gbak"

%GBAK% "%1" %2 -user SYSDBA -pass masterkey %3 %4 %5 %6 
if errorlevel 1 pause

popd
ENDLOCAL