unit ClAg5.Common.RestorePoint;

interface


type

  TLogBackupRestoresCallBack = procedure ( Log : String ) of object ;
  TCompressStatusCallBack    = procedure (const Value, MaxValue: Int64) of object ;

  IRestorePointBase = interface
    ['{06CCEF59-6E91-4F3C-BB89-0D2F7BF2CBD5}']
     // get/setters
     procedure SetDBProfile(const Value: string);
     procedure SetLog(const Value: TLogBackupRestoresCallBack);
     procedure SetCompressStatus(const Value: TCompressStatusCallBack);
     // methods
     function Execute : boolean ;
     // properties
     property Log: TLogBackupRestoresCallBack write SetLog ;
     property CompressStatus: TCompressStatusCallBack write SetCompressStatus ;
     property DBProfile : string write SetDBProfile ;
  end;

  ICreateRestorePoint = interface(IRestorePointBase)
    ['{9EE844DD-7663-426A-B6BE-BB0134D74993}']
     // get/setters
    procedure SetDomainCode(const Value: string);
    function GetRestorePointFileName : string ;
     // properties
    property DomainCode : string write SetDomainCode ;
    property RestorePointFileName : string read GetRestorePointFileName ;
  end;

  IRecoverRestorePoint = interface(IRestorePointBase)
    ['{910FF462-DCF7-4964-BAD9-C0208951408F}']
     // get/setters
//     function GetDomainCode: string;
     procedure SetRestorePointFileName ( const AValue : string ) ;
     //methods
     // properties
//     property DomainCode : string read GetDomainCode ;
     property RestorePointFileName : string write SetRestorePointFileName ;
 end;


function CreateRestorePointFactory  : ICreateRestorePoint ;
function RecoverRestorePointFactory : IRecoverRestorePoint ;

implementation

uses
   WinApi.Windows, System.Classes, System.SysUtils
   , Tc.Windows.BaseOptmise
   , Tc.RTL.Folders
   , ClAg5.Common.BackupRestore
   , Tc.JVCL.Compressor
   , ClAg5.DatabaseIntf ;


type
  TRestorePointBase = class ( TInterfacedObject )
  private
    procedure SetCompressStatus(const Value: TCompressStatusCallBack);
    procedure SetLog(const Value: TLogBackupRestoresCallBack);
  protected
//    FFBClientPath : string ;
    FTempFolder : ITcTempFolder ;
    FLog: TLogBackupRestoresCallBack ;
    FCompressStatus: TCompressStatusCallBack ;
    FCompressorEngine : ICompressorEngine ;
    FIDatabaseCfg   : IDatabaseCfg ;
    procedure SetDBProfile(const Value: string);
    procedure DoLog( ALogStr : string );
    procedure InternalCompressStatus (Sender: TObject; const Value, MaxValue: Int64) ;
  public
    property Log: TLogBackupRestoresCallBack  read FLog write SetLog;
    property CompressStatus: TCompressStatusCallBack  read FCompressStatus write SetCompressStatus;
    constructor Create ;
  end;


  TCreateRestorePoint = class ( TRestorePointBase, ICreateRestorePoint )
  private
     FRestorePointFileName : string ;
     FFileList : TStringList ;
     function GetRestorePointFileName : string ;
     procedure SetDomainCode(const Value: string);
     procedure DoCompress ;
     procedure DoBackup( ATitle : string ; ADBName : string );
    procedure MemoryOptimizer;
  public
     function Execute : boolean;
     class function New : ICreateRestorePoint ;
  end;


  TRecoverRestorePoint = class ( TRestorePointBase, IRecoverRestorePoint )
  private
    FIDatabaseCfg   : IDomainPath ;
    FRestorePointFileName : string ;
    //function GetDomainCode: string;
    procedure SetRestorePointFileName ( const AValue : string ) ;
    procedure DoRestore ( ADBName : string ) ;
  public
    function Execute : boolean ;
    //property DomainCode : string read GetDomainCode ;
    class function New : IRecoverRestorePoint ;
  end;


