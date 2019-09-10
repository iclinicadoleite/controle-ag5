object dtmVENDAS_Pedido: TdtmVENDAS_Pedido
  OldCreateOrder = True
  Height = 442
  Width = 1002
  object cdsLstPedidos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KVND_PEDIDO'
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
        Name = 'DATA_EMISSAO'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'NOMEENTIDADE'
        DataType = ftString
        Size = 128
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
        Name = 'KVND_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstPedidos'
    StoreDefs = True
    OnNewRecord = cdsLstPedidosNewRecord
    Left = 53
    Top = 56
    object cdsLstPedidosKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object cdsLstPedidosKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object cdsLstPedidosNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota fiscal'
      DisplayWidth = 21
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
      DisplayWidth = 21
      FieldName = 'SERIE'
      Size = 32
    end
    object cdsLstPedidosDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      DisplayWidth = 22
      FieldName = 'DATA_EMISSAO'
    end
    object cdsLstPedidosNOMEENTIDADE: TStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 81
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsLstPedidosIMPOSTOS: TFloatField
      DisplayLabel = 'Impostos'
      DisplayWidth = 6
      FieldName = 'IMPOSTOS'
      Visible = False
      DisplayFormat = '#,0.00'
    end
    object cdsLstPedidosDESCONTOS: TFloatField
      DisplayLabel = 'Descontos'
      DisplayWidth = 7
      FieldName = 'DESCONTOS'
      Visible = False
      DisplayFormat = '#,0.00'
    end
    object cdsLstPedidosFRETE: TFloatField
      DisplayLabel = 'Frete'
      DisplayWidth = 6
      FieldName = 'FRETE'
      Visible = False
      DisplayFormat = '#,0.00'
    end
    object cdsLstPedidosTOTAL_NOTA: TFloatField
      DisplayLabel = 'Total'
      DisplayWidth = 6
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
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KVND_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPedido'
    BeforeOpen = cdsPedidoBeforeOpen
    BeforeInsert = cdsPedidoBeforeInsert
    AfterInsert = cdsPedidoAfterInsert
    BeforeEdit = cdsPedidoBeforeEdit
    BeforePost = cdsPedidoBeforePost
    BeforeDelete = cdsPedidoBeforeDelete
    OnCalcFields = cdsPedidoCalcFields
    OnNewRecord = cdsPedidoNewRecord
    BeforeApplyUpdates = cdsPedidoBeforeApplyUpdates
    Left = 171
    Top = 60
    object cdsPedidoKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
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
      DisplayLabel = 'Cliente'
      FieldName = 'KCAD_ENTIDADE'
      Required = True
      Visible = False
      OnValidate = cdsPedidoKCAD_ENTIDADEValidate
      FixedChar = True
    end
    object cdsPedidoNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota fiscal'
      FieldName = 'NOTA_FISCAL'
      OnValidate = cdsPedidoNOTA_FISCALValidate
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
    object cdsPedidoXML_NFE: TMemoField
      FieldName = 'XML_NFE'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPedidoMODELO_NFE: TIntegerField
      FieldName = 'MODELO_NFE'
    end
    object cdsPedidoSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      OnValidate = cdsPedidoSERIEValidate
      Size = 32
    end
    object cdsPedidoDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
      Required = True
      OnValidate = cdsPedidoDATA_EMISSAOValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPedidoDATA_VENDA: TSQLTimeStampField
      DisplayLabel = 'Data de venda'
      FieldName = 'DATA_VENDA'
      Required = True
      OnChange = cdsPedidoDATA_VENDAChange
      OnValidate = cdsPedidoDATA_VENDAValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPedidoNOMEENTIDADE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMEENTIDADE'
      OnSetText = cdsPedidoNOMEENTIDADESetText
      Size = 128
    end
    object cdsPedidoIMPOSTOS: TFloatField
      DisplayLabel = 'Impostos'
      FieldName = 'IMPOSTOS'
      DisplayFormat = '#,0.00'
    end
    object cdsPedidoDESCONTOS: TFloatField
      DisplayLabel = 'Descontos'
      FieldName = 'DESCONTOS'
      DisplayFormat = '#,0.00'
    end
    object cdsPedidoFRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'FRETE'
      DisplayFormat = '#,0.00'
    end
    object cdsPedidoVALOR_DEDUCOES: TFloatField
      DisplayLabel = 'Dedu'#231#245'es'
      FieldName = 'VALOR_DEDUCOES'
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
    object cdsPedidoKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Visible = False
      FixedChar = True
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
    object cdsPedidosqlServicosPedido: TDataSetField
      DisplayLabel = 'Servi'#231'os'
      FieldName = 'sqlServicosPedido'
    end
    object cdsPedidosqlAreceber: TDataSetField
      DisplayLabel = 'Dados a receber'
      FieldName = 'sqlAreceber'
    end
    object cdsPedidosqlItensPedido: TDataSetField
      DisplayLabel = 'Itens'
      FieldName = 'sqlItensPedido'
    end
    object cdsPedidoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
    object cdsPedidoKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      FixedChar = True
    end
    object cdsPedidosqlApagar: TDataSetField
      FieldName = 'sqlApagar'
    end
    object cdsPedidosqlPatrimoniosPedido: TDataSetField
      FieldName = 'sqlPatrimoniosPedido'
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
    Left = 264
    Top = 61
    object cdsItensPedidoKVND_PEDIDO_ITEM: TStringField
      FieldName = 'KVND_PEDIDO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsItensPedidoKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsItensPedidoKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object cdsItensPedidoKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      Visible = False
      FixedChar = True
    end
    object cdsItensPedidoIS_PATRIMONIO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'IS_PATRIMONIO'
      Required = True
      OnGetText = cdsItensPedidoIS_PATRIMONIOGetText
      FixedChar = True
      Size = 1
    end
    object cdsItensPedidoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      OnSetText = cdsItensPedidoCODIGOSetText
      Size = 32
    end
    object cdsItensPedidoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      OnSetText = cdsItensPedidoNOMESetText
      Size = 128
    end
    object cdsItensPedidoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsItensPedidoCUSTO: TFloatField
      DisplayLabel = 'Pre'#231'o Un.'
      FieldName = 'CUSTO'
      DisplayFormat = '#,0.00#####'
    end
    object cdsItensPedidoDETALHES: TMemoField
      DisplayLabel = 'Detalhes'
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsItensPedidoQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      DisplayFormat = '#,0.####'
    end
    object cdsItensPedidoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00##'
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
    object cdsItensPedidotmpCalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'tmpCalc'
      Calculated = True
    end
    object cdsItensPedidoSomaTotal: TAggregateField
      FieldName = 'SomaTotal'
      OnGetText = cdsItensPedidoSomaTotalGetText
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM( TOTAL )'
    end
  end
  object cdsStatusPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 779
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
    Left = 96
    Top = 288
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
    Left = 200
    Top = 8
  end
  object cdsDadosProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KEST_PRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDadosProduto'
    Left = 251
    Top = 288
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
  end
  object cdsAReceber: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsPedidosqlAreceber
    Params = <
      item
        DataType = ftString
        Name = 'KFIN_ARECEBER'
        ParamType = ptInput
      end>
    OnNewRecord = cdsAReceberNewRecord
    Left = 693
    Top = 57
    object cdsAReceberANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAReceberKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAReceberATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsAReceberTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsAReceberKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object cdsAReceberNOMEENTIDADE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMEENTIDADE'
      Required = True
      Size = 128
    end
    object cdsAReceberHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Required = True
      Size = 128
    end
    object cdsAReceberDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAReceberDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data lan'#231'amento'
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsAReceberNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object cdsAReceberDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
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
    object cdsAReceberKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      Visible = False
      FixedChar = True
    end
    object cdsAReceberNOMECONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      OnSetText = cdsAReceberNOMECONTASetText
      Size = 64
    end
    object cdsAReceberKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object cdsAReceberOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsARecebersqlParcelas: TDataSetField
      DisplayLabel = 'Parcelas a receber'
      FieldName = 'sqlParcelas'
    end
    object cdsAReceberStatusCadastro: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusCadastro'
      Size = 1
      Calculated = True
    end
    object cdsAReceberPAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      OnChange = cdsAReceberPAGTO_AVISTAChange
      FixedChar = True
      Size = 1
    end
    object cdsAReceberKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      ProviderFlags = []
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
    OnNewRecord = cdsParcelasNewRecord
    Left = 766
    Top = 56
    object cdsParcelasKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsParcelasKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsParcelasDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsParcelasVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
      OnChange = cdsParcelasVENCTOChange
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
      Visible = False
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
    object cdsParcelasOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsParcelasCHEQUE: TStringField
      FieldName = 'CHEQUE'
      OnChange = cdsParcelasCHEQUEChange
      FixedChar = True
      Size = 1
    end
    object cdsParcelasNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object cdsParcelasDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
    end
    object cdsParcelasSomaValor: TAggregateField
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
    Left = 26
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
        Name = 'KVND_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  KVND_PEDIDO,'
      '  KSYS$DOMAIN,'
      '  NOTA_FISCAL,'
      '  NOTA_FISCAL_,'
      '  SERIE,'
      '  DATA_EMISSAO,'
      '  NOMEENTIDADE,'
      '  IMPOSTOS,'
      '  DESCONTOS,'
      '  FRETE,'
      '  TOTAL_NOTA,'
      '  OBS'
      'FROM VND_PEDIDOS'
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND ( ( :LISTALL = '#39'T'#39' )'
      '        AND ( :DSP_INATIVO = '#39'T'#39' OR ( ATIVO = '#39'T'#39' ) )'
      '        AND DATA_EMISSAO BETWEEN :DATAINI AND :DATAFIM'
      '         )'
      '  OR ( ( :LISTALL = '#39'F'#39' )'
      '           AND KVND_PEDIDO = :KVND_PEDIDO )')
    Left = 53
    Top = 149
    object sqlLstPedidosKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object sqlLstPedidosKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object sqlLstPedidosNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota fiscal'
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
    object sqlLstPedidosDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
    end
    object sqlLstPedidosNOMEENTIDADE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMEENTIDADE'
      Size = 128
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
        Name = 'KVND_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  KVND_PEDIDO,'
      '  KSYS$DOMAIN,'
      '  KCAD_ENTIDADE,'
      '  NOTA_FISCAL,'
      '  SERIE,'
      '  DATA_EMISSAO,'
      '  DATA_VENDA,'
      '  NOMEENTIDADE,'
      '  IMPOSTOS,'
      '  DESCONTOS,'
      '  FRETE,'
      ' VALOR_DEDUCOES,'
      '  TOTAL_ITENS,'
      '  TOTAL_SERVICOS,'
      '  TOTAL_NOTA,'
      '  KFIN_ARECEBER,'
      '  KFIN_APAGAR,'
      '  ATIVO,'
      '  CHAVENFE,'
      '  IMPORTADO_NFE,'
      '  MODELO_NFE,'
      '  SYS$ORIGIN_TYPE,'
      '  cast( OBS as BLOB ) OBS,'
      '  cast( XML_NFE as BLOB ) XML_NFE'
      'FROM VND_PEDIDOS'
      'WHERE KVND_PEDIDO = :KVND_PEDIDO')
    Left = 170
    Top = 148
    object sqlPedidoKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
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
      DisplayLabel = 'Cliente'
      FieldName = 'KCAD_ENTIDADE'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPedidoNOTA_FISCAL: TStringField
      DisplayLabel = 'Nota fiscal'
      FieldName = 'NOTA_FISCAL'
      Size = 32
    end
    object sqlPedidoSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 32
    end
    object sqlPedidoDATA_EMISSAO: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
      Required = True
    end
    object sqlPedidoDATA_VENDA: TSQLTimeStampField
      DisplayLabel = 'Data de venda'
      FieldName = 'DATA_VENDA'
      Required = True
    end
    object sqlPedidoNOMEENTIDADE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMEENTIDADE'
      Size = 128
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
    object sqlPedidoVALOR_DEDUCOES: TFloatField
      DisplayLabel = 'Dedu'#231#245'es'
      FieldName = 'VALOR_DEDUCOES'
    end
    object sqlPedidoTOTAL_ITENS: TFloatField
      DisplayLabel = 'Total '#237'tens'
      FieldName = 'TOTAL_ITENS'
    end
    object sqlPedidoTOTAL_SERVICOS: TFloatField
      DisplayLabel = 'Total servi'#231'os'
      FieldName = 'TOTAL_SERVICOS'
    end
    object sqlPedidoCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      EditMask = '0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000;0; '
      Size = 44
    end
    object sqlPedidoIMPORTADO_NFE: TStringField
      FieldName = 'IMPORTADO_NFE'
      Required = True
      FixedChar = True
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
    object sqlPedidoTOTAL_NOTA: TFloatField
      DisplayLabel = 'Total nota'
      FieldName = 'TOTAL_NOTA'
      Required = True
    end
    object sqlPedidoKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Visible = False
      FixedChar = True
    end
    object sqlPedidoKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      FixedChar = True
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
    object sqlPedidoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
    object sqlPedidoKFIN_APAGAR_TRANSPORTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'KFIN_APAGAR_TRANSPORTE'
      Calculated = True
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
        Name = 'KVND_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  I.KVND_PEDIDO_ITEM,'
      '  I.KVND_PEDIDO,'
      '  I.KEST_PRODUTO,'
      '  I.KCAD_PATRIMONIO,'
      '  I.CODIGO,'
      '  I.NOME,'
      '  I.UNIDADE,'
      '  I.CUSTO,'
      '  I.DETALHES,'
      '  I.QTDE,'
      '  I.TOTAL,'
      '  I.OBS,'
      '  I.IS_PATRIMONIO,'
      '  I.KFIN_PLANOCONTA,'
      '  P.NOME DESCR_PC_NOME,'
      '  P.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  P.CODIGO DESCR_PC_CODIGO,'
      '  P.TIPO_APRD DESCR_PC_TIPO_APRD'
      'FROM VND_PEDIDO_ITENS I'
      
        'LEFT JOIN FIN_PLANOCONTAS P ON P.KFIN_PLANOCONTA = I.KFIN_PLANOC' +
        'ONTA'
      'WHERE KVND_PEDIDO = :KVND_PEDIDO'
      '  AND I.IS_PATRIMONIO = '#39'F'#39)
    Left = 264
    Top = 148
    object sqlItensPedidoKVND_PEDIDO_ITEM: TStringField
      FieldName = 'KVND_PEDIDO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlItensPedidoKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlItensPedidoKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object sqlItensPedidoKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      Visible = False
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
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlItensPedidoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object sqlItensPedidoCUSTO: TFloatField
      DisplayLabel = 'Pre'#231'o Un.'
      FieldName = 'CUSTO'
    end
    object sqlItensPedidoDETALHES: TMemoField
      DisplayLabel = 'Detalhes'
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object sqlItensPedidoQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object sqlItensPedidoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
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
    Top = 375
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
    Left = 40
    Top = 331
  end
  object sqlDadosProduto: TTcSQLDataSet
    SchemaName = 'sysdba'
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
      '  DESCRICAO,'
      '  OBS'
      'FROM EST_PRODUTOS'
      'WHERE KEST_PRODUTO = :KEST_PRODUTO')
    Left = 256
    Top = 375
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
  end
  object dspDadosProduto: TDataSetProvider
    DataSet = sqlDadosProduto
    Left = 216
    Top = 331
  end
  object sqlAreceber: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KVND_PEDIDO'
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
      '  CAST( :KVND_PEDIDO AS SYS$FKGUID20) KVND_PEDIDO,'
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
    Left = 691
    Top = 148
    object sqlAreceberANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAreceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAreceberKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAreceberKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      ProviderFlags = []
      Required = True
      FixedChar = True
    end
    object sqlAreceberATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAreceberTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlAreceberTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object sqlAreceberKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object sqlAreceberNOMEENTIDADE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlAreceberHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlAreceberDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlAreceberDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data lan'#231'amento'
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlAreceberNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
    end
    object sqlAreceberDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object sqlAreceberPROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAreceberRECORRENCIA: TStringField
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAreceberKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      Visible = False
      FixedChar = True
    end
    object sqlAreceberNOMECONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object sqlAreceberKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object sqlAreceberOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlAreceberPAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      FixedChar = True
      Size = 1
    end
  end
  object sqlParcelas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtssqlAreceber
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_ARECEBER'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KVND_PEDIDO'
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
      '        A.TABLENAME  = '#39'VND_PEDIDOS'#39' '
      'AND A.TABLEKEY = :KVND_PEDIDO'
      'AND P.KFIN_ARECEBER_PARCELA IS NOT NULL')
    Left = 769
    Top = 148
    object sqlParcelasKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlParcelasKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      Visible = False
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
      Visible = False
      FixedChar = True
    end
    object sqlParcelasNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object sqlParcelasPREVISAO: TStringField
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
    object sqlParcelasOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlParcelasCHEQUE: TStringField
      FieldName = 'CHEQUE'
      FixedChar = True
      Size = 1
    end
    object sqlParcelasNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object sqlParcelasDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
    end
  end
  object dtssqlAreceber: TDataSource
    DataSet = sqlAreceber
    Left = 716
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
    Left = 355
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
    object cdsApropriacaoItemNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
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
      OnGetText = cdsApropriacaoItemCLASSIFICACAOGetText
      Size = 32
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
        Name = 'KVND_PEDIDO_ITEM'
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
      'WHERE A.TABLENAME = '#39'VND_PEDIDO_ITENS'#39' '
      '  AND A.TABLEKEY = :KVND_PEDIDO_ITEM')
    Left = 354
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
    object sqlApropriacaoItemPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoItemNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
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
    Left = 308
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
    Left = 594
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
      OnGetText = cdsApropriacaoServicoCLASSIFICACAOGetText
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
        Name = 'KVND_PEDIDO_SERVICO'
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
      'WHERE A.TABLENAME = '#39'VND_PEDIDO_SERVICOS'#39' '
      '  AND A.TABLEKEY = :KVND_PEDIDO_SERVICO')
    Left = 593
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
    Left = 535
    Top = 196
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
    Left = 488
    Top = 57
    object cdsServicosPedidoKVND_PEDIDO_SERVICO: TStringField
      FieldName = 'KVND_PEDIDO_SERVICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsServicosPedidoKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsServicosPedidoKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object cdsServicosPedidoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      OnSetText = cdsServicosPedidoCODIGOSetText
      Size = 32
    end
    object cdsServicosPedidoNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
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
      OnGetText = cdsServicosPedidoKFIN_PLANOCONTAGetText
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
    object cdsServicosPedidosqlApropriacaoServico: TDataSetField
      FieldName = 'sqlApropriacaoServico'
    end
    object cdsServicosPedidoTmpCalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TmpCalc'
      Calculated = True
    end
    object cdsServicosPedidoSomaTotal: TAggregateField
      FieldName = 'SomaTotal'
      OnGetText = cdsServicosPedidoSomaTotalGetText
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM( TOTAL )'
    end
  end
  object sqlServicosPedido: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KVND_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  S.KVND_PEDIDO_SERVICO,'
      '  S.KVND_PEDIDO,'
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
      'FROM VND_PEDIDO_SERVICOS S'
      
        'LEFT JOIN FIN_PLANOCONTAS P ON P.KFIN_PLANOCONTA = S.KFIN_PLANOC' +
        'ONTA'
      'WHERE S.KVND_PEDIDO = :KVND_PEDIDO')
    Left = 488
    Top = 148
    object sqlServicosPedidoKVND_PEDIDO_SERVICO: TStringField
      FieldName = 'KVND_PEDIDO_SERVICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlServicosPedidoKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlServicosPedidoKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object sqlServicosPedidoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlServicosPedidoNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
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
  object cdsDadosPatrimonio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_PATRIMONIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDadosPatrimonio'
    Left = 411
    Top = 288
    object cdsDadosPatrimonioKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsDadosPatrimonioCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsDadosPatrimonioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object cdsDadosPatrimonioUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsDadosPatrimonioVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Required = True
    end
    object cdsDadosPatrimonioQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object cdsDadosPatrimonioOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlDadosPatrimonio: TTcSQLDataSet
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
      '    P.OBS'
      'FROM CAD_PATRIMONIOS P'
      'WHERE P.KCAD_PATRIMONIO = :KCAD_PATRIMONIO')
    Left = 416
    Top = 375
    object sqlDadosPatrimonioKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDadosPatrimonioCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlDadosPatrimonioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object sqlDadosPatrimonioUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlDadosPatrimonioVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Required = True
    end
    object sqlDadosPatrimonioQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object sqlDadosPatrimonioOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspDadosPatrimonio: TDataSetProvider
    DataSet = sqlDadosPatrimonio
    Left = 376
    Top = 331
  end
  object cdsPatrimoniosPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 384
    Top = 109
    object cdsPatrimoniosPedidoKVND_PEDIDO_ITEM: TStringField
      FieldName = 'KVND_PEDIDO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPatrimoniosPedidoKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPatrimoniosPedidoKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object cdsPatrimoniosPedidoKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      Visible = False
      FixedChar = True
    end
    object cdsPatrimoniosPedidoIS_PATRIMONIO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'IS_PATRIMONIO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPatrimoniosPedidoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsPatrimoniosPedidoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsPatrimoniosPedidoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsPatrimoniosPedidoCUSTO: TFloatField
      DisplayLabel = 'Pre'#231'o Un.'
      FieldName = 'CUSTO'
      DisplayFormat = '#,0.00#####'
    end
    object cdsPatrimoniosPedidoDETALHES: TMemoField
      DisplayLabel = 'Detalhes'
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPatrimoniosPedidoQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      DisplayFormat = '#,0.####'
    end
    object cdsPatrimoniosPedidoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00##'
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
    object cdsPatrimoniosPedidotmpCalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'tmpCalc'
      Calculated = True
    end
    object cdsPatrimoniosPedidoSomaTotal: TAggregateField
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM( TOTAL )'
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
        Name = 'KVND_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  I.KVND_PEDIDO_ITEM,'
      '  I.KVND_PEDIDO,'
      '  I.KEST_PRODUTO,'
      '  I.KCAD_PATRIMONIO,'
      '  I.CODIGO,'
      '  I.NOME,'
      '  I.UNIDADE,'
      '  I.CUSTO,'
      '  I.DETALHES,'
      '  I.QTDE,'
      '  I.TOTAL,'
      '  I.OBS,'
      '  I.IS_PATRIMONIO,'
      '  I.KFIN_PLANOCONTA,'
      '  P.NOME DESCR_PC_NOME,'
      '  P.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  P.CODIGO DESCR_PC_CODIGO,'
      '  P.TIPO_APRD DESCR_PC_TIPO_APRD'
      'FROM VND_PEDIDO_ITENS I'
      
        'LEFT JOIN FIN_PLANOCONTAS P ON P.KFIN_PLANOCONTA = I.KFIN_PLANOC' +
        'ONTA'
      'WHERE KVND_PEDIDO = :KVND_PEDIDO'
      '  AND I.IS_PATRIMONIO = '#39'T'#39)
    Left = 384
    Top = 196
    object sqlPatrimoniosPedidoKVND_PEDIDO_ITEM: TStringField
      FieldName = 'KVND_PEDIDO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPatrimoniosPedidoKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPatrimoniosPedidoKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object sqlPatrimoniosPedidoKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      Visible = False
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
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlPatrimoniosPedidoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object sqlPatrimoniosPedidoCUSTO: TFloatField
      DisplayLabel = 'Pre'#231'o Un.'
      FieldName = 'CUSTO'
    end
    object sqlPatrimoniosPedidoDETALHES: TMemoField
      DisplayLabel = 'Detalhes'
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object sqlPatrimoniosPedidoQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object sqlPatrimoniosPedidoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
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
    Left = 475
    Top = 105
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
    object cdsApropriacaoPatrimonioNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
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
        Name = 'KVND_PEDIDO_ITEM'
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
      'WHERE A.TABLENAME = '#39'VND_PEDIDO_ITENS'#39' '
      '  AND A.TABLEKEY = :KVND_PEDIDO_ITEM')
    Left = 474
    Top = 196
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
    object sqlApropriacaoPatrimonioPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoPatrimonioNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
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
    Left = 428
    Top = 243
  end
  object cdsAPagar: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPedidosqlApagar
    Params = <>
    OnNewRecord = cdsAPagarNewRecord
    Left = 835
    Top = 57
    object cdsAPagarANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
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
      FixedChar = True
      Size = 1
    end
    object cdsAPagarsqlParcelasApagar: TDataSetField
      DisplayLabel = 'Parcelas a pagar'
      FieldName = 'sqlParcelasApagar'
    end
    object cdsAPagarStatusCadastro: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusCadastro'
      Size = 1
      Calculated = True
    end
    object cdsAPagarKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
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
  object cdsParcelasApagar: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsAPagarsqlParcelasApagar
    IndexFieldNames = 'KFIN_APAGAR;VENCTO'
    FetchOnDemand = False
    Params = <>
    BeforeInsert = cdsParcelasApagarBeforeInsert
    BeforeEdit = cdsParcelasApagarBeforeEdit
    BeforePost = cdsParcelasApagarBeforePost
    BeforeDelete = cdsParcelasApagarBeforeDelete
    OnCalcFields = cdsParcelasApagarCalcFields
    OnNewRecord = cdsParcelasApagarNewRecord
    Left = 908
    Top = 57
    object cdsParcelasApagarKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsParcelasApagarKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object cdsParcelasApagarDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsParcelasApagarVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsParcelasApagarPRORROGACAO: TSQLTimeStampField
      DisplayLabel = 'Prorroga'#231#227'o'
      FieldName = 'PRORROGACAO'
    end
    object cdsParcelasApagarVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasApagarPAGTO: TSQLTimeStampField
      DisplayLabel = 'Pagamento'
      FieldName = 'PAGTO'
    end
    object cdsParcelasApagarPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasApagarKFIN_CONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object cdsParcelasApagarNOMECONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object cdsParcelasApagarPREVISAO: TStringField
      DisplayLabel = 'Previs'#227'o'
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParcelasApagarDUVIDOSO: TStringField
      DisplayLabel = 'Duvidoso'
      FieldName = 'DUVIDOSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParcelasApagarCHEQUE: TStringField
      DisplayLabel = 'Pagamento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParcelasApagarNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object cdsParcelasApagarDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object cdsParcelasApagarOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsParcelasApagartmpCalc: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'tmpCalc'
    end
    object cdsParcelasApagarSomaValor: TAggregateField
      DisplayLabel = 'Total'
      FieldName = 'SomaValor'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VALOR)'
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
        Name = 'KVND_PEDIDO'
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
      '  CAST( :KVND_PEDIDO AS SYS$FKGUID20) KVND_PEDIDO,'
      
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
      '  A.PROXIMO_MES,'
      '  A.ANUAL,'
      '  A.RECORRENCIA, '
      '  A.DIA_VENCTO,'
      '  A.KFIN_CONTA_PREF,'
      '  C.NOME NOMECONTA,'
      '  A.KFIN_PLANOCONTA,'
      '  A.OBS'
      'FROM FIN_APAGAR A'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = A.KFIN_CONTA_PREF'
      'WHERE A.KFIN_APAGAR = :KFIN_APAGAR')
    Left = 835
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
    object sqlApagarKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
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
  object sqlParcelasApagar: TTcSQLDataSet
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
        Name = 'KVND_PEDIDO'
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
      '        A.TABLENAME  = '#39'VND_PEDIDOS'#39' '
      'AND A.KFIN_APAGAR IS DISTINCT FROM :KFIN_APAGAR_TRANSPORTE'
      'AND A.TABLEKEY = :KVND_PEDIDO'
      'AND P.KFIN_APAGAR_PARCELA IS NOT NULL')
    Left = 908
    Top = 148
    object sqlParcelasApagarKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlParcelasApagarKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object sqlParcelasApagarDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlParcelasApagarVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlParcelasApagarPRORROGACAO: TSQLTimeStampField
      DisplayLabel = 'Prorroga'#231#227'o'
      FieldName = 'PRORROGACAO'
    end
    object sqlParcelasApagarVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
    end
    object sqlParcelasApagarPAGTO: TSQLTimeStampField
      DisplayLabel = 'Pagamento'
      FieldName = 'PAGTO'
    end
    object sqlParcelasApagarPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
    end
    object sqlParcelasApagarKFIN_CONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object sqlParcelasApagarNOMECONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object sqlParcelasApagarPREVISAO: TStringField
      DisplayLabel = 'Previs'#227'o'
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasApagarDUVIDOSO: TStringField
      DisplayLabel = 'Duvidoso'
      FieldName = 'DUVIDOSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasApagarCHEQUE: TStringField
      DisplayLabel = 'Pagamento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasApagarNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object sqlParcelasApagarDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object sqlParcelasApagarOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsSQLAPagar: TDataSource
    DataSet = sqlApagar
    Left = 865
    Top = 195
  end
end
