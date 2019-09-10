unit UdtmCOMPRAS_Pedido3;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UdtmSYS_BASEDBListEdit, VCL.Dialogs,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, Variants , Math, CLAg5SvcEstoquePatrimonio
  , System.Generics.Collections, Tc.Data.SQLExpr
  {$IFNDEF _DSServer}
  , UfrmImportNFeCompra
  {$ENDIF}
  ;

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
  TRateioEvent = procedure ( ARateioEventType : TRateioEventType; APercent: double ; FType : integer ) of object ;


  TdtmCOMPRAS_Pedido = class(T_dtmBASEDBListEdit)
    cdsLstPedidos: TClientDataSet;
    cdsPedido: TClientDataSet;
    dtsList: TDataSource;
    cdsItensPedido: TClientDataSet;
    cdsItensPedidoKCMP_PEDIDO_ITEM: TStringField;
    cdsItensPedidoKCMP_PEDIDO: TStringField;
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
    cdsServicosPedido: TClientDataSet;
    cdsServicosPedidoKCMP_PEDIDO_SERVICO: TStringField;
    cdsServicosPedidoKCMP_PEDIDO: TStringField;
    cdsServicosPedidoCODIGO: TStringField;
    cdsServicosPedidoNOME: TStringField;
    cdsServicosPedidoCUSTO: TFloatField;
    cdsServicosPedidoDETALHES: TMemoField;
    cdsServicosPedidoQTDE: TFloatField;
    cdsServicosPedidoTOTAL: TFloatField;
    cdsServicosPedidoOBS: TMemoField;
    cdsServicosPedidoSomaTotal: TAggregateField;
    cdsServicosPedidoTmpCalc: TIntegerField;
    cdsAPagar: TClientDataSet;
    cdsAPagarKFIN_APAGAR: TStringField;
    cdsAPagarTABLENAME: TStringField;
    cdsAPagarTABLEKEY: TStringField;
    cdsAPagarKCAD_ENTIDADE: TStringField;
    cdsAPagarNOMEENTIDADE: TStringField;
    cdsAPagarHISTORICO: TStringField;
    cdsAPagarDOCUMENTO: TStringField;
    cdsAPagarDATALANCTO: TSQLTimeStampField;
    cdsAPagarKFIN_CONTA_PREF: TStringField;
    cdsAPagarKFIN_PLANOCONTA: TStringField;
    cdsAPagarOBS: TMemoField;
    cdsAPagarsqlParcelas: TDataSetField;
    cdsAPagarStatusCadastro: TStringField;
    cdsParcelas: TClientDataSet;
    cdsParcelasKFIN_APAGAR_PARCELA: TStringField;
    cdsParcelasKFIN_APAGAR: TStringField;
    cdsParcelasDOCUMENTO: TStringField;
    cdsParcelasVENCTO: TSQLTimeStampField;
    cdsParcelasPRORROGACAO: TSQLTimeStampField;
    cdsParcelasVALOR: TFloatField;
    cdsParcelasPAGTO: TSQLTimeStampField;
    cdsParcelasPAGO: TFloatField;
    cdsParcelasKFIN_CONTA: TStringField;
    cdsParcelasPREVISAO: TStringField;
    cdsParcelasDUVIDOSO: TStringField;
    cdsParcelasOBS: TMemoField;
    cdsAPagarATIVO: TStringField;
    cdsParcelasSomaValor: TAggregateField;
    dspLstPedidos: TDataSetProvider;
    dspPedido: TDataSetProvider;
    sqlLstPedidos: TTcSQLDataSet;
    sqlPedido: TTcSQLDataSet;
    sqlItensPedido: TTcSQLDataSet;
    sqlItensPedidoKCMP_PEDIDO_ITEM: TStringField;
    sqlItensPedidoKCMP_PEDIDO: TStringField;
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
    sqlServicosPedido: TTcSQLDataSet;
    sqlServicosPedidoKCMP_PEDIDO_SERVICO: TStringField;
    sqlServicosPedidoKCMP_PEDIDO: TStringField;
    sqlServicosPedidoCODIGO: TStringField;
    sqlServicosPedidoNOME: TStringField;
    sqlServicosPedidoCUSTO: TFloatField;
    sqlServicosPedidoDETALHES: TMemoField;
    sqlServicosPedidoQTDE: TFloatField;
    sqlServicosPedidoTOTAL: TFloatField;
    sqlServicosPedidoOBS: TMemoField;
    sqlApagar: TTcSQLDataSet;
    sqlApagarKFIN_APAGAR: TStringField;
    sqlApagarATIVO: TStringField;
    sqlApagarTABLENAME: TStringField;
    sqlApagarTABLEKEY: TStringField;
    sqlApagarKCAD_ENTIDADE: TStringField;
    sqlApagarNOMEENTIDADE: TStringField;
    sqlApagarHISTORICO: TStringField;
    sqlApagarDOCUMENTO: TStringField;
    sqlApagarDATALANCTO: TSQLTimeStampField;
    sqlApagarKFIN_CONTA_PREF: TStringField;
    sqlApagarKFIN_PLANOCONTA: TStringField;
    sqlApagarOBS: TMemoField;
    sqlParcelas: TTcSQLDataSet;
    sqlParcelasKFIN_APAGAR_PARCELA: TStringField;
    sqlParcelasKFIN_APAGAR: TStringField;
    sqlParcelasDOCUMENTO: TStringField;
    sqlParcelasVENCTO: TSQLTimeStampField;
    sqlParcelasPRORROGACAO: TSQLTimeStampField;
    sqlParcelasVALOR: TFloatField;
    sqlParcelasPAGTO: TSQLTimeStampField;
    sqlParcelasPAGO: TFloatField;
    sqlParcelasKFIN_CONTA: TStringField;
    sqlParcelasPREVISAO: TStringField;
    sqlParcelasDUVIDOSO: TStringField;
    sqlParcelasOBS: TMemoField;
    dtsSQLAPagar: TDataSource;
    sqlLstPedidosKCMP_PEDIDO: TStringField;
    sqlLstPedidosNOTA_FISCAL: TStringField;
    sqlLstPedidosSERIE: TStringField;
    sqlLstPedidosDATA_EMISSAO: TSQLTimeStampField;
    sqlLstPedidosDATA_ENTRADA: TSQLTimeStampField;
    sqlLstPedidosIMPOSTOS: TFloatField;
    sqlLstPedidosDESCONTOS: TFloatField;
    sqlLstPedidosFRETE: TFloatField;
    sqlLstPedidosTOTAL_NOTA: TFloatField;
    sqlLstPedidosOBS: TMemoField;
    cdsLstPedidosKCMP_PEDIDO: TStringField;
    cdsLstPedidosNOTA_FISCAL: TStringField;
    cdsLstPedidosSERIE: TStringField;
    cdsLstPedidosDATA_EMISSAO: TSQLTimeStampField;
    cdsLstPedidosDATA_ENTRADA: TSQLTimeStampField;
    cdsLstPedidosIMPOSTOS: TFloatField;
    cdsLstPedidosDESCONTOS: TFloatField;
    cdsLstPedidosFRETE: TFloatField;
    cdsLstPedidosTOTAL_NOTA: TFloatField;
    cdsLstPedidosOBS: TMemoField;
    cdsPedidoKCMP_PEDIDO: TStringField;
    cdsPedidoKCAD_ENTIDADE: TStringField;
    cdsPedidoNOTA_FISCAL: TStringField;
    cdsPedidoSERIE: TStringField;
    cdsPedidoDATA_EMISSAO: TSQLTimeStampField;
    cdsPedidoDATA_COMPRA: TSQLTimeStampField;
    cdsPedidoDATA_ENTRADA: TSQLTimeStampField;
    cdsPedidoIMPOSTOS: TFloatField;
    cdsPedidoDESCONTOS: TFloatField;
    cdsPedidoFRETE: TFloatField;
    cdsPedidoKFIN_APAGAR: TStringField;
    cdsPedidoTOTAL_ITENS: TFloatField;
    cdsPedidoTOTAL_SERVICOS: TFloatField;
    cdsPedidoTOTAL_NOTA: TFloatField;
    cdsPedidoOBS: TMemoField;
    cdsPedidosqlApagar: TDataSetField;
    cdsPedidosqlServicosPedido: TDataSetField;
    cdsPedidosqlItensPedido: TDataSetField;
    sqlServicosPedidoUNIDADE: TStringField;
    cdsServicosPedidoUNIDADE: TStringField;
    sqlPedidoKCMP_PEDIDO: TStringField;
    sqlPedidoKSYSDOMAIN: TStringField;
    sqlPedidoKCAD_ENTIDADE: TStringField;
    sqlPedidoNOTA_FISCAL: TStringField;
    sqlPedidoSERIE: TStringField;
    sqlPedidoDATA_EMISSAO: TSQLTimeStampField;
    sqlPedidoDATA_COMPRA: TSQLTimeStampField;
    sqlPedidoDATA_ENTRADA: TSQLTimeStampField;
    sqlPedidoIMPOSTOS: TFloatField;
    sqlPedidoDESCONTOS: TFloatField;
    sqlPedidoFRETE: TFloatField;
    sqlPedidoKFIN_APAGAR: TStringField;
    sqlPedidoTOTAL_ITENS: TFloatField;
    sqlPedidoTOTAL_SERVICOS: TFloatField;
    sqlPedidoTOTAL_NOTA: TFloatField;
    sqlPedidoOBS: TMemoField;
    cdsPedidoKSYSDOMAIN: TStringField;
    sqlPedidoATIVO: TStringField;
    cdsPedidoATIVO: TStringField;
    sqlDadosProdutoDESCRICAO: TMemoField;
    sqlDadosProdutoOBS: TMemoField;
    cdsDadosProdutoDESCRICAO: TMemoField;
    cdsDadosProdutoOBS: TMemoField;
    sqlLstPedidosKSYSDOMAIN: TStringField;
    cdsLstPedidosKSYSDOMAIN: TStringField;
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
    sqlItensPedidoKFIN_PLANOCONTA: TStringField;
    cdsItensPedidoKFIN_PLANOCONTA: TStringField;
    sqlServicosPedidoKFIN_PLANOCONTA: TStringField;
    cdsServicosPedidoKFIN_PLANOCONTA: TStringField;
    cdsItensPedidosqlApropriacaoItem: TDataSetField;
    cdsServicosPedidosqlApropriacaoServico: TDataSetField;
    sqlPedidoNOMEENTIDADE: TStringField;
    cdsPedidoNOMEENTIDADE: TStringField;
    sqlLstPedidosNOMEENTIDADE: TStringField;
    cdsLstPedidosNOMEENTIDADE: TStringField;
    sqlItensPedidoIS_PATRIMONIO: TStringField;
    sqlItensPedidoDESCR_PC_NOME: TStringField;
    sqlItensPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    sqlItensPedidoDESCR_PC_CODIGO: TIntegerField;
    sqlItensPedidoDESCR_PC_TIPO_APRD: TStringField;
    cdsItensPedidoIS_PATRIMONIO: TStringField;
    cdsItensPedidoDESCR_PC_NOME: TStringField;
    cdsItensPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    cdsItensPedidoDESCR_PC_CODIGO: TIntegerField;
    cdsItensPedidoDESCR_PC_TIPO_APRD: TStringField;
    sqlServicosPedidoDESCR_PC_NOME: TStringField;
    sqlServicosPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    sqlServicosPedidoDESCR_PC_CODIGO: TIntegerField;
    sqlServicosPedidoDESCR_PC_TIPO_APRD: TStringField;
    cdsServicosPedidoDESCR_PC_NOME: TStringField;
    cdsServicosPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    cdsServicosPedidoDESCR_PC_CODIGO: TIntegerField;
    cdsServicosPedidoDESCR_PC_TIPO_APRD: TStringField;
    sqlParcelasNOMECONTA: TStringField;
    cdsParcelasNOMECONTA: TStringField;
    sqlApagarKSYSDOMAIN: TStringField;
    cdsAPagarKSYSDOMAIN: TStringField;
    sqlApagarNOMECONTA: TStringField;
    cdsAPagarNOMECONTA: TStringField;
    cdsPedidotmpCalc: TIntegerField;
    cdsParcelastmpCalc: TFloatField;
    cdsPatrimonio: TClientDataSet;
    sqlPatrimonio: TTcSQLDataSet;
    dspPatrimonio: TDataSetProvider;
    sqlPatrimonioKCAD_PATRIMONIO: TStringField;
    sqlPatrimonioCODIGO: TStringField;
    sqlPatrimonioDESCRICAO: TStringField;
    sqlPatrimonioUNIDADE: TStringField;
    sqlPatrimonioVALOR_UNITARIO: TFloatField;
    sqlPatrimonioQUANTIDADE: TIntegerField;
    sqlPatrimonioOBS: TMemoField;
    cdsPatrimonioKCAD_PATRIMONIO: TStringField;
    cdsPatrimonioCODIGO: TStringField;
    cdsPatrimonioDESCRICAO: TStringField;
    cdsPatrimonioUNIDADE: TStringField;
    cdsPatrimonioVALOR_UNITARIO: TFloatField;
    cdsPatrimonioQUANTIDADE: TIntegerField;
    cdsPatrimonioOBS: TMemoField;
    sqlItensPedidoKCAD_PATRIMONIO: TStringField;
    cdsItensPedidoKCAD_PATRIMONIO: TStringField;
    sqlServicosPedidoKEST_PRODUTO: TStringField;
    cdsServicosPedidoKEST_PRODUTO: TStringField;
    sqlApagarNUM_PARCELAS: TIntegerField;
    sqlApagarPROXIMO_MES: TStringField;
    sqlApagarRECORRENCIA: TStringField;
    sqlApagarDIA_VENCTO: TIntegerField;
    cdsAPagarNUM_PARCELAS: TIntegerField;
    cdsAPagarPROXIMO_MES: TStringField;
    cdsAPagarRECORRENCIA: TStringField;
    cdsAPagarDIA_VENCTO: TIntegerField;
    sqlApropriacaoServicoTABLENAME: TStringField;
    sqlApropriacaoServicoTABLEKEY: TStringField;
    sqlApropriacaoItemTABLENAME: TStringField;
    sqlApropriacaoItemTABLEKEY: TStringField;
    cdsApropriacaoItemTABLENAME: TStringField;
    cdsApropriacaoItemTABLEKEY: TStringField;
    cdsApropriacaoServicoTABLENAME: TStringField;
    cdsApropriacaoServicoTABLEKEY: TStringField;
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
    sqlApagarTransporte: TTcSQLDataSet;
    sqlApagarTransporteKFIN_APAGAR: TStringField;
    sqlApagarTransporteKSYSDOMAIN: TStringField;
    sqlApagarTransporteATIVO: TStringField;
    sqlApagarTransporteTABLENAME: TStringField;
    sqlApagarTransporteTABLEKEY: TStringField;
    sqlApagarTransporteKCAD_ENTIDADE: TStringField;
    sqlApagarTransporteNOMEENTIDADE: TStringField;
    sqlApagarTransporteHISTORICO: TStringField;
    sqlApagarTransporteDOCUMENTO: TStringField;
    sqlApagarTransporteDATALANCTO: TSQLTimeStampField;
    sqlApagarTransporteNUM_PARCELAS: TIntegerField;
    sqlApagarTransportePROXIMO_MES: TStringField;
    sqlApagarTransporteRECORRENCIA: TStringField;
    sqlApagarTransporteDIA_VENCTO: TIntegerField;
    sqlApagarTransporteKFIN_CONTA_PREF: TStringField;
    sqlApagarTransporteNOMECONTA: TStringField;
    sqlApagarTransporteKFIN_PLANOCONTA: TStringField;
    sqlApagarTransporteOBS: TMemoField;
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
    cdsPedidosqlApagarTransporte: TDataSetField;
    cdsAPagarTransportesqlParcelasTransporte: TDataSetField;
    sqlPedidoKFIN_APAGAR_TRANSPORTE: TStringField;
    cdsPedidoKFIN_APAGAR_TRANSPORTE: TStringField;
    sqlPedidoCHAVENFE: TStringField;
    cdsPedidoCHAVENFE: TStringField;
    cdsTipoItem: TClientDataSet;
    cdsTipoItemDESCRICAO: TStringField;
    cdsTipoItemTIPO: TStringField;
    cdsItensPedidoTIPOITEM: TStringField;
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
    sqlPedidoIMPORTADO_NFE: TStringField;
    cdsPedidoIMPORTADO_NFE: TStringField;
    sqlPedidoXML_NFE: TMemoField;
    cdsPedidoXML_NFE: TMemoField;
    sqlPedidoMODELO_NFE: TIntegerField;
    cdsPedidoMODELO_NFE: TIntegerField;
    sqlApagarPAGTO_AVISTA: TStringField;
    cdsAPagarPAGTO_AVISTA: TStringField;
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
    sqlPatrimonioKFIN_PLANOCONTA: TStringField;
    sqlPatrimonioDESCRICAO_APROPRIACAO: TStringField;
    cdsPatrimonioKFIN_PLANOCONTA: TStringField;
    cdsPatrimonioDESCRICAO_APROPRIACAO: TStringField;
    sqlPatrimonioKFIN_CATEGORIA: TStringField;
    sqlPatrimonioDESCRICAO_CATEGORIA: TStringField;
    cdsPatrimonioKFIN_CATEGORIA: TStringField;
    cdsPatrimonioDESCRICAO_CATEGORIA: TStringField;
    sqlPedidoSYSORIGIN_TYPE: TIntegerField;
    cdsPedidoSYSORIGIN_TYPE: TIntegerField;
    cdsPatrimoniosPedido: TClientDataSet;
    cdsPatrimoniosPedidoKCMP_PEDIDO_ITEM: TStringField;
    cdsPatrimoniosPedidoKCMP_PEDIDO: TStringField;
    cdsPatrimoniosPedidoKEST_PRODUTO: TStringField;
    cdsPatrimoniosPedidoKCAD_PATRIMONIO: TStringField;
    cdsPatrimoniosPedidoIS_PATRIMONIO: TStringField;
    cdsPatrimoniosPedidoCODIGO_NOME: TStringField;
    cdsPatrimoniosPedidoCODIGO: TStringField;
    cdsPatrimoniosPedidoNOME: TStringField;
    cdsPatrimoniosPedidoCST_CSOSN: TStringField;
    cdsPatrimoniosPedidoCFOP: TStringField;
    cdsPatrimoniosPedidoCFOP_ESTOQUE: TStringField;
    cdsPatrimoniosPedidoUNIDADE: TStringField;
    cdsPatrimoniosPedidoQTDE: TFloatField;
    cdsPatrimoniosPedidoVALOR_UNITARIO: TFloatField;
    cdsPatrimoniosPedidoVALOR_PARCIAL: TFloatField;
    cdsPatrimoniosPedidoDESCONTO: TFloatField;
    cdsPatrimoniosPedidoFRETE: TFloatField;
    cdsPatrimoniosPedidoTOTAL: TFloatField;
    cdsPatrimoniosPedidoCUSTO: TFloatField;
    cdsPatrimoniosPedidoDETALHES: TMemoField;
    cdsPatrimoniosPedidoOBS: TMemoField;
    cdsPatrimoniosPedidoKFIN_PLANOCONTA: TStringField;
    cdsPatrimoniosPedidoDESCR_PC_NOME: TStringField;
    cdsPatrimoniosPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    cdsPatrimoniosPedidoDESCR_PC_CODIGO: TIntegerField;
    cdsPatrimoniosPedidoDESCR_PC_TIPO_APRD: TStringField;
    cdsPatrimoniosPedidosqlApropriacaoPatrimonio: TDataSetField;
    cdsPatrimoniosPedidoTmpCalc: TStringField;
    cdsPatrimoniosPedidoTIPOITEM: TStringField;
    cdsPatrimoniosPedidoDESCR_UNIDADE: TStringField;
    cdsPatrimoniosPedidoDESCR_UNIDADE_COMPRA: TStringField;
    cdsPatrimoniosPedidoQTDE_COMPRA: TFloatField;
    cdsPatrimoniosPedidoUNIDADE_COMPRA: TStringField;
    cdsPatrimoniosPedidoUNITARIO_COMPRA: TFloatField;
    cdsPatrimoniosPedidoATUALIZAR_CUSTO: TStringField;
    cdsPatrimoniosPedidoVALOR_IPI: TFloatField;
    cdsPatrimoniosPedidoSomaTotal: TAggregateField;
    cdsPatrimoniosPedidoSomaParcial: TAggregateField;
    cdsPatrimoniosPedidoSomaDesconto: TAggregateField;
    cdsPatrimoniosPedidoSomaFrete: TAggregateField;
    cdsPatrimoniosPedidoSomaValorIPI: TAggregateField;
    sqlPatrimoniosPedido: TTcSQLDataSet;
    sqlPatrimoniosPedidoKCMP_PEDIDO_ITEM: TStringField;
    sqlPatrimoniosPedidoKCMP_PEDIDO: TStringField;
    sqlPatrimoniosPedidoKEST_PRODUTO: TStringField;
    sqlPatrimoniosPedidoKCAD_PATRIMONIO: TStringField;
    sqlPatrimoniosPedidoIS_PATRIMONIO: TStringField;
    sqlPatrimoniosPedidoCODIGO: TStringField;
    sqlPatrimoniosPedidoNOME: TStringField;
    sqlPatrimoniosPedidoUNIDADE: TStringField;
    sqlPatrimoniosPedidoCST_CSOSN: TStringField;
    sqlPatrimoniosPedidoCFOP: TStringField;
    sqlPatrimoniosPedidoCFOP_ESTOQUE: TStringField;
    sqlPatrimoniosPedidoQTDE: TFloatField;
    sqlPatrimoniosPedidoVALOR_UNITARIO: TFloatField;
    sqlPatrimoniosPedidoVALOR_PARCIAL: TFloatField;
    sqlPatrimoniosPedidoDESCONTO: TFloatField;
    sqlPatrimoniosPedidoFRETE: TFloatField;
    sqlPatrimoniosPedidoTOTAL: TFloatField;
    sqlPatrimoniosPedidoCUSTO: TFloatField;
    sqlPatrimoniosPedidoQTDE_COMPRA: TFloatField;
    sqlPatrimoniosPedidoUNIDADE_COMPRA: TStringField;
    sqlPatrimoniosPedidoUNITARIO_COMPRA: TFloatField;
    sqlPatrimoniosPedidoATUALIZAR_CUSTO: TStringField;
    sqlPatrimoniosPedidoDETALHES: TMemoField;
    sqlPatrimoniosPedidoOBS: TMemoField;
    sqlPatrimoniosPedidoKFIN_PLANOCONTA: TStringField;
    sqlPatrimoniosPedidoDESCR_PC_NOME: TStringField;
    sqlPatrimoniosPedidoDESCR_PC_CLASSIFICACAO: TStringField;
    sqlPatrimoniosPedidoDESCR_PC_CODIGO: TIntegerField;
    sqlPatrimoniosPedidoDESCR_PC_TIPO_APRD: TStringField;
    sqlPatrimoniosPedidoVALOR_IPI: TFloatField;
    cdsApropriacaoPatrimonio: TClientDataSet;
    cdsApropriacaoPatrimonioKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoPatrimonioKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoPatrimonioCODIGO: TIntegerField;
    cdsApropriacaoPatrimonioCLASSIFICACAO: TStringField;
    cdsApropriacaoPatrimonioNOME: TStringField;
    cdsApropriacaoPatrimonioPORCENTAGEM: TFloatField;
    cdsApropriacaoPatrimonioTABLENAME: TStringField;
    cdsApropriacaoPatrimonioTABLEKEY: TStringField;
    cdsApropriacaoPatrimonioTOTAL_PORCENTAGEM: TAggregateField;
    sqlApropriacaoPatrimonio: TTcSQLDataSet;
    sqlApropriacaoPatrimonioKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoPatrimonioKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoPatrimonioCODIGO: TIntegerField;
    sqlApropriacaoPatrimonioCLASSIFICACAO: TStringField;
    sqlApropriacaoPatrimonioNOME: TStringField;
    sqlApropriacaoPatrimonioPORCENTAGEM: TFloatField;
    sqlApropriacaoPatrimonioTABLENAME: TStringField;
    sqlApropriacaoPatrimonioTABLEKEY: TStringField;
    dtsSQLPatrimonioPedido: TDataSource;
    cdsPedidosqlPatrimoniosPedido: TDataSetField;
    sqlApagarKCMP_PEDIDO: TStringField;
    cdsAPagarKCMP_PEDIDO: TStringField;
    sqlPedidoTOTAL_PATRIMONIOS: TFloatField;
    cdsPedidoTOTAL_PATRIMONIOS: TFloatField;
    cdsAPagarTransportePAGTO_AVISTA: TStringField;
    sqlApagarTransportePAGTO_AVISTA: TStringField;
    cdsParcelasTransporteCHEQUE: TStringField;
    cdsParcelasTransporteNUM_CHEQUE: TStringField;
    cdsParcelasTransporteDT_COMPENSACAO: TSQLTimeStampField;
    sqlParcelasTransporteCHEQUE: TStringField;
    sqlParcelasTransporteNUM_CHEQUE: TStringField;
    sqlParcelasTransporteDT_COMPENSACAO: TSQLTimeStampField;
    sqlApagarKFIN_APAGAR_TRANSPORTE: TStringField;
    cdsAPagarKFIN_APAGAR_TRANSPORTE: TStringField;
    sqlApagarANUAL: TStringField;
    cdsAPagarANUAL: TStringField;
    sqlApagarTransporteANUAL: TStringField;
    cdsAPagarTransporteANUAL: TStringField;
    cdsUnidadesControlaEstoque: TClientDataSet;
    cdsUnidadesControlaEstoqueKCAD_TIPOS: TStringField;
    cdsUnidadesControlaEstoqueDESCRICAO: TStringField;
    cdsServicosPedidoCODIGO_NOME: TStringField;
    sqlLstPedidosNOTA_FISCAL_: TStringField;
    cdsLstPedidosNOTA_FISCAL_: TStringField;
    procedure cdsLstPedidosNewRecord(DataSet: TDataSet);
    procedure cdsPedidoNewRecord(DataSet: TDataSet);
    procedure cdsPedidoCalcFields(DataSet: TDataSet);
    procedure cdsPedidoBeforeInsert(DataSet: TDataSet);
    procedure cdsPedidoNOMECOMPRADORValidate(Sender: TField);
    procedure cdsAPagarNewRecord(DataSet: TDataSet);
    procedure cdsParcelasNewRecord(DataSet: TDataSet);
    procedure cdsParcelasBeforeInsert(DataSet: TDataSet);
    procedure cdsPedidoBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);

    procedure cdsApropriacaoItemNewRecord(DataSet: TDataSet);
    procedure cdsApropriacaoServicoNewRecord(DataSet: TDataSet);
    procedure cdsApropriacaoPatrimonioNewRecord(DataSet: TDataSet);

     procedure cdsApropriacaoPatrimonioBeforeEdit(DataSet: TDataSet);

    procedure cdsParcelasBeforeDelete(DataSet: TDataSet);
    procedure cdsParcelasBeforeEdit(DataSet: TDataSet);
    procedure cdsParcelasVENCTOChange(Sender: TField);
    procedure cdsPedidoBeforeEdit(DataSet: TDataSet);
    procedure cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsAPagarNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsPedidoDATA_COMPRAValidate(Sender: TField);
    procedure cdsPedidoDATA_EMISSAOValidate(Sender: TField);
    procedure cdsPedidoDATA_ENTRADAValidate(Sender: TField);
    procedure cdsPedidoNOMEENTIDADESetText(Sender: TField; const Text: string);


    procedure cdsPedidoDATA_COMPRAChange(Sender: TField);
    procedure cdsParcelasCalcFields(DataSet: TDataSet);
    procedure cdsPedidoBeforeDelete(DataSet: TDataSet);


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
    procedure cdsPedidoNOTA_FISCALValidate(Sender: TField);
    procedure cdsPedidoKCAD_ENTIDADEValidate(Sender: TField);
    procedure dspProdutosFornecedorBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsAPagarPAGTO_AVISTAChange(Sender: TField);

    procedure cdsItensPedidoCalcFields(DataSet: TDataSet);
    procedure cdsItensPedidoNewRecord(DataSet: TDataSet);
    procedure cdsItensPedidoBeforeInsert(DataSet: TDataSet);
    procedure cdsItensPedidoBeforePost(DataSet: TDataSet);
    procedure cdsItensPedidoAfterDelete(DataSet: TDataSet);
    procedure cdsItensPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
    procedure cdsItensPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsItensPedidoAfterCancel(DataSet: TDataSet);
    procedure cdsItensPedidoBeforeEdit(DataSet: TDataSet);
    procedure cdsItensPedidoCODIGO_NOMESetText(Sender: TField;
      const Text: string);

    procedure cdsPatrimoniosPedidoCalcFields(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoNewRecord(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoBeforeInsert(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoBeforePost(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoAfterDelete(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
    procedure cdsPatrimoniosPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPatrimoniosPedidoAfterCancel(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoBeforeEdit(DataSet: TDataSet);
    procedure cdsPatrimoniosPedidoCODIGO_NOMESetText(Sender: TField;
      const Text: string);

    procedure cdsServicosPedidoNewRecord(DataSet: TDataSet);
    procedure cdsServicosPedidoCalcFields(DataSet: TDataSet);
    procedure cdsServicosPedidoBeforeInsert(DataSet: TDataSet);
    procedure cdsServicosPedidoAfterDelete(DataSet: TDataSet);
    procedure cdsServicosPedidoBeforePost(DataSet: TDataSet);
    procedure cdsServicosPedidoCODIGO_NOMESetText(Sender: TField; const Text: string);
    procedure cdsServicosPedidoNOMESetText(Sender: TField; const Text: string);
    procedure cdsServicosPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
    procedure cdsServicosPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsServicosPedidoBeforeEdit(DataSet: TDataSet);
    procedure cdsServicosPedidoAfterCancel(DataSet: TDataSet);

    procedure cdsParcelasNUM_CHEQUESetText(Sender: TField; const Text: string);
    procedure cdsParcelasCHEQUEChange(Sender: TField);
    procedure cdsParcelasBeforePost(DataSet: TDataSet);
    procedure cdsPedidoAfterInsert(DataSet: TDataSet);
    procedure cdsPedidoBeforeOpen(DataSet: TDataSet);
    procedure sqlPedidoBeforeOpen(DataSet: TDataSet);
    procedure dspPedidoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure cdsPedidoSERIEValidate(Sender: TField);
    procedure cdsParcelasTransporteCHEQUEChange(Sender: TField);
    procedure cdsParcelasTransporteNUM_CHEQUESetText(Sender: TField;
      const Text: string);
    procedure cdsAPagarTransportePAGTO_AVISTAChange(Sender: TField);
    procedure cdsParcelasTransporteBeforePost(DataSet: TDataSet);
    procedure cdsItensPedidoQTDE_COMPRAChange(Sender: TField);
  private
    { Private declarations }
    FSQLPedidosRequiredField : IRequiredFields ;
    FCDSPedidosRequiredField : IRequiredFields ;

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
    FValidApropriacao  : Boolean;
    ValorLinhaItensParcial    : double ;
    ValorLinhaItensTotal    : double ;
    ValorLinhaItensTotalIPI : double ;

    { TODO -oCaique : Need this for "patrimonios" }
    ValorLinhaPatrimoniosParcial  : double ;
    ValorLinhaPatrimoniosTotal    : double ;
    ValorLinhaPatrimoniosTotalIPI : double ;


    ValorLinhaServicos : double ;

    FKItemMaiorValor : string;
    FTipoMaiorValor : integer ;
    FKCMP_PEDIDO: string;

    FHasUnidadeEstoque : boolean ;

    procedure CalculaTotaisPedido ;
    procedure SetParams ;
    procedure LimpaProduto ;
    procedure LimpaPatrimonio ;
    procedure LimpaServico ;
    function ValidaCampos : Boolean;
    procedure CheckMesEncerrado ;
    procedure Ratear( AValorRatear : double ; AFieldItens, AFieldPatrimonios : TFloatField ; ARateioEvent : TRateioEvent ) ;

    procedure SetMaiorValorItemFrete(ARateioEventType : TRateioEventType; APercent: double ; AType : integer );
    procedure SetMaiorValorItemDesconto(ARateioEventType : TRateioEventType; APercent: double ; AType : integer );
    procedure SetMaiorValorItemImposto(ARateioEventType : TRateioEventType; APercent: double ; AType : integer );
    procedure ValidNF ;
    procedure SetKCMP_PEDIDO(const Value: string);
    function RoundTo(const AValue: Currency; const ADigit: TRoundToRange): Currency;
    procedure GetContaFavorita;
    procedure SetValidApropriacao(const Value: Boolean);

  public
    { Public declarations }
    procedure CadastraPatrimonio(KPatrimonio : TPatrimonioInfo);
    procedure SetEntidade ( Key : String ;NomeEntidade : string ) ;
    procedure SetEntidadeTransporte ( Key : String ;NomeEntidade : string ) ;
    procedure SetCOMPRADOR ( Key : String ;NomeCOMPRADOR : string ) ;
    procedure ListaTiposCadastro(CDS: TClientDataSet; Tipo: Integer);
    procedure SetContato ( Key : String ;NomeContato : string ; Depto : string = '' ; Email : string = '' ; Fone  : string = '' ) ;
    procedure OpenTables ; override ;

    procedure insereItem(Key, CodigoProduto, NomeProduto: string; QTDE, ValorCusto: Currency;
      Unidade: String; AKFIN_PlanoConta, ADescrPlanoConta : string ; AControlaEstoque : boolean );


    procedure inserePatrimonio(
       Key : String;
       AKFIN_PlanoConta
     , ADescrPlanoConta : string );

    procedure insereServico(
         const Key
       ,       Codigo
       ,       Nome
       ,       Unidade : string;
         const ValorCusto : Currency ;
         const AKFIN_PlanoConta
       ,       ADescrPlanoConta : string
     );

    procedure RemoveApropriacaoItens ;
    procedure RemoveApropriacaoServico ;
    procedure RemoveApropriacaoPatrimonio  ;

    {$IFNDEF _DSServer}
    procedure SaveProdutosFornecedor( AKFornecedor : string ; ANFeProdutos : TNFeProdutoArray  ) ;
    procedure insereItemFromNFe( AKFornecedor : string ; ANFeProduto : TNFeProduto );
    procedure insereProdutoFromNFe( AKFornecedor : string ; ANFeProduto : TNFeProduto );
    procedure inserePatrimonioFromNFe( AKFornecedor : string ; ANFeProduto : TNFeProduto );
    {$ENDIF}
    procedure OpenPedido ( KPedido : String  ) ;
    procedure ClonePedido ;
    procedure SetFilter ( ShowInativos : Boolean; DataInicial, DataFinal : TDateTime );
    procedure SetCFOP ( Key : String ;Descricao: string ) ;
    procedure SetCFOP_ESTOQUE ( Key : String ;Descricao: string ) ;
    procedure SetContaPreferencia( KFIN_CONTA, NOME: string);
    procedure SetContaPreferenciaTransporte( KFIN_CONTA, NOME: string);
    procedure SetConta( KFIN_CONTA, NOME: string);
    procedure SetContaTransporte( KFIN_CONTA, NOME: string);
    procedure ExcluiPatrimonio( FKCAD_Patrimonio: string );
    procedure CalculaTotais;
    procedure CancelUpdates; override;
    procedure ApplyUpdates; override;
    procedure CheckValorAPagar ;
    procedure RatearDescontos;
    procedure RatearFrete ;
    procedure RatearImpostos;
    procedure PostItem ;
    procedure PostPatrimonio;
    procedure PostServico ;
    procedure EditItem ;
    procedure EditPatrimonio ;
    procedure EditServico ;
    {$IFNDEF _DSServer}
    procedure InsereFromNFe ( ANFeInfo : TNFeInfo ) ;
    {$ENDIF}
    constructor Create ( AOwner : TComponent ) ;override ;
    property  KCMP_PEDIDO : string  read FKCMP_PEDIDO write SetKCMP_PEDIDO;
    property ValidApropriacao: Boolean read FValidApropriacao write SetValidApropriacao;
    procedure CalcularParcelas( ADiaDaParcela : integer ; ATotalParcelas : integer ; AProximoMes, AAnual : boolean ) ;
    procedure CalcularParcelasTransporte( ADiaDaParcela : integer ; ATotalParcelas : integer ; AProximoMes, AAnual : boolean ) ;
    function ParcelaBaixada : Boolean ;
    procedure PagamentoAVista ;
    procedure PagamentoAVistaTransporte ;
    procedure SetItemControlaEstoque ;
    function ItemControlaEstoque : boolean;
    function ItemHasUnidadeEstoque : boolean;

    function PlanoItemEstoque: boolean;
    procedure ClearItemControlaEstoque ;

  end;

implementation

uses
Tc.RTL.Exceptions
  , Tc.DBRTL.AbstractDB
  , UDBFinanceiro
  , UDBEntidades {Math,}
  , Data.SQLTimSt
  , DateUtils
  , CLAg5SvcEstoqueCadastroTipos
  , CLAg5SvcFinanceiroApropriacao
  , UFIN_PlanoContasReceitasDespesasClass
//  System.Generics.Collections
     , DataSnap.DSConnect
      ;

const
  _PRODUTO    = 1;
  _PATRIMONIO = 2;

resourcestring
  _ERRMSG_TOTAL_ZERO = 'Não é possivel gravar um pedido sem itens/valor' ;
  _ERRMSG_TOTAL_APGAGAR = 'Total das parcelas a pagar não'#13#10'coincide com total do pedido' ;
  _ERRMSG_NOTA_JA_CADASTRADA = 'Nota fiscal já cadastrada para este fornecedor' ;

{$R *.dfm}

{ TrdmdtmCOMPRAS_Pedido }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmCOMPRAS_Pedido.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;

{$ENDIF}


procedure TdtmCOMPRAS_Pedido.dspPedidoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: string);
begin
   if DataSet = sqlParcelas then
      TableName := 'FIN_APAGAR_PARCELAS' ;
end;

procedure TdtmCOMPRAS_Pedido.dspProdutosFornecedorBeforeUpdateRecord(
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

procedure TdtmCOMPRAS_Pedido.ListaTiposCadastro(CDS: TClientDataSet; Tipo: Integer);
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


procedure TdtmCOMPRAS_Pedido.OpenTables;
begin
  TTcAbstractDB.GetByAlias('FINANCEIRO').GetSystemTypes ( 'STATUS_PEDIDO', cdsStatusPedido ) ;

//  cdsTipoItem.CreateDataSet ;
  cdsTipoItem.AppendRecord(['F', 'Produto']);
  cdsTipoItem.AppendRecord(['T', 'Patrimônio']);

  ListaTiposCadastro( cdsUnidadesCompra
    , CLAg5SvcEstoqueCadastroTipos._UNIDADE_MEDIDA
  );

  ListaTiposCadastro( cdsUnidades
    , CLAg5SvcEstoqueCadastroTipos._UNIDADE_MEDIDA
  );

  ListaTiposCadastro( cdsUnidadesControlaEstoque
    , CLAg5SvcEstoqueCadastroTipos._UNIDADE_MEDIDA
  );

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

procedure TdtmCOMPRAS_Pedido.PagamentoAVista;
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

  if not cdsAPagarPAGTO_AVISTA.asBoolean then
    exit ;

  TCdsSuppl.PostIfNeed( cdsPedido );


  if not( cdsAPagar.State in [ dsInsert, dsEdit] ) then
    cdsAPagar.Edit;

  cdsAPagarHISTORICO.asString := Format( 'Nota fiscal de compra: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] ) ;
  cdsAPagarDOCUMENTO.AsString := cdsPedidoNOTA_FISCAL.AsString ;


  cdsParcelas.Append;
  cdsParcelasVENCTO.AsDateTime := Trunc ( cdsPedidoDATA_EMISSAO.AsDateTime ) ;
  cdsParcelasVALOR.AsFloat     := cdsPedidoTOTAL_NOTA.AsFloat ;
  cdsParcelasPAGTO.AsDateTime  := Trunc ( cdsPedidoDATA_EMISSAO.AsDateTime ) ;
  cdsParcelasPAGO.AsFloat      := cdsPedidoTOTAL_NOTA.AsFloat ;
  cdsParcelasCHEQUE.asString   := 'F' ;
  if cdsParcelasCHEQUE.asBoolean then
      cdsParcelasDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasPAGTO.AsSQLTimeStamp ;
      cdsParcelasNUM_CHEQUE.Clear ;
    end ;


 { if not ( cdsParcelasKFIN_CONTA.IsNull) or ( cdsParcelasKFIN_CONTA.AsString <> EmptyStr ) then
    begin
      cdsParcelasKFIN_CONTA.AsString := cdsParcelasKFIN_CONTA.AsString;
      cdsParcelasNOMECONTA.AsString  := cdsParcelasNOMECONTA.AsString;
    end;}
   if (not cdsAPagarKFIN_CONTA_PREF.IsNull) and ( cdsAPagarKFIN_CONTA_PREF.AsString <> EmptyStr ) then
    begin
      cdsParcelasKFIN_CONTA.AsString := cdsAPagarKFIN_CONTA_PREF.AsString;
      cdsParcelasNOMECONTA.AsString  := cdsAPagarNOMECONTA.AsString;
    end;

  cdsParcelas.Post;

end;

procedure TdtmCOMPRAS_Pedido.PagamentoAVistaTransporte;
begin

  if cdsParcelasTransporte.State in [dsInsert,dsEdit] then
     cdsParcelasTransporte.Cancel ;

  cdsParcelasTransporte.BeforeDelete := nil ;
  if not cdsParcelasTransporte.IsEmpty then
    begin
      cdsParcelasTransporte.First;
      while not cdsParcelasTransporte.Eof do
        begin
//          if not cdsParcelasTransportePAGTO.IsNull then
//            raise Warning.Create('Exite parcela(s) já baixada(s)');

          cdsParcelasTransporte.Delete;
        end;
    end;
  cdsParcelasTransporte.BeforeDelete := cdsParcelasTransporteBeforeDelete ;

  if not cdsAPagarTransportePAGTO_AVISTA.asBoolean then
    exit ;

  TCdsSuppl.PostIfNeed( cdsPedido );


  if not( cdsAPagarTransporte.State in [ dsInsert, dsEdit] ) then
    cdsAPagarTransporte.Edit;

  cdsAPagarTransporteHISTORICO.asString := Format( 'Nota fiscal de compra: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] ) ;
  cdsAPagarTransporteDOCUMENTO.AsString := cdsPedidoNOTA_FISCAL.AsString ;


  cdsParcelasTransporte.Append;
  cdsParcelasTransporteVENCTO.AsDateTime := Trunc ( cdsPedidoDATA_EMISSAO.AsDateTime ) ;
  cdsParcelasTransporteVALOR.AsFloat     := cdsPedidoFRETE.AsFloat;//cdsPedidoTOTAL_NOTA.AsFloat ;
  cdsParcelasTransportePAGTO.AsDateTime  := Trunc ( cdsPedidoDATA_EMISSAO.AsDateTime ) ;
  cdsParcelasTransportePAGO.AsFloat      := cdsPedidoFRETE.AsFloat;//cdsPedidoTOTAL_NOTA.AsFloat ;
  cdsParcelasTransporteCHEQUE.asString   := 'F' ;
  if cdsParcelasTransporteCHEQUE.asBoolean then
      cdsParcelasTransporteDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasTransporteDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasTransportePAGTO.AsSQLTimeStamp ;
      cdsParcelasTransporteNUM_CHEQUE.Clear ;
    end ;


  {if not ( cdsParcelasTransporteKFIN_CONTA.IsNull) or ( cdsParcelasTransporteKFIN_CONTA.AsString <> EmptyStr ) then
    begin
      cdsParcelasTransporteKFIN_CONTA.AsString := cdsParcelasTransporteKFIN_CONTA.AsString;
      cdsParcelasTransporteNOMECONTA.AsString  := cdsParcelasTransporteNOMECONTA.AsString;
    end;}
   if (not cdsAPagarTransporteKFIN_CONTA_PREF.IsNull) and ( cdsAPagarTransporteKFIN_CONTA_PREF.AsString <> EmptyStr ) then
    begin
      cdsParcelasTransporteKFIN_CONTA.AsString := cdsAPagarTransporteKFIN_CONTA_PREF.AsString;
      cdsParcelasTransporteNOMECONTA.AsString  := cdsAPagarTransporteNOMECONTA.AsString;
    end;

  cdsParcelasTransporte.Post;

end;

function TdtmCOMPRAS_Pedido.ParcelaBaixada: Boolean;
const

   // Verificar se o fornecedor possui registros em compra
   _SQL_PARCELAS   = 'SELECT C.KCMP_PEDIDO '
   +#13#10'FROM CMP_PEDIDOS C'
   +#13#10'INNER JOIN FIN_APAGAR_PARCELAS P ON P.KFIN_APAGAR = C.KFIN_APAGAR'
   +#13#10'WHERE P.PAGO IS NOT NULL AND C.KCMP_PEDIDO = :KEY'
   +#13#10'UNION ALL'
   +#13#10'SELECT C.KCMP_PEDIDO '
   +#13#10'FROM CMP_PEDIDOS C'
   +#13#10'INNER JOIN FIN_APAGAR_PARCELAS P ON P.KFIN_APAGAR = C.KFIN_APAGAR_TRANSPORTE'
   +#13#10'WHERE P.PAGO IS NOT NULL AND C.KCMP_PEDIDO = :KEY'
   +#13#10'ROWS 1' ;

var

  cds : TClientDataSet ;
  p : TParams ;

begin

  try

    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KEY', ptInput ).asString := cdsPedidoKCMP_PEDIDO.asString ;
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

procedure TdtmCOMPRAS_Pedido.PostItem;
begin
   LValidatePlanoContas := False ;
   try
     TCdsSuppl.PostIfNeed( cdsItensPedido );
   finally
     LValidatePlanoContas := True ;
   end
end;

procedure TdtmCOMPRAS_Pedido.PostPatrimonio;
begin
   LValidatePlanoContas := False ;
   try
     TCdsSuppl.PostIfNeed( cdsItensPedido );
   finally
     LValidatePlanoContas := True ;
   end
end;

procedure TdtmCOMPRAS_Pedido.PostServico;
begin
   LValidatePlanoContas := False ;
   try
     TCdsSuppl.PostIfNeed( cdsServicosPedido ) ;
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
    FType : integer ;
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
   function CalcValorRateado (APercent: double ; AType : integer ): double;
   property OnEvent : TRateioEvent  read FOnEvent write SetOnEvent;
  end;

const
 _RATEIO_ITENS           = 0 ;
 _RATEIO_PATRIMONIOS     = 1 ;

procedure TdtmCOMPRAS_Pedido.Ratear( AValorRatear : double ; AFieldItens, AFieldPatrimonios : TFloatField ; ARateioEvent : TRateioEvent ) ;
type
  TInfoPair = TPair<string,double> ;
  TListPair = TList<TInfoPair> ;
var
  Rateio : TRateio ;
  LSomaParcial : double ;
  LItens, LPatrimonios : TListPair ;
  P : TInfoPair ;
  FKActiveItem, FKActivePatrimonio : string ;
begin
   TCDSSuppl.PostIfNeed ( cdsItensPedido ) ;
   TCDSSuppl.PostIfNeed ( cdsPatrimoniosPedido ) ;

   LItens := TListPair.Create ;
   LPatrimonios := TListPair.Create ;

   LSomaParcial :=  TryVarToFloat ( cdsItensPedidoSomaParcial.Value )
                  + TryVarToFloat ( cdsPatrimoniosPedidoSomaParcial.Value ) ;

   if LSomaParcial = 0 then
      LSomaParcial := 1 ;

   Rateio := TRateio.Create ;
   Rateio.OnEvent :=  ARateioEvent ;
   Rateio.ValorRatear := AValorRatear ;

   cdsItensPedido.DisableControls ;
   cdsPatrimoniosPedido.DisableControls ;

   FKActiveItem :=  cdsItensPedidoKCMP_PEDIDO_ITEM.asString ;
   FKActivePatrimonio :=  cdsPatrimoniosPedidoKCMP_PEDIDO_ITEM.asString ;

  try
    with cdsItensPedido do
      begin
        first ;
        while not eof  do
           begin
             LItens.Add( TInfoPair.Create(
                          cdsItensPedidoKCMP_PEDIDO_ITEM.asString,
                          Rateio.CalcValorRateado ( cdsItensPedidoVALOR_PARCIAL.asFloat / LSomaParcial, _RATEIO_ITENS )
                          ) ) ;
             next ;
           end;

      end;


    with AFieldPatrimonios.DataSet do
      begin
        first ;
        while not eof  do
           begin
             LPatrimonios.Add( TInfoPair.Create(
                          cdsPatrimoniosPedidoKCMP_PEDIDO_ITEM.asString,
                          Rateio.CalcValorRateado ( cdsPatrimoniosPedidoVALOR_PARCIAL.asFloat / LSomaParcial, _RATEIO_PATRIMONIOS )
                          ) ) ;
             next ;
           end;

      end ;

    with AFieldItens.DataSet do
     for p in LItens do
       begin
         Locate( 'KCMP_PEDIDO_ITEM', p.Key, [] ) ;
         edit ;
         if FKItemMaiorValor = p.Key then
            AFieldItens.asFloat := p.Value + Rateio.ValorRestante
         else
            AFieldItens.asFloat := p.Value ;
         post ;
       end;

    with AFieldPatrimonios.DataSet do
     for p in LPatrimonios do
       begin
         Locate( 'KCMP_PEDIDO_ITEM', p.Key, [] ) ;
         edit ;
         if FKItemMaiorValor = p.Key then
            AFieldPatrimonios.asFloat := p.Value + Rateio.ValorRestante
         else
            AFieldPatrimonios.asFloat := p.Value ;
         post ;
       end;

  finally
    cdsItensPedido.Locate( 'KCMP_PEDIDO_ITEM', FKActiveItem, [] ) ;
    cdsPatrimoniosPedido.Locate( 'KCMP_PEDIDO_ITEM', FKActivePatrimonio, [] ) ;
    cdsItensPedido.enableControls ;
    cdsPatrimoniosPedido.enableControls ;
  end;

   LItens.Free ;
   LPatrimonios.Free ;
   Rateio.Free ;

end;

procedure TdtmCOMPRAS_Pedido.RatearDescontos;
begin
   Ratear ( cdsPedidoDescontos.AsFloat, cdsItensPedidoDesconto, cdsPatrimoniosPedidoDesconto, SetMaiorValorItemDesconto ) ;
end;

procedure TdtmCOMPRAS_Pedido.RatearFrete;
begin
   Ratear ( cdsPedidoFrete.AsFloat, cdsItensPedidoFrete, cdsPatrimoniosPedidoFrete, SetMaiorValorItemFrete ) ;
end;

procedure TdtmCOMPRAS_Pedido.RatearImpostos;
begin
//   Ratear ( cdsPedidoFrete.AsFloat, cdsItensPedidoImpostos, cdsPatrimoniosPedidoImpostos, SetMaiorValorItemImposto ) ;
end;

procedure TdtmCOMPRAS_Pedido.RemoveApropriacaoItens;
begin
  with cdsApropriacaoItem do
    begin
      first ;
      while not eof do
        Delete ;
    end;
end;

procedure TdtmCOMPRAS_Pedido.RemoveApropriacaoPatrimonio;
begin
  with cdsApropriacaoPatrimonio do
    begin
      first ;
      while not eof do
        Delete ;
    end;
end;

procedure TdtmCOMPRAS_Pedido.RemoveApropriacaoServico;
begin
  with cdsApropriacaoServico do
    begin
      First;
      while not Eof do
        Delete;
    end;
end;

function TdtmCOMPRAS_Pedido.RoundTo(const AValue: Currency;
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

procedure TdtmCOMPRAS_Pedido.cdsLstPedidosNewRecord(DataSet: TDataSet);
begin
  self.InitializeKeys ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoNewRecord(DataSet: TDataSet);
begin
  self.CopyKeysFromMaster ;
  GetKey ( cdsPedidoKFIN_APAGAR ) ;
  GetKey ( cdsPedidoKFIN_APAGAR_TRANSPORTE ) ;
  cdsPedidoKSYSDOMAIN.asString       := LoggedUser.DomainID;
  cdsPedidoDATA_COMPRA.AsSQLTimeStamp  := DateTimeToSQLTimeStamp( Date ) ;
  cdsPedidoSERIE.asString              := '' ;
  cdsPedidoFRETE.asFloat               := 0;
  cdsPedidoDESCONTOS.asFloat           := 0;
  cdsPedidoIMPOSTOS.asFloat            := 0;
  cdsPedidoTOTAL_SERVICOS.asFloat      := 0;
  cdsPedidoTOTAL_NOTA.asFloat          := 0;
  cdsPedidoATIVO.AsString              := 'T';
  cdsPedidoIMPORTADO_NFE.asString      := 'F' ;
  cdsPedidoSYSORIGIN_TYPE.asInteger    := 0 ;
  FNewCadastro                         := True;
  ValorLinhaItensParcial               := 0 ;
  ValorLinhaItensTotal                      := 0;
  ValorLinhaItensTotalIPI              := 0;
  ValorLinhaServicos                   := 0;

//  cdsPedidoSTATUS.asInteger := 1 ;
//  if LoggedUser.Apelido = '' then
//     NomeCOMPRADOR := LoggedUser.Login
//  else
//     NomeCOMPRADOR := LoggedUser.Apelido ;

//  cdsPedidoNOMECONTATO.asString := 'o mesmo' ;
//  if LoggedUser.IsCOMPRADOR then
//     SetCOMPRADOR ( LoggedUser.CodigoEntidade, NomeCOMPRADOR) ;
end;

{$IFNDEF _DSServer}

procedure TdtmCOMPRAS_Pedido.SaveProdutosFornecedor( AKFornecedor : string ; ANFeProdutos : TNFeProdutoArray  ) ;
var
 LIndex : integer ;
begin

   if not cdsProdutosFornecedor.Active then
    cdsProdutosFornecedor.CreateDataSet ;

   for LIndex := Low( ANFeProdutos ) to High( ANFeProdutos ) do
      if ANFeProdutos[ LIndex ].KEST_PRODUTO <> '' then
         begin
            cdsProdutosFornecedor.Append ;
            cdsProdutosFornecedorKEST_PRODUTO.AsString    := ANFeProdutos[ LIndex ].KEST_PRODUTO ;
            cdsProdutosFornecedorKCAD_FORNECEDOR.AsString := AKFornecedor ;
            cdsProdutosFornecedorCODIGO.AsString          := ANFeProdutos[ LIndex ].CodigoDoFornecedor ;
            cdsProdutosFornecedorNOME.AsString            := ANFeProdutos[ LIndex ].NomeDoFornecedor ;
            cdsProdutosFornecedor.Post ;
         end;

  if cdsProdutosFornecedor.Active and not cdsProdutosFornecedor.IsEmpty then
   begin
    TCDSSuppl.ApplyUpdates( cdsProdutosFornecedor ) ;
    cdsProdutosFornecedor.EmptyDataSet ;
   end;

end ;

procedure TdtmCOMPRAS_Pedido.insereItemFromNFe(AKFornecedor : string ; ANFeProduto : TNFeProduto );
begin
  if ANFeProduto.KCAD_PATRIMONIO <> '' then
    begin
     cdsPatrimoniosPedido.Append ;
     inserePatrimonioFromNFe( AKFornecedor, ANFeProduto ) ;
     cdsPatrimoniosPedido.Post ;
    end
  else
    begin
      cdsItensPedido.Append ;
      insereProdutoFromNFe( AKFornecedor, ANFeProduto ) ;
      cdsItensPedido.Post ;
    end;
end;

procedure TdtmCOMPRAS_Pedido.insereProdutoFromNFe(AKFornecedor : string ; ANFeProduto : TNFeProduto );
var
  LCDSApropriacao : TClientDataSet ;
  LControlaEstoque : boolean ;
  LApropriacao,
  LDescricaoApropriacao : string ;
  p : TParams ;
begin
  if not ( cdsItensPedido.State in [dsInsert, dsEdit] ) then
    cdsItensPedido.Edit;

  LControlaEstoque      := False ;
  LApropriacao          := '' ;
  LDescricaoApropriacao := '' ;

  if ANFeProduto.KEST_PRODUTO = '' then
    begin
      cdsItensPedidoCODIGO.asString          := ANFeProduto.CodigoDoFornecedor ;
      cdsItensPedidoNOME.asString            := ANFeProduto.NomeDoFornecedor ;
      cdsItensPedidoUNIDADE.AsString         := LowerCase ( Copy ( ANFeProduto.UnidadeCompra, 1, 1 ) ) ;
    end
  else
    begin
      cdsDadosProduto.Params.ParamByName( 'KEST_PRODUTO' ).asString := ANFeProduto.KEST_PRODUTO ;
      TCDSSuppl.Open ( cdsDadosProduto ) ;
      LControlaEstoque      := cdsDadosProdutoBAIXA_ESTOQUE.AsBoolean ;
      LApropriacao          := cdsDadosProdutoKFIN_PLANOCONTA.asString ;
      LDescricaoApropriacao := cdsDadosProdutoDESCRICAO_APROPRIACAO.asString ;

      cdsItensPedidoCODIGO.asString          := cdsDadosProdutoCODIGO.AsString ;
      cdsItensPedidoNOME.asString            := cdsDadosProdutoNOME.AsString ;
      cdsItensPedidoKEST_PRODUTO.asString    := ANFeProduto.KEST_PRODUTO ;
      cdsItensPedidoUNIDADE.AsString         := cdsDadosProdutoUNIDADE.AsString ;
      cdsItensPedidoDETALHES.asString        := cdsDadosProdutoDESCRICAO.asString ;
      cdsItensPedidoOBS.AsString             := cdsDadosProdutoOBS.AsString ;
      cdsDadosProduto.Close ;
  end ;

  cdsItensPedidoCFOP.asString            := ANFeProduto.CFOP ;
  cdsItensPedidoCFOP_ESTOQUE.asString    := ANFeProduto.CFOP ;
  cdsItensPedidoCST_CSOSN.asString       := ANFeProduto.CST_CSOSN ;
  cdsItensPedidoQTDE_COMPRA.asFloat      := ANFeProduto.QtdeCompra ;
  cdsItensPedidoUNITARIO_COMPRA.asFloat  := ANFeProduto.UnitarioCompra ;
  cdsItensPedidoUNIDADE_COMPRA.AsString  := ANFeProduto.UnidadeCompra  ;

  if ANFeProduto.ValorFrete > 0 then
    cdsItensPedidoFRETE.asFloat          := ANFeProduto.ValorFrete  ;

  if ANFeProduto.ValorDesconto > 0 then
    cdsItensPedidoDESCONTO.asFloat       := ANFeProduto.ValorDesconto  ;

  cdsItensPedidoVALOR_IPI.AsFloat      := ANFeProduto.ValorIPI;
  cdsItensPedidoQTDE.asFloat           := ANFeProduto.QtdeCompra ;
  cdsItensPedidoVALOR_UNITARIO.asFloat := ANFeProduto.UnitarioCompra ;

  if ( ANFeProduto.QtdeCompra < 1 ) then
     cdsItensPedidoCUSTO.AsFloat          := ANFeProduto.UnitarioCompra + ( ANFeProduto.ValorIPI )
  else
     {O Valor do IPI é dividio pela quantidade de produto para ser somado ao custo junto com o valor unitário}
     cdsItensPedidoCUSTO.AsFloat          := ANFeProduto.UnitarioCompra + ( ANFeProduto.ValorIPI / ANFeProduto.QtdeCompra );

  RemoveApropriacaoItens;

  if LControlaEstoque then
    begin
      cdsItensPedidoDESCR_PC_NOME.AsString     := 'Estoque' ;
      cdsItensPedidoKFIN_PLANOCONTA.AsString   := TPlanoContasDespesasReceitas.GetKeyEstoque ;

      if SvcFinanceiroApropriacaoDefault.ForceCC then
        begin
             SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
                'EST_PRODUTOS'
               , cdsItensPedidoKEST_PRODUTO.asString
               , 'CMP_PEDIDO_ITENS'
               , cdsItensPedidoKCMP_PEDIDO_ITEM.AsString
               , cdsApropriacaoItem
               , True
             ) ;
        end;
    end
  else if LApropriacao <> '' then
    begin
      cdsItensPedidoDESCR_PC_NOME.AsString     := LDescricaoApropriacao ;
      cdsItensPedidoKFIN_PLANOCONTA.AsString   := LApropriacao ;

      SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
           'EST_PRODUTOS'
         , cdsItensPedidoKEST_PRODUTO.asString
         , 'CMP_PEDIDO_ITENS'
         , cdsItensPedidoKCMP_PEDIDO_ITEM.AsString
         , cdsApropriacaoItem
         , SvcFinanceiroApropriacaoDefault.NeedCC( cdsItensPedidoKFIN_PLANOCONTA.AsString )
      );
    end ;

end;

procedure TdtmCOMPRAS_Pedido.inserePatrimonioFromNFe(AKFornecedor : string ; ANFeProduto : TNFeProduto );
var
  LCDSApropriacao : TClientDataSet ;
  LControlaEstoque : boolean ;
  LApropriacao,
  LDescricaoApropriacao : string ;
  p : TParams ;
begin
  if not ( cdsPatrimoniosPedido.State in [dsInsert, dsEdit] ) then
    cdsPatrimoniosPedido.Edit;

  LControlaEstoque      := False ;
  LApropriacao          := '' ;
  LDescricaoApropriacao := '' ;

  cdsPatrimonio.Params.ParamByName( 'KCAD_PATRIMONIO' ).asString := ANFeProduto.KCAD_PATRIMONIO ;
  TCDSSuppl.Open ( cdsPatrimonio ) ;
  //LApropriacao                           := cdsPatrimonioKFIN_PLANOCONTA.asString ;
  //LDescricaoApropriacao                  := cdsPatrimonioDESCRICAO_APROPRIACAO.asString ;
  LApropriacao                                 := cdsPatrimonioKFIN_CATEGORIA.asString ;
  LDescricaoApropriacao                        := cdsPatrimonioDESCRICAO_CATEGORIA.asString ;
  cdsPatrimoniosPedidoCODIGO.asString          := cdsPatrimonioCODIGO.AsString ;
  cdsPatrimoniosPedidoNOME.asString            := cdsPatrimonioDESCRICAO.AsString ;
  cdsPatrimoniosPedidoKCAD_PATRIMONIO.AsString := ANFeProduto.KCAD_PATRIMONIO;
  cdsPatrimoniosPedidoUNIDADE.AsString         := cdsPatrimonioUNIDADE.AsString ;
  cdsPatrimoniosPedidoDETALHES.asString        := cdsPatrimonioDESCRICAO.asString ;
  cdsPatrimoniosPedidoOBS.AsString             := cdsPatrimonioOBS.AsString ;
  cdsPatrimonio.Close ;

  cdsPatrimoniosPedidoCFOP.asString            := ANFeProduto.CFOP ;
  cdsPatrimoniosPedidoCFOP_ESTOQUE.asString    := ANFeProduto.CFOP ;
  cdsPatrimoniosPedidoCST_CSOSN.asString       := ANFeProduto.CST_CSOSN ;
  cdsPatrimoniosPedidoQTDE_COMPRA.asFloat      := ANFeProduto.QtdeCompra ;
  cdsPatrimoniosPedidoUNITARIO_COMPRA.asFloat  := ANFeProduto.UnitarioCompra ;
  cdsPatrimoniosPedidoUNIDADE_COMPRA.AsString  := ANFeProduto.UnidadeCompra  ;

  if ANFeProduto.ValorFrete > 0 then
    cdsPatrimoniosPedidoFRETE.asFloat          := ANFeProduto.ValorFrete  ;

  if ANFeProduto.ValorDesconto > 0 then
    cdsPatrimoniosPedidoDESCONTO.asFloat       := ANFeProduto.ValorDesconto  ;

  cdsPatrimoniosPedidoVALOR_IPI.AsFloat      := ANFeProduto.ValorIPI;
  cdsPatrimoniosPedidoQTDE.asFloat           := ANFeProduto.QtdeCompra ;
  cdsPatrimoniosPedidoVALOR_UNITARIO.asFloat := ANFeProduto.UnitarioCompra ;

  if ( ANFeProduto.QtdeCompra < 1 ) then
     cdsPatrimoniosPedidoCUSTO.AsFloat          := ANFeProduto.UnitarioCompra + ( ANFeProduto.ValorIPI )
  else
     {O Valor do IPI é dividio pela quantidade de produto para ser somado ao custo junto com o valor unitário}
     cdsPatrimoniosPedidoCUSTO.AsFloat          := ANFeProduto.UnitarioCompra + ( ANFeProduto.ValorIPI / ANFeProduto.QtdeCompra );

  RemoveApropriacaoPatrimonio ;

   if LApropriacao <> '' then
     begin
       cdsPatrimoniosPedidoDESCR_PC_NOME.AsString     := LDescricaoApropriacao ;
       cdsPatrimoniosPedidoKFIN_PLANOCONTA.AsString   := LApropriacao ;
       //add rateio ....

       SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
            'CAD_PATRIMONIOS'
          , cdsPatrimoniosPedidoKCAD_PATRIMONIO.asString
          , 'CMP_PEDIDO_ITENS'
          , cdsPatrimoniosPedidoKCMP_PEDIDO_ITEM.AsString
          , cdsApropriacaoPatrimonio
          , SvcFinanceiroApropriacaoDefault.NeedCC( cdsPatrimoniosPedidoKFIN_PLANOCONTA.AsString )
       )
    end ;

end;

{$ENDIF}

procedure TdtmCOMPRAS_Pedido.insereItem(Key, CodigoProduto, NomeProduto: string; QTDE, ValorCusto: Currency;
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

  RemoveApropriacaoItens ;

  if AControlaEstoque then
    begin
      cdsItensPedidoDESCR_PC_NOME.AsString     := 'Estoque' ;
      cdsItensPedidoKFIN_PLANOCONTA.AsString   := TPlanoContasDespesasReceitas.GetKeyEstoque ;

      if SvcFinanceiroApropriacaoDefault.ForceCC then
        SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
                                 'EST_PRODUTOS', cdsItensPedidoKEST_PRODUTO.asString,
                                 'CMP_PEDIDO_ITENS', cdsItensPedidoKCMP_PEDIDO_ITEM.AsString,
                                 cdsApropriacaoItem,
                                 True );
    end
  else if not AKFIN_PlanoConta.Trim.IsEmpty then
    begin

      cdsItensPedidoDESCR_PC_NOME.AsString     := ADescrPlanoConta ;
      cdsItensPedidoKFIN_PLANOCONTA.AsString   := AKFIN_PlanoConta ;
      //add rateio ....

      SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
                               'EST_PRODUTOS', cdsItensPedidoKEST_PRODUTO.asString,
                               'CMP_PEDIDO_ITENS', cdsItensPedidoKCMP_PEDIDO_ITEM.AsString,
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

procedure TdtmCOMPRAS_Pedido.insereServico(
         const Key
       ,       Codigo
       ,       Nome
       ,       Unidade : string;
         const ValorCusto : Currency ;
         const AKFIN_PlanoConta
       ,       ADescrPlanoConta : string
     );
begin
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

  if not AKFIN_PlanoConta.Trim.IsEmpty then
   begin
    cdsServicosPedidoDESCR_PC_NOME.AsString     := ADescrPlanoConta ;
    cdsServicosPedidoKFIN_PLANOCONTA.AsString   := AKFIN_PlanoConta ;
   end;

end;

function TdtmCOMPRAS_Pedido.PlanoItemEstoque: boolean;
begin
  Result := cdsItensPedidoKFIN_PLANOCONTA.asString = TPlanoContasDespesasReceitas.GetKeyEstoque
end;


procedure TdtmCOMPRAS_Pedido.SetItemControlaEstoque ;
const
  _PRODUTO_BAIXA_ESTOQUE =
        'UPDATE EST_PRODUTOS'
 +#13#10'  SET'
 +#13#10'     BAIXA_ESTOQUE = ''T'''
 +#13#10'WHERE KEST_PRODUTO = :KEST_PRODUTO' ;

  _PRODUTO_BAIXA_ESTOQUE_SET_UNIDADE =
        'UPDATE EST_PRODUTOS'
 +#13#10'  SET'
 +#13#10'     BAIXA_ESTOQUE = ''T'''
 +#13#10'   , KCAD_UNIDADE  = :KCAD_UNIDADE'
 +#13#10'   , UNIDADE       = :UNIDADE'
 +#13#10'WHERE KEST_PRODUTO = :KEST_PRODUTO' ;
var
  p : TParams;
begin

  p := TParams.Create;

  if FHasUnidadeEstoque then
    begin
     p.CreateParam( ftString,  'KEST_PRODUTO',  ptInput ).AsString  :=  cdsItensPedidoKEST_PRODUTO.asString ;
     TTcAbstractDB.GetByAlias('FINANCEIRO').Execute( _PRODUTO_BAIXA_ESTOQUE, p );
    end
  else
    begin
     p.CreateParam( ftString,  'KCAD_UNIDADE',  ptInput ).asString   :=  cdsUnidadesControlaEstoqueKCAD_TIPOS.AsString ;
     p.CreateParam( ftString,  'UNIDADE',       ptInput ).AsString   :=  cdsUnidadesControlaEstoqueDESCRICAO.asString ;
     p.CreateParam( ftString,  'KEST_PRODUTO',  ptInput ).AsString   :=  cdsItensPedidoKEST_PRODUTO.asString ;
     TTcAbstractDB.GetByAlias('FINANCEIRO').Execute( _PRODUTO_BAIXA_ESTOQUE_SET_UNIDADE, p );
    end;

  p.Free;
end;

function TdtmCOMPRAS_Pedido.ItemHasUnidadeEstoque : boolean;
begin
   Result := FHasUnidadeEstoque ;
end;

function TdtmCOMPRAS_Pedido.ItemControlaEstoque : boolean;
const
  _PRODUTO_BAIXA_ESTOQUE =
        'SELECT'
 +#13#10'  P.BAIXA_ESTOQUE'
 +#13#10', P.KCAD_UNIDADE'
 +#13#10'FROM  EST_PRODUTOS P'
 +#13#10'WHERE KEST_PRODUTO = :KEST_PRODUTO' ;
begin
  with
    TTcAbstractDB
      .GetByAlias('FINANCEIRO')
      .ISQL( _PRODUTO_BAIXA_ESTOQUE )
      .SQLParamValues( 'KEST_PRODUTO'
        , cdsItensPedidoKEST_PRODUTO.asString
      )
      .GetDS()
  do
    begin
      Result      := Fields[0].asString = 'T' ;
      FHasUnidadeEstoque := not Fields[1].IsNull
                            and (Fields[1].asString.Trim <> '')  ;
    end;
end;

procedure TdtmCOMPRAS_Pedido.inserePatrimonio(
       Key : String;
       AKFIN_PlanoConta
     , ADescrPlanoConta : string );
var
  LCDSApropriacao : TClientDataSet ;
  p : TParams ;
  LQtdeIsNull : boolean ;
begin

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

  if not AKFIN_PlanoConta.Trim.IsEmpty then
    begin
      cdsPatrimoniosPedidoDESCR_PC_NOME.AsString     := ADescrPlanoConta ;
      cdsPatrimoniosPedidoKFIN_PLANOCONTA.AsString   := AKFIN_PlanoConta ;
    end;
  //add rateio ....

  SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
                            'CAD_PARTIMONIOS', cdsPatrimoniosPedidoKCAD_PATRIMONIO.asString,
                            'CMP_PEDIDO_ITENS', cdsPatrimoniosPedidoKCMP_PEDIDO_ITEM.AsString,
                            cdsApropriacaoPatrimonio,
                            SvcFinanceiroApropriacaoDefault.NeedCC( cdsPatrimoniosPedidoKFIN_PLANOCONTA.AsString ) );

  cdsPatrimonio.Close ;

end;


procedure TdtmCOMPRAS_Pedido.LimpaProduto;
begin
  cdsItensPedidoKEST_PRODUTO.Clear;
//  cdsItensPedidoCODIGO.Clear;
//  cdsItensPedidoNOME.Clear;
end;

procedure TdtmCOMPRAS_Pedido.LimpaPatrimonio;
begin
  cdsPatrimoniosPedidoKEST_PRODUTO.Clear;
//  cdsPatrimoniosPedidoCODIGO.Clear;
//  cdsPatrimoniosPedidoNOME.Clear;
end;

procedure TdtmCOMPRAS_Pedido.LimpaServico;
begin
  cdsServicosPedidoKEST_PRODUTO.Clear;
  //cdsServicosPedidoCODIGO.Clear;
  //cdsServicosPedidoNOME.Clear;
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoCalcFields(DataSet: TDataSet);
begin
  if not ( DataSet.State in [ dsInsert, dsEdit ] ) or ( DataSet.IsEmpty ) then
    Exit;

  CalculaTotaisPedido;

end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoDATA_COMPRAChange(Sender: TField);
begin
  try
    cdsPedidoDATA_EMISSAO.AsDateTime := Sender.AsDateTime ;
    if Sender.AsDateTime < Date then
      cdsPedidoDATA_ENTRADA.AsDateTime := Sender.AsDateTime { + 1 } // angélica solicitou não somar 1 ...
    else
      cdsPedidoDATA_ENTRADA.AsDateTime := Date ;
  except On E : Exception do
    RaiseException ( E, UnitName, ClassName, 'cdsPedidoDATA_COMPRAChange' ) ;
  end;
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoDATA_COMPRAValidate(Sender: TField);
begin
  if Sender.AsDateTime > (Date + Time) then
    raise Warning.Create('Data de compra não pode ser superior a data atual.');
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoDATA_EMISSAOValidate(Sender: TField);
begin
  if Sender.AsDateTime > (Date + Time) then
    raise Warning.Create('Data de emissão não pode ser superior a data atual.');
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoDATA_ENTRADAValidate(Sender: TField);
begin
  if Sender.AsDateTime > (Date + Time) then
    raise Warning.Create('Data de entrada não pode ser superior a data atual.');
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoKCAD_ENTIDADEValidate(Sender: TField);
begin
  ValidNF ;
end;

procedure TdtmCOMPRAS_Pedido.SetEntidade(Key: String; NomeEntidade: string);
var
  Dados, Email, Fone : String ;
  KCAD_VENDEDOR, KCAD_TRANSPORTADORA, KCAD_REDESPACHO : integer ;
  DDSFAT : string ;
  CondPagto : integer ;
begin
   if not ( cdsPedido.State in [dsInsert,dsEdit] ) then
      cdsPedido.Edit ;

//try
   cdsPedidoKCAD_ENTIDADE.asString := Key ;
   cdsPedidoNOMEENTIDADE.asString  := NomeEntidade ;

   cdsDadosEntidade.Edit ;
   cdsDadosEntidadeKCAD_ENTIDADE.asString := Key ;

   //scRdmCOMPRAS_Pedido.AppServer.GetDadosEntidade( Key, Dados, Email, Fone ) ;
//   DBResources.GetDadosEntidade( Key, Dados, Email, Fone, KCAD_VENDEDOR, KCAD_TRANSPORTADORA, KCAD_REDESPACHO, DDSFAT, CondPagto ) ;

   cdsDadosEntidadeDADOSENTIDADE.asString  := Dados ;
//   cdsPedidoEMAIL.asString  := Email ;
//   cdsPedidoFONE.asString  := Fone ;
   cdsDadosEntidade.Post ;

  cdsAPagar.Edit ;
  cdsAPagarKCAD_ENTIDADE.AsString := cdsPedidoKCAD_ENTIDADE.AsString ;
  cdsAPagarNOMEENTIDADE.asString  := cdsPedidoNOMEENTIDADE.asString ;
//except On E : Exception do
//  RaiseException ( E, UnitName, ClassName, 'cdsPedidoDATA_COMPRAChange' ) ;
//end;

end;

procedure TdtmCOMPRAS_Pedido.SetEntidadeTransporte(Key: String; NomeEntidade: string);
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

procedure TdtmCOMPRAS_Pedido.SetFilter(ShowInativos: Boolean; DataInicial, DataFinal : TDateTime );
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

procedure TdtmCOMPRAS_Pedido.SetKCMP_PEDIDO(const Value: string);
begin
  FKCMP_PEDIDO := Value;
end;

procedure TdtmCOMPRAS_Pedido.SetMaiorValorItemDesconto(ARateioEventType : TRateioEventType; APercent: double ; AType : integer );
begin
   if ARateioEventType = retMaior then
     begin
       FKItemMaiorValor := cdsItensPedidoKCMP_PEDIDO_ITEM.asString ;
     end;
end;

procedure TdtmCOMPRAS_Pedido.SetMaiorValorItemFrete(ARateioEventType : TRateioEventType; APercent: double ; AType : integer );
begin
   if ARateioEventType = retMaior then
      begin
       FKItemMaiorValor := cdsItensPedidoKCMP_PEDIDO_ITEM.asString ;
       FTipoMaiorValor  := AType ;
      end;
end;

procedure TdtmCOMPRAS_Pedido.SetMaiorValorItemImposto(ARateioEventType : TRateioEventType; APercent: double ; AType : integer );
begin
   if ARateioEventType = retMaior then
     begin
       FKItemMaiorValor := cdsItensPedidoKCMP_PEDIDO_ITEM.asString ;
       FTipoMaiorValor  := AType ;
     end;
end;

procedure TdtmCOMPRAS_Pedido.SetParams;
begin
  cdsLstPedidos.Params.ParamByName( 'KSYS$DOMAIN' ).asString  := LoggedUser.DomainID ;


  cdsLstPedidos.Params.ParamByName( 'DSP_INATIVO'  ).asString  := BoolToChar ( FShowInativos ) ;
  cdsLstPedidos.Params.ParamByName( 'DATAINI' ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataInicial ) ;
  cdsLstPedidos.Params.ParamByName( 'DATAFIM' ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFinal ) ;

  if FKCMP_PEDIDO = '' then
     cdsLstPedidos.Params.ParamByName ( 'LISTALL' ).asString := 'T'
  else
     cdsLstPedidos.Params.ParamByName ( 'LISTALL' ).asString := 'F' ;

  cdsLstPedidos.Params.ParamByName ( 'KCMP_PEDIDO' ).asString := FKCMP_PEDIDO ;

end;

procedure TdtmCOMPRAS_Pedido.SetValidApropriacao(const Value: Boolean);
begin
  FValidApropriacao := Value;
end;

procedure TdtmCOMPRAS_Pedido.sqlPedidoBeforeOpen(DataSet: TDataSet);
begin
  FSQLPedidosRequiredField := sqlPedido.RequiredFields.Required ( False ) ;
end;

function TdtmCOMPRAS_Pedido.ValidaCampos: Boolean;
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

procedure TdtmCOMPRAS_Pedido.ValidNF;
begin
  if   ( cdsPedidoKCAD_ENTIDADE.IsNull )
    or ( cdsPedidoNOTA_FISCAL.isNull   )
    or ( Trim ( cdsPedidoNOTA_FISCAL.AsString ) = '' ) then
     exit ;

  if TSQLSuppl.CheckExistsIn(    'CMP_PEDIDOS',
                                 'KCAD_ENTIDADE;NOTA_FISCAL;SERIE',   VarArrayOf( [ cdsPedidoKCAD_ENTIDADE.asString, cdsPedidoNOTA_FISCAL.asString, cdsPedidoSERIE.asString ] ),
                                 Format ( 'KCMP_PEDIDO <> %s ', [ QuotedStr( cdsPedidoKCMP_PEDIDO.asString ) ] ),
                                 TSQLConnection ( DBResources[ 'FINANCEIRO' ].Connection ) ) then
        Raise Warning.Create( _ERRMSG_NOTA_JA_CADASTRADA ) ;
end;

procedure TdtmCOMPRAS_Pedido.SetCFOP(Key, Descricao: string);
begin
   //cdsItensPedidoCFOP_DESCR.asString  := Descricao ;
  if not ( cdsItensPedido.State in [dsInsert, dsEdit] ) then
    cdsItensPedido.Edit;
   cdsItensPedidoCFOP.asString := Key ;
end;

procedure TdtmCOMPRAS_Pedido.SetCFOP_ESTOQUE(Key, Descricao: string);
begin
   //cdsItensPedidoCFOP_DESCR.asString  := Descricao ;
  if not ( cdsItensPedido.State in [dsInsert, dsEdit] ) then
    cdsItensPedido.Edit;
   cdsItensPedidoCFOP_ESTOQUE.asString := Key ;
end;

procedure TdtmCOMPRAS_Pedido.SetCOMPRADOR(Key: String;
  NomeCOMPRADOR: string);
begin
   if not ( cdsPedido.State in [dsInsert,dsEdit] ) then
      cdsPedido.Edit ;

//   cdsPedidoNOMECOMPRADOR.asString := NomeCOMPRADOR ;
//   cdsPedidoKCOMPRADOR.asInteger := Key ;
end;

procedure TdtmCOMPRAS_Pedido.SetConta(KFIN_CONTA, NOME: string);
begin
   if not ( cdsParcelas.State in [dsInsert,dsEdit] ) then
      cdsParcelas.Edit ;

   cdsParcelasKFIN_CONTA.AsString := KFIN_CONTA;
   cdsParcelasNOMECONTA.AsString  := NOME;
end;

procedure TdtmCOMPRAS_Pedido.GetContaFavorita;
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

procedure TdtmCOMPRAS_Pedido.SetContaPreferencia(KFIN_CONTA, NOME: string);
begin
  if not ( cdsAPagar.State in [ dsInsert, dsEdit ] ) then
    cdsAPagar.Edit ;

  FKContaPadrao := KFIN_CONTA;
  FNomeConta    := NOME;
  cdsAPagarNOMECONTA.AsString       := FNomeConta;
  cdsAPagarKFIN_CONTA_PREF.AsString := FKContaPadrao;
end;

procedure TdtmCOMPRAS_Pedido.SetContaPreferenciaTransporte(KFIN_CONTA,
  NOME: string);
begin
  if not ( cdsAPagarTransporte.State in [ dsInsert, dsEdit ] ) then
    cdsAPagarTransporte.Edit ;

  FKContaPadrao := KFIN_CONTA;
  FNomeConta    := NOME;
  cdsAPagarTransporteNOMECONTA.AsString       := FNomeConta;
  cdsAPagarTransporteKFIN_CONTA_PREF.AsString := FKContaPadrao;
end;

procedure TdtmCOMPRAS_Pedido.SetContato(Key: String;
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

procedure TdtmCOMPRAS_Pedido.SetContaTransporte(KFIN_CONTA, NOME: string);
begin
   if not ( cdsParcelasTransporte.State in [dsInsert,dsEdit] ) then
      cdsParcelasTransporte.Edit ;

   cdsParcelasTransporteKFIN_CONTA.AsString := KFIN_CONTA;
   cdsParcelasTransporteNOMECONTA.AsString  := NOME;
end;

///**********************

procedure TdtmCOMPRAS_Pedido.cdsItensPedidoAfterCancel(DataSet: TDataSet);
begin
  ValorLinhaItensParcial := 0 ;
  ValorLinhaItensTotal := 0 ;
  ValorLinhaItensTotalIPI := 0;
  CalculaTotaisPedido ;
end;

procedure TdtmCOMPRAS_Pedido.cdsItensPedidoAfterDelete(DataSet: TDataSet);
begin
  ValorLinhaItensParcial := 0 ;
  ValorLinhaItensTotal := 0 ;
  ValorLinhaItensTotalIPI := 0;
  CalculaTotaisPedido ;
end;

procedure TdtmCOMPRAS_Pedido.cdsItensPedidoBeforeEdit(DataSet: TDataSet);
begin
  LValidatePlanoContas := True ;
  ValorLinhaItensParcial  := cdsItensPedidoVALOR_PARCIAL.asFloat ;
  ValorLinhaItensTotal    := cdsItensPedidoTOTAL.asFloat ;
  ValorLinhaItensTotalIPI := cdsItensPedidoVALOR_IPI.AsFloat;
end;

procedure TdtmCOMPRAS_Pedido.cdsItensPedidoCalcFields(DataSet: TDataSet);
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

  cdsItensPedidoTOTAL.asFloat   := RoundTo(cdsItensPedidoVALOR_PARCIAL.asFloat, -2 )
                                 - RoundTo(cdsItensPedidoDESCONTO.asFloat, -2)  ;
                                // + cdsItensPedidoFRETE.asFloat ;

  cdsItensPedidoCUSTO.asFloat   := cdsItensPedidoVALOR_UNITARIO.asFloat
                                - (cdsItensPedidoDESCONTO.asFloat / LQtde )
                                + (cdsItensPedidoFRETE.asFloat    / LQtde )
                                + ( cdsItensPedidoVALOR_IPI.AsFloat / LQtde );

  cdsItensPedido.OnCalcFields   := cdsItensPedidoCalcFields ;

  CalculaTotaisPedido ;
end;

procedure TdtmCOMPRAS_Pedido.cdsItensPedidoCODIGO_NOMESetText(Sender: TField;
  const Text: string);
begin
  Sender.asString := Text ;
  LimpaProduto ;
end;

procedure TdtmCOMPRAS_Pedido.cdsItensPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TdtmCOMPRAS_Pedido.cdsItensPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
begin
  RemoveApropriacaoItens ;

  cdsItensPedidoKFIN_PLANOCONTA.Clear;
  Sender.asString := Text ;
end;

procedure TdtmCOMPRAS_Pedido.cdsItensPedidoNewRecord(DataSet: TDataSet);
begin
//try
  GetKey ( cdsItensPedidoKCMP_PEDIDO_ITEM ) ;
  cdsItensPedidoIS_PATRIMONIO.AsString := 'F';
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

//except On E : Exception do
//  RaiseException ( E, UnitName, ClassName, 'cdsItensPedidoNewRecord' ) ;
//end;
end;

procedure TdtmCOMPRAS_Pedido.cdsItensPedidoQTDE_COMPRAChange(Sender: TField);
begin
   cdsItensPedidoQTDE.asFloat := cdsItensPedidoQTDE_COMPRA.asFloat ;
end;

procedure TdtmCOMPRAS_Pedido.cdsItensPedidoBeforeInsert(DataSet: TDataSet);
begin
  LValidatePlanoContas    := True ;
  ValorLinhaItensParcial  := 0 ;
  ValorLinhaItensTotal    := 0 ;
  ValorLinhaItensTotalIPI := 0;
  if cdsPedido.isEmpty and not (cdsPedido.State in [dsInsert,dsEdit]) then
     cdsPedido.Append ;
end;

procedure TdtmCOMPRAS_Pedido.cdsItensPedidoBeforePost(DataSet: TDataSet);
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

end;

//***************************************


procedure TdtmCOMPRAS_Pedido.cdsPatrimoniosPedidoAfterCancel(DataSet: TDataSet);
begin
  ValorLinhaPatrimoniosParcial  := 0 ;
  ValorLinhaPatrimoniosTotal    := 0 ;
  ValorLinhaPatrimoniosTotalIPI := 0;
  CalculaTotaisPedido ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPatrimoniosPedidoAfterDelete(DataSet: TDataSet);
begin
  ValorLinhaPatrimoniosParcial  := 0 ;
  ValorLinhaPatrimoniosTotal    := 0 ;
  ValorLinhaPatrimoniosTotalIPI := 0;
  CalculaTotaisPedido ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPatrimoniosPedidoBeforeEdit(DataSet: TDataSet);
begin
  LValidatePlanoContas := True ;
  ValorLinhaPatrimoniosParcial  := cdsPatrimoniosPedidoVALOR_PARCIAL.asFloat ;
  ValorLinhaPatrimoniosTotal    := cdsPatrimoniosPedidoTOTAL.asFloat ;
  ValorLinhaPatrimoniosTotalIPI := cdsPatrimoniosPedidoVALOR_IPI.AsFloat;
end;

procedure TdtmCOMPRAS_Pedido.cdsPatrimoniosPedidoCalcFields(DataSet: TDataSet);
var
  LQtdeCompra : double ;
  LQtde : double ;
begin

  if (DataSet.State = dsInternalCalc) then
    begin
      cdsPatrimoniosPedidoCODIGO_NOME.OnSetText := nil ;
      cdsPatrimoniosPedidoCODIGO_NOME.asString  := cdsPatrimoniosPedidoCODIGO.AsString + ' - ' + cdsPatrimoniosPedidoNOME.AsString ;
      cdsPatrimoniosPedidoCODIGO_NOME.OnSetText := cdsPatrimoniosPedidoCODIGO_NOMESetText ;
      exit ;
    end;


  if not ( DataSet.State in [dsInsert,dsEdit] ) or ( DataSet.IsEmpty ) then
    Exit ;

  cdsPatrimoniosPedido.OnCalcFields := nil ;

  LQtdeCompra :=  cdsPatrimoniosPedidoQTDE_COMPRA.AsFloat ;
  if LQtdeCompra = 0 then
     LQtdeCompra :=  1 ;

  LQtde :=  cdsPatrimoniosPedidoQTDE.AsFloat ;
  if LQtde = 0 then
     LQtde :=  LQtdeCompra ;

  if cdsPatrimoniosPedidoQTDE.IsNull
  and ( cdsPatrimoniosPedidoQTDE_COMPRA.AsFloat > 0  )  then
    cdsPatrimoniosPedidoQTDE.AsFloat := cdsPatrimoniosPedidoQTDE_COMPRA.AsFloat ;

  cdsPatrimoniosPedidoVALOR_UNITARIO.asFloat :=  cdsPatrimoniosPedidoUNITARIO_COMPRA.asFloat * (LQtdeCompra / LQtde) ;

  cdsPatrimoniosPedidoVALOR_PARCIAL.asFloat := cdsPatrimoniosPedidoQTDE.asFloat
                                 * cdsPatrimoniosPedidoVALOR_UNITARIO.asFloat ;

  cdsPatrimoniosPedidoTOTAL.asFloat   := RoundTo(cdsPatrimoniosPedidoVALOR_PARCIAL.asFloat, -2)
                                 - RoundTo(cdsPatrimoniosPedidoDESCONTO.asFloat, -2)  ;
                                // + cdsPatrimoniosPedidoFRETE.asFloat ;

  cdsPatrimoniosPedidoCUSTO.asFloat   := cdsPatrimoniosPedidoVALOR_UNITARIO.asFloat
                                - (cdsPatrimoniosPedidoDESCONTO.asFloat / LQtde )
                                + (cdsPatrimoniosPedidoFRETE.asFloat    / LQtde )
                                + ( cdsPatrimoniosPedidoVALOR_IPI.AsFloat / LQtde );

  cdsPatrimoniosPedido.OnCalcFields   := cdsPatrimoniosPedidoCalcFields ;

  CalculaTotaisPedido ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPatrimoniosPedidoCODIGO_NOMESetText(Sender: TField;
  const Text: string);
begin
  Sender.asString := Text ;
  LimpaPatrimonio ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPatrimoniosPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPatrimoniosPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
begin
  RemoveApropriacaoPatrimonio ;

  cdsPatrimoniosPedidoKFIN_PLANOCONTA.Clear;
  Sender.asString := Text ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPatrimoniosPedidoNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsPatrimoniosPedidoKCMP_PEDIDO_ITEM ) ;
  cdsPatrimoniosPedidoIS_PATRIMONIO.AsString := 'T';
  cdsPatrimoniosPedidoVALOR_UNITARIO.asFloat := 0 ;
  cdsPatrimoniosPedidoVALOR_PARCIAL.asFloat  := 0 ;
  cdsPatrimoniosPedidoVALOR_IPI.AsFloat      := 0;
  cdsPatrimoniosPedidoFRETE.asFloat          := 0 ;
  cdsPatrimoniosPedidoDESCONTO.asFloat       := 0 ;

//    cdsPatrimoniosPedidoCFOP.asString;
  cdsPatrimoniosPedidoQTDE_COMPRA.asFloat    := 0 ;
//    cdsPatrimoniosPedidoUNIDADE_COMPRA.asString  := ;
    cdsPatrimoniosPedidoUNITARIO_COMPRA.asFloat  := 0 ;
    cdsPatrimoniosPedidoATUALIZAR_CUSTO.asString := 'T' ;
//  cdsPatrimoniosPedidoIMPOSTO.asFloat := 0 ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPatrimoniosPedidoBeforeInsert(DataSet: TDataSet);
begin
  LValidatePlanoContas := True ;
  ValorLinhaPatrimoniosParcial  := 0 ;
  ValorLinhaPatrimoniosTotal    := 0 ;
  ValorLinhaPatrimoniosTotalIPI := 0;
  if cdsPedido.isEmpty and not (cdsPedido.State in [dsInsert,dsEdit]) then
     cdsPedido.Append ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPatrimoniosPedidoBeforePost(DataSet: TDataSet);
var
  LErrMsg : TStringBuilder ;
begin

  if FDisableCheckItems then
    exit ;

  LErrMsg := TStringBuilder.Create ;

  if ( cdsPatrimoniosPedidoKCAD_PATRIMONIO.IsNull ) then
    LErrMsg.AppendLine('Patrimônio deve ser cadastrado/selecionado.');

  if ( ( cdsPatrimoniosPedidoQTDE.IsNull ) or ( cdsPatrimoniosPedidoQTDE.AsString = '' )
   and ( cdsPatrimoniosPedidoVALOR_UNITARIO.IsNull or ( cdsPatrimoniosPedidoVALOR_UNITARIO.AsString = '' )) )then
    LErrMsg.AppendLine('Quantidade e valor deve ser digitado');

//  if ( ( cdsPatrimoniosPedidoQTDE.IsNull ) or ( cdsPatrimoniosPedidoQTDE.AsString = '' )
//   and ( cdsPatrimoniosPedidoCUSTO.IsNull or ( cdsPatrimoniosPedidoCUSTO.AsString = '' )) )then
//    LErrMsg.AppendLine('Quantidade e custo deve ser digitado');

  if LValidatePlanoContas and cdsPatrimoniosPedidoKFIN_PLANOCONTA.IsNull then
    LErrMsg.AppendLine('Conta contábil deve ser pesquisada/selecionada.');

  try
    if LErrMsg.Length > 0 then
       raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;

end;



procedure TdtmCOMPRAS_Pedido.cdsPedidoBeforeInsert(DataSet: TDataSet);
begin
  if cdsLstPedidos.isEmpty and not ( cdsLstPedidos.State in [dsInsert,dsEdit] ) then
     cdsLstPedidos.Append ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoBeforeOpen(DataSet: TDataSet);
begin
  FCDSPedidosRequiredField := cdsPedido.RequiredFields.Required ( False ) ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoNOMEENTIDADESetText(Sender: TField; const Text: string);
begin
  cdsPedidoKCAD_ENTIDADE.Clear ;
  Sender.asString := Text ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoNOTA_FISCALValidate(Sender: TField);
begin
  ValidNF ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoSERIEValidate(Sender: TField);
begin
  ValidNF ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoNOMECOMPRADORValidate(Sender: TField);
begin
end;


//************************
{-- calculo servicos --}
procedure TdtmCOMPRAS_Pedido.cdsServicosPedidoAfterCancel(DataSet: TDataSet);
begin
  ValorLinhaServicos := 0 ;
  CalculaTotaisPedido ;
end;

procedure TdtmCOMPRAS_Pedido.cdsServicosPedidoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  ValorLinhaServicos := 0 ;
  CalculaTotaisPedido ;
end;

procedure TdtmCOMPRAS_Pedido.cdsServicosPedidoBeforeEdit(DataSet: TDataSet);
begin
   LValidatePlanoContas := True ;
   ValorLinhaServicos := cdsServicosPedidoTOTAL.asFloat ;
end;

procedure TdtmCOMPRAS_Pedido.cdsServicosPedidoBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  LValidatePlanoContas := True ;
  ValorLinhaServicos := 0 ;
  if cdsPedido.isEmpty and not (cdsPedido.State in [dsInsert,dsEdit]) then
     cdsPedido.Append ;
end;

procedure TdtmCOMPRAS_Pedido.cdsServicosPedidoBeforePost(DataSet: TDataSet);
var
  LErrMsg : TStringBuilder ;
begin

  LErrMsg := TStringBuilder.Create ;

  if cdsServicosPedidoKEST_PRODUTO.IsNull then
    LErrMsg.AppendLine('Serviço deve ser pesquisado/selecionado.');

  if ( ( cdsServicosPedidoQTDE.IsNull ) or ( cdsServicosPedidoQTDE.AsString = '' )
   and ( cdsServicosPedidoCUSTO.IsNull or ( cdsServicosPedidoCUSTO.AsString = '' )) )then
    LErrMsg.AppendLine(' Quantidade e custo deve ser digitado');

  if LValidatePlanoContas and cdsServicosPedidoKFIN_PLANOCONTA.IsNull then
    LErrMsg.AppendLine('Conta contábil deve ser pesquisada/selecionada.');

  try
    if LErrMsg.Length > 0 then
       raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;

end;


procedure TdtmCOMPRAS_Pedido.cdsServicosPedidoNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsServicosPedidoKCMP_PEDIDO_SERVICO );
end;

procedure TdtmCOMPRAS_Pedido.cdsServicosPedidoNOMESetText(Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  LimpaServico ;
end;

procedure TdtmCOMPRAS_Pedido.cdsServicosPedidoCalcFields(DataSet: TDataSet);
begin
  inherited;

  if (DataSet.State = dsInternalCalc) then
    begin
      cdsServicosPedidoCODIGO_NOME.OnSetText := nil ;
      cdsServicosPedidoCODIGO_NOME.asString  := cdsServicosPedidoCODIGO.AsString + ' - ' + cdsServicosPedidoNOME.AsString ;
      cdsServicosPedidoCODIGO_NOME.OnSetText := cdsServicosPedidoCODIGO_NOMESetText ;
      exit ;
    end;


  if not ( DataSet.State in [dsInsert,dsEdit] ) or ( DataSet.IsEmpty ) then
     Exit;

  cdsServicosPedido.OnCalcFields := nil ;
  cdsServicosPedidoTOTAL.asFloat := cdsServicosPedidoQTDE.asFloat * cdsServicosPedidoCUSTO.asFloat ;
  cdsServicosPedido.OnCalcFields := cdsServicosPedidoCalcFields ;

  CalculaTotaisPedido ;
end;


procedure TdtmCOMPRAS_Pedido.cdsServicosPedidoCODIGO_NOMESetText(Sender: TField;
  const Text: string);
begin
  Sender.asString := Text ;
  LimpaServico ;
end;

procedure TdtmCOMPRAS_Pedido.cdsServicosPedidoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TdtmCOMPRAS_Pedido.cdsServicosPedidoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
begin
  RemoveApropriacaoServico ;
  cdsServicosPedidoKFIN_PLANOCONTA.Clear;
  Sender.asString := Text ;
end;

procedure TdtmCOMPRAS_Pedido.CheckMesEncerrado;
var
  p : TParams ;
begin
  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString       := cdsPedidoKSYSDOMAIN.asString ;
  p.CreateParam( ftString, 'DATA',         ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( cdsPedidoDATA_EMISSAO.asDateTime ) ;
  try
    sqlPedido.SQLConnection.Execute ( 'EXECUTE PROCEDURE EST_CHECK_ENCERRAMENTO_MES ( :KSYS$DOMAIN, :DATA, ''F'' )', p )
  finally
    p.free ;
  end;
end;

procedure TdtmCOMPRAS_Pedido.CheckValorAPagar;
begin
  TCdsSuppl.PostIfNeed( cdsPedido );
  TCdsSuppl.PostIfNeed( cdsParcelas );
  TCdsSuppl.PostIfNeed( cdsParcelasTransporte );

  if cdsItensPedido.IsEmpty and cdsPatrimoniosPedido.IsEmpty and cdsServicosPedido.IsEmpty then
    raise Warning.Create('Não é possível salvar pedido sem ítem ou serviço especificado.');

  if ( RoundTo ( cdsPedidoDESCONTOS.AsFloat, -2 )
    <> (   RoundTo ( TryVarToFloat ( cdsItensPedidoSomaDesconto.Value ), -2 )
          + RoundTo ( TryVarToFloat ( cdsPatrimoniosPedidoSomaDesconto.Value ), -2 )
        )
     ) then
    raise Warning.Create('Soma do desconto dos itens não confere com o valor do desconto') ;

  if ( RoundTo ( cdsPedidoFRETE.AsFloat, -2 )
     <> (   RoundTo ( TryVarToFloat ( cdsItensPedidoSomaFrete.Value ), -2 )
          + RoundTo ( TryVarToFloat ( cdsPatrimoniosPedidoSomaFrete.Value ), -2 )
        )
     ) then
    raise Warning.Create('Soma do frete dos itens não confere com o valor do frete') ;

  if cdsPedidoSYSORIGIN_TYPE.asInteger <> 2 then
    if ( cdsParcelas.IsEmpty ) then
      raise Warning.Create('Não é possível salvar o pedido sem gerar o contas a pagar.');



  //**frete
  if cdsPedidoSYSORIGIN_TYPE.asInteger <> 2 then
    if ( Abs( RoundTo ( cdsPedidoTOTAL_NOTA.AsFloat {- cdsPedidoFRETE.AsFloat}, -2 )
            - RoundTo ( TryVarToFloat ( cdsParcelasSomaValor.Value ), -2 )
            ) > 0.01 ) then
      raise Warning.Create('Total das parcelas não confere com o total da compra');

  cdsParcelas.DisableControls;
  cdsParcelas.First;
  try
    while not cdsParcelas.Eof do
      begin
        if ( cdsParcelasKFIN_CONTA.IsNull ) or ( cdsParcelasKFIN_CONTA.AsString = EmptyStr ) then
          begin
            if cdsAPagarKFIN_CONTA_PREF.asString <> '' then
             begin
              cdsParcelas.Edit;
              cdsParcelasKFIN_CONTA.asString := cdsAPagarKFIN_CONTA_PREF.asString ;
              cdsParcelasNOMECONTA.asString  := cdsAPagarNOMECONTA.asString ;
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

  if    ( cdsPedidoFrete.AsFloat = 0 )
    and ( TryVarToFloat ( cdsItensPedidoSomaFrete.Value ) = 0 )
    and ( cdsParcelasTransporte.IsEmpty ) then
    begin
     if not cdsApagarTransporte.IsEmpty then
        cdsApagarTransporte.Delete ;
     exit ;
    end;


  if ( cdsParcelasTransporte.IsEmpty ) then
    raise Warning.Create('Não é possível salvar o pedido sem gerar o pagamento do transporte.');


  if ( RoundTo ( cdsPedidoFRETE.AsFloat, -2 ) <> RoundTo ( TryVarToFloat ( cdsParcelasTransporteSomaValor.Value ), -2 ) ) then
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

procedure TdtmCOMPRAS_Pedido.ClearItemControlaEstoque;
begin
  if not ( cdsItensPedido.State in [dsInsert,dsEdit] )then
     cdsItensPedido.Edit ;
  cdsItensPedidoDESCR_PC_NOME.Clear ;
  cdsItensPedidoKFIN_PLANOCONTA.Clear ;
end;

procedure TdtmCOMPRAS_Pedido.ClonePedido;
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

   procedure CopyItensServicos ( DataSet : TDataSet ) ;
   begin
      with DataSet do
         begin
            cdsServicosPedido.Append ;
            cdsServicosPedidoKEST_PRODUTO.AsString       := fieldByName ( 'KEST_PRODUTO' ).AsString  ;
            cdsServicosPedidoCODIGO.asString             := fieldByName ( 'CODIGO' ).asString        ;
            cdsServicosPedidoNOME.asString               := fieldByName ( 'NOME' ).asString          ;
            cdsServicosPedidoQTDE.asFloat                := fieldByName ( 'QTDE' ).asFloat           ;
            cdsServicosPedidoTOTAL.asFloat               := fieldByName ( 'TOTAL' ).asFloat          ;
            cdsServicosPedidoCUSTO.asFloat               := fieldByName ( 'CUSTO' ).asFloat          ;
            cdsServicosPedidoOBS.asString                := fieldByName ( 'OBS' ).asString           ;
            cdsServicosPedidoDETALHES.asString           := fieldByName ( 'DETALHES' ).asString      ;
            cdsServicosPedido.Post ;
         end ;
   end ;

   procedure CopyServicos ;
   begin
      with TDataSetField ( Clone.fieldByName ( 'sqlServicosPedido' ) ), NestedDataSet do
         begin
            First ;
            While not eof do
               begin
                   CopyItensServicos ( NestedDataSet ) ;
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
   copyServicos ;

   Clone.Close ;
   Clone.Free ;

end;

procedure TdtmCOMPRAS_Pedido.EditItem;
begin
  cdsItensPedido.Edit ;
end;

procedure TdtmCOMPRAS_Pedido.EditPatrimonio ;
begin
  cdsPatrimonio.Edit ;
end;

procedure TdtmCOMPRAS_Pedido.EditServico;
begin
  cdsServicosPedido.Edit ;
end;

procedure TdtmCOMPRAS_Pedido.ExcluiPatrimonio(FKCAD_Patrimonio: string);
begin
  sqlPatrimonio.Close;
  cdsPatrimonio.Params.ParamByName('KCAD_PATRIMONIO').AsString := FKCAD_Patrimonio;
  TCDSSuppl.Open ( cdsPatrimonio );

  if not (cdsPatrimonio.State in [dsInsert, dsEdit] ) then
    cdsPatrimonio.Edit;

  cdsPatrimonio.Delete;
end;

{$IFNDEF _DSServer}
procedure TdtmCOMPRAS_Pedido.InsereFromNFe(ANFeInfo: TNFeInfo);
var
  LIndex : integer ;
begin

  cdsPedido.DisableControls ;
  cdsItensPedido.DisableControls ;
  cdsPatrimoniosPedido.DisableControls ;
  Try
    SetEntidade ( ANFeInfo.KFornecedor, ANFeInfo.NomeFornecedor ) ;

    cdsPedidoNOTA_FISCAL.asString    := ANFeInfo.NotaFiscal ;
    cdsPedidoSERIE.asString          := ANFeInfo.Serie ;
    cdsPedidoDATA_EMISSAO.asDateTime := ANFeInfo.Emissao ;
    cdsPedidoDATA_COMPRA.asDateTime  := ANFeInfo.Emissao ;
    cdsPedidoDATA_ENTRADA.asDateTime := ANFeInfo.Emissao ;
    cdsPedidoCHAVENFE.asString       := ANFeInfo.ChaveNFe ;

    cdsPedidoXML_NFE.LoadFromFile( ANFeInfo.XMLFileName ) ;

  //  if ANFeInfo.ValorSeguro > 0  then
  //    cdsPedidoSEGURO.asFloat       := ANFeInfo.ValorSeguro   ;

    cdsPedidoMODELO_NFE.asInteger := ANFeInfo.Modelo ;

    if ANFeInfo.Observacoes <> '' then
      cdsPedidoOBS.asString := ANFeInfo.Observacoes  ;

    if ANFeInfo.ValorFrete > 0  then
      cdsPedidoFRETE.asFloat       := ANFeInfo.ValorFrete     ;

    if ANFeInfo.ValorDESCONTO > 0  then
      cdsPedidoDESCONTOS.asFloat       := ANFeInfo.ValorDesconto ;

    cdsPedidoIMPORTADO_NFE.asString   := 'T' ;
    cdsPedidoSYSORIGIN_TYPE.asInteger := 1 ;

    FDisableCheckItems := True ;
    for LIndex := Low( ANFeInfo.Produtos ) to High( ANFeInfo.Produtos ) do
       begin
          insereItemFromNFe( ANFeInfo.KFornecedor, ANFeInfo.Produtos[ LIndex ] ) ;
       end;
    cdsItensPedido.First ;
    cdsPatrimoniosPedido.First ;

  if Length( ANFeInfo.Duplicatas ) > 0 then
    begin

      if cdsApagar.IsEmpty then
        cdsApagar.Append
      else
        cdsApagar.Edit ;

      for LIndex := Low( ANFeInfo.Duplicatas ) to High( ANFeInfo.Duplicatas ) do
         begin
           cdsParcelas.Append ;
           cdsParcelasDOCUMENTO.AsString := ANFeInfo.Duplicatas[ LIndex ].Documento  ;
           cdsParcelasVENCTO.asDateTime  := ANFeInfo.Duplicatas[ LIndex ].Data       ;
           cdsParcelasVALOR.asFloat      := ANFeInfo.Duplicatas[ LIndex ].Valor      ;
           if ( cdsParcelasCHEQUE.asBoolean ) or ( not cdsAPagarPAGTO_AVISTA.AsBoolean ) then
              cdsParcelasDT_COMPENSACAO.Clear;
           cdsParcelas.Post ;
         end;
      cdsApagar.Post ;
    end;

    FDisableCheckItems := False ;
  Finally
    cdsItensPedido.EnableControls ;
    cdsPatrimoniosPedido.EnableControls ;
    cdsPedido.EnableControls ;
  End;

end;
{$ENDIF}

procedure TdtmCOMPRAS_Pedido.OpenPedido(KPedido: String);
begin
   if cdsPedido.Active then
      cdsPedido.Close ;

   cdsPedido.MasterFields  := '' ;
   cdsPedido.MasterSource  := nil ;
   cdsPedido.PacketRecords := -1 ;
   cdsPedido.Params.ParamByName( 'KCMP_PEDIDO' ).asString := KPedido ;
   TCDSSuppl.Open ( cdsPedido ) ;
end;

procedure TdtmCOMPRAS_Pedido.cdsAPagarNewRecord(DataSet: TDataSet);
begin

  GetContaFavorita ;

  cdsAPagarKFIN_APAGAR.AsString   := cdsPedidoKFIN_APAGAR.AsString ;
  cdsAPagarKSYSDOMAIN.AsString    := LoggedUser.DomainID;
  cdsAPagarTABLENAME.asString     := 'CMP_PEDIDOS' ;
  cdsAPagarTABLEKEY.AsString      := cdsPedidoKCMP_PEDIDO.AsString ;
  cdsAPagarATIVO.asString         := 'T' ;
  cdsAPagarKCAD_ENTIDADE.AsString := cdsPedidoKCAD_ENTIDADE.AsString ;
  cdsAPagarNOMEENTIDADE.asString  := cdsPedidoNOMEENTIDADE.asString ;
  cdsAPagarDATALANCTO.AsDateTime  := cdsPedidoDATA_EMISSAO.AsDateTime ;
  cdsAPagarHISTORICO.asString     := Format( 'Nota fiscal de compra: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] ) ;
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

procedure TdtmCOMPRAS_Pedido.cdsAPagarNOMECONTASetText(Sender: TField; const Text: string);
begin
 // FKContaPadrao := '';
 // FNomeConta    := '';
 // cdsAPagarKFIN_CONTA_PREF.Clear;
  Sender.asString := Text ;
end;

procedure TdtmCOMPRAS_Pedido.cdsAPagarPAGTO_AVISTAChange(Sender: TField);
begin
 cdsAPagarPAGTO_AVISTA.OnChange := nil ;
 try
   //if Sender.asBoolean then
     PagamentoAVista;
 finally
     cdsAPagarPAGTO_AVISTA.OnChange := cdsAPagarPAGTO_AVISTAChange
 end;
end;

procedure TdtmCOMPRAS_Pedido.cdsAPagarTransporteNewRecord(DataSet: TDataSet);
begin
  cdsApagarTransporteKFIN_APAGAR.AsString   := cdsPedidoKFIN_APAGAR_TRANSPORTE.AsString ;
  cdsApagarTransporteKSYSDOMAIN.AsString  := LoggedUser.DomainID;
  cdsApagarTransporteTABLENAME.asString     := 'CMP_PEDIDOS' ;
  cdsApagarTransporteTABLEKEY.AsString      := cdsPedidoKCMP_PEDIDO.AsString ;
  cdsApagarTransporteATIVO.asString         := 'T' ;
//  cdsApagarTransporteKCAD_ENTIDADE.AsString := cdsPedidoKCAD_ENTIDADE.AsString ;
//  cdsApagarTransporteNOMEENTIDADE.asString  := cdsPedidoNOMEENTIDADE.asString ;
  cdsApagarTransporteDATALANCTO.AsDateTime  := cdsPedidoDATA_EMISSAO.AsDateTime ;
  cdsApagarTransporteHISTORICO.asString     := Format( 'Transporte - Nota fiscal de compra: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] ) ;
  cdsApagarTransporteDOCUMENTO.AsString     := cdsPedidoNOTA_FISCAL.AsString ;
  cdsApagarTransporteNUM_PARCELAS.AsInteger := 1 ;
  cdsApagarTransportePROXIMO_MES.AsString   := 'F' ;
  cdsApagarTransporteANUAL.AsString         := 'F' ;
  cdsApagarTransporteRECORRENCIA.AsString   := 'F' ;
  cdsApagarTransporteDIA_VENCTO.AsInteger   := 1 ;
  cdsApagarTransportePAGTO_AVISTA.asString := 'F' ;
  cdsAPagarTransporteKFIN_CONTA_PREF.AsString := FKContaPadrao;
  cdsAPagarTransporteNOMECONTA.AsString := FNomeConta;
end;

procedure TdtmCOMPRAS_Pedido.cdsAPagarTransporteNOMECONTASetText(Sender: TField;
  const Text: string);
begin
//  FKContaPadrao := '';
//  FNomeConta    := '';
//  cdsAPagarKFIN_CONTA_PREF.Clear;
  Sender.asString := Text ;
end;

procedure TdtmCOMPRAS_Pedido.cdsAPagarTransportePAGTO_AVISTAChange(
  Sender: TField);
begin
 cdsAPagarTransportePAGTO_AVISTA.OnChange := nil ;
 try
   //if Sender.asBoolean then
     PagamentoAVistaTransporte ;
 finally
     cdsAPagarTransportePAGTO_AVISTA.OnChange := cdsAPagarTransportePAGTO_AVISTAChange
 end;
end;

procedure TdtmCOMPRAS_Pedido.cdsApropriacaoPatrimonioBeforeEdit(
  DataSet: TDataSet);
begin
//
end;

procedure TdtmCOMPRAS_Pedido.cdsApropriacaoItemNewRecord(DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoItemKFIN_APROPRIACAO );
  cdsApropriacaoItemTABLENAME.AsString := 'CMP_PEDIDO_ITENS';
  cdsApropriacaoItemTABLEKEY.AsString  := cdsItensPedidoKCMP_PEDIDO_ITEM.AsString;
end;


procedure TdtmCOMPRAS_Pedido.cdsApropriacaoPatrimonioNewRecord(
  DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoPatrimonioKFIN_APROPRIACAO );
  cdsApropriacaoPatrimonioTABLENAME.AsString := 'CMP_PEDIDO_ITENS';
  cdsApropriacaoPatrimonioTABLEKEY.AsString  := cdsPatrimoniosPedidoKCMP_PEDIDO_ITEM.AsString;
end;

procedure TdtmCOMPRAS_Pedido.cdsApropriacaoServicoNewRecord(DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoServicoKFIN_APROPRIACAO );
  cdsApropriacaoServicoTABLENAME.AsString := 'CMP_PEDIDO_SERVICOS';
  cdsApropriacaoServicoTABLEKEY.AsString  := cdsServicosPedidoKCMP_PEDIDO_SERVICO.AsString;
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsParcelasKFIN_APAGAR_PARCELA ) ;
  cdsParcelasKFIN_APAGAR.asString := cdsApagarKFIN_APAGAR.asString ;
  cdsParcelasPREVISAO.asString  := 'T' ;
  cdsParcelasDUVIDOSO.asString  := 'F' ;
  cdsParcelasCHEQUE.asString    := 'F' ;
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
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

procedure TdtmCOMPRAS_Pedido.cdsParcelasNUM_CHEQUESetText(Sender: TField;
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

procedure TdtmCOMPRAS_Pedido.cdsParcelasTransporteBeforeDelete(
  DataSet: TDataSet);
begin
  if not cdsParcelasTransportePAGTO.IsNull then
    raise Warning.Create('Não pode excluir parcela já baixada');
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasTransporteBeforeEdit(DataSet: TDataSet);
begin
  if ( not cdsParcelasTransportePAGTO.IsNull ) and ( cdsAPagarTransportePAGTO_AVISTA.AsString <> 'T' ) then
    raise Warning.Create('Não pode editar parcela já baixada');
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasTransporteBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsApagarTransporte.IsEmpty ) and not ( cdsApagarTransporte.State in [dsInsert,dsEdit] )  then
     cdsApagarTransporte.Append ;
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasTransporteBeforePost(DataSet: TDataSet);
begin
  if (( cdsAPagarTransportePAGTO_AVISTA.AsBoolean ) and ( cdsParcelasTransporteCHEQUE.AsBoolean )) or
     (( not cdsParcelasTransporteCHEQUE.AsBoolean ) and ( cdsParcelasTransportePAGTO.IsNull))  then
     cdsParcelasTransporteDT_COMPENSACAO.Clear;
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasTransporteCalcFields(DataSet: TDataSet);
begin
//
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasTransporteCHEQUEChange(Sender: TField);
begin
  if cdsParcelasTransporteCHEQUE.asBoolean then
      cdsParcelasTransporteDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasTransporteDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasPAGTO.AsSQLTimeStamp ;
      cdsParcelasTransporteNUM_CHEQUE.Clear ;
    end ;
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasTransporteNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsParcelasTransporteKFIN_APAGAR_PARCELA ) ;
  cdsParcelasTransporteKFIN_APAGAR.asString := cdsAPagarTransporteKFIN_APAGAR.asString ;
  cdsParcelasTransportePREVISAO.asString  := 'T' ;
  cdsParcelasTransporteDUVIDOSO.asString  := 'F' ;
  cdsParcelasTransporteCHEQUE.AsString := 'F';
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasTransporteNOMECONTASetText(
  Sender: TField; const Text: string);
begin
  cdsParcelasTransporteKFIN_CONTA.Clear;
  Sender.asString := Text ;
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasTransporteNUM_CHEQUESetText(
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

procedure TdtmCOMPRAS_Pedido.cdsParcelasVENCTOChange(Sender: TField);
begin
  if FKContaPadrao <> EmptyStr then
    begin
      cdsParcelasKFIN_CONTA.AsString := FKContaPadrao;
      cdsParcelasNOMECONTA.AsString  := FNomeConta;
    end;
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasBeforeDelete(DataSet: TDataSet);
begin
  if not cdsParcelasPAGTO.IsNull then
    raise Warning.Create('Não pode excluir parcela já baixada');
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasBeforeEdit(DataSet: TDataSet);
begin
  if ( not cdsParcelasPAGTO.IsNull ) and ( cdsAPagarPAGTO_AVISTA.AsString <> 'T' ) then
    raise Warning.Create('Não pode editar parcela já baixada');
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasBeforeInsert(DataSet: TDataSet);
begin
  if ( cdsAPagar.IsEmpty ) and not ( cdsAPagar.State in [dsInsert,dsEdit] )  then
     cdsAPagar.Append ;
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasBeforePost(DataSet: TDataSet);
begin

  if (( cdsAPagarPAGTO_AVISTA.AsBoolean ) and ( cdsParcelasCHEQUE.AsBoolean )) or
     (( not cdsParcelasCHEQUE.AsBoolean ) and ( cdsParcelasPAGTO.IsNull))  then
     cdsParcelasDT_COMPENSACAO.Clear;

end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasCalcFields(DataSet: TDataSet);
begin
//
end;

procedure TdtmCOMPRAS_Pedido.cdsParcelasCHEQUEChange(Sender: TField);
begin
  if cdsParcelasCHEQUE.asBoolean then
      cdsParcelasDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasPAGTO.AsSQLTimeStamp ;
      cdsParcelasNUM_CHEQUE.Clear ;
    end ;
end;


procedure TdtmCOMPRAS_Pedido.ApplyUpdates;
begin

  if ( ValidApropriacao ) and ( not ValidaCampos ) then
    raise Warning.Create('Conta contábil obrigatória para os Ítens (Produto/Patrimônio)') ;


  if ( cdsAPagarPAGTO_AVISTA.AsBoolean ) then
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
      if (( cdsParcelasCHEQUE.AsBoolean ) or ( not cdsParcelasNUM_CHEQUE.IsNull )) and
         ( cdsParcelasPAGTO.IsNull ) then
         raise Warning.Create('Cheque só pode ser inserido para pagamentos à vista')
    end;

  inherited;
end;

procedure TdtmCOMPRAS_Pedido.CadastraPatrimonio( KPatrimonio : TPatrimonioInfo );
begin
  inserePatrimonio(
        KPatrimonio.KCAD_PATRIMONIO
      , KPatrimonio.KFin_Categoria
      , KPatrimonio.DescrCategoria
  );
end;

procedure TdtmCOMPRAS_Pedido.CalcularParcelas( ADiaDaParcela : integer ; ATotalParcelas : integer ; AProximoMes, AAnual : boolean ) ;
var
  i : Integer;
  Vencto_mes : TDateTime ;
  LValorParcela, LDiferenca  :Double;
//  totalParcelas : Double;
  LTotalPedido : double ;
begin
//  totalParcelas := 0;

  if ATotalParcelas = 0 then
    ATotalParcelas := 1 ;

  if cdsParcelas.State in [dsInsert,dsEdit] then
     cdsParcelas.Cancel ;

  //**frete
  LTotalPedido := RoundTo( cdsPedidoTOTAL_NOTA.AsFloat {- cdsPedidoFRETE.AsFloat}, -2 ) ;

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

  TCdsSuppl.PostIfNeed( cdsPedido );

  if not( cdsAPagar.State in [ dsInsert, dsEdit] ) then
    cdsAPagar.Edit;

  cdsAPagarHISTORICO.asString := Format( 'Nota fiscal de compra: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] ) ;
  cdsAPagarDOCUMENTO.AsString := cdsPedidoNOTA_FISCAL.AsString ;

  if ADiaDaParcela <> 0 then
     Vencto_mes :=  DateUtils.StartOfTheMonth( cdsPedidoDATA_EMISSAO.AsDateTime ) + ADiaDaParcela - 1
  else
     Vencto_mes := DateUtils.StartOfTheDay( cdsPedidoDATA_EMISSAO.AsDateTime ) ;

  if AProximoMes then
     Vencto_mes := IncMonth( Vencto_mes, 1 ) ;

  LValorParcela  := RoundTo( LTotalPedido / ATotalParcelas, -2 );

  if not ( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
    cdsParcelas.Edit;

  for i := 0 to ATotalParcelas - 1 do
    begin
      cdsParcelas.Append;

      if Vencto_mes  < cdsPedidoDATA_EMISSAO.AsDateTime then
        cdsParcelasVENCTO.AsDateTime := cdsPedidoDATA_EMISSAO.AsDateTime
      else
        cdsParcelasVENCTO.AsDateTime := Vencto_mes ;

      cdsParcelasVALOR.AsFloat       := LValorParcela;

      if not ( cdsParcelasKFIN_CONTA.IsNull) or ( cdsParcelasKFIN_CONTA.AsString <> EmptyStr ) then
        begin
          cdsParcelasKFIN_CONTA.AsString := cdsParcelasKFIN_CONTA.AsString;
          cdsParcelasNOMECONTA.AsString  := cdsParcelasNOMECONTA.AsString;
        end;

      cdsParcelasPAGTO.Clear;
      if ( cdsParcelasCHEQUE.asBoolean ) or ( not cdsAPagarPAGTO_AVISTA.AsBoolean ) then
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

procedure TdtmCOMPRAS_Pedido.CalcularParcelasTransporte(ADiaDaParcela,
  ATotalParcelas: integer; AProximoMes, AAnual: boolean);
var
  i : Integer;
  Vencto_mes : TDateTime ;
  Parcela, FDiferenca  :Double;
  totalParcelasTransporte : Double;
begin
  if ATotalParcelas = 0 then
    ATotalParcelas := 1 ;

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

  TCdsSuppl.PostIfNeed( cdsPedido );

  if not( cdsAPagarTransporte.State in [ dsInsert, dsEdit] ) then
    cdsAPagarTransporte.Edit;

  cdsAPagarTransporteHISTORICO.asString := Format( 'Transporte - Nota fiscal de compra: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] ) ;
  cdsAPagarTransporteDOCUMENTO.AsString := cdsPedidoNOTA_FISCAL.AsString ;

  if ADiaDaParcela <> 0 then
     Vencto_mes :=  DateUtils.StartOfTheMonth( cdsPedidoDATA_EMISSAO.AsDateTime ) + ADiaDaParcela - 1
  else
     Vencto_mes :=  DateUtils.StartOfTheDay( cdsPedidoDATA_EMISSAO.AsDateTime ) ;

  if AProximoMes then
     Vencto_mes := IncMonth( Vencto_mes, 1 ) ;


  Parcela  := RoundTo( cdsPedidoFRETE.AsFloat / ATotalParcelas, -2 );

  if not ( cdsParcelasTransporte.State in [ dsInsert, dsEdit ] ) then
    cdsParcelasTransporte.Edit;

  for i := 0 to ATotalParcelas - 1 do
    begin
      cdsParcelasTransporte.Append;

      if Vencto_mes  < cdsPedidoDATA_EMISSAO.AsDateTime then
        cdsParcelasTransporteVENCTO.AsDateTime := cdsPedidoDATA_EMISSAO.AsDateTime
      else
        cdsParcelasTransporteVENCTO.AsDateTime := Vencto_mes ;

      cdsParcelasTransporteVALOR.AsFloat       := Parcela;

      if not ( cdsAPagarTransporteKFIN_CONTA_PREF.IsNull) or ( cdsAPagarTransporteKFIN_CONTA_PREF.AsString <> EmptyStr ) then
        begin
          cdsParcelasTransporteKFIN_CONTA.AsString := cdsAPagarTransporteKFIN_CONTA_PREF.AsString;
          cdsParcelasTransporteNOMECONTA.AsString  := cdsAPagarTransporteNOMECONTA.AsString;
        end;

      cdsParcelasTransportePAGTO.Clear;
      if ( cdsParcelasTransporteCHEQUE.asBoolean ) or ( not cdsAPagarTransportePAGTO_AVISTA.AsBoolean ) then
        cdsParcelasTransporteDT_COMPENSACAO.Clear;

      if AAnual then
        Vencto_mes := IncMonth( Vencto_mes, 12 )
      else
        Vencto_mes := IncMonth( Vencto_mes, 1 ) ;

      totalParcelasTransporte := totalParcelasTransporte + cdsParcelasTransporteVALOR.AsFloat;
      cdsParcelasTransporte.Post;
    end;

  //totalParcelasTransporte := totalParcelasTransporte + cdsParcelasTransporteVALOR.AsFloat;
  //cdsParcelasTransporte.Post;

  if TryVarToFloat ( cdsParcelasTransporteSomaValor.Value ) <> cdsPedidoFRETE.AsFloat then
    begin
      FDiferenca := cdsPedidoFRETE.AsFloat - TryVarToFloat ( cdsParcelasTransporteSomaValor.Value ) ;
      cdsParcelasTransporte.First;
      cdsParcelasTransporte.Edit;
      cdsParcelasTransporteVALOR.AsFloat := cdsParcelasTransporteVALOR.AsFloat + FDiferenca;
      cdsParcelasTransporte.Post;
    end;

  cdsParcelasTransporte.First;
  cdsParcelasTransporte.EnableControls;
end;




procedure TdtmCOMPRAS_Pedido.CalculaTotais;
begin
  // Para recalcular o total da nota, o cdsPedido tem de entrar em modo de edicao
  if not ( cdsPedido.State in [ dsInsert, dsEdit ] ) then
    cdsPedido.Edit ;
end;

procedure TdtmCOMPRAS_Pedido.CalculaTotaisPedido;
var
   TotalValorIPI: Double;
   TotalValorIPIPatrimonio : double ;
begin


  cdsPedido.onCalcFields := nil ;
  SetRoundMode(rmNearest);
  try
  // try
    if ( cdsItensPedido.state in [ dsInsert,dsEdit ] ) then
      begin
      // ValorLinhaItensParceial ...
        cdsPedidoTOTAL_ITENS.asFloat    :=  RoundTo ( RoundTo(TryVarToFloat (cdsItensPedidoSomaTotal.Value),-2)  {TryVarToFloat ( cdsItensPedidoSomaTotal.Value )}
                                                      - ValorLinhaItensTotal
                                                      + RoundTo( cdsItensPedidoTOTAL.AsCurrency, -2), -4 );

        TotalValorIPI                   :=  RoundTo ( TryVarToFloat ( cdsItensPedidoSomaValorIPI.Value )
                                                      - ValorLinhaItensTotalIPI
                                                      + cdsItensPedidoVALOR_IPI.asFloat, -4 );
      end
    else if cdsItensPedido.IsEmpty then
      begin
        cdsPedidoTOTAL_ITENS.AsFloat := 0;
        TotalValorIPI                := 0;
      end
    else
      begin
        cdsPedidoTOTAL_ITENS.asFloat    := RoundTo ( TryVarToFloat ( cdsItensPedidoSomaTotal.Value ), -2 ) ;  {-4}
        TotalValorIPI                   := RoundTo ( TryVarToFloat ( cdsItensPedidoSomaValorIPI.Value ), -4 )
      end ;

    if ( cdsPatrimoniosPedido.state in [ dsInsert,dsEdit ] ) then
      begin
      // ValorLinhaPatrimoniosParceial ...
        cdsPedidoTOTAL_PATRIMONIOS.asFloat    :=  RoundTo ( RoundTo(TryVarToFloat (cdsPatrimoniosPedidoSomaTotal.Value),-2)  {TryVarToFloat ( cdsPatrimoniosPedidoSomaTotal.Value )}
                                                      - ValorLinhaPatrimoniosTotal
                                                      + RoundTo( cdsPatrimoniosPedidoTOTAL.AsCurrency, -2), -4 );

        TotalValorIPIPatrimonio                   :=  RoundTo ( TryVarToFloat ( cdsPatrimoniosPedidoSomaValorIPI.Value )
                                                      - ValorLinhaPatrimoniosTotalIPI
                                                      + cdsPatrimoniosPedidoVALOR_IPI.asFloat, -4 );
      end
    else if cdsPatrimoniosPedido.IsEmpty then
      begin
        cdsPedidoTOTAL_PATRIMONIOS.AsFloat := 0;
        TotalValorIPIPatrimonio                := 0;
      end
    else
      begin
        cdsPedidoTOTAL_PATRIMONIOS.asFloat    := RoundTo ( TryVarToFloat ( cdsPatrimoniosPedidoSomaTotal.Value ), -2 ) ;  {-4}
        TotalValorIPIPatrimonio                   := RoundTo ( TryVarToFloat ( cdsPatrimoniosPedidoSomaValorIPI.Value ), -4 )
      end;


    if ( cdsServicosPedido.state in [ dsInsert,dsEdit ] ) then
      cdsPedidoTOTAL_SERVICOS.asFloat :=   RoundTo ( TryVarToFloat ( cdsServicosPedidoSomaTotal.Value )
                                                     - ValorLinhaServicos
                                                     + cdsServicosPedidoTOTAL.asFloat, -4 )
    else if cdsServicosPedido.IsEmpty then
        cdsPedidoTOTAL_SERVICOS.AsFloat := 0
    else
        cdsPedidoTOTAL_SERVICOS.asFloat := RoundTo ( TryVarToFloat ( cdsServicosPedidoSomaTotal.Value ), -4 ) ;

    cdsPedidoTOTAL_NOTA.asFloat       := RoundTo( (   cdsPedidoTOTAL_ITENS.AsCurrency
                                                    + cdsPedidoTOTAL_PATRIMONIOS.asFloat
                                                    + cdsPedidoTOTAL_SERVICOS.asFloat
                                                    //+ cdsPedidoIMPOSTOS.AsFloat
                                                    //+ cdsPedidoFRETE.AsFloat )
                                                    //- cdsPedidoDESCONTOS.AsFloat
                                                    + TotalValorIPI
                                                    + TotalValorIPIPatrimonio
                                                    ), -2 ) ;
//   except On E : Exception do
//      RaiseException( E, UnitName, ClassName, 'CalculaTotaisPedido' )
//
//   end;
  finally
     cdsPedido.onCalcFields           := cdsPedidoCalcFields ;
  end ;
end;

procedure TdtmCOMPRAS_Pedido.CancelUpdates;
begin
  if cdsProdutosFornecedor.Active then
   begin
    cdsProdutosFornecedor.IsEmpty ;
    cdsProdutosFornecedor.Close ;
   end;
  inherited;

end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoAfterInsert(DataSet: TDataSet);
begin
  FCDSPedidosRequiredField.Required ( False ) ;
  cdsPedido.Post ;
  cdsAPagar.Append ;
  cdsAPagar.Post ;
  cdsPedido.Edit ;
  cdsAPagar.Edit ;
  FCDSPedidosRequiredField.Required ( True ) ;
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin

  if not ( cdsPedido.IsEmpty ) and ( cdsPedidoTOTAL_NOTA.asFloat < 0.01 )then
    Raise Warning.Create( _ERRMSG_TOTAL_ZERO );

//  if cdsPedidoTOTALPEDIDO.asFloat <> TryVarToFloat( cdsParcelasSomaValor.Value, -2 ) then
//     Raise Error.Create( _ERRMSG_TOTAL_APGAGAR );
end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoBeforeDelete(DataSet: TDataSet);
begin

  if cdsPedidoSYSORIGIN_TYPE.asInteger = 2 then
    raise Warning.Create( 'Pedido incluido via sincronismo.' + #10#13 + 'Não pode ser excluído.' );

  CheckMesEncerrado ;

  if ParcelaBaixada then
    raise Warning.Create( 'Existe(m) parcela(s) já baixada(s) para este pedido.' + #10#13 + 'Não pode ser excluído.' );

  if cdsAPagar.RecordCount > 0 then
    cdsAPagar.Delete;

end;

procedure TdtmCOMPRAS_Pedido.cdsPedidoBeforeEdit(DataSet: TDataSet);
begin

  CheckMesEncerrado ;

//  if ParcelaBaixada then
//    raise Warning.Create( 'Existe(m) parcela(s) já baixada(s).' + #10#13 + 'Compra não pode ser alterada.' );

  DataEmissao := cdsPedidoDATA_EMISSAO.AsDateTime;

  if not cdsAPagarKFIN_CONTA_PREF.IsNull then
    begin
      FKContaPadrao := cdsAPagarKFIN_CONTA_PREF.AsString;
      FNomeConta    := cdsAPagarNOMECONTA.AsString;
    end;
end;

{ TRateio }


procedure TRateio.DoEvent( AEvent : TRateioEventType );
begin
  if Assigned ( FOnEvent ) then
     FOnEvent ( AEvent, FPercent, FType ) ;
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


function TRateio.CalcValorRateado(APercent: double ; AType : integer ): double;
begin
  FPercent := APercent ;
  FType    := AType ;
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

