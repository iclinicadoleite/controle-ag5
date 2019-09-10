unit UInicial_ImportacaoDesktop;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfrmGlb_Desktop, VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, System.Actions, Tc.VCL.Application, JvComponentBase,
  JvComCtrls;

type
  TInicial_ImportacaoDesktop = class(TfrmGlb_Desktop)
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

uses UfwzSYS_ImportOldDBAgenda3,
     UfwzSYS_ImportOldDBIdeagri,
     UfwzSYS_ImportOldDBProdapGP,
     UfwzSYS_ImportOldDBUNIFORM,
     UfwzSYS_ImportOldDBExcel ;


{ TfrmGlb_Desktop1 }

constructor TInicial_ImportacaoDesktop.Create(AOwner: TComponent);
begin
  inherited;

  FDesktop.AddTab ( '&Agenda 3'  ) ;
  FDesktop.AddTab ( '&Ideagri'   ) ;
  FDesktop.AddTab ( 'Prodap &GP' ) ;
  FDesktop.AddTab ( '&UNIFORM'   ) ;
  FDesktop.AddTab ( '&Excel'   ) ;

end;

destructor TInicial_ImportacaoDesktop.Destroy;
begin

  inherited;
end;

procedure TInicial_ImportacaoDesktop.GetClass(TabIndex: integer;
  out ObjectClass: TComponentClass);
begin
  inherited;
  case TabIndex of
    0 : FDesktop.NewForm( TfwzSYS_ImportOldDBAgenda3) ;
    1 : FDesktop.NewForm( TfwzSYS_ImportOldDBIdeagri ) ;
    2 : FDesktop.NewForm( TfwzSYS_ImportOldDBProdapGP ) ;
    3 : FDesktop.NewForm( TfwzSYS_ImportOldDBUNIFORM ) ;
    4 : FDesktop.NewForm( TfwzSYS_ImportOldDBExcel ) ;
  end;
end;

initialization
  RegisterClass ( TInicial_ImportacaoDesktop ) ;

end.

