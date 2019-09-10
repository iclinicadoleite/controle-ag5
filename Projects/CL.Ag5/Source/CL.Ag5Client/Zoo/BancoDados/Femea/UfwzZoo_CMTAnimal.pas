unit UfwzZoo_CMTAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, VCL.Mask, VCL.DBCtrls, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UdtmZoo_CMTAnimal, Data.DB, Tc.Data.DB.Helpers, JvExExtCtrls, JvExtComponent, JvPanel,
  JvBaseEdits, JvDBControls, JvExMask, JvToolEdit, JvImage,
  JvExStdCtrls, JvCombobox, JvDBCombobox, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, Tc.VCL.Form,Tc.VCL.FormIntf,
  Tc.VCL.Application,
  System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers  ;

type
  TfwzZoo_CMTAnimal = class(TTcForm, ITcDataForm)
    dbgCMT: TJvDBUltimGrid;
    dtsCMT: TDataSource;
    JvDBDateEdit1: TTcDBDateEdit;
    DBMemo1: TDBMemo;
    Panel2: TPanel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure dbgCMTEnter(Sender: TObject);
    procedure dbgCMTShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgCMTKeyPress(Sender: TObject; var Key: Char);
    procedure dbgCMTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dtsCMTDataChange(Sender: TObject; Field: TField);
    procedure dbgCMTEditButtonClick(Sender: TObject);
  private
    { Private declarations }
    dtmZoo_CMTAnimal : TdtmZoo_CMTAnimal ;
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    procedure SetFuncionario ( TextToSearch : string);
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
    procedure Help ;
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
    class function Execute : boolean ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

uses SearchsZootecnico, Exceptions, SysPrintGridDialog ;

{$R *.dfm}

{ TfrmCustomWizard }



procedure TfwzZoo_CMTAnimal.Cancel;
begin
   dtmZoo_CMTAnimal.CancelUpdates ;
   dbgCMT.EditorMode := False ;
   dbgCMT.CloseControl ;
end;

constructor TfwzZoo_CMTAnimal.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;
   dtmZoo_CMTAnimal := TdtmZoo_CMTAnimal.Create ( self ) ;
   dtsCMT.DataSet := dtmZoo_CMTAnimal.cdsCMT ;

   TCLAg5NSMsgEVT_CMT.Subscribe( needRefresh );

end;

procedure TfwzZoo_CMTAnimal.DeleteRecord;
begin
   if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
     exit ;
  dtmZoo_CMTAnimal.DeleteRecord
end;

destructor TfwzZoo_CMTAnimal.Destroy;
begin
   TCLAg5NSMsgEVT_CMT.Subscribe( needRefresh );
  inherited;
end;

procedure TfwzZoo_CMTAnimal.dtsCMTDataChange(Sender: TObject; Field: TField);
begin
  inherited;
//  with dtmZoo_CMTAnimal, cdsCMT do
//     dtsCMT.AutoEdit := not ( bof and eof ) ;
end;

procedure TfwzZoo_CMTAnimal.EditRecord;
begin
   dtmZoo_CMTAnimal.EditRecord ;
   dbgCMT.SetFocus  ;
   dbgCMT.EditorMode := True ;
end;

class function TfwzZoo_CMTAnimal.Execute : boolean;
begin
  with Create ( nil ) do
  try
      Result := ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     free ;
  end ;

end ;

function TfwzZoo_CMTAnimal.GetBOF: boolean;
begin
  Result := dtmZoo_CMTAnimal.cdsCMT.Bof
end;

function TfwzZoo_CMTAnimal.GetEOF: boolean;
begin
  Result := dtmZoo_CMTAnimal.cdsCMT.Eof
end;

procedure TfwzZoo_CMTAnimal.Help;
begin

end;

procedure TfwzZoo_CMTAnimal.InsertRecord;
begin
   dtmZoo_CMTAnimal.NewRecord ;
   dbgCMT.SetFocus ;
   dbgCMT.EditorMode := True ;
end;

