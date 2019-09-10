// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Cadastro
// Funcionality : Cadastro de clientes
//
// License      : veja readme.txt



unit UfrmCAD_Clientes;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, SysFormListaFicha,
  JvDBControls, VCL.DBCtrls, JvSpin, JvDBSpinEdit, JvToolEdit, JvDBCheckBox,
  JvExStdCtrls, JvDBCombobox, JvXPBar, JvExControls, JvXPCore, JvXPContainer,
  VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase, JvValidators, VCL.ComCtrls, VCL.ToolWin,
  VCL.Mask, JvExMask, JvExExtCtrls, Tc.RTL.StringUtils , {DateSuppl, }DSIntF,
  ThreadSuppl, JvCombobox, JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvImage,
  JvExtComponent, JvPanel, VCL.ImgList, Tc.VCL.Controls.GDIButton,
  System.Actions, System.ImageList
  , Tc.VCL.Application
  , uImageListProvider
  , CLAg5SvcEntidadesCadastroClientes
  , Wrappers ;

type
  TfrmCAD_Clientes = class(T_FormListaFicha)
    dtsEndereco: TDataSource;
    dtsEnderecoCobranca: TDataSource;
    dtsEnderecoEntrega: TDataSource;
    dtsOutrosEnderecos: TDataSource;
    dtsContatos: TDataSource;
    dtsDadosFinanceiro: TDataSource;
    Label10: TLabel;
    dbeCodigo: TDBEdit;
    dbeFantasiaApelido: TDBEdit; // Apelido / NomeFantasia
    DBEdit27: TDBEdit;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dbeCPF_CNPJ: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit31: TDBEdit;
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
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    JvDBComboBox1: TJvDBComboBox;
    dbcbUF: TJvDBComboBox;
    LinkLabel1: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    edGrupoCliente: TJvDBComboEdit;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Código: TLabel;
    Classificação: TLabel;
    dbtCodigoConta: TDBText;
    dtbClassificacao: TDBText;
    JvDBComboEdit1: TJvDBComboEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    actPrintListFicha: TAction;
    ImprimirListanovo1: TMenuItem;
    actListaCompleta: TAction;
    ListaCompleta1: TMenuItem;
    N1: TMenuItem;
    actPorGrupo: TAction;
    N2: TMenuItem;
    Porgrupo1: TMenuItem;
    btnRemoveEndereco: TTcGDIButton;
    btnAdicionaEndereco: TTcGDIButton;
    Label14: TLabel;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure cbxInativosClick(Sender: TObject);
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: String): Boolean;
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure dbeCPF_CNPJExit(Sender: TObject);
    procedure LinkLabel1Click(Sender: TObject);
    procedure edGrupoClienteButtonClick(Sender: TObject);
    procedure edGrupoClienteKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBComboEdit1ButtonClick(Sender: TObject);
    procedure actPrintListFichaExecute(Sender: TObject);
    procedure actListaCompletaExecute(Sender: TObject);
    procedure actPorGrupoExecute(Sender: TObject);
    procedure JvDBComboEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnRemoveEnderecoClick(Sender: TObject);
    procedure btnAdicionaEnderecoClick(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
  private
    { Private declarations }
    FLabelPessoaFisicaJuridica : string ;
    procedure UpdateLabelsPessoaFisicaJuridica ;
    procedure SearchGrupoCliente( TextToSearch : string );
    procedure SearchPlanoConta( TextToSearch: string );
    procedure ShowNewFastRegister(Sender: TObject);
  protected
    { Protected declarations }
    procedure ChangeFilter ;
    procedure OpenTables ;
    procedure Pesquisar ; override ;

  public
    { Public declarations }
    class procedure ExecuteNewFastRegister;
    class procedure NovoCadastro( var AClienteInfo : TClienteInfo ) ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses
    Validates
  , ReportTypes
  , UCAD_EntidadesReport
  , UdtmCAD_Clientes
  , SearchsEntidades
  , UDBEntidades
  , CLAg5SvcEntidadesCadastroTipos
  , Exceptions
  , NewFastRegisterIntf
  , CLAg5SvcFinanceiroApropriacao ;

{$R *.dfm}

type
  SvcCadastroClientesFactory = class( TInterfacedObject, ISvcCadastroClientes )
    procedure NovoCliente ( var AClienteInfo : TClienteInfo ) ;
  end;

  SvcClienteNewFastRegisterFactory = class( TInterfacedObject, INewFastRegister )
    procedure ExecuteNewRegister ;
  end;

class procedure TfrmCAD_Clientes.NovoCadastro( var AClienteInfo : TClienteInfo ) ;
begin
  with Create ( nil ) do
    try
      TdtmCAD_Clientes( DatamoduleBase ).FNewCadastro        := True ;
//      SetFilter( cbxInativos.Checked );

      _actNew.Execute; // manter aqui para nao dar pau - VTS

      DisableValidators ;
      TdtmCAD_Clientes( DatamoduleBase ).UpdateFromInfo ( AClienteInfo ) ;
      EnableValidators ;

      BorderStyle         := bsDialog ;
      cbxInativos.Enabled := False ;

      _actLista.Enabled := False ;
//      dbcbProdInsuServ.ItemIndex := 0;
//      cdsProdutoPRODUTO_INSUMO_SERVICO.AsInteger := dbcbProdInsuServ.ItemIndex + Tipo;
      if ShowModal <> mrOK then
         AClienteInfo.KCAD_CLIENTE := '' ;
    finally
       CloseModal ;
    end;
end;


procedure TfrmCAD_Clientes.Pesquisar;
begin
  inherited ;
  if cbxInativos.checked then
    begin
      with TdtmCAD_Clientes( DatamoduleBase ), TSearchCliente.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
             cdsLstEntidades.Locate( 'KCAD_ENTIDADE', Result.FieldByName( 'KCAD_ENTIDADE' ).Value, [] ) ;
             ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end
  else
    begin
      with TdtmCAD_Clientes( DatamoduleBase ), TSearchClienteAtivo.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
             cdsLstEntidades.Locate( 'KCAD_ENTIDADE', Result.FieldByName( 'KCAD_ENTIDADE' ).Value, [] ) ;
             ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end;
end;

procedure TfrmCAD_Clientes.SearchGrupoCliente(TextToSearch: string);
begin
  with TdtmCAD_Clientes( DatamoduleBase ), TSearchGrupoCliente.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        SetGrupoCliente( Result.FieldByName( 'KCAD_TIPOS' ).asString,
                         Result.FieldByName( 'DESCRICAO' ).asString ) ;
    finally
      free ;
    end ;
end;

procedure TfrmCAD_Clientes.SearchPlanoConta(TextToSearch: string);
begin

  with TdtmCAD_Clientes( DatamoduleBase ) do
    begin

      SvcFinanceiroApropriacaoEdit.ExecuteTela( 'CAD_CLIENTES',
                                          cdsDadosFinanceiro,
                                          cdsApropriacaoEntidade,
                                          TelaPatrimonio,
                                          [tpReceitas, tpDespesas] );
    end;

end;



procedure TfrmCAD_Clientes.dtsFichaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  try
    if Assigned ( DatamoduleBase ) then
      UpdateLabelsPessoaFisicaJuridica ;
  except
  end;
end;


procedure TfrmCAD_Clientes.edGrupoClienteButtonClick(Sender: TObject);
begin
  inherited;
  SearchGrupoCliente( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmCAD_Clientes.edGrupoClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
   begin
     Key := #0 ;
     TJvComboEdit( Sender ).DoClick ;
   end;
end;

procedure TfrmCAD_Clientes.JvDBComboEdit1ButtonClick(Sender: TObject);
begin
  SearchPlanoConta( TJvDBComboEdit( Sender ).Text );
end;

procedure TfrmCAD_Clientes.JvDBComboEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
   begin
    Key := #0 ;
    SearchPlanoConta( TJvDBComboEdit( Sender ).Text );
   end;
end;

procedure TfrmCAD_Clientes.LinkLabel1Click(Sender: TObject);
begin
  with TdtmCAD_Clientes( DatamoduleBase ) do
    begin
      if not (cdsEntidade.State in [dsInsert, dsEdit]) then
        cdsEntidade.Edit;

      cdsEntidadeGRUPO_CLIENTE.Clear;
      cdsEntidadeGRUPO.Clear;
      cdsEntidade.Post;
    end;

  SvcCadastroTipos.NovoTipo( CLAg5SvcEntidadesCadastroTipos._GRUPO_CLIENTE );
end;

procedure TfrmCAD_Clientes.UpdateLabelsPessoaFisicaJuridica;
begin
  with TdtmCAD_Clientes( DatamoduleBase ).cdsEntidadePessoa do
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

procedure TfrmCAD_Clientes.actListaCompletaExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsEntidades ;
begin
  PReport := ReportTypes.TReportParamsEntidades.Create ;
  PReport.KCAD_ENTIDADE  := '' ;
  PReport.IS_CLIENTE     := 'T' ;
  PReport.IS_FORENECEDOR := 'F' ;
  PReport.ReportTitle    := 'Relação de Clientes';
  PReport.ATIVO          := BoolToChar( cbxInativos.Checked );
  PReport.POR_GRUPO      := 'F';
  TqrCAD_EntidadesReport.Execute( PReport );
  PReport.Free;
end;

procedure TfrmCAD_Clientes.actPorGrupoExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsEntidades ;
begin
  PReport := ReportTypes.TReportParamsEntidades.Create ;
  PReport.KCAD_ENTIDADE  := '' ;
  PReport.IS_CLIENTE     := 'T' ;
  PReport.IS_FORENECEDOR := 'F' ;
  PReport.ReportTitle    := 'Relação de Clientes por grupo';
  PReport.ATIVO          := BoolToChar( cbxInativos.Checked );
  TqrCAD_EntidadesReport.ExecuteDialog( PReport );
  PReport.Free;
end;

procedure TfrmCAD_Clientes.actPrintListFichaExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsEntidades ;
begin
  PReport := ReportTypes.TReportParamsEntidades.Create ;
  PReport.KCAD_ENTIDADE  := TdtmCAD_Clientes( DatamoduleBase ).cdsLstEntidadesKCAD_ENTIDADE.AsString ;
  PReport.IS_CLIENTE     := 'T' ;
  PReport.IS_FORENECEDOR := 'F' ;
  PReport.ReportTitle    := 'Ficha Cadastral ';
  PReport.ATIVO          := BoolToChar( cbxInativos.Checked );
  PReport.POR_GRUPO      := 'F';
  TqrCAD_EntidadesReport.Execute( PReport );
  PReport.Free;
end;

procedure TfrmCAD_Clientes.btnAdicionaEnderecoClick(Sender: TObject);
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

procedure TfrmCAD_Clientes.btnRemoveEnderecoClick(Sender: TObject);
begin
  inherited;
  if dtsEndereco.DataSet.IsEmpty or dtsOutrosEnderecos.DataSet.IsEmpty  then
    Exit;

  dtsOutrosEnderecos.DataSet.Delete;
end;

procedure TfrmCAD_Clientes.cbxInativosClick(Sender: TObject);
begin
  inherited;
  ThreadSuppl.TSyncThread.Create (  ChangeFilter ) ;
//  ChangeFilter
end;

procedure TfrmCAD_Clientes._actCancelExecute(Sender: TObject);
begin
  inherited;
  if TdtmCAD_Clientes( DatamoduleBase ).FNewCadastro then
    Self.Close;
end;

procedure TfrmCAD_Clientes._actSaveExecute(Sender: TObject);
begin
  inherited;
  if fsModal in FormState then
    ModalResult := mrOK ;
end;

function TfrmCAD_Clientes._dbgListaCheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: String): Boolean;
begin
  inherited;
  with TdtmCAD_Clientes( DataModuleBase ) do
     Result := Assigned ( Field ) and ( Field = cdsLstEntidadesATIVO ) ;

  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TfrmCAD_Clientes.OpenTables;
begin
//  UfrmSearchProgress.TfrmSearchProgress.ShowProgress ;
  try
     DatamoduleBase.OpenTables ;
     ChangeFilter  ;
  finally
//     UfrmSearchProgress.TfrmSearchProgress.HideProgress ;
  end ;
end;

procedure TfrmCAD_Clientes.ChangeFilter;
begin
  TdtmCAD_Clientes( DatamoduleBase ).SetFilter (
    cbxInativos.Checked,
    TRUE, // clientes
    FALSE, //cbxFornecedores.Checked,
    {cbxFuncionarios.Checked,} FALSE,
    {cbxVendedores.Checked} FALSE,
    {cbxRepresentantes.Checked} FALSE,
    {cbxCompradores.Checked} FALSE,
    FALSE ) // cbxTransportadora.Checked ) ;
end;

constructor TfrmCAD_Clientes.Create(AOwner: TComponent);
begin
  inherited;
  TdtmCAD_Clientes.Create ( self ) ;

  dtsEndereco.DataSet           := TdtmCAD_Clientes ( DatamoduleBase ).cdsEndereco ;
  dtsEnderecoCobranca.DataSet   := TdtmCAD_Clientes ( DatamoduleBase ).cdsEnderecoCobranca ;
  dtsEnderecoEntrega.DataSet    := TdtmCAD_Clientes ( DatamoduleBase ).cdsEnderecoEntrega ;
  dtsOutrosEnderecos.DataSet    := TdtmCAD_Clientes ( DatamoduleBase ).cdsOutrosEnderecos ;
  dtsContatos.DataSet           := TdtmCAD_Clientes ( DatamoduleBase ).cdsContatos ;
  dtsDadosFinanceiro.DataSet    := TdtmCAD_Clientes ( DatamoduleBase ).cdsDadosFinanceiro ;


  //  ThreadSuppl.TSimpleThread.Create (  OpenTables ) ;
//  ThreadSuppl.TSyncThread.Create (  OpenTables ) ;
  OpenTables ;
  PageControl1.TabIndex := 0;
end;

procedure TfrmCAD_Clientes.dbeCPF_CNPJExit(Sender: TObject);
var Ctrl : TWinControl;
begin
  inherited;
  Ctrl := Screen.ActiveControl;

  if ( TdtmCAD_Clientes( DatamoduleBase ).cdsEntidadePESSOA.asString = 'F' ) and
     not TValidates.ValidaCPF( TdtmCAD_Clientes( DatamoduleBase ).cdsEntidadeCPF_CNPJ.asString ) then
       dbeCPF_CNPJ.SetFocus
  else if ( TdtmCAD_Clientes( DatamoduleBase ).cdsEntidadePESSOA.asString = 'J' ) and
     not TValidates.ValidaCNPJ (TdtmCAD_Clientes( DatamoduleBase ).cdsEntidadeCPF_CNPJ.asString )   then
       dbeCPF_CNPJ.SetFocus
  else
    begin
      ActiveControl := nil;
      PostMessage(TWinControl(Ctrl).Handle, WM_SETFOCUS, 0, 0);
      TWinControl(Ctrl).SetFocus;
    end;


end;

procedure TfrmCAD_Clientes.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet ( Key, [ '0'..'9'] ) then
     Key := #0 ;
end;

destructor TfrmCAD_Clientes.Destroy;
begin

  inherited;
end;

procedure TfrmCAD_Clientes.ShowNewFastRegister(Sender: TObject);
begin
//  _pnlForm.Color := clsilver ;
//  self._pageControl.parent := _pnlForm ;
//  self._pnlToolButtons.parent := _pnlForm ;
  if cbTipoPessoa.CanFocus then
     cbTipoPessoa.SetFocus;
end;


class procedure TfrmCAD_Clientes.ExecuteNewFastRegister;
var
  ThisForm : TfrmCAD_Clientes;
  Handled: Boolean;
begin
  ThisForm := TfrmCAD_Clientes.Create(nil);
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

{ SvcEstoqueClientesCadastroFactory }

procedure SvcCadastroClientesFactory.NovoCliente ( var AClienteInfo : TClienteInfo ) ;
begin
    TfrmCAD_Clientes.NovoCadastro( AClienteInfo ) ;
end;

{ SvcClienteNewFastRegisterFactory }

procedure SvcClienteNewFastRegisterFactory.ExecuteNewRegister;
begin
  TfrmCAD_Clientes.ExecuteNewFastRegister;
end;

initialization
  RegisterClass ( TfrmCAD_Clientes ) ;
  SvcCadastroClientes := SvcCadastroClientesFactory.Create ;
  SvcClienteNewFastRegister := SvcClienteNewFastRegisterFactory.Create ;
finalization
  SvcCadastroClientes := nil ;
  SvcClienteNewFastRegister := nil ;
end.
