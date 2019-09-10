unit UZoo_AtividadesLVListagemGeralDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesLVListagemGeralDatamodule = class(T_dtmBASE)
    cdsAListagemGeral: TClientDataSet;
    dspAListagemGeral: TDataSetProvider;
    sqlAListagemGeral: TTcSQLDataSet;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    sqlAListagemGeralBRINCO: TStringField;
    sqlAListagemGeralBRINCO_: TStringField;
    sqlAListagemGeralNOMEESTABULO: TStringField;
    sqlAListagemGeralLOTE: TStringField;
    sqlAListagemGeralULTIMA_COBERTURA: TSQLTimeStampField;
    sqlAListagemGeralULTIMO_TOQUE: TSQLTimeStampField;
    cdsAListagemGeralBRINCO: TStringField;
    cdsAListagemGeralBRINCO_: TStringField;
    cdsAListagemGeralNOMEESTABULO: TStringField;
    cdsAListagemGeralLOTE: TStringField;
    cdsAListagemGeralULTIMA_COBERTURA: TSQLTimeStampField;
    sqlAListagemGeralULTIMO_PARTO: TSQLTimeStampField;
    cdsAListagemGeralULTIMO_PARTO: TSQLTimeStampField;
    cdsAListagemGeralPROBLEMA: TStringField;
    cdsAListagemGeralINTERVALO: TIntegerField;
    sqlAListagemGeralKZOO_ANIMAL: TStringField;
    cdsAListagemGeralKZOO_ANIMAL: TStringField;
    cdsAListagemGeralULTIMO_TOQUE: TSQLTimeStampField;
    procedure cdsAListagemGeralBeforeOpen(DataSet: TDataSet);
  private
    FRemovedKey : String ;
    FAte: TDateTime;
    { Private declarations }
    procedure SetParams ;
    procedure SetAte(const Value: TDateTime);
    procedure ListaAnimais ;
    procedure CopyFieldsFromAnimaisToListagemGeral ( AcdsListagemGeral : TClientDataSet ) ;
    function IntervaloEntreEventos( FKzoo_Animal : string ) : Integer ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
    property Ate : TDateTime  read FAte write SetAte;
    Constructor Create ( AOwner : TComponent  ) ;override ;
  end;

implementation

uses CDSSuppl,
     Exceptions, CLAg5Types, UDBZootecnico, Data.SQLTimSt, DateUtils,
     ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

procedure TZoo_AtividadesLVListagemGeralDatamodule.ApplyUpdates;
begin
//
end;

procedure TZoo_AtividadesLVListagemGeralDatamodule.cdsAListagemGeralBeforeOpen(DataSet: TDataSet);
begin
  SetParams;
end;

procedure TZoo_AtividadesLVListagemGeralDatamodule.CopyFieldsFromAnimaisToListagemGeral(
  AcdsListagemGeral: TClientDataSet);
var
  i : integer ;
  Field : TField ;
  Intervalo : Integer;
begin
  if AcdsListagemGeral.isEmpty then
     exit ;

  while not AcdsListagemGeral.Eof do
    begin
      self.cdsAListagemGeral.append ;
    //  FRemovedKey := AcdsListagemGeral.FieldByName ( 'KZOO_ANIMAL_MACHO' ).asString  ;

      for I := 0 to cdsAListagemGeral.fieldCount - 1 do
        begin
          Field :=  AcdsListagemGeral.FindField( cdsAListagemGeral.Fields[ I ].FieldName ) ;
          if Assigned ( Field ) then
             cdsAListagemGeral.Fields[ I ].Value := Field.Value ;
         end;

      if not (cdsAListagemGeralULTIMO_PARTO.IsNull) then
        begin
          Intervalo := IntervaloEntreEventos( cdsAListagemGeralKZOO_ANIMAL.AsString ) ;

          if Intervalo > 0 then
            cdsAListagemGeralINTERVALO.AsInteger := Intervalo
          else
            cdsAListagemGeralINTERVALO.Clear ;
        end;

      cdsAListagemGeral.Post ;
      AcdsListagemGeral.Delete ;
    end;
//  TCDSSuppl.ApplyUpdates( cdsAListagemGeral );
end;

