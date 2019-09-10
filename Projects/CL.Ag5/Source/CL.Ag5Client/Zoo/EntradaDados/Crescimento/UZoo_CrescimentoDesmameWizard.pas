unit UZoo_CrescimentoDesmameWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel,
  UZoo_CrescimentoDesmameDatamodule, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, JvImage, VCL.Mask, JvExMask, JvToolEdit,
  Tc.VCL.Edits, JvExStdCtrls, JvEdit, JvDBSearchEdit,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, VCL.DBCtrls, Tc.VCL.Controls.GDIButton,
  CL.AG5.NSMsgs, System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Edits.DBControls, Wrappers ;

type
  TZoo_CrescimentoDesmameWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsDesmame: TDataSource;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Panel1: TPanel;
    lblParamPeso: TLabel;
    lblParamDias: TLabel;
    edtBrinco: TJvDBSearchEdit;
    lcStatus: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    deDataPadrao: TTcDateEdit;
    gdeDataDesmame: TTcDBDateEdit;
    jvceBrinco: TJvComboEdit;
    Label5: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure JvDBUltimGrid1DblClick(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure jvceBrincoButtonClick(Sender: TObject);
    procedure jvceBrincoEnter(Sender: TObject);
    procedure jvceBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure jvceBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure deDataPadraoChange(Sender: TObject);
    procedure deDataPadraoExit(Sender: TObject);
  private
    { Private declarations }
    FStrParamPeso,
    FStrParamMeses : string ;
    Zoo_CrescimentoDesmameDatamodule : TZoo_CrescimentoDesmameDatamodule ;

    FBrinco       : string ;
    function SearchAnimalFemea ( TextToSearch : string) : boolean ;
    procedure AddByKey ( AKey : String ) ;
    procedure AddBrinco ;
    procedure UpdateEdtBrinco ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;

implementation

{$R *.dfm}

Uses SearchsZootecnico, Exceptions ,  UMessagePrintDialog;


{ TfrmCustomWizard }

procedure TZoo_CrescimentoDesmameWizard.AddBrinco;
begin
  try
    if ( Trim ( jvceBrinco.Text ) <> '' ) and Zoo_CrescimentoDesmameDatamodule.AddBrinco( FBrinco, deDataPadrao.Date ) then
      begin
        UpdateEdtBrinco ;
        exit ;
      end ;

    if SearchAnimalFemea ( FBrinco ) then
      begin
      end
    else
       raise Warning.Create('Animal não encontrado');
  except
     jvceBrinco.setFocus ;
     jvceBrinco.SelectAll ;
     raise ;
  end ;
end;

procedure TZoo_CrescimentoDesmameWizard.AddByKey(AKey: String);
begin
  if Zoo_CrescimentoDesmameDatamodule.LocateBrinco( FBrinco ) then
     exit ;
  Zoo_CrescimentoDesmameDatamodule.AddByKey ( AKey, deDataPadrao.Date );

end;

constructor TZoo_CrescimentoDesmameWizard.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;
   FStrParamPeso   := lblParamPeso.Caption ;
   FStrParamMeses  := lblParamDias.Caption ;
   Zoo_CrescimentoDesmameDatamodule := TZoo_CrescimentoDesmameDatamodule.Create ( self ) ;
   dtsDesmame.DataSet := Zoo_CrescimentoDesmameDatamodule.cdsDesmame ;
   Zoo_CrescimentoDesmameDatamodule.OpenTables ;
   lblParamPeso.Caption  := Format ( FStrParamPeso,  [ Zoo_CrescimentoDesmameDatamodule.PesoDesmame  ] ) ;
   lblParamDias.Caption := Format ( FStrParamMeses, [ Zoo_CrescimentoDesmameDatamodule.DiasDesmame ] ) ;
end;

procedure TZoo_CrescimentoDesmameWizard.DBLookupComboBox1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_CrescimentoDesmameWizard.DBLookupComboBox1KeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
   begin
     Key := #0 ;
     edtBrinco.SetFocus ;
   end ;
end;

procedure TZoo_CrescimentoDesmameWizard.deDataPadraoChange(Sender: TObject);
begin
  //
end;

procedure TZoo_CrescimentoDesmameWizard.deDataPadraoExit(Sender: TObject);
begin
  if deDataPadrao.Date > Date then
   begin
     deDataPadrao.Clear;
     if deDataPadrao.CanFocus then
       deDataPadrao.SetFocus;
     raise Warning.Create('Data não pode ser maior que data atual');
   end;

  if deDataPadrao.Date > 0 then
    Zoo_CrescimentoDesmameDatamodule.DataPadrao := deDataPadrao.Date
  else
    Zoo_CrescimentoDesmameDatamodule.DataPadrao := Date;
end;

procedure TZoo_CrescimentoDesmameWizard.edtBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13  ) then
    begin
      Key := #0 ;
      DBLookupComboBox1.SetFocus ;
    end;
