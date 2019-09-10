unit UConfigIndexCDS;

interface


uses
  System.Generics.Collections, System.SysUtils, System.Classes, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Contnrs,
  Vcl.Forms, SqlExpr, Data.SqlTimSt, Datasnap.Provider, Vcl.Dialogs, Vcl.StdCtrls,
  DSIntf, Windows, StrUtils, Tc.DBRTL.AbstractDB, Tc.VCL.Application, cdsSuppl;

type
  TConfigIndexCDS = class(TInterfacedObject, IConfigIndexCDS)
     private
       FClientDataSet : TClientDataSet;
       FKSysUser: String;
       FDataSetID : String;
       FFields: String;
       FDescFields: String;
       FCaseInsFields: String;
       FOptions : String;
       FIndexOptions: TIndexOptions;
       FIndexName : String;

       procedure SetClientDataSet(const Value: TClientDataSet);
//       procedure SetCaseInsFields(const Value: String);
//       procedure SetDataSetID(const Value: String);
//       procedure SetDescFields(const Value: String);
//       procedure SetFields(const Value: String);
//       procedure SetOptions(const Value: String);
//       procedure SetIndexOptions(const Value: TIndexOptions);
       procedure SetKSysUser(const Value: String);
       function SearchIndexUserDB: Boolean;
       procedure SortClientDataSet;
       procedure ConvertOptionsStrToIndexOptions;
       procedure ConvertIndexOptionsToOptionsStr;
       function GetIndexDefsFromDataSet: Boolean;
       function IsHigherThanLimitOfChar: Boolean;
       function CheckFieldsExists: Boolean;
       function GetClientDataSet: TClientDataSet;
       function GetKSysUser: String;
     public
       property ClientDataSet: TClientDataSet read GetClientDataSet write SetClientDataSet;
       (*
       property KSysUser : String read GetKSysUser write SetKSysUser;
       property DataSetID : String read FDataSetID write SetDataSetID;
       property Fields : String read FFields write SetFields;
       property DescFields : String read FDescFields write SetDescFields;
       property CaseInsFields : String read FCaseInsFields write SetCaseInsFields;
       property Options : String read FOptions  write SetOptions;
       property IndexOptions: TIndexOptions read FIndexOptions write SetIndexOptions;
       *)
       procedure SortClientDataSetByIndexUser( AClientDataSet: TClientDataSet; ACdsAlias: String = '' ) ;
       procedure SaveSortIndex ( AClientDataSet: TClientDataSet; ACdsAlias: String = '' );
       constructor Create;
       destructor Destroy;override;
  end;

implementation

uses

   Tc.RTL.Exceptions ;

{ TConfigIndexCDS }
constructor TConfigIndexCDS.Create;
begin
  FClientDataSet := nil;
  //FIndexName := '_Idx_IndexUser';
  FIndexName := '__Idx';
  FKSysUser := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.UserID ;
end;




destructor TConfigIndexCDS.Destroy;
begin
  FClientDataSet := nil;
  inherited;
end;

procedure TConfigIndexCDS.SortClientDataSetByIndexUser( AClientDataSet: TClientDataSet; ACdsAlias: String = '' ) ;
begin

  if FKSysUser = '' then
    FKSysUser := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.UserID ;

  if not Assigned( AClientDataSet ) then
    Exit;

  SetClientDataSet( AClientDataSet );

  if ACdsAlias <> '' then
    FDataSetID := ACdsAlias;

  if (not SearchIndexUserDB) or
     (not FClientDataSet.Active) or
     (not CheckFieldsExists) then
    Exit;

  SortClientDataSet;

end;

procedure TConfigIndexCDS.SaveSortIndex( AClientDataSet: TClientDataSet; ACdsAlias: String = '' );
const
  _INSERT_OR_UPDATE_INDEX_USER =
           'UPDATE OR INSERT INTO SYS$USER_INDEX'
    +#13#10'      (KSYS$USER, DATASET_ID, FIELDS, DESC_FIELDS, CASE_INS_FIELDS,OPTIONS)'
    +#13#10'VALUES (:KSYS$USER, :DATASET_ID, :FIELDS, :DESC_FIELDS, :CASE_INS_FIELDS, :OPTIONS)'
    +#13#10'MATCHING ( KSYS$USER, DATASET_ID )';
var
  p: TParams;
