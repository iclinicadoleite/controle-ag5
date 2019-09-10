object Zoo_ReproducaoDiagnosticosGestacaoDatamodule: TZoo_ReproducaoDiagnosticosGestacaoDatamodule
  OldCreateOrder = True
  Height = 410
  Width = 869
  object cdsDiagGestacao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DOADOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LOTE_NULL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA_1X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA_1X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA_2X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA_2X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMBRIAO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDiagGestacao'
    BeforeInsert = cdsDiagGestacaoBeforeInsert
    BeforeEdit = cdsDiagGestacaoBeforeEdit
    BeforePost = cdsDiagGestacaoBeforePost
    AfterCancel = cdsDiagGestacaoAfterCancel
    BeforeDelete = cdsDiagGestacaoBeforeDelete
    OnNewRecord = cdsDiagGestacaoNewRecord
    Left = 55
    Top = 44
    object cdsDiagGestacaoKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      Visible = False
      FixedChar = True
    end
    object cdsDiagGestacaoKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object cdsDiagGestacaoTIPOEVENTO: TIntegerField
      DisplayLabel = 'Evento'
      FieldName = 'TIPOEVENTO'
    end
    object cdsDiagGestacaoDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data Evento'
      FieldName = 'DATAEVENTO'
      ProviderFlags = []
    end
    object cdsDiagGestacaoBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsDiagGestacaoBRINCOFEMEA_: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA_'
      ProviderFlags = []
      Visible = False
      Size = 16
    end
    object cdsDiagGestacaoNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsDiagGestacaoNOMEMACHO: TStringField
      DisplayLabel = 'Touro'
      FieldName = 'NOMEMACHO'
      Size = 60
    end
    object cdsDiagGestacaoCOD_STATUS_REPRODUTIVO: TIntegerField
      FieldName = 'COD_STATUS_REPRODUTIVO'
      Visible = False
    end
    object cdsDiagGestacaoDATA_ULTIMOTOQUE: TSQLTimeStampField
      DisplayLabel = 'Data '#250'ltimo toque'
      FieldName = 'DATA_ULTIMOTOQUE'
      ProviderFlags = []
    end
    object cdsDiagGestacaoULTIMO_DIAGNOSTICO: TStringField
      DisplayLabel = #218'ltimo diagn'#243'stico de gesta'#231#227'o'
      FieldName = 'ULTIMO_DIAGNOSTICO'
      ProviderFlags = []
      Size = 21
    end
    object cdsDiagGestacaoPRENHEZ: TStringField
      Alignment = taCenter
      DisplayLabel = 'Prenhez'
      FieldName = 'PRENHEZ'
      ProviderFlags = []
      OnChange = cdsDiagGestacaoPRENHEZChange
      OnGetText = cdsDiagGestacaoPRENHEZGetText
      OnSetText = cdsDiagGestacaoPRENHEZSetText
      OnValidate = cdsDiagGestacaoPRENHEZValidate
      FixedChar = True
      Size = 1
    end
    object cdsDiagGestacaoREEXAMINAR: TStringField
      DisplayLabel = 'Reexaminas'
      FieldName = 'REEXAMINAR'
      OnGetText = cdsDiagGestacaoREEXAMINARGetText
      FixedChar = True
      Size = 1
    end
    object cdsDiagGestacaoGEMELAR: TStringField
      FieldName = 'GEMELAR'
      FixedChar = True
      Size = 1
    end
    object cdsDiagGestacaoSEXO_CRIA: TIntegerField
      FieldName = 'SEXO_CRIA'
      OnValidate = cdsDiagGestacaoSEXO_CRIAValidate
    end
    object cdsDiagGestacaoNOVOTOQUE: TSQLTimeStampField
      DisplayLabel = 'Data do Toque'
      FieldName = 'NOVOTOQUE'
      OnValidate = cdsDiagGestacaoNOVOTOQUEValidate
    end
    object cdsDiagGestacaoNOVAPRENHEZ: TStringField
      DisplayLabel = 'Diagn'#243'stico de gesta'#231#227'o atual'
      FieldName = 'NOVAPRENHEZ'
      ProviderFlags = []
      OnGetText = cdsDiagGestacaoNOVAPRENHEZGetText
      OnSetText = cdsDiagGestacaoNOVAPRENHEZSetText
      FixedChar = True
      Size = 1
    end
    object cdsDiagGestacaoDATATOQUE: TSQLTimeStampField
      DisplayLabel = 'Data do Toque'
      FieldName = 'DATATOQUE'
    end
    object cdsDiagGestacaoKCAD_VETERINARIO: TStringField
      FieldName = 'KCAD_VETERINARIO'
      FixedChar = True
    end
    object cdsDiagGestacaoNOMEVETERINARIO: TStringField
      DisplayLabel = 'Nome Veterin'#225'rio'
      FieldName = 'NOMEVETERINARIO'
      OnSetText = cdsDiagGestacaoNOMEVETERINARIOSetText
      Size = 128
    end
    object cdsDiagGestacaoLOTETOQUE: TStringField
      FieldName = 'LOTETOQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 32
    end
    object cdsDiagGestacaoPROTOCOLO_TOQUE: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO_TOQUE'
      OnGetText = cdsDiagGestacaoPROTOCOLO_TOQUEGetText
      FixedChar = True
      Size = 1
    end
    object cdsDiagGestacaoNUMERO_LACTACAO: TIntegerField
      FieldName = 'NUMERO_LACTACAO'
    end
    object cdsDiagGestacaoLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsDiagGestacaoABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
    end
    object cdsDiagGestacaoDATAABORTOPARTO: TSQLTimeStampField
      FieldName = 'DATAABORTOPARTO'
    end
    object cdsDiagGestacaoKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      FixedChar = True
    end
    object cdsDiagGestacaoDESC_EVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldKind = fkLookup
      FieldName = 'DESC_EVENTO'
      LookupDataSet = cdsTipoEvento
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOEVENTO'
      Size = 31
      Lookup = True
    end
    object cdsDiagGestacaoDESC_GEMELAR: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_GEMELAR'
      LookupDataSet = cdsStatusGemelar
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'GEMELAR'
      Size = 15
      Lookup = True
    end
    object cdsDiagGestacaoDESC_SEXO_CRIA: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_SEXO_CRIA'
      LookupDataSet = cdsSexoCria
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'SEXO_CRIA'
      Size = 15
      Lookup = True
    end
    object cdsDiagGestacaoPREVISAOPARTO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'PREVISAOPARTO'
      ProviderFlags = []
    end
    object cdsDiagGestacaoPRENHEZ_ANTERIOR: TStringField
      FieldName = 'PRENHEZ_ANTERIOR'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsDiagGestacaoDIAS_DA_COBERTURA: TIntegerField
      DisplayLabel = 'Dias da cobertura'
      FieldName = 'DIAS_DA_COBERTURA'
      ProviderFlags = []
    end
    object cdsDiagGestacaoSTATUS_REPRODUTIVO: TStringField
      DisplayLabel = 'Status reprodutivo'
      FieldName = 'STATUS_REPRODUTIVO'
      ProviderFlags = []
      Size = 50
    end
    object cdsDiagGestacaoKZOO_ANIMAL_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_ANIMAL_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsDiagGestacaoKZOO_ANIMAL_PROTOCOLO: TStringField
      FieldName = 'KZOO_ANIMAL_PROTOCOLO'
      FixedChar = True
    end
    object cdsDiagGestacaoKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      ProviderFlags = []
      OnChange = cdsDiagGestacaoKZOO_DIAGNOSTICOChange
      OnValidate = cdsDiagGestacaoKZOO_DIAGNOSTICOValidate
      FixedChar = True
    end
    object cdsDiagGestacaoKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      ProviderFlags = []
      OnValidate = cdsDiagGestacaoKZOO_PROTOCOLOValidate
      FixedChar = True
    end
    object cdsDiagGestacaoCODIGO_DIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico sanit'#225'rio'
      FieldKind = fkLookup
      FieldName = 'CODIGO_DIAGNOSTICO'
      LookupDataSet = cdsDiagnosticosDisponiveis
      LookupKeyFields = 'KZOO_DIAGNOSTICO'
      LookupResultField = 'CODIGO'
      KeyFields = 'KZOO_DIAGNOSTICO'
      ProviderFlags = []
      Lookup = True
    end
    object cdsDiagGestacaoCODIGO_PROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldKind = fkLookup
      FieldName = 'CODIGO_PROTOCOLO'
      LookupDataSet = cdsProtocolosDisponiveis
      LookupKeyFields = 'KZOO_PROTOCOLO'
      LookupResultField = 'CODIGO'
      KeyFields = 'KZOO_PROTOCOLO'
      ProviderFlags = []
      Lookup = True
    end
    object cdsDiagGestacaoNOME_DIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico sanit'#225'rio'
      FieldKind = fkLookup
      FieldName = 'NOME_DIAGNOSTICO'
      LookupDataSet = cdsDiagnosticosDisponiveis
      LookupKeyFields = 'KZOO_DIAGNOSTICO'
      LookupResultField = 'NOME'
      KeyFields = 'KZOO_DIAGNOSTICO'
      Size = 60
      Lookup = True
    end
    object cdsDiagGestacaoNOME_PROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldKind = fkLookup
      FieldName = 'NOME_PROTOCOLO'
      LookupDataSet = cdsProtocolosDisponiveis
      LookupKeyFields = 'KZOO_PROTOCOLO'
      LookupResultField = 'NOME'
      KeyFields = 'KZOO_PROTOCOLO'
      Size = 60
      Lookup = True
    end
    object cdsDiagGestacaoQTDE_COBERTURA: TIntegerField
      FieldName = 'QTDE_COBERTURA'
    end
    object cdsDiagGestacaoDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
    end
    object cdsDiagGestacaoCOUNT_EXAMINADOS: TAggregateField
      FieldName = 'COUNT_EXAMINADOS'
      Active = True
      DisplayName = ''
      Expression = 'COUNT( PRENHEZ )'
    end
    object cdsDiagGestacaoCOUNT_DIAGNOSTICOS: TAggregateField
      FieldName = 'COUNT_DIAGNOSTICOS'
      Active = True
      DisplayName = ''
      Expression = 'COUNT(KZOO_DIAGNOSTICO)'
    end
    object cdsDiagGestacaoCOUNT_PROTOCOLOS: TAggregateField
      FieldName = 'COUNT_PROTOCOLOS'
      Active = True
      DisplayName = ''
      Expression = 'COUNT(KZOO_PROTOCOLO)'
    end
  end
  object dspDiagGestacao: TDataSetProvider
    DataSet = sqlDiagGestacao
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspDiagGestacaoAfterUpdateRecord
    BeforeUpdateRecord = dspDiagGestacaoBeforeUpdateRecord
    OnGetTableName = dspDiagGestacaoGetTableName
    Left = 31
    Top = 89
  end
  object sqlDiagGestacao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DOADOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LOTE_NULL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA_1X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA_1X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA_2X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA_2X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMBRIAO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'SELECT '
      '  E.KZOO_EVENTO_ZOOTECNICO,'
      '  E.KZOO_ANIMAL_FEMEA,'
      '  E.TIPOEVENTO, '
      '  E.DATAEVENTO, '
      
        '  (CURRENT_DATE - CAST( E.DATAEVENTO AS DATE)) "DIAS_DA_COBERTUR' +
        'A",'
      '  AF.BRINCO BRINCOFEMEA,'
      '  AF.BRINCO_ BRINCOFEMEA_,'
      '  AF.NOMEESTABULO NOMEFEMEA,'
      '  AM.NOMEESTABULO NOMEMACHO,'
      ' (SELECT CAST ( STATUS_REPRODUTIVO_ANIMAL AS INTEGER ) SYS$VALUE'
      
        '                     FROM ZOO_GET_STATUS_REPRODUTIVO( E.KZOO_ANI' +
        'MAL_FEMEA ))'
      '       "COD_STATUS_REPRODUTIVO",'
      
        '  (SELECT CAST( SYS$DESCRIPTION AS VARCHAR ( 50 ) ) FROM SYS$TYP' +
        'ES_GETDESCRIPTION( '#39'STATUS_REPRODUTIVO'#39','
      
        '                  (SELECT CAST ( STATUS_REPRODUTIVO_ANIMAL AS IN' +
        'TEGER ) SYS$VALUE'
      
        '                     FROM ZOO_GET_STATUS_REPRODUTIVO( E.KZOO_ANI' +
        'MAL_FEMEA ))'
      '        ) ) "STATUS_REPRODUTIVO",'
      '  E.DATATOQUE "DATA_ULTIMOTOQUE",'
      
        '  ( (SELECT CAST ( SYS$DESCRIPTION AS VARCHAR ( 20 ) ) SYS$DESCR' +
        'IPTION FROM SYS$TYPES_GETDESCRIPTION( '#39'STATUS_PRENHEZ'#39', E.PRENHE' +
        'Z )) ||'
      
        '   '#39' ('#39'||CAST( E.QTDE_DIAGNOSTICO AS VARCHAR(3) ) ) || '#39')'#39' "ULTI' +
        'MO_DIAGNOSTICO",'
      '  E.PRENHEZ, '
      '  E.REEXAMINAR, '
      '  E.GEMELAR,'
      '  E.SEXO_CRIA,'
      '  CAST( NULL AS TIMESTAMP ) AS NOVOTOQUE,'
      ' CAST( NULL AS SYS$BOOL_NULL ) AS NOVAPRENHEZ,'
      '  E.DATATOQUE,'
      '  E.KCAD_VETERINARIO,'
      '  E.NOMEVETERINARIO,'
      '  E.LOTETOQUE,'
      '  COALESCE ( E.PROTOCOLO_TOQUE, '#39'F'#39' ) PROTOCOLO_TOQUE,  '
      ' DAF.NUMERO_LACTACAO, '
      ' DAF.LOTE,'
      'E.ABORTOPARTO,'
      'E.DATAABORTOPARTO,'
      'E.KZOO_ANIMAL_DIAGNOSTICO,'
      'D.KZOO_DIAGNOSTICO,'
      'E.KZOO_ANIMAL_PROTOCOLO,'
      'P.KZOO_PROTOCOLO,'
      '  L.KZOO_LACTACAO,'
      'E.PRENHEZ AS PRENHEZ_ANTERIOR,'
      
        '(SELECT QTDE_COBERTURA FROM ZOO_GET_QTDE_COBERTURA_LACTACAO(E.KZ' +
        'OO_ANIMAL_FEMEA, E.DATAEVENTO)) QTDE_COBERTURA,'
      'DAF.DOADOR_RECEPTOR'
      'FROM ZOO_EVENTOS_ZOOTECNICOS E'
      'LEFT JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = E.KZOO_ANIMAL_FEMEA'
      'LEFT JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO'
      
        'LEFT JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = E.KZO' +
        'O_ANIMAL_FEMEA'
      
        'LEFT JOIN ZOO_LACTACOES L ON L.KZOO_EVENTO_ZOOTECNICO = E.KZOO_E' +
        'VENTO_ZOOTECNICO'
      
        'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS AD ON E.KZOO_ANIMAL_DIAGNOSTIC' +
        'O = AD.KZOO_ANIMAL_DIAGNOSTICO AND 1=0'
      
        'LEFT JOIN ZOO_ANIMAL_PROTOCOLOS AP ON E.KZOO_ANIMAL_PROTOCOLO = ' +
        'AP.KZOO_ANIMAL_PROTOCOLO AND 1=0'
      
        'LEFT JOIN ZOO_DIAGNOSTICOS D ON AD.KZOO_DIAGNOSTICO = D.KZOO_DIA' +
        'GNOSTICO'
      
        'LEFT JOIN ZOO_PROTOCOLOS P ON AP.KZOO_PROTOCOLO = P.KZOO_PROTOCO' +
        'LO'
      'WHERE'
      
        '        ( AF.KCAD_FAZENDA = :KCAD_FAZENDA ) AND (AF.STATUS <> :S' +
        'TATUS_DESCARTADO)'
      'AND  ( E.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMA_MONTA )'
      'AND  ( '
      '                ( DAF.KULTIMO_CIO IS NULL )'
      '          OR ( DAF.ULTIMO_CIO < DAF.ULTIMA_MONTA  )'
      '        )'
      'AND ( DAF.DOADOR_RECEPTOR  IS DISTINCT FROM  :DOADOR )'
      'AND ( E.DATAABORTOPARTO IS NULL ) '
      'AND ( E.PRENHEZ IS DISTINCT FROM '#39'F'#39' )'
      '/*ADDBYKEY*/'
      
        'AND ( /*LOTE_IN*/ (:LOTE_NULL = '#39'T'#39' AND (DAF.LOTE IS NULL OR DAF' +
        '.LOTE = '#39#39' ) ) )'
      'AND ( DATEADD('
      '        (CASE E.QTDE_DIAGNOSTICO'
      '         WHEN 0 THEN IIF ( DAF.NUMERO_LACTACAO > 1'
      
        '                       , CAST ( :DIAS_CONFIRMAR_MULTIPARA AS INT' +
        'EGER )'
      
        '                       , CAST ( :DIAS_CONFIRMAR_PRIMIPARA AS INT' +
        'EGER )    )'
      '         WHEN 1 THEN IIF ( DAF.NUMERO_LACTACAO > 1'
      
        '                       , CAST ( :DIAS_CONFIRMAR_MULTIPARA_1X AS ' +
        'INTEGER )'
      
        '                       , CAST ( :DIAS_CONFIRMAR_PRIMIPARA_1X AS ' +
        'INTEGER ) )'
      '         WHEN 2 THEN IIF ( DAF.NUMERO_LACTACAO > 1'
      
        '                       , CAST ( :DIAS_CONFIRMAR_MULTIPARA_2X AS ' +
        'INTEGER )'
      
        '                       , CAST ( :DIAS_CONFIRMAR_PRIMIPARA_2X AS ' +
        'INTEGER ) )'
      '         END'
      '        ) DAY TO (   E.DATAEVENTO'
      '                   - IIF( E.TIPOEVENTO = :EMBRIAO, 7, 0)'
      '               )'
      '      ) <= :DATA'
      '    )'
      '-- STATUS REPRODUTIVO'
      'UNION ALL'
      'SELECT '
      '  E.KZOO_EVENTO_ZOOTECNICO,'
      '  DAF.KZOO_ANIMAL_FEMEA,'
      '  E.TIPOEVENTO, '
      '  E.DATAEVENTO, '
      
        '  COALESCE( (CURRENT_DATE - CAST( E.DATAEVENTO AS DATE)) , 0) "D' +
        'IAS_DA_COBERTURA",'
      '  AF.BRINCO BRINCOFEMEA,'
      '  AF.BRINCO_ BRINCOFEMEA_,'
      '  AF.NOMEESTABULO NOMEFEMEA,'
      '  AM.NOMEESTABULO NOMEMACHO,'
      ' (SELECT CAST ( STATUS_REPRODUTIVO_ANIMAL AS INTEGER ) SYS$VALUE'
      
        '                     FROM ZOO_GET_STATUS_REPRODUTIVO( AF.KZOO_AN' +
        'IMAL ))'
      '       "COD_STATUS_REPRODUTIVO",'
      
        '  (SELECT CAST( SYS$DESCRIPTION AS VARCHAR ( 50 ) ) FROM SYS$TYP' +
        'ES_GETDESCRIPTION( '#39'STATUS_REPRODUTIVO'#39','
      
        '                  (SELECT CAST ( STATUS_REPRODUTIVO_ANIMAL AS IN' +
        'TEGER ) SYS$VALUE'
      
        '                     FROM ZOO_GET_STATUS_REPRODUTIVO( AF.KZOO_AN' +
        'IMAL ))'
      '        ) ) "STATUS_REPRODUTIVO",'
      '  E.DATATOQUE "DATA_ULTIMOTOQUE",'
      
        '  ( (SELECT CAST ( SYS$DESCRIPTION AS VARCHAR ( 20 ) ) SYS$DESCR' +
        'IPTION FROM SYS$TYPES_GETDESCRIPTION( '#39'STATUS_PRENHEZ'#39', E.PRENHE' +
        'Z )) ||'
      
        '   '#39' ('#39'||CAST( E.QTDE_DIAGNOSTICO AS VARCHAR(3) ) ) || '#39')'#39' "ULTI' +
        'MO_DIAGNOSTICO",'
      '  E.PRENHEZ, '
      '  E.REEXAMINAR, '
      '  E.GEMELAR,'
      '  E.SEXO_CRIA,'
      '  CAST( NULL AS TIMESTAMP ) AS NOVOTOQUE,'
      ' CAST( NULL AS SYS$BOOL_NULL ) AS NOVAPRENHEZ,'
      '  E.DATATOQUE,'
      '  E.KCAD_VETERINARIO,'
      '  E.NOMEVETERINARIO,'
      '  E.LOTETOQUE,'
      '  COALESCE ( E.PROTOCOLO_TOQUE, '#39'F'#39' ) PROTOCOLO_TOQUE,  '
      ' DAF.NUMERO_LACTACAO, '
      ' DAF.LOTE,'
      'E.ABORTOPARTO,'
      'E.DATAABORTOPARTO,'
      'E.KZOO_ANIMAL_DIAGNOSTICO,'
      'D.KZOO_DIAGNOSTICO,'
      'E.KZOO_ANIMAL_PROTOCOLO,'
      'P.KZOO_PROTOCOLO,'
      '  L.KZOO_LACTACAO,'
      'E.PRENHEZ AS PRENHEZ_ANTERIOR,'
      
        '(SELECT QTDE_COBERTURA FROM ZOO_GET_QTDE_COBERTURA_LACTACAO(E.KZ' +
        'OO_ANIMAL_FEMEA, E.DATAEVENTO)) QTDE_COBERTURA,'
      'DAF.DOADOR_RECEPTOR'
      'FROM ZOO_ANIMAIS AF'
      
        'INNER JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.K' +
        'ZOO_ANIMAL'
      
        'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS E ON DAF.KULTIMO_EVENTO_ZOOTEC' +
        'NICO = E.KZOO_EVENTO_ZOOTECNICO'
      
        '                                   AND ( E.DATAABORTOPARTO IS NU' +
        'LL )'
      '                                   AND ('
      
        '                                             ( DAF.KULTIMO_CIO I' +
        'S NULL )'
      
        '                                          OR ( DAF.ULTIMO_CIO < ' +
        'DAF.ULTIMA_MONTA  )'
      '                                        )'
      'LEFT JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO'
      
        'LEFT JOIN ZOO_LACTACOES L ON L.KZOO_EVENTO_ZOOTECNICO = E.KZOO_E' +
        'VENTO_ZOOTECNICO'
      
        'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS AD ON E.KZOO_ANIMAL_DIAGNOSTIC' +
        'O = AD.KZOO_ANIMAL_DIAGNOSTICO AND 1=0'
      
        'LEFT JOIN ZOO_ANIMAL_PROTOCOLOS AP ON E.KZOO_ANIMAL_PROTOCOLO = ' +
        'AP.KZOO_ANIMAL_PROTOCOLO AND 1=0'
      
        'LEFT JOIN ZOO_DIAGNOSTICOS D ON AD.KZOO_DIAGNOSTICO = D.KZOO_DIA' +
        'GNOSTICO'
      
        'LEFT JOIN ZOO_PROTOCOLOS P ON AP.KZOO_PROTOCOLO = P.KZOO_PROTOCO' +
        'LO'
      'WHERE'
      
        ' ( AF.KCAD_FAZENDA = :KCAD_FAZENDA ) AND (AF.STATUS <> :STATUS_D' +
        'ESCARTADO)'
      ' AND'
      ' ( '
      
        '   (SELECT CAST ( STATUS_REPRODUTIVO_ANIMAL AS INTEGER ) SYS$VAL' +
        'UE '
      
        '      FROM ZOO_GET_STATUS_REPRODUTIVO(AF.KZOO_ANIMAL )) IN ( /*(' +
        'STATUS_REPRODUTIVO)*/ 999999)'
      ' ) '
      'ORDER BY 7')
    Left = 58
    Top = 133
    object sqlDiagGestacaoKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
    end
    object sqlDiagGestacaoKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object sqlDiagGestacaoTIPOEVENTO: TIntegerField
      DisplayLabel = 'Evento'
      FieldName = 'TIPOEVENTO'
    end
    object sqlDiagGestacaoDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data Evento'
      FieldName = 'DATAEVENTO'
    end
    object sqlDiagGestacaoDIAS_DA_COBERTURA: TIntegerField
      DisplayLabel = 'Dias da cobertura'
      FieldName = 'DIAS_DA_COBERTURA'
      ProviderFlags = []
    end
    object sqlDiagGestacaoBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlDiagGestacaoBRINCOFEMEA_: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA_'
      ProviderFlags = []
      Size = 16
    end
    object sqlDiagGestacaoNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlDiagGestacaoNOMEMACHO: TStringField
      DisplayLabel = 'Touro'
      FieldName = 'NOMEMACHO'
      Size = 60
    end
    object sqlDiagGestacaoCOD_STATUS_REPRODUTIVO: TIntegerField
      FieldName = 'COD_STATUS_REPRODUTIVO'
    end
    object sqlDiagGestacaoSTATUS_REPRODUTIVO: TStringField
      DisplayLabel = 'Status reprodutivo'
      FieldName = 'STATUS_REPRODUTIVO'
      ProviderFlags = []
      Size = 50
    end
    object sqlDiagGestacaoDATA_ULTIMOTOQUE: TSQLTimeStampField
      FieldName = 'DATA_ULTIMOTOQUE'
    end
    object sqlDiagGestacaoULTIMO_DIAGNOSTICO: TStringField
      FieldName = 'ULTIMO_DIAGNOSTICO'
      Size = 21
    end
    object sqlDiagGestacaoPRENHEZ: TStringField
      DisplayLabel = 'Prenhez'
      FieldName = 'PRENHEZ'
      FixedChar = True
      Size = 1
    end
    object sqlDiagGestacaoREEXAMINAR: TStringField
      DisplayLabel = 'Reexaminas'
      FieldName = 'REEXAMINAR'
      FixedChar = True
      Size = 1
    end
    object sqlDiagGestacaoGEMELAR: TStringField
      FieldName = 'GEMELAR'
      FixedChar = True
      Size = 1
    end
    object sqlDiagGestacaoSEXO_CRIA: TIntegerField
      FieldName = 'SEXO_CRIA'
    end
    object sqlDiagGestacaoNOVOTOQUE: TSQLTimeStampField
      DisplayLabel = 'Data do Toque'
      FieldName = 'NOVOTOQUE'
      ProviderFlags = [pfInWhere]
    end
    object sqlDiagGestacaoNOVAPRENHEZ: TStringField
      FieldName = 'NOVAPRENHEZ'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object sqlDiagGestacaoDATATOQUE: TSQLTimeStampField
      DisplayLabel = 'Data do Toque'
      FieldName = 'DATATOQUE'
    end
    object sqlDiagGestacaoKCAD_VETERINARIO: TStringField
      FieldName = 'KCAD_VETERINARIO'
      FixedChar = True
    end
    object sqlDiagGestacaoNOMEVETERINARIO: TStringField
      DisplayLabel = 'Nome Veterin'#225'rio'
      FieldName = 'NOMEVETERINARIO'
      Size = 128
    end
    object sqlDiagGestacaoLOTETOQUE: TStringField
      FieldName = 'LOTETOQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 32
    end
    object sqlDiagGestacaoPROTOCOLO_TOQUE: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO_TOQUE'
      FixedChar = True
      Size = 1
    end
    object sqlDiagGestacaoNUMERO_LACTACAO: TIntegerField
      FieldName = 'NUMERO_LACTACAO'
    end
    object sqlDiagGestacaoLOTE: TStringField
      FieldName = 'LOTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 32
    end
    object sqlDiagGestacaoABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
    end
    object sqlDiagGestacaoDATAABORTOPARTO: TSQLTimeStampField
      FieldName = 'DATAABORTOPARTO'
    end
    object sqlDiagGestacaoKZOO_ANIMAL_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_ANIMAL_DIAGNOSTICO'
      FixedChar = True
    end
    object sqlDiagGestacaoKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      ProviderFlags = []
      FixedChar = True
    end
    object sqlDiagGestacaoKZOO_ANIMAL_PROTOCOLO: TStringField
      FieldName = 'KZOO_ANIMAL_PROTOCOLO'
      FixedChar = True
    end
    object sqlDiagGestacaoKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      ProviderFlags = []
      FixedChar = True
    end
    object sqlDiagGestacaoKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      FixedChar = True
    end
    object sqlDiagGestacaoPRENHEZ_ANTERIOR: TStringField
      FieldName = 'PRENHEZ_ANTERIOR'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object sqlDiagGestacaoQTDE_COBERTURA: TIntegerField
      FieldName = 'QTDE_COBERTURA'
    end
    object sqlDiagGestacaoDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
    end
  end
  object cdsTipoEvento: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 384
    Top = 24
    object cdsTipoEventoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoEventoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoEventoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoEventoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsSexoCria: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 380
    Top = 104
    object StringField1: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object StringField2: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object StringField3: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object IntegerField1: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsStatusGemelar: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 384
    Top = 164
    object StringField4: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object StringField5: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object StringField6: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object IntegerField2: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object sqlLotes: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'SELECT DISTINCT COALESCE(AF.LOTE, '#39#39') "LOTE",'
      '       IIF(AF.LOTE IS NULL OR AF.LOTE = '#39#39' , 1, 0) "FIELD_NULL",'
      '       1 "SELECTED"'
      '  FROM ZOO_ANIMAIS_FEMEA AF'
      
        '  INNER JOIN ZOO_ANIMAIS A ON AF.KZOO_ANIMAL_FEMEA = A.KZOO_ANIM' +
        'AL'
      ' WHERE A.STATUS <> 9'
      '  ORDER BY lpad(AF.LOTE, 10, '#39'0'#39' )')
    Left = 164
    Top = 144
    object sqlLotesLOTE: TStringField
      FieldName = 'LOTE'
      Size = 32
    end
    object sqlLotesFIELD_NULL: TIntegerField
      FieldName = 'FIELD_NULL'
      Required = True
    end
    object sqlLotesSELECTED: TIntegerField
      FieldName = 'SELECTED'
      Required = True
    end
  end
  object dspLotes: TDataSetProvider
    DataSet = sqlLotes
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 152
    Top = 96
  end
  object cdsLotes: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspLotes'
    Left = 168
    Top = 44
    object cdsLotesLOTE: TStringField
      FieldName = 'LOTE'
      Size = 32
    end
    object cdsLotesFIELD_NULL: TIntegerField
      FieldName = 'FIELD_NULL'
      Required = True
    end
    object cdsLotesSELECTED: TIntegerField
      FieldName = 'SELECTED'
      Required = True
    end
    object cdsLotesTOTAL_SELECTED: TAggregateField
      FieldName = 'TOTAL_SELECTED'
      Active = True
      DisplayName = ''
      Expression = 'SUM(SELECTED)'
    end
    object cdsLotesTOTAL_FIELD_NULL: TAggregateField
      FieldName = 'TOTAL_FIELD_NULL'
      Active = True
      DisplayName = ''
      Expression = 'SUM(FIELD_NULL)'
    end
  end
  object cdsStatusReprodutivo: TClientDataSet
    PersistDataPacket.Data = {
      730000009619E0BD01000000180000000300000000000300000073000853454C
      454354454404000100000000000B4445534352495054494F4E01004900000001
      00055749445448020002002800135354415455535F524550524F44555449564F
      530100490000000100055749445448020002001E000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SELECTED'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPTION'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'STATUS_REPRODUTIVOS'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 224
    Top = 216
    object cdsStatusReprodutivoSELECTED: TIntegerField
      FieldName = 'SELECTED'
    end
    object cdsStatusReprodutivoDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object cdsStatusReprodutivoSTATUS_REPRODUTIVOS: TStringField
      FieldName = 'STATUS_REPRODUTIVOS'
      Size = 30
    end
  end
  object cdsProtocolosPadrao: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    OnFilterRecord = cdsProtocolosPadraoFilterRecord
    Left = 168
    Top = 301
    object cdsProtocolosPadraoKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsProtocolosPadraoKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object cdsProtocolosPadraoCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 33
    end
    object cdsProtocolosPadraoVINCULADO: TStringField
      FieldName = 'VINCULADO'
    end
    object cdsProtocolosPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object cdsDiagnosticosPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDiagnosticosPadrao'
    Left = 47
    Top = 300
    object cdsDiagnosticosPadraoKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsDiagnosticosPadraoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsDiagnosticosPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsDiagnosticosPadraoPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsDiagnosticosDisponiveis: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDiagnosticos'
    Left = 364
    Top = 305
    object cdsDiagnosticosDisponiveisKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsDiagnosticosDisponiveisCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsDiagnosticosDisponiveisNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsDiagnosticosDisponiveisPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsProtocolosDisponiveis: TClientDataSet
    Aggregates = <>
    Params = <>
    OnFilterRecord = cdsProtocolosDisponiveisFilterRecord
    Left = 366
    Top = 354
    object cdsProtocolosDisponiveisKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsProtocolosDisponiveisKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object cdsProtocolosDisponiveisCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 33
    end
    object cdsProtocolosDisponiveisVINCULADO: TStringField
      FieldName = 'VINCULADO'
    end
    object cdsProtocolosDisponiveisNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
end
