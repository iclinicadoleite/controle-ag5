unit UDBSession ;

{ DONE 5 -oCaique -cInfra-Extrutura do Sistema : - Problemas conexão FB Embedded }

{.$D-}

// 192.168.100.102/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\ControleLeiteiro4

interface

 uses
    WinApi.Windows
  , VCL.Consts
  , System.Classes
  , System.SysUtils
//,  VCL.Forms //need review
  , System.WideStrings
  , Data.SqlExpr
  , Data.DB
  , Data.FMTBcd
  , Data.DBXFirebird
  , Tc.Data.DB.Helpers
  , DataSnap.DBClient
  , Tc.DataSnap.DBClient.Helpers
  //, DBResourcesIntf
  , Tc.RTL.NotificationService
  //, Tc.VCL.Dialogs
  , CDSSuppl
  , UConfigIndexCDS
  , UConfigFieldsCDS
  , SQLSuppl
  , Tc.VCL.Application
//, VCL.Graphics
  , Tc.DBRTL.AbstractDB
  , Tc.DBRTL.AbstractDB.DBX
{$IFNDEF _DSServer}
// , Exceptions, //DBXFirebirdSuppl,
// , SysPrintGridDialog, //IPrintGridStorage
{$ENDIF}
  , JvDBGridSuppl
  , CLAG5.DatabaseIntf
  , Data.DBXDataSnap
  , IPPeerClient
  , Data.DBXCommon
  , Data.DBXCompressionFilter
  ;

type


  IPrintGridStorage = interface
  ['{5DC32D04-E385-43C0-81D4-CA2C4F2B9A7D}']
    procedure SaveGridReport  ( UID, Stream : string ) ;
    function  LoadGridReport  ( UID  : string ) : string ;
  end ;


//  TDBSession = class(T_DBResources, IDBResources, IGridStorage, IPrintGridStorage )
  TDBSession = class(TDatamodule
     {$IFNDEF _DSServer} , {IDBResources, } IGridStorage,
     IPrintGridStorage
      {$ENDIF}
     {,IConfigIndexCDS} )
    SQLDB: TSQLConnection;
    ADBSession: TTcadb_DBX;
    SQLConnection1: TSQLConnection;
    procedure SQLDBBeforeConnect(Sender: TObject);
    procedure ADBSessionInitSystemTypes(AbstractDB: ITcAbstractDB;
      ASysTypes: TCustomClientDataSet);
    procedure SQLDBAfterConnect(Sender: TObject);
  private
    { Private declarations }
    FUserName : string ;
    FConfigIndexCDS : IConfigIndexCDS;
    FConfigureFieldsCDS: IConfigFieldsCDS;

    procedure InitFirebirdConnection ;
    procedure InitDB  ;
    procedure LoggedUserChanged( ASender : TTcNSMSg );

  {$IFNDEF _DSServer}
    { IGridStorage }
    procedure SaveGridColumns (UID, Stream: string; ADataSetID: String = '');
    function  LoadGridColumns ( UID  : string ) : TGridConfig ;

    { IPrintGridStorage }
    procedure SaveGridReport  ( UID, Stream : string ) ;
    function  LoadGridReport  ( UID  : string ) : string ;

    procedure ResetUserGrid ;
    procedure InitGridReport ;
  {$ENDIF}

  public
    { Public declarations }
{$IFNDEF _DSServer}
    class function LoggedUser: TLoggedUser;
{$ENDIF}
    procedure Reconnect ;
    Constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses
  DBXFirebirdSuppl,
  DateUtils, System.Variants, DSIntf, Tc.RTL.StringUtils, ParamsSuppl, GuidSuppl, Tc.RTL.MD5 ,
//  CLAg5Types,
  ClAg5.Common.Journaling, ClAg5.Common.RLogTriggers,
  Data.SQLTimSt,
  Tc.RTL.Files.Scan, Tc.VCL.Graphics,
  WinAPI.WinSock  ,
  UDBSession.Update,
  CL.Ag5Client.UDBSession.Initialize,
  CL.Ag5.NSMsgs ;

{$R *.DFM}



