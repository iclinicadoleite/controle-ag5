unit UdtmDEVOLUCOES_Pedido3;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  UdtmSYS_BASEDBListEdit, VCL.Dialogs,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, Variants, Math
  , System.Generics.Collections, Tc.Data.SQLExpr ;


type

  IRequiredFields = interface
     ['{2725C675-CF8F-4E1E-90D4-5FF2D7A1E8E5}']
     procedure Add ( const AField : TField ) ;
     function Required( const ARequired : boolean ) : IRequiredFields ;
  end;

  TDataSetHelper = class helper for TDataSet
     function RequiredFields : IRequiredFields ; overload ;
  end ;

  TIterateFunction<T> = reference to function ( const AValue : T ) : boolean ;

  IIterate<TItem> = interface
    ['{994F5EEF-82E4-4B78-BF42-A6E3EF93BF1F}']
    procedure Iterate ( IterateFunction : TIterateFunction<TItem> ) ;
  end;

  TFieldsHelper = class helper for TFields
  private
    procedure Iterate(  AIterateFunction : TIterateFunction<TField> ) ;
  private
  end ;


  TFieldsList = class ( TList<TField> ) ;
  TRequitedListHelper = class helper for TFieldsList
    procedure Iterate(  AIterateFunction : TIterateFunction<TField> ) ;
  end ;

  TRequiredFields = class ( TInterfacedObject, IRequiredFields )
  private
     FAutoReset : boolean ;
     FRequiredList : TFieldsList ;
     procedure Add ( const AField : TField ) ;
     function Required( const ARequired : boolean ) : IRequiredFields ;
  public
    constructor Create ;
    destructor Destroy ; override ;
    class function New : IRequiredFields ;
  end;

  TRateioEventType = (retMenor, retMaior ) ;
  TRateioEvent = procedure ( ARateioEventType : TRateioEventType; APercent: double) of object ;

  TdtmDEVOLUCOES_Pedido = class(T_dtmBASEDBListEdit)
    cdsDevolucoes: TClientDataSet;
    cdsDevolucao: TClientDataSet;
    dtsList: TDataSource;
    cdsItensPedido: TClientDataSet;
    cdsItensPedidoKDEV_PEDIDO_ITEM: TStringField;
    cdsItensPedidoKDEV_PEDIDO: TStringField;
    cdsItensPedidoKEST_PRODUTO: TStringField;
    cdsItensPedidoCODIGO: TStringField;
    cdsItensPedidoNOME: TStringField;
    cdsItensPedidoQTDE: TFloatField;
    cdsItensPedidoTOTAL: TFloatField;
    cdsItensPedidoCUSTO: TFloatField;
    cdsItensPedidoOBS: TMemoField;
    cdsItensPedidoSomaTotal: TAggregateField;
    cdsStatusPedido: TClientDataSet;
    cdsStatusPedidoTIPO: TStringField;
    cdsStatusPedidoVALOR: TStringField;
    cdsStatusPedidoDESCRICAO: TStringField;
    cdsDadosEntidade: TClientDataSet;
    dtsPedido: TDataSource;
    cdsDadosEntidadeKCAD_ENTIDADE: TStringField;
    cdsDadosEntidadeDADOSENTIDADE: TStringField;
    cdsItensPedidoTmpCalc: TStringField;
    cdsItensPedidoDETALHES: TMemoField;
    cdsDadosProduto: TClientDataSet;
    cdsItensPedidoUNIDADE: TStringField;
    cdsDadosEntidadeEMAIL: TStringField;
    cdsDadosEntidadeFONE: TStringField;
    cdsAReceber: TClientDataSet;
    cdsAReceberKFIN_ARECEBER: TStringField;
    cdsAReceberTABLENAME: TStringField;
    cdsAReceberTABLEKEY: TStringField;
    cdsAReceberKCAD_ENTIDADE: TStringField;
    cdsAReceberNOMEENTIDADE: TStringField;
    cdsAReceberHISTORICO: TStringField;
    cdsAReceberDOCUMENTO: TStringField;
    cdsAReceberDATALANCTO: TSQLTimeStampField;
    cdsAReceberKFIN_CONTA_PREF: TStringField;
    cdsAReceberKFIN_PLANOCONTA: TStringField;
    cdsAReceberOBS: TMemoField;
    cdsARecebersqlParcelas: TDataSetField;
    cdsAReceberStatusCadastro: TStringField;
    cdsParcelas: TClientDataSet;
    cdsParcelasKFIN_ARECEBER_PARCELA: TStringField;
    cdsParcelasKFIN_ARECEBER: TStringField;
    cdsParcelasDOCUMENTO: TStringField;
    cdsParcelasVENCTO: TSQLTimeStampField;
    cdsParcelasVALOR: TFloatField;
    cdsParcelasPAGTO: TSQLTimeStampField;
    cdsParcelasPAGO: TFloatField;
    cdsParcelasKFIN_CONTA: TStringField;
    cdsParcelasPREVISAO: TStringField;
    cdsParcelasDUVIDOSO: TStringField;
    cdsParcelasOBS: TMemoField;
    cdsAReceberATIVO: TStringField;
    cdsParcelasSomaValor: TAggregateField;
    dspDevolucoes: TDataSetProvider;
    dspDevolucao: TDataSetProvider;
    sqlDevolucoes: TTcSQLDataSet;
    sqlDevolucao: TTcSQLDataSet;
    sqlItensPedido: TTcSQLDataSet;
    sqlItensPedidoKDEV_PEDIDO_ITEM: TStringField;
    sqlItensPedidoKDEV_PEDIDO: TStringField;
    sqlItensPedidoKEST_PRODUTO: TStringField;
    sqlItensPedidoCODIGO: TStringField;
    sqlItensPedidoNOME: TStringField;
    sqlItensPedidoUNIDADE: TStringField;
    sqlItensPedidoCUSTO: TFloatField;
    sqlItensPedidoDETALHES: TMemoField;
    sqlItensPedidoQTDE: TFloatField;
    sqlItensPedidoTOTAL: TFloatField;
    sqlItensPedidoOBS: TMemoField;
    dtsSQLEdit: TDataSource;
    sqlDadosEntidade: TTcSQLDataSet;
    sqlDadosEntidadeKCAD_ENTIDADE: TStringField;
    sqlDadosEntidadeDADOSENTIDADE: TStringField;
    sqlDadosEntidadeEMAIL: TStringField;
    sqlDadosEntidadeFONE: TStringField;
    dspDadosEntidade: TDataSetProvider;
    sqlDadosProduto: TTcSQLDataSet;
    dspDadosProduto: TDataSetProvider;
    sqlAreceber: TTcSQLDataSet;
    sqlAreceberKFIN_ARECEBER: TStringField;
    sqlAreceberATIVO: TStringField;
    sqlAreceberTABLENAME: TStringField;
    sqlAreceberTABLEKEY: TStringField;
    sqlAreceberKCAD_ENTIDADE: TStringField;
    sqlAreceberNOMEENTIDADE: TStringField;
    sqlAreceberHISTORICO: TStringField;
    sqlAreceberDOCUMENTO: TStringField;
    sqlAreceberDATALANCTO: TSQLTimeStampField;
    sqlAreceberKFIN_CONTA_PREF: TStringField;
    sqlAreceberKFIN_PLANOCONTA: TStringField;
    sqlAreceberOBS: TMemoField;
    sqlParcelas: TTcSQLDataSet;
    sqlParcelasKFIN_ARECEBER_PARCELA: TStringField;
    sqlParcelasKFIN_ARECEBER: TStringField;
    sqlParcelasDOCUMENTO: TStringField;
    sqlParcelasVENCTO: TSQLTimeStampField;
    sqlParcelasVALOR: TFloatField;
    sqlParcelasPAGTO: TSQLTimeStampField;
    sqlParcelasPAGO: TFloatField;
    sqlParcelasKFIN_CONTA: TStringField;
    sqlParcelasPREVISAO: TStringField;
    sqlParcelasDUVIDOSO: TStringField;
    sqlParcelasOBS: TMemoField;
    dtsSQLAReceber: TDataSource;
    sqlDevolucoesKDEV_PEDIDO: TStringField;
    sqlDevolucoesNOTA_FISCAL: TStringField;
    sqlDevolucoesSERIE: TStringField;
    sqlDevolucoesDATA_EMISSAO: TSQLTimeStampField;
    sqlDevolucoesDATA_ENTRADA: TSQLTimeStampField;
    sqlDevolucoesIMPOSTOS: TFloatField;
    sqlDevolucoesDESCONTOS: TFloatField;
    sqlDevolucoesFRETE: TFloatField;
    sqlDevolucoesTOTAL_NOTA: TFloatField;
    sqlDevolucoesOBS: TMemoField;
    cdsDevolucoesKDEV_PEDIDO: TStringField;
    cdsDevolucoesNOTA_FISCAL: TStringField;
    cdsDevolucoesSERIE: TStringField;
    cdsDevolucoesDATA_EMISSAO: TSQLTimeStampField;
    cdsDevolucoesDATA_ENTRADA: TSQLTimeStampField;
    cdsDevolucoesIMPOSTOS: TFloatField;
    cdsDevolucoesDESCONTOS: TFloatField;
    cdsDevolucoesFRETE: TFloatField;
    cdsDevolucoesTOTAL_NOTA: TFloatField;
    cdsDevolucoesOBS: TMemoField;
    cdsDevolucaoKDEV_PEDIDO: TStringField;
    cdsDevolucaoKCAD_ENTIDADE: TStringField;
    cdsDevolucaoNOTA_FISCAL: TStringField;
    cdsDevolucaoSERIE: TStringField;
    cdsDevolucaoDATA_EMISSAO: TSQLTimeStampField;
    cdsDevolucaoDATA_COMPRA: TSQLTimeStampField;
    cdsDevolucaoDATA_ENTRADA: TSQLTimeStampField;
    cdsDevolucaoIMPOSTOS: TFloatField;
    cdsDevolucaoDESCONTOS: TFloatField;
    cdsDevolucaoFRETE: TFloatField;
    cdsDevolucaoKFIN_ARECEBER: TStringField;
    cdsDevolucaoTOTAL_ITENS: TFloatField;
    cdsDevolucaoTOTAL_NOTA: TFloatField;
    cdsDevolucaoOBS: TMemoField;
    cdsDevolucaosqlAReceber: TDataSetField;
    cdsDevolucaosqlItensPedido: TDataSetField;
    sqlDevolucaoKDEV_PEDIDO: TStringField;
    sqlDevolucaoKSYSDOMAIN: TStringField;
    sqlDevolucaoKCAD_ENTIDADE: TStringField;
    sqlDevolucaoNOTA_FISCAL: TStringField;
    sqlDevolucaoSERIE: TStringField;
    sqlDevolucaoDATA_EMISSAO: TSQLTimeStampField;
    sqlDevolucaoDATA_COMPRA: TSQLTimeStampField;
    sqlDevolucaoDATA_ENTRADA: TSQLTimeStampField;
    sqlDevolucaoIMPOSTOS: TFloatField;
    sqlDevolucaoDESCONTOS: TFloatField;
    sqlDevolucaoFRETE: TFloatField;
    sqlDevolucaoKFIN_ARECEBER: TStringField;
    sqlDevolucaoTOTAL_ITENS: TFloatField;
    sqlDevolucaoTOTAL_NOTA: TFloatField;
    sqlDevolucaoOBS: TMemoField;
    cdsDevolucaoKSYSDOMAIN: TStringField;
    sqlDevolucaoATIVO: TStringField;
    cdsDevolucaoATIVO: TStringField;
    sqlDadosProdutoDESCRICAO: TMemoField;
    sqlDadosProdutoOBS: TMemoField;
    cdsDadosProdutoDESCRICAO: TMemoField;
    cdsDadosProdutoOBS: TMemoField;
    sqlDevolucoesKSYSDOMAIN: TStringField;
    cdsDevolucoesKSYSDOMAIN: TStringField;
    cdsApropriacaoItem: TClientDataSet;
    cdsApropriacaoItemKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoItemKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoItemCODIGO: TIntegerField;
    cdsApropriacaoItemCLASSIFICACAO: TStringField;
    cdsApropriacaoItemNOME: TStringField;
    cdsApropriacaoItemPORCENTAGEM: TFloatField;
    cdsApropriacaoItemTOTAL_PORCENTAGEM: TAggregateField;
    sqlApropriacaoItem: TTcSQLDataSet;
    sqlApropriacaoItemKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoItemKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoItemCODIGO: TIntegerField;
    sqlApropriacaoItemCLASSIFICACAO: TStringField;
    sqlApropriacaoItemNOME: TStringField;
    sqlApropriacaoItemPORCENTAGEM: TFloatField;
    dtsSQLItemPedido: TDataSource;
    sqlItensPedidoKFIN_PLANOCONTA: TStringField;
    cdsItensPedidoKFIN_PLANOCONTA: TStringField;
    cdsItensPedidosqlApropriacaoItem: TDataSetField;
    sqlDevolucaoNOMEENTIDADE: TStringField;
    cdsDevolucaoNOMEENTIDADE: TStringField;
    sqlDevolucoesNOMEENTIDADE: TStringField;
    cdsDevolucoesNOMEENTIDADE: TStringField;
    sqlItensPedidoDESCR_PC_NOME: TStringField;
    sqlItensPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    sqlItensPedidoDESCR_PC_CODIGO: TIntegerField;
    sqlItensPedidoDESCR_PC_TIPO_APRD: TStringField;
    cdsItensPedidoDESCR_PC_NOME: TStringField;
    cdsItensPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    cdsItensPedidoDESCR_PC_CODIGO: TIntegerField;
    cdsItensPedidoDESCR_PC_TIPO_APRD: TStringField;
    sqlParcelasNOMECONTA: TStringField;
    cdsParcelasNOMECONTA: TStringField;
    sqlAreceberKSYSDOMAIN: TStringField;
    cdsAReceberKSYSDOMAIN: TStringField;
    sqlAreceberNOMECONTA: TStringField;
    cdsAReceberNOMECONTA: TStringField;
    cdsDevolucaotmpCalc: TIntegerField;
    cdsParcelastmpCalc: TFloatField;
    sqlAreceberNUM_PARCELAS: TIntegerField;
    sqlAreceberPROXIMO_MES: TStringField;
    sqlAreceberRECORRENCIA: TStringField;
    sqlAreceberDIA_VENCTO: TIntegerField;
    cdsAReceberNUM_PARCELAS: TIntegerField;
    cdsAReceberPROXIMO_MES: TStringField;
    cdsAReceberRECORRENCIA: TStringField;
    cdsAReceberDIA_VENCTO: TIntegerField;
    sqlApropriacaoItemTABLENAME: TStringField;
    sqlApropriacaoItemTABLEKEY: TStringField;
    cdsApropriacaoItemTABLENAME: TStringField;
    cdsApropriacaoItemTABLEKEY: TStringField;
    cdsItensPedidoFRETE: TFloatField;
    cdsItensPedidoDESCONTO: TFloatField;
    cdsItensPedidoVALOR_UNITARIO: TFloatField;
    cdsItensPedidoVALOR_PARCIAL: TFloatField;
    cdsItensPedidoSomaParcial: TAggregateField;
    sqlItensPedidoVALOR_UNITARIO: TFloatField;
    sqlItensPedidoVALOR_PARCIAL: TFloatField;
    sqlItensPedidoDESCONTO: TFloatField;
    sqlItensPedidoFRETE: TFloatField;
    cdsItensPedidoSomaDesconto: TAggregateField;
    cdsItensPedidoSomaFrete: TAggregateField;
    cdsAPagarTransporte: TClientDataSet;
    cdsAPagarTransporteKFIN_APAGAR: TStringField;
    cdsAPagarTransporteKSYSDOMAIN: TStringField;
    cdsAPagarTransporteTABLENAME: TStringField;
    cdsAPagarTransporteTABLEKEY: TStringField;
    cdsAPagarTransporteATIVO: TStringField;
    cdsAPagarTransporteKCAD_ENTIDADE: TStringField;
    cdsAPagarTransporteNOMEENTIDADE: TStringField;
    cdsAPagarTransporteHISTORICO: TStringField;
    cdsAPagarTransporteDOCUMENTO: TStringField;
    cdsAPagarTransporteDATALANCTO: TSQLTimeStampField;
    cdsAPagarTransporteNUM_PARCELAS: TIntegerField;
    cdsAPagarTransportePROXIMO_MES: TStringField;
    cdsAPagarTransporteRECORRENCIA: TStringField;
    cdsAPagarTransporteDIA_VENCTO: TIntegerField;
    cdsAPagarTransporteKFIN_CONTA_PREF: TStringField;
    cdsAPagarTransporteNOMECONTA: TStringField;
    cdsAPagarTransporteKFIN_PLANOCONTA: TStringField;
    cdsAPagarTransporteOBS: TMemoField;
    cdsAPagarTransporteStatusCadastro: TStringField;
    cdsParcelasTransporte: TClientDataSet;
    cdsParcelasTransporteKFIN_APAGAR_PARCELA: TStringField;
    cdsParcelasTransporteKFIN_APAGAR: TStringField;
    cdsParcelasTransporteDOCUMENTO: TStringField;
    cdsParcelasTransporteVENCTO: TSQLTimeStampField;
    cdsParcelasTransporteVALOR: TFloatField;
    cdsParcelasTransportePAGTO: TSQLTimeStampField;
    cdsParcelasTransportePAGO: TFloatField;
    cdsParcelasTransporteKFIN_CONTA: TStringField;
    cdsParcelasTransporteNOMECONTA: TStringField;
    cdsParcelasTransportePREVISAO: TStringField;
    cdsParcelasTransporteDUVIDOSO: TStringField;
    cdsParcelasTransporteOBS: TMemoField;
    cdsParcelasTransportetmpCalc: TFloatField;
    cdsParcelasTransporteSomaValor: TAggregateField;
    sqlAPagarTransporte: TTcSQLDataSet;
    sqlAPagarTransporteKFIN_APAGAR: TStringField;
    sqlAPagarTransporteKSYSDOMAIN: TStringField;
    sqlAPagarTransporteATIVO: TStringField;
    sqlAPagarTransporteTABLENAME: TStringField;
    sqlAPagarTransporteTABLEKEY: TStringField;
    sqlAPagarTransporteKCAD_ENTIDADE: TStringField;
    sqlAPagarTransporteNOMEENTIDADE: TStringField;
    sqlAPagarTransporteHISTORICO: TStringField;
    sqlAPagarTransporteDOCUMENTO: TStringField;
    sqlAPagarTransporteDATALANCTO: TSQLTimeStampField;
    sqlAPagarTransporteNUM_PARCELAS: TIntegerField;
    sqlAPagarTransportePROXIMO_MES: TStringField;
    sqlAPagarTransporteRECORRENCIA: TStringField;
    sqlAPagarTransporteDIA_VENCTO: TIntegerField;
    sqlAPagarTransporteKFIN_CONTA_PREF: TStringField;
    sqlAPagarTransporteNOMECONTA: TStringField;
    sqlAPagarTransporteKFIN_PLANOCONTA: TStringField;
    sqlAPagarTransporteOBS: TMemoField;
    sqlParcelasTransporte: TTcSQLDataSet;
    sqlParcelasTransporteKFIN_APAGAR_PARCELA: TStringField;
    sqlParcelasTransporteKFIN_APAGAR: TStringField;
    sqlParcelasTransporteDOCUMENTO: TStringField;
    sqlParcelasTransporteVENCTO: TSQLTimeStampField;
    sqlParcelasTransporteVALOR: TFloatField;
    sqlParcelasTransportePAGTO: TSQLTimeStampField;
    sqlParcelasTransportePAGO: TFloatField;
    sqlParcelasTransporteKFIN_CONTA: TStringField;
    sqlParcelasTransporteNOMECONTA: TStringField;
    sqlParcelasTransportePREVISAO: TStringField;
    sqlParcelasTransporteDUVIDOSO: TStringField;
    sqlParcelasTransporteOBS: TMemoField;
    dtsSQLAPagarTransporte: TDataSource;
    cdsDevolucaosqlAPagarTransporte: TDataSetField;
    cdsAPagarTransportesqlParcelasTransporte: TDataSetField;
    sqlDevolucaoKFIN_APAGAR_TRANSPORTE: TStringField;
    cdsDevolucaoKFIN_APAGAR_TRANSPORTE: TStringField;
    sqlDevolucaoCHAVENFE: TStringField;
    cdsDevolucaoCHAVENFE: TStringField;
    cdsUnidadesCompra: TClientDataSet;
    cdsUnidadesCompraKCAD_TIPOS: TStringField;
    cdsUnidadesCompraDESCRICAO: TStringField;
    cdsUnidades: TClientDataSet;
    cdsUnidadesKCAD_TIPOS: TStringField;
    cdsUnidadesDESCRICAO: TStringField;
    cdsItensPedidoDESCR_UNIDADE: TStringField;
    sqlItensPedidoCFOP: TStringField;
    sqlItensPedidoQTDE_COMPRA: TFloatField;
    sqlItensPedidoUNIDADE_COMPRA: TStringField;
    sqlItensPedidoUNITARIO_COMPRA: TFloatField;
    sqlItensPedidoATUALIZAR_CUSTO: TStringField;
    cdsItensPedidoCFOP: TStringField;
    cdsItensPedidoQTDE_COMPRA: TFloatField;
    cdsItensPedidoUNIDADE_COMPRA: TStringField;
    cdsItensPedidoUNITARIO_COMPRA: TFloatField;
    cdsItensPedidoATUALIZAR_CUSTO: TStringField;
    cdsItensPedidoDESCR_UNIDADE_COMPRA: TStringField;
    sqlDadosProdutoBAIXA_ESTOQUE: TStringField;
    sqlDadosProdutoKFIN_PLANOCONTA: TStringField;
    cdsDadosProdutoBAIXA_ESTOQUE: TStringField;
    cdsDadosProdutoKFIN_PLANOCONTA: TStringField;
    sqlDadosProdutoDESCRICAO_APROPRIACAO: TStringField;
    cdsDadosProdutoDESCRICAO_APROPRIACAO: TStringField;
    sqlDadosProdutoUNIDADE: TStringField;
    cdsDadosProdutoUNIDADE: TStringField;
    sqlDadosProdutoCODIGO: TStringField;
    sqlDadosProdutoNOME: TStringField;
    cdsDadosProdutoCODIGO: TStringField;
    cdsDadosProdutoNOME: TStringField;
    sqlProdutosFornecedor: TTcSQLDataSet;
    sqlProdutosFornecedorKEST_PRODUTO: TStringField;
    sqlProdutosFornecedorKCAD_FORNECEDOR: TStringField;
    sqlProdutosFornecedorCODIGO: TStringField;
    sqlProdutosFornecedorNOME: TStringField;
    dspProdutosFornecedor: TDataSetProvider;
    cdsProdutosFornecedor: TClientDataSet;
    cdsProdutosFornecedorKEST_PRODUTO: TStringField;
    cdsProdutosFornecedorKCAD_FORNECEDOR: TStringField;
    cdsProdutosFornecedorCODIGO: TStringField;
    cdsProdutosFornecedorNOME: TStringField;
    cdsItensPedidoCODIGO_NOME: TStringField;
    sqlDevolucaoIMPORTADO_NFE: TStringField;
    cdsDevolucaoIMPORTADO_NFE: TStringField;
    sqlDevolucaoXML_NFE: TMemoField;
    cdsDevolucaoXML_NFE: TMemoField;
    sqlDevolucaoMODELO_NFE: TIntegerField;
    cdsDevolucaoMODELO_NFE: TIntegerField;
    sqlAreceberPAGTO_AVISTA: TStringField;
    cdsAReceberPAGTO_AVISTA: TStringField;
    cdsItensPedidoCFOP_ESTOQUE: TStringField;
    sqlItensPedidoCFOP_ESTOQUE: TStringField;
    cdsItensPedidoCST_CSOSN: TStringField;
    sqlItensPedidoCST_CSOSN: TStringField;
    cdsParcelasCHEQUE: TStringField;
    cdsParcelasNUM_CHEQUE: TStringField;
    cdsParcelasDT_COMPENSACAO: TSQLTimeStampField;
    sqlParcelasCHEQUE: TStringField;
    sqlParcelasNUM_CHEQUE: TStringField;
    sqlParcelasDT_COMPENSACAO: TSQLTimeStampField;
    sqlItensPedidoVALOR_IPI: TFloatField;
    cdsItensPedidoVALOR_IPI: TFloatField;
    cdsItensPedidoSomaValorIPI: TAggregateField;
    sqlDevolucaoSYSORIGIN_TYPE: TIntegerField;
    cdsDevolucaoSYSORIGIN_TYPE: TIntegerField;
    sqlAPagarTransportePAGTO_AVISTA: TStringField;
    cdsAPagarTransportePAGTO_AVISTA: TStringField;
    sqlParcelasTransporteCHEQUE: TStringField;
    sqlParcelasTransporteDT_COMPENSACAO: TSQLTimeStampField;
    cdsParcelasTransporteCHEQUE: TStringField;
    cdsParcelasTransporteDT_COMPENSACAO: TSQLTimeStampField;
    sqlParcelasTransporteNUM_CHEQUE: TStringField;
    cdsParcelasTransporteNUM_CHEQUE: TStringField;
    sqlAReceberKDEV_PEDIDO: TStringField;
    cdsAReceberKDEV_PEDIDO: TStringField;
    sqlAReceberANUAL: TStringField;
    cdsAReceberANUAL: TStringField;
    cdsAPagarTransporteANUAL: TStringField;
    sqlAPagarTransporteANUAL: TStringField;
    sqlDevolucoesNOTA_FISCAL_: TStringField;
    cdsDevolucoesNOTA_FISCAL_: TStringField;
    sqlDevolucaoNOTA_FISCAL_: TStringField;
    procedure cdsDevolucoesNewRecord(DataSet: TDataSet);
    procedure cdsDevolucaoNewRecord(DataSet: TDataSet);
    procedure cdsDevolucaoCalcFields(DataSet: TDataSet);
    procedure cdsItensPedidoCalcFields(DataSet: TDataSet);
    procedure cdsItensPedidoNewRecord(DataSet: TDataSet);
    procedure cdsItensPedidoBeforeInsert(DataSet: TDataSet);
    procedure cdsDevolucaoBeforeInsert(DataSet: TDataSet);
    procedure cdsDevolucaoNOMECONTATOValidate(Sender: TField);
    procedure cdsDevolucaoNOMECOMPRADORValidate(Sender: TField);
    procedure cdsAReceberNewRecord(DataSet: TDataSet);
    procedure cdsParcelasNewRecord(DataSet: TDataSet);
    procedure cdsParcelasBeforeInsert(DataSet: TDataSet);
    procedure cdsDevolucaoBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsApropriacaoItemNewRecord(DataSet: TDataSet);
    procedure cdsParcelasBeforeDelete(DataSet: TDataSet);
    procedure cdsParcelasBeforeEdit(DataSet: TDataSet);
    procedure cdsParcelasVENCTOChange(Sender: TField);
    procedure cdsDevolucaoBeforeEdit(DataSet: TDataSet);
    procedure cdsItensPedidoBeforePost(DataSet: TDataSet);
    procedure cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsItensPedidoAfterDelete(DataSet: TDataSet);
    procedure cdsAReceberNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsDevolucaoDATA_COMPRAValidate(Sender: TField);
    procedure cdsDevolucaoDATA_EMISSAOValidate(Sender: TField);
    procedure cdsDevolucaoDATA_ENTRADAValidate(Sender: TField);
    procedure cdsDevolucaoNOMEENTIDADESetText(Sender: TField; const Text: string);
    procedure cdsItensPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
    procedure cdsDevolucaoDATA_COMPRAChange(Sender: TField);
    procedure cdsParcelasCalcFields(DataSet: TDataSet);
    procedure cdsDevolucaoBeforeDelete(DataSet: TDataSet);
    procedure cdsItensPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsDevolucaoBeforePost(DataSet: TDataSet);
    procedure cdsItensPedidoAfterCancel(DataSet: TDataSet);
    procedure cdsItensPedidoBeforeEdit(DataSet: TDataSet);
    procedure cdsAPagarTransporteNewRecord(DataSet: TDataSet);
    procedure cdsParcelasTransporteNewRecord(DataSet: TDataSet);
    procedure cdsParcelasTransporteCalcFields(DataSet: TDataSet);
    procedure cdsParcelasTransporteBeforeInsert(DataSet: TDataSet);
    procedure cdsParcelasTransporteBeforeEdit(DataSet: TDataSet);
    procedure cdsParcelasTransporteBeforeDelete(DataSet: TDataSet);
    procedure cdsAPagarTransporteNOMECONTASetText(Sender: TField;
      const Text: string);
    procedure cdsParcelasTransporteNOMECONTASetText(Sender: TField;
      const Text: string);
    procedure cdsDevolucaoNOTA_FISCALValidate(Sender: TField);
    procedure cdsDevolucaoKCAD_ENTIDADEValidate(Sender: TField);
    procedure dspProdutosFornecedorBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsItensPedidoCODIGO_NOMESetText(Sender: TField;
      const Text: string);
    procedure cdsAReceberPAGTO_AVISTAChange(Sender: TField);
    procedure cdsParcelasNUM_CHEQUESetText(Sender: TField; const Text: string);
    procedure cdsParcelasCHEQUEChange(Sender: TField);
    procedure cdsParcelasBeforePost(DataSet: TDataSet);
    procedure sqlDevolucaoBeforeOpen(DataSet: TDataSet);
    procedure cdsDevolucaoBeforeOpen(DataSet: TDataSet);
    procedure cdsDevolucaoAfterInsert(DataSet: TDataSet);
    procedure cdsParcelasTransporteBeforePost(DataSet: TDataSet);
    procedure cdsParcelasTransporteCHEQUEChange(Sender: TField);
    procedure cdsParcelasTransporteNUM_CHEQUESetText(Sender: TField;
      const Text: string);
  private
    { Private declarations }
    FSQLDevolucoesRequiredField : IRequiredFields ;
    FCDSDevolucoesRequiredField : IRequiredFields ;

    FDisableCheckItems : boolean ;
    LValidatePlanoContas : boolean ;
    FShowInativos : Boolean ;
    FDataInicial  : TDateTime ;
    FDataFinal    : TDateTime ;
    DataEmissao   : TDateTime ;
    FNewCadastro  : Boolean ;
    FKContaPadrao : string ;
    FNomeConta    : string;
    FKContaFavorita    : string;
    FNomeContaFavorita : string;
    ValorLinhaItensParcial    : double ;
    ValorLinhaItensTotal    : double ;
    ValorLinhaItensTotalIPI : double ;
    FK_PLANOESTOQUE : string ;
    FKItemMaiorValor : string;
    FKDEV_PEDIDO: string;
    procedure CalculaTotaisPedido ;
    procedure SetParams ;
    procedure LimpaProduto ;
    function ValidaCampos : Boolean;
    procedure CheckMesEncerrado ;
    procedure InitPlanoContaEstoque ;
    procedure Ratear( AValorRatear : double ; AField : TFloatField ; ARateioEvent : TRateioEvent ) ;

    procedure SetMaiorValorItemFrete( ARateioEventType : TRateioEventType; APercent : double ) ;
    procedure SetMaiorValorItemDesconto( ARateioEventType : TRateioEventType; APercent : double ) ;
    procedure SetMaiorValorItemImposto( ARateioEventType : TRateioEventType; APercent : double ) ;
    procedure ValidNF ;
    procedure SetKDEV_PEDIDO(const Value: string);
    function RoundTo(const AValue: Currency; const ADigit: TRoundToRange): Currency;
  public
    { Public declarations }
    procedure SetEntidade ( Key : String ;NomeEntidade : string ) ;
    procedure SetEntidadeTransporte ( Key : String ;NomeEntidade : string ) ;
    procedure SetCOMPRADOR ( Key : String ;NomeCOMPRADOR : string ) ;
    procedure ListaTiposCadastro(CDS: TClientDataSet; Tipo: Integer);
    procedure SetContato ( Key : String ;NomeContato : string ; Depto : string = '' ; Email : string = '' ; Fone  : string = '' ) ;
    procedure OpenTables ; override ;
    procedure insereItem( Key, CodigoProduto, NomeProduto: string; QTDE, ValorCusto:Currency;
                          Unidade : String; AKFIN_PlanoConta, ADescrPlanoConta : string ; AControlaEstoque : boolean );
    procedure inserePatrimonio(
       Key : String;
       AKFIN_PlanoConta
     , ADescrPlanoConta : string );

    procedure insereServico( Key, Codigo, Nome, Unidade : string; ValorCusto : Currency );

    procedure OpenPedido ( KPedido : String  ) ;
    procedure ClonePedido ;
    procedure SetFilter ( ShowInativos : Boolean; DataInicial, DataFinal : TDateTime );
    procedure SetCFOP ( Key : String ;Descricao: string ) ;
    procedure SetCFOP_ESTOQUE ( Key : String ;Descricao: string ) ;
    procedure SetContaPreferencia( KFIN_CONTA, NOME: string);
    procedure SetContaPreferenciaTransporte( KFIN_CONTA, NOME: string);
    procedure SetConta( KFIN_CONTA, NOME: string);
    procedure SetContaTransporte( KFIN_CONTA, NOME: string);
    procedure CalculaTotais;
    procedure CancelUpdates; override;
    procedure ApplyUpdates; override;
    procedure CheckValorAReceber ;
    procedure RatearDescontos;
    procedure RatearFrete ;
    procedure RatearImpostos;
    procedure PostItem ;
    procedure EditItem ;
    constructor Create ( AOwner : TComponent ) ;override ;
    property  KDEV_PEDIDO : string  read FKDEV_PEDIDO write SetKDEV_PEDIDO;
    procedure CalcularParcelas( ADiaDaParcela : integer ; ATotalParcelas : integer ; AProximoMes, AAnual : boolean ) ;
    procedure CalcularParcelasTransporte( ADiaDaParcela : integer ; ATotalParcelas : integer ; AProximoMes, AAnual : boolean ) ;
    function ParcelaBaixada : Boolean ;
    procedure PagamentoAVista ;
    procedure GetContaFavorita;
  end;

