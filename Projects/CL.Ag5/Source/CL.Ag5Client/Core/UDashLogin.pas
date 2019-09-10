unit UDashLogin;

interface

uses WinApi.Windows, WinApi.Messages, System.SysUtils, System.Classes, VCL.Graphics, VCL.Controls, VCL.StdCtrls,
  VCL.Buttons, VCL.ExtCtrls, Data.DB, Tc.Data.DB.Helpers,
  jpeg, JvExControls, JvComponent, JvDBLookup, UdtmSYS_Login,
  VCL.Forms, VCL.ActnList,
  Tc.VCL.Form,
  Tc.VCL.Dialogs,
  Tc.RTL.Exceptions,
  Tc.VCL.Application,
  Tc.VCL.ApplicationIntf,
  pngimage, JvStaticText, VCL.DBCtrls, Tc.VCL.DBLookup, JvVersionControlActions,
  JvXPCore, JvXPContainer, VCL.Menus, System.Actions, JvComponentBase,
  JvExExtCtrls, JvExtComponent,
  JvJVCLUtils, JvPanel, AdvDBLookupComboBox, System.ImageList, Vcl.ImgList,
  CLAg5.AccessKeyGen, Tc.VCL.Extended.Controls, Vcl.AppEvnts,
  CL.Ag5.NSMsgs ;
//  Tc.VCL.DBLookup ;

