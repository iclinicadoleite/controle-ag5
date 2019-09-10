unit UZoo_SanidadeDiagnosticosWizard5;

interface

uses
    WinApi.Windows
  , WinApi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , VCL.Graphics
  , VCL.Controls
  , VCL.Forms
  , VCL.ActnList
  , VCL.StdCtrls
  , VCL.Buttons
  , VCL.ComCtrls
  , JvExComCtrls
  , JvComCtrls
  , VCL.ExtCtrls
  , SysFormWizard
  , JvExExtCtrls
  , JvExtComponent
  , JvPanel
  , JvImage
//, Tc.MP.VCL.Controls.GDIButton
  , System.Actions
  , Tc.VCL.Controls.GDIButton
  , Tc.VCL.Application
  , Vcl.Mask
  , Tc.VCL.Extended.Mask
  , Tc.VCL.Edits
  , UZoo_SanidadeDiagnosticosDatamodule5
  , Vcl.DBCtrls
  , CL.Ag5.NSMsgs
  , Data.DB, Tc.Data.DB.Helpers
  , JvExMask
  , JvToolEdit
  , Tc.VCL.Edits.DBControls
  , Vcl.Grids
  , Vcl.DBGrids
  , JvExDBGrids
  , JvDBGrid
  , DBCLient
  , JvDBUltimGrid
  , Tc.VCL.ControlPopuper
  , JvDBControls
  , Wrappers, System.ImageList, Vcl.ImgList, Vcl.CheckLst ;

  (*
   with FiltrosPanel.clientToScreen ( Point ( dblcPersonalizado.Left, dblcPersonalizado.Top ) ) do
         PopuperSaveAs.ShowModal ( Point ( X, Y ) ) ;

   with AIdentity.Parent.clientToScreen ( Point ( AIdentity.Left, AIdentity.Top ) ) do

*)
type
  TZoo_SanidadeDiagnosticosWizard = class(T_FormWizard)
    TabSheet1: TTabSheet;
    chkQuickInput: TCheckBox;
    pnlQuickInput: TPanel;
    pnlIput: TPanel;
    gbQuickFields: TGroupBox;
    gbFields: TGroupBox;
    lblEdPadraoData: TLabel;
    dblcDiagnosticoPadrao: TDBLookupComboBox;
    lblDiagnosticoPadrao: TLabel;
    dblcProtocoloPadrao: TDBLookupComboBox;
    lblProtocolosPadrao: TLabel;
    edBrinco: TJvComboEdit;
    Label7: TLabel;
    dtsDiagnosticosAplicar: TDataSource;
    deData: TTcDBDateEdit;
    Label12: TLabel;
    dblcDiagnostico: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    dblcProtocolo: TDBLookupComboBox;
    dbgDiagnosticosAplicar: TJvDBUltimGrid;
    BitBtn2: TTcGDIButton;
    lblQuartoPadrao: TLabel;
    lblQuarto: TLabel;
    dblcQuarto: TDBLookupComboBox;
    dtsPadroes: TDataSource;
    dblcProtocoloGrid: TDBLookupComboBox;
    deDataGrid: TTcDBDateEdit;
    dblcDiagnosticoGrid: TDBLookupComboBox;
    PanelTarefasPadrao: TPanel;
    dbgTarefasPadrao: TJvDBUltimGrid;
    Label3: TLabel;
    edTarefasPadrao: TJvDBComboEdit;
    ControlPopuperTarefasPadrao: TTcControlPopuper;
    edTarefas: TJvDBComboEdit;
    Label4: TLabel;
    ControlPopuperTarefas: TTcControlPopuper;
    dtsTarefas: TDataSource;
    Label22: TLabel;
    edFuncionarioPadrao: TJvDBComboEdit;
    Label5: TLabel;
    edFuncionario: TJvDBComboEdit;
    PanelTarefas: TPanel;
    dbgTarefas: TJvDBUltimGrid;
    edTarefasGrid: TJvDBComboEdit;
    TcGDIButton1: TTcGDIButton;
    actSelectByPersonalizado: TAction;
    dtsTarefasPadrao: TDataSource;
    imgFuncionario: TImage;
    imgFuncionarioPadrao: TImage;
    ImageList1: TImageList;
    edDataPadrao: TTcDBDateEdit;
    CheckListBox1: TCheckListBox;
    edQuartoPadrao: TJvDBComboEdit;
    ControlPopuperQuartosPadrao: TTcControlPopuper;
    btnAddDiagnostico: TTcGDIButton;
    btnAddProtocolo: TTcGDIButton;
    btnAddTarefa: TTcGDIButton;
    btnAddDiagnosticoPadrao: TTcGDIButton;
    btnAddProtocoloPadrao: TTcGDIButton;
    BtnAddTarefaPadrao: TTcGDIButton;
    imgValidateResponsavel: TImage;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure chkQuickInputClick(Sender: TObject);
    procedure dblcDiagnosticoPadraoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcProtocoloPadraoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcDiagnosticoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcProtocoloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcQuartoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edBrincoButtonClick(Sender: TObject);
    procedure edBrincoEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dtsDiagnosticosAplicarDataChange(Sender: TObject; Field: TField);
    procedure _actExecuteExecute(Sender: TObject);
    procedure dblcProtocoloCloseUp(Sender: TObject);
    procedure deDataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure dtsPadroesDataChange(Sender: TObject; Field: TField);
    procedure dblcProtocoloGridDropDown(Sender: TObject);
    procedure dblcDiagnosticoGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcProtocoloGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function dbgTarefasPadraoCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgTarefasPadraoGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgDiagnosticosAplicarEditButtonClick(Sender: TObject);
    procedure edFuncionarioButtonClick(Sender: TObject);
    procedure edFuncionarioPadraoButtonClick(Sender: TObject);
    procedure edFuncionarioPadraoChange(Sender: TObject);
    procedure edFuncionarioChange(Sender: TObject);
    procedure edTarefasPadraoButtonClick(Sender: TObject);
    procedure edTarefasButtonClick(Sender: TObject);
    procedure edTarefasGridButtonClick(Sender: TObject);
    function dbgTarefasCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgTarefasKeyPress(Sender: TObject; var Key: Char);
    procedure dbgTarefasPadraoKeyPress(Sender: TObject; var Key: Char);
    procedure edTarefasPadraoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTarefasGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFuncionarioPadraoKeyPress(Sender: TObject; var Key: Char);
    procedure actSelectByPersonalizadoExecute(Sender: TObject);
    procedure actSelectByPersonalizadoUpdate(Sender: TObject);
    procedure dbgTarefasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgDiagnosticosAplicarGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgDiagnosticosAplicarShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure edBrincoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure edTarefasChange(Sender: TObject);
    procedure ControlPopuperTarefasPadraoClose(Sender: TObject);
    procedure ControlPopuperTarefasClose(Sender: TObject);
    procedure edTarefasPadraoChange(Sender: TObject);
    procedure edTarefasPadraoClick(Sender: TObject);
    procedure edTarefasClick(Sender: TObject);
    procedure edTarefasGridClick(Sender: TObject);
    procedure edBrincoChange(Sender: TObject);
    procedure edDataPadraoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTarefasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edQuartoPadraoButtonClick(Sender: TObject);
    procedure edQuartoPadraoChange(Sender: TObject);
    procedure edQuartoPadraoClick(Sender: TObject);
    procedure edQuartoPadraoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ControlPopuperQuartosPadraoClose(Sender: TObject);
    procedure ControlPopuperQuartosPadraoKeyPress(Sender: TObject;
      var Key: Char);
    procedure btnAddProtocoloClick(Sender: TObject);
    procedure btnAddDiagnosticoClick(Sender: TObject);
    procedure btnAddTarefaClick(Sender: TObject);
    procedure btnAddDiagnosticoPadraoClick(Sender: TObject);
    procedure btnAddProtocoloPadraoClick(Sender: TObject);
    procedure BtnAddTarefaPadraoClick(Sender: TObject);
    procedure dbgTarefasShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgTarefasPadraoShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgTarefasPadraoCellClick(Column: TColumn);
    procedure dbgTarefasCellClick(Column: TColumn);
    procedure dbgDiagnosticosAplicarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Zoo_SanidadeDiagnosticosDatamodule : TZoo_SanidadeDiagnosticosDatamodule;
    FBrinco : String;
    FForceAddNew : boolean ;
    FInoreKeyUp : boolean ;
    FAdding : boolean ;
    FImageValidate : TImage;

    procedure updateEdtBrinco ;

    procedure ShowQuickFields;
    function SearchAnimalFemea ( TextToSearch : string) : boolean ;
    procedure AddByKey ( AKey : String ) ;

    procedure UpdateListQuartoPadrao ;
    procedure UpdateListProtocolosPadrao;

    procedure AddBrinco ;
    procedure SetBrinco(const Value: String);
    procedure  SearchFuncionarioPadrao( const TextToSearch: string);
    procedure  SearchFuncionario(const TextToSearch: string);
    procedure AddFromPersonalizado ;

    procedure ValidateFields( AFieldName: String);
    procedure MessageValidate;
    procedure EnableEdits;
  public
    { Public declarations }
   // class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
    class function Execute ( ABrinco : string ) : boolean ; reintroduce ;
    property Brinco : String read FBrinco write SetBrinco;
  end;


