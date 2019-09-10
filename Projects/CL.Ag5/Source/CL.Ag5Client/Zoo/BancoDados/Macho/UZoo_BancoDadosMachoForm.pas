unit UZoo_BancoDadosMachoForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Dialogs, VCL.Grids, VCL.DBGrids, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid , UZoo_BancoDadosMachoDatamodule, JvDBControls,
  SysFormListaFicha, ReportTypes, VCL.DBCtrls, JvExExtCtrls, JvImage, JvExtComponent,
  JvPanel, Tc.VCL.Edits, UZoo_AnimaisGenealogiaClass, Tc.VCL.Edits.DBControls,
  JvBaseEdits, JvExStdCtrls, JvEdit, JvDBSearchEdit, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, VCL.ImgList, ClAg5Types,
  JvComCtrls, JvExComCtrls, ClAg5ClientZootecnicoCommonTypes,
  JvCombobox, JvDBCombobox, JvDBCheckBox, System.Actions,
  System.ImageList, Tc.VCL.Edits.Numbers,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Tc.VCL.Application, uImageListProvider, Wrappers  ;

type
  TZoo_BancoDadosMachoForm = class(T_FormListaFicha)
    pgcMain: TJvPageControl;
    tbsMainCadastro: TTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label36: TLabel;
    Label1: TLabel;
    DBEdit4: TDBEdit;
    JvDBDateEdit2: TTcDBDateEdit;
    LinkLabel1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    tbsMontaUtilizacao: TTabSheet;
    tbsPedigree: TTabSheet;
    DBLookupComboBox1: TDBLookupComboBox;
    dtsDadosMacho: TDataSource;
    GroupBox1: TGroupBox;
    Label26: TLabel;
    JvDBDateEdit1: TTcDBDateEdit;
    Label27: TLabel;
    DBEdit7: TDBEdit;
    Label28: TLabel;
    JvDBCalcEdit2: TJvDBCalcEdit;
    gbxEstoque: TGroupBox;
    JvDBCalcEdit1: TJvDBCalcEdit;
    Label3: TLabel;
    _pnldbgLista2: TPanel;
    JvDBUltimGrid4: TJvDBUltimGrid;
    Panel9: TPanel;
    rbShowBrinco: TRadioButton;
    rbShowNomeEstabulo: TRadioButton;
    rbShowNomeCompleto: TRadioButton;
    edtQuickSearch: TJvDBSearchEdit;
    cbxExibirDescartados2: TCheckBox;
    Splitter1: TSplitter;
    dtsLinhagem: TDataSource;
    GroupBox3: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    edPai: TJvDBComboEdit;
    edMae: TJvDBComboEdit;
    JvDBCalcEdit3: TJvDBCalcEdit;
    Label4: TLabel;
    Label5: TLabel;
    JvDBCalcEdit4: TJvDBCalcEdit;
    Label6: TLabel;
    JvDBCalcEdit5: TJvDBCalcEdit;
    tbsCompra: TTabSheet;
    tbsSanidade: TTabSheet;
    tbsSemen: TTabSheet;
    tbsCrescimento: TTabSheet;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit10: TJvDBCalcEdit;
    DBEdit12: TJvDBCalcEdit;
    DBEdit13: TJvDBCalcEdit;
    DBEdit14: TJvDBCalcEdit;
    DBEdit15: TJvDBCalcEdit;
    GroupBox5: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    JvDBCalcEdit6: TJvDBCalcEdit;
    JvDBCalcEdit7: TJvDBCalcEdit;
    JvDBCalcEdit8: TJvDBCalcEdit;
    JvDBCalcEdit9: TJvDBCalcEdit;
    GroupBox6: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    Panel2: TPanel;
    dbgCrescimento: TJvDBUltimGrid;
    Panel3: TPanel;
    dbgSanidade: TJvDBUltimGrid;
    Panel4: TPanel;
    dbgCompra: TJvDBUltimGrid;
    dtsCrescimento: TDataSource;
    dtsSanidade: TDataSource;
    dtsCompra: TDataSource;
    JvTabDefaultPainter1: TJvTabDefaultPainter;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit16: TDBEdit;
    Label29: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label20: TLabel;
    dbxGrauSangue: TDBComboBox;
    dbEdtComposicaoRaca: TJvDBComboEdit;
    deDataCrescimento: TTcDBDateEdit;
    dbMemoCrescimento: TDBMemo;
    deDataSanidade: TTcDBDateEdit;
    dbMemoSanidade: TDBMemo;
    dbchkOriginadoEmbriao: TDBCheckBox;
    _PnlForm: TPanel;
    JvDBCalcEdit10: TJvDBCalcEdit;
    Label2: TLabel;
    JvDBCalcEdit11: TJvDBCalcEdit;
    Label22: TLabel;
    dtsDescartes: TDataSource;
    gbxDescarte: TGroupBox;
    Label34: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    JvDBCalcEdit12: TJvDBCalcEdit;
    TcMPDBDateEdit1: TTcDBDateEdit;
    DBMemo1: TDBMemo;
    JvDBComboBox1: TJvDBComboBox;
    dtsTipoDescarte: TDataSource;
    cbxExibirDescartados1: TCheckBox;
    cbxSememAtivo: TDBCheckBox;
    edValorDose: TTcDBCalcEdit;
    edDoses: TTcDBCalcEdit;
    edDataCompraSemen: TTcDBDateEdit;
    Image1: TImage;
    ImageList1: TImageList;
    gbxManejo: TGroupBox;
    Label30: TLabel;
    dbeRetiro: TDBEdit;
    Label31: TLabel;
    dbeLote: TDBEdit;
    dbchkAnimalDeTerceiro: TDBCheckBox;
    procedure pgcMainChange(Sender: TObject);
    procedure rbShowColumnClick(Sender: TObject);
    procedure edPaiButtonClick(Sender: TObject);
    procedure edMaeButtonClick(Sender: TObject);
    procedure dtsListaDataChange(Sender: TObject; Field: TField);
    procedure _ActionListExecute(Action: TBasicAction; var Handled: Boolean);
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure dbEdtComposicaoRacaButtonClick(Sender: TObject);
    procedure dbEdtComposicaoRacaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgCrescimentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TcMPFormShow(Sender: TObject);
    procedure _actListaUpdate(Sender: TObject);
    procedure dbxGrauSangueKeyPress(Sender: TObject; var Key: Char);
    procedure _actDeleteExecute(Sender: TObject);
    procedure _actEditUpdate(Sender: TObject);
    procedure _actDeleteUpdate(Sender: TObject);
    procedure _actEditExecute(Sender: TObject);
    procedure _actNewUpdate(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure JvDBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxExibirDescartadosClick(Sender: TObject);
    procedure _actPrintExecute(Sender: TObject);
    procedure LinkLabel1Click(Sender: TObject);
    procedure edtQuickSearchChange(Sender: TObject);
  private
    { Private declarations }
//    FGenealogyPanel : TGenealogyPanel ;
    FGenealogyPanel : TZoo_AnimaisGenealogiaFrame ;
    FNextGenealogyUID: string;
    procedure CheckColsVisible ;
    procedure CheckColsSize ;
    procedure SearchPai ( TextToSearch : string);
    procedure SearchMae ( TextToSearch : string);
    procedure IndentityClick( AIdentity : TIdentity ; ALink : boolean ) ;
    procedure NeedRefresh ( Sender : TCLAg5NSMsg ) ;
    procedure CheckQuickSearchIsValid ;
    procedure  ExibirDescartados ( AExibirDescartados : boolean  ) ;
    procedure ShowNewFastRegister(Sender: TObject);
  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
    procedure CreateGenealogy ;
    procedure UpdateGenealogy;
  public
    { Public declarations }
    class var KZOOANIMAL : string ;
    property NextGenealogyUID : string read FNextGenealogyUID ;
    //Constructor Create ( AOwner : TComponent ) ; override ;
    procedure AfterConstruction ; override ;
    destructor Destroy ; override ;
    class procedure ExecuteNewFastRegister;
  end;

  TShowFichaMacho = class ( TInterfacedPersistent, IShowFichaAnimal )
  public
     function Execute( AKZOOANIMAL : string ) : string ;
  end;

implementation

// insira a unit ''dtm'' do form na clausula uses
// conforme exemplo :
uses SysTypes, SearchsZootecnico, UfdlgZoo_HistoricoBrincos,
  UZoo_BancoDadosMachoEventosReprodutivosForm,
  UInclusaoMachoWizard, UZoo_EditLinhagemFrame, USvcZootecnico,
  NewFastRegisterIntf,
  SysPrintGridDialog ;

{$R *.dfm}
type
  SvcMachoNewFastRegisterFactory = class( TInterfacedObject, INewFastRegister )
    procedure ExecuteNewRegister ;
  end;

procedure TZoo_BancoDadosMachoForm.CheckQuickSearchIsValid ;
begin
   Image1.Picture := nil ;
   if edtQuickSearch.Text <> '' then
     if TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsAnimalBRINCO.AsString = edtQuickSearch.Text then
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

procedure TZoo_BancoDadosMachoForm.cbxExibirDescartadosClick(Sender: TObject);
begin
  ExibirDescartados ( TCheckBox ( Sender ).Checked ) ;
end;

procedure TZoo_BancoDadosMachoForm.CheckColsSize;
begin
  JvDBUltimGrid4.Columns[0].Width := JvDBUltimGrid4.Width ;
  JvDBUltimGrid4.Columns[1].Width := JvDBUltimGrid4.Width ;
  JvDBUltimGrid4.Columns[2].Width := JvDBUltimGrid4.Width ;
end;

procedure TZoo_BancoDadosMachoForm.CheckColsVisible;
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

(*
constructor TZoo_BancoDadosMachoForm.Create(AOwner: TComponent);
*)
procedure TZoo_BancoDadosMachoForm.AfterConstruction ;
begin
  inherited;

  JvTabDefaultPainter1.ActiveColorTo     := SysTypes._TITLE_COLOR ;
  JvTabDefaultPainter1.ActiveColorFrom   := clWhite ;
  JvTabDefaultPainter1.ActiveFont.Color  := SysTypes._TITLE_FONT_COLOR ;
  JvTabDefaultPainter1.InactiveColorTo   := JvTabDefaultPainter1.ActiveColorFrom ;
  JvTabDefaultPainter1.InactiveColorFrom := JvTabDefaultPainter1.ActiveColorTo ;

  pgcMain.ActivePage := tbsMainCadastro ;

  //  defina o tipo de apresentacao do form
  //  caso nao definido, irá usar o default : flLayoutAba
  //  FormLayout := flLayoutAba ; // opcoes : flLayoutAba, flLayoutDual, flLayoutModal

  // insira a criação do datamodule, ex:
///  pgcMain.ActivePage := tbsMainCadastro ;
  ActiveFicha ;
  ActiveLista ;

  TZoo_BancoDadosMachoDatamodule.Create ( self ) ;

   _pnldbgLista2.Visible := KZOOANIMAL = '' ;

   TZoo_BancoDadosMachoDatamodule ( DatamoduleBase ).KZOOANIMAL := TZoo_BancoDadosMachoForm.KZOOANIMAL ;

    KZOOANIMAL := '' ;

  DatamoduleBase.OpenTables ;

  dtsLista.DataSet        := TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsLstMachos ;
  dtsFicha.DataSet        := TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsAnimal ;
  dtsDadosMacho.DataSet   := TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsDadosMacho ;
  dtsLinhagem.DataSet     := TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsLinhagem ;
  dtsCrescimento.DataSet  := TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCrescimento ;
  dtsSanidade.DataSet     := TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsSanidade ;
  dtsCompra.DataSet       := TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCompras ;
  dtsTipoDescarte.DataSet := TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsTipoMotivoDescarte ;
  dtsDescartes.DataSet    := TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsDescartes ;
//  D Zoo_BancoDadosMachoDatamodule.cdsDadosMacho
   TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).GrauDeSangue.GetGrausSangue ( dbxGrauSangue.Items ) ;

  CheckColsVisible;

  gbxDescarte.Top := gbxEstoque.Top ;

  TCLAg5NSMsgEVT_PartosAbortos.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CiosCoberturas.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_EstoqueSemen.Subscribe( NeedRefresh ) ;

  CheckQuickSearchIsValid ;

