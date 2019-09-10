// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality :
//
// License      : veja readme.txt





unit UZoo_AtividadesDesmameWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_AtividadesDesmameDatamodule, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UZoo_AtividadesBaseWizard, Data.DB, Tc.Data.DB.Helpers, VCL.Mask, JvExMask, Tc.VCL.Edits,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;


type
  TZoo_AtividadesDesmameWizard = class(TZoo_AtividadesBaseWizard)
    deAte: TTcDateEdit;
    Label1: TLabel;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesDesmameDatamodule : TZoo_AtividadesDesmameDatamodule ;
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

constructor TZoo_AtividadesDesmameWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;

   deAte.Date := Date ;

//   ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
   ThreadSuppl.TSyncThread.Create ( OpenTables ) ;
end;

class function TZoo_AtividadesDesmameWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesDesmameWizard;
begin
  ThisForm := TZoo_AtividadesDesmameWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_AtividadesDesmameWizard.OpenTables;
begin
   Zoo_AtividadesDesmameDatamodule := TZoo_AtividadesDesmameDatamodule.Create ( self ) ;
   dtsResultado.DataSet := Zoo_AtividadesDesmameDatamodule.cdsADesmame ;
end;

procedure TZoo_AtividadesDesmameWizard._actExecuteExecute(Sender: TObject);
begin
  Caption    := 'Atividades - Desmame' ;
  PageControl.ActivePage := TabSheetParametros ;
  inherited;
end;

procedure TZoo_AtividadesDesmameWizard._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  Caption := 'Atividades - Desmame' + ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.date ) ;
  Zoo_AtividadesDesmameDatamodule.Ate := deAte.date ;
  inherited;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesDesmameWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
  Caption := 'Atividades - Desmame' ;
end;

end.
