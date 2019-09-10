unit UFIN.DRE.Caixa;

interface

uses
    System.Types
  , System.Generics.Collections
  , Vcl.Graphics
  , VirtualTrees
  , UFIN.DRE.Data
  , UFIN.DRE.Common
  ;

type
   TDRECaixaNodes = record
    LitrosLeite,
    ReceitaLeite,
    ValorMedio,
    ReceitaTotal,
    ReceitaBruta,
    DeducoesVenda,
    ReceitaLiquida,
    Emprestimos,
    DespesaTotal,

    ResultadoFinanceiro,
    ResultadoNaoOperacional,
    Amortizacao,
    Investimentos,

    Estoque,
    SaldoFinanceiro,
    SaldoAcumulado : PVirtualNode ;
   end;

   TDRECaixa = class( TInterfacedObject, IDRE )
   private
    FdtmFIN_DRE : TdtmFIN_DRE ;
    FVST   : TVirtualStringTree ;
    FDRE   : TDRETreeViewUtils ;
    FNodes : TDRECaixaNodes ;
    procedure ComputeSaldoAcumulado ;
    // IDRE = interface
    function  GetVST : TVirtualStringTree ;
    function  GetAddPlanosMethod : TAddPlanosMethod ;
    procedure GetInterval(out AStart, AEnd: TDateTime);
    procedure InitNodes    ;
    procedure FillNodes    ;
    procedure ComputeNodes ;
    procedure EnumerateAccounts ;
    procedure HideInfoPecuaria ;
    procedure FinalizeFill ;
   public
     procedure FillTreeView ;
     procedure ExportTreeView( const AFileName : string );
     constructor Create ( const AVST : TVirtualStringTree ; const AdtmFIN_DRE : TdtmFIN_DRE ) ;
     destructor Destroy ; override ;
   end;

implementation

uses
  //   System.UITypes
     System.Classes
   , System.SysUtils
   , Tc.RTL.Exceptions
   , UFIN_PlanoContasReceitasDespesasClass
   , UFIN.DRE.Utils
   , ExportTreeViewToExcel;

type

   TFillExcel = class( TFillExcelBase )
   private
     FNodes : TDRECaixaNodes ;
     procedure CalculateValorMedio ;
     procedure CalculateDespesaTotal ;
   protected
     procedure ComputeNodes ; override ;
   public
      constructor Create ( AExcelExporter : IExcelExporter ; AVST : TVirtualStringTree ; ANodes : TDRECaixaNodes ) ;
   end ;

{ TDRECaixa }

procedure TDRECaixa.ComputeNodes;
var
 LLitros, LReceitaLeite : double ;
begin
(*
  ReceitaLiquida  := ReceitaBruta    - DeducoesVenda ;
  ReceitaTotal    := ReceitaLiquida  + Emprestimos   ;
  SaldoFinanceiro  := ReceitaTotal    - DespesaTotal  ;

*)

 LLitros       :=  PDRENodeData( FNodes.LitrosLeite.GetData ).Columns[ 0 ] ;
 if LLitros = 0.00 then
   LLitros := 1.00 ;

 FNodes.ReceitaLeite := nil ;
 LReceitaLeite := 0 ;
 var LNodeReceitaLeite : PVirtualNode ;
 if FDRE.TryGetNode( TPlanoContasDespesasReceitas.GetKeyLeite, LNodeReceitaLeite ) then
   begin
    FNodes.ReceitaLeite := LNodeReceitaLeite ;
    LReceitaLeite := PDRENodeData( FNodes.ReceitaLeite.GetData ).Columns[ 0 ] ;
   end;

 PDRENodeData( FNodes.ValorMedio.GetData ).Columns[ 0 ]  := LReceitaLeite / LLitros ;

 CalculateNode( cnSubtract,  FNodes.DespesaTotal,     FNodes.DespesaTotal,    FNodes.ResultadoFinanceiro  ) ;
 CalculateNode( cnSubtract,  FNodes.DespesaTotal,     FNodes.DespesaTotal,    FNodes.ResultadoFinanceiro  ) ;

 CalculateNode( cnSubtract,  FNodes.DespesaTotal,     FNodes.DespesaTotal,    FNodes.ResultadoNaoOperacional  ) ;
 CalculateNode( cnSubtract,  FNodes.DespesaTotal,     FNodes.DespesaTotal,    FNodes.ResultadoNaoOperacional  ) ;

 CalculateNode( cnSubtract,  FNodes.ReceitaLiquida,   FNodes.ReceitaBruta,    FNodes.DeducoesVenda  ) ;
 CalculateNode( cnSum,       FNodes.ReceitaTotal,     FNodes.ReceitaLiquida,  FNodes.Emprestimos    ) ;
 CalculateNode( cnSubtract,  FNodes.SaldoFinanceiro,  FNodes.ReceitaTotal,    FNodes.DespesaTotal   ) ;

 ComputeSaldoAcumulado;