function CreateRestorePointFactory  : ICreateRestorePoint ;
begin
   Result := TCreateRestorePoint.New ;
end;

function RecoverRestorePointFactory : IRecoverRestorePoint ;
begin
  Result := TRecoverRestorePoint.New ;
end ;

{ TRestorePointBase }

constructor TRestorePointBase.Create;
begin
//  if DebugHook <> 0 then
    // FFBClientPath := 't:\Downloads\Firebird\Firebird-2.5.2.26540-0_Win32\bin\fbclient.dll' // 'fbclient250x86.dll'
//    FFBClientPath := 'T:\CDL\Sistemas\ControleLeiteiro\Deployment\FBC\FBC257-27050\Win32\fbclient.dll'
//  else
//     FFBClientPath := 'fb\fbclient.dll' ;

   FTempFolder := TcTempFolderFactory ;
end;

procedure TRestorePointBase.DoLog(ALogStr: string);
begin
  if Assigned ( FLog ) then
     FLog ( ALogStr ) ;
end;

procedure TRestorePointBase.InternalCompressStatus(Sender: TObject; const Value,  MaxValue: Int64);
begin
   if Assigned ( FCompressStatus ) then
     FCompressStatus ( Value, MaxValue ) ;
end;



procedure TRestorePointBase.SetCompressStatus(
  const Value: TCompressStatusCallBack);
begin
  FCompressStatus := Value;
end;


procedure TRestorePointBase.SetDBProfile(const Value: string);
begin
   FIDatabaseCfg := ClAg5.DatabaseIntf.DatabaseCfgFactory ( True ) ;
   FIDatabaseCfg.Profile := Value ;
end;

procedure TRestorePointBase.SetLog(
  const Value: TLogBackupRestoresCallBack);
begin
  FLog := Value;
end;

{ TCreateRestorePoint }


procedure TCreateRestorePoint.SetDomainCode(const Value: string);
begin
   if not Assigned ( FIDatabaseCfg ) then
     raise Exception.Create('Profile não configurado');
   FIDatabaseCfg.Domain := Value ;
end;

function TryExclusiveFileAccess(const AFileName: String ; ACount : integer = 1  ; ADelay : integer = 1000 ) : boolean ;
var
  LFileHandle : Integer;
begin
  if not FileExists( AFileName )  then
     Exit  ( False ) ;

  repeat
     LFileHandle := System.SysUtils.FileOpen(AFileName, fmOpenRead or fmShareExclusive );
     Result := (LFileHandle >= 0) ;
     if ( not Result )  and ( ACount > 0 ) then
        Sleep ( ADelay ) ;
     Dec ( ACount ) ;
  until (Result) or (ACount = 0);

  if (Result) then
     System.SysUtils.FileClose( LFileHandle ) ;
end;

procedure TCreateRestorePoint.DoBackup( ATitle : string ; ADBName : string );
var
 LBackupNameOnHost : string ;
 LRestorePointFileName : string ;
 LIsEmbedded, LIsLocalHost, LIsRemoteHost : boolean ;
begin
//   LIsEmbedded    := IsEmbedded( ADBName ) ;
//   LIsLocalHost   := IsLocalHost()  ;
//   LISRemoteHost  := IsRemoteHost() ;

//   LBackupNameOnHost := StripHost( ADBName )


//    LLocalHost := IsLocalHost ( ADBName ) ;
//    LUseTCPIP  := IsRemoteHost ( ADBName ) ;

    MemoryOptimizer ;
//                       ***
//    LRestorePointFileName := ExtractFileName ( ADBName ) + '.FBK' ;
//    LBackupFolder   := GetLocalName( ADBName ) ;
//    LRestorePointFileNameOnServer := GetLocalName( ADBName ) ;

    LRestorePointFileName := FTempFolder.TempPath + ExtractFileName ( ADBName ) + '.FBK' ;
    DoLog ( ATitle ) ;
    DoLog ( ADBName ) ;
    DoLog ( '' ) ;
    if not TFirebirdBackup.Execute( {FFBClientPath, } ADBName, LRestorePointFileName, FLog ) then
      Abort ;

    DoLog ( 'end ...' ) ;
    DoLog ( 'add : ' + ExtractFileName ( ADBName ) ) ;

    TryExclusiveFileAccess( LRestorePointFileName, 20 ) ;

    FFileList.Add( LRestorePointFileName  ) ;
    DoLog ( FTempFolder.TempPath + ExtractFileName ( ADBName ) ) ;

