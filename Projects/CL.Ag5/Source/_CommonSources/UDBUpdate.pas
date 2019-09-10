unit UDBUpdate;

interface

uses
  Tc.DBRTL.AbstractDB,
  Tc.VCL.Application,
  System.Classes,
  Data.DB, Tc.Data.DB.Helpers,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Dialogs,
  ClAg5.Common.Journaling, ClAg5.Common.RLogTriggers ;

type
(*
    procedure populateClientDataSet( var cds: TClientDataSet; const SQL: String; AParams: TParams = nil );
    procedure GetKey ( AFieldKey : TField ; AGeneratorName : String = '' ) ;
    procedure GetSystemTypes ( Tipo : string ; TargetSysTypes : TClientDataSet ) ;
    function  GetTableDescription ( ATableName : string ) : string ;
    procedure Execute ( const ASQLStmt : string ; AParams : TParams ; AResultSet : Pointer = nil );
*)
  TDBUpdate = class( TObject, ITcAbstractDB )
  private
    FMethods: TStringList ;
    FIDB: Tc.DBRTL.AbstractDB.ITcAbstractDB;
    FUpdatingDBVersion : string ;
    procedure GetVersion ;
    procedure DumpMethods ;
    procedure ExecuteMethods ;
    procedure ExecuteMethod ( AMethodName : string );
    procedure UpdateVersion ;
    procedure InitJournaling ;
    procedure InitRLogTriggers ;
  protected
    FInitialDBVersion: string ;
    procedure Log ( const AMessage : string ) ;
    class function LoggedUser: TLoggedUser;
    procedure Reconnect ;
    procedure ExecuteDirect ( ASQL : string ) ;
    function TryExecuteDirect ( ASQL : string ) : boolean ;
    procedure populateClientDataSet( var cds: TClientDataSet; const SQL: String; AParams: TParams = nil );
    property IDB : ITcAbstractDB read FIDB implements ITcAbstractDB ;
  public
    Destructor Destroy ; override ;
    class procedure Execute ( AIDB : Tc.DBRTL.AbstractDB.ITcAbstractDB ) ;
    class function GetLastVersion : string ;
  end;

implementation

uses System.SysUtils, RTTI, Tc.RTL.Exceptions, Tc.RTL.NotificationService ,
  CL.Ag5.NSMsgs;


destructor TDBUpdate.Destroy;
begin
  if Assigned ( FMethods ) then
     FMethods.DisposeOf ;
  inherited;
end;

procedure TDBUpdate.DumpMethods ;
var
  RttiType: TRttiType;
  LFirstMethod : string ;
begin
  Log( 'TDBUpdate.DumpMethods' ) ;

  LFirstMethod := FInitialDBVersion.Insert(0,'_').Replace('.', '_', [rfReplaceAll]) ;
  FMethods := TStringList.Create ;
  RttiType := TRttiContext.Create.GetType( ClassType ) ;
  for var UpdateMethod in RttiType.GetMethods do
    if UpdateMethod.Name.StartsWith( '_' ) and ( UpdateMethod.Name.CompareTo( LFirstMethod ) > 0 )  then
      FMethods.Append( UpdateMethod.Name );
  RttiType.DisposeOf ;
  FMethods.Sort;
end;

class function TDBUpdate.GetLastVersion : string ;
var
  RttiType: TRttiType;
  LLastMethod : string ;
begin
  LLastMethod := '_0_000_00' ;

  RttiType := TRttiContext.Create.GetType( ClassInfo ) ;
  for var UpdateMethod in RttiType.GetMethods do
    if UpdateMethod.Name.StartsWith( '_' ) and ( UpdateMethod.Name.CompareTo( LLastMethod ) > 0 )  then
      LLastMethod := UpdateMethod.Name ;
  RttiType.DisposeOf ;
  Result := LLastMethod.Remove(0,1).Replace('_', '.', [rfReplaceAll]) ;
end;

(*

{ TLogService }
type
  TBaseLogNotifier = class ( TComponent )
  private
    FLog: string;
    procedure SetLog(const Value: string);
  public
   type
     TNotification = class
       private
       const
         LogNotification : TGUID = '{43387647-7C45-40AA-A805-301079E21406}' ;
       type
         TLogNotificationMessage = class
         public
           Message : string ;
         end;
     end;
  public
   property Log : string  read FLog write SetLog ;
   class procedure Subscribe ( ANotifyMethod : TNotifyEvent ) ;
  end;

  class procedure TBaseLogNotifier.Subscribe(ANotifyMethod: TNotifyEvent);
  begin
    TNotificationService.Subscribe( ANotifyMethod, [TNotification.LogNotification] )
  end;

  procedure TBaseLogNotifier.SetLog (const Value: string);
  var
    LMessage : TNotification.TLogNotificationMessage ;
  begin
    FLog := Value;
    LMessage := TNotification.TLogNotificationMessage.Create ;
    LMessage.Message := FLog ;
    TNotificationService.Notify( Owner, TNotification.LogNotification, LMessage );
    LMessage.free ;
  end;

  type
   TLogNotifier = class ( TBaseLogNotifier )
   public
    type
      TNotification = class( TBaseLogNotifier.TNotification )
        public
          const
            LogNotification : TGUID = '{E95F50C0-167F-4042-9F1F-D185D2F08F76}' ;
       type
         TLogNotificationMessage = class ( TBaseLogNotifier.TNotification.TLogNotificationMessage )  ;
      end;
   end ;
*)

