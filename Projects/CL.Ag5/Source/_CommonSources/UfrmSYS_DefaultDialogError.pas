unit UfrmSYS_DefaultDialogError;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialogError, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.ActnList,
  JvExExtCtrls, JvImage, JvExtComponent, JvPanel, Tc.VCL.Controls.GDIButton, Wrappers ;

type
  TfrmDefaultDialogError = class(T_FormDialogError)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
