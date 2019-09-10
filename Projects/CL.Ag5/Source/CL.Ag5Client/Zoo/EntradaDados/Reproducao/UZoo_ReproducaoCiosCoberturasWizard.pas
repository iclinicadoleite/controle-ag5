unit UZoo_ReproducaoCiosCoberturasWizard;


{ DONE -oCaique -cDados do Periodo / Reproducao : - Acertar tela para abrir em aba }
{ TODO -oCaique -cDados do Periodo / Reproducao : - validação dos campos ( não permitir entrada de brinco/animal ) com campos em branco }
{ TODO -oCaique -cDados do Periodo / Reproducao : - não permitir inclusão de animal que tenha um evento de cio / cobertura em aberto }
{ DONE -oCaique -cDados do Periodo / Reprodução : - Alterar Barra de Título }
{ DONE -oCaique -cDados do Periodo / Reprodução : - Alterar Posição Titulo }
{ DONE -oCaique -cDados do Periodo / Reprodução : - Incluir Botão fechar }


interface

uses
  WinApi.Windows, WinApi.Messages,  System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, UZoo_ReproducaoCiosCoberturasDatamodule, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.Mask, JvExMask, JvToolEdit,
  JvExControls, JvDBLookup, JvSpin, JvBaseEdits, JvDBControls,
  JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Exceptions, JvDataSource, VCL.DBCtrls, Tc.VCL.Edits.DBControls, Tc.VCL.Edits,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, ClAg5ClientZootecnicoCommonTypes,
  Tc.VCL.Controls.GDIButton, System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

{$define _IATF_MONTA}

