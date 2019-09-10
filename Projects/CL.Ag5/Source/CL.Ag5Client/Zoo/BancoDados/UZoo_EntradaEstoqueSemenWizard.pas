unit UZoo_EntradaEstoqueSemenWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, VCL.Mask, JvExMask, JvToolEdit, Data.DB, Tc.Data.DB.Helpers, VCL.DBCtrls,
  UZoo_EntradaEstoqueSemenDatamodule, JvBaseEdits, JvDBControls, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, Tc.VCL.Application, Tc.VCL.Controls.GDIButton,
  UZoo_EntradaDadosBaseWizard, SysFormWizard, System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_EntradaEstoqueSemenWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtBrinco: TJvComboEdit;
    BitBtn2: TTcGDIButton;
    Label7: TLabel;
    Label8: TLabel;
    edValor: TJvDBCalcEdit;
    Label9: TLabel;
    dtsEstoqueSemen: TDataSource;
    deData: TTcDateEdit;
    gdeData: TTcDBDateEdit;
    calcValor: TJvDBCalcEdit;
    dbDoses: TJvDBCalcEdit;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edtBrincoButtonClick(Sender: TObject);
    procedure edtBrincoChange(Sender: TObject);
    procedure edtBrincoEnter(Sender: TObject);
    procedure edtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure dbDosesKeyPress(Sender: TObject; var Key: Char);
    procedure dbDosesEnter(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure edValorEnter(Sender: TObject);
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure dtsEstoqueSemenDataChange(Sender: TObject; Field: TField);
    procedure _actExecuteExecute(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure dbDosesExit(Sender: TObject);
  private
    { Private declarations }
    FBrinco : string ;
    Zoo_EntradaEstoqueSemenDatamodule : TZoo_EntradaEstoqueSemenDatamodule ;
    procedure RemoveCompra ;
    procedure AddBrinco ;
    procedure ValidateCamposFixo;
    procedure UpdateEdtBrinco ;
    function SearchSemen ( TextToSearch : string) : boolean ;
    procedure AddByKey ( AKey : String ) ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

Uses SearchsZootecnico, Exceptions ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_EntradaEstoqueSemenWizard.AddBrinco;
begin
   ValidateCamposFixo;

   try
    if ( Trim ( edtBrinco.Text ) <> '' ) and Zoo_EntradaEstoqueSemenDatamodule.AddBrinco( FBrinco, deData.Date ) then
      begin
        UpdateEdtBrinco ;
        dbDoses.SetFocus ;
        exit ;
      end ;

    if SearchSemen ( FBrinco ) then
        dbDoses.SetFocus
    else
       raise Warning.Create('Sêmen não encontrado');
  except
     edtBrinco.setFocus ;
     edtBrinco.SelectAll ;
     raise ;
  end ;
end;

procedure TZoo_EntradaEstoqueSemenWizard.AddByKey(AKey: String);
begin
  if Zoo_EntradaEstoqueSemenDatamodule.LocateBrinco( FBrinco ) then
     exit ;

  ValidateCamposFixo;
//  if Zoo_EntradaEstoqueSemenDatamodule.AddByKey ( AKey, deData.Date ) then
//     deData.SetFocus
  Zoo_EntradaEstoqueSemenDatamodule.AddByKey ( AKey, deData.Date )
end;

procedure TZoo_EntradaEstoqueSemenWizard.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Zoo_EntradaEstoqueSemenDatamodule.RemoveCompra ;
end;

constructor TZoo_EntradaEstoqueSemenWizard.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;
  Zoo_EntradaEstoqueSemenDatamodule := TZoo_EntradaEstoqueSemenDatamodule.Create ( self ) ;
  Zoo_EntradaEstoqueSemenDatamodule.OpenTables ;
  dtsEstoqueSemen.DataSet := Zoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemen ;
  deData.Date := Date;
end;

procedure TZoo_EntradaEstoqueSemenWizard.dbDosesEnter(Sender: TObject);
begin
//  inherited;
  dbDoses.SelectAll;
end;

procedure TZoo_EntradaEstoqueSemenWizard.dbDosesExit(Sender: TObject);
begin
  inherited;
  if Self.Text = EmptyStr then
    raise Warning.Create('Necessário digitar a quantidade de dose');
end;

procedure TZoo_EntradaEstoqueSemenWizard.dbDosesKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      if edValor.Visible then
         edValor.SetFocus
      else
         edtBrinco.SetFocus ;
    end;
end;

destructor TZoo_EntradaEstoqueSemenWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TZoo_EntradaEstoqueSemenWizard.dtsEstoqueSemenDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  with Zoo_EntradaEstoqueSemenDatamodule, cdsEstoqueSemen do
    begin
      dtsEstoqueSemen.AutoEdit := not ( bof and eof ) ;

      if (not Assigned ( Field ) or ( Field = cdsEstoqueSemenBRINCO) ) and (edtBrinco.text <>  cdsEstoqueSemenBRINCO.asString) then
         updateEdtBrinco ;

    end ;
end;

procedure TZoo_EntradaEstoqueSemenWizard.edtBrincoButtonClick(Sender: TObject);
begin
  inherited;
  SearchSemen ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_EntradaEstoqueSemenWizard.edtBrincoChange(Sender: TObject);
begin
  inherited;
  if edtBrinco.Text = Zoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemenBRINCO.asString then
     edtBrinco.Font.Color := clNavy
  else
     edtBrinco.Font.Color := clRed ;
end;

procedure TZoo_EntradaEstoqueSemenWizard.edtBrincoEnter(Sender: TObject);
begin
  inherited;
  edtBrinco.SelectAll ;
end;

procedure TZoo_EntradaEstoqueSemenWizard.edtBrincoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_up then
    begin
     Zoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemen.Prior ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemen.Next ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end ;
end;

procedure TZoo_EntradaEstoqueSemenWizard.edtBrincoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Zoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemen.State in [dsInsert,dsEdit] then
     Zoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemen.Post ;

  if ( Key = #13  ) then
    begin
      Key := #0 ;
      //if ( Trim ( edtBrinco.Text ) = '' ) then
      //  exit ;

      if ( Trim ( edtBrinco.Text ) <> '' ) and ( edtBrinco.Text = Zoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemenBRINCO.asString ) then
       begin
         dbDoses.SetFocus ;
         exit ;
       end ;

      FBrinco := edtBrinco.Text ;
      AddBrinco ;
    end;
end;

procedure TZoo_EntradaEstoqueSemenWizard.edValorEnter(Sender: TObject);
begin
//  inherited;
  edValor.SelectAll;
end;

procedure TZoo_EntradaEstoqueSemenWizard.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      edtBrinco.SetFocus ;
    end;
end;

class function TZoo_EntradaEstoqueSemenWizard.Execute : boolean;
var
  ThisForm: TZoo_EntradaEstoqueSemenWizard ;
begin
  ThisForm := TZoo_EntradaEstoqueSemenWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_EntradaEstoqueSemenWizard.JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key =  VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_EntradaEstoqueSemenWizard.JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key <> #13 ) then
    exit ;

   if (  Screen.ActiveControl = JvDBUltimGrid1 ) then
      Key := #0 ;

   with (JvDBUltimGrid1) do
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


procedure TZoo_EntradaEstoqueSemenWizard.RemoveCompra;
begin
   Zoo_EntradaEstoqueSemenDataModule.RemoveCompra ;
end;

function TZoo_EntradaEstoqueSemenWizard.SearchSemen(TextToSearch: string): boolean;
var
  lFound : boolean ;
begin
    lFound := False ;
    with TSearchSemenAtivo.Create do
       try
          FBrinco := '' ;
          //TextToFind := TextToSearch ;
          TextToFind := '' ;
          lFound := Execute ;
          if lFound then
             begin
               FBrinco                := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Font.Color   := clNavy ;
               AddByKey ( Result.FieldByName( 'KZOO_ANIMAL_MACHO' ).asString ) ;
             end ;
       finally
          SearchSemen := lFound ;
          free ;
       end ;
end;


procedure TZoo_EntradaEstoqueSemenWizard.UpdateEdtBrinco;
begin
  edtBrinco.text := Zoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemenBRINCO.asString ;
  edtBrinco.Font.color := clNavy ;
  FBrinco := Zoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemenBRINCO.asString ;
end;

procedure TZoo_EntradaEstoqueSemenWizard.ValidateCamposFixo;
var
  ErrMsg : string ;
  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  ErrMsg := '' ;
  if ( deData.date = 0 ) then
     AddErr ( 'Data - em branco' ) ;

  if ( deData.date >  date ) then
     AddErr ( 'Data - superior a data atual' ) ;

  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos na entrada padrão'#13#10#13#10 + ErrMsg );
end;

procedure TZoo_EntradaEstoqueSemenWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_EntradaEstoqueSemenDatamodule.ApplyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_EstoqueSemen.CreateAndDispatch( self ) ; ;
  inherited;
end;

procedure TZoo_EntradaEstoqueSemenWizard._actExecuteUpdate(Sender: TObject);
var
   ActionEnabled : boolean ;
begin
  ActionEnabled := False ;
  try

    with Zoo_EntradaEstoqueSemenDatamodule do
      ActionEnabled := ( (not cdsEstoqueSemen.IsEmpty) and (cdsEstoqueSemen.ChangeCount > 0)
                          or (not cdsEstoqueSemenDOSES.IsNull ) ) ;

  except
  end;
  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  ActionEnabled ;
end;

procedure TZoo_EntradaEstoqueSemenWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_EntradaEstoqueSemenWizard._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TZoo_EntradaEstoqueSemenWizard ) ;
end.
