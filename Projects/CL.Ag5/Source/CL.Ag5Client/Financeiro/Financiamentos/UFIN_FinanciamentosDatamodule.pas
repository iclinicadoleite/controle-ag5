unit UFIN_FinanciamentosDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  FIN_APagarTypes, GuidSuppl, Math,
  Dialogs, Tc.Data.SQLExpr ;

type

  TNotifyCheckDate = function ( Date : TDateTime ) : boolean of object ;

  TFIN_FinanciamentosDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstFinanciamento: TClientDataSet;
    cdsFinanciamento: TClientDataSet;
    dtsList: TDataSource;
    cdsParcelas: TClientDataSet;
    dspLstFinanciamento: TDataSetProvider;
    dspFinanciamento: TDataSetProvider;
    sqlLstFinanciamento: TTcSQLDataSet;
    sqlFinanciamento: TTcSQLDataSet;
    sqlParcelas: TTcSQLDataSet;
    dtsSQLEdit: TDataSource;
    cdsApropriacaoFinanciamento: TClientDataSet;
    cdsApropriacaoFinanciamentoKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoFinanciamentoKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoFinanciamentoNOME: TStringField;
    cdsApropriacaoFinanciamentoCODIGO: TIntegerField;
    cdsApropriacaoFinanciamentoCLASSIFICACAO: TStringField;
    cdsApropriacaoFinanciamentoPORCENTAGEM: TFloatField;
    cdsApropriacaoFinanciamentoTOTAL_PORCENTAGEM: TAggregateField;
    sqlApropriacaoFinanciamento: TTcSQLDataSet;
    sqlApropriacaoFinanciamentoKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoFinanciamentoKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoFinanciamentoPORCENTAGEM: TFloatField;
    sqlApropriacaoFinanciamentoNOME: TStringField;
    sqlApropriacaoFinanciamentoCODIGO: TIntegerField;
    sqlApropriacaoFinanciamentoCLASSIFICACAO: TStringField;
    cdsParcelasTOTAL: TAggregateField;
    sqlApropriacaoFinanciamentoTABLENAME: TStringField;
    sqlApropriacaoFinanciamentoTABLEKEY: TStringField;
    cdsApropriacaoFinanciamentoTABLENAME: TStringField;
    cdsApropriacaoFinanciamentoTABLEKEY: TStringField;
    sqlLstFinanciamentoKFIN_FINANCIAMENTO_GERAL: TStringField;
    sqlLstFinanciamentoDOCUMENTO: TStringField;
    sqlLstFinanciamentoHISTORICO: TStringField;
    sqlLstFinanciamentoAPELIDO: TStringField;
    sqlLstFinanciamentoDATALANCTO: TSQLTimeStampField;
    sqlLstFinanciamentoVALOR: TFloatField;
    sqlLstFinanciamentoATIVO: TStringField;
    sqlLstFinanciamentoVALOR_PAGO: TFloatField;
    sqlLstFinanciamentoOBS: TMemoField;
    sqlLstFinanciamentoSYSUI: TStringField;
    sqlLstFinanciamentoSYSDI: TSQLTimeStampField;
    sqlLstFinanciamentoSYSUU: TStringField;
    sqlLstFinanciamentoSYSDU: TSQLTimeStampField;
    cdsLstFinanciamentoKFIN_FINANCIAMENTO_GERAL: TStringField;
    cdsLstFinanciamentoDOCUMENTO: TStringField;
    cdsLstFinanciamentoHISTORICO: TStringField;
    cdsLstFinanciamentoAPELIDO: TStringField;
    cdsLstFinanciamentoDATALANCTO: TSQLTimeStampField;
    cdsLstFinanciamentoVALOR: TFloatField;
    cdsLstFinanciamentoATIVO: TStringField;
    cdsLstFinanciamentoVALOR_PAGO: TFloatField;
    cdsLstFinanciamentoOBS: TMemoField;
    cdsLstFinanciamentoSYSUI: TStringField;
    cdsLstFinanciamentoSYSDI: TSQLTimeStampField;
    cdsLstFinanciamentoSYSUU: TStringField;
    cdsLstFinanciamentoSYSDU: TSQLTimeStampField;
    sqlFinanciamentoKFIN_FINANCIAMENTO_GERAL: TStringField;
    sqlFinanciamentoKSYSDOMAIN: TStringField;
    sqlFinanciamentoKCAD_ENTIDADE: TStringField;
    sqlFinanciamentoNOMEENTIDADE: TStringField;
    sqlFinanciamentoHISTORICO: TStringField;
    sqlFinanciamentoAPELIDO: TStringField;
    sqlFinanciamentoDOCUMENTO: TStringField;
    sqlFinanciamentoDATALANCTO: TSQLTimeStampField;
    sqlFinanciamentoVALOR: TFloatField;
    sqlFinanciamentoNUM_PARCELAS: TIntegerField;
    sqlFinanciamentoKFIN_APAGAR_JUROS: TStringField;
    sqlFinanciamentoKFIN_APAGAR_DESPESAS: TStringField;
    sqlFinanciamentoOBS: TMemoField;
    sqlFinanciamentoATIVO: TStringField;
    sqlFinanciamentoIMPORTADO: TStringField;
    sqlFinanciamentoSYSORIGIN_TYPE: TIntegerField;
    cdsFinanciamentoKFIN_FINANCIAMENTO_GERAL: TStringField;
    cdsFinanciamentoKSYSDOMAIN: TStringField;
    cdsFinanciamentoKCAD_ENTIDADE: TStringField;
    cdsFinanciamentoNOMEENTIDADE: TStringField;
    cdsFinanciamentoHISTORICO: TStringField;
    cdsFinanciamentoAPELIDO: TStringField;
    cdsFinanciamentoDOCUMENTO: TStringField;
    cdsFinanciamentoDATALANCTO: TSQLTimeStampField;
    cdsFinanciamentoVALOR: TFloatField;
    cdsFinanciamentoNUM_PARCELAS: TIntegerField;
    cdsFinanciamentoKFIN_APAGAR_JUROS: TStringField;
    cdsFinanciamentoKFIN_APAGAR_DESPESAS: TStringField;
    cdsFinanciamentoOBS: TMemoField;
    cdsFinanciamentoATIVO: TStringField;
    cdsFinanciamentoIMPORTADO: TStringField;
    cdsFinanciamentoSYSORIGIN_TYPE: TIntegerField;
    cdsFinanciamentosqlParcelas: TDataSetField;
    sqlLstFinanciamentoKSYSDOMAIN: TStringField;
    cdsLstFinanciamentoKSYSDOMAIN: TStringField;
    sqlFinanciamentoKFIN_CONTA_PREF: TStringField;
    sqlFinanciamentoKFIN_PLANOCONTA: TStringField;
    cdsFinanciamentoKFIN_CONTA_PREF: TStringField;
    cdsFinanciamentoKFIN_PLANOCONTA: TStringField;
    sqlFinanciamentoNOMECONTA: TStringField;
    cdsFinanciamentoNOMECONTA: TStringField;
    sqlFinanciamentoDESCR_PC_NOME: TStringField;
    sqlFinanciamentoDESCR_PC_CLASSIFICACAO: TStringField;
    sqlFinanciamentoDESCR_PC_CODIGO: TIntegerField;
    sqlFinanciamentoDESCR_PC_TIPO_APRD: TStringField;
    cdsFinanciamentoDESCR_PC_NOME: TStringField;
    cdsFinanciamentoDESCR_PC_CLASSIFICACAO: TStringField;
    cdsFinanciamentoDESCR_PC_CODIGO: TIntegerField;
    cdsFinanciamentoDESCR_PC_TIPO_APRD: TStringField;
    sqlParcelasKFIN_FINANCIAMENTO_PARCELA: TStringField;
    sqlParcelasKFIN_FINANCIAMENTO_GERAL: TStringField;
    sqlParcelasDOCUMENTO: TStringField;
    sqlParcelasVENCTO: TSQLTimeStampField;
    sqlParcelasVALOR: TFloatField;
    sqlParcelasPAGTO: TSQLTimeStampField;
    sqlParcelasPAGO: TFloatField;
    sqlParcelasKFIN_CONTA: TStringField;
    sqlParcelasNOMECONTA: TStringField;
    sqlParcelasPREVISAO: TStringField;
    sqlParcelasDUVIDOSO: TStringField;
    sqlParcelasOBS: TMemoField;
    sqlParcelasCHEQUE: TStringField;
    sqlParcelasDT_COMPENSACAO: TSQLTimeStampField;
    sqlParcelasNUM_CHEQUE: TStringField;
    cdsParcelasKFIN_FINANCIAMENTO_PARCELA: TStringField;
    cdsParcelasKFIN_FINANCIAMENTO_GERAL: TStringField;
    cdsParcelasDOCUMENTO: TStringField;
    cdsParcelasVENCTO: TSQLTimeStampField;
    cdsParcelasVALOR: TFloatField;
    cdsParcelasPAGTO: TSQLTimeStampField;
    cdsParcelasPAGO: TFloatField;
    cdsParcelasKFIN_CONTA: TStringField;
    cdsParcelasNOMECONTA: TStringField;
    cdsParcelasPREVISAO: TStringField;
    cdsParcelasDUVIDOSO: TStringField;
    cdsParcelasOBS: TMemoField;
    cdsParcelasCHEQUE: TStringField;
    cdsParcelasDT_COMPENSACAO: TSQLTimeStampField;
    cdsParcelasNUM_CHEQUE: TStringField;
    sqlFinanciamentoDIA_VENCTO: TIntegerField;
    cdsFinanciamentoDIA_VENCTO: TIntegerField;
    sqlParcelasJUROS: TFloatField;
    sqlParcelasAMORTIZACAO: TFloatField;
    cdsParcelasJUROS: TFloatField;
    cdsParcelasAMORTIZACAO: TFloatField;
    sqlFinanciamentoVALOR_PARCELAS: TFloatField;
    cdsFinanciamentoVALOR_PARCELAS: TFloatField;
    sqlFinanciamentoPROVISAO: TStringField;
    cdsFinanciamentoPROVISAO: TStringField;
    sqlFinanciamentoPROXIMO_MES: TStringField;
    cdsFinanciamentoPROXIMO_MES: TStringField;
    sqlFinanciamentoKFIN_ARECEBER_FINANCIAMENTO: TStringField;
    sqlFinanciamentoKFIN_APAGAR_AMORTIZACAO: TStringField;
    cdsFinanciamentoKFIN_ARECEBER_FINANCIAMENTO: TStringField;
    cdsFinanciamentoKFIN_APAGAR_AMORTIZACAO: TStringField;
    cdsFinanciamentosqlApropriacaoFinanciamento: TDataSetField;
    sqlParcelasKFIN_APAGAR_PARCELA: TStringField;
    cdsParcelasKFIN_APAGAR_PARCELA: TStringField;
    cdsParcelasTOTAL_AMORTIZACAO: TAggregateField;
    cdsParcelasTOTAL_JUROS: TAggregateField;
    cdsParcelasTOTAL_PAGO: TAggregateField;
    sqlFinanciamentoANUAL: TStringField;
    cdsFinanciamentoANUAL: TStringField;
    procedure cdsLstFinanciamentoNewRecord(DataSet: TDataSet);
    procedure cdsFinanciamentoNewRecord(DataSet: TDataSet);
    procedure cdsParcelasNewRecord(DataSet: TDataSet);
    procedure cdsLstFinanciamentoBeforeOpen(DataSet: TDataSet);
    procedure cdsFinanciamentoBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsParcelasVENCTOValidate(Sender: TField);
    procedure cdsFinanciamentoAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsFinanciamentoBeforeInsert(DataSet: TDataSet);
    procedure cdsParcelasBeforeInsert(DataSet: TDataSet);
    procedure cdsLstAPagarVENCTOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsLstAPagarDUVIDOSOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsLstAPagarPREVISAOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsParcelasPREVISAOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsParcelasDUVIDOSOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure _DataModuleCreate(Sender: TObject);
    procedure cdsFinanciamentoBeforePost(DataSet: TDataSet);
    procedure cdsParcelasVALORValidate(Sender: TField);
    procedure cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsFinanciamentoNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsFinanciamentoNOMEENTIDADESetText(Sender: TField; const Text: string);
    procedure cdsFinanciamentoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
    procedure cdsFinanciamentoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsFinanciamentoBeforeDelete(DataSet: TDataSet);
    procedure cdsLstFinanciamentoPROVISAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsApropriacaoFinanciamentoNewRecord(DataSet: TDataSet);
    procedure cdsFinanciamentoDOCUMENTOValidate(Sender: TField);
    procedure cdsFinanciamentoKCAD_ENTIDADEValidate(Sender: TField);
    procedure cdsParcelasCHEQUEChange(Sender: TField);
    procedure cdsFinanciamentoPAGTO_AVISTAChange(Sender: TField);
    procedure cdsParcelasBeforePost(DataSet: TDataSet);
    procedure dspFinanciamentoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspFinanciamentoAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure cdsFinanciamentoKFIN_PLANOCONTAValidate(Sender: TField);
    procedure cdsParcelasJUROSChange(Sender: TField);
    procedure cdsFinanciamentoBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
    FKFinCentroCustoPadrao: String;
    FCondigoCentroCustoPadrao: String;
    FNomeCentroCustoPadrao: String;
    FOnChangePeriodo : TNotifyEvent ;
    FOnCheckDate     : TNotifyCheckDate ;
    FHiddingByFilter : boolean ;
    FOnHiddingByFilter : TNotifyEvent ;
    FShowDuvidoso  : Boolean;
    FShowPago      : Boolean;
    FShowEmAtraso  : Boolean;
    FShowProvisao  : Boolean;
    FInicioPeriodo : TDateTime ;
    FFimPeriodo    : TDateTime ;
    //FKFIN_APAGAR: string;
    FKFIN_FINANCIAMENTO_GERAL : String;
    FContaContabilJuros: String;
    FContaContabilJurosCodigo: String;
    FContaContabilJurosClassificacao: String;
    FNomeContaContabilJuros: String;
    FKContaFavorita    : string;
    FNomeContaFavorita : string;
    FIsDelete : Boolean;
    procedure DoChangePeriodo ;
    procedure InitPeriodo ;
    procedure SetParams ;
    function GetStringPeriodo: String;
    procedure SetShowDuvidoso(const Value: Boolean);
    procedure SetShowPago(const Value: Boolean);
    procedure SetShowEmAtraso(const Value: Boolean);
