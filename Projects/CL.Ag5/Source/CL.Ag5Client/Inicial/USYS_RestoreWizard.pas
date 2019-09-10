unit USYS_RestoreWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, VCL.Dialogs,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  System.WideStrings, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, USYS_RestoreDatamodule, System.Actions,
  Vcl.Mask, Tc.VCL.Extended.Mask, Tc.VCL.Edits, Tc.VCL.Controls.GDIButton,
  Tc.VCL.Application, Wrappers, System.ImageList, Vcl.ImgList ;

type
  TSYS_RestoreWizard = class(T_FormWizard)
    Memo1: TMemo;
    TcMPFilenameEdit1: TTcFilenameEdit;
    Label1: TLabel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    lblDefaultFolder: TLabel;
    Label3: TLabel;
    lblConnectedTo: TLabel;
    ProgressBar: TProgressBar;
    lblEndRestoreState: TLabel;
    lblStatus: TLabel;
    imgListStatus: TImageList;
    imgStatus: TImage;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
  private
    { Private declarations }
    RestoreDatamodule: TSYS_RestoreDatamodule ;
    function DoRestore : boolean ;
    procedure ShowCompressStatus(const Value,  MaxValue: Int64);
    procedure ShowDecompressStatus(const Value,  MaxValue: Int64);
    procedure LogRestore(ALog: string);
    procedure LogBackup(ALog: string);
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

uses   Masks
     , Tc.DBRTL.AbstractDB
     , CLAG5.DatabaseIntf
     , CL.Ag5.NSMsgs
     , Exceptions ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TSYS_RestoreWizard.Create(AOwner: TComponent);
var
  DomainPath   : IDomainPath ;
begin
  inherited;
  RestoreDatamodule := TSYS_RestoreDatamodule.Create ( self ) ;
  RestoreDatamodule.LogBackup  := LogBackup ;
  RestoreDatamodule.LogRestore := LogRestore ;
  RestoreDatamodule.CompressStatus := ShowCompressStatus ;
  RestoreDatamodule.DeCompressStatus := ShowDecompressStatus ;

  _actNext.Caption := '&Iniciar' ;
  _btbNext.Caption := '&Iniciar' ;

  //rever
  DomainPath   := DatabaseCfgFactory ;
  self.lblDefaultFolder.Caption := DomainPath.BackupFolder ;

  lblConnectedTo.Caption := 'Conectado à fazenda : CL-' + LoggedUser.DomainCode + ' - ' + LoggedUser.DomainName ;
  // insira os codigos de criação de DTM ou variaveis aqui
end;

destructor TSYS_RestoreWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;


function TSYS_RestoreWizard.DoRestore : boolean ;
begin
  Result := True ;
  try
    ProgressBar.visible := True ;
    RestoreDatamodule.RestoreBackup( TcMPFilenameEdit1.FileName ) ;
    ProgressBar.visible := False ;
    lblEndRestoreState.Caption := 'Restore concluído.' ;
  except On E: Exception do
    begin
      lblEndRestoreState.Caption := 'Restore concluído com erro(s).' ;
      LogRestore ( E.Message ) ;
      Result := False ;
    end;
  end;
end;

class function TSYS_RestoreWizard.Execute : boolean;
var
  ThisForm: TSYS_RestoreWizard ;
begin
  ThisForm := TSYS_RestoreWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TSYS_RestoreWizard.ShowCompressStatus(const Value,
  MaxValue: Int64);
begin
   ProgressBar.Min := 0 ;
   ProgressBar.Max := 100 ;
   ProgressBar.Position := Trunc ( ( Value / MaxValue ) * 100 )  ;

   lblStatus.Caption := Format (  'Compactando ponto de restauração: %d%%', [ ProgressBar.Position ] );
   Application.ProcessMessages ;
end;

procedure TSYS_RestoreWizard.ShowDeCompressStatus(const Value,
  MaxValue: Int64);
begin
   ProgressBar.Min := 0 ;
   ProgressBar.Max := 100 ;
   ProgressBar.Position := Trunc ( ( Value / MaxValue ) * 100 )  ;
   lblStatus.Caption := Format (  'Descompactando backup: %d%%', [ ProgressBar.Position ] );
   Application.ProcessMessages ;
end;

procedure TSYS_RestoreWizard.LogBackup(ALog: string);
begin
   Memo1.Lines.Add ( ALog ) ;
   lblStatus.Caption := 'Criando ponto de restauração: ' + ALog ;
   ProgressBar.StepIt ;
   if ProgressBar.Position =  ProgressBar.Max then
      ProgressBar.Position :=  0 ;
   Application.ProcessMessages ;
end;

procedure TSYS_RestoreWizard.LogRestore(ALog: string);
begin
   Memo1.Lines.Add ( ALog ) ;
   lblStatus.Caption := 'Restaurando backup: ' + ALog ;
   ProgressBar.StepIt ;
   if ProgressBar.Position =  ProgressBar.Max then
      ProgressBar.Position :=  0 ;
   Application.ProcessMessages ;
end;

procedure TSYS_RestoreWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled := FileExists ( TcMPFilenameEdit1.FileName )
                   and MatchesMask( ExtractFileName ( TcMPFilenameEdit1.FileName ), 'CLAG5.[0-9][0-9][0-9][0-9][0-9][0-9].*.backup' )  ;

end;

procedure TSYS_RestoreWizard._actNextExecute(Sender: TObject);
var
  SelectedFarmCode : integer ;
  LTipo : string ;
  LOK : boolean ;
begin

  SelectedFarmCode := StrToIntDef ( Copy( ExtractFileName ( TcMPFilenameEdit1.FileName ), 7, 6 ), -1 ) ;

  if SelectedFarmCode <> StrToInt ( LoggedUser.DomainCode ) then
     raise Warning.Create('O arquivo de backup não corresponde a fazenda atual.') ;

  LTipo := '' ;
  if Pos( '.ZOO.BACKUP', UpperCase ( TcMPFilenameEdit1.FileName ) ) <> 0 then
     LTipo := 'zootécnico'
  else if Pos( '.FIN.BACKUP', UpperCase ( TcMPFilenameEdit1.FileName ) ) <> 0 then
     LTipo := 'financeiro' ;

  if LTipo = '' then
     raise Warning.Create('Não foi possivel determinar o tipo de backup.') ;

  if MessageDlg ( Format( 'O backup escolhido para ser restaurado é %s.'
        +#13#10'Os dados %s atuais serão apagados e substituídos.'
        +#13#10#13#10'Deseja continuar?', [LTipo,LTipo] ), mtConfirmation ) <> mrYes then
     Exit ;

  try
    TCLAg5NSMsgSysLockApp.CreateAndDispatch( self ) ;
    Memo1.Clear ;
    LOK := DoRestore ;
    inherited ;
  finally
    imgListStatus.GetIcon( Byte( LOK ), imgStatus.Picture.Icon );
    Memo1.Visible := not LOK ;
    TCLAg5NSMsgSysUnLockApp.CreateAndDispatch( self ) ;
    Memo1.ScrollBy(0, Memo1.Lines.Count) ;
    Application.ProcessMessages ;
  end;


end;

procedure TSYS_RestoreWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

Initialization
   RegisterClass ( TSYS_RestoreWizard ) ;
end.
