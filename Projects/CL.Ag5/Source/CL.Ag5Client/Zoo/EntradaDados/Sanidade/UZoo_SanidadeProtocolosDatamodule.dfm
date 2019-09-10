object Zoo_SanidadeProtocolosDatamodule: TZoo_SanidadeProtocolosDatamodule
  OldCreateOrder = True
  Height = 427
  Width = 977
  object cdsFichaAnimalColetivo: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProtocoloColetivosqlFichaAnimalColetivo
    Params = <>
    Left = 361
    Top = 30
    object cdsFichaAnimalColetivoKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object cdsFichaAnimalColetivoBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsFichaAnimalColetivoNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsFichaAnimalColetivoSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldKind = fkInternalCalc
      FieldName = 'STATUS'
      Required = True
      Visible = False
    end
    object cdsFichaAnimalColetivoLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldKind = fkInternalCalc
      FieldName = 'LOTE'
      Size = 32
    end
    object cdsFichaAnimalColetivoDESCR_STATUS: TStringField
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
  end
  object cdsProtocoloIndividual: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProtocoloIndividual'
    Left = 72
    Top = 63
    object cdsProtocoloIndividualKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      OnValidate = cdsProtocoloIndividualKZOO_PROTOCOLOValidate
      FixedChar = True
    end
    object cdsProtocoloIndividualKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      FixedChar = True
    end
    object cdsProtocoloIndividualBRINCO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsProtocoloIndividualNOMEESTABULO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsProtocoloIndividualPROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldKind = fkLookup
      FieldName = 'PROTOCOLO'
      LookupDataSet = cdsProtocolosDisponiveis
      LookupKeyFields = 'KZOO_PROTOCOLO'
      LookupResultField = 'PROTOCOLO'
      KeyFields = 'KZOO_PROTOCOLO'
      Size = 160
      Lookup = True
    end
    object cdsProtocoloIndividualDATA: TSQLTimeStampField
      FieldName = 'DATA'
      OnValidate = cdsProtocoloIndividualDATAValidate
    end
    object cdsProtocoloIndividualsqlTarefasIndividual: TDataSetField
      DisplayLabel = 'Tarefas individual'
      FieldName = 'sqlTarefasIndividual'
    end
  end
  object dspProtocolosAplicados: TDataSetProvider
    DataSet = sqlProtocolosAplicados
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 530
    Top = 193
  end
  object sqlProtocoloIndividual: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  P.KZOO_PROTOCOLO,'#13#10'  P.DATA,'#13#10'  P.KZOO_ANIMAL_FEMEA'#13#10'F' +
      'ROM ZOO_ANIMAL_PROTOCOLOS P'#13#10'WHERE 1=0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 67
    Top = 160
    object sqlProtocoloIndividualKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object sqlProtocoloIndividualDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlProtocoloIndividualKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      FixedChar = True
    end
  end
  object sqlTarefasIndividual: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  T.KZOO_TAREFA,'#13#10'  T.KCAD_FUNCIONARIO,'#13#10'  T.NOMEFUNCION' +
      'ARIO '#13#10'FROM  ZOO_ANIMAL_TAREFAS T'#13#10'WHERE  1=0'
    DataSource = dtsSQLProtocoloIndividual
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 157
    Top = 162
    object sqlTarefasIndividualKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object sqlTarefasIndividualEXAME: TStringField
      FieldName = 'EXAME'
      Size = 1
    end
    object sqlTarefasIndividualCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlTarefasIndividualNOME: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlTarefasIndividualDIA: TSmallintField
      DisplayLabel = 'Dia'
      FieldName = 'DIA'
    end
    object sqlTarefasIndividualVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object sqlTarefasIndividualDESCARTELEITE: TSmallintField
      DisplayLabel = 'Descarte leite/carne'
      FieldName = 'DESCARTELEITE'
    end
    object sqlTarefasIndividualDESCARTECARNE: TSmallintField
      DisplayLabel = 'Descarte carne'
      FieldName = 'DESCARTECARNE'
    end
    object sqlTarefasIndividualKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlTarefasIndividualNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlTarefasIndividualDESCRICAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsSQLProtocoloIndividual: TDataSource
    DataSet = sqlProtocoloIndividual
    Left = 124
    Top = 209
  end
  object cdsTarefasIndividual: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProtocoloIndividualsqlTarefasIndividual
    Params = <>
    Left = 143
    Top = 39
    object cdsTarefasIndividualKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object cdsTarefasIndividualEXAME: TStringField
      FieldName = 'EXAME'
      Size = 1
    end
    object cdsTarefasIndividualCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsTarefasIndividualNOME: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'NOME'
      OnGetText = cdsTarefasIndividualNOMEGetText
      Size = 128
    end
    object cdsTarefasIndividualDIA: TSmallintField
      DisplayLabel = 'Dia'
      FieldName = 'DIA'
      OnGetText = cdsTarefasIndividualDIAGetText
    end
    object cdsTarefasIndividualVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object cdsTarefasIndividualPREVISAO: TDateTimeField
      DisplayLabel = 'Dia / Previs'#227'o'
      FieldKind = fkCalculated
      FieldName = 'PREVISAO'
      OnGetText = cdsTarefasIndividualPREVISAOGetText
      Calculated = True
    end
    object cdsTarefasIndividualDESCARTELEITE: TSmallintField
      DisplayLabel = 'Descarte leite/carne'
      FieldName = 'DESCARTELEITE'
      OnGetText = cdsTarefasIndividualDESCARTELEITEGetText
    end
    object cdsTarefasIndividualDESCARTECARNE: TSmallintField
      DisplayLabel = 'Descarte carne'
      FieldName = 'DESCARTECARNE'
    end
    object cdsTarefasIndividualKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
    end
    object cdsTarefasIndividualNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = cdsTarefasIndividualNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsTarefasIndividualOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      OnGetText = cdsTarefasIndividualOBSGetText
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsProtocolosAplicados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspProtocolosAplicados'
    Left = 551
    Top = 144
    object cdsProtocolosAplicadosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object cdsProtocolosAplicadosKZOO_ANIMAL_PROTOCOLO: TStringField
      FieldName = 'KZOO_ANIMAL_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object cdsProtocolosAplicadosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object cdsProtocolosAplicadosCODIGO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsProtocolosAplicadosDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsProtocolosAplicadosNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
  end
  object dspProtocoloColetivo: TDataSetProvider
    DataSet = sqlProtocoloColetivo
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspProtocoloColetivoBeforeUpdateRecord
    Left = 266
    Top = 112
  end
  object sqlFichaAnimalColetivo: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  P.KZOO_ANIMAL_FEMEA'#13#10'FROM ZOO_ANIMAL_PROTOCOLOS P'#13#10'WH' +
      'ERE 1=0'
    DataSource = dtsSQLProtocoloColetivo
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 358
    Top = 143
    object sqlFichaAnimalColetivoKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
  end
  object sqlProtocolosAplicados: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  KZOO_ANIMAL_PROTOCOLO,'#13#10'  KZOO_PROTOCOLO,'#13#10'  KZOO_ANIM' +
      'AL_FEMEA,'#13#10'  CODIGO, '#13#10'  DATA,'#13#10'  NOME'#13#10'FROM ZOO_ANIMAL_PROTOCOL' +
      'OS P '#13#10'WHERE  P.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'#13#10'  AND P.EXCLUI' +
      'DO = '#39'F'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 549
    Top = 240
    object sqlProtocolosAplicadosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlProtocolosAplicadosKZOO_ANIMAL_PROTOCOLO: TStringField
      FieldName = 'KZOO_ANIMAL_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object sqlProtocolosAplicadosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object sqlProtocolosAplicadosCODIGO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlProtocolosAplicadosDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object sqlProtocolosAplicadosNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
  end
  object dtsSQLProtocoloColetivo: TDataSource
    DataSet = sqlProtocoloColetivo
    Left = 362
    Top = 247
  end
  object dtsFichaAnimal: TDataSource
    DataSet = cdsFichaAnimalColetivo
    OnDataChange = dtsFichaAnimalDataChange
    Left = 437
    Top = 4
  end
  object cdsProtocoloColetivo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProtocoloColetivo'
    Left = 284
    Top = 59
    object cdsProtocoloColetivoKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      OnValidate = cdsProtocoloColetivoKZOO_PROTOCOLOValidate
      FixedChar = True
    end
    object cdsProtocoloColetivoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      OnValidate = cdsProtocoloColetivoDATAValidate
    end
    object cdsProtocoloColetivoPROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldKind = fkLookup
      FieldName = 'PROTOCOLO'
      LookupDataSet = cdsProtocolosDisponiveis
      LookupKeyFields = 'KZOO_PROTOCOLO'
      LookupResultField = 'PROTOCOLO'
      KeyFields = 'KZOO_PROTOCOLO'
      Size = 160
      Lookup = True
    end
    object cdsProtocoloColetivosqlTarefasColetivo: TDataSetField
      DisplayLabel = 'Tarefas coletivo'
      FieldName = 'sqlTarefasColetivo'
    end
    object cdsProtocoloColetivosqlFichaAnimalColetivo: TDataSetField
      DisplayLabel = 'Ficha Coletivo'
      FieldName = 'sqlFichaAnimalColetivo'
    end
  end
  object sqlProtocoloColetivo: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  P.KZOO_PROTOCOLO,'#13#10'  P.DATA'#13#10'FROM ZOO_ANIMAL_PROTOCOLO' +
      'S P'#13#10'WHERE  1=0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 283
    Top = 164
    object sqlProtocoloColetivoKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object sqlProtocoloColetivoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
  end
  object dspProtocoloIndividual: TDataSetProvider
    DataSet = sqlProtocoloIndividual
    BeforeUpdateRecord = dspProtocoloIndividualBeforeUpdateRecord
    Left = 49
    Top = 112
  end
  object sqlTarefasColetivo: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  T.KZOO_TAREFA,'#13#10'  T.KCAD_FUNCIONARIO,'#13#10'  T.NOMEFUNCION' +
      'ARIO '#13#10'FROM  ZOO_ANIMAL_TAREFAS T'#13#10'WHERE  1=0'
    DataSource = dtsSQLProtocoloColetivo
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 358
    Top = 196
    object sqlTarefasColetivoKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object sqlTarefasColetivoEXAME: TStringField
      FieldName = 'EXAME'
      Size = 1
    end
    object sqlTarefasColetivoCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlTarefasColetivoNOME: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlTarefasColetivoDIA: TSmallintField
      DisplayLabel = 'Dia/previs'#227'o'
      FieldName = 'DIA'
    end
    object sqlTarefasColetivoDESCARTELEITE: TSmallintField
      DisplayLabel = 'Descarte leite/carne'
      FieldName = 'DESCARTELEITE'
    end
    object sqlTarefasColetivoDESCARTECARNE: TSmallintField
      DisplayLabel = 'Descarte carne'
      FieldName = 'DESCARTECARNE'
    end
    object sqlTarefasColetivoKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlTarefasColetivoNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlTarefasColetivoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsTarefasColetivo: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProtocoloColetivosqlTarefasColetivo
    Params = <>
    Left = 361
    Top = 79
    object cdsTarefasColetivoKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object cdsTarefasColetivoEXAME: TStringField
      FieldName = 'EXAME'
      Size = 1
    end
    object cdsTarefasColetivoCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsTarefasColetivoNOME: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'NOME'
      OnGetText = cdsTarefasColetivoNOMEGetText
      Size = 128
    end
    object cdsTarefasColetivoDIA: TSmallintField
      DisplayLabel = 'Dia'
      FieldName = 'DIA'
      OnGetText = cdsTarefasColetivoDIAGetText
    end
    object cdsTarefasColetivoVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object cdsTarefasColetivoPREVISAO: TDateTimeField
      DisplayLabel = 'Dia/previs'#227'o'
      FieldKind = fkCalculated
      FieldName = 'PREVISAO'
      OnGetText = cdsTarefasColetivoPREVISAOGetText
      Calculated = True
    end
    object cdsTarefasColetivoDESCARTELEITE: TSmallintField
      DisplayLabel = 'Descarte leite/carne'
      FieldName = 'DESCARTELEITE'
      OnGetText = cdsTarefasColetivoDESCARTELEITEGetText
    end
    object cdsTarefasColetivoDESCARTECARNE: TSmallintField
      DisplayLabel = 'Descarte carne'
      FieldName = 'DESCARTECARNE'
    end
    object cdsTarefasColetivoKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
    end
    object cdsTarefasColetivoNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = cdsTarefasColetivoNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsTarefasColetivoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      OnGetText = cdsTarefasColetivoOBSGetText
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsProtocolosDisponiveis: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspProtocolosDisponiveis'
    Left = 684
    Top = 140
    object cdsProtocolosDisponiveisKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsProtocolosDisponiveisPROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO'
      Required = True
      Size = 163
    end
  end
  object dspProtocolosDisponiveis: TDataSetProvider
    DataSet = sqlProtocolosDisponiveis
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 660
    Top = 192
  end
  object sqlProtocolosDisponiveis: TTcSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT'#13#10'  KZOO_PROTOCOLO,'#13#10'  CODIGO || '#39' - '#39' ||NOME PROTOCOLO'#13#10'F' +
      'ROM ZOO_PROTOCOLOS'#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA AND ATIVO' +
      ' = '#39'T'#39#13#10'ORDER BY CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 692
    Top = 248
    object sqlProtocolosDisponiveisKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object sqlProtocolosDisponiveisPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Required = True
      Size = 163
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
    Left = 867
    Top = 15
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
    Left = 868
    Top = 72
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
  object dspResumoAnimal: TDataSetProvider
    DataSet = sqlResumoAnimal
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 794
    Top = 201
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
    Left = 815
    Top = 152
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
      FieldName = 'DPP'
      Required = True
    end
    object cdsResumoAnimalDESC_STATUS: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_STATUS'
      LookupDataSet = cdsStatusAnimal
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 32
      Lookup = True
    end
    object cdsResumoAnimalDESC_EVENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_EVENTO'
      LookupDataSet = cdsTipoEvento
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOEVENTO'
      Size = 32
      Lookup = True
    end
    object cdsResumoAnimalLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object sqlResumoAnimal: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'    ZA.KZOO_ANIMAL,'#13#10'    ZA.BRINCO,'#13#10'    ZEZ.TIPOEVENTO,' +
      #13#10'    (SELECT TOTAL FROM ZOO_PESAGEM_LEITE ZPL WHERE  ZPL.KZOO_L' +
      'ACTACAO = ZAF.KULTIMA_LACTACAO ORDER BY DATA DESC ROWS 1) ULTIMA' +
      'PESAGEM,'#13#10'    ZAF.ULTIMA_LACTACAO DATAULTIMOPARTO,'#13#10'    ZA.STATU' +
      'S,'#13#10'    ZAF.LOTE,'#13#10'    ZEZ.DATAEVENTO          DATAULTIMOEVENTO,' +
      #13#10'    CAST ( CURRENT_DATE - CAST ( ZAF.ULTIMA_LACTACAO AS DATE )' +
      '  + 1 AS INTEGER ) DPP'#13#10'FROM ZOO_ANIMAIS_FEMEA ZAF'#13#10'JOIN ZOO_ANI' +
      'MAIS                  ZA  ON ZA.KZOO_ANIMAL = ZAF.KZOO_ANIMAL_FE' +
      'MEA'#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS ZEZ ON ZEZ.KZOO_EVENTO_ZO' +
      'OTECNICO = ZAF.KULTIMO_EVENTO_ZOOTECNICO'#13#10'WHERE ZAF.KZOO_ANIMAL_' +
      'FEMEA = :KZOO_ANIMAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 813
    Top = 248
    object sqlResumoAnimalKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      FixedChar = True
    end
    object sqlResumoAnimalBRINCO: TStringField
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
    object sqlResumoAnimalDPP: TIntegerField
      FieldName = 'DPP'
      Required = True
    end
    object sqlResumoAnimalLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object dtsProtocolosDisponiveis: TDataSource
    DataSet = cdsProtocolosDisponiveis
    OnDataChange = dtsProtocolosDisponiveisDataChange
    Left = 632
    Top = 24
  end
end