end;

procedure TZoo_BancoDadosMachoForm.CreateGenealogy;
begin
  FGenealogyPanel := TZoo_AnimaisGenealogiaFrame.Create( tbsPedigree ) ;
  FGenealogyPanel.Parent := tbsPedigree ;
  FGenealogyPanel.Align := alClient ;
  FGenealogyPanel.Identity := TIdentity.make( FGenealogyPanel, 3 )  ;
  FGenealogyPanel.OnIdentityClick := IndentityClick ;
  FGenealogyPanel.disableDraw := False ;
  UpdateGenealogy ;
end;

procedure TZoo_BancoDadosMachoForm.dbEdtComposicaoRacaButtonClick(
  Sender: TObject);
begin
  TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).UpdateRacasGrauSangue ;
  if TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).SetComposicaoRacas;
end;

procedure TZoo_BancoDadosMachoForm.dbEdtComposicaoRacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    TZoo_BancoDadosMachoDatamodule ( DatamoduleBase ).UpdateRacasGrauSangue ;
    if TZoo_BancoDadosMachoDatamodule ( DatamoduleBase ).GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
         TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).SetComposicaoRacas;
   end;
end;

procedure TZoo_BancoDadosMachoForm.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

destructor TZoo_BancoDadosMachoForm.Destroy;
begin
  TCLAg5NSMsgEVT_PartosAbortos.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CiosCoberturas.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_EstoqueSemen.UnSubscribe( NeedRefresh ) ;
  inherited;
