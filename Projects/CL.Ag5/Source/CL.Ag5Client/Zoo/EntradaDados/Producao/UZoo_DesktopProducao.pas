unit UZoo_DesktopProducao;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, UfrmGlb_Desktop, System.Actions, Tc.VCL.Application,
  JvComponentBase ;

type
  TfrmZoo_DesktopProducao = class(TfrmGlb_Desktop)
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses UZoo_ProducaoSecagemWizard,
  UZoo_ProducaoAnaliseLeiteWizard2 ,
  UZoo_ProducaoControleLeiteiroWizard2;

{$R *.dfm}

constructor TfrmZoo_DesktopProducao.Create(AOwner: TComponent);
begin
  inherited;

  FDesktop.AddTab ( 'Controle &leiteiro' ) ;
  FDesktop.AddTab ( '&Secagem' ) ;
  FDesktop.AddTab ( '&Análise de leite' ) ;

end;

destructor TfrmZoo_DesktopProducao.Destroy;
begin

  inherited;
end;

procedure TfrmZoo_DesktopProducao.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TZoo_ProducaoControleLeiteiroWizard2 ) ;
    1 :   FDesktop.NewForm( TZoo_ProducaoSecagemWizard ) ;
    2 :   FDesktop.NewForm( TZoo_ProducaoAnaliseLeiteWizard ) ;
  end;
end;

initialization
  RegisterClass ( TfrmZoo_DesktopProducao ) ;

end.
