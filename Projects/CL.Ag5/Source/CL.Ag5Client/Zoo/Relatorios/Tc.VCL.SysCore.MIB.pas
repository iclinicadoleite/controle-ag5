unit Tc.VCL.SysCore.MIB;

interface

uses System.Classes, System.SysUtils, Data.DB, Tc.Data.DB.Helpers, Generics.Collections ;

type

  TVRptTableType =  (ttTable,ttExpression) ;
  TVRptTableRelationType =  (trPivot,trCross,trLeftJoin,trRigthJoin,trInnerJoin) ;
//  TVRptTables =  TList<TVRptTable> ;

  TVRptTable  =  class
    FTable         : String ;
    FTableType         : TVRptTableType ;
    FTableRelationType : TVRptTableRelationType ;
    FJoinCondition     : String ;
    FWhereCondition    : String ;
    FRequiredAliases   : String ;
  public
    constructor Create ( ATableType : TVRptTableType ; ATable : String ; ATableRelationType  : TVRptTableRelationType ; AJoinCondition  : String ; AWhereCondition  : String ; ARequiredAliases  : String  ) ;
    Destructor Destroy ; override ;
    property TableType         : TVRptTableType          read FTableType         write FTableType      ;
    property TableName         : String                  read FTable         write FTable      ;
    property TableRelationType : TVRptTableRelationType  read FTableRelationType write FTableRelationType ;
    property JoinCondition     : String                  read FJoinCondition     write FJoinCondition  ;
    property WhereCondition    : String                  read FWhereCondition    write FWhereCondition ;
    property RequiredAliases   : String                  read FRequiredAliases     write FRequiredAliases ;
  end ;

  TVRptTables =  TObjectDictionary<string, TVRptTable> ;

  TVRptOperators = ( opNone, opGreaterThen, opLessThen, opEqual, opGreaterEqualThen, opLessEqualThen, opDiferent, opBetween, opStarting, opContain, opLogical, opIsEmpty ) ;
  TVRptOperatorsSet = set of TVRptOperators ;

  TVRptColumnType = ( ctField, ctExpression ) ;
  TVRptDataTypes = ( dtString, dtInteger, dtFloat, dtDate, dtBoolean, dtListValueString ) ;

  TTcMiBIColumn = class
  private
    FInternalFormatSettings : TFormatSettings ;
    FID: String;
    FWHEREGROUP: SmallInt ;
    FCOLUMNORDER: SmallInt ;
    FTABLEALIAS: String;
    FCOLUMN: String;
    FCOLUMNTYPE: TVRptColumnType;
    FCOLUMNDATATYPE: TVRptDataTypes ;
    FCOLUMNTITLE: String;
    FVISIBLE: boolean ;
    FOperatorType : TVRptOperators ;
    FOperatorNot : boolean ;
    FPARAM1: String;
    FPARAM2: String;
    procedure SetCOLUMN(const Value: String);
    procedure SetCOLUMNDATATYPE(const Value: TVRptDataTypes);
    procedure SetCOLUMNORDER(const Value: SmallInt);
    procedure SetCOLUMNTITLE(const Value: String);
    procedure SetCOLUMNTYPE(const Value: TVRptColumnType);
    procedure SetID(const Value: String);
    procedure SetOperatorNot(const Value: boolean);
    procedure SetOperatorType(const Value: TVRptOperators);
    procedure SetPARAM1(const Value: String);
    procedure SetPARAM2(const Value: String);
    procedure SetTABLEALIAS(const Value: String);
    procedure SetVISIBLE(const Value: boolean);
    procedure SetWHEREGROUP(const Value: SmallInt);
  public
    property ID: String read FID write SetID;
    property WHEREGROUP: SmallInt  read FWHEREGROUP write SetWHEREGROUP;
    property COLUMNORDER: SmallInt  read FCOLUMNORDER write SetCOLUMNORDER;
    property TABLEALIAS: String read FTABLEALIAS write SetTABLEALIAS;
    property COLUMN: String read FCOLUMN write SetCOLUMN;
    property COLUMNTYPE: TVRptColumnType read FCOLUMNTYPE write SetCOLUMNTYPE;
    property COLUMNDATATYPE: TVRptDataTypes  read FCOLUMNDATATYPE write SetCOLUMNDATATYPE;
    property COLUMNTITLE: String read FCOLUMNTITLE write SetCOLUMNTITLE;
    property VISIBLE: boolean  read FVISIBLE write SetVISIBLE;
    property OperatorType : TVRptOperators   read FOperatorType write SetOperatorType;
    property OperatorNot : boolean  read FOperatorNot write SetOperatorNot;
    property PARAM1: String read FPARAM1 write SetPARAM1;
    property PARAM2: String read FPARAM2 write SetPARAM2;
    procedure MakeParam( AParams : TParams ; AParamName : string ; AParam : integer ) ;
    Constructor Create ;
    Destructor Destroy ; override ;
  end;

  TTcMiBIColumns = TObjectList<TTcMiBIColumn> ;

  TOnGetWhere = procedure ( Sender : TObject ; AUsedTableAlias : TStrings ; var AWhere : string ; AParams : TParams ) of object ;

  TTcMiBI =  class
    FPivotTable      : string ;
    FPivotTableAlias : string  ;
    FPivotTableType  : TVRptTableType ;
    FTables     : TVRptTables ;
    FSQLParams  : TParams ;
    FColumns    : TTcMiBIColumns ;
  private
    FOnGetWhere: TOnGetWhere;
    procedure SetOnGetWhere(const Value: TOnGetWhere);
  published
  public
     function SQLStmt : string ;
     procedure AddTable(AAlias : string ; ATable: TVRptTable);
     property  Tables   : TVRptTables read FTables ;
     procedure  ClearColumns ;
     procedure AddColumn ( AColumn : TTcMiBIColumn ) ;
     property  SQLParams  : TParams read FSQLParams ;
     property  OnGetWhere : TOnGetWhere  read FOnGetWhere write SetOnGetWhere;
     Constructor Create ;
     Destructor Destroy ; override ;
  end;



