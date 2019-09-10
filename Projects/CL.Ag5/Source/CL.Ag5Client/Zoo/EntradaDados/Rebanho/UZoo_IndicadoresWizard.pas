unit UZoo_IndicadoresWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvSpin, JvExControls, JvDBLookup,
  JvToolEdit, VCL.Mask, JvExMask, UZoo_IndicadoresDatamodule, Data.DB, Tc.Data.DB.Helpers,  VCL.DBCtrls,
  Tc.VCL.Edits, UZoo_EntradaDadosBaseWizard, Tc.VCL.Edits.DBControls,
  Tc.VCL.Application,
  JvDBControls, Tc.VCL.Controls.GDIButton,
  CL.Ag5.NSMsgs, System.Actions, Tc.VCL.Extended.Mask, Wrappers ;

type

  TJvDBUltimGrid =  class (  Wrappers.TJvDBUltimGrid )
    procedure Loaded ; override ;
  end;

  TZoo_IndicadoresWizard = class(TZoo_EntradaDadosBaseWizard)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    edNomeFuncionario: TJvComboEdit;
    deDataEvento: TTcDateEdit;
    TabSheet1: TTabSheet;
    dbgIndicadores: TJvDBUltimGrid;
    dtsIndicadores: TDataSource;
    Label4: TLabel;
    BitBtn2: TTcGDIButton;
    Memo1: TMemo;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edNomeFuncionarioButtonClick(Sender: TObject);
    procedure edNomeFuncionarioChange(Sender: TObject);
    procedure edNomeFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteExecute(Sender: TObject);
    procedure dbgIndicadoresEditButtonClick(Sender: TObject);
    procedure dbgIndicadoresKeyPress(Sender: TObject; var Key: Char);
    procedure dbgIndicadoresShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgIndicadoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
  private
    { Private declarations }
    Zoo_IndicadoresDatamodule : TZoo_IndicadoresDatamodule ;
    FKFuncionario : string ;
    FIndicador: string;
    FGridName : string ;
    FEditorsList : TList ;
    procedure SetIndicador(const Value: string);
    function ValidateCamposFixo : string ;
    procedure SearchFuncionario ( TextToSearch : string);
    procedure SetFuncionario ( TextToSearch : string);
    procedure RemoveRecord ;
    procedure ClearEditors ;
    procedure AddEditor ( AColumn : TColumn ) ;
  public
    { Public declarations }
    property KeyIndicador : string  read FIndicador write SetIndicador;
    constructor Create ( AOwner : TComponent  ) ; override ;
    Destructor Destroy ; override ;
    class function Execute ( AKIndicador : string  ) : boolean; reintroduce ;
  end;


implementation

uses Exceptions, SearchsZootecnico, JvDBGridSuppl;

{$R *.dfm}

{ TfrmCustomWizard }


procedure TZoo_IndicadoresWizard.AddEditor(AColumn: TColumn);
var
  AControl : TControl ;
begin
  AControl := nil ;

  if AColumn.Field is TMemoField then
    begin
      AControl := TDBMemo.Create (  Self ) ;
      TDBMemo ( AControl ).DataSource := dtsIndicadores ;
      TDBMemo ( AControl ).DataField  := AColumn.FieldName ;
    end
  else if ( AColumn.Field is TDateTimeField ) or ( AColumn.Field is TSQLTimeStampField ) then
    begin
      AControl := TTcDBDateEdit.Create (  Self ) ;
      TTcDBDateEdit ( AControl ).DataSource := dtsIndicadores ;
      TTcDBDateEdit ( AControl ).DataField  := AColumn.FieldName ;
    end
  else if AColumn.Field is TFloatField then
    begin
      AControl := TJvDBCalcEdit.Create (  Self ) ;
      TJvDBCalcEdit ( AControl ).DataSource := dtsIndicadores ;
      TJvDBCalcEdit ( AControl ).DataField  := AColumn.FieldName ;
      TJvDBCalcEdit ( AControl ).ShowButton := False ;
    end ;

  if not Assigned ( AControl ) then
     exit ;

  AControl.Visible := False ;
  AControl.Parent  := dbgIndicadores.Parent ;
  FEditorsList.Add( AControl ) ;
  AControl.Name := Format ( 'InPlaceEditor%d', [ FEditorsList.Count ] ) ;

  with dbgIndicadores.EditControls.Add do
     begin
         FieldName       := AColumn.FieldName ;
         ControlName     := AControl.Name ;
         LeaveOnEnterKey := True ;
         if AControl is  TDBMemo then
            FitCell := fcDesignSize
      end;
