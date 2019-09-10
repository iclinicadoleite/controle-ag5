unit ClAg5.Common.BackupRestore;

interface

uses FB, AppProfile ;

type
  TLogBackupRestoresCallBack = procedure ( Log : String ) of object ;

  IFirebirdSysUtils = interface
    ['{FAB43008-84F4-4271-89F4-BD8A080F437C}']
    function ForceDirectories ( const AFolderName : string ) : boolean ;
    function DeleteFromServer ( const AFileAName : string ) : boolean ;
    function CopyFromServer ( const ASource, ATarget : string ) : boolean ;
    function CopyToServer   ( const ASource, ATarget : string ) : boolean ;
  end;

  TFirebirdBackupRestoreBase = class
  protected
     FServerName : string ;
     FSourceName : string ;
     FTargetName : string ;
     FProtocol : TFBProtocol ;
     FLog: TLogBackupRestoresCallBack ;
     FSuccess : boolean ;
     procedure ConfigConnection ( var ADBName : string ) ;
     function GetLocalName ( ADBName : string ) : string ;
     function CheckUseTCPIP ( ADBName : string ) : boolean;
     procedure DoLog( ALogStr : string );
  end;

  TFirebirdBackup = class ( TFirebirdBackupRestoreBase )
  private
     procedure FilterLog(cLine: string ; var AStatusDomains : boolean ; AStatusTableName : string  );
     function  InternalExecute( AFBClientPath, ASourceDB, ATargetBackup : string ): boolean;
  public
     class function  Execute( ASourceDB : string; ATargetBackup :  string ;  ALog: TLogBackupRestoresCallBack ) : boolean;
  end;

  TFirebirdRestore = class ( TFirebirdBackupRestoreBase )
  private
     FPageSize : integer ;
     FPageBuffers : integer ;
     procedure FilterLog(cLine: string ; var AStatusDomains : boolean ; AStatusTableName : string  );
     function  InternalExecute( AFBClientPath : string ; ASourceBackup : string; ATargetDB : string ) : boolean ;
  public
     class function Execute(
                             ASourceFileName : string ;
                             ATargetFileName : string ;
                             ALog : TLogBackupRestoresCallBack ;
                             APageSize : integer = 8192 ; APageBuffers : integer = 2000 ) : boolean ;
  end;

function FirebirdSysUtilsFactory(const ADBPath : string) : IFirebirdSysUtils;
function LocalExtractFilePath ( AFileName : string ) : string ;
function RemoveHost ( AFileName : string ) : string ;
function IsEmbedded(ADBName: string): boolean;
function IsLocalHost(ADBName: string): boolean;
function IsRemoteHost(ADBName: string): boolean;
function StripHost(ADBName: string): string;


implementation

uses System.SysUtils
  , FBServices
  , DBXFirebirdSuppl
  , Data.DB
  , Tc.Data.DB.Helpers
  , Data.SqlExpr
  , Data.DBXCommon
  , Tc.Data.SQLExpr ;

type
  TFirebirdSysUtils = class ( TInterfacedObject, IFirebirdSysUtils )
  private
    FDBPath : string ;
    FConnection : TSQLConnection ;
    FSQL        : TTcSQLDataSet ;
    procedure Init ;
    function ForceDirectories ( const AFolderName : string ) : boolean ;
    function DeleteFromServer ( const AFileAName : string ) : boolean ;
    function CopyFromServer ( const ASource, ATarget : string ) : boolean ;
    function CopyToServer   ( const ASource, ATarget : string ) : boolean ;
  public
    constructor Create ( const ADBPath : string ) ;
    class function New ( const ADBPath : string  ) : IFirebirdSysUtils ;
  end ;

function FirebirdSysUtilsFactory(const ADBPath : string) : IFirebirdSysUtils;
begin
  Result := TFirebirdSysUtils.New( ADBPath ) ;
end;

function IsEmbedded(ADBName: string): boolean;
begin
 Result := Pos ( ':', ADBName ) = 2;
end;

function IsLocalHost(ADBName: string): boolean;
begin
 Result := ADBName.StartsWith('127')
        or ADBName.ToLower.StartsWith('locahost')
end;

function IsRemoteHost(ADBName: string): boolean;
var
 PosProtocolDelimiter : integer ;
begin
// Result := (IsEmbedded(ADBName) or IsLocalHost(ADBName))
// if not Result then
//   Exit ;
 Result := False ;
 PosProtocolDelimiter := Pos ( ':', ADBName ) ;
 if PosProtocolDelimiter > 0 then
    Result := Pos ( ':', Copy ( ADBName, PosProtocolDelimiter + 1, MaxInt ) ) > 0 ;
