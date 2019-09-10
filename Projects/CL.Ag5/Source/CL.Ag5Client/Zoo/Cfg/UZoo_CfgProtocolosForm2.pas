unit UZoo_CfgProtocolosForm2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  SysFormListaFicha, ReportTypes, JvExExtCtrls, JvImage, VCL.DBCtrls,
  JvExStdCtrls, JvCombobox, JvDBCombobox, JvExtComponent, JvPanel, AppEvnts,
  JvDBControls, DBCGrids, JvBaseEdits, VCL.ImgList,
  Tc.VCL.ControlPopuper, Tc.VCL.Controls.GDIButton,
  System.Actions, System.ImageList,
  CL.Ag5.NSMsgs, uImageListProvider, Tc.VCL.Application, Wrappers, VirtualTrees,
  DTDBTreeView, DTClientTree, SysFormEditaLista ;

type



  TVTEditLink = class(TInterfacedObject, IVTEditLink)
  private
    FEdit: TJvComboEdit ;                  // A normal custom edit control.
  protected
    FTree: TCustomVirtualStringTree; // A back reference to the tree calling.
    FNode: PVirtualNode;             // The node to be edited.
    FColumn: TColumnIndex;           // The column of the node.
    FAlignment: TAlignment;
    FTextBounds: TRect;              // Smallest rectangle around the text.
    FStopping: Boolean;              // Set to True when the edit link requests stopping the edit action.
    procedure SetEdit(const Value: TJvComboEdit); // Setter for the FEdit member;
  public
    constructor Create( const AEdit : TJvComboEdit ) ; virtual;
    destructor Destroy; override;
    property Node  : PVirtualNode read FNode; // [IPK] Make FNode accessible
    property Column: TColumnIndex read FColumn; // [IPK] Make Column(Index) accessible

    function BeginEdit: Boolean; virtual; stdcall;
    function CancelEdit: Boolean; virtual; stdcall;
    property Edit: TJvComboEdit read FEdit write SetEdit;
    function EndEdit: Boolean; virtual; stdcall;
    function GetBounds: TRect; virtual; stdcall;
    function PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex): Boolean; virtual; stdcall;
    procedure ProcessMessage(var Message: TMessage); virtual; stdcall;
    procedure SetBounds(R: TRect); virtual; stdcall;
  end;




  TZoo_CfgProtocolosForm2 = class(T_FormEditaLista)
    dtsTiposProtocolo: TDataSource;
    dtsTarefas: TDataSource;
    TcMPControlPopuper1: TTcControlPopuper;
    Splitter1: TSplitter;
    Panel1: TPanel;
    dbTreeProtocolos: TDTClientTree;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    edDiaTarefa: TJvCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    JvComboEdit1: TJvComboEdit;
    Button1: TButton;
    actRemoveTarefa: TAction;
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dblcTipoProtocoloCloseUp(Sender: TObject);
    procedure dblcTipoProtocoloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTarefaButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure JvDBCalcEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure _actOtherUpdate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TcMPControlPopuper1Close(Sender: TObject);
    procedure _actDeleteExecute(Sender: TObject);
    procedure actRemoveTarefaExecute(Sender: TObject);
    procedure actRemoveTarefaUpdate(Sender: TObject);
    procedure _actNewExecute(Sender: TObject);
    procedure _actEditExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ShowNewFastRegister(Sender: TObject);
  protected
    { Protected declarations }
    procedure Pesquisar ;
    procedure SearchTarefa ( TextToSearch : string ; AAppend : boolean = False );
    procedure NeedRefresh ( Sender : TCLAg5NSMsg ) ;
    procedure EventNotifyTarefasUpdate(Sender: TObject);
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
    class procedure ExecuteNewFastRegister;
  end;

implementation

uses
    System.Math
  , SearchsZootecnico
  , UZoo_CfgProtocolosDatamodule2
  , Exceptions, UZoo_CfgTarefasForm2
  , UZoo_CfgExamesForm ;

{$R *.dfm}

procedure TZoo_CfgProtocolosForm2.JvDBCalcEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '-' then
     Key := #0 ;
end;

procedure TZoo_CfgProtocolosForm2.NeedRefresh(Sender: TCLAg5NSMsg);
var
  KZOO_PROTOCOLO : string ;
begin

  with TZoo_CfgProtocolosDatamodule2( DatamoduleBase ) do
    begin
      if ( cdsProtocolos.State in [dsInsert,dsEdit] ) or (cdsProtocolos.ChangeCount > 0 ) then
         exit ;

      KZOO_PROTOCOLO := cdsProtocolosKZOO_PROTOCOLO.AsString ;
      ReOpenTables ;
      cdsProtocolos.Locate('KZOO_PROTOCOLO', KZOO_PROTOCOLO, []) ;
