// Project      : TurboCode - Módulos Prime
// Sub-Project  : System Interface
// Module       : User Inteface - Dialog
// Funcionality : Report Dialogs - Simple Dialog
// License      : veja readme.txt


// License      : internal use


unit SysWizardReportDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, JvExExtCtrls, JvExtComponent,
  JvPanel, SysFormWizard, SysReportTypes, VCL.ComCtrls, JvExComCtrls, JvComCtrls,
  JvImage, Tc.VCL.Controls.GDIButton, System.Actions, Wrappers,
  Tc.VCL.Application  ;

type

  T_WizardReportDialog = class(T_FormWizard, IReportDialog )
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure GetParameters (var Parameters : TReportParams ) ; virtual ;
    procedure SetParameters (var Parameters : TReportParams ) ; virtual ;
  public
    { Public declarations }
    function Execute ( Parameters : TReportParams ) : boolean ; reintroduce ;
  end;

implementation

{$R *.dfm}

{ TfrmCustomDialog }

function T_WizardReportDialog.Execute( Parameters : TReportParams ) : boolean ;
begin
   GetParameters ( Parameters ) ;
   Result  := ( ShowModal = mrOK ) ;
   if Result then
      SetParameters ( Parameters ) ;
end ;

procedure T_WizardReportDialog.GetParameters(
  var Parameters: TReportParams);
begin
  inherited;
//
end;

procedure T_WizardReportDialog.SetParameters(
  var Parameters: TReportParams);
begin
  inherited;
  ///
end;

initialization
  RegisterClass ( T_WizardReportDialog ) ;
end.

