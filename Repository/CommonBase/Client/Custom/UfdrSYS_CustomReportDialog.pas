unit UfdrSYS_CustomReportDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, ReportTypes, Wrappers, VCL.Mask, JvExMask,
  JvToolEdit, JvExExtCtrls, JvExtComponent, JvPanel,
  SysFormWizard, SysReportTypes, VCL.ComCtrls,
  Tc.MP.VCL.Edits, JvImage, JvExComCtrls, JvComCtrls,
  Tc.MP.VCL.Controls.GDIButton ;

type

  TSpecificReportParams = SysReportTypes.TReportParams ;

  TfdrCustomReportDialog = class(T_FormWizard, IReportDialog )
    Label1: TLabel;
    Label2: TLabel;
    edInicio: TTcMPDateEdit;
    edTermino: TTcMPDateEdit;
    TabSheet1: TTabSheet;
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure GetParameters (var Parameters : TReportParams ) ;
    procedure SetParameters (var Parameters : TReportParams ) ;
  public
    { Public declarations }
    function Execute (Parameters : TReportParams ) : boolean ;
  end;

implementation

{$R *.dfm}

{ TfrmCustomDialog }


function TfdrCustomReportDialog.Execute(Parameters: TReportParams) : boolean ;
begin
   Result := ShowModal = mrOK ;
end;

procedure TfdrCustomReportDialog.GetParameters(
  var Parameters: TReportParams);
begin
   with TSpecificReportParams ( Parameters ) do
      begin
        // FormControl := Param ;
        edInicio.Date  := StartDate ;
        edTermino.Date := EndDate ;
      end ;
end;

procedure TfdrCustomReportDialog.SetParameters( var Parameters: TReportParams ) ;
begin
   inherited ;

   with TSpecificReportParams ( Parameters ) do
      begin
        // Param := FormControl ;
        StartDate := edInicio.Date ;
        EndDate   := edTermino.Date  ;
      end ;
end;

end.

