unit UdtmVENDAS_Pedido2;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UdtmSYS_BASEDBListEdit, VCL.Dialogs,
  Data.FMTBcd, Data.SqlExpr, Provider, Math
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

  TdtmVENDAS_Pedido = class(T_dtmBASEDBListEdit)
    cdsLstPedidos: TClientDataSet;
    cdsPedido: TClientDataSet;
    dtsList: TDataSource;
    cdsItensPedido: TClientDataSet;
    cdsItensPedidoSomaTotal: TAggregateField;
    cdsStatusPedido: TClientDataSet;
    cdsStatusPedidoTIPO: TStringField;
    cdsStatusPedidoVALOR: TStringField;
    cdsStatusPedidoDESCRICAO: TStringField;
    cdsDadosEntidade: TClientDataSet;
    dtsPedido: TDataSource;
    cdsDadosEntidadeKCAD_ENTIDADE: TStringField;
    cdsDadosEntidadeDADOSENTIDADE: TStringField;
    cdsDadosProduto: TClientDataSet;
    cdsDadosEntidadeEMAIL: TStringField;
    cdsDadosEntidadeFONE: TStringField;
    cdsParcelas: TClientDataSet;
    cdsParcelasDOCUMENTO: TStringField;
    cdsParcelasVENCTO: TSQLTimeStampField;
    cdsParcelasVALOR: TFloatField;
    cdsParcelasPAGTO: TSQLTimeStampField;
    cdsParcelasPAGO: TFloatField;
    cdsParcelasKFIN_CONTA: TStringField;
    cdsParcelasPREVISAO: TStringField;
    cdsParcelasDUVIDOSO: TStringField;
    cdsParcelasOBS: TMemoField;
    cdsParcelasSomaValor: TAggregateField;
    dspLstPedidos: TDataSetProvider;
    dspPedido: TDataSetProvider;
    sqlLstPedidos: TTcSQLDataSet;
    sqlPedido: TTcSQLDataSet;
    sqlItensPedido: TTcSQLDataSet;
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
    sqlParcelas: TTcSQLDataSet;
    sqlParcelasDOCUMENTO: TStringField;
    sqlParcelasVENCTO: TSQLTimeStampField;
    sqlParcelasVALOR: TFloatField;
    sqlParcelasPAGTO: TSQLTimeStampField;
    sqlParcelasPAGO: TFloatField;
    sqlParcelasKFIN_CONTA: TStringField;
    sqlParcelasDUVIDOSO: TStringField;
    sqlParcelasOBS: TMemoField;
    cdsAReceberKFIN_ARECEBER: TStringField;
    cdsAReceberTABLENAME: TStringField;
    cdsAReceberTABLEKEY: TStringField;
    cdsAReceber: TClientDataSet;
    cdsAReceberATIVO: TStringField;
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
    cdsParcelasKFIN_ARECEBER_PARCELA: TStringField;
    cdsParcelasKFIN_ARECEBER: TStringField;
    sqlDadosProdutoDESCRICAO: TMemoField;
    sqlDadosProdutoOBS: TMemoField;
    cdsDadosProdutoDESCRICAO: TMemoField;
    cdsDadosProdutoOBS: TMemoField;
    sqlItensPedidoKFIN_PLANOCONTA: TStringField;
    cdsApropriacaoItem: TClientDataSet;
    cdsApropriacaoItemTOTAL_PORCENTAGEM: TAggregateField;
    sqlApropriacaoItem: TTcSQLDataSet;
    dtsSQLItemPedido: TDataSource;
    sqlApropriacaoItemKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoItemKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoItemPORCENTAGEM: TFloatField;
    cdsApropriacaoItemKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoItemKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoItemCODIGO: TIntegerField;
    cdsApropriacaoItemCLASSIFICACAO: TStringField;
    cdsApropriacaoItemNOME: TStringField;
    cdsApropriacaoItemPORCENTAGEM: TFloatField;
    sqlLstPedidosKVND_PEDIDO: TStringField;
    sqlLstPedidosKSYSDOMAIN: TStringField;
    sqlLstPedidosNOTA_FISCAL: TStringField;
    sqlLstPedidosSERIE: TStringField;
    sqlLstPedidosDATA_EMISSAO: TSQLTimeStampField;
    sqlLstPedidosNOMEENTIDADE: TStringField;
    sqlLstPedidosIMPOSTOS: TFloatField;
    sqlLstPedidosDESCONTOS: TFloatField;
    sqlLstPedidosFRETE: TFloatField;
    sqlLstPedidosTOTAL_NOTA: TFloatField;
    cdsLstPedidosKVND_PEDIDO: TStringField;
    cdsLstPedidosKSYSDOMAIN: TStringField;
    cdsLstPedidosNOTA_FISCAL: TStringField;
    cdsLstPedidosSERIE: TStringField;
    cdsLstPedidosDATA_EMISSAO: TSQLTimeStampField;
    cdsLstPedidosNOMEENTIDADE: TStringField;
    cdsLstPedidosIMPOSTOS: TFloatField;
    cdsLstPedidosDESCONTOS: TFloatField;
    cdsLstPedidosFRETE: TFloatField;
    cdsLstPedidosTOTAL_NOTA: TFloatField;
    sqlPedidoKVND_PEDIDO: TStringField;
    sqlPedidoKSYSDOMAIN: TStringField;
    sqlPedidoKCAD_ENTIDADE: TStringField;
    sqlPedidoNOTA_FISCAL: TStringField;
    sqlPedidoSERIE: TStringField;
    sqlPedidoDATA_EMISSAO: TSQLTimeStampField;
    sqlPedidoNOMEENTIDADE: TStringField;
    sqlPedidoIMPOSTOS: TFloatField;
    sqlPedidoDESCONTOS: TFloatField;
    sqlPedidoFRETE: TFloatField;
    sqlPedidoTOTAL_ITENS: TFloatField;
    sqlPedidoTOTAL_SERVICOS: TFloatField;
    sqlPedidoTOTAL_NOTA: TFloatField;
    sqlPedidoKFIN_ARECEBER: TStringField;
    sqlPedidoATIVO: TStringField;
    sqlPedidoOBS: TMemoField;
    cdsPedidoKVND_PEDIDO: TStringField;
    cdsPedidoKSYSDOMAIN: TStringField;
    cdsPedidoKCAD_ENTIDADE: TStringField;
    cdsPedidoNOTA_FISCAL: TStringField;
    cdsPedidoSERIE: TStringField;
    cdsPedidoDATA_EMISSAO: TSQLTimeStampField;
    cdsPedidoNOMEENTIDADE: TStringField;
    cdsPedidoIMPOSTOS: TFloatField;
    cdsPedidoDESCONTOS: TFloatField;
    cdsPedidoFRETE: TFloatField;
    cdsPedidoTOTAL_ITENS: TFloatField;
    cdsPedidoTOTAL_SERVICOS: TFloatField;
    cdsPedidoTOTAL_NOTA: TFloatField;
    cdsPedidoKFIN_ARECEBER: TStringField;
    cdsPedidoATIVO: TStringField;
    cdsPedidoOBS: TMemoField;
    cdsPedidosqlServicosPedido: TDataSetField;
    cdsPedidosqlAreceber: TDataSetField;
    cdsPedidosqlItensPedido: TDataSetField;
    cdsItensPedidoKVND_PEDIDO_ITEM: TStringField;
    cdsItensPedidoKVND_PEDIDO: TStringField;
    cdsItensPedidoKEST_PRODUTO: TStringField;
    cdsItensPedidoCODIGO: TStringField;
    cdsItensPedidoNOME: TStringField;
    cdsItensPedidoUNIDADE: TStringField;
    cdsItensPedidoCUSTO: TFloatField;
    cdsItensPedidoDETALHES: TMemoField;
    cdsItensPedidoQTDE: TFloatField;
    cdsItensPedidoTOTAL: TFloatField;
    cdsItensPedidoOBS: TMemoField;
    cdsItensPedidoKFIN_PLANOCONTA: TStringField;
    cdsItensPedidosqlApropriacaoItem: TDataSetField;
    sqlItensPedidoIS_PATRIMONIO: TStringField;
    cdsItensPedidoIS_PATRIMONIO: TStringField;
    cdsItensPedidotmpCalc: TIntegerField;
    sqlItensPedidoDESCR_PC_NOME: TStringField;
    sqlApropriacaoItemNOME: TStringField;
    sqlApropriacaoItemCODIGO: TIntegerField;
    sqlApropriacaoItemCLASSIFICACAO: TStringField;
    cdsItensPedidoDESCR_PC_NOME: TStringField;
    sqlItensPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    sqlItensPedidoDESCR_PC_CODIGO: TIntegerField;
    sqlItensPedidoDESCR_PC_TIPO_APRD: TStringField;
    cdsItensPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    cdsItensPedidoDESCR_PC_CODIGO: TIntegerField;
    cdsItensPedidoDESCR_PC_TIPO_APRD: TStringField;
    sqlAreceberKSYSDOMAIN: TStringField;
    cdsAReceberKSYSDOMAIN: TStringField;
    sqlPedidoDATA_VENDA: TSQLTimeStampField;
    cdsPedidoDATA_VENDA: TSQLTimeStampField;
    cdsApropriacaoServico: TClientDataSet;
    cdsApropriacaoServicoKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoServicoKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoServicoCODIGO: TIntegerField;
    cdsApropriacaoServicoCLASSIFICACAO: TStringField;
    cdsApropriacaoServicoNOME: TStringField;
    cdsApropriacaoServicoPORCENTAGEM: TFloatField;
    AggregateField1: TAggregateField;
    sqlApropriacaoServico: TTcSQLDataSet;
    StringField6: TStringField;
    StringField8: TStringField;
    IntegerField2: TIntegerField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField2: TFloatField;
    dstSQLApropriacaoServico: TDataSource;
    cdsServicosPedido: TClientDataSet;
    cdsServicosPedidoKEST_PRODUTO: TStringField;
    cdsServicosPedidoCODIGO: TStringField;
    cdsServicosPedidoNOME: TStringField;
    cdsServicosPedidoUNIDADE: TStringField;
    cdsServicosPedidoCUSTO: TFloatField;
    cdsServicosPedidoDETALHES: TMemoField;
    cdsServicosPedidoQTDE: TFloatField;
    cdsServicosPedidoTOTAL: TFloatField;
    cdsServicosPedidoOBS: TMemoField;
    cdsServicosPedidoKFIN_PLANOCONTA: TStringField;
    cdsServicosPedidoDESCR_PC_NOME: TStringField;
    cdsServicosPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    cdsServicosPedidoDESCR_PC_CODIGO: TIntegerField;
    cdsServicosPedidoDESCR_PC_TIPO_APRD: TStringField;
    cdsServicosPedidoTmpCalc: TIntegerField;
    cdsServicosPedidosqlApropriacaoServico: TDataSetField;
    cdsServicosPedidoSomaTotal: TAggregateField;
    sqlServicosPedido: TTcSQLDataSet;
    sqlServicosPedidoKEST_PRODUTO: TStringField;
    sqlServicosPedidoCODIGO: TStringField;
    sqlServicosPedidoNOME: TStringField;
    sqlServicosPedidoUNIDADE: TStringField;
    sqlServicosPedidoCUSTO: TFloatField;
    sqlServicosPedidoDETALHES: TMemoField;
    sqlServicosPedidoQTDE: TFloatField;
    sqlServicosPedidoTOTAL: TFloatField;
    sqlServicosPedidoOBS: TMemoField;
    sqlServicosPedidoKFIN_PLANOCONTA: TStringField;
    sqlServicosPedidoDESCR_PC_NOME: TStringField;
    sqlServicosPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    sqlServicosPedidoDESCR_PC_CODIGO: TIntegerField;
    sqlServicosPedidoDESCR_PC_TIPO_APRD: TStringField;
    sqlServicosPedidoKVND_PEDIDO_SERVICO: TStringField;
    sqlServicosPedidoKVND_PEDIDO: TStringField;
    cdsServicosPedidoKVND_PEDIDO_SERVICO: TStringField;
    cdsServicosPedidoKVND_PEDIDO: TStringField;
    sqlAreceberNOMECONTA: TStringField;
    cdsAReceberNOMECONTA: TStringField;
    sqlParcelasNOMECONTA: TStringField;
    sqlParcelasPREVISAO: TStringField;
    cdsParcelasNOMECONTA: TStringField;
    cdsDadosPatrimonio: TClientDataSet;
    cdsDadosPatrimonioKCAD_PATRIMONIO: TStringField;
    cdsDadosPatrimonioCODIGO: TStringField;
    cdsDadosPatrimonioDESCRICAO: TStringField;
    cdsDadosPatrimonioUNIDADE: TStringField;
    cdsDadosPatrimonioVALOR_UNITARIO: TFloatField;
    cdsDadosPatrimonioQUANTIDADE: TIntegerField;
    cdsDadosPatrimonioOBS: TMemoField;
    sqlDadosPatrimonio: TTcSQLDataSet;
    sqlDadosPatrimonioKCAD_PATRIMONIO: TStringField;
    sqlDadosPatrimonioCODIGO: TStringField;
    sqlDadosPatrimonioDESCRICAO: TStringField;
    sqlDadosPatrimonioUNIDADE: TStringField;
    sqlDadosPatrimonioVALOR_UNITARIO: TFloatField;
    sqlDadosPatrimonioQUANTIDADE: TIntegerField;
    sqlDadosPatrimonioOBS: TMemoField;
    dspDadosPatrimonio: TDataSetProvider;
    sqlItensPedidoKCAD_PATRIMONIO: TStringField;
    cdsItensPedidoKCAD_PATRIMONIO: TStringField;
    sqlLstPedidosOBS: TMemoField;
    cdsLstPedidosOBS: TMemoField;
    sqlAreceberNUM_PARCELAS: TIntegerField;
    sqlAreceberDIA_VENCTO: TIntegerField;
    sqlAreceberPROXIMO_MES: TStringField;
    cdsAReceberNUM_PARCELAS: TIntegerField;
    cdsAReceberDIA_VENCTO: TIntegerField;
    cdsAReceberPROXIMO_MES: TStringField;
    sqlAreceberRECORRENCIA: TStringField;
    cdsAReceberRECORRENCIA: TStringField;
    sqlApropriacaoItemTABLENAME: TStringField;
    sqlApropriacaoItemTABLEKEY: TStringField;
    cdsApropriacaoItemTABLENAME: TStringField;
    cdsApropriacaoItemTABLEKEY: TStringField;
    sqlApropriacaoServicoTABLENAME: TStringField;
    sqlApropriacaoServicoTABLEKEY: TStringField;
    cdsApropriacaoServicoTABLENAME: TStringField;
    cdsApropriacaoServicoTABLEKEY: TStringField;
    sqlAreceberPAGTO_AVISTA: TStringField;
    cdsAReceberPAGTO_AVISTA: TStringField;
    sqlParcelasCHEQUE: TStringField;
    sqlParcelasNUM_CHEQUE: TStringField;
    cdsParcelasCHEQUE: TStringField;
    cdsParcelasNUM_CHEQUE: TStringField;
    sqlParcelasDT_COMPENSACAO: TSQLTimeStampField;
    cdsParcelasDT_COMPENSACAO: TSQLTimeStampField;
    cdsPedidoCHAVENFE: TStringField;
    cdsPedidoIMPORTADO_NFE: TStringField;
    cdsPedidoXML_NFE: TMemoField;
    cdsPedidoMODELO_NFE: TIntegerField;
    sqlPedidoCHAVENFE: TStringField;
    sqlPedidoIMPORTADO_NFE: TStringField;
    sqlPedidoXML_NFE: TMemoField;
    sqlPedidoMODELO_NFE: TIntegerField;
    sqlPedidoSYSORIGIN_TYPE: TIntegerField;
    cdsPedidoSYSORIGIN_TYPE: TIntegerField;
    cdsPatrimoniosPedido: TClientDataSet;
    cdsPatrimoniosPedidoKVND_PEDIDO_ITEM: TStringField;
    cdsPatrimoniosPedidoKVND_PEDIDO: TStringField;
    cdsPatrimoniosPedidoKEST_PRODUTO: TStringField;
    cdsPatrimoniosPedidoKCAD_PATRIMONIO: TStringField;
    cdsPatrimoniosPedidoIS_PATRIMONIO: TStringField;
    cdsPatrimoniosPedidoCODIGO: TStringField;
    cdsPatrimoniosPedidoNOME: TStringField;
    cdsPatrimoniosPedidoUNIDADE: TStringField;
    cdsPatrimoniosPedidoCUSTO: TFloatField;
    cdsPatrimoniosPedidoDETALHES: TMemoField;
    cdsPatrimoniosPedidoQTDE: TFloatField;
    cdsPatrimoniosPedidoTOTAL: TFloatField;
    cdsPatrimoniosPedidoOBS: TMemoField;
    cdsPatrimoniosPedidoKFIN_PLANOCONTA: TStringField;
    cdsPatrimoniosPedidoDESCR_PC_NOME: TStringField;
    cdsPatrimoniosPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    cdsPatrimoniosPedidoDESCR_PC_CODIGO: TIntegerField;
    cdsPatrimoniosPedidoDESCR_PC_TIPO_APRD: TStringField;
    cdsPatrimoniosPedidosqlApropriacaoPatrimonio: TDataSetField;
    cdsPatrimoniosPedidotmpCalc: TIntegerField;
    cdsPatrimoniosPedidoSomaTotal: TAggregateField;
    sqlPatrimoniosPedido: TTcSQLDataSet;
    sqlPatrimoniosPedidoKVND_PEDIDO_ITEM: TStringField;
    sqlPatrimoniosPedidoKVND_PEDIDO: TStringField;
    sqlPatrimoniosPedidoKEST_PRODUTO: TStringField;
    sqlPatrimoniosPedidoKCAD_PATRIMONIO: TStringField;
    sqlPatrimoniosPedidoIS_PATRIMONIO: TStringField;
    sqlPatrimoniosPedidoCODIGO: TStringField;
    sqlPatrimoniosPedidoNOME: TStringField;
    sqlPatrimoniosPedidoUNIDADE: TStringField;
    sqlPatrimoniosPedidoCUSTO: TFloatField;
    sqlPatrimoniosPedidoDETALHES: TMemoField;
    sqlPatrimoniosPedidoQTDE: TFloatField;
    sqlPatrimoniosPedidoTOTAL: TFloatField;
    sqlPatrimoniosPedidoOBS: TMemoField;
    sqlPatrimoniosPedidoKFIN_PLANOCONTA: TStringField;
    sqlPatrimoniosPedidoDESCR_PC_NOME: TStringField;
    sqlPatrimoniosPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    sqlPatrimoniosPedidoDESCR_PC_CODIGO: TIntegerField;
    sqlPatrimoniosPedidoDESCR_PC_TIPO_APRD: TStringField;
    cdsApropriacaoPatrimonio: TClientDataSet;
    cdsApropriacaoPatrimonioKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoPatrimonioKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoPatrimonioNOME: TStringField;
    cdsApropriacaoPatrimonioCODIGO: TIntegerField;
    cdsApropriacaoPatrimonioCLASSIFICACAO: TStringField;
    cdsApropriacaoPatrimonioPORCENTAGEM: TFloatField;
    cdsApropriacaoPatrimonioTABLENAME: TStringField;
    cdsApropriacaoPatrimonioTABLEKEY: TStringField;
    cdsApropriacaoPatrimonioTOTAL_PORCENTAGEM: TAggregateField;
    sqlApropriacaoPatrimonio: TTcSQLDataSet;
    sqlApropriacaoPatrimonioKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoPatrimonioKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoPatrimonioPORCENTAGEM: TFloatField;
    sqlApropriacaoPatrimonioNOME: TStringField;
    sqlApropriacaoPatrimonioCODIGO: TIntegerField;
    sqlApropriacaoPatrimonioCLASSIFICACAO: TStringField;
    sqlApropriacaoPatrimonioTABLENAME: TStringField;
    sqlApropriacaoPatrimonioTABLEKEY: TStringField;
    dtsSQLPatrimonioPedido: TDataSource;
    sqlAreceberKVND_PEDIDO: TStringField;
    cdsAReceberKVND_PEDIDO: TStringField;
    cdsAPagar: TClientDataSet;
    cdsAPagarKFIN_APAGAR: TStringField;
    cdsAPagarKSYSDOMAIN: TStringField;
    cdsAPagarTABLENAME: TStringField;
    cdsAPagarTABLEKEY: TStringField;
    cdsAPagarATIVO: TStringField;
    cdsAPagarKCAD_ENTIDADE: TStringField;
    cdsAPagarNOMEENTIDADE: TStringField;
    cdsAPagarHISTORICO: TStringField;
    cdsAPagarDOCUMENTO: TStringField;
    cdsAPagarDATALANCTO: TSQLTimeStampField;
    cdsAPagarNUM_PARCELAS: TIntegerField;
    cdsAPagarPROXIMO_MES: TStringField;
    cdsAPagarRECORRENCIA: TStringField;
    cdsAPagarDIA_VENCTO: TIntegerField;
    cdsAPagarKFIN_CONTA_PREF: TStringField;
    cdsAPagarNOMECONTA: TStringField;
    cdsAPagarKFIN_PLANOCONTA: TStringField;
    cdsAPagarOBS: TMemoField;
    cdsAPagarPAGTO_AVISTA: TStringField;
    cdsAPagarsqlParcelasApagar: TDataSetField;
    cdsAPagarStatusCadastro: TStringField;
    cdsAPagarKVND_PEDIDO: TStringField;
    cdsAPagarKFIN_APAGAR_TRANSPORTE: TStringField;
    cdsParcelasApagar: TClientDataSet;
    cdsParcelasApagarKFIN_APAGAR_PARCELA: TStringField;
    cdsParcelasApagarKFIN_APAGAR: TStringField;
    cdsParcelasApagarDOCUMENTO: TStringField;
    cdsParcelasApagarVENCTO: TSQLTimeStampField;
    cdsParcelasApagarPRORROGACAO: TSQLTimeStampField;
    cdsParcelasApagarVALOR: TFloatField;
    cdsParcelasApagarPAGTO: TSQLTimeStampField;
    cdsParcelasApagarPAGO: TFloatField;
    cdsParcelasApagarKFIN_CONTA: TStringField;
    cdsParcelasApagarNOMECONTA: TStringField;
    cdsParcelasApagarPREVISAO: TStringField;
    cdsParcelasApagarDUVIDOSO: TStringField;
    cdsParcelasApagarCHEQUE: TStringField;
    cdsParcelasApagarNUM_CHEQUE: TStringField;
    cdsParcelasApagarDT_COMPENSACAO: TSQLTimeStampField;
    cdsParcelasApagarOBS: TMemoField;
    cdsParcelasApagartmpCalc: TFloatField;
    cdsParcelasApagarSomaValor: TAggregateField;
    sqlApagar: TTcSQLDataSet;
    sqlApagarKFIN_APAGAR: TStringField;
    sqlApagarKSYSDOMAIN: TStringField;
    sqlApagarATIVO: TStringField;
    sqlApagarTABLENAME: TStringField;
    sqlApagarTABLEKEY: TStringField;
    sqlApagarKCAD_ENTIDADE: TStringField;
    sqlApagarNOMEENTIDADE: TStringField;
    sqlApagarPAGTO_AVISTA: TStringField;
    sqlApagarHISTORICO: TStringField;
    sqlApagarDOCUMENTO: TStringField;
    sqlApagarDATALANCTO: TSQLTimeStampField;
    sqlApagarNUM_PARCELAS: TIntegerField;
    sqlApagarPROXIMO_MES: TStringField;
    sqlApagarRECORRENCIA: TStringField;
    sqlApagarDIA_VENCTO: TIntegerField;
    sqlApagarKFIN_CONTA_PREF: TStringField;
    sqlApagarNOMECONTA: TStringField;
    sqlApagarKFIN_PLANOCONTA: TStringField;
    sqlApagarOBS: TMemoField;
    sqlApagarKVND_PEDIDO: TStringField;
    sqlApagarKFIN_APAGAR_TRANSPORTE: TStringField;
    sqlParcelasApagar: TTcSQLDataSet;
    sqlParcelasApagarKFIN_APAGAR_PARCELA: TStringField;
    sqlParcelasApagarKFIN_APAGAR: TStringField;
    sqlParcelasApagarDOCUMENTO: TStringField;
    sqlParcelasApagarVENCTO: TSQLTimeStampField;
    sqlParcelasApagarPRORROGACAO: TSQLTimeStampField;
    sqlParcelasApagarVALOR: TFloatField;
    sqlParcelasApagarPAGTO: TSQLTimeStampField;
    sqlParcelasApagarPAGO: TFloatField;
    sqlParcelasApagarKFIN_CONTA: TStringField;
    sqlParcelasApagarNOMECONTA: TStringField;
    sqlParcelasApagarPREVISAO: TStringField;
    sqlParcelasApagarDUVIDOSO: TStringField;
    sqlParcelasApagarCHEQUE: TStringField;
    sqlParcelasApagarNUM_CHEQUE: TStringField;
    sqlParcelasApagarDT_COMPENSACAO: TSQLTimeStampField;
    sqlParcelasApagarOBS: TMemoField;
    dtsSQLAPagar: TDataSource;
    sqlPedidoKFIN_APAGAR_TRANSPORTE: TStringField;
    sqlPedidoKFIN_APAGAR: TStringField;
    cdsPedidoKFIN_APAGAR: TStringField;
    cdsPedidosqlApagar: TDataSetField;
    cdsPedidosqlPatrimoniosPedido: TDataSetField;
    sqlAreceberANUAL: TStringField;
    cdsAReceberANUAL: TStringField;
    cdsAPagarANUAL: TStringField;
    sqlApagarANUAL: TStringField;
    sqlPedidoVALOR_DEDUCOES: TFloatField;
    cdsPedidoVALOR_DEDUCOES: TFloatField;
    sqlLstPedidosNOTA_FISCAL_: TStringField;
    cdsLstPedidosNOTA_FISCAL_: TStringField;
    procedure cdsLstPedidosNewRecord(DataSet: TDataSet);
    procedure cdsPedidoNewRecord(DataSet: TDataSet);
    procedure cdsPedidoCalcFields(DataSet: TDataSet);
    procedure cdsPedidoBeforeInsert(DataSet: TDataSet);
    procedure cdsPedidoNOMECONTATOValidate(Sender: TField);
    procedure cdsPedidoNOMECOMPRADORValidate(Sender: TField);
    procedure cdsAReceberNewRecord(DataSet: TDataSet);
    procedure cdsParcelasNewRecord(DataSet: TDataSet);
    procedure cdsParcelasBeforeInsert(DataSet: TDataSet);
    procedure cdsPedidoBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsPedidoDATA_VENDAValidate(Sender: TField);
    procedure cdsPedidoDATA_EMISSAOValidate(Sender: TField);
    procedure cdsParcelasVENCTOChange(Sender: TField);
    procedure cdsPedidoBeforeEdit(DataSet: TDataSet);
    procedure cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsParcelasBeforeDelete(DataSet: TDataSet);
    procedure cdsParcelasBeforeEdit(DataSet: TDataSet);
    procedure cdsAReceberNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsPedidoNOMEENTIDADESetText(Sender: TField; const Text: string);
    procedure cdsPedidoDATA_VENDAChange(Sender: TField);
    procedure cdsPedidoBeforeDelete(DataSet: TDataSet);
    procedure cdsPedidoBeforePost(DataSet: TDataSet);



    procedure cdsPedidoNOTA_FISCALValidate(Sender: TField);
    procedure cdsParcelasCHEQUEChange(Sender: TField);
    procedure cdsAReceberPAGTO_AVISTAChange(Sender: TField);
    procedure cdsParcelasBeforePost(DataSet: TDataSet);

    procedure cdsItensPedidoCalcFields(DataSet: TDataSet);
    procedure cdsItensPedidoNewRecord(DataSet: TDataSet);
    procedure cdsItensPedidoBeforeInsert(DataSet: TDataSet);
    procedure cdsItensPedidoBeforePost(DataSet: TDataSet);
    procedure cdsItensPedidoBeforeEdit(DataSet: TDataSet);
    procedure cdsItensPedidoAfterCancel(DataSet: TDataSet);
    procedure cdsItensPedidoAfterDelete(DataSet: TDataSet);

    procedure cdsItensPedidoCODIGOSetText(Sender: TField; const Text: string);
    procedure cdsItensPedidoNOMESetText(Sender: TField; const Text: string);
    procedure cdsItensPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
    procedure cdsItensPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsItensPedidoIS_PATRIMONIOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsItensPedidoSomaTotalGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);

    procedure cdsApropriacaoItemNewRecord(DataSet: TDataSet);
    procedure cdsApropriacaoItemCLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);

    procedure cdsPatrimoniosPedidoCalcFields(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoNewRecord(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoBeforeInsert(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoBeforePost(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoBeforeEdit(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoAfterCancel(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoAfterDelete(DataSet: TDataSet);

    procedure cdsPatrimoniosPedidoCODIGOSetText(Sender: TField; const Text: string);
    procedure cdsPatrimoniosPedidoNOMESetText(Sender: TField; const Text: string);
    procedure cdsPatrimoniosPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
    procedure cdsPatrimoniosPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPatrimoniosPedidoIS_PATRIMONIOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPatrimoniosPedidoSomaTotalGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);

    procedure cdsApropriacaoPatrimonioNewRecord(DataSet: TDataSet);
    procedure cdsApropriacaoPatrimonioCLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);


    procedure cdsServicosPedidoBeforePost(DataSet: TDataSet);
    procedure cdsServicosPedidoBeforeInsert(DataSet: TDataSet);
    procedure cdsServicosPedidoAfterDelete(DataSet: TDataSet);
    procedure cdsServicosPedidoNewRecord(DataSet: TDataSet);
    procedure cdsServicosPedidoCalcFields(DataSet: TDataSet);
    procedure cdsServicosPedidoBeforeEdit(DataSet: TDataSet);
    procedure cdsServicosPedidoAfterCancel(DataSet: TDataSet);

    procedure cdsServicosPedidoKFIN_PLANOCONTAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsServicosPedidoCODIGOSetText(Sender: TField; const Text: string);
    procedure cdsServicosPedidoNOMESetText(Sender: TField; const Text: string);
    procedure cdsServicosPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
    procedure cdsServicosPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsServicosPedidoSomaTotalGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);

    procedure cdsApropriacaoServicoNewRecord(DataSet: TDataSet);
    procedure cdsApropriacaoServicoCLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure sqlPedidoBeforeOpen(DataSet: TDataSet);
    procedure cdsPedidoBeforeOpen(DataSet: TDataSet);
    procedure cdsPedidoAfterInsert(DataSet: TDataSet);
    procedure cdsPedidoSERIEValidate(Sender: TField);
    procedure cdsPedidoKCAD_ENTIDADEValidate(Sender: TField);
    procedure dspPedidoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);

    procedure cdsParcelasAPagarNewRecord(DataSet: TDataSet);
    procedure cdsParcelasAPagarBeforeInsert(DataSet: TDataSet);
    procedure cdsParcelasAPagarBeforeDelete(DataSet: TDataSet);
    procedure cdsParcelasAPagarBeforeEdit(DataSet: TDataSet);
    procedure cdsParcelasAPagarVENCTOChange(Sender: TField);
    procedure cdsParcelasAPagarNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsParcelasAPagarCalcFields(DataSet: TDataSet);

    procedure cdsParcelasAPagarNUM_CHEQUESetText(Sender: TField; const Text: string);
    procedure cdsParcelasAPagarCHEQUEChange(Sender: TField);
    procedure cdsParcelasAPagarBeforePost(DataSet: TDataSet);
    procedure cdsAPagarNewRecord(DataSet: TDataSet);

  private
    { Private declarations }
    FSQLPedidosRequiredField : IRequiredFields ;
    FCDSPedidosRequiredField : IRequiredFields ;

    FShowInativos : Boolean;
    FDataInicial  : TDateTime ;
    FDataFinal    : TDateTime ;
    DataEmissao   : TDateTime ;
    FNewCadastro  : Boolean ;
    FKContaPadrao : string ;
    FNomeConta    : string;
    FKContaFavorita    : string;
    FNomeContaFavorita : string;
    ValorLinhaItens    : double ;
    ValorLinhaServicos : double ;
    FK_PLANOESTOQUE : string ;
    FKVND_PEDIDO: string;

    LValidatePlanoContas : boolean ;


    procedure CalculaTotaisPedido ;
    procedure SetParams ;
    procedure LimpaProduto ;
    procedure LimpaServico ;
    function ParcelaBaixada : Boolean ;
    procedure CheckMesEncerrado ;
    procedure InitPlanoContaEstoque ;
    procedure ValidNF ;
    procedure SetKVND_PEDIDO(const Value: string);
    procedure RecebimentoAVista;
    procedure GetContaFavorita;
    function RoundTo(const AValue: Currency; const ADigit: TRoundToRange): Currency;
  public
    { Public declarations }
    procedure SetEntidade ( Key : String ;NomeEntidade : string ) ;
    procedure SetCOMPRADOR( Key, NomeCOMPRADOR : string ) ;
    procedure SetContato ( Key : String ;NomeContato : string ; Depto : string = '' ; Email : string = '' ; Fone  : string = '' ) ;
    procedure OpenTables ; override ;
    procedure insereItem(
        const AKey
            , ACodigo
            , ANome
            , AUnidade : string;
        const AQtde
           ,  AValorVenda : Currency;
        const AProduto_Patrimonio : Integer ;
        const AKFIN_PlanoConta
           ,  ADescrPlanoConta : string
                          (* EV-1418 ; AControlaEstoque : boolean *)
    ) ;

    procedure inserePatrimonio(
        const AKey
            , ACodigo
            , ANome
            , AUnidade : string;
        const AQtde
            , AValorVenda : Currency;
        const AProduto_Patrimonio : Integer ;
        const AKFIN_PlanoConta
            , ADescrPlanoConta : string
    ) ;

    procedure insereServico(
        const AKey
            , ACodigo
            , ANome
            , AUnidade : string;
        const AValorCusto : Currency
    );

    procedure RemoveApropriacaoItens ;
    procedure RemoveApropriacaoServico ;
    procedure RemoveApropriacaoPatrimonio  ;


    procedure OpenPedido ( KPedido : String  ) ;
    procedure ClonePedido ;
    procedure SetFilter ( ShowInativos : Boolean; DataInicial, DataFinal : TDateTime );
    procedure SetContaPreferencial( KFIN_CONTA, NOME: string);
    procedure SetContaPreferencialApagar( KFIN_CONTA, NOME: string);
    procedure SetConta( KFIN_CONTA, NOME: string);
    procedure CalculaTotais;
    procedure CheckValorAPagar;
    procedure CheckPagamentoAVista;
    property  KVND_PEDIDO : string  read FKVND_PEDIDO write SetKVND_PEDIDO;


    procedure PostItem ;
    procedure EditItem ;

    constructor Create ( AOwner : TComponent ) ;override ;
    procedure PagamentoAVista;
    property NomeContaFavorita: String read FNomeContaFavorita;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBFinanceiro, UDBEntidades,
    Data.SQLTimSt, Exceptions, System.Variants,
    CLAg5SvcFinanceiroApropriacao
     , DataSnap.DSConnect
      ;

const
  PRODUTO    = 1;
  PATRIMONIO = 2;

resourcestring
  _ERRMSG_TOTAL_ZERO = 'Não é possivel gravar um pedido sem itens/valor' ;
  _ERRMSG_TOTAL_APGAGAR = 'Total das parcelas a pagar não'#13#10'coincide com total do pedido' ;
  _ERRMSG_NOTA_JA_CADASTRADA = 'Nota fiscal já cadastrada' ;

{$R *.dfm}

{ TrdmdtmVENDAS_Pedido }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmVENDAS_Pedido.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;

{$ENDIF}




{ TdtmCustomListaFicha }

procedure TdtmVENDAS_Pedido.OpenTables;
begin
  TTcAbstractDB.GetByAlias('FINANCEIRO').GetSystemTypes ( 'STATUS_PEDIDO', cdsStatusPedido ) ;
  InitPlanoContaEstoque ;
  TCDSSuppl.Open ( cdsDadosEntidade );
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

procedure TdtmVENDAS_Pedido.dspPedidoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: string);
begin
   if DataSet = sqlParcelas then
      TableName := 'FIN_ARECEBER_PARCELAS' ;
end;


procedure TdtmVENDAS_Pedido.PagamentoAVista;
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

  TCdsSuppl.PostIfNeed( cdsPedido );


  if not( cdsAReceber.State in [ dsInsert, dsEdit] ) then
    cdsAReceber.Edit;

  cdsAReceberHISTORICO.asString := Format( 'Nota fiscal de venda: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] ) ;
  cdsAReceberDOCUMENTO.AsString := cdsPedidoNOTA_FISCAL.AsString ;


  cdsParcelas.Append;
  cdsParcelasVENCTO.AsDateTime := Trunc ( cdsPedidoDATA_EMISSAO.AsDateTime ) ;
  cdsParcelasVALOR.AsFloat     := cdsPedidoTOTAL_NOTA.AsFloat - cdsPedidoVALOR_DEDUCOES.AsFloat ;
  cdsParcelasPAGTO.AsDateTime  := Trunc ( cdsPedidoDATA_EMISSAO.AsDateTime ) ;
  cdsParcelasPAGO.AsFloat      := cdsPedidoTOTAL_NOTA.AsFloat  - cdsPedidoVALOR_DEDUCOES.AsFloat ;
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

function TdtmVENDAS_Pedido.ParcelaBaixada: Boolean;
const // Verificar se o fornecedor possui registros em compra
 _SQL_PARCELAS = 'SELECT V.KVND_PEDIDO ' +
       #13#10'FROM VND_PEDIDOS V' +
       #13#10'INNER JOIN FIN_ARECEBER_PARCELAS P ON P.KFIN_ARECEBER = V.KFIN_ARECEBER' +
       #13#10'WHERE P.PAGO IS NOT NULL AND V.KVND_PEDIDO = :KEY ROWS 1' ;

var
  cds : TClientDataSet ;
  p : TParams ;

begin
  p := TParams.Create ;
  try
    cds := nil ;
    p.CreateParam ( ftString, 'KEY', ptInput ).asString := cdsPedidoKVND_PEDIDO.asString ;
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

procedure TdtmVENDAS_Pedido.EditItem;
begin
  cdsItensPedido.Edit ;
end;

procedure TdtmVENDAS_Pedido.PostItem;
begin
   LValidatePlanoContas := False ;
   try
     TCdsSuppl.PostIfNeed( cdsItensPedido );
   finally
     LValidatePlanoContas := True ;
   end
end;

procedure TdtmVENDAS_Pedido.RecebimentoAVista;
begin

end;

procedure TdtmVENDAS_Pedido.RemoveApropriacaoItens;
begin
  with cdsApropriacaoItem do
    begin
      first ;
      while not eof do
        Delete ;
    end;
end;

procedure TdtmVENDAS_Pedido.RemoveApropriacaoPatrimonio;
begin
  with cdsApropriacaoPatrimonio do
    begin
      first ;
      while not eof do
        Delete ;
    end;
end;

procedure TdtmVENDAS_Pedido.RemoveApropriacaoServico;
begin
  with cdsApropriacaoServico do
    begin
      First;
      while not Eof do
        Delete;
    end;
end;

function TdtmVENDAS_Pedido.RoundTo(const AValue: Currency;
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

procedure TdtmVENDAS_Pedido.cdsLstPedidosNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
//  cdsLstPedidosKSYSDOMAIN.asString := LoggedUser.DomainID ;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoNewRecord(DataSet: TDataSet);
//var
//  NomeCOMPRADOR : string ;
begin
  inherited;
  self.CopyKeysFromMaster ;
  GetKey ( cdsPedidoKFIN_ARECEBER );
  GetKey ( cdsPedidoKFIN_APAGAR );
  cdsPedidoKSYSDOMAIN.asString     := LoggedUser.DomainID;
  cdsPedidoDATA_VENDA.AsSQLTimeStamp := DateTimeToSQLTimeStamp( Date );
  cdsPedidoVALOR_DEDUCOES.asFloat    := 0;
  cdsPedidoTOTAL_ITENS.asFloat       := 0;
  cdsPedidoTOTAL_SERVICOS.asFloat    := 0;
  cdsPedidoTOTAL_NOTA.asFloat        := 0;
  cdsPedidoATIVO.AsString            := 'T';
  cdsPedidoIMPORTADO_NFE.asString    := 'F' ;
  cdsPedidoSYSORIGIN_TYPE.asInteger  := 0 ;
  FNewCadastro                       := True;
  ValorLinhaItens                    := 0;
  ValorLinhaServicos                 := 0;

end;

procedure TdtmVENDAS_Pedido.insereItem(
        const AKey
            , ACodigo
            , ANome
            , AUnidade : string;
        const AQtde
           ,  AValorVenda : Currency;
        const AProduto_Patrimonio : Integer ;
        const AKFIN_PlanoConta
           ,  ADescrPlanoConta : string
                          (* EV-1418 ; AControlaEstoque : boolean *)
    ) ;
var
  LQtdeIsNull : boolean ;
begin
  if not ( cdsItensPedido.State in [dsInsert, dsEdit] ) then
    cdsItensPedido.Edit;

  LQtdeIsNull := cdsItensPedidoQTDE.IsNull ;
  if LQtdeIsNull then
     cdsItensPedidoQTDE.asFloat := 1 ;


  cdsDadosProduto.Params.ParamByName( 'KEST_PRODUTO' ).asString := AKey ;
  TCDSSuppl.Open ( cdsDadosProduto ) ;

  cdsItensPedidoDETALHES.asString        := cdsDadosProdutoDESCRICAO.asString ;
  cdsItensPedidoOBS.AsString             := cdsDadosProdutoOBS.AsString ;
  cdsDadosProduto.Close ;

  cdsItensPedidoCODIGO.asString          := ACodigo ;
  cdsItensPedidoNOME.asString            := ANome ;
//  cdsItensPedidoCODIGO_NOME.asString     := CodigoProduto + ' - ' + NomeProduto ;
  cdsItensPedidoKEST_PRODUTO.asString    := AKey ;
  cdsItensPedidoUNIDADE.AsString         := AUnidade ;
  cdsItensPedidoCUSTO.AsFloat            := AValorVenda ;

  RemoveApropriacaoItens ;

  {if AControlaEstoque then -- removed EV-1418
    begin
      cdsItensPedidoDESCR_PC_NOME.AsString     := 'Estoque' ;
      cdsItensPedidoKFIN_PLANOCONTA.AsString   := FK_PLANOESTOQUE ;

      if SvcFinanceiroApropriacaoDefault.ForceCC then
        SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
                                 'EST_PRODUTOS', cdsItensPedidoKEST_PRODUTO.asString,
                                 'CMP_PEDIDO_ITENS', cdsItensPedidoKCMP_PEDIDO_ITEM.AsString,
                                 cdsApropriacaoItem,
                                 True );
    end
  else }
  if not AKFIN_PlanoConta.Trim.IsEmpty then
    begin

      cdsItensPedidoDESCR_PC_NOME.AsString     := ADescrPlanoConta ;
      cdsItensPedidoKFIN_PLANOCONTA.AsString   := AKFIN_PlanoConta ;
      //add rateio ....

      SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
          'EST_PRODUTOS'
        , cdsItensPedidoKEST_PRODUTO.asString
        , 'VND_PEDIDO_ITENS'
        , cdsItensPedidoKVND_PEDIDO_ITEM.AsString
        , cdsApropriacaoItem
        , SvcFinanceiroApropriacaoDefault.NeedCC( cdsItensPedidoKFIN_PLANOCONTA.AsString )
      );


    end;

  if LQtdeIsNull then
    begin
     //cdsItensPedidoQTDE.OnValidate := nil ;
     cdsItensPedidoQTDE.Clear ;
     //cdsItensPedidoQTDE.OnValidate := cdsItensPedidoQTDEValidate ;
    end;

end;


procedure TdtmVENDAS_Pedido.inserePatrimonio(
        const AKey
            , ACodigo
            , ANome
            , AUnidade : string;
        const AQtde
            , AValorVenda : Currency;
        const AProduto_Patrimonio : Integer ;
        const AKFIN_PlanoConta
            , ADescrPlanoConta : string
    ) ;
var
  LQtdeIsNull : boolean ;
begin
  if not ( cdsPatrimoniosPedido.State in [dsInsert, dsEdit] ) then
    cdsPatrimoniosPedido.Edit;


  cdsDadosPatrimonio.Params.ParamByName( 'KCAD_PATRIMONIO' ).asString := AKey ;
  TCDSSuppl.Open ( cdsDadosPatrimonio ) ;
  cdsPatrimoniosPedidoDETALHES.asString        := cdsDadosPatrimonioDESCRICAO.asString ;
  cdsPatrimoniosPedidoOBS.AsString             := cdsDadosPatrimonioOBS.AsString ;
  cdsDadosPatrimonio.Close ;

  cdsPatrimoniosPedidoCODIGO.asString              := ACodigo ;
  cdsPatrimoniosPedidoNOME.asString                := ANome ;
  cdsPatrimoniosPedidoKCAD_PATRIMONIO.asString     := AKey ;
  cdsPatrimoniosPedidoUNIDADE.AsString             := AUnidade ;
  cdsPatrimoniosPedidoQTDE.AsFloat                 := AQtde ;
  cdsPatrimoniosPedidoCUSTO.AsFloat                := AValorVenda ;

  RemoveApropriacaoPatrimonio ;

  LQtdeIsNull := cdsPatrimoniosPedidoQTDE.IsNull ;
  if LQtdeIsNull then
     cdsPatrimoniosPedidoQTDE.asFloat := 1 ;

  if LQtdeIsNull then
    begin
     //cdsPatrimoniosPedidoQTDE.OnValidate := nil ;
     cdsPatrimoniosPedidoQTDE.Clear ;
     //cdsPatrimoniosPedidoQTDE.OnValidate := cdsPatrimoniosPedidoQTDEValidate ;
    end;

end;



procedure TdtmVENDAS_Pedido.insereServico(
        const AKey
            , ACodigo
            , ANome
            , AUnidade : string;
        const AValorCusto : Currency
    );
begin
  if not (cdsServicosPedido.State in [dsInsert, dsEdit]) then
    cdsServicosPedido.Edit;

  cdsServicosPedidoKEST_PRODUTO.asString  := AKey ;
  cdsServicosPedidoCODIGO.asString        := ACodigo ;
  cdsServicosPedidoNOME.asString          := ANome ;
  cdsServicosPedidoCUSTO.asCurrency       := AValorCusto ;
  cdsServicosPedidoUNIDADE.AsString       := AUnidade ;

  cdsDadosProduto.Params.ParamByName( 'KEST_PRODUTO' ).asString := AKey ;
  TCDSSuppl.Open ( cdsDadosProduto ) ;
  cdsServicosPedidoDETALHES.asString := cdsDadosProdutoDESCRICAO.asString ;
  cdsServicosPedidoOBS.AsString      := cdsDadosProdutoOBS.AsString;
  cdsDadosProduto.Close ;
end;

procedure TdtmVENDAS_Pedido.LimpaProduto;
begin
  cdsItensPedidoKEST_PRODUTO.Clear;
//  cdsItensPedidoCODIGO.Clear;
//  cdsItensPedidoNOME.Clear;
end;

procedure TdtmVENDAS_Pedido.LimpaServico;
begin
  cdsServicosPedidoKEST_PRODUTO.Clear;
//  cdsServicosPedidoCODIGO.Clear;
//  cdsServicosPedidoNOME.Clear;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if not ( DataSet.State in [ dsInsert, dsEdit ] ) or ( DataSet.IsEmpty ) then
    Exit;

  CalculaTotaisPedido;

end;

procedure TdtmVENDAS_Pedido.cdsPedidoDATA_VENDAChange(Sender: TField);
begin
  cdsPedidoDATA_EMISSAO.AsDateTime := Sender.AsDateTime ;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoDATA_VENDAValidate(Sender: TField);
begin
  if Sender.AsDateTime > Date then
    raise Warning.Create('Data de venda não pode ser superior a data atual');
end;

procedure TdtmVENDAS_Pedido.cdsPedidoKCAD_ENTIDADEValidate(Sender: TField);
begin
  ValidNF ;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoDATA_EMISSAOValidate(Sender: TField);
begin
//  if Sender.AsDateTime > Date then
//    raise Warning.Create('Data de emissão não pode ser superior a data atual');
end;

procedure TdtmVENDAS_Pedido.SetEntidade(Key: String; NomeEntidade: string);
var
  Dados, Email, Fone : String ;
//  KCAD_VENDEDOR, KCAD_TRANSPORTADORA, KCAD_REDESPACHO : integer ;
//  DDSFAT : string ;
//  CondPagto : integer ;
begin
  if not ( cdsPedido.State in [dsInsert,dsEdit] ) then
    cdsPedido.Edit ;

  cdsPedidoKCAD_ENTIDADE.asString := Key ;
  cdsPedidoNOMEENTIDADE.asString  := NomeEntidade ;

   cdsDadosEntidade.Edit ;
   cdsDadosEntidadeKCAD_ENTIDADE.asString := Key ;

//   scRdmCOMPRAS_Pedido.AppServer.GetDadosEntidade( Key, Dados, Email, Fone ) ;
//   DBResources.GetDadosEntidade( Key, Dados, Email, Fone, KCAD_VENDEDOR, KCAD_TRANSPORTADORA, KCAD_REDESPACHO, DDSFAT, CondPagto ) ;

   cdsDadosEntidadeDADOSENTIDADE.asString  := Dados ;
//   cdsPedidoEMAIL.asString  := Email ;
//   cdsPedidoFONE.asString  := Fone ;
   cdsDadosEntidade.Post ;

  cdsAReceber.Edit ;
  cdsAReceberKCAD_ENTIDADE.AsString := cdsPedidoKCAD_ENTIDADE.AsString ;
  cdsAReceberNOMEENTIDADE.asString  := cdsPedidoNOMEENTIDADE.asString ;

end;

procedure TdtmVENDAS_Pedido.SetFilter(ShowInativos: Boolean; DataInicial, DataFinal : TDateTime );
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

procedure TdtmVENDAS_Pedido.SetKVND_PEDIDO(const Value: string);
begin
  FKVND_PEDIDO := Value;
end;

procedure TdtmVENDAS_Pedido.SetParams;
begin
  cdsLstPedidos.Params.ParamByName( 'KSYS$DOMAIN' ).asString       := LoggedUser.DomainID ;
  cdsLstPedidos.Params.ParamByName( 'DSP_INATIVO' ).asString       := BoolToChar ( FShowInativos ) ;
  cdsLstPedidos.Params.ParamByName( 'DATAINI'     ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataInicial ) ;
  cdsLstPedidos.Params.ParamByName( 'DATAFIM'     ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFinal ) ;

  if FKVND_PEDIDO = '' then
     cdsLstPedidos.Params.ParamByName ( 'LISTALL' ).asString := 'T'
  else
     cdsLstPedidos.Params.ParamByName ( 'LISTALL' ).asString := 'F' ;

  cdsLstPedidos.Params.ParamByName ( 'KVND_PEDIDO' ).asString := FKVND_PEDIDO ;
end;

procedure TdtmVENDAS_Pedido.sqlPedidoBeforeOpen(DataSet: TDataSet);
begin
  FSQLPedidosRequiredField := sqlPedido.RequiredFields.Required ( False ) ;
end;

procedure TdtmVENDAS_Pedido.ValidNF;
begin
  if  ( cdsPedidoNOTA_FISCAL.isNull   )
   or ( Trim ( cdsPedidoNOTA_FISCAL.AsString  ) = '')  then
     exit ;

  if TSQLSuppl.CheckExistsIn(    'VND_PEDIDOS',
                                 'NOTA_FISCAL;SERIE', VarArrayOf ( [ cdsPedidoNOTA_FISCAL.asString, cdsPedidoSERIE.asString ] ),
                                 Format ( 'KVND_PEDIDO <> %s ', [ QuotedStr( cdsPedidoKVND_PEDIDO.asString ) ] ),
                                 TSQLConnection ( DBResources[ 'FINANCEIRO' ].Connection ) ) then
        Raise Warning.Create( _ERRMSG_NOTA_JA_CADASTRADA ) ;
end;

procedure TdtmVENDAS_Pedido.SetCOMPRADOR( Key, NomeCOMPRADOR: string );
begin
   if not ( cdsPedido.State in [dsInsert,dsEdit] ) then
      cdsPedido.Edit ;

//   cdsPedidoNOMECOMPRADOR.asString := NomeCOMPRADOR ;
//   cdsPedidoKCOMPRADOR.asInteger := Key ;
end;

procedure TdtmVENDAS_Pedido.SetConta(KFIN_CONTA, NOME: string);
begin
  if not ( cdsParcelas.State in [dsInsert,dsEdit] ) then
    cdsParcelas.Edit ;

  cdsParcelasKFIN_CONTA.AsString := KFIN_CONTA;
  cdsParcelasNOMECONTA.AsString  := NOME;
end;

(*
procedure TdtmVENDAS_Pedido.SetContaFavorita;
const
  SQL_CONTA_FAVORITA = 'SELECT C.KFIN_CONTA, C.NOME FROM FIN_CONTAS C'
                +#13#10' INNER JOIN SYS$DOMAIN_TYPES T ON T.SYS$VALUE = C.KFIN_CONTA AND T.SYS$TYPE = ''%s''';
var
  cds: TClientDataSet;
begin
  cds := nil;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet(cds, Format(SQL_CONTA_FAVORITA,['CONTA_FAVORITA']));
  if not cds.IsEmpty then
   begin
     FKContaFavorita    := cds.FieldByName('KFIN_CONTA').AsString;
     FNomeContaFavorita := cds.FieldByName('NOME').AsString;
   end
  else
   begin
     FKContaFavorita    := '';
     FNomeContaFavorita := '';
   end;
  cds.Free;
end;
*)

procedure TdtmVENDAS_Pedido.GetContaFavorita;
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

procedure TdtmVENDAS_Pedido.SetContaPreferencial(KFIN_CONTA, NOME: string);
begin
  if not ( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
    cdsParcelas.Edit ;

  FKContaPadrao := KFIN_CONTA;
  FNomeConta    := NOME;
  cdsAReceberKFIN_CONTA_PREF.AsString := FKContaPadrao;
  cdsAReceberNOMECONTA.AsString       := FNomeConta;
end;

procedure TdtmVENDAS_Pedido.SetContaPreferencialApagar(KFIN_CONTA,
  NOME: string);
begin
  if not ( cdsParcelasAPagar.State in [ dsInsert, dsEdit ] ) then
    cdsParcelasAPagar.Edit ;

  FKContaPadrao := KFIN_CONTA;
  FNomeConta    := NOME;
  cdsAPagarKFIN_CONTA_PREF.AsString := FKContaPadrao;
  cdsAPagarNOMECONTA.AsString       := FNomeConta;

end;

procedure TdtmVENDAS_Pedido.SetContato(Key: String;
  NomeContato : string ; Depto : string = '' ; Email : string = '' ; Fone  : string = '' ) ;
begin
   if not ( cdsPedido.State in [dsInsert,dsEdit] ) then
      cdsPedido.Edit ;
{
   cdsPedidoNOMECONTATO.asString := NomeContato ;
   cdsPedidoDepto.asString := Depto ;
   if ( Email <> '' ) then
      cdsPedidoEmail.asString := Email ;
   if ( Fone <> '' ) then
      cdsPedidoFone.asString := Fone ;
   cdsPedidoKCAD_CONTATO.asInteger := Key ;
}
end;

procedure TdtmVENDAS_Pedido.cdsItensPedidoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if not ( DataSet.State in [dsInsert,dsEdit] ) or ( DataSet.IsEmpty ) then
    Exit ;

  cdsItensPedido.OnCalcFields := nil ;
  cdsItensPedidoTOTAL.asFloat := RoundTo((cdsItensPedidoQTDE.asFloat * cdsItensPedidoCUSTO.asFloat), -2) ;
  cdsItensPedido.OnCalcFields := cdsItensPedidoCalcFields ;

  CalculaTotaisPedido ;
end;

procedure TdtmVENDAS_Pedido.cdsItensPedidoCODIGOSetText(Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  LimpaProduto ;
end;

procedure TdtmVENDAS_Pedido.cdsItensPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TdtmVENDAS_Pedido.cdsItensPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
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

procedure TdtmVENDAS_Pedido.cdsItensPedidoIS_PATRIMONIOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if ( Sender.DataSet.FieldByName ( 'IS_PATRIMONIO' ).AsString = 'F' ) then
      Text := 'Produto'
    else if ( Sender.DataSet.FieldByName ( 'IS_PATRIMONIO' ).AsString = 'T' ) then
      Text := 'Patrimônio';
end;

procedure TdtmVENDAS_Pedido.cdsItensPedidoNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsItensPedidoKVND_PEDIDO_ITEM ) ;
  cdsItensPedidoIS_PATRIMONIO.AsString := 'F';
end;

procedure TdtmVENDAS_Pedido.cdsItensPedidoNOMESetText(Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  LimpaProduto ;
end;

procedure TdtmVENDAS_Pedido.cdsItensPedidoSomaTotalGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if ( Sender.dataSet.state in [ dsInsert,dsEdit ] ) then
      Text := FormatFloat ( '#,0.00',
                TryVarToFloat ( Sender.Value )
              - ValorLinhaItens
              + cdsItensPedidoTOTAL.asFloat )
    else
      Text := FormatFloat ( '#,0.00',
                 TryVarToFloat( Sender.Value ) ) ;
end;

procedure TdtmVENDAS_Pedido.cdsItensPedidoBeforeInsert(DataSet: TDataSet);
begin
  LValidatePlanoContas    := True ;
  ValorLinhaItens := 0 ;
  if cdsPedido.isEmpty and not (cdsPedido.State in [dsInsert,dsEdit]) then
     cdsPedido.Append ;
end;

(*
var
  LErrMsg : TStringBuilder ;
begin

  if FDisableCheckItems then
    exit ;

  LErrMsg := TStringBuilder.Create ;

// não controla estoque !!
//  if ( cdsItensPedidoKEST_PRODUTO.IsNull ) then
//    LErrMsg.AppendLine('Produto deve ser pesquisado/selecionado.');

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



*)

procedure TdtmVENDAS_Pedido.cdsItensPedidoBeforePost(DataSet: TDataSet);
var
  LErrMsg : TStringBuilder ;
begin
  LErrMsg := TStringBuilder.Create ;

  if ( ( cdsItensPedidoIS_PATRIMONIO.AsString = 'T' ) and ( cdsItensPedidoKCAD_PATRIMONIO.IsNull ) ) then
    LErrMsg.AppendLine('Patrimônio deve ser pesquisado/selecionado.');

  if ( ( cdsItensPedidoIS_PATRIMONIO.AsString = 'F' ) and ( cdsItensPedidoKEST_PRODUTO.IsNull ) ) then
    LErrMsg.AppendLine('Produto deve ser pesquisado/selecionado.');

  if ( ( cdsItensPedidoQTDE.IsNull ) or ( cdsItensPedidoQTDE.asFloat = 0 )
   and ( cdsItensPedidoCUSTO.IsNull or ( cdsItensPedidoCUSTO.asFloat = 0 )) )then
    LErrMsg.AppendLine(' Quantidade e custo deve ser digitado');

  if LValidatePlanoContas and cdsItensPedidoKFIN_PLANOCONTA.IsNull then
    LErrMsg.AppendLine('Conta contábil deve ser pesquisada/selecionada.');

  try
    if LErrMsg.Length > 0 then
       raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if cdsLstPedidos.isEmpty and not (cdsLstPedidos.State in [dsInsert,dsEdit]) then
     cdsLstPedidos.Append ;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoBeforeOpen(DataSet: TDataSet);
begin
  FCDSPedidosRequiredField := cdsPedido.RequiredFields.Required ( False ) ;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoBeforePost(DataSet: TDataSet);
begin
//  if not FNewCadastro and( FormatDateTime('mm', DataEmissao ) < FormatDateTime('mm', Date - 1 )) then
//    begin
//      CancelUpdates;
//      raise Warning.Create('Não é permitido alterar este pedido.');
//    end;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoNOMEENTIDADESetText(Sender: TField; const Text: string);
begin
  cdsPedidoKCAD_ENTIDADE.Clear ;
  Sender.asString := Text ;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoNOTA_FISCALValidate(Sender: TField);
begin
   ValidNF ;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoSERIEValidate(Sender: TField);
begin
  ValidNF ;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoNOMECONTATOValidate(Sender: TField);
begin
  inherited;
//  cdsPedidoKCAD_CONTATO.Clear ;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoNOMECOMPRADORValidate(Sender: TField);
begin
  inherited;
//  cdsPedidoKCOMPRADOR.Clear ;
end;

procedure TdtmVENDAS_Pedido.CheckMesEncerrado;
var
  p : TParams ;
  nPos: Integer;
  msg : string ;
begin
  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString       := cdsPedidoKSYSDOMAIN.asString ;
  p.CreateParam( ftString, 'DATA',         ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( cdsPedidoDATA_EMISSAO.asDateTime ) ;
  try

    try
      sqlPedido.SQLConnection.Execute ( 'EXECUTE PROCEDURE EST_CHECK_ENCERRAMENTO_MES ( :KSYS$DOMAIN, :DATA, ''F'' )', p )
    except
      on e: exception do
      begin
      {Faz o mesmo que a função TranslateMessages da unit UApplResouces,
       porém quando o grid é quem dá a entrada na TranslateMessages sem ter o
       try except o sistema congela ao chegar no raise e para de funcionar. }
       nPos  := Pos ( 'SYS$EXCEPTION', E.Message ) ;

       if ( nPos <> 0 ) then
         begin
           Msg := Copy ( E.Message,nPos + 14, MaxInt ) ;
           Msg := Copy ( Msg, 1, Pos ( #10, Msg  ) ) ;
           raise TranslatedWarning.Create( msg );
         end;

      end;
    end;

  finally
    p.free ;
  end;
end;

procedure TdtmVENDAS_Pedido.CheckPagamentoAVista;
begin
  if ( cdsAReceberPAGTO_AVISTA.AsBoolean ) then
    begin
      if ( cdsParcelasCHEQUE.AsBoolean ) and ( cdsParcelasNUM_CHEQUE.IsNull ) then
         raise Warning.Create('Número de cheque é obrigatório para recebimento à vista com cheque')
      else
      if ( not cdsParcelasCHEQUE.AsBoolean ) and ( not cdsParcelasNUM_CHEQUE.IsNull ) then
         raise Warning.Create('Número do cheque não pode estar preenchido para recebimento à vista sem cheque')
      else
      if cdsParcelas.RecordCount > 1 then
         raise Warning.Create('Apenas 1 parcela pode ser inserida para recebimento à vista')
    end
  else
    begin
      if (( cdsParcelasCHEQUE.AsBoolean ) or ( not cdsParcelasNUM_CHEQUE.IsNull )) and
         ( cdsParcelasPAGTO.IsNull ) then
         raise Warning.Create('Cheque só pode ser inserido para recebimento à vista')
    end;
end;

procedure TdtmVENDAS_Pedido.CheckValorAPagar;
begin

  TCdsSuppl.PostIfNeed( cdsPedido );
  TCdsSuppl.PostIfNeed( cdsParcelas );

  if cdsItensPedido.IsEmpty and cdsServicosPedido.IsEmpty then
    raise Warning.Create('Não é possível salvar pedido sem ítem ou serviço especificado.');

  if cdsPedidoSYSORIGIN_TYPE.asInteger <> 2 then
    if  ( cdsParcelas.IsEmpty ) then
      raise Warning.Create('Não é possível salvar o pedido sem gerar o contas a receber.');

  if cdsPedidoSYSORIGIN_TYPE.asInteger <> 2 then
    if (  (   RoundTo ( cdsPedidoTOTAL_NOTA.AsFloat, -2 )
            - RoundTo ( cdsPedidoVALOR_DEDUCOES.AsFloat, -2 )
          )
          <> RoundTo ( TryVarToFloat ( cdsParcelasSomaValor.Value ), -2 ) ) then
      raise Warning.Create('Total das parcelas não confere com o total da venda');

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

end;

procedure TdtmVENDAS_Pedido.ClonePedido;
var
  Clone : TClientDataSet ;

   procedure copyHeader ;
   begin
      cdsLstPedidos.Append ;
      cdsPedido.Append ;

      SetEntidade ( Clone.fieldByName ( 'KCAD_ENTIDADE' ).asString,
                    Clone.fieldByName ( 'NOMEENTIDADE' ).asString ) ;

      SetContato(   Clone.fieldByName ( 'KCAD_CONTATO' ).asString,
                    Clone.fieldByName ( 'NOMECONTATO' ).asString,
                    Clone.fieldByName ( 'DEPTO' ).asString,
                    Clone.fieldByName ( 'EMAIL' ).asString,
                    Clone.fieldByName ( 'FONE' ).asString ) ;

      cdsPedidoOBS.asString                   :=  Clone.fieldByName ( 'OBS' ).asString            ;
//      cdsPedidoVALIDADE.asInteger            :=  Clone.fieldByName ( 'VALIDADE' ).asInteger      ;
      cdsPedido.Post ;
   end ;

   procedure  CopyItensPedido ( DataSet : TDataSet ) ;
   begin
      with DataSet do
         begin
            cdsItensPedido.Append ;
            cdsItensPedidoKEST_PRODUTO.asInteger      := fieldByName ( 'KEST_PRODUTO' ).asInteger ;
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
   Clone.SetProvider( cdsPedido ) ;
   Clone.Open ;

   copyHeader ;
   copyProdutos ;

   Clone.Close ;
   Clone.Free ;
end;

procedure TdtmVENDAS_Pedido.InitPlanoContaEstoque;
const
 _SELECT_PLANOESTOQUE =
    'SELECT KFIN_PLANOCONTA FROM FIN_PLANOCONTAS WHERE KDEF_PLANOCONTA = ''W@)uq2^5:hOF:p/?aUmm''' ;
var
  cds : TClientDataSet ;
begin
  cds := nil ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SELECT_PLANOESTOQUE ) ;
  FK_PLANOESTOQUE := cds.FieldByName( 'KFIN_PLANOCONTA' ).asString ;
  cds.Free ;
end;

procedure TdtmVENDAS_Pedido.OpenPedido(KPedido: String);
var
  i : integer ;
begin
   if cdsPedido.Active then
      cdsPedido.Close ;

   cdsPedido.MasterFields  := '' ;
   cdsPedido.MasterSource  := nil ;
   cdsPedido.PacketRecords := -1 ;
   cdsPedido.Params.ParamByName( 'KVND_PEDIDO' ).asString := KPedido ;
   TCDSSuppl.Open ( cdsPedido ) ;
end;

procedure TdtmVENDAS_Pedido.cdsAReceberNewRecord(DataSet: TDataSet);
begin
  inherited;

  GetContaFavorita ;

  cdsAReceberKFIN_ARECEBER.AsString   := cdsPedidoKFIN_ARECEBER.AsString ;
  cdsAReceberKSYSDOMAIN.AsString    := LoggedUser.DomainID;
  cdsAReceberTABLENAME.asString       := 'VND_PEDIDOS' ;
  cdsAReceberTABLEKEY.AsString        := cdsPedidoKVND_PEDIDO.AsString ;
  cdsAReceberATIVO.asString           := 'T' ;
  cdsAReceberKCAD_ENTIDADE.AsString   := cdsPedidoKCAD_ENTIDADE.AsString ;
  cdsAReceberNOMEENTIDADE.asString    := cdsPedidoNOMEENTIDADE.asString ;
  cdsAReceberHISTORICO.asString       := Format( 'Nota fiscal de venda: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] );
  cdsAReceberDOCUMENTO.AsString       := cdsPedidoNOTA_FISCAL.AsString ;
  cdsAReceberDATALANCTO.AsDateTime    := cdsPedidoDATA_EMISSAO.AsDateTime ;
  cdsAReceberNUM_PARCELAS.AsInteger   := 1 ;
  cdsAReceberPROXIMO_MES.AsString     := 'F' ;
  cdsAReceberANUAL.AsString           := 'F' ;
  cdsAReceberRECORRENCIA.AsString     := 'F' ;
  cdsAReceberDIA_VENCTO.AsInteger     := 1 ;
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

procedure TdtmVENDAS_Pedido.cdsAReceberNOMECONTASetText(Sender: TField; const Text: string);
begin
  //FKContaPadrao := '';
  //FNomeConta    := '';
  //cdsAReceberKFIN_CONTA_PREF.Clear;
  Sender.asString := Text ;
end;

procedure TdtmVENDAS_Pedido.cdsAReceberPAGTO_AVISTAChange(Sender: TField);
begin
 cdsAReceberPAGTO_AVISTA.OnChange := nil ;
 try
   //if Sender.asBoolean then
     PagamentoAVista;
 finally
     cdsAReceberPAGTO_AVISTA.OnChange := cdsAReceberPAGTO_AVISTAChange
 end;
end;

procedure TdtmVENDAS_Pedido.cdsParcelasNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsParcelasKFIN_ARECEBER_PARCELA ) ;
  cdsParcelasKFIN_ARECEBER.asString := cdsARECEBERKFIN_ARECEBER.asString ;
  cdsParcelasKFIN_ARECEBER.asString := cdsAReceberKFIN_ARECEBER.asString ;
  cdsParcelasPREVISAO.asString := 'T' ;
  cdsParcelasDUVIDOSO.asString := 'F' ;
end;

procedure TdtmVENDAS_Pedido.cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
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

procedure TdtmVENDAS_Pedido.cdsParcelasVENCTOChange(Sender: TField);
begin
  if FKContaPadrao <> EmptyStr then
    begin
      cdsParcelasKFIN_CONTA.AsString := FKContaPadrao;
      cdsParcelasNOMECONTA.AsString  := FNomeConta;
    end;
end;

procedure TdtmVENDAS_Pedido.cdsParcelasBeforeDelete(DataSet: TDataSet);
begin
  if not cdsParcelasPAGTO.IsNull then
    raise Warning.Create('Não pode excluir parcela já baixada');
end;

procedure TdtmVENDAS_Pedido.cdsParcelasBeforeEdit(DataSet: TDataSet);
begin
  if ( not cdsParcelasPAGTO.IsNull ) and ( not cdsAReceberPAGTO_AVISTA.AsBoolean) then
    raise Warning.Create('Não pode editar parcela já baixada');
end;

procedure TdtmVENDAS_Pedido.cdsParcelasBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsAReceber.IsEmpty ) and not ( cdsAReceber.State in [dsInsert,dsEdit] )  then
     cdsAReceber.Append ;
end;

procedure TdtmVENDAS_Pedido.cdsParcelasBeforePost(DataSet: TDataSet);
begin

  if (( cdsAReceberPAGTO_AVISTA.AsBoolean ) and ( cdsParcelasCHEQUE.AsBoolean )) or
     (( not cdsParcelasCHEQUE.AsBoolean ) and ( cdsParcelasPAGTO.IsNull))  then
     cdsParcelasDT_COMPENSACAO.Clear;


end;

procedure TdtmVENDAS_Pedido.cdsParcelasCHEQUEChange(Sender: TField);
begin
  if cdsParcelasCHEQUE.asBoolean then
      cdsParcelasDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasPAGTO.AsSQLTimeStamp ;
      cdsParcelasNUM_CHEQUE.Clear ;
    end ;
end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoBeforeEdit(DataSet: TDataSet);
begin
  ValorLinhaServicos := cdsServicosPedidoTOTAL.asFloat ;
end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  ValorLinhaServicos := 0 ;
  if cdsPedido.isEmpty and not (cdsPedido.State in [dsInsert,dsEdit]) then
     cdsPedido.Append ;
end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoBeforePost(DataSet: TDataSet);
var
  LErrMsg : TStringBuilder ;
begin

  LErrMsg := TStringBuilder.Create ;

  if cdsServicosPedidoKEST_PRODUTO.IsNull then
    LErrMsg.AppendLine('Serviço deve ser pesquisado/selecionado.');

  if ( ( cdsServicosPedidoQTDE.IsNull ) or ( cdsServicosPedidoQTDE.asFloat = 0 )
   and ( cdsServicosPedidoCUSTO.IsNull or ( cdsServicosPedidoCUSTO.asFloat = 0 )) )then
    LErrMsg.AppendLine('Quantidade e custo deve ser digitado');

  if cdsServicosPedidoKFIN_PLANOCONTA.IsNull then
    LErrMsg.AppendLine('Conta contábil deve ser pesquisada/selecionada.');

  try
    if LErrMsg.Length > 0 then
       raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;

end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if not ( DataSet.State in [dsInsert,dsEdit] ) or ( DataSet.IsEmpty )then
     Exit;

  cdsServicosPedido.OnCalcFields := nil ;
  cdsServicosPedidoTOTAL.asFloat := cdsServicosPedidoQTDE.asFloat * cdsServicosPedidoCUSTO.asFloat ;
  cdsServicosPedido.OnCalcFields := cdsServicosPedidoCalcFields ;

  CalculaTotaisPedido ;
end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoCODIGOSetText(Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  LimpaServico ;
end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
begin
  with cdsApropriacaoServico do
    begin
      First;
      while not Eof do
        Delete;
    end;

  cdsServicosPedidoDESCR_PC_NOME.Clear;
  Sender.asString := Text ;
end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoKFIN_PLANOCONTAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName( 'KFIN_PLANOCONTA' ).IsNull then
      Text := 'Não'
    else
      Text := 'Sim';
end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsServicosPedidoKVND_PEDIDO_SERVICO ) ;
end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoNOMESetText(Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  LimpaServico ;
end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoSomaTotalGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if ( Sender.dataSet.state in [ dsInsert,dsEdit ] ) then
      Text := FormatFloat ( '#,0.00',
                TryVarToFloat ( Sender.Value )
              - ValorLinhaServicos
              + cdsServicosPedidoTOTAL.asFloat )
    else
      Text := FormatFloat ( '#,0.00',
                TryVarToFloat( Sender.Value ) ) ;
end;

procedure TdtmVENDAS_Pedido.cdsAPagarNewRecord(DataSet: TDataSet);
begin

  GetContaFavorita ;

  cdsAPagarKFIN_APAGAR.AsString   := cdsPedidoKFIN_APAGAR.AsString ;
  cdsAPagarKSYSDOMAIN.AsString    := LoggedUser.DomainID;
  cdsAPagarTABLENAME.asString     := 'VND_PEDIDOS' ;
  cdsAPagarTABLEKEY.AsString      := cdsPedidoKVND_PEDIDO.AsString ;
  cdsAPagarATIVO.asString         := 'T' ;
  cdsAPagarKCAD_ENTIDADE.AsString := cdsPedidoKCAD_ENTIDADE.AsString ;
  cdsAPagarNOMEENTIDADE.asString  := cdsPedidoNOMEENTIDADE.asString ;
  cdsAPagarDATALANCTO.AsDateTime  := cdsPedidoDATA_EMISSAO.AsDateTime ;
  cdsAPagarHISTORICO.asString     := Format( 'Nota fiscal de venda: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] ) ;
  cdsAPagarDOCUMENTO.AsString     := cdsPedidoNOTA_FISCAL.AsString ;
  cdsAPagarNUM_PARCELAS.AsInteger := 1 ;
  cdsAPagarPROXIMO_MES.AsString   := 'F' ;
  cdsAPagarANUAL.AsString         := 'F' ;
  cdsAPagarRECORRENCIA.AsString   := 'F' ;
  cdsAPagarDIA_VENCTO.AsInteger   := 1 ;
  cdsAPagarPAGTO_AVISTA.asString := 'F' ;
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
  cdsAPagarKFIN_CONTA_PREF.AsString := FKContaPadrao;
  cdsAPagarNOMECONTA.AsString := FNomeConta;

end;

procedure TdtmVENDAS_Pedido.cdsApropriacaoItemCLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TdtmVENDAS_Pedido.cdsApropriacaoItemNewRecord(DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoItemKFIN_APROPRIACAO );
  cdsApropriacaoItemTABLENAME.AsString := 'VND_PEDIDO_ITENS';
  cdsApropriacaoItemTABLEKEY.AsString  := cdsItensPedidoKVND_PEDIDO_ITEM.AsString;
end;

procedure TdtmVENDAS_Pedido.cdsApropriacaoServicoCLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TdtmVENDAS_Pedido.cdsApropriacaoServicoNewRecord(DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoServicoKFIN_APROPRIACAO );
  cdsApropriacaoServicoTABLENAME.AsString := 'VND_PEDIDO_SERVICOS';
  cdsApropriacaoServicoTABLEKEY.AsString := cdsServicosPedidoKVND_PEDIDO_SERVICO.AsString;
end;

procedure TdtmVENDAS_Pedido.cdsItensPedidoAfterCancel(DataSet: TDataSet);
begin
  ValorLinhaItens := 0 ;
  CalculaTotaisPedido ;
end;

procedure TdtmVENDAS_Pedido.cdsItensPedidoAfterDelete(DataSet: TDataSet);
begin
  ValorLinhaItens := 0  ;
  CalculaTotaisPedido ;
end;

procedure TdtmVENDAS_Pedido.cdsItensPedidoBeforeEdit(DataSet: TDataSet);
begin
  LValidatePlanoContas := True ;
//  ValorLinhaItensParcial  := cdsItensPedidoVALOR_PARCIAL.asFloat ;
//  ValorLinhaItensTotal    := cdsItensPedidoTOTAL.asFloat ;
//  ValorLinhaItensTotalIPI := cdsItensPedidoVALOR_IPI.AsFloat;


  ValorLinhaItens := cdsItensPedidoTOTAL.asFloat ;
end;

{-- calculo servicos --}

procedure TdtmVENDAS_Pedido.cdsServicosPedidoAfterCancel(DataSet: TDataSet);
begin
  ValorLinhaServicos := 0 ;
  CalculaTotaisPedido ;
end;

procedure TdtmVENDAS_Pedido.cdsServicosPedidoAfterDelete(
  DataSet: TDataSet);
begin
  ValorLinhaServicos := 0 ;
  CalculaTotaisPedido ;
end;


procedure TdtmVENDAS_Pedido.CalculaTotais;
begin
  if not ( cdsPedido.State in [ dsInsert, dsEdit ] ) then
    cdsPedido.Edit ;
end;

procedure TdtmVENDAS_Pedido.CalculaTotaisPedido;
begin
  cdsPedido.onCalcFields := nil ;
  try
    if ( cdsItensPedido.state in [ dsInsert,dsEdit ] ) then
      cdsPedidoTOTAL_ITENS.asFloat    :=  RoundTo( TryVarToFloat ( cdsItensPedidoSomaTotal.Value )
                                         - ValorLinhaItens
                                         + cdsItensPedidoTOTAL.asFloat, -4 )
    else
      if cdsItensPedido.IsEmpty then
        cdsPedidoTOTAL_ITENS.AsFloat := 0
      else
        cdsPedidoTOTAL_ITENS.asFloat    := RoundTo ( TryVarToFloat( cdsItensPedidoSomaTotal.Value ), -4 ) ;

    if ( cdsServicosPedido.state in [ dsInsert,dsEdit ] ) then
      cdsPedidoTOTAL_SERVICOS.asFloat := RoundTo (  TryVarToFloat ( cdsServicosPedidoSomaTotal.Value )
                                         - ValorLinhaServicos
                                         + cdsServicosPedidoTOTAL.asFloat, -4 )
    else
      if cdsServicosPedido.IsEmpty then
        cdsPedidoTOTAL_SERVICOS.AsFloat := 0
      else
        cdsPedidoTOTAL_SERVICOS.asFloat := RoundTo( TryVarToFloat( cdsServicosPedidoSomaTotal.Value ), -4 ) ;

    cdsPedidoTOTAL_NOTA.asFloat       := RoundTo( (   cdsPedidoTOTAL_ITENS.asFloat
                                                    + cdsPedidoTOTAL_SERVICOS.asFloat
                                                    + cdsPedidoIMPOSTOS.AsFloat
                                                    + cdsPedidoFRETE.AsFloat )
                                                    - cdsPedidoDESCONTOS.AsFloat, -2 ) ;
  finally
     cdsPedido.onCalcFields           := cdsPedidoCalcFields ;
  end ;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoAfterInsert(DataSet: TDataSet);
begin
  FCDSPedidosRequiredField.Required ( False ) ;
  cdsPedido.Post ;
  cdsAReceber.Append ;
  cdsAReceber.Post ;
  cdsPedido.Edit ;
  cdsAReceber.Edit ;
  FCDSPedidosRequiredField.Required ( True ) ;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
  if not ( cdsPedido.IsEmpty ) and ( cdsPedidoTOTAL_NOTA.asFloat < 0.01 ) then
    Raise Warning.Create( _ERRMSG_TOTAL_ZERO );

//  if cdsPedidoTOTALPEDIDO.asFloat <> TryVarToFloat( cdsParcelasSomaValor.Value, -2 ) then
//     Raise Error.Create( _ERRMSG_TOTAL_APGAGAR );
end;

procedure TdtmVENDAS_Pedido.cdsPedidoBeforeDelete(DataSet: TDataSet);
begin


  if cdsPedidoSYSORIGIN_TYPE.asInteger = 2 then
    raise Warning.Create( 'Pedido incluido via sincronismo.' + #10#13 + 'Não pode ser excluído.' );


  CheckMesEncerrado ;

  if ParcelaBaixada then
    raise Warning.Create( 'Existe(m) parcela(s) já baixada(s).' + #10#13 + 'Não pode ser excluída.' );


  if cdsAReceber.RecordCount > 0 then
    cdsAReceber.Delete;
end;

procedure TdtmVENDAS_Pedido.cdsPedidoBeforeEdit(DataSet: TDataSet);
begin
  CheckMesEncerrado ;

  if ParcelaBaixada then
    raise Warning.Create( 'Existe(m) parcela(s) já baixada(s).' + #10#13 + 'Venda não pode ser alterada.' );


  DataEmissao  := cdsPedidoDATA_EMISSAO.AsDateTime ;

  if not cdsAReceberKFIN_CONTA_PREF.IsNull then
    begin
      FKContaPadrao := cdsAReceberKFIN_CONTA_PREF.AsString;
      FNomeConta    := cdsAReceberNOMECONTA.AsString;
    end;
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoCalcFields(DataSet: TDataSet);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoNewRecord(DataSet: TDataSet);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoBeforeInsert(DataSet: TDataSet);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoBeforePost(DataSet: TDataSet);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoBeforeEdit(DataSet: TDataSet);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoAfterCancel(DataSet: TDataSet);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoAfterDelete(DataSet: TDataSet);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoCODIGOSetText(Sender: TField; const Text: string);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoNOMESetText(Sender: TField; const Text: string);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoIS_PATRIMONIOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsPatrimoniosPedidoSomaTotalGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsApropriacaoPatrimonioNewRecord(DataSet: TDataSet);
begin
  //
end;

procedure TdtmVENDAS_Pedido.cdsApropriacaoPatrimonioCLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  //
end;



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



procedure TdtmVENDAS_Pedido.cdsParcelasAPagarNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsParcelasAPagarKFIN_APAGAR_PARCELA ) ;
  cdsParcelasAPagarKFIN_APAGAR.asString := cdsApagarKFIN_APAGAR.asString ;
  cdsParcelasAPagarPREVISAO.asString  := 'T' ;
  cdsParcelasAPagarDUVIDOSO.asString  := 'F' ;
  cdsParcelasAPagarCHEQUE.asString    := 'F' ;
end;

procedure TdtmVENDAS_Pedido.cdsParcelasAPagarNOMECONTASetText(Sender: TField; const Text: string);
begin
  if Sender.AsString <> FNomeConta then
    begin
      if not( cdsParcelasAPagar.State in [dsInsert, dsEdit] ) then
        cdsParcelasAPagar.Edit;

      FKContaPadrao := '';
      FNomeConta    := '';
      cdsParcelasAPagarKFIN_CONTA.Clear;
    end;
  Sender.asString := Text ;
end;

procedure TdtmVENDAS_Pedido.cdsParcelasAPagarNUM_CHEQUESetText(Sender: TField;
  const Text: string);
begin
  if Text.Trim = '' then
   begin
    cdsParcelasAPagarNUM_CHEQUE.Clear ;
    cdsParcelasAPagarCHEQUE.asString := 'F' ;
   end
  else
   begin
    cdsParcelasAPagarNUM_CHEQUE.asString := Text ;
    cdsParcelasAPagarCHEQUE.asString := 'T' ;
   end;
end;


procedure TdtmVENDAS_Pedido.cdsParcelasAPagarVENCTOChange(Sender: TField);
begin
  if FKContaPadrao <> EmptyStr then
    begin
      cdsParcelasAPagarKFIN_CONTA.AsString := FKContaPadrao;
      cdsParcelasAPagarNOMECONTA.AsString  := FNomeConta;
    end;
end;

procedure TdtmVENDAS_Pedido.cdsParcelasAPagarBeforeDelete(DataSet: TDataSet);
begin
  if not cdsParcelasAPagarPAGTO.IsNull then
    raise Warning.Create('Não pode excluir parcela já baixada');
end;

procedure TdtmVENDAS_Pedido.cdsParcelasAPagarBeforeEdit(DataSet: TDataSet);
begin
  if ( not cdsParcelasAPagarPAGTO.IsNull ) and ( cdsAPagarPAGTO_AVISTA.AsString <> 'T' ) then
    raise Warning.Create('Não pode editar parcela já baixada');
end;

procedure TdtmVENDAS_Pedido.cdsParcelasAPagarBeforeInsert(DataSet: TDataSet);
begin
  if ( cdsAPagar.IsEmpty ) and not ( cdsAPagar.State in [dsInsert,dsEdit] )  then
     cdsAPagar.Append ;
end;

procedure TdtmVENDAS_Pedido.cdsParcelasAPagarBeforePost(DataSet: TDataSet);
begin

  if (( cdsAPagarPAGTO_AVISTA.AsBoolean ) and ( cdsParcelasAPagarCHEQUE.AsBoolean )) or
     (( not cdsParcelasAPagarCHEQUE.AsBoolean ) and ( cdsParcelasAPagarPAGTO.IsNull))  then
     cdsParcelasAPagarDT_COMPENSACAO.Clear;

end;

procedure TdtmVENDAS_Pedido.cdsParcelasAPagarCalcFields(DataSet: TDataSet);
begin
//
end;

procedure TdtmVENDAS_Pedido.cdsParcelasAPagarCHEQUEChange(Sender: TField);
begin
  if cdsParcelasAPagarCHEQUE.asBoolean then
      cdsParcelasAPagarDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasAPagarDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasAPagarPAGTO.AsSQLTimeStamp ;
      cdsParcelasAPagarNUM_CHEQUE.Clear ;
    end ;
end;


end.