end;

procedure TZoo_IndicadoresWizard.BitBtn2Click(Sender: TObject);
begin
  inherited;
  RemoveRecord ;
end;

procedure TZoo_IndicadoresWizard.ClearEditors;
var
  x : integer ;
begin
  for x := 0 to FEditorsList.Count - 1 do
    TObject ( FEditorsList[ x ] ).Free ;
  FEditorsList.Clear ;
end;

constructor TZoo_IndicadoresWizard.Create ( AOwner : TComponent  ) ;
begin
   inherited Create ( AOwner ) ;
   FEditorsList := TList.Create ;
   Zoo_IndicadoresDatamodule := TZoo_IndicadoresDatamodule.Create ( self ) ;
   Zoo_IndicadoresDatamodule.OpenTables;
end;

procedure TZoo_IndicadoresWizard.dbgIndicadoresEditButtonClick(Sender: TObject);
begin
  inherited;
   with Zoo_IndicadoresDatamodule, dbgIndicadores do
       if ( SelectedField = cdsIndicadoresNOMEFUNCIONARIO ) then
            self.SetFuncionario ( InplaceEditor.Text ) ;
end;

procedure TZoo_IndicadoresWizard.dbgIndicadoresKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  ErrStr : string ;
begin
  ErrStr := ValidateCamposFixo ;
  if ErrStr <> '' then
    begin
     Key := 0 ;
     MessageDlg ( 'Dados inválidos na entrada padrão'#13#10#13#10 + ErrStr );
    end;
end;

procedure TZoo_IndicadoresWizard.dbgIndicadoresKeyPress(Sender: TObject;  var Key: Char);
var
 SkipDone : boolean ;
begin
//  inherited;

  if ( Key <> #13 ) then
    exit ;

  with Zoo_IndicadoresDatamodule, dbgIndicadores do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsIndicadoresNOMEFUNCIONARIO ) then
         begin
            self.SetFUNCIONARIO ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;


   if (  Screen.ActiveControl = dbgIndicadores ) then
      Key := #0 ;

   with (dbgIndicadores) do
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

procedure TZoo_IndicadoresWizard.dbgIndicadoresShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin

  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) {or ( IsEmpty )} )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) {or ( IsEmpty )} ) ;
end;

destructor TZoo_IndicadoresWizard.Destroy;
begin
  JvDBGridSuppl.TGridStorager.Save( dbgIndicadores, FGridName );
  inherited;
end;

procedure TZoo_IndicadoresWizard.edNomeFuncionarioButtonClick(Sender: TObject);
begin
  inherited;
  SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_IndicadoresWizard.edNomeFuncionarioChange(Sender: TObject);
begin
  inherited;
  FKFuncionario := '' ;
  edNomeFuncionario.Font.Color := clRed ;
end;

procedure TZoo_IndicadoresWizard.edNomeFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
    end ;
end;

class function TZoo_IndicadoresWizard.Execute( AKIndicador : string  ) : boolean;
var
  x : integer ;
  f : TZoo_IndicadoresWizard ;
begin
  f := Create ( nil ) ;
  with f do
  try
      KeyIndicador := AKIndicador ;
      Result := ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     free ;
  end ;

end ;

procedure TZoo_IndicadoresWizard.RemoveRecord;
begin
   Zoo_IndicadoresDatamodule.RemoveRecord ;
end;

procedure TZoo_IndicadoresWizard.SearchFuncionario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edNomeFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               FKFuncionario           := Result.FieldByName( 'KCAD_ENTIDADE' ).asString ;
               edNomeFuncionario.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;

end;

procedure TZoo_IndicadoresWizard.SetFuncionario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
//               edFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               Zoo_IndicadoresDatamodule.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;
end;

procedure TZoo_IndicadoresWizard.SetIndicador(const Value: string);
var
 x : integer ;
