unit UFIN_OutrasDespesasDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  FIN_APagarTypes,
  Dialogs, Tc.Data.SQLExpr ;

type

  TNotifyCheckDate = function ( Date : TDateTime ) : boolean of object ;

  TFIN_OutrasDespesasDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstAPagar: TClientDataSet;
    cdsAPagar: TClientDataSet;
    dtsList: TDataSource;
    cdsParcelas: TClientDataSet;
    cdsAPagarKFIN_APAGAR: TStringField;
    cdsAPagarTABLENAME: TStringField;
    cdsAPagarKCAD_ENTIDADE: TStringField;
    cdsAPagarTABLEKEY: TStringField;
    cdsAPagarNOMEENTIDADE: TStringField;
    cdsAPagarHISTORICO: TStringField;
    cdsAPagarDOCUMENTO: TStringField;
    cdsAPagarDATALANCTO: TSQLTimeStampField;
    cdsParcelasKFIN_APAGAR_PARCELA: TStringField;
    cdsParcelasKFIN_APAGAR: TStringField;
    cdsParcelasDOCUMENTO: TStringField;
    cdsParcelasVENCTO: TSQLTimeStampField;
    cdsParcelasVALOR: TFloatField;
    cdsParcelasPAGTO: TSQLTimeStampField;
    cdsParcelasPAGO: TFloatField;
    cdsParcelasOBS: TMemoField;
    cdsAPagarsqlParcelas: TDataSetField;
    cdsAPagarKFIN_CONTA_PREF: TStringField;
    cdsAPagarKFIN_PLANOCONTA: TStringField;
    cdsParcelasKFIN_CONTA: TStringField;
    cdsAPagarNOMECONTA: TStringField;
    cdsAPagarOBS: TMemoField;
    cdsParcelasNOMECONTA: TStringField;
    cdsParcelasPREVISAO: TStringField;
    cdsParcelasDUVIDOSO: TStringField;
    cdsAPagarATIVO: TStringField;
    dspLstApagar: TDataSetProvider;
    dspApagar: TDataSetProvider;
    sqlLstApagar: TTcSQLDataSet;
    sqlApagar: TTcSQLDataSet;
    sqlApagarKFIN_APAGAR: TStringField;
    sqlApagarTABLENAME: TStringField;
    sqlApagarKCAD_ENTIDADE: TStringField;
    sqlApagarTABLEKEY: TStringField;
    sqlApagarNOMEENTIDADE: TStringField;
    sqlApagarHISTORICO: TStringField;
    sqlApagarDOCUMENTO: TStringField;
    sqlApagarDATALANCTO: TSQLTimeStampField;
    sqlApagarKFIN_CONTA_PREF: TStringField;
    sqlApagarKFIN_PLANOCONTA: TStringField;
    sqlApagarNOMECONTA: TStringField;
    sqlApagarOBS: TMemoField;
    sqlApagarATIVO: TStringField;
    sqlParcelas: TTcSQLDataSet;
    sqlParcelasKFIN_APAGAR_PARCELA: TStringField;
    sqlParcelasKFIN_APAGAR: TStringField;
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
    dtsSQLEdit: TDataSource;
    sqlApagarKSYSDOMAIN: TStringField;
    cdsAPagarKSYSDOMAIN: TStringField;
    sqlApagarDESCR_PC_NOME: TStringField;
    sqlApagarDESCR_PC_CLASSIFICACAO: TStringField;
    sqlApagarDESCR_PC_CODIGO: TIntegerField;
    sqlApagarDESCR_PC_TIPO_APRD: TStringField;
    cdsAPagarDESCR_PC_NOME: TStringField;
    cdsAPagarDESCR_PC_CLASSIFICACAO: TStringField;
    cdsAPagarDESCR_PC_CODIGO: TIntegerField;
    cdsAPagarDESCR_PC_TIPO_APRD: TStringField;
    cdsApropriacaoAPagar: TClientDataSet;
    cdsApropriacaoAPagarKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoAPagarKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoAPagarNOME: TStringField;
    cdsApropriacaoAPagarCODIGO: TIntegerField;
    cdsApropriacaoAPagarCLASSIFICACAO: TStringField;
    cdsApropriacaoAPagarPORCENTAGEM: TFloatField;
    cdsApropriacaoAPagarTOTAL_PORCENTAGEM: TAggregateField;
    sqlApropriacaoAPagar: TTcSQLDataSet;
    sqlApropriacaoAPagarKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoAPagarKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoAPagarPORCENTAGEM: TFloatField;
    sqlApropriacaoAPagarNOME: TStringField;
    sqlApropriacaoAPagarCODIGO: TIntegerField;
    sqlApropriacaoAPagarCLASSIFICACAO: TStringField;
    cdsAPagarsqlApropriacaoAPagar: TDataSetField;
    sqlApagarVALOR: TFloatField;
    cdsAPagarVALOR: TFloatField;
    sqlApagarRECORRENCIA: TStringField;
    cdsAPagarRECORRENCIA: TStringField;
    cdsParcelasTOTAL: TAggregateField;
    sqlParcelasCHEQUE: TStringField;
    sqlParcelasDT_COMPENSACAO: TSQLTimeStampField;
    cdsParcelasCHEQUE: TStringField;
    cdsParcelasDT_COMPENSACAO: TSQLTimeStampField;
    sqlApagarNUM_PARCELAS: TIntegerField;
    sqlApagarDIA_VENCTO: TIntegerField;
    sqlApagarPROXIMO_MES: TStringField;
    cdsAPagarNUM_PARCELAS: TIntegerField;
    cdsAPagarDIA_VENCTO: TIntegerField;
    cdsAPagarPROXIMO_MES: TStringField;
    cdsLstAPagarKSYSDOMAIN: TStringField;
    cdsLstAPagarKFIN_APAGAR: TStringField;
    cdsLstAPagarHISTORICO: TStringField;
    cdsLstAPagarDATALANCTO: TSQLTimeStampField;
    cdsLstAPagarNOMECONTA: TStringField;
    cdsLstAPagarPROVISAO: TStringField;
    cdsLstAPagarVALOR: TFloatField;
    cdsLstAPagarOBS: TMemoField;
    sqlLstApagarKSYSDOMAIN: TStringField;
    sqlLstApagarKFIN_APAGAR: TStringField;
    sqlLstApagarHISTORICO: TStringField;
    sqlLstApagarDATALANCTO: TSQLTimeStampField;
    sqlLstApagarNOMECONTA: TStringField;
    sqlLstApagarPROVISAO: TStringField;
    sqlLstApagarVALOR: TFloatField;
    sqlLstApagarOBS: TMemoField;
    sqlLstApagarATIVO: TStringField;
    cdsLstAPagarATIVO: TStringField;
    sqlApagarPROVISAO: TStringField;
    cdsAPagarPROVISAO: TStringField;
    sqlApropriacaoAPagarTABLENAME: TStringField;
    sqlApropriacaoAPagarTABLEKEY: TStringField;
    cdsApropriacaoAPagarTABLENAME: TStringField;
    cdsApropriacaoAPagarTABLEKEY: TStringField;
    sqlLstApagarDOCUMENTO: TStringField;
    cdsLstAPagarDOCUMENTO: TStringField;
    sqlApagarPAGTO_AVISTA: TStringField;
    cdsAPagarPAGTO_AVISTA: TStringField;
    sqlParcelasNUM_CHEQUE: TStringField;
    cdsParcelasNUM_CHEQUE: TStringField;
    sqlApagarSYSORIGIN_TYPE: TIntegerField;
    cdsAPagarSYSORIGIN_TYPE: TIntegerField;
    sqlApagarANUAL: TStringField;
    cdsAPagarANUAL: TStringField;
    sqlLstApagarDOCUMENTO_: TStringField;
    cdsLstAPagarDOCUMENTO_: TStringField;
    procedure cdsLstAPagarNewRecord(DataSet: TDataSet);
    procedure cdsAPagarNewRecord(DataSet: TDataSet);
    procedure cdsParcelasNewRecord(DataSet: TDataSet);
    procedure cdsLstAPagarBeforeOpen(DataSet: TDataSet);
    procedure cdsAPagarBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsParcelasVENCTOValidate(Sender: TField);
    procedure cdsAPagarAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsAPagarBeforeInsert(DataSet: TDataSet);
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
    procedure cdsAPagarBeforePost(DataSet: TDataSet);
    procedure cdsParcelasVALORValidate(Sender: TField);
    procedure cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsAPagarNOMECONTASetText(Sender: TField; const Text: string);
    procedure cdsAPagarNOMEENTIDADESetText(Sender: TField; const Text: string);
    procedure cdsAPagarDESCR_PC_NOMESetText(Sender: TField; const Text: string);
    procedure cdsAPagarDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsAPagarBeforeDelete(DataSet: TDataSet);
    procedure cdsLstAPagarPROVISAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsApropriacaoAPagarNewRecord(DataSet: TDataSet);
    procedure cdsAPagarDOCUMENTOValidate(Sender: TField);
    procedure cdsAPagarKCAD_ENTIDADEValidate(Sender: TField);
    procedure cdsParcelasCHEQUEChange(Sender: TField);
    procedure cdsAPagarPAGTO_AVISTAChange(Sender: TField);
    procedure cdsParcelasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
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
    FKFIN_APAGAR: string;
    FKContaFavorita    : string;
    FNomeContaFavorita : string;
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

    procedure SetPlanoContasDefault ;
    procedure ValidDocumento ;
    procedure SetKFIN_APAGAR(const Value: string);
    procedure SetContaFavorita;
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
    property  KFIN_APAGAR : string  read FKFIN_APAGAR write SetKFIN_APAGAR;
    procedure PagamentoAVista;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBFinanceiro,
     DateUtils, Data.SQLTimSt, Math ,
     CL.Ag5.Exceptions,
     CLAg5SvcFinanceiroApropriacao
     , DataSnap.DSConnect
