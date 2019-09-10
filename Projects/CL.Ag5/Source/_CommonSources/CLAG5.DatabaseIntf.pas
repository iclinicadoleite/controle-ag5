unit ClAg5.DatabaseIntf;

interface

uses Classes ;

type
  TDBType = ( dbSysUtils, dbFederation, dbEntidades, dbZootecnico, dbFinanceiro, dbAttachments, dbJournaling);

type
  IProfileInfo = interface
    ['{65F32470-A184-4EBE-8E51-07DE964614AF}']
    function GetDataFolder : string ;
    function GetProfile : string ;
    procedure SetProfile ( const AProfile : string ) ;
    function GetProfileList : TStrings ;
    function GetServerType : string ;
    function GetServerName : string ;
    function GetServerAddress : string ;
    function GetServerPort : word ;
    function GetTimeOut : integer ;
    function GetServerHost : string ;

    property DataFolder: string read GetDataFolder;
    property Profile : string read GetProfile write SetProfile ;
    property ServerType    : string Read GetServerType ;
    property ServerName    : string Read GetServerName ;
    property ServerAddress : string Read GetServerAddress ;
    property ServerPort    : word   Read GetServerPort ;
    property ServerHost    : string Read GetServerHost ;
    property TimeOut       : integer  Read GetTimeOut ;
  end;

  IFederationPath = interface ( IProfileInfo )
   ['{9C6138AD-614D-4839-9B5A-DB3C64686567}']
   function GetPath_syncbackup : string ;
   function GetPath_update_application: string;
   function Get_AutoBackupFolder : string;
   function GetCurrentVersion: String;
   function GetAutoBackupNumberOfDays: Integer;
   property Path_syncbackup: string read GetPath_syncbackup;
   property AutoBackupFolder: string read Get_AutoBackupFolder;
   property AutoBackupNumberOfDays: integer read GetAutoBackupNumberOfDays;
   property Path_update_application: string read GetPath_update_application;
   property CurrentVersion : String read GetCurrentVersion ;
  end;

  IDomainPath = interface ( IFederationPath )
    ['{86B23536-C67E-4727-BF5C-52B32C9B9FA9}']
    function  GetDomain : string ;
    procedure SetDomain ( const ADomain : string ) ;
    function  GetBackupFolder : string;
    function  GetPath( const ADBType : TDBType ) : string ;
    property  BackupFolder : string    read GetBackupFolder ;
    property  Domain : string read GetDomain write SetDomain ;
    property  Path [ const ADBType : TDBType ] : string read GetPath ;
  end;

  IDatabaseCfg = IDomainPath ;

function DatabaseCfgFactory ( ANewDatabaseCfg  : boolean = False ) : IDatabaseCfg ;

implementation

uses System.SysUtils, AppProfile ;

{ TDomainPath }

type

  TDBTypeHelper = record helper for TDBType
    function Extension : string ;
    function QualifiedPathTemplate : string;
    function Path( const ADataFolder : string ; const ADomain : string = '' ) : string ;
  end;

type

  TProfileInfo = class(TInterfacedObject, IProfileInfo)
  private
    FAppProfile    : IAppProfile ;
    FProfile       : string ;
    FServerType    : string ;
    FServerName    : string ;
    FServerAddress : string ;
    FServerPort    : word   ;
    FTimeOut       : integer ;
    FControlerPort : string ;
    FDataFolder    : string ;
    FCurrentVersion : string;


    FSyncbackup_path       : string;
    FAutoBackupFolder      : string;
    FAutoBackupNumberOfDays: Integer;
    FUpdate_App_path       : string;

    FBackupFolder : string;
    procedure CheckProfile ;
    function GetDataFolder : string ;
    function GetProfile : string ;
    procedure SetProfile ( const AProfile : string ) ;
    function GetProfileList : TStrings ;
    function GetServerType : string ;
    function GetServerName : string ;
    function GetServerAddress : string ;
    function GetServerPort : word ;
    function GetTimeOut : integer ;
    function GetServerHost : string ;
    procedure InitProfileCfg ;
  public
    procedure AfterConstruction ; override ;
  end;


  TDomainPath = class(TProfileInfo, IDomainPath)
  private
    FDomain        : string ;
    procedure InitDomainCfg ;
    function GetDomain : string ;
    procedure SetDomain ( const ADomain : string ) ;
    procedure CheckDomain ;
    function GetPath( const ADBType : TDBType ) : string ;
    function GetBackupFolder  : string;
    function GetPath_syncbackup : string ;
    function GetPath_update_application: string;
    function GetAutoBackupNumberOfDays: Integer;
    function Get_AutoBackupFolder : string;
    function GetCurrentVersion: String;
    procedure GetAppInfo;
  end;

  TDatabaseCfg = class(TDomainPath, IDatabaseCfg )
  private
    class function New : IDatabaseCfg ;
  end;


