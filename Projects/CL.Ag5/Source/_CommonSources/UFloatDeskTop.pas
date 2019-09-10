unit UFloatDeskTop;

//{$D+}

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ExtCtrls, JvPanel, DockedDeskTop, Tabs,
  DockTabSet, VCL.Buttons, VirtualTrees, VCL.ActnList, VCL.StdCtrls,
  Tc.MP.XPBar, VCL.ImgList, pngimage, JvExExtCtrls, JvExtComponent,
  Tc.VCL.Application,
  Tc.VCL.Dialogs,
  Tc.VCL.Form , TeamViewerMon, System.Actions, System.ImageList,
  CL.Ag5.NSMsgs, JvClock,
  Tc.RTL.Exceptions ;

type


  TTreeMenuRecord = record
    Caption   : string ;
    ClassName : string ;
    Method    : TNotifyEvent ;
    Action    : TAction ;
    Dockable  : boolean ;
    CheckLicense : boolean ;
  end;

type
  THideFloatMenuThread = class(TThread)
  private
    FSyncProc: TThreadMethod;
    procedure SetSyncProc(const Value: TThreadMethod);
    { Private declarations }
  protected
    property SyncProc : TThreadMethod  read FSyncProc write SetSyncProc;
    procedure Execute; override;
  end;


{ THideFloatMenuThread }

  PTreeMenuRecord = ^TTreeMenuRecord ;

  TModuleDesktopBase = class(TTcForm)
    PanelMenu: TPanel;
    DockTabSet: TDockTabSet;
    FloatMenuSpeedButton: TSpeedButton;
    ActionListFloatMenu: TActionList;
    ActFloatMenu: TAction;
    ImagePlus: TImage;
    ImageMinus: TImage;
    TreeMenuPanel: TJvPanel;
    ClientAreaPanel: TPanel;
    vt : TVirtualStringTree ;
    lblModuloTitle: TLabel;
    ImageListRoollImage: TImageList;
    _PanelSuporte: TPanel;
    ImageSuporte: TImage;
    lblSuporte_ID: TLabel;
    lblSuporte_Status: TLabel;
    lblSuporte_Fone: TLabel;
    _SupporteConnect: TLabel;
    _SupporteConnectImg : TImage;
    lblSuporte_Info: TLabel;
    _pnlMessages: TJvPanel;
    _ClockDisplay: TJvClock;
    _pnlVersion: TJvPanel;
    pnlLogginInfo: TJvPanel;
    procedure ActFloatMenuExecute(Sender: TObject);
    procedure vtKeyPress(Sender: TObject; var Key: Char);
    procedure vtExpanded(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure _SupporteConnectClick(Sender: TObject);
    procedure vtCollapsing(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var Allowed: Boolean);
    procedure vtClick(Sender: TObject);
    procedure _pnlVersionDblClick(Sender: TObject);
    procedure _SupporteConnectMouseEnter(Sender: TObject);
    procedure _SupporteConnectMouseLeave(Sender: TObject);
    procedure vtFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    //procedure vtClick(Sender: TObject);
  private
    { Private declarations }
    FAllowCollapse : boolean ;
    AColors : TTcXPBarColors ;
    FixedMenu : boolean ;
    procedure DoNodeAction ( AFocusedNode : PVirtualNode ) ;
    procedure vtBeforeItemPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; ItemRect: TRect;
      var CustomDraw: Boolean);
    procedure CheckFloatVisible ;
    procedure SupportUpdated ( AMsg : TCLAg5NSMsg ) ;
    procedure SupportFinished ( AMsg : TCLAg5NSMsg ) ;
  private
    HideFloatMenuThread : THideFloatMenuThread ;
    FLastSelectedNode : PVirtualNode ;
    function GetItemsCount: integer;
    procedure CheckTeamViewerIsOpen;
  protected
    FClasses : array of string ;
    FDesktop : TTDIForm ;
    FLargeImageList : TImageList ;
    FSmallImageList : TImageList ;
    function AddMenuItem ( AMaster : PVirtualNode ; ACaption : string ; AClassName: string = '' ; ADockable: boolean = True ; ACheckLicense : boolean = False  ) : PVirtualNode ;
    function AddActionMenuItem ( AMaster : PVirtualNode ; AAction : TAction ; ACheckLicense : boolean = False  ) : PVirtualNode ;
    function AddMethodMenuItem ( AMaster : PVirtualNode ; ACaption : string ; AMethod : TNotifyEvent ; ACheckLicense : boolean = False  ) : PVirtualNode ;
    procedure SubScribe ;
    procedure UnSubscribe ;
    procedure ExecuteAction ( AAction : TAction );
    procedure NewForm ( AClassName : String  ; ACheckLincense : boolean = False );
    procedure ModalForm ( AClassName : String ; ACheckLincense : boolean = False );
    procedure FormSelected ( AMsg : TCLAg5NSMsg ) ;
    procedure CheckStartSuporteOnLine ;
    function  SuporteOnLine : boolean ;
    procedure SuporteShowInfo ;
    procedure SuporteHideInfo ;
    procedure OnSuporteUpdateStatus(ATVMonitor : TTVMonitor ) ;
    procedure OnSuporteEndSession ( Sender : TObject ) ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    destructor Destroy ; override ;
    function CloseAll : boolean ;
    property ItemsCount : integer read GetItemsCount;
  end;

implementation

