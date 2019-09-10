// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Lançamentos
// Funcionality : Compras
//                com ou sem nota fiscal
// License      : veja readme.txt


unit UfrmCOMPRAS_Pedido3;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes,
  VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.StdCtrls, JvDBControls, VCL.DBCtrls, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ActnList, VCL.ComCtrls, VCL.ToolWin, VCL.Buttons, VCL.Mask, JvExMask, JvToolEdit,
  VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvExExtCtrls, JvNetscapeSplitter, SysReportTypes,
  ReportTypes, JvExDBGrids, JvDBGrid, JvDBUltimGrid, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, JvImage,
  JvExtComponent, JvPanel, VCL.ImgList, Tc.VCL.Dialogs, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, JvExStdCtrls, JvCombobox, JvDBCombobox,
  Math, Tc.VCL.Edits.Numbers, JvBaseEdits, JvExForms, JvScrollBox,
  UFin_ComprasPorCentroCustoReport, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.FloatPanel, System.ImageList, Vcl.DBCGrids,
  Tc.RTL.Folders,
  Vcl.Dialogs, JvDialogs, JvDBCheckBox, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, uImageListProvider, SysFormListaFicha, Wrappers,
  Tc.VCL.ControlPopuper ;

type

(*
   TDBCtrlGrid = class( Vcl.DBCGrids.TDBCtrlGrid)
   private
     Procedure WMNCCalcSize( Var msg: TMessage ); message WM_NCCALCSIZE;
   end;
*)

  TPanel = class ( Vcl.ExtCtrls.TPanel )
    FDBCtrlGrid : TDBCtrlGrid ;
    procedure CMChildKey(var Message: TCMChildKey); message CM_CHILDKEY;
  end;


  TfrmCOMPRAS_Pedido = class( T_FormListaFicha )
    dtsItensPedido: TDataSource;
    dtsDadosEntidade: TDataSource;
    ImprimirPedido1: TMenuItem;
    N1: TMenuItem;
    actPrintPedidoFolhaTimbrado: TAction;
    actCopiarPedido: TAction;
    actCancelarManual: TAction;
    actImportarOrcamento: TAction;
    N2: TMenuItem;
    GerarNotaFiscal1: TMenuItem;
    CancelarManual1: TMenuItem;
    ImportarOrcamento1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    actPrintPedidoMatricial: TAction;
    actPrintPedidoEmail: TAction;
    actPrintPedidoPapelBranco: TAction;
    PedidoFolhaBranca1: TMenuItem;
    PedidoEmail1: TMenuItem;
    ImprimirPedidoMatricial1: TMenuItem;
    actPrintTermoGarantia: TAction;
    actPrintFichaEntrega: TAction;
    actPrintFichaChecagem: TAction;
    actPrintFichaMontagem: TAction;
    actPrintRecibo: TAction;
    dtsServicos: TDataSource;
    actPrintComprasCentroCusto: TAction;
    N5: TMenuItem;
    ComprasdoPeriodo1: TMenuItem;
    dtsParcelas: TDataSource;
    cbxInativos: TCheckBox;
    dtsAPagar: TDataSource;
    Label17: TLabel;
    dbContaBancaria: TTcDBComboEdit;
    Label18: TLabel;
    Label19: TLabel;
    dbgParcelasAPagar: TJvDBUltimGrid;
    dbVencimento: TTcDBDateEdit;
    actPrintPedidoPorPeriodo: TAction;
    PorPerodo1: TMenuItem;
    deDtInicial: TTcDateEdit;
    deDtFinal: TTcDateEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbceValorParcela: TJvDBCalcEdit;
    edtDia: TDBEdit;
    edtParcelas: TDBEdit;
    cbProximoMes: TDBCheckBox;
    dbmObsParcela: TDBMemo;
    edTransportadora: TTcDBComboEdit;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    dbContaBancariaTransporte: TTcDBComboEdit;
    cbProximoMesTransporte: TDBCheckBox;
    edtDiaParcelaTransporte: TDBEdit;
    edtParcelasTransporte: TDBEdit;
    dbgParcelasAPagarTransporte: TJvDBUltimGrid;
    dtsPagtoTransporte: TDataSource;
    dtsParcelasTransporte: TDataSource;
    btnProgramarParcelasTransporte: TTcGDIButton;
    dbeVencimentoTransporte: TTcDBDateEdit;
    dbceValorParcelaTransporte: TJvDBCalcEdit;
    dbmObsParcelaTransporte: TDBMemo;
    btbProgramar: TTcGDIButton;
    Label27: TLabel;
    pnlTotalTransporte: TPanel;
    pnlTotalAPagar: TPanel;
    Label26: TLabel;
    DBText6: TDBText;
    Label28: TLabel;
    DBText1: TDBText;
    DBCtrlGridItems: TDBCtrlGrid;
    Label20: TLabel;
    lblUnidCompra: TLabel;
    lblQtdeCompra: TLabel;
    lblDesconto: TLabel;
    lblFrete: TLabel;
    lblContaContabil: TLabel;
    lblTotalItem: TLabel;
    ItemLayout0: TGridPanel;
    ItemLayout1: TGridPanel;
    edItemCodigo: TTcDBComboEdit;
    cbxItemUnidadeCompra: TDBEdit ;
    edItemQtdeCompra: TJvDBCalcEdit;
    edItemValorUnit: TJvDBCalcEdit;
    edItemDesconto: TJvDBCalcEdit;
    edItemFrete: TJvDBCalcEdit;
    edItemTotal: TJvDBCalcEdit;
    cbxItemUnidadeEstoque: TDBLookupComboBox;
    edItemQtdeEstoque: TJvDBCalcEdit;
    edItemUnitarioEstoque: TJvDBCalcEdit;
    edItemContaContabil: TTcDBComboEdit;

    actImportarNFe: TAction;
    actVisualizarDANFe: TAction;
    actAddItemProduto: TAction;
    actRemoveItemProduto: TAction;
    actAddItemServico: TAction;
    actRemoveItemServico: TAction;
    ImageList1: TImageList;
    Action1: TAction;
    actSalvarXMLNFe: TAction;
    JvSaveDialog1: TJvSaveDialog;
    GroupBox1: TGroupBox;
    DBCheckBox1: TJvDBCheckBox;
    edtCheque: TDBEdit;
    Label12: TLabel;
    dbcheckComCheque: TJvDBCheckBox;
    edItemValorIPI: TJvDBCalcEdit;
    PageControl1: TPageControl;
    tbsProdutos: TTabSheet;
    tbsTransporte: TTabSheet;
    Label32: TLabel;
    tbsServicos: TTabSheet;
    pnlTotalServicos: TPanel;
    btnAddServico: TTcGDIButton;
    pnlTotalItens: TPanel;
    Label8: TLabel;
    DBText3: TDBText;
    btnAddProduto: TTcGDIButton;
    lblValorUnitario: TLabel;
    tbsPatrimonios: TTabSheet;
    actAddPatrimonio: TAction;
    actRemovePatrimonio: TAction;
    dtsPatrimoniosPedido: TDataSource;
    PatrimonioLayout0: TGridPanel;
    edPatrimonioCodigo: TTcDBComboEdit;
    cbxPatrimonioUnidadeCompra: TDBComboBox;
    edPatrimonioQtdeCompra: TJvDBCalcEdit;
    edPatrimonioValorUnit: TJvDBCalcEdit;
    edPatrimonioDesconto: TJvDBCalcEdit;
    edPatrimonioFrete: TJvDBCalcEdit;
    edPatrimonioTotal: TJvDBCalcEdit;
    edPatrimonioContaContabil: TTcDBComboEdit;
    tbsObservacoes: TTabSheet;
    DBMemo1: TDBMemo;
    DBCtrlGridPatrimonios: TDBCtrlGrid;
    lblDescricaoPatrimonio: TLabel;
    lblContaContabilPatrimonio: TLabel;
    lblDescontoPatrimonio: TLabel;
    lblFretePatrimonio: TLabel;
    lblQtdePatrimonio: TLabel;
    lblTotalPatrimonio: TLabel;
    lblUnidadePatrimonio: TLabel;
    lblValorUnitarioPatrimonio: TLabel;
    Label29: TLabel;
    btnAdicionaParcela: TTcGDIButton;
    btnRemoveParcela: TTcGDIButton;
    TcGDIButton4: TTcGDIButton;
    TcGDIButton6: TTcGDIButton;
    gbPagamentos: TGroupBox;
    PatrimonioEditPanel: TPanel;
    ItemEditPanel: TPanel;
    btnAdicionaPatrimonio: TTcGDIButton;
    btnRemovePatrimonio: TTcGDIButton;
    Shape1: TShape;
    Shape2: TShape;
    btnAdicionaItem: TTcGDIButton;
    btnRemoveItem: TTcGDIButton;
    lblDescricaoServico: TLabel;
    lblContaContabilServico: TLabel;
    lblQtdeServico: TLabel;
    lblTotalServico: TLabel;
    lblUnidadeServico: TLabel;
    lblValorUnitarioServico: TLabel;
    DBCtrlGridServicos: TDBCtrlGrid;
    ServicoEditPanel: TPanel;
    Shape3: TShape;
    ServicoLayout0: TGridPanel;
    edServicoCodigo: TTcDBComboEdit;
    cbxServicoUnidadeCompra: TDBComboBox;
    edServicoQtdeCompra: TJvDBCalcEdit;
    edServicoValorUnit: TJvDBCalcEdit;
    edServicoTotal: TJvDBCalcEdit;
    edServicoContaContabil: TTcDBComboEdit;
    btnAdicionaServico: TTcGDIButton;
    btnRemoveServico: TTcGDIButton;
    Panel1: TPanel;
    btnAddPatrimonio: TTcGDIButton;
    Label16: TLabel;
    DBText4: TDBText;
    Label10: TLabel;
    DBText2: TDBText;
    GroupBox4: TGroupBox;
    Label30: TLabel;
    JvDBCheckBox1: TJvDBCheckBox;
    DBEdit1: TDBEdit;
    JvDBCheckBox2: TJvDBCheckBox;
    pnInfoNota: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label22: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label23: TLabel;
    dbTotalNota: TDBText;
    Label15: TLabel;
    Label9: TLabel;
    Image1: TImage;
    lblAviso: TLabel;
    GroupBox3: TGroupBox;
    DBMemo3: TDBMemo;
    dbSerie: TDBEdit;
    dbDataCompra: TTcDBDateEdit;
    dbDataEmissao: TTcDBDateEdit;
    dbcbStatus: TJvDBComboBox;
    dbDataEntrada: TTcDBDateEdit;
    dbImpostos: TJvDBCalcEdit;
    dbDescontos: TJvDBCalcEdit;
    dbFrete: TJvDBCalcEdit;
    btnAnexos: TTcGDIButton;
    dbNotaFiscal: TDBEdit;
    btnRatearDesconto: TTcGDIButton;
    btnRatearFrete: TTcGDIButton;
    btnRatearImposto: TTcGDIButton;
    edEntidade: TTcDBComboEdit;
    dbChaveNFe: TDBEdit;
    btnImportarNFe: TTcGDIButton;
    btnVisualziarDANFe: TTcGDIButton;
    btnSavarXML: TTcGDIButton;
    cbAnual: TJvDBCheckBox;
    cbAnualTransporte: TJvDBCheckBox;
    dtsUnidadesControlaEstoque: TDataSource;
    SelecionarUnidadeEstoque: TPanel;
    dblcUnidadeControlaEstoque: TDBLookupComboBox;
    Label31: TLabel;
    Label33: TLabel;
    btbPanelSaveOk: TTcGDIButton;
    btbPanelSaveCancel: TTcGDIButton;
    PopuperSelecionarUnidadeEstoque: TTcControlPopuper;
    btnExpandItens: TTcGDIButton;
    actExpandItens: TAction;
    procedure edEntidadeButtonClick(Sender: TObject);
    procedure edCompradorButtonClick(Sender: TObject);
    procedure actPrintPedidoFolhaTimbradoExecute(Sender: TObject);
    procedure actPrintPedidoPapelBrancoExecute(Sender: TObject);
    procedure actPrintPedidoEmailExecute(Sender: TObject);
    procedure actPrintPedidoMatricialExecute(Sender: TObject);
    procedure actPrintReciboExecute(Sender: TObject);
    procedure actCopiarPedidoExecute(Sender: TObject);
    procedure actImportarOrcamentoExecute(Sender: TObject);
    procedure actPrintComprasCentroCustoExecute(Sender: TObject);
    procedure actPrintComprasCentroCustoUpdate(Sender: TObject);
    procedure btnAddProdutoClick(Sender: TObject);
    procedure cbxInativosClick(Sender: TObject);
    procedure btnAddServicoClick(Sender: TObject);
    procedure dbgParcelasAPagarEditButtonClick(Sender: TObject);
    procedure dbgParcelasAPagarKeyPress(Sender: TObject; var Key: Char);
    procedure dbContaBancariaButtonClick(Sender: TObject);
    procedure btbProgramarClick(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure btnRemoveParcelaClick(Sender: TObject);
    procedure btnAdicionaParcelaClick(Sender: TObject);
    procedure actPrintPedidoPorPeriodoExecute(Sender: TObject);
    procedure btnAnexosClick(Sender: TObject);
    procedure _actNewExecute(Sender: TObject);
    procedure _actEditExecute(Sender: TObject);
    procedure _dbgListaDblClick(Sender: TObject);
    procedure _actDeleteExecute(Sender: TObject);

    // control grid setup...
    procedure dtsItensPedidoDataChange(Sender: TObject; Field: TField);
    procedure dtsPatrimoniosPedidoDataChange(Sender: TObject; Field: TField);
    procedure dtsServicosDataChange(Sender: TObject; Field: TField);

    procedure btnRatearDescontoClick(Sender: TObject);
    procedure btnRatearFreteClick(Sender: TObject);
    procedure btnRatearImpostoClick(Sender: TObject);
    procedure btnProgramarParcelasTransporteClick(Sender: TObject);
    procedure dbContaBancariaTransporteButtonClick(Sender: TObject);
    procedure TcGDIButton4Click(Sender: TObject);
    procedure TcGDIButton6Click(Sender: TObject);
    procedure dbgParcelasAPagarTransporteEditButtonClick(Sender: TObject);
    procedure dbgParcelasAPagarTransporteKeyPress(Sender: TObject;
      var Key: Char);
    procedure edTransportadoraButtonClick(Sender: TObject);
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);

    procedure DBCtrlGridItemsPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);

    procedure edItemCodigoButtonClick(Sender: TObject);
    procedure edItemContaContabilButtonClick(Sender: TObject);
    procedure edItemCFOPButtonClick(Sender: TObject);
    procedure edItemCFOP_ESTOQUEButtonClick(Sender: TObject);


    procedure dbcbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actImportarNFeExecute(Sender: TObject);
    procedure actImportarNFeUpdate(Sender: TObject);

    procedure actAddItemProdutoExecute(Sender: TObject);
    procedure actAddItemProdutoUpdate(Sender: TObject);
    procedure actRemoveItemProdutoExecute(Sender: TObject);
    procedure actRemoveItemProdutoUpdate(Sender: TObject);

    procedure actAddItemServicoExecute(Sender: TObject);
    procedure actAddItemServicoUpdate(Sender: TObject);
    procedure actRemoveItemServicoExecute(Sender: TObject);
    procedure actRemoveItemServicoUpdate(Sender: TObject);

    procedure actAddPatrimonioExecute(Sender: TObject);
    procedure actAddPatrimonioUpdate(Sender: TObject);
    procedure actRemovePatrimonioExecute(Sender: TObject);
    procedure actRemovePatrimonioUpdate(Sender: TObject);

    procedure edEntidadeChange(Sender: TObject);
    procedure LayoutEnter(Sender: TObject);
    procedure PatrimonioLayout0Enter(Sender: TObject);
    procedure actVisualizarDANFeExecute(Sender: TObject);
    procedure actVisualizarDANFeUpdate(Sender: TObject);
    procedure actSalvarXMLNFeUpdate(Sender: TObject);
    procedure actSalvarXMLNFeExecute(Sender: TObject);
    procedure DBCheckBox1Change(Sender: TObject);
    procedure DBCtrlGridPatrimoniosPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure edPatrimonioCodigoEnter(Sender: TObject);
    procedure edPatrimonioCodigoButtonClick(Sender: TObject);
    procedure edPatrimonioContaContabilButtonClick(Sender: TObject);

    procedure DBCtrlGridServicosPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure edServicoCodigoEnter(Sender: TObject);
    procedure edServicoCodigoButtonClick(Sender: TObject);
    procedure edServicoContaContabilButtonClick(Sender: TObject);

    procedure deDtInicialExit(Sender: TObject);
    procedure deDtFinalExit(Sender: TObject);
    procedure btnAddPatrimonioClick(Sender: TObject);
    procedure ItemEditPanelResize(Sender: TObject);
    procedure PatrimonioEditPanelResize(Sender: TObject);
    procedure ServicoEditPanelResize(Sender: TObject);
    procedure btbPanelSaveOkClick(Sender: TObject);
    procedure btbPanelSaveCancelClick(Sender: TObject);
    procedure actExpandItensExecute(Sender: TObject);
  private
    { Private declarations }
    FValidApropriacao : Boolean;
    procedure InitItemPanel ;
    procedure SearchEntidade ( TextToSearch : string);
    procedure SearchEntidadeTransporte ( TextToSearch : string);
    procedure SearchContato ( TextToSearch : string);
    procedure SearchComprador ( TextToSearch : string);
    procedure SearchCFOP ( ATextToSearch : string ) ;
    procedure SearchCFOP_ESTOQUE ( ATextToSearch : string ) ;
    procedure SearchProduto ( TextToSearch : string);
    procedure SearchPatrimonio ( TextToSearch : string);
    procedure SearchServico ( TextToSearch : string);
    procedure ChangeFilter ;
    procedure SearchContaPadrao( TextToSearch :string );
    procedure SearchContaPadraoTransporte( TextToSearch :string );
    procedure SearchContaBancaria( TextToSearch :string );
    procedure SearchContaBancariaTransporte( TextToSearch :string );
    procedure ProcessSuccessInfo ;
    procedure ApagaAnexos ;
    function ParcelaBaixada : Boolean ;

    function CalcularValorPorReferecia ( Total, Referencia, Valor : double  ) : double ;
    procedure RatearImposto ;
    procedure RatearFrete ;
    procedure RatearDesconto ;
    procedure CheckReadOnlyFields ;
    procedure CheckReadOnlyFieldItens ;
    procedure CheckReadOnlyFieldPatrimonios;

    procedure ExibeCamposCheque;
    procedure OnShowModal(Sender: TObject);
    procedure SetValidApropriacao(const Value: Boolean);
    procedure ProdutoNaoVinculado ;
    procedure QueryControlaEstoque ;
  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
  public
    { Public declarations }
    class var KCMP_PEDIDO : string ;
    constructor Create ( AOwner : TComponent ) ; override ;
    property ValidApropriacao: Boolean read FValidApropriacao write SetValidApropriacao;
  end;

