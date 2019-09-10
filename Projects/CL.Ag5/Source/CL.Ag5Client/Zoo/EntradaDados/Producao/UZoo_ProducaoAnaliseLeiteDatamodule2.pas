unit UZoo_ProducaoAnaliseLeiteDatamodule2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
   Data.SqlTimSt,
  Datasnap.Provider, SMIBase, SMI2Cell, SMI2XLS  ;

type
  TZoo_ProducaoAnaliseLeiteDatamodule = class(T_dtmBASE)
    cdsRetiros: TClientDataSet;
    cdsRetirosRETIRO: TStringField;
    cdsAnalises: TClientDataSet;
    cdsAnalisesKZOO_ANIMAL_FEMEA: TStringField;
    cdsAnalisesKZOO_LACTACAO: TStringField;
    cdsAnalisesDATALACTACAO: TSQLTimeStampField;
    cdsAnalisesDATA: TSQLTimeStampField;
    cdsAnalisesBRINCO: TStringField;
    cdsAnalisesCCS: TFloatField;
    cdsAnalisesGORDURA: TFloatField;
    cdsAnalisesPROTEINA: TFloatField;
    cdsAnalisesLACTOSE: TFloatField;
    cdsAnalisesSOLIDOS_TOTAIS: TFloatField;
    cdsAnalisesUREIA: TFloatField;
    cdsAnalisesESD: TFloatField;
    cdsAnalisesOBS: TMemoField;
    cdsAnalisesBRINCO_: TStringField;
    cdsImportAnalises: TClientDataSet;
    cdsImportAnalisesKZOO_ANIMAL_FEMEA: TStringField;
    cdsImportAnalisesKZOO_LACTACAO: TStringField;
    cdsImportAnalisesDATALACTACAO: TSQLTimeStampField;
    cdsImportAnalisesDATA: TSQLTimeStampField;
    cdsImportAnalisesBRINCO: TStringField;
    cdsImportAnalisesCCS: TFloatField;
    cdsImportAnalisesGORDURA: TFloatField;
    cdsImportAnalisesPROTEINA: TFloatField;
    cdsImportAnalisesLACTOSE: TFloatField;
    cdsImportAnalisesSOLIDOS_TOTAIS: TFloatField;
    cdsImportAnalisesUREIA: TFloatField;
    cdsImportAnalisesESD: TFloatField;
    SMImportAnalises: TSMImportFromXLS;
    cdsAnalisesIMPORTADO: TStringField;
    cdsAnalisesINSERT_RECORD: TIntegerField;
    cdsAnalisesSOMA_INSERT_RECORDS: TAggregateField;
    cdsAnalisesKZOO_PESAGEM_LEITE: TStringField;
    cdsImportAnalisesKZOO_PESAGEM_LEITE: TStringField;
    procedure cdsAnalisesBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FAnalisesImportadas : integer ;
    FRetiroCaption : string ;
    FRetiroSelected : string ;
    FDataAnalise: TDateTime;
    FMessageImportacaoXLS: String;
    procedure ValidateFile;
    procedure OpenCDS;

    procedure LoadString ( AFilename : string ) ;
    procedure LoadCDS(AFilename: string);
    procedure ImportFromXLS ( AFileName : string ) ;
    procedure EmptycdsAnalises;
    procedure EmptycdsImportAnalises;
    procedure SetDataAnalise(const Value: TDateTime);
    procedure CopyImportToCdsAnalises;
    procedure SetMessageImportacaoXLS(const Value: string);
    procedure CalcESD;
  public
    { Public declarations }
    procedure LoadAnaliseFromFile ( AFilename : string ) ;
    procedure GerarTeste ( AFileName : string ; AData : TDateTime ) ;
    procedure ApplyUpdates ;

    property MessageImportacaoXLS : string read FMessageImportacaoXLS write SetMessageImportacaoXLS;
    property DataAnalise: TDateTime read FDataAnalise write SetDataAnalise;
    function GetRetiros : boolean ;
    procedure SelecionaAnimais ;
    procedure InsertAnaliseDB;
    procedure UpdateAnaliseDB( AKZOO_PESAGEM_LEITE: String);
    function HasRegisterToSave: Boolean;
  end;