begin
  ClearEditors ;
  dbgIndicadores.EditControls.Clear ;

  FIndicador := Value;
  Zoo_IndicadoresDatamodule.KeyIndicador := Value ;
  Memo1.lines.Text := Zoo_IndicadoresDatamodule.Legenda ;
  dtsIndicadores.DataSet := Zoo_IndicadoresDatamodule.cdsIndicadores ;

  Caption := Zoo_IndicadoresDatamodule.cdsTable.FieldByName( 'SIGLA' ).asString ;

  Name := 'fwzZoo_Indicadores_' + Zoo_IndicadoresDatamodule.TableName ;
  FGridName := Name + '.' + dbgIndicadores.Name ;
//  if ( not Zoo_IndicadoresDatamodule.TableExists ) or ( Zoo_IndicadoresDatamodule.FieldAdded ) or
  if not JvDBGridSuppl.TGridStorager.Load( dbgIndicadores, FGridName )  then
    begin
       dbgIndicadores.Columns.RebuildColumns ;
       for x := 0 to dbgIndicadores.Columns.Count -1 do
          begin
            if  dbgIndicadores.Columns[ x ].FieldName <> '' then
              begin
                dbgIndicadores.Columns[ x ].Visible := dbgIndicadores.Columns[ x ].Field.Visible ;
                dbgIndicadores.Columns[ x ].Title.Caption := dbgIndicadores.Columns[ x ].Field.DisplayLabel ;
              end ;
          end;
       dbgIndicadores.AutoSizeColumns := True ;
    end ;
//  Zoo_IndicadoresDatamodule.OpenTables ;

    with Zoo_IndicadoresDatamodule do
       for x := 0 to dbgIndicadores.Columns.Count -1 do
          begin
          (*
              if  dbgIndicadores.Columns[ x ].Field = cdsIndicadoresNOMEFUNCIONARIO then
                  dbgIndicadores.Columns[ x ].ButtonStyle := cbsEllipsis ;
          *)
              if  dbgIndicadores.Columns[ x ].Field = cdsIndicadoresDATA then
                  dbgIndicadores.Columns[ x ].ReadOnly := True ;
              if  dbgIndicadores.Columns[ x ].Field = cdsIndicadoresNOMEFUNCIONARIO then
                  dbgIndicadores.Columns[ x ].ReadOnly := True ;
          end;

  ClearEditors ;

  for x := 0 to dbgIndicadores.Columns.Count -1 do
    begin
      if ( Copy ( dbgIndicadores.Columns[ x ].FieldName, 1, 1 ) = 'F' )then
         AddEditor ( dbgIndicadores.Columns[ x ] ) ;
    end;
end;

function TZoo_IndicadoresWizard.ValidateCamposFixo : string ;

  procedure AddErr ( e : string ) ;
    begin
      Result := Result + '  - ' + e + #13#10 ;
    end;
begin
  Result := '' ;
(*
  if ( deDataEvento.date = 0 ) or ( deDataEvento.date < ( date - 30  ) ) then
     AddErr ( 'Data - em branco / inferior a 30 dias' ) ;
*)
  if ( deDataEvento.date = 0 ) then
     AddErr ( 'Data - em branco ' ) ;

  if ( deDataEvento.date >  date ) then
     AddErr ( 'Data - superior a data atual' ) ;

  if FKFuncionario = '' then
     AddErr ( 'Funcionário' ) ;

  Zoo_IndicadoresDatamodule.SetDadosPadrao( deDataEvento.date,  FKFuncionario, edNomeFuncionario.Text ) ;

end;


procedure TZoo_IndicadoresWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_IndicadoresDatamodule.ApplyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_Indicadores.CreateAndDispatch( self ) ;
  inherited;
end;

procedure TZoo_IndicadoresWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  Try
    _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  not Zoo_IndicadoresDatamodule.cdsIndicadores.IsEmpty ;
  except
  End;
end;

procedure TZoo_IndicadoresWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_IndicadoresWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

{ TJvDBUltimGrid }

procedure TJvDBUltimGrid.Loaded;
begin
  FDisableAutoLoad := True ;
  inherited ;
end;

initialization
  RegisterClass ( TZoo_IndicadoresWizard ) ;

end.

