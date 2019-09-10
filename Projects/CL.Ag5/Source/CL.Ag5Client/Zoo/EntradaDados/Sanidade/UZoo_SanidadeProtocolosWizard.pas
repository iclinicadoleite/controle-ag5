unit UZoo_SanidadeProtocolosWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.DBCtrls, JvToolEdit,
  VCL.Mask, JvExMask,
  UZoo_SanidadeProtocolosDatamodule, Data.DB, Tc.Data.DB.Helpers, JvDBControls, JvExStdCtrls, JvEdit, JvDBSearchEdit,
  JvDBCheckBox, Tc.VCL.Edits, Tc.VCL.Edits.DBControls,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, Tc.VCL.Controls.GDIButton,
  System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_SanidadeProtocolosWizard = class(TZoo_EntradaDadosBaseWizard)
    tbsIndividual: TTabSheet;
    GroupBox1: TGroupBox;
    dbgTarefasAAplicarIndividual: TJvDBUltimGrid;
    dtsFichaAnimalColetivo: TDataSource;
    tbsColetivo: TTabSheet;
    GroupBox3: TGroupBox;
    Panel4: TPanel;
    Splitter5: TSplitter;
    Panel6: TPanel;
    Splitter6: TSplitter;
    dbgTarefasAAplicarColetivo: TJvDBUltimGrid;
    Panel9: TPanel;
    Panel10: TPanel;
    Label7: TLabel;
    edtBrincoIndividual: TJvComboEdit;
    Label4: TLabel;
    dbdeIndividual: TTcDBDateEdit;
    tbsTipoLancto: TTabSheet;
    Label8: TLabel;
    JvDBDateEdit2: TTcDBDateEdit;
    GroupBox4: TGroupBox;
    dtsProtocoloIndividual: TDataSource;
    Label5: TLabel;
    dblcProtocoloColetivo: TDBLookupComboBox;
    dtsProtocoloColetivo: TDataSource;
    dtsTarefasColetivo : TDataSource;
    dtsTarefasIndividual : TDataSource;
    dtsProtocolosAplicados: TDataSource;
    rbLancamentoIndividual: TRadioButton;
    rbLancamentoColetivo: TRadioButton;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel14: TPanel;
    dbgAnimaisColetivo: TJvDBUltimGrid;
    Label9: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    dtsResumoAnimal: TDataSource;
    Splitter2: TSplitter;
    Panel1: TPanel;
    Panel7: TPanel;
    Splitter1: TSplitter;
    Panel8: TPanel;
    dbgProtocolosAplicadosIndividual: TJvDBUltimGrid;
    JvPanel2: TJvPanel;
    dbgProtocolosDisponiveisIndividual: TJvDBUltimGrid;
    JvPanel1: TJvPanel;
    dtsProtocolosDisponiveis: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    DBEdit1: TDBText;
    Label25: TLabel;
    JvPanel3: TJvPanel;
    Label23: TLabel;
    DBText19: TDBText;
    Label24: TLabel;
    DBText17: TDBText;
    Label6: TLabel;
    edtBrincoColetivo: TJvComboEdit;
    JvPanel4: TJvPanel;
    JvPanel5: TJvPanel;
    JvPanel6: TJvPanel;
    Panel13: TPanel;
    dbgProtocolosAplicadosColetivo: TJvDBUltimGrid;
    JvPanel7: TJvPanel;
    Label22: TLabel;
    edFuncionarioIndividual: TJvComboEdit;
    BitBtn1: TTcGDIButton;
    actAlterarFuncionarioIndividual: TAction;
    Panel3: TPanel;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    edFuncionarioColetivo: TJvComboEdit;
    BitBtn3: TTcGDIButton;
    actAlterarFuncionarioColetivo: TAction;
    BitBtn2: TTcGDIButton;
    TcGDIButton1: TTcGDIButton;
    actSelectByPersonalizado: TAction;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edtBrincoIndividualChange(Sender: TObject);
    procedure edtBrincoIndividualButtonClick(Sender: TObject);
    procedure edtBrincoIndividualKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edtBrincoColetivoButtonClick(Sender: TObject);
    procedure edtBrincoColetivoChange(Sender: TObject);
    procedure edtBrincoColetivoKeyPress(Sender: TObject; var Key: Char);
    procedure _actNextUpdate(Sender: TObject);
    procedure dblcProtocoloColetivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function dbgCheckIfBooleanField(Grid: TJvDBGrid;
      Field: TField; var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgKeyPress(Sender: TObject;
      var Key: Char);
    procedure dbgKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgTarefasAAplicarColetivoEditButtonClick(Sender: TObject);
    procedure dtsProtocoloColetivoDataChange(Sender: TObject; Field: TField);
    procedure dtsProtocoloIndividualDataChange(Sender: TObject; Field: TField);
    procedure BitBtn2Click(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure edFuncionarioIndividualChange(Sender: TObject);
    procedure actAlterarFuncionarioIndividualExecute(Sender: TObject);
    procedure actAlterarFuncionarioIndividualUpdate(Sender: TObject);
    procedure actAlterarFuncionarioColetivoExecute(Sender: TObject);
    procedure edFuncionarioColetivoChange(Sender: TObject);
    procedure actAlterarFuncionarioColetivoUpdate(Sender: TObject);
    procedure edFuncionarioIndividualButtonClick(Sender: TObject);
    procedure edFuncionarioColetivoButtonClick(Sender: TObject);
    procedure edFuncionarioIndividualKeyPress(Sender: TObject; var Key: Char);
    procedure edFuncionarioColetivoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgTarefasAAplicarIndividualEditButtonClick(Sender: TObject);
    procedure actSelectByPersonalizadoExecute(Sender: TObject);
    procedure actSelectByPersonalizadoUpdate(Sender: TObject);
  private
    { Private declarations }
    FBrinco : string ;
    FKFuncionarioIndividual : string ;
    FKFuncionarioColetivo   : string ;
    Zoo_SanidadeProtocolosDatamodule: TZoo_SanidadeProtocolosDatamodule;
    procedure AddBrincoColetivo ;
    procedure AddBrincoIndividual ;
    procedure AddByKeyColetivo  ( AKey : String ) ;
    procedure AddByKeyIndividual  ( AKey : String ) ;
    function SearchAnimalFemeaColetivo ( TextToSearch : string) : boolean ;
    function SearchAnimalFemeaIndividual ( TextToSearch : string) : boolean ;
    procedure ValidateCamposFixo;
    procedure SetFuncionarioIndividual ( TextToSearch : string);
    procedure SetFuncionarioColetivo ( TextToSearch : string);
    procedure SearchFuncionarioIndividual ( TextToSearch : string);
    procedure SearchFuncionarioColetivo( TextToSearch : string);
    procedure AddFromPersonalizado ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute ( ABrinco : string ; AKey : string ): boolean ; reintroduce ;
  end;


implementation

uses SearchsZootecnico
   , Exceptions
   , CL.Ag5.SelectDataFromPersonalizado;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_SanidadeProtocolosWizard.Create(AOwner: TComponent);
begin

   inherited Create ( AOwner ) ;
//   deDataEvento.Date := Date ;

   Zoo_SanidadeProtocolosDatamodule := TZoo_SanidadeProtocolosDatamodule.Create ( self ) ;

   dtsFichaAnimalColetivo.DataSet :=  Zoo_SanidadeProtocolosDatamodule.cdsFichaAnimalColetivo ;
   dtsProtocoloIndividual.DataSet :=  Zoo_SanidadeProtocolosDatamodule.cdsProtocoloIndividual ;
   dtsProtocoloColetivo.DataSet   :=  Zoo_SanidadeProtocolosDatamodule.cdsProtocoloColetivo   ;
   dtsProtocolosAplicados.DataSet :=  Zoo_SanidadeProtocolosDatamodule.cdsProtocolosAplicados ;
   dtsTarefasColetivo.DataSet     :=  Zoo_SanidadeProtocolosDatamodule.cdsTarefasColetivo     ;
   dtsTarefasIndividual.DataSet   :=  Zoo_SanidadeProtocolosDatamodule.cdsTarefasIndividual   ;

   Zoo_SanidadeProtocolosDatamodule.OpenTables ;

//   cdsZoo_Protocolos.DataSet := Zoo_SanidadeProtocolosDatamodule.cdsCoberturas ;


end;

function TZoo_SanidadeProtocolosWizard.dbgCheckIfBooleanField(
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

procedure TZoo_SanidadeProtocolosWizard.dbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_SanidadeProtocolosWizard.dbgKeyPress(
  Sender: TObject; var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key <> #13 ) then
    exit ;

  with Zoo_SanidadeProtocolosDatamodule, TJvDBUltimGrid( Sender ) do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsTarefasIndividualNOMEFUNCIONARIO ) then
         begin
            self.SetFuncionarioIndividual ( InplaceEditor.Text ) ;
            exit ;
         end
       else if ( SelectedField = cdsTarefasColetivoNOMEFUNCIONARIO ) then
         begin
            self.SetFuncionarioColetivo ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;

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


procedure TZoo_SanidadeProtocolosWizard.dbgShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TZoo_SanidadeProtocolosWizard.dbgTarefasAAplicarColetivoEditButtonClick(
  Sender: TObject);
begin
  inherited;
   with Zoo_SanidadeProtocolosDatamodule, dbgTarefasAAplicarColetivo do
       if ( SelectedField = cdsTarefasColetivoNOMEFUNCIONARIO ) then
            self.SetFuncionarioColetivo ( InplaceEditor.Text ) ;
end;

procedure TZoo_SanidadeProtocolosWizard.dbgTarefasAAplicarIndividualEditButtonClick(
  Sender: TObject);
begin
   with Zoo_SanidadeProtocolosDatamodule, dbgTarefasAAplicarIndividual do
       if ( SelectedField = cdsTarefasIndividualNOMEFUNCIONARIO ) then
            self.SetFuncionarioIndividual ( InplaceEditor.Text ) ;
end;

procedure TZoo_SanidadeProtocolosWizard.dblcProtocoloColetivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_SanidadeProtocolosWizard.dtsProtocoloColetivoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;


 with Zoo_SanidadeProtocolosDatamodule do
   try
//      dbgProtocolosDisponiveisColetivo.Visible := Trim ( cdsProtocoloColetivoKZOO_ANIMAL_FEMEA.asString ) <> ''  ;
      dbgProtocolosAplicadosColetivo.Visible := Trim ( cdsProtocoloColetivoKZOO_PROTOCOLO.asString ) <> ''  ;
      dbgTarefasAAplicarColetivo.Visible := Trim ( cdsProtocoloColetivoKZOO_PROTOCOLO.asString ) <> ''  ;
      dbgAnimaisColetivo.Visible := Trim ( cdsProtocoloColetivoKZOO_PROTOCOLO.asString ) <> ''  ;
      edtBrincoColetivo.Enabled := Trim ( cdsProtocoloColetivoKZOO_PROTOCOLO.asString ) <> ''  ;
   except
//      dbgProtocolosDisponiveisColetivo.Visible := False ;
      dbgProtocolosAplicadosColetivo.Visible := False ;
      dbgTarefasAAplicarColetivo.Visible := False ;
      dbgAnimaisColetivo.Visible := False ;
      edtBrincoColetivo.Enabled := False ;
   end;

  if Field = Zoo_SanidadeProtocolosDatamodule.cdsProtocoloColetivoDATA then
    begin
      dbgTarefasAAplicarColetivo.Refresh ;
    end;

end;

procedure TZoo_SanidadeProtocolosWizard.dtsProtocoloIndividualDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;

 with Zoo_SanidadeProtocolosDatamodule do
   try
      dbgProtocolosDisponiveisIndividual.Visible := Trim ( cdsProtocoloIndividualKZOO_ANIMAL_FEMEA.asString ) <> ''  ;
      dbgProtocolosAplicadosIndividual.Visible := Trim ( cdsProtocoloIndividualKZOO_ANIMAL_FEMEA.asString ) <> ''  ;
      dbgTarefasAAplicarIndividual.Visible := Trim ( cdsProtocoloIndividualKZOO_ANIMAL_FEMEA.asString ) <> ''  ;
   except
      dbgProtocolosDisponiveisIndividual.Visible := False ;
      dbgProtocolosAplicadosIndividual.Visible := False ;
      dbgTarefasAAplicarIndividual.Visible := False ;
   end;

  if Field = Zoo_SanidadeProtocolosDatamodule.cdsProtocoloIndividualDATA then
    begin
      dbgTarefasAAplicarIndividual.Refresh ;
    end;
end;

procedure TZoo_SanidadeProtocolosWizard.edFuncionarioColetivoButtonClick(
  Sender: TObject);
begin
  inherited;
  SearchFuncionarioColetivo ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeProtocolosWizard.edFuncionarioColetivoChange(
  Sender: TObject);
begin
  FKFuncionarioIndividual := '' ;
end;

procedure TZoo_SanidadeProtocolosWizard.edFuncionarioColetivoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
   if Key = #13 then
     begin
      Key := #0 ;
      TjvComboEdit ( Sender ).DoClick ;
     end;

end;

procedure TZoo_SanidadeProtocolosWizard.edFuncionarioIndividualButtonClick(
  Sender: TObject);
begin
  inherited;
  SearchFuncionarioIndividual ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeProtocolosWizard.edFuncionarioIndividualChange(
  Sender: TObject);
begin
  inherited;
  FKFuncionarioIndividual := '' ;
end;

procedure TZoo_SanidadeProtocolosWizard.edFuncionarioIndividualKeyPress(
  Sender: TObject; var Key: Char);
begin
   if Key = #13 then   
     begin
      Key := #0 ;
      TjvComboEdit ( Sender ).DoClick ;
     end;
end;

procedure TZoo_SanidadeProtocolosWizard.edtBrincoColetivoButtonClick(Sender: TObject);
begin
  inherited;
  SearchAnimalFemeaColetivo ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeProtocolosWizard.edtBrincoColetivoChange(Sender: TObject);
begin
  inherited;
  edtBrincoColetivo.Font.Color := clRed ;
end;

procedure TZoo_SanidadeProtocolosWizard.edtBrincoColetivoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Key = #13  ) then
    begin
      Key := #0 ;
//      if ( Trim ( edtBrincoColetivo.Text ) = '' ) then
//        exit ;

      FBrinco := edtBrincoColetivo.Text ;
      AddBrincoColetivo ;
    end;

end;

procedure TZoo_SanidadeProtocolosWizard.edtBrincoIndividualButtonClick(Sender: TObject);
begin
  inherited;
  SearchAnimalFemeaIndividual ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeProtocolosWizard.edtBrincoIndividualChange(Sender: TObject);
begin
  inherited;
  edtBrincoIndividual.Font.Color := clRed ;
  Zoo_SanidadeProtocolosDatamodule.ClearAnimalIndividual ;
end;

procedure TZoo_SanidadeProtocolosWizard.edtBrincoIndividualKeyPress(Sender: TObject; var Key: Char);
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

class function TZoo_SanidadeProtocolosWizard.Execute ( ABrinco : string ; AKey : string ) : boolean;
begin
  with Create ( nil ) do
    try
//        self.Zoo_SanidadeBaixarTarefasDatamodule.TipoLanctoTarefa := lpAnimal

        rbLancamentoIndividual.checked := True ;
        _actNextExecute( nil ) ;
        FBrinco                          := ABrinco;
        edtBrincoIndividual.OnChange := nil ;
        edtBrincoIndividual.Text         := ABrinco;
        edtBrincoIndividual.Font.Color   := clNavy ;
        edtBrincoIndividual.OnChange := edtBrincoIndividualChange ;
        AddByKeyIndividual ( AKey ) ;

        tbsTipoLancto.Enabled := False ;
        edtBrincoIndividual.ReadOnly := True ;
        Result := ShowModal = mrOK ;
        if Result then
           {ThisForm.DoSomething}  ; ;
    finally
       free ;
    end ;
end ;

procedure TZoo_SanidadeProtocolosWizard._actExecuteExecute(Sender: TObject);
begin
  inherited;
  Zoo_SanidadeProtocolosDatamodule.applyUpdates ;
//  edtBrincoIndividual.Text := '' ;
//  edFuncionarioColetivo.Text := '' ;
//  edFuncionarioIndividual.Text := '' ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_Protocolos.CreateAndDispatch( self ) ; ;
end;

procedure TZoo_SanidadeProtocolosWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited ;
  with Zoo_SanidadeProtocolosDatamodule do
    if rbLancamentoIndividual.Checked then
      begin
        _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and
                               (Trim ( cdsProtocoloIndividualKZOO_PROTOCOLO.asString ) <> '' )
                           and (Trim ( cdsProtocoloIndividualKZOO_ANIMAL_FEMEA.asString ) <> '' )
                           and ( cdsProtocoloIndividualDATA.asDateTime > 1 ) ;
      end
    else
      begin
        _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and
                               (Trim ( cdsProtocoloColetivoKZOO_PROTOCOLO.asString ) <> '' )
                           and ( cdsProtocoloColetivoDATA.asDateTime > 1 )
                           and ( not cdsFichaAnimalColetivo.isEmpty ) ;
      end;
end;

procedure TZoo_SanidadeProtocolosWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  self.tbsIndividual.Enabled := rbLancamentoIndividual.Checked ;
  self.tbsColetivo.Enabled   := rbLancamentoColetivo.Checked ;

  if rbLancamentoIndividual.Checked then
  begin
    self.Zoo_SanidadeProtocolosDatamodule.TipoLanctoProtocolo := lpIndividual;
  end
  else
  begin
    self.Zoo_SanidadeProtocolosDatamodule.TipoLanctoProtocolo := lpColetivo ;
    _btbExecute.Enabled := True;
  end;

  inherited;

end;

procedure TZoo_SanidadeProtocolosWizard._actNextUpdate(Sender: TObject);
begin
  inherited;
  _actNext.Enabled := self.rbLancamentoIndividual.Checked or  self.rbLancamentoColetivo.Checked ;
end;

procedure TZoo_SanidadeProtocolosWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

procedure TZoo_SanidadeProtocolosWizard.actAlterarFuncionarioColetivoExecute(
  Sender: TObject);
begin
  Zoo_SanidadeProtocolosDatamodule.TrocaFuncionarioColetivo ( FKFuncionarioColetivo, edFuncionarioColetivo.Text ) ;
end;

procedure TZoo_SanidadeProtocolosWizard.actAlterarFuncionarioColetivoUpdate(
  Sender: TObject);
begin
  inherited;
  actAlterarFuncionarioColetivo.Enabled := ( self.FKFuncionarioColetivo <> '' )
                   and ( not  Zoo_SanidadeProtocolosDatamodule.cdsTarefasColetivo.IsEmpty ) ;
end;

procedure TZoo_SanidadeProtocolosWizard.actAlterarFuncionarioIndividualExecute(
  Sender: TObject);
begin
  Zoo_SanidadeProtocolosDatamodule.TrocaFuncionarioIndividual ( FKFuncionarioIndividual, edFuncionarioIndividual.Text ) ;
end;

procedure TZoo_SanidadeProtocolosWizard.actAlterarFuncionarioIndividualUpdate(
  Sender: TObject);
begin
  actAlterarFuncionarioIndividual.Enabled := ( self.FKFuncionarioIndividual <> '' )
                   and ( not  Zoo_SanidadeProtocolosDatamodule.cdsTarefasIndividual.IsEmpty ) ;
end;

procedure TZoo_SanidadeProtocolosWizard.actSelectByPersonalizadoExecute(
  Sender: TObject);
begin
  inherited;

 AddFromPersonalizado ;

end;

procedure TZoo_SanidadeProtocolosWizard.actSelectByPersonalizadoUpdate(
  Sender: TObject);
begin
  actSelectByPersonalizado.Enabled := PersonalizadoAssigned
                               and not VarIsNull ( dblcProtocoloColetivo.KeyValue )
end;

procedure TZoo_SanidadeProtocolosWizard.AddBrincoColetivo ;
begin
//  ValidateCamposFixo;

  try
    if Zoo_SanidadeProtocolosDatamodule.AddBrincoColetivo( FBrinco ) then
      begin
        edtBrincoColetivo.Font.color := clNavy ;
        edtBrincoColetivo.SelectAll ;
        exit ;
      end ;

    if SearchAnimalFemeaColetivo ( FBrinco ) then
       edtBrincoColetivo.SelectAll
    else
       Raise Warning.Create('Animal não encontrado');
  except
     edtBrincoColetivo.setFocus ;
     edtBrincoColetivo.SelectAll ;
     raise ;
  end ;

end;

procedure TZoo_SanidadeProtocolosWizard.AddBrincoIndividual;
begin
//  ValidateCamposFixo;

  try
    if Zoo_SanidadeProtocolosDatamodule.AddBrincoIndividual( FBrinco ) then
      begin
        edtBrincoIndividual.Font.color := clNavy ;
        edtBrincoIndividual.SelectAll ;
        exit ;
      end ;

    if SearchAnimalFemeaIndividual ( FBrinco ) then
       edtBrincoIndividual.SelectAll
    else
       Raise Warning.Create('Animal não encontrado');
  except
     edtBrincoIndividual.setFocus ;
     edtBrincoIndividual.SelectAll ;
     raise ;
  end ;

end;

procedure TZoo_SanidadeProtocolosWizard.AddByKeyColetivo(AKey: String);
begin

  if Zoo_SanidadeProtocolosDatamodule.LocateKeyColetivo( AKey ) then
     exit ;

//  ValidateCamposFixo;
  try
    if Zoo_SanidadeProtocolosDatamodule.AddByKeyColetivo ( AKey ) then
      exit ;
  finally

  end;

end;

procedure TZoo_SanidadeProtocolosWizard.AddByKeyIndividual(AKey: String);
begin

//  ValidateCamposFixo;

  try
    if Zoo_SanidadeProtocolosDatamodule.AddByKeyIndividual ( AKey ) then
      exit ;
  finally

  end;

end;

procedure TZoo_SanidadeProtocolosWizard.AddFromPersonalizado;
var
   LKeyCodeList : TKeyCodeList ;
   LKeyCode : TKeyCode ;
begin
  dtsFichaAnimalColetivo.DataSet.DisableControls ;
  dtsProtocolosAplicados.DataSet.DisableControls ;

  { TODO -oCaique -cMelhoria : Incluir seleção do personalizado }
  LKeyCodeList := SelectFromPersonalizado ;

  if not Assigned ( LKeyCodeList )  then
     exit ;

  for LKeyCode in LKeyCodeList do
     AddByKeyColetivo( LKeyCode.Key );

  LKeyCodeList.free ;

  dtsProtocolosAplicados.DataSet.EnableControls ;
  dtsFichaAnimalColetivo.DataSet.EnableControls ;

end;

procedure TZoo_SanidadeProtocolosWizard.BitBtn2Click(Sender: TObject);
begin
  Zoo_SanidadeProtocolosDatamodule.RemoveBrincoSelecionado;
end;

function TZoo_SanidadeProtocolosWizard.SearchAnimalFemeaColetivo(TextToSearch: string) : boolean ;
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
               FBrinco                        := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrincoColetivo.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrincoColetivo.Font.Color   := clNavy ;
               AddByKeyColetivo ( Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString ) ;
             end ;
       finally
          SearchAnimalFemeaColetivo := lFound ;
          free ;
       end ;
end;

function TZoo_SanidadeProtocolosWizard.SearchAnimalFemeaIndividual(
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
               edtBrincoIndividual.OnChange := nil ;
               edtBrincoIndividual.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrincoIndividual.Font.Color   := clNavy ;
               edtBrincoIndividual.OnChange := edtBrincoIndividualChange ;
               AddByKeyIndividual ( Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString ) ;
             end ;
       finally
          SearchAnimalFemeaIndividual := lFound ;
          free ;
       end ;
end;

procedure TZoo_SanidadeProtocolosWizard.SearchFuncionarioColetivo(
  TextToSearch: string);
begin
    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edFuncionarioColetivo.OnChange := nil ;
               edFuncionarioColetivo.Text := Result.FieldByName( 'APELIDO' ).asString ;
               FKFuncionarioColetivo           := Result.FieldByName( 'KCAD_ENTIDADE' ).asString ;
               edFuncionarioColetivo.OnChange := edFuncionarioColetivoChange ;
               edFuncionarioColetivo.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;

end;

procedure TZoo_SanidadeProtocolosWizard.SearchFuncionarioIndividual(TextToSearch: string);
begin
    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edFuncionarioIndividual.OnChange := nil ;
               edFuncionarioIndividual.Text := Result.FieldByName( 'APELIDO' ).asString ;
               FKFuncionarioIndividual           := Result.FieldByName( 'KCAD_ENTIDADE' ).asString ;
               edFuncionarioIndividual.OnChange := edFuncionarioIndividualChange ;
               edFuncionarioIndividual.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;
end;

procedure TZoo_SanidadeProtocolosWizard.SetFuncionarioIndividual(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               Zoo_SanidadeProtocolosDatamodule.SetFuncionarioIndividual(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;

end;

procedure TZoo_SanidadeProtocolosWizard.SetFuncionarioColetivo(TextToSearch: string);
begin
    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               Zoo_SanidadeProtocolosDatamodule.SetFuncionarioColetivo(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;
end;

procedure TZoo_SanidadeProtocolosWizard.ValidateCamposFixo;
begin
//
end ;

end.
