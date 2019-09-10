unit UdtmCDSToXMLNFe;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Tc.Data.DB.Helpers, DBClient {, SPEDConfig} ;

type
  TdtmCDSToXMLNFe = class(TDataModule)
    infNFe: TClientDataSet;
    Identificacao: TClientDataSet;
    Emitente: TClientDataSet;
    Avulsa: TClientDataSet;
    Destinatario: TClientDataSet;
    Retirada: TClientDataSet;
    Identificacao_NFref: TClientDataSet;
    Produto: TClientDataSet;
    Detalhe: TClientDataSet;
    Impostos: TClientDataSet;
    IdentificacaoUF: TIntegerField;
    IdentificacaoCodigoNFe: TIntegerField;
    IdentificacaoNatOp: TStringField;
    IdentificacaoFormaPagto: TSmallintField;
    IdentificacaoModelo: TStringField;
    IdentificacaoSerie: TSmallintField;
    IdentificacaoDocumento: TIntegerField;
    IdentificacaoEmissao: TDateTimeField;
    IdentificacaoDataSaidaEntrada: TDateTimeField;
    IdentificacaodEmi: TDateField;  //deprecated ;
    IdentificacaodSaiEnt: TDateField;  //deprecated ;
    IdentificacaoTipoNF: TSmallintField;
    IdentificacaoCodigoMuncipioGerador: TIntegerField;
    Identificacao_NFReferenciadas: TDataSetField;
    IdentificacaoFormatoImpressao: TSmallintField;
    IdentificacaoFormaEmissao: TSmallintField;
    IdentificacaoDV: TSmallintField;
    IdentificacaoAmbiente: TSmallintField;
    IdentificacaoFinalidade: TSmallintField;
    IdentificacaoProcessoEmissao: TSmallintField;
    IdentificacaoVersaoEmissor: TStringField;
    Identificacao_NFrefrefNFe: TStringField;
    Identificacao_NFrefrefNF: TDataSetField;
    refNF: TClientDataSet;
    EmitenteCNPJ: TStringField;
    EmitenteRazao: TStringField;
    EmitenteFantasia: TStringField;
    Emitente_Endereco: TDataSetField;
    EmitenteIE: TStringField;
    EmitenteIEST: TStringField;
    EmitenteIM: TStringField;
    EmitenteCNAE: TStringField;
    EnderecoEmitente: TClientDataSet;
    EnderecoEmitente_Logradouro: TStringField;
    EnderecoEmitente_Numero: TStringField;
    EnderecoEmitente_xComplemento: TStringField;
    EnderecoEmitente_Bairro: TStringField;
    EnderecoEmitente_CodigoMunicipio: TIntegerField;
    EnderecoEmitente_NomeMun: TStringField;
    EnderecoEmitente_UF: TStringField;
    EnderecoEmitente_CEP: TStringField;
    EnderecoEmitente_CodigoPais: TSmallintField;
    EnderecoEmitente_NomePais: TStringField;
    EnderecoEmitente_Fone: TStringField;
    AvulsaCNPJ: TStringField;
    AvulsaOrgao: TStringField;
    AvulsaMatriculaAgente: TStringField;
    AvulsaNomeAgente: TStringField;
    AvulsaFone: TStringField;
    AvulsaUF: TStringField;
    AvulsaDAR: TStringField;
    AvulsaEmissao: TDateField;
    AvulsaValorDAR: TFloatField;
    AvulsaReparticaoEmitente: TStringField;
    AvulsaDataPagamento: TDateField;
    Destinatario_Endereco: TClientDataSet;
    Destinatario_EnderecoLogradouro: TStringField;
    Destinatario_EnderecoNumero: TStringField;
    Destinatario_EnderecoComplemento: TStringField;
    Destinatario_EnderecoBairro: TStringField;
    Destinatario_EnderecoCodigoMunicipio: TIntegerField;
    Destinatario_EnderecoNomeMunicipio: TStringField;
    Destinatario_EnderecoUF: TStringField;
    Destinatario_EnderecoCEP: TStringField;
    Destinatario_EnderecoCodigoPais: TSmallintField;
    Destinatario_EnderecoNomePais: TStringField;
    Destinatario_EnderecoFone: TStringField;
    DestinatarioCNPJ: TStringField;
    DestinatarioNome: TStringField;
    DestinatarioEndereco: TDataSetField;
    DestinatarioIE: TStringField;
    DestinatarioSUFRAMA: TStringField;
    RetiradaCNPJ: TStringField;
    RetiradaLogradouro: TStringField;
    RetiradaNumero: TStringField;
    RetiradaComplemento: TStringField;
    RetiradaBairro: TStringField;
    RetiradaCodigoMunicipio: TStringField;
    RetiradaNomeMunicipio: TStringField;
    RetiradaUF: TStringField;
    Entrega: TClientDataSet;
    EntregaCNPJ: TStringField;
    EntregaLogradouro: TStringField;
    EntregaNumero: TStringField;
    EntregaComplemento: TStringField;
    EntregaBairro: TStringField;
    EntregaCodigoMunicipio: TStringField;
    EntregaNomeMunicipio: TStringField;
    EntregaUF: TStringField;
    TotaisNF: TClientDataSet;
    NF_Icms: TClientDataSet;
    NF_Issqn: TClientDataSet;
    NF_Retencao: TClientDataSet;
    Tranporte: TClientDataSet;
    Cobranca: TClientDataSet;
    DadosAdicionais: TClientDataSet;
    exporta: TClientDataSet;
    compra: TClientDataSet;
    Transportadora: TClientDataSet;
    retTransp: TClientDataSet;
    veicTransp: TClientDataSet;
    reboque: TClientDataSet;
    vol: TClientDataSet;
    Fatura: TClientDataSet;
    Duplicata: TClientDataSet;
    ObsContribuinte: TClientDataSet;
    ObsFisco: TClientDataSet;
    ProcessoReferenciado: TClientDataSet;
    compraxNEmp: TStringField;
    compraxPed: TStringField;
    compraxCont: TStringField;
    exportaUFEmbarq: TStringField;
    exportaxLocEmbarq: TStringField;
    exportaUFSaidaPais: TStringField;
    exportaxLocExporta: TStringField;
    exportaxLocDespacho: TStringField;
    ProcessoReferenciadoNumero: TStringField;
    ProcessoReferenciadoOrigem: TSmallintField;
    ObsFiscoCampo: TStringField;
    ObsFiscoTexto: TStringField;
    ObsContribuinteTexto: TStringField;
    ObsContribuinteCampo: TStringField;
    DadosAdicionaisFisco: TStringField;
    DadosAdicionaisInfComplementar: TStringField;
    DadosAdicionaisobsCont: TDataSetField;
    DadosAdicionaisobsFisco: TDataSetField;
    DadosAdicionaisprocRef: TDataSetField;
    DuplicataNumero: TStringField;
    DuplicataVencimento: TDateField;
    DuplicataValor: TFloatField;
    FaturaNumero: TStringField;
    FaturaValorOriginal: TFloatField;
    FaturaValorDesconto: TFloatField;
    FaturaValorLiquido: TFloatField;
    CobrancaFatura: TDataSetField;
    CobrancaDuplicata: TDataSetField;
    volqVol: TIntegerField;
    volesp: TStringField;
    volmarca: TStringField;
    volnVol: TStringField;
    volpesoL: TFloatField;
    volpesoB: TFloatField;
    vollacres: TDataSetField;
    lacres: TClientDataSet;
    lacresnLacre: TStringField;
    reboqueplaca: TStringField;
    reboqueUF: TStringField;
    reboqueRNTC: TStringField;
    veicTranspplaca: TStringField;
    veicTranspUF: TStringField;
    veicTranspRNTC: TStringField;
    retTranspvServ: TFloatField;
    retTranspvBCRet: TFloatField;
    retTranspvICMSRet: TFloatField;
    retTranspCFOP: TStringField;
    retTransppICMSRet: TFloatField;
    retTranspcMunFG: TStringField;
    TransportadoraxNome: TStringField;
    TransportadoraIE: TStringField;
    TransportadoraxEnder: TStringField;
    TransportadoraxMun: TStringField;
    TransportadoraCNPJ: TStringField;
    TransportadoraUF: TStringField;
    Tranporte_modFrete: TSmallintField;
    Tranporte_Transportadora: TDataSetField;
    Tranporteret_Transp: TDataSetField;
    Tranporte_veicTransp: TDataSetField;
    Tranporte_reboque: TDataSetField;
    Tranporte_vol: TDataSetField;
    NF_RetencaoValorPIS: TFloatField;
    NF_RetencaoValorCOFINS: TFloatField;
    NF_RetencaoValorCSLL: TFloatField;
    NF_RetencaoValorBCIRRF: TFloatField;
    NF_RetencaoValorIRRF: TFloatField;
    NF_RetencaovBCRetPrev: TFloatField;
    NF_RetencaoValorPrev: TFloatField;
    NF_IssqnValorServico: TFloatField;
    NF_IssqnBC: TFloatField;
    NF_IssqnValorISS: TFloatField;
    NF_IssqnValorPIS: TFloatField;
    NF_IssqnValorCOFINS: TFloatField;
    NF_IcmsBC: TFloatField;
    NF_IcmsValorICMS: TFloatField;
    NF_IcmsBCST: TFloatField;
    NF_IcmsST: TFloatField;
    NF_IcmsValorProduto: TFloatField;
    NF_IcmsValorFrete: TFloatField;
    NF_IcmsValorSeguro: TFloatField;
    NF_IcmsValorDesconto: TFloatField;
    NF_IcmsValorII: TFloatField;
    NF_IcmsValorIPI: TFloatField;
    NF_IcmsValorPIS: TFloatField;
    NF_IcmsValorCOFINS: TFloatField;
    NF_IcmsValorOutros: TFloatField;
    NF_IcmsValorNF: TFloatField;
    NF_IcmsvFCPUFDest: TFloatField;
    NF_IcmsvICMSUFDest: TFloatField;
    NF_IcmsvICMSUFRemet: TFloatField;
    TotaisNF_ICMS: TDataSetField;
    TotaisNF_ISSQN: TDataSetField;
    TotaisNF_Retencao: TDataSetField;
    ProdutoCodigo: TStringField;
    ProdutocEAN: TStringField;
    ProdutoNome: TStringField;
    ProdutoNCM: TStringField;
    ProdutoCEST: TStringField;
    ProdutoExTIPI: TStringField;
    ProdutoGenero: TSmallintField;
    ProdutoCFOP: TStringField;
    ProdutoUnidComercial: TStringField;
    ProdutoEANTributavel: TStringField;
    ProdutoQtdeComercial: TFloatField;
    ProdutoValorUnitarioComercial: TFloatField;
    ProdutoValorBruto: TFloatField;
    ProdutoUnidTributavel: TStringField;
    ProdutoQtdeTributavel: TFloatField;
    ProdutoValorUnitarioTributavel: TFloatField;
    ProdutoValorSeguro: TFloatField;
    ProdutoValorFrete: TFloatField;
    ProdutoValorDesconto: TFloatField;
    ProdutoDI: TDataSetField;
    DI: TClientDataSet;
    DIDocumento: TStringField;
    DIDataRegistro: TDateField;
    DILocalDesembaraco: TStringField;
    DIUFDesembaraco: TStringField;
    DIDataDesembaraco: TDateField;
    DICodigoExportador: TStringField;
    DIadi: TDataSetField;
    DIAdicao: TClientDataSet;
    DIAdicaoNumero: TSmallintField;
    DIAdicaoSequencialItem: TSmallintField;
    DIAdicaoCodigoFabricante: TStringField;
    DIAdicaoDecontoItem: TFloatField;
    Veiculo: TClientDataSet;
    Medicamento: TClientDataSet;
    Armamento: TClientDataSet;
    ProdutoveicProd: TDataSetField;
    Produtomed: TDataSetField;
    Produtoarma: TDataSetField;
    VeiculoTipoOperacao: TSmallintField;
    VeiculoChassi: TStringField;
    VeiculoCodigoCor: TStringField;
    VeiculoDescricaoCor: TStringField;
    VeiculoPotencia: TStringField;
    VeiculoCM3: TStringField;
    VeiculoPesoLiquido: TStringField;
    VeiculoPesoBruto: TStringField;
    VeiculoSerie: TStringField;
    VeiculoTipoCombustivel: TStringField;
    VeiculoNumeroMotor: TStringField;
    VeiculoCMKG: TStringField;
    VeiculoEntreEixos: TStringField;
    VeiculoAnoModelo: TSmallintField;
    VeiculoAnoFabricacao: TSmallintField;
    VeiculoRENAVAM: TIntegerField;
    VeiculoTipoPintura: TStringField;
    VeiculoEspecie: TSmallintField;
    VeiculoTipo: TSmallintField;
    VeiculoVIN: TStringField;
    VeiculoCondicao: TSmallintField;
    VeiculoCodigoModelo: TIntegerField;
    MedicamentoNumeroLote: TStringField;
    MedicamentoQtdeLote: TFloatField;
    MedicamentoDataFabricacao: TDateField;
    MedicamentoValidade: TDateField;
    MedicamentoPMC: TFloatField;
    ArmamentoTipo: TSmallintField;
    ArmamentoDescricao: TStringField;
    Combustivel: TClientDataSet;
    CIDE: TClientDataSet;
    ICMSComb: TClientDataSet;
    ICMSInter: TClientDataSet;
    ICMSCons: TClientDataSet;
    CombustivelCIDE: TDataSetField;
    CombustivelICMSComb: TDataSetField;
    CombustivelICMSInter: TDataSetField;
    CombustivelICMSCons: TDataSetField;
    Produtocomb: TDataSetField;
    CIDEqBCProd: TFloatField;
    CIDEvAliqProd: TFloatField;
    CIDEvCIDE: TFloatField;
    ICMSCombvBCICMS: TFloatField;
    ICMSCombvICMS: TFloatField;
    ICMSCombvBCICMSST: TFloatField;
    ICMSCombvICMSST: TFloatField;
    ICMSIntervBCICMSSTDest: TFloatField;
    ICMSIntervICMSSTDest: TFloatField;
    ICMSConsvBCICMSSTCons: TFloatField;
    ICMSConsvICMSSTCons: TFloatField;
    ICMSConsUFCons: TStringField;
    CombustivelcProdANP: TIntegerField;
    CombustivelCODIF: TStringField;
    CombustivelqTemp: TFloatField;
    ICMS: TClientDataSet;
    II: TClientDataSet;
    IPI: TClientDataSet;
    PIS: TClientDataSet;
    PISST: TClientDataSet;
    COFINS: TClientDataSet;
    ImpostosICMS: TDataSetField;
    ImpostosIPI: TDataSetField;
    ImpostosII: TDataSetField;
    ImpostosPIS: TDataSetField;
    ImpostosPISST: TDataSetField;
    ImpostosCOFINS: TDataSetField;
    ImpostosCOFINSST: TDataSetField;
    ImpostosISSQN: TDataSetField;
    ImpostosICMSUFDest: TDataSetField;
    ImpostosTotTrib: TFloatField;
    COFINSST: TClientDataSet;
    ISSQN: TClientDataSet;
    ICMS00: TClientDataSet;
    ICMS10: TClientDataSet;
    ICMS20: TClientDataSet;
    ICMS30: TClientDataSet;
    ICMS40: TClientDataSet;
    ICMS51: TClientDataSet;
    ICMS60: TClientDataSet;
    ICMS70: TClientDataSet;
    ICMS90: TClientDataSet;
    ICMSUFDest: TClientDataSet;
    ICMS00Origem: TSmallintField;
    ICMS00CST: TSmallintField;
    ICMS00ModalidadeBC: TSmallintField;
    ICMS00ValorBC: TFloatField;
    ICMS00AliquotaICMS: TFloatField;
    ICMS00ValorICMS: TFloatField;
    ICMS10Origem: TSmallintField;
    ICMS10CST: TIntegerField;
    ICMS10ModalidadeBC: TSmallintField;
    ICMS10ValorBC: TFloatField;
    ICMS10AliquotaICMS: TFloatField;
    ICMS10ValorICMS: TFloatField;
    ICMS10ModalidadeBCST: TSmallintField;
    ICMS10APercentMVAST: TFloatField;
    ICMS10PercentReducaoBCST: TFloatField;
    ICMS10ValorBCST: TFloatField;
    ICMS10AliquotaICMSST: TFloatField;
    ICMS10ValorICMSST: TFloatField;
    ICMS20Origem: TSmallintField;
    ICMS20CST: TSmallintField;
    ICMS20ModalidadeBC: TSmallintField;
    ICMS20PercetReducaoBC: TFloatField;
    ICMS20ValorBC: TFloatField;
    ICMS20AliquotaICMS: TFloatField;
    ICMS20ValorICMS: TFloatField;
    ICMS30Origem: TSmallintField;
    ICMS30CST: TSmallintField;
    ICMS30ModalidadeBCST: TSmallintField;
    ICMS30PercentMVAST: TFloatField;
    ICMS30PercentReducaoBCST: TFloatField;
    ICMS30ValorBCST: TFloatField;
    ICMS30AliquiotaICMSST: TFloatField;
    ICMS30ValorICMSST: TFloatField;
    ICMS40Origem: TSmallintField;
    ICMS40CST: TSmallintField;
    ICMS51Origem: TSmallintField;
    ICMS51CST: TSmallintField;
    ICMS51ModalidadeBC: TSmallintField;
    ICMS51PercentReducaoBC: TFloatField;
    ICMS51ValorBC: TFloatField;
    ICMS51AliquotaICMS: TFloatField;
    ICMS51ValorICMS: TFloatField;
    ICMS51vICMSOp: TFloatField;
    ICMS51pDif: TFloatField;
    ICMS51vICMSDif: TFloatField;
    ICMS60Origem: TSmallintField;
    ICMS60CST: TSmallintField;
    ICMS60ValorBCST: TFloatField;
    ICMS60ValorICMSST: TFloatField;
    ICMS70Origem: TSmallintField;
    ICMS70CST: TSmallintField;
    ICMS70ModalidadeBC: TSmallintField;
    ICMS70PercentReducaoBC: TFloatField;
    ICMS70ValorBC: TFloatField;
    ICMS70AliquotaICMS: TFloatField;
    ICMS70ValorICMS: TFloatField;
    ICMS70ModalidadeBCST: TSmallintField;
    ICMS70PercentMVAST: TFloatField;
    ICMS70PercentReducaoBCST: TFloatField;
    ICMS70ValorBCST: TFloatField;
    ICMS70AliquotaICMSST: TFloatField;
    ICMS70ValorICMSST: TFloatField;
    ICMS90Origem: TSmallintField;
    ICMS90CST: TSmallintField;
    ICMS90ModalidadeBC: TSmallintField;
    ICMS90ValorBC: TFloatField;
    ICMS90PercentReducaoBC: TFloatField;
    ICMS90AliquotaICMS: TFloatField;
    ICMS90ValorICMS: TFloatField;
    ICMS90ModalidadeBCST: TSmallintField;
    ICMS90PercentMVAST: TFloatField;
    ICMS90PercentReducaoBCST: TFloatField;
    ICMS90ValorBCST: TFloatField;
    ICMS90PercentICMSST: TFloatField;
    ICMS90ValorICMSST: TFloatField;
    ICMSICMS00: TDataSetField;
    ICMSICMS10: TDataSetField;
    ICMSICMS20: TDataSetField;
    ICMSICMS30: TDataSetField;
    ICMSICMS40: TDataSetField;
    ICMSICMS51: TDataSetField;
    ICMSICMS60: TDataSetField;
    ICMSICMS70: TDataSetField;
    ICMSICMS90: TDataSetField;
    COFINSAliquota: TClientDataSet;
    COFINSQtde: TClientDataSet;
    COFINSNaoTributado: TClientDataSet;
    COFINSOutros: TClientDataSet;
    COFINSAliquotaCST: TSmallintField;
    COFINSAliquotaBC: TFloatField;
    COFINSAliquotaAliquota: TFloatField;
    COFINSAliquotaValor: TFloatField;
    COFINSQtdeCST: TSmallintField;
    COFINSQtdeVendido: TFloatField;
    COFINSQtdeValorUnit: TFloatField;
    COFINSQtdeValor: TFloatField;
    COFINSNaoTributadoCST: TSmallintField;
    COFINSOutrosCST: TSmallintField;
    COFINSOutrosQtdeVendida: TFloatField;
    COFINSOutrosValorUnit: TFloatField;
    COFINSOutrosBC: TFloatField;
    COFINSOutrosAliquota: TFloatField;
    COFINSOutrosValor: TFloatField;
    COFINSCOFINSAliquota: TDataSetField;
    COFINSCOFINSQtde: TDataSetField;
    COFINSCOFINSNaoTributado: TDataSetField;
    COFINSCOFINSOutr: TDataSetField;
    COFINSSTBC: TFloatField;
    COFINSSTAliquota: TFloatField;
    COFINSSTQtdeVendido: TFloatField;
    COFINSSTValorUnit: TFloatField;
    COFINSSTValor: TFloatField;
    ICMSUFDestvBCUFDest: TFloatField;
    ICMSUFDestpICMSUFDest: TFloatField;
    ICMSUFDestpICMSInter: TFloatField;
    ICMSUFDestpICMSInterPart: TFloatField;
    ICMSUFDestvICMSUFDest: TFloatField;
    ICMSUFDestvICMSUFRemet: TFloatField;
    ICMSUFDestpFCPUFDest: TFloatField;
    ICMSUFDestvFCPUFDest: TFloatField;
    ISSQNBC: TFloatField;
    ISSQNAliquota: TFloatField;
    ISSQNValor: TFloatField;
    ISSQNCodigoMunicipio: TIntegerField;
    ISSQNCodigoServico: TSmallintField;
    PISSTBC: TFloatField;
    PISSTAliquota: TFloatField;
    PISSTQtdeVendida: TFloatField;
    PISSTValorUnit: TFloatField;
    PISSTValor: TFloatField;
    PISAliquota: TClientDataSet;
    PISQtde: TClientDataSet;
    PISNaoTributado: TClientDataSet;
    PISOutros: TClientDataSet;
    PISAliquotaCST: TSmallintField;
    PISAliquotaValorBC: TFloatField;
    PISAliquotaAliquota: TFloatField;
    PISAliquotaValor: TFloatField;
    PISQtdeCST: TSmallintField;
    PISQtdeVendido: TFloatField;
    PISQtdeValorUnit: TFloatField;
    PISQtdeValor: TFloatField;
    PISNaoTributadoCST: TSmallintField;
    PISOutrosCST: TSmallintField;
    PISOutrosBC: TFloatField;
    PISOutrosAliquota: TFloatField;
    PISOutrosQtdeVendida: TFloatField;
    PISOutrosValorUnit: TFloatField;
    PISOutrosValor: TFloatField;
    IPIClasseEnquadramento: TStringField;
    IPICNPJProdutor: TStringField;
    IPIQtdeSelo: TStringField;
    IPIqSelo: TIntegerField;
    IPICodigoEnquadramento: TStringField;
    IPIIPITributado: TDataSetField;
    IPIIPINaoTributado: TDataSetField;
    IPITributado: TClientDataSet;
    IPINaoTributado: TClientDataSet;
    IPINaoTributadoCST: TSmallintField;
    IPITributadoCST: TSmallintField;
    IPITributadoValorBC: TFloatField;
    IPITributadoAliquotaIPI: TFloatField;
    IPITributadoQtdeUnidade: TFloatField;
    IPITributadoValorUnidade: TFloatField;
    IPITributadoValorIPI: TFloatField;
    PISPISAliquota: TDataSetField;
    PISPISQtde: TDataSetField;
    PISPISNaoTributado: TDataSetField;
    PISPISOutros: TDataSetField;
    IIValorBC: TFloatField;
    IIDespesasAduaneiras: TFloatField;
    IIValor: TFloatField;
    IIValorIOF: TFloatField;
    infNFeide: TDataSetField;
    infNFeemit: TDataSetField;
    infNFeavulsa: TDataSetField;
    infNFedest: TDataSetField;
    infNFeretirada: TDataSetField;
    infNFeentrega: TDataSetField;
    infNFedet: TDataSetField;
    infNFetotal: TDataSetField;
    infNFetransp: TDataSetField;
    infNFecobr: TDataSetField;
    infNFeDadosAdicionais: TDataSetField;
    infNFecompra: TDataSetField;
    infNFeexporta: TDataSetField;
    Detalheprod: TDataSetField;
    Detalheimposto: TDataSetField;
    DetalheinfAdProd: TStringField;
    EmitenteCPF: TStringField;
    TransportadoraCPF: TStringField;
    DestinatarioCPF: TStringField;
    refNFAAMM: TStringField;
    refNFCNPJ: TStringField;
    refNFmod: TStringField;
    refNFcUF: TIntegerField;
    refNFserie: TSmallintField;
    refNFnNF: TIntegerField;
    EmitenteCRT: TIntegerField;
    ProdutoValorOutros: TFloatField;
    ProdutoIncideTotal: TSmallintField;
    ICMSICMSPart: TDataSetField;
    ICMSICMSST: TDataSetField;
    ICMSICMSSN101: TDataSetField;
    ICMSICMSSN102: TDataSetField;
    ICMSICMSSN201: TDataSetField;
    ICMSICMSSN202: TDataSetField;
    ICMSICMSSN500: TDataSetField;
    ICMSICMSSN900: TDataSetField;
    ICMSST: TClientDataSet;
    ICMSSTorig: TSmallintField;
    ICMSSTCST: TSmallintField;
    ICMSSTvBCSTRet: TFloatField;
    ICMSSTvICMSSTRet: TFloatField;
    ICMSSTvBCSTDest: TFloatField;
    ICMSSTvICMSSTDest: TFloatField;
    ICMSPart: TClientDataSet;
    ICMSPartorig: TSmallintField;
    ICMSPartCST: TSmallintField;
    ICMSPartmodBC: TSmallintField;
    ICMSPartvBC: TFloatField;
    ICMSPartpRedBC: TFloatField;
    ICMSPartpICMS: TFloatField;
    ICMSPartvICMS: TFloatField;
    ICMSPartmodBCST: TSmallintField;
    ICMSPartpMVAST: TFloatField;
    ICMSPartpRedBCST: TFloatField;
    ICMSPartvBCST: TFloatField;
    ICMSPartpICMSST: TFloatField;
    ICMSPartvICMSST: TFloatField;
    ICMSPartpBCOp: TFloatField;
    ICMSPartUFST: TStringField;
    ICMSSN101: TClientDataSet;
    ICMSSN101orig: TSmallintField;
    ICMSSN101CSOSN: TSmallintField;
    ICMSSN101pCredSN: TFloatField;
    ICMSSN101vCredICMSSN: TFloatField;
    ICMSSN102: TClientDataSet;
    ICMSSN102orig: TSmallintField;
    ICMSSN102CSOSN: TSmallintField;
    ICMSSN201: TClientDataSet;
    ICMSSN201orig: TSmallintField;
    ICMSSN201CSOSN: TSmallintField;
    ICMSSN201modBCST: TSmallintField;
    ICMSSN201pMVAST: TFloatField;
    ICMSSN201pRedBCST: TFloatField;
    ICMSSN201vBCST: TFloatField;
    ICMSSN201pICMSST: TFloatField;
    ICMSSN201vICMSST: TFloatField;
    ICMSSN201pCredSN: TFloatField;
    ICMSSN201vCredICMSSN: TFloatField;
    ICMSSN202: TClientDataSet;
    ICMSSN202orig: TSmallintField;
    ICMSSN202CSOSN: TSmallintField;
    ICMSSN202modBCST: TSmallintField;
    ICMSSN202pMVAST: TFloatField;
    ICMSSN202pRedBCST: TFloatField;
    ICMSSN202vBCST: TFloatField;
    ICMSSN202pICMSST: TFloatField;
    ICMSSN202vICMSST: TFloatField;
    ICMSSN500: TClientDataSet;
    ICMSSN500orig: TSmallintField;
    ICMSSN500CSOSN: TSmallintField;
    ICMSSN500vBCSTRet: TFloatField;
    ICMSSN500vICMSSTRet: TFloatField;
    ICMSSN900: TClientDataSet;
    ICMSSN900orig: TSmallintField;
    ICMSSN900CSOSN: TSmallintField;
    ICMSSN900modBC: TFloatField;
    ICMSSN900vBC: TFloatField;
    ICMSSN900pRedBC: TFloatField;
    ICMSSN900pICMS: TFloatField;
    ICMSSN900vICMS: TFloatField;
    ICMSSN900modBCST: TFloatField;
    ICMSSN900pMVAST: TFloatField;
    ICMSSN900pRedBCST: TFloatField;
    ICMSSN900vBCST: TFloatField;
    ICMSSN900pICMSST: TFloatField;
    ICMSSN900vICMSST: TFloatField;
    ICMSSN900pCredSN: TFloatField;
    ICMSSN900vCredICMSSN: TFloatField;
    Identificacao_NFrefrefNFP: TDataSetField;
    Identificacao_NFrefrefCTe: TStringField;
    Identificacao_NFrefrefECF: TDataSetField;
    refNFP: TClientDataSet;
    refNFPcUF: TIntegerField;
    refNFPAAMM: TStringField;
    refNFPCNPJ: TStringField;
    refNFPCPF: TStringField;
    refNFPIE: TStringField;
    refNFPmod: TStringField;
    refNFPserie: TSmallintField;
    refNFPnNF: TIntegerField;
    refECF: TClientDataSet;
    refECFmod: TStringField;
    refECFnECF: TSmallintField;
    refECFnCOO: TIntegerField;
    IdentificacaoDataHoraContingencia: TDateTimeField;
    IdentificacaoJustificaContingencia: TStringField;
    DestinatarioEmail: TStringField;
    RetiradaCPF: TStringField;
    EntregaCPF: TStringField;
    ProdutoNumeroPedido: TStringField;
    ProdutonItemPedidoCompra: TIntegerField;
    Veiculocilin: TStringField;
    ISSQNSituacaoTributaria: TStringField;
    infProt: TClientDataSet;
    infProtId: TStringField;
    infProttpAmb: TIntegerField;
    infProtverAplic: TStringField;
    infProtchNFe: TStringField;
    infProtdhRecbto: TDateTimeField;
    infProtnProt: TStringField;
    infProtdigVal: TStringField;
    infProtcStat: TIntegerField;
    infProtxMotivo: TStringField;
    CombustivelUFCons: TStringField;
    NF_IcmsTotTrib: TFloatField;
    ProdutoFCI: TStringField;
    IdentificacaoDestino: TIntegerField;
    IdentificacaoConsumidorFinal: TIntegerField;
    IdentificacaoPresenca: TIntegerField;
    DestinatarioEstrangeiro: TStringField;
    DestinatarioContribuinte: TIntegerField;
    DestinatarioIM: TStringField;
    autXML: TClientDataSet;
    autXMLCNPJ: TStringField;
    autXMLCPF: TStringField;
    infNFeautXML: TDataSetField;
    DItpViaTransp: TIntegerField;
    DIvAFRMM: TFloatField;
    DItpIntermedio: TIntegerField;
    DICNPJ: TStringField;
    DIUFTerceiro: TStringField;
    Export: TClientDataSet;
    ExportnDraw: TStringField;
    ProdutodetExport: TDataSetField;
    exportInd: TClientDataSet;
    exportIndnRE: TStringField;
    exportIndchNFe: TStringField;
    exportIndqExport: TFloatField;
    ExportexportInd: TDataSetField;
    ArmamentoSerie: TStringField;
    ArmamentoCano: TStringField;
    CombustivelMixGN: TFloatField;
    ProdutoRECOPI: TStringField;
    IdentificacaohSaiEnt: TTimeField;
    ICMS20vICMSDeson: TFloatField;
    ICMS20motDesICMS: TIntegerField;
    ICMS30vICMSDeson: TFloatField;
    ICMS30motDesICMS: TIntegerField;
    ICMS40vICMSDeson: TFloatField;
    ICMS40motDesICMS: TIntegerField;
    ICMS70vICMSDeson: TFloatField;
    ICMS70motDesICMS: TIntegerField;
    ICMS90vICMSDeson: TFloatField;
    ICMS90motDesICMS: TIntegerField;
    ISSQNvDeducao: TFloatField;
    ISSQNvOutro: TFloatField;
    ISSQNvDescIncond: TFloatField;
    ISSQNvDescCond: TFloatField;
    ISSQNvISSRet: TFloatField;
    ISSQNindISS: TIntegerField;
    ISSQNcServico: TStringField;
    ISSQNcMun: TStringField;
    ISSQNcPais: TIntegerField;
    ISSQNnProcesso: TStringField;
    ISSQNindincentivo: TIntegerField;
    NF_IcmsICMSDeson: TFloatField;
    NF_IssqndCompet: TDateField;
    NF_IssqnvDeducao: TFloatField;
    NF_IssqnvOutro: TFloatField;
    NF_IssqnvDescIncond: TFloatField;
    NF_IssqnvDescCond: TFloatField;
    NF_IssqnvISSRet: TFloatField;
    NF_IssqncRegTrib: TIntegerField;
    Pag: TClientDataSet;
    infNFepag: TDataSetField;
    PagtPag: TIntegerField;
    PagvPag: TFloatField;
    Cartoes: TClientDataSet;
    Pagcard: TDataSetField;
    CartoesCNPJ: TStringField;
    CartoestBand: TIntegerField;
    CartoescAut: TStringField;
    Encerrante: TClientDataSet;
    EncerrantenBico: TIntegerField;
    EncerrantenBomba: TIntegerField;
    EncerrantenTanque: TIntegerField;
    EncerrantevEncIni: TFloatField;
    EncerrantevEncFin: TFloatField;
    Combustivelencerrante: TDataSetField;
    DetalhenItem: TSmallintField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
