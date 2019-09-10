unit UfrmZoo_ClassificacaoAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.ExtCtrls, UdtmZoo_ClassificacaoAnimal, Data.DB, Tc.Data.DB.Helpers,
  Tc.VCL.FormIntf, VCL.StdCtrls, VCL.Mask, JvExMask, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, JvToolEdit, JvBaseEdits, JvDBControls, VCL.DBCtrls,
  Tc.VCL.Form, Tc.VCL.Application,
  Tc.VCL.Extended.Mask, System.Actions, Wrappers ;

type

  TJvDBUltimGrid =  class (  Wrappers.TJvDBUltimGrid )
    procedure Loaded ; override ;
  end;


  TfrmZoo_ClassificacaoAnimal = class(TTcForm, ITcDataForm)
    Panel7: TPanel;
    dbgClassificacao: TJvDBUltimGrid;
    dtsDadosClassificacao: TDataSource;
    TcMPDBDateEdit1: TTcDBDateEdit;
    dbePontuacaoFinal: TJvDBCalcEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    procedure dbgClassificacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    dtmZoo_ClassificacaoAnimal : TdtmZoo_ClassificacaoAnimal ;
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
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

{$R *.dfm}

uses SysPrintGridDialog ;


procedure TfrmZoo_ClassificacaoAnimal.Cancel;
begin
   dtmZoo_ClassificacaoAnimal.CancelUpdates ;
   dbgClassificacao.EditorMode := False ;
   dbgClassificacao.CloseControl ;
end;

constructor TfrmZoo_ClassificacaoAnimal.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner );
  dtmZoo_ClassificacaoAnimal := TdtmZoo_ClassificacaoAnimal.Create ( self ) ;
  dtsDadosClassificacao.DataSet := dtmZoo_ClassificacaoAnimal.cdsClassificacao ;

  dbgClassificacao.TitleRowHeight := dbgClassificacao.TitleRowHeight * 2;

  dbgClassificacao.GroupColumns.Add( '=1' ) ;
  dbgClassificacao.GroupColumns.Add( 'Força leiteira 22%=7' ) ;
  dbgClassificacao.GroupColumns.Add( 'Garupa 10%=4' ) ;
  dbgClassificacao.GroupColumns.Add( 'Pernas e pés 26%=6' ) ;
  dbgClassificacao.GroupColumns.Add( 'Sistema mamário 42%=10' ) ;
  dbgClassificacao.GroupColumns.Add( 'Avaliação final=4' ) ;

end;

procedure TfrmZoo_ClassificacaoAnimal.dbgClassificacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if  ( Key = VK_BACK )
   and Assigned ( dbgClassificacao.InplaceEditor )
   and ( dbgClassificacao.InplaceEditor.SelLength = Length ( dbgClassificacao.InplaceEditor.Text ) )  then
      Key := VK_DELETE ;

end;

procedure TfrmZoo_ClassificacaoAnimal.DeleteRecord;
begin
   if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
     exit ;
   dtmZoo_ClassificacaoAnimal.DeleteRecord ;
end;

procedure TfrmZoo_ClassificacaoAnimal.EditRecord;
begin
   dtmZoo_ClassificacaoAnimal.EditRecord;
   dbgClassificacao.SetFocus ;
   dbgClassificacao.EditorMode := True ;
end;

function TfrmZoo_ClassificacaoAnimal.GetBOF: boolean;
begin
   Result := dtmZoo_ClassificacaoAnimal.cdsClassificacao.Bof ;
end;

function TfrmZoo_ClassificacaoAnimal.GetEOF: boolean;
begin
   Result := dtmZoo_ClassificacaoAnimal.cdsClassificacao.Eof ;
end;


procedure TfrmZoo_ClassificacaoAnimal.InsertRecord;
begin
   dtmZoo_ClassificacaoAnimal.NewRecord ;
   dbgClassificacao.SetFocus ;
   dbgClassificacao.EditorMode := True ;
end;

procedure TfrmZoo_ClassificacaoAnimal.OtherOptions;
begin
//
end;

procedure TfrmZoo_ClassificacaoAnimal.PrintData;
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( dbgClassificacao, 'Classificação animal' );
end;

function TfrmZoo_ClassificacaoAnimal.QueryActiveDataActions: TTcDataActions;
begin
   Result := [ daInsert,daEdit, daDelete, daPrint ] ;

   with dtmZoo_ClassificacaoAnimal.cdsClassificacao do
     begin
       if ( State in [dsInsert,dsEdit] )
         or ( ChangeCount > 0 )  then
       Result := Result + [daSave,daCancel] - [daEdit,daDelete] ;
      if BOF and EOF then
       Result := Result - [daDelete] ;
     end;

  if Application.LicenseState = lsReadOnly then
     Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;

function TfrmZoo_ClassificacaoAnimal.QueryAllowedDataActions: TTcDataActions;
begin
  Result := [ daInsert,daEdit,daDelete,daSave,daCancel,daPrint,daOther ] ;
end;

procedure TfrmZoo_ClassificacaoAnimal.Save;
begin
   dtmZoo_ClassificacaoAnimal.ApplyUpdates ;
   dbgClassificacao.EditorMode := False ;
   dbgClassificacao.CloseControl ;
end;

procedure TfrmZoo_ClassificacaoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_ClassificacaoAnimal.MasterSource := FMasterSource ;
  dtmZoo_ClassificacaoAnimal.OpenTables;
end;

{ TJvDBUltimGrid }

procedure TJvDBUltimGrid.Loaded;
begin
  FDisableAutoLoad := True ;
  inherited;
end;

end.
