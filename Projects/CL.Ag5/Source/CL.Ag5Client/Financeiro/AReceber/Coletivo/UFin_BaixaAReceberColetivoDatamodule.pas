unit UFin_BaixaAReceberColetivoDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Datasnap.Provider, UdtmSYS_BASE, Tc.Data.SQLExpr ;

type

  TTipoTitulo = ( ttAReceber, ttRecebidos, ttAmbos) ;

  TFin_BaixaAReceberColetivoDatamodule = class(T_dtmBASE)
    cdsBaixaAReceber: TClientDataSet;
    dspBaixaAReceber: TDataSetProvider;
    sqlBaixaAReceber: TTcSQLDataSet;
    dtsBaixaAReceber: TDataSource;
    sqlBaixaAReceberKFIN_ARECEBER_PARCELA: TStringField;
    sqlBaixaAReceberVENCTO: TSQLTimeStampField;
    sqlBaixaAReceberKCAD_ENTIDADE: TStringField;
    sqlBaixaAReceberNOMEENTIDADE: TStringField;
    sqlBaixaAReceberVALOR: TFloatField;
    sqlBaixaAReceberKFIN_CONTA: TStringField;
    sqlBaixaAReceberOBS: TMemoField;
    cdsBaixaAReceberKFIN_ARECEBER_PARCELA: TStringField;
    cdsBaixaAReceberVENCTO: TSQLTimeStampField;
    cdsBaixaAReceberKCAD_ENTIDADE: TStringField;
    cdsBaixaAReceberNOMEENTIDADE: TStringField;
    cdsBaixaAReceberVALOR: TFloatField;
    cdsBaixaAReceberKFIN_CONTA: TStringField;
    cdsBaixaAReceberCONTA: TStringField;
    cdsBaixaAReceberOBS: TMemoField;
    sqlBaixaAReceberPARCELAS: TStringField;
    cdsBaixaAReceberPARCELAS: TStringField;
    sqlBaixaAReceberPAGTO: TSQLTimeStampField;
    sqlBaixaAReceberPAGO: TFloatField;
    cdsBaixaAReceberPAGTO: TSQLTimeStampField;
    cdsBaixaAReceberPAGO: TFloatField;
    sqlBaixaAReceberDOCUMENTO: TStringField;
    cdsBaixaAReceberDOCUMENTO: TStringField;
    sqlBaixaAReceberHISTORICO: TStringField;
    cdsBaixaAReceberHISTORICO: TStringField;
    sqlBaixaAReceberDATACOMPRA: TSQLTimeStampField;
    sqlBaixaAReceberKFIN_ARECEBER: TStringField;
    sqlBaixaAReceberKVND_PEDIDO: TStringField;
    cdsBaixaAReceberKFIN_ARECEBER: TStringField;
    cdsBaixaAReceberKVND_PEDIDO: TStringField;
    cdsBaixaAReceberDATACOMPRA: TSQLTimeStampField;
    cdsBaixaAReceberBAIXAR: TStringField;
    cdsBaixaAReceberPROVISAO: TStringField;
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
    sqlBaixaAReceberTABLENAME: TStringField;
    sqlBaixaAReceberTABLEKEY: TStringField;
    sqlBaixaAReceberPROVISAO: TStringField;
    sqlBaixaAReceberJURO_DESCONTO: TFloatField;
    sqlBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO: TStringField;
    sqlBaixaAReceberCHEQUE: TStringField;
    sqlBaixaAReceberDT_COMPENSACAO: TSQLTimeStampField;
    cdsBaixaAReceber_tmpcalc: TIntegerField;
    cdsBaixaAReceberJURO_DESCONTO: TFloatField;
    cdsBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO: TStringField;
    cdsBaixaAReceberCHEQUE: TStringField;
    cdsBaixaAReceberNOMECONTA: TStringField;
    cdsBaixaAReceberDESCRICAO_JURO_DESCONTO: TStringField;
    cdsBaixaAReceberDT_COMPENSACAO: TSQLTimeStampField;
    sqlBaixaAReceberKFIN_CONTA_PREF: TStringField;
    sqlBaixaAReceberCONTA: TStringField;
    cdsBaixaAReceberTABLENAME: TStringField;
    cdsBaixaAReceberTABLEKEY: TStringField;
    cdsBaixaAReceberKFIN_CONTA_PREF: TStringField;
    cdsBaixaARecebersqlApropriacaoJuroDesconto: TDataSetField;
    sqlBaixaAReceberBAIXADO: TStringField;
    sqlBaixaAReceberBAIXAR: TStringField;
    cdsBaixaAReceberBAIXADO: TStringField;
    DataSource1: TDataSource;
    sqlBaixaAReceberNUM_CHEQUE: TStringField;
    cdsBaixaAReceberNUM_CHEQUE: TStringField;
    cdsBaixaAReceberNOMECONTA_: TStringField;
    cdsBaixaAReceberDOCUMENTO_: TStringField;
    sqlBaixaAReceberDOCUMENTO_: TStringField;
    procedure cdsApropriacaoJuroDescontoNewRecord(DataSet: TDataSet);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure cdsBaixaAReceberCalcFields(DataSet: TDataSet);
    procedure cdsBaixaAReceberNUM_CHEQUESetText(Sender: TField;
      const Text: string);
    procedure cdsBaixaAReceberBAIXARGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsBaixaAReceberPROVISAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsBaixaAReceberBeforePost(DataSet: TDataSet);
    procedure cdsBaixaAReceberVALORChange(Sender: TField);
    procedure dspBaixaAReceberAfterUpdateRecord(Sender: TObject;
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

{ TrdmFin_BaixaAReceberDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFin_BaixaAReceberColetivoDatamodule.Create(AOwner: TComponent);
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


procedure TFin_BaixaAReceberColetivoDatamodule.DataSource1DataChange(
  Sender: TObject; Field: TField);
begin
  if Field = cdsBaixaAreceberBAIXAR then
    begin
       DataSource1.Enabled := False ;

       if cdsBaixaAreceberBAIXAR = cdsBaixaAreceberBAIXADO then
          cdsBaixaAreceber.RevertRecord
       else if cdsBaixaAreceberBAIXAR.AsBoolean then
          Baixar
       else
          Estornar ;

       DataSource1.Enabled := True ;
    end;
end;



procedure TFin_BaixaAReceberColetivoDatamodule.dspBaixaAReceberAfterUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
const
  _UPDATE_FIN_ARECEBER_RECORRENTE =
          'UPDATE FIN_ARECEBER A'
   +#13#10'  SET'
   +#13#10'   A.VALOR = (SELECT SUM(VALOR) FROM FIN_ARECEBER_PARCELAS P WHERE P.KFIN_ARECEBER = A.KFIN_ARECEBER)'
   +#13#10'WHERE A.KFIN_ARECEBER = :KFIN_ARECEBER AND A.RECORRENCIA = ''F''' ;
var
   p : TParams ;
begin

  if SourceDS = sqlBaixaAreceber then
    begin
      p := TParams.Create ;
      p.CreateParam ( ftString, 'KFIN_ARECEBER', ptInput ).asString := DeltaDS.FieldByName ( 'KFIN_ARECEBER' ).OldValue ;
      TTcAbstractDB.GetByAlias('FINANCEIRO').Execute( _UPDATE_FIN_ARECEBER_RECORRENTE, p );
      p.Free ;
    end;

end;

procedure TFin_BaixaAReceberColetivoDatamodule.OpenTables;
begin

  inherited;
  //
end;


procedure TFin_BaixaAReceberColetivoDatamodule.SetBaixarNoVencimento(
  const Value: boolean);
begin
  FBaixarNoVencimento := Value;
end;

procedure TFin_BaixaAReceberColetivoDatamodule.SetDataDeBaixa(
  const Value: TDateTime);
begin
  FDataDeBaixa := Value;
end;

procedure TFin_BaixaAReceberColetivoDatamodule.SetParam(DataIni, DataFim: TDateTime; ATipoTitulo : TTipoTitulo ; KCAD_ENTIDADE: string);
begin
  FDataIni       := StartOfTheDay ( DataIni ) ;
  FDataFim       := EndOfTheDay ( DataFim ) ;
  FTipoTitulo    := ATipoTitulo ;
  FKCAD_ENTIDADE := KCAD_ENTIDADE;
  SetParams;
end;


procedure TFin_BaixaAReceberColetivoDatamodule.SetParams;
begin
  cdsBaixaAReceber.Params.ParamByName( 'KSYS$DOMAIN'  ).asString       := LoggedUser.DomainID ;
  cdsBaixaAReceber.Params.ParamByName( 'DATAINI'       ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataIni ) ;
  cdsBaixaAReceber.Params.ParamByName( 'DATAFIM'       ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFim ) ;
  cdsBaixaAReceber.Params.ParamByName( 'DSP_TITULOS'   ).asInteger      := Ord ( FTipoTitulo ) + 1 ;
  cdsBaixaAReceber.Params.ParamByName( 'KCAD_ENTIDADE' ).asString       := FKCAD_ENTIDADE ;

  if FKCAD_ENTIDADE <> EmptyStr then
    cdsBaixaAReceber.Params.ParamByName( 'DSP_CLIENTE' ).asString := 'T'
  else
    cdsBaixaAReceber.Params.ParamByName( 'DSP_CLIENTE' ).asString := 'F';
end;

procedure TFin_BaixaAReceberColetivoDatamodule.Baixar;
var
 LDate : TDateTime ;
begin
//   FTituloRecebido := False ;

   LDate := Date  ;

   if not FBaixarNoVencimento then
    begin
     if DataDeBaixa > LDate then
        begin
          cdsBaixaAReceber.RevertRecord ;
          raise Warning.Create('Data de recebimento não pode ser superior a hoje.');
        end;

     if DataDeBaixa < EncodeDate( 1900,1,1) then
        begin
          cdsBaixaAReceber.RevertRecord ;
          raise Warning.Create('Data de recebimento inválida.');
        end;

    end;

   cdsBaixaAReceber.Edit ;
   cdsBaixaAReceberBAIXAR.asString := 'T' ;
   if FBaixarNoVencimento then
     begin
       if cdsBaixaAReceberVENCTO.asDateTime > LDate then
         cdsBaixaAReceberPAGTO.asDateTime := LDate
       else
         cdsBaixaAReceberPAGTO.asDateTime := cdsBaixaAReceberVENCTO.asDateTime ;
     end
   else
     cdsBaixaAReceberPAGTO.asDateTime := DataDeBaixa ;
   cdsBaixaAReceberPAGO.asFloat     := cdsBaixaAReceberVALOR.asFloat ;
   cdsBaixaAReceberJURO_DESCONTO.Clear ;
   cdsBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO.Clear ;
   cdsBaixaAReceber.Post ;
end;
(*
procedure TFin_BaixaAReceberColetivoDatamodule.Baixar;
const
  _UPDATE_FIN_ARECEBER_RECORRENTE =
          'UPDATE FIN_ARECEBER A'
   +#13#10'  SET'
   +#13#10'   A.VALOR = (SELECT SUM(VALOR) FROM FIN_ARECEBER_PARCELAS P WHERE P.KFIN_ARECEBER = A.KFIN_ARECEBER)'
   +#13#10'WHERE A.KFIN_ARECEBER = :KFIN_ARECEBER AND A.RECORRENCIA = ''F''' ;
var
   p : TParams ;
begin
  if cdsBaixaAReceberPAGTO.isNull then
    raise Warning.Create('Não é possível baixar um titulo sem a data de baixa');

  if cdsBaixaAReceberPAGO.asFloat < 0 then
    raise Warning.Create('Não é possível baixar um titulo com valor inferior a 0 (zero).');

  TCdsSuppl.PostIfNeed( cdsApropriacaoJuroDesconto );

  if ( not cdsBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO.IsNull ) then
    begin
     if ( not cdsApropriacaoJuroDesconto.IsEmpty ) and ( TryVarToFloat( cdsApropriacaoJuroDescontoTOTAL_PORCENTAGEM.Value ) <> 100 ) then
      raise Warning.Create('É necessário que a somatória do percentual dos centro de custos seja 100%');

      if cdsApropriacaoJuroDesconto.IsEmpty then
        raise Warning.Create('Deve indicar pelo menos 1 centro de custo.');
    end;

  if cdsBaixaAReceberCHEQUE.asBoolean then
    cdsBaixaAReceberDT_COMPENSACAO.Clear
  else
    cdsBaixaAReceberDT_COMPENSACAO.AsSQLTimeStamp := cdsBaixaAReceberPAGTO.AsSQLTimeStamp ;
 // ApplyUpdates ;

//////  if not cdsBaixaAReceberRECORRENTE.asBoolean then
//    begin
//       p := TParams.Create ;
//       p.CreateParam ( ftString, 'KFIN_ARECEBER', ptInput ).asString := cdsBaixaAReceberKFIN_ARECEBER.asString ;
//       TTcAbstractDB.GetByAlias('FINANCEIRO').Execute( _UPDATE_FIN_ARECEBER_RECORRENTE, p );
//       p.Free ;
//    end ;

//  FTituloRecebido := True ;
end;
*)
procedure TFin_BaixaAReceberColetivoDatamodule.Estornar ;
begin
//   FTituloRecebido := False ;
   cdsBaixaAReceber.Edit ;
   cdsBaixaAReceberCHEQUE.AsString := 'F';
   cdsBaixaAReceberNUM_CHEQUE.Clear ;
   cdsBaixaAReceberPAGTO.Clear ;
   cdsBaixaAReceberDT_COMPENSACAO.Clear ;
   cdsBaixaAReceberPAGO.Clear ;
   cdsBaixaAReceberJURO_DESCONTO.Clear ;
   cdsBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO.Clear ;
   cdsBaixaAReceber.Post ;
   with cdsApropriacaoJuroDesconto do
     if not IsEmpty then
       repeat
         first ;
         delete ;
       until( eof ) ;
//   ApplyUpdates ;
end;

procedure TFin_BaixaAReceberColetivoDatamodule.BaixarTodos;
var
 LRecno : integer ;
begin
   cdsBaixaAReceber.DisableControls ;
   with cdsBaixaAReceber do
    try
      LRecno := cdsBaixaAReceber.RecNo ;
      First ;
      while not eof do
          begin
            if not cdsBaixaAReceberBAIXAR.AsBoolean then
              Baixar ;
            next ;
          end;
    finally
      cdsBaixaAReceber.RecNo  := LRecno ;
      EnableControls ;
    end;
end;

procedure TFin_BaixaAReceberColetivoDatamodule.cdsApropriacaoJuroDescontoNewRecord(
  DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoJuroDescontoKFIN_APROPRIACAO );
  cdsApropriacaoJuroDescontoTABLENAME.AsString := 'FIN_ARECEBER_PARCELAS' ;
  cdsApropriacaoJuroDescontoTABLEKEY.AsString  := cdsBaixaAReceberKFIN_ARECEBER_PARCELA.AsString;
end;

procedure TFin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberBAIXARGetText(
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

procedure TFin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberBeforePost(
  DataSet: TDataSet);
begin
   if ( cdsBaixaAReceberPAGO.isNull ) and not cdsBaixaAReceberDT_COMPENSACAO.IsNull then
     cdsBaixaAReceberDT_COMPENSACAO.Clear
   else if ( not cdsBaixaAReceberPAGO.isNull ) then
     begin
      if cdsBaixaAReceberCHEQUE.asBoolean then
        cdsBaixaAReceberDT_COMPENSACAO.Clear
      else
        begin
           cdsBaixaAReceberDT_COMPENSACAO.AsSQLTimeStamp := cdsBaixaAReceberPAGTO.AsSQLTimeStamp ;
           cdsBaixaAReceberNUM_CHEQUE.Clear ;
        end;
     end;
end;

procedure TFin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberCalcFields(
  DataSet: TDataSet);
begin
  if DataSet.State in [dsInternalCalc] then
    if cdsBaixaAReceberKFIN_CONTA.asString <> '' then
      cdsBaixaAReceberNOMECONTA_.asString :=
        cdsBaixaAReceberNOMECONTA
         .LookupDataSet
         .Lookup(
             cdsBaixaAReceberNOMECONTA.LookupKeyFields
           , cdsBaixaAReceberKFIN_CONTA.asString
           , cdsBaixaAReceberNOMECONTA.LookupResultField
        ) ;

   if DataSet.State <> dsEdit  then
      exit ;

   cdsBaixaAReceber.OnCalcFields := nil ;

   if ( cdsBaixaAReceberPAGO.isNull or (cdsBaixaAReceberPAGO.AsFloat = 0) )
    and not cdsBaixaAReceberJURO_DESCONTO.isNull then
     cdsBaixaAReceberJURO_DESCONTO.Clear
   else if cdsBaixaAReceberPAGO.AsFloat > 0 then
     cdsBaixaAReceberJURO_DESCONTO.AsFloat := cdsBaixaAReceberPAGO.AsFloat - cdsBaixaAReceberVALOR.AsFloat  ;

   if ( cdsBaixaAReceberJURO_DESCONTO.AsFloat > 0 )
     and ( cdsBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO.AsString <> TPlanoContasDespesasReceitas.GetKeyReceitas )then
       begin
         cdsBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetKeyReceitas ;
         cdsBaixaAReceberDESCRICAO_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetDescricaoReceitas   ;
         GetCentroCustoPadrao ;
   end
   else if ( cdsBaixaAReceberJURO_DESCONTO.AsFloat < 0 )
     and ( cdsBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO.AsString <> TPlanoContasDespesasReceitas.GetKeyDespesas )then
       begin
         cdsBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetKeyDespesas ;
         cdsBaixaAReceberDESCRICAO_JURO_DESCONTO.AsString := TPlanoContasDespesasReceitas.GetDescricaoDespesas  ;
         GetCentroCustoPadrao ;
       end
   else if ( cdsBaixaAReceberJURO_DESCONTO.AsFloat = 0.00)
     and ( not cdsBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO.isnull ) then
       begin
         cdsBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO.Clear ;
         cdsBaixaAReceberDESCRICAO_JURO_DESCONTO.asString := '' ;
         with cdsApropriacaoJuroDesconto do
           if not IsEmpty then
             repeat
               first ;
               delete ;
             until( eof ) ;
       end;

   cdsBaixaAReceber.OnCalcFields := cdsBaixaAReceberCalcFields ;


end;

procedure TFin_BaixaAReceberColetivoDatamodule.GetCentroCustoFromPedido ;
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
  p.CreateParam( ftString, 'TABLEKEY', ptInput ).asString := cdsBaixaAReceberTABLEKEY.asString ;
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

procedure TFin_BaixaAReceberColetivoDatamodule.GetCentroCustoPadrao;
begin
    if not cdsApropriacaoJuroDesconto.IsEmpty then
       exit ;

    if cdsBaixaAReceberTABLENAME.asString = '' then
      SvcFinanceiroApropriacaoDefault.AddCentroCustoFromTo(
         'FIN_ARECEBER', cdsBaixaAReceberKFIN_ARECEBER.asString,
         'FIN_ARECEBER_PARCELAS', cdsBaixaAReceberKFIN_ARECEBER_PARCELA.AsString,
       cdsApropriacaoJuroDesconto, True )
    else
       GetCentroCustoFromPedido ;
end;

procedure TFin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberNUM_CHEQUESetText(Sender: TField;
      const Text: string);
begin
  if Text = '' then
   begin
    cdsBaixaAReceberNUM_CHEQUE.Clear ;
    cdsBaixaAReceberCHEQUE.asString := 'F' ;
   end
  else
   begin
    cdsBaixaAReceberNUM_CHEQUE.asString := Text ;
    cdsBaixaAReceberCHEQUE.asString := 'T' ;
   end;

end;

procedure TFin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberPROVISAOGetText(
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

procedure TFin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberVALORChange(
  Sender: TField);
begin
  cdsBaixaAReceberPAGO.AsFloat := Sender.asFloat ;
end;

end.
