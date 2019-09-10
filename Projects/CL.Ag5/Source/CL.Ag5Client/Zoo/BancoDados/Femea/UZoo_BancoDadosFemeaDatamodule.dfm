object Zoo_BancoDadosFemeaDatamodule: TZoo_BancoDadosFemeaDatamodule
  OldCreateOrder = True
  Height = 478
  Width = 707
  object cdsLstFemeas: TClientDataSet
    Aggregates = <>
    Filtered = True
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
    ProviderName = 'dspLstFemeas'
    BeforeOpen = cdsLstFemeasBeforeOpen
    OnNewRecord = cdsLstFemeasNewRecord
    Left = 55
    Top = 44
    object cdsLstFemeasKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object cdsLstFemeasBRINCO: TStringField
      FieldName = 'BRINCO'
      Visible = False
      Size = 15
    end
    object cdsLstFemeasPADBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO_'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsLstFemeasPADBRINCOGetText
      Size = 16
    end
    object cdsLstFemeasNOMEESTABULO: TStringField
      DisplayLabel = 'Nome de est'#225'bulo'
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsLstFemeasNOMECOMPLETO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object cdsLstFemeasNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
    end
    object cdsLstFemeasGRAUSANGUE: TStringField
      DisplayLabel = 'Grau de sangue'
      FieldName = 'GRAUSANGUE'
      Size = 5
    end
    object cdsLstFemeasCOMPOSICAORACA: TStringField
      DisplayLabel = 'Composicao ra'#231'a'
      FieldName = 'COMPOSICAORACA'
      Size = 32
    end
    object cdsLstFemeasREGISTRO: TStringField
      DisplayLabel = 'No Reg'
      FieldName = 'REGISTRO'
    end
    object cdsLstFemeasSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Visible = False
    end
    object cdsLstFemeasDESCR_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusAnimal
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 31
      Lookup = True
    end
    object cdsLstFemeasDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
      Visible = False
    end
    object cdsLstFemeasDESCR_DOADOR_RECEPTOR: TStringField
      DisplayLabel = 'TE.'
      FieldKind = fkLookup
      FieldName = 'DESCR_DOADOR_RECEPTOR'
      LookupDataSet = cdsTipoDoadorReceptor
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'DOADOR_RECEPTOR'
      Size = 31
      Lookup = True
    end
    object cdsLstFemeasSISBOV: TStringField
      FieldName = 'SISBOV'
    end
    object cdsLstFemeasDATA: TSQLTimeStampField
      DisplayLabel = 'Dt. descarte'
      FieldName = 'DATA'
    end
    object cdsLstFemeasMOTIVO: TIntegerField
      FieldName = 'MOTIVO'
      Visible = False
    end
    object cdsLstFemeasDESCR_MOTIVO: TStringField
      DisplayLabel = 'Motivo descarte'
      FieldKind = fkLookup
      FieldName = 'DESCR_MOTIVO'
      LookupDataSet = cdsTipoMotivoDescarte
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'MOTIVO'
      Size = 31
      Lookup = True
    end
    object cdsLstFemeasRAZAO: TIntegerField
      FieldName = 'RAZAO'
      Visible = False
    end
    object cdsLstFemeasDESCR_RAZAO: TStringField
      DisplayLabel = 'Raz'#227'o descarte'
      FieldKind = fkLookup
      FieldName = 'DESCR_RAZAO'
      LookupDataSet = cdsTipoRazaoDescarte
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'RAZAO'
      Size = 31
      Lookup = True
    end
    object cdsLstFemeasSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstFemeasSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object cdsLstFemeasSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstFemeasSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object cdsAnimal: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KZOO_ANIMAL'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KCAD_FAZENDA'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BRINCO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOMEESTABULO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOMECOMPLETO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REGISTRO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DTORIGEM'
        DataType = ftTimeStamp
      end
      item
        Name = 'LOCAL_ORIGEM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PRECO_COMPRA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'RACA'
        DataType = ftInteger
      end
      item
        Name = 'VACA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'STATUS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CRIADOR'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CIDCRIA'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PERSISTE'
        DataType = ftInteger
      end
      item
        Name = 'POTENCIAL'
        DataType = ftInteger
      end
      item
        Name = 'SISBOV'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'GRAUSANGUE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'COMPOSICAORACA'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'ORIGINADO_DE_EMBRIAO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ANIMAL_DE_TERCEIRO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'sqlDescartes'
        DataType = ftDataSet
      end
      item
        Name = 'sqlLinhagem'
        DataType = ftDataSet
      end
      item
        Name = 'sqlDadosFemea'
        DataType = ftDataSet
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnimal'
    StoreDefs = True
    BeforeInsert = cdsAnimalBeforeInsert
    BeforeEdit = cdsAnimalBeforeEdit
    BeforePost = cdsAnimalBeforePost
    OnNewRecord = cdsAnimalNewRecord
    Left = 183
    Top = 44
    object cdsAnimalKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAnimalKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsAnimalBRINCO: TStringField
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
    object cdsAnimalVACA: TStringField
      FieldName = 'VACA'
      Size = 8
    end
    object cdsAnimalSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
      OnChange = cdsAnimalSTATUSChange
      OnValidate = cdsAnimalSTATUSValidate
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
    object cdsAnimalDESCR_STATUS: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusAnimal
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 31
      Lookup = True
    end
    object cdsAnimalIDADE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'IDADE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsAnimalSISBOV: TStringField
      FieldName = 'SISBOV'
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
    object cdsAnimalsqlDadosFemea: TDataSetField
      DisplayLabel = 'Dados f'#234'mea'
      FieldName = 'sqlDadosFemea'
    end
    object cdsAnimalsqlDescartes: TDataSetField
      DisplayLabel = 'Descartes'
      FieldName = 'sqlDescartes'
    end
    object cdsAnimalsqlLinhagem: TDataSetField
      DisplayLabel = 'Linhagem'
      FieldName = 'sqlLinhagem'
    end
    object cdsAnimalORIGINADO_DE_EMBRIAO: TStringField
      FieldName = 'ORIGINADO_DE_EMBRIAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAnimalANIMAL_DE_TERCEIRO: TStringField
      FieldName = 'ANIMAL_DE_TERCEIRO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspLstFemeas: TDataSetProvider
    DataSet = sqlLstFemeas
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object dspAnimal: TDataSetProvider
    DataSet = sqlAnimal
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspAnimalAfterUpdateRecord
    BeforeUpdateRecord = dspAnimalBeforeUpdateRecord
    Left = 143
    Top = 89
  end
  object sqlLstFemeas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  A.KZOO_ANIMAL,'#13#10'  A.BRINCO,'#13#10'  A.BRINCO_,'#13#10'  A.NOMECO' +
      'MPLETO, '#13#10'  A.NOMEESTABULO, '#13#10'  F.NASCIMENTO,'#13#10'  A.GRAUSANGUE,'#13#10 +
      '  A.COMPOSICAORACA,'#13#10'  A.REGISTRO, '#13#10'  A.STATUS,'#13#10'  F.DOADOR_REC' +
      'EPTOR,'#13#10'  A.SISBOV,'#13#10'  D.DATA, '#13#10'  D.MOTIVO, '#13#10'  D.RAZAO,'#13#10'  F.S' +
      'YS$UI, '#13#10'  F.SYS$DI, '#13#10'  F.SYS$UU,'#13#10'  F.SYS$DU'#13#10'FROM ZOO_ANIMAIS' +
      '_FEMEA F'#13#10'LEFT JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = F.KZOO_ANIM' +
      'AL_FEMEA'#13#10'LEFT JOIN ZOO_ANIMAL_DESCARTES D ON D.KZOO_ANIMAL = A.' +
      'KZOO_ANIMAL'#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA'#13#10' AND ( :LISTALL' +
      ' = '#39'T'#39' OR  A.KZOO_ANIMAL = :KZOO_ANIMAL )'#13#10'ORDER BY 3'
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
    Left = 62
    Top = 137
    object sqlLstFemeasKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object sqlLstFemeasBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlLstFemeasBRINCO_: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO_'
      ProviderFlags = [pfInWhere]
      Size = 16
    end
    object sqlLstFemeasNOMECOMPLETO: TStringField
      DisplayLabel = 'Nome completo'
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object sqlLstFemeasNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object sqlLstFemeasNASCIMENTO: TSQLTimeStampField
      DisplayLabel = 'Nascimento'
      FieldName = 'NASCIMENTO'
    end
    object sqlLstFemeasGRAUSANGUE: TStringField
      DisplayLabel = 'Grau de sangue'
      FieldName = 'GRAUSANGUE'
      Size = 5
    end
    object sqlLstFemeasCOMPOSICAORACA: TStringField
      DisplayLabel = 'Composi'#231#227'o ra'#231'a'
      FieldName = 'COMPOSICAORACA'
      Size = 32
    end
    object sqlLstFemeasREGISTRO: TStringField
      DisplayLabel = 'No Reg'
      FieldName = 'REGISTRO'
    end
    object sqlLstFemeasSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Visible = False
    end
    object sqlLstFemeasDOADOR_RECEPTOR: TIntegerField
      DisplayLabel = 'TE'
      FieldName = 'DOADOR_RECEPTOR'
    end
    object sqlLstFemeasSISBOV: TStringField
      FieldName = 'SISBOV'
    end
    object sqlLstFemeasDATA: TSQLTimeStampField
      DisplayLabel = 'Dt. descarte'
      FieldName = 'DATA'
    end
    object sqlLstFemeasMOTIVO: TIntegerField
      DisplayLabel = 'Motivo'
      FieldName = 'MOTIVO'
      Visible = False
    end
    object sqlLstFemeasRAZAO: TIntegerField
      DisplayLabel = 'Raz'#227'o'
      FieldName = 'RAZAO'
      Visible = False
    end
    object sqlLstFemeasSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstFemeasSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object sqlLstFemeasSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstFemeasSYSDU: TSQLTimeStampField
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
      '  LOCAL_ORIGEM, '#13#10'   PRECO_COMPRA, '#13#10'   RACA, '#13#10'  VACA, '#13#10'  STAT' +
      'US, '#13#10'  CRIADOR, '#13#10'  CIDCRIA, '#13#10'  PERSISTE, '#13#10'  POTENCIAL,'#13#10'  SI' +
      'SBOV, '#13#10'  GRAUSANGUE,'#13#10'  COMPOSICAORACA,'#13#10' ORIGINADO_DE_EMBRIAO,' +
      #13#10'  ANIMAL_DE_TERCEIRO'#13#10'FROM ZOO_ANIMAIS'#13#10'WHERE KZOO_ANIMAL = :K' +
      'ZOO_ANIMAL'
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
    object sqlAnimalVACA: TStringField
      FieldName = 'VACA'
      Size = 8
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
    object sqlAnimalSISBOV: TStringField
      FieldName = 'SISBOV'
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
    object sqlAnimalORIGINADO_DE_EMBRIAO: TStringField
      FieldName = 'ORIGINADO_DE_EMBRIAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAnimalANIMAL_DE_TERCEIRO: TStringField
      FieldName = 'ANIMAL_DE_TERCEIRO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstFemeas
    Left = 120
    Top = 8
  end
  object sqlDadosFemea: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' AF.KZOO_ANIMAL_FEMEA,'#13#10' AF.DOADOR_RECEPTOR,'#13#10' AF.RETIR' +
      'O,'#13#10' AF.LOTE,'#13#10' AF.VLOTE1,'#13#10' AF.VLOTE2,'#13#10' AF.VLOTE3,'#13#10' AF.NASCIM' +
      'ENTO,'#13#10' AF.INTENCAO_DESCARTE,'#13#10' AF.SCL,'#13#10' '#39'F'#39' EMBRIAO,'#13#10'AF.KCRES' +
      'CIMENTO_NASCIMENTO'#13#10'FROM ZOO_ANIMAIS_FEMEA AF'#13#10'WHERE KZOO_ANIMAL' +
      '_FEMEA = :KZOO_ANIMAL'
    DataSource = dtsSQLAnimal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 256
    Top = 132
    object sqlDadosFemeaKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDadosFemeaDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
    end
    object sqlDadosFemeaRETIRO: TStringField
      FieldName = 'RETIRO'
      FixedChar = True
      Size = 32
    end
    object sqlDadosFemeaLOTE: TStringField
      FieldName = 'LOTE'
      Size = 32
    end
    object sqlDadosFemeaVLOTE1: TStringField
      FieldName = 'VLOTE1'
      Size = 32
    end
    object sqlDadosFemeaVLOTE2: TStringField
      FieldName = 'VLOTE2'
      Size = 32
    end
    object sqlDadosFemeaVLOTE3: TStringField
      FieldName = 'VLOTE3'
      Size = 32
    end
    object sqlDadosFemeaNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object sqlDadosFemeaINTENCAO_DESCARTE: TStringField
      FieldName = 'INTENCAO_DESCARTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlDadosFemeaSCL: TStringField
      FieldName = 'SCL'
      Size = 32
    end
    object sqlDadosFemeaEMBRIAO: TStringField
      FieldName = 'EMBRIAO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlDadosFemeaKCRESCIMENTO_NASCIMENTO: TStringField
      FieldName = 'KCRESCIMENTO_NASCIMENTO'
      FixedChar = True
    end
  end
  object dtsSQLAnimal: TDataSource
    DataSet = sqlAnimal
    Left = 219
    Top = 179
  end
  object cdsDadosFemea: TClientDataSet
    Aggregates = <>
    DataSetField = cdsAnimalsqlDadosFemea
    Params = <>
    BeforeInsert = cdsDadosFemeaBeforeInsert
    OnCalcFields = cdsDadosFemeaCalcFields
    OnNewRecord = cdsDadosFemeaNewRecord
    Left = 254
    Top = 45
    object cdsDadosFemeaKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsDadosFemeaDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
    end
    object cdsDadosFemeaDESCR_DOADOR_RECEPTOR: TStringField
      DisplayLabel = 'Animal doador/receptor'
      FieldKind = fkLookup
      FieldName = 'DESCR_DOADOR_RECEPTOR'
      LookupDataSet = cdsTipoDoadorReceptor
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'DOADOR_RECEPTOR'
      Size = 31
      Lookup = True
    end
    object cdsDadosFemeaRETIRO: TStringField
      FieldName = 'RETIRO'
      FixedChar = True
      Size = 32
    end
    object cdsDadosFemeaLOTE: TStringField
      FieldName = 'LOTE'
      Size = 32
    end
    object cdsDadosFemeaVLOTE1: TStringField
      FieldName = 'VLOTE1'
      Size = 32
    end
    object cdsDadosFemeaVLOTE2: TStringField
      FieldName = 'VLOTE2'
      Size = 32
    end
    object cdsDadosFemeaVLOTE3: TStringField
      FieldName = 'VLOTE3'
      Size = 32
    end
    object cdsDadosFemeaNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Required = True
      OnChange = cdsDadosFemeaNASCIMENTOChange
      OnValidate = cdsDadosFemeaNASCIMENTOValidate
    end
    object cdsDadosFemeaIDADE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'IDADE'
      Size = 5
    end
    object cdsDadosFemeaINTENCAO_DESCARTE: TStringField
      FieldName = 'INTENCAO_DESCARTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDadosFemeaSCL: TStringField
      FieldName = 'SCL'
      Size = 32
    end
    object cdsDadosFemeaEMBRIAO: TStringField
      FieldName = 'EMBRIAO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object cdsDadosFemeasqlCrescimento: TDataSetField
      FieldName = 'sqlCrescimento'
    end
    object cdsDadosFemeaKCRESCIMENTO_NASCIMENTO: TStringField
      FieldName = 'KCRESCIMENTO_NASCIMENTO'
      FixedChar = True
    end
  end
  object cdsStatusAnimal: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    OnFilterRecord = cdsStatusAnimalFilterRecord
    Left = 587
    Top = 79
    object cdsStatusAnimalTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object dtsSQLDadosFemea: TDataSource
    DataSet = sqlDadosFemea
    Left = 324
    Top = 184
  end
  object cdsTipoPartoAborto: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 587
    Top = 31
    object cdsTipoPartoAbortoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoORDEM: TIntegerField
      FieldName = 'ORDEM'
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
    Left = 588
    Top = 127
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
  object sqlLinhagem: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select  '#13#10'  KZOO_ANIMAL_LINHAGEM, '#13#10'  KZOO_ANIMAL,'#13#10'  KZOO_ANIMA' +
      'L_MACHO,'#13#10'  NOMEPAI,'#13#10'  GRAUSANGUEPAI, '#13#10'  COMPOSICAORACAPAI,'#13#10' ' +
      ' KZOO_ANIMAL_FEMEA,'#13#10'  NOMEMAE,'#13#10'  GRAUSANGUEMAE, '#13#10'  COMPOSICAO' +
      'RACAMAE,'#13#10'  SEXO,'#13#10'  NATIMORTO,'#13#10'  NASCIMENTO,'#13#10'  KZOO_EVENTO_ZO' +
      'OTECNICO'#13#10'from ZOO_ANIMAL_LINHAGEM'#13#10'WHERE KZOO_ANIMAL = :KZOO_AN' +
      'IMAL'
    DataSource = dtsSQLAnimal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 328
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
    object sqlLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      FixedChar = True
    end
    object sqlLinhagemSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object sqlLinhagemNATIMORTO: TStringField
      FieldName = 'NATIMORTO'
      FixedChar = True
      Size = 1
    end
    object sqlLinhagemNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
    end
  end
  object cdsLinhagem: TClientDataSet
    Aggregates = <>
    DataSetField = cdsAnimalsqlLinhagem
    Params = <>
    BeforeInsert = cdsLinhagemBeforeInsert
    OnCalcFields = cdsLinhagemCalcFields
    OnNewRecord = cdsLinhagemNewRecord
    Left = 331
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
    object cdsLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      FixedChar = True
    end
    object cdsLinhagemSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object cdsLinhagemNATIMORTO: TStringField
      FieldName = 'NATIMORTO'
      FixedChar = True
      Size = 1
    end
    object cdsLinhagemNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
    end
  end
  object cdsTipoDoadorReceptor: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 588
    Top = 179
    object cdsTipoDoadorReceptorTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoDoadorReceptorVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoDoadorReceptorDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoDoadorReceptorORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsDescartes: TClientDataSet
    Aggregates = <>
    DataSetField = cdsAnimalsqlDescartes
    Params = <>
    BeforePost = cdsDescartesBeforePost
    AfterPost = cdsDescartesAfterPost
    Left = 401
    Top = 46
    object cdsDescartesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsDescartesKCAD_COMPRADOR: TStringField
      FieldName = 'KCAD_COMPRADOR'
      FixedChar = True
    end
    object cdsDescartesDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object cdsDescartesRAZAO: TIntegerField
      FieldName = 'RAZAO'
      ProviderFlags = [pfInWhere]
    end
    object cdsDescartesMOTIVO: TIntegerField
      FieldName = 'MOTIVO'
    end
    object cdsDescartesNOMECOMPRADOR: TStringField
      FieldName = 'NOMECOMPRADOR'
      Size = 128
    end
    object cdsDescartesDESCR_RAZAO: TStringField
      DisplayLabel = 'Raz'#227'o descarte'
      FieldKind = fkLookup
      FieldName = 'DESCR_RAZAO'
      LookupDataSet = cdsTipoRazaoDescarte
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'RAZAO'
      Size = 31
      Lookup = True
    end
    object cdsDescartesDESCR_MOTIVO: TStringField
      DisplayLabel = 'Motivo descarte'
      FieldKind = fkLookup
      FieldName = 'DESCR_MOTIVO'
      LookupDataSet = cdsTipoMotivoDescarte
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'MOTIVO'
      Size = 31
      Lookup = True
    end
    object cdsDescartesPRECOVENDA: TFloatField
      FieldName = 'PRECOVENDA'
    end
    object cdsDescartesOBS: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlDescartes: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select  '#13#10'  KZOO_ANIMAL, '#13#10'  KCAD_COMPRADOR, '#13#10'  DATA, '#13#10'  RAZAO' +
      ','#13#10'  MOTIVO, '#13#10'  NOMECOMPRADOR, '#13#10'  PRECOVENDA,'#13#10'  OBS'#13#10'from ZOO' +
      '_ANIMAL_DESCARTES'#13#10'where KZOO_ANIMAL = :KZOO_ANIMAL'
    DataSource = dtsSQLAnimal
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 400
    Top = 131
    object sqlDescartesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDescartesKCAD_COMPRADOR: TStringField
      FieldName = 'KCAD_COMPRADOR'
      FixedChar = True
    end
    object sqlDescartesDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlDescartesRAZAO: TIntegerField
      FieldName = 'RAZAO'
      ProviderFlags = [pfInWhere]
    end
    object sqlDescartesMOTIVO: TIntegerField
      FieldName = 'MOTIVO'
    end
    object sqlDescartesNOMECOMPRADOR: TStringField
      FieldName = 'NOMECOMPRADOR'
      Size = 128
    end
    object sqlDescartesPRECOVENDA: TFloatField
      FieldName = 'PRECOVENDA'
    end
    object sqlDescartesOBS: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsTipoRazaoDescarte: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 592
    Top = 235
    object cdsTipoRazaoDescarteTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoRazaoDescarteVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoRazaoDescarteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoRazaoDescarteORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoMotivoDescarte: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 592
    Top = 295
    object cdsTipoMotivoDescarteTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoMotivoDescarteVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoMotivoDescarteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoMotivoDescarteORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
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
    Left = 596
    Top = 359
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
  object sqlCrescimento: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'select C.KZOO_ANIMAL_CRESCIMENTO, C.KZOO_ANIMAL, C.DATA, C.PESO,' +
      ' C.ALTURA, C.OBSERVACAO, C.GANHOPESO, C.LOTE, C.SYS$UI,'#13#10'       ' +
      'C.SYS$DI, C.SYS$UU, C.SYS$DU'#13#10'from ZOO_ANIMAL_CRESCIMENTO C'#13#10'whe' +
      're C.KZOO_ANIMAL_CRESCIMENTO = :KCRESCIMENTO_NASCIMENTO'
    DataSource = dtsSQLDadosFemea
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCRESCIMENTO_NASCIMENTO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 432
    Top = 228
    object sqlCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_CRESCIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object sqlCrescimentoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
    end
    object sqlCrescimentoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlCrescimentoPESO: TIntegerField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCrescimentoALTURA: TIntegerField
      DisplayLabel = 'Altura'
      FieldName = 'ALTURA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCrescimentoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object sqlCrescimentoGANHOPESO: TFloatField
      FieldName = 'GANHOPESO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCrescimentoLOTE: TStringField
      FieldName = 'LOTE'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object sqlCrescimentoSYSUI: TStringField
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object sqlCrescimentoSYSDI: TSQLTimeStampField
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCrescimentoSYSUU: TStringField
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object sqlCrescimentoSYSDU: TSQLTimeStampField
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsCrescimento: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDadosFemeasqlCrescimento
    Params = <>
    BeforePost = cdsCrescimentoBeforePost
    OnNewRecord = cdsCrescimentoNewRecord
    Left = 476
    Top = 52
    object cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_CRESCIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object cdsCrescimentoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
    end
    object cdsCrescimentoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCrescimentoPESO: TIntegerField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCrescimentoALTURA: TIntegerField
      DisplayLabel = 'Altura'
      FieldName = 'ALTURA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCrescimentoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object cdsCrescimentoGANHOPESO: TFloatField
      FieldName = 'GANHOPESO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCrescimentoLOTE: TStringField
      FieldName = 'LOTE'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object cdsCrescimentoSYSUI: TStringField
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object cdsCrescimentoSYSDI: TSQLTimeStampField
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCrescimentoSYSUU: TStringField
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object cdsCrescimentoSYSDU: TSQLTimeStampField
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInUpdate]
    end
  end
end
