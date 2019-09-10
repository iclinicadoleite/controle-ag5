unit UfdrFIN_AReceber;

{ DONE -oCaique -cA Receber : - Alterar Barra de Título }
{ DONE -oCaique -cA Receber : - Alterar Posição Titulo }
{ DONE -oCaique -cA Receber : - Incluir Botão fechar }

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, SysFormReportDialog, ReportTypes, VCL.Mask, JvExMask,
  JvToolEdit, VCL.ComCtrls, JvExComCtrls, JvComCtrls, JvExExtCtrls, JvExtComponent,
  JvPanel, JvImage, Tc.VCL.Edits, SysWizardReportDialog, SysReportTypes,
  Tc.VCL.Controls.GDIButton, Wrappers ;

type

  TSpecificReportParams = TReportParams ;

  TfdrFIN_AReceber = class(T_WizardReportDialog)
    Label1: TLabel;
    Label2: TLabel;
    edInicio: TTcDateEdit;
    edTermino: TTcDateEdit;
    TabSheet1: TTabSheet;
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure GetParameters (var Parameters : TReportParams ) ; override ;
    procedure SetParameters (var Parameters : TReportParams ) ; override ;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmCustomDialog }


procedure TfdrFIN_AReceber.GetParameters(
  var Parameters: TReportParams);
begin
   with TSpecificReportParams ( Parameters ) do
      begin
        // FormControl := Param ;
        edInicio.Date  := StartDate ;
        edTermino.Date := EndDate ;
      end ;
end;

procedure TfdrFIN_AReceber.SetParameters( var Parameters: TReportParams ) ;
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