procedure TDBUpdate.ExecuteMethods;
begin

 for var LMethodName in FMethods do
  try
    FUpdatingDBVersion := LMethodName.Remove( 0, 1 ).Replace( '_', '.', [rfReplaceAll] ) ;
    //FUpdatingDBVersion )
    //TNotificationService.Notify();
    ExecuteMethod( LMethodName ) ;
    UpdateVersion ;
  except on E : Exception do
    RaiseException( E, UnitName, ClassName, 'Update : ' + FUpdatingDBVersion );
  end;
  if FMethods.Count > 0 then
     Reconnect ;
end;

procedure TDBUpdate.ExecuteMethod ( AMethodName : string );
var
  LMethodInfo : TMethod;
begin
  Log(  'Aplicando atualização para versão : ' + FUpdatingDBVersion ) ;

  LMethodInfo.Data := Pointer(self) ;
  LMethodInfo.Code := self.MethodAddress(AMethodName) ;
  TThreadMethod(LMethodInfo) ;
end;



procedure TDBUpdate.UpdateVersion;
const
  _SQL_UPDATE_SYSVERSION =
              'UPDATE SYS$VERSION'
       +#13#10'SET SYS$VERSION  = %d,'
       +#13#10'    SYS$RELEASE  = %d,'
       +#13#10'    SYS$REVISION = %d' ;
var
 LVersionArray : TArray<string> ;
begin
  Log( 'Versão ' + FUpdatingDBVersion + ' aplicada com sucesso' ) ;

  LVersionArray := FUpdatingDBVersion.Split( [ '.' ] ) ;
  ExecuteDirect (
    Format ( _SQL_UPDATE_SYSVERSION,
       [ LVersionArray[0].ToInteger,
         LVersionArray[1].ToInteger,
         LVersionArray[2].ToInteger
       ] ) ) ;
end;

class procedure TDBUpdate.Execute(
  AIDB: Tc.DBRTL.AbstractDB.ITcAbstractDB);
begin
  with Create do
    try
      try
       FIDB := AIDB ;
       GetVersion ;
       DumpMethods ;
       ExecuteMethods ;
      except On E : Exception do
         Log ( E.Message ) ;
      end;
    finally
      free ;
    end;
end;


procedure TDBUpdate.GetVersion;
var
   cds : TClientDataSet ;
