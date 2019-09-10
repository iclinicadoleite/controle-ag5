unit UdtmFIN_AReceberBaixaTitulo;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Datasnap.Provider, UdtmSYS_BASE, Tc.Data.SQLExpr ;

type
  TdtmFIN_AReceberBaixaTitulo = class(T_dtmBASE)
    cdsAReceberParcela: TClientDataSet;
    dspAReceberParcela: TDataSetProvider;
    sqlAReceberParcela: TTcSQLDataSet;
    sqlAReceberParcelaKFIN_ARECEBER_PARCELA: TStringField;
    sqlAReceberParcelaNOMEENTIDADE: TStringField;
    sqlAReceberParcelaHISTORICO: TStringField;
    sqlAReceberParcelaNOMEPLANO: TStringField;
    sqlAReceberParcelaDOCUMENTO: TStringField;
    sqlAReceberParcelaVENCTO: TSQLTimeStampField;
    sqlAReceberParcelaVALOR: TFloatField;
    sqlAReceberParcelaPAGTO: TSQLTimeStampField;
    sqlAReceberParcelaPAGO: TFloatField;
    sqlAReceberParcelaOBS: TMemoField;
    sqlAReceberParcelaKFIN_CONTA: TStringField;
    cdsAReceberParcelaKFIN_ARECEBER_PARCELA: TStringField;
    cdsAReceberParcelaNOMEENTIDADE: TStringField;
    cdsAReceberParcelaHISTORICO: TStringField;
    cdsAReceberParcelaNOMEPLANO: TStringField;
    cdsAReceberParcelaDOCUMENTO: TStringField;
    cdsAReceberParcelaVENCTO: TSQLTimeStampField;
    cdsAReceberParcelaVALOR: TFloatField;
    cdsAReceberParcelaPAGTO: TSQLTimeStampField;
    cdsAReceberParcelaPAGO: TFloatField;
    cdsAReceberParcelaOBS: TMemoField;
    cdsAReceberParcelaKFIN_CONTA: TStringField;
    cdsContas: TClientDataSet;
    cdsContasKFIN_CONTA: TStringField;
    cdsContasNOME: TStringField;
    dspContas: TDataSetProvider;
    sqlContas: TTcSQLDataSet;
    sqlContasKFIN_CONTA: TStringField;
    sqlContasNOME: TStringField;
    cdsAReceberParcelaNOMECONTA: TStringField;
    sqlAReceberParcelaCHEQUE: TStringField;
    cdsAReceberParcelaCHEQUE: TStringField;
    sqlAReceberParcelaDT_COMPENSACAO: TSQLTimeStampField;
    cdsAReceberParcelaDT_COMPENSACAO: TSQLTimeStampField;
    dtsAReceberParcela: TDataSource;
    cdsApropriacaoJuroDesconto: TClientDataSet;
    cdsApropriacaoJuroDescontoKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoJuroDescontoKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoJuroDescontoNOME: TStringField;
    cdsApropriacaoJuroDescontoCODIGO: TIntegerField;
    cdsApropriacaoJuroDescontoCLASSIFICACAO: TStringField;
    cdsApropriacaoJuroDescontoPORCENTAGEM: TFloatField;
    cdsApropriacaoJuroDescontoTABLENAME: TStringField;
    cdsApropriacaoJuroDescontoTABLEKEY: TStringField;
    cdsApropriacaoJuroDescontoTOTAL_PORCENTAGEM: TAggregateField;
    sqlApropriacaoJuroDesconto: TTcSQLDataSet;
    sqlApropriacaoJuroDescontoKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoJuroDescontoKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoJuroDescontoPORCENTAGEM: TFloatField;
    sqlApropriacaoJuroDescontoNOME: TStringField;
    sqlApropriacaoJuroDescontoCODIGO: TIntegerField;
    sqlApropriacaoJuroDescontoCLASSIFICACAO: TStringField;
    sqlApropriacaoJuroDescontoTABLENAME: TStringField;
    sqlApropriacaoJuroDescontoTABLEKEY: TStringField;
    dtsSQLAReceberParcela: TDataSource;
    cdsAReceberParcelaJURO_DESCONTO: TFloatField;
    cdsAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO: TStringField;
    sqlAReceberParcelaJURO_DESCONTO: TFloatField;
    sqlAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO: TStringField;
    cdsAReceberParcela_tmpcalc: TIntegerField;
    sqlAReceberParcelaTABLENAME: TStringField;
    sqlAReceberParcelaTABLEKEY: TStringField;
    cdsAReceberParcelaTABLENAME: TStringField;
    cdsAReceberParcelaTABLEKEY: TStringField;
    cdsAReceberParcelasqlApropriacaoJuroDesconto: TDataSetField;
    cdsAReceberParcelaDESCRICAO_JURO_DESCONTO: TStringField;
    sqlAReceberParcelaKFIN_ARECEBER: TStringField;
    cdsAReceberParcelaKFIN_ARECEBER: TStringField;
    sqlAReceberParcelaPROVISAO: TStringField;
    cdsAReceberParcelaPROVISAO: TStringField;
    sqlAReceberParcelaNUM_CHEQUE: TStringField;
    cdsAReceberParcelaNUM_CHEQUE: TStringField;
    sqlAReceberParcelaDOCUMENTO_: TStringField;
    cdsAReceberParcelaDOCUMENTO_: TStringField;
    procedure cdsAReceberParcelaNewRecord(DataSet: TDataSet);
    procedure cdsAReceberParcelaBeforeOpen(DataSet: TDataSet);
    procedure dtsAReceberParcelaDataChange(Sender: TObject; Field: TField);
    procedure cdsApropriacaoJuroDescontoNewRecord(DataSet: TDataSet);
    procedure cdsAReceberParcelaCalcFields(DataSet: TDataSet);
    procedure cdsAReceberParcelaNUM_CHEQUESetText(Sender: TField;
      const Text: string);
  private
    { Private declarations }
    FKFIN_ARECEBER_PARCELA : string ;
    FTituloPago: boolean;
    procedure GetCentroCustoFromPedido ;
    procedure GetCentroCustoPadrao ;
  public
    { Public declarations }
    procedure SetParams ( KFIN_ARECEBER_PARCELA : string  ) ;
    procedure OpenTables ; override ;
    procedure Estornar ;
    procedure Baixar ;
    property TituloPago : boolean read FTituloPago ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, Exceptions, CDSSuppl,
     UFIN_PlanoContasReceitasDespesasClass,
     CLAg5SvcFinanceiroApropriacao 
     , DataSnap.DSConnect
      ;

