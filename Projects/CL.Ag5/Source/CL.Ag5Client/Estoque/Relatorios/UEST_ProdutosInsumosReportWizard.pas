unit UEST_ProdutosInsumosReportWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, JvExMask,
  Tc.VCL.Controls.GDIButton, UEST_ProdutosInsumosReportDatamodule, VCL.Mask,
  Tc.VCL.Edits, JvToolEdit, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, JvBaseEdits, JvDBControls, System.Actions,
  System.ImageList, Vcl.ImgList, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;

type
  TEST_ProdutosInsumosReportWizard = class(T_FormWizard)
    TabSheetParametros: TTabSheet;
    TabSheetResultado: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataInicial: TTcDateEdit;
    edDataFinal: TTcDateEdit;
    GroupBox3: TGroupBox;
    rbTodos: TRadioButton;
    edSearchGrupo: TJvComboEdit;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsResultado: TDataSource;
    rbGrupo: TRadioButton;
    rbProduto: TRadioButton;
    edSearchProduto: TJvComboEdit;
    ImgChkGrupo: TImage;
    ImgChkProduto: TImage;
    ImageList1: TImageList;
    chkProdutos: TCheckBox;
    chkInsumos: TCheckBox;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edSearchGrupoButtonClick(Sender: TObject);
    procedure edSearchGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure edSearchGrupoChange(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edSearchProdutoChange(Sender: TObject);
    procedure edSearchProdutoButtonClick(Sender: TObject);
    procedure edSearchProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure rbTodosClick(Sender: TObject);
    procedure rbGrupoClick(Sender: TObject);
    procedure rbProdutoClick(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure edSearchGrupoEnter(Sender: TObject);
    procedure edSearchGrupoExit(Sender: TObject);
    procedure edSearchProdutoEnter(Sender: TObject);
    procedure edSearchProdutoExit(Sender: TObject);
  private
    { Private declarations }
    EST_ProdutosInsumosReportDatamodule : TEST_ProdutosInsumosReportDatamodule ;
    FTipoTodosGrupoProduto : integer ;
    FKGrupo : string;
    FKProduto : string ;
    procedure ImageChkComboEdit( AImage : TImage ; ANAme : string ; AKeyVar : string  ) ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses SearchsEntidades, SearchsFinanceiro, UDBFinanceiro, ReportTypes, UFIN_ProdutosInsumosMovimentoReport, DateUtils ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TEST_ProdutosInsumosReportWizard.Create(AOwner: TComponent);
begin
  inherited;
  EST_ProdutosInsumosReportDatamodule := TEST_ProdutosInsumosReportDatamodule.Create( Self );

  JvDBUltimGrid1.ShowHighlighter := True ;

  EST_ProdutosInsumosReportDatamodule.OpenTables;

  ImageChkComboEdit(ImgChkGrupo, 'Grupo', '' ) ;
  ImageChkComboEdit(ImgChkProduto, 'Produto', '' ) ;

  _btbExecute.Caption := 'V&isualizar';
  edDataInicial.Date  := Date - 30;
  edDataFinal.Date    := Date;
end;

destructor TEST_ProdutosInsumosReportWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TEST_ProdutosInsumosReportWizard.edSearchGrupoButtonClick(Sender: TObject);
begin
  with TSearchTipoProduto.Create do
    try
      TextToFind := edSearchGrupo.Text ;
      if Execute then
        begin
          edSearchGrupo.Text := Result.FieldByName( 'DESCRICAO' ).asString;
          FKGrupo            := Result.FieldByName( 'KCAD_TIPOS' ).asString;
        end
      else
         begin
            edSearchGrupo.Font.Color := clRed ;
         end;

     ImageChkComboEdit(ImgChkGrupo, 'Grupo', FKGrupo ) ;

    finally
      free ;
    end ;
end;

procedure TEST_ProdutosInsumosReportWizard.edSearchGrupoChange(Sender: TObject);
begin
  self.FKGrupo := '';
  edSearchGrupo.Font.Color := clRed ;
  ImageChkComboEdit(ImgChkGrupo, 'Grupo', FKGrupo ) ;
  ImgChkGrupo.Refresh ;
end;

procedure TEST_ProdutosInsumosReportWizard.edSearchGrupoEnter(Sender: TObject);
begin
  ImgChkGrupo.Visible := (edSearchGrupo.Text <> '')
                        or ( rbGrupo.checked ) ;
end;

procedure TEST_ProdutosInsumosReportWizard.edSearchGrupoExit(Sender: TObject);
begin
  ImgChkGrupo.Visible := (edSearchGrupo.Text <> '')
                        or ( rbGrupo.checked ) ;
end;

procedure TEST_ProdutosInsumosReportWizard.edSearchGrupoKeyPress(Sender: TObject; var Key: Char);
begin
  rbGrupo.Checked := True;
  if Key = #13 then
    begin
      Key := #0 ;
      TJvComboEdit ( Sender ).DoClick ;
    end;
end;

procedure TEST_ProdutosInsumosReportWizard.ImageChkComboEdit( AImage : TImage ; ANAme : string ; AKeyVar : string  ) ;
begin
  Case AKeyVar.IsEmpty of True :
      begin
        AImage.Hint := AName + ' não associado ao cadastro.'
                      +#13#10'Efetue a pesquisa.'  ;
        ImageList1.GetBitmap( 2, AImage.Picture.Bitmap ) ;
      end;
  else
    AImage.Hint := AName + ' associado ao cadastro.'  ;
    ImageList1.GetBitmap( 0, AImage.Picture.Bitmap )
  end;
  AImage.Refresh ;
end;


procedure TEST_ProdutosInsumosReportWizard.edSearchProdutoButtonClick(
  Sender: TObject);
begin
  with TSearchProdutoInsumoAtivo.Create do
    try
      TextToFind := edSearchProduto.Text ;
      if Execute then
        begin
          edSearchProduto.Text := Result.FieldByName( 'NOME' ).asString;
          FKProduto            := Result.FieldByName( 'KEST_PRODUTO' ).asString;
        end
      else
        edSearchProduto.Font.Color := clRed ;

      ImageChkComboEdit( ImgChkProduto, 'Produto', FKProduto ) ;

    finally
      free ;
    end ;
end;

procedure TEST_ProdutosInsumosReportWizard.edSearchProdutoChange(
  Sender: TObject);
begin
  self.FKProduto := '';
  edSearchProduto.Font.Color := clRed ;
  ImageChkComboEdit(ImgChkProduto, 'Produto', FKProduto ) ;
end;

procedure TEST_ProdutosInsumosReportWizard.edSearchProdutoEnter(
  Sender: TObject);
begin
  ImgChkProduto.Visible :=  (edSearchProduto.Text <> '')
                         or (rbProduto.checked) ;
end;

procedure TEST_ProdutosInsumosReportWizard.edSearchProdutoExit(Sender: TObject);
begin
  ImgChkProduto.Visible :=  (edSearchProduto.Text <> '')
                         or (rbProduto.checked) ;
end;

procedure TEST_ProdutosInsumosReportWizard.edSearchProdutoKeyPress(
  Sender: TObject; var Key: Char);
begin
  rbProduto.Checked := True;
  if Key = #13 then
    begin
      Key := #0 ;
      TJvComboEdit ( Sender ).DoClick ;
    end;
end;

class function TEST_ProdutosInsumosReportWizard.Execute : boolean;
var
  ThisForm: TEST_ProdutosInsumosReportWizard;
begin
  ThisForm := TEST_ProdutosInsumosReportWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TEST_ProdutosInsumosReportWizard.rbGrupoClick(Sender: TObject);
begin
  FTipoTodosGrupoProduto := 1 ;
  ImgChkGrupo.Visible := True ;
  ImgChkProduto.Visible := False ;
end;

procedure TEST_ProdutosInsumosReportWizard.rbProdutoClick(Sender: TObject);
begin
  FTipoTodosGrupoProduto := 2 ;
  ImgChkGrupo.Visible := False ;
  ImgChkProduto.Visible := True ;
end;

procedure TEST_ProdutosInsumosReportWizard.rbTodosClick(Sender: TObject);
begin
  FTipoTodosGrupoProduto := 0 ;
  ImgChkGrupo.Visible := False ;
  ImgChkProduto.Visible := False ;
end;

procedure TEST_ProdutosInsumosReportWizard._actExecuteExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsBalancoProdutos ;
  LProdutoInsumo : integer ;
begin

  LProdutoInsumo := 0 ;
  if chkProdutos.Checked then
     Inc ( LProdutoInsumo, 1 ) ;
  if chkInsumos.Checked then
     Inc ( LProdutoInsumo, 2 ) ;
  Dec ( LProdutoInsumo ) ;

  PReport                := ReportTypes.TReportParamsBalancoProdutos.Create ;
  PReport.KSYS_DOMAIN    := LoggedUser.DomainID ;
  PReport.DataInicial    := StartOfTheDay ( edDataInicial.Date ) ;
  PReport.DataFinal      := EndOfTheDay   ( edDataFinal.Date   ) ;
  PReport.TipoTodosGrupoProduto  := FTipoTodosGrupoProduto ;
  PReport.ProdutoInsumo  := LProdutoInsumo ;
  PReport.KGrupo   := FKGrupo ;
  PReport.KProduto := FKProduto ;
  PReport.ReportTitle    := 'Balanço';

  case FTipoTodosGrupoProduto of
     0  :
        Case LProdutoInsumo of
         0 : PReport.ReportTitle := 'Movimentação de Produtos';
         1 : PReport.ReportTitle := 'Movimentação de Insumos' ;
         2 : PReport.ReportTitle := 'Movimentação de Produtos/Insumos' ;
        End;
     1 : PReport.ReportTitle := 'Movimentação de Produtos/Insumos por grupo' ;
     2 : PReport.ReportTitle := 'Movimentação do Produtos/Insumos' ;
  end;

  TFIN_ProdutosInsumosMovimentoReport.Execute( PReport );
  PReport.Free;

  inherited;
end;

procedure TEST_ProdutosInsumosReportWizard._actNextExecute(Sender: TObject);
var
  LProdutoInsumo : integer ;
begin

  LProdutoInsumo := 0 ;
  if chkProdutos.Checked then
     Inc ( LProdutoInsumo, 1 ) ;
  if chkInsumos.Checked then
     Inc ( LProdutoInsumo, 2 ) ;
  Dec ( LProdutoInsumo ) ;


  with EST_ProdutosInsumosReportDatamodule do
    SetFiltro( edDataInicial.Date, edDataFinal.Date,
               FTipoTodosGrupoProduto, LProdutoInsumo, FKGrupo, FKProduto ) ;

  inherited;
end;

procedure TEST_ProdutosInsumosReportWizard._actNextUpdate(Sender: TObject);
begin
  inherited;

  _actNext.Enabled := (rbTodos.Checked   and (chkProdutos.Checked or chkInsumos.Checked))
                  or  (rbGrupo.Checked   and (FKGrupo <> ''))
                  or  (rbProduto.Checked and (FKProduto <> ''))

end;

procedure TEST_ProdutosInsumosReportWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

initialization
  RegisterClass ( TEST_ProdutosInsumosReportWizard ) ;

end.