//    function ValidaCampos : Boolean;
    procedure SetShowProvisao(const Value: Boolean);
    function ParcelaBaixada : Boolean ;
    procedure SetContaContabilJuros;
    procedure InsertReceitaRealizada( KFIN_ARECEBER, KSYS_DOMAIN, KCAD_ENTIDADE, NOMEENTIDADE, HISTORICO,
                                      DOCUMENTO, DATALANCTO, VALOR, PROVISAO, RECORRENCIA, NUM_PARCELAS, DIA_VENCTO,
                                      PROXIMO_MES, KFIN_CONTA_PREF, KFIN_PLANOCONTA, OBS, ATIVO, TABLENAME,
                                      TABLEKEY, PAGTO_AVISTA, SYS_ORIGIN_TYPE: String );
    procedure InsertContaAPagar ( KFIN_APAGAR, KSYS_DOMAIN, KCAD_ENTIDADE, NOMEENTIDADE,
                                  HISTORICO, DOCUMENTO, DATALANCTO, VALOR, PROVISAO, RECORRENCIA, NUM_PARCELAS,
                                  DIA_VENCTO, PROXIMO_MES, ANUAL, KFIN_CONTA_PREF, KFIN_PLANOCONTA, OBS, ATIVO,
                                  TABLENAME, TABLEKEY, PAGTO_AVISTA, SYS_ORIGIN_TYPE : String );
    procedure InsertContaAPagarParcela (KFIN_APAGAR_PARCELA, KFIN_APAGAR, DOCUMENTO, VENCTO, VALOR, OBS,
                                        DUVIDOSO, PREVISAO, PAGTO, PAGO,  KFIN_CONTA: String);
    procedure SetPlanoContasDefault ;
    procedure ValidDocumento ;
    procedure SetContaFavorita;
    procedure SetCentroCustoPadrao;
    procedure SetKFIN_FINANCIAMENTO_GERAL(const Value: string);
    function GetNewOrOldValue( var DeltaDs: TCustomClientDataSet; FieldName: String ): Variant;
    function CheckRecebimento : Boolean;
  public
    { Public declarations }
    procedure SetEntidade ( Key : String ;NomeEntidade : string  ) ;
    procedure SetConta( Key, NomeConta : string; IsPreferencial : Boolean ) ;
    procedure OpenTables ; override ;
    procedure IncrementaAno ;
    procedure DecrementaAno ;
    procedure IncrementaMes ;
    procedure DecrementaMes ;
    procedure RefreshPeriodo ;
    procedure RefreshBaixa ( var BaixaTitulo : TBaixaTitulo  ) ;
    property StringPeriodo : String read GetStringPeriodo ;
    property OnChangePeriodo : TNotifyEvent read FOnChangePeriodo write FOnChangePeriodo ;
    property OnCheckDate : TNotifyCheckDate read FOnCheckDate write FOnCheckDate ;
    property OnHiddingByFilter : TNotifyEvent read FOnHiddingByFilter write FOnHiddingByFilter ;
    property ShowDuvidoso : Boolean  read FShowDuvidoso write SetShowDuvidoso;
    property ShowPago : Boolean   read FShowPago write SetShowPago;
    property ShowEmAtraso : Boolean read FShowEmAtraso write SetShowEmAtraso ;
    property ShowProvisao : Boolean read FShowProvisao write SetShowProvisao ;
    procedure SetFilter ( ShowProvisao : Boolean; DataInicial, DataFinal : TDateTime );
    procedure ApplyUpdates ; override ;
    constructor Create ( AOwner : TComponent ) ;override ;
    property  KFIN_FINANCIAMENTO_GERAL : string  read FKFIN_FINANCIAMENTO_GERAL write SetKFIN_FINANCIAMENTO_GERAL;
    procedure PagamentoAVista;
    function RoundTo(const AValue: Currency; const ADigit: TRoundToRange): Currency;
  end;

implementation

uses   Tc.DBRTL.AbstractDB
     , UDBFinanceiro
     , DateUtils
     , Data.SQLTimSt
     , CL.Ag5.Exceptions
     , CLAg5SvcFinanceiroApropriacao
     , DataSnap.DSConnect
     , UFIN_PlanoContasReceitasDespesasClass
     
     ;
   
{$R *.dfm}

{ TrdmFIN_OutrasDespesasDatamodule }

resourcestring
    _ERRMSG_DOCUMENTO_JA_CADASTRADO = 'Documento fiscal já cadastrado' ;


{$IFDEF _DSServer}
{$ELSE}

function TFIN_FinanciamentosDatamodule.CheckRecebimento: Boolean;
const
  _SQL_FINANCIAMENTO_RECEBIDO =
                   'SELECT F.KFIN_ARECEBER_FINANCIAMENTO,'
            +#13#10'       R.HISTORICO,'
            +#13#10'       P.VALOR,'
            +#13#10'       P.PAGTO'
            +#13#10'  FROM FIN_FINANCIAMENTOS_GERAL F'
            +#13#10'  INNER JOIN FIN_ARECEBER R ON F.KFIN_ARECEBER_FINANCIAMENTO = R.KFIN_ARECEBER'
            +#13#10'  INNER JOIN FIN_ARECEBER_PARCELAS P ON P.KFIN_ARECEBER = R.KFIN_ARECEBER'
            +#13#10' WHERE P.PAGTO IS NOT NULL'
            +#13#10'   AND F.KFIN_FINANCIAMENTO_GERAL = :KFIN_FINANCIAMENTO_GERAL';
var
  cds: TClientDataSet;
  p: TParams;

begin
  Result := False;
  p := TParams.Create(nil);
  p.CreateParam(ftString,  'KFIN_FINANCIAMENTO_GERAL'     , ptInput).AsString := cdsFinanciamentoKFIN_FINANCIAMENTO_GERAL.AsString;
  cds:= nil;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet(cds, _SQL_FINANCIAMENTO_RECEBIDO, p);

  Result := not cds.IsEmpty;

  cds.Free;
  p.Free;