//    FConfig: ISPEDCfg;
    FErrMsg: string;
    FLog: TStringList;
    { Private declarations }
    procedure GetXML ;
    procedure GenerateXML ( DS : TClientDataSet ; sl : TStrings  ; AttribCount : integer = 0 );
    function GetDSTag ( DS: TClientDataSet ; TagName : string  ; var AttribCont : integer ) : string ;
    function GetChaveAcesso: String;
    procedure InitAutoCalcDV  ;
    procedure AutoCalcDV (Sender: TField);
  public
    { Public declarations }
    property Log : TStringList read FLog ;
    procedure SaveXML ;
    procedure XMLToCDSNFe ( AFileName : string ) ;
    procedure XMLStringToCDSNFe ( AXMLString : string ) ;
  published
//    property NfeConfig : ISPEDCfg read FConfig write FConfig ;
    property ChaveAcesso: String  read GetChaveAcesso ;
    property ErrMsg : string  read FErrMsg ;
  end;

implementation

uses {SPEDFileSys, SPEDFileSysTypes,} SPEDUtil, StrUtils, XMLIntf, XMLDoc, Variants ;

{$R *.dfm}


procedure TdtmCDSToXMLNFe.DataModuleCreate(Sender: TObject);
begin
   // FConfig := TSPEDCfg.Create ( cfgNFe ) ;
   //EmitenteCRT.Required := FConfig.IsVersion2 ;
   //ProdutoIncideTotal.Required := FConfig.IsVersion2 ;
   if {FConfig.IsVersion2} True then
     begin
      IdentificacaoCodigoNFe.DisplayFormat := '00000000' ;
     end
   else
     begin
         ICMS60ValorBCST.FieldName := 'vBCST' ;
         ICMS60ValorICMSST.FieldName := 'vICMSST' ;
     end ;
   infNFe.CreateDataSet ;
   infNFe.LogChanges := False ;
   infProt.CreateDataSet ;
   infProt.LogChanges := False ;
   InitAutoCalcDV ;
