unit UfrmZoo_FilhosAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmZoo_FilhosAnimal, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.ExtCtrls, Data.DB, Tc.Data.DB.Helpers,
  Tc.VCL.FormIntf, VCL.ActnList, VCL.StdCtrls, JvExStdCtrls, JvCombobox,
  Tc.VCL.Form,Tc.VCL.Application,
  CL.Ag5.NSMsgs,
  JvDBCombobox, System.Actions, Wrappers ;

type
  TfrmZoo_FilhosAnimal = class(TTcForm, ITcDataForm)
    dtsFilhos: TDataSource;
    Panel6: TPanel;
    JvDBUltimGrid7: TJvDBUltimGrid;
    edNatimorto: TJvDBComboBox;
    procedure edNatimortoEnter(Sender: TObject);
    procedure JvDBUltimGrid7ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
  private
    { Private declarations }
    dtmZoo_FilhosAnimal : TdtmZoo_FilhosAnimal ;
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    //ITcDataForm
    function GetBOF : boolean ;
    function GetEOF : boolean ;
    procedure InsertRecord ;
    procedure EditRecord ;
    procedure DeleteRecord ;
    procedure Save ;
    procedure Cancel ;
    procedure PrintData ;
    procedure OtherOptions ;
    // security
    function QueryAllowedDataActions : TTcDataActions ;
    // active actions
    function QueryActiveDataActions : TTcDataActions ;
    // properties
    property BOF : boolean read GetBOF ;
    property EOF : boolean read GetEOF ;
    procedure NeedRefresh ( Sender : TCLAg5NSMsg ) ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    Destructor Destroy ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

{$R *.dfm}

uses SysPrintGridDialog ;


procedure TfrmZoo_FilhosAnimal.Cancel;
begin
  dtmZoo_FilhosAnimal.CancelUpdates ;
  JvDBUltimGrid7.EditorMode := False ;
  JvDBUltimGrid7.CloseControl ;
end;

constructor TfrmZoo_FilhosAnimal.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;
  dtmZoo_FilhosAnimal := TdtmZoo_FilhosAnimal.Create ( self ) ;
  dtsFilhos.DataSet := dtmZoo_FilhosAnimal.cdsFilhos ;
  TCLAg5NSMsgEVT_PartosAbortos.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_BancoDadosFemeaEventosReprodutivos.Subscribe( NeedRefresh ) ;
end;

procedure TfrmZoo_FilhosAnimal.NeedRefresh(Sender: TCLAg5NSMsg );
begin
  with dtmZoo_FilhosAnimal do
    begin
      if ( cdsFilhos.State in [dsInsert,dsEdit] ) or (cdsFilhos.ChangeCount > 0 ) then
         exit ;

     ReOpenTables
    end;
end;


procedure TfrmZoo_FilhosAnimal.DeleteRecord;
begin
   if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
     exit ;
    dtmZoo_FilhosAnimal.DeleteRecord
end;

destructor TfrmZoo_FilhosAnimal.Destroy;
begin
  TCLAg5NSMsgEVT_PartosAbortos.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_BancoDadosFemeaEventosReprodutivos.UnSubscribe( NeedRefresh ) ;
  inherited;
end;

procedure TfrmZoo_FilhosAnimal.EditRecord;
begin
  dtmZoo_FilhosAnimal.EditRecord ;
  JvDBUltimGrid7.SetFocus ;
  JvDBUltimGrid7.EditorMode := True ;
end;

procedure TfrmZoo_FilhosAnimal.edNatimortoEnter(Sender: TObject);
begin
  edNatimorto.DroppedDown := True ;
end;

function TfrmZoo_FilhosAnimal.GetBOF: boolean;
begin
   Result := dtmZoo_FilhosAnimal.cdsFilhos.bof ;
end;

function TfrmZoo_FilhosAnimal.GetEOF: boolean;
begin
   Result := dtmZoo_FilhosAnimal.cdsFilhos.eof ;
end;


procedure TfrmZoo_FilhosAnimal.InsertRecord;
begin
  dtmZoo_FilhosAnimal.NewRecord ;
  JvDBUltimGrid7.SetFocus ;
  JvDBUltimGrid7.EditorMode := True ;
end;

procedure TfrmZoo_FilhosAnimal.JvDBUltimGrid7ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := not dtmZoo_FilhosAnimal.cdsFilhos.IsEmpty
  and ( dtmZoo_FilhosAnimal.cdsFilhosKZOO_ANIMAL.isNull )
  and ( Field = dtmZoo_FilhosAnimal.cdsFilhosNATIMORTO ) ;

end;

procedure TfrmZoo_FilhosAnimal.OtherOptions;
begin

end;

procedure TfrmZoo_FilhosAnimal.PrintData;
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( JvDBUltimGrid7, 'Filhos animal' );
end;

function TfrmZoo_FilhosAnimal.QueryAllowedDataActions: TTcDataActions;
begin
  Result := [ daEdit, daPrint, daSave,daCancel ] ;
end;

function TfrmZoo_FilhosAnimal.QueryActiveDataActions: TTcDataActions;
begin
   Result := [ daPrint ] ;

   if not dtmZoo_FilhosAnimal.cdsFilhos.IsEmpty then
      Result := Result + [ daEdit ] ;

   if ( dtmZoo_FilhosAnimal.cdsFilhos.State in [dsInsert,dsEdit] )
     or ( dtmZoo_FilhosAnimal.cdsFilhos.ChangeCount > 0 ) then
     Result := Result + [daSave,daCancel] - [daEdit];

  if Application.LicenseState = lsReadOnly then
     Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;

procedure TfrmZoo_FilhosAnimal.Save;
begin
  dtmZoo_FilhosAnimal.ApplyUpdates ;
  JvDBUltimGrid7.EditorMode := False ;
  JvDBUltimGrid7.CloseControl ;
end;

procedure TfrmZoo_FilhosAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_FilhosAnimal.MasterSource := MasterSource ;
  dtmZoo_FilhosAnimal.OpenTables ;
end;

end.
