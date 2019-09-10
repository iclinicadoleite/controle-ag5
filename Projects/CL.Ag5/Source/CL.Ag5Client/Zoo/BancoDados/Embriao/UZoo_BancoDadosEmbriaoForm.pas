unit UZoo_BancoDadosEmbriaoForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid ,
  SysFormListaFicha, ReportTypes, VCL.DBCtrls, JvExExtCtrls, JvImage,
  UZoo_AnimaisGenealogiaClass,
  JvDBControls, JvExtComponent, JvPanel, Tc.VCL.Edits, Tc.VCL.Edits.DBControls,
  JvBaseEdits, JvExStdCtrls, JvEdit, JvDBSearchEdit, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, VCL.ImgList,
  JvComCtrls, JvExComCtrls,
  ClAg5ClientZootecnicoCommonTypes, System.Actions,
  CL.Ag5.NSMsgs, System.ImageList, Tc.VCL.Extended.Mask, Tc.VCL.Application,
  uImageListProvider, Wrappers  ;

type
  TZoo_BancoDadosEmbriaoForm = class(T_FormListaFicha)
    pgcMain: TJvPageControl;
    tbsMainCadastro: TTabSheet;
    Label21: TLabel;
    Label23: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    tbsPedigree: TTabSheet;
    dtsDadosEmbriao: TDataSource;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    JvDBCalcEdit1: TJvDBCalcEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    JvDBCalcEdit2: TJvDBCalcEdit;
    JvDBDateEdit1: TTcDBDateEdit;
    DBEdit7: TDBEdit;
    tbsMainReproducao: TTabSheet;
    _pnldbgLista2: TPanel;
    JvDBUltimGrid4: TJvDBUltimGrid;
    Panel9: TPanel;
    rbShowBrinco: TRadioButton;
    rbShowNomeCompleto: TRadioButton;
    edtQuickSearch: TJvDBSearchEdit;
    Splitter1: TSplitter;
    dtsLinhagem: TDataSource;
    GroupBox3: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    edPai: TJvDBComboEdit;
    edMae: TJvDBComboEdit;
    JvTabDefaultPainter1: TJvTabDefaultPainter;
    JvDBCalcEdit3: TJvDBCalcEdit;
    JvDBCalcEdit4: TJvDBCalcEdit;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    Label29: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label8: TLabel;
    dbxGrauSangue: TDBComboBox;
    dbEdtComposicaoRaca: TJvDBComboEdit;
    _PnlForm: TPanel;
    Image1: TImage;
    ImageList1: TImageList;
    procedure rbShowColumnClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure edPaiButtonClick(Sender: TObject);
    procedure edMaeButtonClick(Sender: TObject);
    procedure dtsListaDataChange(Sender: TObject; Field: TField);
    procedure _ActionListExecute(Action: TBasicAction; var Handled: Boolean);
    procedure dbEdtComposicaoRacaButtonClick(Sender: TObject);
    procedure dbEdtComposicaoRacaKeyPress(Sender: TObject; var Key: Char);
    procedure TcMPFormShow(Sender: TObject);
    procedure _actListaUpdate(Sender: TObject);
    procedure dbxGrauSangueKeyPress(Sender: TObject; var Key: Char);
    procedure _actNewUpdate(Sender: TObject);
    procedure _actEditUpdate(Sender: TObject);
    procedure _actDeleteUpdate(Sender: TObject);
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
    procedure NeedRefresh ( Sender : TCLAg5NSMsg );
    procedure CheckQuickSearchIsValid ;
  protected
    { Protected declarations }
    procedure  Pesquisar ; override ;
    procedure  CreateGenealogy ;
    procedure  UpdateGenealogy ;
  public
    { Public declarations }
    class var KZOOANIMAL : string ;
    property NextGenealogyUID : string read FNextGenealogyUID ;
    Constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

  TShowFichaEmbriao = class ( TInterfacedPersistent, IShowFichaAnimal )
  public
     function Execute( AKZOOANIMAL : string ) : string ;
  end;


implementation

// insira a unit ''dtm'' do form na clausula uses
// conforme exemplo :
uses SysTypes, SearchsZootecnico, UZoo_BancoDadosEmbriaoDatamodule,
  UZoo_BancoDadosMachoEventosReprodutivosForm,
  UInclusaoEmbriaoWizard, UZoo_EditLinhagemFrame ;

{$R *.dfm}


procedure TZoo_BancoDadosEmbriaoForm.CheckQuickSearchIsValid ;
begin
   Image1.Picture := nil ;
   if edtQuickSearch.Text <> '' then
     if ( (rbShowBrinco.Checked) and
          (TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ).cdsLstEmbrioesCODIGO_EMBRIAO.AsString = edtQuickSearch.Text) ) or
        ( (rbShowNomeCompleto.Checked) and
          (TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ).cdsLstEmbrioesNOMECOMPLETO.AsString = edtQuickSearch.Text) )  then
       begin
          edtQuickSearch.Font.Color := clNavy ;
          Image1.Hint := 'Embrião encontrado'  ;
          ImageList1.GetBitmap( 0, Image1.Picture.Bitmap )
       end
     else
       begin
          edtQuickSearch.Font.Color := clRed ;
          Image1.Hint := 'Embrião não encontrado' ;
          ImageList1.GetBitmap( 1, Image1.Picture.Bitmap ) ;
       end;
