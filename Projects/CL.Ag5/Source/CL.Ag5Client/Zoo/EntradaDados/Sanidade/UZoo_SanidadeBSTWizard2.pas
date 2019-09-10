unit UZoo_SanidadeBSTWizard2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, VCL.Mask, VCL.DBCtrls, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UZoo_SanidadeBSTDatamodule2, Data.DB, Tc.Data.DB.Helpers, JvExExtCtrls, JvExtComponent, JvPanel,
  JvExMask, JvToolEdit, JvDBControls, JvImage, Tc.VCL.Edits,
  Tc.VCL.Application,
  Tc.VCL.Edits.DBControls, UZoo_EntradaDadosBaseWizard,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.ControlPopuper,
  Tc.VCL.FloatPanel, JvDBCheckBox,
  CL.Ag5.NSMsgs,
  Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_SanidadeBSTWizard2 = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsBST: TDataSource;
    DBMemo1: TDBMemo;
    JvDBDateEdit1: TTcDBDateEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    BitBtn2: TTcGDIButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    deDataDefault : TTcDateEdit;
    btnSelecionarAnimais: TTcGDIButton;
    pnlSelecaoAnimais: TTcCaptionedPanel;
    JvDBUltimGrid2: TJvDBUltimGrid;
    TcControlPopuper1: TTcControlPopuper;
    dtsSelectAnimais: TDataSource;
    Panel3: TPanel;
    FloatEditorOKButton: TTcGDIButton;
    FloatEditorCancelButton: TTcGDIButton;
    actDoSelect: TAction;
    gbMensagem: TGroupBox;
    lbBST: TLabel;
    lbDPP: TLabel;
    lbProd: TLabel;
    lblRetiradaBST: TLabel;
    lblDiasSecagem: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    edDPPPrimipara: TEdit;
    edProdPrimipara: TEdit;
    edBSTPrim: TEdit;
    edtDiasPreSecagemPrimipara: TEdit;
    edtDiasSecagemPrimipara: TEdit;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    edDPPMultipara: TEdit;
    edProdMultipara: TEdit;
    edBSTMult: TEdit;
    edtDiasPreSecagemMultipara: TEdit;
    edtDiasSecagemMultipara: TEdit;
    Panel1: TPanel;
    deBSTAte: TTcDateEdit;
    btnListarAnimaisBST: TTcGDIButton;
    Label8: TLabel;
    edNomeFuncionarioDefault: TJvComboEdit;
    deData: TTcDBDateEdit;
    edFuncionario: TJvDBComboEdit;
    lcMotivoInterrupcao: TDBLookupComboBox;
    Label9: TLabel;
    chkAplicado: TJvDBCheckBox;
    Label10: TLabel;
    edtBrinco: TJvComboEdit;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure JvDBUltimGrid1Enter(Sender: TObject);
    procedure edNomeFuncionarioDefaultButtonClick(Sender: TObject);
    procedure edNomeFuncionarioDefaultChange(Sender: TObject);
    procedure edNomeFuncionarioDefaultKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1EditButtonClick(Sender: TObject);
    procedure dtsBSTDataChange(Sender: TObject; Field: TField);
    procedure edtBrincoEnter(Sender: TObject);
    procedure btnSelecionarAnimaisClick(Sender: TObject);
    procedure actDoSelectExecute(Sender: TObject);
    procedure btnListarAnimaisBSTClick(Sender: TObject);
    procedure FloatEditorCancelButtonClick(Sender: TObject);
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    function JvDBUltimGrid2CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure edtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBrincoChange(Sender: TObject);
    procedure edtBrincoButtonClick(Sender: TObject);
    procedure deDataKeyPress(Sender: TObject; var Key: Char);
    procedure edFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure chkAplicadoKeyPress(Sender: TObject; var Key: Char);
    procedure lcMotivoInterrupcaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lcMotivoInterrupcaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Zoo_SanidadeBSTDatamodule2 : TZoo_SanidadeBSTDatamodule2 ;
    FBrinco       : string ;
    FKFuncionario : string ;
    function SearchAnimalFemea(TextToSearch: string) : boolean ;
    procedure UpdateEdtBrinco;
    procedure AddBrinco ;
    procedure ValidateCamposFixo ;
    procedure SearchFuncionarioDefault ( TextToSearch : string);
    procedure SetFuncionario ( TextToSearch : string);
    procedure DspParams ;
    procedure UpdateControls ;
    procedure CheckFieldsVisibleDescricao;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    class function Execute : boolean ; override ;
  end;


implementation

Uses SearchsZootecnico,
     CLAg5Types,
     Exceptions ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_SanidadeBSTWizard2.actDoSelectExecute(Sender: TObject);