implementation

uses   Tc.DBRTL.AbstractDB
     , ThreadSuppl
     , UdtmCOMPRAS_Pedido3
     , SearchsFinanceiro
     {,  UfrmCOMPRAS_ImportaOrcamento}
     , UfqrCOMPRAS_Pedido
     , UApplResources
     , DateUtils
     , UFin_ComprasPorPeriodoReport
     , UFIN_AnexosWizard
     , Tc.RTL.Exceptions
     , UDBAnexos, UDBFinanceiro
     , UfrmImportNFeCompra
     , CLAg5SvcEstoqueProdutos
     , CLAg5SvcEstoqueEntradaDadosCompras
     , CLAg5SvcEstoquePatrimonio
     , CLAg5SvcFinanceiroApropriacao
     , TypInfo
     , DANFeQR ;


const TipoProduto = 1;
      TipoServico = 3;

{$R *.dfm}

type
  SvcEstoqueEntradaDadosComprasFactory = class( TInterfacedObject, ISvcEstoqueEntradaDadosCompras )
    function Execute(AKCMP_PEDIDO : string; AValidApropriacao: Boolean = True) : string  ;
  end;

constructor TfrmCOMPRAS_Pedido.Create(AOwner: TComponent);
var
  i: Integer;
  MyDataLink : TDataLink ;
begin
  inherited;

  deDtInicial.Date := StartOfTheMonth( Date ) ;
  deDtFinal.Date   := EndOfTheMonth( Date ) ;

  deDtInicial.OnExit := deDtInicialExit ;
  deDtFinal.OnExit   := deDtFinalExit ;

  TdtmCOMPRAS_Pedido.Create ( self ) ;

  TdtmCOMPRAS_Pedido( DatamoduleBase ).KCMP_PEDIDO := TfrmCOMPRAS_Pedido.KCMP_PEDIDO ;
  ValidApropriacao := True;

   dtsLista.DataSet              := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsLstPedidos ;
   dtsFicha.DataSet              := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedido ;

   dtsItensPedido.DataSet        := nil ;
   dtsPatrimoniosPedido.DataSet  := nil ;
   dtsServicos.DataSet           := nil ;
   dtsDadosEntidade.DataSet      := nil ;
   dtsAPagar.DataSet             := nil ;
   dtsParcelas.DataSet           := nil ;
   dtsPagtoTransporte.DataSet    := nil ;
   dtsParcelasTransporte.DataSet := nil ;
   dtsUnidadesControlaEstoque.DataSet := nil ;

   dtsItensPedido.DataSet        := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedido ;

   dtsPatrimoniosPedido.DataSet  := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido ;
   dtsServicos.DataSet           := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsServicosPedido ;
   dtsDadosEntidade.DataSet      := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsDadosEntidade ;
   dtsAPagar.DataSet             := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsAPagar ;
   dtsParcelas.DataSet           := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsParcelas ;
   dtsPagtoTransporte.DataSet    := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsAPagarTransporte ;
   dtsParcelasTransporte.DataSet := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsParcelasTransporte ;
   dtsUnidadesControlaEstoque.DataSet := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsUnidadesControlaEstoque ;

  if KCMP_PEDIDO <> '' then
    _pageControl.ActivePage := _tbsFicha ;

  KCMP_PEDIDO := '' ;

  InitItemPanel;
  ItemEditPanel.FDBCtrlGrid       := DBCtrlGridItems ;
  PatrimonioEditPanel.FDBCtrlGrid := DBCtrlGridPatrimonios ;
  ServicoEditPanel.FDBCtrlGrid    := DBCtrlGridServicos ;

  DatamoduleBase.OpenTables ;

