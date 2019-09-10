unit USYS_BackupWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, VCL.Mask, JvExMask, Tc.VCL.Edits,
  VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, DB , USYS_BackupDatamodule,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers,
  System.ImageList, Vcl.ImgList ;

type
  TSYS_BackupWizard = class(T_FormWizard)
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    TabSheet2: TTabSheet;
    cbxCopy: TCheckBox;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    TcMPDirectoryEdit1: TTcDirectoryEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblDefaultFolder: TLabel;
    rbSelected: TRadioButton;
    rbAll: TRadioButton;
    JvDBUltimGrid1: TJvDBUltimGrid;
    GroupBox2: TGroupBox;
    chkModuloZootecnico: TCheckBox;
    chkModuloFinanceiro: TCheckBox;
    dtsLstFazendas: TDataSource;
    Label3: TLabel;
    Panel6: TPanel;
    lblEndBackupState: TLabel;
    ProgressBar: TProgressBar;
    TcGDIButton1: TTcGDIButton;
    lblStatus: TLabel;
    imgStatus: TImage;
    imgListStatus: TImageList;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure JvDBUltimGrid1CellClick(Column: TColumn);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure rbAllClick(Sender: TObject);
    procedure rbSelectedClick(Sender: TObject);
    procedure TcGDIButton1Click(Sender: TObject);
  private
    { Private declarations }
    FCopyPath : string ;
    BackupDatamodule: TSYS_BackupDatamodule ;
    procedure InvertSelection ;
    function DoBackup : boolean ;
    procedure Log(ALog: string);
    procedure ShowCompressStatus( const Value, MaxValue: Int64 ) ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

uses
//ClAg5.Common.BackupRestoreAgenda5,
     CLAG5.DatabaseIntf,
     CL.AG5.NSMsgs  ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TSYS_BackupWizard.Create(AOwner: TComponent);
var
  DomainPath   : IDomainPath ;
begin
  inherited;
  BackupDatamodule := TSYS_BackupDatamodule.Create ( self ) ;
  BackupDatamodule.Log := Log ;
  BackupDatamodule.CompressStatus := ShowCompressStatus ;
  BackupDatamodule.OpenFazendas ;

  _actNext.Caption := '&Iniciar' ;
  _btbNext.Caption := '&Iniciar' ;

  //rever
  DomainPath   := DatabaseCfgFactory ;
  self.lblDefaultFolder.Caption := DomainPath.BackupFolder ;

  // insira os codigos de criação de DTM ou variaveis aqui
end;

destructor TSYS_BackupWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

function TSYS_BackupWizard.DoBackup: boolean ;
var
  LBackupModule : TBackupModuleTypes ;
begin

  LBackupModule := [] ;

  if chkModuloFinanceiro.Checked then
     LBackupModule := LBackupModule + [bmFinanceiro] ;

  if chkModuloZootecnico.Checked then
     LBackupModule := LBackupModule + [bmZootecnico] ;

  Result := True ;
  try
    ProgressBar.visible := True ;
    BackupDatamodule.ExecuteBackup ( FCopyPath, LBackupModule ) ;
    ProgressBar.visible := False ;
    lblEndBackupState.Caption := 'Backup concluído.' ;
  except On E: Exception do
    begin
      lblEndBackupState.Caption := 'Backup concluído com erro(s).' ;
      Log( E.Message ) ;
      Result := False ;
    end;
  end;


(*
   BackupAgenda5 := BackupAgenda5Factory ;
   BackupAgenda5.Log            := Log ;
   BackupAgenda5.CompressStatus := nil ;
   BackupAgenda5.DomainCode     := LoggedUser.DomainCode ;
   BackupAgenda5.Execute ;

   if FCopyPath <> '' then
     begin
      Log ( 'Copiando arquivo para : ' + FCopyPath  + ExtractFileName ( BackupAgenda5.BackupFileName ) ) ;
      if not CopyFile (PChar ( BackupAgenda5.BackupFileName ), PChar ( FCopyPath + ExtractFileName ( BackupAgenda5.BackupFileName ) ), False ) then
         Log ( 'Não foi possível realizar a cópia. Verifique se possui diretos de gravação na pasta indicada.' ) ;
     end;
*)
end;