end;

procedure TZoo_BancoDadosMachoForm.dtsFichaDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned ( DatamoduleBase )  then
     exit ;

  if Assigned ( Field ) and (Field <> TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsAnimalSTATUS)   then
    exit ;

  tbsSemen.TabVisible       :=  TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsAnimalSTATUS.AsInteger =   _ST_SIGLA_STATUS_ANIMAL_SEMEN ;
  tbsCrescimento.TabVisible :=  TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsAnimalSTATUS.AsInteger <>  _ST_SIGLA_STATUS_ANIMAL_SEMEN ;
  tbsSanidade.TabVisible    :=  TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsAnimalSTATUS.AsInteger <>  _ST_SIGLA_STATUS_ANIMAL_SEMEN ;
  tbsCompra.TabVisible      :=  TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsAnimalSTATUS.AsInteger =   _ST_SIGLA_STATUS_ANIMAL_SEMEN ;

  gbxEstoque.Visible        := TZoo_BancoDadosMachoDatamodule(DatamoduleBase).cdsAnimalSTATUS.AsInteger = _ST_SIGLA_STATUS_ANIMAL_SEMEN ;
  gbxDescarte.Visible       := TZoo_BancoDadosMachoDatamodule(DatamoduleBase).cdsAnimalSTATUS.AsInteger <> _ST_SIGLA_STATUS_ANIMAL_SEMEN ;
  cbxSememAtivo.Visible     := TZoo_BancoDadosMachoDatamodule(DatamoduleBase).cdsAnimalSTATUS.AsInteger = _ST_SIGLA_STATUS_ANIMAL_SEMEN ;