end;



procedure TDRECaixa.ComputeSaldoAcumulado;
begin
   var LSaldoFinanceiro  := PDRENodeData( FNodes.SaldoFinanceiro.GetData ) ;
   var LSaldoAcumulado   := PDRENodeData( FNodes.SaldoAcumulado.GetData ) ;
   var LAcumulado        := 0.00 ;
   for var IterateColumns := 1 to Pred (  LSaldoFinanceiro.Columns.Count )  do
     begin
       LAcumulado := LAcumulado + LSaldoFinanceiro.Columns[ IterateColumns ]  ;
       LSaldoAcumulado.Columns[ IterateColumns ] := LAcumulado ;
     end ;
end;

constructor TDRECaixa.Create ( const AVST : TVirtualStringTree ; const AdtmFIN_DRE : TdtmFIN_DRE ) ;
begin
   FVST        := AVST ;
   FdtmFIN_DRE := AdtmFIN_DRE ;
   FDRE   := TDRETreeViewUtils.Create( Self )  ;
end;


destructor TDRECaixa.Destroy;
begin
  FDRE.Free ;
  inherited;
end;

procedure TDRECaixa.InitNodes ;
begin
  FdtmFIN_DRE.GetPlanoContas ;

  FNodes.LitrosLeite           := FDRE.AddNode(  nil,  'LEITE VENDIDO EM LITROS' ) ;
  FDRE.AddNodeToList( 'litros', FNodes.LitrosLeite ) ;

  FNodes.ValorMedio      := FDRE.AddNode(  nil,  'VALOR MÉDIO DE VENDA DO LEITE (R$/L)') ;
  FDRE.AddNodeToList( 'valor_medio', FNodes.ValorMedio ) ;
  PDRENodeData( FNodes.ValorMedio.GetData ).Mask := '#,0.00' ;

  FNodes.ReceitaTotal    := FDRE.AddNode(  nil,  '1 - RECEITA TOTAL (4+5)', _YELLOW) ;
  FNodes.ReceitaBruta    := FDRE.AddNode(  FNodes.ReceitaTotal,  '2 - RECEITA BRUTA', _YELLOW ) ;
                           FDRE.AddNodesFromPlanoContas( FNodes.ReceitaBruta,  TPlanoContasDRE.pcdreReceitaBruta  ) ;

  FNodes.DeducoesVenda   := FDRE.AddNode(  FNodes.ReceitaTotal,  '3 - DEDUÇÕES DE VENDAS' ) ;
                            FDRE.AddNodesFromPlanoContas( FNodes.DeducoesVenda, TPlanoContasDRE.pcdreDeducoesVenda ) ;
  FNodes.ReceitaLiquida  := FDRE.AddNode( FNodes.ReceitaTotal,  '4 - RECEITA LÍQUIDA (2-3)', _YELLOW) ;
  FNodes.Emprestimos     := FDRE.AddNode( FNodes.ReceitaTotal,  '5 - EMPRÉSTIMOS REALIZADOS') ;

  FDRE.AddNodeToList( 'financiamentos', FNodes.Emprestimos ) ;

  FNodes.DespesaTotal    := FDRE.AddNode(  nil,  '6 - DESPESA TOTAL', _YELLOW ) ;
                    FDRE.AddNodesFromPlanoContas  ( FNodes.DespesaTotal,  TPlanoContasDRE.pcdreDespesaCusto ) ;
                    FNodes.Estoque := FDRE.AddNode( FNodes.DespesaTotal,   'ESTOQUE') ;

    FNodes.Amortizacao := FDRE.AddNode( FNodes.DespesaTotal,   'AMORTIZAÇÃO DE EMPRÉSTIMOS E CONSÓRCIOS' ) ;
         FDRE.AddNodesFromPlanoContas(  FNodes.Amortizacao,  TPlanoContasDRE.pcdreAmortizacao );
    FNodes.Investimentos := FDRE.AddNode( FNodes.DespesaTotal,   'INVESTIMENTOS' ) ;
         FDRE.AddNodesFromPlanoContas( FNodes.Investimentos, TPlanoContasDRE.pcdreInvestimentos );

    FNodes.ResultadoFinanceiro := FDRE.AddNode( FNodes.DespesaTotal, 'RESULTADO FINANCEIRO');
         FDRE.AddNodesFromPlanoContas( FNodes.ResultadoFinanceiro,  TPlanoContasDRE.pcdreResultadoFinanceiro, True );
  PDRENodeData( FNodes.ResultadoFinanceiro.GetData   ).Resultado := True ;

    FNodes.ResultadoNaoOperacional := FDRE.AddNode(FNodes.DespesaTotal, 'RESULTADO NÃO OPERACIONAL');
         FDRE.AddNodesFromPlanoContas( FNodes.ResultadoNaoOperacional, TPlanoContasDRE.pcdreResultadoNaoOperacional, True) ;

  PDRENodeData( FNodes.ResultadoNaoOperacional.GetData   ).Resultado := True ;

  FNodes.SaldoFinanceiro  := FDRE.AddNode(  nil,  '7 - SALDO FINANCEIRO (1-6)', _YELLOW ) ;
  PDRENodeData( FNodes.SaldoFinanceiro.GetData   ).Resultado := True ;


  FNodes.SaldoAcumulado  := FDRE.AddNode(  nil,  '8 - SALDO FINANCEIRO ACUMULADO (soma[mês a mês de 7])', _YELLOW ) ;
  PDRENodeData( FNodes.SaldoAcumulado.GetData   ).Resultado := True ;

