unit UfrmSYS_CustomReportDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, ReportTypes,
  VCL.ComCtrls, JvExComCtrls, JvComCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  Wrappers, SysFormReportDialog, JvImage ;

type

  TSpecificReportParams = ReportTypes.TReportParams ;

  TfrmCustomReportDialog = class(T_FormReportDialog)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure SetParameters (var Parameters : TReportParams ) ; override ;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmCustomDialog }


procedure TfrmCustomReportDialog.SetParameters( var Parameters: TReportParams ) ;
begin
   inherited ;
   
   with TSpecificReportParams ( Parameters ) do
      begin
        // Param := FormControl ;
      end ;
end;

end.

