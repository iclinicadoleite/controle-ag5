object dtmCDSToXMLNFe: TdtmCDSToXMLNFe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 668
  Width = 1310
  object infNFe: TClientDataSet
    Aggregates = <>
    Params = <>
    OnPostError = PostError
    Left = 14
    Top = 5
    object infNFeide: TDataSetField
      FieldName = 'ide'
    end
    object infNFeemit: TDataSetField
      FieldName = 'emit'
    end
    object infNFeavulsa: TDataSetField
      FieldName = 'avulsa'
    end
    object infNFedest: TDataSetField
      FieldName = 'dest'
    end
    object infNFeretirada: TDataSetField
      FieldName = 'retirada'
    end
    object infNFeentrega: TDataSetField
      FieldName = 'entrega'
    end
    object infNFeautXML: TDataSetField
      FieldName = 'autXML'
    end
    object infNFedet: TDataSetField
      FieldName = 'det'
    end
    object infNFetotal: TDataSetField
      FieldName = 'total'
    end
    object infNFetransp: TDataSetField
      FieldName = 'transp'
    end
    object infNFecobr: TDataSetField
      FieldName = 'cobr'
    end
    object infNFepag: TDataSetField
      FieldName = 'pag'
    end
    object infNFeDadosAdicionais: TDataSetField
      FieldName = 'infAdic'
    end
    object infNFecompra: TDataSetField
      FieldName = 'compra'
    end
    object infNFeexporta: TDataSetField
      FieldName = 'exporta'
    end
  end
  object Identificacao: TClientDataSet
    Aggregates = <>
    DataSetField = infNFeide
    Params = <>
    OnPostError = PostError
    Left = 32
    Top = 48
    object IdentificacaoUF: TIntegerField
      FieldName = 'cUF'
    end
    object IdentificacaoCodigoNFe: TIntegerField
      FieldName = 'cNF'
      DisplayFormat = '000000000'
      MaxValue = 999999999
    end
    object IdentificacaoNatOp: TStringField
      FieldName = 'natOp'
      Required = True
      Size = 60
    end
    object IdentificacaoFormaPagto: TSmallintField
      FieldName = 'indPag'
      MaxValue = 2
    end
    object IdentificacaoModelo: TStringField
      FieldName = 'mod'
      Size = 2
    end
    object IdentificacaoSerie: TSmallintField
      FieldName = 'serie'
      MaxValue = 999
    end
    object IdentificacaoDocumento: TIntegerField
      FieldName = 'nNF'
      MaxValue = 999999999
    end
    object IdentificacaodEmi: TDateField
      FieldName = 'dEmi'
    end
    object IdentificacaodSaiEnt: TDateField
      FieldName = 'dSaiEnt'
    end
    object IdentificacaoEmissao: TDateTimeField
      FieldName = 'dhEmi'
    end
    object IdentificacaoDataSaidaEntrada: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'dhSaiEnt'
    end
    object IdentificacaohSaiEnt: TTimeField
      FieldName = 'hSaiEnt'
    end
    object IdentificacaoTipoNF: TSmallintField
      FieldName = 'tpNF'
      Required = True
      MaxValue = 1
    end
    object IdentificacaoDestino: TIntegerField
      FieldName = 'idDest'
    end
    object IdentificacaoCodigoMuncipioGerador: TIntegerField
      FieldName = 'cMunFG'
      DisplayFormat = '0000000'
      MaxValue = 9999999
    end
    object IdentificacaoFormatoImpressao: TSmallintField
      FieldName = 'tpImp'
    end
    object IdentificacaoFormaEmissao: TSmallintField
      FieldName = 'tpEmis'
    end
    object IdentificacaoDV: TSmallintField
      FieldName = 'cDV'
      MaxValue = 9
    end
    object IdentificacaoAmbiente: TSmallintField
      FieldName = 'tpAmb'
      MaxValue = 2
      MinValue = 1
    end
    object IdentificacaoFinalidade: TSmallintField
      FieldName = 'finNFe'
      MaxValue = 4
      MinValue = 1
    end
    object IdentificacaoConsumidorFinal: TIntegerField
      FieldName = 'indFinal'
    end
    object IdentificacaoPresenca: TIntegerField
      FieldName = 'indPres'
    end
    object IdentificacaoProcessoEmissao: TSmallintField
      FieldName = 'procEmi'
      MaxValue = 3
    end
    object IdentificacaoVersaoEmissor: TStringField
      FieldName = 'verProc'
    end
    object IdentificacaoDataHoraContingencia: TDateTimeField
      FieldName = 'dhCont'
    end
    object IdentificacaoJustificaContingencia: TStringField
      FieldName = 'xJust'
      Size = 256
    end
    object Identificacao_NFReferenciadas: TDataSetField
      FieldName = 'NFref'
    end
  end
  object Emitente: TClientDataSet
    Aggregates = <>
    DataSetField = infNFeemit
    Params = <>
    OnPostError = PostError
    Left = 184
    Top = 48
    object EmitenteCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object EmitenteCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object EmitenteRazao: TStringField
      FieldName = 'xNome'
      Size = 60
    end
    object EmitenteFantasia: TStringField
      FieldName = 'xFant'
      Size = 60
    end
    object Emitente_Endereco: TDataSetField
      FieldName = 'enderEmit'
    end
    object EmitenteIE: TStringField
      FieldName = 'IE'
      Size = 14
    end
    object EmitenteIEST: TStringField
      FieldName = 'IEST'
      Size = 14
    end
    object EmitenteIM: TStringField
      FieldName = 'IM'
      Size = 15
    end
    object EmitenteCNAE: TStringField
      FieldName = 'CNAE'
      Size = 7
    end
    object EmitenteCRT: TIntegerField
      FieldName = 'CRT'
      DisplayFormat = '0'
    end
  end
  object Avulsa: TClientDataSet
    Aggregates = <>
    DataSetField = infNFeavulsa
    Params = <>
    OnPostError = PostError
    Left = 230
    Top = 48
    object AvulsaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object AvulsaOrgao: TStringField
      FieldName = 'xOrgao'
      Size = 60
    end
    object AvulsaMatriculaAgente: TStringField
      FieldName = 'matr'
      Size = 60
    end
    object AvulsaNomeAgente: TStringField
      FieldName = 'xAgente'
      Size = 60
    end
    object AvulsaFone: TStringField
      FieldName = 'fone'
      Size = 14
    end
    object AvulsaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object AvulsaDAR: TStringField
      FieldName = 'nDAR'
      Size = 60
    end
    object AvulsaEmissao: TDateField
      FieldName = 'dEmi'
    end
    object AvulsaValorDAR: TFloatField
      FieldName = 'vDAR'
      DisplayFormat = '0.00'
    end
    object AvulsaReparticaoEmitente: TStringField
      FieldName = 'repEmi'
      Size = 60
    end
    object AvulsaDataPagamento: TDateField
      FieldName = 'dPag'
    end
  end
  object Destinatario: TClientDataSet
    Aggregates = <>
    DataSetField = infNFedest
    Params = <>
    OnPostError = PostError
    Left = 300
    Top = 48
    object DestinatarioCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '00000000000000'
      Size = 14
    end
    object DestinatarioCPF: TStringField
      FieldName = 'CPF'
      EditMask = '00000000000'
      Size = 11
    end
    object DestinatarioEstrangeiro: TStringField
      FieldName = 'idEstrangeiro'
    end
    object DestinatarioNome: TStringField
      FieldName = 'xNome'
      Size = 60
    end
    object DestinatarioEndereco: TDataSetField
      FieldName = 'enderDest'
    end
    object DestinatarioContribuinte: TIntegerField
      FieldName = 'indIEDest'
    end
    object DestinatarioIE: TStringField
      FieldName = 'IE'
      Size = 14
    end
    object DestinatarioSUFRAMA: TStringField
      FieldName = 'ISUF'
      Size = 9
    end
    object DestinatarioIM: TStringField
      FieldName = 'IM'
      Size = 15
    end
    object DestinatarioEmail: TStringField
      FieldName = 'email'
      Size = 60
    end
  end
  object Retirada: TClientDataSet
    Aggregates = <>
    DataSetField = infNFeretirada
    Params = <>
    OnPostError = PostError
    Left = 355
    Top = 23
    object RetiradaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object RetiradaCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object RetiradaLogradouro: TStringField
      FieldName = 'xLgr'
      Size = 60
    end
    object RetiradaNumero: TStringField
      FieldName = 'nro'
      Size = 60
    end
    object RetiradaComplemento: TStringField
      FieldName = 'xCpl'
      Size = 60
    end
    object RetiradaBairro: TStringField
      FieldName = 'xBairro'
      Size = 60
    end
    object RetiradaCodigoMunicipio: TStringField
      FieldName = 'cMun'
      Size = 7
    end
    object RetiradaNomeMunicipio: TStringField
      FieldName = 'xMun'
      Size = 60
    end
    object RetiradaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object Identificacao_NFref: TClientDataSet
    Aggregates = <>
    DataSetField = Identificacao_NFReferenciadas
    Params = <>
    OnPostError = PostError
    Left = 42
    Top = 96
    object Identificacao_NFrefrefNFe: TStringField
      FieldName = 'refNFe'
      Size = 44
    end
    object Identificacao_NFrefrefNF: TDataSetField
      FieldName = 'refNF'
    end
    object Identificacao_NFrefrefNFP: TDataSetField
      FieldName = 'refNFP'
    end
    object Identificacao_NFrefrefCTe: TStringField
      FieldName = 'refCTe'
      Size = 44
    end
    object Identificacao_NFrefrefECF: TDataSetField
      FieldName = 'refECF'
    end
  end
  object Produto: TClientDataSet
    Aggregates = <>
    DataSetField = Detalheprod
    Params = <>
    OnPostError = PostError
    Left = 108
    Top = 257
    object ProdutoCodigo: TStringField
      FieldName = 'cProd'
      Size = 60
    end
    object ProdutocEAN: TStringField
      FieldName = 'cEAN'
      Size = 14
    end
    object ProdutoNome: TStringField
      FieldName = 'xProd'
      Size = 120
    end
    object ProdutoNCM: TStringField
      FieldName = 'NCM'
      Required = True
      Size = 8
    end
    object ProdutoCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
    object ProdutoExTIPI: TStringField
      FieldName = 'EXTIPI'
      Size = 3
    end
    object ProdutoGenero: TSmallintField
      FieldName = 'genero'
      MaxValue = 99
    end
    object ProdutoCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object ProdutoUnidComercial: TStringField
      FieldName = 'uCom'
      Size = 6
    end
    object ProdutoQtdeComercial: TFloatField
      FieldName = 'qCom'
      DisplayFormat = '0.0000'
    end
    object ProdutoValorUnitarioComercial: TFloatField
      FieldName = 'vUnCom'
      DisplayFormat = '0.0000'
    end
    object ProdutoValorBruto: TFloatField
      FieldName = 'vProd'
      DisplayFormat = '0.00'
    end
    object ProdutoEANTributavel: TStringField
      FieldName = 'cEANTrib'
      Size = 14
    end
    object ProdutoUnidTributavel: TStringField
      FieldName = 'uTrib'
      Size = 6
    end
    object ProdutoQtdeTributavel: TFloatField
      FieldName = 'qTrib'
      DisplayFormat = '0.0000'
    end
    object ProdutoValorUnitarioTributavel: TFloatField
      FieldName = 'vUnTrib'
      DisplayFormat = '0.0000'
    end
    object ProdutoValorFrete: TFloatField
      FieldName = 'vFrete'
      DisplayFormat = '0.00'
    end
    object ProdutoValorSeguro: TFloatField
      FieldName = 'vSeg'
      DisplayFormat = '0.00'
    end
    object ProdutoValorDesconto: TFloatField
      FieldName = 'vDesc'
      DisplayFormat = '0.00'
    end
    object ProdutoValorOutros: TFloatField
      FieldName = 'vOutro'
      DisplayFormat = '0.00'
    end
    object ProdutoIncideTotal: TSmallintField
      FieldName = 'indTot'
    end
    object ProdutoDI: TDataSetField
      FieldName = 'DI'
    end
    object ProdutodetExport: TDataSetField
      FieldName = 'detExport'
    end
    object ProdutoNumeroPedido: TStringField
      FieldName = 'xPed'
      Size = 15
    end
    object ProdutonItemPedidoCompra: TIntegerField
      FieldName = 'nItemPed'
    end
    object ProdutoFCI: TStringField
      FieldName = 'nFCI'
      Size = 36
    end
    object ProdutoveicProd: TDataSetField
      FieldName = 'veicProd'
    end
    object Produtomed: TDataSetField
      FieldName = 'med'
    end
    object Produtoarma: TDataSetField
      FieldName = 'arma'
    end
    object Produtocomb: TDataSetField
      FieldName = 'comb'
    end
    object ProdutoRECOPI: TStringField
      FieldName = 'nRECOPI'
    end
  end
  object Detalhe: TClientDataSet
    Aggregates = <>
    DataSetField = infNFedet
    Params = <>
    OnPostError = PostError
    Left = 513
    Top = 220
    object DetalhenItem: TSmallintField
      FieldName = 'nItem'
    end
    object Detalheprod: TDataSetField
      FieldName = 'prod'
    end
    object Detalheimposto: TDataSetField
      FieldName = 'imposto'
    end
    object DetalheinfAdProd: TStringField
      FieldName = 'infAdProd'
      Size = 500
    end
  end
  object Impostos: TClientDataSet
    Aggregates = <>
    DataSetField = Detalheimposto
    Params = <>
    OnPostError = PostError
    Left = 673
    Top = 267
    object ImpostosTotTrib: TFloatField
      FieldName = 'vTotTrib'
      DisplayFormat = '0.00'
    end
    object ImpostosICMS: TDataSetField
      FieldName = 'ICMS'
    end
    object ImpostosIPI: TDataSetField
      FieldName = 'IPI'
    end
    object ImpostosII: TDataSetField
      FieldName = 'II'
    end
    object ImpostosISSQN: TDataSetField
      FieldName = 'ISSQN'
    end
    object ImpostosPIS: TDataSetField
      FieldName = 'PIS'
    end
    object ImpostosPISST: TDataSetField
      FieldName = 'PISST'
    end
    object ImpostosCOFINS: TDataSetField
      FieldName = 'COFINS'
    end
    object ImpostosCOFINSST: TDataSetField
      FieldName = 'COFINSST'
    end
    object ImpostosICMSUFDest: TDataSetField
      FieldName = 'ICMSUFDest'
    end
  end
  object refNF: TClientDataSet
    Aggregates = <>
    DataSetField = Identificacao_NFrefrefNF
    Params = <>
    OnPostError = PostError
    Left = 5
    Top = 147
    object refNFcUF: TIntegerField
      FieldName = 'cUF'
    end
    object refNFAAMM: TStringField
      FieldName = 'AAMM'
      Size = 4
    end
    object refNFCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object refNFmod: TStringField
      FieldName = 'mod'
      Size = 2
    end
    object refNFserie: TSmallintField
      FieldName = 'serie'
    end
    object refNFnNF: TIntegerField
      FieldName = 'nNF'
    end
  end
  object EnderecoEmitente: TClientDataSet
    Aggregates = <>
    DataSetField = Emitente_Endereco
    Params = <>
    OnPostError = PostError
    Left = 184
    Top = 96
    object EnderecoEmitente_Logradouro: TStringField
      FieldName = 'xLgr'
      Size = 60
    end
    object EnderecoEmitente_Numero: TStringField
      FieldName = 'nro'
      Required = True
      Size = 60
    end
    object EnderecoEmitente_xComplemento: TStringField
      FieldName = 'xCpl'
      Size = 60
    end
    object EnderecoEmitente_Bairro: TStringField
      FieldName = 'xBairro'
      Size = 60
    end
    object EnderecoEmitente_CodigoMunicipio: TIntegerField
      FieldName = 'cMun'
      MaxValue = 9999999
    end
    object EnderecoEmitente_NomeMun: TStringField
      FieldName = 'xMun'
      Size = 60
    end
    object EnderecoEmitente_UF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object EnderecoEmitente_CEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object EnderecoEmitente_CodigoPais: TSmallintField
      FieldName = 'cPais'
      MaxValue = 9999
    end
    object EnderecoEmitente_NomePais: TStringField
      FieldName = 'xPais'
      Size = 60
    end
    object EnderecoEmitente_Fone: TStringField
      FieldName = 'fone'
      Size = 14
    end
  end
  object Destinatario_Endereco: TClientDataSet
    Aggregates = <>
    DataSetField = DestinatarioEndereco
    Params = <>
    OnPostError = PostError
    Left = 298
    Top = 96
    object Destinatario_EnderecoLogradouro: TStringField
      FieldName = 'xLgr'
      Size = 60
    end
    object Destinatario_EnderecoNumero: TStringField
      FieldName = 'nro'
      Required = True
      Size = 60
    end
    object Destinatario_EnderecoComplemento: TStringField
      FieldName = 'xCpl'
      Size = 60
    end
    object Destinatario_EnderecoBairro: TStringField
      FieldName = 'xBairro'
      Size = 60
    end
    object Destinatario_EnderecoCodigoMunicipio: TIntegerField
      FieldName = 'cMun'
      MaxValue = 9999999
    end
    object Destinatario_EnderecoNomeMunicipio: TStringField
      FieldName = 'xMun'
      Size = 60
    end
    object Destinatario_EnderecoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object Destinatario_EnderecoCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000000'
      Size = 8
    end
    object Destinatario_EnderecoCodigoPais: TSmallintField
      FieldName = 'cPais'
      MaxValue = 9999
    end
    object Destinatario_EnderecoNomePais: TStringField
      FieldName = 'xPais'
      Size = 60
    end
    object Destinatario_EnderecoFone: TStringField
      FieldName = 'fone'
      Size = 14
    end
  end
  object Entrega: TClientDataSet
    Aggregates = <>
    DataSetField = infNFeentrega
    Params = <>
    OnPostError = PostError
    Left = 398
    Top = 23
    object EntregaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object EntregaCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object EntregaLogradouro: TStringField
      FieldName = 'xLgr'
      Size = 60
    end
    object EntregaNumero: TStringField
      FieldName = 'nro'
      Size = 60
    end
    object EntregaComplemento: TStringField
      FieldName = 'xCpl'
      Size = 60
    end
    object EntregaBairro: TStringField
      FieldName = 'xBairro'
      Size = 60
    end
    object EntregaCodigoMunicipio: TStringField
      FieldName = 'cMun'
      Size = 7
    end
    object EntregaNomeMunicipio: TStringField
      FieldName = 'xMun'
      Size = 60
    end
    object EntregaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object TotaisNF: TClientDataSet
    Aggregates = <>
    DataSetField = infNFetotal
    Params = <>
    OnPostError = PostError
    Left = 657
    Top = 53
    object TotaisNF_ICMS: TDataSetField
      FieldName = 'ICMSTot'
    end
    object TotaisNF_ISSQN: TDataSetField
      FieldName = 'ISSQNtot'
    end
    object TotaisNF_Retencao: TDataSetField
      FieldName = 'retTrib'
    end
  end
  object NF_Icms: TClientDataSet
    Aggregates = <>
    DataSetField = TotaisNF_ICMS
    Params = <>
    OnPostError = PostError
    Left = 592
    Top = 101
    object NF_IcmsBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object NF_IcmsValorICMS: TFloatField
      FieldName = 'vICMS'
      DisplayFormat = '0.00'
    end
    object NF_IcmsICMSDeson: TFloatField
      FieldName = 'vICMSDeson'
      DisplayFormat = '0.00'
    end
    object NF_IcmsvFCPUFDest: TFloatField
      FieldName = 'vFCPUFDest'
      DisplayFormat = '0.00'
    end
    object NF_IcmsvICMSUFDest: TFloatField
      FieldName = 'vICMSUFDest'
      DisplayFormat = '0.00'
    end
    object NF_IcmsvICMSUFRemet: TFloatField
      FieldName = 'vICMSUFRemet'
      DisplayFormat = '0.00'
    end
    object NF_IcmsBCST: TFloatField
      FieldName = 'vBCST'
      DisplayFormat = '0.00'
    end
    object NF_IcmsST: TFloatField
      FieldName = 'vST'
      DisplayFormat = '0.00'
    end
    object NF_IcmsValorProduto: TFloatField
      FieldName = 'vProd'
      DisplayFormat = '0.00'
    end
    object NF_IcmsValorFrete: TFloatField
      FieldName = 'vFrete'
      DisplayFormat = '0.00'
    end
    object NF_IcmsValorSeguro: TFloatField
      FieldName = 'vSeg'
      DisplayFormat = '0.00'
    end
    object NF_IcmsValorDesconto: TFloatField
      FieldName = 'vDesc'
      DisplayFormat = '0.00'
    end
    object NF_IcmsValorII: TFloatField
      FieldName = 'vII'
      DisplayFormat = '0.00'
    end
    object NF_IcmsValorIPI: TFloatField
      FieldName = 'vIPI'
      DisplayFormat = '0.00'
    end
    object NF_IcmsValorPIS: TFloatField
      FieldName = 'vPIS'
      DisplayFormat = '0.00'
    end
    object NF_IcmsValorCOFINS: TFloatField
      FieldName = 'vCOFINS'
      DisplayFormat = '0.00'
    end
    object NF_IcmsValorOutros: TFloatField
      FieldName = 'vOutro'
      DisplayFormat = '0.00'
    end
    object NF_IcmsValorNF: TFloatField
      FieldName = 'vNF'
      DisplayFormat = '0.00'
    end
    object NF_IcmsTotTrib: TFloatField
      FieldName = 'vTotTrib'
    end
  end
  object NF_Issqn: TClientDataSet
    Aggregates = <>
    DataSetField = TotaisNF_ISSQN
    Params = <>
    OnPostError = PostError
    Left = 657
    Top = 101
    object NF_IssqnValorServico: TFloatField
      FieldName = 'vServ'
      DisplayFormat = '0.00'
    end
    object NF_IssqnBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object NF_IssqnValorISS: TFloatField
      FieldName = 'vISS'
      DisplayFormat = '0.00'
    end
    object NF_IssqnValorPIS: TFloatField
      FieldName = 'vPIS'
      DisplayFormat = '0.00'
    end
    object NF_IssqnValorCOFINS: TFloatField
      FieldName = 'vCOFINS'
      DisplayFormat = '0.00'
    end
    object NF_IssqndCompet: TDateField
      FieldName = 'dCompet'
    end
    object NF_IssqnvDeducao: TFloatField
      FieldName = 'vDeducao'
      DisplayFormat = '0.00'
    end
    object NF_IssqnvOutro: TFloatField
      FieldName = 'vOutro'
      DisplayFormat = '0.00'
    end
    object NF_IssqnvDescIncond: TFloatField
      FieldName = 'vDescIncond'
      DisplayFormat = '0.00'
    end
    object NF_IssqnvDescCond: TFloatField
      FieldName = 'vDescCond'
      DisplayFormat = '0.00'
    end
    object NF_IssqnvISSRet: TFloatField
      FieldName = 'vISSRet'
      DisplayFormat = '0.00'
    end
    object NF_IssqncRegTrib: TIntegerField
      FieldName = 'cRegTrib'
    end
  end
  object NF_Retencao: TClientDataSet
    Aggregates = <>
    DataSetField = TotaisNF_Retencao
    Params = <>
    OnPostError = PostError
    Left = 732
    Top = 101
    object NF_RetencaoValorPIS: TFloatField
      FieldName = 'vRetPIS'
      DisplayFormat = '0.00'
    end
    object NF_RetencaoValorCOFINS: TFloatField
      FieldName = 'vRetCOFINS'
      DisplayFormat = '0.00'
    end
    object NF_RetencaoValorCSLL: TFloatField
      FieldName = 'vRetCSLL'
      DisplayFormat = '0.00'
    end
    object NF_RetencaoValorBCIRRF: TFloatField
      FieldName = 'vBCIRRF'
      DisplayFormat = '0.00'
    end
    object NF_RetencaoValorIRRF: TFloatField
      FieldName = 'vIRRF'
      DisplayFormat = '0.00'
    end
    object NF_RetencaovBCRetPrev: TFloatField
      FieldName = 'vBCRetPrev'
      DisplayFormat = '0.00'
    end
    object NF_RetencaoValorPrev: TFloatField
      FieldName = 'vRetPrev'
      DisplayFormat = '0.00'
    end
  end
  object Tranporte: TClientDataSet
    Aggregates = <>
    DataSetField = infNFetransp
    Params = <>
    OnPostError = PostError
    Left = 1140
    Top = 220
    object Tranporte_modFrete: TSmallintField
      FieldName = 'modFrete'
    end
    object Tranporte_Transportadora: TDataSetField
      FieldName = 'transporta'
    end
    object Tranporteret_Transp: TDataSetField
      FieldName = 'retTransp'
    end
    object Tranporte_veicTransp: TDataSetField
      FieldName = 'veicTransp'
    end
    object Tranporte_reboque: TDataSetField
      FieldName = 'reboque'
    end
    object Tranporte_vol: TDataSetField
      FieldName = 'vol'
    end
  end
  object Cobranca: TClientDataSet
    Aggregates = <>
    DataSetField = infNFecobr
    Params = <>
    Left = 899
    Top = 53
    object CobrancaFatura: TDataSetField
      FieldName = 'fat'
    end
    object CobrancaDuplicata: TDataSetField
      FieldName = 'dup'
    end
  end
  object DadosAdicionais: TClientDataSet
    Aggregates = <>
    DataSetField = infNFeDadosAdicionais
    Params = <>
    Left = 1074
    Top = 53
    object DadosAdicionaisFisco: TStringField
      FieldName = 'infAdFisco'
      Size = 256
    end
    object DadosAdicionaisInfComplementar: TStringField
      FieldName = 'infCpl'
      Size = 5000
    end
    object DadosAdicionaisobsCont: TDataSetField
      FieldName = 'obsCont'
    end
    object DadosAdicionaisobsFisco: TDataSetField
      FieldName = 'obsFisco'
    end
    object DadosAdicionaisprocRef: TDataSetField
      FieldName = 'procRef'
    end
  end
  object exporta: TClientDataSet
    Aggregates = <>
    DataSetField = infNFeexporta
    Params = <>
    Left = 1253
    Top = 53
    object exportaUFEmbarq: TStringField
      FieldName = 'UFEmbarq'
      Size = 2
    end
    object exportaxLocEmbarq: TStringField
      FieldName = 'xLocEmbarq'
      Size = 60
    end
    object exportaUFSaidaPais: TStringField
      FieldName = 'UFSaidaPais'
      Size = 2
    end
    object exportaxLocExporta: TStringField
      FieldName = 'xLocExporta'
      Size = 60
    end
    object exportaxLocDespacho: TStringField
      FieldName = 'xLocDespacho'
      Size = 60
    end
  end
  object compra: TClientDataSet
    Aggregates = <>
    DataSetField = infNFecompra
    Params = <>
    Left = 1209
    Top = 53
    object compraxNEmp: TStringField
      FieldName = 'xNEmp'
      Size = 17
    end
    object compraxPed: TStringField
      FieldName = 'xPed'
      Size = 60
    end
    object compraxCont: TStringField
      FieldName = 'xCont'
      Size = 60
    end
  end
  object Transportadora: TClientDataSet
    Aggregates = <>
    DataSetField = Tranporte_Transportadora
    Params = <>
    OnPostError = PostError
    Left = 1024
    Top = 267
    object TransportadoraCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object TransportadoraCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object TransportadoraxNome: TStringField
      FieldName = 'xNome'
      Size = 60
    end
    object TransportadoraIE: TStringField
      FieldName = 'IE'
      Size = 14
    end
    object TransportadoraxEnder: TStringField
      FieldName = 'xEnder'
      Size = 60
    end
    object TransportadoraxMun: TStringField
      FieldName = 'xMun'
      Size = 60
    end
    object TransportadoraUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object retTransp: TClientDataSet
    Aggregates = <>
    DataSetField = Tranporteret_Transp
    Params = <>
    OnPostError = PostError
    Left = 1089
    Top = 267
    object retTranspvServ: TFloatField
      FieldName = 'vServ'
    end
    object retTranspvBCRet: TFloatField
      FieldName = 'vBCRet'
      DisplayFormat = '0.00'
    end
    object retTransppICMSRet: TFloatField
      FieldName = 'pICMSRet'
      DisplayFormat = '0.00'
    end
    object retTranspvICMSRet: TFloatField
      FieldName = 'vICMSRet'
      DisplayFormat = '0.00'
    end
    object retTranspCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object retTranspcMunFG: TStringField
      FieldName = 'cMunFG'
      Size = 7
    end
  end
  object veicTransp: TClientDataSet
    Aggregates = <>
    DataSetField = Tranporte_veicTransp
    Params = <>
    OnPostError = PostError
    Left = 1140
    Top = 267
    object veicTranspplaca: TStringField
      FieldName = 'placa'
      Size = 8
    end
    object veicTranspUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object veicTranspRNTC: TStringField
      FieldName = 'RNTC'
    end
  end
  object reboque: TClientDataSet
    Aggregates = <>
    DataSetField = Tranporte_reboque
    Params = <>
    Left = 1189
    Top = 267
    object reboqueplaca: TStringField
      FieldName = 'placa'
      Size = 8
    end
    object reboqueUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object reboqueRNTC: TStringField
      FieldName = 'RNTC'
    end
  end
  object vol: TClientDataSet
    Aggregates = <>
    DataSetField = Tranporte_vol
    Params = <>
    Left = 1232
    Top = 267
    object volqVol: TIntegerField
      FieldName = 'qVol'
    end
    object volesp: TStringField
      FieldName = 'esp'
      Size = 60
    end
    object volmarca: TStringField
      FieldName = 'marca'
      Size = 60
    end
    object volnVol: TStringField
      FieldName = 'nVol'
      Size = 60
    end
    object volpesoL: TFloatField
      FieldName = 'pesoL'
      DisplayFormat = '0.000'
    end
    object volpesoB: TFloatField
      FieldName = 'pesoB'
      DisplayFormat = '0.000'
    end
    object vollacres: TDataSetField
      FieldName = 'lacres'
    end
  end
  object Fatura: TClientDataSet
    Aggregates = <>
    DataSetField = CobrancaFatura
    Params = <>
    OnPostError = PostError
    Left = 872
    Top = 101
    object FaturaNumero: TStringField
      FieldName = 'nFat'
      Size = 60
    end
    object FaturaValorOriginal: TFloatField
      FieldName = 'vOrig'
      DisplayFormat = '0.00'
    end
    object FaturaValorDesconto: TFloatField
      FieldName = 'vDesc'
      DisplayFormat = '0.00'
    end
    object FaturaValorLiquido: TFloatField
      FieldName = 'vLiq'
      DisplayFormat = '0.00'
    end
  end
  object Duplicata: TClientDataSet
    Aggregates = <>
    DataSetField = CobrancaDuplicata
    Params = <>
    OnPostError = PostError
    Left = 927
    Top = 101
    object DuplicataNumero: TStringField
      FieldName = 'nDup'
      Size = 60
    end
    object DuplicataVencimento: TDateField
      FieldName = 'dVenc'
    end
    object DuplicataValor: TFloatField
      FieldName = 'vDup'
      DisplayFormat = '0.00'
    end
  end
  object ObsContribuinte: TClientDataSet
    Aggregates = <>
    DataSetField = DadosAdicionaisobsCont
    Params = <>
    OnPostError = PostError
    Left = 1007
    Top = 101
    object ObsContribuinteCampo: TStringField
      FieldName = 'xCampo'
    end
    object ObsContribuinteTexto: TStringField
      FieldName = 'xTexto'
      Size = 60
    end
  end
  object ObsFisco: TClientDataSet
    Aggregates = <>
    DataSetField = DadosAdicionaisobsFisco
    Params = <>
    OnPostError = PostError
    Left = 1073
    Top = 101
    object ObsFiscoCampo: TStringField
      FieldName = 'xCampo'
    end
    object ObsFiscoTexto: TStringField
      FieldName = 'xTexto'
      Size = 60
    end
  end
  object ProcessoReferenciado: TClientDataSet
    Aggregates = <>
    DataSetField = DadosAdicionaisprocRef
    Params = <>
    Left = 1162
    Top = 101
    object ProcessoReferenciadoNumero: TStringField
      FieldName = 'nProc'
      Size = 60
    end
    object ProcessoReferenciadoOrigem: TSmallintField
      FieldName = 'indProc'
      MaxValue = 9
    end
  end
  object lacres: TClientDataSet
    Aggregates = <>
    DataSetField = vollacres
    Params = <>
    Left = 1235
    Top = 317
    object lacresnLacre: TStringField
      FieldName = 'nLacre'
      Size = 60
    end
  end
  object DI: TClientDataSet
    Aggregates = <>
    DataSetField = ProdutoDI
    Params = <>
    OnPostError = PostError
    Left = 11
    Top = 303
    object DIDocumento: TStringField
      FieldName = 'nDI'
      Size = 10
    end
    object DIDataRegistro: TDateField
      FieldName = 'dDI'
    end
    object DILocalDesembaraco: TStringField
      FieldName = 'xLocDesemb'
      Size = 60
    end
    object DIUFDesembaraco: TStringField
      FieldName = 'UFDesemb'
      Size = 2
    end
    object DIDataDesembaraco: TDateField
      FieldName = 'dDesemb'
    end
    object DItpViaTransp: TIntegerField
      FieldName = 'tpViaTransp'
    end
    object DIvAFRMM: TFloatField
      FieldName = 'vAFRMM'
      DisplayFormat = '0.00'
    end
    object DItpIntermedio: TIntegerField
      FieldName = 'tpIntermedio'
    end
    object DICNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object DIUFTerceiro: TStringField
      FieldName = 'UFTerceiro'
      Size = 2
    end
    object DICodigoExportador: TStringField
      FieldName = 'cExportador'
      Size = 60
    end
    object DIadi: TDataSetField
      FieldName = 'adi'
    end
  end
  object DIAdicao: TClientDataSet
    Aggregates = <>
    DataSetField = DIadi
    Params = <>
    OnPostError = PostError
    Left = 11
    Top = 354
    object DIAdicaoNumero: TSmallintField
      FieldName = 'nAdicao'
      MaxValue = 999
    end
    object DIAdicaoSequencialItem: TSmallintField
      FieldName = 'nSeqAdic'
      MaxValue = 999
    end
    object DIAdicaoCodigoFabricante: TStringField
      FieldName = 'cFabricante'
      Size = 60
    end
    object DIAdicaoDecontoItem: TFloatField
      FieldName = 'vDescDI'
      DisplayFormat = '0.00'
    end
  end
  object Veiculo: TClientDataSet
    Aggregates = <>
    DataSetField = ProdutoveicProd
    Params = <>
    OnPostError = PostError
    Left = 113
    Top = 303
    object VeiculoTipoOperacao: TSmallintField
      FieldName = 'tpOp'
      MaxValue = 3
    end
    object VeiculoChassi: TStringField
      FieldName = 'chassi'
      Size = 17
    end
    object VeiculoCodigoCor: TStringField
      FieldName = 'cCor'
      Size = 4
    end
    object VeiculoDescricaoCor: TStringField
      FieldName = 'xCor'
      Size = 40
    end
    object VeiculoPotencia: TStringField
      FieldName = 'pot'
      Size = 4
    end
    object Veiculocilin: TStringField
      FieldName = 'cilin'
      Size = 4
    end
    object VeiculoCM3: TStringField
      FieldName = 'CM3'
      Size = 4
    end
    object VeiculoPesoLiquido: TStringField
      FieldName = 'pesoL'
      Size = 9
    end
    object VeiculoPesoBruto: TStringField
      FieldName = 'pesoB'
      Size = 9
    end
    object VeiculoSerie: TStringField
      FieldName = 'nSerie'
      Size = 9
    end
    object VeiculoTipoCombustivel: TStringField
      FieldName = 'tpComb'
      Size = 8
    end
    object VeiculoNumeroMotor: TStringField
      FieldName = 'nMotor'
      Size = 21
    end
    object VeiculoCMKG: TStringField
      FieldName = 'CMKG'
      Size = 9
    end
    object VeiculoEntreEixos: TStringField
      FieldName = 'dist'
      Size = 4
    end
    object VeiculoRENAVAM: TIntegerField
      FieldName = 'RENAVAM'
      DisplayFormat = '000000000'
    end
    object VeiculoAnoModelo: TSmallintField
      FieldName = 'anoMod'
      DisplayFormat = '0000'
    end
    object VeiculoAnoFabricacao: TSmallintField
      FieldName = 'anoFab'
      DisplayFormat = '0000'
    end
    object VeiculoTipoPintura: TStringField
      FieldName = 'tpPint'
      Size = 1
    end
    object VeiculoTipo: TSmallintField
      FieldName = 'tpVeic'
      MaxValue = 99
    end
    object VeiculoEspecie: TSmallintField
      FieldName = 'espVei'
      MaxValue = 9
    end
    object VeiculoVIN: TStringField
      FieldName = 'VIN'
      Size = 1
    end
    object VeiculoCondicao: TSmallintField
      FieldName = 'condVeic'
      MaxValue = 3
      MinValue = 1
    end
    object VeiculoCodigoModelo: TIntegerField
      FieldName = 'cMod'
      MaxValue = 999999
    end
  end
  object Medicamento: TClientDataSet
    Aggregates = <>
    DataSetField = Produtomed
    Params = <>
    OnPostError = PostError
    Left = 166
    Top = 303
    object MedicamentoNumeroLote: TStringField
      FieldName = 'nLote'
    end
    object MedicamentoQtdeLote: TFloatField
      FieldName = 'qLote'
      DisplayFormat = '0.000'
    end
    object MedicamentoDataFabricacao: TDateField
      FieldName = 'dFab'
    end
    object MedicamentoValidade: TDateField
      FieldName = 'dVal'
    end
    object MedicamentoPMC: TFloatField
      FieldName = 'vPMC'
      DisplayFormat = '0.00'
    end
  end
  object Armamento: TClientDataSet
    Aggregates = <>
    DataSetField = Produtoarma
    Params = <>
    OnPostError = PostError
    Left = 230
    Top = 303
    object ArmamentoTipo: TSmallintField
      FieldName = 'tpArma'
      MaxValue = 1
    end
    object ArmamentoSerie: TStringField
      FieldName = 'nSerie'
      Size = 15
    end
    object ArmamentoCano: TStringField
      FieldName = 'nCano'
      Size = 15
    end
    object ArmamentoDescricao: TStringField
      FieldName = 'descr'
      Size = 256
    end
  end
  object Combustivel: TClientDataSet
    Aggregates = <>
    DataSetField = Produtocomb
    Params = <>
    OnPostError = PostError
    Left = 291
    Top = 304
    object CombustivelcProdANP: TIntegerField
      FieldName = 'cProdANP'
      DisplayFormat = '000000000'
      MaxValue = 999999999
    end
    object CombustivelMixGN: TFloatField
      FieldName = 'pMixGN'
      DisplayFormat = '0.0000'
    end
    object CombustivelCODIF: TStringField
      FieldName = 'CODIF'
      Size = 21
    end
    object CombustivelqTemp: TFloatField
      FieldName = 'qTemp'
      DisplayFormat = '0.0000'
    end
    object CombustivelUFCons: TStringField
      FieldName = 'UFCons'
      Size = 2
    end
    object CombustivelCIDE: TDataSetField
      FieldName = 'CIDE'
    end
    object CombustivelICMSComb: TDataSetField
      FieldName = 'ICMSComb'
    end
    object CombustivelICMSInter: TDataSetField
      FieldName = 'ICMSInter'
    end
    object CombustivelICMSCons: TDataSetField
      FieldName = 'ICMSCons'
    end
    object Combustivelencerrante: TDataSetField
      FieldName = 'encerrante'
    end
  end
  object CIDE: TClientDataSet
    Aggregates = <>
    DataSetField = CombustivelCIDE
    Params = <>
    OnPostError = PostError
    Left = 291
    Top = 354
    object CIDEqBCProd: TFloatField
      FieldName = 'qBCProd'
      DisplayFormat = '0.0000'
    end
    object CIDEvAliqProd: TFloatField
      FieldName = 'vAliqProd'
      DisplayFormat = '0.0000'
    end
    object CIDEvCIDE: TFloatField
      FieldName = 'vCIDE'
      DisplayFormat = '0.00'
    end
  end
  object ICMSComb: TClientDataSet
    Aggregates = <>
    DataSetField = CombustivelICMSComb
    Params = <>
    OnPostError = PostError
    Left = 290
    Top = 444
    object ICMSCombvBCICMS: TFloatField
      FieldName = 'vBCICMS'
      DisplayFormat = '0.00'
    end
    object ICMSCombvICMS: TFloatField
      FieldName = 'vICMS'
      DisplayFormat = '0.00'
    end
    object ICMSCombvBCICMSST: TFloatField
      FieldName = 'vBCICMSST'
      DisplayFormat = '0.00'
    end
    object ICMSCombvICMSST: TFloatField
      FieldName = 'vICMSST'
      DisplayFormat = '0.00'
    end
  end
  object ICMSInter: TClientDataSet
    Aggregates = <>
    DataSetField = CombustivelICMSInter
    Params = <>
    OnPostError = PostError
    Left = 289
    Top = 491
    object ICMSIntervBCICMSSTDest: TFloatField
      FieldName = 'vBCICMSSTDest'
      DisplayFormat = '0.00'
    end
    object ICMSIntervICMSSTDest: TFloatField
      FieldName = 'vICMSSTDest'
      DisplayFormat = '0.00'
    end
  end
  object ICMSCons: TClientDataSet
    Aggregates = <>
    DataSetField = CombustivelICMSCons
    Params = <>
    OnPostError = PostError
    Left = 289
    Top = 539
    object ICMSConsvBCICMSSTCons: TFloatField
      FieldName = 'vBCICMSSTCons'
      DisplayFormat = '0.00'
    end
    object ICMSConsvICMSSTCons: TFloatField
      FieldName = 'vICMSSTCons'
      DisplayFormat = '0.00'
    end
    object ICMSConsUFCons: TStringField
      FieldName = 'UFCons'
      Size = 2
    end
  end
  object ICMS: TClientDataSet
    Aggregates = <>
    DataSetField = ImpostosICMS
    Params = <>
    OnPostError = PostError
    Left = 522
    Top = 309
    object ICMSICMS00: TDataSetField
      FieldName = 'ICMS00'
    end
    object ICMSICMS10: TDataSetField
      FieldName = 'ICMS10'
    end
    object ICMSICMS20: TDataSetField
      FieldName = 'ICMS20'
    end
    object ICMSICMS30: TDataSetField
      FieldName = 'ICMS30'
    end
    object ICMSICMS40: TDataSetField
      FieldName = 'ICMS40'
    end
    object ICMSICMS51: TDataSetField
      FieldName = 'ICMS51'
    end
    object ICMSICMS60: TDataSetField
      FieldName = 'ICMS60'
    end
    object ICMSICMS70: TDataSetField
      FieldName = 'ICMS70'
    end
    object ICMSICMS90: TDataSetField
      FieldName = 'ICMS90'
    end
    object ICMSICMSST: TDataSetField
      FieldName = 'ICMSST'
      UnNamed = True
    end
    object ICMSICMSPart: TDataSetField
      FieldName = 'ICMSPart'
      UnNamed = True
    end
    object ICMSICMSSN101: TDataSetField
      FieldName = 'ICMSSN101'
      UnNamed = True
    end
    object ICMSICMSSN102: TDataSetField
      FieldName = 'ICMSSN102'
      UnNamed = True
    end
    object ICMSICMSSN201: TDataSetField
      FieldName = 'ICMSSN201'
      UnNamed = True
    end
    object ICMSICMSSN202: TDataSetField
      FieldName = 'ICMSSN202'
      UnNamed = True
    end
    object ICMSICMSSN500: TDataSetField
      FieldName = 'ICMSSN500'
      UnNamed = True
    end
    object ICMSICMSSN900: TDataSetField
      FieldName = 'ICMSSN900'
      UnNamed = True
    end
  end
  object II: TClientDataSet
    Aggregates = <>
    DataSetField = ImpostosII
    Params = <>
    OnPostError = PostError
    Left = 734
    Top = 317
    object IIValorBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object IIDespesasAduaneiras: TFloatField
      FieldName = 'vDespAdu'
      DisplayFormat = '0.00'
    end
    object IIValor: TFloatField
      FieldName = 'vII'
      DisplayFormat = '0.00'
    end
    object IIValorIOF: TFloatField
      FieldName = 'vIOF'
      DisplayFormat = '0.00'
    end
  end
  object IPI: TClientDataSet
    Aggregates = <>
    DataSetField = ImpostosIPI
    Params = <>
    OnPostError = PostError
    Left = 690
    Top = 317
    object IPIClasseEnquadramento: TStringField
      FieldName = 'clEnq'
      Size = 5
    end
    object IPICNPJProdutor: TStringField
      FieldName = 'CNPJProd'
      Size = 14
    end
    object IPIQtdeSelo: TStringField
      FieldName = 'cSelo'
      Size = 60
    end
    object IPIqSelo: TIntegerField
      FieldName = 'qSelo'
    end
    object IPICodigoEnquadramento: TStringField
      FieldName = 'cEnq'
      Size = 3
    end
    object IPIIPITributado: TDataSetField
      FieldName = 'IPITrib'
    end
    object IPIIPINaoTributado: TDataSetField
      FieldName = 'IPINT'
    end
  end
  object PIS: TClientDataSet
    Aggregates = <>
    DataSetField = ImpostosPIS
    Params = <>
    OnPostError = PostError
    Left = 820
    Top = 317
    object PISPISAliquota: TDataSetField
      FieldName = 'PISAliq'
    end
    object PISPISQtde: TDataSetField
      FieldName = 'PISQtde'
    end
    object PISPISNaoTributado: TDataSetField
      FieldName = 'PISNT'
    end
    object PISPISOutros: TDataSetField
      FieldName = 'PISOutr'
    end
  end
  object PISST: TClientDataSet
    Aggregates = <>
    DataSetField = ImpostosPISST
    Params = <>
    OnPostError = PostError
    Left = 870
    Top = 317
    object PISSTBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object PISSTAliquota: TFloatField
      FieldName = 'pPIS'
      DisplayFormat = '0.00'
    end
    object PISSTQtdeVendida: TFloatField
      FieldName = 'qBCProd'
      DisplayFormat = '0.0000'
    end
    object PISSTValorUnit: TFloatField
      FieldName = 'vAliqProd'
      DisplayFormat = '0.0000'
    end
    object PISSTValor: TFloatField
      FieldName = 'vPIS'
      DisplayFormat = '0.00'
    end
  end
  object COFINS: TClientDataSet
    Aggregates = <>
    DataSetField = ImpostosCOFINS
    Params = <>
    OnPostError = PostError
    Left = 920
    Top = 317
    object COFINSCOFINSAliquota: TDataSetField
      FieldName = 'COFINSAliq'
    end
    object COFINSCOFINSQtde: TDataSetField
      FieldName = 'COFINSQtde'
    end
    object COFINSCOFINSNaoTributado: TDataSetField
      FieldName = 'COFINSNT'
    end
    object COFINSCOFINSOutr: TDataSetField
      FieldName = 'COFINSOutr'
    end
  end
  object COFINSST: TClientDataSet
    Aggregates = <>
    DataSetField = ImpostosCOFINSST
    Params = <>
    OnPostError = PostError
    Left = 971
    Top = 317
    object COFINSSTBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object COFINSSTAliquota: TFloatField
      FieldName = 'pCOFINS'
      DisplayFormat = '0.00'
    end
    object COFINSSTQtdeVendido: TFloatField
      FieldName = 'qBCProd'
      DisplayFormat = '0.0000'
    end
    object COFINSSTValorUnit: TFloatField
      FieldName = 'vAliqProd'
      DisplayFormat = '0.0000'
    end
    object COFINSSTValor: TFloatField
      FieldName = 'vCOFINS'
      DisplayFormat = '0.00'
    end
  end
  object ISSQN: TClientDataSet
    Aggregates = <>
    DataSetField = ImpostosISSQN
    Params = <>
    OnPostError = PostError
    Left = 775
    Top = 318
    object ISSQNBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object ISSQNAliquota: TFloatField
      FieldName = 'vAliq'
      DisplayFormat = '0.00'
    end
    object ISSQNValor: TFloatField
      FieldName = 'vISSQN'
      DisplayFormat = '0.00'
    end
    object ISSQNCodigoMunicipio: TIntegerField
      FieldName = 'cMunFG'
      DisplayFormat = '0000000'
      MaxValue = 9999999
    end
    object ISSQNCodigoServico: TSmallintField
      FieldName = 'cListServ'
      DisplayFormat = '#000'
      MaxValue = 9999
      MinValue = 100
    end
    object ISSQNSituacaoTributaria: TStringField
      FieldName = 'cSitTrib'
      Required = True
      Size = 1
    end
    object ISSQNvDeducao: TFloatField
      FieldName = 'vDeducao'
      DisplayFormat = '0.00'
    end
    object ISSQNvOutro: TFloatField
      FieldName = 'vOutro'
      DisplayFormat = '0.00'
    end
    object ISSQNvDescIncond: TFloatField
      FieldName = 'vDescIncond'
      DisplayFormat = '0.00'
    end
    object ISSQNvDescCond: TFloatField
      FieldName = 'vDescCond'
      DisplayFormat = '0.00'
    end
    object ISSQNvISSRet: TFloatField
      FieldName = 'vISSRet'
      DisplayFormat = '0.00'
    end
    object ISSQNindISS: TIntegerField
      FieldName = 'indISS'
    end
    object ISSQNcServico: TStringField
      FieldName = 'cServico'
    end
    object ISSQNcMun: TStringField
      FieldName = 'cMun'
      Size = 7
    end
    object ISSQNcPais: TIntegerField
      FieldName = 'cPais'
    end
    object ISSQNnProcesso: TStringField
      FieldName = 'nProcesso'
      Size = 30
    end
    object ISSQNindincentivo: TIntegerField
      FieldName = 'indincentivo'
    end
  end
  object ICMS00: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMS00
    Params = <>
    OnPostError = PostError
    Left = 460
    Top = 365
    object ICMS00Origem: TSmallintField
      FieldName = 'orig'
      MaxValue = 9
    end
    object ICMS00CST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
    end
    object ICMS00ModalidadeBC: TSmallintField
      FieldName = 'modBC'
      MaxValue = 3
    end
    object ICMS00ValorBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object ICMS00AliquotaICMS: TFloatField
      FieldName = 'pICMS'
      DisplayFormat = '0.00'
    end
    object ICMS00ValorICMS: TFloatField
      FieldName = 'vICMS'
      DisplayFormat = '0.00'
    end
  end
  object ICMS10: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMS10
    Params = <>
    OnPostError = PostError
    Left = 460
    Top = 411
    object ICMS10Origem: TSmallintField
      FieldName = 'orig'
      MaxValue = 9
    end
    object ICMS10CST: TIntegerField
      FieldName = 'CST'
      DisplayFormat = '00'
      MaxValue = 10
      MinValue = 10
    end
    object ICMS10ModalidadeBC: TSmallintField
      FieldName = 'modBC'
      MaxValue = 3
    end
    object ICMS10ValorBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object ICMS10AliquotaICMS: TFloatField
      FieldName = 'pICMS'
      DisplayFormat = '0.00'
    end
    object ICMS10ValorICMS: TFloatField
      FieldName = 'vICMS'
      DisplayFormat = '0.00'
    end
    object ICMS10ModalidadeBCST: TSmallintField
      FieldName = 'modBCST'
      MaxValue = 5
    end
    object ICMS10APercentMVAST: TFloatField
      FieldName = 'pMVAST'
      DisplayFormat = '0.00'
    end
    object ICMS10PercentReducaoBCST: TFloatField
      FieldName = 'pRedBCST'
      DisplayFormat = '0.00'
    end
    object ICMS10ValorBCST: TFloatField
      FieldName = 'vBCST'
      DisplayFormat = '0.00'
    end
    object ICMS10AliquotaICMSST: TFloatField
      FieldName = 'pICMSST'
      DisplayFormat = '0.00'
    end
    object ICMS10ValorICMSST: TFloatField
      FieldName = 'vICMSST'
      DisplayFormat = '0.00'
    end
  end
  object ICMS20: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMS20
    Params = <>
    OnPostError = PostError
    Left = 461
    Top = 456
    object ICMS20Origem: TSmallintField
      FieldName = 'orig'
      MaxValue = 9
    end
    object ICMS20CST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
      MaxValue = 20
      MinValue = 20
    end
    object ICMS20ModalidadeBC: TSmallintField
      FieldName = 'modBC'
      MaxValue = 3
    end
    object ICMS20PercetReducaoBC: TFloatField
      FieldName = 'pRedBC'
      DisplayFormat = '0.00'
    end
    object ICMS20ValorBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object ICMS20AliquotaICMS: TFloatField
      FieldName = 'pICMS'
      DisplayFormat = '0.00'
    end
    object ICMS20ValorICMS: TFloatField
      FieldName = 'vICMS'
      DisplayFormat = '0.00'
    end
    object ICMS20vICMSDeson: TFloatField
      FieldName = 'vICMSDeson'
      DisplayFormat = '0.00'
    end
    object ICMS20motDesICMS: TIntegerField
      FieldName = 'motDesICMS'
    end
  end
  object ICMS30: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMS30
    Params = <>
    OnPostError = PostError
    Left = 460
    Top = 502
    object ICMS30Origem: TSmallintField
      FieldName = 'orig'
      MaxValue = 9
    end
    object ICMS30CST: TSmallintField
      FieldName = 'CST'
      MaxValue = 30
      MinValue = 30
    end
    object ICMS30ModalidadeBCST: TSmallintField
      FieldName = 'modBCST'
      MaxValue = 5
    end
    object ICMS30PercentMVAST: TFloatField
      FieldName = 'pMVAST'
      DisplayFormat = '0.00'
    end
    object ICMS30PercentReducaoBCST: TFloatField
      FieldName = 'pRedBCST'
      DisplayFormat = '0.00'
    end
    object ICMS30ValorBCST: TFloatField
      FieldName = 'vBCST'
      DisplayFormat = '0.00'
    end
    object ICMS30AliquiotaICMSST: TFloatField
      FieldName = 'pICMSST'
      DisplayFormat = '0.00'
    end
    object ICMS30ValorICMSST: TFloatField
      FieldName = 'vICMSST'
      DisplayFormat = '0.00'
    end
    object ICMS30vICMSDeson: TFloatField
      FieldName = 'vICMSDeson'
      DisplayFormat = '0.00'
    end
    object ICMS30motDesICMS: TIntegerField
      FieldName = 'motDesICMS'
    end
  end
  object ICMS40: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMS40
    Params = <>
    OnPostError = PostError
    Left = 508
    Top = 381
    object ICMS40Origem: TSmallintField
      FieldName = 'orig'
      MaxValue = 9
    end
    object ICMS40CST: TSmallintField
      FieldName = 'CST'
      MaxValue = 50
      MinValue = 40
    end
    object ICMS40vICMSDeson: TFloatField
      FieldName = 'vICMSDeson'
      DisplayFormat = '0.00'
    end
    object ICMS40motDesICMS: TIntegerField
      FieldName = 'motDesICMS'
    end
  end
  object ICMS51: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMS51
    Params = <>
    OnPostError = PostError
    Left = 507
    Top = 429
    object ICMS51Origem: TSmallintField
      FieldName = 'orig'
      MaxValue = 9
    end
    object ICMS51CST: TSmallintField
      FieldName = 'CST'
      MaxValue = 51
      MinValue = 51
    end
    object ICMS51ModalidadeBC: TSmallintField
      FieldName = 'modBC'
      MaxValue = 3
    end
    object ICMS51PercentReducaoBC: TFloatField
      FieldName = 'pRedBC'
      DisplayFormat = '0.00'
    end
    object ICMS51ValorBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object ICMS51AliquotaICMS: TFloatField
      FieldName = 'pICMS'
      DisplayFormat = '0.00'
    end
    object ICMS51ValorICMS: TFloatField
      FieldName = 'vICMS'
      DisplayFormat = '0.00'
    end
    object ICMS51vICMSOp: TFloatField
      FieldName = 'vICMSOp'
    end
    object ICMS51pDif: TFloatField
      FieldName = 'pDif'
    end
    object ICMS51vICMSDif: TFloatField
      FieldName = 'vICMSDif'
    end
  end
  object ICMS60: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMS60
    Params = <>
    OnPostError = PostError
    Left = 507
    Top = 475
    object ICMS60Origem: TSmallintField
      FieldName = 'orig'
      MaxValue = 9
    end
    object ICMS60CST: TSmallintField
      FieldName = 'CST'
      MaxValue = 60
      MinValue = 60
    end
    object ICMS60ValorBCST: TFloatField
      FieldName = 'vBCSTRet'
      DisplayFormat = '0.00'
    end
    object ICMS60ValorICMSST: TFloatField
      FieldName = 'vICMSSTRet'
      DisplayFormat = '0.00'
    end
  end
  object ICMS70: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMS70
    Params = <>
    OnPostError = PostError
    Left = 507
    Top = 520
    object ICMS70Origem: TSmallintField
      FieldName = 'orig'
      MaxValue = 9
    end
    object ICMS70CST: TSmallintField
      FieldName = 'CST'
      MaxValue = 70
      MinValue = 70
    end
    object ICMS70ModalidadeBC: TSmallintField
      FieldName = 'modBC'
      MaxValue = 3
    end
    object ICMS70PercentReducaoBC: TFloatField
      FieldName = 'pRedBC'
      DisplayFormat = '0.00'
    end
    object ICMS70ValorBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object ICMS70AliquotaICMS: TFloatField
      FieldName = 'pICMS'
      DisplayFormat = '0.00'
    end
    object ICMS70ValorICMS: TFloatField
      FieldName = 'vICMS'
      DisplayFormat = '0.00'
    end
    object ICMS70ModalidadeBCST: TSmallintField
      FieldName = 'modBCST'
      MaxValue = 5
    end
    object ICMS70PercentMVAST: TFloatField
      FieldName = 'pMVAST'
      DisplayFormat = '0.00'
    end
    object ICMS70PercentReducaoBCST: TFloatField
      FieldName = 'pRedBCST'
      DisplayFormat = '0.00'
    end
    object ICMS70ValorBCST: TFloatField
      FieldName = 'vBCST'
      DisplayFormat = '0.00'
    end
    object ICMS70AliquotaICMSST: TFloatField
      FieldName = 'pICMSST'
      DisplayFormat = '0.00'
    end
    object ICMS70ValorICMSST: TFloatField
      FieldName = 'vICMSST'
      DisplayFormat = '0.00'
    end
    object ICMS70vICMSDeson: TFloatField
      FieldName = 'vICMSDeson'
      DisplayFormat = '0.00'
    end
    object ICMS70motDesICMS: TIntegerField
      FieldName = 'motDesICMS'
    end
  end
  object ICMS90: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMS90
    Params = <>
    OnPostError = PostError
    Left = 507
    Top = 566
    object ICMS90Origem: TSmallintField
      FieldName = 'orig'
      MaxValue = 9
    end
    object ICMS90CST: TSmallintField
      FieldName = 'CST'
      MaxValue = 90
      MinValue = 90
    end
    object ICMS90ModalidadeBC: TSmallintField
      FieldName = 'modBC'
      MaxValue = 3
    end
    object ICMS90ValorBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object ICMS90PercentReducaoBC: TFloatField
      FieldName = 'pRedBC'
      DisplayFormat = '0.00'
    end
    object ICMS90AliquotaICMS: TFloatField
      FieldName = 'pICMS'
      DisplayFormat = '0.00'
    end
    object ICMS90ValorICMS: TFloatField
      FieldName = 'vICMS'
      DisplayFormat = '0.00'
    end
    object ICMS90ModalidadeBCST: TSmallintField
      FieldName = 'modBCST'
      MaxValue = 5
    end
    object ICMS90PercentMVAST: TFloatField
      FieldName = 'pMVAST'
      DisplayFormat = '0.00'
    end
    object ICMS90PercentReducaoBCST: TFloatField
      FieldName = 'pRedBCST'
      DisplayFormat = '0.00'
    end
    object ICMS90ValorBCST: TFloatField
      FieldName = 'vBCST'
      DisplayFormat = '0.00'
    end
    object ICMS90PercentICMSST: TFloatField
      FieldName = 'pICMSST'
      DisplayFormat = '0.00'
    end
    object ICMS90ValorICMSST: TFloatField
      FieldName = 'vICMSST'
      DisplayFormat = '0.00'
    end
    object ICMS90vICMSDeson: TFloatField
      FieldName = 'vICMSDeson'
      DisplayFormat = '0.00'
    end
    object ICMS90motDesICMS: TIntegerField
      FieldName = 'motDesICMS'
    end
  end
  object COFINSAliquota: TClientDataSet
    Aggregates = <>
    DataSetField = COFINSCOFINSAliquota
    Params = <>
    OnPostError = PostError
    Left = 924
    Top = 362
    object COFINSAliquotaCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
      MaxValue = 2
      MinValue = 1
    end
    object COFINSAliquotaBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object COFINSAliquotaAliquota: TFloatField
      FieldName = 'pCOFINS'
      DisplayFormat = '0.00'
    end
    object COFINSAliquotaValor: TFloatField
      FieldName = 'vCOFINS'
      DisplayFormat = '0.00'
    end
  end
  object COFINSQtde: TClientDataSet
    Aggregates = <>
    DataSetField = COFINSCOFINSQtde
    Params = <>
    OnPostError = PostError
    Left = 924
    Top = 410
    object COFINSQtdeCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
      MaxValue = 3
      MinValue = 3
    end
    object COFINSQtdeVendido: TFloatField
      FieldName = 'qBCProd'
      DisplayFormat = '0.0000'
    end
    object COFINSQtdeValorUnit: TFloatField
      FieldName = 'vAliqProd'
      DisplayFormat = '0.0000'
    end
    object COFINSQtdeValor: TFloatField
      FieldName = 'vCOFINS'
      DisplayFormat = '0.00'
    end
  end
  object COFINSNaoTributado: TClientDataSet
    Aggregates = <>
    DataSetField = COFINSCOFINSNaoTributado
    Params = <>
    OnPostError = PostError
    Left = 924
    Top = 458
    object COFINSNaoTributadoCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
      MaxValue = 9
      MinValue = 4
    end
  end
  object COFINSOutros: TClientDataSet
    Aggregates = <>
    DataSetField = COFINSCOFINSOutr
    Params = <>
    OnPostError = PostError
    Left = 924
    Top = 506
    object COFINSOutrosCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
    end
    object COFINSOutrosBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object COFINSOutrosAliquota: TFloatField
      FieldName = 'pCOFINS'
      DisplayFormat = '0.00'
    end
    object COFINSOutrosQtdeVendida: TFloatField
      FieldName = 'qBCProd'
      DisplayFormat = '0.0000'
    end
    object COFINSOutrosValorUnit: TFloatField
      FieldName = 'vAliqProd'
      DisplayFormat = '0.0000'
    end
    object COFINSOutrosValor: TFloatField
      FieldName = 'vCOFINS'
      DisplayFormat = '0.00'
    end
  end
  object PISAliquota: TClientDataSet
    Aggregates = <>
    DataSetField = PISPISAliquota
    Params = <>
    OnPostError = PostError
    Left = 824
    Top = 362
    object PISAliquotaCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
      MaxValue = 2
      MinValue = 1
    end
    object PISAliquotaValorBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object PISAliquotaAliquota: TFloatField
      FieldName = 'pPIS'
      DisplayFormat = '0.00'
    end
    object PISAliquotaValor: TFloatField
      FieldName = 'vPIS'
      DisplayFormat = '0.00'
    end
  end
  object PISQtde: TClientDataSet
    Aggregates = <>
    DataSetField = PISPISQtde
    Params = <>
    OnPostError = PostError
    Left = 824
    Top = 410
    object PISQtdeCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
      MaxValue = 3
      MinValue = 3
    end
    object PISQtdeVendido: TFloatField
      FieldName = 'qBCProd'
      DisplayFormat = '0.0000'
    end
    object PISQtdeValorUnit: TFloatField
      FieldName = 'vAliqProd'
      DisplayFormat = '0.0000'
    end
    object PISQtdeValor: TFloatField
      FieldName = 'vPIS'
      DisplayFormat = '0.00'
    end
  end
  object PISNaoTributado: TClientDataSet
    Aggregates = <>
    DataSetField = PISPISNaoTributado
    Params = <>
    OnPostError = PostError
    Left = 824
    Top = 458
    object PISNaoTributadoCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
      MaxValue = 9
      MinValue = 4
    end
  end
  object PISOutros: TClientDataSet
    Aggregates = <>
    DataSetField = PISPISOutros
    Params = <>
    OnPostError = PostError
    Left = 824
    Top = 506
    object PISOutrosCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
    end
    object PISOutrosBC: TFloatField
      Tag = 1
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object PISOutrosAliquota: TFloatField
      Tag = 1
      FieldName = 'pPIS'
      DisplayFormat = '0.00'
    end
    object PISOutrosQtdeVendida: TFloatField
      Tag = 2
      FieldName = 'qBCProd'
      DisplayFormat = '0.0000'
    end
    object PISOutrosValorUnit: TFloatField
      Tag = 2
      FieldName = 'vAliqProd'
      DisplayFormat = '0.0000'
    end
    object PISOutrosValor: TFloatField
      FieldName = 'vPIS'
      DisplayFormat = '0.00'
    end
  end
  object IPITributado: TClientDataSet
    Aggregates = <>
    DataSetField = IPIIPITributado
    Params = <>
    OnPostError = PostError
    Left = 690
    Top = 362
    object IPITributadoCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
      MaxValue = 99
    end
    object IPITributadoValorBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object IPITributadoQtdeUnidade: TFloatField
      Tag = 1
      FieldName = 'qUnid'
      DisplayFormat = '0.0000'
    end
    object IPITributadoValorUnidade: TFloatField
      Tag = 1
      FieldName = 'vUnid'
      DisplayFormat = '0.0000'
    end
    object IPITributadoAliquotaIPI: TFloatField
      Tag = 2
      FieldName = 'pIPI'
      DisplayFormat = '0.00'
    end
    object IPITributadoValorIPI: TFloatField
      Tag = 2
      FieldName = 'vIPI'
      DisplayFormat = '0.00'
    end
  end
  object IPINaoTributado: TClientDataSet
    Aggregates = <>
    DataSetField = IPIIPINaoTributado
    Params = <>
    OnPostError = PostError
    Left = 690
    Top = 410
    object IPINaoTributadoCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
      MaxValue = 55
      MinValue = 1
    end
  end
  object ICMSST: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMSST
    Params = <>
    Left = 561
    Top = 366
    object ICMSSTorig: TSmallintField
      FieldName = 'orig'
      MaxValue = 9
    end
    object ICMSSTCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
    end
    object ICMSSTvBCSTRet: TFloatField
      FieldName = 'vBCSTRet'
      DisplayFormat = '0.00'
    end
    object ICMSSTvICMSSTRet: TFloatField
      FieldName = 'vICMSSTRet'
      DisplayFormat = '0.00'
    end
    object ICMSSTvBCSTDest: TFloatField
      FieldName = 'vBCSTDest'
      DisplayFormat = '0.00'
    end
    object ICMSSTvICMSSTDest: TFloatField
      FieldName = 'vICMSSTDest'
      DisplayFormat = '0.00'
    end
  end
  object ICMSPart: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMSPart
    Params = <>
    Left = 613
    Top = 382
    object ICMSPartorig: TSmallintField
      FieldName = 'orig'
      MaxValue = 9
    end
    object ICMSPartCST: TSmallintField
      FieldName = 'CST'
      DisplayFormat = '00'
    end
    object ICMSPartmodBC: TSmallintField
      FieldName = 'modBC'
    end
    object ICMSPartvBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object ICMSPartpRedBC: TFloatField
      FieldName = 'pRedBC'
      DisplayFormat = '0.00'
    end
    object ICMSPartpICMS: TFloatField
      FieldName = 'pICMS'
      DisplayFormat = '0.00'
    end
    object ICMSPartvICMS: TFloatField
      FieldName = 'vICMS'
      DisplayFormat = '0.00'
    end
    object ICMSPartmodBCST: TSmallintField
      FieldName = 'modBCST'
    end
    object ICMSPartpMVAST: TFloatField
      FieldName = 'pMVAST'
      DisplayFormat = '0.00'
    end
    object ICMSPartpRedBCST: TFloatField
      FieldName = 'pRedBCST'
      DisplayFormat = '0.00'
    end
    object ICMSPartvBCST: TFloatField
      FieldName = 'vBCST'
      DisplayFormat = '0.00'
    end
    object ICMSPartpICMSST: TFloatField
      FieldName = 'pICMSST'
      DisplayFormat = '0.00'
    end
    object ICMSPartvICMSST: TFloatField
      FieldName = 'vICMSST'
      DisplayFormat = '0.00'
    end
    object ICMSPartpBCOp: TFloatField
      FieldName = 'pBCOp'
      DisplayFormat = '0.00'
    end
    object ICMSPartUFST: TStringField
      FieldName = 'UFST'
      Size = 2
    end
  end
  object ICMSSN101: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMSSN101
    Params = <>
    Left = 561
    Top = 412
    object ICMSSN101orig: TSmallintField
      FieldName = 'orig'
      DisplayFormat = '0'
      MaxValue = 9
    end
    object ICMSSN101CSOSN: TSmallintField
      FieldName = 'CSOSN'
      DisplayFormat = '000'
    end
    object ICMSSN101pCredSN: TFloatField
      FieldName = 'pCredSN'
      DisplayFormat = '0.00'
    end
    object ICMSSN101vCredICMSSN: TFloatField
      FieldName = 'vCredICMSSN'
      DisplayFormat = '0.00'
    end
  end
  object ICMSSN102: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMSSN102
    Params = <>
    Left = 613
    Top = 430
    object ICMSSN102orig: TSmallintField
      FieldName = 'orig'
      DisplayFormat = '0'
      MaxValue = 9
    end
    object ICMSSN102CSOSN: TSmallintField
      FieldName = 'CSOSN'
      DisplayFormat = '000'
    end
  end
  object ICMSSN201: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMSSN201
    Params = <>
    Left = 561
    Top = 457
    object ICMSSN201orig: TSmallintField
      FieldName = 'orig'
      DisplayFormat = '0'
      MaxValue = 9
    end
    object ICMSSN201CSOSN: TSmallintField
      FieldName = 'CSOSN'
      DisplayFormat = '000'
    end
    object ICMSSN201modBCST: TSmallintField
      FieldName = 'modBCST'
    end
    object ICMSSN201pMVAST: TFloatField
      FieldName = 'pMVAST'
      DisplayFormat = '0.00'
    end
    object ICMSSN201pRedBCST: TFloatField
      FieldName = 'pRedBCST'
      DisplayFormat = '0.00'
    end
    object ICMSSN201vBCST: TFloatField
      FieldName = 'vBCST'
      DisplayFormat = '0.00'
    end
    object ICMSSN201pICMSST: TFloatField
      FieldName = 'pICMSST'
      DisplayFormat = '0.00'
    end
    object ICMSSN201vICMSST: TFloatField
      FieldName = 'vICMSST'
      DisplayFormat = '0.00'
    end
    object ICMSSN201pCredSN: TFloatField
      FieldName = 'pCredSN'
      DisplayFormat = '0.00'
    end
    object ICMSSN201vCredICMSSN: TFloatField
      FieldName = 'vCredICMSSN'
      DisplayFormat = '0.00'
    end
  end
  object ICMSSN202: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMSSN202
    Params = <>
    Left = 613
    Top = 476
    object ICMSSN202orig: TSmallintField
      FieldName = 'orig'
      DisplayFormat = '0'
      MaxValue = 9
    end
    object ICMSSN202CSOSN: TSmallintField
      FieldName = 'CSOSN'
      DisplayFormat = '000'
    end
    object ICMSSN202modBCST: TSmallintField
      FieldName = 'modBCST'
    end
    object ICMSSN202pMVAST: TFloatField
      FieldName = 'pMVAST'
      DisplayFormat = '0.00'
    end
    object ICMSSN202pRedBCST: TFloatField
      FieldName = 'pRedBCST'
      DisplayFormat = '0.00'
    end
    object ICMSSN202vBCST: TFloatField
      FieldName = 'vBCST'
      DisplayFormat = '0.00'
    end
    object ICMSSN202pICMSST: TFloatField
      FieldName = 'pICMSST'
      DisplayFormat = '0.00'
    end
    object ICMSSN202vICMSST: TFloatField
      FieldName = 'vICMSST'
      DisplayFormat = '0.00'
    end
  end
  object ICMSSN500: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMSSN500
    Params = <>
    Left = 561
    Top = 503
    object ICMSSN500orig: TSmallintField
      FieldName = 'orig'
      DisplayFormat = '0'
      MaxValue = 9
    end
    object ICMSSN500CSOSN: TSmallintField
      FieldName = 'CSOSN'
      DisplayFormat = '000'
    end
    object ICMSSN500vBCSTRet: TFloatField
      FieldName = 'vBCSTRet'
      DisplayFormat = '0.00'
    end
    object ICMSSN500vICMSSTRet: TFloatField
      FieldName = 'vICMSSTRet'
      DisplayFormat = '0.00'
    end
  end
  object ICMSSN900: TClientDataSet
    Aggregates = <>
    DataSetField = ICMSICMSSN900
    Params = <>
    Left = 613
    Top = 521
    object ICMSSN900orig: TSmallintField
      FieldName = 'orig'
      DisplayFormat = '0'
      MaxValue = 9
    end
    object ICMSSN900CSOSN: TSmallintField
      FieldName = 'CSOSN'
      DisplayFormat = '000'
    end
    object ICMSSN900modBC: TFloatField
      FieldName = 'modBC'
    end
    object ICMSSN900vBC: TFloatField
      FieldName = 'vBC'
      DisplayFormat = '0.00'
    end
    object ICMSSN900pRedBC: TFloatField
      FieldName = 'pRedBC'
      DisplayFormat = '0.00'
    end
    object ICMSSN900pICMS: TFloatField
      FieldName = 'pICMS'
      DisplayFormat = '0.00'
    end
    object ICMSSN900vICMS: TFloatField
      FieldName = 'vICMS'
      DisplayFormat = '0.00'
    end
    object ICMSSN900modBCST: TFloatField
      FieldName = 'modBCST'
    end
    object ICMSSN900pMVAST: TFloatField
      FieldName = 'pMVAST'
      DisplayFormat = '0.00'
    end
    object ICMSSN900pRedBCST: TFloatField
      FieldName = 'pRedBCST'
      DisplayFormat = '0.00'
    end
    object ICMSSN900vBCST: TFloatField
      FieldName = 'vBCST'
      DisplayFormat = '0.00'
    end
    object ICMSSN900pICMSST: TFloatField
      FieldName = 'pICMSST'
      DisplayFormat = '0.00'
    end
    object ICMSSN900vICMSST: TFloatField
      FieldName = 'vICMSST'
      DisplayFormat = '0.00'
    end
    object ICMSSN900pCredSN: TFloatField
      FieldName = 'pCredSN'
      DisplayFormat = '0.00'
    end
    object ICMSSN900vCredICMSSN: TFloatField
      FieldName = 'vCredICMSSN'
      DisplayFormat = '0.00'
    end
  end
  object refNFP: TClientDataSet
    Aggregates = <>
    DataSetField = Identificacao_NFrefrefNFP
    Params = <>
    OnPostError = PostError
    Left = 45
    Top = 147
    object refNFPcUF: TIntegerField
      FieldName = 'cUF'
    end
    object refNFPAAMM: TStringField
      FieldName = 'AAMM'
      Size = 4
    end
    object refNFPCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object refNFPCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object refNFPIE: TStringField
      FieldName = 'IE'
      Size = 14
    end
    object refNFPmod: TStringField
      FieldName = 'mod'
      Size = 2
    end
    object refNFPserie: TSmallintField
      FieldName = 'serie'
    end
    object refNFPnNF: TIntegerField
      FieldName = 'nNF'
    end
  end
  object refECF: TClientDataSet
    Aggregates = <>
    DataSetField = Identificacao_NFrefrefECF
    Params = <>
    OnPostError = PostError
    Left = 91
    Top = 147
    object refECFmod: TStringField
      FieldName = 'mod'
      Size = 2
    end
    object refECFnECF: TSmallintField
      FieldName = 'nECF'
      MaxValue = 999
    end
    object refECFnCOO: TIntegerField
      FieldName = 'nCOO'
      MaxValue = 999999
    end
  end
  object infProt: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 5
    object infProtId: TStringField
      FieldName = 'Id'
      Size = 17
    end
    object infProttpAmb: TIntegerField
      FieldName = 'tpAmb'
    end
    object infProtverAplic: TStringField
      FieldName = 'verAplic'
    end
    object infProtchNFe: TStringField
      FieldName = 'chNFe'
      Size = 44
    end
    object infProtdhRecbto: TDateTimeField
      FieldName = 'dhRecbto'
    end
    object infProtnProt: TStringField
      FieldName = 'nProt'
      Size = 15
    end
    object infProtdigVal: TStringField
      FieldName = 'digVal'
      Size = 18
    end
    object infProtcStat: TIntegerField
      FieldName = 'cStat'
    end
    object infProtxMotivo: TStringField
      FieldName = 'xMotivo'
      Size = 255
    end
  end
  object autXML: TClientDataSet
    Aggregates = <>
    DataSetField = infNFeautXML
    Params = <>
    OnPostError = PostError
    Left = 438
    Top = 23
    object autXMLCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object autXMLCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
  end
  object Export: TClientDataSet
    Aggregates = <>
    DataSetField = ProdutodetExport
    Params = <>
    Left = 60
    Top = 305
    object ExportnDraw: TStringField
      FieldName = 'nDraw'
      Size = 11
    end
    object ExportexportInd: TDataSetField
      FieldName = 'exportInd'
    end
  end
  object exportInd: TClientDataSet
    Aggregates = <>
    DataSetField = ExportexportInd
    Params = <>
    Left = 65
    Top = 355
    object exportIndnRE: TStringField
      FieldName = 'nRE'
      Size = 12
    end
    object exportIndchNFe: TStringField
      FieldName = 'chNFe'
      Size = 44
    end
    object exportIndqExport: TFloatField
      FieldName = 'qExport'
      DisplayFormat = '0.0000'
    end
  end
  object Pag: TClientDataSet
    Aggregates = <>
    DataSetField = infNFepag
    Params = <>
    Left = 485
    Top = 25
    object PagtPag: TIntegerField
      FieldName = 'tPag'
    end
    object PagvPag: TFloatField
      FieldName = 'vPag'
      DisplayFormat = '0.00'
    end
    object Pagcard: TDataSetField
      FieldName = 'card'
    end
  end
  object Cartoes: TClientDataSet
    Aggregates = <>
    DataSetField = Pagcard
    Params = <>
    Left = 485
    Top = 75
    object CartoesCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CartoestBand: TIntegerField
      FieldName = 'tBand'
    end
    object CartoescAut: TStringField
      FieldName = 'cAut'
    end
  end
  object ICMSUFDest: TClientDataSet
    Aggregates = <>
    DataSetField = ImpostosICMSUFDest
    Params = <>
    Left = 1034
    Top = 315
    object ICMSUFDestvBCUFDest: TFloatField
      FieldName = 'vBCUFDest'
      DisplayFormat = '0.00'
    end
    object ICMSUFDestpFCPUFDest: TFloatField
      FieldName = 'pFCPUFDest'
      DisplayFormat = '0.00'
    end
    object ICMSUFDestpICMSUFDest: TFloatField
      FieldName = 'pICMSUFDest'
      DisplayFormat = '0.00'
    end
    object ICMSUFDestpICMSInter: TFloatField
      FieldName = 'pICMSInter'
      DisplayFormat = '0.00'
    end
    object ICMSUFDestpICMSInterPart: TFloatField
      FieldName = 'pICMSInterPart'
      DisplayFormat = '0.00'
    end
    object ICMSUFDestvFCPUFDest: TFloatField
      FieldName = 'vFCPUFDest'
      DisplayFormat = '0.00'
    end
    object ICMSUFDestvICMSUFDest: TFloatField
      FieldName = 'vICMSUFDest'
      DisplayFormat = '0.00'
    end
    object ICMSUFDestvICMSUFRemet: TFloatField
      FieldName = 'vICMSUFRemet'
      DisplayFormat = '0.00'
    end
  end
  object Encerrante: TClientDataSet
    Aggregates = <>
    DataSetField = Combustivelencerrante
    Params = <>
    Left = 293
    Top = 404
    object EncerrantenBico: TIntegerField
      FieldName = 'nBico'
    end
    object EncerrantenBomba: TIntegerField
      FieldName = 'nBomba'
    end
    object EncerrantenTanque: TIntegerField
      FieldName = 'nTanque'
    end
    object EncerrantevEncIni: TFloatField
      FieldName = 'vEncIni'
      DisplayFormat = '0.000'
    end
    object EncerrantevEncFin: TFloatField
      FieldName = 'vEncFin'
      DisplayFormat = '0.000'
    end
  end
end
