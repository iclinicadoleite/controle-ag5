unit UZoo_RelatorioAvaliacaoBezerrasDatamodule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Datasnap.Provider, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, UDBZootecnico, CLAg5Types,
  Tc.DBRTL.AbstractDB,
  UdtmSYS_BASE;

type
  TZooRelatotioAvaliacaoBezerras_dtm = class({TDataModule}T_dtmBASE)
    sqlResultados: TTcSQLDataSet;
    dspResultados: TDataSetProvider;
    cdsResultados: TClientDataSet;
    cdsCategoria: TClientDataSet;
    cdsCategoriaTIPO: TStringField;
    cdsCategoriaVALOR: TStringField;
    cdsCategoriaDESCRICAO: TStringField;
    cdsCategoriaORDEM: TIntegerField;
  private
    { Private declarations }
    FcdsResults : TClientDataSet;
    FSelectStatus : String;
    FStatusAnimal : Integer;
    function GetNumDiagnosticos: Integer;
    procedure PrepareCDS;
    procedure LoadData;
    procedure SetSelectSatus(const Value: String);
    procedure SetStatusAnimal(const Value: Integer);
    procedure AjustarFields(cds:TClientDataSet; AFieldName, ADisplayLabel: String; AVisible: Boolean = True);
    procedure FormatCDSResultados;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure OpenTables ; override ;
    property SelectStatus: String read FSelectStatus write SetSelectSatus;
    property StatusAnimal: Integer read FStatusAnimal write SetStatusAnimal;
  end;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TZooRelatotioAvaliacaoBezerras_dtm }

procedure TZooRelatotioAvaliacaoBezerras_dtm.AjustarFields(cds: TClientDataSet;
  AFieldName, ADisplayLabel: String; AVisible: Boolean = True);
begin
  TField( cds.FieldByName( AFieldName ) ).DisplayLabel := ADisplayLabel;
  TField( cds.FieldByName( AFieldName ) ).Visible := AVisible
end;

constructor TZooRelatotioAvaliacaoBezerras_dtm.Create(AOwner: TComponent);
begin
  inherited;
  FcdsResults := TClientDataSet.Create(Self);
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_STATUS_FEMEA,  cdsCategoria   );
end;

destructor TZooRelatotioAvaliacaoBezerras_dtm.Destroy;
begin
  FreeAndNil( FcdsResults );
  inherited;
end;

procedure TZooRelatotioAvaliacaoBezerras_dtm.FormatCDSResultados;
var
  CountDiagnosticos, Count : Integer;
begin
  CountDiagnosticos := GetNumDiagnosticos;
  AjustarFields(cdsResultados, 'KZOO_ANIMAL'         , ''                       , False);
  AjustarFields(cdsResultados, 'BRINCO_'             , ''                       , False);
  AjustarFields(cdsResultados, 'BRINCO'              , 'Brinco'                 , True );
  AjustarFields(cdsResultados, 'STATUS'              , 'Categoria'              , False);
  AjustarFields(cdsResultados, 'NASCIMENTO'          , 'Nascimento'             , True );
  AjustarFields(cdsResultados, 'PESO_NASC'           , 'Peso Nasc.'             , True );
  AjustarFields(cdsResultados, 'RACA'                , 'Raça'                   , True );
  AjustarFields(cdsResultados, 'GRAUSANGUE'          , 'Grau de sangue'         , True );
  AjustarFields(cdsResultados, 'NOME_PAI'            , 'Nome pai'               , True );
  AjustarFields(cdsResultados, 'PESO_30'             , 'Peso 30 dias'           , True );
  AjustarFields(cdsResultados, 'DATA_PESO_30'        , 'Data peso 30 dias'      , True );
  AjustarFields(cdsResultados, 'PESO_60'             , 'Peso 60 dias'           , True );
  AjustarFields(cdsResultados, 'DATA_PESO_60'        , 'Data peso 60 dias'      , True );
  AjustarFields(cdsResultados, 'PESO_DESMAME'        , 'Peso ao desmame'        , True );
  AjustarFields(cdsResultados, 'DATA_PESO_DESMAME'   , 'Data peso ao desmame'   , True );


  Count := 1;
  while (Count <= CountDiagnosticos) do
   begin
     AjustarFields(cdsResultados, 'KZOO_ANIMAL_DIAGNOSTICO_'+IntToStr(Count)   , ''   , False );
     AjustarFields(cdsResultados, 'DIAGNOSTICO_'+IntToStr(Count)  , 'Diagnóstico '+IntToStr(Count)  , True );
     AjustarFields(cdsResultados, 'DATA_DIAGNOSTICO_'+IntToStr(Count)  , 'Data diagnóstico '+IntToStr(Count)  , True );
     Inc(Count);
   end;
