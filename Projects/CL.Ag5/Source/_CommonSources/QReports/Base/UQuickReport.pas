unit UQuickReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ExtCtrls, QuickRpt, SysReportTypes,
   Tc.VCL.Form, System.Actions, Vcl.ActnList, Tc.VCL.Application;

type
  T_QuickReport = class(TTcForm)
    QuickRep: TQuickRep;
  private
    { Private declarations }
    FParameters : TReportParams ;
  protected
    { Protected declarations }
    property Parameters : TReportParams read  FParameters ;
    procedure Initialize  ; virtual ;
    procedure DoPrint ;
    class Function  GetDialogClass : IReportDialog ; virtual ;
    class Function  GetParametersClass : TReportParamsClass ; virtual ;
  public
    { Public declarations }
    class procedure Preview ;
    class procedure Print ;
    class procedure SaveToPDF ( FileName : string ) ;
    class procedure Execute ( Parameters : TReportParams ) ;
    class procedure ExecuteDialog ; overload ;
    class procedure ExecuteDialog ( Parameters : TReportParams ) ; overload ;
  end;

implementation

{$R *.dfm}

uses QRPDF995Suppl ;

{ T_QuickReport }

procedure T_QuickReport.DoPrint;
begin
  if not assigned ( FParameters ) or ( FParameters.TipoEmissao = tePrint ) then
     QuickRep.Print

  else if FParameters.TipoEmissao = tePDF then
    TQRPDF995.PrintToPDF( QuickRep, FParameters.FileName, FParameters.AutoLaunch )

  else  // FParameters.TipoEmissao = tePreview then
     QuickRep.Preview
end;


class function T_QuickReport.GetDialogClass: IReportDialog ;
begin
    Result := nil ;
end;

class function T_QuickReport.GetParametersClass: TReportParamsClass ;
begin
    Result := TReportParams ;
end;


class procedure T_QuickReport.Preview;
var
  _QuickReport : T_QuickReport ;
begin
  _QuickReport := Create ( nil ) ;
  _QuickReport.QuickRep.prepare ;
  _QuickReport.QuickRep.Preview ;
  _QuickReport.free ;
end;

class procedure T_QuickReport.Print;
var
  _QuickReport : T_QuickReport ;
begin
  _QuickReport := Create ( nil ) ;
  _QuickReport.QuickRep.Preview ;
  _QuickReport.free ;
end;

class procedure T_QuickReport.SaveToPDF(FileName: string);
var
  _QuickReport : T_QuickReport ;
begin
  _QuickReport := Create ( nil ) ;
  _QuickReport.QuickRep.Prepare ;
  _QuickReport.free ;
end;


class procedure T_QuickReport.ExecuteDialog ;
var
  Parameters: TReportParams ;
  ParametersClass : TReportParamsClass ;
begin
  ParametersClass := GetParametersClass ;

  if not Assigned ( ParametersClass ) then
     Abort ;

  Parameters := ParametersClass.Create ;
  ExecuteDialog( Parameters ) ;
  Parameters.free ;
end;

class procedure T_QuickReport.ExecuteDialog(Parameters: TReportParams);
var
  ReportDialog : IReportDialog ;
begin
  ReportDialog := GetDialogClass ;

  if not Assigned ( ReportDialog ) then
     Abort ;

  // inclua a chamada do form de dialogo neste ponto
  if ReportDialog.Execute ( Parameters ) then
     Execute ( Parameters ) ;

end;

class procedure T_QuickReport.Execute(Parameters: TReportParams);
var
  ThisForm : T_QuickReport ;
begin
  ThisForm := Create ( nil ) ;
  ThisForm.FParameters := Parameters ;
  ThisForm.Initialize ;
  ThisForm.DoPrint ;
  ThisForm.free ;
end;

procedure T_QuickReport.Initialize;
begin
//   QRImageDomain.Picture.LoadFromFile();
   if assigned ( FParameters ) and ( FParameters.ReportTitle <> '' ) then
      QuickRep.ReportTitle := FParameters.ReportTitle ;
end;


end.
