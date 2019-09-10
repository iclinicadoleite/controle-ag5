unit UfwzZoo_EscoreAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvSpin, JvExControls,
  JvDBLookup, JvToolEdit, VCL.Mask, JvExMask, UdtmZoo_EscoreAnimal, Data.DB, Tc.Data.DB.Helpers,
  SysFormWizard, Tc.VCL.FormIntf, Tc.VCL.Form, Tc.VCL.Edits,
  Tc.VCL.Application,
  Tc.VCL.Edits.DBControls, Tc.VCL.Edits.Numbers, JvBaseEdits, JvDBControls,
  System.Actions, Wrappers,
  CL.Ag5.NSMsgs ;


type

  TJvDBUltimGrid =  class (  Wrappers.TJvDBUltimGrid )
    procedure Loaded ; override ;
  end;


  TfwzZoo_EscoreAnimal = class(TTcForm, ITcDataForm)
    dbgEscores: TJvDBUltimGrid;
    dtsEscores: TDataSource;
    Panel2: TPanel;
    deData: TTcDBDateEdit;
    procedure dbgEscoresEditButtonClick(Sender: TObject);
    procedure dbgEscoresKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    dtmZoo_EscoreAnimal : TdtmZoo_EscoreAnimal ;
    FEscore: string;
    FGridName : string ;
    FMasterSource: TDataSource;
    FDadosFemea: TDataSource;
    FEditorsList : TList ;
    procedure SetEscore(const Value: string);
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
    procedure Help ;
    // security
    function QueryAllowedDataActions : TTcDataActions ;
    // active actions
    function QueryActiveDataActions : TTcDataActions ;
    procedure SetDadosFemea(const Value: TDataSource);
    // properties
    property BOF : boolean read GetBOF ;
    property EOF : boolean read GetEOF ;
    procedure SetFuncionario ( TextToSearch : string);
    procedure ClearEditors ;
    procedure AddEditor ( AColumn : TColumn ) ;
    procedure NeedRefresh ( Sender : TCLAg5NSMsg ) ;
    class function Execute ( AKEscore : string  ) : boolean;
  public
    { Public declarations }
    property KeyEscore : string  read FEscore write SetEscore;
    constructor Create ( AOwner : TComponent  ) ; override ;
    Destructor Destroy ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    property DadosFemea : TDataSource  read FDadosFemea write SetDadosFemea;
  end;


implementation

uses Exceptions, SearchsZootecnico, JvDBGridSuppl,   SysPrintGridDialog ;


{$R *.dfm}

{ TfrmCustomWizard }


procedure TfwzZoo_EscoreAnimal.AddEditor(AColumn: TColumn);
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

procedure TfwzZoo_EscoreAnimal.Cancel;
begin
  dtmZoo_EscoreAnimal.CancelUpdates ;
  dbgEscores.EditorMode := False ;
  dbgEscores.CloseControl ;
end;

procedure TfwzZoo_EscoreAnimal.ClearEditors;
var
  x : integer ;
begin
  for x := 0 to FEditorsList.Count - 1 do
    TObject ( FEditorsList[ x ] ).Free ;
  FEditorsList.Clear ;
end;

constructor TfwzZoo_EscoreAnimal.Create ( AOwner : TComponent  ) ;
begin
   inherited Create ( AOwner ) ;
   FEditorsList := TList.Create ;
   dtmZoo_EscoreAnimal := TdtmZoo_EscoreAnimal.Create ( self ) ;


   TCLAg5NSMsgEVT_ESCORES.Subscribe( needRefresh );

end;


procedure TfwzZoo_EscoreAnimal.dbgEscoresEditButtonClick(Sender: TObject);
begin
   with dtmZoo_EscoreAnimal, dbgEscores do
       if ( SelectedField = cdsEscoresNOMEFUNCIONARIO ) then
            self.SetFuncionario ( InplaceEditor.Text ) ;
end;

procedure TfwzZoo_EscoreAnimal.dbgEscoresKeyPress(Sender: TObject;
  var Key: Char);
var
 SkipDone : boolean ;
