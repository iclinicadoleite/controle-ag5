unit UdtmFIN_FluxoCaixa2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, Tc.VCL.Application, Tc.Data.SQLExpr  ;

{$DEFINE _CDL_OPT}

Const

   _TIPO_ANALITICO_SALDO             = 0  ;
   _TIPO_ANALITICO_SUMARIO_SALDO     = 1  ;
   _TIPO_ANALITICO_APAGAR_NC         = 2  ;
   _TIPO_ANALITICO_ARECEBER_NC       = 3  ;
   _TIPO_ANALITICO_SUMARIO_NC        = 4  ;
   _TIPO_ANALITICO_APAGAR_EMATRASO   = 5  ;
   _TIPO_ANALITICO_ARECEBER_EMATRASO = 6  ;
   _TIPO_ANALITICO_SUMARIO_EMATRASO  = 7  ;
   _TIPO_ANALITICO_APAGAR            = 8  ;
   _TIPO_ANALITICO_ARECEBER          = 9  ;
   _TIPO_ANALITICO_AVENCER           = 10 ;
   _TIPO_ANALITICO_SUMARIO_AVENCER   = 11 ;
   _TIPO_ANALITICO_SUMARIO           = 12 ;

type
  TTipoFluxo = ( tfAnalitico, tfSemanal, tfQuinzenal, tfMensal, tfResumo ) ;

  TAddItemCallback = procedure ( ATipo : integer ; AVencto : TDateTime ; ADescricao : string ; ACredito, ADebito, ASaldo : Double  ) of object ;

  TFluxoConfig = class
  private
    FDomainID: variant;
    FDuvidosoAReceber: boolean;
    FDuvidosoAPagar: boolean;
    FTipoFluxo: TTipoFluxo;
    FPrevisaoAReceber: boolean;
    FAtrasoAReceber: boolean;
    FPrevisaoAPagar: boolean;
    FAtrasoAPagar: boolean;
    FData: TDateTime;
    FContas: string;
    FAddItemCallback: TAddItemCallback;
    FExibirSumarios: boolean;
    FDataFluxo : TDateTime ;
    FMesFluxo  : Word ;
    FAnoFluxo  : Word ;
    procedure SetAtrasoAPagar(const Value: boolean);
    procedure SetAtrasoAReceber(const Value: boolean);
    procedure SetData(const Value: TDateTime);
    procedure SetDuvidosoAPagar(const Value: boolean);
    procedure SetDuvidosoAReceber(const Value: boolean);
    procedure SetPrevisaoAPagar(const Value: boolean);
    procedure SetPrevisaoAReceber(const Value: boolean);
    procedure SetTipoFluxo(const Value: TTipoFluxo);
    procedure SetDomainID(const Value: variant);
    procedure SetContas(const Value: string);
    procedure SetAddItemCallback(const Value: TAddItemCallback);
    procedure SetExibirSumarios(const Value: boolean);
    procedure SetDataFluxo(const Value: TDateTime);
  public
    property DomainID : variant  read FDomainID write SetDomainID;
    property Contas : string  read FContas write SetContas;
    property TipoFluxo : TTipoFluxo  read FTipoFluxo write SetTipoFluxo;
    property Data : TDateTime  read FData write SetData;
    property AtrasoAReceber : boolean  read FAtrasoAReceber write SetAtrasoAReceber;
    property AtrasoAPagar : boolean  read FAtrasoAPagar write SetAtrasoAPagar;
    property PrevisaoAReceber : boolean  read FPrevisaoAReceber write SetPrevisaoAReceber;
    property PrevisaoAPagar : boolean  read FPrevisaoAPagar write SetPrevisaoAPagar;
    property DuvidosoAReceber : boolean  read FDuvidosoAReceber write SetDuvidosoAReceber;
    property DuvidosoAPagar : boolean  read FDuvidosoAPagar write SetDuvidosoAPagar;
    property AddItemCallback : TAddItemCallback  read FAddItemCallback write SetAddItemCallback;
    property ExibirSumarios : boolean  read FExibirSumarios write SetExibirSumarios;
    property DataFluxo : TDateTime  read FDataFluxo write SetDataFluxo ;
    property MesFluxo : Word  read FMesFluxo ;
    property AnoFluxo : Word  read FAnoFluxo ;
  end;

  TdtmFIN_FluxoCaixa2 = class(TDataModule)
    cdsFluxo: TClientDataSet;
    cdsFluxoDATA: TDateField;
    cdsFluxoDESCRICAO: TStringField;
    cdsFluxoCREDITO: TFloatField;
    cdsFluxoDEBITO: TFloatField;
    cdsFluxoSALDO: TFloatField;
    cdsSumarioAtraso: TClientDataSet;
    cdsSumarioAtrasoCREDITO: TFloatField;
    cdsSumarioAtrasoDEBITO: TFloatField;
    cdsSumarioAtrasoSALDO: TFloatField;
    cdsContas: TClientDataSet;
    cdsFluxoTIPO: TSmallintField;
    cdsLstContas: TClientDataSet;
    dspLstContas: TDataSetProvider;
    sqlLstContas: TTcSQLDataSet;
    sqlLstContasKFIN_CONTA: TStringField;
    sqlLstContasKFIN_BANCO: TStringField;
    sqlLstContasAGENCIA: TStringField;
    sqlLstContasCONTA_CORRENTE: TStringField;
    sqlLstContasNOME: TStringField;
    sqlLstContasBANCO: TStringField;
    cdsLstContasKFIN_CONTA: TStringField;
    cdsLstContasKFIN_BANCO: TStringField;
    cdsLstContasNOME: TStringField;
    cdsLstContasBANCO: TStringField;
    cdsLstContasAGENCIA: TStringField;
    cdsLstContasCONTA_CORRENTE: TStringField;
    cdsLstContasSELECT: TIntegerField;
    cdsContasNOME: TStringField;
    cdsContasSALDOCC: TFloatField;
    cdsSumarioAtrasoDESCRICAO: TStringField;
    cdsSumarioAtrasoTIPO: TSmallintField;
    procedure dtmFluxoCreate(Sender: TObject);
    procedure dtmFluxoDestroy(Sender: TObject);
    procedure cdsLstContasBeforeOpen(DataSet: TDataSet);
    procedure cdsLstContasSELECTGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsLstContasCalcFields(DataSet: TDataSet);
    procedure cdsSumarioAtrasoTIPOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    FFluxoConfig : TFluxoConfig ;

    ListaBancos : TStringList ;
    FSaldoInicialContas: double;
    FAReceberEmAtraso: double;
    FAPagarEmAtraso: double;
    function GetContas : string ;

    procedure AddItemAnalitico( ATipo : integer ; AVencto : TDateTime ; ADescricao : string ; ACredito, ADebito, ASaldo : Double  ) ;
    procedure AddItemSintetico( ATipo : integer ; AVencto : TDateTime ; ADescricao : string ; ACredito, ADebito, ASaldo : Double  ) ;

    procedure cdsFluxoDATAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsFluxoSinteticoDATAGetText(Sender: TField; var Text: string; DisplayText: Boolean);

  public
    { Public declarations }
    property  Config : TFluxoConfig read FFluxoConfig ;
    procedure Execute ;

    procedure FluxoResumoMensal ;

    property SaldoInicialContas : double  read FSaldoInicialContas ;
    property AReceberEmAtraso : double  read FAReceberEmAtraso ;
    property APagarEmAtraso : double  read FAPagarEmAtraso ;

    procedure InvertSelecaoContas;
    procedure InvertAllContas( ASelectAll : Boolean );
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

  TAF = class  ( TAggregateField ) ;

  TFluxoDeCaixa = class
  private
    FMaxDate : TDateTime ;
    FSaldo  : Double ;
    FSaldoTotalContas : double ;

    FSaldoDevedor : double ;
    FSaldoCredor   : double ;

    FAReceberNaoConsiliado : double ;
    FAPagarNaoConsiliado   : double ;

    FAReceberEmAtrazo : double ;
    FAPagarEmAtrazo   : double ;

    FAReceberAVencer : double ;
    FAPagarAVencer   : double ;

    FConfig : TFluxoConfig ;
    function VenctoSintetico ( AVencto : TDateTime ) : TDateTime ;
    function GetDescricaoSintetico( ADate : TDateTime ) : string;
    procedure SaldoContas ;
    procedure TitulosNaoConsiliado ;
    procedure AReceberNaoConsiliado ;
    procedure APagarNaoConsiliado ;
    procedure TitulosEmAtrazo ;
    procedure AReceberEmAtraso ;
    procedure APagarEmAtraso ;
    procedure TitulosAVencer ;
    procedure TitulosAVencerAnalitico ( ACDS : TClientDataSet ) ;
    procedure TitulosAVencerSintetico ( ACDS : TClientDataSet ) ;
    procedure DoAddItem ( ATipo : integer ; AVencto : TDateTime ; ADescricao : string ; ACredito, ADebito : double ) ;
  public
    procedure Execute ( AConfig : TFluxoConfig ) ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, Data.DBXCommon, Math, UDBFinanceiro, DateUtils , Exceptions, CDSSuppl
     , DataSnap.DSConnect

      ;

