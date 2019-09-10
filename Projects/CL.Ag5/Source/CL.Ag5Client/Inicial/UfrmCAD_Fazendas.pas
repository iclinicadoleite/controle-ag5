unit UfrmCAD_Fazendas;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Dialogs,
  VCL.Grids, VCL.DBGrids, SysFormListaFicha, VCL.DBCtrls, VCL.Menus, Data.DB, Tc.Data.DB.Helpers,
  VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit, JvExExtCtrls,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvImage, JvExtComponent,
  JvDialogs, ExtDlgs, JvDBImage, VCL.ImgList, Tc.VCL.Dialogs,
  Tc.VCL.Controls.GDIButton, System.ImageList, System.Actions,
  JvExStdCtrls, JvCombobox, JvDBCombobox, Tc.VCL.Application, uImageListProvider, Wrappers ;

type
  TfrmCAD_Fazendas = class(T_FormListaFicha)
    Label24: TLabel;
    Label28: TLabel;
    DBEdit27: TDBEdit;
    DBEdit31: TDBEdit;
    dtsEndereco: TDataSource;
    dtsEntidade: TDataSource;
    dtsUsuarios: TDataSource;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Button1: TTcGDIButton;
    Label9: TLabel;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    DBEdit8: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    DBImage1: TJvDBImage;
    Button2: TTcGDIButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dbgIn: TDBGrid;
    OpenPictureDialog: TOpenPictureDialog;
    Button3: TTcGDIButton;
    actAlterarLogotipo: TAction;
    actLimparLogotipo: TAction;
    actAlterarPermissaoUsuarios: TAction;
    lblCNPCNPJ: TLabel;
    dbeCPF_CNPJ: TDBEdit;
    Label29: TLabel;
    cbTipoPessoa: TJvDBComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure _actNewUpdate(Sender: TObject);
    procedure _actDeleteUpdate(Sender: TObject);
    procedure _actOtherUpdate(Sender: TObject);
    procedure _actPrintExecute(Sender: TObject);
    procedure actAlterarLogotipoExecute(Sender: TObject);
    procedure actLimparLogotipoExecute(Sender: TObject);
    procedure actAlterarPermissaoUsuariosExecute(Sender: TObject);
    procedure actAlterarLogotipoUpdate(Sender: TObject);
    procedure actLimparLogotipoUpdate(Sender: TObject);
    procedure actAlterarPermissaoUsuariosUpdate(Sender: TObject);
    procedure dtsEntidadeDataChange(Sender: TObject; Field: TField);
    procedure TcFormShow(Sender: TObject);
  protected
    procedure Pesquisar ; override ;

  private
    { Private declarations }
    FLabelPessoaFisicaJuridica : string ;
    procedure UpdateLabelsPessoaFisicaJuridica;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SearchsEntidades, UdtmCAD_Fazendas, UfrmSelectUsuariosFazenda, Validates ;

{$R *.dfm}

constructor TfrmCAD_Fazendas.Create(AOwner: TComponent);
begin
  inherited;

  //  defina o tipo de apresentacao do form
  //  caso nao definido, irá usar o default : flLayoutAba
  //  FormLayout := flLayoutAba ; // opcoes : flLayoutAba, flLayoutDual, flLayoutModal

  // insira a criação do datamodule, ex:

  TdtmCAD_Fazendas.Create ( self ) ;
  dtsLista.DataSet := TdtmCAD_Fazendas(DatamoduleBase).cdsLstFazendas;
  dtsFicha.DataSet := TdtmCAD_Fazendas(DatamoduleBase).cdsFazenda;
  dtsEntidade.DataSet := TdtmCAD_Fazendas(DatamoduleBase).cdsEntidade;
  dtsEndereco.DataSet := TdtmCAD_Fazendas(DatamoduleBase).cdsEndereco;
  dtsUsuarios.DataSet := TdtmCAD_Fazendas(DatamoduleBase).cdsUsuarios;
  DbImage1.Visible := False;
  TdtmCAD_Fazendas(DatamoduleBase).OpenTables ;
  ToolButton1.Enabled     := False;
  _tbsLista.Enabled       := False;
  _pageControl.ActivePage := _tbsFicha;
end;




procedure TfrmCAD_Fazendas.dtsEntidadeDataChange(Sender: TObject;
  Field: TField);
var
  Ctrl : TWinControl;