end;




(*
procedure TCreateRestorePoint.DoCompress( ADict : Integer ) ;
var
  LCompressedFile : string ;
  LRestorePointFileName : string ;
begin
  LCompressedFile   := FRestorePointFileName + '-' + IntToStr ( ADict ) ;

  if Pos ( ':',  LCompressedFile ) = 0 then
     LCompressedFile := ExtractFilePath ( ParamStr ( 0 ) ) + LCompressedFile ;


    DoLog ( FormatFloat('Memory used: ,.# K', CurrentMemoryUsage / 1024)) ;
    MemoryOptimize ;
    DoLog ( FormatFloat('Memory Optimized : ,.# K', CurrentMemoryUsage / 1024)) ;

  DoLog ( 'Compressing : ' + LCompressedFile ) ;
  FCompressorEngine := Tc.JVCL.Compressor.CompressorEngineFactory ;
  FCompressorEngine.CreateArchive( LCompressedFile ) ;
//  FCompressorEngine.CompressionLevel := 3 ;
  FCompressorEngine.DictionarySize := ADict * 1024 * 1024 ;
  DoLog ( 'DictionarySize   = ' + IntToStr ( FCompressorEngine.DictionarySize    ) ) ;
  DoLog ( 'CompressionLevel = ' + IntToStr ( FCompressorEngine.CompressionLevel  ) ) ;
  DoLog ( 'NumberOfThreads  = ' + IntToStr ( FCompressorEngine.NumberOfThreads   ) ) ;
  DoLog ( 'SolidBlockSize   = ' + IntToStr ( FCompressorEngine.SolidBlockSize    ) ) ;

//  FCompressorEngine.OnProgress

//procedure(Sender: TObject; const Value, MaxValue: Int64)

  FCompressorEngine.OnProgress := InternalCompressStatus ;
  for LRestorePointFileName in FFileList do
    begin

     FCompressorEngine.AddFile( LRestorePointFileName ) ;
    end;
  FCompressorEngine.Compress ;

end;

*)

procedure TCreateRestorePoint.DoCompress ;
var
  LCompressedFile : string ;
  LRestorePointFileName : string ;
begin
  LCompressedFile   := FRestorePointFileName ;

  if Pos ( ':',  LCompressedFile ) = 0 then
     LCompressedFile := ExtractFilePath ( ParamStr ( 0 ) ) + LCompressedFile ;

  if Pos ( ':',  LCompressedFile ) > 2 then
     LCompressedFile := Copy ( LCompressedFile, Pos ( ':',  LCompressedFile ) + 1,  LCompressedFile.Length ) ;

  MemoryOptimizer;

  DoLog ( 'Compressing : ' + LCompressedFile ) ;

  FCompressorEngine := Tc.JVCL.Compressor.CompressorEngineFactory ;
  FCompressorEngine.OnProgress := InternalCompressStatus ;
  FCompressorEngine.CreateArchive( LCompressedFile ) ;
  FCompressorEngine.CompressionLevel := 3 ;
  DoLog ( 'DictionarySize   = ' + IntToStr ( FCompressorEngine.DictionarySize    ) ) ;
  DoLog ( 'CompressionLevel = ' + IntToStr ( FCompressorEngine.CompressionLevel  ) ) ;
  DoLog ( 'NumberOfThreads  = ' + IntToStr ( FCompressorEngine.NumberOfThreads   ) ) ;
  DoLog ( 'SolidBlockSize   = ' + IntToStr ( FCompressorEngine.SolidBlockSize    ) ) ;

  for LRestorePointFileName in FFileList do
    begin
       DoLog ( 'Add :' + LRestorePointFileName ) ;
       FCompressorEngine.AddFile( LRestorePointFileName ) ;
    end;

  FCompressorEngine.Compress ;

  //  FCompressorEngine.OnProgress
  //procedure(Sender: TObject; const Value, MaxValue: Int64)

