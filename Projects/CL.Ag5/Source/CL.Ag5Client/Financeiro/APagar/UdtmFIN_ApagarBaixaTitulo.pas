unit UdtmFIN_ApagarBaixaTitulo;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Datasnap.Provider, UdtmSYS_BASE, Tc.Data.SQLExpr ;

type
  TdtmFIN_ApagarBaixaTitulo = class(T_dtmBASE)
    cdsAPagarParcela: TClientDataSet;
    dspAPagarParcela: TDataSetProvider;
    sqlAPagarParcela: TTcSQLDataSet;
    sqlAPagarParcelaKFIN_APAGAR_PARCELA: TStringField;
    sqlAPagarParcelaDOCUMENTO: TStringField;
    sqlAPagarParcelaVENCTO: TSQLTimeStampField;
    sqlAPagarParcelaVALOR: TFloatField;
    sqlAPagarParcelaPAGTO: TSQLTimeStampField;
    sqlAPagarParcelaPAGO: TFloatField;
    sqlAPagarParcelaOBS: TMemoField;
    sqlAPagarParcelaKFIN_CONTA: TStringField;
    sqlAPagarParcelaNOMEENTIDADE: TStringField;
    sqlAPagarParcelaHISTORICO: TStringField;
    sqlAPagarParcelaNOMEPLANO: TStringField;
    cdsAPagarParcelaKFIN_APAGAR_PARCELA: TStringField;
    cdsAPagarParcelaNOMEENTIDADE: TStringField;
    cdsAPagarParcelaHISTORICO: TStringField;
    cdsAPagarParcelaNOMEPLANO: TStringField;
    cdsAPagarParcelaDOCUMENTO: TStringField;
    cdsAPagarParcelaVENCTO: TSQLTimeStampField;
    cdsAPagarParcelaVALOR: TFloatField;
    cdsAPagarParcelaPAGTO: TSQLTimeStampField;
    cdsAPagarParcelaPAGO: TFloatField;
    cdsAPagarParcelaKFIN_CONTA: TStringField;
    cdsAPagarParcelaOBS: TMemoField;
    cdsContas: TClientDataSet;
    dspContas: TDataSetProvider;
    sqlContas: TTcSQLDataSet;
    sqlContasKFIN_CONTA: TStringField;
    sqlContasNOME: TStringField;
    cdsContasKFIN_CONTA: TStringField;
    cdsContasNOME: TStringField;
    cdsAPagarParcelaNOMECONTA: TStringField;
    sqlAPagarParcelaCHEQUE: TStringField;
    cdsAPagarParcelaCHEQUE: TStringField;
    sqlAPagarParcelaDT_COMPENSACAO: TSQLTimeStampField;
    cdsAPagarParcelaDT_COMPENSACAO: TSQLTimeStampField;
    dtsApagarParcela: TDataSource;
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
    cdsAPagarParcelaJURO_DESCONTO: TFloatField;
    cdsAPagarParcela_tmpcalc: TIntegerField;
    dtsSQLAPagarParcela: TDataSource;
    cdsAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO: TStringField;
    sqlAPagarParcelaJURO_DESCONTO: TFloatField;
    sqlAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO: TStringField;
    sqlAPagarParcelaTABLENAME: TStringField;
    sqlAPagarParcelaTABLEKEY: TStringField;
    cdsAPagarParcelaTABLENAME: TStringField;
    cdsAPagarParcelaTABLEKEY: TStringField;
    cdsAPagarParcelasqlApropriacaoJuroDesconto: TDataSetField;
    cdsAPagarParcelaDESCRICAO_JURO_DESCONTO: TStringField;
    sqlAPagarParcelaKFIN_APAGAR: TStringField;
    cdsAPagarParcelaKFIN_APAGAR: TStringField;
    sqlAPagarParcelaPROVISAO: TStringField;
    cdsAPagarParcelaPROVISAO: TStringField;
    sqlAPagarParcelaNUM_CHEQUE: TStringField;
    cdsAPagarParcelaNUM_CHEQUE: TStringField;
    sqlAPagarParcelaDOCUMENTO_: TStringField;
    cdsAPagarParcelaDOCUMENTO_: TStringField;
    procedure cdsAPagarParcelaNewRecord(DataSet: TDataSet);
    procedure cdsAPagarParcelaBeforeOpen(DataSet: TDataSet);
    procedure dtsApagarParcelaDataChange(Sender: TObject; Field: TField);
    procedure cdsAPagarParcelaCalcFields(DataSet: TDataSet);
    procedure cdsApropriacaoJuroDescontoNewRecord(DataSet: TDataSet);
    procedure cdsAPagarParcelaNUM_CHEQUESetText(Sender: TField; const Text: string);
  private
    { Private declarations }
    FKFIN_APAGAR_PARCELA : string ;
    FTituloPago : boolean ;
    procedure GetCentroCustoFromPedido ;
    procedure GetCentroCustoPadrao ;
  public
    { Public declarations }
    procedure SetParams ( KFIN_APAGAR_PARCELA : string ) ;
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