end;

function TZooRelatotioAvaliacaoBezerras_dtm.GetNumDiagnosticos: Integer;
const
  _SELECT_MAIOR_NUMERO_DIAGNSOTICOS =
            'SELECT MAX(COUNT_DIAG) "QUANTIDADE"'
     +#13#10'FROM'
     +#13#10'  ('
     +#13#10'    SELECT'
     +#13#10'         A.KZOO_ANIMAL,'
     +#13#10'         COUNT( D.KZOO_ANIMAL_DIAGNOSTICO) AS COUNT_DIAG'
     +#13#10'      FROM ZOO_ANIMAIS A'
     +#13#10'     INNER JOIN ZOO_ANIMAIS_FEMEA F ON F.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'
     +#13#10'     INNER JOIN ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'
     +#13#10'     WHERE D.EXCLUIDO = ''F'''
     +#13#10'       AND (:SELECT_STATUS = ''T'' OR A.STATUS = :STATUS)'
     +#13#10'     GROUP BY A.KZOO_ANIMAL    )';

var
  cds: TClientDataSet;
  p: TParams;
begin
  Result := 0;
  cds:= nil;
  p:= Tparams.Create(nil);
  p.CreateParam(ftString,'SELECT_STATUS',ptInput).AsString := FSelectStatus;
  p.CreateParam(ftInteger,'STATUS'       ,ptInput).AsInteger := FStatusAnimal;

  TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, _SELECT_MAIOR_NUMERO_DIAGNSOTICOS, p);

  Result := cds.FieldByName('QUANTIDADE').AsInteger;

  p.Free;
  cds.Free;
end;

