SETLOCAL
pushd "%~dp0deploy"

SET FIREBIRD=%~dp0deploy\fb

SET GBAK="%FIREBIRD%\gbak"

%GBAK% -REP ..\..\..\tmp\CLAG5.%1.ENT.FBK data\CL-%1\DB\CLAG5.%1.ENT  -user SYSDBA -BU 2000 -P 8192 -USE_ %FBV%
if errorlevel 1 pause

%GBAK% -REP ..\..\..\tmp\CLAG5.%1.ZOO.FBK data\CL-%1\DB\CLAG5.%1.ZOO  -user SYSDBA -BU 65536 -P 8192 -USE_ %FBV%
if errorlevel 1 pause

%GBAK% -REP ..\..\..\tmp\CLAG5.%1.FIN.FBK data\CL-%1\DB\CLAG5.%1.FIN  -user SYSDBA -BU 2000 -P 8192 -USE_ %FBV%
if errorlevel 1 pause

%GBAK% -REP ..\..\..\tmp\CLAG5.%1.JNL.FBK data\CL-%1\DB\CLAG5.%1.JNL  -user SYSDBA -BU 2000 -P 8192 -USE_  %FBV%
if errorlevel 1 pause

%GBAK% -REP ..\..\..\tmp\CLAG5.%1.ATT.FBK data\CL-%1\DB\CLAG5.%1.ATT  -user SYSDBA -BU 2000 -P 8192 -USE_  %FBV%
if errorlevel 1 pause

popd
ENDLOCAL