end;

procedure TdtmCDSToXMLNFe.DataModuleDestroy(Sender: TObject);
begin
  try
     infNFe.Close // nao sei o pq ... mas esta dando erro no close !
  except
  end ;
  try
     infProt.Close // nao sei o pq ... mas esta dando erro no close !
  except
  end ;
end;


procedure TdtmCDSToXMLNFe.GetXML ;
var
  sl : TStringList ;
begin
  sl := TStringList.Create ;
  sl.BeginUpdate ;
  sl.Clear ;
  sl.Add( '<?xml version="1.0" encoding="UTF-8"?>' ) ;
  sl.Add( '<NFe xmlns="http://www.portalfiscal.inf.br/nfe">' ) ;
  if {NfeConfig.IsVersion3} True then  // NFe 2.0
     sl.Add( format ( '<infNFe Id="NFe%s" versao="3.10">', [ ChaveAcesso ]  ) )
  else if {NfeConfig.IsVersion2} True then  // NFe 2.0
     sl.Add( format ( '<infNFe Id="NFe%s" versao="2.00">', [ ChaveAcesso ]  ) )
  else
     sl.Add( format ( '<infNFe Id="NFe%s" versao="1.10">', [ ChaveAcesso ]  ) ) ;
  GenerateXML( infNFe, sl );
  sl.Add( format ( '</%s>', [ 'infNFe' ] ) ) ;
  sl.Add( format ( '</%s>', [ 'NFe' ] ) ) ;
  sl.EndUpdate ;
