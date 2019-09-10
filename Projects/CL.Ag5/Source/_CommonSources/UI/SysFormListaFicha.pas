// Project      : TurboCode - Módulos Prime
// Sub-Project  : System Interface
// Module       : DBControls - Forms
// Funcionality : Select List, Edit record
// License      : veja readme.txt



unit SysFormListaFicha;

interface

{.$I Tc.MP.inc}

uses
  WinApi.Windows, WinApi.Messages, VCL.Graphics, VCL.Forms, VCL.Menus, VCL.ComCtrls, VCL.ToolWin, VCL.StdCtrls, VCL.Buttons,
  VCL.Mask, JvExMask, JvToolEdit, VCL.ExtCtrls, VCL.Controls, VCL.Grids, VCL.DBGrids, JvTypes,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, System.Classes, VCL.ActnList, DBForm,
  UdtmSYS_BASE, UdtmSYS_BASEDBListEdit, System.SysUtils,
  JvExExtCtrls, JvImage, JvExtComponent, Tc.VCL.Dialogs,
  JvDBGridSuppl, VCL.ImgList, Tc.VCL.Graphics, DBClient,
  Tc.VCL.Form, Tc.VCL.FormIntf, System.Actions, System.ImageList, Tc.VCL.Application,
  uImageListProvider, SysCommonResources, Wrappers ;