begin
  if FKSysUser = '' then
    FKSysUser := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.UserID ;

  if not Assigned( AClientDataSet ) then
    Exit;

  SetClientDataSet( AClientDataSet );

  if ACdsAlias <> '' then
    FDataSetID := ACdsAlias;

  try
    if not GetIndexDefsFromDataSet then
      Exit;
  except On E : exception do
    RaiseException (
        E
      , UnitName
      , ClassName
      , 'SaveSortIndex'
      , Format (
             '%s(%s)'
           , [
                AClientDataSet.ClassName
              + AClientDataSet.Name
             ]
        )
    ) ;
  end;

  if FFields = '' then
    Exit;

  if IsHigherThanLimitOfChar then
    Exit;

  ConvertIndexOptionsToOptionsStr;

  p:= TParams.Create(nil);
  p.CreateParam(ftString, 'KSYS$USER', ptInput).AsString := FKSysUser;
  p.CreateParam(ftString, 'DATASET_ID', ptInput).AsString := FDataSetID;

  if FFields <> '' then
    p.CreateParam(ftString, 'FIELDS', ptInput).AsString := FFields
  else
    p.CreateParam(ftString, 'FIELDS', ptInput).Clear;

  if FDescFields <> '' then
    p.CreateParam(ftString, 'DESC_FIELDS', ptInput).AsString := FDescFields
  else
    p.CreateParam(ftString, 'DESC_FIELDS', ptInput).Clear;

  if FCaseInsFields <> '' then
    p.CreateParam(ftString, 'CASE_INS_FIELDS', ptInput).AsString := FCaseInsFields
  else
    p.CreateParam(ftString, 'CASE_INS_FIELDS', ptInput).Clear;

  if FOptions <> '' then
    p.CreateParam(ftString, 'OPTIONS', ptInput).AsString := FOptions
  else
    p.CreateParam(ftString, 'OPTIONS', ptInput).Clear;

  TTcAbstractDB.GetByAlias('SESSION').Execute(_INSERT_OR_UPDATE_INDEX_USER, p);

  p.Free;
end;

function TConfigIndexCDS.SearchIndexUserDB: Boolean;
const
  _SELECT_INDEX_USER =
          'SELECT UIDX.KSYS$USER, UIDX.DATASET_ID, UIDX.FIELDS,'
   +#13#10'       UIDX.DESC_FIELDS, UIDX.CASE_INS_FIELDS, UIDX.OPTIONS '
   +#13#10'FROM SYS$USER_INDEX UIDX'
   +#13#10'WHERE UIDX.KSYS$USER = :KUSER AND UIDX.DATASET_ID = :DATASET_ID';
var
  cds: TClientDataSet;
  p: TParams;
begin
  Result := False;
  cds:= nil;
  p:= TParams.Create(nil);
  p.CreateParam(ftString, 'KUSER', ptInput).AsString := FKSysUser;
  p.CreateParam(ftString, 'DATASET_ID', ptInput).AsString := FDataSetID;

  if not Assigned ( TTcAbstractDB.GetByAlias('SESSION') ) then
     exit ;

  TTcAbstractDB.GetByAlias('SESSION').populateClientDataSet( cds, _SELECT_INDEX_USER, p ) ;

  Result := not cds.IsEmpty;
  if Result then
   begin
     FFields := cds.FieldByName('FIELDS').AsString;
     FDescFields := cds.FieldByName('DESC_FIELDS').AsString;
     FCaseInsFields := cds.FieldByName('CASE_INS_FIELDS').AsString;
     FOptions :=  cds.FieldByName('OPTIONS').AsString;
   end;

  cds.Free;
  p.Free;
end;

procedure TConfigIndexCDS.SortClientDataSet;
var
  LIndex : Integer;
begin
  ConvertOptionsStrToIndexOptions;
 // FClientDataSet.IndexDefs.Clear;

 LIndex := FClientDataSet.IndexDefs.IndexOf('__Idx'); //Indice criado na unit JVDBGridSuppl
  if LIndex > -1 then
   begin
     FClientDataSet.IndexDefs[ LIndex ].Fields := FFields ;
     FClientDataSet.IndexDefs[ LIndex ].DescFields := FDescFields ;
     FClientDataSet.IndexDefs[ LIndex ].Options := FIndexOptions;
     FClientDataSet.IndexDefs[ LIndex ].CaseInsFields := FCaseInsFields;
   end
  else
    FClientDataSet.AddIndex(FIndexName, FFields, FIndexOptions, FDescFields, FCaseInsFields);

  FClientDataSet.IndexName := FIndexName;
end;

function TConfigIndexCDS.GetClientDataSet: TClientDataSet;
begin
  Result := FClientDataSet;
end;

function TConfigIndexCDS.GetIndexDefsFromDataSet: Boolean;
var
  LIndex : Integer;
