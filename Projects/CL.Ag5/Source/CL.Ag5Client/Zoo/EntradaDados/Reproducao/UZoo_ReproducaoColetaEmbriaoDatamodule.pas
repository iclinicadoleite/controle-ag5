unit UZoo_ReproducaoColetaEmbriaoDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE,
  UZoo_GrauDeSangueClass, Dialogs{*****-----*} ;

type
  TZoo_ReproducaoColetaEmbriaoDatamodule = class(T_dtmBASE)
    cdsColetaEmbriao: TClientDataSet;
    dspColetaEmbriao: TDataSetProvider;
    sqlColetaEmbriao: TTcSQLDataSet;
    sqlColetaEmbriaoKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlColetaEmbriaoKZOO_ANIMAL_FEMEA: TStringField;
    cdsTipoMuco: TClientDataSet;
    cdsTipoMucoTIPO: TStringField;
    cdsTipoMucoVALOR: TStringField;
    cdsTipoMucoDESCRICAO: TStringField;
    cdsTipoMucoORDEM: TIntegerField;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    cdsTipoPartoAborto: TClientDataSet;
    cdsTipoPartoAbortoTIPO: TStringField;
    cdsTipoPartoAbortoVALOR: TStringField;
    cdsTipoPartoAbortoDESCRICAO: TStringField;
    cdsTipoPartoAbortoORDEM: TIntegerField;
    cdsColetaEmbriaoKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsColetaEmbriaoKZOO_ANIMAL_FEMEA: TStringField;
    cdsColetaEmbriaoDESC_EVENTO: TStringField;
    sqlColetaEmbriaoBRINCOFEMEA: TStringField;
    sqlColetaEmbriaoDATAEVENTO: TSQLTimeStampField;
    sqlColetaEmbriaoTIPOEVENTO: TIntegerField;
    sqlColetaEmbriaoNOMEFEMEA: TStringField;
    sqlColetaEmbriaoNOMEMACHO: TStringField;
    sqlColetaEmbriaoABORTOPARTO: TIntegerField;
    sqlColetaEmbriaoDATAABORTOPARTO: TSQLTimeStampField;
    cdsColetaEmbriaoDATAEVENTO: TSQLTimeStampField;
    cdsColetaEmbriaoTIPOEVENTO: TIntegerField;
    cdsColetaEmbriaoBRINCOFEMEA: TStringField;
    cdsColetaEmbriaoNOMEFEMEA: TStringField;
    cdsColetaEmbriaoNOMEMACHO: TStringField;
    cdsColetaEmbriaoABORTOPARTO: TIntegerField;
    cdsColetaEmbriaoDATAABORTOPARTO: TSQLTimeStampField;
    sqlColetaEmbriaoEMBRIOESCOLETADOS: TIntegerField;
    cdsColetaEmbriaoEMBRIOESCOLETADOS: TIntegerField;
    sqlColetaEmbriaoKCAD_FUNCIONARIO_COLETA: TStringField;
    sqlColetaEmbriaoNOMEFUNCIONARIO_COLETA: TStringField;
    cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA: TStringField;
    cdsColetaEmbriaoNOMEFUNCIONARIO_COLETA: TStringField;
    dtsColetaEmbriao: TDataSource;
    cdsColetaEmbriaoTOTALCOLETADO: TAggregateField;
    sqlColetaEmbriaoGRAUSANGUEPAI: TStringField;
    sqlColetaEmbriaoCOMPOSICAORACAPAI: TStringField;
    sqlColetaEmbriaoGRAUSANGUEMAE: TStringField;
    sqlColetaEmbriaoCOMPOSICAORACAMAE: TStringField;
    cdsColetaEmbriaoGRAUSANGUEPAI: TStringField;
    cdsColetaEmbriaoCOMPOSICAORACAPAI: TStringField;
    cdsColetaEmbriaoGRAUSANGUEMAE: TStringField;
    cdsColetaEmbriaoCOMPOSICAORACAMAE: TStringField;
    sqlColetaEmbriaoLOTEPARTO: TStringField;
    sqlColetaEmbriaoLOTE: TStringField;
    cdsColetaEmbriaoLOTEPARTO: TStringField;
    cdsColetaEmbriaoLOTE: TStringField;
    cdsColetaEmbriaoBRINCOFEMEA_: TStringField;
    sqlColetaEmbriaoBRINCOFEMEA_: TStringField;
    cdsColetaEmbriaoTOTAL_DOADOR_RECEPTOR: TAggregateField;
    sqlColetaEmbriaoDOADOR_RECEPTOR: TIntegerField;
    cdsColetaEmbriaoDOADOR_RECEPTOR: TIntegerField;
    procedure cdsColetaEmbriaoBeforeOpen(DataSet: TDataSet);
    procedure cdsColetaEmbriaoNOMEFUNCIONARIO_COLETAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsColetaEmbriaoNOMEFUNCIONARIO_COLETASetText(Sender: TField; const Text: string);
    procedure cdsColetaEmbriaoBeforePost(DataSet: TDataSet);
    procedure cdsColetaEmbriaoDATAABORTOPARTOValidate(Sender: TField);
    procedure dspColetaEmbriaoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsColetaEmbriaoEMBRIOESCOLETADOSValidate(Sender: TField);
    procedure dtsColetaEmbriaoDataChange(Sender: TObject; Field: TField);
    procedure cdsColetaEmbriaoDOADOR_RECEPTORGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    FNOMEFUNCIONARIO : string ;
    KCADFUNCIONARIO  : string;
    FDataColeta: TDateTime;
    FGrauDeSangue : TZoo_GrauDeSangue ;
    procedure SetParams ;
    procedure SetDataColeta(const Value: TDateTime);
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure SetFuncionarioPadrao( AKFuncionario, ANomeFuncionario : string  ) ;
    property DataColeta : TDateTime  read FDataColeta write SetDataColeta;
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
    procedure InvertSelection;
  end;

