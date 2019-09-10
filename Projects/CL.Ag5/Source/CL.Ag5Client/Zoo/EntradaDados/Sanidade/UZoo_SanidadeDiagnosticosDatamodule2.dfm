object Zoo_SanidadeDiagnosticosDatamodule: TZoo_SanidadeDiagnosticosDatamodule
  OldCreateOrder = True
  Height = 320
  Width = 865
  object cdsDiagnosticosAAplicar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDiagnosticosAAplicar'
    BeforePost = cdsDiagnosticosAAplicarBeforePost
    Left = 88
    Top = 60
    object cdsDiagnosticosAAplicarKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsDiagnosticosAAplicarBRINCO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsDiagnosticosAAplicarNOMEESTABULO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsDiagnosticosAAplicarKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsDiagnosticosAAplicarKZOO_DIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldName = 'KZOO_DIAGNOSTICO'
      OnValidate = cdsDiagnosticosAAplicarKZOO_DIAGNOSTICOValidate
      FixedChar = True
    end
    object cdsDiagnosticosAAplicarDIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldKind = fkLookup
      FieldName = 'DIAGNOSTICO'
      LookupDataSet = cdsDiagnosticosDisponiveis
      LookupKeyFields = 'KZOO_DIAGNOSTICO'
      LookupResultField = 'DIAGNOSTICO'
      KeyFields = 'KZOO_DIAGNOSTICO'
      Size = 160
      Lookup = True
    end
    object cdsDiagnosticosAAplicarDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
      OnValidate = cdsDiagnosticosAAplicarDATAValidate
    end
    object cdsDiagnosticosAAplicarQUARTO: TSmallintField
      FieldName = 'QUARTO'
    end
    object cdsDiagnosticosAAplicarDIAGNOSTICO2: TStringField
      DisplayLabel = 'Quarto'
      FieldKind = fkLookup
      FieldName = 'DESC_QUARTO'
      LookupDataSet = cdsTipoQuarto
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'QUARTO'
      Size = 160
      Lookup = True
    end
    object cdsDiagnosticosAAplicarsqlProtocolosAAplicar: TDataSetField
      DisplayLabel = 'Protocolos a aplicar'
      FieldName = 'sqlProtocolosAAplicar'
    end
  end
  object cdsDiagnosticosDisponiveis: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspDiagnosticosDisponiveis'
    Left = 516
    Top = 112
    object cdsDiagnosticosDisponiveisKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsDiagnosticosDisponiveisDIAGNOSTICO: TStringField
      FieldName = 'DIAGNOSTICO'
      Required = True
      Size = 160
    end
    object cdsDiagnosticosDisponiveisPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      Size = 1
    end
  end
  object dspDiagnosticosAplicados: TDataSetProvider
    DataSet = sqlDiagnosticosAplicados
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 297
    Top = 141
  end
  object sqlDiagnosticosDisponiveis: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  KZOO_DIAGNOSTICO,'#13#10'  CODIGO || '#39' - '#39' ||NOME DIAGNOSTI' +
      'CO,'#13#10'  POR_QUARTO'#13#10'FROM ZOO_DIAGNOSTICOS'#13#10'WHERE KCAD_FAZENDA = :' +
      'KCAD_FAZENDA AND ATIVO = '#39'T'#39#13#10'AND TIPODIAGNOSTICO IS NOT NULL'#13#10'A' +
      'ND KDEF_DIAGNOSTICO IS NOT NULL'#13#10'ORDER BY CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 511
    Top = 209
    object sqlDiagnosticosDisponiveisKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosDisponiveisDIAGNOSTICO: TStringField
      FieldName = 'DIAGNOSTICO'
      Required = True
      Size = 160
    end
    object sqlDiagnosticosDisponiveisPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      Size = 1
    end
  end
  object sqlProtocolosAAplicar: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  P.KZOO_PROTOCOLO,'#13#10'  P.CODIGO || '#39' - '#39' || P.NOME PROTO' +
      'COLO'#13#10'FROM ZOO_PROTOCOLOS P'#13#10'WHERE  1=0'
    DataSource = dtsSQLAnimal
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 196
    Top = 159
    object sqlProtocolosAAplicarKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object sqlProtocolosAAplicarPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Size = 163
    end
  end
  object dtsDiagnosticos: TDataSource
    DataSet = sqlDiagnosticosDisponiveis
    Left = 476
    Top = 64
  end
  object cdsProtocolosAAplicar: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDiagnosticosAAplicarsqlProtocolosAAplicar
    Params = <>
    BeforeInsert = cdsProtocolosAAplicarBeforeInsert
    BeforeEdit = cdsProtocolosAAplicarBeforeEdit
    Left = 201
    Top = 61
    object cdsProtocolosAAplicarKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object cdsProtocolosAAplicarPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Size = 163
    end
    object cdsProtocolosAAplicarSELECTED: TSmallintField
      DisplayLabel = 'Aplicar'
      FieldName = 'SELECTED'
      OnGetText = cdsProtocolosAAplicarSELECTEDGetText
    end
    object cdsProtocolosAAplicarTOTSELECTED: TAggregateField
      FieldName = 'TOTSELECTED'
      DisplayName = ''
    end
  end
  object cdsDiagnosticosAplicados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspDiagnosticosAplicados'
    Left = 326
    Top = 84
    object cdsDiagnosticosAplicadosKZOO_ANIMAL_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_ANIMAL_DIAGNOSTICO'
      Required = True
      FixedChar = True
    end
    object cdsDiagnosticosAplicadosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object cdsDiagnosticosAplicadosCOD_PROTOCOLO: TStringField
      DisplayLabel = 'C'#243'digo protocolo'
      FieldName = 'COD_PROTOCOLO'
      Required = True
      Size = 32
    end
    object cdsDiagnosticosAplicadosDATA_PROTOCOLO: TSQLTimeStampField
      DisplayLabel = 'Data protocolo'
      FieldName = 'DATA_PROTOCOLO'
      Required = True
    end
    object cdsDiagnosticosAplicadosNOME_PROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'NOME_PROTOCOLO'
      Required = True
      Size = 128
    end
    object cdsDiagnosticosAplicadosCOD_DIAGNOSTICO: TStringField
      DisplayLabel = 'C'#243'digo diagn'#243'stico'
      FieldName = 'COD_DIAGNOSTICO'
      Size = 32
    end
    object cdsDiagnosticosAplicadosDATA_DIAGNOSTICO: TSQLTimeStampField
      DisplayLabel = 'Data diagn'#243'stico'
      FieldName = 'DATA_DIAGNOSTICO'
    end
    object cdsDiagnosticosAplicadosNOME_DIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldName = 'NOME_DIAGNOSTICO'
      Size = 128
    end
    object cdsDiagnosticosAplicadosDESC_STATUS_DIAGNOSTICO: TStringField
      DisplayLabel = 'Status'
      FieldName = 'DESC_STATUS_DIAGNOSTICO'
      Size = 255
    end
  end
  object dspDiagnosticosAAplicar: TDataSetProvider
    DataSet = sqlDiagnosticosAAplicar
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspDiagnosticosAAplicarBeforeUpdateRecord
    Left = 47
    Top = 113
  end
  object sqlDiagnosticosAAplicar: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  A.KZOO_ANIMAL,  '#13#10'  A.KCAD_FAZENDA,'#13#10'  D.KZOO_DIAGNOS' +
      'TICO,  '#13#10'  D.QUARTO,'#13#10'  D.DATA'#13#10'FROM ZOO_ANIMAL_DIAGNOSTICOS D'#13#10 +
      'LEFT JOIN ZOO_ANIMAIS A ON 1=0'#13#10'WHERE 1=0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 74
    Top = 159
    object sqlDiagnosticosAAplicarKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosAAplicarKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosAAplicarKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosAAplicarQUARTO: TSmallintField
      FieldName = 'QUARTO'
    end
    object sqlDiagnosticosAAplicarDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
  end
  object sqlDiagnosticosAplicados: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DA.KZOO_ANIMAL_DIAGNOSTICO,'#13#10'  DA.KZOO_ANIMAL_FEMEA,'#13#10 +
      '  P.CODIGO COD_PROTOCOLO,'#13#10'  P.DATA DATA_PROTOCOLO,'#13#10'  P.NOME NO' +
      'ME_PROTOCOLO, '#13#10'  DA.DATA DATA_DIAGNOSTICO,'#13#10'  DA.CODIGO || COAL' +
      'ESCE(  '#39' ('#39' ||  STS.SYS$DESCRIPTION ||  '#39')'#39', '#39#39') COD_DIAGNOSTICO' +
      ','#13#10'  DA.NOME || COALESCE( '#39'  no quarto '#39' || STD.SYS$DESCRIPTION,' +
      ' '#39#39') NOME_DIAGNOSTICO ,'#13#10'  ( select SYS$DESCRIPTION from SYS$TYP' +
      'ES_GETDESCRIPTION( '#39'STATUS_DIAGNOSTICO'#39', DA.STATUS )'#13#10'  ) DESC_S' +
      'TATUS_DIAGNOSTICO'#13#10'  FROM ZOO_ANIMAL_DIAGNOSTICOS  DA'#13#10'  LEFT JO' +
      'IN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_DIAGNOSTICO = DA.KZO' +
      'O_ANIMAL_DIAGNOSTICO'#13#10'  LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'TIP' +
      'O_SIGLAQUARTO'#39', DA.QUARTO ) STS ON 1=1'#13#10'  LEFT JOIN SYS$TYPES_GE' +
      'TDESCRIPTION( '#39'TIPO_QUARTO'#39', DA.QUARTO ) STD ON 1=1'#13#10'  WHERE  DA' +
      '.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 324
    Top = 188
    object sqlDiagnosticosAplicadosKZOO_ANIMAL_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_ANIMAL_DIAGNOSTICO'
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosAplicadosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosAplicadosCOD_PROTOCOLO: TStringField
      FieldName = 'COD_PROTOCOLO'
      Required = True
      Size = 32
    end
    object sqlDiagnosticosAplicadosDATA_PROTOCOLO: TSQLTimeStampField
      FieldName = 'DATA_PROTOCOLO'
      Required = True
    end
    object sqlDiagnosticosAplicadosNOME_PROTOCOLO: TStringField
      FieldName = 'NOME_PROTOCOLO'
      Required = True
      Size = 128
    end
    object sqlDiagnosticosAplicadosCOD_DIAGNOSTICO: TStringField
      FieldName = 'COD_DIAGNOSTICO'
      Size = 34
    end
    object sqlDiagnosticosAplicadosDATA_DIAGNOSTICO: TSQLTimeStampField
      FieldName = 'DATA_DIAGNOSTICO'
    end
    object sqlDiagnosticosAplicadosNOME_DIAGNOSTICO: TStringField
      FieldName = 'NOME_DIAGNOSTICO'
      Size = 130
    end
    object sqlDiagnosticosAplicadosDESC_STATUS_DIAGNOSTICO: TStringField
      FieldName = 'DESC_STATUS_DIAGNOSTICO'
      Size = 255
    end
  end
  object dtsSQLAnimal: TDataSource
    DataSet = sqlDiagnosticosAAplicar
    Left = 128
    Top = 210
  end
  object dtsFichaAnimal: TDataSource
    DataSet = cdsDiagnosticosAAplicar
    OnDataChange = dtsFichaAnimalDataChange
    Left = 261
    Top = 16
  end
  object dspDiagnosticosDisponiveis: TDataSetProvider
    DataSet = sqlDiagnosticosDisponiveis
    Left = 452
    Top = 172
  end
  object dspResumoAnimal: TDataSetProvider
    DataSet = sqlResumoAnimal
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 649
    Top = 125
  end
  object cdsResumoAnimal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspResumoAnimal'
    OnCalcFields = cdsResumoAnimalCalcFields
    Left = 678
    Top = 68
    object cdsResumoAnimalKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      FixedChar = True
    end
    object cdsResumoAnimalBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsResumoAnimalTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object cdsResumoAnimalULTIMAPESAGEM: TFloatField
      FieldName = 'ULTIMAPESAGEM'
    end
    object cdsResumoAnimalDATAULTIMOPARTO: TSQLTimeStampField
      FieldName = 'DATAULTIMOPARTO'
    end
    object cdsResumoAnimalSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object cdsResumoAnimalDATAULTIMOEVENTO: TSQLTimeStampField
      FieldName = 'DATAULTIMOEVENTO'
    end
    object cdsResumoAnimalDPP: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DPP'
      Required = True
    end
    object cdsResumoAnimalDESC_EVENTO: TStringField
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
    object cdsResumoAnimalSTATUS_VACA: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'STATUS_VACA'
      Size = 32
    end
    object cdsResumoAnimalDESC_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESC_STATUS'
      LookupDataSet = cdsStatusAnimal
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 32
      Lookup = True
    end
    object cdsResumoAnimalULTIMA_LACTACAO: TSQLTimeStampField
      FieldName = 'ULTIMA_LACTACAO'
    end
    object cdsResumoAnimalNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object cdsResumoAnimalKULTIMO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KULTIMO_EVENTO_ZOOTECNICO'
      FixedChar = True
    end
    object cdsResumoAnimalKULTIMA_MONTA: TStringField
      FieldName = 'KULTIMA_MONTA'
      FixedChar = True
    end
    object cdsResumoAnimalKULTIMO_PARTO: TStringField
      FieldName = 'KULTIMO_PARTO'
      FixedChar = True
    end
  end
  object sqlResumoAnimal: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'    ZA.KZOO_ANIMAL,'#13#10'    ZA.BRINCO,'#13#10'    ZEZ.tipoevento,' +
      #13#10'    ZPL.TOTAL               ULTIMAPESAGEM,'#13#10'    ZAF.ULTIMA_LAC' +
      'TACAO   DATAULTIMOPARTO,'#13#10'    ZA.status,'#13#10'    ZEZ.DATAEVENTO    ' +
      '      DATAULTIMOEVENTO,'#13#10'    ZAF.NASCIMENTO,'#13#10'    ZAF.ULTIMA_LAC' +
      'TACAO,'#13#10'    ZAF.KULTIMO_EVENTO_ZOOTECNICO,'#13#10'    ZAF.KULTIMA_MONT' +
      'A,'#13#10'    ZAF.KULTIMO_PARTO'#13#10'FROM ZOO_ANIMAIS_FEMEA ZAF'#13#10'JOIN ZOO_' +
      'ANIMAIS                  ZA  ON ZA.KZOO_ANIMAL = ZAF.KZOO_ANIMAL' +
      '_FEMEA'#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS ZEZ ON ZEZ.KZOO_EVENTO' +
      '_ZOOTECNICO = ZAF.KULTIMO_EVENTO_ZOOTECNICO'#13#10'LEFT JOIN ZOO_LACTA' +
      'COES LC ON LC.KZOO_LACTACAO = ZAF.KULTIMA_LACTACAO'#13#10'LEFT JOIN ZO' +
      'O_PESAGEM_LEITE  ZPL ON ZPL.KZOO_PESAGEM_LEITE = LC.KULTIMA_PESA' +
      'GEMLEITE'#13#10'WHERE ZAF.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 676
    Top = 172
    object sqlResumoAnimalKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      FixedChar = True
    end
    object sqlResumoAnimalBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlResumoAnimalTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlResumoAnimalULTIMAPESAGEM: TFloatField
      FieldName = 'ULTIMAPESAGEM'
    end
    object sqlResumoAnimalDATAULTIMOPARTO: TSQLTimeStampField
      FieldName = 'DATAULTIMOPARTO'
    end
    object sqlResumoAnimalSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object sqlResumoAnimalDATAULTIMOEVENTO: TSQLTimeStampField
      FieldName = 'DATAULTIMOEVENTO'
    end
    object sqlResumoAnimalULTIMA_LACTACAO: TSQLTimeStampField
      FieldName = 'ULTIMA_LACTACAO'
    end
    object sqlResumoAnimalNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object sqlResumoAnimalKULTIMO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KULTIMO_EVENTO_ZOOTECNICO'
      FixedChar = True
    end
    object sqlResumoAnimalKULTIMA_MONTA: TStringField
      FieldName = 'KULTIMA_MONTA'
      FixedChar = True
    end
    object sqlResumoAnimalKULTIMO_PARTO: TStringField
      FieldName = 'KULTIMO_PARTO'
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
    Left = 771
    Top = 23
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
    Left = 772
    Top = 80
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
  object cdsStatusDiagnostico: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F02004900040001
      0005574944544802000200FF00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 776
    Top = 132
    object cdsStatusDiagnosticoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusDiagnosticoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusDiagnosticoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object cdsStatusDiagnosticoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoQuarto: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 780
    Top = 200
    object cdsTipoQuartoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoQuartoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoQuartoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoQuartoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
