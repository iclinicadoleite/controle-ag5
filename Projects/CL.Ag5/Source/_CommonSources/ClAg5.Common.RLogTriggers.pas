unit ClAg5.Common.RLogTriggers;

interface

uses Tc.DBRTL.AbstractDB ;

type
  TRLogTriggers = class
  private
    FAbstractDB : ITcAbstractDB ;
    procedure IterateTables ;
    procedure CheckLogFields(ATableName: string);
    procedure CheckComentsOrderFields(ATableName: string);
  public
    class procedure InitRLogTriggers ( AAbstractDB : ITcAbstractDB ) ;
  end;

implementation

uses System.SysUtils, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, DBXCommon ;
//     Tc.RTL.Exceptions ;

{ TRLogTriggers }

class procedure TRLogTriggers.InitRLogTriggers(AAbstractDB: ITcAbstractDB);
begin
   with Create do
     try
       FAbstractDB := AAbstractDB ;
       IterateTables ;
     finally
       Free ;
     end;
end;

procedure TRLogTriggers.IterateTables ;
const
 GET_TABLES_LOGFIELDS =
          'R.RDB$RELATION_NAME TABLENAME'
  + #13#10'FROM RDB$RELATIONS R'
  + #13#10'INNER JOIN SYS$TABLES ST ON ( ST.SYS$TABLENAME = R.RDB$RELATION_NAME )'
  + #13#10'LEFT JOIN RDB$RELATION_FIELDS RF'
  + #13#10' ON ( RF.RDB$RELATION_NAME = R.RDB$RELATION_NAME ) AND ( RF.RDB$FIELD_NAME = ''SYS$UI'' )'
  + #13#10'WHERE ST.RLOG$ = ''T''' ;

  GET_TABLES_WITHOUT_LOGFIELDS = GET_TABLES_LOGFIELDS + #13#10'AND RF.RDB$FIELD_NAME IS NULL' ;
  GET_TABLES_WITH_LOGFIELDS    = GET_TABLES_LOGFIELDS + #13#10'AND RF.RDB$FIELD_NAME IS NOT NULL' ;

  CREATE_LOG_SP =
          'CREATE OR ALTER PROCEDURE LOG$USER ( pUSERNAME SYS$USERLOGIN )'
  + #13#10'AS'
  + #13#10'BEGIN'
  + #13#10' RDB$SET_CONTEXT(''USER_SESSION'', ''USERNAME'', pUSERNAME );'
  + #13#10'END' ;

var
  cds : TClientDataSet ;
  FSourceTransaction  : TDBXTransaction ;
begin

  //System.DebugHook is 0 when an application operates outside the IDE debugger.
  //System.DebugHook is 1 when an application operates inside the IDE debugger.
  if ( DebugHook = 0 ) then
     exit ;

  FSourceTransaction := TSQLConnection ( FAbstractDB.Connection ).BeginTransaction ( TDBXIsolations.RepeatableRead ) ;

//  ShowMessage ( TJNLTriggers.DDLSysObjects ) ;

  try
    FAbstractDB.ExecuteDirect ( CREATE_LOG_SP ) ;
  except
   on e : Exception do  Raise ;//ShowMessage ( E.Message ) ;
  end;

  cds := nil ;
  FAbstractDB.populateClientDataSet ( cds, GET_TABLES_WITHOUT_LOGFIELDS ) ;
  with cds do
    while not eof do
      begin
         CheckLogFields( cds.FieldByName ( 'TABLENAME' ).asString );
         next ;
      end;

//    try
//      FAbstractDB.ExecuteDirect ( 'execute procedure sys$updatetables' ) ;
//    except
//     on e : Exception do ShowMessage ( E.Message ) ;                                                                       //
//    end;

  FreeAndNil ( cds )  ;

  FAbstractDB.populateClientDataSet ( cds, GET_TABLES_WITH_LOGFIELDS ) ;
  with cds do
    while not eof do
      begin
       try
         CheckComentsOrderFields ( cds.FieldByName ( 'TABLENAME' ).asString ) ;
       except
        on e : Exception do
           //ShowMessage ( E.Message ) ;
           Raise;
       end;
       next ;
      end;

  cds.Free ;

  TSQLConnection ( FAbstractDB.Connection ).CommitFreeAndNil ( FSourceTransaction ) ;

end;


