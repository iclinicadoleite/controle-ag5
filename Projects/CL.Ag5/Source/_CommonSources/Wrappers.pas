unit Wrappers;

{.$D-}

interface


uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics,
  Tc.RTL.Duck,
  VCL.Controls, VCL.Forms, VCL.Dialogs,
  VCL.ComCtrls, VCL.ToolWin, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.ActnList,
  Data.DB, Tc.Data.DB.Helpers, VCL.Menus, JvExExtCtrls, VCL.Mask, VCL.DBCtrls,
  JvDBDotNetControls, JvDBSpinEdit, JvPanel,
  Vcl.ActnPopup,
  Tc.VCL.Extended.Mask,
  JvExMask, JvXPBar, JvDBCombobox, JvDBLookup, JvDBControls, JvDBCheckBox, JvTypes,
  JvRichEdit, JvDBRichEdit, JvXPCore, JvXPCoreUtils, JvBaseEdits, JvMenus,
  JvToolEdit, JvComCtrls, JvDBGridSuppl, JvDBSearchEdit,
  Tc.VCL.Controls.GDIButton, Tc.VCL.StyleIntf,
  Tc.VCL.DBLookup,
  Tc.VCL.Panels,
  Tc.VCL.Edits,
  Tc.VCL.HighlightedControl,
  Tc.VCL.Edits.DBControls,
  EditHintText  ;

var
  Color : TColor = clNone ;


const
   _CTL3D = True ;

type


  TPopupMenu=class(Vcl.ActnPopup.TPopupActionBar);

//  TDBEdit = class ( TJvDotNetDBEdit ) ;
  TShape = class ( VCL.ExtCtrls.TShape )
  protected
    procedure Paint ; override ;
  end ;

  TEditHintText = class ( EditHintText.TEditHintText )
  protected
    FShape : TShape ;
    procedure Loaded ; override ;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end;

  TEdit = class ( VCL.StdCtrls.TEdit )
  protected
    FShape : TShape ;
    procedure Loaded ; override ;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end;

//  TGroupBox = class ( VCL.StdCtrls.TGroupBox )
//  protected
//    procedure Loaded ; override ;
//  end;

//  TRadioGroup = class ( VCL.ExtCtrls.TRadioGroup )
//  protected
//    procedure Loaded ; override ;
//  end;



//TDBEdit ...
//    function GetColor: TColor;
//    procedure SetColor(const Value: TColor);
//    property Color : TColor read GetColor write SetColor ;
//    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
//    FColor : TColor ;

  TDBEdit = class ( VCL.DBCtrls.TDBEdit )
  private
    LDoubleClickTime : Cardinal ;
    LGetFocusElapsedTime : Cardinal ;
    FOnEnter: TNotifyEvent;
    FOnClick : TNotifyEvent;
    FShape : TShape ;
    procedure SetOnClick(const Value: TNotifyEvent);
    procedure SetOnEnter(const Value: TNotifyEvent);
    procedure DoNewEnter( Sender : TObject );
    procedure DoNewClick( Sender : TObject );
    procedure CMExit(var Message: TCMExit);   message CM_EXIT;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  protected
    procedure Loaded ; override ;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
    property OnEnter: TNotifyEvent read FOnEnter write SetOnEnter;
    property OnClick : TNotifyEvent read FOnClick write SetOnClick;
    Constructor Create ( AOwner : TComponent )  ; override ;
  end ;

//  TPanel = class ( ExtCtrls .TPanel )
//  TPanel = class ( Tc.VCL.Panels.TTcPanel )
  TPanel = class ( JvPanel.TJvPanel )
  private
    FShowCaption: boolean;
    procedure SetShowCaption(const Value: boolean);
  protected
      procedure Loaded ; override ;
  public
     constructor Create ( AOwner : TComponent ) ; override ;
  published
     property ShowCaption : boolean  read FShowCaption write SetShowCaption;
     property StyleElements;
  end  ;

  TScrollBox = class ( VCL.Forms .TScrollBox )
  protected
      procedure Loaded ; override ;
  end  ;

  TTcGDIButton = class ( Tc.VCL.Controls.GDIButton .TTcGDIButton )
  private
    procedure InitAppearance ;
  public
    procedure Loaded ; override ;
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

  TSplitter = class( VCL.ExtCtrls.TSplitter)
  protected
    procedure Paint; override;
    procedure Loaded ; override ;
  end;



(*
  TPopupMenu = class ( TJvPopupMenu )
  protected
    procedure GetItemParams(Item: TMenuItem; State: TMenuOwnerDrawState; AFont: TFont; var Color: TColor; var Graphic: TGraphic;
      var NumGlyphs: Integer); override ;
  public
     constructor Create ( AOwner : TComponent ) ; override ;
  end  ;
*)


