unit UfrmSelectUsuariosFazenda;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,  VCL.Dialogs,
  VCL.Buttons, Exceptions, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, VCL.Grids, VCL.DBGrids,
  UdtmSelectUsuariosFazenda, SysFormDialog, JvExExtCtrls,
  JvImage, JvExtComponent, JvPanel, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Application, Wrappers ;

type
  TfrmSelectUsuariosFazenda = class(T_FormDialog)
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
    dbgIn: TDBGrid;
    dbgOut: TDBGrid;
    procedure _actAddExecute(Sender: TObject);
    procedure _actRemoveExecute(Sender: TObject);
    procedure _actAddAllExecute(Sender: TObject);
    procedure _actRemoveAllExecute(Sender: TObject);
    procedure dbgInDblClick(Sender: TObject);
    procedure dbgOutDblClick(Sender: TObject);
    procedure _actOKExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure _actOKUpdate(Sender: TObject);
  private
    { Private declarations }
    FKFazenda : string ;
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
    class function Execute ( AKFazenda : string ) : boolean ;
    property SourceClientDataSet: TClientDataSet read FSourceClientDataSet write SetSourceClientDataSet;
  end;

implementation

{$R *.dfm}

{ TfrmServicosAddAlvos }

class function TfrmSelectUsuariosFazenda.Execute ( AKFazenda : string ) : boolean ;
var
  _this : TfrmSelectUsuariosFazenda ;
begin
  _this := TfrmSelectUsuariosFazenda.Create ( nil { Application } )  ;
  With _this do
  try
      FKFazenda := AKFazenda ;

      with TdtmSelectUsuariosFazenda.Create ( _this ) do
        begin
          KeyFazenda := AKFazenda ;
          OpenTables ;
          SourceClientDataSet := cdsUsuarios ;

          ModalResult := ShowModal ;
          Result  := ( ModalResult = mrOK ) ;
          if Result then
            begin
              ApplyUpdates ;
              MessageDlg ( 'Salvo com sucesso' ) ;
            end ;
        end ;

  finally
     free ;
  end ;
end ;

procedure TfrmSelectUsuariosFazenda._actAddExecute(Sender: TObject);
begin
  inherited;
  Add
end;

procedure TfrmSelectUsuariosFazenda._actCancelExecute(Sender: TObject);
begin
   if ( cdsOut.ChangeCount > 0 )
    and (MessageDlg ( 'Cancelar as alterações', mtConfirmation ) <> mrYes ) then
       exit ;
  ModalResult := mrCancel ;
end;

procedure TfrmSelectUsuariosFazenda._actOKExecute(Sender: TObject);
begin
  ModalResult := mrOk ;
end;

procedure TfrmSelectUsuariosFazenda._actOKUpdate(Sender: TObject);
begin
   _actOK.Enabled := cdsOut.ChangeCount > 0
end;

procedure TfrmSelectUsuariosFazenda._actRemoveExecute(Sender: TObject);
begin
  inherited;
  Remove ;
end;

procedure TfrmSelectUsuariosFazenda._actAddAllExecute(Sender: TObject);
begin
  inherited;
  AddAll ;
end;

procedure TfrmSelectUsuariosFazenda._actRemoveAllExecute(Sender: TObject);
begin
  inherited;
  RemoveAll ;
end;

procedure TfrmSelectUsuariosFazenda.Add;
begin
  DisableControls ;
  InvertSelection( cdsOut );
  EnableControls ;
end;

procedure TfrmSelectUsuariosFazenda.AddAll;
begin
  DisableControls ;
  While not cdsOut.Eof do Add ;
  EnableControls ;
end;

procedure TfrmSelectUsuariosFazenda.Remove;
begin
  if ( AnsiUpperCase ( cdsIn.FieldByName('LOGIN').AsString ) <> 'ADMIN') then
  begin
    DisableControls ;
    InvertSelection( cdsIn );
    EnableControls ;
  end;
end;

procedure TfrmSelectUsuariosFazenda.RemoveAll;
begin
  DisableControls ;
  cdsIn.First;

  While (cdsIn.RecordCount > 1) do
  begin
    if (AnsiUpperCase ( cdsIn.FieldByName('LOGIN').AsString) = 'ADMIN') then
      cdsIn.Next;

    Remove ;
  end;
  EnableControls ;
end;


procedure TfrmSelectUsuariosFazenda.DisableControls;
begin
  FSourceClientDataSet.DisableControls ;
  cdsIn.DisableControls ;
  cdsOut.DisableControls ;
end;

procedure TfrmSelectUsuariosFazenda.EnableControls;
begin
  FSourceClientDataSet.EnableControls ;
  cdsIn.EnableControls ;
  cdsOut.EnableControls ;
end;

procedure TfrmSelectUsuariosFazenda.InvertSelection(ACDS: TClientDataSet);
begin
   if (ACDS.Bof and ACDS.Eof) then
      Exit ;
    ACDS.Edit ;

    if ACDS.FieldByName( 'KCAD_FAZENDA' ).IsNull then
      ACDS.FieldByName( 'KCAD_FAZENDA' ).Value := FKFazenda
    else
      ACDS.FieldByName( 'KCAD_FAZENDA' ).Clear ;

    ACDS.Post ;
end;


procedure TfrmSelectUsuariosFazenda.SetSourceClientDataSet(
  const Value: TClientDataSet);
begin
  FSourceClientDataSet := Value ;

  cdsIn.CloneCursor ( FSourceClientDataSet, False, False )  ;
  cdsIn.Filter   := 'KCAD_FAZENDA IS NOT NULL' ;
  cdsIn.Filtered := True ;

  cdsOut.CloneCursor ( FSourceClientDataSet, False, False )  ;
  cdsOut.Filter   := 'KCAD_FAZENDA IS NULL' ;
  cdsOut.Filtered := True ;
end;


procedure TfrmSelectUsuariosFazenda.dbgInDblClick(Sender: TObject);
begin
  inherited;
  Remove
end;

procedure TfrmSelectUsuariosFazenda.dbgOutDblClick(Sender: TObject);
begin
  inherited;
  Add
end;


end.

