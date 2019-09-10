unit UDBAnexos;

{.$D-}

interface
 uses
  WinApi.Windows, VCL.Consts, System.Classes, System.SysUtils, VCL.Controls, VCL.Forms, System.WideStrings, DBXFirebird,
  Data.SqlExpr, Tc.Data.SQLExpr, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Tc.RTL.NotificationService,
  SQLSuppl, VCL.Graphics, Tc.DBRTL.AbstractDB, Tc.DBRTL.AbstractDB.DBX,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon;

type


  TDBAnexos = class(TDataModule {, IDBResources } )
    SQLDB: TSQLConnection;
    ADBAnexos: TTcadb_DBX;
    procedure SQLDBBeforeConnect(Sender: TObject);
    procedure ADBAnexosInitSystemTypes(AbstractDB: ITcAbstractDB;
      ASysTypes: TCustomClientDataSet);
    procedure SQLDBAfterConnect(Sender: TObject);
  private
    { Private declarations }
    FUserName : string ;
    procedure InitFirebirdConnection ;
    procedure InitDB  ;
    procedure LoggedUserChanged( ASender : TTcNSMSg );
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

//  TCdsSuppl = class ( CDSSuppl.TCdsSuppl ) ;
//  TSQLSuppl = class ( SQLSuppl.TSQLSuppl ) ;

//  TObjProcedure = procedure of object;

//function BoolToChar ( Value : boolean ) : Char ;

implementation

uses
  DBXFirebirdSuppl,
  CLAG5.DatabaseIntf,
  DateUtils, System.Variants, DSIntf, Tc.RTL.StringUtils, ParamsSuppl, GuidSuppl, Tc.RTL.MD5 ,
  Data.SQLTimSt,
  Tc.RTL.Files.Scan, Tc.VCL.Graphics  , UDBAnexos.Update,
  CDSSuppl,
  Tc.VCL.Application,
  CL.Ag5.NSMsgs ;

{$R *.DFM}


function BoolToChar ( Value : boolean ) : Char ;
begin
  Result := 'F' ;
  if Value then
     Result := 'T' ;
end ;

constructor TDBAnexos.Create(AOwner: TComponent);
begin
  inherited;
  TTcNSMsgLoggedUserChanged.Subscribe ( LoggedUserChanged );
  SQLDB.Open
end;

destructor TDBAnexos.Destroy;
begin
  inherited;
end;

procedure TDBAnexos.InitFirebirdConnection ;
begin
   with SQLDB,Params do
     begin
       DriverName := 'Firebird250' ;
       TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
       Values[ 'Database'      ] := DatabaseCfgFactory.Path [ dbAttachments ]  ;
     end ;
end ;

procedure TDBAnexos.LoggedUserChanged( ASender : TTcNSMSg );
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


procedure TDBAnexos.InitDB  ;
begin
   TDBAnexosUpdate.Execute( ADBAnexos );
end ;

{$IFDEF _DSServer}
{$ELSE}

procedure TDBAnexos.SQLDBBeforeConnect(Sender: TObject);
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

procedure TDBAnexos.SQLDBAfterConnect(Sender: TObject);
begin
   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := EnterAfterConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

   InitDB ;

   LoggedUserChanged ( nil );

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := ExitAfterConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;
end;

{$ENDIF}


procedure TDBAnexos.ADBAnexosInitSystemTypes(AbstractDB: ITcAbstractDB;
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



initialization
   RegisterClass ( TDBAnexos ) ;

end.