//      cdsProtocolo.RefreshRecord;
      //cdsProtocolo.Refresh ;
    end;
end;

procedure TZoo_CfgProtocolosForm2.Pesquisar;
begin
  inherited ;
  (*
  if CheckBox1.Checked then
    begin
      with TZoo_CfgProtocolosDatamodule2( DatamoduleBase ), TSearchProtocolo.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
               cdsProtocolos.Locate( 'KZOO_PROTOCOLO', Result.FieldByName( 'KZOO_PROTOCOLO' ).Value, [] ) ;
               ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end
  else
    begin
      with TZoo_CfgProtocolosDatamodule2( DatamoduleBase ), TSearchProtocoloAtivo.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
               cdsProtocolos.Locate( 'KZOO_PROTOCOLO', Result.FieldByName( 'KZOO_PROTOCOLO' ).Value, [] ) ;
               ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end;
    *)
end;

procedure TZoo_CfgProtocolosForm2.SearchTarefa(TextToSearch: string; AAppend : boolean = False );
begin


//   if ( Trim (TextToSearch) = '' ) then
//     exit ;

   with TSearchTarefaExamesAtivo.Create do
      try
         TextToFind := TextToSearch ;
         if Execute then
            TZoo_CfgProtocolosDatamodule2 ( DatamoduleBase ).InsereTarefa (
                 edDiaTarefa.asInteger,
                 Result.FieldByName( 'KZOO_TAREFA' ).asString,
                 Result.FieldByName( 'CODIGO' ).asString,
                 Result.FieldByName( 'NOME' ).asString,
                 Result.FieldByName( 'TIPOTAREFA' ).asInteger = -1,
                 Result.FieldByName( 'DESCRICAO' ).asString,
                 AAppend ) ;
      finally
         free ;
      end ;

end;

procedure TZoo_CfgProtocolosForm2.ShowNewFastRegister(Sender: TObject);
begin

  if ( _dbgLista.CanFocus ) and ( _dbgLista.Showing ) then
    begin
      _dbgLista.SetFocus ;
      _dbgLista.EditorMode := True ;
    end;

//  if ( edDiaTarefa.CanFocus ) and ( edDiaTarefa.Showing ) then
//    edDiaTarefa.SetFocus
end;

procedure TZoo_CfgProtocolosForm2.TcMPControlPopuper1Close(Sender: TObject);
begin
  SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
//      SelectNext( ActiveControl as TWinControl, True, True );
end;

procedure TZoo_CfgProtocolosForm2._actDeleteExecute(Sender: TObject);
begin
  if TZoo_CfgProtocolosDatamodule2( DataModuleBase ).CheckProtocoloInUse then
    ShowMessage ( 'Protocolo já aplicado à animais da fazenda.'
    +#13#10'A exclusão do protocolo não removerá os dados da ficha do animal.' + #13#10 ) ;
  inherited;

end;

procedure TZoo_CfgProtocolosForm2._actEditExecute(Sender: TObject);
var
  x : integer  ;
  nColumn : integer ;
begin
  _dbgLista.SetFocus ;

  inherited;

  nColumn := -1 ;
  for x := 0 to _dbgLista.Columns.Count - 1 do
   begin
      if not _dbgLista.Columns[ x ].ReadOnly then
        begin
          nColumn := x ;
          Break ;
        end;
   end;

 if nColumn <> -1 then
   begin
     _dbgLista.Col := nColumn ;
     _dbgLista.EditorMode := True ;
   end;
end;

procedure TZoo_CfgProtocolosForm2._actNewExecute(Sender: TObject);
var
  x : integer  ;
  nColumn : integer ;
begin
  if _dbgLista.Visible and _dbgLista.Showing  then
    _dbgLista.SetFocus ;
  inherited;

  nColumn := -1 ;
  for x := 0 to _dbgLista.Columns.Count - 1 do
   begin
      if not _dbgLista.Columns[ x ].ReadOnly then
        begin
          nColumn := x ;
          Break ;
        end;
   end;

 if nColumn <> -1 then
   begin
     _dbgLista.Col := nColumn ;
     _dbgLista.EditorMode := True ;
   end;
end;

procedure TZoo_CfgProtocolosForm2._actOtherUpdate(Sender: TObject);
begin
  inherited;
  _actOther.Enabled := False ;
end;

function TZoo_CfgProtocolosForm2._dbgListaCheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin
  inherited;
  with TZoo_CfgProtocolosDatamodule2( DataModuleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsProtocolosATIVO )  ) ;

  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;