type
  TZoo_ReproducaoCiosCoberturasWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsEventosReprodutivos: TDataSource;
    lblEdPadraoData: TLabel;
    _lblEdPadraoMuco: TLabel;
    dePadraoDataEvento: TTcDateEdit;
    _lcbPadraoMuco: TDBLookupComboBox;
    dtsTipoEvento: TDataSource;
    dtsTipoMuco: TDataSource;
    GroupBox1: TGroupBox;
    gbxQuickEdit: TGroupBox;
    deData: TTcDBDateEdit;
    Label12: TLabel;
    _Label16: TLabel;
    _lcMuco: TDBLookupComboBox;
    pnlPadraoVariavel: TPanel;
    pnlPadraoFuncionario: TPanel;
    lblEdPadraoFuncionario: TLabel;
    edPadraoNomeFuncionario: TJvComboEdit;
    pnlEventoPadrao: TPanel;
    pnlPadraoDoses: TPanel;
    lblEdPadraoDoses: TLabel;
    edPadraoDoses: TJvSpinEdit;
    pnlVariavel: TPanel;
    pnlFuncionario: TPanel;
    lblEdFuncionario: TLabel;
    edFuncionario: TJvDBComboEdit;
    pnlEvento: TPanel;
    pnlDoses: TPanel;
    lblEdDoses: TLabel;
    edDoses: TJvDBCalcEdit;
    Panel2: TPanel;
    Label7: TLabel;
    edtBrinco: TJvComboEdit;
    pnlQuickEdit: TPanel;
    degData: TTcDBDateEdit;
    Panel3: TPanel;
    Panel5: TPanel;
    BitBtn2: TTcGDIButton;
    DBMemo1: TDBMemo;
    dtsTipoEventoPadrao: TDataSource;
    dtsTipoMucoPadrao: TDataSource;
    pnlPadraoIATF: TPanel;
    chkPadraoIATF: TCheckBox;
    lcbPadraoProtocoloIATF: TDBLookupComboBox;
    Label1: TLabel;
    pnlIATF: TPanel;
    chkIATF: TDBCheckBox;
    lcProtocoloIATF: TDBLookupComboBox;
    dtsProtocolosIATFPadrao: TDataSource;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    edPadraoNomeAnimalMacho: TJvComboEdit;
    lblEdPadraoMacho: TLabel;
    Label2: TLabel;
    lcbPadraoEvento: TDBLookupComboBox;
    Label14: TLabel;
    lcEvento: TDBLookupComboBox;
    pnlMacho: TPanel;
    lblEdMacho: TLabel;
    edMacho: TJvDBComboEdit;
    Label4: TLabel;
    Label3: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edPadraoNomeFuncionarioButtonClick(Sender: TObject);
    procedure edPadraoNomeFuncionarioChange(Sender: TObject);
    procedure edPadraoNomeAnimalMachoButtonClick(Sender: TObject);
    procedure edPadraoNomeAnimalMachoKeyPress(Sender: TObject; var Key: Char);
    procedure edPadraoNomeFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edPadraoNomeAnimalMachoChange(Sender: TObject);
    procedure edtBrincoButtonClick(Sender: TObject);
    procedure edtBrincoChange(Sender: TObject);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteExecute(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure edtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure deDataKeyPress(Sender: TObject; var Key: Char);
    procedure lcEventoKeyPress(Sender: TObject; var Key: Char);
    procedure _lcMucoKeyPress(Sender: TObject; var Key: Char);
    procedure edFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edDosesKeyPress(Sender: TObject; var Key: Char);
    procedure dtsEventosReprodutivosDataChange(Sender: TObject; Field: TField);
    procedure edFuncionarioChange(Sender: TObject);
    procedure edFuncionarioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edMachoChange(Sender: TObject);
    procedure edMachoKeyPress(Sender: TObject; var Key: Char);
    procedure edMachoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBrincoEnter(Sender: TObject);
    procedure edMachoButtonClick(Sender: TObject);
    procedure edFuncionarioButtonClick(Sender: TObject);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBUltimGrid1EditButtonClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure lcbPadraoEventoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lcbPadraoEventoCloseUp(Sender: TObject);
    procedure _lcbPadraoMucoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lcEventoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lcMucoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lcbPadraoProtocoloIATFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lcProtocoloIATFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lcProtocoloIATFKeyPress(Sender: TObject; var Key: Char);
    procedure chkIATFKeyPress(Sender: TObject; var Key: Char);
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure CheckBox1Click(Sender: TObject);
    procedure edMachoEnter(Sender: TObject);
    procedure lcEventoCloseUp(Sender: TObject);
    procedure dtsTipoEventoPadraoDataChange(Sender: TObject; Field: TField);
    procedure edPadraoNomeAnimalMachoExit(Sender: TObject);
  private
    { Private declarations }
    FKFuncionario : string ;
    FTipoAnimalPadrao : integer ;
    FKAnimalMacho : string ;
    FTipoMacho    : TTipoMacho ;
    FBrinco       : string ;
    Zoo_ReproducaoCiosCoberturasDatamodule : TZoo_ReproducaoCiosCoberturasDatamodule ;
    FUseQuickInput: boolean;
    procedure CheckEstoque ;
    procedure UpdateControls ;
    procedure UpdateControlPadrao ;
    procedure AddBrinco ;
    procedure AddByKey ( AKey : String ) ;
    procedure ValidateCamposFixo ;
    procedure SearchFuncionario ( TextToSearch : string);
    procedure SetFuncionario ( TextToSearch : string);
    procedure SetMacho ( TextToSearch : string);
    procedure SearchAnimalMacho ( TextToSearch : string);
    function SearchAnimalFemea ( TextToSearch : string) : boolean ;
    procedure UpdateEdtBrinco ;
    procedure ValidateAborto ;
    function GetDSA : boolean ;
    procedure SetDSA ;
    procedure SetUseQuickInput(const Value: boolean);
    procedure ValidFemeaNotIsNull;
  public
    { Public declarations }
    procedure OpenTables ;
    property UseQuickInput : boolean  read FUseQuickInput write SetUseQuickInput;
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; reintroduce ; // overload ;
  end;


implementation

{$R *.dfm}

Uses SearchsZootecnico, CLAg5Types, ThreadSuppl, UMessagePrintDialog, StrUtils ;

{ TfrmCustomWizard }

procedure TZoo_ReproducaoCiosCoberturasWizard.AddBrinco;
var
  LProtocoloIATF : string ;
  LTipoEvento : integer ;
  LBrinco : String;
begin

  ValidateCamposFixo;

  if VarIsNull ( lcbPadraoProtocoloIATF.KeyValue ) then
     LProtocoloIATF := ''
  else
     LProtocoloIATF := lcbPadraoProtocoloIATF.KeyValue ;

  LTipoEvento := _ST_TIPO_EVENTO_ZOO_CIO ;
  if ( UseQuickInput and not VarIsNull( lcbPadraoEvento.KeyValue ) ) then
     LTipoEvento := lcbPadraoEvento.KeyValue ;

  try
    LBrinco := FBrinco;
    if ( Trim ( LBrinco ) <> '' ) and
       Zoo_ReproducaoCiosCoberturasDatamodule.AddBrinco( LBrinco,
       FKAnimalMacho, edPadraoNomeAnimalMacho.Text, FTipoMacho,
       dePadraoDataEvento.date, LTipoEvento,
       edPadraoDoses.AsInteger,  -1 {lcbPadraoMuco.KeyValue},
       FKFuncionario, edPadraoNomeFuncionario.Text,
       LProtocoloIATF <> '',
       LProtocoloIATF ) then
      begin
        edFuncionario.Font.Color := clNavy ;
        edMacho.Font.Color := clNavy ;
        UpdateEdtBrinco ;
        lcProtocoloIATF.KeyValue := lcbPadraoProtocoloIATF.KeyValue ;
        edtBrinco.SetFocus ;
        edtBrinco.SelectAll ;
        if UseQuickInput then
          ValidateAborto ;
        exit ;
      end ;

    if SearchAnimalFemea ( LBrinco ) then
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

procedure TZoo_ReproducaoCiosCoberturasWizard.AddByKey( AKey : String ) ;
var
  LProtocoloIATF : string ;
  LTipoEvento : integer ;
begin

  if Zoo_ReproducaoCiosCoberturasDatamodule.LocateBrinco( FBrinco ) then
     exit ;

  ValidateCamposFixo;

  LTipoEvento := _ST_TIPO_EVENTO_ZOO_CIO ;
  if ( UseQuickInput and not VarIsNull( lcbPadraoEvento.KeyValue ) ) then
     LTipoEvento := lcbPadraoEvento.KeyValue ;


  if FUseQuickInput then
   begin
     if VarIsNull ( lcbPadraoProtocoloIATF.KeyValue ) then
        LProtocoloIATF := ''
     else
        LProtocoloIATF := lcbPadraoProtocoloIATF.KeyValue ;

     if Zoo_ReproducaoCiosCoberturasDatamodule.AddByKey ( AKey,
          FKAnimalMacho, edPadraoNomeAnimalMacho.Text, FTipoMacho,
          dePadraoDataEvento.date, LTipoEvento,
          edPadraoDoses.AsInteger, -1 {lcbPadraoMuco.KeyValue},
          FKFuncionario, edPadraoNomeFuncionario.Text,
          LProtocoloIATF <> '', LProtocoloIATF ) then
       begin
         edtBrinco.setFocus ;
         edtBrinco.SelectAll ;
         if UseQuickInput then
          ValidateAborto ;
       end;
   end
  else
   begin
     if VarIsNull ( lcProtocoloIATF.KeyValue ) then
        LProtocoloIATF := ''
     else
        LProtocoloIATF := lcProtocoloIATF.KeyValue ;

     if Zoo_ReproducaoCiosCoberturasDatamodule.AddByKey ( AKey,
          '', '', tmUndefined,
          deData.date, LTipoEvento,
          edPadraoDoses.AsInteger, -1 {lcbPadraoMuco.KeyValue},
          '', '',
          LProtocoloIATF <> '', LProtocoloIATF ) then
       begin
         edtBrinco.setFocus ;
         edtBrinco.SelectAll ;
         if UseQuickInput then
           ValidateAborto ;
       end;
   end;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.BitBtn2Click(Sender: TObject);
begin
   edMacho.OnChange := nil;
   Zoo_ReproducaoCiosCoberturasDatamodule.RemoveEvento ;
   edMacho.OnChange := edMachoChange;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edDosesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if Key = #13 then
    begin
      Key := #0 ;

      if lcProtocoloIATF.CanFocus then
         lcProtocoloIATF.SetFocus
      else
      if edtBrinco.CanFocus then
         edtBrinco.SetFocus ;

    end;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.CheckBox1Click(Sender: TObject);
begin
  UseQuickInput := CheckBox1.Checked ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.CheckEstoque;
var
  DSA : Boolean ;
  List : TStringList ;

begin
  if GetDSA then
     Exit ;

  List := TStringList.Create ;
  try
    Zoo_ReproducaoCiosCoberturasDataModule.GetEstoqueNegativo ( List ) ;
    if List.Count = 0 then
       exit ;
    TMessagePrintDialog.ExecuteDSA( 'Estoque Negativo : semens/embrioes com estoque negativo:', List.Text, DSA );
    if DSA then
       SetDSA ;
  finally
    List.Free ;
  end;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.chkIATFKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
     Key := #0 ;
     if chkIATF.Checked then
       lcProtocoloIATF.SetFocus
     else
       edtBrinco.SetFocus ;
    end;
end;

constructor TZoo_ReproducaoCiosCoberturasWizard.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;

   FTipoAnimalPadrao := -1 ;
   FKFuncionario := '' ;
   lblEdPadraoMacho.Caption  := '  Touro' ;
   lblEdMacho.Caption  := '  Touro' ;
   edDoses.Visible := False;
   pnlIATF.Visible := false;

   OpenTables ;
   UpdateControlPadrao;
   UpdateControls;
   lcbPadraoProtocoloIATF.KeyValue := null;

end;

procedure TZoo_ReproducaoCiosCoberturasWizard.lcbPadraoProtocoloIATFKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else if ( Key in [ Ord('A')..Ord('Z'), Ord('a')..Ord('z'), Ord('0')..Ord('9') ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
     TDBLookupComboBox ( Sender ).DropDown ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.lcProtocoloIATFKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else if ( Key in [ Ord('A')..Ord('Z'), Ord('a')..Ord('z'), Ord('0')..Ord('9') ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
     TDBLookupComboBox ( Sender ).DropDown ;

end;

procedure TZoo_ReproducaoCiosCoberturasWizard.lcProtocoloIATFKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
   begin
     Key := #0 ;
     if edtBrinco.CanFocus then
         edtBrinco.SetFocus ;
   end ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.deDataKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      if edMacho.CanFocus then
         edMacho.SetFocus;
    end;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.dtsEventosReprodutivosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivos do
    begin
      dtsEventosReprodutivos.AutoEdit := not ( bof and eof ) ;

      if (not Assigned ( Field )) and (edtBrinco.text <> Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosBRINCO.asString) then
         updateEdtBrinco ;

      if (   ( Field = Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosDATAEVENTO )
          or ( Field = Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosTIPOEVENTO )
         )
          and ( Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosDATAEVENTO.asDateTime > 0 )
          and ( Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosTIPOEVENTO.asInteger  > 0 ) then
          ValidateAborto ;

      UpdateControls ;
    end;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.dtsTipoEventoPadraoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if not Assigned( Zoo_ReproducaoCiosCoberturasDatamodule ) then
   exit;

  UpdateControlPadrao;
end;

class function TZoo_ReproducaoCiosCoberturasWizard.Execute : boolean;
begin
  with Create ( nil ) do
    try
        Result := ShowModal = mrOK ;
        if Result then
           {ThisForm.DoSomething}  ; ;
    finally
       free ;
    end ;
end ;


function TZoo_ReproducaoCiosCoberturasWizard.JvDBUltimGrid1CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := Assigned ( Field )
    and ( ( Field.FieldName = 'IATF'            ) ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.JvDBUltimGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
   with Zoo_ReproducaoCiosCoberturasDatamodule, JvDBUltimGrid1 do
       if ( SelectedField = cdsEventosReprodutivosNOMEFUNCIONARIO ) then
            self.SetFuncionario ( InplaceEditor.Text ) ;

   with Zoo_ReproducaoCiosCoberturasDatamodule, JvDBUltimGrid1 do
       if ( SelectedField = cdsEventosReprodutivosNOMEMACHO ) then
            self.SetMACHO ( InplaceEditor.Text ) ;

end;

procedure TZoo_ReproducaoCiosCoberturasWizard.JvDBUltimGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.JvDBUltimGrid1KeyPress(Sender: TObject;
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

  with Zoo_ReproducaoCiosCoberturasDatamodule, JvDBUltimGrid1 do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsEventosReprodutivosNOMEFUNCIONARIO ) and (InplaceEditor.Text <> '') then
         begin
            self.SetFUNCIONARIO ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;

  with Zoo_ReproducaoCiosCoberturasDatamodule, JvDBUltimGrid1 do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsEventosReprodutivosNOMEMACHO ) then
         begin
            self.SetMACHO ( InplaceEditor.Text ) ;
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


procedure TZoo_ReproducaoCiosCoberturasWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;

  if not AllowEdit then
     exit ;

 with Zoo_ReproducaoCiosCoberturasDatamodule do
   begin
     if Field = cdsEventosReprodutivosNOMEFUNCIONARIO then
       AllowEdit  := True ;
           //    ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_CIO )
           // or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) ;

     if Field = cdsEventosReprodutivosNOMEMACHO then
       AllowEdit  :=
             ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA )
          or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE )
          or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ;

     if Field = cdsEventosReprodutivosIATF then
       AllowEdit  :=
             ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA )
          {$IFDEF _IATF_MONTA}
          or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA ) // added
          {$ENDIF _IATF_MONTA}
          or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) ;

     if Field = cdsEventosReprodutivosDESC_PROTOCOLO_IATF then
       AllowEdit  :=
         cdsEventosReprodutivosIATF.asBoolean ;

   end;

