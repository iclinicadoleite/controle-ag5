unit UfrmFIN_PlanoContas2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, VCL.ComCtrls, VCL.ToolWin,
  SysFormEditaLista, Data.DB, Tc.Data.DB.Helpers, JvExControls, JvXPCore, JvXPBar, JvExComCtrls, VCL.Menus,
  JvExExtCtrls, JvImage, JvExtComponent, JvPanel, VCL.ImgList, VirtualTrees,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.Mask, VCL.DBCtrls,
  JvExStdCtrls, JvCombobox, JvDBCombobox, JvExMask, JvToolEdit, ReportTypes,
  System.ImageList, System.Actions,
  DTDBTreeView, DTClientTree, JvTypes,
  JvDBCheckBox, JvDBControls, Tc.VCL.Application, uImageListProvider, Wrappers ;

type
  TfrmFIN_PlanoContas2 = class(T_FormEditaLista)
    _pnlSearch: TPanel;
    dbtreePlanoContas: TDTClientTree;
    Splitter1: TSplitter;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    dbClassificacao: TDBEdit;
    Label2: TLabel;
    dbDescricao: TDBEdit;
    Label7: TLabel;
    dbcbFixaVariavel: TJvDBComboBox;
    _lblPesquisas: TLabel;
    _edtSearch: TJvComboEdit;
    cbStatus: TJvDBComboBox;
    Label14: TLabel;
    dbcbFluxoCaixa: TJvDBComboBox;
    Label3: TLabel;
    actPrintSelection: TAction;
    actPrintSelection1: TMenuItem;
    rbRaiz: TRadioButton;
    rbSubitem: TRadioButton;
    dbcbTipo: TJvDBComboBox;
    Label4: TLabel;
    dbcbDevCred: TJvDBComboBox;
    Label5: TLabel;
    Label6: TLabel;
    dbcbMovimentaEstoque: TJvDBComboBox;
    Button1: TButton;
    actAllowEdit: TAction;
    JvDBCheckBox1: TJvDBCheckBox;
    lblContaEquivalente: TLabel;
    edContaEquivalente: TJvDBComboEdit;
    lblMascara: TLabel;
    btDescartarEdicao: TButton;
    btEditarPlanos: TButton;
    procedure _actNewExecute(Sender: TObject);
    procedure _edtSearchButtonClick(Sender: TObject);
    procedure _edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure actPrintSelectionExecute(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure dbtreePlanoContasClick(Sender: TObject);
    procedure dbcbTipoChange(Sender: TObject);
    procedure actAllowEditExecute(Sender: TObject);
    procedure actAllowEditUpdate(Sender: TObject);
    procedure _actNewUpdate(Sender: TObject);
    procedure _actEditUpdate(Sender: TObject);
    procedure _actDeleteUpdate(Sender: TObject);
    procedure dbtreePlanoContasPaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType);
    procedure edContaEquivalenteButtonClick(Sender: TObject);
    procedure lblMascaraClick(Sender: TObject);
    procedure btDescartarEdicaoClick(Sender: TObject);
    procedure btEditarPlanosClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValidaCampos;
    function SearchContaEquivalente( TextToSearch: string): boolean;
  protected
    { Protected declarations }
    procedure CheckFieldsVisibility ;
    procedure  Pesquisar ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses
       SearchsFinanceiro
     , CLAg5SvcFinanceiroApropriacao
     , UdtmFIN_PlanoContas2
     , Exceptions
     , UFin_PlanoContasRelatorio
     , CDSSuppl
     , UfrmFIN_PlanoContasEspeciais
     , CL.Ag5.NSMsgs ;

{$R *.dfm}

procedure TfrmFIN_PlanoContas2.Pesquisar;
begin
  inherited ;

  with TdtmFIN_PlanoContas2( DatamoduleBase ), TSearchPlanoContas.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsPlanoContas.Locate( 'KFIN_PLANOCONTA', Result.FieldByName( 'KFIN_PLANOCONTA' ).Value, [] ) ;
             dbtreePlanoContas.SetFocus;
          end ;
     finally
        free ;
     end ;
end;

procedure TfrmFIN_PlanoContas2._actDeleteUpdate(Sender: TObject);
begin
  if TdtmFIN_PlanoContas2( DatamoduleBase ).Tipo_PlanoContas > 0 then
   inherited
  else
   _actDelete.Enabled :=False ;
end;

procedure TfrmFIN_PlanoContas2._actEditUpdate(Sender: TObject);
begin
  if TdtmFIN_PlanoContas2( DatamoduleBase ).Tipo_PlanoContas > 0 then
   inherited
  else
   _actEdit.Enabled := True ;
end;