end;

procedure TZoo_BancoDadosMachoForm.dtsListaDataChange(Sender: TObject;
  Field: TField);
begin
  if dtsLista.DataSet.State in [dsInsert, dsEdit] then
   begin
     rbShowBrinco.Enabled := False;
     rbShowNomeEstabulo.Enabled := False;
     rbShowNomeCompleto.Enabled := False;
     edtQuickSearch.Enabled := False;
     JvDBUltimGrid4.Enabled := False;
     pgcMain.Pages[1].Enabled := False;
     pgcMain.Pages[2].Enabled := False;
     pgcMain.Pages[3].Enabled := False;
     pgcMain.Pages[4].Enabled := False;
     pgcMain.Pages[6].Enabled := False;
   end
  else
   begin
     rbShowBrinco.Enabled := True;
     rbShowNomeEstabulo.Enabled := True;
     rbShowNomeCompleto.Enabled := True;
     edtQuickSearch.Enabled := True;
     JvDBUltimGrid4.Enabled := True;
     pgcMain.Pages[1].Enabled := True;
     pgcMain.Pages[2].Enabled := True;
     pgcMain.Pages[3].Enabled := True;
     pgcMain.Pages[4].Enabled := True;
     pgcMain.Pages[6].Enabled := True;
   end;
  UpdateGenealogy ;
