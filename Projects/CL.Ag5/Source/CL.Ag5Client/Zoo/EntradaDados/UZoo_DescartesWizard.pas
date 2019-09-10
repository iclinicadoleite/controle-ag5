unit UZoo_DescartesWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls, Data.DB, Tc.Data.DB.Helpers,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel,
  UZoo_DescartesDatamodule, JvImage, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.Mask, JvExMask, JvToolEdit, Tc.VCL.Edits, VCL.DBCtrls,
  Tc.VCL.Edits.DBControls, JvBaseEdits, JvDBControls,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Extended.Mask, JvExStdCtrls, JvEdit, Wrappers ;

type
  TZoo_DescartesWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsDescartes: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    deDataPadrao: TTcDateEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    lcbPadraoRazaoX: TDBLookupComboBox;
    Label4: TLabel;
    lcbPadraoMotivo: TDBLookupComboBox;
    deGridValor: TJvDBCalcEdit;
    deGridData: TTcDBDateEdit;
    dbmGridObs: TDBMemo;
    Label5: TLabel;
    DBLookupComboBox2X: TDBLookupComboBox;
    Label6: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    deData: TTcDBDateEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    BitBtn2: TTcGDIButton;
    edtBrinco: TJvComboEdit;
    dtsTipoRazaoDescartePadrao: TDataSource;
    dtsTipoMotivoDescartePadrao: TDataSource;
    edValor: TJvDBCalcEdit;
    Label10: TLabel;
    edPadraoValor: TJvCalcEdit;
    EdtNomeComprador: TJvEdit;
    Label11: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure lcbPadraoRazaoXKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lcbPadraoMotivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox2XKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtBrincoButtonClick(Sender: TObject);
    procedure edtBrincoChange(Sender: TObject);
    procedure edtBrincoEnter(Sender: TObject);
    procedure edtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure deDataKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FBrinco       : string ;
    Zoo_DescartesDatamodule : TZoo_DescartesDatamodule ;
    procedure RemoveEvento ;
    function SearchAnimalFemea ( TextToSearch : string) : boolean ;
    procedure AddByKey ( AKey : String ) ;
    procedure AddBrinco ;
    procedure ValidateCamposFixo;
    procedure UpdateEdtBrinco ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;


implementation

{$R *.dfm}

Uses SearchsZootecnico, Exceptions, CL.Ag5.NSMsgs ;

{ TfrmCustomWizard }

procedure TZoo_DescartesWizard.AddBrinco;
begin
   ValidateCamposFixo;

   try
    if ( Trim ( edtBrinco.Text ) <> '' ) and Zoo_DescartesDatamodule.AddBrinco( FBrinco, deDataPadrao.Date, edPadraoValor.Value, edtNomeComprador.Text ) then
      begin
        UpdateEdtBrinco ;
       // deData.SetFocus ;
        exit ;
      end ;

    if SearchAnimalFemea ( FBrinco ) then
      begin
        edtBrinco.SetFocus ;
        edtBrinco.SelectAll ;
      end
    else
       raise Warning.Create('Animal não encontrado');
  except
     edtBrinco.setFocus ;
     edtBrinco.SelectAll ;
     raise ;
  end ;

end;


procedure TZoo_DescartesWizard.AddByKey(AKey: String);
begin
  if Zoo_DescartesDatamodule.LocateBrinco( FBrinco ) then
     exit ;

  ValidateCamposFixo;

  //***---if Zoo_DescartesDatamodule.AddByKey ( AKey, deDataPadrao.Date, edPadraoValor.Value ) then
  //***---   deData.SetFocus
  Zoo_DescartesDatamodule.AddByKey ( AKey, deDataPadrao.Date, edPadraoValor.Value, edtNomeComprador.Text )
end;

procedure TZoo_DescartesWizard.BitBtn2Click(Sender: TObject);
begin
  inherited;
  RemoveEvento ;
end;

constructor TZoo_DescartesWizard.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;
   Zoo_DescartesDatamodule := TZoo_DescartesDatamodule.Create ( self ) ;
   dtsDescartes.DataSet := Zoo_DescartesDatamodule.cdsDescartes ;
   dtsTipoRazaoDescartePadrao.DataSet := Zoo_DescartesDatamodule.cdsTipoRazaoDescartePadrao ;
   dtsTipoMotivoDescartePadrao.DataSet := Zoo_DescartesDatamodule.cdsTipoMotivoDescartePadrao ;
   Zoo_DescartesDatamodule.OpenTables ;
//   lcbPadraoRazao.KeyValue := Zoo_DescartesDatamodule.cdsTipoRazaoDescartePadraoVALOR.Value ;
   lcbPadraoMotivo.KeyValue := Zoo_DescartesDatamodule.cdsTipoMotivoDescartePadraoVALOR.Value ;