;
{$R *.dfm}

{ TrdmFIN_OutrasDespesasDatamodule }

resourcestring
    _ERRMSG_DOCUMENTO_JA_CADASTRADO = 'Documento fiscal já cadastrado' ;


{$IFDEF _DSServer}
{$ELSE}

constructor TFIN_OutrasDespesasDatamodule.Create(AOwner: TComponent);
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


{ TFIN_OutrasDespesasDatamodule }


procedure TFIN_OutrasDespesasDatamodule.OpenTables;
begin
  inherited;
  if not cdsLstAPagar.IsEmpty then
     cdsAPagar.RefreshRecord ;
end;

procedure TFIN_OutrasDespesasDatamodule.PagamentoAVista;
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

  if not cdsAPagarPAGTO_AVISTA.asBoolean then
    exit ;

  //TCdsSuppl.PostIfNeed( cdsPedido );


  if not( cdsAPagar.State in [ dsInsert, dsEdit] ) then
    cdsAPagar.Edit;


  //cdsAPagarHISTORICO.asString := Format( 'Lançamento de compra: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] ) ;

  cdsParcelas.Append;
  cdsParcelasDOCUMENTO.AsString := cdsAPagarDOCUMENTO.AsString;
  cdsParcelasVENCTO.AsDateTime  := Trunc ( cdsAPagarDATALANCTO.AsDateTime ) ;
  cdsParcelasVALOR.AsFloat      := cdsAPagarVALOR.AsFloat ;
  //cdsParcelasTOTAL.AsVariant   := cdsAPagarVALOR.AsVariant;
  cdsParcelasPAGTO.AsDateTime   := Trunc ( cdsAPagarDATALANCTO.AsDateTime ) ;
  cdsParcelasPAGO.AsFloat       := cdsAPagarVALOR.AsFloat ;
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
       cdsParcelasKFIN_CONTA.AsString := cdsAPagarKFIN_CONTA_PREF.AsString;
       cdsParcelasNOMECONTA.AsString  := cdsAPagarNOMECONTA.AsString;
    end;

  cdsParcelas.Post;