end;

constructor TFIN_FinanciamentosDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
  SetContaFavorita;
  SetContaContabilJuros;
  SetCentroCustoPadrao
end;
{$ENDIF}


{ TFIN_OutrasDespesasDatamodule }


procedure TFIN_FinanciamentosDatamodule.OpenTables;
begin
  inherited;
  if not cdsLstFinanciamento.IsEmpty then
     cdsFinanciamento.RefreshRecord ;
end;

procedure TFIN_FinanciamentosDatamodule.PagamentoAVista;
begin
  if cdsParcelas.State in [dsInsert,dsEdit] then
     cdsParcelas.Cancel ;

  //cdsParcelas.BeforeDelete := nil ;
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
  //cdsParcelas.BeforeDelete := cdsParcelasBeforeDelete ;

 // if not cdsAPagarPAGTO_AVISTA.asBoolean then
  //  exit ;

  //TCdsSuppl.PostIfNeed( cdsPedido );


  if not( cdsFinanciamento.State in [ dsInsert, dsEdit] ) then
    cdsFinanciamento.Edit;


  //cdsAPagarHISTORICO.asString := Format( 'Lançamento de compra: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] ) ;

  cdsParcelas.Append;
  cdsParcelasDOCUMENTO.AsString := cdsFinanciamentoDOCUMENTO.AsString;
  cdsParcelasVENCTO.AsDateTime  := Trunc ( cdsFinanciamentoDATALANCTO.AsDateTime ) ;
  cdsParcelasVALOR.AsFloat      := cdsFinanciamentoVALOR.AsFloat ;
  //cdsParcelasTOTAL.AsVariant   := cdsAPagarVALOR.AsVariant;
  cdsParcelasPAGTO.AsDateTime   := Trunc ( cdsFinanciamentoDATALANCTO.AsDateTime ) ;
  cdsParcelasPAGO.AsFloat       := cdsFinanciamentoVALOR.AsFloat ;
  cdsParcelasCHEQUE.asString    := 'F' ;
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
    end
  else
    begin
       cdsParcelasKFIN_CONTA.AsString := cdsFinanciamentoKFIN_CONTA_PREF.AsString;
       cdsParcelasNOMECONTA.AsString  := cdsFinanciamentoNOMECONTA.AsString;
    end;

  cdsParcelas.Post;
end;

function TFIN_FinanciamentosDatamodule.ParcelaBaixada: Boolean;
const
 _SQL_PARCELAS = 'SELECT COUNT(1) PARCELA ' +
                 'FROM FIN_FINANCIAMENTOS_PARCELAS P  ' +
                 'WHERE P.PAGTO IS NOT NULL ' +
                 '  AND P.KFIN_FINANCIAMENTO_GERAL = :KFIN_FINANCIAMENTO_GERAL' ;

var
  cds : TClientDataSet ;
  p : TParams ;
begin
    Result := False;
  try
    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KFIN_FINANCIAMENTO_GERAL', ptInput ).asString := cdsFinanciamentoKFIN_FINANCIAMENTO_GERAL.asString ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL_PARCELAS, p ) ;

    if cds.FieldByName('PARCELA').AsInteger > 0 then
      Result := True
    else
      Result := False;

  finally
    p.free ;
    cds.free ;
  end;
end;

procedure TFIN_FinanciamentosDatamodule.cdsLstFinanciamentoNewRecord(DataSet: TDataSet);
begin
  inherited;
//  self.InitializeKeys ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').GetKey ( cdsLstFinanciamentoKFIN_FINANCIAMENTO_GERAL ) ;
  cdsLstFinanciamentoKSYSDOMAIN.asString := LoggedUser.DomainID ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoNewRecord(DataSet: TDataSet);
begin
  inherited;
//  self.CopyKeysFromMaster ;
  cdsFinanciamentoKFIN_FINANCIAMENTO_GERAL.asString   := cdsLstFinanciamentoKFIN_FINANCIAMENTO_GERAL.asString ;
  cdsFinanciamentoKSYSDOMAIN.asString                 := cdsLstFinanciamentoKSYSDOMAIN.asString ;
  cdsFinanciamentoDATALANCTO.AsDateTime  := Date ;
  cdsFinanciamentoATIVO.asString         := 'T' ;
  //cdsAPagarRECORRENCIA.AsString   := 'F' ;
  cdsFinanciamentoPROXIMO_MES.AsString   := 'F' ;
  cdsFinanciamentoANUAL.AsString         := 'F' ;
  cdsFinanciamentoPROVISAO.AsString      := 'T' ;
  cdsFinanciamentoIMPORTADO.AsString     := 'F' ;
  cdsFinanciamentoNUM_PARCELAS.AsInteger := 1 ;
  cdsFinanciamentoDIA_VENCTO.AsInteger   := 1 ;
  cdsFinanciamentoSYSORIGIN_TYPE.asInteger := 0 ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').GetKey ( cdsFinanciamentoKFIN_ARECEBER_FINANCIAMENTO ) ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').GetKey ( cdsFinanciamentoKFIN_APAGAR_DESPESAS ) ;
  if FKContaFavorita <> '' then
   begin
     cdsFinanciamentoKFIN_CONTA_PREF.AsString := FKContaFavorita;
     cdsFinanciamentoNOMECONTA.AsString       := FNomeContaFavorita;
   end;

  if FContaContabilJuros <> '' then
   begin
     cdsFinanciamentoKFIN_PLANOCONTA.AsString := FContaContabilJuros;
     cdsFinanciamentoDESCR_PC_NOME.AsString   := FNomeContaContabilJuros;
     cdsFinanciamentoDESCR_PC_CLASSIFICACAO.AsString := FContaContabilJurosClassificacao;
     cdsFinanciamentoDESCR_PC_CODIGO.AsString  :=  FContaContabilJurosCodigo;
   end;

  if FKFinCentroCustoPadrao <> '' then
   begin
     cdsApropriacaoFinanciamento.Edit;
     cdsApropriacaoFinanciamentoKFIN_CENTROCUSTO.AsString := FKFinCentroCustoPadrao;
     cdsApropriacaoFinanciamentoCODIGO.AsString           :=  FCondigoCentroCustoPadrao;
     cdsApropriacaoFinanciamentoNOME.AsString             := FNomeCentroCustoPadrao;
     cdsApropriacaoFinanciamentoPORCENTAGEM.AsFloat := 100;
   end;
  FIsDelete := False;

end;

procedure TFIN_FinanciamentosDatamodule.cdsParcelasNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsParcelasKFIN_FINANCIAMENTO_PARCELA ) ;
  cdsParcelasPREVISAO.asString := 'F' ;
  cdsParcelasDUVIDOSO.asString := 'F' ;
  cdsParcelasCHEQUE.AsString   := 'F' ;
  //cdsParcelasKFIN_APAGAR_PARCELA.AsString := GuidStr20;
  TTcAbstractDB.GetByAlias('FINANCEIRO').GetKey ( cdsParcelasKFIN_APAGAR_PARCELA ) ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
begin
  cdsParcelasKFIN_CONTA.Clear;
  Sender.asString := Text ;
end;

procedure TFIN_FinanciamentosDatamodule.InitPeriodo;
begin
  FInicioPeriodo := StartOfTheDay ( StartOfTheMonth( Date ) ) ;
  FFimPeriodo    := EndOfTheDay (  EndOfTheMonth( FInicioPeriodo ) ) ;
end;


procedure TFIN_FinanciamentosDatamodule.InsertContaAPagar( KFIN_APAGAR, KSYS_DOMAIN, KCAD_ENTIDADE, NOMEENTIDADE,
                                  HISTORICO, DOCUMENTO, DATALANCTO, VALOR, PROVISAO, RECORRENCIA, NUM_PARCELAS,
                                  DIA_VENCTO, PROXIMO_MES, ANUAL, KFIN_CONTA_PREF, KFIN_PLANOCONTA, OBS, ATIVO,
                                  TABLENAME, TABLEKEY, PAGTO_AVISTA, SYS_ORIGIN_TYPE : String );
const
   _INSERT_OR_UPDATE_CONTA_A_PAGAR =
                'UPDATE OR INSERT INTO FIN_APAGAR (KFIN_APAGAR, KSYS$DOMAIN, KCAD_ENTIDADE, NOMEENTIDADE, HISTORICO,'
         +#13#10'                                  DOCUMENTO, DATALANCTO, VALOR, PROVISAO, RECORRENCIA, NUM_PARCELAS, DIA_VENCTO,'
         +#13#10'                                  PROXIMO_MES, ANUAL, KFIN_CONTA_PREF, KFIN_PLANOCONTA, OBS, ATIVO, TABLENAME, TABLEKEY,'
         +#13#10'                                   PAGTO_AVISTA, SYS$ORIGIN_TYPE)'
         +#13#10'VALUES (:KFIN_APAGAR, :KSYS$DOMAIN, :KCAD_ENTIDADE, :NOMEENTIDADE, :HISTORICO, :DOCUMENTO, :DATALANCTO,'
         +#13#10'        :VALOR, :PROVISAO, :RECORRENCIA, :NUM_PARCELAS, :DIA_VENCTO, :PROXIMO_MES, :ANUAL, :KFIN_CONTA_PREF, :KFIN_PLANOCONTA,'
         +#13#10'        :OBS, :ATIVO, :TABLENAME, :TABLEKEY, :PAGTO_AVISTA, :SYS$ORIGIN_TYPE)'
         +#13#10'MATCHING (KFIN_APAGAR)';
var
  p: TParams;
