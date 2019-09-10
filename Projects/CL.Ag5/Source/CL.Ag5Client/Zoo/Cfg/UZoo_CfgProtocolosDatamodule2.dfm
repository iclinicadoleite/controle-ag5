object Zoo_CfgProtocolosDatamodule2: TZoo_CfgProtocolosDatamodule2
  OldCreateOrder = True
  Height = 274
  Width = 550
  object cdsProtocolos: TClientDataSet
    Aggregates = <>
    Filter = 'ATIVO = '#39'T'#39
    Filtered = True
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspProtocolos'
    BeforeOpen = cdsProtocolosBeforeOpen
    BeforeDelete = cdsProtocolosBeforeDelete
    OnNewRecord = cdsProtocolosNewRecord
    Left = 55
    Top = 44
    object cdsProtocolosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsProtocolosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      OnSetText = cdsProtocolosCODIGOSetText
      OnValidate = cdsProtocolosCODIGOValidate
      Size = 32
    end
    object cdsProtocolosNOME: TStringField
      FieldName = 'NOME'
      OnSetText = cdsProtocolosNOMESetText
      OnValidate = cdsProtocolosNOMEValidate
      Size = 128
    end
    object cdsProtocolosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProtocolosTIPOPROTOCOLO: TIntegerField
      FieldName = 'TIPOPROTOCOLO'
      Required = True
    end
    object cdsProtocolosDESC_TIPOPROTOCOLO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_TIPOPROTOCOLO'
      LookupDataSet = cdsTiposProtocolo
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOPROTOCOLO'
      Size = 31
      Lookup = True
    end
    object cdsProtocolosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsProtocolosINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProtocolossqlTarefas: TDataSetField
      FieldName = 'sqlTarefas'
    end
  end
  object dspProtocolos: TDataSetProvider
    DataSet = sqlProtocolos
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspProtocolosBeforeUpdateRecord
    OnGetTableName = dspProtocolosGetTableName
    Left = 31
    Top = 89
  end
  object sqlProtocolos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  KCAD_FAZENDA,'#13#10'  KZOO_PROTOCOLO,'#13#10'  CODIGO,  '#13#10'  NOME' +
      ','#13#10'  ATIVO,'#13#10'  TIPOPROTOCOLO,'#13#10'  INTERNAL'#13#10'FROM ZOO_PROTOCOLOS'#13#10 +
      'WHERE KCAD_FAZENDA = :KCAD_FAZENDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 58
    Top = 133
    object sqlProtocolosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlProtocolosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlProtocolosNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object sqlProtocolosTIPOPROTOCOLO: TIntegerField
      FieldName = 'TIPOPROTOCOLO'
      Required = True
    end
    object sqlProtocolosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlProtocolosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlProtocolosINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsList: TDataSource
    DataSet = cdsProtocolos
    OnDataChange = dtsListDataChange
    Left = 120
    Top = 8
  end
  object sqlTarefas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT   DISTINCT'#13#10'  1 TIPOREC'#13#10',  MD5STR20(RIGHT(  '#39'00'#39' || PT.D' +
      'IA, 3 ) || PT.KZOO_PROTOCOLO ) AS KZOO_PROTOCOLO_TAREFA'#13#10',  PT.K' +
      'ZOO_PROTOCOLO'#13#10',  NULL AS KZOO_TAREFA'#13#10',  NULL AS CODIGO'#13#10',  CAS' +
      'T(PT.DIA AS VARCHAR(128)) AS NOME'#13#10',  NULL AS EXAME'#13#10',  NULL ATI' +
      'VO'#13#10',  PT.DIA'#13#10',(SELECT '#13#10'  COUNT(*)'#13#10'  FROM ZOO_PROTOCOLO_TAREF' +
      'AS '#13#10' WHERE KZOO_PROTOCOLO =PT.KZOO_PROTOCOLO'#13#10'        AND DIA =' +
      ' PT.DIA) AS VEZES'#13#10',  NULL AS REPLICAR'#13#10',  NULL AS INTERVALO'#13#10', ' +
      ' NULL AS OBS'#13#10',  NULL AS KMZOO_PROTOCOLO_TAREFA'#13#10'FROM ZOO_PROTOC' +
      'OLO_TAREFAS PT'#13#10'LEFT JOIN ZOO_TAREFAS T '#13#10'  ON ( T.KZOO_TAREFA =' +
      ' PT.KZOO_TAREFA )'#13#10'WHERE KZOO_PROTOCOLO = :KZOO_PROTOCOLO'#13#10'UNION' +
      #13#10'SELECT '#13#10'  2 TIPOREC'#13#10',  PT.KZOO_PROTOCOLO_TAREFA'#13#10',  PT.KZOO_' +
      'PROTOCOLO'#13#10',  PT.KZOO_TAREFA'#13#10',  T.CODIGO'#13#10',  T.NOME'#13#10',  PT.EXAM' +
      'E'#13#10',  T.ATIVO'#13#10',  PT.DIA'#13#10',  PT.VEZES'#13#10',  PT.REPLICAR'#13#10',  PT.INT' +
      'ERVALO'#13#10',  PT.OBS'#13#10',  MD5STR20( RIGHT(  '#39'00'#39' || PT.DIA, 3 ) || P' +
      'T.KZOO_PROTOCOLO ) AS KMZOO_PROTOCOLO_TAREFA'#13#10'FROM ZOO_PROTOCOLO' +
      '_TAREFAS PT'#13#10'LEFT JOIN ZOO_TAREFAS T '#13#10'  ON ( T.KZOO_TAREFA = PT' +
      '.KZOO_TAREFA )'#13#10'WHERE KZOO_PROTOCOLO = :KZOO_PROTOCOLO'#13#10'ORDER BY' +
      ' 1, 9, 5'
    DataSource = DataSource1
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_PROTOCOLO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_PROTOCOLO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 192
    Top = 136
    object sqlTarefasKZOO_PROTOCOLO_TAREFA: TStringField
      FieldName = 'KZOO_PROTOCOLO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlTarefasKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object sqlTarefasKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object sqlTarefasTIPOREC: TIntegerField
      FieldName = 'TIPOREC'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sqlTarefasCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlTarefasNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlTarefasEXAME: TStringField
      FieldName = 'EXAME'
      FixedChar = True
      Size = 1
    end
    object sqlTarefasATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlTarefasDIA: TIntegerField
      FieldName = 'DIA'
    end
    object sqlTarefasVEZES: TIntegerField
      FieldName = 'VEZES'
    end
    object sqlTarefasREPLICAR: TIntegerField
      FieldName = 'REPLICAR'
    end
    object sqlTarefasINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object sqlTarefasOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlTarefasKMZOO_PROTOCOLO_TAREFA: TStringField
      FieldName = 'KMZOO_PROTOCOLO_TAREFA'
      ProviderFlags = [pfInWhere]
    end
  end
  object cdsTarefas: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProtocolossqlTarefas
    FieldDefs = <
      item
        Name = 'KZOO_PROTOCOLO_TAREFA'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'KZOO_PROTOCOLO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_TAREFA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TIPOREC'
        Attributes = [faRequired]
        DataType = ftInteger
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
      end
      item
        Name = 'EXAME'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ATIVO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DIA'
        DataType = ftInteger
      end
      item
        Name = 'VEZES'
        DataType = ftInteger
      end
      item
        Name = 'REPLICAR'
        DataType = ftInteger
      end
      item
        Name = 'INTERVALO'
        DataType = ftInteger
      end
      item
        Name = 'OBS'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'KMZOO_PROTOCOLO_TAREFA'
        DataType = ftString
        Size = 33
      end>
    IndexDefs = <
      item
        Name = 'idxTarefas'
        Fields = 'DIA'
        GroupingLevel = 1
      end>
    IndexName = 'idxTarefas'
    Params = <>
    StoreDefs = True
    BeforePost = cdsTarefasBeforePost
    OnNewRecord = cdsTarefasNewRecord
    Left = 190
    Top = 49
    object cdsTarefasKZOO_PROTOCOLO_TAREFA: TStringField
      FieldName = 'KZOO_PROTOCOLO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTarefasKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object cdsTarefasKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object cdsTarefasTIPOREC: TIntegerField
      FieldName = 'TIPOREC'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object cdsTarefasCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsTarefasCODIGOGetText
      Size = 32
    end
    object cdsTarefasNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsTarefasEXAME: TStringField
      FieldName = 'EXAME'
      FixedChar = True
      Size = 1
    end
    object cdsTarefasATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsTarefasATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsTarefasDIA: TIntegerField
      FieldName = 'DIA'
    end
    object cdsTarefasVEZES: TIntegerField
      FieldName = 'VEZES'
    end
    object cdsTarefasREPLICAR: TIntegerField
      FieldName = 'REPLICAR'
    end
    object cdsTarefasINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object cdsTarefasOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsTarefasKMZOO_PROTOCOLO_TAREFA: TStringField
      FieldName = 'KMZOO_PROTOCOLO_TAREFA'
      ProviderFlags = [pfInWhere]
    end
    object cdsTarefasTAREFAS_NO_DIA: TAggregateField
      FieldName = 'TAREFAS_NO_DIA'
      Active = True
      DisplayName = ''
      Expression = 'COUNT(*)'
      GroupingLevel = 1
      IndexName = 'idxTarefas'
    end
  end
  object cdsTiposProtocolo: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 368
    Top = 8
    object cdsTiposProtocoloTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTiposProtocoloVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTiposProtocoloDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTiposProtocoloORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object DataSource1: TDataSource
    DataSet = sqlProtocolos
    Left = 136
    Top = 176
  end
end