end ;

procedure TDRECaixa.FillNodes ; //( const ARoot : PVirtualNode ; const ADescricao : string  ; AClassificacao : string = '' ; AUseFirstNode : boolean = False ) : PVirtualNode;
var
  LProcAddToTreeView : TProcAddToTreeView ;
  LLastKey     : string  ;
  LLastNode    : PVirtualNode ;
  LNodeNoGroup : PVirtualNode ;
  LValor       : double ;
  LNodeExists  : boolean ;
const
  _NO_GROUP = '<|NO_GROUP|>' ;
begin

  LLastKey     := '' ;
  LLastNode    := nil ;
  LNodeNoGroup := nil ;
  LNodeExists  := False ;

  LProcAddToTreeView := procedure( AData : PDataInfo )
  var
   LKeyPlano       : string ;
  begin
     if AData.Estoque then
       begin
        LKeyPlano := AData.KeyGrupoProduto ;
        if LKeyPlano = '' then
          LKeyPlano := _NO_GROUP ;
       end
     else
        LKeyPlano := AData.KeyPlano ;

     if ( LKeyPlano.IsEmpty )
     or (( LKeyPlano = LLastKey ) and not Assigned( LLastNode ))  then
        Exit ;

     if LKeyPlano <> LLastKey then
       begin
         LLastKey    := LKeyPlano ;
         LNodeExists := FDRE.TryGetNode( LKeyPlano, LLastNode ) ;

         if not LNodeExists and not AData.Estoque then
           exit ;
       end;

     if not LNodeExists then
      begin
        var LDescricaoGrupo := '(sem grupo)' ;
        if  ( ( LKeyPlano = _NO_GROUP  ) and not Assigned( LNodeNoGroup ) )
         or ( ( LKeyPlano <> _NO_GROUP ) and not FdtmFIN_DRE.GetDescricaoGrupo( LKeyPlano, LDescricaoGrupo ) ) then
          begin
             LKeyPlano := _NO_GROUP ;
             LLastKey  := LKeyPlano ;
             if not Assigned ( LNodeNoGroup ) then
               begin
                 LNodeNoGroup := FDRE.AddNode( FNodes.Estoque, LDescricaoGrupo ) ;
                 PDRENodeData( LNodeNoGroup.GetData ).Sintetico := False ;
                 FDRE.AddNodeToList( LKeyPlano, LNodeNoGroup ) ;
               end ;
             LLastNode := LNodeNoGroup ;
          end
        else
          begin
            LLastNode := FDRE.AddNode( FNodes.Estoque, LDescricaoGrupo ) ;
            PDRENodeData( LLastNode.GetData ).Sintetico := False ;
            FDRE.AddNodeToList( LKeyPlano, LLastNode ) ;
          end ;
        LNodeExists := True ;
      end;

     var LNode := LLastNode ;
     LValor := AData.Valor ; //ABS( AData.Valor ) ;
     if PDRENodeData( LNode.GetData ).Negativo then
       LValor := -ABS( LValor ); //-LValor ;

     Repeat
      var LNodeData := PDRENodeData( LNode.GetData ) ;
      LNodeData.Columns[ _ACUMULADO ] := LNodeData.Columns[ _ACUMULADO ] + LValor ;
      LNodeData.Columns[ AData.Mes  ] := LNodeData.Columns[ AData.Mes  ] + LValor ;
      LNode := FVST.NodeParent[ LNode ] ;
     Until not Assigned( LNode ) ;
  end;

  FdtmFIN_DRE.ProcessCaixa( LProcAddToTreeView ) ;