end;

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


function LocalExtractFilePath ( AFileName : string ) : string ;
begin
  if Pos ( ':', AFileName ) > 2 then
//  if ( Length ( AFileName ) > 3 ) and (Copy ( AFileName, 1, 3 ) = '127') then
   Result := ExtractFilePath ( Copy ( AFileName, Pos ( ':', AFileName ) + 1, MaxInt ) )
  else
   Result := ExtractFilePath ( AFileName ) ;

end;

function RemoveHost ( AFileName : string ) : string ;
begin
  if Pos ( ':', AFileName ) > 2 then
//  if ( Length ( AFileName ) > 3 ) and (Copy ( AFileName, 1, 3 ) = '127') then
   Result := Copy ( AFileName, Pos ( ':', AFileName ) + 1, MaxInt )
  else
   Result := AFileName ;

end;

(*

function TUpdateAppForm.RemoveLocalServer(AFileName: string): string;
begin
  if Pos ( ':', AFileName ) > 2 then
   Result := Copy ( AFileName, Pos ( ':', AFileName ) + 1, MaxInt )
  else
   Result := AFileName ;
end;

*)

{TFirebirdBackupRestoreBase}
function TFirebirdBackupRestoreBase.CheckUseTCPIP(ADBName: string): boolean;
var
 PosProtocolDelimiter : integer ;
begin
 PosProtocolDelimiter := Pos ( ':', ADBName ) ;
 if PosProtocolDelimiter > 0 then
    Result := Pos ( ':', Copy ( ADBName, PosProtocolDelimiter + 1, MaxInt ) ) > 0 ;
end;

procedure TFirebirdBackupRestoreBase.ConfigConnection ( var ADBName : string ) ;
var
 PosProtocolDelimiter1,
 PosProtocolDelimiter2 : integer ;
 TmpDBName : string ;
begin
 FServerName := '' ;
 FProtocol   := fbpLocal ;

 PosProtocolDelimiter1 := Pos ( ':', ADBName ) ;
 if PosProtocolDelimiter1 > 0 then
   begin
    TmpDBName := Copy ( ADBName, PosProtocolDelimiter1 + 1, MaxInt ) ;
    PosProtocolDelimiter2 := Pos ( ':', TmpDBName ) ;
    if PosProtocolDelimiter2 > 0 then
      begin
       FServerName := Copy ( ADBName,   1, PosProtocolDelimiter1 - 1 )  ;
       ADBName     := Copy ( TmpDBName, PosProtocolDelimiter2 - 1, MaxInt )  ;
       FProtocol   := fbpTcp ;
      end
   end
end;

procedure TFirebirdBackupRestoreBase.DoLog( ALogStr: string ) ;
begin
  if Assigned ( FLog ) then
     FLog ( ALogStr ) ;
end;


function TFirebirdBackupRestoreBase.GetLocalName(ADBName: string): string;
var
 PosProtocolDelimiter1 : integer ;
 TmpDBName : string ;
begin
 Result := ADBName ;
 PosProtocolDelimiter1 := Pos ( ':', Result ) ;
 if PosProtocolDelimiter1 > 0 then
   begin
    TmpDBName := Copy ( ADBName, PosProtocolDelimiter1 + 1, MaxInt ) ;
    if Pos ( ':', TmpDBName ) > 0 then
       Result := TmpDBName ;
   end
end;

{TFirebirdBackupAgenda5}
procedure TFirebirdBackup.FilterLog(cLine: string; var AStatusDomains : boolean ; AStatusTableName : string  );
begin
  if cLine.Trim <> ''then
    FSuccess  := cLine.StartsWith ( 'gbak:closing file, committing, and finishing' ) ;
  DoLog ( cLine ) ;
  Exit ;

  if Pos ( 'gbak:    writing data for table ', cLine  ) > 0 then
    begin
     if AStatusTableName = '' then
        DoLog ( 'writing data for tables:' ) ;
     AStatusTableName := Copy ( cLine, 33, 33 ) ;
    end;
  if (Length ( cLine ) >= 6) and ( cLine[6] <> ' ' ) then
    begin
       if CharInSet ( cLine[6], ['0'..'9'] ) then
         cLine := copy ( cLine, 1, 5 ) + AStatusTableName + '=' + Copy ( cLine, 6, Length ( cLine ) ) ;
       cLine := Copy (cLine, 6, Length ( cLine ) ) ;
       DoLog ( cLine );
    end ;