type

  TNotifyScrollInView =  procedure ( AControl: TControl ; var Accept : boolean ) of object ;

  TScrollBox = class ( VCL.Forms.TScrollBox )
  private
    FOnScrollInView: TNotifyScrollInView;
    procedure SetOnScrollInView(const Value: TNotifyScrollInView);
  protected
   procedure AutoScrollInView(AControl: TControl); override ;
  public
   property OnScrollInView : TNotifyScrollInView  read FOnScrollInView write SetOnScrollInView;
  end;

  TFormLayout = ( flLayoutAba, flLayoutDual, flLayoutModal ) ;

  TJvDBUltimGrid = class ( JvDBGridSuppl.TJvDBUltimGrid ) ;

  T_FormListaFicha = class(T_DBForm, ITcDataForm, ITcQuerySaveChanges )
    _ToolBar: TToolBar;
    _pageControl: TPageControl;
    _tbsLista: TTabSheet;
    _tbsFicha: TTabSheet;
    _dbgLista: TJvDBUltimGrid;
    _ToolButtonNew: TToolButton;
    _ToolButtonEdit: TToolButton;
    _ToolButtonDelete: TToolButton;
    _pnlSearch: TPanel;
    _ToolButtonSeparator1: TToolButton;
    _ScrollBoxFicha: TScrollBox;
    _ToolButtonPrint: TToolButton;
    _ToolButtonOther: TToolButton;
    _ToolButtonSeparator3: TToolButton;
    _actPrint: TAction;
    _actOther: TAction;
    dtsLista: TDataSource;
    _ToolButtonSeparator0: TToolButton;
    _actFirst: TAction;
    _actPrior: TAction;
    _actNext: TAction;
    _actLast: TAction;
    _popMenuPrint: TPopupMenu;
    _ImprimirLista: TMenuItem;
    _actPrintLista: TAction;
    _pnlToolButtons: TPanel;
    _popMenuOther: TPopupMenu;
    _pnlFicha: TPanel;
    _AtualizarLista: TMenuItem;
    _actRefresh: TAction;
    _edtSearch: TJvComboEdit;
    _lblPesquisas: TLabel;
    _actLista: TAction;
    _actFicha: TAction;
    _imageBottom: TImage;
    _pnlScroll: TPanel;
    _ToolButtonSave: TToolButton;
    _ToolButtonCancel: TToolButton;
    _ToolButtonSeparator2: TToolButton;
    ToolButton1: TToolButton;
    _ToolButtonSeparator4: TToolButton;
    _ToolButtonHelp: TToolButton;
    actHelp: TAction;
    _pnldbgLista: TPanel;
    ToolBarIcons: TImageListProvider;
    procedure _actPrintListaExecute(Sender: TObject);
    procedure _actPrintUpdate(Sender: TObject);
    procedure _actPrintExecute(Sender: TObject);
    procedure _actNavigateExecute(Sender: TObject);
    procedure _actNavigateUpdate(Sender: TObject);
    procedure _actOtherExecute(Sender: TObject);
    procedure _actOtherUpdate(Sender: TObject);
    procedure _dbgListaKeyPress(Sender: TObject; var Key: Char);
    procedure _dbgListaDblClick(Sender: TObject);
    procedure ActiveLista ;
    procedure FormResize(Sender: TObject);
    procedure _edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure _edtSearchButtonClick(Sender: TObject);
    procedure _actListaExecute(Sender: TObject);
    procedure _popMenuPrintPopup(Sender: TObject);
    procedure _popMenuOtherPopup(Sender: TObject);
    procedure _pageControlChange(Sender: TObject);
    procedure _ToolBarAdvancedCustomDraw(Sender: TToolBar;
      const ARect: TRect; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure _actListaUpdate(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
  private
    { Private declarations }
    CommonResources : TCommonResources ;
    FFormFicha : TTcForm ;
    FFormLayout : TFormLayout ;
    FState : TDataSetState ;
    function DataSetListaActive : boolean ;
    procedure SetFormLayout(const Value: TFormLayout);
    procedure CreateFicha ;
    procedure ShowFicha ;
  protected
    function GetBOF : boolean ; override ;
    function GetEOF : boolean ; override ;
    procedure InsertRecord ; override ;
    procedure EditRecord ; override ;
    procedure Cancel ; override ;
    procedure PrintData ; override ;
    procedure OtherOptions ; override ;
    function DataSetIsEmpty : boolean ; override ;
    function  GetDatamoduleBase : T_dtmBASE ; override ;
    procedure ActiveFicha ; override ;
    procedure _imgTitleFichaMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Save ; override ;
  public
    { Public declarations }
    property FormLayout : TFormLayout read FFormLayout write SetFormLayout ;
    constructor Create ( AOwner : TComponent ) ; override ;

  end;

implementation

uses SysTypes, SysPrintGridDialog, ThreadSuppl, Math ;

{$R *.dfm}

{ T_FormListaFicha }


procedure T_FormListaFicha._actPrintExecute(Sender: TObject);
begin
  PrintData ;
end;

procedure T_FormListaFicha._actPrintListaExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( _dbgLista, Caption );
end;


procedure T_FormListaFicha._actPrintUpdate(Sender: TObject);
begin
  _actPrint.Enabled :=Assigned ( DataFormIntf ) and ( daPrint in DataFormIntf.QueryActiveDataActions ) ;
end;

procedure T_FormListaFicha._actNavigateExecute(Sender: TObject);
begin
  inherited;
  Save ;
  if TAction ( Sender )  = _actFirst then dtsLista.DataSet.First ;
  if TAction ( Sender )  = _actPrior then dtsLista.DataSet.Prior ;
  if TAction ( Sender )  = _actNext  then dtsLista.DataSet.Next  ;
  if TAction ( Sender )  = _actLast  then dtsLista.DataSet.Last  ;
end;



procedure T_FormListaFicha._actNavigateUpdate(Sender: TObject);
begin
  inherited;
  _actFirst.Enabled := not GetBOF ;
  _actPrior.Enabled := _actFirst.Enabled ;
  _actNext.Enabled  := not GetEOF ;
  _actLast.Enabled  := _actNext.Enabled ;
end;


function T_FormListaFicha.DataSetListaActive: boolean;
begin
  Try
     Result := Assigned ( dtsLista.DataSet ) and ( dtsLista.DataSet.Active )
        and Assigned ( dtsFicha.DataSet ) and ( dtsFicha.DataSet.Active ) ;
  except
    Result := False ;
  end
end;


function T_FormListaFicha.DataSetIsEmpty: boolean;
begin
  Try
     Result := ( not DataSetListaActive ) or ( dtsLista.DataSet.IsEmpty ) ;
  except
    Result := True ;
  end
end;


function T_FormListaFicha.GetBOF: boolean;
begin
  Try
     Result := ( not DataSetListaActive ) or ( dtsLista.DataSet.BOF ) ;
  except
     Result := True ;
  end
end;

function T_FormListaFicha.GetEOF: boolean;
begin
  Try
     Result := ( not DataSetListaActive ) or ( dtsLista.DataSet.EOF ) ;
  except
     Result := True ;
  end
end;
procedure T_FormListaFicha.InsertRecord;
begin
  FState := dsInsert ;
  inherited;
end;

procedure T_FormListaFicha.OtherOptions;
begin
  _ToolButtonOther.CheckMenuDropdown ;
end;

procedure T_FormListaFicha.PrintData;
begin
  _ToolButtonPrint.CheckMenuDropdown ;
end;

procedure T_FormListaFicha.EditRecord;
begin
  FState := dsEdit ;
  inherited;
end;

{
procedure T_FormListaFicha._actSaveUpdate(Sender: TObject);
var
   Enabled : boolean ;
begin
  inherited;

  Try
     Enabled := DataSetListaActive and (( dtsFicha.DataSet.State in  [dsInsert,dsEdit] ) or ( TClientDataSet( dtsFicha.DataSet ).ChangeCount <> 0 ))
  finally
     _actSave.Enabled := Enabled ;
     _actCancel.Enabled := Enabled ;
  end ;
end;
}


procedure T_FormListaFicha._actOtherExecute(Sender: TObject);
begin
  OtherOptions ;
end;

procedure T_FormListaFicha._actOtherUpdate(Sender: TObject);
begin
  _actOther.Enabled :=Assigned ( DataFormIntf ) and ( daOther in DataFormIntf.QueryActiveDataActions ) ;
end;

procedure T_FormListaFicha._dbgListaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
    begin
      Key := #0 ;
      ActiveFicha ;
    end ;
end;

procedure T_FormListaFicha._dbgListaDblClick(Sender: TObject);
begin
  inherited;
  with ( dtsLista.DataSet ) do
    if not ( bof and eof ) then
      begin
       FState := dsEdit ;
       ActiveFicha ;
      end ;
end;

procedure T_FormListaFicha.ActiveLista;
begin
     if DataSetActive then
        Save ;

     _pageControl.ActivePage := _tbsLista ;

     if (Assigned(FDataModuleBase)) {and ( FState = dsInsert )}  then
      begin
        FDataModuleBase.Cancel;
        ClearErrorIndicator;
      end;
end;


(*
procedure T_FormListaFicha.ActiveFicha;
begin

    if Assigned ( FFormFicha ) then
      exit ;
    CreateFicha ;
    ThreadSuppl.TSyncThread.Create( ShowFicha );

end ;
*)



procedure T_FormListaFicha.actHelpExecute(Sender: TObject);
begin
  Help ;
end;

procedure T_FormListaFicha.ActiveFicha;
begin

//  ScrollWindow(_ScrollBoxFicha.Handle, 0, _ScrollBoxFicha.VertScrollBar.Position, nil, nil);

//  if  _tbsFicha.TabVisible then
     _pageControl.ActivePage := _tbsFicha ;
     //Caption := 'Ficha : ' + Self.Caption  ;


  inherited ActiveFicha ;

  _ScrollBoxFicha.VertScrollBar.Position := 0 ;

//  ScrollWindow(_ScrollBoxFicha.Handle, 0, _ScrollBoxFicha.VertScrollBar.Position, nil, nil);

end;


procedure T_FormListaFicha.FormResize(Sender: TObject);
begin
  inherited;
  if FormLayout = flLayoutDual then
     _pnlFicha.Height :=  ClientHeight div 2  ;
end;

procedure T_FormListaFicha.Save;
begin

  inherited;
  {
  _pageControl.ActivePage := _tbsLista ;
  }
end;

procedure T_FormListaFicha.SetFormLayout(const Value: TFormLayout);
begin
  FFormLayout := Value;

  if FFormLayout = flLayoutAba then
     begin

       _tbsFicha.TabVisible := True ;
       _tbsLista.TabVisible := True ;

       _pnlFicha.Parent  := _tbsFicha ;
       _pnlFicha.Align   := alClient ;

       //_Splitter.Visible := False ;
     end ;

  if FFormLayout = flLayoutDual then
     begin

       _tbsFicha.TabVisible := False ;
//       _tbsLista.TabVisible := False ;

       _pnlFicha.Parent := _tbsLista ;
       _pnlFicha.Align  := alBottom ;
       _pnlFicha.Height :=  ClientHeight div 2  ;

       //_Splitter.Top := _pnlFicha.Top - 1 ;
       _pageControl.ActivePage := _tbsLista ;
     end ;

  if FFormLayout = flLayoutModal then
     begin

       _tbsFicha.TabVisible := False ;
       _tbsLista.TabVisible := False ;

       _pnlFicha.Visible := False ;
       //_Splitter.Visible := False ;

     end ;

end;

procedure T_FormListaFicha._edtSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
//  inherited;
  if Key = #13 then
     TJvComboEdit ( Sender ).DoClick ;
end;

procedure T_FormListaFicha._edtSearchButtonClick(Sender: TObject);
begin
  Pesquisar ;
end;


procedure T_FormListaFicha._actListaExecute(Sender: TObject);
begin
  inherited;
  ActiveLista ;
end;

procedure T_FormListaFicha._actListaUpdate(Sender: TObject);
begin
  inherited;
  if not Assigned ( DataFormIntf )  then
    _actLista.Enabled := DataSetActive and ( _PageControl.ActivePage <> _tbsLista )
  else
    _actLista.Enabled := DataSetActive and ( _PageControl.ActivePage <> _tbsLista ) and not (daSave in DataFormIntf.QueryActiveDataActions) ;
end;

procedure T_FormListaFicha._popMenuPrintPopup(Sender: TObject);
begin
  inherited;
  Save ;
end;

procedure T_FormListaFicha._popMenuOtherPopup(Sender: TObject);
begin
  inherited;
  Save;
end;

function T_FormListaFicha.GetDatamoduleBase: T_dtmBASE ;
begin
  if not Assigned ( FDatamoduleBase ) then
     begin
        GetDefultDataModuleBase ;

        if Assigned ( FDatamoduleBase  ) then
           begin
             dtsLista.DataSet  := FDatamoduleBase.ClientDataSet ;
             dtsFicha.DataSet  :=  T_dtmBASEDBListEdit ( FDatamoduleBase ).ClientDataSetEDIT ;
             InternalDataSource.DataSet := dtsFicha.DataSet ;
           end ;
     end ;

  Result := FDatamoduleBase ;
end;

procedure T_FormListaFicha._pageControlChange(Sender: TObject);
begin
  inherited;
  if _pageControl.ActivePage = _tbsFicha then
     ActiveFicha ;
end;

procedure T_FormListaFicha._ToolBarAdvancedCustomDraw(Sender: TToolBar;
  const ARect: TRect; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  b : TBitmap ;
  bs : TBitmap ;
  SourceRect : TRect ;
begin
//  Tc.VCL.Graphics.cyGradientFill(Sender.Canvas, Rect(0,0, ARect.Right, _ImageBottom.Height ), SysTypes._GRADIENT_COLOR, clWhite, dgdVertical, 60, bmMirror, 255, 100);


 SourceRect := ARect ;

 SourceRect.Left   := SourceRect.Left  + Sender.Left ;
 SourceRect.Right  := SourceRect.Right + Sender.Left ;
 SourceRect.Top    := SourceRect.Top + 1 ;
 SourceRect.Bottom := SourceRect.Bottom - 1 ;

 b := TBitMap.create ;
 b.Width  := ARect.Right  - ARect.Left ;
 b.Height := ARect.Bottom - ARect.Top ;

 bs := TBitMap.create ;
 bs.Width  := _ImageBottom.Width ;
 bs.Height := _ImageBottom.Height ;

 bs.Canvas.StretchDraw(Rect( 0,0, bs.Width, bs.Height ), _ImageBottom.Picture.Graphic);

 b.Canvas.CopyRect( ARect, bs.Canvas, SourceRect );
 Sender.Canvas.Draw( 0, 0, b );
 bs.free ;
 b.free ;



 // Tc.MP.Graphics.cyGradientFill(Sender.Canvas, ARect, SysTypes._GRADIENT_COLOR, clWhite, dgdVertical, 60, bmMirror, 255, 100);
//  Tc.VCL.Graphics.cyGradientFill(Sender.Canvas, Rect(0,0, ARect.Right, _ImageBottom.Height ), SysTypes._GRADIENT_COLOR, clWhite, dgdVertical, 60, bmMirror, 255, 100);
// Sender.Canvas.Draw( 0, 0, _ImageToolBar.Picture.Graphic );

//  inherited;
//  Gradient(  Sender.Canvas, ARect, FromColor, MiddleColor, ToColor ) ;
//   Gradient(  Sender.Canvas, ARect, ToColor, FromColor ) ;
end;


procedure T_FormListaFicha.Cancel;
begin
  if ( FState = dsInsert ) then
    begin
       if (MessageDlg ( 'Cancelar a inclusão ?', mtConfirmation, [mbYes, mbNo] ) <> mrYes) then
         exit ;
       if Assigned ( FFormFicha ) then
          FFormFicha.ModalResult := mrCancel ;

       if Assigned(dtsFicha.DataSet) then
        begin
         TClientDataSet(dtsFicha.DataSet).CancelUpdates ;
         Exit;
        end;
    end
  //else if (MessageDlg ( 'Cancelar a alterações ?', mtConfirmation, [mbYes, mbNo] ) <> mrYes) then
  //  exit ;
  else
   begin
     if (MessageDlg ( 'Cancelar a alterações ?', mtConfirmation, [mbYes, mbNo] ) <> mrYes) then
       exit ;

     if Assigned(dtsFicha.DataSet) then
      begin
        TClientDataSet(dtsFicha.DataSet).CancelUpdates ;
        Exit;
      end;
   end;
  inherited;

end;

constructor T_FormListaFicha.Create(AOwner: TComponent);
begin
 inherited Create ( AOwner ) ;

 CommonResources := GetCommonResources ; //TCommonResources.Create ( nil ) ;
 ToolBarIcons.Source := CommonResources.ToolBarIcons ;

  _edtSearch.ClipboardCommands := [caCopy,caCut, caPaste,caClear, caUndo] ;

 _pnlToolButtons.Margins.SetBounds(0,0,0,0) ;
 _ToolBar.Top := 2 ;

 if csDesigning in ComponentState then
    if not InitInheritedComponent(Self, T_FormListaFicha) then
       raise EResNotFound.CreateFmt('Resource %s not found', [ClassName]);
//  _pageControl.ActivePage := _tbsLista ;

//  Tc.VCL.Graphics.cyGradientFill(_ImageBottom.Canvas, Rect(0,0, _ImageBottom.Width, _ImageBottom.Height ), SysTypes._GRADIENT_COLOR, clWhite, dgdVertical, 60, bmMirror, 255, 100);

  _tbsLista.TabVisible := False ;
  _tbsFicha.TabVisible := False ;
//  _pnlScroll.Align := alTop ;

  _dbgLista.ShowHighlighter := True ;
  Self.ActiveLista ;

end;

procedure T_FormListaFicha.CreateFicha;
var
  Title : String ;
  PanelBorder : TPanel ;

begin

   if Copy ( Title, Length ( Title ), 1 ) = 's' then
      Title := Copy ( Title, 1, Length ( Title ) -1  ) ;

   FFormFicha := TTcForm.Create( nil ) ;
   With FFormFicha do
     begin
      // calcula dimensao do form ...
        ClientWidth  := Min ( _pnlScroll.Width,  Trunc ( Screen.Width * 0.80 ) ) + 4 ;

        PanelBorder := TPanel.Create ( FFormFicha ) ;
        PanelBorder.Tag := 99 ;
        PanelBorder.Parent := FFormFicha ;
        PanelBorder.Align := alClient ;
        PanelBorder.Width := ClientWidth ;
        PanelBorder.BorderWidth := 4 ;

        Color := _pnlFicha.Color  ;

       // form caption
       with TImage.Create ( PanelBorder ) do
         begin
           Parent := PanelBorder ;
           Align := alTop ;
           Height := 27 ;//_ImageCaption.Height ;
           Width := PanelBorder.width ;
           Picture.Bitmap.Width := PanelBorder.width ;
           Picture.Bitmap.Height := PanelBorder.Height ;
//--           Gradient( Canvas, Rect(0,0, Width, Height ), FromColor2, FromColor2, ToColor2 ) ; GRADIENT ...
           OnMouseDown := _imgTitleFichaMouseDown ;


           Canvas.Brush.Style := bsClear ;
           Canvas.Font.Name := 'Verdana' ;
           Canvas.Font.Size := 10 ;
           Canvas.Font.Style := Canvas.Font.Style + [ fsBold ] ;
           Canvas.Font.Color := clWhite ;
           Canvas.TextOut( 36, 4,  'Ficha - ' + Title  ) ;

         end ;

       // form/app icon
       with TImage.Create ( PanelBorder ) do
         begin
            Parent := PanelBorder ;
            Width := 24 ;
            Height := 24 ;
            Top := 3 ;
            Left := 8 ; //PanelBorder.Width - ( Width * 2 ) + ( Width div 2 ) ;
            Picture.icon.Width := Width ;
            Picture.icon.Height := Height ;
            Picture.Icon.Handle := Application.Icon.Handle ;
         end ;

       _pnlFicha.Parent := PanelBorder ;
       BorderStyle := bsNone ;
       Position := poMainFormCenter ;
       inherited ActiveFicha ;
       exit ;
     end ;
end ;


procedure T_FormListaFicha.ShowFicha;
begin

   With FFormFicha do
     try
       if dtsFicha.State in [dsInsert] then
          _ScrollBoxFicha.VertScrollBar.Position := 0 ;
       ShowModal ;
     finally
       _pnlFicha.Parent := _tbsFicha ;
       free ;
       FFormFicha := nil ;
     end ;

end;






  {
sc_DragMove = $f012; //61458
sc_Leftsize = $f001;
sc_Rightsize = $f002;
sc_Upsize = $f003;
sc_UpLeftsize = $f004;
sc_UpRightsize = $f005;
sc_Dnsize = $f006;
sc_DnLeftsize = $f007;
sc_DnRightsize = $f008;

$f040 produces a disastrous result.
Also $f020 and $f030 minimize, maximize

  ReleaseCapture;
  SendMessage( FFormFicha.Handle, WM_SYSCOMMAND, 61458, 0);

  }

procedure T_FormListaFicha._imgTitleFichaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

end;


{ TScrollingWinControl }

procedure TScrollBox.AutoScrollInView(AControl: TControl);
var
  Accept : boolean ;
begin
  Accept := True ;
  if Assigned ( FOnScrollInView ) then
    FOnScrollInView( AControl, Accept ) ;
  if Accept then
    inherited;
end;

procedure TScrollBox.SetOnScrollInView(const Value: TNotifyScrollInView);
begin
  FOnScrollInView := Value;
end;

initialization
  RegisterClass ( T_FormListaFicha ) ;
end.

