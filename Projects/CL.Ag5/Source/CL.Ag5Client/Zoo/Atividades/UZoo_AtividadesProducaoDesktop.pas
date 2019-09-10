unit UZoo_AtividadesProducaoDesktop;

//** deprecated

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, UfrmGlb_Desktop, System.Actions, Tc.VCL.Application,
  JvComponentBase ;

type
  TZoo_AtividadesProducaoDesktop = class(TfrmGlb_Desktop)
  protected
    { Protected declarations }
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses UZoo_AtividadesPesagemLeiteWizard, UZoo_AtividadesSecagemWizard ;

{$R *.dfm}

constructor TZoo_AtividadesProducaoDesktop.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.AddTab ( 'Pesagem de Leite' ) ;
  FDesktop.AddTab ( 'Secagem' ) ;
end;

procedure TZoo_AtividadesProducaoDesktop.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TZoo_AtividadesPesagemLeiteWizard ) ;
    1 :   FDesktop.NewForm( TZoo_AtividadesSecagemWizard ) ;
  end;
end;

initialization
  RegisterClass ( TZoo_AtividadesProducaoDesktop ) ;


end.
