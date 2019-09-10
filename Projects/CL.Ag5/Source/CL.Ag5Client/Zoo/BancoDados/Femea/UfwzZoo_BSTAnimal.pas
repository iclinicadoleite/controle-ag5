unit UfwzZoo_BSTAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  VCL.Mask, VCL.DBCtrls, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UdtmZoo_BSTAnimal, Data.DB, Tc.Data.DB.Helpers, JvExExtCtrls, JvExtComponent, JvPanel,
  JvExMask, JvToolEdit, JvDBControls, JvImage, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, Tc.VCL.Form,Tc.VCL.FormIntf,
  Tc.VCL.Application,
  System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TfwzZoo_BSTAnimal = class(TTcForm, ITcDataForm)
    dbgBST: TJvDBUltimGrid;
    dtsBST: TDataSource;
    DBMemo1: TDBMemo;
    JvDBDateEdit1: TTcDBDateEdit;
    Panel2: TPanel;
    Panel1: TPanel;
    dtsLactacoes: TDataSource;
    JvDBUltimGrid1: TJvDBUltimGrid;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure dbgBSTShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgBSTEnter(Sender: TObject);
    procedure dbgBSTEditButtonClick(Sender: TObject);
    procedure dbgBSTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgBSTKeyPress(Sender: TObject; var Key: Char);
    procedure dtsBSTDataChange(Sender: TObject; Field: TField);
    function dbgBSTCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
  private
    { Private declarations }
    dtmZoo_BSTAnimal : TdtmZoo_BSTAnimal ;
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
    // security
    function QueryAllowedDataActions : TTcDataActions ;
    // active actions
    function QueryActiveDataActions : TTcDataActions ;
    // properties
    property BOF : boolean read GetBOF ;
    property EOF : boolean read GetEOF ;
    procedure NeedRefresh ( Sender : TCLAg5NSMsg  ) ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    Destructor Destroy ; override ;
    class function Execute : boolean ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

Uses SysPrintGridDialog, SearchsZootecnico, Exceptions ;

{$R *.dfm}

{ TfrmCustomWizard }


procedure TfwzZoo_BSTAnimal.Cancel;
begin
  dtmZoo_BSTAnimal.CancelUpdates ;
  dbgBST.EditorMode := False ;
  dbgBST.CloseControl ;
end;

constructor TfwzZoo_BSTAnimal.Create ( AOwner : TComponent  ) ;
begin
   inherited Create ( AOwner ) ;
   dtmZoo_BSTAnimal := TdtmZoo_BSTAnimal.Create ( self ) ;
   dtsLactacoes.DataSet := dtmZoo_BSTAnimal.cdsLactacoes ;
   dtsBST.DataSet := dtmZoo_BSTAnimal.cdsBST ;

   TCLAg5NSMsgEVT_BST.Subscribe( needRefresh );

end;

procedure TfwzZoo_BSTAnimal.DeleteRecord;
begin
   if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
     exit ;
  dtmZoo_BSTAnimal.DeleteRecord
end;

destructor TfwzZoo_BSTAnimal.Destroy;
begin
   TCLAg5NSMsgEVT_BST.UnSubscribe( needRefresh );
  inherited;
end;

procedure TfwzZoo_BSTAnimal.dtsBSTDataChange(Sender: TObject; Field: TField);
begin
  inherited;
//  with dtmZoo_BSTAnimal, cdsBST do
//     dtsBST.AutoEdit := not ( bof and eof ) ;
end;

procedure TfwzZoo_BSTAnimal.EditRecord;
begin
   dtmZoo_BSTAnimal.EditRecord ;
   dbgBST.SetFocus ;
   dbgBST.EditorMode := True ;
end;

class function TfwzZoo_BSTAnimal.Execute : boolean;
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


function TfwzZoo_BSTAnimal.GetBOF: boolean;
begin
   Result := dtmZoo_BSTAnimal.cdsBST.bof
end;

function TfwzZoo_BSTAnimal.GetEOF: boolean;
begin
  Result := dtmZoo_BSTAnimal.cdsBST.Eof
end;

procedure TfwzZoo_BSTAnimal.InsertRecord;
begin
   dtmZoo_BSTAnimal.NewRecord ;
   dbgBST.SetFocus ;
   dbgBST.EditorMode := True ;
end;