end;

procedure TZoo_BancoDadosMachoForm.edPaiButtonClick(Sender: TObject);
begin
  SearchPai ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_BancoDadosMachoForm.edtQuickSearchChange(Sender: TObject);
begin
  CheckQuickSearchIsValid ;
end;

class procedure TZoo_BancoDadosMachoForm.ExecuteNewFastRegister;
var
  ThisForm : TZoo_BancoDadosMachoForm;
  Handled: Boolean;
begin
  ThisForm := TZoo_BancoDadosMachoForm.Create(nil);
  ThisForm.OnShow := ThisForm.ShowNewFastRegister;
  ThisForm._pageControl.Pages[0].TabVisible := False;
  ThisForm._pageControl.Pages[1].TabVisible := False;
  //ThisForm._pageControl.ActivePageIndex := 1;
  ThisForm._pageControl.ActivePage := ThisForm._tbsFicha;
  ThisForm._pnldbgLista2.Visible := False;
  //ThisForm.pgcMain.ActivePageIndex := 0;
  ThisForm.PgcMain.ActivePage := ThisForm.tbsMainCadastro;
  ThisForm._actLista.Enabled := False;
  ThisForm._actEdit.Enabled := False;
  ThisForm._ActionListExecute(ThisForm._actNew, Handled);
  {ThisForm.pgcMain.Pages[0].TabVisible := False;
  ThisForm.pgcMain.Pages[1].TabVisible := False;
  ThisForm.pgcMain.Pages[2].TabVisible := False;
  ThisForm.pgcMain.Pages[3].TabVisible := False;
  ThisForm.pgcMain.Pages[4].TabVisible := False;
  ThisForm.pgcMain.Pages[5].TabVisible := False;
  ThisForm.pgcMain.Pages[6].TabVisible := False;
  ThisForm.PgcMain.ActivePage := ThisForm.tbsMainCadastro;}
  //ThisForm.dtsFicha.OnDataChange := nil;
  try
    ThisForm.ShowModal;
  finally
    FreeAndNil(ThisForm);
  end;
end;

procedure TZoo_BancoDadosMachoForm.ExibirDescartados(
  AExibirDescartados: boolean);
begin
   cbxExibirDescartados1.OnClick := nil ;
   cbxExibirDescartados2.OnClick := nil ;
   cbxExibirDescartados1.Checked := AExibirDescartados ;
   cbxExibirDescartados2.Checked := AExibirDescartados ;
   TZoo_BancoDadosMachoDatamodule ( DatamoduleBase ).ExibirDescartados := AExibirDescartados ;
   cbxExibirDescartados1.OnClick := cbxExibirDescartadosClick ;
   cbxExibirDescartados2.OnClick := cbxExibirDescartadosClick ;
end;

procedure TZoo_BancoDadosMachoForm.IndentityClick(AIdentity: TIdentity ; ALink : boolean ) ;
begin
   if ( fsModal in self.FormState ) and ALink then
     begin
        FNextGenealogyUID := AIdentity.UID ;
        ModalResult := mrOK
     end
   else if ALink then
     begin
      TShowFichaAnimal.Execute( AIdentity.UID ) ;
      self.UpdateGenealogy ;
     end
   else
     begin
        with AIdentity.Parent.clientToScreen ( Point ( AIdentity.Left, AIdentity.Top ) ) do
            TZoo_EditLinhagemFrame.Execute ( X, Y,AIdentity.UID ) ;
        self.UpdateGenealogy
     end;

end;

