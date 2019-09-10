unit UZoo_BancoDadosFemeaForm;

interface

uses
  VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvExControls,
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExExtCtrls, JvNetscapeSplitter, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  SysFormListaFicha, ReportTypes, VCL.DBCtrls, JvImage, JvDBControls,
  JvExtComponent, JvPanel, JvExComCtrls, JvComCtrls, DBCGrids,
  UZoo_AnimaisGenealogiaClass, TabControlDeskTop, JvDBLookup, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, JvBaseEdits, JvExStdCtrls, JvEdit, JvDBSearchEdit,
  VCL.ImgList, JvDBCheckBox, JvCombobox, JvDBCombobox,
  ClAg5ClientZootecnicoCommonTypes,
  Tc.VCL.FormIntf, System.Actions, System.ImageList,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Tc.VCL.Application, uImageListProvider,
  Vcl.ActnList, Wrappers  ;

type

//  TJvPageControl = class ( JvComCtrls.TJvPageControl )
//    procedure CMDialogChar(var Message: TCMDialogChar);  message CM_DIALOGCHAR;
//  end ;

  TZoo_BancoDadosFemeaForm = class(T_FormListaFicha)
    Label24: TLabel;
    dbeRegistro: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    pgcMain: TJvPageControl;
    tbsMainGenealogia: TTabSheet;
    Label27: TLabel;
    DBEdit7: TDBEdit;
    tbsMainSanidade: TTabSheet;
    tbsMainReproducao: TTabSheet;
    tbsMainInformacao: TTabSheet;
    tbsMainProducao: TTabSheet;
    JvDBDateEdit1: TTcDBDateEdit;
    deNascimento: TTcDBDateEdit;
    Label21: TLabel;
    LinkLabel1: TLabel;
    dbeBrinco: TDBEdit;
    Label23: TLabel;
    dbeNome: TDBEdit;
    Label28: TLabel;
    Label1: TLabel;
    dbeIdade: TDBEdit;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    dbeRetiro: TDBEdit;
    dbeLote: TDBEdit;
    dbeLoteVirtual1: TDBEdit;
    dbeLoteVirtual2: TDBEdit;
    LinkLabel2: TLabel;
    LinkLabel3: TLabel;
    Label2: TLabel;
    dblcStatus: TDBLookupComboBox;
    LinkLabel4: TLabel;
    tbsMainHistorico: TTabSheet;
    _pnldbgLista2: TPanel;
    JvDBUltimGrid4: TJvDBUltimGrid;
    tbsMainGrafico: TTabSheet;
    JvTabDefaultPainter1: TJvTabDefaultPainter;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Label22: TLabel;
    DBEdit2: TDBEdit;
    pgcGenealogia: TJvPageControl;
    tbsGenealogiaPedigree: TTabSheet;
    tbsGenealogiaCadastro: TTabSheet;
    tbsGenealogiaFilhos: TTabSheet;
    tbsGenealogiaClassificacao: TTabSheet;
    tbsGenealogiaAcasalamento: TTabSheet;
    tbsGenealogiaCrescimento: TTabSheet;
    Panel5: TPanel;
    dtsLinhagem: TDataSource;
    Label52: TLabel;
    dblcDoadoraReceptora: TDBLookupComboBox;
    dtsDadosFemea: TDataSource;
    gbxDescarte: TGroupBox;
    Label34: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    dtsDescartes: TDataSource;
    Label37: TLabel;
    Label38: TLabel;
    DBEdit14: TDBEdit;
    JvDBCalcEdit1: TJvDBCalcEdit;
    Label39: TLabel;
    TcMPDBDateEdit1: TTcDBDateEdit;
    Label40: TLabel;
    Panel9: TPanel;
    rbShowBrinco: TRadioButton;
    rbShowNomeEstabulo: TRadioButton;
    rbShowNomeCompleto: TRadioButton;
    edtQuickSearch: TJvDBSearchEdit;
    DBMemo1: TDBMemo;
    cbxExibirDescartados2: TCheckBox;
    cbxExibirDescartados1: TCheckBox;
    gbxOrigem: TGroupBox;
    gbxPedigree: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    edPai: TJvDBComboEdit;
    edMae: TJvDBComboEdit;
    JvDBCalcEdit2: TJvDBCalcEdit;
    dbEdtComposicaoRaca: TJvDBComboEdit;
    dbxGrauSangue: TDBComboBox;
    Label29: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBCheckBox1: TJvDBCheckBox;
    Label5: TLabel;
    dbeNomeEstabulo: TDBEdit;
    dbeSISBOV: TDBEdit;
    Label6: TLabel;
    dbeSCL: TDBEdit;
    Label7: TLabel;
    dbchkOriginadoEmbriao: TDBCheckBox;
    dtsTipoDescarte: TDataSource;
    JvDBComboBox1: TJvDBComboBox;
    _PnlForm: TPanel;
    ScrollBox1: TScrollBox;
    Label8: TLabel;
    dbeLoteVirtual3: TDBEdit;
    gbxControleLeiteiro: TGroupBox;
    gbxDadosCadastrais: TGroupBox;
    gbxManejo: TGroupBox;
    Label9: TLabel;
    Bevel1: TBevel;
    ImageList1: TImageList;
    Image1: TImage;
    gbxCrescimento: TGroupBox;
    dsCrescimento: TDataSource;
    Label10: TLabel;
    dbePeso: TDBEdit;
    Label11: TLabel;
    dbeAltura: TDBEdit;
    LinkLabelHistToque: TLabel;
    dbchkAnimalDeTerceiro: TDBCheckBox;
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure LinkLabel2LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure LinkLabel3LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    function JvDBUltimGrid5CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure LinkLabel4LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure edPaiButtonClick(Sender: TObject);
    procedure edMaeButtonClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure pgcGenealogiaChange(Sender: TObject);
    procedure JvDBUltimGrid4Resize(Sender: TObject);
    procedure dtsListaDataChange(Sender: TObject; Field: TField);
    procedure LinkLabel1Click(Sender: TObject);
    procedure LinkLabel2Click(Sender: TObject);
    procedure LinkLabel4Click(Sender: TObject);
    procedure LinkLabel3Click(Sender: TObject);
    procedure rbShowColumnClick(Sender: TObject);
    procedure cbxExibirDescartadosClick(Sender: TObject);
    procedure _ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure _ActionListExecute(Action: TBasicAction; var Handled: Boolean);
    procedure dbxGrauSangueKeyPress(Sender: TObject; var Key: Char);
    procedure dbEdtComposicaoRacaButtonClick(Sender: TObject);
    procedure dbEdtComposicaoRacaKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgcMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure TcMPFormShow(Sender: TObject);
    procedure pgcGenealogiaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure _actListaUpdate(Sender: TObject);
    procedure _pageControlChange(Sender: TObject);
    procedure _actPrintExecute(Sender: TObject);
    procedure _actPrintUpdate(Sender: TObject);
    procedure edtQuickSearchChange(Sender: TObject);
    procedure LinkLabelHistToqueClick(Sender: TObject);
  private
    { Private declarations }
