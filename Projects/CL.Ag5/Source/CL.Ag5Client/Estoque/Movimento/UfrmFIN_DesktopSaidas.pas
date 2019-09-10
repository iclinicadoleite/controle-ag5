unit UfrmFIN_DesktopSaidas;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, UfrmGlb_Desktop, System.Actions, Tc.VCL.Application,
  JvComponentBase ;

type
  TfrmFIN_DesktopSaidas = class(TfrmGlb_Desktop)
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses UFIN_SaidaEstoqueWizard, UFIN_SaidaRapidaEstoqueWizard ;

{$R *.dfm}

constructor TfrmFIN_DesktopSaidas.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.AddTab ( 'Saída' ) ;
  FDesktop.AddTab ( 'Saída Rápida' ) ;
end;

procedure TfrmFIN_DesktopSaidas.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TFIN_SaidaEstoqueWizard ) ;
    1 :   FDesktop.NewForm( TFIN_SaidaRapidaEstoqueWizard ) ;
  end;
end;

initialization
  RegisterClass ( TfrmFIN_DesktopSaidas ) ;

end.