end;

function TCreateRestorePoint.Execute : boolean;
var
  This : TCreateRestorePoint ;
  LBackupFolder : string ;
begin

  LBackupFolder := FIDatabaseCfg.BackupFolder ;

  if Pos ( ':',  LBackupFolder ) > 2 then
     LBackupFolder := Copy ( LBackupFolder, Pos ( ':',  LBackupFolder ) + 1,  LBackupFolder.Length ) ;

  ForceDirectories ( LBackupFolder  ) ;
  FRestorePointFileName := LBackupFolder + ChangeFileExt ( ExtractFileName( FIDatabaseCfg.Path[ dbEntidades ] ), '' ) + FormatDateTime( '.yyyy-mm-dd-hh-nn-ss', now ) + '.backup' ;

  FFileList := TStringList.Create ;

  try
    try

      DoBackup( 'Domain: ' + FIDatabaseCfg.Domain, FIDatabaseCfg.Path[ dbFederation ] ) ;
      DoBackup( 'Entidades',   FIDatabaseCfg.Path[ dbEntidades ]        ) ;
      DoBackup( 'Zooténico',   FIDatabaseCfg.Path[ dbZootecnico ]        ) ;
      DoBackup( 'Financeiro',  FIDatabaseCfg.Path[ dbFinanceiro ]        ) ;
      DoBackup( 'Attachments', FIDatabaseCfg.Path[ dbAttachments ]        ) ;
      DoBackup( 'journalling', FIDatabaseCfg.Path[ dbJournaling ]        ) ;

      DoCompress ;

    except On E: Exception do
      begin
        //ULogger.TLogger.Log(E.Message);
        //ShowMessage ( E.Message ) ;
        DoLog ( E.Message ) ;
        raise ;
      end
    end ;
  finally
    FFileList.Free ;
  end
end;

procedure TCreateRestorePoint.MemoryOptimizer;
var
  OldMemoryUsage : Cardinal ;
begin
  OldMemoryUsage := CurrentMemoryUsage ;
  MemoryOptimize;
  DoLog( 'Memory : ' + FormatFloat(' ,.# K', OldMemoryUsage / 1024) + FormatFloat(' ,.# K', CurrentMemoryUsage / 1024));
end;


class function TCreateRestorePoint.New: ICreateRestorePoint;
begin
   Result := Create ;
end;

function TCreateRestorePoint.GetRestorePointFileName: string;
begin
   Result := FRestorePointFileName ;
end;


{ TRecoverRestorePoint }


procedure TRecoverRestorePoint.DoRestore( ADBName : string ) ;
begin
    DoLog ( '' ) ;
    DoLog ( ADBName ) ;
    DoLog ( '' ) ;
    //TFirebirdRestore.Execute( _FBCLIENT,  self.FTempFolder.TempPath + 'CLAG5.ENT', RemoveLocalServer ( FIDatabaseCfg.Path[ dbEntidades ]     ),  BackupRestoreLog ) ;
    DoLog ( 'extraindo : ' + { FTempFolder.TempPath + } ExtractFileName ( ADBName ) ) ;
    if not TFirebirdRestore.Execute( {FFBClientPath, }FTempFolder.TempPath + ExtractFileName ( ADBName ) + '.FBK', ADBName, FLog ) then
       Abort ;
end;

function TRecoverRestorePoint.Execute : boolean;
var
  TempFolder : ITcTempFolder ;
  FarmCode, x : integer ;

  function CheckPackedName ( APackedName : string ; ANames : Array of String ) : boolean ;
  var
    x : integer ;
  begin
    Result := False ;
    for x := Low( ANames ) To  High ( ANames ) do
        begin
          Result := (APackedName = ANames[ x ]) ;
          if Result then
             break ;
        end;
  end ;

