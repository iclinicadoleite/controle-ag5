// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Controle de Estoque
// Funcionality : Consumo de estoque
//
// License      : veja readme.txt




unit UFIN_SaidaEstoqueWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvXPBar,
  JvExControls, JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator,
  JvComponentBase, JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, SysFormListaFicha, ReportTypes,
  JvExExtCtrls, JvImage, JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox,
  JvDBCombobox, VCL.DBCtrls, JvBaseEdits, JvDBControls, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, VCL.ImgList, UFIN_SaidaEstoqueDatamodule,
  System.Actions, System.ImageList, Tc.VCL.Extended.Mask, Tc.VCL.Application,
  uImageListProvider, Wrappers ;

type
  TFIN_SaidaEstoqueWizard = class(T_FormListaFicha)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    TcMPDBDateEdit1: TTcDBDateEdit;
    JvDBComboEdit1: TJvDBComboEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    dbtCodigo: TDBText;
    dbtNome: TDBText;
    dbtUnidade: TDBText;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    DBText2: TDBText;
    Label9: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    JvDBCalcEdit2: TJvDBCalcEdit;
    Label8: TLabel;
    JvDBComboEdit2: TJvDBComboEdit;
    Label11: TLabel;
    DBText3: TDBText;
    Label13: TLabel;
    DBText4: TDBText;
    Label14: TLabel;
    deDtInicial: TTcDateEdit;
    deDtFinal: TTcDateEdit;
    Label15: TLabel;
    procedure JvDBComboEdit1ButtonClick(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure JvDBComboEdit2ButtonClick(Sender: TObject);
    procedure JvDBComboEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure deDtInicialExit(Sender: TObject);
    procedure deDtFinalExit(Sender: TObject);
  private
    { Private declarations }
    procedure SearchPlanoConta;
    procedure ChangeFilter;
    procedure CheckCC ;
  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
    procedure SearchProduto ( TextToSearch : string);
    procedure ProcessSuccessInfo ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SearchsFinanceiro,
     CLAg5SvcFinanceiroApropriacao,
     ThreadSuppl ;

{$R *.dfm}

procedure TFIN_SaidaEstoqueWizard.ChangeFilter;
begin
  TFIN_SaidaEstoqueDatamodule( DataModuleBase ).SetFilter( deDtInicial.Date, deDtFinal.Date );
end;

procedure TFIN_SaidaEstoqueWizard.CheckCC;
begin
  with TFIN_SaidaEstoqueDatamodule( DatamoduleBase ) do
    if ( cdsEstoqueKFIN_PLANOCONTA.AsString.Trim <> '' ) then
      if SvcFinanceiroApropriacaoDefault.NeedCC ( cdsEstoqueKFIN_PLANOCONTA.AsString ) then
        if cdsApropriacao.IsEmpty then
           SearchPlanoConta;
end;

constructor TFIN_SaidaEstoqueWizard.Create(AOwner: TComponent);
begin
  inherited;

  deDtInicial.Date := Date - 7 ;
  deDtFinal.Date   := Date  ;

  TFIN_SaidaEstoqueDatamodule.Create( Self );
  DatamoduleBase.OpenTables ;
//  TFIN_SaidaEstoqueDatamodule( DataModuleBase ).OnChangePeriodo   := ChangePeriodo ;
//  TFIN_SaidaEstoqueDatamodule( DataModuleBase ).OnCheckDate       := CheckDate ;
//  TFIN_SaidaEstoqueDatamodule( DataModuleBase ).OnHiddingByFilter := HiddingByFilter ;
  ChangeFilter;

end;

procedure TFIN_SaidaEstoqueWizard.deDtFinalExit(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

procedure TFIN_SaidaEstoqueWizard.deDtInicialExit(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

procedure TFIN_SaidaEstoqueWizard.JvDBComboEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  SearchProduto( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TFIN_SaidaEstoqueWizard.JvDBComboEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  SearchPlanoConta;
end;

procedure TFIN_SaidaEstoqueWizard.JvDBComboEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    SearchPlanoConta;
end;

procedure TFIN_SaidaEstoqueWizard.Pesquisar;
begin
  inherited ;
  with TFIN_SaidaEstoqueDatamodule( DatamoduleBase ), TSearchEstoqueOutrasSaidas.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsLstSaidaEstoque.Locate( 'KEST_OUTRA_ENTRADA_SAIDA', Result.FieldByName( 'KEST_OUTRA_ENTRADA_SAIDA' ).Value, [] ) ;
             ActiveFicha;
          end ;
     finally
        free ;
     end ;
end;

procedure TFIN_SaidaEstoqueWizard.ProcessSuccessInfo;
begin
//  NotificationService.NotifyStr( self, 'PROCESS_' + ClassName );
end;

procedure TFIN_SaidaEstoqueWizard.SearchPlanoConta;
begin
  //++kiq agelica pediu pra mostrar todas... 29/11/2013

  with TFIN_SaidaEstoqueDatamodule( DatamoduleBase ) do
    SvcFinanceiroApropriacaoEdit.ExecuteTela( 'EST_OUTRAS_ENTRADAS_SAIDAS',
                                        cdsEstoque,
                                        cdsApropriacao,
                                        TelaProduto,
                                        [ tpDespesas ] ) ;
                                        //[tpAtivo, tpPassivo, tpReceitas, tpDespesas ] );
  TFIN_SaidaEstoqueDatamodule( DatamoduleBase ).cdsEstoque.Edit;
end;

procedure TFIN_SaidaEstoqueWizard.SearchProduto(TextToSearch: string);
begin
  with TFIN_SaidaEstoqueDatamodule( DatamoduleBase ), TSearchProdutoInsumoAtivo.Create do
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
                    Result.FieldByName( 'TIPO_APRD' ).asString
                  ) ;
    finally
      free ;
    end ;
end;

procedure TFIN_SaidaEstoqueWizard._actSaveExecute(Sender: TObject);
begin
  CheckCC;
//  ProcessSuccessInfo;
  inherited;
end;

initialization
  RegisterClass ( TFIN_SaidaEstoqueWizard ) ;

end.
