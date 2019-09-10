// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Cadastros
// Funcionality : Cadastro de Produtos
//
// License      : veja readme.txt





unit UfrmEST_Produtos;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvExControls,
  VCL.Menus, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, JvErrorIndicator, JvValidators,
  JvComponentBase, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, SysFormListaFicha, ReportTypes, VCL.DBCtrls, JvBaseEdits,
  JvDBControls, JvExStdCtrls, JvCombobox, JvDBCombobox, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, VCL.ImgList, JvDBLookup, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, System.Actions, System.ImageList,
  CLAg5SvcEstoqueProdutos, Tc.VCL.Extended.Mask, Tc.VCL.Application,
  uImageListProvider, Wrappers, Vcl.WinXCtrls, Tc.VCL.Controls.GDIButton ;

type
  TfrmEST_Produtos = class(T_FormListaFicha)
    Label3: TLabel;
    dbNome: TDBEdit;
    Label4: TLabel;
    Label24: TLabel;
    dbcbStatus: TJvDBComboBox;
    Label8: TLabel;
    dbcbProdInsuServ: TJvDBComboBox;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    dbcbBaixaEstoque: TJvDBComboBox;
    dbQtdeMinima: TJvDBCalcEdit;
    Label7: TLabel;
    dbValorVenda: TJvDBCalcEdit;
    gbValorInicial: TGroupBox;
    Label5: TLabel;
    dbCustoInicial: TJvDBCalcEdit;
    dbQtdeInicial: TJvDBCalcEdit;
    Label2: TLabel;
    cbxInativos: TCheckBox;
    dbeCodigo: TDBEdit;
    Label1: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    llTipoProduto: TLabel;
    llUnidade: TLabel;
    dblkUnidade: TJvDBLookupCombo;
    dblcTipoProduto: TJvDBLookupCombo;
    dtsLstUnidades: TDataSource;
    dtsLstTipoProduto: TDataSource;
    actPrintProdutos: TAction;
    actPrintInsumos: TAction;
    actPrintServicos: TAction;
    actPrintPorGrupo: TAction;
    Produtos1: TMenuItem;
    Insumos1: TMenuItem;
    Servios1: TMenuItem;
    PorGrupo1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    actProdutoInsumo: TAction;
    ProdutosInsumos1: TMenuItem;
    N3: TMenuItem;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    Label15: TLabel;
    DBText5: TDBText;
    Label16: TLabel;
    JvDBDateEdit1: TTcDBDateEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    N4: TMenuItem;
    Relaodeprodutosparainventrio1: TMenuItem;
    actInventario: TAction;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    Código: TLabel;
    Classificação: TLabel;
    dbtCodigoConta: TDBText;
    dtbClassificacao: TDBText;
    JvDBComboEdit1: TJvDBComboEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label18: TLabel;
    Label19: TLabel;
    tbsJunction: TTabSheet;
    Button1: TSpeedButton;
    actProductJunction: TAction;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsJunctionProdutos: TDataSource;
    SplitView1: TSplitView;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    _pnlFooter: TJvPanel;
    Image1: TImage;
    _btbExecute: TTcGDIButton;
    actProcessJunction: TAction;
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue,
      StringForFalse: string): Boolean;
    procedure cbxInativosClick(Sender: TObject);
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure llTipoProdutoClick(Sender: TObject);
    procedure llUnidadeClick(Sender: TObject);
    procedure dblkUnidadeChange(Sender: TObject);
    procedure actPrintProdutosExecute(Sender: TObject);
    procedure actPrintInsumosExecute(Sender: TObject);
    procedure actPrintServicosExecute(Sender: TObject);
    procedure actPrintPorGrupoExecute(Sender: TObject);
    procedure actProdutoInsumoExecute(Sender: TObject);
    procedure cbxServicosClick(Sender: TObject);
    procedure actInventarioExecute(Sender: TObject);
    procedure dbValorVendaButtonClick(Sender: TObject);
    procedure dbValorVendaKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBComboEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBComboEdit1ButtonClick(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure _actNewExecute(Sender: TObject);
    procedure dbcbProdInsuServChange(Sender: TObject);
    procedure dblcTipoProdutoChange(Sender: TObject);
    procedure actProductJunctionExecute(Sender: TObject);
    procedure actProductJunctionUpdate(Sender: TObject);
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure JvDBUltimGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure SplitView1Opened(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure actProcessJunctionExecute(Sender: TObject);
    procedure actProcessJunctionUpdate(Sender: TObject);
  private
    { Private declarations }
    procedure checkCC ;
    procedure ValidaCampos;
    procedure ValidaCamposServico;
    procedure NeedRefresh ( Sender : TObject ) ;
    procedure SearchPlanoConta( TextToSearch: string );
    procedure ShowNewFastRegister(Sender: TObject);
  protected
    { Protected declarations }
    procedure ChangeFilter ;
    procedure Pesquisar ; override ;
  public
    { Public declarations }
    class procedure ExecuteNewFastRegister;
    class procedure NovoCadastro(var AProdutoInfo : TProdutoInfo ) ;
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
  end;

implementation

uses SearchsFinanceiro
   , Math
, (*SearchsEntidades, *)ThreadSuppl, UdtmEST_Produtos,
    UDBEntidades, UEST_ProdutosInsumosReport, UEST_ServicosReport,
    ///CLAg5SvcEntidadesCadastroTipos,
    CLAg5SvcEstoqueCadastroTipos,// UCAD_TiposWizard,  UCAD_TiposFinanceiroWizard,
    UFIN_InventarioProdutosReport ,
    NewFastRegisterIntf,
    CLAg5SvcFinanceiroApropriacao ;

{$R *.dfm}


type
  SvcEstoqueProdutosCadastroFactory = class( TInterfacedObject, ISvcEstoqueProdutosCadastro )
    procedure NovoCadastro( var AProdutoInfo : TProdutoInfo ) ;
  end;

  SvcProdutoInsumoServicoNewFastRegisterFactory = class( TInterfacedObject, INewFastRegister )
    procedure ExecuteNewRegister ;
  end;


procedure TfrmEST_Produtos.actInventarioExecute(Sender: TObject);
var
 P :  UFIN_InventarioProdutosReport.TSpecificReportParams ;
begin
  inherited;
  P :=  UFIN_InventarioProdutosReport.TSpecificReportParams.Create ;
  TFIN_InventarioProdutosReport.Execute( p );
  P.Free ;
end;

procedure TfrmEST_Produtos.actPrintInsumosExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsProdutos ;
begin
  PReport := ReportTypes.TReportParamsProdutos.Create ;
  PReport.KSYS_DOMAIN   := LoggedUser.DomainID ;
  PReport.IS_PRODUTO   := 'F';
  PReport.IS_INSUMO    := 'T';
  PReport.IS_SERVICO   := 'F';
  PReport.ReportTitle  := 'Relação de Insumos';
  PReport.POR_TIPO     := 'F';
  PReport.ATIVO        := BoolToChar( cbxInativos.Checked );
  TEST_ProdutosInsumosReport.Execute( PReport );
  PReport.Free;
end;

procedure TfrmEST_Produtos.actPrintPorGrupoExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsProdutos ;
begin
  PReport := ReportTypes.TReportParamsProdutos.Create ;
  PReport.KSYS_DOMAIN    := LoggedUser.DomainID ;
  PReport.IS_PRODUTO     := 'T';
  PReport.IS_INSUMO      := 'T';
  PReport.IS_SERVICO     := 'F';
  PReport.ATIVO          := BoolToChar( cbxInativos.Checked );
  PReport.ReportTitle    := 'Relação de Produtos/Insumos por grupo';
  TEST_ProdutosInsumosReport.ExecuteDialog( PReport );
  PReport.Free;
end;

procedure TfrmEST_Produtos.actPrintProdutosExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsProdutos ;
begin
  PReport := ReportTypes.TReportParamsProdutos.Create ;
  PReport.KSYS_DOMAIN   := LoggedUser.DomainID ;
  PReport.IS_PRODUTO   := 'T';
  PReport.IS_INSUMO    := 'F';
  PReport.IS_SERVICO   := 'F';
  PReport.ReportTitle  := 'Relação de Produtos';
  PReport.POR_TIPO     := 'F';
  PReport.ATIVO        := BoolToChar( cbxInativos.Checked );
  TEST_ProdutosInsumosReport.Execute( PReport );
  PReport.Free;
end;

procedure TfrmEST_Produtos.actPrintServicosExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsProdutos ;
begin
  PReport := ReportTypes.TReportParamsProdutos.Create ;
  PReport.KSYS_DOMAIN   := LoggedUser.DomainID ;
  PReport.IS_PRODUTO   := 'F';
  PReport.IS_INSUMO    := 'F';
  PReport.IS_SERVICO   := 'T';
  PReport.ReportTitle  := 'Relação de Serviços';
  PReport.POR_TIPO     := 'F';
  PReport.ATIVO        := BoolToChar( cbxInativos.Checked );
  TEST_ServicosReport.Execute( PReport );
  PReport.Free;
end;

procedure TfrmEST_Produtos.actProcessJunctionExecute(Sender: TObject);
begin
   TdtmEST_Produtos( DatamoduleBase ).ProcessJunction ;
end;

procedure TfrmEST_Produtos.actProcessJunctionUpdate(Sender: TObject);
begin
   actProcessJunction.Enabled := TdtmEST_Produtos( DatamoduleBase ).JunctionOK ;
end;

procedure TfrmEST_Produtos.actProductJunctionExecute(Sender: TObject);
var
 w, h : integer ;
begin
  inherited;
(*
  SplitView1.AnimationStep := ClientWidth div 3 ;
  SplitView1.OpenedWidth := ClientWidth  ;
  SplitView1.Left := ClientWidth  ;
  JvDBUltimGrid1.Parent := SplitView1 ;
  JvDBUltimGrid1.Align  := alNone ;
  JvDBUltimGrid1.Top  := 0 ;
  JvDBUltimGrid1.Left := 0 ;
  JvDBUltimGrid1.Width  := ClientWidth ; //SplitView1.ClientWidth ;
  JvDBUltimGrid1.Height := ClientHeight ; //SplitView1.ClientHeight ;
  SplitView1.Open ;
*)

  SplitView1.AnimationStep   := ClientWidth div 6 ;
  SplitView1.AnimationDelay  := Max( SplitView1.AnimationStep div 10, 1 ) ;
  SplitView1.OpenedWidth := ClientWidth  ;
  SplitView1.Left   := ClientWidth   ;
  SplitView1.Height := ClientHeight  ;
  SplitView1.BringToFront  ;

  Panel1.Parent := SplitView1 ;
  Panel1.Align  := alNone ;
  Panel1.Top  := 0 ;
  Panel1.Left := 0 ;
  Panel1.Width  := ClientWidth ; //SplitView1.ClientWidth ;
  Panel1.Height := ClientHeight ; //SplitView1.ClientHeight ;
  SplitView1.Open ;


//  _pageControl.ActivePage := tbsJunction ;
end;

procedure TfrmEST_Produtos.actProductJunctionUpdate(Sender: TObject);
begin
  //
end;

procedure TfrmEST_Produtos.actProdutoInsumoExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsProdutos ;
begin
  PReport := ReportTypes.TReportParamsProdutos.Create ;
  PReport.KSYS_DOMAIN   := LoggedUser.DomainID ;
  PReport.IS_PRODUTO   := 'T';
  PReport.IS_INSUMO    := 'T';
  PReport.IS_SERVICO   := 'F';
  PReport.ReportTitle  := 'Relação de Produtos/Insumos';
  PReport.POR_TIPO     := 'F';
  PReport.ATIVO        := BoolToChar( cbxInativos.Checked );
  TEST_ProdutosInsumosReport.Execute( PReport );
  PReport.Free;
end;

procedure TfrmEST_Produtos.cbxInativosClick(Sender: TObject);
begin
  inherited;
//  UfrmSearchProgress.TfrmSearchProgress.ShowProgress ;
  ThreadSuppl.TSyncThread.Create (  ChangeFilter ) ;
end;

procedure TfrmEST_Produtos.cbxServicosClick(Sender: TObject);
begin
  inherited;
  ThreadSuppl.TSyncThread.Create (  ChangeFilter ) ;
end;

procedure TfrmEST_Produtos.ChangeFilter;
begin
  TdtmEST_Produtos( DatamoduleBase ).SetFilter( cbxInativos.Checked {, FNewCadastro, FSomenteServicos} );
end;

procedure TfrmEST_Produtos.checkCC;
begin
  with TdtmEST_Produtos( DatamoduleBase ) do
    if ( cdsProdutoKFIN_PLANOCONTA.AsString.Trim <> '' ) then
      if SvcFinanceiroApropriacaoDefault.NeedCC ( cdsProdutoKFIN_PLANOCONTA.AsString ) then
        if cdsApropriacaoProduto.IsEmpty then
           SearchPlanoConta( '' );
end;

constructor TfrmEST_Produtos.Create(AOwner: TComponent);
begin
  inherited;
  tbsJunction.TabVisible := False ;
  _PageControl.ActivePageIndex := 0 ;
  TdtmEST_Produtos.Create ( self ) ;
  TdtmEST_Produtos( DatamoduleBase ).FNewCadastro     := False ;
  TdtmEST_Produtos( DatamoduleBase ).FSomenteServicos := False ;
  TdtmEST_Produtos( DatamoduleBase ).OpenTables ;
  dtsLstUnidades.DataSet     := TdtmEST_Produtos( DatamoduleBase ).cdsUnidades ;
  dtsLstTipoProduto.DataSet := TdtmEST_Produtos( DatamoduleBase ).cdsTiposProduto ;
//  NotificationService.SubscribeStr( NeedRefresh,
//                                   [ 'PROCESS_TFIN_EntradaEstoqueWizard',
//                                     'PROCESS_TFIN_SaidaEstoqueWizard',
//                                     'PROCESS_TfrmCOMPRAS_Pedido',
//                                     'PROCESS_TfrmVENDAS_Pedido' ] ) ;

end;

procedure TfrmEST_Produtos.dblcTipoProdutoChange(Sender: TObject);
begin
  inherited;
  TdtmEST_Produtos( DatamoduleBase ).cdsProdutoTIPO_PRODUTO.AsString := dblcTipoProduto.Text;
end;

procedure TfrmEST_Produtos.dbcbProdInsuServChange(Sender: TObject);
begin
  inherited;
  ValidaCamposServico;
end;

procedure TfrmEST_Produtos.dblkUnidadeChange(Sender: TObject);
begin
  inherited;
  TdtmEST_Produtos( DatamoduleBase ).cdsProdutoUNIDADE.AsString := dblkUnidade.Text;
end;

procedure TfrmEST_Produtos.dbValorVendaButtonClick(Sender: TObject);
begin
  SearchPlanoConta( TJvDBComboEdit( Sender ).Text );
end;

procedure TfrmEST_Produtos.dbValorVendaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
   begin
    Key := #0 ;
    SearchPlanoConta( TJvDBComboEdit( Sender ).Text );
   end;
end;

destructor TfrmEST_Produtos.Destroy;
begin
//  NotificationService.UnSubscribe( [ NeedRefresh ] ) ;
  inherited;
end;

procedure TfrmEST_Produtos.dtsFichaDataChange(Sender: TObject; Field: TField);
begin
  if not Assigned ( DatamoduleBase )
    or not  TdtmEST_Produtos( DatamoduleBase ).cdsProduto.Active then
    exit ;

 if Assigned ( Field ) then
    ValidaCamposServico
 else
    ValidaCampos;
end;

procedure TfrmEST_Produtos.JvDBComboEdit1ButtonClick(Sender: TObject);
begin
  SearchPlanoConta( TJvDBComboEdit( Sender ).Text );
end;

procedure TfrmEST_Produtos.JvDBComboEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      SearchPlanoConta( TJvDBComboEdit( Sender ).Text );
    end;
end;

procedure TfrmEST_Produtos.JvDBUltimGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  inherited;
  Enabled := True ;
end;

function TfrmEST_Produtos.JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin
  Result := (Field = TdtmEST_Produtos( DatamoduleBase ).cdsJunctionProdutosCHECKED)
         or (Field = TdtmEST_Produtos( DatamoduleBase ).cdsJunctionProdutosPRINCIPAL) ;
  StringForTrue  := '1' ;
  StringForFalse := '0' ;
end;

procedure TfrmEST_Produtos.llUnidadeClick(Sender: TObject);
begin
  inherited;
  {SvcCadastroTipos.NovoTipo( CLAg5SvcEntidadesCadastroTipos._UNIDADE_MEDIDA );

  with TdtmEST_Produtos( DatamoduleBase ) do
    SetListaTipos( cdsUnidades, CLAg5SvcEntidadesCadastroTipos._UNIDADE_MEDIDA );}

    SvcEstoqueCadastroTipos.NovoTipo( CLAg5SvcEstoqueCadastroTipos._UNIDADE_MEDIDA );

    with TdtmEST_Produtos( DatamoduleBase ) do
      SetListaTipos( cdsUnidades, CLAg5SvcEstoqueCadastroTipos._UNIDADE_MEDIDA );
end;

procedure TfrmEST_Produtos.llTipoProdutoClick(Sender: TObject);
begin
  inherited;
  SvcEstoqueCadastroTipos.NovoTipo( CLAg5SvcEstoqueCadastroTipos._TIPO_PRODUTO );

  with TdtmEST_Produtos( DatamoduleBase ) do
    SetListaTipos( cdsTiposProduto, CLAg5SvcEstoqueCadastroTipos._TIPO_PRODUTO );
end;

procedure TfrmEST_Produtos.NeedRefresh(Sender: TObject);
begin
  with TdtmEST_Produtos ( DatamoduleBase ) do
    begin
      if ( cdsProduto.State in [dsInsert,dsEdit] ) or (cdsProduto.ChangeCount > 0 ) then
         Exit ;

      ReOpenTables ;
    end;
end;

class procedure TfrmEST_Produtos.NovoCadastro( var AProdutoInfo : TProdutoInfo ) ;
begin
  with Create ( nil ) {, TdtmEST_Produtos( DatamoduleBase ) } do
    try
      TdtmEST_Produtos( DatamoduleBase ).FNewCadastro        := True ;
      TdtmEST_Produtos( DatamoduleBase ).FSomenteServicos    := AProdutoInfo.TipoProduto = tpServico ;
      TdtmEST_Produtos( DatamoduleBase ).SetFilter( cbxInativos.Checked );

      _actNew.Execute; // manter aqui para nao dar pau - VTS

      DisableValidators ;
      TdtmEST_Produtos( DatamoduleBase ).UpdateFromInfo ( AProdutoInfo ) ;
      EnableValidators ;

      BorderStyle         := bsDialog ;
      cbxInativos.Enabled := False ;
      dbcbProdInsuServ.Items.Clear;
      dbcbProdInsuServ.Values.Clear;

      if TdtmEST_Produtos( DatamoduleBase ).FSomenteServicos then
        begin
          dbcbProdInsuServ.Items.Add( 'Serviço' );
          dbcbProdInsuServ.Values.Add( '3');
          llTipoProduto.Enabled := False;
        end
      else
        begin
          dbcbProdInsuServ.Items.Add( 'Produto' );
          dbcbProdInsuServ.Items.Add( 'Insumo' );
          dbcbProdInsuServ.Values.Add( '1');
          dbcbProdInsuServ.Values.Add( '2');
        end;

      _actLista.Enabled := False ;
      dbcbProdInsuServ.ItemIndex := TdtmEST_Produtos( DatamoduleBase ).cdsProdutoPRODUTO_INSUMO_SERVICO.AsInteger - 1 ;
      ShowModal ;
    finally
       CloseModal ;
    end;
end;

procedure TfrmEST_Produtos.Pesquisar;
begin
//  inherited ;
  if cbxInativos.checked then
    begin
      with TdtmEST_Produtos( DatamoduleBase ), TSearchProdutoInsumoServico.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
             cdsLstProdutos.Locate( 'KEST_PRODUTO', Result.FieldByName( 'KEST_PRODUTO' ).AsString, [] ) ;
             ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end
  else
    begin
      with TdtmEST_Produtos( DatamoduleBase ), TSearchProdutoInsumoServicoAtivo.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
              cdsLstProdutos.Locate( 'KEST_PRODUTO', Result.FieldByName( 'KEST_PRODUTO' ).AsString, [] ) ;
              ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end;
end;

procedure TfrmEST_Produtos.SearchPlanoConta(TextToSearch: string);
var
  LAPRD : TTiposPlanoAPRD ;
begin

  TdtmEST_Produtos( DatamoduleBase ).CheckCentroCustoPadrao() ;

  if ( LoggedUser.DomainCode = '010059' ) {Spinardi} or
     ( LoggedUser.DomainCode = '001907' ) {} or
     ( LoggedUser.DomainCode = '004957' ) {} then
     LAPRD := [ tpAtivo, tpReceitas, tpDespesas ]
  else
     LAPRD := [tpReceitas, tpDespesas ] ;

  with TdtmEST_Produtos( DatamoduleBase ) do
    begin

      SvcFinanceiroApropriacaoEdit.ExecuteTela( 'EST_PRODUTOS',
                                          cdsProduto,
                                          cdsApropriacaoProduto,
                                          TelaPatrimonio,
                                          LAPRD )
                                          //[tpReceitas, tpDespesas] );
    end;

end;


procedure TfrmEST_Produtos.SpeedButton1Click(Sender: TObject);
begin
  SplitView1.Close ;
  TdtmEST_Produtos( DatamoduleBase ).cdsJunctionProdutos.Close ;
  TdtmEST_Produtos ( DatamoduleBase ).ReOpenTables ;
end;

procedure TfrmEST_Produtos.SplitView1Opened(Sender: TObject);
begin
  TdtmEST_Produtos( DatamoduleBase ).cdsJunctionProdutos.Open ;
end;

procedure TfrmEST_Produtos.ValidaCampos;
var
  Result : Boolean;
begin
  Result := True;
//  dbcbBaixaEstoque.ItemIndex := 0;

  with TdtmEST_Produtos( DatamoduleBase ) do
    if cdsProdutoPRODUTO_INSUMO_SERVICO.AsInteger = 3 then
      begin
        Result := False;
        dbcbBaixaEstoque.ItemIndex := -1;
        dblcTipoProduto.ClearValue;
      end;

  dblcTipoProduto.Enabled  := Result;
  //dbQtdeInicial.Enabled    := Result;
  //dbQtdeInicial.TabStop    := Result;
  dbQtdeMinima.Enabled     := Result;
  dbcbBaixaEstoque.Enabled := Result;
  llTipoProduto.Enabled    := Result;
  ValidaCamposServico ;
end;

procedure TfrmEST_Produtos.ValidaCamposServico;
var
  Result : Boolean;
begin
  Result := True;

  with TdtmEST_Produtos( DatamoduleBase ) do
    begin
      if not ( cdsProduto.State in [dsInsert, dsEdit] ) then
        exit;

      //if cdsProdutoPRODUTO_INSUMO_SERVICO.AsInteger = 3 then
      if dbcbProdInsuServ.ItemIndex = 2 {Servico} then
        begin
          Result := False;
          dbcbBaixaEstoque.ItemIndex := -1;
          dblcTipoProduto.ClearValue;
          dbQtdeMinima.Clear ;
          //dblkUnidade.ClearValue;
          {cdsProdutoQTDE_MINIMA.Clear;
          cdsProdutoKCAD_UNIDADE.Clear;
          cdsProdutoUNIDADE.Clear;}
        end;
    end;

  dblcTipoProduto.Enabled  := Result;
  dbQtdeMinima.Enabled     := Result;
  dbcbBaixaEstoque.Enabled := Result;
  llTipoProduto.Enabled    := Result;
  //dblkUnidade.Enabled      := Result;
  llUnidade.Enabled        := Result;
end;

procedure TfrmEST_Produtos._actCancelExecute(Sender: TObject);
begin
  inherited;
  if TdtmEST_Produtos( DatamoduleBase ).FNewCadastro then
    Self.Close;
end;

procedure TfrmEST_Produtos._actNewExecute(Sender: TObject);
begin
  inherited;
////
end;

procedure TfrmEST_Produtos._actSaveExecute(Sender: TObject);
begin
//  checkCC ;
  inherited;
  if fsModal in FormState then
       ModalResult := mrOK ;
end;

function TfrmEST_Produtos._dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
  with TdtmEST_Produtos( DataModuleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsLstProdutosATIVO ) ) ;

  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;


procedure TfrmEST_Produtos.ShowNewFastRegister(Sender: TObject);
begin
//  _pnlForm.Color := clsilver ;
//  self._pageControl.parent := _pnlForm ;
//  self._pnlToolButtons.parent := _pnlForm ;
  if dbNome.CanFocus then
     dbNome.SetFocus;
end;


class procedure TfrmEST_Produtos.ExecuteNewFastRegister;
var
  ThisForm : TfrmEST_Produtos ;
  Handled: Boolean;
begin
  ThisForm := TfrmEST_Produtos.Create(nil);
  ThisForm.OnShow := ThisForm.ShowNewFastRegister;
  ThisForm._pageControl.Pages[0].TabVisible := False;
  ThisForm._pageControl.Pages[1].TabVisible := False;
  //ThisForm._pageControl.ActivePageIndex := 1;
  ThisForm._pageControl.ActivePage := ThisForm._tbsFicha;
  ThisForm._actLista.Enabled := False;
  ThisForm._actEdit.Enabled := False;
  ThisForm._actNew.Execute ;// _ActionListExecute(ThisForm._actNew, Handled);
  try
    ThisForm.ShowModal;
  finally
    FreeAndNil(ThisForm);
  end;
end;

{ SvcEstoqueProdutosCadastroFactory }

procedure SvcEstoqueProdutosCadastroFactory.NovoCadastro( var AProdutoInfo : TProdutoInfo );
begin
    TfrmEST_Produtos.NovoCadastro( AProdutoInfo ) ;
end;

{ SvcClienteNewFastRegisterFactory }

procedure SvcProdutoInsumoServicoNewFastRegisterFactory.ExecuteNewRegister;
begin
  TfrmEST_Produtos.ExecuteNewFastRegister;
end;

initialization
  RegisterClass ( TfrmEST_Produtos ) ;
  SvcEstoqueProdutosCadastro := SvcEstoqueProdutosCadastroFactory.Create ;
  SvcProdutoInsumoServicoNewFastRegister := SvcProdutoInsumoServicoNewFastRegisterFactory.Create ;

finalization
  SvcEstoqueProdutosCadastro := nil ;
  SvcProdutoInsumoServicoNewFastRegister := nil ;
end.