procedure TfrmFIN_PlanoContas2._actNewExecute(Sender: TObject);
begin
//  inherited;
  with TdtmFIN_PlanoContas2 ( DatamoduleBase ) do
    begin
      ApplyUpdates;

      if rbRaiz.Checked then
        begin
          dbcbFixaVariavel.Enabled := True;
          dbcbTipo.Enabled         := True;
//          dbcbDevCred.Enabled      := True;
        end
      else
        ValidaCampos ;

      dbcbTipo.Enabled         := rbRaiz.Checked ;

      AddChild( rbRaiz.Checked ) ;

      EditRecord;
      dbDescricao.SetFocus;
      cdsPlanoContasNOME.OnValidate := nil;
      cdsPlanoContasNOME.AsString   := '';
      dbDescricao.Text              := EmptyStr ;
      cdsPlanoContasNOME.OnValidate := cdsPlanoContasNOMEValidate;
    end;
end;

procedure TfrmFIN_PlanoContas2._actNewUpdate(Sender: TObject);
begin
  if TdtmFIN_PlanoContas2( DatamoduleBase ).Tipo_PlanoContas > 0 then
   inherited
  else
  _actNew.Enabled := False ;
end;

procedure TfrmFIN_PlanoContas2._actSaveExecute(Sender: TObject);
begin
  if (assigned(Screen.ActiveControl)) then
    SendMessage( Screen.ActiveControl.Handle, CM_EXIT, 0, 0 ) ;
  TCdsSuppl.PostIfNeed( dtsFicha.DataSet );
  inherited;
  ValidaCampos ;
end;

procedure TfrmFIN_PlanoContas2._edtSearchButtonClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmFIN_PlanoContas2._edtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Pesquisar;
end;

