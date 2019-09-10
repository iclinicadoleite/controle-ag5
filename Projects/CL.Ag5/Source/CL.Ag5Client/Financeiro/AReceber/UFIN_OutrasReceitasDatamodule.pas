unit UFIN_OutrasReceitasDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  FIN_AReceberTypes, Tc.Data.SQLExpr ;

type

  TNotifyCheckDate = function ( Date : TDateTime ) : boolean of object ;

  TFIN_OutrasReceitasDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstAReceber: TClientDataSet;
    cdsAReceber: TClientDataSet;
    dtsList: TDataSource;
    cdsParcelas: TClientDataSet;
    cdsAReceberKFIN_ARECEBER: TStringField;
    cdsAReceberTABLENAME: TStringField;
    cdsAReceberKCAD_ENTIDADE: TStringField;
    cdsAReceberTABLEKEY: TStringField;
    cdsAReceberNOMEENTIDADE: TStringField;
    cdsAReceberHISTORICO: TStringField;
    cdsAReceberDOCUMENTO: TStringField;
    cdsAReceberDATALANCTO: TSQLTimeStampField;
    cdsARecebersqlParcelas: TDataSetField;
    cdsParcelasKFIN_ARECEBER_PARCELA: TStringField;
    cdsParcelasKFIN_ARECEBER: TStringField;
    cdsParcelasDOCUMENTO: TStringField;
    cdsParcelasVENCTO: TSQLTimeStampField;
    cdsParcelasVALOR: TFloatField;
    cdsParcelasPAGTO: TSQLTimeStampField;
    cdsParcelasPAGO: TFloatField;
    cdsParcelasOBS: TMemoField;
    cdsAReceberKFIN_CONTA_PREF: TStringField;
    cdsAReceberKFIN_PLANOCONTA: TStringField;
    cdsAReceberNOMECONTA: TStringField;
    cdsAReceberOBS: TMemoField;
    cdsParcelasNOMECONTA: TStringField;
    cdsParcelasPREVISAO: TStringField;
    cdsParcelasDUVIDOSO: TStringField;
    cdsAReceberStatusCadastro: TStringField;
    cdsAReceberATIVO: TStringField;
    dspLstAReceber: TDataSetProvider;
    dspAReceber: TDataSetProvider;
    sqlLstAReceber: TTcSQLDataSet;
    sqlAReceber: TTcSQLDataSet;
    sqlAReceberKFIN_ARECEBER: TStringField;
    sqlAReceberTABLENAME: TStringField;
    sqlAReceberKCAD_ENTIDADE: TStringField;
    sqlAReceberTABLEKEY: TStringField;
    sqlAReceberNOMEENTIDADE: TStringField;
    sqlAReceberHISTORICO: TStringField;
    sqlAReceberDOCUMENTO: TStringField;
    sqlAReceberDATALANCTO: TSQLTimeStampField;
    sqlAReceberKFIN_CONTA_PREF: TStringField;
    sqlAReceberKFIN_PLANOCONTA: TStringField;
    sqlAReceberNOMECONTA: TStringField;
    sqlAReceberOBS: TMemoField;
    sqlAReceberATIVO: TStringField;
    sqlParcelas: TTcSQLDataSet;
    sqlParcelasKFIN_ARECEBER_PARCELA: TStringField;
    sqlParcelasKFIN_ARECEBER: TStringField;
    sqlParcelasDOCUMENTO: TStringField;
    sqlParcelasVENCTO: TSQLTimeStampField;
    sqlParcelasVALOR: TFloatField;
    sqlParcelasPAGTO: TSQLTimeStampField;
    sqlParcelasPAGO: TFloatField;
    sqlParcelasOBS: TMemoField;
    sqlParcelasNOMECONTA: TStringField;
    sqlParcelasPREVISAO: TStringField;
    sqlParcelasDUVIDOSO: TStringField;
    dtsSQLEdit: TDataSource;
    sqlAReceberVALOR: TFloatField;
    sqlAReceberRECORRENCIA: TStringField;
    cdsAReceberVALOR: TFloatField;
    cdsAReceberRECORRENCIA: TStringField;
    sqlParcelasKFIN_CONTA: TStringField;
    cdsParcelasKFIN_CONTA: TStringField;
    cdsApropriacaoAReceber: TClientDataSet;
    cdsApropriacaoAReceberKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoAReceberKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoAReceberNOME: TStringField;
    cdsApropriacaoAReceberCODIGO: TIntegerField;
    cdsApropriacaoAReceberCLASSIFICACAO: TStringField;
    cdsApropriacaoAReceberPORCENTAGEM: TFloatField;
    cdsApropriacaoAReceberTOTAL_PORCENTAGEM: TAggregateField;
    sqlApropriacaoAReceber: TTcSQLDataSet;
    sqlApropriacaoAReceberKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoAReceberKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoAReceberPORCENTAGEM: TFloatField;
    sqlApropriacaoAReceberNOME: TStringField;
    sqlApropriacaoAReceberCODIGO: TIntegerField;
    sqlApropriacaoAReceberCLASSIFICACAO: TStringField;
    cdsARecebersqlApropriacaoAReceber: TDataSetField;
    sqlAReceberDESCR_PC_NOME: TStringField;
    sqlAReceberDESCR_PC_CLASSIFICACAO: TStringField;
    sqlAReceberDESCR_PC_CODIGO: TIntegerField;
    sqlAReceberDESCR_PC_TIPO_APRD: TStringField;
    cdsAReceberDESCR_PC_NOME: TStringField;
    cdsAReceberDESCR_PC_CLASSIFICACAO: TStringField;
    cdsAReceberDESCR_PC_CODIGO: TIntegerField;
    cdsAReceberDESCR_PC_TIPO_APRD: TStringField;
    cdsParcelasTOTAL: TAggregateField;
    sqlParcelasCHEQUE: TStringField;
    sqlParcelasDT_COMPENSACAO: TSQLTimeStampField;
    cdsParcelasCHEQUE: TStringField;
    cdsParcelasDT_COMPENSACAO: TSQLTimeStampField;
    sqlAReceberNUM_PARCELAS: TIntegerField;
    sqlAReceberDIA_VENCTO: TIntegerField;
    sqlAReceberPROXIMO_MES: TStringField;
    cdsAReceberNUM_PARCELAS: TIntegerField;
    cdsAReceberDIA_VENCTO: TIntegerField;
    cdsAReceberPROXIMO_MES: TStringField;
    sqlLstAReceberKSYSDOMAIN: TStringField;
    sqlLstAReceberKFIN_ARECEBER: TStringField;
    sqlLstAReceberNOMECONTA: TStringField;
    sqlLstAReceberHISTORICO: TStringField;
    sqlLstAReceberDATALANCTO: TSQLTimeStampField;
    sqlLstAReceberVALOR: TFloatField;
    sqlLstAReceberOBS: TMemoField;
    sqlLstAReceberATIVO: TStringField;
    cdsLstAReceberKSYSDOMAIN: TStringField;
    cdsLstAReceberKFIN_ARECEBER: TStringField;
    cdsLstAReceberNOMECONTA: TStringField;
    cdsLstAReceberHISTORICO: TStringField;
    cdsLstAReceberDATALANCTO: TSQLTimeStampField;
    cdsLstAReceberVALOR: TFloatField;
    cdsLstAReceberOBS: TMemoField;
    cdsLstAReceberATIVO: TStringField;
    sqlLstAReceberPROVISAO: TStringField;
    cdsLstAReceberPROVISAO: TStringField;
    sqlAReceberPROVISAO: TStringField;
    cdsAReceberPROVISAO: TStringField;
    sqlApropriacaoAReceberTABLENAME: TStringField;
    sqlApropriacaoAReceberTABLEKEY: TStringField;
    cdsApropriacaoAReceberTABLENAME: TStringField;
    cdsApropriacaoAReceberTABLEKEY: TStringField;
    sqlLstAReceberDOCUMENTO: TStringField;
    cdsLstAReceberDOCUMENTO: TStringField;
    sqlAReceberKSYSDOMAIN: TStringField;
    cdsAReceberKSYSDOMAIN: TStringField;
    sqlAReceberPAGTO_AVISTA: TStringField;
    cdsAReceberPAGTO_AVISTA: TStringField;
    sqlParcelasNUM_CHEQUE: TStringField;
    cdsParcelasNUM_CHEQUE: TStringField;
    sqlAReceberSYSORIGIN_TYPE: TIntegerField;
    cdsAReceberSYSORIGIN_TYPE: TIntegerField;
    sqlAReceberANUAL: TStringField;
    cdsAReceberANUAL: TStringField;
    sqlLstAReceberDOCUMENTO_: TStringField;
    cdsLstAReceberDOCUMENTO_: TStringField;
    procedure cdsLstAReceberNewRecord(DataSet: TDataSet);
    procedure cdsAReceberNewRecord(DataSet: TDataSet);
    procedure cdsParcelasNewRecord(DataSet: TDataSet);
    procedure cdsLstAReceberBeforeOpen(DataSet: TDataSet);
    procedure cdsAReceberBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsAReceberAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsParcelasVENCTOValidate(Sender: TField);
    procedure cdsAReceberBeforeInsert(DataSet: TDataSet);
    procedure cdsParcelasBeforeInsert(DataSet: TDataSet);
    procedure cdsLstAReceberVENCTOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsLstAReceberDUVIDOSOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsLstAReceberPREVISAOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsParcelasPREVISAOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsParcelasDUVIDOSOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure _DataModuleCreate(Sender: TObject);
    procedure cdsAReceberBeforePost(DataSet: TDataSet);
    procedure cdsAReceberNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsParcelasVALORValidate(Sender: TField);
    procedure cdsAReceberNOMEENTIDADESetText(Sender: TField; const Text: string);
    procedure cdsAReceberDESCR_PC_NOMESetText(Sender: TField; const Text: string);
    procedure cdsAReceberDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsAReceberBeforeDelete(DataSet: TDataSet);
    procedure cdsLstAReceberPROVISAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsApropriacaoAReceberNewRecord(DataSet: TDataSet);
    procedure cdsAReceberDOCUMENTOValidate(Sender: TField);
    procedure cdsAReceberPAGTO_AVISTAChange(Sender: TField);
    procedure cdsParcelasCHEQUEChange(Sender: TField);
    procedure cdsParcelasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FOnChangePeriodo : TNotifyEvent ;
    FOnCheckDate     : TNotifyCheckDate ;
    FHiddingByFilter : boolean ;
    FOnHiddingByFilter : TNotifyEvent ;
    FShowDuvidoso: Boolean;
    FShowEmAtraso : Boolean ;
    FShowPago     : Boolean ;
    FShowProvisao : Boolean ;
    FInicioPeriodo : TDateTime ;
    FFimPeriodo : TDateTime ;
    FKFIN_ARECEBER: string;
    FKContaFavorita    : string;
    FNomeContaFavorita : string;
    procedure DoChangePeriodo ;
    procedure InitPeriodo ;
    procedure SetParams ;
    function GetStringPeriodo: String;
    procedure SetShowDuvidoso(const Value: Boolean);
    procedure SetShowPago(const Value: Boolean);
    procedure SetShowProvisao(const Value: Boolean);
    procedure SetShowEmAtraso(const Value: Boolean);
