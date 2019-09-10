unit ClAg5.Common.Journaling;

interface

uses Tc.DBRTL.AbstractDB ;

type

  TJournaling = class
  public
    class procedure InitJournaling ( AbstractDB : ITcAbstractDB ) ;
  end;

implementation

uses System.SysUtils, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
     FBXMLJournalingSuppl,
     Tc.RTL.Exceptions ;

{ TJournaling }

class procedure TJournaling.InitJournaling ( AbstractDB : ITcAbstractDB ) ;
const
  _SELECT_ACTIVE_JNL_TABLES =
   'SELECT SYS$TABLENAME, JNL$ FROM SYS$TABLES' ;

 // _SELECT_INACTIVE_JNL_TABLES =
 //   'SELECT SYS$TABLENAME, JNL$ FROM SYS$TABLES' ;

  _CDS_FIELDS =
     'SELECT RFR.RDB$FIELD_NAME FIELDNAME, DMNS.RDB$FIELD_TYPE FIELDTYPE, S.RDB$FIELD_POSITION ISPK'
    + #13#10'FROM RDB$RELATION_FIELDS RFR'
    + #13#10'LEFT JOIN RDB$FIELDS DMNS ON  RFR.RDB$FIELD_SOURCE = DMNS.RDB$FIELD_NAME'
    + #13#10'LEFT JOIN RDB$RELATION_CONSTRAINTS C ON C.RDB$RELATION_NAME = RFR.RDB$RELATION_NAME AND C.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'''
    + #13#10'LEFT JOIN RDB$INDEX_SEGMENTS S ON S.RDB$INDEX_NAME = C.RDB$INDEX_NAME AND S.RDB$FIELD_NAME = RFR.RDB$FIELD_NAME'
    + #13#10'WHERE'
    + #13#10' RFR.RDB$RELATION_NAME = ''%s'' AND DMNS.RDB$COMPUTED_BLR IS NULL'
    + #13#10'ORDER BY RFR.RDB$FIELD_POSITION' ;

 _ACCERT_BEFORE =
            'EXECUTE BLOCK'
    + #13#10'AS'
    + #13#10'declare TRIGGER_NAME varchar ( 31 ) ;'
    + #13#10'declare TRIGGER_POSITION integer ;'
    + #13#10'declare BEFORE_BASE_POSITION integer = 1000 ;'
    + #13#10'BEGIN'
    + #13#10' FOR SELECT'
    + #13#10'  TRIM ( RDB$TRIGGER_NAME ), RDB$TRIGGER_SEQUENCE'
    + #13#10' FROM RDB$TRIGGERS'
    + #13#10' WHERE'
    + #13#10'     RDB$SYSTEM_FLAG = 0'
    + #13#10'     AND RDB$TRIGGER_TYPE < 8192'
    + #13#10'     AND BIN_AND ( RDB$TRIGGER_TYPE + 1, 1 ) = 0 /* 0 = before, 1 = after */'
    + #13#10'     AND RDB$TRIGGER_SEQUENCE < :BEFORE_BASE_POSITION'
    + #13#10' INTO TRIGGER_NAME, TRIGGER_POSITION'
    + #13#10' DO'
    + #13#10' EXECUTE STATEMENT ''ALTER TRIGGER '' || TRIGGER_NAME || '' POSITION '' || ((TRIGGER_POSITION-TRUNC(TRIGGER_POSITION/1000)*1000) + BEFORE_BASE_POSITION) ;'
    + #13#10'END ;' ;

 _ACCERT_AFTER =
            'EXECUTE BLOCK'
    + #13#10'AS'
    + #13#10'declare TRIGGER_NAME varchar ( 31 ) ;'
    + #13#10'declare TRIGGER_POSITION integer ;'
    + #13#10'declare AFTER_BASE_POSITION integer = 20000 ;'
    + #13#10'BEGIN'
    + #13#10' FOR SELECT'
    + #13#10'  TRIM ( RDB$TRIGGER_NAME ), RDB$TRIGGER_SEQUENCE'
    + #13#10' FROM RDB$TRIGGERS'
    + #13#10' WHERE'
    + #13#10'     RDB$SYSTEM_FLAG = 0'
    + #13#10'     AND RDB$TRIGGER_TYPE < 8192'
    + #13#10'     AND BIN_AND ( RDB$TRIGGER_TYPE + 1, 1 ) = 1 /* 0 = before, 1 = after */'
    + #13#10'     AND RDB$TRIGGER_SEQUENCE < :AFTER_BASE_POSITION'
    + #13#10'     AND RDB$TRIGGER_NAME NOT STARTING WITH ''JNL$'''
    + #13#10' INTO TRIGGER_NAME, TRIGGER_POSITION'
    + #13#10' DO'
    + #13#10' EXECUTE STATEMENT ''ALTER TRIGGER '' || TRIGGER_NAME || '' POSITION '' || ((TRIGGER_POSITION-TRUNC(TRIGGER_POSITION/1000)*1000) + AFTER_BASE_POSITION) ;'
    + #13#10'END ;'  ;


var
  cds : TClientDataSet ;

 procedure CreateJNL ( ATableName : string ) ;
 var
  cdsFields  : TClientDataSet ;
  stmt : string ;
 begin
   with TJNLTriggers.Create do
     try
      TableName := Trim ( ATableName ) ;
      cdsFields  := nil ;
      AbstractDB.populateClientDataSet ( cdsFields, format ( _CDS_FIELDS, [ Trim ( ATableName ) ] ) ) ;
      with cdsFields do
        while not eof do
          begin
  //          if fieldByName ( 'FIELDNAME' ).asString <> 'LOGO' then
               AddField ( Trim ( fieldByName ( 'FIELDNAME' ).asString ),
                          not fieldByName ( 'ISPK' ).IsNull,
                          fieldByName ( 'FIELDTYPE' ).asInteger  )  ;
            Next ;
          end;
        freeAndNil ( cdsFields ) ;
        try
           stmt := CreateTrigger ;
           AbstractDB.ExecuteDirect ( stmt ) ;
        except On E : Exception do
          RaiseException( E, UnitName, ClassName, 'CreateJournaling',  TableName + #13#10 + stmt );
        end;
     finally
        Free
     end;
 end;

begin
  cds := nil ;
  AbstractDB.populateClientDataSet( cds, _SELECT_ACTIVE_JNL_TABLES );
  with cds do
    try
        while not eof do
           begin
             if FieldByName ( 'JNL$' ).asBoolean then
                CreateJNL ( FieldByName ( 'SYS$TABLENAME' ).asString ) ;
             next ;
           end;
    finally
      cds.Free ;
    end ;

  AbstractDB.ExecuteDirect (  _ACCERT_BEFORE ) ;
  AbstractDB.ExecuteDirect (  _ACCERT_AFTER  ) ;
end;

end.
