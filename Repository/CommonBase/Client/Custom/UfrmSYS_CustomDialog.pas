unit UfrmSYS_CustomDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, Exceptions, Wrappers, JvExExtCtrls, JvExtComponent, JvPanel, JvImage ;

type
  TfrmCustomDialog = class(T_FormDialog)
    _btbSave: TTcMPGDIButton;
    _btbCancel: TTcMPGDIButton;
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute : boolean ;
  end;

implementation

{$R *.dfm}

{ TfrmCustomDialog }

class function TfrmCustomDialog.Execute: boolean;
var
  ThisForm: TfrmCustomDialog;
  ModalResult : integer ;
begin
  ThisForm := TfrmCustomDialog.Create ( nil ) ;
  try
      ModalResult := ThisForm.ShowModal ;
      Result  := ( ModalResult = mrOK ) ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
end ;

end.