//    function ValidaCampos : Boolean;
    function ParcelaBaixada : Boolean ;

    procedure SetPlanoContasDefault ;
    procedure ValidDocumento ;
    procedure SetKFIN_ARECEBER(const Value: string);
    procedure SetContaFavorita;
  public
    { Public declarations }
    procedure SetEntidade ( Key : String ;NomeEntidade : string ) ;
    procedure SetConta( Key, NomeConta : string; IsPreferencial : Boolean ) ;
    procedure OpenTables ; override ;
    procedure IncrementaAno ;
    procedure DecrementaAno ;
    procedure IncrementaMes ;
    procedure DecrementaMes ;
    procedure RefreshPeriodo ;
    procedure RefreshBaixa ( var BaixaTitulo : TBaixaTitulo ) ;
    property StringPeriodo : String read GetStringPeriodo ;
    property OnChangePeriodo : TNotifyEvent read FOnChangePeriodo write FOnChangePeriodo ;
    property OnCheckDate : TNotifyCheckDate read FOnCheckDate write FOnCheckDate ;
    property OnHiddingByFilter : TNotifyEvent read FOnHiddingByFilter write FOnHiddingByFilter ;
    property ShowDuvidoso : Boolean  read FShowDuvidoso write SetShowDuvidoso;
    property ShowPago : Boolean   read FShowPago write SetShowPago;
    property ShowEmAtraso : Boolean   read FShowEmAtraso write SetShowEmAtraso ;
    procedure ApplyUpdates; override;
    procedure SetFilter ( ShowProvisao : Boolean; DataInicial, DataFinal : TDateTime );
    constructor Create ( AOwner : TComponent ) ;override ;
    property  KFIN_ARECEBER : string  read FKFIN_ARECEBER write SetKFIN_ARECEBER;
    procedure PagamentoAVista;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBFinanceiro, DateUtils, Data.SQLTimSt,
     Math , Exceptions,
     CLAg5SvcFinanceiroApropriacao
     , DataSnap.DSConnect
      ;