constructor TZoo_AtividadesLVListagemGeralDatamodule.Create(AOwner: TComponent);
begin
  inherited;
//  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_EVENTO_ZOO, cdsTipoEvento );
end;

function TZoo_AtividadesLVListagemGeralDatamodule.IntervaloEntreEventos(FKzoo_Animal: string ): Integer;
const
  SELECT_INTERVALO =
           'SELECT DATEDIFF( DAY, E.DATAEVENTO, S.DATAEVENTO) INTERVALO'
    +#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS E'
    +#13#10'JOIN ( SELECT DAF.KZOO_ANIMAL_FEMEA,'
    +#13#10'               EZ.KZOO_EVENTO_ZOOTECNICO,'
    +#13#10'              DAF.ULTIMA_LACTACAO,'
    +#13#10'               EZ.DATAEVENTO'
    +#13#10'         FROM ZOO_ANIMAIS AF'
    +#13#10'         JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'
    +#13#10'         JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO'
    +#13#10'        WHERE AF.KCAD_FAZENDA = :KCAD_FAZENDA'
    +#13#10'          AND AF.KZOO_ANIMAL  = :KZOO_ANIMAL'
    +#13#10'          AND EZ.DATAEVENTO > DAF.ULTIMA_LACTACAO'
    +#13#10'      ) S ON S.KZOO_ANIMAL_FEMEA = E.KZOO_ANIMAL_FEMEA'
    +#13#10'WHERE E.DATAEVENTO <= S.DATAEVENTO'
    +#13#10'  AND E.KZOO_EVENTO_ZOOTECNICO <> S.KZOO_EVENTO_ZOOTECNICO'
    +#13#10'  AND E.DATAEVENTO > S.ULTIMA_LACTACAO'
    +#13#10'ORDER BY E.DATAEVENTO DESC'
    +#13#10'ROWS 1';
var
  cds : TClientDataSet ;
    p : TParams ;
begin
  cds := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA',  ptInput ).asString := LoggedUser.DomainID ;
  p.CreateParam( ftString, 'KZOO_ANIMAL',        ptInput ).AsString := FKzoo_Animal ;

  DBResources['ZOOTECNICO'].populateClientDataSet( cds, SELECT_INTERVALO, p ) ;

  if not cds.Eof then
    Result := cds.FieldByName('INTERVALO').AsInteger
  else
    Result := 0;

end;

