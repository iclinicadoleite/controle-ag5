unit UFIN.DRE.Common;

interface

uses
    System.Classes
  , System.SysUtils
  , System.Types
  , System.Generics.Collections
  , System.UITypes
  , VCL.Graphics
  , VirtualTrees
  , UFIN.DRE.Utils
  , ExportTreeViewToExcel ;

const
  _GREEN  = $006FD5AC ;
  _YELLOW = $00CCFFFF ;
  _WHITE  = $00FFFFFF ;
  _GREEN_FONT = $00008000 ;
  _RED_FONT   = $003A00FF ;

 _ACUMULADO = 0 ;

type
  TProcGetValue =  ExportTreeViewToExcel.TProcGetValue ;


         (*
const
 _CONTAS_RECEITA_BRUTA               =  'ReceitaBruta'            ;
 _CONTAS_DEDUCOES_VENDA              =  'DeducoesVenda'           ;
 _CONTAS_DESPESA_CUSTO               =  'DespesaCusto'            ;
 _CONTAS_AMORTIZACAO                 =  'Amortizacao'             ;
 _CONTAS_INVESTIMENTOS               =  'Investimentos'           ;
 _CONTAS_DEPRECIACAO                 =  'Depreciacao'             ;
 _CONTAS_RESULTADO_FINANCEIRO        =  'ResultadoFinanceiro'     ;
 _CONTAS_RESULTADO_NAO_OPERACIONAL   =  'ResultadoNaoOperacional' ;

 StrNomesContasDRE : array [ TPlanoContasDRE ] of string =
 (
     _CONTAS_RECEITA_BRUTA
   , _CONTAS_DEDUCOES_VENDA
   , _CONTAS_DESPESA_CUSTO
   , _CONTAS_AMORTIZACAO
   , _CONTAS_INVESTIMENTOS
   , _CONTAS_DEPRECIACAO
   , _CONTAS_RESULTADO_FINANCEIRO
   , _CONTAS_RESULTADO_NAO_OPERACIONAL
 ) ;


 _DEFAULT_DRE =
         StrNomesContasDRE[ pcdreReceitaBruta             ] ; //+'='+StrValoresDefaultContasDRE [ pcdreReceitaBruta             ] ;
 +#13#10+StrNomesContasDRE[ pcdreDeducoesVenda            ]+'='+StrValoresDefaultContasDRE [ pcdreDeducoesVenda            ]
 +#13#10+StrNomesContasDRE[ pcdreDespesaCusto             ]+'='+StrValoresDefaultContasDRE [ pcdreDespesaCusto             ]
 +#13#10+StrNomesContasDRE[ pcdreAmortizacao              ]+'='+StrValoresDefaultContasDRE [ pcdreAmortizacao              ]
 +#13#10+StrNomesContasDRE[ pcdreInvestimentos            ]+'='+StrValoresDefaultContasDRE [ pcdreInvestimentos            ]
 +#13#10+StrNomesContasDRE[ pcdreDepreciacao              ]+'='+StrValoresDefaultContasDRE [ pcdreDepreciacao              ]
 +#13#10+StrNomesContasDRE[ pcdreResultadoFinanceiro      ]+'='+StrValoresDefaultContasDRE [ pcdreResultadoFinanceiro      ]
 +#13#10+StrNomesContasDRE[ pcdreResultadoNaoOperacional  ]+'='+StrValoresDefaultContasDRE [ pcdreResultadoNaoOperacional  ] ;
         *)

