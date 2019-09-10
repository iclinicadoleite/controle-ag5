// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Cadastros
// Funcionality : Cadastro de forencedores
//
// License      : veja readme.txt





unit UfrmCAD_Fornecedores;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, SysFormListaFicha,
  JvDBControls, VCL.DBCtrls, JvSpin, JvDBSpinEdit, JvToolEdit, JvDBCheckBox,
  JvExStdCtrls, JvDBCombobox, JvXPBar, JvExControls, JvXPCore, JvXPContainer,
  VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase, JvValidators, VCL.ComCtrls,
  VCL.ToolWin, VCL.Mask, JvExMask, JvExExtCtrls, Tc.RTL.StringUtils, {DateSuppl, }
  DSIntF, ThreadSuppl, JvCombobox, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  JvImage, JvExtComponent, JvPanel, VCL.ImgList,
  Tc.VCL.Controls.GDIButton, System.Actions, System.ImageList
  , Tc.VCL.Application
  , uImageListProvider
  , CLAg5SvcEntidadesCadastroFornecedores
  , Wrappers ;

type
  TfrmCAD_Fornecedores = class(T_FormListaFicha)
    DBEdit4: TDBEdit;
    dtsEndereco: TDataSource;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    dtsEnderecoCobranca: TDataSource;
    dtsEnderecoEntrega: TDataSource;
    Label10: TLabel;
    dbeCodigo: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dbeCPF_CNPJ: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit31: TDBEdit;
    dtsOutrosEnderecos: TDataSource;
    dtsContatos: TDataSource;
    Label29: TLabel;
    cbTipoPessoa: TJvDBComboBox;
    cbStatus: TJvDBComboBox;
    lblCNPCNPJ: TLabel;
    lblRGIE: TLabel;
    lblNomeRazao: TLabel;
    lblApelidoFantasia: TLabel;
    Label24: TLabel;
    cbxInativos: TCheckBox;
    DBEdit28: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit32: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    JvDBComboBox1: TJvDBComboBox;
    dbcbUFOutrosEnderecos: TJvDBComboBox;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Codigo: TLabel;
    lblClassificacao: TLabel;
    dbtCodigoConta: TDBText;
    dtbClassificacao: TDBText;
    JvDBComboEdit1: TJvDBComboEdit;
    dtsDadosFinanceiro: TDataSource;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    actPrintFicha: TAction;
    actPrintAll: TAction;
    ImprimirFicha1: TMenuItem;
    ListaCompleta1: TMenuItem;
    N1: TMenuItem;
    btnAdicionaEndereco: TTcGDIButton;
    btnRemoveEndereco: TTcGDIButton;
    Label13: TLabel;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure cbxInativosClick(Sender: TObject);
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: String): Boolean;
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure dbeCPF_CNPJExit(Sender: TObject);
    procedure _edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure _edtSearchEnter(Sender: TObject);
    procedure JvDBComboEdit1ButtonClick(Sender: TObject);
    procedure actPrintFichaExecute(Sender: TObject);
    procedure actPrintAllExecute(Sender: TObject);
    procedure JvDBComboEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnRemoveEnderecoClick(Sender: TObject);
    procedure btnAdicionaEnderecoClick(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
  private
    { Private declarations }
    FLabelPessoaFisicaJuridica : string ;
    procedure UpdateLabelsPessoaFisicaJuridica ;
    procedure SearchPlanoConta(TextToSearch: string);
    procedure ShowNewFastRegister(Sender: TObject);
  protected
    { Protected declarations }
    procedure ChangeFilter ;
    procedure OpenTables ;
    procedure Pesquisar ; override ;
  public
    { Public declarations }
    class procedure ExecuteNewFastRegister;
    class procedure NovoCadastro( var AFornecedorInfo : TFornecedorInfo ) ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses Validates
   , UdtmCAD_Fornecedores
   , SearchsEntidades
   , ReportTypes
   , UCAD_EntidadesReport
   , UDBEntidades
   , Exceptions
   , NewFastRegisterIntf
   , CLAg5SvcFinanceiroApropriacao ;

{$R *.dfm}

type
  SvcCadastroFornecedoresFactory = class( TInterfacedObject, ISvcCadastroFornecedores )
    procedure NovoFornecedor ( var AFornecedorInfo : TFornecedorInfo ) ;
  end;

  SvcFornecedorNewFastRegisterFactory = class( TInterfacedObject, INewFastRegister )
    procedure ExecuteNewRegister ;
  end;

class procedure TfrmCAD_Fornecedores.NovoCadastro( var AFornecedorInfo : TFornecedorInfo ) ;
begin
  with Create ( nil ) do
    try
      TdtmCAD_Fornecedores(DatamoduleBase).FNewCadastro        := True ;
//      SetFilter( cbxInativos.Checked );

      _actNew.Execute; // manter aqui para nao dar pau - VTS

      DisableValidators ;
      TdtmCAD_Fornecedores( DatamoduleBase ).UpdateFromInfo ( AFornecedorInfo ) ;
      EnableValidators ;

      BorderStyle         := bsDialog ;
      cbxInativos.Enabled := False ;

      _actLista.Enabled := False ;
//      dbcbProdInsuServ.ItemIndex := 0;
//      cdsProdutoPRODUTO_INSUMO_SERVICO.AsInteger := dbcbProdInsuServ.ItemIndex + Tipo;
      if ShowModal <> mrOK then
         AFornecedorInfo.KCAD_FORNECEDOR := '' ;
    finally
      CloseModal ;
    end;
end;


procedure TfrmCAD_Fornecedores.Pesquisar;
begin
  inherited ;

  with TdtmCAD_Fornecedores( DatamoduleBase ), TSearchFornecedor.Create do
    try
      TextToFind := _edtSearch.Text ;
      SetFiltro( BoolToChar( cbxInativos.checked ) );
      if Execute then
        begin
         cdsLstEntidades.Locate( 'KCAD_ENTIDADE', Result.FieldByName( 'KCAD_ENTIDADE' ).Value, [] ) ;
         ActiveFicha ;
        end ;
    finally
      free ;
    end ;
end;

procedure TfrmCAD_Fornecedores.SearchPlanoConta(TextToSearch: string);
begin

  with TdtmCAD_Fornecedores( DatamoduleBase ) do
    begin

      SvcFinanceiroApropriacaoEdit.ExecuteTela( 'CAD_FORNECEDORES',
                                          cdsDadosFinanceiro,
                                          cdsApropriacaoEntidade,
                                          TelaPatrimonio,
                                          [tpReceitas, tpDespesas] );
    end;

end;


procedure TfrmCAD_Fornecedores.dtsFichaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  try
    if Assigned ( DatamoduleBase ) then
      UpdateLabelsPessoaFisicaJuridica ;
  except
  end;
end;

procedure TfrmCAD_Fornecedores.JvDBComboEdit1ButtonClick(Sender: TObject);
begin
  SearchPlanoConta( TJvDBComboEdit( Sender ).Text );
end;

procedure TfrmCAD_Fornecedores.JvDBComboEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      SearchPlanoConta( TJvDBComboEdit( Sender ).Text );
    end;
end;

procedure TfrmCAD_Fornecedores.UpdateLabelsPessoaFisicaJuridica;
begin

  with TdtmCAD_Fornecedores( DatamoduleBase ).cdsEntidadePessoa do
     begin
       if FLabelPessoaFisicaJuridica = AsString then
          exit ;

       FLabelPessoaFisicaJuridica := AsString ;
     end ;

  if FLabelPessoaFisicaJuridica = 'F' then
     begin
       lblNomeRazao.Caption       := 'Nome' ;
       lblApelidoFantasia.Caption := 'Apelido' ;
       lblCNPCNPJ.Caption         := 'CPF' ;
       lblRGIE.Caption            := 'RG' ;
//       lblNascimento.Caption      := 'Nascimento' ;
     end
  else
     begin
       lblNomeRazao.Caption       := 'Razão Social' ;
       lblApelidoFantasia.Caption := 'Nome Fantasia' ;
       lblCNPCNPJ.Caption         := 'CNPJ' ;
       lblRGIE.Caption            := 'IE' ;
//       lblNascimento.Caption      := 'Fundação' ;
     end ;
end;

procedure TfrmCAD_Fornecedores.actPrintAllExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsEntidades ;
begin
  PReport := ReportTypes.TReportParamsEntidades.Create ;
  PReport.KCAD_ENTIDADE  := '' ;
  PReport.IS_CLIENTE     := 'F' ;
  PReport.IS_FORENECEDOR := 'T' ;
  PReport.ReportTitle    := 'Relação de Fornecedores';
  PReport.ATIVO          := BoolToChar( cbxInativos.Checked );
  PReport.POR_GRUPO      := 'F';
  TqrCAD_EntidadesReport.Execute( PReport );
  PReport.Free;
end;

procedure TfrmCAD_Fornecedores.actPrintFichaExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsEntidades ;
begin
  PReport := ReportTypes.TReportParamsEntidades.Create ;
  PReport.KCAD_ENTIDADE  := TdtmCAD_Fornecedores( DatamoduleBase ).cdsLstEntidadesKCAD_ENTIDADE.AsString ;
  PReport.IS_CLIENTE     := 'F' ;
  PReport.IS_FORENECEDOR := 'T' ;
  PReport.ReportTitle    := 'Ficha Cadastral';
  PReport.ATIVO          := BoolToChar( cbxInativos.Checked );
  PReport.POR_GRUPO      := 'F';
  TqrCAD_EntidadesReport.Execute( PReport );
  PReport.Free;
end;

procedure TfrmCAD_Fornecedores.btnAdicionaEnderecoClick(Sender: TObject);
begin
  inherited;
  if dtsEndereco.DataSet.IsEmpty then
    begin
      PageControl1.TabIndex := 0;
      raise Warning.Create('Favor cadastrar um endereço principal.');
    end;

  if not ( dtsOutrosEnderecos.DataSet.State in [dsInsert, dsEdit] ) then
    dtsOutrosEnderecos.DataSet.Edit;

  PageControl1.TabIndex := 1;
  dtsOutrosEnderecos.DataSet.Append;
end;

procedure TfrmCAD_Fornecedores.btnRemoveEnderecoClick(Sender: TObject);
begin
  inherited;
  with TdtmCAD_Fornecedores( DatamoduleBase ) do
    begin
      if cdsOutrosEnderecos.IsEmpty or cdsEndereco.IsEmpty then
        Exit;

      cdsOutrosEnderecos.Delete;
    end;
end;

procedure TfrmCAD_Fornecedores.cbxInativosClick(Sender: TObject);
begin
  inherited;
//  UfrmSearchProgress.TfrmSearchProgress.ShowProgress ;
  ThreadSuppl.TSyncThread.Create (  ChangeFilter ) ;
//  ChangeFilter
end;

procedure TfrmCAD_Fornecedores._actCancelExecute(Sender: TObject);
begin
  inherited;
  if TdtmCAD_Fornecedores( DatamoduleBase ).FNewCadastro then
    Self.Close;
end;

procedure TfrmCAD_Fornecedores._actSaveExecute(Sender: TObject);
begin
  inherited;
  if fsModal in FormState then
    ModalResult := mrOK ;
end;

function TfrmCAD_Fornecedores._dbgListaCheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: String): Boolean;
begin
  inherited;
  with TdtmCAD_Fornecedores( DataModuleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsLstEntidadesATIVO ) ) ;

  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;