//    FGenealogyPanel : TGenealogyPanel ;
    FGenealogyPanel : TZoo_AnimaisGenealogiaFrame ;
    FDesktopSanidade  : TTCDForm ;
    FEscoreTableName : TStringList ;
    FEscoreKey : TStringList ;
    FNextGenealogyUID: string;
    procedure InitDesktopSanidade ;
    procedure NotifyActiveFormSanidade ( Sender : TObject ) ;
    procedure GetClassDesktopSanidade ( TabIndex : integer ; out ObjectClass : TComponentClass ) ;
    procedure SearchPai ( TextToSearch : string);
    procedure SearchMae ( TextToSearch : string);
    procedure IndentityClick( AIdentity : TIdentity ; ALink : boolean ) ;
    procedure ExibirDescartados ( AExibir : boolean ) ;
    procedure CheckQuickSearchIsValid ;
  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
    procedure CreateGenealogy;
    procedure UpdateGenealogy ;
    procedure CheckColsVisible ;
    procedure CheckColsSize ;
    procedure CheckDataFormIntf ;
    procedure PrintData ; override ;
    procedure Save ; override ;
    procedure NeedRefresh ( Sender : TCLAg5NSMsg ) ;
    procedure ActiveFicha ; override ;
  public
    { Public declarations }
    class var KZOOANIMAL : string ;
    property NextGenealogyUID : string read FNextGenealogyUID ;
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
  end;


  TShowFichaFemea = class ( TInterfacedPersistent, IShowFichaAnimal )
  public
     function Execute( AKZOOANIMAL : string ) : string ;
  end;

implementation

// insira a unit ''dtm'' do form na clausula uses
// conforme exemplo :
uses
    Tc.DBRTL.AbstractDB
  , SysTypes
  , SearchsZootecnico
  , UZoo_BancoDadosFemeaDatamodule
  , UfdlgZoo_HistoricoBrincos
  , UfdlgZoo_HistoricoLotes
  , UfdlgZoo_HistoricoRetiros
  , UfdlgZoo_HistoricoStatus
  , UfwzZoo_EscoreAnimal
  , UDBZootecnico
  , UfwzZoo_CondicaoCorporalAnimal
  , UfwzZoo_BSTAnimal
  , UfwzZoo_CMTAnimal
  , UfrmZoo_HistoricoAnimal
  , UfrmZoo_ProducaoAnimal
  , UfrmZoo_FilhosAnimal
  , UfrmZoo_ClassificacaoAnimal
  , UfrmZoo_AcasalamentoAnimal
  , UfrmZoo_CrescimentoAnimal
  , UZoo_BancoDadosFemeaEventosReprodutivosForm
  , UfrmZoo_ResultadoExamesAnimal
  , UfrmZoo_OcorrenciasAnimal3
  , UfrmZoo_InformacoesAnimal
  , UfrmZoo_GraficoLactacaoAnimal
  , DBClient
  , UInclusaoFemeaWizard
  , UZoo_EditLinhagemFrame
  , UfqrZoo_FichaFemea
  , UfdlgZoo_HistoricoToques ;


{$R *.dfm}

procedure TZoo_BancoDadosFemeaForm.edPaiButtonClick(Sender: TObject);
begin
  inherited;
  SearchPai ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_BancoDadosFemeaForm.CheckQuickSearchIsValid ;
begin
   Image1.Picture := nil ;
   if edtQuickSearch.Text <> '' then
     if TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ).cdsAnimalBRINCO.AsString = edtQuickSearch.Text then
       begin
          edtQuickSearch.Font.Color := clNavy ;
          Image1.Hint := 'Animal encontrado'  ;
          ImageList1.GetBitmap( 0, Image1.Picture.Bitmap )
       end
     else
       begin
          edtQuickSearch.Font.Color := clRed ;
          Image1.Hint := 'Animal não encontrado' ;
          ImageList1.GetBitmap( 1, Image1.Picture.Bitmap ) ;
       end;
end;

procedure TZoo_BancoDadosFemeaForm.edtQuickSearchChange(Sender: TObject);
begin
 CheckQuickSearchIsValid ;
end;


procedure TZoo_BancoDadosFemeaForm.ExibirDescartados(AExibir: boolean);
begin
   cbxExibirDescartados1.OnClick := nil ;
   cbxExibirDescartados2.OnClick := nil ;
   cbxExibirDescartados1.Checked := AExibir ;
   cbxExibirDescartados2.Checked := AExibir ;
   TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).ExibirDescartados := AExibir ;
   cbxExibirDescartados1.OnClick := cbxExibirDescartadosClick ;
   cbxExibirDescartados2.OnClick := cbxExibirDescartadosClick ;
end;


procedure TZoo_BancoDadosFemeaForm.ActiveFicha;
begin
  inherited;
  CheckDataFormIntf
end;

procedure TZoo_BancoDadosFemeaForm.cbxExibirDescartadosClick(Sender: TObject);
begin
  ExibirDescartados ( TCheckBox ( Sender ).Checked ) ;
end;

procedure TZoo_BancoDadosFemeaForm.CheckColsSize;
begin
  JvDBUltimGrid4.Columns[0].Width := JvDBUltimGrid4.Width ;
  JvDBUltimGrid4.Columns[1].Width := JvDBUltimGrid4.Width ;
  JvDBUltimGrid4.Columns[2].Width := JvDBUltimGrid4.Width ;
end;