implementation

uses
    Tc.RTL.Exceptions
  , Tc.DBRTL.AbstractDB
  , UDBFinanceiro
  , UDBEntidades
  , Data.SQLTimSt
  , DateUtils
  , CLAg5SvcEstoqueCadastroTipos
  , CLAg5SvcFinanceiroApropriacao
  , Datasnap.DSConnect
   ;

const
  _PRODUTO    = 1;
  _PATRIMONIO = 2;

resourcestring
  _ERRMSG_TOTAL_ZERO = 'Não é possivel gravar um pedido sem itens/valor' ;
  _ERRMSG_TOTAL_APGAGAR = 'Total das parcelas a receber não'#13#10'coincide com total do pedido' ;
  _ERRMSG_NOTA_JA_CADASTRADA = 'Nota fiscal já cadastrada para este fornecedor' ;

{$R *.dfm}

{ TrdmdtmDEVOLUCOES_Pedido }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmDEVOLUCOES_Pedido.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;

{$ENDIF}


procedure TdtmDEVOLUCOES_Pedido.dspProdutosFornecedorBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);

const
  _UPDATE_OR_INSERT_EST_PRODUTO_FORNECEDORES =
        'UPDATE OR INSERT INTO EST_PRODUTO_FORNECEDORES'
 +#13#10'('
 +#13#10' KEST_PRODUTO,'
 +#13#10' KCAD_FORNECEDOR,'
 +#13#10' CODIGO,'
 +#13#10' NOME'
 +#13#10')'
 +#13#10'VALUES'
 +#13#10'('
 +#13#10' :KEST_PRODUTO,'
 +#13#10' :KCAD_FORNECEDOR,'
 +#13#10' :CODIGO,'
 +#13#10' :NOME'
 +#13#10')'
 +#13#10'MATCHING(KEST_PRODUTO,KCAD_FORNECEDOR)' ;