implementation

uses ClAg5Types, Exceptions, UDBZootecnico,
  Tc.VCL.Application,
  CDSSuppl  ;

{$R *.dfm}

{ TZoo_ProducaoAnaliseLeiteDatamodule }

procedure TZoo_ProducaoAnaliseLeiteDatamodule.ApplyUpdates;
const
  _SELECT_ANALISES =
              'SELECT AL.KZOO_PESAGEM_LEITE,'
       +#13#10'       AL.KZOO_ANIMAL_FEMEA,'
       +#13#10'       AL.DATA'
       +#13#10'  FROM ZOO_PESAGEM_LEITE_ANALISE AL'
       +#13#10' WHERE AL.DATA = :DATA';

var
  p, p_insert, p_update : TParams ;
  cds: TCLientDataSet;
begin

  cds:= nil;
  p := TParams.Create ;
  p.CreateParam(ftTimeStamp,'DATA',ptInput).AsSQLTimeStamp := DateTimeToSqlTimesTamp( FDataAnalise );
  DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SELECT_ANALISES, p ) ;
  FreeAndNil(p);

  try
    cdsAnalises.DisableControls ;
    cdsAnalises.First;
    while not cdsAnalises.Eof do
     begin
       if cdsAnalisesINSERT_RECORD.AsInteger = 1 then
        begin
          if cds.Locate('KZOO_ANIMAL_FEMEA',cdsAnalisesKZOO_ANIMAL_FEMEA.AsString,[]) then
             UpdateAnaliseDB( cds.FieldByName('KZOO_PESAGEM_LEITE').AsString )
          else
             InsertAnaliseDB;
        end;

       cdsAnalises.Next;
     end;
    EmptycdsAnalises;
  finally
    cdsAnalises.EnableControls ;
  end;


end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.OpenCDS;
begin
  {cdsLotes.Params.ParamByName('KCAD_FAZENDA').AsString := cdsLoteAnaliseKCAD_FAZENDA.AsString;
  cdsLotes.Params.ParamByName('DATA').asSQLTimeStamp := cdsLoteAnaliseDATA.asSQLTimeStamp;
  TCDSSuppl.Open(cdsLotes);}
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.SelecionaAnimais;
const
  _SQL_SELECT_ANIMAIS =
            'SELECT  GUID20() AS KZOO_PESAGEM_LEITE,'
     +#13#10'        L.KCAD_FAZENDA,'
     +#13#10'        L.KZOO_LACTACAO, '
     +#13#10'        L.KZOO_ANIMAL_FEMEA, '
     +#13#10'        A.BRINCO ,'
     +#13#10'        A.BRINCO_ ,'
     +#13#10'        L.DATALACTACAO,'
     +#13#10'        CAST(NULL AS TIMESTAMP) AS "DATA" '
     +#13#10'  FROM ZOO_LACTACOES L'
     +#13#10'  INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL =  L.KZOO_ANIMAL_FEMEA'
     +#13#10'  LEFT JOIN ZOO_ANIMAL_DESCARTES D ON D.KZOO_ANIMAL =  L.KZOO_ANIMAL_FEMEA'
     +#13#10'  INNER JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA =  A.KZOO_ANIMAL'
     +#13#10'  WHERE L.KCAD_FAZENDA = :KCAD_FAZENDA'
     +#13#10'   AND  L.DATALACTACAO <= :DATA'
     +#13#10'   AND (L.DATA_SECAGEM IS NULL OR L.DATA_SECAGEM >= :DATA)'
     +#13#10'   AND ( D.KZOO_ANIMAL IS NULL OR D.DATA > :DATA )'
     +#13#10'   AND (   (:RETIRO IS NULL)'
     +#13#10'        OR ((:RETIRO = TRIM(DAF.RETIRO))  AND (( DAF.RETIRO IS NULL ) OR (TRIM(DAF.RETIRO) = '''')))'
     +#13#10'        OR (TRIM(DAF.RETIRO) = :RETIRO) )'
     ;