procedure TZoo_BancoDadosFemeaForm.CheckColsVisible;
begin
  JvDBUltimGrid4.Columns[0].Visible := rbShowBrinco.Checked ;
  JvDBUltimGrid4.Columns[1].Visible := rbShowNomeCompleto.Checked ;
  JvDBUltimGrid4.Columns[2].Visible := rbShowNomeEstabulo.Checked ;

  if rbShowBrinco.Checked then
     edtQuickSearch.DataField := 'BRINCO'
  else if rbShowNomeCompleto.Checked then
     edtQuickSearch.DataField := 'NOMECOMPLETO'
  else if rbShowNomeEstabulo.Checked then
     edtQuickSearch.DataField := 'NOMEESTABULO' ;

  CheckColsSize ;
  JvDBUltimGrid4.SelectedIndex := 0 ;
end;

procedure TZoo_BancoDadosFemeaForm.CheckDataFormIntf;
var
  LDataFormIntf : ITcDataForm ;
begin
  if _PageControl.ActivePage = _tbsLista then
   begin
    self.DataFormIntf := LDataFormIntf ;
    exit ;
   end;


  if   ( pgcMain.ActivePage = tbsMainInformacao  ) and ( tbsMainInformacao.ControlCount > 0 )
   and Supports( tbsMainInformacao.Controls[ 0 ],  ITcDataForm, LDataFormIntf )  then
    self.DataFormIntf := LDataFormIntf
  else if pgcMain.ActivePage = tbsMainGenealogia then
    begin
      if ( pgcGenealogia.ActivePage = tbsGenealogiaCadastro ) then
        self.DataFormIntf := self
      else if Supports( pgcGenealogia.ActivePage.Controls[ 0 ],  ITcDataForm, LDataFormIntf ) then
        self.DataFormIntf := LDataFormIntf
      else
        self.DataFormIntf :=  nil ;
    end
  else if pgcMain.ActivePage  = tbsMainGrafico then
    self.DataFormIntf := nil
  else if ( pgcMain.ActivePage.ControlCount > 0 )
   and Supports( pgcMain.ActivePage.Controls[ 0 ], ITcDataForm, LDataFormIntf ) then
    self.DataFormIntf := LDataFormIntf;
end;

constructor TZoo_BancoDadosFemeaForm.Create(AOwner: TComponent);
begin
  inherited;

  JvTabDefaultPainter1.ActiveColorTo     := SysTypes._TITLE_COLOR ;
  JvTabDefaultPainter1.ActiveColorFrom   := clWhite ;
  JvTabDefaultPainter1.ActiveFont.Color  := SysTypes._TITLE_FONT_COLOR ;
  JvTabDefaultPainter1.InactiveColorTo   := JvTabDefaultPainter1.ActiveColorFrom ;
  JvTabDefaultPainter1.InactiveColorFrom := JvTabDefaultPainter1.ActiveColorTo ;

  //  defina o tipo de apresentacao do form
  //  caso nao definido, irá usar o default : flLayoutAba
  //  FormLayout := flLayoutAba ; // opcoes : flLayoutAba, flLayoutDual, flLayoutModal

  // insira a criação do datamodule, ex:

  pgcMain.ActivePage       := tbsMainInformacao ;
  pgcGenealogia.ActivePage := tbsGenealogiaPedigree ;
  ActiveFicha ;

  TZoo_BancoDadosFemeaDatamodule.Create ( self ) ;

  dtsDadosFemea.DataSet   := TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ).cdsDadosFemea ;
  dtsLinhagem.DataSet     := TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ).cdsLinhagem ;
  dtsTipoDescarte.DataSet := TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ).cdsTipoMotivoDescarte ;
  dtsDescartes.DataSet    := TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ).cdsDescartes ;

  TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ).GrauDeSangue.GetGrausSangue ( dbxGrauSangue.Items ) ;

  InitDesktopSanidade ;

  FGenealogyPanel := nil ;

   _pnldbgLista2.Visible := KZOOANIMAL = '' ;

   TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).KZOOANIMAL := TZoo_BancoDadosFemeaForm.KZOOANIMAL ;

  KZOOANIMAL := '' ;

  DatamoduleBase.OpenTables ;
  pgcMain.ActivePage := tbsMainInformacao ;
  pgcMain.OnChange( pgcMain ) ; // força criar o tbs informacao ...

  CheckColsVisible;

  CheckDataFormIntf ;
//  showMessage ( format (  '%x', [   ColorToRGB( self.JvTabDefaultPainter1.ActiveColorTo ) ] ) ) ;

   TCLAg5NSMsgEVT_ImportacaoSISBOV.Subscribe ( NeedRefresh ) ;
   TCLAg5NSMsgEVT_PartosAbortos.Subscribe( NeedRefresh  ) ;
   TCLAg5NSMsgEVT_TrocaBrinco.Subscribe( NeedRefresh  ) ;
   TCLAg5NSMsgEVT_TrocaRetiro.Subscribe( NeedRefresh  ) ;
   TCLAg5NSMsgEVT_TrocaLote.Subscribe( NeedRefresh    ) ;
   TCLAg5NSMsgEVT_Desmame.Subscribe( NeedRefresh        ) ;
   TCLAg5NSMsgEVT_Descartes.Subscribe( NeedRefresh      ) ;
   TCLAg5NSMsgEVT_BancoDadosFemeaEventosReprodutivos.Subscribe( NeedRefresh ) ;
   TCLAg5NSMsgEVT_ProducaoAnimal.Subscribe( NeedRefresh ) ;

   CheckQuickSearchIsValid ;


end;


procedure TZoo_BancoDadosFemeaForm.CreateGenealogy;
begin

  FGenealogyPanel := TZoo_AnimaisGenealogiaFrame.Create( tbsGenealogiaPedigree ) ;
  FGenealogyPanel.Parent := tbsGenealogiaPedigree ;
  FGenealogyPanel.Align := alClient ;
  FGenealogyPanel.Identity := TIdentity.make( FGenealogyPanel, 3 )  ;
  FGenealogyPanel.OnIdentityClick := IndentityClick ;
  FGenealogyPanel.disableDraw := False ;
  UpdateGenealogy ;

end;

procedure TZoo_BancoDadosFemeaForm.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

