unit UfrmDEVOLUCOES_Pedido3;

// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Lançamentos
// Funcionality : Devolucoes
//                com ou sem nota fiscal
// License      : veja readme.txt



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
  Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.FloatPanel, System.ImageList, Vcl.DBCGrids,
  Tc.RTL.Folders,
  Vcl.Dialogs, JvDialogs, JvDBCheckBox, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, uImageListProvider, SysFormListaFicha,
  Tc.VCL.FormIntf,
  Wrappers ;

type

  TPanel = class ( Vcl.ExtCtrls.TPanel )
    FDBCtrlGrid : TDBCtrlGrid ;
    procedure CMChildKey(var Message: TCMChildKey); message CM_CHILDKEY;
  end;

   TfrmDEVOLUCOES_Pedido = class( T_FormListaFicha )
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
    dtsAReceber: TDataSource;
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
    cbxItemUnidadeCompra: TDBComboBox;
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
    Label10: TLabel;
    DBText2: TDBText;
    Button2: TTcGDIButton;
    pnlTotalItens: TPanel;
    Label8: TLabel;
    DBText3: TDBText;
    Button3: TTcGDIButton;
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
    GroupBox2: TGroupBox;
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
    lblDescontoServico: TLabel;
    lblFreteServico: TLabel;
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
    procedure Button1Click(Sender: TObject);
    procedure cbxInativosClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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


    procedure dtsParcelasDataChange(Sender: TObject; Field: TField);
    procedure btnRatearDescontoClick(Sender: TObject);
    procedure btnRatearFreteClick(Sender: TObject);
    procedure btnRatearImpostoClick(Sender: TObject);
    procedure dtsParcelasTransporteDataChange(Sender: TObject; Field: TField);
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

    procedure PatrimonioLayout0Resize(Sender: TObject);
    procedure edPatrimonioContaContabilButtonClick(Sender: TObject);

    procedure DBCtrlGridServicosPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure edServicoCodigoEnter(Sender: TObject);
    procedure edServicoCodigoButtonClick(Sender: TObject);
    procedure ServicoLayout0Resize(Sender: TObject);
    procedure edServicoContaContabilButtonClick(Sender: TObject);

    procedure deDtInicialExit(Sender: TObject);
    procedure deDtFinalExit(Sender: TObject);
    procedure ItemEditPanelResize(Sender: TObject);
    procedure PatrimonioEditPanelResize(Sender: TObject);
    procedure ServicoEditPanelResize(Sender: TObject);
  protected
    function  QueryAllowedDataActions: TTcDataActions; override ;
    function QueryActiveDataActions : TTcDataActions ; override ;
  private
    { Private declarations }

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

  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
  public
    { Public declarations }
    class var KDEV_PEDIDO : string ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses   Tc.DBRTL.AbstractDB
     , UdtmDEVOLUCOES_Pedido3
     , SearchsFinanceiro
     {,  UfrmDEVOLUCOES_Pedido_ImportaOrcamento}
//     , UfqrCOMPRAS_Pedido
     , UApplResources
     , ThreadSuppl
     , DateUtils
//     , UFin_ComprasPorPeriodoReport
     , UFIN_AnexosWizard
     , Tc.RTL.Exceptions
     , UDBAnexos, UDBFinanceiro
//     , UfrmImportNFeCompra
     , CLAg5SvcEstoqueProdutos
     , CLAg5SvcEstoqueEntradaDadosDevolucoes
     , CLAg5SvcEstoquePatrimonio
     , CLAg5SvcFinanceiroApropriacao
     , TypInfo
     , DANFeQR ;


const TipoProduto = 1;
      TipoServico = 3;

{$R *.dfm}

type
  SvcEstoqueEntradaDadosDevolucoesFactory = class( TInterfacedObject, ISvcEstoqueEntradaDadosDevolucoes )
    function Execute(AKDEV_PEDIDO : string) : string  ;
  end;


function TfrmDEVOLUCOES_Pedido.QueryActiveDataActions: TTcDataActions;
begin
   Result := [] ;
end;

function TfrmDEVOLUCOES_Pedido.QueryAllowedDataActions: TTcDataActions;
begin
   Result := [] ;
end;

procedure TfrmDEVOLUCOES_Pedido.DBCheckBox1Change(Sender: TObject);
begin
  ExibeCamposCheque;
end;

