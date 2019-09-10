unit UZoo_SanidadeCMTWizard;


interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, VCL.Mask, VCL.DBCtrls, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UZoo_SanidadeCMTDatamodule, Data.DB, Tc.Data.DB.Helpers, JvExExtCtrls, JvExtComponent, JvPanel,
  JvBaseEdits, JvDBControls, JvExMask, JvToolEdit, JvImage,
  JvExStdCtrls, JvCombobox, JvDBCombobox, Tc.VCL.Edits.DBControls,
  Tc.VCL.Application,
  Tc.VCL.Edits, UZoo_EntradaDadosBaseWizard,
  Tc.VCL.Controls.GDIButton, System.Actions,
  CL.Ag5.NSMsgs,
  Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_SanidadeCMTWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsCMT: TDataSource;
    JvDBDateEdit1: TTcDBDateEdit;
    JvDBCalcEdit1: TJvDBCalcEdit;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    deData: TTcDateEdit;
    Label3: TLabel;
    edNomeFuncionario: TJvComboEdit;
    Panel2: TPanel;
    BitBtn2: TTcGDIButton;
    Label4: TLabel;
    edtBrinco: TEdit;
    Label10: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dblcAE: TDBLookupComboBox;
    dblcAD: TDBLookupComboBox;
    dblcPE: TDBLookupComboBox;
    dblcPD: TDBLookupComboBox;
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
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure dtsCMTDataChange(Sender: TObject; Field: TField);
    procedure edtBrincoEnter(Sender: TObject);
    procedure dblcAEKeyPress(Sender: TObject; var Key: Char);
    procedure dblcADKeyPress(Sender: TObject; var Key: Char);
    procedure dblcPEKeyPress(Sender: TObject; var Key: Char);
    procedure dblcPDKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1EditButtonClick(Sender: TObject);
    procedure dblcAEEnter(Sender: TObject);
    procedure dblcADEnter(Sender: TObject);
    procedure dblcPEEnter(Sender: TObject);
    procedure dblcPDEnter(Sender: TObject);
  private
    { Private declarations }
    FKFuncionario : string ;
    Zoo_SanidadeCMTDatamodule : TZoo_SanidadeCMTDatamodule ;
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

procedure TZoo_SanidadeCMTWizard.BitBtn2Click(Sender: TObject);
begin
  Zoo_SanidadeCMTDatamodule.RemoveRecord ;
end;

constructor TZoo_SanidadeCMTWizard.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;
   Zoo_SanidadeCMTDatamodule := TZoo_SanidadeCMTDatamodule.Create ( self ) ;
   Zoo_SanidadeCMTDatamodule.OpenTables ;
   dtsCMT.DataSet := Zoo_SanidadeCMTDatamodule.cdsCMT ;
end;

procedure TZoo_SanidadeCMTWizard.dblcADEnter(Sender: TObject);
begin
  inherited;
  dblcAD.DropDown ;
end;

procedure TZoo_SanidadeCMTWizard.dblcADKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #13 ) and not ( dblcAD.ListVisible ) then
    begin
      Key := #0 ;
      dblcPE.SetFocus ;
    end;

end;

procedure TZoo_SanidadeCMTWizard.dblcAEEnter(Sender: TObject);
begin
  inherited;
   dblcAE.dropDown ;
end;

procedure TZoo_SanidadeCMTWizard.dblcAEKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #13 ) and not ( dblcAE.ListVisible ) then
    begin
      Key := #0 ;
      dblcAD.SetFocus ;
    end;
end;

procedure TZoo_SanidadeCMTWizard.dblcPDEnter(Sender: TObject);
begin
  inherited;
   dblcPD.dropDown ;
end;

procedure TZoo_SanidadeCMTWizard.dblcPDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #13 ) and not ( dblcPD.ListVisible ) then
    begin
      Key := #0 ;
      edtBrinco.SetFocus ;
    end;
end;

