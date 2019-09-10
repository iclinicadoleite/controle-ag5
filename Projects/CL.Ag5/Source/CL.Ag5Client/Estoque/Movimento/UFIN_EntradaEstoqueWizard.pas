// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Controle de Estoque
// Funcionality : Entrada de estoque
//
// License      : veja readme.txt




unit UFIN_EntradaEstoqueWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvXPBar,
  JvExControls, JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator,
  JvComponentBase, JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, UFIN_EntradaEstoqueDatamodule,
  SysFormListaFicha, ReportTypes, JvExExtCtrls, JvImage, JvExtComponent,
  JvPanel, VCL.ImgList, Tc.VCL.Edits, Tc.VCL.Edits.DBControls, VCL.DBCtrls,
  JvExStdCtrls, JvCombobox, JvDBCombobox, JvBaseEdits, JvDBControls,
  System.Actions, System.ImageList, Tc.VCL.Extended.Mask, uImageListProvider,
  Tc.VCL.Application, Wrappers ;

type
  TFIN_EntradaEstoqueWizard = class(T_FormListaFicha)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    TcMPDBDateEdit1: TTcDBDateEdit;
    Label3: TLabel;
    dbcbProduto: TJvDBComboEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    dbtCodigo: TDBText;
    dbtNome: TDBText;
    dbtUnidade: TDBText;
    Label6: TLabel;
    Label10: TLabel;
    DBMemo1: TDBMemo;
    JvDBCalcEdit2: TJvDBCalcEdit;
    Label7: TLabel;
    Label8: TLabel;
    JvDBCalcEdit1: TJvDBCalcEdit;
    dbcbPlanoConta: TJvDBComboEdit;
    Label12: TLabel;
    Label13: TLabel;
    dbcbEntidade: TJvDBComboEdit;
    Label9: TLabel;
    DBText1: TDBText;
    Label11: TLabel;
    Label14: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Label15: TLabel;
    DBText4: TDBText;
    Label16: TLabel;
    deDtInicial: TTcDateEdit;
    Label17: TLabel;
    deDtFinal: TTcDateEdit;
    procedure dbcbProdutoButtonClick(Sender: TObject);
    procedure dbcbProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure dbcbPlanoContaButtonClick(Sender: TObject);
    procedure dbcbPlanoContaKeyPress(Sender: TObject; var Key: Char);
    procedure dbcbEntidadeButtonClick(Sender: TObject);
    procedure dbcbEntidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dbcbEntidadeEnter(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure deDtInicialExit(Sender: TObject);
    procedure deDtFinalExit(Sender: TObject);
  private
    { Private declarations }
    procedure ProcessSuccessInfo ;
    procedure SearchPlanoConta;
    procedure ChangeFilter;
  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
    procedure SearchProduto ( TextToSearch : string);
    procedure SearchEntidade ( TextToSearch : string);
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SearchsFinanceiro,
     CLAg5SvcFinanceiroApropriacao,
     ThreadSuppl ;

{$R *.dfm}

procedure TFIN_EntradaEstoqueWizard.ChangeFilter;
begin
  TFIN_EntradaEstoqueDatamodule( DataModuleBase ).SetFilter( deDtInicial.Date, deDtFinal.Date );
end;

constructor TFIN_EntradaEstoqueWizard.Create(AOwner: TComponent);
begin
  inherited;
  deDtInicial.Date := Date - 7 ;
  deDtFinal.Date   := Date  ;

  TFIN_EntradaEstoqueDatamodule.Create( Self );
  DatamoduleBase.OpenTables ;
//  TFIN_EntradaEstoqueDatamodule( DataModuleBase ).OnChangePeriodo   := ChangePeriodo ;
//  TFIN_EntradaEstoqueDatamodule( DataModuleBase ).OnCheckDate       := CheckDate ;
//  TFIN_EntradaEstoqueDatamodule( DataModuleBase ).OnHiddingByFilter := HiddingByFilter ;
  ChangeFilter;

end;

procedure TFIN_EntradaEstoqueWizard.dbcbProdutoButtonClick(Sender: TObject);
begin
  inherited;
  SearchProduto( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TFIN_EntradaEstoqueWizard.dbcbProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    SearchProduto( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TFIN_EntradaEstoqueWizard.deDtFinalExit(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

procedure TFIN_EntradaEstoqueWizard.deDtInicialExit(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

procedure TFIN_EntradaEstoqueWizard.dbcbPlanoContaButtonClick(Sender: TObject);
begin
  inherited;
  SearchPlanoConta;
end;

procedure TFIN_EntradaEstoqueWizard.dbcbPlanoContaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    SearchPlanoConta;
end;

procedure TFIN_EntradaEstoqueWizard.dbcbEntidadeButtonClick(Sender: TObject);
begin
  inherited;
  SearchEntidade( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TFIN_EntradaEstoqueWizard.dbcbEntidadeEnter(Sender: TObject);
begin
  inherited;
//  with TFIN_EntradaEstoqueDatamodule( DatamoduleBase ) do
//    begin
//      if not ( cdsEstoque.State in [dsInsert, dsEdit] ) then
//        cdsEstoque.Edit;
//
//      cdsEstoqueKCAD_ENTIDADE.Clear;
//      cdsEstoqueNOMEENTIDADE.Clear;
//    end;
end;

procedure TFIN_EntradaEstoqueWizard.dbcbEntidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    SearchEntidade( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TFIN_EntradaEstoqueWizard.Pesquisar;
begin
  inherited ;
  with TFIN_EntradaEstoqueDatamodule( DatamoduleBase ), TSearchEstoqueOutrasEntradas.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsLstEstoque.Locate( 'KEST_OUTRA_ENTRADA_SAIDA', Result.FieldByName( 'KEST_OUTRA_ENTRADA_SAIDA' ).Value, [] ) ;
             ActiveFicha;
          end ;
     finally
        free ;
     end ;
end;

procedure TFIN_EntradaEstoqueWizard.ProcessSuccessInfo;
begin
//  NotificationService.NotifyStr( self, 'PROCESS_' + ClassName );
end;

procedure TFIN_EntradaEstoqueWizard.SearchEntidade(TextToSearch: string);
begin
  with TFIN_EntradaEstoqueDatamodule( DatamoduleBase ), TSearchFornecedorAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        SetEntidade( Result.FieldByName( 'KCAD_ENTIDADE' ).asString,
                     Result.FieldByName( 'NOME' ).asString ) ;
    finally
      free ;
    end ;
end;

procedure TFIN_EntradaEstoqueWizard.SearchPlanoConta;
begin

  with TFIN_EntradaEstoqueDatamodule( DatamoduleBase ) do
    SvcFinanceiroApropriacaoEdit.ExecuteTela( 'EST_OUTRAS_ENTRADAS_SAIDAS',
                                        cdsEstoque,
                                        cdsApropriacao,
                                        TelaProduto,
                                        [tpAtivo],//[tpAtivo,tpDespesas],
                                        pfSomenteEstoque ); // true somente estoque ....
end;

procedure TFIN_EntradaEstoqueWizard.SearchProduto(TextToSearch: string);
begin
  with TFIN_EntradaEstoqueDatamodule( DatamoduleBase ), TSearchProdutoInsumoAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        SetProduto( Result.FieldByName( 'KEST_PRODUTO' ).asString,
                    Result.FieldByName( 'CODIGO' ).asString,
                    Result.FieldByName( 'NOME' ).asString,
                    Result.FieldByName( 'UNIDADE' ).AsString,
                    Result.FieldByName( 'DESCRICAO' ).AsString,
                    Result.FieldByName( 'CUSTO_MEDIO' ).AsFloat,
                    Result.FieldByName( 'QTDE_PRODUTO' ).AsFloat,
                    Result.FieldByName( 'KFIN_PLANOCONTA' ).asString,
                    Result.FieldByName( 'DESCR_PLANOCONTA' ).asString,
                    Result.FieldByName( 'BAIXA_ESTOQUE' ).asBoolean
                    ) ;


    finally
      free ;
    end ;
end;

procedure TFIN_EntradaEstoqueWizard._actSaveExecute(Sender: TObject);
begin
  inherited;
//
end;

initialization
  RegisterClass ( TFIN_EntradaEstoqueWizard ) ;

end.
