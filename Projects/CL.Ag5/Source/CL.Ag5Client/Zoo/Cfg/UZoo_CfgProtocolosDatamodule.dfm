object Zoo_CfgProtocolosDatamodule: TZoo_CfgProtocolosDatamodule
  OldCreateOrder = True
  Height = 274
  Width = 550
  object cdsLstProtocolos: TClientDataSet
    Aggregates = <>
    Filter = 'ATIVO = '#39'T'#39
    Filtered = True
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstProtocolos'
    BeforeOpen = cdsLstProtocolosBeforeOpen
    OnNewRecord = cdsLstProtocolosNewRecord
    Left = 55
    Top = 44
    object cdsLstProtocolosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstProtocolosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsLstProtocolosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsLstProtocolosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsLstProtocolosTIPOPROTOCOLO: TIntegerField
      FieldName = 'TIPOPROTOCOLO'
      Required = True
    end
    object cdsLstProtocolosDESC_TIPOPROTOCOLO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_TIPOPROTOCOLO'
      LookupDataSet = cdsTiposProtocolo
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOPROTOCOLO'
      Size = 31
      Lookup = True
    end
    object cdsLstProtocolosSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstProtocolosSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object cdsLstProtocolosSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstProtocolosSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object cdsProtocolo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_PROTOCOLO'
        ParamType = ptInput
      end>
    ProviderName = 'dspProtocolo'
    BeforeDelete = cdsProtocoloBeforeDelete
    OnNewRecord = cdsProtocoloNewRecord
    Left = 183
    Top = 44
    object cdsProtocoloKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsProtocoloKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsProtocoloCODIGO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'CODIGO'
      Required = True
      OnSetText = cdsProtocoloCODIGOSetText
      OnValidate = cdsProtocoloCODIGOValidate
      Size = 32
    end
    object cdsProtocoloNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Required = True
      OnSetText = cdsProtocoloNOMESetText
      OnValidate = cdsProtocoloNOMEValidate
      Size = 128
    end
    object cdsProtocoloDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProtocoloATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProtocoloINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProtocolosqlTarefas: TDataSetField
      DisplayLabel = 'Tarefas'
      FieldName = 'sqlTarefas'
    end
    object cdsProtocoloTIPOPROTOCOLO: TIntegerField
      DisplayLabel = 'Tipo protocolo'
      FieldName = 'TIPOPROTOCOLO'
      Required = True
    end
    object cdsProtocoloDESC_TIPOPROTOCOLO: TStringField
      DisplayLabel = 'Tipo protocolo'
      FieldKind = fkLookup
      FieldName = 'DESC_TIPOPROTOCOLO'
      LookupDataSet = cdsTiposProtocolo
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOPROTOCOLO'
      Size = 31
      Lookup = True
    end
  end
  object dspLstProtocolos: TDataSetProvider
    DataSet = sqlLstProtocolos
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object dspProtocolo: TDataSetProvider
    DataSet = sqlProtocolo
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 89
  end
  object sqlLstProtocolos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  KZOO_PROTOCOLO,'#13#10'  CODIGO,  '#13#10'  NOME,'#13#10'  ATIVO,'#13#10'  TI' +
      'POPROTOCOLO,'#13#10'  SYS$UI, '#13#10'  SYS$DI,'#13#10'  SYS$UU,'#13#10'  SYS$DU '#13#10'FROM ' +
      'ZOO_PROTOCOLOS'#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA'
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
    object sqlLstProtocolosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstProtocolosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlLstProtocolosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlLstProtocolosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlLstProtocolosTIPOPROTOCOLO: TIntegerField
      FieldName = 'TIPOPROTOCOLO'
      Required = True
    end
    object sqlLstProtocolosSYSUI: TStringField
      FieldName = 'SYS$UI'
      Size = 32
    end
    object sqlLstProtocolosSYSDI: TSQLTimeStampField
      FieldName = 'SYS$DI'
    end
    object sqlLstProtocolosSYSUU: TStringField
      FieldName = 'SYS$UU'
      Size = 32
    end
    object sqlLstProtocolosSYSDU: TSQLTimeStampField
      FieldName = 'SYS$DU'
    end
  end
  object sqlProtocolo: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  KZOO_PROTOCOLO, '#13#10'  KCAD_FAZENDA, '#13#10' CODIGO, '#13#10' NOME,' +
      #13#10' DESCRICAO, '#13#10' ATIVO, '#13#10' INTERNAL,'#13#10' TIPOPROTOCOLO'#13#10'FROM ZOO_P' +
      'ROTOCOLOS'#13#10'WHERE KZOO_PROTOCOLO = :KZOO_PROTOCOLO'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_PROTOCOLO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 178
    Top = 132
    object sqlProtocoloKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlProtocoloKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlProtocoloCODIGO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlProtocoloNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlProtocoloDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlProtocoloATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlProtocoloINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlProtocoloTIPOPROTOCOLO: TIntegerField
      DisplayLabel = 'Tipo protocolo'
      FieldName = 'TIPOPROTOCOLO'
      Required = True
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstProtocolos
    Left = 120
    Top = 8
  end
  object sqlTarefas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  PT.KZOO_PROTOCOLO_TAREFA, '#13#10'  PT.KZOO_PROTOCOLO, '#13#10'  ' +
      'PT.KZOO_TAREFA,'#13#10'  T.CODIGO,'#13#10'  T.NOME, PT.EXAME, '#13#10'  T.ATIVO,'#13#10 +
      '  PT.DIA, '#13#10'  PT.VEZES, '#13#10'  PT.REPLICAR, '#13#10'  PT.INTERVALO, '#13#10'  P' +
      'T.OBS'#13#10'FROM ZOO_PROTOCOLO_TAREFAS PT'#13#10'LEFT JOIN ZOO_TAREFAS T ON' +
      ' ( T.KZOO_TAREFA = PT.KZOO_TAREFA )'#13#10'WHERE PT.KZOO_PROTOCOLO = :' +
      'KZOO_PROTOCOLO'#13#10'ORDER BY PT.DIA, PT.SYS$DI'
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_PROTOCOLO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 272
    Top = 132
    object sqlTarefasKZOO_PROTOCOLO_TAREFA: TStringField
      FieldName = 'KZOO_PROTOCOLO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlTarefasKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlTarefasKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlTarefasEXAME: TStringField
      DisplayLabel = 'Exame'
      FieldName = 'EXAME'
      Size = 1
    end
    object sqlTarefasCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlTarefasNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlTarefasDIA: TIntegerField
      DisplayLabel = 'Dia'
      FieldName = 'DIA'
    end
    object sqlTarefasVEZES: TIntegerField
      DisplayLabel = 'Vezes'
      FieldName = 'VEZES'
    end
    object sqlTarefasREPLICAR: TIntegerField
      DisplayLabel = 'Replicar tarefa'
      FieldName = 'REPLICAR'
    end
    object sqlTarefasINTERVALO: TIntegerField
      DisplayLabel = 'Intervalo de dias'
      FieldName = 'INTERVALO'
    end
    object sqlTarefasATIVO: TStringField
      DisplayLabel = 'Ativa'
      FieldName = 'ATIVO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlTarefasOBS: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsSQLEdit: TDataSource
    DataSet = sqlProtocolo
    Left = 219
    Top = 179
  end
  object cdsTarefas: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProtocolosqlTarefas
    Params = <>
    BeforePost = cdsTarefasBeforePost
    OnNewRecord = cdsTarefasNewRecord
    Left = 270
    Top = 45
    object cdsTarefasKZOO_PROTOCOLO_TAREFA: TStringField
      FieldName = 'KZOO_PROTOCOLO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsTarefasKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsTarefasKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsTarefasEXAME: TStringField
      DisplayLabel = 'Exame'
      FieldName = 'EXAME'
      OnGetText = cdsTarefasEXAMEGetText
      Size = 1
    end
    object cdsTarefasCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      OnSetText = cdsTarefasCODIGOSetText
      Size = 32
    end
    object cdsTarefasNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      OnSetText = cdsTarefasNOMESetText
      Size = 128
    end
    object cdsTarefasREPLICAR: TIntegerField
      DisplayLabel = 'Replicar tarefa'
      FieldName = 'REPLICAR'
    end
    object cdsTarefasDIA: TIntegerField
      DisplayLabel = 'Dia'
      FieldName = 'DIA'
      OnValidate = cdsTarefasDIAValidate
    end
    object cdsTarefasVEZES: TIntegerField
      DisplayLabel = 'Vezes'
      FieldName = 'VEZES'
    end
    object cdsTarefasATIVO: TStringField
      DisplayLabel = 'Ativa'
      FieldName = 'ATIVO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object cdsTarefasINTERVALO: TIntegerField
      DisplayLabel = 'Intervalo de dias'
      FieldName = 'INTERVALO'
    end
    object cdsTarefasOBS: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      OnGetText = cdsTarefasOBSGetText
      BlobType = ftMemo
      GraphicHeader = False
      Size = 1
    end
    object cdsTarefasRECCOUNT: TStringField
      FieldKind = fkCalculated
      FieldName = 'RECCOUNT'
      OnGetText = cdsTarefasRECCOUNTGetText
      Size = 10
      Calculated = True
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
end
