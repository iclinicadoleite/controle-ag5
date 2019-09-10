unit Vcl.Forms.RSP13138;

interface

procedure DoNothing ;

implementation

uses System.SysUtils, System.Classes, Winapi.Windows,
     Vcl.Controls, Vcl.Graphics, Vcl.Forms,
     Tc.RTL.CodeRedirect, Tc.VCL.Form ;

type
  TCustomFormAccess = class(TCustomForm);

  TScreenHelper = class helper for TScreen
    procedure AddForm_Access(AForm: TCustomForm);
  end;

  TCustomFormHelper = class helper for TCustomForm
  protected
    procedure InitializeNewForm_RSP13138;
  end;

procedure DoNothing ;
begin
  // nop ...
end;

procedure TScreenHelper.AddForm_Access(AForm: TCustomForm);
begin
  Self.AddForm(AForm);
end;

procedure TCustomFormHelper.InitializeNewForm_RSP13138;
begin
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csSetCaption, csDoubleClicks, csPannable, csGestures];
  Left := 0;
  Top := 0;
  Width := 320;
  Height := 240;
  Self.FIcon := TIcon.Create;
  Self.FIcon.Width := GetSystemMetrics(SM_CXSMICON);
  Self.FIcon.Height := GetSystemMetrics(SM_CYSMICON);
  Self.FIcon.OnChange := Self.IconChanged;
  Self.FPosition := poDefaultPosOnly;
  Self.FCanvas := TControlCanvas.Create;
  Self.FCanvas.Control := Self;
  Self.FBorderIcons := [biSystemMenu, biMinimize, biMaximize];
  Self.FBorderStyle := bsSizeable;
  Self.FWindowState := wsNormal;
  Self.FDefaultMonitor := dmActiveForm;
  Self.FInCMParentBiDiModeChanged := False;
  Self.FPixelsPerInch := Screen.PixelsPerInch;
  Self.FGlassFrame := TGlassFrame.Create(Self);
  Self.FGlassFrame.OnChange := Self.UpdateGlassFrame;
  Self.FRefreshGlassFrame := False;
  Self.FPrintScale := poProportional;
  FloatingDockSiteClass := TWinControlClass(ClassType);
  Self.FAlphaBlendValue := 255;
  Self.FTransparentColorValue := 0;
  Visible := False;
  ParentColor := False;
  ParentFont := False;
  ParentDoubleBuffered := False;
  Ctl3D := True;
  Screen.AddForm_Access(Self);
  Self.FSnapBuffer := 10;

  {$region patched}
  if  ( ClassType = TForm )
   or ( ClassType = TTcForm )
  then begin
    Font.Height := MulDiv(
                     MulDiv(
                       MulDiv(Font.Height, 72, Font.PixelsPerInch)
                     , 96, 72
                     )
                   , Font.PixelsPerInch, 96
                   );
  end;
  {$endregion}
end;

var C: TCodeRedirect;

initialization
  C := TCodeRedirect.CreateWithMethod(@TCustomFormAccess.InitializeNewForm, @TCustomForm.InitializeNewForm_RSP13138);
finalization
  C.Free;
end.
