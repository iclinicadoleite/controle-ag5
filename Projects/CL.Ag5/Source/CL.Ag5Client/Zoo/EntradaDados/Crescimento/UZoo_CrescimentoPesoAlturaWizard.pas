unit UZoo_CrescimentoPesoAlturaWizard;

{ DONE -oCaique -cDados do Periodo / Crescimento : - Acertar tela para abrir em aba }
{ TODO -oCaique -cDados do Periodo / Crescimento : - pesquisa de animais }
{ TODO -oCaique -cDados do Periodo / Crescimento : - checar tabelas }
{ TODO -oCaique -cDados do Periodo / Crescimento : - Acertar campos da grid }
{ DONE -oCaique -cDados do Periodo / Crescimento : - Alterar Barra de Título }
{ DONE -oCaique -cDados do Periodo / Crescimento : - Alterar Posição Titulo }
{ DONE -oCaique -cDados do Periodo / Crescimento : - Incluir Botão fechar }

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, VCL.Mask, VCL.DBCtrls, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, JvExExtCtrls, JvExtComponent, JvPanel,
  JvBaseEdits, JvDBControls, JvExMask, JvToolEdit,
  UZoo_CrescimentoPesoAlturaDatamodule, JvImage, Tc.VCL.Edits.DBControls, Tc.VCL.Edits,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, Tc.VCL.Controls.GDIButton,
  CL.AG5.NSMsgs, System.Actions, Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_CrescimentoPesoAlturaWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsPesoAltura: TDataSource;
    GroupBox1: TGroupBox;
    cbxDigitarPeso: TCheckBox;
    cbxDigitarAltura: TCheckBox;
    Label3: TLabel;
    deDataPadrao: TTcDateEdit;
    mmObs: TDBMemo;
    gdeData: TTcDBDateEdit;
    Label2: TLabel;
    edtBrinco: TJvComboEdit;
    Panel3: TPanel;
    pnlPeso: TPanel;
    lblPeso: TLabel;
    edPeso: TJvDBCalcEdit;
    pnlAltura: TPanel;
    lblAltura: TLabel;
    edAltura: TJvDBCalcEdit;
    BitBtn2: TTcGDIButton;
    btnImportarPesagens: TTcGDIButton;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure JvDBUltimGrid1Enter(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure edPesoKeyPress(Sender: TObject; var Key: Char);
    procedure edAlturaKeyPress(Sender: TObject; var Key: Char);
    procedure cbxDigitarAlturaClick(Sender: TObject);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure edtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBrincoEnter(Sender: TObject);
    procedure edtBrincoChange(Sender: TObject);
    procedure edtBrincoButtonClick(Sender: TObject);
    procedure cbxDigitarPesoClick(Sender: TObject);
    procedure dtsPesoAlturaDataChange(Sender: TObject; Field: TField);
    procedure edPesoEnter(Sender: TObject);
    procedure edAlturaEnter(Sender: TObject);
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure btnImportarPesagensClick(Sender: TObject);
  private
    { Private declarations }
    Zoo_CrescimentoPesoAlturaDatamodule : TZoo_CrescimentoPesoAlturaDatamodule ;
    FBrinco       : string ;
    procedure AddBrinco ;
    procedure ValidateCamposFixo;
    procedure UpdateEdtBrinco ;
    function SearchAnimalFemea ( TextToSearch : string) : boolean ;
    procedure AddByKey ( AKey : String ) ;
    procedure UpdateControls ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; reintroduce ; // overload ;
  end;


implementation

Uses SearchsZootecnico, Exceptions , UZoo_ImportaPesoAlturaWizard, UMessagePrintDialog;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_CrescimentoPesoAlturaWizard.AddBrinco;
begin
   ValidateCamposFixo;

   try
    if ( Trim ( edtBrinco.Text ) <> '' ) and Zoo_CrescimentoPesoAlturaDatamodule.AddBrinco( FBrinco, deDataPadrao.Date ) then
      begin
        UpdateEdtBrinco ;
        if edPeso.Visible then
           edPeso.SetFocus
        else if edAltura.Visible then
           edAltura.SetFocus ;
        exit ;
      end ;

    if SearchAnimalFemea ( FBrinco ) then
      begin
        if edPeso.Visible then
           edPeso.SetFocus
        else if edAltura.Visible then
           edAltura.SetFocus  ;
      end
    else
       raise Warning.Create('Animal não encontrado');
  except
     edtBrinco.setFocus ;
     edtBrinco.SelectAll ;
     raise ;
  end ;

end;


procedure TZoo_CrescimentoPesoAlturaWizard.AddByKey(AKey: String);
begin
  if Zoo_CrescimentoPesoAlturaDatamodule.LocateBrinco( FBrinco ) then
     exit ;

  ValidateCamposFixo;


  if Zoo_CrescimentoPesoAlturaDatamodule.AddByKey ( AKey, deDataPadrao.Date ) then
   begin
        if edPeso.Visible then
           edPeso.SetFocus
        else if edAltura.Visible then
           edAltura.SetFocus
   end;
end;


procedure TZoo_CrescimentoPesoAlturaWizard.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Zoo_CrescimentoPesoAlturaDatamodule.RemoveRecord ;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.btnImportarPesagensClick(
  Sender: TObject);
var
  FileName : string ;
  LErrs : string ;
begin
  if deDataPadrao.Date = 0 then
    begin
      showMessage ( 'Informe a data da pesagem' ) ;
      exit ;
    end;

  LErrs := '' ;
  if TZoo_ImportaPesoAlturaWizard.Execute ( FileName  ) then
   begin
      Zoo_CrescimentoPesoAlturaDatamodule.ImportFromXLS ( FileName, deDataPadrao.Date, LErrs ) ;
      if LErrs = '' then
         MessageDlg  ( Format ( 'Importação concluída.'#13#10#13#10'Arquivo :"%s"'#13#10'Total de Pesagens importadas: %d',
            [  FileName, Zoo_CrescimentoPesoAlturaDatamodule.CountDadosImportados ] ) )
      else
        TMessagePrintDialog.Execute ( 'Informações de pesagens não importadas', LErrs )
   end;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.cbxDigitarPesoClick(Sender: TObject);
begin
  UpdateControls ;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.cbxDigitarAlturaClick(Sender: TObject);
begin
   UpdateControls ;
end;


constructor TZoo_CrescimentoPesoAlturaWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;
   Zoo_CrescimentoPesoAlturaDatamodule := TZoo_CrescimentoPesoAlturaDatamodule.Create ( self ) ;
   Zoo_CrescimentoPesoAlturaDatamodule.OpenTables ;
   dtsPesoAltura.DataSet := Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAltura ;
   UpdateControls ;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.dtsPesoAlturaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with Zoo_CrescimentoPesoAlturaDatamodule, cdsPesoAltura do
    begin
      dtsPesoAltura.AutoEdit := not ( bof and eof ) ;
      cbxDigitarPeso.Enabled := ( bof and eof ) ;
      cbxDigitarAltura.Enabled := ( bof and eof ) ;

      if (not Assigned ( Field ) or ( Field = cdsPesoAlturaBRINCO) ) and (edtBrinco.text <>  cdsPesoAlturaBRINCO.asString) then
         updateEdtBrinco ;
      UpdateControls ;
    end ;
end;

class function TZoo_CrescimentoPesoAlturaWizard.Execute : boolean;
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

procedure TZoo_CrescimentoPesoAlturaWizard.edAlturaEnter(Sender: TObject);
begin
  inherited;
  edAltura.SelectAll ;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.edAlturaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
    begin
      Key := #0 ;
      edtBrinco.SetFocus ;
    end;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.edPesoEnter(Sender: TObject);
begin
  inherited;
  edPeso.SelectAll ;

end;

procedure TZoo_CrescimentoPesoAlturaWizard.edPesoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      if edAltura.Visible then
         edAltura.SetFocus
      else
         edtBrinco.SetFocus ;
    end;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.JvDBUltimGrid1Enter(Sender: TObject);
begin
  inherited;
  JvDBUltimGrid1.SelectedField := Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaDATA ;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.JvDBUltimGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key =  VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.JvDBUltimGrid1KeyPress(Sender: TObject;
  var Key: Char);
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

procedure TZoo_CrescimentoPesoAlturaWizard.JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

function TZoo_CrescimentoPesoAlturaWizard.SearchAnimalFemea(TextToSearch: string): boolean;
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

procedure TZoo_CrescimentoPesoAlturaWizard.UpdateControls;
var
  i : integer ;
begin

  edPeso.Visible := cbxDigitarPeso.Checked ;
  edAltura.Visible := cbxDigitarAltura.Checked ;

  Zoo_CrescimentoPesoAlturaDatamodule.SetPesoAltura ( cbxDigitarPeso.Checked, cbxDigitarAltura.Checked ) ;

  if not edPeso.Visible then
    begin
      pnlPeso.AutoSize := False ;
      pnlPeso.width := 1 ;
    end
  else
      pnlPeso.AutoSize := True ;

  if not edAltura.Visible then
    begin
      pnlAltura.AutoSize := False ;
      pnlAltura.width := 1 ;
    end
  else
      pnlAltura.AutoSize := True ;


  for I := 0 to JvDBUltimGrid1.Columns.Count - 1 do
    begin

      if JvDBUltimGrid1.Columns[ i ].Field = Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaPESO then
         JvDBUltimGrid1.Columns[ i ].Visible := cbxDigitarPeso.Checked ;

      if JvDBUltimGrid1.Columns[ i ].Field = Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaAltura then
         JvDBUltimGrid1.Columns[ i ].Visible := cbxDigitarAltura.Checked ;
    end ;

end;

procedure TZoo_CrescimentoPesoAlturaWizard.UpdateEdtBrinco;
begin
  edtBrinco.text := Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaBRINCO.asString ;
  edtBrinco.Font.color := clNavy ;
  FBrinco := Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaBRINCO.asString ;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.ValidateCamposFixo;
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

  if not ( cbxDigitarPeso.Checked or cbxDigitarAltura.Checked ) then
     AddErr ( 'Selecionar Peso, altura ou ambos' ) ;

//  if FKFuncionario = '' then
//     AddErr ( 'Funcionário' ) ;

  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos na entrada padrão'#13#10#13#10 + ErrMsg );

end;

procedure TZoo_CrescimentoPesoAlturaWizard.edtBrincoButtonClick(Sender: TObject);
begin
  inherited;
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.edtBrincoChange(Sender: TObject);
begin
  inherited;
  if edtBrinco.Text = Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaBRINCO.asString then
     edtBrinco.Font.Color := clNavy
  else
     edtBrinco.Font.Color := clRed ;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.edtBrincoEnter(Sender: TObject);
begin
  inherited;
  edtBrinco.SelectAll ;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.edtBrincoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_up then
    begin
     Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAltura.Prior ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAltura.Next ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end ;
end;

procedure TZoo_CrescimentoPesoAlturaWizard.edtBrincoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAltura.State in [dsInsert,dsEdit] then
     Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAltura.Post ;

  if ( Key = #13  ) then
    begin
      Key := #0 ;
      //if ( Trim ( edtBrinco.Text ) = '' ) then
      //  exit ;

      if ( Trim ( edtBrinco.Text ) <> '' ) and ( edtBrinco.Text = Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaBRINCO.asString ) then
       begin
         if edPeso.Visible then
           edPeso.SetFocus
         else if edAltura.Visible then
           edAltura.SetFocus ;
         exit ;
       end ;

      FBrinco := edtBrinco.Text ;
      AddBrinco ;
    end;
end;

procedure TZoo_CrescimentoPesoAlturaWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_CrescimentoPesoAlturaDatamodule.ApplyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_PesoAltura.CreateAndDispatch( self ) ; ;
  inherited;
end;

procedure TZoo_CrescimentoPesoAlturaWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  Try
    _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  not Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAltura.IsEmpty ;
  except
  End;
end;

procedure TZoo_CrescimentoPesoAlturaWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_CrescimentoPesoAlturaWizard._actPriorExecute(Sender: TObject);
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
  RegisterClass ( TZoo_CrescimentoPesoAlturaWizard ) ;


end.


