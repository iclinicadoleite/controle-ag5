unit UZoo_DesktopAtividadesAExecutar;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfrmGlb_Desktop, VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, System.Actions, JvComponentBase, JvComCtrls,
  Tc.VCL.Application;

type
  TZoo_DesktopAtividadesAExecutar = class(TfrmGlb_Desktop)
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

uses UZoo_AtividadesCiosCoberturasWizard,
     UZoo_AtividadesPartosWizard,
     UZoo_AtividadesSecagemWizard,
     UZoo_AtividadesDesmameWizard,
     UZoo_AtividadesTarefasWizard  ;


{ TfrmGlb_Desktop1 }

constructor TZoo_DesktopAtividadesAExecutar.Create(AOwner: TComponent);
begin
  inherited;

  FDesktop.AddTab ( '&Cios / Coberturas' ) ;
  FDesktop.AddTab ( 'P&artos' ) ;
  FDesktop.AddTab ( '&Secagem' ) ;
  FDesktop.AddTab ( '&Desmame' ) ;
  FDesktop.AddTab ( '&Tarefas' ) ;

end;

destructor TZoo_DesktopAtividadesAExecutar.Destroy;
begin

  inherited;
end;

procedure TZoo_DesktopAtividadesAExecutar.GetClass(TabIndex: integer;
  out ObjectClass: TComponentClass);
begin
  inherited;
  case TabIndex of
    0 : FDesktop.NewForm( TZoo_AtividadesCiosCoberturasWizard ) ;
    1 : FDesktop.NewForm( TZoo_AtividadesPartosWizard ) ;
    2 : FDesktop.NewForm( TZoo_AtividadesSecagemWizard ) ;
    3 : FDesktop.NewForm( TZoo_AtividadesDesmameWizard ) ;
    4 : FDesktop.NewForm( TZoo_AtividadesTarefasWizard ) ;
  end;
end;

initialization
  RegisterClass ( TZoo_DesktopAtividadesAExecutar ) ;

end.