{
  TLabel  = class ( TStaticText )
  public
     constructor Create ( AOwner : TComponent ) ; override ;
  end  ;
}

  TJvDBUltimGrid = class ( JvDBGridSuppl.TJvDBUltimGrid ) ;

  TDBGrid = class ( TJvDBUltimGrid ) ;

  TComboBox = class ( Vcl.StdCtrls.TComboBox )
  protected
    FShape : TShape ;
    procedure Loaded ; override ;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end;

  TDBComboBox = class ( Vcl.DBCtrls.TDBComboBox )
  protected
    FShape : TShape ;
    procedure Loaded ; override ;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end;

  // BUTTON PROBLEM !!
  TJvDBComboBox = class( JvDBCombobox.TJvDBComboBox )
  private
     procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  protected
     FShape : TShape ;
     procedure Loaded ; override ;
  public
     procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
     constructor Create ( AOwner : TComponent ) ; override ;
  end  ;
                  (*
  TJvDBLookupCombo = class( JvDBLookup.TJvDBLookupCombo )
  protected
     procedure Loaded ; override ;
  end  ;
*)

  TJvDBLookupCombo = class ( JvDBLookup.TJvDBLookupCombo )
  private
   procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  protected
   FShape : TShape ;
   procedure CreateParams(var Params: TCreateParams); override ;
   procedure Loaded ; override ;
  public
   procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end;

  TDBLookupComboBox = class ( VCL.DBCtrls.TDBLookupComboBox )
  private
   procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  protected
   FShape : TShape ;
   procedure CreateParams(var Params: TCreateParams); override ;
   procedure Loaded ; override ;
  public
   procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end;

  TTcDBLookupComboBox = class ( Tc.VCL.DBLookup.TTcDBLookupComboBox )
  private
   procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  protected
   FShape : TShape ;
   procedure CreateParams(var Params: TCreateParams); override ;
   procedure Loaded ; override ;
  public
   procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end;


  TJvComboEdit = class( JvToolEdit.TJvComboEdit )
  private
     LDoubleClickTime : Cardinal ;
     LGetFocusElapsedTime : Cardinal ;
     FOnEnter: TNotifyEvent;
     FOnClick: TNotifyEvent;
     procedure _KeyPress(Sender: TObject; var Key: Char);
     procedure SetOnClick(const Value: TNotifyEvent);
     procedure SetOnEnter(const Value: TNotifyEvent);
     procedure DoNewEnter( Sender : TObject );
     procedure DoNewClick( Sender : TObject );
     procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  protected
     FShape : TShape ;
    procedure Loaded ; override ;
  public
     procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
     property OnEnter: TNotifyEvent read FOnEnter write SetOnEnter;
     property OnClick : TNotifyEvent read FOnClick write SetOnClick;
     constructor Create ( AOwner : TComponent ) ; override ;
  end  ;

  TJvDBComboEdit = class( JvDBControls .TJvDBComboEdit )
  private
     LDoubleClickTime : Cardinal ;
     LGetFocusElapsedTime : Cardinal ;
     FOnEnter: TNotifyEvent;
     FOnClick : TNotifyEvent;
     procedure SetOnClick(const Value: TNotifyEvent);
     procedure SetOnEnter(const Value: TNotifyEvent);
     procedure DoNewEnter( Sender : TObject );
     procedure DoNewClick( Sender : TObject );
     procedure _KeyPress(Sender: TObject; var Key: Char);
     procedure WMKillFocus( var message: TMessage ); message WM_KillFocus;
     procedure WMSetFocus( var message: TMessage ); message WM_SetFocus ;
     procedure WMPaint(var msg: TWMPaint); message WM_PAINT;
     procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  protected
    FShape : TShape ;
    procedure Loaded ; override ;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
     property OnEnter: TNotifyEvent read FOnEnter write SetOnEnter;
     property OnClick : TNotifyEvent read FOnClick write SetOnClick;
     constructor Create ( AOwner : TComponent ) ; override ;
  end  ;

  TTcDateEdit   = class ( Tc.VCL.Edits.TTcDateEdit )
  private
  protected
    FShape : TShape ;
    procedure Loaded ; override ;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  published
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  end ;

  TTcDBDateEdit = class ( Tc.VCL.Edits.DBControls.TTcDBDateEdit )
  protected
    FShape : TShape ;
    procedure Loaded ; override ;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end ;

  TTcDBCalcEdit = class ( Tc.VCL.Edits.DBControls.TTcDBCalcEdit )
  private
  protected
    FShape : TShape ;
    procedure Loaded ; override ;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  published
  end ;

  TTcFilenameEdit = class ( Tc.VCL.Edits.TTcFilenameEdit )
  protected
    FShape : TShape ;
    procedure Loaded ; override ;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end ;

  TTcDirectoryEdit = class ( Tc.VCL.Edits.TTcDirectoryEdit )
  protected
    FShape : TShape ;
    procedure Loaded ; override ;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end ;



  TJvDateEdit   = class ( TTcDateEdit );
  TJvDBDateEdit = class ( TTcDBDateEdit ) ;
  TJvDBCalcEdit = class ( TTcDBCalcEdit ) ;
  TJvFilenameEdit = class ( TTcFilenameEdit ) ;

  TJvDBSpinEdit = class ( JvDBSpinEdit.TJvDBSpinEdit )
  protected
    FShape : TShape ;
  public
    procedure Loaded ; override ;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end ;


  TJvDBSearchEdit = class ( JvDBSearchEdit.TJvDBSearchEdit )
  protected
    FShape : TShape ;
    procedure Loaded ; override ;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end ;

  (*
  TTcDateEdit = class ( JvToolEdit.TTcDateEdit )
  public
     constructor Create ( AOwner : TComponent ) ; override ;
  end  ;

  TTcDBDateEdit = class ( JvDBControls .TTcDBDateEdit )
  public
     constructor Create ( AOwner : TComponent ) ; override ;
  end  ;
  *)


  TDBMemo = class ( VCL.DBCtrls.TDBMemo )
  protected
     //procedure Loaded ; override ;
    FShape : TShape ;
    procedure Loaded ; override ;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  end ;

  TTcDBComboEdit = class( Tc.VCL.Edits.DBControls.TTcDBComboEdit )
  private
     procedure _KeyPress(Sender: TObject; var Key: Char);
  protected
     //procedure Loaded ; override ;
    FShape : TShape ;
    procedure Loaded ; override ;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end  ;


