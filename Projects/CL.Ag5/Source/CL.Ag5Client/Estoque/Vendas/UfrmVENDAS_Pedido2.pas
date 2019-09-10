// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Lançamentos
// Funcionality : Vendas
//                com nota fiscal
// License      : veja readme.txt





unit UfrmVENDAS_Pedido2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  SysFormListaFicha, VCL.StdCtrls, JvDBControls, VCL.DBCtrls, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ActnList, VCL.ComCtrls, VCL.ToolWin, VCL.Buttons, VCL.Mask, JvExMask, JvToolEdit,
  VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvExExtCtrls, SysReportTypes, ReportTypes, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, JvImage, JvExtComponent, JvPanel, VCL.ImgList,
  Tc.VCL.Dialogs, JvExStdCtrls, JvCombobox, JvDBCombobox, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, Math, JvBaseEdits,
  JvExForms, JvScrollBox, Tc.VCL.Controls.GDIButton, System.Actions,
  Tc.VCL.FloatPanel, System.ImageList, Tc.VCL.Extended.Mask, Tc.VCL.Application,
  Tc.RTL.Folders,
  JvDBCheckBox, Vcl.Dialogs, JvDialogs, uImageListProvider,
  Vcl.DBCGrids, Wrappers ;

type

  TPanel = class ( Vcl.ExtCtrls.TPanel )
    FDBCtrlGrid : TDBCtrlGrid ;
    procedure CMChildKey(var Message: TCMChildKey); message CM_CHILDKEY;
  end;


  TfrmVENDAS_Pedido = class( T_FormListaFicha )
    actSalvarXMLNFe : TAction ;
    actImportarNFe: TAction;
    actVisualizarDANFe: TAction;
    actAddItemProduto: TAction;
    actRemoveItemProduto: TAction;
    actAddItemServico: TAction;
    actRemoveItemServico: TAction;
    cbxInativos :TCheckBox;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    Label5: TLabel;
    deDtInicial: TTcDateEdit;
    deDtFinal: TTcDateEdit;
    PageControl1: TPageControl;
    tbsServicos: TTabSheet;
    tbsObservacoes: TTabSheet;
    tbsPatrimonios: TTabSheet;
    lblDescricaoPatrimonio: TLabel;
    lblContaContabilPatrimonio: TLabel;
    lblDescontoPatrimonio: TLabel;
    lblFretePatrimonio: TLabel;
    lblQtdePatrimonio: TLabel;
    lblTotalPatrimonio: TLabel;
    lblUnidadePatrimonio: TLabel;
    lblValorUnitarioPatrimonio: TLabel;
    DBCtrlGridPatrimonios: TDBCtrlGrid;
    PatrimonioEditPanel: TPanel;
    Shape1: TShape;
    PatrimonioLayout0: TGridPanel;
    edPatrimonioCodigo: TTcDBComboEdit;
    cbxPatrimonioUnidadeCompra: TDBComboBox;
    edPatrimonioQtdeCompra: TJvDBCalcEdit;
    edPatrimonioValorUnit: TJvDBCalcEdit;
    edPatrimonioDesconto: TJvDBCalcEdit;
    edPatrimonioFrete: TJvDBCalcEdit;
    edPatrimonioTotal: TJvDBCalcEdit;
    edPatrimonioContaContabil: TTcDBComboEdit;
    btnAdicionaPatrimonio: TTcGDIButton;
    btnRemovePatrimonio: TTcGDIButton;
    gbRecebimentos: TGroupBox;
    Label11: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    dbgParcelasAReceber: TJvDBUltimGrid;
    btnAdicionaParcela: TTcGDIButton;
    btnRemoveParcela: TTcGDIButton;
    edtDia: TDBEdit;
    dbVencimento: TTcDBDateEdit;
    dbmObsParcela: TDBMemo;
    edtParcelas: TDBEdit;
    pnlTotalAReceber: TPanel;
    Label28: TLabel;
    DBText1: TDBText;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    DBCheckBox1: TJvDBCheckBox;
    edtCheque: TDBEdit;
    dbcheckComCheque: TJvDBCheckBox;
    btbProgramar: TTcGDIButton;
    dbContaBancaria: TTcDBComboEdit;
    dbceValorParcela: TJvDBCalcEdit;
    cbProximoMes: TDBCheckBox;
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
    pnlTotalServicos: TPanel;
    Label10: TLabel;
    DBText2: TDBText;
    btnAddPatrimonio: TTcGDIButton;
    ImageList1: TImageList;
    tbsProdutos: TTabSheet;
    lblDescricaoItem: TLabel;
    lblContaContabilItem: TLabel;
    lblQtdeItem: TLabel;
    lblTotalItem: TLabel;
    lblUnidadeItem: TLabel;
    lblValorUnitarioItem: TLabel;
    DBCtrlGridItens: TDBCtrlGrid;
    ItemEditPanel: TPanel;
    Shape2: TShape;
    ItemLayout0: TGridPanel;
    edItemCodigo: TTcDBComboEdit;
    cbxItemUnidadeCompra: TDBComboBox;
    edItemQtdeCompra: TJvDBCalcEdit;
    edItemValorUnit: TJvDBCalcEdit;
    edItemTotal: TJvDBCalcEdit;
    edItemContaContabil: TTcDBComboEdit;
    btnAdicionaItem: TTcGDIButton;
    btnRemoveItem: TTcGDIButton;
    Panel1: TPanel;
    LabelX10: TLabel;
    DBText3: TDBText;
    btnAddProduto: TTcGDIButton;
    dtsItensPedido: TDataSource;
    dtsPatrimoniosPedido: TDataSource;
    dtsServicos: TDataSource;
    dtsParcelas: TDataSource;
    dtsDadosEntidade: TDataSource;
    dtsAReceber: TDataSource;
    dtsPagtoTransporte: TDataSource;
    dtsParcelasTransporte: TDataSource;
    JvSaveDialog1: TJvSaveDialog;
    Panel2: TPanel;
    Label3: TLabel;
    DBText4: TDBText;
    btnAddServico: TTcGDIButton;
    pnInfoNota: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label22: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label23: TLabel;
    dbTotalNota: TDBText;
    Label12: TLabel;
    Label16: TLabel;
    Image1: TImage;
    lblAviso: TLabel;
    GroupBox3: TGroupBox;
    DBMemo3: TDBMemo;
    dbSerie: TDBEdit;
    dbDataVenda: TTcDBDateEdit;
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
    TabSheet1: TTabSheet;
    dtsParcelasAPagar: TDataSource;
    dtsAPagar: TDataSource;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    dbgParcelasAPagar: TJvDBUltimGrid;
    TcGDIButton1: TTcGDIButton;
    TcGDIButton2: TTcGDIButton;
    DBEdit1: TDBEdit;
    TcDBDateEdit1: TTcDBDateEdit;
    DBMemo2: TDBMemo;
    DBEdit2: TDBEdit;
    pnlTotalAPagar: TPanel;
    Label24: TLabel;
    DBText5: TDBText;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    JvDBCheckBox1: TJvDBCheckBox;
    DBEdit3: TDBEdit;
    JvDBCheckBox2: TJvDBCheckBox;
    TcGDIButton3: TTcGDIButton;
    TcDBComboEdit1: TTcDBComboEdit;
    JvDBCalcEdit1: TJvDBCalcEdit;
    DBCheckBox2: TDBCheckBox;
    cbAnualDescontos: TJvDBCheckBox;
    cbAnual: TJvDBCheckBox;
    Label26: TLabel;
    dbDeducoes: TJvDBCalcEdit;
    Label27: TLabel;
    procedure edEntidadeButtonClick( Sender :TObject );
    procedure edNomeContatoButtonClick( Sender :TObject );
    procedure edCompradorButtonClick( Sender :TObject );
    procedure actPrintPedidoFolhaTimbradoExecute( Sender :TObject );
    procedure actPrintPedidoPapelBrancoExecute( Sender :TObject );
    procedure actPrintPedidoEmailExecute( Sender :TObject );
    procedure actPrintPedidoMatricialExecute( Sender :TObject );
    procedure actPrintReciboExecute( Sender :TObject );
    procedure actCopiarPedidoExecute( Sender :TObject );
    procedure actImportarOrcamentoExecute( Sender :TObject );
    procedure actPrintPorPeriodoExecute(Sender: TObject);
    procedure actPrintNFCentroCustoExecute( Sender :TObject );
    procedure actPrintNFCentroCustoUpdate( Sender :TObject );
    procedure cbxInativosClick( Sender :TObject );
    procedure btnAddProdutoClick( Sender :TObject );
    procedure btnAddServicoClick( Sender :TObject );
    procedure dbgItensShowEditor( Sender :TObject; Field :TField; var AllowEdit :Boolean );
    procedure dbgParcelasAReceberEditButtonClick( Sender :TObject );
    procedure btbProgramarClick( Sender :TObject );
    procedure dbContaBancariaButtonClick(Sender: TObject);
    procedure dbgParcelasAReceberKeyPress(Sender: TObject; var Key: Char);
    procedure dbContaBancariaKeyPress(Sender: TObject; var Key: Char);
    procedure _actSaveExecute(Sender: TObject);
    procedure _pageControlChange(Sender: TObject);
    procedure TodasNotasClick(Sender: TObject);

    procedure btnRemoveParcelaClick(Sender: TObject);
    procedure btnAdicionaParcelaClick(Sender: TObject);

    procedure btnAdicionaServicoClick(Sender: TObject);
    procedure dbgServicosEnter(Sender: TObject);
    procedure dbgItensEnter(Sender: TObject);
    procedure dbcbIS_PatrimonioEnter(Sender: TObject);
    procedure TcMPFormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure TcMPFormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure dbceValorParcelaEnter(Sender: TObject);
    procedure dtsParcelasDataChange(Sender: TObject; Field: TField);
    procedure btnAnexosClick(Sender: TObject);
    procedure _actNewExecute(Sender: TObject);
    procedure _dbgListaDblClick(Sender: TObject);
    procedure _actEditExecute(Sender: TObject);
    procedure pnlFinanceiroEnter(Sender: TObject);
    procedure edEntidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure edEntidadeChange(Sender: TObject);
    procedure DBCheckBox1Change(Sender: TObject);
    procedure actSalvarXMLNFeExecute(Sender: TObject);
    procedure actSalvarXMLNFeUpdate(Sender: TObject);
    procedure actVisualizarDANFeExecute(Sender: TObject);
    procedure actVisualizarDANFeUpdate(Sender: TObject);
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

    procedure DBCtrlGridItensPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure DBCtrlGridPatrimoniosPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure DBCtrlGridServicosPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure edItemCodigoButtonClick(Sender: TObject);
    procedure edPatrimonioCodigoButtonClick(Sender: TObject);
    procedure edPatrimonioCodigoEnter(Sender: TObject);
    procedure edServicoCodigoButtonClick(Sender: TObject);
    procedure edServicoCodigoEnter(Sender: TObject);
    procedure btnAddPatrimonioClick(Sender: TObject);
    procedure ItemEditPanelResize(Sender: TObject);
    procedure PatrimonioEditPanelResize(Sender: TObject);
    procedure ServicoEditPanelResize(Sender: TObject);
    procedure dtsPatrimoniosPedidoDataChange(Sender: TObject; Field: TField);
    procedure dtsItensPedidoDataChange(Sender: TObject; Field: TField);
    procedure dtsServicosDataChange(Sender: TObject; Field: TField);
    procedure edItemContaContabilButtonClick(Sender: TObject);
    procedure deDtInicialExit(Sender: TObject);
    procedure deDtFinalExit(Sender: TObject);
    procedure TcDBComboEdit1ButtonClick(Sender: TObject);
    procedure TcGDIButton3Click(Sender: TObject);

  private
    { Private declarations }
    FKCAD_PATRIMONIO :string;
    procedure SearchEntidade( TextToSearch :string );
    procedure SearchContato( TextToSearch :string );
    procedure SearchComprador( TextToSearch :string );
    procedure SearchProduto( TextToSearch :string );
    procedure SearchServico( TextToSearch :string );
    procedure SearchContaPadrao( TextToSearch :string );
    procedure SearchContaBancaria( TextToSearch :string );
    procedure SearchPatrimonio( TextToSearch :string );
    procedure ChangeFilter;
    procedure GetPatrimonio( KCAD_Patrimonio :string );
    procedure ProcessSuccessInfo ;
    procedure ExibeCamposCheque;

    procedure CheckReadOnlyFields ;
    procedure CheckReadOnlyFieldItens ;

    procedure SearchContaPadraoApagar(const TextToSearch: string);

  protected
    { Protected declarations }
    procedure Pesquisar; override;
  public
    { Public declarations }
    class var KVND_PEDIDO : string ;
    constructor Create( AOwner :TComponent ); override;
  end;