procedure TZoo_AtividadesLVListagemGeralDatamodule.ListaAnimais;
const
  SELECT_ANIMAIS_REEXAMINAR =
           ' AF.KZOO_ANIMAL, '
    +#13#10' AF.BRINCO,'
    +#13#10' AF.BRINCO_,'
    +#13#10' AF.NOMEESTABULO,'
    +#13#10' DAF.LOTE,'
    +#13#10' ( ''Animal a reexaminar'' ) PROBLEMA,'
    +#13#10' IIF( DAF.ULTIMA_LACTACAO IS NOT NULL, DAF.ULTIMA_LACTACAO, NULL ) ULTIMO_PARTO,'
    +#13#10' IIF( DAF.ULTIMA_LACTACAO < DAF.ULTIMA_MONTA, DAF.ULTIMA_MONTA, NULL ) ULTIMA_COBERTURA,'
    +#13#10' IIF( EZ.DATAABORTOPARTO IS NULL, EZ.DATATOQUE, NULL ) ULTIMO_TOQUE'
    +#13#10'FROM ZOO_ANIMAIS AF'
    +#13#10'JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'
    +#13#10'JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO '
    +#13#10'WHERE ( AF.KCAD_FAZENDA = :KCAD_FAZENDA )'
    +#13#10'  AND (     ( AF.STATUS IS DISTINCT FROM :DESCARTADA )'
    +#13#10'        AND ( DAF.INTENCAO_DESCARTE IS DISTINCT FROM ''T'' )'
    +#13#10'       )'
    +#13#10'  AND ( DAF.KULTIMO_EVENTO_ZOOTECNICO = DAF.KULTIMA_MONTA )'
    +#13#10'  AND ( EZ.ABORTOPARTO IS NULL )'
    +#13#10'  AND ( EZ.REEXAMINAR = ''T'' )'
    +#13#10'  AND (    ( (DAF.NUMERO_LACTACAO >= 2) AND (DATEADD(:DIASREEXAMINAR_MULTIPARA DAY TO EZ.DATATOQUE) <= :DATAFIM) )'
    +#13#10'        OR ( (DAF.NUMERO_LACTACAO <= 1) AND (DATEADD(:DIASREEXAMINAR_PRIMIPARA DAY TO EZ.DATATOQUE) <= :DATAFIM) )'
    +#13#10'       )' ;

  SELECT_ANIMAIS_COBERTOS_SEM_CONFIRMACAO =
           ' AF.KZOO_ANIMAL, '
    +#13#10' AF.BRINCO,'
    +#13#10' AF.BRINCO_,'
    +#13#10' AF.NOMEESTABULO,'
    +#13#10' DAF.LOTE,'
    +#13#10' (  ''Animal coberto a mais de '' '
    +#13#10'    || DATEDIFF (DAY,DAF.ULTIMA_MONTA, CURRENT_DATE) ||'
    +#13#10'    '' dias sem confirmação de prenhez''   ) PROBLEMA,'
    +#13#10' IIF( DAF.ULTIMA_LACTACAO IS NOT NULL, DAF.ULTIMA_LACTACAO, NULL ) ULTIMO_PARTO,'
    +#13#10' IIF( DAF.ULTIMA_LACTACAO < DAF.ULTIMA_MONTA, DAF.ULTIMA_MONTA, NULL ) ULTIMA_COBERTURA,'
    +#13#10' IIF( EZ.DATAABORTOPARTO IS NULL, EZ.DATATOQUE, NULL ) ULTIMO_TOQUE'
    +#13#10'FROM ZOO_ANIMAIS AF'
    +#13#10'JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'
    +#13#10'JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO '
    +#13#10'WHERE ( AF.KCAD_FAZENDA = :KCAD_FAZENDA )'
    +#13#10'  AND (     ( AF.STATUS IS DISTINCT FROM :DESCARTADA )'
    +#13#10'        AND ( DAF.INTENCAO_DESCARTE IS DISTINCT FROM ''T'' )'
    +#13#10'       )'
    +#13#10'  AND (      ( DAF.KULTIMO_EVENTO_ZOOTECNICO = DAF.KULTIMA_MONTA ) '
    +#13#10'         AND ( EZ.DATATOQUE IS NULL )'
    +#13#10'         AND ( ( DAF.KULTIMA_MONTA <> DAF.KULTIMO_PARTO ) OR ( EZ.ABORTOPARTO IS NULL ) )'
    +#13#10'       )'
    +#13#10'  AND ( ( IIF ( DAF.NUMERO_LACTACAO <= 1,'
    +#13#10'                DATEADD( :DIAS_PRENHEZ_PRIMIPARA DAY TO EZ.DATAEVENTO ),'
    +#13#10'                DATEADD( :DIAS_PRENHEZ_MULTIPARA DAY TO EZ.DATAEVENTO ) )'
    +#13#10'         ) <= :DATAFIM'
    +#13#10'       )' ;

  SELECT_NOVILHAS_NAO_PRENHES =
           '  AF.KZOO_ANIMAL, '
    +#13#10'  AF.BRINCO,'
    +#13#10'  AF.BRINCO_,'
    +#13#10'  AF.NOMEESTABULO,'
    +#13#10'  DAF.LOTE,'
    +#13#10'  (''Novilha com mais de '' '
    +#13#10'     || (IIF(DAF.KULTIMA_MONTA IS NULL,'
    +#13#10'     DATEDIFF(MONTH, DAF.NASCIMENTO, CURRENT_DATE) || '' meses não prenhe'','
    +#13#10'     DATEDIFF(DAY, DAF.ULTIMA_MONTA, CURRENT_DATE) || '' dias não prenhe'' ))  ) PROBLEMA,'
    +#13#10' IIF( DAF.ULTIMA_LACTACAO IS NOT NULL, DAF.ULTIMA_LACTACAO, NULL ) ULTIMO_PARTO,'
    +#13#10' IIF( DAF.ULTIMA_LACTACAO < DAF.ULTIMA_MONTA, DAF.ULTIMA_MONTA, NULL ) ULTIMA_COBERTURA,'
    +#13#10' IIF( EZ.DATAABORTOPARTO IS NULL, EZ.DATATOQUE, NULL ) ULTIMO_TOQUE'
    +#13#10'FROM ZOO_ANIMAIS_FEMEA DAF'
    +#13#10'JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = DAF.KZOO_ANIMAL_FEMEA'
    +#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO'
    +#13#10'WHERE ( AF.KCAD_FAZENDA = :KCAD_FAZENDA )'
    +#13#10'  AND ( AF.STATUS = :NOVILHA )'
    +#13#10'  AND ( ( EZ.PRENHEZ IS DISTINCT FROM ''T'' )'
    +#13#10'         OR ( EZ.DATATOQUE IS NULL )'
    +#13#10'       )'
    +#13#10'  AND (   (   ( DAF.KULTIMO_EVENTO_ZOOTECNICO = DAF.KULTIMA_MONTA )'
    +#13#10'              AND ( DATEADD( :DIAS_CONFIRMAR_PRENHEZ_PRIMIPARA DAY TO DAF.ULTIMA_MONTA ) <= :DATAFIM )'
    +#13#10'           )'
    +#13#10'          OR (  ( DAF.KULTIMA_MONTA IS NULL )'
    +#13#10'                AND ( DATEADD( :IDADEMAXIMA_SEMCOBERTURA MONTH TO DAF.NASCIMENTO ) <= :DATAFIM )'
    +#13#10'              )'
    +#13#10'       )' ;

  SELECT_ANIMAL_RECEM_PARIDO =
           '  AF.KZOO_ANIMAL, '
    +#13#10'  AF.BRINCO,'
    +#13#10'  AF.BRINCO_,'
    +#13#10'  AF.NOMEESTABULO,'
    +#13#10'  DAF.LOTE,'
    +#13#10'  ( ''Animal recém parido'' ) PROBLEMA,'
    +#13#10' IIF( DAF.ULTIMA_LACTACAO IS NOT NULL, DAF.ULTIMA_LACTACAO, NULL ) ULTIMO_PARTO,'
    +#13#10' IIF( DAF.ULTIMA_LACTACAO < DAF.ULTIMA_MONTA, DAF.ULTIMA_MONTA, NULL ) ULTIMA_COBERTURA,'
    +#13#10' IIF( EZ.DATAABORTOPARTO IS NULL, EZ.DATATOQUE, NULL ) ULTIMO_TOQUE'
    +#13#10'FROM ZOO_ANIMAIS_FEMEA DAF'
    +#13#10'JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = DAF.KZOO_ANIMAL_FEMEA'
    +#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO'
    +#13#10'WHERE ( AF.KCAD_FAZENDA = :KCAD_FAZENDA )'
    +#13#10'  AND ( AF.STATUS IS DISTINCT FROM :DESCARTADA )'
    +#13#10'  AND ( DAF.INTENCAO_DESCARTE IS DISTINCT FROM ''T'' )'
    +#13#10'  AND ( DAF.KULTIMO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTOLACTACAO )'
    +#13#10'  AND ( (IIF( DAF.NUMERO_LACTACAO <= 1,'
    +#13#10'              DATEADD(:MAX_DEL_PRIMIPARA DAY TO DAF.ULTIMA_LACTACAO),'
    +#13#10'              DATEADD(:MAX_DEL_MULTIPARA DAY TO DAF.ULTIMA_LACTACAO)'
    +#13#10'             )) >= :DATAINICIO'
    +#13#10'       )' ;

  SELECT_ANIMAIS_SEM_CIO_COBERTURA =
    #13#10'  AF.KZOO_ANIMAL, ' +
    #13#10'  AF.BRINCO,' +
    #13#10'  AF.BRINCO_,' +
    #13#10'  AF.NOMEESTABULO,' +
    #13#10'  DAF.LOTE,' +
    #13#10'  ( ''Animal com mais de '' || ( IIF( DAF.NUMERO_LACTACAO > 1,' +
    #13#10'                                      :DIASPOSPARTO_SEMCIO_MULTIPARA + 0,' +
    #13#10'                                      :DIASPOSPARTO_SEMCIO_PRIMIPARA + 0 )' +
    #13#10'                                ) || '' dias sem CIO ou COBERTURA'' ) PROBLEMA,' +
    #13#10' IIF( DAF.ULTIMA_LACTACAO IS NOT NULL, DAF.ULTIMA_LACTACAO, NULL ) ULTIMO_PARTO,' +
    #13#10' IIF( DAF.ULTIMA_LACTACAO < DAF.ULTIMA_MONTA, DAF.ULTIMA_MONTA, NULL ) ULTIMA_COBERTURA,'+
    #13#10' IIF( EZ.DATAABORTOPARTO IS NULL, EZ.DATATOQUE, NULL ) ULTIMO_TOQUE'+
    #13#10'FROM ZOO_ANIMAIS_FEMEA DAF' +
    #13#10'JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = DAF.KZOO_ANIMAL_FEMEA' +
    #13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO' +
    #13#10'WHERE ( AF.KCAD_FAZENDA = :KCAD_FAZENDA )' +
    #13#10'  AND ( AF.STATUS IS DISTINCT FROM :DESCARTADA )' +
    #13#10'  AND ( DAF.INTENCAO_DESCARTE IS DISTINCT FROM ''T'' )' +
    #13#10'  AND ( ( DAF.KULTIMO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTOLACTACAO )' +
    #13#10'        AND ( IIF( DAF.NUMERO_LACTACAO > 1,' +
    #13#10'                   DATEADD(:DIASPOSPARTO_SEMCIO_MULTIPARA DAY TO DAF.ULTIMA_LACTACAO),' +
    #13#10'                   DATEADD(:DIASPOSPARTO_SEMCIO_PRIMIPARA DAY TO DAF.ULTIMA_LACTACAO)' +
    #13#10'                  ) <= :DATAFIM' +
    #13#10'             )' +
    #13#10'       )' ;

  SELECT_CICLOS_ANORMAIS =
          'SELECT'
    +#13#10'  EZ.KZOO_ANIMAL_FEMEA KZOO_ANIMAL, '
    +#13#10'  S.BRINCO,'
    +#13#10'  S.BRINCO_,'
    +#13#10'  S.NOMEESTABULO,'
    +#13#10'  S.LOTE,'
    +#13#10'  (''Ciclo anormal'' ) PROBLEMA,'
    +#13#10'  IIF( DAF.ULTIMA_LACTACAO IS NOT NULL, DAF.ULTIMA_LACTACAO, NULL ) ULTIMO_PARTO,'
    +#13#10'  IIF( S.ULTIMA_MONTA > DAF.ULTIMA_LACTACAO, S.ULTIMA_MONTA, NULL ) ULTIMA_COBERTURA,'
    +#13#10'  IIF( EZ.DATAABORTOPARTO IS NULL, EZ.DATATOQUE, NULL ) ULTIMO_TOQUE'
    +#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS EZ'
    +#13#10'INNER JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KULTIMO_EVENTO_ZOOTECNICO = EZ.KZOO_EVENTO_ZOOTECNICO'
    +#13#10'INNER JOIN ( SELECT'
    +#13#10'              AF.KZOO_ANIMAL_FEMEA,'
    +#13#10'              AN.BRINCO,'
    +#13#10'              AN.BRINCO_,'
    +#13#10'              AN.NOMEESTABULO,'
    +#13#10'              AF.ULTIMA_MONTA,'
    +#13#10'              AF.ULTIMA_LACTACAO,'
    +#13#10'              AF.LOTE'
    +#13#10'             FROM ZOO_ANIMAIS_FEMEA AF'
    +#13#10'             INNER JOIN ZOO_ANIMAIS AN ON AN.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
    +#13#10'             LEFT JOIN ZOO_INTERVALO_EVENTOS ( AF.KZOO_ANIMAL_FEMEA,'
    +#13#10'                                               AF.KULTIMO_EVENTO_ZOOTECNICO,'
    +#13#10'                                               AF.ULTIMO_EVENTO_ZOOTECNICO ) I ON 1=1'
    +#13#10'             WHERE AN.KCAD_FAZENDA = :KCAD_FAZENDA'
    +#13#10'               AND AN.STATUS IS DISTINCT FROM :DESCARTADA'
    +#13#10'               AND AF.INTENCAO_DESCARTE = ''F'' '
    +#13#10'               AND AF.DOADOR_RECEPTOR IS DISTINCT FROM :RECEPTORA'
    +#13#10'               AND AF.KULTIMA_LACTACAO IS NOT NULL'
    +#13#10'               AND AF.KULTIMO_EVENTO_ZOOTECNICO = AF.KULTIMO_CIO'
    +#13#10'               AND ( (I.INTERVALO BETWEEN 1 AND 17)'
    +#13#10'                     OR (I.INTERVALO > 24 ))'
    +#13#10'            ) S ON S.KZOO_ANIMAL_FEMEA = EZ.KZOO_ANIMAL_FEMEA'
    +#13#10'WHERE ( EZ.DATAABORTOPARTO >= S.ULTIMA_LACTACAO )'
    +#13#10'   OR ( EZ.DATAEVENTO >= S.ULTIMA_LACTACAO )' ;
