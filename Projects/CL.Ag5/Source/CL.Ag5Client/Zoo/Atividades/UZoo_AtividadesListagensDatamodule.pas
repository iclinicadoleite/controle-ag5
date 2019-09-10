unit UZoo_AtividadesListagensDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, UdtmSYS_BASE, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider,
  DateUtils;

type

  TZoo_AtividadesListagensDataModule = class(T_dtmBASE)
    cdsAListagensBST: TClientDataSet;
    dspAListagensBST: TDataSetProvider;
    sqlAListagensBST: TTcSQLDataSet;
    cdsAListagensCC: TClientDataSet;
    dspAListagensCC: TDataSetProvider;
    sqlAListagensCC: TTcSQLDataSet;
    cdsAListagensCMT: TClientDataSet;
    dspAListagensCMT: TDataSetProvider;
    sqlAListagensCMT: TTcSQLDataSet;
    cdsAListagensCMTBRINCOFEMEA: TStringField;
    cdsAListagensCMTNOMEFEMEA: TStringField;
    cdsAListagensCMTSTATUS: TIntegerField;
    cdsAListagensCMTLOTE: TStringField;
    sqlAListagensCCBRINCOFEMEA: TStringField;
    sqlAListagensCCNOMEFEMEA: TStringField;
    sqlAListagensCCSTATUS: TIntegerField;
    sqlAListagensCCLOTE: TStringField;
    cdsAListagensCCBRINCOFEMEA: TStringField;
    cdsAListagensCCNOMEFEMEA: TStringField;
    cdsAListagensCCSTATUS: TIntegerField;
    cdsAListagensCCLOTE: TStringField;
    cdsStatusVaca: TClientDataSet;
    cdsStatusVacaTIPO: TStringField;
    cdsStatusVacaVALOR: TStringField;
    cdsStatusVacaDESCRICAO: TStringField;
    cdsStatusVacaORDEM: TIntegerField;
    cdsAListagensCCDESC_STATUS: TStringField;
    sqlAListagensCMTBRINCOFEMEA: TStringField;
    sqlAListagensCMTNOMEFEMEA: TStringField;
    sqlAListagensCMTSTATUS: TIntegerField;
    sqlAListagensCMTLOTE: TStringField;
    cdsAListagensCMTDESC_STATUS: TStringField;
    cdsListaEscores: TClientDataSet;
    cdsListaEscoresKZOO_CFGESCORE: TStringField;
    cdsListaEscoresTABLE_ID: TIntegerField;
    cdsListaEscoresTIPOESCORE: TStringField;
    cdsListaEscoresSIGLA: TStringField;
    cdsListaEscoresNOME: TStringField;
    cdsListaEscoresOBS: TMemoField;
    dspListaEscores: TDataSetProvider;
    sqlListaEscores: TTcSQLDataSet;
    sqlListaEscoresKZOO_CFGESCORE: TStringField;
    sqlListaEscoresTABLE_ID: TIntegerField;
    sqlListaEscoresTIPOESCORE: TStringField;
    sqlListaEscoresSIGLA: TStringField;
    sqlListaEscoresNOME: TStringField;
    sqlListaEscoresOBS: TMemoField;
    cdsEscores: TClientDataSet;
    cdsEscoresKZOO_E: TStringField;
    cdsEscoresKZOO_ANIMAL_FEMEA: TStringField;
    cdsEscoresBRINCO: TStringField;
    cdsEscoresNOMEESTABULO: TStringField;
    cdsEscoresDATA: TSQLTimeStampField;
    cdsEscoresLOTE: TStringField;
    cdsEscoresKCAD_FUNCIONARIO: TStringField;
    cdsEscoresNOMEFUNCIONARIO: TStringField;
    dspEscores: TDataSetProvider;
    sqlEscores: TTcSQLDataSet;
    sqlEscoresKZOO_E: TStringField;
    sqlEscoresKZOO_ANIMAL_FEMEA: TStringField;
    sqlEscoresDATA: TSQLTimeStampField;
    sqlEscoresLOTE: TStringField;
    sqlEscoresKCAD_FUNCIONARIO: TStringField;
    sqlEscoresNOMEFUNCIONARIO: TStringField;
    cdsAListagensBSTBRINCOFEMEA: TStringField;
    cdsAListagensBSTNOMEFEMEA: TStringField;
    cdsAListagensBSTLOTE: TStringField;
    cdsAListagensBSTULTIMA_LACTACAO: TSQLTimeStampField;
    cdsAListagensBSTNCOBERTURAS: TIntegerField;
    cdsAListagensBSTPRENHEZ: TStringField;
    cdsAListagensBSTDATA_PREVISTABST: TSQLTimeStampField;
    cdsAListagensBSTDPP: TIntegerField;
    cdsDescricaoBST: TClientDataSet;
    cdsDescricaoBSTTIPO: TStringField;
    cdsDescricaoBSTVALOR: TStringField;
    cdsDescricaoBSTDESCRICAO: TStringField;
    cdsDescricaoBSTORDEM: TIntegerField;
    sqlAListagensBSTBRINCOFEMEA: TStringField;
    sqlAListagensBSTNOMEFEMEA: TStringField;
    sqlAListagensBSTLOTE: TStringField;
    sqlAListagensBSTULTIMA_LACTACAO: TSQLTimeStampField;
    sqlAListagensBSTNCOBERTURAS: TIntegerField;
    sqlAListagensBSTPRENHEZ: TStringField;
    sqlAListagensBSTDATA_ULTBST: TSQLTimeStampField;
    sqlAListagensBSTDATA_PREVISTABST: TSQLTimeStampField;
    cdsAListagensBSTDATA_ULTBST: TSQLTimeStampField;
    sqlAListagensBSTTOTAL: TFloatField;
    cdsAListagensBSTTOTAL: TFloatField;
    sqlAListagensBSTBRINCOFEMEA_: TStringField;
    cdsAListagensBSTBRINCOFEMEA_: TStringField;
    sqlAListagensCCBRINCOFEMEA_: TStringField;
    cdsAListagensCCBRINCOFEMEA_: TStringField;
    sqlAListagensCMTBRINCOFEMEA_: TStringField;
    cdsAListagensCMTBRINCOFEMEA_: TStringField;
    sqlAListagensBSTKZOO_ANIMAL_FEMEA: TStringField;
    sqlAListagensCCKZOO_ANIMAL_FEMEA: TStringField;
    sqlAListagensCMTKZOO_ANIMAL_FEMEA: TStringField;
    cdsAListagensBSTKZOO_ANIMAL_FEMEA: TStringField;
    cdsAListagensCCKZOO_ANIMAL_FEMEA: TStringField;
    cdsAListagensCMTKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsAListagensBSTNewRecord(DataSet: TDataSet);
    procedure cdsAListagensBSTCalcFields(DataSet: TDataSet);
    procedure cdsAListagensBSTBeforeOpen(DataSet: TDataSet);
    procedure cdsAListagensCCBeforeOpen(DataSet: TDataSet);
    procedure cdsAListagensCMTBeforeOpen(DataSet: TDataSet);
    procedure cdsListaEscoresBeforeOpen(DataSet: TDataSet);
    procedure cdsAListagensBSTPRENHEZGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    FIntervaloAplicacaoBSTPrimipara : integer;
    FIntervaloAplicacaoBSTMultipara : integer;
    FBSTDelPrimipara : integer;
    FBSTDelMultipara : Integer;
    FProducaoPrimipara : integer;
    FProducaoMultipara : integer;
    FDiasPrePartoSecarPrimipara, FDiasPrePartoSecarMultipara : integer ;
    FDiasPreSecagemBSTPrimipara,
    FDiasPreSecagemBSTMultipara : integer ;
    FDiasEncerrarBSTPrimipara,
    FDiasEncerrarBSTMultipara : integer ;
    FBSTAte      : TDateTime;
    FKeyEscore   : string ; // escore
    FTableName   : string;  // escore
    FTableExists : boolean; // escore
    FFieldAdded  : boolean; // escore
    procedure SetKeyEscore(const Value: string); // escore
    procedure CheckTableExists ;  // escore
    function FieldTypeToFB ( AFieldType : integer ) : string ;
    procedure SetParams(tela : Integer );
    procedure AddFieldIntoSQL ( AFieldName : String ; AFieldType : integer ; AFieldLabel : String ); // escore
    procedure SetTableExists(const Value: boolean);
    procedure SetBSTAte(const Value: TDateTime);
  public
    { Public declarations }
    cdsTable : TClientDataSet ; // escore
    cdsFields : TClientDataSet ; // escore

    property IntervaloAplicacaoBSTPrimipara             : integer read FIntervaloAplicacaoBSTPrimipara ;
    property IntervaloAplicacaoBSTMultipara             : integer read FIntervaloAplicacaoBSTMultipara ;
    property BSTDelPrimipara            : integer read FBSTDelPrimipara ;
    property BSTDelMultipara            : Integer read FBSTDelMultipara ;
    property ProducaoPrimipara          : integer read FProducaoPrimipara ;
    property ProducaoMultipara          : integer read FProducaoMultipara ;
    property DiasPrePartoSecarPrimipara : integer read FDiasPrePartoSecarPrimipara ;
    property DiasPrePartoSecarMultipara : integer read FDiasPrePartoSecarMultipara ;
    property DiasPreSecagemBSTPrimipara : integer read FDiasPreSecagemBSTPrimipara ;
    property DiasPreSecagemBSTMultipara : integer read FDiasPreSecagemBSTMultipara ;


    property BSTAte : TDateTime  read FBSTAte write SetBSTAte;
    property TableName : string  read FTableName ;
    property TableExists : boolean  read FTableExists write SetTableExists;
    procedure OpenTables ; override ;
    property KeyEscore : string  read FKeyEscore write SetKeyEscore;
    Constructor Create ( AOwner : TComponent  ) ;override ;

    function GetDescricaoBST ( TIPO : string ) : string ;

    Destructor Destroy ; override ;

  end;