//  TSPEDFS.Save ( FConfig, ChaveAcesso, sl.Text, fstToSign ) ;
  sl.free ;
end;

procedure TdtmCDSToXMLNFe.GenerateXML(DS: TClientDataSet ; sl : TStrings ; AttribCount : integer = 0 );
var
  x: integer ;
  NestedDS : TClientDataSet ;

  procedure ProcessNestedDS ;
  var
    LocalAttribCont : integer ;
  begin
       NestedDS := TClientDataSet ( TDataSetField ( DS.Fields[ x ] ).NestedDataSet ) ;
       if not NestedDS.IsEmpty then
          begin
            NestedDS.First;
            While not NestedDS.EOF do
              begin
                LocalAttribCont := 0 ;
                sl.Add( GetDSTag ( NestedDS, DS.Fields[ x ].FieldName, LocalAttribCont ) ) ;
                GenerateXML( NestedDS, sl, LocalAttribCont ) ;
                sl.Add( format ( '</%s>', [ DS.Fields[ x ].FieldName ] ) ) ;
                NestedDS.Next;
              end ;
          end;
  end ;

  procedure AddTag ;
  begin
    with DS.Fields[ x ] do
       begin
          if (Text = '')  // Se o campo está vazio, não adicona a TAG
            and (    (Pos( ';' +  FieldName +';', ';cEAN;cEANTrib;IE;CNPJ;' ) = 0)
                  or ((Pos( ';' +  FieldName +';', ';CNPJ;'     ) > 0) and (DS = Destinatario ) and (Destinatario_EnderecoUF.AsString <> 'EX'))
                  or ((Pos( ';' +  FieldName +';', ';idEstrangeiro;' ) > 0) and (DestinatarioEstrangeiro.isNull))
                  or ((Pos( ';' +  FieldName +';', ';IE;CNPJ;'  ) > 0) )//and (DS <> Destinatario ))
//                  or ((Pos( ';' +  FieldName +';', ';CNPJ;CPF;' ) > 0) and (DS <> Retirada ))
//                  or ((Pos( ';' +  FieldName +';', ';CNPJ;CPF;' ) > 0) and (DS <> Entrega))
                )
                then
            exit ;

          if (DS.Fields[ x ] is TDateTimeField) and not( (DS.Fields[ x ] is TDateField) or (DS.Fields[ x ] is TTimeField)) then
            sl.Add( format ( '<%s>%s</%0:s>', [ FieldName, FormatDateTime( 'yyyy-mm-dd''T''hh:nn:ss' {+ NfeConfig.TimeZone}, AsDateTime ) ]  ) )
          else if (DS.Fields[ x ] is TDateField ) then
            sl.Add( format ( '<%s>%s</%0:s>', [ FieldName, FormatDateTime( 'yyyy-mm-dd', AsDateTime ) ]  ) )
          else if (DS.Fields[ x ] is TTimeField) then
            sl.Add( format ( '<%s>%s</%0:s>', [ FieldName, FormatDateTime( 'hh:nn:ss', AsDateTime ) ]  ) )
          else if (DS.Fields[ x ] is TFloatField ) then
            sl.Add( format ( '<%s>%s</%0:s>', [ FieldName, StringReplace( Text, ',', '.', [rfReplaceAll] ) ]  ) )
          else
            sl.Add( format ( '<%s>%s</%0:s>', [ FieldName, SPEDUtils.RemoveSpecialChars( Text ) ]  ) ) ;
      end ;
  end ;