{$R *.dfm}

resourcestring
    _ERRMSG_DOCUMENTO_JA_CADASTRADO = 'Documento fiscal já cadastrado' ;

{ TrdmFIN_OutrasReceitasDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFIN_OutrasReceitasDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
  SetContaFavorita;
end;
{$ENDIF}


procedure TFIN_OutrasReceitasDatamodule.OpenTables;
begin
  inherited;
  if not cdsLstAReceber.IsEmpty then
     cdsAReceber.RefreshRecord ;
end;

procedure TFIN_OutrasReceitasDatamodule.PagamentoAVista;
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

  if not cdsAReceberPAGTO_AVISTA.asBoolean then
    exit ;

  //TCdsSuppl.PostIfNeed( cdsPedido );


  if not( cdsAReceber.State in [ dsInsert, dsEdit] ) then
    cdsAReceber.Edit;


  //cdsAPagarHISTORICO.asString := Format( 'Lançamento de compra: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] ) ;

  cdsParcelas.Append;
  cdsParcelasDOCUMENTO.AsString := cdsAReceberDOCUMENTO.AsString;
  cdsParcelasVENCTO.AsDateTime  := Trunc ( cdsAReceberDATALANCTO.AsDateTime ) ;
  cdsParcelasVALOR.AsFloat      := cdsAReceberVALOR.AsFloat ;
  //cdsParcelasTOTAL.AsVariant   := cdsAPagarVALOR.AsVariant;
  cdsParcelasPAGTO.AsDateTime   := Trunc ( cdsAReceberDATALANCTO.AsDateTime ) ;
  cdsParcelasPAGO.AsFloat       := cdsAReceberVALOR.AsFloat ;
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
       cdsParcelasKFIN_CONTA.AsString := cdsAReceberKFIN_CONTA_PREF.AsString;
       cdsParcelasNOMECONTA.AsString  := cdsAReceberNOMECONTA.AsString;
    end;

  cdsParcelas.Post;
end;

function TFIN_OutrasReceitasDatamodule.ParcelaBaixada: Boolean;
const
 _SQL_PARCELAS = 'SELECT COUNT(1) PARCELA ' +
                 'FROM FIN_ARECEBER_PARCELAS P  ' +
                 'WHERE P.PAGTO IS NOT NULL ' +
                 '  AND P.KFIN_ARECEBER = :KFIN_ARECEBER' ;

var
  cds : TClientDataSet ;
  p : TParams ;
begin
  try
    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KFIN_ARECEBER', ptInput ).asString := cdsAReceberKFIN_ARECEBER.asString ;
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

procedure TFIN_OutrasReceitasDatamodule.cdsLstAReceberNewRecord(DataSet: TDataSet);
begin
  inherited;
//  self.InitializeKeys ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').GetKey ( cdsLstAReceberKFIN_ARECEBER ) ;
  cdsLstAReceberKSYSDOMAIN.asString := LoggedUser.DomainID ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberNewRecord(DataSet: TDataSet);
begin
  inherited;
//  self.CopyKeysFromMaster ;
  cdsAReceberKFIN_ARECEBER.asString := cdsLstAReceberKFIN_ARECEBER.asString ;
  cdsAReceberKSYSDOMAIN.asString    := cdsLstAReceberKSYSDOMAIN.asString ;
  cdsAReceberDATALANCTO.AsDateTime  := Date ;
  cdsAReceberATIVO.asString         := 'T' ;
  cdsAReceberRECORRENCIA.AsString   := 'F' ;
  cdsAReceberPROXIMO_MES.AsString   := 'F' ;
  cdsAReceberANUAL.AsString         := 'F' ;
  cdsAReceberPROVISAO.AsString      := 'F' ;
  cdsAReceberNUM_PARCELAS.AsInteger := 1 ;
  cdsAReceberDIA_VENCTO.AsInteger   := 1 ;
  cdsAReceberSYSORIGIN_TYPE.asInteger := 0 ;
  if FKContaFavorita <> '' then
   begin
     cdsAReceberKFIN_CONTA_PREF.AsString := FKContaFavorita;
     cdsAReceberNOMECONTA.AsString       := FNomeContaFavorita;
   end;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsParcelasNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsParcelasKFIN_ARECEBER_PARCELA ) ;
  cdsParcelasPREVISAO.asString := 'F' ;
  cdsParcelasDUVIDOSO.asString := 'F' ;
  cdsParcelasCHEQUE.AsString   := 'F' ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
