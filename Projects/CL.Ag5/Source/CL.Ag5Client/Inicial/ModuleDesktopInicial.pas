unit ModuleDesktopInicial;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ImgList, VCL.ActnList, VCL.StdCtrls, Tabs, DockTabSet,
  VirtualTrees, VCL.ExtCtrls, VCL.Buttons, JvExExtCtrls, JvExtComponent, JvPanel,
  DockedDeskTop,
  UFloatDeskTop, pngimage, System.Actions, System.ImageList, JvClock,
  Tc.VCL.Application;

type
  TInicialDesktop = class(TModuleDesktopBase)
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    actLicencas: TAction;
    Timer1: TTimer;
    procedure actLicencasExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure OpenDBEntidades ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
  end;


implementation

{$R *.dfm}

uses ThreadSuppl, Tc.DBRTL.AbstractDB, UDomainListForm,
      {Tc.VCL.Application,} Debugger  ;

{ TFloatDesktop2 }
                          (*
procedure TInicialDesktop.ShowDomainList;
begin
   dtmSYS_Login.Refresh ;
end;
                            *)
procedure TInicialDesktop.actLicencasExecute(Sender: TObject);
begin
   with TDomainListForm.Create ( nil ) do
     try
       ShowModal
     finally
       free
     end;
end;

constructor TInicialDesktop.Create(AOwner: TComponent);
var
  Master, CfgZootecnico, CfgFinanceiro, CfgManuais, Producao : PVirtualNode;
begin
  inherited;
(*

  if not Assigned ( TTcAbstractDB.GetByAlias('ENTIDADES') ) then
   begin
     TComponentClass ( GetClass ( 'TDBEntidades' ) ).Create( self ) ;
     //ThreadSuppl.TSimpleThread.Create ( OpenDBEntidades ) ;
//     ThreadSuppl.TSimpleThread.Create ( OpenDBEntidades ) ;
     ThreadSuppl.TSimpleThread.Create ( TTcAbstractDB.GetByAlias( 'ENTIDADES' ).Connection.Open ) ;
   end;

  if not Assigned ( TTcAbstractDB.GetByAlias('ZOOTECNICO') ) then
   begin
     TComponentClass ( GetClass ( 'TDBZootecnico' ) ).Create( self ) ;
     //ThreadSuppl.TSimpleThread.Create ( OpenDBEntidades ) ;
     ThreadSuppl.TSimpleThread.Create ( TTcAbstractDB.GetByAlias( 'ZOOTECNICO' ).Connection.Open ) ;
   end;

  if not Assigned ( TTcAbstractDB.GetByAlias('FINANCEIRO') ) then
   begin
     TComponentClass ( GetClass ( 'TDBFinanceiro' ) ).Create( self ) ;
     //ThreadSuppl.TSimpleThread.Create ( OpenDBEntidades ) ;
     ThreadSuppl.TSimpleThread.Create ( TTcAbstractDB.GetByAlias( 'FINANCEIRO' ).Connection.Open ) ;
   end;

*)
  FLargeImageList := ImageList3 ; // ImageList1 ;
  FSmallImageList := nil ; //ImageList2 ;

  Master := AddMenuItem( nil, 'Cadastros', '' ) ;
  if ( AnsiUpperCase ( Tc.VCL.Application.TTcApplication.Instance.LoggedUser.Login ) = 'ADMIN') then
  begin
    AddMenuItem( Master, 'Fazenda',      'TfrmCAD_Fazendas' ) ;
    AddMenuItem( Master, 'Usuários',     'TfrmSYS_Users' ) ;
  end;
  AddMenuItem( Master, 'Funcionários', 'TfrmCAD_Funcionarios' ) ;


  Master := AddMenuItem( nil, 'Utilitários',    '' ) ;
  AddMenuItem( Master, 'Cópia de segurança',  'TInicial_BackupRestoreDesktop'    ) ;
 // prox release AddMenuItem( Master, 'Atualizar software',  'TInicial_SyncDesktop' ) ; // ATUALIZADOR DE DADOS DO AGENDA / CLINICA
  AddMethodMenuItem( Master, 'Licenças', actLicencasExecute ) ;

  Master := AddMenuItem( nil, 'Configurações',         '' ) ;
  CfgZootecnico := AddMenuItem( Master, 'Zootécnico',         '' ) ;
    AddMenuItem( CfgZootecnico, 'Parâmetros Novilhas',      'TZoo_CfgParamNovilhasForm' , True, True )  ;
    AddMenuItem( CfgZootecnico, 'Parâmetros Matrizes',      'TZoo_CfgParamMatrizesForm' , True, True )  ;
    AddMenuItem( CfgZootecnico, 'Categorias',               'TZoo_CfgCategoriasForm' , True, True )  ;
    AddMenuItem( CfgZootecnico, 'Diagnósticos',             'TZoo_CfgDiagnosticosForm' , True, True )  ;
