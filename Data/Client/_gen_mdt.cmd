rem @ echo off
SETLOCAL
pushd "%~dp0"


REM FEDERATION
ECHO Exporting metadata : .sysutils
%GBAK% "FIREBIRD_SERVER/30250:%~dp0.sysutils"                          "%~dp0mdt\.sysutils"   -m -user SYSDBA -pass masterkey

ECHO Exporting metadata : CLAG5.DB
%GBAK% "FIREBIRD_SERVER/30250:%~dp0CLAG5.DB"                          "%~dp0mdt\CLAG5.DB"   -m -user SYSDBA -pass masterkey

ECHO Exporting metadata : CLAG5.ENT
%GBAK% "FIREBIRD_SERVER/30250:%~dp0CL-000000\DB\CLAG5.000000.ENT"     "%~dp0mdt\CLAG5.ENT"  -m -user SYSDBA -pass masterkey

ECHO Exporting metadata : CLAG5.ZOO
%GBAK% "FIREBIRD_SERVER/30250:%~dp0CL-000000\DB\CLAG5.000000.ZOO"     "%~dp0mdt\CLAG5.ZOO"  -m -user SYSDBA -pass masterkey

ECHO Exporting metadata : CLAG5.FIN
%GBAK% "FIREBIRD_SERVER/30250:%~dp0CL-000000\DB\CLAG5.000000.FIN"     "%~dp0mdt\CLAG5.FIN"  -m -user SYSDBA -pass masterkey

ECHO Exporting metadata : CLAG5.ATT
%GBAK% "FIREBIRD_SERVER/30250:%~dp0CL-000000\DB\CLAG5.000000.ATT"     "%~dp0mdt\CLAG5.ATT"  -m -user SYSDBA -pass masterkey

ECHO Exporting metadata : CLAG5.JNL
%GBAK% "FIREBIRD_SERVER/30250:%~dp0CL-000000\DB\CLAG5.000000.JNL"     "%~dp0mdt\CLAG5.JNL"  -m -user SYSDBA -pass masterkey

if exist "%~dp0..\..\Projects\Cl.Ag5ExportDef\bin\Cl.Ag5.ExportDef.exe" (
  del "%~dp0mdt\CLAG5.mdt"
  "%~dp0..\..\Projects\Cl.Ag5ExportDef\bin\Cl.Ag5.ExportDef.exe" "DATASERVER_ADMIN" "mdt"
  if ERRORLEVEL 1 pause
  %_7z% a "%~dp0mdt\CLAG5.mdt" "%~dp0mdt\.sysutils" "%~dp0mdt\CLAG5.DB" "%~dp0mdt\CLAG5.ENT" "%~dp0mdt\CLAG5.ZOO" "%~dp0mdt\CLAG5.FIN" "%~dp0mdt\CLAG5.ATT" "%~dp0mdt\CLAG5.JNL" "%~dp0mdt\*.$"
) else (
  echo.
  echo "%~dp0..\..\Projects\Cl.Ag5ExportDef\bin\Cl.Ag5.ExportDef.exe"
  echo não encontrado.
  echo as tabelas default não foram exportadas.
  echo.
  pause
)

popd
ENDLOCAL