constructor TDBSession.Create(AOwner: TComponent);
begin
  inherited;
  TTcNSMsgLoggedUserChanged.Subscribe ( LoggedUserChanged );
{$IFNDEF _DSServer}
  TGridStorager.SetStorage ( self ) ;
  //TPrintGridStorager.SetStorage ( self ) ;
{$ENDIF}

  FConfigIndexCDS := TConfigIndexCDS.Create;
  TCDSSuppl.RegisterIndexSaver( FConfigIndexCDS ) ;
  FConfigureFieldsCDS:= TConfigFieldsCDS.Create;
  TCDSSuppl.RegisterConfigFieldsCDS( FConfigureFieldsCDS );
end;

destructor TDBSession.Destroy;
begin
{$IFNDEF _DSServer}
  //TGridStorager.SetStorage ( nil ) ;
  //TPrintGridStorager.SetStorage ( nil ) ;
{$ENDIF}
  inherited;
end;


procedure TDBSession.InitFirebirdConnection ;
begin
     with SQLDB,Params do
       begin
         DriverName := 'Firebird250' ;
         TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
         Values[ 'Database'      ] := DatabaseCfgFactory.Path [ dbFederation ] ;
       end ;
end ;


procedure TDBSession.InitDB  ;
begin
    TDBSessionUpdate.Execute( ADBSession );
    TClAg5InitTables.Execute (  ExtractFilePath (ParamStr(0) )+'CLAg5.mdt', ADBSession  ) ;
end ;




function TCPPortIsOpen( AIPAddress : AnsiString ; APort : Word ) : boolean;
var
  LClientService : sockaddr_in;
  LSocket   : TSocket ; //DWORD ;
  LWSAData  : WSAData;
//  LInteger  : string ;
  OptVal    : integer ;
begin

    Result:=False;

    // try to initiates WinSock
    FillMemory ( @LWSAData, SizeOf ( WSAData ), 0 ) ;
    if ( WinAPI.WinSock.WSAStartup($0002, LWSAData) <> WinAPI.Windows.NO_ERROR ) then
      exit;

    try

      LSocket  := WinAPI.WinSock.Socket(AF_INET, SOCK_STREAM, IPPROTO_IP);       //creates a socket

      if ( LSocket = WinAPI.WinSock.INVALID_SOCKET ) then
        exit ;

      OptVal := 500 ;
      SetSockOpt( LSocket, SOL_SOCKET, SO_SNDTIMEO,  @OptVal, SizeOf(OptVal) ) ;
      SetSockOpt( LSocket, SOL_SOCKET, SO_RCVTIMEO,  @OptVal, SizeOf(OptVal) ) ;

      LClientService.sin_family      := WinAPI.WinSock.AF_INET;            //protocol  ( IPv4 in this case )
      LClientService.sin_port        := WinAPI.WinSock.htons(APort);       //convert to TCP/IP network byte order (big-endian)
      LClientService.sin_addr.s_addr := WinAPI.WinSock.inet_addr(PAnsiChar(AIPAddress)); //convert to IN_ADDR  structure

      // try conect to a socket to especified service

      Result := WinAPI.WinSock.Connect(LSocket, LClientService, SizeOf(LClientService)) <> WinAPI.WinSock.SOCKET_ERROR ;

      // close Socket
      WinAPI.WinSock.CloseSocket( LSocket ) ;

    finally
      WinAPI.WinSock.WSACleanup;
    end;

end;

(*
function LocalIP: string;
type
   TaPInAddr = array[0..10] of PInAddr;
   PaPInAddr = ^TaPInAddr;
var
   phe: PHostEnt;
   pptr: PaPInAddr;
   Buffer: array[0..63] of PAnsiChar;
   I: Integer;
   GInitData: TWSAData;
begin
   WSAStartup($101, GInitData);
   Result := '';
   GetHostName(Buffer, SizeOf(Buffer));
   phe := GetHostByName(buffer);
   if phe = nil then Exit;
   pPtr := PaPInAddr(phe^.h_addr_list);
   I := 0;
   while pPtr^[I] <> nil do
   begin
     Result := inet_ntoa(pptr^[I]^);
     Inc(I);
   end;
   WSACleanup;
end;
*)

function IPAddrToName(IPAddr: string): string;
var
   SockAddrIn: TSockAddrIn;
   HostEnt: PHostEnt;
   WSAData: TWSAData;
begin
   WSAStartup($101, WSAData);
   SockAddrIn.sin_addr.s_addr := inet_addr(PAnsiChar(AnsiString(IPAddr)));
   HostEnt := gethostbyaddr(@SockAddrIn.sin_addr.S_addr, 4, AF_INET);
   if HostEnt <> nil then
     Result := StrPas(Hostent^.h_name)
   else
     Result := '';
