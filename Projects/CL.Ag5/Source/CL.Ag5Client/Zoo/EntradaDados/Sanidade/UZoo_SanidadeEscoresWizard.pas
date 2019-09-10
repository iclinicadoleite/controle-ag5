unit UZoo_SanidadeEscoresWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvSpin, JvExControls,
  JvDBLookup, JvToolEdit, VCL.Mask, JvExMask, UZoo_SanidadeEscoresDatamodule, Data.DB, Tc.Data.DB.Helpers,
   VCL.DBCtrls, JvDBControls, Tc.VCL.Edits.DBControls, Tc.VCL.Edits,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, Tc.VCL.Controls.GDIButton,
  CL.Ag5.NSMsgs, System.Actions, Tc.VCL.Extended.Mask, Wrappers ;

type

  TJvDBUltimGrid =  class (  Wrappers.TJvDBUltimGrid )
    procedure Loaded ; override ;
  end;


  TZoo_SanidadeEscoresWizard = class(TZoo_EntradaDadosBaseWizard)
    GroupBox2: TGroupBox;
    Label7: TLabel;
    edtBrinco: TJvComboEdit;
    TabSheet1: TTabSheet;
    dbgEscores: TJvDBUltimGrid;
    dtsEscores: TDataSource;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    DBMemo1: TDBMemo;
    dbgListaEscores: TJvDBUltimGrid;
    dtsListaEscores: TDataSource;
    Label2: TLabel;
    DBMemo2: TDBMemo;
    degData: TTcDBDateEdit;
    BitBtn2: TTcGDIButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    deDataEvento: TTcDateEdit;
    edNomeFuncionario: TJvComboEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure edNomeFuncionarioButtonClick(Sender: TObject);
    procedure edNomeFuncionarioChange(Sender: TObject);
    procedure edNomeFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteExecute(Sender: TObject);
    procedure dbgEscoresEditButtonClick(Sender: TObject);
    procedure dbgEscoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgEscoresKeyPress(Sender: TObject; var Key: Char);
    procedure dtsEscoresDataChange(Sender: TObject; Field: TField);
    procedure dbgListaEscoresShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgEscoresShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtBrincoButtonClick(Sender: TObject);
    procedure edtBrincoChange(Sender: TObject);
    procedure edtBrincoEnter(Sender: TObject);
    procedure edtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNomeAnimalFemeaKeyPress(Sender: TObject; var Key: Char);
    procedure deDataEventoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Zoo_SanidadeEscoresDatamodule : TZoo_SanidadeEscoresDatamodule ;
    FKFuncionario : string ;
    FEscore: string;
    FGridName : string ;
    FBrinco : string ;
    FEditorsList : TList ;
    procedure SetEscore(const Value: string);
    procedure AddBrinco ;
    procedure ValidateCamposFixo ;
    procedure SearchFuncionario ( TextToSearch : string);
    procedure SetFuncionario ( TextToSearch : string);
    procedure RemoveRecord ;
    function SearchAnimalFemea ( TextToSearch : string) : boolean ;
    procedure UpdateEdtBrinco ;
    procedure AddByKey ( AKey : String ) ;
    procedure ClearEditors ;
    procedure AddEditor ( AColumn : TColumn ) ;
  public
    { Public declarations }
    property KeyEscore : string  read FEscore write SetEscore;
    constructor Create ( AOwner : TComponent  ) ; override ;
    destructor destroy ; override ;
    class function Execute ( AKEscore : string  ) : boolean; reintroduce ;
  end;


implementation

uses Exceptions, SearchsZootecnico, JvDBGridSuppl;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_SanidadeEscoresWizard.AddBrinco;
begin
   ValidateCamposFixo;

   try
    if ( Trim ( edtBrinco.Text ) <> '' ) and Zoo_SanidadeEscoresDatamodule.AddBrinco ( edtBrinco.Text, deDataEvento.Date, FKFuncionario, edNomeFuncionario.Text  ) then
      begin
        UpdateEdtBrinco ;
        dbgEscores.SetFocus ;
        exit ;
      end ;

    if SearchAnimalFemea ( FBrinco ) then
        dbgEscores.SetFocus
    else
       raise Warning.Create('Animal não encontrado');
  except
     edtBrinco.setFocus ;
     edtBrinco.SelectAll ;
     raise ;
  end ;

end;

procedure TZoo_SanidadeEscoresWizard.AddByKey(AKey: String);
begin
  ValidateCamposFixo;

  if Zoo_SanidadeEscoresDatamodule.LocateBrinco( FBrinco ) then
     exit ;

  if Zoo_SanidadeEscoresDatamodule.AddByKey ( AKey, deDataEvento.Date, FKFuncionario, edNomeFuncionario.Text ) then
      dbgEscores.SetFocus
