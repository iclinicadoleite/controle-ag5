unit UZoo_ProducaoSecagemWizard;

{ DONE -oCaique -cDados do Periodo / Produção : - Acertar tela para abrir em aba }
{ TODO -oCaique -cDados do Periodo / Producao : - falta concluir parto/gestacao }
{ TODO -oCaique -cDados do Periodo / Producao : - incluir lookup de causa }
{ DONE -oCaique -cDados do Periodo / Produção : - Alterar Barra de Título }
{ DONE -oCaique -cDados do Periodo / Produção : - Alterar Posição Titulo }
{ DONE -oCaique -cDados do Periodo / Produção : - Incluir Botão fechar }


interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, VCL.Mask, JvExMask,
  JvToolEdit, JvDBControls, Data.DB, Tc.Data.DB.Helpers, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_ProducaoSecagemDatamodule, VCL.DBCtrls, JvExControls, JvDBLookup,
  Tc.VCL.Edits.DBControls,
  Tc.VCL.Application,
  Tc.VCL.Edits, UZoo_EntradaDadosBaseWizard,  DbClient,
  JvExStdCtrls, JvCombobox, JvDBCombobox, Tc.VCL.Controls.GDIButton,
  System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers, Tc.VCL.ControlPopuper ;

type
  TZoo_ProducaoSecagemWizard = class(TZoo_EntradaDadosBaseWizard)
    tbsSecagem: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsSecagem: TDataSource;
    JvDBDateEdit1: TTcDBDateEdit;
    GroupBox2: TGroupBox;
    DBMemo1: TDBMemo;
    dtsMotivoSecagem: TDataSource;
    tbsData: TTabSheet;
    rbPrevisaoParto: TRadioButton;
    dePrevisaoSecagem: TTcDateEdit;
    btbRemoverSecagem: TTcGDIButton;
    btnSelecionarAnimais: TTcGDIButton;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    edtBrinco: TJvComboEdit;
    Label1: TLabel;
    JvDBComboBox1: TJvDBComboBox;
    dbeDataSecagem: TTcDBDateEdit;
    cmbCausa: TJvDBComboBox;
    lblData: TLabel;
    lblCausa: TLabel;
    PanelSelectProtocolos: TPanel;
    PanelSelectProtocolosSecagem: TPanel;
    dbgProtocolosSecagem: TJvDBUltimGrid;
    Panel1: TPanel;
    lbProtocolosParto: TLabel;
    chkSelectAllProtocolosSecagem: TCheckBox;
    dtsProtocolosSecagem: TDataSource;
    edProtocolosGrid: TJvDBComboEdit;
    ControlPopuperProtocolos: TTcControlPopuper;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure _actNextUpdate(Sender: TObject);
    procedure btnSelecionarAnimaisClick(Sender: TObject);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure btbRemoverSecagemClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure edtBrincoButtonClick(Sender: TObject);
    procedure edtBrincoChange(Sender: TObject);
    procedure edtBrincoEnter(Sender: TObject);
    procedure edtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure JvDBComboBoxEnter(Sender: TObject);
    procedure JvDBComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbCausaKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDataSecagemKeyPress(Sender: TObject; var Key: Char);
    procedure chkSelectAllProtocolosSecagemClick(Sender: TObject);
    function dbgProtocolosSecagemCheckIfBooleanField(Grid: TJvDBGrid;
      Field: TField; var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgProtocolosSecagemCellClick(Column: TColumn);
    procedure dbgProtocolosSecagemKeyPress(Sender: TObject; var Key: Char);
    procedure edProtocolosGridButtonClick(Sender: TObject);
    procedure edProtocolosGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtsSecagemDataChange(Sender: TObject; Field: TField);
    procedure ControlPopuperProtocolosClose(Sender: TObject);
  private
    { Private declarations }
    FBrinco       : string ;
    Zoo_ProducaoSecagemDatamodule : TZoo_ProducaoSecagemDatamodule ;
    procedure ValidateCamposFixo;
    procedure OpenTables ;
    procedure AddBrinco ;
//    procedure AddByKey ( AKey : string ) ;
    procedure UpdateEdtBrinco ;
    function SearchAnimalFemea ( TextToSearch : string) : boolean ;
    procedure CheckEditVisible;

    procedure SetStyleCheckBoxProtocolosSecagem;
  public
    { Public declarations }
    class function Execute : boolean ; reintroduce ; // overload ;
  end;

implementation

uses UDBZootecnico, Exceptions , SearchsZootecnico, ThreadSuppl, UMessagePrintDialog ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_ProducaoSecagemWizard.AddBrinco;
begin
   ValidateCamposFixo;

   try
    if ( Trim ( edtBrinco.Text ) <> '' ) and Zoo_ProducaoSecagemDatamodule.AddBrinco( FBrinco ) then
      begin
        UpdateEdtBrinco ;
        exit ;
      end ;

    if not SearchAnimalFemea ( FBrinco ) then
       raise Warning.Create('Animal não encontrado');
  except
     edtBrinco.setFocus ;
     edtBrinco.SelectAll ;
     raise ;
  end ;
end;

(*
procedure TZoo_ProducaoSecagemWizard.AddByKey(AKey: string);
begin
  if Zoo_ProducaoSecagemDatamodule.LocateBrinco( FBrinco ) then
     exit ;

  ValidateCamposFixo;
  if Zoo_ProducaoSecagemDatamodule.AddByKey ( AKey  ) then
     {nothing};
end;
*)
procedure TZoo_ProducaoSecagemWizard.btbRemoverSecagemClick(Sender: TObject);
begin
  Zoo_ProducaoSecagemDatamodule.RemoveBrincoSelecionado;
  CheckEditVisible;
end;

procedure TZoo_ProducaoSecagemWizard.btnSelecionarAnimaisClick(Sender: TObject);
begin
//  verificar regras de secagem
  Zoo_ProducaoSecagemDatamodule.SelecionaAnimais( dePrevisaoSecagem.Date )  ;
  CheckEditVisible;
end;

procedure TZoo_ProducaoSecagemWizard.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Zoo_ProducaoSecagemDatamodule.AplicarProtocolos( checkBox1.Checked )  ;
end;

procedure TZoo_ProducaoSecagemWizard.edProtocolosGridButtonClick(
  Sender: TObject);
var
 LPoint  : TPoint ;
 LTop, LLeft: Integer;
begin

  LLeft := (edProtocolosGrid.Left + edProtocolosGrid.Width) - (PanelSelectProtocolos.Width);
  LTop  := ( edProtocolosGrid.Top  + edProtocolosGrid.Height ) ;

  if (LTop + PanelSelectProtocolos.Height) > ClientHeight then
     LTop  := ( edProtocolosGrid.Top  - PanelSelectProtocolos.Height -1 ) ;


   LPoint := Point (
          LLeft
      ,   LTop
   ) ;
   LPoint := edProtocolosGrid.Parent.clientToScreen ( LPoint ) ;
   ControlPopuperProtocolos.Popup ( LPoint ) ;

end;

procedure TZoo_ProducaoSecagemWizard.edProtocolosGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] )
   //and not ( TDBLookupComboBox ( Sender ).ListVisible )
  then
    begin
     Key := 0 ;
     edProtocolosGrid.Button.Click ;
    end ;
