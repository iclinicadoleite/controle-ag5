// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Cadastros
// Funcionality : Cadastro de contas
//
// License      : veja readme.txt




unit UfrmFIN_Contas2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, SysFormListaFicha, ReportTypes, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvDBControls, VCL.DBCtrls, JvBaseEdits, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, VCL.ImgList, JvExStdCtrls, JvCombobox, JvDBCombobox,
  Tc.VCL.Form, Tc.VCL.Controls.GDIButton, System.Actions,
  System.ImageList, Tc.VCL.Edits.Numbers, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, uImageListProvider, Wrappers ;

type
  TfrmFIN_Contas2 = class(T_FormListaFicha)
    Panel2: TPanel;
    Label1: TLabel;
    dbNomeConta: TDBEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dbDataInicial: TTcDBDateEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbCC: TDBEdit;
    edtBancos: TJvDBComboEdit;
    Label10: TLabel;
    cbxInativos: TCheckBox;
    Label24: TLabel;
    cbStatus: TJvDBComboBox;
    DBText1: TDBText;
    Label4: TLabel;
    DBText2: TDBText;
    dbAgencia: TDBEdit;
    _actPrintMovimentacao: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    btnBancos: TTcGDIButton;
    TcDBCalcEdit1: TTcDBCalcEdit;
    TcGDIButton1: TTcGDIButton;
    procedure edtBancosEnter(Sender: TObject);
    procedure edtBancosButtonClick(Sender: TObject);
    procedure SearchBanco ( TextToSearch : string);
    procedure edtBancosKeyPress(Sender: TObject; var Key: Char);
    procedure cbxInativosClick(Sender: TObject);
    procedure _actDeleteExecute(Sender: TObject);
    procedure _actPrintMovimentacaoExecute(Sender: TObject);
    procedure btnBancosClick(Sender: TObject);
    procedure TcDBCalcEdit1Enter(Sender: TObject);
    procedure TcGDIButton1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
    procedure ChangeFilter ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation
uses SearchsFinanceiro, UDBFinanceiro, ThreadSuppl, UdtmFIN_Contas2,
    UFin_MovimentacaoContasReport { , UfrmFIN_Bancos } ;

{$R *.dfm}

procedure TfrmFIN_Contas2.btnBancosClick(Sender: TObject);
begin
//  inherited;
//  TfrmFIN_Bancos.NovoBanco;
end;

procedure TfrmFIN_Contas2.cbxInativosClick(Sender: TObject);
begin
  inherited;
  ThreadSuppl.TSyncThread.Create (  ChangeFilter ) ;
end;

procedure TfrmFIN_Contas2.ChangeFilter;
begin
  TdtmFIN_Contas2( DatamoduleBase ).SetFilter ( cbxInativos.Checked );
end;

constructor TfrmFIN_Contas2.Create(AOwner: TComponent);
begin
  inherited;
  TdtmFIN_Contas2.Create ( self ) ;
  DatamoduleBase.OpenTables ;
end;

procedure TfrmFIN_Contas2.edtBancosButtonClick(Sender: TObject);
begin
  SearchBanco( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmFIN_Contas2.edtBancosEnter(Sender: TObject);
begin
  edtBancos.SelectAll ;
end;

procedure TfrmFIN_Contas2.edtBancosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #13  ) then
    TJvDBComboEdit( Sender ).DoClick ;
end;

procedure TfrmFIN_Contas2.Pesquisar;
begin
  inherited ;
  if cbxInativos.Checked then
    begin
      with TdtmFIN_Contas2( DatamoduleBase ), TSearchConta.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
              cdsLstContas.Locate( 'KFIN_CONTA', Result.FieldByName( 'KFIN_CONTA' ).Value, [] ) ;
              ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end
  else
    begin
      with TdtmFIN_Contas2( DatamoduleBase ), TSearchContaAtiva.Create do
         try
            TextToFind := _edtSearch.Text ;
            if Execute then
              begin
                 cdsLstContas.Locate( 'KFIN_CONTA', Result.FieldByName( 'KFIN_CONTA' ).Value, [] ) ;
                 ActiveFicha ;
              end ;
         finally
            free ;
         end ;
    end;
end;

procedure TfrmFIN_Contas2.SearchBanco(TextToSearch: string);
begin
  with TdtmFIN_Contas2( DatamoduleBase ), TSearchBanco.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
         SetBanco ( Result.FieldByName( 'KFIN_BANCO' ).asString,
                    Result.FieldByName( 'CODIGO' ).asString,
                    Result.FieldByName( 'NOME' ).asString ) ;
    finally
      free ;
    end ;
end;

procedure TfrmFIN_Contas2.TcDBCalcEdit1Enter(Sender: TObject);
begin
  inherited;

  {if not (TcDBCalcEdit1.DataSource.DataSet.State in [dsEdit, dsInsert])then
   begin
     TcDBCalcEdit1.DataSource.DataSet.Edit;
     TcDBCalcEdit1.SelectAll;
   end;
   }
end;

procedure TfrmFIN_Contas2.TcGDIButton1Click(Sender: TObject);
var
  Point: TArray<System.byte>;
begin
  Point := TdtmFIN_Contas2( DatamoduleBase ).cdsLstContas.GetBookmark;
  TdtmFIN_Contas2( DatamoduleBase ).SetContaFavorita;
  TdtmFIN_Contas2( DatamoduleBase ).OpenTables;
  TdtmFIN_Contas2( DatamoduleBase ).cdsLstContas.GotoBookmark(Point);

end;

procedure TfrmFIN_Contas2._actDeleteExecute(Sender: TObject);
begin
  if TdtmFIN_Contas2( DatamoduleBase).ContaComMovimento then
    begin
      if MessageDlg( 'Esta conta não pode ser excluída por conter movimentos ' +
                     #13#10 + 'Deseja desativá-la ??', mtWarning, [mbYes, mbNo] ) = mrYes then
        begin
          if not ( TdtmFIN_Contas2( DatamoduleBase ).cdsConta.State in [dsInsert, dsEdit] ) then
            TdtmFIN_Contas2( DatamoduleBase ).cdsConta.Edit;

            TdtmFIN_Contas2( DatamoduleBase ).cdsContaATIVA.AsString := 'F';
            TdtmFIN_Contas2( DatamoduleBase ).cdsConta.Post;
            TdtmFIN_Contas2( DatamoduleBase ).ApplyUpdates;
            _pageControl.ActivePage := _tbsLista;
        end;
    end
  else
    inherited;
end;

procedure TfrmFIN_Contas2._actPrintMovimentacaoExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsContasBancarias ;
begin
  PReport              := ReportTypes.TReportParamsContasBancarias.Create ;
  PReport.KSYS_DOMAIN := LoggedUser.DomainID;
  PReport.StartDate    := Date - 30;
  PReport.EndDate      := Date;
  PReport.ReportTitle  := 'Movimentação de Contas' ;
  TFIN_MovimentacaoContasReport.ExecuteDialog( PReport );
  PReport.Free;
end;

initialization
  RegisterClass ( TfrmFIN_Contas2 ) ;

end.