threadvar
  DatabaseCfg : IDatabaseCfg ;

function DatabaseCfgFactory ( ANewDatabaseCfg  : boolean = False ) : IDatabaseCfg ;
begin
  if ANewDatabaseCfg then
    Exit ( TDatabaseCfg.New  ) ;

  if not Assigned ( DatabaseCfg )  then
     DatabaseCfg := TDatabaseCfg.New ;

  Result := DatabaseCfg ;
end;

{ TProfileInfo }

procedure TProfileInfo.AfterConstruction;
begin
  inherited;
  FAppProfile := AppProfileFactory ;
end;

procedure TProfileInfo.CheckProfile;
begin
   if FProfile = '' then
     raise Exception.Create('Perfil não configurado');
end;


function TProfileInfo.GetDataFolder: string;
begin
   Result := FDataFolder ;
end;


function TProfileInfo.GetProfileList: TStrings;
var
  LProfileList : TStrings ;
  LSections : TStrings ;

  procedure DoCheckAddSection ( ASectionName : string )  ;
  var
    LSectionDescription : string ;
  begin
    if ASectionName.StartsWith( 'DataServer', True ) then
     begin
      LSectionDescription := FAppProfile.ReadString( ASectionName, 'Description', ASectionName ) ;
      LProfileList.Add ( Format ( '%s=%s', [ ASectionName, LSectionDescription ] ) ) ;
     end;
  end;

begin

  LProfileList := TStringList.Create ;

  LSections := TStringList.Create;
  FAppProfile.ReadSections( LSections );
  for var LSectionName in LSections  do
      DoCheckAddSection ( LSectionName ) ;
  LSections.Free ;

  Result := LProfileList ;

end;

function TProfileInfo.GetProfile: string;
begin
  Result := FProfile ;
end;

function TProfileInfo.GetServerAddress: string;
begin
  Result := FServerAddress ;
end;

function TProfileInfo.GetServerHost: string;
begin
  if ( FServerAddress <> '' ) then
    Result := FServerAddress
  else
    Result := FServerName;
end;

procedure TProfileInfo.SetProfile(const AProfile: string);
begin
  FProfile := AProfile ;
  InitProfileCfg ;
end;

procedure TProfileInfo.InitProfileCfg ;
const
  SYNCBACKUP_PATH    = '%s\SyncBackup\';
  UPDATE_APP_PATH    = '%s\UpdateApplication\';
var
  LServerInfo : string ;
begin

  FServerType    := FAppProfile.ReadString ( FProfile,  'ServerType',     '' ) ;
  FServerName    := FAppProfile.ReadString ( FProfile,  'ServerName',     '' ) ;
  FServerAddress := FAppProfile.ReadString ( FProfile,  'ServerAddress',  '' ) ;
  FServerPort    := FAppProfile.ReadInteger( FProfile,  'ServerPort',     0  ) ;
  FTimeOut       := FAppProfile.ReadInteger( FProfile,  'TimeOut',        600000  ) ;
  FControlerPort := FAppProfile.ReadString ( FProfile,  'ControllerPort', '' ) ;
  FDataFolder    := FAppProfile.ReadString ( FProfile,  'DataFolder',     '' ) ;

  FAutoBackupFolder:= FAppProfile.ReadString ( FProfile,  'AutoBackupFolder' , '' ) ;
  FAutoBackupNumberOfDays := FAppProfile.ReadInteger( FProfile,  'AutoBackupNumberOfDays',     7  ) ;
  if ( FDataFolder <> '' ) then
    begin
        if Pos ( ':', FDataFolder ) = 0 then
          begin
            if FDataFolder[1] <> '\' then
              FDataFolder := ExtractFilePath ( ParamStr ( 0 ) ) + FDataFolder
            else
              FDataFolder := ExtractFilePath ( ParamStr ( 0 ) ) + Copy ( FDataFolder, 2, MaxInt ) ;
          end;

      FDataFolder := IncludeTrailingPathDelimiter( FDataFolder ) ;
    end;

  LServerInfo := '' ;

  if FServerAddress <> '' then
    LServerInfo := FServerAddress
  else if FServerName <> '' then
    LServerInfo := FServerName ;

  if ( LServerInfo <> '' ) and (FServerPort <> 0) then
    LServerInfo := Format ( '%s/%d', [ LServerInfo, FServerPort ] ) ;

  if ( LServerInfo = '' ) then // force 127/35250
     LServerInfo := '127.0.0.1/35255' ;

  if ( LServerInfo <> '' ) then
    FDataFolder := Format ( '%s:%s', [ LServerInfo, FDataFolder ] ) ;

  FBackupFolder := '' ;
  FSyncbackup_path := Format(SYNCBACKUP_PATH,[FDataFolder]);
  FUpdate_App_path := Format(UPDATE_APP_PATH,[FDataFolder]);

