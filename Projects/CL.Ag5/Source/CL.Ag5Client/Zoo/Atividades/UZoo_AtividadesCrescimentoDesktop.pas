// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality : - Crescimento
// License      : veja readme.txt





unit UZoo_AtividadesCrescimentoDesktop;

//** deprecated

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, UfrmGlb_Desktop, System.Actions, Tc.VCL.Application,
  JvComponentBase ;

type
  TZoo_AtividadesCrescimentoDesktop = class(TfrmGlb_Desktop)
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses UZoo_AtividadesPesoAlturaWizard, UZoo_AtividadesDesmameWizard;

{$R *.dfm}

constructor TZoo_AtividadesCrescimentoDesktop.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.AddTab ( 'Peso / Altura' ) ;
  FDesktop.AddTab ( 'Desmame' ) ;
end;

procedure TZoo_AtividadesCrescimentoDesktop.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TZoo_AtividadesPesoAlturaWizard ) ;
    1 :   FDesktop.NewForm( TZoo_AtividadesDesmameWizard ) ;
  end;
end;

initialization
  RegisterClass ( TZoo_AtividadesCrescimentoDesktop ) ;


end.
