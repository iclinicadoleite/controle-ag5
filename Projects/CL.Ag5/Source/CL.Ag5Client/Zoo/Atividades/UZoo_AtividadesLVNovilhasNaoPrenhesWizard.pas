// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality :
//
// License      : veja readme.txt





unit UZoo_AtividadesLVNovilhasNaoPrenhesWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_AtividadesLVNovilhasNaoPrenhesDatamodule, UZoo_AtividadesBaseWizard,
  VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, VCL.Mask, JvExMask,
  Tc.VCL.Edits, Tc.VCL.Controls.GDIButton, System.Actions,
  Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type
  TZoo_AtividadesLVNovilhasNaoPrenhesWizard = class(TZoo_AtividadesBaseWizard)
    Label1: TLabel;
    deAte: TTcDateEdit;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesLVNovilhasNaoPrenhesDatamodule : TZoo_AtividadesLVNovilhasNaoPrenhesDatamodule ;
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

constructor TZoo_AtividadesLVNovilhasNaoPrenhesWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;

   deAte.Date := Date ;

//   ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
   ThreadSuppl.TSyncThread.Create ( OpenTables ) ;
end;

class function TZoo_AtividadesLVNovilhasNaoPrenhesWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesLVNovilhasNaoPrenhesWizard;
begin
  ThisForm := TZoo_AtividadesLVNovilhasNaoPrenhesWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
  
end ;

procedure TZoo_AtividadesLVNovilhasNaoPrenhesWizard.OpenTables;
begin
   Zoo_AtividadesLVNovilhasNaoPrenhesDatamodule := TZoo_AtividadesLVNovilhasNaoPrenhesDatamodule.Create ( self ) ;
   dtsResultado.DataSet := Zoo_AtividadesLVNovilhasNaoPrenhesDatamodule.cdsANovilhasNaoPrenhes ;
end;

procedure TZoo_AtividadesLVNovilhasNaoPrenhesWizard._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  Caption := 'Atividades - Novilhas não prenhe' + ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.date ) ;
  Zoo_AtividadesLVNovilhasNaoPrenhesDatamodule.Ate := deAte.date ;
  inherited;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesLVNovilhasNaoPrenhesWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
  Caption := 'Atividades - Novilhas não prenhe' ;
end;

end.