procedure TZoo_BancoDadosMachoForm.JvDBComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TJvDBComboBox ( Sender ).DroppedDown ) then
    begin
     Key := 0 ;
     TJvDBComboBox ( Sender ).DroppedDown := True ;
    end ;
end;

procedure TZoo_BancoDadosMachoForm.dbgCrescimentoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
      Key := 0 ;
end;

procedure TZoo_BancoDadosMachoForm.edMaeButtonClick(Sender: TObject);
begin
  SearchMae ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_BancoDadosMachoForm.LinkLabel1Click(Sender: TObject);
begin
  TfdlgZoo_HistoricoBrincos.Execute( TZoo_BancoDadosMachoDatamodule( DataModuleBase ).cdsAnimalKZOO_ANIMAL.asString ) ;
end;

procedure TZoo_BancoDadosMachoForm.NeedRefresh(Sender: TCLAg5NSMsg );
begin
  with TZoo_BancoDadosMachoDatamodule ( DatamoduleBase ) do
    begin
      if ( cdsAnimal.State in [dsInsert,dsEdit] ) or (cdsAnimal.ChangeCount > 0 ) then
         exit ;

      ReOpenTables ;
    end;
end;

procedure TZoo_BancoDadosMachoForm.pgcMainChange(Sender: TObject);
begin
  if ( pgcMain.ActivePage =  tbsMainCadastro ) then
       TZoo_BancoDadosMachoDatamodule ( DatamoduleBase ).ReopenTables
  else if ( pgcMain.ActivePage =  tbsPedigree ) then
     begin
       if (not Assigned ( FGenealogyPanel )) then
         CreateGenealogy
       else
         UpdateGenealogy
     end
  else if ( PgcMain.ActivePage = tbsMontaUtilizacao ) and ( tbsMontaUtilizacao.ControlCount = 0 ) then
    with TZoo_BancoDadosMachoEventosReprodutivosForm.Create ( self ) do
      begin
         Parent := tbsMontaUtilizacao ;
         BorderStyle := bsNone ;
         Align := alClient ;
         MasterSource := dtsFicha ;
         Visible := True ;
      end
end;

procedure TZoo_BancoDadosMachoForm.rbShowColumnClick(Sender: TObject);
begin
  self.CheckColsVisible
end;


procedure TZoo_BancoDadosMachoForm.SearchPai(TextToSearch: string);
begin

    with TZoo_BancoDadosMachoDatamodule( DatamoduleBase ), TSearchPai.Create do
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

procedure TZoo_BancoDadosMachoForm.ShowNewFastRegister(Sender: TObject);
begin
  _pnlForm.Color := clsilver ;
  self._pageControl.parent := _pnlForm ;
  self._pnlToolButtons.parent := _pnlForm ;
  if DbEdit1.CanFocus then
     dbEdit1.SetFocus;
end;

procedure TZoo_BancoDadosMachoForm.TcMPFormShow(Sender: TObject);
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

procedure TZoo_BancoDadosMachoForm.UpdateGenealogy;
begin

  if not Assigned ( FGenealogyPanel ) then
     exit ;

  with TZoo_BancoDadosMACHODatamodule( DatamoduleBase ) do
     TAnimalGenealogy.BuildIdentity (
          cdsDadosMachoKZOO_ANIMAL_MACHO.AsString,
          FGenealogyPanel.Identity ) ;

  FGenealogyPanel.Repaint ;

end;

procedure TZoo_BancoDadosMachoForm._actCancelExecute(Sender: TObject);
begin
  inherited;
   if PgcMain.ActivePage =  tbsCrescimento then
     begin
      dbgCrescimento.EditorMode := False  ;
      dbgCrescimento.CloseControl ;
     end
   else if PgcMain.ActivePage =  tbsSanidade then
     begin
      dbgSanidade.EditorMode := False  ;
      dbgSanidade.CloseControl ;
     end
   else if PgcMain.ActivePage =  tbsCompra then
     begin
      dbgCompra.EditorMode := False  ;
      dbgCompra.CloseControl ;
     end;

   ModalResult := mrCancel;
end;

