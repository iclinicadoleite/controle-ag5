unit UfrmZoo_ResultadoExamesAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, UdtmZoo_ResultadoExamesAnimal, Data.DB, Tc.Data.DB.Helpers,
  VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.ExtCtrls,
  VCL.StdCtrls, VCL.DBCtrls,
  Tc.VCL.Application,
  Tc.VCL.Form, Tc.VCL.FormIntf, System.Actions, Vcl.Mask,
  Tc.VCL.Extended.Mask, Tc.VCL.Edits, Tc.VCL.Edits.DBControls, Wrappers ;

type
  TfrmZoo_ResultadoExamesAnimal = class(TTcForm, ITcDataForm)
    dtsExames: TDataSource;
    Panel2: TPanel;
    dbgResultadoExames: TJvDBUltimGrid;
    DBMemo1: TDBMemo;
    TcDBDateEdit1: TTcDBDateEdit;
    dblcResultado1: TDBLookupComboBox;
    dblcResultado2: TDBLookupComboBox;
    dblcResultado3: TDBLookupComboBox;
    dtsListaResultado1: TDataSource;
    dtsListaResultado2: TDataSource;
    dtsListaResultado3: TDataSource;
    procedure dbgResultadoExamesKeyPress(Sender: TObject; var Key: Char);
    procedure dbgResultadoExamesShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgResultadoExamesEditButtonClick(Sender: TObject);
    procedure dbgResultadoExamesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function dbgResultadoExamesCheckIfBooleanField(Grid: TJvDBGrid;
      Field: TField; var StringForTrue, StringForFalse: string): Boolean;
    procedure dblcResultadoExit(Sender: TObject);
    procedure dblcResultadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcResultadoEnter(Sender: TObject);
  private
    { Private declarations }
    FMasterSource: TDataSource;
    dtmZoo_ResultadoExamesAnimal : TdtmZoo_ResultadoExamesAnimal ;
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
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

{$R *.dfm}

uses SearchsZootecnico, SysPrintGridDialog ;

{ TfrmZoo_ResultadoExamesAnimal }

procedure TfrmZoo_ResultadoExamesAnimal.Cancel;
begin
  dtmZoo_ResultadoExamesAnimal.CancelUpdates ;
  dbgResultadoExames.EditorMode := False ;
  dbgResultadoExames.CloseControl ;
end;

constructor TfrmZoo_ResultadoExamesAnimal.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;
   dtmZoo_ResultadoExamesAnimal := TdtmZoo_ResultadoExamesAnimal.Create ( self ) ;
   dtsExames.DataSet := dtmZoo_ResultadoExamesAnimal.cdsExames ;
end;

procedure TfrmZoo_ResultadoExamesAnimal.DeleteRecord;
begin
   if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
     exit ;
  dtmZoo_ResultadoExamesAnimal.DeleteRecord
end;

procedure TfrmZoo_ResultadoExamesAnimal.EditRecord;
begin
  dtmZoo_ResultadoExamesAnimal.EditRecord ;
  dbgResultadoExames.SetFocus ;
  dbgResultadoExames.EditorMode := True ;
end;

function TfrmZoo_ResultadoExamesAnimal.GetBOF: boolean;
begin
   result := dtmZoo_ResultadoExamesAnimal.cdsExames.Bof
end;

function TfrmZoo_ResultadoExamesAnimal.GetEOF: boolean;
begin
   result := dtmZoo_ResultadoExamesAnimal.cdsExames.EOF
end;


procedure TfrmZoo_ResultadoExamesAnimal.InsertRecord;
begin
  dtmZoo_ResultadoExamesAnimal.NewRecord
end;

procedure TfrmZoo_ResultadoExamesAnimal.OtherOptions;
begin

end;

