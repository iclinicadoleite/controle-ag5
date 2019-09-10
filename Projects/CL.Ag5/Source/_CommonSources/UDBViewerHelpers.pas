unit UDBViewerHelpers;

interface

uses
  System.Classes,
  System.Variants,
  System.SysUtils,
  Data.DB, Tc.Data.DB.Helpers,
  Data.FmtBcd,
  Data.SqlExpr, Tc.Data.SQLExpr,
  Data.DBXCommon,
  Data.DBXMetaDataNames,
  Data.SqlTimSt,
  Data.DBCommon ;


type

 TSQLConnection2 = class ( TSQLConnection )
 private
    procedure OpenSchema(eKind: TSchemaType;  sInfo: string; List: TStrings); overload;
    procedure OpenSchema(eKind: TSchemaType; sInfo, SSchemaName: string; List: TStrings); overload;
    function OpenSchemaTable(eKind: TSchemaType; SInfo: string; SQualifier: string = ''; SPackage: string = ''): TCustomSQLDataSet;overload;
    function OpenSchemaTable(eKind: TSchemaType; SInfo: string; SQualifier: string = ''; SPackage: string = ''; SSchemaName: string = ''): TCustomSQLDataSet;overload;
 public
    procedure GetFieldNames(const TableName: string; List: TStrings); overload;
    procedure GetFieldNames(const TableName: string; SchemaName: string; List: TStrings); overload;
    procedure GetIndexNames(const TableName: string; List: TStrings); overload;
    procedure GetIndexNames(const TableName, SchemaName: string; List: TStrings); overload;
    procedure GetProcedureNames(List: TStrings); overload;
    procedure GetProcedureNames(const PackageName: string; List: TStrings); overload;
    procedure GetProcedureNames(const PackageName, SchemaName: string; List: TStrings); overload;
    procedure GetPackageNames(List: TStrings); overload;
    procedure GetSchemaNames(List: TStrings); overload;
    procedure GetProcedureParams(ProcedureName : string; List: TProcParamList); overload;
    procedure GetProcedureParams(ProcedureName, PackageName: string; List: TProcParamList); overload;
    procedure GetProcedureParams(ProcedureName, PackageName, SchemaName: string; List: TProcParamList); overload;
    procedure GetTableNames(List: TStrings; SystemTables: Boolean = False); overload;
    procedure GetTableNames(List: TStrings; SchemaName: string; SystemTables: Boolean = False); overload;
 end;

implementation

function GetTableFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := 'TableName'
  else
    Result := 'TABLE_NAME';
end;

function GetProcedureFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := 'ProcedureName'
  else
    Result := 'PROC_NAME';
end;

function GetColumnFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := 'ColumnName'
  else
    Result := 'COLUMN_NAME';
end;

function GetIndexFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := TDBXIndexesColumns.IndexName
  else
    Result := 'INDEX_NAME';
end;

function GetSchemaFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := 'SchemaName'
  else
    Result := 'OBJECT_NAME';
end;

function GetPackageFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := 'PackageName'
  else
    Result := 'OBJECT_NAME';
end;


function GetParameterDataTypeFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := 'DbxDataType'         { do not localize }
  else
    Result := 'PARAM_DATATYPE';     { do not localize }
end;

function IsParameterFixedStringType(SqlConnection: TSQLConnection; DataSet: TCustomSQLDataSet; V:Variant): Boolean;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
  begin
    V := DataSet.FieldByName('IsFixedLength').Value;
    if VarIsNull(V) then
      Result := False
    else
      Result := Boolean(V);
  end
  else
  begin
    V := DataSet.FieldByName('PARAM_SUBTYPE').Value;
    if VarIsNull(V) then
      Result := False
    else
      Result := (V = TDBXDataTypes.FixedSubType);
  end;
end;

function GetParameterPositionFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := 'Ordinal'                  { do not localize }
  else
    Result := 'PARAM_POSITION';          { do not localize }
end;

function GetParameterPrecisionFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := 'Precision'          { do not localize }
  else
    Result := 'PARAM_PRECISION';   { do not localize }
end;

function GetParameterScaleFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := 'Scale'                  { do not localize }
  else
    Result := 'PARAM_SCALE';           { do not localize }
end;

function GetParameterLengthFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := 'Precision'             { do not localize }
  else
    Result := 'PARAM_LENGTH';         { do not localize }
end;

function GetParameterNameFieldName(SqlConnection: TSQLConnection): string;
var
  MetaData: TDBXDatabaseMetaData;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
    Result := 'ParameterName'      { do not localize }
  else
    Result := 'PARAM_NAME';        { do not localize }
end;


function TSQLConnection2.OpenSchemaTable(eKind: TSchemaType; SInfo: string; SQualifier: string = ''; SPackage: string = ''): TCustomSQLDataSet;
begin
  Result := OpenSchemaTable(eKind, SInfo, SQualifier, SPackage , '');
end;

function TSQLConnection2.OpenSchemaTable(eKind: TSchemaType; SInfo: string; SQualifier: string = ''; SPackage: string = ''; SSchemaName: string = ''): TCustomSQLDataSet;
var
  DataSet: TCustomSQLDataSet;
begin
  CheckConnection(eConnect);
  DataSet := TCustomSQLDataSet.Create(nil);
  Result := nil;
  try
    DataSet.SQLConnection := Self ;
    DataSet.SetSchemaInfo(eKind, SInfo, SQualifier, SPackage);
    DataSet.SchemaName := SSchemaName;
    DataSet.Active := True;
    Result := DataSet;
  finally
    if Result = nil then
      DataSet.DisposeOf;
  end;
end;

procedure TSQLConnection2.OpenSchema(eKind: TSchemaType; sInfo: string; List: TStrings);
begin
  OpenSchema(eKind, sInfo, '', List);
end;

procedure TSQLConnection2.OpenSchema(eKind: TSchemaType; sInfo, SSchemaName: string; List: TStrings);
var
  DataSet: TCustomSQLDataSet;
  NameField: TField;
  PackageName : string;
  ISList: TStringList;
begin
  CheckConnection(eConnect);
  //if DBXConnection = nil then
  //  DatabaseError(sConnectionNameMissing);
  DataSet := nil;
  NameField := nil;
  if eKind = stProcedures then
    PackageName := sInfo;
  //CheckActive;
  //SetCursor(HourGlassCursor);
  try
    DataSet := OpenSchemaTable(eKind, sInfo, '', PackageName, SSchemaName);
    if Assigned(DataSet) then
    begin
      case eKind of
        stColumns:
          NameField := DataSet.FieldByName(GetColumnFieldName(Self));
        stProcedures:
          NameField := DataSet.FieldByName(GetProcedureFieldName(Self));
        stPackages:
          NameField := DataSet.FieldByName(GetPackageFieldName(Self));
        stIndexes:
          NameField := DataSet.FieldByName(GetIndexFieldName(Self));
        stTables, stSysTables:
          NameField := DataSet.FieldByName(GetTableFieldName(Self));
        stUserNames:
          NameField := DataSet.FieldByName(GetSchemaFieldName(Self));
      end;
      if (not DataSet.Eof) then
      begin
        ISList:= TStringList.Create;
        try
          try
            ISList.BeginUpdate;
            ISList.Duplicates := dupIgnore;
            ISList.CaseSensitive := False;
            while not DataSet.Eof do
            begin
              ISList.Add(Trim(NameField.AsString));
              DataSet.Next;
            end;
            //ISList.Sorted := True;
          finally
            ISList.EndUpdate;
          end;
          try
            List.BeginUpdate;
            List.Clear;
            List.AddStrings(ISList);
          finally
            List.EndUpdate;
          end;
        finally
          ISList.Free;
        end;
      end;
    end;
  finally
    //SetCursor(DefaultCursor);
    DataSet.DisposeOf;
  end;
end;



procedure TSQLConnection2.GetFieldNames(const TableName: string; List: TStrings);
begin
  OpenSchema(stColumns, TableName, List);
end;

procedure TSQLConnection2.GetFieldNames(const TableName: string; SchemaName: string; List: TStrings);
begin
  OpenSchema(stColumns, TableName, SchemaName, List);