procedure TZoo_BancoDadosMachoForm._actDeleteExecute(Sender: TObject);
begin
   if PgcMain.ActivePage =  tbsCrescimento then
     begin
      if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
        exit ;
      TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCrescimento.Delete ;
      TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).ApplyUpdates ;
     end
   else if PgcMain.ActivePage =  tbsSanidade then
     begin
      if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
        exit ;
      TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsSanidade.Delete ;
      TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).ApplyUpdates ;
     end
   else if PgcMain.ActivePage =  tbsCompra then
     begin
      if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
        exit ;
      TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCompras.Delete ;
      TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).ApplyUpdates ;
     end
   else
     inherited ;
end;

procedure TZoo_BancoDadosMachoForm._actDeleteUpdate(Sender: TObject);
begin
  if       ( pgcMain.ActivePage  = tbsMainCadastro )  then
     inherited
  else if  ( pgcMain.ActivePage = tbsCrescimento  )  then
    with TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCrescimento do
    _actDelete.Enabled := not ( BOF and EOF )
  else if  ( pgcMain.ActivePage = tbsSanidade     )  then
    with TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsSanidade do
    _actDelete.Enabled := not ( BOF and EOF )
  else if  ( pgcMain.ActivePage = tbsCompra     )  then
    with TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCompras do
    _actDelete.Enabled := not ( BOF and EOF )
  else
    _actDelete.Enabled := False ;
end;

procedure TZoo_BancoDadosMachoForm._actEditExecute(Sender: TObject);
begin
   if PgcMain.ActivePage =  tbsCrescimento then
     begin
      TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCrescimento.Edit ;
      dbgCrescimento.SetFocus ;
      dbgCrescimento.EditorMode := True  ;
     end
   else if PgcMain.ActivePage =  tbsSanidade then
     begin
      TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsSanidade.Edit ;
      dbgSanidade.SetFocus ;
      dbgSanidade.EditorMode := True  ;
     end
   else if PgcMain.ActivePage =  tbsCompra then
     begin
      TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCompras.Edit ;
      dbgCompra.SetFocus ;
      dbgCompra.EditorMode := True  ;
     end
   else
     inherited ;
end;

procedure TZoo_BancoDadosMachoForm._actEditUpdate(Sender: TObject);
begin
  if       ( pgcMain.ActivePage  = tbsMainCadastro )  then
     inherited
  else if  ( pgcMain.ActivePage = tbsCrescimento  )  then
    with TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCrescimento do
    _actEdit.Enabled := (not ( BOF and EOF )) and ( not (State in [dsInsert,dsEdit]))
  else if  ( pgcMain.ActivePage = tbsSanidade     )  then
    with TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsSanidade do
    _actEdit.Enabled := (not ( BOF and EOF )) and ( not (State in [dsInsert,dsEdit]))
  else if  ( pgcMain.ActivePage = tbsCompra     )  then
    with TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCompras do
    _actEdit.Enabled := (not ( BOF and EOF )) and ( not (State in [dsInsert,dsEdit]))
  else
    _actEdit.Enabled := False ;
end;

procedure TZoo_BancoDadosMachoForm._ActionListExecute(Action: TBasicAction;
  var Handled: Boolean);
begin

  if Action = _actNew then
    begin
     if PgcMain.ActivePage =  tbsCrescimento then
       begin
        TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCrescimento.Append ;
        dbgCrescimento.SetFocus ;
        dbgCrescimento.EditorMode := true ;
       end
     else if PgcMain.ActivePage =  tbsSanidade then
       begin
        TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsSanidade.Append ;
        dbgSanidade.SetFocus ;
        dbgSanidade.EditorMode := true ;
       end
     else if PgcMain.ActivePage =  tbsCompra then
       begin
        TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).cdsCompras.Append ;
        dbgCompra.SetFocus ;
        dbgCompra.EditorMode := true ;
       end
     else
      begin
       //TInclusaoMachoWizard.Execute (  TZoo_BancoDadosMachoDatamodule ( DatamoduleBase ) ) ;
          if Assigned( DbEdit1 ) and ( DbEdit1.CanFocus ) and ( DbEdit1.Showing ) then
            dbEdit1.SetFocus;
          TZoo_BancoDadosMachoDatamodule( DatamoduleBase ).NewRecord;
      end;

     Handled := True ;
    end;