begin
   p := TParams.Create;
   p.CreateParam( ftString, 'KFIN_APAGAR',      ptInput ).AsString        := KFIN_APAGAR  ;
   p.CreateParam( ftString, 'KSYS$DOMAIN',      ptInput ).AsString        := KSYS_DOMAIN  ;
   p.CreateParam( ftString, 'KCAD_ENTIDADE',    ptInput ).AsString        := KCAD_ENTIDADE  ;
   p.CreateParam( ftString, 'NOMEENTIDADE',     ptInput ).AsString        := NOMEENTIDADE  ;
   p.CreateParam( ftString, 'HISTORICO',        ptInput ).AsString        := HISTORICO  ;
   p.CreateParam( ftString, 'DOCUMENTO',        ptInput ).AsString        := DOCUMENTO  ;
   p.CreateParam( ftTimeStamp, 'DATALANCTO',    ptInput ).AsSQLTimeStamp  := StrToSQLTimesTamp( DATALANCTO )  ;
   p.CreateParam( ftFloat, 'VALOR',             ptInput ).AsFloat         := StrToFloat( VALOR )  ;
   p.CreateParam( ftString, 'PROVISAO',         ptInput ).AsString        := PROVISAO  ;
   p.CreateParam( ftString, 'RECORRENCIA',      ptInput ).AsString        := RECORRENCIA  ;
   p.CreateParam( ftString, 'NUM_PARCELAS',     ptInput ).AsInteger       := StrToInt( NUM_PARCELAS )  ;
   p.CreateParam( ftString, 'DIA_VENCTO',       ptInput ).AsInteger       := StrToInt( DIA_VENCTO )  ;
   p.CreateParam( ftString, 'PROXIMO_MES',      ptInput ).AsString        := PROXIMO_MES  ;
   p.CreateParam( ftString, 'ANUAL',            ptInput ).AsString        := ANUAL  ;
   p.CreateParam( ftString, 'KFIN_CONTA_PREF',  ptInput ).AsString        := KFIN_CONTA_PREF  ;
   p.CreateParam( ftString, 'KFIN_PLANOCONTA',  ptInput ).AsString        := KFIN_PLANOCONTA  ;
   p.CreateParam( ftString, 'OBS',              ptInput ).AsString        := OBS  ;
   p.CreateParam( ftString, 'ATIVO',            ptInput ).AsString        := ATIVO  ;
   p.CreateParam( ftString, 'TABLENAME',        ptInput ).AsString        := TABLENAME  ;
   p.CreateParam( ftString, 'TABLEKEY',         ptInput ).AsString        := TABLEKEY  ;
   //p.CreateParam( ftString, 'TABLENAME',        ptInput ).Bound := False;
   //p.CreateParam( ftString, 'TABLEKEY',         ptInput ).Bound := False;
   p.CreateParam( ftString, 'PAGTO_AVISTA',     ptInput ).AsString        := PAGTO_AVISTA  ;
   p.CreateParam( ftString, 'SYS$ORIGIN_TYPE',  ptInput ).AsString        := SYS_ORIGIN_TYPE  ;
   sqlFinanciamento.SQLConnection.Execute( _INSERT_OR_UPDATE_CONTA_A_PAGAR , p);
   p.Free;
end;

procedure TFIN_FinanciamentosDatamodule.InsertContaAPagarParcela(
  KFIN_APAGAR_PARCELA, KFIN_APAGAR, DOCUMENTO, VENCTO, VALOR, OBS,
  DUVIDOSO, PREVISAO, PAGTO, PAGO,
  KFIN_CONTA: String);
const
   _INSERT_OR_UPDATE_CONTA_A_PAGAR_PARCELA =
                'UPDATE OR INSERT INTO FIN_APAGAR_PARCELAS (KFIN_APAGAR_PARCELA, KFIN_APAGAR, DOCUMENTO, VENCTO, VALOR, OBS,'
         +#13#10'                                           DUVIDOSO, PREVISAO, PAGTO, PAGO, '
         +#13#10'                                           KFIN_CONTA)'
         +#13#10'VALUES (:KFIN_APAGAR_PARCELA, :KFIN_APAGAR, :DOCUMENTO, :VENCTO, :VALOR, :OBS, :DUVIDOSO, :PREVISAO,'
         +#13#10'        :PAGTO, :PAGO, :KFIN_CONTA)'
         +#13#10'MATCHING (KFIN_APAGAR_PARCELA)';
var
  p: TParams;
begin
   p := TParams.Create;
   p.CreateParam( ftString,    'KFIN_ARECEBER_PARCELA',   ptInput ).AsString            := KFIN_APAGAR_PARCELA  ;
   p.CreateParam( ftString,    'KFIN_ARECEBER',           ptInput ).AsString            := KFIN_APAGAR  ;
   p.CreateParam( ftString,    'DOCUMENTO',               ptInput ).AsString            := DOCUMENTO  ;
   p.CreateParam( ftTimeStamp, 'VENCTO',                  ptInput ).AsSQLTimeStamp      := StrToSQLTimesTamp( VENCTO )  ;
   p.CreateParam( ftFloat,     'VALOR',                   ptInput ).AsFloat             := StrToFloat( VALOR )  ;
   p.CreateParam( ftString,    'OBS',                     ptInput ).AsString            := OBS  ;
   p.CreateParam( ftString,    'DUVIDOSO',                ptInput ).AsString            := 'F'  ;
   p.CreateParam( ftString,    'PREVISAO',                ptInput ).AsString            := 'F'  ;

   if PAGTO <> '' then
     p.CreateParam( ftTimeStamp, 'PAGTO',                   ptInput ).AsSQLTimeStamp      := StrToSQLTimesTamp( PAGTO )
   else
     p.CreateParam( ftTimeStamp, 'PAGTO',                   ptInput ).Bound := False;

   if PAGO <> '' then
     p.CreateParam( ftFloat,     'PAGO',                    ptInput ).AsFloat             := StrToFloat( PAGO )
   else
     p.CreateParam( ftFloat,     'PAGO',                    ptInput ).Bound := False;

   p.CreateParam( ftString,    'KFIN_CONTA',              ptInput ).AsString            := KFIN_CONTA  ;
   sqlFinanciamento.SQLConnection.Execute( _INSERT_OR_UPDATE_CONTA_A_PAGAR_PARCELA , p);
   p.Free;
end;

procedure TFIN_FinanciamentosDatamodule.InsertReceitaRealizada( KFIN_ARECEBER, KSYS_DOMAIN, KCAD_ENTIDADE, NOMEENTIDADE, HISTORICO,
                                      DOCUMENTO, DATALANCTO, VALOR, PROVISAO, RECORRENCIA, NUM_PARCELAS, DIA_VENCTO,
                                      PROXIMO_MES, KFIN_CONTA_PREF, KFIN_PLANOCONTA, OBS, ATIVO, TABLENAME,
                                      TABLEKEY, PAGTO_AVISTA, SYS_ORIGIN_TYPE: String );
const
   _INSERT_OR_UPDATE_RECEITA_REALIZADA =
                'UPDATE OR INSERT INTO FIN_ARECEBER (KFIN_ARECEBER, KSYS$DOMAIN, KCAD_ENTIDADE, NOMEENTIDADE, HISTORICO,'
         +#13#10'                                    DOCUMENTO, DATALANCTO, VALOR, PROVISAO, RECORRENCIA, NUM_PARCELAS, DIA_VENCTO,'
         +#13#10'                                    PROXIMO_MES, KFIN_CONTA_PREF, KFIN_PLANOCONTA, OBS, ATIVO, TABLENAME, TABLEKEY,'
         +#13#10'                                    PAGTO_AVISTA, SYS$ORIGIN_TYPE)'
         +#13#10'VALUES (:KFIN_ARECEBER, :KSYS$DOMAIN, :KCAD_ENTIDADE, :NOMEENTIDADE, :HISTORICO, :DOCUMENTO, :DATALANCTO,'
         +#13#10'        :VALOR, :PROVISAO, :RECORRENCIA, :NUM_PARCELAS, :DIA_VENCTO, :PROXIMO_MES, :KFIN_CONTA_PREF, :KFIN_PLANOCONTA,'
         +#13#10'        :OBS, :ATIVO, :TABLENAME, :TABLEKEY, :PAGTO_AVISTA, :SYS$ORIGIN_TYPE)'
         +#13#10'MATCHING (KFIN_ARECEBER)';

   _SQL_ARECEBER_PARCELAS =
                'SELECT RP.KFIN_ARECEBER_PARCELA, RP.KFIN_ARECEBER, RP.DOCUMENTO, RP.VENCTO, RP.VALOR, RP.PRORROGACAO, RP.OBS,'
         +#13#10'       RP.DUVIDOSO, RP.PREVISAO, RP.PAGTO, RP.PAGO, RP.JURO_DESCONTO, RP.KFIN_PLANOCONTA_JURO_DESCONTO, RP.CHEQUE,'
         +#13#10'       RP.KFIN_CONTA, RP.DT_COMPENSACAO, RP.SYS$UI, RP.SYS$DI, RP.SYS$UU, RP.SYS$DU, RP.NUM_CHEQUE'
         +#13#10'FROM FIN_ARECEBER_PARCELAS RP'
         +#13#10'WHERE  RP.KFIN_ARECEBER = ''%s'' ' ;

   _INSERT_OR_UPDATE_RECEITA_REALIZADA_PARCELA =
                'UPDATE OR INSERT INTO FIN_ARECEBER_PARCELAS (KFIN_ARECEBER_PARCELA, KFIN_ARECEBER, DOCUMENTO, VENCTO, VALOR,'
         +#13#10'                                             OBS, DUVIDOSO, PREVISAO, PAGTO, PAGO,'
         +#13#10'                                             KFIN_CONTA)'
         +#13#10'VALUES (:KFIN_ARECEBER_PARCELA, :KFIN_ARECEBER, :DOCUMENTO, :VENCTO, :VALOR, :OBS, :DUVIDOSO, :PREVISAO,'
         +#13#10'        :PAGTO, :PAGO, :KFIN_CONTA'
         +#13#10'        )'
         +#13#10'MATCHING (KFIN_ARECEBER_PARCELA)';



var
  p: TParams;
  cds: TClientDataSet;
  LKFIN_ARECEBER_PARCELA : String;
