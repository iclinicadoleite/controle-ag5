unit UDBEntidades;

{ DONE 5 -oCaique -cInfra-Extrutura do Sistema : - Problemas conexão FB Embedded }

{.$D-}

// 192.168.100.102/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\ControleLeiteiro4

interface

uses
  WinApi.Windows,
  VCL.Consts,
  System.Classes,
  System.SysUtils,
  System.WideStrings, DBXFirebird, Data.SqlExpr, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Tc.VCL.Application,
  Tc.RTL.NotificationService,
  CDSSuppl, SQLSuppl,
  VCL.Graphics, Tc.DBRTL.AbstractDB, Tc.DBRTL.AbstractDB.DBX,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon,
  CL.Ag5.NSMsgs ;

type


//  TDBEntidades = class(T_DBResources, IDBResources )
  TDBEntidades = class(TDatamodule { , IDBResources } )
    SQLDB: TSQLConnection;
    ADBEntidades: TTcadb_DBX;
    procedure SQLDBBeforeConnect(Sender: TObject);
    procedure SQLDBAfterConnect(Sender: TObject);
    procedure ADBEntidadesInitSystemTypes(AbstractDB: ITcAbstractDB;
      ASysTypes: TCustomClientDataSet);
  private
    { Private declarations }
    FUserName : string ;
    procedure InitFirebirdConnection ;
    procedure InitDB  ;
    procedure LoggedUserChanged( ASender : TTcNSMSg );
    {$IFNDEF _DSServer}
    procedure ImageFazendaChanged ( Sender : TCLAg5NSMsg ) ;
    {$ENDIF}
  public
    class function LoggedUser: TLoggedUser;

    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

  TCdsSuppl = class ( CDSSuppl.TCdsSuppl ) ;
  TSQLSuppl = class ( SQLSuppl.TSQLSuppl ) ;

  TObjProcedure = procedure of object;

function BoolToChar ( Value : boolean ) : Char ;

implementation

uses
  DBXFirebirdSuppl,
  CLAG5.DatabaseIntf,
  DateUtils, System.Variants, DSIntf, Tc.RTL.StringUtils, ParamsSuppl, GuidSuppl, Tc.RTL.MD5 ,
//  CLAg5Types,
  Data.SQLTimSt,
  Tc.RTL.Files.Scan, Tc.VCL.Graphics,
  UDBEntidades.Update;

{$R *.DFM}



function BoolToChar ( Value : boolean ) : Char ;
begin
  Result := 'F' ;
  if Value then
     Result := 'T' ;
end ;


constructor TDBEntidades.Create(AOwner: TComponent);
begin
  inherited;
  TTcNSMsgLoggedUserChanged.Subscribe ( LoggedUserChanged );
 {$IFNDEF _DSServer}
  TCLAg5NSMsgSysDomainImageChanged.Subscribe( ImageFazendaChanged  );
  SQLDB.Open ;
 {$ENDIF}
end;


destructor TDBEntidades.Destroy;
begin
  {$IFNDEF _DSServer}
  TCLAg5NSMsgSysDomainImageChanged.UnSubscribe( ImageFazendaChanged  );
  {$ENDIF}
  inherited;
end;


{$IFNDEF _DSServer}
procedure TDBEntidades.ImageFazendaChanged ( Sender : TCLAg5NSMsg ) ;
var
  p : TParams ;
  cds : TClientDataSet ;
  s : TMemoryStream ;

  Result : TGraphic ;
begin

  if Assigned ( LoggedUser.DomainImage ) then
    begin
     LoggedUser.DomainImage.Free ;
     LoggedUser.DomainImage := nil ;
    end;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).AsString := LoggedUser.DomainID ;
  cds := nil ;
  ADBEntidades.populateClientDataSet(
     cds, 'SELECT LOGO FROM CAD_FAZENDAS WHERE KCAD_FAZENDA = :KCAD_FAZENDA', p  ) ;

  if not cds.FieldByName( 'LOGO' ).IsNull then
    begin
      s := TMemoryStream.Create ;
      TBlobField ( cds.FieldByName( 'LOGO' ) ).SaveToStream( s ) ;
      s.Position := 0 ;
      LoggedUser.DomainImage := TGraphicSuppl.GetGraphic( s );
      s.free ;
    end;

  p.free ;
  cds.free ;

  TCLAg5NSMsgSysDomainImageRefresh.CreateAndDispatch( self ) ;

end;
{$ENDIF}


procedure TDBEntidades.InitFirebirdConnection ;
begin
   // 'TC-NBDV71/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\Client\CL-%s\DB\CLAG5.%s.ENT'
   with SQLDB,Params do
     begin
       DriverName := 'Firebird250' ;
       TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
       Values[ 'Database'      ] := DatabaseCfgFactory.Path[dbEntidades] ;
     end ;

end ;


procedure TDBEntidades.InitDB  ;
begin
   TDBEntidadesUpdate.Execute( ADBEntidades );
end ;

{$IFDEF _DSServer}
{$ELSE}

procedure TDBEntidades.SQLDBBeforeConnect(Sender: TObject);
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

procedure TDBEntidades.SQLDBAfterConnect(Sender: TObject);
begin

   LoggedUserChanged(nil);
try
   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := EnterAfterConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

   InitDB ;

   self.ImageFazendaChanged( nil );

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := ExitAfterConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;
except On E : Exception do
   raise Exception.Create('TDBEntidades.SQLDBAfterConnect:' + E.Message );
end;
end ;
{$ENDIF}


procedure TDBEntidades.ADBEntidadesInitSystemTypes(AbstractDB: ITcAbstractDB;
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
//  AbstractDB.populateClientDataSet( cds, _SQL_SYSTYPES );
  Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias('SESSION').populateClientDataSet( cds, _SQL_SYSTYPES );
  TCDSSuppl.InsertAllRecordsFromDataSet( cds, ASysTypes ) ;
  cds.free;
end;

class function TDBEntidades.LoggedUser: TLoggedUser;
begin
   Result := Tc.VCL.Application.TTcApplication.Instance.LoggedUser ;
end;

procedure TDBEntidades.LoggedUserChanged( ASender : TTcNSMSg );
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
     SQLDB.ExecuteDirect( Format ( 'EXECUTE PROCEDURE LOG$USER( %s )', [ FUserName ] ) )
    end;
end;

initialization
   RegisterClass ( TDBEntidades ) ;

end.