{$R *.dfm}


{ TrdmdtmFIN_AReceberBaixaTitulo }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmFIN_AReceberBaixaTitulo.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


procedure TdtmFIN_AReceberBaixaTitulo.OpenTables;
begin
  inherited;
  FTituloPago := not cdsAReceberParcelaPAGTO.IsNull ;
end;

procedure TdtmFIN_AReceberBaixaTitulo.cdsAReceberParcelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  cdsAReceberParcelaCHEQUE.AsString := 'F';
end;

procedure TdtmFIN_AReceberBaixaTitulo.cdsAReceberParcelaNUM_CHEQUESetText(
  Sender: TField; const Text: string);
begin
  if Text.Trim = '' then
   begin
    cdsAReceberParcelaNUM_CHEQUE.Clear ;
    cdsAReceberParcelaCHEQUE.asString := 'F' ;
   end
  else
   begin
    cdsAReceberParcelaNUM_CHEQUE.asString := Text ;
    cdsAReceberParcelaCHEQUE.asString := 'T' ;
   end;
end;

procedure TdtmFIN_AReceberBaixaTitulo.dtsAReceberParcelaDataChange(Sender: TObject;
  Field: TField);
begin
  if   ( cdsAReceberParcela.State in [dsInsert,dsEdit ] )
   and ( Field = cdsAReceberParcelaPAGTO )
   and not cdsAReceberParcelaPAGTO.IsNull
   and cdsAReceberParcelaPAGO.IsNull then
    cdsAReceberParcelaPAGO.asFloat := cdsAReceberParcelaVALOR.asFloat ;