begin
   p := TParams.Create;
   p.CreateParam( ftString, 'KFIN_ARECEBER',    ptInput ).AsString        := KFIN_ARECEBER  ;
   p.CreateParam( ftString, 'KSYS$DOMAIN',      ptInput ).AsString        := KSYS_DOMAIN  ;
   p.CreateParam( ftString, 'KCAD_ENTIDADE',    ptInput ).AsString        := KCAD_ENTIDADE  ;
   p.CreateParam( ftString, 'NOMEENTIDADE',     ptInput ).AsString        := NOMEENTIDADE  ;
   p.CreateParam( ftString, 'HISTORICO',        ptInput ).AsString        := HISTORICO  ;
   p.CreateParam( ftString, 'DOCUMENTO',        ptInput ).AsString        := DOCUMENTO  ;
   p.CreateParam( ftTimeStamp, 'DATALANCTO',    ptInput ).AsSQLTimeStamp  := StrToSQLTimesTamp( DATALANCTO )  ;
   p.CreateParam( ftFloat, 'VALOR',             ptInput ).AsFloat         := StrToFloat( VALOR )  ;
   p.CreateParam( ftString, 'PROVISAO',         ptInput ).AsString        := PROVISAO  ;
   p.CreateParam( ftString, 'RECORRENCIA',      ptInput ).AsString        := RECORRENCIA  ;
   p.CreateParam( ftString, 'NUM_PARCELAS',     ptInput ).AsInteger       := StrToInt( NUM_PARCELAS )  ;
   p.CreateParam( ftString, 'DIA_VENCTO',       ptInput ).AsInteger       := StrToInt( DIA_VENCTO )  ;
   p.CreateParam( ftString, 'PROXIMO_MES',      ptInput ).AsString        := PROXIMO_MES  ;
   p.CreateParam( ftString, 'KFIN_CONTA_PREF',  ptInput ).AsString        := KFIN_CONTA_PREF  ;
   p.CreateParam( ftString, 'KFIN_PLANOCONTA',  ptInput ).AsString        := KFIN_PLANOCONTA  ;
   p.CreateParam( ftString, 'OBS',              ptInput ).AsString        := OBS  ;
   p.CreateParam( ftString, 'ATIVO',            ptInput ).AsString        := ATIVO  ;
   p.CreateParam( ftString, 'TABLENAME',        ptInput ).AsString        := TABLENAME  ;
   p.CreateParam( ftString, 'TABLEKEY',         ptInput ).AsString        := TABLEKEY  ;
  // p.CreateParam( ftString, 'TABLENAME',        ptInput ).Bound := False;
  // p.CreateParam( ftString, 'TABLEKEY',         ptInput ).Bound := False;
   p.CreateParam( ftString, 'PAGTO_AVISTA',     ptInput ).AsString        := PAGTO_AVISTA  ;
   p.CreateParam( ftString, 'SYS$ORIGIN_TYPE',  ptInput ).AsString        := SYS_ORIGIN_TYPE  ;
   sqlFinanciamento.SQLConnection.Execute( _INSERT_OR_UPDATE_RECEITA_REALIZADA , p);
   p.Free;


   cds := nil;
   TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( cds, Format( _SQL_ARECEBER_PARCELAS,[ KFIN_ARECEBER ] ) );
   if cds.IsEmpty then
    begin
      p := TParams.Create;
      p.CreateParam( ftString,    'KFIN_ARECEBER_PARCELA',   ptInput ).AsString            := GuidStr20  ;
      p.CreateParam( ftString,    'KFIN_ARECEBER',           ptInput ).AsString            := KFIN_ARECEBER  ;
      p.CreateParam( ftString,    'DOCUMENTO',               ptInput ).AsString            := DOCUMENTO  ;
      p.CreateParam( ftTimeStamp, 'VENCTO',                  ptInput ).AsSQLTimeStamp      := StrToSQLTimesTamp( DATALANCTO )  ;
      p.CreateParam( ftFloat,     'VALOR',                   ptInput ).AsFloat             := StrToFloat( VALOR )  ;
      p.CreateParam( ftString,    'OBS',                     ptInput ).AsString            := OBS  ;
      p.CreateParam( ftString,    'DUVIDOSO',                ptInput ).AsString            := 'F'  ;
      p.CreateParam( ftString,    'PREVISAO',                ptInput ).AsString            := 'F'  ;
      //p.CreateParam( ftTimeStamp, 'PAGTO',                   ptInput ).AsSQLTimeStamp      := StrToSQLTimesTamp( DATALANCTO )  ;
      //p.CreateParam( ftFloat,     'PAGO',                    ptInput ).AsFloat             := StrToFloat( VALOR )  ;
      p.CreateParam( ftTimeStamp, 'PAGTO',                   ptInput ).Bound := False;
      p.CreateParam( ftFloat,     'PAGO',                    ptInput ).Bound := False;
      p.CreateParam( ftString,    'KFIN_CONTA',              ptInput ).AsString            := KFIN_CONTA_PREF  ;
      sqlFinanciamento.SQLConnection.Execute( _INSERT_OR_UPDATE_RECEITA_REALIZADA_PARCELA , p);
      p.Free;
    end
   else
    begin
      cds.First;
      while not cds.Eof do
       begin
         p := TParams.Create;
         p.CreateParam( ftString,    'KFIN_ARECEBER_PARCELA',   ptInput ).AsString            := cds.FieldByName('KFIN_ARECEBER_PARCELA').AsString  ;
         p.CreateParam( ftString,    'KFIN_ARECEBER',           ptInput ).AsString            := KFIN_ARECEBER  ;
         p.CreateParam( ftString,    'DOCUMENTO',               ptInput ).AsString            := DOCUMENTO  ;
         p.CreateParam( ftTimeStamp, 'VENCTO',                  ptInput ).AsSQLTimeStamp      := StrToSQLTimesTamp( DATALANCTO )  ;
         p.CreateParam( ftFloat,     'VALOR',                   ptInput ).AsFloat             := StrToFloat( VALOR )  ;
         p.CreateParam( ftString,    'OBS',                     ptInput ).AsString            := OBS  ;
         p.CreateParam( ftString,    'DUVIDOSO',                ptInput ).AsString            := 'F'  ;
         p.CreateParam( ftString,    'PREVISAO',                ptInput ).AsString            := 'F'  ;
         //p.CreateParam( ftTimeStamp, 'PAGTO',                   ptInput ).AsSQLTimeStamp      := StrToSQLTimesTamp( DATALANCTO )  ;
         //p.CreateParam( ftFloat,     'PAGO',                    ptInput ).AsFloat             := StrToFloat( VALOR )  ;
         p.CreateParam( ftTimeStamp, 'PAGTO',                   ptInput ).Bound := False;
         p.CreateParam( ftFloat,     'PAGO',                    ptInput ).Bound := False;
         p.CreateParam( ftString,    'KFIN_CONTA',              ptInput ).AsString            := KFIN_CONTA_PREF  ;
         sqlFinanciamento.SQLConnection.Execute( _INSERT_OR_UPDATE_RECEITA_REALIZADA_PARCELA , p);
         p.Free;
         cds.Next;
       end;

    end;

   cds.Free;
end;

procedure TFIN_FinanciamentosDatamodule.SetParams;
begin
  with cdsLstFinanciamento.params do
     begin
        ParamByName ( 'KSYS$DOMAIN' ).asString := LoggedUser.DomainID ;
//        ParamByName ( 'DSP_PROVISAO' ).asString := BoolToChar ( FShowProvisao ) ;
//        ParamByName ( 'DSP_PAGO' ).asString     := BoolToChar ( FShowPago ) ;
//        ParamByName ( 'DSP_DUVIDOSO' ).asString := BoolToChar ( FShowDuvidoso ) ;

   //     ParamByName ( 'DI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  FInicioPeriodo ) ) ;
   //     ParamByName ( 'DF' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay   (  FFimPeriodo  ) ) ;

        if FKFIN_FINANCIAMENTO_GERAL = '' then
           ParamByName ( 'LISTALL' ).asString := 'T'
        else
           ParamByName ( 'LISTALL' ).asString := 'F' ;

        ParamByName ( 'KFIN_FINANCIAMENTO_GERAL' ).asString := FKFIN_FINANCIAMENTO_GERAL ;

     end ;

  DoChangePeriodo ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsLstFinanciamentoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams;
end;




procedure TFIN_FinanciamentosDatamodule.SetPlanoContasDefault ;
const
  _SELECT_PLANO =
        'SELECT'
 +#13#10' E.KFIN_PLANOCONTA,'
 +#13#10' P.NOME DESC_PLANOCONTA,'
 +#13#10' P.CODIGO CODIGO_PLANOCONTA,'
 +#13#10' P.CLASSIFICACAO'
 +#13#10'FROM CAD_ENTIDADES E'
 +#13#10'LEFT JOIN FIN_PLANOCONTAS P ON P.KFIN_PLANOCONTA = E.KFIN_PLANOCONTA'
 +#13#10'WHERE E.KCAD_ENTIDADE = :KCAD_ENTIDADE' ;
var
  LCDSApropriacao : TClientDataSet ;
  p : TParams ;
  LQtdeIsNull : boolean ;
  LDescrPlanoConta : string ;
  LKFIN_PLANOCONTA : string ;
  cds : TClientDataSet ;

begin

  cds := nil ;
  p := TParams.Create ;
  p.CreateParam ( ftString, 'KCAD_ENTIDADE', ptInput ).asString := cdsFinanciamentoKCAD_ENTIDADE.asString ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SELECT_PLANO, p ) ;
  LKFIN_PLANOCONTA := cds.FieldByName( 'KFIN_PLANOCONTA' ).asString ;
  LDescrPlanoConta := cds.FieldByName( 'DESC_PLANOCONTA' ).asString ;
  cds.Free ;
  p.free ;

  if LKFIN_PLANOCONTA.Trim.IsEmpty then
    exit ;

  // set required fields ....
  //LQtdeIsNull := cdsApagarQTDE.IsNull ;
  //if LQtdeIsNull then
  //   cdsApagarQTDE.asFloat := 1 ;

  //if cdsApagarKFIN_PLANOCONTA.AsString  <> LKFIN_PlanoConta then
   with cdsApropriacaoFinanciamento do
     begin
       first ;
       while not eof do
         Delete ;
     end;

  cdsFinanciamentoDESCR_PC_NOME.AsString   :=  LDescrPlanoConta ;
  cdsFinanciamentoKFIN_PLANOCONTA.AsString :=  LKFIN_PLANOCONTA ;

  //add rateio ....

  SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
                           'CAD_FORNECEDORES',  cdsFinanciamentoKCAD_ENTIDADE.asString,
                           'FIN_FINANCIAMENTOS_GERAL', cdsFinanciamentoKFIN_FINANCIAMENTO_GERAL.asString,
                           cdsApropriacaoFinanciamento,
                           SvcFinanceiroApropriacaoDefault.NeedCC( LKFIN_PLANOCONTA ));

  if LQtdeIsNull then
    begin
     // return required fields ....
     ////cdsApagarQTDE.OnValidate := nil ;
     //cdsApagarQTDE.Clear ;
     ////cdsApagarQTDE.OnValidate := cdsApagarQTDEValidate ;
    end;


