unit USYS_ConfigBackupWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  System.Actions,
  DBClient,
  Tc.VCL.Controls.GDIButton, Data.DB, Tc.Data.DB.Helpers, Vcl.Grids, Vcl.DBGrids, CDSSuppl,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, Tc.VCL.Application, USYS_ConfigBackupDataModule,
  Wrappers ;

type
  TSYS_ConfigBackupWizard = class(T_FormWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsLstFazendas: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure _actExecuteExecute(Sender: TObject);
    procedure JvDBUltimGrid1CellClick(Column: TColumn);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1MouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
  private
    { Private declarations }
    SYS_ConfigBackupDataModule: TSYS_ConfigBackupDataModule;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

uses
    DBXFirebirdSuppl
  , IniFiles
  , ClAg5.Common.BackupRestore
  , DataSnap.DSConnect
    ;

{ TfrmCustomWizard }

constructor TSYS_ConfigBackupWizard.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
  _btbNext.Visible := False;
  _btbPrior.Visible := False;
  _btbExecute.Visible := True;

  SYS_ConfigBackupDataModule := TSYS_ConfigBackupDataModule.Create( Self );
  SYS_ConfigBackupDataModule.OpenFazendas;

end;

destructor TSYS_ConfigBackupWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TSYS_ConfigBackupWizard.Execute : boolean;
var
  ThisForm: TSYS_ConfigBackupWizard;
begin
  ThisForm := TSYS_ConfigBackupWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;


procedure TSYS_ConfigBackupWizard.JvDBUltimGrid1CellClick(Column: TColumn);
begin
  inherited;
  if not ( SYS_ConfigBackupDataModule.cdsFazendas.IsEmpty ) then
    begin
      if Column.Field =  SYS_ConfigBackupDataModule.cdsFazendasSEND_BKP_ZOO then
        SYS_ConfigBackupDataModule.InvertSelection( Column.FieldName )
      else
      if Column.Field =  SYS_ConfigBackupDataModule.cdsFazendasSEND_BKP_FIN  then
        SYS_ConfigBackupDataModule.InvertSelection( Column.FieldName );
    end;
end;

function TSYS_ConfigBackupWizard.JvDBUltimGrid1CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
   with SYS_ConfigBackupDataModule do
    Result := Assigned ( Field ) and (( Field = cdsFazendasSEND_BKP_ZOO) or ( Field = cdsFazendasSEND_BKP_FIN ) );

  StringForTrue  := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TSYS_ConfigBackupWizard.JvDBUltimGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
   begin
     with TClientDataSet( JvDBUltimGrid1.DataSource.DataSet ) do
      begin
        if State in [dsInsert, dsEdit] then
          Post;
      end;
   end;

end;

procedure TSYS_ConfigBackupWizard.JvDBUltimGrid1MouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin

  with TClientDataSet( JvDBUltimGrid1.DataSource.DataSet ) do
   begin
     if State in [dsInsert, dsEdit] then
      begin
        Post;
        JvDBUltimGrid1.EditorMode := False;
      end;
   end;
end;

procedure TSYS_ConfigBackupWizard._actExecuteExecute(Sender: TObject);
begin
  inherited;

   SYS_ConfigBackupDataModule.ApplyUpdates ;
   MessageDlg('Dados gravados com sucesso.',mtInformation,[mbOK]);

end;

procedure TSYS_ConfigBackupWizard._actNextExecute(Sender: TObject);
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

procedure TSYS_ConfigBackupWizard._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TSYS_ConfigBackupWizard ) ;

end.
