object FIN_EntradaEstoqueDatamodule: TFIN_EntradaEstoqueDatamodule
  OldCreateOrder = True
  Height = 310
  Width = 726
  object cdsLstEstoque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstEstoque'
    OnCalcFields = cdsLstEstoqueCalcFields
    OnNewRecord = cdsLstEstoqueNewRecord
    Left = 55
    Top = 44
    object cdsLstEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField
      DisplayWidth = 6
      FieldName = 'KEST_OUTRA_ENTRADA_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstEstoqueKSYSDOMAIN: TStringField
      DisplayWidth = 6
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object cdsLstEstoqueCODIGO_LANCAMENTO: TStringField
      DisplayLabel = 'C'#243'digo lan'#231'amento'
      DisplayWidth = 7
      FieldName = 'CODIGO_LANCAMENTO'
      Size = 32
    end
    object cdsLstEstoqueDATA: TSQLTimeStampField
      DisplayLabel = 'Data entrada'
      DisplayWidth = 16
      FieldName = 'DATA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLstEstoqueTIPO: TStringField
      DisplayLabel = 'Tipo movimento'
      DisplayWidth = 1
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsLstEstoqueKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object cdsLstEstoqueNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 64
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsLstEstoqueCODIGO: TStringField
      DisplayLabel = 'C'#243'digo produto'
      DisplayWidth = 5
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsLstEstoqueNOME: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 22
      FieldName = 'NOME'
      Size = 128
    end
    object cdsLstEstoqueDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 4
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsLstEstoqueUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 5
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsLstEstoqueQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 4
      FieldName = 'QTDE'
      Required = True
      DisplayFormat = '#,00.##'
    end
    object cdsLstEstoqueCUSTO: TFloatField
      DisplayLabel = 'Valor unit'#225'rio'
      DisplayWidth = 5
      FieldName = 'CUSTO'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsLstEstoqueTOTAL: TFloatField
      DisplayLabel = 'Total'
      DisplayWidth = 5
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00'
    end
    object cdsLstEstoqueOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      DisplayWidth = 4
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspLstEstoque: TDataSetProvider
    DataSet = sqlLstEstoque
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object sqlLstEstoque: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  M.KEST_OUTRA_ENTRADA_SAIDA,'
      '  M.KSYS$DOMAIN,'
      '  M.CODIGO_LANCAMENTO,'
      '  M.DATA,'
      '  M.KCAD_ENTIDADE,'
      '  M.NOMEENTIDADE,'
      '  P.CODIGO,'
      '  P.NOME,'
      '  P.DESCRICAO,'
      '  P.UNIDADE,'
      '  M.TIPO,'
      '  M.QTDE,'
      '  M.CUSTO,'
      '  M.OBS FROM EST_OUTRAS_ENTRADAS_SAIDAS M'
      'LEFT JOIN EST_PRODUTOS P ON P.KEST_PRODUTO = M.KEST_PRODUTO'
      'WHERE M.KSYS$DOMAIN = :KSYS$DOMAIN'
      ' AND M.DATA BETWEEN :DI AND :DF'
      ' AND M.TIPO = '#39'E'#39)
    Left = 58
    Top = 133
    object sqlLstEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField
      FieldName = 'KEST_OUTRA_ENTRADA_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstEstoqueKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object sqlLstEstoqueCODIGO_LANCAMENTO: TStringField
      DisplayLabel = 'C'#243'digo lan'#231'amento'
      FieldName = 'CODIGO_LANCAMENTO'
      Size = 32
    end
    object sqlLstEstoqueKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object sqlLstEstoqueNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlLstEstoqueDATA: TSQLTimeStampField
      DisplayLabel = 'Data entrada'
      FieldName = 'DATA'
      Required = True
    end
    object sqlLstEstoqueCODIGO: TStringField
      DisplayLabel = 'C'#243'digo produto'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlLstEstoqueNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlLstEstoqueDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlLstEstoqueUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlLstEstoqueTIPO: TStringField
      DisplayLabel = 'Tipo movimento'
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlLstEstoqueQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Required = True
      DisplayFormat = '#,00.##'
    end
    object sqlLstEstoqueCUSTO: TFloatField
      DisplayLabel = 'Valor unit'#225'rio'
      FieldName = 'CUSTO'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object sqlLstEstoqueOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstEstoque
    Left = 120
    Top = 8
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Constraints = <
      item
        CustomConstraint = 'QTDE > 0'
        ErrorMessage = 'Quantidade deve ser maior que 0.'
        FromDictionary = False
      end
      item
        CustomConstraint = 'CUSTO > 0'
        ErrorMessage = 'Custo deve ser maior que 0.'
        FromDictionary = False
      end>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KEST_OUTRA_ENTRADA_SAIDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspEstoque'
    BeforeInsert = cdsEstoqueBeforeInsert
    BeforePost = cdsEstoqueBeforePost
    AfterCancel = cdsEstoqueAfterCancel
    OnCalcFields = cdsEstoqueCalcFields
    OnNewRecord = cdsEstoqueNewRecord
    Left = 215
    Top = 44
    object cdsEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField
      FieldName = 'KEST_OUTRA_ENTRADA_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEstoqueKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object cdsEstoqueCODIGO_LANCAMENTO: TStringField
      DisplayLabel = 'C'#243'digo lan'#231'amento'
      FieldName = 'CODIGO_LANCAMENTO'
      Size = 32
    end
    object cdsEstoqueDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
      OnValidate = cdsEstoqueDATAValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsEstoqueKCAD_ENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object cdsEstoqueNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      OnSetText = cdsEstoqueNOMEENTIDADESetText
      Size = 128
    end
    object cdsEstoqueKEST_PRODUTO: TStringField
      DisplayLabel = 'Produto/Insumo'
      FieldName = 'KEST_PRODUTO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEstoqueCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
      Size = 32
    end
    object cdsEstoqueNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      OnSetText = cdsEstoqueNOMESetText
      Size = 128
    end
    object cdsEstoqueDESCRICAO: TMemoField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 1
    end
    object cdsEstoqueUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 32
    end
    object cdsEstoqueTIPO: TStringField
      DisplayLabel = 'Tipo lan'#231'amento'
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEstoqueQTDE: TFloatField
      CustomConstraint = 'X > 0'
      ConstraintErrorMessage = 'Quantidade deve ser maior que 0.'
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Required = True
      OnValidate = cdsEstoqueQTDEValidate
    end
    object cdsEstoqueCUSTO: TFloatField
      CustomConstraint = 'X > 0'
      ConstraintErrorMessage = 'Custo deve ser maior que 0.'
      DisplayLabel = 'Custo'
      FieldName = 'CUSTO'
      Required = True
      OnValidate = cdsEstoqueCUSTOValidate
      DisplayFormat = '#,0.00'
    end
    object cdsEstoqueOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsEstoqueKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object cdsEstoqueDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsEstoqueDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      OnGetText = cdsEstoqueDESCR_PC_CLASSIFICACAOGetText
      Size = 32
    end
    object cdsEstoqueDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object cdsEstoqueDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsEstoqueTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00'
    end
    object cdsEstoquesqlApropriacao: TDataSetField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'sqlApropriacao'
    end
    object cdsEstoqueCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.00'
    end
    object cdsEstoqueQTDE_PRODUTO: TFloatField
      FieldName = 'QTDE_PRODUTO'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.00'
    end
    object cdsEstoqueQTDE_MINIMA: TFloatField
      FieldName = 'QTDE_MINIMA'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.00'
    end
    object cdsEstoqueTOTAL_ESTOQUE: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL_ESTOQUE'
      DisplayFormat = '#,0.00'
    end
  end
  object dspEstoque: TDataSetProvider
    DataSet = sqlEstoque
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 175
    Top = 89
  end
  object sqlEstoque: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftUnknown
        Name = 'KEST_OUTRA_ENTRADA_SAIDAS'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  M.KEST_OUTRA_ENTRADA_SAIDA,'
      '  M.KSYS$DOMAIN,'
      '  M.CODIGO_LANCAMENTO,'
      '  M.DATA,'
      '  M.KCAD_ENTIDADE,'
      '  M.NOMEENTIDADE,'
      '  M.KEST_PRODUTO,'
      '  P.CODIGO,'
      '  P.NOME,'
      '  P.DESCRICAO,'
      '  P.UNIDADE,'
      '  M.TIPO,'
      '  M.QTDE, '
      '  M.CUSTO, '
      '  P.CUSTO_MEDIO,'
      '  P.QTDE_PRODUTO,'
      '  P.QTDE_MINIMA,'
      'M.OBS, '
      '  M.KFIN_PLANOCONTA,'
      '  PL.NOME DESCR_PC_NOME,'
      '  PL.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  PL.CODIGO DESCR_PC_CODIGO,'
      '  PL.TIPO_APRD DESCR_PC_TIPO_APRD'
      'FROM EST_OUTRAS_ENTRADAS_SAIDAS M'
      'LEFT JOIN EST_PRODUTOS P ON P.KEST_PRODUTO = M.KEST_PRODUTO'
      
        'LEFT JOIN FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = M.KFIN_PLAN' +
        'OCONTA'
      'WHERE KEST_OUTRA_ENTRADA_SAIDA = :KEST_OUTRA_ENTRADA_SAIDAS')
    Left = 216
    Top = 132
    object sqlEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField
      FieldName = 'KEST_OUTRA_ENTRADA_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEstoqueKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object sqlEstoqueCODIGO_LANCAMENTO: TStringField
      DisplayLabel = 'C'#243'digo lan'#231'amento'
      FieldName = 'CODIGO_LANCAMENTO'
      Size = 32
    end
    object sqlEstoqueDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlEstoqueKCAD_ENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object sqlEstoqueNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlEstoqueKEST_PRODUTO: TStringField
      DisplayLabel = 'Produto/Insumo'
      FieldName = 'KEST_PRODUTO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEstoqueCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
      Size = 32
    end
    object sqlEstoqueNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 128
    end
    object sqlEstoqueDESCRICAO: TMemoField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 1
    end
    object sqlEstoqueUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 32
    end
    object sqlEstoqueTIPO: TStringField
      DisplayLabel = 'Tipo lan'#231'amento'
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlEstoqueQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Required = True
    end
    object sqlEstoqueCUSTO: TFloatField
      DisplayLabel = 'Custo'
      FieldName = 'CUSTO'
      Required = True
    end
    object sqlEstoqueOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlEstoqueKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlEstoqueDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlEstoqueDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlEstoqueDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object sqlEstoqueDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object sqlEstoqueCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
      ProviderFlags = [pfInWhere]
    end
    object sqlEstoqueQTDE_PRODUTO: TFloatField
      FieldName = 'QTDE_PRODUTO'
      ProviderFlags = [pfInWhere]
    end
    object sqlEstoqueQTDE_MINIMA: TFloatField
      FieldName = 'QTDE_MINIMA'
      ProviderFlags = [pfInWhere]
    end
  end
  object sqlApropriacao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsEstoque
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'KEST_OUTRA_ENTRADA_SAIDA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    A.KFIN_APROPRIACAO,'
      '    A.TABLENAME,'
      '    A.TABLEKEY,'
      '    A.KFIN_CENTROCUSTO,     '
      '    C.NOME,  '
      '    C.CODIGO, '
      '    C.CLASSIFICACAO,  '
      '    A.PORCENTAGEM'
      'FROM FIN_APROPRIACAO A'
      
        'LEFT JOIN FIN_CENTROSCUSTO C ON C.KFIN_CENTROCUSTO = A.KFIN_CENT' +
        'ROCUSTO'
      'WHERE A.TABLENAME = '#39'EST_OUTRAS_ENTRADAS_SAIDAS'#39' '
      '  AND A.TABLEKEY = :KEST_OUTRA_ENTRADA_SAIDA')
    Left = 315
    Top = 135
    object sqlApropriacaoKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApropriacaoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object sqlApropriacaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object sqlApropriacaoCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlApropriacaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlApropriacaoPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApropriacaoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
  end
  object dtsEstoque: TDataSource
    DataSet = sqlEstoque
    Left = 264
    Top = 181
  end
  object cdsApropriacao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsEstoquesqlApropriacao
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    Left = 313
    Top = 46
    object cdsApropriacaoKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsApropriacaoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object cdsApropriacaoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cdsApropriacaoCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object cdsApropriacaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsApropriacaoPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object cdsApropriacaoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsApropriacaoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsApropriacaoTOTAL_PORCENTAGEM: TAggregateField
      DisplayLabel = 'Total porcentagem'
      FieldName = 'TOTAL_PORCENTAGEM'
      ProviderFlags = [pfInWhere]
      Active = True
      DisplayName = ''
      Expression = 'SUM(PORCENTAGEM)'
    end
  end
end
