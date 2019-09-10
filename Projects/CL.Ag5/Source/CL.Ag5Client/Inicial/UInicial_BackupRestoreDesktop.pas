unit UInicial_BackupRestoreDesktop;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfrmGlb_Desktop, VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, System.Actions, Tc.VCL.Application, JvComponentBase,
  JvComCtrls;

type
  TInicial_BackupRestoreDesktop = class(TfrmGlb_Desktop)
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

{$R *.dfm}

{ TInicial_SyncDesktop }

constructor TInicial_BackupRestoreDesktop.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop.AddTab ( 'Gerar backup' ) ;
  FDesktop.AddTab ( 'Restaurar backup' ) ;
  FDesktop.AddTab ( 'Configuração de backup' ) ;
end;

destructor TInicial_BackupRestoreDesktop.Destroy;
begin

  inherited;
end;

procedure TInicial_BackupRestoreDesktop.GetClass(TabIndex: integer;
  out ObjectClass: TComponentClass);
begin
  case TabIndex of
    0 :   FDesktop.NewForm( TComponentClass ( System.Classes.GetClass ( 'TSYS_BackupWizard' ) ) ) ;
    //1 :   FDesktop.NewForm( TComponentClass ( System.Classes.GetClass ( 'TInicial_BackupRestoreDesktop' ) ) ) ;
    1 :   FDesktop.NewForm( TComponentClass ( System.Classes.GetClass ( 'TSYS_RestoreWizard' ) ) ) ;
    2 :   FDesktop.NewForm( TComponentClass ( System.Classes.GetClass ( 'TSYS_ConfigBackupWizard' ) ) ) ;
  end ;
end;

Initialization
  RegisterClass ( TInicial_BackupRestoreDesktop )
end.