implementation

uses
      SearchsZootecnico
    , CL.Ag5.SelectDataFromPersonalizado
    , UZoo_CfgProtocolosForm2
    , UZoo_CfgDiagnosticosForm
    , UZoo_CfgTarefasForm2
    , CLAg5Types
    , Exceptions
    , ThreadSuppl ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_SanidadeDiagnosticosWizard.actSelectByPersonalizadoExecute(
  Sender: TObject);
begin
   AddFromPersonalizado ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.actSelectByPersonalizadoUpdate(
  Sender: TObject);
begin
// need ?
//  actSelectByPersonalizado.Enabled := PersonalizadoAssigned
///                               and not VarIsNull ( dblcProtocoloColetivo.KeyValue )
end;

procedure TZoo_SanidadeDiagnosticosWizard.AddBrinco;
var
  LBrinco : string ;
begin

  LBrinco := FBrinco ;
  FAdding := True ;

  try
    if ( LBrinco <> '' ) and
       Zoo_SanidadeDiagnosticosDatamodule.AddBrinco( LBrinco, FForceAddNew  ) then
      begin
        edBrinco.Font.color := clNavy ;
        exit ;
      end ;

    FInoreKeyUp := True ;

    if not SearchAnimalFemea ( LBrinco ) then
       raise Warning.Create('Animal não encontrado');
  finally
     FAdding := False ;
     updateEdtBrinco ;
  end ;