(*
  SELECT
   KEST_PRODUTO_FORNECEDOR,
   KEST_PRODUTO,
   KCAD_FORNECEDOR,
   CODIGO,
   NOME
  FROM EST_PRODUTO_FORNECEDORES


        'CREATE TABLE EST_PRODUTO_FORNECEDORES ('
 +#13#10'   KEST_PRODUTO_FORNECEDOR SYS$PKGUID20,'
 +#13#10'   KEST_PRODUTO            SYS$FKGUID20_NN,'
 +#13#10'   KCAD_FORNECEDOR         SYS$FKGUID20_NN,'
 +#13#10'   CODIGO                  SYS$CODE,'
 +#13#10'   NOME                    SYS$DESCR_NN,'
*)
var
  p : TParams ;
begin
  p := TParams.Create ;
  p.CreateParam( ftString, 'KEST_PRODUTO',    ptInput ).asString  := DeltaDS.FieldByName( 'KEST_PRODUTO'    ).NewValue ;
  p.CreateParam( ftString, 'KCAD_FORNECEDOR', ptInput ).asString  := DeltaDS.FieldByName( 'KCAD_FORNECEDOR' ).NewValue ;
  p.CreateParam( ftString, 'CODIGO',          ptInput ).asString  := DeltaDS.FieldByName( 'CODIGO'          ).NewValue ;
  p.CreateParam( ftString, 'NOME',            ptInput ).asString  := DeltaDS.FieldByName( 'NOME'            ).NewValue ;
  sqlProdutosFornecedor.SQLConnection.Execute( _UPDATE_OR_INSERT_EST_PRODUTO_FORNECEDORES, p ) ;
  p.Free ;
  Applied := True ;
end;



{ TdtmCustomListaFicha }

procedure TdtmDEVOLUCOES_Pedido.ListaTiposCadastro(CDS: TClientDataSet; Tipo: Integer);
const
  SQL_LISTA = 'SELECT ' +
              ' KCAD_TIPOS, ' +
              ' DESCRICAO ' +
              'FROM CAD_TIPOS ' +
              'WHERE KSYS$DOMAIN = :KSYS$DOMAIN ' +
              '  AND TIPO = :TIPO ' +
              'ORDER BY DESCRICAO ';
var
  p : TParams;

begin
  p := TParams.Create;
  p.CreateParam( ftString,  'KSYS$DOMAIN',  ptInput ).AsString  := LoggedUser.DomainID;
  p.CreateParam( ftInteger, 'TIPO',         ptInput ).AsInteger := Tipo;

  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( CDS, SQL_LISTA, p );

  p.Free;
end;


procedure TdtmDEVOLUCOES_Pedido.OpenTables;
begin
  TTcAbstractDB.GetByAlias('FINANCEIRO').GetSystemTypes ( 'STATUS_PEDIDO', cdsStatusPedido ) ;

  ListaTiposCadastro( cdsUnidadesCompra, CLAg5SvcEstoqueCadastroTipos._UNIDADE_MEDIDA );
  ListaTiposCadastro( cdsUnidades,       CLAg5SvcEstoqueCadastroTipos._UNIDADE_MEDIDA );

  InitPlanoContaEstoque ;
  TCDSSuppl.Open ( cdsDadosEntidade ) ;
  FKContaPadrao := '';
  FNomeConta    := '';
  if FKContaFavorita <> '' then
   begin
     FKContaPadrao := FKContaFavorita;
     FNomeConta    := FNomeContaFavorita;
   end
  else
   begin
     FKContaPadrao := '' ;
     FNomeConta    := '' ;
   end;

  inherited;
end;

procedure TdtmDEVOLUCOES_Pedido.PagamentoAVista;
begin

  if cdsParcelas.State in [dsInsert,dsEdit] then
     cdsParcelas.Cancel ;

  cdsParcelas.BeforeDelete := nil ;
  if not cdsParcelas.IsEmpty then
    begin
      cdsParcelas.First;
      while not cdsParcelas.Eof do
        begin
//          if not cdsParcelasPAGTO.IsNull then
//            raise Warning.Create('Exite parcela(s) já baixada(s)');

          cdsParcelas.Delete;
        end;
    end;
  cdsParcelas.BeforeDelete := cdsParcelasBeforeDelete ;

  if not cdsAReceberPAGTO_AVISTA.asBoolean then
    exit ;

  TCdsSuppl.PostIfNeed( cdsDevolucao );


  if not( cdsAReceber.State in [ dsInsert, dsEdit] ) then
    cdsAReceber.Edit;

  cdsAReceberHISTORICO.asString := Format( 'Nota fiscal de devolução: (%s)', [ cdsDevolucaoNOTA_FISCAL.AsString ] ) ;
  cdsAReceberDOCUMENTO.AsString := cdsDevolucaoNOTA_FISCAL.AsString ;


  cdsParcelas.Append;
  cdsParcelasVENCTO.AsDateTime := Trunc ( cdsDevolucaoDATA_EMISSAO.AsDateTime ) ;
  cdsParcelasVALOR.AsFloat     := cdsDevolucaoTOTAL_NOTA.AsFloat ;
  cdsParcelasPAGTO.AsDateTime  := Trunc ( cdsDevolucaoDATA_EMISSAO.AsDateTime ) ;
  cdsParcelasPAGO.AsFloat      := cdsDevolucaoTOTAL_NOTA.AsFloat ;
  cdsParcelasCHEQUE.asString   := 'F' ;
  if cdsParcelasCHEQUE.asBoolean then
      cdsParcelasDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasPAGTO.AsSQLTimeStamp ;
      cdsParcelasNUM_CHEQUE.Clear ;
    end ;


  if not ( cdsParcelasKFIN_CONTA.IsNull) or ( cdsParcelasKFIN_CONTA.AsString <> EmptyStr ) then
    begin
      cdsParcelasKFIN_CONTA.AsString := cdsParcelasKFIN_CONTA.AsString;
      cdsParcelasNOMECONTA.AsString  := cdsParcelasNOMECONTA.AsString;
    end;

  cdsParcelas.Post;

end;

function TdtmDEVOLUCOES_Pedido.ParcelaBaixada: Boolean;
const

   // Verificar se o fornecedor possui registros em compra
   _SQL_PARCELAS   = 'SELECT C.KDEV_PEDIDO '
   +#13#10'FROM DEV_PEDIDOS C'
   +#13#10'INNER JOIN FIN_ARECEBER_PARCELAS P ON P.KFIN_ARECEBER = C.KFIN_ARECEBER'
   +#13#10'WHERE P.PAGO IS NOT NULL AND C.KDEV_PEDIDO = :KEY'
   +#13#10'UNION ALL'
   +#13#10'SELECT C.KDEV_PEDIDO '
   +#13#10'FROM DEV_PEDIDOS C'
   +#13#10'INNER JOIN FIN_ARECEBER_PARCELAS P ON P.KFIN_ARECEBER = C.KFIN_APAGAR_TRANSPORTE'
   +#13#10'WHERE P.PAGO IS NOT NULL AND C.KDEV_PEDIDO = :KEY'
   +#13#10'ROWS 1' ;

var

  cds : TClientDataSet ;
  p : TParams ;

begin

  try

    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KEY', ptInput ).asString := cdsDevolucaoKDEV_PEDIDO.asString ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL_PARCELAS, p ) ;

    // Se contagem for maior que zero, a compra possui parcelas baixadas
    if cds.RecordCount > 0 then
      Result := true
    else
      Result := false;

  finally
    p.free ;
    cds.free ;
  end;

end;

procedure TdtmDEVOLUCOES_Pedido.PostItem;
begin
   LValidatePlanoContas := False ;
   try
     TCdsSuppl.PostIfNeed( cdsItensPedido );
   finally
     LValidatePlanoContas := True ;
   end