end;


procedure TZoo_BancoDadosEmbriaoForm.CheckColsVisible;
begin
  JvDBUltimGrid4.Columns[0].Visible := rbShowBrinco.Checked ;
  JvDBUltimGrid4.Columns[1].Visible := rbShowNomeCompleto.Checked ;

  if rbShowBrinco.Checked then
     //edtQuickSearch.DataField := 'BRINCO'
     edtQuickSearch.DataField := 'CODIGO_EMBRIAO'
    // edtQuickSearch.DataField := ''
  else if rbShowNomeCompleto.Checked then
     edtQuickSearch.DataField := 'NOMECOMPLETO' ;

  CheckColsSize ;
  JvDBUltimGrid4.SelectedIndex := 0 ;
end;

procedure TZoo_BancoDadosEmbriaoForm.CheckColsSize;
begin
  JvDBUltimGrid4.Columns[0].Width := JvDBUltimGrid4.Width ;
  JvDBUltimGrid4.Columns[1].Width := JvDBUltimGrid4.Width ;
end;


constructor TZoo_BancoDadosEmbriaoForm.Create(AOwner: TComponent);
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
  pgcMain.ActivePage := tbsMainCadastro ;
  TZoo_BancoDadosEmbriaoDatamodule .Create ( self ) ;

  _pnldbgLista2.Visible := KZOOANIMAL = '' ;

   TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ).KZOOANIMAL := TZoo_BancoDadosEmbriaoForm.KZOOANIMAL ;
   TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ).GrauDeSangue.GetGrausSangue ( dbxGrauSangue.Items ) ;

   KZOOANIMAL := '' ;


  DatamoduleBase.OpenTables ;

  CheckColsVisible;

  TCLAg5NSMsgEVT_PartosAbortos.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CiosCoberturas.Subscribe( NeedRefresh ) ;

  CheckQuickSearchIsValid ;

end;

procedure TZoo_BancoDadosEmbriaoForm.edMaeButtonClick(Sender: TObject);
begin
  SearchMae ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_BancoDadosEmbriaoForm.edPaiButtonClick(Sender: TObject);
begin
  SearchPai ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_BancoDadosEmbriaoForm.edtQuickSearchChange(Sender: TObject);
begin
  CheckQuickSearchIsValid ;
end;

procedure TZoo_BancoDadosEmbriaoForm.IndentityClick(AIdentity: TIdentity ; ALink : boolean ) ;
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

procedure TZoo_BancoDadosEmbriaoForm.NeedRefresh(Sender: TCLAg5NSMsg );
begin
  with TZoo_BancoDadosEmbriaoDataModule ( DatamoduleBase ) do
    begin
      if ( cdsAnimal.State in [dsInsert,dsEdit] ) or (cdsAnimal.ChangeCount > 0 ) then
         exit ;

      ReOpenTables ;
    end;
end;

procedure TZoo_BancoDadosEmbriaoForm.Pesquisar;
begin
  inherited ;


  with TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ), TSearchEmbriao.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsLstEmbrioes.Locate( 'KZOO_ANIMAL',
                     Result.FieldByName( 'KZOO_ANIMAL_EMBRIAO' ).Value, [] ) ;
             ActiveFicha ;
          end ;
     finally
        free ;
     end ;
end;

procedure TZoo_BancoDadosEmbriaoForm.pgcMainChange(Sender: TObject);
begin
  if ( pgcMain.ActivePage =  tbsMainCadastro ) then
       TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ).ReopenTables
  else if ( pgcMain.ActivePage =  tbsPedigree ) then
     begin
       if (not Assigned ( FGenealogyPanel )) then
         CreateGenealogy
       else
         UpdateGenealogy
     end
  else if ( PgcMain.ActivePage = tbsMainReproducao ) and ( tbsMainReproducao.ControlCount = 0 ) then
    with TZoo_BancoDadosMachoEventosReprodutivosForm.Create ( self ) do
      begin
         Parent := tbsMainReproducao ;
         BorderStyle := bsNone ;
         Align := alClient ;
         MasterSource := dtsFicha ;
         Visible := True ;
      end
end;


procedure TZoo_BancoDadosEmbriaoForm.CreateGenealogy;
begin
  FGenealogyPanel := TZoo_AnimaisGenealogiaFrame.Create( tbsPedigree ) ;
  FGenealogyPanel.Parent := tbsPedigree ;
  FGenealogyPanel.Align := alClient ;
  FGenealogyPanel.Identity := TIdentity.make( FGenealogyPanel, 3 )  ;
  FGenealogyPanel.OnIdentityClick := IndentityClick ;
  FGenealogyPanel.disableDraw := False ;
  UpdateGenealogy ;