end;

procedure TZoo_ReproducaoCiosCoberturasWizard.lcbPadraoEventoCloseUp(Sender: TObject);
begin
  inherited;
  UpdateControlPadrao ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.lcbPadraoEventoKeyDown(Sender: TObject;
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

procedure TZoo_ReproducaoCiosCoberturasWizard._lcbPadraoMucoKeyDown(Sender: TObject;
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

procedure TZoo_ReproducaoCiosCoberturasWizard.lcEventoCloseUp(Sender: TObject);
begin
  UpdateControls;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.lcEventoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else if ( Key in [ Ord('A')..Ord('Z'), Ord('a')..Ord('z'), Ord('0')..Ord('9') ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
     TDBLookupComboBox ( Sender ).DropDown ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.lcEventoKeyPress(Sender: TObject;
  var Key: Char);
begin
(*
  if Key = #13 then
   begin
     Key := #0 ;
     lcMuco.SetFocus ;
   end ;
*)
  if Key = #13 then
    begin
      Key := #0 ;
//      if edFuncionario.Visible then
//         edFuncionario.SetFocus
      if edDoses.CanFocus then
         edDoses.SetFocus
      else if lcProtocoloIATF.CanFocus then
         lcProtocoloIATF.SetFocus
      else
      if edtBrinco.CanFocus then
         edtBrinco.SetFocus ;
    end;

end;

procedure TZoo_ReproducaoCiosCoberturasWizard._lcMucoKeyDown(Sender: TObject;
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

procedure TZoo_ReproducaoCiosCoberturasWizard._lcMucoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      if edFuncionario.Visible then
         edFuncionario.SetFocus
      else if edMacho.Visible then
         edMacho.SetFocus
      else if edDoses.Visible then
         edDoses.SetFocus
      else if chkIATF.Visible then
         chkIATF.SetFocus
      else
         edtBrinco.SetFocus ;
    end;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.OpenTables;
begin
   Zoo_ReproducaoCiosCoberturasDatamodule := TZoo_ReproducaoCiosCoberturasDatamodule.Create ( self ) ;
   Zoo_ReproducaoCiosCoberturasDatamodule.OpenTables ;
   dtsEventosReprodutivos.DataSet := Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivos ;
   lcbPadraoEvento.KeyValue := _ST_TIPO_EVENTO_ZOO_CIO ;
   //lcbPadraoMuco.KeyValue   := 1 ;
   dePadraoDataEvento.Date := Date ;
   UpdateEdtBrinco ;
   Application.ProcessMessages ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edtBrincoButtonClick(Sender: TObject);
begin
  inherited;
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edtBrincoChange(Sender: TObject);
begin
  inherited;
  if edtBrinco.Text = Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosBrinco.asString then
     edtBrinco.Font.Color := clNavy
  else
     edtBrinco.Font.Color := clRed ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edtBrincoEnter(Sender: TObject);
begin
  inherited;
  edtBrinco.SelectAll ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edtBrincoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = vk_up then
    begin
     Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivos.Prior ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivos.Next ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edtBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if ( Key = #13  ) then
    begin
      Key := #0 ;
//      if ( Trim ( edtBrinco.Text ) = '' ) then
//        exit ;

      if   ( Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosBRINCO.asString <> '' )
       and ( edtBrinco.Text = Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosBRINCO.asString ) then
       begin
         deData.SetFocus ;
         exit ;
       end ;

      FBrinco := edtBrinco.Text ;
      AddBrinco ;
    end;
end;


procedure TZoo_ReproducaoCiosCoberturasWizard.edFuncionarioButtonClick(Sender: TObject);
begin
  inherited;
  SetFuncionario ( edFuncionario.text )  ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edFuncionarioChange(Sender: TObject);
begin
  inherited;
  if Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosKCAD_FUNCIONARIO.isNull then
     edFuncionario.Font.Color := clRed
  else
     edFuncionario.Font.Color := clNavy ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
       if Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosKCAD_FUNCIONARIO.isNull then
         begin
            SetFuncionario(edFuncionario.Text) ;
            edFuncionario.Font.Color := clNavy ;
         end
       else
        if edMacho.Visible then
           edMacho.SetFocus
        else if edDoses.Visible then
           edDoses.SetFocus
        else
           edtBrinco.SetFocus ;

        Key := #0 ;
    end;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edFuncionarioKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( edFuncionario.Text <> Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEFUNCIONARIO.Text ) then
    begin
     Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEFUNCIONARIO.Text := edFuncionario.Text ;
     edFuncionario.Font.Color := clRed ;
    end ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edMachoButtonClick(Sender: TObject);
begin
  inherited;
  SetMacho(edMacho.Text);
  UpdateControls;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edMachoChange(Sender: TObject);
begin
  inherited;

  if Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosKZOO_ANIMAL_MACHO.isNull then
   begin
     edMacho.Font.Color := clRed;
     Zoo_ReproducaoCiosCoberturasDatamodule.SetEvento( _ST_TIPO_EVENTO_ZOO_CIO );
   end
  else
     edMacho.Font.Color := clNavy ;

end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edMachoEnter(Sender: TObject);
begin
  if not Assigned(edMacho.OnChange) then
    edMacho.OnChange := edMachoChange;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edMachoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  ValidFemeaNotIsNull;

  if Key = #13 then
    begin
       if Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosKZOO_ANIMAL_MACHO.isNull
        or (edMacho.Text <> Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEMacho.Text ) then
         begin
            SetMacho(edMacho.Text) ;
            edMacho.Font.Color := clNavy ;
         end
//       else if edDoses.Visible then
//           edDoses.SetFocus
       else
       begin
         if lcEvento.CanFocus then
           lcEvento.SetFocus;
       end;

       Key := #0 ;
    end;

end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edMachoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
(*
  if ( edMacho.Text <> Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEMacho.Text ) then
    begin
     Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEMACHO.Text := edMacho.Text ;
     edMacho.Font.Color := clRed ;
    end ;
*)

(*
  if ( not Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosKZOO_ANIMAL_MACHO.isNull ) then
    begin
     Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosKZOO_ANIMAL_MACHO.Clear ;
     edMacho.Font.Color := clRed ;
    end ;
*)
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edPadraoNomeAnimalMachoButtonClick(Sender: TObject);
begin
  inherited;
  SearchAnimalMacho ( TJvComboEdit ( Sender ).Text ) ;

end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edPadraoNomeAnimalMachoChange(Sender: TObject);
begin
  inherited;
  FKAnimalMacho := '' ;
  edPadraoNomeAnimalMacho.Font.Color := clRed ;
  if edPadraoNomeAnimalMacho.Text <> '' then
    lcbPadraoEvento.KeyValue := _ST_TIPO_EVENTO_ZOO_CIO ;
  UpdateControlPadrao;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edPadraoNomeAnimalMachoExit(
  Sender: TObject);
begin
  inherited;
  if (edPadraoNomeAnimalMacho.Text = '') then
   begin
     lcbPadraoEvento.KeyValue := _ST_TIPO_EVENTO_ZOO_CIO;
     FKAnimalMacho := '' ;
   end;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edPadraoNomeAnimalMachoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      SearchAnimalMacho ( TJvComboEdit ( Sender ).Text ) ;
    end ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edPadraoNomeFuncionarioButtonClick(Sender: TObject);
begin
  inherited;
  SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edPadraoNomeFuncionarioChange(Sender: TObject);
begin
  FKFuncionario := '' ;
  edPadraoNomeFuncionario.Font.Color := clRed ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.edPadraoNomeFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
    end ;
end;

function TZoo_ReproducaoCiosCoberturasWizard.GetDSA: boolean;
begin
  Result := Zoo_ReproducaoCiosCoberturasDatamodule.GetDSA ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.SetDSA;
begin
  Zoo_ReproducaoCiosCoberturasDatamodule.SetDSA ;
end;

function TZoo_ReproducaoCiosCoberturasWizard.SearchAnimalFemea(TextToSearch: string) : boolean ;
var
  lFound : boolean ;
begin
    lFound := False ;
    with TSearchFemeaAtivo.Create do
       try
          //FBrinco := '' ;
          TextToFind := TextToSearch ;
          //TextToFind := FBrinco ;
          FBrinco := '' ;
          lFound := Execute ;
          if ( lFound ) then
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

procedure TZoo_ReproducaoCiosCoberturasWizard.SearchAnimalMacho(TextToSearch: string);
begin
  edPadraoNomeAnimalMacho.OnChange := nil ;

  with TSearchMachosEmbriao.Create do
    try
          TextToFind := TextToSearch ;
          if Execute then
             begin

               if Result.FieldByName( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_EMBRIAO then
                begin
                  FTipoAnimalPadrao :=  _ST_TIPO_EVENTO_ZOO_IMPLANTE;
                  lcbPadraoEvento.KeyValue := _ST_TIPO_EVENTO_ZOO_IMPLANTE;
                  FTipoMacho := tmEmbriao;
                  lblEdPadraoMacho.Caption  := '  Touro (Embrião)' ;
                end
               else
               if Result.FieldByName( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_SEMEN then
                begin
                  FTipoAnimalPadrao :=  _ST_TIPO_EVENTO_ZOO_INSEMINA;
                  lcbPadraoEvento.KeyValue := _ST_TIPO_EVENTO_ZOO_INSEMINA;
                  FTipoMacho := tmSemen;
                  lblEdPadraoMacho.Caption  := '  Touro (Sêmen)' ;
                end
               else
               if Result.FieldByName( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_TOURO then
                begin
                  FTipoAnimalPadrao :=  _ST_TIPO_EVENTO_ZOO_MONTA;
                  lcbPadraoEvento.KeyValue := _ST_TIPO_EVENTO_ZOO_MONTA;
                  FTipoMacho := tmTouro;
                  lblEdPadraoMacho.Caption  := '  Touro' ;
                end
               else
                begin
                  FTipoAnimalPadrao := 0;
                  FTipoMacho := tmUndefined;
                  lcbPadraoEvento.KeyValue := _ST_TIPO_EVENTO_ZOO_CIO;
                  lblEdPadraoMacho.Caption  := '  Touro' ;
                end;

               edPadraoNomeAnimalMacho.Text := ifThen ( Trim (  Result.FieldByName( 'NOMEESTABULO' ).asString ) = '',
                           Result.FieldByName( 'BRINCO' ).asString,
                           Result.FieldByName( 'NOMEESTABULO' ).asString ) ;
               edPadraoNomeAnimalMacho.Font.Color := clNavy ;
               FKAnimalMacho          := Result.FieldByName( 'KZOO_ANIMAL' ).asString ;

             end ;
       finally
          free ;
          UpdateControlPadrao;
          edPadraoNomeAnimalMacho.OnChange := edPadraoNomeAnimalMachoChange;
       end;

   {
  if ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_MONTA ) then
    with TSearchTouroAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin

               edPadraoNomeAnimalMacho.Text := ifThen ( Trim (  Result.FieldByName( 'NOMEESTABULO' ).asString ) = '',
                           Result.FieldByName( 'BRINCO' ).asString,
                           Result.FieldByName( 'NOMEESTABULO' ).asString ) ;

               FTipoAnimalPadrao      := lcbPadraoEvento.KeyValue ;
               FKAnimalMacho          := Result.FieldByName( 'KZOO_ANIMAL_MACHO' ).asString ;
               FTipoMacho             := tmTouro ;
               edPadraoNomeAnimalMacho.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end
  else if ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_INSEMINA ) then
    with TSearchSemenAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edPadraoNomeAnimalMacho.Text := ifThen ( Trim (  Result.FieldByName( 'NOMEESTABULO' ).asString ) = '',
                           Result.FieldByName( 'BRINCO' ).asString,
                           Result.FieldByName( 'NOMEESTABULO' ).asString ) ;
               FKAnimalMacho          := Result.FieldByName( 'KZOO_ANIMAL_MACHO' ).asString ;
               FTipoMacho             := tmSemen ;
               edPadraoNomeAnimalMacho.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end
  else if ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) then
    with TSearchEmbriao.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edPadraoNomeAnimalMacho.Text := ifThen ( Trim (  Result.FieldByName( 'NOMECOMPLETO' ).asString ) = '',
                           Result.FieldByName( 'BRINCO' ).asString,
                           Result.FieldByName( 'NOMECOMPLETO' ).asString ) ;
               FKAnimalMacho          := Result.FieldByName( 'KZOO_ANIMAL_EMBRIAO' ).asString ;
               FTipoMacho             := tmEmbriao ;
               edPadraoNomeAnimalMacho.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end      }


end;

procedure TZoo_ReproducaoCiosCoberturasWizard.SearchFuncionario(TextToSearch: string);
begin

      with TSearchFuncionarioAtivo.Create do
         try
            TextToFind := TextToSearch ;
            if Execute then
               begin
                 edPadraoNomeFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
                 FKFuncionario           := Result.FieldByName( 'KCAD_ENTIDADE' ).asString ;
                 edPadraoNomeFuncionario.Font.Color := clNavy ;
               end ;
         finally
            free ;
         end ;
end;


procedure TZoo_ReproducaoCiosCoberturasWizard.SetFuncionario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
//               edFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               Zoo_ReproducaoCiosCoberturasDatamodule.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.SetMacho(TextToSearch: string);
var LTipoMacho : TTipoMacho;
    LTipoEvento : Integer;
begin

  with TSearchMachosEmbriao.Create do
    try
       TextToFind := TextToSearch ;
       if Execute then
          begin

            if Result.FieldByName( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_EMBRIAO then
             begin
               LTipoEvento := _ST_TIPO_EVENTO_ZOO_IMPLANTE;
               LTipoMacho := tmEmbriao;
               lcEvento.KeyValue := _ST_STATUS_ANIMAL_EMBRIAO;
               lblEdMacho.Caption  := '  Touro (Embrião)' ;
             end
            else
            if Result.FieldByName( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_SEMEN then
             begin
               LTipoEvento := _ST_TIPO_EVENTO_ZOO_INSEMINA;
               LTipoMacho := tmSemen;
               lcEvento.KeyValue := _ST_STATUS_ANIMAL_SEMEN;
               lblEdMacho.Caption  := '  Touro (Sêmen)' ;
             end
            else
            if Result.FieldByName( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_TOURO then
             begin
               LTipoEvento := _ST_TIPO_EVENTO_ZOO_MONTA;
               LTipoMacho := tmTouro;
               lcEvento.KeyValue := _ST_STATUS_ANIMAL_TOURO;
               lblEdMacho.Caption  := '  Touro' ;
             end
            else
             begin
               LTipoMacho := tmUndefined;
               LTipoEvento := _ST_TIPO_EVENTO_ZOO_CIO;
               lcEvento.KeyValue := _ST_TIPO_EVENTO_ZOO_CIO;
             end;


            Zoo_ReproducaoCiosCoberturasDatamodule.SetMacho(Result.FieldByName( 'KZOO_ANIMAL' ).asString,
                  ifThen ( Trim (  Result.FieldByName( 'NOMEESTABULO' ).asString ) = '',
                           Result.FieldByName( 'BRINCO' ).asString,
                           Result.FieldByName( 'NOMEESTABULO' ).asString ), LTipoMacho, LTipoEvento ) ;
            if Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEMACHO.asString <> '' then
             begin
               edMacho.OnChange := nil;
               edMacho.Text := Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEMACHO.asString ;
               edMacho.OnChange := edMachoChange;
               edMacho.Font.Color := clNavy ;
             end;
          end ;
    finally
       free ;
    end;


  {if ( Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA ) then
    with TSearchTouroAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               Zoo_ReproducaoCiosCoberturasDatamodule.SetMacho(Result.FieldByName( 'KZOO_ANIMAL_MACHO' ).asString,
                  ifThen ( Trim (  Result.FieldByName( 'NOMEESTABULO' ).asString ) = '',
                           Result.FieldByName( 'BRINCO' ).asString,
                           Result.FieldByName( 'NOMEESTABULO' ).asString ), tmTouro ) ;
               edMacho.Text := Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEMACHO.asString ;
               edMacho.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end
  else if ( Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) then
    with TSearchSemenAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               Zoo_ReproducaoCiosCoberturasDatamodule.SetMacho(Result.FieldByName( 'KZOO_ANIMAL_MACHO' ).asString,
                  ifThen ( Trim (  Result.FieldByName( 'NOMEESTABULO' ).asString ) = '',
                           Result.FieldByName( 'BRINCO' ).asString,
                           Result.FieldByName( 'NOMEESTABULO' ).asString ), tmSemen ) ;
               edMacho.Text := Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEMACHO.asString ;
               edMacho.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end
  else if ( Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) then
    with TSearchEmbriao.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
                 Zoo_ReproducaoCiosCoberturasDatamodule.SetMacho(Result.FieldByName( 'KZOO_ANIMAL_EMBRIAO' ).asString,
                  ifThen ( Trim (  Result.FieldByName( 'NOMECOMPLETO' ).asString ) = '',
                           Result.FieldByName( 'BRINCO' ).asString,
                           Result.FieldByName( 'NOMECOMPLETO' ).asString ), tmEmbriao) ;
               edMacho.Text := Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEMACHO.asString ;
               edMacho.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;  }
end;


procedure TZoo_ReproducaoCiosCoberturasWizard.SetUseQuickInput(
  const Value: boolean);
begin
  FUseQuickInput := Value;
  GroupBox1.Visible := FUseQuickInput ;
  Zoo_ReproducaoCiosCoberturasDatamodule.UseQuickInput := FUseQuickInput ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.UpdateControlPadrao;
begin

   // painel padrao funcionario
// removido a peido do Augusto, conforme email
//   edPadraoNomeFuncionario.Visible :=
//         ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_CIO )
//      or ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) ;

//  if not edPadraoNomeFuncionario.Visible then
//    begin
//      pnlPadraoFuncionario.AutoSize := False ;
//      pnlPadraoFuncionario.width := 1 ;
//    end
//  else
//      pnlPadraoFuncionario.AutoSize := True ;

   // painel padrao evento
   {edPadraoNomeAnimalMacho.Visible :=
         ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_MONTA )
      or ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_IMPLANTE )
      or ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ;}

   {if (lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_CIO) and
      (edPadraoNomeAnimalMacho.Text <> '') then
     edPadraoNomeAnimalMacho.Clear;}


   if (FKAnimalMacho <> '') and
      ( FTipoAnimalPadrao <> lcbPadraoEvento.KeyValue ) then
      begin
        edPadraoNomeAnimalMacho.Text := '' ;
        edPadraoNomeAnimalMacho.Font.Color := clRed ;
        lcbPadraoEvento.KeyValue := _ST_TIPO_EVENTO_ZOO_CIO
      end;


   // painel padrao doses
   edPadraoDoses.Visible :=
         ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ;

   if not edPadraoDoses.Visible then
     begin
       pnlPadraoDoses.AutoSize := False ;
       pnlPadraoDoses.width := 1 ;
     end
   else
       pnlPadraoDoses.AutoSize := True ;


   pnlPadraoIATF.Visible :=  //FALSE and
           ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_IMPLANTE )
       {$IFDEF _IATF_MONTA}
       or  ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_MONTA    ) // added
       {$ENDIF _IATF_MONTA}
       or  ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ;

     //if not chkIATF.Visible then
     if not pnlPadraoIATF.Visible then
       begin
         pnlPadraoIATF.AutoSize := False ;
         pnlPadraoIATF.width := 1 ;
       end
     else
         pnlPadraoIATF.AutoSize := True ;


   Application.ProcessMessages ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.UpdateControls;
begin

  with Zoo_ReproducaoCiosCoberturasDatamodule do
   begin
     // painel   funcionario

(* removido a pedido do Augusto, conforme email
     edFuncionario.Visible :=
           ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_CIO )
        or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) ;
*)
     edFuncionario.Visible := FALSE ;

     if not edFuncionario.Visible then
       begin
         pnlFuncionario.AutoSize := False ;
         pnlFuncionario.width := 1 ;
       end
     else
         pnlFuncionario.AutoSize := True ;

     // painel   macho
     {edMacho.Visible :=
           ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA )
        or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE )
        or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ;}

     {if not edMacho.Visible then
       begin
         pnlMacho.AutoSize := False ;
         pnlMacho.width := 1 ;
       end
     else
       begin
         case ( cdsEventosReprodutivosTIPOEVENTO.asInteger ) of
           _ST_TIPO_EVENTO_ZOO_INSEMINA : lblEdMacho.Caption  := '  Touro (Sêmen)' ;
           _ST_TIPO_EVENTO_ZOO_MONTA    : lblEdMacho.Caption  := '  Touro' ;
           _ST_TIPO_EVENTO_ZOO_IMPLANTE  : lblEdMacho.Caption  := '  Touro (Embrião)' ;
         end;

         pnlMacho.AutoSize := True ;
       end;}

     if (cdsEventosReprodutivosTIPOEVENTO.AsInteger = _ST_TIPO_EVENTO_ZOO_CIO) and
        (not cdsEventosReprodutivosKZOO_ANIMAL_MACHO.IsNull) then
        //(edMacho.Text <> '') then
       begin
         try
           cdsEventosReprodutivos.DisableControls;
           edMacho.OnChange := nil;
           edMacho.Clear;
           cdsEventosReprodutivosDESC_PROTOCOLO_IATF.Clear;
           cdsEventosReprodutivosIATF.AsString := 'F';
           SetMacho('','',tmUndefined,_ST_TIPO_EVENTO_ZOO_CIO);
           lcEvento.KeyValue := _ST_TIPO_EVENTO_ZOO_CIO;
           edMacho.OnChange := edMachoChange;
           if (edMacho.CanFocus) and (edMacho.Showing) then
              edMacho.SetFocus;
         finally
           cdsEventosReprodutivos.EnableControls;
         end;
       end
     else
     if (cdsEventosReprodutivosTIPOEVENTO.AsInteger <> _ST_TIPO_EVENTO_ZOO_CIO) and
        (cdsEventosReprodutivosKZOO_ANIMAL_MACHO.AsString = '') then
       begin
         if (edMacho.CanFocus) and (edMacho.Showing) then
            edMacho.SetFocus;
       end;

     // painel   doses
     edDoses.Visible := FALSE and
           ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ;

     if not edDoses.Visible then
       begin
         pnlDoses.AutoSize := False ;
         pnlDoses.width := 1 ;
       end
     else
       begin
         pnlDoses.AutoSize := True ;
         //edDoses.Clear;
       end;

     if cdsEventosReprodutivosTIPOEVENTO.asInteger <> _ST_TIPO_EVENTO_ZOO_INSEMINA then
        edDoses.Clear;


     // painel   IATF
     //chkIATF.Visible := FALSE and
     pnlIATF.Visible :=  //FALSE and
           ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE )
       {$IFDEF _IATF_MONTA}
       or  ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA    ) // added
       {$ENDIF _IATF_MONTA}
       or  ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ;

     //if not chkIATF.Visible then
     if not pnlIATF.Visible then
       begin
         pnlIATF.AutoSize := False ;
         pnlIATF.width := 1 ;
       end
     else
         pnlIATF.AutoSize := True ;

   end;


   JvDBUltimGrid1.Refresh ;

   Application.ProcessMessages ;

