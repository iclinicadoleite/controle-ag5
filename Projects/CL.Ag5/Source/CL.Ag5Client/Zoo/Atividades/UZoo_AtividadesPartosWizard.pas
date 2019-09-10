// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality :
//
// License      : veja readme.txt





unit UZoo_AtividadesPartosWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_AtividadesPartosDatamodule,
  { UZoo_AtividadesPartosReport, } VCL.Mask, JvExMask, JvToolEdit, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, Tc.VCL.Edits,
  UZoo_AtividadesBaseWizard, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type
  TZoo_AtividadesPartosWizard = class(TZoo_AtividadesBaseWizard)
    deAte: TTcDateEdit;
    StaticText1: TStaticText;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actPriorExecute(Sender: TObject);
    procedure _actNextExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure deAteExit(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesPartosDatamodule : TZoo_AtividadesPartosDatamodule ;
  protected
    { Protected declarations }
    procedure OpenTables ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;


implementation

uses ThreadSuppl, Exceptions ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesPartosWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;

   deAte.Date := Date ;

//   ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
  ThreadSuppl.TSyncThread.Create ( OpenTables ) ;
end;

procedure TZoo_AtividadesPartosWizard.deAteExit(Sender: TObject);
begin
  inherited;
  if deAte.Date < Date then
     raise Warning.Create('Data de pesquisa inferior a data atual.');
end;

class function TZoo_AtividadesPartosWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesPartosWizard;
begin
  ThisForm := TZoo_AtividadesPartosWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
  
end ;

procedure TZoo_AtividadesPartosWizard.OpenTables;
begin
   Zoo_AtividadesPartosDatamodule := TZoo_AtividadesPartosDatamodule.Create ( self ) ;
   dtsResultado.DataSet := Zoo_AtividadesPartosDatamodule.cdsAPartos ;
end;

procedure TZoo_AtividadesPartosWizard._actExecuteExecute(Sender: TObject);
begin
  Caption := 'Atividades - Partos' ;
  inherited;
end;

procedure TZoo_AtividadesPartosWizard._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  Caption := 'Atividades - Partos' + ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.date ) ;
  Zoo_AtividadesPartosDatamodule.Ate := deAte.date ;

  inherited;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesPartosWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
  Caption := 'Atividades - Partos' ;

end;

end.