end;

function TFIN_OutrasDespesasDatamodule.ParcelaBaixada: Boolean;
const
 _SQL_PARCELAS = 'SELECT COUNT(1) PARCELA ' +
                 'FROM FIN_APAGAR_PARCELAS P  ' +
                 'WHERE P.PAGTO IS NOT NULL ' +
                 '  AND P.KFIN_APAGAR = :KFIN_PAGAR' ;

var
  cds : TClientDataSet ;
  p : TParams ;
begin

  try
    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KFIN_PAGAR', ptInput ).asString := cdsAPagarKFIN_APAGAR.asString ;
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

procedure TFIN_OutrasDespesasDatamodule.cdsLstAPagarNewRecord(DataSet: TDataSet);
begin
  inherited;
//  self.InitializeKeys ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').GetKey ( cdsLstAPagarKFIN_APAGAR ) ;
  cdsLstAPagarKSYSDOMAIN.asString := LoggedUser.DomainID ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarNewRecord(DataSet: TDataSet);
begin
  inherited;
//  self.CopyKeysFromMaster ;
  cdsAPagarKFIN_APAGAR.asString   := cdsLstAPagarKFIN_APAGAR.asString ;
  cdsAPagarKSYSDOMAIN.asString    := cdsLstAPagarKSYSDOMAIN.asString ;
  cdsAPagarDATALANCTO.AsDateTime  := Date ;
  cdsAPagarATIVO.asString         := 'T' ;
  cdsAPagarRECORRENCIA.AsString   := 'F' ;
  cdsAPagarPROXIMO_MES.AsString   := 'F' ;
  cdsAPagarANUAL.AsString         := 'F' ;
  cdsAPagarPROVISAO.AsString      := 'F' ;
  cdsAPagarNUM_PARCELAS.AsInteger := 1 ;
  cdsAPagarDIA_VENCTO.AsInteger   := 1 ;
  cdsAPagarSYSORIGIN_TYPE.asInteger := 0 ;
  if FKContaFavorita <> '' then
   begin
     cdsAPagarKFIN_CONTA_PREF.AsString := FKContaFavorita;
     cdsAPagarNOMECONTA.AsString       := FNomeContaFavorita;
   end;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsParcelasNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsParcelasKFIN_APAGAR_PARCELA ) ;
  cdsParcelasPREVISAO.asString := 'F' ;
  cdsParcelasDUVIDOSO.asString := 'F' ;
  cdsParcelasCHEQUE.AsString   := 'F' ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsParcelasNOMECONTASetText(Sender: TField; const Text: string);
