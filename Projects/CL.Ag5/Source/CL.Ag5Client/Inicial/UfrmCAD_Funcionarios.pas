unit UfrmCAD_Funcionarios;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, SysFormListaFicha, JvDBControls,
  VCL.DBCtrls, JvSpin, JvDBSpinEdit, JvToolEdit, JvDBCheckBox, JvExStdCtrls,
  JvDBCombobox, JvXPBar, JvExControls, JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers,
  JvErrorIndicator, JvComponentBase, JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask,
  JvExMask, JvExExtCtrls,
  Tc.RTL.StringUtils, {DateSuppl, }DSIntF, ThreadSuppl, JvCombobox,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvImage, JvExtComponent,
  JvPanel, VCL.ImgList, Tc.VCL.Controls.GDIButton
  , System.Actions
  , System.ImageList
  , Tc.VCL.Application
  , uImageListProvider
  , CLAg5SvcEntidadesCadastroFuncionarios
  , Wrappers  ;

type
  TfrmCAD_Funcionarios = class(T_FormListaFicha)
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
    cbxClientes: TCheckBox;
    cbxFornecedores: TCheckBox;
    cbxFuncionarios: TCheckBox;
    cbxTransportadora: TCheckBox;
    cbxInativos: TCheckBox;
    DBEdit28: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit32: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn2: TTcGDIButton;
    JvDBComboBox1: TJvDBComboBox;
    JvDBComboBox2: TJvDBComboBox;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure cbxInativosClick(Sender: TObject);
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: String): Boolean;
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure dbeCPF_CNPJExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    FLabelPessoaFisicaJuridica : string ;
    procedure UpdateLabelsPessoaFisicaJuridica ;
    procedure ShowNewFastRegister(Sender: TObject);
  protected
    { Protected declarations }
    procedure ChangeFilter ;
    procedure OpenTables ;
    procedure Pesquisar ; override ;
  public
    { Public declarations }
    class procedure ExecuteNewFastRegister;
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses   Validates
     , UdtmCAD_Funcionarios
     , SearchsEntidades
     , NewFastRegisterIntf
     , UDBEntidades;

{$R *.dfm}

type
//  SvcCadastroFuncionariosFactory = class( TInterfacedObject, ISvcCadastroFuncionarios )
//    procedure NovoFornecedor ( var AFornecedorInfo : TFornecedorInfo ) ;
//  end;

  SvcFuncionarioNewFastRegisterFactory = class( TInterfacedObject, INewFastRegister )
    procedure ExecuteNewRegister ;
  end;


procedure TfrmCAD_Funcionarios.Pesquisar;
begin
  inherited ;
  if cbxInativos.Checked then
    begin
      with TdtmCAD_Funcionarios( DatamoduleBase ), TSearchFuncionario.Create do
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
      with TdtmCAD_Funcionarios( DatamoduleBase ), TSearchFuncionarioAtivo.Create do
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

procedure TfrmCAD_Funcionarios.dtsFichaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  try
    if Assigned ( DatamoduleBase ) then
      UpdateLabelsPessoaFisicaJuridica ;
  except
  end;
end;


procedure TfrmCAD_Funcionarios.UpdateLabelsPessoaFisicaJuridica;
begin

  with TdtmCAD_Funcionarios( DatamoduleBase ).cdsEntidadePessoa do
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


procedure TfrmCAD_Funcionarios.BitBtn2Click(Sender: TObject);
begin
  inherited;
  TdtmCAD_Funcionarios( DataModuleBase ).cdsOutrosEnderecos.Delete;
end;

procedure TfrmCAD_Funcionarios.cbxInativosClick(Sender: TObject);
begin
  inherited;
  ThreadSuppl.TSyncThread.Create (  ChangeFilter ) ;
//  ChangeFilter
end;

function TfrmCAD_Funcionarios._dbgListaCheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: String): Boolean;
begin
  inherited;
  with TdtmCAD_Funcionarios( DataModuleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsLstEntidadesATIVO ) ) ;

  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TfrmCAD_Funcionarios.OpenTables;
