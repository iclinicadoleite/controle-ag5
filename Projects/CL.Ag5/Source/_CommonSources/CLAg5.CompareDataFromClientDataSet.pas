unit CLAg5.CompareDataFromClientDataSet;

interface

uses
  System.SysUtils, System.Classes, System.WideStrings, DBXFirebird, Tc.DBRTL.AbstractDB,
  Tc.DBRTL.AbstractDB.DBX, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, VCL.Dialogs, SQLTimSt ;

type
  TLog = procedure ( ALog : string ) of object ;

  TCompareDataFromClientDataSet = class
  private
    { Private declarations }
    FBaseSyncFolder : string ;
    FSyncDateString : string ;
    FSyncDate : TDateTime ;
    FSelectedFarm : integer ;
    FSQLStmt : string ;
    FParams  : TParams ;
    FUploadSyncFolder   : string ;
    FDownloadSyncFolder : string ;
    FLog: TLog;
    FDefaultTableList : TClientDataSet ;
    procedure MakeInsert  ( ATableName : string ; AFields : TFields ) ;
    procedure MakeUpdate  ( ATableName : string ; AFields : TFields ) ;
    procedure MakeUpdateOrInsert  ( ATableName : string ; AFields : TFields ) ;
    procedure MakeDelete  ( ATableName : string ; AFields : TFields ) ;
    procedure ExecuteSQLStmt( ATableName : string )  ;
    procedure Compare ( ATableName : string ; ASource, ATarget : TClientDataSet ) ;
    procedure SetLog(const Value: TLog);
    procedure DoLog ( ALog : string ) ;
  public
    { Public declarations }
    procedure UpdateTables ( APath, ATableName : string )  ;
    property Log : TLog  read FLog write SetLog;
  end;


implementation

uses ClAg5.DatabaseIntf,
     IniFiles,
     DateUtils,
     Tc.RTL.Folders,
     Tc.JVCL.Compressor,
     Tc.RTL.Exceptions,
     Tc.VCL.Application,
     ShellAPI, WinApi.Windows, Forms ;

procedure ExecuteWait (  ExecuteFile, ParamString, StartInString: string ) ;
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;

begin

  FillChar(SEInfo, SizeOf(SEInfo), 0) ;
  SEInfo.cbSize := SizeOf(TShellExecuteInfo) ;
  with SEInfo do
  begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpFile := PChar(ExecuteFile) ;
   {
   ParamString can contain the
   application parameters.
   }
   if ParamString <> '' then
     lpParameters := PChar(ParamString) ;
   {
   StartInString specifies the
   name of the working directory.
   If ommited, the current directory is used.
   }
   if StartInString <> '' then
     lpDirectory := PChar(StartInString) ;
   nShow := SW_SHOWNORMAL;
  end;
  if ShellExecuteEx(@SEInfo) then begin
      repeat
        Application.ProcessMessages;
        GetExitCodeProcess(SEInfo.hProcess, ExitCode) ;
      until (ExitCode <> STILL_ACTIVE) or Application.Terminated ;
    end
  else
    Raise Warning.Create ( '' ) ;
 end;


procedure TCompareDataFromClientDataSet.Compare( ATableName : string ; ASource, ATarget: TClientDataSet);
begin

  FParams := TParams.Create ;
  ASource.First ;
  ATarget.First ;
  while not ( ASource.eof or ATarget.eof  ) do
    begin
       FSQLStmt := '' ;

       if ( ASource.Fields[ 0 ].Value = ATarget.Fields[ 0 ].Value ) then
        begin

          if ( ASource.FieldValues[ 'SYS$DU' ] > ATarget.FieldValues[ 'SYS$DU' ] ) then
             { MakeUpdate } MakeUpdateOrInsert ( ATableName, ASource.Fields ) ;
          ASource.Next ;
          ATarget.Next ;
        end
       else if CompareText ( ASource.Fields[ 0 ].Value, ATarget.Fields[ 0 ].Value ) > 0 then
          begin
            /////////////////////////MakeDelete ( ATableName, ATarget.Fields ) ;
            ATarget.Next ;
          end
       else
          begin
            { MakeInsert } MakeUpdateOrInsert ( ATableName, ASource.Fields ) ;
            ASource.Next ;
          end ;

       ExecuteSQLStmt( ATableName )
    end;

  while not ( ASource.eof  ) do
    begin
       { MakeInsert } MakeUpdateOrInsert ( ATableName, ASource.Fields ) ;
       ASource.Next ;
       ExecuteSQLStmt( ATableName )
    end;

 (*
  while not ( ATarget.eof  ) do
    begin
       MakeDelete ( ATableName, ATarget.Fields ) ;
       ATarget.Next ;
       ExecuteSQLStmt( ATableName )
    end;
  *)
  FParams.Free ;