begin
    for x := 0 to DS.FieldCount - 1 do
       if DS.Fields[ x ] is TDataSetField then
          ProcessNestedDS
       else
         AddTag ;
end;

function TdtmCDSToXMLNFe.GetDSTag( DS: TClientDataSet ; TagName: string; var AttribCont : integer ) : string ;
var
  LDetItem : String ;
begin
   if TagName  = 'det' then
     begin
        AttribCont := 1 ;
        if DS.Fields[ 0 ].IsNull then
          LDetItem := IntToStr( DS.RecNo )
        else
          LDetItem := DS.Fields[ 0 ].Text ;

        Result := format ( '<%s %s="%s">', [ TagName, DS.Fields[ 0 ].FieldName, LDetItem ] )
        //Result := format ( '<%s nItem="%d">', [ TagName, DS.RecNo ] )
     end
   else if ( DS = ObsContribuinte ) or ( DS = ObsFisco ) then
     begin
        AttribCont := 1 ;
        Result := format ( '<%s %s="%s">', [ TagName, DS.Fields[ 0 ].FieldName, DS.Fields[ 0 ].Text ] )
     end
   else
     Result := format ( '<%s>', [ TagName ] )

   (* -- nova versao com suporte a leitura do CDS v195
   if TagName  = 'infNFe' then // deve incluir o campo Id e Version e ignorar os mesmos
      AttribCont := 2
   else if TagName  = 'det' then // deve incluir o campo nItem em detalhes e ignorar o mesmo
     begin
        AttribCont := 1 ;
        Result := format ( '<%s nItem="%d">', [ TagName, DS.RecNo ] )
     end
   else if ( DS = ObsContribuinte ) or ( DS = ObsFisco ) then
     begin
        AttribCont := 1 ;
        Result := format ( '<%s %s="%s">', [ TagName, DS.Fields[ 0 ].FieldName, DS.Fields[ 0 ].Text ] )
     end
   else
     Result := format ( '<%s>', [ TagName ] )

   *)
