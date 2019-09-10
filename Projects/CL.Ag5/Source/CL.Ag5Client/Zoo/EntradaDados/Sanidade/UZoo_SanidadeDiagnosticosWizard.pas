unit UZoo_SanidadeDiagnosticosWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  VCL.DBCtrls, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvExControls,
  JvDBLookup, JvToolEdit, VCL.Mask, JvExMask,
  UZoo_SanidadeDiagnosticosDatamodule, Data.DB, Tc.Data.DB.Helpers, JvDBCheckBox, Spin, JvExStdCtrls,
  JvCombobox, JvDBSearchComboBox, JvEdit, JvDBSearchEdit, JvDBControls,
  Tc.VCL.Application,
  Tc.VCL.Edits, Tc.VCL.Edits.DBControls, UZoo_EntradaDadosBaseWizard,
  Tc.VCL.Controls.GDIButton, System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_SanidadeDiagnosticosWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbgProtocolosAAplicar: TJvDBUltimGrid;
    dbgDiagnosticosAplicados: TJvDBUltimGrid;
    Splitter1: TSplitter;
    Panel5: TPanel;
    dtsDiagnosticosAAplicar: TDataSource;
    dtsDiagnosticosDisponiveis: TDataSource;
    dtsProtocolosAAplicar: TDataSource;
    dtsDiagnosticosAplicados: TDataSource;
    Panel8: TPanel;
    Panel10: TPanel;
    GroupBox3: TGroupBox;
    lblAnimal: TLabel;
    edtBrinco: TJvComboEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBEdit2: TDBText;
    JvDBDateEdit1: TTcDBDateEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dbBrinco: TDBText;
    dbDPP: TDBText;
    dbUltimaPesagem: TDBText;
    dbDataUltimaPesagem: TDBText;
    dbStatus: TDBText;
    dbUltimoEvento: TDBText;
    dbDataUltimoEvento: TDBText;
    dtsResumoAnimal: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    lblQuarto: TLabel;
    dblcQuarto: TDBLookupComboBox;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure edtBrincoButtonClick(Sender: TObject);
    procedure edtBrincoChange(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    function dbgProtocolosAAplicarCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgDiagnosticosAplicadosShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure edtBrincoEnter(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgProtocolosAAplicarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDiagnosticosAplicadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgProtocolosAAplicarKeyPress(Sender: TObject; var Key: Char);
    procedure dbgShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure dtsDiagnosticosDisponiveisDataChange(Sender: TObject;
      Field: TField);
    procedure dblcQuartoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FBrinco : string ;
    Zoo_SanidadeDiagnosticosDatamodule : TZoo_SanidadeDiagnosticosDatamodule ;
    procedure AddBrinco ;
    function SearchAnimalFemea ( TextToSearch : string) : boolean ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute ( ABrinco : string ) : boolean ;
  end;


implementation

uses SearchsZootecnico, Exceptions;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_SanidadeDiagnosticosWizard.AddBrinco ;
begin

  try
    if ( FBrinco <> '' ) and Zoo_SanidadeDiagnosticosDatamodule.AddBrinco( FBrinco ) then
      begin
        edtBrinco.Font.color := clNavy ;
        if DBLookupComboBox1.Showing then
          DBLookupComboBox1.SetFocus ;
        exit ;
      end ;
    if SearchAnimalFemea ( FBrinco ) then
      begin
        if DBLookupComboBox1.Showing then
           DBLookupComboBox1.SetFocus
      end
    else
       raise Warning.Create('Animal não encontrado');
  except
      if edtBrinco.Showing then
         edtBrinco.setFocus ;
     edtBrinco.SelectAll ;
     raise ;
  end ;
end;

constructor TZoo_SanidadeDiagnosticosWizard.Create(AOwner: TComponent);
begin

   inherited Create ( AOwner ) ;

   Zoo_SanidadeDiagnosticosDatamodule  := TZoo_SanidadeDiagnosticosDatamodule.Create ( self ) ;
   dtsDiagnosticosAAplicar.DataSet     := Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosAAplicar ;
   dtsDiagnosticosDisponiveis.DataSet  := Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosDisponiveis ;
   dtsProtocolosAAplicar.DataSet       := Zoo_SanidadeDiagnosticosDatamodule.cdsProtocolosAAplicar ;
   dtsDiagnosticosAplicados.DataSet    := Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosAplicados ;
   Zoo_SanidadeDiagnosticosDatamodule.OpenTables ;

//   cdsZoo_Diagnosticos.DataSet := Zoo_SanidadeDiagnosticosDatamodule.cdsCoberturas ;

end;

procedure TZoo_SanidadeDiagnosticosWizard.edtBrincoButtonClick(Sender: TObject);
begin
  inherited;
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edtBrincoChange(Sender: TObject);
begin
  inherited;
  edtBrinco.Font.Color := clRed ;

end;

procedure TZoo_SanidadeDiagnosticosWizard.edtBrincoEnter(Sender: TObject);
begin
  edtBrinco.SelectAll
end;

procedure TZoo_SanidadeDiagnosticosWizard.edtBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if ( Key = #13  ) then
    begin
      Key := #0 ;

      FBrinco := Trim ( edtBrinco.Text ) ;
      AddBrinco ;
    end;
end;

class function TZoo_SanidadeDiagnosticosWizard.Execute( ABrinco : string ) : boolean;
begin
  with Create ( nil ) do
    try
        FBrinco := ABrinco ;
        lblAnimal.Visible  := False ;
        edtBrinco.ReadOnly := True ;
        edtBrinco.Visible  := False  ;
        AddBrinco ;
        Result := ShowModal = mrOK ;
        if Result then
           {ThisForm.DoSomething}  ; ;
    finally
       free ;
    end ;
end ;

function TZoo_SanidadeDiagnosticosWizard.dbgProtocolosAAplicarCheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin
  inherited;
  Result := Field = Zoo_SanidadeDiagnosticosDatamodule.cdsProtocolosAAplicarSELECTED ;
  StringForTrue  := '1' ;
  StringForFalse := '0' ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgProtocolosAAplicarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgProtocolosAAplicarKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TZoo_SanidadeDiagnosticosWizard.dbgShowEditor(
  Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcQuartoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dtsDiagnosticosDisponiveisDataChange(
  Sender: TObject; Field: TField);
begin
   if not Assigned ( Field ) then
        begin
           lblQuarto.Visible := Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosDisponiveisPOR_QUARTO.asBoolean ;
           dblcQuarto.Visible := lblQuarto.Visible ;
        end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgDiagnosticosAplicadosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dbgDiagnosticosAplicadosShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False
end;

function TZoo_SanidadeDiagnosticosWizard.SearchAnimalFemea(TextToSearch: string) : boolean ;
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
               FBrinco                := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Font.Color   := clNavy ;
               Zoo_SanidadeDiagnosticosDatamodule.AddByKey ( Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString )
             end ;
       finally
          SearchAnimalFemea := lFound ;
          free ;
       end ;
end;


procedure TZoo_SanidadeDiagnosticosWizard._actExecuteExecute(Sender: TObject);
begin
  inherited;
  Zoo_SanidadeDiagnosticosDatamodule.applyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_Diagnosticos.CreateAndDispatch( self ) ; ;
  edtBrinco.Clear ;
end;

procedure TZoo_SanidadeDiagnosticosWizard._actExecuteUpdate(Sender: TObject);
begin
  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and ( not self.Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosAAplicar.IsEmpty )
             and ( not self.Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosAAplicarKZOO_ANIMAL.IsNull )
             and ( not self.Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosAAplicarDATA.IsNull )
             and ( not self.Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosAAplicarKZOO_DIAGNOSTICO.IsNull ) ;
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

end.
