unit CL.Ag5Client.UDBSession.Initialize;

interface

uses Tc.DBRTL.AbstractDB,
    Dialogs,
     Tc.RTL.Folders ;

type
   TClAg5InitTables = class
   private
     FIDB : ITcAbstractDB ;
     FSourceMDTFile : string ;
     FTempFolder : ITcTempFolder ;
     procedure ExtractDefTables ;
     procedure ImportDefault(ATableName,AMatchingFields: string);
     procedure InitDEFTables ;
   public
     class procedure Execute ( ASourceMDTFile : string ; AIDB : ITcAbstractDB  ) ;
   end;

implementation

uses System.SysUtils, Data.DB, Tc.Data.DB.Helpers, Data.SQLTimSt,
     DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SQLExpr,
     Data.DBXCommon,
     Tc.JVCL.Compressor,
     Masks ;


class procedure TClAg5InitTables.Execute( ASourceMDTFile : string ; AIDB : ITcAbstractDB  ) ;
begin
  try
    with Create do
      try
       FIDB := AIDB ;
       FSourceMDTFile := ASourceMDTFile ;
       FTempFolder    := TcTempFolderFactory ;
       ExtractDefTables ;
       InitDEFTables ;
      finally
       free ;
      end;
  except on e : exception do
    showMessage (  e.Message ) ;
  end;
end;

procedure TClAg5InitTables.ExtractDefTables ;
var
  Decompress : ICompressorEngine ;
  x : integer ;

begin

  Decompress := CompressorEngineFactory ;
  Decompress.OpenArchive ( FSourceMDTFile ) ;
  Decompress.TargetFolder := FTempFolder.FolderName ;
  for x := 0 to Decompress.ItemCount - 1 do
      Decompress[ x ].Selected := MatchesMask ( Decompress[ x ].PackedName, '*.$' ) ;
  Decompress.ExtractSelected ;

end;

procedure TClAg5InitTables.ImportDefault(ATableName,AMatchingFields: string);
var
 CDS : TClientDataSet ;
 Params : TParams ;
 sqlStmt : string ;
 LFileName : string ;
 dbxTransaction : TDBXTransaction ;

  function GetSQL : string ;
  var
     sqlFields : string ;
     sqlParams : string ;

     procedure GetFieldsAndParams ;
     var
        x  : integer ;
     begin
       try
          with CDS do
          for x := 0 to Fields.Count - 1 do
             begin
                sqlFields := sqlFields +  Fields[ x ].FieldName + ',' ;
                sqlParams := sqlParams +  ':' + Fields[ x ].FieldName  + ',' ;
                with Params.CreateParam( Fields[ x ].DataType, Fields[ x ].Name, ptInput ) do
                  if Fields[ x ].IsNull then
                     Bound := False
                  else
                     Value := Fields[ x ].Value ;
             end ;
       except
             on E: Exception do
                Raise ;
       end ;

     end ;

  begin

     sqlFields := '' ;
     sqlParams := '' ;
     GetFieldsAndParams ;
     Delete ( sqlFields, Length( sqlFields ), 1 ) ;
     Delete ( sqlParams , Length( sqlParams ), 1 ) ;
     sqlStmt := format ( 'UPDATE OR INSERT INTO %s ( %s ) VALUES (  %s  ) MATCHING ( %s ) ', [ ATableName, sqlFields, sqlParams, AMatchingFields ] ) ;

  end;

begin

   LFileName := FTempFolder.TempPath + ATableName + '.$' ;
   Params := TParams.Create ;
   CDS := TClientDataSet.Create ( nil ) ;
   CDS.LoadFromFile( LFileName );
   dbxTransaction := TSQLConnection( FIDB.Connection ).BeginTransaction ;
   try
     try
       with CDS do
         while not eof do
           begin
             Params.Clear ;
             GetSQL ;
             //DoLog ( sqlStmt ) ;
             FIDB.Execute ( sqlStmt, Params ) ;
             next ;
           end;
     finally
       CDS.Free ;
       Params.free ;
     end ;
     TSQLConnection( FIDB.Connection ).CommitFreeAndNil( dbxTransaction );
   except
     TSQLConnection( FIDB.Connection ).RollbackFreeAndNil( dbxTransaction );
     Raise
   end ;
end;

procedure TClAg5InitTables.InitDEFTables ;
var
 cdsSource, cdsTarget : TClientDataSet ;
 LTableName, LMatchFields : string ;
 LDataVersion : integer ;
 p : TParams ;
 paramTableName, paramDataVersion, paramLastUpdate : TParam ;
const
 _SELECT_TARGET_DVERCONTROL =
   'TABLENAME, DATAVERSION FROM DVER$CONTROL ORDER BY TABLENAME' ;

 _UPDATE_DVERCONTROL =
          'UPDATE OR INSERT INTO DVER$CONTROL ( TABLENAME, DATAVERSION, LASTUPDATE )'
   +#13#10'VALUES ( :TABLENAME, :DATAVERSION, :LASTUPDATE )'
   +#13#10'MATCHING ( TABLENAME )' ;

begin

  cdsSource := TClientDataSet.Create( nil ) ;
  cdsSource.LoadFromFile( FTempFolder.TempPath + 'DVER$CONTROL.$');
  cdsSource.IndexFieldNames := 'SYNC_ORDER' ;
  cdsSource.First ;



  cdsTarget := nil ;
  FIDB.populateClientDataSet(cdsTarget, _SELECT_TARGET_DVERCONTROL );

  p := TParams.Create ;
  paramTableName   := p.CreateParam(ftString,    'TABLENAME',   ptInput) ;
  paramDataVersion := p.CreateParam(ftInteger,   'DATAVERSION', ptInput ) ;
  paramLastUpdate  := p.CreateParam(ftTimeStamp, 'LASTUPDATE',  ptInput ) ;
  paramLastUpdate.AsSQLTimeStamp := DateTimeToSQLTimeStamp ( now )  ;

  while not cdsSource.eof  do
    begin

        LTableName   := cdsSource.FieldByName( 'TABLENAME'    ).AsString ;
        LMatchFields := cdsSource.FieldByName( 'MATCH_FIELDS' ).AsString ;
        LDataVersion := cdsSource.FieldByName( 'DATAVERSION'  ).AsInteger ;

        if    (not cdsTarget.Locate('TABLENAME', LTableName, []))
           or (cdsTarget.FieldByName('DATAVERSION').AsInteger < LDataVersion) then
          begin
              ImportDefault ( LTableName, LMatchFields ) ;

              paramTableName.asString    := LTableName ;
              paramDataVersion.AsInteger := LDataVersion ;
              FIDB.Execute( _UPDATE_DVERCONTROL, p );
          end;

        cdsSource.Next ;
    end;
  p.Free ;
  cdsSource.Free ;
  cdsTarget.Free ;

end;


end.