destructor TZoo_BancoDadosFemeaForm.Destroy;
begin
  self.DataFormIntf := nil ;
  FEscoreTableName.Free ;
  FEscoreKey.Free ;

  TCLAg5NSMsgEVT_ImportacaoSISBOV.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_PartosAbortos.UnSubscribe( NeedRefresh  ) ;
  TCLAg5NSMsgEVT_TrocaBrinco.UnSubscribe( NeedRefresh  ) ;
  TCLAg5NSMsgEVT_TrocaRetiro.UnSubscribe( NeedRefresh  ) ;
  TCLAg5NSMsgEVT_TrocaLote.UnSubscribe( NeedRefresh    ) ;
  TCLAg5NSMsgEVT_Desmame.UnSubscribe( NeedRefresh        ) ;
  TCLAg5NSMsgEVT_Descartes.UnSubscribe( NeedRefresh      ) ;
  TCLAg5NSMsgEVT_BancoDadosFemeaEventosReprodutivos.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_ProducaoAnimal.UnSubscribe( NeedRefresh ) ;

  inherited;
end;

procedure TZoo_BancoDadosFemeaForm.dtsListaDataChange(Sender: TObject;
  Field: TField);
begin
  if dtsLista.DataSet.State in [dsInsert, dsEdit] then
   begin
     rbShowBrinco.Enabled := False;
     rbShowNomeCompleto.Enabled := False;
     rbShowNomeEstabulo.Enabled := False;
     edtQuickSearch.Enabled := False;
     JvDBUltimGrid4.Enabled := False;
     pgcMain.Pages[0].Enabled := False;
     pgcMain.Pages[1].Enabled := False;
     pgcMain.Pages[2].Enabled := False;
     pgcMain.Pages[3].Enabled := False;
     pgcMain.Pages[4].Enabled := False;
     pgcMain.Pages[6].Enabled := False;

     pgcGenealogia.Pages[0].Enabled := False;
     pgcGenealogia.Pages[2].Enabled := False;
     pgcGenealogia.Pages[3].Enabled := False;
     pgcGenealogia.Pages[4].Enabled := False;
     pgcGenealogia.Pages[5].Enabled := False;

   end
  else
   begin
     rbShowBrinco.Enabled := True;
     rbShowNomeCompleto.Enabled := True;
     rbShowNomeEstabulo.Enabled := True;
     edtQuickSearch.Enabled := True;
     JvDBUltimGrid4.Enabled := True;
     pgcMain.Pages[0].Enabled := True;
     pgcMain.Pages[1].Enabled := True;
     pgcMain.Pages[2].Enabled := True;
     pgcMain.Pages[3].Enabled := True;
     pgcMain.Pages[4].Enabled := True;
     pgcMain.Pages[6].Enabled := True;

     pgcGenealogia.Pages[0].Enabled := True;
     pgcGenealogia.Pages[2].Enabled := True;
     pgcGenealogia.Pages[3].Enabled := True;
     pgcGenealogia.Pages[4].Enabled := True;
     pgcGenealogia.Pages[5].Enabled := True;
   end;

  UpdateGenealogy ;
end;

procedure TZoo_BancoDadosFemeaForm.edMaeButtonClick(Sender: TObject);
begin
  inherited;
  SearchMae ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_BancoDadosFemeaForm.dbEdtComposicaoRacaButtonClick(Sender: TObject);
begin
  TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).UpdateRacasGrauSangue ;
  if TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).SetComposicaoRacas ;
end;

procedure TZoo_BancoDadosFemeaForm.dbEdtComposicaoRacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).UpdateRacasGrauSangue ;
    if TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
       TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).SetComposicaoRacas ;
   end;
end;

procedure TZoo_BancoDadosFemeaForm.DBLookupComboBox5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_DELETE then
    TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).ClearMotivoDescarte ;
end;

procedure TZoo_BancoDadosFemeaForm.JvDBComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TJvDBComboBox ( Sender ).DroppedDown ) then
    begin
     Key := 0 ;
     TJvDBComboBox ( Sender ).DroppedDown := True ;
    end ;
end;

procedure TZoo_BancoDadosFemeaForm.JvDBUltimGrid4Resize(Sender: TObject);
begin
  CheckColsSize ;
end;

function TZoo_BancoDadosFemeaForm.JvDBUltimGrid5CheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin
  inherited;
  Result := Assigned ( Field ) and ( (Field.FieldName = 'PRENHEZ' ) or ( Field.FieldName = 'REEXAMINAR' ) ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;


procedure TZoo_BancoDadosFemeaForm.Pesquisar;
begin
  if cbxExibirDescartados1.Checked then
    begin
      with TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ), TSearchFemea.Create do
         try
            TextToFind := _edtSearch.Text ;
            if Execute then
              begin
                 cdsLstFemeas.Locate( 'KZOO_ANIMAL', Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).Value, [] ) ;
                 ActiveFicha ;
              end ;
         finally
            free ;
         end ;
    end
  else
    begin
      with TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ), TSearchFemeaAtivo.Create do
         try
            TextToFind := _edtSearch.Text ;
            if Execute then
              begin
                 cdsLstFemeas.Locate( 'KZOO_ANIMAL', Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).Value, [] ) ;
                 ActiveFicha ;
              end ;
         finally
            free ;
         end ;
    end;
end;