procedure TfwzZoo_BSTAnimal.NeedRefresh(Sender: TCLAg5NSMsg );
begin
   with dtmZoo_BSTAnimal do
     begin
      if ( cdsBST.State in [dsInsert,dsEdit] ) or (cdsBST.ChangeCount > 0 ) then
         exit ;

       ReOpenTables ;
     end;
end;

procedure TfwzZoo_BSTAnimal.OtherOptions;
begin

end;

function TfwzZoo_BSTAnimal.dbgBSTCheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin
  Result := Assigned ( Field )
     and ( (Field.FieldName  = 'APLICADO'   )
  )  ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TfwzZoo_BSTAnimal.dbgBSTEditButtonClick(Sender: TObject);
begin
  inherited;
   with dtmZoo_BSTAnimal, dbgBST do
       if ( SelectedField = cdsBSTNOMEFUNCIONARIO ) then
            self.SetFuncionario ( InplaceEditor.Text ) ;
end;

procedure TfwzZoo_BSTAnimal.dbgBSTEnter(Sender: TObject);
begin
  inherited;
  dbgBST.SelectedField := dtmZoo_BSTAnimal.cdsBSTDATA ;
end;

procedure TfwzZoo_BSTAnimal.dbgBSTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key =  VK_INSERT then
     Key := 0 ;
end;

procedure TfwzZoo_BSTAnimal.dbgBSTKeyPress(Sender: TObject; var Key: Char);
var
 SkipDone : boolean ;
begin
  if ( Key <> #13 ) then
    exit ;

  with dtmZoo_BSTAnimal, dbgBST do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsBSTNOMEFUNCIONARIO ) then
         begin
            self.SetFUNCIONARIO ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;

   if (  Screen.ActiveControl = dbgBST ) then
      Key := #0 ;

   with (dbgBST) do
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

procedure TfwzZoo_BSTAnimal.dbgBSTShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( Columns [ Col - 1 ].ReadOnly  )
    else
      AllowEdit := not (  Columns [ Col ].ReadOnly ) ;
end;

procedure TfwzZoo_BSTAnimal.PrintData;
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( dbgBST, 'BST do animal' );
end;

function TfwzZoo_BSTAnimal.QueryActiveDataActions: TTcDataActions;
begin
   if  dtmZoo_BSTAnimal.cdsLactacoes.IsEmpty then
      Exit ( [] ) ;

   if not dtmZoo_BSTAnimal.cdsLactacoesDATA_SECAGEM.isNull then
     Result := [ daPrint ] ;

   with dtmZoo_BSTAnimal.cdsBST do
     begin
       if ( State in [dsInsert,dsEdit] ) or ( ChangeCount > 0 )  then
          Result := Result + [daSave,daCancel] - [daEdit,daDelete] ;
       if BOF and EOF then
        Result := Result - [daEdit,daDelete] ;
     end;

   if Application.LicenseState = lsReadOnly then
      Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;

function TfwzZoo_BSTAnimal.QueryAllowedDataActions: TTcDataActions;
begin
  Result := [ daInsert,daEdit,daDelete,daSave,daCancel,daPrint,daOther ] ;
end;

procedure TfwzZoo_BSTAnimal.Save;
begin
  dtmZoo_BSTAnimal.ApplyUpdates ;
  dbgBST.EditorMode := False ;
  dbgBST.CloseControl ;
end;


procedure TfwzZoo_BSTAnimal.SetFuncionario(TextToSearch: string);
begin
  with TSearchFuncionarioAtivo.Create do
     try
        TextToFind := TextToSearch ;
        if Execute then
           begin
             dtmZoo_BSTAnimal.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
           end ;
     finally
        free ;
     end ;

end;

procedure TfwzZoo_BSTAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_BSTAnimal.MasterSource  := FMasterSource ;
  dtmZoo_BSTAnimal.OpenTables ;
end;



procedure TfwzZoo_BSTAnimal._actExecuteExecute(Sender: TObject);
begin
  dtmZoo_BSTAnimal.ApplyUpdates ;
  inherited;
end;

procedure TfwzZoo_BSTAnimal._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  Try
//    _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  not dtmZoo_BSTAnimal.cdsBST.IsEmpty ;
  except
  End;
end;

procedure TfwzZoo_BSTAnimal._actNextExecute(Sender: TObject);
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

procedure TfwzZoo_BSTAnimal._actPriorExecute(Sender: TObject);
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


