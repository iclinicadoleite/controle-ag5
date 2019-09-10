unit UZoo_AnimaisExternosMachoForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid , UZoo_AnimaisExternosMachoDatamodule,
  SysFormListaFicha, ReportTypes, VCL.DBCtrls, JvExExtCtrls, JvImage,
  JvDBControls, JvExtComponent, JvPanel, Tc.VCL.Edits,
  UZoo_AnimaisGenealogiaClass,
  Tc.VCL.Edits.DBControls, JvBaseEdits, JvExStdCtrls, JvEdit, JvDBSearchEdit,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, VCL.ImgList, ClAg5Types, JvComCtrls, JvExComCtrls,
  ClAg5ClientZootecnicoCommonTypes, System.Actions, System.ImageList,
  Tc.VCL.Extended.Mask, uImageListProvider, Tc.VCL.Application, Wrappers ;

type
  TZoo_AnimaisExternosMachoForm = class(T_FormListaFicha)
    pgcMain: TJvPageControl;
    tbsMainCadastro: TTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label36: TLabel;
    DBEdit4: TDBEdit;
    JvDBDateEdit2: TTcDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    tbsPedigree: TTabSheet;
    DBLookupComboBox1: TDBLookupComboBox;
    dtsDadosMacho: TDataSource;
    _pnldbgLista2: TPanel;
    JvDBUltimGrid4: TJvDBUltimGrid;
    Panel9: TPanel;
    rbShowBrinco: TRadioButton;
    rbShowNomeEstabulo: TRadioButton;
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
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit16: TDBEdit;
    Label29: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label20: TLabel;
    dbxGrauSangue: TDBComboBox;
    dbEdtComposicaoRaca: TJvDBComboEdit;
    dbchkOriginadoEmbriao: TDBCheckBox;
    _PnlForm: TPanel;
    procedure pgcMainChange(Sender: TObject);
    procedure rbShowColumnClick(Sender: TObject);
    procedure edPaiButtonClick(Sender: TObject);
    procedure edMaeButtonClick(Sender: TObject);
    procedure dtsListaDataChange(Sender: TObject; Field: TField);
    procedure _ActionListExecute(Action: TBasicAction; var Handled: Boolean);
    procedure dbEdtComposicaoRacaButtonClick(Sender: TObject);
    procedure dbEdtComposicaoRacaKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TcMPFormShow(Sender: TObject);
    procedure _actListaUpdate(Sender: TObject);
    procedure dbxGrauSangueKeyPress(Sender: TObject; var Key: Char);
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
  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
    procedure CreateGenealogy ;
    procedure UpdateGenealogy;
  public
    { Public declarations }
    class var KZOOANIMAL : string ;
    property NextGenealogyUID : string read FNextGenealogyUID ;
    Constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

  TShowFichaMachoExterno = class ( TInterfacedPersistent, IShowFichaAnimal )
  public
     function Execute( AKZOOANIMAL : string ) : string ;
  end;

implementation

// insira a unit ''dtm'' do form na clausula uses
// conforme exemplo :
uses SysTypes, SearchsZootecnico,
  UInclusaoMachoExtWizard, UZoo_EditLinhagemFrame ;

{$R *.dfm}

procedure TZoo_AnimaisExternosMachoForm.CheckColsSize;
begin
  JvDBUltimGrid4.Columns[0].Width := JvDBUltimGrid4.Width ;
  JvDBUltimGrid4.Columns[1].Width := JvDBUltimGrid4.Width ;
  JvDBUltimGrid4.Columns[2].Width := JvDBUltimGrid4.Width ;
end;

procedure TZoo_AnimaisExternosMachoForm.CheckColsVisible;
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

constructor TZoo_AnimaisExternosMachoForm.Create(AOwner: TComponent);
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

  TZoo_AnimaisExternosMachoDatamodule.Create ( self ) ;

   _pnldbgLista2.Visible := KZOOANIMAL = '' ;

   TZoo_AnimaisExternosMachoDatamodule ( DatamoduleBase ).KZOOANIMAL := TZoo_AnimaisExternosMachoForm.KZOOANIMAL ;
   TZoo_AnimaisExternosMachoDatamodule ( DatamoduleBase ).GrauDeSangue.GetGrausSangue ( dbxGrauSangue.Items ) ;

    KZOOANIMAL := '' ;

  DatamoduleBase.OpenTables ;

  dtsFicha.DataSet := TZoo_AnimaisExternosMachoDatamodule( DatamoduleBase ).cdsAnimal ;
//  D Zoo_AnimaisExternosMachoDatamodule.cdsDadosMacho

  CheckColsVisible;

end;

procedure TZoo_AnimaisExternosMachoForm.CreateGenealogy;
begin
  FGenealogyPanel := TZoo_AnimaisGenealogiaFrame.Create( tbsPedigree ) ;
  FGenealogyPanel.Parent := tbsPedigree ;
  FGenealogyPanel.Align := alClient ;
  FGenealogyPanel.Identity := TIdentity.make( FGenealogyPanel, 3 )  ;
  FGenealogyPanel.OnIdentityClick := IndentityClick ;
  FGenealogyPanel.disableDraw := False ;
  UpdateGenealogy ;
