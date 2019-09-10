unit UdtmZoo_EscoreAnimal;

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

  TdtmZoo_EscoreAnimal = class(T_dtmBASE)
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
    procedure cdsEscoresNewRecord(DataSet: TDataSet);
  private
    FKeyEscore: string;
    FTableName: string;
    FMasterSource: TDataSource;
    FDadosFemea: TDataSource;
    procedure SetKeyEscore(const Value: string);
    procedure SetMasterSource(const Value: TDataSource);
    procedure SetDadosFemea(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
    property KeyEscore : string  read FKeyEscore write SetKeyEscore;
    procedure OpenTables ; override ;
    function AddBrinco ( ABrinco : string ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
    property TableName : string read FTableName ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    property DadosFemea : TDataSource  read FDadosFemea write SetDadosFemea;
  end;

  TEscoreSuppl = class
  private
    FClientDataSet : TClientDataSet ;
    FSQLDataSet  : TTcSQLDataSet ;
    function FieldTypeToFB ( AFieldType : integer ) : string ;
    procedure AddFieldIntoSQL ( AFieldName : String ; AFieldType : integer ; AFieldLabel : String );
  public
    class function CheckTableExists ( AKeyEscore : string  ; AClientDataSet : TClientDataSet ; ASQLDataSet : TTcSQLDataSet ) : string ;
  end ;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, Exceptions, CDSSuppl;

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



procedure TdtmZoo_EscoreAnimal.cdsEscoresNewRecord(DataSet: TDataSet);
begin
   GetKey ( cdsEscoresKZOO_E ) ;
   cdsEscoresKZOO_ANIMAL_FEMEA.Value := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).Value ;
   cdsEscoresLOTE.Value := FDadosFemea.DataSet.FieldByName( 'LOTE' ).asString ;
end;

procedure TdtmZoo_EscoreAnimal.OpenTables;
begin
   FTableName := TEscoreSuppl.CheckTableExists ( FKeyEscore, cdsEscores, sqlEscores ) ;
   sqlEscores.CommandText := 'SELECT * FROM ' + TableName  + ' WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL' ;
   sqlEscores.ParamByName( 'KZOO_ANIMAL' ).DataType := ftString ;
   cdsEscores.Params.Clear ;
   cdsEscores.FetchParams ;

   TCDSSuppl.SetMasterSource(cdsEscores, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open (  cdsEscores )  ;

//   cdsEscores.MasterSource := FMasterSource ;
   RebuildKeys ;
end;


procedure TdtmZoo_EscoreAnimal.SetDadosFemea(const Value: TDataSource);
begin
  FDadosFemea := Value;
end;

procedure TdtmZoo_EscoreAnimal.SetFuncionario(AKFuncionario,
  ANomeFuncionario: string);
begin
   if not ( cdsEscores.State in [dsInsert, dsEdit] ) then
      cdsEscores.Edit ;
   cdsEscoresNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
   cdsEscoresKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TdtmZoo_EscoreAnimal.SetKeyEscore(const Value: string);
begin
  FKeyEscore := Value;
  OpenTables ;
end;



procedure TdtmZoo_EscoreAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

function TdtmZoo_EscoreAnimal.AddBrinco(ABrinco: string; AData: TDateTime;
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
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
    cds := nil ;
    try
       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;
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


{ T_dtmBASE }

procedure T_dtmBASE.RebuildKeys;
begin
  self.GetPrimaryKeysFields ;
end;

{ TEscoreSuppl }

class function TEscoreSuppl.CheckTableExists(AKeyEscore: string ; AClientDataSet : TClientDataSet ; ASQLDataSet : TTcSQLDataSet ): string;
var
  p : TParams ;
  TableName : string ;
  TableExists : boolean ;
  cdsTable, cdsFields : TClientDataSet ;
  AddedFields : string ;
begin

  with Create do
    begin
      FClientDataSet := AClientDataSet ;
      FSQLDataSet := ASQLDataSet ;

      cdsTable  := nil ;
      cdsFields := nil ;

      p := TParams.Create ;
      p.CreateParam( ftString, 'KZOO_CFGESCORE', ptInput ).asString := AKeyEscore ;
      TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet ( cdsTable, _TABLE_DATA, p ) ;

      TableName :=  'ZOO_E_' + cdsTable.fieldByName (  'TIPOESCORE' ).asString + cdsTable.fieldByName (  'TABLE_ID' ).asString ;

      p.CreateParam( ftString, 'TABLENAME', ptInput ).asString := TableName ;
      TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet ( cdsFields, _TABLE_SEARCH, p ) ;

      p.free ;


      with cdsFields do
       while ( not eof ) do
         begin
           TableExists := not fieldByName (  'RDB$FIELD_ID' ).isNull ;
           if TableExists then
              Break ;
           next ;
         end;

      if not TableExists then
         TTcAbstractDB.GetByAlias('ZOOTECNICO').ExecuteDirect( Format ( _CREATE_TABLE, [TableName] ) ) ;

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
       cdsFields.Free ;

       FSQLDataSet.FieldByName ( 'KZOO_E' ).FieldName := 'K' + TableName ;
       FClientDataSet.FieldByName ( 'KZOO_E' ).FieldName := 'K' + TableName ;

       if ( AddedFields <> EmptyStr ) then
         begin
            System.Delete( AddedFields, Length ( AddedFields ), 1 ) ;
            TTcAbstractDB.GetByAlias('ZOOTECNICO').ExecuteDirect( Format ( _ALTER_TABLE, [ TableName, AddedFields ] ) ) ;
         end ;
    end ;

   Result := TableName ;

end;

function TEscoreSuppl.FieldTypeToFB(AFieldType: integer): string;
begin
 case AFieldType of
    1 : Result := 'SYS$DESCR' ;
    2 : Result := 'SYS$INT' ;
    3 : Result := 'SYS$FLOAT' ;
    4 : Result := 'SYS$DATE' ;
    5 : Result := 'SYS$BLOBTEXT' ;
 end;

end;

procedure TEscoreSuppl.AddFieldIntoSQL(AFieldName: String;  AFieldType: integer ; AFieldLabel : String );
var
  NewField : TField ;

  procedure CreateField ( ADataSet : TDataSet ) ;
    begin
       // build for sql
       case AFieldType of
          1 : NewField := TStringField.Create( ADataSet  )      ; // 'SYS$DESCR'
          2 : NewField := TIntegerField.Create( ADataSet )      ; // 'SYS$INT'
          3 : NewField := TFloatField.Create( ADataSet   )      ; // 'SYS$FLOAT'
          4 : NewField := TSQLTimeStampField.Create( ADataSet ) ; // 'SYS$DATE'
          5 : NewField := TMemoField.Create( ADataSet )         ; // 'SYS$BLOBTEXT'
       end;

       with NewField do
         begin
            FieldName    := AFieldName ;
            DataSet      := ADataSet ;
            DisplayLabel := AFieldLabel ;
            if ClassType = TStringField then
                Size := 128 ;
         end;
    end;

begin

  CreateField ( FClientDataSet ) ;
  CreateField ( FSQLDataSet ) ;

end;



end.