end;

procedure TZoo_SanidadeDiagnosticosWizard.AddByKey(AKey: String);
begin

  Zoo_SanidadeDiagnosticosDatamodule.AddByKey(
                        AKey
                      , FBrinco
                      , FForceAddNew
  );

  FForceAddNew := False ;
  updateEdtBrinco;

end;

procedure TZoo_SanidadeDiagnosticosWizard.AddFromPersonalizado;
var
   LKeyCodeList : TKeyCodeList ;
   LKeyCode : TKeyCode ;
begin
  dtsDiagnosticosAplicar.DataSet.DisableControls ;
  //dtsProtocolosAplicados.DataSet.DisableControls ;

  { TODO -oCaique -cMelhoria : Incluir seleção do personalizado }
  LKeyCodeList := SelectFromPersonalizado ;

  if not Assigned ( LKeyCodeList )  then
     exit ;

  FForceAddNew := False ;
  for LKeyCode in LKeyCodeList do
    begin
     FBrinco := LKeyCode.Code ;
     AddByKey( LKeyCode.Key );
    end;

  LKeyCodeList.free ;

//  dtsProtocolosAplicados.DataSet.EnableControls ;
  dtsDiagnosticosAplicar.DataSet.EnableControls ;

end;

procedure TZoo_SanidadeDiagnosticosWizard.BitBtn2Click(Sender: TObject);
begin
  Zoo_SanidadeDiagnosticosDatamodule.RemoveDiagnostico;
end;

procedure TZoo_SanidadeDiagnosticosWizard.btnAddDiagnosticoClick(
  Sender: TObject);
begin
  TZoo_CfgDiagnosticosForm.ExecuteNewFastRegister;
  Zoo_SanidadeDiagnosticosDatamodule.OpenDiagnosticos;
  Zoo_SanidadeDiagnosticosDatamodule.OpenProtocolos;
end;

procedure TZoo_SanidadeDiagnosticosWizard.btnAddDiagnosticoPadraoClick(
  Sender: TObject);
begin
  TZoo_CfgDiagnosticosForm.ExecuteNewFastRegister;
  Zoo_SanidadeDiagnosticosDatamodule.OpenDiagnosticos;
  Zoo_SanidadeDiagnosticosDatamodule.OpenProtocolos;
end;

procedure TZoo_SanidadeDiagnosticosWizard.btnAddProtocoloClick(Sender: TObject);
begin
  TZoo_CfgProtocolosForm2.ExecuteNewFastRegister;
  Zoo_SanidadeDiagnosticosDatamodule.OpenProtocolos;
end;

procedure TZoo_SanidadeDiagnosticosWizard.btnAddProtocoloPadraoClick(
  Sender: TObject);
begin
  TZoo_CfgProtocolosForm2.ExecuteNewFastRegister;
  Zoo_SanidadeDiagnosticosDatamodule.OpenProtocolos;
end;

procedure TZoo_SanidadeDiagnosticosWizard.btnAddTarefaClick(Sender: TObject);
begin
  TZoo_CfgTarefasForm.ExecuteNewFastRegister;
  Zoo_SanidadeDiagnosticosDatamodule.OpenTarefas;
end;

procedure TZoo_SanidadeDiagnosticosWizard.BtnAddTarefaPadraoClick(
  Sender: TObject);
begin

  TZoo_CfgTarefasForm.ExecuteNewFastRegister;
  Zoo_SanidadeDiagnosticosDatamodule.OpenTarefasPadrao;
end;

procedure TZoo_SanidadeDiagnosticosWizard.chkQuickInputClick(Sender: TObject);
begin
  ShowQuickFields;
end;
procedure TZoo_SanidadeDiagnosticosWizard.ControlPopuperTarefasPadraoClose(
  Sender: TObject);
begin
  Zoo_SanidadeDiagnosticosDatamodule.UpdateHintTarefasPadrao ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.ControlPopuperTarefasClose(
  Sender: TObject);
begin
  if not dtsDiagnosticosAplicar.AutoEdit then
    exit ;
  Zoo_SanidadeDiagnosticosDatamodule.UpdateHintTarefas ;
end;