procedure TSYS_BackupWizard.Log(ALog: string);
begin
   Memo1.Lines.Add ( ALog ) ;
   lblStatus.Caption := 'Backup: ' + ALog ;
   ProgressBar.StepIt ;
   if ProgressBar.Position =  ProgressBar.Max then
      ProgressBar.Position :=  0 ;
   Application.ProcessMessages ;
end;


procedure TSYS_BackupWizard.rbAllClick(Sender: TObject);
begin
  BackupDatamodule.AllFarms := True ;
  JvDBUltimGrid1.Repaint ;
end;

procedure TSYS_BackupWizard.rbSelectedClick(Sender: TObject);
begin
  BackupDatamodule.AllFarms := False ;
  JvDBUltimGrid1.Repaint ;
end;

procedure TSYS_BackupWizard.ShowCompressStatus(const Value, MaxValue: Int64);
begin
   ProgressBar.Min := 0 ;
   ProgressBar.Max := 100 ;
   ProgressBar.Position := Trunc ( ( Value / MaxValue ) * 100 )  ;
   lblStatus.Caption := Format (  'Compactando: %d%%', [ ProgressBar.Position ] );
   Application.ProcessMessages ;
end;

procedure TSYS_BackupWizard.TcGDIButton1Click(Sender: TObject);
begin
   self.BackupDatamodule.InvertAllSelections ;
   if BackupDatamodule.AllFarms then
     rbAll.Checked := True
   else
     rbSelected.Checked := True ;
end;

class function TSYS_BackupWizard.Execute : boolean;
var
  ThisForm: TSYS_BackupWizard ;
begin
  ThisForm := TSYS_BackupWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TSYS_BackupWizard.InvertSelection;
begin
  BackupDatamodule.InvertSelection ;
  if BackupDatamodule.AllFarms then
     rbAll.Checked := True
  else
     rbSelected.Checked := True ;
end;

procedure TSYS_BackupWizard.JvDBUltimGrid1CellClick(Column: TColumn);
begin
  if ( not BackupDatamodule.cdsFazendas.IsEmpty )
  and ( Column.Field =  BackupDatamodule.cdsFazendasCHECKED ) then
     InvertSelection ;
end;

function TSYS_BackupWizard.JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin
  with BackupDatamodule do
    Result := Assigned ( Field ) and ( Field = cdsFazendasCHECKED );

  StringForTrue  := '1' ;
  if BackupDatamodule.AllFarms then
     StringForFalse := '9'
  else
     StringForFalse := '0' ;
end;

procedure TSYS_BackupWizard.JvDBUltimGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #32 then
     InvertSelection ;
end;

procedure TSYS_BackupWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TSYS_BackupWizard._actExecuteExecute(Sender: TObject);
begin
  //DoBackup ;
  inherited;
end;

procedure TSYS_BackupWizard._actExecuteUpdate(Sender: TObject);
begin
  _actExecute.Enabled := False ;
end;

procedure TSYS_BackupWizard._actNextExecute(Sender: TObject);
var
  LOK : boolean ;
begin

  try
    TCLAg5NSMsgSysLockApp.CreateAndDispatch( self ) ;
    Memo1.Clear ;
    LOK := DoBackup ;
    inherited ;
  finally
    imgListStatus.GetIcon( Byte( LOK ), imgStatus.Picture.Icon );
    Memo1.Visible := not LOK ;
    TCLAg5NSMsgSysUnLockApp.CreateAndDispatch( self ) ;
    Memo1.ScrollBy(0, Memo1.Lines.Count) ;
    Application.ProcessMessages ;
  end;

end;

procedure TSYS_BackupWizard._actNextUpdate(Sender: TObject);
begin
  if PageControl.ActivePage = TabSheet1  then
    begin
      if (cbxCopy.Checked) then
        FCopyPath := Trim ( TcMPDirectoryEdit1.Text )
      else
        FCopyPath := '' ;

      if ( FCopyPath <> '' ) and ( FCopyPath[Length ( FCopyPath )] <> '\' )   then
         FCopyPath := FCopyPath + '\' ;

      if (cbxCopy.Checked) and ( FCopyPath = '') then
         _actNext.Enabled := False
      else
         _actNext.Enabled := chkModuloZootecnico.Checked or chkModuloFinanceiro.Checked ;
    end
  else
    _actNext.Enabled := False


end;

procedure TSYS_BackupWizard._actPriorExecute(Sender: TObject);
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
  RegisterClass ( TSYS_BackupWizard ) ;

end.
