// Project      : TurboCode - Módulos Prime
// Sub-Project  : System Interface
// Module       : User Inteface - Dialog
// Funcionality : Report Dialogs - Wizard Dialog
// License      : veja readme.txt


// License      : internal use


unit SysFormWizard;

interface

{$D-}

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls, Data.DB, Tc.Data.DB.Helpers, VCL.Buttons,
  VCL.Grids, VCL.DBGrids, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.DBCtrls, VCL.Mask,
  JvExMask, JvToolEdit, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Application, Wrappers, SysTypes ;

type
  T_FormWizard = class(T_FormDialog)
    _actExecute: TAction;
    _actNext: TAction;
    _actCancel: TAction;
    _actPrior: TAction;
    _btbCancel : TTcGDIButton ;
    _btbPrior : TTcGDIButton ;
    _btbNext: TTcGDIButton;
    _btbExecute : TTcGDIButton ;
    PageControl: TJvPageControl;
    _btbHelp: TTcGDIButton;
    _actHelp: TAction;
    Action1: TAction;
    procedure _actCancelExecute(Sender: TObject);
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _ActionListUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure _actHelpExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
    procedure HideTabs ;
    procedure UpdateActButtons ;
    function FirstPageVisible : integer ;
    function LastPageVisible : integer ;
  public
    { Public declarations }
    class function Execute: boolean; virtual ;
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

{$R *.dfm}

procedure T_FormWizard.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  UpdateActButtons ;
end;

constructor T_FormWizard.Create(AOwner: TComponent);
begin
  inherited;
  _btbExecute.Left := _btbNext.Left ;
  _btbExecute.Top  := _btbNext.Top ;
  HideTabs ;
  UpdateActButtons ;
end;

class function T_FormWizard.Execute: boolean;
begin
   Result := False ;
end;

procedure T_FormWizard.HideTabs;
begin
   for var x := 0 to PageControl.PageCount - 1 do
      PageControl.Pages[ x ].TabVisible := False ;
   PageControl.ActivePageIndex := FirstPageVisible ;
end;

function T_FormWizard.FirstPageVisible: integer;
begin
  Result := -1 ;
  for var x := 0 to PageControl.PageCount -1 do
    if PageControl.Pages[ x ].Enabled then
      begin
       Result := x ;
       break
      end;
end;

function T_FormWizard.LastPageVisible: integer;
begin
  Result := -1 ;
  for var x := 0 to PageControl.PageCount -1 do
    if PageControl.Pages[ x ].Enabled then
       Result := x ;
end;


procedure T_FormWizard.UpdateActButtons;
var
  LastPage : integer ;
begin
  LastPage := LastPageVisible ;
  _actCancel.Visible := ( fsModal in FormState ) ;
  _actPrior.Visible := ( PageControl.ActivePageIndex > FirstPageVisible ) ;
  _actNext.Visible := ( PageControl.ActivePageIndex <> LastPage) ;
  _actExecute.Visible := ( PageControl.ActivePageIndex = LastPage) ;

  _btbExecute.Left := _btbNext.Left ;
  _btbExecute.Top  := _btbNext.Top ;
end;

procedure T_FormWizard._actCancelExecute(Sender: TObject);
begin
  if ( fsModal in FormState ) then
    ModalResult := mrCancel
//  else if Assigned ( Parent ) then
//    PostMessage( Application.MainForm.Handle, WM_CLOSE, 0, 0 )
//  else
//    Close
end;

procedure T_FormWizard._actNextExecute(Sender: TObject);
begin
  Repeat
     PageControl.SelectNextPage( True, False );
  Until PageControl.ActivePage.Enabled ;
end;

procedure T_FormWizard._actPriorExecute(Sender: TObject);
begin
  Repeat
     PageControl.SelectNextPage( False, False );
  Until PageControl.ActivePage.Enabled ;
end;

procedure T_FormWizard._actExecuteExecute(Sender: TObject);
begin
  if ( fsModal in FormState ) then
    ModalResult := mrOk
//  else if Assigned ( Parent ) then
//    PostMessage( Application.MainForm.Handle, WM_CLOSE, 0, 0 )
//  else
//    Close
end;

procedure T_FormWizard._actHelpExecute(Sender: TObject);
begin
//
end;

procedure T_FormWizard._ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  UpdateActButtons ;
end;

initialization
  RegisterClass ( T_FormWizard ) ;

end.