procedure TfrmFIN_PlanoContas2.actAllowEditExecute(Sender: TObject);
begin
 if InputBox( 'Liberar edição', #0'Senha:', '' ) <> ( 'CLAg5' + LoggedUser.DomainCode ) then
   raise Warning.Create('Senha inválida');
 TdtmFIN_PlanoContas2( DatamoduleBase ).AlterTipoPlanoContas;
 CheckFieldsVisibility;
end;

procedure TfrmFIN_PlanoContas2.actAllowEditUpdate(Sender: TObject);
begin
 actAllowEdit.Enabled := TdtmFIN_PlanoContas2( DatamoduleBase ).Tipo_PlanoContas = -3 ;
end;

procedure TfrmFIN_PlanoContas2.actPrintSelectionExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsPlanoContas ;
begin
  PReport := ReportTypes.TReportParamsPlanoContas.Create ;
  PReport.KSYS_DOMAIN  := LoggedUser.DomainID ;
  PReport.PLANO        := TdtmFIN_PlanoContas2( DatamoduleBase ).cdsPlanoContasCLASSIFICACAO.AsString;
  PReport.ReportTitle  := 'Relação de Plano de Contas';
  TFIN_PlanoContasRelatorio.Execute( PReport );
  PReport.Free;
end;

procedure TfrmFIN_PlanoContas2.btDescartarEdicaoClick(Sender: TObject);
begin
  if InputBox( 'Descartar edição', #0'Senha:', '' ) <> ( 'CLAg5' + LoggedUser.DomainCode ) then
   raise Warning.Create('Senha inválida');
  TdtmFIN_PlanoContas2( DatamoduleBase ).RestartPlanoContasDefault;
  TCLAg5NSMsgResetDRE.CreateAndDispatch( nil ) ;
  CheckFieldsVisibility;
end;

procedure TfrmFIN_PlanoContas2.btEditarPlanosClick(Sender: TObject);
begin
  UfrmFIN_PlanoContasEspeciais.TfrmFIN_PlanoContasEspeciais.Execute ;
  CheckFieldsVisibility;
end;

procedure TfrmFIN_PlanoContas2.CheckFieldsVisibility;

begin
  lblMascara.Caption            := TdtmFIN_PlanoContas2( DatamoduleBase ).GetMascara ;

  if TdtmFIN_PlanoContas2( DatamoduleBase ).Tipo_PlanoContas > 0 then
    begin
      dbClassificacao.ReadOnly      := False ;
      dbDescricao.ReadOnly          := False ;
      dbcbTipo.ReadOnly             := False ;
      dbcbDevCred.ReadOnly          := False ;
      dbcbFixaVariavel.ReadOnly     := False ;
      dbcbFluxoCaixa.ReadOnly       := False ;
      dbcbMovimentaEstoque.ReadOnly := False ;
      cbStatus.ReadOnly             := False ;
      lblContaEquivalente.Visible   := True  ;
      edContaEquivalente.Visible    := True  ;
      lblMascara.Visible            := True  ;
      btDescartarEdicao.Visible     := True  ;
      btEditarPlanos.Visible := True;
      Button1.Visible           := False;
    end
  else
    begin
      dbClassificacao.ReadOnly      := True ;
      dbDescricao.ReadOnly          := True ;
      dbcbTipo.ReadOnly             := True ;
      dbcbDevCred.ReadOnly          := True ;
      dbcbFixaVariavel.ReadOnly     := True ;
      dbcbFluxoCaixa.ReadOnly       := True ;
      dbcbMovimentaEstoque.ReadOnly := True ;
      cbStatus.ReadOnly             := True ;
      Button1.Visible               := True ;
      lblContaEquivalente.Visible   := False ;
      edContaEquivalente.Visible    := False ;
      lblMascara.Visible            := False ;
      btDescartarEdicao.Visible     := False ;
      btEditarPlanos.Visible := False ;
    end;

end;

constructor TfrmFIN_PlanoContas2.Create(AOwner: TComponent);
begin
  inherited;
  //FAllowedDataActions := [daInsert,daEdit,daDelete,daSave,daCancel,daPrint,daOther] ;
  if DebugHook = 0 then
    _dbgLista.Visible := False ;
//      dbgPlanoConta.Align   := alCustom ;

  TdtmFIN_PlanoContas2.Create ( self ) ;
  DatamoduleBase.OpenTables ;
  ValidaCampos ;
  _edtSearch.ClipboardCommands := [caCopy,caCut, caPaste,caClear, caUndo] ;

  CheckFieldsVisibility ;
  btDescartarEdicao.Top := Button1.Top;
  btEditarPlanos.Top    := Button1.Top;
end;

procedure TfrmFIN_PlanoContas2.dbcbTipoChange(Sender: TObject);
begin
  inherited;
  if (dbcbTipo.Text = 'Ativo') or (dbcbTipo.Text = 'Passivo') then
    begin
      dbcbFixaVariavel.Enabled   := False;
      dbcbFixaVariavel.ItemIndex := -1;
    end
  else
    dbcbFixaVariavel.Enabled := True ;

end;

procedure TfrmFIN_PlanoContas2.dbtreePlanoContasClick(Sender: TObject);
begin
  inherited;
  ValidaCampos ;
end;

procedure TfrmFIN_PlanoContas2.dbtreePlanoContasPaintText(
  Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType);
begin
// if TdtmFIN_PlanoContas2( DatamoduleBase ).cdsPlanoContasHIDE_BY_USER.AsBoolean then
//    TargetCanvas.Font.Color := clSilver
// else
//    TargetCanvas.Font.Color := clBlack
end;

procedure TfrmFIN_PlanoContas2.edContaEquivalenteButtonClick(Sender: TObject);
begin
 SearchContaEquivalente(TJvDBComboEdit(Sender).Text);
end;

procedure TfrmFIN_PlanoContas2.lblMascaraClick(Sender: TObject);
var
 LMascara : string ;
begin
 if InputBox( 'Liberar edição', #0'Senha:', '' ) <> ( 'CLAg5' + LoggedUser.DomainCode ) then
   raise Warning.Create('Senha inválida');
 LMascara := InputBox( 'Plano de contas', 'Máscara ( Ex: 0.00.000 ) : ', '' ) ;
 if LMascara = '' then
   exit ;
 if (LMascara[1] <> '0') or (Pos ('.', LMascara) = 0) then
   raise Warning.Create('Máscara inválida');

 TdtmFIN_PlanoContas2( DatamoduleBase ).AlterMascara( LMascara ) ;
 CheckFieldsVisibility;
end;

procedure TfrmFIN_PlanoContas2.ValidaCampos;
var
  APRD : string ;
begin
  with TdtmFIN_PlanoContas2 ( DatamoduleBase ) do
    begin
      APRD := cdsPlanoContasTIPO_APRD.AsString ;
//      dbcbDevCred.Enabled      := ( (APRD <> 'A') and (APRD <> 'P') )  ;
      dbcbFixaVariavel.Enabled := ( (APRD <> 'A') and (APRD <> 'P') )  ;
      dbcbTipo.Enabled         := False ;
    end;
end;

function TfrmFIN_PlanoContas2.SearchContaEquivalente(
  TextToSearch: string): boolean;
var
  p : TParams;
  LTIPO_APRD : string ;
begin

  with TdtmFIN_PlanoContas2 ( DatamoduleBase ), TSearchPlanoContasDefault.Create do
    try
      TextToFind := TextToSearch;
      APRD := [tpAtivo, tpPassivo, tpReceitas, tpDespesas] ;
      if Execute then
        SetContaEquivalente(
            Result.FieldByName( 'KFIN_PLANOCONTA' ).asString,
            Result.FieldByName( 'CLASSIFICACAO' ).asString,
            Result.FieldByName( 'NOME' ).asString );
    finally
      free;
    end;
end;


initialization
  RegisterClass ( TfrmFIN_PlanoContas2 ) ;

end.
