// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality :
//
// License      : veja readme.txt





unit UZoo_AtividadesUltimasTarefasWizard ;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_AtividadesUltimasTarefasDatamodule, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.Mask, JvExMask, JvToolEdit, Tc.VCL.Edits, UDBZootecnico,
  UZoo_AtividadesBaseWizard, Data.DB, Tc.Data.DB.Helpers, VCL.DBCtrls, JvDBControls,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers, JvExControls, JvAnimatedImage, JvGIFCtrl,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers ;

type
  TZoo_AtividadesUltimasTarefasWizard = class(TZoo_AtividadesBaseWizard)
    deAte: TTcDateEdit;
    Label1: TLabel;
    GridPanel1: TGridPanel;
    Panel02: TPanel;
    Panel04: TPanel;
    Panel07: TPanel;
    dbgDiagnosticosGestacao: TJvDBUltimGrid;
    dbgSecagens: TJvDBUltimGrid;
    dbgDesmame: TJvDBUltimGrid;
    Label4: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    dtsCiosCobertura: TDataSource;
    dtsDiagnosticoGestacao: TDataSource;
    dtsPartosAbortos: TDataSource;
    dtsSecagens: TDataSource;
    dtsDignosticosSanitarios: TDataSource;
    dtsCrescimento: TDataSource;
    dtsCondicaoCorporal: TDataSource;
    dtsDesmame: TDataSource;
    dtsDescartes: TDataSource;
    dtsTarefas: TDataSource;
    dtsExames: TDataSource;
    dtsResultados: TDataSource;
    dtsBST: TDataSource;
    dtsControleLeiteiro: TDataSource;
    gaDiagnosticoGestacao: TJvGIFAnimator;
    gaSecagens: TJvGIFAnimator;
    gaDesmame: TJvGIFAnimator;
    gaControleLeiteiro: TJvGIFAnimator;
    Panel15: TPanel;
    Label110: TLabel;
    Panel12: TPanel;
    Label14: TLabel;
    gaBST: TJvGIFAnimator;
    dbgBST: TJvDBUltimGrid;
    dbgControleLeiteiro: TJvDBUltimGrid;
    lblDataUCL: TLabel;
    Panel1: TPanel;
    Panel08: TPanel;
    Label10: TLabel;
    gaDescartes: TJvGIFAnimator;
    dbgDescartes: TJvDBUltimGrid;
    Panel03: TPanel;
    Label5: TLabel;
    gaPartosAbortos: TJvGIFAnimator;
    dbgPartosAbortos: TJvDBUltimGrid;
    Panel3: TPanel;
    PanelCC: TPanel;
    Label15: TLabel;
    gaCondicaoCorporal: TJvGIFAnimator;
    dbgCondicaoCorporal: TJvDBUltimGrid;
    Panel01: TPanel;
    gaCiosCobertura: TJvGIFAnimator;
    Label3: TLabel;
    dbgCiosCoberturas: TJvDBUltimGrid;
    Panel09: TPanel;
    gaTarefas: TJvGIFAnimator;
    Label11: TLabel;
    dbgTarefas: TJvDBUltimGrid;
    Panel06: TPanel;
    Label8: TLabel;
    gaCrescimento: TJvGIFAnimator;
    dbgCrescimento: TJvDBUltimGrid;
    Panel05: TPanel;
    Label7: TLabel;
    gaDiagnosticosSanitarios: TJvGIFAnimator;
    dbgDiagnosticosSanitarios: TJvDBUltimGrid;
    Panel11: TPanel;
    Label13: TLabel;
    gaResultados: TJvGIFAnimator;
    dbgResultados: TJvDBUltimGrid;
    Panel10: TPanel;
    Label12: TLabel;
    gaExames: TJvGIFAnimator;
    dbgExames: TJvDBUltimGrid;
    procedure _actPriorExecute(Sender: TObject);
    procedure TcFormActivate(Sender: TObject);
    procedure dbgCiosCoberturasDblClick(Sender: TObject);
  private
    { Private declarations }
    FFirstView : boolean  ;
    Zoo_AtividadesUltimasTarefasDatamodule : TZoo_AtividadesUltimasTarefasDatamodule ;
    procedure OpenTerminated ( Sender : TObject ) ; override ;
    procedure OpenTables ; override ;
    procedure HideGrids ;
    procedure ShowGrid ( AGrid : TClientDataSet ) ;
    procedure DisableGridsAutoSizeColumns;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;

  TZoo_AtividadesUltimasTarefasDash   = class(TZoo_AtividadesUltimasTarefasWizard)
 public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end ;

