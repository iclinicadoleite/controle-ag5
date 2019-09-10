unit ModuleDesktopZootecnico;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ImgList, VCL.ActnList, VCL.StdCtrls, Tabs, DockTabSet,
  VirtualTrees, VCL.ExtCtrls, VCL.Buttons, JvExExtCtrls, JvExtComponent, JvPanel,
  DockedDeskTop, Tc.RTL.Packages.Manager,
  UFloatDeskTop, pngimage, ThreadSuppl, System.Actions, System.ImageList,
  JvClock, Tc.VCL.Application ;

type
  TZooDesktop = class(TModuleDesktopBase)
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    actCfgReports: TAction;
    procedure TcMPFormActivate(Sender: TObject);
    procedure actCfgReportsExecute(Sender: TObject);
  private
    { Private declarations }
    FBeginActivated : boolean ;
    procedure OpenDBZootecnico ;
    procedure DashBoard1 ;
    procedure DashBoard2 ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
  end;

implementation

uses ShellAPI, Tc.DBRTL.AbstractDB, Debugger ;

{$R *.dfm}


var
  ErrPkg : string ;

function LoadPackage ( APackageName : string ) : cardinal ;
begin
  try
    Result := PackageManager.LoadPackage( APackageName ) ;
  except On E : Exception do
    begin
      ErrPkg := ErrPkg + APackageName + ' ' + E.Message + #13#10 ;
    end;
  end;
end ;

{ TZooDesktop }

