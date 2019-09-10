unit UZoo_AnimaisExternosFemeaForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExExtCtrls, JvNetscapeSplitter, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  SysFormListaFicha, ReportTypes, VCL.DBCtrls, JvImage, JvDBControls,
  JvExtComponent, JvPanel, JvExComCtrls, JvComCtrls, DBCGrids,
  UZoo_AnimaisGenealogiaClass, TabControlDeskTop, JvDBLookup, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, JvBaseEdits, JvExStdCtrls, JvEdit, JvDBSearchEdit,
  VCL.ImgList, JvDBCheckBox, JvCombobox, JvDBCombobox,
  ClAg5ClientZootecnicoCommonTypes, System.Actions, System.ImageList,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, uImageListProvider, Tc.VCL.Application, Wrappers ;

type

//  TJvPageControl = class ( JvComCtrls.TJvPageControl )
//    procedure CMDialogChar(var Message: TCMDialogChar);  message CM_DIALOGCHAR;
//  end ;


  TZoo_AnimaisExternosFemeaForm = class(T_FormListaFicha)
    Label24: TLabel;
    DBEdit4: TDBEdit;
    Label25: TLabel;
    JvDBDateEdit2: TTcDBDateEdit;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    Label23: TLabel;
    DBEdit3: TDBEdit;
    _pnldbgLista2: TPanel;
    JvDBUltimGrid4: TJvDBUltimGrid;
    JvTabDefaultPainter1: TJvTabDefaultPainter;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Label22: TLabel;
    DBEdit2: TDBEdit;
    pgcMain: TJvPageControl;
    tbsGenealogiaPedigree: TTabSheet;
    tbsGenealogiaCadastro: TTabSheet;
    tbsGenealogiaFilhos: TTabSheet;
    Panel5: TPanel;
    dtsLinhagem: TDataSource;
    dtsDadosFemea: TDataSource;
    dtsDescartes: TDataSource;
    Panel9: TPanel;
    rbShowBrinco: TRadioButton;
    rbShowNomeEstabulo: TRadioButton;
    rbShowNomeCompleto: TRadioButton;
    edtQuickSearch: TJvDBSearchEdit;
    GroupBox3: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    edPai: TJvDBComboEdit;
    edMae: TJvDBComboEdit;
    dbEdtComposicaoRaca: TJvDBComboEdit;
    dbxGrauSangue: TDBComboBox;
    Label29: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    Label5: TLabel;
    DBEdit9: TDBEdit;
    dbchkOriginadoEmbriao: TDBCheckBox;
    DataSource1: TDataSource;
    _PnlForm: TPanel;
    procedure edPaiButtonClick(Sender: TObject);
    procedure edMaeButtonClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure pgcGenealogiaChange(Sender: TObject);
    procedure JvDBUltimGrid4Resize(Sender: TObject);
    procedure dtsListaDataChange(Sender: TObject; Field: TField);
    procedure rbShowColumnClick(Sender: TObject);
    procedure _ActionListExecute(Action: TBasicAction; var Handled: Boolean);
    procedure dbxGrauSangueKeyPress(Sender: TObject; var Key: Char);
    procedure dbEdtComposicaoRacaButtonClick(Sender: TObject);
    procedure dbEdtComposicaoRacaKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgcMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure TcMPFormShow(Sender: TObject);
    procedure _actListaUpdate(Sender: TObject);
  private
    { Private declarations }
//    FGenealogyPanel : TGenealogyPanel ;
    FGenealogyPanel : TZoo_AnimaisGenealogiaFrame ;
    FNextGenealogyUID: string;
    procedure SearchPai ( TextToSearch : string);
    procedure SearchMae ( TextToSearch : string);
    procedure IndentityClick( AIdentity : TIdentity ; ALink : boolean ) ;
  protected
    { Protected declarations }
    procedure  Pesquisar ; override ;
    procedure  CreateGenealogy;
    procedure  UpdateGenealogy ;
    procedure CheckColsVisible ;
    procedure CheckColsSize ;
    procedure CheckDataFormIntf ;
    procedure PrintData ; override ;
    procedure Save ; override ;
  public
    { Public declarations }
    class var KZOOANIMAL : string ;
    property NextGenealogyUID : string read FNextGenealogyUID ;
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
  end;


  TShowFichaFemeaExterna = class ( TInterfacedPersistent, IShowFichaAnimal )
  public
     function Execute( AKZOOANIMAL : string ) : string ;
  end;

implementation

// insira a unit ''dtm'' do form na clausula uses
// conforme exemplo :
uses SysTypes, SearchsZootecnico, UZoo_AnimaisExternosFemeaDatamodule, UfdlgZoo_HistoricoBrincos,
  UDBZootecnico,
  //UfrmZoo_FilhosAnimal,
  DBClient , UInclusaoFemeaExtWizard, Tc.VCL.FormIntf, UZoo_EditLinhagemFrame ;