{$R *.DFM}

{ TrdmdtmFIN_FluxoCaixa2 }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmFIN_FluxoCaixa2.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


// opcão inicial ...
procedure TdtmFIN_FluxoCaixa2.AddItemAnalitico(ATipo: integer;
  AVencto: TDateTime; ADescricao: string; ACredito, ADebito, ASaldo: Double);
var
 LDescricao : string ;
begin

  LDescricao := ADescricao ;
  if ( ATipo = _TIPO_ANALITICO_SALDO ) then
     LDescricao :=  'Saldo da conta : ' + LDescricao

  else if ( ATipo = _TIPO_ANALITICO_ARECEBER ) then
     LDescricao := StringReplace ( LDescricao, 'Nota fiscal de venda: (', '(NF ', [rfIgnoreCase] )
//     LDescricao := StringReplace ( LDescricao, 'Venda com nota fiscal: (', '(NF ', [rfIgnoreCase] )
  else if ( ATipo = _TIPO_ANALITICO_APAGAR ) then
     LDescricao := StringReplace ( LDescricao, 'Nota fiscal de compra: (', '(NF ', [rfIgnoreCase] ) ;


  if (
        ( ATipo in [
           _TIPO_ANALITICO_SALDO,
           {$IFDEF _CDL_OPT}
            _TIPO_ANALITICO_SUMARIO_NC,
           {$ELSE}
            _TIPO_ANALITICO_APAGAR_NC,
            _TIPO_ANALITICO_ARECEBER_NC,
           {$ENDIF}
           _TIPO_ANALITICO_APAGAR_EMATRASO,
           _TIPO_ANALITICO_ARECEBER_EMATRASO,
           _TIPO_ANALITICO_APAGAR,
           _TIPO_ANALITICO_ARECEBER,
           _TIPO_ANALITICO_AVENCER ]
        )
     or (     self.FFluxoConfig.ExibirSumarios
           and ( ATipo in [
                          _TIPO_ANALITICO_SUMARIO_SALDO,
                          _TIPO_ANALITICO_SUMARIO_NC,
                          _TIPO_ANALITICO_SUMARIO_EMATRASO,
                          _TIPO_ANALITICO_SUMARIO_AVENCER,
                          _TIPO_ANALITICO_SUMARIO
                          ]
               )
         )
     ) then
     cdsFluxo.AppendRecord( [ ATipo, AVencto, LDescricao, ACredito, ADebito, ASaldo ] ) ;
end;

procedure TdtmFIN_FluxoCaixa2.AddItemSintetico(ATipo: integer;
  AVencto: TDateTime; ADescricao: string; ACredito, ADebito, ASaldo: Double);
var
 LDescricao : string ;
