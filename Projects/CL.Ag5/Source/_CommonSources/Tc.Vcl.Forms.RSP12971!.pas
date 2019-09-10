unit Tc.Vcl.Forms.RSP12971;

interface

procedure DoNothing ;

implementation

uses System.SysUtils, System.Classes, Winapi.Windows,
     Vcl.Controls, Vcl.Graphics, Vcl.Forms,
     Tc.RTL.CodeRedirect, Tc.VCL.Form ;

type
  TScrollingWinControlHelper = class helper for TScrollingWinControl
    procedure ScaleScrollBars_Access(M, D: Integer);
  end;

  TCustomFormAccess = class(TCustomForm);

  TScreenHelper = class helper for TScreen
    procedure AddForm_Access(AForm: TCustomForm);
  end;

  TCustomFormHelper = class helper for TCustomForm
  protected
    procedure TWinControl_ReadState(Reader: TReader);
    procedure ReadState_RSP12971(Reader: TReader);
    procedure InitializeNewForm_RSP13138;
  end;

procedure DoNothing ;
begin
  //
end;

procedure TScrollingWinControlHelper.ScaleScrollBars_Access(M, D: Integer);
begin
  Self.ScaleScrollBars(M, D);
end;

procedure TScreenHelper.AddForm_Access(AForm: TCustomForm);
begin
  Self.AddForm(AForm);
end;

procedure TCustomFormHelper.ReadState_RSP12971(Reader: TReader);
var
  Scaled: Boolean;
  LMonitor: TMonitor;
  LCurrentPPI: Integer;
  LPos: TPoint;
  LCurrentPixelsPerInch: Integer;
  I: Integer;
  Flags: TFilerFlags;
  OldPosition: LongInt;
  IsActualForm: Boolean;
begin
  {$region 'Patched: Decide if current form is actual form'}
  OldPosition := Reader.Position;

  Reader.Position := 0;
  Reader.ReadSignature;
  Reader.ReadPrefix(Flags, I);
  IsActualForm := ClassNameIs(Reader.ReadStr);  // class name
  Reader.ReadStr;  // skip name
  Assert(OldPosition = Reader.Position, 'Unable to restore to previous position');
  {$endregion}

  DisableAlign;
  try
    Self.FClientWidth := 0;
    Self.FClientHeight := 0;
    Scaled := False;
{$IF NOT DEFINED(CLR)}
    if (ClassParent = TForm)
    or (ClassParent = TTcForm) then
      Self.FOldCreateOrder := not ModuleIsCpp;
{$ENDIF}
    TWinControl_ReadState(Reader);
    if (Self.FPixelsPerInch <> 0) then
    begin
      if CheckWin32Version(6,3) then
      begin
        LPos.X := Left + 1;
        LPos.Y := Top+ 1;
        LMonitor := Monitor(* patched *); (*Screen.MonitorFromPoint(LPos);*)
        if LMonitor <> nil then
          LCurrentPPI := LMonitor.PixelsPerInch
        else
          LCurrentPPI := Screen.PixelsPerInch;
      end
      else
        LCurrentPPI := Screen.PixelsPerInch;
      if IntPtr(FReserved) = 0 then
        LCurrentPixelsPerInch := Self.FPixelsPerInch
      else
        LCurrentPixelsPerInch := IntPtr(FReserved);
      if (LCurrentPixelsPerInch <> LCurrentPPI) or IsActualForm then
      begin
        Scaled := True;
        if sfFont in ScalingFlags then
          Font.Height := MulDiv(Font.Height, LCurrentPPI, LCurrentPixelsPerInch);
        ScaleScrollBars_Access(LCurrentPPI, LCurrentPixelsPerInch);
        ScaleConstraints(LCurrentPPI, LCurrentPixelsPerInch);
        ScaleControls(LCurrentPPI, LCurrentPixelsPerInch);
        if sfWidth in ScalingFlags then
          Self.FClientWidth := MulDiv(Self.FClientWidth, LCurrentPPI, LCurrentPixelsPerInch);
        if sfHeight in ScalingFlags then
          Self.FClientHeight := MulDiv(Self.FClientHeight, LCurrentPPI, LCurrentPixelsPerInch);
        if sfDesignSize in ScalingFlags then
        begin
          FDesignSize.X := MulDiv(FDesignSize.X, LCurrentPPI, LCurrentPixelsPerInch);
          FDesignSize.Y := MulDiv(FDesignSize.Y, LCurrentPPI, LCurrentPixelsPerInch);
        end;
        if IsActualForm (* patched *) then
          IntPtr(FReserved) := LCurrentPPI;
      end;
    end;
    if Self.FClientWidth >  0 then inherited ClientWidth := Self.FClientWidth;
    if Self.FClientHeight > 0 then inherited ClientHeight := Self.FClientHeight;
    ScalingFlags := [];
    if not Scaled then
    begin
      { Forces all ScalingFlags to [] }
      ScaleScrollBars_Access(1, 1);
      ScaleControls(1, 1);
    end;
    Perform(CM_PARENTBIDIMODECHANGED, 0, 0);
  finally
    EnableAlign;
  end;
end;

procedure TCustomFormHelper.TWinControl_ReadState(Reader: TReader);
var P: procedure (Reader: TReader) of object;
begin
  TMethod(P).Code := @TWinControl.ReadState;
  TMethod(P).Data := Self;
  P(Reader);
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

  Self.Scaled := False ;
  {$region patched}
  if InheritsFrom(TCustomForm)
  or InheritsFrom(TTcCustomForm) then
  begin
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


var
  C1: TCodeRedirect;
  C2: TCodeRedirect;

initialization
  C1 := TCodeRedirect.CreateWithMethod(@TCustomFormAccess.ReadState, @TCustomForm.ReadState_RSP12971);
  C2 := TCodeRedirect.CreateWithMethod(@TCustomFormAccess.InitializeNewForm, @TCustomForm.InitializeNewForm_RSP13138);
finalization
  C1.Free;
  C2.Free;
end.
