// Project      : TurboCode - Módulos Prime
// Sub-Project  : System Interface
// Module       : User Inteface - Dialog
// Funcionality : Base Dialogs
// License      : veja readme.txt


// License      : internal use


unit SysFormDialog;
{.$D-}

{ DONE -oCaique -cInfra : - Alterar Barra de Título }
{ DONE -oCaique -cInfra : - Alterar Posição Titulo }
{ DONE -oCaique -cInfra : - Incluir Botão fechar }

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ExtCtrls, VCL.StdCtrls, VCL.ActnList, JvExExtCtrls, VCL.Imaging.jpeg,
  JvExtComponent, JvPanel, JvImage, Tc.VCL.Controls.GDIButton, System.Actions,
  Tc.VCL.Form, Tc.VCL.Application, Wrappers ;

type
  T_FormDialog = class(TTcForm)
    _pnlDetail: TJvPanel;
    _pnlFooter: TJvPanel;
    _pnlForm: TJvPanel;
    _imageBottom: TImage;
    procedure _pnlFooterPaint(Sender: TObject);
    procedure _imgCloseButtonClick(Sender: TObject);
    procedure _imgCloseButtonMouseEnter(Sender: TObject);
    procedure _imgCloseButtonMouseLeave(Sender: TObject);
    procedure _pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure _pnlFormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure _pnlFormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure _pnlFormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
//    FOldBorderStyle : TFormBorderStyle ;
    FFromColor, FToColor : TColor ;
    procedure ColorChanged ( AFromColor, AMiddleColor, AToColor : TColor );
    procedure InitAppearance ;
  protected
    procedure Loaded ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SysTypes ;

{$R *.dfm}

procedure T_FormDialog.ColorChanged(AFromColor, AMiddleColor, AToColor: TColor);
begin
 FFromColor  := AFromColor ;
 FToColor    := AToColor   ;

end;


procedure TTcGDIButtonInitAppearance ( A : TTcGDIButton ) ;
begin

  with A do
    begin
    Appearance.BorderColor            := clGray    ;
    Appearance.BorderColorHot         := clGray    ;
    Appearance.BorderColorDisabled    := clSilver  ;
    Appearance.Color                  := clSilver  ;
    Appearance.ColorChecked           := 16111818  ;
    Appearance.ColorCheckedTo         := 16367008  ;
    Appearance.ColorDisabled          := clWhite   ;
    Appearance.ColorDisabledTo        := clSilver  ;
    Appearance.ColorDown              := clGray    ;
    Appearance.ColorDownTo            := clSilver  ;
    Appearance.ColorHot               := clSilver  ;
    Appearance.ColorHotTo             := clGray    ;
    Appearance.ColorMirrorHot         := clSilver  ;
    Appearance.ColorMirrorHotTo       := clGray    ;
    Appearance.ColorMirrorDown        := 16102556  ;
    Appearance.ColorMirrorDownTo      := 16768988  ;
    Appearance.ColorMirrorChecked     := 16102556  ;
    Appearance.ColorMirrorCheckedTo   := 16768988  ;
    Appearance.ColorMirrorDisabled    := clWhite   ;
    Appearance.ColorMirrorDisabledTo  := clSilver  ;
    Appearance.Gradient               := ggRadial  ;
    Appearance.GradientMirror         := ggRadial  ;
    end;

end;

constructor T_FormDialog.Create(AOwner: TComponent);
begin
  inherited;
  for var x := 0 to ControlCount - 1 do
    if Controls[ x ] is TTcGDIButton then
      TTcGDIButtonInitAppearance ( Controls[ x ] as TTcGDIButton ) ;
end;

procedure T_FormDialog.FormResize(Sender: TObject);
begin
  inherited;
//erro do flick de tela ::  _pnlForm.Repaint ;
end;

procedure T_FormDialog.FormShow(Sender: TObject);
begin
  inherited;
  if not ( fsModal in FormState ) then
    begin
       _pnlForm.BorderWidth := 0 ;
//       _pnlForm.OnPaint     := nil ;
    end ;
end;