begin
  cdsParcelasKFIN_CONTA.Clear;
  Sender.asString := Text ;
end;

procedure TFIN_OutrasReceitasDatamodule.InitPeriodo;
begin
  FInicioPeriodo := StartOfTheDay ( StartOfTheMonth( Date ) ) ;
  FFimPeriodo    := EndOfTheDay (  EndOfTheMonth( FInicioPeriodo ) ) ;
end;

procedure TFIN_OutrasReceitasDatamodule.SetParams;
begin
  with cdsLstAReceber.params do
     begin
        ParamByName ( 'KSYS$DOMAIN' ).asString := LoggedUser.DomainID ;
//        ParamByName ( 'DSP_PROVISAO' ).asString := BoolToChar ( FShowProvisao ) ;
//        ParamByName ( 'DSP_PAGO' ).asString     := BoolToChar ( FShowPago ) ;
//        ParamByName ( 'DSP_DUVIDOSO' ).asString := BoolToChar ( FShowDuvidoso ) ;
        ParamByName ( 'DI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  FInicioPeriodo ) ) ;
        ParamByName ( 'DF' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay (  FFimPeriodo  ) ) ;
        if FKFIN_ARECEBER = '' then
           ParamByName ( 'LISTALL' ).asString := 'T'
        else
           ParamByName ( 'LISTALL' ).asString := 'F' ;

        ParamByName ( 'KFIN_ARECEBER' ).asString := FKFIN_ARECEBER ;
     end ;

  DoChangePeriodo
end;


procedure TFIN_OutrasReceitasDatamodule.cdsLstAReceberBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams;
end;

procedure TFIN_OutrasReceitasDatamodule.SetPlanoContasDefault;
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
  p.CreateParam ( ftString, 'KCAD_ENTIDADE', ptInput ).asString := cdsAReceberKCAD_ENTIDADE.asString ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SELECT_PLANO, p ) ;
  LKFIN_PLANOCONTA := cds.FieldByName( 'KFIN_PLANOCONTA' ).asString ;
  LDescrPlanoConta := cds.FieldByName( 'DESC_PLANOCONTA' ).asString ;
  cds.Free ;
  p.free ;

  if LKFIN_PLANOCONTA.Trim.IsEmpty then
    exit ;

  // set required fields ....
  //LQtdeIsNull := cdsAReceberQTDE.IsNull ;
  //if LQtdeIsNull then
  //   cdsAReceberQTDE.asFloat := 1 ;

  //if cdsAReceberKFIN_PLANOCONTA.AsString  <> LKFIN_PlanoConta then
   with cdsApropriacaoAReceber do
     begin
       first ;
       while not eof do
         Delete ;
     end;

  cdsAReceberDESCR_PC_NOME.AsString   :=  LDescrPlanoConta ;
  cdsAReceberKFIN_PLANOCONTA.AsString :=  LKFIN_PLANOCONTA ;

  //add rateio ....

  SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
                           'CAD_CLIENTES',  cdsAReceberKCAD_ENTIDADE.asString,
                           'FIN_ARECEBER', cdsAReceberKFIN_AReceber.asString,
                           cdsApropriacaoAReceber,
                           SvcFinanceiroApropriacaoDefault.NeedCC( LKFIN_PLANOCONTA ) );

  if LQtdeIsNull then
    begin
     // return required fields ....
     ////cdsAReceberQTDE.OnValidate := nil ;
     //cdsAReceberQTDE.Clear ;
     ////cdsAReceberQTDE.OnValidate := cdsAReceberQTDEValidate ;
    end;


