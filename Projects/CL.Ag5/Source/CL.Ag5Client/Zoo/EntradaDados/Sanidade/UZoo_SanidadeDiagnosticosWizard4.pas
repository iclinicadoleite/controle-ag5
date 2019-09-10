unit UZoo_SanidadeDiagnosticosWizard4;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  {Tc.MP.VCL.Controls.GDIButton,} System.Actions,
  Tc.VCL.Controls.GDIButton, Tc.VCL.Application, Vcl.Mask, Tc.VCL.Extended.Mask,
  Tc.VCL.Edits, UZoo_SanidadeDiagnosticosDatamodule4, Vcl.DBCtrls, CL.Ag5.NSMsgs,
  Data.DB, Tc.Data.DB.Helpers, JvExMask, JvToolEdit, Tc.VCL.Edits.DBControls, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Wrappers ;

type
  TZoo_SanidadeDiagnosticosWizard = class(T_FormWizard)
    TabSheet1: TTabSheet;
    chkQuickInput: TCheckBox;
    pnlQuickInput: TPanel;
    pnlIput: TPanel;
    gbQuickFields: TGroupBox;
    gbFields: TGroupBox;
    dePadraoDiagnostico: TTcDateEdit;
    lblEdPadraoData: TLabel;
    dblcDiagnosticoPadrao: TDBLookupComboBox;
    lblDiagnosticoPadrao: TLabel;
    dblcProtocoloPadrao: TDBLookupComboBox;
    lblProtocolosPadrao: TLabel;
    edtBrinco: TJvComboEdit;
    Label7: TLabel;
    dtsDiagnosticosAplicar: TDataSource;
    deData: TTcDBDateEdit;
    Label12: TLabel;
    dblcDiagnostico: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    dblcProtocolo: TDBLookupComboBox;
    JvDBUltimGrid1: TJvDBUltimGrid;
    BitBtn2: TTcGDIButton;
    lblQuartoPadrao: TLabel;
    dblcQuartoPadrao: TDBLookupComboBox;
    pnlQuartoPadrao: TPanel;
    pnlQuarto: TPanel;
    lblQuarto: TLabel;
    dblcQuarto: TDBLookupComboBox;
    dtsPadroes: TDataSource;
    dblcProtocoloGrid: TDBLookupComboBox;
    deDataGrid: TTcDBDateEdit;
    dblcDiagnosticoGrid: TDBLookupComboBox;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure chkQuickInputClick(Sender: TObject);
    procedure dblcDiagnosticoPadraoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcProtocoloPadraoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcQuartoPadraoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcDiagnosticoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcProtocoloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcQuartoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBrincoButtonClick(Sender: TObject);
    procedure edtBrincoEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dtsDiagnosticosAplicarDataChange(Sender: TObject; Field: TField);
    procedure _actExecuteExecute(Sender: TObject);
    procedure dblcProtocoloCloseUp(Sender: TObject);
    procedure deDataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure dtsPadroesDataChange(Sender: TObject; Field: TField);
    procedure dblcProtocoloGridDropDown(Sender: TObject);
    procedure dblcDiagnosticoGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcProtocoloGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Zoo_SanidadeDiagnosticosDatamodule : TZoo_SanidadeDiagnosticosDatamodule;
    FBrinco : String;
    procedure LeaveOrStayEdtBrinco;
    procedure ShowQuickFields;
    function SearchAnimalFemea ( TextToSearch : string) : boolean ;
    procedure AddByKey ( AKey : String ) ;

    procedure UpdateListProtocolosPadrao;

    procedure AddBrinco ;
    procedure UpdateEdtBrinco ;
    procedure SetFBrinco(const Value: String);
  public
    { Public declarations }
   // class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
    class function Execute ( ABrinco : string ) : boolean ;
    property Brinco : String read FBrinco write SetFBrinco;
  end;


implementation

uses SearchsZootecnico, CLAg5Types, Exceptions;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_SanidadeDiagnosticosWizard.AddBrinco;
begin

  try
    if ( FBrinco <> '' ) and
       Zoo_SanidadeDiagnosticosDatamodule.AddBrinco( FBrinco  ) then
      begin
        edtBrinco.Font.color := clNavy ;
        LeaveOrStayEdtBrinco;
        exit ;
      end ;

    if SearchAnimalFemea ( FBrinco ) then
      begin
        LeaveOrStayEdtBrinco;
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