begin

  LDescricao := ADescricao ;

  if ( ATipo = _TIPO_ANALITICO_SALDO ) then
    cdsContas.AppendRecord([ ADescricao, ACredito - ADebito ]) ;

  if ( ATipo = _TIPO_ANALITICO_SUMARIO_SALDO ) then
    self.FSaldoInicialContas := ASaldo ;

  if ( ATipo in [
        {$IFDEF _CDL_OPT}
         _TIPO_ANALITICO_SUMARIO_NC,
        {$ELSE}
         _TIPO_ANALITICO_ARECEBER_NC,
         _TIPO_ANALITICO_APAGAR_NC ,
        {$ENDIF}
        _TIPO_ANALITICO_ARECEBER_EMATRASO,
        _TIPO_ANALITICO_APAGAR_EMATRASO ]
     )
    or   ( self.FFluxoConfig.ExibirSumarios
           and ( ATipo in [
                     {$IFNDEF _CDL_OPT}
                      _TIPO_ANALITICO_SUMARIO_NC,
                     {$ENDIF}
                      _TIPO_ANALITICO_SUMARIO_EMATRASO ] ) ) then
    cdsSumarioAtraso.AppendRecord([ ATipo, ADescricao, ACredito, ADebito, ASaldo ]) ;

 if (
       (ATipo = _TIPO_ANALITICO_AVENCER )
    or ( self.FFluxoConfig.ExibirSumarios
       and  ( ATipo in [ _TIPO_ANALITICO_AVENCER, _TIPO_ANALITICO_SUMARIO_AVENCER, _TIPO_ANALITICO_SUMARIO ] )
       )
    ) then
   cdsFluxo.AppendRecord( [ ATipo, AVencto, LDescricao, ACredito, ADebito, ASaldo ] ) ;
end;

procedure TdtmFIN_FluxoCaixa2.cdsFluxoDATAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if  ( cdsFluxoTIPO.asInteger  in [
        _TIPO_ANALITICO_SUMARIO_SALDO,
        {$IFNDEF _CDL_OPT}_TIPO_ANALITICO_SUMARIO_NC,{$ENDIF}
        _TIPO_ANALITICO_SUMARIO_EMATRASO,
        _TIPO_ANALITICO_SUMARIO_AVENCER  ] ) then
       Text := '( * )'
   else if  ( cdsFluxoTIPO.asInteger  in [
        _TIPO_ANALITICO_SUMARIO ] ) then
       Text := '( = )'
   else if  ( cdsFluxoTIPO.asInteger  in
          [   _TIPO_ANALITICO_SALDO {$IFDEF _CDL_OPT}, _TIPO_ANALITICO_SUMARIO_NC{$ENDIF} ] ) then
       begin
         if  ( cdsFluxoCREDITO.asFloat > 0 ) and ( cdsFluxoDEBITO.asFloat > 0 ) then
            Text := '( +/- )'
         else if  ( cdsFluxoCREDITO.asFloat > 0 ) then
            Text := '( + )'
         else if ( cdsFluxoDEBITO.asFloat > 0 ) then
            Text := '( - )'
       end
   else if  ( cdsFluxoTIPO.asInteger  in
          [   _TIPO_ANALITICO_ARECEBER_NC, _TIPO_ANALITICO_ARECEBER_EMATRASO ] ) then
        Text := '( + )'
   else if  ( cdsFluxoTIPO.asInteger  in
          [   _TIPO_ANALITICO_APAGAR_NC, _TIPO_ANALITICO_APAGAR_EMATRASO ] ) then
        Text := '( - )'
  else if YearOf ( Sender.AsDateTime ) = FFluxoConfig.FAnoFluxo then
    begin
     if MonthOf ( Sender.AsDateTime ) = FFluxoConfig.FMesFluxo then
       begin
         if Sender.AsDateTime = FFluxoConfig.FDataFluxo then
           Text := 'hoje'
         else
          Text := FormatDateTime ( '"dia" dd', Sender.AsDateTime ) ;
       end
     else
       Text := FormatDateTime ( 'dd/mmm', Sender.AsDateTime )
    end
  else
       Text := FormatDateTime ( 'dd/mmm/yyyy', Sender.AsDateTime )
end;

procedure TdtmFIN_FluxoCaixa2.cdsFluxoSinteticoDATAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := ' ' + cdsFluxoDESCRICAO.asString ;
end;

procedure TdtmFIN_FluxoCaixa2.cdsLstContasBeforeOpen(DataSet: TDataSet);
begin
  cdsLstContas.Params.ParamByName( 'KSYS$DOMAIN' ).AsString := FFluxoConfig.DomainID;
end;

procedure TdtmFIN_FluxoCaixa2.cdsLstContasCalcFields(DataSet: TDataSet);
begin
   if ( DataSet.State in [dsInternalCalc] ) and ( cdsLstContasSELECT.IsNull )  then
    cdsLstContasSELECT.asInteger := 0 ;
end;

procedure TdtmFIN_FluxoCaixa2.cdsLstContasSELECTGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if cdsLstContas.IsEmpty then
     exit ;

   if DisplayText then
     begin
        if Sender.asInteger = 1 then
           Text := 'Sim'
        else
           Text := 'Não'
     end
   else
     Text := Sender.asString
end;