{ TrdmdtmFIN_ApagarBaixaTitulo }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmFIN_ApagarBaixaTitulo.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


procedure TdtmFIN_ApagarBaixaTitulo.OpenTables;
begin
  inherited;
  FTituloPago := not cdsAPagarParcelaPAGTO.IsNull ;
end;

procedure TdtmFIN_ApagarBaixaTitulo.cdsAPagarParcelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  cdsAPagarParcelaCHEQUE.AsString := 'F';
end;

procedure TdtmFIN_ApagarBaixaTitulo.cdsApropriacaoJuroDescontoNewRecord(
  DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoJuroDescontoKFIN_APROPRIACAO );
  cdsApropriacaoJuroDescontoTABLENAME.AsString := 'FIN_APAGAR_PARCELAS' ;
  cdsApropriacaoJuroDescontoTABLEKEY.AsString  := cdsAPAGARParcelaKFIN_APAGAR_PARCELA.AsString;
end;

procedure TdtmFIN_ApagarBaixaTitulo.dtsApagarParcelaDataChange(Sender: TObject;
  Field: TField);
begin
  if   ( cdsAPagarParcela.State in [dsInsert,dsEdit ] )
   and ( Field = cdsAPagarParcelaPAGTO )
   and not cdsAPagarParcelaPAGTO.IsNull
   and cdsAPagarParcelaPAGO.IsNull then
    cdsAPagarParcelaPAGO.asFloat := cdsAPagarParcelaVALOR.asFloat ;
end;

procedure TdtmFIN_ApagarBaixaTitulo.Estornar;
begin
   FTituloPago := False ;
   cdsAPagarParcela.Edit ;
   cdsAPagarParcelaCHEQUE.AsString := 'F';
   cdsAPagarParcelaNUM_CHEQUE.Clear ;
   cdsAPagarParcelaPAGTO.Clear ;
   cdsAPagarParcelaDT_COMPENSACAO.Clear ;
   cdsAPagarParcelaPAGO.Clear ;
   cdsAPagarParcelaJURO_DESCONTO.Clear ;
   cdsAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO.Clear ;
   cdsAPagarParcela.Post ;
   with cdsApropriacaoJuroDesconto do
     if not IsEmpty then
       repeat
         first ;
         delete ;
       until( eof ) ;
   ApplyUpdates ;
end;