type


  TJvDBLookupCombo = class ( JvDBLookup.TJvDBLookupCombo )
  protected
   procedure CreateParams(var Params: TCreateParams); override ;
  end;

  TTcDBLookupComboBox = class ( Tc.VCL.DBLookup.TTcDBLookupComboBox )
  protected
   procedure CreateParams(var Params: TCreateParams); override ;
  end;


  TfrmDash_Login = class(TTcForm, ILoginFormServices)
    spbOk: TImage;
    SpeedButton2: TSpeedButton;
    lblPassword: TLabel;
    edtPassword: TEdit;
    dtsUsers: TDataSource;
    dtsDomains: TDataSource;
    lblUser: TLabel;
    lblDomain: TLabel;
    lblProfile: TLabel;
    dtsProfiles: TDataSource;
    lblConnectStatus: TLabel;
    JvVersionControlActionList1: TJvVersionControlActionList;
    actCfgDB: TAction;
    actCfgDomain: TAction;
    ppmDatabase: TPopupMenu;
    Configurarbanco1: TMenuItem;
    ImageWithProfile: TImage;
    ImgLogo: TImage;
    lblIniciarSessao: TLabel;
    lblForgotPassword: TLabel;
    lblLicense: TLabel;
    ImgLocker: TImage;
    ImageWithoutProfile: TImage;
    SeparatorShape: TShape;
    ImgLicenceClick: TImage;
    Image1: TImage;
    dblcProfile: TTcDBLookupComboBox;
    dblcDomain: TTcDBLookupComboBox;
    dblcUser: TTcDBLookupComboBox;
    ApplicationEvents: TApplicationEvents;
    procedure edtPasswordChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsDomainsDataChange(Sender: TObject; Field: TField);
    procedure MouseEnter(Sender: TObject);
    procedure MouseLeave(Sender: TObject);
    procedure lblForgotPasswordClick(Sender: TObject);
    procedure TcMPFormActivate(Sender: TObject);
    procedure dblcDomainEnter(Sender: TObject);
    procedure dblcProfileEnter(Sender: TObject);
    procedure dblcUserEnter(Sender: TObject);
    procedure dblcUserCloseUp(Sender: TObject);
    procedure dblcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spbCfgDomainClick(Sender: TObject);
    procedure actCfgDBExecute(Sender: TObject);
    procedure actCfgDomainExecute(Sender: TObject);
    procedure actCfgDBUpdate(Sender: TObject);
    procedure actCfgDomainUpdate(Sender: TObject);
    procedure lblSerialClick(Sender: TObject);
    procedure TcFormClose(Sender: TObject; var Action: TCloseAction);
    procedure LicenseClick(Sender: TObject);
    procedure dblcProfileCloseUp(Sender: TObject);
    procedure ImgLicenceClickMouseEnter(Sender: TObject);
    procedure ImgLicenceClickMouseLeave(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure spbOkClick(Sender: TObject);
    procedure TcFormClick(Sender: TObject);
    procedure TcFormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ApplicationEventsActivate(Sender: TObject);
    procedure ApplicationEventsDeactivate(Sender: TObject);
    procedure dblcUserChange(Sender: TObject);
  private
    { Private declarations }
    FModal : TCustomForm ;
    dtmSYS_Login: TdtmSYS_Login ;
    FClosing : boolean ;
    FActiveProfile : string ;
    FChangedDataBase : boolean ;
    procedure ActivateModal(Sender: TObject);
    procedure CheckDatabaseList ;
    procedure ConnectSelectedProfile ;
    procedure CheckDomain ;
    procedure checkUserMachine ;
    procedure DoLogin ;
    procedure Execute ;
    procedure HideAccessControls ;
    procedure ShowAccessControls ;
    procedure ShowDatabaseList ;
    procedure ShowDomainList ;
    procedure DoBringToFront( AMsg : TCLAg5NSMsg ) ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

{$R *.DFM}

uses
   shellAPI , CLAG5.DatabaseIntf, threadSuppl, variants , UDomainListForm,
  UDatabaseListForm, ClipBrd;
  //CL.Ag5.NSMsgs ;

procedure TJvDBLookupCombo.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  exit ;
  with Params do
    if NewStyleControls and Ctl3D then
      ExStyle := ExStyle - WS_EX_CLIENTEDGE
    else
      Style := Style - WS_BORDER;
end;

constructor TfrmDash_Login.Create(AOwner: TComponent);
begin
  inherited;
//  Brush.Style := bsClear ;
//TcDBLookupComboBox1.
////  dblcProfile.Button.Flat := True ;
////  dblcDomain.Button.Flat  := True ;
////  dblcUser.Button.Flat    := True ;

  TCLAg5NSMsgBringToFront.Subscribe ( DoBringToFront ) ;
  dtmSYS_Login         := TdtmSYS_Login.Create ( self ) ;
  dtsProfiles.DataSet  := dtmSYS_Login.cdsProfiles ;
  dtsDomains.DataSet   := dtmSYS_Login.cdsDomains ;
  dtsUsers.DataSet     := dtmSYS_Login.cdsUsers ;
  //lblSerial.Caption    := 'Serial : ' + dtmSYS_Login.ComputerID ;

  lblProfile.Visible          := dtmSYS_Login.cdsProfiles.RecordCount <> 1 ;
  dblcProfile.Visible         := lblProfile.Visible ;
  ImageWithProfile.Visible    := lblProfile.Visible ;
  ImageWithoutProfile.Visible := not lblProfile.Visible ;

  dblcDomain.visible := not lblProfile.Visible ;
  dblcUser.visible   := not lblProfile.Visible ;

  ShowAccessControls ;
(*
   if lblProfile.Visible then
     begin

     end;
*)

// teste
//  ImageWithProfile.Visible    := False ;
//  ImageWithoutProfile.Visible := True ;

  if ImageWithoutProfile.Visible then
    begin
      ImgLogo.Top := ImgLogo.Top + 40 ;
      lblIniciarSessao.Top := lblIniciarSessao.Top + 40 ;
    end;

end;


procedure TfrmDash_Login.edtPasswordChange(Sender: TObject);
begin
     spbOK.Visible := ( edtPassword.Text <> '' ) ;
end;


procedure TfrmDash_Login.Execute;
begin
   ShowModal ;
   (*
   if ShowModal = mrCancel then
     begin
       Application.Application.Terminate ;
       Application.Application.ProcessMessages ;
       Abort ;
     end ;
     *)
end;

procedure TfrmDash_Login.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
EXIT ;
       if ( modalResult <> mrOk ) then
         begin

          CanClose  :=  ( MessageDlg ( 'Em caso de cancelamento da entrada de Usuário/Senha, ' + #13 +
                                      'a execução do sistema será finalizada.'              + #13#13 +
                                      'Deseja encerrar o sistema?'  , mtWarning, [mbYes,mbNo], 0  )
                        = mrYes ) ;
          FClosing := not CanClose ;
         end ;

end;

procedure TfrmDash_Login.actCfgDBExecute(Sender: TObject);
begin
  ShowDatabaseList ;
end;

procedure TfrmDash_Login.actCfgDBUpdate(Sender: TObject);
begin

  //TAdvDBLookupComboBox
//   actCfgDb.Enabled := not (  dblcProfile.ListVisible
//                           or dblcDomain.ListVisible
//*                           or dblcUser.ListVisible )
end;

procedure TfrmDash_Login.actCfgDomainExecute(Sender: TObject);
begin
  ShowDomainList;
end;

procedure TfrmDash_Login.actCfgDomainUpdate(Sender: TObject);
begin
//   actCfgDomain.Enabled := not (  dblcProfile.ListVisible
//                               or dblcDomain.ListVisible
//                               or dblcUser.ListVisible )
end;

procedure TfrmDash_Login.ActivateModal(Sender: TObject);
begin
end;

procedure TfrmDash_Login.ApplicationEventsActivate(Sender: TObject);
begin

  {if not Assigned ( FModal ) then
  begin
   FormStyle := fsStayOnTop ;
   BringToFront ;
   SetFocus ;
  end        }

  if Assigned ( FModal ) then
  begin
    FModal.BringToFront;
  end;
end;

procedure TfrmDash_Login.ApplicationEventsDeactivate(Sender: TObject);
begin
   FormStyle := fsNormal ;
   SendToBack ;
end;

procedure TfrmDash_Login.SpeedButton2Click(Sender: TObject);
begin
   FClosing := True ;
   modalResult := mrCancel ;
end;

procedure TfrmDash_Login.TcFormClick(Sender: TObject);
begin

   with ImgLicenceClick do
    if ( ( visible ) and PtInRect( ClientRect, ScreenToClient( Mouse.CursorPos ) ) ) then
       LicenseClick( self ) ;

   with Image1 do
    if ( ( visible ) and PtInRect( ClientRect, ScreenToClient( Mouse.CursorPos ) ) ) then
       lblForgotPasswordClick( self ) ;

end;

procedure TfrmDash_Login.TcFormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree ;
end;

procedure TfrmDash_Login.TcFormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
 LInLink : boolean ;
begin
   with ImgLicenceClick do
    LInLink := Visible and
       ( PtInRect( ClientRect, ScreenToClient( Mouse.CursorPos ) ) ) ;

    if LInLink then
      begin
        MouseEnter ( lblLicense ) ;
        exit ;
      end;
    MouseLeave ( lblLicense ) ;

    with Image1 do
      LInLink :=  Visible and
       ( PtInRect( ClientRect, ScreenToClient( Mouse.CursorPos ) ) ) ;

    if LInLink then
      begin
        MouseEnter ( lblForgotPassword ) ;
        exit ;
      end;
    MouseLeave ( lblForgotPassword ) ;
end;

procedure TfrmDash_Login.TcMPFormActivate(Sender: TObject);
begin
  OnActivate := ActivateModal ;
  CheckDatabaseList ;
end;

procedure TfrmDash_Login.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if ActiveControl = edtPassword then
       begin

         if Key = #13 then
            begin
               Key := #0 ;
               spbOkClick(nil) //spbOk.Click;
            end ;

         if Key = #27 then
            begin
               Key := #0 ;
               SpeedButton2.Click;
            end ;

       end ;


end;

procedure TfrmDash_Login.Image1Click(Sender: TObject);
begin
showMessage('clique')
//    shellExecute ( Application.Application.handle, 'open', 'http://www.turbocode.com.br/', nil, nil, SW_SHOW ) ;
end;

procedure TfrmDash_Login.Image1MouseEnter(Sender: TObject);
begin
  MouseEnter( lblForgotPassword ) ;
end;

procedure TfrmDash_Login.Image1MouseLeave(Sender: TObject);
begin
  MouseLeave( lblForgotPassword ) ;
end;

procedure TfrmDash_Login.ImgLicenceClickMouseEnter(Sender: TObject);
begin
  MouseEnter( lblLicense ) ;
end;

procedure TfrmDash_Login.ImgLicenceClickMouseLeave(Sender: TObject);
begin
  MouseLeave( lblLicense ) ;
end;

procedure TfrmDash_Login.LicenseClick(Sender: TObject);
begin
 actCfgDomain.Execute
end;

procedure TfrmDash_Login.lblForgotPasswordClick(Sender: TObject);
begin

  if Trim ( dtmSYS_Login.cdsUsersEMAIL.asString ) = '' then
     raise Warning.CreateFmt('O usuário ''%s'' não possui email cadastrado.'#13#10'Não é possível redefinir a senha.', [ dtmSYS_Login.cdsUsersLOGIN.asString ] ) ;

  if MessageDlg( 'Deseja redefinir sua senha e enviar para o email :'#13#10 + dtmSYS_Login.cdsUsersEMAIL.asString, mtConfirmation ) <>  mrYes then
    exit ;

  dtmSYS_Login.ResetPassword ;

  MessageDlg ( 'A senha to usuario ''' + dtmSYS_Login.cdsUsersEMAIL.asString
             + ''' foi redefinida e enviada para o email:'
             + #13#10 + dtmSYS_Login.cdsUsersEMAIL.asString ) ;
end;

procedure TfrmDash_Login.MouseEnter(Sender: TObject);
begin
  TLabel( Sender ).Font.Style := TLabel( Sender ).Font.Style + [fsUnderline] ;
  Cursor := crHandPoint ;
end;

procedure TfrmDash_Login.MouseLeave(Sender: TObject);
begin
  TLabel( Sender ).Font.Style := TLabel( Sender ).Font.Style - [fsUnderline] ;
  Cursor := crDefault ;
end;

procedure TfrmDash_Login.lblSerialClick(Sender: TObject);
begin
  Clipbrd.Clipboard.AsText := dtmSYS_Login.ComputerID ;
//  ShowMessageFmt  ( '%s,'#13#10'copiado para área de transferência.', [ lblSerial.Caption ] ) ;
end;

procedure TfrmDash_Login.CheckDatabaseList;
var
  LProfileItemsCount : integer ;
begin
  if FClosing then
     Exit ;

  LProfileItemsCount := dtmSYS_Login.cdsProfiles.RecordCount ;
  if LProfileItemsCount = 0 then
     showMessage ( 'Nenhuma base de dados cadastrada.' )
  else if LProfileItemsCount = 1 then
    ConnectSelectedProfile
  else
    begin
      ActiveControl := dblcProfile ;
    end;
end;

procedure TfrmDash_Login.CheckDomain;
begin
//  dblcDomain.KeyValue := dtmSYS_Login.cdsDomainsKSYSDOMAIN.Value ;
//  dblcDomain.SetFocus ;
end;

procedure TfrmDash_Login.checkUserMachine;
var
  lpBuffer : Array[0..20] of Char ;
  nSize : dWord;

begin
  if FClosing then
     exit ;

  Update ;
  nSize := 20 ;

  {if}( GetUserName( lpBuffer, nSize ) ) {and} ;
//  if  ( dtmSYS_Login.cdsUsers.Locate ( 'LOGIN', Trim ( lpBuffer ), [loCaseInsensitive] ) ) then
//     dblcUser.KeyValue := dtmSYS_Login.cdsUsersKSYS_USER.Value ;

//  if dtmSYS_Login.cdsUsers.RecordCount > 0 then
//     threadSuppl.TSyncThread.Create( dblcUser.DropDown ) ;

end;

procedure TfrmDash_Login.ConnectSelectedProfile;
var
  T : TDateTime ;
begin
  if FActiveProfile = dtmSYS_Login.cdsProfilesALIAS.AsString then
    exit ;

  FActiveProfile := '' ;
//  dblcProfile.KeyValue       := dtmSYS_Login.cdsProfilesALIAS.AsString ;
//  dblcProfile.sel
  DatabaseCfgFactory.Profile := dtmSYS_Login.cdsProfilesALIAS.AsString ;
  lblConnectStatus.Caption   := Format('Conectando perfil "%s" ...', [ dtmSYS_Login.cdsProfilesDESCRIPTION.AsString ] ) ;
  HideAccessControls ;

  T := now ;
  try
    self.dtmSYS_Login.OpenTables ;
    FActiveProfile  := dtmSYS_Login.cdsProfilesALIAS.AsString ;
    ShowAccessControls ;
    FChangedDataBase :=  True ;
  except on E : Exception do
    begin
      lblConnectStatus.Caption := Format('%s : Não conectado', [ dtmSYS_Login.cdsProfilesDESCRIPTION.AsString ] ) ;
      raise Warning.CreateFmt('Não foi possível conectar ao perfil : %s'#13#10'%s'#13#10'(%s)', [
         dtmSYS_Login.cdsProfilesDESCRIPTION.AsString,
         E.Message, FormatDateTime ( 'nn:ss.zzz', Now -T  ) ] ) ;
    end;
  end;
  CheckDomain;
end;


destructor TfrmDash_Login.Destroy;
begin
  TCLAg5NSMsgBringToFront.UnSubscribe ( DoBringToFront ) ;
  inherited;
end;

procedure TfrmDash_Login.DoBringToFront(AMsg: TCLAg5NSMsg);
begin
  BringToFront;
end;

procedure TfrmDash_Login.DoLogin;
var
   lExit: Boolean;
   j : TGraphic ;
begin
   lExit := False;

   if ( Trim ( edtPassword.Text ) <> dtmSYS_Login.cdsUsersSPASSWORD.asString ) then
     begin
      showMessage ( 'Senha inválida !!!' ) ;
//          +#13#10 + dtmSYS_Login.cdsUsersKSYS_USER.asString
//          +#13#10 + dtmSYS_Login.cdsUsersLOGIN.asString
//          +#13#10 + dtmSYS_Login.cdsUsersSPASSWORD.asString
//           ) ;

      edtPassword.selectAll ;
      edtPassword.setFocus ;
      exit ;
     end ;

   with Application do
     begin
       DatabaseCfgFactory.Domain := dtmSYS_Login.cdsDomainsDOMAIN_CODE.asString ;
       LoggedUser.BeginUpdate ;
       LoggedUser.UserID       := dtmSYS_Login.cdsUsersKSYS_USER.asString ;
       LoggedUser.Login        := dtmSYS_Login.cdsUsersLOGIN.asString ;
       LoggedUser.License      := dtmSYS_Login.cdsDomainsSYSLICENSE.asString ;
       LoggedUser.DomainID     := dtmSYS_Login.cdsDomainsKSYSDOMAIN.asString ;
       LoggedUser.DomainCode   := dtmSYS_Login.cdsDomainsDOMAIN_CODE.asString ;
       LoggedUser.DomainName   := dtmSYS_Login.cdsDomainsDOMAIN_NAME.asString ;
       LoggedUser.DomainAlias  := dtmSYS_Login.cdsDomainsDOMAIN_ALIAS.asString ;

    with FactoryAccessKeyValidate do
      begin
        PublicKey  := dtmSYS_Login.ComputerID ;
        PrivateKey := LoggedUser.License ;
        Validate ;
      end;


       TCLAg5NSMsgSysDomainImageChanged.CreateAndDispatch( self ) ;

       //ApplResources.DBResources.LogUser ( LoggedUser.Login ) ;

    //   LoggedUser.Nome  := dtmSYS_Login.cdsUsersNome.asString ;
    //   LoggedUser.email := dtmSYS_Login.cdsUsersEmail.asString ;
       LoggedUser.password := dtmSYS_Login.cdsUsersSPASSWORD.asString ;
    //   LoggedUser.KSYS_CHANGELOG  := dtmSYS_Login.cdsUsersKSYS_CHANGELOG.AsInteger ;
       LoggedUser.EndUpdate ;

       CheckLicense ;
     end ;

   //modalResult := mrOk ;
   Close ;
end;

procedure TfrmDash_Login.FormShow(Sender: TObject);
begin
   SetForegroundWindow(Application.Application.Handle);
end;


procedure TfrmDash_Login.HideAccessControls;
begin
///  dblcProfile.OnClosed := nil;

  lblDomain.Visible          := False ;
  lblUser.Visible            := False ;
  lblPassword.Visible        := False ;

  dblcDomain.Visible   := False ;
  dblcUser.Visible     := False ;
  edtPassword.Visible  := False ;

  lblLicense.Visible       := False ;
  ImgLocker.Visible           := False ;
  ImgLicenceClick.Visible  := False ;
  SeparatorShape.Visible  := False ;

  lblForgotPassword.Visible  := False ;

  lblConnectStatus.Visible   := True ;

  Application.ProcessMessages ;

///  dblcProfile.OnClosed := dblcProfileClosed ;
end;

procedure TfrmDash_Login.ShowAccessControls;
begin
  lblConnectStatus.Visible   := False ;

  lblDomain.Visible          := True ;
  lblUser.Visible            := True ;
  lblPassword.Visible        := True ;

  dblcDomain.Visible   := True ;
  dblcUser.Visible     := True ;
  edtPassword.Visible  := True ;

  lblLicense.Visible         := FActiveProfile <> '' ;
  ImgLocker.Visible          := FActiveProfile <> '' ;
  lblForgotPassword.Visible  := FActiveProfile <> '' ;
  SeparatorShape.Visible             := FActiveProfile <> '' ;
  lblForgotPassword.Visible := not ( VarIsNull( dblcUser.KeyValue ) or VarIsEmpty( dblcUser.KeyValue ) );
  Image1.Visible :=  lblForgotPassword.Visible;
end;

procedure TfrmDash_Login.ShowDatabaseList;
begin
   with TDatabaseListForm.Create ( nil ) do
     try
       ShowModal
     finally
       free
     end;
end;

procedure TfrmDash_Login.ShowDomainList;
begin
   FormStyle := fsNormal ;

   FModal := TDomainListForm.Create ( nil ) ;
   with FModal do
     try
       ShowModal ;
     finally
       free
     end;
   FModal := nil ;
   {FormStyle := fsStayOnTop ; }
   BringToFront ;
   dtmSYS_Login.Refresh ;
end;

procedure TfrmDash_Login.spbCfgDomainClick(Sender: TObject);
begin
  ShowDomainList ;
end;

procedure TfrmDash_Login.spbOkClick(Sender: TObject);
begin
   DoLogin ;
end;

procedure TfrmDash_Login.dblcProfileCloseUp(Sender: TObject);
begin
  if FClosing then
    exit ;
  ConnectSelectedProfile ;
end;

procedure TfrmDash_Login.dblcProfileEnter(Sender: TObject);
begin
//  if FClosing then
//     exit ;
//
//  if FActiveProfile <> dtmSYS_Login.cdsProfilesALIAS.AsString then
//     threadSuppl.TSyncThread.Create( dblcProfile.DropDown );
end;

procedure TfrmDash_Login.dblcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if FClosing then
    exit ;

  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] )
  and not ( TTcDBLookupComboBox ( Sender ).ListVisible )
  and ( TTcDBLookupComboBox ( Sender ).ListSource.DataSet.RecordCount > 1) then
    begin
     Key := 0 ;
     TTcDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TfrmDash_Login.dblcDomainEnter(Sender: TObject);
begin
//   if FClosing then
//      exit ;

  //if dtmSYS_Login.cdsDomains.RecordCount > 1 then
//  if FChangedDataBase then
//    begin
//     threadSuppl.TSyncThread.Create( dblcDomain.DropDown );
//     FChangedDataBase := False ;
///    end;
end;

procedure TfrmDash_Login.dblcUserChange(Sender: TObject);
begin
  lblForgotPassword.Visible := not ( VarIsNull( dblcUser.KeyValue ) or VarIsEmpty( dblcUser.KeyValue ) );
  Image1.Visible :=  lblForgotPassword.Visible;
end;

procedure TfrmDash_Login.dblcUserCloseUp(Sender: TObject);
begin
  ActiveControl := edtPassword ;
end;

procedure TfrmDash_Login.dblcUserEnter(Sender: TObject);
begin
  checkUserMachine ;
end;

procedure TfrmDash_Login.dtsDomainsDataChange(Sender: TObject;
  Field: TField);
begin
  try
///    if Assigned ( dtmSYS_Login ) and (  not Assigned ( Field ) ) and
 //      ( dblcUser.KeyValue <> dtmSYS_Login.cdsUsersKSYS_USER.asString ) then
 //      dblcUser.KeyValue := ''; //dtmSYS_Login.cdsUsersKSYS_USER.asString ;
  except
  end ;
end;

{ TTcDBLookupComboBox }

procedure TTcDBLookupComboBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  with Params do
    if NewStyleControls and Ctl3D then
      ExStyle := ExStyle - WS_EX_CLIENTEDGE
    else
      Style := Style - WS_BORDER;
end;

initialization
  RegisterClass ( TfrmDash_Login )
end.