end;

procedure TZoo_DescartesWizard.lcbPadraoMotivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_DescartesWizard.DBLookupComboBox2XKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_DescartesWizard.DBLookupComboBox3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_DescartesWizard.deDataKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      edtBrinco.SetFocus ;
    end;

end;

procedure TZoo_DescartesWizard.edtBrincoButtonClick(Sender: TObject);
begin
  inherited;
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_DescartesWizard.edtBrincoChange(Sender: TObject);
begin
  if edtBrinco.Text = Zoo_DescartesDatamodule.cdsDescartesBRINCO.asString then
     edtBrinco.Font.Color := clNavy
  else
     edtBrinco.Font.Color := clRed ;
end;

procedure TZoo_DescartesWizard.edtBrincoEnter(Sender: TObject);
begin
  edtBrinco.SelectAll ;
end;

procedure TZoo_DescartesWizard.edtBrincoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    begin
     Zoo_DescartesDatamodule.cdsDescartes.Prior ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_DescartesDatamodule.cdsDescartes.Next ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end ;
end;

procedure TZoo_DescartesWizard.edtBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Zoo_DescartesDatamodule.cdsDescartes.State in [dsInsert,dsEdit] then
     Zoo_DescartesDatamodule.cdsDescartes.Post ;

  if ( Key = #13  ) then
    begin
      Key := #0 ;
      //if ( Trim ( edtBrinco.Text ) = '' ) then
      //  exit ;

      if ( Trim ( edtBrinco.Text ) <> '' ) and ( edtBrinco.Text = Zoo_DescartesDatamodule.cdsDescartesBRINCO.asString ) then
       begin
         deData.SetFocus ;
         exit ;
       end ;

      FBrinco := edtBrinco.Text ;
      AddBrinco ;
    end;
end;

class function TZoo_DescartesWizard.Execute : boolean;
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

procedure TZoo_DescartesWizard.JvDBUltimGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_DescartesWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TZoo_DescartesWizard.lcbPadraoRazaoXKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_DescartesWizard.RemoveEvento;
begin
   Zoo_DescartesDataModule.RemoveEvento ;
end;

function TZoo_DescartesWizard.SearchAnimalFemea(TextToSearch: string): boolean;
var
  lFound : boolean ;
begin
    lFound := False ;
    with TSearchFemeaAtivo.Create do
       try
          TextToFind := FBrinco ;
          FBrinco := '' ;
          //TextToFind := TextToSearch ;
          //TextToFind := '' ;
          lFound := Execute ;
          if lFound then
             begin
               FBrinco                := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Font.Color   := clNavy ;
               AddByKey ( Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString ) ;
             end ;
       finally
          SearchAnimalFemea := lFound ;
          free ;
       end ;
end;

procedure TZoo_DescartesWizard.UpdateEdtBrinco;
begin
  edtBrinco.text := Zoo_DescartesDatamodule.cdsDescartesBRINCO.asString ;
  edtBrinco.Font.color := clNavy ;
  FBrinco := Zoo_DescartesDatamodule.cdsDescartesBRINCO.asString ;
end;

procedure TZoo_DescartesWizard.ValidateCamposFixo;
var
  ErrMsg : string ;
  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  ErrMsg := '' ;

  if ( deDataPadrao.date = 0 ) {or ( deData.date < ( date - 30  ) )} then
     AddErr ( 'Data - em branco' ) ;
     //     AddErr ( 'Data - em branco / inferior a 30 dias' ) ;

  if ( deDataPadrao.date >  date ) then
     AddErr ( 'Data - superior a data atual' ) ;

  {****----
  if  VarIsEmpty ( lcbPadraoMotivo.KeyValue )
   or VarIsNull ( lcbPadraoMotivo.KeyValue )
   or  (  lcbPadraoMotivo.KeyValue = '' ) then
     AddErr ( 'Motivo de descarte - em branco' ) ;
           }
  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos na entrada padrão'#13#10#13#10 + ErrMsg );

end;

procedure TZoo_DescartesWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_DescartesDatamodule.ApplyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_Descartes.CreateAndDispatch( self ) ; ;
  inherited;
end;

procedure TZoo_DescartesWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  not Zoo_DescartesDatamodule.cdsDescartes.IsEmpty ;
//  DBLookupComboBox2.ReadOnly := not _actExecute.Enabled ;
  deData.ReadOnly            := not _actExecute.Enabled ;
  DBLookupComboBox3.ReadOnly := not _actExecute.Enabled ;
  edValor.ReadOnly           := not _actExecute.Enabled ;
  DBEdit1.ReadOnly           := not _actExecute.Enabled ;
end;

procedure TZoo_DescartesWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_DescartesWizard._actPriorExecute(Sender: TObject);
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
  RegisterClass ( TZoo_DescartesWizard ) ;

end.



