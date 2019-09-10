unit UfrmZoo_DesktopSanidade;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UfrmGlb_Desktop, System.Actions,
  Tc.VCL.Application, JvComponentBase ;

type
  TfrmZoo_DesktopSanidade = class(TfrmGlb_Desktop)
  private
    { Private declarations }
//    FEscoreTableName : TStringList ;
//    FEscoreKey : TStringList ;
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses
    UZoo_SanidadeDiagnosticosWizard5
  , UZoo_SanidadeBSTWizard2
  , UZoo_SanidadeCMTWizard
  , UZoo_SanidadeCondicaoCorporalWizard
  , UDBZootecnico
  , UZoo_SanidadeEscoresWizard
//, UZoo_SanidadeProtocolosWizard
  , UZoo_SanidadeBaixarTarefasWizard
  , UApplResources ;



{$R *.dfm}

constructor TfrmZoo_DesktopSanidade.Create(AOwner: TComponent);
begin
  inherited;

//  FEscoreTableName := TStringList.Create ;
//  FEscoreKey := TStringList.Create ;

  FDesktop.AddTab ( 'Dados sanitários' ) ;
//  FDesktop.AddTab ( 'Protocolos' ) ;
  FDesktop.AddTab ( 'Baixar Tarefas' ) ;
  FDesktop.AddTab ( 'Condição Corporal' ) ;
//  FDesktop.AddTab ( 'BST' ) ;
  FDesktop.AddTab ( 'BST' ) ;
  FDesktop.AddTab ( 'CMT' ) ;
//  FDesktop.AddTab ( 'Escores' ) ;
end;

destructor TfrmZoo_DesktopSanidade.Destroy;
begin

  inherited;
end;

procedure TfrmZoo_DesktopSanidade.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
    0 :   FDesktop.NewForm( TZoo_SanidadeDiagnosticosWizard ) ;
//    1 :   FDesktop.NewForm( TZoo_SanidadeProtocolosWizard ) ;
    1 :   FDesktop.NewForm( TZoo_SanidadeBaixarTarefasWizard ) ;
    2 :   FDesktop.NewForm( TZoo_SanidadeCondicaoCorporalWizard ) ;
    3 :   FDesktop.NewForm( TZoo_SanidadeBSTWizard2) ;
    4 :   FDesktop.NewForm( TZoo_SanidadeCMTWizard ) ;
  else
    begin
//     TfwzZoo_Escores ( FDesktop.NewForm( TfwzZoo_Escores, 'fwzZoo_Escores_' + FEscoreTableName[ TabIndex - 6 ] ) ).KeyEscore := FEscoreKey[ TabIndex - 6 ]
     FDesktop.NewForm( TZoo_SanidadeEscoresWizard ) ;
    end;
  end;
end;

initialization
  RegisterClass ( TfrmZoo_DesktopSanidade ) ;
end.
