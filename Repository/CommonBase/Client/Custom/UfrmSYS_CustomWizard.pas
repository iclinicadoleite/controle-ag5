unit UfrmSYS_CustomWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.MP.VCL.Controls.GDIButton, Wrappers, System.Actions,
  Tc.VCL.Controls.GDIButton ;

type
  TfrmCustomWizard = class(T_FormWizard)
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute : boolean ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

{ TfrmCustomWizard }

constructor TfrmCustomWizard.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
end;

destructor TfrmCustomWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TfrmCustomWizard.Execute : boolean;
var
  ThisForm: TfrmCustomWizard;
begin
  ThisForm := TfrmCustomWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TfrmCustomWizard._actNextExecute(Sender: TObject);
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

procedure TfrmCustomWizard._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TfrmCustomWizard ) ;

end.