var
  cds : TClientDataSet ;
    p : TParams ;
  DiasPrimimipara, DiasMultipara : integer  ;
  IdadeCobertura : integer  ;

begin

  // Animais a reexaminar
  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_REEXAMINAR_PALPACAO, DiasPrimimipara, DiasMultipara ) ;

  cds := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA',              ptInput ).asString       := LoggedUser.DomainID ;
  p.CreateParam( ftInteger, 'DESCARTADA', ptInput ).AsInteger                    := _ST_STATUS_FEMEA_DESCARTADO ;
  p.CreateParam( ftInteger, 'DIASREEXAMINAR_MULTIPARA', ptInput ).AsInteger      := DiasMultipara ;
  p.CreateParam( ftTimeStamp, 'DATAFIM',                ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp(EndOfTheDay(FAte)) ;
  p.CreateParam( ftInteger, 'DIASREEXAMINAR_PRIMIPARA', ptInput ).AsInteger      := DiasPrimimipara ;

  DBResources['ZOOTECNICO'].populateClientDataSet( cds, SELECT_ANIMAIS_REEXAMINAR, p ) ;

  if not cds.IsEmpty then
    CopyFieldsFromAnimaisToListagemGeral ( cds );

  // Animais coberto a mais de X dias sem confirmacao de prenhez
  p.Free ;
  FreeAndNil( cds ) ;

  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_CONFIRMAR_PRENHEZ, DiasPrimimipara, DiasMultipara ) ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA',            ptInput ).asString       := LoggedUser.DomainID ;
  p.CreateParam( ftInteger, 'DESCARTADA', ptInput ).AsInteger                  := _ST_STATUS_FEMEA_DESCARTADO ;
  p.CreateParam( ftInteger, 'DIAS_PRENHEZ_PRIMIPARA', ptInput ).AsInteger      := DiasPrimimipara ;
  p.CreateParam( ftInteger, 'DIAS_PRENHEZ_MULTIPARA', ptInput ).AsInteger      := DiasMultipara ;
  p.CreateParam( ftTimeStamp, 'DATAFIM',              ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp(EndOfTheDay(FAte)) ;

  DBResources['ZOOTECNICO'].populateClientDataSet( cds, SELECT_ANIMAIS_COBERTOS_SEM_CONFIRMACAO, p ) ;

  if not cds.IsEmpty then
    CopyFieldsFromAnimaisToListagemGeral ( cds );

  // Novilhas com mais de X meses nao prenhes
  p.Free ;
  FreeAndNil( cds ) ;

  idadeCobertura := TParamNovilhas.GetParam ( LoggedUser.DomainID, _ST_PARAM_NOVILHAS_IDADE_SEM_COBERTURA ) ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA',                      ptInput ).asString       := LoggedUser.DomainID ;
  p.CreateParam( ftTimeStamp, 'DATAFIM',                        ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp(EndOfTheDay(FAte)) ;
  p.CreateParam( ftInteger, 'NOVILHA',                          ptInput ).AsInteger      := _ST_STATUS_FEMEA_NOVILHA ;
  p.CreateParam( ftInteger, 'DIAS_CONFIRMAR_PRENHEZ_PRIMIPARA', ptInput ).AsInteger      := DiasPrimimipara ;
  p.CreateParam( ftInteger, 'IDADEMAXIMA_SEMCOBERTURA',         ptInput ).AsInteger      := IdadeCobertura ;

  DBResources['ZOOTECNICO'].populateClientDataSet( cds, SELECT_NOVILHAS_NAO_PRENHES, p ) ;

  if not cds.IsEmpty then
    CopyFieldsFromAnimaisToListagemGeral ( cds );

  // Animais recem paridos
  p.Free ;
  FreeAndNil( cds ) ;

  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DEL_MAX_RECEM_PARIDA, DiasPrimimipara, DiasMultipara ) ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA',            ptInput ).asString       := LoggedUser.DomainID ;
  p.CreateParam( ftInteger, 'DESCARTADA', ptInput ).AsInteger                  := _ST_STATUS_FEMEA_DESCARTADO ;
  p.CreateParam( ftTimeStamp, 'DATAINICIO',           ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp(EndOfTheDay(FAte)) ;
  p.CreateParam( ftInteger, 'MAX_DEL_PRIMIPARA', ptInput ).AsInteger           := DiasPrimimipara ;
  p.CreateParam( ftInteger, 'MAX_DEL_MULTIPARA', ptInput ).AsInteger           := DiasMultipara ;

  DBResources['ZOOTECNICO'].populateClientDataSet( cds, SELECT_ANIMAL_RECEM_PARIDO, p ) ;

  if not cds.IsEmpty then
    CopyFieldsFromAnimaisToListagemGeral ( cds );

  // Animais com mais de 40 dias sem CIO ou Cobertura
  p.Free ;
  FreeAndNil( cds ) ;

  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_PARTO_SEM_CIO, DiasPrimimipara, DiasMultipara ) ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA',                   ptInput ).asString       := LoggedUser.DomainID ;
  p.CreateParam( ftInteger, 'DESCARTADA', ptInput ).AsInteger                         := _ST_STATUS_FEMEA_DESCARTADO ;
  p.CreateParam( ftTimeStamp, 'DATAFIM',                     ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp(EndOfTheDay(FAte)) ;
  p.CreateParam( ftInteger, 'DIASPOSPARTO_SEMCIO_MULTIPARA', ptInput ).AsInteger      := DiasMultipara ;
  p.CreateParam( ftInteger, 'DIASPOSPARTO_SEMCIO_PRIMIPARA', ptInput ).AsInteger      := DiasPrimimipara ;

  DBResources['ZOOTECNICO'].populateClientDataSet( cds, SELECT_ANIMAIS_SEM_CIO_COBERTURA, p ) ;

  if not cds.IsEmpty then
    CopyFieldsFromAnimaisToListagemGeral ( cds );

  // Animais com ciclos anormais
  p.Free ;
  FreeAndNil( cds ) ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString  := LoggedUser.DomainID ;
  p.CreateParam( ftInteger, 'DESCARTADA',  ptInput ).AsInteger := _ST_STATUS_FEMEA_DESCARTADO;
  p.CreateParam( ftInteger, 'RECEPTORA',   ptInput ).AsInteger := _ST_TIPO_DOADOR_RECEPTOR_RECEPTOR ;

  DBResources['ZOOTECNICO'].populateClientDataSet( cds, SELECT_CICLOS_ANORMAIS, p ) ;

  if not cds.IsEmpty then
    CopyFieldsFromAnimaisToListagemGeral ( cds );

  p.Free ;
  cds.Free ;
  cdsAListagemGeral.IndexFieldNames := 'BRINCO_';
  cdsAListagemGeral.First;
end;

procedure TZoo_AtividadesLVListagemGeralDatamodule.OpenTables;
begin
  inherited;
//
end;

procedure TZoo_AtividadesLVListagemGeralDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsAListagemGeral.Active then
     cdsAListagemGeral.Close ;
  TCDSSuppl.Open ( cdsAListagemGeral ) ;
  ListaAnimais;
end;

procedure TZoo_AtividadesLVListagemGeralDatamodule.SetParams;
begin
  cdsAListagemGeral.Params.ParamByName ( 'KCAD_FAZENDA' ).asString             := LoggedUser.DomainID ;
end;

end.
