unit UFIN.DRE.Competencia;

interface

uses
    System.Types
  , Vcl.Graphics
  , VirtualTrees
  , UFIN.DRE.Data
  , UFIN.DRE.Common
  ;

type

   TDRECompetenciaNodes = record
    LitrosLeite             : PVirtualNode;
    ReceitaLeite            : PVirtualNode;
    ValorMedio              : PVirtualNode;
    Equivalente             : PVirtualNode;
    ReceitaBruta            : PVirtualNode;
    DeducoesVenda           : PVirtualNode;
    ReceitaLiquida          : PVirtualNode;
    CustoOperacional        : PVirtualNode;
    COLeite                 : PVirtualNode;
    COEQL                   : PVirtualNode;
    LucroOperacional        : PVirtualNode;
    Depreciacao             : PVirtualNode;
    LOLiquido               : PVirtualNode;
    CustoTotal              : PVirtualNode;
    CTLeite                 : PVirtualNode;
    CTEQL                   : PVirtualNode;
    ResultadoFinanceiro     : PVirtualNode;
    ResultadoNaoOperacional : PVirtualNode;
    LucroLiquido            : PVirtualNode;
   end;

   TDRECompetencia = class( TInterfacedObject, IDRE )
   private
    FdtmFIN_DRE : TdtmFIN_DRE ;
    FVST : TVirtualStringTree ;
    FDRE : TDRETreeViewUtils ;
    FNodes : TDRECompetenciaNodes ;
    // IDRE = interface
    function  GetVST : TVirtualStringTree ;
    function  GetAddPlanosMethod : TAddPlanosMethod ;
    procedure GetInterval( out AStart, AEnd : TDateTime )  ;

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
    System.Classes
  , System.SysUtils
  , UFIN_PlanoContasReceitasDespesasClass
  , UFIN.DRE.Utils
  , ExportTreeViewToExcel
  ;

type
   TFillExcel = class( TFillExcelBase )
   private
     FNodes : TDRECompetenciaNodes ;
     procedure CalculateValorMedio ;
     procedure CalculateCustoTotal ;
     procedure ComputeNodes ; override ;
   public
      constructor Create ( AExcelExporter : IExcelExporter ; AVST : TVirtualStringTree ; ANodes : TDRECompetenciaNodes ) ;
   end ;

{ TDRECompetencia }

procedure TDRECompetencia.ComputeNodes;
var
 LLitros, LReceitaLeite : double ;