var
  cds: TCLientDataSet;
  p: TParams;
  i: Integer;
begin

    try
      cds := nil;
      p   := TParams.Create(nil);

      cdsAnalises.CancelUpdates ;
      EmptycdsAnalises;
      cdsAnalises.DisableControls ;

      if ( cdsRetiros.RecordCount < 3 ) or ( cdsRetiros.RecNo = 1 ) then
         begin
            if cdsRetiros.RecNo = 1 then
               FRetiroSelected := 'NULL';

            if FRetiroSelected = 'NULL'  then
               FRetiroCaption  := 'Todos os animais em lactação' ;
         end
      else if ( cdsRetirosRETIRO.AsString = '<animais sem retiro>' ) then
         begin
           FRetiroCaption  := 'animais sem retiro'  ;
           FRetiroSelected := '';
         end
      else
         begin
           FRetiroCaption  := Format ( 'animais do retiro : %s', [cdsRetirosRETIRO.AsString] )  ;
           FRetiroSelected :=  cdsRetirosRETIRO.AsString ;
         end;

      p.CreateParam(ftString    , 'KCAD_FAZENDA' , ptInput).AsString := LoggedUser.DomainID ;
      p.CreateParam(ftTimeStamp , 'DATA'         , ptInput).AsSQLTimeStamp := DateTimeToSqlTimesTamp( FDataAnalise );
      p.CreateParam(ftString    , 'RETIRO'       , ptInput).Bound := False;
      p.ParamByName('RETIRO').Clear;
      if (FRetiroSelected <> 'NULL') then
        p.ParamByName('RETIRO').AsString := FRetiroSelected;

      DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SQL_SELECT_ANIMAIS, p ) ;
      cds.First;
      while not cds.Eof do
       begin
         cdsAnalises.Append;
         for I := 0 to cds.FieldCount -1 do
          begin
            if (cdsAnalises.FindField(cds.Fields[i].FieldName) <> nil) and
               (not cds.Fields[i].IsNull) then
             begin
               cdsAnalises.FieldByName( cds.Fields[i].FieldName ).Value := cds.Fields[i].Value;
             end;
          end;
         cdsAnalises.Post;
         cds.Next;
       end;

    finally
      cds.Free;
      p.Free;
      cdsAnalises.EnableControls ;
      cdsAnalises.First;
    end;

end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.SetDataAnalise(
  const Value: TDateTime);
begin
  FDataAnalise := Value;
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.SetMessageImportacaoXLS(
  const Value: string);
begin
  FMessageImportacaoXLS := Value;
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.UpdateAnaliseDB( AKZOO_PESAGEM_LEITE: String);
const
  _SQL_UPDATE =
              'UPDATE ZOO_PESAGEM_LEITE_ANALISE'
       +#13#10'SET KCAD_FAZENDA = :KCAD_FAZENDA,'
       +#13#10'    KZOO_LACTACAO = :KZOO_LACTACAO,'
       +#13#10'    KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA,'
       +#13#10'    DATALACTACAO = :DATALACTACAO,'
       +#13#10'    DATA = :DATA,'
       +#13#10'    GORDURA = :GORDURA,'
       +#13#10'    PROTEINA = :PROTEINA,'
       +#13#10'    LACTOSE = :LACTOSE,'
       +#13#10'    SOLIDOS_TOTAIS = :SOLIDOS_TOTAIS,'
       +#13#10'    ESD = :ESD,'
       +#13#10'    CCS = :CCS,'
       +#13#10'    UREIA = :UREIA,'
       +#13#10'    OBS = :OBS'
       +#13#10'WHERE (KZOO_PESAGEM_LEITE = :KZOO_PESAGEM_LEITE)';
var
   p_update : TParams ;