end;


function GetIPFromHost(const HostName: string): string;
type
   TaPInAddr = array[0..10] of PInAddr;
   PaPInAddr = ^TaPInAddr;
var
   phe: PHostEnt;
   pptr: PaPInAddr;
   i: Integer;
   GInitData: TWSAData;
begin
   WSAStartup($101, GInitData);
   Result := '';
   phe := GetHostByName(PAnsiChar(AnsiString(HostName)));
   if phe = nil then Exit;
   pPtr := PaPInAddr(phe^.h_addr_list);
   i := 0;
   while pPtr^[i] <> nil do
   begin
     Result := String ( inet_ntoa(pptr^[i]^) ) ;
     Inc(i);
   end;
   WSACleanup;
end;

function LookupHostAddr(const AHostName: AnsiString): AnsiString ;
var
  h: PHostEnt;
  GInitData: TWSAData;
begin
  Result := '';
  WSAStartup($101, GInitData);
  if AHostName <> '' then
    begin
      if AHostName[1] in ['0'..'9'] then
        begin
          if WinAPI.WinSock.inet_addr(pansichar(AHostName)) <> Integer(WinAPI.WinSock.INADDR_NONE) then
            Result := (AHostName);
        end
      else
        begin
          h := WinAPI.WinSock.GetHostByName(pansichar(AHostName));
          if h <> nil then
            with h^ do
            Result := AnsiString(format('%d.%d.%d.%d', [ord(h_addr^[0]), ord(h_addr^[1]),
                ord(h_addr^[2]), ord(h_addr^[3])]));
        end;
    end
  else
    Result := '0.0.0.0';
  WSACleanup;
end;

procedure TesteIPPort ;
var
  DBCfg : IDatabaseCfg ;
  LIP : string ;
  LPort : integer ;
begin
   DBCfg := DatabaseCfgFactory ;
   if ( DBCfg.ServerName <> '' ) or ( DBCfg.ServerAddress <> '' ) then
    begin
       if DBCfg.ServerPort = 0 then
          LPort := 3050
       else
          LPort := DBCfg.ServerPort ;

      if DBCfg.ServerAddress <> '' then
        LIP := DBCfg.ServerAddress
      else if DBCfg.ServerName <> '' then
       begin
          LIP := String ( LookupHostAddr(  AnsiString ( DBCfg.ServerName ) ) ) ;
          if ( LIP = '' ) or  ( LIP = '0.0.0.0' ) then
           //raise Error.Create('Não foi possivel resolver o nome do servidor : ' + DBCfg.ServerName )  ;
           raise Exception.Create('Não foi possivel resolver o nome do servidor : ' + DBCfg.ServerName )  ;
       end;

      if not TCPPortIsOpen ( AnsiString ( LIP ), LPort ) then
        //raise Error.Create('Não foi possivel conectar o Servidor : ' + LIP ) ;
        raise Exception.Create('Não foi possivel conectar o Servidor : ' + LIP ) ;

    end ;
end;

{$IFDEF _DSServer}
{$ELSE}
procedure TDBSession.SQLDBBeforeConnect(Sender: TObject);
begin

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := EnterBeforeConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

   InitFirebirdConnection ;

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := ExitBeforeConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

end;

procedure TDBSession.SQLDBAfterConnect(Sender: TObject);
var
  cds : TClientDataSet ;
begin
   LoggedUserChanged( nil ) ;

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := EnterAfterConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

   InitDB ;

   SQLDB.ExecuteDirect ( 'EXECUTE PROCEDURE GETUSERS' ) ;

   cds := nil ;
   ADBSession.populateClientDataSet(cds, 'SELECT SYS$VERSION, SYS$RELEASE, SYS$REVISION FROM SYS$VERSION' );
   LoggedUser.AppVersion.Version  := cds.FieldByName('SYS$VERSION').asInteger ;
   LoggedUser.AppVersion.Release  := cds.FieldByName('SYS$RELEASE').asInteger ;
   LoggedUser.AppVersion.Revision := cds.FieldByName('SYS$REVISION').asInteger ;
   cds.free;
     //InitGridReport ;

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := ExitAfterConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

end;

{$ENDIF}




procedure TDBSession.ADBSessionInitSystemTypes(AbstractDB: ITcAbstractDB;
  ASysTypes: TCustomClientDataSet);