procedure TZoo_BancoDadosFemeaForm.pgcMainChange(Sender: TObject);
begin

  if ( PgcMain.ActivePage =  tbsMainGenealogia ) and (not Assigned ( FGenealogyPanel )) then
     begin
       CreateGenealogy ;
     end
  else if ( PgcMain.ActivePage =  tbsMainInformacao ) and ( tbsMainInformacao.ControlCount = 0 ) then
    with TfrmZoo_InformacoesAnimal.Create ( self  ) do
      begin
         Parent := tbsMainInformacao ;
         BorderStyle := bsNone ;
         Align := alClient ;
         MasterSource := dtsFicha ;
         Visible := True ;
         Zoo_BancoDadosFemeaDatamodule := TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ) ;
      end

  else if ( PgcMain.ActivePage =  tbsMainHistorico ) and ( tbsMainHistorico.ControlCount = 0 ) then
    with TfrmZoo_HistoricoAnimal.Create ( self  ) do
      begin
         Parent := tbsMainHistorico ;
         BorderStyle := bsNone ;
         Align := alClient ;
         MasterSource := dtsFicha ;
         Visible := True ;
      end

  else if ( PgcMain.ActivePage =  tbsMainReproducao ) and ( tbsMainReproducao.ControlCount = 0 ) then
    with TZoo_BancoDadosFemeaEventosReprodutivosForm.Create ( self ) do
      begin
         Parent := tbsMainReproducao ;
         BorderStyle := bsNone ;
         Align := alClient ;
         DadosFemea   := dtsDadosFemea ; // set before mastersource
         MasterSource := dtsFicha ;
         Visible := True ;
      end


  else if ( PgcMain.ActivePage =  tbsMainProducao ) and ( tbsMainProducao.ControlCount = 0 ) then
    with TfrmZoo_ProducaoAnimal.Create ( self  ) do
      begin
         Parent := tbsMainProducao ;
         BorderStyle := bsNone ;
         Align := alClient ;
         DadosFemea   := dtsDadosFemea ; // set before mastersource
         MasterSource := dtsFicha ;
         Visible := True ;
      end

  else if ( PgcMain.ActivePage =  tbsMainGrafico ) and ( tbsMainGrafico.ControlCount = 0 ) then
    with TfrmZoo_GraficoLactacaoAnimal.Create ( self  ) do
      begin
         Parent := tbsMainGrafico ;
         BorderStyle := bsNone ;
         Align := alClient ;
         MasterSource := dtsFicha ;
         Visible := True ;
      end ;

 CheckDataFormIntf ;
end;

procedure TZoo_BancoDadosFemeaForm.pgcMainChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if ( PgcMain.ActivePage =  tbsMainInformacao ) and ( tbsMainInformacao.ControlCount > 0 ) then
    begin
      self.DataFormIntf := nil ;
      TFrame ( tbsMainInformacao.Controls[0] ).Free
    end
  else if ( PgcMain.ActivePage =  tbsMainHistorico ) and ( tbsMainHistorico.ControlCount > 0 ) then
    begin
      self.DataFormIntf := nil ;
      TFrame ( tbsMainHistorico.Controls[0] ).Free
    end
  else if ( PgcMain.ActivePage =  tbsMainProducao ) and ( tbsMainProducao.ControlCount > 0 ) then
    begin
      self.DataFormIntf := nil ;
      TFrame ( tbsMainProducao.Controls[0] ).Free
    end
  else if ( PgcMain.ActivePage =  tbsMainReproducao ) and ( tbsMainReproducao.ControlCount > 0 ) then
    begin
      self.DataFormIntf := nil ;
      TFrame ( tbsMainReproducao.Controls[0] ).Free
    end
  else if ( PgcMain.ActivePage =  tbsMainGenealogia ) and (Assigned ( FGenealogyPanel )) then
    begin
      self.DataFormIntf := nil ;
      FreeAndNil ( FGenealogyPanel  )
    end
  else if ( PgcMain.ActivePage =  tbsMainGrafico ) and ( tbsMainGrafico.ControlCount > 0 ) then
    begin
      self.DataFormIntf := nil ;
      TFrame ( tbsMainGrafico.Controls[0] ).Free
    end;
end;

procedure TZoo_BancoDadosFemeaForm.PrintData;
begin
  if ( _pageControl.ActivePage = _tbsLista ) then
//     or ((pgcMain.ActivePage = self.tbsMainGenealogia ) and ( pgcGenealogia.ActivePage = tbsGenealogiaCadastro )) then
    Action := _actPrintLista
  else
    if Assigned ( DataFormIntf ) then
        ( self as ITcDataForm ).PrintData ;
       //self.DataFormIntf.PrintData
end;

procedure TZoo_BancoDadosFemeaForm.rbShowColumnClick(Sender: TObject);
begin
  inherited;
  self.CheckColsVisible
end;

procedure TZoo_BancoDadosFemeaForm.pgcGenealogiaChange(Sender: TObject);
begin
  if ( pgcGenealogia.ActivePage =  tbsGenealogiaPedigree ) and (not Assigned ( FGenealogyPanel )) then
     begin
       CreateGenealogy ;
     end
  else if ( pgcGenealogia.ActivePage =  tbsGenealogiaCadastro )  then
   begin
      TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).ReOpenTables
   end
  else if ( pgcGenealogia.ActivePage =  tbsGenealogiaFilhos ) and ( tbsGenealogiaFilhos.ControlCount = 0 ) then
    with TfrmZoo_FilhosAnimal.Create ( self  ) do
      begin
         Parent := tbsGenealogiaFilhos ;
         BorderStyle := bsNone ;
         Align := alClient ;
         MasterSource := dtsFicha ;
         Visible := True ;
      end
  else if ( pgcGenealogia.ActivePage =  tbsGenealogiaClassificacao ) and ( tbsGenealogiaClassificacao.ControlCount = 0 ) then
    with TfrmZoo_ClassificacaoAnimal.Create ( self  ) do
      begin
         Parent := tbsGenealogiaClassificacao ;
         BorderStyle := bsNone ;
         Align := alClient ;
         MasterSource := dtsFicha ;
         Visible := True ;
      end

  else if ( pgcGenealogia.ActivePage =  tbsGenealogiaAcasalamento ) and ( tbsGenealogiaAcasalamento.ControlCount = 0 ) then
    with TfrmZoo_AcasalamentoAnimal.Create ( self  ) do
      begin
         Parent := tbsGenealogiaAcasalamento ;
         BorderStyle := bsNone ;
         Align := alClient ;
         MasterSource := dtsFicha ;
         Visible := True ;
      end

  else if ( pgcGenealogia.ActivePage =  tbsGenealogiaCrescimento ) and ( tbsGenealogiaCrescimento.ControlCount = 0 ) then
    with TfrmZoo_CrescimentoAnimal.Create ( self  ) do
      begin
         Parent := tbsGenealogiaCrescimento ;
         BorderStyle := bsNone ;
         Align := alClient ;
         MasterSource := dtsDadosFemea ;
         Visible := True ;
      end ;

  CheckDataFormIntf;

end;