procedure TZooRelatotioAvaliacaoBezerras_dtm.LoadData;
const
   _SELECT_HISTORICO =
             '/*DADOS NASCIMENTO*/'   //
      +#13#10'SELECT A.BRINCO,'
      +#13#10'       A.BRINCO_,'
      +#13#10'       A.KZOO_ANIMAL,'
      +#13#10'       STS.SYS$DESCRIPTION "STATUS",'
      +#13#10'       STR.SYS$DESCRIPTION "RACA",'
      +#13#10'       L.NOMEPAI,'
      +#13#10'       1 "TIPO_REGISTRO", /*NASCIMENTO*/'
      +#13#10'       C.PESO "PESO",'
      +#13#10'       CAST( F.NASCIMENTO AS DATE) "DATA",'
      +#13#10'       CAST(NULL AS SYS$FKGUID20) "KZOO_ANIMAL_DIAGNOSTICO",'
      +#13#10'       CAST( NULL AS VARCHAR(60) ) "DIAGNOSTICO"'
      +#13#10'  FROM ZOO_ANIMAIS A'
      +#13#10' INNER JOIN ZOO_ANIMAIS_FEMEA F ON F.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'
      +#13#10' LEFT  JOIN ZOO_ANIMAL_CRESCIMENTO C ON C.KZOO_ANIMAL_CRESCIMENTO = F.KCRESCIMENTO_NASCIMENTO'
      +#13#10' LEFT  JOIN ZOO_ANIMAL_LINHAGEM L ON A.KZOO_ANIMAL = L.KZOO_ANIMAL'
      +#13#10' LEFT  JOIN SYS$TYPES_GETDESCRIPTION( ''RACA_ANIMAIS'', A.RACA ) STR ON 1=1'
      +#13#10' LEFT  JOIN SYS$TYPES_GETDESCRIPTION( ''SIGLA_STATUS_ANIMAL'', A.STATUS ) STS ON 1=1'
      +#13#10' WHERE (:SELECT_STATUS = ''T'' OR A.STATUS = :STATUS)'
      +#13#10'UNION ALL'
      +#13#10'/*PESAGEM 30 DIAS*/'      //
      +#13#10'SELECT A.BRINCO,'
      +#13#10'       A.BRINCO_,'
      +#13#10'       A.KZOO_ANIMAL,'
      +#13#10'       STS.SYS$DESCRIPTION "STATUS",'
      +#13#10'       CAST(NULL AS VARCHAR(60)) "RACA",'
      +#13#10'       CAST(NULL AS VARCHAR(60)) "NOMEPAI",'
      +#13#10'       2 "TIPO_REGISTRO", /*PESO 30 DIAS*/'
      +#13#10'       C.PESO "PESO",'
      +#13#10'       CAST(C.DATA AS DATE) "DATA",'
      +#13#10'       CAST(NULL AS SYS$FKGUID20) "KZOO_ANIMAL_DIAGNOSTICO",'
      +#13#10'       CAST( NULL AS VARCHAR(60) ) "DIAGNOSTICO"'
      +#13#10'  FROM ZOO_ANIMAIS A'
      +#13#10' INNER JOIN ZOO_ANIMAIS_FEMEA F ON F.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'
      +#13#10' INNER JOIN ZOO_ANIMAL_CRESCIMENTO C ON C.KZOO_ANIMAL = A.KZOO_ANIMAL'
      +#13#10' LEFT  JOIN SYS$TYPES_GETDESCRIPTION( ''SIGLA_STATUS_ANIMAL'', A.STATUS ) STS ON 1=1'
      +#13#10' WHERE C.DATA BETWEEN F.NASCIMENTO + 25 AND F.NASCIMENTO + 35'
      +#13#10'   AND (:SELECT_STATUS = ''T'' OR A.STATUS = :STATUS)'
      +#13#10'UNION ALL'
      +#13#10'/*PESAGEM 60 DIAS*/'    //
      +#13#10'SELECT A.BRINCO,'
      +#13#10'       A.BRINCO_,'
      +#13#10'       A.KZOO_ANIMAL,'
      +#13#10'       STS.SYS$DESCRIPTION "STATUS",'
      +#13#10'       CAST(NULL AS VARCHAR(60)) "RACA",'
      +#13#10'       CAST(NULL AS VARCHAR(60)) "NOMEPAI",'
      +#13#10'       3 "TIPO_REGISTRO", /*PESO 60 DIAS*/'
      +#13#10'       C.PESO "PESO",'
      +#13#10'       CAST(C.DATA AS DATE) "DATA",'
      +#13#10'       CAST(NULL AS SYS$FKGUID20) "KZOO_ANIMAL_DIAGNOSTICO",'
      +#13#10'       CAST( NULL AS VARCHAR(60) ) "DIAGNOSTICO"'
      +#13#10'  FROM ZOO_ANIMAIS A'
      +#13#10' INNER JOIN ZOO_ANIMAIS_FEMEA F ON F.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'
      +#13#10' INNER JOIN ZOO_ANIMAL_CRESCIMENTO C ON C.KZOO_ANIMAL = A.KZOO_ANIMAL'
      +#13#10' LEFT  JOIN SYS$TYPES_GETDESCRIPTION( ''SIGLA_STATUS_ANIMAL'', A.STATUS ) STS ON 1=1'
      +#13#10' WHERE C.DATA BETWEEN F.NASCIMENTO + 55 AND F.NASCIMENTO + 65'
      +#13#10'   AND (:SELECT_STATUS = ''T'' OR A.STATUS = :STATUS)'
      +#13#10'UNION ALL'
      +#13#10'/*PESAGEM DESMAME*/'  //
      +#13#10'SELECT A.BRINCO,'
      +#13#10'       A.BRINCO_,'
      +#13#10'       A.KZOO_ANIMAL,'
      +#13#10'       STS.SYS$DESCRIPTION "STATUS",'
      +#13#10'       CAST(NULL AS VARCHAR(60)) "RACA",'
      +#13#10'       CAST(NULL AS VARCHAR(60)) "NOMEPAI",'
      +#13#10'       4 "TIPO_REGISTRO", /*PESO DESMAME*/'
      +#13#10'       CAST('
      +#13#10'       (SELECT IIF((PESO_POS.DATA IS NULL), PESO_ANT.PESO, IIF((PESO_ANT.DATA IS NULL), '
      +#13#10'                                                         PESO_POS.PESO, IIF(((A.DATADESMAME - PESO_ANT.DATA) <= (PESO_POS.DATA - A.DATADESMAME)),'
      +#13#10'                                                                               PESO_ANT.PESO, PESO_POS.PESO ) ) )'
      +#13#10'          FROM'
      +#13#10'          (select CRE.DATA, CRE.PESO from ZOO_ANIMAL_CRESCIMENTO CRE where CRE.KZOO_ANIMAL = A.KZOO_ANIMAL and CRE.DATA <= A.DATADESMAME AND (A.DATADESMAME - CRE.DATA <= 7)'
      +#13#10'            order by CRE.DATA desc rows 1 ) PESO_ANT'
      +#13#10'          LEFT JOIN'
      +#13#10'          (select CRE.DATA, CRE.PESO from ZOO_ANIMAL_CRESCIMENTO CRE where CRE.KZOO_ANIMAL = A.KZOO_ANIMAL and CRE.DATA >= A.DATADESMAME AND (CRE.DATA - A.DATADESMAME <= 7)'
      +#13#10'            order by CRE.DATA rows 1) PESO_POS ON 1 = 1)'
      +#13#10'            AS INTEGER ) "PESO",'
      +#13#10'       CAST('
      +#13#10'       (SELECT IIF((PESO_POS.DATA IS NULL), PESO_ANT.DATA, IIF((PESO_ANT.DATA IS NULL),'
      +#13#10'                                                         PESO_POS.DATA, IIF(((A.DATADESMAME - PESO_ANT.DATA) <= (PESO_POS.DATA - A.DATADESMAME)),'
      +#13#10'                                                                               PESO_ANT.DATA, PESO_POS.DATA ) ) )'
      +#13#10'          FROM'
      +#13#10'          (select CRE.DATA, CRE.PESO from ZOO_ANIMAL_CRESCIMENTO CRE where CRE.KZOO_ANIMAL = A.KZOO_ANIMAL and CRE.DATA <= A.DATADESMAME AND (A.DATADESMAME - CRE.DATA <= 7)'
      +#13#10'            order by CRE.DATA desc rows 1 ) PESO_ANT'
      +#13#10'          LEFT JOIN'
      +#13#10'          (select CRE.DATA, CRE.PESO from ZOO_ANIMAL_CRESCIMENTO CRE where CRE.KZOO_ANIMAL = A.KZOO_ANIMAL and CRE.DATA >= A.DATADESMAME AND (CRE.DATA - A.DATADESMAME <= 7)'
      +#13#10'            order by CRE.DATA rows 1) PESO_POS ON 1 = 1)'
      +#13#10'            AS DATE)  "DATA",'
      +#13#10'       CAST(NULL AS SYS$FKGUID20) "KZOO_ANIMAL_DIAGNOSTICO",'
      +#13#10'       CAST( NULL AS VARCHAR(60) ) "DIAGNOSTICO"'
      +#13#10'  FROM ZOO_ANIMAIS A'
      +#13#10' INNER JOIN ZOO_ANIMAIS_FEMEA F ON F.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'
      +#13#10' INNER JOIN ZOO_ANIMAL_CRESCIMENTO C ON C.KZOO_ANIMAL = A.KZOO_ANIMAL'
      +#13#10' LEFT  JOIN SYS$TYPES_GETDESCRIPTION( ''SIGLA_STATUS_ANIMAL'', A.STATUS ) STS ON 1=1'
      +#13#10' WHERE (:SELECT_STATUS = ''T'' OR A.STATUS = :STATUS)'
      +#13#10'UNION ALL'
      +#13#10'/*DIAGNOSTICO*/'   //
      +#13#10'SELECT A.BRINCO,'
      +#13#10'       A.BRINCO_,'
      +#13#10'       A.KZOO_ANIMAL,'
      +#13#10'       STS.SYS$DESCRIPTION "STATUS",'
      +#13#10'       CAST(NULL AS VARCHAR(60)) "RACA",'
      +#13#10'       CAST(NULL AS VARCHAR(60)) "NOMEPAI",'
      +#13#10'       5 "TIPO_REGISTRO", /*DIAGNOSTICO*/'
      +#13#10'       CAST(NULL AS INTEGER) "PESO",'
      +#13#10'       CAST(D.DATA AS DATE) "DATA",'
      +#13#10'       D.KZOO_ANIMAL_DIAGNOSTICO,'
      +#13#10'       CAST ( SUBSTRING ( D.CODIGO || COALESCE(  '' ('' ||  STQ.SYS$DESCRIPTION ||  '')'','''') || '' - '' || D.NOME || COALESCE(''  no quarto '' ||STD.SYS$DESCRIPTION,'''' ) FROM 1 FOR 60 ) AS VARCHAR ( 60 )) "DIAGNOSTICO"'
      +#13#10' FROM ZOO_ANIMAIS A'
      +#13#10' INNER JOIN ZOO_ANIMAIS_FEMEA F ON F.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'
      +#13#10' INNER JOIN ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'
      +#13#10' LEFT JOIN SYS$TYPES_GETDESCRIPTION( ''TIPO_SIGLAQUARTO'', D.QUARTO ) STQ ON 1=1'
      +#13#10' LEFT JOIN SYS$TYPES_GETDESCRIPTION( ''TIPO_QUARTO'', D.QUARTO ) STD ON 1=1'
      +#13#10' LEFT JOIN SYS$TYPES_GETDESCRIPTION( ''SIGLA_STATUS_ANIMAL'', A.STATUS ) STS ON 1=1'
      +#13#10' WHERE D.EXCLUIDO = ''F'''
      +#13#10'   AND (:SELECT_STATUS = ''T'' OR A.STATUS = :STATUS)'
      +#13#10' ORDER BY 2, 3, 7, 9';

   _TIPO_REG_NASCIMENTO       = 1;
   _TIPO_REG_PESO_30_DIAS     = 2;
   _TIPO_REG_PESO_60_DIAS     = 3;
   _TIPO_REG_PESO_DESMAME     = 4;
   _TIPO_REG_PESO_DIAGNOSTICO = 5;