procedure TdtmFIN_ApagarBaixaTitulo.GetCentroCustoFromPedido ;
const
  _SELECT_FROM_PEDIDO_CMP =
         'SELECT KFIN_CENTROCUSTO, CODIGO, NOME, SUM(PORCENTAGEM) PORCENTAGEM FROM'
  +#13#10'(SELECT'
  +#13#10'  CC.KFIN_CENTROCUSTO,'
  +#13#10'  CC.CODIGO,'
  +#13#10'  CC.NOME,'
  +#13#10'  SUM( COALESCE( AP.PORCENTAGEM, 100 ) * (CMPI.TOTAL / CMP.TOTAL_NOTA) ) PORCENTAGEM'
  +#13#10'FROM CMP_PEDIDOS CMP'
  +#13#10'LEFT JOIN CMP_PEDIDO_ITENS CMPI ON CMPI.KCMP_PEDIDO = CMP.KCMP_PEDIDO'
  +#13#10'LEFT JOIN FIN_APROPRIACAO  AP ON AP.TABLENAME = ''CMP_PEDIDO_ITENS''   AND AP.TABLEKEY =  CMPI.KCMP_PEDIDO_ITEM'
  +#13#10'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_CENTROCUSTO'
  +#13#10'WHERE  ( CMP.KCMP_PEDIDO = :TABLEKEY )'
  +#13#10'  AND ( CMPI.KCMP_PEDIDO_ITEM IS NOT NULL )'
  +#13#10'  AND ( CC.KFIN_CENTROCUSTO IS NOT NULL )'
  +#13#10'GROUP BY 1,2,3'
  +#13#10'UNION ALL'
  +#13#10'SELECT'
  +#13#10'  CC.KFIN_CENTROCUSTO,'
  +#13#10'  CC.CODIGO,'
  +#13#10'  CC.NOME,'
  +#13#10'  SUM( COALESCE( AP.PORCENTAGEM, 100 ) * (CMPS.TOTAL / CMP.TOTAL_NOTA) ) PORCENTAGEM'
  +#13#10'FROM CMP_PEDIDOS CMP'
  +#13#10'LEFT JOIN CMP_PEDIDO_SERVICOS CMPS ON CMPS.KCMP_PEDIDO = CMP.KCMP_PEDIDO'
  +#13#10'LEFT JOIN FIN_APROPRIACAO  AP ON AP.TABLENAME = ''CMP_PEDIDO_SERVICOS''   AND AP.TABLEKEY =  CMPS.KCMP_PEDIDO_SERVICO'
  +#13#10'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_CENTROCUSTO'
  +#13#10'WHERE  ( CMP.KCMP_PEDIDO = :TABLEKEY )'
  +#13#10'  AND ( CMPS.KCMP_PEDIDO_SERVICO IS NOT NULL )'
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
  p.CreateParam( ftString, 'TABLEKEY', ptInput ).asString := cdsAPagarParcelaTABLEKEY.asString ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( LCDSApropriacao, _SELECT_FROM_PEDIDO_CMP, p ) ;
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


procedure TdtmFIN_ApagarBaixaTitulo.GetCentroCustoPadrao;
begin
    if not cdsApropriacaoJuroDesconto.IsEmpty then
       exit ;

    if cdsAPagarParcelaTABLENAME.asString = '' then
      SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
         'FIN_APAGAR', cdsAPagarParcelaKFIN_APAGAR.asString,
         'FIN_APAGAR_PARCELAS', cdsAPAGARParcelaKFIN_APAGAR_PARCELA.AsString,
       cdsApropriacaoJuroDesconto, True )
    else
       GetCentroCustoFromPedido ;
end;

procedure TdtmFIN_ApagarBaixaTitulo.SetParams( KFIN_APAGAR_PARCELA: string ) ;
begin
    FKFIN_APAGAR_PARCELA := KFIN_APAGAR_PARCELA ;
end;

function TryVarToFloat( Value : Variant ): double ;
begin
    if VarIsFloat( Value ) then
       Result := Value
    else
       Result := 0 ;
end;

procedure TdtmFIN_ApagarBaixaTitulo.Baixar;
const
  _UPDATE_FIN_APAGAR_RECORRENTE =
          'UPDATE FIN_APAGAR A'
   +#13#10'  SET'
   +#13#10'   A.VALOR = (SELECT SUM(VALOR) FROM FIN_APAGAR_PARCELAS P WHERE P.KFIN_APAGAR = A.KFIN_APAGAR)'
   +#13#10'WHERE A.KFIN_APAGAR = :KFIN_APAGAR AND A.RECORRENCIA = ''F''' ;
var
   p : TParams ;
begin
  if cdsAPagarParcelaPAGTO.isNull then
    raise Warning.Create('Não é possível baixar um titulo sem a data de baixa');

  if cdsAPagarParcelaPAGO.asFloat < 0 then
    raise Warning.Create('Não é possível baixar um titulo com valor inferior a 0 (zero).');

  TCdsSuppl.PostIfNeed( cdsApropriacaoJuroDesconto );

  if ( not cdsAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO.IsNull ) then
    begin
     if ( not cdsApropriacaoJuroDesconto.IsEmpty ) and ( TryVarToFloat( cdsApropriacaoJuroDescontoTOTAL_PORCENTAGEM.Value ) <> 100 ) then
      raise Warning.Create('É necessário que a somatória do percentual dos centro de custos seja 100%');

      if cdsApropriacaoJuroDesconto.IsEmpty then
        raise Warning.Create('Deve indicar pelo menos 1 centro de custo.');
    end;

  if ( cdsAPagarParcelaCHEQUE.asBoolean ) and ( cdsAPagarParcelaNUM_CHEQUE.asString.Trim = '' ) then
    raise Warning.Create('Informar o número do cheque.');


  if cdsAPagarParcelaCHEQUE.asBoolean then
      cdsAPagarParcelaDT_COMPENSACAO.Clear
  else
    begin
      cdsAPagarParcelaDT_COMPENSACAO.AsSQLTimeStamp := cdsAPagarParcelaPAGTO.AsSQLTimeStamp ;
      cdsAPagarParcelaNUM_CHEQUE.Clear ;
    end ;
  ApplyUpdates ;