procedure TdtmFIN_FluxoCaixa2.cdsSumarioAtrasoTIPOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if  ( cdsSumarioAtrasoTIPO.asInteger  in [
        _TIPO_ANALITICO_SUMARIO_SALDO,
        {$IFNDEF _CDL_OPT}_TIPO_ANALITICO_SUMARIO_NC,{$ENDIF}
        _TIPO_ANALITICO_SUMARIO_EMATRASO,
        _TIPO_ANALITICO_SUMARIO_AVENCER  ] ) then
       Text := '( * )'
   else if  ( cdsSumarioAtrasoTIPO.asInteger  in [
        _TIPO_ANALITICO_SUMARIO ] ) then
       Text := '( = )'
   else if  ( cdsSumarioAtrasoTIPO.asInteger  in
          [   _TIPO_ANALITICO_SALDO {$IFDEF _CDL_OPT}, _TIPO_ANALITICO_SUMARIO_NC{$ENDIF} ] ) then
       begin
         if  ( cdsSumarioAtrasoCREDITO.asFloat > 0 ) and ( cdsSumarioAtrasoDEBITO.asFloat > 0 ) then
            Text := '( +/- )'
         else if  ( cdsSumarioAtrasoCREDITO.asFloat > 0 ) then
            Text := '( + )'
         else if ( cdsSumarioAtrasoDEBITO.asFloat > 0 ) then
            Text := '( - )'
       end
   else if  ( cdsSumarioAtrasoTIPO.asInteger  in
          [   _TIPO_ANALITICO_ARECEBER_NC, _TIPO_ANALITICO_ARECEBER_EMATRASO ] ) then
        Text := '( + )'
   else if  ( cdsSumarioAtrasoTIPO.asInteger  in
          [   _TIPO_ANALITICO_APAGAR_NC, _TIPO_ANALITICO_APAGAR_EMATRASO ] ) then
        Text := '( - )'
end;

procedure TdtmFIN_FluxoCaixa2.dtmFluxoCreate(Sender: TObject);
begin
  FFluxoConfig := TFluxoConfig.Create ;
  FFluxoConfig.DomainID := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
  ListaBancos := TStringList.Create ;
  TCDSSuppl.Open (  cdsLstContas ) ;
 end;

procedure TdtmFIN_FluxoCaixa2.dtmFluxoDestroy(Sender: TObject);
begin
  FFluxoConfig.free ;
  ListaBancos.Free ;
end;

procedure TdtmFIN_FluxoCaixa2.Execute;
begin

  FFluxoConfig.Contas := GetContas ;

  cdsContas.DisableControls ;
  cdsSumarioAtraso.DisableControls ;
  cdsFluxo.DisableControls ;

  TCDSSuppl.CreateDataSet( cdsContas ) ;
  TCDSSuppl.CreateDataSet( cdsSumarioAtraso ) ;
  TCDSSuppl.CreateDataSet( cdsFluxo ) ;

  with TFluxoDeCaixa.Create do
  try
    if FFluxoConfig.TipoFluxo = tfAnalitico then
      begin
        FFluxoConfig.AddItemCallback := AddItemAnalitico ;
        cdsFluxoDATA.OnGetText := cdsFluxoDATAGetText;
      end
    else
      begin
        FFluxoConfig.AddItemCallback := AddItemSintetico ;
        cdsFluxoDATA.OnGetText := cdsFluxoSinteticoDATAGetText;
      end ;
    Execute ( FFluxoConfig ) ;
    cdsContas.First ;
    cdsSumarioAtraso.First ;
    cdsFluxo.First ;
  finally
    cdsContas.EnableControls ;
    cdsSumarioAtraso.EnableControls ;
    cdsFluxo.EnableControls ;
    Free ;
  end;
end;

function TdtmFIN_FluxoCaixa2.GetContas : string ;
begin
   Result := '' ;
   with cdsLstContas do
     begin
       First;
       DisableControls;
       while not Eof do
         begin
           if cdsLstContasSELECT.AsInteger = 1 then
              Result := Format ( '%s%s,', [Result, QuotedStr ( cdsLstContasKFIN_CONTA.AsString ) ] ) ;
           Next;
         end;
       First;
       EnableControls;
   end;
   Result := Copy( Result, 1, length( Result ) - 1 ) ;
end;


procedure TdtmFIN_FluxoCaixa2.FluxoResumoMensal;
begin
//
end;



procedure TdtmFIN_FluxoCaixa2.InvertAllContas(ASelectAll: Boolean);
var
  checked : integer ;
begin
  if ASelectAll then
     checked := 1
  else
     checked := 0 ;

  if not cdsLstContas.active then
    exit ;

  with cdsLstContas do
    begin
      DisableControls ;
      First ;
      while not eof do
         begin
           cdsLstContas.Edit ;
           cdsLstContasSELECT.asInteger := checked ;
           cdsLstContas.Post ;
           next ;
         end;
      First ;
      EnableControls ;
    end;
end;

procedure TdtmFIN_FluxoCaixa2.InvertSelecaoContas;
begin
  cdsLstContas.Edit ;
  if cdsLstContasSELECT.asInteger = 0 then
    cdsLstContasSELECT.asInteger := 1
  else
    cdsLstContasSELECT.asInteger := 0 ;

  cdsLstContas.Post ;
end;



procedure TFluxoDeCaixa.DoAddItem(ATipo: integer; AVencto: TDateTime;
  ADescricao: string; ACredito, ADebito : double ) ;
begin
  if not ( ATipo in [ _TIPO_ANALITICO_SUMARIO_SALDO,
                      _TIPO_ANALITICO_SUMARIO_NC,
                      _TIPO_ANALITICO_SUMARIO_EMATRASO,
                      _TIPO_ANALITICO_SUMARIO_AVENCER,
                      _TIPO_ANALITICO_SUMARIO ] ) then
    FSaldo := FSaldo + ACredito - ADebito ;

  if Assigned ( FConfig.AddItemCallBack ) then
     FConfig.AddItemCallBack ( ATipo, AVencto, ADescricao, ACredito, ADebito, FSaldo )
end;

procedure TFluxoDeCaixa.Execute( AConfig : TFluxoConfig ) ;
begin

  FConfig := AConfig ;

  FConfig.DataFluxo := Date ;

  FMaxDate      := Date ;
  FSaldoCredor  := 0 ;
  FSaldoDevedor := 0 ;

  FAReceberNaoConsiliado := 0 ;
  FAPagarNaoConsiliado   := 0 ;

  FAReceberEmAtrazo := 0 ;
  FAPagarEmAtrazo   := 0 ;

  FAReceberAVencer := 0 ;
  FAPagarAVencer   := 0 ;

  SaldoContas ;
  TitulosNaoConsiliado ;
  TitulosEmAtrazo ;
  TitulosAVencer ;

  DoAddItem ( _TIPO_ANALITICO_SUMARIO, FMaxDate, 'Posição do fluxo de caixa em ' + FormatDateTime ( 'dd/mmm/yyyy', FMaxDate ),
    FSaldoCredor  + FAReceberNaoConsiliado + FAReceberEmAtrazo + FAReceberAVencer,
    FSaldoDevedor + FAPagarNaoConsiliado   + FAPagarEmAtrazo   + FAPagarAVencer ) ;