constructor TZoo_SanidadeDiagnosticosWizard.Create(AOwner: TComponent);
var
  i : integer ;
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
  Zoo_SanidadeDiagnosticosDatamodule := TZoo_SanidadeDiagnosticosDatamodule.Create(Self);
  Zoo_SanidadeDiagnosticosDatamodule.ValidateMessage := ValidateFields;
  Zoo_SanidadeDiagnosticosDatamodule.OpenTables;
  dtsDiagnosticosAplicar.DataSet := Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicar;
  dtsPadroes.DataSet             := Zoo_SanidadeDiagnosticosDatamodule.cdsPadroes;
  dtsTarefasPadrao.DataSet       := Zoo_SanidadeDiagnosticosDatamodule.cdsTarefasPadrao;
  dtsTarefas.DataSet             := Zoo_SanidadeDiagnosticosDatamodule.cdsTarefas;

  Zoo_SanidadeDiagnosticosDatamodule.UseQuickInput := False;
  ShowQuickFields;

  //dblcQuartoPadrao.Visible := False;
  edQuartoPadrao.Visible := False;
  lblQuartoPadrao.Visible := False;

  dblcQuarto.Visible := False ;
  lblQuarto.Visible := False;

  updateEdtBrinco ;

  with dbgDiagnosticosAplicar do
    begin              // Volts eh foda manooo... :D
      for i := 0 to Columns.Count - 1 do
        begin
          if Columns[i].FieldName = 'NOMEFUNCIONARIO' then
            Columns[i].ButtonStyle := cbsEllipsis ;
        end;
    end;

end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcDiagnosticoGridKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcDiagnosticoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else
  if Key = VK_RETURN then
   begin
     Key:= 0;
     if dblcQuarto.CanFocus then
       dblcQuarto.SetFocus;
     if dblcProtocolo.CanFocus then
       dblcProtocolo.SetFocus;
   end
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcDiagnosticoPadraoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] )
     and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else if ( Key = 13 ) then
    begin
     Key := 0 ;
      if edQuartoPadrao.CanFocus then
        edQuartoPadrao.SetFocus
      else if dblcProtocoloPadrao.CanFocus then
        dblcProtocoloPadrao.SetFocus ;
    end ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcProtocoloCloseUp(Sender: TObject);
begin
  if edTarefas.CanFocus then
    edTarefas.SetFocus;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcProtocoloGridDropDown(
  Sender: TObject);
begin
  dblcProtocoloGrid.DropDownWidth := dblcProtocoloGrid.Width ;
  dblcProtocoloGrid.DropDownRows  := 21 ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcProtocoloGridKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcProtocoloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else  if Key = VK_RETURN then
   begin
     Key:= 0;
     if edTarefas.CanFocus then
       edTarefas.SetFocus;
   end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcProtocoloPadraoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else if Key = VK_RETURN then
   begin
     Key:= 0;
     if edTarefasPadrao.CanFocus then
       edTarefasPadrao.SetFocus;
   end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.deDataKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
   begin
     Key:= 0;
     if dblcDiagnostico.CanFocus then
       dblcDiagnostico.SetFocus;
   end
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcQuartoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else
  if Key = VK_RETURN then
   begin
     Key:= 0;
     if dblcProtocolo.CanFocus then
       dblcProtocolo.SetFocus;
   end
end;

destructor TZoo_SanidadeDiagnosticosWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dtsDiagnosticosAplicarDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if not Assigned(Zoo_SanidadeDiagnosticosDatamodule) then
    exit;

  with Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicar do
     dtsDiagnosticosAplicar.AutoEdit := not ( bof and eof ) ;

  edFuncionario.ReadOnly := not dtsDiagnosticosAplicar.AutoEdit ;

  if (not Assigned ( Field )) and (edBrinco.text <> Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBRINCO.asString ) then
      updateEdtBrinco ;

  dblcProtocolo.KeyValue :=   null ;
  dblcProtocolo.KeyValue :=   Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKZOO_PROTOCOLO.asString ;

  dblcQuarto.Visible := Zoo_SanidadeDiagnosticosDatamodule.PorQuarto ;
  lblQuarto.Visible := dblcQuarto.Visible ;

  if not dblcQuarto.Visible then
    dblcQuarto.KeyValue := null;

  if not Assigned( Field ) or
     (Field = Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA)then
    EnableEdits;


  if not Assigned ( Field )
    or (Field = Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKCAD_FUNCIONARIO) then
     begin
       imgValidateResponsavel.Visible := False;
       imgFuncionario.Picture := nil ;
       if not Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKCAD_FUNCIONARIO.isNull then
         begin
            edFuncionario.Font.Color := clNavy ;
            imgFuncionario.Hint := 'Responsável associado ao cadastro.'  ;
            ImageList1.GetBitmap( 0, imgFuncionario.Picture.Bitmap )
         end
       else if ( Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarNOMEFUNCIONARIO.asString <> '' ) then
         begin
            edFuncionario.Font.Color := clRed ;
            imgFuncionario.Hint := 'Responsável não associado ao cadastro.'
                    +#13#10'Efetue a pesquisa.'  ;
            ImageList1.GetBitmap( 2, imgFuncionario.Picture.Bitmap ) ;
         end;

     end;

end;

