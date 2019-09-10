unit UZoo_AtividadesListagemVeterianariasDesktop;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, TabControlDeskTop, JvPanel, UfrmGlb_Desktop, VCL.ComCtrls, JvExComCtrls, JvComCtrls,
  System.Actions, Tc.VCL.Application, JvComponentBase;

type
  TZoo_AtividadesListagemVeterianariasDesktop = class(TfrmGlb_Desktop)
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;


implementation

uses {UfwzZoo_CiosCoberturas, UfwzZoo_DiagnosticosGestacao,}
  UZoo_AtividadesLVCiclosAnormaisWizard, UZoo_AtividadesLVDiagnosticoPrenhezWizard2,
  UZoo_AtividadesLVListagemGeralWizard2, UZoo_AtividadesLVNovilhasNaoPrenhesWizard,
  UZoo_AtividadesLVPosPartoSCioWizard, UZoo_AtividadesLVRecemParidosWizard,
  UZoo_AtividadesLVReexaminarWizard ;

{$R *.dfm}

constructor TZoo_AtividadesListagemVeterianariasDesktop.Create(
  AOwner: TComponent);
begin
  inherited;
  FDesktop.AddTab ( 'Recém paridas' ) ;
//  FDesktop.AddTab ( 'Reexaminar' ) ;
  FDesktop.AddTab ( 'Pós Parto sem Cio' ) ;
  FDesktop.AddTab ( 'Ciclos Anormais' ) ;
  FDesktop.AddTab ( 'Diagnósticos de Prenhez' ) ;
  FDesktop.TabSet.TabWidth := 165;
  FDesktop.AddTab ( 'Novilhas não prenhe' ) ;
  FDesktop.AddTab ( 'Listagem Geral' ) ;
end;

procedure TZoo_AtividadesListagemVeterianariasDesktop.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 : FDesktop.NewForm( TZoo_AtividadesLVRecemParidosWizard        ) ;
//    1 : FDesktop.NewForm( TZoo_AtividadesLVReexaminarWizard          ) ;
    1 : FDesktop.NewForm( TZoo_AtividadesLVPosPartoSCioWizard        ) ;
    2 : FDesktop.NewForm( TZoo_AtividadesLVCiclosAnormaisWizard      ) ;
    3 : FDesktop.NewForm( TZoo_AtividadesLVDiagnosticoPrenhezWizard  ) ;
    4 : FDesktop.NewForm( TZoo_AtividadesLVNovilhasNaoPrenhesWizard  ) ;
    5 : FDesktop.NewForm( TZoo_AtividadesLVListagemGeralWizard       ) ;
  end;
end;

initialization
  RegisterClass ( TZoo_AtividadesListagemVeterianariasDesktop ) ;


end.