const
  _SQL_SYSTYPES = '"SYS$TYPE" TIPO,'
          + #13#10'"SYS$VALUE" VALOR,'
          + #13#10'"SYS$DESCRIPTION" DESCRICAO,'
          + #13#10'"SYS$ORDER" ORDEM'
          + #13#10'from "SYS$TYPES"'
          + #13#10'order by "SYS$TYPE" , "SYS$ORDER" , "SYS$VALUE"' ;
var
  cds : TClientDataSet ;
begin
  cds := nil ;
  AbstractDB.populateClientDataSet( cds, _SQL_SYSTYPES );
  TCDSSuppl.InsertAllRecordsFromDataSet( cds, ASysTypes ) ;
  cds.free;
end;

{$IFNDEF _DSServer}

procedure TDBSession.SaveGridColumns(UID, Stream: string; ADataSetID: String = '');
var
 p : TParams ;
 stm : TStringStream ;
begin

 stm := TStringStream.Create (  TStringSuppl.CompressString( Stream ) ) ;


 p := TParams.Create ;
 p.CreateParam( ftString, 'p1', ptInput ).asString := LoggedUser.UserID ;
 p.CreateParam( ftString, 'p2', ptInput ).asString := GuidStrTo20 ( StrToMD5( UID ) ) ;
 p.CreateParam( ftBlob,   'p3', ptInput ).LoadFromStream ( stm, ftBlob ) ;
 p.CreateParam( ftString, 'p4', ptInput ).asString := ADataSetID ;
 stm.free ;

 ADBSession.Execute( 'UPDATE OR INSERT INTO SYS$USERS_GRDOPTS ( KSYS$USER, KSYS$GRDUID, STREAM, DATASET_ID ) VALUES ( :p1, :p2, :p3, :p4 ) MATCHING ( KSYS$USER, KSYS$GRDUID ) ', p ) ;
 p.free ;

end;


function TDBSession.LoadGridColumns(UID: string): TGridConfig;
var
  cds : TClientDataSet ;
  p : TParams ;
begin

  cds := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'p1', ptInput ).asString := LoggedUser.UserID ;
  p.CreateParam( ftString, 'p2', ptInput ).asString := GuidStrTo20 ( StrToMD5( UID ) ) ;
  ADBSession.populateClientDataSet ( cds, 'SELECT CAST( STREAM AS BLOB ) STREAM, DATASET_ID FROM SYS$USERS_GRDOPTS WHERE KSYS$USER = :p1 and  KSYS$GRDUID = :p2', p ) ;
  p.free ;
  Result.Str_GridStream := '' ;
  Result.DataSetID := '' ;
  if not cds.IsEmpty then
   begin
     Result.Str_GridStream  := TStringSuppl.DeCompressString(  cds.fieldByName ( 'STREAM' ) .asString ) ;
     Result.DataSetID := cds.fieldByName ( 'DATASET_ID' ) .asString ;
   end;
  cds.free ;
end;

procedure TDBSession.SaveGridReport(UID, Stream: string);
var
 p : TParams ;
 stm : TStringStream ;
begin

// stm := TStringStream.Create (  TStringSuppl.CompressString( Stream ) ) ;
 stm := TStringStream.Create ( Stream ) ;

 if DebugHook <> 0 then
   begin
     ForceDirectories ( ExtractFilePath ( ParamStr(0) ) + 'Grids' ) ;
     stm.SaveToFile( ExtractFilePath ( ParamStr(0) ) + 'Grids\' + UID );
   end;
 stm.Position := 0 ;

 p := TParams.Create ;
 p.CreateParam( ftString, 'p1', ptInput ).asString := GuidStrTo20 ( StrToMD5( UID ) ) ;
 p.CreateParam( ftString, 'p2', ptInput ).asString := UID ;
 p.CreateParam( ftBlob,   'p3', ptInput ).LoadFromStream ( stm, ftBlob ) ;
 stm.free ;

 ADBSession.Execute( 'UPDATE OR INSERT INTO SYS$GRDRPT ( KSYS$GRDRPT, GRDRPTNAME, STREAM ) VALUES ( :p1, :p2, :p3 ) MATCHING ( KSYS$GRDRPT ) ', p ) ;
 p.free ;

end;


function TDBSession.LoadGridReport(UID: string): string;
var
  cds : TClientDataSet ;
  p : TParams ;
begin

  cds := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'p1', ptInput ).asString := GuidStrTo20 ( StrToMD5( UID ) ) ;
  ADBSession.populateClientDataSet ( cds, 'SELECT CAST( STREAM AS BLOB ) STREAM FROM SYS$GRDRPT WHERE KSYS$GRDRPT = :p1', p ) ;
  p.free ;
  Result := '' ;
  if not cds.IsEmpty then
     Result := cds.fieldByName ( 'STREAM' ) .asString ;