const

  AllowedOperators : array [ TVRptDataTypes ] of TVRptOperatorsSet =
     ( [opEqual, opDiferent, opStarting, opContain , opIsEmpty ],                                                     // dtString
       [opGreaterThen, opLessThen, opEqual, opGreaterEqualThen, opLessEqualThen, opDiferent, opBetween , opIsEmpty ], // dtInteger
       [opGreaterThen, opLessThen, opEqual, opGreaterEqualThen, opLessEqualThen, opDiferent, opBetween , opIsEmpty ], // dtFloat
       [opGreaterThen, opLessThen, opEqual, opGreaterEqualThen, opLessEqualThen, opBetween, opIsEmpty ],              // dtDate
       [opLogical, opIsEmpty ],                                                                                       // dtBoolean
       [opEqual, opIsEmpty]                                                                                           // dtListValueString                    // dtListValueString
        ) ;


  StrOperators : Array[ TVRptOperators ] of string =
    ( '<não filtrar>', '>', '<', '=', '>=',  '<=', '<>', 'entre', 'começando por','contendo', '<sim/não>', '<em branco>' )  ;

  StrSQLOperators : Array[ TVRptOperators ] of string =
//    ( '', '%s > %StrSQLOperatorss', '%s < %s', '%s = %s', '%s >= %s',  '%s <= %s ', '%s <> %s', '%s between %s and %s', '%s starting with %s ', '%s' )  ;
    ( '', '%s > %s', '%s < %s', '%s = %s', '%s >= %s',  '%s <= %s ', '%s <> %s', '(%0:s >= %1:s and %0:s <= %2:s)', 'UPPER ( %s ) starting with UPPER ( %s ) ', 'UPPER ( %s ) LIKE ''%%'' || UPPER ( %s ) || ''%%''', '%s = %s', '%s IS NULL' )  ;

  StrVRptRelationTableType : array [ TVRptTableRelationType ] of string = (
    'PIVOT',
    'CROSS',
    'LEFT  JOIN',
    'RIGHT JOIN',
    'INNER JOIN' ) ;

  StrVRptRelationTableTypeFmt : array [ TVRptTableRelationType, TVRptTableType ] of string = (
    ( 'FROM %s %s'              , 'FROM (%s) %s'               ),
    ( ', %s %s'                 , ', (%s) %s'                  ),
    ( 'LEFT  JOIN %s %s ON (%s)', 'LEFT  JOIN (%s) %s ON (%s)' ),
    ( 'RIGHT JOIN %s %s ON (%s)', 'RIGHT JOIN (%s) %s ON (%s)' ),
    ( 'INNER JOIN %s %s ON (%s)', 'INNER JOIN (%s) %s ON (%s)' )
  ) ;


implementation

Uses Data.SQLTimSt, DateUtils,
     Tc.RTL.StringUtils ;