implementation

uses UDBZootecnico, Exceptions, Data.SQLTimSt, DateUtils , CDSSuppl,
     GuidSuppl, CLAg5Types, DiagnosticosAnimalClass ;

{$R *.dfm}

{TODO -oCaique -cColeta Embriao : Testar coleta com dados reais}
{TODO -oCaique -cColeta Embriao : Checar se existe regra no sistema antigo }

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.cdsColetaEmbriaoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.cdsColetaEmbriaoBeforePost(DataSet: TDataSet);
begin

  if ( cdsColetaEmbriaoDATAABORTOPARTO.isNull ) then
    begin
        cdsColetaEmbriaoNOMEFUNCIONARIO_COLETA.Clear ;
        cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA.Clear ;
        cdsColetaEmbriaoEMBRIOESCOLETADOS.Clear ;
    end
  else
    begin
       {******----- Solicitado por Júlio}
       // if Trim( cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA.asString ) = EmptyStr then
       //   raise Warning.Create('Selecione funcionário' ) ;

        if ( cdsColetaEmbriaoDATAABORTOPARTO.asDateTime < 1 ) then
           raise Warning.Create('Data - inválida');

        if ( cdsColetaEmbriaoDATAABORTOPARTO.asDateTime >  date ) then
           raise Warning.Create('Data - superior a data atual' ) ;

        if ( cdsColetaEmbriaoEMBRIOESCOLETADOS.IsNull )
         {or  (cdsColetaEmbriaoEMBRIOESCOLETADOS.asInteger < 1 ) }then
         raise Warning.Create('Número de embriões coletados inválidos');
    end

end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.cdsColetaEmbriaoDATAABORTOPARTOValidate(
  Sender: TField);
begin

  if Sender.isNull then
    begin
       cdsColetaEmbriaoEMBRIOESCOLETADOS.Clear ;
       cdsColetaEmbriaoNOMEFUNCIONARIO_COLETA.Clear ;
       cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA.Clear ;
       cdsColetaEmbriaoLOTEPARTO.Clear ;
       exit ;
    end ;

  if Sender.AsDateTime < 1 then
     raise Warning.Create('Data inválida');

  if Sender.AsDateTime > Date then
     raise Warning.Create('Data da coleta não pode ser maior que data atual');

  cdsColetaEmbriaoLOTEPARTO.asString := cdsColetaEmbriaoLOTE.asString ;

end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.cdsColetaEmbriaoDOADOR_RECEPTORGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsString = '0' then
     Text := 'Não'
  else
  if Sender.AsString = '1' then
     Text := 'Sim';
end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.cdsColetaEmbriaoEMBRIOESCOLETADOSValidate(
  Sender: TField);