end;

procedure TdtmFIN_AReceberBaixaTitulo.Estornar;
begin
   FTituloPago := False ;
   cdsAReceberParcela.Edit ;
   cdsAReceberParcelaCHEQUE.AsString := 'F';
   cdsAReceberParcelaNUM_CHEQUE.Clear ;
   cdsAReceberParcelaPAGTO.Clear ;
   cdsAReceberParcelaDT_COMPENSACAO.Clear ;
   cdsAReceberParcelaPAGO.Clear ;
   cdsAReceberParcelaJURO_DESCONTO.Clear ;
   cdsAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO.Clear ;
   cdsAReceberParcela.Post ;
   with cdsApropriacaoJuroDesconto do
     if not IsEmpty then
       repeat
         first ;
         delete ;
       until( eof ) ;
   ApplyUpdates ;
end;

procedure TdtmFIN_AReceberBaixaTitulo.GetCentroCustoFromPedido ;
const
  _SELECT_FROM_PEDIDO_VND =
         'SELECT KFIN_CENTROCUSTO, CODIGO, NOME, SUM(PORCENTAGEM) PORCENTAGEM FROM'
  +#13#10'(SELECT'
  +#13#10'  CC.KFIN_CENTROCUSTO,'
  +#13#10'  CC.CODIGO,'
  +#13#10'  CC.NOME,'
  +#13#10'  SUM( COALESCE( AP.PORCENTAGEM, 100 ) * (VNDI.TOTAL / VND.TOTAL_NOTA) ) PORCENTAGEM'
  +#13#10'FROM VND_PEDIDOS VND'
  +#13#10'LEFT JOIN VND_PEDIDO_ITENS VNDI ON VNDI.KVND_PEDIDO = VND.KVND_PEDIDO'
  +#13#10'LEFT JOIN FIN_APROPRIACAO  AP ON AP.TABLENAME = ''VND_PEDIDO_ITENS''   AND AP.TABLEKEY =  VNDI.KVND_PEDIDO_ITEM'
  +#13#10'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_CENTROCUSTO'
  +#13#10'WHERE  ( VND.KVND_PEDIDO = :TABLEKEY )'
  +#13#10'  AND ( VNDI.KVND_PEDIDO_ITEM IS NOT NULL )'
  +#13#10'  AND ( CC.KFIN_CENTROCUSTO IS NOT NULL )'
  +#13#10'GROUP BY 1,2,3'
  +#13#10'UNION ALL'
  +#13#10'SELECT'
  +#13#10'  CC.KFIN_CENTROCUSTO,'
  +#13#10'  CC.CODIGO,'
  +#13#10'  CC.NOME,'
  +#13#10'  SUM( COALESCE( AP.PORCENTAGEM, 100 ) * (VNDS.TOTAL / VND.TOTAL_NOTA) ) PORCENTAGEM'
  +#13#10'FROM VND_PEDIDOS VND'
  +#13#10'LEFT JOIN VND_PEDIDO_SERVICOS VNDS ON VNDS.KVND_PEDIDO = VND.KVND_PEDIDO'
  +#13#10'LEFT JOIN FIN_APROPRIACAO  AP ON AP.TABLENAME = ''VND_PEDIDO_SERVICOS''   AND AP.TABLEKEY =  VNDS.KVND_PEDIDO_SERVICO'
  +#13#10'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_CENTROCUSTO'
  +#13#10'WHERE  ( VND.KVND_PEDIDO = :TABLEKEY )'
  +#13#10'  AND ( VNDS.KVND_PEDIDO_SERVICO IS NOT NULL )'
  +#13#10'  AND ( CC.KFIN_CENTROCUSTO IS NOT NULL )'
  +#13#10'GROUP BY 1,2,3'
  +#13#10')'
  +#13#10'GROUP BY 1,2,3' ;