implementation

uses Tc.DBRTL.AbstractDB
   , SearchsFinanceiro
   , UdtmVENDAS_Pedido2
   , UfqrVENDAS_Pedido
   {,  UfrmVENDAS_ImportaOrcamento }
   {, UfdrVENDAS_ComprasPeriodo}
   , UApplResources
   , CLAg5SvcEstoqueProdutos
   , UFin_VendasPorCentroCustoReport
   , ThreadSuppl
   ,  Exceptions
   , DateUtils
   , UFin_VendasPorPeriodoReport
   , UFIN_AnexosWizard, UDBAnexos
   , UDBFinanceiro
   , CLAg5SvcFinanceiroApropriacao
   , CLAg5SvcEstoqueEntradaDadosVendas
   , CLAg5SvcEstoquePatrimonio
   , TypInfo
   , DANFeQR ;


const TipoProduto = 1;
      TipoServico = 3;

{$R *.dfm}

type
  SvcEstoqueEntradaDadosVendasFactory = class( TInterfacedObject, ISvcEstoqueEntradaDadosVendas )
    function Execute(AKVND_PEDIDO : string) : string  ;
  end;


procedure TfrmVENDAS_Pedido.dbcbIS_PatrimonioEnter(Sender: TObject);
begin
  if not( TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.State in [dsInsert, dsEdit]) then
    TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.Edit;
end;

procedure TfrmVENDAS_Pedido.dbceValorParcelaEnter(Sender: TObject);
begin
  dbceValorParcela.SelectAll;
end;

procedure TfrmVENDAS_Pedido.DBCheckBox1Change(Sender: TObject);
begin
  ExibeCamposCheque;
end;

procedure TfrmVENDAS_Pedido.dbContaBancariaButtonClick(Sender: TObject);
begin
  SearchContaPadrao( dbContaBancaria.Text );
end;

procedure TfrmVENDAS_Pedido.dbContaBancariaKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
    begin
      Key := #0;
      dbContaBancaria.DoClick ;
    end;
end;


procedure TfrmVENDAS_Pedido.dbgItensEnter(Sender: TObject);
begin
  if not( TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.State in [dsInsert, dsEdit]) then
    TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.Edit;
end;


procedure TfrmVENDAS_Pedido.dbgItensShowEditor( Sender :TObject; Field :TField; var AllowEdit :Boolean );
begin
(*

  with TJvDBUltimGrid( Sender ), TdtmVENDAS_Pedido( DatamoduleBase ) do
    begin
      // Alterado de acordo com a planilha de testes 20/09/2012
//      if  ( Field = cdsItensPedidoCODIGO ) or ( Field = cdsItensPedidoNOME )
       if ( Field = cdsItensPedidoCUSTO ) or ( Field = cdsItensPedidoQTDE ) then
        AllowEdit := ( not cdsItensPedidoIS_PATRIMONIO.asBoolean );

      if ( Field = cdsItensPedidoUNIDADE ) or ( Field = cdsItensPedidoTOTAL ) then
        AllowEdit := False;
    end;
*)
end;