begin
  if not ( cdsColetaEmbriaoEMBRIOESCOLETADOS.isNull ) then
   begin
    // if cdsColetaEmbriaoEMBRIOESCOLETADOS.asInteger < 1 then
     if cdsColetaEmbriaoEMBRIOESCOLETADOS.asInteger < 0 then
        raise Warning.Create('Número de embriões coletados inválidos');

     if cdsColetaEmbriaoDATAABORTOPARTO.AsDateTime < 1 then
        cdsColetaEmbriaoDATAABORTOPARTO.AsDateTime := FDataColeta ;

     if cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA.asString = '' then
        SetFuncionario ( KCADFUNCIONARIO, FNOMEFUNCIONARIO ) ;

   end;

end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.cdsColetaEmbriaoNOMEFUNCIONARIO_COLETAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := cdsColetaEmbriaoNOMEFUNCIONARIO_COLETA.asString ;
end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.cdsColetaEmbriaoNOMEFUNCIONARIO_COLETASetText(
  Sender: TField; const Text: string);
var
  DataChange : TDataChangeEvent ;
begin
  DataChange := dtsColetaEmbriao.OnDataChange ;

  dtsColetaEmbriao.OnDataChange := nil ;
  Sender.asString := Text ;
  cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA.Clear ;

  dtsColetaEmbriao.OnDataChange := DataChange ;
  if Assigned ( DataChange ) then
    DataChange ( dtsColetaEmbriao, Sender ) ;
end;

constructor TZoo_ReproducaoColetaEmbriaoDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  FGrauDeSangue := TZoo_GrauDeSangue.Create ;
end;

destructor TZoo_ReproducaoColetaEmbriaoDatamodule.Destroy;
begin
  FGrauDeSangue.free ;
  inherited;
end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.dtsColetaEmbriaoDataChange(
  Sender: TObject; Field: TField);
begin
  if Assigned ( Field )
    and ( cdsColetaEmbriao.State in [dsInsert,dsEdit] )
    and not (     cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA.isNull
             or cdsColetaEmbriaoDATAABORTOPARTO.isNull
             or cdsColetaEmbriaoEMBRIOESCOLETADOS.isNull )
    {and (cdsColetaEmbriaoEMBRIOESCOLETADOS.asInteger > 0 ) } then
      begin
        dtsColetaEmbriao.OnDataChange := nil ;
        cdsColetaEmbriao.Post ;
        cdsColetaEmbriao.Edit ;
        dtsColetaEmbriao.OnDataChange := dtsColetaEmbriaoDataChange ;
      end;
end;


procedure TZoo_ReproducaoColetaEmbriaoDatamodule.InvertSelection;
begin
  if not (cdsColetaEmbriao.State in [dsInsert, dsEdit]) then
    cdsColetaEmbriao.Edit;

  if cdsColetaEmbriaoDOADOR_RECEPTOR.AsString = '1' then
     cdsColetaEmbriaoDOADOR_RECEPTOR.AsInteger := 0
  else
     cdsColetaEmbriaoDOADOR_RECEPTOR.AsInteger := 1;
  cdsColetaEmbriao.Post;
