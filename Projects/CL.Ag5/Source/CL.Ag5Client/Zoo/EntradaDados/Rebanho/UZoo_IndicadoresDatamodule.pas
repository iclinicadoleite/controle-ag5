unit UZoo_IndicadoresDatamodule;

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

  TZoo_IndicadoresDatamodule = class(T_dtmBASE)
    cdsIndicadores: TClientDataSet;
    dspIndicadores: TDataSetProvider;
    sqlIndicadores: TTcSQLDataSet;
    sqlIndicadoresKZOO_I: TStringField;
    sqlIndicadoresDATA: TSQLTimeStampField;
    sqlIndicadoresKCAD_FUNCIONARIO: TStringField;
    sqlIndicadoresNOMEFUNCIONARIO: TStringField;
    cdsIndicadoresKZOO_I: TStringField;
    cdsIndicadoresDATA: TSQLTimeStampField;
    cdsIndicadoresKCAD_FUNCIONARIO: TStringField;
    cdsIndicadoresNOMEFUNCIONARIO: TStringField;
    procedure cdsIndicadoresNOMEFUNCIONARIOSetText(Sender: TField;
      const Text: string);
    procedure cdsIndicadoresNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FKeyIndicador: string;
    FTableExists: boolean;
    FFieldAdded: boolean;
    FTableName: string;
    FData : TDateTime  ;
    FNomeFuncionario  : string ;
    FKFuncionario : string ;
    FLegenda: string;
    procedure SetKeyIndicador(const Value: string);
    procedure CheckTableExists ;
    procedure AddFieldIntoSQL ( AFieldName : String ; AFieldType : integer ; AFieldLabel : String );
    function FieldTypeToFB ( AFieldType : integer ) : string ;
    procedure SetTableExists(const Value: boolean);
    procedure SetFieldAdded(const Value: boolean);
  public
    { Public declarations }
    cdsTable : TClientDataSet ;
    cdsFields : TClientDataSet ;
    property TableExists : boolean  read FTableExists write SetTableExists;
    property FieldAdded : boolean   read FFieldAdded write SetFieldAdded;
    property KeyIndicador : string  read FKeyIndicador write SetKeyIndicador;
    property TableName : string  read FTableName ;
    procedure OpenTables ; override ;
    property Legenda : string read FLegenda ;
    function AddBrinco ( ABrinco : string ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure SetDadosPadrao ( AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) ;
    procedure ApplyUpdates ; override ;
    procedure RemoveRecord ;
  end;

implementation

uses UDBZootecnico, Exceptions, CDSSuppl ;

{$R *.dfm}

const
  _CREATE_TABLE =
   'CREATE TABLE %0:s ('
      +#13#10'   K%0:s            SYS$PKGUID20,'
      +#13#10'   DATA                  SYS$DATE_NN,'
      +#13#10'   KCAD_FUNCIONARIO      SYS$FKGUID20,'
      +#13#10'   NOMEFUNCIONARIO       SYS$DESCR,'
      +#13#10'   CONSTRAINT PK%0:s PRIMARY KEY (K%0:s)'
      +#13#10')' ;

   _COMMENT_TABLE = 'COMMENT ON TABLE %s IS ''%s''' ;

   _TABLE_DATA = '* FROM ZOO_CFGINDICADORES WHERE KZOO_CFGINDICADOR = :KZOO_CFGINDICADOR' ;
(*
   _TABLE_SEARCH =
//             ' ''ZOO_I_'' || E.TIPOESCOPO || E.TABLE_ID TABLE_NAME,'
      +#13#10' ''F'' || F.field_id FIELD_NAME,'
      +#13#10' F.field_type,'
      +#13#10' F.sigla,'
      +#13#10' R.RDB$FIELD_ID'
      +#13#10'from ZOO_CFGINDICADOR_FIELDS F'
//      +#13#10'LEFT JOIN ZOO_CFGINDICADORES E ON ( E.KZOO_CFGINDICADOR = F.KZOO_CFGINDICADOR )'
      +#13#10'LEFT JOIN RDB$RELATION_FIELDS R'
//      +#13#10'  ON    (R.RDB$RELATION_NAME = ''ZOO_I_'' || E.TIPOESCOPO || E.TABLE_ID'
      +#13#10'  ON    (R.RDB$RELATION_NAME = :TABLENAME'
      +#13#10'    AND R.RDB$FIELD_NAME = ''F'' || F.FIELD_ID )'
      +#13#10'WHERE F.KZOO_CFGINDICADOR = :KZOO_CFGINDICADOR and F.ATIVO = ''T''' ;
*)

   _TABLE_SEARCH =
             ' ''F'' || F.field_id FIELD_NAME,'
      +#13#10' F.field_type,'
      +#13#10' F.sigla,'
      +#13#10' R.RDB$FIELD_ID'
      +#13#10'from ZOO_CFGINDICADOR_FIELDS F'
      +#13#10'LEFT JOIN RDB$RELATION_FIELDS R'
      +#13#10'  ON    (R.RDB$RELATION_NAME = :TABLENAME'
      +#13#10'    AND R.RDB$FIELD_NAME = ''F'' || F.FIELD_ID )'
      +#13#10'WHERE F.KZOO_CFGINDICADOR = :KZOO_CFGINDICADOR and F.ATIVO = ''T''' ;


   _ALTER_TABLE = 'ALTER TABLE %s %s' ;

   _ADD_FIELD = 'ADD %s %s,' ;


procedure TZoo_IndicadoresDatamodule.CheckTableExists;
var
  p : TParams ;
  AddedFields : string ;
begin

  cdsFields := nil ;

  if cdsIndicadores.Active then
    begin
     cdsIndicadores.EmptyDataSet;
     cdsIndicadores.Close ;
    end;

  while cdsIndicadores.Fields.Count > 4 do
      cdsIndicadores.Fields[ cdsIndicadores.Fields.Count -1 ].free ;

  while sqlIndicadores.Fields.Count > 4 do
      sqlIndicadores.Fields[ sqlIndicadores.Fields.Count -1 ].free ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KZOO_CFGINDICADOR', ptInput ).asString := FKeyIndicador ;
  DBResources['ZOOTECNICO'].populateClientDataSet ( cdsTable, _TABLE_DATA, p ) ;

  FTableName :=  'ZOO_I_' + cdsTable.fieldByName (  'TIPOINDICADOR' ).asString + cdsTable.fieldByName (  'TABLE_ID' ).asString ;
  FLegenda   := cdsTable.fieldByName (  'OBS' ).asString ;

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

   sqlIndicadoresKZOO_I.FieldName := 'K' + TableName ;
   cdsIndicadoresKZOO_I.FieldName := 'K' + TableName ;

   FFieldAdded := ( AddedFields <> EmptyStr ) ;

   if ( AddedFields <> EmptyStr ) then
     begin
        System.Delete( AddedFields, Length ( AddedFields ), 1 ) ;
        DBResources['ZOOTECNICO'].ExecuteDirect( Format ( _ALTER_TABLE, [ TableName, AddedFields ] ) ) ;
     end ;

   sqlIndicadores.CommandText := 'SELECT * FROM ' + TableName  ;
   TCDSSuppl.CreateDataSet( cdsIndicadores ) ;
   RebuildKeys ;
end;


function TZoo_IndicadoresDatamodule.FieldTypeToFB(AFieldType : integer  ): string;
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

procedure TZoo_IndicadoresDatamodule.OpenTables;
begin
//  TCDSSuppl.CreateDataSet( cdsListaIndicadores ) ;

  //TCDSSuppl.CreateDataSet( cdsIndicadores ) ;
  //inherited;
  //
end;

procedure TZoo_IndicadoresDatamodule.RemoveRecord;
begin
   if not cdsIndicadores.isEmpty then
    cdsIndicadores.Delete ;
end;

procedure TZoo_IndicadoresDatamodule.SetDadosPadrao(AData: TDateTime; AKFuncionario,
  ANomeFuncionario: string);
begin
  FData            := AData ;
  FKFuncionario    := AKFuncionario ;
  FNomeFuncionario := ANomeFuncionario ;
end;

procedure TZoo_IndicadoresDatamodule.SetFieldAdded(const Value: boolean);
begin
  FFieldAdded := Value;
end;

procedure TZoo_IndicadoresDatamodule.SetFuncionario(AKFuncionario,
  ANomeFuncionario: string);
begin
   if not ( cdsIndicadores.State in [dsInsert, dsEdit] ) then
      cdsIndicadores.Edit ;
   cdsIndicadoresNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
   cdsIndicadoresKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TZoo_IndicadoresDatamodule.SetKeyIndicador(const Value: string);
begin
  FKeyIndicador := Value;
  CheckTableExists ;
//  OpenTables ;
end;


procedure TZoo_IndicadoresDatamodule.SetTableExists(const Value: boolean);
begin
  FTableExists := Value;
end;


function TZoo_IndicadoresDatamodule.AddBrinco(ABrinco: string; AData: TDateTime;
  AKFuncionario, ANomeFuncionario: string): boolean;
var
    cds : TClientDataSet ;
    p : TParams ;
begin
    Result := cdsIndicadores.Locate( 'BRINCO', ABrinco, [] ) ;
    if Result then
      begin
         cdsIndicadores.Edit ;
         cdsIndicadoresKCAD_FUNCIONARIO.asString  := AKFuncionario ;
         cdsIndicadoresNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
         cdsIndicadoresDATA.asDateTime            := AData ;
         exit ;
      end ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
    cds := nil ;
    try
       DBResources['ZOOTECNICO'].populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;
       Result := not cds.IsEmpty ;

       if Result then
         with cds do
           begin
             cdsIndicadores.Append ;
             GetKey ( cdsIndicadoresKZOO_I ) ;
             cdsIndicadoresKCAD_FUNCIONARIO.asString  := AKFuncionario ;
             cdsIndicadoresNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
             cdsIndicadoresDATA.asDateTime            := AData ;
           end
         else
            raise Warning.Create('Brinco não encontrado');

    finally
       cds.Free ;
       p.free ;
    end;

end;

procedure TZoo_IndicadoresDatamodule.AddFieldIntoSQL(AFieldName: String;  AFieldType: integer ; AFieldLabel : String );
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
        DataSet      := sqlIndicadores ;
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
        DataSet      := cdsIndicadores ;
        DisplayLabel := AFieldLabel ;
        if ClassType = TStringField then
            Size := 128 ;
     end;


end;

procedure TZoo_IndicadoresDatamodule.ApplyUpdates;
begin
  TCDSSuppl.ApplyUpdates(cdsIndicadores);
  cdsIndicadores.EmptyDataSet ;
end;

procedure TZoo_IndicadoresDatamodule.cdsIndicadoresNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsIndicadoresKZOO_I ) ;
  cdsIndicadoresData.asDateTime           := FData ;
  cdsIndicadoresNOMEFUNCIONARIO.asString  := FNomeFuncionario ;
  cdsIndicadoresKCAD_FUNCIONARIO.asString := FKFuncionario ;
end;

procedure TZoo_IndicadoresDatamodule.cdsIndicadoresNOMEFUNCIONARIOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsIndicadoresKCAD_FUNCIONARIO.Clear ;
end;

{ T_dtmBASE }

procedure T_dtmBASE.RebuildKeys;
begin
  self.GetPrimaryKeysFields ;
end;

end.




