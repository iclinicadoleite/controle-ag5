unit UZoo_SanidadeBaixarTarefasWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.DBCtrls, JvToolEdit,
  VCL.Mask, JvExMask,
  UZoo_SanidadeBaixarTarefasDatamodule, Data.DB, Tc.Data.DB.Helpers, JvDBControls, JvExStdCtrls, JvEdit, JvDBSearchEdit,
  JvDBCheckBox, Tc.VCL.Edits.DBControls, Tc.VCL.Edits,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, Tc.VCL.Controls.GDIButton,
  System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_SanidadeBaixarTarefasWizard = class(TZoo_EntradaDadosBaseWizard)
    tbsAnimal: TTabSheet;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    DBEdit1: TDBText;
    dbgTarefasAnimal: TJvDBUltimGrid;
    Label2: TLabel;
    dtsAnimaisTarefa: TDataSource;
    tbsTarefa: TTabSheet;
    GroupBox3: TGroupBox;
    Panel4: TPanel;
    Panel6: TPanel;
    dbgTarefas: TJvDBUltimGrid;
    Panel9: TPanel;
    Label10: TLabel;
    Label7: TLabel;
    edtBrincoIndividual: TJvComboEdit;
    Label4: TLabel;
    tbsTipoLancto: TTabSheet;
    Label8: TLabel;
    dtsTmp: TDataSource;
    Label5: TLabel;
    dblcTarefaColetivo: TDBLookupComboBox;
    dtsTarefasFuncionario: TDataSource;
    dtsTarefasAnimal : TDataSource;
    rbLancamentoAnimal: TRadioButton;
    rbLancamentoTarefa: TRadioButton;
    Panel11: TPanel;
    Panel12: TPanel;
    Label6: TLabel;
    JvDateEdit1: TTcDateEdit;
    rbLancamentoFuncionario: TRadioButton;
    tbsFuncionario: TTabSheet;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label23: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel1: TPanel;
    Panel7: TPanel;
    Panel13: TPanel;
    Label24: TLabel;
    Panel14: TPanel;
    dbgTarefasFuncionarios: TJvDBUltimGrid;
    JvDBDateEdit1: TTcDBDateEdit;
    JvDBDateEdit2: TTcDBDateEdit;
    JvDBDateEdit3: TTcDBDateEdit;
    dblcStatusTarefasColetivo: TDBLookupComboBox;
    dblcStatusTarefasFuncionario: TDBLookupComboBox;
    btbSelectAllFuncionario: TTcGDIButton;
    pnlLegenda: TPanel;
    Image1: TImage;
    Label11: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    deDataIndividual: TTcDBDateEdit;
    deDataAnimais: TTcDBDateEdit;
    deDataFuncionario: TTcDBDateEdit;
    btbSelectAllColetivo: TTcGDIButton;
    deReExecutarIndividual: TTcDBDateEdit;
    deReExecutarAnimais: TTcDBDateEdit;
    deReExecutarFuncionario: TTcDBDateEdit;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edtBrincoIndividualChange(Sender: TObject);
    procedure edtBrincoIndividualButtonClick(Sender: TObject);
    procedure edtBrincoIndividualKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure dblcAnimalIndividualKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dblcTarefaColetivoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function dbgCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgKeyPress(Sender: TObject; var Key: Char);
    procedure dbgKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btbSelectAllColetivoClick(Sender: TObject);
    procedure btbSelectAllFuncionarioClick(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure dtsTarefasFuncionarioDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FBrinco : string ;
    Zoo_SanidadeBaixarTarefasDatamodule: TZoo_SanidadeBaixarTarefasDatamodule;
    procedure AddBrincoIndividual ;
    function SearchAnimalFemeaIndividual ( TextToSearch : string) : boolean ;
    procedure ValidateCamposFixo;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute ( ABrinco : string ) : boolean ; reintroduce ;
  end;


implementation

uses SearchsZootecnico, Exceptions ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_SanidadeBaixarTarefasWizard.btbSelectAllFuncionarioClick(Sender: TObject);
begin
   if not (    VarIsEmpty ( dblcStatusTarefasFuncionario.KeyValue )
            or VarIsNull  ( dblcStatusTarefasFuncionario.KeyValue ) ) then
      Zoo_SanidadeBaixarTarefasDatamodule.SelectAllTarefasFuncionarios( dblcStatusTarefasFuncionario.KeyValue )
end;

procedure TZoo_SanidadeBaixarTarefasWizard.btbSelectAllColetivoClick(Sender: TObject);
begin
   if not (    VarIsEmpty ( dblcStatusTarefasColetivo.KeyValue )
           or  VarIsNull ( dblcStatusTarefasColetivo.KeyValue )  ) then
      Zoo_SanidadeBaixarTarefasDatamodule.SelectAllTarefasColetivo( dblcStatusTarefasColetivo.KeyValue )
end;

constructor TZoo_SanidadeBaixarTarefasWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;
//   deDataEvento.Date := Date ;

   Zoo_SanidadeBaixarTarefasDatamodule := TZoo_SanidadeBaixarTarefasDatamodule.Create ( self ) ;

   JvDateEdit1.Date         := Date ;
   dtsAnimaisTarefa.DataSet := Zoo_SanidadeBaixarTarefasDatamodule.cdsAnimaisTarefa ;

   Zoo_SanidadeBaixarTarefasDatamodule.OpenTables ;

//   cdsZoo_Protocolos.DataSet := Zoo_SanidadeBaixarTarefasDatamodule.cdsCoberturas ;
end;

function TZoo_SanidadeBaixarTarefasWizard.dbgCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
  {
  Result := Field = Zoo_SanidadeDiagnosticosDatamodule.cdsProtocolosAAplicarSELECTED ;
  StringForTrue  := '1' ;
  StringForFalse := '0' ;
  }
  Result := False ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard.dbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard.dbgKeyPress(
  Sender: TObject; var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key <> #13 ) then
    exit ;


   if (  Screen.ActiveControl = TJvDBUltimGrid ( Sender ) ) then
      Key := #0 ;

   with (TJvDBUltimGrid ( Sender )) do
       begin
          SkipDone := False ;
          while selectedindex < (fieldcount - 1) do
            begin
              selectedindex := selectedindex + 1 ;
              if ( not Columns[ selectedindex ].ReadOnly ) and ( Columns[ selectedindex ].Visible ) then
               begin
                 SkipDone := True ;
                 Break ;
               end;
           end ;

          if not SkipDone then
             begin
               DataSource.DataSet.Next;
               selectedindex := 0 ;
               while ( Columns[ selectedindex ].ReadOnly or not Columns[ selectedindex ].Visible ) and (selectedindex < (fieldcount - 1)) do
                  selectedindex := selectedindex + 1 ;
             end ;
      end;

end;

procedure TZoo_SanidadeBaixarTarefasWizard.dbgShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard.dblcTarefaColetivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard.DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else if ( not Key in [ VK_RETURN ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
     TDBLookupComboBox ( Sender ).DropDown ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard.dtsTarefasFuncionarioDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  btbSelectAllFuncionario.Enabled      := True;
  dblcStatusTarefasFuncionario.Enabled := True;
end;

procedure TZoo_SanidadeBaixarTarefasWizard.dblcAnimalIndividualKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard.edtBrincoIndividualButtonClick(Sender: TObject);
begin
  inherited;
  SearchAnimalFemeaIndividual ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard.edtBrincoIndividualChange(Sender: TObject);
begin
  inherited;
  edtBrincoIndividual.Font.Color := clRed ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard.edtBrincoIndividualKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if ( Key = #13  ) then
    begin
      Key := #0 ;
//      if ( Trim ( edtBrincoIndividual.Text ) = '' ) then
//        exit ;

      FBrinco := edtBrincoIndividual.Text ;
      AddBrincoIndividual ;
    end;

end;

class function TZoo_SanidadeBaixarTarefasWizard.Execute ( ABrinco : string ) : boolean;
begin
  with Create ( nil ) do
    try
        rbLancamentoAnimal.Checked := True ;
        _actNextExecute ( nil ) ;
        tbsTipoLancto.Enabled := False ;
        FBrinco                          := ABrinco ;
        edtBrincoIndividual.Text         := ABrinco ;
        edtBrincoIndividual.Font.Color   := clNavy ;
        edtBrincoIndividual.ReadOnly     := True ;
        AddBrincoIndividual  ;
        Result := ShowModal = mrOK ;
        if Result then
           {ThisForm.DoSomething}  ; ;
    finally
       free ;
    end ;
end ;

procedure TZoo_SanidadeBaixarTarefasWizard.dbgDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (not assigned ( column.Field )) // and ( Column.Title.Caption = '' )
   and ( not TJvDBUltimGrid ( Sender ).DataSource.DataSet.IsEmpty )
   and (TJvDBUltimGrid ( Sender ).DataSource.DataSet.FieldByName('DATAPREVISTA').AsDateTime < Date) then
     TJvDBUltimGrid ( Sender ).Canvas.Draw( Rect.Left + ( (( Rect.Right - Rect.Left ) - Image1.Width) div 2), Rect.Top + 2, Image1.Picture.Graphic );
end;

procedure TZoo_SanidadeBaixarTarefasWizard._actExecuteExecute(Sender: TObject);
begin
  inherited;
  Zoo_SanidadeBaixarTarefasDatamodule.applyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_BaixaTarefas.CreateAndDispatch( self ) ; ;
  Zoo_SanidadeBaixarTarefasDatamodule.Reopen ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard._actExecuteUpdate(Sender: TObject);
var
   ActionEnabled : boolean ;
begin
  ActionEnabled := False ;

  if PageControl.ActivePageIndex > 0 then
    with Zoo_SanidadeBaixarTarefasDatamodule do
      begin
        if TipoLanctoTarefa = lpAnimal then
          ActionEnabled := ( cdsTarefasAnimal.ChangeCount > 0 ) ;

        if TipoLanctoTarefa = lpTarefa then
          ActionEnabled := ( cdsAnimaisTarefa.ChangeCount > 0 ) ;

        if TipoLanctoTarefa = lpFuncionario then
          ActionEnabled := ( cdsTarefasFuncionario.ChangeCount > 0 ) ;

      end;

  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  ActionEnabled ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  Caption := 'Baixar Tarefas' ;
  self.tbsAnimal.Enabled        := rbLancamentoAnimal.Checked ;
  self.tbsTarefa.Enabled        := rbLancamentoTarefa.Checked ;
  self.tbsFuncionario.Enabled   := rbLancamentoFuncionario.Checked ;
  Zoo_SanidadeBaixarTarefasDatamodule.Data    := JvDateEdit1.Date ;


  if rbLancamentoAnimal.Checked then
    self.Zoo_SanidadeBaixarTarefasDatamodule.TipoLanctoTarefa := lpAnimal
  else if rbLancamentoTarefa.Checked then
    begin
       self.Zoo_SanidadeBaixarTarefasDatamodule.TipoLanctoTarefa := lpTarefa ;
       if self.Zoo_SanidadeBaixarTarefasDatamodule.cdsTarefas.isEmpty then
        raise Warning.Create('não ha dados para o período');
    end
  else
    begin
       self.Zoo_SanidadeBaixarTarefasDatamodule.TipoLanctoTarefa := lpFuncionario ;
       if self.Zoo_SanidadeBaixarTarefasDatamodule.cdsFuncionarios.isEmpty then
          raise Warning.Create('não ha dados para o período');
    end;


  inherited;

  pnlLegenda.Visible := PageControl.ActivePageIndex > 0 ;
  if rbLancamentoAnimal.Checked then
     Caption := 'Baixar Tarefas' + ' ' + rbLancamentoAnimal.Caption + ' até ' + formatDateTime ( 'dd.mm.yyyy', JvDateEdit1.date ) ;
  if rbLancamentoTarefa.Checked then
     Caption := 'Baixar Tarefas' + ' ' + rbLancamentoTarefa.Caption + ' até ' + formatDateTime ( 'dd.mm.yyyy', JvDateEdit1.date ) ;
  if rbLancamentoFuncionario.Checked then
     Caption := 'Baixar Tarefas' + ' ' + rbLancamentoFuncionario.Caption + ' até ' + formatDateTime ( 'dd.mm.yyyy', JvDateEdit1.date ) ;

end;

procedure TZoo_SanidadeBaixarTarefasWizard._actNextUpdate(Sender: TObject);
begin
  _actNext.Enabled := ( self.rbLancamentoAnimal.Checked
                or  self.rbLancamentoTarefa.Checked
                or  self.rbLancamentoFuncionario.Checked )
                and  ( self.JvDateEdit1.Date > 1 ) ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
  pnlLegenda.Visible := PageControl.ActivePageIndex > 0 ;
  Caption := 'Baixar Tarefas' ;
end;


procedure TZoo_SanidadeBaixarTarefasWizard.AddBrincoIndividual;
begin
//  ValidateCamposFixo;

  try
    if Zoo_SanidadeBaixarTarefasDatamodule.AddBrincoIndividual( FBrinco ) then
      begin
        edtBrincoIndividual.Font.color := clNavy ;
        edtBrincoIndividual.SelectAll ;
        exit ;
      end ;

    if SearchAnimalFemeaIndividual ( FBrinco ) then
       edtBrincoIndividual.SelectAll
    else
       raise Warning.Create('Animal não encontrado');
  except
     edtBrincoIndividual.setFocus ;
     edtBrincoIndividual.SelectAll ;
     raise ;
  end ;
end;

function TZoo_SanidadeBaixarTarefasWizard.SearchAnimalFemeaIndividual(
  TextToSearch: string): boolean;
var
  lFound : boolean ;
begin
    lFound := False ;
    with TSearchFemeaAtivo.Create do
       try
          FBrinco := '' ;
          TextToFind := TextToSearch ;
          lFound := Execute ;
          if lFound then
             begin
               FBrinco                          := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrincoIndividual.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrincoIndividual.Font.Color   := clNavy ;
               AddBrincoIndividual  ;
             end ;
       finally
          SearchAnimalFemeaIndividual := lFound ;
          free ;
       end ;
end;

procedure TZoo_SanidadeBaixarTarefasWizard.ValidateCamposFixo;
begin
//
end ;


end.