procedure TZoo_SanidadeDiagnosticosWizard.dtsPadroesDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned ( Zoo_SanidadeDiagnosticosDatamodule ) then
    exit ;

  if Field = Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesKZOO_DIAGNOSTICO then
    begin
       UpdateListQuartoPadrao ;
       UpdateListProtocolosPadrao ;
    end;

  if not Assigned ( Field )
    or (Field = Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesKCAD_FUNCIONARIO) then
     begin
       imgFuncionarioPadrao.Picture := nil ;
       if not Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesKCAD_FUNCIONARIO.isNull then
         begin
            edFuncionarioPadrao.Font.Color := clNavy ;
            imgFuncionarioPadrao.Hint := 'Responsável associado ao cadastro.'  ;
            ImageList1.GetBitmap( 0, imgFuncionarioPadrao.Picture.Bitmap )
         end
       else if ( Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesNOMEFUNCIONARIO.asString <> '' ) then
         begin
            edFuncionarioPadrao.Font.Color := clRed ;
            imgFuncionarioPadrao.Hint := 'Responsável não associado ao cadastro.'
                    +#13#10'Efetue a pesquisa.'  ;
            ImageList1.GetBitmap( 2, imgFuncionarioPadrao.Picture.Bitmap ) ;
         end;
     end;

end;


procedure TZoo_SanidadeDiagnosticosWizard.edBrincoButtonClick(Sender: TObject);
begin
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;

end;

procedure TZoo_SanidadeDiagnosticosWizard.edBrincoChange(Sender: TObject);
begin
  if edBrinco.Text = Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBRINCO.asString then
     edBrinco.Font.Color := clNavy
  else
     edBrinco.Font.Color := clRed ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edBrincoEnter(Sender: TObject);
begin
  edBrinco.SelectAll ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
//  do nothing ... disable wrappers ...
end;

procedure TZoo_SanidadeDiagnosticosWizard.updateEdtBrinco;
begin
  if FAdding then
    exit ;

  edBrinco.text := Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBRINCO.asString ;
  edBrinco.Font.color := clNavy ;
  FBrinco := Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBRINCO.asString ;
  edBrinco.SelectAll ;
end;


procedure TZoo_SanidadeDiagnosticosWizard.edBrincoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if ( Key = VK_RETURN ) and
    (( Shift = [] ) or ( Shift = [ssCtrl] ))
 then
    begin
      Key := 0 ;

      if FInoreKeyUp then
       begin
        FInoreKeyUp := False ;
        exit ;
       end;

      FForceAddNew := Shift = [ssCtrl] ;

      if    not FForceAddNew
       and ( Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBRINCO.asString <> '' )
       and ( edBrinco.Text = Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBRINCO.asString )
       and ( FBrinco = edBrinco.Text )
       and (deData.CanFocus)
       and (deData.Showing)
      then
       begin
         deData.SetFocus ;
         exit ;
       end ;

      FBrinco := Trim ( edBrinco.Text ) ;
      AddBrinco ;
    end
  else if Key = vk_up then
    begin
     Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicar.Prior ;
     updateEdtBrinco ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicar.Next ;
     updateEdtBrinco ;
     Key := 0 ;
    end ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edDataPadraoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
   begin
     Key:= 0;
     if dblcDiagnosticoPadrao.CanFocus then
       dblcDiagnosticoPadrao.SetFocus;
   end
end;

procedure TZoo_SanidadeDiagnosticosWizard.UpdateListQuartoPadrao;
begin
  edQuartoPadrao.Visible := Zoo_SanidadeDiagnosticosDatamodule.PorQuartoDefault;
  lblQuartoPadrao.Visible := edQuartoPadrao.Visible ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.ValidateFields( AFieldName: String);
begin
  {Esta procedure é passada ao DataModule para ser executada no evento
   BeforePost do cds}

  if AFieldName = edFuncionario.DataField then
   begin
     imgValidateResponsavel.Top := imgFuncionario.Top;
     imgValidateResponsavel.Left := imgFuncionario.Left;
     imgValidateResponsavel.Hint := 'Responsável deve ser informado quando há tarefas selecionadas.'  ;
     ImageList1.GetBitmap( 1, imgValidateResponsavel.Picture.Bitmap );
     FImageValidate := nil;
     FImageValidate := imgValidateResponsavel;
     //threadsuppl.TSyncThread.Create( MessageValidate );
     MessageValidate
   end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.UpdateListProtocolosPadrao;
var
  LProtocolo : string ;
begin

  // refresh combobox
  dblcProtocoloPadrao.KeyValue :=   null ;
//  dblcProtocoloPadrao.KeyValue :=   Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesKZOO_PROTOCOLO.asString ;

  LProtocolo :=Zoo_SanidadeDiagnosticosDatamodule.GetProtocoloVinculadoDefault( dblcDiagnosticoPadrao.KeyValue );

  Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesKZOO_PROTOCOLO.asString := LProtocolo ;

  if LProtocolo <> '' then
    dblcProtocoloPadrao.KeyValue := LProtocolo;

end;

