unit UZoo_ProducaoAnaliseLeiteDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, SMIBase, SMI2Cell, SMI2XLS  ;

type
  TZoo_ProducaoAnaliseLeiteDatamodule = class(T_dtmBASE)
    sqlLotes: TTcSQLDataSet;
    cdsLotes: TClientDataSet;
    dspLotes: TDataSetProvider;
    sqlAnalises: TTcSQLDataSet;
    cdsAnalises: TClientDataSet;
    sqlAnalisesKZOO_PESAGEM_LEITE: TStringField;
    sqlAnalisesKZOO_LACTACAO: TStringField;
    sqlAnalisesDATA: TSQLTimeStampField;
    sqlAnalisesLACTOSE: TFloatField;
    sqlAnalisesGORDURA: TFloatField;
    sqlAnalisesPROTEINA: TFloatField;
    sqlAnalisesSOLIDOS_TOTAIS: TFloatField;
    sqlAnalisesCCS: TIntegerField;
    sqlAnalisesESD: TFloatField;
    sqlAnalisesUREIA: TFloatField;
    cdsAnalisesBRINCO: TStringField;
    cdsAnalisesLACTOSE: TFloatField;
    cdsAnalisesGORDURA: TFloatField;
    cdsAnalisesPROTEINA: TFloatField;
    cdsAnalisesSOLIDOS_TOTAIS: TFloatField;
    cdsAnalisesCCS: TIntegerField;
    cdsAnalisesESD: TFloatField;
    cdsAnalisesUREIA: TFloatField;
    cdsLoteAnalise: TClientDataSet;
    cdsLoteAnaliseKCAD_FAZENDA: TStringField;
    cdsLoteAnaliseDATA: TDateTimeField;
    cdsLoteAnaliseANALISES: TDataSetField;
    sqlLotesKZOO_LOTEPESAGEM_LEITE: TStringField;
    sqlLotesDATA: TSQLTimeStampField;
    cdsLotesKZOO_LOTEPESAGEM_LEITE: TStringField;
    cdsLotesDATA: TSQLTimeStampField;
    cdsPesagens: TClientDataSet;
    cdsPesagensKZOO_PESAGEM_LEITE: TStringField;
    cdsPesagensKCAD_FAZENDA: TStringField;
    cdsPesagensKZOO_LOTEPESAGEM_LEITE: TStringField;
    cdsPesagensKZOO_LACTACAO: TStringField;
    cdsPesagensKZOO_ANIMAL: TStringField;
    cdsPesagensBRINCO: TStringField;
    cdsPesagensNOMEESTABULO: TStringField;
    cdsPesagensORD1: TFloatField;
    cdsPesagensORD2: TFloatField;
    cdsPesagensORD3: TFloatField;
    cdsPesagensTOTAL: TFloatField;
    sqlPesagens: TTcSQLDataSet;
    sqlPesagensKZOO_PESAGEM_LEITE: TStringField;
    sqlPesagensKCAD_FAZENDA: TStringField;
    sqlPesagensKZOO_LOTEPESAGEM_LEITE: TStringField;
    sqlPesagensKZOO_LACTACAO: TStringField;
    sqlPesagensKZOO_ANIMAL: TStringField;
    sqlPesagensBRINCO: TStringField;
    sqlPesagensNOMEESTABULO: TStringField;
    sqlPesagensORD1: TFloatField;
    sqlPesagensORD2: TFloatField;
    sqlPesagensORD3: TFloatField;
    sqlPesagensTOTAL: TFloatField;
    dtsSQLLotePesagem: TDataSource;
    cdsLotessqlPesagens: TDataSetField;
    cdsPesagensGORDURA: TFloatField;
    cdsPesagensLACTOSE: TFloatField;
    cdsPesagensPROTEINA: TFloatField;
    cdsPesagensSOLIDOS_TOTAIS: TFloatField;
    cdsPesagensCCS: TFloatField;
    cdsPesagensESD: TFloatField;
    cdsPesagensUREIA: TFloatField;
    sqlPesagensDATALACTACAO: TSQLTimeStampField;
    cdsPesagensDATALACTACAO: TSQLTimeStampField;
    SMImportAnalises: TSMImportFromXLS;
    cdsImport: TClientDataSet;
    cdsImportBRINCO: TStringField;
    cdsImportORD1: TFloatField;
    cdsImportORD2: TFloatField;
    cdsImportORD3: TFloatField;
    SMImportLote: TSMImportFromXLS;
    sqlPesagensBRINCO_: TStringField;
    cdsPesagensBRINCO_: TStringField;
  private
    { Private declarations }
    FAnalisesImportadas : integer ;
    procedure LoadString ( AFilename : string ) ;
    procedure ValidateFile;
    procedure LoadCDS(AFilename: string);
    procedure ImportFromXLS ( AFileName : string ) ;
    procedure OpenCDS;
  public
    { Public declarations }
    procedure LoadAnaliseFromFile ( AFilename : string ) ;
    procedure GerarTeste ( AFileName : string ; AData : TDateTime ) ;
    procedure ApplyUpdates ;
  end;

