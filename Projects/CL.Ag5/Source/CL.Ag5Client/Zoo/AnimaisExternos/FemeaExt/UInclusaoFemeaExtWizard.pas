unit UInclusaoFemeaExtWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  VCL.DBCtrls, JvBaseEdits, JvDBControls, Tc.VCL.Edits, Tc.VCL.Edits.DBControls,
  VCL.Mask, JvExMask, JvToolEdit, Data.DB, Tc.Data.DB.Helpers, UZoo_AnimaisExternosFemeaDatamodule,
  Tc.VCL.Controls.GDIButton, System.Actions, Wrappers ;

type
  TInclusaoFemeaExtWizard = class(T_FormWizard)
    dtsFicha: TDataSource;
    TabSheet1: TTabSheet;
    dtsDadosFemea: TDataSource;
    Label21: TLabel;
    GroupBox2: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit7: TDBEdit;
    JvDBDateEdit1: TTcDBDateEdit;
    JvDBCalcEdit2: TJvDBCalcEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit10: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    JvDBDateEdit2: TTcDBDateEdit;
    DBEdit12: TDBEdit;
    DBEdit4: TDBEdit;
    Label52: TLabel;
    Label2: TLabel;
    Label33: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    dtsLinhagem: TDataSource;
    GroupBox3: TGroupBox;
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
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit9: TDBEdit;
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
    Zoo_AnimaisExternosFemeaDatamodule : TZoo_AnimaisExternosFemeaDatamodule ;
    procedure SearchPai ( TextToSearch : string);
    procedure SearchMae ( TextToSearch : string);
  public
    { Public declarations }
    class function Execute ( AZoo_AnimaisExternosFemeaDatamodule : TZoo_AnimaisExternosFemeaDatamodule ) : boolean;
  end;


implementation

uses SearchsZootecnico ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TInclusaoFemeaExtWizard.dbEdtComposicaoRacaButtonClick(Sender: TObject);
begin
  Zoo_AnimaisExternosFemeaDatamodule.UpdateRacasGrauSangue ;
  if Zoo_AnimaisExternosFemeaDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     Zoo_AnimaisExternosFemeaDatamodule.SetComposicaoRacas ;
end;

procedure TInclusaoFemeaExtWizard.dbEdtComposicaoRacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    Zoo_AnimaisExternosFemeaDatamodule.UpdateRacasGrauSangue ;
    if Zoo_AnimaisExternosFemeaDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
       Zoo_AnimaisExternosFemeaDatamodule.SetComposicaoRacas ;
   end;
end;

procedure TInclusaoFemeaExtWizard.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

procedure TInclusaoFemeaExtWizard.edMaeButtonClick(Sender: TObject);
begin
  inherited;
  SearchMae ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TInclusaoFemeaExtWizard.edPaiButtonClick(Sender: TObject);
begin
  SearchPai ( TJvDBComboEdit ( Sender ).Text ) ;
end;

class function TInclusaoFemeaExtWizard.Execute( AZoo_AnimaisExternosFemeaDatamodule : TZoo_AnimaisExternosFemeaDatamodule ) : boolean;
var
  ThisForm: TInclusaoFemeaExtWizard;
begin
  ThisForm := TInclusaoFemeaExtWizard.Create ( nil ) ;
  try
      ThisForm.Zoo_AnimaisExternosFemeaDatamodule := AZoo_AnimaisExternosFemeaDatamodule  ;
      ThisForm.dtsFicha.dataSet := ThisForm.Zoo_AnimaisExternosFemeaDatamodule.cdsAnimal ;
      ThisForm.dtsDadosFemea.dataSet  := ThisForm.Zoo_AnimaisExternosFemeaDatamodule.cdsDadosFemea ;
      ThisForm.dtsLinhagem.dataSet    := ThisForm.Zoo_AnimaisExternosFemeaDatamodule.cdsLinhagem ;
      ThisForm.Zoo_AnimaisExternosFemeaDatamodule.GrauDeSangue.GetGrausSangue ( ThisForm.dbxGrauSangue.Items ) ;
      ThisForm.Zoo_AnimaisExternosFemeaDatamodule.NewRecord ;
      Result := ThisForm.ShowModal = mrOK ;
      if not Result then
         ThisForm.Zoo_AnimaisExternosFemeaDatamodule.CancelUpdates ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TInclusaoFemeaExtWizard.SearchMae(TextToSearch: string);
begin
  with Zoo_AnimaisExternosFemeaDatamodule, TSearchMae.Create do
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

procedure TInclusaoFemeaExtWizard.SearchPai(TextToSearch: string);
begin
  with Zoo_AnimaisExternosFemeaDatamodule, TSearchPai.Create do
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

procedure TInclusaoFemeaExtWizard._actExecuteExecute(Sender: TObject);
begin
  self.Zoo_AnimaisExternosFemeaDatamodule.ApplyUpdates ;
  inherited;
end;

procedure TInclusaoFemeaExtWizard._actNextExecute(Sender: TObject);
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

procedure TInclusaoFemeaExtWizard._actPriorExecute(Sender: TObject);
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
