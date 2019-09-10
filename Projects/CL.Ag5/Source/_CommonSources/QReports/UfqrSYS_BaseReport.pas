unit UfqrSYS_BaseReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ExtCtrls, QuickRpt, QRCtrls, jpeg, UCustomQuickReport,
  pngimage, System.Actions, Vcl.ActnList, Tc.VCL.Application, Wrappers ;

type
  TfqrSYS_BaseReport = class(T_CustomQuickReport)
    _qrImageLogo: TQRImage;
    QRShapeHeaderSeparator: TQRShape;
    QRImageDomain: TQRImage;
    QRShapeHeaderSeparator2: TQRShape;
    QRShapeFooterSeparator1: TQRShape;
    QRLabelFooterSeparator1: TQRLabel;
    QRShapeFooterSeparator: TQRShape;
    QRLabelFooterSeparator: TQRLabel;
    LogoClinica: TQRImage;
    _qrlLegenda: TQRLabel;
    _qrlLegenda1: TQRLabel;
    qrQuantidadeRegistros: TQRLabel;
    procedure rbTitleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DateTimePagePrint(sender: TObject; var Value: string);
    procedure rbPageFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure rbColumnHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

{$R *.dfm}

{ TfqrSYS_BaseReport }

constructor TfqrSYS_BaseReport.Create(AOwner: TComponent);
var
 R : integer ;
 H : integer ;
begin
  inherited;
  R := QRImageDomain.Width ;
  H := QRImageDomain.Height ;

  QRImageDomain.Anchors := [akTop,akRight] ;
  QRImageDomain.AutoSize := True ;
  QRImageDomain.Picture.Assign ( Application.LoggedUser.DomainImage ) ;
  QRImageDomain.Left := QRImageDomain.Left + (R - QRImageDomain.Width ) ;
  QRImageDomain.AutoSize := False ;
  QRImageDomain.Height := H ;
  QRImageDomain.Center := True ;

  QRShapeHeaderSeparator.Anchors  := [akLeft,akTop,akRight] ;
  QRShapeHeaderSeparator2.Anchors := [akLeft,akTop,akRight] ;
  QRShapeFooterSeparator.Anchors  := [akLeft,akTop,akRight] ;
  QRShapeFooterSeparator1.Anchors := [akLeft,akTop,akRight] ;
  _qrsPageNumberTitle.Parent      := rbPageFooter ;
  _qrsPageNumberTitle.Top         := QRShapeFooterSeparator.Top + 2 ;
  _qrsPageNumberTitle.OnPrint     := DateTimePagePrint ;

  _qrsPageNumber.Parent           := rbPageFooter ;
  _qrsPageNumber.Top              := QRShapeFooterSeparator1.Top + 2 ;
  _qrsPageNumber.OnPrint          := DateTimePagePrint ;

  _qrsDateTimeTitle.OnPrint       := DateTimePagePrint ;
  _qrsDateTime.OnPrint            := DateTimePagePrint ;

  _qrsReportTitle2.Font.Style     := [fsBold] ;
  rbTitle.Height := 95 ;


end;



procedure TfqrSYS_BaseReport.rbColumnHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := True ;
  if QuickRep.Exporting and (QuickRep.PageNumber > 1) then
    PrintBand := False ;
end;

procedure TfqrSYS_BaseReport.rbPageFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not QuickRep.Exporting ;
end;

procedure TfqrSYS_BaseReport.rbTitleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if ( QuickRep.PageNumber = 0 )
   or ( Assigned (Parameters) and ( Parameters.ForceHeader and not QuickRep.Exporting )) then
    begin
      LogoClinica.Enabled := True ;
      QRShapeFooterSeparator.Enabled := True ;
      QRLabelFooterSeparator.Enabled := True ;
      _qrsPageNumberTitle.Enabled := True ;

      QRShapeFooterSeparator1.Enabled := False ;
      QRLabelFooterSeparator1.Enabled := False ;

      _qrlLegenda.Enabled := True ;
      _qrlLegenda1.Enabled := False ;

      _qrsPageNumber.Enabled := False ;

  //    if Parameters.Legenda <> '' then
  //      _qrlLegenda.Caption := Parameters.Legenda ;
//      rbPageFooterChild.Enabled := True ;
//      rbPageFooterChild.Height  := 0 ;
    end
  else
    begin
      PrintBand := not QuickRep.Exporting ;

      LogoClinica.Enabled := False ;

      QRShapeFooterSeparator.Enabled := False ;
      QRLabelFooterSeparator.Enabled := False;
      _qrsPageNumberTitle.Enabled := False ;

      QRShapeFooterSeparator1.Enabled := True ;
      QRLabelFooterSeparator1.Enabled := True ;

      _qrlLegenda.Enabled := False ;
      _qrlLegenda1.Enabled := True ;

      _qrsPageNumber.Enabled := True ;

//      rbPageFooterChild.Enabled := False ;
//      rbPageFooterChild.Height  := 0 ;
    end
end;

procedure TfqrSYS_BaseReport.DateTimePagePrint(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := Value + '    ' ;
end;

(*


*)

initialization
   RegisterClass ( TfqrSYS_BaseReport ) ;
end.