end;

procedure TZoo_ProducaoSecagemWizard.edtBrincoButtonClick(Sender: TObject);
begin
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_ProducaoSecagemWizard.edtBrincoChange(Sender: TObject);
begin
  if edtBrinco.Text = Zoo_ProducaoSecagemDatamodule.cdsSecagensBRINCO.asString then
     edtBrinco.Font.Color := clNavy
  else
     edtBrinco.Font.Color := clRed ;
end;

procedure TZoo_ProducaoSecagemWizard.edtBrincoEnter(Sender: TObject);
begin
  edtBrinco.SelectAll ;
end;

procedure TZoo_ProducaoSecagemWizard.edtBrincoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_up then
    begin
     Zoo_ProducaoSecagemDatamodule.cdsSecagens.Prior ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_ProducaoSecagemDatamodule.cdsSecagens.Next ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end ;
end;

procedure TZoo_ProducaoSecagemWizard.edtBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Zoo_ProducaoSecagemDatamodule.cdsSecagens.State in [dsInsert,dsEdit] then
     Zoo_ProducaoSecagemDatamodule.cdsSecagens.Post ;

  if ( Key = #13  ) then
    begin
      Key := #0 ;
      if ( Trim ( edtBrinco.Text ) = '' ) then
        exit ;

      if ( Trim ( edtBrinco.Text ) <> '' ) and ( edtBrinco.Text = Zoo_ProducaoSecagemDatamodule.cdsSecagensBRINCO.asString ) then
        begin
          if dbeDataSecagem.visible then
           dbeDataSecagem.SetFocus ;
         exit ;
        end;

      FBrinco := edtBrinco.Text ;
      AddBrinco ;
      if dbeDataSecagem.visible then
        dbeDataSecagem.SetFocus ;
    end;
end;

class function TZoo_ProducaoSecagemWizard.Execute : boolean;
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

procedure TZoo_ProducaoSecagemWizard.CheckEditVisible;
begin
  lblCausa.Visible := not Zoo_ProducaoSecagemDatamodule.cdsSecagens.IsEmpty;
  lblData.Visible := not Zoo_ProducaoSecagemDatamodule.cdsSecagens.IsEmpty;
  dbeDataSecagem.Visible := not Zoo_ProducaoSecagemDatamodule.cdsSecagens.IsEmpty;
  cmbCausa.Visible := not Zoo_ProducaoSecagemDatamodule.cdsSecagens.IsEmpty;
end;

procedure TZoo_ProducaoSecagemWizard.FormShow(Sender: TObject);
begin
//  inherited;
  dePrevisaoSecagem.Date := Date;
end;

procedure TZoo_ProducaoSecagemWizard.chkSelectAllProtocolosSecagemClick(
  Sender: TObject);
begin
  if chkSelectAllProtocolosSecagem.Checked then
   Zoo_ProducaoSecagemDatamodule.InvertAllSelection(True, TClientDataSet(dtsProtocolosSecagem.DataSet))
  else
   Zoo_ProducaoSecagemDatamodule.InvertAllSelection(False, TClientDataSet(dtsProtocolosSecagem.DataSet));
end;

procedure TZoo_ProducaoSecagemWizard.cmbCausaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      edtBrinco.SetFocus ;
    end;
end;

procedure TZoo_ProducaoSecagemWizard.ControlPopuperProtocolosClose(
  Sender: TObject);
begin
  if not dtsSecagem.AutoEdit then
    exit ;
  Zoo_ProducaoSecagemDatamodule.UpdateDescrProtocolos ;
end;

procedure TZoo_ProducaoSecagemWizard.dbeDataSecagemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      cmbCausa.SetFocus ;
    end;
end;

procedure TZoo_ProducaoSecagemWizard.dbgProtocolosSecagemCellClick(
  Column: TColumn);
begin
  inherited;
  if not ( dtsProtocolosSecagem.DataSet.IsEmpty )
   and ( Column.FieldName =  'SELECTED' ) then
     Zoo_ProducaoSecagemDatamodule.InvertSelecao( TClientDataSet(dtsProtocolosSecagem.DataSet) ) ;

  SetStyleCheckBoxProtocolosSecagem;
end;

function TZoo_ProducaoSecagemWizard.dbgProtocolosSecagemCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin

  Result := Field = Zoo_ProducaoSecagemDatamodule.cdsProtocolosSecagemSELECTED;
  StringForTrue  := '1' ;
  StringForFalse := '0' ;
end;

procedure TZoo_ProducaoSecagemWizard.dbgProtocolosSecagemKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     ControlPopuperProtocolos.ModalResult := mrOK ;
end;

procedure TZoo_ProducaoSecagemWizard.dtsSecagemDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if not Assigned( Zoo_ProducaoSecagemDatamodule ) then
    Exit;

  Zoo_ProducaoSecagemDatamodule.FilterProtocolosByAnimalFemea ;
  SetStyleCheckBoxProtocolosSecagem;
end;

procedure TZoo_ProducaoSecagemWizard.JvDBComboBoxEnter(Sender: TObject);
begin
   TJvDBComboBox(Sender).DroppedDown := True ;
end;

procedure TZoo_ProducaoSecagemWizard.JvDBComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
(*
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TJvDBComboBox ( Sender ).DroppedDown ) then
    begin
     Key := 0 ;
     TJvDBComboBox ( Sender ).DroppedDown := True  ;
    end ;
*)

  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TJvDBComboBox ( Sender ).DroppedDown ) then
    begin
     Key := 0 ;
     TJvDBComboBox ( Sender ).DroppedDown := True  ;
    end
  else if ( not Key in [ VK_RETURN ] ) and not ( TJvDBComboBox ( Sender ).DroppedDown ) then
     TJvDBComboBox ( Sender ).DroppedDown := True  ;