end;


type
  TRateio = class
  private
    FPercent,
    FValorRatear,
    FValorRestante,
    FValorRateado : double ;
    FMenorPercent, FMaiorPercent : double ;
  private
    FOnEvent: TRateioEvent;
    procedure DoEvent( AEvent : TRateioEventType ) ;
    function  GetPercent: double;
    function  GetValorRateado: double;
    function  GetValorRatear: double;
    function  GetValorRestante: double;
    procedure SetPercent(const Value: double);
    procedure SetValorRatear(const Value: double);
    procedure SetOnEvent(const Value: TRateioEvent);
  public
   property Percent       : double read GetPercent       write SetPercent       ;
   property ValorRatear   : double read GetValorRatear   write SetValorRatear   ;
   property ValorRestante : double read GetValorRestante ;
   property ValorRateado  : double read GetValorRateado  ;
   function Ratear ( APercent : double ) : double ; overload ;
   function Ratear  : double ; overload ;
   property OnEvent : TRateioEvent  read FOnEvent write SetOnEvent;
  end;

procedure TdtmDEVOLUCOES_Pedido.Ratear( AValorRatear : double ; AField : TFloatField  ; ARateioEvent : TRateioEvent  ) ;
type
  TInfoPair = TPair<string,double> ;
  TListPair = TList<TInfoPair> ;
var
  Rateio : TRateio ;
  LSomaParcial : double ;
  L : TListPair ;
  P : TInfoPair ;
  FKActiveItem : string ;
begin
   TCDSSuppl.PostIfNeed ( cdsItensPedido ) ;

   L := TListPair.Create ;

   LSomaParcial :=  TryVarToFloat ( cdsItensPedidoSomaParcial.Value ) ;

   if LSomaParcial = 0 then
      LSomaParcial := 1 ;

   Rateio := TRateio.Create ;
   Rateio.OnEvent :=  ARateioEvent ;
   Rateio.ValorRatear := AValorRatear ;

   cdsItensPedido.DisableControls ;
   FKActiveItem :=  cdsItensPedidoKDEV_PEDIDO_ITEM.asString ;
   with cdsItensPedido do
     try
       first ;
       while not eof  do
          begin
            L.Add( TInfoPair.Create(
                         cdsItensPedidoKDEV_PEDIDO_ITEM.asString,
                         Rateio.Ratear ( cdsItensPedidoVALOR_PARCIAL.asFloat / LSomaParcial )
                         ) ) ;
            next ;
          end;
       for p in L do
         begin
           Locate( 'KDEV_PEDIDO_ITEM', p.Key, [] ) ;
           edit ;
           AField.asFloat := p.Value ;
           post ;
         end;

       if    (FKItemMaiorValor <> '')
         and ( Rateio.ValorRestante <> 0 )
         and  Locate( 'KDEV_PEDIDO_ITEM', FKItemMaiorValor, [] ) then
         begin
           edit ;
           AField.asFloat := AField.asFloat + Rateio.ValorRestante ;
           post ;
         end;
     finally
       cdsItensPedido.Locate( 'KDEV_PEDIDO_ITEM', FKActiveItem, [] ) ;
       cdsItensPedido.enableControls ;
     end;

   L.Free ;
   Rateio.Free ;

end;

procedure TdtmDEVOLUCOES_Pedido.RatearDescontos;
begin
   Ratear ( cdsDevolucaoDescontos.AsFloat, cdsItensPedidoDesconto, SetMaiorValorItemDesconto ) ;
end;

procedure TdtmDEVOLUCOES_Pedido.RatearFrete;
begin
   Ratear ( cdsDevolucaoFrete.AsFloat, cdsItensPedidoFrete, SetMaiorValorItemFrete ) ;
end;

procedure TdtmDEVOLUCOES_Pedido.RatearImpostos;
begin
//   Ratear ( cdsDevolucaoFrete.AsFloat, cdsItensPedidoFrete, SetMaiorValorItemImposto ) ;
end;

function TdtmDEVOLUCOES_Pedido.RoundTo(const AValue: Currency;
  const ADigit: TRoundToRange): Currency;
var
  LFactor: Extended;
  rmOrig: TFPURoundingMode;
begin
  {Função para retornar o valor arredondando corretamente}
  LFactor := IntPower(10, ADigit);
  Result := Round(AValue / LFactor) * LFactor;
  rmOrig := GetRoundMode();
  if rmOrig <> rmNearest then begin
    SetRoundMode(rmNearest);
    Result := Round(Result / LFactor) * LFactor;
    SetRoundMode(rmOrig);
  end;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucoesNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
//  cdsDevolucoesKSYSDOMAIN.asString := LoggedUser.DomainID ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoNewRecord(DataSet: TDataSet);
//var
//  NomeCOMPRADOR : string ;
begin
  inherited;
  self.CopyKeysFromMaster ;
  GetKey ( cdsDevolucaoKFIN_ARECEBER ) ;
  GetKey ( cdsDevolucaoKFIN_APAGAR_TRANSPORTE ) ;
  cdsDevolucaoKSYSDOMAIN.asString       := LoggedUser.DomainID;
  cdsDevolucaoDATA_COMPRA.AsSQLTimeStamp  := DateTimeToSQLTimeStamp( Date ) ;
  cdsDevolucaoFRETE.asFloat               := 0;
  cdsDevolucaoDESCONTOS.asFloat           := 0;
  cdsDevolucaoIMPOSTOS.asFloat            := 0;
  cdsDevolucaoTOTAL_NOTA.asFloat          := 0;
  cdsDevolucaoATIVO.AsString              := 'T';
  cdsDevolucaoIMPORTADO_NFE.asString       := 'F' ;
  cdsDevolucaoSYSORIGIN_TYPE.asInteger  := 0 ;
  FNewCadastro                         := True;
  ValorLinhaItensParcial               := 0 ;
  ValorLinhaItensTotal                      := 0;
  ValorLinhaItensTotalIPI              := 0;

//  cdsDevolucaoSTATUS.asInteger := 1 ;
//  if LoggedUser.Apelido = '' then
//     NomeCOMPRADOR := LoggedUser.Login
//  else
//     NomeCOMPRADOR := LoggedUser.Apelido ;

//  cdsDevolucaoNOMECONTATO.asString := 'o mesmo' ;
//  if LoggedUser.IsCOMPRADOR then
//     SetCOMPRADOR ( LoggedUser.CodigoEntidade, NomeCOMPRADOR) ;
end;


procedure TdtmDEVOLUCOES_Pedido.insereItem(Key, CodigoProduto, NomeProduto: string; QTDE, ValorCusto: Currency;
      Unidade: String; AKFIN_PlanoConta, ADescrPlanoConta : string ; AControlaEstoque : boolean );
var
  LCDSApropriacao : TClientDataSet ;
  p : TParams ;
  LQtdeIsNull : boolean ;
begin
  if not ( cdsItensPedido.State in [dsInsert, dsEdit] ) then
    cdsItensPedido.Edit;

  LQtdeIsNull := cdsItensPedidoQTDE.IsNull ;
  if LQtdeIsNull then
     cdsItensPedidoQTDE.asFloat := 1 ;

  cdsItensPedidoCODIGO.asString          := CodigoProduto ;
  cdsItensPedidoNOME.asString            := NomeProduto ;
  cdsItensPedidoCODIGO_NOME.asString     := CodigoProduto + ' - ' + NomeProduto ;
  cdsItensPedidoKEST_PRODUTO.asString    := Key;
  cdsItensPedidoUNIDADE.AsString         := Unidade ;
  cdsItensPedidoUNIDADE_COMPRA.AsString  := Unidade ;

//  cdsDadosProduto.Params.ParamByName( 'KEST_PRODUTO' ).asString := Key ;
//  TCDSSuppl.Open ( cdsDadosProduto ) ;
//  cdsItensPedidoDETALHES.asString        := cdsDadosProdutoDESCRICAO.asString ;
//  cdsItensPedidoOBS.AsString             := cdsDadosProdutoOBS.AsString ;
//  cdsDadosProduto.Close ;

  if AControlaEstoque then
    begin
      cdsItensPedidoDESCR_PC_NOME.AsString     := 'Estoque' ;
      cdsItensPedidoKFIN_PLANOCONTA.AsString   := FK_PLANOESTOQUE ;
      with cdsApropriacaoItem do
        begin
          first ;
          while not eof do
            Delete ;
        end;

      {if SvcFinanceiroApropriacaoDefault.ForceCC then
        SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
                                 'EST_PRODUTOS', cdsItensPedidoKEST_PRODUTO.asString,
                                 'DEV_PEDIDO_ITENS', cdsItensPedidoKDEV_PEDIDO_ITEM.AsString,
                                 cdsApropriacaoItem,
                                 True );}
    end
  else if not AKFIN_PlanoConta.Trim.IsEmpty then
    begin

      if cdsItensPedidoKFIN_PLANOCONTA.AsString  <> AKFIN_PlanoConta then
       with cdsApropriacaoItem do
         begin
           first ;
           while not eof do
             Delete ;
         end;

      cdsItensPedidoDESCR_PC_NOME.AsString     := ADescrPlanoConta ;
      cdsItensPedidoKFIN_PLANOCONTA.AsString   := AKFIN_PlanoConta ;
      //add rateio ....

      SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
                               'EST_PRODUTOS', cdsItensPedidoKEST_PRODUTO.asString,
                               'DEV_PEDIDO_ITENS', cdsItensPedidoKDEV_PEDIDO_ITEM.AsString,
                               cdsApropriacaoItem,
                               SvcFinanceiroApropriacaoDefault.NeedCC( cdsItensPedidoKFIN_PLANOCONTA.AsString ) );


    end;

  if LQtdeIsNull then
    begin
     //cdsItensPedidoQTDE.OnValidate := nil ;
     cdsItensPedidoQTDE.Clear ;
     //cdsItensPedidoQTDE.OnValidate := cdsItensPedidoQTDEValidate ;
    end;
end;


procedure TdtmDEVOLUCOES_Pedido.inserePatrimonio(Key, AKFIN_PlanoConta,
  ADescrPlanoConta: string);
var
  LCDSApropriacao : TClientDataSet ;
  p : TParams ;
  LQtdeIsNull : boolean ;
begin
           (*
  if not ( cdsPatrimoniosPedido.State in [dsInsert, dsEdit] ) then
    cdsPatrimoniosPedido.Edit;

  cdsPatrimonio.Params.ParamByName( 'KCAD_PATRIMONIO' ).asString := Key ;
  TCDSSuppl.Open ( cdsPatrimonio ) ;

  cdsPatrimoniosPedidoCODIGO.AsString          := cdsPatrimonioCODIGO.AsString;
  cdsPatrimoniosPedidoNOME.AsString            := cdsPatrimonioDESCRICAO.AsString;
  cdsPatrimoniosPedidoCODIGO_NOME.asString     := cdsPatrimonioCODIGO.AsString + ' - ' + cdsPatrimonioDESCRICAO.AsString ;
  cdsPatrimoniosPedidoKCAD_PATRIMONIO.asString := Key;

  cdsPatrimoniosPedidoUNIDADE.AsString         := cdsPatrimonioUNIDADE.AsString;
  cdsPatrimoniosPedidoUNIDADE_COMPRA.AsString  := cdsPatrimonioUNIDADE.AsString;


  cdsPatrimoniosPedidoQTDE.AsFloat             := cdsPatrimonioQUANTIDADE.AsFloat;
  cdsPatrimoniosPedidoQTDE_COMPRA.AsFloat      := cdsPatrimonioQUANTIDADE.AsFloat;

  cdsPatrimoniosPedidoCUSTO.AsFloat            := cdsPatrimonioVALOR_UNITARIO.AsFloat;
  cdsPatrimoniosPedidoUNITARIO_COMPRA.AsFloat  := cdsPatrimonioVALOR_UNITARIO.AsFloat;
  cdsPatrimoniosPedidoVALOR_UNITARIO.AsFloat   := cdsPatrimonioVALOR_UNITARIO.AsFloat;

  cdsPatrimoniosPedidoOBS.AsString             := cdsPatrimonioOBS.AsString;
  cdsPatrimoniosPedidoDETALHES.asString        := cdsPatrimonioDESCRICAO.asString ;
  cdsPatrimoniosPedidoOBS.AsString             := cdsPatrimonioOBS.AsString ;

  RemoveApropriacaoPatrimonio ;

  cdsPatrimoniosPedidoDESCR_PC_NOME.AsString     := ADescrPlanoConta ;
  cdsPatrimoniosPedidoKFIN_PLANOCONTA.AsString   := AKFIN_PlanoConta ;
  //add rateio ....

  SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
                            'CAD_PARTIMONIOS', cdsPatrimoniosPedidoKCAD_PATRIMONIO.asString,
                            'CMP_PEDIDO_ITENS', cdsPatrimoniosPedidoKCMP_PEDIDO_ITEM.AsString,
                            cdsApropriacaoPatrimonio,
                            SvcFinanceiroApropriacaoDefault.NeedCC( cdsPatrimoniosPedidoKFIN_PLANOCONTA.AsString ) );

  cdsPatrimonio.Close ;
             *)
end;

procedure TdtmDEVOLUCOES_Pedido.insereServico(Key, Codigo, Nome,
  Unidade: string; ValorCusto: Currency);
begin
(*
  if not (cdsServicosPedido.State in [dsInsert, dsEdit]) then
    cdsServicosPedido.Edit;

  cdsServicosPedidoCODIGO.asString        := Codigo ;
  cdsServicosPedidoNOME.asString          := Nome ;
  cdsServicosPedidoKEST_PRODUTO.asString  := Key ;
  cdsServicosPedidoUNIDADE.AsString       := Unidade ;

  cdsDadosProduto.Params.ParamByName( 'KEST_PRODUTO' ).asString := Key ;
  TCDSSuppl.Open ( cdsDadosProduto ) ;
  cdsServicosPedidoDETALHES.asString := cdsDadosProdutoDESCRICAO.asString ;
  cdsServicosPedidoOBS.AsString      := cdsDadosProdutoOBS.AsString;
  cdsDadosProduto.Close ;

  RemoveApropriacaoServico ;
*)
end;

procedure TdtmDEVOLUCOES_Pedido.LimpaProduto;
begin
  cdsItensPedidoKEST_PRODUTO.Clear;
//  cdsItensPedidoCODIGO.Clear;
//  cdsItensPedidoNOME.Clear;
end;


procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if not ( DataSet.State in [ dsInsert, dsEdit ] ) or ( DataSet.IsEmpty ) then
    Exit;

  CalculaTotaisPedido;

