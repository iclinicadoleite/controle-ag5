// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality : Desktop Lista de ações, exibir acesso as opções
//                -   Cios/Coberturas Próx. X dias
//                -   Tarefas Próx. X dias
//                -   Secagens Próx. X dias
// License      : veja readme.txt





unit UZoo_AtividadesListaDeAcoesDesktop;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, UfrmGlb_Desktop, UdtmSYS_BASE, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.DB, Tc.Data.DB.Helpers,
  System.Actions, Tc.VCL.Application, JvComponentBase, Wrappers ;

type
  TZoo_AtividadesListaDeAcoesDesktop = class(TfrmGlb_Desktop)
  private
    { Private declarations }
    procedure ShowFirstTab ;
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses UZoo_AtividadesPesoAlturaWizard, UZoo_AtividadesDesmameWizard,
     UZoo_AtividadesCiosCoberturasWizard, UZoo_AtividadesSecagemWizard,
     UZoo_AtividadesTarefasWizard, UDBZootecnico,
     ClAg5ClientCommonTypes,
     ThreadSuppl ;

{$R *.dfm}

var
  FirstTime : boolean ;

constructor TZoo_AtividadesListaDeAcoesDesktop.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.TabSet.TabWidth := 200 ;
  FDesktop.AddTab ( Format ( 'Tarefas Próx. %d dias',         [ ParametrosFazenda( LoggedUser.DomainID ).TarefasProxDias  ] ) ) ;
  FDesktop.AddTab ( Format ( 'Cios/Coberturas Próx. %d dias', [ ParametrosFazenda( LoggedUser.DomainID ).CiosProxDias     ] ) ) ;
  FDesktop.AddTab ( Format ( 'Secagens Próx. %d dias',        [ ParametrosFazenda( LoggedUser.DomainID ).SecagensProxDias ] ) ) ;

  if FirstTime then
    ThreadSuppl.TSyncThread.Create ( ShowFirstTab ) ;

end;

procedure TZoo_AtividadesListaDeAcoesDesktop.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TZoo_AtividadesTarefasProximosDias ) ;
    1 :   FDesktop.NewForm( TZoo_AtividadesCiosCoberturasProximosDias ) ;
    2 :   FDesktop.NewForm( TZoo_AtividadesSecagemProximosDias ) ;
  end;
end;

procedure TZoo_AtividadesListaDeAcoesDesktop.ShowFirstTab;
begin
  Repeat Until ( Visible and Showing ) ;
  FirstTime := False ;
  FDesktop.TabSet.TabIndex := 0 ;
  FDesktop.TabSet.OnChange ( nil );
end;

initialization
  FirstTime  := True ;
  RegisterClass ( TZoo_AtividadesListaDeAcoesDesktop ) ;
end.
