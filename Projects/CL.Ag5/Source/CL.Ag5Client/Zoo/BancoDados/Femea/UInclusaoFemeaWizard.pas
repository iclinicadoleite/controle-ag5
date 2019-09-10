unit UInclusaoFemeaWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  VCL.DBCtrls, JvBaseEdits, JvDBControls, Tc.VCL.Edits, Tc.VCL.Edits.DBControls,
  VCL.Mask, JvExMask, JvToolEdit, Data.DB, Tc.Data.DB.Helpers, UZoo_BancoDadosFemeaDatamodule,
  Tc.VCL.Controls.GDIButton, System.Actions, Wrappers, Tc.VCL.Extended.Mask, Tc.VCL.Application ;

type
  TInclusaoFemeaWizard = class(T_FormWizard)
    dtsFicha: TDataSource;
    TabSheet1: TTabSheet;
    dtsDadosFemea: TDataSource;
    gbxOrigem: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit7: TDBEdit;
    JvDBDateEdit1: TTcDBDateEdit;
    JvDBCalcEdit2: TJvDBCalcEdit;
    dtsLinhagem: TDataSource;
    gbxPedigree: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edPai: TJvDBComboEdit;
    edMae: TJvDBComboEdit;
    dbEdtComposicaoRaca: TJvDBComboEdit;
    dbxGrauSangue: TDBComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    gbxDadosCadastrais: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label6: TLabel;
    Label52: TLabel;
    dbchkOriginadoEmbriao: TDBCheckBox;
    dbeBrinco: TDBEdit;
    dbeIdade: TDBEdit;
    dbeNome: TDBEdit;
    dbeNomeEstabulo: TDBEdit;
    dbeRegistro: TDBEdit;
    dblcDoadoraReceptora: TDBLookupComboBox;
    dblcStatus: TDBLookupComboBox;
    deNascimento: TTcDBDateEdit;
    gbxManejo: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbeLote: TDBEdit;
    dbeLoteVirtual1: TDBEdit;
    dbeLoteVirtual2: TDBEdit;
    dbeLoteVirtual3: TDBEdit;
    dbeRetiro: TDBEdit;
    gbxControleLeiteiro: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    dbeSCL: TDBEdit;
    dbeSISBOV: TDBEdit;
    Bevel1: TBevel;
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
    Zoo_BancoDadosFemeaDatamodule : TZoo_BancoDadosFemeaDatamodule ;
    procedure SearchPai ( TextToSearch : string);
    procedure SearchMae ( TextToSearch : string);
  public
    { Public declarations }
    class function Execute ( AZoo_BancoDadosFemeaDatamodule : TZoo_BancoDadosFemeaDatamodule ) : boolean; reintroduce ;
  end;


implementation

uses SearchsZootecnico ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TInclusaoFemeaWizard.dbEdtComposicaoRacaButtonClick(Sender: TObject);
begin
  Zoo_BancoDadosFemeaDatamodule.UpdateRacasGrauSangue ;
  if Zoo_BancoDadosFemeaDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     Zoo_BancoDadosFemeaDatamodule.SetComposicaoRacas ;
end;

procedure TInclusaoFemeaWizard.dbEdtComposicaoRacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    Zoo_BancoDadosFemeaDatamodule.UpdateRacasGrauSangue ;
    if Zoo_BancoDadosFemeaDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
       Zoo_BancoDadosFemeaDatamodule.SetComposicaoRacas ;
   end;
end;

procedure TInclusaoFemeaWizard.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

procedure TInclusaoFemeaWizard.edMaeButtonClick(Sender: TObject);
begin
  inherited;
  SearchMae ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TInclusaoFemeaWizard.edPaiButtonClick(Sender: TObject);
begin
  SearchPai ( TJvDBComboEdit ( Sender ).Text ) ;
end;

class function TInclusaoFemeaWizard.Execute( AZoo_BancoDadosFemeaDatamodule : TZoo_BancoDadosFemeaDatamodule ) : boolean;
var
  ThisForm: TInclusaoFemeaWizard;
begin
  ThisForm := TInclusaoFemeaWizard.Create ( nil ) ;
  try
      ThisForm.Zoo_BancoDadosFemeaDatamodule := AZoo_BancoDadosFemeaDatamodule  ;
      ThisForm.dtsFicha.dataSet       := ThisForm.Zoo_BancoDadosFemeaDatamodule.cdsAnimal ;
      ThisForm.dtsDadosFemea.dataSet  := ThisForm.Zoo_BancoDadosFemeaDatamodule.cdsDadosFemea ;
      ThisForm.dtsLinhagem.dataSet    := ThisForm.Zoo_BancoDadosFemeaDatamodule.cdsLinhagem ;
      ThisForm.Zoo_BancoDadosFemeaDatamodule.GrauDeSangue.GetGrausSangue ( ThisForm.dbxGrauSangue.Items ) ;
      ThisForm.Zoo_BancoDadosFemeaDatamodule.NewRecord ;
      ThisForm.Zoo_BancoDadosFemeaDatamodule.FilterStatusOptions ;
      Result := ThisForm.ShowModal = mrOK ;
      ThisForm.Zoo_BancoDadosFemeaDatamodule.ResetStatusOptions ;
      if not Result then
         ThisForm.Zoo_BancoDadosFemeaDatamodule.CancelUpdates ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TInclusaoFemeaWizard.SearchMae(TextToSearch: string);
begin
  with Zoo_BancoDadosFemeaDatamodule, TSearchMae.Create do
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

procedure TInclusaoFemeaWizard.SearchPai(TextToSearch: string);
begin
  with Zoo_BancoDadosFemeaDatamodule, TSearchPai.Create do
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

procedure TInclusaoFemeaWizard._actExecuteExecute(Sender: TObject);
begin
  self.Zoo_BancoDadosFemeaDatamodule.ApplyUpdates ;
  inherited;
end;

procedure TInclusaoFemeaWizard._actNextExecute(Sender: TObject);
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

procedure TInclusaoFemeaWizard._actPriorExecute(Sender: TObject);
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
