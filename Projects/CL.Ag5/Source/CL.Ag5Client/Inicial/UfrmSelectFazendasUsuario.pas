unit UfrmSelectFazendasUsuario;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, Exceptions, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, VCL.Grids, VCL.DBGrids,
  UdtmSelectFazendasUsuario, JvExExtCtrls, JvImage, JvExtComponent,
  JvPanel, Tc.VCL.Controls.GDIButton, Wrappers, System.Actions,
  Tc.VCL.Application ;

type
  TfrmSelectFazendasUsuario = class(T_FormDialog)
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    _btnAdd: TTcGDIButton;
    _btnRemove: TTcGDIButton;
    _btnAddAll: TTcGDIButton;
    dtsIn: TDataSource;
    dtsOut: TDataSource;
    cdsIn: TClientDataSet;
    cdsOut: TClientDataSet;
    _btnRemoveAll: TTcGDIButton;
    _actAdd: TAction;
    _actAddAll: TAction;
    _actRemove: TAction;
    _actRemoveAll: TAction;
    _actOK: TAction;
    _actCancel: TAction;
    Bevel1: TBevel;
    dbgOut: TDBGrid;
    dbgIn: TDBGrid;
    procedure _actAddExecute(Sender: TObject);
    procedure _actRemoveExecute(Sender: TObject);
    procedure _actAddAllExecute(Sender: TObject);
    procedure _actRemoveAllExecute(Sender: TObject);
    procedure dbgInDblClick(Sender: TObject);
    procedure dbgOutDblClick(Sender: TObject);
    procedure _btbSaveClick(Sender: TObject);
  private
    { Private declarations }
    FKUser : string ;
    FSourceClientDataSet: TClientDataSet;
    procedure SetSourceClientDataSet(const Value: TClientDataSet);
  protected
    { Protected declarations }
    Procedure Add ; virtual ;
    Procedure Remove ; virtual ;
    Procedure AddAll ; virtual ;
    Procedure RemoveAll ; virtual ;
    Procedure DisableControls ;
    Procedure EnableControls ;
    Procedure InvertSelection(ACDS: TClientDataSet);
  public
    { Public declarations }
    class function Execute ( AKUser : string ) : boolean ;
    property SourceClientDataSet: TClientDataSet read FSourceClientDataSet write SetSourceClientDataSet;
  end;

implementation

{$R *.dfm}

{ TfrmServicosAddAlvos }

class function TfrmSelectFazendasUsuario.Execute ( AKUser : string ) : boolean ;
var
  _this : TfrmSelectFazendasUsuario ;
begin
  _this := TfrmSelectFazendasUsuario.Create ( nil ) ;
  With _this do
  try
      FKUser := AKUser ;

      with TdtmSelectFazendasUsuario.Create ( _this ) do
        begin
          KeyUser := AKUser ;
          OpenTables ;
          SourceClientDataSet := cdsFazendas ;

          ModalResult := ShowModal ;
          Result  := ( ModalResult = mrOK ) ;
          if Result then
              ApplyUpdates ;
        end ;

  finally
     free ;
  end ;
end ;

procedure TfrmSelectFazendasUsuario._actAddExecute(Sender: TObject);
begin
  inherited;
  Add
end;

procedure TfrmSelectFazendasUsuario._actRemoveExecute(Sender: TObject);
begin
  inherited;
  Remove ;
end;

procedure TfrmSelectFazendasUsuario._actAddAllExecute(Sender: TObject);
begin
  inherited;
  AddAll ;
end;

procedure TfrmSelectFazendasUsuario._actRemoveAllExecute(Sender: TObject);
begin
  inherited;
  RemoveAll ;
end;

procedure TfrmSelectFazendasUsuario.Add;
begin
  DisableControls ;
  InvertSelection( cdsOut );
  EnableControls ;
end;

procedure TfrmSelectFazendasUsuario.AddAll;
begin
  DisableControls ;
  While not cdsOut.Eof do Add ;
  EnableControls ;
end;

procedure TfrmSelectFazendasUsuario.Remove;
begin
    DisableControls ;
    InvertSelection( cdsIn );
    EnableControls ;
end;

procedure TfrmSelectFazendasUsuario.RemoveAll;
begin
  DisableControls ;
  While not cdsIn.Eof do Remove ;
  EnableControls ;
end;


procedure TfrmSelectFazendasUsuario.DisableControls;
begin
  FSourceClientDataSet.DisableControls ;
  cdsIn.DisableControls ;
  cdsOut.DisableControls ;
end;

procedure TfrmSelectFazendasUsuario.EnableControls;
begin
  FSourceClientDataSet.EnableControls ;
  cdsIn.EnableControls ;
  cdsOut.EnableControls ;
end;

procedure TfrmSelectFazendasUsuario.InvertSelection(ACDS: TClientDataSet);
begin
   if ACDS.Bof and ACDS.Eof then
      Exit ;
    ACDS.Edit ;

    if ACDS.FieldByName( 'KSYSUSER' ).IsNull then
      ACDS.FieldByName( 'KSYSUSER' ).Value := FKUser
    else
      ACDS.FieldByName( 'KSYSUSER' ).Clear ;

    ACDS.Post ;
end;


procedure TfrmSelectFazendasUsuario.SetSourceClientDataSet(
  const Value: TClientDataSet);
begin
  FSourceClientDataSet := Value ;

  cdsIn.CloneCursor ( FSourceClientDataSet, False, False )  ;
  cdsIn.Filter   := 'KSYSUSER IS NOT NULL' ;
  cdsIn.Filtered := True ;

  cdsOut.CloneCursor ( FSourceClientDataSet, False, False )  ;
  cdsOut.Filter   := 'KSYSUSER IS NULL' ;
  cdsOut.Filtered := True ;
end;


procedure TfrmSelectFazendasUsuario.dbgInDblClick(Sender: TObject);
begin
  inherited;
  Remove
end;

procedure TfrmSelectFazendasUsuario.dbgOutDblClick(Sender: TObject);
begin
  inherited;
  Add
end;


procedure TfrmSelectFazendasUsuario._btbSaveClick(Sender: TObject);
begin
  ModalResult := mrOk ;
  inherited;
end;

end.