end;

procedure TFIN_OutrasReceitasDatamodule.SetEntidade(Key: String; NomeEntidade: string ) ;
var
  LBeforePost : TDataSetNotifyEvent ;
begin
  LBeforePost            := cdsAReceber.BeforePost ;
  cdsAReceber.BeforePost   := nil ;
  try
    if not ( cdsAReceber.State in [dsInsert,dsEdit] ) then
       cdsAReceber.Edit ;

    cdsAReceberNOMEENTIDADE.asString  := NomeEntidade ;
    cdsAReceberKCAD_ENTIDADE.asString := Key ;

    SetPlanoContasDefault ;
  except
    cdsAReceber.BeforePost := LBeforePost ;
  end;
end;

procedure TFIN_OutrasReceitasDatamodule.SetFilter(ShowProvisao: Boolean; DataInicial, DataFinal: TDateTime);
begin
  if    ( FShowProvisao   = ShowProvisao )
    and ( FInicioPeriodo  = StartOfTheDay ( DataInicial ) )
    and ( FFimPeriodo     = EndOfTheDay ( DataFinal ) ) then
      exit ;

  FShowProvisao  := ShowProvisao ;
  FInicioPeriodo := StartOfTheDay ( DataInicial ) ;
  FFimPeriodo    := EndOfTheDay ( DataFinal ) ;
  SetParams ;
  self.RefreshList ;
end;


procedure TFIN_OutrasReceitasDatamodule.SetKFIN_ARECEBER(const Value: string);
begin
  FKFIN_ARECEBER := Value;
end;

procedure TFIN_OutrasReceitasDatamodule.SetConta(Key, NomeConta: string; IsPreferencial : Boolean ) ;
begin
  if IsPreferencial then
    begin
      if not ( cdsAReceber.State in [dsInsert,dsEdit] ) then
        cdsAReceber.Edit ;

      cdsAReceberKFIN_CONTA_PREF.AsString := Key ;
      cdsAReceberNOMECONTA.AsString       := NomeConta ;
    end
  else
    begin
      if not( cdsParcelas.State in [dsInsert, dsEdit] ) then
        cdsParcelas.Edit;

      cdsParcelasKFIN_CONTA.AsString := Key;
      cdsParcelasNOMECONTA.AsString  := NomeConta;
    end;
end;

procedure TFIN_OutrasReceitasDatamodule.SetContaFavorita;
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

procedure TFIN_OutrasReceitasDatamodule.IncrementaAno;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, 12 ) ) ;
     FFimPeriodo     := EndOfTheDay ( EndOfTheMonth( FInicioPeriodo ) );
     RefreshPeriodo;
end;

