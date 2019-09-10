unit UDBZootecnico;

{ DONE 5 -oCaique -cInfra-Extrutura do Sistema : - Problemas conexão FB Embedded }

{.$D-}

// 192.168.100.102/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\ControleLeiteiro4

interface

 uses
    System.Classes
  , System.SysUtils
  , DBXFirebird
  , Data.SqlExpr
  , Tc.Data.SQLExpr
  , Data.DB
  , Tc.Data.DB.Helpers
  , DataSnap.DBClient
  , Tc.DataSnap.DBClient.Helpers
  , Tc.RTL.NotificationService
  , CDSSuppl
  , Tc.DBRTL.AbstractDB
  , Tc.DBRTL.AbstractDB.DBX
  , Data.DBXDataSnap
  , IPPeerClient
  , Data.DBXCommon
  , IniFiles ;

type


  TDBZootecnico = class(TDatamodule {, IDBResources } )
    ADBZootecnico: TTcadb_DBX;
    SQLDB: TSQLConnection;
    procedure SQLDBBeforeConnect(Sender: TObject);
    procedure SQLDBAfterConnect(Sender: TObject);
    procedure ADBZootecnicoInitSystemTypes(AbstractDB: ITcAbstractDB;
      ASysTypes: TCustomClientDataSet);
  private
    { Private declarations }
    FAppServerAddress : String;
    FUserName : string ;
    procedure InitFirebirdConnection ;
    procedure InitDB  ;
    procedure LoggedUserChanged( ASender : TTcNSMSg );

  public
    { Public declarations }
    property  AppServerAddress : String read FAppServerAddress ;
    Constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

  TObjProcedure = procedure of object;

function TryVarToFloat ( Value : Variant ) : double ;

function BoolToChar ( Value : boolean ) : Char ;
function BooleanFieldToText ( Field : TField ) : string ;
function PercentToFloat ( Percent : double ) : double ;
function FloatToPercent ( Valor : double ) : double ;
function PercentToStr ( Percent : double ; AddSymbol : boolean = True ) : string ;
function PercentStrToFloat ( PercentStr : String ) : double ;
function FloatToPercentStr ( Valor : double ; AddSymbol : boolean = True ) : string ;

implementation

uses
  DBXFirebirdSuppl,
  CLAG5.DatabaseIntf,
  DateUtils, System.Variants, DSIntf, Tc.RTL.StringUtils, ParamsSuppl, GuidSuppl, Tc.RTL.MD5 ,
//  CLAg5Types,
  Data.SQLTimSt,
//  Tc.RTL.Files.Scan,
//  Tc.VCL.Graphics  ,
  UDBZootecnico.Update,
  Tc.VCL.Application,
  CL.Ag5.NSMsgs ;

{$R *.DFM}


//function  SQLDB : TSQLConnection ;
//begin
//    result := DBZootecnico.SQLDB ;
//end ;

function TryVarToFloat( Value : Variant ): double ;
begin
    if VarIsFloat( Value ) then
       Result := Value
    else
       Result := 0 ;
end;




function BoolToChar ( Value : boolean ) : Char ;
begin
  Result := 'F' ;
  if Value then
     Result := 'T' ;
end ;

function BooleanFieldToText ( Field : TField ) : string ;
begin
  if ( not Field.DataSet.Active ) or ( Field.DataSet.isEmpty ) then
     exit ;

  if Field.asBoolean then
     Result := 'Sim'
  else
     Result := 'Não'
end ;



constructor TDBZootecnico.Create(AOwner: TComponent);
begin

  inherited;
  SQLDB.Connected := False;//*****----- Estava com erro ao criar este datamodule na unit UExportAgenda5AvancadoDatamodule
  TTcNSMsgLoggedUserChanged.Subscribe ( LoggedUserChanged );
end;


destructor TDBZootecnico.Destroy;
begin

  inherited;
end;

procedure TDBZootecnico.InitFirebirdConnection ;
begin
   // 'TC-NBDV71/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\Client\CL-%s\DB\CLAG5.%s.ZOO'
   with SQLDB,Params do
     begin
       DriverName := 'Firebird250' ;
       TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
       Values[ 'Database'      ] := DatabaseCfgFactory.Path[ dbZootecnico ] ;
     end ;
end ;

procedure TDBZootecnico.LoggedUserChanged( ASender : TTcNSMSg );
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


procedure TDBZootecnico.InitDB  ;
begin
  TDBZootecnicoUpdate.Execute ( ADBZootecnico );
end ;



{$IFDEF _DSServer}
{$ELSE}
procedure TDBZootecnico.SQLDBBeforeConnect(Sender: TObject);
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

procedure TDBZootecnico.SQLDBAfterConnect(Sender: TObject);
begin
   LoggedUserChanged (nil);

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := EnterAfterConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

   InitDB;

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := ExitAfterConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

end;
{$ENDIF}

procedure TDBZootecnico.ADBZootecnicoInitSystemTypes(AbstractDB: ITcAbstractDB;
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

function PercentToFloat ( Percent : double ) : double ;
begin
   Result := StrToFloat ( format ( '%.5f', [ Percent ] ) ) + 1 ;
end ;

function PercentStrToFloat ( PercentStr : String ) : double ;
begin
   Result := ( StrToFloat ( format ( '%.5f', [ StrToFloat ( PercentStr ) ] ) ) / 100 ) + 1 ;
end ;


function FloatToPercent ( Valor : double ) : double ;
begin
  Result := ( Valor - 1 ) ;
end ;

function PercentToStr ( Percent : double ; AddSymbol : boolean = True ) : string ;
var
  Symbol : string ;
begin
  if AddSymbol then
     Symbol := '%' ;

  Result :=  Format ( '%.4f%s', [ Percent * 100, Symbol ] ) ;
end ;


function FloatToPercentStr ( Valor : double ; AddSymbol : boolean = True ) : string ;
begin

  Result := PercentToStr ( ( Valor - 1 ), AddSymbol ) ;
end ;

initialization
   RegisterClass ( TDBZootecnico ) ;

end.


