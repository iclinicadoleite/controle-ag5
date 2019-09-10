unit UZoo_SanidadeCondicaoCorporalWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, VCL.Mask, VCL.DBCtrls, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UZoo_SanidadeCondicaoCorporalDatamodule, Data.DB, Tc.Data.DB.Helpers, JvExExtCtrls, JvExtComponent,
  JvPanel, JvBaseEdits, JvDBControls, JvExMask, JvToolEdit, JvImage,
  Tc.VCL.Application,
  Tc.VCL.Edits.DBControls, Tc.VCL.Edits, UZoo_EntradaDadosBaseWizard,
  Tc.VCL.Controls.GDIButton, System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_SanidadeCondicaoCorporalWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    DataSource1: TDataSource;
    JvDBDateEdit1: TTcDBDateEdit;
    JvDBCalcEdit1: TJvDBCalcEdit;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    deData: TTcDateEdit;
    Label3: TLabel;
    edNomeFuncionario: TJvComboEdit;
    Panel2: TPanel;
    edtBrinco: TEdit;
    Label2: TLabel;
    edtCC: TJvDBCalcEdit;
    Label4: TLabel;
    BitBtn2: TTcGDIButton;
    Label5: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure JvDBUltimGrid1Enter(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure edNomeFuncionarioButtonClick(Sender: TObject);
    procedure edNomeFuncionarioChange(Sender: TObject);
    procedure edNomeFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtCCKeyPress(Sender: TObject; var Key: Char);
    procedure edtBrincoEnter(Sender: TObject);
    procedure JvDBUltimGrid1EditButtonClick(Sender: TObject);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FKFuncionario : string ;
    Zoo_SanidadeCondicaoCorporalDatamodule : TZoo_SanidadeCondicaoCorporalDatamodule ;
    procedure AddBrinco ;
    procedure ValidateCamposFixo ;
    procedure SearchFuncionario ( TextToSearch : string);
    procedure SetFuncionario ( TextToSearch : string);
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;


implementation

uses SearchsZootecnico, Exceptions ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_SanidadeCondicaoCorporalWizard.AddBrinco;
begin
  ValidateCamposFixo;
  try
    Zoo_SanidadeCondicaoCorporalDatamodule.AddBrinco ( edtBrinco.Text, deData.Date, FKFuncionario, edNomeFuncionario.Text ) ;
    edtCC.SetFocus ;
  except
     edtBrinco.SelectAll ;
     raise ;
  end;
end;


procedure TZoo_SanidadeCondicaoCorporalWizard.BitBtn2Click(Sender: TObject);
begin
  Zoo_SanidadeCondicaoCorporalDatamodule.RemoveRecord ;
end;

constructor TZoo_SanidadeCondicaoCorporalWizard.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;
   Zoo_SanidadeCondicaoCorporalDatamodule := TZoo_SanidadeCondicaoCorporalDatamodule.Create ( self ) ;
   Zoo_SanidadeCondicaoCorporalDatamodule.OpenTables ;
   DataSource1.DataSet := Zoo_SanidadeCondicaoCorporalDatamodule.cdsCC ;
end;


procedure TZoo_SanidadeCondicaoCorporalWizard.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with Zoo_SanidadeCondicaoCorporalDatamodule, cdsCC do
     DataSource1.AutoEdit := not ( bof and eof ) ;
end;

class function TZoo_SanidadeCondicaoCorporalWizard.Execute : boolean;
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


procedure TZoo_SanidadeCondicaoCorporalWizard.edtCCKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
        Key := #0 ;
        edtBrinco.SetFocus ;
    end;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard.JvDBUltimGrid1EditButtonClick(
  Sender: TObject);
begin
   with Zoo_SanidadeCondicaoCorporalDatamodule, JvDBUltimGrid1 do
       if ( SelectedField = cdsCCNOMEFUNCIONARIO ) then
            self.SetFuncionario ( InplaceEditor.Text ) ;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard.JvDBUltimGrid1Enter(Sender: TObject);
begin
  inherited;
  JvDBUltimGrid1.SelectedField := Zoo_SanidadeCondicaoCorporalDatamodule.cdsCCDATA ;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard.JvDBUltimGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key =  VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard.JvDBUltimGrid1KeyPress(Sender: TObject;
  var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key <> #13 ) then
    exit ;

  with Zoo_SanidadeCondicaoCorporalDatamodule, JvDBUltimGrid1 do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsCCNOMEFUNCIONARIO ) then
         begin
            self.SetFUNCIONARIO ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;


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

procedure TZoo_SanidadeCondicaoCorporalWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard.SearchFuncionario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edNomeFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               FKFuncionario           := Result.FieldByName( 'KCAD_ENTIDADE' ).asString ;
               edNomeFuncionario.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard.SetFuncionario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
//               edFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               Zoo_SanidadeCondicaoCorporalDatamodule.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;

end;

procedure TZoo_SanidadeCondicaoCorporalWizard.ValidateCamposFixo;
var
  ErrMsg : string ;
  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  ErrMsg := '' ;
(*
  if ( deData.date = 0 ) or ( deData.date < ( date - 30  ) ) then
     AddErr ( 'Data - em branco / inferior a 30 dias' ) ;
*)
  if ( deData.date = 0 ) then
     AddErr ( 'Data - em branco' ) ;

  if ( deData.date >  date ) then
     AddErr ( 'Data - superior a data atual' ) ;

  if FKFuncionario = '' then
     AddErr ( 'Funcionário' ) ;

  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos na entrada padrão'#13#10#13#10 + ErrMsg );
end;

procedure TZoo_SanidadeCondicaoCorporalWizard.edNomeFuncionarioButtonClick(
  Sender: TObject);
begin
  inherited;
  SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard.edNomeFuncionarioChange(Sender: TObject);
begin
  inherited;
  FKFuncionario := '' ;
  edNomeFuncionario.Font.Color := clRed ;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard.edNomeFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
    end ;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard.edtBrincoEnter(Sender: TObject);
begin
  edtBrinco.SelectAll ;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard.edtBrincoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Zoo_SanidadeCondicaoCorporalDatamodule.cdsCC.State in [dsInsert,dsEdit] then
     Zoo_SanidadeCondicaoCorporalDatamodule.cdsCC.Post ;

  if ( Key = #13  ) then
    begin
      Key := #0 ;
      AddBrinco ;
    end;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_SanidadeCondicaoCorporalDatamodule.ApplyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_CC.CreateAndDispatch( self ) ; ;
  inherited;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  Try
    _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and not Zoo_SanidadeCondicaoCorporalDatamodule.cdsCC.IsEmpty ;
  except
  End;
end;

procedure TZoo_SanidadeCondicaoCorporalWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_SanidadeCondicaoCorporalWizard._actPriorExecute(Sender: TObject);
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