end;

function TProfileInfo.GetServerType: string;
begin
   Result := FServerType ;
end;

function TProfileInfo.GetTimeOut: integer;
begin
   Result := FTimeOut ;
end;

function TProfileInfo.GetServerName: string;
begin
   Result := FServerName ;
end;

function TProfileInfo.GetServerPort: word;
begin
   Result := FServerPort ;
end;

{TDomainPath}

function StripHost(ADBName: string): string;
var
 PosProtocolDelimiter1 : integer ;
 TmpDBName : string ;
begin
 Result := ADBName ;
 PosProtocolDelimiter1 := Pos ( ':', Result ) ;
 if PosProtocolDelimiter1 > 2 then
   begin
    TmpDBName := Copy ( ADBName, PosProtocolDelimiter1 + 1, MaxInt ) ;
    if Pos ( ':', TmpDBName ) > 0 then
       Result := TmpDBName ;
   end
end;

procedure TDomainPath.InitDomainCfg ;
const
  _DOMAIN_BACKUP_PATH   = '%0:sCL-%1:s\Backup\';
begin
  FBackupFolder := Format(_DOMAIN_BACKUP_PATH, [ StripHost(FDataFolder), FDomain ]);
end;

function TDomainPath.GetDomain: string;
begin
  Result := FDomain ;
end;


procedure TDomainPath.SetDomain(const ADomain: string);
begin
  FDomain := ADomain ;
  InitDomainCfg ;
end;


procedure TDomainPath.CheckDomain ;
begin
   CheckProfile ;
   if FDomain = '' then
     raise Exception.Create('Domínio não configurado');
end  ;

procedure TDomainPath.GetAppInfo;
begin
  FCurrentVersion := FAppProfile.ReadString('App', 'Version', '0');
end;

function TDomainPath.GetAutoBackupNumberOfDays: Integer;
begin
  Result := FAutoBackupNumberOfDays;
end;

function TDomainPath.GetBackupFolder: string;
begin
  Result := FBackupFolder
end;


function TDomainPath.GetCurrentVersion: String;
begin
  GetAppInfo;
  Result:=  FCurrentVersion;
end;


function TDomainPath.GetPath(const ADBType: TDBType): string;
begin
   case ADBType of
    dbSysUtils, dbFederation : CheckProfile
   else
    CheckDomain ;
   end;
   Result := ADBType.Path( FDataFolder, FDomain ) ;
end;

function TDomainPath.Get_AutoBackupFolder: string;
begin
  Result := FAutoBackupFolder;
end;



function TDomainPath.GetPath_syncbackup: string;
begin
  //****
  //CheckProfile ;
  Result := FSyncbackup_path ;
end;

function TDomainPath.GetPath_update_application: string;
begin
  Result := FUpdate_App_path;
end;


{ TDBTypeHelper }

function TDBTypeHelper.Extension: string;
const
  _DB_EXTENSIONS : Array [TDBType] of string = ( '.sysutils', '.DB', '.ENT', '.ZOO', '.FIN', '.ATT', '.JNL');
begin
  Result := _DB_EXTENSIONS[ self ] ;
end;

function TDBTypeHelper.QualifiedPathTemplate : string;
const
  _QUALIFIED_SYSUTILS_PATH   = '%0:s%2:s' ;
  _QUALIFIED_FEDERATION_PATH = '%0:sCLAG5%2:s' ;
  _QUALIFIED_DOMAIN_PATH     = '%0:sCL-%1:s\DB\CLAG5.%1:s%2:s' ;
begin
  case self of
   dbSysUtils   : Exit ( _QUALIFIED_SYSUTILS_PATH ) ;
   dbFederation : Exit ( _QUALIFIED_FEDERATION_PATH ) ;
  end;
  Result := _QUALIFIED_DOMAIN_PATH ;
end;


function TDBTypeHelper.Path( const ADataFolder : string ; const ADomain : string = '' ) : string ;
begin

  if ( self > dbFederation )
    and ADomain.IsEmpty then
    Raise Exception.Create ( 'Domínio inválido' ) ;

  Result := Format(
      QualifiedPathTemplate
    , [
        ADataFolder
      , ADomain
      , Extension
      ]
  );

end;

{ TDatabaseCfg }

class function TDatabaseCfg.New: IDatabaseCfg;
begin
   Result := Create ;
end;

end.