end;



procedure TCompareDataFromClientDataSet.UpdateTables ( APath, ATableName : string ) ;
var
  SourceCDS, TargetCDS : TClientDataSet ;
begin
  try
    DoLog ( 'Comparando ' + ATableName ) ;
    SourceCDS := TClientDataSet.Create( nil ) ;
    SourceCDS.LoadFromFile ( IncludeTrailingPathDelimiter ( APath ) + ATableName { + '.$' } ) ;
    TargetCDS := nil  ;
    Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias( 'ENTIDADES' ).populateClientDataSet ( TargetCDS, 'SELECT * FROM ' + ATableName ) ;
    SourceCDS.Fields[0].ProviderFlags := SourceCDS.Fields[0].ProviderFlags + [pfInKey ] ;
    TargetCDS.Fields[0].ProviderFlags := TargetCDS.Fields[0].ProviderFlags + [pfInKey ] ;
    SourceCDS.IndexFieldNames := SourceCDS.Fields[0].FieldName ;
    TargetCDS.IndexFieldNames := TargetCDS.Fields[0].FieldName ;
    Compare ( ATableName, SourceCDS, TargetCDS ) ;
    SourceCDS.free ;
    TargetCDS.Free ;
  except On e : Exception do
     showMessage ( e.message ) ;
  end

end;

procedure TCompareDataFromClientDataSet.SetLog(const Value: TLog);
begin
  FLog := Value;
end;


procedure TCompareDataFromClientDataSet.MakeInsert(ATableName: string; AFields : TFields ) ;
const
  _INSERT_STMT =
           'EXECUTE BLOCK'
    +#13#10'AS'
    +#13#10'BEGIN'
    +#13#10'  RDB$SET_CONTEXT( ''USER_TRANSACTION'', ''RLOG$OFF'', ''1'' ) ;'
    +#13#10'  INSERT INTO'
    +#13#10'  %s'
    +#13#10'   ( %s )'
    +#13#10'  VALUES'
    +#13#10'   ( %s ) ;'
    +#13#10'  RDB$SET_CONTEXT( ''USER_TRANSACTION'', ''RLOG$OFF'', NULL) ;'
    +#13#10'END' ;
var
  IterateFieldsList : integer ;
  FieldsList, FieldsValues : string ;
