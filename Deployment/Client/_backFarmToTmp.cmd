pushd "%~dp0"

REM ENTIDADES
call _gbak "FIREBIRD_SERVER/30250:%~dp0..\..\data\Client\CL-%1\DB\CLAG5.%1.ENT" ..\..\tmp\CLAG5.%1.ENT.FBK %FBV%

REM ZOO
call _gbak "FIREBIRD_SERVER/30250:%~dp0..\..\data\Client\CL-%1\DB\CLAG5.%1.ZOO" ..\..\tmp\CLAG5.%1.ZOO.FBK %FBV%

REM FIN
call _gbak "FIREBIRD_SERVER/30250:%~dp0..\..\data\Client\CL-%1\DB\CLAG5.%1.FIN" ..\..\tmp\CLAG5.%1.FIN.FBK %FBV%

REM FIN
call _gbak "FIREBIRD_SERVER/30250:%~dp0..\..\data\Client\CL-%1\DB\CLAG5.%1.ATT" ..\..\tmp\CLAG5.%1.ATT.FBK %FBV%

rem jornalling ... backup metadata only
call _gbak "FIREBIRD_SERVER/30250:%~dp0..\..\data\Client\CL-%1\DB\CLAG5.%1.JNL" ..\..\tmp\CLAG5.%1.JNL.FBK -m %FBV%

popd