end;

procedure TSQLConnection2.GetProcedureNames(List: TStrings);
begin
  OpenSchema(stProcedures, '', List);
end;

procedure TSQLConnection2.GetProcedureNames(const PackageName : string; List: TStrings);
begin
  OpenSchema(stProcedures, PackageName, '', List);
end;

procedure TSQLConnection2.GetProcedureNames(const PackageName, SchemaName : string; List: TStrings);
begin
  OpenSchema(stProcedures, PackageName, SchemaName, List);
end;

procedure TSQLConnection2.GetPackageNames(List: TStrings);
begin
  OpenSchema(stPackages, '', List);
end;

procedure TSQLConnection2.GetSchemaNames(List: TStrings);
begin
  OpenSchema(stUserNames, '', List);
end;

procedure TSQLConnection2.GetTableNames(List: TStrings; SystemTables: Boolean = False);
begin
  GetTableNames( List, '', SystemTables );
end;

procedure TSQLConnection2.GetTableNames(List: TStrings; SchemaName: string; SystemTables: Boolean = False);
var
  eType: TSchemaType;
begin
  if SystemTables then
    eType := stSysTables
  else
    eType := stTables;
  OpenSchema(eType, '', SchemaName, List);
end;

procedure TSQLConnection2.GetIndexNames(const TableName: string; List: TStrings);
begin
  OpenSchema(stIndexes, TableName, '', List);
end;

procedure TSQLConnection2.GetIndexNames(const TableName, SchemaName: string; List: TStrings);
begin
  OpenSchema(stIndexes, TableName, SchemaName, List);
end;

procedure TSQLConnection2.GetProcedureParams(ProcedureName: string; List: TProcParamList);
begin
  GetProcedureParams(ProcedureName, '', List);
end;

procedure TSQLConnection2.GetProcedureParams(ProcedureName, PackageName: string; List: TProcParamList);
begin
  GetProcedureParams(ProcedureName, PackageName, '',  List);
end;

function GetParameterType(SqlConnection: TSQLConnection; DataSet: TCustomSQLDataSet; V:Variant): TParamType;
var
  MetaData: TDBXDatabaseMetaData;
  Mode: string;
begin
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
  begin
    Mode := DataSet.FieldByName(TDBXProcedureParametersColumns.ParameterMode).AsString;
    if (Mode = 'IN') or (Mode = '1') then
      Result := ptInput
    else if (Mode = 'OUT') or (Mode = '4') then
      Result := ptOutput
    else if (Mode = 'INOUT') or (Mode = '2') then
      Result := ptInputOutput
    else if (Mode = 'RESULT') or (Mode = 'RETURN') or (Mode = '3') or (Mode = '5') then
      Result := ptResult
    else
      Result := ptUnknown;
  end
  else
  begin
    V := DataSet.FieldByName('PARAM_TYPE').Value;
    if VarIsNull(V) then
      Result := ptUnknown
    else
      Result := TParamType(Integer(V));
  end;
end;

function IsResultSetParameterType(SqlConnection: TSQLConnection; DataSet: TCustomSQLDataSet): Boolean;
var
  MetaData: TDBXDatabaseMetaData;
  Mode: string;
begin
  Result := False;
  MetaData := SqlConnection.DBXConnection.DatabaseMetaData;
  if Assigned(MetaData) and (MetaData.MetaDataVersion = DBXVersion40) then
  begin
    Mode := DataSet.FieldByName(TDBXProcedureParametersColumns.ParameterMode).AsString;
    Result := (Mode = 'RESULT');
  end;
end;