procedure TZooDesktop.actCfgReportsExecute(Sender: TObject);
begin
// ShowMessage ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.ReportServerConfig.exe' ) ;
  ShellExecute( 0, 'open', PChar ( ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.ReportServerConfig.exe' ), nil, nil, SW_SHOW ) ;
end;

constructor TZooDesktop.Create(AOwner: TComponent);
var
  Master, EntradaDados, OutrosDados, Atividades, Producao, Avaliacoes : PVirtualNode;
begin

  inherited;

  if HInstance <> GetModuleHandle( nil ) then
    begin
       LoadPackage ( 'CL.Ag5.Zootecnico.EntradaDados.Sanidade.bpl' ) ;
       LoadPackage ( 'CL.Ag5.Zootecnico.EntradaDados.Producao.bpl' ) ;
       LoadPackage ( 'CL.Ag5.Zootecnico.EntradaDados.Reproducao.bpl' ) ;
       LoadPackage ( 'CL.Ag5.Zootecnico.EntradaDados.Crescimento.bpl' ) ;
       LoadPackage ( 'CL.Ag5.Zootecnico.BancoDados.Machos.bpl' ) ;
       LoadPackage ( 'CL.Ag5.Zootecnico.BancoDados.Femeas.bpl' ) ;
       LoadPackage ( 'CL.Ag5.Zootecnico.AnimaisExternos.bpl' ) ;
       LoadPackage ( 'CL.Ag5.Inicial.Zootecnico.ImportSISBOV.bpl' ) ;
       LoadPackage ( 'CL.Ag5.Zootecnico.Atividades.bpl' ) ;
       LoadPackage ( 'CL.Ag5.Zootecnico.Configuracoes.bpl' ) ;
       LoadPackage ( 'CL.Ag5.Zootecnico.Relatorios.bpl' ) ;
    end;

   if not Assigned ( TTcAbstractDB.GetByAlias('ENTIDADES') ) then
     begin
       TDebugger.WriteLine ('ZOO.GetClass ( TDBEntidades )') ;
       TComponentClass ( GetClass ( 'TDBEntidades' ) ).Create( self ) ;
       TDebugger.WriteLine ('ZOO.GetClass ( TDBEntidades ) = OK' ) ;
     end;

   if not Assigned ( TTcAbstractDB.GetByAlias('ZOOTECNICO') ) then
     begin
       TDebugger.WriteLine ('ZOO.GetClass ( TDBZootecnico )') ;
       TComponentClass ( GetClass ( 'TDBZootecnico' ) ).Create( self ) ;
       ThreadSuppl.TSyncThread.Create ( OpenDBZootecnico ) ;
       TDebugger.WriteLine ('ZOO.GetClass ( TDBZootecnico ) = OK') ;
     end;

  FLargeImageList := ImageList3 ;
  FSmallImageList := nil ; //ImageList2 ;

  Master := AddMenuItem( nil, 'Relatórios',  '' ) ;
    AddMenuItem( Master, 'Inventário',                    'TZoo_RelatorioInventario'        ) ;
    AddMenuItem( Master, 'Personalizados',                'TZoo_RelatorioPersonalizado'     ) ;
    AddMenuItem( Master, 'Diário da Mastite',             'TZoo_AtividadesDiarioDaMastiteWizard'     ) ;
    AddMenuItem( Master, 'Nascimentos',                   'TZoo_RelatorioNascimentos'       ) ;
    AddMenuItem( Master, 'Coberturas',                    'TZoo_RelatorioCoberturas'        ) ;

    AddMenuItem( Master, 'Eventos reprodutivos',          'TZoo_RelatorioEventosReprodutivos'        ) ;


    //removido temporariamente a pedido do Vitor/Marsola
    //AddMenuItem( Master, 'Rastreamento',            'TZoo_RelatorioRastreamento'      ) ;
(*
      Atividades := AddMenuItem( Master, 'Atividades a Executar', '' ) ;
//      AddMenuItem( Atividades, 'Lista de Ações',           'TZoo_AtividadesListaDeAcoesDesktop' ) ;
      AddMenuItem( Atividades, 'Reprodução',               'TZoo_AtividadesReproducaoDesktop' ) ;
      AddMenuItem( Atividades, 'Produção',                 'TZoo_AtividadesProducaoDesktop' ) ;
      AddMenuItem( Atividades, 'Tarefas',                  'TZoo_AtividadesTarefasWizard' ) ;
      AddMenuItem( Atividades, 'Listagens',                'TZoo_AtividadesListagensWizard' ) ;
      AddMenuItem( Atividades, 'Listagens Veterinárias',   'TZoo_AtividadesListagemVeterianariasDesktop' ) ;
      AddMenuItem( Atividades, 'Crescimento',              'TZoo_AtividadesCrescimentoDesktop' ) ;
      //AddMenuItem( Atividades, 'Protocolos',               'TZoo_AtividadesProtocolosWizard' ) ;
      //AddMenuItem( Master, 'Configurar Rastreamento', 'TZoo_CfgRelatorioRastreamento'   ) ;
    AddMenuItem( Master, 'SISBOV',                  'TZoo_RelatorioSISBOV'            ) ;
*)

      Atividades := AddMenuItem( Master, 'Atividades', '' ) ;
      AddMenuItem( Atividades, 'à Executar',    'TZoo_DesktopAtividadesAExecutar' ) ;
      AddMenuItem( Atividades, 'Coletivas',     'TZoo_DesktopAtividadesColetivo' ) ;
      AddMenuItem( Atividades, 'Executadas',    'TZoo_AtividadesUltimasTarefasWizard' ) ;

      Avaliacoes := AddMenuItem( Master, 'Avaliações', '' ) ;
      AddMenuItem( Avaliacoes, 'Touros e sêmens',  'TZoo_RelatorioTaxaConcepcao'        ) ;
      AddMenuItem( Avaliacoes, 'Bezerras',         'TZooRelatotioAvaliacaoBezerras_frm'        ) ;
      AddMenuItem( Avaliacoes, 'Protocolos repro. e IATF', 'TZoo_RelatorioProtocolosReprodutivosIATF'        ) ;
/////    AddMenuItem( Master, 'SISBOV',                  'TZoo_RelatorioSISBOV'            ) ;



  Master := AddMenuItem( nil, 'Entrada de Dados', '' ) ;
    AddMenuItem( Master, 'Produção',      'TfrmZoo_DesktopProducao' ,     True, True ) ;
    AddMenuItem( Master, 'Reprodução',    'TfrmZoo_DeskTopReproducao' ,   True, True ) ;
    AddMenuItem( Master, 'Sanidade',      'TfrmZoo_DesktopSanidade' ,     True, True ) ;
    AddMenuItem( Master, 'Crescimento',   'TfrmZoo_DesktopCrescimento' ,  True, True ) ;
    AddMenuItem( Master, 'Descartes',     'TZoo_DescartesWizard' ,        True, True ) ;

    //AddMenuItem( Master, 'Indicadores',   'TfrmZoo_DesktopIndicadores' ,  True, True ) ;
      OutrosDados := AddMenuItem( Master, 'Outros Dados',  '' ) ;
      AddMenuItem( OutrosDados, 'Troca de Brinco',        'TZoo_TrocaDeBrincoWizard'      , True, True )  ;
      AddMenuItem( OutrosDados, 'Troca de Lote / Retiro', 'TZooTrocaRetirosLotesWizard'   , True, True ) ;
     // AddMenuItem( OutrosDados, 'Troca de Lote',        'TZoo_TrocaDeLoteWizard' , True, True )  ;
     // AddMenuItem( OutrosDados, 'Troca de Retiro',      'TZoo_TrocaDeRetiroWizard' , True, True )  ;
      AddMenuItem( OutrosDados, 'Compra de Sêmen',        'TZoo_EntradaEstoqueSemenWizard', True, True )  ;


  Master := AddMenuItem( nil, 'Banco de Dados', '' ) ;
    AddMenuItem( Master, 'Fêmeas',   'TZoo_BancoDadosFemeaForm' ) ;
    AddMenuItem( Master, 'Machos',   'TZoo_BancoDadosMachoForm' ) ;
    AddMenuItem( Master, 'Embriões', 'TZoo_BancoDadosEmbriaoForm' ) ;
    AddMenuItem( Master, 'Tanques',  'TZoo_BancoDadosTanquesForm' ) ;



  Master := AddMenuItem( nil, 'Utilitários', '' ) ;
    AddMenuItem( Master, 'Recalcular Lactação',   'TfrmZoo_ProducaoRecalculoLactacao' ) ;
    AddMethodMenuItem( Master, 'Impressão automática', actCfgReportsExecute ) ;


(*
  Master := AddMenuItem( nil, 'Configurações',         '' ) ;
  AddMenuItem( Master, 'Parâmetros Novilhas',      'TZoo_CfgParamNovilhasForm' , True, True )  ;
  AddMenuItem( Master, 'Parâmetros Matrizes',      'TZoo_CfgParamMatrizesForm' , True, True )  ;
  AddMenuItem( Master, 'Categorias',               'TZoo_CfgCategoriasForm' , True, True )  ;
  AddMenuItem( Master, 'Diagnósticos',             'TZoo_CfgDiagnosticosForm' , True, True )  ;
  AddMenuItem( Master, 'Protocolos',               'TZoo_CfgProtocolosForm' , True, True )  ;
  AddMenuItem( Master, 'Tarefas',                  'TZoo_CfgTarefasForm' , True, True )  ;
  AddMenuItem( Master, 'Exames',                   'TZoo_CfgExamesForm' , True, True )  ;
  AddMenuItem( Master, 'Automação de Protocolos',  'TZoo_AtribuicaoAutomaticaWizard' , True, True )  ;
  AddMenuItem( Master, 'Exportar/Importar',        'TZoo_CfgImportExportProtocolosWizard' , True, True )  ;
  AddMenuItem( Master, 'Importar SISBOV',          'TZoo_ImportarSISBOVWizard' , True, True )  ;
  AddMenuItem( Master, 'Parâmetros da Fazenda',    'TZoo_CfgParametrosFazendaWizard' , True, True )  ;
 *)
  Subscribe ;



end;

procedure TZooDesktop.DashBoard1;
begin
  //self.FDesktop.NewForm( TComponentClass ( FindClass (  'TZoo_AtividadesCiosCoberturasProximosDias' ) ) ) ;
  self.FDesktop.NewForm( TComponentClass ( FindClass (  'TZoo_AtividadesTarefasProximosDias' ) ) ) ;
end;

procedure TZooDesktop.DashBoard2;
begin
  //self.FDesktop.NewForm( TComponentClass ( FindClass (  'TZoo_AtividadesCiosCoberturasProximosDias' ) ) ) ;
  self.FDesktop.NewForm( TComponentClass ( FindClass (  'TZoo_AtividadesUltimasTarefasDash' ) ) ) ;
end;




procedure TZooDesktop.OpenDBZootecnico;
begin
  TTcAbstractDB.GetByAlias( 'ZOOTECNICO' ).Connection.Open ;
end;

procedure TZooDesktop.TcMPFormActivate(Sender: TObject);
begin
  if not FBeginActivated then
    begin
      Application.ProcessMessages ;
      ThreadSuppl.TSyncThread.Create ( Dashboard1 ) ;
      ThreadSuppl.TSyncThread.Create ( DashBoard2 ) ;
      FBeginActivated := True ;
    end;
end;

initialization
   RegisterClass ( TZooDesktop ) ;

end.