implementation

uses ClAg5Types, Exceptions, UDBZootecnico,
  Tc.VCL.Application,
  CDSSuppl  ;

{$R *.dfm}

{ TZoo_ProducaoAnaliseLeiteDatamodule }

procedure TZoo_ProducaoAnaliseLeiteDatamodule.ApplyUpdates;
const
  _SQL =      'UPDATE OR INSERT INTO ZOO_PESAGEM_LEITE_ANALISE ('
       +#13#10'KZOO_PESAGEM_LEITE, KCAD_FAZENDA, KZOO_LACTACAO, KZOO_ANIMAL_FEMEA, DATALACTACAO, DATA, GORDURA, PROTEINA, LACTOSE, SOLIDOS_TOTAIS, ESD,  CCS,  UREIA )'
       +#13#10'VALUES ( :KZOO_PESAGEM_LEITE, :KCAD_FAZENDA, :KZOO_LACTACAO, :KZOO_ANIMAL_FEMEA, :DATALACTACAO, :DATA, :GORDURA, :PROTEINA, :LACTOSE, :SOLIDOS_TOTAIS, :ESD, :CCS, :UREIA )'
       +#13#10'MATCHING ( KZOO_PESAGEM_LEITE, KCAD_FAZENDA, KZOO_LACTACAO, KZOO_ANIMAL_FEMEA, DATALACTACAO )' ;
var
  p : TParams ;
begin

  cdsPesagens.disableControls ;
  cdsPesagens.First ;
  while not cdsPesagens.eof  do
    begin


     p := TParams.Create ;
     p.createParam ( ftString,        'KZOO_PESAGEM_LEITE', ptInput  ).asString        :=   cdsPesagensKZOO_PESAGEM_LEITE.asString ;
     p.createParam ( ftString,        'KCAD_FAZENDA'      , ptInput  ).asString        :=   cdsPesagensKCAD_FAZENDA.AsString       ;
     p.createParam ( ftString,        'KZOO_LACTACAO'     , ptInput  ).asString        :=   cdsPesagensKZOO_LACTACAO.asString      ;
     p.createParam ( ftString,        'KZOO_ANIMAL_FEMEA' , ptInput  ).asString        :=   cdsPesagensKZOO_ANIMAL.asString        ;
     p.createParam ( ftString,        'DATALACTACAO'      , ptInput  ).asSQLTimeStamp  :=   cdsPesagensDATALACTACAO.asSQLTimeStamp ;