var
  cds: TClientDataSet;
  p: TParams;
  LLastKZooAnimal: String;
  LCountDiagnostico : Integer;
begin
  LLastKZooAnimal := '';
  LCountDiagnostico := 0;
  cds:= nil;
  p:= TParams.Create( nil );
  p.CreateParam(ftString ,'SELECT_STATUS',ptInput).AsString  := FSelectStatus;
  p.CreateParam(ftInteger,'STATUS'       ,ptInput).AsInteger := FStatusAnimal;
  p.CreateParam(ftString ,'SELECT_STATUS',ptInput).AsString  := FSelectStatus;
  p.CreateParam(ftInteger,'STATUS'       ,ptInput).AsInteger := FStatusAnimal;
  p.CreateParam(ftString ,'SELECT_STATUS',ptInput).AsString  := FSelectStatus;
  p.CreateParam(ftInteger,'STATUS'       ,ptInput).AsInteger := FStatusAnimal;
  p.CreateParam(ftString ,'SELECT_STATUS',ptInput).AsString  := FSelectStatus;
  p.CreateParam(ftInteger,'STATUS'       ,ptInput).AsInteger := FStatusAnimal;
  p.CreateParam(ftString ,'SELECT_STATUS',ptInput).AsString  := FSelectStatus;
  p.CreateParam(ftInteger,'STATUS'       ,ptInput).AsInteger := FStatusAnimal;
  TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, _SELECT_HISTORICO, p);
  cds.First;
  while not cds.Eof do
   begin
     if LLastKZooAnimal <> cds.FieldByName('KZOO_ANIMAL').AsString then
      begin
       FcdsResults.Append;
       LCountDiagnostico := 0;
      end
     else
       FcdsResults.Edit;

     if cds.FieldByName('TIPO_REGISTRO').AsInteger = _TIPO_REG_NASCIMENTO then
      begin
        FcdsResults.FieldByName('KZOO_ANIMAL').AsString   := cds.FieldByName('KZOO_ANIMAL').AsString ;
        FcdsResults.FieldByName('BRINCO'     ).AsString   := cds.FieldByName('BRINCO'     ).AsString ;
        FcdsResults.FieldByName('BRINCO_'    ).AsString   := cds.FieldByName('BRINCO_'    ).AsString ;
        FcdsResults.FieldByName('STATUS'     ).AsString   := cds.FieldByName('STATUS'     ).AsString ;
        FcdsResults.FieldByName('RACA'       ).AsString   := cds.FieldByName('RACA'       ).AsString ;
        FcdsResults.FieldByName('NOME_PAI'   ).AsString   := cds.FieldByName('NOMEPAI'    ).AsString ;
        FcdsResults.FieldByName('NASCIMENTO' ).Value      := cds.FieldByName('DATA'       ).Value ;
        FcdsResults.FieldByName('PESO_NASC'  ).Value      := cds.FieldByName('PESO'       ).Value ;
      end
     else
     if cds.FieldByName('TIPO_REGISTRO').AsInteger = _TIPO_REG_PESO_30_DIAS then
      begin
        FcdsResults.FieldByName('DATA_PESO_30').Value      := cds.FieldByName('DATA'       ).Value ;
        FcdsResults.FieldByName('PESO_30'     ).Value      := cds.FieldByName('PESO'       ).Value ;
      end
     else
     if cds.FieldByName('TIPO_REGISTRO').AsInteger = _TIPO_REG_PESO_60_DIAS then
      begin
        FcdsResults.FieldByName('DATA_PESO_60').Value      := cds.FieldByName('DATA'       ).Value ;
        FcdsResults.FieldByName('PESO_60'     ).Value      := cds.FieldByName('PESO'       ).Value ;
      end
     else
     if cds.FieldByName('TIPO_REGISTRO').AsInteger = _TIPO_REG_PESO_DESMAME then
      begin
        FcdsResults.FieldByName('DATA_PESO_DESMAME').Value      := cds.FieldByName('DATA'       ).Value ;
        FcdsResults.FieldByName('PESO_DESMAME'     ).Value      := cds.FieldByName('PESO'       ).Value ;
      end
     else
     if cds.FieldByName('TIPO_REGISTRO').AsInteger = _TIPO_REG_PESO_DIAGNOSTICO then
      begin
        if LCountDiagnostico = 0 then
           LCountDiagnostico := 1;

        FcdsResults.FieldByName('KZOO_ANIMAL_DIAGNOSTICO_'+IntToStr(LCountDiagnostico)).AsString   := cds.FieldByName('KZOO_ANIMAL_DIAGNOSTICO' ).AsString ;
        FcdsResults.FieldByName('DIAGNOSTICO_'+IntToStr(LCountDiagnostico)            ).AsString   := cds.FieldByName('DIAGNOSTICO'             ).AsString ;
        FcdsResults.FieldByName('DATA_DIAGNOSTICO_'+IntToStr(LCountDiagnostico)       ).Value      := cds.FieldByName('DATA'       ).Value ;
        Inc( LCountDiagnostico );
      end;

     FcdsResults.Post;
     LLastKZooAnimal := cds.FieldByName('KZOO_ANIMAL').AsString;
     cds.Next;
   end;



  cds.Free;
  p.Free;