type

 TPlanoContasLoader = TProc<string,string,boolean,integer> ;

 TAddPlanosMethod = procedure (
     const AClassificacao : string
   ; const AExclude : TArray<string>
   ; ALoaderProc : TPlanoContasLoader
   ; AUseFirstNode : boolean  ) of object ;

 IDRE = interface
   ['{2AC55AC5-4BEB-454D-91B6-03D7E5989E2F}']
  function  GetVST : TVirtualStringTree ;
  function  GetAddPlanosMethod : TAddPlanosMethod ;
  procedure  GetInterval( out AStart, AEnd : TDateTime )  ;
  procedure InitNodes    ;
  procedure FillNodes    ;
  procedure ComputeNodes ;
  procedure FinalizeFill ;
 end;

 PDataInfo = ^TDataInfo ;
 TDataInfo = record
   KeyPlano          : String  ;
   KeyGrupoProduto   : String  ;
   Estoque           : boolean ;
   Mes               : integer ;
   DebitoCredito     : string  ;
   Valor             : double ;
 end ;

 TProcAddToTreeView = TProc<PDataInfo> ;

 TColumnValues = class
 private
   FCount : integer ;
   FColumns   : array of double ;
   function GetValue(AIndex: integer): double;
   procedure SetValue(AIndex: integer; const AValue: double);
 public
   Constructor Create ( ASize : integer ) ;
   property Value[ AIndex : integer ] : double read GetValue write SetValue ; default ;
   property Count : integer read FCount ;
 end;

 PDRENodeData = ^TDRENodeData;
 TDRENodeData = record
   Descricao : String;
   Level     : integer ;
   Sintetico : boolean ;
   Columns   : TColumnValues ;
   Color     : TColor ;
   Mask      : string ;
   Required  : boolean ;
   Resultado : boolean ;
   Negativo  : boolean ;
   XLSRow    : integer ;
   XLSSum    : boolean ;
 end ;

 TDRENodesList = TDictionary<string, PVirtualNode> ;

 TDRETreeViewUtils = class( TObject, IDRE )
 private
   FDRE    : IDRE ;
   FNodes  : TDRENodesList ;
   FVST    : TVirtualStringTree ;
   FAddPlanosMethod : TAddPlanosMethod ;
  class procedure VSTPaintText(Sender: TBaseVirtualTree;
    const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
    TextType: TVSTTextType);
  class procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
    Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
  class procedure VSTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
  class procedure VSTBeforeCellPaint(Sender: TBaseVirtualTree;
    TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
    CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
  procedure InitalizeEvents ;
  procedure BeginUpdate ;
  procedure InitHeader;
  procedure EndUpdate ;
  procedure ClearUnusedAccounts;
  property DRE : IDRE read FDRE implements IDRE ;
 public
  procedure Fill ;

  procedure AddNodeToList(
       const AKey: string
     ; const ANode: PVirtualNode);
  function AddNode(
     const ARoot : PVirtualNode
   ; const ADescricao : string
   ; const AColor : TColor = _WHITE ) : PVirtualNode;
  procedure AddNodesFromPlanoContas(
       const ARoot     : PVirtualNode
     ; const APlanoContasDRE :  TPlanoContasDRE //const AClassificacoes : string
     ; const AResultado : boolean = False
   ) ;
   function TryGetNode ( const AKey : string ; out ANode : PVirtualNode ) : boolean ;
   procedure ExportToExcel ( const AFileName : string ; const AProcGetValue : TProcGetValue )  ;
   constructor Create (
       const ADRE      : IDRE
      ) ;
    destructor Destroy ; override ;
 end ;

 TCalculateNode = ( cnSum, cnSubtract, cnMult, cnDiv, cnDiv1 ) ;

 TFillExcelBase = class
 protected
   FExcelExporter : IExcelExporter ;
   FVST   : TVirtualStringTree ;
   FTitle : string ;
   FLastRow : integer ;
   procedure CalculateNode( const ACalculateNode : TCalculateNode ; const AResultNode, ANode1, ANode2 : PVirtualNode ; AFromColumn : integer = 1 ) ;
   procedure SetBackGroundColor( AColor : TColor );
   procedure SetConditionalColor( AResultado : boolean ; AMask : string = '#,0.00000' );
   procedure ComputeNodes ; virtual ; abstract ;
   procedure Title ;
   procedure Header ;
   procedure EnumXLSRows ;
   procedure FillNodes  ;
   procedure FillDescricao( AData : PDRENodeData ; ANodeLevel : integer );
   procedure FillAcumulado( AData : PDRENodeData );
   procedure FillColumns  ( ANode : PVirtualNode ; AData : PDRENodeData );
   procedure Finalize ;
 public
    constructor Create ( AExcelExporter : IExcelExporter ; AVST : TVirtualStringTree ) ;
    procedure Execute ;
 end ;

procedure ClearNodeValues( const ANode : PVirtualNode  ) ;
procedure CalculateNode( const ACalculateNode : TCalculateNode ; const AResultNode, ANode1, ANode2 : PVirtualNode  ) ;

implementation

uses
    Tc.RTL.Exceptions
  , TC.VCL.Application
  ;

{ TColumnValues }

constructor TColumnValues.Create(ASize: integer);
var
 i : integer  ;
begin
   FCount := ASize ;
   SetLength( FColumns, ASize ) ;
   for i := Low( FColumns ) To High( FColumns ) do
     FColumns[I] := 0 ;
end;

function TColumnValues.GetValue(AIndex: integer): double;
begin
   Result := 0 ;
   if AIndex < Length( FColumns )  then
      Result := FColumns[ AIndex ]
end;

procedure TColumnValues.SetValue(AIndex: integer; const AValue: double);
begin
   FColumns[ AIndex ] := AValue
end;

procedure CalculateNode( const ACalculateNode : TCalculateNode ; const AResultNode, ANode1, ANode2 : PVirtualNode  ) ;
var
  IterateColumns : integer ;
  LData1       : PDRENodeData ;
  LData2       : PDRENodeData ;
  LResultData  : PDRENodeData ;
  OperationExecutor : TFunc<double> ;
begin
   LData1       := PDRENodeData( ANode1.GetData ) ;
   LData2       := PDRENodeData( ANode2.GetData ) ;
   LResultData  := PDRENodeData( AResultNode.GetData ) ;

   case ACalculateNode of
   cnSum      :
    OperationExecutor :=
          function : double
          begin
            Result := LData1.Columns[ IterateColumns  ] + LData2.Columns[ IterateColumns ] ;
          end;
   cnSubtract :
    OperationExecutor:=
          function : double
          begin
            Result := LData1.Columns[ IterateColumns  ] - LData2.Columns[ IterateColumns ] ;
          end;
   cnMult     :
    OperationExecutor:=
          function : double
          begin
            Result := LData1.Columns[ IterateColumns  ] * LData2.Columns[ IterateColumns ] ;
          end;
   cnDiv      :
    OperationExecutor:=
          function : double
          begin
            if LData2.Columns[ IterateColumns ] = 0 then
               Result := 0
            else
               Result := LData1.Columns[ IterateColumns  ] / LData2.Columns[ IterateColumns ]
          end;
   cnDiv1      :
    OperationExecutor:=
          function : double
          begin
            if LData2.Columns[ IterateColumns ] = 0 then
               Result := LData1.Columns[ IterateColumns  ]
            else
               Result := LData1.Columns[ IterateColumns  ] / LData2.Columns[ IterateColumns ]
          end;
   end ;

   for IterateColumns := 0 to Pred (  LData1.Columns.Count )  do
     LResultData.Columns[ IterateColumns ] := OperationExecutor ;
end ;


procedure ClearNodeValues( const ANode : PVirtualNode  ) ;
var
   LData : PDRENodeData  ;
begin
   LData := PDRENodeData( ANode.GetData ) ;
   for var IterateColumns := 0 to Pred ( LData.Columns.Count )  do
     LData.Columns[ IterateColumns ] := 0  ;
end;

procedure TDRETreeViewUtils.InitalizeEvents ;
begin
  FVST.OnPaintText       := VSTPaintText ;
  FVST.OnGetText         := VSTGetText   ;
  FVST.OnFreeNode        := VSTFreeNode  ;
  FVST.OnBeforeCellPaint := VSTBeforeCellPaint
end;

function TDRETreeViewUtils.TryGetNode ( const AKey : string ; out ANode : PVirtualNode ) : boolean ;
begin
 Result := FNodes.TryGetValue( AKey, ANode ) ;
end;

class procedure TDRETreeViewUtils.VSTBeforeCellPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
begin
  var LData : PDRENodeData := Node.GetData ;
  TargetCanvas.Brush.Color := LData.Color ;
  TargetCanvas.FillRect(CellRect);
end;

class procedure TDRETreeViewUtils.VSTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
   var LData : PDRENodeData := Node.GetData ;
   LData.Descricao := '' ;
   LData.Mask      := '' ;
   LData.Columns.Free ;
end;

class procedure TDRETreeViewUtils.VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  FS : TFormatSettings ;
begin
   FS.DecimalSeparator  := ',' ;
   FS.ThousandSeparator := '.' ;

   var LData : PDRENodeData := Node.GetData ;

   var LMask := LData.Mask ;
   if LMask.IsEmpty then
      LMask := '#,0' ;

   case Column of
     0: CellText := LData.Descricao
   else if ( Column > 0 ) then
       CellText := FormatFloat ( LMask, LData.Columns[ Column - 1 ], FS );
   end;

 end;


class procedure TDRETreeViewUtils.VSTPaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
begin

  var LData := PDRENodeData( Node.GetData ) ;

  if LData.Sintetico then
     TargetCanvas.Font.Style := [fsBold] ;

  if ( Column = 0 ) or ( not LData.Resultado ) then
     exit ;

  if ( LData.Columns[ Column - 1 ] < 0.00 ) then
    TargetCanvas.Font.Color := _RED_FONT
  else
    TargetCanvas.Font.Color := _GREEN_FONT ;

end;

procedure TDRETreeViewUtils.AddNodeToList(
    const AKey: string
  ; const ANode: PVirtualNode);
begin
 try
  FNodes.Add( AKey, ANode ) ;
 except on E : exception do
  RaiseExceptionFmt(
      E
    , UnitName
    , ClassName
    , 'AddNodeToList'
    , 'Plano: "%s" - "%s" '
    , [  AKey
       , PDRENodeData(ANode.GetData).Descricao
      ]
  );
 end;
end;

procedure TDRETreeViewUtils.BeginUpdate;
begin
  FVST.BeginUpdate ;
  FVST.Clear;
  FVST.Header.Columns.Clear;
  FVST.NodeDataSize := SizeOf(TDRENodeData);
  FNodes := TDRENodesList.Create ;
end;

procedure TDRETreeViewUtils.ClearUnusedAccounts;
begin
  for var LNode in  FVST.Nodes( True ) do
    begin
      var LData := PDRENodeData( LNode.GetData ) ;
      FVST.IsVisible[ LNode ] := FVST.IsVisible[ LNode ] and (LData.Required or (LData.Columns[ 0 ] <> 0))
    end;
end;

procedure TDRETreeViewUtils.EndUpdate;
begin
  FVST.EndUpdate ;
  FNodes.free ;
end;

procedure TDRETreeViewUtils.ExportToExcel(const AFileName: string; const AProcGetValue : TProcGetValue );
begin
  TExportTreeViewToExcel.ExportToExcel( FVST, AProcGetValue, AFileName ) ;
end;

procedure TDRETreeViewUtils.InitHeader;
var
  LDate, LEndDate: TDateTime;
begin
  with FVST.Header.Columns.Add do
  begin
    Text := 'DESCRIÇÃO';
    Alignment := taLeftJustify;
    CaptionAlignment := taCenter;
    Width := 350;
  end;

  with FVST.Header.Columns.Add do
  begin
    Text := 'ACUMULADO';
    Alignment := taRightJustify;
    CaptionAlignment := taCenter;
    Width := 100;
  end;

  FDRE.GetInterval(  LDate, LEndDate ) ;
  while LDate <= LEndDate do
    with FVST.Header.Columns.Add do
    begin
      Text := FormatDateTime('mmm/yyyy', LDate);
      Alignment := taRightJustify;
      CaptionAlignment := taCenter;
      Width := 100;
      LDate := IncMonth(LDate);
    end;
end;

procedure TDRETreeViewUtils.Fill;
begin
  BeginUpdate ;
  InitHeader   ;
  FDRE.InitNodes    ;
  FDRE.FillNodes    ;
  FDRE.ComputeNodes ;
  ClearUnusedAccounts ;
  FDRE.FinalizeFill ;
  EndUpdate ;
end;

constructor TDRETreeViewUtils.Create(
       const ADRE      : IDRE
    ) ;
begin
  FDRE := ADRE ;
  FVST := FDRE.GetVST ;
  FAddPlanosMethod := FDRE.GetAddPlanosMethod ;
  InitalizeEvents ;
end;

destructor TDRETreeViewUtils.Destroy;
begin
//  FNodes.Free ;
  inherited;
end;

function TDRETreeViewUtils.AddNode(
     const ARoot : PVirtualNode
   ; const ADescricao : string
   ; const AColor : TColor = _WHITE ) : PVirtualNode;
begin
  Result := FVST.AddChild( ARoot ) ;
  var LData : PDRENodeData := FVST.GetNodeData( Result ) ;//.GetData ;
  LData.Descricao := ADescricao ;
  LData.Sintetico := True ;
  LData.Required  := True ;
  LData.Columns   := TColumnValues.Create( FVST.Header.Columns.Count - 1 ) ;
  LData.Color     := AColor ;
  LData.XLSSum    := True ;
end ;

procedure TDRETreeViewUtils.AddNodesFromPlanoContas(
       const ARoot     : PVirtualNode
     ; const APlanoContasDRE :  TPlanoContasDRE //const AClassificacoes : string
     ; const AResultado : boolean = False
   ) ;
var
  LData : PDRENodeData ;
  LNode, LParentNode : PVirtualNode ;
  LLastLevel : integer ;
  LNegativo : boolean ;
  LClassificacoes : TArray<string> ;
  LExclusoes      : TArray<string> ;

  function CheckIsNegativo( const AClassificao : string ) : string ;
  begin
     Result    := AClassificao ;
     LNegativo := Result.StartsWith('(') ;
     if LNegativo then
       Result := Result.Substring(1, Result.Length - 2 ) ;
  end ;

  function Parse : string ;
  var
    LParseArray : TArray<String> ;
  begin
    var LCountClassificacoes := 0 ;
    var LCountExclusoes      := 0 ;
    LParseArray :=  APlanoContasDRE.GetPlanos.Split([',']) ;
    SetLength( LClassificacoes, Length( LParseArray ) ) ;
    SetLength( LExclusoes,      Length( LParseArray ) ) ;
    for var S in LParseArray do
      begin
        var LClassificacao := S.Replace( ' ', '' ) ;
        if LClassificacao.StartsWith('-') then
          begin
            LExclusoes[ LCountExclusoes ] := LClassificacao.Substring(1) ;
            Inc ( LCountExclusoes ) ;
          end
        else
          begin
            LClassificacoes[ LCountClassificacoes ] := LClassificacao ;
            Inc ( LCountClassificacoes ) ;
          end
      end;
    SetLength( LClassificacoes, LCountClassificacoes ) ;
    SetLength( LExclusoes,      LCountExclusoes ) ;
  end ;

begin
  Parse ;

  LParentNode := ARoot ;
  LNode := ARoot  ;
  LLastLevel := -1 ;

  var Loader : TPlanoContasLoader :=
    procedure( AKeyPlano, ADescricao : string ; ASinetico : boolean ; ALevel : integer  )
    begin
      if ( ALevel < LLastLevel  ) then
        repeat
          if LParentNode.ChildCount = 1 then
             FVST.IsVisible[ LParentNode.FirstChild ] := False
          else if LParentNode.ChildCount > 1 then
             FVST.IsVisible[ LParentNode.FirstChild ] := True ;
          LParentNode := FVST.NodeParent[ LParentNode ] ;
          Dec( LLastLevel ) ;
        until ( not Assigned( LParentNode ) or (LLastLevel = ALevel) )
      else if ( ALevel > LLastLevel  ) then
        LParentNode := LNode ;

      LLastLevel := ALevel ;

      LNode := FVST.AddChild( LParentNode ) ;
      LData := FVST.GetNodeData( LNode ) ;//.GetData ;
      LData.Descricao := ADescricao ;
      LData.Level     := ALevel ;
      LData.Sintetico := ASinetico ;
      LData.Columns   := TColumnValues.Create( FVST.Header.Columns.Count - 1 ) ;
      LData.Color     := _WHITE ;
      LData.Required  := False ;
      LData.Negativo  := LNegativo ;
      LData.Resultado := AResultado ;
      LData.XLSSum    := True ;
      AddNodeToList( AKeyPlano, LNode ) ;
    end ;

  for var LClassificacao in LClassificacoes do
    FAddPlanosMethod {TdtmFIN_DRE( AdtmFIN_DRE ).AddPlanos } ( CheckIsNegativo ( LClassificacao ), LExclusoes, Loader, False ) ;

  if LParentNode.ChildCount = 1 then
    FVST.IsVisible[ LParentNode.FirstChild ] := False
  else if LParentNode.ChildCount > 1 then
    FVST.IsVisible[ LParentNode.FirstChild ] := True ;
end ;



{ TFillExcelBase }

constructor TFillExcelBase.Create(AExcelExporter: IExcelExporter ; AVST : TVirtualStringTree ) ;
begin
  FExcelExporter := AExcelExporter ;
  FVST           := AVST ;
end;

procedure TFillExcelBase.Title  ;
begin

  //  TFlxPatternStyle.Solid
  FExcelExporter.Format.FillPattern.Pattern  := TFlxPatternStyle.LightDown;
  FExcelExporter.Format.FillPattern.FgColor  := clSilver ;
  FExcelExporter.Format.FillPattern.BgColor  := clSilver ;
  FExcelExporter.Format.HAlignment := THFlxAlignment.center ;
  FExcelExporter.Format.VAlignment := TVFlxAlignment.center ;
  FExcelExporter.Format.Font.Size20 := 14 * 20 ;

  var LRow :=  2 ;
  var LCol :=  2 ;

  FExcelExporter
    .SetRow ( LRow )
    .SetCol ( LCol )
    .MergeCells(
          LRow
        , LCol
        , LRow + 1  //LRow
        , LCol + FVST.Header.Columns.Count - 1
    )
    .SetValue( FTitle )
    .NextRow
    .NextRow
    .NextRow ;

  FExcelExporter.Format.Font.Size20 := 11 * 20 ;

end;

procedure TFillExcelBase.Header ;
begin

    FExcelExporter.Format.FillPattern.FgColor  := clWhite ;
    FExcelExporter.Format.FillPattern.BgColor  := clWhite ;

    FExcelExporter.Format.Borders.Left.Style   := TFlxBorderStyle.Thin;
    FExcelExporter.Format.Borders.Left.Color   := clBlack ;
    FExcelExporter.Format.Borders.Top.Style    := TFlxBorderStyle.Thin;
    FExcelExporter.Format.Borders.Top.Color    := clBlack ;
    FExcelExporter.Format.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    FExcelExporter.Format.Borders.Bottom.Color := clBlack ;
    FExcelExporter.Format.Borders.Right.Style  := TFlxBorderStyle.Thin;
    FExcelExporter.Format.Borders.Right.Color  := clBlack ;

(*
    FExcelExporter
    .&For (
        0
      , FVST.Header.Columns.Count - 1
      , procedure (
            const AExcelExporter : IExcelExporter
          ; const AIndex : Integer
          ; out ABreak : boolean )
        begin
           AExcelExporter
             .SetValue( FVST.Header.Columns[ AIndex ].CaptionText )
             .NextCol ;
        end
    )
    .NextRow ;
*)

    For var LIndex := 0 to FVST.Header.Columns.Count - 1 do
      FExcelExporter
        .SetValue( FVST.Header.Columns[ LIndex ].Text {.CaptionText} )
        .NextCol ;

    FExcelExporter.NextRow ;

    FExcelExporter.Format.HAlignment := THFlxAlignment.general ;
    FExcelExporter.Format.VAlignment := TVFlxAlignment.center ;

end;

procedure TFillExcelBase.SetBackGroundColor(AColor: TColor);
begin
  FExcelExporter.Format.FillPattern.FgColor  := AColor ;
  FExcelExporter.Format.FillPattern.BgColor  := AColor ;
end;

procedure TFillExcelBase.SetConditionalColor( AResultado : boolean ; AMask : string = '#,0.00000' );
begin
  if AResultado then
    FExcelExporter.Format.Format  := '[Color 10]'+AMask+';[Red]-'+AMask
  else
    FExcelExporter.Format.Format  := AMask+';[Red]-'+AMask ;
end;

procedure TFillExcelBase.Execute ;
begin
  Title   ;
  Header  ;
  EnumXLSRows ;
  FillNodes ;
  ComputeNodes ;
  Finalize ;
end;

procedure TFillExcelBase.FillDescricao(AData: PDRENodeData ; ANodeLevel : integer );
begin
  SetBackGroundColor( AData.Color ) ;
  FExcelExporter.Format.Font.Color := clBlack ;

  if AData.Sintetico then
    FExcelExporter.Format.Font.Style := [TFlxFontStyles.Bold]
  else
    FExcelExporter.Format.Font.Style := [] ;

  FExcelExporter.Format.Indent := ANodeLevel * 2 ;
  FExcelExporter.SetRowOutlineLevel( ANodeLevel ) ;

  FExcelExporter
   .SetCol( 2 )
   .SetValue( AData.Descricao )
   .NextCol ;

  FExcelExporter.Format.Indent := 0 ;
end;

procedure TFillExcelBase.FillAcumulado( AData : PDRENodeData );
begin
 var LCol : integer ;

 FExcelExporter
  .GetCol ( LCol ) ;

 SetConditionalColor( AData.Resultado ) ; ;

 FExcelExporter
 .SetValue (
    FExcelExporter.Formula(
          Format( 'Sum(%s:%s)'
           , [
                FExcelExporter.GetCellName( AData.XLSRow, LCol + 1 )
              , FExcelExporter.GetCellName( AData.XLSRow, LCol + AData.Columns.Count - 1 )
             ]
          )
      )
   )
  .NextCol ;
end;

procedure TFillExcelBase.FillColumns( ANode : PVirtualNode ; AData : PDRENodeData );
   function UseFormuala( out AFormula : string ) : boolean ;
   begin
      var LString   := '' ;
      var LFirstRow := -1 ;
      var LLastRow  := 0 ;
      var LRows     := 0 ;
      var LNode : PVirtualNode := ANode.FirstChild ;
      while Assigned ( LNode ) do
        begin
          var LData := PDRENodeData(LNode.GetData) ;
          if (LData.XLSRow > 0) and (LData.XLSSum) then
            begin
              if ( LFirstRow = -1 ) then
                 LFirstRow := LData.XLSRow  ;
              LLastRow   := LData.XLSRow  ;
              LString    := LString + '%0:s' + LData.XLSRow.ToString + ', ' ;
              Inc ( LRows )
            end;
          LNode := LNode.NextSibling ;
        end;

      Result := LRows > 0 ;

      if not Result then
        exit ;

      if (LLastRow - LFirstRow + 1) = LRows then
        LString := '%0:s'   + LFirstRow.ToString
                 + ':%0:s' + LLastRow.ToString
      else
        LString := LString.SubString( 0, LString.Length -2 ) ;

       AFormula := Format ( 'SUM( %s )', [ LString ] )
   end ;

begin
  SetConditionalColor( AData.Resultado ) ; ;

  var LFormula : string ;
  if UseFormuala( LFormula ) then
    For var LIndex := 1 to AData.Columns.Count - 1 do
      FExcelExporter
        .SetValue(
          FExcelExporter.Formula(
             Format( LFormula
                    , [
                         FExcelExporter.ColName[ LIndex + 3 ]
                      ]
             )
          )
        )
        .NextCol
  else for var LIndex := 1 to AData.Columns.Count - 1 do
    FExcelExporter
      .SetValue( AData.Columns[ LIndex ] )
      .NextCol
end ;


procedure TFillExcelBase.EnumXLSRows ;
var
  LXLSRow : integer ;
begin
  FExcelExporter.GetRow( LXLSRow ) ;
  for var LNode in  FVST.Nodes( True ) do
   if FVST.IsVisible[ LNode ] then
      begin
        PDRENodeData( LNode.GetData ).XLSRow := LXLSRow  ;
        Inc( LXLSRow ) ;
      end
   else
      PDRENodeData( LNode.GetData ).XLSRow := 0 ;
end ;

procedure TFillExcelBase.FillNodes ;
begin
  for var LNode in  FVST.Nodes( True ) do
    if FVST.IsVisible[ LNode ] then
      begin

        var LData : PDRENodeData := PDRENodeData( LNode.GetData ) ;

        var LRow : integer ;
        FExcelExporter
          .GetRow ( LRow ) ;

        FillDescricao( LData, FVST.GetNodeLevel( LNode ) );
        FillAcumulado( LData ) ;
        FillColumns( LNode, LData ) ;

        FExcelExporter
          .NextRow ;
      end;

  FExcelExporter
    .GetRow( FLastRow ) ;

 end ;


procedure TFillExcelBase.Finalize ;
begin
  FExcelExporter.AutoFitCols ;
  FExcelExporter.CollapseOutlineRows(0, TCollapseChildrenMode.Collapsed )  ;
  FExcelExporter.SetCol( 1 ).SetColWidth( 1000 ) ;

  FExcelExporter.Format.Font.Style := [] ;
  FExcelExporter.Format.FillPattern.FgColor  := clWhite ;
  FExcelExporter.Format.FillPattern.BgColor  := clWhite ;

  FExcelExporter.Format.Borders.Left.Style   := TFlxBorderStyle.None ;
  FExcelExporter.Format.Borders.Top.Style    := TFlxBorderStyle.None ;
  FExcelExporter.Format.Borders.Bottom.Style := TFlxBorderStyle.None ;
  FExcelExporter.Format.Borders.Right.Style  := TFlxBorderStyle.None ;

  FExcelExporter
    .SetRow( FLastRow + 1 )
    .SetCol( 2 )
    .SetValue( 'CL-'+ LoggedUser.DomainCode
             + ' ' + LoggedUser.DomainName
             + ' - Emissão : ' + FormatDateTime ('dd.mm.yyyy - hh:nn', Now )  ) ;

end;

procedure TFillExcelBase.CalculateNode( const ACalculateNode : TCalculateNode ; const AResultNode, ANode1, ANode2 : PVirtualNode ; AFromColumn : integer = 1 ) ;
var
  IterateColumns : integer ;
  LData1       : PDRENodeData ;
  LData2       : PDRENodeData ;
  LResultData  : PDRENodeData ;
  OperationExecutor : TFunc<string> ;
begin
   LData1       := PDRENodeData( ANode1.GetData ) ;
   LData2       := PDRENodeData( ANode2.GetData ) ;
   LResultData  := PDRENodeData( AResultNode.GetData ) ;

   var LData1Row  := LData1.XLSRow ;
   var LData2Row  := LData2.XLSRow ;
   var LResultRow := LResultData.XLSRow ;


   case ACalculateNode of
   cnSum      :
    OperationExecutor :=
          function : string
          begin
            Result :=  FExcelExporter.CellName[LData1Row,IterateColumns+3]
                     +  '+'
                     + FExcelExporter.CellName[LData2Row,IterateColumns+3]   ;
          end;
   cnSubtract :
    OperationExecutor:=
          function : string
          begin
            Result :=  FExcelExporter.CellName[LData1Row,IterateColumns+3]
                     +  '-'
                     + FExcelExporter.CellName[LData2Row,IterateColumns+3]   ;
          end;
   cnMult     :
    OperationExecutor:=
          function : string
          begin
            Result :=  FExcelExporter.CellName[LData1Row,IterateColumns+3]
                     +  '*'
                     + FExcelExporter.CellName[LData2Row,IterateColumns+3]   ;
          end;
   cnDiv      :
    OperationExecutor:=
          function : string
          begin
              Result := 'IF( ' + FExcelExporter.CellName[LData2Row,IterateColumns+3] + '= 0 '
                       + ', '
                       + '0 '
                       + ', '
                       + FExcelExporter.CellName[LData1Row,IterateColumns+3]
                       + '/'
                       + FExcelExporter.CellName[LData2Row,IterateColumns+3]
                       + ' )' ;
          end;
   cnDiv1      :
    OperationExecutor:=
          function : string
          begin
              Result := 'IF( ' + FExcelExporter.CellName[LData2Row,IterateColumns+3] + '= 0 '
                       + ', '
                       + FExcelExporter.CellName[LData1Row,IterateColumns+3]
                       + ', '
                       + FExcelExporter.CellName[LData1Row,IterateColumns+3]
                       + '/'
                       + FExcelExporter.CellName[LData2Row,IterateColumns+3]
                       + ' )' ;
          end;
   end ;

   FExcelExporter
     .SetRow( LResultRow ) ;

  SetConditionalColor( LResultData.Resultado ) ;
  SetBackGroundColor(  LResultData.Color ) ;

  for IterateColumns := AFromColumn to Pred (  LData1.Columns.Count )  do
    begin
      FExcelExporter
        .SetCol( IterateColumns+3 )
        .SetValue(
          FExcelExporter.Formula( OperationExecutor )
        )
    end;
end ;

end.
