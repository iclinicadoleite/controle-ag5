{***************************************************************************************************
** Project      : Clinica do Leite - Agenda 5
** Sub-Project  : Zootécnico
** Module       : Atividades a Executar
** Funcionality : Exibirá todos os animais que até X dias após o parto seja
**               maior que a data inicialmente informada, onde X é parametrizado
**               (Número máximo de DEL para considerar a vaca recém parida);
**               X pode variar para primípara e multípara.
** License      : veja readme.txt
***************************************************************************************************}

unit UZoo_AtividadesLVRecemParidosWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_AtividadesLVRecemParidosDatamodule, UZoo_AtividadesBaseWizard, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, VCL.Mask, JvExMask, Tc.VCL.Edits,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;

type
  TZoo_AtividadesLVRecemParidosWizard = class(TZoo_AtividadesBaseWizard)
    deAte: TTcDateEdit;
    Label1: TLabel;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesLVRecemParidosDatamodule : TZoo_AtividadesLVRecemParidosDatamodule ;
  protected
    { Protected declarations }
    procedure OpenTables ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;


implementation

uses ThreadSuppl;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesLVRecemParidosWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;
   deAte.Date := Date ;
//   ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
   ThreadSuppl.TSyncThread.Create ( OpenTables ) ;
end;

class function TZoo_AtividadesLVRecemParidosWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesLVRecemParidosWizard;
begin
  ThisForm := TZoo_AtividadesLVRecemParidosWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
  
end ;

procedure TZoo_AtividadesLVRecemParidosWizard.OpenTables;
begin
   Zoo_AtividadesLVRecemParidosDatamodule := TZoo_AtividadesLVRecemParidosDatamodule.Create ( self ) ;
   dtsResultado.DataSet := Zoo_AtividadesLVRecemParidosDatamodule.cdsARecemParidos ;
end;

procedure TZoo_AtividadesLVRecemParidosWizard._actExecuteExecute(Sender: TObject);
begin
  Inherited ;
  Caption    := 'Atividades - Recém Paridas' ;
  PageControl.ActivePage := TabSheetParametros ;
end;

procedure TZoo_AtividadesLVRecemParidosWizard._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  Caption := 'Atividades - Recém Paridas' + ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.date ) ;
  Zoo_AtividadesLVRecemParidosDatamodule.Ate := deAte.date ;

  inherited;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesLVRecemParidosWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
  Caption := 'Atividades - Recém Paridas' ;

end;

end.