implementation

uses
     ClAg5ClientCommonTypes
   , ClAg5ClientZootecnicoCommonTypes
   , ThreadSuppl;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesUltimasTarefasWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;
   Caption := 'Útimas tarefas executadas' ;
   PageControl.ActivePage     := TabSheetResultado ;
   TabSheetParametros.Enabled := False ;

   FFirstView := True ;
   deAte.Date := Date ;
   Legenda := '* Descarte calculado em função das tarefas em atraso.' ;
   HideGrids ;
//   ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;

   DisableGridsAutoSizeColumns;
end;

class function TZoo_AtividadesUltimasTarefasWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesUltimasTarefasWizard;
begin
  ThisForm := TZoo_AtividadesUltimasTarefasWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
  
end ;

procedure TZoo_AtividadesUltimasTarefasWizard.HideGrids;
begin

  dbgCiosCoberturas.Visible            := False ;
  dbgDiagnosticosGestacao.Visible      := False ;
  dbgPartosAbortos.Visible             := False ;
  dbgSecagens.Visible                  := False ;
  dbgDiagnosticosSanitarios.Visible    := False ;
  dbgCrescimento.Visible               := False ;
  dbgCondicaoCorporal.Visible          := False ;
  dbgDesmame.Visible                   := False ;
  dbgDescartes.Visible                 := False ;
  dbgTarefas.Visible                   := False ;
  dbgExames.Visible                    := False ;
  dbgResultados.Visible                := False ;
  dbgBST.Visible                       := False ;
  dbgControleLeiteiro.Visible          := False ;

  dtsCiosCobertura.Enabled             := False ;
  dtsDiagnosticoGestacao.Enabled       := False ;
  dtsPartosAbortos.Enabled             := False ;
  dtsSecagens.Enabled                  := False ;
  dtsDignosticosSanitarios.Enabled     := False ;
  dtsCrescimento.Enabled               := False ;
  dtsCondicaoCorporal.Enabled          := False ;
  dtsDesmame.Enabled                   := False ;
  dtsDescartes.Enabled                 := False ;
  dtsTarefas.Enabled                   := False ;
  dtsExames.Enabled                    := False ;
  dtsResultados.Enabled                := False ;
  dtsBST.Enabled                       := False ;
  dtsControleLeiteiro.Enabled          := False ;

  gaCiosCobertura.Threaded             := False ;
  gaDiagnosticoGestacao.Threaded       := False ;
  gaPartosAbortos.Threaded             := False ;
  gaSecagens.Threaded                  := False ;
  gaDiagnosticosSanitarios.Threaded    := False ;
  gaCrescimento.Threaded               := False ;
  gaCondicaoCorporal.Threaded          := False ;
  gaDesmame.Threaded                   := False ;
  gaDescartes.Threaded                 := False ;
  gaTarefas.Threaded                   := False ;
  gaExames.Threaded                    := False ;
  gaResultados.Threaded                := False ;
  gaBST.Threaded                       := False ;
  gaControleLeiteiro.Threaded          := False ;

  gaCiosCobertura.Visible             := True ;
  gaDiagnosticoGestacao.Visible       := True ;
  gaPartosAbortos.Visible             := True ;
  gaSecagens.Visible                  := True ;
  gaDiagnosticosSanitarios.Visible    := True ;
  gaCrescimento.Visible               := True ;
  gaCondicaoCorporal.Visible          := True ;
  gaDesmame.Visible                   := True ;
  gaDescartes.Visible                 := True ;
  gaTarefas.Visible                   := True ;
  gaExames.Visible                    := True ;
  gaResultados.Visible                := True ;
  gaBST.Visible                       := True ;
  gaControleLeiteiro.Visible          := True ;

  gaCiosCobertura.Animate             := True ;
  gaDiagnosticoGestacao.Animate       := True ;
  gaPartosAbortos.Animate             := True ;
  gaSecagens.Animate                  := True ;
  gaDiagnosticosSanitarios.Animate    := True ;
  gaCrescimento.Animate               := True ;
  gaCondicaoCorporal.Animate          := True ;
  gaDesmame.Animate                   := True ;
  gaDescartes.Animate                 := True ;
  gaTarefas.Animate                   := True ;
  gaExames.Animate                    := True ;
  gaResultados.Animate                := True ;
  gaBST.Animate                       := True ;
  gaControleLeiteiro.Animate          := True ;