var
 LCDSApropriacao : TClientDataSet ;
 p : TParams ;
begin

  LCDSApropriacao := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'TABLEKEY', ptInput ).asString := cdsAReceberParcelaTABLEKEY.asString ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( LCDSApropriacao, _SELECT_FROM_PEDIDO_VND, p ) ;
  p.Free ;

  with LCDSApropriacao do
    try
      while not eof do
        begin
          cdsApropriacaoJuroDesconto.Append;
          cdsApropriacaoJuroDescontoCODIGO.asString           := FieldByName( 'CODIGO').AsString  ;
          cdsApropriacaoJuroDescontoNOME.asString             := FieldByName( 'NOME').AsString  ;
          cdsApropriacaoJuroDescontoPORCENTAGEM.asFloat       := FieldByName( 'PORCENTAGEM').asFloat  ;
          cdsApropriacaoJuroDescontoKFIN_CENTROCUSTO.asString := FieldByName( 'KFIN_CENTROCUSTO').AsString  ;
          cdsApropriacaoJuroDesconto.Post;
          next ;
        end;
    finally
      LCDSApropriacao.Free ;
    end;

  if cdsApropriacaoJuroDesconto.IsEmpty then
     SvcFinanceiroApropriacaoDefault.AddCentroCustoPadrao( cdsApropriacaoJuroDesconto ) ;
end;

procedure TdtmFIN_AReceberBaixaTitulo.GetCentroCustoPadrao;
begin
    if not cdsApropriacaoJuroDesconto.IsEmpty then
       exit ;

    if cdsAReceberParcelaTABLENAME.asString = '' then
      SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
         'FIN_ARECEBER', cdsAReceberParcelaKFIN_ARECEBER.asString,
         'FIN_ARECEBER_PARCELAS', cdsAReceberParcelaKFIN_ARECEBER_PARCELA.AsString,
       cdsApropriacaoJuroDesconto, True )
    else
       GetCentroCustoFromPedido ;
end;

procedure TdtmFIN_AReceberBaixaTitulo.SetParams( KFIN_ARECEBER_PARCELA: string );
begin
    FKFIN_ARECEBER_PARCELA := KFIN_ARECEBER_PARCELA ;
end;

function TryVarToFloat( Value : Variant ): double ;
begin
    if VarIsFloat( Value ) then
       Result := Value
    else
       Result := 0 ;
end;

procedure TdtmFIN_AReceberBaixaTitulo.Baixar;
const
  _UPDATE_FIN_ARECEBER_RECORRENTE =
          'UPDATE FIN_ARECEBER A'
   +#13#10'  SET'
   +#13#10'   A.VALOR = (SELECT SUM(VALOR) FROM FIN_ARECEBER_PARCELAS P WHERE P.KFIN_ARECEBER = A.KFIN_ARECEBER)'
   +#13#10'WHERE A.KFIN_ARECEBER = :KFIN_ARECEBER AND A.RECORRENCIA = ''F''' ;
var
   p : TParams ;
begin
  if cdsAReceberParcelaPAGTO.isNull then
    raise Warning.Create('Não é possível baixar um titulo sem a data de baixa');

  if cdsAReceberParcelaPAGO.asFloat < 0 then
    raise Warning.Create('Não é possível baixar um titulo com valor inferior a 0 (zero).');

  TCdsSuppl.PostIfNeed( cdsApropriacaoJuroDesconto );

  if ( not cdsAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO.IsNull ) then
    begin
     if ( not cdsApropriacaoJuroDesconto.IsEmpty ) and ( TryVarToFloat( cdsApropriacaoJuroDescontoTOTAL_PORCENTAGEM.Value ) <> 100 ) then
      raise Warning.Create('É necessário que a somatória do percentual dos centro de custos seja 100%');

      if cdsApropriacaoJuroDesconto.IsEmpty then
        raise Warning.Create('Deve indicar pelo menos 1 centro de custo.');
    end;

  if ( cdsAReceberParcelaCHEQUE.asBoolean ) and ( cdsAReceberParcelaNUM_CHEQUE.asString.Trim = '' ) then
    raise Warning.Create('Informar o número do cheque.');

  if cdsAReceberParcelaCHEQUE.asBoolean then
    cdsAReceberParcelaDT_COMPENSACAO.Clear
  else
    begin
       cdsAReceberParcelaDT_COMPENSACAO.AsSQLTimeStamp := cdsAReceberParcelaPAGTO.AsSQLTimeStamp ;
       cdsAReceberParcelaNUM_CHEQUE.Clear ;
    end;
  ApplyUpdates ;

