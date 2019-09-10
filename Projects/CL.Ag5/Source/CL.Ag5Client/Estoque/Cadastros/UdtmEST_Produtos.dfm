object dtmEST_Produtos: TdtmEST_Produtos
  OldCreateOrder = True
  Height = 274
  Width = 648
  object cdsLstProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'NOVO_CADASTRO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_SERVICOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_SERVICOS'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstProdutos'
    BeforeOpen = cdsLstProdutosBeforeOpen
    BeforeDelete = cdsLstProdutosBeforeDelete
    OnCalcFields = cdsLstProdutosCalcFields
    OnNewRecord = cdsLstProdutosNewRecord
    Left = 55
    Top = 44
    object cdsLstProdutosKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstProdutosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsLstProdutosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsLstProdutosDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsLstProdutosKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object cdsLstProdutosDESC_TIPO: TStringField
      DisplayLabel = 'Grupo produto'
      FieldKind = fkLookup
      FieldName = 'DESC_TIPO'
      LookupDataSet = cdsTiposProduto
      LookupKeyFields = 'KCAD_TIPOS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'KTIPO_PRODUTO'
      Size = 32
      Lookup = True
    end
    object cdsLstProdutosDESC_TIPO_: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'DESC_TIPO_'
      Size = 60
    end
    object cdsLstProdutosKCAD_UNIDADE: TStringField
      FieldName = 'KCAD_UNIDADE'
      Visible = False
      FixedChar = True
    end
    object cdsLstProdutosUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsLstProdutosULTIMO_FORNECEDOR: TStringField
      DisplayLabel = #218'ltimo fornecedor'
      FieldName = 'ULTIMO_FORNECEDOR'
      Size = 128
    end
    object cdsLstProdutosQTDE_MINIMA: TFloatField
      DisplayLabel = 'Qtde m'#237'nima'
      FieldName = 'QTDE_MINIMA'
    end
    object cdsLstProdutosQTDE_PRODUTO: TFloatField
      DisplayLabel = 'Qtde produto'
      FieldName = 'QTDE_PRODUTO'
    end
    object cdsLstProdutosCUSTO_MEDIO: TFloatField
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO_MEDIO'
      DisplayFormat = '#,0.00'
    end
    object cdsLstProdutosTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsLstProdutosVALOR_VENDA: TFloatField
      DisplayLabel = 'Valor venda'
      FieldName = 'VALOR_VENDA'
      DisplayFormat = '#,0.00'
    end
    object cdsLstProdutosDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DATA_CADASTRO'
      Visible = False
    end
    object cdsLstProdutosPRODUTO_INSUMO_SERVICO: TIntegerField
      DisplayLabel = 'Produto/Insumo/Sevi'#231'o'
      FieldName = 'PRODUTO_INSUMO_SERVICO'
      Required = True
      OnGetText = cdsLstProdutosPRODUTO_INSUMO_SERVICOGetText
    end
    object cdsLstProdutosATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      OnGetText = cdsLstProdutosATIVOGetText
      FixedChar = True
      Size = 1
    end
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KEST_PRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspProduto'
    BeforeEdit = cdsProdutoBeforeEdit
    BeforePost = cdsProdutoBeforePost
    BeforeDelete = cdsProdutoBeforeDelete
    OnCalcFields = cdsProdutoCalcFields
    OnNewRecord = cdsProdutoNewRecord
    Left = 183
    Top = 44
    object cdsProdutoKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsProdutoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsProdutoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsProdutoATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProdutoDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DATA_CADASTRO'
      Visible = False
    end
    object cdsProdutoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      OnSetText = cdsProdutoNOMESetText
      OnValidate = cdsProdutoNOMEValidate
      Size = 128
    end
    object cdsProdutoDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProdutoPRODUTO_INSUMO_SERVICO: TIntegerField
      DisplayLabel = 'Produto/Insumo/Servi'#231'o'
      FieldName = 'PRODUTO_INSUMO_SERVICO'
      Required = True
      OnChange = cdsProdutoPRODUTO_INSUMO_SERVICOChange
    end
    object cdsProdutoKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object cdsProdutoTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Size = 64
    end
    object cdsProdutoKCAD_UNIDADE: TStringField
      FieldName = 'KCAD_UNIDADE'
      Visible = False
      FixedChar = True
    end
    object cdsProdutoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsProdutoULTIMO_FORNECEDOR: TStringField
      DisplayLabel = #218'ltimo fornecedor'
      FieldName = 'ULTIMO_FORNECEDOR'
      Size = 128
    end
    object cdsProdutoQTDE_INICIAL: TFloatField
      DisplayLabel = 'Qtde inicial'
      FieldName = 'QTDE_INICIAL'
      Required = True
    end
    object cdsProdutoCUSTO_INICIAL: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'CUSTO_INICIAL'
      Required = True
      DisplayFormat = '#,0.00##'
    end
    object cdsProdutoTOTAL_INICIAL: TFloatField
      DisplayLabel = 'Total inicial'
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL_INICIAL'
      DisplayFormat = '#,0.00'
    end
    object cdsProdutoDATA_SALDOINICIAL: TSQLTimeStampField
      DisplayLabel = 'Data Inicial'
      FieldName = 'DATA_SALDOINICIAL'
    end
    object cdsProdutoVALOR_VENDA: TFloatField
      DisplayLabel = 'Valor de venda'
      FieldName = 'VALOR_VENDA'
      DisplayFormat = '#,0.00'
    end
    object cdsProdutoQTDE_PRODUTO: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Qtde atual'
      FieldName = 'QTDE_PRODUTO'
      DisplayFormat = '#,0.##'
    end
    object cdsProdutoCUSTO_MEDIO: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO_MEDIO'
      DisplayFormat = '#,0.00'
    end
    object cdsProdutoTOTAL_ATUAL: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Total atual'
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL_ATUAL'
      DisplayFormat = '#,0.00'
    end
    object cdsProdutoBAIXA_ESTOQUE: TStringField
      DisplayLabel = 'Baixa estoque'
      FieldName = 'BAIXA_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoQTDE_MINIMA: TFloatField
      DisplayLabel = 'Qtde m'#237'nima'
      FieldName = 'QTDE_MINIMA'
      DisplayFormat = '#,0.##'
    end
    object cdsProdutoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProdutoKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
    end
    object cdsProdutoDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = [pfInWhere]
      OnSetText = cdsProdutoDESCR_PC_NOMESetText
      Size = 64
    end
    object cdsProdutoDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = [pfInWhere]
    end
    object cdsProdutoDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsProdutoDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object cdsProdutosqlApropriacaoProtuto: TDataSetField
      FieldName = 'sqlApropriacaoProtuto'
    end
    object cdsProdutoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
  end
  object dspLstProdutos: TDataSetProvider
    DataSet = sqlLstProdutos
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object dspProduto: TDataSetProvider
    DataSet = sqlProduto
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 89
  end
  object sqlProduto: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KEST_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  P.KEST_PRODUTO,'
      '  P.KSYS$DOMAIN,'
      '  P.CODIGO,'
      '  P.ATIVO,'
      '  P.NOME,'
      '  P.DESCRICAO,'
      '  P.PRODUTO_INSUMO_SERVICO,'
      '  P.KTIPO_PRODUTO, P.TIPO_PRODUTO, '
      '  P.KCAD_UNIDADE,'
      '  P.UNIDADE,'
      '  P.ULTIMO_FORNECEDOR,'
      '  P.QTDE_INICIAL,'
      '  P.CUSTO_INICIAL,'
      '  P.DATA_SALDOINICIAL,'
      '  P.VALOR_VENDA,'
      '  P.QTDE_PRODUTO,'
      '  P.CUSTO_MEDIO,'
      '  P.BAIXA_ESTOQUE,'
      '  P.QTDE_MINIMA,'
      '  P.OBS,'
      '  P.DATA_CADASTRO,'
      '  P.KFIN_PLANOCONTA, '
      '  P.SYS$ORIGIN_TYPE,'
      '  PC.NOME DESCR_PC_NOME,'
      '  PC.CODIGO DESCR_PC_CODIGO,'
      '  PC.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  PC.TIPO_APRD DESCR_PC_TIPO_APRD'
      'FROM EST_PRODUTOS P'
      
        'LEFT JOIN FIN_PLANOCONTAS PC ON PC.KFIN_PLANOCONTA = P.KFIN_PLAN' +
        'OCONTA'
      'WHERE P.KEST_PRODUTO = :KEST_PRODUTO')
    Left = 186
    Top = 132
    object sqlProdutoKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlProdutoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlProdutoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlProdutoATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlProdutoDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DATA_CADASTRO'
      Visible = False
    end
    object sqlProdutoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlProdutoDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlProdutoPRODUTO_INSUMO_SERVICO: TIntegerField
      DisplayLabel = 'Produto/Insumo/Servi'#231'o'
      FieldName = 'PRODUTO_INSUMO_SERVICO'
      Required = True
    end
    object sqlProdutoKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object sqlProdutoTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Size = 64
    end
    object sqlProdutoKCAD_UNIDADE: TStringField
      FieldName = 'KCAD_UNIDADE'
      Visible = False
      FixedChar = True
    end
    object sqlProdutoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlProdutoULTIMO_FORNECEDOR: TStringField
      DisplayLabel = #218'ltimo fornecedor'
      FieldName = 'ULTIMO_FORNECEDOR'
      Size = 128
    end
    object sqlProdutoQTDE_INICIAL: TFloatField
      DisplayLabel = 'Qtde inicial'
      FieldName = 'QTDE_INICIAL'
      Required = True
    end
    object sqlProdutoCUSTO_INICIAL: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'CUSTO_INICIAL'
      Required = True
    end
    object sqlProdutoVALOR_VENDA: TFloatField
      DisplayLabel = 'Valor de venda'
      FieldName = 'VALOR_VENDA'
    end
    object sqlProdutoDATA_SALDOINICIAL: TSQLTimeStampField
      FieldName = 'DATA_SALDOINICIAL'
    end
    object sqlProdutoQTDE_PRODUTO: TFloatField
      DisplayLabel = 'Qtde atual'
      FieldName = 'QTDE_PRODUTO'
    end
    object sqlProdutoCUSTO_MEDIO: TFloatField
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO_MEDIO'
    end
    object sqlProdutoBAIXA_ESTOQUE: TStringField
      DisplayLabel = 'Baixa estoque'
      FieldName = 'BAIXA_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sqlProdutoQTDE_MINIMA: TFloatField
      DisplayLabel = 'Qtde m'#237'nima'
      FieldName = 'QTDE_MINIMA'
    end
    object sqlProdutoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlProdutoKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
    end
    object sqlProdutoDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlProdutoDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = [pfInWhere]
    end
    object sqlProdutoDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlProdutoDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlProdutoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstProdutos
    Left = 120
    Top = 8
  end
  object sqlLstProdutos: TTcSQLDataSet
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
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'NOVO_CADASTRO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_SERVICOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_SERVICOS'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  KEST_PRODUTO, '
      '  DATA_CADASTRO,'
      '  CODIGO,'
      '  NOME,'
      '  DESCRICAO,'
      '  KTIPO_PRODUTO,'
      '  KCAD_UNIDADE,'
      '  UNIDADE,'
      '  ULTIMO_FORNECEDOR,'
      '  QTDE_MINIMA,'
      '  QTDE_PRODUTO,'
      ' CUSTO_MEDIO,'
      '  ( QTDE_PRODUTO * CUSTO_MEDIO ) TOTAL,'
      '  VALOR_VENDA,'
      '  PRODUTO_INSUMO_SERVICO,'
      '  ATIVO'
      'FROM EST_PRODUTOS'
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND ( :DSP_INATIVO = '#39'T'#39' OR ( ATIVO = '#39'T'#39' ) )'
      '  AND (    ( :NOVO_CADASTRO = '#39'F'#39' )'
      
        '        OR (     ( :DSP_SERVICOS = '#39'T'#39' AND PRODUTO_INSUMO_SERVIC' +
        'O = 3 )'
      
        '              OR ( :DSP_SERVICOS = '#39'F'#39' AND PRODUTO_INSUMO_SERVIC' +
        'O IN (1,2) )'
      '            )'
      '       )')
    Left = 58
    Top = 133
    object sqlLstProdutosKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstProdutosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlLstProdutosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlLstProdutosDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlLstProdutosKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object sqlLstProdutosKCAD_UNIDADE: TStringField
      FieldName = 'KCAD_UNIDADE'
      Visible = False
      FixedChar = True
    end
    object sqlLstProdutosUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlLstProdutosULTIMO_FORNECEDOR: TStringField
      DisplayLabel = #218'ltimo fornecedor'
      FieldName = 'ULTIMO_FORNECEDOR'
      Size = 128
    end
    object sqlLstProdutosQTDE_MINIMA: TFloatField
      DisplayLabel = 'Qtde m'#237'nima'
      FieldName = 'QTDE_MINIMA'
    end
    object sqlLstProdutosQTDE_PRODUTO: TFloatField
      DisplayLabel = 'Qtde produto'
      FieldName = 'QTDE_PRODUTO'
    end
    object sqlLstProdutosCUSTO_MEDIO: TFloatField
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO_MEDIO'
    end
    object sqlLstProdutosTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
    end
    object sqlLstProdutosVALOR_VENDA: TFloatField
      DisplayLabel = 'Valor venda'
      FieldName = 'VALOR_VENDA'
    end
    object sqlLstProdutosPRODUTO_INSUMO_SERVICO: TIntegerField
      DisplayLabel = 'Produto/Insumo/Sevi'#231'o'
      FieldName = 'PRODUTO_INSUMO_SERVICO'
      Required = True
    end
    object sqlLstProdutosATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object sqlLstProdutosDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DATA_CADASTRO'
    end
  end
  object cdsUnidades: TClientDataSet
    PersistDataPacket.Data = {
      570000009619E0BD01000000180000000200000000000300000057000A4B4341
      445F5449504F5301004900000001000557494454480200020020000944455343
      524943414F01004900000001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 88
    object cdsUnidadesKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      Size = 32
    end
    object cdsUnidadesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
  end
  object cdsTiposProduto: TClientDataSet
    PersistDataPacket.Data = {
      570000009619E0BD01000000180000000200000000000300000057000A4B4341
      445F5449504F5301004900000001000557494454480200020020000944455343
      524943414F01004900000001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 365
    Top = 20
    object cdsTiposProdutoKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      Size = 32
    end
    object cdsTiposProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
  end
  object cdsApropriacaoProduto: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsProdutosqlApropriacaoProtuto
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    OnNewRecord = cdsApropriacaoProdutoNewRecord
    Left = 276
    Top = 44
    object cdsApropriacaoProdutoKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsApropriacaoProdutoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object cdsApropriacaoProdutoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsApropriacaoProdutoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cdsApropriacaoProdutoCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object cdsApropriacaoProdutoPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object cdsApropriacaoProdutoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsApropriacaoProdutoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsApropriacaoProdutoTOTAL_PORCENTAGEM: TAggregateField
      DisplayLabel = 'Total porcentagem'
      FieldName = 'TOTAL_PORCENTAGEM'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PORCENTAGEM)'
    end
  end
  object sqlApropriacaoProtuto: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLProduto
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KEST_PRODUTO'
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
      'WHERE A.TABLENAME = '#39'EST_PRODUTOS'#39' '
      '     AND A.TABLEKEY = :KEST_PRODUTO')
    Left = 274
    Top = 132
    object sqlApropriacaoProtutoKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApropriacaoProtutoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object sqlApropriacaoProtutoPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoProtutoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlApropriacaoProtutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object sqlApropriacaoProtutoCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlApropriacaoProtutoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApropriacaoProtutoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
  end
  object dtsSQLProduto: TDataSource
    DataSet = sqlProduto
    Left = 224
    Top = 192
  end
  object cdsJunctionProdutos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    ProviderName = 'dspJunctionProdutos'
    BeforeOpen = cdsJunctionProdutosBeforeOpen
    OnCalcFields = cdsJunctionProdutosCalcFields
    Left = 527
    Top = 32
    object cdsJunctionProdutosKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsJunctionProdutosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsJunctionProdutosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsJunctionProdutosKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object cdsJunctionProdutosDESC_TIPO: TStringField
      DisplayLabel = 'Grupo produto'
      FieldKind = fkLookup
      FieldName = 'DESC_TIPO'
      LookupDataSet = cdsTiposProduto
      LookupKeyFields = 'KCAD_TIPOS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'KTIPO_PRODUTO'
      Size = 32
      Lookup = True
    end
    object cdsJunctionProdutosDESC_TIPO_: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'DESC_TIPO_'
      Visible = False
      Size = 60
    end
    object cdsJunctionProdutosKCAD_UNIDADE: TStringField
      FieldName = 'KCAD_UNIDADE'
      Visible = False
      FixedChar = True
    end
    object cdsJunctionProdutosUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsJunctionProdutosULTIMO_FORNECEDOR: TStringField
      DisplayLabel = #218'ltimo fornecedor'
      FieldName = 'ULTIMO_FORNECEDOR'
      Size = 128
    end
    object cdsJunctionProdutosQTDE_MINIMA: TFloatField
      DisplayLabel = 'Qtde m'#237'nima'
      FieldName = 'QTDE_MINIMA'
    end
    object cdsJunctionProdutosQTDE_PRODUTO: TFloatField
      DisplayLabel = 'Qtde produto'
      FieldName = 'QTDE_PRODUTO'
    end
    object cdsJunctionProdutosCUSTO_MEDIO: TFloatField
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO_MEDIO'
      DisplayFormat = '#,0.00'
    end
    object cdsJunctionProdutosTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsJunctionProdutosVALOR_VENDA: TFloatField
      DisplayLabel = 'Valor venda'
      FieldName = 'VALOR_VENDA'
      DisplayFormat = '#,0.00'
    end
    object cdsJunctionProdutosDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DATA_CADASTRO'
      Visible = False
    end
    object cdsJunctionProdutosPRODUTO_INSUMO_SERVICO: TIntegerField
      DisplayLabel = 'Produto/Insumo/Sevi'#231'o'
      FieldName = 'PRODUTO_INSUMO_SERVICO'
      Required = True
    end
    object cdsJunctionProdutosDATA_SALDOINICIAL: TSQLTimeStampField
      FieldName = 'DATA_SALDOINICIAL'
      Required = True
    end
    object cdsJunctionProdutosQTDE_INICIAL: TFloatField
      FieldName = 'QTDE_INICIAL'
      Required = True
    end
    object cdsJunctionProdutosIS_FRISIA: TStringField
      FieldName = 'IS_FRISIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsJunctionProdutosPRINCIPAL: TIntegerField
      DisplayLabel = 'Principal'
      FieldKind = fkInternalCalc
      FieldName = 'PRINCIPAL'
      OnChange = cdsJunctionProdutosPRINCIPALChange
    end
    object cdsJunctionProdutosCHECKED: TIntegerField
      DisplayLabel = 'Selecionar'
      FieldKind = fkInternalCalc
      FieldName = 'CHECKED'
      OnChange = cdsJunctionProdutosCHECKEDChange
    end
    object cdsJunctionProdutosSUM_PRINCIPAL: TAggregateField
      FieldName = 'SUM_PRINCIPAL'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PRINCIPAL)'
    end
    object cdsJunctionProdutosSUM_CHECKED: TAggregateField
      FieldName = 'SUM_CHECKED'
      Active = True
      DisplayName = ''
      Expression = 'SUM(CHECKED)'
    end
  end
  object dspJunctionProdutos: TDataSetProvider
    DataSet = sqlJunctionProdutos
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 503
    Top = 77
  end
  object sqlJunctionProdutos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  P.KEST_PRODUTO'
      ', P.DATA_CADASTRO'
      ', P.CODIGO'
      ', P.NOME'
      ', P.KTIPO_PRODUTO'
      ', P.KCAD_UNIDADE'
      ', P.UNIDADE'
      ', P.ULTIMO_FORNECEDOR'
      ', P.QTDE_MINIMA'
      ', P.QTDE_PRODUTO'
      ', P.CUSTO_MEDIO'
      ', P.DATA_SALDOINICIAL'
      ', P.QTDE_INICIAL'
      ', ( P.QTDE_PRODUTO * P.CUSTO_MEDIO ) TOTAL'
      ', P.VALOR_VENDA'
      ', P.PRODUTO_INSUMO_SERVICO'
      ', IIF( F.KEST_PRODUTO IS NULL, '#39'F'#39', '#39'T'#39' ) IS_FRISIA'
      'FROM EST_PRODUTOS P'
      'LEFT JOIN FRISIA_PRODUTOS F USING ( KEST_PRODUTO )'
      'WHERE P.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND ( P.ATIVO = '#39'T'#39' )'
      ' AND (    '
      '             P.PRODUTO_INSUMO_SERVICO = 1'
      '        OR P.PRODUTO_INSUMO_SERVICO = 2'
      '          )'
      'ORDER BY P.NOME')
    Left = 530
    Top = 121
    object sqlJunctionProdutosKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlJunctionProdutosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlJunctionProdutosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlJunctionProdutosKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object sqlJunctionProdutosKCAD_UNIDADE: TStringField
      FieldName = 'KCAD_UNIDADE'
      Visible = False
      FixedChar = True
    end
    object sqlJunctionProdutosUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlJunctionProdutosULTIMO_FORNECEDOR: TStringField
      DisplayLabel = #218'ltimo fornecedor'
      FieldName = 'ULTIMO_FORNECEDOR'
      Size = 128
    end
    object sqlJunctionProdutosQTDE_MINIMA: TFloatField
      DisplayLabel = 'Qtde m'#237'nima'
      FieldName = 'QTDE_MINIMA'
    end
    object sqlJunctionProdutosQTDE_PRODUTO: TFloatField
      DisplayLabel = 'Qtde produto'
      FieldName = 'QTDE_PRODUTO'
    end
    object sqlJunctionProdutosCUSTO_MEDIO: TFloatField
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO_MEDIO'
    end
    object sqlJunctionProdutosTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
    end
    object sqlJunctionProdutosVALOR_VENDA: TFloatField
      DisplayLabel = 'Valor venda'
      FieldName = 'VALOR_VENDA'
    end
    object sqlJunctionProdutosPRODUTO_INSUMO_SERVICO: TIntegerField
      DisplayLabel = 'Produto/Insumo/Sevi'#231'o'
      FieldName = 'PRODUTO_INSUMO_SERVICO'
      Required = True
    end
    object sqlJunctionProdutosDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DATA_CADASTRO'
    end
    object sqlJunctionProdutosDATA_SALDOINICIAL: TSQLTimeStampField
      FieldName = 'DATA_SALDOINICIAL'
      Required = True
    end
    object sqlJunctionProdutosQTDE_INICIAL: TFloatField
      FieldName = 'QTDE_INICIAL'
      Required = True
    end
    object sqlJunctionProdutosIS_FRISIA: TStringField
      FieldName = 'IS_FRISIA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object JvMultiStringHolder1: TJvMultiStringHolder
    MultipleStrings = <
      item
      end
      item
      end
      item
      end>
    Left = 424
    Top = 200
  end
end
