unit CLAg5.WBGerencialZootecnico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CLAg5.EmbeddedBrowser, Vcl.Menus,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Tc.VCL.Application, Vcl.AppEvnts, uCEFChromium, uCEFWindowParent,
  uCEFWinControl ;

type
  TWBGerencialZootecnico = class(TEmbeddedBrowser)
    sqlWebGerencialZootecnico: TTcSQLDataSet;
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

uses  UCEFInterfaces
    , UCefStringMultimap
    , UCEFRequest
    , UCEFPostData ;

{ TWBPortal }

procedure TWBGerencialZootecnico.DoInitPage;
begin
  GoPortalCDL ;
end;


procedure TWBGerencialZootecnico.GoPortalCDL;
var
  Header: ICefStringMultimap;
  Data: ICefPostData;
  Request: ICefRequest;
begin

  Request := TCefRequestRef.New;
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
  sqlWebGerencialZootecnico.ParamByName('KSYS$USER').AsString := LoggedUser.UserID ;
  sqlWebGerencialZootecnico.ParamByName('KSYS$DOMAIN').AsString := LoggedUser.DomainID ;
  sqlWebGerencialZootecnico.Open ;
  Data.AddElement(CreateField('username=' + EncodeURL ( sqlWebGerencialZootecnico.FieldByName('MODULE_LOGIN').asString )) );
  Data.AddElement(CreateField('&password=' + EncodeURL ( sqlWebGerencialZootecnico.FieldByName('MODULE_PASSWORD').asString)) );
  Data.AddElement(CreateField('&database=Clinica'));
  Request.PostData := Data;
  sqlWebGerencialZootecnico.Close ;

  Chromium.LoadURL('about:blank');
  Chromium.Browser.MainFrame.LoadRequest(Request) ;

end;


initialization
   RegisterClass ( TWBGerencialZootecnico )

end.
