unit UFin_BaixaAPagarColetivoDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Datasnap.Provider, UdtmSYS_BASE, Tc.Data.SQLExpr ;

type

  TTipoTitulo = ( ttAPagar, ttPagos, ttAmbos) ;

  TFin_BaixaAPagarColetivoDatamodule = class(T_dtmBASE)
    cdsBaixaAPagar: TClientDataSet;
    dspBaixaAPagar: TDataSetProvider;
    sqlBaixaAPagar: TTcSQLDataSet;
    dtsBaixaAPagar: TDataSource;
    sqlBaixaAPagarKFIN_APAGAR_PARCELA: TStringField;
    sqlBaixaAPagarVENCTO: TSQLTimeStampField;
    sqlBaixaAPagarKCAD_ENTIDADE: TStringField;
    sqlBaixaAPagarNOMEENTIDADE: TStringField;
    sqlBaixaAPagarVALOR: TFloatField;
    sqlBaixaAPagarKFIN_CONTA: TStringField;
    sqlBaixaAPagarOBS: TMemoField;
    cdsBaixaAPagarKFIN_APAGAR_PARCELA: TStringField;
    cdsBaixaAPagarVENCTO: TSQLTimeStampField;
    cdsBaixaAPagarKCAD_ENTIDADE: TStringField;
    cdsBaixaAPagarNOMEENTIDADE: TStringField;
    cdsBaixaAPagarVALOR: TFloatField;
    cdsBaixaAPagarKFIN_CONTA: TStringField;
    cdsBaixaAPagarCONTA: TStringField;
    cdsBaixaAPagarOBS: TMemoField;
    sqlBaixaAPagarPARCELAS: TStringField;
    cdsBaixaAPagarPARCELAS: TStringField;
    sqlBaixaAPagarPAGTO: TSQLTimeStampField;
    sqlBaixaAPagarPAGO: TFloatField;
    cdsBaixaAPagarPAGTO: TSQLTimeStampField;
    cdsBaixaAPagarPAGO: TFloatField;
    sqlBaixaAPagarDOCUMENTO: TStringField;
    cdsBaixaAPagarDOCUMENTO: TStringField;
    sqlBaixaAPagarHISTORICO: TStringField;
    cdsBaixaAPagarHISTORICO: TStringField;
    sqlBaixaAPagarDATACOMPRA: TSQLTimeStampField;
    sqlBaixaAPagarKFIN_APAGAR: TStringField;
    sqlBaixaAPagarKCMP_PEDIDO: TStringField;
    cdsBaixaAPagarKFIN_APAGAR: TStringField;
    cdsBaixaAPagarKCMP_PEDIDO: TStringField;
    cdsBaixaAPagarDATACOMPRA: TSQLTimeStampField;
    cdsBaixaAPagarBAIXAR: TStringField;
    cdsBaixaAPagarPROVISAO: TStringField;
    cdsContas: TClientDataSet;
    cdsContasKFIN_CONTA: TStringField;
    cdsContasNOME: TStringField;
    dspContas: TDataSetProvider;
    sqlContas: TTcSQLDataSet;
    sqlContasKFIN_CONTA: TStringField;
    sqlContasNOME: TStringField;
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
    sqlBaixaAPagarTABLENAME: TStringField;
    sqlBaixaAPagarTABLEKEY: TStringField;
    sqlBaixaAPagarPROVISAO: TStringField;
    sqlBaixaAPagarJURO_DESCONTO: TFloatField;
    sqlBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO: TStringField;
    sqlBaixaAPagarCHEQUE: TStringField;
    sqlBaixaAPagarDT_COMPENSACAO: TSQLTimeStampField;
    cdsBaixaAPagar_tmpcalc: TIntegerField;
    cdsBaixaAPagarJURO_DESCONTO: TFloatField;
    cdsBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO: TStringField;
    cdsBaixaAPagarCHEQUE: TStringField;
    cdsBaixaAPagarNOMECONTA: TStringField;
    cdsBaixaAPagarDESCRICAO_JURO_DESCONTO: TStringField;
    cdsBaixaAPagarDT_COMPENSACAO: TSQLTimeStampField;
    sqlBaixaAPagarKFIN_CONTA_PREF: TStringField;
    sqlBaixaAPagarCONTA: TStringField;
    cdsBaixaAPagarTABLENAME: TStringField;
    cdsBaixaAPagarTABLEKEY: TStringField;
    cdsBaixaAPagarKFIN_CONTA_PREF: TStringField;
    cdsBaixaAPagarsqlApropriacaoJuroDesconto: TDataSetField;
    sqlBaixaAPagarBAIXADO: TStringField;
    sqlBaixaAPagarBAIXAR: TStringField;
    cdsBaixaAPagarBAIXADO: TStringField;
    DataSource1: TDataSource;
    sqlBaixaAPagarNUM_CHEQUE: TStringField;
    cdsBaixaAPagarNUM_CHEQUE: TStringField;
    cdsBaixaAPagarNOMECONTA_: TStringField;
    sqlBaixaAPagarDOCUMENTO_: TStringField;
    cdsBaixaAPagarDOCUMENTO_: TStringField;
    procedure cdsApropriacaoJuroDescontoNewRecord(DataSet: TDataSet);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure cdsBaixaAPagarCalcFields(DataSet: TDataSet);
    procedure cdsBaixaAPagarNUM_CHEQUESetText(Sender: TField;
      const Text: string);
    procedure cdsBaixaAPagarBAIXARGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsBaixaAPagarPROVISAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsBaixaAPagarBeforePost(DataSet: TDataSet);
    procedure cdsBaixaAPagarVALORChange(Sender: TField);
    procedure dspBaixaAPagarAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
  private
    { Private declarations }
    FDataIni : TDateTime;
    FDataFim : TDateTime;
    FTipoTitulo : TTipoTitulo ;
    FKCAD_ENTIDADE : string;
    FBaixarNoVencimento: boolean;
    FDataDeBaixa: TDateTime;
    procedure SetParams;
    procedure GetCentroCustoFromPedido ;
    procedure GetCentroCustoPadrao;
    procedure Baixar ;
    procedure Estornar ;
    procedure SetBaixarNoVencimento(const Value: boolean);
    procedure SetDataDeBaixa(const Value: TDateTime);
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure SetParam ( DataIni, DataFim : TDateTime; ATipoTitulo : TTipoTitulo ; KCAD_ENTIDADE : string );
    procedure BaixarTodos ;
    property BaixarNoVencimento : boolean  read FBaixarNoVencimento write SetBaixarNoVencimento;
    property DataDeBaixa : TDateTime  read FDataDeBaixa write SetDataDeBaixa;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Exceptions, DateUtils, Data.SQLTimSt, UDBFinanceiro
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
     , CLAg5SvcFinanceiroApropriacao
     , UFIN_PlanoContasReceitasDespesasClass
     ;