(*
type


  TButton = class(StdCtrls.TButton)
  private
    FBackBeforeHoverColor: TColor;
  private
    FCanvas: TCanvas;
    IsFocused: Boolean;
    FBackColor: TColor;
    FForeColor: TColor;
    FHoverColor: TColor;
    procedure SetBackColor(const Value: TColor);
    procedure SetForeColor(const Value: TColor);
    procedure SetHoverColor(const Value: TColor);

    property BackBeforeHoverColor : TColor read FBackBeforeHoverColor write FBackBeforeHoverColor;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WndProc(var Message : TMessage); override;

    procedure SetButtonStyle(Value: Boolean); override;
    procedure DrawButton(Rect: TRect; State: UINT);

    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CNMeasureItem(var Message: TWMMeasureItem); message CN_MEASUREITEM;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property BackColor: TColor read FBackColor write SetBackColor default clBtnFace;
    property ForeColor: TColor read FForeColor write SetForeColor default clBtnText;
    property HoverColor: TColor read FHoverColor write SetHoverColor default clBtnFace;
  end;

  *)


implementation

uses JvDBGrid, ShadowBox, Math, System.UITypes ;

{ TJvDBComboBox }

procedure UpdateShapeBound ( AShape : TShape ; const AXPixels : integer = 5 ; const AYPixels : integer = 5  ) ;
var
 LBoundsRect : TRect ;
begin
   if not Assigned ( AShape ) then
     exit  ;

  LBoundsRect := TWinControl ( AShape.Owner ).BoundsRect ;
  InflateRect( LBoundsRect, AXPixels, AYPixels ) ;
  AShape.BoundsRect := LBoundsRect ;

end ;

type
   TWinControlProtectedAccess = class ( TWinControl ) ;

function CreateShape( AWinControl : TWinControl ; const AXPixels : integer = 5 ; const AYPixels : integer = 5  ) : TShape ;
var
 LBoundRect : TRect ;
 y : integer ;
 LBorderStyle : TFormBorderStyle ;
begin
  if not AWinControl.Visible  then
    exit ( nil ) ;
  y := 0 ;

  if TRTTI.tryGet<TFormBorderStyle>( AWinControl, 'BorderStyle', LBorderStyle )then
     y := 5 ;

  TRTTI.trySet<TFormBorderStyle>( AWinControl, 'BorderStyle', bsNone ) ;

  AWinControl.Height := AWinControl.Height - y ;
  LBoundRect         := AWinControl.BoundsRect ;
  InflateRect( LBoundRect, AXPixels, AYPixels ) ;
  if y = 5 then
    LBoundRect.Top := LBoundRect.Top + 1
   else
    begin
      LBoundRect.Top := LBoundRect.Top - 2 ;
      LBoundRect.Bottom := LBoundRect.Bottom - 2 ;
    end ;

  Result := TShape.Create ( AWinControl ) ;
  Result.Margins.SetBounds(0,0,0,0);
  Result.Pen.Width := 1 ;
  Result.BoundsRect  := LBoundRect ;
  Result.Parent      := AWinControl.Parent ;
  Result.Pen.Color   := clSilver ;

  if Color = clNone then
    Result.Brush.Color := TWinControlProtectedAccess( AWinControl ).Color
  else
    Result.Brush.Color := Color ;

  Result.Brush.Style := TBrushStyle.bsSolid;

  Result.Shape       := stRoundRect   ;

  if y = 5 then
    AWinControl.Top := AWinControl.Top + 1
   else
    AWinControl.Top := AWinControl.Top - 2 ;

  if Result.Parent.ClassName <> 'TDBCtrlPanel' then
   with TShadowBox.create ( AWinControl.Owner ) do
     begin
        Control   := AWinControl ;
        Control2 := Result ;
     end ;

