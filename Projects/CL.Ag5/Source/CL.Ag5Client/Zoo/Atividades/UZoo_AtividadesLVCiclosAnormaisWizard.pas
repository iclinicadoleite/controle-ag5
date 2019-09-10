// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality : Listagem de animais com ciclos anormais
//
// License      : veja readme.txt


unit UZoo_AtividadesLVCiclosAnormaisWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.Grids,
  UZoo_AtividadesLVCiclosAnormaisDatamodule, UZoo_AtividadesBaseWizard, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, VCL.DBCtrls, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Application, Wrappers ;

type
  TZoo_AtividadesLVCiclosAnormaisWizard = class(TZoo_AtividadesBaseWizard)
    DBMemo1: TDBMemo;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesLVCiclosAnormaisDatamodule : TZoo_AtividadesLVCiclosAnormaisDatamodule ;
    procedure OpenTables ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;


implementation

uses CDSSuppl, ThreadSuppl, UDBZootecnico ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesLVCiclosAnormaisWizard.Create(AOwner: TComponent);
begin
  inherited;
//
end;

class function TZoo_AtividadesLVCiclosAnormaisWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesLVCiclosAnormaisWizard;
begin
  ThisForm := TZoo_AtividadesLVCiclosAnormaisWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_AtividadesLVCiclosAnormaisWizard.OpenTables;
begin
   lblTotalLinhas.Caption := '';
   Zoo_AtividadesLVCiclosAnormaisDatamodule := TZoo_AtividadesLVCiclosAnormaisDatamodule.Create ( self ) ;
   dtsResultado.DataSet := Zoo_AtividadesLVCiclosAnormaisDatamodule.cdsCiclosAnormais ;
   TCDSSuppl.Open ( Zoo_AtividadesLVCiclosAnormaisDatamodule.cdsCiclosAnormais ) ;
   EditControlsDBGrid;
   lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesLVCiclosAnormaisWizard._actNextExecute(Sender: TObject);
begin
//
end;

procedure TZoo_AtividadesLVCiclosAnormaisWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
end;

initialization
  RegisterClass ( TZoo_AtividadesLVCiclosAnormaisWizard ) ;

end.