begin
  Zoo_SanidadeBSTDatamodule2.CopySelectionList( deDataDefault.Date, FKFuncionario, edNomeFuncionarioDefault.Text ) ;
  TcControlPopuper1.ModalResult := mrOK ;
end;

procedure TZoo_SanidadeBSTWizard2.AddBrinco;
begin
  ValidateCamposFixo;
  Zoo_SanidadeBSTDatamodule2.AddBrinco ( edtBrinco.Text, deDataDefault.Date, FKFuncionario, edNomeFuncionarioDefault.Text ) ;
  edtBrinco.setFocus ;
  edtBrinco.SelectAll ;
end;

procedure TZoo_SanidadeBSTWizard2.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Zoo_SanidadeBSTDatamodule2.RemoveRecord ;

end;

constructor TZoo_SanidadeBSTWizard2.Create ( AOwner : TComponent  ) ;
begin
   inherited Create ( AOwner ) ;
   Zoo_SanidadeBSTDatamodule2 := TZoo_SanidadeBSTDatamodule2.Create ( self ) ;
   Zoo_SanidadeBSTDatamodule2.OpenTables ;
   dtsBST.DataSet := Zoo_SanidadeBSTDatamodule2.cdsBST ;
   dtsSelectAnimais.DataSet := Zoo_SanidadeBSTDatamodule2.cdsSelectBST ;
   deBSTAte.Date := Date + 7 ;
   DspParams ;
   UpdateEdtBrinco;
   CheckFieldsVisibleDescricao;
end;

procedure TZoo_SanidadeBSTWizard2.deDataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      edFuncionario.SetFocus ;
    end;
end;

procedure TZoo_SanidadeBSTWizard2.DspParams;
begin

  edBSTPrim.Text       := Zoo_SanidadeBSTDatamodule2.IntervaloAplicacaoBSTPrimipara.ToString ;
  edBSTMult.Text       := Zoo_SanidadeBSTDatamodule2.IntervaloAplicacaoBSTMultipara.ToString ;

  lbBST.Caption           := Zoo_SanidadeBSTDatamodule2.GetDescricaoBST( _ST_PARAM_MATRIZES_BST_INTERVALO );
  lbDPP.Caption           := Zoo_SanidadeBSTDatamodule2.GetDescricaoBST( _ST_PARAM_MATRIZES_BST_DEL );
  lbProd.Caption          := Zoo_SanidadeBSTDatamodule2.GetDescricaoBST( _ST_PARAM_MATRIZES_BST_PRODUCAO );
  lblDiasSecagem.Caption  := Zoo_SanidadeBSTDatamodule2.GetDescricaoBST( _ST_PARAM_MATRIZES_DIAS_PRE_PARTO_SECAR );
  lblRetiradaBST.Caption  := Zoo_SanidadeBSTDatamodule2.GetDescricaoBST( _ST_PARAM_MATRIZES_BST_DIAS_PRE_SECAGEM );

  edBSTPrim.Text       := Zoo_SanidadeBSTDatamodule2.IntervaloAplicacaoBSTPrimipara.ToString ;
  edBSTMult.Text       := Zoo_SanidadeBSTDatamodule2.IntervaloAplicacaoBSTMultipara.ToString ;

  edDPPPrimipara.Text  := Zoo_SanidadeBSTDatamodule2.BSTDPPPrimipara.ToString ;
  edDPPMultipara.Text  := Zoo_SanidadeBSTDatamodule2.BSTDPPMultipara.ToString ;

  edProdPrimipara.Text := Zoo_SanidadeBSTDatamodule2.ProducaoPrimipara.ToString ;
  edProdMultipara.Text := Zoo_SanidadeBSTDatamodule2.ProducaoMultipara.ToString ;

  edtDiasSecagemPrimipara.Text := Zoo_SanidadeBSTDatamodule2.DiasPrePartoSecarPrimipara.toString ;
  edtDiasSecagemMultipara.Text := Zoo_SanidadeBSTDatamodule2.DiasPrePartoSecarMultipara.toString ;

  edtDiasPreSecagemPrimipara.Text := Zoo_SanidadeBSTDatamodule2.DiasPreSecagemBSTPrimipara.toString ;
  edtDiasPreSecagemMultipara.Text := Zoo_SanidadeBSTDatamodule2.DiasPreSecagemBSTMultipara.toString ;
end;

procedure TZoo_SanidadeBSTWizard2.dtsBSTDataChange(Sender: TObject; Field: TField);
begin
  with Zoo_SanidadeBSTDatamodule2, cdsBST do
    begin
      dtsBST.AutoEdit := not ( bof and eof ) ;

      if (not Assigned ( Field )) and (edtBrinco.text <> cdsBSTBRINCO.asString) then
         updateEdtBrinco ;
      UpdateControls ;
    end;
end;

class function TZoo_SanidadeBSTWizard2.Execute : boolean;
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


