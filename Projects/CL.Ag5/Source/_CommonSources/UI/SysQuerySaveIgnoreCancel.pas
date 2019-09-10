unit SysQuerySaveIgnoreCancel;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.StdCtrls, VCL.Buttons, VCL.ActnList, JvExExtCtrls, JvImage,
  VCL.ExtCtrls, JvExtComponent, JvPanel,
  Tc.VCL.FormIntf, Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Application, Wrappers ;

type

  TQuerySaveIgnoreCancel = class(T_FormDialog)
    QueryLabel: TLabel;
    _btbHelp: TTcGDIButton;
    _btbExecute: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    _btbNoExecute: TTcGDIButton;
    procedure ChoiceClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute( ACaption : String = '' ) : TQuerySaveCancelOption ;
  end;


implementation

{$R *.dfm}

{ TQuerySaveIgnoreCancel }

procedure TQuerySaveIgnoreCancel.ChoiceClick(Sender: TObject);
begin
   ModalResult := TTcGDIButton ( Sender ).Tag ;
end;

class function TQuerySaveIgnoreCancel.Execute( ACaption : String = '' ) : TQuerySaveCancelOption ;
begin
    with Create ( nil ) do
      try
         if ACaption = '' then
           QueryLabel.Caption := Format ( QueryLabel.Caption, [ '' ] )
         else
           QueryLabel.Caption := Format ( QueryLabel.Caption, [ ' em ' + ACaption ] ) ;
         result := TQuerySaveCancelOption ( showModal - 1 ) ;
      finally
         free ;
      end;
end;

end.
