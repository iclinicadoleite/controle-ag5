unit UfrmZoo_DesktopReproducao;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, UfrmGlb_Desktop, System.Actions, Vcl.ActnList,
  Tc.VCL.Application, JvComponentBase ;

type
  TfrmZoo_DesktopReproducao = class(TfrmGlb_Desktop)
  private
    { Private declarations }
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses UZoo_ReproducaoCiosCoberturasWizard, UZoo_ReproducaoDiagnosticosGestacaoWizard2,
  UZoo_ReproducaoPartosAbortosWizard, UZoo_ReproducaoColetaEmbriaoWizard,
  UZoo_ReproducaoFIVWizard;

{$R *.dfm}

constructor TfrmZoo_DesktopReproducao.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.TabSet.TabWidth := 170 ;
  FDesktop.AddTab ( 'Cios / Coberturas' ) ;
 // FDesktop.AddTab ( 'Diagnóstico de Gestação' ) ;
  FDesktop.AddTab ( 'Diagnóstico Reprodutivo' ) ;
  FDesktop.AddTab ( 'Partos / Abortos' ) ;
  FDesktop.AddTab ( 'Coleta de Embrião' ) ;
//  FDesktop.AddTab ( 'FIV' ) ;
end;

procedure TfrmZoo_DesktopReproducao.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TZoo_ReproducaoCiosCoberturasWizard ) ;
    1 :   FDesktop.NewForm( TZoo_ReproducaoDiagnosticosGestacaoWizard ) ;
    2 :   FDesktop.NewForm( TZoo_ReproducaoPartosAbortosWizard ) ;
    3 :   FDesktop.NewForm( TZoo_ReproducaoColetaEmbriaoWizard ) ;
    4 :   FDesktop.NewForm( TZoo_ReproducaoFIVWizard ) ;
  end;
end;

initialization
  RegisterClass ( TfrmZoo_DesktopReproducao ) ;


end.
