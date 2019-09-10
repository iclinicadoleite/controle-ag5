object Zoo_CfgExamesDatamodule: TZoo_CfgExamesDatamodule
  OldCreateOrder = True
  Height = 274
  Width = 550
  object cdsLstExames: TClientDataSet
    Aggregates = <>
    Filter = 'ATIVO = '#39'T'#39
    Filtered = True
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstExames'
    BeforeOpen = cdsLstExamesBeforeOpen
    OnNewRecord = cdsLstExamesNewRecord
    Left = 55
    Top = 44
    object cdsLstExamesKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstExamesCODIGO: TStringField
      DisplayLabel = 'Exame'
      DisplayWidth = 32
      FieldName = 'CODIGO'
      ReadOnly = True
      Size = 32
    end
    object cdsLstExamesNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 128
      FieldName = 'NOME'
      ReadOnly = True
      Size = 128
    end
    object cdsLstExamesTIPOTAREFA: TIntegerField
      DisplayLabel = 'Tipo exame'
      FieldName = 'TIPOTAREFA'
      ReadOnly = True
      Visible = False
    end
    object cdsLstExamesDESCARTECARNE: TIntegerField
      DisplayLabel = 'Descarte carne'
      DisplayWidth = 9
      FieldName = 'DESCARTECARNE'
      Visible = False
      OnSetText = cdsLstExamesDESCARTECARNESetText
    end
    object cdsLstExamesDESCARTELEITE: TIntegerField
      DisplayLabel = 'Descarte leite'
      DisplayWidth = 9
      FieldName = 'DESCARTELEITE'
      Visible = False
      OnSetText = cdsLstExamesDESCARTELEITESetText
    end
    object cdsLstExamesATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 1
      FieldName = 'ATIVO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsLstExamesNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Respons'#225'vel'
      DisplayWidth = 128
      FieldName = 'NOMEFUNCIONARIO'
      ReadOnly = True
      Visible = False
      Size = 128
    end
    object cdsLstExamesSYSUI: TStringField
      DisplayLabel = 'Incluido por'
      DisplayWidth = 8
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 32
    end
    object cdsLstExamesSYSDI: TSQLTimeStampField
      DisplayLabel = 'Incluido em'
      DisplayWidth = 9
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsLstExamesSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      DisplayWidth = 8
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 32
    end
    object cdsLstExamesSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      DisplayWidth = 9
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
  end
  object cdsExame: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExame'
    BeforeInsert = cdsExameBeforeInsert
    BeforeEdit = cdsExameBeforeEdit
    BeforeDelete = cdsExameBeforeDelete
    OnNewRecord = cdsExameNewRecord
    Left = 183
    Top = 44
    object cdsExameKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsExameKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsExameCODIGO: TStringField
      DisplayLabel = 'Exame'
      FieldName = 'CODIGO'
      Required = True
      OnSetText = cdsExameCODIGOSetText
      OnValidate = cdsExameCODIGOValidate
      Size = 32
    end
    object cdsExameNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Required = True
      OnSetText = cdsExameNOMESetText
      OnValidate = cdsExameNOMEValidate
      Size = 128
    end
    object cdsExameDESCARTECARNE: TIntegerField
      DisplayLabel = 'Descarte de carne'
      FieldName = 'DESCARTECARNE'
    end
    object cdsExameDESCARTELEITE: TIntegerField
      DisplayLabel = 'Descarte de leite'
      FieldName = 'DESCARTELEITE'
    end
    object cdsExameDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsExameATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsExameKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object cdsExameNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = cdsExameNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsExameINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsExameTIPOTAREFA: TIntegerField
      DisplayLabel = 'Tipo tarefa'
      FieldName = 'TIPOTAREFA'
      Required = True
    end
    object cdsExamesqlItens: TDataSetField
      DisplayLabel = 'Itens'
      FieldName = 'sqlItens'
    end
    object cdsExamesqlResultados: TDataSetField
      FieldName = 'sqlResultados'
    end
  end
  object dspLstExames: TDataSetProvider
    DataSet = sqlLstExames
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object dspExame: TDataSetProvider
    DataSet = sqlExame
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 89
  end
  object sqlLstExames: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' T.KZOO_TAREFA,'#13#10' T.CODIGO, '#13#10' T.NOME,'#13#10' T.ATIVO,'#13#10' T.T' +
      'IPOTAREFA,'#13#10' T.DESCARTECARNE, '#13#10' T.DESCARTELEITE, '#13#10' IIF( T.KCAD' +
      '_FUNCIONARIO IS NULL, T.NOMEFUNCIONARIO, C.APELIDO ) NOMEFUNCION' +
      'ARIO,'#13#10' T.SYS$UI, '#13#10' T.SYS$DI, '#13#10' T.SYS$UU,'#13#10' T.SYS$DU'#13#10'FROM ZOO' +
      '_TAREFAS T'#13#10'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = T.KCA' +
      'D_FUNCIONARIO'#13#10'WHERE T.KCAD_FAZENDA = :KCAD_FAZENDA AND T.TIPOTA' +
      'REFA = -1'
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
    object sqlLstExamesKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstExamesCODIGO: TStringField
      DisplayLabel = 'Exame'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlLstExamesNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlLstExamesTIPOTAREFA: TIntegerField
      DisplayLabel = 'Tipo exame'
      FieldName = 'TIPOTAREFA'
      Visible = False
    end
    object sqlLstExamesDESCARTECARNE: TIntegerField
      DisplayLabel = 'Descarte carne'
      FieldName = 'DESCARTECARNE'
      Visible = False
    end
    object sqlLstExamesDESCARTELEITE: TIntegerField
      DisplayLabel = 'Descarte leite'
      FieldName = 'DESCARTELEITE'
      Visible = False
    end
    object sqlLstExamesATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object sqlLstExamesNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'NOMEFUNCIONARIO'
      Visible = False
      Size = 128
    end
    object sqlLstExamesSYSUI: TStringField
      FieldName = 'SYS$UI'
      Size = 32
    end
    object sqlLstExamesSYSDI: TSQLTimeStampField
      FieldName = 'SYS$DI'
    end
    object sqlLstExamesSYSUU: TStringField
      FieldName = 'SYS$UU'
      Size = 32
    end
    object sqlLstExamesSYSDU: TSQLTimeStampField
      FieldName = 'SYS$DU'
    end
  end
  object sqlExame: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' T.KZOO_TAREFA, '#13#10' T.KCAD_FAZENDA, '#13#10' T.CODIGO,  '#13#10' T.N' +
      'OME,'#13#10' T.TIPOTAREFA,'#13#10' T.DESCARTECARNE, '#13#10' T.DESCARTELEITE, '#13#10' T' +
      '.DESCRICAO, '#13#10' T.KCAD_FUNCIONARIO,'#13#10' IIF( T.KCAD_FUNCIONARIO IS ' +
      'NULL, T.NOMEFUNCIONARIO, C.APELIDO ) NOMEFUNCIONARIO,'#13#10' T.ATIVO,' +
      ' '#13#10' T.INTERNAL'#13#10'FROM ZOO_TAREFAS T'#13#10'LEFT JOIN CAD_ENTIDADES C ON' +
      ' C.KCAD_ENTIDADE = T.KCAD_FUNCIONARIO'#13#10'WHERE T.KZOO_TAREFA = :KZ' +
      'OO_TAREFA'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 178
    Top = 132
    object sqlExameKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlExameKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlExameCODIGO: TStringField
      DisplayLabel = 'Exame'
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlExameNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlExameDESCARTECARNE: TIntegerField
      DisplayLabel = 'Descarte de carne'
      FieldName = 'DESCARTECARNE'
    end
    object sqlExameDESCARTELEITE: TIntegerField
      DisplayLabel = 'Descarte de leite'
      FieldName = 'DESCARTELEITE'
    end
    object sqlExameDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlExameATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlExameKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlExameNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = sqlExameNOMEFUNCIONARIOSetText
      Size = 128
    end
    object sqlExameINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlExameTIPOTAREFA: TIntegerField
      DisplayLabel = 'Tipo tarefa'
      FieldName = 'TIPOTAREFA'
      Required = True
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstExames
    Left = 120
    Top = 8
  end
  object dtsSQLEdit: TDataSource
    DataSet = sqlExame
    Left = 219
    Top = 179
  end
  object sqlItens: TTcSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select  '#13#10' KZOO_TAREFA_ITEM, '#13#10' KZOO_TAREFA, '#13#10' ITEM, '#13#10' QTDE,'#13#10 +
      ' ATIVO,'#13#10' INTERNAL'#13#10'from ZOO_TAREFA_ITENS'#13#10'WHERE KZOO_TAREFA = :' +
      'KZOO_TAREFA'
    DataSource = dtsSQLEdit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 276
    Top = 132
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
      DisplayLabel = #205'tem'
      FieldName = 'ITEM'
      Required = True
      Size = 128
    end
    object sqlItensQTDE: TIntegerField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
    end
    object sqlItensATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlItensINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsExamesqlItens
    Params = <>
    BeforeInsert = cdsItensBeforeInsert
    OnNewRecord = cdsItensNewRecord
    Left = 276
    Top = 44
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
      DisplayLabel = #205'tem'
      DisplayWidth = 47
      FieldName = 'ITEM'
      Required = True
      OnSetText = cdsItensITEMSetText
      OnValidate = cdsItensITEMValidate
      Size = 128
    end
    object cdsItensQTDE: TIntegerField
      DisplayLabel = 'Qtde'
      DisplayWidth = 4
      FieldName = 'QTDE'
    end
    object cdsItensATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsItensINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object cdsResultados: TClientDataSet
    Aggregates = <>
    DataSetField = cdsExamesqlResultados
    Params = <>
    BeforeInsert = cdsResultadosBeforeInsert
    OnNewRecord = cdsResultadosNewRecord
    Left = 368
    Top = 48
    object cdsResultadosKZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsResultadosKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsResultadosNOME: TStringField
      DisplayLabel = 'Resultado'
      DisplayWidth = 50
      FieldName = 'NOME'
      Required = True
      OnSetText = cdsResultadosNOMESetText
      OnValidate = cdsResultadosNOMEValidate
      Size = 128
    end
    object cdsResultadosATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 1
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsResultadosINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object sqlResultados: TTcSQLDataSet
    CommandText = 
      'select  '#13#10' KZOO_TAREFA_RESULTADO, '#13#10' KZOO_TAREFA, '#13#10' NOME,'#13#10' ATI' +
      'VO,'#13#10' INTERNAL'#13#10'from ZOO_TAREFA_RESULTADOS'#13#10'WHERE KZOO_TAREFA = ' +
      ':KZOO_TAREFA'
    DataSource = dtsSQLEdit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 368
    Top = 136
    object sqlResultadosKZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      Required = True
      FixedChar = True
    end
    object sqlResultadosKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      FixedChar = True
    end
    object sqlResultadosNOME: TStringField
      DisplayLabel = 'Resultado'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlResultadosATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlResultadosINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