end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoDATA_COMPRAChange(Sender: TField);
begin
  cdsDevolucaoDATA_EMISSAO.AsDateTime := Sender.AsDateTime ;
  if Sender.AsDateTime < Date then
    cdsDevolucaoDATA_ENTRADA.AsDateTime := Sender.AsDateTime { + 1 } // angélica solicitou não somar 1 ...
  else
    cdsDevolucaoDATA_ENTRADA.AsDateTime := Date ;

end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoDATA_COMPRAValidate(Sender: TField);
begin
  if Sender.AsDateTime > (Date + Time) then
    raise Warning.Create('Data de devolução não pode ser superior a data atual.');
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoDATA_EMISSAOValidate(Sender: TField);
begin
  if Sender.AsDateTime > (Date + Time) then
    raise Warning.Create('Data de emissão não pode ser superior a data atual.');
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoDATA_ENTRADAValidate(Sender: TField);
begin
  if Sender.AsDateTime > (Date + Time) then
    raise Warning.Create('Data de entrada não pode ser superior a data atual.');
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoKCAD_ENTIDADEValidate(Sender: TField);
begin
  ValidNF ;
end;

procedure TdtmDEVOLUCOES_Pedido.SetEntidade(Key: String; NomeEntidade: string);
var
  Dados, Email, Fone : String ;
  KCAD_VENDEDOR, KCAD_TRANSPORTADORA, KCAD_REDESPACHO : integer ;
  DDSFAT : string ;
  CondPagto : integer ;
begin
   if not ( cdsDevolucao.State in [dsInsert,dsEdit] ) then
      cdsDevolucao.Edit ;

   cdsDevolucaoKCAD_ENTIDADE.asString := Key ;
   cdsDevolucaoNOMEENTIDADE.asString  := NomeEntidade ;

   cdsDadosEntidade.Edit ;
   cdsDadosEntidadeKCAD_ENTIDADE.asString := Key ;

   //scRdmCOMPRAS_Pedido.AppServer.GetDadosEntidade( Key, Dados, Email, Fone ) ;
//   DBResources.GetDadosEntidade( Key, Dados, Email, Fone, KCAD_VENDEDOR, KCAD_TRANSPORTADORA, KCAD_REDESPACHO, DDSFAT, CondPagto ) ;

   cdsDadosEntidadeDADOSENTIDADE.asString  := Dados ;
//   cdsDevolucaoEMAIL.asString  := Email ;
//   cdsDevolucaoFONE.asString  := Fone ;
   cdsDadosEntidade.Post ;

  cdsAReceber.Edit ;
  cdsAReceberKCAD_ENTIDADE.AsString := cdsDevolucaoKCAD_ENTIDADE.AsString ;
  cdsAReceberNOMEENTIDADE.asString  := cdsDevolucaoNOMEENTIDADE.asString ;
end;

procedure TdtmDEVOLUCOES_Pedido.SetEntidadeTransporte(Key: String; NomeEntidade: string);
var
  Dados, Email, Fone : String ;
  KCAD_VENDEDOR, KCAD_TRANSPORTADORA, KCAD_REDESPACHO : integer ;
  DDSFAT : string ;
  CondPagto : integer ;
begin
   if not ( cdsAPagarTransporte.State in [dsInsert,dsEdit] ) then
      cdsAPagarTransporte.Edit ;

   cdsAPagarTransporteNOMEENTIDADE.asString  := NomeEntidade ;
   cdsAPagarTransporteKCAD_ENTIDADE.asString := Key ;
end;

procedure TdtmDEVOLUCOES_Pedido.SetFilter(ShowInativos: Boolean; DataInicial, DataFinal : TDateTime );
begin
  if    ( FShowInativos = ShowInativos )
    and ( FDataInicial  = DataInicial )
    and ( FDataFinal    = DataFinal ) then
      exit ;

  FShowInativos := ShowInativos ;
  FDataInicial  := DataInicial ;
  FDataFinal    := DataFinal ;
  SetParams ;
  self.RefreshList ;
end;

procedure TdtmDEVOLUCOES_Pedido.SetKDEV_PEDIDO(const Value: string);
begin
  FKDEV_PEDIDO := Value;
end;

procedure TdtmDEVOLUCOES_Pedido.SetMaiorValorItemDesconto(ARateioEventType : TRateioEventType; APercent: double);
begin
   if ARateioEventType = retMaior then
   FKItemMaiorValor := cdsItensPedidoKDEV_PEDIDO_ITEM.asString ;
end;

procedure TdtmDEVOLUCOES_Pedido.SetMaiorValorItemFrete(ARateioEventType : TRateioEventType; APercent: double);
begin
   if ARateioEventType = retMaior then
   FKItemMaiorValor := cdsItensPedidoKDEV_PEDIDO_ITEM.asString ;
end;

procedure TdtmDEVOLUCOES_Pedido.SetMaiorValorItemImposto(ARateioEventType : TRateioEventType; APercent: double);
begin
   if ARateioEventType = retMaior then
     FKItemMaiorValor := cdsItensPedidoKDEV_PEDIDO_ITEM.asString ;
end;

procedure TdtmDEVOLUCOES_Pedido.SetParams;
begin
  cdsDevolucoes.Params.ParamByName( 'KSYS$DOMAIN' ).asString  := LoggedUser.DomainID ;


  cdsDevolucoes.Params.ParamByName( 'DSP_INATIVO'  ).asString  := BoolToChar ( FShowInativos ) ;
  cdsDevolucoes.Params.ParamByName( 'DATAINI' ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataInicial ) ;
  cdsDevolucoes.Params.ParamByName( 'DATAFIM' ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFinal ) ;

  if FKDEV_PEDIDO = '' then
     cdsDevolucoes.Params.ParamByName ( 'LISTALL' ).asString := 'T'
  else
     cdsDevolucoes.Params.ParamByName ( 'LISTALL' ).asString := 'F' ;

  cdsDevolucoes.Params.ParamByName ( 'KDEV_PEDIDO' ).asString := FKDEV_PEDIDO ;

end;

procedure TdtmDEVOLUCOES_Pedido.sqlDevolucaoBeforeOpen(DataSet: TDataSet);
begin
  FSQLDevolucoesRequiredField := sqlDevolucao.RequiredFields.Required ( False ) ;
end;

function TdtmDEVOLUCOES_Pedido.ValidaCampos: Boolean;
var
	cds: TClientDataSet;
  FieldName : string;
begin
  Result := true;
  cds := TClientDataSet.Create(nil);
  cds.PacketRecords := 0 ;
  cds.CloneCursor(cdsItensPedido, false, false);

  cdsItensPedido.DisableControls;
  try
    cds.First;
    while not cds.Eof do
    begin
      if cds.FieldByName('DESCR_PC_NOME').IsNull then
          Result := false;

      cds.Next;
    end;

    cds.Close;
  finally
    cds.Free;
  end;
  cdsItensPedido.EnableControls;
end;

procedure TdtmDEVOLUCOES_Pedido.ValidNF;
begin
  if   ( cdsDevolucaoKCAD_ENTIDADE.IsNull )
    or ( cdsDevolucaoNOTA_FISCAL.isNull   )
    or ( Trim ( cdsDevolucaoNOTA_FISCAL.AsString ) = '' ) then
     exit ;

  if TSQLSuppl.CheckExistsIn(    'DEV_PEDIDOS',
                                 'KCAD_ENTIDADE;NOTA_FISCAL;SERIE',   VarArrayOf( [ cdsDevolucaoKCAD_ENTIDADE.asString, cdsDevolucaoNOTA_FISCAL.asString, cdsDevolucaoSERIE.asString ] ),
                                 Format ( 'KDEV_PEDIDO <> %s ', [ QuotedStr( cdsDevolucaoKDEV_PEDIDO.asString ) ] ),
                                 TSQLConnection ( DBResources[ 'FINANCEIRO' ].Connection ) ) then
        Raise Warning.Create( _ERRMSG_NOTA_JA_CADASTRADA ) ;
end;

procedure TdtmDEVOLUCOES_Pedido.SetCFOP(Key, Descricao: string);
begin
   //cdsItensPedidoCFOP_DESCR.asString  := Descricao ;
  if not ( cdsItensPedido.State in [dsInsert, dsEdit] ) then
    cdsItensPedido.Edit;
   cdsItensPedidoCFOP.asString := Key ;
end;

procedure TdtmDEVOLUCOES_Pedido.SetCFOP_ESTOQUE(Key, Descricao: string);
begin
   //cdsItensPedidoCFOP_DESCR.asString  := Descricao ;
  if not ( cdsItensPedido.State in [dsInsert, dsEdit] ) then
    cdsItensPedido.Edit;
   cdsItensPedidoCFOP_ESTOQUE.asString := Key ;
end;

procedure TdtmDEVOLUCOES_Pedido.SetCOMPRADOR(Key: String;
  NomeCOMPRADOR: string);
begin
   if not ( cdsDevolucao.State in [dsInsert,dsEdit] ) then
      cdsDevolucao.Edit ;

//   cdsDevolucaoNOMECOMPRADOR.asString := NomeCOMPRADOR ;
//   cdsDevolucaoKCOMPRADOR.asInteger := Key ;
end;

procedure TdtmDEVOLUCOES_Pedido.SetConta(KFIN_CONTA, NOME: string);
begin
   if not ( cdsParcelas.State in [dsInsert,dsEdit] ) then
      cdsParcelas.Edit ;

   cdsParcelasKFIN_CONTA.AsString := KFIN_CONTA;
   cdsParcelasNOMECONTA.AsString  := NOME;
end;

procedure TdtmDEVOLUCOES_Pedido.SetContaPreferencia(KFIN_CONTA, NOME: string);
begin
  if not ( cdsAReceber.State in [ dsInsert, dsEdit ] ) then
    cdsAReceber.Edit ;

  FKContaPadrao := KFIN_CONTA;
  FNomeConta    := NOME;
  cdsAReceberNOMECONTA.AsString       := FNomeConta;
  cdsAReceberKFIN_CONTA_PREF.AsString := FKContaPadrao;
end;

procedure TdtmDEVOLUCOES_Pedido.SetContaPreferenciaTransporte(KFIN_CONTA,
  NOME: string);
begin
  if not ( cdsAPagarTransporte.State in [ dsInsert, dsEdit ] ) then
    cdsAPagarTransporte.Edit ;

  FKContaPadrao := KFIN_CONTA;
  FNomeConta    := NOME;
  cdsAPagarTransporteNOMECONTA.AsString       := FNomeConta;
  cdsAPagarTransporteKFIN_CONTA_PREF.AsString := FKContaPadrao;
end;

procedure TdtmDEVOLUCOES_Pedido.SetContato(Key: String;
  NomeContato : string ; Depto : string = '' ; Email : string = '' ; Fone  : string = '' ) ;
begin
   if not ( cdsDevolucao.State in [dsInsert,dsEdit] ) then
      cdsDevolucao.Edit ;
{
   cdsDevolucaoNOMECONTATO.asString := NomeContato ;
   cdsDevolucaoDepto.asString := Depto ;
   if ( Email <> '' ) then
      cdsDevolucaoEmail.asString := Email ;
   if ( Fone <> '' ) then
      cdsDevolucaoFone.asString := Fone ;
   cdsDevolucaoKCAD_CONTATO.asInteger := Key ;
}
end;

procedure TdtmDEVOLUCOES_Pedido.SetContaTransporte(KFIN_CONTA, NOME: string);
begin
   if not ( cdsParcelasTransporte.State in [dsInsert,dsEdit] ) then
      cdsParcelasTransporte.Edit ;

   cdsParcelasTransporteKFIN_CONTA.AsString := KFIN_CONTA;
   cdsParcelasTransporteNOMECONTA.AsString  := NOME;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsItensPedidoCalcFields(DataSet: TDataSet);
var
  LQtdeCompra : double ;
  LQtde : double ;
begin

  if (DataSet.State = dsInternalCalc) then
    begin
      cdsItensPedidoCODIGO_NOME.OnSetText := nil ;
      cdsItensPedidoCODIGO_NOME.asString  := cdsItensPedidoCODIGO.AsString + ' - ' + cdsItensPedidoNOME.AsString ;
      cdsItensPedidoCODIGO_NOME.OnSetText := cdsItensPedidoCODIGO_NOMESetText ;
      exit ;
    end;


  if not ( DataSet.State in [dsInsert,dsEdit] ) or ( DataSet.IsEmpty ) then
    Exit ;

  cdsItensPedido.OnCalcFields := nil ;

  LQtdeCompra :=  cdsItensPedidoQTDE_COMPRA.AsFloat ;
  if LQtdeCompra = 0 then
     LQtdeCompra :=  1 ;

  LQtde :=  cdsItensPedidoQTDE.AsFloat ;
  if LQtde = 0 then
     LQtde :=  LQtdeCompra ;

  if cdsItensPedidoQTDE.IsNull
  and ( cdsItensPedidoQTDE_COMPRA.AsFloat > 0  )  then
    cdsItensPedidoQTDE.AsFloat := cdsItensPedidoQTDE_COMPRA.AsFloat ;

  cdsItensPedidoVALOR_UNITARIO.asFloat :=  cdsItensPedidoUNITARIO_COMPRA.asFloat * (LQtdeCompra / LQtde) ;

  cdsItensPedidoVALOR_PARCIAL.asFloat := cdsItensPedidoQTDE.asFloat
                                 * cdsItensPedidoVALOR_UNITARIO.asFloat ;

  cdsItensPedidoTOTAL.asFloat   := cdsItensPedidoVALOR_PARCIAL.asFloat
                                 - cdsItensPedidoDESCONTO.asFloat  ;
                                // + cdsItensPedidoFRETE.asFloat ;

  cdsItensPedidoCUSTO.asFloat   := cdsItensPedidoVALOR_UNITARIO.asFloat
                                - (cdsItensPedidoDESCONTO.asFloat / LQtde )
                                + (cdsItensPedidoFRETE.asFloat    / LQtde )
                                + ( cdsItensPedidoVALOR_IPI.AsFloat / LQtde );

  cdsItensPedido.OnCalcFields   := cdsItensPedidoCalcFields ;

  CalculaTotaisPedido ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsItensPedidoCODIGO_NOMESetText(Sender: TField;
  const Text: string);
begin
  Sender.asString := Text ;
  LimpaProduto ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsItensPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsItensPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
begin

  with cdsApropriacaoItem do
    begin
      First;
      while not Eof do
        Delete;
    end;

  cdsItensPedidoKFIN_PLANOCONTA.Clear;
  Sender.asString := Text ;
end;