{$R *.dfm}

procedure TZoo_AnimaisExternosFemeaForm.edPaiButtonClick(Sender: TObject);
begin
  inherited;
  SearchPai ( TJvDBComboEdit ( Sender ).Text ) ;
end;


procedure TZoo_AnimaisExternosFemeaForm.CheckColsSize;
begin
  JvDBUltimGrid4.Columns[0].Width := JvDBUltimGrid4.Width ;
  JvDBUltimGrid4.Columns[1].Width := JvDBUltimGrid4.Width ;
  JvDBUltimGrid4.Columns[2].Width := JvDBUltimGrid4.Width ;
end;

procedure TZoo_AnimaisExternosFemeaForm.CheckColsVisible;
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

procedure TZoo_AnimaisExternosFemeaForm.CheckDataFormIntf;
var
  DataFormIntf : ITcDataForm ;
begin

  if pgcMain.ActivePage = tbsGenealogiaCadastro then
     self.DataFormIntf := self
  else
     self.DataFormIntf :=  nil ;

end;

constructor TZoo_AnimaisExternosFemeaForm.Create(AOwner: TComponent);
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

  pgcMain.ActivePage := tbsGenealogiaCadastro ;
  ActiveFicha ;

  TZoo_AnimaisExternosFemeaDatamodule.Create ( self ) ;

  FGenealogyPanel := nil ;

   _pnldbgLista2.Visible := KZOOANIMAL = '' ;

   TZoo_AnimaisExternosFemeaDatamodule ( DatamoduleBase ).KZOOANIMAL := TZoo_AnimaisExternosFemeaForm.KZOOANIMAL ;
   TZoo_AnimaisExternosFemeaDatamodule ( DatamoduleBase ).GrauDeSangue.GetGrausSangue ( dbxGrauSangue.Items ) ;

  KZOOANIMAL := '' ;

  DatamoduleBase.OpenTables ;

  CheckColsVisible;

  CheckDataFormIntf ;
//  showMessage ( format (  '%x', [   ColorToRGB( self.JvTabDefaultPainter1.ActiveColorTo ) ] ) ) ;

end;


procedure TZoo_AnimaisExternosFemeaForm.CreateGenealogy;
begin
  FGenealogyPanel := TZoo_AnimaisGenealogiaFrame.Create( tbsGenealogiaPedigree ) ;
  FGenealogyPanel.Parent := tbsGenealogiaPedigree ;
  FGenealogyPanel.Align := alClient ;
  FGenealogyPanel.Identity := TIdentity.make( FGenealogyPanel, 3 )  ;
  FGenealogyPanel.OnIdentityClick := IndentityClick ;
  FGenealogyPanel.disableDraw := False ;
  UpdateGenealogy ;

end;

procedure TZoo_AnimaisExternosFemeaForm.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

destructor TZoo_AnimaisExternosFemeaForm.Destroy;
begin
  self.DataFormIntf := nil ;
  inherited;
end;

procedure TZoo_AnimaisExternosFemeaForm.dtsListaDataChange(Sender: TObject;
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

procedure TZoo_AnimaisExternosFemeaForm.edMaeButtonClick(Sender: TObject);
begin
  inherited;
  SearchMae ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_AnimaisExternosFemeaForm.dbEdtComposicaoRacaButtonClick(Sender: TObject);
begin
  TZoo_AnimaisExternosFemeaDatamodule ( DatamoduleBase ).UpdateRacasGrauSangue ;
  if TZoo_AnimaisExternosFemeaDatamodule ( DatamoduleBase ).GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     TZoo_AnimaisExternosFemeaDatamodule ( DatamoduleBase ).SetComposicaoRacas ;
end;

procedure TZoo_AnimaisExternosFemeaForm.dbEdtComposicaoRacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    TZoo_AnimaisExternosFemeaDatamodule ( DatamoduleBase ).UpdateRacasGrauSangue ;
    if TZoo_AnimaisExternosFemeaDatamodule ( DatamoduleBase ).GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
       TZoo_AnimaisExternosFemeaDatamodule ( DatamoduleBase ).SetComposicaoRacas ;
   end;
end;

procedure TZoo_AnimaisExternosFemeaForm.JvDBComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TJvDBComboBox ( Sender ).DroppedDown ) then
    begin
     Key := 0 ;
     TJvDBComboBox ( Sender ).DroppedDown := True ;
    end ;
end;

procedure TZoo_AnimaisExternosFemeaForm.JvDBUltimGrid4Resize(Sender: TObject);
begin
  CheckColsSize ;
end;


procedure TZoo_AnimaisExternosFemeaForm.Pesquisar;
begin

  with TZoo_AnimaisExternosFemeaDatamodule( DatamoduleBase ), TSearchFemea.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsLstFemeas.Locate( 'KZOO_ANIMAL',
                     Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).Value, [] ) ;
             ActiveFicha ;
          end ;
     finally
        free ;
     end ;

