unit UDashMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Effects,
  FMX.Filter.Effects,
  TC.RTL.NotificationService,
  CL.Ag5.NSMsgs, FMX.Ani,
  CLAg5.AccessKeyGen,
  winsock,
  Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers ;

type

  TAcessState = ( asAccessGrant,  asNoAccess, asNoInternet, asNoWebModuleConfigured ) ;

  TOptions = Record
     AcessState : TAcessState ;
     Layout : TLayout;
     Image  : TImage ;
     BlurEffect : TBlurEffect ;
     GlowEffect : TGlowEffect ;
     ContrastEffect : TContrastEffect ;
     InfoLabel : TLabel ;
     MonochromeEffect : TMonochromeEffect ;
     NeedZootecnico : boolean ;
     NeedFinanceiro : boolean ;
     NeedInternet   : boolean ;
     WebModule      : integer ;
     Message : TCLAg5NSMsgModuloClass ;
     procedure SetStatus( AState : TAcessState ) ;
     procedure CheckStatus( ALicZootecnico, ALicFinanceiro,  AHasInternet, AWebModule : boolean ) ;
  End;

  TOptionsArray = array of TOptions ;


  TDashMenu = class(TForm)
    LayOutMain: TLayout;
    BackgroundImage: TImage;
    FlowLayout01: TFlowLayout;
    Layout01: TLayout;
    Layout02: TLayout;
    Layout03: TLayout;
    Layout04: TLayout;
    Layout05: TLayout;
    Layout06: TLayout;
    Layout07: TLayout;
    Layout08: TLayout;
    Layout09: TLayout;
    Layout10: TLayout;
    Layout11: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Image01: TImage;
    Image02: TImage;
    Image03: TImage;
    Image04: TImage;
    Image06: TImage;
    Image09: TImage;
    Image10: TImage;
    Image11: TImage;
    ShadowEffect1: TShadowEffect;
    Image05: TImage;
    Image08: TImage;
    Image07: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ImageClick(Sender: TObject);
    procedure ImageMouseEnter(Sender: TObject);
    procedure ImageMouseLeave(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FOptionsList : TOptionsArray ;
    FWebCredentials  : TClientDataSet ;
    procedure ChangeBlur ( AMsg : TCLAg5NSMsg );
    procedure CheckLicense ;
    procedure LoadWebCredentials;
  public
    { Public declarations }
    procedure Blur ( ABlur : boolean ) ;
  end;


implementation

{$R *.fmx}

uses Tc.VCL.Application, Tc.DBRTL.AbstractDB ;

var
 GHasInternet : boolean = false ;

procedure TDashMenu.LoadWebCredentials;
const
   _SELECT =
         'SELECT'
  +#13#10'MODULE,'
  +#13#10'MODULE_DOMAIN,'
  +#13#10'MODULE_LOGIN,'
  +#13#10'MODULE_PASSWORD'
  +#13#10'FROM SYS$USERS_MODULES'
  +#13#10'WHERE'
  +#13#10'     KSYS$USER   =  :KSYS$USER'
  +#13#10' AND KSYS$DOMAIN =  :KSYS$DOMAIN' ;

var
  p : TParams ;
begin
  if not TTcAbstractDB.GetByAlias( 'ENTIDADES' ).Connection.Connected then
    TTcAbstractDB.GetByAlias( 'ENTIDADES' ).Connection.Open ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$USER', ptInput ).AsString   := LoggedUser.UserID ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).AsString := LoggedUser.DomainID ;

  TTcAbstractDB.GetByAlias( 'ENTIDADES' ).populateClientDataSet( FWebCredentials, _SELECT, p );
  p.Free ;
end;

procedure TDashMenu.Blur ( ABlur : boolean ) ;
var
  I : integer ;
begin
  for I := Low( FOptionsList ) to High( FOptionsList ) do
    FOptionsList[ I ].BlurEffect.Enabled := ABlur ;
end;

procedure TDashMenu.ChangeBlur(AMsg: TCLAg5NSMsg);
begin
  Blur ( AMsg.ClassType = TCLAg5NSMsgDashBlurOn ) ;
end;

procedure TDashMenu.CheckLicense;
var
 A: Integer;
 LZootecnico : boolean ;
 LFinanceiro : boolean ;
 LWebModule  : boolean ;
begin
 LoadWebCredentials ;

 LZootecnico := False ;
 LFinanceiro := False ;
 for  a := Low( GAcesso.Modulos ) to High ( GAcesso.Modulos ) do
   begin
     if GAcesso.Modulos[a].Modulo = maZootecnico then
        LZootecnico := GAcesso.Modulos[a].Acesso ;
     if GAcesso.Modulos[a].Modulo = maFinanceiro then
        LFinanceiro := GAcesso.Modulos[a].Acesso ;
   end;

  for A := Low( FOptionsList ) to High(FOptionsList) do
   begin
      LWebModule  := FWebCredentials.Locate('MODULE', FOptionsList[ A ].WebModule, [])
       and ( FWebCredentials.FieldByName('MODULE_LOGIN' ).AsString <> '' )
       and ( FWebCredentials.FieldByName('MODULE_PASSWORD' ).AsString <> '' ) ;
    FOptionsList[ A ].CheckStatus( LZootecnico, LFinanceiro, GHasInternet, LWebModule );
   end;

end;


type
 TSunB = packed record
     s_b1, s_b2, s_b3, s_b4: byte;
   end;

   TSunW = packed record
     s_w1, s_w2: word;
   end;

   PIPAddr = ^TIPAddr;
   TIPAddr = record
     case integer of
       0: (S_un_b: TSunB);
       1: (S_un_w: TSunW);
       2: (S_addr: longword);
   end;

  IPAddr = TIPAddr;

// DLL function defs.
function IcmpCreateFile : THandle; stdcall; external 'icmp.dll';

function IcmpCloseHandle (icmpHandle : THandle) : boolean; stdcall; external 'icmp.dll';

function IcmpSendEcho (IcmpHandle : THandle; DestinationAddress : IPAddr;
                     RequestData : Pointer; RequestSize : Smallint;
                     RequestOptions : pointer;
                     ReplyBuffer : Pointer;
                     ReplySize : DWORD;
                     Timeout : DWORD) : DWORD; stdcall; external 'icmp.dll';

type
  TPingClass = class
  public
    class function PingOnce(InetAddress: string): boolean;
  end ;

procedure TranslateStringToTInAddr(AIP: ansistring; var AInAddr);
 var
   phe: PHostEnt;
   pac: PAnsiChar;
   GInitData: TWSAData;
 begin
   WSAStartup($101, GInitData);
   try
     phe := GetHostByName(PAnsiChar(AIP));
     if Assigned(phe) then
     begin
       pac := phe^.h_addr_list^;
       if Assigned(pac) then
       begin
         with TIPAddr(AInAddr).S_un_b do begin
           s_b1 := Byte(pac[0]);
           s_b2 := Byte(pac[1]);
           s_b3 := Byte(pac[2]);
           s_b4 := Byte(pac[3]);
         end;
       end
       else
       begin
         raise Exception.Create('Error getting IP from HostName');
       end;
     end
     else
     begin
       raise Exception.Create('Error getting HostName');
     end;
   except
     FillChar(AInAddr, SizeOf(AInAddr), #0);
   end;
   WSACleanup;
 end;

class function TPingClass.PingOnce(InetAddress: string): boolean;
var
  Handle : THandle;
  InAddr : IPAddr;
  replyCount : DWORD;
  rep : array[1..128] of byte;  // Reply array.
begin

  Result := False;

  Handle := IcmpCreateFile;
  if Handle = INVALID_HANDLE_VALUE then Exit;

  try
    TranslateStringToTInAddr(InetAddress, InAddr);

    //replyCount is number of ICMP_ECHO_REPLY structures stored in ReplyBuffer (@rep)
    replyCount := IcmpSendEcho(Handle, InAddr, nil, 0, nil, @rep, 128{size of replybuffer}, 5000);

    Result := replyCount <> 0;
  finally
    IcmpCloseHandle(Handle);
  end;
end;


procedure TDashMenu.FormCreate(Sender: TObject);
type
 TLayoutArray = array of TLayout ;
 TImageArray = array of TImage ;
 TNSMSgArray = array of TCLAg5NSMsgModuloClass ;
 TBooleanArray = array of boolean ;
 TIntegerArray = array of integer ;
var
  I : integer ;
  LLayouts : TLayoutArray ;
  LImages : TImageArray ;
  LNSMsgs : TNSMSgArray ;
  LNeedZootecnico : TBooleanArray ;
  LNeedFinanceiro : TBooleanArray ;
  LNeedInternet   : TBooleanArray ;
  LWebModule : TIntegerArray ;
begin

  GHasInternet :=  TPingClass.PingOnce('google.com.br') ;

  TCLAg5NSMsgDashBlurOn.Subscribe( ChangeBlur );
  TCLAg5NSMsgDashBlurOff.Subscribe( ChangeBlur );

  LLayouts := TLayoutArray.Create(
    Layout01, Layout02, Layout03, Layout04, Layout05,
    Layout06, Layout07, Layout08, Layout09, Layout10,
    Layout11
  ) ;

  LImages := TImageArray.Create(
    Image01, Image02, Image03, Image04, Image05,
    Image06, Image07, Image08, Image09, Image10,
    Image11
  ) ;

  LNSMsgs := TNSMSgArray.Create (
    TCLAg5NSMsgModuloZootecnico,          TCLAg5NSMsgModuloFinanceiro,
    TCLAg5NSMsgModuloGerencialZootecnico, TCLAg5NSMsgModuloGerencialFinanceiro,
    TCLAg5NSMsgModuloRPPA,
    TCLAg5NSMsgModuloPlanner,             TCLAg5NSMsgModuloICG,
    TCLAg5NSMsgModuloPortal,              TCLAg5NSMsgModuloLoja,
    TCLAg5NSMsgModuloConfig,
    TCLAg5NSMsgModuloHome
  ) ;

  LNeedInternet := TBooleanArray.Create (
    False,          False,
    True, True,
    True,
    False,             True,
    True,              True,
    False,
    False
  ) ;

  LNeedZootecnico := TBooleanArray.Create (
    True,          False,
    True,          False,
    False,
    False,         False,
    False,         False,
    False,
    False
  ) ;

  LNeedFinanceiro := TBooleanArray.Create (
    False,          True,
    False,          True,
    False,
    False,          False,
    False,          False,
    False,
    False
  ) ;

  LWebModule := TIntegerArray.Create (
    0, 0,     // zoo , fin
    1, 2,     // gerencial zoo, fin
    3,        // monitoria
    4, 4,     // planer / indicadores
    5, 6,     // portal / loja
    0,
    0
  ) ;

  SetLength ( FOptionsList, Length( LLayouts ) ) ;

  for I := Low( LLayouts ) to High( LLayouts ) do
    begin

      FOptionsList[ I ].Layout     := LLayouts[ I ] ;

      FOptionsList[ I ].Image     := LImages[ I ] ;
      FOptionsList[ I ].Image.Tag := I ;
      FOptionsList[ I ].Image.OnClick      := ImageClick ;
      FOptionsList[ I ].Image.OnMouseEnter := ImageMouseEnter ;
      FOptionsList[ I ].Image.OnMouseLeave := ImageMouseLeave ;

      FOptionsList[ I ].BlurEffect := TBlurEffect.Create( self )  ;
      FOptionsList[ I ].BlurEffect.Softness := 7 ;
      FOptionsList[ I ].BlurEffect.Parent   := LLayOuts[ I ] ;
      FOptionsList[ I ].BlurEffect.Enabled  := True ;

      FOptionsList[ I ].GlowEffect := TGlowEffect.Create( self )  ;
      FOptionsList[ I ].GlowEffect.Enabled := False ;
      FOptionsList[ I ].GlowEffect.Opacity  := 1  ;
      FOptionsList[ I ].GlowEffect.Softness := 0.5 ;
      FOptionsList[ I ].GlowEffect.GlowColor := TAlphaColorRec.Silver ;
      FOptionsList[ I ].GlowEffect.Parent  := LLayOuts[ I ] ;

      FOptionsList[ I ].ContrastEffect := TContrastEffect.Create( self )  ;
      FOptionsList[ I ].ContrastEffect.Enabled    := False ;
      FOptionsList[ I ].ContrastEffect.Parent     := LImages[ I ] ;
      FOptionsList[ I ].ContrastEffect.Brightness := 0.4 ;
      FOptionsList[ I ].ContrastEffect.Contrast   := 0.1 ;

      FOptionsList[ I ].MonochromeEffect := TMonochromeEffect.Create( self ) ;
      FOptionsList[ I ].MonochromeEffect.Enabled := False ;
      FOptionsList[ I ].MonochromeEffect.Parent  := LImages[ I ] ;

      FOptionsList[ I ].InfoLabel := TLabel.Create( self );
      FOptionsList[ I ].InfoLabel.StyledSettings  := [] ;
      FOptionsList[ I ].InfoLabel.Font.Size    := 11 ;
      FOptionsList[ I ].InfoLabel.Position.X   := FOptionsList[ I ].Image.Position.X - 3 ;
      FOptionsList[ I ].InfoLabel.Position.Y   := FOptionsList[ I ].Image.Position.Y ;
      FOptionsList[ I ].InfoLabel.Size.Width   := FOptionsList[ I ].Image.Width + 3 ;
      FOptionsList[ I ].InfoLabel.Size.Height  := FOptionsList[ I ].Image.Height ;
      FOptionsList[ I ].InfoLabel.Size.PlatformDefault  := False           ;
      FOptionsList[ I ].InfoLabel.TextSettings.Font.Family := 'DINPro-Regular' ;
      FOptionsList[ I ].InfoLabel.TextSettings.FontColor   := TAlphaColorRec.Gray ; //TAlphaColorRec.Navy ;
      FOptionsList[ I ].InfoLabel.TextSettings.HorzAlign   := TTextAlign.Center   ;
      FOptionsList[ I ].InfoLabel.Text := '' ;
      FOptionsList[ I ].InfoLabel.Parent := LLayOuts[ I ] ;

      FOptionsList[ I ].NeedZootecnico := LNeedZootecnico[ I ] ;
      FOptionsList[ I ].NeedFinanceiro := LNeedFinanceiro[ I ] ;
      FOptionsList[ I ].NeedInternet   := LNeedInternet[ I ] ;
      FOptionsList[ I ].WebModule      := LWebModule[ I ] ;

      FOptionsList[ I ].Message := LNSMsgs[ I ] ;
    end;

end;

procedure TDashMenu.FormDeactivate(Sender: TObject);
begin
   Hide ;
end;

procedure TDashMenu.FormShow(Sender: TObject);
begin
  CheckLicense ;
end;

(*
procedure TDashMenu.ImageClick(Sender: TObject);
begin
  Hide ;
  with ( FOptionsList[ TImage( Sender ).Tag ].Message.Create( self ) ) do
    begin
       ModuleIndex := TImage( Sender ).Tag ;
       Dispatch ;
    end  ;
end;
*)

procedure TDashMenu.ImageClick(Sender: TObject);
var
  LIndex : integer ;
begin
  LIndex := TImage ( Sender ).Tag ;

  if FOptionsList[ LIndex ].AcessState > asAccessGrant then
      exit ;

  Hide ;

  with ( FOptionsList[ LIndex ].Message.Create( self ) ) do
    begin
       ModuleIndex := LIndex ;
       Dispatch ;
    end  ;
end;

procedure TDashMenu.ImageMouseLeave(Sender: TObject);
var
  LIndex : integer ;
begin
   LIndex := TImage ( Sender ).Tag ;
   if FOptionsList[ LIndex ].AcessState > asAccessGrant then
      exit ;
   FOptionsList[ LIndex ].GlowEffect.Enabled := False ;
end;

procedure TDashMenu.ImageMouseEnter(Sender: TObject);
var
  LIndex : integer ;
begin
   LIndex := TImage ( Sender ).Tag ;
   if FOptionsList[ LIndex ].AcessState > asAccessGrant then
      exit ;
   FOptionsList[ LIndex ].GlowEffect.Enabled := True ;
end;

{ TOptions }

procedure TOptions.CheckStatus(ALicZootecnico, ALicFinanceiro,
  AHasInternet, AWebModule: boolean);
begin

  if NeedZootecnico and not ALicZootecnico then
   begin
    SetStatus ( asNoAccess ) ;
    exit
   end;

  if NeedFinanceiro and not ALicFinanceiro then
   begin
    SetStatus ( asNoAccess ) ;
    exit
   end;

  if NeedInternet   and not AHasInternet  then
   begin
    SetStatus ( asNoInternet ) ;
    exit
   end;

  if ( WebModule > 0 ) and not AWebModule  then
   begin
    SetStatus ( asNoWebModuleConfigured ) ;
    exit
   end;

   SetStatus ( asAccessGrant ) ;

end;

procedure TOptions.SetStatus(AState: TAcessState);
begin
    AcessState := AState ;
    case AcessState of
     asAccessGrant :
       begin
         Image.Cursor := crHandPoint ;
         Image.Opacity := 1 ;
         InfoLabel.Visible := False ;
         InfoLabel.Text := '' ;
         MonochromeEffect.Enabled := False ;
       end;
     asNoAccess    :
       begin
         Image.Cursor := crDefault ;
         Image.Opacity := 0.3 ;
         InfoLabel.Text := 'Você não possui acesso a este aplicativo' ;
         InfoLabel.Visible := True ;
         MonochromeEffect.Enabled := False ;
       end;
     asNoInternet  :
       begin
         Image.Cursor := crDefault ;
         Image.Opacity := 0.3 ;
         InfoLabel.Text := 'Conecte-se na internet para acessar este aplicativo' ;
         InfoLabel.Visible := True ;
         MonochromeEffect.Enabled := True ;
       end;
     asNoWebModuleConfigured :
       begin
         Image.Cursor := crDefault ;
         Image.Opacity := 0.3 ;
         InfoLabel.Text := 'Para ter acesso entre em contato' ;
           //'Configure as credenciais de acesso deste aplicativo' ;
         InfoLabel.Visible := True ;
         MonochromeEffect.Enabled := True ;
       end;
    end;
end;

initialization
   RegisterClass ( TDashMenu ) ;
end.