end;

procedure TZoo_AnimaisExternosMachoForm.dbEdtComposicaoRacaButtonClick(
  Sender: TObject);
begin
  TZoo_AnimaisExternosMachoDatamodule( DatamoduleBase ).UpdateRacasGrauSangue ;
  if TZoo_AnimaisExternosMachoDatamodule( DatamoduleBase ).GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     TZoo_AnimaisExternosMachoDatamodule( DatamoduleBase ).SetComposicaoRacas;
end;

procedure TZoo_AnimaisExternosMachoForm.dbEdtComposicaoRacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    TZoo_AnimaisExternosMachoDatamodule ( DatamoduleBase ).UpdateRacasGrauSangue ;
    if TZoo_AnimaisExternosMachoDatamodule ( DatamoduleBase ).GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
         TZoo_AnimaisExternosMachoDatamodule( DatamoduleBase ).SetComposicaoRacas;
   end;
end;

procedure TZoo_AnimaisExternosMachoForm.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

destructor TZoo_AnimaisExternosMachoForm.Destroy;
begin
  inherited;
end;

procedure TZoo_AnimaisExternosMachoForm.dtsListaDataChange(Sender: TObject;
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
   end
  else
   begin
     rbShowBrinco.Enabled := True;
     rbShowNomeEstabulo.Enabled := True;
     rbShowNomeCompleto.Enabled := True;
     edtQuickSearch.Enabled := True;
     JvDBUltimGrid4.Enabled := True;
     pgcMain.Pages[1].Enabled := True;
   end ;
  UpdateGenealogy ;
end;

procedure TZoo_AnimaisExternosMachoForm.edPaiButtonClick(Sender: TObject);
begin
  SearchPai ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_AnimaisExternosMachoForm.IndentityClick(AIdentity: TIdentity ; ALink : boolean ) ;
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

procedure TZoo_AnimaisExternosMachoForm.JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
      Key := 0 ;
end;

procedure TZoo_AnimaisExternosMachoForm.edMaeButtonClick(Sender: TObject);
begin
  SearchMae ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_AnimaisExternosMachoForm.pgcMainChange(Sender: TObject);
begin
  if ( pgcMain.ActivePage =  tbsMainCadastro ) then
       TZoo_AnimaisExternosMachoDatamodule ( DatamoduleBase ).ReopenTables
  else if ( pgcMain.ActivePage =  tbsPedigree ) then
     begin
       if (not Assigned ( FGenealogyPanel )) then
         CreateGenealogy
       else
         UpdateGenealogy
     end
end;

procedure TZoo_AnimaisExternosMachoForm.rbShowColumnClick(Sender: TObject);
begin
  self.CheckColsVisible
end;


procedure TZoo_AnimaisExternosMachoForm.SearchPai(TextToSearch: string);
begin

    with TZoo_AnimaisExternosMachoDatamodule( DatamoduleBase ), TSearchPai.Create do
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

procedure TZoo_AnimaisExternosMachoForm.TcMPFormShow(Sender: TObject);
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

procedure TZoo_AnimaisExternosMachoForm.UpdateGenealogy;
begin

  if not Assigned ( FGenealogyPanel ) then
     exit ;

  with TZoo_AnimaisExternosMachoDatamodule( DatamoduleBase ) do
     TAnimalGenealogy.BuildIdentity (
          cdsDadosMachoKZOO_ANIMAL_EXTERNO.AsString,
          FGenealogyPanel.Identity ) ;

  FGenealogyPanel.Repaint ;

end;

procedure TZoo_AnimaisExternosMachoForm._ActionListExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
//  if Action = _actNew then
//    begin
//     TInclusaoMachoExtWizard.Execute (  TZoo_AnimaisExternosMachoDatamodule ( DatamoduleBase ) ) ;
//     Handled := True ;
//    end
    Handled := False ;
end;

procedure TZoo_AnimaisExternosMachoForm._actListaUpdate(Sender: TObject);
begin
  if fsModal in FormState then
     _actLista.Enabled := False
  else
   inherited;
end;

procedure TZoo_AnimaisExternosMachoForm.SearchMae(TextToSearch: string);
begin
    with TZoo_AnimaisExternosMachoDatamodule( DatamoduleBase ), TSearchMae.Create do
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

procedure TZoo_AnimaisExternosMachoForm.Pesquisar;
begin
  inherited ;

  with TZoo_AnimaisExternosMachoDatamodule( DatamoduleBase ), TSearchMacho.Create do
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

function TShowFichaMachoExterno.Execute( AKZOOANIMAL : string ) : string ;
begin
    TZoo_AnimaisExternosMachoForm.KZOOANIMAL := AKZOOANIMAL ;
    with TZoo_AnimaisExternosMachoForm.Create ( nil ) do
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
  RegisterClass ( TZoo_AnimaisExternosMachoForm ) ;
  TShowFichaAnimal.RegisterClass ( TShowFichaMachoExterno, ptafMachoExterno ) ;
end.