end;

procedure TZoo_SanidadeEscoresWizard.AddEditor(AColumn: TColumn);
var
  AControl : TControl ;
begin
  AControl := nil ;

  if AColumn.Field is TMemoField then
    begin
      AControl := TDBMemo.Create (  Self ) ;
      TDBMemo ( AControl ).DataSource := dtsEscores ;
      TDBMemo ( AControl ).DataField  := AColumn.FieldName ;
    end
  else if ( AColumn.Field is TDateTimeField ) or ( AColumn.Field is TSQLTimeStampField ) then
    begin
      AControl := TTcDBDateEdit.Create (  Self ) ;
      TTcDBDateEdit ( AControl ).DataSource := dtsEscores ;
      TTcDBDateEdit ( AControl ).DataField  := AColumn.FieldName ;
    end
  else if AColumn.Field is TFloatField then
    begin
      AControl := TJvDBCalcEdit.Create (  Self ) ;
      TJvDBCalcEdit ( AControl ).DataSource := dtsEscores ;
      TJvDBCalcEdit ( AControl ).DataField  := AColumn.FieldName ;
      TJvDBCalcEdit ( AControl ).ShowButton := False ;
    end ;

  if not Assigned ( AControl ) then
     exit ;

  AControl.Visible := False ;
  AControl.Parent  := dbgEscores.Parent ;
  FEditorsList.Add( AControl ) ;
  AControl.Name := Format ( 'InPlaceEditor%d', [ FEditorsList.Count ] ) ;

  with dbgEscores.EditControls.Add do
     begin
         FieldName       := AColumn.FieldName ;
         ControlName     := AControl.Name ;
         LeaveOnEnterKey := True ;
         if AControl is  TDBMemo then
            FitCell := fcDesignSize
      end;
end;

procedure TZoo_SanidadeEscoresWizard.BitBtn2Click(Sender: TObject);
begin
  inherited;
  RemoveRecord ;
end;

procedure TZoo_SanidadeEscoresWizard.ClearEditors;
var
  x : integer ;
begin
  for x := 0 to FEditorsList.Count - 1 do
    TObject ( FEditorsList[ x ] ).Free ;
  FEditorsList.Clear ;
end;

constructor TZoo_SanidadeEscoresWizard.Create ( AOwner : TComponent  ) ;
begin
  inherited Create ( AOwner ) ;
  FEditorsList := TList.Create ;
  Zoo_SanidadeEscoresDatamodule := TZoo_SanidadeEscoresDatamodule.Create ( self ) ;
  Zoo_SanidadeEscoresDatamodule.OpenTables ;
  Try
    _actNext.Enabled := not Zoo_SanidadeEscoresDatamodule.cdsListaEscores.IsEmpty ;
  except
  End;
end;


procedure TZoo_SanidadeEscoresWizard.dbgEscoresEditButtonClick(Sender: TObject);
begin
  inherited;
   with Zoo_SanidadeEscoresDatamodule, dbgEscores do
       if ( SelectedField = cdsEscoresNOMEFUNCIONARIO ) then
            self.SetFuncionario ( InplaceEditor.Text ) ;
end;

procedure TZoo_SanidadeEscoresWizard.dbgEscoresKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key =  VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_SanidadeEscoresWizard.dbgEscoresKeyPress(Sender: TObject; var Key: Char);
var
 SkipDone : boolean ;
begin
  inherited;

  if ( Key <> #13 ) then
    exit ;

  with Zoo_SanidadeEscoresDatamodule, dbgEscores do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsEscoresNOMEFUNCIONARIO ) then
         begin
            self.SetFUNCIONARIO ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;


   if (  Screen.ActiveControl = dbgEscores ) then
      Key := #0 ;

   with (dbgEscores) do
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

procedure TZoo_SanidadeEscoresWizard.dbgEscoresShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin

  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;

end;

procedure TZoo_SanidadeEscoresWizard.dtsEscoresDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  with Zoo_SanidadeEscoresDatamodule.cdsEscores do
    begin
      dtsEscores.AutoEdit := not ( bof and eof ) ;
    end;
end;

procedure TZoo_SanidadeEscoresWizard.edtBrincoButtonClick( Sender: TObject);
begin
  inherited;
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeEscoresWizard.edtBrincoChange(Sender: TObject);
begin
  inherited;
  if edtBrinco.Text = Zoo_SanidadeEscoresDatamodule.cdsEscoresBRINCO.asString then
     edtBrinco.Font.Color := clNavy
  else
     edtBrinco.Font.Color := clRed ;
