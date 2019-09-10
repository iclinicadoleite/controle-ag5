unit UInclusaoMachoWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  JvDBControls, JvToolEdit, JvBaseEdits, VCL.DBCtrls, JvExMask,
  Tc.VCL.Edits, Tc.VCL.Edits.DBControls, VCL.Mask, Data.DB, Tc.Data.DB.Helpers,
  UZoo_BancoDadosMachoDatamodule, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers  ;

type
  TInclusaoMachoWizard = class(T_FormWizard)
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
    Zoo_BancoDadosMachoDatamodule : TZoo_BancoDadosMachoDatamodule ;
    procedure SearchPai ( TextToSearch : string);
    procedure SearchMae ( TextToSearch : string);
  public
    { Public declarations }
    class function Execute ( AZoo_BancoDadosMachoDatamodule : TZoo_BancoDadosMachoDatamodule ) : boolean; reintroduce ;
  end;


implementation

uses SearchsZootecnico ;

{$R *.dfm}

{ TInclusaoMachoWizard }

procedure TInclusaoMachoWizard.dbEdtComposicaoRacaButtonClick(Sender: TObject);
begin
  Zoo_BancoDadosMachoDatamodule.UpdateRacasGrauSangue ;
  if Zoo_BancoDadosMachoDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     Zoo_BancoDadosMachoDatamodule.SetComposicaoRacas ;
end;

procedure TInclusaoMachoWizard.dbEdtComposicaoRacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    Zoo_BancoDadosMachoDatamodule.UpdateRacasGrauSangue ;
    if Zoo_BancoDadosMachoDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
       Zoo_BancoDadosMachoDatamodule.SetComposicaoRacas ;
   end;
end;

procedure TInclusaoMachoWizard.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

procedure TInclusaoMachoWizard.edMaeButtonClick(Sender: TObject);
begin
  SearchMae ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TInclusaoMachoWizard.edPaiButtonClick(Sender: TObject);
begin
  SearchPai ( TJvDBComboEdit ( Sender ).Text ) ;
end;

class function TInclusaoMachoWizard.Execute ( AZoo_BancoDadosMachoDatamodule : TZoo_BancoDadosMachoDatamodule ) : boolean;
var
  ThisForm: TInclusaoMachoWizard;
begin
  ThisForm := TInclusaoMachoWizard.Create ( nil ) ;
  try
      ThisForm.Zoo_BancoDadosMachoDatamodule := AZoo_BancoDadosMachoDatamodule  ;
      ThisForm.dtsFicha.dataSet := ThisForm.Zoo_BancoDadosMachoDatamodule.cdsAnimal ;
      ThisForm.dtsDadosMacho.dataSet  := ThisForm.Zoo_BancoDadosMachoDatamodule.cdsDadosMacho ;
      ThisForm.dtsLinhagem.dataSet    := ThisForm.Zoo_BancoDadosMachoDatamodule.cdsLinhagem ;
      ThisForm.Zoo_BancoDadosMachoDatamodule.GrauDeSangue.GetGrausSangue ( ThisForm.dbxGrauSangue.Items ) ;
      ThisForm.Zoo_BancoDadosMachoDatamodule.NewRecord ;
      Result := ThisForm.ShowModal = mrOK ;
      if not Result then
         ThisForm.Zoo_BancoDadosMachoDatamodule.CancelUpdates ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TInclusaoMachoWizard.SearchMae(TextToSearch: string);
begin
  with Zoo_BancoDadosMachoDatamodule, TSearchMae.Create do
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

procedure TInclusaoMachoWizard.SearchPai(TextToSearch: string);
begin
  with Zoo_BancoDadosMachoDatamodule, TSearchPai.Create do
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

procedure TInclusaoMachoWizard._actExecuteExecute(Sender: TObject);
begin
  self.Zoo_BancoDadosMachoDatamodule.ApplyUpdates ;
  inherited;
end;

procedure TInclusaoMachoWizard._actNextExecute(Sender: TObject);
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

procedure TInclusaoMachoWizard._actPriorExecute(Sender: TObject);
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