end ;


procedure TJvDBComboBox.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;
  inherited  ;
end;

constructor TJvDBComboBox.Create(AOwner: TComponent);
begin
  inherited;
  //self.DotNetHighlighting := True ;
end;

procedure TJvDBComboBox.Loaded;
begin
    inherited ;
//    self.Ctl3D := _CTL3D ;
   StyleElements:= StyleElements - [ seBorder ];
   BevelKind  := bkFlat ;
   BevelInner := bvNone ;
   BevelOuter := bvNone ;
   FShape := CreateShape( self, 5, 2 ) ;
end;

procedure TJvDBComboBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

{ TTcDBDateEdit }
(*
constructor TTcDBDateEdit.Create(AOwner: TComponent);
begin
  inherited;
  self.StartOfWeek := Sun ;
  //self.DotNetHighlighting := True ;
  self.PopupColor := clWhite ;
  self.CalendarHints.BeginUpdate ;
  self.CalendarHints.Clear ;
  self.CalendarHints.Add( 'Ano anterior' ) ;
  self.CalendarHints.Add( 'Mês anterior' ) ;
  self.CalendarHints.Add( 'Próximo mês' ) ;
  self.CalendarHints.Add( 'Próximo Ano' ) ;
  self.CalendarHints.EndUpdate ;
  self.ParentShowHint := False ;
  self.ShowHint  := True ;
end;

{ TLabel }
{
constructor TLabel.Create(AOwner: TComponent);
begin
  inherited;
  self.ShowAccelChar := False ;
  self.Transparent := False ;
end;
}
*)

{ TJvComboEdit }

procedure TJvComboEdit.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;
  inherited  ;
end;

constructor TJvComboEdit.Create(AOwner: TComponent);
begin
  inherited;
  self.ButtonWidth := 15 ;
  self.ButtonHint  := 'Pesquisar...' ;
  self.ShowHint  := True ;

  LDoubleClickTime := GetDoubleClickTime ;
  inherited OnEnter := DoNewEnter ;
  inherited OnClick := DoNewClick ;

  //self.DotNetHighlighting := True ;
  if not assigned ( self.OnKeyPress ) then
     self.OnKeyPress := _KeyPress ;
  self.ClipboardCommands := [caCopy,caCut, caPaste,caClear, caUndo] ;
end;

procedure TJvComboEdit.DoNewClick(Sender: TObject);
begin
  if AutoSelect and (GetTickCount < LGetFocusElapsedTime) then
     SelectAll ;
  if Assigned ( FOnClick ) then
     FOnClick( Sender ) ;
end;

procedure TJvComboEdit.DoNewEnter(Sender: TObject);
begin
  LGetFocusElapsedTime := GetTickCount + LDoubleClickTime;
  if Assigned ( FOnEnter ) then
     FOnEnter( Sender ) ;
end;

procedure TJvComboEdit.Loaded;
begin
  inherited;

  FShape := CreateShape( self ) ;

end ;

procedure TJvComboEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

procedure TJvComboEdit.SetOnClick(const Value: TNotifyEvent);
begin
  FOnClick := Value ;
end;

procedure TJvComboEdit.SetOnEnter(const Value: TNotifyEvent);
begin
  FOnEnter := Value ;
end;

procedure TJvComboEdit._KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     TJvComboEdit ( Sender ).DoClick ;
end;


{ TJvDBComboEdit }

procedure TJvDBComboEdit.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;

  inherited;
end;

constructor TJvDBComboEdit.Create(AOwner: TComponent);
begin
  inherited;
  self.ButtonWidth := 15 ;
  self.ButtonHint  := 'Pesquisar...' ;
  self.ShowHint  := True ;

  LDoubleClickTime := GetDoubleClickTime ;
  inherited OnEnter := DoNewEnter ;
  inherited OnClick := DoNewClick ;

  //self.DotNetHighlighting := True ;
  if not assigned ( self.OnKeyPress ) then
     self.OnKeyPress := _KeyPress ;
  ClipboardCommands := [caCopy,caCut, caPaste,caClear, caUndo]
end;

procedure TJvDBComboEdit.DoNewClick(Sender: TObject);
begin
  if AutoSelect and (GetTickCount < LGetFocusElapsedTime) then
     SelectAll ;
  if Assigned ( FOnClick ) then
     FOnClick( Sender ) ;
end;