begin
  if ( Key <> #13 ) then
    exit ;

  with dtmZoo_EscoreAnimal, dbgEscores do
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

procedure TfwzZoo_EscoreAnimal.DeleteRecord;
begin
   if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
     exit ;
  dtmZoo_EscoreAnimal.DeleteRecord
end;

destructor TfwzZoo_EscoreAnimal.Destroy;
begin
  TCLAg5NSMsgEVT_ESCORES.UnSubscribe( needRefresh );

  JvDBGridSuppl.TGridStorager.Save( dbgEscores, FGridName );
  ClearEditors;
  FEditorsList.Free ;
  inherited;
end;

procedure TfwzZoo_EscoreAnimal.EditRecord;
begin
  dtmZoo_EscoreAnimal.EditRecord ;
  dbgEscores.SetFocus ;
  dbgEscores.EditorMode := True ;
end;


class function TfwzZoo_EscoreAnimal.Execute( AKEscore : string  ) : boolean;
var
  x : integer ;

  f : TfwzZoo_EscoreAnimal ;
begin

  f := Create ( nil ) ;
  with f do
  try
    //  KeyEscore := AKEscore ;
      Result := ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     free ;
  end ;

end ;


function TfwzZoo_EscoreAnimal.GetBOF: boolean;
begin
  Result := dtmZoo_EscoreAnimal.cdsEscores.Bof
end;

function TfwzZoo_EscoreAnimal.GetEOF: boolean;
begin
  Result := dtmZoo_EscoreAnimal.cdsEscores.Eof
end;

procedure TfwzZoo_EscoreAnimal.Help;
begin

end;

procedure TfwzZoo_EscoreAnimal.InsertRecord;
begin
  dtmZoo_EscoreAnimal.NewRecord ;
  dbgEscores.SetFocus ;
  dbgEscores.EditorMode := True ;
end;

procedure TfwzZoo_EscoreAnimal.NeedRefresh(Sender: TCLAg5NSMsg);
var
  KZOO_ANIMAL : string;
begin
//  KZOO_ANIMAL := dtmZoo_EscoreAnimal.cdsEscoresKZOO_ANIMAL_FEMEA.AsString;
//  dtmZoo_EscoreAnimal.ReOpenTables ;
//  dtmZoo_EscoreAnimal.cdsEscores.Locate('KZOO_ANIMAL', KZOO_ANIMAL, [] );
 with dtmZoo_EscoreAnimal do
    begin
      if ( cdsEscores.State in [dsInsert,dsEdit] ) or (cdsEscores.ChangeCount > 0 ) then
         exit ;

     cdsEscores.Refresh;
    end;
end;

procedure TfwzZoo_EscoreAnimal.OtherOptions;
begin

end;

procedure TfwzZoo_EscoreAnimal.PrintData;
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( dbgEscores, 'Escore '+ '' +' do animal' );
end;

function TfwzZoo_EscoreAnimal.QueryActiveDataActions: TTcDataActions;
begin
   Result := [ daInsert,daEdit, daDelete, daPrint ] ;

   with dtmZoo_EscoreAnimal.cdsEscores do
     begin
       if ( State in [dsInsert,dsEdit] ) or ( ChangeCount > 0 )  then
          Result := Result + [daSave,daCancel] - [daEdit] ;
       if BOF and EOF then
        Result := Result - [daEdit,daDelete] ;
     end;

   if Application.LicenseState = lsReadOnly then
      Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;

end;

function TfwzZoo_EscoreAnimal.QueryAllowedDataActions: TTcDataActions;
begin
  Result := [ daInsert,daEdit,daDelete,daSave,daCancel,daPrint,daOther ] ;
end;

//!!KIQ Revisar
procedure TfwzZoo_EscoreAnimal.Save;
begin
  dtmZoo_EscoreAnimal.ApplyUpdates ;
  dbgEscores.EditorMode := False ;
  dbgEscores.CloseControl ;
end;


procedure TfwzZoo_EscoreAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

procedure TfwzZoo_EscoreAnimal.SetDadosFemea(const Value: TDataSource);
begin
  FDadosFemea := Value;
end;

procedure TfwzZoo_EscoreAnimal.SetEscore(const Value: string);
var
 x : integer ;
begin
  FEscore := Value;
  dtmZoo_EscoreAnimal.MasterSource := FMasterSource ;
  dtmZoo_EscoreAnimal.DadosFemea := FDadosFemea ;
  dtmZoo_EscoreAnimal.KeyEscore := Value ;
  dtsEscores.DataSet := dtmZoo_EscoreAnimal.cdsEscores ;

//  Caption := dtmZoo_EscoreAnimal.cdsTable.FieldByName( 'SIGLA' ).asString ;
//  _lblCaption.Caption  := Caption ;

  Name := 'fwzZoo_EscoreAnimal_' + dtmZoo_EscoreAnimal.TableName ;
  FGridName := Name + '.' + dbgEscores.Name ;
//  if ( not dtmZoo_Escores.TableExists ) or ( dtmZoo_Escores.FieldAdded ) or
  if not JvDBGridSuppl.TGridStorager.Load( dbgEscores, FGridName )  then
    begin
       dbgEscores.Columns.RebuildColumns ;
       for x := 0 to dbgEscores.Columns.Count -1 do
          begin
            if  dbgEscores.Columns[ x ].FieldName <> '' then
              begin
                dbgEscores.Columns[ x ].Visible := dbgEscores.Columns[ x ].Field.Visible ;
                dbgEscores.Columns[ x ].Title.Caption := dbgEscores.Columns[ x ].Field.DisplayLabel ;
                if dbgEscores.Columns[ x ].FieldName = 'NOMEFUNCIONARIO' then
                  dbgEscores.Columns[ x ].ButtonStyle := cbsEllipsis ;
//                if dbgEscores.Columns[ x ].Visible
              end ;
          end;
       dbgEscores.AutoSizeColumns := True ;
    end ;

    dbgEscores.EditControls.Clear ;

    with dbgEscores.EditControls.Add do
      begin
         FieldName       := 'DATA' ;
         ControlName     := 'deData' ;
         LeaveOnEnterKey := True ;
      end;

  ClearEditors ;

  dtsEscores.Enabled := False  ;
  for x := 0 to dbgEscores.Columns.Count -1 do
  begin
       if    ( Copy ( dbgEscores.Columns[ x ].FieldName, 1, 1 ) = 'F' )then
           AddEditor ( dbgEscores.Columns[ x ] ) ;
  end;
  dtsEscores.Enabled := True  ;


//  dtmZoo_Escores.OpenTables ;

end;

procedure TfwzZoo_EscoreAnimal.SetFuncionario(TextToSearch: string);
begin
//                           dbgEscores.EditControls.Items[x].ControlName
//                           dbgEscores.EditControls.Items[x].FieldName
    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
//               edFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               dtmZoo_EscoreAnimal.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;
end;


{ TJvDBUltimGrid }

procedure TJvDBUltimGrid.Loaded;
begin
  FDisableAutoLoad := True ;
  inherited ;
end;

end.