end;

function TdtmCDSToXMLNFe.GetChaveAcesso: String;
begin
  if {NfeConfig.IsVersion2} True then // NFe 2.0
     Result := Format ( '%2.2d%s%s%2.2d%3.3d%9.9d%1.1d%8.8d',
                    [
                       IdentificacaoUF.AsInteger,
                       FormatDateTime('YYMM', IdentificacaoEmissao.asDateTime ),
                       EmitenteCNPJ.asString,
                       StrToIntDef ( IdentificacaoModelo.asString, 0 ),
                       IdentificacaoSerie.AsInteger,
                       IdentificacaoDocumento.asInteger,
                       IdentificacaoFormaEmissao.asInteger,
                       IdentificacaoCodigoNFe.asInteger ] )
  else
     Result := Format ( '%2.2d%s%s%2.2d%3.3d%9.9d%9.9d',
                    [
                       IdentificacaoUF.AsInteger,
                       FormatDateTime('YYMM', IdentificacaoEmissao.asDateTime ),
                       EmitenteCNPJ.asString,
                       StrToIntDef ( IdentificacaoModelo.asString, 0 ),
                       IdentificacaoSerie.AsInteger,
                       IdentificacaoDocumento.asInteger,
                       IdentificacaoCodigoNFe.asInteger ] ) ;

  Result := Result + SPEDUtils.Modulo11( Result );