begin
  cdsParcelasKFIN_CONTA.Clear;
  Sender.asString := Text ;
end;

procedure TFIN_OutrasDespesasDatamodule.InitPeriodo;
begin
  FInicioPeriodo := StartOfTheDay ( StartOfTheMonth( Date ) ) ;
  FFimPeriodo    := EndOfTheDay (  EndOfTheMonth( FInicioPeriodo ) ) ;
end;

procedure TFIN_OutrasDespesasDatamodule.SetParams;
begin
  with cdsLstAPagar.params do
     begin
        ParamByName ( 'KSYS$DOMAIN' ).asString := LoggedUser.DomainID ;
//        ParamByName ( 'DSP_PROVISAO' ).asString := BoolToChar ( FShowProvisao ) ;
//        ParamByName ( 'DSP_PAGO' ).asString     := BoolToChar ( FShowPago ) ;
//        ParamByName ( 'DSP_DUVIDOSO' ).asString := BoolToChar ( FShowDuvidoso ) ;
        ParamByName ( 'DI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  FInicioPeriodo ) ) ;
        ParamByName ( 'DF' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay   (  FFimPeriodo  ) ) ;

        if FKFIN_APAGAR = '' then
           ParamByName ( 'LISTALL' ).asString := 'T'
        else
           ParamByName ( 'LISTALL' ).asString := 'F' ;

        ParamByName ( 'KFIN_APAGAR' ).asString := FKFIN_APAGAR ;

     end ;

  DoChangePeriodo ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsLstAPagarBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams;
end;




procedure TFIN_OutrasDespesasDatamodule.SetPlanoContasDefault ;
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
  p.CreateParam ( ftString, 'KCAD_ENTIDADE', ptInput ).asString := cdsAPagarKCAD_ENTIDADE.asString ;
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
   with cdsApropriacaoApagar do
     begin
       first ;
       while not eof do
         Delete ;
     end;

  cdsAPagarDESCR_PC_NOME.AsString   :=  LDescrPlanoConta ;
  cdsAPagarKFIN_PLANOCONTA.AsString :=  LKFIN_PLANOCONTA ;

  //add rateio ....

  SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
                           'CAD_FORNECEDORES',  cdsAPagarKCAD_ENTIDADE.asString,
                           'FIN_APAGAR', cdsAPagarKFIN_APAGAR.asString,
                           cdsApropriacaoAPagar,
                           SvcFinanceiroApropriacaoDefault.NeedCC( LKFIN_PLANOCONTA ));

  if LQtdeIsNull then
    begin
     // return required fields ....
     ////cdsApagarQTDE.OnValidate := nil ;
     //cdsApagarQTDE.Clear ;
     ////cdsApagarQTDE.OnValidate := cdsApagarQTDEValidate ;
    end;