end;


procedure TFIN_FinanciamentosDatamodule.SetEntidade(Key : String; NomeEntidade: string ) ;
var
  LBeforePost : TDataSetNotifyEvent ;
begin
  LBeforePost            := cdsFinanciamento.BeforePost ;
  cdsFinanciamento.BeforePost := nil ;
  try
    if not ( cdsFinanciamento.State in [dsInsert,dsEdit] ) then
       cdsFinanciamento.Edit ;

    cdsFinanciamentoNOMEENTIDADE.asString  := NomeEntidade ;
    cdsFinanciamentoKCAD_ENTIDADE.asString := Key ;

   // SetPlanoContasDefault ;
  except
    cdsFinanciamento.BeforePost := LBeforePost ;
  end;

end;

procedure TFIN_FinanciamentosDatamodule.SetFilter(ShowProvisao: Boolean; DataInicial, DataFinal: TDateTime);
begin
  FShowProvisao  := ShowProvisao ;
  FInicioPeriodo := StartOfTheDay ( DataInicial ) ;
  FFimPeriodo    := EndOfTheDay ( DataFinal ) ;
  SetParams ;
  self.RefreshList ;
end;


procedure TFIN_FinanciamentosDatamodule.SetKFIN_FINANCIAMENTO_GERAL(
  const Value: string);
begin
  FKFIN_FINANCIAMENTO_GERAL := Value;
end;

procedure TFIN_FinanciamentosDatamodule.SetCentroCustoPadrao;
const
  _SQL_CENTRO_CUSTO_FAVORITO =
                 'SELECT KFIN_CENTROCUSTO, CODIGO, NOME '
          +#13#10'FROM FIN_CENTROSCUSTO WHERE KSYS$DOMAIN = :KSYS$DOMAIN AND KDEF_CENTROCUSTO = :KDEF_CENTROCUSTO';

var
  cds: TClientDataSet;
  p: TParams;
  LDEF_PECUARIA_LEITE: String;
begin

  LDEF_PECUARIA_LEITE := 'La;m;0+smOQ+4RnK^6as';

  p := TParams.Create(nil);
  p.CreateParam(ftString,  'KSYS$DOMAIN'     , ptInput).AsString := LoggedUser.DomainID;
  p.CreateParam(ftString,  'KDEF_CENTROCUSTO', ptInput).AsString := LDEF_PECUARIA_LEITE;
  cds := nil;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet(cds, _SQL_CENTRO_CUSTO_FAVORITO, p);
  if not cds.IsEmpty then
   begin
     FKFinCentroCustoPadrao    := cds.FieldByName('KFIN_CENTROCUSTO').AsString;
     FCondigoCentroCustoPadrao := cds.FieldByName('CODIGO').AsString;
     FNomeCentroCustoPadrao    := cds.FieldByName('NOME').AsString;
   end
  else
   begin
     FKFinCentroCustoPadrao    := '';
     FCondigoCentroCustoPadrao := '';
     FNomeCentroCustoPadrao    := '';
   end;
  cds.Free;
  p.Free;
end;

procedure TFIN_FinanciamentosDatamodule.SetConta( Key, NomeConta: string; IsPreferencial : Boolean ) ;
begin
  if IsPreferencial then
    begin
      if not ( cdsFinanciamento.State in [dsInsert,dsEdit] ) then
        cdsFinanciamento.Edit ;

      cdsFinanciamentoKFIN_CONTA_PREF.AsString := Key ;
      cdsFinanciamentoNOMECONTA.AsString       := NomeConta ;
    end
  else
    begin
      if not( cdsParcelas.State in [dsInsert, dsEdit] ) then
        cdsParcelas.Edit;

      cdsParcelasKFIN_CONTA.AsString := Key;
      cdsParcelasNOMECONTA.AsString  := NomeConta;
    end;
end;

procedure TFIN_FinanciamentosDatamodule.SetContaContabilJuros;
const
  SQL_CONTACONTABIL_FAVORITA =
                       'SELECT P.KFIN_PLANOCONTA,'
                +#13#10'       P.CODIGO,'
                +#13#10'       P.CLASSIFICACAO,'
                +#13#10'       P.NOME'
                +#13#10'FROM FIN_PLANOCONTAS P'
                +#13#10'WHERE'
                +#13#10'  P.KFIN_PLANOCONTA = :KFIN_PLANOCONTA' ;
begin

 with TTcAbstractDB
    .GetByAlias('FINANCEIRO')
    .ISQL ( SQL_CONTACONTABIL_FAVORITA )
    .SQLParamValues( 'KFIN_PLANOCONTA', TPlanoContasDespesasReceitas.GetKeyJurosFinanciamentos )
    .GetDS do
   begin
     FContaContabilJuros              := FieldByName('KFIN_PLANOCONTA').AsString;
     FNomeContaContabilJuros          := FieldByName('NOME').AsString;
     FContaContabilJurosCodigo        := FieldByName('CODIGO').AsString;
     FContaContabilJurosClassificacao := FieldByName('CLASSIFICACAO').AsString;
   end ;

end;

procedure TFIN_FinanciamentosDatamodule.SetContaFavorita;
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

procedure TFIN_FinanciamentosDatamodule.DecrementaAno;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, -12 ) );
     FFimPeriodo     := EndOfTheDay   ( EndOfTheMonth( FInicioPeriodo ) ) ;
     RefreshPeriodo;
end;

procedure TFIN_FinanciamentosDatamodule.DecrementaMes;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, -1 ) );
     FFimPeriodo     := EndOfTheDay   ( EndOfTheMonth( FInicioPeriodo ) ) ;
     RefreshPeriodo;
end;

procedure TFIN_FinanciamentosDatamodule.IncrementaAno;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, 12 ) );
     FFimPeriodo     := EndOfTheDay   ( EndOfTheMonth( FInicioPeriodo ) ) ;
     RefreshPeriodo;
end;

procedure TFIN_FinanciamentosDatamodule.IncrementaMes;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, 1 ) ) ;
     FFimPeriodo     := EndOfTheDay   ( EndOfTheMonth( FInicioPeriodo ) ) ;
     RefreshPeriodo;
end;

procedure TFIN_FinanciamentosDatamodule.RefreshPeriodo;
begin
//     lstPagoAgora.Clear ;
     cdsLstFinanciamento.CancelUpdates ;
     SetParams ;
     cdsLstFinanciamento.Refresh ;
end;