procedure T_FormDialog.InitAppearance;
begin
  exit ;
  for var x := 0 to ComponentCount - 1 do
    if Components[ x ] is TTcGDIButton then
      TTcGDIButtonInitAppearance ( Components[ x ] as TTcGDIButton ) ;
end;

procedure T_FormDialog.Loaded;
begin
  inherited;
//  FOldBorderStyle := BorderStyle ;
//  BorderStyle := bsNone ;
  InitAppearance;
end;

procedure T_FormDialog._pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ReleaseCapture;
  SendMessage( Handle, WM_SYSCOMMAND, 61458, 0);
end;

procedure T_FormDialog._imgCloseButtonClick(Sender: TObject);
begin
  inherited;
//   if ( fsModal in FormState ) then
     Close
//  else
//     PostMessage( Application.MainForm.Handle, WM_CLOSE, 0, 0 ) ;
end;

procedure T_FormDialog._imgCloseButtonMouseEnter(Sender: TObject);
begin
  inherited;
  with TJvImage ( Sender ).Picture do
    begin
//      ApplResources.ApplIcons.GetBitmap( 153, Bitmap ) ;
//      Assign ( Bitmap  ) ;
    end ;
  inherited;
end;

procedure T_FormDialog._imgCloseButtonMouseLeave(Sender: TObject);
begin
  inherited;
  with TJvImage ( Sender ).Picture do
    begin
//      ApplResources.ApplIcons.GetBitmap( 152, Bitmap ) ;
//      Assign ( Bitmap  ) ;
    end ;
end;

procedure T_FormDialog._pnlFooterPaint(Sender: TObject);
begin
//  with TJvPanel ( Sender ) do
//   Gradient(  Canvas, ClientRect, FToColor, FToColor, FFromColor ) ;
end;

const
  sc_DragMove    = $f012;

  sc_Leftsize    = $f001;
  sc_Rightsize   = $f002;
  sc_Upsize      = $f003;
  sc_UpLeftsize  = $f004;
  sc_UpRightsize = $f005;
  sc_Dnsize      = $f006;
  sc_DnLeftsize  = $f007;
  sc_DnRightsize = $f008;

  sc_Minimize    = $f020;
  sc_Maximize    = $f030;


procedure T_FormDialog._pnlFormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ReleaseCapture;
  if ( y < 4 ) then
      Perform (wm_SysCommand, sc_UpSize, 0)
  else if ( y > (TJvPanel ( Sender ).ClientHeight-4) ) then
      Perform (wm_SysCommand, sc_DnSize, 0)
  else if x < 4 then
      Perform (wm_SysCommand, sc_LeftSize, 0)
  else if  x >(TJvPanel ( Sender ).ClientWidth-4) then
      Perform (wm_SysCommand, sc_RightSize, 0) ;
end;

procedure T_FormDialog._pnlFormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if ( y < 4 ) then
    TJvPanel ( Sender ).Cursor := crSizeNS
  else if ( y > (TJvPanel ( Sender ).ClientHeight-4) ) then
    TJvPanel ( Sender ).Cursor := crSizeNS
  else if x < 4 then
    TJvPanel ( Sender ).Cursor := crSizeWE
  else if  x >(TJvPanel ( Sender ).ClientWidth-4) then
    TJvPanel ( Sender ).Cursor := crSizeWE
  else
    TJvPanel ( Sender ).Cursor := crArrow;

end;

procedure T_FormDialog._pnlFormPaint(Sender: TObject);
var
  r : TRect ;
begin
  inherited;
  if Assigned ( Parent ) then
     exit ;

  r := TJvPanel ( Sender ).ClientRect ;
  TJvPanel ( Sender ).Canvas.Pen.Color := $008B7563 ;
  TJvPanel ( Sender ).Canvas.Brush.Color := $008B7563 ;
  TJvPanel ( Sender ).Canvas.FrameRect( r );
  InflateRect ( r, -1, -1 ) ;
  TJvPanel ( Sender ).Canvas.FrameRect( r );
  InflateRect ( r, -1, -1 ) ;
  TJvPanel ( Sender ).Canvas.FrameRect( r );

end;

initialization
  RegisterClass ( T_FormDialog ) ;
end.