end;


procedure TFIN_OutrasDespesasDatamodule.SetEntidade(Key : String; NomeEntidade: string ) ;
var
  LBeforePost : TDataSetNotifyEvent ;
begin
  LBeforePost            := cdsAPagar.BeforePost ;
  cdsAPagar.BeforePost := nil ;
  try
    if not ( cdsAPagar.State in [dsInsert,dsEdit] ) then
       cdsAPagar.Edit ;

    cdsAPagarNOMEENTIDADE.asString  := NomeEntidade ;
    cdsAPagarKCAD_ENTIDADE.asString := Key ;

    SetPlanoContasDefault ;
  except
    cdsAPagar.BeforePost := LBeforePost ;
  end;

end;

procedure TFIN_OutrasDespesasDatamodule.SetFilter(ShowProvisao: Boolean; DataInicial, DataFinal: TDateTime);
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


procedure TFIN_OutrasDespesasDatamodule.SetKFIN_APAGAR(const Value: string);
begin
  FKFIN_APAGAR := Value;
end;

procedure TFIN_OutrasDespesasDatamodule.SetConta( Key, NomeConta: string; IsPreferencial : Boolean ) ;
begin
  if IsPreferencial then
    begin
      if not ( cdsAPagar.State in [dsInsert,dsEdit] ) then
        cdsAPagar.Edit ;

      cdsAPagarKFIN_CONTA_PREF.AsString := Key ;
      cdsAPagarNOMECONTA.AsString       := NomeConta ;
    end
  else
    begin
      if not( cdsParcelas.State in [dsInsert, dsEdit] ) then
        cdsParcelas.Edit;

      cdsParcelasKFIN_CONTA.AsString := Key;
      cdsParcelasNOMECONTA.AsString  := NomeConta;
    end;
end;

procedure TFIN_OutrasDespesasDatamodule.SetContaFavorita;
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