{$R *.dfm}

{ TrdmFin_BaixaAPagarDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFin_BaixaAPagarColetivoDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  Self.SortLstIndex := True;
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
  FDataDeBaixa := Date ;
end;

{$ENDIF}


procedure TFin_BaixaAPagarColetivoDatamodule.DataSource1DataChange(
  Sender: TObject; Field: TField);
begin
  if Field = cdsBaixaApagarBAIXAR then
    begin
       DataSource1.Enabled := False ;

       if cdsBaixaApagarBAIXAR = cdsBaixaApagarBAIXADO then
          cdsBaixaApagar.RevertRecord
       else if cdsBaixaApagarBAIXAR.AsBoolean then
          Baixar
       else
          Estornar ;

       DataSource1.Enabled := True ;
    end;
end;



procedure TFin_BaixaAPagarColetivoDatamodule.dspBaixaAPagarAfterUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
const
  _UPDATE_FIN_APAGAR_RECORRENTE =
          'UPDATE FIN_APAGAR A'
   +#13#10'  SET'
   +#13#10'   A.VALOR = (SELECT SUM(VALOR) FROM FIN_APAGAR_PARCELAS P WHERE P.KFIN_APAGAR = A.KFIN_APAGAR)'
   +#13#10'WHERE A.KFIN_APAGAR = :KFIN_APAGAR AND A.RECORRENCIA = ''F''' ;
var
   p : TParams ;
begin

  if SourceDS = sqlBaixaApagar then
    begin
      p := TParams.Create ;
      p.CreateParam ( ftString, 'KFIN_APAGAR', ptInput ).asString := DeltaDS.FieldByName ( 'KFIN_APAGAR' ).OldValue ;
      TTcAbstractDB.GetByAlias('FINANCEIRO').Execute( _UPDATE_FIN_APAGAR_RECORRENTE, p );
      p.Free ;
    end;

end;

procedure TFin_BaixaAPagarColetivoDatamodule.OpenTables;
begin
  inherited;
  //
end;


procedure TFin_BaixaAPagarColetivoDatamodule.SetBaixarNoVencimento(
  const Value: boolean);
begin
  FBaixarNoVencimento := Value;
end;

procedure TFin_BaixaAPagarColetivoDatamodule.SetDataDeBaixa(
  const Value: TDateTime);
begin
  FDataDeBaixa := Value;
end;

procedure TFin_BaixaAPagarColetivoDatamodule.SetParam(DataIni, DataFim: TDateTime; ATipoTitulo : TTipoTitulo ; KCAD_ENTIDADE: string);
begin
  FDataIni       := StartOfTheDay ( DataIni ) ;
  FDataFim       := EndOfTheDay ( DataFim ) ;
  FTipoTitulo    := ATipoTitulo ;
  FKCAD_ENTIDADE := KCAD_ENTIDADE;
  SetParams;
end;


procedure TFin_BaixaAPagarColetivoDatamodule.SetParams;
begin
  cdsBaixaAPagar.Params.ParamByName( 'KSYS$DOMAIN'  ).asString       := LoggedUser.DomainID ;
  cdsBaixaAPagar.Params.ParamByName( 'DATAINI'       ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataIni ) ;
  cdsBaixaAPagar.Params.ParamByName( 'DATAFIM'       ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFim ) ;
  cdsBaixaAPagar.Params.ParamByName( 'DSP_TITULOS'   ).asInteger      := Ord ( FTipoTitulo ) + 1 ;
  cdsBaixaAPagar.Params.ParamByName( 'KCAD_ENTIDADE' ).asString       := FKCAD_ENTIDADE ;

  if FKCAD_ENTIDADE <> EmptyStr then
    cdsBaixaAPagar.Params.ParamByName( 'DSP_FORNECEDOR' ).asString := 'T'
  else
    cdsBaixaAPagar.Params.ParamByName( 'DSP_FORNECEDOR' ).asString := 'F';
end;

procedure TFin_BaixaAPagarColetivoDatamodule.Baixar;
var
 LDate : TDateTime ;
begin
//   FTituloPago := False ;

   LDate := Date  ;

   if not FBaixarNoVencimento then
    begin
     if DataDeBaixa > LDate then
        begin
          cdsBaixaAPagar.RevertRecord ;
          raise Warning.Create('Data de pagamento não pode ser superior a hoje.');
        end;

     if DataDeBaixa < EncodeDate( 1900,1,1) then
        begin
          cdsBaixaAPagar.RevertRecord ;
          raise Warning.Create('Data de pagamento inválida.');
        end;

    end;

   cdsBaixaAPagar.Edit ;
   cdsBaixaAPagarBAIXAR.asString := 'T' ;
   if FBaixarNoVencimento then
     begin
       if cdsBaixaAPagarVENCTO.asDateTime > LDate then
         cdsBaixaAPagarPAGTO.asDateTime := LDate
       else
         cdsBaixaAPagarPAGTO.asDateTime := cdsBaixaAPagarVENCTO.asDateTime ;
     end
   else
     cdsBaixaAPagarPAGTO.asDateTime := DataDeBaixa ;
   cdsBaixaAPagarPAGO.asFloat     := cdsBaixaAPagarVALOR.asFloat ;
   cdsBaixaAPagarJURO_DESCONTO.Clear ;
   cdsBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO.Clear ;
   cdsBaixaAPagar.Post ;
end;
(*
procedure TFin_BaixaAPagarColetivoDatamodule.Baixar;
const
  _UPDATE_FIN_APAGAR_RECORRENTE =
          'UPDATE FIN_APAGAR A'
   +#13#10'  SET'
   +#13#10'   A.VALOR = (SELECT SUM(VALOR) FROM FIN_APAGAR_PARCELAS P WHERE P.KFIN_APAGAR = A.KFIN_APAGAR)'
   +#13#10'WHERE A.KFIN_APAGAR = :KFIN_APAGAR AND A.RECORRENCIA = ''F''' ;
var
   p : TParams ;
begin
  if cdsBaixaAPagarPAGTO.isNull then
    raise Warning.Create('Não é possível baixar um titulo sem a data de baixa');

  if cdsBaixaAPagarPAGO.asFloat < 0 then
    raise Warning.Create('Não é possível baixar um titulo com valor inferior a 0 (zero).');

  TCdsSuppl.PostIfNeed( cdsApropriacaoJuroDesconto );

  if ( not cdsBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO.IsNull ) then
    begin
     if ( not cdsApropriacaoJuroDesconto.IsEmpty ) and ( TryVarToFloat( cdsApropriacaoJuroDescontoTOTAL_PORCENTAGEM.Value ) <> 100 ) then
      raise Warning.Create('É necessário que a somatória do percentual dos centro de custos seja 100%');

      if cdsApropriacaoJuroDesconto.IsEmpty then
        raise Warning.Create('Deve indicar pelo menos 1 centro de custo.');
    end;

  if cdsBaixaAPagarCHEQUE.asBoolean then
    cdsBaixaAPagarDT_COMPENSACAO.Clear
  else
    cdsBaixaAPagarDT_COMPENSACAO.AsSQLTimeStamp := cdsBaixaAPagarPAGTO.AsSQLTimeStamp ;
 // ApplyUpdates ;

//////  if not cdsBaixaAPagarRECORRENTE.asBoolean then
//    begin
//       p := TParams.Create ;
//       p.CreateParam ( ftString, 'KFIN_APAGAR', ptInput ).asString := cdsBaixaAPagarKFIN_APAGAR.asString ;
//       TTcAbstractDB.GetByAlias('FINANCEIRO').Execute( _UPDATE_FIN_APAGAR_RECORRENTE, p );
//       p.Free ;
//    end ;

//  FTituloPago := True ;
end;
*)
procedure TFin_BaixaAPagarColetivoDatamodule.Estornar ;
begin
//   FTituloPago := False ;
   cdsBaixaAPagar.Edit ;
   cdsBaixaAPagarCHEQUE.AsString := 'F';
   cdsBaixaAPagarNUM_CHEQUE.Clear ;
   cdsBaixaAPagarPAGTO.Clear ;
   cdsBaixaAPagarDT_COMPENSACAO.Clear ;
   cdsBaixaAPagarPAGO.Clear ;
   cdsBaixaAPagarJURO_DESCONTO.Clear ;
   cdsBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO.Clear ;
   cdsBaixaAPagar.Post ;
   with cdsApropriacaoJuroDesconto do
     if not IsEmpty then
       repeat
         first ;
         delete ;
       until( eof ) ;
//   ApplyUpdates ;
end;

procedure TFin_BaixaAPagarColetivoDatamodule.BaixarTodos;
var
 LRecno : integer ;
begin
   cdsBaixaAPagar.DisableControls ;
   with cdsBaixaAPagar do
    try
      LRecno := cdsBaixaAPagar.RecNo ;
      First ;
      while not eof do
          begin
            if not cdsBaixaAPagarBAIXAR.AsBoolean then
              Baixar ;
            next ;
          end;
    finally
      cdsBaixaAPagar.RecNo  := LRecno ;
      EnableControls ;
    end;
end;

procedure TFin_BaixaAPagarColetivoDatamodule.cdsApropriacaoJuroDescontoNewRecord(
  DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoJuroDescontoKFIN_APROPRIACAO );
  cdsApropriacaoJuroDescontoTABLENAME.AsString := 'FIN_APAGAR_PARCELAS' ;
  cdsApropriacaoJuroDescontoTABLEKEY.AsString  := cdsBaixaAPagarKFIN_APAGAR_PARCELA.AsString;
end;

procedure TFin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarBAIXARGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

  if DisplayText then
    if Sender.AsString = 'T' then
      Text := 'Sim'
    else if Sender.asString = 'F' then
      Text := 'Não';
end;

procedure TFin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarBeforePost(
  DataSet: TDataSet);
begin
   if ( cdsBaixaAPagarPAGO.isNull ) and not cdsBaixaAPagarDT_COMPENSACAO.IsNull then
     cdsBaixaAPagarDT_COMPENSACAO.Clear
   else if ( not cdsBaixaAPagarPAGO.isNull ) then
     begin
      if cdsBaixaAPagarCHEQUE.asBoolean then
          cdsBaixaAPagarDT_COMPENSACAO.Clear
      else
        begin
          cdsBaixaAPagarDT_COMPENSACAO.AsSQLTimeStamp := cdsBaixaAPagarPAGTO.AsSQLTimeStamp ;
          cdsBaixaAPagarNUM_CHEQUE.Clear ;
        end;
     end;
end;

procedure TFin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarCalcFields(
  DataSet: TDataSet);
begin
  if DataSet.State in [dsInternalCalc] then
    if cdsBaixaAPagarKFIN_CONTA.asString <> '' then
      cdsBaixaAPagarNOMECONTA_.asString :=
        cdsBaixaAPagarNOMECONTA
         .LookupDataSet
         .Lookup(
             cdsBaixaAPagarNOMECONTA.LookupKeyFields
           , cdsBaixaAPagarKFIN_CONTA.asString
           , cdsBaixaAPagarNOMECONTA.LookupResultField
        ) ;

   if DataSet.State <> dsEdit  then
      exit ;

   cdsBaixaAPagar.OnCalcFields := nil ;

   if ( cdsBaixaAPagarPAGO.isNull or (cdsBaixaAPagarPAGO.AsFloat = 0) )
    and not cdsBaixaAPagarJURO_DESCONTO.isNull then
     cdsBaixaAPagarJURO_DESCONTO.Clear
   else if cdsBaixaAPagarPAGO.AsFloat > 0 then
     cdsBaixaAPagarJURO_DESCONTO.AsFloat := cdsBaixaAPagarPAGO.AsFloat - cdsBaixaAPagarVALOR.AsFloat  ;

   if ( cdsBaixaAPagarJURO_DESCONTO.AsFloat > 0 )
     and ( cdsBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO.AsString <> TPlanoContasDespesasReceitas.GetKeyDespesas )then
       begin
         cdsBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetKeyDespesas ;
         cdsBaixaAPagarDESCRICAO_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetDescricaoDespesas  ;
         GetCentroCustoPadrao ;
       end
   else if ( cdsBaixaAPagarJURO_DESCONTO.AsFloat < 0 )
     and ( cdsBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO.AsString <> TPlanoContasDespesasReceitas.GetKeyReceitas )then
       begin
         cdsBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetKeyReceitas ;
         cdsBaixaAPagarDESCRICAO_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetDescricaoReceitas   ;
         GetCentroCustoPadrao ;
       end
   else if ( cdsBaixaAPagarJURO_DESCONTO.AsFloat = 0.00 )
     and ( not cdsBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO.isnull ) then
       begin
         cdsBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO.Clear ;
         cdsBaixaAPagarDESCRICAO_JURO_DESCONTO.asString := '' ;
         with cdsApropriacaoJuroDesconto do
           if not IsEmpty then
             repeat
               first ;
               delete ;
             until( eof ) ;
       end;

   cdsBaixaAPagar.OnCalcFields := cdsBaixaAPagarCalcFields ;


end;

procedure TFin_BaixaAPagarColetivoDatamodule.GetCentroCustoFromPedido ;
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
  p.CreateParam( ftString, 'TABLEKEY', ptInput ).asString := cdsBaixaAPagarTABLEKEY.asString ;
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

procedure TFin_BaixaAPagarColetivoDatamodule.GetCentroCustoPadrao;
begin
    if not cdsApropriacaoJuroDesconto.IsEmpty then
       exit ;

    if cdsBaixaAPagarTABLENAME.asString = '' then
      SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
         'FIN_APAGAR', cdsBaixaAPagarKFIN_APAGAR.asString,
         'FIN_APAGAR_PARCELAS', cdsBaixaAPagarKFIN_APAGAR_PARCELA.AsString,
       cdsApropriacaoJuroDesconto, True )
    else
       GetCentroCustoFromPedido ;
end;

procedure TFin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarNUM_CHEQUESetText(Sender: TField;
      const Text: string);
begin
  if Text.Trim = '' then
   begin
    cdsBaixaAPagarNUM_CHEQUE.Clear ;
    cdsBaixaAPagarCHEQUE.asString := 'F' ;
   end
  else
   begin
    cdsBaixaAPagarNUM_CHEQUE.asString := Text ;
    cdsBaixaAPagarCHEQUE.asString := 'T' ;
   end;

end;

procedure TFin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarPROVISAOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if ( not Sender.DataSet.Active ) or ( Sender.DataSet.isEmpty ) then
     exit ;

  if DisplayText then
    if Sender.AsString = 'T' then
      Text := 'Sim'
    else if Sender.asString = 'F' then
      Text := 'Não';
end;

procedure TFin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarVALORChange(
  Sender: TField);
begin
  cdsBaixaAPagarPAGO.AsFloat := Sender.asFloat ;
end;

end.