end;

function TFluxoDeCaixa.GetDescricaoSintetico( ADate : TDateTime ) : string;
begin
  case FConfig.TipoFluxo of
     tfSemanal    :
       if YearOf ( ADate ) = FConfig.FAnoFluxo then
         Result := Format ( '%da semana de %s', [ NthDayOfWeek( ADate ), FormatDateTime ( 'mmm', ADate ) ] )
       else
         Result := Format ( '%da semana de %s', [ NthDayOfWeek( ADate ), FormatDateTime ( 'mmm/yyyy', ADate ) ] ) ;
     tfMensal     : Result := FormatDateTime ( 'mmm/yyyy', ADate ) ;
     tfQuinzenal  :
       if DayOf( ADate ) > 15 then
          Result := '2a quinzena ' + FormatDateTime ( 'mmm/yyyy', ADate )
       else
          Result := '1a quinzena ' + FormatDateTime ( 'mmm/yyyy', ADate ) ;
     else
          Result := FormatDateTime ( 'dd/mmm/yyyy', ADate ) ;

  end;
end;

procedure TFluxoDeCaixa.SaldoContas ;
const
  _SALDO_CONTAS = 'SELECT'
  + #13#10'CC.KFIN_CONTA,'
  + #13#10'CC.NOME,'
  + #13#10'CC.SALDOINICIAL'
  + #13#10'+ COALESCE ( (SELECT SUM ( R.PAGO  ) FROM FIN_ARECEBER_PARCELAS  R'
  + #13#10'   WHERE R.KFIN_CONTA = CC.KFIN_CONTA AND R.DT_COMPENSACAO IS NOT NULL), 0 )'
  + #13#10'- COALESCE ( (SELECT SUM ( A.PAGO ) FROM FIN_APAGAR_PARCELAS A'
  + #13#10'   WHERE  A.KFIN_CONTA = CC.KFIN_CONTA AND A.DT_COMPENSACAO IS NOT NULL),0 )'
  + #13#10'SALDOCC'
  + #13#10'FROM FIN_CONTAS CC'
  + #13#10'WHERE CC.KSYS$DOMAIN = :KSYS$DOMAIN '
  + #13#10'  AND CC.ATIVA = ''T'' ';

var
  tmpCDS : TClientDataSet ;
  p : TParams ;
  sqlStmt : string ;
  LCredito, LDebito : double ;
begin
  tmpCDS := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString := FConfig.DomainID ;

  if FConfig.Contas = '' then
    sqlStmt  := _SALDO_CONTAS
  else
    sqlStmt  := Format ( '%s AND CC.KFIN_CONTA IN (%s)', [ _SALDO_CONTAS, FConfig.Contas ] )  ;

  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( tmpCDS, sqlStmt, p );

  FSaldo := 0 ;

  with tmpCDS do
    while not eof do
      begin
        if FieldByName ( 'SALDOCC' ).asFloat > 0 then
          begin
           LCredito := FieldByName ( 'SALDOCC' ).asFloat ;
           LDebito  := 0 ;
          end
        else
          begin
           LCredito := 0 ;
           LDebito  := ABS ( FieldByName ( 'SALDOCC' ).asFloat ) ;
          end ;
        FSaldoCredor   := FSaldoCredor + LCredito ;
        FSaldoDevedor  := FSaldoDevedor  + LDebito  ;
        DoAddItem( _TIPO_ANALITICO_SALDO, Date,  FieldByName ( 'NOME' ).asString, LCredito, LDebito ) ;
        next ;
      end ;
  tmpCDS.free ;
  p.Free ;

  DoAddItem( _TIPO_ANALITICO_SUMARIO_SALDO, Date, 'Saldo de todas as contas ', FSaldoCredor, FSaldoDevedor ) ;

  FSaldoTotalContas := FSaldoCredor + FSaldoDevedor ;

end;

procedure TFluxoDeCaixa.TitulosNaoConsiliado ;
begin
  AReceberNaoConsiliado;
  APagarNaoConsiliado;
  if ( FAReceberNaoConsiliado <> 0 ) or ( FAPagarNaoConsiliado <> 0 ) then
     DoAddItem( _TIPO_ANALITICO_SUMARIO_NC, Date, 'Cheques não compensados', FAReceberNaoConsiliado, FAPagarNaoConsiliado );
end;

procedure TFluxoDeCaixa.AReceberNaoConsiliado;
const
  _NAO_COMPENSADOS_RECEBER = 'SELECT SUM( RP.PAGO ) VALOR FROM FIN_ARECEBER R ' +
                             'LEFT JOIN FIN_ARECEBER_PARCELAS RP ON RP.KFIN_ARECEBER = R.KFIN_ARECEBER ' +
                             'WHERE R.KSYS$DOMAIN = :KSYS$DOMAIN ' +
                             '  AND RP.PAGTO IS NOT NULL ' +
                             '  AND RP.DT_COMPENSACAO IS NULL ' +
                             '  AND R.ATIVO = ''T'' ';
var
  tmpCDS : TClientDataSet ;
  p : TParams ;
  sqlStmt : string ;