end;

procedure TZoo_SanidadeEscoresWizard.edtBrincoEnter(Sender: TObject);
begin
  inherited;
  edtBrinco.SelectAll ;
end;

procedure TZoo_SanidadeEscoresWizard.edtBrincoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_up then
    begin
     Zoo_SanidadeEscoresDatamodule.cdsEscores.Prior ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_SanidadeEscoresDatamodule.cdsEscores.Next ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end ;
end;

procedure TZoo_SanidadeEscoresWizard.edNomeAnimalFemeaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Zoo_SanidadeEscoresDatamodule.cdsEscores.State in [dsInsert,dsEdit] then
     Zoo_SanidadeEscoresDatamodule.cdsEscores.Post ;

  if ( Key = #13  ) then
    begin
      Key := #0 ;
      //if ( Trim ( edtBrinco.Text ) = '' ) then
      //  exit ;

      if ( Trim ( edtBrinco.Text ) <> '' ) and ( edtBrinco.Text = Zoo_SanidadeEscoresDatamodule.cdsEscoresBRINCO.asString ) then
       begin
         dbgEscores.SetFocus ;
         exit ;
       end ;

      FBrinco := edtBrinco.Text ;
      AddBrinco ;
    end;
end;

procedure TZoo_SanidadeEscoresWizard.edNomeFuncionarioButtonClick(Sender: TObject);
begin
  inherited;
  SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_SanidadeEscoresWizard.edNomeFuncionarioChange(Sender: TObject);
begin
  inherited;
  FKFuncionario := '' ;
  edNomeFuncionario.Font.Color := clRed ;
end;

procedure TZoo_SanidadeEscoresWizard.edNomeFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
    end ;
end;

procedure TZoo_SanidadeEscoresWizard.edtBrincoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #13  ) then
    begin
      Key := #0 ;
      AddBrinco ;
    end;
end;

class function TZoo_SanidadeEscoresWizard.Execute( AKEscore : string  ) : boolean;
var
  f : TZoo_SanidadeEscoresWizard ;
begin
  f := Create ( nil ) ;
  with f do
  try
      KeyEscore := AKEscore ;
      Result := ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     free ;
  end ;

end ;

procedure TZoo_SanidadeEscoresWizard.RemoveRecord;
begin
  Zoo_SanidadeEscoresDatamodule.RemoveRecord ;
end;

procedure TZoo_SanidadeEscoresWizard.dbgListaEscoresShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := False ;
end;

procedure TZoo_SanidadeEscoresWizard.deDataEventoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    edNomeFuncionario.SetFocus ;
end;

destructor TZoo_SanidadeEscoresWizard.destroy;
begin
  JvDBGridSuppl.TGridStorager.Save( dbgEscores, FGridName );
  ClearEditors;
  FEditorsList.Free ;
  inherited;
end;

function TZoo_SanidadeEscoresWizard.SearchAnimalFemea(
  TextToSearch: string): boolean;
var
  lFound : boolean ;
begin
    lFound := False ;
    with TSearchFemeaAtivo.Create do
       try
          FBrinco := '' ;
          TextToFind := TextToSearch ;
          //TextToFind := '' ;
          lFound := Execute ;
          if lFound then
             begin
               FBrinco                := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Font.Color   := clNavy ;
               AddByKey ( Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString ) ;
             end ;
       finally
          SearchAnimalFemea := lFound ;
          free ;
       end ;
end;


procedure TZoo_SanidadeEscoresWizard.SearchFuncionario(TextToSearch: string);
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

procedure TZoo_SanidadeEscoresWizard.SetEscore(const Value: string);
var
 x : integer ;
begin
  ClearEditors ;
  dbgEscores.EditControls.Clear ;

  FEscore := Value;
  Zoo_SanidadeEscoresDatamodule.KeyEscore := Value ;
  dtsEscores.DataSet := Zoo_SanidadeEscoresDatamodule.cdsEscores ;

  Caption := Zoo_SanidadeEscoresDatamodule.cdsTable.FieldByName( 'SIGLA' ).asString ;
  Caption  := 'Escore' ;

  Name := 'fwzZoo_Escores_' + Zoo_SanidadeEscoresDatamodule.TableName ;
  FGridName := Name + '.' + dbgEscores.Name ;
//  if ( not Zoo_SanidadeEscoresDatamodule.TableExists ) or ( Zoo_SanidadeEscoresDatamodule.FieldAdded ) or
  if not JvDBGridSuppl.TGridStorager.Load( dbgEscores, FGridName )  then
    begin
       dbgEscores.Columns.RebuildColumns ;
       for x := 0 to dbgEscores.Columns.Count -1 do
          begin
            if  dbgEscores.Columns[ x ].FieldName <> '' then
              begin
                dbgEscores.Columns[ x ].Visible := dbgEscores.Columns[ x ].Field.Visible ;
                dbgEscores.Columns[ x ].Title.Caption := dbgEscores.Columns[ x ].Field.DisplayLabel ;
              end ;
          end;
       dbgEscores.AutoSizeColumns := True ;
    end ;

    with Zoo_SanidadeEscoresDatamodule do
       for x := 0 to dbgEscores.Columns.Count -1 do
          begin
          (*
              if  dbgEscores.Columns[ x ].Field = cdsEscoresBRINCO then
                  dbgEscores.Columns[ x ].ReadOnly := True ;
              if  dbgEscores.Columns[ x ].Field = cdsEscoresNOMEESTABULO then
                  dbgEscores.Columns[ x ].ReadOnly := True ;
              if  dbgEscores.Columns[ x ].Field = cdsEscoresLOTE then
                  dbgEscores.Columns[ x ].ReadOnly := True ;
              if  dbgEscores.Columns[ x ].Field = cdsEscoresNOMEFUNCIONARIO then
                  dbgEscores.Columns[ x ].ButtonStyle := cbsEllipsis ;
          *)
              if  dbgEscores.Columns[ x ].Field = cdsEscoresBRINCO then
                  dbgEscores.Columns[ x ].ReadOnly := True ;
              if  dbgEscores.Columns[ x ].Field = cdsEscoresNOMEESTABULO then
                  dbgEscores.Columns[ x ].ReadOnly := True ;
              if  dbgEscores.Columns[ x ].Field = cdsEscoresLOTE then
                  dbgEscores.Columns[ x ].ReadOnly := True ;
              if  dbgEscores.Columns[ x ].Field = cdsEscoresDATA then
                  dbgEscores.Columns[ x ].ReadOnly := True ;
              if  dbgEscores.Columns[ x ].Field = cdsEscoresNOMEFUNCIONARIO then
                  dbgEscores.Columns[ x ].ReadOnly := True ;

          end;

    dbgEscores.EditControls.Clear ;

    with dbgEscores.EditControls.Add do
      begin
         FieldName       := 'DATA' ;
         ControlName     := 'degData' ;
         LeaveOnEnterKey := True ;
      end;

  ClearEditors ;

  for x := 0 to dbgEscores.Columns.Count -1 do
  begin
       if    ( Copy ( dbgEscores.Columns[ x ].FieldName, 1, 1 ) = 'F' )then
           AddEditor ( dbgEscores.Columns[ x ] ) ;
  end;

end;

procedure TZoo_SanidadeEscoresWizard.SetFuncionario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
//               edFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               Zoo_SanidadeEscoresDatamodule.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;

end;

procedure TZoo_SanidadeEscoresWizard.UpdateEdtBrinco;
begin
  edtBrinco.text := Zoo_SanidadeEscoresDatamodule.cdsEscoresBRINCO.asString ;
  edtBrinco.Font.color := clNavy ;
  FBrinco := Zoo_SanidadeEscoresDatamodule.cdsEscoresBRINCO.asString ;
end;

procedure TZoo_SanidadeEscoresWizard.ValidateCamposFixo;
var
  ErrMsg : string ;
  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  ErrMsg := '' ;
(*
  if ( deDataEvento.date = 0 ) or ( deDataEvento.date < ( date - 30  ) ) then
     AddErr ( 'Data - em branco / inferior a 30 dias' ) ;
*)
  if ( deDataEvento.date = 0 ) then
     AddErr ( 'Data - em branco' ) ;

  if ( deDataEvento.date >  date ) then
     AddErr ( 'Data - superior a data atual' ) ;

  if FKFuncionario = '' then
     AddErr ( 'Funcionário' ) ;

  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos na entrada padrão'#13#10#13#10 + ErrMsg );
end;


procedure TZoo_SanidadeEscoresWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_SanidadeEscoresDatamodule.ApplyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_ESCORES.CreateAndDispatch( self ) ; ;
  inherited;
end;

procedure TZoo_SanidadeEscoresWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  Try
    _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and not Zoo_SanidadeEscoresDatamodule.cdsEscores.IsEmpty ;
  except
  End;
end;

procedure TZoo_SanidadeEscoresWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;
  KeyEscore := Zoo_SanidadeEscoresDatamodule.cdsListaEscoresKZOO_CFGESCORE.asString ;
  inherited;

end;

procedure TZoo_SanidadeEscoresWizard._actPriorExecute(Sender: TObject);
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

end.