end;

procedure TdtmCDSToXMLNFe.SaveXML ;
begin
  with infNFe do
    begin
      first ;
      while not eof do
        begin
           GetXML ;
           next ;
        end ;
    end ;
end;


type
   TXMLToCDSNFe = class
   private
     FNodeIndex : integer ;
     FNodeName : string ;
     FDataSet : TDataSet ;
     FXML : IXMLDocument ;
     FFormatSettings: TFormatSettings;
     FLog: TStringList;
     function  GetNestedDS( ADataSet : TDataSet ;  AField : string ) : TDataSet ;
     procedure NodeToDataSet ( XmlNode: IXMLNode; ActiveCDS : TDataSet );
     procedure NodeToField ( AXMLNodeField : IXMLNode ; AField : TField );
     procedure ExecuteImport ;
   public
     property Log : TStringList  read FLog ;
     class function LoadFromFile(AFileName: string ) : IXMLDocument ;
     class function LoadFromXML( const AXML : string ) : IXMLDocument ;
     constructor Create ( AXML : IXMLDocument ; ANodeName : string ; ANodeIndex : integer ; ADataSet : TDataSet ) ;
   end;


procedure TXMLToCDSNFe.ExecuteImport ;
var
 IterateXMLNodes: Integer;
 LNode: IXMLNode;
begin
  if FXML.DocumentElement.NodeName = FNodeName then
     LNode := FXML.DocumentElement.ChildNodes[FNodeIndex]
  else
     LNode := FXML.DocumentElement.ChildNodes[FNodeIndex].ChildNodes[0];

  FDataSet.Append ;
  NodeToDataSet( LNode, FDataSet );
  FDataSet.Post ;
end;


class function TXMLToCDSNFe.LoadFromFile(AFileName: string): IXMLDocument ;
begin

   try
     Result :=  TXMLDocument.create ( nil ) ;
     Result.LoadFromFile( AFileName );
     Result.Active := True;
   except
     raise ;
   end ;
end;


class function TXMLToCDSNFe.LoadFromXML( const AXML : string) : IXMLDocument ;
var
  LPosAmpersand : integer ;
  LXML : string ;
begin

   try
     Result :=  TXMLDocument.create ( nil ) ;
     LXML := AXML ;//.Replace ( '></qrCode>', '</qrCode>', [rfReplaceAll] ) ;
     LXML := LXML.Replace ( '&amp;', '&',     [rfReplaceAll] ) ;
     LXML := LXML.Replace (  '&',    '&amp;', [rfReplaceAll] ) ;

     //LPosAmpersand := pos ( '&', LXML ) ;
     //if ( LPosAmpersand > 0 ) and (Pos ( '&amp;', LXML ) <> LPosAmpersand) then
     //  Result.LoadFromXML( LXML.Replace ( '&', '&amp;', [rfReplaceAll] ) )
     //else
       Result.LoadFromXML( LXML );
     Result.Active := True;
   except On E : Exception do
     raise Exception.Create( 'TXMLToCDSNFe.LoadFromXML -->>>' + ' ' + E.Message );
   end ;
end;

function TXMLToCDSNFe.GetNestedDS( ADataSet : TDataSet ;  AField : string ) : TDataSet ;
var
  x : integer ;
  F : TObject ;
begin
   Result := nil ;
   F := ADataSet.FieldList.Find ( AField ) ;
   if Assigned ( F ) and ( F is TDataSetField ) then
     Result :=  TDataSetField ( F ).NestedDataSet
//   else
//     Raise Exception.CreateFmt ( 'Tag not found : %s %s ', [ ADataSet.Name, AField ] ) ;

end;

