unit UInclusaoMachoExtWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  JvDBControls, JvToolEdit, JvBaseEdits, VCL.DBCtrls, JvExMask,
  Tc.VCL.Edits, Tc.VCL.Edits.DBControls, VCL.Mask, Data.DB, Tc.Data.DB.Helpers,
  UZoo_AnimaisExternosMachoDatamodule, Tc.VCL.Controls.GDIButton,
  System.Actions, Wrappers  ;

type
  TInclusaoMachoExtWizard = class(T_FormWizard)
    TabSheet1: TTabSheet;
    dtsLista: TDataSource;
    dtsFicha: TDataSource;
    dtsDadosMacho: TDataSource;
    Label24: TLabel;
    Label25: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label36: TLabel;
    DBEdit4: TDBEdit;
    JvDBDateEdit2: TTcDBDateEdit;
    LinkLabel1: TLinkLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    JvDBDateEdit1: TTcDBDateEdit;
    DBEdit7: TDBEdit;
    JvDBCalcEdit2: TJvDBCalcEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    JvDBCalcEdit1: TJvDBCalcEdit;
    GroupBox3: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    edPai: TJvDBComboEdit;
    edMae: TJvDBComboEdit;
    dtsLinhagem: TDataSource;
    Label29: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label4: TLabel;
    dbxGrauSangue: TDBComboBox;
    dbEdtComposicaoRaca: TJvDBComboEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    dbchkOriginadoEmbriao: TDBCheckBox;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edPaiButtonClick(Sender: TObject);
    procedure edMaeButtonClick(Sender: TObject);
    procedure dbEdtComposicaoRacaButtonClick(Sender: TObject);
    procedure dbEdtComposicaoRacaKeyPress(Sender: TObject; var Key: Char);
    procedure dbxGrauSangueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  private
    { Private declarations }
    Zoo_AnimaisExternosMachoDatamodule : TZoo_AnimaisExternosMachoDatamodule ;
    procedure SearchPai ( TextToSearch : string);
    procedure SearchMae ( TextToSearch : string);
  public
    { Public declarations }
    class function Execute ( AZoo_AnimaisExternosMachoDatamodule : TZoo_AnimaisExternosMachoDatamodule ) : boolean;
  end;


implementation

uses SearchsZootecnico ;

{$R *.dfm}

{ TInclusaoMachoExtWizard }

procedure TInclusaoMachoExtWizard.dbEdtComposicaoRacaButtonClick(Sender: TObject);
begin
  Zoo_AnimaisExternosMachoDatamodule.UpdateRacasGrauSangue ;
  if Zoo_AnimaisExternosMachoDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     Zoo_AnimaisExternosMachoDatamodule.SetComposicaoRacas ;
end;

procedure TInclusaoMachoExtWizard.dbEdtComposicaoRacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    Zoo_AnimaisExternosMachoDatamodule.UpdateRacasGrauSangue ;
    if Zoo_AnimaisExternosMachoDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
       Zoo_AnimaisExternosMachoDatamodule.SetComposicaoRacas ;
   end;
end;

procedure TInclusaoMachoExtWizard.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

procedure TInclusaoMachoExtWizard.edMaeButtonClick(Sender: TObject);
begin
  SearchMae ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TInclusaoMachoExtWizard.edPaiButtonClick(Sender: TObject);
begin
  SearchPai ( TJvDBComboEdit ( Sender ).Text ) ;
end;

class function TInclusaoMachoExtWizard.Execute ( AZoo_AnimaisExternosMachoDatamodule : TZoo_AnimaisExternosMachoDatamodule ) : boolean;
var
  ThisForm: TInclusaoMachoExtWizard;
begin
  ThisForm := TInclusaoMachoExtWizard.Create ( nil ) ;
  try
      ThisForm.Zoo_AnimaisExternosMachoDatamodule := AZoo_AnimaisExternosMachoDatamodule  ;
      ThisForm.dtsFicha.dataSet       := ThisForm.Zoo_AnimaisExternosMachoDatamodule.cdsAnimal ;
      ThisForm.dtsDadosMacho.dataSet  := ThisForm.Zoo_AnimaisExternosMachoDatamodule.cdsDadosMacho ;
      ThisForm.dtsLinhagem.dataSet    := ThisForm.Zoo_AnimaisExternosMachoDatamodule.cdsLinhagem ;
      ThisForm.Zoo_AnimaisExternosMachoDatamodule.GrauDeSangue.GetGrausSangue ( ThisForm.dbxGrauSangue.Items ) ;
      ThisForm.Zoo_AnimaisExternosMachoDatamodule.NewRecord ;
      Result := ThisForm.ShowModal = mrOK ;
      if not Result then
         ThisForm.Zoo_AnimaisExternosMachoDatamodule.CancelUpdates ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TInclusaoMachoExtWizard.SearchMae(TextToSearch: string);
begin
  with Zoo_AnimaisExternosMachoDatamodule, TSearchMae.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
         SetMae ( Result.FieldByName( 'KZOO_ANIMAL' ).asString,
                  Result.FieldByName( 'NOMEESTABULO' ).asString,
                  Result.FieldByName( 'GRAUSANGUE' ).asString,
                  Result.FieldByName( 'COMPOSICAORACA' ).asString  ) ;
    finally
      free ;
    end ;
end;

procedure TInclusaoMachoExtWizard.SearchPai(TextToSearch: string);
begin
  with Zoo_AnimaisExternosMachoDatamodule, TSearchPai.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
         SetPai ( Result.FieldByName( 'KZOO_ANIMAL' ).asString,
                  Result.FieldByName( 'NOMEESTABULO' ).asString,
                  Result.FieldByName( 'GRAUSANGUE' ).asString,
                  Result.FieldByName( 'COMPOSICAORACA' ).asString  ) ;
    finally
      free ;
    end ;
end;

procedure TInclusaoMachoExtWizard._actExecuteExecute(Sender: TObject);
begin
  self.Zoo_AnimaisExternosMachoDatamodule.ApplyUpdates ;
  inherited;
end;

procedure TInclusaoMachoExtWizard._actNextExecute(Sender: TObject);
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

procedure TInclusaoMachoExtWizard._actPriorExecute(Sender: TObject);
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
