@ECHO OFF

SETLOCAL
pushd "%~dp0"

echo common

md ..\Core260

copy "C:\UPD\RAD\20.0\Bpl\Jcl260.bpl"                 ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JclVcl260.bpl"              ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvCmp260.bpl"               ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvControls260.bpl"          ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvCore260.bpl"              ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvCustom260.bpl"            ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvDB260.bpl"                ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvDlgs260.bpl"              ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvDotNetCtrls260.bpl"       ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvMM260.bpl"                ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvPageComps260.bpl"         ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvStdCtrls260.bpl"          ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvSystem260.bpl"            ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\JvXPCtrls260.bpl"           ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\SynEditDR260.bpl"  	     ..\Core260

echo kcontrols
copy "C:\UPD\RAD\20.0\Bpl\KControls_RX_RIO.bpl"   ..\Core260
echo QuickReport
copy "C:\UPD\RAD\20.0\Bpl\QR506RunDX_RIOW64.bpl"  ..\Core260
echo SMImport
copy "C:\UPD\RAD\20.0\Bpl\SMImportDX_RIO.bpl"     ..\Core260
echo SMExport
copy "C:\UPD\RAD\20.0\Bpl\SMExportDX_RIO.bpl"     ..\Core260
echo TeeChart
copy "C:\UPD\Steema\TeeChart2018.26\Compiled\Delphi26.win32\System\Tee926.bpl" ..\Core260
copy "C:\UPD\Steema\TeeChart2018.26\Compiled\Delphi26.win32\System\TeeDB926.bpl"  ..\Core260
copy "C:\UPD\Steema\TeeChart2018.26\Compiled\Delphi26.win32\System\TeePro926.bpl" ..\Core260
copy "C:\UPD\Steema\TeeChart2018.26\Compiled\Delphi26.win32\System\TeeUI926.bpl" ..\Core260


echo Virtual Trees
copy "C:\UPD\RAD\20.0\Bpl\VirtualTreesDR260.bpl"      ..\Core260

echo DCEF - deprecated
copy "C:\UPD\RAD\20.0\Bpl\DCEF_X_RIO.bpl"           ..\Core260

echo CEF4Delphi
copy "C:\UPD\RAD\20.0\Bpl\CEF4Delphi260.bpl"          ..\Core260

echo TMS
copy "C:\UPD\RAD\20.0\Bpl\tmsdXE12.bpl"               ..\Core260
 
echo tms log - deprecated
copy "C:\UPD\RAD\20.0\Bpl\TMSLoggingCorePkgDXE12.bpl" ..\Core260 
copy "C:\UPD\RAD\20.0\Bpl\TMSLoggingVCLPkgDXE12.bpl"  ..\Core260 

echo tms log
copy "C:\UPD\RAD\20.0\Bpl\TMSLoggingPkgCoreDXE12.bpl" ..\Core260 
copy "C:\UPD\RAD\20.0\Bpl\TMSLoggingPkgVCLDXE12.bpl"  ..\Core260 

echo FMX Container
copy "C:\UPD\RAD\20.0\Bpl\FMXContainer_Runtime_X10RIO.bpl" ..\Core260 


echo mp
copy "C:\UPD\RAD\20.0\Bpl\Tc.RTL260.bpl"                 Deploy
copy "C:\UPD\RAD\20.0\Bpl\Tc.Windows260.bpl"               ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.DBRTL260.bpl"                 ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.DBRTL.FireBird260.bpl"        ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.DBRTL.DBX260.bpl"             ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.DBRTL.DBX.FirebirdDrv260.bpl" ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.DBRTL.ADO260.bpl"             ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.DBRTL.TxQ260.bpl"             ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.IBEScriptRunner260.bpl"       ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.VCL260.bpl"                   ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.VCLDB260.bpl"                 ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.JVCL.Extender260.bpl"         ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.VirtualTrees.Extender260.bpl" ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.VCL.Ctrls.Edits260.bpl"       ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\Tc.VCL.Report260.bpl"            ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\MPCore260.bpl"                   ..\Core260
echo nfe
copy "C:\UPD\RAD\20.0\Bpl\TCSPEDPck.bpl"            ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\TCSPEDQRPck.bpl"          ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\TCSPEDIntegrate.bpl"      ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\TCNFePck.bpl"             ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\TCNFeIntegrate.bpl"       ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\TCNFeDANFeQR.bpl"         ..\Core260


echo tms
copy "C:\UPD\RAD\20.0\Bpl\FlexCel_Core260.bpl"  ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\VCL_FlexCel_Core260.bpl"  ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\FlexCel_XlsAdapter260.bpl"  ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\AdvGridExportFilters260.bpl"  ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\FlexCel_Pdf260.bpl"  ..\Core260
copy "C:\UPD\RAD\20.0\Bpl\FlexCel_Render260.bpl"  ..\Core260



echo embt
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\rtl260.bpl"                    Deploy
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\adortl260.bpl"                 ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\CustomIPTransport260.bpl"      ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\DataSnapCommon260.bpl"         ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\DataSnapProviderClient260.bpl" ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\dbexpress260.bpl"              ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\dbrtl260.bpl"                  ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\dbxcds260.bpl"                 ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\DBXClientDriver260.bpl"        ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\DbxCommonDriver260.bpl"        ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\DBXFirebirdDriver260.bpl"      ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\dsnap260.bpl"                  ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\dsnapcon260.bpl"               ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\vcl260.bpl"                    ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\vclactnband260.bpl"            ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\vcldb260.bpl"                  ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\vclie260.bpl"                  ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\vclimg260.bpl"                 ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\vclsmp260.bpl"                 ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\vclx260.bpl"                   ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\vclwinx260.bpl"                ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\xmlrtl260.bpl"                 ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\soaprtl260.bpl"                ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\inet260.bpl"                  ..\Core260

copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\FireDAC260.bpl"             ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\FireDACCommonDriver260.bpl" ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\FireDACCommon260.bpl"       ..\Core260


echo indy
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\IndyCore260.bpl"               ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\IndyIPClient260.bpl"           ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\IndyIPCommon260.bpl"           ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\IndyProtocols260.bpl"          ..\Core260
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\IndySystem260.bpl"             ..\Core260
echo fmx
copy "C:\Program Files (x86)\Embarcadero\Studio\20.0\Bin\fmx260.bpl"             ..\Core260

popd
ENDLOCAL