begin
  FieldsList   := '' ;
  FieldsValues := '' ;

  FParams.Clear ;

  for IterateFieldsList := 0 to AFields.Count -1  do
   begin
    FieldsList   := Format ( '%s%s,'#13#10,  [ FieldsList,   AFields[ IterateFieldsList ].FieldName ] ) ;
    FieldsValues := Format ( '%s:%s,'#13#10, [ FieldsValues, AFields[ IterateFieldsList ].FieldName ] ) ;
    FParams.CreateParam ( ftUnknown, '', ptInput ).AssignField( AFields[ IterateFieldsList ] )  ;
   end;

  SetLength ( FieldsList,   Length ( FieldsList )   -3 ) ;
  SetLength ( FieldsValues, Length ( FieldsValues ) -3 ) ;

  FSQLStmt := Format ( _INSERT_STMT, [ ATableName, FieldsList, FieldsValues ] ) ;
end;

procedure TCompareDataFromClientDataSet.MakeUpdate(ATableName: string; AFields: TFields );
const
  _UPDATE_STMT =
         'EXECUTE BLOCK'
  +#13#10'AS'
  +#13#10'BEGIN'
  +#13#10'  RDB$SET_CONTEXT( ''USER_TRANSACTION'', ''RLOG$OFF'', ''1'' ) ;'
  +#13#10'  UPDATE %s'
  +#13#10'  SET'
  +#13#10'     %s'
  +#13#10'  WHERE ('
  +#13#10'    %s'
  +#13#10') ;'
  +#13#10'  RDB$SET_CONTEXT( ''USER_TRANSACTION'', ''RLOG$OFF'', NULL) ;'
  +#13#10'END' ;

var
  KeysList, FieldsList : string  ;
  IterateKeysList, IterateFieldsList : integer  ;
begin
  KeysList := '' ;
  FieldsList := '' ;

  FParams.Clear ;


  for IterateFieldsList := 0 to AFields.Count -1 do
   begin
    FieldsList := Format ( '%s  %s = :%1:s,'#13#10, [ FieldsList, AFields[ IterateFieldsList ].FieldName ] ) ;
    FParams.CreateParam ( ftUnknown, '', ptInput ).AssignField( AFields[ IterateFieldsList ] )  ;
   end ;

  for IterateKeysList := 0 to AFields.Count -1 do
    if pfInKey in AFields[ IterateKeysList ].ProviderFlags then
      begin
        KeysList := Format ( '%s  %s = :%1:s'#13#10'AND ', [ KeysList, AFields[ IterateKeysList ].FieldName ] ) ;
        FParams.CreateParam ( ftUnknown, '', ptInput ).AssignField( AFields[ IterateKeysList ] )  ;
      end;

  SetLength ( KeysList, Length ( KeysList ) -6 ) ;
  SetLength ( FieldsList, Length ( FieldsList ) -3 ) ;

  FSQLStmt := Format ( _UPDATE_STMT, [ ATableName, FieldsList, KeysList ] ) ;

end;


procedure TCompareDataFromClientDataSet.MakeUpdateOrInsert(ATableName: string; AFields: TFields );
const
  _INSERT_STMT =
           'EXECUTE BLOCK'
    +#13#10'AS'
    +#13#10'%s'
    +#13#10'BEGIN'
    +#13#10'  RDB$SET_CONTEXT( ''USER_TRANSACTION'', ''RLOG$OFF'', ''1'') ;'
    +#13#10'  UPDATE OR INSERT INTO'
    +#13#10'  %s'
    +#13#10'  ( %s )'
    +#13#10'  VALUES'
    +#13#10'  ( %s )'
    +#13#10'  MATCHING ( %s ) ;'
    +#13#10'  RDB$SET_CONTEXT( ''USER_TRANSACTION'', ''RLOG$OFF'', NULL) ;'
    +#13#10'END' ;
var
  IterateFieldsList : integer ;
  DeclareList, FieldsList, FieldsValues : string ;

  function GetDeclare( AField : TField ) : string ;
  var
    LFieldType : string ;
    LFieldValue : string ;
    FS : TFormatSettings ;
  begin
   LFieldValue := 'NULL' ;
   FS.DecimalSeparator := '.' ;
   if AField is TIntegerField then
      begin
        LFieldType  := 'integer' ;
        if not AField.IsNull then
          LFieldValue := AField.AsString ;
      end;
   if AField is TStringField then
      begin
        LFieldType  := Format( 'varchar(%d)', [ AField.Size ] ) ;
        if not AField.IsNull then
          LFieldValue := QuotedStr ( AField.asString ) ;
      end;
   if AField is TMemoField then
      begin
        LFieldType  := Format( 'varchar(%d)', [ 2048 ] ) ;
        if not AField.IsNull then
          LFieldValue := QuotedStr ( Copy ( AField.asString, 2048 ) ) ;
      end;
   if AField is TDateTimeField then
      begin
        LFieldType  := 'TIMESTAMP' ;
        if not AField.IsNull then
          LFieldValue := QuotedStr ( FormatDateTime ( 'YYYY-MM-DD HH:MM:SS', TDateTimeField(AField).AsDateTime ) ) ;
      end;
   if AField is TSQLTimeStampField then
      begin
        LFieldType  := 'TIMESTAMP' ;
        if not AField.IsNull then
          LFieldValue := QuotedStr ( FormatDateTime ( 'YYYY-MM-DD HH:MM:SS', TSQLTimeStampField(AField).AsDateTime ) ) ;
      end;
   if AField is TFloatField then
      begin
        LFieldType  := 'double precision' ;
        if not AField.IsNull then
          LFieldValue := Format ( '%f', [ TFloatField ( AField ).AsFloat ], FS )  ;
      end;
   Result := Format ( 'DECLARE %s %s = %s', [ AField.FieldName, LFieldType, LFieldValue ] ) ;
  end ;

begin
  DeclareList  := '' ;
  FieldsList   := '' ;
  FieldsValues := '' ;

  FParams.Clear ;

  for IterateFieldsList := 0 to AFields.Count -1  do
   if AFields[ IterateFieldsList ].FieldName <> 'LOGO' then
      begin
       DeclareList  := Format ( '%s%s;'#13#10,  [ DeclareList,  GetDeclare( AFields[ IterateFieldsList ] ) ] ) ;
       FieldsList   := Format ( '%s%s,'#13#10,  [ FieldsList,   AFields[ IterateFieldsList ].FieldName ] ) ;
       FieldsValues := Format ( '%s:%s,'#13#10, [ FieldsValues, AFields[ IterateFieldsList ].FieldName ] ) ;
       FParams.CreateParam ( ftUnknown, '', ptInput ).AssignField( AFields[ IterateFieldsList ] )  ;
     end;

  SetLength ( DeclareList,  Length ( DeclareList )  -2 ) ; //reteain ';'
  SetLength ( FieldsList,   Length ( FieldsList )   -3 ) ;
  SetLength ( FieldsValues, Length ( FieldsValues ) -3 ) ;

  FSQLStmt := Format ( _INSERT_STMT, [ DeclareList, ATableName, FieldsList, FieldsValues, AFields[ 0 ].FieldName ] ) ;
end;


(*
procedure TCompareDataFromClientDataSet.MakeUpdateOrInsert(ATableName: string; AFields: TFields );
const
  _UPDATE_OR_INSERT_STMT =
           'EXECUTE BLOCK'
    +#13#10'AS'
    +#13#10'%s'
    +#13#10'BEGIN'
    +#13#10'  RDB$SET_CONTEXT( ''USER_TRANSACTION'', ''RLOG$OFF'', ''1'' ) ;'
    +#13#10'  IF EXISTS ( SELECT 1 FROM %s WHERE %s ) THEN'
    +#13#10'    UPDATE'
    +#13#10'    SET'
    +#13#10'    %s'
    +#13#10'    WHERE ( %s ) ;'
    +#13#10'  ELSE'
    +#13#10'    INSERT INTO'
    +#13#10'     %s'
    +#13#10'    ( %s )'
    +#13#10'    VALUES'
    +#13#10'    ( %s ) ;'
    +#13#10'  RDB$SET_CONTEXT( ''USER_TRANSACTION'', ''RLOG$OFF'', NULL) ;'
    +#13#10'END' ;

  function GetDeclare( AField : TField ) : string ;
  var
    LFieldType : string ;
    LFieldValue : string ;
    FS : TFormatSettings ;
  begin
   LFieldValue := 'NULL' ;
   FS.DecimalSeparator := '.' ;
   if AField is TStringField then
      begin
        LFieldType  := Format( 'varchar(%d)', [ AField.Size ] ) ;
        if not AField.IsNull then
          LFieldValue := QuotedStr ( AField.asString ) ;
      end;
   if AField is TMemoField then
      begin
        LFieldType  := Format( 'varchar(%d)', [ 2048 ] ) ;
        if not AField.IsNull then
          LFieldValue := QuotedStr ( Copy ( AField.asString, 2048 ) ) ;
      end;
   if AField is TDateTimeField then
      begin
        LFieldType  := 'TIMESTAMP' ;
        if not AField.IsNull then
          LFieldValue := QuotedStr ( FormatDateTime ( 'YYYY-MM-DD HH:MM:SS', TDateTimeField(AField).AsDateTime ) ) ;
      end;
   if AField is TSQLTimeStampField then
      begin
        LFieldType  := 'TIMESTAMP' ;
        if not AField.IsNull then
          LFieldValue := QuotedStr ( FormatDateTime ( 'YYYY-MM-DD HH:MM:SS', TSQLTimeStampField(AField).AsDateTime ) ) ;
      end;
   if AField is TFloatField then
      begin
        LFieldType  := 'double precision' ;
        if not AField.IsNull then
          LFieldValue := Format ( '%f', [ TFloatField ( AField ).AsFloat ], FS )  ;
      end;
   Result := Format ( 'DECLARE %s %s = %s', [ AField.FieldName, LFieldType, LFieldValue ] ) ;
  end ;

var
  IterateKeysList,
  IterateFieldsList : integer  ;
  DeclareList,
  SelectKeysList, UpdateKeysList,
  InsertFieldsList, InsertFieldsValues : string ;
  UpdateFieldsList : string  ;

  FieldsList, FieldsValues : string ;


begin

  DeclareList        := '' ;
  UpdateKeysList     := '' ;
  InsertFieldsList   := '' ;
  InsertFieldsValues := '' ;
  UpdateFieldsList   := '' ;

  FParams.Clear ;

  // keys for select
  for IterateKeysList := 0 to AFields.Count -1 do
    if pfInKey in AFields[ IterateKeysList ].ProviderFlags then
      begin
        SelectKeysList := Format ( '%s  %s = :%1:s'#13#10'AND ', [ SelectKeysList, AFields[ IterateKeysList ].FieldName ] ) ;
        FParams.CreateParam ( ftUnknown, '', ptInput ).AssignField( AFields[ IterateKeysList ] )  ;
      end;

 // fields for insert
  for IterateFieldsList := 0 to AFields.Count -1  do
   begin
    DeclareList        := Format ( '%s%s;'#13#10,  [ DeclareList,  GetDeclare( AFields[ IterateFieldsList ] ) ] ) ;
    InsertFieldsList   := Format ( '%s%s,'#13#10,  [ InsertFieldsList,   AFields[ IterateFieldsList ].FieldName ] ) ;
    InsertFieldsValues := Format ( '%s:%s,'#13#10, [ InsertFieldsValues, AFields[ IterateFieldsList ].FieldName ] ) ;
    FParams.CreateParam ( ftUnknown, '', ptInput ).AssignField( AFields[ IterateFieldsList ] )  ;
   end;

  // fields for update
  for IterateFieldsList := 0 to AFields.Count -1 do
   begin
    UpdateFieldsList := Format ( '%s  %s = :%1:s,'#13#10, [ UpdateFieldsList, AFields[ IterateFieldsList ].FieldName ] ) ;
    FParams.CreateParam ( ftUnknown, '', ptInput ).AssignField( AFields[ IterateFieldsList ] )  ;
   end ;

  // keys for update
  for IterateKeysList := 0 to AFields.Count -1 do
    if pfInKey in AFields[ IterateKeysList ].ProviderFlags then
      begin
        UpdateKeysList := Format ( '%s  %s = :%1:s'#13#10'AND ', [ UpdateKeysList, AFields[ IterateKeysList ].FieldName ] ) ;
        FParams.CreateParam ( ftUnknown, '', ptInput ).AssignField( AFields[ IterateKeysList ] )  ;
      end;


  SetLength ( DeclareList,        Length ( DeclareList        ) -2 ) ;  // retain ";"
  SetLength ( SelectKeysList,     Length ( SelectKeysList     ) -6 ) ;
  SetLength ( UpdateKeysList,     Length ( UpdateKeysList     ) -6 ) ;
  SetLength ( UpdateFieldsList,   Length ( UpdateFieldsList   ) -3 ) ;
  SetLength ( InsertFieldsList,   Length ( InsertFieldsList   ) -3 ) ;
  SetLength ( InsertFieldsValues, Length ( InsertFieldsValues ) -3 ) ;

  FSQLStmt := Format ( _UPDATE_OR_INSERT_STMT, [
     DeclareList,
     ATableName, SelectKeysList,
     ATableName, UpdateFieldsList, UpdateKeysList,
     ATableName, InsertFieldsList, InsertFieldsValues ] ) ;
end;
*)

procedure TCompareDataFromClientDataSet.DoLog(ALog: string);
begin
  if Assigned ( FLog ) then
     FLog ( ALog ) ;
end;

procedure TCompareDataFromClientDataSet.ExecuteSQLStmt( ATableName : string );
begin
  if FSQLStmt = '' then
    exit ;

  if  ( ATableName = 'CAD_ENTIDADES' )
  and ( FParams[ 0 ].asString = LoggedUser.DomainID ) then
     exit ;

  if  ( ATableName = 'SYS$USERS' )
  and ( FParams[ 1 ].asString.ToLower = 'admin' ) then
     exit ;

  DoLog ( Copy ( FSQLStmt, 1, 6 ) + ': ' + FParams[ 0 ].asString ) ;
  try
    FPArams.Clear ; /// for use EXECUTE BLOCK no need params ....
    Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias( 'ENTIDADES' ).Execute( FSQLStmt, FParams );
  except On E : Exception do
    ShowMessage (  E.Message ) ;
  end;

end;


procedure TCompareDataFromClientDataSet.MakeDelete(ATableName: string; AFields : TFields );
const
  _DELETE_STMT = 'DELETE FROM %s WHERE ( %s ) ' ;
var
  KeysList : string  ;
  IterateKeysList : integer  ;
begin
  KeysList := '' ;

  FParams.Clear ;

  for IterateKeysList := 0 to AFields.Count -1 do
    if pfInKey in AFields[ IterateKeysList ].ProviderFlags then
      begin
        KeysList := Format ( '%s%s = :%1:s'#13#10'AND ', [ KeysList, AFields[ IterateKeysList ].FieldName ] ) ;
        FParams.CreateParam ( ftUnknown, '', ptInput ).AssignField( AFields[ IterateKeysList ] )  ;
      end;

  SetLength ( KeysList, Length ( KeysList ) -6 ) ;

  FSQLStmt := Format ( _DELETE_STMT, [ ATableName, KeysList ] ) ;
end;


end.