procedure TFIN_OutrasDespesasDatamodule.DecrementaAno;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, -12 ) );
     FFimPeriodo     := EndOfTheDay   ( EndOfTheMonth( FInicioPeriodo ) ) ;
     RefreshPeriodo;
end;

procedure TFIN_OutrasDespesasDatamodule.DecrementaMes;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, -1 ) );
     FFimPeriodo     := EndOfTheDay   ( EndOfTheMonth( FInicioPeriodo ) ) ;
     RefreshPeriodo;
end;

procedure TFIN_OutrasDespesasDatamodule.IncrementaAno;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, 12 ) );
     FFimPeriodo     := EndOfTheDay   ( EndOfTheMonth( FInicioPeriodo ) ) ;
     RefreshPeriodo;
end;

procedure TFIN_OutrasDespesasDatamodule.IncrementaMes;
begin
     FInicioPeriodo  := StartOfTheDay ( IncMonth( FInicioPeriodo, 1 ) ) ;
     FFimPeriodo     := EndOfTheDay   ( EndOfTheMonth( FInicioPeriodo ) ) ;
     RefreshPeriodo;
end;

procedure TFIN_OutrasDespesasDatamodule.RefreshPeriodo;
begin
//     lstPagoAgora.Clear ;
     cdsLstAPagar.CancelUpdates ;
     SetParams ;
     cdsLstAPagar.Refresh ;
end;

function TFIN_OutrasDespesasDatamodule.GetStringPeriodo: String;
begin
   Result := formatDateTime ( 'mmmm/yyyy', FInicioPeriodo ) ;
end;

