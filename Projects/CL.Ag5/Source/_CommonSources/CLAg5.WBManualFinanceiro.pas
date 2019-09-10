unit CLAg5.WBManualFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CLAg5.EmbeddedBrowser, Vcl.Menus,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.AppEvnts, uCEFChromium, uCEFWindowParent, uCEFWinControl ;

type
  TWBManualFinanceiro = class(TEmbeddedBrowser)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure DoInitPage ; override ;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TWBManualFinanceiro.DoInitPage;
const
  LFileName = 'Doc\Guia Financeiro.pdf' ;
var
  LFullPath : string ;
begin
  LFullPath := 'T:\CDL\Sistemas\ControleLeiteiro\Deployment\Client\Deploy\' + LFileName ;
  if not FileExists( LFullPath ) then
    LFullPath := IncludeTrailingPathDelimiter ( ExtractFilePath ( ParamStr(0) ) )+ LFileName ;
  LoadFile(LFullPath)
end;

procedure TWBManualFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//
end;

initialization
  RegisterClass ( TWBManualFinanceiro );
end.