begin
  Result := False;

  FClientDataSet.IndexDefs.Update;

  LIndex := FClientDataSet.IndexDefs.IndexOf('__Idx'); //Indice criado na unit JVDBGridSuppl
  if LIndex > -1 then
   begin
     FFields := FClientDataSet.IndexDefs[ LIndex ].Fields;
     FDescFields := FClientDataSet.IndexDefs[ LIndex ].DescFields;
     FIndexOptions := FClientDataSet.IndexDefs[ LIndex ].Options;
     FCaseInsFields := FClientDataSet.IndexDefs[ LIndex ].CaseInsFields;
     Result := True;
   end;
end;

function TConfigIndexCDS.GetKSysUser: String;
begin
  Result := FKSysUser;
end;

function TConfigIndexCDS.IsHigherThanLimitOfChar: Boolean;
begin
  Result := Length(FFields) > 1024;
end;

function TConfigIndexCDS.CheckFieldsExists: Boolean;
var
  LArrayFields: TArray<String>;
  I : Integer;
begin
  Result := True;

  LArrayFields := FFields.Split([';']);

  for I := Low(LArrayFields) to High(LArrayFields) do
   begin
     if FClientDataSet.FindField( LArrayFields[I] ) = nil then
        Result := False;
   end;

end;

procedure TConfigIndexCDS.ConvertIndexOptionsToOptionsStr;
begin
  FOptions := '';
  if ixPrimary in FIndexOptions then
     FOptions := FOptions +';ixPrimary';
  if ixUnique in FIndexOptions then
     FOptions := FOptions +';ixUnique';
  if ixDescending in FIndexOptions then
     FOptions := FOptions +';ixDescending';
  if ixCaseInsensitive in FIndexOptions then
     FOptions := FOptions +';ixCaseInsensitive';
  if ixExpression in FIndexOptions then
     FOptions := FOptions +';ixExpression';
  if ixNonMaintained in FIndexOptions then
     FOptions := FOptions +';ixNonMaintained';

  if FOptions <> '' then
    FOptions := Copy(FOptions, 2, Length(FOptions));
end;

procedure TConfigIndexCDS.ConvertOptionsStrToIndexOptions;
var
 LArrayOptions: TArray<String>;
begin
  FIndexOptions := [];
  LArrayOptions := FOptions.Split([';']);

  if ( MatchStr('ixPrimary', LArrayOptions) ) then
    FIndexOptions := FIndexOptions + [ixPrimary];
  if ( MatchStr('ixUnique', LArrayOptions) ) then
    FIndexOptions := FIndexOptions + [ixUnique];
  if ( MatchStr('ixDescending', LArrayOptions) ) then
    FIndexOptions := FIndexOptions + [ixDescending];
  if ( MatchStr('ixCaseInsensitive', LArrayOptions) ) then
    FIndexOptions := FIndexOptions + [ixCaseInsensitive];
  if ( MatchStr('ixExpression', LArrayOptions) ) then
    FIndexOptions := FIndexOptions + [ixExpression];
  if ( MatchStr('ixNonMaintained', LArrayOptions) ) then
    FIndexOptions := FIndexOptions + [ixNonMaintained];
end;

//procedure TConfigIndexCDS.SetCaseInsFields(const Value: String);
//begin
//  FCaseInsFields := Value;
//end;

procedure TConfigIndexCDS.SetClientDataSet(const Value: TClientDataSet);
begin

  if Assigned(FClientDataSet) then
    FClientDataSet := nil;

  FClientDataSet := Value;
  FDataSetID := '';
  if Assigned(FClientDataSet.Owner) then
   FDataSetID := FClientDataSet.Owner.ClassName;
  FDataSetID := FDataSetID +'_'+ FClientDataSet.Name;
end;

//procedure TConfigIndexCDS.SetDataSetID(const Value: String);
//begin
//  FDataSetID := Value;
//end;

//procedure TConfigIndexCDS.SetDescFields(const Value: String);
//begin
//  FDescFields := Value;
//end;

//procedure TConfigIndexCDS.SetFields(const Value: String);
//begin
//  FFields := Value;
//end;

//procedure TConfigIndexCDS.SetIndexOptions(const Value: TIndexOptions);
//begin
//  FIndexOptions := Value;
//end;

//procedure TConfigIndexCDS.SetOptions(const Value: String);
//begin
//  FOptions := Value;
//end;

procedure TConfigIndexCDS.SetKSysUser(const Value: String);
begin
  FKSysUser := Value;
end;


end.