procedure TJvDBComboEdit.DoNewEnter(Sender: TObject);
begin
  LGetFocusElapsedTime := GetTickCount + LDoubleClickTime;
  if Assigned ( FOnEnter ) then
     FOnEnter( Sender ) ;
end;

procedure TJvDBComboEdit.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end ;

procedure TJvDBComboEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

procedure TJvDBComboEdit.SetOnClick(const Value: TNotifyEvent);
begin
  FOnClick := Value ;
end;

procedure TJvDBComboEdit.SetOnEnter(const Value: TNotifyEvent);
begin
  FOnEnter := Value ;
end;

procedure TJvDBComboEdit.WMKillFocus(var message: TMessage);
begin
   Inherited ;
   Invalidate ;
end;

procedure TJvDBComboEdit.WMPaint(var msg: TWMPaint);
var
  Canvas: TCanvas;
  ps: TPaintStruct;
  CallEndPaint: Boolean;
  LText : string ;
begin

  if ( Focused ) or ( Text <> '' ) or (csPaintCopy in ControlState) then
    begin
     inherited ;
     exit ;
    end;

  CallEndPaint := False;
  Canvas:= TCanvas.Create;
  try
    if msg.DC <> 0 then
    begin
      Canvas.Handle := msg.DC;
      ps.fErase := true;
    end
    else
    begin
      BeginPaint(Handle, ps);
      CallEndPaint:= True;
      Canvas.handle := ps.hdc;
    end;
    //if ps.fErase then
      Perform(WM_ERASEBKGND, Canvas.Handle, 0);
    SaveDC(canvas.handle);
    try

      Canvas.FillRect( ClientRect );
      // draw single border....
      if not Ctl3D and ( BorderStyle = bsSingle) then
      begin
        Canvas.Brush.Color := clWindowFrame;
        Canvas.FrameRect( ClientRect );
      end;

      Canvas.Brush.Style := bsSolid;
//      Canvas.Font := Font;
      Canvas.Font.Name := 'Arial' ;
      Canvas.Font.Size := 8 ;
      Canvas.Font.Style := Canvas.Font.Style + [fsItalic] ;
      //baixo relevo
//      Canvas.Font.Color := clSilver ;
//      Canvas.TextOut(ClientRect.Left + 1, ClientRect.Top + 3, '[Localizar...]');

      LText := '[Localizar...]' ;
      if self.TextHint <> '' then
         LText := self.TextHint ;

      Canvas.Font.Color :=  clSilver ;
      Canvas.TextOut(ClientRect.Left + 2, ClientRect.Top + 2, LText );
      //auto relevo
      Canvas.Brush.Style := bsClear;
      Canvas.Font.Color := clTeal ;
      Canvas.TextOut(ClientRect.Left + 3, ClientRect.Top + 1, LText );
    finally
      RestoreDC(Canvas.Handle, - 1);
    end;
  finally
    if CallEndPaint then
      EndPaint(handle, ps);
    Canvas.Free
  end;

end;

procedure TJvDBComboEdit.WMSetFocus(var message: TMessage);
begin
   Inherited ;
   Invalidate ;
end;

procedure TJvDBComboEdit._KeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
     TJvDBComboEdit ( Sender ).DoClick ;
end;



{ TPopupMenu }
(*
constructor TPopupMenu.Create(AOwner: TComponent);
begin
  inherited;
  self.Style := msXP ;
  self.ImageSize.Width := 16 ;
  self.ImageSize.Height := 16 ;
end;

procedure TPopupMenu.GetItemParams(Item: TMenuItem;
  State: TMenuOwnerDrawState; AFont: TFont; var Color: TColor;
  var Graphic: TGraphic; var NumGlyphs: Integer);
begin
  AFont.Name := 'Verdana' ;
  AFont.Color := clBlack ;
  AFont.Size := 8 ;
  inherited;
end;
*)
{ TPanel }

constructor TPanel.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;
  ControlStyle := ControlStyle - [csParentBackground] + [csOpaque];
  self.ParentCtl3D := False ;
  self.ParentColor := False ;
  self.Ctl3D       := _CTL3D ;
  self.ParentBackground := True ;
  self.ParentBackground := False ;
//  self.Color       := FromColor ;
  self.BevelInner  :=  bvNone ;
  self.BevelOuter  :=  bvNone ;
  self.BorderStyle := bsNone ; // bsSingle ;
  self.BorderWidth := 1 ;
//  self.CreateParentedControl()
end;

procedure TPanel.Loaded;
begin
  inherited;
  ControlStyle := ControlStyle - [csParentBackground] + [csOpaque];
  self.ParentCtl3D := False ;
  self.ParentColor := False ;
  self.Ctl3D       := _CTL3D ;
  self.ParentBackground := True ;
  self.ParentBackground := False ;
