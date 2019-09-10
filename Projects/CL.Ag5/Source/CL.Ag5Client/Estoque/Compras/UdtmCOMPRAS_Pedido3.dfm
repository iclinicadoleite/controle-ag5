object dtmCOMPRAS_Pedido: TdtmCOMPRAS_Pedido
  OldCreateOrder = True
  Height = 441
  Width = 1395
  object cdsLstPedidos: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'KCMP_PEDIDO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KSYS$DOMAIN'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOTA_FISCAL'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'NOTA_FISCAL_'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'SERIE'
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
        DataType = ftTimeStamp
      end
      item
        Name = 'DATA_ENTRADA'
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
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstPedidos'
    StoreDefs = True
    OnNewRecord = cdsLstPedidosNewRecord
    Left = 63
    Top = 56
    object cdsLstPedidosKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstPedidosKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object cdsLstPedidosNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota Fiscal'
      DisplayWidth = 17
      FieldName = 'NOTA_FISCAL'
      Size = 32
    end
    object cdsLstPedidosNOTA_FISCAL_: TStringField
      DisplayLabel = 'Nota fiscal'
      FieldName = 'NOTA_FISCAL_'
      Visible = False
      Size = 32
    end
    object cdsLstPedidosSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      DisplayWidth = 11
      FieldName = 'SERIE'
      Size = 32
    end
    object cdsLstPedidosNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsLstPedidosDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      DisplayWidth = 25
      FieldName = 'DATA_EMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLstPedidosDATA_ENTRADA: TSQLTimeStampField
      DisplayLabel = 'Data entrada'
      DisplayWidth = 25
      FieldName = 'DATA_ENTRADA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLstPedidosIMPOSTOS: TFloatField
      DisplayLabel = 'Impostos'
      DisplayWidth = 8
      FieldName = 'IMPOSTOS'
      Visible = False
      DisplayFormat = '#,0.00'
    end
    object cdsLstPedidosDESCONTOS: TFloatField
      DisplayLabel = 'Descontos'
      DisplayWidth = 10
      FieldName = 'DESCONTOS'
      Visible = False
      DisplayFormat = '#,0.00'
    end
    object cdsLstPedidosFRETE: TFloatField
      DisplayLabel = 'Frete'
      DisplayWidth = 7
      FieldName = 'FRETE'
      Visible = False
      DisplayFormat = '#,0.00'
    end
    object cdsLstPedidosTOTAL_NOTA: TFloatField
      DisplayLabel = 'Total'
      DisplayWidth = 7
      FieldName = 'TOTAL_NOTA'
      DisplayFormat = '#,0.00'
    end
    object cdsLstPedidosOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      DisplayWidth = 10
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    MasterSource = dtsList
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPedido'
    BeforeOpen = cdsPedidoBeforeOpen
    BeforeInsert = cdsPedidoBeforeInsert
    AfterInsert = cdsPedidoAfterInsert
    BeforeEdit = cdsPedidoBeforeEdit
    BeforeDelete = cdsPedidoBeforeDelete
    OnCalcFields = cdsPedidoCalcFields
    OnNewRecord = cdsPedidoNewRecord
    BeforeApplyUpdates = cdsPedidoBeforeApplyUpdates
    Left = 170
    Top = 60
    object cdsPedidoKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPedidoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPedidoKCAD_ENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'KCAD_ENTIDADE'
      Required = True
      Visible = False
      OnSetText = cdsAPagarNOMECONTASetText
      OnValidate = cdsPedidoKCAD_ENTIDADEValidate
      FixedChar = True
    end
    object cdsPedidoNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'NOTA_FISCAL'
      OnValidate = cdsPedidoNOTA_FISCALValidate
      Size = 32
    end
    object cdsPedidoSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      OnValidate = cdsPedidoSERIEValidate
      Size = 32
    end
    object cdsPedidoCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      EditMask = '0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000;0; '
      Size = 44
    end
    object cdsPedidoIMPORTADO_NFE: TStringField
      FieldName = 'IMPORTADO_NFE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPedidoNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      OnSetText = cdsPedidoNOMEENTIDADESetText
      Size = 128
    end
    object cdsPedidoDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
      Required = True
      OnValidate = cdsPedidoDATA_EMISSAOValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPedidoDATA_COMPRA: TSQLTimeStampField
      DisplayLabel = 'Data compra'
      FieldName = 'DATA_COMPRA'
      Required = True
      OnChange = cdsPedidoDATA_COMPRAChange
      OnValidate = cdsPedidoDATA_COMPRAValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPedidoDATA_ENTRADA: TSQLTimeStampField
      DisplayLabel = 'Data entrada'
      FieldName = 'DATA_ENTRADA'
      Required = True
      Visible = False
      OnValidate = cdsPedidoDATA_ENTRADAValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPedidoIMPOSTOS: TFloatField
      DisplayLabel = 'Impostos'
      FieldName = 'IMPOSTOS'
      DisplayFormat = '#,0.00#####'
    end
    object cdsPedidoDESCONTOS: TFloatField
      DisplayLabel = 'Descontos'
      FieldName = 'DESCONTOS'
      DisplayFormat = '#,0.00#####'
    end
    object cdsPedidoFRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'FRETE'
      DisplayFormat = '#,0.00#####'
    end
    object cdsPedidoKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Visible = False
      FixedChar = True
    end
    object cdsPedidoKFIN_APAGAR_TRANSPORTE: TStringField
      FieldName = 'KFIN_APAGAR_TRANSPORTE'
      FixedChar = True
    end
    object cdsPedidoTOTAL_ITENS: TFloatField
      DisplayLabel = 'Total '#237'tens'
      FieldName = 'TOTAL_ITENS'
      DisplayFormat = '#,0.00'
    end
    object cdsPedidoTOTAL_SERVICOS: TFloatField
      DisplayLabel = 'Total servi'#231'os'
      FieldName = 'TOTAL_SERVICOS'
      DisplayFormat = '#,0.00'
    end
    object cdsPedidoTOTAL_NOTA: TFloatField
      DisplayLabel = 'Total nota'
      FieldName = 'TOTAL_NOTA'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsPedidoATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPedidoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPedidoXML_NFE: TMemoField
      FieldName = 'XML_NFE'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPedidoMODELO_NFE: TIntegerField
      FieldName = 'MODELO_NFE'
    end
    object cdsPedidosqlItensPedido: TDataSetField
      DisplayLabel = 'Itens'
      FieldName = 'sqlItensPedido'
    end
    object cdsPedidosqlPatrimoniosPedido: TDataSetField
      FieldName = 'sqlPatrimoniosPedido'
    end
    object cdsPedidosqlServicosPedido: TDataSetField
      DisplayLabel = 'Servi'#231'os'
      FieldName = 'sqlServicosPedido'
    end
    object cdsPedidosqlApagar: TDataSetField
      DisplayLabel = 'Dados a pagar'
      FieldName = 'sqlApagar'
    end
    object cdsPedidosqlApagarTransporte: TDataSetField
      DisplayLabel = 'Transportadora'
      FieldName = 'sqlApagarTransporte'
    end
    object cdsPedidotmpCalc: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'tmpCalc'
    end
    object cdsPedidoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
    object cdsPedidoTOTAL_PATRIMONIOS: TFloatField
      DisplayLabel = 'Total patrim'#244'nios'
      FieldName = 'TOTAL_PATRIMONIOS'
      Required = True
      DisplayFormat = '#,0.00'
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstPedidos
    Left = 120
    Top = 8
  end
  object cdsItensPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsPedidosqlItensPedido
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
    object cdsItensPedidoKCMP_PEDIDO_ITEM: TStringField
      FieldName = 'KCMP_PEDIDO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsItensPedidoKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
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
    object cdsItensPedidoKCAD_PATRIMONIO: TStringField
      DisplayLabel = 'Patrimonio'
      FieldName = 'KCAD_PATRIMONIO'
      FixedChar = True
    end
    object cdsItensPedidoIS_PATRIMONIO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'IS_PATRIMONIO'
      Required = True
      FixedChar = True
      Size = 1
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
    object cdsItensPedidoTIPOITEM: TStringField
      FieldKind = fkLookup
      FieldName = 'TIPOITEM'
      LookupDataSet = cdsTipoItem
      LookupKeyFields = 'TIPO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'IS_PATRIMONIO'
      Size = 10
      Lookup = True
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
      OnChange = cdsItensPedidoQTDE_COMPRAChange
      DisplayFormat = '#,0.####'
    end
    object cdsItensPedidoUNIDADE_COMPRA: TStringField
      FieldName = 'UNIDADE_COMPRA'
      FixedChar = True
      Size = 3
    end
    object cdsItensPedidoUNITARIO_COMPRA: TFloatField
      FieldName = 'UNITARIO_COMPRA'
      DisplayFormat = '#,0.00#####'
    end
    object cdsItensPedidoATUALIZAR_CUSTO: TStringField
      FieldName = 'ATUALIZAR_CUSTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsItensPedidoVALOR_IPI: TFloatField
      FieldName = 'VALOR_IPI'
      DisplayFormat = '#,0.00#####'
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
    Left = 1337
    Top = 296
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
    DataSet = cdsPedido
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
  object cdsServicosPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsPedidosqlServicosPedido
    Params = <>
    BeforeInsert = cdsServicosPedidoBeforeInsert
    BeforeEdit = cdsServicosPedidoBeforeEdit
    BeforePost = cdsServicosPedidoBeforePost
    AfterCancel = cdsServicosPedidoAfterCancel
    AfterDelete = cdsServicosPedidoAfterDelete
    OnCalcFields = cdsServicosPedidoCalcFields
    OnNewRecord = cdsServicosPedidoNewRecord
    Left = 681
    Top = 56
    object cdsServicosPedidoKCMP_PEDIDO_SERVICO: TStringField
      FieldName = 'KCMP_PEDIDO_SERVICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsServicosPedidoKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsServicosPedidoKEST_PRODUTO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'KEST_PRODUTO'
      FixedChar = True
    end
    object cdsServicosPedidoCODIGO_NOME: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CODIGO_NOME'
      Size = 128
    end
    object cdsServicosPedidoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsServicosPedidoNOME: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'NOME'
      OnSetText = cdsServicosPedidoNOMESetText
      Size = 128
    end
    object cdsServicosPedidoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsServicosPedidoCUSTO: TFloatField
      DisplayLabel = 'Valor unit'#225'rio'
      FieldName = 'CUSTO'
      DisplayFormat = '#,0.00##'
    end
    object cdsServicosPedidoDETALHES: TMemoField
      DisplayLabel = 'Detalhes'
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsServicosPedidoQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      DisplayFormat = '#,0.####'
    end
    object cdsServicosPedidoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00##'
    end
    object cdsServicosPedidoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsServicosPedidoKFIN_PLANOCONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'KFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object cdsServicosPedidoDESCR_PC_NOME: TStringField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      OnSetText = cdsServicosPedidoDESCR_PC_NOMESetText
      Size = 64
    end
    object cdsServicosPedidoDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      OnGetText = cdsServicosPedidoDESCR_PC_CLASSIFICACAOGetText
      Size = 32
    end
    object cdsServicosPedidoDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object cdsServicosPedidoDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsServicosPedidoTmpCalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TmpCalc'
      Calculated = True
    end
    object cdsServicosPedidosqlApropriacaoServico: TDataSetField
      FieldName = 'sqlApropriacaoServico'
    end
    object cdsServicosPedidoSomaTotal: TAggregateField
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM( TOTAL )'
    end
  end
  object cdsAPagar: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPedidosqlApagar
    Params = <>
    OnNewRecord = cdsAPagarNewRecord
    Left = 875
    Top = 57
    object cdsAPagarKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsAPagarKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsAPagarTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsAPagarTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsAPagarATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object cdsAPagarNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Required = True
      Size = 128
    end
    object cdsAPagarANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Required = True
      Size = 128
    end
    object cdsAPagarDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAPagarDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsAPagarNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object cdsAPagarPROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarRECORRENCIA: TStringField
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object cdsAPagarKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object cdsAPagarNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      OnSetText = cdsAPagarNOMECONTASetText
      Size = 64
    end
    object cdsAPagarKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object cdsAPagarOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsAPagarPAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      Required = True
      OnChange = cdsAPagarPAGTO_AVISTAChange
      FixedChar = True
      Size = 1
    end
    object cdsAPagarsqlParcelas: TDataSetField
      DisplayLabel = 'Parcelas a pagar'
      FieldName = 'sqlParcelas'
    end
    object cdsAPagarStatusCadastro: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusCadastro'
      Size = 1
      Calculated = True
    end
    object cdsAPagarKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      ProviderFlags = []
      Required = True
      FixedChar = True
    end
    object cdsAPagarKFIN_APAGAR_TRANSPORTE: TStringField
      FieldName = 'KFIN_APAGAR_TRANSPORTE'
      ProviderFlags = []
      FixedChar = True
    end
  end
  object cdsParcelas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsAPagarsqlParcelas
    IndexFieldNames = 'KFIN_APAGAR;VENCTO'
    FetchOnDemand = False
    Params = <>
    BeforeInsert = cdsParcelasBeforeInsert
    BeforeEdit = cdsParcelasBeforeEdit
    BeforePost = cdsParcelasBeforePost
    BeforeDelete = cdsParcelasBeforeDelete
    OnCalcFields = cdsParcelasCalcFields
    OnNewRecord = cdsParcelasNewRecord
    Left = 936
    Top = 57
    object cdsParcelasKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsParcelasKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
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
    object cdsParcelasPRORROGACAO: TSQLTimeStampField
      DisplayLabel = 'Prorroga'#231#227'o'
      FieldName = 'PRORROGACAO'
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
  object dspLstPedidos: TDataSetProvider
    DataSet = sqlLstPedidos
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 23
    Top = 105
  end
  object dspPedido: TDataSetProvider
    DataSet = sqlPedido
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates]
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspPedidoGetTableName
    Left = 135
    Top = 105
  end
  object sqlLstPedidos: TTcSQLDataSet
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
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  KCMP_PEDIDO,'
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
      'FROM CMP_PEDIDOS'
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND ( ( :LISTALL = '#39'T'#39' )'
      '        AND ( :DSP_INATIVO = '#39'T'#39' OR ( ATIVO = '#39'T'#39' ) )'
      '        AND DATA_EMISSAO BETWEEN :DATAINI AND :DATAFIM'
      '         )'
      '  OR ( ( :LISTALL = '#39'F'#39' )'
      '           AND KCMP_PEDIDO = :KCMP_PEDIDO )')
    Left = 50
    Top = 153
    object sqlLstPedidosKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstPedidosKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object sqlLstPedidosNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'NOTA_FISCAL'
      Size = 32
    end
    object sqlLstPedidosNOTA_FISCAL_: TStringField
      DisplayLabel = 'Nota fiscal'
      FieldName = 'NOTA_FISCAL_'
      Size = 32
    end
    object sqlLstPedidosSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 32
    end
    object sqlLstPedidosNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlLstPedidosDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
    end
    object sqlLstPedidosDATA_ENTRADA: TSQLTimeStampField
      DisplayLabel = 'Data entrada'
      FieldName = 'DATA_ENTRADA'
    end
    object sqlLstPedidosIMPOSTOS: TFloatField
      DisplayLabel = 'Impostos'
      FieldName = 'IMPOSTOS'
    end
    object sqlLstPedidosDESCONTOS: TFloatField
      DisplayLabel = 'Descontos'
      FieldName = 'DESCONTOS'
    end
    object sqlLstPedidosFRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'FRETE'
    end
    object sqlLstPedidosTOTAL_NOTA: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL_NOTA'
    end
    object sqlLstPedidosOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlPedido: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    BeforeOpen = sqlPedidoBeforeOpen
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  KCMP_PEDIDO,'
      '  KSYS$DOMAIN,'
      '  KCAD_ENTIDADE,'
      '  NOTA_FISCAL,'
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
      '  KFIN_APAGAR,'
      '  KFIN_APAGAR_TRANSPORTE,'
      '  TOTAL_ITENS,'
      '  TOTAL_PATRIMONIOS,'
      '  TOTAL_SERVICOS,'
      '  TOTAL_NOTA,'
      '  ATIVO,'
      '  MODELO_NFE,'
      '  SYS$ORIGIN_TYPE,'
      '  cast( OBS as BLOB ) OBS,'
      '  cast( XML_NFE as BLOB ) XML_NFE'
      'FROM CMP_PEDIDOS'
      'WHERE KCMP_PEDIDO = :KCMP_PEDIDO')
    Left = 170
    Top = 148
    object sqlPedidoKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPedidoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPedidoKCAD_ENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'KCAD_ENTIDADE'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPedidoNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'NOTA_FISCAL'
      Size = 32
    end
    object sqlPedidoSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 32
    end
    object sqlPedidoCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 44
    end
    object sqlPedidoIMPORTADO_NFE: TStringField
      FieldName = 'IMPORTADO_NFE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPedidoNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Required = True
      Size = 128
    end
    object sqlPedidoDATA_COMPRA: TSQLTimeStampField
      DisplayLabel = 'Data compra'
      FieldName = 'DATA_COMPRA'
      Required = True
    end
    object sqlPedidoDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
      Required = True
    end
    object sqlPedidoDATA_ENTRADA: TSQLTimeStampField
      DisplayLabel = 'Data entrada'
      FieldName = 'DATA_ENTRADA'
      Required = True
    end
    object sqlPedidoIMPOSTOS: TFloatField
      DisplayLabel = 'Impostos'
      FieldName = 'IMPOSTOS'
    end
    object sqlPedidoDESCONTOS: TFloatField
      DisplayLabel = 'Descontos'
      FieldName = 'DESCONTOS'
    end
    object sqlPedidoFRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'FRETE'
    end
    object sqlPedidoKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPedidoKFIN_APAGAR_TRANSPORTE: TStringField
      FieldName = 'KFIN_APAGAR_TRANSPORTE'
      FixedChar = True
    end
    object sqlPedidoTOTAL_ITENS: TFloatField
      DisplayLabel = 'Total '#237'tens'
      FieldName = 'TOTAL_ITENS'
      Required = True
    end
    object sqlPedidoTOTAL_SERVICOS: TFloatField
      DisplayLabel = 'Total servi'#231'os'
      FieldName = 'TOTAL_SERVICOS'
      Required = True
    end
    object sqlPedidoTOTAL_NOTA: TFloatField
      DisplayLabel = 'Total nota'
      FieldName = 'TOTAL_NOTA'
      Required = True
    end
    object sqlPedidoATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPedidoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlPedidoXML_NFE: TMemoField
      FieldName = 'XML_NFE'
      BlobType = ftMemo
      Size = 1
    end
    object sqlPedidoMODELO_NFE: TIntegerField
      FieldName = 'MODELO_NFE'
    end
    object sqlPedidoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
    object sqlPedidoTOTAL_PATRIMONIOS: TFloatField
      FieldName = 'TOTAL_PATRIMONIOS'
      Required = True
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
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  I.KCMP_PEDIDO_ITEM,'
      '  I.KCMP_PEDIDO,'
      '  I.KEST_PRODUTO,'
      '  I.KCAD_PATRIMONIO,'
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
      '  I.IS_PATRIMONIO,'
      '  I.KFIN_PLANOCONTA,'
      '  P.NOME DESCR_PC_NOME,'
      '  P.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  P.CODIGO DESCR_PC_CODIGO,'
      '  P.TIPO_APRD DESCR_PC_TIPO_APRD'
      'FROM CMP_PEDIDO_ITENS I'
      
        'LEFT JOIN FIN_PLANOCONTAS P ON P.KFIN_PLANOCONTA = I.KFIN_PLANOC' +
        'ONTA'
      'WHERE I.KCMP_PEDIDO = :KCMP_PEDIDO'
      '  AND I.IS_PATRIMONIO = '#39'F'#39)
    Left = 285
    Top = 148
    object sqlItensPedidoKCMP_PEDIDO_ITEM: TStringField
      FieldName = 'KCMP_PEDIDO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlItensPedidoKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
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
    object sqlItensPedidoKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      FixedChar = True
    end
    object sqlItensPedidoIS_PATRIMONIO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'IS_PATRIMONIO'
      Required = True
      FixedChar = True
      Size = 1
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
      DisplayFormat = '#,0.00#####'
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
      DisplayFormat = '#,0.00#####'
    end
  end
  object dtsSQLEdit: TDataSource
    DataSet = sqlPedido
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
  object sqlServicosPedido: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  S.KCMP_PEDIDO_SERVICO,'
      '  S.KCMP_PEDIDO,'
      '  S.KEST_PRODUTO,'
      '  S.CODIGO,'
      '  S.NOME,'
      '  S.UNIDADE,'
      '  S.CUSTO,'
      '  S.DETALHES,'
      '  S.QTDE,'
      '  S.TOTAL,'
      '  S.OBS,'
      '  S.KFIN_PLANOCONTA,'
      '  P.NOME DESCR_PC_NOME,'
      '  P.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  P.CODIGO DESCR_PC_CODIGO,'
      '  P.TIPO_APRD DESCR_PC_TIPO_APRD'
      'FROM CMP_PEDIDO_SERVICOS S'
      
        'LEFT JOIN FIN_PLANOCONTAS P ON P.KFIN_PLANOCONTA = S.KFIN_PLANOC' +
        'ONTA'
      'WHERE S.KCMP_PEDIDO = :KCMP_PEDIDO')
    Left = 681
    Top = 150
    object sqlServicosPedidoKCMP_PEDIDO_SERVICO: TStringField
      FieldName = 'KCMP_PEDIDO_SERVICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlServicosPedidoKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlServicosPedidoKEST_PRODUTO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'KEST_PRODUTO'
      FixedChar = True
    end
    object sqlServicosPedidoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlServicosPedidoNOME: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlServicosPedidoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object sqlServicosPedidoCUSTO: TFloatField
      DisplayLabel = 'Valor unit'#225'rio'
      FieldName = 'CUSTO'
    end
    object sqlServicosPedidoDETALHES: TMemoField
      DisplayLabel = 'Detalhes'
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object sqlServicosPedidoQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object sqlServicosPedidoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object sqlServicosPedidoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlServicosPedidoKFIN_PLANOCONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'KFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object sqlServicosPedidoDESCR_PC_NOME: TStringField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlServicosPedidoDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlServicosPedidoDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object sqlServicosPedidoDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  object sqlApagar: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR_TRANSPORTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  A.KFIN_APAGAR,'
      '  A.KSYS$DOMAIN,'
      '  CAST( :KCMP_PEDIDO AS SYS$FKGUID20) KCMP_PEDIDO,'
      
        '  CAST( :KFIN_APAGAR_TRANSPORTE AS SYS$FKGUID20)  KFIN_APAGAR_TR' +
        'ANSPORTE,'
      '  A.ATIVO,'
      '  A.PAGTO_AVISTA,'
      '  A.TABLENAME,'
      '  A.TABLEKEY,'
      '  A.KCAD_ENTIDADE,'
      '  A.NOMEENTIDADE,'
      '  A.HISTORICO,'
      '  A.DOCUMENTO,'
      '  A.DATALANCTO,'
      '  A.NUM_PARCELAS,'
      '  A.ANUAL,'
      '  A.PROXIMO_MES,'
      '  A.RECORRENCIA, '
      '  A.DIA_VENCTO,'
      '  A.KFIN_CONTA_PREF,'
      '  C.NOME NOMECONTA,'
      '  A.KFIN_PLANOCONTA,'
      '  A.OBS'
      'FROM FIN_APAGAR A'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = A.KFIN_CONTA_PREF'
      'WHERE A.KFIN_APAGAR = :KFIN_APAGAR')
    Left = 875
    Top = 148
    object sqlApagarANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApagarKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlApagarATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApagarTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object sqlApagarKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object sqlApagarNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlApagarPAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlApagarDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlApagarDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlApagarNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object sqlApagarPROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarRECORRENCIA: TStringField
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object sqlApagarKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object sqlApagarNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object sqlApagarKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlApagarOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlApagarKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      ProviderFlags = []
      Required = True
      FixedChar = True
    end
    object sqlApagarKFIN_APAGAR_TRANSPORTE: TStringField
      FieldName = 'KFIN_APAGAR_TRANSPORTE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
  end
  object sqlParcelas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLAPagar
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR_TRANSPORTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select  '
      '   P.KFIN_APAGAR_PARCELA'
      ',  CAST( :KFIN_APAGAR AS SYS$FKGUID20 ) KFIN_APAGAR'
      ',  P.DOCUMENTO'
      ',  P.VENCTO'
      ',  P.PRORROGACAO'
      ',  P.VALOR'
      ',  P.PAGTO'
      ',  P.PAGO'
      ',  P.KFIN_CONTA'
      ',  C.NOME NOMECONTA'
      ',  P.PREVISAO'
      ',  P.DUVIDOSO'
      ',  P.CHEQUE'
      ',  P.NUM_CHEQUE'
      ',  P.DT_COMPENSACAO'
      ',  P.OBS'
      'FROM FIN_APAGAR A'
      'LEFT JOIN FIN_APAGAR_PARCELAS P ON P.KFIN_APAGAR = A.KFIN_APAGAR'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      'WHERE   '
      '        A.TABLENAME  = '#39'CMP_PEDIDOS'#39' '
      'AND A.KFIN_APAGAR IS DISTINCT FROM :KFIN_APAGAR_TRANSPORTE'
      'AND A.TABLEKEY = :KCMP_PEDIDO'
      'AND P.KFIN_APAGAR_PARCELA IS NOT NULL')
    Left = 936
    Top = 148
    object sqlParcelasKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlParcelasKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
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
    object sqlParcelasPRORROGACAO: TSQLTimeStampField
      DisplayLabel = 'Prorroga'#231#227'o'
      FieldName = 'PRORROGACAO'
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
  object dtsSQLAPagar: TDataSource
    DataSet = sqlApagar
    Left = 905
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
        Name = 'KCMP_PEDIDO_ITEM'
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
      'WHERE A.TABLENAME = '#39'CMP_PEDIDO_ITENS'#39' '
      '  AND A.TABLEKEY = :KCMP_PEDIDO_ITEM')
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
  object cdsApropriacaoServico: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsServicosPedidosqlApropriacaoServico
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    OnNewRecord = cdsApropriacaoServicoNewRecord
    Left = 787
    Top = 57
    object cdsApropriacaoServicoKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsApropriacaoServicoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      Visible = False
      FixedChar = True
    end
    object cdsApropriacaoServicoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cdsApropriacaoServicoCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object cdsApropriacaoServicoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsApropriacaoServicoPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object cdsApropriacaoServicoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsApropriacaoServicoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object AggregateField1: TAggregateField
      DisplayLabel = 'Total porcentagem'
      FieldName = 'TOTAL_PORCENTAGEM'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PORCENTAGEM)'
    end
  end
  object sqlApropriacaoServico: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dstSQLApropriacaoServico
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'KCMP_PEDIDO_SERVICO'
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
      'WHERE A.TABLENAME = '#39'CMP_PEDIDO_SERVICOS'#39' '
      '  AND A.TABLEKEY = :KCMP_PEDIDO_SERVICO')
    Left = 786
    Top = 148
    object StringField6: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object StringField8: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object StringField9: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object StringField10: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object FloatField2: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoServicoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApropriacaoServicoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
  end
  object dstSQLApropriacaoServico: TDataSource
    DataSet = sqlServicosPedido
    Left = 728
    Top = 192
  end
  object cdsPatrimonio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_PATRIMONIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPatrimonio'
    Left = 467
    Top = 278
    object cdsPatrimonioKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsPatrimonioCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsPatrimonioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object cdsPatrimonioUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsPatrimonioVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Required = True
    end
    object cdsPatrimonioQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object cdsPatrimonioOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPatrimonioKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object cdsPatrimonioDESCRICAO_APROPRIACAO: TStringField
      FieldName = 'DESCRICAO_APROPRIACAO'
      Size = 64
    end
    object cdsPatrimonioKFIN_CATEGORIA: TStringField
      FieldName = 'KFIN_CATEGORIA'
      Required = True
      FixedChar = True
    end
    object cdsPatrimonioDESCRICAO_CATEGORIA: TStringField
      FieldName = 'DESCRICAO_CATEGORIA'
      Size = 64
    end
  end
  object sqlPatrimonio: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_PATRIMONIO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    P.KCAD_PATRIMONIO,'
      '    P.CODIGO,'
      '    P.DESCRICAO,'
      '    P.UNIDADE,'
      '    P.VALOR_UNITARIO,'
      '    P.QUANTIDADE,'
      '    P.KFIN_PLANOCONTA,'
      '    PL.NOME DESCRICAO_APROPRIACAO,'
      '    P.KFIN_CATEGORIA,'
      '    CA.NOME DESCRICAO_CATEGORIA,'
      '    P.OBS'
      'FROM CAD_PATRIMONIOS P'
      
        'LEFT JOIN FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = P.KFIN_PLAN' +
        'OCONTA'
      
        'LEFT JOIN FIN_PLANOCONTAS CA ON CA.KFIN_PLANOCONTA = P.KFIN_CATE' +
        'GORIA'
      'WHERE P.KCAD_PATRIMONIO = :KCAD_PATRIMONIO')
    Left = 472
    Top = 366
    object sqlPatrimonioKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlPatrimonioCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlPatrimonioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object sqlPatrimonioUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlPatrimonioVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Required = True
    end
    object sqlPatrimonioQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object sqlPatrimonioOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlPatrimonioKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlPatrimonioDESCRICAO_APROPRIACAO: TStringField
      FieldName = 'DESCRICAO_APROPRIACAO'
      Size = 64
    end
    object sqlPatrimonioKFIN_CATEGORIA: TStringField
      FieldName = 'KFIN_CATEGORIA'
      Required = True
      FixedChar = True
    end
    object sqlPatrimonioDESCRICAO_CATEGORIA: TStringField
      FieldName = 'DESCRICAO_CATEGORIA'
      Size = 64
    end
  end
  object dspPatrimonio: TDataSetProvider
    DataSet = sqlPatrimonio
    Left = 432
    Top = 321
  end
  object cdsAPagarTransporte: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPedidosqlApagarTransporte
    Params = <
      item
        DataType = ftString
        Name = 'KFIN_APAGAR_TRANSPORTE'
        ParamType = ptInput
      end>
    OnNewRecord = cdsAPagarTransporteNewRecord
    Left = 1051
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
    object cdsAPagarTransporteANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarTransporteNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Required = True
      Size = 128
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
    object cdsAPagarTransportePAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      Required = True
      OnChange = cdsAPagarTransportePAGTO_AVISTAChange
      FixedChar = True
      Size = 1
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
    Left = 1160
    Top = 57
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
    object cdsParcelasTransporteCHEQUE: TStringField
      DisplayLabel = 'Pagamento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      OnChange = cdsParcelasTransporteCHEQUEChange
      FixedChar = True
      Size = 1
    end
    object cdsParcelasTransporteNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      OnSetText = cdsParcelasTransporteNUM_CHEQUESetText
      Size = 32
    end
    object cdsParcelasTransporteDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
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
    object cdsParcelasTransporteSomaValor: TAggregateField
      DisplayLabel = 'Total'
      FieldName = 'SomaValor'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VALOR)'
    end
  end
  object sqlApagarTransporte: TTcSQLDataSet
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
      'SELECT '
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
    Left = 1051
    Top = 148
    object sqlApagarTransporteKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApagarTransporteKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlApagarTransporteATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarTransporteTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApagarTransporteTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object sqlApagarTransporteKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object sqlApagarTransporteNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlApagarTransporteANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarTransporteHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlApagarTransporteDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlApagarTransporteDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlApagarTransporteNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object sqlApagarTransportePROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarTransporteRECORRENCIA: TStringField
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarTransporteDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object sqlApagarTransporteKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object sqlApagarTransporteNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object sqlApagarTransporteKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlApagarTransporteOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlApagarTransportePAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      Required = True
      OnChange = cdsAPagarPAGTO_AVISTAChange
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
      'SELECT'
      '   P.KFIN_APAGAR_PARCELA'
      ',  P.KFIN_APAGAR '
      ',  P.DOCUMENTO '
      ',  P.VENCTO '
      ',  P.VALOR '
      ',  P.PAGTO'
      ',  P.PAGO'
      ',  P.KFIN_CONTA'
      ',  C.NOME NOMECONTA'
      ',  P.PREVISAO '
      ',  P.DUVIDOSO'
      ',  P.CHEQUE'
      ',  P.NUM_CHEQUE'
      ',  P.DT_COMPENSACAO'
      ',  P.OBS'
      'from FIN_APAGAR_PARCELAS P'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      'WHERE   P.KFIN_APAGAR = :KFIN_APAGAR')
    Left = 1160
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
    object sqlParcelasTransporteCHEQUE: TStringField
      DisplayLabel = 'Pagamento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      OnChange = cdsParcelasCHEQUEChange
      FixedChar = True
      Size = 1
    end
    object sqlParcelasTransporteNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      OnSetText = cdsParcelasNUM_CHEQUESetText
      Size = 32
    end
    object sqlParcelasTransporteDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object sqlParcelasTransporteOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsSQLAPagarTransporte: TDataSource
    DataSet = sqlApagarTransporte
    Left = 1081
    Top = 195
  end
  object cdsTipoItem: TClientDataSet
    PersistDataPacket.Data = {
      510000009619E0BD010000001800000002000000000003000000510004544950
      4F01004900000001000557494454480200020001000944455343524943414F01
      004900000001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1329
    Top = 32
    object cdsTipoItemTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsTipoItemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
  end
  object cdsUnidadesCompra: TClientDataSet
    PersistDataPacket.Data = {
      570000009619E0BD01000000180000000200000000000300000057000A4B4341
      445F5449504F5301004900000001000557494454480200020020000944455343
      524943414F01004900000001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1329
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
    Left = 1329
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
    Left = 1099
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
    Left = 1043
    Top = 328
  end
  object cdsProdutosFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosFornecedor'
    Left = 1107
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
  object cdsPatrimoniosPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsPedidosqlPatrimoniosPedido
    Params = <>
    BeforeInsert = cdsPatrimoniosPedidoBeforeInsert
    BeforeEdit = cdsPatrimoniosPedidoBeforeEdit
    BeforePost = cdsPatrimoniosPedidoBeforePost
    AfterCancel = cdsPatrimoniosPedidoAfterCancel
    AfterDelete = cdsPatrimoniosPedidoAfterDelete
    OnCalcFields = cdsPatrimoniosPedidoCalcFields
    OnNewRecord = cdsPatrimoniosPedidoNewRecord
    Left = 481
    Top = 57
    object cdsPatrimoniosPedidoKCMP_PEDIDO_ITEM: TStringField
      FieldName = 'KCMP_PEDIDO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPatrimoniosPedidoKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPatrimoniosPedidoKEST_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'KEST_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object cdsPatrimoniosPedidoKCAD_PATRIMONIO: TStringField
      DisplayLabel = 'Patrimonio'
      FieldName = 'KCAD_PATRIMONIO'
      FixedChar = True
    end
    object cdsPatrimoniosPedidoIS_PATRIMONIO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'IS_PATRIMONIO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPatrimoniosPedidoCODIGO_NOME: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CODIGO_NOME'
      Size = 128
    end
    object cdsPatrimoniosPedidoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsPatrimoniosPedidoNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsPatrimoniosPedidoCST_CSOSN: TStringField
      FieldName = 'CST_CSOSN'
      Size = 4
    end
    object cdsPatrimoniosPedidoCFOP: TStringField
      FieldName = 'CFOP'
      FixedChar = True
      Size = 4
    end
    object cdsPatrimoniosPedidoCFOP_ESTOQUE: TStringField
      FieldName = 'CFOP_ESTOQUE'
      FixedChar = True
      Size = 4
    end
    object cdsPatrimoniosPedidoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsPatrimoniosPedidoQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      DisplayFormat = '#,0.####'
    end
    object cdsPatrimoniosPedidoVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object cdsPatrimoniosPedidoVALOR_PARCIAL: TFloatField
      DisplayLabel = 'Valor parcial'
      FieldName = 'VALOR_PARCIAL'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.00'
    end
    object cdsPatrimoniosPedidoDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object cdsPatrimoniosPedidoFRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'FRETE'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object cdsPatrimoniosPedidoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00'
    end
    object cdsPatrimoniosPedidoCUSTO: TFloatField
      DisplayLabel = 'Custo unit'#225'rio'
      FieldName = 'CUSTO'
      DisplayFormat = '#,0.00'
    end
    object cdsPatrimoniosPedidoDETALHES: TMemoField
      DisplayLabel = 'Detalhes'
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPatrimoniosPedidoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPatrimoniosPedidoKFIN_PLANOCONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'KFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object cdsPatrimoniosPedidoDESCR_PC_NOME: TStringField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      OnSetText = cdsPatrimoniosPedidoDESCR_PC_NOMESetText
      Size = 64
    end
    object cdsPatrimoniosPedidoDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      OnGetText = cdsPatrimoniosPedidoDESCR_PC_CLASSIFICACAOGetText
      Size = 32
    end
    object cdsPatrimoniosPedidoDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object cdsPatrimoniosPedidoDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsPatrimoniosPedidosqlApropriacaoPatrimonio: TDataSetField
      FieldName = 'sqlApropriacaoPatrimonio'
    end
    object cdsPatrimoniosPedidoTmpCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'TmpCalc'
      Calculated = True
    end
    object cdsPatrimoniosPedidoTIPOITEM: TStringField
      FieldKind = fkLookup
      FieldName = 'TIPOITEM'
      LookupDataSet = cdsTipoItem
      LookupKeyFields = 'TIPO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'IS_PATRIMONIO'
      Size = 10
      Lookup = True
    end
    object cdsPatrimoniosPedidoDESCR_UNIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_UNIDADE'
      LookupDataSet = cdsUnidades
      LookupKeyFields = 'DESCRICAO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'UNIDADE'
      Size = 3
      Lookup = True
    end
    object cdsPatrimoniosPedidoDESCR_UNIDADE_COMPRA: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_UNIDADE_COMPRA'
      LookupDataSet = cdsUnidadesCompra
      LookupKeyFields = 'DESCRICAO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'UNIDADE_COMPRA'
      Size = 3
      Lookup = True
    end
    object cdsPatrimoniosPedidoQTDE_COMPRA: TFloatField
      FieldName = 'QTDE_COMPRA'
    end
    object cdsPatrimoniosPedidoUNIDADE_COMPRA: TStringField
      FieldName = 'UNIDADE_COMPRA'
      FixedChar = True
      Size = 3
    end
    object cdsPatrimoniosPedidoUNITARIO_COMPRA: TFloatField
      FieldName = 'UNITARIO_COMPRA'
    end
    object cdsPatrimoniosPedidoATUALIZAR_CUSTO: TStringField
      FieldName = 'ATUALIZAR_CUSTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPatrimoniosPedidoVALOR_IPI: TFloatField
      FieldName = 'VALOR_IPI'
      DisplayFormat = '#,0.00'
    end
    object cdsPatrimoniosPedidoSomaTotal: TAggregateField
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM( TOTAL )'
    end
    object cdsPatrimoniosPedidoSomaParcial: TAggregateField
      FieldName = 'SomaParcial'
      Active = True
      DisplayName = ''
      Expression = 'SUM( VALOR_PARCIAL )'
    end
    object cdsPatrimoniosPedidoSomaDesconto: TAggregateField
      FieldName = 'SomaDesconto'
      Active = True
      DisplayName = ''
      Expression = 'SUM( DESCONTO )'
    end
    object cdsPatrimoniosPedidoSomaFrete: TAggregateField
      FieldName = 'SomaFrete'
      Active = True
      DisplayName = ''
      Expression = 'SUM( FRETE )'
    end
    object cdsPatrimoniosPedidoSomaValorIPI: TAggregateField
      FieldName = 'SomaValorIPI'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VALOR_IPI)'
    end
  end
  object sqlPatrimoniosPedido: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  I.KCMP_PEDIDO_ITEM,'
      '  I.KCMP_PEDIDO,'
      '  I.KEST_PRODUTO,'
      '  I.KCAD_PATRIMONIO,'
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
      '  I.IS_PATRIMONIO,'
      '  I.KFIN_PLANOCONTA,'
      '  P.NOME DESCR_PC_NOME,'
      '  P.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  P.CODIGO DESCR_PC_CODIGO,'
      '  P.TIPO_APRD DESCR_PC_TIPO_APRD'
      'FROM CMP_PEDIDO_ITENS I'
      
        'LEFT JOIN FIN_PLANOCONTAS P ON P.KFIN_PLANOCONTA = I.KFIN_PLANOC' +
        'ONTA'
      'WHERE I.KCMP_PEDIDO = :KCMP_PEDIDO'
      '   AND I.IS_PATRIMONIO = '#39'T'#39)
    Left = 481
    Top = 148
    object sqlPatrimoniosPedidoKCMP_PEDIDO_ITEM: TStringField
      FieldName = 'KCMP_PEDIDO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPatrimoniosPedidoKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPatrimoniosPedidoKEST_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'KEST_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object sqlPatrimoniosPedidoKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      FixedChar = True
    end
    object sqlPatrimoniosPedidoIS_PATRIMONIO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'IS_PATRIMONIO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPatrimoniosPedidoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlPatrimoniosPedidoNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlPatrimoniosPedidoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object sqlPatrimoniosPedidoCST_CSOSN: TStringField
      FieldName = 'CST_CSOSN'
      Size = 4
    end
    object sqlPatrimoniosPedidoCFOP: TStringField
      FieldName = 'CFOP'
      FixedChar = True
      Size = 4
    end
    object sqlPatrimoniosPedidoCFOP_ESTOQUE: TStringField
      FieldName = 'CFOP_ESTOQUE'
      FixedChar = True
      Size = 4
    end
    object sqlPatrimoniosPedidoQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object sqlPatrimoniosPedidoVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object sqlPatrimoniosPedidoVALOR_PARCIAL: TFloatField
      FieldName = 'VALOR_PARCIAL'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.00'
    end
    object sqlPatrimoniosPedidoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object sqlPatrimoniosPedidoFRETE: TFloatField
      FieldName = 'FRETE'
      Required = True
      DisplayFormat = '#,0.00#####'
    end
    object sqlPatrimoniosPedidoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object sqlPatrimoniosPedidoCUSTO: TFloatField
      DisplayLabel = 'Custo unit'#225'rio'
      FieldName = 'CUSTO'
      DisplayFormat = '#,0.00'
    end
    object sqlPatrimoniosPedidoQTDE_COMPRA: TFloatField
      FieldName = 'QTDE_COMPRA'
    end
    object sqlPatrimoniosPedidoUNIDADE_COMPRA: TStringField
      FieldName = 'UNIDADE_COMPRA'
      FixedChar = True
      Size = 3
    end
    object sqlPatrimoniosPedidoUNITARIO_COMPRA: TFloatField
      FieldName = 'UNITARIO_COMPRA'
    end
    object sqlPatrimoniosPedidoATUALIZAR_CUSTO: TStringField
      FieldName = 'ATUALIZAR_CUSTO'
      FixedChar = True
      Size = 1
    end
    object sqlPatrimoniosPedidoDETALHES: TMemoField
      DisplayLabel = 'Detalhes'
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object sqlPatrimoniosPedidoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlPatrimoniosPedidoKFIN_PLANOCONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'KFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object sqlPatrimoniosPedidoDESCR_PC_NOME: TStringField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlPatrimoniosPedidoDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlPatrimoniosPedidoDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object sqlPatrimoniosPedidoDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object sqlPatrimoniosPedidoVALOR_IPI: TFloatField
      FieldName = 'VALOR_IPI'
      DisplayFormat = '#,0.00'
    end
  end
  object cdsApropriacaoPatrimonio: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsPatrimoniosPedidosqlApropriacaoPatrimonio
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    OnNewRecord = cdsApropriacaoPatrimonioNewRecord
    Left = 571
    Top = 57
    object cdsApropriacaoPatrimonioKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsApropriacaoPatrimonioKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object cdsApropriacaoPatrimonioCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cdsApropriacaoPatrimonioCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object cdsApropriacaoPatrimonioNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsApropriacaoPatrimonioPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object cdsApropriacaoPatrimonioTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsApropriacaoPatrimonioTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsApropriacaoPatrimonioTOTAL_PORCENTAGEM: TAggregateField
      DisplayLabel = 'Total porcentagem'
      FieldName = 'TOTAL_PORCENTAGEM'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PORCENTAGEM)'
    end
  end
  object sqlApropriacaoPatrimonio: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLPatrimonioPedido
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'KCMP_PEDIDO_ITEM'
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
      'WHERE A.TABLENAME = '#39'CMP_PEDIDO_ITENS'#39' '
      '  AND A.TABLEKEY = :KCMP_PEDIDO_ITEM')
    Left = 570
    Top = 148
    object sqlApropriacaoPatrimonioKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApropriacaoPatrimonioKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object sqlApropriacaoPatrimonioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object sqlApropriacaoPatrimonioCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlApropriacaoPatrimonioNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlApropriacaoPatrimonioPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoPatrimonioTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApropriacaoPatrimonioTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
  end
  object dtsSQLPatrimonioPedido: TDataSource
    DataSet = sqlPatrimoniosPedido
    Left = 501
    Top = 212
  end
  object cdsUnidadesControlaEstoque: TClientDataSet
    PersistDataPacket.Data = {
      570000009619E0BD01000000180000000200000000000300000057000A4B4341
      445F5449504F5301004900000001000557494454480200020020000944455343
      524943414F01004900000001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1328
    Top = 224
    object cdsUnidadesControlaEstoqueKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      Size = 32
    end
    object cdsUnidadesControlaEstoqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
  end
end