end;

procedure TZoo_BancoDadosMachoForm._actListaUpdate(Sender: TObject);
begin

  if fsModal in FormState then
     _actLista.Enabled := False
  else
     inherited ;

end;

procedure TZoo_BancoDadosMachoForm._actNewUpdate(Sender: TObject);
begin
  if    ( pgcMain.ActivePage  = tbsMainCadastro )
     or (  pgcMain.ActivePage = tbsCrescimento )
     or (  pgcMain.ActivePage = tbsSanidade    )
     or (  pgcMain.ActivePage = tbsCompra      ) then
     inherited
  else
    _actNew.Enabled := False ;
end;

procedure TZoo_BancoDadosMachoForm._actPrintExecute(Sender: TObject);
begin
  if ( _pageControl.ActivePage = _tbsFicha ) then
    begin
      if       pgcMain.ActivePage =  tbsCrescimento     then SysPrintGridDialog.TPrintGridDialog.Execute( dbgCrescimento, 'Crescimento' )
      else if  pgcMain.ActivePage =  tbsSanidade        then SysPrintGridDialog.TPrintGridDialog.Execute( dbgSanidade,    'Sanidade' )
      else if  pgcMain.ActivePage =  tbsCompra          then SysPrintGridDialog.TPrintGridDialog.Execute( dbgCompra,      'Compra de Sêmen' )
      else if  pgcMain.ActivePage =  tbsMontaUtilizacao then TZoo_BancoDadosMachoEventosReprodutivosForm( tbsMontaUtilizacao.Controls[0] ).Print
      else
       inherited;
      end
    else
      inherited;

end;

procedure TZoo_BancoDadosMachoForm._actSaveExecute(Sender: TObject);
begin
   inherited ;

   if PgcMain.ActivePage =  tbsCrescimento then
     begin
      dbgCrescimento.EditorMode := False  ;
      dbgCrescimento.CloseControl ;
     end
   else if PgcMain.ActivePage =  tbsSanidade then
     begin
      dbgSanidade.EditorMode := False  ;
      dbgSanidade.CloseControl ;
     end;

   ModalResult := mrOk;
end;

procedure TZoo_BancoDadosMachoForm.SearchMae(TextToSearch: string);
begin
    with TZoo_BancoDadosMachoDatamodule( DatamoduleBase ), TSearchMae.Create do
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

procedure TZoo_BancoDadosMachoForm.Pesquisar;
begin
  inherited ;

  with TZoo_BancoDadosMachoDatamodule( DatamoduleBase ), TSearchMacho.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsLstMachos.Locate( 'KZOO_ANIMAL',
                     Result.FieldByName( 'KZOO_ANIMAL_MACHO' ).Value, [] ) ;
             ActiveFicha ;
          end ;
     finally
        free ;
     end ;
end;

{ TShowFichaMacho }

function TShowFichaMacho.Execute( AKZOOANIMAL : string ) : string ;
begin
    TZoo_BancoDadosMachoForm.KZOOANIMAL := AKZOOANIMAL ;
    with TZoo_BancoDadosMachoForm.Create ( nil ) do
      try
        Result := '' ;
        BorderStyle := bsDialog ;
        if showModal = mrOK then
          Result := NextGenealogyUID  ;
      finally
        free ;
      end;
end;


{ SvcMachoNewFastRegisterFactory }

procedure SvcMachoNewFastRegisterFactory.ExecuteNewRegister;
begin
  TZoo_BancoDadosMachoForm.ExecuteNewFastRegister;
end;

initialization
  RegisterClass ( TZoo_BancoDadosMachoForm ) ;
  TShowFichaAnimal.RegisterClass( TShowFichaMacho, ptafMacho ) ;
  SvcMachoNewFastRegister := SvcMachoNewFastRegisterFactory.Create ;
finalization
  SvcMachoNewFastRegister := nil ;
end.
