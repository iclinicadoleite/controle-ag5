unit UZoo_AtividadesReproducaoDesktop;

//** deprecated

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, UfrmGlb_Desktop, System.Actions, Tc.VCL.Application,
  JvComponentBase ;

type
  TZoo_AtividadesReproducaoDesktop = class(TfrmGlb_Desktop)
  protected
    { Protected declarations }
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;


implementation

uses UZoo_AtividadesCiosCoberturasWizard,
     UZoo_AtividadesPartosWizard ;



{$R *.dfm}

constructor TZoo_AtividadesReproducaoDesktop.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.AddTab ( 'Cios / Coberturas' ) ;
  FDesktop.AddTab ( 'Partos' ) ;
end;

procedure TZoo_AtividadesReproducaoDesktop.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TZoo_AtividadesCiosCoberturasWizard ) ;
    1 :   FDesktop.NewForm( TZoo_AtividadesPartosWizard ) ;
  end;
end;

initialization
  RegisterClass ( TZoo_AtividadesReproducaoDesktop ) ;


end.