end;

procedure TZoo_BancoDadosEmbriaoForm.dbEdtComposicaoRacaButtonClick(
  Sender: TObject);
begin
  inherited;
  TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ).UpdateRacasGrauSangue ;
  if TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ).GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ).SetComposicaoRacas;
end;

procedure TZoo_BancoDadosEmbriaoForm.dbEdtComposicaoRacaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ).UpdateRacasGrauSangue ;
   if TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ).GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
         TZoo_BancoDadosEmbriaoDatamodule( DatamoduleBase ).SetComposicaoRacas ;
   end;
end;

procedure TZoo_BancoDadosEmbriaoForm.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

destructor TZoo_BancoDadosEmbriaoForm.Destroy;
begin
  TCLAg5NSMsgEVT_PartosAbortos.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CiosCoberturas.UnSubscribe( NeedRefresh ) ;
  inherited;
end;

procedure TZoo_BancoDadosEmbriaoForm.dtsListaDataChange(Sender: TObject;
  Field: TField);
begin
  if dtsLista.DataSet.State in [dsInsert, dsEdit] then
   begin
     rbShowBrinco.Enabled := False;
     rbShowNomeCompleto.Enabled := False;
     edtQuickSearch.Enabled := False;
     JvDBUltimGrid4.Enabled := False;
     pgcMain.Pages[1].Enabled := False;
     pgcMain.Pages[2].Enabled := False;
   end
  else
   begin
     rbShowBrinco.Enabled := True;
     rbShowNomeCompleto.Enabled := True;
     edtQuickSearch.Enabled := True;
     JvDBUltimGrid4.Enabled := True;
     pgcMain.Pages[1].Enabled := True;
     pgcMain.Pages[2].Enabled := True;
   end;
  UpdateGenealogy ;
end;

procedure TZoo_BancoDadosEmbriaoForm.UpdateGenealogy;
begin
  if not Assigned ( FGenealogyPanel ) then
     exit ;

  with TZoo_BancoDadosEmbriaoDatamodule( DatamoduleBase ) do
     TAnimalGenealogy.BuildIdentity (
          cdsDadosEmbriaoKZOO_ANIMAL_EMBRIAO.AsString,
          FGenealogyPanel.Identity ) ;

  FGenealogyPanel.Repaint ;
end;

procedure TZoo_BancoDadosEmbriaoForm._actDeleteUpdate(Sender: TObject);
begin
  if    ( pgcMain.ActivePage  = tbsMainCadastro ) then
     inherited
  else
    _actDelete.Enabled := False ;
end;

procedure TZoo_BancoDadosEmbriaoForm._actEditUpdate(Sender: TObject);
begin
  if    ( pgcMain.ActivePage  = tbsMainCadastro ) then
     inherited
  else
    _actEdit.Enabled := False ;
end;

procedure TZoo_BancoDadosEmbriaoForm._ActionListExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  if Action = _actNew then
    begin
     //TInclusaoEmbriaoWizard.Execute (  TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ) ) ;
     //Handled := True ;
     pgcMain.ActivePage := tbsMainCadastro;
     TZoo_BancoDadosEmbriaoDatamodule ( DatamoduleBase ).NewRecord;
     if DBEdit1.CanFocus then
       DBEdit1.SetFocus;
    end
end;

procedure TZoo_BancoDadosEmbriaoForm._actListaUpdate(Sender: TObject);
begin
  if fsModal in FormState then
     _actLista.Enabled := False
  else
   inherited;
end;

procedure TZoo_BancoDadosEmbriaoForm._actNewUpdate(Sender: TObject);
begin
  if    ( pgcMain.ActivePage  = tbsMainCadastro ) then
     inherited
  else
    _actNew.Enabled := False ;
end;

procedure TZoo_BancoDadosEmbriaoForm.rbShowColumnClick(Sender: TObject);
begin
  self.CheckColsVisible
end;

procedure TZoo_BancoDadosEmbriaoForm.SearchMae(TextToSearch: string);
begin
    with TZoo_BancoDadosEmbriaoDatamodule( DatamoduleBase ), TSearchMae.Create do
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

procedure TZoo_BancoDadosEmbriaoForm.SearchPai(TextToSearch: string);
begin

    with TZoo_BancoDadosEmbriaoDatamodule( DatamoduleBase ), TSearchPai.Create do
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

procedure TZoo_BancoDadosEmbriaoForm.TcMPFormShow(Sender: TObject);
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

{ TShowFichaEmbriao }

function TShowFichaEmbriao.Execute( AKZOOANIMAL : string ) : string ;
begin
    TZoo_BancoDadosEmbriaoForm.KZOOANIMAL := AKZOOANIMAL ;
    with TZoo_BancoDadosEmbriaoForm.Create ( nil ) do
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
  RegisterClass ( TZoo_BancoDadosEmbriaoForm ) ;
  TShowFichaAnimal.RegisterClass( TShowFichaEmbriao, ptafEmbriao ) ;

end.