procedure TZoo_SanidadeDiagnosticosWizard.EnableEdits;
begin
  if Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA.IsNull then
   begin
     dblcDiagnostico.Enabled := False;
     dblcQuarto.Enabled := False;
     dblcProtocolo.Enabled := False;
     edTarefas.Enabled := False;
     edFuncionario.Enabled := False;
   end
  else
   begin
     dblcDiagnostico.Enabled := True;
     dblcQuarto.Enabled := True;
     dblcProtocolo.Enabled := True;
     edTarefas.Enabled := True;
     edFuncionario.Enabled := True;
   end;
end;

class function TZoo_SanidadeDiagnosticosWizard.Execute(
  ABrinco: string): boolean;
begin

  with Create ( nil ) do
    try
        Brinco := ABrinco ;
        edBrinco.Text := FBrinco;
        edBrinco.ReadOnly := True ;
        AddBrinco ;
        Result := ShowModal = mrOK ;
        if Result then
           {ThisForm.DoSomething}  ;
    finally
       free ;
    end ;
end;


procedure TZoo_SanidadeDiagnosticosWizard.MessageValidate;
var
 LThread : TThread ;
begin

  LThread := TThread.CreateAnonymousThread(
   procedure
   var
     Times: Integer;
   begin
     Times := 1;
     while Times <= 5 do
      begin
        TThread.Synchronize ( nil,
          procedure
            begin
              FImageValidate.Visible := True;
              Application.ProcessMessages;
            end
        ) ;
        if Times < 5 then
         begin
           sleep(300);
           TThread.Synchronize ( nil,
             procedure
               begin
                 FImageValidate.Visible := False;
                 Application.ProcessMessages;
              end
           ) ;
           sleep(150);
         end;
        Inc(Times);
      end;
   end
  ) ;
  LThread.FreeOnTerminate := True ;
  LThread.Start ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.ControlPopuperQuartosPadraoClose(
  Sender: TObject);
var
  I : integer ;
  LQuartos : string ;
begin
  LQuartos := '' ;
  For I := 0 to CheckListBox1.Count - 1 do
    if CheckListBox1.Checked[ I ] then
       LQuartos := LQuartos + ',' + CheckListBox1.Items[ I ] ;

  Delete( LQuartos, 1, 1 );
  Zoo_SanidadeDiagnosticosDatamodule.UpdateHintQuartosPadrao( LQuartos ) ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.ControlPopuperQuartosPadraoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) or ( Key = #27 ) then
    ControlPopuperQuartosPadrao.Close
end;

procedure TZoo_SanidadeDiagnosticosWizard.edFuncionarioChange(Sender: TObject);
begin
  if not Assigned ( Zoo_SanidadeDiagnosticosDatamodule ) then
     exit ;

  if ( edFuncionario.Text <> Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarNOMEFUNCIONARIO.asString )
  and not Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKCAD_FUNCIONARIO.isNull then
    Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKCAD_FUNCIONARIO.Clear ;

  imgValidateResponsavel.Visible := False;

end;

procedure TZoo_SanidadeDiagnosticosWizard.edFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
   begin
     Key:= #0 ;
     if ( Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKCAD_FUNCIONARIO.isNull ) then
        TJvDBComboEdit ( Sender ).Button.Click
     else  if edBrinco.CanFocus then
       begin
         FInoreKeyUp := True ;
         ThreadSuppl.TSyncThread.Create( edBrinco.SetFocus ) ;
       end;
   end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edFuncionarioPadraoButtonClick(
  Sender: TObject);
begin
  SearchFuncionarioPadrao( TJvDBComboEdit ( Sender ).Text ) ;
end;


procedure TZoo_SanidadeDiagnosticosWizard.edFuncionarioPadraoChange(
  Sender: TObject);
begin
  if not Assigned ( Zoo_SanidadeDiagnosticosDatamodule ) then
     exit ;

  if ( edFuncionarioPadrao.Text <> Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesNOMEFUNCIONARIO.asString )
  and not Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesKCAD_FUNCIONARIO.isNull then
    Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesKCAD_FUNCIONARIO.Clear ;

end;

procedure TZoo_SanidadeDiagnosticosWizard.edFuncionarioPadraoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
   begin
     Key:= #0 ;
     if ( Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesKCAD_FUNCIONARIO.isNull ) then
        edFuncionarioPadrao.Button.Click
     else if edDataPadrao.CanFocus then
       edDataPadrao.SetFocus;
   end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edQuartoPadraoButtonClick(
  Sender: TObject);
var
 LPoint  : TPoint ;
begin
   LPoint := Point (
          edQuartoPadrao.Left
      ,   edQuartoPadrao.Top
        + edQuartoPadrao.Height
   ) ;
   LPoint := edQuartoPadrao.Parent.clientToScreen ( LPoint ) ;
   ControlPopuperQuartosPadrao.Popup ( LPoint ) ;
   CheckListBox1.ItemIndex := 0 ;
   CheckListBox1.SetFocus ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edQuartoPadraoChange(Sender: TObject);
begin
   edQuartoPadrao.Hint := edQuartoPadrao.Text ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edQuartoPadraoClick(Sender: TObject);
begin
  edQuartoPadrao.SelStart := 1 ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edQuartoPadraoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] )
     {and not ( TDBLookupComboBox ( Sender ).ListVisible )}
  then
    begin
     Key := 0 ;
     edQuartoPadrao.Button.Click ;
    end
  else if Key = VK_RETURN then
   begin
     Key:= 0;
     if dblcProtocoloPadrao.CanFocus then
       dblcProtocoloPadrao.SetFocus;
   end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.SearchFuncionarioPadrao( const TextToSearch: string);
