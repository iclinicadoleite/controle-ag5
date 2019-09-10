unit UfrmSYS_SelPeriodo;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, JvExControls, JvCalendar, JvToolEdit, VCL.StdCtrls, VCL.Mask, JvExMask,
  JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, VCL.ComCtrls, JvExComCtrls,
  JvMonthCalendar, VCL.ExtCtrls, VCL.Buttons, DateUtils, Tc.VCL.Controls.GDIButton, Wrappers ;

type
  TfrmSelPeriodo = class(TForm)
    JvMonthCalendar21: TJvMonthCalendar2;
    Panel1: TPanel;
    btbSave: TTcGDIButton;
    btbCancel: TTcGDIButton;
    procedure JvMonthCalendar21SelChange(Sender: TObject; StartDate,
      EndDate: TDateTime);
  private
    { Private declarations }
    FInicio, FFim : TDateTime ;
  public
    { Public declarations }
    class function Execute ( var Inicio : TDate ; var Fim : TDate ) : boolean ;
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;


implementation

{$R *.dfm}

{ TfrmSelPeriodo }

constructor TfrmSelPeriodo.Create(AOwner: TComponent);
begin
  inherited;
  JvMonthCalendar21.Today     := Date ;
  FInicio := StartOfTheMonth ( JvMonthCalendar21.Today ) ;
  FFim    := EndOfTheMonth ( JvMonthCalendar21.Today ) ;
  JvMonthCalendar21.DateFirst := FInicio ;
  JvMonthCalendar21.DateLast  := FFim ;
end;

class function TfrmSelPeriodo.Execute( var Inicio : TDate ; var Fim : TDate ) : boolean ;
var
  frmSelPeriodo: TfrmSelPeriodo;
begin
  frmSelPeriodo := TfrmSelPeriodo.Create ( nil );
  with frmSelPeriodo do
     begin
        Result := (showModal = mrOK) ;
        Inicio := Trunc ( FInicio ) ;
        Fim    := Trunc ( FFim ) ;
     end ;
  frmSelPeriodo.free ;
end;

procedure TfrmSelPeriodo.JvMonthCalendar21SelChange(Sender: TObject;
  StartDate, EndDate: TDateTime);
begin
   FInicio := StartDate ;
   FFim := EndDate ;
end;

end.