procedure TRLogTriggers.CheckLogFields(ATableName: string);
const

  ALTER_TABLE_ADD_LOGFIELDS =
    'ALTER TABLE %s ADD SYS$UI SYS$USERLOGIN, ADD SYS$DI SYS$DATE, ADD SYS$UU SYS$USERLOGIN, ADD SYS$DU SYS$DATE' ;

  ALTER_TABLE_DROP_TRIGGER = 'DROP TRIGGER LOG$R_%s' ;


begin
    try
      FAbstractDB.ExecuteDirect ( Format ( ALTER_TABLE_ADD_LOGFIELDS, [ ATableName ] ) ) ;
    except
//     on e : Exception do ShowMessage ( E.Message ) ;
    end;

    try
      FAbstractDB.ExecuteDirect ( Format ( ALTER_TABLE_DROP_TRIGGER , [ ATableName ] ) ) ;
    except
//     on e : Exception do ShowMessage ( E.Message ) ;
    end;

end;

procedure TRLogTriggers.CheckComentsOrderFields(ATableName: string);
const

  ALTER_TABLE_CHANGE_ORDER =
    'ALTER TABLE %s ALTER SYS$UI POSITION 1000, ALTER SYS$DI POSITION 1001, ALTER SYS$UU  POSITION 1002, ALTER SYS$DU POSITION 1003' ;
  ALTER_TABLE_SET_COMMENT1 =
    'COMMENT ON COLUMN %s.SYS$UI IS ''Usuário responsável pela inclusão''' ;
  ALTER_TABLE_SET_COMMENT2 =
    'COMMENT ON COLUMN %s.SYS$DI IS ''Data da Inclusão''' ;
  ALTER_TABLE_SET_COMMENT3 =
    'COMMENT ON COLUMN %s.SYS$UU IS ''Usuário responsável pela última alteração''' ;
  ALTER_TABLE_SET_COMMENT4 =
    'COMMENT ON COLUMN %s.SYS$DU IS ''Data da última alteração''' ;

  TRIGGER_DECL =
          'CREATE OR ALTER TRIGGER RLOG$%1:s FOR %0:s'
  + #13#10'ACTIVE BEFORE INSERT or UPDATE POSITION 15000'
  + #13#10'AS'
  + #13#10'BEGIN'
  + #13#10''
  + #13#10'  if ( (RDB$GET_CONTEXT( ''USER_SESSION'',     ''RLOG$OFF'' ) = ''1'')'
  + #13#10'    OR (RDB$GET_CONTEXT( ''USER_TRANSACTION'', ''RLOG$OFF'' ) = ''1'') ) THEN'
  + #13#10'     EXIT ;'
  + #13#10''
  + #13#10'  if ( inserting ) then'
  + #13#10'  begin'
  + #13#10'    if ( NEW.SYS$UI is NULL ) then'
  + #13#10'      NEW.SYS$UI = RDB$GET_CONTEXT ( ''USER_SESSION'', ''USERNAME'' ) ;'
  + #13#10'    if ( NEW.SYS$DI is NULL ) then'
  + #13#10'      NEW.SYS$DI = CURRENT_TIMESTAMP ;'
  + #13#10'  end'
  + #13#10''
  + #13#10'  if ( updating ) then'
  + #13#10'  begin'
  + #13#10'     NEW.SYS$UU = RDB$GET_CONTEXT ( ''USER_SESSION'', ''USERNAME'' ) ;'
  + #13#10'     NEW.SYS$DU = CURRENT_TIMESTAMP ;'
  + #13#10'  end'
  + #13#10''
  + #13#10'END' ;

  procedure Execute ( AStmt : string  ) ;
  var
    internalStmt : string ;
  begin
    try
      internalStmt := Format ( AStmt, [ ATableName, Copy ( ATableName, 1, 30 -4 ) ] ) ;
      FAbstractDB.ExecuteDirect ( internalStmt ) ;
    except on e : exception do
      //RaiseException( E, UnitName, ClassName,  'CheckComentsOrderFields', internalStmt )
        raise Exception.Create('CheckComentsOrderFields');
    end;
  end;

begin
  Execute ( ALTER_TABLE_CHANGE_ORDER  ) ;
  Execute ( ALTER_TABLE_SET_COMMENT1  ) ;
  Execute ( ALTER_TABLE_SET_COMMENT2  ) ;
  Execute ( ALTER_TABLE_SET_COMMENT3  ) ;
  Execute ( ALTER_TABLE_SET_COMMENT4  ) ;
  Execute ( TRIGGER_DECL ) ;

end;


end.
