unit UfwzZoo_CondicaoCorporalAnimal;

{ DONE -oCaique -cDados do Periodo / Sanidade : - Acertar tela para abrir em aba }
{ DONE -oCaique -cDados do Periodo / Sanidade : - pesquisa de animais }
{ DONE -oCaique -cDados do Periodo / Sanidade : - checar tabelas }
{ DONE -oCaique -cDados do Periodo / Sanidade : - Acertar campos da grid }
{ DONE 5  -oCaique -cDados do Periodo / Sanidade : - Corrigir Edicao de Memo }
{ DONE -oCaique -cDados do Periodo / Sanidade : - Alterar Barra de Título }
{ DONE -oCaique -cDados do Periodo / Sanidade : - Alterar Posição Titulo }
{ DONE -oCaique -cDados do Periodo / Sanidade : - Incluir Botão fechar }

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  VCL.Mask, VCL.DBCtrls, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UdtmZoo_CondicaoCorporalAnimal, Data.DB, Tc.Data.DB.Helpers, JvExExtCtrls, JvExtComponent,
  JvPanel, JvBaseEdits, JvDBControls, JvExMask, JvToolEdit, JvImage,
  SysFormWizard, Tc.VCL.Edits, Tc.VCL.Edits.DBControls,
  Tc.VCL.Application,
  Tc.VCL.Form, Tc.VCL.FormIntf, System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TfwzZoo_CondicaoCorporalAnimal = class(TTcForm, ITcDataForm)
    dbgCC: TJvDBUltimGrid;
    DataSource1: TDataSource;
    JvDBDateEdit1: TTcDBDateEdit;
    JvDBCalcEdit1: TJvDBCalcEdit;
    DBMemo1: TDBMemo;
    Panel2: TPanel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure dbgCCEnter(Sender: TObject);
    procedure dbgCCShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgCCEditButtonClick(Sender: TObject);
    procedure dbgCCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgCCKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FKFuncionario : string ;
    dtmZoo_CondicaoCorporalAnimal : TdtmZoo_CondicaoCorporalAnimal ;
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
    procedure needRefresh ( Sender : TCLAg5NSMsg  ) ;
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


procedure TfwzZoo_CondicaoCorporalAnimal.Cancel;
begin
   dtmZoo_CondicaoCorporalAnimal.CancelUpdates ;
   dbgCC.EditorMode := False ;
   dbgCC.CloseControl ;
end;

constructor TfwzZoo_CondicaoCorporalAnimal.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;
   dtmZoo_CondicaoCorporalAnimal := TdtmZoo_CondicaoCorporalAnimal.Create ( self ) ;
   dtmZoo_CondicaoCorporalAnimal.MasterSource := FMasterSource ;
   DataSource1.DataSet := dtmZoo_CondicaoCorporalAnimal.cdsCC ;

   TCLAg5NSMsgEVT_CC.Subscribe( needRefresh );

end;


procedure TfwzZoo_CondicaoCorporalAnimal.DeleteRecord;
begin
   if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
     exit ;
   dtmZoo_CondicaoCorporalAnimal.DeleteRecord
end;

destructor TfwzZoo_CondicaoCorporalAnimal.Destroy;
begin
   TCLAg5NSMsgEVT_CC.Subscribe( needRefresh );
  inherited;
end;

procedure TfwzZoo_CondicaoCorporalAnimal.EditRecord;
begin
   dtmZoo_CondicaoCorporalAnimal.EditRecord ;
   dbgCC.SetFocus ;
   dbgCC.EditorMode := True ;
end;

class function TfwzZoo_CondicaoCorporalAnimal.Execute : boolean;
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


function TfwzZoo_CondicaoCorporalAnimal.GetBOF: boolean;
begin
   Result := dtmZoo_CondicaoCorporalAnimal.cdsCC.bof
end;

function TfwzZoo_CondicaoCorporalAnimal.GetEOF: boolean;
begin
   Result := dtmZoo_CondicaoCorporalAnimal.cdsCC.Eof
end;

procedure TfwzZoo_CondicaoCorporalAnimal.Help;
begin

end;