begin
  with Zoo_SanidadeDiagnosticosDatamodule, TSearchFuncionarioAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
         SetFuncionarioPadrao(
            Result.FieldByName( 'KCAD_ENTIDADE' ).asString,
            Result.FieldByName( 'NOME' ).asString
         ) ;
    finally
      free ;
    end ;
end ;



procedure TZoo_SanidadeDiagnosticosWizard.edFuncionarioButtonClick(
  Sender: TObject);
begin
  imgValidateResponsavel.Visible := False;
  if not dtsDiagnosticosAplicar.AutoEdit then
    exit ;
  SearchFuncionario( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgDiagnosticosAplicarEditButtonClick(
  Sender: TObject);
begin
   with Zoo_SanidadeDiagnosticosDatamodule, dbgDiagnosticosAplicar do
       if ( SelectedField = cdsDiagnosticoAplicarNOMEFUNCIONARIO ) then
         SearchFuncionario( InplaceEditor.Text ) ;
end;


procedure TZoo_SanidadeDiagnosticosWizard.dbgDiagnosticosAplicarGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
   if ( Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKCAD_FUNCIONARIO.isNull  )
     and ( Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarNOMEFUNCIONARIO.asString <> '' ) then
       AFont.Color := clRed
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgDiagnosticosAplicarKeyPress(
  Sender: TObject; var Key: Char);
begin
  if ( Key <> #13 ) then
    exit ;

  with dbgDiagnosticosAplicar do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarNOMEFUNCIONARIO ) then
         begin
            self.SearchFuncionario( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgDiagnosticosAplicarShowEditor(
  Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit :=
       (Field <> Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBRINCO)
   and (    (Field <> Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarQUARTO_DESCR)
         or Zoo_SanidadeDiagnosticosDatamodule.PorQuarto
       )
end;

procedure TZoo_SanidadeDiagnosticosWizard.SearchFuncionario( const TextToSearch: string);
begin
  with Zoo_SanidadeDiagnosticosDatamodule, TSearchFuncionarioAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
         SetFuncionario(
            Result.FieldByName( 'KCAD_ENTIDADE' ).asString,
            Result.FieldByName( 'NOME' ).asString
         ) ;

    finally
      free ;
    end ;
end ;





procedure TZoo_SanidadeDiagnosticosWizard.dbgTarefasPadraoCellClick(
  Column: TColumn);
begin
  if not ( dtsTarefasPadrao.DataSet.IsEmpty )
   and ( Column.FieldName =  'CHECKED' ) then
    Zoo_SanidadeDiagnosticosDatamodule.InvertSelectionTarefas( TClientDataSet(dtsTarefasPadrao.DataSet) );
end;

function TZoo_SanidadeDiagnosticosWizard.dbgTarefasPadraoCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := Field = Zoo_SanidadeDiagnosticosDatamodule.cdsTarefasPadraoCHECKED ;
  StringForTrue  := '1' ;
  StringForFalse := '0' ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgTarefasPadraoGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if Zoo_SanidadeDiagnosticosDatamodule.cdsTarefasPadraoDEFAULT.asBoolean then
      AFont.Style := AFont.Style + [fsBold]
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgTarefasPadraoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ControlPopuperTarefasPadrao.ModalResult := mrOK
  else
  if Key = #32 then
   begin
     if not ( dtsTarefasPadrao.DataSet.IsEmpty ) then
       Zoo_SanidadeDiagnosticosDatamodule.InvertSelectionTarefas( TClientDataSet(dtsTarefasPadrao.DataSet) );
   end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgTarefasPadraoShowEditor(
  Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit:= not (dbgTarefasPadrao.DataSource.DataSet.IsEmpty);
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgTarefasShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit:= not (dbgTarefas.DataSource.DataSet.IsEmpty);
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgTarefasCellClick(Column: TColumn);
begin

  if not ( dtsTarefas.DataSet.IsEmpty )
   and ( Column.FieldName =  'CHECKED' ) then
    Zoo_SanidadeDiagnosticosDatamodule.InvertSelectionTarefas( TClientDataSet(dtsTarefas.DataSet) );
end;

function TZoo_SanidadeDiagnosticosWizard.dbgTarefasCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := Field = Zoo_SanidadeDiagnosticosDatamodule.cdsTarefasCHECKED ;
  StringForTrue  := '1' ;
  StringForFalse := '0' ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgTarefasGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if Zoo_SanidadeDiagnosticosDatamodule.cdsTarefasDEFAULT.asBoolean then
      AFont.Style := AFont.Style + [fsBold]
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgTarefasKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
      ControlPopuperTarefas.ModalResult := mrOK
 else
  if Key = #32 then
   begin
     if not ( dtsTarefas.DataSet.IsEmpty ) then
       Zoo_SanidadeDiagnosticosDatamodule.InvertSelectionTarefas( TClientDataSet(dtsTarefas.DataSet) );
   end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edTarefasPadraoButtonClick(
  Sender: TObject);
var
 LPoint  : TPoint ;
begin
   LPoint := Point (
          edTarefasPadrao.Left
      ,   edTarefasPadrao.Top
        + edTarefasPadrao.Height
   ) ;
   LPoint := edTarefasPadrao.Parent.clientToScreen ( LPoint ) ;
   ControlPopuperTarefasPadrao.Popup ( LPoint ) ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edTarefasPadraoChange(
  Sender: TObject);
begin
   edTarefasPadrao.Hint := edTarefasPadrao.Text ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edTarefasPadraoClick(Sender: TObject);
begin
  edTarefasPadrao.SelStart := 1 ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edTarefasPadraoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] )
     {and not ( TDBLookupComboBox ( Sender ).ListVisible )}
  then
    begin
     Key := 0 ;
     edTarefasPadrao.Button.Click ;
    end
  else if Key = VK_RETURN then
   begin
     Key:= 0;
     if edFuncionarioPadrao.CanFocus then
       edFuncionarioPadrao.SetFocus;
   end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edTarefasButtonClick(
  Sender: TObject);
var
 LPoint  : TPoint ;
begin

   LPoint := Point (
          edTarefas.Left
      ,   edTarefas.Top
        + edTarefas.Height
   ) ;
   LPoint := edTarefas.Parent.clientToScreen ( LPoint ) ;
   ControlPopuperTarefas.Popup ( LPoint ) ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edTarefasChange(Sender: TObject);
begin
   edTarefas.Hint := edTarefas.Text ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edTarefasClick(Sender: TObject);
begin
  edTarefas.SelStart := 1 ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edTarefasGridButtonClick(
  Sender: TObject);
var
 LPoint  : TPoint ;
begin

   LPoint := Point (
          edTarefasGrid.Left
      ,   edTarefasGrid.Top
        + edTarefasGrid.Height
   ) ;
   LPoint := edTarefasGrid.Parent.clientToScreen ( LPoint ) ;
   ControlPopuperTarefas.Popup ( LPoint ) ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edTarefasGridClick(Sender: TObject);
begin
  edTarefasGrid.SelStart := 1 ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edTarefasGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] )
   //and not ( TDBLookupComboBox ( Sender ).ListVisible )
  then
    begin
     Key := 0 ;
     edTarefasGrid.Button.Click ;
    end
  else