//    AddMenuItem( CfgZootecnico, 'Protocolos',               'TZoo_CfgProtocolosForm' , True, True )  ;
    AddMenuItem( CfgZootecnico, 'Protocolos',               'TZoo_CfgProtocolosForm2' , True, True )  ;
    AddMenuItem( CfgZootecnico, 'Tarefas',                  'TZoo_CfgTarefasForm' , True, True )  ;
    AddMenuItem( CfgZootecnico, 'Exames',                   'TZoo_CfgExamesForm' , True, True )  ;
    AddMenuItem( CfgZootecnico, 'Automação de Protocolos',  'TZoo_AtribuicaoAutomaticaWizard' , True, True )  ;
    AddMenuItem( CfgZootecnico, 'Automação de Exames',      'TZoo_AutomacaoExamesWizard' , True, True )  ;
    AddMenuItem( CfgZootecnico, 'Exportar/Importar',        'TZoo_CfgImportExportProtocolosWizard' , True, True )  ;
    AddMenuItem( CfgZootecnico, 'Importar SISBOV',          'TZoo_ImportarSISBOVWizard' , True, True )  ;
    AddMenuItem( CfgZootecnico, 'Parâmetros da Fazenda',    'TZoo_CfgParametrosFazendaWizard' , True, True )  ;

  CfgFinanceiro := AddMenuItem( Master, 'Financeiro', '' ) ;
    AddMenuItem( CfgFinanceiro, 'Centro de Custos',   'TfrmFIN_CentrosCusto'  ) ;
    AddMenuItem( CfgFinanceiro, 'Plano de Contas',    'TfrmFIN_PlanoContas2'  ) ;

  CfgManuais := AddMenuItem( nil, 'Guias', '' ) ;
    AddMenuItem( CfgManuais, 'Zootécnico',  'TWBManualZootecnico'  ) ;
    AddMenuItem( CfgManuais, 'Financeiro',  'TWBManualFinanceiro'  ) ;

//  AddMenuItem( Master, '',   'TSYS_VQDWizard' ) ;
//  AddMenuItem( Master, 'Macho Ex',   'TZoo_AnimaisExternosMachoForm' ) ;
//  AddMenuItem( Master, 'Femea Ex',   'TZoo_AnimaisExternosFemeaForm' ) ;
    Subscribe ;

//    ThreadSuppl.TSimpleThread.Create ( OpenDBEntidades ) ;
end;

procedure TInicialDesktop.OpenDBEntidades;
begin
//try
//  TTcAbstractDB.GetByAlias( 'ENTIDADES' ).Connection.Open ;

  if not Assigned ( TTcAbstractDB.GetByAlias('ENTIDADES') ) then
   begin
     TComponentClass ( GetClass ( 'TDBEntidades' ) ).Create( self ) ;
     //ThreadSuppl.TSimpleThread.Create ( OpenDBEntidades ) ;
//     ThreadSuppl.TSimpleThread.Create ( OpenDBEntidades ) ;
     TTcAbstractDB.GetByAlias( 'ENTIDADES' ).Connection.Open  ;
   end;

  if not Assigned ( TTcAbstractDB.GetByAlias('ZOOTECNICO') ) then
   begin
     TComponentClass ( GetClass ( 'TDBZootecnico' ) ).Create( self ) ;
     //ThreadSuppl.TSimpleThread.Create ( OpenDBEntidades ) ;
     TTcAbstractDB.GetByAlias( 'ZOOTECNICO' ).Connection.Open ;
   end;

  if not Assigned ( TTcAbstractDB.GetByAlias('FINANCEIRO') ) then
   begin
     TComponentClass ( GetClass ( 'TDBFinanceiro' ) ).Create( self ) ;
     //ThreadSuppl.TSimpleThread.Create ( OpenDBEntidades ) ;
     TTcAbstractDB.GetByAlias( 'FINANCEIRO' ).Connection.Open  ;
   end;

end;

procedure TInicialDesktop.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False ;
  OpenDBEntidades ;
end;

Initialization
   RegisterClass (  TInicialDesktop ) ;

end.
