// Project      : TurboCode - Módulos Prime
// Sub-Project  : System Interface
// Module       : User Inteface - Dialog
// Funcionality : Report Dialogs - Wizard
// License      : veja readme.txt


// License      : internal use


unit SysFormReportDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, SysExceptions, JvExExtCtrls, JvExtComponent,
  JvPanel, SysFormDialog, VCL.ComCtrls, JvExComCtrls, JvComCtrls,
  JvImage, SysFormWizard, SysReportTypes, Tc.VCL.Controls.GDIButton,
  System.Actions, Wrappers, Tc.VCL.Application ;

type

  T_FormReportDialog = class(T_FormDialog, IReportDialog )
    _btbOK: TTcGDIButton;
    _btbCancel: TTcGDIButton;
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure GetParameters (var Parameters : TReportParams ) ; virtual ;
    procedure SetParameters (var Parameters : TReportParams ) ; virtual ;
  public
    { Public declarations }
    function Execute ( Parameters : TReportParams ) : boolean ;
  end;

implementation

{$R *.dfm}

{ TfrmCustomDialog }

function T_FormReportDialog.Execute( Parameters : TReportParams ) : boolean ;
begin
   GetParameters ( Parameters ) ;
   Result  := ( ShowModal = mrOK ) ;
   if Result then
      SetParameters ( Parameters ) ;
end ;

procedure T_FormReportDialog.GetParameters(
  var Parameters: TReportParams);
begin
  inherited;
//
end;

procedure T_FormReportDialog.SetParameters(
  var Parameters: TReportParams);
begin
  inherited;
  ///
end;

initialization
  RegisterClass ( T_FormReportDialog ) ;
end.