procedure TdtmDEVOLUCOES_Pedido.cdsItensPedidoNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsItensPedidoKDEV_PEDIDO_ITEM ) ;
   cdsItensPedidoVALOR_UNITARIO.asFloat := 0 ;
  cdsItensPedidoVALOR_PARCIAL.asFloat := 0 ;
  cdsItensPedidoVALOR_IPI.AsFloat := 0;
  cdsItensPedidoFRETE.asFloat := 0 ;
  cdsItensPedidoDESCONTO.asFloat := 0 ;

//    cdsItensPedidoCFOP.asString;
    cdsItensPedidoQTDE_COMPRA.asFloat := 0 ;
//    cdsItensPedidoUNIDADE_COMPRA.asString  := ;
    cdsItensPedidoUNITARIO_COMPRA.asFloat  := 0 ;
    cdsItensPedidoATUALIZAR_CUSTO.asString := 'T' ;


//  cdsItensPedidoIMPOSTO.asFloat := 0 ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsItensPedidoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  LValidatePlanoContas := True ;
  ValorLinhaItensParcial := 0 ;
  ValorLinhaItensTotal := 0 ;
  ValorLinhaItensTotalIPI := 0;
  if cdsDevolucao.isEmpty and not (cdsDevolucao.State in [dsInsert,dsEdit]) then
     cdsDevolucao.Append ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsItensPedidoBeforePost(DataSet: TDataSet);
var
  LErrMsg : TStringBuilder ;
begin

  if FDisableCheckItems then
    exit ;

  LErrMsg := TStringBuilder.Create ;

  if ( ( cdsItensPedidoQTDE.IsNull ) or ( cdsItensPedidoQTDE.AsString = '' )
   and ( cdsItensPedidoVALOR_UNITARIO.IsNull or ( cdsItensPedidoVALOR_UNITARIO.AsString = '' )) )then
    LErrMsg.AppendLine('Quantidade e valor deve ser digitado');

//  if ( ( cdsItensPedidoQTDE.IsNull ) or ( cdsItensPedidoQTDE.AsString = '' )
//   and ( cdsItensPedidoCUSTO.IsNull or ( cdsItensPedidoCUSTO.AsString = '' )) )then
//    LErrMsg.AppendLine('Quantidade e custo deve ser digitado');

  if LValidatePlanoContas and cdsItensPedidoKFIN_PLANOCONTA.IsNull then
    LErrMsg.AppendLine('Conta contábil deve ser pesquisada/selecionada.');

  try
    if LErrMsg.Length > 0 then
       raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;

end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if cdsDevolucoes.isEmpty and not ( cdsDevolucoes.State in [dsInsert,dsEdit] ) then
     cdsDevolucoes.Append ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoBeforeOpen(DataSet: TDataSet);
begin
  FCDSDevolucoesRequiredField := cdsDevolucao.RequiredFields.Required ( False ) ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoBeforePost(DataSet: TDataSet);
{var
	cds: TClientDataSet;
	i: integer;
  FieldName : string;  }
begin
  //  CdsClone := TClientDataSet.Create(Application);
 { cds := TClientDataSet.Create(nil);
  cds.PacketRecords := 0 ;
  cds.CloneCursor(cdsItensPedido, false, false);

  cdsItensPedido.DisableControls;
  try
    cds.First;
    while not cds.Eof do
    begin
      if cds.FieldByName('DESCR_PC_NOME').IsNull then
          raise Warning.Create('Conta contábil obrigatória para os Ítens (Produto)');

      cds.Next;
    end;

    cds.Close;
  finally
    cds.Free;
  end;
  cdsItensPedido.EnableControls;  }
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoNOMEENTIDADESetText(Sender: TField; const Text: string);
begin
  cdsDevolucaoKCAD_ENTIDADE.Clear ;
  Sender.asString := Text ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoNOTA_FISCALValidate(Sender: TField);
begin
  ValidNF ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoNOMECONTATOValidate(Sender: TField);
begin
  inherited;
//  cdsDevolucaoKCAD_CONTATO.Clear ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoNOMECOMPRADORValidate(Sender: TField);
begin
  inherited;
//  cdsDevolucaoKCOMPRADOR.Clear ;
end;


procedure TdtmDEVOLUCOES_Pedido.CheckMesEncerrado;
var
  p : TParams ;
begin
  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString       := cdsDevolucaoKSYSDOMAIN.asString ;
  p.CreateParam( ftString, 'DATA',         ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( cdsDevolucaoDATA_EMISSAO.asDateTime ) ;
  try
    sqlDevolucao.SQLConnection.Execute ( 'EXECUTE PROCEDURE EST_CHECK_ENCERRAMENTO_MES ( :KSYS$DOMAIN, :DATA, ''F'' )', p )
  finally
    p.free ;
  end;
end;

procedure TdtmDEVOLUCOES_Pedido.CheckValorAReceber;
begin
  TCdsSuppl.PostIfNeed( cdsDevolucao );
  TCdsSuppl.PostIfNeed( cdsParcelas );
  TCdsSuppl.PostIfNeed( cdsParcelasTransporte );

  if ( RoundTo ( cdsDevolucaoDESCONTOS.AsFloat, -2 ) <> RoundTo ( TryVarToFloat ( cdsItensPedidoSomaDesconto.Value ), -2 ) ) then
    raise Warning.Create('Soma do desconto dos itens não confere com o valor do desconto') ;

  if ( RoundTo ( cdsDevolucaoFRETE.AsFloat, -2 ) <> RoundTo ( TryVarToFloat ( cdsItensPedidoSomaFrete.Value ), -2 ) ) then
    raise Warning.Create('Soma do frete dos itens não confere com o valor do frete') ;

  if cdsDevolucaoSYSORIGIN_TYPE.asInteger <> 2 then
    if ( cdsParcelas.IsEmpty ) then
      raise Warning.Create('Não é possível salvar o pedido sem gerar o contas a receber.');

  if cdsDevolucaoSYSORIGIN_TYPE.asInteger <> 2 then
    if ( Abs( RoundTo ( cdsDevolucaoTOTAL_NOTA.AsFloat, -2 )
            - RoundTo ( TryVarToFloat ( cdsParcelasSomaValor.Value ), -2 )
            ) > 0.01 ) then
      raise Warning.Create('Total das parcelas não confere com o total da nota');

  cdsParcelas.DisableControls;
  cdsParcelas.First;
  try
    while not cdsParcelas.Eof do
      begin
        if ( cdsParcelasKFIN_CONTA.IsNull ) or ( cdsParcelasKFIN_CONTA.AsString = EmptyStr ) then
          begin
            if cdsAReceberKFIN_CONTA_PREF.asString <> '' then
             begin
              cdsParcelas.Edit;
              cdsParcelasKFIN_CONTA.asString := cdsAReceberKFIN_CONTA_PREF.asString ;
              cdsParcelasNOMECONTA.asString  := cdsAReceberNOMECONTA.asString ;
              cdsParcelas.Post;
             end
            else
              raise Warning.Create('Existe parcela(s) sem conta definida');
          end ;
        cdsParcelas.Next;
      end;
  finally
    cdsParcelas.First;
    cdsParcelas.EnableControls;
  end;

  if    ( cdsDevolucaoFrete.AsFloat = 0 )
    and ( TryVarToFloat ( cdsItensPedidoSomaFrete.Value ) = 0 )
    and ( cdsParcelasTransporte.IsEmpty ) then
    begin
     if not cdsApagarTransporte.IsEmpty then
        cdsApagarTransporte.Delete ;
     exit ;
    end;


  if ( cdsParcelasTransporte.IsEmpty ) then
    raise Warning.Create('Não é possível salvar o pedido sem gerar o pagamento do transporte.');


  if ( RoundTo ( cdsDevolucaoFRETE.AsFloat, -2 ) <> RoundTo ( TryVarToFloat ( cdsParcelasTransporteSomaValor.Value ), -2 ) ) then
    raise Warning.Create('Total das parcelas de transporte não confere com o valor do frete');

  cdsParcelasTransporte.DisableControls;
  try
    cdsParcelasTransporte.First;
    while not cdsParcelasTransporte.Eof do
      begin
        if ( cdsParcelasTransporteKFIN_CONTA.IsNull ) or ( cdsParcelasTransporteKFIN_CONTA.AsString = EmptyStr ) then
          raise Warning.Create('Existe parcela(s) de transporte sem conta definida');

        cdsParcelasTransporte.Next;
      end;
  finally
    cdsParcelasTransporte.First;
    cdsParcelasTransporte.EnableControls;
  end;

end;

procedure TdtmDEVOLUCOES_Pedido.ClonePedido;
var
  Clone : TClientDataSet ;

   procedure copyHeader ;
   begin
      cdsDevolucoes.Append ;
      cdsDevolucao.Append ;

      SetEntidade ( Clone.fieldByName ( 'KCAD_ENTIDADE' ).asString,
                    Clone.fieldByName ( 'NOMEENTIDADE' ).asString ) ;

      SetContato(   Clone.fieldByName ( 'KCAD_CONTATO' ).asString,
                    Clone.fieldByName ( 'NOMECONTATO' ).asString,
                    Clone.fieldByName ( 'DEPTO' ).asString,
                    Clone.fieldByName ( 'EMAIL' ).asString,
                    Clone.fieldByName ( 'FONE' ).asString ) ;

      cdsDevolucaoOBS.asString                   :=  Clone.fieldByName ( 'OBS' ).asString            ;
//      cdsDevolucaoVALIDADE.asInteger            :=  Clone.fieldByName ( 'VALIDADE' ).asInteger      ;
      cdsDevolucao.Post ;
   end ;

   procedure  CopyItensPedido ( DataSet : TDataSet ) ;
   begin
      with DataSet do
         begin
            cdsItensPedido.Append ;
            if (fieldByName ( 'KEST_PRODUTO' ).asString <> '') then
              cdsItensPedidoKEST_PRODUTO.asString       := fieldByName ( 'KEST_PRODUTO' ).asString  ;
            cdsItensPedidoCODIGO.asString             := fieldByName ( 'CODIGO' ).asString        ;
            cdsItensPedidoNOME.asString               := fieldByName ( 'NOME' ).asString          ;
            cdsItensPedidoUNIDADE.asString            := fieldByName ( 'UNIDADE' ).asString       ;
            cdsItensPedidoQTDE.asFloat                := fieldByName ( 'QTDE' ).asFloat           ;
            cdsItensPedidoTOTAL.asFloat               := fieldByName ( 'TOTAL' ).asFloat          ;
            cdsItensPedidoCUSTO.asFloat               := fieldByName ( 'CUSTO' ).asFloat          ;
            cdsItensPedidoOBS.asString                := fieldByName ( 'OBS' ).asString           ;
//            cdsItensPedidoADICIONAL.asString          := fieldByName ( 'ADICIONAL' ).asString     ;
            cdsItensPedidoDETALHES.asString           := fieldByName ( 'DETALHES' ).asString      ;
            cdsItensPedido.Post ;
         end ;
   end ;

   procedure  CopyProdutos ;
   begin
      with TDataSetField ( Clone.fieldByName ( 'sqlItensPedido' ) ), NestedDataSet do
         begin
            First ;
            While not eof do
               begin
                   CopyItensPedido ( NestedDataSet ) ;
                   Next ;
               end ;
         end ;
   end ;


begin

   Clone := TClientDataSet.Create ( nil ) ;
   Clone.SetProvider( cdsDevolucao ) ;
   Clone.Open ;

   copyHeader ;
   copyProdutos ;

   Clone.Close ;
   Clone.Free ;

end;

procedure TdtmDEVOLUCOES_Pedido.EditItem;
begin
  cdsItensPedido.Edit ;
end;


procedure TdtmDEVOLUCOES_Pedido.GetContaFavorita;
const
  SQL_CONTA_FAVORITA = 'SELECT C.KFIN_CONTA, C.NOME FROM FIN_CONTAS C'
                +#13#10' INNER JOIN SYS$DOMAIN_TYPES T ON T.SYS$VALUE = C.KFIN_CONTA AND T.SYS$TYPE = ''%s''';
var
  cds: TClientDataSet;
begin
  cds := nil;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet(cds, Format(SQL_CONTA_FAVORITA,['CONTA_FAVORITA']));
  FKContaFavorita    := cds.FieldByName('KFIN_CONTA').AsString;
  FNomeContaFavorita := cds.FieldByName('NOME').AsString;
  cds.Free;
end;

procedure TdtmDEVOLUCOES_Pedido.InitPlanoContaEstoque;
const
 _SELECT_PLANOESTOQUE =
    'SELECT KFIN_PLANOCONTA FROM FIN_PLANOCONTAS WHERE KDEF_PLANOCONTA = ''XpnViioBT#Osw}pC86v:'' '
    +#13#10' AND TIPO_PLANOCONTAS = COALESCE(NULLIF(GEN_ID(TIPO_PLANOCONTAS,0),0),-3) ' ;
var
  cds : TClientDataSet ;
begin
  cds := nil ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SELECT_PLANOESTOQUE ) ;
  FK_PLANOESTOQUE := cds.FieldByName( 'KFIN_PLANOCONTA' ).asString ;
  cds.Free ;
end;


procedure TdtmDEVOLUCOES_Pedido.OpenPedido(KPedido: String);
var
  i : integer ;
begin
   if cdsDevolucao.Active then
      cdsDevolucao.Close ;

   cdsDevolucao.MasterFields  := '' ;
   cdsDevolucao.MasterSource  := nil ;
   cdsDevolucao.PacketRecords := -1 ;
   cdsDevolucao.Params.ParamByName( 'KDEV_PEDIDO' ).asString := KPedido ;
   TCDSSuppl.Open ( cdsDevolucao ) ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsAReceberNewRecord(DataSet: TDataSet);
