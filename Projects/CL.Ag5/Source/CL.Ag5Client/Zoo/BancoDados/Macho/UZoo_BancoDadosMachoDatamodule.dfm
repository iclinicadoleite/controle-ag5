object Zoo_BancoDadosMachoDatamodule: TZoo_BancoDadosMachoDatamodule
  OldCreateOrder = True
  Height = 345
  Width = 1004
  object cdsLstMachos: TClientDataSet
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
    ProviderName = 'dspLstMachos'
    BeforeOpen = cdsLstMachosBeforeOpen
    OnNewRecord = cdsLstMachosNewRecord
    Left = 55
    Top = 44
    object cdsLstMachosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object cdsLstMachosBRINCO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'BRINCO'
      Visible = False
      Size = 15
    end
    object cdsLstMachosBRINCO_: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'BRINCO_'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsLstMachosBRINCO_GetText
      Size = 16
    end
    object cdsLstMachosNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsLstMachosNOMECOMPLETO: TStringField
      DisplayLabel = 'Nome completo'
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object cdsLstMachosREGISTRO: TStringField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object cdsLstMachosDESCR_STATUS: TStringField
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
    object cdsLstMachosQTDE_SEMEN: TIntegerField
      DisplayLabel = 'Qtde estoque'
      FieldName = 'QTDE_SEMEN'
      Required = True
    end
    object cdsLstMachosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsLstMachosSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Visible = False
    end
    object cdsLstMachosINSEMINACOES: TIntegerField
      DisplayLabel = 'Insemina'#231#245'es/Montas'
      FieldName = 'INSEMINACOES'
    end
    object cdsLstMachosPRENHEZES: TIntegerField
      DisplayLabel = 'Prenhezes'
      FieldName = 'PRENHEZES'
    end
    object cdsLstMachosLACTACOES: TIntegerField
      DisplayLabel = 'Lacta'#231#245'es'
      FieldName = 'LACTACOES'
    end
    object cdsLstMachosSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstMachosSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object cdsLstMachosSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstMachosSYSDU: TSQLTimeStampField
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
      DisplayLabel = 'C'#243'digo'
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
    object cdsAnimalORIGINADO_DE_EMBRIAO: TStringField
      FieldName = 'ORIGINADO_DE_EMBRIAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAnimalsqlDadosMacho: TDataSetField
      DisplayLabel = 'Dados macho'
      FieldName = 'sqlDadosMacho'
    end
    object cdsAnimalsqlLinhagem: TDataSetField
      DisplayLabel = 'Linhagem'
      FieldName = 'sqlLinhagem'
    end
    object cdsAnimalsqlSanidade: TDataSetField
      DisplayLabel = 'Sanidade'
      FieldName = 'sqlSanidade'
    end
    object cdsAnimalsqlCompras: TDataSetField
      DisplayLabel = 'Estoque'
      FieldName = 'sqlCompras'
    end
    object cdsAnimalsqlCrescimento: TDataSetField
      DisplayLabel = 'Crescimento'
      FieldName = 'sqlCrescimento'
    end
    object cdsAnimalsqlDescartes: TDataSetField
      FieldName = 'sqlDescartes'
    end
    object cdsAnimalANIMAL_DE_TERCEIRO: TStringField
      FieldName = 'ANIMAL_DE_TERCEIRO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstMachos
    Left = 120
    Top = 8
  end
  object cdsDadosMacho: TClientDataSet
    Aggregates = <>
    DataSetField = cdsAnimalsqlDadosMacho
    Params = <>
    BeforeInsert = cdsDadosMachoBeforeInsert
    BeforeEdit = cdsDadosMachoBeforeEdit
    OnCalcFields = cdsDadosMachoCalcFields
    Left = 270
    Top = 45
    object cdsDadosMachoKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsDadosMachoNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      OnValidate = cdsDadosMachoNASCIMENTOValidate
    end
    object cdsDadosMachoIDADE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'IDADE'
      OnGetText = cdsDadosMachoIDADEGetText
    end
    object cdsDadosMachoQTDE_SEMEN: TIntegerField
      FieldName = 'QTDE_SEMEN'
      Required = True
    end
    object cdsDadosMachoQTDEINICIAL_SEMEN: TIntegerField
      FieldName = 'QTDEINICIAL_SEMEN'
      Required = True
    end
    object cdsDadosMachoQTDECOMPRADA_SEMEN: TIntegerField
      FieldName = 'QTDECOMPRADA_SEMEN'
      Required = True
    end
    object cdsDadosMachoQTDEUTILIZADA_SEMEN: TIntegerField
      FieldName = 'QTDEUTILIZADA_SEMEN'
      Required = True
    end
    object cdsDadosMachoDS_BOTIJAO: TStringField
      DisplayLabel = 'Botij'#227'o'
      FieldName = 'DS_BOTIJAO'
      Size = 15
    end
    object cdsDadosMachoDS_CANECA: TStringField
      DisplayLabel = 'Caneca'
      FieldName = 'DS_CANECA'
      Size = 15
    end
    object cdsDadosMachoDS_CONCEPCAO: TIntegerField
      DisplayLabel = 'Concep'#231#227'o'
      FieldName = 'DS_CONCEPCAO'
    end
    object cdsDadosMachoDS_FACILIDADEPARTO: TFloatField
      DisplayLabel = '%Facilidade parto'
      FieldName = 'DS_FACILIDADEPARTO'
    end
    object cdsDadosMachoDS_HACK: TStringField
      DisplayLabel = 'Hack'
      FieldName = 'DS_HACK'
      Size = 15
    end
    object cdsDadosMachoDS_LEITE: TIntegerField
      DisplayLabel = 'Leite'
      FieldName = 'DS_LEITE'
    end
    object cdsDadosMachoDS_PERNAPE: TFloatField
      DisplayLabel = 'Perna e p'#233's'
      FieldName = 'DS_PERNAPE'
    end
    object cdsDadosMachoDS_TIPO: TFloatField
      DisplayLabel = 'Tipo'
      FieldName = 'DS_TIPO'
    end
    object cdsDadosMachoDS_UBERE: TFloatField
      DisplayLabel = #218'bere'
      FieldName = 'DS_UBERE'
    end
    object cdsDadosMachoDS_PROTEINA: TIntegerField
      FieldName = 'DS_PROTEINA'
    end
    object cdsDadosMachoDS_GORDURA: TIntegerField
      FieldName = 'DS_GORDURA'
    end
    object cdsDadosMachoDS_ATIVO: TStringField
      FieldName = 'DS_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDadosMachoRETIRO: TStringField
      FieldName = 'RETIRO'
      Size = 32
    end
    object cdsDadosMachoDATARETIRO: TSQLTimeStampField
      FieldName = 'DATARETIRO'
    end
    object cdsDadosMachoLOTE: TStringField
      FieldName = 'LOTE'
      Size = 32
    end
    object cdsDadosMachoDATALOTE: TSQLTimeStampField
      FieldName = 'DATALOTE'
    end
  end
  object dspLstMachos: TDataSetProvider
    DataSet = sqlLstMachos
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object dspAnimal: TDataSetProvider
    DataSet = sqlAnimal
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspAnimalBeforeUpdateRecord
    Left = 143
    Top = 89
  end
  object sqlLstMachos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  A.KZOO_ANIMAL,'#13#10'  A.BRINCO,'#13#10'  BRINCO_,'#13#10'  A.NOMEESTA' +
      'BULO, '#13#10'  A.NOMECOMPLETO, '#13#10'  A.REGISTRO,'#13#10'  A.STATUS,'#13#10'  M.QTDE' +
      '_SEMEN,'#13#10'  IIF ( ( D.DATA IS NULL ) AND (M.DS_ATIVO = '#39'T'#39'), '#39'T'#39',' +
      ' '#39'F'#39') ATIVO,'#13#10'  (SELECT COUNT(*) FROM ZOO_EVENTOS_ZOOTECNICOS E ' +
      'WHERE E.KZOO_ANIMAL_MACHO = M.KZOO_ANIMAL_MACHO) INSEMINACOES,'#13#10 +
      '  (SELECT COUNT(*) FROM ZOO_EVENTOS_ZOOTECNICOS E WHERE E.KZOO_A' +
      'NIMAL_MACHO = M.KZOO_ANIMAL_MACHO AND E.PRENHEZ = '#39'T'#39') PRENHEZES' +
      ','#13#10'  (SELECT COUNT(*) FROM ZOO_EVENTOS_ZOOTECNICOS E WHERE E.KZO' +
      'O_ANIMAL_MACHO = M.KZOO_ANIMAL_MACHO AND ABORTOPARTO > 1) LACTAC' +
      'OES,'#13#10'  A.SYS$UI, '#13#10'  A.SYS$DI, '#13#10'  A.SYS$UU,'#13#10'  A.SYS$DU'#13#10'FROM ' +
      'ZOO_ANIMAIS_MACHO M'#13#10'LEFT JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = ' +
      'M.KZOO_ANIMAL_MACHO'#13#10'LEFT JOIN ZOO_ANIMAL_DESCARTES D ON D.KZOO_' +
      'ANIMAL = M.KZOO_ANIMAL_MACHO'#13#10'WHERE A.KCAD_FAZENDA = :KCAD_FAZEN' +
      'DA'#13#10' AND ( :LISTALL = '#39'T'#39' OR  A.KZOO_ANIMAL = :KZOO_ANIMAL )'#13#10'OR' +
      'DER BY 3'
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
    object sqlLstMachosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object sqlLstMachosBRINCO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlLstMachosBRINCO_: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'BRINCO_'
      ProviderFlags = [pfInWhere]
      Size = 16
    end
    object sqlLstMachosNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object sqlLstMachosNOMECOMPLETO: TStringField
      DisplayLabel = 'Nome completo'
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object sqlLstMachosREGISTRO: TStringField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object sqlLstMachosSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Visible = False
    end
    object sqlLstMachosQTDE_SEMEN: TIntegerField
      DisplayLabel = 'Qtde estoque'
      FieldName = 'QTDE_SEMEN'
      Required = True
    end
    object sqlLstMachosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlLstMachosINSEMINACOES: TIntegerField
      DisplayLabel = 'Insemina'#231#245'es/Montas'
      FieldName = 'INSEMINACOES'
    end
    object sqlLstMachosPRENHEZES: TIntegerField
      DisplayLabel = 'Prenhezes'
      FieldName = 'PRENHEZES'
    end
    object sqlLstMachosLACTACOES: TIntegerField
      DisplayLabel = 'Lacta'#231#245'es'
      FieldName = 'LACTACOES'
    end
    object sqlLstMachosSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstMachosSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object sqlLstMachosSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstMachosSYSDU: TSQLTimeStampField
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
      '  LOCAL_ORIGEM, '#13#10'   PRECO_COMPRA, '#13#10'   RACA,   STATUS, '#13#10'  CRIA' +
      'DOR, '#13#10'  CIDCRIA, '#13#10'  PERSISTE, '#13#10'  POTENCIAL, '#13#10'  GRAUSANGUE, '#13 +
      #10'  COMPOSICAORACA,'#13#10' ORIGINADO_DE_EMBRIAO,'#13#10'  ANIMAL_DE_TERCEIRO' +
      #13#10'FROM ZOO_ANIMAIS'#13#10'WHERE KZOO_ANIMAL = :KZOO_ANIMAL'
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
  object sqlDadosMacho: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  KZOO_ANIMAL_MACHO, '#13#10'  NASCIMENTO,'#13#10'  QTDEINICIAL_SEM' +
      'EN, '#13#10'  QTDECOMPRADA_SEMEN, '#13#10'  QTDEUTILIZADA_SEMEN,'#13#10'  QTDE_SEM' +
      'EN,'#13#10'  DS_BOTIJAO, '#13#10'  DS_CANECA, '#13#10'  DS_CONCEPCAO, '#13#10'  DS_FACIL' +
      'IDADEPARTO, '#13#10'  DS_HACK, '#13#10'  DS_LEITE, '#13#10'  DS_PERNAPE, '#13#10'  DS_TI' +
      'PO, '#13#10'  DS_UBERE,'#13#10'  DS_PROTEINA,'#13#10'  DS_GORDURA,'#13#10'  DS_ATIVO,'#13#10' ' +
      ' RETIRO,'#13#10'  DATARETIRO,'#13#10'  LOTE,'#13#10'  DATALOTE'#13#10'FROM ZOO_ANIMAIS_M' +
      'ACHO'#13#10'WHERE KZOO_ANIMAL_MACHO = :KZOO_ANIMAL'
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
    object sqlDadosMachoKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDadosMachoNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
    end
    object sqlDadosMachoQTDE_SEMEN: TIntegerField
      FieldName = 'QTDE_SEMEN'
      Required = True
    end
    object sqlDadosMachoQTDEINICIAL_SEMEN: TIntegerField
      FieldName = 'QTDEINICIAL_SEMEN'
      Required = True
    end
    object sqlDadosMachoQTDECOMPRADA_SEMEN: TIntegerField
      FieldName = 'QTDECOMPRADA_SEMEN'
      Required = True
    end
    object sqlDadosMachoQTDEUTILIZADA_SEMEN: TIntegerField
      FieldName = 'QTDEUTILIZADA_SEMEN'
      Required = True
    end
    object sqlDadosMachoDS_BOTIJAO: TStringField
      DisplayLabel = 'Botij'#227'o'
      FieldName = 'DS_BOTIJAO'
      Size = 15
    end
    object sqlDadosMachoDS_CANECA: TStringField
      DisplayLabel = 'Caneca'
      FieldName = 'DS_CANECA'
      Size = 15
    end
    object sqlDadosMachoDS_CONCEPCAO: TIntegerField
      DisplayLabel = 'Concep'#231#227'o'
      FieldName = 'DS_CONCEPCAO'
    end
    object sqlDadosMachoDS_FACILIDADEPARTO: TFloatField
      DisplayLabel = '%Facilidade parto'
      FieldName = 'DS_FACILIDADEPARTO'
    end
    object sqlDadosMachoDS_HACK: TStringField
      DisplayLabel = 'Hack'
      FieldName = 'DS_HACK'
      Size = 15
    end
    object sqlDadosMachoDS_LEITE: TIntegerField
      DisplayLabel = 'Leite'
      FieldName = 'DS_LEITE'
    end
    object sqlDadosMachoDS_PERNAPE: TFloatField
      DisplayLabel = 'Perna e p'#233's'
      FieldName = 'DS_PERNAPE'
    end
    object sqlDadosMachoDS_TIPO: TFloatField
      DisplayLabel = 'Tipo'
      FieldName = 'DS_TIPO'
    end
    object sqlDadosMachoDS_UBERE: TFloatField
      DisplayLabel = #218'bere'
      FieldName = 'DS_UBERE'
    end
    object sqlDadosMachoDS_PROTEINA: TIntegerField
      FieldName = 'DS_PROTEINA'
    end
    object sqlDadosMachoDS_GORDURA: TIntegerField
      FieldName = 'DS_GORDURA'
    end
    object sqlDadosMachoDS_ATIVO: TStringField
      FieldName = 'DS_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlDadosMachoRETIRO: TStringField
      FieldName = 'RETIRO'
      Size = 32
    end
    object sqlDadosMachoDATARETIRO: TSQLTimeStampField
      FieldName = 'DATARETIRO'
    end
    object sqlDadosMachoLOTE: TStringField
      FieldName = 'LOTE'
      Size = 32
    end
    object sqlDadosMachoDATALOTE: TSQLTimeStampField
      FieldName = 'DATALOTE'
    end
  end
  object dtsSQLAnimal: TDataSource
    DataSet = sqlAnimal
    Left = 219
    Top = 179
  end
  object dtsSQLDadosMacho: TDataSource
    Left = 356
    Top = 184
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
    Left = 749
    Top = 80
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
    Left = 746
    Top = 28
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
    object sqlLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      FixedChar = True
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
    object cdsLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      FixedChar = True
    end
  end
  object sqlCrescimento: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select '#13#10'  KZOO_ANIMAL_CRESCIMENTO,'#13#10'  KZOO_ANIMAL, '#13#10'  DATA, '#13#10 +
      '  PESO,'#13#10'  ALTURA, '#13#10'  GANHOPESO, '#13#10'  OBSERVACAO '#13#10'from ZOO_ANIM' +
      'AL_CRESCIMENTO'#13#10'WHERE KZOO_ANIMAL = :KZOO_ANIMAL'#13#10'ORDER BY DATA'
    DataSource = dtsSQLAnimal
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 428
    Top = 132
    object sqlCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_CRESCIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlCrescimentoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      FixedChar = True
    end
    object sqlCrescimentoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlCrescimentoPESO: TIntegerField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object sqlCrescimentoALTURA: TIntegerField
      DisplayLabel = 'Altura'
      FieldName = 'ALTURA'
    end
    object sqlCrescimentoGANHOPESO: TFloatField
      DisplayLabel = 'Ganho peso'
      FieldName = 'GANHOPESO'
      ProviderFlags = [pfInWhere]
    end
    object sqlCrescimentoOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlCompras: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select  '#13#10'  KZOO_ANIMAL_SEMEN_COMPRA, '#13#10'  KZOO_ANIMAL_MACHO,'#13#10'  ' +
      'DATA, '#13#10'  DOSES, '#13#10'  VALORDOSE'#13#10'from ZOO_ANIMAL_SEMEN_COMPRA'#13#10'WH' +
      'ERE  KZOO_ANIMAL_MACHO = :KZOO_ANIMAL'
    DataSource = dtsSQLAnimal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 572
    Top = 132
    object sqlComprasKZOO_ANIMAL_SEMEN_COMPRA: TStringField
      FieldName = 'KZOO_ANIMAL_SEMEN_COMPRA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlComprasKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      FixedChar = True
    end
    object sqlComprasDATA: TSQLTimeStampField
      DisplayLabel = 'Data da compra'
      FieldName = 'DATA'
      Required = True
    end
    object sqlComprasDOSES: TIntegerField
      DisplayLabel = 'N'#176' de doses compradas'
      FieldName = 'DOSES'
    end
    object sqlComprasVALORDOSE: TFloatField
      DisplayLabel = 'Valor / dose (R$)'
      FieldName = 'VALORDOSE'
    end
  end
  object sqlSanidade: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select  '#13#10'  KZOO_ANIMAL_MACHO_SANIDADE,'#13#10'  KZOO_ANIMAL_MACHO, '#13#10 +
      '  DATA, '#13#10'  OCORRENCIA'#13#10'from ZOO_ANIMAL_MACHO_SANIDADE'#13#10'WHERE KZ' +
      'OO_ANIMAL_MACHO = :KZOO_ANIMAL'
    DataSource = dtsSQLAnimal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 505
    Top = 132
    object sqlSanidadeKZOO_ANIMAL_MACHO_SANIDADE: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO_SANIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlSanidadeKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      FixedChar = True
    end
    object sqlSanidadeDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlSanidadeOCORRENCIA: TStringField
      DisplayLabel = 'Ocorr'#234'ncia'
      FieldName = 'OCORRENCIA'
      Size = 128
    end
  end
  object cdsCrescimento: TClientDataSet
    Aggregates = <>
    DataSetField = cdsAnimalsqlCrescimento
    Params = <>
    BeforePost = cdsCrescimentoBeforePost
    OnCalcFields = cdsCrescimentoCalcFields
    OnNewRecord = cdsCrescimentoNewRecord
    Left = 428
    Top = 46
    object cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_CRESCIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsCrescimentoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsCrescimentoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
      OnChange = cdsCrescimentoDATAChange
      OnValidate = cdsCrescimentoDATAValidate
    end
    object cdsCrescimentoPESO: TIntegerField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
      OnValidate = cdsCrescimentoPESOValidate
    end
    object cdsCrescimentoALTURA: TIntegerField
      DisplayLabel = 'Altura'
      FieldName = 'ALTURA'
      OnValidate = cdsCrescimentoALTURAValidate
    end
    object cdsCrescimentoIDADE: TIntegerField
      DisplayLabel = 'Idade'
      FieldKind = fkCalculated
      FieldName = 'IDADE'
      Calculated = True
    end
    object cdsCrescimentoGANHOPESO: TFloatField
      DisplayLabel = 'Ganho peso'
      FieldName = 'GANHOPESO'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.00'
    end
    object cdsCrescimentoOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsSanidade: TClientDataSet
    Aggregates = <>
    DataSetField = cdsAnimalsqlSanidade
    Params = <>
    BeforePost = cdsSanidadeBeforePost
    OnNewRecord = cdsSanidadeNewRecord
    Left = 505
    Top = 45
    object cdsSanidadeKZOO_ANIMAL_MACHO_SANIDADE: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO_SANIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsSanidadeKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsSanidadeDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
      OnValidate = cdsSanidadeDATAValidate
    end
    object cdsSanidadeOCORRENCIA: TStringField
      DisplayLabel = 'Ocorr'#234'ncia'
      FieldName = 'OCORRENCIA'
      Required = True
      Size = 128
    end
  end
  object cdsCompras: TClientDataSet
    Aggregates = <>
    DataSetField = cdsAnimalsqlCompras
    Params = <>
    OnNewRecord = cdsComprasNewRecord
    Left = 572
    Top = 45
    object cdsComprasKZOO_ANIMAL_SEMEN_COMPRA: TStringField
      FieldName = 'KZOO_ANIMAL_SEMEN_COMPRA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsComprasKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsComprasDATA: TSQLTimeStampField
      DisplayLabel = 'Data da compra'
      FieldName = 'DATA'
      Required = True
    end
    object cdsComprasDOSES: TIntegerField
      DisplayLabel = 'N'#176' de doses compradas'
      FieldName = 'DOSES'
    end
    object cdsComprasVALORDOSE: TFloatField
      DisplayLabel = 'Valor / dose (R$)'
      FieldName = 'VALORDOSE'
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
    Left = 752
    Top = 139
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
  object cdsDescartes: TClientDataSet
    Aggregates = <>
    DataSetField = cdsAnimalsqlDescartes
    Params = <>
    BeforePost = cdsDescartesBeforePost
    AfterPost = cdsDescartesAfterPost
    Left = 644
    Top = 47
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
  end
  object sqlDescartes: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select  '#13#10'  KZOO_ANIMAL, '#13#10'  KCAD_COMPRADOR, '#13#10'  DATA, '#13#10'  RAZAO' +
      ','#13#10'  MOTIVO, '#13#10'  NOMECOMPRADOR, '#13#10'  PRECOVENDA'#13#10'from ZOO_ANIMAL_' +
      'DESCARTES'#13#10'where KZOO_ANIMAL = :KZOO_ANIMAL'
    DataSource = dtsSQLAnimal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 643
    Top = 132
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
    Left = 752
    Top = 191
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
    Left = 752
    Top = 247
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
end
