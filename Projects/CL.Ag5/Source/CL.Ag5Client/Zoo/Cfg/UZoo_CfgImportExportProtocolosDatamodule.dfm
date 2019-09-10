object Zoo_CfgImportExportProtocolosDatamodule: TZoo_CfgImportExportProtocolosDatamodule
  OldCreateOrder = True
  Left = 907
  Top = 153
  Height = 461
  Width = 693
  object cdsProtocolos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspProtocolos'
    BeforeOpen = cdsProtocolosBeforeOpen
    OnCalcFields = cdsProtocolosCalcFields
    Left = 103
    Top = 13
    object cdsProtocolosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsProtocolosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsProtocolosEXPORT: TSmallintField
      DisplayLabel = 'Exportar'
      FieldKind = fkInternalCalc
      FieldName = 'EXPORT'
      Required = True
      OnGetText = cdsProtocolosEXPORTGetText
    end
    object cdsProtocolosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsProtocolosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsProtocolosTIPOPROTOCOLO: TIntegerField
      FieldName = 'TIPOPROTOCOLO'
      Required = True
    end
    object cdsProtocolosDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProtocolosINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProtocolosKDEF_PROTOCOLO: TStringField
      FieldName = 'KDEF_PROTOCOLO'
      FixedChar = True
    end
    object cdsProtocolossqlTarefasProt: TDataSetField
      DisplayLabel = 'Tarefas do protocolo'
      FieldName = 'sqlTarefasProt'
    end
  end
  object dspProtocolos: TDataSetProvider
    DataSet = sqlProtocolos
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 63
    Top = 58
  end
  object sqlProtocolos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  KZOO_PROTOCOLO, '#13#10'  KCAD_FAZENDA, '#13#10' CODIGO, '#13#10' NOME,' +
      #13#10' DESCRICAO,'#13#10' TIPOPROTOCOLO,'#13#10' INTERNAL,'#13#10' KDEF_PROTOCOLO'#13#10'FRO' +
      'M ZOO_PROTOCOLOS'#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA'#13#10'AND ATIVO ' +
      '= '#39'T'#39
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 98
    Top = 101
    object sqlProtocolosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlProtocolosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlProtocolosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlProtocolosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlProtocolosTIPOPROTOCOLO: TIntegerField
      FieldName = 'TIPOPROTOCOLO'
      Required = True
    end
    object sqlProtocolosDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlProtocolosINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlProtocolosKDEF_PROTOCOLO: TStringField
      FieldName = 'KDEF_PROTOCOLO'
      FixedChar = True
    end
  end
  object sqlTarefasProt: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  PT.KZOO_PROTOCOLO_TAREFA, '#13#10'  PT.KZOO_PROTOCOLO, '#13#10'  ' +
      'PT.KZOO_TAREFA,'#13#10'  T.TIPOTAREFA, '#13#10'  T.CODIGO, '#13#10'  T.NOME, '#13#10'  T' +
      '.DESCRICAO, '#13#10'  T.ATIVO, '#13#10'  T.DESCARTECARNE, '#13#10'  T.DESCARTELEIT' +
      'E, '#13#10'  T.INTERNAL,'#13#10'  T.KDEF_TAREFA,'#13#10'  PT.DIA, '#13#10'  PT.VEZES, '#13#10 +
      '  PT.REPLICAR,'#13#10'  PT.INTERVALO,'#13#10'  PT.OBS'#13#10'FROM ZOO_PROTOCOLO_TA' +
      'REFAS PT'#13#10'LEFT JOIN ZOO_TAREFAS T ON ( T.KZOO_TAREFA = PT.KZOO_T' +
      'AREFA )'#13#10'WHERE PT.KZOO_PROTOCOLO = :KZOO_PROTOCOLO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_PROTOCOLO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 175
    Top = 100
    object sqlTarefasProtKZOO_PROTOCOLO_TAREFA: TStringField
      FieldName = 'KZOO_PROTOCOLO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlTarefasProtKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlTarefasProtKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlTarefasProtTIPOTAREFA: TIntegerField
      FieldName = 'TIPOTAREFA'
    end
    object sqlTarefasProtCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlTarefasProtNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlTarefasProtATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlTarefasProtDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlTarefasProtDESCARTECARNE: TIntegerField
      FieldName = 'DESCARTECARNE'
    end
    object sqlTarefasProtDESCARTELEITE: TIntegerField
      FieldName = 'DESCARTELEITE'
    end
    object sqlTarefasProtINTERNAL: TStringField
      FieldName = 'INTERNAL'
      FixedChar = True
      Size = 1
    end
    object sqlTarefasProtKDEF_TAREFA: TStringField
      FieldName = 'KDEF_TAREFA'
      FixedChar = True
    end
    object sqlTarefasProtDIA: TIntegerField
      FieldName = 'DIA'
    end
    object sqlTarefasProtVEZES: TIntegerField
      FieldName = 'VEZES'
    end
    object sqlTarefasProtREPLICAR: TIntegerField
      FieldName = 'REPLICAR'
    end
    object sqlTarefasProtINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object sqlTarefasProtOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsSQLEdit: TDataSource
    DataSet = sqlProtocolos
    Left = 131
    Top = 146
  end
  object cdsTarefasProt: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProtocolossqlTarefasProt
    Params = <>
    Left = 173
    Top = 13
    object cdsTarefasProtKZOO_PROTOCOLO_TAREFA: TStringField
      FieldName = 'KZOO_PROTOCOLO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsTarefasProtKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsTarefasProtKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsTarefasProtTIPOTAREFA: TIntegerField
      FieldName = 'TIPOTAREFA'
    end
    object cdsTarefasProtCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsTarefasProtNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsTarefasProtATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object cdsTarefasProtDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsTarefasProtDESCARTECARNE: TIntegerField
      FieldName = 'DESCARTECARNE'
    end
    object cdsTarefasProtDESCARTELEITE: TIntegerField
      FieldName = 'DESCARTELEITE'
    end
    object cdsTarefasProtINTERNAL: TStringField
      FieldName = 'INTERNAL'
      FixedChar = True
      Size = 1
    end
    object cdsTarefasProtKDEF_TAREFA: TStringField
      FieldName = 'KDEF_TAREFA'
      FixedChar = True
    end
    object cdsTarefasProtDIA: TIntegerField
      FieldName = 'DIA'
    end
    object cdsTarefasProtVEZES: TIntegerField
      FieldName = 'VEZES'
    end
    object cdsTarefasProtREPLICAR: TIntegerField
      FieldName = 'REPLICAR'
    end
    object cdsTarefasProtINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object cdsTarefasProtOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsTarefasProtsqlItensProt: TDataSetField
      DisplayLabel = 'Itens da tarefa'
      FieldName = 'sqlItensProt'
    end
  end
  object dtsSQLTarefasProt: TDataSource
    DataSet = sqlTarefasProt
    Left = 217
    Top = 147
  end
  object sqlItensProt: TTcSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select  '#13#10' KZOO_TAREFA_ITEM, '#13#10' KZOO_TAREFA, '#13#10' ITEM, '#13#10' QTDE,'#13#10 +
      ' KDEF_TAREFA_ITEM'#13#10'from ZOO_TAREFA_ITENS'#13#10'WHERE KZOO_TAREFA = :K' +
      'ZOO_TAREFA'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsSQLTarefasProt
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 248
    Top = 99
    object sqlItensProtKZOO_TAREFA_ITEM: TStringField
      FieldName = 'KZOO_TAREFA_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlItensProtKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlItensProtITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      Required = True
      Size = 128
    end
    object sqlItensProtQTDE: TIntegerField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
    end
    object sqlItensProtKDEF_TAREFA_ITEM: TStringField
      FieldName = 'KDEF_TAREFA_ITEM'
      FixedChar = True
    end
  end
  object cdsItensProt: TClientDataSet
    Aggregates = <>
    DataSetField = cdsTarefasProtsqlItensProt
    Params = <>
    Left = 248
    Top = 13
    object cdsItensProtKZOO_TAREFA_ITEM: TStringField
      FieldName = 'KZOO_TAREFA_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsItensProtKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsItensProtITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 52
      FieldName = 'ITEM'
      Required = True
      Size = 128
    end
    object cdsItensProtQTDE: TIntegerField
      DisplayLabel = 'Qtde'
      DisplayWidth = 4
      FieldName = 'QTDE'
    end
    object cdsItensProtKDEF_TAREFA_ITEM: TStringField
      FieldName = 'KDEF_TAREFA_ITEM'
      FixedChar = True
    end
  end
  object cdsTmpProtocolos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsProtocolosTarefasProtocolos
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    OnCalcFields = cdsTmpProtocolosCalcFields
    Left = 142
    Top = 226
    object cdsTmpProtocolosKDEF_PROTOCOLO: TStringField
      FieldName = 'KDEF_PROTOCOLO'
      FixedChar = True
    end
    object cdsTmpProtocolosTIPOPROTOCOLO: TIntegerField
      FieldName = 'TIPOPROTOCOLO'
      Required = True
    end
    object cdsTmpProtocolosIMPORT: TSmallintField
      DisplayLabel = 'Importar'
      FieldKind = fkInternalCalc
      FieldName = 'IMPORT'
      Required = True
      OnGetText = cdsTmpProtocolosIMPORTGetText
    end
    object cdsTmpProtocolosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsTmpProtocolosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsTmpProtocolosEXISTS: TSmallintField
      FieldKind = fkInternalCalc
      FieldName = 'EXISTS'
    end
    object cdsTmpProtocolossqlTarefas: TDataSetField
      DisplayLabel = 'Tarefas'
      FieldName = 'sqlTarefas'
    end
  end
  object cdsTmpTarefas: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProtocolosTarefasTarefas
    Params = <>
    OnCalcFields = cdsTmpTarefasCalcFields
    Left = 143
    Top = 279
    object cdsTmpTarefasKDEF_TAREFA: TStringField
      FieldName = 'KDEF_TAREFA'
      FixedChar = True
    end
    object cdsTmpTarefasTIPOTAREFA: TIntegerField
      FieldName = 'TIPOTAREFA'
      Required = True
    end
    object cdsTmpTarefasCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsTmpTarefasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsTmpTarefasDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsTmpTarefasATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTmpTarefasDESCARTECARNE: TIntegerField
      FieldName = 'DESCARTECARNE'
    end
    object cdsTmpTarefasDESCARTELEITE: TIntegerField
      FieldName = 'DESCARTELEITE'
    end
    object cdsTmpTarefasINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTmpTarefasIMPORT: TSmallintField
      DisplayLabel = 'Importar'
      FieldKind = fkInternalCalc
      FieldName = 'IMPORT'
      Required = True
      OnGetText = cdsTmpTarefasIMPORTGetText
    end
    object cdsTmpTarefasEXISTS: TSmallintField
      FieldKind = fkInternalCalc
      FieldName = 'EXISTS'
    end
    object cdsTmpTarefassqlItens: TDataSetField
      DisplayLabel = 'Itens da tarefa'
      FieldName = 'sqlItens'
    end
  end
  object cdsTmpItens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsTmpTarefassqlItens
    Params = <>
    Left = 243
    Top = 280
    object cdsTmpItensKDEF_TAREFA_ITEM: TStringField
      FieldName = 'KDEF_TAREFA_ITEM'
      FixedChar = True
    end
    object cdsTmpItensITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 52
      FieldName = 'ITEM'
      Required = True
      Size = 128
    end
    object cdsTmpItensQTDE: TIntegerField
      DisplayLabel = 'Qtde'
      DisplayWidth = 4
      FieldName = 'QTDE'
    end
  end
  object sqlTarefas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  T.KZOO_TAREFA, '#13#10'  T.KCAD_FAZENDA,'#13#10'  T.TIPOTAREFA,'#13#10 +
      '  T.CODIGO, '#13#10'  T.NOME, '#13#10'  T.DESCRICAO, '#13#10'  T.ATIVO, '#13#10'  T.DESC' +
      'ARTECARNE, '#13#10'  T.DESCARTELEITE, '#13#10'  T.INTERNAL,'#13#10'  T.KDEF_TAREFA' +
      #13#10'FROM ZOO_TAREFAS T'#13#10'WHERE T.KCAD_FAZENDA = :KCAD_FAZENDA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 417
    Top = 99
    object sqlTarefasKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlTarefasKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlTarefasTIPOTAREFA: TIntegerField
      FieldName = 'TIPOTAREFA'
      Required = True
    end
    object sqlTarefasCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlTarefasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlTarefasDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlTarefasATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlTarefasDESCARTECARNE: TIntegerField
      FieldName = 'DESCARTECARNE'
    end
    object sqlTarefasDESCARTELEITE: TIntegerField
      FieldName = 'DESCARTELEITE'
    end
    object sqlTarefasINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlTarefasKDEF_TAREFA: TStringField
      FieldName = 'KDEF_TAREFA'
      FixedChar = True
    end
  end
  object cdsTarefas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspTarefas'
    BeforeOpen = cdsTarefasBeforeOpen
    OnCalcFields = cdsTarefasCalcFields
    Left = 415
    Top = 12
    object cdsTarefasKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsTarefasKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsTarefasTIPOTAREFA: TIntegerField
      FieldName = 'TIPOTAREFA'
      Required = True
    end
    object cdsTarefasCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsTarefasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsTarefasDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsTarefasATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTarefasDESCARTECARNE: TIntegerField
      FieldName = 'DESCARTECARNE'
    end
    object cdsTarefasDESCARTELEITE: TIntegerField
      FieldName = 'DESCARTELEITE'
    end
    object cdsTarefasINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTarefasEXPORT: TSmallintField
      DisplayLabel = 'Exportar'
      FieldKind = fkInternalCalc
      FieldName = 'EXPORT'
      Required = True
      OnGetText = cdsTarefasEXPORTGetText
    end
    object cdsTarefasKDEF_TAREFA: TStringField
      FieldName = 'KDEF_TAREFA'
      FixedChar = True
    end
    object cdsTarefassqlItens: TDataSetField
      DisplayLabel = 'Itens da tarefa'
      FieldName = 'sqlItens'
    end
  end
  object sqlItens: TTcSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select  '#13#10' KZOO_TAREFA_ITEM, '#13#10' KZOO_TAREFA, '#13#10' ITEM, '#13#10' QTDE,'#13#10 +
      ' KDEF_TAREFA_ITEM'#13#10'from ZOO_TAREFA_ITENS'#13#10'WHERE KZOO_TAREFA = :K' +
      'ZOO_TAREFA'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsSQLTarefas
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 473
    Top = 100
    object sqlItensKZOO_TAREFA_ITEM: TStringField
      FieldName = 'KZOO_TAREFA_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlItensKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlItensITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      Required = True
      Size = 128
    end
    object sqlItensQTDE: TIntegerField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
    end
    object sqlItensKDEF_TAREFA_ITEM: TStringField
      FieldName = 'KDEF_TAREFA_ITEM'
      FixedChar = True
    end
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsTarefassqlItens
    Params = <>
    Left = 473
    Top = 12
    object cdsItensKZOO_TAREFA_ITEM: TStringField
      FieldName = 'KZOO_TAREFA_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsItensKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsItensITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 52
      FieldName = 'ITEM'
      Required = True
      Size = 128
    end
    object cdsItensQTDE: TIntegerField
      DisplayLabel = 'Qtde'
      DisplayWidth = 4
      FieldName = 'QTDE'
    end
    object cdsItensKDEF_TAREFA_ITEM: TStringField
      FieldName = 'KDEF_TAREFA_ITEM'
      FixedChar = True
    end
  end
  object dspTarefas: TDataSetProvider
    DataSet = sqlTarefas
    UpdateMode = upWhereKeyOnly
    Left = 364
    Top = 62
  end
  object cdsTmpTarefasProt: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsTmpProtocolossqlTarefas
    Params = <>
    Left = 241
    Top = 228
    object cdsTmpTarefasProtKDEF_TAREFA: TStringField
      FieldName = 'KDEF_TAREFA'
      FixedChar = True
    end
    object cdsTmpTarefasProtTIPOTAREFA: TIntegerField
      FieldName = 'TIPOTAREFA'
      Required = True
    end
    object cdsTmpTarefasProtCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsTmpTarefasProtNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsTmpTarefasProtATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsTmpTarefasProtDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsTmpTarefasProtDESCARTECARNE: TIntegerField
      FieldName = 'DESCARTECARNE'
    end
    object cdsTmpTarefasProtDESCARTELEITE: TIntegerField
      FieldName = 'DESCARTELEITE'
    end
    object cdsTmpTarefasProtINTERNAL: TStringField
      FieldName = 'INTERNAL'
      FixedChar = True
      Size = 1
    end
    object cdsTmpTarefasProtDIA: TIntegerField
      FieldName = 'DIA'
    end
    object cdsTmpTarefasProtVEZES: TIntegerField
      FieldName = 'VEZES'
    end
    object cdsTmpTarefasProtREPLICAR: TIntegerField
      FieldName = 'REPLICAR'
    end
    object cdsTmpTarefasProtINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object cdsTmpTarefasProtOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsTmpTarefasProtEXISTS: TSmallintField
      FieldKind = fkInternalCalc
      FieldName = 'EXISTS'
    end
    object cdsTmpTarefasProtKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Visible = False
      FixedChar = True
    end
    object cdsTmpTarefasProtsqlItens: TDataSetField
      DisplayLabel = 'Itens da tarefa'
      FieldName = 'sqlItens'
    end
  end
  object cdsTmpItensProt: TClientDataSet
    Aggregates = <>
    DataSetField = cdsTmpTarefasProtsqlItens
    Params = <>
    Left = 339
    Top = 229
    object cdsTmpItensProtKDEF_TAREFA_ITEM: TStringField
      FieldName = 'KDEF_TAREFA_ITEM'
      FixedChar = True
    end
    object cdsTmpItensProtITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 52
      FieldName = 'ITEM'
      Required = True
      Size = 128
    end
    object cdsTmpItensProtQTDE: TIntegerField
      DisplayLabel = 'Qtde'
      DisplayWidth = 4
      FieldName = 'QTDE'
    end
  end
  object cdsProtocolosTarefas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 44
    Top = 256
    object cdsProtocolosTarefasProtocolos: TDataSetField
      FieldName = 'Protocolos'
    end
    object cdsProtocolosTarefasTarefas: TDataSetField
      FieldName = 'Tarefas'
    end
  end
  object dtsSQLTarefas: TDataSource
    DataSet = sqlTarefas
    Left = 448
    Top = 148
  end
  object cdsRelacaoProtocoloTarefa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelacaoProtocoloTarefa'
    Left = 584
    Top = 240
    object cdsRelacaoProtocoloTarefaKZOO_PROTOCOLO_TAREFA: TStringField
      FieldName = 'KZOO_PROTOCOLO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsRelacaoProtocoloTarefaKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object cdsRelacaoProtocoloTarefaKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      FixedChar = True
    end
    object cdsRelacaoProtocoloTarefaDIA: TIntegerField
      FieldName = 'DIA'
    end
    object cdsRelacaoProtocoloTarefaVEZES: TIntegerField
      FieldName = 'VEZES'
    end
    object cdsRelacaoProtocoloTarefaREPLICAR: TIntegerField
      FieldName = 'REPLICAR'
    end
    object cdsRelacaoProtocoloTarefaINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object cdsRelacaoProtocoloTarefaOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspRelacaoProtocoloTarefa: TDataSetProvider
    DataSet = sqlRelacaoProtocoloTarefa
    UpdateMode = upWhereKeyOnly
    Left = 528
    Top = 288
  end
  object sqlRelacaoProtocoloTarefa: TTcSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT '#13#10'  PT.KZOO_PROTOCOLO_TAREFA,'#13#10'  PT.KZOO_PROTOCOLO,'#13#10'  PT' +
      '.KZOO_TAREFA,'#13#10'  PT.DIA,'#13#10'  PT.VEZES,'#13#10'  PT.REPLICAR, '#13#10'  PT.INT' +
      'ERVALO, '#13#10'  PT.OBS'#13#10'FROM ZOO_PROTOCOLO_TAREFAS PT'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 584
    Top = 333
    object sqlRelacaoProtocoloTarefaKZOO_PROTOCOLO_TAREFA: TStringField
      FieldName = 'KZOO_PROTOCOLO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlRelacaoProtocoloTarefaKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object sqlRelacaoProtocoloTarefaKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      FixedChar = True
    end
    object sqlRelacaoProtocoloTarefaDIA: TIntegerField
      FieldName = 'DIA'
    end
    object sqlRelacaoProtocoloTarefaVEZES: TIntegerField
      FieldName = 'VEZES'
    end
    object sqlRelacaoProtocoloTarefaREPLICAR: TIntegerField
      FieldName = 'REPLICAR'
    end
    object sqlRelacaoProtocoloTarefaINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object sqlRelacaoProtocoloTarefaOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
end