procedure TFIN_OutrasReceitasDatamodule.IncrementaMes;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, 1 ) );
     FFimPeriodo     := EndOfTheDay ( EndOfTheMonth( FInicioPeriodo ) );
     RefreshPeriodo;
end;


procedure TFIN_OutrasReceitasDatamodule.DecrementaMes;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, -1 ) ) ;
     FFimPeriodo     := EndOfTheDay ( EndOfTheMonth( FInicioPeriodo ) ) ;
     RefreshPeriodo;
end;

procedure TFIN_OutrasReceitasDatamodule.DecrementaAno;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, -12 ) ) ;
     FFimPeriodo     := EndOfTheDay   ( EndOfTheMonth( FInicioPeriodo ) ) ;
     RefreshPeriodo;
end;

procedure TFIN_OutrasReceitasDatamodule.RefreshPeriodo;
begin
//     lstRecebidoAgora.Clear ;
     cdsLstAReceber.CancelUpdates ;
     SetParams ;
     cdsLstAReceber.Refresh ;
end;

function TFIN_OutrasReceitasDatamodule.GetStringPeriodo: String;
begin
   Result := formatDateTime ( 'mmmm/yyyy', FInicioPeriodo ) ;
end;

procedure TFIN_OutrasReceitasDatamodule.DoChangePeriodo;
begin
    if Assigned ( FOnChangePeriodo ) then
       FOnChangePeriodo ( self ) ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
var
   lFound : boolean ;
   pBookmark : TBookmark;
begin
  inherited;
  with cdsParcelas do
     begin
        DisableControls ;
        pBookmark := GetBookmark ;
        cdsParcelas.First;
        Repeat
           lFound := inRange ( cdsParcelasVENCTO.asDateTime , FInicioPeriodo, FFimPeriodo ) ;
           cdsParcelas.Next ;
        Until ( lFound ) or ( cdsParcelas.EOF ) ;
        GotoBookmark( pBookmark );
        FreeBookmark( pBookmark );
        EnableControls ;
     end ;

//  if ( cdsLstAReceberKFIN_AReceber_PARCELA.IsNull ) and ( lFound ) then
//     begin
//       cdsLstAReceber.Edit ;
//       cdsLstAReceberKFIN_AReceber_PARCELA.AsString := cdsParcelasKFIN_AReceber_PARCELA.AsString ;
//     end ;

  FHiddingByFilter := not lFound ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberBeforeDelete(DataSet: TDataSet);