begin
    {
    ExecuteDirect( 'EXECUTE BLOCK'
    + #13#10'AS'
    + #13#10'BEGIN'
    + #13#10'  IF ( NOT EXISTS (SELECT 1 FROM RDB$RELATIONS WHERE RDB$RELATION_NAME = ''SYS$VERSION'') ) THEN'
    + #13#10'     EXECUTE STATEMENT ''CREATE TABLE SYS$VERSION ( SYS$VERSION SYS$INT, SYS$RELEASE SYS$INT, SYS$REVISION SYS$INT, SYS$APPVERSION SYS$INT)'' ;'
    + #13#10'END' ) ;}

    Log ( 'Checking SYS$VERSION.' ) ;

    ExecuteDirect(
           'EXECUTE BLOCK'
    +#13#10'AS'
    +#13#10'BEGIN'
    +#13#10'  IF ( NOT EXISTS (SELECT 1 FROM RDB$RELATIONS WHERE RDB$RELATION_NAME = ''SYS$VERSION'') ) THEN'
    +#13#10'       EXECUTE STATEMENT ''CREATE TABLE SYS$VERSION ( SYS$VERSION SYS$INT, SYS$RELEASE SYS$INT, SYS$REVISION SYS$INT, SYS$APPVERSION SYS$INT)'' ;'
    +#13#10''
    +#13#10'  IF ( NOT EXISTS (SELECT 1 FROM RDB$RELATION_FIELDS'
    +#13#10'                   WHERE RDB$RELATION_NAME = ''SYS$VERSION'' AND RDB$FIELD_NAME = ''SYS$APPVERSION'' )  ) THEN'
    +#13#10'       EXECUTE STATEMENT ''ALTER TABLE SYS$VERSION ADD SYS$APPVERSION SYS$INT DEFAULT 0'' ;'
    +#13#10'END' );


    Log ( 'Checking SYS$VERSION initialized.' ) ;


    ExecuteDirect(
             'EXECUTE BLOCK'
      +#13#10'AS'
      +#13#10'DECLARE DB_KEY CHAR(8) CHARACTER SET OCTETS;'
      +#13#10'BEGIN'
      +#13#10''
      +#13#10'  FOR SELECT RDB$DB_KEY'
      +#13#10'  FROM SYS$VERSION DO'
      +#13#10'  ORDER BY'
      +#13#10'    SYS$VERSION'
      +#13#10'  , SYS$RELEASE'
      +#13#10'  , SYS$REVISION'
      +#13#10'    DESC'
      +#13#10'  ROWS 1'
      +#13#10'  INTO DB_KEY DO'
      +#13#10'    DELETE FROM SYS$VERSION'
      +#13#10'    WHERE RDB$DB_KEY <> :DB_KEY ;'
      +#13#10''
      +#13#10' IF ( (SELECT COUNT(*) FROM SYS$VERSION) = 0 ) THEN'
      +#13#10'    INSERT INTO SYS$VERSION (SYS$VERSION, SYS$RELEASE, SYS$REVISION) VALUES ( 5,0,0 ) ;'
      +#13#10'END'
    ) ;

    Log ( 'Getting version.' ) ;

    cds := nil ;
    FIDB.populateClientDataSet(cds,
              'SELECT'
      +#13#10'   SYS$VERSION'
      +#13#10' , SYS$RELEASE'
      +#13#10' , SYS$REVISION'
      +#13#10'FROM SYS$VERSION'
      +#13#10'ORDER BY'
      +#13#10'    SYS$VERSION'
      +#13#10'  , SYS$RELEASE'
      +#13#10'  , SYS$REVISION'
      +#13#10'  DESC'
      +#13#10'ROWS 1'
    );
    FInitialDBVersion := Format ( '%d.%.3d.%.2d',
     [
         cds.FieldByName('SYS$VERSION').asInteger
       , cds.FieldByName('SYS$RELEASE').asInteger
       , cds.FieldByName('SYS$REVISION').asInteger
     ]
    ) ;
    cds.free ;
    Log ( 'Version: ' + FInitialDBVersion ) ;

end;


procedure TDBUpdate.InitJournaling;
begin
  TJournaling.InitJournaling( FIDB );
end;

procedure TDBUpdate.InitRLogTriggers;
begin
  TRLogTriggers.InitRLogTriggers ( FIDB );
end;

procedure TDBUpdate.ExecuteDirect(ASQL : string );
begin
  if not Assigned ( FIDB ) then
    raise Exception.Create('TDBUpdate: FIDB not assigned');
  FIDB.ExecuteDirect ( ASQL ) ;
end;

function TDBUpdate.TryExecuteDirect(ASQL: string): boolean ;
begin
  Result := True ;
  try
    ExecuteDirect ( ASQL ) ;
  except
    Result := False ;
  end;
end;



procedure TDBUpdate.Log(const AMessage: string);
begin
    with TCLAg5NSMsgDBUpdate.Create( self ) do
      begin
        Message := AMessage ;
        Dispatch ;
      end;
end;

class function TDBUpdate.LoggedUser: TLoggedUser;
begin
   Result := Tc.VCL.Application.TTcApplication.Instance.LoggedUser ;
end;

procedure TDBUpdate.populateClientDataSet(var cds: TClientDataSet;
  const SQL: String; AParams: TParams);
begin
  FIDB.populateClientDataSet( cds, SQL, AParams );
end;


procedure TDBUpdate.Reconnect;
var
 LAfterConnect,
 LBeforeConnect,
 LAfterDisconnect,
 LBeforeDisconnect: TNotifyEvent  ;
begin
 with FIDB.Connection do
   begin
     LAfterConnect       :=  AfterConnect  ;
     LBeforeConnect      :=  BeforeConnect ;
     LAfterDisconnect    :=  AfterDisconnect ;
     LBeforeDisconnect   :=  BeforeDisconnect ;

     AfterConnect       :=  nil ;
     BeforeConnect      :=  nil ;
     AfterDisconnect    :=  nil ;
     BeforeDisconnect   :=  nil ;

     Close ;
     Open ;

     AfterConnect       :=  LAfterConnect  ;
     BeforeConnect      :=  LBeforeConnect ;
     AfterDisconnect    :=  LAfterDisconnect ;
     BeforeDisconnect   :=  LBeforeDisconnect ;
   end;
end;

{ TLogNotificationService.TNotification }


end.