implementation

uses UDBZootecnico, ThreadSuppl, Exceptions, ClAg5ClientCommonTypes, ClAg5ClientZootecnicoCommonTypes,
    CLAg5Types, UApplResources, Data.SQLTimSt, CDSSuppl ;

const BST = 1;
      CMT = 2;
      CC  = 3;


{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_AtividadesListagensDataModule.OpenTables;
begin
  TCDSSuppl.Open (  cdsListaEscores ) ;
end;

procedure TZoo_AtividadesListagensDataModule.SetBSTAte(const Value: TDateTime);
begin
  FBSTAte := Value;
  if cdsAListagensBST.Active then
     cdsAListagensBST.Close ;
  TCDSSuppl.Open ( cdsAListagensBST ) ;
end;

procedure TZoo_AtividadesListagensDataModule.SetKeyEscore(const Value: string);
begin
  FKeyEscore := Value;
  CheckTableExists ;
end;

procedure TZoo_AtividadesListagensDataModule.SetParams(tela : Integer );
begin
  if tela = BST then
    begin
      cdsAListagensBST.Params.ParamByName ( 'CIO' ).AsInteger         := _ST_AUTO_EVT_CIO;
      cdsAListagensBST.Params.ParamByName ( 'INTBST_PRIM' ).AsInteger := FIntervaloAplicacaoBSTPrimipara;
      cdsAListagensBST.Params.ParamByName ( 'INTBST_MULT' ).AsInteger := FIntervaloAplicacaoBSTMultipara;
      cdsAListagensBST.Params.ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
      cdsAListagensBST.Params.ParamByName ( 'DESCARTADA' ).AsInteger  := _ST_STATUS_FEMEA_DESCARTADO;
      cdsAListagensBST.Params.ParamByName ( 'PROD_PRIM' ).AsInteger   := FProducaoPrimipara;
      cdsAListagensBST.Params.ParamByName ( 'PROD_MULT' ).AsInteger   := FProducaoMultipara;
      cdsAListagensBST.Params.ParamByName ( 'DPP_PRIM' ).AsInteger    := FBSTDelPrimipara;
      cdsAListagensBST.Params.ParamByName ( 'DPP_MULT' ).AsInteger    := FBSTDelMultipara;
      cdsAListagensBST.Params.paramByName ( 'DATA' ).AsSQLTimeStamp   := DateTimeToSQLTimeStamp( EndOfTheDay( FBSTAte ) );
      cdsAListagensBST.Params.ParamByName ( 'DIAS_ENCERRAR_BST_PRIM' ).AsInteger    := FDiasEncerrarBSTPrimipara ;
      cdsAListagensBST.Params.ParamByName ( 'DIAS_ENCERRAR_BST_MULT' ).AsInteger    := FDiasEncerrarBSTMultipara ;
    end
  else if tela = CMT then
    begin
      cdsAListagensCMT.Params.ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
      cdsAListagensCMT.Params.paramByName ( 'VL' ).asInteger          := _ST_STATUS_FEMEA_VACALACTACAO ;
    end
  else if tela = CC then
    begin
      cdsAListagensCC.Params.ParamByName ( 'KCAD_FAZENDA' ).asString  := LoggedUser.DomainID ;
      cdsAListagensCC.Params.paramByName ( 'BEZ' ).asInteger          := _ST_STATUS_FEMEA_BEZERRO ;
      cdsAListagensCC.Params.paramByName ( 'DESCARTADA' ).asInteger   := _ST_STATUS_FEMEA_DESCARTADO ;
    end;
end;

procedure TZoo_AtividadesListagensDataModule.SetTableExists(
  const Value: boolean);
begin
  FTableExists := Value;
end;

procedure TZoo_AtividadesListagensDataModule.AddFieldIntoSQL(AFieldName: String;
  AFieldType: integer; AFieldLabel: String);
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

procedure TZoo_AtividadesListagensDataModule.cdsAListagensBSTBeforeOpen(DataSet: TDataSet);
begin
  SetParams(BST);
end;

procedure TZoo_AtividadesListagensDataModule.cdsAListagensBSTCalcFields(DataSet: TDataSet);
begin
  if DataSet.State in [dsInternalCalc] then
    cdsAListagensBSTDPP.AsInteger := DaysBetween(cdsAListagensBSTULTIMA_LACTACAO.AsDateTime, Date );
end;

procedure TZoo_AtividadesListagensDataModule.cdsAListagensBSTNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TZoo_AtividadesListagensDataModule.cdsAListagensBSTPRENHEZGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'PRENHEZ' ).asString = 'T' then
      Text := 'Sim'
    else
      Text := 'Não';