//  if not cdsAReceberParcelaRECORRENTE.asBoolean then
    begin
       p := TParams.Create ;
       p.CreateParam ( ftString, 'KFIN_ARECEBER', ptInput ).asString := cdsAReceberParcelaKFIN_ARECEBER.asString ;
       TTcAbstractDB.GetByAlias('FINANCEIRO').Execute( _UPDATE_FIN_ARECEBER_RECORRENTE, p );
       p.Free ;
    end ;

  FTituloPago := True ;
end;

procedure TdtmFIN_AReceberBaixaTitulo.cdsApropriacaoJuroDescontoNewRecord(
  DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoJuroDescontoKFIN_APROPRIACAO );
  cdsApropriacaoJuroDescontoTABLENAME.AsString := 'FIN_ARECEBER_PARCELAS' ;
  cdsApropriacaoJuroDescontoTABLEKEY.AsString  := cdsAReceberParcelaKFIN_ARECEBER_PARCELA.AsString;
end;

procedure TdtmFIN_AReceberBaixaTitulo.cdsAReceberParcelaBeforeOpen( DataSet: TDataSet);
begin
  inherited;
  cdsAReceberParcela.Params.ParamByName( 'KFIN_ARECEBER_PARCELA' ).asString := FKFIN_ARECEBER_PARCELA ;
end;


procedure TdtmFIN_AReceberBaixaTitulo.cdsAReceberParcelaCalcFields(
  DataSet: TDataSet);
begin
   if DataSet.State <> dsEdit  then
      exit ;

   cdsAReceberParcela.OnCalcFields := nil ;

   if ( cdsAReceberParcelaPAGO.isNull or (cdsAReceberParcelaPAGO.AsFloat = 0) )
    and not cdsAReceberParcelaJURO_DESCONTO.isNull then
     cdsAReceberParcelaJURO_DESCONTO.Clear
   else if cdsAReceberParcelaPAGO.AsFloat > 0 then
     cdsAReceberParcelaJURO_DESCONTO.AsFloat := cdsAReceberParcelaPAGO.AsFloat - cdsAReceberParcelaVALOR.AsFloat  ;

   if ( cdsAReceberParcelaJURO_DESCONTO.AsFloat > 0 )
     and ( cdsAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO.AsString <> TPlanoContasDespesasReceitas.GetKeyReceitas )then
       begin
         cdsAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetKeyReceitas ;
         cdsAReceberParcelaDESCRICAO_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetDescricaoReceitas   ;
         GetCentroCustoPadrao ;
   end
   else if ( cdsAReceberParcelaJURO_DESCONTO.AsFloat < 0 )
     and ( cdsAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO.AsString <> TPlanoContasDespesasReceitas.GetKeyDespesas )then
       begin
         cdsAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetKeyDespesas ;
         cdsAReceberParcelaDESCRICAO_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetDescricaoDespesas  ;
         GetCentroCustoPadrao ;
       end
   else if ( cdsAReceberParcelaJURO_DESCONTO.AsFloat = 0.00)
     and ( not cdsAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO.isnull ) then
       begin
         cdsAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO.Clear ;
         cdsAReceberParcelaDESCRICAO_JURO_DESCONTO.asString := '' ;
         with cdsApropriacaoJuroDesconto do
           if not IsEmpty then
             repeat
               first ;
               delete ;
             until( eof ) ;
       end;

   cdsAReceberParcela.OnCalcFields := cdsAReceberParcelaCalcFields ;


end;


end.