//     p.createParam ( ftDateTime,      'DATA'              , ptInput  ).asSQLTimeStamp  :=   cdsLotesDATA.asSQLTimeStamp            ;
     p.createParam ( ftDateTime,      'DATA'              , ptInput  ).asSQLTimeStamp  :=   cdsLoteAnaliseDATA.asSQLTimeStamp      ;
     p.createParam ( ftFloat,         'GORDURA'           , ptInput  ).asFloat         :=   cdsPesagensGORDURA.asFloat             ;
     p.createParam ( ftFloat,         'PROTEINA'          , ptInput  ).asFloat         :=   cdsPesagensPROTEINA.asFloat            ;
     p.createParam ( ftFloat,         'LACTOSE'           , ptInput  ).asFloat         :=   cdsPesagensLACTOSE.asFloat             ;
     p.createParam ( ftFloat,         'SOLIDOS_TOTAIS'    , ptInput  ).asFloat         :=   cdsPesagensSOLIDOS_TOTAIS.asFloat      ;
     p.createParam ( ftFloat,         'ESD'               , ptInput  ).asFloat         :=   cdsPesagensESD.asFloat                 ;
     p.createParam ( ftInteger,       'CCS'               , ptInput  ).asInteger       :=   cdsPesagensCCS.asInteger               ;
     p.createParam ( ftFloat,         'UREIA'             , ptInput  ).asFloat         :=   cdsPesagensUREIA.asFloat               ;
     sqlLotes.SQLConnection.Execute ( _SQL, P ) ;
     p.free ;
     cdsPesagens.Next ;
    end;
  cdsPesagens.First ;
  cdsPesagens.enableControls ;
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.OpenCDS;
begin
  cdsLotes.Params.ParamByName('KCAD_FAZENDA').AsString := cdsLoteAnaliseKCAD_FAZENDA.AsString;
  cdsLotes.Params.ParamByName('DATA').asSQLTimeStamp := cdsLoteAnaliseDATA.asSQLTimeStamp;
  TCDSSuppl.Open(cdsLotes);
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.LoadCDS(AFilename: string);
begin
  try
    if cdsLotes.Active then
      cdsLotes.Close;
    cdsLoteAnalise.LoadFromFile(AFilename);
  except
    raise Warning.Create('Formato de arquivo inválido');
  end;
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.ValidateFile;
begin
  if cdsLoteAnalise.IsEmpty then
  begin
    cdsLoteAnalise.Close;
    //raise Warning.Create('Arquivo não contém informações.');
    raise Warning.Create('OS de análise sem resultados.');
  end;
  if cdsLoteAnaliseKCAD_FAZENDA.AsString <> Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID then
  begin
    cdsLoteAnalise.Close;
    raise Warning.CreateFmt('Arquivo não pertence a esta fazenda.'#13''#10'(%s)', [Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainName]);
  end;
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.GerarTeste(AFileName : string ; AData: TDateTime);
var
  p : TParams ;
  cds : TClientDataSet ;
const
  _SELECT_TESTE =
        'A.BRINCO FROM ZOO_ANIMAIS_FEMEA AF'
  +#13#10'LEFT JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
  +#13#10'WHERE A.KCAD_FAZENDA=:KCAD_FAZENDA AND ( A.STATUS = :STAUS_VL or A.STATUS = :STAUS_VS) ' ;

begin

    p := TParams.Create ;
    p.CreateParam( ftString,  'KCAD_FAZENDA', ptInput ).AsString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
    p.CreateParam( ftInteger, 'STAUS_VL', ptInput ).asInteger := _ST_STATUS_ANIMAL_VACALACTACAO ;
    p.CreateParam( ftInteger, 'STAUS_VS', ptInput ).asInteger := _ST_STATUS_ANIMAL_VACASECA ;

    cds := nil ;
    DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SELECT_TESTE, p ) ;

    cdsLoteAnalise.FieldDefs.Clear ;
    cdsLoteAnalise.CreateDataSet ;
    cdsLoteAnalise.LogChanges := False ;
    cdsLoteAnalise.Append ;
    cdsLoteAnaliseKCAD_FAZENDA.asString  := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
    cdsLoteAnaliseDATA.AsDateTime        := AData ;

    with cds do
     while not eof  do
       begin
          cdsAnalises.Append ;
          cdsAnalisesBRINCO.asString          := cds.FieldByName( 'BRINCO' ).AsString ;
          cdsAnalisesLACTOSE.asInteger        := Random ( 9 ) * 10  ;
          cdsAnalisesGORDURA.asInteger        := Random ( 9 ) * 10  ;
          cdsAnalisesPROTEINA.asInteger       := Random ( 9 ) * 10  ;
          cdsAnalisesSOLIDOS_TOTAIS.asInteger := Random ( 9 ) * 10  ;
          cdsAnalisesCCS.asInteger            := Random ( 9 ) * 10  ;
          cdsAnalisesESD.asInteger            := Random ( 9 ) * 10  ;
          cdsAnalisesUREIA.asInteger          := Random ( 9 ) * 10  ;
          cdsAnalises.Post ;
          next ;
       end;

    cdsLoteAnalise.Post ;
    cdsLoteAnalise.SaveToFile( AFileName );
    cdsLoteAnalise.EmptyDataSet ;
    cdsLoteAnalise.Close ;
    cdsLoteAnalise.FieldDefs.Clear ;

    p.Free ;
    cds.Free ;

end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.ImportFromXLS(AFileName: string);
begin
   TCDSSuppl.CreateDataSet ( cdsLoteAnalise ) ;

   SMImportLote.SourceFileName := AFileName ;
   SMImportLote.Execute ;
   cdsLoteAnalise.Edit  ;
   cdsLoteAnaliseKCAD_FAZENDA.asString := LoggedUser.DomainID ;

   SMImportAnalises.SourceFileName := AFileName ;
   SMImportAnalises.Execute ;

end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.LoadAnaliseFromFile( AFilename: string );
begin
   if (AnsiLowerCase ( ExtractFileExt ( AFileName )) = '.xls') then
     ImportFromXLS ( AFileName )
   else if (AnsiLowerCase ( ExtractFileExt ( AFileName )) = '.xlsx') then
     ImportFromXLS ( AFileName )
   else if (AnsiLowerCase ( ExtractFileExt ( AFileName )) = '.sql') then
     LoadString ( AFileName )
   else
     LoadCDS(AFilename) ;
   ValidateFile;
   OpenCDS;