//  self.Color       := FromColor ;
  self.BevelInner  :=  bvNone ;
  self.BevelOuter  :=  bvNone ;
  self.BorderStyle :=  bsNone ; // bsSingle ;
  self.BorderWidth := 1 ;
end;

procedure TPanel.SetShowCaption(const Value: boolean);
begin
  FShowCaption := Value;
end;

{ TScrollBox }

procedure TScrollBox.Loaded;
begin
  inherited;
//  self.Color       := FromColor ;
end;

constructor TTcGDIButton.Create(AOwner: TComponent );
begin
  inherited;
  InitAppearance ;
end;

procedure TTcGDIButton.InitAppearance;
begin
//  SetComponentStyle ( tsCustom ) ;

  with Appearance do
    begin

      Color := clWhite;
      ColorTo := clWhite;
      ColorMirror := clSilver;
      ColorMirrorTo := clWhite;

      ColorHot         := 16117985  ;
      ColorHotTo       := 16372402  ;
      ColorMirrorHot   := 16107693  ;
      ColorMirrorHotTo := 16775412  ;

      ColorDown         := 16111818 ;
      ColorDownTo       := 16367008 ;
      ColorMirrorDown   := 16102556 ;
      ColorMirrorDownTo := 16768988 ;

      ColorChecked         := 16111818 ;
      ColorCheckedTo       := 16367008 ;
      ColorMirrorChecked   := 16102556 ;
      ColorMirrorCheckedTo := 16768988 ;

      ColorDisabled         := 15921906 ;
      ColorDisabledTo       := 15921906 ;
      ColorMirrorDisabled   := 11974326 ;
      ColorMirrorDisabledTo := 15921906 ;

    end;

end;

procedure TTcGDIButton.Loaded ;
begin
    inherited ;
    InitAppearance ;
end ;

procedure TSplitter.Loaded;
begin
  inherited;
  if (Align in [alLeft, alRight]) then
      Width := 5
  else
    height := 5 ;
end;

procedure TSplitter.Paint;
var
  R: TRect;
  X, Y: integer;
  DX, DY: integer;
  Brush: TBitmap;
begin
  R := ClientRect;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(ClientRect);

  X := (R.Left+R.Right) div 2;
  Y := (R.Top+R.Bottom) div 2;


  if (Align in [alLeft, alRight]) then
  begin
    R.Left   := R.Left  + 2 ;
    R.Right  := R.Right - 1 ;
    R.Top    := Y - 20 ;
    R.Bottom := Y + 20 ;
    Canvas.Brush.Color := clSilver ; //$00DFDFDF ;
    Canvas.FillRect( R );
    DX := 0;
    DY := 3;
  end else
  begin
    R.Top    := R.Top    + 2 ;
    R.Bottom := R.Bottom - 1;
    R.Left  := X - 20 ;
    R.Right := X + 20 ;
    Canvas.Brush.Color := clSilver ; //$00DFDFDF ;
    Canvas.FillRect( R );
    DX := 3;
    DY := 0;
  end;
  dec(X, DX*2);
  dec(Y, DY*2);

  Brush := TBitmap.Create;
  try
    Brush.SetSize(2, 2);
    Brush.Canvas.Brush.Color := clBlack ;
    Brush.Canvas.FillRect(Rect(0,0,1,1));
    Brush.Canvas.Pixels[0, 0] := clSilver ;
    for var i := 0 to 4 do
    begin
      Canvas.Draw(X, Y, Brush);
      inc(X, DX);
      inc(Y, DY);
    end;
  finally
    Brush.Free;
  end;

end;

{ TDBEdit }

procedure TDBEdit.CMExit(var Message: TCMExit);
var Ctrl : TWinControl;
begin
  Ctrl := Screen.ActiveControl;
  if ( Assigned(Ctrl) ) and ( Ctrl.Owner = Owner ) then
  begin
    inherited;
  end;
end;

procedure TDBEdit.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;
  inherited  ;
end;

constructor TDBEdit.Create(AOwner: TComponent);
begin
  inherited;
  LDoubleClickTime := GetDoubleClickTime ;
  inherited OnEnter := DoNewEnter ;
  inherited OnClick := DoNewClick ;
//  FHighlightedControls := TTcHighlightedControl.Create ;
//  FHighlightedControls.Control   := Self ;
//  FHighlightedControls.Color     :=  inherited Color ;
//  FHighlightedControls.FontColor :=  inherited Font.Color ;
end;

//function TDBEdit.GetColor: TColor;
//begin
//  Result := FHighlightedControls.Color
//end;