procedure TfrmCAD_Fornecedores._edtSearchEnter(Sender: TObject);
begin
  inherited;
//  _edtSearch.SelectAll;
end;

procedure TfrmCAD_Fornecedores._edtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #13  ) then
    begin
      Key := #0 ;
      if ( Trim ( _edtSearch.Text ) = '' ) then
        exit ;
    end;
end;

procedure TfrmCAD_Fornecedores.OpenTables;
begin
//    UfrmSearchProgress.TfrmSearchProgress.ShowProgress ;
    try
       DatamoduleBase.OpenTables ;
       ChangeFilter  ;
    finally
//       UfrmSearchProgress.TfrmSearchProgress.HideProgress ;
    end ;
end;

procedure TfrmCAD_Fornecedores.ChangeFilter;
begin

  TdtmCAD_Fornecedores( DatamoduleBase ).SetFilter (
    cbxInativos.Checked,
    FALSE, // clientes
    TRUE,  // fornecedores
    {cbxFuncionarios.Checked,} FALSE,
    {cbxVendedores.Checked} FALSE,
    {cbxRepresentantes.Checked} FALSE,
    {cbxCompradores.Checked} FALSE,
    FALSE  ) ; // tranportadora


end;

constructor TfrmCAD_Fornecedores.Create(AOwner: TComponent);
begin
  inherited;
  TdtmCAD_Fornecedores.Create ( self ) ;

  dtsEndereco.DataSet           := TdtmCAD_Fornecedores( DatamoduleBase ).cdsEndereco ;
  dtsEnderecoCobranca.DataSet   := TdtmCAD_Fornecedores( DatamoduleBase ).cdsEnderecoCobranca ;
  dtsEnderecoEntrega.DataSet    := TdtmCAD_Fornecedores( DatamoduleBase ).cdsEnderecoEntrega ;
  dtsOutrosEnderecos.DataSet    := TdtmCAD_Fornecedores( DatamoduleBase ).cdsOutrosEnderecos ;
  dtsContatos.DataSet           := TdtmCAD_Fornecedores( DatamoduleBase ).cdsContatos ;
  dtsDadosFinanceiro.DataSet    := TdtmCAD_Fornecedores( DatamoduleBase ).cdsDadosFinanceiro ;


