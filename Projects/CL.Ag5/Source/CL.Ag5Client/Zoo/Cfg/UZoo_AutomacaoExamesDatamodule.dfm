object Zoo_AutomacaoExamesDatamodule: TZoo_AutomacaoExamesDatamodule
  OldCreateOrder = True
  Height = 356
  Width = 528
  object cdsProtocolos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA_RESULTADO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspProtocolos'
    Left = 301
    Top = 48
    object cdsProtocolosKZOO_RESULTADO_PROTOCOLO: TStringField
      FieldName = 'KZOO_RESULTADO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object cdsProtocolosKZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      FixedChar = True
    end
    object cdsProtocolosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object cdsProtocolosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsProtocolosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProtocolosINICIAR: TStringField
      FieldName = 'INICIAR'
      FixedChar = True
      Size = 1
    end
  end
  object dspProtocolos: TDataSetProvider
    DataSet = sqlProtocolos
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspProtocolosBeforeUpdateRecord
    Left = 261
    Top = 93
  end
  object sqlProtocolos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10' RP.KZOO_RESULTADO_PROTOCOLO, '#13#10' RP.KZOO_TAREFA_RESULTAD' +
      'O, '#13#10' P.KZOO_PROTOCOLO,'#13#10' P.NOME,'#13#10' P.ATIVO,'#13#10' RP.INICIAR'#13#10'FROM ' +
      'ZOO_PROTOCOLOS P'#13#10'LEFT JOIN   ZOO_RESULTADO_PROTOCOLOS RP ON ( R' +
      'P.KZOO_TAREFA_RESULTADO = :KZOO_TAREFA_RESULTADO ) AND ( RP.KZOO' +
      '_PROTOCOLO = P.KZOO_PROTOCOLO )'#13#10'WHERE P.KCAD_FAZENDA = :KCAD_FA' +
      'ZENDA AND ( P.ATIVO = '#39'T'#39' OR P.KDEF_PROTOCOLO IS NULL )'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA_RESULTADO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 296
    Top = 136
    object sqlProtocolosKZOO_RESULTADO_PROTOCOLO: TStringField
      FieldName = 'KZOO_RESULTADO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object sqlProtocolosKZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      FixedChar = True
    end
    object sqlProtocolosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object sqlProtocolosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlProtocolosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlProtocolosINICIAR: TStringField
      FieldName = 'INICIAR'
      FixedChar = True
      Size = 1
    end
  end
  object cdsLstResultados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstResultados'
    Left = 142
    Top = 43
    object cdsLstResultadosKZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsLstResultadosNOME: TStringField
      DisplayWidth = 46
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
  end
  object dspLstResultados: TDataSetProvider
    DataSet = sqlLstResultados
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 106
    Top = 88
  end
  object sqlLstResultados: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  KZOO_TAREFA_RESULTADO,'#13#10'  NOME'#13#10'FROM ZOO_TAREFA_RESUL' +
      'TADOS'#13#10'WHERE KZOO_TAREFA = :KZOO_TAREFA'#13#10'  AND (  ATIVO = '#39'T'#39' )'#13 +
      #10'ORDER BY NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 141
    Top = 131
    object sqlLstResultadosKZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlLstResultadosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
  end
  object dtsLstResultados: TDataSource
    DataSet = cdsLstResultados
    OnDataChange = dtsLstResultadosDataChange
    Left = 211
    Top = 7
  end
  object cdsListaExames: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_EXAME'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaExames'
    Left = 26
    Top = 48
    object cdsListaExamesKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      FixedChar = True
    end
    object cdsListaExamesEXAME: TStringField
      FieldName = 'EXAME'
      Required = True
      Size = 31
    end
  end
  object dtsListaExames: TDataSource
    DataSet = cdsListaExames
    OnDataChange = dtsListaExamesDataChange
    Left = 49
    Top = 3
  end
  object dspListaExames: TDataSetProvider
    DataSet = sqlListaExames
    UpdateMode = upWhereKeyOnly
    Left = 8
    Top = 96
  end
  object sqlListaExames: TTcSQLDataSet
    CommandText = 
      'SELECT'#13#10' KZOO_TAREFA,'#13#10' CODIGO || '#39' - '#39' || NOME EXAME'#13#10'FROM ZOO_' +
      'TAREFAS'#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA'#13#10'  AND TIPOTAREFA = ' +
      ':TIPO_EXAME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_EXAME'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 40
    Top = 144
    object sqlListaExamesKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      FixedChar = True
    end
    object sqlListaExamesEXAME: TStringField
      FieldName = 'EXAME'
      Required = True
      Size = 160
    end
  end
end