function TfrmZoo_ResultadoExamesAnimal.dbgResultadoExamesCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
   with dtmZoo_ResultadoExamesAnimal do
    Result := ( Field =  cdsExamesPROTOCOLO_RESULTADO1 )
           or ( Field =  cdsExamesPROTOCOLO_RESULTADO2 )
           or ( Field =  cdsExamesPROTOCOLO_RESULTADO3 ) ;
   StringForTrue  := 'T' ;
   StringForFalse := 'F' ;
end;

procedure TfrmZoo_ResultadoExamesAnimal.dbgResultadoExamesEditButtonClick(Sender: TObject);
begin
   with dtmZoo_ResultadoExamesAnimal, dbgResultadoExames do
       if ( SelectedField = cdsExamesNOMEFUNCIONARIO_EXAME ) then
            self.SetFuncionario ( InplaceEditor.Text ) ;

end;

procedure TfrmZoo_ResultadoExamesAnimal.dbgResultadoExamesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then
     Key := 0 ;
end;

procedure TfrmZoo_ResultadoExamesAnimal.dbgResultadoExamesKeyPress(Sender: TObject;
  var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key <> #13 ) then
    exit ;

  with dtmZoo_ResultadoExamesAnimal, dbgResultadoExames do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsExamesNOMEFUNCIONARIO_EXAME ) then
         begin
            self.SetFUNCIONARIO ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;

   if (  Screen.ActiveControl = TJvDBUltimGrid ( Sender ) ) then
      Key := #0 ;

   with (TJvDBUltimGrid ( Sender )) do
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

procedure TfrmZoo_ResultadoExamesAnimal.dbgResultadoExamesShowEditor(
  Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TfrmZoo_ResultadoExamesAnimal.dblcResultadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else if ( not Key in [ VK_RETURN ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
     TDBLookupComboBox ( Sender ).DropDown ;
end;

procedure TfrmZoo_ResultadoExamesAnimal.dblcResultadoEnter(Sender: TObject);
begin
  TDBLookupComboBox ( Sender ).DropDown ;
end;

procedure TfrmZoo_ResultadoExamesAnimal.dblcResultadoExit(Sender: TObject);
begin
   dbgResultadoExames.SetFocus ;
end;

procedure TfrmZoo_ResultadoExamesAnimal.PrintData;
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( dbgResultadoExames, 'Resultado exames do animal' );
end;

function TfrmZoo_ResultadoExamesAnimal.QueryAllowedDataActions: TTcDataActions;
begin
  Result := [ daEdit, daSave, daCancel, daPrint ] ;
end;

function TfrmZoo_ResultadoExamesAnimal.QueryActiveDataActions: TTcDataActions;
begin
  Result := [ daEdit, daPrint ] ;

  with dtmZoo_ResultadoExamesAnimal.cdsExames do
    begin
        if ( State in [dsEdit] ) or ( ChangeCount > 0 ) then
           Result := Result + [daSave,daCancel] ;
       if BOF and EOF then
        Result := Result - [daEdit] ;
    end;

   if Application.LicenseState = lsReadOnly then
      Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;


procedure TfrmZoo_ResultadoExamesAnimal.Save;
begin
  dtmZoo_ResultadoExamesAnimal.ApplyUpdates ;
  dbgResultadoExames.EditorMode := False ;
  dbgResultadoExames.CloseControl ;
end;

procedure TfrmZoo_ResultadoExamesAnimal.SetFuncionario(TextToSearch: string);
begin
  with TSearchFuncionarioAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        begin
          dtmZoo_ResultadoExamesAnimal.SetFuncionario(  Result.FieldByName( 'KCAD_ENTIDADE' ).asString,
                                                        Result.FieldByName( 'APELIDO' ).asString) ;
        end ;
    finally
      free ;
  end ;
end;

procedure TfrmZoo_ResultadoExamesAnimal.SetMasterSource(
  const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_ResultadoExamesAnimal.MasterSource  := FMasterSource ;
  dtmZoo_ResultadoExamesAnimal.OpenTables ;
end;

end.
