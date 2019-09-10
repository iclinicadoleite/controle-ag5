object Zoo_ReproducaoDiagnosticosGestacaoDatamodule: TZoo_ReproducaoDiagnosticosGestacaoDatamodule
  OldCreateOrder = True
  Height = 274
  Width = 548
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
        DataType = ftInteger
        Name = 'EMBRIAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASPRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_1VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_1VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_2VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_2VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMBRIAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASPRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_1VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_1VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_2VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_2VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
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
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDiagGestacaoKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
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
      Required = True
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
      OnGetText = cdsDiagGestacaoPRENHEZGetText
      OnSetText = cdsDiagGestacaoPRENHEZSetText
      OnValidate = cdsDiagGestacaoPRENHEZValidate
      FixedChar = True
      Size = 1
    end
    object cdsDiagGestacaoREEXAMINAR: TStringField
      DisplayLabel = 'Reexaminas'
      FieldName = 'REEXAMINAR'
      Required = True
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
      ProviderFlags = [pfInWhere]
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
      Required = True
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
    object cdsDiagGestacaoCOUNT_EXAMINADOS: TAggregateField
      FieldName = 'COUNT_EXAMINADOS'
      Active = True
      DisplayName = ''
      Expression = 'COUNT( PRENHEZ )'
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
    CommandText = 
      'SELECT '#13#10'  E.KZOO_EVENTO_ZOOTECNICO,'#13#10'  E.KZOO_ANIMAL_FEMEA,'#13#10'  ' +
      'E.TIPOEVENTO, '#13#10'  E.DATAEVENTO, '#13#10'  AF.BRINCO BRINCOFEMEA,'#13#10'  AF' +
      '.BRINCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  AM.NOMEE' +
      'STABULO NOMEMACHO,'#13#10'  E.DATATOQUE "DATA_ULTIMOTOQUE",'#13#10'  ( (SELE' +
      'CT CAST ( SYS$DESCRIPTION AS VARCHAR ( 20 ) ) SYS$DESCRIPTION FR' +
      'OM SYS$TYPES_GETDESCRIPTION( '#39'STATUS_PRENHEZ'#39', E.PRENHEZ )) ||'#13#10 +
      '   '#39' ('#39'||CAST( E.QTDE_DIAGNOSTICO AS VARCHAR(3) ) ) || '#39')'#39' "ULTI' +
      'MO_DIAGNOSTICO",'#13#10'  E.PRENHEZ, '#13#10'  E.REEXAMINAR, '#13#10'  E.GEMELAR,'#13 +
      #10'  E.SEXO_CRIA,'#13#10'  CAST( NULL AS TIMESTAMP ) AS NOVOTOQUE,'#13#10' CAS' +
      'T( NULL AS SYS$BOOL_NULL ) AS NOVAPRENHEZ,'#13#10'  E.DATATOQUE,'#13#10'  E.' +
      'KCAD_VETERINARIO,'#13#10'  E.NOMEVETERINARIO,'#13#10'  E.LOTETOQUE,'#13#10'  COALE' +
      'SCE ( E.PROTOCOLO_TOQUE, '#39'F'#39' ) PROTOCOLO_TOQUE,  '#13#10' DAF.NUMERO_L' +
      'ACTACAO, '#13#10' DAF.LOTE,'#13#10'E.ABORTOPARTO,'#13#10'E.DATAABORTOPARTO,'#13#10'  L.K' +
      'ZOO_LACTACAO,'#13#10'E.PRENHEZ as PRENHEZ_ANTERIOR'#13#10'FROM ZOO_EVENTOS_Z' +
      'OOTECNICOS E'#13#10'LEFT JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = E.KZO' +
      'O_ANIMAL_FEMEA'#13#10'LEFT JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = E.K' +
      'ZOO_ANIMAL_MACHO'#13#10'LEFT JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_AN' +
      'IMAL_FEMEA = E.KZOO_ANIMAL_FEMEA'#13#10'LEFT JOIN ZOO_LACTACOES L ON L' +
      '.KZOO_EVENTO_ZOOTECNICO = E.KZOO_EVENTO_ZOOTECNICO'#13#10'WHERE'#13#10'     ' +
      '   ( AF.KCAD_FAZENDA = :KCAD_FAZENDA ) AND (AF.STATUS <> :STATUS' +
      '_DESCARTADO)'#13#10'AND  ( E.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMA_MONT' +
      'A )'#13#10'AND  ( '#13#10'                ( DAF.KULTIMO_CIO IS NULL )'#13#10'     ' +
      '     OR ( DAF.ULTIMO_CIO < DAF.ULTIMA_MONTA  )'#13#10'        )'#13#10'AND (' +
      ' DAF.DOADOR_RECEPTOR  IS DISTINCT FROM  :DOADOR )'#13#10'AND ( E.DATAA' +
      'BORTOPARTO IS NULL ) '#13#10'AND ( E.PRENHEZ IS DISTINCT FROM '#39'F'#39' )'#13#10'-' +
      '-(LOTES)'#13#10'AND '#13#10'('#13#10'      (          E.TIPOEVENTO <> :EMBRIAO'#13#10'  ' +
      '       AND (  (      E.QTDE_DIAGNOSTICO = 0 '#13#10'                  ' +
      '         AND ( '#13#10'                                     (( DAF.NUM' +
      'ERO_LACTACAO > 1  ) AND ( DATEADD( :DIASMULTIPARA DAY TO E.DATAE' +
      'VENTO ) <= :DATA ))'#13#10'                              OR  (( DAF.NU' +
      'MERO_LACTACAO <= 1 ) AND ( DATEADD( :DIASPRIMIPARA DAY TO E.DATA' +
      'EVENTO ) <= :DATA ))'#13#10'                          )'#13#10'             ' +
      '       )'#13#10'               OR (      E.QTDE_DIAGNOSTICO = 1'#13#10'     ' +
      '                      AND ( '#13#10'                                  ' +
      '   (( DAF.NUMERO_LACTACAO > 1  ) AND ( DATEADD( :DIASMULTIPARA_1' +
      'VEZ DAY TO E.DATAEVENTO ) <= :DATA ))'#13#10'                         ' +
      '     OR  (( DAF.NUMERO_LACTACAO <= 1 ) AND ( DATEADD( :DIASMULTI' +
      'PARA_1VEZ DAY TO E.DATAEVENTO ) <= :DATA ))'#13#10'                   ' +
      '       )'#13#10'                    )'#13#10'               OR (      E.QTDE' +
      '_DIAGNOSTICO = 2'#13#10'                           AND ( '#13#10'           ' +
      '                          (( DAF.NUMERO_LACTACAO > 1  ) AND ( DA' +
      'TEADD( :DIASMULTIPARA_2VEZ DAY TO E.DATAEVENTO ) <= :DATA ))'#13#10'  ' +
      '                            OR  (( DAF.NUMERO_LACTACAO <= 1 ) AN' +
      'D ( DATEADD( :DIASMULTIPARA_2VEZ DAY TO E.DATAEVENTO ) <= :DATA ' +
      '))'#13#10'                          )'#13#10'                    )'#13#10'        ' +
      '        )'#13#10'      )'#13#10'OR '#13#10'      (          E.TIPOEVENTO <> :EMBRI' +
      'AO'#13#10'         AND (  (      E.QTDE_DIAGNOSTICO = 0 '#13#10'            ' +
      '               AND ( '#13#10'                                     (( D' +
      'AF.NUMERO_LACTACAO > 1  ) AND ( DATEADD( :DIASMULTIPARA DAY TO (' +
      'E.DATAEVENTO - 7) ) <= :DATA ))'#13#10'                              O' +
      'R  (( DAF.NUMERO_LACTACAO <= 1 ) AND ( DATEADD( :DIASPRIMIPARA D' +
      'AY TO (E.DATAEVENTO - 7) ) <= :DATA ))'#13#10'                        ' +
      '  )'#13#10'                    )'#13#10'               OR (      E.QTDE_DIAG' +
      'NOSTICO = 1'#13#10'                           AND ( '#13#10'                ' +
      '                     (( DAF.NUMERO_LACTACAO > 1  ) AND ( DATEADD' +
      '( :DIASMULTIPARA_1VEZ DAY TO (E.DATAEVENTO - 7) ) <= :DATA ))'#13#10' ' +
      '                             OR  (( DAF.NUMERO_LACTACAO <= 1 ) A' +
      'ND ( DATEADD( :DIASMULTIPARA_1VEZ DAY TO (E.DATAEVENTO - 7) ) <=' +
      ' :DATA ))'#13#10'                          )'#13#10'                    )'#13#10' ' +
      '              OR (      E.QTDE_DIAGNOSTICO = 2'#13#10'                ' +
      '           AND ( '#13#10'                                     (( DAF.N' +
      'UMERO_LACTACAO > 1  ) AND ( DATEADD( :DIASMULTIPARA_2VEZ DAY TO ' +
      '(E.DATAEVENTO - 7) ) <= :DATA ))'#13#10'                              ' +
      'OR  (( DAF.NUMERO_LACTACAO <= 1 ) AND ( DATEADD( :DIASMULTIPARA_' +
      '2VEZ DAY TO (E.DATAEVENTO - 7) ) <= :DATA ))'#13#10'                  ' +
      '        )'#13#10'                    )'#13#10'                )'#13#10'      )'#13#10')'#13 +
      #10'ORDER BY AF.BRINCO_'
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
        DataType = ftInteger
        Name = 'EMBRIAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASPRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_1VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_1VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_2VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_2VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMBRIAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASPRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_1VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_1VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_2VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASMULTIPARA_2VEZ'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 58
    Top = 133
    object sqlDiagGestacaoKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlDiagGestacaoKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
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
      Required = True
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
      Required = True
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
      Required = True
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
    CommandText = 
      'SELECT DISTINCT COALESCE(AF.LOTE, '#39#39') "LOTE",'#13#10'       IIF(AF.LOT' +
      'E IS NULL OR AF.LOTE = '#39#39' , 1, 0) "FIELD_NULL",'#13#10'       1 "SELEC' +
      'TED"'#13#10'  FROM ZOO_ANIMAIS_FEMEA AF'#13#10'  INNER JOIN ZOO_ANIMAIS A ON' +
      ' AF.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'#13#10' WHERE A.STATUS <> 9'#13#10'  O' +
      'RDER BY lpad(AF.LOTE, 10, '#39'0'#39' )'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
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
end
