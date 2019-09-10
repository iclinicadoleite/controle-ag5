object Zoo_ProducaoSecagemDatamodule: TZoo_ProducaoSecagemDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsSecagens: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VL'
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
      end>
    ProviderName = 'dspSecagens'
    OnNewRecord = cdsSecagensNewRecord
    Left = 78
    Top = 12
    object cdsSecagensKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsSecagensBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      OnValidate = cdsSecagensBRINCOValidate
      Size = 15
    end
    object cdsSecagensBRINCO_: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO_'
      ProviderFlags = []
      Visible = False
      Size = 16
    end
    object cdsSecagensNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object cdsSecagensKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      FixedChar = True
    end
    object cdsSecagensCAUSA_SECAGEM: TIntegerField
      FieldName = 'CAUSA_SECAGEM'
    end
    object cdsSecagensDESCR_CAUSA: TStringField
      DisplayLabel = 'Causa'
      FieldKind = fkLookup
      FieldName = 'DESCR_CAUSA'
      LookupDataSet = cdsMotivoSecagem
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CAUSA_SECAGEM'
      Size = 32
      Lookup = True
    end
    object cdsSecagensDATA_SECAGEM: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA_SECAGEM'
      OnValidate = cdsSecagensDATA_SECAGEMValidate
    end
    object cdsSecagensOBS_SECAGEM: TMemoField
      DisplayLabel = 'Obs.'
      FieldName = 'OBS_SECAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsSecagensAPLICADO_PROTOCOLO_SECAGEM: TStringField
      DisplayLabel = 'Aplicar Protocolo'
      FieldName = 'APLICADO_PROTOCOLO_SECAGEM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSecagensULTIMA_PESAGEMLEITE: TSQLTimeStampField
      FieldName = 'ULTIMA_PESAGEMLEITE'
    end
    object cdsSecagensDATAABORTOPARTO: TSQLTimeStampField
      FieldName = 'DATAABORTOPARTO'
    end
    object cdsSecagensDESCR_PROTOCOLO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'DESCR_PROTOCOLO'
      Size = 128
    end
  end
  object dspSecagens: TDataSetProvider
    DataSet = sqlSecagens
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspSecagensBeforeUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlSecagens: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  F.KZOO_ANIMAL_FEMEA, '#13#10'  A.BRINCO, '#13#10'  A.BRINCO_, '#13#10'  ' +
      'COALESCE ( A.NOMEESTABULO, A.NOMECOMPLETO ) NOME,'#13#10'  L.KZOO_LACT' +
      'ACAO,'#13#10'  L.DATA_SECAGEM,'#13#10'  L.CAUSA_SECAGEM,'#13#10'  APLICADO_PROTOCO' +
      'LO_SECAGEM,'#13#10'  L.OBS_SECAGEM,'#13#10'  L.ULTIMA_PESAGEMLEITE,'#13#10'  E.DAT' +
      'AABORTOPARTO'#13#10'FROM ZOO_ANIMAIS_FEMEA F'#13#10'INNER JOIN ZOO_ANIMAIS A' +
      ' on A.KZOO_ANIMAL = F.KZOO_ANIMAL_FEMEA'#13#10'INNER JOIN ZOO_LACTACOE' +
      'S L ON L.KZOO_LACTACAO = F.KULTIMA_LACTACAO'#13#10'INNER JOIN ZOO_EVEN' +
      'TOS_ZOOTECNICOS E ON E.KZOO_EVENTO_ZOOTECNICO = L.KZOO_EVENTO_ZO' +
      'OTECNICO'#13#10'WHERE A.KCAD_FAZENDA = :KCAD_FAZENDA'#13#10'  AND A.STATUS =' +
      ' :VL'#13#10'  AND ( ( SELECT EZ.PRENHEZ FROM ZOO_EVENTOS_ZOOTECNICOS E' +
      'Z'#13#10'          WHERE EZ.KZOO_EVENTO_ZOOTECNICO = F.KULTIMA_MONTA'#13#10 +
      '            AND EZ.DATAABORTOPARTO IS NULL'#13#10'         ) IS NOT DI' +
      'STINCT FROM '#39'T'#39' )'#13#10'  AND ( F.ULTIMA_LACTACAO IS NULL OR ( F.ULTI' +
      'MA_MONTA > F.ULTIMA_LACTACAO ) )'#13#10'  AND (    (( F.NUMERO_LACTACA' +
      'O  > 1 ) AND ( DATEADD( :DIASMULTIPARA DAY TO F.ULTIMA_MONTA ) <' +
      '= :DATA ))'#13#10'        OR (( F.NUMERO_LACTACAO <= 1 ) AND ( DATEADD' +
      '( :DIASPRIMIPARA DAY TO F.ULTIMA_MONTA ) <= :DATA ))'#13#10'       )'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VL'
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
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlSecagensKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlSecagensBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlSecagensBRINCO_: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO_'
      ProviderFlags = []
      Size = 16
    end
    object sqlSecagensNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object sqlSecagensKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      FixedChar = True
    end
    object sqlSecagensDATA_SECAGEM: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA_SECAGEM'
    end
    object sqlSecagensCAUSA_SECAGEM: TIntegerField
      FieldName = 'CAUSA_SECAGEM'
    end
    object sqlSecagensOBS_SECAGEM: TMemoField
      DisplayLabel = 'Obs.'
      FieldName = 'OBS_SECAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object sqlSecagensAPLICADO_PROTOCOLO_SECAGEM: TStringField
      DisplayLabel = 'Aplicar Protocolo'
      FieldName = 'APLICADO_PROTOCOLO_SECAGEM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlSecagensULTIMA_PESAGEMLEITE: TSQLTimeStampField
      FieldName = 'ULTIMA_PESAGEMLEITE'
    end
    object sqlSecagensDATAABORTOPARTO: TSQLTimeStampField
      FieldName = 'DATAABORTOPARTO'
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
    Left = 384
    Top = 24
    object cdsMotivoSecagemTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsMotivoSecagemVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsMotivoSecagemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsMotivoSecagemORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsListaProtocolos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 268
    Top = 111
  end
  object cdsProtocolosSecagem: TClientDataSet
    PersistDataPacket.Data = {
      A80000009619E0BD010000001800000005000000000003000000A8000853454C
      45435445440400010000000000114B5A4F4F5F414E494D414C5F46454D454101
      004900000001000557494454480200020014000E4B5A4F4F5F50524F544F434F
      4C4F010049000000010005574944544802000200140006434F4449474F010049
      0000000100055749445448020002002000044E4F4D4501004900000001000557
      494454480200020080000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'SELECTED'
        DataType = ftInteger
      end
      item
        Name = 'KZOO_ANIMAL_FEMEA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_PROTOCOLO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 128
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 163
    object cdsProtocolosSecagemSELECTED: TIntegerField
      DisplayLabel = 'Selecionado'
      FieldName = 'SELECTED'
    end
    object cdsProtocolosSecagemKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object cdsProtocolosSecagemKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
    end
    object cdsProtocolosSecagemCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsProtocolosSecagemNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsProtocolosSecagemSOMA_SELECTED: TAggregateField
      FieldName = 'SOMA_SELECTED'
      Active = True
      DisplayName = ''
      Expression = 'SUM(SELECTED)'
    end
  end
end