begin
  if not Assigned(TdtmCAD_Fazendas(DatamoduleBase)) then
    Exit;

  UpdateLabelsPessoaFisicaJuridica ;

  if Field = TdtmCAD_Fazendas( DatamoduleBase ).cdsEntidadeCPF_CNPJ then
    begin
      Ctrl := Screen.ActiveControl;

      if ( TdtmCAD_Fazendas( DatamoduleBase ).cdsEntidadePESSOA.asString = 'F' ) and
         not TValidates.ValidaCPF( TdtmCAD_Fazendas( DatamoduleBase ).cdsEntidadeCPF_CNPJ.asString ) then
           dbeCPF_CNPJ.SetFocus
      else if ( TdtmCAD_Fazendas( DatamoduleBase ).cdsEntidadePESSOA.asString = 'J' ) and
         not TValidates.ValidaCNPJ (TdtmCAD_Fazendas( DatamoduleBase ).cdsEntidadeCPF_CNPJ.asString )   then
           dbeCPF_CNPJ.SetFocus
      else
        begin
          ActiveControl := nil;
          PostMessage(TWinControl(Ctrl).Handle, WM_SETFOCUS, 0, 0);
          TWinControl(Ctrl).SetFocus;
        end;
    end ;
end;

procedure TfrmCAD_Fazendas.Pesquisar;
begin
  inherited;
  with TdtmCAD_Fazendas( DatamoduleBase ), TSearchFazenda.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
           cdsLstFazendas.Locate( 'KCAD_FAZENDA',
                   Result.FieldByName( 'KCAD_FAZENDA' ).Value, [] ) ;
           ActiveFicha ;
          end ;
     finally
        free ;
     end ;
end;

procedure TfrmCAD_Fazendas.TcFormShow(Sender: TObject);
begin
  inherited;
  DbImage1.Visible := True;
end;

procedure TfrmCAD_Fazendas._actDeleteUpdate(Sender: TObject);
begin
  _actDelete.Enabled := False ;
end;

procedure TfrmCAD_Fazendas._actNewUpdate(Sender: TObject);
begin
  _actNew.Enabled := False ;
end;

procedure TfrmCAD_Fazendas._actOtherUpdate(Sender: TObject);
begin
  _actOther.Enabled := False ;
end;

procedure TfrmCAD_Fazendas._actPrintExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCAD_Fazendas.actAlterarLogotipoExecute(Sender: TObject);
begin
  Save ;
  if OpenPictureDialog.Execute then
     TdtmCAD_Fazendas( DatamoduleBase ).LoadLogo ( OpenPictureDialog.FileName ) ;
end;

procedure TfrmCAD_Fazendas.actAlterarLogotipoUpdate(Sender: TObject);
begin
  actAlterarLogotipo.Enabled := not ( TdtmCAD_Fazendas( DatamoduleBase ).cdsFazenda.State in [dsInsert,dsEdit] ) ;
end;

procedure TfrmCAD_Fazendas.actAlterarPermissaoUsuariosExecute(Sender: TObject);
begin
  Save ;
  TfrmSelectUsuariosFazenda.Execute ( TdtmCAD_Fazendas( DatamoduleBase ).cdsFazendaKCAD_FAZENDA.Value ) ;
  TdtmCAD_Fazendas( DatamoduleBase ).cdsFazenda.Refresh ;
end;

procedure TfrmCAD_Fazendas.actAlterarPermissaoUsuariosUpdate(Sender: TObject);
begin
  actAlterarPermissaoUsuarios.Enabled := not ( TdtmCAD_Fazendas( DatamoduleBase ).cdsFazenda.State in [dsInsert,dsEdit] ) ;
end;

procedure TfrmCAD_Fazendas.actLimparLogotipoExecute(Sender: TObject);
begin
  Save ;
  TdtmCAD_Fazendas( DatamoduleBase ).ClearLogo;
end;

procedure TfrmCAD_Fazendas.actLimparLogotipoUpdate(Sender: TObject);
begin
  actLimparLogotipo.Enabled := not ( TdtmCAD_Fazendas( DatamoduleBase ).cdsFazenda.State in [dsInsert,dsEdit] ) ;
end;

procedure TfrmCAD_Fazendas.UpdateLabelsPessoaFisicaJuridica;
begin
  with TdtmCAD_Fazendas( DatamoduleBase ).cdsEntidadePessoa do
     begin
       if FLabelPessoaFisicaJuridica = AsString then
          exit ;

       FLabelPessoaFisicaJuridica := AsString ;
     end ;

  if FLabelPessoaFisicaJuridica = 'F' then
     begin
//       lblNomeRazao.Caption       := 'Nome' ;
//       lblApelidoFantasia.Caption := 'Apelido' ;
       lblCNPCNPJ.Caption         := 'CPF' ;
//       lblRGIE.Caption            := 'RG' ;
//       lblNascimento.Caption      := 'Nascimento' ;
     end
  else
     begin
//       lblNomeRazao.Caption       := 'Razão Social' ;
//       lblApelidoFantasia.Caption := 'Nome Fantasia' ;
       lblCNPCNPJ.Caption         := 'CNPJ' ;
//       lblRGIE.Caption            := 'IE' ;
//       lblNascimento.Caption      := 'Fundação' ;
     end ;
end;


initialization
  RegisterClass ( TfrmCAD_Fazendas ) ;

end.
