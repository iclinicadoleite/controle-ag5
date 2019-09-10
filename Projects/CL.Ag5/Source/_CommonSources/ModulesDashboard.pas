unit ModulesDashboard;

interface

uses
  FMX.Forms, UDashboard,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls,
  Tc.RTL.Packages.Manager, Vcl.StdCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  Vcl.Imaging.pngimage, Vcl.Buttons, Tc.VCL.Extended.Controls, Tc.VCL.DBLookup,
  Vcl.Menus, System.Actions, Vcl.ActnList, Data.DB, Tc.Data.DB.Helpers,
  System.ImageList, Vcl.ImgList, Vcl.WinXCtrls, Tc.VCL.Application,
  CL.Ag5.NSMsgs,
  System.IOUtils, JvDialogs, JvClock, Vcl.Imaging.jpeg,
  CLAg5.AccessKeyGen,
  Parnassus.FMXContainer,
  Tc.RTL.NotificationService,
  System.Generics.Collections,
  UDashMenu, UClinicaTalk,
  Tc.VCL.Form, UPopupMenuManuais,
  Vcl.Themes,
  Vcl.Styles,
  UDBSession ;

var
    FModuleSelectorImageStream : TMemoryStream ;


type

  TStateButtons = ( sbDisabled, sbEnabled, sbHot, sbSelected ) ;
  TImageButtons = array [ TStateButtons ] of TBitmap ;
  TModulesButtons = array of TImageButtons ;

    TSizeGrip = class(TWinControl)
    protected
      procedure CreateParams(var Params: TCreateParams); override;
      procedure CreateWnd; override;
    public
      constructor Create(aOwner: TComponent); override;
    end;

  TModulesDashboard = class(TTcForm)
    FDesktop: TJvPageControl;
    TitlePanel: TJvPanel;
    _imgCloseButton: TImage;
    _ImgMinimizeApp: TImage;
    _ImgRestoreApp: TImage;
    dtsProfiles: TDataSource;
    dtsDomains: TDataSource;
    dtsUsers: TDataSource;
    ppmDatabase: TPopupMenu;
    Configurarbanco1: TMenuItem;
    MainFormAppIcons: TImageList;
    LogoFazendaImage: TImage;
    JvSaveDialog1: TJvSaveDialog;
    ModulesSelector: TFireMonkeyContainer;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    Image1: TImage;
    Shape2: TShape;
    ImgIcoDomain: TImage;
    LabelDomainName: TLabel;
    ImgModuleSelector: TImage;
    MainSysIcons: TImageList;
    LabelInstrucoes: TLabel;
    PopupMenu1: TPopupMenu;
    ManualZootcnico1: TMenuItem;
    ManualFinanceiro1: TMenuItem;
    BackgroundImage: TImage;
    Panel1: TPanel;
    Image2: TImage;
    BottomPanel: TJvPanel;
    Label4: TLabel;
    Image3: TImage;
    Image4: TImage;
    VersaoLabel: TLabel;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    procedure FormCreate(Sender: TObject);
    procedure TitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TitleDblClick(Sender: TObject);
    procedure ImgModuleSelectorClick(Sender: TObject);
    procedure BackgroundImageClick(Sender: TObject);

    procedure _imgCloseButtonClick(Sender: TObject);
    procedure _imgCloseButtonMouseEnter(Sender: TObject);
    procedure _imgCloseButtonMouseLeave(Sender: TObject);

    procedure _ImgMinimizeAppClick(Sender: TObject);
    procedure _ImgMinimizeAppMouseEnter(Sender: TObject);
    procedure _ImgMinimizeAppMouseLeave(Sender: TObject);

    procedure _ImgRestoreAppClick(Sender: TObject);
    procedure _ImgRestoreAppMouseEnter(Sender: TObject);
    procedure _ImgRestoreAppMouseLeave(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _pnlVersionDblClick(Sender: TObject);
    procedure ModulesSelectorDestroyFMXForm(var Form: TCommonCustomForm;
      var Action: TCloseHostedFMXFormAction);
    procedure InstrucoesClick(Sender: TObject);
    procedure ManualZootcnico1Click(Sender: TObject);
    procedure ManualFinanceiro1Click(Sender: TObject);
    procedure ModulesSelectorPaint(Sender: TObject);
    procedure TitlePanelPaint(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BottomPanelPaint(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure BottomPanelResize(Sender: TObject);
    procedure VersaoLabelDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure TcFormResize(Sender: TObject);
    procedure TcFormActivate(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure Image4MouseLeave(Sender: TObject);
    procedure VersaoLabelMouseEnter(Sender: TObject);
    procedure VersaoLabelMouseLeave(Sender: TObject);
    procedure LabelInstrucoesMouseEnter(Sender: TObject);
    procedure LabelInstrucoesMouseLeave(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override ;
  private
    { Private declarations }
    FSizeGrip : TSizeGrip ;
    FPopupMenuManuais : TPopupMenuManuais ;
    FClinicaTalkForm : TClinicaTalk ;
    FStrechImage : TBitmap ;
    FTitleImage : TBitmap ;
    FModuleSelectorImage : TBitmap ;
    FBottomImage : TBitmap ;
    FFormLogin : TForm ;
    FActivateFormLogin  : Boolean;
    FModuleCount : integer ;
    originalBounds : TRect ;
    ArrImgMod : array of TImage ;
    FModulesButtons : TModulesButtons ;
    FEnabled: boolean;
    FFMXForm : FMX.Forms.TForm ;
    FDashMenu : TDashMenu ;
    FFormSplash : TForm ;
    FCloseByUpdate: Boolean;
    FProfileConnected: Boolean;
    FStatusCheckVersion: String;
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
    function LoadPackageMainPackage ( APackageName : string) : cardinal ;
    procedure ModuleActivate(Sender: TObject);
    procedure Maximize ;
    procedure Restore ;
    procedure MaximizeRestore ;
    procedure AssignLogo (  Sender : TCLAg5NSMsg ) ;
    procedure ExecModule(Sender: TCLAg5NSMsg);
    procedure SavePlanner ;
    procedure ShowDesktop ;
    procedure ShowDashboard ;
    procedure LoggedUserChanged(Sender: TTcNSMsg );
    procedure CutImage ;
    procedure Repaint ; override ;
    procedure ActiveFormLogin;
    procedure CheckVersion {(AMsg: TTcNSMsg)};
    procedure SetProfileConnected( AMsg: TTcNSMsg );
  public
    { Public declarations }
    procedure ShowTalk ;
    procedure HideTalk ;
    procedure SetXForm  ;
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

{$R *.dfm}

uses ShellAPI,
     ThreadSuppl,
     Tc.DBRTL.AbstractDB,
     UDomainValidateForm,
     UUpdateAppForm ;


const
   _STATUS_VERSION_ONCREATE       = '';
   _STATUS_VERSION_NAO_VERIFICADO = 'N';
   _STATUS_VERSION_VERIFICADO     = 'S';


procedure TSizeGrip.CreateParams(var Params: TCreateParams);
  begin
    inherited;
    CreateSubClass(Params, 'SCROLLBAR');
    Params.Style := Params.Style or WS_CLIPSIBLINGS or SBS_SIZEGRIP;
  end;

  procedure TSizeGrip.CreateWnd;
  begin
    inherited;
    Left := Parent.ClientWidth - Width - 1;
    Top  := Parent.ClientHeight - Height - 1;
    //SendToBack;
  end;

{ TSizeGrip }

  constructor TSizeGrip.Create(aOwner: TComponent);
  begin
    inherited;

    ControlStyle := [{csOpaque, }csFixedWidth, csFixedHeight];

    Anchors := [akRight, akBottom];
    Cursor  := crSizeNWSE;
    Height  := 11;
    Width   := 11;


  end;


procedure SaveRes(const AResourceName, AFileName : string );
var
  ResStream: TResourceStream;
begin
  ResStream := TResourceStream.Create(HInstance, AResourceName, RT_RCDATA);
  try
    ResStream.Position := 0;
    ResStream.SaveToFile(AFileName);
  finally
    ResStream.Free;
  end;
end;

procedure OpenApp(const aPath: string ; AParams : string );
var
  LParams : string ;
  Rec: TShellExecuteInfo;
  Dir: String;
  fAppHandle: Hwnd;
  function GetAppHandle(aProcessID: DWORD): Hwnd;
  type
    PAppProcInfo = ^AppProcInfo;

    AppProcInfo = record
      ProcessID: DWORD;
      Hwnd: Hwnd;
    end;
  var
    DaHandle: Hwnd;
    pi: AppProcInfo;
    function EnumProc(Hwnd: Hwnd; lParam: lParam): BOOL; stdcall;
    var
      dwProcessID: DWORD;
    begin
      GetWindowThreadProcessId(Hwnd, @dwProcessID);
      if dwProcessID = PAppProcInfo(lParam)^.ProcessID then
      begin
        PAppProcInfo(lParam)^.Hwnd := Hwnd;
        Result := False;
      end
      else
        Result := True;
    end;

  begin
    pi.ProcessID := aProcessID;
    pi.Hwnd := 0;
    EnumWindows(@EnumProc, lParam(@pi));
    Result := pi.Hwnd;
  end;

begin
 //ExtractFilePath( ParamStr(0)
  LParams := '' ;
  Dir := ExtractFilePath(aPath);
  ZeroMemory(@Rec, SizeOf(Rec));
  Rec.cbSize := SizeOf(Rec);
  Rec.fMask := SEE_MASK_NOCLOSEPROCESS;
  Rec.lpVerb := 'open';
  Rec.lpFile := PChar(aPath);
  Rec.lpParameters := PChar ( LParams );
  Rec.lpDirectory := PChar(Dir);
  Rec.nShow := SW_HIDE;
  if ShellExecuteEx(@Rec) then
  begin
(*
    WaitForInputIdle(Rec.hProcess, 5000);
    fAppHandle := GetAppHandle(GetProcessID(Rec.hProcess));
    CloseHandle(Rec.hProcess);
    if fAppHandle <> 0 then
    begin
      WinAPI.Windows.SetParent(fAppHandle, Handle);
      ShowWindow(fAppHandle, SW_SHOW);
    end;
*)
  end;
end;


procedure TModulesDashboard.SavePlanner ;
var
  LFileName : string ;
begin
  LFileName := TPath.GetDocumentsPath +  '\Simulador MDA v9.4.xlsm' ;
  if fileExists ( LFileName )  then
     begin
       OpenApp ( LFileName, '' ) ;
       exit ;
     end;

  JvSaveDialog1.InitialDir := ExtractFilePath ( LFileName  ) ;
  JvSaveDialog1.FileName   := ExtractFileName ( LFileName  ) ;
  if JvSaveDialog1.Execute then
    begin
     SaveRes( 'XLS_PLANNER', JvSaveDialog1.FileName )  ;
     if FileExists ( JvSaveDialog1.FileName ) then
        OpenApp ( JvSaveDialog1.FileName, '' ) ;
    end;
end;



procedure TModulesDashboard.SetProfileConnected( AMsg: TTcNSMsg );
begin
  if  ( TCLAg5NSMsgDBSession ( AMsg ).EventType <> ExitAfterConnect ) or
      ( TCLAg5NSMsgDBSession ( AMsg ).Sender.ClassType <> TDBSession ) then
     exit ;

  FProfileConnected := True;
  if ( FStatusCheckVersion = _STATUS_VERSION_NAO_VERIFICADO ) then
    CheckVersion;
end;

procedure TModulesDashboard.SetXForm ;
begin
 ModulesSelector.Anchors := [] ;
  ModulesSelector.Height := 1 ;
  ModulesSelector.Width := 1 ;
  ModulesSelector.Visible := True ;
  ModulesSelector.Top := TitlePanel.Height ;
  ModulesSelector.Height := ClientHeight  - TitlePanel.Height  - BottomPanel.Height ; //FFMXForm.Height ; //;ClientHeight - TitlePanel.Height ;
  ModulesSelector.Width  := ClientWidth  ;
// ModulesSelector.Anchors := [] ;
// ModulesSelector.Anchors := [akLeft,akTop,akRight,akBottom] ;
 ModulesSelector.FireMonkeyForm := FFMXForm ;
// FFMXForm.Transparency := True ;
 Application.ProcessMessages ;

 TThread.CreateAnonymousThread(
   procedure
   begin
      Sleep ( 100 ) ;
      FFormSplash.hide ;
//      ModulesSelector.BringToFront ;
   end
 ).Start ;

end;

procedure TModulesDashboard.ShowDashboard;
begin
  BottomPanel.BringToFront ;
  ModulesSelector.Visible := True ; // Virtual UI
  ModulesSelector.BringToFront ;
  ImgModuleSelector.Visible := False ;
  ShowTalk ;
end;

procedure TModulesDashboard.ShowDesktop;
begin
  FDesktop.BringToFront ;
  ModulesSelector.Visible := False ;  // Virtual UI
  ImgModuleSelector.Visible := True ;
  HideTalk ;
  if    ( FDesktop.ActivePage.ControlCount > 0  )
    and ( FDesktop.ActivePage.Controls[ 0 ] is TForm )
    and Assigned ( TForm( FDesktop.ActivePage.Controls[ 0 ] ).OnActivate ) then
    begin
       TForm( FDesktop.ActivePage.Controls[ 0 ] ).OnActivate ( self ) ;
    end;

end;


procedure TModulesDashboard.ShowTalk;
begin
  TCLAg5NSMsgShowTalk.CreateAndDispatch ( nil ) ;
end;

procedure TModulesDashboard.ModulesSelectorDestroyFMXForm(
 var Form: TCommonCustomForm; var Action: TCloseHostedFMXFormAction);
begin
 Action := fcaFree ;
end;

procedure TModulesDashboard.ModulesSelectorPaint(Sender: TObject);
begin
      CutImage ;
      ModulesSelector.Canvas.Draw(0,0,FModuleSelectorImage);
(*
      ModulesSelector.Canvas.Brush.Style := bsDiagCross;
      ModulesSelector.Canvas.Brush.Color := clSkyBlue;
//      SetBkColor(FCanvas.Handle, ColorToRGB(Parent.Brush.Color));
      ModulesSelector.Canvas.FillRect(ModulesSelector.ClientRect);
      ModulesSelector.Canvas.Brush.Style := bsClear;
*)

(*
      ModulesSelector.Canvas.Brush.Style := bsSolid;
      ModulesSelector.Canvas.Brush.Color := clWhite ;
      ModulesSelector.Canvas.Font.Size := 20 ;
      ModulesSelector.Canvas.TextOut( 10,  0, ModulesSelector.ClientRect.Height.tOSTRING );
      ModulesSelector.Canvas.TextOut( 200, 0,  FFMXForm.Left.ToString
                                       + ' ' + FFMXForm.Top.ToString
                                       + ' ' + FFMXForm.Height.ToString
                                       + ' ' + FFMXForm.Width.ToString );
//      TDashBoard( FFMXForm ).BackgroundImage.Bitmap := FModuleSelectorImage ;
*)
end;

procedure TModulesDashboard.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  I: Integer;
  F : TCustomForm ;
  hProcess : THandle ;
begin
  if Assigned( FDesktop ) then
   begin

     FDesktop.Visible :=True ;
     FDesktop.BringToFront ;

     for I := FDesktop.PageCount - 1 downto 0 do
       if FDesktop.Pages[ i ].ControlCount > 0 then
        begin
          FDesktop.ActivePage := FDesktop.Pages[ i ] ;
          if FDesktop.Pages[ i ].Controls[ 0 ] is TCustomForm then
           begin
             F := TCustomForm( FDesktop.Pages[ i ].Controls[ 0 ] ) ;
             F.Hide ;
             try
               F.Parent := nil ; //Ocorre erro ao setar Parent = nil para TWBPortal
             except
             end;
             //       F.Show ;
             F.Close ;
           end;
       //Application.ProcessMessages ;
        end;
   end;

  //Application.ProcessMessages ;

//  ShowMessage ( 'form count: ' + Screen.FormCount.ToString ) ;
//  PackageManager.UnLoadPackage( 'CL.Ag5.Utils.WB.bpl' ) ;
//  UnLoadPackage ( '' ) ;

//  hProcess := OpenProcess(PROCESS_TERMINATE, False, GetCurrentProcessID ) ;
//  TerminateProcess(hProcess, 9);
//  CloseHandle(hProcess);

//  hProcess := GetCurrentProcess ;
//  TerminateProcess(hProcess, 9);
//  CloseHandle(hProcess);

 TerminateProcess(GetCurrentProcess, 9);


end;

procedure TModulesDashboard.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
 hProcess  : THandle ;
begin

  if FCloseByUpdate then
   begin
     CanClose := True;
   end
  else
     CanClose := messageDlg ( 'Deseja encerrar o sistema ?', mtConfirmation, [ mbYes, mbNo ], 0 ) =  mrYes ;

  if not CanClose then
    exit ;
(*
  if not UnLoadDesktop then
    begin
      CanClose := False ;
      exit ;
    end;

  //UnLoadPackage ( 'CL.Ag5.Admin.Zootecnico.bpl' )  ;
  UnLoadPackage ( 'CL.Ag5.Zootecnico.bpl' ) ;
  UnLoadPackage ( 'CL.Ag5.Financeiro.bpl' )  ;
  UnLoadPackage ( 'CL.Ag5.Inicial.ImportacaoAg3.bpl' ) ;
  UnLoadPackage ( 'CL.Ag5.Inicial.bpl' ) ;

  hProcess := OpenProcess(PROCESS_TERMINATE, False, GetCurrentProcessID ) ;
  TerminateProcess(hProcess, 9);
  CloseHandle(hProcess);
*)
end;

procedure TModulesDashboard.FormCreate(Sender: TObject);
type
 TNSMSgArray = array of TCLAg5NSMsgClass ;
var
  I : integer ;
  LNSMsgs : TNSMSgArray ;
begin

  LNSMsgs := TNSMSgArray.Create (
    TCLAg5NSMsgModuloZootecnico,          TCLAg5NSMsgModuloFinanceiro,
    TCLAg5NSMsgModuloGerencialZootecnico, TCLAg5NSMsgModuloGerencialFinanceiro,
    TCLAg5NSMsgModuloRPPA,
    TCLAg5NSMsgModuloPlanner,             TCLAg5NSMsgModuloICG,
    TCLAg5NSMsgModuloPortal,              TCLAg5NSMsgModuloLoja,
    TCLAg5NSMsgModuloConfig,
    TCLAg5NSMsgModuloHome
 ) ;

  for I := Low( LNSMsgs ) to High( LNSMsgs ) do
    begin
      LNSMsgs[ I ].Subscribe( ExecModule );
      with TTabSheet.Create( self ) do
        begin
         TabVisible  := False ;
         PageControl := FDesktop ;
        end;
    end;

  TCLAg5NSMsgSysDomainImageChanged.Subscribe ( AssignLogo );
  TTcNSMsgLoggedUserChanged.Subscribe ( LoggedUserChanged );

end;

procedure TModulesDashboard.FormPaint(Sender: TObject);
begin
  Canvas.Draw(0,0,BackgroundImage.Picture.Graphic);
end;

procedure TModulesDashboard.FormShow(Sender: TObject);
var
  r: TRect;
  FileDownload: String;
begin

  OnShow := nil ;
  if Align <> alNone then
    begin
     Align := alNone ;
     Maximize ;
(*
       r := ClientRect;
        OffsetRect(r, 0, GetSystemMetrics(SM_CYCAPTION));
        OffsetRect(r, GetSystemMetrics(SM_CXFRAME), GetSystemMetrics(SM_CYFRAME));
        SetWindowRgn(Handle,
            CreateRectRgn(
                r.Left, r.Top,
                ClientWidth + r.Left, ClientHeight + r.Top), True);
*)
     SetXForm ;
     //ShowMessageFmt ( '%d', [ ord ( WindowState ) ] ) ;
     with BoundsRect do
       begin
         originalBounds.Left    := Trunc ( ( Right  * 0.05  ) ) ;
         originalBounds.Top     := Trunc ( ( Bottom * 0.05  ) ) ;
         originalBounds.Right   := Trunc ( ( Right  * 0.95  ) ) ;
         originalBounds.Bottom  := Trunc ( ( Bottom * 0.95  ) ) ;
       end ;
    end ;
  OnShow := FormShow ;


  //TCLAg5NSMsgDBSession.Subscribe( checkVersion ) ;
  checkVersion;


end;

procedure TModulesDashboard.HideTalk;
begin
  TCLAg5NSMsgHideTalk.CreateAndDispatch( nil )
end;

procedure TModulesDashboard.ModuleActivate(Sender: TObject);
var
  LModuleIsValid : boolean ;
begin
  inherited;

  LModuleIsValid := True ;

  if LoggedUser.DomainID = '' then
   begin
     ShowMessage ( 'faça o login antes de escolher um módulo' ) ;
     exit ;
   end;

  if not LModuleIsValid then
     ShowMessage ( 'opção não liberada pela "chave" de acesso' ) ;


  if FDesktop.ActivePageIndex = 8 then
    begin
      ModulesSelector.BringToFront ;
      ImgModuleSelector.Visible := False ;
      exit ;
    end;

  FDesktop.BringToFront ;
  ImgModuleSelector.Visible := True ;

//  ActivityIndicator1.Visible := true  ;
//  ActivityIndicator1.BringToFront ;
//  ActivityIndicator1.Animate := True ;

  Application.ProcessMessages ;

  if    ( FDesktop.ActivePage.ControlCount > 0  )
    and ( FDesktop.ActivePage.Controls[ 0 ] is TForm )
    and Assigned ( TForm( FDesktop.ActivePage.Controls[ 0 ] ).OnActivate ) then
    begin
       TForm( FDesktop.ActivePage.Controls[ 0 ] ).OnActivate ( self ) ;
    end;

//  ActivityIndicator1.Animate := False ;
//  ActivityIndicator1.SendToBack ;
//  ActivityIndicator1.Visible := False  ;

  Application.ProcessMessages ;

  (*
  if      FDesktop.ActivePage = tbsInicial   then FActiveDesktop := FDesktopInicial
  else if FDesktop.ActivePage = tbsFinanceiro then FActiveDesktop := FDesktopFin
  else if FDesktop.ActivePage = tbsMDA       then FActiveDesktop := FDesktopMDA
  else if FDesktop.ActivePage = tbsZoo       then FActiveDesktop := FDesktopZoo
  else if FDesktop.ActivePage = tbsEstoque   then FActiveDesktop := FDesktopEstoque ;
  *)


end;

procedure TModulesDashboard.ActiveFormLogin;
begin
  // Muda o FormStyle do formulário de login, pois o fsStayOnTop deixava o form à frente de todos as aplicações
  if Assigned( FFormLogin ) and ( not FActivateFormLogin ) then
   begin
     FFormLogin.FormStyle := fsNormal;
     TCLAg5NSMsgBringToFront.CreateAndDispatch( Self );
   end;

end;

procedure TModulesDashboard.AssignLogo(Sender: TCLAg5NSMsg);
begin
  //_lblTitle.Caption := 'Agenda 5.0 - ' + LoggedUser.DomainName + ' - ' + LoggedUser.Login ;
 // BackgroundImage.Visible := False ;
  try
//    LogoFazendaImage.Picture.Assign ( LoggedUser.DomainImage )  ;
//    LogoFazendaImage.Repaint ;
  except
  End;
end;

procedure TModulesDashboard.ExecModule(Sender: TCLAg5NSMsg);
var
 LIndex : integer ;
 LNeedLoadPackages : boolean ;
 LModuleIsValid : boolean ;
 LClassName : string ;
 DesktopClass : TComponentClass ;
begin
  ActivateClassGroup( TControl ) ;

  LIndex := TCLAg5NSMsgModulo(Sender).ModuleIndex ;
  LNeedLoadPackages := FDesktop.Pages[ LIndex ].ControlCount = 0 ;

  if LNeedLoadPackages then
  begin
    if sender.ClassType  =  TCLAg5NSMsgModuloZootecnico  then
      begin
        LModuleIsValid := True ;//GAcesso.Modulos[ Ord ( maZootecnico ) ].Acesso ;
        if LModuleIsValid then
          LoadPackageMainPackage ( 'CL.Ag5.Zootecnico.bpl' )
      end
    else if sender.ClassType  =  TCLAg5NSMsgModuloFinanceiro then
      begin
       LModuleIsValid := True ;//GAcesso.Modulos[ Ord( maFinanceiro ) ].Acesso ;
       if LModuleIsValid then
         begin
           LoadPackageMainPackage ( 'CL.Ag5.Financeiro.bpl' )   ;
           LoadPackageMainPackage ( 'CL.Ag5.Estoque.bpl'  ) ;
         end;
      end
    else if sender.ClassType  =  TCLAg5NSMsgModuloGerencialZootecnico  then
      begin
         LoadPackageMainPackage ( 'CL.Ag5.WB.GerencialZootecnico.bpl' )   ;
      end
    else if sender.ClassType  =  TCLAg5NSMsgModuloGerencialFinanceiro  then
      begin
         LoadPackageMainPackage ( 'CL.Ag5.WB.GerencialFinanceiro.bpl' )   ;
      end
    else if sender.ClassType  =  TCLAg5NSMsgModuloPortal  then
      begin
         LoadPackageMainPackage ( 'CL.Ag5.WB.Portal.bpl' )   ;
      end
    else if sender.ClassType  =  TCLAg5NSMsgModuloPlanner  then
      begin
      end
    else if sender.ClassType  =  TCLAg5NSMsgModuloRPPA  then
      begin
        LoadPackageMainPackage ( 'CL.Ag5.WB.RPPA.bpl' )   ;
      end
    else if sender.ClassType  =  TCLAg5NSMsgModuloICG  then
      begin
        LoadPackageMainPackage ( 'CL.Ag5.WB.ICG.bpl' )   ;
      end
    else if sender.ClassType  =  TCLAg5NSMsgModuloLoja  then
      begin
         LoadPackageMainPackage ( 'CL.Ag5.WB.Loja.bpl'  )   ;
      end
    else if sender.ClassType  =  TCLAg5NSMsgModuloConfig  then
      begin
//        LoadPackageMainPackage ( 'CL.Ag5.DB.Zootecnico.bpl' ) ;
//        LoadPackageMainPackage ( 'CL.Ag5.DB.Financeiro.bpl' ) ;

        LoadPackageMainPackage( 'CL.Ag5.Entidades.bpl' )   ;
        LoadPackageMainPackage( 'CL.Ag5.Zootecnico.Configuracoes.bpl' )   ;
        LoadPackageMainPackage( 'CL.Ag5.Financeiro.Cadastros.bpl' )   ;
        LoadPackageMainPackage( 'CL.Ag5.Inicial.bpl' )   ;
        LoadPackageMainPackage( 'CL.Ag5.Inicial.ImportacaoAg3.bpl' ) ;
        LoadPackageMainPackage( 'CL.Ag5.Inicial.Zootecnico.ImportSISBOV.bpl' ) ;
        LoadPackageMainPackage( 'CL.Ag5.WB.ManualZootecnico.bpl' )   ;
        LoadPackageMainPackage( 'CL.Ag5.WB.ManualFinanceiro.bpl' )   ;
      end
    else if sender.ClassType  =  TCLAg5NSMsgModuloHome  then
      begin

      end;
  end;

  if sender.ClassType  =  TCLAg5NSMsgModuloZootecnico  then
      LClassName :=  'TZooDesktop'
  else if sender.ClassType  =  TCLAg5NSMsgModuloFinanceiro then
     LClassName :=  'TFinDesktop'
  else if sender.ClassType  =  TCLAg5NSMsgModuloGerencialZootecnico  then
     LClassName :=  'TWBGerencialZootecnico'  //*****************
  else if sender.ClassType  =  TCLAg5NSMsgModuloGerencialFinanceiro  then
     LClassName :=  'TWBGerencialFinanceiro'  //******************
  else if sender.ClassType  =  TCLAg5NSMsgModuloPortal  then
     LClassName :=  'TWBPortal'
  else if sender.ClassType  =  TCLAg5NSMsgModuloPlanner  then
    LClassName :=  'TPLANNER'
   else if sender.ClassType  =  TCLAg5NSMsgModuloRPPA  then
     LClassName :=  'TWBRPPA'   //****************
   else if sender.ClassType  =  TCLAg5NSMsgModuloICG  then
     LClassName :=  'TWBICG'
  else if sender.ClassType  =  TCLAg5NSMsgModuloLoja  then
     LClassName :=  'TWBLoja'
  else if sender.ClassType  =  TCLAg5NSMsgModuloConfig  then
     LClassName :=  'TInicialDesktop'
  else if sender.ClassType  =  TCLAg5NSMsgModuloHome  then
     LClassName :=  'THOME' ;

  if LClassName = '' then
     exit ;

  if LClassName = 'TPLANNER' then
   begin
     SavePlanner ;
     exit ;
   end;

  if LClassName = 'THOME' then
   begin
     self.ShowDashboard ;
     exit ;
   end;

  ActivateClassGroup( TControl ) ;
  DesktopClass := TComponentClass ( GetClass ( LClassName ) ) ;

  if not Assigned ( DesktopClass ) then
     begin
       ShowMessage('não configurado') ;
       exit ;
     end;

  FDesktop.ActivePageIndex := LIndex ;

  if LNeedLoadPackages then
    with TForm ( DesktopClass.Create ( self ) ) do
      begin
        Parent := FDesktop.ActivePage ;
        Align := alClient ;
        BorderStyle := bsNone ;
        Visible := True ;
      end ;

   ShowDesktop ;

(*

  TCLAg5NSMsgModuloZootecnico.Subscribe( ExecModule );
  TCLAg5NSMsgModuloFinanceiro.Subscribe( ExecModule );
  TCLAg5NSMsgModuloPortal.Subscribe( ExecModule );
  TCLAg5NSMsgModuloLoja.Subscribe( ExecModule );
  TCLAg5NSMsgModuloICG.Subscribe( ExecModule );
*)
end;

procedure TModulesDashboard.CheckVersion{(AMsg: TTcNSMsg)};
var
  FileDownload : String;
begin
  { if ( TCLAg5NSMsgDBSession ( AMsg ).EventType <> ExitAfterConnect ) or
      ( TCLAg5NSMsgDBSession ( AMsg ).Sender.ClassType <> TDBSession ) then
     exit ;}

  {Utilizado para o sistema saber se deve ou não continuar executando essa procedure,
   pois isso depende de ter o profile setado pelo form de login }
  FStatusCheckVersion := _STATUS_VERSION_NAO_VERIFICADO;
  if ( not FProfileConnected ) or ( FStatusCheckVersion = _STATUS_VERSION_VERIFICADO ) then
    exit;

   if TUpdateAppForm.ShowMessageUpdate(FileDownload) then
   begin
     FCloseByUpdate := True;
     if FileDownload <> '' then
       ShellExecute(Self.Handle,'open',pchar(FileDownload),nil,nil,sw_show);
     Close;
   end;
   FStatusCheckVersion := _STATUS_VERSION_VERIFICADO;
end;

constructor TModulesDashboard.Create(AOwner: TComponent);
var
  C : TClass ;
begin
  inherited;

  FCloseByUpdate := False;
  FDesktop.Top := TitlePanel.Height ;
  FDesktop.Left := 0 ;
  FDesktop.Width := ClientWidth ;
  FDesktop.Height := ClientHeight - TitlePanel.Height ;

  TFireMonkeyContainer.FMXAppRun;

  FFormSplash := TForm.Create( nil ) ;
  with TImage.Create( FFormSplash ) do
    begin
       Parent := FFormSplash ;
       Align := alClient ;
       Picture.Assign( self.BackgroundImage.Picture );
    end;

  with FFormSplash  do
  begin
    TransparentColorValue := Color ;
    TransparentColor      := True ;
    BorderStyle           := bsNone ;
    Align                 := alClient ;
    FormStyle             := fsStayOnTop ;
  //  show ;
  end;
  Application.ProcessMessages ;


  FDashMenu := TDashMenu.Create( self ) ;
  FFMXForm := TDashboard.Create( nil )  ;

  ActivateClassGroup( TControl ) ;

  C := GetClass ( 'TfrmDash_Login' ) ;
  if not Assigned ( C ) then
     showMessage( 'login nao encontrado' ) ;

//      SetXForm ; //) ;

  FFormLogin := TFormClass ( C ).Create( nil ) ;
  //FFormLogin.Parent := self ;
  FStatusCheckVersion := _STATUS_VERSION_ONCREATE;
  FProfileConnected := False;
  TCLAg5NSMsgDBSession.Subscribe( SetProfileConnected ) ;
  FFormLogin.Show ;

 // Repaint ;
 // FFormLogin.Repaint ;

  FSizeGrip := TSizeGrip.Create(self) ;
  FSizeGrip.Parent := Self ;
  FSizeGrip.BringToFront ;
  FSizeGrip.Visible := False ;

  try
    if FileExists ( 'C:\Users\Caique\Documents\CDLStyle3.vsf' )  then
      TStyleManager.SetStyle( TStyleManager.LoadFromFile( 'C:\Users\Caique\Documents\CDLStyle3.vsf' ) )  ;
    if FileExists ( ExtractFilePath(ParamStr(0)) + 'CDLStyle3.vsf' )  then
      TStyleManager.SetStyle( TStyleManager.LoadFromFile( ExtractFilePath(ParamStr(0)) + 'CDLStyle3.vsf')  ) ;
  except
  end;

end;



procedure TModulesDashboard.CreateParams(var Params: TCreateParams);
begin
   BorderStyle := bsNone;
   inherited;
//   Params.ExStyle := Params.ExStyle or WS_EX_STATICEDGE;
//   Params.Style := Params.Style or WS_SIZEBOX;
end;

procedure TModulesDashboard.CutImage;
var
  LDestRect : TRect ;
  LSourceRect : TRect ;
  y : integer ;

begin

   if Assigned ( FStrechImage )
   and ( FStrechImage.Width = ClientWidth )
   and ( FStrechImage.Height = ClientHeight ) then
      exit ;

   if Assigned ( FStrechImage ) then
     begin
      FStrechImage.Free ;
      FTitleImage.Free ;
      FModuleSelectorImage.Free ;
      FBottomImage.Free ;
     end;

  FStrechImage := TBitmap.Create ;
  FStrechImage.Width  := ClientWidth + 1 ;
  FStrechImage.Height := ClientHeight  + 1 ;
  FStrechImage.Canvas.StretchDraw( Rect( 0,0, FStrechImage.Width -1, FStrechImage.Height -1 ), BackgroundImage.Picture.Graphic );

//  for y := 0 to 500 do
//    FStrechImage.Canvas.TextOut ( 0, y * FStrechImage.Canvas.TextHeight('X'), y.ToString ) ;


  FTitleImage        := TBitmap.Create ;
  FTitleImage.Width  := TitlePanel.Width ;
  FTitleImage.Height := TitlePanel.Height ;
  FTitleImage.Canvas.Draw( 0,0, FStrechImage );

  FModuleSelectorImage        := TBitmap.Create ;
  FModuleSelectorImage.Width  := ModulesSelector.Width ;
  FModuleSelectorImage.Height := ModulesSelector.Height ;

  FModuleSelectorImage.Canvas.CopyRect(
    Rect(0,0, FModuleSelectorImage.Width, FModuleSelectorImage.Height ),
    FStrechImage.Canvas,
    Rect( ModulesSelector.Left, ModulesSelector.Top, ModulesSelector.Width, ModulesSelector.Height )
   );

   if Assigned ( FModuleSelectorImageStream ) then
     FreeAndNil ( FModuleSelectorImageStream ) ;

  FModuleSelectorImageStream := TMemoryStream.Create ;
  FModuleSelectorImage.SaveToStream ( FModuleSelectorImageStream ) ;
  FModuleSelectorImageStream.Position := 0 ;

  FBottomImage        := TBitmap.Create ;
  FBottomImage.Width  := BottomPanel.Width ;
  FBottomImage.Height := BottomPanel.Height ;

  LSourceRect := Rect( BottomPanel.Left, ClientHeight - BottomPanel.Height - 60, BottomPanel.Width, ClientHeight -60 ) ;
  LDestRect   := Rect( 0, 0, BottomPanel.Width, BottomPanel.Height ) ;


  FBottomImage.Canvas.CopyRect(
    LDestRect,
    FStrechImage.Canvas,
    LSourceRect
     ) ;

  TCLAg5NSMsgBackgroundChanged.CreateAndDispatch( FModuleSelectorImageStream ) ;

// FBottomImage.Canvas.FrameRect( LDestRect );

//   LdestRect.Height - LdestRect.Top ;

//     showMessage ( FStrechImage.Height.ToString + ' ' + Integer( FTitleImage.Height+
//             FModuleSelectorImage.Height ).ToString ) ;

    //    Rect( 0, FStrechImage.Height - BottomPanel.Height, BottomPanel.Width, BottomPanel.Height )
//    Rect( BottomPanel.Left, BottomPanel.Top, BottomPanel.Width, BottomPanel.Height )


end;

procedure TModulesDashboard.Image4Click(Sender: TObject);
var
  p : TPoint  ;
begin
  if not Assigned ( FClinicaTalkForm ) then
    begin
      FClinicaTalkForm := TClinicaTalk.Create( self )  ;
    end ;

  if FActivateFormLogin then
    begin
     FActivateFormLogin := False;
     ActiveFormLogin;
    end;
//    Image1.
//  Screen.MousePos
//  P := Image1.ClientToScreen( Point ( ImgClinicaTalkUpArrow.Position.X - FClinicaTalkForm.Width div 2, ImgClinicaTalkUpArrow.Position.Y + FClinicaTalkForm.Height - 20 ) ) ;
//  FClinicaTalkForm.top  := Trunc  ( Mouse.CursorPos.Y - FClinicaTalkForm.Height + 20 ) ;
  FClinicaTalkForm.top  := Trunc  ( Mouse.CursorPos.Y - FClinicaTalkForm.Height ) ;
  FClinicaTalkForm.Left := Left + ( Width div 2 ) - ( FClinicaTalkForm.Width div 2 )  ; //Trunc  ( Mouse.CursorPos.X - ( FClinicaTalkForm.Width div 2 ) ) ;
  FClinicaTalkForm.Show ;
  FClinicaTalkForm.top  := Trunc  ( Mouse.CursorPos.Y - FClinicaTalkForm.Height ) ;
end;

procedure TModulesDashboard.Image4MouseEnter(Sender: TObject);
begin
  FActivateFormLogin := True;
  ActiveFormLogin;
end;

procedure TModulesDashboard.Image4MouseLeave(Sender: TObject);
begin
  FActivateFormLogin := False;
end;

procedure TModulesDashboard.ImgModuleSelectorClick(Sender: TObject);
var
  P : TPoint ;
begin
//  if FDashMenu.Visible then
//     FDashMenu.Hide
//  else
    begin
      P := TitlePanel.ClientToScreen( Point ( ImgModuleSelector.Left, ImgModuleSelector.Top + ImgModuleSelector.Height + 1 ) ) ;
      FDashMenu.Top := P.Y ;
      FDashMenu.Left := P.X ;
      FDashMenu.Show ;
    end;
(*
  FDesktop.Visible := False ;
  ModulesSelector.BringToFront ;
  ImgModuleSelector.Visible := False ;
*)
end;

procedure TModulesDashboard.InstrucoesClick(Sender: TObject);
var
  p : TPoint  ;
begin
  P := TitlePanel.ClientToScreen( Point ( Image1.Left + Image1.Width div 2, Image1.Top + Image1.Height + 20 ) ) ;
//  PopupMenu1.Popup( P.X, P.Y );
  if not Assigned ( FPopupMenuManuais ) then
    begin
      FPopupMenuManuais := TPopupMenuManuais.Create( self )  ;
    end ;

  if FActivateFormLogin then
    begin
      FActivateFormLogin := False;
      ActiveFormLogin;
    end;
  FPopupMenuManuais.top  :=   ( {Screen.MousePos}  P.Y {+ FPopupMenuManuais.Height + 20} ) ;
  FPopupMenuManuais.Left :=   ( {Screen.MousePos.} P.X - ( FPopupMenuManuais.Width div 2 ) ) ;
  FPopupMenuManuais.Show ;
end;




procedure TModulesDashboard.BottomPanelPaint(Sender: TObject);
begin
 CutImage;
 BottomPanel.Canvas.Draw(0,0,FBottomImage ) ; //, BackgroundImage.Picture.Graphic);
end;

procedure TModulesDashboard.BottomPanelResize(Sender: TObject);
begin
   BottomPanel.Repaint ;
end;

procedure TModulesDashboard.BackgroundImageClick(Sender: TObject);
var
  C : TClass  ;
  P : TPoint ;
begin
                                          (*
  C := GetClass ( 'TfrmDash_Login' ) ;
  P := TitlePanel.ClientToScreen( Point ( BackgroundImage.Left + BackgroundImage.Width div 2, BackgroundImage.Top + BackgroundImage.Height ) ) ;

  with TFormClass ( C ).Create( nil ) do
    begin
     Top  := P.Y ;
     Left := P.X - Width div 2 ;
     show ;
    end;
                                            *)
end;

procedure TModulesDashboard.TcFormActivate(Sender: TObject);
begin
  ActiveFormLogin;
end;

procedure TModulesDashboard.TcFormResize(Sender: TObject);
begin
  ModulesSelector.Left   := 0 ;
///  ShowMessageFmt ( '1 %d %d %d %d', [ self.FFMXForm.Left, self.FFMXForm.Top, self.FFMXForm.Width, self.FFMXForm.Height ] )  ;


  ModulesSelector.Top    := TitlePanel.Height ;
  ModulesSelector.Height := ClientHeight  - TitlePanel.Height  - BottomPanel.Height ; //FFMXForm.Height ; //;ClientHeight - TitlePanel.Height ;
  ModulesSelector.Width  := ClientWidth  ;
  self.FFMXForm.Top      := 0 ;
  with ModulesSelector.ClientRect do
  self.FFMXForm.SetBounds( Left, Top, Right, Bottom );

////  ShowMessageFmt ( '2 %d %d %d %d', [ self.FFMXForm.Left, self.FFMXForm.Top, self.FFMXForm.Width, self.FFMXForm.Height ] )  ;


//  ModulesSelector.Height := ClientHeight  - TitlePanel.Height  - BottomPanel.Height ; //FFMXForm.Height ; //;ClientHeight - TitlePanel.Height ;
//  ModulesSelector.Width  := ClientWidth  ;
end;

procedure TModulesDashboard.TitleDblClick(Sender: TObject);
begin
  MaximizeRestore;
end;

procedure TModulesDashboard.TitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if WindowState = wsMaximized then
    exit ;
  ReleaseCapture;
  SendMessage( Application.MainForm.Handle, WM_SYSCOMMAND, 61458, 0);
end;

procedure TModulesDashboard.TitlePanelPaint(Sender: TObject);
begin
 CutImage;
 TitlePanel.Canvas.Draw(0,0,FTitleImage ) ; //, BackgroundImage.Picture.Graphic);
end;

procedure TModulesDashboard._imgCloseButtonClick(Sender: TObject);
begin
  FActivateFormLogin := False;
  ActiveFormLogin;
  PostMessage( Application.MainForm.Handle, WM_CLOSE, 0, 0 ) ;
end;

procedure TModulesDashboard._imgCloseButtonMouseEnter(Sender: TObject);
begin
  with TImage ( Sender ), Picture do
    begin
      FActivateFormLogin := True;
      ActiveFormLogin;
      MainSysIcons.GetBitmap( 3 + 4, Bitmap ) ;
      Assign ( Bitmap  ) ;
      Transparent := False ;
    end ;
end;

procedure TModulesDashboard._imgCloseButtonMouseLeave(Sender: TObject);
begin
  with TImage ( Sender ), Picture do
    begin
      if FActivateFormLogin then
       begin
         FActivateFormLogin := False;
         ActiveFormLogin;
       end;

      MainSysIcons.GetBitmap( 3, Bitmap ) ;
      Assign ( Bitmap  ) ;
      Transparent := True ;
    end ;
end;


procedure TModulesDashboard._ImgMinimizeAppClick(Sender: TObject);
begin
    FActivateFormLogin := False;
    Application.Minimize ;
    ActiveFormLogin;
end;

procedure TModulesDashboard._ImgMinimizeAppMouseEnter(Sender: TObject);
begin
  with TImage ( Sender ), Picture do
    begin
      FActivateFormLogin := True;
      ActiveFormLogin;
      MainSysIcons.GetBitmap( 0 + 4, Bitmap ) ;
      Assign ( Bitmap  ) ;
      Transparent := False ;
    end ;
end;

procedure TModulesDashboard._ImgMinimizeAppMouseLeave(Sender: TObject);
begin
  with TImage ( Sender ), Picture do
    begin
      FActivateFormLogin := False;
      ActiveFormLogin;
      MainSysIcons.GetBitmap( 0, Bitmap ) ;
      Assign ( Bitmap  ) ;
      Transparent := True ;
    end ;
end;


procedure TModulesDashboard._ImgRestoreAppClick(Sender: TObject);
begin
  FActivateFormLogin := False;
  MaximizeRestore;
  ActiveFormLogin;
end;

procedure TModulesDashboard._ImgRestoreAppMouseEnter(Sender: TObject);
begin
  with TImage ( Sender ), Picture do
    begin
      FActivateFormLogin := True;
      ActiveFormLogin;
      if WindowState = wsMaximized then
        MainSysIcons.GetBitmap( 1 + 4, Bitmap )
      else
        MainSysIcons.GetBitmap( 2 + 4, Bitmap ) ;
      Assign ( Bitmap  ) ;
      Transparent := False ;
    end ;
end;

procedure TModulesDashboard._ImgRestoreAppMouseLeave(Sender: TObject);
begin
  with TImage ( Sender ), Picture do
    begin
      FActivateFormLogin := False;
      ActiveFormLogin;
      if WindowState = wsMaximized then
        MainSysIcons.GetBitmap( 1, Bitmap )
      else
        MainSysIcons.GetBitmap( 2, Bitmap ) ;

      Assign ( Bitmap  ) ;
      Transparent := True ;
    end ;
end;

procedure TModulesDashboard._pnlVersionDblClick(Sender: TObject);
var
  LForm : TForm ;
begin
    if not ( (GetKeyState(VK_SHIFT) < 0)  and (GetKeyState(VK_CONTROL) < 0) ) then
      exit ;
    LForm := TForm ( TFormClass ( GetClass ( 'TfrmDBViewer' ) ).NewInstance )  ;
    LForm.Create( nil );
    LForm.Show ;
end;


procedure TModulesDashboard.VersaoLabelDblClick(Sender: TObject);
var
  LForm : TForm ;
begin
  if FActivateFormLogin then
     begin
       FActivateFormLogin := False;
       ActiveFormLogin;
     end;

  if LoggedUser.UserID = '' then
     exit ;

  ActivateClassGroup( TControl ) ;

  if not ( (GetKeyState(VK_SHIFT) < 0)  and (GetKeyState(VK_CONTROL) < 0) ) then
    exit ;
  LForm := TForm ( TFormClass ( GetClass ( 'TfrmDBViewer' ) ).NewInstance )  ;
  LForm.Create( nil );
  LForm.Show ;

end;

procedure TModulesDashboard.VersaoLabelMouseEnter(Sender: TObject);
begin
  FActivateFormLogin := True;
  ActiveFormLogin;
end;

procedure TModulesDashboard.VersaoLabelMouseLeave(Sender: TObject);
begin
  FActivateFormLogin := False;
end;

procedure TModulesDashboard.WMNCHitTest(var Msg: TWMNCHitTest);
var
 ScreenPt: TPoint;
 begin
   inherited;
   ScreenPt := ScreenToClient(Point(Msg.Xpos, Msg.Ypos));
   if (ScreenPt.x < 5) then
     Msg.Result := HTLEFT
     // top side
   else if (ScreenPt.y < 5) then
     Msg.Result := HTTOP
     // right side
   else if (ScreenPt.x >= Width - 5) then
     Msg.Result := HTRIGHT
     // bottom side
   else if (ScreenPt.y >= Height - 5) then
     Msg.Result := HTBOTTOM
     // top left corner
   else if (ScreenPt.x < 5) and (ScreenPt.y < 5) then
     Msg.Result := HTTOPLEFT
     // bottom left corner
   else if (ScreenPt.x < 5) and (ScreenPt.y >= Height - 5) then
     Msg.Result := HTBOTTOMLEFT
     // top right corner
   else if (ScreenPt.x >= Width - 5) and (ScreenPt.y < 5) then
     Msg.Result := HTTOPRIGHT
     // bottom right corner
   else if (ScreenPt.x >= Width - 5) and (ScreenPt.y >= Height - 5) then
     Msg.Result := HTBOTTOMRIGHT
end;


procedure TModulesDashboard.LabelInstrucoesMouseEnter(Sender: TObject);
begin
  FActivateFormLogin := True;
  ActiveFormLogin;
end;

procedure TModulesDashboard.LabelInstrucoesMouseLeave(Sender: TObject);
begin
  FActivateFormLogin := False;
end;

function TModulesDashboard.LoadPackageMainPackage ( APackageName : string  ) : cardinal ;
begin

  ActivateClassGroup( TControl ) ;

  try
    Result := PackageManager.LoadPackage( APackageName ) ;
  except On E : Exception do
    begin
      Result := 0 ;
//      ErrPkg := ErrPkg + APackageName + ' ' + E.Message + #13#10 ;
//      ShowMessage ( ErrPkg ) ;
    end;
  end;

end ;


procedure TModulesDashboard.LoggedUserChanged(Sender: TTcNSMsg );
var
  LStrVersion : string ;
begin
   LabelDomainName.Caption :=  LoggedUser.DomainName ;
   ImgIcoDomain.Visible := True ;
   LabelDomainName.Visible := True ;
   LabelInstrucoes.Visible := False ;


  if not Assigned ( TTcAbstractDB.GetByAlias('ENTIDADES') ) then
   begin
     LoadPackageMainPackage ( 'CL.Ag5.DB.Entidades.bpl' ) ;
     ActivateClassGroup( TControl ) ;
     TComponentClass ( GetClass ( 'TDBEntidades' ) ).Create( self ) ;
     ThreadSuppl.TSyncThread.Create ( TTcAbstractDB.GetByAlias( 'ENTIDADES' ).Connection.Open ) ;
   end;

   TCLAg5NSMsgDashBlurOff.CreateAndDispatch( Self ) ;

   VersaoLabel.Visible := True ;

   { TODO : Remover versão fixa 94 }

    LStrVersion := 'Versão : '
    + Format ( '%d.%.3d.%.2d', [ LoggedUser.AppVersion.Version,
                   LoggedUser.AppVersion.Release,
                   LoggedUser.AppVersion.Revision ] ) ;

    LStrVersion := 'Versão : '
    + Format ( '%d.%.3d.%.2d', [ 5, 2, 03 ] ) ;

  VersaoLabel.Caption := LStrVersion ;
end;

(*
procedure TModulesDashboard.ModuleSelect ( AModule : integer ) ;
var
  x : integer ;
begin
  FDesktop.Visible := False ;

  FDesktop.ActivePageIndex :=  AModule  ;

  ModuleActivate( FDesktop.ActivePage ) ;

  Application.ProcessMessages ;
  FDesktop.Visible := True ;
end;
*)


procedure TModulesDashboard.ManualFinanceiro1Click(Sender: TObject);
var
  C : TFormClass  ;
begin

  LoadPackageMainPackage ( 'CL.Ag5.WB.ManualFinanceiro.bpl' )   ;
  ActivateClassGroup( TControl ) ;
  C := TFormClass ( GetClass ( 'TWBManualFinanceiro' ) ) ;
  with C.Create( self ) do
    begin
      Top    := Trunc ( Screen.Height * 0.10 ) ;
      Left   := Trunc ( Screen.width  * 0.10 ) ;
      Height := Trunc ( Screen.Height * 0.80 ) ;
      width  := Trunc ( Screen.width  * 0.80 ) ;
      show ;
    end;

end;

procedure TModulesDashboard.ManualZootcnico1Click(Sender: TObject);
var
  C : TFormClass  ;
begin
  LoadPackageMainPackage ( 'CL.Ag5.WB.ManualZootecnico.bpl' )   ;
  ActivateClassGroup( TControl ) ;
  C := TFormClass( GetClass ( 'TWBManualZootecnico' ) );
  with C.Create( self ) do
    begin
      Top    := Trunc ( Screen.Height * 0.10 ) ;
      Left   := Trunc ( Screen.width  * 0.10 ) ;
      Height := Trunc ( Screen.Height * 0.80 ) ;
      width  := Trunc ( Screen.width  * 0.80 ) ;
      show ;
    end;
end;

procedure TModulesDashboard.Maximize;
begin
   originalBounds := BoundsRect ;
   WindowState := wsMaximized ;
   with Screen.MonitorFromWindow( Handle ).WorkareaRect do
     SetWindowPos( Handle, 0, Left, Top, Width, Height, 0 ) ;
   FSizeGrip.Visible := False ;
end;

procedure TModulesDashboard.Repaint;
begin
  inherited;

  self._imgCloseButton.Repaint ;
  self._ImgRestoreApp.Repaint ;
  self._ImgMinimizeApp.Repaint ;

//   if ImgModuleSelector.Visible then
//      ImgModuleSelector.Repaint ;
end;

procedure TModulesDashboard.Restore;
begin
    WindowState := wsNormal ;
    BoundsRect := originalBounds ;
    FSizeGrip.Visible := True  ;
    FSizeGrip.BringToFront ;
    Repaint ;
end;

procedure TModulesDashboard.MaximizeRestore;
begin
  if WindowState = wsNormal then
     Maximize
  else if WindowState = wsMaximized then
     Restore ;
  Repaint

end;

initialization
   FModuleSelectorImageStream := nil ;
   RegisterClass ( TModulesDashboard ) ;

end.
