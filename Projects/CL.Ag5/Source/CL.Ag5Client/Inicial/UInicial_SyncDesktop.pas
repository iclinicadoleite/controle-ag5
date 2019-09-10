unit UInicial_SyncDesktop;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfrmGlb_Desktop, VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel;

type
  TInicial_SyncDesktop = class(TfrmGlb_Desktop)
  private
    { Private declarations }
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

constructor TInicial_SyncDesktop.Create(AOwner: TComponent);
begin
  inherited;

//  FEscoreTableName := TStringList.Create ;
//  FEscoreKey := TStringList.Create ;

  FDesktop.AddTab ( 'Exportar' ) ;
  FDesktop.AddTab ( 'Importar' ) ;
  FDesktop.AddTab ( 'Sincronizar' ) ;
end;

destructor TInicial_SyncDesktop.Destroy;
begin

  inherited;
end;

procedure TInicial_SyncDesktop.GetClass(TabIndex: integer;
  out ObjectClass: TComponentClass);
begin
  case TabIndex of
    0 :   FDesktop.NewForm( TComponentClass ( Classes.GetClass ( 'TExportForm' ) ) ) ;
    1 :   FDesktop.NewForm( TComponentClass ( Classes.GetClass ( 'TImportForm' ) ) ) ;
    2 :   FDesktop.NewForm( TComponentClass ( Classes.GetClass ( 'TSyncForm' ) ) ) ;
  end ;
end;

Initialization
  RegisterClass ( TInicial_SyncDesktop )
end.