//  ItemEditPanel.Align := alNone ;
//  ItemEditPanel.Top   := DBCtrlGridItems.Top ;
//  ItemEditPanel.Left  := DBCtrlGridItems.Left ;
//  ItemEditPanel.Width := DBCtrlGridItems.PanelWidth ;

//  PatrimonioEditPanel.Align := alNone ;
//  PatrimonioEditPanel.Top   := DBCtrlGridPatrimonios.Top ;
//  PatrimonioEditPanel.Left  := DBCtrlGridPatrimonios.Left ;
//  PatrimonioEditPanel.Width := DBCtrlGridPatrimonios.PanelWidth ;

//  ItemsEditPanel.BringToFront ;


  ChangeFilter ;

  PageControl1.ActivePageIndex := 0 ;

  ExibeCamposCheque;

(*
      for i := 0 to dbgItens.Columns.Count - 1 do
        begin
          if dbgItens.Columns[i].FieldName = 'VALOR_PARCIAL' then
            dbgItens.Columns[i].Visible := False ;

          if dbgItens.Columns[i].FieldName = 'CUSTO' then
            dbgItens.Columns[i].Visible := False ;
        end;
*)

end;

procedure TfrmCOMPRAS_Pedido.DBCheckBox1Change(Sender: TObject);
begin
  ExibeCamposCheque;
end;