end;

procedure TZooRelatotioAvaliacaoBezerras_dtm.OpenTables;
begin
  //inherited;
  cdsResultados.DisableControls;
  cdsResultados.IndexDefs.Clear;
  cdsResultados.IndexName := '';
  cdsResultados.Close;
  PrepareCDS;
  LoadData;
  cdsResultados.Data := FcdsResults.Data;
  FormatCDSResultados;
  cdsResultados.EnableControls;
end;

procedure TZooRelatotioAvaliacaoBezerras_dtm.PrepareCDS;
var
  CountDiagnosticos, Count : Integer;
begin
  CountDiagnosticos := GetNumDiagnosticos;

  FcdsResults.Close;
  FcdsResults.FieldDefs.Clear;
  FcdsResults.FieldDefs.Add('KZOO_ANIMAL',ftString,20);
  FcdsResults.FieldDefs.Add('BRINCO_',ftString,20);
  FcdsResults.FieldDefs.Add('BRINCO',ftString,20);
  FcdsResults.FieldDefs.Add('STATUS',ftString,20);
  FcdsResults.FieldDefs.Add('NASCIMENTO',ftTimesTamp);
  FcdsResults.FieldDefs.Add('PESO_NASC',ftFloat);
  FcdsResults.FieldDefs.Add('RACA',ftString,20);
  FcdsResults.FieldDefs.Add('GRAUSANGUE',ftString,5);
  FcdsResults.FieldDefs.Add('NOME_PAI',ftString,60);
  FcdsResults.FieldDefs.Add('PESO_30',ftFloat);
  FcdsResults.FieldDefs.Add('DATA_PESO_30',ftTimesTamp);
  FcdsResults.FieldDefs.Add('PESO_60',ftFloat);
  FcdsResults.FieldDefs.Add('DATA_PESO_60',ftTimesTamp);
  FcdsResults.FieldDefs.Add('PESO_DESMAME',ftFloat);
  FcdsResults.FieldDefs.Add('DATA_PESO_DESMAME',ftTimesTamp);

  Count := 1;
  while (Count <= CountDiagnosticos) do
   begin
     FcdsResults.FieldDefs.Add('KZOO_ANIMAL_DIAGNOSTICO_'+IntToStr(Count),ftString,20);
     FcdsResults.FieldDefs.Add('DIAGNOSTICO_'+IntToStr(Count),ftString,60);
     FcdsResults.FieldDefs.Add('DATA_DIAGNOSTICO_'+IntToStr(Count),ftTimesTamp);
     Inc(Count);
   end;


  FcdsResults.CreateDataSet;
  AjustarFields(FcdsResults, 'KZOO_ANIMAL'         , ''                       , False);
  AjustarFields(FcdsResults, 'BRINCO_'             , ''                       , False);
  AjustarFields(FcdsResults, 'BRINCO'              , 'Brinco'                 , True );
  AjustarFields(FcdsResults, 'STATUS'              , 'Categoria'              , False );
  AjustarFields(FcdsResults, 'NASCIMENTO'          , 'Nascimento'             , True );
  AjustarFields(FcdsResults, 'PESO_NASC'           , 'Peso Nasc.'             , True );
  AjustarFields(FcdsResults, 'RACA'                , 'Raça'                   , True );
  AjustarFields(FcdsResults, 'GRAUSANGUE'          , 'Grau de sangue'         , True );
  AjustarFields(FcdsResults, 'NOME_PAI'            , 'Nome pai'               , True );
  AjustarFields(FcdsResults, 'PESO_30'             , 'Peso 30 dias'           , True );
  AjustarFields(FcdsResults, 'DATA_PESO_30'        , 'Data peso 30 dias'      , True );
  AjustarFields(FcdsResults, 'PESO_60'             , 'Peso 60 dias'           , True );
  AjustarFields(FcdsResults, 'DATA_PESO_60'        , 'Data peso 60 dias'      , True );
  AjustarFields(FcdsResults, 'PESO_DESMAME'        , 'Peso ao desmame'        , True );
  AjustarFields(FcdsResults, 'DATA_PESO_DESMAME'   , 'Data peso ao desmame'   , True );

  Count := 1;
  while (Count <= CountDiagnosticos) do
   begin
     AjustarFields(FcdsResults, 'KZOO_ANIMAL_DIAGNOSTICO_'+IntToStr(Count)   , ''   , False );
     AjustarFields(FcdsResults, 'DIAGNOSTICO_'+IntToStr(Count)  , 'Diagnóstico '+IntToStr(Count)  , True );
     AjustarFields(FcdsResults, 'DATA_DIAGNOSTICO_'+IntToStr(Count)  , 'Data diagnóstico '+IntToStr(Count)  , True );
     Inc(Count);
   end;

end;

procedure TZooRelatotioAvaliacaoBezerras_dtm.SetSelectSatus(
  const Value: String);
begin
  FSelectStatus := Value;
end;

procedure TZooRelatotioAvaliacaoBezerras_dtm.SetStatusAnimal(
  const Value: Integer);
begin
  FStatusAnimal := Value;
end;

end.