procedure TfwzZoo_CondicaoCorporalAnimal.InsertRecord;
begin
   dtmZoo_CondicaoCorporalAnimal.NewRecord ;
   dbgCC.SetFocus ;
   dbgCC.EditorMode := True ;
end;

procedure TfwzZoo_CondicaoCorporalAnimal.needRefresh(Sender: TCLAg5NSMsg );
begin
   with dtmZoo_CondicaoCorporalAnimal do
     begin
      if ( cdsCC.State in [dsInsert,dsEdit] ) or (cdsCC.ChangeCount > 0 ) then
         exit ;

      ReOpenTables
     end ;
end;

procedure TfwzZoo_CondicaoCorporalAnimal.OtherOptions;
begin

end;

procedure TfwzZoo_CondicaoCorporalAnimal.PrintData;
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( dbgCC, 'Condição corporal do animal' );
end;

procedure TfwzZoo_CondicaoCorporalAnimal.dbgCCEditButtonClick(Sender: TObject);
begin
   with dtmZoo_CondicaoCorporalAnimal, dbgCC do
       if ( SelectedField = cdsCCNOMEFUNCIONARIO ) then
            self.SetFuncionario ( InplaceEditor.Text ) ;
end;

procedure TfwzZoo_CondicaoCorporalAnimal.dbgCCEnter(Sender: TObject);
begin
  inherited;
  dbgCC.SelectedField := dtmZoo_CondicaoCorporalAnimal.cdsCCDATA ;
end;

procedure TfwzZoo_CondicaoCorporalAnimal.dbgCCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key =  VK_INSERT then
     Key := 0 ;
end;

procedure TfwzZoo_CondicaoCorporalAnimal.dbgCCKeyPress(Sender: TObject; var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key <> #13 ) then
    exit ;

  with dtmZoo_CondicaoCorporalAnimal, dbgCC do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsCCNOMEFUNCIONARIO ) then
         begin
            self.SetFUNCIONARIO ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;


   if (  Screen.ActiveControl = dbgCC ) then
      Key := #0 ;

   with (dbgCC) do
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

procedure TfwzZoo_CondicaoCorporalAnimal.dbgCCShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( Columns [ Col - 1 ].ReadOnly )
    else
      AllowEdit := not ( Columns [ Col ].ReadOnly ) ;
end;

function TfwzZoo_CondicaoCorporalAnimal.QueryActiveDataActions: TTcDataActions;
begin
   Result := [ daInsert,daEdit, daDelete, daPrint ] ;

   with dtmZoo_CondicaoCorporalAnimal.cdsCC do
     begin
       if ( State in [dsInsert,dsEdit] ) or ( ChangeCount > 0 )  then
          Result := Result + [daSave,daCancel] - [daEdit,daDelete] ;
       if BOF and EOF then
        Result := Result - [daEdit,daDelete] ;
     end;

   if Application.LicenseState = lsReadOnly then
      Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;

function TfwzZoo_CondicaoCorporalAnimal.QueryAllowedDataActions: TTcDataActions;
begin
  Result := [ daInsert,daEdit,daDelete,daSave,daCancel,daPrint,daOther ] ;
end;

procedure TfwzZoo_CondicaoCorporalAnimal.Save;
begin
  dtmZoo_CondicaoCorporalAnimal.ApplyUpdates ;
  dbgCC.EditorMode := False ;
  dbgCC.CloseControl ;
end;


procedure TfwzZoo_CondicaoCorporalAnimal.SetFuncionario(TextToSearch: string);
begin
    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;

          if Execute then
             dtmZoo_CondicaoCorporalAnimal.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;

       finally
          free ;
       end ;
end;

procedure TfwzZoo_CondicaoCorporalAnimal.SetMasterSource(
  const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_CondicaoCorporalAnimal.MasterSource := FMasterSource ;
  dtmZoo_CondicaoCorporalAnimal.OpenTables ;
end;



procedure TfwzZoo_CondicaoCorporalAnimal._actExecuteExecute(Sender: TObject);
begin  dtmZoo_CondicaoCorporalAnimal.ApplyUpdates ;
  inherited;
end;


procedure TfwzZoo_CondicaoCorporalAnimal._actNextExecute(Sender: TObject);
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

procedure TfwzZoo_CondicaoCorporalAnimal._actPriorExecute(Sender: TObject);
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