function TFIN_FinanciamentosDatamodule.RoundTo(const AValue: Currency;
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

function TFIN_FinanciamentosDatamodule.GetNewOrOldValue(
  var DeltaDs: TCustomClientDataSet; FieldName: String): Variant;
begin
  if  (VarIsEmpty( DeltaDs.FieldByName( FieldName ).NewValue )) then  //Unassigned
    Result := DeltaDs.FieldByName( FieldName ).OldValue
  else
    Result := DeltaDs.FieldByName( FieldName ).NewValue;

end;

function TFIN_FinanciamentosDatamodule.GetStringPeriodo: String;
begin
   Result := formatDateTime ( 'mmmm/yyyy', FInicioPeriodo ) ;
end;

procedure TFIN_FinanciamentosDatamodule.DoChangePeriodo;
begin
    if Assigned ( FOnChangePeriodo ) then
       FOnChangePeriodo ( self ) ;
end;

procedure TFIN_FinanciamentosDatamodule.dspFinanciamentoAfterUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
const
  _DELETE_PARCELAS_PAGAR =
         'DELETE FROM FIN_APAGAR_PARCELAS WHERE KFIN_APAGAR_PARCELA = :KFIN_APAGAR_PARCELA';

  _DELETE_CONTA_A_PAGAR =
         'DELETE FROM FIN_APAGAR WHERE KFIN_APAGAR = :KFIN_APAGAR';

  _DELETE_CONTA_A_RECEBER =
         'DELETE FROM FIN_ARECEBER WHERE KFIN_ARECEBER = :KFIN_RECEBER';

var
  p: TParams;
  LKFin_AReceber_Parcela, LKFin_AReceber, LKFin_APagar : String;
begin
  if ( SourceDS = sqlParcelas ) then
   begin
    if (UpdateKind = ukDelete) then
     begin
       LKFin_AReceber_Parcela := VarToStr( GetNewOrOldValue(DeltaDS,'KFIN_APAGAR_PARCELA') );
       p := TParams.Create;
       p.CreateParam( ftString,    'KFIN_APAGAR_PARCELA',   ptInput ).AsString  := LKFin_AReceber_Parcela;
       sqlFinanciamento.SQLConnection.Execute( _DELETE_PARCELAS_PAGAR , p);
       p.Free;
     end;
   end
  else
  if ( SourceDS = sqlFinanciamento ) then
   begin
    if (UpdateKind = ukDelete) then
     begin
       LKFin_AReceber := VarToStr( GetNewOrOldValue(DeltaDS,'KFIN_ARECEBER_FINANCIAMENTO') );
       p := TParams.Create;
       p.CreateParam( ftString,    'KFIN_RECEBER',   ptInput ).AsString  := LKFin_AReceber;
       sqlFinanciamento.SQLConnection.Execute( _DELETE_CONTA_A_RECEBER , p);
       p.Free;


       LKFin_APagar := VarToStr( GetNewOrOldValue(DeltaDS,'KFIN_APAGAR_DESPESAS') );
       p := TParams.Create;
       p.CreateParam( ftString,    'KFIN_APAGAR',   ptInput ).AsString  := LKFin_APagar;
       sqlFinanciamento.SQLConnection.Execute( _DELETE_CONTA_A_PAGAR , p);
       p.Free;
     end;
   end
end;

procedure TFIN_FinanciamentosDatamodule.dspFinanciamentoBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin

  if ( SourceDS = sqlFinanciamento ) and ( (UpdateKind = ukInsert) or (UpdateKind = ukModify) ) then
   begin
      Applied := False; // -> Executa o ApplyUpdate do ClientDataSet
      InsertReceitaRealizada(
          VarToStr( GetNewOrOldValue(DeltaDS,'KFIN_ARECEBER_FINANCIAMENTO') ),
          LoggedUser.DomainID,
          VarToStr( GetNewOrOldValue(DeltaDS,'KCAD_ENTIDADE') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'NOMEENTIDADE') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'HISTORICO') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'DOCUMENTO') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'DATALANCTO') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'VALOR') ) ,
          VarToStr( GetNewOrOldValue(DeltaDS,'PROVISAO') ),
          'F',//VarToStr( DeltaDS.FieldByName('RECORRENCIA').Value ),
          '1',
          GetNewOrOldValue(DeltaDS,'DIA_VENCTO'),
          VarToStr( GetNewOrOldValue(DeltaDS,'PROXIMO_MES') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'KFIN_CONTA_PREF') ),
          TPlanoContasDespesasReceitas.GetKeyBancos ,
          VarToStr( GetNewOrOldValue(DeltaDS,'OBS') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'ATIVO') ),
          'FIN_FINANCIAMENTOS_GERAL' ,
          VarToStr( GetNewOrOldValue(DeltaDS,'KFIN_FINANCIAMENTO_GERAL') ),
          'T',
          VarToStr( GetNewOrOldValue(DeltaDS,'SYS$ORIGIN_TYPE') )
      );

      InsertContaAPagar(
          VarToStr( GetNewOrOldValue(DeltaDS, 'KFIN_APAGAR_DESPESAS') ),
          LoggedUser.DomainID,
          VarToStr( GetNewOrOldValue(DeltaDS,'KCAD_ENTIDADE') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'NOMEENTIDADE') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'HISTORICO') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'DOCUMENTO') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'DATALANCTO') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'VALOR') ) ,
          VarToStr( GetNewOrOldValue(DeltaDS,'PROVISAO') ),
          'F',//VarToStr( DeltaDS.FieldByName('RECORRENCIA').Value ),
          VarToStr( GetNewOrOldValue(DeltaDS,'NUM_PARCELAS') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'DIA_VENCTO') ) ,
          VarToStr( GetNewOrOldValue(DeltaDS,'PROXIMO_MES') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'ANUAL') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'KFIN_CONTA_PREF') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'KFIN_PLANOCONTA') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'OBS') ),
          VarToStr( GetNewOrOldValue(DeltaDS,'ATIVO') ),
          'FIN_FINANCIAMENTOS_GERAL' ,
          VarToStr( GetNewOrOldValue(DeltaDS,'KFIN_FINANCIAMENTO_GERAL') ),
          'F',
          VarToStr( GetNewOrOldValue(DeltaDS,'SYS$ORIGIN_TYPE') )
      );

   end
  else
  if ( SourceDS = sqlParcelas ) then
   begin
    if ( (UpdateKind = ukInsert) or (UpdateKind = ukModify) ) then
     begin
       Applied := False;
       InsertContaAPagarParcela(
         VarToStr( GetNewOrOldValue(DeltaDS,'KFIN_APAGAR_PARCELA') ),
         cdsFinanciamentoKFIN_APAGAR_DESPESAS.AsString,
         VarToStr( GetNewOrOldValue(DeltaDS,'DOCUMENTO') ),
         VarToStr( GetNewOrOldValue(DeltaDS,'VENCTO') ),
         VarToStr( GetNewOrOldValue(DeltaDS,'VALOR') ),
         VarToStr( GetNewOrOldValue(DeltaDS,'OBS') ),
         '',
         '',
         '',
         '',
         VarToStr( GetNewOrOldValue(DeltaDS,'KFIN_CONTA') )
       );

     end
   end;

//
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
var
   lFound : boolean ;
   pBookmark : TBookmark;

     LErrMsg : TStringBuilder ;
  LValorTotalParcelas : double ;
begin
  LErrMsg := TStringBuilder.Create ;

  try

    TCDSSuppl.PostIfNeed(cdsParcelas) ;

    if (cdsFinanciamentoKCAD_ENTIDADE.AsString = '') and (not FIsDelete ) then
     begin
       LErrMsg.AppendLine('O Fornecedor não foi selecionado.');
     end;


    if not ( ( VarIsEmpty(cdsParcelasTOTAL_AMORTIZACAO.Value) ) or
             ( VarIsNull(cdsParcelasTOTAL_AMORTIZACAO.Value ) ) ) then
     begin
       if RoundTo(cdsFinanciamentoVALOR.AsFloat, -2) <>
          RoundTo(cdsParcelasTOTAL_AMORTIZACAO.Value, -2) then
          LErrMsg.AppendLine('O valor das amortizações devem ser igual ao total financiado');
     end;


    if LErrMsg.Length > 0 then
       raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
    FIsDelete := False;
  end;


  inherited;
  with cdsParcelas do
     begin
        DisableControls ;
        pBookmark := GetBookmark ;
        cdsParcelas.First;
        Repeat
           lFound := inRange ( cdsParcelasVENCTO.asDateTime , FInicioPeriodo, FFimPeriodo )
               and ( FShowDuvidoso or not cdsParcelasDUVIDOSO.asBoolean ) ;
//               and ( FShowPago or not cdsParcelasDUVIDOSO.asBoolean )
           cdsParcelas.Next ;
        Until ( lFound ) or ( cdsParcelas.EOF ) ;
        GotoBookmark( pBookmark );
        FreeBookmark( pBookmark );
        EnableControls ;
     end ;
       //remover se nao fizer diferenca - vts
//  if ( cdsLstAPagarKFIN_APAGAR_PARCELA.IsNull ) and ( lFound ) then
//     begin
//       cdsLstAPagar.Edit ;
//       cdsLstAPagarKFIN_APAGAR_PARCELA.AsString := cdsParcelasKFIN_APAGAR_PARCELA.AsString ;
//     end ;

  FHiddingByFilter := not lFound ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoBeforeDelete(DataSet: TDataSet);