uses ShellAPI, SysTypes, JvJCLUtils,
     //Tc.MP.XPCore, Tc.MP.XPContainer,
     TC.MP.XPCoreUtils,
     Math, Debugger ;


{$R *.dfm}

procedure THideFloatMenuThread.Execute;
begin
  while not Terminated do
    begin
       sleep ( 100 ) ;
       if Assigned ( FSyncProc ) and not Terminated then
         try
          Synchronize ( FSyncProc  ) ;
         except
         end;
    end;
end;


procedure PaintTreeItem (
   ACanvas : TCanvas ;
   ARect: TRect ;
   OwnColor : TColor ;
   FColors : TTcXPBarColors ;
   FIcon : TGraphic ;
   Caption : TCaption ;
   BiDiMode : TBiDiMode ;
   FHeaderFont : TFont ;
   FHotTrack,
   FShowRollButton  : boolean ;
   FRollImages : TCustomImageList ;
   FCollapsed : Boolean ;
   FHeaderHeight : integer ;
   FTopSpace : integer ;
   FHeaderTopRounded : Boolean ;
   FHeaderBottomRounded : Boolean ;
   Focused : boolean ;
   FGradient : TBitmap  ) ;

var
  Rect : TRect ;
  I: Integer;
  width : integer ;

  function GetRollHeight: Integer;
  begin
    if Assigned(FRollImages) then
      Result := FRollImages.Height
    else
      Result := 18;
  end;

  function GetRollWidth: Integer;
  begin
    if Assigned(FRollImages) then
      Result := FRollImages.Width
    else
      Result := 18;
  end;

  procedure DoDrawHeader({ACanvas: TCanvas; }var R: TRect);
  var
    GradientCreated : boolean ;
    tmpBitmap : TBitMap ;
  begin

    Inc(R.Top, FTopSpace);

    { draw seperator line }
    ACanvas.Pen.Color := FColors.SeparatorColor;
    DrawHLineFrom(ACanvas, R.Left, R.Top + FHeaderHeight, Width - 1 );

//    form1.Memo1.lines.add ( 'left ' + intToStr ( rect.left ) + ' width' + intToStr ( width ) ) ;

    Inc(R.Left, 10);
    if BiDiMode = bdRightToLeft then
      Inc(Rect.Right, 16)
    else
      Inc(R.Left, 4) ;

    { draw icon }

    if Assigned ( FIcon ) and  not FIcon.Empty then
    begin
      tmpBitmap := TBitMap.Create ;
      tmpBitmap.Assign( FIcon );
      tmpBitmap.Transparent := TRUE;
      if BiDiMode = bdRightToLeft then
        begin
          ACanvas.Draw(Rect.Right-FICon.Width-2, 0 + 12, tmpBitmap);
          Dec(Rect.Right, FIcon.Width+6);
        end
      else
        begin
          ACanvas.Draw(ARect.Left + 2, 1 + 12, tmpBitmap);
          Inc(Rect.Right, FIcon.Width+6);
        end;
        tmpBitmap.Free ;
    end;

    SetBkMode(ACanvas.Handle, TRANSPARENT);
    ACanvas.Font.Assign(FHeaderFont );
//--kiq    if FHotTrack and (dsHighlight in DrawState) and (FHitTest <> htNone) and (FHotTrackColor <> clNone) then
//--kiq      ACanvas.Font.Color := FHotTrackColor;
    Rect.Bottom := Rect.Top + FHeaderHeight;
    if BiDiMode = bdRightToLeft then
      JvJCLUtils.DrawText(ACanvas, Caption, -1, Rect,
        DT_SINGLELINE or DT_RTLREADING or DT_RIGHT or DT_VCENTER or DT_END_ELLIPSIS {-- show accelchar or DT_NOPREFIX})
    else
      JvJCLUtils.DrawText(ACanvas, Caption, -1, Rect,
        DT_SINGLELINE or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS {-- show accelchar or DT_NOPREFIX});

    if ( Focused ) then
       begin
         InflateRect ( Rect, -1,  -1 ) ;
         WinAPI.Windows.DrawFocusRect(ACanvas.Handle, ARect );
       end;
  end;
begin
  { get client rect }
//--kiq  ARect := GetClientRect;
  Rect := ARect ;
  width := ARect.Right - ARect.Left ;
//  form1.Memo1.lines.add ( 'on paint left ' + intToStr ( rect.left ) + ' width' + intToStr ( width ) ) ;

  if ( Focused ) then
    begin
     ACanvas.Brush.Color := clWhite ;
     ACanvas.FillRect ( ARect );
     ACanvas.Brush.Color := FColors.BodyColor;
    end ;

//--teste  DoDrawBackground({Canvas, }Rect);
  { draw header }
  DoDrawHeader({Canvas, }Rect);
  { draw visible items }
  ACanvas.Brush.Color := FColors.BodyColor;
end;


procedure TModuleDesktopBase.vtBeforeItemPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; ItemRect: TRect;
  var CustomDraw: Boolean);
const
  _MARGIN = 2 ;
