object Zoo_CfgTarefasDatamodule: TZoo_CfgTarefasDatamodule
  OldCreateOrder = True
  Height = 274
  Width = 550
  object cdsTarefas: TClientDataSet
    Aggregates = <>
    Filter = 'ATIVO = '#39'T'#39
    Filtered = True
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspTarefas'
    BeforeOpen = cdsTarefasBeforeOpen
    BeforeInsert = cdsTarefasBeforeInsert
    BeforeEdit = cdsTarefasBeforeEdit
    BeforeDelete = cdsTarefasBeforeDelete
    OnNewRecord = cdsTarefasNewRecord
    Left = 55
    Top = 44
    object cdsTarefasKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsTarefasKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsTarefasCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      DisplayWidth = 8
      FieldName = 'CODIGO'
      OnSetText = cdsTarefasCODIGOSetText
      OnValidate = cdsTarefasCODIGOValidate
      Size = 32
    end
    object cdsTarefasNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 34
      FieldName = 'NOME'
      OnSetText = cdsTarefasNOMESetText
      OnValidate = cdsTarefasNOMEValidate
      Size = 128
    end
    object cdsTarefasTIPOTAREFA: TIntegerField
      FieldName = 'TIPOTAREFA'
      Visible = False
    end
    object cdsTarefasDESCARTECARNE: TIntegerField
      DisplayLabel = 'Descarte carne'
      DisplayWidth = 9
      FieldName = 'DESCARTECARNE'
    end
    object cdsTarefasDESCARTELEITE: TIntegerField
      DisplayLabel = 'Descarte leite'
      DisplayWidth = 9
      FieldName = 'DESCARTELEITE'
    end
    object cdsTarefasDESC_TIPOTAREFA: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 8
      FieldKind = fkLookup
      FieldName = 'DESC_TIPOTAREFA'
      LookupDataSet = cdsTiposTarefa
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOTAREFA'
      Size = 31
      Lookup = True
    end
    object cdsTarefasATIVO: TStringField
      DisplayLabel = 'Ativa'
      DisplayWidth = 4
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsTarefasNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Respons'#225'vel'
      DisplayWidth = 34
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = cdsTarefasNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsTarefasDESCRICAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsTarefasKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object cdsTarefasINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dspTarefas: TDataSetProvider
    DataSet = sqlTarefas
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object sqlTarefas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' T.KZOO_TAREFA, '#13#10' T.KCAD_FAZENDA, '#13#10' T.CODIGO,  '#13#10' T.N' +
      'OME,'#13#10' T.TIPOTAREFA,'#13#10' T.DESCARTECARNE, '#13#10' T.DESCARTELEITE, '#13#10' T' +
      '.DESCRICAO, '#13#10' T.KCAD_FUNCIONARIO,'#13#10' IIF( T.KCAD_FUNCIONARIO IS ' +
      'NULL, T.NOMEFUNCIONARIO, C.APELIDO ) NOMEFUNCIONARIO,'#13#10' T.ATIVO,' +
      ' '#13#10' T.INTERNAL'#13#10'FROM ZOO_TAREFAS T'#13#10'LEFT JOIN CAD_ENTIDADES C ON' +
      ' C.KCAD_ENTIDADE = T.KCAD_FUNCIONARIO'#13#10'WHERE T.KCAD_FAZENDA = :K' +
      'CAD_FAZENDA AND T.TIPOTAREFA > 0'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 58
    Top = 133
    object sqlTarefasKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlTarefasCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlTarefasNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlTarefasTIPOTAREFA: TIntegerField
      FieldName = 'TIPOTAREFA'
      Visible = False
    end
    object sqlTarefasDESCARTECARNE: TIntegerField
      DisplayLabel = 'Descarte carne'
      FieldName = 'DESCARTECARNE'
    end
    object sqlTarefasDESCARTELEITE: TIntegerField
      DisplayLabel = 'Descarte leite'
      FieldName = 'DESCARTELEITE'
    end
    object sqlTarefasATIVO: TStringField
      DisplayLabel = 'Ativa'
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object sqlTarefasNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlTarefasKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlTarefasDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlTarefasKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlTarefasINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsTiposTarefa: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 420
    Top = 8
    object cdsTiposTarefaTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTiposTarefaVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTiposTarefaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTiposTarefaORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