end;

procedure TZoo_AtividadesListagensDataModule.cdsAListagensCCBeforeOpen(DataSet: TDataSet);
begin
  SetParams(CC);
end;

procedure TZoo_AtividadesListagensDataModule.cdsAListagensCMTBeforeOpen(DataSet: TDataSet);
begin
  SetParams(CMT);
end;

procedure TZoo_AtividadesListagensDataModule.cdsListaEscoresBeforeOpen(
  DataSet: TDataSet);
begin
    cdsListaEscores.Params.ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
end;

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



procedure TZoo_AtividadesListagensDataModule.CheckTableExists;
var
  p : TParams ;
  AddedFields : string ;
  I: Integer;
begin

  cdsFields := nil ;

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
    begin
       while ( not eof ) do
         begin
           if fieldByName (  'RDB$FIELD_ID' ).isNull then
              AddedFields := AddedFields + Format ( _ADD_FIELD, [ fieldByName (  'FIELD_NAME' ).asString, FieldTypeToFB (  fieldByName (  'FIELD_TYPE' ).asInteger ) ] ) ;
           AddFieldIntoSQL (  fieldByName (  'FIELD_NAME' ).asString, fieldByName (  'FIELD_TYPE' ).asInteger, fieldByName (  'SIGLA' ).asString ) ;
           next ;
         end;
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
//   RebuildKeys ;

   for I := 0 to cdsEscores.FieldCount - 1 do
     begin
       if ( cdsEscores.Fields[ I ] is TIntegerField ) then
         TIntegerField ( cdsEscores.Fields[ I ] ).DisplayFormat := '0;0;#' ;
       if ( cdsEscores.Fields[ I ] is TFloatField ) then
         TFloatField ( cdsEscores.Fields[ I ] ).DisplayFormat := '0.00;-0.00;#' ;
     end;

   for I := 0 to 22 do
     begin
       cdsEscores.Append;
       cdsEscoresBRINCO.AsString := ' ';
       cdsEscores.Post;
     end;
   cdsEscores.First;