constructor TVRptTable.Create(ATableType : TVRptTableType ; ATable : String; ATableRelationType: TVRptTableRelationType;
  AJoinCondition, AWhereCondition: String; ARequiredAliases  : String  ) ;
begin
    FTableType          :=  ATableType          ;
    FTable              :=  ATable          ;
    FTableRelationType  :=  ATableRelationType  ;
    FJoinCondition      :=  AJoinCondition      ;
    FWhereCondition     :=  AWhereCondition     ;
    FRequiredAliases    :=  ARequiredAliases      ;
end;


constructor TTcMiBIColumn.Create;
begin
  FInternalFormatSettings.DateSeparator     := '.' ;
  FInternalFormatSettings.TimeSeparator     := ':' ;
  FInternalFormatSettings.ThousandSeparator := ',' ;
  FInternalFormatSettings.DecimalSeparator  := '.' ;
  FInternalFormatSettings.LongDateFormat    := 'DD.MM.YYYY' ;
  FInternalFormatSettings.TimeSeparator     := ':' ;
end;

destructor TTcMiBIColumn.Destroy;
begin
  inherited;
end;

procedure TTcMiBIColumn.MakeParam( AParams : TParams ; AParamName : string ; AParam : integer ) ;
var
   AParamFiled : String ;
   ParamDateTime : TDateTime ;