end;

procedure TZoo_AtividadesUltimasTarefasWizard.dbgCiosCoberturasDblClick(
  Sender: TObject);
begin
  if ( TJvDBUltimGrid( Sender ).ScreenToClient( Mouse.CursorPos ).Y <= TJvDBUltimGrid( Sender ).TitleRowHeight ) then
    exit ;

  with TJvDBUltimGrid( Sender ).DataSource, DataSet do
  if Assigned ( DataSet ) and not ( BOF and EOF ) then
    if Assigned ( Fields.FindField( 'KZOO_ANIMAL_FEMEA'  ) ) then
     TShowFichaAnimal.Execute( FieldByName('KZOO_ANIMAL_FEMEA').AsString )
    else if Assigned ( Fields.FindField( 'KZOO_ANIMAL'  ) ) then
     TShowFichaAnimal.Execute( FieldByName('KZOO_ANIMAL').AsString );
end;

procedure TZoo_AtividadesUltimasTarefasWizard.DisableGridsAutoSizeColumns;
begin
   dbgDiagnosticosGestacao.AutoSizeColumns    := False;
   dbgSecagens.AutoSizeColumns                := False;
   dbgCiosCoberturas.AutoSizeColumns          := False;
   dbgDescartes.AutoSizeColumns               := False;
   dbgPartosAbortos.AutoSizeColumns           := False;
   dbgDesmame.AutoSizeColumns                 := False;
   dbgCrescimento.AutoSizeColumns             := False;
   dbgTarefas.AutoSizeColumns                 := False;
   dbgDiagnosticosSanitarios.AutoSizeColumns  := False;
   dbgBST.AutoSizeColumns                     := False;
   dbgExames.AutoSizeColumns                  := False;
   dbgControleLeiteiro.AutoSizeColumns        := False;
end;

procedure TZoo_AtividadesUltimasTarefasWizard.OpenTables;
begin
   Zoo_AtividadesUltimasTarefasDatamodule := TZoo_AtividadesUltimasTarefasDatamodule.Create ( self ) ;
   Zoo_AtividadesUltimasTarefasDatamodule.OnEnd := ShowGrid ;

   Zoo_AtividadesUltimasTarefasDatamodule.OpenThreads ;

  dtsCiosCobertura.DataSet             := Zoo_AtividadesUltimasTarefasDatamodule. cdsEventosZootecnicos ;
  dtsDiagnosticoGestacao.DataSet       := Zoo_AtividadesUltimasTarefasDatamodule. cdsDiagnosticoGestacao ;
  dtsPartosAbortos.DataSet             := Zoo_AtividadesUltimasTarefasDatamodule. cdsPartos ;
  dtsSecagens.DataSet                  := Zoo_AtividadesUltimasTarefasDatamodule. cdsSecagens ;
  dtsDignosticosSanitarios.DataSet     := Zoo_AtividadesUltimasTarefasDatamodule. cdsDiagnosticoSanitarios ;
  dtsCrescimento.DataSet               := Zoo_AtividadesUltimasTarefasDatamodule. cdsCrescimento ;
  //dtsCondicaoCorporal.DataSet          := Zoo_AtividadesUltimasTarefasDatamodule. cdsCC ;
  dtsDesmame.DataSet                   := Zoo_AtividadesUltimasTarefasDatamodule. cdsDesmame ;
  dtsDescartes.DataSet                 := Zoo_AtividadesUltimasTarefasDatamodule. cdsDescartes ;
  dtsTarefas.DataSet                   := Zoo_AtividadesUltimasTarefasDatamodule. cdsTarefas ;
  dtsExames.DataSet                    := Zoo_AtividadesUltimasTarefasDatamodule. cdsExames ;
  //dtsResultados.DataSet                := Zoo_AtividadesUltimasTarefasDatamodule. cdsResultados ;
  dtsBST.DataSet                       := Zoo_AtividadesUltimasTarefasDatamodule. cdsBST ;
  dtsControleLeiteiro.DataSet          := Zoo_AtividadesUltimasTarefasDatamodule. cdsControleLeiteiro ;

