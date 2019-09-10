unit UDomainNew;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.Mask, Tc.VCL.Form, Tc.VCL.Edits, StdCtrls;

type
  TDomainNew = class(TTcForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    TcDateEdit1: TTcDateEdit;
    Edit2: TEdit;
    Edit3: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DomainNew: TDomainNew;

implementation

{$R *.dfm}

end.