//  ThreadSuppl.TSimpleThread.Create (  OpenTables ) ;
//  ThreadSuppl.TSyncThread.Create (  OpenTables ) ;
  OpenTables ;
  PageControl1.TabIndex := 0;
end;

procedure TfrmCAD_Fornecedores.dbeCPF_CNPJExit(Sender: TObject);
var Ctrl : TWinControl;
begin
  inherited;
  Ctrl := Screen.ActiveControl;

  if ( TdtmCAD_Fornecedores( DatamoduleBase ).cdsEntidadePESSOA.asString = 'F' ) and
     not TValidates.ValidaCPF( TdtmCAD_Fornecedores( DatamoduleBase ).cdsEntidadeCPF_CNPJ.asString ) then
       dbeCPF_CNPJ.SetFocus
  else if ( TdtmCAD_Fornecedores( DatamoduleBase ).cdsEntidadePESSOA.asString = 'J' ) and
     not TValidates.ValidaCNPJ (TdtmCAD_Fornecedores( DatamoduleBase ).cdsEntidadeCPF_CNPJ.asString )   then
       dbeCPF_CNPJ.SetFocus
  else
    begin
      ActiveControl := nil;
      PostMessage(TWinControl(Ctrl).Handle, WM_SETFOCUS, 0, 0);
      TWinControl(Ctrl).SetFocus;
    end;
