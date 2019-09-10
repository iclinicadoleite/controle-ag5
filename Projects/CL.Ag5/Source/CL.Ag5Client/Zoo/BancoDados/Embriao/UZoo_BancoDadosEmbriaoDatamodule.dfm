object Zoo_BancoDadosEmbriaoDatamodule: TZoo_BancoDadosEmbriaoDatamodule
  OldCreateOrder = True
  Height = 370
  Width = 667
  object cdsLstEmbrioes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LISTALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstEmbrioes'
    BeforeOpen = cdsLstEmbrioesBeforeOpen
    OnNewRecord = cdsLstEmbrioesNewRecord
    Left = 55
    Top = 44
    object cdsLstEmbrioesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object cdsLstEmbrioesCODIGO_EMBRIAO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_EMBRIAO'
      Size = 35
    end
    object cdsLstEmbrioesBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Visible = False
      Size = 15
    end
    object cdsLstEmbrioesPADBRINCO: TStringField
      DisplayLabel = 'C'#243'digo  22222'
      FieldName = 'PADBRINCO'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsLstEmbrioesPADBRINCOGetText
      Size = 18
    end
    object cdsLstEmbrioesNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object cdsLstEmbrioesREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object cdsLstEmbrioesQTDE_EMBRIAO: TIntegerField
      DisplayLabel = 'Qtde estoque'
      FieldName = 'QTDE_EMBRIAO'
      Required = True
    end
    object cdsLstEmbrioesSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstEmbrioesSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object cdsLstEmbrioesSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstEmbrioesSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object cdsAnimal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnimal'
    BeforeInsert = cdsAnimalBeforeInsert
    BeforePost = cdsAnimalBeforePost
    BeforeDelete = cdsAnimalBeforeDelete
    OnNewRecord = cdsAnimalNewRecord
    Left = 183
    Top = 44
    object cdsAnimalKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsAnimalKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsAnimalBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Required = True
      OnValidate = cdsAnimalBRINCOValidate
      Size = 15
    end
    object cdsAnimalNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsAnimalNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      OnSetText = cdsAnimalNOMECOMPLETOSetText
      Size = 60
    end
    object cdsAnimalREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object cdsAnimalDTORIGEM: TSQLTimeStampField
      FieldName = 'DTORIGEM'
      OnValidate = cdsAnimalDTORIGEMValidate
    end
    object cdsAnimalLOCAL_ORIGEM: TStringField
      FieldName = 'LOCAL_ORIGEM'
    end
    object cdsAnimalPRECO_COMPRA: TFMTBCDField
      FieldName = 'PRECO_COMPRA'
      Precision = 15
      Size = 2
    end
    object cdsAnimalDESCR_RACA: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_RACA'
      LookupDataSet = cdsTipoRacasAnimais
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'RACA'
      Size = 31
      Lookup = True
    end
    object cdsAnimalRACA: TIntegerField
      FieldName = 'RACA'
    end
    object cdsAnimalSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object cdsAnimalCRIADOR: TStringField
      FieldName = 'CRIADOR'
      Size = 40
    end
    object cdsAnimalCIDCRIA: TStringField
      FieldName = 'CIDCRIA'
      Size = 25
    end
    object cdsAnimalPERSISTE: TIntegerField
      FieldName = 'PERSISTE'
    end
    object cdsAnimalPOTENCIAL: TIntegerField
      FieldName = 'POTENCIAL'
    end
    object cdsAnimalGRAUSANGUE: TStringField
      FieldName = 'GRAUSANGUE'
      OnSetText = cdsAnimalGRAUSANGUESetText
      OnValidate = cdsAnimalGRAUSANGUEValidate
      FixedChar = True
      Size = 5
    end
    object cdsAnimalCOMPOSICAORACA: TStringField
      FieldName = 'COMPOSICAORACA'
      OnValidate = cdsAnimalCOMPOSICAORACAValidate
      Size = 32
    end
    object cdsAnimalsqlDadosEmbriao: TDataSetField
      DisplayLabel = 'Dados embri'#227'o'
      FieldName = 'sqlDadosEmbriao'
    end
    object cdsAnimalsqlLinhagem: TDataSetField
      DisplayLabel = 'Linhagem'
      FieldName = 'sqlLinhagem'
    end
  end
  object dspLstEmbrioes: TDataSetProvider
    DataSet = sqlLstEmbrioes
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object dspAnimal: TDataSetProvider
    DataSet = sqlAnimal
    Options = [poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 89
  end
  object sqlLstEmbrioes: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  A.KZOO_ANIMAL,'#13#10'  M.CODIGO_EMBRIAO,'#13#10'  A.BRINCO,'#13#10'  I' +
      'IF ( TRIM ( A.BRINCO ) SIMILAR TO '#39'[0-9]+'#39', '#39'000'#39', CAST ( ascii_' +
      'val( TRIM ( A.BRINCO ) ) AS CHAR ( 3 ) ) ) || LPAD ( TRIM ( A.BR' +
      'INCO ), 15, '#39' '#39' ) PADBRINCO,'#13#10'  A.NOMECOMPLETO, '#13#10'  A.REGISTRO,'#13 +
      #10'  M.QTDE_EMBRIAO,'#13#10'  A.SYS$UI, '#13#10'  A.SYS$DI, '#13#10'  A.SYS$UU,'#13#10'  A' +
      '.SYS$DU'#13#10'FROM ZOO_ANIMAIS_EMBRIAO M'#13#10'LEFT JOIN ZOO_ANIMAIS A ON ' +
      'A.KZOO_ANIMAL = M.KZOO_ANIMAL_EMBRIAO'#13#10'WHERE A.KCAD_FAZENDA = :K' +
      'CAD_FAZENDA'#13#10' AND ( :LISTALL = '#39'T'#39' OR  A.KZOO_ANIMAL = :KZOO_ANI' +
      'MAL )'#13#10'ORDER BY 3'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LISTALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 58
    Top = 133
    object sqlLstEmbrioesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object sqlLstEmbrioesCODIGO_EMBRIAO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_EMBRIAO'
      Size = 35
    end
    object sqlLstEmbrioesBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlLstEmbrioesPADBRINCO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PADBRINCO'
      ProviderFlags = [pfInWhere]
      Size = 18
    end
    object sqlLstEmbrioesNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object sqlLstEmbrioesREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object sqlLstEmbrioesQTDE_EMBRIAO: TIntegerField
      DisplayLabel = 'Qtde estoque'
      FieldName = 'QTDE_EMBRIAO'
      Required = True
    end
    object sqlLstEmbrioesSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstEmbrioesSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object sqlLstEmbrioesSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstEmbrioesSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object sqlAnimal: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'   KZOO_ANIMAL, '#13#10'   KCAD_FAZENDA, '#13#10'   BRINCO, '#13#10'   NO' +
      'MEESTABULO, '#13#10'   NOMECOMPLETO, '#13#10'   REGISTRO, '#13#10'   DTORIGEM, '#13#10' ' +
      '  LOCAL_ORIGEM, '#13#10'   PRECO_COMPRA, '#13#10'   RACA, '#13#10'   STATUS, '#13#10'   ' +
      'CRIADOR, '#13#10'   CIDCRIA, '#13#10'   PERSISTE, '#13#10'   POTENCIAL, '#13#10'   GRAUS' +
      'ANGUE, '#13#10'   COMPOSICAORACA'#13#10'FROM ZOO_ANIMAIS'#13#10'WHERE KZOO_ANIMAL ' +
      '= :KZOO_ANIMAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 178
    Top = 132
    object sqlAnimalKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlAnimalKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlAnimalBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlAnimalNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object sqlAnimalNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object sqlAnimalREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object sqlAnimalDTORIGEM: TSQLTimeStampField
      FieldName = 'DTORIGEM'
    end
    object sqlAnimalLOCAL_ORIGEM: TStringField
      FieldName = 'LOCAL_ORIGEM'
    end
    object sqlAnimalPRECO_COMPRA: TFMTBCDField
      FieldName = 'PRECO_COMPRA'
      Precision = 15
      Size = 2
    end
    object sqlAnimalRACA: TIntegerField
      FieldName = 'RACA'
    end
    object sqlAnimalSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object sqlAnimalCRIADOR: TStringField
      FieldName = 'CRIADOR'
      Size = 40
    end
    object sqlAnimalCIDCRIA: TStringField
      FieldName = 'CIDCRIA'
      Size = 25
    end
    object sqlAnimalPERSISTE: TIntegerField
      FieldName = 'PERSISTE'
    end
    object sqlAnimalPOTENCIAL: TIntegerField
      FieldName = 'POTENCIAL'
    end
    object sqlAnimalGRAUSANGUE: TStringField
      FieldName = 'GRAUSANGUE'
      FixedChar = True
      Size = 5
    end
    object sqlAnimalCOMPOSICAORACA: TStringField
      FieldName = 'COMPOSICAORACA'
      Size = 32
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstEmbrioes
    Left = 120
    Top = 8
  end
  object sqlDadosEmbriao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' KZOO_ANIMAL_EMBRIAO,'#13#10'CODIGO_EMBRIAO,'#13#10' QTDEINICIAL_EM' +
      'BRIAO, '#13#10' QTDEUTILIZADA_EMBRIAO,'#13#10' QTDE_EMBRIAO'#13#10'FROM ZOO_ANIMAI' +
      'S_EMBRIAO'#13#10'WHERE KZOO_ANIMAL_EMBRIAO = :KZOO_ANIMAL'
    DataSource = dtsSQLAnimal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 272
    Top = 132
    object sqlDadosEmbriaoKZOO_ANIMAL_EMBRIAO: TStringField
      FieldName = 'KZOO_ANIMAL_EMBRIAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDadosEmbriaoQTDE_EMBRIAO: TIntegerField
      FieldName = 'QTDE_EMBRIAO'
      Required = True
    end
    object sqlDadosEmbriaoQTDEINICIAL_EMBRIAO: TIntegerField
      FieldName = 'QTDEINICIAL_EMBRIAO'
      Required = True
    end
    object sqlDadosEmbriaoQTDEUTILIZADA_EMBRIAO: TIntegerField
      FieldName = 'QTDEUTILIZADA_EMBRIAO'
      Required = True
    end
    object sqlDadosEmbriaoCODIGO_EMBRIAO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_EMBRIAO'
      Required = True
      Size = 35
    end
  end
  object dtsSQLAnimal: TDataSource
    DataSet = sqlAnimal
    Left = 219
    Top = 179
  end
  object cdsDadosEmbriao: TClientDataSet
    Aggregates = <>
    DataSetField = cdsAnimalsqlDadosEmbriao
    Params = <>
    BeforeInsert = cdsDadosEmbriaoBeforeInsert
    OnCalcFields = cdsDadosEmbriaoCalcFields
    OnNewRecord = cdsDadosEmbriaoNewRecord
    Left = 270
    Top = 45
    object cdsDadosEmbriaoKZOO_ANIMAL_EMBRIAO: TStringField
      FieldName = 'KZOO_ANIMAL_EMBRIAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsDadosEmbriaoCODIGO_EMBRIAO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_EMBRIAO'
      Required = True
      Size = 35
    end
    object cdsDadosEmbriaoQTDE_EMBRIAO: TIntegerField
      FieldName = 'QTDE_EMBRIAO'
      Required = True
    end
    object cdsDadosEmbriaoQTDEINICIAL_EMBRIAO: TIntegerField
      FieldName = 'QTDEINICIAL_EMBRIAO'
      Required = True
    end
    object cdsDadosEmbriaoQTDEUTILIZADA_EMBRIAO: TIntegerField
      FieldName = 'QTDEUTILIZADA_EMBRIAO'
      Required = True
    end
    object cdsDadosEmbriaoTmpCalc: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'TmpCalc'
      Calculated = True
    end
  end
  object cdsTipoRacasAnimais: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 559
    Top = 16
    object cdsTipoRacasAnimaisTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoRacasAnimaisVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoRacasAnimaisDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoRacasAnimaisORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object dtsSQLDadosEmbriao: TDataSource
    DataSet = sqlDadosEmbriao
    Left = 356
    Top = 184
  end
  object cdsTipoComposicaoRaca: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 559
    Top = 95
    object cdsTipoComposicaoRacaTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoComposicaoRacaVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoComposicaoRacaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoComposicaoRacaORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object sqlLinhagem: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select  '#13#10'  KZOO_ANIMAL_LINHAGEM, '#13#10'  KZOO_ANIMAL,'#13#10'  KZOO_ANIMA' +
      'L_MACHO,'#13#10'  NOMEPAI,'#13#10'  GRAUSANGUEPAI, '#13#10'  COMPOSICAORACAPAI,'#13#10' ' +
      ' KZOO_ANIMAL_FEMEA,'#13#10'  NOMEMAE,'#13#10'  GRAUSANGUEMAE, '#13#10'  COMPOSICAO' +
      'RACAMAE'#13#10'from ZOO_ANIMAL_LINHAGEM'#13#10'WHERE KZOO_ANIMAL = :KZOO_ANI' +
      'MAL'
    DataSource = dtsSQLAnimal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 352
    Top = 132
    object sqlLinhagemKZOO_ANIMAL_LINHAGEM: TStringField
      FieldName = 'KZOO_ANIMAL_LINHAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLinhagemKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlLinhagemKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      FixedChar = True
    end
    object sqlLinhagemNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 60
    end
    object sqlLinhagemKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      FixedChar = True
    end
    object sqlLinhagemNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 60
    end
    object sqlLinhagemGRAUSANGUEPAI: TStringField
      FieldName = 'GRAUSANGUEPAI'
      FixedChar = True
      Size = 5
    end
    object sqlLinhagemCOMPOSICAORACAPAI: TStringField
      FieldName = 'COMPOSICAORACAPAI'
      Size = 32
    end
    object sqlLinhagemGRAUSANGUEMAE: TStringField
      FieldName = 'GRAUSANGUEMAE'
      FixedChar = True
      Size = 5
    end
    object sqlLinhagemCOMPOSICAORACAMAE: TStringField
      FieldName = 'COMPOSICAORACAMAE'
      Size = 32
    end
  end
  object cdsLinhagem: TClientDataSet
    Aggregates = <>
    DataSetField = cdsAnimalsqlLinhagem
    Params = <>
    BeforeInsert = cdsLinhagemBeforeInsert
    OnCalcFields = cdsLinhagemCalcFields
    OnNewRecord = cdsLinhagemNewRecord
    Left = 355
    Top = 46
    object cdsLinhagemKZOO_ANIMAL_LINHAGEM: TStringField
      FieldName = 'KZOO_ANIMAL_LINHAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLinhagemKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object cdsLinhagemKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      FixedChar = True
    end
    object cdsLinhagemNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      OnSetText = cdsLinhagemNOMEPAISetText
      Size = 60
    end
    object cdsLinhagemKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      FixedChar = True
    end
    object cdsLinhagemNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      OnSetText = cdsLinhagemNOMEMAESetText
      Size = 60
    end
    object cdsLinhagemGRAUSANGUEPAI: TStringField
      FieldName = 'GRAUSANGUEPAI'
      FixedChar = True
      Size = 5
    end
    object cdsLinhagemCOMPOSICAORACAPAI: TStringField
      FieldName = 'COMPOSICAORACAPAI'
      Size = 32
    end
    object cdsLinhagemGRAUSANGUEMAE: TStringField
      FieldName = 'GRAUSANGUEMAE'
      FixedChar = True
      Size = 5
    end
    object cdsLinhagemCOMPOSICAORACAMAE: TStringField
      FieldName = 'COMPOSICAORACAMAE'
      Size = 32
    end
    object cdsLinhagemGSR_PAI: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'GSR_PAI'
      Size = 30
    end
    object cdsLinhagemGSR_MAE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'GSR_MAE'
      Size = 30
    end
  end
end