procedure TZoo_BancoDadosFemeaForm.pgcGenealogiaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if ( pgcGenealogia.ActivePage =  tbsGenealogiaPedigree ) and (Assigned ( FGenealogyPanel )) then
   begin
       self.DataFormIntf := nil ;
       FreeAndNil ( FGenealogyPanel  )
   end
  else if ( pgcGenealogia.ActivePage =  tbsGenealogiaFilhos ) and ( tbsGenealogiaFilhos.ControlCount > 0 ) then
   begin
    self.DataFormIntf := nil ;
    TFrame ( tbsGenealogiaFilhos.Controls[0] ).Free
   end
  else if ( pgcGenealogia.ActivePage =  tbsGenealogiaClassificacao ) and ( tbsGenealogiaClassificacao.ControlCount > 0 ) then
   begin
       self.DataFormIntf := nil ;
       TFrame ( tbsGenealogiaClassificacao.Controls[0] ).Free
   end
  else if ( pgcGenealogia.ActivePage =  tbsGenealogiaAcasalamento ) and ( tbsGenealogiaAcasalamento.ControlCount > 0 ) then
   begin
       self.DataFormIntf := nil ;
       TFrame ( tbsGenealogiaAcasalamento.Controls[0] ).Free
   end
  else if ( pgcGenealogia.ActivePage =  tbsGenealogiaCrescimento ) and ( tbsGenealogiaCrescimento.ControlCount > 0 ) then
   begin
       self.DataFormIntf := nil ;
       TFrame ( tbsGenealogiaCrescimento.Controls[0] ).Free
   end
end;

procedure TZoo_BancoDadosFemeaForm.IndentityClick(AIdentity: TIdentity ; ALink : boolean ) ;
begin
   if ( fsModal in self.FormState ) and ALink then
     begin
        FNextGenealogyUID := AIdentity.UID ;
        ModalResult := mrOK
     end
   else if ALink then
      begin
         TShowFichaAnimal.Execute( AIdentity.UID ) ;
         self.UpdateGenealogy
      end
   else
     begin
        with AIdentity.Parent.clientToScreen ( Point ( AIdentity.Left, AIdentity.Top ) ) do
            TZoo_EditLinhagemFrame.Execute ( X, Y,AIdentity.UID ) ;
        self.UpdateGenealogy
     end;

end;


procedure TZoo_BancoDadosFemeaForm.InitDesktopSanidade;
var
  cds : TClientDataSet ;
begin

  FDesktopSanidade  := TTCDForm.Create ( tbsMainSanidade ) ;
  FDesktopSanidade.TabPainter.ActiveColorTo     := SysTypes._TITLE_COLOR ;
  FDesktopSanidade.TabPainter.ActiveColorFrom   := clWhite ;
  FDesktopSanidade.TabPainter.ActiveFont.Color  := SysTypes._TITLE_FONT_COLOR ;
  FDesktopSanidade.TabPainter.InactiveColorTo   := FDesktopSanidade.TabPainter.ActiveColorFrom ;
  FDesktopSanidade.TabPainter.InactiveColorFrom := FDesktopSanidade.TabPainter.ActiveColorTo ;

  FDesktopSanidade.OnActivateForm := NotifyActiveFormSanidade ;
  FDesktopSanidade.OnGetClass := GetClassDesktopSanidade ;

  FEscoreTableName := TStringList.Create ;
  FEscoreKey := TStringList.Create ;

  cds := nil ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet ( cds, '* FROM ZOO_CFGESCORES' ) ;

//                   FDesktopSanidade.Controls[ 0 ]
  FDesktopSanidade.AddTab ( '&Ocorrências' ) ;
  FDesktopSanidade.AddTab ( '&Resultados de Exames' ) ;
  FDesktopSanidade.TabSet.TabWidth := 160;
  FDesktopSanidade.AddTab ( '&Condição Corporal' ) ;
  FDesktopSanidade.AddTab ( '&BST' ) ;
  FDesktopSanidade.AddTab ( 'C&MT' ) ;

  (*
  with cds do
    begin
      first ;
      while not eof do
        begin
           FDesktopSanidade.AddTab ( FieldByName('SIGLA').asString ) ;
           if FieldByName('TIPOESCORE').asString = 'C' then
             FEscoreTableName.Add ( 'ZOO_E_C' + FieldByName('TABLE_ID').asString )
           else
             FEscoreTableName.Add ( 'ZOO_E_F' + FieldByName('TABLE_ID').asString ) ;
           FEscoreKey.Add ( FieldByName ( 'KZOO_CFGESCORE' ).asString ) ;
           next ;
        end ;
    end;
  *)
  cds.free ;


end;

procedure TZoo_BancoDadosFemeaForm.GetClassDesktopSanidade(TabIndex: integer; out ObjectClass: TComponentClass);
//var
// DataFormIntf : ITcDataForm ;
begin
  inherited;
  case TabIndex of
    0 : TfrmZoo_OcorrenciasAnimal ( FDesktopSanidade.NewForm( TfrmZoo_OcorrenciasAnimal ) ).MasterSource := dtsFicha ;
    1 : TfrmZoo_ResultadoExamesAnimal ( FDesktopSanidade.NewForm( TfrmZoo_ResultadoExamesAnimal ) ).MasterSource := dtsFicha ;
    2 : TfwzZoo_CondicaoCorporalAnimal ( FDesktopSanidade.NewForm( TfwzZoo_CondicaoCorporalAnimal ) ).MasterSource := dtsFicha ;
    3 : TfwzZoo_BSTAnimal ( FDesktopSanidade.NewForm( TfwzZoo_BSTAnimal ) ).MasterSource := dtsFicha ;
    4 : TfwzZoo_CMTAnimal ( FDesktopSanidade.NewForm( TfwzZoo_CMTAnimal ) ).MasterSource := dtsFicha;
  else
       with TfwzZoo_EscoreAnimal ( FDesktopSanidade.NewForm( TfwzZoo_EscoreAnimal, 'fwzZoo_EscoreA_' + FEscoreTableName[ TabIndex - 5 ] ) ) do
          begin
            MasterSource := dtsFicha ;
            DadosFemea   := dtsDadosFemea ;
            KeyEscore := FEscoreKey[ TabIndex - 5 ] ;
          end;
  end;
(*
  if Supports( FDesktopSanidade, ITcDataForm, DataFormIntf ) then
     self.DataFormIntf := DataFormIntf
  else
     self.DataFormIntf := nil ;
*)
end;


procedure TZoo_BancoDadosFemeaForm.LinkLabel1Click(Sender: TObject);
begin
  inherited;
  TfdlgZoo_HistoricoBrincos.Execute( TZoo_BancoDadosFemeaDatamodule( DataModuleBase ).cdsAnimalKZOO_ANIMAL.asString ) ;