begin

  tmpCDS := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString := FConfig.DomainID ;

  sqlStmt := _NAO_COMPENSADOS_RECEBER ;

  if FConfig.Contas <> '' then
     sqlStmt := sqlStmt + Format ( ' AND RP.KFIN_CONTA IN ( %s ) ', [ FConfig.Contas ] ) ;

  //deve considerar previsao na conciliação ?
  //if not FConfig.PrevisaoAReceber  then
  //  sqlStmt := sqlStmt + ' AND RP.PREVISAO = ''F'' ' ;
  if not FConfig.DuvidosoAReceber  then
     sqlStmt := sqlStmt + ' AND RP.DUVIDOSO = ''F'' ' ;

  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( tmpCDS, sqlStmt, p );

  FAReceberNaoConsiliado := FAReceberNaoConsiliado + tmpCDS.FieldByName ( 'VALOR' ).asFloat ;

  if tmpCDS.FieldByName ( 'VALOR' ).asFloat <> 0 then
     DoAddItem ( _TIPO_ANALITICO_ARECEBER_NC, Date, 'Cheques recebidos não compensados', tmpCDS.FieldByName ( 'VALOR' ).asFloat, 0  );

  tmpCDS.free ;
  p.free ;
end;

procedure TFluxoDeCaixa.APagarNaoConsiliado;
const
  _NAO_COMPENSADOS_PAGAR = 'SELECT SUM( AP.PAGO ) VALOR FROM  FIN_APAGAR A ' +
                           'LEFT JOIN FIN_APAGAR_PARCELAS AP ON AP.KFIN_APAGAR = A.KFIN_APAGAR ' +
                           'WHERE A.KSYS$DOMAIN = :KSYS$DOMAIN ' +
                           '  AND AP.PAGTO IS NOT NULL ' +
                           '  AND AP.DT_COMPENSACAO IS NULL ' +
                           '  AND A.ATIVO = ''T'' ';
var
  tmpCDS : TClientDataSet ;
  p : TParams ;
  sqlStmt : string ;
begin
  if not FConfig.AtrasoAPagar then
     exit ;

  tmpCDS := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString := FConfig.DomainID ;

  sqlStmt := _NAO_COMPENSADOS_PAGAR ;

  if FConfig.Contas <> '' then
     sqlStmt := sqlStmt + Format ( ' AND AP.KFIN_CONTA IN ( %s ) ', [ FConfig.Contas ] ) ;

  //deve considerar previsao na conciliação ?
  //if not FConfig.PrevisaoAReceber  then
  //  sqlStmt := sqlStmt + ' AND AP.PREVISAO = ''F'' ' ;
  if not FConfig.DuvidosoAPagar  then
    sqlStmt := sqlStmt + ' AND AP.DUVIDOSO = ''F'' ' ;

  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( tmpCDS, sqlStmt, p );

  FAPagarNaoConsiliado := FAPagarNaoConsiliado + tmpCDS.FieldByName ( 'VALOR' ).asFloat ;

  if tmpCDS.FieldByName ( 'VALOR' ).asFloat <> 0 then
     DoAddItem( _TIPO_ANALITICO_APAGAR_NC, Date, 'Cheques emitidos não compensados', 0, tmpCDS.FieldByName ( 'VALOR' ).asFloat );

  tmpCDS.free ;
  p.free ;

end;

procedure TFluxoDeCaixa.TitulosEmAtrazo ;
begin
   AReceberEmAtraso ;
   APagarEmAtraso ;
   if ( FAReceberEmAtrazo <> 0 ) or ( FAPagarEmAtrazo <> 0 ) then
      DoAddItem( _TIPO_ANALITICO_SUMARIO_EMATRASO, Date, 'Títulos em atraso', FAReceberEmAtrazo, FAPagarEmAtrazo );
end;

procedure TFluxoDeCaixa.AReceberEmAtraso ;
const
  _ANALITICO_ARECEBER_ATRASO = 'SELECT'
  + #13#10'SUM ( RP.VALOR ) VALOR  FROM FIN_ARECEBER_PARCELAS  RP'
  + #13#10'LEFT JOIN FIN_ARECEBER R ON RP.KFIN_ARECEBER = R.KFIN_ARECEBER'
  + #13#10'WHERE R.KSYS$DOMAIN = :KSYS$DOMAIN'
//  + #13#10'  AND RP.DT_COMPENSACAO IS NULL ' //( RP.PAGTO IS NULL OR (
  + #13#10'  AND RP.PAGTO IS NULL'
  + #13#10'  AND CAST ( COALESCE ( RP.PRORROGACAO, RP.VENCTO ) AS DATE ) < CURRENT_DATE' ;

var
  tmpCDS : TClientDataSet ;
  p : TParams ;
  sqlStmt : string ;
begin

  if not FConfig.AtrasoAReceber then
     exit ;

  tmpCDS := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString := FConfig.DomainID ;

  sqlStmt := _ANALITICO_ARECEBER_ATRASO ;

  if FConfig.Contas <> '' then
     sqlStmt := sqlStmt + Format ( ' AND RP.KFIN_CONTA IN ( %s ) ', [ FConfig.Contas ] ) ;

  if not FConfig.PrevisaoAReceber  then
    sqlStmt := sqlStmt + ' AND R.PROVISAO = ''F'' ' ; //deveria ser por PARCELA ... RP. mas tiraram essa opcao do programa... ficou apenas R.
  if not FConfig.DuvidosoAReceber  then
     sqlStmt := sqlStmt + ' AND RP.DUVIDOSO = ''F'' ' ;

  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( tmpCDS, sqlStmt, p );

  FAReceberEmAtrazo := tmpCDS.FieldByName ( 'VALOR' ).asFloat ;

  if tmpCDS.FieldByName ( 'VALOR' ).asFloat <> 0 then
     DoAddItem ( _TIPO_ANALITICO_ARECEBER_EMATRASO, Date, 'Títulos à receber em atraso', tmpCDS.FieldByName ( 'VALOR' ).asFloat, 0  );

  tmpCDS.free ;
  p.free ;
end;