procedure TfrmDEVOLUCOES_Pedido.dbcbKeyDown(Sender: TObject;
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

procedure TfrmDEVOLUCOES_Pedido.dbContaBancariaButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  SearchContaPadrao( dbContaBancaria.Text );
end;


procedure TfrmDEVOLUCOES_Pedido.dbgParcelasAPagarEditButtonClick(Sender: TObject);
begin
  with dbgParcelasAPagar, TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    if ( SelectedField = cdsParcelasNOMECONTA ) then
      SearchContaBancaria( InplaceEditor.Text );
end;

procedure TfrmDEVOLUCOES_Pedido.dbgParcelasAPagarKeyPress(Sender: TObject; var Key: Char);
begin
  with dbgParcelasAPagar, TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
      if ( Key = #13 ) and Assigned( InplaceEditor ) and ( InplaceEditor.Visible ) then
        begin
          Key := #0;
          if ( SelectedField = cdsParcelasNOMECONTA ) then
            SearchContaBancaria( InplaceEditor.Text );
        end;
    end;
end;

procedure TfrmDEVOLUCOES_Pedido.dbgParcelasAPagarTransporteEditButtonClick(
  Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  with dbgParcelasAPagarTransporte, TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    if ( SelectedField = cdsParcelasTransporteNOMECONTA ) then
      SearchContaBancariaTransporte( InplaceEditor.Text );
end;

procedure TfrmDEVOLUCOES_Pedido.dbgParcelasAPagarTransporteKeyPress(
  Sender: TObject; var Key: Char);
begin
  with dbgParcelasAPagarTransporte, TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
      if ( Key = #13 ) and Assigned( InplaceEditor ) and ( InplaceEditor.Visible ) then
        begin
          Key := #0;
          if ( SelectedField = cdsParcelasTransporteNOMECONTA ) then
            SearchContaBancariaTransporte( InplaceEditor.Text );
        end;
    end;
end;

procedure TfrmDEVOLUCOES_Pedido.SearchEntidade(TextToSearch: string);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchFornecedorAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        SetEntidade( Result.FieldByName( 'KCAD_ENTIDADE' ).asString, Result.FieldByName( 'NOME' ).asString ) ;
  finally
    free ;
  end ;
end ;

procedure TfrmDEVOLUCOES_Pedido.SearchEntidadeTransporte(TextToSearch: string);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchFornecedorAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        SetEntidadeTransporte( Result.FieldByName( 'KCAD_ENTIDADE' ).asString, Result.FieldByName( 'NOME' ).asString ) ;
  finally
    free ;
  end ;
end ;

procedure TfrmDEVOLUCOES_Pedido.SearchProduto(TextToSearch: string);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchProdutoInsumoAtivo.Create do
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

procedure TfrmDEVOLUCOES_Pedido.SearchPatrimonio(TextToSearch: string);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchPatrimonioAtivo.Create do
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

procedure TfrmDEVOLUCOES_Pedido.edEntidadeButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  SearchEntidade ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmDEVOLUCOES_Pedido.edEntidadeChange(Sender: TObject);
begin
  if not Assigned( TdtmDEVOLUCOES_Pedido( DatamoduleBase ) ) then
     exit ;

  if ( edEntidade.Text <> TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoNOMEENTIDADE.asString )
  and not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoKCAD_ENTIDADE.isNull then
  TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoKCAD_ENTIDADE.Clear ;
end;

procedure TfrmDEVOLUCOES_Pedido.edTransportadoraButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  SearchEntidadeTransporte ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmDEVOLUCOES_Pedido.ExibeCamposCheque;
begin
  dbcheckComCheque.Visible := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsAReceberPAGTO_AVISTA.AsBoolean;
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

procedure TfrmDEVOLUCOES_Pedido.ItemEditPanelResize(Sender: TObject);
var
 LRows : integer ;
begin
  LRows := (DBCtrlGridItems.Parent.ClientHeight - DBCtrlGridItems.Top) div TCustomPanel(Sender).Height ;
  DBCtrlGridItems.Height   := LRows * TCustomPanel(Sender).Height ;
  DBCtrlGridItems.RowCount := LRows ;
  DBCtrlGridItems.PanelHeight := TCustomPanel(Sender).Height ;
end;

procedure TfrmDEVOLUCOES_Pedido.LayoutEnter(Sender: TObject);
begin
//  if not Assigned ( Screen.ActiveControl )
//    or (Screen.ActiveControl.Parent <> TWinControl ( Sender ) ) then
//    TControl ( Sender ).Set
//
//    edItemCodigo.SetFocus ;
end;

procedure TfrmDEVOLUCOES_Pedido.PatrimonioEditPanelResize(Sender: TObject);
var
 LRows : integer ;
begin
  LRows := (DBCtrlGridPatrimonios.Parent.ClientHeight - DBCtrlGridPatrimonios.Top) div TCustomPanel(Sender).Height ;
  DBCtrlGridPatrimonios.Height   := LRows * TCustomPanel(Sender).Height ;
  DBCtrlGridPatrimonios.RowCount := LRows ;
  DBCtrlGridPatrimonios.PanelHeight := TCustomPanel(Sender).Height ;
end;

procedure TfrmDEVOLUCOES_Pedido.PatrimonioLayout0Enter(Sender: TObject);
begin
  if not Assigned ( Screen.ActiveControl )
    or (Screen.ActiveControl.Parent <> PatrimonioEditPanel ) then
    edPatrimonioCodigo.SetFocus ;
end;

procedure TfrmDEVOLUCOES_Pedido.PatrimonioLayout0Resize(Sender: TObject);
var
 LRows : integer ;
begin
  LRows := (DBCtrlGridPatrimonios.Parent.ClientHeight - DBCtrlGridPatrimonios.Top) div TCustomPanel(Sender).Height ;
  DBCtrlGridPatrimonios.Height   := LRows * TCustomPanel(Sender).Height ;
  DBCtrlGridPatrimonios.RowCount := LRows ;
end;

procedure TfrmDEVOLUCOES_Pedido.dbContaBancariaTransporteButtonClick(Sender: TObject);
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


procedure TfrmDEVOLUCOES_Pedido.DBCtrlGridItemsPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
var
  LCtrlPanel : TCustomPanel ;
  LControlIdx : integer ;
  LControl: TControl ;
begin

  if Odd( Index ) then
    DBCtrlGrid.Canvas.Brush.Color := clBtnFace
  else
    DBCtrlGrid.Canvas.Brush.Color := clWhite ;

  DBCtrlGrid.Canvas.FillRect ( Rect(0,0, DBCtrlGrid.Width, DBCtrlGrid.Height )  );

  LCtrlPanel := ItemEditPanel ;

  if DBCtrlGrid.PanelIndex = Index then
   begin
     if LCtrlPanel.Top <> DBCtrlGrid.Top + DBCtrlGrid.PanelHeight * DBCtrlGrid.PanelIndex then
        LCtrlPanel.Top := DBCtrlGrid.Top + DBCtrlGrid.PanelHeight * DBCtrlGrid.PanelIndex ;
     if LCtrlPanel.Width <> DBCtrlGrid.PanelWidth then
        LCtrlPanel.Width := DBCtrlGrid.PanelWidth ;

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


procedure TfrmDEVOLUCOES_Pedido.DBCtrlGridPatrimoniosPaintPanel(DBCtrlGrid: TDBCtrlGrid;
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


procedure TfrmDEVOLUCOES_Pedido.DBCtrlGridServicosPaintPanel(
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

procedure TfrmDEVOLUCOES_Pedido.CheckReadOnlyFields;
var
 LReadOnly : boolean ;
 LParcelaBaixada : boolean ;
begin


  LParcelaBaixada := TdtmDEVOLUCOES_Pedido(DatamoduleBase).ParcelaBaixada ;
  LReadOnly := TdtmDEVOLUCOES_Pedido(DatamoduleBase).cdsDevolucaoIMPORTADO_NFE.asBoolean  ;

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

procedure TfrmDEVOLUCOES_Pedido.CheckReadOnlyFieldItens;
var
 LReadOnly : boolean ;
begin
  LReadOnly := TdtmDEVOLUCOES_Pedido(DatamoduleBase).cdsDevolucaoIMPORTADO_NFE.asBoolean  ;

  edItemCodigo.Enabled           := not LReadOnly ;
  cbxItemUnidadeCompra.Enabled   := not LReadOnly ;

  edItemQtdeCompra.ReadOnly      := LReadOnly ;
  edItemValorUnit.ReadOnly       := LReadOnly ;
  edItemDesconto.ReadOnly        := LReadOnly ;
  edItemFrete.ReadOnly           := LReadOnly ;
  cbxItemUnidadeEstoque.Enabled := not LReadOnly
                                 and TdtmDEVOLUCOES_Pedido(DatamoduleBase).cdsItensPedidoKEST_PRODUTO.isNull ;

  edItemUnitarioEstoque.ReadOnly := LReadOnly ;

  if LReadOnly then
   cbxItemUnidadeCompra.Style := csSimple
  else
   cbxItemUnidadeCompra.Style := csDropDown ;

end;

procedure TfrmDEVOLUCOES_Pedido.CheckReadOnlyFieldPatrimonios;
var
 LReadOnly : boolean ;
begin
  LReadOnly := TdtmDEVOLUCOES_Pedido(DatamoduleBase).cdsDevolucaoIMPORTADO_NFE.asBoolean  ;

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


function TfrmDEVOLUCOES_Pedido.ParcelaBaixada : Boolean;
const SQL_PARCELAS = '';

var
  cds : TClientDataSet ;
  p : TParams ;
begin
  cds := nil;
  p := TParams.Create;

  p.CreateParam( ftString, 'TABLENAME', ptInput ).AsString := 'CMP_PEDIDOS';
  p.CreateParam( ftString, 'TABLEKEY' , ptInput ).AsString := TdtmDEVOLUCOES_Pedido(DatamoduleBase).cdsDevolucaoKDEV_PEDIDO.AsString  ;

  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( cds, SQL_PARCELAS, P);

  Result := cds.RecordCount > 0
end;

procedure TfrmDEVOLUCOES_Pedido.Pesquisar;
begin
  inherited;
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchDevolucao.Create() do
    try
      SetFiltro ( deDtInicial.Date, deDtFinal.Date, BoolToChar( not cbxInativos.Checked ) );
      TextToFind := _edtSearch.Text ;
      if Execute then
        begin
          cdsDevolucoes.Locate( 'KDEV_PEDIDO', Result.FieldByName( 'KDEV_PEDIDO' ).Value, [] ) ;
          ActiveFicha ;
        end ;
    finally
      free ;
    end ;
end;

procedure TfrmDEVOLUCOES_Pedido.ProcessSuccessInfo;
begin
// checkNS
//  NotificationService.NotifyStr( self, 'PROCESS_' + ClassName );
end;

procedure TfrmDEVOLUCOES_Pedido.RatearDesconto ;
begin
   TdtmDEVOLUCOES_Pedido( DatamoduleBase ).RatearDescontos ;
end;


function TfrmDEVOLUCOES_Pedido.CalcularValorPorReferecia(Total, Referencia,
  Valor: double ) : double ;
begin
  Result := Valor * ( Referencia / Total )
end;


procedure TfrmDEVOLUCOES_Pedido.RatearFrete;
begin
   TdtmDEVOLUCOES_Pedido( DatamoduleBase ).RatearFrete ;
end;

procedure TfrmDEVOLUCOES_Pedido.RatearImposto;
begin
   TdtmDEVOLUCOES_Pedido( DatamoduleBase ).RatearImpostos ;
end;

procedure TfrmDEVOLUCOES_Pedido.edCompradorButtonClick(Sender: TObject);
begin
  SearchComprador ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmDEVOLUCOES_Pedido.SearchContaBancaria(TextToSearch: string);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetConta( Result.FieldByName( 'KFIN_CONTA' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;

procedure TfrmDEVOLUCOES_Pedido.SearchContaBancariaTransporte(
  TextToSearch: string);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetContaTransporte( Result.FieldByName( 'KFIN_CONTA' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;

procedure TfrmDEVOLUCOES_Pedido.SearchContaPadrao(TextToSearch: string);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetContaPreferencia( Result.FieldByName( 'KFIN_CONTA' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;

procedure TfrmDEVOLUCOES_Pedido.SearchContaPadraoTransporte(TextToSearch: string);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetContaPreferenciaTransporte( Result.FieldByName( 'KFIN_CONTA' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;

procedure TfrmDEVOLUCOES_Pedido.SearchContato(TextToSearch: string);
//var
//   Key : integer ;
//   NomeContato, Depto, Email, Fone : string ;
begin
         {
    with TSearchContatoEntidade.Create do
       begin
          Params.CreateParam( ftInteger, 'KCAD_ENTIDADE', ptInput ).asInteger := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoKCAD_ENTIDADE.asInteger ;
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

    TdtmDEVOLUCOES_Pedido( DatamoduleBase ).SetContato ( Key, NomeContato, Depto, Email, Fone ) ;
          }
end;

procedure TfrmDEVOLUCOES_Pedido.SearchCFOP(ATextToSearch: string);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchCFOP.Create do
    try
      TextToFind := ATextToSearch ;
      if Execute then
        SetCFOP( Result.FieldByName( 'CFOP' ).asString, Result.FieldByName( 'DESCRICAO' ).asString ) ;
  finally
    free ;
  end ;
end;

procedure TfrmDEVOLUCOES_Pedido.SearchCFOP_ESTOQUE(ATextToSearch: string);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchCFOP.Create do
    try
      TextToFind := ATextToSearch ;
      if Execute then
        SetCFOP_ESTOQUE( Result.FieldByName( 'CFOP' ).asString, Result.FieldByName( 'DESCRICAO' ).asString ) ;
  finally
    free ;
  end ;
end;

procedure TfrmDEVOLUCOES_Pedido.SearchComprador(TextToSearch: string);
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

    TdtmDEVOLUCOES_Pedido( DatamoduleBase ).SetComprador ( Key, NomeEntidade ) ;
                          }
end ;

procedure TfrmDEVOLUCOES_Pedido.actPrintPedidoFolhaTimbradoExecute(Sender: TObject);
begin
//  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
//     TfqrCOMPRAS_Pedido.Preview( cdsDevolucoesKDEV_PEDIDO.asInteger, tfPapelTimbrado, False ) ;

end;

procedure TfrmDEVOLUCOES_Pedido.actPrintPedidoPapelBrancoExecute(
  Sender: TObject);
begin
//  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
//     TfqrCOMPRAS_Pedido.Preview( cdsDevolucoesKDEV_PEDIDO.asInteger, tfPapelBranco, True ) ;

end;

procedure TfrmDEVOLUCOES_Pedido.actPrintPedidoPorPeriodoExecute(Sender: TObject);
var
  RParams : ReportTypes.TReportParamsCOMPRAS_Periodo ;
begin
  RParams := TReportParamsCOMPRAS_Periodo.Create ;

  RParams.ReportTitle := 'Compras por período';
  RParams.StartDate   := deDtInicial.Date ;
  RParams.EndDate     := deDtFinal.Date ;

//  TFin_ComprasPorPeriodoReport.ExecuteDialog( RParams );

  RParams.Free ;
end;

procedure TfrmDEVOLUCOES_Pedido.actPrintPedidoEmailExecute(Sender: TObject);
begin
//  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
//     TfqrCOMPRAS_Pedido.Preview( cdsDevolucoesKDEV_PEDIDO.asInteger, tfEstilizado, False ) ;
end;

procedure TfrmDEVOLUCOES_Pedido.actPrintPedidoMatricialExecute(
  Sender: TObject);
begin
//  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
//     TfqrCOMPRAS_Pedido.Preview( cdsDevolucoesKDEV_PEDIDO.asInteger, tfPapelBranco, False ) ;
end;

procedure TfrmDEVOLUCOES_Pedido.actPrintReciboExecute(Sender: TObject);
begin
//  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
//       TfqrCOMPRAS_Recibo.Preview(cdsDevolucoesKDEV_PEDIDO.asInteger);
end;



procedure TfrmDEVOLUCOES_Pedido.actRemoveItemProdutoExecute(Sender: TObject);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
      if cdsItensPedido.IsEmpty then
        Exit;

      if not( cdsDevolucao.state in [dsInsert, dsEdit] ) then
        cdsItensPedido.Edit;

      cdsItensPedido.Delete;
    end;
end;

procedure TfrmDEVOLUCOES_Pedido.actRemoveItemProdutoUpdate(Sender: TObject);
begin
    actRemoveItemProduto.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoIMPORTADO_NFE.AsBoolean)
end;

procedure TfrmDEVOLUCOES_Pedido.actRemoveItemServicoExecute(Sender: TObject);
begin
(*
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
      if cdsServicosPedido.IsEmpty then
        Exit;

      if not( cdsServicosPedido.state in [dsInsert, dsEdit] ) then
        cdsServicosPedido.Edit;

      cdsServicosPedido.Delete;
    end;
*)
end;

procedure TfrmDEVOLUCOES_Pedido.actRemoveItemServicoUpdate(Sender: TObject);
begin
    actRemoveItemServico.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoIMPORTADO_NFE.AsBoolean)
end;

procedure TfrmDEVOLUCOES_Pedido.actRemovePatrimonioExecute(Sender: TObject);
begin
(*
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
      if cdsPatrimoniosPedido.IsEmpty then
        Exit;

      if not( cdsDevolucao.state in [dsInsert, dsEdit] ) then
        cdsPatrimoniosPedido.Edit;

      ExcluiPatrimonio( cdsPatrimoniosPedidoKEST_PRODUTO.AsString );

      cdsPatrimoniosPedido.Delete;
    end;
*)
end;

procedure TfrmDEVOLUCOES_Pedido.actRemovePatrimonioUpdate(Sender: TObject);
begin
    actRemovePatrimonio.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoIMPORTADO_NFE.AsBoolean)
end;

procedure TfrmDEVOLUCOES_Pedido.actSalvarXMLNFeExecute(Sender: TObject);
var
 LFileName : string ;
begin

 with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
      LFileName := 'NFe-' + cdsDevolucaoCHAVENFE.asString + '.xml' ;

  JvSaveDialog1.FileName := LFileName ;
  if JvSaveDialog1.Execute then
    begin
     if FileExists ( JvSaveDialog1.FileName ) then
       if not DeleteFile( JvSaveDialog1.FileName ) then
         Raise Fail.Create( 'Não foi possível salvar o arquivo. '
             +#13#10'Verifique se o arquivo está sendo utilizado por outro processo.' ) ;
     TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoXML_NFE.SaveToFile ( LFileName ) ;
     MessageDlg ( 'XML salvo em :' + JvSaveDialog1.FileName ) ;
    end;
end;



procedure TfrmDEVOLUCOES_Pedido.actSalvarXMLNFeUpdate(Sender: TObject);
begin
  actSalvarXMLNFe.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoXML_NFE.isNull) ;
end;

procedure TfrmDEVOLUCOES_Pedido.ApagaAnexos;
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
//  p.CreateParam( ftString, 'TABLEKEY' , ptInput ).AsString := TdtmDEVOLUCOES_Pedido(DatamoduleBase).cdsDevolucaoKDEV_PEDIDO.AsString  ;
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

procedure TfrmDEVOLUCOES_Pedido.btbProgramarClick(Sender: TObject);
begin
  TdtmDEVOLUCOES_Pedido( DatamoduleBase ).CalcularParcelas( StrToIntDef( edtDia.Text, 0 ), StrToInt( edtParcelas.Text ), cbProximoMes.Checked, cbAnual.Checked )  ;
  dbgParcelasAPagar.SetFocus;
  dbgParcelasAPagar.SelectedIndex := 0 ;
end;

procedure TfrmDEVOLUCOES_Pedido.btnAdicionaParcelaClick(Sender: TObject);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
      if not( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
        cdsParcelas.Edit;

      cdsParcelas.Append;
    end;
end;

procedure TfrmDEVOLUCOES_Pedido.btnAnexosClick(Sender: TObject);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    TFIN_AnexosWizard.ExecuteWizard( 'CMP_PEDIDOS', cdsDevolucaoKDEV_PEDIDO.AsString );
end;

procedure TfrmDEVOLUCOES_Pedido.btnProgramarParcelasTransporteClick(
  Sender: TObject);
begin
  TdtmDEVOLUCOES_Pedido( DatamoduleBase ).CalcularParcelasTransporte(
    StrToIntDef( edtDiaParcelaTransporte.Text, 0 ),
    StrToInt( edtParcelasTransporte.Text ),
    cbProximoMesTransporte.Checked,
    cbAnualTransporte.Checked );

  dbgParcelasAPagarTransporte.SetFocus;
  dbgParcelasAPagarTransporte.SelectedIndex := 0 ;
end;

procedure TfrmDEVOLUCOES_Pedido.btnRemoveParcelaClick(Sender: TObject);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
      if cdsParcelas.IsEmpty then
        Exit;

      if not( cdsParcelas.state in [dsInsert, dsEdit] ) then
         cdsParcelas.Edit ;

      cdsParcelas.Delete;
    end;
end;

procedure TfrmDEVOLUCOES_Pedido.Button1Click(Sender: TObject);
var
  ProdutoInfo : TProdutoInfo ;
begin
  ProdutoInfo.TipoProduto := tpProduto ;
  SvcEstoqueProdutosCadastro.NovoCadastro( ProdutoInfo );
end;

procedure TfrmDEVOLUCOES_Pedido.Button2Click(Sender: TObject);
var
  ProdutoInfo : TProdutoInfo ;
begin
  ProdutoInfo.TipoProduto := tpServico ;
  SvcEstoqueProdutosCadastro.NovoCadastro( ProdutoInfo );
end;


procedure TfrmDEVOLUCOES_Pedido.cbxInativosClick(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create ( ChangeFilter ) ;
end;

procedure TfrmDEVOLUCOES_Pedido.ChangeFilter;
begin
  TdtmDEVOLUCOES_Pedido( DatamoduleBase ).SetFilter( cbxInativos.Checked, deDtInicial.Date, deDtFinal.Date );
end;

(*
procedure TfrmDEVOLUCOES_Pedido.ScrollItensResize(Sender: TObject);
begin
  DBCtrlGridItems.PanelWidth := ScrollItens.Width - 20 ; // DBCtrlGridItems.ClientWidth ;

  ItemsEditPanel.Top   := DBCtrlGridItems.Top ;
  ItemsEditPanel.Left  := DBCtrlGridItems.Left ;
  ItemsEditPanel.Width := DBCtrlGridItems.PanelWidth ;

end;
*)

constructor TfrmDEVOLUCOES_Pedido.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited;

//  ScrollItens.OnResize := ScrollItensResize ;

//  ScrollItens.OnScrollInView := DoScrollInView ;
//  _ScrollBoxFicha.OnScrollInView := DoScrollInView ;
  //ScrollItens.OnScrollInView := DoScrollInView ;


  deDtInicial.Date := StartOfTheMonth( Date ) ;
  deDtFinal.Date   := EndOfTheMonth( Date ) ;

  deDtInicial.OnExit := deDtInicialExit ;
  deDtFinal.OnExit   := deDtFinalExit ;

  TdtmDEVOLUCOES_Pedido.Create ( self ) ;

  TdtmDEVOLUCOES_Pedido( DatamoduleBase ).KDEV_PEDIDO := TfrmDEVOLUCOES_Pedido.KDEV_PEDIDO ;

   dtsLista.DataSet              := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucoes ;
   dtsFicha.DataSet              := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucao ;
   dtsItensPedido.DataSet        := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsItensPedido ;
//   dtsPatrimoniosPedido.DataSet  := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsPatrimoniosPedido ;
//   dtsServicos.DataSet           := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsServicosPedido ;
   dtsDadosEntidade.DataSet      := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDadosEntidade ;
   dtsAReceber.DataSet           := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsAReceber ;
   dtsParcelas.DataSet           := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsParcelas ;
   dtsPagtoTransporte.DataSet    := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsAPagarTransporte ;
   dtsParcelasTransporte.DataSet := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsParcelasTransporte ;

  if KDEV_PEDIDO <> '' then
    _pageControl.ActivePage := _tbsFicha ;

  KDEV_PEDIDO := '' ;

  ItemEditPanel.FDBCtrlGrid       := DBCtrlGridItems ;

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

  ShowScrollBar(DBCtrlGridItems.Handle, SB_VERT, False);//to hide
  ShowScrollBar(DBCtrlGridItems.Handle, SB_HORZ, False);//to hide

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

procedure TfrmDEVOLUCOES_Pedido.dtsParcelasTransporteDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned( TdtmDEVOLUCOES_Pedido( DatamoduleBase ) ) then
     exit ;
//  if not Assigned ( Field ) then
//  with dbgParcelasAPagarTransporte do
//   begin
//     Height := TitleRowHeight + ( RowsHeight * Max(DataSource.DataSet.RecordCount + 2, 3) ) ;
//     pnlTotalTransporte.Top := Top + Height + 3 ;
//   end;
end;

procedure TfrmDEVOLUCOES_Pedido.edPatrimonioCodigoButtonClick(Sender: TObject);
var
   LPatrimonio  : TPatrimonioInfo;
begin
(*
  if edPatrimonioCodigo.Text = '' then
    begin
       //LKPatrimonio := SvcEstoquePatrimonioCadastro.Execute ;
      LPatrimonio.DataCompra := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoDATA_COMPRA.AsDateTime;
      SvcEstoquePatrimonioCadastro.NovoCadastro( LPatrimonio );
      if LPatrimonio.KCAD_PATRIMONIO <> '' then
         TdtmDEVOLUCOES_Pedido( DatamoduleBase ).CadastraPatrimonio( LPatrimonio ) ;
    end ;
  edPatrimonioCodigo.SelectAll;
*)
end;

procedure TfrmDEVOLUCOES_Pedido.edPatrimonioCodigoEnter(Sender: TObject);
var
   LPatrimonio  : TPatrimonioInfo;
begin
(*
  if edPatrimonioCodigo.Text = '' then
    begin
       //LKPatrimonio := SvcEstoquePatrimonioCadastro.Execute ;
      LPatrimonio.DataCompra := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoDATA_COMPRA.AsDateTime;
      SvcEstoquePatrimonioCadastro.NovoCadastro( LPatrimonio );
      if LPatrimonio.KCAD_PATRIMONIO <> '' then
         TdtmDEVOLUCOES_Pedido( DatamoduleBase ).CadastraPatrimonio( LPatrimonio ) ;
    end ;
  edPatrimonioCodigo.SelectAll;
*)
end;

procedure TfrmDEVOLUCOES_Pedido.edItemContaContabilButtonClick(Sender: TObject);
var
  LAPRD : TTiposPlanoAPRD ;
begin
 with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
         LAPRD := [ tpAtivo, tpDespesas,
                    tpPassivo ] ;

       TdtmDEVOLUCOES_Pedido( DatamoduleBase ).PostItem ;
       SvcFinanceiroApropriacaoEdit.ExecuteTela( 'CMP_PEDIDO_ITENS',
                                           cdsItensPedido,
                                           cdsApropriacaoItem,
                                           TelaProduto,
                                           LAPRD );
       TdtmDEVOLUCOES_Pedido( DatamoduleBase ).EditItem ;
    end;

end;





procedure TfrmDEVOLUCOES_Pedido.edPatrimonioContaContabilButtonClick(
  Sender: TObject);
var
  LAPRD : TTiposPlanoAPRD ;
begin
(*
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
         LAPRD := [ tpAtivo ] ;

       TdtmDEVOLUCOES_Pedido( DatamoduleBase ).PostPatrimonio  ;
       SvcFinanceiroApropriacaoEdit.ExecuteTela( 'CMP_PEDIDO_ITENS',
                                           cdsPatrimoniosPedido,
                                           cdsApropriacaoItem,
                                           TelaProduto,
                                           LAPRD );
       TdtmDEVOLUCOES_Pedido( DatamoduleBase ).EditItem ;
    end;
*)
end;

procedure TfrmDEVOLUCOES_Pedido.edServicoCodigoButtonClick(Sender: TObject);
//var
//   LServico  : TServicoInfo;
begin
  if edServicoCodigo.Text = '' then
    begin
       //LKServico := SvcEstoqueServicoCadastro.Execute ;
//      LServico.DataCompra := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoDATA_COMPRA.AsDateTime;
//      SvcEstoqueServicoCadastro.NovoCadastro( LServico );
//      if LServico.KCAD_Servico <> '' then
//         TdtmDEVOLUCOES_Pedido( DatamoduleBase ).CadastraServico( LServico ) ;
    end ;
  edServicoCodigo.SelectAll;
end;

procedure TfrmDEVOLUCOES_Pedido.edServicoCodigoEnter(Sender: TObject);
//ar
//  LServico  : TServicoInfo;
begin
  if edServicoCodigo.Text = '' then
    begin
       //LKServico := SvcEstoqueServicoCadastro.Execute ;
//     LServico.DataCompra := TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoDATA_COMPRA.AsDateTime;
//     SvcEstoqueServicoCadastro.NovoCadastro( LServico );
//     if LServico.KCAD_Servico <> '' then
//        TdtmDEVOLUCOES_Pedido( DatamoduleBase ).CadastraServico( LServico ) ;
    end ;
  edServicoCodigo.SelectAll;
end;

procedure TfrmDEVOLUCOES_Pedido.edServicoContaContabilButtonClick(Sender: TObject);
var
  LAPRD : TTiposPlanoAPRD ;
begin
(*
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
         LAPRD := [ tpDespesas ] ;

          TdtmDEVOLUCOES_Pedido( DatamoduleBase ).PostServico;
          SvcFinanceiroApropriacaoEdit.ExecuteTela( 'CMP_PEDIDO_SERVICOS',
                                              cdsServicosPedido,
                                              cdsApropriacaoServico,
                                              TelaProduto,
                                              LAPRD );

       TdtmDEVOLUCOES_Pedido( DatamoduleBase ).EditServico ;
    end;
*)
end;

procedure TfrmDEVOLUCOES_Pedido.deDtFinalExit(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create ( ChangeFilter ) ;
end;

procedure TfrmDEVOLUCOES_Pedido.deDtInicialExit(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create ( ChangeFilter ) ;
end;


procedure TfrmDEVOLUCOES_Pedido.dtsFichaDataChange(Sender: TObject; Field: TField);
begin
  if not Assigned ( TdtmDEVOLUCOES_Pedido( DatamoduleBase ) ) then
     exit ;

  try

    if not Assigned ( Field ) then
       CheckReadOnlyFields ;

    if not Assigned ( Field )
      or (Field = TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoKCAD_ENTIDADE) then
       begin
         Image1.Picture := nil ;
         if not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoKCAD_ENTIDADE.isNull then
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
//      pnlTransporte.AutoSize := (TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoFRETE.asFloat > 0)
//                             or (not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsAPagarTransporte.isEmpty)
//                             or (not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsParcelasTransporte.isEmpty) ;
//      pnlTransporte.Height := 22 ;
      end;
  except
  end;
end;

procedure TfrmDEVOLUCOES_Pedido.dtsItensPedidoDataChange(Sender: TObject;
  Field: TField);
begin
EXIT ; //remove

  if not Assigned( TdtmDEVOLUCOES_Pedido( DatamoduleBase ) ) then
     exit ;
  try
    if not Assigned ( Field ) then
      with DBCtrlGridItems do
       begin
         RowCount := DataSource.DataSet.RecordCount ; //Max(DataSource.DataSet.RecordCount + 1, 2) ;
//         PanelHeight := ItemsEditPanel.Height ;
       end;
////    DBCtrlGridItemsPanel.Height := ItemsEditPanel.Height * DBCtrlGridItems.RowCount ;
////    pnlTotalItens.Top := DBCtrlGridItemsPanel.Top + DBCtrlGridItemsPanel.Height + 3 ;
  except
  end;
end;

procedure TfrmDEVOLUCOES_Pedido.dtsPatrimoniosPedidoDataChange(Sender: TObject;
  Field: TField);
begin
EXIT ; //******* remove

  if not Assigned( TdtmDEVOLUCOES_Pedido( DatamoduleBase ) ) then
     exit ;
  try
    if not Assigned ( Field ) then
      with DBCtrlGridPatrimonios do
       begin
         RowCount := DataSource.DataSet.RecordCount ; //Max(DataSource.DataSet.RecordCount + 1, 2) ;
//         PanelHeight := PatrimoniosEditPanel.Height ;
       end;
//    DBCtrlGridPatrimoniosPanel.Height := PatrimoniosEditPanel.Height * DBCtrlGridPatrimonios.RowCount ;
//    DBCtrlGridPatrimonios.Height := PatrimoniosEditPanel.Height * DBCtrlGridPatrimonios.RowCount ;
  except
  end;
end;

(*
procedure TfrmDEVOLUCOES_Pedido.dtsItensPedidoDataChange(Sender: TObject;
  Field: TField);
begin
  try
    if not Assigned ( Field ) then
      with DBCtrlGridItems do
       begin
         RowCount := Max(DataSource.DataSet.RecordCount + 1, 2) ;
         PanelHeight := ItemsEditPanel.Height ;
         Height := PanelHeight + RowCount ;
       end;
    DBCtrlGridItemsPanel.Height := ItemsEditPanel.Height * DBCtrlGridItems.RowCount + ItemsEditPanel.Height ;
    //ShowScrollBar(DBCtrlGridItems.Handle, SB_VERT, False);//to hide
    pnlTotalItens.Top := DBCtrlGridItemsPanel.Top + DBCtrlGridItemsPanel.Height + 3 ;

    //ItemsEditPanel.SetFocus ;
  except
  end;
end;

*)


procedure TfrmDEVOLUCOES_Pedido.dtsParcelasDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned( TdtmDEVOLUCOES_Pedido( DatamoduleBase ) ) then
     exit ;

///  if not Assigned ( Field ) then
///  with dbgParcelasAPagar do
///  / begin
//     Height := TitleRowHeight + ( RowsHeight * Max(DataSource.DataSet.RecordCount + 2, 3) ) ;
///     pnlTotalAPagar.Top := Top + Height + 3 ;
///   end;
end;


procedure TfrmDEVOLUCOES_Pedido.dtsServicosDataChange(Sender: TObject;
  Field: TField);
var
  LHasServicos : boolean ;
begin
  EXIT ;

  if not Assigned( TdtmDEVOLUCOES_Pedido( DatamoduleBase ) ) then
     exit ;

end;

procedure TfrmDEVOLUCOES_Pedido.SearchServico(TextToSearch: string);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ), TSearchServicoAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        insereServico( Result.FieldByName( 'KEST_PRODUTO' ).asString,
                       Result.FieldByName( 'CODIGO' ).asString,
                       Result.FieldByName( 'NOME' ).asString,
                       Result.FieldByName( 'UNIDADE' ).AsString,
                       Result.FieldByName( 'CUSTO_MEDIO' ).asCurrency );
    finally
      free ;
    end ;
end ;


procedure TfrmDEVOLUCOES_Pedido.ServicoEditPanelResize(Sender: TObject);
var
 LRows : integer ;
begin
  LRows := (DBCtrlGridServicos.Parent.ClientHeight - DBCtrlGridServicos.Top) div TCustomPanel(Sender).Height ;
  DBCtrlGridServicos.Height   := LRows * TCustomPanel(Sender).Height ;
  DBCtrlGridServicos.RowCount := LRows ;
  DBCtrlGridServicos.PanelHeight := TCustomPanel(Sender).Height ;
end;

procedure TfrmDEVOLUCOES_Pedido.ServicoLayout0Resize(Sender: TObject);
var
 LRows : integer ;
begin
  LRows := (DBCtrlGridServicos.Parent.ClientHeight - DBCtrlGridServicos.Top) div TCustomPanel(Sender).Height ;
  DBCtrlGridServicos.Height   := LRows * TCustomPanel(Sender).Height ;
  DBCtrlGridServicos.RowCount := LRows ;
end;

procedure TfrmDEVOLUCOES_Pedido.btnRatearDescontoClick(Sender: TObject);
begin
  RatearDesconto ;
end;

procedure TfrmDEVOLUCOES_Pedido.btnRatearFreteClick(Sender: TObject);
begin
  RatearFrete ;
end;

procedure TfrmDEVOLUCOES_Pedido.btnRatearImpostoClick(Sender: TObject);
begin
  RatearImposto ;
end;

procedure TfrmDEVOLUCOES_Pedido.edItemCFOPButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  SearchCFOP ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmDEVOLUCOES_Pedido.edItemCFOP_ESTOQUEButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  SearchCFOP_ESTOQUE ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmDEVOLUCOES_Pedido.edItemCodigoButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    begin
      showMessage('readonly');
      exit ;
    end;

  SearchProduto ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmDEVOLUCOES_Pedido.TcGDIButton4Click(Sender: TObject);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
      if not( cdsParcelasTransporte.State in [ dsInsert, dsEdit ] ) then
        cdsParcelasTransporte.Edit;

      cdsParcelasTransporte.Append;
    end;
end;

procedure TfrmDEVOLUCOES_Pedido.TcGDIButton6Click(Sender: TObject);
begin
  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
    begin
      if cdsParcelasTransporte.IsEmpty then
        Exit;

      if not( cdsParcelasTransporte.state in [dsInsert, dsEdit] ) then
         cdsParcelasTransporte.Edit ;

      cdsParcelasTransporte.Delete;
    end;
end;

procedure TfrmDEVOLUCOES_Pedido._actDeleteExecute(Sender: TObject);
begin
//  ApagaAnexos;
//  with TdtmDEVOLUCOES_Pedido(DatamoduleBase) do
//    TFIN_AnexosWizard.DeletaAnexos( 'CMP_PEDIDOS', cdsDevolucaoKDEV_PEDIDO.AsString );

//  if not ParcelaBaixada then

    inherited;
end;

procedure TfrmDEVOLUCOES_Pedido._actEditExecute(Sender: TObject);
begin

  inherited;
  btnAnexos.Enabled := True ;
  ExibeCamposCheque;
end;

procedure TfrmDEVOLUCOES_Pedido._actNewExecute(Sender: TObject);
begin

  try
   inherited;
  except
   // Volts é fda.
   inherited;
  end;
  PageControl1.ActivePageIndex := 0 ;
  btnAnexos.Enabled       := False ;
  ExibeCamposCheque;
end;

procedure TfrmDEVOLUCOES_Pedido._actSaveExecute(Sender: TObject);
begin
  //ShowMessage( screen.ActiveControl.Name ) ;

  TdtmDEVOLUCOES_Pedido( DatamoduleBase ).CheckValorAReceber ;


//  ProcessSuccessInfo ;
  inherited;

  btnAnexos.Enabled := True ;
end;

procedure TfrmDEVOLUCOES_Pedido._dbgListaDblClick(Sender: TObject);
begin
  inherited;
  btnAnexos.Enabled := True ;
  //TdtmDEVOLUCOES_Pedido( DatamoduleBase ).CalculaTotais ;
end;

procedure TfrmDEVOLUCOES_Pedido.actAddItemProdutoExecute(Sender: TObject);
begin
  if not( dtsItensPedido.DataSet.State in [ dsInsert, dsEdit ] ) then
    dtsItensPedido.DataSet.Edit ;

  dtsItensPedido.DataSet.Append ;
  edItemCodigo.SetFocus ;
end;

procedure TfrmDEVOLUCOES_Pedido.actAddItemProdutoUpdate(Sender: TObject);
begin
    actAddItemProduto.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoIMPORTADO_NFE.AsBoolean) ;
end;

procedure TfrmDEVOLUCOES_Pedido.actAddItemServicoExecute(Sender: TObject);
begin
  if not( dtsServicos.DataSet.State in [ dsInsert, dsEdit ] ) then
    dtsServicos.DataSet.Edit ;

  dtsServicos.DataSet.Append ;
  edServicoCodigo.SetFocus ;
end;

procedure TfrmDEVOLUCOES_Pedido.actAddItemServicoUpdate(Sender: TObject);
begin
    actAddItemServico.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoIMPORTADO_NFE.AsBoolean)
end;

procedure TfrmDEVOLUCOES_Pedido.actAddPatrimonioExecute(Sender: TObject);
begin
  if not( dtsPatrimoniosPedido.DataSet.State in [ dsInsert, dsEdit ] ) then
    dtsPatrimoniosPedido.DataSet.Edit ;

  dtsPatrimoniosPedido.DataSet.Append ;
  edPatrimonioCodigo.SetFocus ;
end;

procedure TfrmDEVOLUCOES_Pedido.actAddPatrimonioUpdate(Sender: TObject);
begin
    actAddPatrimonio.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoIMPORTADO_NFE.AsBoolean) ;
end;

procedure TfrmDEVOLUCOES_Pedido.actCopiarPedidoExecute(Sender: TObject);
begin
//  with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
//     if MessageDlg ( 'Deseja gerar uma cópia do pedido: #%s.', [cdsDevolucoesCODIGO.asString], mtConfirmation, [mbYes, mbNo] ) <> mrYes then
//        exit ;

  self.ActiveFicha ;

  TdtmDEVOLUCOES_Pedido( DatamoduleBase ).ClonePedido ;
end;

procedure TfrmDEVOLUCOES_Pedido.actImportarNFeExecute(Sender: TObject);
var
//  LNFeInfo : TNFeInfo ;
  LOK : boolean ;
begin
(*

  LOK := TfrmImportNFeCompra.Execute ( LNFeInfo ) ;

  if LNFeInfo.KFornecedor <> '' then
     TdtmDEVOLUCOES_Pedido( DatamoduleBase ).SaveProdutosFornecedor(
          LNFeInfo.KFornecedor
        , LNFeInfo.Produtos  ) ;

  if LOK then
     TdtmDEVOLUCOES_Pedido( DatamoduleBase ).InsereFromNFe( LNFeInfo );
*)
end;

procedure TfrmDEVOLUCOES_Pedido.actImportarNFeUpdate(Sender: TObject);
begin

    actImportarNFe.Enabled := Assigned ( DatamoduleBase )
                    and  (TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucao.State in [dsInsert,dsEdit])
                    and  (    TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsItensPedido.Bof
                          and TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsItensPedido.Eof ) ;

//  actPrintComprasPeriodo.Enabled := LoggedUser.KUser <= 1 ;
end;

procedure TfrmDEVOLUCOES_Pedido.actImportarOrcamentoExecute(Sender: TObject);
begin
//  if TfrmDEVOLUCOES_Pedido_ImportaOrcamento.Execute ( TdtmDEVOLUCOES_Pedido( DatamoduleBase ) ) then
//     self.ActiveFicha ;
end;

type
   TPreviewDANFe = procedure ( AKey : PChar ) ; stdcall ;

procedure TfrmDEVOLUCOES_Pedido.actVisualizarDANFeExecute(Sender: TObject);
var
 L : THandle ;
 LPreviewDANFe : TPreviewDANFe ;
 LFileName : string ;
begin
(*
 L := LoadLibrary('TCDANFeDLL.dll') ;
 if L = 0 then
   exit;

 with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
   begin
      LFileName := TcTempFolderFactory.TempPath + cdsDevolucaoCHAVENFE.asString + '.xml' ;
      cdsDevolucaoXML_NFE.SaveToFile ( LFileName ) ;
   end ;

 LPreviewDANFe := GetProcAddress( L, 'PreviewDANFe');
 LPreviewDANFe( PChar( LFileName ) );
 FreeLibrary( L ) ;
*)

 with TdtmDEVOLUCOES_Pedido( DatamoduleBase ) do
   begin
      LFileName := TcTempFolderFactory.TempPath + cdsDevolucaoCHAVENFE.asString + '.xml' ;
      cdsDevolucaoXML_NFE.SaveToFile ( LFileName ) ;
   end ;

 DANFeQR.TfqrDANFeQR.PrintFromFile( LFileName );
end;

procedure TfrmDEVOLUCOES_Pedido.actVisualizarDANFeUpdate(Sender: TObject);
begin
  actVisualizarDANFe.Enabled := Assigned ( DatamoduleBase )
                    and (TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoMODELO_NFE.asInteger = 55)
                    and  (not TdtmDEVOLUCOES_Pedido( DatamoduleBase ).cdsDevolucaoXML_NFE.isNull) ;
end;

procedure TfrmDEVOLUCOES_Pedido.actPrintComprasCentroCustoExecute( Sender: TObject);
var
  RParams : ReportTypes.TReportParamsCOMPRAS_Periodo ;
begin
  RParams := TReportParamsCOMPRAS_Periodo.Create ;
  RParams.StartDate   := deDtInicial.Date ;
  RParams.EndDate     := deDtFinal.Date ;
  RParams.ReportTitle := 'Notas fiscais de compra por centro de custo';
//  TFin_ComprasPorCentroCustoReport.ExecuteDialog( RParams );
  RParams.Free ;
end;

procedure TfrmDEVOLUCOES_Pedido.actPrintComprasCentroCustoUpdate(Sender: TObject);
begin
//  actPrintComprasPeriodo.Enabled := LoggedUser.KUser <= 1 ;
end;

{ TDBCtrlGrid }


{ SvcEstoqueEntradaDadosDevolucoesFactory }
function SvcEstoqueEntradaDadosDevolucoesFactory.Execute(AKDEV_PEDIDO : string): string;
begin
   TfrmDEVOLUCOES_Pedido.KDEV_PEDIDO := AKDEV_PEDIDO ;
   with TfrmDEVOLUCOES_Pedido.Create ( nil ) do
     try
       BorderStyle := bsToolWindow ;
       ShowModal ;
     finally
       Free ;
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
  RegisterClass ( TfrmDEVOLUCOES_Pedido ) ;
  SvcEstoqueEntradaDadosDevolucoes := SvcEstoqueEntradaDadosDevolucoesFactory.Create ;

finalization
  SvcEstoqueEntradaDadosDevolucoes := nil ;

end.