end;


procedure TZoo_AnimaisExternosFemeaForm.pgcMainChange(Sender: TObject);
begin
  inherited;
  if ( PgcMain.ActivePage =  tbsGenealogiaPedigree ) and (not Assigned ( FGenealogyPanel )) then
     begin
       CreateGenealogy ;
     end  ;

 CheckDataFormIntf ;

end;


procedure TZoo_AnimaisExternosFemeaForm.pgcMainChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if ( PgcMain.ActivePage =  tbsGenealogiaPedigree ) and (Assigned ( FGenealogyPanel )) then
   begin
       self.DataFormIntf := nil ;
       FreeAndNil ( FGenealogyPanel  )
   end
end;

procedure TZoo_AnimaisExternosFemeaForm.PrintData;
begin
  if Assigned ( DataFormIntf ) then
     self.DataFormIntf.PrintData
end;

procedure TZoo_AnimaisExternosFemeaForm.rbShowColumnClick(Sender: TObject);
begin
  inherited;
  self.CheckColsVisible
end;

procedure TZoo_AnimaisExternosFemeaForm.pgcGenealogiaChange(Sender: TObject);
begin
  inherited;
  if ( pgcMain.ActivePage =  tbsGenealogiaCadastro ) then
       TZoo_AnimaisExternosFemeaDatamodule ( DatamoduleBase ).ReopenTables
  else if ( pgcMain.ActivePage =  tbsGenealogiaPedigree ) then
     begin
       if (not Assigned ( FGenealogyPanel )) then
         CreateGenealogy
       else
         UpdateGenealogy
     end
(*  else if ( pgcMain.ActivePage =  tbsGenealogiaFilhos ) and ( tbsGenealogiaFilhos.ControlCount = 0 ) then
    with TfrmZoo_FilhosAnimal.Create ( self  ) do
      begin
         Parent := tbsGenealogiaFilhos ;
         BorderStyle := bsNone ;
         Align := alClient ;
         MasterSource := dtsFicha ;
         Visible := True ;
      end
  *)
  ; CheckDataFormIntf;

end;


procedure TZoo_AnimaisExternosFemeaForm.IndentityClick(AIdentity: TIdentity ; ALink : boolean ) ;
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

procedure TZoo_AnimaisExternosFemeaForm.SearchPai(TextToSearch: string);
begin

    with TZoo_AnimaisExternosFemeaDatamodule( DatamoduleBase ), TSearchPai.Create do
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

procedure TZoo_AnimaisExternosFemeaForm.TcMPFormShow(Sender: TObject);
begin
  inherited;
  if fsModal in  FormState then
    begin
     _pnlForm.Color := clsilver ;
     self._pageControl.parent := _pnlForm ;
     self._pnlToolButtons.parent := _pnlForm ;
    end;
end;

procedure TZoo_AnimaisExternosFemeaForm.UpdateGenealogy;
begin
  if not Assigned ( FGenealogyPanel ) then
     exit ;

  with TZoo_AnimaisExternosFemeaDatamodule( DatamoduleBase ) do
     TAnimalGenealogy.BuildIdentity (
          cdsDadosFemeaKZOO_ANIMAL_EXTERNO.AsString,
          FGenealogyPanel.Identity ) ;

  FGenealogyPanel.Repaint ;
end;

procedure TZoo_AnimaisExternosFemeaForm._ActionListExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
//  if ( Action = _actNew )
//   and ( pgcMain.ActivePage = tbsGenealogiaCadastro ) then
//    begin
//     TInclusaoFemeaExtWizard.Execute (  TZoo_AnimaisExternosFemeaDatamodule ( DatamoduleBase ) ) ;
//     Handled := True ;
//    end
   Handled := False
end;

procedure TZoo_AnimaisExternosFemeaForm._actListaUpdate(Sender: TObject);
begin
  if fsModal in FormState then
     _actLista.Enabled := False
  else
   inherited;
end;

procedure TZoo_AnimaisExternosFemeaForm.Save;
begin
  inherited;
  TCLAg5NSMsgEVT_AnimaisExternosFemea.CreateAndDispatch( self );
end;

procedure TZoo_AnimaisExternosFemeaForm.SearchMae(TextToSearch: string);
begin

    with TZoo_AnimaisExternosFemeaDatamodule( DatamoduleBase ), TSearchMae.Create do
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

{ TShowFichaFemea }

function TShowFichaFemeaExterna.Execute( AKZOOANIMAL : string ) : string ;
begin
    TZoo_AnimaisExternosFemeaForm.KZOOANIMAL := AKZOOANIMAL ;
    with TZoo_AnimaisExternosFemeaForm.Create ( nil ) do
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
  RegisterClass ( TZoo_AnimaisExternosFemeaForm ) ;
  TShowFichaAnimal.RegisterClass ( TShowFichaFemeaExterna, ptafFemeaExterno ) ;
end.
