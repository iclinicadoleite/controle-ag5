// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality :
//
// License      : veja readme.txt





unit UZoo_AtividadesLVDiagnosticoPrenhezWizard2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_AtividadesLVDiagnosticoPrenhezDatamodule2, UZoo_AtividadesBaseWizard,
  VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, VCL.Mask, JvExMask,
  Tc.VCL.Edits, Tc.VCL.Controls.GDIButton, System.Actions,
  Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type
  TZoo_AtividadesLVDiagnosticoPrenhezWizard = class(TZoo_AtividadesBaseWizard)
    deAte: TTcDateEdit;
    Label1: TLabel;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesLVDiagnosticoPrenhezDatamodule : TZoo_AtividadesLVDiagnosticoPrenhezDatamodule ;
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

constructor TZoo_AtividadesLVDiagnosticoPrenhezWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;

   deAte.Date := Date ;

   TabSheetParametros.Visible := True ;
//   ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
   ThreadSuppl.TSyncThread.Create ( OpenTables ) ;
end;

class function TZoo_AtividadesLVDiagnosticoPrenhezWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesLVDiagnosticoPrenhezWizard;
begin
  ThisForm := TZoo_AtividadesLVDiagnosticoPrenhezWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_AtividadesLVDiagnosticoPrenhezWizard.OpenTables;
begin
   Zoo_AtividadesLVDiagnosticoPrenhezDatamodule := TZoo_AtividadesLVDiagnosticoPrenhezDatamodule.Create ( self ) ;
   dtsResultado.DataSet := Zoo_AtividadesLVDiagnosticoPrenhezDatamodule.cdsADiagnosticoPrenhez ;
end;

procedure TZoo_AtividadesLVDiagnosticoPrenhezWizard._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  Caption := 'Atividades - Diagnóstico Prenhez' + ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.date ) ;
  Zoo_AtividadesLVDiagnosticoPrenhezDatamodule.Ate := deAte.date ;

  inherited;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesLVDiagnosticoPrenhezWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //
  Caption := 'Atividades - Diagnóstico Prenhez' ;
  inherited;

end;

end.