end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.dspColetaEmbriaoBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);


  procedure GetPaiMae ( AKZOO_EVENTO_ZOOTECNICO : string ; out AKZooPai, ABrincoPai, ANomePai, AKZooMae, ABrincoMae, ANomeMae, ABrincoEmbriao, ANomeEmbriao, ACodigoEmbriao : string ) ;
  var
    cds : TClientDataSet ;
    p : TParams ;
    SequenciaBrincoEmbriao,
    SequenciaEmbriao : integer ;
  const
    _SELECT_PAI_MAE =
           'E.TIPOEVENTO,'
    // MAE
    +#13#10'E.KZOO_ANIMAL_FEMEA KZOO_MAE,'
    +#13#10'AF.BRINCO BRINCO_MAE,'
    +#13#10'COALESCE ( COALESCE ( NULLIF ( TRIM ( AF.NOMECOMPLETO ), '''' ), AF.NOMEESTABULO ), AF.BRINCO ) NOME_MAE,'
    // PAI
    +#13#10'COALESCE ( E.KZOO_ANIMAL_MACHO_TOUROSEMEN, E. KZOO_ANIMAL_MACHO_EMBRIAO ) KZOO_PAI,'
    +#13#10'AM.BRINCO BRINCO_PAI,'
    +#13#10'COALESCE ( COALESCE ( NULLIF ( TRIM ( AM.NOMECOMPLETO ), '''' ), AM.NOMEESTABULO  ), AM.BRINCO ) NOME_PAI,'
    // PAI EMBRIAO
    +#13#10'AE.KZOO_ANIMAL_MACHO KZOO_PAIEMBRIAO,'
    +#13#10'AEM.BRINCO BRINCO_PAIEMBRIAO,'
    +#13#10'COALESCE ( COALESCE ( COALESCE ( NULLIF ( TRIM ( AEM.NOMECOMPLETO ), '''' ), AEM.NOMEESTABULO ), AEM.BRINCO ), AE.NOMEPAI ) NOME_PAIEMBRIAO,'
    // MAE EMBRIAO
    +#13#10'AE.KZOO_ANIMAL_FEMEA KZOO_MAEEMBRIAO,'
    +#13#10'AEF.BRINCO BRINCO_MAEEMBRIAO,'
    +#13#10'COALESCE ( COALESCE ( COALESCE ( NULLIF ( TRIM ( AEF.NOMECOMPLETO ), '''' ), AEF.NOMEESTABULO ), AEF.BRINCO ), AE.NOMEMAE ) NOME_MAEEMBRIAO'
    // FROM EVENTOS
    +#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS E'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = E.KZOO_ANIMAL_FEMEA'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO_TOUROSEMEN'
    +#13#10'LEFT JOIN ZOO_ANIMAL_LINHAGEM AE ON AE.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO_EMBRIAO'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AEF ON AEF.KZOO_ANIMAL = AE.KZOO_ANIMAL_FEMEA'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AEM ON AEM.KZOO_ANIMAL = AE.KZOO_ANIMAL_MACHO'
    +#13#10'WHERE E.KZOO_EVENTO_ZOOTECNICO = :KZOO_EVENTO_ZOOTECNICO' ;

    _SELECT_COUNT_LINHAGEM =
           'COUNT(*) RESULT FROM ZOO_ANIMAL_LINHAGEM L'
    +#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS E ON E.KZOO_EVENTO_ZOOTECNICO = L.KZOO_EVENTO_ZOOTECNICO'
    +#13#10'LEFT JOIN SYS$TYPES_GETVALUE( ''TIPO_PARTOABORTO'', ''COLETA'' ) T ON 1=1'
    +#13#10'WHERE L.KZOO_ANIMAL_MACHO  = :KZOO_ANIMAL_MACHO'
    +#13#10'  AND L.KZOO_ANIMAL_FEMEA  = :KZOO_ANIMAL_FEMEA'
    +#13#10'  AND E.ABORTOPARTO =  T.SYS$VALUE' ;

    _SELECT_GENERATOR_BRINCO_EMBRIAO =
           'SELECT GEN_ID(BRINCO_EMBRIAO, 1) RESULT FROM RDB$DATABASE';

    _SELECT_CHECA_NOME =
      '1 RESULT'
    +#13#10'FROM ZOO_ANIMAIS_EMBRIAO E'
    +#13#10'INNER JOIN ZOO_ANIMAIS A ON  A.KZOO_ANIMAL = E.KZOO_ANIMAL_EMBRIAO '
    +#13#10'WHERE A.NOMECOMPLETO = :NOMECOMPLETO'
    +#13#10'ROWS 1';

    function CheckEmbriaoExists : boolean ;
    begin
      //ABrincoEmbriao :=  Format ( '%s_%s_%d', [ ABrincoPai, ABrincoMae, SequenciaEmbriao ] ) ;
      ABrincoEmbriao :=  Format ( 'E_%d', [ SequenciaBrincoEmbriao{SequenciaEmbriao} ] ) ;
      ACodigoEmbriao :=  Format ( '%s_%s_%d', [ ABrincoPai, ABrincoMae, SequenciaEmbriao ] ) ;
      ANomeEmbriao   :=  Format ( '%s_%s_%d', [ ANomePai,   ANomeMae,   SequenciaEmbriao ] ) ;
      p.Clear  ;
      p.CreateParam( ftString, 'NOMECOMPLETO', ptInput ).asString := ANomeEmbriao ;
      FreeAndNil ( cds ) ;
      DBResources['ZOOTECNICO'].populateClientDataSet( cds, _SELECT_CHECA_NOME, p ) ;
      Result := cds.FieldByName('RESULT').asInteger = 1 ;
    end;

  begin

    cds := nil ;

    AKZooPai := '' ;
    ANomePai := '' ;
    AKZooMae := '' ;
    ANomeMae := '' ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := AKZOO_EVENTO_ZOOTECNICO ;

    DBResources['ZOOTECNICO'].populateClientDataSet( cds, _SELECT_PAI_MAE, p ) ;

    if cds.FieldByName('TIPOEVENTO').AsInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE then
      begin
        AKZooPai    := Trim ( cds.FieldByName('KZOO_PAIEMBRIAO').AsString ) ;
        ABrincoPai  := Trim ( cds.FieldByName('BRINCO_PAIEMBRIAO').AsString ) ;
        ANomePai    := Trim ( cds.FieldByName('NOME_PAIEMBRIAO').AsString ) ;
        AKZooMae    := Trim ( cds.FieldByName('KZOO_MAEEMBRIAO').AsString ) ;
        ABrincoMae  := Trim ( cds.FieldByName('BRINCO_MAEEMBRIAO').AsString ) ;
        ANomeMae    := Trim ( cds.FieldByName('NOME_MAEEMBRIAO').AsString ) ;
      end
    else
      begin
        AKZooPai := Trim ( cds.FieldByName('KZOO_PAI').AsString ) ;
        ABrincoPai  := Trim ( cds.FieldByName('BRINCO_PAI').AsString ) ;
        ANomePai := Trim ( cds.FieldByName('NOME_PAI').AsString ) ;
        AKZooMae := Trim ( cds.FieldByName('KZOO_MAE').AsString ) ;
        ABrincoMae  := Trim ( cds.FieldByName('BRINCO_MAE').AsString ) ;
        ANomeMae := Trim ( cds.FieldByName('NOME_MAE').AsString ) ;
      end ;

    FreeAndNil ( cds ) ;
    DBResources['ZOOTECNICO'].populateClientDataSet( cds, _SELECT_GENERATOR_BRINCO_EMBRIAO );
    SequenciaBrincoEmbriao := cds.fieldByName  ( 'RESULT' ).asInteger ;

    FreeAndNil ( cds ) ;
    p.Clear  ;
    p.CreateParam( ftString, 'KZOO_ANIMAL_MACHO', ptInput ).asString := AKZooPai ;
    p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString := AKZooMae ;

    DBResources['ZOOTECNICO'].populateClientDataSet( cds, _SELECT_COUNT_LINHAGEM, p ) ;
    SequenciaEmbriao := cds.fieldByName  ( 'RESULT' ).asInteger + 1 ;

    while CheckEmbriaoExists  do Inc ( SequenciaEmbriao ) ;

    p.free ;
    cds.free ;

  end;

  procedure InsertEmbriao ;
  var
     sql : TSQLQuery ;
     BrincoEmbriao, NomeEmbriao, CodigoEmbriao, tmpAKZooPai, tmpABrincoPai, tmpANomePai, tmpAKZooMae, tmpABrincoMae, tmpANomeMae : string ;
     KZOO_EVENTO, KZOO_ANIMAL : string ; // chave para o embriao

  const

     _INCLUIR_ANINAL =
            'INSERT INTO ZOO_ANIMAIS ( KZOO_ANIMAL, BRINCO, NOMEESTABULO, NOMECOMPLETO, RACA, STATUS, DATASTATUS, DTORIGEM, GRAUSANGUE, COMPOSICAORACA, KZOO_EVENTO_ZOOTECNICO, KCAD_FAZENDA )'
     +#13#10'VALUES ( :KZOO_ANIMAL, :BRINCO, :NOMEESTABULO, :NOMECOMPLETO, :RACA, :STATUS, :DATASTATUS, :DTORIGEM, :GRAUSANGUE, :COMPOSICAORACA, :KZOO_EVENTO_ZOOTECNICO, :KCAD_FAZENDA )' ;

    _INCLUI_EMBRIAO = 'INSERT INTO ZOO_ANIMAIS_EMBRIAO ( KZOO_ANIMAL_EMBRIAO, CODIGO_EMBRIAO, QTDEINICIAL_EMBRIAO, QTDE_EMBRIAO  ) VALUES ( :KZOO_ANIMAL, :CODIGO_EMBRIAO, :QTDEINICIAL_EMBRIAO, :QTDE_EMBRIAO )' ;

    _INSERT_LINHAGEM =  'INSERT INTO ZOO_ANIMAL_LINHAGEM'
      +#13#10'( KZOO_ANIMAL_LINHAGEM, KZOO_ANIMAL, BRINCO, NOMEANIMAL, GRAUSANGUE, COMPOSICAORACA,'
      +#13#10'KZOO_ANIMAL_MACHO, NOMEPAI, GRAUSANGUEPAI, COMPOSICAORACAPAI, '
      +#13#10'KZOO_ANIMAL_FEMEA, NOMEMAE, GRAUSANGUEMAE, COMPOSICAORACAMAE, '
      +#13#10'NASCIMENTO, KZOO_EVENTO_ZOOTECNICO )'
      +#13#10'VALUES( '
      +#13#10'Guid20(), :KZOO_ANIMAL, :BRINCO, :NOMEEMBRIAO, :GRAUSANGUE, :COMPOSICAORACA,'
      +#13#10':KZOO_ANIMAL_MACHO, :NOMEPAI, :GRAUSANGUEPAI, :COMPOSICAORACAPAI,'
      +#13#10':KZOO_ANIMAL_FEMEA, :NOMEMAE, :GRAUSANGUEMAE, :COMPOSICAORACAMAE,'
      +#13#10':NASCIMENTO, :KZOO_EVENTO_ZOOTECNICO )' ;


  begin
    sql := TSQLQuery.Create ( nil ) ;
    with sql do
      try
        KZOO_EVENTO := DeltaDS.FieldByName( 'KZOO_EVENTO_ZOOTECNICO' ).OldValue ;
        GetPaiMae ( KZOO_EVENTO,
                    tmpAKZooPai, tmpABrincoPai, tmpANomePai,
                    tmpAKZooMae, tmpABrincoMae, tmpANomeMae,
                    BrincoEmbriao, NomeEmbriao, CodigoEmbriao ) ;

        SQLConnection := sqlColetaEmbriao.SQLConnection ;

        KZOO_ANIMAL   := GuidSuppl.GuidStr20 ;

        CommandText   := _INCLUIR_ANINAL ;

        ParamByName ( 'KZOO_ANIMAL'   ).AsString       := KZOO_ANIMAL   ;
        ParamByName ( 'BRINCO'        ).AsString       := BrincoEmbriao ;
        ParamByName ( 'NOMEESTABULO'  ).AsString       := NomeEmbriao   ;
        ParamByName ( 'NOMECOMPLETO'  ).AsString       := NomeEmbriao   ;

        //ParamByName ( 'RACA' ).asString := // falta
        ParamByName ( 'RACA' ).DataType := ftString ;
        ParamByName ( 'RACA' ).Bound := False ;

        ParamByName ( 'STATUS'        ).asInteger      := _ST_SIGLA_STATUS_ANIMAL_EMBRIAO ;
        ParamByName ( 'DATASTATUS'    ).AsSQLTimeStamp := DeltaDS.FieldByName ( 'DATAABORTOPARTO' ).AsSQLTimeStamp ;
        ParamByName ( 'DTORIGEM'      ).asSQLTimeStamp := DeltaDS.FieldByName ( 'DATAABORTOPARTO' ).AsSQLTimeStamp ;

        self.FGrauDeSangue.GrauSanguePai  := VarToStr( DeltaDS.FieldByName ( 'GRAUSANGUEPAI' ).OldValue ) ;
        self.FGrauDeSangue.RacaPai        := VarToStr( DeltaDS.FieldByName ( 'COMPOSICAORACAPAI' ).OldValue ) ;

        self.FGrauDeSangue.GrauSangueMae  := VarToStr( DeltaDS.FieldByName ( 'GRAUSANGUEMAE' ).OldValue ) ;
        self.FGrauDeSangue.RacaMae        := VarToStr( DeltaDS.FieldByName ( 'COMPOSICAORACAMAE' ).OldValue ) ;

        self.FGrauDeSangue.Calculate ;

        ParamByName ( 'GRAUSANGUE'  ).asString             := self.FGrauDeSangue.GrauSangue ;
        ParamByName ( 'COMPOSICAORACA'  ).asString         := self.FGrauDeSangue.Raca ;
        ParamByName ( 'KZOO_EVENTO_ZOOTECNICO'  ).asString := DeltaDS.FieldByName( 'KZOO_EVENTO_ZOOTECNICO' ).OldValue ;
        ParamByName ( 'KCAD_FAZENDA'  ).AsString           := LoggedUser.DomainID ;

        ExecSQL ;

        CommandText := _INCLUI_EMBRIAO ;
        ParamByName ( 'KZOO_ANIMAL' ).AsString    := KZOO_ANIMAL ;
        ParamByName ( 'CODIGO_EMBRIAO' ).AsString := CodigoEmbriao ;
        ParamByName ( 'QTDEINICIAL_EMBRIAO'  ).asInteger := DeltaDS.FieldByName ( 'EMBRIOESCOLETADOS' ).asInteger ;
        ParamByName ( 'QTDE_EMBRIAO'  ).asInteger := DeltaDS.FieldByName ( 'EMBRIOESCOLETADOS' ).asInteger ;
        ExecSQL ;

        CommandText := _INSERT_LINHAGEM ;

        Params.ParamByName( 'KZOO_ANIMAL'      ).asString     := KZOO_ANIMAL ;
        Params.ParamByName( 'BRINCO'           ).AsString     := BrincoEmbriao ;
        Params.ParamByName( 'NOMEEMBRIAO'      ).asString     := NomeEmbriao  ;
        Params.ParamByName( 'GRAUSANGUE'       ).asString     := self.FGrauDeSangue.GrauSangue ;
        Params.ParamByName( 'COMPOSICAORACA'   ).asString     := self.FGrauDeSangue.Raca ;
        Params.ParamByName( 'KZOO_ANIMAL_MACHO' ).Bound  := False ;
        Params.ParamByName( 'NOMEPAI'           ).Bound  := False ;
        Params.ParamByName( 'GRAUSANGUEPAI'     ).asString := VarToStr( DeltaDS.FieldByName ( 'GRAUSANGUEPAI' ).OldValue ) ;
        Params.ParamByName( 'COMPOSICAORACAPAI' ).asString := VarToStr( DeltaDS.FieldByName ( 'COMPOSICAORACAPAI' ).OldValue ) ;

        Params.ParamByName( 'KZOO_ANIMAL_FEMEA' ).Bound  := False ;
        Params.ParamByName( 'NOMEMAE'           ).Bound  := False ;
        Params.ParamByName( 'GRAUSANGUEMAE'     ).asString := VarToStr( DeltaDS.FieldByName ( 'GRAUSANGUEMAE' ).OldValue ) ;
        Params.ParamByName( 'COMPOSICAORACAMAE' ).asString := VarToStr( DeltaDS.FieldByName ( 'COMPOSICAORACAMAE' ).OldValue ) ;

        if ( tmpAKZooPai <> '' ) then
            Params.ParamByName( 'KZOO_ANIMAL_MACHO' ).asString    := tmpAKZooPai ;

        if ( tmpANomePai <> '' ) then
            Params.ParamByName( 'NOMEPAI' ).asString    := tmpANomePai ;

        if ( tmpAKZooMae <> '' ) then
            Params.ParamByName( 'KZOO_ANIMAL_FEMEA' ).asString    := tmpAKZooMae ;

        if ( tmpANomeMae <> '' ) then
            Params.ParamByName( 'NOMEMAE' ).asString    := tmpANomeMae ;

        Params.ParamByName( 'NASCIMENTO'  ).AsSQLTimeStamp := DeltaDS.FieldByName ( 'DATAABORTOPARTO' ).AsSQLTimeStamp ;

        Params.ParamByName( 'KZOO_EVENTO_ZOOTECNICO'  ).asString := KZOO_EVENTO ;

        ExecSQL  ;

      finally
        free ;
      end;

  end;