begin
  p_update :=  TParams.Create(nil) ;
  p_update.createParam ( ftString,     'KCAD_FAZENDA'      , ptInput  ).AsString := LoggedUser.DomainID   ;
  p_update.createParam ( ftString,     'KZOO_LACTACAO'     , ptInput  ).AsString := cdsAnalisesKZOO_LACTACAO.AsString   ;
  p_update.createParam ( ftString,     'KZOO_ANIMAL_FEMEA' , ptInput  ).AsString := cdsAnalisesKZOO_ANIMAL_FEMEA.AsString   ;
  if cdsAnalisesDATALACTACAO.IsNull then
    p_update.createParam ( ftTimestamp,  'DATALACTACAO'      , ptInput  ).Clear
  else
    p_update.createParam ( ftTimestamp,  'DATALACTACAO'      , ptInput  ).AsSQLTimeStamp := cdsAnalisesDATALACTACAO.AsSQLTimeStamp   ;

  if cdsAnalisesDATA.IsNull then
    p_update.createParam ( ftTimestamp,  'DATA'              , ptInput  ).Clear
  else
    p_update.createParam ( ftTimestamp,  'DATA'              , ptInput  ).AsSQLTimeStamp := cdsAnalisesDATA.AsSQLTimeStamp   ;

  if cdsAnalisesGORDURA.IsNull then
    p_update.createParam ( ftFloat,      'GORDURA'           , ptInput  ).Clear
  else
    p_update.createParam ( ftFloat,      'GORDURA'           , ptInput  ).AsFloat := cdsAnalisesGORDURA.AsFloat   ;

  if cdsAnalisesPROTEINA.IsNull then
    p_update.createParam ( ftFloat,      'PROTEINA'           , ptInput  ).Clear
  else
    p_update.createParam ( ftFloat,      'PROTEINA'          , ptInput  ).AsFloat := cdsAnalisesPROTEINA.AsFloat   ;

  if cdsAnalisesLACTOSE.IsNull then
    p_update.createParam ( ftFloat,      'LACTOSE'           , ptInput  ).Clear
  else
    p_update.createParam ( ftFloat,      'LACTOSE'           , ptInput  ).AsFloat := cdsAnalisesLACTOSE.AsFloat   ;

  if cdsAnalisesSOLIDOS_TOTAIS.IsNull then
    p_update.createParam ( ftFloat,      'SOLIDOS_TOTAIS'           , ptInput  ).Clear
  else
    p_update.createParam ( ftFloat,      'SOLIDOS_TOTAIS'    , ptInput  ).AsFloat := cdsAnalisesSOLIDOS_TOTAIS.AsFloat   ;

  if cdsAnalisesESD.IsNull then
    p_update.createParam ( ftFloat,      'ESD'           , ptInput  ).Clear
  else
    p_update.createParam ( ftFloat,      'ESD'               , ptInput  ).AsFloat := cdsAnalisesESD.AsFloat   ;

  if cdsAnalisesCCS.IsNull then
    p_update.createParam ( ftFloat,      'CCS'           , ptInput  ).Clear
  else
    p_update.createParam ( ftInteger,    'CCS'               , ptInput  ).AsFloat := cdsAnalisesCCS.AsFloat   ;

  if cdsAnalisesUREIA.IsNull then
    p_update.createParam ( ftFloat,      'UREIA'           , ptInput  ).Clear
  else
    p_update.createParam ( ftFloat,      'UREIA'             , ptInput  ).AsFloat := cdsAnalisesUREIA.AsFloat   ;

  if cdsAnalisesOBS.IsNull then
    p_update.CreateParam(ftString,'OBS',ptInput).Clear
  else
    p_update.CreateParam(ftString,'OBS',ptInput).AsString := cdsAnalisesOBS.AsString;

  p_update.createParam ( ftString,     'KZOO_PESAGEM_LEITE', ptInput  ).AsString := AKZOO_PESAGEM_LEITE   ;

  DBResources['ZOOTECNICO'].Execute(_SQL_UPDATE, p_update);
  p_update.Free;
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.LoadCDS(AFilename: string);
begin
 { try
    if cdsLotes.Active then
      cdsLotes.Close;
    cdsLoteAnalise.LoadFromFile(AFilename);
  except
    raise Warning.Create('Formato de arquivo inválido');
  end;}
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.ValidateFile;
begin
  {if cdsLoteAnalise.IsEmpty then
  begin
    cdsLoteAnalise.Close;
    //raise Warning.Create('Arquivo não contém informações.');
    raise Warning.Create('OS de análise sem resultados.');
  end;
  if cdsLoteAnaliseKCAD_FAZENDA.AsString <> Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID then
  begin
    cdsLoteAnalise.Close;
    raise Warning.CreateFmt('Arquivo não pertence a esta fazenda.'#13''#10'(%s)', [Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainName]);
  end;}
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.CalcESD;
begin
  if (not cdsAnalisesSOLIDOS_TOTAIS.IsNull) and
     (not cdsAnalisesGORDURA.IsNull) then
    cdsAnalisesESD.Value := (cdsAnalisesSOLIDOS_TOTAIS.Value - cdsAnalisesGORDURA.Value)
  else
    cdsAnalisesESD.Clear;
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.cdsAnalisesBeforePost(
  DataSet: TDataSet);
begin
  CalcESD;

  if  ( (not cdsAnalisesPROTEINA.IsNull) or (not cdsAnalisesGORDURA.isNull) or
        (not cdsAnalisesCCS.IsNull) or (not cdsAnalisesLACTOSE.IsNull) or
        (not cdsAnalisesSOLIDOS_TOTAIS.IsNull) or (not cdsAnalisesUREIA.IsNull) )  then
   begin
     cdsAnalisesDATA.AsDateTime := FDataAnalise;
     cdsAnalisesINSERT_RECORD.AsInteger := 1
   end
  else
   begin
     cdsAnalisesINSERT_RECORD.AsInteger := 0;
     cdsAnalisesDATA.Clear;
   end;

end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.CopyImportToCdsAnalises;
var
 HadRecordToImport: Boolean;
begin

  cdsImportAnalises.DisableControls;
  cdsAnalises.DisableControls;
  HadRecordToImport := False;
  try
    cdsImportAnalises.First;
    while not cdsImportAnalises.Eof do
     begin
       if cdsAnalises.Locate('BRINCO',cdsImportAnalisesBRINCO.AsVariant,[]) then
        begin
          cdsAnalises.Edit;

          cdsAnalisesCCS.Value := cdsImportAnalisesCCS.Value;
          cdsAnalisesGORDURA.Value := cdsImportAnalisesGORDURA.Value;
          cdsAnalisesPROTEINA.Value := cdsImportAnalisesPROTEINA.Value;
          cdsAnalisesLACTOSE.Value := cdsImportAnalisesLACTOSE.Value;
          cdsAnalisesSOLIDOS_TOTAIS.Value := cdsImportAnalisesSOLIDOS_TOTAIS.Value;
          cdsAnalisesUREIA.Value := cdsImportAnalisesUREIA.Value;
          cdsAnalisesDATA.AsDateTime := FDataAnalise;
          cdsAnalisesIMPORTADO.AsString := 'T';

          HadRecordToImport := True;
          cdsAnalises.Post;
        end;
       cdsImportAnalises.Next;
     end;

  finally
    cdsImportAnalises.EnableControls;
    cdsAnalises.EnableControls;
    if HadRecordToImport then
     FMessageImportacaoXLS := 'Importação finalizada com sucesso.' ;
  end;
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.EmptycdsAnalises;
begin
  cdsAnalises.Filtered := False;
  cdsAnalises.DisableControls;
  cdsAnalises.First;
  while not cdsAnalises.Eof do
    cdsAnalises.Delete;

  cdsAnalises.EnableControls;
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.EmptycdsImportAnalises;
begin
  cdsImportAnalises.Filtered := False;
  cdsImportAnalises.DisableControls;
  cdsImportAnalises.First;
  while not cdsImportAnalises.Eof do
    cdsImportAnalises.Delete;

  cdsImportAnalises.EnableControls;
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
      {
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
         }
end;

function TZoo_ProducaoAnaliseLeiteDatamodule.GetRetiros: boolean;
const

   _SELECT_RETIROS =
         'SELECT ''<todos animais em lactação>'' RETIRO'
  +#13#10'FROM RDB$DATABASE'
  +#13#10'UNION ALL'
  +#13#10'SELECT DISTINCT TRIM( F.RETIRO ) RETIRO'
  +#13#10'FROM ZOO_ANIMAIS_FEMEA F'
  +#13#10'INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = F.KZOO_ANIMAL_FEMEA'
  +#13#10'WHERE A.KCAD_FAZENDA = :KCAD_FAZENDA AND F.RETIRO IS NOT NULL AND TRIM(F.RETIRO) <> '''''
  +#13#10'  AND A.STATUS <> :STATUS_DESCARTADA'
  +#13#10'UNION ALL'
  +#13#10'SELECT ''<animais sem retiro>'' RETIRO'
  +#13#10'FROM RDB$DATABASE'
  +#13#10'WHERE EXISTS (SELECT 1 FROM ZOO_ANIMAIS_FEMEA F INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = F.KZOO_ANIMAL_FEMEA'
  +#13#10'                WHERE A.KCAD_FAZENDA = :KCAD_FAZENDA AND (F.RETIRO IS NULL OR TRIM(F.RETIRO) = '''')'
   +#13#10'                 AND A.STATUS <> :STATUS_DESCARTADA'
  +#13#10'                ROWS 1 )' ;
var
  p : TParams ;
begin
  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).AsString := LoggedUser.DomainID ;
  p.CreateParam( ftString, 'STATUS_DESCARTADA', ptInput ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
  DBResources['ZOOTECNICO'].populateClientDataSet ( cdsRetiros, _SELECT_RETIROS, p ) ;
  p.Free ;
  Result := cdsRetiros.RecordCount > 2 ;
  if not Result then
     FRetiroSelected := 'NULL' ;

end;

function TZoo_ProducaoAnaliseLeiteDatamodule.HasRegisterToSave: Boolean;
begin
  Result := (not cdsAnalisesSOMA_INSERT_RECORDS.IsNull) and ( cdsAnalisesSOMA_INSERT_RECORDS.Value > 0);
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.ImportFromXLS(AFileName: string);
begin
   EmptycdsImportAnalises;
   SMImportAnalises.SourceFileName := AFileName ;
   SMImportAnalises.Execute ;
   CopyImportToCdsAnalises;
end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.InsertAnaliseDB;
const
   _SQL_INSERT =
              'INSERT INTO ZOO_PESAGEM_LEITE_ANALISE (KZOO_PESAGEM_LEITE, KCAD_FAZENDA, KZOO_LACTACAO, KZOO_ANIMAL_FEMEA,'
       +#13#10'                                      DATALACTACAO, DATA, GORDURA, PROTEINA, LACTOSE, SOLIDOS_TOTAIS, ESD, CCS, UREIA, OBS)'
       +#13#10'VALUES (:KZOO_PESAGEM_LEITE, :KCAD_FAZENDA, :KZOO_LACTACAO, :KZOO_ANIMAL_FEMEA, :DATALACTACAO, :DATA, :GORDURA,'
       +#13#10'        :PROTEINA, :LACTOSE, :SOLIDOS_TOTAIS, :ESD, :CCS, :UREIA, :OBS)';
var
   p_insert : TParams ;
begin
  p_insert :=  TParams.Create(nil) ;
  p_insert.createParam ( ftString,     'KZOO_PESAGEM_LEITE', ptInput  ).AsString := cdsAnalisesKZOO_PESAGEM_LEITE.AsString   ;
  p_insert.createParam ( ftString,     'KCAD_FAZENDA'      , ptInput  ).AsString := LoggedUser.DomainID   ;
  p_insert.createParam ( ftString,     'KZOO_LACTACAO'     , ptInput  ).AsString := cdsAnalisesKZOO_LACTACAO.AsString   ;
  p_insert.createParam ( ftString,     'KZOO_ANIMAL_FEMEA' , ptInput  ).AsString := cdsAnalisesKZOO_ANIMAL_FEMEA.AsString   ;

  if cdsAnalisesDATALACTACAO.IsNull then
    p_insert.createParam ( ftTimestamp,  'DATALACTACAO'      , ptInput  ).Clear
  else
    p_insert.createParam ( ftTimestamp,  'DATALACTACAO'      , ptInput  ).AsSQLTimeStamp := cdsAnalisesDATALACTACAO.AsSQLTimeStamp   ;

  if cdsAnalisesDATA.IsNull then
    p_insert.createParam ( ftTimestamp,  'DATA'              , ptInput  ).Clear
  else
    p_insert.createParam ( ftTimestamp,  'DATA'              , ptInput  ).AsSQLTimeStamp := cdsAnalisesDATA.AsSQLTimeStamp   ;

  if cdsAnalisesGORDURA.IsNull then
    p_insert.createParam ( ftFloat,      'GORDURA'           , ptInput  ).Clear
  else
    p_insert.createParam ( ftFloat,      'GORDURA'           , ptInput  ).AsFloat := cdsAnalisesGORDURA.AsFloat   ;

  if cdsAnalisesPROTEINA.IsNull then
    p_insert.createParam ( ftFloat,      'PROTEINA'           , ptInput  ).Clear
  else
    p_insert.createParam ( ftFloat,      'PROTEINA'          , ptInput  ).AsFloat := cdsAnalisesPROTEINA.AsFloat   ;

  if cdsAnalisesLACTOSE.IsNull then
    p_insert.createParam ( ftFloat,      'LACTOSE'           , ptInput  ).Clear
  else
    p_insert.createParam ( ftFloat,      'LACTOSE'           , ptInput  ).AsFloat := cdsAnalisesLACTOSE.AsFloat   ;

  if cdsAnalisesSOLIDOS_TOTAIS.IsNull then
    p_insert.createParam ( ftFloat,      'SOLIDOS_TOTAIS'           , ptInput  ).Clear
  else
    p_insert.createParam ( ftFloat,      'SOLIDOS_TOTAIS'    , ptInput  ).AsFloat := cdsAnalisesSOLIDOS_TOTAIS.AsFloat   ;

  if cdsAnalisesESD.IsNull then
    p_insert.createParam ( ftFloat,      'ESD'           , ptInput  ).Clear
  else
    p_insert.createParam ( ftFloat,      'ESD'               , ptInput  ).AsFloat := cdsAnalisesESD.AsFloat   ;

  if cdsAnalisesCCS.IsNull then
    p_insert.createParam ( ftFloat,      'CCS'           , ptInput  ).Clear
  else
    p_insert.createParam ( ftInteger,    'CCS'               , ptInput  ).AsFloat := cdsAnalisesCCS.AsFloat   ;

  if cdsAnalisesUREIA.IsNull then
    p_insert.createParam ( ftFloat,      'UREIA'           , ptInput  ).Clear
  else
    p_insert.createParam ( ftFloat,      'UREIA'             , ptInput  ).AsFloat := cdsAnalisesUREIA.AsFloat   ;

  if cdsAnalisesOBS.IsNull then
    p_insert.CreateParam(ftString,'OBS',ptInput).Clear
  else
    p_insert.CreateParam(ftString,'OBS',ptInput).AsString := cdsAnalisesOBS.AsString;

  DBResources['ZOOTECNICO'].Execute(_SQL_INSERT, p_insert);
  p_insert.Free;

end;

procedure TZoo_ProducaoAnaliseLeiteDatamodule.LoadAnaliseFromFile( AFilename: string );
begin
   if (AnsiLowerCase ( ExtractFileExt ( AFileName )) = '.xls') then
     ImportFromXLS ( AFileName )
   else if (AnsiLowerCase ( ExtractFileExt ( AFileName )) = '.xlsx') then
     ImportFromXLS ( AFileName )
   else if (AnsiLowerCase ( ExtractFileExt ( AFileName )) = '.sql') then
     LoadString ( AFileName );
   {else
     LoadCDS(AFilename) ;
   ValidateFile;
   OpenCDS;}
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
   HadRecordToImport: Boolean;

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

   procedure SetIntegerField ( AIntegerField : TField ; AString : string ) ;
   begin
     if AString = 'null' then
        AIntegerField.clear
     else
        AIntegerField.asInteger := Trunc(StrToInt ( AString )) ;
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

   procedure ParseStringToAnalize ( AL : string ) ;
   var
     LS : string ;
     LSL : TStringList ;
     x : integer ;
   begin
     LS  := copy ( AL, 133, Length ( AL ) - 134  ) ;
     LSL := TStringList.Create ;
     LSL.QuoteChar := '''' ;
     LSL.Delimiter := ',' ;
     LSL.DelimitedText := LS ;


     if (not Trim ( LSL[ _TXTIDX_BRINCO ] ).IsEmpty) and
        (cdsAnalises.Locate('BRINCO',Trim ( LSL[ _TXTIDX_BRINCO ] ),[])) then
      begin
       //cdsAnalises.Append;
       cdsAnalises.Edit;
       //cdsAnalisesDATA.asDateTime := ParseData (  SL[0] ) ;
       cdsAnalisesDATA.AsDateTime := FDataAnalise;
       cdsAnalisesBRINCO.asString :=   Trim ( LSL[ _TXTIDX_BRINCO    ] ) ;
       SetFloatField ( cdsAnalisesLACTOSE,          LSL[ _TXTIDX_LACTOSE   ] ) ;
       SetFloatField ( cdsAnalisesGORDURA,          LSL[ _TXTIDX_GORDURA   ] ) ;
       SetFloatField ( cdsAnalisesPROTEINA,         LSL[ _TXTIDX_PROTEINA  ] ) ;
       SetFloatField ( cdsAnalisesSOLIDOS_TOTAIS,   LSL[ _TXTIDX_SOLIDOS   ] ) ;
       SetIntegerField ( cdsAnalisesCCS,            LSL[ _TXTIDX_CCS       ] ) ;
       //SetFloatField ( cdsAnalisesESD,            LSL[ _TXTIDX_???       ] ) ;
       SetFloatField ( cdsAnalisesUREIA,            LSL[ _TXTIDX_UREIA     ] ) ;
       if cdsAnalisesIMPORTADO.AsString <> 'T' then
         Inc ( FAnalisesImportadas ) ;
       if  ( (not cdsAnalisesPROTEINA.IsNull) or (not cdsAnalisesGORDURA.isNull) or
           (not cdsAnalisesCCS.IsNull) or (not cdsAnalisesLACTOSE.IsNull) or
           (not cdsAnalisesSOLIDOS_TOTAIS.IsNull) or (not cdsAnalisesUREIA.IsNull) )  then
        begin
         cdsAnalisesIMPORTADO.AsString := 'T';
        end;
       HadRecordToImport := True;
       cdsAnalises.Post ;
      end ;
     LSL.Free ;

   end;

begin
   FAnalisesImportadas := 0 ;
   FMessageImportacaoXLS := '';
   SL := TStringList.Create ;
   SL.LoadFromFile( AFileName );

   //TCDSSuppl.CreateDataSet ( cdsLoteAnalise ) ;
   //cdsAnalises.Append  ;

   //cdsLoteAnaliseKCAD_FAZENDA.asString := LoggedUser.DomainID ;
   cdsAnalises.DisableControls;
  HadRecordToImport := False;
  try

    for I := 2 to SL.Count - 1 do
      ParseStringToAnalize ( SL[I] ) ;
  finally
    SL.free ;
    cdsAnalises.EnableControls;
    if HadRecordToImport then
     FMessageImportacaoXLS := Format( 'Importação finalizada com sucesso.'
                               +#13#10'%d análises importadas',[FAnalisesImportadas]) ;
  end;


end;

end.


