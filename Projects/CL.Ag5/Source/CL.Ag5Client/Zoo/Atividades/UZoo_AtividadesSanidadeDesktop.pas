unit UZoo_AtividadesSanidadeDesktop;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UfrmGlb_Desktop, System.Actions,
  Tc.VCL.Application, JvComponentBase ;

type
  TZoo_AtividadesSanidadeDesktop = class(TfrmGlb_Desktop)
  protected
    { Protected declarations }
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses UDBZootecnico, UZoo_AtividadesTarefasWizard ;

{$R *.dfm}

constructor TZoo_AtividadesSanidadeDesktop.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.AddTab ( 'Tarefas' ) ;
//  FDesktop.AddTab ( 'BST' ) ;
end;

procedure TZoo_AtividadesSanidadeDesktop.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TZoo_AtividadesTarefasWizard ) ;
//    1 :   FDesktop.NewForm( TZoo_AtividadesSanidadeBSTWizard ) ;
  end;
end;

initialization
  RegisterClass ( TZoo_AtividadesSanidadeDesktop ) ;

end.