end;

function TFirebirdBackup.InternalExecute(AFBClientPath, ASourceDB,  ATargetBackup : string ): boolean;
var
 // backup
 FStatusTableName : string ;
 FStatusDomains : boolean ;

begin
 FStatusTableName := '';

 try
   DoLog ( 'backuping: ' + ExtractFileName  ( ASourceDB ) ) ;
   DoLog ( 'from: ' + ExtractFilePath ( ASourceDB ) ) ;
   DoLog ( 'to: ' + ATargetBackup ) ;

   ConfigConnection ( ASourceDB ) ;
   FSuccess := False ;
   with TFBBackupService.Create ( AFBClientPath ) do
     try
        Verbose := True ;
        DatabaseName := ASourceDB  ;
        Protocol     := self.FProtocol ;
        ServerName   := self.FServerName ;
        BackupFile.Add ( ATargetBackup ) ;
        Attach ;
        ServiceStart ;
        While not(Eof)do
          FilterLog ( GetNextLine, FStatusDomains, FStatusTableName ) ;
        Detach;
        Result := FSuccess  ;
     finally
       free ;
     end;
 except on E : Exception do
   begin
    DoLog ( E.Message ) ;
    Result := False ;
   end;
 end;

end;


class function TFirebirdBackup.Execute( ASourceDB : string; ATargetBackup :  string ; ALog: TLogBackupRestoresCallBack ): boolean;
begin
  With Create do
    try
      FLog := ALog ;
      Result := InternalExecute(
             AppProfileFactory.ReadString( 'TDBXFirebird250Driver', 'VendorLib', 'fb\fbclient.dll' )
           , ASourceDB
           , ATargetBackup );
    finally
      Free ;
    end;
end;

{ TFirebirdRestore }

class function TFirebirdRestore.Execute( ASourceFileName,
  ATargetFileName: string; ALog: TLogBackupRestoresCallBack ;
  APageSize : integer = 8192 ; APageBuffers : integer = 2000 ): boolean;
begin

  With Create do
    try
      FPageSize := APageSize ;
      FPageBuffers := APageBuffers ;
      FLog := ALog ;
      //InternalExecute( AFBClientPath, TempFolder.TempPath + ExtractFileName ( FarmPath.Path_Federation ) + '.FBK',  FarmPath.Path_Federation );
      Result := InternalExecute(
           AppProfileFactory.ReadString( 'TDBXFirebird250Driver', 'VendorLib', 'fb\fbclient.dll' )
        ,  ASourceFileName
        ,  ATargetFileName
      ) ;
    finally
      Free ;
    end;
end;

procedure TFirebirdRestore.FilterLog(cLine: string; var AStatusDomains: boolean;
  AStatusTableName: string);
begin
  if cLine.Trim <> ''then
    FSuccess  := cLine.StartsWith ( 'gbak:finishing, closing, and going home' ) ;
  DoLog ( cLine ) ;
  Exit ;

// finishing, closing, and going home
///Restore Error


 if ( Pos ( 'gbak:restoring domain', cLine  ) > 0 )  then
   begin
       if ( not AStatusDomains) then
          DoLog ( 'restoring domains' ) ;
       AStatusDomains:= True ;
       cLine := '' ;
   end
 else if Pos ( 'gbak:restoring table ', cLine  ) > 0 then
   begin
    if AStatusTableName = '' then
       DoLog ( 'restoring tables' ) ;
    AStatusTableName := Copy ( cLine, 22, 33 ) ;
    DoLog ( '    ' + AStatusTableName ) ;
   end
 else if (Length ( cLine ) >= 6) and ( cLine[6] <> ' ' ) then
   begin
     // if cLine[6] in ['0'..'9'] then
     //   cLine := cTableName + '=' + Copy ( cLine, 6, Length ( cLine ) ) ;
     // cLine := copy ( cLine, 1, 5 ) + cTableName + '=' + Copy ( cLine, 6, Length ( cLine ) ) ;
      cLine := Copy ( cLine, 6, Length ( cLine ) ) ;
      DoLog ( cLine );
   end;
end;

function TFirebirdRestore.InternalExecute(AFBClientPath, ASourceBackup,  ATargetDB: string  ): boolean;
var
 // restore
 FStatusTableName : string ;
 FStatusDomains : boolean ;

