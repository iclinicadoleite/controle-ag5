// Project      : TurboCode - Módulos Prime
// Sub-Project  : System Interface
// Module       : DBControls - Forms
// Funcionality : Edit grid ....
// License      : veja readme.txt


// License      : internal use


unit SysFormEditaLista;

{.$D-}

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, VCL.ComCtrls, VCL.ToolWin,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, JvExExtCtrls, JvImage,
  UdtmSYS_BASE, JvExtComponent, JvPanel, VCL.ImgList,
  Tc.VCL.Graphics, DBForm,
  Tc.VCL.Application,
  Tc.VCL.Form, Tc.VCL.FormIntf, System.Actions, System.ImageList,
  uImageListProvider, SysCommonResources, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, Wrappers ;

type

  T_FormEditaLista = class(TTcForm, ITcDataForm, ITcQuerySaveChanges )
    _ToolBar: TToolBar;
    _pnlFooter: TPanel;
    _ToolButtonNew: TToolButton;
    _ToolButtonEdit: TToolButton;
    _ToolButtonDelete: TToolButton;
    _ToolButtonCancel: TToolButton;
    _ToolButtonSave: TToolButton;
    _actNew: TAction;
    _actEdit: TAction;
    _actDelete: TAction;
    _actSave: TAction;
    _actCancel: TAction;
    _ToolButtonSeparator1: TToolButton;
    _ScrollBoxFicha: TScrollBox;
    _ToolButtonSeparator2: TToolButton;
    _ToolButtonPrint: TToolButton;
    _ToolButtonOther: TToolButton;
    _ToolButtonSeparator3: TToolButton;
    _actPrint: TAction;
    _actOther: TAction;
    dtsFicha: TDataSource;
    _popMenuPrint: TPopupMenu;
    _ImprimirLista: TMenuItem;
    _popMenuOther: TPopupMenu;
    _pnlFicha: TPanel;
    _AtualizarLista: TMenuItem;
    _actRefresh: TAction;
    _imageBottom: TImage;
    actHelp: TAction;
    _ToolButtonHelp: TToolButton;
    _ToolButtonSeparator4: TToolButton;
    ToolBarIcons: TImageListProvider;
    _dbgLista: TJvDBUltimGrid;
    procedure _actNewExecute(Sender: TObject);
    procedure _actEditExecute(Sender: TObject);
    procedure _actDeleteExecute(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure _actPrintExecute(Sender: TObject);
    procedure _actNewUpdate(Sender: TObject);
    procedure _actEditUpdate(Sender: TObject);
    procedure _actDeleteUpdate(Sender: TObject);
    procedure _actPrintUpdate(Sender: TObject);
    procedure _actSaveUpdate(Sender: TObject);
    procedure _actOtherExecute(Sender: TObject);
    procedure _actOtherUpdate(Sender: TObject);
    procedure ActiveFicha ;
    procedure _imgCloseButtonClick(Sender: TObject);
    procedure _ToolBarAdvancedCustomDraw(Sender: TToolBar;
      const ARect: TRect; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure actHelpExecute(Sender: TObject);
    procedure _ImprimirListaClick(Sender: TObject);
  private
    { Private declarations }
    CommonResources : TCommonResources ;
    FAllowedDataActions : TTcDataActions ;
    FDataModuleBase : T_dtmBASE ;
    FDataFormIntf: ITcDataForm;
    procedure GetDefultDataModuleBase ;
    procedure InsertRecord ;
    procedure EditRecord ;
    procedure DeleteRecord ;
    function Changed : boolean ; virtual ;
    procedure Save ;
    procedure Cancel ;
    procedure PrintData ;
    procedure OtherOptions ;
    function DataSetActive : boolean ;
    function GetBOF : boolean ;
    function GetEOF : boolean ;
    function DataSetIsEmpty : boolean ;
    function GetDatamoduleBase: T_dtmBASE ;
    function QuerySaveChanges: TQuerySaveCancelOption;
    procedure SetDataFormIntf(const Value: ITcDataForm);
    function QueryAllowedDataActions : TTcDataActions ;
    function QueryActiveDataActions : TTcDataActions ;
  public
    { Public declarations }
    property DataFormIntf : ITcDataForm  read FDataFormIntf write SetDataFormIntf;
    property DatamoduleBase : T_dtmBASE read GetDatamoduleBase write FDatamoduleBase ;
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SysTypes, SysQuerySaveIgnoreCancel, SysPrintGridDialog ;

{$R *.dfm}

{ T_FormListaFicha }

procedure T_FormEditaLista._actNewExecute(Sender: TObject);
begin
  if  Assigned ( FDataFormIntf )
  and ( daInsert in FDataFormIntf.QueryActiveDataActions ) then
    begin
      ActiveFicha ;
      FDataFormIntf.InsertRecord ;
    end;
end;

procedure T_FormEditaLista._actEditExecute(Sender: TObject);
begin
  if  Assigned ( FDataFormIntf )
  and ( daEdit in FDataFormIntf.QueryActiveDataActions ) then
    begin
      ActiveFicha ;
      FDataFormIntf.EditRecord ;
    end;

end;

procedure T_FormEditaLista._actDeleteExecute(Sender: TObject);
begin
  if  Assigned ( FDataFormIntf )
  and ( daDelete in FDataFormIntf.QueryActiveDataActions ) then
    begin
      ActiveFicha ;
      FDataFormIntf.DeleteRecord ;
    end;
end;

procedure T_FormEditaLista._actSaveExecute(Sender: TObject);
begin
  if  Assigned ( FDataFormIntf )
  and ( daSave in FDataFormIntf.QueryActiveDataActions ) then
      FDataFormIntf.Save ;
end;

procedure T_FormEditaLista._actCancelExecute(Sender: TObject);
begin
  if  Assigned ( FDataFormIntf )
  and ( daCancel in FDataFormIntf.QueryActiveDataActions ) then
    FDataFormIntf.Cancel ;
end;

procedure T_FormEditaLista._actPrintExecute(Sender: TObject);
begin
  if  Assigned ( FDataFormIntf )
  and ( daPrint in FDataFormIntf.QueryActiveDataActions ) then
       FDataFormIntf.PrintData  ;
end;

procedure T_FormEditaLista.InsertRecord ;
begin
  DatamoduleBase.NewRecord ;
end;


procedure T_FormEditaLista.OtherOptions;
begin
  _ToolButtonOther.CheckMenuDropdown ;
end;

procedure T_FormEditaLista.PrintData;
begin
   _ToolButtonPrint.CheckMenuDropdown ;
end;

function T_FormEditaLista.QueryAllowedDataActions: TTcDataActions;
begin
    Result := FAllowedDataActions ;
end;

function T_FormEditaLista.QueryActiveDataActions: TTcDataActions;
begin

  Result := [daPrint] ;

  if DataSetActive and ( daInsert in FAllowedDataActions) then
     Result := Result + [ daInsert ] ;

  if not DataSetIsEmpty and (daEdit in FAllowedDataActions) then
     Result :=  Result + [ daEdit ] ;

  if ( not DataSetIsEmpty ) and ( daDelete in FAllowedDataActions) then
     Result := Result + [ daDelete ] ;

  if (daSave in  FAllowedDataActions) and
     DataSetActive and Changed then
     Result := Result + [ daSave, daCancel ] ;

  if Application.LicenseState = lsReadOnly then
     Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;

end;

function T_FormEditaLista.QuerySaveChanges: TQuerySaveCancelOption;
begin
   Result := qscIgnore ;
   if Changed then
     begin
       Result := TQuerySaveIgnoreCancel.Execute ;
       if Result = qscSave then
         begin
          Save ;
          Result := qscIgnore ;
         end;
     end;
end;

procedure T_FormEditaLista.EditRecord ;
begin
  DatamoduleBase.EditRecord ;
end;

procedure T_FormEditaLista.DeleteRecord ;
begin
  if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) = mrYes then
     DatamoduleBase.DeleteRecord ;
end;

procedure T_FormEditaLista.Save;
begin
 if Assigned ( Screen.ActiveControl ) { and IsPublishedProp ( Screen.ActiveControl, 'DataSource' ) } then
   SendMessage( Screen.ActiveControl.Handle, CM_EXIT, 0, 0 ) ;
  DatamoduleBase.ApplyUpdates ;
end;

procedure T_FormEditaLista.SetDataFormIntf(const Value: ITcDataForm);
begin
  FDataFormIntf := Value;
end;

procedure T_FormEditaLista.Cancel;
begin
  DatamoduleBase.CancelUpdates ;
end;


function T_FormEditaLista.Changed: boolean;
begin
 with TClientDataSet( dtsFicha.DataSet ) do
   Result := ( (State in [dsInsert,dsEdit]) or (ChangeCount > 0) ) ;
end;

procedure T_FormEditaLista._actNewUpdate(Sender: TObject);
begin
  inherited;
  _actNew.Enabled := Assigned ( FDataFormIntf ) and ( daInsert in FDataFormIntf.QueryActiveDataActions )
end;

procedure T_FormEditaLista._actEditUpdate(Sender: TObject);
begin
  inherited;
  _actEdit.Enabled := Assigned ( FDataFormIntf ) and ( daEdit in FDataFormIntf.QueryActiveDataActions )
end;

procedure T_FormEditaLista._actDeleteUpdate(Sender: TObject);
begin
   _actDelete.Enabled := Assigned ( FDataFormIntf ) and ( daDelete in FDataFormIntf.QueryActiveDataActions )
end;

procedure T_FormEditaLista._actPrintUpdate(Sender: TObject);
begin
  _actPrint.Enabled := Assigned ( FDataFormIntf ) and ( daPrint in FDataFormIntf.QueryActiveDataActions )
end;

function T_FormEditaLista.DataSetActive: boolean;
begin
  Try
     Result :=  Assigned ( dtsFicha.DataSet ) and ( dtsFicha.DataSet.Active ) ;
  except
  end
end;

function T_FormEditaLista.DataSetIsEmpty: boolean;
begin
  Try
     Result := ( not DataSetActive ) or ( dtsFicha.DataSet.IsEmpty ) ;
  except
  end

end;


function T_FormEditaLista.GetBOF: boolean;
begin
  Try
     Result := ( not DataSetActive ) or ( dtsFicha.DataSet.BOF ) ;
  except
  end
end;

function T_FormEditaLista.GetEOF: boolean;
begin
  Try
     Result := ( not DataSetActive ) or ( dtsFicha.DataSet.EOF ) ;
  except
  end
end;

procedure T_FormEditaLista._actSaveUpdate(Sender: TObject);
var
   Enabled : boolean ;
begin
  try
      Enabled := Assigned ( FDataFormIntf ) and ( [ daSave, daCancel ] * FDataFormIntf.QueryActiveDataActions  = [ daSave, daCancel ] ) ;
  finally
     _actSave.Enabled   := Enabled ;
     _actCancel.Enabled := Enabled ;
  end ;
end;

function T_FormEditaLista.GetDatamoduleBase: T_dtmBASE ;
begin
  if not Assigned ( FDatamoduleBase ) then
     begin
        GetDefultDataModuleBase ;

        if Assigned ( FDatamoduleBase  ) then
             dtsFicha.DataSet  := FDatamoduleBase.ClientDataSet ;

     end ;

  Result := FDatamoduleBase ;
end;

procedure T_FormEditaLista.GetDefultDataModuleBase;
var
   ComponentIndex : integer ;
begin
  for ComponentIndex := 0 to self.ComponentCount -1 do
    begin
      if Components[ ComponentIndex ] is T_dtmBASE then
         begin
            FDataModuleBase := T_dtmBASE ( Components[ ComponentIndex ] ) ;
            exit ;
         end
    end ;
end;


procedure T_FormEditaLista._actOtherExecute(Sender: TObject);
begin
  OtherOptions ;
end;



procedure T_FormEditaLista._actOtherUpdate(Sender: TObject);
begin
  _actOther.Enabled := Assigned ( FDataFormIntf ) and ( daOther in FDataFormIntf.QueryActiveDataActions )
end;

procedure T_FormEditaLista.actHelpExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure T_FormEditaLista.ActiveFicha;
var
   x: integer ;
begin

  with _ScrollBoxFicha do
  for x := 0 to  _ScrollBoxFicha.ControlCount - 1 do
     begin
//        TCustomEdit ( Controls [ x ] ).Focused
        if ( Controls [ x ] is TCustomEdit ) and TCustomEdit( Controls [ x ] ).Visible then
           begin
              TCustomEdit( Controls [ x ] ).SetFocus ;
              exit ;
           end ;
     end ;

end;

constructor T_FormEditaLista.Create(AOwner: TComponent);
begin
  inherited;

 CommonResources := GetCommonResources ; //TCommonResources.Create ( nil ) ;
 ToolBarIcons.Source := CommonResources.ToolBarIcons ;

 _pnlFooter.Margins.SetBounds(0,0,0,0) ;
 _ToolBar.Top := 2 ;

  FAllowedDataActions := [daInsert,daEdit,daDelete,daSave,daCancel,daPrint,daOther] ;

  FDataFormIntf := Self ;

//  Tc.VCL.Graphics.cyGradientFill(_ImageBottom.Canvas, Rect(0,0, _ImageBottom.Width, _ImageBottom.Height ), SysTypes._GRADIENT_COLOR, clWhite, dgdVertical, 60, bmMirror, 255, 100);
end;

procedure T_FormEditaLista._imgCloseButtonClick(Sender: TObject);
begin
  if ( fsModal in self.FormState ) then
     self.close
  else
     Close
     //PostMessage( Application.MainForm.Handle, WM_CLOSE, 0, 0 ) ;
     //Release ;
end;

procedure T_FormEditaLista._ToolBarAdvancedCustomDraw(Sender: TToolBar;
  const ARect: TRect; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  b : TBitmap ;
  bs : TBitmap ;
  SourceRect : TRect ;
begin

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


end;


procedure T_FormEditaLista._ImprimirListaClick(Sender: TObject);
var
  x : integer ;
  g : TDBGrid ;
begin
(*
  g := nil ;
  for x := 0 to ComponentCount - 1 do
   if ( Components [ x ] is TDBGrid ) then
     begin
        g := TDBGrid( Components [ x ] ) ;
        break ;
     end;

  if Assigned ( g )  then
*)     SysPrintGridDialog.TPrintGridDialog.Execute( _dbgLista, Caption );
end;

initialization
  RegisterClass ( T_FormEditaLista )
end.