begin
  if cdsAReceberSYSORIGIN_TYPE.asInteger = 2 then
    raise Warning.Create( 'Receita incluida via sincronismo.' + #10#13 + 'Não pode ser excluído.' );

  if ParcelaBaixada then
    raise Warning.Create( 'Existe(m) parcela(s) já baixada(s).' + #10#13 + 'Não pode ser excluída.' );
end;

procedure TFIN_OutrasReceitasDatamodule.cdsParcelasVALORValidate(Sender: TField);
begin
  if Sender.AsFloat < 0 then
    raise Warning.Create('Valor da parcela inválido.');
end;

procedure TFIN_OutrasReceitasDatamodule.cdsParcelasVENCTOValidate(Sender: TField);
begin
  if Sender.IsNull then
    raise Warning.Create('Data de vencimento inválida.');
//  if assigned ( FOnCheckDate ) then
//     if not FOnCheckDate ( TDateTimeField ( Sender ).AsDateTime ) then
//        Abort ;
end;

procedure TFIN_OutrasReceitasDatamodule.ApplyUpdates;
var
  LErrMsg : TStringBuilder ;
  LValorTotalParcelas : double ;
begin

  // código que estava no before post ... problema ao fazer resize, grid movimenta.
  LErrMsg := TStringBuilder.Create ;

  try
    TCDSSuppl.PostIfNeed(cdsParcelas) ;

    if cdsParcelas.IsEmpty then
      raise Warning.Create('Deve ter ao menos uma parcela');

    if ( cdsAReceberPAGTO_AVISTA.AsBoolean )  then
      LValorTotalParcelas := cdsAReceberVALOR.asVariant
    else
    if VarIsNull( cdsParcelasTOTAL.asVariant ) then
      LValorTotalParcelas := 0
    else
      LValorTotalParcelas := cdsParcelasTOTAL.asVariant ;

    if ( cdsAReceberRECORRENCIA.AsString = 'F' ) then
      cdsAReceberVALOR.AsFloat := LValorTotalParcelas ;

    if ( LValorTotalParcelas = 0 ) then
      LErrMsg.AppendLine('O valor da receita não pode ser zero.');

    if ( not cdsParcelasTOTAL.IsNull ) and ( cdsAReceberRECORRENCIA.AsString = 'F' ) then
      cdsAReceberVALOR.AsFloat := cdsParcelasTOTAL.AsVariant;

    if cdsAReceberKFIN_PLANOCONTA.IsNull then
      LErrMsg.AppendLine('Apropriação deve ser pesquisada/selecionada.');

    if LErrMsg.Length > 0 then
       raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;
 /// end beforepost  ....



  if ( cdsAReceberKFIN_PLANOCONTA.AsString.Trim <> '' ) then
    if SvcFinanceiroApropriacaoDefault.NeedCC ( cdsAReceberKFIN_PLANOCONTA.AsString ) then
      if cdsApropriacaoAReceber.IsEmpty then
          raise Warning.Create('é necessário informar ao menos um centro de custos.');


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
      if (( cdsParcelasCHEQUE.AsBoolean ) or ( not cdsParcelasNUM_CHEQUE.IsNull )) and
         ( cdsParcelasPAGTO.IsNull ) then
         raise Warning.Create('Cheque só pode ser inserido para pagamentos à vista')
    end;

///  if not ValidaCampos then
///    inherited;

  inherited;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
  if ( FHiddingByFilter ) and Assigned ( FOnHiddingByFilter ) then
     FOnHiddingByFilter ( Self ) ;
  FHiddingByFilter := False ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsLstAReceber.IsEmpty ) and not ( cdsLstAReceber.State in [dsInsert,dsEdit] )  then
     cdsLstAReceber.Append ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberBeforePost(DataSet: TDataSet);
var
  LErrMsg : TStringBuilder ;
  LValorTotalParcelas : double ;
begin
(*
  LErrMsg := TStringBuilder.Create ;

  try
    TCDSSuppl.PostIfNeed(cdsParcelas) ;

    if cdsParcelas.IsEmpty then
      raise Warning.Create('Deve ter ao menos uma parcela');

    if ( cdsAReceberPAGTO_AVISTA.AsBoolean )  then
      LValorTotalParcelas := cdsAReceberVALOR.asVariant
    else
    if VarIsNull( cdsParcelasTOTAL.asVariant ) then
      LValorTotalParcelas := 0
    else
      LValorTotalParcelas := cdsParcelasTOTAL.asVariant ;

    if ( cdsAReceberRECORRENCIA.AsString = 'F' ) then
      cdsAReceberVALOR.AsFloat := LValorTotalParcelas ;

    if ( LValorTotalParcelas = 0 ) then
      LErrMsg.AppendLine('O valor da receita não pode ser zero.');

    if ( not cdsParcelasTOTAL.IsNull ) and ( cdsAReceberRECORRENCIA.AsString = 'F' ) then
      cdsAReceberVALOR.AsFloat := cdsParcelasTOTAL.AsVariant;

    if cdsAReceberKFIN_PLANOCONTA.IsNull then
      LErrMsg.AppendLine('Apropriação deve ser pesquisada/selecionada.');

    if LErrMsg.Length > 0 then
       raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;
*)
end;

procedure TFIN_OutrasReceitasDatamodule.cdsParcelasBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsAReceber.IsEmpty ) and not ( cdsAReceber.State in [dsInsert,dsEdit] )  then
     cdsAReceber.Append ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsParcelasBeforePost(
  DataSet: TDataSet);
begin

  if (( cdsAReceberPAGTO_AVISTA.AsBoolean ) and ( cdsParcelasCHEQUE.AsBoolean )) or
     (( not cdsParcelasCHEQUE.AsBoolean ) and ( cdsParcelasPAGTO.IsNull))  then
     cdsParcelasDT_COMPENSACAO.Clear;


end;

procedure TFIN_OutrasReceitasDatamodule.cdsParcelasCHEQUEChange(Sender: TField);
begin
  if cdsParcelasCHEQUE.asBoolean then
      cdsParcelasDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasPAGTO.AsSQLTimeStamp ;
      cdsParcelasNUM_CHEQUE.Clear ;
    end ;
end;

procedure TFIN_OutrasReceitasDatamodule.SetShowDuvidoso(const Value: Boolean);
begin
  FShowDuvidoso := Value;
  RefreshPeriodo ;
end;

procedure TFIN_OutrasReceitasDatamodule.SetShowPago(const Value: Boolean);
begin
  FShowPago := Value;
  RefreshPeriodo ;
end;

procedure TFIN_OutrasReceitasDatamodule.SetShowProvisao(const Value: Boolean);
begin
  FShowProvisao := Value;
  RefreshPeriodo ;
end;

