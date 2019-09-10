unit UfrmSYS_USERS;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, SysFormListaFicha,
  VCL.DBCtrls, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit, JvExExtCtrls,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvImage, JvExtComponent, JvPanel,
  JvDBCheckBox, VCL.ImgList, Tc.VCL.Controls.GDIButton, System.ImageList,
  System.Actions, Tc.VCL.Application, uImageListProvider, Wrappers ;

type
  TfrmSYS_USERS = class(T_FormListaFicha)
    Label24: TLabel;
    Label28: TLabel;
    DBEdit27: TDBEdit;
    dbEditEmail: TDBEdit;
    dtsEndereco: TDataSource;
    dtsEntidade: TDataSource;
    Label2: TLabel;
    dbEditLogin: TDBEdit;
    Label3: TLabel;
    dbEditPassword: TDBEdit;
    dtsFazendas: TDataSource;
    btnAlterarPermissoes: TTcGDIButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    cbFuncionario: TJvDBCheckBox;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    dbgIn: TDBGrid;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtDomainModulo1: TDBEdit;
    edtDomainModulo2: TDBEdit;
    edtDomainModulo3: TDBEdit;
    edtDomainModulo4: TDBEdit;
    edtDomainModulo5: TDBEdit;
    edtDomainModulo6: TDBEdit;
    edtLoginModulo1: TDBEdit;
    edtLoginModulo2: TDBEdit;
    edtLoginModulo3: TDBEdit;
    edtLoginModulo4: TDBEdit;
    edtLoginModulo5: TDBEdit;
    edtLoginModulo6: TDBEdit;
    edtPasswordModulo1: TDBEdit;
    edtPasswordModulo2: TDBEdit;
    edtPasswordModulo3: TDBEdit;
    edtPasswordModulo4: TDBEdit;
    edtPasswordModulo5: TDBEdit;
    edtPasswordModulo6: TDBEdit;
    Shape1: TShape;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    CheckBox1: TCheckBox;
    procedure btnAlterarPermissoesClick(Sender: TObject);
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure CheckBox1Click(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
  protected
    procedure Pesquisar ; override ;
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SearchsEntidades, UdtmSYS_USERS, UfrmSelectFazendasUsuario, CL.Ag5.NSMsgs ;

{$R *.dfm}

procedure TfrmSYS_USERS.CheckBox1Click(Sender: TObject);
var
  LPasswordChar : Char ;
begin
  inherited;

  if CheckBox1.Checked then
    LPasswordChar := Chr ( 0 )
  else
    LPasswordChar := 'o' ;

  edtPasswordModulo1.PasswordChar := LPasswordChar ;
  edtPasswordModulo2.PasswordChar := LPasswordChar ;
  edtPasswordModulo3.PasswordChar := LPasswordChar ;
  edtPasswordModulo4.PasswordChar := LPasswordChar ;
  edtPasswordModulo5.PasswordChar := LPasswordChar ;
  edtPasswordModulo6.PasswordChar := LPasswordChar ;

end;

constructor TfrmSYS_USERS.Create(AOwner: TComponent);
begin
  inherited;

  //  defina o tipo de apresentacao do form
  //  caso nao definido, irá usar o default : flLayoutAba
  //  FormLayout := flLayoutAba ; // opcoes : flLayoutAba, flLayoutDual, flLayoutModal

  // insira a criação do datamodule, ex:
  TdtmSYS_USERS.Create ( self ) ;
  self.dtsEntidade.DataSet := TdtmSYS_USERS ( DatamoduleBase ).cdsEntidade ;
  self.dtsEndereco.DataSet := TdtmSYS_USERS ( DatamoduleBase ).cdsEndereco ;
  self.dtsFazendas.DataSet := TdtmSYS_USERS ( DatamoduleBase ).cdsFazendas ;

  DatamoduleBase.OpenTables ;
end;

procedure TfrmSYS_USERS.dtsFichaDataChange(Sender: TObject; Field: TField);
begin
  if not Assigned ( Field ) then
  try
     dbEditLogin.Enabled := AnsiUpperCase ( TdtmSYS_USERS( DatamoduleBase ).cdsUserLOGIN.AsString ) <> 'ADMIN' ;
     btnAlterarPermissoes.Enabled := dbEditLogin.Enabled ;
  except
  end;

end;

procedure TfrmSYS_USERS.btnAlterarPermissoesClick(Sender: TObject);
begin
  inherited;
  Save ;
  TfrmSelectFazendasUsuario.Execute ( TdtmSYS_USERS( DatamoduleBase ).cdsUserKSYSUSER.Value ) ;
  TdtmSYS_USERS( DatamoduleBase ).cdsUser.Refresh ;
end;

procedure TfrmSYS_USERS.Pesquisar;
begin
  inherited;
  with TdtmSYS_USERS( DatamoduleBase ), TSearchUsuario.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
           cdsLstUsers.Locate( 'KSYS$USER',
                   Result.FieldByName( 'KSYS$USER' ).Value, [] ) ;
           ActiveFicha ;
          end;
     finally
        free ;
     end ;
end;

procedure TfrmSYS_USERS._actSaveExecute(Sender: TObject);
begin
  inherited;
  TCLAg5NSMsgUserInfoChanged.CreateAndDispatch( self ) ;
end;

initialization
  RegisterClass ( TfrmSYS_USERS ) ;
end.
