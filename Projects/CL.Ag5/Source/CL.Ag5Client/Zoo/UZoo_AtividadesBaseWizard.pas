// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality : - Classe base para montagem das telas
//                  de Atividades a executar
// License      : veja readme.txt






unit UZoo_AtividadesBaseWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, SysPrintGridDialog, Data.DB, Tc.Data.DB.Helpers,
  JvDBControls, Tc.VCL.Edits.DBControls, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Application, Wrappers  ;

type
  TZoo_AtividadesBaseWizard = class(T_FormWizard)
    TabSheetParametros: TTabSheet;
    TabSheetResultado: TTabSheet;
    DBGridResultados: TJvDBUltimGrid;
    dtsResultado: TDataSource;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure DBGridResultadosDblClick(Sender: TObject);
  private
    { Private declarations }
    FEditorsList : TList ;
    FDBGridResultados : TJvDBUltimGrid ;
    FLegenda: string;
    procedure AddEditor ( AColumn : TColumn ) ;
    procedure SetLegenda(const Value: string);
  protected
    procedure OpenTerminated ( Sender : TObject ) ; virtual ;
    procedure ClearEditors ;
    procedure Loaded ; override ;
    procedure OpenTables ; virtual ;
    property Legenda : string  read FLegenda write SetLegenda;
  public
    { Public declarations }
    procedure EditControlsDBGrid;
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

uses
     ThreadSuppl
   , ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_AtividadesBaseWizard.AddEditor(AColumn: TColumn);
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
      AControl.Parent  := FDBGridResultados.Parent ;
      TTcDBDateEdit ( AControl ).DataSource := dtsResultado ;
      TTcDBDateEdit ( AControl ).DataField  := AColumn.FieldName ;
    end
  else if (AColumn.Field is TFloatField) then
    begin
      AControl := TJvDBCalcEdit.Create (  Self ) ;
      AControl.Parent  := FDBGridResultados.Parent ;
      TJvDBCalcEdit ( AControl ).DataSource := dtsResultado ;
      TJvDBCalcEdit ( AControl ).DataField  := AColumn.FieldName ;
      TJvDBCalcEdit ( AControl ).ShowButton := False ;
    end ;

  if not Assigned ( AControl ) then
     exit ;

  AControl.Visible := False ;
  //AControl.Parent  := FDBGridResultados.Parent ;
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

procedure TZoo_AtividadesBaseWizard.ClearEditors;
var
  x : integer ;
begin
  for x := 0 to FEditorsList.Count - 1 do
    TObject ( FEditorsList[ x ] ).Free ;
  FEditorsList.Clear ;
end;

constructor TZoo_AtividadesBaseWizard.Create(AOwner: TComponent);
begin
  inherited;
  FEditorsList := TList.Create ;
  _actExecute.Caption := 'V&isualizar' ;
  _btbExecute.Caption := 'V&isualizar' ;
  FDBGridResultados   := DBGridResultados ;

  DBGridResultados.ShowHighlighter := True ;

  ThreadSuppl.TSyncThread.Create ( OpenTables ).OnTerminate := OpenTerminated ;
//  ThreadSuppl.TSimpleThread.Create ( OpenTables ).OnTerminate := OpenTerminated ;

end;

procedure TZoo_AtividadesBaseWizard.DBGridResultadosDblClick(Sender: TObject);
begin
  inherited;
  if ( FDBGridResultados.ScreenToClient( Mouse.CursorPos ).Y <= FDBGridResultados.TitleRowHeight ) then
    exit ;

  with FDBGridResultados.DataSource, DataSet do
  if Assigned ( DataSet ) and not ( BOF and EOF ) then
    if Assigned ( Fields.FindField( 'KZOO_ANIMAL_FEMEA'  ) ) then
     TShowFichaAnimal.Execute( FieldByName('KZOO_ANIMAL_FEMEA').AsString )
    else if Assigned ( Fields.FindField( 'KZOO_ANIMAL'  ) ) then
     TShowFichaAnimal.Execute( FieldByName('KZOO_ANIMAL').AsString );
end;

destructor TZoo_AtividadesBaseWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  ClearEditors ;
  inherited;
end;

procedure TZoo_AtividadesBaseWizard.EditControlsDBGrid;
var
 x : integer ;
begin
  ClearEditors ;

  for x := 0 to FDBGridResultados.Columns.Count -1 do
      AddEditor ( FDBGridResultados.Columns[ x ] ) ;
end;

class function TZoo_AtividadesBaseWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesBaseWizard;
begin
  ThisForm := TZoo_AtividadesBaseWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_AtividadesBaseWizard.Loaded;
begin
  inherited;
  DBGridResultados.Visible := False ;
  TabSheetParametros.Enabled := TabSheetParametros.ControlCount > 0 ;
end;

procedure TZoo_AtividadesBaseWizard.OpenTables;
begin
//
end;

procedure TZoo_AtividadesBaseWizard.OpenTerminated(Sender: TObject);
begin
  FDBGridResultados.Visible := True ;
end;

procedure TZoo_AtividadesBaseWizard.SetLegenda(const Value: string);
begin
  FLegenda := Value;
end;

procedure TZoo_AtividadesBaseWizard._actExecuteExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( FDBGridResultados, Caption, FLegenda );
  inherited;
end;

procedure TZoo_AtividadesBaseWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_AtividadesBaseWizard._actPriorExecute(Sender: TObject);
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
  RegisterClass ( TZoo_AtividadesBaseWizard );
end.
