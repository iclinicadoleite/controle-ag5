unit CLAg5.WBGerencialFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CLAg5.EmbeddedBrowser, Vcl.Menus,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Tc.VCL.Application, Vcl.AppEvnts, uCEFChromium, uCEFWindowParent,
  uCEFWinControl ;

type
  TWBGerencialFinanceiro = class(TEmbeddedBrowser)
    sqlWebGerencialFinanceiro: TTcSQLDataSet;
  protected
    procedure DoInitPage ; override ;
  private
    { Private declarations }
    procedure GoPortalCDL ;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

//uses ceflib ;
uses  WinSock
    , UCEFInterfaces
    , UCefStringMultimap
    , UCEFRequest
    , UCEFPostData ;

{ TWBPortal }

procedure TWBGerencialFinanceiro.DoInitPage;
begin
  GoPortalCDL ;
end;


function HostByIP(IP:PAnsiChar):string;
 var
 wVersionRequested : WORD;
 wsaData : TWSAData;
 Addr:LongWord;
 p : PHostEnt;
 begin
 Result:='Can''t reslove host';

 {Start up WinSock}
 wVersionRequested := MAKEWORD(1, 1);
 WSAStartup(wVersionRequested, wsaData);

 {Get the Host Name by address}
 Addr:=inet_addr(IP);
 p := GetHostByAddr(@Addr,128,AF_INET);

 {Shut down WinSock}
 WSACleanup;
 if p<>nil then Result:=string(p^.h_Name);
 end;


procedure ipx ;
var
  wVersionRequested: WORD;
  wsaData: TWSAData;
  p: PHostEnt;
  s: array [0 .. 128] of ansichar;
  p2: pansichar;
begin
  wVersionRequested := MAKEWORD(1, 1);
  WSAStartup(wVersionRequested, wsaData);
  GetHostName(@s, 128);
  p := GetHostByName(@s);
//  Memo1.Lines.Add(\ 'Nome do seu computador: \' + p^.h_Name);
  p2 := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
  WSACleanup;
end;


function EncodeUrl(source:string):string;
begin
  result := '';
  for var i := 1 to length(source) do
      if not CharInSet(source[i], ['A'..'Z','a'..'z','0','1'..'9','-','_','~','.'] ) then
         result := result + '%'+inttohex(ord(source[i]),2)
       else
         result := result + source[i];
end;


procedure TWBGerencialFinanceiro.GoPortalCDL;
var
  Header: ICefStringMultimap;
  Data: ICefPostData;
  Request: ICefRequest;
begin

  Request := TCefRequestRef.New ;


  if  IsCDLLocal then
    Request.Url := 'http://172.16.0.12/clinica/index.php'
  else
    Request.Url := 'http://143.107.218.75/clinica/index.php';
  Request.Method := 'POST';
//  Request.Flags := WUR_FLAG_NONE;

  Header := TCefStringMultimapOwn.Create;
  Header.Append('Content-Type', 'application/x-www-form-urlencoded');
  Request.SetHeaderMap(Header);

  Data := TCefPostDataRef.New;
  sqlWebGerencialFinanceiro.ParamByName('KSYS$USER').AsString := LoggedUser.UserID ;
  sqlWebGerencialFinanceiro.ParamByName('KSYS$DOMAIN').AsString := LoggedUser.DomainID ;
  sqlWebGerencialFinanceiro.Open ;
  Data.AddElement(CreateField('username=' + EncodeURL ( sqlWebGerencialFinanceiro.FieldByName('MODULE_LOGIN').asString )) );
  Data.AddElement(CreateField('&password=' + EncodeURL ( sqlWebGerencialFinanceiro.FieldByName('MODULE_PASSWORD').asString )) );
  Data.AddElement(CreateField('&database=Clinica'));
  Request.PostData := Data;
  sqlWebGerencialFinanceiro.Close ;

  Chromium.LoadURL('about:blank');
  Chromium.Browser.MainFrame.LoadRequest(Request) ;

end;


initialization
   RegisterClass ( TWBGerencialFinanceiro )

end.

