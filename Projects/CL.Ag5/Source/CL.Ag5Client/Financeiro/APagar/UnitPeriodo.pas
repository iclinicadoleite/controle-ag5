unit UnitPeriodo;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Mask, JvExMask, JvToolEdit,
  JvExControls, JvComponent, JvComponentBase, Tc.VCL.Edits;

type
  TfrmPeriodo = class(TForm)
    deIni: TTcDateEdit;
    deFim: TTcDateEdit;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cbxPagos: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPeriodo: TfrmPeriodo;

implementation

{$R *.dfm}

end.
