object dtmZoo_ProducaoAnimal: TdtmZoo_ProducaoAnimal
  OldCreateOrder = True
  Height = 301
  Width = 597
  object cdsLactacoes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KZOO_ANIMAL_FEMEA'
    MasterFields = 'KZOO_ANIMAL'
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspLactacoes'
    BeforeInsert = cdsLactacoesBeforeInsert
    BeforePost = cdsLactacoesBeforePost
    OnCalcFields = cdsLactacoesCalcFields
    Left = 74
    Top = 50
    object cdsLactacoesKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsLactacoesKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLactacoesKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLactacoesKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLactacoesNL: TIntegerField
      FieldName = 'NL'
      Required = True
    end
    object cdsLactacoesDATALACTACAO: TSQLTimeStampField
      DisplayLabel = 'Parto'
      FieldName = 'DATALACTACAO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Required = True
    end
    object cdsLactacoesABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Visible = False
    end
    object cdsLactacoesABORTOU: TStringField
      DisplayLabel = 'Aborto'
      FieldKind = fkInternalCalc
      FieldName = 'ABORTOU'
      ProviderFlags = [pfInWhere]
      Size = 3
    end
    object cdsLactacoesDEL: TIntegerField
      FieldName = 'DEL'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsLactacoesPRODUCAO_MEDIA: TFloatField
      DisplayLabel = 'M'#233'dia produ'#231#227'o'
      FieldName = 'PRODUCAO_MEDIA'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object cdsLactacoesPRODUCAO_PICO: TFloatField
      DisplayLabel = 'Pico produ'#231#227'o'
      FieldName = 'PRODUCAO_PICO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object cdsLactacoesPL305: TFloatField
      DisplayLabel = 'Leite 305d'
      FieldName = 'PL305'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object cdsLactacoesPGT: TFloatField
      DisplayLabel = 'Gordura total'
      FieldName = 'PGT'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object cdsLactacoesPPT: TFloatField
      DisplayLabel = 'Prote'#237'na total'
      FieldName = 'PPT'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object cdsLactacoesPLT: TFloatField
      DisplayLabel = 'Leite total'
      FieldName = 'PLT'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object cdsLactacoesOBS_SECAGEM: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS_SECAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsLactacoesIEP_MESES: TIntegerField
      DisplayLabel = 'IEP'
      FieldName = 'IEP_MESES'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsLactacoesDEL_PICO: TIntegerField
      DisplayLabel = 'Dias do pico'
      FieldName = 'DEL_PICO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsLactacoesMAX_ORDENHAS_DIA: TIntegerField
      DisplayLabel = 'Max. ordenhas dia'
      FieldName = 'MAX_ORDENHAS_DIA'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsLactacoesPL365: TFloatField
      DisplayLabel = 'Leite 365'
      FieldName = 'PL365'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object cdsLactacoesEQA_LEITE: TFloatField
      DisplayLabel = 'EQA'
      FieldName = 'EQA_LEITE'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Visible = False
      DisplayFormat = '#,0'
    end
    object cdsLactacoesDESVIO_EQA_LEITE: TFloatField
      DisplayLabel = 'Desvio'
      FieldName = 'DESVIO_EQA_LEITE'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Visible = False
      DisplayFormat = '#,0'
    end
    object cdsLactacoesDATA_SECAGEM: TSQLTimeStampField
      DisplayLabel = 'Data secagem'
      FieldName = 'DATA_SECAGEM'
      OnValidate = cdsLactacoesDATA_SECAGEMValidate
    end
    object cdsLactacoesCAUSA_SECAGEM: TIntegerField
      FieldName = 'CAUSA_SECAGEM'
      Visible = False
    end
    object cdsLactacoesDESC_SECAGEM: TStringField
      DisplayLabel = 'Causa secagem'
      FieldKind = fkLookup
      FieldName = 'DESC_SECAGEM'
      LookupDataSet = cdsMotivoSecagem
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CAUSA_SECAGEM'
      Size = 32
      Lookup = True
    end
    object cdsLactacoesAPLICADO_PROTOCOLO_SECAGEM: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'APLICADO_PROTOCOLO_SECAGEM'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsLactacoesPG305: TFloatField
      DisplayLabel = 'Gordura 305'
      FieldName = 'PG305'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object cdsLactacoesPG365: TFloatField
      DisplayLabel = 'Gordura 365'
      FieldName = 'PG365'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object cdsLactacoesPP305: TFloatField
      DisplayLabel = 'Prote'#237'na 305'
      FieldName = 'PP305'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object cdsLactacoesPP365: TFloatField
      DisplayLabel = 'Prote'#237'na 365'
      FieldName = 'PP365'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object cdsLactacoesEQA_GORDURA: TFloatField
      DisplayLabel = 'Gordura EQA'
      FieldName = 'EQA_GORDURA'
      ReadOnly = True
      Visible = False
      DisplayFormat = '#,0'
    end
    object cdsLactacoesEQA_PROTEINA: TFloatField
      DisplayLabel = 'Prote'#237'na EQA'
      FieldName = 'EQA_PROTEINA'
      ReadOnly = True
      Visible = False
      DisplayFormat = '#,0'
    end
    object cdsLactacoesULTIMA_PESAGEMLEITE: TSQLTimeStampField
      DisplayLabel = 'Processamento'
      FieldName = 'ULTIMA_PESAGEMLEITE'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsLactacoesGORDURA_MEDIA: TFloatField
      DisplayLabel = 'Gordura m'#233'dia'
      FieldKind = fkInternalCalc
      FieldName = 'GORDURA_MEDIA'
      DisplayFormat = '#,0.0'
    end
    object cdsLactacoesPROTEINA_MEDIA: TFloatField
      DisplayLabel = 'Prote'#237'na m'#233'dia'
      FieldKind = fkInternalCalc
      FieldName = 'PROTEINA_MEDIA'
      DisplayFormat = '#,0.0'
    end
    object cdsLactacoesPRODUCAO_MEDIA_DIARIA: TFloatField
      DisplayLabel = 'M'#233'dia produ'#231#227'o'
      FieldKind = fkInternalCalc
      FieldName = 'PRODUCAO_MEDIA_DIARIA'
      DisplayFormat = '#,0.0'
    end
    object cdsLactacoesINTERVALO_SECAGEM: TIntegerField
      FieldName = 'INTERVALO_SECAGEM'
      Visible = False
    end
  end
  object cdsPesagemLeite: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'MASTER_SOURCE'
        Fields = 'KZOO_LACTACAO'
      end>
    IndexName = 'MASTER_SOURCE'
    MasterFields = 'KZOO_LACTACAO'
    MasterSource = dtsLactacoes
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LACTACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesagemLeite'
    StoreDefs = True
    BeforeInsert = cdsPesagemLeiteBeforeInsert
    BeforeEdit = cdsPesagemLeiteBeforeEdit
    BeforePost = cdsPesagemLeiteBeforePost
    OnCalcFields = cdsPesagemLeiteCalcFields
    OnNewRecord = cdsPesagemLeiteNewRecord
    Left = 206
    Top = 55
    object cdsPesagemLeiteKZOO_PESAGEM_LEITE: TStringField
      FieldName = 'KZOO_PESAGEM_LEITE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPesagemLeiteKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsPesagemLeiteKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object cdsPesagemLeiteKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object cdsPesagemLeiteDATALACTACAO: TSQLTimeStampField
      FieldName = 'DATALACTACAO'
      Required = True
    end
    object cdsPesagemLeiteDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      OnValidate = cdsPesagemLeiteDATAValidate
    end
    object cdsPesagemLeiteDEL: TIntegerField
      FieldName = 'DEL'
      ProviderFlags = [pfInWhere]
    end
    object cdsPesagemLeiteNORD: TIntegerField
      DisplayLabel = 'No Ord'
      FieldKind = fkInternalCalc
      FieldName = 'NORD'
      OnValidate = cdsPesagemLeiteNORDValidate
    end
    object cdsPesagemLeiteORD1: TFloatField
      DisplayLabel = 'Ord 1'
      FieldName = 'ORD1'
      OnValidate = cdsPesagemLeiteORDValidate
      DisplayFormat = '#,0.00'
    end
    object cdsPesagemLeiteORD2: TFloatField
      DisplayLabel = 'Ord 2'
      FieldName = 'ORD2'
      OnValidate = cdsPesagemLeiteORDValidate
      DisplayFormat = '#,0.00'
    end
    object cdsPesagemLeiteORD3: TFloatField
      DisplayLabel = 'Ord 3'
      FieldName = 'ORD3'
      OnValidate = cdsPesagemLeiteORDValidate
      DisplayFormat = '#,0.00'
    end
    object cdsPesagemLeiteTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.00'
    end
    object cdsPesagemLeiteVARIACAO: TFloatField
      DisplayLabel = 'Varia'#231#227'o'
      FieldName = 'VARIACAO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '+0.00%;-0.00%;0.00%'
    end
    object cdsPesagemLeiteOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPesagemLeiteLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsPesagemLeiteANIMAL_DOENTE: TStringField
      DisplayLabel = 'Doente'
      FieldName = 'ANIMAL_DOENTE'
      FixedChar = True
      Size = 1
    end
  end
  object sqlLactacoes: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'SELECT  '
      '    L.KZOO_LACTACAO, '
      '    L.KZOO_EVENTO_ZOOTECNICO, '
      '    L.KCAD_FAZENDA, '
      '    L.KZOO_ANIMAL_FEMEA, '
      '    L.NL, '
      '    L.DATALACTACAO,'
      '    E.ABORTOPARTO,'
      '    L.DEL,'
      '    L.PRODUCAO_MEDIA,'
      '    L.PRODUCAO_PICO,'
      '    L.PL305,'
      '    L.PGT,'
      '    L.PPT,'
      '    L.PLT,'
      '    L.OBS_SECAGEM,'
      '    L.IEP_MESES,'
      '    L.DEL_PICO,'
      '    L.MAX_ORDENHAS_DIA,'
      '    L.PL365,'
      '    L.EQA_LEITE,'
      '    L.DESVIO_EQA_LEITE,'
      '    L.DATA_SECAGEM,'
      '    L.CAUSA_SECAGEM,'
      '    L.APLICADO_PROTOCOLO_SECAGEM,'
      '    L.PG305,'
      '    L.PG365,'
      '    L.PP305,'
      '    L.PP365,'
      '    L.EQA_GORDURA,'
      '    L.EQA_PROTEINA,'
      '    L.ULTIMA_PESAGEMLEITE, '
      '    L.INTERVALO_SECAGEM'
      'FROM ZOO_LACTACOES L'
      
        'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS E ON E.KZOO_EVENTO_ZOOTECNICO ' +
        '= L.KZOO_EVENTO_ZOOTECNICO'
      'WHERE L.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'
      'ORDER BY L.NL DESC')
    Left = 62
    Top = 141
    object sqlLactacoesKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlLactacoesKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      Required = True
      FixedChar = True
    end
    object sqlLactacoesKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlLactacoesKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlLactacoesNL: TIntegerField
      FieldName = 'NL'
      Required = True
    end
    object sqlLactacoesDATALACTACAO: TSQLTimeStampField
      FieldName = 'DATALACTACAO'
      ReadOnly = True
      Required = True
    end
    object sqlLactacoesABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object sqlLactacoesDEL: TIntegerField
      FieldName = 'DEL'
      ReadOnly = True
    end
    object sqlLactacoesPRODUCAO_MEDIA: TFloatField
      FieldName = 'PRODUCAO_MEDIA'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesPRODUCAO_PICO: TFloatField
      FieldName = 'PRODUCAO_PICO'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesLEITE_305D: TFloatField
      FieldName = 'PL305'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesPGT: TFloatField
      FieldName = 'PGT'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesPPT: TFloatField
      FieldName = 'PPT'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesPLT: TFloatField
      FieldName = 'PLT'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesOBS_SECAGEM: TMemoField
      FieldName = 'OBS_SECAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object sqlLactacoesIEP_MESES: TIntegerField
      DisplayLabel = 'IEP'
      FieldName = 'IEP_MESES'
      ReadOnly = True
    end
    object sqlLactacoesDEL_PICO: TIntegerField
      FieldName = 'DEL_PICO'
      ReadOnly = True
    end
    object sqlLactacoesMAX_ORDENHAS_DIA: TIntegerField
      DisplayLabel = 'Max. ordenhas dia'
      FieldName = 'MAX_ORDENHAS_DIA'
      ReadOnly = True
    end
    object sqlLactacoesPL365: TFloatField
      FieldName = 'PL365'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesEQA_LEITE: TFloatField
      FieldName = 'EQA_LEITE'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesDESVIO_EQA_LEITE: TFloatField
      FieldName = 'DESVIO_EQA_LEITE'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesDATA_SECAGEM: TSQLTimeStampField
      FieldName = 'DATA_SECAGEM'
    end
    object sqlLactacoesCAUSA_SECAGEM: TIntegerField
      FieldName = 'CAUSA_SECAGEM'
    end
    object sqlLactacoesAPLICADO_PROTOCOLO_SECAGEM: TStringField
      FieldName = 'APLICADO_PROTOCOLO_SECAGEM'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object sqlLactacoesPG305: TFloatField
      FieldName = 'PG305'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesPG365: TFloatField
      FieldName = 'PG365'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesPP305: TFloatField
      FieldName = 'PP305'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesPP365: TFloatField
      FieldName = 'PP365'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesEQA_GORDURA: TFloatField
      FieldName = 'EQA_GORDURA'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesEQA_PROTEINA: TFloatField
      FieldName = 'EQA_PROTEINA'
      ReadOnly = True
      DisplayFormat = '#,0'
    end
    object sqlLactacoesULTIMA_PESAGEMLEITE: TSQLTimeStampField
      FieldName = 'ULTIMA_PESAGEMLEITE'
      ReadOnly = True
    end
    object sqlLactacoesINTERVALO_SECAGEM: TIntegerField
      FieldName = 'INTERVALO_SECAGEM'
    end
  end
  object sqlPesagemLeite: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LACTACAO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'SELECT  '
      '    P.KZOO_PESAGEM_LEITE,'
      '    P.KCAD_FAZENDA,'
      '    P.KZOO_LACTACAO,'
      '    P.KZOO_ANIMAL_FEMEA,'
      '    P.DATALACTACAO,'
      '    P.DATA,'
      '    P.DEL, '
      '    P.ORD1, '
      '    P.ORD2, '
      '    P.ORD3, '
      '    P.TOTAL, '
      '    P.VARIACAO,'
      '    P.OBSERVACAO,'
      '    P.LOTE,'
      '    P.ANIMAL_DOENTE'
      'FROM ZOO_PESAGEM_LEITE P'
      
        'LEFT JOIN ZOO_LOTEPESAGEM_LEITE L ON L.KZOO_LOTEPESAGEM_LEITE = ' +
        'P.KZOO_LOTEPESAGEM_LEITE'
      'WHERE P.KZOO_LACTACAO = :KZOO_LACTACAO'
      'AND ( P.KZOO_LOTEPESAGEM_LEITE IS NULL OR L.PROCESSADO = '#39'T'#39' )'
      'ORDER BY P.DATA')
    Left = 201
    Top = 141
    object sqlPesagemLeiteKZOO_PESAGEM_LEITE: TStringField
      FieldName = 'KZOO_PESAGEM_LEITE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlPesagemLeiteKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlPesagemLeiteKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object sqlPesagemLeiteKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlPesagemLeiteDATALACTACAO: TSQLTimeStampField
      FieldName = 'DATALACTACAO'
      Required = True
    end
    object sqlPesagemLeiteDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlPesagemLeiteDEL: TIntegerField
      FieldName = 'DEL'
      ProviderFlags = [pfInWhere]
    end
    object sqlPesagemLeiteORD1: TFloatField
      FieldName = 'ORD1'
      DisplayFormat = '#,0.00'
    end
    object sqlPesagemLeiteORD2: TFloatField
      FieldName = 'ORD2'
      DisplayFormat = '#,0.00'
    end
    object sqlPesagemLeiteORD3: TFloatField
      FieldName = 'ORD3'
      DisplayFormat = '#,0.00'
    end
    object sqlPesagemLeiteTOTAL: TFloatField
      FieldName = 'TOTAL'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.00'
    end
    object sqlPesagemLeiteVARIACAO: TFloatField
      FieldName = 'VARIACAO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '+0.00%;-0.00%;0.00%'
    end
    object sqlPesagemLeiteOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlPesagemLeiteLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlPesagemLeiteANIMAL_DOENTE: TStringField
      FieldName = 'ANIMAL_DOENTE'
      FixedChar = True
      Size = 1
    end
  end
  object dtsSQLLactacoes: TDataSource
    DataSet = sqlLactacoes
    Left = 99
    Top = 185
  end
  object sqlAnalises: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LACTACAO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'SELECT  '
      ' KZOO_LACTACAO, '
      ' KZOO_PESAGEM_LEITE,'
      ' DATA, '
      ' GORDURA, '
      ' PROTEINA, '
      ' LACTOSE, '
      ' SOLIDOS_TOTAIS, '
      ' ESD, '
      ' CCS, '
      ' UREIA'
      'FROM ZOO_PESAGEM_LEITE_ANALISE A'
      'WHERE a.KZOO_LACTACAO = :KZOO_LACTACAO'
      'ORDER BY A.DATA')
    Left = 346
    Top = 137
    object sqlAnalisesKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAnalisesKZOO_PESAGEM_LEITE: TStringField
      FieldName = 'KZOO_PESAGEM_LEITE'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAnalisesDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object sqlAnalisesGORDURA: TFloatField
      DisplayLabel = '% G'
      FieldName = 'GORDURA'
      DisplayFormat = '#,0.00;; '
    end
    object sqlAnalisesPROTEINA: TFloatField
      DisplayLabel = '% P'
      FieldName = 'PROTEINA'
      DisplayFormat = '#,0.00;; '
    end
    object sqlAnalisesLACTOSE: TFloatField
      DisplayLabel = '% L'
      FieldName = 'LACTOSE'
      DisplayFormat = '#,0.00;; '
    end
    object sqlAnalisesSOLIDOS_TOTAIS: TFloatField
      DisplayLabel = '% ST'
      FieldName = 'SOLIDOS_TOTAIS'
      DisplayFormat = '#,0.00;; '
    end
    object sqlAnalisesESD: TFloatField
      DisplayLabel = '% ESD'
      FieldName = 'ESD'
      DisplayFormat = '#,0.00;; '
    end
    object sqlAnalisesCCS: TIntegerField
      FieldName = 'CCS'
      DisplayFormat = '#,0;; '
    end
    object sqlAnalisesUREIA: TFloatField
      DisplayLabel = 'NU'
      FieldName = 'UREIA'
      DisplayFormat = '#,0.00;; '
    end
  end
  object cdsAnalises: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'MASTER_SOURCE'
        Fields = 'KZOO_LACTACAO'
      end>
    IndexName = 'MASTER_SOURCE'
    MasterFields = 'KZOO_LACTACAO'
    MasterSource = dtsLactacoes
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LACTACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnalises'
    StoreDefs = True
    Left = 344
    Top = 52
    object cdsAnalisesKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAnalisesKZOO_PESAGEM_LEITE: TStringField
      FieldName = 'KZOO_PESAGEM_LEITE'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAnalisesDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsAnalisesGORDURA: TFloatField
      DisplayLabel = '% G'
      FieldName = 'GORDURA'
      DisplayFormat = '#,0.00;; '
    end
    object cdsAnalisesPROTEINA: TFloatField
      DisplayLabel = '% P'
      FieldName = 'PROTEINA'
      DisplayFormat = '#,0.00;; '
    end
    object cdsAnalisesLACTOSE: TFloatField
      DisplayLabel = '% L'
      FieldName = 'LACTOSE'
      DisplayFormat = '#,0.00;; '
    end
    object cdsAnalisesSOLIDOS_TOTAIS: TFloatField
      DisplayLabel = '% ST'
      FieldName = 'SOLIDOS_TOTAIS'
      DisplayFormat = '#,0.00;; '
    end
    object cdsAnalisesESD: TFloatField
      DisplayLabel = '% E'
      FieldName = 'ESD'
      DisplayFormat = '#,0.00;; '
    end
    object cdsAnalisesCCS: TIntegerField
      FieldName = 'CCS'
      DisplayFormat = '#,0;; '
    end
    object cdsAnalisesUREIA: TFloatField
      DisplayLabel = 'NU'
      FieldName = 'UREIA'
      DisplayFormat = '#,0.00;; '
    end
  end
  object dspLactacoes: TDataSetProvider
    DataSet = sqlLactacoes
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 16
    Top = 98
  end
  object cdsStatusGestacao: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 499
    Top = 51
    object cdsStatusGestacaoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusGestacaoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusGestacaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsStatusGestacaoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsMotivoSecagem: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 500
    Top = 108
    object cdsMotivoSecagemTIPO: TStringField
      FieldName = 'TIPO'
      Size = 31
    end
    object cdsMotivoSecagemVALOR: TStringField
      FieldName = 'VALOR'
      Size = 31
    end
    object cdsMotivoSecagemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 31
    end
    object cdsMotivoSecagemORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object dspAnalises: TDataSetProvider
    DataSet = sqlAnalises
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 299
    Top = 105
  end
  object dtsLactacoes: TDataSource
    DataSet = cdsLactacoes
    Left = 108
    Top = 4
  end
  object dspPesagemLeite: TDataSetProvider
    DataSet = sqlPesagemLeite
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 144
    Top = 100
  end
end
