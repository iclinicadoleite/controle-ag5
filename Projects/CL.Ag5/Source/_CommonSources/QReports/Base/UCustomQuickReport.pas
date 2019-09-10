unit UCustomQuickReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ExtCtrls, QuickRpt, QRCtrls, UQuickReport, System.Actions, Vcl.ActnList,
  Tc.VCL.Application;

type
  T_CustomQuickReport = class(T_QuickReport)
    rbPageHeader: TQRBand;
    _qrsDateTime: TQRSysData;
    _qrsPageNumber: TQRSysData;
    _qrsReportTitle2: TQRSysData;
    rbTitle: TQRBand;
    _qrsReportTitle: TQRSysData;
    rbDetail: TQRBand;
    rbPageFooter: TQRBand;
    _qrlFooter: TQRLabel;
    rbSummary: TQRBand;
    rbColumnHeader: TQRBand;
    _qrsDateTimeTitle: TQRSysData;
    _qrsPageNumberTitle: TQRSysData;
    _qrlDescricao: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

{$R *.dfm}

{ T_CustomQuickReport }

constructor T_CustomQuickReport.Create(AOwner: TComponent);
begin
  inherited;
  _qrlDescricao.Caption := '' ;
end;

end.
