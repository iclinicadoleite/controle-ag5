rem @echo off

rem SET FBV=-v

cd /d "%~dp0..\..\Projects"

rem msbuild CL.Ag5%1.groupproj /p:BuildGroup="Controle MDA - Ag5" /target:Build  /nologo /v:q /noconlog /clp:PerformanceSummary;NoItemAndPropertyList;Verbosity:quiet /fl | "%~dp0MSBuildFilter" "%~dp0Log.Txt"

if errorlevel 1 (
  start notepad "%~dp0Log.txt"
  pause
  exit
)
cd /d "%~dp0"

start notepad "%~dp0Log.txt"

echo atualizando bpls
call _cpbpls%2.cmd
echo.

echo atualizando sistema
call _updt_deploy_bin%1.cmd
echo.

echo gerando metadados
call ..\..\Data\Client\_gen_mdt.cmd 
echo.

echo restaurando metadados : .sysutils "fb\gbak"
"..\FBC\FBC257-27050\Win32\gbak" -REP ..\..\Data\Client\mdt\.sysutils "FIREBIRD_SERVER/30250:%~dp0Deploy\Data\.sysutils"  -user SYSDBA -pass masterkey %FBV%
if errorlevel 1 (
  echo ERRRO RESTAURANDO METADADOS : .sysutils "fb\gbak"
  pause
)

echo restaurando metadados : CLAG5.DB "fb\gbak"
"..\FBC\FBC257-27050\Win32\gbak" -REP ..\..\Data\Client\mdt\CLAG5.DB "FIREBIRD_SERVER/30250:%~dp0Deploy\Data\CLAG5.DB"  -user SYSDBA -pass masterkey %FBV%
if errorlevel 1 (
  echo ERRRO RESTAURANDO METADADOS : CLAG5.DB "fb\gbak"
  pause
)

echo .mdt "copy"
copy ..\..\Data\Client\mdt\CLAG5.mdt Deploy /Y
if errorlevel 1 pause

cd InnoSetupScript
"%ProgramFiles(x86)%\Inno Setup 5\iscc" Agenda5%1R1Setup.iss

rem CHOICE32   /M "Compactar" /C SN /T 5 /D S
rem IF ERRORLEVEL 2 GOTO :FIM

rem call _compress_deploy.cmd

cd /d "%~dp0"
CHOICE32   /M "Enivar para ftp" /C SN /T 5 /D S
IF ERRORLEVEL 2 GOTO :FIM

rem :FTP
rem put_deploy

rem start mailto:AG5?subject="Nova versao disponivel"^&body="segue nova versão."

:FIM
echo.
echo Processo concluido com sucesso !
pause