procedure TXMLToCDSNFe.NodeToField ( AXMLNodeField : IXMLNode ; AField : TField );
begin
   try

     FLog.Add ( AField.DataSet.Name + '.' + AField.Name + ' := ' +   AXMLNodeField.NodeName ) ;

    if (AField is TDateField ) then
      AField.AsDateTime := StrToDateTime( Copy(AXMLNodeField.NodeValue, 1, 10), FFormatSettings )
    else if (AField is TTimeField) then
      AField.AsDateTime := StrToTime( AXMLNodeField.NodeValue, FFormatSettings )
    else if (AField is TDateTimeField) then
      AField.AsDateTime := StrToDateTime( Copy(AXMLNodeField.NodeValue, 1, 10) + ' ' + Copy(AXMLNodeField.NodeValue, 12, 8), FFormatSettings )
    else if (AField is TFloatField) then
      AField.AsFloat := StrToFloat( AXMLNodeField.NodeValue, FFormatSettings )
    else
      AField.asString := AXMLNodeField.NodeValue ;

   except On E : Exception do
     begin
      raise Exception.Create(AXMLNodeField.NodeName + ' ' + e.Message);
     end;
   end;


end;


constructor TXMLToCDSNFe.Create ( AXML : IXMLDocument ; ANodeName : string ; ANodeIndex : integer ; ADataSet : TDataSet  ) ;
begin
  FLog := TStringList.Create ;

  FFormatSettings.DateSeparator := '-';
  FFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  FFormatSettings.DecimalSeparator := '.';
  FFormatSettings.TimeSeparator := ':';
  FFormatSettings.ShortTimeFormat := 'HH:mm:ss';
  FXML       := AXML ;
  FNodeName  := ANodeName ;
  FNodeIndex := ANodeIndex ;
  FDataSet   := ADataSet ;
  ExecuteImport ;
end;

procedure TXMLToCDSNFe.NodeToDataSet ( XmlNode: IXMLNode; ActiveCDS : TDataSet );
var
  IterateXMLNodes : Integer;
  IterateFields : Integer;
  LChildNode : IXMLNode;
  NestedDataSet : TDataSet ;
  LField : TField ;
begin

  // skip text nodes and other special cases
  if not (XmlNode.NodeType = ntElement) then
    Exit;

  // Retira o required dos campos
  for IterateFields := 0 to ActiveCDS.FieldCount - 1 do
    begin
      ActiveCDS.Fields[IterateFields].Required := False;
      //ActiveCDS.Fields[IterateFields].OnValidate := nil;
    end;

   if ActiveCDS.Name = 'Emitente' then
    ActiveCDS.FieldByName('CRT').AsInteger := 1;

//   if ( ActiveCDS.Name = 'DadosAdicionais' )
//    and ( TdtmCDSToXMLNFe( ActiveCDS.Owner ).IdentificacaoDocumento.asInteger = 140579 ) then
//     asm int 3 end ;


  // add attributes
  FLog.Add ( xmlNode.NodeName + ' checking attr...' ) ;
  with xmlNode.AttributeNodes do
    for IterateXMLNodes := 0 to Count - 1 do
      begin
        LField := ActiveCDS.FieldList.Find( Nodes[ IterateXMLNodes ].NodeName ) ;
        if Assigned ( LField ) then
          NodeToField ( Nodes[ IterateXMLNodes ], LField ) ;
      end;

  try

  // add each child node
  FLog.Add ( xmlNode.NodeName + ' checking childs...' ) ;
  if XmlNode.HasChildNodes then
    with xmlNode.ChildNodes do
      for IterateXMLNodes := 0 to Count - 1 do
        begin
          LChildNode := Nodes [ IterateXMLNodes ] ;
          if ( LChildNode.HasChildNodes ) and ( not LChildNode.IsTextElement ) then
             begin
                 NestedDataSet := GetNestedDS( ActiveCDS, LChildNode.NodeName ) ;
                 if Assigned ( NestedDataSet ) then
                   begin
                     FLog.Add ( xmlNode.NodeName + ' nested...' ) ;
                     NestedDataSet.Append ;
                     NodeToDataSet ( LChildNode, NestedDataSet ) ;
                     NestedDataSet.Post ;
                   end
             end
          else if not VarIsNull ( LChildNode.NodeValue ) then
            begin
              LField := ActiveCDS.FindField( LChildNode.NodeName ) ;
              if Assigned ( LField ) then
                NodeToField ( LChildNode, LField ) ;
            end;
        end
  except On E : Exception do
     begin
      raise Exception.Create(LChildNode.NodeName + ' ' + ActiveCDS.Name  + ' '  +e.Message);
     end;

  end;
end;




procedure TdtmCDSToXMLNFe.XMLStringToCDSNFe(AXMLString: string);
begin
  with TXMLToCDSNFe.Create( TXMLToCDSNFe.LoadFromXML(AXMLString), 'NFe', 0, infNFe  ) do
   try
     self.FLog := Log ;
   finally
    Free ;
   end;
end;


procedure TdtmCDSToXMLNFe.XMLToCDSNFe(AFileName: string);
begin
  TXMLToCDSNFe.Create( TXMLToCDSNFe.LoadFromFile(AFileName), 'NFe', 0, infNFe  ).Free ;
end;


procedure TdtmCDSToXMLNFe.AutoCalcDV(Sender: TField) ;
var
  NeedPost : boolean ;
begin
  if not ( Identificacao.State in [dsInsert,dsEdit] ) then
     begin
        NeedPost := True ;
        Identificacao.Edit ;
     end
  else
    NeedPost := False ;

  // calcular com 8 digitos para 2.0

  IdentificacaoDV.asString := Copy ( ChaveAcesso, 44, 1 ) ;

  if NeedPost then
     Identificacao.Post ;

end;

procedure TdtmCDSToXMLNFe.InitAutoCalcDV;
begin
   IdentificacaoUF.OnValidate            := AutoCalcDV ;
   IdentificacaoEmissao.OnValidate       := AutoCalcDV ;
   EmitenteCNPJ.OnValidate               := AutoCalcDV ;
   IdentificacaoModelo.OnValidate        := AutoCalcDV ;
   IdentificacaoSerie.OnValidate         := AutoCalcDV ;
   IdentificacaoDocumento.OnValidate     := AutoCalcDV ;
   IdentificacaoCodigoNFe.OnValidate     := AutoCalcDV ;
   // Nfe 2.0
   IdentificacaoFormaEmissao.OnValidate  := AutoCalcDV ;
end;

procedure TdtmCDSToXMLNFe.PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  x: integer ;
begin
  Action := daFail ;

  FErrMsg := 'DataSet : ' + DataSet.Name ;
  with DataSet do
    for x := 0 to FieldCount - 1 do
      if not ( Fields[ x ] is TDataSetField ) then
        try
          FErrMsg := FErrMsg + Fields[ x ].Name + ' - ' + Fields[ x ].FieldName + ifThen( Fields[ x ].Required, '(r)', '' ) + ' = ' + Fields[ x ].Value + #13#10 ;
        except
          FErrMsg := FErrMsg + Fields[ x ].Name + ' - ' + Fields[ x ].FieldName + ifThen( Fields[ x ].Required, '(r)', '' ) + ' = (erro ao recuperar valor)'  ;
        end ;
end;

end.