end;


procedure TZoo_ReproducaoCiosCoberturasWizard.UpdateEdtBrinco;
begin
  edtBrinco.text := Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosBRINCO.asString ;
  edtBrinco.Font.color := clNavy ;
  FBrinco := Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosBRINCO.asString ;
  edtBrinco.SelectAll ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard.ValidateAborto;
var
 diasEvento, abortoComLactacaoPrimipara, abortoComLactacaoMultipara : integer ;
 isPrimipara, abrirLactacao : boolean ;
 diferencaDias : integer ;
begin
   if ( Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosKULTIMA_MONTA.isNull )
      or ( Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosPRENHEZ.isNull )
      or ( Trim ( Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosPRENHEZ.asString ) = '')
      or ( Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosPRENHEZ.asString = 'F' ) then
      exit ;

  Zoo_ReproducaoCiosCoberturasDatamodule.GetDadosAborto ( isPrimipara, abortoComLactacaoPrimipara, abortoComLactacaoMultipara ) ;

  diasEvento  := Trunc ( Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosDATAEVENTO.asDateTime - Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosULTIMA_MONTA.AsDateTime ) ;

  AbrirLactacao := False ;

  if Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosABRIRLACTACAO.AsString = '' then
   begin
  

     if (  isPrimipara and (diasEvento > abortoComLactacaoPrimipara) ) then
         AbrirLactacao :=  MessageDlg (
            Format ( 'Animal prenhe (primípara) com mais de %d dias de gestação.', [ abortoComLactacaoPrimipara ] )
           +#13#10'Será lançado um aborto.'#13#10'Deseja abrir lactação?', mtWarning, [mbYes, mbNo] ) = mrYes

     else if ( not isPrimipara and (diasEvento > abortoComLactacaoMultipara) ) then
         AbrirLactacao :=  MessageDlg (
            Format ( 'Animal prenhe (multípara) com mais de %d dias de gestação.', [ abortoComLactacaoMultipara ] )
           +#13#10'Será lançado um aborto.'#13#10'Deseja abrir lactação?', mtWarning, [mbYes, mbNo] ) = mrYes

     else
        MessageDlg ('Animal prenhe, será lançado um aborto.', mtWarning ) ;

     Zoo_ReproducaoCiosCoberturasDatamodule.AbrirLactacao( AbrirLactacao ) ;
   end;

end;

procedure TZoo_ReproducaoCiosCoberturasWizard.ValidateCamposFixo;
var
  ErrMsg : string ;
  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  if not FUseQuickInput then
     exit ;

  ErrMsg := '' ;

  if ( dePadraoDataEvento.date = 0 ) {or ( dePadraoDataEvento.date < ( date - 30  ) )} then
//     AddErr ( 'Data - em branco / inferior a 30 dias' ) ;
     AddErr ( 'Data - inválida' ) ;

  if ( dePadraoDataEvento.date >  date ) then
     AddErr ( 'Data - superior a data atual' ) ;

  if VarIsNull ( lcbPadraoEvento.KeyValue ) or VarIsEmpty ( lcbPadraoEvento.KeyValue ) then
     AddErr ( 'Evento' ) ;

  if (not ( VarIsNull ( lcbPadraoEvento.KeyValue ) or VarIsEmpty ( lcbPadraoEvento.KeyValue ) )) and ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_CIO ) then {CIO}
     begin
//       if FKFuncionario = '' then
//          AddErr ( 'Funcionário' ) ;
     end ;

  if ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_INSEMINA {INSEMINA} ) then
    begin
       if ( edPadraoDoses.asInteger < 1 ) then
          AddErr ( 'Doses para o evento' ) ;
       if FKAnimalMacho = '' then
          AddErr ( 'Semêm' ) ;
       if  ( chkPadraoIATF.Checked  ) and ( VarIsNull ( lcbPadraoProtocoloIATF.KeyValue  ) or VarIsEmpty( lcbPadraoProtocoloIATF.KeyValue  ) ) then
          AddErr ( 'Protocolo IATF' ) ;
    end ;

  if ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_MONTA {MONTA} ) then
    begin
       if FKAnimalMacho = '' then
          AddErr ( 'Touro' ) ;
    end ;

  if ( lcbPadraoEvento.KeyValue = _ST_TIPO_EVENTO_ZOO_IMPLANTE {IMPLANTE} ) then
    begin
       if FKAnimalMacho = '' then
          AddErr ( 'Embrião' ) ;