begin
  if cdsFinanciamentoSYSORIGIN_TYPE.asInteger = 2 then
    raise Warning.Create( 'Financiamento incluído via sincronismo.' + #10#13 + 'Não pode ser excluído.' );

  if ParcelaBaixada then
    raise Warning.Create( 'Existe(m) parcela(s) já baixada(s).' + #10#13 + 'Não pode ser excluída.' );

  if CheckRecebimento then
    raise Warning.Create( 'Existe um recebimento já baixado.' + #10#13 + 'Financiamento não pode ser excluído.' );

  FIsDelete := True;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoBeforeEdit(
  DataSet: TDataSet);
begin
  FIsDelete := False;
end;

procedure TFIN_FinanciamentosDatamodule.cdsParcelasVALORValidate(Sender: TField);
begin
  if Sender.AsFloat <= 0 then
    raise Warning.Create('Valor da parcela inválido.');

  cdsParcelasAMORTIZACAO.AsFloat := RoundTo( cdsFinanciamentoVALOR.AsFloat / cdsFinanciamentoNUM_PARCELAS.AsInteger, -2 );
  cdsParcelasJUROS.AsFloat       := RoundTo( cdsParcelasVALOR.AsFloat - cdsParcelasAMORTIZACAO.AsFloat, -2 );

  if cdsParcelasJUROS.AsFloat < 0 then
    cdsParcelasJUROS.AsFloat := 0;

end;

procedure TFIN_FinanciamentosDatamodule.cdsParcelasVENCTOValidate(Sender: TField);
begin
  if Sender.IsNull then
    raise Warning.Create('Data de vencimento inválida.');
//  if assigned ( FOnCheckDate ) then
//     if not FOnCheckDate ( TDateTimeField ( Sender ).AsDateTime ) then
//        Abort ;
end;

procedure TFIN_FinanciamentosDatamodule.ApplyUpdates;
var
  LErrMsg : TStringBuilder ;
  LValorTotalParcelas : double ;
begin
  {*** cdsAPagar.OnBeforePost ***}
  LErrMsg := TStringBuilder.Create ;

  try
    TCDSSuppl.PostIfNeed(cdsParcelas) ;

    {if ( cdsAPagarPAGTO_AVISTA.AsBoolean )  then
      LValorTotalParcelas := cdsAPagarVALOR.asVariant
    else
    if VarIsNull( cdsParcelasTOTAL.asVariant ) then
      LValorTotalParcelas := 0
    else
      LValorTotalParcelas := cdsParcelasTOTAL.asVariant ;

    if ( cdsAPagarRECORRENCIA.AsString = 'F' ) then
     begin
       if not ( cdsAPagar.State in [dsEdit, dsInsert] ) then
         cdsAPagar.Edit;
       cdsAPagarVALOR.AsFloat := LValorTotalParcelas ;
       cdsAPagar.Post;
     end;                                                  }

    if ( LValorTotalParcelas = 0 ) then
      LErrMsg.AppendLine('O valor da despesa não pode ser zero.');

    if cdsFinanciamentoKFIN_PLANOCONTA.IsNull then
      LErrMsg.AppendLine('Apropriação deve ser pesquisada/selecionada.');

      if LErrMsg.Length > 0 then
         raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;
  {*** cdsAPagar.OnBeforePost ***}

  if ( cdsFinanciamentoKFIN_PLANOCONTA.AsString.Trim <> '' ) then
    if SvcFinanceiroApropriacaoDefault.NeedCC ( cdsFinanciamentoKFIN_PLANOCONTA.AsString ) then
      if cdsApropriacaoFinanciamento.IsEmpty then
          raise Warning.Create('é necessário informar ao menos um centro de custos.');



  {if ( cdsAPagarPAGTO_AVISTA.AsBoolean ) then
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
    end; }

///  if not ValidaCampos then
///    inherited;

  inherited;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
  if ( FHiddingByFilter ) and Assigned ( FOnHiddingByFilter ) then
     FOnHiddingByFilter ( Self ) ;
  FHiddingByFilter := False ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsLstFinanciamento.IsEmpty ) and not ( cdsLstFinanciamento.State in [dsInsert,dsEdit] )  then
     cdsLstFinanciamento.Append ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoBeforePost(DataSet: TDataSet);
var
  LErrMsg : TStringBuilder ;
  LValorTotalParcelas : double ;
begin

 { LErrMsg := TStringBuilder.Create ;

  try

    TCDSSuppl.PostIfNeed(cdsParcelas) ;

    if not ( ( VarIsEmpty(cdsParcelasTOTAL_AMORTIZACAO.Value) ) or
             ( VarIsNull(cdsParcelasTOTAL_AMORTIZACAO.Value ) ) ) then
     begin
       if RoundTo(cdsFinanciamentoVALOR.AsFloat, -2) <>
          RoundTo(cdsParcelasTOTAL_AMORTIZACAO.Value, -2) then
          LErrMsg.AppendLine('O valor das amortizações devem ser igual ao total financiado');
     end;


    if LErrMsg.Length > 0 then
       raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;}
end;

procedure TFIN_FinanciamentosDatamodule.cdsParcelasBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsFinanciamento.IsEmpty ) and not ( cdsFinanciamento.State in [dsInsert,dsEdit] )  then
     cdsFinanciamento.Append ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsParcelasBeforePost(
  DataSet: TDataSet);
begin

 { if (( cdsAPagarPAGTO_AVISTA.AsBoolean ) and ( cdsParcelasCHEQUE.AsBoolean )) or
     (( not cdsParcelasCHEQUE.AsBoolean ) and ( cdsParcelasPAGTO.IsNull))  then
     cdsParcelasDT_COMPENSACAO.Clear;}

 if (RoundTo(cdsParcelasAMORTIZACAO.AsFloat, -2) + RoundTo(cdsParcelasJUROS.AsFloat, -2) ) <>
     RoundTo(cdsParcelasVALOR.AsFloat, -2) then
   begin
     raise Warning.Create('O valor da parcela deve ser igual ao valor da amortização + juros');
   end;


end;

procedure TFIN_FinanciamentosDatamodule.cdsParcelasCHEQUEChange(Sender: TField);
begin

  if cdsParcelasCHEQUE.asBoolean then
      cdsParcelasDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasPAGTO.AsSQLTimeStamp ;
      cdsParcelasNUM_CHEQUE.Clear ;
    end ;
end;

procedure TFIN_FinanciamentosDatamodule.SetShowDuvidoso(const Value: Boolean);
begin
  FShowDuvidoso := Value;
  RefreshPeriodo ;
end;

procedure TFIN_FinanciamentosDatamodule.SetShowPago(const Value: Boolean);
begin
  FShowPago := Value;
  RefreshPeriodo ;
end;

procedure TFIN_FinanciamentosDatamodule.SetShowProvisao(const Value: Boolean);
begin
  FShowProvisao := Value;
  RefreshPeriodo ;
end;
(*
function TFIN_OutrasDespesasDatamodule.ValidaCampos: Boolean;
var
  ErrMsg : string ;
  i : Integer ;

  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  ErrMsg := '' ;

  for i := 0 to cdsAPagar.FieldCount - 1 do
    begin
      if ( ( cdsAPagar.Fields[i].Required = True ) and ( cdsAPagar.Fields[i].IsNull ) ) then
        AddErr( cdsAPagar.Fields[i].DisplayLabel ) ;
    end;

  Result := ErrMsg <> '';

  if Result then
    raise Warning.Create( 'Campos requeridos não preenchidos' + #13#10#13#10 + ErrMsg );

  Result := cdsParcelas.IsEmpty ;
  if Result then
    raise Warning.Create( 'Deve ter ao menos uma parcela.' );

end;
*)
procedure TFIN_FinanciamentosDatamodule.ValidDocumento;
begin
  if   ( cdsFinanciamentoKCAD_ENTIDADE.IsNull )
    or ( cdsFinanciamentoDOCUMENTO.isNull   )
    or ( Trim ( cdsFinanciamentoDOCUMENTO.AsString  ) = '')  then
     exit ;

  if TSQLSuppl.CheckExistsIn(    'FIN_FINANCIAMENTOS_GERAL',
                                 'KCAD_ENTIDADE;DOCUMENTO', VarArrayOf ( [ cdsFinanciamentoKCAD_ENTIDADE.asString, cdsFinanciamentoDOCUMENTO.asString ] ),
                                 Format ( 'KFIN_FINANCIAMENTO_GERAL <> %s ', [ QuotedStr( cdsFinanciamentoKFIN_FINANCIAMENTO_GERAL.asString ) ] ),
                                 TSQLConnection ( DBResources[ 'FINANCEIRO' ].Connection ) ) then
        Raise Warning.Create( _ERRMSG_DOCUMENTO_JA_CADASTRADO ) ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsLstAPagarVENCTOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

  if  YearOf ( Sender.AsDateTime )  <> YearOf ( FInicioPeriodo ) then
    Text := formatDateTime ( 'dd/mmm/yy', Sender.AsDateTime )
  else if  MonthOf ( Sender.AsDateTime )  <> MonthOf ( FInicioPeriodo ) then
    Text := formatDateTime ( 'dd/mmm', Sender.AsDateTime )
  else
    Text := formatDateTime ( 'dd', Sender.AsDateTime )

end;

procedure TFIN_FinanciamentosDatamodule.cdsLstAPagarDUVIDOSOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
      Text := BooleanFieldToText ( Sender ) ;

end;

procedure TFIN_FinanciamentosDatamodule.cdsLstAPagarPREVISAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

   if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
      Text := BooleanFieldToText ( Sender ) ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsLstFinanciamentoPROVISAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

  if DisplayText then
    if Sender.AsString = 'T' then
      Text := 'Sim'
    else if Sender.asString = 'F' then
      Text := 'Não';
end;

procedure TFIN_FinanciamentosDatamodule.cdsParcelasPREVISAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
      Text := BooleanFieldToText ( Sender ) ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsParcelasDUVIDOSOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
      Text := BooleanFieldToText ( Sender ) ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsParcelasJUROSChange(Sender: TField);
begin
  if cdsParcelasJUROS.AsFloat < 0 then
    cdsParcelasJUROS.AsFloat := 0;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoDESCR_PC_NOMESetText(Sender: TField; const Text: string);
begin
  with cdsApropriacaoFinanciamento do
    begin
      First;
      while not Eof do
        Delete;
    end;

  cdsFinanciamentoKFIN_PLANOCONTA.Clear ;
  Sender.asString := Text ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoDOCUMENTOValidate(
  Sender: TField);
begin
  ValidDocumento ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoKCAD_ENTIDADEValidate(
  Sender: TField);
begin
  ValidDocumento ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoKFIN_PLANOCONTAValidate(
  Sender: TField);
begin
  if cdsFinanciamentoKFIN_PLANOCONTA.AsString <> FContaContabilJuros then
   begin
     cdsFinanciamentoKFIN_PLANOCONTA.AsString := FContaContabilJuros;
     cdsFinanciamentoDESCR_PC_NOME.AsString   := FNomeContaContabilJuros;
     cdsFinanciamentoDESCR_PC_CLASSIFICACAO.AsString := FContaContabilJurosClassificacao;
     cdsFinanciamentoDESCR_PC_CODIGO.AsString  :=  FContaContabilJurosCodigo;
     raise Warning.Create( Format('Apropriação não pode ser diferente da conta contábil %s',[FNomeContaContabilJuros]) );
   end;

end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoNOMECONTASetText(Sender: TField; const Text: string);
begin
  cdsFinanciamentoKFIN_CONTA_PREF.Clear;
  Sender.asString := Text ;
end;

procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoNOMEENTIDADESetText(Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsFinanciamentoKCAD_ENTIDADE.Clear;
end;


procedure TFIN_FinanciamentosDatamodule.cdsFinanciamentoPAGTO_AVISTAChange(
  Sender: TField);
begin
 {cdsAPagarPAGTO_AVISTA.OnChange := nil ;
 try
   //if Sender.asBoolean then
     PagamentoAVista;
 finally
     cdsAPagarPAGTO_AVISTA.OnChange := cdsAPagarPAGTO_AVISTAChange
 end;}
end;

procedure TFIN_FinanciamentosDatamodule.cdsApropriacaoFinanciamentoNewRecord(
  DataSet: TDataSet);
begin

  GetKey( cdsApropriacaoFinanciamentoKFIN_APROPRIACAO );
  //cdsApropriacaoFinanciamentoTABLENAME.AsString := 'FIN_FINANCIAMENTOS_GERAL' ;
  //cdsApropriacaoFinanciamentoTABLEKEY.AsString  :=  cdsFinanciamentoKFIN_FINANCIAMENTO_GERAL.AsString;
  cdsApropriacaoFinanciamentoTABLENAME.AsString := 'FIN_APAGAR' ;
  cdsApropriacaoFinanciamentoTABLEKEY.AsString  := cdsFinanciamentoKFIN_APAGAR_DESPESAS.AsString
//
end;

procedure TFIN_FinanciamentosDatamodule.SetShowEmAtraso(const Value: Boolean);
begin
  FShowEmAtraso := Value;
  RefreshPeriodo ;
end;

procedure TFIN_FinanciamentosDatamodule.RefreshBaixa( var BaixaTitulo: TBaixaTitulo);
begin
    cdsLstFinanciamento.edit ;
//    cdsLstAPagarPAGTO.AsDateTime := BaixaTitulo.Data ;
    cdsLstFinanciamentoVALOR.asCurrency := BaixaTitulo.Pago ;
 //   cdsLstAPagarNOMECONTA.asString := BaixaTitulo.NomeConta ;
    cdsLstFinanciamento.post ;
    cdsLstFinanciamento.Refresh ;
end;

procedure TFIN_FinanciamentosDatamodule._DataModuleCreate(Sender: TObject);
begin
  inherited;
  FShowDuvidoso := False ;
  FShowPago     := False ;
  FShowEmAtraso := True ;
  InitPeriodo ;
end;

end.