begin
  inherited;

  GetContaFavorita ;

  cdsAReceberKFIN_ARECEBER.AsString   := cdsDevolucaoKFIN_ARECEBER.AsString ;
  cdsAReceberKSYSDOMAIN.AsString  := LoggedUser.DomainID;
  cdsAReceberTABLENAME.asString     := 'DEV_PEDIDOS' ;
  cdsAReceberTABLEKEY.AsString      := cdsDevolucaoKDEV_PEDIDO.AsString ;
  cdsAReceberATIVO.asString         := 'T' ;
  cdsAReceberKCAD_ENTIDADE.AsString := cdsDevolucaoKCAD_ENTIDADE.AsString ;
  cdsAReceberNOMEENTIDADE.asString  := cdsDevolucaoNOMEENTIDADE.asString ;
  cdsAReceberDATALANCTO.AsDateTime  := cdsDevolucaoDATA_EMISSAO.AsDateTime ;
  cdsAReceberHISTORICO.asString     := Format( 'Nota fiscal de devolução: (%s)', [ cdsDevolucaoNOTA_FISCAL.AsString ] ) ;
  cdsAReceberDOCUMENTO.AsString     := cdsDevolucaoNOTA_FISCAL.AsString ;
  cdsAReceberNUM_PARCELAS.AsInteger := 1 ;
  cdsAReceberPROXIMO_MES.AsString   := 'F' ;
  cdsAReceberANUAL.AsString         := 'F' ;
  cdsAReceberRECORRENCIA.AsString   := 'F' ;
  cdsAReceberDIA_VENCTO.AsInteger   := 1 ;
  cdsAReceberPAGTO_AVISTA.asString := 'F' ;

  if FKContaFavorita <> '' then
   begin
     FKContaPadrao := FKContaFavorita;
     FNomeConta    := FNomeContaFavorita;
   end
  else
   begin
     FKContaPadrao := '' ;
     FNomeConta    := '' ;
   end;
  cdsAReceberKFIN_CONTA_PREF.AsString := FKContaPadrao;
  cdsAReceberNOMECONTA.AsString := FNomeConta;

end;

procedure TdtmDEVOLUCOES_Pedido.cdsAReceberNOMECONTASetText(Sender: TField; const Text: string);
begin
//  FKContaPadrao := '';
//  FNomeConta    := '';
//  cdsAReceberKFIN_CONTA_PREF.Clear;
  Sender.asString := Text ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsAReceberPAGTO_AVISTAChange(Sender: TField);
begin
 cdsAReceberPAGTO_AVISTA.OnChange := nil ;
 try
   //if Sender.asBoolean then
     PagamentoAVista;
 finally
     cdsAReceberPAGTO_AVISTA.OnChange := cdsAReceberPAGTO_AVISTAChange
 end;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsAPagarTransporteNewRecord(DataSet: TDataSet);
begin
  cdsApagarTransporteKFIN_APAGAR.AsString   := cdsDevolucaoKFIN_APAGAR_TRANSPORTE.AsString ;
  cdsApagarTransporteKSYSDOMAIN.AsString  := LoggedUser.DomainID;
  cdsApagarTransporteTABLENAME.asString     := 'DEV_PEDIDOS' ;
  cdsApagarTransporteTABLEKEY.AsString      := cdsDevolucaoKDEV_PEDIDO.AsString ;
  cdsApagarTransporteATIVO.asString         := 'T' ;
//  cdsApagarTransporteKCAD_ENTIDADE.AsString := cdsDevolucaoKCAD_ENTIDADE.AsString ;
//  cdsApagarTransporteNOMEENTIDADE.asString  := cdsDevolucaoNOMEENTIDADE.asString ;
  cdsApagarTransporteDATALANCTO.AsDateTime  := cdsDevolucaoDATA_EMISSAO.AsDateTime ;
  cdsApagarTransporteHISTORICO.asString     := Format( 'Transporte - Nota fiscal de devolução: (%s)', [ cdsDevolucaoNOTA_FISCAL.AsString ] ) ;
  cdsApagarTransporteDOCUMENTO.AsString     := cdsDevolucaoNOTA_FISCAL.AsString ;
  cdsApagarTransporteNUM_PARCELAS.AsInteger := 1 ;
  cdsApagarTransportePROXIMO_MES.AsString   := 'F' ;
  cdsApagarTransporteANUAL.AsString         := 'F' ;
  cdsApagarTransporteRECORRENCIA.AsString   := 'F' ;
  cdsApagarTransportePAGTO_AVISTA.asString := 'F' ;
  cdsApagarTransporteDIA_VENCTO.AsInteger   := 1 ;
  cdsAPagarTransporteKFIN_CONTA_PREF.AsString := FKContaPadrao;
  cdsAPagarTransporteNOMECONTA.AsString := FNomeConta;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsAPagarTransporteNOMECONTASetText(Sender: TField;
  const Text: string);
begin
//  FKContaPadrao := '';
//  FNomeConta    := '';
  cdsAReceberKFIN_CONTA_PREF.Clear;
  Sender.asString := Text ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsApropriacaoItemNewRecord(DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoItemKFIN_APROPRIACAO );
  cdsApropriacaoItemTABLENAME.AsString := 'DEV_PEDIDO_ITENS';
  cdsApropriacaoItemTABLEKEY.AsString  := cdsItensPedidoKDEV_PEDIDO_ITEM.AsString;
end;


procedure TdtmDEVOLUCOES_Pedido.cdsParcelasNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsParcelasKFIN_ARECEBER_PARCELA ) ;
  cdsParcelasKFIN_ARECEBER.asString := cdsAReceberKFIN_ARECEBER.asString ;
  cdsParcelasPREVISAO.asString  := 'T' ;
  cdsParcelasDUVIDOSO.asString  := 'F' ;
  cdsParcelasCHEQUE.asString    := 'F' ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
begin
  if Sender.AsString <> FNomeConta then
    begin
      if not( cdsParcelas.State in [dsInsert, dsEdit] ) then
        cdsParcelas.Edit;

      FKContaPadrao := '';
      FNomeConta    := '';
      cdsParcelasKFIN_CONTA.Clear;
    end;
  Sender.asString := Text ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasNUM_CHEQUESetText(Sender: TField;
  const Text: string);
begin
  if Text.Trim = '' then
   begin
    cdsParcelasNUM_CHEQUE.Clear ;
    cdsParcelasCHEQUE.asString := 'F' ;
   end
  else
   begin
    cdsParcelasNUM_CHEQUE.asString := Text ;
    cdsParcelasCHEQUE.asString := 'T' ;
   end;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasTransporteBeforeDelete(
  DataSet: TDataSet);
begin
  if not cdsParcelasTransportePAGTO.IsNull then
    raise Warning.Create('Não pode excluir parcela já baixada');
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasTransporteBeforeEdit(DataSet: TDataSet);
begin
  if not cdsParcelasTransportePAGTO.IsNull then
    raise Warning.Create('Não pode editar parcela já baixada');
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasTransporteBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsApagarTransporte.IsEmpty ) and not ( cdsApagarTransporte.State in [dsInsert,dsEdit] )  then
     cdsApagarTransporte.Append ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasTransporteBeforePost(
  DataSet: TDataSet);
begin
  if (( cdsAPagarTransportePAGTO_AVISTA.AsBoolean ) and ( cdsParcelasTransporteCHEQUE.AsBoolean )) or
     (( not cdsParcelasTransporteCHEQUE.AsBoolean ) and ( cdsParcelasTransportePAGTO.IsNull))  then
     cdsParcelasTransporteDT_COMPENSACAO.Clear;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasTransporteCalcFields(DataSet: TDataSet);
begin
//
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasTransporteCHEQUEChange(
  Sender: TField);
begin
  if cdsParcelasTransporteCHEQUE.asBoolean then
      cdsParcelasTransporteDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasTransporteDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasPAGTO.AsSQLTimeStamp ;
      cdsParcelasTransporteNUM_CHEQUE.Clear ;
    end ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasTransporteNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsParcelasTransporteKFIN_APAGAR_PARCELA ) ;
  cdsParcelasTransporteKFIN_APAGAR.asString := cdsAPagarTransporteKFIN_APAGAR.asString ;
  cdsParcelasTransportePREVISAO.asString  := 'T' ;
  cdsParcelasTransporteDUVIDOSO.asString  := 'F' ;
  cdsParcelasTransporteCHEQUE.AsString := 'F';
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasTransporteNOMECONTASetText(
  Sender: TField; const Text: string);
begin
  cdsParcelasTransporteKFIN_CONTA.Clear;
  Sender.asString := Text ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasTransporteNUM_CHEQUESetText(
  Sender: TField; const Text: string);
begin
  if Text.Trim = '' then
   begin
    cdsParcelasTransporteNUM_CHEQUE.Clear ;
    cdsParcelasTransporteCHEQUE.asString := 'F' ;
   end
  else
   begin
    cdsParcelasTransporteNUM_CHEQUE.asString := Text ;
    cdsParcelasTransporteCHEQUE.asString := 'T' ;
   end;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasVENCTOChange(Sender: TField);
begin
  if FKContaPadrao <> EmptyStr then
    begin
      cdsParcelasKFIN_CONTA.AsString := FKContaPadrao;
      cdsParcelasNOMECONTA.AsString  := FNomeConta;
    end;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasBeforeDelete(DataSet: TDataSet);
begin
  if not cdsParcelasPAGTO.IsNull then
    raise Warning.Create('Não pode excluir parcela já baixada');
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasBeforeEdit(DataSet: TDataSet);
begin
  if ( not cdsParcelasPAGTO.IsNull ) and ( cdsAReceberPAGTO_AVISTA.AsString <> 'T' ) then
    raise Warning.Create('Não pode editar parcela já baixada');
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsAReceber.IsEmpty ) and not ( cdsAReceber.State in [dsInsert,dsEdit] )  then
     cdsAReceber.Append ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasBeforePost(DataSet: TDataSet);
begin

  if (( cdsAReceberPAGTO_AVISTA.AsBoolean ) and ( cdsParcelasCHEQUE.AsBoolean )) or
     (( not cdsParcelasCHEQUE.AsBoolean ) and ( cdsParcelasPAGTO.IsNull))  then
     cdsParcelasDT_COMPENSACAO.Clear;

end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasCalcFields(DataSet: TDataSet);
begin
//
end;

procedure TdtmDEVOLUCOES_Pedido.cdsParcelasCHEQUEChange(Sender: TField);
begin
  if cdsParcelasCHEQUE.asBoolean then
      cdsParcelasDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasPAGTO.AsSQLTimeStamp ;
      cdsParcelasNUM_CHEQUE.Clear ;
    end ;
end;



procedure TdtmDEVOLUCOES_Pedido.cdsItensPedidoAfterCancel(DataSet: TDataSet);
begin
  ValorLinhaItensParcial := 0 ;
  ValorLinhaItensTotal := 0 ;
  ValorLinhaItensTotalIPI := 0;
  CalculaTotaisPedido ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsItensPedidoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  ValorLinhaItensParcial := 0 ;
  ValorLinhaItensTotal := 0 ;
  ValorLinhaItensTotalIPI := 0;
  CalculaTotaisPedido ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsItensPedidoBeforeEdit(DataSet: TDataSet);
begin
  LValidatePlanoContas := True ;
  ValorLinhaItensParcial := cdsItensPedidoVALOR_PARCIAL.asFloat ;
  ValorLinhaItensTotal := cdsItensPedidoTOTAL.asFloat ;
  ValorLinhaItensTotalIPI := cdsItensPedidoVALOR_IPI.AsFloat;
end;


procedure TdtmDEVOLUCOES_Pedido.ApplyUpdates;
begin

  if not ValidaCampos then
    raise Warning.Create('Conta contábil obrigatória para os Ítens (Produto)') ;


  if ( cdsAReceberPAGTO_AVISTA.AsBoolean ) then
    begin
      if ( cdsParcelasCHEQUE.AsBoolean ) and ( cdsParcelasNUM_CHEQUE.IsNull ) then
         raise Warning.Create('Número de cheque é obrigatório para pagamento à vista com cheque')
      else
      if ( not cdsParcelasCHEQUE.AsBoolean ) and ( not cdsParcelasNUM_CHEQUE.IsNull ) then
         raise Warning.Create('Número do cheque não pode estar preenchido para pagamentos à vista sem cheque')
      else
      if cdsParcelas.RecordCount > 1 then
         raise Warning.Create('Apenas 1 parcela pode ser inserida para pagamentos à vista')
    end
  else
    begin
      if ( cdsParcelasCHEQUE.AsBoolean ) or ( not cdsParcelasNUM_CHEQUE.IsNull ) then
         raise Warning.Create('Cheque só pode ser inserido para pagamentos à vista')
    end;


  if cdsProdutosFornecedor.Active and not cdsProdutosFornecedor.IsEmpty then
   begin
    TCDSSuppl.ApplyUpdates( cdsProdutosFornecedor ) ;
    cdsProdutosFornecedor.EmptyDataSet ;
   end;

  inherited;
end;

procedure TdtmDEVOLUCOES_Pedido.CalcularParcelas( ADiaDaParcela : integer ; ATotalParcelas : integer ; AProximoMes, AAnual : boolean ) ;
var
  i : Integer;
  Vencto_mes : TDateTime ;
  LValorParcela, LDiferenca  :Double;
//  totalParcelas : Double;
  LTotalPedido : double ;