end ;


procedure TDRECaixa.EnumerateAccounts;
var
  LData : PDRENodeData ;
begin
  var LCount := 0 ;
  var LNode := FNodes.DespesaTotal.FirstChild ;
  while Assigned ( LNode )  do
    begin
      if FVST.IsVisible[ LNode ] then
        begin
          Inc ( LCount ) ;
          LData := PDRENodeData( LNode.GetData ) ;
          LData.Descricao := Format ( '6.%d - %s', [ LCount, LData.Descricao ] ) ;
        end;
        LNode := LNode.NextSibling
    end;

  if LCount = 0 then
    exit ;

  LData := PDRENodeData( FNodes.DespesaTotal.GetData ) ;
  LData.Descricao := Format ( '%s (soma[6.1 à 6.%d] - 6.%d - 6.%d)', [ LData.Descricao, LCount - 2, LCount - 1, LCount ] ) ;
end;

procedure TDRECaixa.FillTreeView ;
begin
  FDRE.Fill ;
end ;


procedure TDRECaixa.HideInfoPecuaria ;
begin
  FVST.IsVisible[ FNodes.LitrosLeite ] := False ;
  FVST.IsVisible[ FNodes.ValorMedio  ] := False ;
end;

procedure TDRECaixa.FinalizeFill;
begin
  EnumerateAccounts ;
  if not FdtmFIN_DRE.Params.CentroCustoDefault then
     HideInfoPecuaria ;
end;

function TDRECaixa.GetAddPlanosMethod: TAddPlanosMethod;
begin
  Result := FdtmFIN_DRE.AddPlanos ;
end;

procedure TDRECaixa.GetInterval(out AStart, AEnd: TDateTime);
begin
  AStart := FdtmFIN_DRE.Params.StartDate;
  AEnd   := FdtmFIN_DRE.Params.EndDate ;
end;

function TDRECaixa.GetVST: TVirtualStringTree;
begin
   Result := FVST ;
end;

procedure TDRECaixa.ExportTreeView( const AFileName : string );
begin
  var LProcGetValue : TProcGetValue :=
    procedure(
        const AExcelExporter : IExcelExporter
    )
    begin
       with TFillExcel.Create( AExcelExporter, FVST, FNodes ) do
         try
           Execute ;
         finally
           DisposeOf ;
         end;
    end;

  FDRE.ExportToExcel ( AFileName, LProcGetValue )  ;
