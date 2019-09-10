unit SysQueryProcessIgnoreCancel;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.StdCtrls, VCL.Buttons, VCL.ActnList, JvExExtCtrls, JvImage,
  VCL.ExtCtrls, JvExtComponent, JvPanel,
  Tc.VCL.FormIntf, Tc.VCL.Controls.GDIButton, System.Actions, Wrappers,
  Tc.VCL.Application ;

type

  TQueryProcessIgnoreCancel = class(T_FormDialog)
    QueryLabel: TLabel;
    _btbHelp: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    _btbExecute: TTcGDIButton;
    _btbNoExecute: TTcGDIButton;
    procedure ChoiceClick(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
    class function Execute( ACaption : String = '' ) : TQuerySaveCancelOption ;
  end;


implementation

{$R *.dfm}

{ TQuerySaveIgnoreCancel }

procedure TQueryProcessIgnoreCancel.ChoiceClick(Sender: TObject);
begin
   ModalResult := TTcGDIButton ( Sender ).Tag ;
end;

class function TQueryProcessIgnoreCancel.Execute( ACaption : String = '' ) : TQuerySaveCancelOption ;
begin
    with Create ( nil ) do
      try
         if ACaption = '' then
           QueryLabel.Caption := Format ( QueryLabel.Caption, [ '' ] )
         else
           QueryLabel.Caption := Format ( QueryLabel.Caption, [ ' de ' + ACaption ] ) ;
         result := TQuerySaveCancelOption ( showModal - 1 ) ;
      finally
         free ;
      end;
end;


end.