procedure TFIN_OutrasDespesasDatamodule.DoChangePeriodo;
begin
    if Assigned ( FOnChangePeriodo ) then
       FOnChangePeriodo ( self ) ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarBeforeApplyUpdates(Sender: TObject;
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

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarBeforeDelete(DataSet: TDataSet);
begin

  if cdsApagarSYSORIGIN_TYPE.asInteger = 2 then
    raise Warning.Create( 'Despesa incluida via sincronismo.' + #10#13 + 'Não pode ser excluído.' );

  if ParcelaBaixada then
    raise Warning.Create( 'Existe(m) parcela(s) já baixada(s).' + #10#13 + 'Não pode ser excluída.' );
end;

procedure TFIN_OutrasDespesasDatamodule.cdsParcelasVALORValidate(Sender: TField);
begin
  if Sender.AsFloat <= 0 then
    raise Warning.Create('Valor da parcela inválido.');
end;

procedure TFIN_OutrasDespesasDatamodule.cdsParcelasVENCTOValidate(Sender: TField);
begin
  if Sender.IsNull then
    raise Warning.Create('Data de vencimento inválida.');
//  if assigned ( FOnCheckDate ) then
//     if not FOnCheckDate ( TDateTimeField ( Sender ).AsDateTime ) then
//        Abort ;
end;

procedure TFIN_OutrasDespesasDatamodule.ApplyUpdates;
var
  LErrMsg : TStringBuilder ;
  LValorTotalParcelas : double ;
begin
  {*** cdsAPagar.OnBeforePost ***}
  LErrMsg := TStringBuilder.Create ;

  try
    TCDSSuppl.PostIfNeed(cdsParcelas) ;

    if ( cdsAPagarPAGTO_AVISTA.AsBoolean )  then
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
     end;

    if ( LValorTotalParcelas = 0 ) then
      LErrMsg.AppendLine('O valor da despesa não pode ser zero.');

    if cdsAPagarKFIN_PLANOCONTA.IsNull then
      LErrMsg.AppendLine('Apropriação deve ser pesquisada/selecionada.');

      if LErrMsg.Length > 0 then
         raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;
  {*** cdsAPagar.OnBeforePost ***}

  if ( cdsAPagarKFIN_PLANOCONTA.AsString.Trim <> '' ) then
    if SvcFinanceiroApropriacaoDefault.NeedCC ( cdsAPagarKFIN_PLANOCONTA.AsString ) then
      if cdsApropriacaoAPagar.IsEmpty then
          raise Warning.Create('é necessário informar ao menos um centro de custos.');



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

///  if not ValidaCampos then
///    inherited;

  inherited;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
  if ( FHiddingByFilter ) and Assigned ( FOnHiddingByFilter ) then
     FOnHiddingByFilter ( Self ) ;
  FHiddingByFilter := False ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsLstAPagar.IsEmpty ) and not ( cdsLstAPagar.State in [dsInsert,dsEdit] )  then
     cdsLstAPagar.Append ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarBeforePost(DataSet: TDataSet);
var
  LErrMsg : TStringBuilder ;
  LValorTotalParcelas : double ;
begin
  {
  LErrMsg := TStringBuilder.Create ;

  try
    TCDSSuppl.PostIfNeed(cdsParcelas) ;

    if ( cdsAPagarPAGTO_AVISTA.AsBoolean )  then
      LValorTotalParcelas := cdsAPagarVALOR.asVariant
    else
    if VarIsNull( cdsParcelasTOTAL.asVariant ) then
      LValorTotalParcelas := 0
    else
      LValorTotalParcelas := cdsParcelasTOTAL.asVariant ;

    if ( cdsAPagarRECORRENCIA.AsString = 'F' ) then
      cdsAPagarVALOR.AsFloat := LValorTotalParcelas ;

    if ( LValorTotalParcelas = 0 ) then
      LErrMsg.AppendLine('O valor da despesa não pode ser zero.');

    if cdsAPagarKFIN_PLANOCONTA.IsNull then
      LErrMsg.AppendLine('Apropriação deve ser pesquisada/selecionada.');

      if LErrMsg.Length > 0 then
         raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;       }
end;

procedure TFIN_OutrasDespesasDatamodule.cdsParcelasBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsAPagar.IsEmpty ) and not ( cdsAPagar.State in [dsInsert,dsEdit] )  then
     cdsAPagar.Append ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsParcelasBeforePost(
  DataSet: TDataSet);
begin

  if (( cdsAPagarPAGTO_AVISTA.AsBoolean ) and ( cdsParcelasCHEQUE.AsBoolean )) or
     (( not cdsParcelasCHEQUE.AsBoolean ) and ( cdsParcelasPAGTO.IsNull))  then
     cdsParcelasDT_COMPENSACAO.Clear;

end;

procedure TFIN_OutrasDespesasDatamodule.cdsParcelasCHEQUEChange(Sender: TField);
begin

  if cdsParcelasCHEQUE.asBoolean then
      cdsParcelasDT_COMPENSACAO.Clear
  else
    begin
      cdsParcelasDT_COMPENSACAO.AsSQLTimeStamp := cdsParcelasPAGTO.AsSQLTimeStamp ;
      cdsParcelasNUM_CHEQUE.Clear ;
    end ;
end;

procedure TFIN_OutrasDespesasDatamodule.SetShowDuvidoso(const Value: Boolean);
begin
  FShowDuvidoso := Value;
  RefreshPeriodo ;
end;

procedure TFIN_OutrasDespesasDatamodule.SetShowPago(const Value: Boolean);
begin
  FShowPago := Value;
  RefreshPeriodo ;
end;

procedure TFIN_OutrasDespesasDatamodule.SetShowProvisao(const Value: Boolean);
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
procedure TFIN_OutrasDespesasDatamodule.ValidDocumento;
begin
  if   ( cdsAPagarKCAD_ENTIDADE.IsNull )
    or ( cdsAPagarDOCUMENTO.isNull   )
    or ( Trim ( cdsAPagarDOCUMENTO.AsString  ) = '')  then
     exit ;

  if TSQLSuppl.CheckExistsIn(    'FIN_APAGAR',
                                 'KCAD_ENTIDADE;DOCUMENTO', VarArrayOf ( [ cdsAPagarKCAD_ENTIDADE.asString, cdsAPagarDOCUMENTO.asString ] ),
                                 Format ( 'KFIN_APAGAR <> %s ', [ QuotedStr( cdsAPagarKFIN_APAGAR.asString ) ] ),
                                 TSQLConnection ( DBResources[ 'FINANCEIRO' ].Connection ) ) then
        Raise Warning.Create( _ERRMSG_DOCUMENTO_JA_CADASTRADO ) ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsLstAPagarVENCTOGetText(Sender: TField;
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

procedure TFIN_OutrasDespesasDatamodule.cdsLstAPagarDUVIDOSOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
      Text := BooleanFieldToText ( Sender ) ;

end;

procedure TFIN_OutrasDespesasDatamodule.cdsLstAPagarPREVISAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

   if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
      Text := BooleanFieldToText ( Sender ) ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsLstAPagarPROVISAOGetText(Sender: TField; var Text: string;
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

procedure TFIN_OutrasDespesasDatamodule.cdsParcelasPREVISAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
      Text := BooleanFieldToText ( Sender ) ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsParcelasDUVIDOSOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

   if DisplayText then
      Text := BooleanFieldToText ( Sender ) ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarDESCR_PC_NOMESetText(Sender: TField; const Text: string);
begin
  with cdsApropriacaoAPagar do
    begin
      First;
      while not Eof do
        Delete;
    end;

  cdsAPagarKFIN_PLANOCONTA.Clear ;
  Sender.asString := Text ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarDOCUMENTOValidate(
  Sender: TField);
begin
  ValidDocumento ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarKCAD_ENTIDADEValidate(
  Sender: TField);
begin
  ValidDocumento ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarNOMECONTASetText(Sender: TField; const Text: string);
begin
  cdsAPagarKFIN_CONTA_PREF.Clear;
  Sender.asString := Text ;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsAPagarNOMEENTIDADESetText(Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsAPagarKCAD_ENTIDADE.Clear;
end;


procedure TFIN_OutrasDespesasDatamodule.cdsAPagarPAGTO_AVISTAChange(
  Sender: TField);
begin
 cdsAPagarPAGTO_AVISTA.OnChange := nil ;
 try
   //if Sender.asBoolean then
     PagamentoAVista;
 finally
     cdsAPagarPAGTO_AVISTA.OnChange := cdsAPagarPAGTO_AVISTAChange
 end;
end;

procedure TFIN_OutrasDespesasDatamodule.cdsApropriacaoAPagarNewRecord(
  DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoAPagarKFIN_APROPRIACAO );
  cdsApropriacaoAPagarTABLENAME.AsString := 'FIN_APAGAR' ;
  cdsApropriacaoAPagarTABLEKEY.AsString  := cdsAPagarKFIN_APAGAR.AsString;
end;

procedure TFIN_OutrasDespesasDatamodule.SetShowEmAtraso(const Value: Boolean);
begin
  FShowEmAtraso := Value;
  RefreshPeriodo ;
end;

procedure TFIN_OutrasDespesasDatamodule.RefreshBaixa( var BaixaTitulo: TBaixaTitulo);
begin
    cdsLstAPagar.edit ;
//    cdsLstAPagarPAGTO.AsDateTime := BaixaTitulo.Data ;
    cdsLstAPagarVALOR.asCurrency := BaixaTitulo.Pago ;
    cdsLstAPagarNOMECONTA.asString := BaixaTitulo.NomeConta ;
    cdsLstAPagar.post ;
    cdsAPagar.Refresh ;
end;

procedure TFIN_OutrasDespesasDatamodule._DataModuleCreate(Sender: TObject);
begin
  inherited;
  FShowDuvidoso := False ;
  FShowPago     := False ;
  FShowEmAtraso := True ;
  InitPeriodo ;
end;


end.