(*
function TFIN_OutrasReceitasDatamodule.ValidaCampos: Boolean;
var
  ErrMsg : string ;
  i : Integer ;

  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  ErrMsg := '' ;

  for i := 0 to cdsAReceber.FieldCount - 1 do
    begin
      if ( ( cdsAReceber.Fields[i].Required = True ) and ( cdsAReceber.Fields[i].IsNull ) ) then
        AddErr( cdsAReceber.Fields[i].DisplayLabel ) ;
    end;

  Result := ErrMsg <> '';

  if Result then
    raise Warning.Create( 'Campos requeridos não preenchidos' + #13#10#13#10 + ErrMsg );

  Result := cdsParcelas.IsEmpty ;

  if Result then
    raise Warning.Create( 'Deve ter ao menos uma parcela.' );
end;
*)
procedure TFIN_OutrasReceitasDatamodule.ValidDocumento;
begin
  if  ( cdsAReceberDOCUMENTO.isNull   )
   or ( Trim ( cdsAReceberDOCUMENTO.AsString  ) = '')  then
     exit ;

  if TSQLSuppl.CheckExistsIn(    'FIN_ARECEBER',
                                 'DOCUMENTO', cdsAReceberDOCUMENTO.asString,
                                 Format ( 'KFIN_ARECEBER <> %s ', [ QuotedStr( cdsAReceberKFIN_ARECEBER.asString ) ] ),
                                 TSQLConnection ( DBResources[ 'FINANCEIRO' ].Connection ) ) then
        Raise Warning.Create( _ERRMSG_DOCUMENTO_JA_CADASTRADO ) ;
end;



procedure TFIN_OutrasReceitasDatamodule.cdsLstAReceberVENCTOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

  if  YearOf ( Sender.AsDateTime )  <> YearOf ( FInicioPeriodo ) then
    Text := formatDateTime ( 'dd/mmm/yy', Sender.AsDateTime )
  else if  MonthOf ( Sender.AsDateTime )  <> MonthOf ( FInicioPeriodo ) then
    Text := formatDateTime ( 'dd/mmm', Sender.AsDateTime )
  else
    Text := formatDateTime ( 'dd', Sender.AsDateTime )
end;

procedure TFIN_OutrasReceitasDatamodule.cdsLstAReceberDUVIDOSOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;

   if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
       Text := BooleanFieldToText ( Sender ) ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsLstAReceberPREVISAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;

   if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
      Text := BooleanFieldToText ( Sender ) ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsLstAReceberPROVISAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

  if DisplayText then
    if Sender.asString = 'T' then
      Text := 'Sim'
    else if Sender.asString = 'F' then
      Text := 'Não';
end;

procedure TFIN_OutrasReceitasDatamodule.cdsParcelasPREVISAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
       Text := BooleanFieldToText ( Sender ) ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsParcelasDUVIDOSOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
      Text := BooleanFieldToText ( Sender ) ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberDESCR_PC_NOMESetText(Sender: TField; const Text: string);
begin
  with cdsApropriacaoAReceber do
    begin
      First;
      while not Eof do
        Delete;
    end;

  cdsAReceberKFIN_PLANOCONTA.Clear ;
  Sender.asString := Text ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberDOCUMENTOValidate(
  Sender: TField);
begin
    ValidDocumento ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberNOMECONTASetText(Sender: TField; const Text: string);
begin
  cdsAReceberKFIN_CONTA_PREF.Clear;
  Sender.asString := Text ;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberNOMEENTIDADESetText(Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsAReceberKCAD_ENTIDADE.Clear;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsAReceberPAGTO_AVISTAChange(
  Sender: TField);
begin
 cdsAReceberPAGTO_AVISTA.OnChange := nil ;
 try
   //if Sender.asBoolean then
     PagamentoAVista;
 finally
     cdsAReceberPAGTO_AVISTA.OnChange := cdsAReceberPAGTO_AVISTAChange
 end;
end;

procedure TFIN_OutrasReceitasDatamodule.cdsApropriacaoAReceberNewRecord(
  DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoAReceberKFIN_APROPRIACAO );
  cdsApropriacaoAReceberTABLENAME.AsString := 'FIN_ARECEBER' ;
  cdsApropriacaoAReceberTABLEKEY.AsString  := cdsAReceberKFIN_ARECEBER.AsString;
end;

procedure TFIN_OutrasReceitasDatamodule.SetShowEmAtraso(const Value: Boolean);
begin
  FShowEmAtraso := Value;
  RefreshPeriodo ;
end;

procedure TFIN_OutrasReceitasDatamodule.RefreshBaixa(var BaixaTitulo: TBaixaTitulo);
begin
//    cdsLstAReceber.edit ;
//    cdsLstAReceberPAGTO.AsDateTime := BaixaTitulo.Data ;
//    cdsLstAReceberVALOR.asCurrency := BaixaTitulo.Valor ;
//    cdsLstAReceberNOMECONTA.asString := BaixaTitulo.NomeConta ;
//    cdsLstAReceber.post ;
//    cdsAReceber.Refresh ;
end;


procedure TFIN_OutrasReceitasDatamodule._DataModuleCreate(Sender: TObject);
begin
  inherited;
  FShowDuvidoso := False ;
  FShowPago     := False ;
  FShowEmAtraso := True ;
//  InitPeriodo;
end;


end.