end;

procedure TfrmCAD_Fornecedores.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet ( Key, [ '0'..'9'] ) then
     Key := #0 ;
end;

procedure TfrmCAD_Fornecedores.ShowNewFastRegister(Sender: TObject);
begin
//  _pnlForm.Color := clsilver ;
//  self._pageControl.parent := _pnlForm ;
//  self._pnlToolButtons.parent := _pnlForm ;
  if cbTipoPessoa.CanFocus then
     cbTipoPessoa.SetFocus;
end;


class procedure TfrmCAD_Fornecedores.ExecuteNewFastRegister;
var
  ThisForm : TfrmCAD_Fornecedores;
  Handled: Boolean;
begin
  ThisForm := TfrmCAD_Fornecedores.Create(nil);
  ThisForm.OnShow := ThisForm.ShowNewFastRegister;
  ThisForm._pageControl.Pages[0].TabVisible := False;
  ThisForm._pageControl.Pages[1].TabVisible := False;
  //ThisForm._pageControl.ActivePageIndex := 1;
  ThisForm._pageControl.ActivePage := ThisForm._tbsFicha;
  ThisForm._actLista.Enabled := False;
  ThisForm._actEdit.Enabled := False;
  ThisForm._actNew.Execute ;// _ActionListExecute(ThisForm._actNew, Handled);
  try
    ThisForm.ShowModal;
  finally
    FreeAndNil(ThisForm);
  end;
end;

{ SvcEstoqueFornecedoresCadastroFactory }

procedure SvcCadastroFornecedoresFactory.NovoFornecedor ( var AFornecedorInfo : TFornecedorInfo ) ;
begin
    TfrmCAD_Fornecedores.NovoCadastro( AFornecedorInfo ) ;
end;

{ SvcFornecedorNewFastRegisterFactory }

procedure SvcFornecedorNewFastRegisterFactory.ExecuteNewRegister;
begin
  TfrmCAD_Fornecedores.ExecuteNewFastRegister;
end;

initialization
  RegisterClass ( TfrmCAD_Fornecedores ) ;
  SvcCadastroFornecedores := SvcCadastroFornecedoresFactory.Create ;
  SvcFornecedorNewFastRegister := SvcFornecedorNewFastRegisterFactory.Create ;
finalization
  SvcCadastroFornecedores := nil ;
  SvcFornecedorNewFastRegister := nil ;
end.