begin
//    UfrmSearchProgress.TfrmSearchProgress.ShowProgress ;
    try
       DatamoduleBase.OpenTables ;
       ChangeFilter ;
    finally
//       UfrmSearchProgress.TfrmSearchProgress.HideProgress ;
    end ;
end;

procedure TfrmCAD_Funcionarios.ChangeFilter;
begin

  TdtmCAD_Funcionarios( DatamoduleBase ).SetFilter (
    cbxInativos.Checked,
    cbxClientes.Checked,
    cbxFornecedores.Checked,
    cbxFuncionarios.Checked,
    {cbxVendedores.Checked} FALSE,
    {cbxRepresentantes.Checked} FALSE,
    {cbxCompradores.Checked} FALSE,
    cbxTransportadora.Checked ) ;


end;

constructor TfrmCAD_Funcionarios.Create(AOwner: TComponent);
begin
  inherited;
  TdtmCAD_Funcionarios.Create ( self ) ;
//  ThreadSuppl.TSimpleThread.Create (  OpenTables ) ;
//  ThreadSuppl.TSyncThread.Create (  OpenTables ) ;
  OpenTables ;
  PageControl1.TabIndex := 0;
end;

procedure TfrmCAD_Funcionarios.dbeCPF_CNPJExit(Sender: TObject);
var Ctrl : TWinControl;
begin
  inherited;
  Ctrl := Screen.ActiveControl;


  if ( TdtmCAD_Funcionarios( DatamoduleBase ).cdsEntidadePESSOA.asString = 'F' ) and
     not TValidates.ValidaCPF( TdtmCAD_Funcionarios( DatamoduleBase ).cdsEntidadeCPF_CNPJ.asString ) then
       dbeCPF_CNPJ.SetFocus
  else if ( TdtmCAD_Funcionarios( DatamoduleBase ).cdsEntidadePESSOA.asString = 'J' ) and
     not TValidates.ValidaCNPJ (TdtmCAD_Funcionarios( DatamoduleBase ).cdsEntidadeCPF_CNPJ.asString )   then
       dbeCPF_CNPJ.SetFocus
  else
   if Ctrl <> dbeCPF_CNPJ  then
     begin
       ActiveControl := nil;
       PostMessage(TWinControl(Ctrl).Handle, WM_SETFOCUS, 0, 0);
       TWinControl(Ctrl).SetFocus;
     end;

end;

procedure TfrmCAD_Funcionarios.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not ( Key in [ '0'..'9'] ) then
     Key := #0 ;
end;

procedure TfrmCAD_Funcionarios.ShowNewFastRegister(Sender: TObject);
begin
//  _pnlForm.Color := clsilver ;
//  self._pageControl.parent := _pnlForm ;
//  self._pnlToolButtons.parent := _pnlForm ;
  if cbTipoPessoa.CanFocus then
     cbTipoPessoa.SetFocus;
end;


class procedure TfrmCAD_Funcionarios.ExecuteNewFastRegister;
var
  ThisForm : TfrmCAD_Funcionarios;
  Handled: Boolean;
begin
  ThisForm := TfrmCAD_Funcionarios.Create(nil);
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

{ SvcEstoqueFuncionariosCadastroFactory }

//procedure SvcCadastroFuncionariosFactory.NovoFornecedor ( var AFornecedorInfo : TFornecedorInfo ) ;
//begin
//    TfrmCAD_Funcionarios.NovoCadastro( AFornecedorInfo ) ;
//end;

{ SvcFuncionarioNewFastRegisterFactory }

procedure SvcFuncionarioNewFastRegisterFactory.ExecuteNewRegister;
begin
  TfrmCAD_Funcionarios.ExecuteNewFastRegister;
end;

initialization
  RegisterClass ( TfrmCAD_Funcionarios ) ;
  //SvcCadastroFuncionarios := SvcCadastroFuncionariosFactory.Create ;
  SvcFuncionarioNewFastRegister := SvcFuncionarioNewFastRegisterFactory.Create ;
finalization
  //SvcCadastroFuncionarios := nil ;
  SvcFuncionarioNewFastRegister := nil ;
end.