var
  r : TRect ;
  TopMargin : integer ;
  BarRect, BackGround : TRect ;
  NodeLevel : integer ;
  i,b : integer ;
  Rounded : boolean ;

  procedure DrawBackGroundTree ;
  begin
   //background
   TargetCanvas.Brush.Color := TVirtualStringTree ( Sender ).Color  ;
   TargetCanvas.FillRect( ItemRect ) ;
  end;

  procedure DrawTopBorder ;
  begin
    TargetCanvas.Pen.Color := TVirtualStringTree ( Sender ).Color ; // clRed ; //AColors.BodyColor  ; TVirtualStringTree ( Sender ).Color

    Background.Left  := ItemRect.Left  + ( (NodeLevel + 2) * TVirtualStringTree ( Sender ).Indent div 2 ) - TVirtualStringTree ( Sender ).Indent + _MARGIN ;
    Background.Right := ItemRect.Right - ( (NodeLevel + 2) * TVirtualStringTree ( Sender ).Indent div 2 ) + TVirtualStringTree ( Sender ).Indent - _MARGIN ;
    DrawLineFromTo( TargetCanvas,  Background.Left,  Background.Top + TopMargin, Background.Right, Background.Top + TopMargin ); //top
    DrawLineFromTo( TargetCanvas,  Background.Left,  Background.Top + TopMargin, Background.Left,  Background.Bottom  );   //left
    DrawLineFromTo( TargetCanvas,  Background.Right, Background.Top + TopMargin, Background.Right, Background.Bottom ); //right
  end;

  procedure DrawMainNode ;
  var
    Ico : TIcon ;
    tmpBitmap : TBitMap ;
  begin
    TopMargin := 5 ;
    ico := nil ;

    if Assigned ( FLargeImageList ) and ( Node.Index < FLargeImageList.Count ) then
     begin
       ico := TIcon.Create ;
       FLargeImageList.GetIcon( Node.Index, ico  );
     end;
 //   Sender.BiDiMode

 //  if (vsExpanded in Node.States) then //top

   PaintBar (
     TargetCanvas,
     BarRect,
     TVirtualStringTree ( Sender ).Color,
     AColors,
     ico {  nil Icon},
     PTreeMenuRecord (  Sender.GetNodeData( Node ) ).Caption,
     Sender.BiDiMode,
     TVirtualStringTree ( Sender ).Header.Font,
     Node = Sender.HotNode,
     Node.ChildCount > 0,
     ImageListRoollImage, //ilMSN2 { rollimages },
     not ( vsExpanded in Node.States) { FCollapsed },
     Node.NodeHeight - TopMargin - 2, //  TopSpace = 5, Separator = 2
     TopMargin,
     Rounded {FHeaderTopRounded},
     Rounded {FHeaderBottomRounded},
     False, //vsSelected in Node.States,
     nil ) ;


   // draw header border if expanded ....
   if (vsExpanded in Node.States) then //top
     begin
      DrawTopBorder ;

      if Assigned ( ico ) then
        begin
          tmpBitmap := TBitMap.Create ;
          tmpBitmap.Assign( ico );
          tmpBitmap.Transparent := TRUE;

          // redraw icon ...
          if Sender.BiDiMode = bdRightToLeft then
            TargetCanvas.Draw(BarRect.Right - tmpBitmap.width + 1, 0, tmpBitmap)
          else
            TargetCanvas.Draw(BarRect.Left + 2, 1, tmpBitmap) ;
          tmpBitmap.free ;
          ico.free  ;
        end;
     end;

  end;

  function GetParentIndex ( N : PVirtualNode ) : integer ;
  var
    p :  PVirtualNode ;
  begin
    p := n ;
    while p <> vt.RootNode do
      begin
        Result := p.Index ;
        p := p.Parent
      end;
  end;

  procedure DrawNodes ;
  var
    SmallIcon : TIcon ;
    sg : TGraphic ;
    idx : integer ;
  begin
       SmallIcon := nil ;
       TopMargin := 2 ;
       BarRect.top    := BarRect.top    + 2 ;
       BarRect.bottom := BarRect.bottom - NodeLevel ;

   sg := nil ;
   if Node.ChildCount > 0 then
     begin
      if ( vsExpanded in Node.States) then
         sg := ImageMinus.Picture.Graphic
      else
         sg := ImagePlus.Picture.Graphic ;
     end
   else
     begin
       idx := GetParentIndex( Node ) ;
       if Assigned ( FSmallImageList ) and ( idx < FSmallImageList.Count   ) then
        begin
           SmallIcon := TIcon.Create ;
           FSmallImageList.GetIcon( idx, SmallIcon );
           SmallIcon.Transparent := True ;
           sg := SmallIcon ;
        end;
     end;

   PaintTreeItem (
     TargetCanvas,
     BarRect,
     TVirtualStringTree ( Sender ).Color,
     AColors,
     sg {  nil Icon},
     PTreeMenuRecord (  Sender.GetNodeData( Node ) ).Caption,
     Sender.BiDiMode,
     TVirtualStringTree ( Sender ).Font,
     Node = Sender.HotNode,
     Node.ChildCount > 0,
     nil, // dont need ,
     not ( vsExpanded in Node.States) { FCollapsed },
     Node.NodeHeight - TopMargin - 2, //  TopSpace = 5, Separator = 2
     TopMargin,
     Rounded {FHeaderTopRounded},
     Rounded {FHeaderBottomRounded},
     (  Assigned ( Sender.HotNode )
       and ( Node = Sender.HotNode ))
     or ( vsSelected in Node.States), //vsHot in Node.States, // vsSelected ////
     nil ) ;

   if Assigned ( SmallIcon ) then
      SmallIcon.Free ;


   if (vsExpanded in Node.States) then //top
      DrawTopBorder ;
  end;

  procedure CalculateBarAndLevel ;
  begin
   BarRect := ItemRect ;
   InflateRect ( BarRect, -_MARGIN, 0 ) ;
   NodeLevel := Sender.GetNodeLevel( Node ) ;
   BackGround := BarRect ;
   BarRect.Left  := BarRect.Left  + ( NodeLevel * TVirtualStringTree ( Sender ).Indent div 2 ) ;
   BarRect.Right := BarRect.Right - ( NodeLevel * TVirtualStringTree ( Sender ).Indent div 2 ) ;
   Rounded := ( NodeLevel = 0 ) and not (vsExpanded in Node.States) ;
  end;

