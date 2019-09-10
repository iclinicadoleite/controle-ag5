unit CLAg5.WBPortal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CLAg5.EmbeddedBrowser, Vcl.Menus,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Tc.VCL.Application, Vcl.AppEvnts, uCEFChromium, uCEFWindowParent, uCEFInterfaces,
  uCEFTypes, uCEFWinControl ;

type
  TWBPortal = class(TEmbeddedBrowser)
    sqlWebPortal: TTcSQLDataSet;
    procedure ChromiumLoadError(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; errorCode: Integer; const errorText,
      failedUrl: ustring);
  protected
    procedure DoInitPage ; override ;
  private
    { Private declarations }
    procedure GoPortalCDL ( const lGVT : boolean = False ) ;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses  UCefStringMultimap
    , UCEFRequest
    , UCEFPostData ;

{ TWBPortal }


procedure TWBPortal.ChromiumLoadError(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; errorCode: Integer;
  const errorText, failedUrl: ustring);
begin
  inherited;
//  if errorCode >= 300 then
    begin
     Chromium.OnLoadError := nil ;
     GoPortalCDL ( True )
    end;
end;

procedure TWBPortal.DoInitPage;
begin
  GoPortalCDL ;
end;


procedure TWBPortal.GoPortalCDL ( const lGVT : boolean = False ) ;
var
  Header: ICefStringMultimap;
  Data: ICefPostData;
  Request: ICefRequest;
begin

  Request := TCefRequestRef.New;

  if IsCDLLocal then
    Request.Url := 'http://172.16.0.12/clinica/index.php'
  else if lGVT then
    Request.Url :=  'http://177.159.182.50/clinica/index.php'
  else
    Request.Url := 'http://143.107.218.75/clinica/index.php';

  Request.Method := 'POST';

  Header := TCefStringMultimapOwn.Create;
  Header.Append('Content-Type', 'application/x-www-form-urlencoded');
  Request.SetHeaderMap(Header);

  Data := TCefPostDataRef.New;
  sqlWebPortal.ParamByName('KSYS$USER').AsString := LoggedUser.UserID ;
  sqlWebPortal.ParamByName('KSYS$DOMAIN').AsString := LoggedUser.DomainID ;
  sqlWebPortal.Open ;
  Data.AddElement(CreateField('username=' + EncodeUrl(sqlWebPortal.FieldByName('MODULE_LOGIN').asString )));
  Data.AddElement(CreateField('&password=' + EncodeUrl(sqlWebPortal.FieldByName('MODULE_PASSWORD').asString)));
  Data.AddElement(CreateField('&database=Clinica'));

  Request.PostData := Data;
  sqlWebPortal.Close ;

  Chromium.LoadRequest(Request);
  Chromium.ResizeFormWidthTo(CEFWindowParent.ClientWidth);
  Chromium.ResizeFormHeightTo(CEFWindowParent.ClientHeight);


end;


initialization
   RegisterClass ( TWBPortal )

end.