//
//procedure TDBEdit.SetColor(const Value: TColor);
//begin
//  FHighlightedControls.Color := Value ;
//end;
(*
procedure TDBEdit.WMPaint(var Message: TWMPaint);
var
  DataLinkActive, FieldRequired : boolean ;
begin

  DataLinkActive := Assigned ( Field ) and Field.DataSet.Active ;
  FieldRequired  := Assigned ( Field ) and Field.Required ;

  // background
  if ( FHighlightedControls.FixedColor <> clNone ) then
    inherited Color := FHighlightedControls.FixedColor
  else if not ( DataLinkActive and Enabled ) then
    inherited Color := FHighlightedControls.InactiveColor
  else if Focused then
    inherited Color := FHighlightedControls.FocusedColor
  else if FieldRequired then
    inherited Color := FHighlightedControls.RequiredColor
  else if ReadOnly then
    inherited Color := FHighlightedControls.ReadOnlyColor
  else
    inherited Color := FHighlightedControls.Color ;

  // font
  if ( FHighlightedControls.FixedFontColor <> clNone ) then
    inherited Font.Color := FHighlightedControls.FixedFontColor
  else if not ( DataLinkActive and Enabled ) then
    inherited Font.Color := FHighlightedControls.InactiveFontColor
  else if Focused then
    inherited Font.Color := FHighlightedControls.FocusedFontColor
  else if FieldRequired then
    inherited Font.Color := FHighlightedControls.RequiredFontColor
  else if ReadOnly then
    inherited Font.Color := FHighlightedControls.ReadOnlyFontColor
  else
    inherited Font.Color := FHighlightedControls.FontColor ;

  inherited ;
end;
*)

procedure TDBEdit.DoNewClick( Sender : TObject );
begin
  if AutoSelect and (GetTickCount < LGetFocusElapsedTime) then
     SelectAll ;
  if Assigned ( FOnClick ) then
     FOnClick( Sender ) ;
end;

procedure TDBEdit.DoNewEnter( Sender : TObject );
begin
  LGetFocusElapsedTime := GetTickCount + LDoubleClickTime;
  if Assigned ( FOnEnter ) then
     FOnEnter( Sender ) ;
end;

procedure TDBEdit.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end ;

procedure TDBEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

procedure TDBEdit.CMColorChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Brush.Color := Color ;
  inherited ;
end;

procedure TDBEdit.SetOnClick(const Value: TNotifyEvent);
begin
  FOnClick := Value;
end;

procedure TDBEdit.SetOnEnter(const Value: TNotifyEvent);
begin
  FOnEnter := Value;
end;

{ TTcDBComboEdit }

constructor TTcDBComboEdit.Create(AOwner: TComponent);
begin
  inherited;
  self.ButtonWidth := 15 ;
  self.ButtonHint  := 'Pesquisar...' ;
  self.ShowHint  := True ;

//  LDoubleClickTime := GetDoubleClickTime ;
//  inherited OnEnter := DoNewEnter ;
//  inherited OnClick := DoNewClick ;

  //self.DotNetHighlighting := True ;
  if not assigned ( self.OnKeyPress ) then
     self.OnKeyPress := _KeyPress ;

  ClipboardCommands := [
    Tc.VCL.Extended.Mask.caCopy,
    Tc.VCL.Extended.Mask.caCut,
    Tc.VCL.Extended.Mask.caPaste,
    Tc.VCL.Extended.Mask.caClear,
    Tc.VCL.Extended.Mask.caUndo   ]
end;
(*
procedure TTcDBComboEdit.Loaded;
begin
  inherited;
  if not assigned ( self.OnKeyPress ) then
     self.OnKeyPress := _KeyPress ;
end;
*)



procedure TTcDBComboEdit.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end ;

procedure TTcDBComboEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

procedure TTcDBComboEdit._KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     TTcDBComboEdit ( Sender ).DoClick ;
end;

{ TTcDateEdit }

procedure TTcDateEdit.CMColorChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Brush.Color := Color ;
  inherited  ;
end;


procedure TTcDateEdit.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;
  inherited  ;
end;

procedure TTcDateEdit.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end;

procedure TTcDateEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;


{ TTcDBDateEdit }

procedure TTcDBDateEdit.CMColorChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Brush.Color := Color ;
  inherited  ;
end;

procedure TTcDBDateEdit.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;
  inherited  ;
end;

procedure TTcDBDateEdit.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end;

procedure TTcDBDateEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

{ TTcDBCalcEdit }

procedure TTcDBCalcEdit.CMColorChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Brush.Color := Color ;
  inherited  ;
end;


procedure TTcDBCalcEdit.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;
  inherited  ;
end;

procedure TTcDBCalcEdit.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end;

procedure TTcDBLookupComboBox.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;
  inherited  ;
end;

procedure TTcDBLookupComboBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  with Params do
    if NewStyleControls and Ctl3D then
      ExStyle := ExStyle - WS_EX_CLIENTEDGE
    else
      Style := Style - WS_BORDER;
end;


procedure TJvDBLookupCombo.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;
  inherited  ;
end;

procedure TJvDBLookupCombo.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  with Params do
    if NewStyleControls and Ctl3D then
      ExStyle := ExStyle - WS_EX_CLIENTEDGE
    else
      Style := Style - WS_BORDER;