end;

procedure TZoo_AtividadesUltimasTarefasWizard.OpenTerminated(Sender: TObject);
begin
//// do nothing  inherited;
end;

procedure TZoo_AtividadesUltimasTarefasWizard.ShowGrid( AGrid : TClientDataSet ) ;
begin

  if AGrid = dtsCiosCobertura.DataSet             then gaCiosCobertura.Animate             := False ;
  if AGrid = dtsDiagnosticoGestacao.DataSet       then gaDiagnosticoGestacao.Animate       := False ;
  if AGrid = dtsPartosAbortos.DataSet             then gaPartosAbortos.Animate             := False ;
  if AGrid = dtsSecagens.DataSet                  then gaSecagens.Animate                  := False ;
  if AGrid = dtsDignosticosSanitarios.DataSet     then gaDiagnosticosSanitarios.Animate    := False ;
  if AGrid = dtsCrescimento.DataSet               then gaCrescimento.Animate               := False ;
  if AGrid = dtsCondicaoCorporal.DataSet          then gaCondicaoCorporal.Animate          := False ;
  if AGrid = dtsDesmame.DataSet                   then gaDesmame.Animate                   := False ;
  if AGrid = dtsDescartes.DataSet                 then gaDescartes.Animate                 := False ;
  if AGrid = dtsTarefas.DataSet                   then gaTarefas.Animate                   := False ;
  if AGrid = dtsExames.DataSet                    then gaExames.Animate                    := False ;
  if AGrid = dtsResultados.DataSet                then gaResultados.Animate                := False ;
  if AGrid = dtsBST.DataSet                       then gaBST.Animate                       := False ;
  if AGrid = dtsControleLeiteiro.DataSet          then gaControleLeiteiro.Animate          := False ;

  if AGrid = dtsCiosCobertura.DataSet             then gaCiosCobertura.Visible             := False ;
  if AGrid = dtsDiagnosticoGestacao.DataSet       then gaDiagnosticoGestacao.Visible       := False ;
  if AGrid = dtsPartosAbortos.DataSet             then gaPartosAbortos.Visible             := False ;
  if AGrid = dtsSecagens.DataSet                  then gaSecagens.Visible                  := False ;
  if AGrid = dtsDignosticosSanitarios.DataSet     then gaDiagnosticosSanitarios.Visible    := False ;
  if AGrid = dtsCrescimento.DataSet               then gaCrescimento.Visible               := False ;
  if AGrid = dtsCondicaoCorporal.DataSet          then gaCondicaoCorporal.Visible          := False ;
  if AGrid = dtsDesmame.DataSet                   then gaDesmame.Visible                   := False ;
  if AGrid = dtsDescartes.DataSet                 then gaDescartes.Visible                 := False ;
  if AGrid = dtsTarefas.DataSet                   then gaTarefas.Visible                   := False ;
  if AGrid = dtsExames.DataSet                    then gaExames.Visible                    := False ;
  if AGrid = dtsResultados.DataSet                then gaResultados.Visible                := False ;
  if AGrid = dtsBST.DataSet                       then gaBST.Visible                       := False ;
  if AGrid = dtsControleLeiteiro.DataSet          then gaControleLeiteiro.Visible          := False ;


  if AGrid = dtsCiosCobertura.DataSet             then dtsCiosCobertura.Enabled             := True ;
  if AGrid = dtsDiagnosticoGestacao.DataSet       then dtsDiagnosticoGestacao.Enabled       := True ;
  if AGrid = dtsPartosAbortos.DataSet             then dtsPartosAbortos.Enabled             := True ;
  if AGrid = dtsSecagens.DataSet                  then dtsSecagens.Enabled                  := True ;
  if AGrid = dtsDignosticosSanitarios.DataSet     then dtsDignosticosSanitarios.Enabled     := True ;
  if AGrid = dtsCrescimento.DataSet               then dtsCrescimento.Enabled               := True ;
  if AGrid = dtsCondicaoCorporal.DataSet          then dtsCondicaoCorporal.Enabled          := True ;
  if AGrid = dtsDesmame.DataSet                   then dtsDesmame.Enabled                   := True ;
  if AGrid = dtsDescartes.DataSet                 then dtsDescartes.Enabled                 := True ;
  if AGrid = dtsTarefas.DataSet                   then dtsTarefas.Enabled                   := True ;
  if AGrid = dtsExames.DataSet                    then dtsExames.Enabled                    := True ;
  if AGrid = dtsResultados.DataSet                then dtsResultados.Enabled                := True ;
  if AGrid = dtsBST.DataSet                       then dtsBST.Enabled                       := True ;
  if AGrid = dtsControleLeiteiro.DataSet          then dtsControleLeiteiro.Enabled          := True ;

  if AGrid = dtsCiosCobertura.DataSet             then dbgCiosCoberturas.Visible            := True ;
  if AGrid = dtsDiagnosticoGestacao.DataSet       then dbgDiagnosticosGestacao.Visible      := True ;
  if AGrid = dtsPartosAbortos.DataSet             then dbgPartosAbortos.Visible             := True ;
  if AGrid = dtsSecagens.DataSet                  then dbgSecagens.Visible                  := True ;
  if AGrid = dtsDignosticosSanitarios.DataSet     then dbgDiagnosticosSanitarios.Visible    := True ;
  if AGrid = dtsCrescimento.DataSet               then dbgCrescimento.Visible               := True ;
  if AGrid = dtsCondicaoCorporal.DataSet          then dbgCondicaoCorporal.Visible          := True ;
  if AGrid = dtsDesmame.DataSet                   then dbgDesmame.Visible                   := True ;
  if AGrid = dtsDescartes.DataSet                 then dbgDescartes.Visible                 := True ;
  if AGrid = dtsTarefas.DataSet                   then dbgTarefas.Visible                   := True ;
  if AGrid = dtsExames.DataSet                    then dbgExames.Visible                    := True ;
  if AGrid = dtsResultados.DataSet                then dbgResultados.Visible                := True ;
  if AGrid = dtsBST.DataSet                       then dbgBST.Visible                       := True ;
  if AGrid = dtsControleLeiteiro.DataSet          then
    begin
      lblDataUCL.Caption := FormatDateTime( 'dd/mm/yyyy', Zoo_AtividadesUltimasTarefasDatamodule.FData ) ;
      lblDataUCL.Visible := True ;
      dbgControleLeiteiro.Visible          := True ;
    end;

end;

procedure TZoo_AtividadesUltimasTarefasWizard.TcFormActivate(Sender: TObject);
begin
  inherited;
  FFirstView := False ;
end;

procedure TZoo_AtividadesUltimasTarefasWizard._actPriorExecute(Sender: TObject);
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

{ TZoo_AtividadesUltimasTarefasDash }

constructor TZoo_AtividadesUltimasTarefasDash.Create(AOwner: TComponent);
begin
  inherited ;
end;


initialization
  RegisterClass ( TZoo_AtividadesUltimasTarefasWizard ) ;
  RegisterClass ( TZoo_AtividadesUltimasTarefasDash ) ;
end.
