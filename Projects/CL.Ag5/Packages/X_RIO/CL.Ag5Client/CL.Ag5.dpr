program CL.Ag5 ;

uses
  WinApi.Windows,
  System.SysUtils,
  Debugger,
  FMX.Forms,
  VCL.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Dialogs ,
  Tc.RTL.Packages.Manager ;

{$R *.res}
{.$D-}
const Application = '' ;

var
  MainPack : cardinal ;
  Run: procedure ;

  function GetEnvVarValue(const VarName: string): string;
  var
    BufSize: Integer;  // buffer size required for value
  begin
    // Get required buffer size (inc. terminal #0)
    BufSize := GetEnvironmentVariable( PChar(VarName), nil, 0 );
    if BufSize > 0 then
    begin
      // Read env var value into result string
      SetLength(Result, BufSize - 1);
      GetEnvironmentVariable(PChar(VarName),
        PChar(Result), BufSize);
    end
    else
      // No such environment variable
      Result := '';
  end;

  procedure InitDebugger ;
  begin
    with PackageManager do
      begin
       AddPath ( 'c:\Windows\SysWOW64' ) ;
       //ExcludeMasks.Add ( 'Tc._3rdVCL.FlexCell.bpl' ) ;

       AddPath ( 'C:\UPD\RAD\20.0\Bpl' ) ;
       //AddPath ( 'C:\Users\Public\Documents\Embarcadero\Studio\19.0\Bpl' ) ;
       //SourceFolder := 'C:\Users\Public\Documents\Embarcadero\Studio\19.0\Bpl' ;

       AddPath ( 'C:\Program Files (x86)\Embarcadero\Studio\20.0\bin' ) ;

       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\Svcs'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\Inicial'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\Estoque'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\Financeiro'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\Zootecnico'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\WEB'  ) ;

//     with TForm.Create(nil) do
//       begin
//          WindowState := wsMaximized ;
//          Visible := True ;
//       end;

      // VirtualUI.BrowserInfo.ViewWidth := 2048 ;
      end;
  end;

  procedure InitRuntime ;
  begin
    with PackageManager do
      begin
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'Core260' ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\Svcs'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\Inicial'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\Estoque'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\Financeiro'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\Zootecnico'  ) ;
       AddPath ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.Client\WEB'  ) ;
       (*
       IncludeMasks.Add ( '*.bpl' ) ;
       ExcludeMasks.Add ( 'rtl140.bpl' ) ;
       ExcludeMasks.Add ( 'rtl200.bpl' ) ;
       ExcludeMasks.Add ( 'rtl210.bpl' ) ;
       ExcludeMasks.Add ( 'rtl220.bpl' ) ;
       ExcludeMasks.Add ( 'Tc._3rdVCL.FlexCell.bpl' ) ;

       Recursive := False ;
       SourceFolder := ExtractFilePath ( ParamStr ( 0 ) ) ;
       Scan ;

       Recursive := True ;
       SourceFolder := ExtractFilePath ( ParamStr ( 0 ) ) + 'Core260'  ;
       Scan ;

       Recursive := True ;
       SourceFolder := ExtractFilePath ( ParamStr ( 0 ) ) +  'CL.Ag5.Client'  ;
       Scan ;
       *)
      end ;
  end;

begin
//  ReportMemoryLeaksOnShutdown := True ;

  if DebugHook <> 0 then
    InitDebugger
  else
    InitRuntime ;

    //  TStyleManager.AutoDiscoverStyleResources := False ;
//    TStyleManager.SetStyle( TStyleManager.LoadFromFile('C:\Users\Caique\Documents\CDLStyle1.vsf')  ) ;

//  PackageManager.LoadPackage( 'Tc.DBRTL.DBX.FirebirdDrv.bpl' ) ;
  MainPack := PackageManager.LoadPackage( 'CL.Ag5_.bpl' ) ;
  Debugger.TDebugger.WriteLine( IntToStr( MainPack ) );

  FormatSettings.ShortDateFormat := StringReplace( FormatSettings.ShortDateFormat, 'MMM', 'MM', [] )  ;
//  ShowMessage(
//            ParamStr(0)
//    +#13#10+ParamStr(1)
//    +#13#10+ParamStr(2)
//    +#13#10+ParamStr(3)
//    +#13#10+ParamStr(4)
//    ) ;
  Run := GetProcAddress( MainPack, '@Uapplresources@TApplResources@Run$qqrv' ) ;

  if @Run <> nil then
    begin
     Run ;
     if DebugHook <> 0 then
        PackageManager.Save ;
     PackageManager.DisposeOf ;
    end
  else
    begin
///      Debugger.TDebugger.WriteLine( 'sleep...' );
///      Sleep ( 50000 ) ;
    end;


    (*
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  TStyleManager.TrySetStyle('Charcoal Dark Slate');
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
    Application.Run ;
      *)
end.