procedure TFluxoDeCaixa.APagarEmAtraso ;
const
  _ANALITICO_APAGAR_ATRASO = 'SELECT'
  + #13#10'SUM ( AP.VALOR ) VALOR  FROM FIN_APAGAR_PARCELAS  AP'
  + #13#10'LEFT JOIN FIN_APAGAR A ON AP.KFIN_APAGAR = A.KFIN_APAGAR'
  + #13#10'WHERE A.KSYS$DOMAIN = :KSYS$DOMAIN '
//  + #13#10'  AND AP.DT_COMPENSACAO IS NULL ' //( AP.PAGTO IS NULL OR (
  + #13#10'  AND AP.PAGTO IS NULL'
  + #13#10'  AND COALESCE ( AP.PRORROGACAO, AP.VENCTO ) < CURRENT_DATE' ;

var
  tmpCDS : TClientDataSet ;
  p : TParams ;
  sqlStmt : string ;
begin
  if not FConfig.AtrasoAPagar then
     exit ;

  tmpCDS := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString := FConfig.DomainID ;

  sqlStmt := _ANALITICO_APAGAR_ATRASO ;

  if FConfig.Contas <> '' then
     sqlStmt := sqlStmt + Format ( ' AND AP.KFIN_CONTA IN ( %s ) ', [ FConfig.Contas ] ) ;

  if not FConfig.PrevisaoAPagar  then
    sqlStmt := sqlStmt + ' AND A.PROVISAO = ''F'' ' ; //deveria ser por PARCELA ... AP. mas tiraram essa opcao do programa... ficou apenas A.
  if not FConfig.DuvidosoAPagar  then
    sqlStmt := sqlStmt + ' AND AP.DUVIDOSO = ''F'' ' ;

  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( tmpCDS, sqlStmt, p );

  FAPagarEmAtrazo := tmpCDS.FieldByName ( 'VALOR' ).asFloat ;

  if tmpCDS.FieldByName ( 'VALOR' ).asFloat <> 0 then
     DoAddItem( _TIPO_ANALITICO_APAGAR_EMATRASO, Date, 'Títulos à pagar em atraso', 0, tmpCDS.FieldByName ( 'VALOR' ).asFloat );

  tmpCDS.free ;
  p.free ;

end;

function TFluxoDeCaixa.VenctoSintetico ( AVencto : TDateTime ) : TDateTime ;
begin
  case FConfig.TipoFluxo of
    tfSemanal   : Result := AVencto + 7 - DayOfWeek ( AVencto ) ; // sábado ou próximo sábado
    tfMensal    : Result := StartOfTheMonth( AVencto ) ;
    tfQuinzenal :
      if DayOf( AVencto ) > 15 then
         Result :=  StartOfTheMonth( AVencto ) + 15
      else
         Result := StartOfTheMonth( AVencto )  ;
  else
    Result := AVencto ;
  end;
end ;


procedure TFluxoDeCaixa.TitulosAVencer ;
const
  _ANALITICO_APAGAR = 'SELECT'
  + #13#10'COALESCE( AP.PRORROGACAO, AP.VENCTO ) VENCTO, A.NOMEENTIDADE, A.HISTORICO, -AP.VALOR VALOR'
  + #13#10'FROM FIN_APAGAR_PARCELAS  AP'
  + #13#10'LEFT JOIN FIN_APAGAR A ON AP.KFIN_APAGAR = A.KFIN_APAGAR'
  + #13#10'WHERE A.KSYS$DOMAIN = :KSYS$DOMAIN '
  + #13#10'  AND AP.PAGTO IS NULL AND CAST ( COALESCE ( AP.PRORROGACAO, AP.VENCTO ) AS DATE ) >= CURRENT_DATE' ;

  _ANALITICO_ARECEBER = 'SELECT'
  + #13#10'COALESCE( RP.PRORROGACAO, RP.VENCTO ) VENCTO, R.NOMEENTIDADE, R.HISTORICO, RP.VALOR VALOR '
  + #13#10'FROM FIN_ARECEBER_PARCELAS  RP'
  + #13#10'LEFT JOIN FIN_ARECEBER R ON RP.KFIN_ARECEBER = R.KFIN_ARECEBER'
  + #13#10'WHERE R.KSYS$DOMAIN = :KSYS$DOMAIN '
  + #13#10'AND RP.PAGTO IS NULL AND CAST ( COALESCE ( RP.PRORROGACAO, RP.VENCTO ) AS DATE ) >= CURRENT_DATE' ;

var
  tmpCDS : TClientDataSet ;
  p : TParams ;
  sqlStmt, sqlStmtApagar, sqlStmtAReceber : string ;
