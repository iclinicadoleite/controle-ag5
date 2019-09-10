unit UZoo_SanidadeEscoresDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  T_dtmBASE = class ( UdtmSYS_BASE.T_dtmBASE )
  protected
    procedure RebuildKeys ;
  end ;

  TZoo_SanidadeEscoresDatamodule = class(T_dtmBASE)
    cdsEscores: TClientDataSet;
    dspEscores: TDataSetProvider;
    sqlEscores: TTcSQLDataSet;
    sqlEscoresKZOO_E: TStringField;
    sqlEscoresKZOO_ANIMAL_FEMEA: TStringField;
    sqlEscoresDATA: TSQLTimeStampField;
    sqlEscoresLOTE: TStringField;
    sqlEscoresKCAD_FUNCIONARIO: TStringField;
    sqlEscoresNOMEFUNCIONARIO: TStringField;
    cdsEscoresKZOO_E: TStringField;
    cdsEscoresKZOO_ANIMAL_FEMEA: TStringField;
    cdsEscoresDATA: TSQLTimeStampField;
    cdsEscoresLOTE: TStringField;
    cdsEscoresKCAD_FUNCIONARIO: TStringField;
    cdsEscoresNOMEFUNCIONARIO: TStringField;
    cdsEscoresBRINCO: TStringField;
    cdsEscoresNOMEESTABULO: TStringField;
    cdsListaEscores: TClientDataSet;
    dspListaEscores: TDataSetProvider;
    sqlListaEscores: TTcSQLDataSet;
    sqlListaEscoresKZOO_CFGESCORE: TStringField;
    sqlListaEscoresTABLE_ID: TIntegerField;
    sqlListaEscoresNOME: TStringField;
    sqlListaEscoresOBS: TMemoField;
    cdsListaEscoresKZOO_CFGESCORE: TStringField;
    cdsListaEscoresTABLE_ID: TIntegerField;
    cdsListaEscoresNOME: TStringField;
    cdsListaEscoresOBS: TMemoField;
    sqlListaEscoresTIPOESCORE: TStringField;
    sqlListaEscoresSIGLA: TStringField;
    cdsListaEscoresTIPOESCORE: TStringField;
    cdsListaEscoresSIGLA: TStringField;
    procedure cdsListaEscoresBeforeOpen(DataSet: TDataSet);
    procedure cdsEscoresNOMEFUNCIONARIOSetText(Sender: TField;
      const Text: string);
  private
    FKeyEscore: string;
    FTableExists: boolean;
    FFieldAdded: boolean;
    FTableName: string;
    procedure SetKeyEscore(const Value: string);
    procedure CheckTableExists ;
    procedure AddFieldIntoSQL ( AFieldName : String ; AFieldType : integer ; AFieldLabel : String );
    function FieldTypeToFB ( AFieldType : integer ) : string ;
    procedure SetTableExists(const Value: boolean);
    procedure SetFieldAdded(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    cdsTable : TClientDataSet ;
    cdsFields : TClientDataSet ;
    property TableExists : boolean  read FTableExists write SetTableExists;
    property FieldAdded : boolean   read FFieldAdded write SetFieldAdded;
    property KeyEscore : string  read FKeyEscore write SetKeyEscore;
    property TableName : string  read FTableName ;
    procedure OpenTables ; override ;
    function AddBrinco ( ABrinco : string ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure ApplyUpdates ; override ;
    procedure RemoveRecord ;
    function LocateBrinco ( ABrinco : string  ) : boolean ;
    function AddByKey ( AKey : string ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
  end;

implementation

uses Exceptions, UDBZootecnico, CDSSuppl, CLAg5Types ;

{$R *.dfm}

const
  _CREATE_TABLE =
   'CREATE TABLE %0:s ('
      +#13#10'   K%0:s            SYS$PKGUID20,'
      +#13#10'   KZOO_ANIMAL_FEMEA     SYS$FKGUID20_NN,'
//      +#13#10'   BRINCO                ZOO$BRINCO,'
      +#13#10'   DATA                  SYS$DATE_NN,'
      +#13#10'   LOTE                  ZOO$LOTE,'
      +#13#10'   KCAD_FUNCIONARIO      SYS$FKGUID20,'
      +#13#10'   NOMEFUNCIONARIO       SYS$DESCR,'
      +#13#10'   CONSTRAINT PK%0:s PRIMARY KEY (K%0:s),'
      +#13#10'   CONSTRAINT FK%0:s FOREIGN KEY (KZOO_ANIMAL_FEMEA)'
      +#13#10'      REFERENCES ZOO_ANIMAIS_FEMEA (KZOO_ANIMAL_FEMEA) ON DELETE CASCADE ON UPDATE CASCADE'
      +#13#10')' ;

   _COMMENT_TABLE = 'COMMENT ON TABLE %s IS ''%s''' ;

   _TABLE_DATA = '* FROM ZOO_CFGESCORES WHERE KZOO_CFGESCORE = :KZOO_CFGESCORE' ;
(*
   _TABLE_SEARCH =
//             ' ''ZOO_E_'' || E.TIPOESCOPO || E.TABLE_ID TABLE_NAME,'
      +#13#10' ''F'' || F.field_id FIELD_NAME,'
      +#13#10' F.field_type,'
      +#13#10' F.sigla,'
      +#13#10' R.RDB$FIELD_ID'
      +#13#10'from ZOO_CFGESCORE_FIELDS F'
//      +#13#10'LEFT JOIN ZOO_CFGESCORES E ON ( E.KZOO_CFGESCORE = F.KZOO_CFGESCORE )'
      +#13#10'LEFT JOIN RDB$RELATION_FIELDS R'
//      +#13#10'  ON    (R.RDB$RELATION_NAME = ''ZOO_E_'' || E.TIPOESCOPO || E.TABLE_ID'
      +#13#10'  ON    (R.RDB$RELATION_NAME = :TABLENAME'
      +#13#10'    AND R.RDB$FIELD_NAME = ''F'' || F.FIELD_ID )'
      +#13#10'WHERE F.KZOO_CFGESCORE = :KZOO_CFGESCORE and F.ATIVO = ''T''' ;
*)

   _TABLE_SEARCH =
             ' ''F'' || F.field_id FIELD_NAME,'
      +#13#10' F.field_type,'
      +#13#10' F.sigla,'
      +#13#10' R.RDB$FIELD_ID'
      +#13#10'from ZOO_CFGESCORE_FIELDS F'
      +#13#10'LEFT JOIN RDB$RELATION_FIELDS R'
      +#13#10'  ON    (R.RDB$RELATION_NAME = :TABLENAME'
      +#13#10'    AND R.RDB$FIELD_NAME = ''F'' || F.FIELD_ID )'
      +#13#10'WHERE F.KZOO_CFGESCORE = :KZOO_CFGESCORE and F.ATIVO = ''T''' ;


   _ALTER_TABLE = 'ALTER TABLE %s %s' ;

   _ADD_FIELD = 'ADD %s %s,' ;


procedure TZoo_SanidadeEscoresDatamodule.CheckTableExists;
var
  p : TParams ;
  AddedFields : string ;
begin

  if Assigned ( cdsFields )  then
    FreeAndNil ( cdsFields ) ;

  if cdsEscores.Active then
    begin
     cdsEscores.EmptyDataSet;
     cdsEscores.Close ;
    end;

  while cdsEscores.Fields.Count > 8 do
      cdsEscores.Fields[ cdsEscores.Fields.Count -1 ].free ;

  while sqlEscores.Fields.Count > 6 do
      sqlEscores.Fields[ sqlEscores.Fields.Count -1 ].free ;

  if Assigned ( cdsTable )  then
     FreeAndNil ( cdsTable ) ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KZOO_CFGESCORE', ptInput ).asString := FKeyEscore ;
  DBResources['ZOOTECNICO'].populateClientDataSet ( cdsTable, _TABLE_DATA, p ) ;

  FTableName :=  'ZOO_E_' + cdsTable.fieldByName (  'TIPOESCORE' ).asString + cdsTable.fieldByName (  'TABLE_ID' ).asString ;

  p.CreateParam( ftString, 'TABLENAME', ptInput ).asString := FTableName ;
  DBResources['ZOOTECNICO'].populateClientDataSet ( cdsFields, _TABLE_SEARCH, p ) ;

  p.free ;


  with cdsFields do
   while ( not eof ) do
     begin
       FTableExists := not fieldByName (  'RDB$FIELD_ID' ).isNull ;
       if FTableExists then
          Break ;
       next ;
     end;

  if not TableExists then
     DBResources['ZOOTECNICO'].ExecuteDirect( Format ( _CREATE_TABLE, [TableName] ) ) ;

  AddedFields := EmptyStr ;

  cdsFields.first ;
  with cdsFields do
   while ( not eof ) do
     begin
       if fieldByName (  'RDB$FIELD_ID' ).isNull then
          AddedFields := AddedFields + Format ( _ADD_FIELD, [ fieldByName (  'FIELD_NAME' ).asString, FieldTypeToFB (  fieldByName (  'FIELD_TYPE' ).asInteger ) ] ) ;
       AddFieldIntoSQL (  fieldByName (  'FIELD_NAME' ).asString, fieldByName (  'FIELD_TYPE' ).asInteger, fieldByName (  'SIGLA' ).asString ) ;
       next ;
     end;

   sqlEscoresKZOO_E.FieldName := 'K' + TableName ;
   cdsEscoresKZOO_E.FieldName := 'K' + TableName ;

   FFieldAdded := ( AddedFields <> EmptyStr ) ;

   if ( AddedFields <> EmptyStr ) then
     begin
        System.Delete( AddedFields, Length ( AddedFields ), 1 ) ;
        DBResources['ZOOTECNICO'].ExecuteDirect( Format ( _ALTER_TABLE, [ TableName, AddedFields ] ) ) ;
     end ;

   sqlEscores.CommandText := 'SELECT * FROM ' + TableName  ;
   TCDSSuppl.CreateDataSet( cdsEscores ) ;
   RebuildKeys ;
end;


constructor TZoo_SanidadeEscoresDatamodule.Create(AOwner: TComponent);
begin
  cdsFields := nil ;
  inherited;
end;

destructor TZoo_SanidadeEscoresDatamodule.Destroy;
begin
  if Assigned ( cdsFields ) then
    cdsFields.Free ;
  if Assigned ( cdsTable ) then
    cdsTable.Free ;
  inherited;
end;

function TZoo_SanidadeEscoresDatamodule.FieldTypeToFB(AFieldType : integer  ): string;
begin

 case AFieldType of
    1 : Result := 'SYS$DESCR' ;
    2 : Result := 'SYS$INT' ;
    3 : Result := 'SYS$FLOAT' ;
    4 : Result := 'SYS$DATE' ;
    5 : Result := 'SYS$BLOBTEXT' ;
 end;

(*
1  Descrição
2  Numero Inteiro
3  Numero Fracionario
4  Data
5  Hora
6  Observações
*)
end;

function TZoo_SanidadeEscoresDatamodule.LocateBrinco(ABrinco: string): boolean;
begin
   Result := cdsEscores.Locate( 'BRINCO', ABrinco, [] ) ;
end;

procedure TZoo_SanidadeEscoresDatamodule.OpenTables;
begin
  TCDSSuppl.Open (  cdsListaEscores ) ;
end;


procedure TZoo_SanidadeEscoresDatamodule.RemoveRecord;
begin
   if not cdsEscores.isEmpty then
    cdsEscores.Delete ;
end;

procedure TZoo_SanidadeEscoresDatamodule.SetFieldAdded(const Value: boolean);
begin
  FFieldAdded := Value;
end;

procedure TZoo_SanidadeEscoresDatamodule.SetFuncionario(AKFuncionario,
  ANomeFuncionario: string);
begin
   if not ( cdsEscores.State in [dsInsert, dsEdit] ) then
      cdsEscores.Edit ;
   cdsEscoresNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
   cdsEscoresKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TZoo_SanidadeEscoresDatamodule.SetKeyEscore(const Value: string);
begin
  FKeyEscore := Value;
  CheckTableExists ;
//  OpenTables ;
end;


procedure TZoo_SanidadeEscoresDatamodule.SetTableExists(const Value: boolean);
begin
  FTableExists := Value;
end;


function TZoo_SanidadeEscoresDatamodule.AddBrinco(ABrinco: string; AData: TDateTime;
  AKFuncionario, ANomeFuncionario: string): boolean;
var
    cds : TClientDataSet ;
    p : TParams ;
begin
    Result := cdsEscores.Locate( 'BRINCO', ABrinco, [] ) ;
    if Result then
      begin
         cdsEscores.Edit ;
         cdsEscoresKCAD_FUNCIONARIO.asString  := AKFuncionario ;
         cdsEscoresNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
         cdsEscoresDATA.asDateTime            := AData ;
         exit ;
      end ;

    p := TParams.Create ;
    p.CreateParam( ftString,  'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString,  'BRINCO', ptInput ).asString  := ABrinco ;
    p.CreateParam( ftInteger, 'STATUS_DESCARTE', ptInput ).asInteger  := _ST_STATUS_ANIMAL_DESCARTADO ;

    cds := nil ;
    try
       DBResources['ZOOTECNICO'].populateClientDataSet( cds,
                 'A.KZOO_ANIMAL,  A.BRINCO, A.NOMEESTABULO, F.LOTE FROM ZOO_ANIMAIS A'
          +#13#10'JOIN ZOO_ANIMAIS_FEMEA F ON ( F.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL )'
          +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( A.BRINCO = :BRINCO ) AND (A.STATUS <> :STATUS_DESCARTE)', p ) ;
       Result := not cds.IsEmpty ;

       if Result then
         with cds do
           begin
             cdsEscores.Append ;
             GetKey ( cdsEscoresKZOO_E ) ;
             cdsEscoresKZOO_ANIMAL_FEMEA.asString := fieldByName ( 'KZOO_ANIMAL' ).asString  ;
             cdsEscoresBRINCO.asString            := fieldByName ( 'BRINCO' ).asString       ;
             cdsEscoresNOMEESTABULO.asString      := fieldByName ( 'NOMEESTABULO' ).asString ;
             cdsEscoresKCAD_FUNCIONARIO.asString  := AKFuncionario ;
             cdsEscoresNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
             cdsEscoresDATA.asDateTime            := AData ;
             cdsEscoresLOTE.asString              := fieldByName ( 'LOTE' ).asString ; ;
           end
//         else
//            raise Warning.Create('Brinco não encontrado');

    finally
       cds.Free ;
       p.free ;
    end;


end;

function TZoo_SanidadeEscoresDatamodule.AddByKey(AKey: string; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
var
    cds : TClientDataSet ;
    p : TParams ;
begin

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString  := AKey ;
    cds := nil ;
    try
       DBResources['ZOOTECNICO'].populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( KZOO_ANIMAL = :KZOO_ANIMAL )', p ) ;
       Result := not cds.IsEmpty ;

       if Result then
         with cds do
           begin
             cdsEscores.Append ;
             GetKey ( cdsEscoresKZOO_E ) ;
             cdsEscoresKZOO_ANIMAL_FEMEA.asString := fieldByName ( 'KZOO_ANIMAL' ).asString  ;
             cdsEscoresBRINCO.asString            := fieldByName ( 'BRINCO' ).asString       ;
             cdsEscoresNOMEESTABULO.asString      := fieldByName ( 'NOMEESTABULO' ).asString ;
             cdsEscoresKCAD_FUNCIONARIO.asString  := AKFuncionario ;
             cdsEscoresNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
             cdsEscoresDATA.asDateTime            := AData ;
           end
         else
            raise Warning.Create('Brinco não encontrado');

    finally
       cds.Free ;
       p.free ;
    end;

end;

procedure TZoo_SanidadeEscoresDatamodule.AddFieldIntoSQL(AFieldName: String;  AFieldType: integer ; AFieldLabel : String );
var
  NewField : TField ;
begin

   // build for sql
   case AFieldType of
      1 : NewField := TStringField.Create( self)        ; // 'SYS$DESCR'
      2 : NewField := TIntegerField.Create( self )      ; // 'SYS$INT'
      3 : NewField := TFloatField.Create( self )        ; // 'SYS$FLOAT'
      4 : NewField := TSQLTimeStampField.Create( self ) ; // 'SYS$DATE'
      5 : NewField := TMemoField.Create( self)          ; // 'SYS$BLOBTEXT'
   end;

   with NewField do
     begin
        FieldName    := AFieldName ;
        DataSet      := sqlEscores ;
        DisplayLabel := AFieldLabel ;
        if ClassType = TStringField then
            Size := 128 ;
     end;

   // build for CDS
   case AFieldType of
      1 : NewField := TStringField.Create( self)        ; // 'SYS$DESCR'
      2 : NewField := TIntegerField.Create( self )      ; // 'SYS$INT'
      3 : NewField := TFloatField.Create( self )        ; // 'SYS$FLOAT'
      4 : NewField := TSQLTimeStampField.Create( self ) ; // 'SYS$DATE'
      5 : NewField := TMemoField.Create( self)          ; // 'SYS$BLOBTEXT'
   end;

   with NewField do
     begin
        FieldName    := AFieldName ;
        DataSet      := cdsEscores ;
        DisplayLabel := AFieldLabel ;
        if ClassType = TStringField then
            Size := 128 ;
     end;


end;

procedure TZoo_SanidadeEscoresDatamodule.ApplyUpdates;
begin
  TCDSSuppl.ApplyUpdates(cdsEscores);
  cdsEscores.EmptyDataSet ;
end;

procedure TZoo_SanidadeEscoresDatamodule.cdsEscoresNOMEFUNCIONARIOSetText(Sender: TField;
  const Text: string);
begin
  Sender.asString := Text ;
  cdsEscoresKCAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_SanidadeEscoresDatamodule.cdsListaEscoresBeforeOpen(DataSet: TDataSet);
begin
    cdsListaEscores.Params.ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
end;

{ T_dtmBASE }

procedure T_dtmBASE.RebuildKeys;
begin
  self.GetPrimaryKeysFields ;
end;

end.