begin
   CustomDraw := True ;
//   CustomDraw := False ;
//   exit ;


   DrawBackGroundTree ;
   CalculateBarAndLevel ;

   // fill background ...
   for i := 1 to NodeLevel do
     begin
//       TargetCanvas.Brush.Color := MarcaDAgua ( AColors.BodyColor, 20 * (I-1) )  ; //AColors.BodyColor  ;
       TargetCanvas.Brush.Color := AColors.BodyColor  ; //AColors.BodyColor  ;
       Background.Left  := ItemRect.Left  + ( (i + 1) * TVirtualStringTree ( Sender ).Indent div 2 ) - TVirtualStringTree ( Sender ).Indent + _MARGIN ;
       Background.Right := ItemRect.Right - ( (i + 1) * TVirtualStringTree ( Sender ).Indent div 2 ) + TVirtualStringTree ( Sender ).Indent - _MARGIN ;
       TargetCanvas.FillRect( BackGround ) ;
     end ;


   if NodeLevel = 0 then
      DrawMainNode
   else
      DrawNodes ;

   for i := 1 to NodeLevel  do
     begin
       TargetCanvas.Pen.Color := TVirtualStringTree ( Sender ).Color ; //clBlack ; //AColors.BodyColor  ;

       Background.Left  := ItemRect.Left  + ( (i + 1) * TVirtualStringTree ( Sender ).Indent div 2 ) - TVirtualStringTree ( Sender ).Indent + _MARGIN ;
       Background.Right := ItemRect.Right - ( (i + 1) * TVirtualStringTree ( Sender ).Indent div 2 ) + TVirtualStringTree ( Sender ).Indent - _MARGIN ;

       //left
       DrawLineFromTo(   TargetCanvas,  Background.Left, Background.Top -1, Background.Left, Background.Bottom - (i * (NodeLevel)) + NodeLevel + 2  );
       //right
       DrawLineFromTo(   TargetCanvas,  Background.Right, Background.Top -1, Background.Right, Background.Bottom - (i * (NodeLevel))+ NodeLevel + 2 );


//       TargetCanvas.Pen.Color := clYellow ; //AColors.BodyColor  ;

       // last node of parent ... draw bottom line .
       if (Node.index = Node.Parent.ChildCount - 1) and ( i <> NodeLevel  -1 ) then
         begin

             if ((not (vsExpanded in Node.States)) or (Node.ChildCount = 0)) then
              begin
                for b := 1 to NodeLevel - 1 do
                  if b > 0 then
                  begin

                  // TargetCanvas.Pen.Color := clNavy ; //AColors.BodyColor  ;
                   Background.Left  := ItemRect.Left  + ( (b + 2 ) * TVirtualStringTree ( Sender ).Indent div 2 ) - TVirtualStringTree ( Sender ).Indent + _MARGIN ;
                   Background.Right := ItemRect.Right - ( (b + 2 ) * TVirtualStringTree ( Sender ).Indent div 2 ) + TVirtualStringTree ( Sender ).Indent - _MARGIN ;
                   DrawLineFromTo( TargetCanvas,  Background.Left, Background.Bottom - (b * NodeLevel) + 1, Background.Right, Background.Bottom - (b * NodeLevel) + 1 );

                  end;

              end

         end;
//         end;
     end;

end;

(*
procedure TModuleDesktopBase.vtClick(Sender: TObject);
var
   Node : PVirtualNode ;
begin
   with vt.screentoclient( mouse.cursorpos ) do
     Node := vt.GetNodeAt( x, y ) ;

   if Assigned ( Node ) then
     vt.Expanded[ node ] := True ;

end;
*)
procedure TModuleDesktopBase.vtClick(Sender: TObject);
var
   Node : PVirtualNode ;
begin

   with vt.screentoclient( mouse.cursorpos ) do
     Node := vt.GetNodeAt( x, y ) ;

   if Assigned ( Node ) then
   begin
     if ( node.ChildCount > 0 ) then
        vt.ToggleNode( node )
     else
        DoNodeAction( node ) ;
   end
end;

procedure TModuleDesktopBase.vtCollapsing(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var Allowed: Boolean);
begin
Allowed := true ;
exit ;
     Allowed := not  (   Assigned ( vt.FocusedNode )
                     and Assigned ( vt.HotNode )
                     and ( vt.FocusedNode = vt.HotNode ) );
                     Allowed := True ;
end;

