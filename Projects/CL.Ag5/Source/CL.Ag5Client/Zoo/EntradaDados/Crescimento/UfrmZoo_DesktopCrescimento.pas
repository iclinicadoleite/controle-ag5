unit UfrmZoo_DesktopCrescimento;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, UfrmGlb_Desktop, System.Actions, Tc.VCL.Application,
  JvComponentBase ;

type
  TfrmZoo_DesktopCrescimento = class(TfrmGlb_Desktop)
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses UZoo_CrescimentoPesoAlturaWizard, UZoo_CrescimentoDesmameWizard ;

{$R *.dfm}

constructor TfrmZoo_DesktopCrescimento.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.AddTab ( 'Peso / Altura' ) ;
  FDesktop.AddTab ( 'Desmame' ) ;
end;

procedure TfrmZoo_DesktopCrescimento.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TZoo_CrescimentoPesoAlturaWizard ) ;
    1 :   FDesktop.NewForm( TZoo_CrescimentoDesmameWizard ) ;
  end;
end;

initialization
  RegisterClass ( TfrmZoo_DesktopCrescimento ) ;


end.