procedure TfwzZoo_CMTAnimal.NeedRefresh(Sender: TCLAg5NSMsg);
begin
   with dtmZoo_CMTAnimal do
     begin
      if ( cdsCMT.State in [dsInsert,dsEdit] ) or (cdsCMT.ChangeCount > 0 ) then
         exit ;

      ReOpenTables ;
     end;
end;

procedure TfwzZoo_CMTAnimal.OtherOptions;
begin

end;

procedure TfwzZoo_CMTAnimal.dbgCMTEditButtonClick(Sender: TObject);
begin
  inherited;
  with dtmZoo_CMTAnimal, dbgCMT do
    if ( SelectedField = cdsCMTNOMEFUNCIONARIO ) then
        self.SetFuncionario ( InplaceEditor.Text ) ;
end;

procedure TfwzZoo_CMTAnimal.dbgCMTEnter(Sender: TObject);
begin
  inherited;
  dbgCMT.SelectedField := dtmZoo_CMTAnimal.cdsCMTAD ;
end;

procedure TfwzZoo_CMTAnimal.dbgCMTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key =  VK_INSERT then
     Key := 0 ;
end;

procedure TfwzZoo_CMTAnimal.dbgCMTKeyPress(Sender: TObject; var Key: Char);
var
 SkipDone : boolean ;
begin
  if ( Key <> #13 ) then
    exit ;

  with dtmZoo_CMTAnimal, dbgCMT do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsCMTNOMEFUNCIONARIO ) then
         begin
            self.SetFUNCIONARIO ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;

   if (  Screen.ActiveControl = dbgCMT ) then
     begin
        //Key := #0 ;
        exit ;
     end;

   with (dbgCMT) do
       begin
          SkipDone := False ;
          while selectedindex < (fieldcount - 1) do
            begin
              selectedindex := selectedindex + 1 ;
              if ( not Columns[ selectedindex ].ReadOnly ) and ( Columns[ selectedindex ].Visible ) then
               begin
                 SkipDone := True ;
                 Break ;
               end;
           end ;

          if not SkipDone then
             begin
               DataSource.DataSet.Next;
               selectedindex := 0 ;
               while ( Columns[ selectedindex ].ReadOnly or not Columns[ selectedindex ].Visible ) and (selectedindex < (fieldcount - 1)) do
                  selectedindex := selectedindex + 1 ;
             end ;
      end;
end;

procedure TfwzZoo_CMTAnimal.dbgCMTShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;

  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) { or ( IsEmpty )} )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) { or ( IsEmpty )} ) ;

end;


procedure TfwzZoo_CMTAnimal.PrintData;
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( dbgCMT, 'CMT do animal' );
end;

function TfwzZoo_CMTAnimal.QueryActiveDataActions: TTcDataActions;
begin
   Result := [ daInsert,daEdit, daDelete, daPrint ] ;

   with dtmZoo_CMTAnimal.cdsCMT do
     begin
       if ( State in [dsInsert,dsEdit] ) or ( ChangeCount > 0 )  then
          Result := Result + [daSave,daCancel] - [daEdit,daDelete] ;
       if BOF and EOF then
        Result := Result - [daEdit,daDelete] ;
     end;

   if Application.LicenseState = lsReadOnly then
      Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;

function TfwzZoo_CMTAnimal.QueryAllowedDataActions: TTcDataActions;
begin
  Result := [ daInsert,daEdit,daDelete,daSave,daCancel,daPrint,daOther ] ;
end;


procedure TfwzZoo_CMTAnimal.Save;
begin
  dtmZoo_CMTAnimal.ApplyUpdates ;
  dbgCMT.EditorMode := False ;
  dbgCMT.CloseControl ;
end;


procedure TfwzZoo_CMTAnimal.SetFuncionario(TextToSearch: string);
begin
    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               dtmZoo_CMTAnimal.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;
end;

procedure TfwzZoo_CMTAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_CMTAnimal.MasterSource := FMasterSource ;
  dtmZoo_CMTAnimal.OpenTables ;
end;


procedure TfwzZoo_CMTAnimal._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;

end;

procedure TfwzZoo_CMTAnimal._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

end.


