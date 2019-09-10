object dtmDEVOLUCOES_Pedido: TdtmDEVOLUCOES_Pedido
  OldCreateOrder = True
  Height = 441
  Width = 1273
  object cdsDevolucoes: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'KDEV_PEDIDO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KSYS$DOMAIN'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOTA_FISCAL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 32
      end
      item
        Name = 'SERIE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 32
      end
      item
        Name = 'NOMEENTIDADE'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'DATA_EMISSAO'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'DATA_ENTRADA'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'IMPOSTOS'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTOS'
        DataType = ftFloat
      end
      item
        Name = 'FRETE'
        DataType = ftFloat
      end
      item
        Name = 'TOTAL_NOTA'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'OBS'
        DataType = ftMemo
        Size = 1
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LISTALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LISTALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KDEV_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDevolucoes'
    StoreDefs = True
    OnNewRecord = cdsDevolucoesNewRecord
    Left = 63
    Top = 56
    object cdsDevolucoesKDEV_PEDIDO: TStringField
      FieldName = 'KDEV_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDevolucoesKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDevolucoesNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota Fiscal'
      DisplayWidth = 17
      FieldName = 'NOTA_FISCAL'
      Required = True
      Size = 32
    end
    object cdsDevolucoesNOTA_FISCAL_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'NOTA_FISCAL_'
      Visible = False
      Size = 32
    end
    object cdsDevolucoesSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      DisplayWidth = 11
      FieldName = 'SERIE'
      Required = True
      Size = 32
    end
    object cdsDevolucoesNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsDevolucoesDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      DisplayWidth = 25
      FieldName = 'DATA_EMISSAO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDevolucoesDATA_ENTRADA: TSQLTimeStampField
      DisplayLabel = 'Data entrada'
      DisplayWidth = 25
      FieldName = 'DATA_ENTRADA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDevolucoesIMPOSTOS: TFloatField
      DisplayLabel = 'Impostos'
      DisplayWidth = 8
      FieldName = 'IMPOSTOS'
      Visible = False
      DisplayFormat = '#,0.00'
    end
    object cdsDevolucoesDESCONTOS: TFloatField
      DisplayLabel = 'Descontos'
      DisplayWidth = 10
      FieldName = 'DESCONTOS'
      Visible = False
      DisplayFormat = '#,0.00'
    end
    object cdsDevolucoesFRETE: TFloatField
      DisplayLabel = 'Frete'
      DisplayWidth = 7
      FieldName = 'FRETE'
      Visible = False
      DisplayFormat = '#,0.00'
    end
    object cdsDevolucoesTOTAL_NOTA: TFloatField
      DisplayLabel = 'Total'
      DisplayWidth = 7
      FieldName = 'TOTAL_NOTA'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsDevolucoesOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      DisplayWidth = 10
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsDevolucao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KDEV_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDevolucao'
    BeforeOpen = cdsDevolucaoBeforeOpen
    BeforeInsert = cdsDevolucaoBeforeInsert
    AfterInsert = cdsDevolucaoAfterInsert
    BeforeEdit = cdsDevolucaoBeforeEdit
    BeforePost = cdsDevolucaoBeforePost
    BeforeDelete = cdsDevolucaoBeforeDelete
    OnCalcFields = cdsDevolucaoCalcFields
    OnNewRecord = cdsDevolucaoNewRecord
    BeforeApplyUpdates = cdsDevolucaoBeforeApplyUpdates
    Left = 170
    Top = 56
    object cdsDevolucaoKDEV_PEDIDO: TStringField
      FieldName = 'KDEV_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDevolucaoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDevolucaoKCAD_ENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'KCAD_ENTIDADE'
      Required = True
      Visible = False
      OnSetText = cdsAReceberNOMECONTASetText
      OnValidate = cdsDevolucaoKCAD_ENTIDADEValidate
      FixedChar = True
    end
    object cdsDevolucaoNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'NOTA_FISCAL'
      OnValidate = cdsDevolucaoNOTA_FISCALValidate
      Size = 32
    end
    object cdsDevolucaoSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 32
    end
    object cdsDevolucaoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
    object cdsDevolucaoCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      EditMask = '0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000;0; '
      Size = 44
    end
    object cdsDevolucaoNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      OnSetText = cdsDevolucaoNOMEENTIDADESetText
      Size = 128
    end
    object cdsDevolucaoDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
      Required = True
      OnValidate = cdsDevolucaoDATA_EMISSAOValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDevolucaoDATA_COMPRA: TSQLTimeStampField
      DisplayLabel = 'Data compra'
      FieldName = 'DATA_COMPRA'
      Required = True
      OnChange = cdsDevolucaoDATA_COMPRAChange
      OnValidate = cdsDevolucaoDATA_COMPRAValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDevolucaoDATA_ENTRADA: TSQLTimeStampField
      DisplayLabel = 'Data entrada'
      FieldName = 'DATA_ENTRADA'
      Required = True
      Visible = False
      OnValidate = cdsDevolucaoDATA_ENTRADAValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDevolucaoIMPOSTOS: TFloatField
      DisplayLabel = 'Impostos'
      FieldName = 'IMPOSTOS'
      DisplayFormat = '#,0.00#####'
    end
    object cdsDevolucaoDESCONTOS: TFloatField
      DisplayLabel = 'Descontos'
      FieldName = 'DESCONTOS'
      DisplayFormat = '#,0.00#####'
    end
    object cdsDevolucaoFRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'FRETE'
      DisplayFormat = '#,0.00#####'
    end
    object cdsDevolucaoKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Visible = False
      FixedChar = True
    end
    object cdsDevolucaoKFIN_APAGAR_TRANSPORTE: TStringField
      FieldName = 'KFIN_APAGAR_TRANSPORTE'
      FixedChar = True
    end
    object cdsDevolucaoTOTAL_ITENS: TFloatField
      DisplayLabel = 'Total '#237'tens'
      FieldName = 'TOTAL_ITENS'
      DisplayFormat = '#,0.00'
    end
    object cdsDevolucaoTOTAL_NOTA: TFloatField
      DisplayLabel = 'Total nota'
      FieldName = 'TOTAL_NOTA'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsDevolucaoATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDevolucaoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsDevolucaoXML_NFE: TMemoField
      FieldName = 'XML_NFE'
      BlobType = ftMemo
      Size = 1
    end
    object cdsDevolucaoIMPORTADO_NFE: TStringField
      FieldName = 'IMPORTADO_NFE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDevolucaoMODELO_NFE: TIntegerField
      FieldName = 'MODELO_NFE'
    end
    object cdsDevolucaosqlItensPedido: TDataSetField
      DisplayLabel = 'Itens'
      FieldName = 'sqlItensPedido'
    end
    object cdsDevolucaosqlAReceber: TDataSetField
      DisplayLabel = 'Dados a pagar'
      FieldName = 'sqlAReceber'
    end
    object cdsDevolucaosqlAPagarTransporte: TDataSetField
      DisplayLabel = 'Transportadora'
      FieldName = 'sqlAPagarTransporte'
    end
    object cdsDevolucaotmpCalc: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'tmpCalc'
    end
  end
  object dtsList: TDataSource
    DataSet = cdsDevolucoes
    Left = 120
    Top = 8
  end
  object cdsItensPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsDevolucaosqlItensPedido
    Params = <>
    BeforeInsert = cdsItensPedidoBeforeInsert
    BeforeEdit = cdsItensPedidoBeforeEdit
    BeforePost = cdsItensPedidoBeforePost
    AfterCancel = cdsItensPedidoAfterCancel
    AfterDelete = cdsItensPedidoAfterDelete
    OnCalcFields = cdsItensPedidoCalcFields
    OnNewRecord = cdsItensPedidoNewRecord
    Left = 285
    Top = 57
    object cdsItensPedidoKDEV_PEDIDO_ITEM: TStringField
      FieldName = 'KDEV_PEDIDO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsItensPedidoKDEV_PEDIDO: TStringField
      FieldName = 'KDEV_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsItensPedidoKEST_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'KEST_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object cdsItensPedidoCODIGO_NOME: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CODIGO_NOME'
      Size = 128
    end
    object cdsItensPedidoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsItensPedidoNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsItensPedidoCST_CSOSN: TStringField
      FieldName = 'CST_CSOSN'
      Size = 4
    end
    object cdsItensPedidoCFOP: TStringField
      FieldName = 'CFOP'
      FixedChar = True
      Size = 4
    end
    object cdsItensPedidoCFOP_ESTOQUE: TStringField
      FieldName = 'CFOP_ESTOQUE'
      FixedChar = True
      Size = 4
    end
    object cdsItensPedidoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsItensPedidoQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      DisplayFormat = '#,0.####'
    end
    object cdsItensPedidoVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object cdsItensPedidoVALOR_PARCIAL: TFloatField
      DisplayLabel = 'Valor parcial'
      FieldName = 'VALOR_PARCIAL'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.00'
    end
    object cdsItensPedidoDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object cdsItensPedidoFRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'FRETE'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object cdsItensPedidoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00'
    end
    object cdsItensPedidoCUSTO: TFloatField
      DisplayLabel = 'Custo unit'#225'rio'
      FieldName = 'CUSTO'
      DisplayFormat = '#,0.00'
    end
    object cdsItensPedidoDETALHES: TMemoField
      DisplayLabel = 'Detalhes'
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsItensPedidoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsItensPedidoKFIN_PLANOCONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'KFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object cdsItensPedidoDESCR_PC_NOME: TStringField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      OnSetText = cdsItensPedidoDESCR_PC_NOMESetText
      Size = 64
    end
    object cdsItensPedidoDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      OnGetText = cdsItensPedidoDESCR_PC_CLASSIFICACAOGetText
      Size = 32
    end
    object cdsItensPedidoDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object cdsItensPedidoDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsItensPedidosqlApropriacaoItem: TDataSetField
      FieldName = 'sqlApropriacaoItem'
    end
    object cdsItensPedidoTmpCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'TmpCalc'
      Calculated = True
    end
    object cdsItensPedidoDESCR_UNIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_UNIDADE'
      LookupDataSet = cdsUnidades
      LookupKeyFields = 'DESCRICAO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'UNIDADE'
      Size = 3
      Lookup = True
    end
    object cdsItensPedidoDESCR_UNIDADE_COMPRA: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_UNIDADE_COMPRA'
      LookupDataSet = cdsUnidadesCompra
      LookupKeyFields = 'DESCRICAO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'UNIDADE_COMPRA'
      Size = 3
      Lookup = True
    end
    object cdsItensPedidoQTDE_COMPRA: TFloatField
      FieldName = 'QTDE_COMPRA'
    end
    object cdsItensPedidoUNIDADE_COMPRA: TStringField
      FieldName = 'UNIDADE_COMPRA'
      FixedChar = True
      Size = 3
    end
    object cdsItensPedidoUNITARIO_COMPRA: TFloatField
      FieldName = 'UNITARIO_COMPRA'
    end
    object cdsItensPedidoATUALIZAR_CUSTO: TStringField
      FieldName = 'ATUALIZAR_CUSTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsItensPedidoVALOR_IPI: TFloatField
      FieldName = 'VALOR_IPI'
      DisplayFormat = '#,0.00'
    end
    object cdsItensPedidoSomaTotal: TAggregateField
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM( TOTAL )'
    end
    object cdsItensPedidoSomaParcial: TAggregateField
      FieldName = 'SomaParcial'
      Active = True
      DisplayName = ''
      Expression = 'SUM( VALOR_PARCIAL )'
    end
    object cdsItensPedidoSomaDesconto: TAggregateField
      FieldName = 'SomaDesconto'
      Active = True
      DisplayName = ''
      Expression = 'SUM( DESCONTO )'
    end
    object cdsItensPedidoSomaFrete: TAggregateField
      FieldName = 'SomaFrete'
      Active = True
      DisplayName = ''
      Expression = 'SUM( FRETE )'
    end
    object cdsItensPedidoSomaValorIPI: TAggregateField
      FieldName = 'SomaValorIPI'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VALOR_IPI)'
    end
  end
  object cdsStatusPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 436
    Top = 8
    object cdsStatusPedidoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusPedidoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusPedidoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
  end
  object cdsDadosEntidade: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KCAD_ENTIDADE'
    MasterFields = 'KCAD_ENTIDADE'
    MasterSource = dtsPedido
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspDadosEntidade'
    Left = 99
    Top = 278
    object cdsDadosEntidadeKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Required = True
    end
    object cdsDadosEntidadeDADOSENTIDADE: TStringField
      FieldName = 'DADOSENTIDADE'
      Size = 512
    end
    object cdsDadosEntidadeEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 64
    end
    object cdsDadosEntidadeFONE: TStringField
      FieldName = 'FONE'
      Size = 16
    end
  end
  object dtsPedido: TDataSource
    DataSet = cdsDevolucao
    Left = 216
    Top = 8
  end
  object cdsDadosProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'KEST_PRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDadosProduto'
    Left = 273
    Top = 278
    object cdsDadosProdutoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsDadosProdutoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsDadosProdutoBAIXA_ESTOQUE: TStringField
      FieldName = 'BAIXA_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsDadosProdutoKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object cdsDadosProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsDadosProdutoDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsDadosProdutoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsDadosProdutoDESCRICAO_APROPRIACAO: TStringField
      FieldName = 'DESCRICAO_APROPRIACAO'
      Size = 64
    end
  end
  object cdsAReceber: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDevolucaosqlAReceber
    Params = <
      item
        DataType = ftString
        Name = 'KFIN_ARECEBER'
        ParamType = ptInput
      end>
    OnNewRecord = cdsAReceberNewRecord
    Left = 471
    Top = 57
    object cdsAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsAReceberKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsAReceberTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsAReceberTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsAReceberATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object cdsAReceberNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Required = True
      Size = 128
    end
    object cdsAReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Required = True
      Size = 128
    end
    object cdsAReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAReceberDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsAReceberNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object cdsAReceberPROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberRECORRENCIA: TStringField
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object cdsAReceberKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object cdsAReceberNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      OnSetText = cdsAReceberNOMECONTASetText
      Size = 64
    end
    object cdsAReceberKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object cdsAReceberOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsAReceberPAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      Required = True
      OnChange = cdsAReceberPAGTO_AVISTAChange
      FixedChar = True
      Size = 1
    end
    object cdsARecebersqlParcelas: TDataSetField
      DisplayLabel = 'Parcelas a pagar'
      FieldName = 'sqlParcelas'
    end
    object cdsAReceberStatusCadastro: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusCadastro'
      Size = 1
      Calculated = True
    end
    object cdsAReceberKDEV_PEDIDO: TStringField
      FieldName = 'KDEV_PEDIDO'
      Required = True
      FixedChar = True
    end
  end
  object cdsParcelas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsARecebersqlParcelas
    IndexFieldNames = 'VENCTO'
    Params = <>
    BeforeInsert = cdsParcelasBeforeInsert
    BeforeEdit = cdsParcelasBeforeEdit
    BeforePost = cdsParcelasBeforePost
    BeforeDelete = cdsParcelasBeforeDelete
    OnCalcFields = cdsParcelasCalcFields
    OnNewRecord = cdsParcelasNewRecord
    Left = 532
    Top = 57
    object cdsParcelasKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsParcelasKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      FixedChar = True
    end
    object cdsParcelasDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsParcelasVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
      OnChange = cdsParcelasVENCTOChange
    end
    object cdsParcelasVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasPAGTO: TSQLTimeStampField
      DisplayLabel = 'Pagamento'
      FieldName = 'PAGTO'
    end
    object cdsParcelasPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasKFIN_CONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object cdsParcelasNOMECONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      OnSetText = cdsParcelasNOMECONTASetText
      Size = 64
    end
    object cdsParcelasPREVISAO: TStringField
      DisplayLabel = 'Previs'#227'o'
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParcelasDUVIDOSO: TStringField
      DisplayLabel = 'Duvidoso'
      FieldName = 'DUVIDOSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParcelasCHEQUE: TStringField
      DisplayLabel = 'Pagamento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      OnChange = cdsParcelasCHEQUEChange
      FixedChar = True
      Size = 1
    end
    object cdsParcelasNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      OnSetText = cdsParcelasNUM_CHEQUESetText
      Size = 32
    end
    object cdsParcelasDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object cdsParcelasOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsParcelastmpCalc: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'tmpCalc'
    end
    object cdsParcelasSomaValor: TAggregateField
      DisplayLabel = 'Total'
      FieldName = 'SomaValor'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VALOR)'
    end
  end
  object dspDevolucoes: TDataSetProvider
    DataSet = sqlDevolucoes
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 23
    Top = 105
  end
  object dspDevolucao: TDataSetProvider
    DataSet = sqlDevolucao
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 135
    Top = 105
  end
  object sqlDevolucoes: TTcSQLDataSet
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
        Name = 'LISTALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LISTALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KDEV_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  KDEV_PEDIDO,'
      '  KSYS$DOMAIN,'
      '  NOTA_FISCAL,'
      '  NOTA_FISCAL_,'
      '  SERIE,'
      '  DATA_EMISSAO,'
      '  DATA_ENTRADA,'
      '  NOMEENTIDADE,'
      '  IMPOSTOS,'
      '  DESCONTOS,'
      '  FRETE,'
      '  TOTAL_NOTA,'
      '  cast ( OBS as BLOB ) OBS'
      'FROM DEV_PEDIDOS'
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND ( ( :LISTALL = '#39'T'#39' )'
      '        AND ( :DSP_INATIVO = '#39'T'#39' OR ( ATIVO = '#39'T'#39' ) )'
      '        AND DATA_EMISSAO BETWEEN :DATAINI AND :DATAFIM'
      '         )'
      '  OR ( ( :LISTALL = '#39'F'#39' )'
      '           AND KDEV_PEDIDO = :KDEV_PEDIDO )')
    Left = 50
    Top = 153
    object sqlDevolucoesKDEV_PEDIDO: TStringField
      FieldName = 'KDEV_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlDevolucoesKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlDevolucoesNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'NOTA_FISCAL'
      Required = True
      Size = 32
    end
    object sqlDevolucoesNOTA_FISCAL_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'NOTA_FISCAL_'
      Size = 32
    end
    object sqlDevolucoesSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Required = True
      Size = 32
    end
    object sqlDevolucoesNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlDevolucoesDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
      Required = True
    end
    object sqlDevolucoesDATA_ENTRADA: TSQLTimeStampField
      DisplayLabel = 'Data entrada'
      FieldName = 'DATA_ENTRADA'
      Required = True
    end
    object sqlDevolucoesIMPOSTOS: TFloatField
      DisplayLabel = 'Impostos'
      FieldName = 'IMPOSTOS'
    end
    object sqlDevolucoesDESCONTOS: TFloatField
      DisplayLabel = 'Descontos'
      FieldName = 'DESCONTOS'
    end
    object sqlDevolucoesFRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'FRETE'
    end
    object sqlDevolucoesTOTAL_NOTA: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL_NOTA'
      Required = True
    end
    object sqlDevolucoesOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlDevolucao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    BeforeOpen = sqlDevolucaoBeforeOpen
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KDEV_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  KDEV_PEDIDO,'
      '  KSYS$DOMAIN,'
      '  KCAD_ENTIDADE,'
      '  NOTA_FISCAL,'
      '  NOTA_FISCAL_,'
      '  CHAVENFE,'
      '  IMPORTADO_NFE,'
      '  SERIE,'
      '  DATA_EMISSAO,'
      '  DATA_COMPRA,'
      '  DATA_ENTRADA,'
      '  NOMEENTIDADE,'
      '  IMPOSTOS,'
      '  DESCONTOS,'
      '  FRETE,'
      '  KFIN_ARECEBER,'
      '  KFIN_APAGAR_TRANSPORTE,'
      '  TOTAL_ITENS,'
      '  TOTAL_NOTA,'
      '  ATIVO,'
      '  MODELO_NFE,'
      '  SYS$ORIGIN_TYPE,'
      '  cast( OBS as BLOB ) OBS,'
      '  cast( XML_NFE as BLOB ) XML_NFE'
      'FROM DEV_PEDIDOS'
      'WHERE KDEV_PEDIDO = :KDEV_PEDIDO')
    Left = 170
    Top = 148
    object sqlDevolucaoNOTA_FISCAL_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'NOTA_FISCAL_'
      Size = 32
    end
    object sqlDevolucaoKDEV_PEDIDO: TStringField
      FieldName = 'KDEV_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlDevolucaoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlDevolucaoKCAD_ENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'KCAD_ENTIDADE'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlDevolucaoNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'NOTA_FISCAL'
      Size = 32
    end
    object sqlDevolucaoSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 32
    end
    object sqlDevolucaoCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 44
    end
    object sqlDevolucaoNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Required = True
      Size = 128
    end
    object sqlDevolucaoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
    object sqlDevolucaoDATA_COMPRA: TSQLTimeStampField
      DisplayLabel = 'Data compra'
      FieldName = 'DATA_COMPRA'
      Required = True
    end
    object sqlDevolucaoDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
      Required = True
    end
    object sqlDevolucaoDATA_ENTRADA: TSQLTimeStampField
      DisplayLabel = 'Data entrada'
      FieldName = 'DATA_ENTRADA'
      Required = True
    end
    object sqlDevolucaoIMPOSTOS: TFloatField
      DisplayLabel = 'Impostos'
      FieldName = 'IMPOSTOS'
    end
    object sqlDevolucaoDESCONTOS: TFloatField
      DisplayLabel = 'Descontos'
      FieldName = 'DESCONTOS'
    end
    object sqlDevolucaoFRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'FRETE'
    end
    object sqlDevolucaoKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlDevolucaoKFIN_APAGAR_TRANSPORTE: TStringField
      FieldName = 'KFIN_APAGAR_TRANSPORTE'
      FixedChar = True
    end
    object sqlDevolucaoTOTAL_ITENS: TFloatField
      DisplayLabel = 'Total '#237'tens'
      FieldName = 'TOTAL_ITENS'
      Required = True
    end
    object sqlDevolucaoTOTAL_NOTA: TFloatField
      DisplayLabel = 'Total nota'
      FieldName = 'TOTAL_NOTA'
      Required = True
    end
    object sqlDevolucaoATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlDevolucaoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlDevolucaoXML_NFE: TMemoField
      FieldName = 'XML_NFE'
      BlobType = ftMemo
      Size = 1
    end
    object sqlDevolucaoMODELO_NFE: TIntegerField
      FieldName = 'MODELO_NFE'
    end
    object sqlDevolucaoIMPORTADO_NFE: TStringField
      FieldName = 'IMPORTADO_NFE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object sqlItensPedido: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KDEV_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  I.KDEV_PEDIDO_ITEM,'
      '  I.KDEV_PEDIDO,'
      '  I.KEST_PRODUTO,'
      '  I.CODIGO,'
      '  I.NOME,'
      '  I.UNIDADE,'
      '  I.DETALHES,'
      '  I.QTDE,'
      '  I.VALOR_UNITARIO,'
      '  I.VALOR_PARCIAL,'
      '  I.CST_CSOSN, I.CFOP, I.CFOP_ESTOQUE, '
      '  I.QTDE_COMPRA,  '
      '  I.UNIDADE_COMPRA, '
      '  I.UNITARIO_COMPRA,'
      '  I.ATUALIZAR_CUSTO, '
      '  I.DESCONTO,'
      '  I.FRETE,'
      '  I.VALOR_IPI,'
      '  I.TOTAL,'
      '  I.CUSTO,'
      '  I.OBS,'
      '  I.KFIN_PLANOCONTA,'
      '  P.NOME DESCR_PC_NOME,'
      '  P.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  P.CODIGO DESCR_PC_CODIGO,'
      '  P.TIPO_APRD DESCR_PC_TIPO_APRD'
      'FROM DEV_PEDIDO_ITENS I'
      
        'LEFT JOIN FIN_PLANOCONTAS P ON P.KFIN_PLANOCONTA = I.KFIN_PLANOC' +
        'ONTA'
      'WHERE KDEV_PEDIDO = :KDEV_PEDIDO')
    Left = 285
    Top = 148
    object sqlItensPedidoKDEV_PEDIDO_ITEM: TStringField
      FieldName = 'KDEV_PEDIDO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlItensPedidoKDEV_PEDIDO: TStringField
      FieldName = 'KDEV_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlItensPedidoKEST_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'KEST_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object sqlItensPedidoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlItensPedidoNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlItensPedidoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object sqlItensPedidoCST_CSOSN: TStringField
      FieldName = 'CST_CSOSN'
      Size = 4
    end
    object sqlItensPedidoCFOP: TStringField
      FieldName = 'CFOP'
      FixedChar = True
      Size = 4
    end
    object sqlItensPedidoCFOP_ESTOQUE: TStringField
      FieldName = 'CFOP_ESTOQUE'
      FixedChar = True
      Size = 4
    end
    object sqlItensPedidoQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object sqlItensPedidoVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object sqlItensPedidoVALOR_PARCIAL: TFloatField
      FieldName = 'VALOR_PARCIAL'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.00'
    end
    object sqlItensPedidoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object sqlItensPedidoFRETE: TFloatField
      FieldName = 'FRETE'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object sqlItensPedidoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object sqlItensPedidoCUSTO: TFloatField
      DisplayLabel = 'Custo unit'#225'rio'
      FieldName = 'CUSTO'
      DisplayFormat = '#,0.00'
    end
    object sqlItensPedidoQTDE_COMPRA: TFloatField
      FieldName = 'QTDE_COMPRA'
    end
    object sqlItensPedidoUNIDADE_COMPRA: TStringField
      FieldName = 'UNIDADE_COMPRA'
      FixedChar = True
      Size = 3
    end
    object sqlItensPedidoUNITARIO_COMPRA: TFloatField
      FieldName = 'UNITARIO_COMPRA'
    end
    object sqlItensPedidoATUALIZAR_CUSTO: TStringField
      FieldName = 'ATUALIZAR_CUSTO'
      FixedChar = True
      Size = 1
    end
    object sqlItensPedidoDETALHES: TMemoField
      DisplayLabel = 'Detalhes'
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object sqlItensPedidoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlItensPedidoKFIN_PLANOCONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'KFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object sqlItensPedidoDESCR_PC_NOME: TStringField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlItensPedidoDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlItensPedidoDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object sqlItensPedidoDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object sqlItensPedidoVALOR_IPI: TFloatField
      FieldName = 'VALOR_IPI'
      DisplayFormat = '#,0.00'
    end
  end
  object dtsSQLEdit: TDataSource
    DataSet = sqlDevolucao
    Left = 211
    Top = 195
  end
  object sqlDadosEntidade: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT'
      'C.KCAD_ENTIDADE,'
      'CAST ('
      'SUBSTRING ( C.NOME || ASCII_CHAR( 13 ) || ASCII_CHAR( 10 ) ||'
      
        'COALESCE ( E.ENDERECO, '#39#39' )  || COALESCE ( '#39', '#39' || E.COMPLEMENTO' +
        ', '#39#39' ) || COALESCE ( '#39', '#39' || E.BAIRRO, '#39#39' ) || ASCII_CHAR( 13 ) ' +
        '|| ASCII_CHAR( 10 ) ||'
      
        'COALESCE ( '#39'CEP: '#39' || E.CEP, '#39'?????-???'#39' ) || COALESCE ( '#39', '#39' ||' +
        ' E.CIDADE, '#39#39' ) || COALESCE ( '#39', '#39' ||  E.UF, '#39#39' ) || ASCII_CHAR(' +
        ' 13 ) || ASCII_CHAR( 10 ) ||'
      
        #39'CNJP: '#39' || COALESCE ( C.CPF_CNPJ, '#39'??????'#39' ) || '#39', IE: '#39' || COA' +
        'LESCE ( C.RG_IE, '#39'??????'#39' ) FROM 1 FOR 512 )'
      'AS VARCHAR ( 512 ) character set NONE ) DADOSENTIDADE,'
      'EMAIL, C.FONE'
      'FROM CAD_ENTIDADES C'
      'LEFT JOIN GLB_ENDERECOS E ON E.KGLB_ENDERECO = C.KENDERECO'
      'WHERE C.KCAD_ENTIDADE =  :KCAD_ENTIDADE')
    Left = 99
    Top = 366
    object sqlDadosEntidadeKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Required = True
      FixedChar = True
    end
    object sqlDadosEntidadeDADOSENTIDADE: TStringField
      FieldName = 'DADOSENTIDADE'
      Size = 512
    end
    object sqlDadosEntidadeEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 64
    end
    object sqlDadosEntidadeFONE: TStringField
      FieldName = 'FONE'
      Size = 16
    end
  end
  object dspDadosEntidade: TDataSetProvider
    DataSet = sqlDadosEntidade
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 321
  end
  object sqlDadosProduto: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'KEST_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  P.CODIGO,'
      '  P.NOME,'
      '  P.BAIXA_ESTOQUE,'
      '  P.KFIN_PLANOCONTA,'
      '  P.UNIDADE,'
      '  P.DESCRICAO,'
      '  PL.NOME DESCRICAO_APROPRIACAO,'
      '  P.OBS'
      'FROM  EST_PRODUTOS P'
      
        'LEFT JOIN FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = P.KFIN_PLAN' +
        'OCONTA'
      'WHERE KEST_PRODUTO = :KEST_PRODUTO')
    Left = 280
    Top = 366
    object sqlDadosProdutoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlDadosProdutoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlDadosProdutoBAIXA_ESTOQUE: TStringField
      FieldName = 'BAIXA_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sqlDadosProdutoKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlDadosProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlDadosProdutoDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlDadosProdutoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlDadosProdutoDESCRICAO_APROPRIACAO: TStringField
      FieldName = 'DESCRICAO_APROPRIACAO'
      Size = 64
    end
  end
  object dspDadosProduto: TDataSetProvider
    DataSet = sqlDadosProduto
    Left = 240
    Top = 321
  end
  object sqlAReceber: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KDEV_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KFIN_ARECEBER'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  A.KFIN_ARECEBER,'
      '  A.KSYS$DOMAIN,'
      '  CAST( :KDEV_PEDIDO AS SYS$FKGUID20) KDEV_PEDIDO,'
      '  A.ATIVO,'
      '  A.TABLENAME,'
      '  A.TABLEKEY,'
      '  A.KCAD_ENTIDADE,'
      '  A.NOMEENTIDADE,'
      '  A.HISTORICO,'
      '  A.DOCUMENTO,'
      '  A.DATALANCTO,'
      '  A.NUM_PARCELAS,'
      '  A.DIA_VENCTO,'
      '  A.PROXIMO_MES,'
      '  A.ANUAL,'
      '  A.RECORRENCIA,'
      '  A.KFIN_CONTA_PREF,'
      '  C.NOME NOMECONTA,'
      '  A.KFIN_PLANOCONTA,'
      '  A.OBS,'
      '  A.PAGTO_AVISTA'
      'FROM FIN_ARECEBER A'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = A.KFIN_CONTA_PREF'
      'WHERE A.KFIN_ARECEBER = :KFIN_ARECEBER')
    Left = 471
    Top = 148
    object sqlAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlAReceberKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlAReceberATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAReceberTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlAReceberTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object sqlAReceberANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAReceberKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object sqlAReceberNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlAReceberPAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlAReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlAReceberDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlAReceberNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object sqlAReceberPROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAReceberRECORRENCIA: TStringField
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAReceberDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object sqlAReceberKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object sqlAReceberNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object sqlAReceberKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlAReceberOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlAReceberKDEV_PEDIDO: TStringField
      FieldName = 'KDEV_PEDIDO'
      Required = True
      FixedChar = True
    end
  end
  object sqlParcelas: TTcSQLDataSet
    GetMetadata = False
    DataSource = dtsSQLAReceber
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_ARECEBER'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KDEV_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT  '
      '  P.KFIN_ARECEBER_PARCELA'
      ', CAST( :KFIN_ARECEBER AS SYS$FKGUID20 ) KFIN_ARECEBER'
      ', P.DOCUMENTO'
      ', P.VENCTO'
      ', P.VALOR '
      ', P.PAGTO '
      ', P.PAGO '
      ', P.KFIN_CONTA'
      ', C.NOME NOMECONTA'
      ', P.PREVISAO'
      ', P.DUVIDOSO '
      ', P.OBS'
      ', P.CHEQUE'
      ', P.DT_COMPENSACAO'
      ', P.NUM_CHEQUE'
      'FROM FIN_ARECEBER A'
      
        'LEFT JOIN FIN_ARECEBER_PARCELAS P ON P.KFIN_ARECEBER = A.KFIN_AR' +
        'ECEBER'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      'WHERE   '
      '        A.TABLENAME  = '#39'DEV_PEDIDOS'#39' '
      'AND A.TABLEKEY = :KDEV_PEDIDO'
      'AND P.KFIN_ARECEBER_PARCELA IS NOT NULL')
    Left = 532
    Top = 148
    object sqlParcelasKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlParcelasKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      FixedChar = True
    end
    object sqlParcelasDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlParcelasVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlParcelasVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
    end
    object sqlParcelasPAGTO: TSQLTimeStampField
      DisplayLabel = 'Pagamento'
      FieldName = 'PAGTO'
    end
    object sqlParcelasPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
    end
    object sqlParcelasKFIN_CONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object sqlParcelasNOMECONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object sqlParcelasPREVISAO: TStringField
      DisplayLabel = 'Previs'#227'o'
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasDUVIDOSO: TStringField
      DisplayLabel = 'Duvidoso'
      FieldName = 'DUVIDOSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasCHEQUE: TStringField
      DisplayLabel = 'Pagamento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object sqlParcelasDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object sqlParcelasOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsSQLAReceber: TDataSource
    DataSet = sqlAReceber
    Left = 501
    Top = 195
  end
  object cdsApropriacaoItem: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsItensPedidosqlApropriacaoItem
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    OnNewRecord = cdsApropriacaoItemNewRecord
    Left = 375
    Top = 57
    object cdsApropriacaoItemKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsApropriacaoItemKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object cdsApropriacaoItemCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cdsApropriacaoItemCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object cdsApropriacaoItemNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsApropriacaoItemPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object cdsApropriacaoItemTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsApropriacaoItemTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsApropriacaoItemTOTAL_PORCENTAGEM: TAggregateField
      DisplayLabel = 'Total porcentagem'
      FieldName = 'TOTAL_PORCENTAGEM'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PORCENTAGEM)'
    end
  end
  object sqlApropriacaoItem: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLItemPedido
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'KDEV_PEDIDO_ITEM'
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
      'WHERE A.TABLENAME = '#39'DEV_PEDIDO_ITENS'#39' '
      '  AND A.TABLEKEY = :KDEV_PEDIDO_ITEM')
    Left = 374
    Top = 148
    object sqlApropriacaoItemKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApropriacaoItemKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object sqlApropriacaoItemCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object sqlApropriacaoItemCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlApropriacaoItemNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlApropriacaoItemPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoItemTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApropriacaoItemTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
  end
  object dtsSQLItemPedido: TDataSource
    DataSet = sqlItensPedido
    Left = 328
    Top = 195
  end
  object cdsAPagarTransporte: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDevolucaosqlAPagarTransporte
    Params = <
      item
        DataType = ftString
        Name = 'KFIN_APAGAR_TRANSPORTE'
        ParamType = ptInput
      end>
    OnNewRecord = cdsAPagarTransporteNewRecord
    Left = 647
    Top = 57
    object cdsAPagarTransporteKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsAPagarTransporteKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsAPagarTransporteTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsAPagarTransporteTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsAPagarTransporteATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarTransporteKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object cdsAPagarTransporteNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Required = True
      Size = 128
    end
    object cdsAPagarTransporteANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarTransporteHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Required = True
      Size = 128
    end
    object cdsAPagarTransporteDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAPagarTransporteDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsAPagarTransporteNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object cdsAPagarTransportePROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarTransporteRECORRENCIA: TStringField
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarTransporteDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object cdsAPagarTransporteKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object cdsAPagarTransporteNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      OnSetText = cdsAPagarTransporteNOMECONTASetText
      Size = 64
    end
    object cdsAPagarTransporteKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object cdsAPagarTransporteOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsAPagarTransporteStatusCadastro: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusCadastro'
      Size = 1
      Calculated = True
    end
    object cdsAPagarTransportesqlParcelasTransporte: TDataSetField
      DisplayLabel = 'Parcelas transportadora'
      FieldName = 'sqlParcelasTransporte'
    end
    object cdsAPagarTransportePAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsParcelasTransporte: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsAPagarTransportesqlParcelasTransporte
    IndexFieldNames = 'VENCTO'
    Params = <>
    BeforeInsert = cdsParcelasTransporteBeforeInsert
    BeforeEdit = cdsParcelasTransporteBeforeEdit
    BeforePost = cdsParcelasTransporteBeforePost
    BeforeDelete = cdsParcelasTransporteBeforeDelete
    OnCalcFields = cdsParcelasTransporteCalcFields
    OnNewRecord = cdsParcelasTransporteNewRecord
    Left = 752
    Top = 61
    object cdsParcelasTransporteKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsParcelasTransporteKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object cdsParcelasTransporteDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsParcelasTransporteVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsParcelasTransporteVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasTransportePAGTO: TSQLTimeStampField
      DisplayLabel = 'Pagamento'
      FieldName = 'PAGTO'
    end
    object cdsParcelasTransportePAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasTransporteKFIN_CONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object cdsParcelasTransporteNOMECONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      OnSetText = cdsParcelasTransporteNOMECONTASetText
      Size = 64
    end
    object cdsParcelasTransportePREVISAO: TStringField
      DisplayLabel = 'Previs'#227'o'
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParcelasTransporteDUVIDOSO: TStringField
      DisplayLabel = 'Duvidoso'
      FieldName = 'DUVIDOSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParcelasTransporteOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsParcelasTransportetmpCalc: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'tmpCalc'
    end
    object cdsParcelasTransporteCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Required = True
      OnChange = cdsParcelasTransporteCHEQUEChange
      FixedChar = True
      Size = 1
    end
    object cdsParcelasTransporteDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
    end
    object cdsParcelasTransporteNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      OnSetText = cdsParcelasTransporteNUM_CHEQUESetText
      Size = 32
    end
    object cdsParcelasTransporteSomaValor: TAggregateField
      DisplayLabel = 'Total'
      FieldName = 'SomaValor'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VALOR)'
    end
  end
  object sqlAPagarTransporte: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR_TRANSPORTE'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  A.KFIN_APAGAR,'
      '  A.KSYS$DOMAIN,'
      '  A.ATIVO,'
      '  A.TABLENAME,'
      '  A.TABLEKEY,'
      '  A.KCAD_ENTIDADE,'
      '  A.NOMEENTIDADE,'
      '  A.HISTORICO,'
      '  A.DOCUMENTO,'
      '  A.DATALANCTO,'
      '  A.NUM_PARCELAS,'
      '  A.PROXIMO_MES,'
      '  A.ANUAL,'
      '  A.RECORRENCIA, '
      '  A.DIA_VENCTO,'
      '  A.KFIN_CONTA_PREF,'
      '  C.NOME NOMECONTA,'
      '  A.KFIN_PLANOCONTA,'
      '  A.PAGTO_AVISTA,'
      '  A.OBS'
      'FROM FIN_APAGAR A'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = A.KFIN_CONTA_PREF'
      'WHERE A.KFIN_APAGAR = :KFIN_APAGAR_TRANSPORTE')
    Left = 647
    Top = 148
    object sqlAPagarTransporteKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlAPagarTransporteKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlAPagarTransporteATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAPagarTransporteANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAPagarTransporteTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlAPagarTransporteTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object sqlAPagarTransporteKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object sqlAPagarTransporteNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlAPagarTransporteHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlAPagarTransporteDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlAPagarTransporteDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlAPagarTransporteNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object sqlAPagarTransportePROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAPagarTransporteRECORRENCIA: TStringField
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAPagarTransporteDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object sqlAPagarTransporteKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object sqlAPagarTransporteNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object sqlAPagarTransporteKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlAPagarTransporteOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlAPagarTransportePAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object sqlParcelasTransporte: TTcSQLDataSet
    GetMetadata = False
    DataSource = dtsSQLAPagarTransporte
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select  '
      '  P.KFIN_APAGAR_PARCELA, '
      '  P.KFIN_APAGAR, '
      '  P.DOCUMENTO, '
      '  P.VENCTO, '
      '  P.VALOR, '
      '  P.PAGTO, '
      '  P.PAGO, '
      '  P.KFIN_CONTA,'
      '  C.NOME NOMECONTA,'
      '  P.PREVISAO, '
      '  P.DUVIDOSO, '
      '  P.CHEQUE,'
      '  P.DT_COMPENSACAO,'
      '  P.NUM_CHEQUE,'
      '  P.OBS '
      'from FIN_APAGAR_PARCELAS P'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      'WHERE   P.KFIN_APAGAR = :KFIN_APAGAR')
    Left = 756
    Top = 148
    object sqlParcelasTransporteKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlParcelasTransporteKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object sqlParcelasTransporteDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlParcelasTransporteVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlParcelasTransporteVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
    end
    object sqlParcelasTransportePAGTO: TSQLTimeStampField
      DisplayLabel = 'Pagamento'
      FieldName = 'PAGTO'
    end
    object sqlParcelasTransportePAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
    end
    object sqlParcelasTransporteKFIN_CONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object sqlParcelasTransporteNOMECONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object sqlParcelasTransportePREVISAO: TStringField
      DisplayLabel = 'Previs'#227'o'
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasTransporteDUVIDOSO: TStringField
      DisplayLabel = 'Duvidoso'
      FieldName = 'DUVIDOSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasTransporteOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlParcelasTransporteCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasTransporteDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
    end
    object sqlParcelasTransporteNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
  end
  object dtsSQLAPagarTransporte: TDataSource
    DataSet = sqlAPagarTransporte
    Left = 677
    Top = 195
  end
  object cdsUnidadesCompra: TClientDataSet
    PersistDataPacket.Data = {
      570000009619E0BD01000000180000000200000000000300000057000A4B4341
      445F5449504F5301004900000001000557494454480200020020000944455343
      524943414F01004900000001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 925
    Top = 88
    object cdsUnidadesCompraKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      Size = 32
    end
    object cdsUnidadesCompraDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
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
    Left = 925
    Top = 144
    object cdsUnidadesKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      Size = 32
    end
    object cdsUnidadesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
  end
  object sqlProdutosFornecedor: TTcSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '   KEST_PRODUTO,'
      '   KCAD_FORNECEDOR,'
      '   CODIGO,'
      '   NOME'
      '  FROM EST_PRODUTO_FORNECEDORES')
    Left = 845
    Top = 352
    object sqlProdutosFornecedorKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      Required = True
      FixedChar = True
    end
    object sqlProdutosFornecedorKCAD_FORNECEDOR: TStringField
      FieldName = 'KCAD_FORNECEDOR'
      Required = True
      FixedChar = True
    end
    object sqlProdutosFornecedorCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlProdutosFornecedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
  end
  object dspProdutosFornecedor: TDataSetProvider
    DataSet = sqlProdutosFornecedor
    BeforeUpdateRecord = dspProdutosFornecedorBeforeUpdateRecord
    Left = 789
    Top = 328
  end
  object cdsProdutosFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosFornecedor'
    Left = 853
    Top = 288
    object cdsProdutosFornecedorKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      Required = True
      FixedChar = True
    end
    object cdsProdutosFornecedorKCAD_FORNECEDOR: TStringField
      FieldName = 'KCAD_FORNECEDOR'
      Required = True
      FixedChar = True
    end
    object cdsProdutosFornecedorCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsProdutosFornecedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
  end
end
