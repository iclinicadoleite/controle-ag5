// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Lancamentos
// Funcionality : Conciliaçoes bancárias
//
// License      : veja readme.txt





unit UFIN_ConciliacaoBancariaWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvXPBar,
  JvExControls, JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator,
  JvComponentBase, JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, SysFormListaFicha, ReportTypes,
  JvExExtCtrls, JvImage, JvExtComponent, JvPanel, VCL.ImgList, JvBaseEdits,
  JvDBControls, VCL.DBCtrls, JvExStdCtrls, JvCombobox, JvDBCombobox, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, UFIN_ConciliacaoBancariaDatamodule,
  System.ImageList, System.Actions, Tc.VCL.Extended.Mask,
  uImageListProvider, Tc.VCL.Application, Wrappers;

type
  TFIN_ConciliacaoBancariaWizard = class(T_FormListaFicha)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    JvDBComboEdit1: TJvDBComboEdit;
    dbtCodigo: TDBText;
    DBText1: TDBText;
    DBText2: TDBText;
    Label9: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    JvDBCalcEdit1: TJvDBCalcEdit;
    JvDBComboBox1: TJvDBComboBox;
    dbDt_Emissao: TTcDBDateEdit;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    Label8: TLabel;
    dbDt_Compensacao: TTcDBDateEdit;
    DBMemo1: TDBMemo;
    Label11: TLabel;
    cbCompensados: TCheckBox;
    dbrgTipoPagamento: TDBRadioGroup;
    procedure JvDBComboEdit1ButtonClick(Sender: TObject);
    procedure JvDBComboEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cbCompensadosClick(Sender: TObject);
    procedure dbrgTipoPagamentoChange(Sender: TObject);
    procedure _dbgListaDblClick(Sender: TObject);
  private
    { Private declarations }
    Fin_ConciliacaoDatamodule : TFIN_ConciliacaoBancariaDatamodule;
    procedure SearchConta( TextToSearch : string );
  protected
    { Protected declarations }
    procedure OpenTables ;
    procedure Pesquisar ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SearchsFinanceiro ;

{$R *.dfm}

procedure TFIN_ConciliacaoBancariaWizard.cbCompensadosClick(Sender: TObject);
begin
  inherited;
  TFIN_ConciliacaoBancariaDatamodule( DatamoduleBase ).SetFilter( cbCompensados.Checked );
end;

constructor TFIN_ConciliacaoBancariaWizard.Create(AOwner: TComponent);
begin
  inherited;
  Fin_ConciliacaoDatamodule := TFIN_ConciliacaoBancariaDatamodule.Create( Self );
  Fin_ConciliacaoDatamodule.OpenTables ;
  Fin_ConciliacaoDatamodule.SetFilter( cbCompensados.Checked );
end;

procedure TFIN_ConciliacaoBancariaWizard.dbrgTipoPagamentoChange(Sender: TObject);
begin
  inherited;
  if dbrgTipoPagamento.ItemIndex = 1 then
    begin
      dbDt_Compensacao.Date    := dbDt_Emissao.Date;
      dbDt_Compensacao.Enabled := False;
    end
  else
    dbDt_Compensacao.Enabled   := True;
end;

procedure TFIN_ConciliacaoBancariaWizard.JvDBComboEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  SearchConta( TJvDBComboEdit( Sender ).Text ) ;
end;

procedure TFIN_ConciliacaoBancariaWizard.JvDBComboEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     TJvComboEdit( Sender ).DoClick ;
end;

procedure TFIN_ConciliacaoBancariaWizard.OpenTables;
begin
//  UfrmSearchProgress.TfrmSearchProgress.ShowProgress ;
  try
     DatamoduleBase.OpenTables ;
  finally
//     UfrmSearchProgress.TfrmSearchProgress.HideProgress ;
  end ;
end;

procedure TFIN_ConciliacaoBancariaWizard.Pesquisar;
begin
  inherited ;
  with TFIN_ConciliacaoBancariaDatamodule( DatamoduleBase ), TSearchContaAtiva.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsLstConciliacao.Locate( 'KFIN_CONCILIACAO', Result.FieldByName( 'KFIN_CONCILIACAO' ).Value, [] ) ;
             ActiveFicha ;
          end ;
     finally
        free ;
     end ;
end;

procedure TFIN_ConciliacaoBancariaWizard.SearchConta(TextToSearch: string);
begin
  with TFIN_ConciliacaoBancariaDatamodule( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        SetConta( Result.FieldByName( 'KFIN_CONTA' ).asString,
                  Result.FieldByName( 'NOME' ).asString,
                  Result.FieldByName( 'BANCO' ).asString,
                  Result.FieldByName( 'AGENCIA' ).asString,
                  Result.FieldByName( 'CONTA_CORRENTE' ).asString ) ;
    finally
      free ;
    end ;
end;

procedure TFIN_ConciliacaoBancariaWizard._dbgListaDblClick(Sender: TObject);
begin
//  inherited;
end;

initialization
  RegisterClass ( TFIN_ConciliacaoBancariaWizard ) ;


end.