begin
   // nao exlui nada do banco
   Applied := True ;

   if    ( UpdateKind = ukDelete )
      or ( (DeltaDS.FieldByName ( 'DATAABORTOPARTO' ).isNull) and
           (DeltaDS.FieldByName ('DOADOR_RECEPTOR').AsInteger = 1 ) ) then
      exit ;

   if (not DeltaDS.FieldByName ( 'EMBRIOESCOLETADOS' ).IsNull) then
    begin
      sqlColetaEmbriao.SQLConnection.ExecuteDirect (
        Format ('UPDATE ZOO_EVENTOS_ZOOTECNICOS'
         +#13#10'SET ABORTOPARTO = %d, DATAABORTOPARTO = ''%s'', EMBRIOESCOLETADOS = %d, '
         +#13#10'KCAD_FUNCIONARIO_COLETA = ''%s'', NOMEFUNCIONARIO_COLETA = ''%s'' '
         +#13#10'WHERE KZOO_EVENTO_ZOOTECNICO = ''%s'' ',
         [ _ST_TIPO_PARTOABORTO_COLETA, FormatDateTime ( 'dd.mm.yyyy',  DeltaDS.FieldByName ( 'DATAABORTOPARTO' ).asDateTime ),
           DeltaDS.FieldByName ( 'EMBRIOESCOLETADOS' ).AsInteger,
           DeltaDS.FieldByName ( 'KCAD_FUNCIONARIO_COLETA' ).AsString,
           DeltaDS.FieldByName ( 'NOMEFUNCIONARIO_COLETA' ).AsString,
           DeltaDS.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ). OldValue
          ] ) ) ;

     //Solicitado na SP 2622
     if (DeltaDS.FieldByName ( 'EMBRIOESCOLETADOS' ).AsInteger > 0) then
       InsertEmbriao;

    end;

    if VarToStr(DeltaDS.FieldByName ( 'DOADOR_RECEPTOR' ).NewValue) = '0' then
      sqlColetaEmbriao.SQLConnection.ExecuteDirect (
        Format('UPDATE ZOO_ANIMAIS_FEMEA SET DOADOR_RECEPTOR = %d WHERE KZOO_ANIMAL_FEMEA = ''%s'' ',
               [ _ST_TIPO_DOADOR_RECEPTOR_ND,
                DeltaDS.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).OldValue])
        );

  DiagnosticosAnimalClass.TEventosAnimal.AddColeta( DeltaDS.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).OldValue, DeltaDS.FieldByName ( 'DATAABORTOPARTO' ).asDateTime ) ;