//       if FKFuncionario = '' then
//          AddErr ( 'Funcionário' ) ;
       if  ( chkPadraoIATF.Checked  ) and ( VarIsNull ( lcbPadraoProtocoloIATF.KeyValue  ) or VarIsEmpty( lcbPadraoProtocoloIATF.KeyValue  ) ) then
          AddErr ( 'Protocolo IATF' ) ;
    end ;

//  if VarIsNull ( lcbPadraoMuco.KeyValue  ) or VarIsEmpty( lcbPadraoMuco.KeyValue  ) then
//     AddErr ( 'Muco' ) ;


  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos na digitação rápida'#13#10#13#10 + ErrMsg );

end;

procedure TZoo_ReproducaoCiosCoberturasWizard.ValidFemeaNotIsNull;
begin
  if Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.IsNull then
   begin
    if ( EdtBrinco.CanFocus ) and ( EdtBrinco.Showing) then
       EdtBrinco.SetFocus;
    raise Warning.Create('Animal fêmea deve ser informado' );
   end;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard._actExecuteExecute(Sender: TObject);
begin
  {if not Zoo_ReproducaoCiosCoberturasDatamodule.CheckDoadoraReceptoraBeforeProcess then
  begin
    if edtBrinco.CanFocus then
      edtBrinco.SetFocus;
    Exit;
  end;}
  CheckEstoque ;
  edMacho.OnChange := nil;
  Zoo_ReproducaoCiosCoberturasDatamodule.ApplyUpdates ;
  edMacho.OnChange := edMachoChange;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_CiosCoberturas.CreateAndDispatch( self ) ; ;
  inherited;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and not Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivos.IsEmpty ;
end;

procedure TZoo_ReproducaoCiosCoberturasWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_ReproducaoCiosCoberturasWizard._actPriorExecute(Sender: TObject);
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
  RegisterClass ( TZoo_ReproducaoCiosCoberturasWizard ) ;

end.