// Jens Ole:
// Some databases (i.e. Oracle) does not specify data length and precision
// Set some reasonable values here for the buffer sizes....
// We should probably inspect the input value !!
procedure AdjustProcedureDataLength(ArgDesc: SPParamDesc);
begin
  if ArgDesc.iLen = 0 then
  begin
    case ArgDesc.iDataType of
      ftUnknown:     ArgDesc.iLen := 40;  //probably never used
      ftFixedChar,
      ftFixedWideChar,
      ftWideString,
      ftString:      ArgDesc.iLen := 2000;
      ftByte:        ArgDesc.iLen := sizeof(Byte);
      ftShortint:    ArgDesc.iLen := sizeof(ShortInt);
      ftSmallint:    ArgDesc.iLen := sizeof(SmallInt);
      ftLargeint:    ArgDesc.iLen := sizeof(LargeInt);
      ftInteger:     ArgDesc.iLen := sizeof(Integer);
      ftWord:        ArgDesc.iLen := sizeof(Word);
      ftBoolean:     ArgDesc.iLen := sizeof(Integer);
      ftAutoInc,
      ftCurrency,
      ftFMTBcd,
      ftBCD:         ArgDesc.iLen := Data.FmtBcd.SizeOfTBCD;
      ftSingle:      ArgDesc.iLen := sizeof(Single);
      ftFloat,
      ftDate,
      ftTime,
      ftTimeStamp,
      ftDateTime:    ArgDesc.iLen := sizeof(Double);
      ftTimeStampOffset: ArgDesc.iLen := sizeof(TSQLTimeStampOffset);
      ftOraTimeStamp,
      ftOraInterval: ArgDesc.iLen := 16;
    else
      ArgDesc.iLen := 8000;
    end;
    if ArgDesc.iUnits1 = 0 then
      ArgDesc.iUnits1 := ArgDesc.iLen;
  end;
end;


procedure TSQLConnection2.GetProcedureParams(ProcedureName, PackageName, SchemaName: string; List: TProcParamList);
const
  ResultParam = 'Result';                   { Do not localize }
var
  DataSet: TCustomSQLDataSet;
  ArgDesc: SPParamDesc;
  V: Variant;
begin

  DataSet := nil;
  try
    DataSet := OpenSchemaTable(stProcedureParams, ProcedureName,'', PackageName, SchemaName);
    while not DataSet.EOF do
    begin
      ArgDesc := SPParamDesc.Create;
      ArgDesc.iParamNum := DataSet.FieldByName(GetParameterPositionFieldName(self)).Value;
      ArgDesc.iArgType := GetParameterType(self,DataSet,V);

      V := DataSet.FieldByName(GetParameterDataTypeFieldName(self)).Value;
      if IsResultSetParameterType(self,DataSet) and (V = TDBXDataTypes.ObjectType) then
        FreeAndNil(ArgDesc)
      else
      begin
        if VarIsNull(V) then
          ArgDesc.iDataType := ftUnknown
        else if V < TDBXDataTypes.MaxBaseTypes then
          ArgDesc.iDataType := DataTypeMap[Integer(V)]
        else
          ArgDesc.iDataType := ftUnknown;
        if IsParameterFixedStringType(self,DataSet,V) then
        begin
          if ArgDesc.iDataType = ftString then
            ArgDesc.iDataType := ftFixedChar
          else if ArgDesc.iDataType = ftWideString then
            ArgDesc.iDataType := ftFixedWideChar;
        end;
        V := DataSet.FieldByName(GetParameterPrecisionFieldName(self)).Value;
        if VarIsNull(V) then
          ArgDesc.iUnits1 := 0
        else
          ArgDesc.iUnits1 := V;
        V := DataSet.FieldByName(GetParameterScaleFieldName(self)).Value;
        if VarIsNull(V) then
          ArgDesc.iUnits2 := 0
        else
          ArgDesc.iUnits2 := V;
        if ArgDesc.iDataType = ftBCD then
        begin
          // dbExpress only supports ftFMTBcd
          ArgDesc.iDataType := ftFMTBcd
        end;
        V := DataSet.FieldByName(GetParameterLengthFieldName(self)).Value;
        if VarIsNull(V) or (V < 0) then
          ArgDesc.iLen := 0
        else
          ArgDesc.iLen := V;
        AdjustProcedureDataLength(ArgDesc);
        V := DataSet.FieldByName(GetParameterNameFieldName(self)).Value;
        if VarIsNull(V) then
          ArgDesc.szName := ResultParam
        else
          ArgDesc.szName := V;
        List.Add(ArgDesc);
      end;
      DataSet.next;
    end;
  finally
    DataSet.DisposeOf;
  end;
end;

end.