procedure TfrmCOMPRAS_Pedido.dbcbKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if TDBLookupComboBox (Sender).ReadOnly then
     exit ;


  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
      Key := 0 ;
      TDBLookupComboBox ( Sender ).DropDown ;
      //dbgItens.OnEnter( Self );
    end
  else if ( not Key in [ VK_RETURN ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    TDBLookupComboBox ( Sender ).DropDown ;
end;

procedure TfrmCOMPRAS_Pedido.dbContaBancariaButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  SearchContaPadrao( dbContaBancaria.Text );
end;


procedure TfrmCOMPRAS_Pedido.dbgParcelasAPagarEditButtonClick(Sender: TObject);
begin
  with dbgParcelasAPagar, TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    if ( SelectedField = cdsParcelasNOMECONTA ) then
      SearchContaBancaria( InplaceEditor.Text );
end;

procedure TfrmCOMPRAS_Pedido.dbgParcelasAPagarKeyPress(Sender: TObject; var Key: Char);
begin
  with dbgParcelasAPagar, TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
      if ( Key = #13 ) and Assigned( InplaceEditor ) and ( InplaceEditor.Visible ) then
        begin
          Key := #0;
          if ( SelectedField = cdsParcelasNOMECONTA ) then
            SearchContaBancaria( InplaceEditor.Text );
        end;
    end;
end;

procedure TfrmCOMPRAS_Pedido.dbgParcelasAPagarTransporteEditButtonClick(
  Sender: TObject);
begin
// que coisa é essa ...
//  if TTcDBComboEdit ( Sender ).ReadOnly then
//    exit ;
  with dbgParcelasAPagarTransporte, TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    if ( SelectedField = cdsParcelasTransporteNOMECONTA ) then
      SearchContaBancariaTransporte( InplaceEditor.Text );
end;

procedure TfrmCOMPRAS_Pedido.dbgParcelasAPagarTransporteKeyPress(
  Sender: TObject; var Key: Char);
begin
  with dbgParcelasAPagarTransporte, TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
      if ( Key = #13 ) and Assigned( InplaceEditor ) and ( InplaceEditor.Visible ) then
        begin
          Key := #0;
          if ( SelectedField = cdsParcelasTransporteNOMECONTA ) then
            SearchContaBancariaTransporte( InplaceEditor.Text );
        end;
    end;
end;

procedure TfrmCOMPRAS_Pedido.SearchEntidade(TextToSearch: string);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchFornecedorAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        SetEntidade( Result.FieldByName( 'KCAD_ENTIDADE' ).asString, Result.FieldByName( 'NOME' ).asString ) ;
  finally
    free ;
  end ;
end ;

procedure TfrmCOMPRAS_Pedido.SearchEntidadeTransporte(TextToSearch: string);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchFornecedorAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        SetEntidadeTransporte( Result.FieldByName( 'KCAD_ENTIDADE' ).asString, Result.FieldByName( 'NOME' ).asString ) ;
  finally
    free ;
  end ;
end ;

procedure TfrmCOMPRAS_Pedido.SearchProduto(TextToSearch: string);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchProdutoInsumoAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        insereItem( Result.FieldByName( 'KEST_PRODUTO' ).asString,
                    Result.FieldByName( 'CODIGO' ).asString,
                    Result.FieldByName( 'NOME' ).asString, 1,
                    Result.FieldByName( 'CUSTO_MEDIO' ).asCurrency,
                    Result.FieldByName( 'UNIDADE' ).AsString,
                    Result.FieldByName( 'KFIN_PLANOCONTA'  ).asString,
                    Result.FieldByName( 'DESCR_PLANOCONTA' ).asString,
                    Result.FieldByName( 'BAIXA_ESTOQUE'    ).asBoolean
             ) ;
      CheckReadOnlyFieldItens;
    finally
      free ;
    end ;
end ;

procedure TfrmCOMPRAS_Pedido.SearchPatrimonio(TextToSearch: string);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchPatrimonioAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        inserePatrimonio ( Result.FieldByName( 'KCAD_PATRIMONIO' ).asString,
                    Result.FieldByName( 'KFIN_PLANOCONTA'  ).asString,
                    Result.FieldByName( 'DESCR_PLANOCONTA' ).asString
             ) ;
      CheckReadOnlyFieldPatrimonios;
    finally
      free ;
    end ;
end ;

procedure TfrmCOMPRAS_Pedido.edEntidadeButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  SearchEntidade ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmCOMPRAS_Pedido.edEntidadeChange(Sender: TObject);
begin
//  try
    if not Assigned( TdtmCOMPRAS_Pedido( DatamoduleBase ) ) then
       exit ;

    if not (TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedido.State in [dsInsert,dsEdit]) then
      exit ;


    if ( edEntidade.Text <> TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoNOMEENTIDADE.asString )
    and not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoKCAD_ENTIDADE.isNull then
    TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoKCAD_ENTIDADE.Clear ;
//  except On E: Exception do
//      RaiseException ( E, UnitName, ClassName, 'edEntidadeChange' ) ;
//  end;
end;

procedure TfrmCOMPRAS_Pedido.edTransportadoraButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  SearchEntidadeTransporte ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmCOMPRAS_Pedido.ExibeCamposCheque;
begin
  dbcheckComCheque.Visible := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsAPagarPAGTO_AVISTA.AsBoolean;
  if ( dbcheckComCheque.Visible ) then
    begin
      edtCheque.Visible := True;
      Label12.Visible := True;
    end
  else
    begin
      dbcheckComCheque.Checked := False;
      edtCheque.Clear;
      edtCheque.Visible := False;
      Label12.Visible := False;
    end;
end;

procedure TfrmCOMPRAS_Pedido.InitItemPanel;
begin
  ItemEditPanel.Height := 36 ;
  ItemLayout1.Visible := False ;
  btnExpandItens.Caption := '>' ;
  btnExpandItens.Hint := 'Expandir informações dos itens' ;
end;

procedure TfrmCOMPRAS_Pedido.ItemEditPanelResize(Sender: TObject);
var
 LRows : integer ;
begin
  LRows := (DBCtrlGridItems.Parent.ClientHeight - DBCtrlGridItems.Top) div TCustomPanel(Sender).Height ;
  DBCtrlGridItems.Height   := LRows * TCustomPanel(Sender).Height ;
  DBCtrlGridItems.RowCount := LRows ;
  DBCtrlGridItems.PanelHeight := TCustomPanel(Sender).Height ;
end;

procedure TfrmCOMPRAS_Pedido.LayoutEnter(Sender: TObject);
begin
//  if not Assigned ( Screen.ActiveControl )
//    or (Screen.ActiveControl.Parent <> TWinControl ( Sender ) ) then
//    TControl ( Sender ).Set
//
//    edItemCodigo.SetFocus ;
end;

procedure TfrmCOMPRAS_Pedido.OnShowModal(Sender: TObject);
begin
  Self._actEditExecute(nil);
  Self.dtsAPagar.DataSet.Edit;
end;

procedure TfrmCOMPRAS_Pedido.PatrimonioEditPanelResize(Sender: TObject);
var
 LRows : integer ;
begin
  LRows := (DBCtrlGridPatrimonios.Parent.ClientHeight - DBCtrlGridPatrimonios.Top) div TCustomPanel(Sender).Height ;
  DBCtrlGridPatrimonios.Height   := LRows * TCustomPanel(Sender).Height ;
  DBCtrlGridPatrimonios.RowCount := LRows ;
  DBCtrlGridPatrimonios.PanelHeight := TCustomPanel(Sender).Height ;
end;

procedure TfrmCOMPRAS_Pedido.PatrimonioLayout0Enter(Sender: TObject);
begin
  if not Assigned ( Screen.ActiveControl )
    or (Screen.ActiveControl.Parent <> PatrimonioEditPanel ) then
    edPatrimonioCodigo.SetFocus ;
end;

procedure TfrmCOMPRAS_Pedido.dbContaBancariaTransporteButtonClick(Sender: TObject);
begin
  SearchContaPadraoTransporte( dbContaBancariaTransporte.Text );
end;


function DrawBiDiText(DC: HDC; const Text: string; var R: TRect; {Flags: UINT;}
  Alignment: TAlignment {; RightToLeft: Boolean; CanvasOrientation: TCanvasOrientation }): Integer;
const
  AlignFlags: array [TAlignment] of UINT = (DT_LEFT, DT_RIGHT, DT_CENTER);
  RTL: array [Boolean] of UINT = (0, DT_RTLREADING);
begin
  //if CanvasOrientation = coRightToLeft then
  //  ChangeBiDiModeAlignment(Alignment);
  Result := WinAPI.Windows.DrawText(DC, PChar(Text), Length(Text), R,
    AlignFlags[Alignment] {or RTL[RightToLeft] or Flags} );
end;


procedure &Do ( ADBCtrlGrid : TDBCtrlGrid ; ACtrlPanel : TCustomPanel ; AControl : TControl ) ;
var
  LText : PChar ;
  LFieldName,
  LDisplayText : string ;
  LClientRect : TRect ;
  LField : TField ;
begin
   begin

    LFieldName := TypInfo.GetPropValue(AControl, 'DATAFIELD') ;
    if (AControl.Visible) and (LFieldName <> '') then
     begin
      LField := ADBCtrlGrid.DataSource.DataSet.FieldByName(LFieldName);
      LDisplayText := LField.DisplayText ;


      LClientRect.TopLeft := Point ( AControl.Left,
                                     AControl.Top + 2 ) ;
      LClientRect.BottomRight := Point ( AControl.Left + AControl.Width,
                                         AControl.Top  + AControl.Height + 2 ) ;

      LClientRect.TopLeft     := AControl.Parent.ClientToParent( LClientRect.TopLeft      ) ;
      LClientRect.BottomRight := AControl.Parent.ClientToParent( LClientRect.BottomRight  ) ;

      //ADBCtrlGrid.Canvas.Font.Style := ADBCtrlGrid.Canvas.Font.Style + [fsBold] ;

      //ADBCtrlGrid.Canvas.TextRect( LClientRect, LDisplayText ) ;
      DrawBiDiText(ADBCtrlGrid.Canvas.Handle, LDisplayText, LClientRect, LField.Alignment ) ;
      //ADBCtrlGrid.Canvas.Font.Style := ADBCtrlGrid.Canvas.Font.Style - [fsBold] ;

      InflateRect ( LClientRect, 5, 5 ) ;
      ADBCtrlGrid.Canvas.Pen.Color := clSilver ; //$00EEEEEE ;
      ADBCtrlGrid.Canvas.Brush.Style := bsClear ;
      ADBCtrlGrid.Canvas.RoundRect( LClientRect.Left, LClientRect.Top, LClientRect.Right, LClientRect.Bottom, 0, 0 );

     end;
   end;
end ;


procedure TfrmCOMPRAS_Pedido.DBCtrlGridItemsPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
var
  LCtrlPanel : TCustomPanel ;
  LControlIdx : integer ;
  LControl: TControl ;
  LScrollWidth : integer ;
begin

  if Odd( Index ) then
    DBCtrlGrid.Canvas.Brush.Color := clBtnFace
  else
    DBCtrlGrid.Canvas.Brush.Color := clWhite ;

   LScrollWidth := GetSystemMetrics(SM_CXVSCROLL) ;

  DBCtrlGrid.Canvas.FillRect ( Rect(0,0, DBCtrlGrid.ClientWidth, DBCtrlGrid.ClientHeight )  );

  LCtrlPanel := ItemEditPanel ;

  if DBCtrlGrid.PanelIndex = Index then
   begin
     if LCtrlPanel.Top <> DBCtrlGrid.Top + DBCtrlGrid.PanelHeight * DBCtrlGrid.PanelIndex then
        LCtrlPanel.Top := DBCtrlGrid.Top + DBCtrlGrid.PanelHeight * DBCtrlGrid.PanelIndex ;
     if LCtrlPanel.Width <> DBCtrlGrid.PanelWidth then
        LCtrlPanel.Width := DBCtrlGrid.PanelWidth ;

     //ItemLayout1.Top := LCtrlPanel.Top + LCtrlPanel.Height - 5 ;

     for LControlIdx := 0 to ItemLayout0.ControlCount -1 do
         ItemLayout0.Controls [ LControlIdx ].Width := ItemLayout0.Width ;
     for LControlIdx := 0 to ItemLayout1.ControlCount -1 do
         ItemLayout1.Controls [ LControlIdx ].Width := ItemLayout1.Width ;

     edItemCodigo.Button.Visible := False ;
     edItemCodigo.Button.Visible := True ;

     edItemContaContabil.Button.Visible := False ;
     edItemContaContabil.Button.Visible := True ;

     lblUnidCompra.Left          := cbxItemUnidadeCompra.Left   + 5 ;
     lblQtdeCompra.Left          := edItemQtdeCompra.Left       + 5 ;
     lblValorUnitario.Left       := edItemValorUnit.Left        + 5 ;
     lblDesconto.Left            := edItemDesconto.Left         + 5 ;
     lblFrete.Left               := edItemFrete.Left            + 5 ;
     lblTotalItem.Left           := edItemTotal.Left            + 5 ;
     lblContaContabil.Left       := edItemContaContabil.Left    + 5 ;

     exit ;
   end ;

  &Do ( DBCtrlGrid, LCtrlPanel, edItemCodigo           ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, cbxItemUnidadeCompra   ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edItemQtdeCompra       ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edItemValorUnit        ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edItemDesconto         ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edItemFrete            ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, cbxItemUnidadeEstoque  ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edItemQtdeEstoque      ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edItemContaContabil    ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edItemTotal            ) ;
end;


procedure TfrmCOMPRAS_Pedido.DBCtrlGridPatrimoniosPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
var
  LCtrlPanel : TCustomPanel ;
  LControlIdx : integer ;
begin

  if Odd( Index ) then
    DBCtrlGrid.Canvas.Brush.Color := clBtnFace
  else
    DBCtrlGrid.Canvas.Brush.Color := clWhite ;

  DBCtrlGrid.Canvas.FillRect ( Rect(0,0, DBCtrlGrid.Width, DBCtrlGrid.Height )  );

  LCtrlPanel := PatrimonioEditPanel ;

  if DBCtrlGrid.PanelIndex = Index then
   begin
     if LCtrlPanel.Top <> DBCtrlGrid.Top + DBCtrlGrid.PanelHeight * DBCtrlGrid.PanelIndex then
        LCtrlPanel.Top := DBCtrlGrid.Top + DBCtrlGrid.PanelHeight * DBCtrlGrid.PanelIndex ;
     if LCtrlPanel.Width <> DBCtrlGrid.PanelWidth then
        LCtrlPanel.Width := DBCtrlGrid.PanelWidth ;

     for LControlIdx := 0 to PatrimonioLayout0.ControlCount -1 do
         PatrimonioLayout0.Controls [ LControlIdx ].Width := PatrimonioLayout0.Width ;

     edPatrimonioCodigo.Button.Visible := False ;
     edPatrimonioCodigo.Button.Visible := True ;

     edPatrimonioContaContabil.Button.Visible := False ;
     edPatrimonioContaContabil.Button.Visible := True ;

     lblUnidadePatrimonio.Left            := cbxPatrimonioUnidadeCompra.Left   + 5 ;
     lblQtdePatrimonio.Left               := edPatrimonioQtdeCompra.Left       + 5 ;
     lblValorUnitarioPatrimonio.Left      := edPatrimonioValorUnit.Left        + 5 ;
     lblDescontoPatrimonio.Left           := edPatrimonioDesconto.Left         + 5 ;
     lblFretePatrimonio.Left              := edPatrimonioFrete.Left            + 5 ;
     lblTotalPatrimonio.Left              := edPatrimonioTotal.Left            + 5 ;
     lblContaContabilPatrimonio.Left      := edPatrimonioContaContabil.Left    + 5 ;

     exit ;
   end ;

  &Do ( DBCtrlGrid, LCtrlPanel, edPatrimonioCodigo           ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, cbxPatrimonioUnidadeCompra   ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edPatrimonioQtdeCompra       ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edPatrimonioValorUnit        ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edPatrimonioDesconto         ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edPatrimonioFrete            ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edPatrimonioContaContabil    ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edPatrimonioTotal            ) ;
end;


procedure TfrmCOMPRAS_Pedido.DBCtrlGridServicosPaintPanel(
  DBCtrlGrid: TDBCtrlGrid; Index: Integer);
var
  LCtrlPanel : TCustomPanel ;
  LControlIdx : integer ;
begin

  if Odd( Index ) then
    DBCtrlGrid.Canvas.Brush.Color := clBtnFace
  else
    DBCtrlGrid.Canvas.Brush.Color := clWhite ;

  DBCtrlGrid.Canvas.FillRect ( Rect(0,0, DBCtrlGrid.Width, DBCtrlGrid.Height )  );

  LCtrlPanel := ServicoEditPanel ;

  if DBCtrlGrid.PanelIndex = Index then
   begin
     if LCtrlPanel.Top <> DBCtrlGrid.Top + DBCtrlGrid.PanelHeight * DBCtrlGrid.PanelIndex then
        LCtrlPanel.Top := DBCtrlGrid.Top + DBCtrlGrid.PanelHeight * DBCtrlGrid.PanelIndex ;
     if LCtrlPanel.Width <> DBCtrlGrid.PanelWidth then
        LCtrlPanel.Width := DBCtrlGrid.PanelWidth ;

     for LControlIdx := 0 to ServicoLayout0.ControlCount -1 do
         ServicoLayout0.Controls [ LControlIdx ].Width := ServicoLayout0.Width ;

     edServicoCodigo.Button.Visible := False ;
     edServicoCodigo.Button.Visible := True ;

     edServicoContaContabil.Button.Visible := False ;
     edServicoContaContabil.Button.Visible := True ;

     lblUnidadeServico.Left            := cbxServicoUnidadeCompra.Left   + 5 ;
     lblQtdeServico.Left               := edServicoQtdeCompra.Left       + 5 ;
     lblValorUnitarioServico.Left      := edServicoValorUnit.Left        + 5 ;
////     lblDescontoServico.Left           := edServicoDesconto.Left         + 5 ;
////     lblFreteServico.Left              := edServicoFrete.Left            + 5 ;
     lblTotalServico.Left              := edServicoTotal.Left            + 5 ;
     lblContaContabilServico.Left      := edServicoContaContabil.Left    + 5 ;

     exit ;
   end ;

  &Do ( DBCtrlGrid, LCtrlPanel, edServicoCodigo           ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, cbxServicoUnidadeCompra   ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edServicoQtdeCompra       ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edServicoValorUnit        ) ;
////  &Do ( DBCtrlGrid, LCtrlPanel, edServicoDesconto         ) ;
////  &Do ( DBCtrlGrid, LCtrlPanel, edServicoFrete            ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edServicoContaContabil    ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edServicoTotal            ) ;
end;

procedure TfrmCOMPRAS_Pedido.CheckReadOnlyFields;
var
 LReadOnly : boolean ;
 LParcelaBaixada : boolean ;
begin


  LParcelaBaixada := TdtmCOMPRAS_Pedido(DatamoduleBase).ParcelaBaixada ;
  LReadOnly := TdtmCOMPRAS_Pedido(DatamoduleBase).cdsPedidoIMPORTADO_NFE.asBoolean  ;

  dbNotaFiscal.ReadOnly   := LReadOnly ;
  dbSerie.ReadOnly        := LReadOnly ;
  dbDataCompra.ReadOnly   := LReadOnly ;
  dbDataEmissao.ReadOnly  := LReadOnly ;
  dbDataEntrada.ReadOnly  := LReadOnly ;
  edEntidade.ReadOnly     := LReadOnly ;
  dbcbStatus.ReadOnly     := LReadOnly ;
  dbImpostos.ReadOnly     := LReadOnly ;
  dbDescontos.ReadOnly    := LReadOnly ;
  dbFrete.ReadOnly        := LReadOnly ;
  dbChaveNFe.ReadOnly     := LReadOnly ;
(*
    cbxItemUnidadeEstoque: TDBLookupComboBox;
    edItemQtdeEstoque: TJvDBCalcEdit;
    edItemUnitarioEstoque: TJvDBCalcEdit;
    edItemContaContabil: TTcDBComboEdit;
*)
  CheckReadOnlyFieldItens ;

  if LReadOnly then
    lblAviso.Caption :=  '(*) Importado de NFe. Somente é possível alterar:'
                  +#13#10' - Quantidade de estoque'
                  +#13#10' - Conta contábil'
  else if LParcelaBaixada then
    lblAviso.Caption :=  '(*) Parcela(s) já baixada(s). Somente é possível alterar:'
                  +#13#10' - Quantidade de estoque'
                  +#13#10' - Conta contábil'
  else
     lblAviso.Caption := '' ;
end;

procedure TfrmCOMPRAS_Pedido.CheckReadOnlyFieldItens;
var
 LReadOnly : boolean ;
begin
  LReadOnly := TdtmCOMPRAS_Pedido(DatamoduleBase).cdsPedidoIMPORTADO_NFE.asBoolean  ;

  edItemCodigo.Enabled           := not LReadOnly ;
  cbxItemUnidadeCompra.Enabled   := not LReadOnly ;

  edItemQtdeCompra.ReadOnly      := LReadOnly ;
  edItemValorUnit.ReadOnly       := LReadOnly ;
  edItemDesconto.ReadOnly        := LReadOnly ;
  edItemFrete.ReadOnly           := LReadOnly ;
  cbxItemUnidadeEstoque.Enabled := not LReadOnly
                                 and TdtmCOMPRAS_Pedido(DatamoduleBase).cdsItensPedidoKEST_PRODUTO.isNull ;

  edItemUnitarioEstoque.ReadOnly := LReadOnly ;

  cbxItemUnidadeCompra.ReadOnly := LReadOnly ;
//  if LReadOnly then
//   cbxItemUnidadeCompra.Style := csSimple
//  else
//   cbxItemUnidadeCompra.Style := csDropDown ;

end;

procedure TfrmCOMPRAS_Pedido.CheckReadOnlyFieldPatrimonios;
var
 LReadOnly : boolean ;
begin
  LReadOnly := TdtmCOMPRAS_Pedido(DatamoduleBase).cdsPedidoIMPORTADO_NFE.asBoolean  ;

  edPatrimonioCodigo.Enabled           := not LReadOnly ;
  cbxPatrimonioUnidadeCompra.Enabled   := not LReadOnly ;

  edPatrimonioQtdeCompra.ReadOnly      := LReadOnly ;
  edPatrimonioValorUnit.ReadOnly       := LReadOnly ;
  edPatrimonioDesconto.ReadOnly        := LReadOnly ;
  edPatrimonioFrete.ReadOnly           := LReadOnly ;

  if LReadOnly then
   cbxPatrimonioUnidadeCompra.Style := csSimple
  else
   cbxPatrimonioUnidadeCompra.Style := csDropDown ;

end;


function TfrmCOMPRAS_Pedido.ParcelaBaixada : Boolean;
const SQL_PARCELAS = '';

var
  cds : TClientDataSet ;
  p : TParams ;
begin
  cds := nil;
  p := TParams.Create;

  p.CreateParam( ftString, 'TABLENAME', ptInput ).AsString := 'CMP_PEDIDOS';
  p.CreateParam( ftString, 'TABLEKEY' , ptInput ).AsString := TdtmCOMPRAS_Pedido(DatamoduleBase).cdsPedidoKCMP_PEDIDO.AsString  ;

  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( cds, SQL_PARCELAS, P);

  Result := cds.RecordCount > 0
end;

procedure TfrmCOMPRAS_Pedido.Pesquisar;
begin
  inherited;
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchPedidoCompra.Create() do
    try
      SetFiltro ( deDtInicial.Date, deDtFinal.Date, BoolToChar( not cbxInativos.Checked ) );
      TextToFind := _edtSearch.Text ;
      if Execute then
        begin
          cdsLstPedidos.Locate( 'KCMP_PEDIDO', Result.FieldByName( 'KCMP_PEDIDO' ).Value, [] ) ;
          ActiveFicha ;
        end ;
    finally
      free ;
    end ;
end;

procedure TfrmCOMPRAS_Pedido.ProcessSuccessInfo;
begin
// checkNS
//  NotificationService.NotifyStr( self, 'PROCESS_' + ClassName );
end;

procedure TfrmCOMPRAS_Pedido.RatearDesconto ;
begin
   TdtmCOMPRAS_Pedido( DatamoduleBase ).RatearDescontos ;
end;


function TfrmCOMPRAS_Pedido.CalcularValorPorReferecia(Total, Referencia,
  Valor: double ) : double ;
begin
  Result := Valor * ( Referencia / Total )
end;


procedure TfrmCOMPRAS_Pedido.RatearFrete;
begin
   TdtmCOMPRAS_Pedido( DatamoduleBase ).RatearFrete ;
end;

procedure TfrmCOMPRAS_Pedido.RatearImposto;
begin
   TdtmCOMPRAS_Pedido( DatamoduleBase ).RatearImpostos ;
end;

procedure TfrmCOMPRAS_Pedido.edCompradorButtonClick(Sender: TObject);
begin
  SearchComprador ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmCOMPRAS_Pedido.SearchContaBancaria(TextToSearch: string);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetConta( Result.FieldByName( 'KFIN_CONTA' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;

procedure TfrmCOMPRAS_Pedido.SearchContaBancariaTransporte(
  TextToSearch: string);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetContaTransporte( Result.FieldByName( 'KFIN_CONTA' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;

procedure TfrmCOMPRAS_Pedido.SearchContaPadrao(TextToSearch: string);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetContaPreferencia( Result.FieldByName( 'KFIN_CONTA' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;

procedure TfrmCOMPRAS_Pedido.SearchContaPadraoTransporte(TextToSearch: string);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetContaPreferenciaTransporte( Result.FieldByName( 'KFIN_CONTA' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;

procedure TfrmCOMPRAS_Pedido.SearchContato(TextToSearch: string);
//var
//   Key : integer ;
//   NomeContato, Depto, Email, Fone : string ;
begin
         {
    with TSearchContatoEntidade.Create do
       begin
          Params.CreateParam( ftInteger, 'KCAD_ENTIDADE', ptInput ).asInteger := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoKCAD_ENTIDADE.asInteger ;
          TextToFind := TextToSearch ;
          Execute ;
          Key := Result.FieldByName( 'KCAD_CONTATO' ).asInteger ;
          NomeContato := Result.FieldByName( 'NOME' ).asString ;
          Depto := Result.FieldByName( 'DEPTO' ).asString ;
          Email  := Result.FieldByName( 'EMAIL' ).asString ;
          Fone := Result.FieldByName( 'FONE1' ).asString ;
          free ;
       end ;

    if ( Key <= 0 ) then
       exit ;

    TdtmCOMPRAS_Pedido( DatamoduleBase ).SetContato ( Key, NomeContato, Depto, Email, Fone ) ;
          }
end;

procedure TfrmCOMPRAS_Pedido.SearchCFOP(ATextToSearch: string);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchCFOP.Create do
    try
      TextToFind := ATextToSearch ;
      if Execute then
        SetCFOP( Result.FieldByName( 'CFOP' ).asString, Result.FieldByName( 'DESCRICAO' ).asString ) ;
  finally
    free ;
  end ;
end;

procedure TfrmCOMPRAS_Pedido.SearchCFOP_ESTOQUE(ATextToSearch: string);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchCFOP.Create do
    try
      TextToFind := ATextToSearch ;
      if Execute then
        SetCFOP_ESTOQUE( Result.FieldByName( 'CFOP' ).asString, Result.FieldByName( 'DESCRICAO' ).asString ) ;
  finally
    free ;
  end ;
end;

procedure TfrmCOMPRAS_Pedido.SearchComprador(TextToSearch: string);
//var
//   Key : integer ;
//   NomeEntidade : string ;
begin
                         {
    with TSearchComprador.Create do
       begin
          TextToFind := TextToSearch ;
          Execute ;
          Key := Result.FieldByName( 'KCAD_ENTIDADE' ).asInteger ;
          NomeEntidade := Result.FieldByName( 'NOME' ).asString ;
          free ;
       end ;

    if ( Key <= 0 ) then
       exit ;

    TdtmCOMPRAS_Pedido( DatamoduleBase ).SetComprador ( Key, NomeEntidade ) ;
                          }
end ;

procedure TfrmCOMPRAS_Pedido.actPrintPedidoFolhaTimbradoExecute(Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
     TfqrCOMPRAS_Pedido.Preview( cdsLstPedidosKCMP_PEDIDO.asInteger, tfPapelTimbrado, False ) ;

end;

procedure TfrmCOMPRAS_Pedido.actPrintPedidoPapelBrancoExecute(
  Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
     TfqrCOMPRAS_Pedido.Preview( cdsLstPedidosKCMP_PEDIDO.asInteger, tfPapelBranco, True ) ;

end;

procedure TfrmCOMPRAS_Pedido.actPrintPedidoPorPeriodoExecute(Sender: TObject);
var
  RParams : ReportTypes.TReportParamsCOMPRAS_Periodo ;
begin
  RParams := TReportParamsCOMPRAS_Periodo.Create ;

  RParams.ReportTitle := 'Compras por período';
  RParams.StartDate   := deDtInicial.Date ;
  RParams.EndDate     := deDtFinal.Date ;

  TFin_ComprasPorPeriodoReport.ExecuteDialog( RParams );

  RParams.Free ;
end;

procedure TfrmCOMPRAS_Pedido.actPrintPedidoEmailExecute(Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
     TfqrCOMPRAS_Pedido.Preview( cdsLstPedidosKCMP_PEDIDO.asInteger, tfEstilizado, False ) ;
end;

procedure TfrmCOMPRAS_Pedido.actPrintPedidoMatricialExecute(
  Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
     TfqrCOMPRAS_Pedido.Preview( cdsLstPedidosKCMP_PEDIDO.asInteger, tfPapelBranco, False ) ;
end;

procedure TfrmCOMPRAS_Pedido.actPrintReciboExecute(Sender: TObject);
begin
//  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
//       TfqrCOMPRAS_Recibo.Preview(cdsLstPedidosKCMP_PEDIDO.asInteger);
end;



procedure TfrmCOMPRAS_Pedido.actRemoveItemProdutoExecute(Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
      if cdsItensPedido.IsEmpty then
        Exit;

      if not( cdsPedido.state in [dsInsert, dsEdit] ) then
        cdsItensPedido.Edit;

      cdsItensPedido.Delete;
    end;
end;

procedure TfrmCOMPRAS_Pedido.actRemoveItemProdutoUpdate(Sender: TObject);
begin
    actRemoveItemProduto.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoIMPORTADO_NFE.AsBoolean)
end;

procedure TfrmCOMPRAS_Pedido.actRemoveItemServicoExecute(Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
      if cdsServicosPedido.IsEmpty then
        Exit;

      if not( cdsServicosPedido.state in [dsInsert, dsEdit] ) then
        cdsServicosPedido.Edit;

      cdsServicosPedido.Delete;
    end;
end;

procedure TfrmCOMPRAS_Pedido.actRemoveItemServicoUpdate(Sender: TObject);
begin
    actRemoveItemServico.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoIMPORTADO_NFE.AsBoolean)
end;

procedure TfrmCOMPRAS_Pedido.actRemovePatrimonioExecute(Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
      if cdsPatrimoniosPedido.IsEmpty then
        Exit;

      if not( cdsPedido.state in [dsInsert, dsEdit] ) then
        cdsPatrimoniosPedido.Edit;

      ExcluiPatrimonio( cdsPatrimoniosPedidoKEST_PRODUTO.AsString );

      cdsPatrimoniosPedido.Delete;
    end;
end;

procedure TfrmCOMPRAS_Pedido.actRemovePatrimonioUpdate(Sender: TObject);
begin
    actRemovePatrimonio.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoIMPORTADO_NFE.AsBoolean)
end;

procedure TfrmCOMPRAS_Pedido.actSalvarXMLNFeExecute(Sender: TObject);
var
 LFileName : string ;
begin

 with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
      LFileName := 'NFe-' + cdsPedidoCHAVENFE.asString + '.xml' ;

  JvSaveDialog1.FileName := LFileName ;
  if JvSaveDialog1.Execute then
    begin
     if FileExists ( JvSaveDialog1.FileName ) then
       if not DeleteFile( JvSaveDialog1.FileName ) then
         Raise Fail.Create( 'Não foi possível salvar o arquivo. '
             +#13#10'Verifique se o arquivo está sendo utilizado por outro processo.' ) ;
     TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoXML_NFE.SaveToFile ( LFileName ) ;
     MessageDlg ( 'XML salvo em :' + JvSaveDialog1.FileName ) ;
    end;
end;



procedure TfrmCOMPRAS_Pedido.actSalvarXMLNFeUpdate(Sender: TObject);
begin
  actSalvarXMLNFe.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoXML_NFE.isNull) ;
end;

procedure TfrmCOMPRAS_Pedido.ApagaAnexos;
const
  SQL_ANEXOS = 'SELECT KGLB_ATTACHMENT, ' +
               'FROM GLB_ATTACHMENTS ' +
               'WHERE TABLENAME = :TABLENAME ' +
               '  AND TABLEKEY  = :TABLEKEY ';
//var
//  cds : TClientDataSet ;
//  p : TParams ;
begin
//  cds := nil;
//  p := TParams.Create;
//
//  p.CreateParam( ftString, 'TABLENAME', ptInput ).AsString := 'CMP_PEDIDOS';
//  p.CreateParam( ftString, 'TABLEKEY' , ptInput ).AsString := TdtmCOMPRAS_Pedido(DatamoduleBase).cdsPedidoKCMP_PEDIDO.AsString  ;
//
//  TTcAbstractDB.GetByAlias('DBANEXOS').populateClientDataSet( cds, SQL_ANEXOS, P);
//
//  if cds.RecordCount > 0 then
//    begin
//      cds.First;
//      cds.DisableControls;
//      while not( cds.Eof ) do
//        begin
//
//        end;
//      cds.EnableControls;
//    end;
end;


procedure TfrmCOMPRAS_Pedido.btbProgramarClick(Sender: TObject);
begin
  TdtmCOMPRAS_Pedido( DatamoduleBase ).CalcularParcelas(
     StrToIntDef( edtDia.Text, 1 ),
     StrToIntDef( edtParcelas.Text, 1 ),
     cbProximoMes.Checked,
     cbAnual.Checked )  ;
  dbgParcelasAPagar.SetFocus;
  dbgParcelasAPagar.SelectedIndex := 0 ;
end;

procedure TfrmCOMPRAS_Pedido.btnAdicionaParcelaClick(Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
      if not( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
        cdsParcelas.Edit;

      cdsParcelas.Append;
    end;
end;

procedure TfrmCOMPRAS_Pedido.btnAnexosClick(Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    TFIN_AnexosWizard.ExecuteWizard( 'CMP_PEDIDOS', cdsPedidoKCMP_PEDIDO.AsString );
end;

procedure TfrmCOMPRAS_Pedido.btnProgramarParcelasTransporteClick(
  Sender: TObject);
begin
  TdtmCOMPRAS_Pedido( DatamoduleBase ).CalcularParcelasTransporte(
    StrToIntDef( edtDiaParcelaTransporte.Text, 0 ),
    StrToInt( edtParcelasTransporte.Text ),
    cbProximoMesTransporte.Checked,
    cbAnualTransporte.Checked);

  dbgParcelasAPagarTransporte.SetFocus;
  dbgParcelasAPagarTransporte.SelectedIndex := 0 ;
end;

procedure TfrmCOMPRAS_Pedido.btnRemoveParcelaClick(Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
      if cdsParcelas.IsEmpty then
        Exit;

      if not( cdsParcelas.state in [dsInsert, dsEdit] ) then
         cdsParcelas.Edit ;

      cdsParcelas.Delete;
    end;
end;

procedure TfrmCOMPRAS_Pedido.btnAddPatrimonioClick(Sender: TObject);
var
  LPatrimonioInfo : TPatrimonioInfo ;
begin
  SvcEstoquePatrimonioCadastro.NovoCadastro( LPatrimonioInfo );
end;

procedure TfrmCOMPRAS_Pedido.btnAddProdutoClick(Sender: TObject);
var
  ProdutoInfo : TProdutoInfo ;
begin
  ProdutoInfo.TipoProduto := tpProduto ;
  SvcEstoqueProdutosCadastro.NovoCadastro( ProdutoInfo );
end;

procedure TfrmCOMPRAS_Pedido.btnAddServicoClick(Sender: TObject);
var
  ProdutoInfo : TProdutoInfo ;
begin
  ProdutoInfo.TipoProduto := tpServico ;
  SvcEstoqueProdutosCadastro.NovoCadastro( ProdutoInfo );
end;


procedure TfrmCOMPRAS_Pedido.cbxInativosClick(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create ( ChangeFilter ) ;
end;

procedure TfrmCOMPRAS_Pedido.ChangeFilter;
begin
  TdtmCOMPRAS_Pedido( DatamoduleBase ).SetFilter( cbxInativos.Checked, deDtInicial.Date, deDtFinal.Date );
end;


procedure TfrmCOMPRAS_Pedido.edPatrimonioCodigoButtonClick(Sender: TObject);
var
   LPatrimonio  : TPatrimonioInfo;
begin
  if edPatrimonioCodigo.Text = '' then
    begin
       //LKPatrimonio := SvcEstoquePatrimonioCadastro.Execute ;
      LPatrimonio.DataCompra := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoDATA_COMPRA.AsDateTime;
      LPatrimonio.Valor := 0;

      SvcEstoquePatrimonioCadastro.NovoCadastro( LPatrimonio );
      if LPatrimonio.KCAD_PATRIMONIO <> '' then
         TdtmCOMPRAS_Pedido( DatamoduleBase ).CadastraPatrimonio( LPatrimonio ) ;
    end ;
  edPatrimonioCodigo.SelectAll;
end;

procedure TfrmCOMPRAS_Pedido.edPatrimonioCodigoEnter(Sender: TObject);
var
   LPatrimonio  : TPatrimonioInfo;
begin
  if edPatrimonioCodigo.Text = '' then
    begin
       //LKPatrimonio := SvcEstoquePatrimonioCadastro.Execute ;
      LPatrimonio.DataCompra := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoDATA_COMPRA.AsDateTime;
      SvcEstoquePatrimonioCadastro.NovoCadastro( LPatrimonio );
      if LPatrimonio.KCAD_PATRIMONIO <> '' then
         TdtmCOMPRAS_Pedido( DatamoduleBase ).CadastraPatrimonio( LPatrimonio ) ;
    end ;
  edPatrimonioCodigo.SelectAll;
end;

procedure TfrmCOMPRAS_Pedido.edItemContaContabilButtonClick(Sender: TObject);
var
  LAPRD : TTiposPlanoAPRD ;
  LPlanoFiter : TPlanoFilter ;
begin

//  if TdtmCOMPRAS_Pedido( DatamoduleBase ).ItemControlaEstoque then
//   LPlanoFiter := pfAll
//  else
//   LPlanoFiter := pfNaoPermiteEstoque ;

  LPlanoFiter := pfAll ;

  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
         LAPRD := [ tpAtivo, tpDespesas,
                    tpPassivo ] ;

       TdtmCOMPRAS_Pedido( DatamoduleBase ).PostItem ;
       SvcFinanceiroApropriacaoEdit.ExecuteTela( 'CMP_PEDIDO_ITENS',
                                           cdsItensPedido,
                                           cdsApropriacaoItem,
                                           TelaProduto,
                                           LAPRD,
                                           LPlanoFiter );
       TdtmCOMPRAS_Pedido( DatamoduleBase ).EditItem ;
    end;
end;





procedure TfrmCOMPRAS_Pedido.edPatrimonioContaContabilButtonClick(
  Sender: TObject);
var
  LAPRD : TTiposPlanoAPRD ;
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
         LAPRD := [ tpAtivo ] ;

       TdtmCOMPRAS_Pedido( DatamoduleBase ).PostPatrimonio  ;
       SvcFinanceiroApropriacaoEdit.ExecuteTela( 'CMP_PEDIDO_ITENS',
                                           cdsPatrimoniosPedido,
                                           cdsApropriacaoPatrimonio,
                                           TelaProduto,
                                           LAPRD,
                                           pfAll {pfNaoPermiteEstoque} );
       TdtmCOMPRAS_Pedido( DatamoduleBase ).EditPatrimonio ;
    end;
end;

procedure TfrmCOMPRAS_Pedido.edServicoCodigoButtonClick(Sender: TObject);
//var
//   LServico  : TServicoInfo;
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    begin
      showMessage('readonly');
      exit ;
    end;

  SearchServico (
    StringReplace(
        TTcDBComboEdit ( Sender ).Text
     ,  TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsServicosPedidoCODIGO.asString  + ' - '
     ,  ''
     , [ rfIgnoreCase ]
    )
  ) ;

  edServicoCodigo.SelectAll;
end;

procedure TfrmCOMPRAS_Pedido.edServicoCodigoEnter(Sender: TObject);
//ar
//  LServico  : TServicoInfo;
begin
  if edServicoCodigo.Text = '' then
    begin
       //LKServico := SvcEstoqueServicoCadastro.Execute ;
//     LServico.DataCompra := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoDATA_COMPRA.AsDateTime;
//     SvcEstoqueServicoCadastro.NovoCadastro( LServico );
//     if LServico.KCAD_Servico <> '' then
//        TdtmCOMPRAS_Pedido( DatamoduleBase ).CadastraServico( LServico ) ;
    end ;
  edServicoCodigo.SelectAll;
end;

procedure TfrmCOMPRAS_Pedido.edServicoContaContabilButtonClick(Sender: TObject);
var
  LAPRD : TTiposPlanoAPRD ;
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
         LAPRD := [ tpDespesas ] ;


         TdtmCOMPRAS_Pedido( DatamoduleBase ).PostServico;
         SvcFinanceiroApropriacaoEdit.ExecuteTela( 'CMP_PEDIDO_SERVICOS',
                                              cdsServicosPedido,
                                              cdsApropriacaoServico,
                                              TelaProduto,
                                              LAPRD,
                                              pfAll {pfNaoPermiteEstoque} );

       TdtmCOMPRAS_Pedido( DatamoduleBase ).EditServico ;
    end;
end;

procedure TfrmCOMPRAS_Pedido.deDtFinalExit(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create ( ChangeFilter ) ;
end;

procedure TfrmCOMPRAS_Pedido.deDtInicialExit(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create ( ChangeFilter ) ;
end;


procedure TfrmCOMPRAS_Pedido.dtsFichaDataChange(Sender: TObject; Field: TField);
begin
  if not Assigned ( TdtmCOMPRAS_Pedido( DatamoduleBase ) ) then
     exit ;

//  try

    if not Assigned ( Field ) then
       CheckReadOnlyFields ;

    if not Assigned ( Field )
      or (Field = TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoKCAD_ENTIDADE) then
       begin
         Image1.Picture := nil ;
         if not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoKCAD_ENTIDADE.isNull then
           begin
              edEntidade.Font.Color := clNavy ;
              Image1.Hint := 'Fornecedor associado ao cadastro.'  ;
              ImageList1.GetBitmap( 0, Image1.Picture.Bitmap )
           end
         else
           begin
              edEntidade.Font.Color := clRed ;
              Image1.Hint := 'Fornecedor não associado ao cadastro.'
                      +#13#10'Efetue a pesquisa.'  ;
              ImageList1.GetBitmap( 2, Image1.Picture.Bitmap ) ;
           end;
       end;


     if (not Assigned ( Field )) or( Field.FieldName = 'FRETE' ) then
      begin
      // groupbox
//      pnlTransporte.AutoSize := (TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoFRETE.asFloat > 0)
//                             or (not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsAPagarTransporte.isEmpty)
//                             or (not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsParcelasTransporte.isEmpty) ;
//      pnlTransporte.Height := 22 ;
      end;
//  except On E : Exception do
//    RaiseException ( E, ClassName, UnitName, 'dtsFichaDataChange' ) ;
//  end;
end;

procedure TfrmCOMPRAS_Pedido.btbPanelSaveCancelClick(Sender: TObject);
begin
  TdtmCOMPRAS_Pedido( DatamoduleBase ).ClearItemControlaEstoque ;
  PopuperSelecionarUnidadeEstoque.ModalResult := mrCancel ;
end;

procedure TfrmCOMPRAS_Pedido.btbPanelSaveOkClick(Sender: TObject);
begin
   if VarIsNull( dblcUnidadeControlaEstoque.KeyValue ) then
     exit ;

  TdtmCOMPRAS_Pedido( DatamoduleBase ).SetItemControlaEstoque ;
  PopuperSelecionarUnidadeEstoque.ModalResult := mrOK ;
end;

procedure TfrmCOMPRAS_Pedido.ProdutoNaoVinculado ;
begin
  ShowMessage (
            'Produto não vinculado ao cadastro.'
     +#13#10'Não é possível apropriar para o estoque.'
  ) ;

  TdtmCOMPRAS_Pedido( DatamoduleBase ).ClearItemControlaEstoque ;
end;

procedure TfrmCOMPRAS_Pedido.QueryControlaEstoque ;
begin
  if MessageDlg (
            'Este produto não é controlado em estoque.'
     +#13#10'Deseja inciar o controle de estoque ?', mtConfirmation ) <> mrYes then
  begin
    TdtmCOMPRAS_Pedido( DatamoduleBase ).ClearItemControlaEstoque ;
    exit ;
  end;

  if TdtmCOMPRAS_Pedido( DatamoduleBase ).ItemHasUnidadeEstoque then
     TdtmCOMPRAS_Pedido( DatamoduleBase ).SetItemControlaEstoque
  else
     PopuperSelecionarUnidadeEstoque.Execute ;

end;

procedure TfrmCOMPRAS_Pedido.dtsItensPedidoDataChange(Sender: TObject;
  Field: TField);
var
  LHasUnidadeEstoque : boolean ;
begin
  if not Assigned( TdtmCOMPRAS_Pedido( DatamoduleBase ) ) then
    exit ;

  if  Assigned ( Field ) then
    begin

     if     ( Field = TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedidoKFIN_PLANOCONTA )
        and ( TdtmCOMPRAS_Pedido( DatamoduleBase ).PlanoItemEstoque )
        and ( not TdtmCOMPRAS_Pedido( DatamoduleBase ).ItemControlaEstoque ) then
         begin
            if ( TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedidoKEST_PRODUTO.AsString = '' ) then
              ThreadSuppl.TSyncThread.Create( ProdutoNaoVinculado )
            else
              ThreadSuppl.TSyncThread.Create( QueryControlaEstoque ) ;
         end;
     exit ;
    end;

  if TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedido.IsEmpty then
     tbsProdutos.Caption := 'Produtos'
  else if TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedido.State = dsInsert then
    tbsProdutos.Caption :=
      Format ( 'Produtos (%d/%d)',
       [
         TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedido.RecordCount + 1
       , TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedido.RecordCount + 1
       ]
      )
  else
    tbsProdutos.Caption :=
      Format ( 'Produtos (%d/%d)',
       [
         TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedido.Recno
       , TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedido.RecordCount
       ]
      ) ;

end;

procedure TfrmCOMPRAS_Pedido.dtsPatrimoniosPedidoDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned( TdtmCOMPRAS_Pedido( DatamoduleBase ) )
    or Assigned ( Field ) then
     exit ;

  if TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.IsEmpty then
     tbsPatrimonios.Caption := 'Patrimônios'
  else if TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.State = dsInsert then
    tbsPatrimonios.Caption :=
      Format ( 'Patrimônios (%d/%d)',
       [
         TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.RecordCount + 1
       , TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.RecordCount + 1
       ]
      )
  else
    tbsPatrimonios.Caption :=
      Format ( 'Patrimônios (%d/%d)',
       [
         TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.Recno
       , TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.RecordCount
       ]
      ) ;
end;

procedure TfrmCOMPRAS_Pedido.dtsServicosDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned( TdtmCOMPRAS_Pedido( DatamoduleBase ) )
    or Assigned ( Field ) then
     exit ;

  if TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsServicosPedido.IsEmpty then
     tbsServicos.Caption := 'Serviços'
  else if TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsServicosPedido.State = dsInsert then
    tbsServicos.Caption :=
      Format ( 'Serviços (%d/%d)',
       [
         TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsServicosPedido.RecordCount + 1
       , TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsServicosPedido.RecordCount + 1
       ]
      )
  else
    tbsServicos.Caption :=
      Format ( 'Serviços (%d/%d)',
       [
         TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsServicosPedido.Recno
       , TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsServicosPedido.RecordCount
       ]
      ) ;
end;

procedure TfrmCOMPRAS_Pedido.SearchServico(TextToSearch: string);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ), TSearchServicoAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        insereServico( Result.FieldByName( 'KEST_PRODUTO' ).asString,
                       Result.FieldByName( 'CODIGO' ).asString,
                       Result.FieldByName( 'NOME' ).asString,
                       Result.FieldByName( 'UNIDADE' ).AsString,
                       Result.FieldByName( 'CUSTO_MEDIO' ).asCurrency,
                       Result.FieldByName( 'KFIN_PLANOCONTA'  ).asString,
                       Result.FieldByName( 'DESCR_PLANOCONTA' ).asString ) ;
    finally
      free ;
    end ;
end ;


procedure TfrmCOMPRAS_Pedido.ServicoEditPanelResize(Sender: TObject);
var
 LRows : integer ;
begin
  LRows := (DBCtrlGridServicos.Parent.ClientHeight - DBCtrlGridServicos.Top) div TCustomPanel(Sender).Height ;
  DBCtrlGridServicos.Height   := LRows * TCustomPanel(Sender).Height ;
  DBCtrlGridServicos.RowCount := LRows ;
  DBCtrlGridServicos.PanelHeight := TCustomPanel(Sender).Height ;
end;

procedure TfrmCOMPRAS_Pedido.SetValidApropriacao(const Value: Boolean);
begin
  FValidApropriacao := Value;
  if Assigned ( TdtmCOMPRAS_Pedido( DatamoduleBase ) ) then
    TdtmCOMPRAS_Pedido( DatamoduleBase ).ValidApropriacao :=  FValidApropriacao;

end;

procedure TfrmCOMPRAS_Pedido.btnRatearDescontoClick(Sender: TObject);
begin
  RatearDesconto ;
end;

procedure TfrmCOMPRAS_Pedido.btnRatearFreteClick(Sender: TObject);
begin
  RatearFrete ;
end;

procedure TfrmCOMPRAS_Pedido.btnRatearImpostoClick(Sender: TObject);
begin
  RatearImposto ;
end;

procedure TfrmCOMPRAS_Pedido.edItemCFOPButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  SearchCFOP ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmCOMPRAS_Pedido.edItemCFOP_ESTOQUEButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  SearchCFOP_ESTOQUE ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmCOMPRAS_Pedido.edItemCodigoButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    begin
      showMessage('readonly');
      exit ;
    end;

  SearchProduto (
    StringReplace(
        TTcDBComboEdit ( Sender ).Text
     ,  TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedidoCODIGO.asString  + ' - '
     ,  ''
     , [ rfIgnoreCase ]
    )
  ) ;
end;

procedure TfrmCOMPRAS_Pedido.TcGDIButton4Click(Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
      if not( cdsParcelasTransporte.State in [ dsInsert, dsEdit ] ) then
        cdsParcelasTransporte.Edit;

      cdsParcelasTransporte.Append;
    end;
end;

procedure TfrmCOMPRAS_Pedido.TcGDIButton6Click(Sender: TObject);
begin
  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
    begin
      if cdsParcelasTransporte.IsEmpty then
        Exit;

      if not( cdsParcelasTransporte.state in [dsInsert, dsEdit] ) then
         cdsParcelasTransporte.Edit ;

      cdsParcelasTransporte.Delete;
    end;
end;

procedure TfrmCOMPRAS_Pedido._actDeleteExecute(Sender: TObject);
begin
//  ApagaAnexos;
//  with TdtmCOMPRAS_Pedido(DatamoduleBase) do
//    TFIN_AnexosWizard.DeletaAnexos( 'CMP_PEDIDOS', cdsPedidoKCMP_PEDIDO.AsString );

//  if not ParcelaBaixada then

    inherited;
end;

procedure TfrmCOMPRAS_Pedido._actEditExecute(Sender: TObject);
begin
  inherited;
  btnAnexos.Enabled := True ;
  ExibeCamposCheque;
end;

procedure TfrmCOMPRAS_Pedido._actNewExecute(Sender: TObject);
begin
  try
   inherited;
  except
   // Volts é fda.
   inherited;
  end;
  PageControl1.ActivePageIndex := 0 ;
  btnAnexos.Enabled := False ;
  ExibeCamposCheque;
end;

procedure TfrmCOMPRAS_Pedido._actSaveExecute(Sender: TObject);
begin
  //ShowMessage( screen.ActiveControl.Name ) ;

  TdtmCOMPRAS_Pedido( DatamoduleBase ).CheckValorAPagar ;


//  ProcessSuccessInfo ;
  inherited;

  btnAnexos.Enabled := True ;
  ModalResult := mrOk;
end;

procedure TfrmCOMPRAS_Pedido._dbgListaDblClick(Sender: TObject);
begin
  inherited;
  btnAnexos.Enabled := True ;
///////  TdtmCOMPRAS_Pedido( DatamoduleBase ).CalculaTotais ;
end;

procedure TfrmCOMPRAS_Pedido.actAddItemProdutoExecute(Sender: TObject);
begin
  if not( dtsItensPedido.DataSet.State in [ dsInsert, dsEdit ] ) then
    dtsItensPedido.DataSet.Edit ;

  dtsItensPedido.DataSet.Append ;
  edItemCodigo.SetFocus ;
end;

procedure TfrmCOMPRAS_Pedido.actAddItemProdutoUpdate(Sender: TObject);
begin
    actAddItemProduto.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoIMPORTADO_NFE.AsBoolean) ;
end;

procedure TfrmCOMPRAS_Pedido.actAddItemServicoExecute(Sender: TObject);
begin
  if not( dtsServicos.DataSet.State in [ dsInsert, dsEdit ] ) then
    dtsServicos.DataSet.Edit ;

  dtsServicos.DataSet.Append ;
  edServicoCodigo.SetFocus ;
end;

procedure TfrmCOMPRAS_Pedido.actAddItemServicoUpdate(Sender: TObject);
begin
    actAddItemServico.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoIMPORTADO_NFE.AsBoolean)
end;

procedure TfrmCOMPRAS_Pedido.actAddPatrimonioExecute(Sender: TObject);
begin
  if not( dtsPatrimoniosPedido.DataSet.State in [ dsInsert, dsEdit ] ) then
    dtsPatrimoniosPedido.DataSet.Edit ;

  dtsPatrimoniosPedido.DataSet.Append ;
  edPatrimonioCodigo.SetFocus ;
end;

procedure TfrmCOMPRAS_Pedido.actAddPatrimonioUpdate(Sender: TObject);
begin
    actAddPatrimonio.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoIMPORTADO_NFE.AsBoolean) ;
end;

procedure TfrmCOMPRAS_Pedido.actCopiarPedidoExecute(Sender: TObject);
begin
//  with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
//     if MessageDlg ( 'Deseja gerar uma cópia do pedido: #%s.', [cdsLstPedidosCODIGO.asString], mtConfirmation, [mbYes, mbNo] ) <> mrYes then
//        exit ;

  self.ActiveFicha ;

  TdtmCOMPRAS_Pedido( DatamoduleBase ).ClonePedido ;
end;

procedure TfrmCOMPRAS_Pedido.actExpandItensExecute(Sender: TObject);
begin
//  ItemEditPanel.Height := 36 ;
  case ItemEditPanel.Height of
    36 :
       begin
          ItemEditPanel.Height := 72 ;
          ItemLayout1.Visible := True ;
          btnExpandItens.Caption := '<' ;
          btnExpandItens.Hint := 'Reduzir informações dos itens' ;
       end;
    72 :
       begin
          ItemEditPanel.Height := 36 ;
          ItemLayout1.Visible := False ;
          btnExpandItens.Caption := '>' ;
          btnExpandItens.Hint := 'Expandir informações dos itens' ;
       end;
  end;
end;

procedure TfrmCOMPRAS_Pedido.actImportarNFeExecute(Sender: TObject);
var
  LNFeInfo : TNFeInfo ;
  LOK : boolean ;
begin
//  ShowMessage( Screen.FormCount.ToString ) ;

  LOK := TfrmImportNFeCompra.Execute ( LNFeInfo ) ;

  if LNFeInfo.KFornecedor <> '' then
     TdtmCOMPRAS_Pedido( DatamoduleBase ).SaveProdutosFornecedor(
          LNFeInfo.KFornecedor
        , LNFeInfo.Produtos  ) ;

  if LOK then
     TdtmCOMPRAS_Pedido( DatamoduleBase ).InsereFromNFe( LNFeInfo );

end;

procedure TfrmCOMPRAS_Pedido.actImportarNFeUpdate(Sender: TObject);
begin

    actImportarNFe.Enabled := Assigned ( DatamoduleBase )
                    and  (TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedido.State in [dsInsert,dsEdit])
                    and  (    TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedido.Bof
                          and TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsItensPedido.Eof ) ;

//  actPrintComprasPeriodo.Enabled := LoggedUser.KUser <= 1 ;
end;

procedure TfrmCOMPRAS_Pedido.actImportarOrcamentoExecute(Sender: TObject);
begin
//  if TfrmCOMPRAS_ImportaOrcamento.Execute ( TdtmCOMPRAS_Pedido( DatamoduleBase ) ) then
//     self.ActiveFicha ;
end;

type
   TPreviewDANFe = procedure ( AKey : PChar ) ; stdcall ;

procedure TfrmCOMPRAS_Pedido.actVisualizarDANFeExecute(Sender: TObject);
var
 L : THandle ;
 LPreviewDANFe : TPreviewDANFe ;
 LFileName : string ;
begin
(*
 L := LoadLibrary('TCDANFeDLL.dll') ;
 if L = 0 then
   exit;

 with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
   begin
      LFileName := TcTempFolderFactory.TempPath + cdsPedidoCHAVENFE.asString + '.xml' ;
      cdsPedidoXML_NFE.SaveToFile ( LFileName ) ;
   end ;

 LPreviewDANFe := GetProcAddress( L, 'PreviewDANFe');
 LPreviewDANFe( PChar( LFileName ) );
 FreeLibrary( L ) ;
*)

 with TdtmCOMPRAS_Pedido( DatamoduleBase ) do
   begin
      LFileName := TcTempFolderFactory.TempPath + cdsPedidoCHAVENFE.asString + '.xml' ;
      cdsPedidoXML_NFE.SaveToFile ( LFileName ) ;
   end ;

 DANFeQR.TfqrDANFeQR.PrintFromFile( LFileName );
end;

procedure TfrmCOMPRAS_Pedido.actVisualizarDANFeUpdate(Sender: TObject);
begin
  actVisualizarDANFe.Enabled := Assigned ( DatamoduleBase )
                    and (TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoMODELO_NFE.asInteger = 55)
                    and  (not TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoXML_NFE.isNull) ;
end;

procedure TfrmCOMPRAS_Pedido.actPrintComprasCentroCustoExecute( Sender: TObject);
var
  RParams : ReportTypes.TReportParamsCOMPRAS_Periodo ;
begin
  RParams := TReportParamsCOMPRAS_Periodo.Create ;
  RParams.StartDate   := deDtInicial.Date ;
  RParams.EndDate     := deDtFinal.Date ;
  RParams.ReportTitle := 'Notas fiscais de compra por centro de custo';
  TFin_ComprasPorCentroCustoReport.ExecuteDialog( RParams );
  RParams.Free ;
end;

procedure TfrmCOMPRAS_Pedido.actPrintComprasCentroCustoUpdate(Sender: TObject);
begin
//  actPrintComprasPeriodo.Enabled := LoggedUser.KUser <= 1 ;
end;


{ SvcEstoqueEntradaDadosComprasFactory }
function SvcEstoqueEntradaDadosComprasFactory.Execute(AKCMP_PEDIDO : string; AValidApropriacao: Boolean = True) : string  ;
var ThisForm : TfrmCOMPRAS_Pedido;
begin
   {TfrmCOMPRAS_Pedido.KCMP_PEDIDO := AKCMP_PEDIDO ;
   with TfrmCOMPRAS_Pedido.Create ( nil ) do
     try
       BorderStyle := bsToolWindow ;
       ShowModal ;
     finally
       Free ;
     end;}
   ThisForm.KCMP_PEDIDO := AKCMP_PEDIDO ;
   ThisForm := TfrmCOMPRAS_Pedido.Create ( nil );
   try
     ThisForm.BorderStyle := bsToolWindow ;
     ThisForm.OnShow := ThisForm.OnShowModal;
     ThisForm.ValidApropriacao  := AValidApropriacao;
     ThisForm.ShowModal ;
     if ThisForm.ModalResult = mrOk then
       Result := 'T'
     else
       Result := 'F';
   finally
     ThisForm.Free ;
   end;
end;



{ TPanel }

function GetShiftState: TShiftState;
begin
  Result := [];
  if GetKeyState(VK_SHIFT) < 0 then Include(Result, ssShift);
  if GetKeyState(VK_CONTROL) < 0 then Include(Result, ssCtrl);
  if GetKeyState(VK_MENU) < 0 then Include(Result, ssAlt);
end;


procedure TPanel.CMChildKey(var Message: TCMChildKey);
var
  ShiftState: TShiftState;
  GridKey: TDBCtrlGridKey;
begin
  if not Assigned ( FDBCtrlGrid  ) then
    begin
       inherited ;
       exit ;
    end;

  with Message do
    if Sender <> Self then
    begin
      ShiftState := GetShiftState;
      if Assigned(OnKeyDown) then OnKeyDown(Sender, CharCode, ShiftState);
      GridKey := gkNull;
      case CharCode of
        VK_UP   :  GridKey := gkUp ;
        VK_DOWN :  GridKey := gkDown ;
        VK_ESCAPE: GridKey := gkCancel ;
        VK_F2: GridKey := gkEditMode;
      end;
      if GridKey <> gkNull then
      begin
        FDBCtrlGrid.DoKey(GridKey);
        Result := 1;
        Exit;
      end;
    end;
  inherited;
end;

initialization
  RegisterClass ( TfrmCOMPRAS_Pedido ) ;
  SvcEstoqueEntradaDadosCompras := SvcEstoqueEntradaDadosComprasFactory.Create ;

finalization
  SvcEstoqueEntradaDadosCompras := nil ;

end.