procedure TfrmVENDAS_Pedido.dbgServicosEnter(Sender: TObject);
begin
  if not( TdtmVENDAS_Pedido( DatamoduleBase ).cdsServicosPedido.State in [dsInsert, dsEdit]) then
    TdtmVENDAS_Pedido( DatamoduleBase ).cdsServicosPedido.Edit;
end;

procedure TfrmVENDAS_Pedido.deDtFinalExit(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

procedure TfrmVENDAS_Pedido.deDtInicialExit(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

procedure TfrmVENDAS_Pedido.dtsFichaDataChange(Sender: TObject; Field: TField);
begin
  if not Assigned(TdtmVENDAS_Pedido( DatamoduleBase )) then
     exit;

  try
    if not Assigned ( Field ) then
       CheckReadOnlyFields ;

    if not Assigned ( Field )
      or (Field = TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoKCAD_ENTIDADE) then
       begin
         Image1.Picture := nil ;
         if not TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoKCAD_ENTIDADE.isNull then
           begin
              edEntidade.Font.Color := clNavy ;
              Image1.Hint := 'Cliente associado ao cadastro.'  ;
              ImageList1.GetBitmap( 0, Image1.Picture.Bitmap )
           end
         else
           begin
              edEntidade.Font.Color := clRed ;
              Image1.Hint := 'Cliente não associado ao cadastro.'
                      +#13#10'Efetue a pesquisa.'  ;
              ImageList1.GetBitmap( 2, Image1.Picture.Bitmap ) ;
           end;
       end;
  except
  end;

end;


procedure TfrmVENDAS_Pedido.dtsParcelasDataChange(Sender: TObject; Field: TField);
begin

  if not Assigned(TdtmVENDAS_Pedido( DatamoduleBase )) then
     exit;

  dbgParcelasAReceber.Height := dbgParcelasAReceber.TitleRowHeight + ( dbgParcelasAReceber.RowsHeight * (dbgParcelasAReceber.DataSource.DataSet.RecordCount + 2) )
end;


procedure TfrmVENDAS_Pedido.dtsItensPedidoDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned( TdtmVENDAS_Pedido( DatamoduleBase ) )
    or Assigned ( Field ) then
     exit ;

  if TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.IsEmpty then
     tbsProdutos.Caption := 'Produtos'
  else if TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.State = dsInsert then
    tbsProdutos.Caption :=
      Format ( 'Produtos (%d/%d)',
       [
         TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.RecordCount + 1
       , TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.RecordCount + 1
       ]
      )
  else
    tbsProdutos.Caption :=
      Format ( 'Produtos (%d/%d)',
       [
         TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.Recno
       , TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.RecordCount
       ]
      ) ;

end;


procedure TfrmVENDAS_Pedido.dtsPatrimoniosPedidoDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned( TdtmVENDAS_Pedido( DatamoduleBase ) )
    or Assigned ( Field ) then
     exit ;

  if TdtmVENDAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.IsEmpty then
     tbsPatrimonios.Caption := 'Patrimônios'
  else if TdtmVENDAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.State = dsInsert then
    tbsPatrimonios.Caption :=
      Format ( 'Patrimônios (%d/%d)',
       [
         TdtmVENDAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.RecordCount + 1
       , TdtmVENDAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.RecordCount + 1
       ]
      )
  else
    tbsPatrimonios.Caption :=
      Format ( 'Patrimônios (%d/%d)',
       [
         TdtmVENDAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.Recno
       , TdtmVENDAS_Pedido( DatamoduleBase ).cdsPatrimoniosPedido.RecordCount
       ]
      ) ;
end;

procedure TfrmVENDAS_Pedido.dtsServicosDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned( TdtmVENDAS_Pedido( DatamoduleBase ) )
    or Assigned ( Field ) then
     exit ;

  if TdtmVENDAS_Pedido( DatamoduleBase ).cdsServicosPedido.IsEmpty then
     tbsServicos.Caption := 'Serviços'
  else if TdtmVENDAS_Pedido( DatamoduleBase ).cdsServicosPedido.State = dsInsert then
    tbsServicos.Caption :=
      Format ( 'Serviços (%d/%d)',
       [
         TdtmVENDAS_Pedido( DatamoduleBase ).cdsServicosPedido.RecordCount + 1
       , TdtmVENDAS_Pedido( DatamoduleBase ).cdsServicosPedido.RecordCount + 1
       ]
      )
  else
    tbsServicos.Caption :=
      Format ( 'Serviços (%d/%d)',
       [
         TdtmVENDAS_Pedido( DatamoduleBase ).cdsServicosPedido.Recno
       , TdtmVENDAS_Pedido( DatamoduleBase ).cdsServicosPedido.RecordCount
       ]
      ) ;
end;

procedure TfrmVENDAS_Pedido.SearchEntidade( TextToSearch :string );
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ), TSearchClienteAtivo.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetEntidade( Result.FieldByName( 'KCAD_ENTIDADE' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;

procedure TfrmVENDAS_Pedido.SearchPatrimonio( TextToSearch :string );
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ), TSearchPatrimonioItem.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        inserePatrimonio( Result.FieldByName( 'KCAD_PATRIMONIO' ).AsString,
                    Result.FieldByName( 'CODIGO' ).AsString,
                    Result.FieldByName( 'DESCRICAO' ).AsString,
                    Result.FieldByName( 'UNIDADE' ).AsString,
                    Result.FieldByName( 'QUANTIDADE' ).AsFloat,
                    Result.FieldByName( 'VALOR_UNITARIO' ).asCurrency, 2,
                    '', ''
                    (* EV-1418 , False *)) ;
    finally
      free;
    end;
end;

(* from compras ....
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
*)


procedure TfrmVENDAS_Pedido.SearchProduto( TextToSearch :string );
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ), TSearchProdutoInsumoAtivo.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        insereItem( Result.FieldByName( 'KEST_PRODUTO' ).AsString,
                    Result.FieldByName( 'CODIGO' ).AsString,
                    Result.FieldByName( 'NOME' ).AsString,
                    Result.FieldByName( 'UNIDADE' ).AsString, 0,
                    Result.FieldByName( 'VALOR_VENDA' ).asCurrency, 1,
                    Result.FieldByName( 'KFIN_PLANOCONTA'  ).asString,
                    Result.FieldByName( 'DESCR_PLANOCONTA' ).asString
                    (* EV-1418 , Result.FieldByName( 'BAIXA_ESTOQUE'    ).asBoolean *)) ;
    finally
      free;
    end;
end;

procedure TfrmVENDAS_Pedido.SearchServico( TextToSearch :string );
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ), TSearchServicoAtivo.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        insereServico( Result.FieldByName( 'KEST_PRODUTO' ).AsString,
                       Result.FieldByName( 'CODIGO' ).AsString,
                       Result.FieldByName( 'NOME' ).AsString,
                       Result.FieldByName( 'UNIDADE' ).AsString,
                       Result.FieldByName( 'CUSTO_MEDIO' ).asCurrency );
    finally
      free;
    end;
end;

procedure TfrmVENDAS_Pedido.ServicoEditPanelResize(Sender: TObject);
var
 LRows : integer ;
begin
  LRows := (DBCtrlGridServicos.Parent.ClientHeight - DBCtrlGridServicos.Top) div TCustomPanel(Sender).Height ;
  DBCtrlGridServicos.Height   := LRows * TCustomPanel(Sender).Height ;
  DBCtrlGridServicos.RowCount := LRows ;
  DBCtrlGridServicos.PanelHeight := TCustomPanel(Sender).Height ;
end;

procedure TfrmVENDAS_Pedido._actEditExecute(Sender: TObject);
begin
  inherited;
  btnAnexos.Enabled := True ;
  ExibeCamposCheque;
end;