procedure TZoo_SanidadeCMTWizard.dblcPEEnter(Sender: TObject);
begin
  inherited;
   dblcPE.dropDown ;
end;

procedure TZoo_SanidadeCMTWizard.dblcPEKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #13 ) and not ( dblcPE.ListVisible ) then
    begin
      Key := #0 ;
      dblcPD.SetFocus ;
    end;
end;

procedure TZoo_SanidadeCMTWizard.dtsCMTDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  with Zoo_SanidadeCMTDatamodule, cdsCMT do
     dtsCMT.AutoEdit := not ( bof and eof ) ;
end;

class function TZoo_SanidadeCMTWizard.Execute : boolean;
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

procedure TZoo_SanidadeCMTWizard.JvDBUltimGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  with Zoo_SanidadeCMTDatamodule, JvDBUltimGrid1 do
     if ( SelectedField = cdsCMTNOMEFUNCIONARIO ) then
          self.SetFuncionario ( InplaceEditor.Text ) ;
end;

procedure TZoo_SanidadeCMTWizard.JvDBUltimGrid1Enter(Sender: TObject);
begin
  inherited;
  JvDBUltimGrid1.SelectedField := Zoo_SanidadeCMTDatamodule.cdsCMTAD ;
end;

procedure TZoo_SanidadeCMTWizard.JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key =  VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_SanidadeCMTWizard.JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key <> #13 ) then
    exit ;

  with Zoo_SanidadeCMTDatamodule, JvDBUltimGrid1 do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsCMTNOMEFUNCIONARIO ) then
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

procedure TZoo_SanidadeCMTWizard.JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TZoo_SanidadeCMTWizard.SearchFuncionario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edNomeFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               FKFuncionario          := Result.FieldByName( 'KCAD_ENTIDADE' ).asString ;
               edNomeFuncionario.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;
end;

procedure TZoo_SanidadeCMTWizard.SetFuncionario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
//               edFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               Zoo_SanidadeCMTDatamodule.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;

end;

procedure TZoo_SanidadeCMTWizard.ValidateCamposFixo;
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

procedure TZoo_SanidadeCMTWizard.AddBrinco;
begin
  ValidateCamposFixo;
  Zoo_SanidadeCMTDatamodule.AddBrinco ( edtBrinco.Text, deData.Date, FKFuncionario, edNomeFuncionario.Text  ) ;
  dblcAE.SetFocus ;
//  edtBrinco.setFocus ;
//  edtBrinco.SelectAll ;
end;


procedure TZoo_SanidadeCMTWizard.edNomeFuncionarioButtonClick(Sender: TObject);
begin
  inherited;
  SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeCMTWizard.edNomeFuncionarioChange(Sender: TObject);
begin
  inherited;
  FKFuncionario := '' ;
  edNomeFuncionario.Font.Color := clRed ;
end;

procedure TZoo_SanidadeCMTWizard.edNomeFuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
    end ;
end;

procedure TZoo_SanidadeCMTWizard.edtBrincoEnter(Sender: TObject);
begin
  edtBrinco.SelectAll
end;

procedure TZoo_SanidadeCMTWizard.edtBrincoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Zoo_SanidadeCMTDatamodule.cdsCMT.State in [dsInsert,dsEdit] then
     Zoo_SanidadeCMTDatamodule.cdsCMT.Post ;
  if ( Key = #13  ) then
    begin
      Key := #0 ;
      AddBrinco ;
    end;
end;


procedure TZoo_SanidadeCMTWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_SanidadeCMTDatamodule.ApplyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_CMT.CreateAndDispatch( self ) ; ;
  inherited;
end;

procedure TZoo_SanidadeCMTWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  Try
    _actExecute.Enabled :=( Application.LicenseState <> lsReadOnly ) and not Zoo_SanidadeCMTDatamodule.cdsCMT.IsEmpty ;
  except
  End;
end;

procedure TZoo_SanidadeCMTWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_SanidadeCMTWizard._actPriorExecute(Sender: TObject);
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