end;


procedure TJvDBLookupCombo.Loaded;
begin
  inherited;
  FShape := CreateShape( self, 5, 2 ) ;
end;

procedure TTcDBCalcEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;


{ TDBLookupComboBox }

procedure TDBLookupComboBox.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;
  inherited  ;
end;

procedure TDBLookupComboBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  with Params do
    if NewStyleControls and Ctl3D then
      ExStyle := ExStyle - WS_EX_CLIENTEDGE
    else
      Style := Style - WS_BORDER;
end;

procedure TDBLookupComboBox.Loaded;
begin
  inherited;
  FShape := CreateShape( self, 5, 2 ) ;
end;

procedure TDBLookupComboBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

{ TComboBox }

procedure TComboBox.Loaded;
begin
  inherited;
  StyleElements:= StyleElements - [ seBorder ];
  BevelKind  := bkFlat ;
  BevelInner := bvNone ;
  BevelOuter := bvNone ;
  FShape := CreateShape( self, 5, 2 ) ;
end;

procedure TComboBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

{ TDBComboBox }

procedure TDBComboBox.Loaded;
begin
  inherited;
  StyleElements:= StyleElements - [ seBorder ];
  BevelKind  := bkFlat ;
  BevelInner := bvNone ;
  BevelOuter := bvNone ;
  FShape := CreateShape( self, 5, 2 ) ;
end;

procedure TTcDBLookupComboBox.Loaded;
begin
  inherited;
  FShape := CreateShape( self, 5, 2 ) ;
end;

procedure TTcDBLookupComboBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

procedure TDBComboBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

{ TEdit }

procedure TEdit.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end;

procedure TEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

(*
{ TRadioGroup }

procedure TRadioGroup.Loaded;
begin
  inherited;
  FShape := CreateShape( self, 0, 0 ) ;
end;

{ TGroupBox }

procedure TGroupBox.Loaded;
begin
  inherited;
  FShape := CreateShape( self, 0, 0 ) ;
end;
*)

procedure TJvDBLookupCombo.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

{ TDBMemo }

procedure TDBMemo.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end;

procedure TDBMemo.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

{ TTcFilenameEdit }

procedure TTcFilenameEdit.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;
  inherited  ;
end;

procedure TTcFilenameEdit.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end;

procedure TTcFilenameEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

{ TTcDirectoryEdit }

procedure TTcDirectoryEdit.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned ( FShape ) then
    FShape.Visible := Visible ;
  inherited  ;
end;

procedure TTcDirectoryEdit.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end;

procedure TTcDirectoryEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

{ JvDBSpinEdit1 }

procedure TJvDBSpinEdit.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end;

procedure TJvDBSpinEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

{ TJvDBSearchEdit }

procedure TJvDBSearchEdit.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end;

procedure TJvDBSearchEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;



{ TScrollBox }


(*
{ TGroupBox }

procedure TGroupBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  if Assigned ( FOnResize  ) then
     FOnResize ( self ) ;
end;

procedure TGroupBox.SetOnResize(const Value: TNotifyEvent);
begin
  FOnResize := Value;
end;
*)


   (*
  TGroupBox = class ( VCL.StdCtrls.TGroupBox )
  private
    FOnResize: TNotifyEvent;
    procedure SetOnResize(const Value: TNotifyEvent);
  protected
     procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override ;
  public
     property OnResize : TNotifyEvent  read FOnResize write SetOnResize;
  end;
  *)


{ TEditHintText }

procedure TEditHintText.Loaded;
begin
  inherited;
  FShape := CreateShape( self ) ;
end;

procedure TEditHintText.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  UpdateShapeBound ( FShape ) ;
end;

{ TShape }


procedure TShape.Paint;
var
  X, Y, W, H, S: Integer;
begin
  with Canvas do
  begin
    Pen := self.Pen;
    Brush := self.Brush;
    X := Pen.Width div 2;
    Y := X;
    W := Width - Pen.Width + 1;
    H := Height - Pen.Width + 1;
    if Pen.Width = 0 then
    begin
      Dec(W);
      Dec(H);
    end;
    if W < H then S := W else S := H;
    if self.Shape in [stSquare, stRoundSquare, stCircle] then
    begin
      Inc(X, (W - S) div 2);
      Inc(Y, (H - S) div 2);
      W := S;
      H := S;
    end;
    case self.Shape of
      stRectangle, stSquare:
        Rectangle(X, Y, X + W, Y + H);
      stRoundRect, stRoundSquare:

        //RoundRect(X, Y, X + W, Y + H, S div (4*LFator), S div (4*LFator));
        RoundRect(X, Y, X + W, Y + H, 8, 8);
      stCircle, stEllipse:
        Ellipse(X, Y, X + W, Y + H);
    end;
  end;
end;

end.


