// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality :
//
// License      : veja readme.txt





unit UZoo_AtividadesTarefasWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_AtividadesTarefasDatamodule, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.Mask, JvExMask, JvToolEdit, Tc.VCL.Edits, UDBZootecnico,
  UZoo_AtividadesBaseWizard, Data.DB, Tc.Data.DB.Helpers, VCL.DBCtrls, JvDBControls,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;

type
  TZoo_AtividadesTarefasWizard = class(TZoo_AtividadesBaseWizard)
    deAte: TTcDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure TcFormActivate(Sender: TObject);
  private
    { Private declarations }
    FFirstView : boolean  ;
    Zoo_AtividadesTarefasDatamodule : TZoo_AtividadesTarefasDatamodule ;
    procedure OpenTables ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;

  TZoo_AtividadesTarefasProximosDias   = class(TZoo_AtividadesTarefasWizard)
  private
    procedure OpenTables ; override ;
 public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end ;

implementation

uses ClAg5ClientCommonTypes,
     ThreadSuppl;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesTarefasWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;
   FFirstView := True ;
   deAte.Date := Date ;
   Legenda := '* Descarte calculado em função das tarefas em atraso.' ;
//   ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
end;

class function TZoo_AtividadesTarefasWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesTarefasWizard;
begin
  ThisForm := TZoo_AtividadesTarefasWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
  
end ;

procedure TZoo_AtividadesTarefasWizard.OpenTables;
begin
   lblTotalLinhas.Caption := '';
   Zoo_AtividadesTarefasDatamodule := TZoo_AtividadesTarefasDatamodule.Create ( self ) ;
   Zoo_AtividadesTarefasDatamodule.ProxXDias := False ;
   dtsResultado.DataSet := Zoo_AtividadesTarefasDatamodule.cdsATarefas ;
end;

procedure TZoo_AtividadesTarefasWizard.TcFormActivate(Sender: TObject);
begin
  inherited;
  if ( self is TZoo_AtividadesTarefasProximosDias )
    and ( not FFirstView ) then
    begin
      Zoo_AtividadesTarefasDatamodule.Ate := Date + ParametrosFazenda ( LoggedUser.DomainID ).TarefasProxDias ;
    end;
  FFirstView := False ;
end;

procedure TZoo_AtividadesTarefasWizard._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  Caption := 'Atividades - Tarefas' + ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.date ) ;
  Zoo_AtividadesTarefasDatamodule.Ate := deAte.date ;

  inherited;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesTarefasWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
  Caption := 'Atividades - Tarefas' ;

end;

{ TZoo_AtividadesTarefasProximosDias }

constructor TZoo_AtividadesTarefasProximosDias.Create(AOwner: TComponent);
begin
  inherited;
  Caption        := Format ( '%s próx. %d dias', [ 'Atividades - Tarefas', ParametrosFazenda( LoggedUser.DomainID ).TarefasProxDias ] ) ;
  PageControl.ActivePage     := TabSheetResultado ;
  TabSheetParametros.Enabled := False ;
end;

procedure TZoo_AtividadesTarefasProximosDias.OpenTables;
begin
  lblTotalLinhas.Caption := '';
  inherited;
  Zoo_AtividadesTarefasDatamodule.ProxXDias := True ;
  Zoo_AtividadesTarefasDatamodule.Ate := Date + ParametrosFazenda ( LoggedUser.DomainID ).TarefasProxDias ;
  EditControlsDBGrid;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

initialization
  RegisterClass ( TZoo_AtividadesTarefasWizard ) ;
  RegisterClass ( TZoo_AtividadesTarefasProximosDias ) ;


end.