end;

function TZoo_ProducaoSecagemWizard.JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin
  inherited;
  Result := Field = Zoo_ProducaoSecagemDatamodule.cdsSecagensAPLICADO_PROTOCOLO_SECAGEM ;
  StringForTrue  := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_ProducaoSecagemWizard.JvDBUltimGrid1KeyPress(Sender: TObject;
  var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key = '-' ) then
    begin
      Key := #0 ;
      exit ;
    end
  else if ( Key = ',' ) or ( Key = '.' ) then
    begin
      Key := FormatSettings.DecimalSeparator ;
      exit ;
    end
  else if ( Key <> #13 ) then
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

procedure TZoo_ProducaoSecagemWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;

  if   ( Zoo_ProducaoSecagemDatamodule.cdsSecagens.IsEmpty )
    or ( Field = Zoo_ProducaoSecagemDatamodule.cdsSecagensBRINCO ) then
      begin
         AllowEdit := False ;
         exit ;
      end ;

(*
  if ( Field = Zoo_ProducaoSecagemDatamodule.cdsSecagensBRINCO )
   and ( not Zoo_ProducaoSecagemDatamodule.cdsSecagens.IsEmpty )
   and ( not Zoo_ProducaoSecagemDatamodule.cdsSecagensKZOO_ANIMAL_FEMEA.isNull ) then
      begin
         AllowEdit := False ;
         exit ;
      end ;
*)

  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly )  ) ;
