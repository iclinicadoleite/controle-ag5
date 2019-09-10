unit UZoo_ListaRacasFrame;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.StdCtrls, CheckLst, VCL.Buttons, VCL.ExtCtrls, Tc.VCL.FloatPanel, VCL.ImgList,
  VCL.ActnList, Tc.VCL.Controls.GDIButton, System.Actions, System.ImageList;

type
  TZoo_ListaRacasFrame = class(TFrame)
    TcMPFloatingPanel1: TTcCaptionedPanel;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    RacasListBox: TCheckListBox;
    ActionsImageList: TImageList;
    PanelFooter: TPanel;
    FloatEditorOKButton: TTcGDIButton;
    FloatEditorCancelButton: TTcGDIButton;
    _ActionList: TActionList;
    actRacaUp: TAction;
    actRacaDown: TAction;
    Label1: TLabel;
    ComposicaoLabel: TLabel;
    PanelClient: TPanel;
    procedure RacasListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure RacasListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure actRacaDownExecute(Sender: TObject);
    procedure actRacaUpExecute(Sender: TObject);
    procedure actRacaUpUpdate(Sender: TObject);
    procedure actRacaDownUpdate(Sender: TObject);
    procedure RacasListBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RacasListBoxClickCheck(Sender: TObject);
    procedure FloatEditorOKButtonClick(Sender: TObject);
    procedure FloatEditorCancelButtonClick(Sender: TObject);
  private
    FListRacas : string ;
    FRacasSelected : TStringList ;
    { Private declarations }
    procedure MoveRacasListBoxItem ( AFromPosition, AToPosition : integer ) ;
    procedure SetRaca(const Value: string);
    procedure SetListRacas(const Value: string);
    procedure UpdateSelected ;
    function GetRaca: string;
  public
    { Public declarations }
    property Raca : string   read GetRaca write SetRaca;
    property ListRacas : string  read FListRacas write SetListRacas;
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
  end;

implementation

{$R *.dfm}

{ TZoo_ListaRacasFrame }

procedure TZoo_ListaRacasFrame.actRacaDownExecute(Sender: TObject);
begin
  MoveRacasListBoxItem (RacasListBox.ItemIndex, RacasListBox.ItemIndex + 1);
  UpdateSelected ;
end;

procedure TZoo_ListaRacasFrame.actRacaDownUpdate(Sender: TObject);
begin
  actRacaDown.Enabled := ( RacasListBox.ItemIndex > -1 )  and ( RacasListBox.ItemIndex < RacasListBox.Count - 1 ) ;
end;

procedure TZoo_ListaRacasFrame.actRacaUpExecute(Sender: TObject);
begin
  MoveRacasListBoxItem (RacasListBox.ItemIndex, RacasListBox.ItemIndex - 1);
  UpdateSelected ;
end;

procedure TZoo_ListaRacasFrame.actRacaUpUpdate(Sender: TObject);
begin
  actRacaUp.Enabled := RacasListBox.ItemIndex > 0 ;
end;

constructor TZoo_ListaRacasFrame.Create(AOwner: TComponent);
begin
  inherited;
  FRacasSelected := TStringList.Create ;
end;

destructor TZoo_ListaRacasFrame.Destroy;
begin
  FRacasSelected.free ;
  inherited;
end;

procedure TZoo_ListaRacasFrame.FloatEditorCancelButtonClick(Sender: TObject);
begin
  TCustomForm( Parent ).ModalResult := mrCancel ;
end;

procedure TZoo_ListaRacasFrame.FloatEditorOKButtonClick(Sender: TObject);
begin
  TCustomForm( Parent ).ModalResult := mrOK ;
end;

function TZoo_ListaRacasFrame.GetRaca: string;
begin
  Result := FRacasSelected.CommaText ;
end;

procedure TZoo_ListaRacasFrame.MoveRacasListBoxItem(AFromPosition,
  AToPosition: integer);
begin
   RacasListBox.Items.Move(AFromPosition, AToPosition);
   RacasListBox.ItemIndex := AToPosition;
   UpdateSelected ;
end;

procedure TZoo_ListaRacasFrame.RacasListBoxClickCheck(Sender: TObject);
begin
   UpdateSelected ;
end;

procedure TZoo_ListaRacasFrame.RacasListBoxDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  StartPosition,
  DropPosition: Integer;
  DropPoint: TPoint;
begin
  with Source as TCheckListBox do
    begin
      StartPosition := RacasListBox.ItemIndex;
      DropPoint.x := X;
      DropPoint.y := Y;
      DropPosition := RacasListBox.ItemAtPos(DropPoint, True);
      if (DropPosition <> -1) then
        MoveRacasListBoxItem(StartPosition, DropPosition);
    end;

end;

procedure TZoo_ListaRacasFrame.RacasListBoxDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = RacasListBox) then
    Accept := True
  else
    Accept := False;
end;

procedure TZoo_ListaRacasFrame.RacasListBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if  ( Key = VK_UP ) and ( Shift = [ssCtrl] ) then
  begin
     Key := 0 ;
     actRacaUp.Execute ;
  end
  else if  ( Key = VK_DOWN ) and ( Shift = [ssCtrl] ) then
  begin
     Key := 0 ;
     actRacaDown.Execute ;
  end;
end;

procedure TZoo_ListaRacasFrame.SetListRacas(const Value: string);
var
   TmpListRacas : TStringList ;
begin
  FListRacas :=  Value ;
  TmpListRacas := TStringList.Create ;
  TmpListRacas.CommaText := FListRacas;
  While ( TmpListRacas.Count > 0 ) and (TmpListRacas[ TmpListRacas.Count - 1 ] = '' ) do
    TmpListRacas.Delete ( FRacasSelected.Count - 1 ) ;
  RacasListBox.Items.Assign ( TmpListRacas ) ;
  TmpListRacas.Free ;
end;

procedure TZoo_ListaRacasFrame.SetRaca(const Value: string);
var
 IterateSelectedRacas : integer ;
 IndexOf, Idx : integer ;
begin
  Idx := 0;
  FRacasSelected.CommaText := Value ;
  While ( FRacasSelected.Count > 0 ) and (FRacasSelected[ FRacasSelected.Count - 1 ] = '' ) do
    FRacasSelected.Delete ( FRacasSelected.Count - 1 ) ;

  for IterateSelectedRacas := 0 to RacasListBox.Count - 1 do
     RacasListBox.Checked [ IterateSelectedRacas ] := False ;

  for IterateSelectedRacas := 0 to FRacasSelected.Count - 1 do
    begin
      IndexOf := RacasListBox.Items.IndexOf  ( FRacasSelected[ IterateSelectedRacas ] ) ;
      if IndexOf > -1 then
       begin
         RacasListBox.Items.Move ( IndexOf, Idx ) ;
         RacasListBox.Checked [ Idx ] := True ;
         Inc ( Idx ) ;
       end;
    end;

  if RacasListBox.Count > 0 then
    RacasListBox.ItemIndex := 0 ;

  UpdateSelected ;

end;

procedure TZoo_ListaRacasFrame.UpdateSelected;
var
 IterateSelectedRacas : integer ;
begin
  FRacasSelected.Clear ;
  for IterateSelectedRacas := 0 to RacasListBox.Count - 1 do
     if RacasListBox.Checked [ IterateSelectedRacas ] then
       FRacasSelected.Add ( RacasListBox.Items[ IterateSelectedRacas ] ) ;
  ComposicaoLabel.Caption := FRacasSelected.CommaText ;
end;

end.