//  if not cdsAPagarParcelaRECORRENTE.asBoolean then
    begin
       p := TParams.Create ;
       p.CreateParam ( ftString, 'KFIN_APAGAR', ptInput ).asString := cdsAPagarParcelaKFIN_APAGAR.asString ;
       TTcAbstractDB.GetByAlias('FINANCEIRO').Execute( _UPDATE_FIN_APAGAR_RECORRENTE, p );
       p.Free ;
    end ;

  FTituloPago := True ;
end;

procedure TdtmFIN_ApagarBaixaTitulo.cdsAPagarParcelaNUM_CHEQUESetText(Sender: TField;
      const Text: string);
begin
  if Text.Trim = '' then
   begin
    cdsAPagarParcelaNUM_CHEQUE.Clear ;
    cdsAPagarParcelaCHEQUE.asString := 'F' ;
   end
  else
   begin
    cdsAPagarParcelaNUM_CHEQUE.asString := Text ;
    cdsAPagarParcelaCHEQUE.asString := 'T' ;
   end;

end;

procedure TdtmFIN_ApagarBaixaTitulo.cdsAPagarParcelaBeforeOpen( DataSet: TDataSet);
begin
  inherited;
  cdsAPagarParcela.Params.ParamByName( 'KFIN_APAGAR_PARCELA' ).asString := FKFIN_APAGAR_PARCELA ;
end;

procedure TdtmFIN_ApagarBaixaTitulo.cdsAPagarParcelaCalcFields(
  DataSet: TDataSet);
begin
   if DataSet.State <> dsEdit  then
      exit ;

   cdsAPagarParcela.OnCalcFields := nil ;

   if ( cdsAPagarParcelaPAGO.isNull or (cdsAPagarParcelaPAGO.AsFloat = 0) )
    and not cdsAPagarParcelaJURO_DESCONTO.isNull then
     cdsAPagarParcelaJURO_DESCONTO.Clear
   else if cdsAPagarParcelaPAGO.AsFloat > 0 then
     cdsAPagarParcelaJURO_DESCONTO.AsFloat := cdsAPagarParcelaPAGO.AsFloat - cdsAPagarParcelaVALOR.AsFloat  ;

   if ( cdsAPagarParcelaJURO_DESCONTO.AsFloat > 0 )
     and ( cdsAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO.AsString <> TPlanoContasDespesasReceitas.GetKeyDespesas )then
       begin
         cdsAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetKeyDespesas ;
         cdsAPagarParcelaDESCRICAO_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetDescricaoDespesas  ;
         GetCentroCustoPadrao ;
       end
   else if ( cdsAPagarParcelaJURO_DESCONTO.AsFloat < 0 )
     and ( cdsAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO.AsString <> TPlanoContasDespesasReceitas.GetKeyReceitas )then
       begin
         cdsAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetKeyReceitas ;
         cdsAPagarParcelaDESCRICAO_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetDescricaoReceitas   ;
         GetCentroCustoPadrao ;
       end
   else if ( cdsAPagarParcelaJURO_DESCONTO.AsFloat = 0.00 )
     and ( not cdsAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO.isnull ) then
       begin
         cdsAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO.Clear ;
         cdsAPagarParcelaDESCRICAO_JURO_DESCONTO.asString := '' ;
         with cdsApropriacaoJuroDesconto do
           if not IsEmpty then
             repeat
               first ;
               delete ;
             until( eof ) ;
       end;

   cdsAPagarParcela.OnCalcFields := cdsAPagarParcelaCalcFields ;


end;


end.
