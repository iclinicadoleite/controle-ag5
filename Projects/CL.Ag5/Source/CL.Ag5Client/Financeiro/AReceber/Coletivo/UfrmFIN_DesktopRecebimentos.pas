unit UfrmFIN_DesktopRecebimentos ;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, UfrmGlb_Desktop, System.Actions, Tc.VCL.Application,
  JvComponentBase ;

type
  TfrmFIN_DesktopRecebimentos = class(TfrmGlb_Desktop)
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses
  UFin_BaixaAReceberWizard, UFIN_BaixaAReceberColetivo ;

{$R *.dfm}

constructor TfrmFIN_DesktopRecebimentos.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.AddTab ( 'Recebimentos' ) ;
  FDesktop.AddTab ( 'Recebimentos Coletivos' ) ;
end;

procedure TfrmFIN_DesktopRecebimentos.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TFIN_BaixaAReceberWizard ) ;
    1 :   FDesktop.NewForm( TFIN_BaixaAReceberColetivo ) ;
  end;
end;

initialization
  RegisterClass ( TfrmFIN_DesktopRecebimentos ) ;

end.