procedure TfrmVENDAS_Pedido._actNewExecute(Sender: TObject);
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

procedure TfrmVENDAS_Pedido._actSaveExecute(Sender: TObject);
begin
  TdtmVENDAS_Pedido( DatamoduleBase ).CheckValorAPagar ;

  TdtmVENDAS_Pedido( DatamoduleBase ).CheckPagamentoAVista;
//  ProcessSuccessInfo ;
  inherited;

  btnAnexos.Enabled := True ;
end;

procedure TfrmVENDAS_Pedido._dbgListaDblClick(Sender: TObject);
begin
  inherited;
  btnAnexos.Enabled := True ;
  TdtmVENDAS_Pedido( DatamoduleBase ).CalculaTotais ;
end;

procedure TfrmVENDAS_Pedido._pageControlChange(Sender: TObject);
begin
  inherited;
  if not ( TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedido.State in [dsInsert, dsEdit] ) then
    TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedido.Edit;
end;

procedure TfrmVENDAS_Pedido.edEntidadeButtonClick( Sender :TObject );
begin
  SearchEntidade( TJvDBComboEdit( Sender ).Text );
end;

procedure TfrmVENDAS_Pedido.edEntidadeChange(Sender: TObject);
begin
  if not Assigned(TdtmVENDAS_Pedido( DatamoduleBase )) then
     exit;

  if ( edEntidade.Text <> TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoNOMEENTIDADE.asString )
  and not TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoKCAD_ENTIDADE.isNull then
  TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoKCAD_ENTIDADE.Clear ;
end;

procedure TfrmVENDAS_Pedido.edEntidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
    begin
      Key := #0;
      edEntidade.DoClick ;
    end;
end;