end;


procedure TZoo_ProducaoSecagemWizard.OpenTables;
begin
   if not Assigned ( Zoo_ProducaoSecagemDatamodule )  then
    begin
      Zoo_ProducaoSecagemDatamodule := TZoo_ProducaoSecagemDatamodule.Create ( self ) ;
      dtsSecagem.DataSet := Zoo_ProducaoSecagemDatamodule.cdsSecagens ;
      CheckEditVisible;
    end;
   Zoo_ProducaoSecagemDatamodule.OpenTables ;
end;


function TZoo_ProducaoSecagemWizard.SearchAnimalFemea( TextToSearch: string ) : boolean;
var
  lFound : boolean ;
begin
    lFound := False ;
//    with TSearchFemeaAtivo.Create do
    with TSearchFemeaEmLactacao.Create do
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
               AddBrinco ; // AddByKey  ( Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString  )
             end ;
       finally
          SearchAnimalFemea := lFound ;
          free ;
       end ;
end;

procedure TZoo_ProducaoSecagemWizard.SetStyleCheckBoxProtocolosSecagem;
begin
  chkSelectAllProtocolosSecagem.OnClick := nil;
  if Zoo_ProducaoSecagemDatamodule.IsAllSelected( TClientDataSet(dtsProtocolosSecagem.DataSet) ) then
    chkSelectAllProtocolosSecagem.State := cbChecked
  else
  if Zoo_ProducaoSecagemDatamodule.NothingSelected( TClientDataSet(dtsProtocolosSecagem.DataSet) ) then
    chkSelectAllProtocolosSecagem.State := cbUnchecked
  else
    chkSelectAllProtocolosSecagem.State := cbGrayed;
  chkSelectAllProtocolosSecagem.OnClick := chkSelectAllProtocolosSecagemClick;
end;

procedure TZoo_ProducaoSecagemWizard.UpdateEdtBrinco;
begin
  edtBrinco.Text := Zoo_ProducaoSecagemDatamodule.cdsSecagensBRINCO.asString ;
  edtBrinco.Font.color := clNavy ;
  FBrinco := Zoo_ProducaoSecagemDatamodule.cdsSecagensBRINCO.asString ;
  // solicitado por augusto 2013-11-06
  edtBrinco.SelectAll ;
  CheckEditVisible;
end;

procedure TZoo_ProducaoSecagemWizard.ValidateCamposFixo;
var
  ErrMsg : string ;
  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  ErrMsg := '' ;
(*
  if ( deDataPadrao.date = 0 ) {or ( deData.date < ( date - 30  ) )} then
     AddErr ( 'Data - em branco' ) ;
     //     AddErr ( 'Data - em branco / inferior a 30 dias' ) ;

  if ( deDataPadrao.date >  date ) then
     AddErr ( 'Data - superior a data atual' ) ;

  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos na entrada padrão'#13#10#13#10 + ErrMsg );
*)
end;

procedure TZoo_ProducaoSecagemWizard._actExecuteExecute(Sender: TObject);
var
  AMsg : string ;
const
  DlgCaption = '  Secagem não processada' ;
begin

  if Zoo_ProducaoSecagemDatamodule.processa ( AMsg ) then
   begin
     MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
     TCLAg5NSMsgEVT_Secagem.CreateAndDispatch( self ) ; ;
     PageControl.ActivePage := tbsData ;
   end
  else if AMsg <> '' then
     TMessagePrintDialog.Execute ( DlgCaption, AMsg ) ;
end;

procedure TZoo_ProducaoSecagemWizard._actExecuteUpdate(Sender: TObject);
var
   ActionEnabled : boolean ;
begin
  ActionEnabled := False ;
  try
    ActionEnabled := ( PageControl.ActivePage = tbsSecagem ) and (Zoo_ProducaoSecagemDatamodule.cdsSecagens.ChangeCount > 0 ) ;
  except
  end;
  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  ActionEnabled ;
end;

procedure TZoo_ProducaoSecagemWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;
  OpenTables ;

end;

procedure TZoo_ProducaoSecagemWizard._actNextUpdate(Sender: TObject);
begin
  inherited;
  _actNext.Enabled := ( PageControl.ActivePage = tbsData ) and (  dePrevisaoSecagem.Date > 0 ) ;
end;

procedure TZoo_ProducaoSecagemWizard._actPriorExecute(Sender: TObject);
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


