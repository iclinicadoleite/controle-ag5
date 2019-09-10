unit UConfigFieldsCDS;

interface

uses
  System.Generics.Collections, System.SysUtils, System.Classes, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Contnrs,
  Vcl.Forms, SqlExpr, Data.SqlTimSt, Datasnap.Provider, Vcl.Dialogs, Vcl.StdCtrls,
  DSIntf, Windows, StrUtils, Tc.DBRTL.AbstractDB, Tc.VCL.Application, Vcl.DbGrids, cdsSuppl;

type
  TConfigFieldsCDS = class(TInterfacedObject, IConfigFieldsCDS)
   private
     function GetDataSetID(AClientDataSet: TClientDataSet; ACdsAlias: String = '') : String;
     function IsHigherThanLimitOfChar( AText: String ): Boolean;
     function ConvertBoolToStr( AStatus : Boolean ): String;
   public
     procedure SaveConfigFieldsCDS( AClientDataSet: TClientDataSet; ACdsAlias: String = '' );
     function HasDifferentColumns(AClientDataSet: TClientDataSet; AStreamGridColumns: String; ACdsAlias: String = '' ): Boolean;
  end;

implementation

{ TConfigFieldsCDS }

function TConfigFieldsCDS.HasDifferentColumns(AClientDataSet: TClientDataSet; AStreamGridColumns: String; ACdsAlias: String = '' ): Boolean;
const
  _SQL_COLUMNS_DATASET=
            'SELECT C.ID_DATASET, C.FIELDS_NAME, C.FIELDS_CAPTION, C.FIELDS_VISIBLE'
     +#13#10'FROM SYS$COLUMNS_DATASET C'
     +#13#10'WHERE C.ID_DATASET = :ID_DATASET';
var
  tmpGridCol : TDBGrid ;
  I, J, LCountVisibleFields, LCountVisibleFieldsGrid: Integer;
  p: TParams;
  cds: TClientDataSet;
  LFields, LCaptions, LVisible: TArray<String>;
  LHasDiference, LFieldFound: Boolean;
  DataSetID : String;
  stm : TStream ;
begin
  //Declarar essa função na interface e ajustar o código da jvDBGridSuppl
  Result := False;

  if AStreamGridColumns = '' then
   begin
     Result := True;
     Exit;
   end;

  if (not Assigned( AClientDataSet )) and (ACdsAlias = '') then
   begin
     Result := True;
     Exit;
   end;

  DataSetID := GetDataSetID( AClientDataSet, ACdsAlias );

  cds := nil;
  p:= TParams.Create(nil);
  p.CreateParam(ftString, 'ID_DATASET', ptInput).AsString :=  DataSetID;
  TTcAbstractDB.GetByAlias('SESSION').populateClientDataSet( cds, _SQL_COLUMNS_DATASET, p ) ;

  if cds.IsEmpty then
   begin
     Result := True;
     cds.Free;
     p.Free;
     Exit;
   end;

  LFields := cds.FieldByName('FIELDS_NAME').AsString.Split([';']);
  LCaptions := cds.FieldByName('FIELDS_CAPTION').AsString.Split([';']);
  LVisible := cds.FieldByName('FIELDS_VISIBLE').AsString.Split([';']);


  tmpGridCol :=  TDBGrid.Create(nil);
  stm := TStringStream.Create ( AStreamGridColumns ) ;
  tmpGridCol.Columns.LoadFromStream( stm );
  LHasDiference := False;
  LFieldFound := True;
  LCountVisibleFieldsGrid:= 0;
  LCountVisibleFields := 0;

  for I := 0 to tmpGridCol.Columns.Count -1 do
   begin
      if tmpGridCol.Columns[I].Visible then
         LCountVisibleFieldsGrid := LCountVisibleFieldsGrid + 1;
   end;

  for I := Low( LVisible ) to High( LVisible ) do
   begin
     if (LVisible[I]) = 'T' then
        LCountVisibleFields := LCountVisibleFields + 1;
   end;

  if ( LCountVisibleFieldsGrid > LCountVisibleFields ) then
   begin
     Result:= True;
     tmpGridCol.Free;
     p.Free;
     Exit;
   end;


  //for I := 0 to tmpGridCol.Columns.Count -1 do
  for J := Low( LFields ) to High( LFields ) do
   begin
    if LHasDiference then
       Break;

    LHasDiference := True;
    LFieldFound := False;
     //for J := Low( LFields ) to High( LFields )do
     for I := 0 to tmpGridCol.Columns.Count -1 do
      begin
        if tmpGridCol.Columns[I].FieldName  = LFields[J] then
         begin
           LFieldFound := True;
           LHasDiference := False;
           if not LHasDiference then
             LHasDiference := (tmpGridCol.Columns[I].Title.Caption <> LCaptions[J]) and
                              (tmpGridCol.Columns[I].Title.Caption <> tmpGridCol.Columns[I].FieldName);
           if not LHasDiference then
             LHasDiference := ConvertBoolToStr(tmpGridCol.Columns[I].Visible) <> LVisible[J];
         end;
      end;

    if not LFieldFound then
     begin
       LHasDiference := LVisible[J] = 'T' ;
       if LHasDiference then
          Break;
     end;

   end;

  Result := LHasDiference;

  tmpGridCol.Free;
  p.Free;