end;

class function TZoo_CrescimentoDesmameWizard.Execute : boolean;
begin
  with Create ( nil ) do
    try
        Result := ShowModal = mrOK ;
        if Result then
          {ThisForm.DoSomething}  ;

    finally
       free ;
    end ;

end ;

procedure TZoo_CrescimentoDesmameWizard.jvceBrincoButtonClick(
  Sender: TObject);
begin
  inherited;
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_CrescimentoDesmameWizard.jvceBrincoEnter(Sender: TObject);
begin
  inherited;
  jvceBrinco.SelectAll ;
end;

procedure TZoo_CrescimentoDesmameWizard.jvceBrincoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_up then
    begin
     Zoo_CrescimentoDesmameDatamodule.cdsDesmame.Prior ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_CrescimentoDesmameDatamodule.cdsDesmame.Next ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end ;
end;

procedure TZoo_CrescimentoDesmameWizard.jvceBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Zoo_CrescimentoDesmameDatamodule.cdsDesmame.State in [dsInsert,dsEdit] then
     Zoo_CrescimentoDesmameDatamodule.cdsDesmame.Post ;

  if ( Key = #13  ) then
    begin
      Key := #0 ;
      //if ( Trim ( edtBrinco.Text ) = '' ) then
      //  exit ;

      if ( Trim ( jvceBrinco.Text ) <> '' ) and ( jvceBrinco.Text = Zoo_CrescimentoDesmameDatamodule.cdsDesmameBRINCO.asString ) then
       begin

         exit ;
       end ;

      FBrinco := jvceBrinco.Text ;
      AddBrinco ;
    end;
end;

procedure TZoo_CrescimentoDesmameWizard.JvDBUltimGrid1DblClick(Sender: TObject);
begin
//  if Self.JvDBUltimGrid1.SelectedField = Zoo_CrescimentoDesmameDatamodule.cdsDesmameDESCR_STATUS then
//     Zoo_CrescimentoDesmameDatamodule.InvertStatus ;
end;

procedure TZoo_CrescimentoDesmameWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

function TZoo_CrescimentoDesmameWizard.SearchAnimalFemea(
  TextToSearch: string): boolean;
var
  lFound : boolean ;
begin
    lFound := False ;
    with TSearchFemeaAtivo.Create do
       try
          FBrinco := '' ;
          //TextToFind := TextToSearch ;
          TextToFind := '' ;
          lFound := Execute ;
          if lFound then
             begin
               FBrinco                 := Result.FieldByName( 'BRINCO' ).asString ;
               jvceBrinco.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               jvceBrinco.Font.Color   := clNavy ;
               AddByKey ( Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString ) ;
             end ;
       finally
          SearchAnimalFemea := lFound ;
          free ;
       end ;
end;

procedure TZoo_CrescimentoDesmameWizard.UpdateEdtBrinco;
begin
  jvceBrinco.text := Zoo_CrescimentoDesmameDatamodule.cdsDesmameBRINCO.asString ;
  jvceBrinco.Font.color := clNavy ;
  FBrinco := Zoo_CrescimentoDesmameDatamodule.cdsDesmameBRINCO.asString ;
end;

procedure TZoo_CrescimentoDesmameWizard._actExecuteExecute(Sender: TObject);
begin
   Zoo_CrescimentoDesmameDatamodule.ApplyUpdates ;
   MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
   TCLAg5NSMsgEVT_Desmame.CreateAndDispatch( self ) ; ;
   inherited;
end;

procedure TZoo_CrescimentoDesmameWizard._actExecuteUpdate(Sender: TObject);
var
   ActionEnabled : boolean ;
begin
  ActionEnabled := False ;
  try
    ActionEnabled := Zoo_CrescimentoDesmameDatamodule.cdsDesmame.ChangeCount > 0  ;
  except
  end;
  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  ActionEnabled ;
end;

procedure TZoo_CrescimentoDesmameWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_CrescimentoDesmameWizard._actPriorExecute(Sender: TObject);
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
  RegisterClass ( TZoo_CrescimentoDesmameWizard ) ;
 end.


