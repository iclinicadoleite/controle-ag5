if exist "%~dp0..\..\Projects\Cl.Ag5ExportDef\bin\Cl.Ag5.ExportDef.exe" (
  del "%~dp0mdt\CLAG5.mdt"
  "%~dp0..\..\Projects\Cl.Ag5ExportDef\bin\Cl.Ag5.ExportDef.exe" "DATASERVER_ADMIN" "mdt"
  if ERRORLEVEL 1 pause
  %_7z% a "%~dp0mdt\CLAG5.mdt" "%~dp0mdt\CLAG5.DB" "%~dp0mdt\CLAG5.ENT" "%~dp0mdt\CLAG5.ZOO" "%~dp0mdt\CLAG5.FIN" "%~dp0mdt\CLAG5.ATT" "%~dp0mdt\CLAG5.JNL" "%~dp0mdt\*.$"
) else (
  echo.
  echo "%~dp0..\..\Projects\Cl.Ag5ExportDef\bin\Cl.Ag5.ExportDef.exe"
  echo não encontrado.
  echo as tabelas default não foram exportadas.
  echo.
  pause
)
pause