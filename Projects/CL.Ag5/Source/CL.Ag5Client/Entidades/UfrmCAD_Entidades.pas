unit UfrmCAD_Entidades;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, SysFormListaFicha, JvDBControls,
  VCL.DBCtrls, JvSpin, JvDBSpinEdit, JvToolEdit, JvDBCheckBox, JvExStdCtrls,
  JvDBCombobox, JvXPBar, JvExControls, JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers,
  JvErrorIndicator, JvComponentBase, JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask,
  JvExMask, JvExExtCtrls,
  StringSuppl, {DateSuppl, }DSIntF, ThreadSuppl, JvCombobox,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvImage, JvExtComponent,
  JvPanel, Wrappers  ;

type
  TfrmCAD_Entidades = class(T_FormListaFicha)
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
    DBEdit9: TDBEdit;
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
    cbCliente: TJvDBCheckBox;
    Label23: TLabel;
    cbFornecedor: TJvDBCheckBox;
    Label24: TLabel;
    cbFuncionario: TJvDBCheckBox;
    cbTransportadora: TJvDBCheckBox;
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
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure cbxInativosClick(Sender: TObject);
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: String): Boolean;
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure dbeCPF_CNPJExit(Sender: TObject);
  private
    { Private declarations }
    FLabelPessoaFisicaJuridica : string ;
    procedure UpdateLabelsPessoaFisicaJuridica ;
  protected
    { Protected declarations }
    procedure ChangeFilter ;
    procedure OpenTables ;
    procedure Pesquisar ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

   TfrmCAD_EntidadesIni = class ( TfrmCAD_Entidades ) ;

   TfrmCAD_EntidadesFin = class ( TfrmCAD_Entidades ) ;

   TfrmCAD_EntidadesMda = class ( TfrmCAD_Entidades ) ;

   TfrmCAD_EntidadesZoo = class ( TfrmCAD_Entidades ) ;

   TfrmCAD_EntidadesEst = class ( TfrmCAD_Entidades ) ;


implementation

uses UdtmCAD_Entidades, Searchs , UfrmSearchProgress, UDBResources;

{$R *.dfm}


procedure TfrmCAD_Entidades.Pesquisar;
begin
  inherited ;
  with TdtmCAD_Entidades( DatamoduleBase ), TSearchEntidade.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
           cdsLstEntidades.Locate( 'KCAD_ENTIDADE',
                   Result.FieldByName( 'KCAD_ENTIDADE' ).Value, [] ) ;
           ActiveFicha ;
          end ;
     finally
        free ;
     end ;
end;

procedure TfrmCAD_Entidades.dtsFichaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  try
    if Assigned ( DatamoduleBase ) then
      UpdateLabelsPessoaFisicaJuridica ;
  except
  end;
end;


procedure TfrmCAD_Entidades.UpdateLabelsPessoaFisicaJuridica;
begin

  with TdtmCAD_Entidades( DatamoduleBase ).cdsEntidadePessoa do
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


procedure TfrmCAD_Entidades.cbxInativosClick(Sender: TObject);
begin
  inherited;
  UfrmSearchProgress.TfrmSearchProgress.ShowProgress ;
  ThreadSuppl.TSyncThread.Create (  ChangeFilter ) ;
//  ChangeFilter
end;

function TfrmCAD_Entidades._dbgListaCheckIfBooleanField(Grid: TJvDBGrid; 
  Field: TField; var StringForTrue, StringForFalse: String): Boolean;
begin
  inherited;
  with TdtmCAD_Entidades( DataModuleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsLstEntidadesATIVO ) ) ;

  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TfrmCAD_Entidades.OpenTables;
begin
    UfrmSearchProgress.TfrmSearchProgress.ShowProgress ;
    try
       DatamoduleBase.OpenTables ;
       ChangeFilter  ;
    finally
       UfrmSearchProgress.TfrmSearchProgress.HideProgress ;
    end ;
end;

procedure TfrmCAD_Entidades.ChangeFilter;
begin

  TdtmCAD_Entidades( DatamoduleBase ).SetFilter (
    cbxInativos.Checked,
    cbxClientes.Checked,
    cbxFornecedores.Checked,
    {cbxFuncionarios.Checked,} FALSE,
    {cbxVendedores.Checked} FALSE,
    {cbxRepresentantes.Checked} FALSE,
    {cbxCompradores.Checked} FALSE,
    cbxTransportadora.Checked ) ;


end;

constructor TfrmCAD_Entidades.Create(AOwner: TComponent);
begin
  inherited;
  TdtmCAD_Entidades.Create ( self ) ;
//  ThreadSuppl.TSimpleThread.Create (  OpenTables ) ;
//  ThreadSuppl.TSyncThread.Create (  OpenTables ) ;
  OpenTables ;
  Name := Copy ( ClassName, 2, Length ( ClassName ) - 1 ) ;
end;

procedure TfrmCAD_Entidades.dbeCPF_CNPJExit(Sender: TObject);
begin
  inherited;

  if ( TdtmCAD_Entidades( DatamoduleBase ).cdsEntidadePESSOA.asString = 'F' ) and
     not TValidates.ValidaCPF( TdtmCAD_Entidades( DatamoduleBase ).cdsEntidadeCPF_CNPJ.asString ) then
       dbeCPF_CNPJ.SetFocus
  else if ( TdtmCAD_Entidades( DatamoduleBase ).cdsEntidadePESSOA.asString = 'J' ) and
     not TValidates.ValidaCNPJ (TdtmCAD_Entidades( DatamoduleBase ).cdsEntidadeCPF_CNPJ.asString )   then
       dbeCPF_CNPJ.SetFocus ;

end;

procedure TfrmCAD_Entidades.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not ( Key in [ '0'..'9'] ) then
     Key := #0 ;
end;

initialization
  RegisterClass ( TfrmCAD_EntidadesIni ) ;
  RegisterClass ( TfrmCAD_EntidadesFin ) ;
  RegisterClass ( TfrmCAD_EntidadesMda ) ;
  RegisterClass ( TfrmCAD_EntidadesZoo ) ;
  RegisterClass ( TfrmCAD_EntidadesEst ) ;
end.