begin
//  totalParcelas := 0;

  if ATotalParcelas = 0 then
    ATotalParcelas := 1 ; //*****------

  if cdsParcelas.State in [dsInsert,dsEdit] then
     cdsParcelas.Cancel ;

  LTotalPedido := RoundTo( cdsDevolucaoTOTAL_NOTA.AsFloat, -2 ) ;

  if not cdsParcelas.IsEmpty then
    begin
      cdsParcelas.First;
      while not cdsParcelas.Eof do
        begin
          if not cdsParcelasPAGTO.IsNull then
            raise Warning.Create('Exite parcela(s) já baixada(s)');

          cdsParcelas.Delete;
        end;
    end;

  TCdsSuppl.PostIfNeed( cdsDevolucao );

  if not( cdsAReceber.State in [ dsInsert, dsEdit] ) then
    cdsAReceber.Edit;

  cdsAReceberHISTORICO.asString := Format( 'Nota fiscal de devolução: (%s)', [ cdsDevolucaoNOTA_FISCAL.AsString ] ) ;
  cdsAReceberDOCUMENTO.AsString := cdsDevolucaoNOTA_FISCAL.AsString ;

  if ADiaDaParcela <> 0 then
     Vencto_mes :=  DateUtils.StartOfTheMonth( cdsDevolucaoDATA_EMISSAO.AsDateTime ) + ADiaDaParcela - 1
  else
     Vencto_mes := DateUtils.StartOfTheDay( cdsDevolucaoDATA_EMISSAO.AsDateTime ) ;

  if AProximoMes then
     Vencto_mes := IncMonth( Vencto_mes, 1 ) ;

  LValorParcela  := RoundTo( LTotalPedido / ATotalParcelas, -2 );

  if not ( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
    cdsParcelas.Edit;

  for i := 0 to ATotalParcelas - 1 do
    begin
      cdsParcelas.Append;

      if Vencto_mes  < cdsDevolucaoDATA_EMISSAO.AsDateTime then
        cdsParcelasVENCTO.AsDateTime := cdsDevolucaoDATA_EMISSAO.AsDateTime
      else
        cdsParcelasVENCTO.AsDateTime := Vencto_mes ;

      cdsParcelasVALOR.AsFloat       := LValorParcela;

      if not ( cdsParcelasKFIN_CONTA.IsNull) or ( cdsParcelasKFIN_CONTA.AsString <> EmptyStr ) then
        begin
          cdsParcelasKFIN_CONTA.AsString := cdsParcelasKFIN_CONTA.AsString;
          cdsParcelasNOMECONTA.AsString  := cdsParcelasNOMECONTA.AsString;
        end;

      cdsParcelasPAGTO.Clear;
      if ( cdsParcelasCHEQUE.asBoolean ) or ( not cdsAReceberPAGTO_AVISTA.AsBoolean ) then
        cdsParcelasDT_COMPENSACAO.Clear;

      if AAnual then
        Vencto_mes := IncMonth( Vencto_mes, 12 )
      else
        Vencto_mes := IncMonth( Vencto_mes, 1 ) ;
    end;

//  totalParcelas := totalParcelas + cdsParcelasVALOR.AsFloat;
  cdsParcelas.Post;

  LDiferenca := LTotalPedido - RoundTo( TryVarToFloat ( cdsParcelasSomaValor.Value ), -2 ) ;
  if LDiferenca <> 0 then
    begin
      cdsParcelas.First;
      cdsParcelas.Edit;
      cdsParcelasVALOR.AsFloat := cdsParcelasVALOR.AsFloat + LDiferenca;
      cdsParcelas.Post;
    end;

  cdsParcelas.First;
  cdsParcelas.EnableControls;

end;

procedure TdtmDEVOLUCOES_Pedido.CalcularParcelasTransporte( ADiaDaParcela : integer ; ATotalParcelas : integer ; AProximoMes, AAnual : boolean ) ;
var
  i : Integer;
  Vencto_mes : TDateTime ;
  Parcela, FDiferenca  :Double;
  totalParcelasTransporte : Double;
begin
  totalParcelasTransporte := 0;

  if cdsParcelasTransporte.State in [dsInsert,dsEdit] then
     cdsParcelasTransporte.Cancel ;

  if not cdsParcelasTransporte.IsEmpty then
    begin
      cdsParcelasTransporte.First;
      while not cdsParcelasTransporte.Eof do
        begin
          if not cdsParcelasTransportePAGTO.IsNull then
            raise Warning.Create('Exite parcela(s) já baixada(s)');

          cdsParcelasTransporte.Delete;
        end;
    end;

  TCdsSuppl.PostIfNeed( cdsDevolucao );

  if not( cdsAPagarTransporte.State in [ dsInsert, dsEdit] ) then
    cdsAPagarTransporte.Edit;

  cdsAPagarTransporteHISTORICO.asString := Format( 'Transporte - Nota fiscal de devolução: (%s)', [ cdsDevolucaoNOTA_FISCAL.AsString ] ) ;
  cdsAPagarTransporteDOCUMENTO.AsString := cdsDevolucaoNOTA_FISCAL.AsString ;

  if ADiaDaParcela <> 0 then
     Vencto_mes :=  DateUtils.StartOfTheMonth( cdsDevolucaoDATA_EMISSAO.AsDateTime ) + ADiaDaParcela - 1
  else
     Vencto_mes :=  DateUtils.StartOfTheDay( cdsDevolucaoDATA_EMISSAO.AsDateTime ) ;

  if AProximoMes then
     Vencto_mes := IncMonth( Vencto_mes, 1 ) ;


  Parcela  := RoundTo( cdsDevolucaoFRETE.AsFloat / ATotalParcelas, -2 );

  if not ( cdsParcelasTransporte.State in [ dsInsert, dsEdit ] ) then
    cdsParcelasTransporte.Edit;

  for i := 0 to ATotalParcelas - 1 do
    begin
      cdsParcelasTransporte.Append;

      if Vencto_mes  < cdsDevolucaoDATA_EMISSAO.AsDateTime then
        cdsParcelasTransporteVENCTO.AsDateTime := cdsDevolucaoDATA_EMISSAO.AsDateTime
      else
        cdsParcelasTransporteVENCTO.AsDateTime := Vencto_mes ;

      cdsParcelasTransporteVALOR.AsFloat       := Parcela;

      if not ( cdsAPagarTransporteKFIN_CONTA_PREF.IsNull) or ( cdsAPagarTransporteKFIN_CONTA_PREF.AsString <> EmptyStr ) then
        begin
          cdsParcelasTransporteKFIN_CONTA.AsString := cdsAPagarTransporteKFIN_CONTA_PREF.AsString;
          cdsParcelasTransporteNOMECONTA.AsString  := cdsAPagarTransporteNOMECONTA.AsString;
        end;

      if AAnual then
        Vencto_mes := IncMonth( Vencto_mes, 12 )
      else
        Vencto_mes := IncMonth( Vencto_mes, 1 ) ;
    end;

  totalParcelasTransporte := totalParcelasTransporte + cdsParcelasTransporteVALOR.AsFloat;
  cdsParcelasTransporte.Post;

  if TryVarToFloat ( cdsParcelasTransporteSomaValor.Value ) <> cdsDevolucaoFRETE.AsFloat then
    begin
      FDiferenca := cdsDevolucaoFRETE.AsFloat - TryVarToFloat ( cdsParcelasTransporteSomaValor.Value ) ;
      cdsParcelasTransporte.First;
      cdsParcelasTransporte.Edit;
      cdsParcelasTransporteVALOR.AsFloat := cdsParcelasTransporteVALOR.AsFloat + FDiferenca;
      cdsParcelasTransporte.Post;
    end;

  cdsParcelasTransporte.First;
  cdsParcelasTransporte.EnableControls;
end;




procedure TdtmDEVOLUCOES_Pedido.CalculaTotais;
begin
  // Para recalcular o total da nota, o cdsDevolucao tem de entrar em modo de edicao
  if not ( cdsDevolucao.State in [ dsInsert, dsEdit ] ) then
    cdsDevolucao.Edit ;
end;

procedure TdtmDEVOLUCOES_Pedido.CalculaTotaisPedido;
var
   TotalValorIPI: Double;
begin
  cdsDevolucao.onCalcFields := nil ;
  SetRoundMode(rmNearest);
  try
    if ( cdsItensPedido.state in [ dsInsert,dsEdit ] ) then
      begin
      // ValorLinhaItensParceial ...
        cdsDevolucaoTOTAL_ITENS.asFloat    :=  RoundTo ( RoundTo(TryVarToFloat (cdsItensPedidoSomaTotal.Value),-2)  {TryVarToFloat ( cdsItensPedidoSomaTotal.Value )}
                                                      - ValorLinhaItensTotal
                                                      + RoundTo( cdsItensPedidoTOTAL.AsCurrency, -2), -4 );

        TotalValorIPI                   :=  RoundTo ( TryVarToFloat ( cdsItensPedidoSomaValorIPI.Value )
                                                      - ValorLinhaItensTotalIPI
                                                      + cdsItensPedidoVALOR_IPI.asFloat, -4 );
      end
    else if cdsItensPedido.IsEmpty then
      begin
        cdsDevolucaoTOTAL_ITENS.AsFloat := 0;
        TotalValorIPI                := 0;
      end
    else
      begin
        cdsDevolucaoTOTAL_ITENS.asFloat    := RoundTo ( TryVarToFloat ( cdsItensPedidoSomaTotal.Value ), -2 ) ;  {-4}
        TotalValorIPI                   := RoundTo ( TryVarToFloat ( cdsItensPedidoSomaValorIPI.Value ), -4 )
      end;


    cdsDevolucaoTOTAL_NOTA.asFloat       := RoundTo( (   cdsDevolucaoTOTAL_ITENS.AsCurrency

                                                    //+ cdsDevolucaoIMPOSTOS.AsFloat
                                                    //+ cdsDevolucaoFRETE.AsFloat )
                                                    //- cdsDevolucaoDESCONTOS.AsFloat
                                                    + TotalValorIPI
                                                    ), -2 ) ;
  finally
     cdsDevolucao.onCalcFields           := cdsDevolucaoCalcFields ;
  end ;
end;

procedure TdtmDEVOLUCOES_Pedido.CancelUpdates;
begin
  if cdsProdutosFornecedor.Active then
   begin
    cdsProdutosFornecedor.IsEmpty ;
    cdsProdutosFornecedor.Close ;
   end;
  inherited;

end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoAfterInsert(DataSet: TDataSet);
begin
  FCDSDevolucoesRequiredField.Required ( False ) ;
  cdsDevolucao.Post ;
  cdsAReceber.Append ;
  cdsAReceber.Post ;
  cdsDevolucao.Edit ;
  cdsAReceber.Edit ;
  FCDSDevolucoesRequiredField.Required ( True ) ;
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
  if not ( cdsDevolucao.IsEmpty ) and ( cdsDevolucaoTOTAL_NOTA.asFloat < 0.01 ) then
    Raise Warning.Create( _ERRMSG_TOTAL_ZERO );

//  if cdsDevolucaoTOTALPEDIDO.asFloat <> TryVarToFloat( cdsParcelasSomaValor.Value, -2 ) then
//     Raise Error.Create( _ERRMSG_TOTAL_APGAGAR );
end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoBeforeDelete(DataSet: TDataSet);
begin



  if cdsDevolucaoSYSORIGIN_TYPE.asInteger = 2 then
    raise Warning.Create( 'Devolução incluida via sincronismo.' + #10#13 + 'Não pode ser excluída.' );


  CheckMesEncerrado ;

  if ParcelaBaixada then
    raise Warning.Create( 'Existe(m) parcela(s) já baixada(s).' + #10#13 + 'Não pode ser excluída.' );

  if cdsAReceber.RecordCount > 0 then
    cdsAReceber.Delete;

end;

procedure TdtmDEVOLUCOES_Pedido.cdsDevolucaoBeforeEdit(DataSet: TDataSet);
begin

  CheckMesEncerrado ;

//  if ParcelaBaixada then
//    raise Warning.Create( 'Existe(m) parcela(s) já baixada(s).' + #10#13 + 'Compra não pode ser alterada.' );

  DataEmissao := cdsDevolucaoDATA_EMISSAO.AsDateTime;

  if not cdsAReceberKFIN_CONTA_PREF.IsNull then
    begin
      FKContaPadrao := cdsAReceberKFIN_CONTA_PREF.AsString;
      FNomeConta    := cdsAReceberNOMECONTA.AsString;
    end;
end;

{ TRateio }


procedure TRateio.DoEvent( AEvent : TRateioEventType );
begin
  if Assigned ( FOnEvent ) then
     FOnEvent ( AEvent, FPercent ) ;
end;

function TRateio.GetPercent: double;
begin
   Result := FPercent ;
end;

function TRateio.GetValorRateado: double;
begin
   Result := FValorRateado ;
end;

function TRateio.GetValorRatear: double;
begin
   Result := FValorRatear ;
end;

function TRateio.GetValorRestante: double;
begin
   Result := FValorRestante ;
end;

procedure TRateio.SetOnEvent(const Value: TRateioEvent);
begin
  FOnEvent := Value;
end;

procedure TRateio.SetPercent(const Value: double);
begin
  FPercent := Value ;
end;


procedure TRateio.SetValorRatear(const Value: double);
begin
   FMenorPercent  := 999 ;
   FMaiorPercent  := -1 ;
   FValorRatear   := Value ;
   FValorRestante := FValorRatear ;
   FPercent       := 1 ;
end;


function TRateio.Ratear(APercent: double): double;
begin
  FPercent := APercent ;
  Result := Ratear ;
end;

function TRateio.Ratear : double;
begin
  FValorRateado  := RoundTo ( FValorRatear * FPercent, -2 ) ;
  FValorRestante := FValorRestante - FValorRateado ;
  Result := FValorRateado ;

  if FPercent > FMaiorPercent then
    begin
      FMaiorPercent := FPercent ;
      DoEvent( retMaior );
    end ;

  if FPercent < FMenorPercent then
    begin
      FMenorPercent := FPercent ;
      DoEvent( retMenor );
    end ;
end;

(*
  SELECT
   KEST_PRODUTO_FORNECEDOR,
   KEST_PRODUTO,
   KCAD_FORNECEDOR,
   CODIGO,
   NOME
  FROM EST_PRODUTO_FORNECEDORES


        'CREATE TABLE EST_PRODUTO_FORNECEDORES ('
 +#13#10'   KEST_PRODUTO_FORNECEDOR SYS$PKGUID20,'
 +#13#10'   KEST_PRODUTO            SYS$FKGUID20_NN,'
 +#13#10'   KCAD_FORNECEDOR         SYS$FKGUID20_NN,'
 +#13#10'   CODIGO                  SYS$CODE,'
 +#13#10'   NOME                    SYS$DESCR_NN,'

*)




{ TDataSetHelper }

function IsRequitedField( AField : TField ) : boolean ; inline ;
begin
  Result := AField.Required
       and not AField.ReadOnly
       and (AField.FieldKind = fkData) ;
end;

function TDataSetHelper.RequiredFields( ) : IRequiredFields;
  procedure IterateFields( ADataSet : TDataSet ) ;
  var
   FField : TField ;
   begin
     for FField in ADataSet.Fields do
        if IsRequitedField( FField ) then
           Result.Add( FField )
        else if FField is TDataSetField then
          IterateFields( TDataSetField( FField ).NestedDataSet ) ;
   end;
begin
   Result := TRequiredFields.New() ;
   IterateFields( self ) ;
end;

{ TFieldsHelper}



procedure TFieldsHelper.Iterate(AIterateFunction: TIterateFunction<TField>);
var
  LField : TField ;
begin
 for LField in self do
   if not AIterateFunction( LField ) then
     break ;
end;

{ TRequiredFields }

constructor TRequiredFields.Create;
begin
  FRequiredList := TFieldsList.Create ;
end;

destructor TRequiredFields.Destroy;
begin
  if FAutoReset then
     Required( True ) ;
  FRequiredList.Free ;
  inherited;
end;

class function TRequiredFields.New: IRequiredFields;
begin
   Result := Create ;
end;

procedure TRequiredFields.Add(const AField: TField);
begin
  FRequiredList.add ( AField ) ;
end;

function TRequiredFields.Required( const ARequired : boolean ) : IRequiredFields ;
var
  LField : TField ;
begin
 Result := self ;
 FRequiredList.Iterate(
   function ( const AField : TField ) : boolean
   begin
     AField.Required := ARequired ;
     Result := True ;
   end
 ) ;
end;

{ TRequitedListHelper }

procedure TRequitedListHelper.Iterate(AIterateFunction: TIterateFunction<TField>);
var
  LField : TField ;
begin
 for LField in self do
   if not AIterateFunction( LField ) then
     break ;
end;


end.