procedure TModuleDesktopBase.vtExpanded(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  x : integer ;
  n, ParentNode : PVirtualNode ;
begin

  vt.OnExpanded := nil ;

  n := node.PrevSibling ;
  while Assigned ( n )  do
    begin
      if (vsExpanded in n.States) then
         vt.ToggleNode( n );
      n := n.PrevSibling ;
    end;


  n := node.NextSibling ;
  while Assigned ( n )  do
    begin
      if vsExpanded in n.States then
         vt.ToggleNode( n );
      n := n.NextSibling ;
    end;


  if Assigned ( FLastSelectedNode ) then
    begin
      if ( FLastSelectedNode.Parent = vt.RootNode  ) then
        n := nil
      else
        n := FLastSelectedNode.Parent ;

     while Assigned ( n ) do
       begin
        if n = node  then
          begin
           sender.FocusedNode := FLastSelectedNode ;
           sender.selected[ sender.FocusedNode ] := True ;
           vt.OnExpanded := vtExpanded ;
           exit ;
          end ;

        if ( n.Parent = vt.RootNode  ) then
          n := nil
        else
          n := n.Parent ;

       end;
    end;

  vt.OnExpanded := vtExpanded ;

end;

procedure TModuleDesktopBase.vtFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
 Data : PTreeMenuRecord ;
begin
 Data := vt.GetNodeData( Node ) ;
 Data.Caption   := '' ;
 Data.ClassName := '' ;
 Data.Method    := nil ;
 Data.Action    := nil ;
end;

procedure TModuleDesktopBase.vtKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
   DoNodeAction ( TVirtualStringTree ( Sender ).FocusedNode )
end;

procedure TModuleDesktopBase.ActFloatMenuExecute(Sender: TObject);
begin
   if PanelMenu.Align = alLeft then
     begin
      PanelMenu.Align := alNone ;
      PanelMenu.Height := self.ClientRect.Bottom - self.ClientRect.Top  ;
     end
   else
      PanelMenu.Align := alLeft ;
end;

function TModuleDesktopBase.AddActionMenuItem(AMaster: PVirtualNode;
  AAction: TAction; ACheckLicense: boolean): PVirtualNode;
var
  Data: PTreeMenuRecord;
  idx : integer ;
begin
  Result            := VT.AddChild( AMaster ) ;
  Data              := VT.GetNodeData( Result );    //fill record values
  Data.Caption      := AAction.Caption ;            //build child node
  Data.ClassName    := '' ;
  Data.Action       := AAction ;
  Data.CheckLicense := ACheckLicense ;
  if not Assigned ( AMaster ) then
    Result.NodeHeight := VT.DefaultNodeHeight - 5 ;
  (*
  idx := Length ( FClasses ) ;
  SetLength  (FClasses, idx + 1 ) ;
  FClasses [ idx ]:= AClassName ;
  *)
end;

function TModuleDesktopBase.AddMenuItem(AMaster: PVirtualNode; ACaption : string ; AClassName: string = '' ; ADockable: boolean = True ; ACheckLicense : boolean = False ) : PVirtualNode ;
var
  Data: PTreeMenuRecord;
  idx : integer ;
begin
  Result            := VT.AddChild( AMaster ) ;
  Data              := VT.GetNodeData( Result );    //fill record values
  Data.Caption      := ACaption ;    //build child node
  Data.ClassName    := AnsiUpperCase ( AClassName ) ;
  Data.Action       := nil ;
  Data.Dockable     := ADockable  ;
  Data.CheckLicense := ACheckLicense ;
  if not Assigned ( AMaster ) then
    Result.NodeHeight := VT.DefaultNodeHeight - 5 ;

  idx := Length ( FClasses ) ;
  SetLength  (FClasses, idx + 1 ) ;
  FClasses [ idx ]:= AClassName ;
end;

function TModuleDesktopBase.AddMethodMenuItem(AMaster: PVirtualNode;
  ACaption: string; AMethod: TNotifyEvent;
  ACheckLicense: boolean): PVirtualNode;
var
  Data: PTreeMenuRecord;
  idx : integer ;
begin
  Result            := VT.AddChild( AMaster ) ;
  Data              := VT.GetNodeData( Result );    //fill record values
  Data.Caption      := ACaption ;            //build child node
  Data.ClassName    := '' ;
  Data.Method       := AMethod ;
  Data.CheckLicense := ACheckLicense ;
  if not Assigned ( AMaster ) then
    Result.NodeHeight := VT.DefaultNodeHeight - 5 ;
  (*
  idx := Length ( FClasses ) ;
  SetLength  (FClasses, idx + 1 ) ;
  FClasses [ idx ]:= AClassName ;
  *)
end;


procedure TModuleDesktopBase._pnlVersionDblClick(Sender: TObject);
var
  LForm : TForm ;
begin
    if not ( (GetKeyState(VK_SHIFT) < 0)  and (GetKeyState(VK_CONTROL) < 0) ) then
      exit ;
    LForm := TForm ( TFormClass ( GetClass ( 'TfrmDBViewer' ) ).NewInstance )  ;
    LForm.Create( nil );
    LForm.Show ;
end;

procedure TModuleDesktopBase._SupporteConnectClick(Sender: TObject);
begin
  CheckStartSuporteOnLine ;
end;

procedure TModuleDesktopBase._SupporteConnectMouseEnter(Sender: TObject);
begin
   TLabel(Sender).Color := clNavy ;
end;

procedure TModuleDesktopBase._SupporteConnectMouseLeave(Sender: TObject);
begin
   TLabel(Sender).Color := clBlack ;
end;

procedure TModuleDesktopBase.CheckFloatVisible;
begin
   if csDestroying in ComponentState then
      exit ;

   DockTabSet.Visible := PanelMenu.Align = alNone ;

   if not DockTabSet.Visible then
     begin
      PanelMenu.Visible := True ;
      exit ;
     end;

   if PanelMenu.Visible then
      PanelMenu.Visible :=
            PtInRect(PanelMenu.ClientRect, PanelMenu.ScreenToClient( Mouse.CursorPos ) )
         or PtInRect(DockTabSet.ClientRect, DockTabSet.ScreenToClient( Mouse.CursorPos ) )
   else
      PanelMenu.Visible :=
          PtInRect(DockTabSet.ClientRect, DockTabSet.ScreenToClient( Mouse.CursorPos ) ) ;

   if DockTabSet.Visible then
      PanelMenu.Left := DockTabSet.Width ;

   PanelMenu.BringToFront ;

   if PanelMenu.Visible and vt.showing then
      vt.SetFocus ;
end;

var
  InternalTVMonitor : TTVMonitor ;

procedure TModuleDesktopBase.CheckStartSuporteOnLine;
begin
 if MessageDlg( 'Iniciar suporte on-line?', mtConfirmation ) <> mrYes then
   Exit ;
 SuporteShowInfo ;
 if not SuporteOnLine then
   begin
    MessageDlg( 'Suporte remoto não iniciado.' ) ;
    SuporteHideInfo ;
   end
 else
  begin
    SupportUpdated(nil);
  end;
end;

procedure TModuleDesktopBase.CheckTeamViewerIsOpen;
var
  H : HWND ;
  temp : cardinal ;
begin
  h :=  FindWindow ( nil, 'Controle MDA - Assistência remota' ) ;
  if h = 0 then
    exit;

 SendMessageTimeout( h, WM_SYSCOMMAND ,SC_MINIMIZE ,0, SMTO_ABORTIFHUNG, 1000, temp )  ;

 with TTeamViewerMonitor.Create ( True ) do
   begin
     TVHandle := h ;
     OnCallBack := OnSuporteUpdateStatus ;
     OnEndSession := OnSuporteEndSession ;
     Start
   end;
end;

function TModuleDesktopBase.CloseAll : boolean ;
begin
  Result := FDesktop.CloseAll ;
end;

//var
//  InternalTVMonitor : TTVMonitor ;

procedure TModuleDesktopBase.OnSuporteUpdateStatus(ATVMonitor: TTVMonitor);
begin
  InternalTVMonitor := ATVMonitor ;
  TCLAg5NSMsgSupportUpdateStatus.CreateAndDispatch( self ) ;
end;

procedure TModuleDesktopBase.OnSuporteEndSession(Sender: TObject);
begin
  TCLAg5NSMsgSupportFinished.CreateAndDispatch( self ) ;
end;

procedure TModuleDesktopBase.SupportUpdated( AMsg : TCLAg5NSMsg ) ;
begin
  lblSuporte_Info.Visible     := True ;
  lblSuporte_ID.Visible       := True ;
  lblSuporte_Status.Visible   := True ;
  lblSuporte_ID.Caption       := 'ID : ' + InternalTVMonitor.EDIT_ID ;
  lblSuporte_Status.Caption   := InternalTVMonitor.TEXT_STATUS1  ;
  _SupporteConnect.Visible    := False ;
  Application.ProcessMessages ;
end;


procedure TModuleDesktopBase.SupportFinished;
begin
  SuporteHideInfo
end;

function MarcaDagua (AColor: TColor; Valor: Integer): TColor;
begin
     Result := WinAPI.Windows.RGB (
      Min ( Max( GetRValue (  AColor  ) + Valor, 0 ), 255 ),
      Min ( Max( GetGValue (  AColor  ) + Valor, 0 ), 255 ),
      Min ( Max( GetBValue (  AColor  ) + Valor, 0 ), 255 ) )
end;


constructor TModuleDesktopBase.Create(AOwner: TComponent);
var
  LStrVersion : string ;
begin
  TDebugger.WriteLine ( ClassName + 'x' ) ;
  inherited;
  TDebugger.WriteLine ( ClassName + '0' ) ;

  FDesktop := TTDIForm.Create ( self )  ;
  FDeskTop.Parent := self.ClientAreaPanel ;
  FDeskTop.ParentColor := True ;
  FDeskTop.BorderStyle := bsNone ;
  FDesktop.Name := self.Name+'__';
  FDesktop.Caption:='';

  HideFloatMenuThread := THideFloatMenuThread.Create ( False ) ;
  HideFloatMenuThread.SyncProc := self.CheckFloatVisible ;

  With FDesktop.TabSet do
    begin

      BackgroundStartColor := clWhite ;
      BackgroundStopColor := clWhite ;
      TabCloseColor := clSilver ;
    // TabStartColor := clBtnFace ;
    // TabStopColor  := clBtnFace ;
//      TabStartColor := $005C5C5C ; //SysTypes._GRADIENT_COLOR ;
//      TabStopColor  := $00E9E9E9 ;  //clWhite ;
      TabStartColor := SysTypes._GRADIENT_COLOR ;
      TabStopColor  := clWhite ;

      Font.Name     := 'Tahoma' ;
      Font.Color    := SysTypes._TITLE_FONT_COLOR ;
      Font.Size     := 8 ;

//      SelectedTabStartColor := $00E9E9E9 ;// clWhite ; //$00A47F48 ;//$008B7563 ;
//      SelectedTabStopColor  := $005C5C5C ;// SysTypes._GRADIENT_COLOR ;
      SelectedTabStartColor := clWhite ; //$00A47F48 ;//$008B7563 ;
      SelectedTabStopColor  := SysTypes._GRADIENT_COLOR ;
      SelectedFont.Name := 'Tahoma' ;
      SelectedFont.Color := SysTypes._TITLE_FONT_COLOR ;
      SelectedFont.Style := [fsBold] ;
      SelectedFont.Size := 8 ;

    end ;

  vt.Header.Font.Color := _TITLE_FONT_COLOR ;


 // FDesktop.

  if not Assigned ( AColors ) then
    begin
     AColors := TTcXPBarColors.create ; //dxWinXPBar1.Colors ; // ;TJvXPBarColors.create ;
     AColors.GradientFrom := clWhite;
     AColors.GradientTo   := SysTypes._GRADIENT_COLOR ; // TColor($00F7D7C6);
     AColors.BodyColor    := $00E4E4E4 ; //SysTypes._GRADIENT_COLOR ; //clSilver ;

     //AColors.GradientFrom := TColor($00F7D7C6);
     //AColors.GradientTo := clWhite;
    end ;
  //vt.Color := MarcaDagua ($00E4A77E, 35 ) ;
  //vt.Color := clWhite ;
  BorderStyle := bsNone ;
  Align       := alClient ;
  Color       := clWhite ;
//  PanelMenu.Align := alLeft ;

//  vt.NodeDataSize  := SizeOf ( PTreeMenuRecord ) ;
  vt.NodeDataSize  := SizeOf ( TTreeMenuRecord ) ;

  vt.OnBeforeItemPaint :=  vtBeforeItemPaint ;
  TDebugger.WriteLine ( ClassName + 'CheckFloatVisible' ) ;
  CheckFloatVisible ;

   { TODO : Remover versão fixa 94 }
    LStrVersion := 'Versão : '
    + Format ( '%d.%.3d.%.2d', [ LoggedUser.AppVersion.Version,
                   LoggedUser.AppVersion.Release,
                   LoggedUser.AppVersion.Revision ] ) ;

    LStrVersion := 'Versão : '
    + Format ( '%d.%.3d.%.2d', [ 5, 2, 03 ] ) ;

  pnlLogginInfo.Caption := {DatabaseCfgFactory.Profile +} '  |  CL-' + LoggedUser.DomainCode + ' : ' + LoggedUser.DomainName + '  |  ' + LoggedUser.Login ;
  _pnlVersion.Caption := LStrVersion ;


  CheckTeamViewerIsOpen;
end;

destructor TModuleDesktopBase.Destroy;
begin
  HideFloatMenuThread.Terminate ;
  UnSubscribe;
  inherited;
end;

procedure TModuleDesktopBase.DoNodeAction ( AFocusedNode : PVirtualNode ) ;
var
 Data : PTreeMenuRecord ;
begin
 if not Assigned ( AFocusedNode ) then
   begin
//     Memo1.Lines.Add('not focused' ) ;
     exit ;
   end;
 Data := vt.GetNodeData( AFocusedNode ) ;

 if Assigned ( Data.Method ) then
    Data.Method( self )
 else if Assigned ( Data.Action ) then
    Data.Action.ActionList.ExecuteAction( Data.Action )
 else if Data.ClassName <> '' then
   if Data.Dockable then
    self.NewForm( Data.ClassName, Data.CheckLicense )
   else
    self.ModalForm( Data.ClassName, Data.CheckLicense )

// Memo1.Lines.Add( Data.Caption + ' = ' + Data.ClassName  ) ;

end;

procedure TModuleDesktopBase.ExecuteAction(AAction: TAction);
begin
   Action.Execute ;
end;

procedure TModuleDesktopBase.FormSelected(AMsg : TCLAg5NSMsg);

   procedure DoIterate(ANode: PVirtualNode ; AClassName : string );
   var
      Node: PVirtualNode;
      LParent : PVirtualNode ;
   begin
      Node  := ANode.FirstChild;
      while Assigned(Node) do
        begin
         if PTreeMenuRecord (  vt.GetNodeData( Node ) ).ClassName = AClassName then
           begin
             vt.FullCollapse ;
             LParent := vt.NodeParent[ node ] ;
             while Assigned( LParent ) do               // rio
                begin                                   // rio
                  vt.Expanded[ LParent ] := True  ;     // rio
                  LParent := vt.NodeParent[ LParent ] ;
                end;
             vt.FocusedNode := node ;
             vt.selected[ node ] := True ;
             FLastSelectedNode := Node ;
             break ;
           end
         else
           DoIterate(Node,AClassName);
         //-- DO SOMETHING WITH NODE --//
         Node:= Node.NextSibling;
        end;
   end;

begin

   //vt.nodes

   //with NotificationService.GetMessage( Sender ) do
   //  if Assigned ( Param ) then
   //      DoIterate( vt.RootNode, AnsiUpperCase ( TObject ( Param ).ClassName ) );

   with TTcNSTDIForm( AMsg ) do
      DoIterate( vt.RootNode, AnsiUpperCase ( ClassName ) );
end;

function TModuleDesktopBase.GetItemsCount: integer;
begin
   Result := FDesktop.ItemsCount
end;

procedure TModuleDesktopBase.NewForm(AClassName: String ; ACheckLincense : boolean = False );
var
  InstanceClass: TComponentClass ;
begin

  if ACheckLincense and ( self.Application.LicenseState = lsReadOnly ) then
    begin
       ShowMessage ( 'A licença está expirada.'#13#10'O "Agenda" está em modo "somente leitura".'#13#10'Opção não disponível.' ) ;
       exit ;
    end;

  ActivateClassGroup( TControl ) ;  //Erro intermitente ?????
  InstanceClass := TComponentClass ( GetClass ( AClassName ) ) ;
  if not Assigned ( InstanceClass ) then
     raise Tc.RTL.Exceptions.Error.Create('Classe não encontrada : ' + AClassName );
  FDeskTop.NewForm ( InstanceClass ) ;
end;

procedure TModuleDesktopBase.ModalForm(AClassName: String; ACheckLincense : boolean = False );
var
  InstanceClass: TFormClass ;
begin

  if ACheckLincense and ( self.Application.LicenseState = lsReadOnly ) then
    begin
       ShowMessage ( 'A licença está expirada.'#13#10'O "Agenda" está em modo "somente leitura".'#13#10'Opção não disponível.' ) ;
       exit ;
    end;

  InstanceClass := TFormClass ( GetClass ( AClassName ) ) ;

  if not Assigned ( InstanceClass ) then
     raise Tc.RTL.Exceptions.Error.Create('Classe não encontrada : ' + AClassName );


  with InstanceClass.Create ( nil ) do
    try
       showModal ;
    finally
       free
    end;
end;

procedure TModuleDesktopBase.subScribe;
begin
  TTcNSTDIForm.Subscribe( FormSelected );
//  NotificationService.SubScribeStr ( FormSelected, FClasses ) ;
  TCLAg5NSMsgSupportUpdateStatus.Subscribe ( SupportUpdated ) ;
  TCLAg5NSMsgSupportFinished.Subscribe ( SupportFinished ) ;
end;

procedure TModuleDesktopBase.UnSubscribe;
begin
  TCLAg5NSMsg.UnSubscribe( FormSelected ) ;
  TCLAg5NSMsgSupportUpdateStatus.UnSubscribe( SupportUpdated ) ;
  TCLAg5NSMsgSupportFinished.UnSubscribe( SupportFinished );
end;

function RunAsAdmin(hWnd: hWnd; filename: string; Parameters: string): Boolean;
 { See Step 3: Redesign for UAC Compatibility (UAC)    http://msdn.microsoft.com/en-us/library/bb756922.aspx }
var
 sei: TShellExecuteInfo;
begin
 ZeroMemory(@sei, SizeOf(sei));
 sei.cbSize := SizeOf(TShellExecuteInfo);
 sei.Wnd := hWnd;
 sei.fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
 sei.lpVerb := PChar('runas');
 sei.lpFile := PChar(filename); // PAnsiChar;
 if parameters <> '' then
    sei.lpParameters := PChar(parameters); // PAnsiChar;
 sei.nShow := SW_SHOWMINNOACTIVE ; //Integer;
 Result := ShellExecuteEx(@sei);

end;


function TModuleDesktopBase.SuporteOnLine : boolean ;
var
 H : HWND ;
 Iterate : integer ;
 temp : cardinal ;
const
//  _TEAM_VIEWER = 'TcRA-idcqsehtkz.exe' ;
  _TEAM_VIEWER = 'TcRA.exe' ;
begin

   if FileExists ( 'c:\' + _TEAM_VIEWER  ) then
     begin
       if not RunAsAdmin ( self.Handle, 'c:\' + _TEAM_VIEWER, '' ) then
         exit ( False ) ;
     end
   else
    if not RunAsAdmin ( self.Handle, ExtractFilePath( ParamStr( 0 ) ) +  _TEAM_VIEWER, '' ) then
       exit ( False ) ;

 iterate := 0 ;
 H := 0 ;
 Repeat
   //h :=  FindWindow ( nil, 'CDL - Assistência remota' ) ; //GetHandle ( 'TurboCode - Assistência Remota' ) ;
   h :=  FindWindow ( nil, 'Controle MDA - Assistência remota' ) ;
   Inc ( iterate ) ;
   if h = 0 then
      sleep ( 100 ) ;
   Application.ProcessMessages ;
 Until ( H <> 0 ) OR ( Iterate = 1000 ) ;

 if ( H = 0 )  then
   exit ( False ) ;

 SendMessageTimeout( h, WM_SYSCOMMAND ,SC_MINIMIZE ,0, SMTO_ABORTIFHUNG, 1000, temp )  ;

 with TTeamViewerMonitor.Create ( True ) do
   begin
     TVHandle := h ;
     OnCallBack := OnSuporteUpdateStatus ;
     OnEndSession := OnSuporteEndSession ;
     Start
   end;

 Result := True ;

end;


procedure TModuleDesktopBase.SuporteShowInfo;
begin
 lblSuporte_Info.Visible   := False ;
 lblSuporte_ID.Caption     := '' ;
 lblSuporte_Status.Caption := 'iniciando suporte remoto' ;
 lblSuporte_ID.Visible     := True ;
 lblSuporte_Status.Visible := True ;
 _SupporteConnect.visible  := False ;
 Application.ProcessMessages ;
end;

procedure TModuleDesktopBase.SuporteHideInfo;
begin
 lblSuporte_Info.Visible     := False ;
 lblSuporte_ID.Visible       := False ;
 lblSuporte_Status.Visible   := False ;
 _SupporteConnect.visible    := True ;
 Application.ProcessMessages ;
end;

procedure THideFloatMenuThread.SetSyncProc(const Value: TThreadMethod);
begin
  FSyncProc := Value;
end;

initialization
  RegisterClass ( TModuleDesktopBase ) ;
end.
