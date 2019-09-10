unit ClAg5Admin.DatabaseIntf;

interface

uses Classes ;

 type

  IBasePath = interface
    ['{F345F809-C98A-4B26-A245-5751758903E2}']
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
    function GetDBConnectionString : string ;
    property DataFolder: string read GetDataFolder;
    property Profile : string read GetProfile write SetProfile ;
    property ServerType    : string Read GetServerType ;
    property ServerName    : string Read GetServerName ;
    property ServerAddress : string Read GetServerAddress ;
    property ServerPort    : word   Read GetServerPort ;
    property ServerHost    : string Read GetServerHost ;
    property TimeOut       : integer  Read GetTimeOut ;
    property DBConnectionString : string  Read GetDBConnectionString ;
  end;
(*
  IFederationPath = interface ( IBasePath )
   ['{9C6138AD-614D-4839-9B5A-DB3C64686567}']
   function GetPath_Federation : string ;
   property Path_Federation: string read GetPath_Federation;
  end;

  IDomainPath = interface ( IFederationPath )
    ['{86B23536-C67E-4727-BF5C-52B32C9B9FA9}']
    function  GetDomain : string ;
    procedure SetDomain ( const ADomain : string ) ;
    function  GetPath : string ;
    function  GetBackupFolder : string;
    property  Path : string       read GetPath;
    property  BackupFolder : string    read GetBackupFolder ;
    property  Domain : string read GetDomain write SetDomain ;
  end;
*)
  IDatabaseCfg = interface( IBasePath )
  end;

function DatabaseCfgFactory ( ANewDatabaseCfg  : boolean = False ) : IDatabaseCfg ;

implementation

uses System.SysUtils, AppProfile ;

{ TDomainPath }

const
  CLAG5_BASEPATH = '%s';
  FEDERATION_DB      = CLAG5_BASEPATH + 'CLAG5.MASTERDB';

  DOMAIN_PATH          = CLAG5_BASEPATH + 'CL-%s\';//+ 'CL-%6.6d\';

//  FARM_DATA_PATH     = DOMAIN_PATH        + 'DB\';
//  FARM_DB_BASENAME   = FARM_DATA_PATH   + 'CLAG5.%s';//+ 'CLAG5.%6.6d';

  FARM_BACKUP_PATH   = DOMAIN_PATH      + 'Backup\';

type

  TBasePath = class(TInterfacedObject, IBasePath)
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

    FDBConnectionString : string ;
    FBackupFolder : string;

    procedure CheckProfile ;
    procedure InitProfileCfg ;

    function GetProfile : string ;
    procedure SetProfile ( const AProfile : string ) ;
    function GetProfileList : TStrings ;
    function GetDataFolder : string ;
    function GetPath : string ;
    function GetDBConnectionString : string ;
    function GetBackupFolder  : string;
    function GetServerType : string ;
    function GetServerName : string ;
    function GetServerAddress : string ;
    function GetServerPort : word ;
    function GetTimeOut : integer ;
    function GetServerHost : string ;
  public
    procedure AfterConstruction ; override ;
  end;

  TDatabaseCfg = class(TBasePath, IDatabaseCfg )
  private
  end;

threadvar
  F : IDatabaseCfg ;

function DatabaseCfgFactory ( ANewDatabaseCfg  : boolean = False ) : IDatabaseCfg ;
begin
  if ANewDatabaseCfg then
    Exit ( TDatabaseCfg.Create  ) ;

  if not Assigned ( F )  then
     F := TDatabaseCfg.Create ;

  Result := F ;
end;

{ TBassePath }

procedure TBasePath.AfterConstruction;
begin
  inherited;
  FAppProfile := AppProfileFactory ;
end;

procedure TBasePath.CheckProfile;
begin
   if FProfile = '' then
     raise Exception.Create('Perfil não configurado');
end;


function TBasePath.GetDataFolder: string;
begin
   Result := FDataFolder ;
end;


function TBasePath.GetDBConnectionString: string;
begin
   Result := FDBConnectionString
end;

function TBasePath.GetProfileList: TStrings;
var
  LProfileList : TStrings ;
  LSectionName : string ;
  LSections : TStrings ;

  procedure DoCheckAddSection ( ASectionName : string )  ;
  var
    LSectionDescription : string ;
  begin
    if not ASectionName.StartsWith( 'DataServer', True ) then
       exit ;

    LSectionDescription := FAppProfile.ReadString( ASectionName, 'Description', ASectionName ) ;
    LProfileList.Add ( Format ( '%s=%s', [ ASectionName, LSectionDescription ] ) ) ;
  end;

begin

  LProfileList := TStringList.Create ;

  LSections := TStringList.Create;
  FAppProfile.ReadSections( LSections );
  for LSectionName in LSections  do
      DoCheckAddSection ( LSectionName ) ;
  LSections.Free ;

  Result := LProfileList ;
end;

function TBasePath.GetProfile: string;
begin
  Result := FProfile ;
end;

function TBasePath.GetServerAddress: string;
begin
  Result := FServerAddress ;
end;

function TBasePath.GetServerHost: string;
begin
  if ( FServerAddress <> '' ) then
    Result := FServerAddress
  else
    Result := FServerName;
end;

procedure TBasePath.SetProfile(const AProfile: string);
begin
  FProfile := AProfile ;
  InitProfileCfg ;
end;

procedure TBasePath.InitProfileCfg ;
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

  if ( FDataFolder <> '' ) then
    begin
        if Pos ( ':', FDataFolder ) = 0 then
          begin
            if FDataFolder[1] <> '\' then
              FDataFolder := ExtractFilePath ( ParamStr ( 0 ) ) + FDataFolder
            else
              FDataFolder := ExtractFilePath ( ParamStr ( 0 ) ) + Copy ( FDataFolder, 2, MaxInt ) ;
          end;

      if ( FDataFolder[Length( FDataFolder)] <> '\'  ) then
         FDataFolder := FDataFolder + '\' ;
    end;

  LServerInfo := '' ;

  if FServerAddress <> '' then
    LServerInfo := FServerAddress
  else if FServerName <> '' then
    LServerInfo := FServerName ;

  if ( LServerInfo <> '' ) and (FServerPort <> 0) then
    LServerInfo := Format ( '%s/%d', [ LServerInfo, FServerPort ] ) ;

  if ( LServerInfo <> '' ) then
    FDataFolder := Format ( '%s:%s', [ LServerInfo, FDataFolder ] ) ;

  FDBConnectionString := Format (  FEDERATION_DB, [ FDataFolder ] ) ;

  FBackupFolder := '' ;

end;


function TBasePath.GetPath: string;
begin
   CheckProfile ;
   Result := FDBConnectionString ;
end;


function TBasePath.GetBackupFolder: string;
begin
//  FBackupFolder := Format(FARM_BACKUP_PATH, [FDataFolder, FDomain ]);
  Result := FBackupFolder
end;

{ TDomainPath }

function TBasePath.GetServerType: string;
begin
   Result := FServerType ;
end;

function TBasePath.GetTimeOut: integer;
begin
   Result := FTimeOut ;
end;

function TBasePath.GetServerName: string;
begin
   Result := FServerName ;
end;

function TBasePath.GetServerPort: word;
begin
   Result := FServerPort ;
end;


{ TDatabaseCfg }

end.
