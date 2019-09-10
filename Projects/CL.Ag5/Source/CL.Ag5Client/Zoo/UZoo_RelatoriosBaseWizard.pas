unit UZoo_RelatoriosBaseWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, Wrappers ;

type
  TZoo_RelatoriosBaseWizard = class(T_FormWizard)
    pnlAlignSpace1: TPanel;
    pnlAlignSpace2: TPanel;
    pnlAlignTop: TPanel;
    pnlAlignBotton: TPanel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;


implementation

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_RelatoriosBaseWizard.Create(AOwner: TComponent);
begin
  inherited;
  pnlAlignTop.Color    := _pnlTitle.Color;
  pnlAlignBotton.Color := _pnlTitle.Color;
  pnlAlignSpace1.Color := _pnlTitle.Color;
  pnlAlignSpace2.Color := _pnlTitle.Color;
end;

class function TZoo_RelatoriosBaseWizard.Execute : boolean;
var
  ThisForm: TZoo_RelatoriosBaseWizard;
begin
  ThisForm := TZoo_RelatoriosBaseWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_RelatoriosBaseWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_RelatoriosBaseWizard._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TZoo_RelatoriosBaseWizard ) ;

end.