end;

procedure TZoo_BancoDadosFemeaForm.LinkLabel1LinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  inherited;
  TfdlgZoo_HistoricoBrincos.Execute( TZoo_BancoDadosFemeaDatamodule( DataModuleBase ).cdsAnimalKZOO_ANIMAL.asString ) ;
end;

procedure TZoo_BancoDadosFemeaForm.LinkLabel2Click(Sender: TObject);
begin
  inherited;
  TfdlgZoo_HistoricoRetiros.Execute( TZoo_BancoDadosFemeaDatamodule( DataModuleBase ).cdsAnimalKZOO_ANIMAL.asString ) ;
end;

procedure TZoo_BancoDadosFemeaForm.LinkLabel2LinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  inherited;
  TfdlgZoo_HistoricoRetiros.Execute( TZoo_BancoDadosFemeaDatamodule( DataModuleBase ).cdsAnimalKZOO_ANIMAL.asString ) ;
end;

procedure TZoo_BancoDadosFemeaForm.LinkLabel3Click(Sender: TObject);
begin
  inherited;
  TfdlgZoo_HistoricoLotes.Execute( TZoo_BancoDadosFemeaDatamodule( DataModuleBase ).cdsAnimalKZOO_ANIMAL.asString ) ;
end;

procedure TZoo_BancoDadosFemeaForm.LinkLabel3LinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  inherited;
  TfdlgZoo_HistoricoLotes.Execute( TZoo_BancoDadosFemeaDatamodule( DataModuleBase ).cdsAnimalKZOO_ANIMAL.asString ) ;
end;

procedure TZoo_BancoDadosFemeaForm.LinkLabel4Click(Sender: TObject);
begin
  inherited;
  TfdlgZoo_HistoricoStatus.Execute( TZoo_BancoDadosFemeaDatamodule( DataModuleBase ).cdsAnimalKZOO_ANIMAL.asString ) ;
end;

procedure TZoo_BancoDadosFemeaForm.LinkLabel4LinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  inherited;
  TfdlgZoo_HistoricoStatus.Execute( TZoo_BancoDadosFemeaDatamodule( DataModuleBase ).cdsAnimalKZOO_ANIMAL.asString ) ;
end;

procedure TZoo_BancoDadosFemeaForm.LinkLabelHistToqueClick(Sender: TObject);
begin
  inherited;
  TfdlgZoo_HistoricoToques.Execute( TZoo_BancoDadosFemeaDatamodule( DataModuleBase ).cdsAnimalKZOO_ANIMAL.asString );
end;

procedure TZoo_BancoDadosFemeaForm.NeedRefresh(Sender: TCLAg5NSMsg);
begin
  with TZoo_BancoDadosFemeaDataModule ( DatamoduleBase ) do
    begin
      if ( cdsAnimal.State in [dsInsert,dsEdit] ) or (cdsAnimal.ChangeCount > 0 ) then
         exit ;

      ReOpenTables ;
    end;
end;

procedure TZoo_BancoDadosFemeaForm.NotifyActiveFormSanidade(Sender: TObject);
var
 DataFormIntf : ITcDataForm ;
begin
  if Supports( FDesktopSanidade, ITcDataForm, DataFormIntf ) then
     self.DataFormIntf := DataFormIntf
  else
     self.DataFormIntf := nil ;
end;

procedure TZoo_BancoDadosFemeaForm.SearchPai(TextToSearch: string);
begin

    with TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ), TSearchPai.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             SetPai ( Result.FieldByName( 'KZOO_ANIMAL' ).asString,
                      Result.FieldByName( 'NOMEESTABULO' ).asString,
                      Result.FieldByName( 'GRAUSANGUE' ).asString,
                      Result.FieldByName( 'COMPOSICAORACA' ).asString  ) ;
       finally
          free ;
       end ;


end;

procedure TZoo_BancoDadosFemeaForm.TcMPFormShow(Sender: TObject);
begin
  inherited;
  if fsModal in  FormState then
    begin
     _pnlForm.Color := clsilver ;
     self._pageControl.parent := _pnlForm ;
     self._pnlToolButtons.parent := _pnlForm ;
     self.ActiveFicha

    end;
end;

procedure TZoo_BancoDadosFemeaForm.UpdateGenealogy;
begin
  if not Assigned ( FGenealogyPanel ) then
     exit ;

  with TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ) do
     TAnimalGenealogy.BuildIdentity (
          cdsDadosFemeaKZOO_ANIMAL_FEMEA.AsString,
          FGenealogyPanel.Identity ) ;

  FGenealogyPanel.Repaint ;
end;

procedure TZoo_BancoDadosFemeaForm._ActionListExecute(Action: TBasicAction; var Handled: Boolean);
begin
  if ( Action = _actNew )
  and (          (_pageControl.ActivePage = _tbsLista)
             or  (pgcMain.ActivePage = tbsMainInformacao )
             or (( pgcMain.ActivePage = tbsMainGenealogia ) and ( pgcGenealogia.ActivePage = tbsGenealogiaCadastro ))
            ) then
      begin
       //TInclusaoFemeaWizard.Execute (  TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ) ) ;
       //Handled := True ;
       if JvDBUltimGrid4.Focused then
        begin
           Perform(Wm_NextDlgCtl,0,0);
        end;
       _pageControl.ActivePage := _tbsFicha ;
       pgcMain.ActivePage := self.tbsMainGenealogia ;
       pgcGenealogia.ActivePage := self.tbsGenealogiaCadastro ;
       //TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).CancelUpdates;
       TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).NewRecord;
       TZoo_BancoDadosFemeaDatamodule ( DatamoduleBase ).FilterStatusOptions ;
       if self.dbeBrinco.CanFocus then
         self.dbeBrinco.SetFocus ;
       self.CheckDataFormIntf ;

      end;

  if (( Action = _actEdit ) or ( Action = _actDelete )) and ( _pageControl.ActivePage = _tbsLista ) then
    begin
       _pageControl.ActivePage := _tbsFicha ;
       pgcMain.ActivePage := self.tbsMainGenealogia ;
       pgcGenealogia.ActivePage := self.tbsGenealogiaCadastro ;
       self.dbeBrinco.SetFocus ;
       self.CheckDataFormIntf ;
    end;

  if ( Action = _actLista ) then
    self.DataFormIntf :=  self ;