procedure TZoo_CfgProtocolosForm2.actRemoveTarefaExecute(Sender: TObject);
begin
  TZoo_CfgProtocolosDatamodule2( DatamoduleBase ).DeleteTarefa ;
end;

procedure TZoo_CfgProtocolosForm2.actRemoveTarefaUpdate(Sender: TObject);
begin
  actRemoveTarefa.Enabled := TZoo_CfgProtocolosDatamodule2( DatamoduleBase ).cdsTarefasTIPOREC.asInteger = 2
end;

procedure TZoo_CfgProtocolosForm2.BitBtn1Click(Sender: TObject);
begin
  SearchTarefa( '', True );
end;

procedure TZoo_CfgProtocolosForm2.BitBtn3Click(Sender: TObject);
begin
  TZoo_CfgTarefasForm.NovaTarefa;
end;

procedure TZoo_CfgProtocolosForm2.BitBtn4Click(Sender: TObject);
begin
  inherited;
  TZoo_CfgExamesForm.NovoExame ;
end;

procedure TZoo_CfgProtocolosForm2.CheckBox1Click(Sender: TObject);
begin
  inherited;
////  TZoo_CfgProtocolosDatamodule2( DatamoduleBase ).cdsProtocolos.Filtered := not CheckBox1.Checked ;
end;

constructor TZoo_CfgProtocolosForm2.Create(AOwner: TComponent);
begin
  inherited;

  DBGrid1.Visible := DebugHook > 0 ;

  TZoo_CfgProtocolosDatamodule2.Create ( self ) ;
  dtsFicha.DataSet := TZoo_CfgProtocolosDatamodule2( DatamoduleBase ).cdsProtocolos;
  dtsTiposProtocolo.DataSet := TZoo_CfgProtocolosDatamodule2( DatamoduleBase ).cdsTiposProtocolo;
  dtsTarefas.DataSet  := TZoo_CfgProtocolosDatamodule2( DatamoduleBase ).cdsTarefas;
  DatamoduleBase.OpenTables ;


  TZoo_CfgProtocolosDatamodule2( DatamoduleBase ).OnNofifyTarefasUpdate :=  EventNotifyTarefasUpdate ;

  TCLAg5NSMsgEVT_CfgTarefas.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CfgExames.Subscribe( NeedRefresh ) ;

//  dblcTipoProtocolo.KeyValue := TZoo_CfgProtocolosDatamodule2 ( DatamoduleBase ).cdsTiposProtocoloKZOO_CFGTIPOPROTOCOLO.Value ;
end;

procedure TZoo_CfgProtocolosForm2.dblcTipoProtocoloCloseUp(Sender: TObject);
begin
  inherited;
  TZoo_CfgProtocolosDatamodule2( DatamoduleBase ).ReOpenTables ;
end;

procedure TZoo_CfgProtocolosForm2.dblcTipoProtocoloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_CfgProtocolosForm2.DBMemo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_TAB then
    begin
      Key := 0 ;
      TcMPControlPopuper1.Close ;
    end;
end;

destructor TZoo_CfgProtocolosForm2.Destroy;
begin
 TCLAg5NSMsgEVT_CfgTarefas.UnSubscribe( NeedRefresh ) ;
 TCLAg5NSMsgEVT_CfgExames.UnSubscribe( NeedRefresh ) ;
  inherited;
end;

procedure TZoo_CfgProtocolosForm2.edTarefaButtonClick(Sender: TObject);
begin
  SearchTarefa ( TJvDBComboEdit ( Sender ).Text, True ) ;
end;

procedure TZoo_CfgProtocolosForm2.EventNotifyTarefasUpdate(Sender: TObject);
begin
  dbTreeProtocolos.FullExpand();
end;

class procedure TZoo_CfgProtocolosForm2.ExecuteNewFastRegister;
var
  ThisForm: TZoo_CfgProtocolosForm2;
begin
  try
    ThisForm := TZoo_CfgProtocolosForm2.Create(nil);
    ThisForm.OnShow := ThisForm.ShowNewFastRegister;
//    ThisForm._pageControl.Pages[0].TabVisible := False;
//    ThisForm._pageControl.Pages[1].TabVisible := False;
    //ThisForm._pageControl.ActivePageIndex := 1;
//    ThisForm._pageControl.ActivePage := ThisForm._tbsFicha;
//    ThisForm._actLista.Enabled := False;
    ThisForm._actEdit.Enabled := False;
    ThisForm._actNew.Execute ;// _ActionListExecute(ThisForm._actNew, Handled);
    ThisForm.ShowModal;
  finally
    FreeAndNil( ThisForm );
  end;
end;




constructor TVTEditLink.Create ( const AEdit : TJvComboEdit ) ;

