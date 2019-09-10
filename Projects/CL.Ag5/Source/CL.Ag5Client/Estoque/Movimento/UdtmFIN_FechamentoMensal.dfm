object dtmFIN_FechamentoMensal: TdtmFIN_FechamentoMensal
  OldCreateOrder = True
  Height = 274
  Width = 550
  object cdsLstFechamentoMensal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstFechamentoMensal'
    BeforeOpen = cdsLstFechamentoMensalBeforeOpen
    OnNewRecord = cdsLstFechamentoMensalNewRecord
    Left = 55
    Top = 44
    object cdsLstFechamentoMensalKEST_ENCERRAMENTO_MES: TStringField
      DisplayWidth = 33
      FieldName = 'KEST_ENCERRAMENTO_MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsLstFechamentoMensalANO_MES: TStringField
      DisplayWidth = 13
      FieldName = 'ANO_MES'
      Required = True
      OnGetText = cdsLstFechamentoMensalANO_MESGetText
      FixedChar = True
      Size = 8
    end
    object cdsLstFechamentoMensalENCERRADO: TStringField
      DisplayWidth = 15
      FieldName = 'ENCERRADO'
      Required = True
      OnGetText = cdsLstFechamentoMensalENCERRADOGetText
      FixedChar = True
      Size = 1
    end
    object cdsLstFechamentoMensalDATA_STATUS: TSQLTimeStampField
      DisplayWidth = 55
      FieldName = 'DATA_STATUS'
    end
  end
  object cdsFechamentoMensal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KEST_ENCERRAMENTO_MES'
        ParamType = ptInput
      end>
    ProviderName = 'dspFechamentoMensal'
    OnNewRecord = cdsFechamentoMensalNewRecord
    Left = 227
    Top = 44
    object cdsFechamentoMensalKEST_ENCERRAMENTO_MES: TStringField
      FieldName = 'KEST_ENCERRAMENTO_MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsFechamentoMensalANO_MES: TStringField
      FieldName = 'ANO_MES'
      Required = True
      FixedChar = True
      Size = 8
    end
    object cdsFechamentoMensalENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFechamentoMensalDATA_STATUS: TSQLTimeStampField
      FieldName = 'DATA_STATUS'
    end
    object cdsFechamentoMensalsqlFechamentoProdutos: TDataSetField
      FieldName = 'sqlFechamentoProdutos'
    end
  end
  object dspLstFechamentoMensal: TDataSetProvider
    DataSet = sqlLstFechamentoMensal
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object dspFechamentoMensal: TDataSetProvider
    DataSet = sqlFechamentoMensal
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 187
    Top = 89
  end
  object sqlLstFechamentoMensal: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '    KEST_ENCERRAMENTO_MES,'
      '    ANO_MES,'
      '    ENCERRADO,'
      '    DATA_STATUS'
      'FROM EST_ENCERRAMENTO_MES'
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      'ORDER BY ANO_MES DESC')
    Left = 58
    Top = 133
    object sqlLstFechamentoMensalKEST_ENCERRAMENTO_MES: TStringField
      FieldName = 'KEST_ENCERRAMENTO_MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlLstFechamentoMensalANO_MES: TStringField
      FieldName = 'ANO_MES'
      Required = True
      FixedChar = True
      Size = 8
    end
    object sqlLstFechamentoMensalENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlLstFechamentoMensalDATA_STATUS: TSQLTimeStampField
      FieldName = 'DATA_STATUS'
    end
  end
  object sqlFechamentoMensal: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KEST_ENCERRAMENTO_MES'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '    KEST_ENCERRAMENTO_MES,'
      '    ANO_MES,'
      '    ENCERRADO,'
      '    DATA_STATUS'
      'FROM EST_ENCERRAMENTO_MES'
      'WHERE KEST_ENCERRAMENTO_MES = :KEST_ENCERRAMENTO_MES')
    Left = 222
    Top = 132
    object sqlFechamentoMensalKEST_ENCERRAMENTO_MES: TStringField
      FieldName = 'KEST_ENCERRAMENTO_MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlFechamentoMensalANO_MES: TStringField
      FieldName = 'ANO_MES'
      Required = True
      FixedChar = True
      Size = 6
    end
    object sqlFechamentoMensalENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFechamentoMensalDATA_STATUS: TSQLTimeStampField
      FieldName = 'DATA_STATUS'
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstFechamentoMensal
    Left = 120
    Top = 8
  end
  object dtsFechamentoMensal: TDataSource
    DataSet = sqlFechamentoMensal
    Left = 264
    Top = 184
  end
  object cdsFechamentoProdutos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsFechamentoMensalsqlFechamentoProdutos
    Params = <>
    AfterOpen = cdsFechamentoProdutosAfterOpen
    Left = 348
    Top = 44
    object cdsFechamentoProdutosKEST_ENCERRAMENTO_MES: TStringField
      FieldName = 'KEST_ENCERRAMENTO_MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsFechamentoProdutosKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsFechamentoProdutosNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsFechamentoProdutosQTDE_ESTOQUE: TFloatField
      DisplayLabel = 'Qtde Total'
      FieldName = 'QTDE_ESTOQUE'
      DisplayFormat = '#,0'
    end
    object cdsFechamentoProdutosCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
      DisplayFormat = '#,0.00'
    end
    object cdsFechamentoProdutosVALOR_ESTOQUE: TFloatField
      FieldName = 'VALOR_ESTOQUE'
      DisplayFormat = '#,0.00'
    end
    object cdsFechamentoProdutosSOMA_VALOR_ESTOQUE: TAggregateField
      FieldName = 'SOMA_VALOR_ESTOQUE'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM( VALOR_ESTOQUE )'
    end
  end
  object sqlFechamentoProdutos: TTcSQLDataSet
    SchemaName = 'sysdba'
    DataSource = dtsFechamentoMensal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KEST_ENCERRAMENTO_MES'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select '
      '  EP.KEST_ENCERRAMENTO_MES, '
      '  EP.KEST_PRODUTO,  '
      '  EP.NOME, '
      '  EP.QTDE_ESTOQUE, '
      '  EP.CUSTO_MEDIO, '
      '  EP.VALOR_ESTOQUE'
      'from EST_ENCERRAMENTO_MES_PRODUTOS EP'
      'left join EST_PRODUTOS P ON P.KEST_PRODUTO = EP.KEST_PRODUTO'
      'WHERE EP.KEST_ENCERRAMENTO_MES = :KEST_ENCERRAMENTO_MES'
      '  AND ( P.ATIVO = '#39'T'#39' )')
    Left = 352
    Top = 140
    object sqlFechamentoProdutosKEST_ENCERRAMENTO_MES: TStringField
      FieldName = 'KEST_ENCERRAMENTO_MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlFechamentoProdutosKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlFechamentoProdutosNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlFechamentoProdutosQTDE_ESTOQUE: TFloatField
      DisplayLabel = 'Qtde total em estoque'
      FieldName = 'QTDE_ESTOQUE'
      DisplayFormat = '#,0'
    end
    object sqlFechamentoProdutosCUSTO_MEDIO: TFloatField
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO_MEDIO'
      DisplayFormat = '#,0.00'
    end
    object sqlFechamentoProdutosVALOR_ESTOQUE: TFloatField
      DisplayLabel = 'Valor total estoque'
      FieldName = 'VALOR_ESTOQUE'
      DisplayFormat = '#,0.00'
    end
  end
end