procedure TZoo_SanidadeBSTWizard2.FloatEditorCancelButtonClick(Sender: TObject);
begin
  TcControlPopuper1.ModalResult := mrCancel ;
end;

function TZoo_SanidadeBSTWizard2.JvDBUltimGrid1CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := Assigned ( Field )
     and ( (Field.FieldName  = 'APLICADO'   )
  )  ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_SanidadeBSTWizard2.JvDBUltimGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
   with Zoo_SanidadeBSTDatamodule2, JvDBUltimGrid1 do
       if ( SelectedField = cdsBSTNOMEFUNCIONARIO ) then
            self.SetFuncionario ( InplaceEditor.Text ) ;
end;

procedure TZoo_SanidadeBSTWizard2.JvDBUltimGrid1Enter(Sender: TObject);
begin
  JvDBUltimGrid1.SelectedField := Zoo_SanidadeBSTDatamodule2.cdsBSTDATA ;
end;

procedure TZoo_SanidadeBSTWizard2.JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key =  VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_SanidadeBSTWizard2.JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key <> #13 ) then
    exit ;

  with Zoo_SanidadeBSTDatamodule2, JvDBUltimGrid1 do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsBSTNOMEFUNCIONARIO ) then
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

procedure TZoo_SanidadeBSTWizard2.JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