begin

   if AParam = 1 then
      AParamFiled := FPARAM1
   else
      AParamFiled := FPARAM2 ;


   case FCOLUMNDATATYPE of
     dtDate    :
      begin
       if AParamFiled = '' then
          AParams.CreateParam ( ftTimeStamp, AParamName, ptInput ).Bound := True
       else
         begin
          ParamDateTime := SQLTimeStampToDateTime ( StrToSQLTimeStamp( AParamFiled ) ) ;
          if AParam = 1 then
             ParamDateTime := DateUtils.StartOfTheDay ( ParamDateTime  )
          else
             ParamDateTime := DateUtils.EndOfTheDay ( ParamDateTime ) ;

          AParams.CreateParam ( ftTimeStamp, AParamName, ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( ParamDateTime ) ;
         end
      end;
     dtInteger : AParams.CreateParam ( ftInteger, AParamName, ptInput ).AsInteger := StrToIntDef ( AParamFiled, 0 ) ;
     dtFloat   : AParams.CreateParam ( ftFloat,   AParamName, ptInput ).asFloat   := StrToFloatDef ( AParamFiled, 0, FInternalFormatSettings ) ;
   else
     AParams.CreateParam ( ftString, AParamName, ptInput ).asString := AParamFiled ;
   end;

end;

procedure TTcMiBIColumn.SetCOLUMN(const Value: String);
begin
  FCOLUMN := Value;
end;

procedure TTcMiBIColumn.SetCOLUMNDATATYPE(const Value: TVRptDataTypes);
begin
  FCOLUMNDATATYPE := Value;
end;

procedure TTcMiBIColumn.SetCOLUMNORDER(const Value: SmallInt);
begin
  FCOLUMNORDER := Value;
end;

procedure TTcMiBIColumn.SetCOLUMNTITLE(const Value: String);
begin
  FCOLUMNTITLE := Value;
end;

procedure TTcMiBIColumn.SetCOLUMNTYPE(const Value: TVRptColumnType);
begin
  FCOLUMNTYPE := Value;
end;

procedure TTcMiBIColumn.SetID(const Value: String);
begin
  FID := Value;
end;

procedure TTcMiBIColumn.SetOperatorNot(const Value: boolean);
begin
  FOperatorNot := Value;
end;

procedure TTcMiBIColumn.SetOperatorType(const Value: TVRptOperators);
begin
  FOperatorType := Value;
end;

procedure TTcMiBIColumn.SetPARAM1(const Value: String);
begin
  FPARAM1 := Value;
end;

procedure TTcMiBIColumn.SetPARAM2(const Value: String);
begin
  FPARAM2 := Value;
end;

procedure TTcMiBIColumn.SetTABLEALIAS(const Value: String);
begin
  FTABLEALIAS := Value;
end;

procedure TTcMiBIColumn.SetVISIBLE(const Value: boolean);
begin
  FVISIBLE := Value;
end;

procedure TTcMiBIColumn.SetWHEREGROUP(const Value: SmallInt);
begin
  FWHEREGROUP := Value;
end;


procedure TTcMiBI.AddColumn( AColumn : TTcMiBIColumn ) ;
begin
   FColumns.Add ( AColumn ) ;
end;

procedure TTcMiBI.AddTable(AAlias: string; ATable: TVRptTable);
begin
  if ATable.TableRelationType = trPivot then
    begin
      FPivotTable      := ATable.TableName ;
      FPivotTableType  := ATable.TableType ;
      FPivotTableAlias := AAlias  ;
    end;
  FTables.Add ( AAlias, ATable ) ;
end;

procedure TTcMiBI.ClearColumns;
begin
   FColumns.Clear ;
end;

constructor TTcMiBI.Create;
begin
  FTables     := TVRptTables.Create ( [doOwnsValues] ) ;
  FColumns    := TTcMiBIColumns.Create ;
  FSQLParams  := TParams.Create ;
end;

destructor TTcMiBI.Destroy;
begin
  FColumns.free ;
  FTables.free ;
  FSQLParams.free ;
  inherited;
end;

procedure TTcMiBI.SetOnGetWhere(const Value: TOnGetWhere);
begin
  FOnGetWhere := Value;
end;

function TTcMiBI.SQLStmt : string ;
var
  UsedTableAlias       : TStringList ;
  SelectColumn : string ;
  SelectColumns     : TStringList ;
  PivotTable, CrossTables, JoinTables       : string ;
  BaseWhere, WhereConditions  : string ;
  ColumnSeparator, Column, FieldAlias : string ;
  LastGroup        : integer ;
  StrNot  : string ;
  sqlStmt : string ;
  ATableName : string ;

  ReportColumn : TTcMiBIColumn ;

  procedure AddUsedTables ( ATableAlias : string ) ;
  var
    RequestList : TStringList ;
    RequitedAlias : string ;
    Table : TVRptTable ;
  begin
      if    ( ReportColumn.TableAlias = FPivotTableAlias )
        or  (UsedTableAlias.IndexOf( ATableAlias ) > -1 ) then
          Exit ;

      if FTables.TryGetValue ( ATableAlias, Table ) then
        begin
           if Table.RequiredAliases <> '' then
             begin
              RequestList := TStringList.Create ;
              RequestList.CommaText := Table.RequiredAliases ;
              for RequitedAlias in RequestList do
                AddUsedTables ( RequitedAlias  ) ;
              RequestList.Free ;
             end;
        end;

      UsedTableAlias.Add ( ATableAlias ) ;
  end ;

  procedure MakeRelations ;
  var
    IterateUsedTableAlias : integer ;
    Table : TVRptTable ;
    Alias : string ;
  begin

   CrossTables  :=  '' ;
   JoinTables   :=  '' ;
(*
  StrVRptRelationTableTypeFmt : array [ TVRptTableRelationType ] of string = (
    'FROM %s %s',
    ', %s %s',
    'LEFT  JOIN %s %s ON (%s)',
    'RIGHT JOIN %s %s ON (%s)',
    'INNER JOIN %s %s ON (%s)' ) ;
*)
      for Alias in UsedTableAlias do
        begin
         if FTables.TryGetValue ( Alias, Table ) then
          begin
             if Table.TableRelationType  in [ trCross ] then
               CrossTables := CrossTables + Format ( StrVRptRelationTableTypeFmt[ Table.TableRelationType, Table.TableType ]+ #13#10, [ Table.TableName, Alias, Table.JoinCondition ]  )
             else if Table.TableRelationType  in [ trLeftJoin .. trInnerJoin ] then
               JoinTables := JoinTables + Format ( StrVRptRelationTableTypeFmt[ Table.TableRelationType, Table.TableType ]+ #13#10, [ Table.TableName,   Alias, Table.JoinCondition ]  )
          end;
        end;
  end ;

  function MakeWhereCondition : string ;
  var
    sqlOperator : string ;
    paramName : string ;
  begin
    sqlOperator := StrSQLOperators [ ReportColumn.OperatorType ] ;
    (*
    paramName := Format ( '%s_%s%d',
          [ ReportColumn.TableAlias,
            ReportColumn.Column,
            ReportColumn.WhereGroup ] ) ;
    *)
    paramName := Format ( '%s_%d_%d',
          [ ReportColumn.TableAlias,
            FSQLParams.Count + 1,
            ReportColumn.WhereGroup ] ) ;

//    Params.CreateParam ( ftInteger, '', ptInput  ) ;

    if ReportColumn.OperatorType = opBetween then
      begin
         Result := Format ( sqlOperator, [ Column, ':'+paramName + '_1', ':'+paramName + '_2' ] ) ;
         ReportColumn.MakeParam ( FSQLParams, paramName + '_1', 1 ) ;
         ReportColumn.MakeParam ( FSQLParams, paramName + '_2', 2 ) ;
      end
    else if ReportColumn.OperatorType = opLogical then
      begin
         Result := Format ( sqlOperator, [ Column, QuotedStr ( ReportColumn.PARAM1 ) ] ) ;
      end
    else
      begin
        Result := Format ( sqlOperator,  [ Column, ':'+paramName ] ) ;
        ReportColumn.MakeParam ( FSQLParams, paramName, 1 ) ;
      end;
  end ;

begin
   UsedTableAlias   := TStringList.Create ;
   SelectColumns     := TStringList.Create ;
   FSQLParams.Clear ;
   JoinTables       := '' ;
   WhereConditions  := '(' ;
   LastGroup        := 0 ;
   try
     for ReportColumn in FColumns do
       begin
         if LastGroup <> ReportColumn.WhereGroup then
           begin
               if WhereConditions[Length(WhereConditions)]  <> '(' then
                 WhereConditions  := Copy ( WhereConditions, 1, Length (  WhereConditions ) - 4 ) + ')'#13#10'OR (' ;

               LastGroup := ReportColumn.WhereGroup ;
           end;

         if TVRptColumnType ( ReportColumn.ColumnType ) =  ctExpression then
            Column := format ( '%s', [ ReportColumn.Column ] )
         else
            Column := format ( '%s.%s', [ ReportColumn.TableAlias, ReportColumn.Column ] ) ;

//         ****
         AddUsedTables ( ReportColumn.TableAlias ) ;

         if ReportColumn.Visible then
            begin
               FieldAlias := format ( '%s %s', [ Column, TStringSuppl.DblQuotedStr ( ReportColumn.ColumnTitle ) ] ) ;
               if SelectColumns.IndexOf( FieldAlias ) = -1 then
                 SelectColumns.Add ( FieldAlias ) ;
            end;

         if ReportColumn.OperatorType <> opNone then
           begin
            if  ReportColumn.OperatorNot then
              StrNot := ' NOT '
            else
              StrNot := '' ;
            WhereConditions := Format ( '%s(%s%s) AND ', [ WhereConditions, StrNot, MakeWhereCondition ] ) ;
           end;
       end;

    SelectColumns.QuoteChar := #9 ;

    MakeRelations ;

   // x.TryGetValue ( Alias, Table )
    sqlStmt:= '' ;
    PivotTable   :=  Format ( StrVRptRelationTableTypeFmt[ trPivot, FPivotTableType ]+ #13#10, [ FPivotTable, FPivotTableAlias ]  ) ;
    ColumnSeparator  := ' ' ;
    for SelectColumn in SelectColumns do
      begin
       sqlStmt := format ( '%s%s%s'#13#10,  [ sqlStmt, ColumnSeparator, SelectColumn ] ) ;
       ColumnSeparator  := ', '
      end;
    sqlStmt:= sqlStmt + format ( '%s%s',  [ PivotTable, CrossTables ] ) ;

    if JoinTables <> '' then
       sqlStmt := format ( '%s'#13#10'%s', [ sqlStmt, JoinTables, WhereConditions ] ) ;

    BaseWhere := '' ;
    if Assigned ( FOnGetWhere ) then
      FOnGetWhere( Self, UsedTableAlias, BaseWhere, FSQLParams ) ;

    if WhereConditions  <> '(' then
      begin
         if WhereConditions[Length(WhereConditions)] = '(' then
            WhereConditions  := Copy ( WhereConditions, 1, Length (  WhereConditions ) - 4 )
         else
            WhereConditions  := Copy ( WhereConditions, 1, Length (  WhereConditions ) - 4 ) + ')';

         if BaseWhere = '' then
           sqlStmt := format ( '%s'#13#10'WHERE ( %s ) ', [ sqlStmt, WhereConditions ] )
         else
           sqlStmt := format ( '%s'#13#10'WHERE %s AND ( %s ) ', [ sqlStmt, BaseWhere, WhereConditions ] )
      end
    else if BaseWhere <> '' then
         sqlStmt := format ( '%s'#13#10'WHERE %s ', [ sqlStmt, BaseWhere ] ) ;

    Result  := sqlStmt ;

   finally
    UsedTableAlias.Free ;
    SelectColumns.Free ;
   end;

end;

destructor TVRptTable.Destroy;
begin
  inherited;
end;

end.