begin

  tmpCDS := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString := FConfig.DomainID ;

  sqlStmtAReceber := _ANALITICO_ARECEBER ;

  if FConfig.Contas <> '' then
     sqlStmtAReceber := sqlStmtAReceber + Format ( ' AND RP.KFIN_CONTA IN ( %s ) ', [ FConfig.Contas ] ) ;

  if FConfig.Data > 0 then
     sqlStmtAReceber := sqlStmtAReceber + ' AND COALESCE ( RP.PRORROGACAO, RP.VENCTO ) <= ''' + FormatDateTime ( 'dd.mm.yyyy', FConfig.Data ) + '''' ;
  if not FConfig.PrevisaoAReceber  then
    sqlStmtAReceber := sqlStmtAReceber + ' AND R.PROVISAO = ''F''' ; //deveria ser por PARCELA ... RP. mas tiraram essa opcao do programa... ficou apenas R.
  if not FConfig.DuvidosoAReceber  then
    sqlStmtAReceber := sqlStmtAReceber + ' AND RP.DUVIDOSO = ''F''' ;

  sqlStmtAPagar := _ANALITICO_APAGAR ;

  if FConfig.Contas <> '' then
     sqlStmtAPagar := sqlStmtAPagar + Format ( ' AND AP.KFIN_CONTA IN ( %s ) ', [ FConfig.Contas ] ) ;

  if FConfig.Data > 0 then
     sqlStmtAPagar := sqlStmtAPagar + ' AND COALESCE ( AP.PRORROGACAO, AP.VENCTO ) <= ''' + FormatDateTime ( 'dd.mm.yyyy', FConfig.Data ) + '''' ;
  if not FConfig.PrevisaoAPagar  then
    sqlStmtAPagar := sqlStmtAPagar + ' AND A.PROVISAO = ''F''' ; //deveria ser por PARCELA ... AP. mas tiraram essa opcao do programa... ficou apenas A.
  if not FConfig.DuvidosoAPagar  then
    sqlStmtAPagar := sqlStmtAPagar + ' AND AP.DUVIDOSO = ''F''' ;

  sqlStmt := Format ( '%s'#13#10'UNION ALL'#13#10'%s'#13#10'ORDER BY 1', [ sqlStmtAReceber, sqlStmtAPagar ] ) ;

  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( tmpCDS, sqlStmt, p );

  if FConfig.TipoFluxo = tfAnalitico then
    TitulosAVencerAnalitico ( tmpCDS )
  else
    TitulosAVencerSintetico ( tmpCDS ) ;

  tmpCDS.Free ;
  p.free ;

  if (( FAReceberAVencer <> 0 ) or ( FAPagarAVencer <> 0 )) then
    DoAddItem ( _TIPO_ANALITICO_SUMARIO_AVENCER,
                    FMaxDate,
                    'Títulos a receber/pagar',
                    FAReceberAVencer,
                    FAPagarAVencer );

end;

procedure TFluxoDeCaixa.TitulosAVencerAnalitico ( ACDS : TClientDataSet ) ;
var
  LCredito, LDebito : double ;
  LDescricao : string ;
  LTipo : integer ;
  LVencto : TDateTime ;
begin

  with ACDS do
    while not eof do
      begin
        LCredito := 0 ;
        LDebito  := 0 ;
        LVencto    := FieldByName ( 'VENCTO' ).asDateTime ;

        if FieldByName ( 'VALOR' ).asFloat > 0 then
          begin
            LCredito := FieldByName ( 'VALOR' ).asFloat ;
            LTipo := _TIPO_ANALITICO_ARECEBER ;
          end
        else
          begin
            LDebito := ABS ( FieldByName ( 'VALOR' ).asFloat ) ;
            LTipo := _TIPO_ANALITICO_APAGAR ;
          end ;

        LDescricao := FieldByName ( 'HISTORICO' ).asString ;
        if Trim ( FieldByName ( 'NOMEENTIDADE' ).asString ) <> '' then
          LDescricao := FieldByName ( 'NOMEENTIDADE' ).asString + ' ' + LDescricao ;

        FMaxDate          := Max ( FMaxDate, LVencto ) ;
        FAReceberAVencer  := FAReceberAVencer + LCredito ;
        FAPagarAVencer    := FAPagarAVencer   + LDebito ;

        next ;

        DoAddItem ( LTipo,
                    LVencto,
                    LDescricao,
                    LCredito,
                    LDebito );

      end ;
end ;

procedure TFluxoDeCaixa.TitulosAVencerSintetico( ACDS : TClientDataSet ) ;
var
  LCredito, LDebito : double ;
  LDescricao : string ;
  LVencto : TDateTime ;
begin

  with ACDS do
    while not eof do
      begin
        LCredito := 0 ;
        LDebito  := 0 ;
        LVencto    := VenctoSintetico ( FieldByName ( 'VENCTO' ).asDateTime ) ;
        LDescricao := GetDescricaoSintetico( LVencto ) ;

        repeat
           if FieldByName ( 'VALOR' ).asFloat > 0 then
              LCredito := LCredito + FieldByName ( 'VALOR' ).asFloat
           else
              LDebito  := LDebito  + ABS ( FieldByName ( 'VALOR' ).asFloat ) ;
           next ;
        until ( EOF ) or ( VenctoSintetico ( FieldByName ( 'VENCTO' ).asDateTime ) <> LVencto );

        FMaxDate          := Max ( FMaxDate, LVencto ) ;
        FAReceberAVencer  := FAReceberAVencer + LCredito ;
        FAPagarAVencer    := FAPagarAVencer   + LDebito ;

        DoAddItem ( _TIPO_ANALITICO_AVENCER,
                    LVencto,
                    LDescricao,
                    LCredito,
                    LDebito );

      end ;

end;

{ TFluxoConfig }

procedure TFluxoConfig.SetAddItemCallback(const Value: TAddItemCallback);
begin
  FAddItemCallback := Value;
end;

procedure TFluxoConfig.SetAtrasoAPagar(const Value: boolean);
begin
  FAtrasoAPagar := Value;
end;

procedure TFluxoConfig.SetAtrasoAReceber(const Value: boolean);
begin
  FAtrasoAReceber := Value;
end;

procedure TFluxoConfig.SetContas(const Value: string);
begin
  FContas := Value;
end;

procedure TFluxoConfig.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TFluxoConfig.SetDataFluxo(const Value: TDateTime);
begin
  FDataFluxo := Value;
  FMesFluxo  := MonthOf ( FDataFluxo ) ;
  FAnoFluxo  := YearOf ( FDataFluxo ) ;
end;

procedure TFluxoConfig.SetDomainID(const Value: variant);
begin
  FDomainID := Value;
end;

procedure TFluxoConfig.SetDuvidosoAPagar(const Value: boolean);
begin
  FDuvidosoAPagar := Value;
end;

procedure TFluxoConfig.SetDuvidosoAReceber(const Value: boolean);
begin
  FDuvidosoAReceber := Value;
end;

procedure TFluxoConfig.SetExibirSumarios(const Value: boolean);
begin
  FExibirSumarios := Value;
end;

procedure TFluxoConfig.SetPrevisaoAPagar(const Value: boolean);
begin
  FPrevisaoAPagar := Value;
end;

procedure TFluxoConfig.SetPrevisaoAReceber(const Value: boolean);
begin
  FPrevisaoAReceber := Value;
end;

procedure TFluxoConfig.SetTipoFluxo(const Value: TTipoFluxo);
begin
  FTipoFluxo := Value;
end;

end.
