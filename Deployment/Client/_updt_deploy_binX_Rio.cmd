SETLOCAL
pushd "%~dp0"

robocopy  ..\..\Projects\CL.Ag5\Bin\X_Rio\Client          Deploy *.exe *.bpl /s /m
if ERRORLEVEL 4 pause 

popd
ENDLOCAL