function TZoo_SanidadeBSTWizard2.JvDBUltimGrid2CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := Assigned ( Field )
     and ( (Field.FieldName  = 'SELECTED'   )
  )  ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_SanidadeBSTWizard2.lcMotivoInterrupcaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else if ( Key in [ Ord('A')..Ord('Z'), Ord('a')..Ord('z'), Ord('0')..Ord('9') ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
     TDBLookupComboBox ( Sender ).DropDown ;
end;

procedure TZoo_SanidadeBSTWizard2.lcMotivoInterrupcaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
   begin
     Key := #0 ;
     edtBrinco.SetFocus ;
   end ;
end;

procedure TZoo_SanidadeBSTWizard2.SearchFuncionarioDefault(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edNomeFuncionarioDefault.Text := Result.FieldByName( 'APELIDO' ).asString ;
               FKFuncionario           := Result.FieldByName( 'KCAD_ENTIDADE' ).asString ;
               edNomeFuncionarioDefault.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;
end;

procedure TZoo_SanidadeBSTWizard2.SetFuncionario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
//               edFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               Zoo_SanidadeBSTDatamodule2.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;
end;

procedure TZoo_SanidadeBSTWizard2.btnListarAnimaisBSTClick(Sender: TObject);
begin
  Zoo_SanidadeBSTDatamodule2.BSTAte := deBSTAte.Date ;
  Zoo_SanidadeBSTDatamodule2.OpenSelecao ;
end;

procedure TZoo_SanidadeBSTWizard2.btnSelecionarAnimaisClick(Sender: TObject);
begin
  //Zoo_SanidadeBSTDatamodule2 ;
  pnlSelecaoAnimais.Height := Height - 100 ;
  pnlSelecaoAnimais.Width  := Width  div 2 ;
  pnlSelecaoAnimais.Left   := Width - pnlSelecaoAnimais.Width ;
  TcControlPopuper1.Popup( btnSelecionarAnimais.Parent.ClientToScreen( Point ( btnSelecionarAnimais.Left, btnSelecionarAnimais.Top ) ) ) ;
//  TcControlPopuper1.Execute ;
//     PopuperRetiros.PopupFromControl( btnSelecionarAnimais )
end;

procedure TZoo_SanidadeBSTWizard2.CheckFieldsVisibleDescricao;
begin
  edBSTPrim.Visible                  := True;
  edDPPPrimipara.Visible             := True;
  edProdPrimipara.Visible            := True;
  edtDiasSecagemPrimipara.Visible    := True;
  edtDiasPreSecagemPrimipara.Visible := True;

  edBSTMult.Visible                  := True;
  edDPPMultipara.Visible             := True;
  edProdMultipara.Visible            := True;
  edtDiasSecagemMultipara.Visible    := True;
  edtDiasPreSecagemMultipara.Visible := True;

end;

procedure TZoo_SanidadeBSTWizard2.chkAplicadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      lcMotivoInterrupcao.SetFocus ;
    end;
end;

procedure TZoo_SanidadeBSTWizard2.ValidateCamposFixo;
var
  ErrMsg : string ;
  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  ErrMsg := '' ;
(*
  if ( deDataDefault.date = 0 ) or ( deDataDefault.date < ( date - 30  ) ) then
     AddErr ( 'Data - em branco / inferior a 30 dias' ) ;
*)
  if ( deDataDefault.date = 0 ) then
     AddErr ( 'Data - em branco' ) ;

  if ( deDataDefault.date >  date ) then
     AddErr ( 'Data - superior a data atual' ) ;

  if FKFuncionario = '' then
     AddErr ( 'Funcionário' ) ;

  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos na entrada padrão'#13#10#13#10 + ErrMsg );
end;

procedure TZoo_SanidadeBSTWizard2.edFuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
       if Zoo_SanidadeBSTDatamodule2.cdsBSTKCAD_FUNCIONARIO.isNull then
         begin
            SetFuncionario(edFuncionario.Text) ;
            edFuncionario.Font.Color := clNavy ;
         end ;

       chkAplicado.SetFocus ;

        Key := #0 ;
    end;
end;

procedure TZoo_SanidadeBSTWizard2.edNomeFuncionarioDefaultButtonClick(Sender: TObject);
begin
  SearchFuncionarioDefault ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeBSTWizard2.edNomeFuncionarioDefaultChange(Sender: TObject);
begin
  inherited;
  FKFuncionario := '' ;
  edNomeFuncionarioDefault.Font.Color := clRed ;
end;

procedure TZoo_SanidadeBSTWizard2.edNomeFuncionarioDefaultKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      SearchFuncionarioDefault ( TJvComboEdit ( Sender ).Text ) ;
    end ;
end;

procedure TZoo_SanidadeBSTWizard2.edtBrincoButtonClick(Sender: TObject);
begin
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;
end;

function TZoo_SanidadeBSTWizard2.SearchAnimalFemea(TextToSearch: string) : boolean ;
var
  lFound : boolean ;
begin
    lFound := False ;
    with TSearchFemeaAtivo.Create do
       try
          //FBrinco := '' ;
          //TextToFind := TextToSearch ;
          TextToFind := FBrinco ;
          FBrinco := '' ;
          lFound := Execute ;
          if ( lFound ) then
             begin
               FBrinco                := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Font.Color   := clNavy ;
               //AddByKey ( Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString ) ;
             end ;
       finally
          SearchAnimalFemea := lFound ;
          free ;
       end ;
end;

procedure TZoo_SanidadeBSTWizard2.edtBrincoChange(Sender: TObject);
begin
  if edtBrinco.Text = Zoo_SanidadeBSTDatamodule2.cdsBSTBRINCO.asString then
     edtBrinco.Font.Color := clNavy
  else
     edtBrinco.Font.Color := clRed ;
end;

procedure TZoo_SanidadeBSTWizard2.edtBrincoEnter(Sender: TObject);
begin
  edtBrinco.SelectAll
end;

procedure TZoo_SanidadeBSTWizard2.UpdateControls;
var
  LEnabled : boolean ;
begin
   LEnabled := dtsBST.AutoEdit ;
   deData.Enabled              := LEnabled ;
   edFuncionario.Enabled       := LEnabled ;
   chkAplicado.Enabled         := LEnabled ;
   lcMotivoInterrupcao.Enabled := LEnabled ;
end;

procedure TZoo_SanidadeBSTWizard2.UpdateEdtBrinco;
begin
  edtBrinco.text := Zoo_SanidadeBSTDatamodule2.cdsBSTBRINCO.asString ;
  edtBrinco.Font.color := clNavy ;
  FBrinco := Zoo_SanidadeBSTDatamodule2.cdsBSTBRINCO.asString ;
  edtBrinco.SelectAll ;
end;

procedure TZoo_SanidadeBSTWizard2.edtBrincoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_up then
    begin
     Zoo_SanidadeBSTDatamodule2.cdsBST.Prior ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_SanidadeBSTDatamodule2.cdsBST.Next ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end ;
end;

procedure TZoo_SanidadeBSTWizard2.edtBrincoKeyPress(Sender: TObject; var Key: Char);
begin

   if ( Key = #13  ) then
    begin
      Key := #0 ;
//      if ( Trim ( edtBrinco.Text ) = '' ) then
//        exit ;

      if   ( Zoo_SanidadeBSTDatamodule2.cdsBSTBRINCO.asString <> '' )
       and ( edtBrinco.Text = Zoo_SanidadeBSTDatamodule2.cdsBSTBRINCO.asString ) then
       begin
         deData.SetFocus ;
         exit ;
       end ;

      FBrinco := edtBrinco.Text ;
      AddBrinco ;
    end;

end;


procedure TZoo_SanidadeBSTWizard2._actExecuteExecute(Sender: TObject);
begin
  Zoo_SanidadeBSTDatamodule2.ApplyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_BST.CreateAndDispatch( self ) ; ;
  inherited;
end;

procedure TZoo_SanidadeBSTWizard2._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  Try
    _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  not Zoo_SanidadeBSTDatamodule2.cdsBST.IsEmpty ;
  except
  End;
end;

procedure TZoo_SanidadeBSTWizard2._actNextExecute(Sender: TObject);
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

procedure TZoo_SanidadeBSTWizard2._actPriorExecute(Sender: TObject);
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


