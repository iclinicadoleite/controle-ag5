unit UfrmFIN_DesktopPagamentos ;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, UfrmGlb_Desktop, System.Actions, JvComponentBase,
  Tc.VCL.Application ;

type
  TfrmFIN_DesktopPagamentos = class(TfrmGlb_Desktop)
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses
  UFin_BaixaAPagarWizard, UFIN_BaixaAPagarColetivo ;


{$R *.dfm}

constructor TfrmFIN_DesktopPagamentos.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.AddTab ( 'Pagamentos' ) ;
  FDesktop.AddTab ( 'Pagamentos Coletivos' ) ;
end;

procedure TfrmFIN_DesktopPagamentos.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TFIN_BaixaAPagarWizard ) ;
    1 :   FDesktop.NewForm( TFIN_BaixaAPagarColetivo ) ;
  end;
end;

initialization
  RegisterClass ( TfrmFIN_DesktopPagamentos ) ;

end.
