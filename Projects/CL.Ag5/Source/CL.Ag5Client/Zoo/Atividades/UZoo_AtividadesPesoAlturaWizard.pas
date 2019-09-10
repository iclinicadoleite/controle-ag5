// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality :
//
// License      : veja readme.txt





unit UZoo_AtividadesPesoAlturaWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_AtividadesPesoAlturaDatamodule, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UZoo_AtividadesBaseWizard, Data.DB, Tc.Data.DB.Helpers,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Application, Wrappers;

type
  TZoo_AtividadesPesoAlturaWizard = class(TZoo_AtividadesBaseWizard)
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesPesoAlturaDatamodule : TZoo_AtividadesPesoAlturaDatamodule ;
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

constructor TZoo_AtividadesPesoAlturaWizard.Create(AOwner: TComponent);
begin
  inherited;

end;

class function TZoo_AtividadesPesoAlturaWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesPesoAlturaWizard;
begin
  ThisForm := TZoo_AtividadesPesoAlturaWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_AtividadesPesoAlturaWizard.OpenTables;
begin
   Zoo_AtividadesPesoAlturaDatamodule := TZoo_AtividadesPesoAlturaDatamodule.Create ( self ) ;
   dtsResultado.DataSet := Zoo_AtividadesPesoAlturaDatamodule.cdsAPesoMedida ;
   TCDSSuppl.Open ( Zoo_AtividadesPesoAlturaDatamodule.cdsAPesoMedida ) ;
   EditControlsDBGrid;
   lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesPesoAlturaWizard._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;
end;

procedure TZoo_AtividadesPesoAlturaWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
end;

end.