begin
  //CLAG5.0000000.yyyy-mm-dd-hh-nn-ss.backup

  FCompressorEngine := Tc.JVCL.Compressor.CompressorEngineFactory ;
  FCompressorEngine.OpenArchive( FRestorePointFileName ) ;
  FCompressorEngine.TargetFolder := TempFolder.FolderName ;

  for x := 0 to FCompressorEngine.ItemCount - 1 do
    begin
      FCompressorEngine[ x ].Selected := CheckPackedName ( FCompressorEngine[ x ].PackedName,
         [
           ExtractFileName ( FIDatabaseCfg.Path[ dbEntidades ]        ) + '.FBK',
           ExtractFileName ( FIDatabaseCfg.Path[ dbZootecnico ]        ) + '.FBK',
           ExtractFileName ( FIDatabaseCfg.Path[ dbFinanceiro ]        ) + '.FBK',
           ExtractFileName ( FIDatabaseCfg.Path[ dbAttachments ]        ) + '.FBK',
           ExtractFileName ( FIDatabaseCfg.Path[ dbJournaling ]        ) + '.FBK'
         ] ) ;
    end;

  FCompressorEngine.OnProgress := InternalCompressStatus ;
  FCompressorEngine.ExtractSelected ;

  // federation
  DoRestore( FIDatabaseCfg.Path[ dbFederation ] ) ;
  // entidades
  DoRestore( FIDatabaseCfg.Path[ dbEntidades ]        ) ;
  // zootecnico
  DoRestore( FIDatabaseCfg.Path[ dbZootecnico ]        ) ;
  // financeiro
  DoRestore( FIDatabaseCfg.Path[ dbFinanceiro ]        ) ;
  // attachments
  DoRestore( FIDatabaseCfg.Path[ dbAttachments ]        ) ;
  // journalling
  DoRestore( FIDatabaseCfg.Path[ dbJournaling ]        ) ;

  // deprecated ...
  //  InternalExecute( AFBClientPath, TempFolder.TempPath + ExtractFileName ( DomainPath.Path[ dbFederation ] ) + '.FBK',  DomainPath.Path[ dbFederation ] );
  //  InternalExecute( AFBClientPath, TempFolder.TempPath + ExtractFileName ( DomainPath.Path[ dbEntidades ]        ) + '.FBK',  DomainPath.Path[ dbEntidades ]        ) ;
  //  InternalExecute( AFBClientPath, TempFolder.TempPath + ExtractFileName ( DomainPath.Path[ dbZootecnico ]        ) + '.FBK',  DomainPath.Path[ dbZootecnico ]        ) ;
  //  InternalExecute( AFBClientPath, TempFolder.TempPath + ExtractFileName ( DomainPath.Path[ dbFinanceiro ]        ) + '.FBK',  DomainPath.Path[ dbFinanceiro ]        ) ;
  //  InternalExecute( AFBClientPath, TempFolder.TempPath + ExtractFileName ( DomainPath.Path[ dbAttachments ]        ) + '.FBK',  DomainPath.Path[ dbAttachments ]        ) ;
  //  InternalExecute( AFBClientPath, TempFolder.TempPath + ExtractFileName ( DomainPath.Path[ dbJournaling ]        ) + '.FBK',  DomainPath.Path[ dbJournaling ]        ) ;

end;


//function TRecoverRestorePoint.GetDomainCode: string;
//begin
//
//end;

class function TRecoverRestorePoint.New: IRecoverRestorePoint;
begin
   Result := Create ;
end;

procedure TRecoverRestorePoint.SetRestorePointFileName(const AValue: string);
begin
  if not Assigned ( FIDatabaseCfg ) then
     raise Exception.Create('Perfil não configurado');

  FRestorePointFileName := AValue ;
  FIDatabaseCfg.Domain := Copy( ExtractFileName ( FRestorePointFileName ), 7, 6 ) ;

end;


end.