end;


procedure TZoo_SanidadeDiagnosticosWizard.edTarefasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] )
     {and not ( TDBLookupComboBox ( Sender ).ListVisible )}
  then
    begin
     Key := 0 ;
     edTarefas.Button.Click ;
    end
  else if Key = VK_RETURN then
   begin
     Key := 0 ;
     if edFuncionario.CanFocus then
       edFuncionario.SetFocus;
   end;
end;

function TZoo_SanidadeDiagnosticosWizard.SearchAnimalFemea(
  TextToSearch: string): boolean;
var
  lFound : boolean ;
begin
    lFound := False ;
    with TSearchFemeaAtivo.Create do
       try
          TextToFind := TextToSearch ;
          FBrinco := '' ;
          lFound := Execute ;
          if ( lFound ) then
             begin
               FBrinco               := Result.FieldByName( 'BRINCO' ).asString ;
               edBrinco.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               edBrinco.Font.Color   := clNavy ;
               AddByKey ( Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString ) ;
             end ;
       finally
          SearchAnimalFemea := lFound ;
          free ;
       end ;

end;

procedure TZoo_SanidadeDiagnosticosWizard.SetBrinco(const Value: String);
begin
  FBrinco := Value;
end;

procedure TZoo_SanidadeDiagnosticosWizard.ShowQuickFields;
begin
  Zoo_SanidadeDiagnosticosDatamodule.UseQuickInput :=  chkQuickInput.Checked ;


  pnlQuickInput.Visible := Zoo_SanidadeDiagnosticosDatamodule.UseQuickInput;
end;

procedure TZoo_SanidadeDiagnosticosWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_SanidadeDiagnosticosDatamodule.Apply ;
//  Zoo_SanidadeDiagnosticosDatamodule.OpenDiagnosticosAplicar ;
  TCLAg5NSMsgEVT_Diagnosticos.CreateAndDispatch( self ) ;

  if Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicar.IsEmpty then
    begin
      MessageDlg ( 'Diagnósticos inseridos com sucesso' ) ;
      inherited;
    end
  else
    MessageDlg ( 'Alguns diagnósticos contém dados inválidos'
         +#13#10+Zoo_SanidadeDiagnosticosDatamodule.DoApllyMessageError ) ;
end;

procedure TZoo_SanidadeDiagnosticosWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled :=  not dtsDiagnosticosAplicar.DataSet.IsEmpty;
end;

procedure TZoo_SanidadeDiagnosticosWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;

end;

procedure TZoo_SanidadeDiagnosticosWizard._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TZoo_SanidadeDiagnosticosWizard ) ;

end.