end;

procedure TZoo_BancoDadosFemeaForm._ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
(*
  _actLista.Enabled  := True ;

  _actNew.Enabled    :=    (( _pageControl.ActivePage = _tbsLista ))
                        or (( pgcMain.ActivePage = tbsMainProducao ))
                        or (( pgcMain.ActivePage = tbsMainReproducao))
                        or (( pgcMain.ActivePage = tbsMainSanidade)
                               and ( FDesktopSanidade.TabSet.TabIndex <> -1 )
                            )
                        or (( pgcMain.ActivePage = tbsMainGenealogia)
                           and (   (pgcGenealogia.ActivePage = tbsGenealogiaCadastro)
                                or (pgcGenealogia.ActivePage = tbsGenealogiaClassificacao)
                                or (pgcGenealogia.ActivePage = tbsGenealogiaCrescimento)
                               )) ;


  _actEdit.Enabled   :=    (( pgcMain.ActivePage = tbsMainProducao ))
                        or (( pgcMain.ActivePage = tbsMainReproducao))
                        or (( pgcMain.ActivePage = tbsMainSanidade)
                               and ( FDesktopSanidade.TabSet.TabIndex <> -1 )
                            )
                        or (( pgcMain.ActivePage = tbsMainGenealogia)
                           and (   (pgcGenealogia.ActivePage = tbsGenealogiaCadastro)
                                or (pgcGenealogia.ActivePage = tbsGenealogiaClassificacao)
                                or (pgcGenealogia.ActivePage = tbsGenealogiaCrescimento)
                               )) ;

  _actDelete.Enabled :=   (( pgcMain.ActivePage = tbsMainProducao ))
                        or (( pgcMain.ActivePage = tbsMainReproducao))
                        or (( pgcMain.ActivePage = tbsMainSanidade)
                               and ( FDesktopSanidade.TabSet.TabIndex <> -1 )
                            )
                        or (( pgcMain.ActivePage = tbsMainGenealogia)
                           and (   (pgcGenealogia.ActivePage = tbsGenealogiaCadastro)
                                or (pgcGenealogia.ActivePage = tbsGenealogiaClassificacao)
                                or (pgcGenealogia.ActivePage = tbsGenealogiaCrescimento)
                               )) ;
  _actSave.Enabled   :=   (( pgcMain.ActivePage = tbsMainProducao ))
                        or (( pgcMain.ActivePage = tbsMainReproducao))
                        or (( pgcMain.ActivePage = tbsMainSanidade)
                               and ( FDesktopSanidade.TabSet.TabIndex <> -1 )
                            )
                        or (( pgcMain.ActivePage = tbsMainGenealogia)
                           and (   (pgcGenealogia.ActivePage = tbsGenealogiaCadastro)
                                or (pgcGenealogia.ActivePage = tbsGenealogiaClassificacao)
                                or (pgcGenealogia.ActivePage = tbsGenealogiaCrescimento)
                               )) ;
  _actCancel.Enabled :=   (( pgcMain.ActivePage = tbsMainProducao ))
                        or (( pgcMain.ActivePage = tbsMainReproducao))
                        or (( pgcMain.ActivePage = tbsMainSanidade)
                               and ( FDesktopSanidade.TabSet.TabIndex <> -1 )
                            )
                        or (( pgcMain.ActivePage = tbsMainGenealogia)
                           and (   (pgcGenealogia.ActivePage = tbsGenealogiaCadastro)
                                or (pgcGenealogia.ActivePage = tbsGenealogiaClassificacao)
                                or (pgcGenealogia.ActivePage = tbsGenealogiaCrescimento)
                               )) ;
  _actPrint.Enabled   := False ;
  _actOther.Enabled   := (( pgcMain.ActivePage = tbsMainHistorico )) ;
  actHelp.Enabled    := True ;
  *)
end;

procedure TZoo_BancoDadosFemeaForm._actListaUpdate(Sender: TObject);
begin
  if fsModal in FormState then
     _actLista.Enabled := False
  else
   inherited;
end;

procedure TZoo_BancoDadosFemeaForm._actPrintExecute(Sender: TObject);
var
  p : TReportBOFemea ;
begin
  p := TReportBOFemea.Create ;
  p.KZOO_ANIMAL_FEMEA :=
    TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ).cdsDadosFemeaKZOO_ANIMAL_FEMEA.AsString ;
  TfqrZoo_FichaFemea.Execute( p ) ;
  p.Free ;
//  inherited;
end;

procedure TZoo_BancoDadosFemeaForm._actPrintUpdate(Sender: TObject);
begin
//  inherited;

end;

procedure TZoo_BancoDadosFemeaForm._pageControlChange(Sender: TObject);
begin
  inherited;
  self.CheckDataFormIntf
end;

procedure TZoo_BancoDadosFemeaForm.Save;
begin
  inherited;
  TCLAg5NSMsgEVT_BancoDadosFemea.CreateAndDispatch( self ) ;
end;

procedure TZoo_BancoDadosFemeaForm.SearchMae(TextToSearch: string);
begin

    with TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ), TSearchMae.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             SetMae ( Result.FieldByName( 'KZOO_ANIMAL' ).asString,
                      Result.FieldByName( 'NOMEESTABULO' ).asString,
                      Result.FieldByName( 'GRAUSANGUE' ).asString,
                      Result.FieldByName( 'COMPOSICAORACA' ).asString  ) ;
       finally
          free ;
       end ;
end;


{ TJvPageControl }

//procedure TJvPageControl.CMDialogChar(var Message: TCMDialogChar);
//begin
//    self.ActivePage.BroadCast ( Message ) ;
//end;



{ TShowFichaFemea }

function TShowFichaFemea.Execute( AKZOOANIMAL : string ) : string ;
begin
    TZoo_BancoDadosFemeaForm.KZOOANIMAL := AKZOOANIMAL ;
    with TZoo_BancoDadosFemeaForm.Create ( nil ) do
      try
        Result := '' ;
        BorderStyle := bsDialog ;
        if showModal = mrOk  then
           Result := NextGenealogyUID  ;
      finally
        free ;
      end;
end;

initialization
  RegisterClass ( TZoo_BancoDadosFemeaForm ) ;
  TShowFichaAnimal.RegisterClass ( TShowFichaFemea, ptafFemea ) ;
end.
