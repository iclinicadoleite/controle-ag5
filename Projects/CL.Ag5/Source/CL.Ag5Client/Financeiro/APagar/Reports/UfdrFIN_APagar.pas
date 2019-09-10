unit UfdrFIN_APagar;

{ DONE -oCaique -cA Pagar : - Alterar Barra de Título }
{ DONE -oCaique -cA Pagar : - Alterar Posição Titulo }
{ DONE -oCaique -cA Pagar : - Incluir Botão fechar }

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, SysFormReportDialog, VCL.Mask, JvExMask,
  JvToolEdit, VCL.Menus, VCL.ComCtrls, JvExComCtrls, JvComCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, JvImage, Tc.VCL.Edits, SysWizardReportDialog,
  SysReportTypes, ReportTypes, Tc.VCL.Controls.GDIButton, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_APagar ;

  TfdrFIN_APagar = class(T_WizardReportDialog)
    Label1: TLabel;
    Label2: TLabel;
    edInicio: TTcDateEdit;
    edTermino: TTcDateEdit;
    cbxQuitado: TCheckBox;
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


procedure TfdrFIN_APagar.GetParameters(
  var Parameters: TReportParams);
begin
   with TSpecificReportParams ( Parameters ) do
      begin
        // FormControl := Param ;
        cbxQuitado.Checked := ExibirQuitados ;
        cbxQuitado.Visible := Filtro <> 'P.Pagto' ;

        edInicio.Date  := StartDate ;
        edTermino.Date := EndDate ;
      end ;
end;

procedure TfdrFIN_APagar.SetParameters( var Parameters: TReportParams ) ;
begin
   inherited ;

   with TSpecificReportParams ( Parameters ) do
      begin
        // Param := FormControl ;
        ExibirQuitados := cbxQuitado.Checked ;
        StartDate      := edInicio.Date ;
        EndDate        := edTermino.Date  ;
      end ;
end;

end.

