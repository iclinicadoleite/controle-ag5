unit UReportMemoList;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UfqrSYS_BaseReport, QRCtrls, jpeg, QuickRpt, VCL.ExtCtrls,
  SysReportTypes, ReportTypes, pngimage, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsMemoList ;

  TReportMemoList = class(TfqrSYS_BaseReport)
    MemoStringList: TQRMemo;
  private
    { Private declarations }
  protected
      class Function  GetParametersClass : TReportParamsClass ; override ;
      procedure Initialize  ; override ;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfqrSYS_BaseReport1 }

class function TReportMemoList.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TReportMemoList.Initialize;
begin
  inherited;
  MemoStringList.Lines.Assign( TSpecificReportParams( Parameters ).StringList ) ;
end;

end.