end;

constructor TZoo_AtividadesListagensDataModule.Create(AOwner: TComponent);
var
//  LDiasPreSecagemBSTPrimipara, LDiasPreSecagemBSTMultipara : integer ;
  LDiasGestacaoPrimipara, LDiasGestacaoMultipara : integer ;
begin
  inherited;

  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_STATUS_FEMEA,   cdsStatusVaca );
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_PARAM_MATRIZES, cdsDescricaoBST ) ;

  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_BST_INTERVALO,        FIntervaloAplicacaoBSTPrimipara, FIntervaloAplicacaoBSTMultipara  );
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_BST_DEL,              FBSTDelPrimipara,                FBSTDelMultipara );
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_BST_PRODUCAO,         FProducaoPrimipara,              FProducaoMultipara );
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO,     LDiasGestacaoPrimipara,          LDiasGestacaoMultipara ) ;
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_PRE_PARTO_SECAR, FDiasPrePartoSecarPrimipara,     FDiasPrePartoSecarMultipara ) ;
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_BST_DIAS_PRE_SECAGEM, FDiasPreSecagemBSTPrimipara,     FDiasPreSecagemBSTMultipara ) ;

  FDiasEncerrarBSTPrimipara  := LDiasGestacaoPrimipara - FDiasPrePartoSecarPrimipara - FDiasPreSecagemBSTPrimipara ;
  FDiasEncerrarBSTMultipara  := LDiasGestacaoMultipara - FDiasPrePartoSecarMultipara - FDiasPreSecagemBSTMultipara ;
end;

destructor TZoo_AtividadesListagensDataModule.Destroy;
begin
  if Assigned ( cdsFields ) then
    cdsFields.Free ;
  if Assigned ( cdsTable ) then
    cdsTable.Free ;
  inherited;
end;

function TZoo_AtividadesListagensDataModule.FieldTypeToFB(
  AFieldType: integer): string;
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

function TZoo_AtividadesListagensDataModule.GetDescricaoBST(TIPO: string): string;
begin
   cdsDescricaoBST.Locate( 'VALOR', TIPO, [] ) ;
   RESULT:= cdsDescricaoBSTDESCRICAO.AsString
end;

{ T_dtmBASE }
(*
  procedure T_dtmBASE.RebuildKeys;
  begin
    self.GetPrimaryKeysFields ;
  end;
*)
end.