procedure TZoo_SanidadeDiagnosticosWizard.AddByKey(AKey: String);
begin

  Zoo_SanidadeDiagnosticosDatamodule.AddByKey(
                        AKey
                      , FBrinco
  );

  LeaveOrStayEdtBrinco;

end;

procedure TZoo_SanidadeDiagnosticosWizard.BitBtn2Click(Sender: TObject);
begin
  Zoo_SanidadeDiagnosticosDatamodule.RemoveDiagnostico;
end;

procedure TZoo_SanidadeDiagnosticosWizard.chkQuickInputClick(Sender: TObject);
begin
  ShowQuickFields;
end;

constructor TZoo_SanidadeDiagnosticosWizard.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
  Zoo_SanidadeDiagnosticosDatamodule := TZoo_SanidadeDiagnosticosDatamodule.Create(Self);
  Zoo_SanidadeDiagnosticosDatamodule.OpenTables;
  dtsDiagnosticosAplicar.DataSet := Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicar;
  dtsPadroes.DataSet := Zoo_SanidadeDiagnosticosDatamodule.cdsPadroes;
  Zoo_SanidadeDiagnosticosDatamodule.UseQuickInput := False;
  ShowQuickFields;
  dblcProtocoloPadrao.Enabled := False;
  dblcProtocolo.Enabled := False;
  pnlQuartoPadrao.Visible := False;
  pnlQuarto.Visible := False ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcDiagnosticoGridKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcDiagnosticoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else
  if Key = VK_RETURN then
   begin
     Key:= 0;
     if dblcProtocolo.CanFocus then
       dblcProtocolo.SetFocus;
   end
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcDiagnosticoPadraoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] )
     and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcProtocoloCloseUp(Sender: TObject);
begin

  if not VarIsNull( dblcProtocolo.KeyValue  ) then
    begin
      if dblcQuarto.CanFocus then
        dblcQuarto.SetFocus;
    end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcProtocoloGridDropDown(
  Sender: TObject);
begin
  dblcProtocoloGrid.DropDownWidth := dblcProtocoloGrid.Width ;
  dblcProtocoloGrid.DropDownRows  := 21 ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcProtocoloGridKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcProtocoloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else
  if Key = VK_RETURN then
   begin
     Key:= 0;
     if dblcQuarto.CanFocus then
       dblcQuarto.SetFocus
     else if edtBrinco.CanFocus then
       edtBrinco.SetFocus;

   end;

end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcProtocoloPadraoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcQuartoPadraoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.deDataKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
   begin
     Key:= 0;
     if dblcDiagnostico.CanFocus then
       dblcDiagnostico.SetFocus;
   end
end;

procedure TZoo_SanidadeDiagnosticosWizard.dblcQuartoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else
  if Key = VK_RETURN then
   begin
     Key:= 0;
     if edtBrinco.CanFocus then
       edtBrinco.SetFocus;
   end
end;

destructor TZoo_SanidadeDiagnosticosWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TZoo_SanidadeDiagnosticosWizard.dtsDiagnosticosAplicarDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if not Assigned(Zoo_SanidadeDiagnosticosDatamodule) then
    exit;

  // refresh combobo
  dblcProtocolo.Enabled  := not (
       VarIsEmpty(dblcDiagnostico.KeyValue )
    or VarIsNull(dblcDiagnostico.KeyValue   )
  ) ;

  dblcProtocolo.KeyValue :=   null ;
  dblcProtocolo.KeyValue :=   Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKZOO_PROTOCOLO.asString ;

  pnlQuarto.Visible := Zoo_SanidadeDiagnosticosDatamodule.PorQuarto ;
  if not pnlQuarto.Visible then
    dblcQuarto.KeyValue := null;


  if (not Assigned ( Field )) and (edtBrinco.text <> Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBRINCO.asString ) then
      updateEdtBrinco ;


end;

procedure TZoo_SanidadeDiagnosticosWizard.dtsPadroesDataChange(Sender: TObject;
  Field: TField);
begin
  if Field = Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesKZOO_DIAGNOSTICO then
    UpdateListProtocolosPadrao ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edtBrincoButtonClick(Sender: TObject);
begin
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;

end;

procedure TZoo_SanidadeDiagnosticosWizard.edtBrincoEnter(Sender: TObject);
begin
  edtBrinco.SelectAll ;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edtBrincoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_RETURN then
   begin
     Key:= 0;
     if (FBrinco <> '') then
      begin
        LeaveOrStayEdtBrinco;
      end
   end;
