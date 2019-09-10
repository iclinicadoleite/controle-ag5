// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : - Classe base para montagem das telas
//                  de relatórios
// License      : veja readme.txt



unit UFin_RelatoriosBaseWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, SysPrintGridDialog, Data.DB, Tc.Data.DB.Helpers,
  JvDBControls, Tc.VCL.Edits.DBControls, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Application, Wrappers ;

type
  TFin_RelatoriosBaseWizard = class(T_FormWizard)
    TabSheetParametros: TTabSheet;
    TabSheetResultado: TTabSheet;
    DBGridResultados: TJvDBUltimGrid;
    dtsResultado: TDataSource;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
  private
    {
    procedure TcMPFormCreate(Sender: TObject); Private declarations }
    FEditorsList : TList ;
    FDBGridResultados : TJvDBUltimGrid ;
    procedure OpenTerminated ( Sender : TObject ) ;
    procedure AddEditor ( AColumn : TColumn ) ;
  protected
    procedure ClearEditors ;
    procedure Loaded ; override ;
    procedure OpenTables ; virtual ;
  public
    { Public declarations }
    procedure EditControlsDBGrid;
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

uses  ThreadSuppl ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TFin_RelatoriosBaseWizard.AddEditor(AColumn: TColumn);
var
  AControl : TControl ;
begin
  AControl := nil ;

//  if AColumn.Field is TBlobField then
//    begin
//      AControl := TDBMemo.Create (  Self ) ;
//      TDBMemo ( AControl ).DataSource := dtsResultado ;
//      TDBMemo ( AControl ).DataField  := AColumn.FieldName ;
//    end
//  else
  if ( AColumn.Field is TDateTimeField ) or ( AColumn.Field is TSQLTimeStampField ) then
    begin
      AControl := TTcDBDateEdit.Create (  Self ) ;
      TTcDBDateEdit ( AControl ).DataSource := dtsResultado ;
      TTcDBDateEdit ( AControl ).DataField  := AColumn.FieldName ;
    end
  else if (AColumn.Field is TFloatField) then
    begin
      AControl := TJvDBCalcEdit.Create (  Self ) ;
      TJvDBCalcEdit ( AControl ).DataSource := dtsResultado ;
      TJvDBCalcEdit ( AControl ).DataField  := AColumn.FieldName ;
      TJvDBCalcEdit ( AControl ).ShowButton := False ;
    end ;

  if not Assigned ( AControl ) then
     exit ;

  AControl.Visible := False ;
  AControl.Parent  := FDBGridResultados.Parent ;
  FEditorsList.Add( AControl ) ;
  AControl.Name := Format ( 'InPlaceEditor%d', [ FEditorsList.Count ] ) ;

  with FDBGridResultados.EditControls.Add do
     begin
         FieldName       := AColumn.FieldName ;
         ControlName     := AControl.Name ;
         LeaveOnEnterKey := True ;
         if AControl is  TDBMemo then
            FitCell := fcDesignSize
      end;
end;

procedure TFin_RelatoriosBaseWizard.ClearEditors;
var
  x : integer ;
begin
  for x := 0 to FEditorsList.Count - 1 do
    TObject ( FEditorsList[ x ] ).Free ;
  FEditorsList.Clear ;
end;

constructor TFin_RelatoriosBaseWizard.Create(AOwner: TComponent);
begin
  inherited;
  FEditorsList := TList.Create ;
  FDBGridResultados := DBGridResultados ;
  ThreadSuppl.TSyncThread.Create ( OpenTables ).OnTerminate := OpenTerminated ;
end;

destructor TFin_RelatoriosBaseWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TFin_RelatoriosBaseWizard.EditControlsDBGrid;
var
 x : integer ;
begin
  ClearEditors ;

  for x := 0 to FDBGridResultados.Columns.Count -1 do
      AddEditor ( FDBGridResultados.Columns[ x ] ) ;
end;

class function TFin_RelatoriosBaseWizard.Execute : boolean;
var
  ThisForm: TFin_RelatoriosBaseWizard;
begin
  ThisForm := TFin_RelatoriosBaseWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TFin_RelatoriosBaseWizard.Loaded;
begin
  inherited;
  DBGridResultados.Visible := False ;
  TabSheetParametros.Enabled := TabSheetParametros.ControlCount > 0 ;
end;

procedure TFin_RelatoriosBaseWizard.OpenTables;
begin
//
end;

procedure TFin_RelatoriosBaseWizard.OpenTerminated(Sender: TObject);
begin
  FDBGridResultados.Visible := True ;
end;

procedure TFin_RelatoriosBaseWizard._actExecuteExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( FDBGridResultados, Caption );
  inherited;
end;

procedure TFin_RelatoriosBaseWizard._actNextExecute(Sender: TObject);
begin

  EditControlsDBGrid;

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;

end;

procedure TFin_RelatoriosBaseWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

initialization
  RegisterClass ( TFin_RelatoriosBaseWizard );
end.
