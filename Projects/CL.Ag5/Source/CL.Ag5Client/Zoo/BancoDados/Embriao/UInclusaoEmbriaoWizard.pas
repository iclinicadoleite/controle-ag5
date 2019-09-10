unit UInclusaoEmbriaoWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Data.DB, Tc.Data.DB.Helpers, JvDBControls, Tc.VCL.Edits, Tc.VCL.Edits.DBControls,
  JvExMask, JvToolEdit, JvBaseEdits, VCL.DBCtrls, VCL.Mask,
  UZoo_BancoDadosEmbriaoDatamodule, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers  ;

type
  TInclusaoEmbriaoWizard = class(T_FormWizard)
    dtsLista: TDataSource;
    dtsFicha: TDataSource;
    dtsDadosEmbriao: TDataSource;
    TabSheet1: TTabSheet;
    Label21: TLabel;
    Label23: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    JvDBCalcEdit1: TJvDBCalcEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    JvDBCalcEdit2: TJvDBCalcEdit;
    JvDBDateEdit1: TTcDBDateEdit;
    DBEdit7: TDBEdit;
    GroupBox3: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    edPai: TJvDBComboEdit;
    edMae: TJvDBComboEdit;
    Label29: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    Label2: TLabel;
    dbxGrauSangue: TDBComboBox;
    dbEdtComposicaoRaca: TJvDBComboEdit;
    dtsLinhagem: TDataSource;
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
    Zoo_BancoDadosEmbriaoDatamodule : TZoo_BancoDadosEmbriaoDatamodule ;
    procedure SearchPai ( TextToSearch : string);
    procedure SearchMae ( TextToSearch : string);
  public
    { Public declarations }
    class function Execute ( AZoo_BancoDadosEmbriaoDatamodule : TZoo_BancoDadosEmbriaoDatamodule ) : boolean; reintroduce ;
  end;


implementation

Uses SearchsZootecnico ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TInclusaoEmbriaoWizard.dbEdtComposicaoRacaButtonClick(
  Sender: TObject);
begin
  Zoo_BancoDadosEmbriaoDatamodule.UpdateRacasGrauSangue ;
  if Zoo_BancoDadosEmbriaoDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     Zoo_BancoDadosEmbriaoDatamodule.SetComposicaoRacas ;
end;

procedure TInclusaoEmbriaoWizard.dbEdtComposicaoRacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    Zoo_BancoDadosEmbriaoDatamodule.UpdateRacasGrauSangue ;
    if Zoo_BancoDadosEmbriaoDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
       Zoo_BancoDadosEmbriaoDatamodule.SetComposicaoRacas ;
   end;
end;

procedure TInclusaoEmbriaoWizard.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

procedure TInclusaoEmbriaoWizard.edMaeButtonClick(Sender: TObject);
begin
  SearchMae ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TInclusaoEmbriaoWizard.edPaiButtonClick(Sender: TObject);
begin
  SearchPai ( TJvDBComboEdit ( Sender ).Text ) ;
end;

class function TInclusaoEmbriaoWizard.Execute ( AZoo_BancoDadosEmbriaoDatamodule : TZoo_BancoDadosEmbriaoDatamodule ) : boolean;
var
  ThisForm: TInclusaoEmbriaoWizard;
begin
  ThisForm := TInclusaoEmbriaoWizard.Create ( nil ) ;
  try
      ThisForm.Zoo_BancoDadosEmbriaoDatamodule := AZoo_BancoDadosEmbriaoDatamodule  ;
      ThisForm.dtsFicha.dataSet         := ThisForm.Zoo_BancoDadosEmbriaoDatamodule.cdsAnimal ;
      ThisForm.dtsDadosEmbriao.dataSet  := ThisForm.Zoo_BancoDadosEmbriaoDatamodule.cdsDadosEmbriao ;
      ThisForm.dtsLinhagem.dataSet      := ThisForm.Zoo_BancoDadosEmbriaoDatamodule.cdsLinhagem ;
      ThisForm.Zoo_BancoDadosEmbriaoDatamodule.GrauDeSangue.GetGrausSangue ( ThisForm.dbxGrauSangue.Items ) ;
      ThisForm.Zoo_BancoDadosEmbriaoDatamodule.NewRecord ;
      Result := ThisForm.ShowModal = mrOK ;
      if not Result then
         ThisForm.Zoo_BancoDadosEmbriaoDatamodule.CancelUpdates ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TInclusaoEmbriaoWizard.SearchMae(TextToSearch: string);
begin
  with Zoo_BancoDadosEmbriaoDatamodule, TSearchMae.Create do
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

procedure TInclusaoEmbriaoWizard.SearchPai(TextToSearch: string);
begin
  with Zoo_BancoDadosEmbriaoDatamodule, TSearchPai.Create do
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

procedure TInclusaoEmbriaoWizard._actExecuteExecute(Sender: TObject);
begin
  self.Zoo_BancoDadosEmbriaoDatamodule.ApplyUpdates ;
  inherited;
end;

procedure TInclusaoEmbriaoWizard._actNextExecute(Sender: TObject);
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

procedure TInclusaoEmbriaoWizard._actPriorExecute(Sender: TObject);
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