procedure TfrmVENDAS_Pedido.edItemCodigoButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    begin
      showMessage('readonly');
      exit ;
    end;

  if ( not TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedidoIS_PATRIMONIO.asBoolean ) then
    SearchProduto ( TTcDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmVENDAS_Pedido.edItemContaContabilButtonClick(Sender: TObject);
var
  LAPRD : TTiposPlanoAPRD ;
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    begin
       //LAPRD := [ tpReceitas, tpDespesas, tpPassivo ] ;
       LAPRD := [ tpReceitas ] ;

       TdtmVENDAS_Pedido( DatamoduleBase ).PostItem ;

       SvcFinanceiroApropriacaoEdit.ExecuteTela( 'VND_PEDIDO_ITENS',
                                              cdsItensPedido,
                                              cdsApropriacaoItem,
                                              TelaProduto,
                                              LAPRD );

       TdtmVENDAS_Pedido( DatamoduleBase ).EditItem ;
    end;
end;

procedure TfrmVENDAS_Pedido.edNomeContatoButtonClick( Sender :TObject );
begin
  if TJvDBComboEdit( Sender ).Text = 'o mesmo' then
    SearchContato( '' )
  else
    SearchContato( TJvDBComboEdit( Sender ).Text );
end;

procedure TfrmVENDAS_Pedido.edPatrimonioCodigoButtonClick(Sender: TObject);
//var
//   LPatrimonio  : TPatrimonioInfo;
begin
(*
  if edPatrimonioCodigo.Text = '' then
    begin
       //LKPatrimonio := SvcEstoquePatrimonioCadastro.Execute ;
      LPatrimonio.DataCompra := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoDATA_COMPRA.AsDateTime;
      SvcEstoquePatrimonioCadastro.NovoCadastro( LPatrimonio );
      if LPatrimonio.KCAD_PATRIMONIO <> '' then
         TdtmCOMPRAS_Pedido( DatamoduleBase ).CadastraPatrimonio( LPatrimonio ) ;
    end ;
  edPatrimonioCodigo.SelectAll;
*)
end;

procedure TfrmVENDAS_Pedido.edPatrimonioCodigoEnter(Sender: TObject);
//var
//   LPatrimonio  : TPatrimonioInfo;
begin
  if edPatrimonioCodigo.Text = '' then
    begin
       //LKPatrimonio := SvcEstoquePatrimonioCadastro.Execute ;
//      LPatrimonio.DataCompra := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoDATA_COMPRA.AsDateTime;
//      SvcEstoquePatrimonioCadastro.NovoCadastro( LPatrimonio );
//      if LPatrimonio.KCAD_PATRIMONIO <> '' then
//         TdtmCOMPRAS_Pedido( DatamoduleBase ).CadastraPatrimonio( LPatrimonio ) ;
    end ;
  edPatrimonioCodigo.SelectAll;
end;

procedure TfrmVENDAS_Pedido.ExibeCamposCheque;
begin
  dbcheckComCheque.Visible := TdtmVENDAS_Pedido( DatamoduleBase ).cdsAReceberPAGTO_AVISTA.AsBoolean;
  if ( dbcheckComCheque.Visible ) then
    begin
      edtCheque.Visible := True;
      Label15.Visible := True;
    end
  else
    begin
      dbcheckComCheque.Checked := False;
      edtCheque.Clear;
      edtCheque.Visible := False;
      Label15.Visible := False;
    end;

end;

procedure TfrmVENDAS_Pedido.pnlFinanceiroEnter(Sender: TObject);
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    if not ( cdsAReceber.State in [ dsInsert, dsEdit ] ) then
      if cdsAReceber.IsEmpty then
        cdsAReceber.Append
      else
        cdsAReceber.Edit ;
end;

procedure TfrmVENDAS_Pedido.GetPatrimonio( KCAD_Patrimonio :string );
const
  SQL_PATRIMONIO = '';
var
  cds :TClientDataSet;
  p :TParams;
begin
  cds := nil;
  p := TParams.Create;

  p.CreateParam( ftString, 'KCAD_PATRIMNIO', ptInput ).AsString := KCAD_Patrimonio;

  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( cds, SQL_PATRIMONIO, p );

  if cds.IsEmpty then
    Exit;

end;

procedure TfrmVENDAS_Pedido.ItemEditPanelResize(Sender: TObject);
var
 LRows : integer ;
begin
  LRows := (DBCtrlGridItens.Parent.ClientHeight - DBCtrlGridItens.Top) div TCustomPanel(Sender).Height ;
  DBCtrlGridItens.Height   := LRows * TCustomPanel(Sender).Height ;
  DBCtrlGridItens.RowCount := LRows ;
  DBCtrlGridItens.PanelHeight := TCustomPanel(Sender).Height ;
end;

procedure TfrmVENDAS_Pedido.TcDBComboEdit1ButtonClick(Sender: TObject);
begin
  if TTcDBComboEdit ( Sender ).ReadOnly then
    exit ;
  SearchContaPadraoApagar( dbContaBancaria.Text );
end;

procedure TfrmVENDAS_Pedido.TcGDIButton3Click(Sender: TObject);
var
  i : Integer;
  Vencto_mes : TDateTime ;
  Parcela, FDiferenca : Double ;
  totalParcelas  :Double;
begin
  totalParcelas := 0;

  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    begin
      if cdsParcelasAPagar.State in [dsInsert,dsEdit] then
         cdsParcelasAPagar.Cancel ;

      if not cdsParcelasAPagar.IsEmpty then
        begin
          cdsParcelasAPagar.First;
          while not cdsParcelasAPagar.Eof do
            begin
              if not cdsParcelasAPagarPAGTO.IsNull then
                raise Warning.Create('Exite parcela(s) já baixada(s)');

              cdsParcelasAPagar.Delete;
            end;
        end;

      TCdsSuppl.PostIfNeed( cdsPedido );

      if not( cdsAPagar.State in [ dsInsert, dsEdit] ) then
        cdsAPagar.Edit;

      cdsAPagarHISTORICO.asString := Format( 'Nota fiscal de venda: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] );
      cdsAPagarDOCUMENTO.AsString := cdsPedidoNOTA_FISCAL.AsString ;

      if StrToIntDef( edtDia.Text, 0 ) <> 0 then
         Vencto_mes :=  DateUtils.StartOfTheMonth( cdsPedidoDATA_EMISSAO.AsDateTime ) + StrToInt( edtDia.Text ) - 1
      else
         Vencto_mes := DateUtils.StartOfTheDay( cdsPedidoDATA_EMISSAO.AsDateTime ) ;

      if cbProximoMes.Checked then
         Vencto_mes := IncMonth( Vencto_mes, 1 ) ;

      Parcela  := RoundTo( cdsPedidoTOTAL_NOTA.AsFloat / StrToInt( edtParcelas.Text ), -2 );

      if not ( cdsParcelasAPagar.State in [ dsInsert, dsEdit ] ) then
        cdsParcelasAPagar.Edit;

      for i := 0 to StrToInt( edtParcelas.Text ) - 1 do
        begin
          cdsParcelasAPagar.Append;

          if Vencto_mes < cdsPedidoDATA_EMISSAO.AsDateTime then
            cdsParcelasAPagarVENCTO.AsDateTime := cdsPedidoDATA_EMISSAO.AsDateTime
          else
            cdsParcelasAPagarVENCTO.AsDateTime := Vencto_mes  ;

          cdsParcelasAPagarVALOR.AsFloat       := Parcela;

          if not ( cdsParcelasAPagarKFIN_CONTA.IsNull) or ( cdsParcelasAPagarKFIN_CONTA.AsString <> EmptyStr ) then
            begin
              cdsParcelasAPagarKFIN_CONTA.AsString := cdsParcelasAPagarKFIN_CONTA.AsString;
              cdsParcelasAPagarNOMECONTA.AsString  := cdsParcelasAPagarNOMECONTA.AsString;
            end;

          Vencto_mes := IncMonth( Vencto_mes, 1 ) ;

          cdsParcelasAPagarPAGTO.Clear;
          if ( cdsParcelasAPagarCHEQUE.asBoolean ) or ( not cdsAPagarPAGTO_AVISTA.AsBoolean ) then
            cdsParcelasAPagarDT_COMPENSACAO.Clear;

        end;

      totalParcelas := totalParcelas + cdsParcelasAPagarVALOR.AsFloat;
      cdsParcelasAPagar.Post;

      if TryVarToFloat ( cdsParcelasAPagarSomaValor.Value ) <> cdsPedidoTOTAL_NOTA.AsFloat then
        begin
          FDiferenca := cdsPedidoTOTAL_NOTA.AsFloat - TryVarToFloat ( cdsParcelasAPagarSomaValor.Value ) ;
          cdsParcelasAPagar.First;
          cdsParcelasAPagar.Edit;
          cdsParcelasAPagarVALOR.AsFloat := cdsParcelasAPagarVALOR.AsFloat + FDiferenca;
          cdsParcelasAPagar.Post;
        end;

      cdsParcelasAPagar.First;
      cdsParcelasAPagar.EnableControls;
    end;

  dbgParcelasAPagar.SetFocus;
  dbgParcelasAPagar.SelectedIndex := 0 ;
end;

procedure TfrmVENDAS_Pedido.SearchContaPadraoApagar(const TextToSearch: string);
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetContaPreferencialApagar( Result.FieldByName( 'KFIN_CONTA' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;


procedure TfrmVENDAS_Pedido.TcMPFormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  with _ScrollBoxFicha.VertScrollBar Do
    begin
      if ( Position <= ( Range - Increment ) ) Then
        Position := Position + Increment
      else
        Position := Range - Increment;
    end;
end;

procedure TfrmVENDAS_Pedido.TcMPFormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  with _ScrollBoxFicha.VertScrollBar do
    begin
      if ( Position >= Increment ) then
        Position := Position - Increment
      else
        Position := 0;
    End;
end;

procedure TfrmVENDAS_Pedido.TodasNotasClick(Sender: TObject);
var
  RParams : ReportTypes.TReportParamsVENDAS_Periodo;
begin
  RParams := TReportParamsVENDAS_Periodo.Create;
  RParams.TODOS_ENTIDADE := True;
  TFin_VendasPorCentroCustoReport.Execute( RParams );
  RParams.Free ;
end;

procedure TfrmVENDAS_Pedido.dbgParcelasAReceberEditButtonClick( Sender :TObject );
begin
  with dbgParcelasAReceber, TdtmVENDAS_Pedido( DatamoduleBase ) do
    if ( SelectedField = cdsParcelasNOMECONTA ) then
             SearchContaBancaria( InplaceEditor.Text );
end;

procedure TfrmVENDAS_Pedido.dbgParcelasAReceberKeyPress(Sender: TObject; var Key: Char);
begin
  with dbgParcelasAReceber, TdtmVENDAS_Pedido( DatamoduleBase ) do
    begin
      if ( Key = #13 ) and Assigned( InplaceEditor ) and ( InplaceEditor.Visible ) then
        begin
          Key := #0;
          if ( SelectedField = cdsParcelasNOMECONTA ) then
            SearchContaBancaria( InplaceEditor.Text );
        end;
    end;
end;

procedure TfrmVENDAS_Pedido.PatrimonioEditPanelResize(Sender: TObject);
var
 LRows : integer ;
begin
  LRows := (DBCtrlGridPatrimonios.Parent.ClientHeight - DBCtrlGridPatrimonios.Top) div TCustomPanel(Sender).Height ;
  DBCtrlGridPatrimonios.Height   := LRows * TCustomPanel(Sender).Height ;
  DBCtrlGridPatrimonios.RowCount := LRows ;
  DBCtrlGridPatrimonios.PanelHeight := TCustomPanel(Sender).Height ;
end;

procedure TfrmVENDAS_Pedido.Pesquisar;
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ), TSearchPedidoVenda.Create do
    try
      SetFiltro( deDtInicial.Date, deDtFinal.Date, BoolToChar( not cbxInativos.Checked ) );
      TextToFind := _edtSearch.Text;
      if Execute then
        begin
          cdsLstPedidos.Locate( 'KVND_PEDIDO', Result.FieldByName( 'KVND_PEDIDO' ).Value, [ ] );
          ActiveFicha;
        end;
    finally
      free;
    end;
end;

procedure TfrmVENDAS_Pedido.ProcessSuccessInfo;
begin
// checkNS
//  NotificationService.NotifyStr( self, 'PROCESS_' + ClassName );
end;

procedure TfrmVENDAS_Pedido.edCompradorButtonClick( Sender :TObject );
begin
  SearchComprador( TJvDBComboEdit( Sender ).Text );
end;

procedure TfrmVENDAS_Pedido.SearchContaBancaria(TextToSearch: string);
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetConta( Result.FieldByName( 'KFIN_CONTA' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;

procedure TfrmVENDAS_Pedido.SearchContaPadrao( TextToSearch :string );
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetContaPreferencial( Result.FieldByName( 'KFIN_CONTA' ).AsString, Result.FieldByName( 'NOME' ).AsString );
    finally
      free;
    end;
end;

procedure TfrmVENDAS_Pedido.SearchContato( TextToSearch :string );
var
  Key :integer;
  NomeContato, Depto, Email, Fone :string;
begin
  {
    with TSearchContatoEntidade.Create do
    begin
    Params.CreateParam( ftInteger, 'KCAD_ENTIDADE', ptInput ).asInteger := TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoKCAD_ENTIDADE.asInteger ;
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

    TdtmVENDAS_Pedido( DatamoduleBase ).SetContato ( Key, NomeContato, Depto, Email, Fone ) ;
    }
end;

procedure TfrmVENDAS_Pedido.SearchComprador( TextToSearch :string );
var
  Key :integer;
  NomeEntidade :string;

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

    TdtmVENDAS_Pedido( DatamoduleBase ).SetComprador ( Key, NomeEntidade ) ;
    }
end;

procedure TfrmVENDAS_Pedido.actPrintPedidoFolhaTimbradoExecute( Sender :TObject );
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    TfqrVENDAS_Pedido.Preview( cdsLstPedidosKVND_PEDIDO.asInteger, tfPapelTimbrado, False );

end;

procedure TfrmVENDAS_Pedido.actPrintPedidoPapelBrancoExecute( Sender :TObject );
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    TfqrVENDAS_Pedido.Preview( cdsLstPedidosKVND_PEDIDO.asInteger, tfPapelBranco, True );
end;

procedure TfrmVENDAS_Pedido.actPrintPedidoEmailExecute( Sender :TObject );
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    TfqrVENDAS_Pedido.Preview( cdsLstPedidosKVND_PEDIDO.asInteger, tfEstilizado, False );
end;

procedure TfrmVENDAS_Pedido.actPrintPedidoMatricialExecute( Sender :TObject );
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    TfqrVENDAS_Pedido.Preview( cdsLstPedidosKVND_PEDIDO.asInteger, tfPapelBranco, False );
end;

procedure TfrmVENDAS_Pedido.actPrintReciboExecute( Sender :TObject );
begin
  // with TdtmVENDAS_Pedido( DatamoduleBase ) do
  // TfqrVENDAS_Recibo.Preview(cdsLstPedidosKVND_PEDIDO.asInteger);
end;

procedure TfrmVENDAS_Pedido.actSalvarXMLNFeExecute(Sender: TObject);
var
 L : THandle ;
 LFileName : string ;
begin

 with TdtmVENDAS_Pedido( DatamoduleBase ) do
      LFileName := 'NFe-' + cdsPedidoCHAVENFE.asString + '.xml' ;

  JvSaveDialog1.FileName := LFileName ;
  if JvSaveDialog1.Execute then
    begin
     if FileExists ( JvSaveDialog1.FileName ) then
       if not DeleteFile( JvSaveDialog1.FileName ) then
         Raise Fail.Create( 'Não foi possível salvar o arquivo. '
             +#13#10'Verifique se o arquivo está sendo utilizado por outro processo.' ) ;
     TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoXML_NFE.SaveToFile ( LFileName ) ;
     MessageDlg ( 'XML salvo em :' + JvSaveDialog1.FileName ) ;
    end;
end;

procedure TfrmVENDAS_Pedido.actSalvarXMLNFeUpdate(Sender: TObject);
begin
  actSalvarXMLNFe.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoXML_NFE.isNull) ;
end;

type
   TPreviewDANFe = procedure ( AKey : PChar ) ; stdcall ;

procedure TfrmVENDAS_Pedido.actVisualizarDANFeExecute(Sender: TObject);
var
 L : THandle ;
 LPreviewDANFe : TPreviewDANFe ;
 LFileName : string ;
begin
(*
 L := LoadLibrary('TCDANFeDLL.dll') ;
 if L = 0 then
   exit;

 with TdtmVENDAS_Pedido( DatamoduleBase ) do
   begin
      LFileName := TcTempFolderFactory.TempPath + cdsPedidoCHAVENFE.asString + '.xml' ;
      cdsPedidoXML_NFE.SaveToFile ( LFileName ) ;
   end ;

 LPreviewDANFe := GetProcAddress( L, 'PreviewDANFe');
 LPreviewDANFe( PChar( LFileName ) );
 FreeLibrary( L ) ;
*)

 with TdtmVENDAS_Pedido( DatamoduleBase ) do
   begin
      LFileName := TcTempFolderFactory.TempPath + cdsPedidoCHAVENFE.asString + '.xml' ;
      cdsPedidoXML_NFE.SaveToFile ( LFileName ) ;
   end ;

 DANFeQR.TfqrDANFeQR.PrintFromFile( LFileName );
end;

procedure TfrmVENDAS_Pedido.actVisualizarDANFeUpdate(Sender: TObject);
begin
  actVisualizarDANFe.Enabled := Assigned ( DatamoduleBase )
                    and (TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoMODELO_NFE.asInteger = 55)
                    and  (not TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoXML_NFE.isNull) ;
end;

procedure TfrmVENDAS_Pedido.btbProgramarClick( Sender :TObject );
var
  i : Integer;
  Vencto_mes : TDateTime ;
  Parcela, FDiferenca : Double ;
  LValorTotal, totalParcelas  :Double;
begin
  totalParcelas := 0;

  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    begin
      if cdsParcelas.State in [dsInsert,dsEdit] then
         cdsParcelas.Cancel ;

      if not cdsParcelas.IsEmpty then
        begin
          cdsParcelas.First;
          while not cdsParcelas.Eof do
            begin
              if not cdsParcelasPAGTO.IsNull then
                raise Warning.Create('Exite parcela(s) já baixada(s)');

              cdsParcelas.Delete;
            end;
        end;

      TCdsSuppl.PostIfNeed( cdsPedido );

      if not( cdsAReceber.State in [ dsInsert, dsEdit] ) then
        cdsAReceber.Edit;

      cdsAReceberHISTORICO.asString := Format( 'Nota fiscal de venda: (%s)', [ cdsPedidoNOTA_FISCAL.AsString ] );
      cdsAReceberDOCUMENTO.AsString := cdsPedidoNOTA_FISCAL.AsString ;

      if StrToIntDef( edtDia.Text, 0 ) <> 0 then
         Vencto_mes :=  DateUtils.StartOfTheMonth( cdsPedidoDATA_EMISSAO.AsDateTime ) + StrToInt( edtDia.Text ) - 1
      else
         Vencto_mes := DateUtils.StartOfTheDay( cdsPedidoDATA_EMISSAO.AsDateTime ) ;

      if cbProximoMes.Checked then
         Vencto_mes := IncMonth( Vencto_mes, 1 ) ;

      LValorTotal := cdsPedidoTOTAL_NOTA.AsFloat  - cdsPedidoVALOR_DEDUCOES.AsFloat ;

      Parcela  := RoundTo( LValorTotal / StrToInt( edtParcelas.Text ), -2 );

      if not ( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
        cdsParcelas.Edit;

      for i := 0 to StrToInt( edtParcelas.Text ) - 1 do
        begin
          cdsParcelas.Append;

          if Vencto_mes < cdsPedidoDATA_EMISSAO.AsDateTime then
            cdsParcelasVENCTO.AsDateTime := cdsPedidoDATA_EMISSAO.AsDateTime
          else
            cdsParcelasVENCTO.AsDateTime := Vencto_mes  ;

          cdsParcelasVALOR.AsFloat       := Parcela;

          if not ( cdsParcelasKFIN_CONTA.IsNull) or ( cdsParcelasKFIN_CONTA.AsString <> EmptyStr ) then
            begin
              cdsParcelasKFIN_CONTA.AsString := cdsParcelasKFIN_CONTA.AsString;
              cdsParcelasNOMECONTA.AsString  := cdsParcelasNOMECONTA.AsString;
            end;

          if cbAnual.Checked then
            Vencto_mes := IncMonth( Vencto_mes, 12 )
          else
            Vencto_mes := IncMonth( Vencto_mes, 1 ) ;

          cdsParcelasPAGTO.Clear;
          if ( cdsParcelasCHEQUE.asBoolean ) or ( not cdsAReceberPAGTO_AVISTA.AsBoolean ) then
            cdsParcelasDT_COMPENSACAO.Clear;

        end;

      totalParcelas := totalParcelas + cdsParcelasVALOR.AsFloat;
      cdsParcelas.Post;

      if TryVarToFloat ( cdsParcelasSomaValor.Value ) <> LValorTotal then
        begin
          FDiferenca := LValorTotal - TryVarToFloat ( cdsParcelasSomaValor.Value ) ;
          cdsParcelas.First;
          cdsParcelas.Edit;
          cdsParcelasVALOR.AsFloat := cdsParcelasVALOR.AsFloat + FDiferenca;
          cdsParcelas.Post;
        end;

      cdsParcelas.First;
      cdsParcelas.EnableControls;
    end;

  dbgParcelasAReceber.SetFocus;
  dbgParcelasAReceber.SelectedIndex := 0 ;
end;

procedure TfrmVENDAS_Pedido.btnRemoveParcelaClick(Sender: TObject);
begin
  if TdtmVENDAS_Pedido( DatamoduleBase ).cdsParcelas.IsEmpty then
    Exit;

  if not( TdtmVENDAS_Pedido( DatamoduleBase ).cdsParcelas.state in [dsInsert, dsEdit] ) then
    TdtmVENDAS_Pedido( DatamoduleBase ).cdsParcelas.Edit ;

  TdtmVENDAS_Pedido( DatamoduleBase ).cdsParcelas.Delete;
end;


procedure TfrmVENDAS_Pedido.btnAdicionaParcelaClick(Sender: TObject);
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    begin
      if not( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
        cdsParcelas.Edit;

      cdsParcelas.Append;
    end;
end;

procedure TfrmVENDAS_Pedido.btnAdicionaServicoClick(Sender: TObject);
begin
  if not( dtsServicos.DataSet.State in [ dsInsert, dsEdit ] ) then
    dtsServicos.DataSet.Edit ;

//  dtsServicos.DataSet.Append ;
//  dbgServicos.SetFocus ;
//  dbgServicos.SelectedIndex := 0;
end;

procedure TfrmVENDAS_Pedido.btnAnexosClick(Sender: TObject);
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    TFIN_AnexosWizard.ExecuteWizard( 'VND_PEDIDOS', cdsPedidoKVND_PEDIDO.AsString );
end;



procedure TfrmVENDAS_Pedido.btnAddPatrimonioClick(Sender: TObject);
var
  LPatrimonioInfo : TPatrimonioInfo ;
begin
  SvcEstoquePatrimonioCadastro.NovoCadastro( LPatrimonioInfo );
end;

procedure TfrmVENDAS_Pedido.btnAddProdutoClick( Sender :TObject );
var
  ProdutoInfo : TProdutoInfo ;
begin
  ProdutoInfo.TipoProduto := tpProduto ;
  SvcEstoqueProdutosCadastro.NovoCadastro( ProdutoInfo );
end;

procedure TfrmVENDAS_Pedido.btnAddServicoClick( Sender :TObject );
var
  ProdutoInfo : TProdutoInfo ;
begin
  ProdutoInfo.TipoProduto := tpServico ;
  SvcEstoqueProdutosCadastro.NovoCadastro( ProdutoInfo );
end;

procedure TfrmVENDAS_Pedido.cbxInativosClick( Sender :TObject );
begin
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

procedure TfrmVENDAS_Pedido.ChangeFilter;
begin
  TdtmVENDAS_Pedido( DatamoduleBase ).SetFilter( cbxInativos.Checked, deDtInicial.Date, deDtFinal.Date );
end;


procedure TfrmVENDAS_Pedido.CheckReadOnlyFields;
var
 LReadOnly : boolean ;
 LParcelaBaixada : boolean ;
begin


//  LParcelaBaixada := TdtmVENDAS_Pedido(DatamoduleBase).ParcelaBaixada ;
  LReadOnly := TdtmVENDAS_Pedido(DatamoduleBase).cdsPedidoIMPORTADO_NFE.asBoolean  ;

//  dbNotaFiscal.ReadOnly   := LReadOnly ;
//  dbSerie.ReadOnly        := LReadOnly ;
//  dbDataCompra.ReadOnly   := LReadOnly ;
//  dbDataEmissao.ReadOnly  := LReadOnly ;
//  dbDataEntrada.ReadOnly  := LReadOnly ;
  edEntidade.ReadOnly     := LReadOnly ;
  dbcbStatus.ReadOnly     := LReadOnly ;
  dbImpostos.ReadOnly     := LReadOnly ;
  dbDescontos.ReadOnly    := LReadOnly ;
//  dbFrete.ReadOnly        := LReadOnly ;
  dbChaveNFe.ReadOnly     := LReadOnly ;

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

procedure TfrmVENDAS_Pedido.CheckReadOnlyFieldItens;
var
 LReadOnly : boolean ;
begin
  LReadOnly := TdtmVENDAS_Pedido(DatamoduleBase).cdsPedidoIMPORTADO_NFE.asBoolean  ;
(*
  dbcbPatrimonio.Enabled         := not LReadOnly ;
  edItemCodigo.Enabled           := not LReadOnly ;
  edItemCFOP.ReadOnly            := LReadOnly ;
  cbxItemUnidadeCompra.Enabled   := not LReadOnly ;

  edItemQtdeCompra.ReadOnly      := LReadOnly ;
  edItemValorUnit.ReadOnly       := LReadOnly ;
  edItemDesconto.ReadOnly        := LReadOnly ;
  edItemFrete.ReadOnly           := LReadOnly ;

  cbxItemUnidadeEstoque.Enabled := not LReadOnly
                                 and TdtmVENDAS_Pedido(DatamoduleBase).cdsItensPedidoKEST_PRODUTO.isNull ;

  edItemUnitarioEstoque.ReadOnly := LReadOnly ;


  if LReadOnly then
   cbxItemUnidadeCompra.Style := csSimple
  else
   cbxItemUnidadeCompra.Style := csDropDown ;
*)
end;



constructor TfrmVENDAS_Pedido.Create( AOwner :TComponent );
begin
  inherited;

  deDtInicial.OnChange := nil ;
  deDtFinal.OnChange := nil ;


  deDtInicial.Date := StartOfTheMonth( Date ) ;
  deDtFinal.Date   := EndOfTheMonth( Date ) ;

  TdtmVENDAS_Pedido.Create( self );

  TdtmVENDAS_Pedido( DatamoduleBase ).KVND_PEDIDO := TfrmVENDAS_Pedido.KVND_PEDIDO ;

  dtsLista.DataSet              := TdtmVENDAS_Pedido( DatamoduleBase ).cdsLstPedidos ;
  dtsFicha.DataSet              := TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedido ;
  dtsItensPedido.DataSet        := TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido ;
  dtsServicos.DataSet           := TdtmVENDAS_Pedido( DatamoduleBase ).cdsServicosPedido ;
  dtsDadosEntidade.DataSet      := TdtmVENDAS_Pedido( DatamoduleBase ).cdsDadosEntidade ;
  dtsAReceber.DataSet           := TdtmVENDAS_Pedido( DatamoduleBase ).cdsAReceber ;
  dtsParcelas.DataSet           := TdtmVENDAS_Pedido( DatamoduleBase ).cdsParcelas ;
  //dtsPagtoTransporte.DataSet    := TdtmVENDAS_Pedido( DatamoduleBase ).cdsAReceberTransporte ;
  //dtsParcelasTransporte.DataSet := TdtmVENDAS_Pedido( DatamoduleBase ).cdsParcelasTransporte ;

  if KVND_PEDIDO <> '' then
    _pageControl.ActivePage := _tbsFicha ;

  KVND_PEDIDO := '' ;

  ItemEditPanel.FDBCtrlGrid       := DBCtrlGridItens ;

  DatamoduleBase.OpenTables;
  ChangeFilter;

  PageControl1.ActivePageIndex := 0 ;

  ExibeCamposCheque;

end;

procedure TfrmVENDAS_Pedido.actCopiarPedidoExecute( Sender :TObject );
begin

  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    if MessageDlg( 'Deseja gerar uma cópia do pedido: #%s.', [ cdsLstPedidosNOTA_FISCAL.AsString ], mtConfirmation,
      [ mbYes, mbNo ] ) <> mrYes then
      Exit;

  self.ActiveFicha;

  TdtmVENDAS_Pedido( DatamoduleBase ).ClonePedido;

end;

procedure TfrmVENDAS_Pedido.actImportarNFeExecute(Sender: TObject);
//var
//  LNFeInfo : TNFeInfo ;
begin

//  if TfrmImportNFeCompra.Execute ( LNFeInfo ) then
//     TdtmVENDAS_Pedido( DatamoduleBase ).InsereFromNFe( LNFeInfo );

end;



procedure TfrmVENDAS_Pedido.actImportarNFeUpdate(Sender: TObject);
begin

    actImportarNFe.Enabled := False ;
    (*
    actImportarNFe.Enabled := Assigned ( DatamoduleBase )
                    and  (TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedido.State in [dsInsert,dsEdit])
                    and  (    TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.Bof
                          and TdtmVENDAS_Pedido( DatamoduleBase ).cdsItensPedido.Eof ) ;
    *)
end;


procedure TfrmVENDAS_Pedido.actAddItemProdutoExecute(Sender: TObject);
begin
  if not( dtsItensPedido.DataSet.State in [ dsInsert, dsEdit ] ) then
    dtsItensPedido.DataSet.Edit ;

  dtsItensPedido.DataSet.Append ;
  edItemCodigo.SetFocus ;
end;

procedure TfrmVENDAS_Pedido.actAddItemProdutoUpdate(Sender: TObject);
begin
    actAddItemProduto.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoIMPORTADO_NFE.AsBoolean) ;
end;

procedure TfrmVENDAS_Pedido.actRemoveItemProdutoExecute(Sender: TObject);
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    begin
      if cdsItensPedido.isEmpty then
        Exit;

      if not ( cdsPedido.State in [dsInsert, dsEdit] ) then
        cdsItensPedido.Edit;

      cdsItensPedido.Delete;
    end;
end;

procedure TfrmVENDAS_Pedido.actRemoveItemProdutoUpdate(Sender: TObject);
begin
    actRemoveItemServico.Enabled := Assigned ( DatamoduleBase )
                    and  (not TdtmVENDAS_Pedido( DatamoduleBase ).cdsPedidoIMPORTADO_NFE.AsBoolean)
end;


procedure TfrmVENDAS_Pedido.actAddItemServicoExecute(Sender: TObject);
begin
  //
end;

procedure TfrmVENDAS_Pedido.actAddItemServicoUpdate(Sender: TObject);
begin
  //
end;

procedure TfrmVENDAS_Pedido.actRemoveItemServicoExecute(Sender: TObject);
begin
  with TdtmVENDAS_Pedido( DatamoduleBase ) do
    begin
      if cdsServicosPedido.IsEmpty then
        Exit;

      if not( cdsServicosPedido.state in [dsInsert, dsEdit] ) then
        cdsServicosPedido.Edit;

      cdsServicosPedido.Delete;
    end;
end;

procedure TfrmVENDAS_Pedido.actRemoveItemServicoUpdate(Sender: TObject);
begin
  //
end;


procedure TfrmVENDAS_Pedido.actAddPatrimonioExecute(Sender: TObject);
begin
  //
end;

procedure TfrmVENDAS_Pedido.actAddPatrimonioUpdate(Sender: TObject);
begin
  //
end;

procedure TfrmVENDAS_Pedido.actRemovePatrimonioExecute(Sender: TObject);
begin
  //
end;

procedure TfrmVENDAS_Pedido.actRemovePatrimonioUpdate(Sender: TObject);
begin
  //
end;


procedure TfrmVENDAS_Pedido.actImportarOrcamentoExecute( Sender :TObject );
begin
  // if TfrmVENDAS_ImportaOrcamento.Execute ( TdtmVENDAS_Pedido( DatamoduleBase ) ) then
  // self.ActiveFicha ;
end;

procedure TfrmVENDAS_Pedido.actPrintPorPeriodoExecute(Sender: TObject);
var
  Parameters : ReportTypes.TReportParamsVENDAS_Periodo ;
begin
  Parameters := TReportParamsVENDAS_Periodo.Create ;
  Parameters.StartDate   := deDtInicial.Date ;
  Parameters.EndDate     := deDtFinal.Date ;
  Parameters.ReportTitle := 'Vendas por período';
  TFin_VendasPorPeriodoReport.ExecuteDialog( Parameters );
  Parameters.Free ;
end;

procedure TfrmVENDAS_Pedido.actPrintNFCentroCustoExecute( Sender :TObject );
var
  Parameters : ReportTypes.TReportParamsVENDAS_Periodo;
begin
  Parameters := TReportParamsVENDAS_Periodo.Create;
  Parameters.StartDate   := deDtInicial.Date ;
  Parameters.EndDate     := deDtFinal.Date ;
  Parameters.ReportTitle := 'Notas fiscais de vendas por centro de custo';
  TFin_VendasPorCentroCustoReport.ExecuteDialog( Parameters );
  Parameters.Free ;
end;

procedure TfrmVENDAS_Pedido.actPrintNFCentroCustoUpdate( Sender :TObject );
begin
  // actPrintComprasPeriodo.Enabled := LoggedUser.KUser <= 1 ;
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


procedure TfrmVENDAS_Pedido.DBCtrlGridItensPaintPanel(DBCtrlGrid: TDBCtrlGrid;
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
//     for LControlIdx := 0 to ItemLayout1.ControlCount -1 do
//         ItemLayout1.Controls [ LControlIdx ].Width := ItemLayout1.Width ;

     edItemCodigo.Button.Visible := False ;
     edItemCodigo.Button.Visible := True ;

     edItemContaContabil.Button.Visible := False ;
     edItemContaContabil.Button.Visible := True ;

     lblUnidadeItem.Left        := cbxItemUnidadeCompra.Left   + 5 ;
     lblQtdeItem.Left           := edItemQtdeCompra.Left       + 5 ;
     lblValorUnitarioItem.Left  := edItemValorUnit.Left        + 5 ;
     lblTotalItem.Left          := edItemTotal.Left            + 5 ;
     lblContaContabilItem.Left  := edItemContaContabil.Left    + 5 ;

     exit ;
   end ;

  &Do ( DBCtrlGrid, LCtrlPanel, edItemCodigo           ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, cbxItemUnidadeCompra   ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edItemQtdeCompra       ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edItemValorUnit        ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edItemContaContabil    ) ;
  &Do ( DBCtrlGrid, LCtrlPanel, edItemTotal            ) ;
end;



procedure TfrmVENDAS_Pedido.DBCtrlGridPatrimoniosPaintPanel(DBCtrlGrid: TDBCtrlGrid;
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


procedure TfrmVENDAS_Pedido.DBCtrlGridServicosPaintPanel(
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


{ SvcEstoqueEntradaDadosVendasFactory }
function SvcEstoqueEntradaDadosVendasFactory.Execute(AKVND_PEDIDO : string) : string  ;
begin
   TfrmVENDAS_Pedido.KVND_PEDIDO := AKVND_PEDIDO ;
   with TfrmVENDAS_Pedido.Create ( nil ) do
     try
       ShowModal ;
     finally
       Free ;
     end;
end;

procedure TfrmVENDAS_Pedido.edServicoCodigoButtonClick(Sender: TObject);
//var
//   LServico  : TServicoInfo;
begin
  if edServicoCodigo.Text = '' then
    begin
       //LKServico := SvcEstoqueServicoCadastro.Execute ;
//      LServico.DataCompra := TdtmCOMPRAS_Pedido( DatamoduleBase ).cdsPedidoDATA_COMPRA.AsDateTime;
//      SvcEstoqueServicoCadastro.NovoCadastro( LServico );
//      if LServico.KCAD_Servico <> '' then
//         TdtmCOMPRAS_Pedido( DatamoduleBase ).CadastraServico( LServico ) ;
    end ;
  edServicoCodigo.SelectAll;
end;

procedure TfrmVENDAS_Pedido.edServicoCodigoEnter(Sender: TObject);
//var
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
  RegisterClass( TfrmVENDAS_Pedido );
  SvcEstoqueEntradaDadosVendas := SvcEstoqueEntradaDadosVendasFactory.Create ;

finalization
  SvcEstoqueEntradaDadosVendas := nil ;
end.
