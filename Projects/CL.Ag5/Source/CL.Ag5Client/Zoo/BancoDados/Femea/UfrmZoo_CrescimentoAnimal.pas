unit UfrmZoo_CrescimentoAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  VCL.ExtCtrls, Data.DB, Tc.Data.DB.Helpers, UdtmZoo_CrescimentoAnimal, Tc.VCL.FormIntf, VCL.StdCtrls, VCL.Mask,
  VCL.DBCtrls, JvExMask, Tc.VCL.Edits, Tc.VCL.Edits.DBControls,
  Tc.VCL.Form,Tc.VCL.Application,
  CL.Ag5.NSMsgs,
  System.Actions, Tc.VCL.Extended.Mask, Wrappers  ;

type
  TfrmZoo_CrescimentoAnimal = class(TTcForm, ITcDataForm)
    Panel9: TPanel;
    JvDBUltimGrid10: TJvDBUltimGrid;
    dtsCrescimento: TDataSource;
    deDtCrescimento: TTcDBDateEdit;
    DBMemo1: TDBMemo;
  private
    { Private declarations }
    dtmZoo_CrescimentoAnimal : TdtmZoo_CrescimentoAnimal ;
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
    Procedure PrintData ;
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
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;

implementation

{$R *.dfm}

uses SysPrintGridDialog ;


procedure TfrmZoo_CrescimentoAnimal.Cancel;
begin
   dtmZoo_CrescimentoAnimal.CancelUpdates ;
   JvDBUltimGrid10.EditorMode := False ;
   JvDBUltimGrid10.CloseControl ;
end;

constructor TfrmZoo_CrescimentoAnimal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner );
  dtmZoo_CrescimentoAnimal := TdtmZoo_CrescimentoAnimal.Create ( self ) ;
  dtsCrescimento.DataSet := dtmZoo_CrescimentoAnimal.cdsCrescimento ;

  TCLAg5NSMsgEVT_PesoAltura.Subscribe( NeedRefresh );

end;

procedure TfrmZoo_CrescimentoAnimal.DeleteRecord;
begin
   if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
     exit ;
   dtmZoo_CrescimentoAnimal.DeleteRecord ;
end;

destructor TfrmZoo_CrescimentoAnimal.Destroy;
begin
  TCLAg5NSMsgEVT_PesoAltura.UnSubscribe(  NeedRefresh  ) ;
  inherited;
end;

procedure TfrmZoo_CrescimentoAnimal.EditRecord;
begin
   dtmZoo_CrescimentoAnimal.EditRecord ;
   JvDBUltimGrid10.SetFocus ;
   JvDBUltimGrid10.EditorMode := True ;
end;

function TfrmZoo_CrescimentoAnimal.GetBOF: boolean;
begin
   Result :=  dtmZoo_CrescimentoAnimal.cdsCrescimento.Bof ;
end;

function TfrmZoo_CrescimentoAnimal.GetEOF: boolean;
begin
    Result := dtmZoo_CrescimentoAnimal.cdsCrescimento.Eof ;
end;


procedure TfrmZoo_CrescimentoAnimal.InsertRecord;
begin
   dtmZoo_CrescimentoAnimal.NewRecord ;
   JvDBUltimGrid10.SetFocus ;
   JvDBUltimGrid10.EditorMode := True ;
end;

procedure TfrmZoo_CrescimentoAnimal.NeedRefresh(Sender: TCLAg5NSMsg );
begin
   with dtmZoo_CrescimentoAnimal do
     begin
      if ( cdsCrescimento.State in [dsInsert,dsEdit] ) or (cdsCrescimento.ChangeCount > 0 ) then
         exit ;

      ReOpenTables ;
     end;
end;

procedure TfrmZoo_CrescimentoAnimal.OtherOptions;
begin

end;

procedure TfrmZoo_CrescimentoAnimal.PrintData;
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( JvDBUltimGrid10, 'Crescimento animal' );
end;

function TfrmZoo_CrescimentoAnimal.QueryActiveDataActions: TTcDataActions;
begin
   Result := [ daInsert,daEdit, daDelete, daPrint ] ;

   with dtmZoo_CrescimentoAnimal.cdsCrescimento do
     begin
       if ( State in [dsInsert,dsEdit] ) or ( ChangeCount > 0 )  then
         Result := Result + [daSave,daCancel] - [daEdit,daDelete] ;
      if BOF and EOF then
       Result := Result - [daEdit,daDelete] ;
     end;

  if Application.LicenseState = lsReadOnly then
     Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;

function TfrmZoo_CrescimentoAnimal.QueryAllowedDataActions: TTcDataActions;
begin
  Result := [ daInsert,daEdit,daDelete,daSave,daCancel,daPrint,daOther ] ;
end;

procedure TfrmZoo_CrescimentoAnimal.Save;
begin
   dtmZoo_CrescimentoAnimal.ApplyUpdates ;
   JvDBUltimGrid10.EditorMode := False ;
   JvDBUltimGrid10.CloseControl ;
end;

procedure TfrmZoo_CrescimentoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_CrescimentoAnimal.MasterSource := FMasterSource ;
  dtmZoo_CrescimentoAnimal.OpenTables ;
end;

end.