end;

function TConfigFieldsCDS.ConvertBoolToStr(AStatus: Boolean): String;
begin
  if AStatus then
    Result:= 'T'
  else
    Result := 'F';
end;

function TConfigFieldsCDS.GetDataSetID(AClientDataSet: TClientDataSet; ACdsAlias: String = '') : String;
var
 LDataSetID: String;
begin
  if ACdsAlias <> '' then
    LDataSetID := ACdsAlias
  else
   begin
     LDataSetID := '';
     if Assigned(AClientDataSet.Owner) then
       LDataSetID := AClientDataSet.Owner.ClassName;
     LDataSetID := LDataSetID +'_'+ AClientDataSet.Name;
   end;

  Result :=  LDataSetID ;
end;

function TConfigFieldsCDS.IsHigherThanLimitOfChar( AText: String ): Boolean;
begin
  Result := Length( AText ) > 1024;
end;

procedure TConfigFieldsCDS.SaveConfigFieldsCDS(AClientDataSet: TClientDataSet;
  ACdsAlias: String);
const
  _INSERT_OR_UPDATE_SYS_COLUMNS_DATASET =
           'UPDATE OR INSERT INTO SYS$COLUMNS_DATASET (ID_DATASET, FIELDS_NAME, FIELDS_CAPTION, FIELDS_VISIBLE)'
     +#13#10'VALUES (:ID_DATASET, :FIELDS_NAME, :FIELDS_CAPTION, :FIELDS_VISIBLE)'
     +#13#10'MATCHING (ID_DATASET)';
var
  I: Integer;
  LFields, LCaptions, LVisible: String;
  p: TParams;
  DataSetID: String;
begin

  if not Assigned( AClientDataSet ) then
    Exit;

  if not Assigned( TTcAbstractDB.GetByAlias('SESSION') ) then
    Exit;

  for I := 0 to AClientDataSet.Fields.Count -1 do
   begin
     if not (AClientDataSet.Fields[ I ] is TDataSetField) then
      begin
        LFields := LFields + AClientDataSet.Fields[I].FieldName + ';';
        LCaptions := LCaptions + AClientDataSet.Fields[I].DisplayLabel + ';';
        LVisible := LVisible + ConvertBoolToStr(AClientDataSet.Fields[I].Visible)+ ';';
      end;
   end;

  if ( LFields = '' ) or ( IsHigherThanLimitOfChar( LFields ) ) then
   Exit;

  DataSetID := GetDataSetID( AClientDataSet, ACdsAlias );

  p:= TParams.Create(nil);
  p.CreateParam(ftString, 'ID_DATASET', ptInput).AsString := DataSetID;
  p.CreateParam(ftString, 'FIELDS_NAME', ptInput).AsString := LFields;
  p.CreateParam(ftString, 'FIELDS_CAPTION', ptInput).AsString := LCaptions;
  p.CreateParam(ftString, 'FIELDS_VISIBLE', ptInput).AsString := LVisible;

  TTcAbstractDB.GetByAlias('SESSION').Execute( _INSERT_OR_UPDATE_SYS_COLUMNS_DATASET, p );
  p.Free;
end;

end.
