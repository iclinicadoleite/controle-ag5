// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality :
//
// License      : veja readme.txt





unit UZoo_AtividadesPesagemLeiteWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_AtividadesPesagemLeiteDatamodule,
  { UZoo_AtividadesPesagemLeiteReport, } VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, UZoo_AtividadesBaseWizard,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Application, Wrappers ;

type
  TZoo_AtividadesPesagemLeiteWizard = class(TZoo_AtividadesBaseWizard)
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesPesagemLeiteDatamodule : TZoo_AtividadesPesagemLeiteDatamodule ;
  protected
    { Protected declarations }
    procedure OpenTables ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;


implementation

uses CDSSuppl,
     ThreadSuppl, UDBZootecnico ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesPesagemLeiteWizard.Create(AOwner: TComponent);
begin
  inherited;
//  TabSheetParametros.Enabled  := False ;
//  PageControl.ActivePage      := TabSheetResultado ;
end;

class function TZoo_AtividadesPesagemLeiteWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesPesagemLeiteWizard;
begin
  ThisForm := TZoo_AtividadesPesagemLeiteWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_AtividadesPesagemLeiteWizard.OpenTables;
begin
   Zoo_AtividadesPesagemLeiteDatamodule := TZoo_AtividadesPesagemLeiteDatamodule.Create ( self ) ;
   dtsResultado.DataSet := Zoo_AtividadesPesagemLeiteDatamodule.cdsAPesagemLeite ;
   TCDSSuppl.Open ( Zoo_AtividadesPesagemLeiteDatamodule.cdsAPesagemLeite ) ;
   lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesPesagemLeiteWizard._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;
//  Zoo_AtividadesPesagemLeiteDatamodule.cdsAPesagemLeite.Active := True;

  inherited;

end;

procedure TZoo_AtividadesPesagemLeiteWizard._actPriorExecute(Sender: TObject);
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
