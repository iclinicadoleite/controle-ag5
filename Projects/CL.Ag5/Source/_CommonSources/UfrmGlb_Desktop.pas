unit UfrmGlb_Desktop;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage, JvExtComponent,
  JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls, JvExComCtrls, JvComCtrls,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Tc.VCL.Form, Tc.VCL.FormIntf, JvPanel, System.Actions,
  Tc.VCL.Application, JvComponentBase ;

type
  TfrmGlb_Desktop = class(TTcForm, ITcQuerySaveChanges)
    JvTabDefaultPainter1: TJvTabDefaultPainter;
    procedure _imgCloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  protected
    FDesktop : TTCDForm ;
    function QuerySaveChanges : TQuerySaveCancelOption ;
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; virtual ; abstract ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
  end;

implementation

uses SysTypes ;

{$R *.dfm}

constructor TfrmGlb_Desktop.Create(AOwner: TComponent);
begin
  inherited;
  FDesktop  := TTCDForm.Create ( self ) ;
  FDesktop.StyleElements := [] ;
  FDesktop.TabPainter.ActiveFont.Name    := 'DINPro-Regular'  ;
  FDesktop.TabPainter.InactiveFont.Name  := 'DINPro-Regular' ;
  FDesktop.TabPainter.ActiveColorTo     := SysTypes._TITLE_COLOR ;
  FDesktop.TabPainter.ActiveColorFrom   := clWhite ;
  FDesktop.TabPainter.ActiveFont.Color  := SysTypes._TITLE_FONT_COLOR ;
  FDesktop.TabPainter.InactiveColorTo   := FDesktop.TabPainter.ActiveColorFrom ;
  FDesktop.TabPainter.InactiveColorFrom := FDesktop.TabPainter.ActiveColorTo ;

  FDesktop.OnGetClass   := GetClass ;
end;

destructor TfrmGlb_Desktop.Destroy;
begin
//  FDesktop.Free ;
  inherited;
end;

function TfrmGlb_Desktop.QuerySaveChanges: TQuerySaveCancelOption;
var
  QSC : ITcQuerySaveChanges ;
begin
  if Assigned ( FDesktop ) and Supports( FDesktop, ITcQuerySaveChanges, QSC ) then
     Result := QSC.QuerySaveChanges
  else
     Result := qscIgnore ;

//  if Result <> qscCancel then
//  FDesktop.closeAll ;
end;

procedure TfrmGlb_Desktop._imgCloseButtonClick(Sender: TObject);
begin
  Close ;
end;

end.
