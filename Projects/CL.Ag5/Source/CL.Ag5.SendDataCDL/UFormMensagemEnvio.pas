unit UFormMensagemEnvio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormMensagemEnvio = class(TForm)
    Label1: TLabel;
    lbSim: TLabel;
    lbLembrarDepois: TLabel;
    Label2: TLabel;
    procedure lbSimClick(Sender: TObject);
    procedure lbLembrarDepoisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMensagemEnvio: TFormMensagemEnvio;

implementation

{$R *.dfm}

procedure TFormMensagemEnvio.FormCreate(Sender: TObject);
begin
  Self.Left := Screen.Width - (Self.Width + 5);
  Self.Top  := Screen.Height - (Self.Height + 110);
end;

procedure TFormMensagemEnvio.FormShow(Sender: TObject);
begin
  AnimateWindow(Self.Handle,200,AW_HOR_POSITIVE);
end;

procedure TFormMensagemEnvio.lbLembrarDepoisClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormMensagemEnvio.lbSimClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