end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.OpenTables;
begin
  FNOMEFUNCIONARIO := '' ;
  KCADFUNCIONARIO  := '' ;

  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_EVENTO_ZOO, cdsTipoEvento );
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_MUCO, cdsTipoMuco );
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_PARTOABORTO, cdsTipoPartoAborto );
  TCDSSuppl.Open (  cdsColetaEmbriao ) ;
  cdsColetaEmbriao.IndexFieldNames := 'BRINCOFEMEA_' ;
end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.SetDataColeta(const Value: TDateTime);
begin
  FDataColeta := Value;
end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.SetFuncionario(AKFuncionario,
  ANomeFuncionario: string);
var
  DataChange : TDataChangeEvent ;
begin
  DataChange := dtsColetaEmbriao.OnDataChange ;
  dtsColetaEmbriao.OnDataChange :=  nil ;

   try
     if not ( cdsColetaEmbriao.State in [dsInsert, dsEdit] ) then
        cdsColetaEmbriao.Edit ;

     cdsColetaEmbriaoNOMEFUNCIONARIO_COLETA.Clear;
     cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA.Clear;

     if AKFuncionario <> '' then
       begin
         cdsColetaEmbriaoNOMEFUNCIONARIO_COLETA.Text      := ANomeFuncionario ;
         cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA.asString := AKFuncionario ;
       end;

   finally
     dtsColetaEmbriao.OnDataChange := DataChange ;
     if Assigned ( DataChange )  then
        DataChange ( dtsColetaEmbriao, cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA  ) ;
   end;

end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.SetFuncionarioPadrao(
  AKFuncionario, ANomeFuncionario: string);
begin
   FNOMEFUNCIONARIO := ANomeFuncionario ;
   KCADFUNCIONARIO  := AKFuncionario ;
end;

procedure TZoo_ReproducaoColetaEmbriaoDatamodule.SetParams;
begin
   cdsColetaEmbriao.params.paramByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
   cdsColetaEmbriao.params.paramByName ( 'DOADOR' ).asInteger      := _ST_TIPO_DOADOR_RECEPTOR_DOADOR ;
   cdsColetaEmbriao.params.paramByName ( 'STATUS_DESCARTADO' ).asInteger      := _ST_STATUS_ANIMAL_DESCARTADO ;
end;

end.