begin
 FStatusTableName := '';

 try
   DoLog ( 'restoring: ' + ExtractFileName  ( ATargetDB ) ) ;
   DoLog ( 'to: ' + ExtractFilePath ( ATargetDB ) ) ;
   DoLog ( 'from: ' + ASourceBackup ) ;

   ConfigConnection ( ATargetDB ) ;
   FSuccess := False ;
   with TFBRestoreService.Create ( AFBClientPath ) do
    try
      Verbose := True ;
      BackupFile.Add ( ASourceBackup ) ;
      Protocol     := self.FProtocol ;
      ServerName   := self.FServerName ;
      DatabaseName.Add ( ATargetDB ) ;
      FixFssCharacterSet   := 'ISO8859_1' ;
      PageSize             := self.FPageSize    ; // 8192 ;
      PageBuffers          := self.FPageBuffers ; //65536 ;  //8192 * 32768 = 256MB, * 65536 = 512 MB
      Options := Options + [TFBRestoreOption.Replace,TFBRestoreOption.UseAllSpace] - [TFBRestoreOption.FixFss] ;
      Attach ;
      ServiceStart ;
      While not(Eof) do
        FilterLog ( GetNextLine, FStatusDomains, FStatusTableName ) ;
      Detach;
      Result := FSuccess  ;
    finally
      free ;
    end;
 except on E : Exception do
   begin
    DoLog ( E.Message ) ;
    Result := False ;
   end;
 end;
end;


{ TFirebirdSysUtils }


procedure TFirebirdSysUtils.Init;
begin
  FConnection := TSQLConnection.Create(nil);
  with FConnection, Params do
  begin
    LoginPrompt := False;
    DriverName := 'Firebird250';
    TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
    Values['Database'] := FDBPath ;
    SQLHourGlass := False;
    Open;
  end;
  FSQL := TTcSQLDataSet.Create( FConnection ) ;
  FSQL.SQLConnection := FConnection ;
  FSQL.GetMetadata := False ;
end;

function TFirebirdSysUtils.ForceDirectories(const AFolderName: string): boolean;
begin
  FSQL.CommandText := 'SELECT SU$FORCEDIRECTORIES( :AFOLDERNAME ) FROM RDB$DATABASE' ;
  FSQL.ParamByName( 'AFOLDERNAME' ).asString := AFolderName ;
  FSQL.Open ;
  Result := FSQL.Fields[0].asInteger = 1 ;
  FSQL.Close ;
end;

function TFirebirdSysUtils.DeleteFromServer( const AFileAName : string ) : boolean ;
begin
  FSQL.CommandText := 'SELECT SU$DELETEFILE( :AFILENAME ) FROM RDB$DATABASE' ;
  FSQL.ParamByName( 'AFILENAME' ).asString := AFileAName ;
  FSQL.Open ;
  Result := FSQL.Fields[0].asInteger = 1 ;
  FSQL.Close ;
end;

function TFirebirdSysUtils.CopyFromServer(const ASource,
  ATarget: string): boolean;
var
  T : TDBXTransaction ;
begin
  FSQL.CommandText := 'SELECT SU$LOADBLOBFROMFILE( :ASOURCE ) FROM RDB$DATABASE' ;
  FSQL.ParamByName( 'ASOURCE' ).asString := ASource ;
  T := FSQL.SQLConnection.BeginTransaction ;
  FSQL.Open ;
  TBlobField ( FSQL.Fields[0] ).SaveToFile( ATarget ) ;
  FSQL.Close ;
  FSQL.SQLConnection.RollbackFreeAndNil( T ) ;
end;

function TFirebirdSysUtils.CopyToServer(const ASource,
  ATarget: string): boolean;
begin
  FSQL.CommandText := 'SELECT SU$SAVEBLOBTOFILE( :ATARGET, :BLOB_ ) FROM RDB$DATABASE' ;
  FSQL.ParamByName( 'ATARGET' ).asString := ATarget ;
  FSQL.ParamByName( 'BLOB_' ).LoadFromFile( ASource, ftBlob ) ;
  FSQL.Open ;
  Result := FSQL.Fields[0].asInteger = 1 ;
  FSQL.Close ;
end;

constructor TFirebirdSysUtils.Create(const ADBPath : string);
begin
   inherited Create ;
   FDBPath := ADBPath ;
   Init ;
end;

class function TFirebirdSysUtils.New(
  const ADBPath : string): IFirebirdSysUtils;
begin
   Result := Create ( ADBPath ) ;
end;


end.