end;

procedure TZoo_SanidadeDiagnosticosWizard.edtBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin

 if ( Key = #13  ) then
    begin
      Key := #0 ;
      FBrinco := edtBrinco.Text ;
      AddBrinco ;
    end;

end;

procedure TZoo_SanidadeDiagnosticosWizard.UpdateListProtocolosPadrao;
var
  LProtocolo : variant ;
begin

  dblcProtocoloPadrao.Enabled  := not (
       VarIsEmpty(dblcDiagnosticoPadrao.KeyValue )
    or VarIsNull(dblcDiagnosticoPadrao.KeyValue   )
  ) ;

  // refresh combobox
  dblcProtocoloPadrao.KeyValue :=   null ;
  dblcProtocoloPadrao.KeyValue :=   Zoo_SanidadeDiagnosticosDatamodule.cdsPadroesKZOO_PROTOCOLO.asString ;
  LProtocolo :=Zoo_SanidadeDiagnosticosDatamodule.GetProtocoloVinculadoDefault( dblcDiagnosticoPadrao.KeyValue );

  if not VarIsNull(LProtocolo) then
    dblcProtocoloPadrao.KeyValue := LProtocolo;



  pnlQuartoPadrao.Visible := Zoo_SanidadeDiagnosticosDatamodule.PorQuartoDefault;
  if not pnlQuartoPadrao.Visible then
    dblcQuartoPadrao.KeyValue := null;

end;

class function TZoo_SanidadeDiagnosticosWizard.Execute(
  ABrinco: string): boolean;
begin

  with Create ( nil ) do
    try
        Brinco := ABrinco ;
        edtBrinco.Text := FBrinco;
        edtBrinco.ReadOnly := True ;
        AddBrinco ;
        Result := ShowModal = mrOK ;
        if Result then
           {ThisForm.DoSomething}  ;
    finally
       free ;
    end ;
end;
procedure TZoo_SanidadeDiagnosticosWizard.LeaveOrStayEdtBrinco;
begin
  if (chkQuickInput.Checked) then
   begin
     if ( edtBrinco.CanFocus ) and ( edtBrinco.Showing ) then
      begin
       edtBrinco.SetFocus;
       edtBrinco.SelectAll;
      end;
   end
  else
   begin
     if (deData.CanFocus) and (deData.Showing) then
       deData.SetFocus;
   end;
end;

(*
class function TZoo_SanidadeDiagnosticosWizard.Execute : boolean;
var
  ThisForm: TZoo_SanidadeDiagnosticosWizard;
begin
  ThisForm := TZoo_SanidadeDiagnosticosWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;   *)

function TZoo_SanidadeDiagnosticosWizard.SearchAnimalFemea(
  TextToSearch: string): boolean;
var
  lFound : boolean ;
begin
    lFound := False ;
    with TSearchFemeaAtivo.Create do
       try
          TextToFind := FBrinco ;
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

procedure TZoo_SanidadeDiagnosticosWizard.SetFBrinco(const Value: String);
begin
  FBrinco := Value;
end;

procedure TZoo_SanidadeDiagnosticosWizard.ShowQuickFields;
begin
  Zoo_SanidadeDiagnosticosDatamodule.UseQuickInput :=  chkQuickInput.Checked ;


  pnlQuickInput.Visible := Zoo_SanidadeDiagnosticosDatamodule.UseQuickInput;
end;

procedure TZoo_SanidadeDiagnosticosWizard.UpdateEdtBrinco;
begin
  edtBrinco.text := Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBRINCO.asString ;
  edtBrinco.Font.color := clNavy ;
  FBrinco := Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBRINCO.asString ;
  edtBrinco.SelectAll ;
end;

procedure TZoo_SanidadeDiagnosticosWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_SanidadeDiagnosticosDatamodule.ApplyUpdates;
  Zoo_SanidadeDiagnosticosDatamodule.OpenDiagnosticosAplicar ;
  TCLAg5NSMsgEVT_Diagnosticos.CreateAndDispatch( self ) ;
  MessageDlg ( 'Diagnósticos inseridos com sucesso' ) ;
  inherited;
end;

procedure TZoo_SanidadeDiagnosticosWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled :=  not dtsDiagnosticosAplicar.DataSet.IsEmpty;
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

initialization
   RegisterClass ( TZoo_SanidadeDiagnosticosWizard ) ;

end.
