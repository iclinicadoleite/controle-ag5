unit UZoo_DesktopAtividadesColetivo;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfrmGlb_Desktop, VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, System.Actions, JvComponentBase, JvComCtrls,
  Tc.VCL.Application;

type
  TZoo_DesktopAtividadesColetivo = class(TfrmGlb_Desktop)
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

uses UZoo_AtividadesPesagemLeiteWizard,
     UZoo_AtividadesPesoAlturaWizard ,
     UZoo_AtividadesListagensWizard,
     UZoo_AtividadesListagemVeterianariasDesktop;

{ TfrmGlb_Desktop2 }

constructor TZoo_DesktopAtividadesColetivo.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.AddTab ( 'Pesagem de Leite' ) ;
  FDesktop.AddTab ( 'Peso / Altura' ) ;
  FDesktop.AddTab ( 'Listagens' ) ;
  FDesktop.AddTab ( 'Listagens Veterinárias' ) ;
end;

destructor TZoo_DesktopAtividadesColetivo.Destroy;
begin

  inherited;
end;

procedure TZoo_DesktopAtividadesColetivo.GetClass(TabIndex: integer;
  out ObjectClass: TComponentClass);
begin
  inherited;
  case TabIndex of
    0 : FDesktop.NewForm( TZoo_AtividadesPesagemLeiteWizard ) ;
    1 : FDesktop.NewForm( TZoo_AtividadesPesoAlturaWizard ) ;
    2 : FDesktop.NewForm( TZoo_AtividadesListagensWizard ) ;
    3 : FDesktop.NewForm( TZoo_AtividadesListagemVeterianariasDesktop ) ;
  end;
end;

initialization
  RegisterClass ( TZoo_DesktopAtividadesColetivo ) ;

end.