begin
  inherited Create ;
  //FEdit := TVTEdit.Create(Self);
  FEdit := AEdit ;
  with FEdit do
  begin
    Visible := False;
    BorderStyle := bsSingle;
    AutoSize := False;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

destructor TVTEditLink.Destroy;

begin
//  if Assigned(FEdit) then
//    FEdit.Release;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVTEditLink.BeginEdit: Boolean;

// Notifies the edit link that editing can start now. descendants may cancel node edit
// by returning False.

begin
  Result := not FStopping;
  if Result then
  begin
    FEdit.Show;
    FEdit.SelectAll;
    FEdit.SetFocus;
    //FEdit.AutoAdjustSize;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTEditLink.SetEdit(const Value: TJvComboEdit);
begin
  if Assigned(FEdit) then
    FEdit.Free;
  FEdit := Value;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVTEditLink.CancelEdit: Boolean;

begin
  Result := not FStopping;
  if Result then
  begin
    FStopping := True;
    FEdit.Hide;
    FTree.CancelEditNode;
//    FEdit.FLink := nil;
//    FEdit.FRefLink := nil;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVTEditLink.EndEdit: Boolean;

begin
  Result := not FStopping;
  if Result then
  try
    FStopping := True;
    if FEdit.Modified then
      FTree.Text[FNode, FColumn] := FEdit.Text;
    FEdit.Hide;
//    FEdit.FLink := nil;
//    FEdit.FRefLink := nil;
  except
    FStopping := False;
    raise;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVTEditLink.GetBounds: TRect;

begin
  Result := FEdit.BoundsRect;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVTEditLink.PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex): Boolean;

// Retrieves the true text bounds from the owner tree.

var
  Text: string;

begin
  Result := Tree is TCustomVirtualStringTree;
  if Result then
  begin
    if not Assigned(FEdit) then
    begin
//      FEdit := TVTEdit.Create(Self);
//      FEdit.Visible := False;
//      FEdit.BorderStyle := bsSingle;
    end;
    FEdit.AutoSize := True;
    FTree := Tree as TCustomVirtualStringTree;
    FNode := Node;
    FColumn := Column;
    FEdit.Parent := Tree;
    // Initial size, font and text of the node.
    FTree.GetTextInfo(Node, Column, FEdit.Font, FTextBounds, Text);
    FEdit.Font.Color := clWindowText;
  //  FEdit.RecreateWnd;
    FEdit.AutoSize := False;
    FEdit.Text := Text;

    if Column <= NoColumn then
    begin
      FEdit.BidiMode := FTree.BidiMode;
  //    FAlignment := FTree.Alignment;
    end
    else
    begin
      FEdit.BidiMode := FTree.Header.Columns[Column].BidiMode;
      FAlignment := FTree.Header.Columns[Column].Alignment;
    end;

    if FEdit.BidiMode <> bdLeftToRight then
      ChangeBidiModeAlignment(FAlignment);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTEditLink.ProcessMessage(var Message: TMessage);

begin
  FEdit.WindowProc(Message);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTEditLink.SetBounds(R: TRect);

// Sets the outer bounds of the edit control and the actual edit area in the control.

var
  lOffset: Integer;

begin
  if not FStopping then
  begin
    // Set the edit's bounds but make sure there's a minimum width and the right border does not
    // extend beyond the parent's left/right border.
    if R.Left < 0 then
      R.Left := 0;
    if R.Right - R.Left < 30 then
    begin
      if FAlignment = taRightJustify then
        R.Left := R.Right - 30
      else
        R.Right := R.Left + 30;
    end;
    if R.Right > FTree.ClientWidth then
      R.Right := FTree.ClientWidth;
    FEdit.BoundsRect := R;

    // The selected text shall exclude the text margins and be centered vertically.
    // We have to take out the two pixel border of the edit control as well as a one pixel "edit border" the
    // control leaves around the (selected) text.
    R := FEdit.ClientRect;
///    lOffset := IfThen(vsMultiline in FNode.States, 0, 2);
//    if tsUseThemes in FTree.FStates then
//      Inc(lOffset);
//    InflateRect(R, -FTree.FTextMargin + lOffset, lOffset);
    if not (vsMultiline in FNode.States) then
      OffsetRect(R, 0, FTextBounds.Top - FEdit.Top);
    R.Top := Max(-1, R.Top); // A value smaller than -1 will prevent the edit cursor from being shown by Windows, see issue #159
    R.Left := Max(-1, R.Left);
    SendMessage(FEdit.Handle, EM_SETRECTNP, 0, LPARAM(@R));
  end;
end;


initialization
  RegisterClass ( TZoo_CfgProtocolosForm2 ) ;


end.