//     Result := TStringSuppl.DeCompressString(  cds.fieldByName ( 'STREAM' ) .asString ) ;
  cds.free ;
end ;


procedure TDBSession.ResetUserGrid;
begin

  EXIT ; // need review
  if ( DebugHook = 0 ) { or ( DBInitialized ) } then
     exit ;
  ADBSession.ExecuteDirect ( 'DELETE FROM SYS$USERS_GRDOPTS' ) ;
end;

procedure TDBSession.InitGridReport;
var
  grids : TTcScanFiles ;
  IterateGridsList : integer ;
  stm : TStringStream ;
begin

  if ( DebugHook = 0 ) { or ( DBInitialized ) } then
     exit ;

  grids := TTcScanFiles.Create ;
  grids.SourceFolder := ExtractFilePath ( ParamStr(0) ) + 'Grids' ;
  grids.IncludeMasks.Text := '*' ;
  grids.Scan ;
  for IterateGridsList := 0 to grids.FileList.Count - 1 do
    begin
     stm := TStringStream.Create ( '' ) ;
     stm.LoadFromfile ( grids.FileList[ IterateGridsList ].FullName ) ;
     self.SaveGridReport( grids.FileList[ IterateGridsList ].Name, stm.DataString );
     stm.Free ;
    end;
end;

{$ENDIF}

//
procedure TDBSession.Reconnect;
begin
   SQLDB.Close ;
   SQLDB.Open  ;
end;

{
procedure TDBSession.populateClientDataSet(var cds: TClientDataSet;
  const SQL: String; AParams: TParams);'

  function DDP ( DataPacket : OleVariant ): OleVariant; // DecompressDataPacket'
  begin
     Result := StringToVariantArray ( TStringSuppl.DeCompressString( VariantArrayToString( DataPacket ) ) ) ;
  end ;

var
    RequestParams : TParams ;
    sqlParam : TParam ;
begin
//    TfrmSearchProgress.ShowProgress ;

    RequestParams := TParams.Create ;

    if Assigned ( AParams ) then
       RequestParams.Assign( AParams ) ;

    sqlParam := RequestParams.FindParam( '__SQL' ) ;

    if not Assigned ( sqlParam ) then
       sqlParam := RequestParams.CreateParam( ftString, '__SQL', ptInput ) ;

    sqlParam.asString := SQL ;

    if not Assigned ( CDS ) then
       CDS := TClientDataSet.Create ( nil ) ;

    try
      CDS.Data :=
        DDP ( SrvCon.AppServer.DataRequest( TParamsSuppl.Compress ( RequestParams ) ) ) ;
    finally
      RequestParams.Free ;
    end ;

//    TfrmSearchProgress.HideProgress ;

end;
}

{$IFNDEF _DSServer}
class function TDBSession.LoggedUser: TLoggedUser;
begin
   Result := Tc.VCL.Application.TTcApplication.Instance.LoggedUser ;
end;
{$ENDIF}

procedure TDBSession.LoggedUserChanged( ASender : TTcNSMSg );
var
  LUserName : string ;
begin
  LUserName := Trim( LoggedUser.Login ) ;
  if LUserName = '' then
     LUserName := 'SYSTEM' ;
  LUserName := QuotedStr ( LUserName ) ;
  if ( SQLDB.Connected ) and ( LUserName <> FUserName ) then
    begin
     FUserName := LUserName ;
//     SQLDB.ExecuteDirect( Format ( 'EXECUTE PROCEDURE LOG$USER( %s )', [ FUserName ] ) )
    end;
end;

(*
function GetIPReal: String;
var
  LResultInfo: String;
  I: Integer;
begin
  with TIdHTTP.Create(nil) do
   try
     try
      LResultInfo := Get('http://checkip.dyndns.org');
      for I := 1 to Length(LResultInfo) do
        if (CharInSet(LResultInfo[I], ['0' .. '9', '.']) then
          Result := Result + LResultInfo[I]; 
      except
        Result := '0.0.0.0';
      end;
   finally
     Free
   end;
end;
*)

initialization
   RegisterClass ( TDBSession ) ;

end.