end;

const
    _TXTIDX_TIPO      =  0 ;
    _TXTIDX_DTANALISE =  1 ;
    _TXTIDX_AMOSTRA   =  2 ;
    _TXTIDX_BRINCO    =  3 ;
    _TXTIDX_DTLEITE   =  4 ;
    _TXTIDX_GORDURA   =  5 ;
    _TXTIDX_PROTEINA  =  6 ;
    _TXTIDX_LACTOSE   =  7 ;
    _TXTIDX_SOLIDOS   =  8 ;
    _TXTIDX_CCS       =  9 ;
    _TXTIDX_UREIA     = 10 ;
    _TXTIDX_EL        = 11 ;
    _TXTIDX_NOME      = 12 ;
    _TXTIDX_CBG       = 13 ;
    _TXTIDX_ATB       = 14 ;
    _TXTIDX_LOTE      = 15 ;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.LoadString(AFilename: string);
var
   SL : TStringList ;
   I : integer ;

   procedure SetFloatField ( AFloatField : TFloatField ; AString : string ) ;
   var
     FS : TFormatSettings ;
   begin
     FS.DecimalSeparator := '.' ;
     if AString = 'null' then
        AFloatField.clear
     else
        AFloatField.asFloat := StrToFloat ( AString, FS ) ;
   end;

   procedure SetIntegerField ( AIntegerField : TIntegerField ; AString : string ) ;
   begin
     if AString = 'null' then
        AIntegerField.clear
     else
        AIntegerField.asInteger := StrToInt ( AString ) ;
   end;

   procedure ParseStringToAnalize ( AL : string ) ;
   var
     LS : string ;
     LSL : TStringList ;
     x : integer ;
   begin
     FAnalisesImportadas := 0 ;
     LS  := copy ( AL, 133, Length ( AL ) - 134  ) ;
     LSL := TStringList.Create ;
     LSL.QuoteChar := '''' ;
     LSL.Delimiter := ',' ;
     LSL.DelimitedText := LS ;
     if not Trim ( LSL[ _TXTIDX_BRINCO ] ).IsEmpty then
      begin
       Inc ( FAnalisesImportadas ) ;
       cdsAnalises.Append;
       cdsAnalisesBRINCO.asString :=   Trim ( LSL[ _TXTIDX_BRINCO    ] ) ;
       SetFloatField ( cdsAnalisesLACTOSE,          LSL[ _TXTIDX_LACTOSE   ] ) ;
       SetFloatField ( cdsAnalisesGORDURA,          LSL[ _TXTIDX_GORDURA   ] ) ;
       SetFloatField ( cdsAnalisesPROTEINA,         LSL[ _TXTIDX_PROTEINA  ] ) ;
       SetFloatField ( cdsAnalisesSOLIDOS_TOTAIS,   LSL[ _TXTIDX_SOLIDOS   ] ) ;
       SetIntegerField ( cdsAnalisesCCS,            LSL[ _TXTIDX_CCS       ] ) ;
       //SetFloatField ( cdsAnalisesESD,            LSL[ _TXTIDX_???       ] ) ;
       SetFloatField ( cdsAnalisesUREIA,            LSL[ _TXTIDX_UREIA     ] ) ;
       cdsAnalises.Post ;
      end ;
     LSL.Free ;

   end;

   function ParseData( AString : string ) : TDateTime ;
   var
     mm, dd, yy : word ;
   begin
      mm := StrToInt ( Copy ( AString, 1, 2 ) ) ;
      dd := StrToInt ( Copy ( AString, 4, 2 ) ) ;
      yy := StrToInt ( Copy ( AString, 7, 4 ) ) ;
      Result := EncodeDate ( yy, mm, dd ) ;
   end;

begin
   SL := TStringList.Create ;
   SL.LoadFromFile( AFileName );

   TCDSSuppl.CreateDataSet ( cdsLoteAnalise ) ;
   cdsLoteAnalise.Append  ;

   cdsLoteAnaliseKCAD_FAZENDA.asString := LoggedUser.DomainID ;
   cdsLoteAnaliseDATA.asDateTime := ParseData (  SL[0] ) ;

   for I := 2 to SL.Count - 1 do
      ParseStringToAnalize ( SL[I] ) ;

   if FAnalisesImportadas = 0 then
     cdsLoteAnalise.Cancel
   else
     cdsLoteAnalise.Post  ;

   SL.free ;

end;

end.