begin
(*
 Equivalente      := ReceitaBruta / ValorMedio
 ReceitaLiquida   := ReceitaBruta - DeducoesVenda
 COLeite          := CustoOperacional / LitrosLeite
 COEQL            := CustoOperacional / Equivalente
 LucroOperacional := ReceitaLiquida - CustoOperacional
 LOLiquido        := LucroOperacional - Depreciacao
 CustoTotal       := CustoOperacional + Depreciacao - ResultadoFinanceiro - ResultadoNaoOperacional
 CustoLeite       := CustoTotal / LitrosLeite
 CTEQL            := CustoTotal / Equivalente
 LucroLiquido     := ReceitaLiquida - CustoTotal
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

 ClearNodeValues( FNodes.CustoTotal ) ;

 CalculateNode( cnDiv,       FNodes.Equivalente,      FNodes.ReceitaBruta,     FNodes.ValorMedio              ) ;
 CalculateNode( cnSubtract,  FNodes.ReceitaLiquida,   FNodes.ReceitaBruta,     FNodes.DeducoesVenda           ) ;
 CalculateNode( cnDiv,       FNodes.COLeite,          FNodes.CustoOperacional, FNodes.LitrosLeite             ) ;
 CalculateNode( cnDiv,       FNodes.COEQL,            FNodes.CustoOperacional, FNodes.Equivalente             ) ;
 CalculateNode( cnSubtract,  FNodes.LucroOperacional, FNodes.ReceitaLiquida,   FNodes.CustoOperacional        ) ;
 CalculateNode( cnSubtract,  FNodes.LOLiquido,        FNodes.LucroOperacional, FNodes.Depreciacao             ) ;
 CalculateNode( cnSum,       FNodes.CustoTotal,       FNodes.CustoTotal,       FNodes.CustoOperacional        ) ;
 CalculateNode( cnSum,       FNodes.CustoTotal,       FNodes.CustoTotal,       FNodes.Depreciacao             ) ;
 CalculateNode( cnSubtract,  FNodes.CustoTotal,       FNodes.CustoTotal,       FNodes.ResultadoFinanceiro     ) ;
 CalculateNode( cnSubtract,  FNodes.CustoTotal,       FNodes.CustoTotal,       FNodes.ResultadoNaoOperacional ) ;
 CalculateNode( cnDiv,       FNodes.CTLeite,          FNodes.CustoTotal,       FNodes.LitrosLeite                   ) ;
 CalculateNode( cnDiv,       FNodes.CTEQL,            FNodes.CustoTotal,       FNodes.Equivalente             ) ;
 CalculateNode( cnSubtract,  FNodes.LucroLiquido,     FNodes.ReceitaLiquida,   FNodes.CustoTotal              ) ;

end;

constructor TDRECompetencia.Create ( const AVST : TVirtualStringTree ; const AdtmFIN_DRE : TdtmFIN_DRE ) ;
begin
   FVST        := AVST ;
   FdtmFIN_DRE := AdtmFIN_DRE ;
   FDRE   := TDRETreeViewUtils.Create( self )  ;
end;

destructor TDRECompetencia.Destroy;
begin
  FDRE.Free ;
  inherited;
end;

procedure TDRECompetencia.InitNodes;
begin
  FdtmFIN_DRE.GetPlanoContas ;

  FNodes.LitrosLeite        := FDRE.AddNode(  nil, '%d - LEITE VENDIDO (LITROS)');
  FDRE.AddNodeToList(  'litros', FNodes.LitrosLeite ) ;

  FNodes.ValorMedio   := FDRE.AddNode(  nil, '%d - VALOR MÉDIO DE VENDA DO LEITE (R$/L)');
  PDRENodeData( FNodes.ValorMedio.GetData ).Mask := '#,0.00' ;

  FDRE.AddNodeToList(  'valor_medio', FNodes.ValorMedio ) ;

  FNodes.Equivalente  := FDRE.AddNode(  nil, '%d - EQL (EQUIVALENTE LEITE EM LITROS) (%d/%d)');

  FNodes.ReceitaBruta := FDRE.AddNode(  nil, '%d - RECEITA BRUTA', _YELLOW );
           FDRE.AddNodesFromPlanoContas( FNodes.ReceitaBruta, TPlanoContasDRE.pcdreReceitaBruta );

  FNodes.DeducoesVenda := FDRE.AddNode(  nil, '%d - DEDUÇÕES DE VENDAS' );
           FDRE.AddNodesFromPlanoContas( FNodes.DeducoesVenda, TPlanoContasDRE.pcdreDeducoesVenda );

  FNodes.ReceitaLiquida   := FDRE.AddNode(  nil, '%d - RECEITA LIQUIDA (%d-%d)', _YELLOW );
  FNodes.CustoOperacional := FDRE.AddNode(  nil, '%d - CO (CUSTO OPERACIONAL)', _GREEN );
   FNodes.COLeite    := FDRE.AddNode(  FNodes.CustoOperacional, 'CO/LEITE VENDIDO (%d/%d)', _GREEN );
   FNodes.COEQL      := FDRE.AddNode(  FNodes.CustoOperacional, 'CO/EQL (%d/%d)', _GREEN );

  PDRENodeData( FNodes.COLeite.GetData ).Mask     := '#,0.00' ;
  PDRENodeData( FNodes.COLeite.GetData ).XLSSum   := False ;
  PDRENodeData( FNodes.COEQL.GetData   ).Mask := '#,0.00' ;
  PDRENodeData( FNodes.COEQL.GetData ).XLSSum := False ;

      FDRE.AddNodesFromPlanoContas( FNodes.CustoOperacional, TPlanoContasDRE.pcdreDespesaCusto );

  FNodes.LucroOperacional := FDRE.AddNode(  nil, '%d - LUCRO OPERACIONAL (%d-%d)', _YELLOW);
  PDRENodeData( FNodes.LucroOperacional.GetData   ).Resultado := True ;

  FNodes.Depreciacao := FDRE.AddNode(  nil, '%d - DEPRECIAÇÃO', _YELLOW);
       FDRE.AddNodesFromPlanoContas( FNodes.Depreciacao, TPlanoContasDRE.pcdreDepreciacao );

  FNodes.LOLiquido := FDRE.AddNode(  nil, '%d - LUCRO OPERACIONAL - DEPRECIAÇÃO (%d-%d)', _YELLOW);
  PDRENodeData( FNodes.LOLiquido.GetData   ).Resultado := True ;

  FNodes.CustoTotal := FDRE.AddNode(  nil, '%d - CT (CUSTO TOTAL) (%d+%d-%d-%d)', _GREEN );
    FNodes.CTLeite  := FDRE.AddNode(  FNodes.CustoTotal, 'CT/LEITE VENDIDO (%d/%d)', _GREEN );
    FNodes.CTEQL    := FDRE.AddNode(  FNodes.CustoTotal, 'CT/EQL (%d/%d)', _GREEN );
    FNodes.ResultadoFinanceiro := FDRE.AddNode( FNodes.CustoTotal, '%d - RESULTADO FINANCEIRO');
         FDRE.AddNodesFromPlanoContas( FNodes.ResultadoFinanceiro, TPlanoContasDRE.pcdreResultadoFinanceiro, True );

    PDRENodeData( FNodes.CTLeite.GetData ).Mask := '#,0.00' ;
    PDRENodeData( FNodes.CTLeite.GetData ).XLSSum   := False ;
    PDRENodeData( FNodes.CTEQL.GetData   ).Mask := '#,0.00' ;
    PDRENodeData( FNodes.CTEQL.GetData ).XLSSum := False ;
    PDRENodeData( FNodes.ResultadoFinanceiro.GetData   ).Resultado := True ;

    FNodes.ResultadoNaoOperacional := FDRE.AddNode(  FNodes.CustoTotal, '%d - RESULTADO NÃO OPERACIONAL');
         FDRE.AddNodesFromPlanoContas( FNodes.ResultadoNaoOperacional, TPlanoContasDRE.pcdreResultadoNaoOperacional, True);   // venda patrimonio // despesas não operacionais

  PDRENodeData( FNodes.ResultadoNaoOperacional.GetData ).Resultado := True ;

  FNodes.LucroLiquido := FDRE.AddNode(  nil, '%d - LUCRO LÍQUIDO (%d-%d)', _YELLOW );
  PDRENodeData( FNodes.LucroLiquido.GetData ).Resultado := True ;

end;

procedure TDRECompetencia.FillNodes ;
var
  LProcAddToTreeView : TProcAddToTreeView ;
  LLastKey  : string  ;
  LLastNode : PVirtualNode ;
  LValor    : double ;
begin

  LLastKey  := '' ;
  LLastNode := nil ;

  LProcAddToTreeView := procedure( AData : PDataInfo  )
  var
   LNode     : PVirtualNode ;
   LNodeData : PDRENodeData ;
  begin
     //if AKeyPlano = '3;e`!30(gDSF,o[bOY=r' then asm int 3 end ;


     if ( AData.KeyPlano.IsEmpty )
     or (( AData.KeyPlano = LLastKey ) and not Assigned( LLastNode ))  then
        Exit ;

     if AData.KeyPlano <> LLastKey then
       begin
         LLastKey := AData.KeyPlano ;
         if not FDRE.TryGetNode( AData.KeyPlano, LLastNode ) then
           exit ;
       end;

     //ajuste camila....
     (*
     LNode     := LLastNode ;
     LValor := ABS( AData.Valor ) ;
     if PDRENodeData( LNode.GetData ).Negativo then
       LValor := -LValor ;
     *)

     LNode  := LLastNode ;
     LValor := AData.Valor ; //ABS( AData.Valor ) ;
     if PDRENodeData( LNode.GetData ).Negativo then
       LValor := -ABS( LValor ); //-LValor ;


     Repeat
      LNodeData := PDRENodeData( LNode.GetData ) ;
      LNodeData.Columns[ _ACUMULADO ] := LNodeData.Columns[ _ACUMULADO ] + LValor ;
      LNodeData.Columns[ AData.Mes  ] := LNodeData.Columns[ AData.Mes  ] + LValor ;
      LNode := FVST.NodeParent[ LNode ] ;
     Until not Assigned( LNode ) ;
  end;

  FdtmFIN_DRE.ProcessCompetencia( LProcAddToTreeView ) ;

end ;


procedure TDRECompetencia.EnumerateAccounts;
var
  LData  : PDRENodeData ;
  LCount, LCountCO, LCountCT : integer ;

  procedure formatTitle( const ANode : PVirtualNode ; const AFormatArray: array of const ) ;
  begin
    LData := PDRENodeData( ANode.GetData ) ;
    LData.Descricao := Format (  LData.Descricao, AFormatArray ) ;
    LCount := LCount + 1 ;
  end ;

  procedure formatTitleNoSequence( const ANode : PVirtualNode ; const AFormatArray: array of const ) ;
  begin
    LData := PDRENodeData( ANode.GetData ) ;
    LData.Descricao := Format (  LData.Descricao, AFormatArray ) ;
  end ;

begin

  LCount := 1 ;

  if FdtmFIN_DRE.Params.CentroCustoDefault then
    begin
      formatTitle(
         FNodes.LitrosLeite              //  1 - LitrosLeite VENDIDO (LITROS)
       , [
            LCount
         ]
      ) ;

      formatTitle(
         FNodes.ValorMedio        //  2 - VALOR MÉDIO DE VENDA DO LitrosLeite (R$/L)
       , [
            LCount
         ]
      ) ;

      formatTitle(
         FNodes.Equivalente       //  3 - EQL (EQUIVALENTE LitrosLeite EM LITROS) (4/2) = 3+1, 3-1
       , [
            LCount
          , LCount + 1
          , LCount - 1
         ]
      ) ;
    end ;

  formatTitle(
     FNodes.ReceitaBruta      //  4 - RECEITA BRUTA
   , [
        LCount
     ]
   ) ;


  formatTitle(
     FNodes.DeducoesVenda     //  5 - DEDUÇÕES DE VENDAS
   , [
        LCount
     ]
   ) ;

  formatTitle(
     FNodes.ReceitaLiquida    //  6 - RECEITA LIQUIDA (4-5) = 6-2, 6-1
   , [
        LCount
      , LCount - 2
      , LCount - 1
     ]
   ) ;

  LCountCO := LCount ;
  formatTitle(
     FNodes.CustoOperacional  //  7 - CO (CUSTO OPERACIONAL)
   , [
        LCount
     ]
  ) ;

  formatTitleNoSequence(
     FNodes.COLeite          // 'CO/LEITE VENDIDO (7/1)'
   , [
        LCountCO
      , 1
     ]
  ) ;

  formatTitleNoSequence(
     FNodes.COEQL         // 'CO/EQL (7/3)'
   , [
        LCountCO
      , 3
     ]
  ) ;


  formatTitle(
     FNodes.LucroOperacional  //  8 - LUCRO OPERACIONAL (6-7) = 8-2, 8-1
   , [  LCount
      , LCount - 2
      , LCount - 1

     ]
  ) ;

  formatTitle(
     FNodes.Depreciacao       //  9 - DEPRECIAÇÃO
   , [
        LCount
     ]
  ) ;

  formatTitle(
     FNodes.LOLiquido         // 10 - LUCRO OPERACIONAL - DEPRECIAÇÃO (8-9) = 10-2, 10-1
   , [
        LCount
      , LCount - 2
      , LCount - 1
     ]
  ) ;

  LCountCT := LCount ;
  formatTitle(        // 11 - CT (CUSTO TOTAL) (7+9-12-13) = 11-4,11-2,11+1,11+2
     FNodes.CustoTotal
   , [  LCount
      , LCount - 4
      , LCount - 2
      , LCount + 1
      , LCount + 2
     ]
  ) ;


  formatTitleNoSequence(
     FNodes.CTLeite          // CT/LitrosLeite VENDIDO (11/1)
   , [
        LCountCT
      , 1
     ]
  ) ;

  formatTitleNoSequence(
     FNodes.CTEQL         // 'CT/EQL (11/3)'
   , [
        LCountCT
      , 3
     ]
  ) ;

  formatTitle(        // 12 - RESULTADO FINANCEIRO
     FNodes.ResultadoFinanceiro
   , [
        LCount
     ]
  ) ;

  formatTitle(        // 13 - RESULTADO NÃO OPERACIONAL
     FNodes.ResultadoNaoOperacional
  ,  [
        LCount
     ]
  ) ;

  formatTitle(        // 14 LUCRO LÍQUIDO (6-11)  14-8, 14-3
     FNodes.LucroLiquido
   , [
        LCount
      , LCount - 8
      , LCount - 3
     ]
  ) ;



  LCount := 0 ;

  var LNode := FNodes.CustoOperacional.FirstChild.NextSibling.NextSibling ;
  while Assigned ( LNode )  do
    begin
      if FVST.IsVisible[ LNode ] then
        begin
          Inc ( LCount ) ;
          LData := PDRENodeData( LNode.GetData ) ;
          LData.Descricao := Format (
             '%d.%d - %s'
           , [
                LCountCO
              , LCount
              , LData.Descricao
             ]
          ) ;
        end;
        LNode := LNode.NextSibling
    end;

  if LCount = 0 then
    exit ;

  LData := PDRENodeData( FNodes.CustoOperacional.GetData ) ;

  LData.Descricao := Format (
     '%s (soma[%d.1 à %d.%d])'
   , [
        LData.Descricao
      , LCountCO
      , LCountCO
      , LCount
     ]
  ) ;
end;

function TDRECompetencia.GetVST: TVirtualStringTree;
begin
  Result := FVST ;
end;

function TDRECompetencia.GetAddPlanosMethod: TAddPlanosMethod;
begin
  Result := FdtmFIN_DRE.AddPlanos ;
end;

procedure TDRECompetencia.GetInterval(out AStart, AEnd: TDateTime);
begin
  AStart := FdtmFIN_DRE.Params.StartDate;
  AEnd   := FdtmFIN_DRE.Params.EndDate ;
end;

procedure TDRECompetencia.FillTreeView ;
begin
  FDRE.Fill ;
end ;

procedure TDRECompetencia.HideInfoPecuaria ;
begin
  FVST.IsVisible[ FNodes.LitrosLeite ] := False ;
  FVST.IsVisible[ FNodes.ValorMedio  ] := False ;
  FVST.IsVisible[ FNodes.Equivalente ] := False ;
  FVST.IsVisible[ FNodes.COLeite     ] := False ;
  FVST.IsVisible[ FNodes.COEQL       ] := False ;
  FVST.IsVisible[ FNodes.CTLeite     ] := False ;
  FVST.IsVisible[ FNodes.CTEQL       ] := False ;
end ;

procedure TDRECompetencia.FinalizeFill;
begin
  EnumerateAccounts ;
  if not FdtmFIN_DRE.Params.CentroCustoDefault then
     HideInfoPecuaria ;
end;

procedure TDRECompetencia.ExportTreeView( const AFileName : string );
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

constructor TFillExcel.Create(AExcelExporter: IExcelExporter ; AVST : TVirtualStringTree ; ANodes : TDRECompetenciaNodes ) ;
begin
  inherited Create ( AExcelExporter, AVST ) ;
  FTitle := 'DEMONSTRATIVO DE RESULTADOS DO EXERCÍCIO - COMPETÊNCIA' ;
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
      .SetRow( LData.XLSRow )
      .SetCol( 3 )
      .SetValue( 0 ) ;
end;

procedure TFillExcel.CalculateCustoTotal;
begin
  var LFormulaCustoTotal :=
           '%0:s' + PDRENodeData(FNodes.CustoOperacional.GetData       ).XLSRow.ToString
       + '+ %0:s' + PDRENodeData(FNodes.Depreciacao.GetData            ).XLSRow.ToString
       + '- %0:s' + PDRENodeData(FNodes.ResultadoFinanceiro.GetData    ).XLSRow.ToString
       + '- %0:s' + PDRENodeData(FNodes.ResultadoNaoOperacional.GetData).XLSRow.ToString ;

  var LData := PDRENodeData( FNodes.CustoTotal.GetData ) ;

  SetConditionalColor( LData.Resultado ) ;

  FExcelExporter.Format.FillPattern.FgColor  := LData.Color ;
  FExcelExporter.Format.FillPattern.BgColor  := LData.Color ;

  FExcelExporter
    .SetRow( LData.XLSRow ) ;
  for var IterateColumns := 1 to Pred ( LData.Columns.Count )  do
    FExcelExporter
      .SetCol( IterateColumns + 3 )
      .SetValue(
        FExcelExporter.Formula(
           Format( LFormulaCustoTotal
                  , [
                       FExcelExporter.ColName[ IterateColumns + 3 ]
                    ]
           )
        )
    ) ;

end;


procedure TFillExcel.ComputeNodes ;
begin
(*
 Equivalente      := ReceitaBruta / ValorMedio
 ReceitaLiquida   := ReceitaBruta - DeducoesVenda
 COLeite          := CustoOperacional / LitrosLeite
 COEQL            := CustoOperacional / Equivalente
 LucroOperacional := ReceitaLiquida - CustoOperacional
 LOLiquido        := LucroOperacional - Depreciacao
 CustoTotal       := CustoOperacional + Depreciacao - ResultadoFinanceiro - ResultadoNaoOperacional
 CustoLeite       := CustoTotal / LitrosLeite
 CTEQL            := CustoTotal / Equivalente
 LucroLiquido     := ReceitaLiquida - CustoTotal
 *)

  CalculateValorMedio;

  CalculateNode( cnDiv,       FNodes.Equivalente,      FNodes.ReceitaBruta,     FNodes.ValorMedio,       0 ) ;
  CalculateNode( cnSubtract,  FNodes.ReceitaLiquida,   FNodes.ReceitaBruta,     FNodes.DeducoesVenda       ) ;
  CalculateNode( cnDiv,       FNodes.COLeite,          FNodes.CustoOperacional, FNodes.LitrosLeite,      0 ) ;
  CalculateNode( cnDiv,       FNodes.COEQL,            FNodes.CustoOperacional, FNodes.Equivalente,      0 ) ;
  CalculateNode( cnSubtract,  FNodes.LucroOperacional, FNodes.ReceitaLiquida,   FNodes.CustoOperacional    ) ;
  CalculateNode( cnSubtract,  FNodes.LOLiquido,        FNodes.LucroOperacional, FNodes.Depreciacao         ) ;

// CalculateNode( cnSum,       FNodes.CustoTotal,       FNodes.CustoTotal,       FNodes.CustoOperacional        ) ;
// CalculateNode( cnSum,       FNodes.CustoTotal,       FNodes.CustoTotal,       FNodes.Depreciacao             ) ;
// CalculateNode( cnSubtract,  FNodes.CustoTotal,       FNodes.CustoTotal,       FNodes.ResultadoFinanceiro     ) ;
// CalculateNode( cnSubtract,  FNodes.CustoTotal,       FNodes.CustoTotal,       FNodes.ResultadoNaoOperacional ) ;

  CalculateCustoTotal ;
  CalculateNode( cnDiv,       FNodes.CTLeite,          FNodes.CustoTotal,       FNodes.LitrosLeite, 0 ) ;
  CalculateNode( cnDiv,       FNodes.CTEQL,            FNodes.CustoTotal,       FNodes.Equivalente, 0 ) ;
  CalculateNode( cnSubtract,  FNodes.LucroLiquido,     FNodes.ReceitaLiquida,   FNodes.CustoTotal     ) ;

end;


end.