end;

{ TFillExcel }

constructor TFillExcel.Create(AExcelExporter: IExcelExporter ; AVST : TVirtualStringTree ; ANodes : TDRECaixaNodes ) ;
begin
  inherited Create( AExcelExporter, AVST ) ;
  FTitle := 'DEMONSTRATIVO DE RESULTADOS DO EXERCÍCIO - CAIXA' ;
  FNodes := ANodes ;
end;

procedure TFillExcel.CalculateValorMedio;
begin
  var LData := PDRENodeData( FNodes.ValorMedio.GetData ) ;
  SetBackGroundColor(  LData.Color ) ;
  SetConditionalColor( LData.Resultado ) ;

  if Assigned( FNodes.ReceitaLeite ) and ( PDRENodeData( FNodes.ReceitaLeite.GetData ).XLSRow > 0 ) then
     CalculateNode( cnDiv, FNodes.ValorMedio, FNodes.ReceitaLeite, FNodes.LitrosLeite, 0 )
  else
    FExcelExporter
      .SetRow( PDRENodeData( FNodes.ValorMedio.GetData ).XLSRow )
      .SetCol( 3 )
      .SetValue( 0 ) ;
end;

procedure TFillExcel.CalculateDespesaTotal;
begin
  var LString := '' ;
  var LNode : PVirtualNode := FNodes.DespesaTotal.FirstChild ;
  while Assigned ( LNode ) do
    begin
      var LData := PDRENodeData(LNode.GetData) ;
      if LData.XLSRow > 0 then
        LString :=  LString + '%0:s' + LData.XLSRow.ToString + ', ' ;
      LNode := LNode.NextSibling ;
      if (LNode = FNodes.ResultadoFinanceiro) or (LNode = FNodes.ResultadoNaoOperacional) then
        LNode := nil ;
    end;

  var LFormula :=
    Format ( 'SUM( %s )', [LString.SubString( 0, LString.Length -2 ) ] )
     + ' - %0:s' + PDRENodeData( FNodes.ResultadoFinanceiro.GetData     ).XLSRow.ToString
     + ' - %0:s' + PDRENodeData( FNodes.ResultadoNaoOperacional.GetData ).XLSRow.ToString  ;

  var LData := PDRENodeData(FNodes.DespesaTotal.GetData) ;

  SetBackGroundColor( LData.Color ) ;
  SetConditionalColor( LData.Resultado ) ;

  FExcelExporter
    .SetRow( LData.XLSRow ) ;
  for var IterateColumns := 1 to Pred ( LData.Columns.Count )  do
    FExcelExporter
      .SetCol( IterateColumns + 3 )
      .SetValue(
        FExcelExporter.Formula( Format( LFormula, [FExcelExporter.ColName[ IterateColumns + 3 ] ] ) )
    ) ;
end;


procedure TFillExcel.ComputeNodes ;
begin
(*
  ReceitaLiquida  := ReceitaBruta    - DeducoesVenda ;
  ReceitaTotal    := ReceitaLiquida  + Emprestimos   ;
  SaldoFinanceiro  := ReceitaTotal    - DespesaTotal  ;

*)
  CalculateValorMedio ;
  CalculateDespesaTotal ;
  CalculateNode( cnSubtract,  FNodes.ReceitaLiquida,   FNodes.ReceitaBruta,    FNodes.DeducoesVenda  ) ;
  CalculateNode( cnSum,       FNodes.ReceitaTotal,     FNodes.ReceitaLiquida,  FNodes.Emprestimos    ) ;
  CalculateNode( cnSubtract,  FNodes.SaldoFinanceiro,  FNodes.ReceitaTotal,    FNodes.DespesaTotal   ) ;

  SetConditionalColor( True, '0' ) ;
  FExcelExporter
    .SetRow( PDRENodeData( FNodes.SaldoAcumulado.GetData ).XLSRow )
    .SetCol( 3 )
    .SetValue( 0 ) ;

end;


end.
