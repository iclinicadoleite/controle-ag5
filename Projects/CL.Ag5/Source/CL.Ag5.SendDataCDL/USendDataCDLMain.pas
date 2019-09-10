unit USendDataCDLMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, USYS_BackupDatamodule, USendDataDatamodule, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, DateUtils,
  Shellapi, filectrl, ClAg5.DatabaseIntf, Vcl.AppEvnts, IniFiles, Data.DB, Tc.Data.DB.Helpers,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, CLAg5Types, Tc.DBRTL.AbstractDB, UDBSession, USYS_ConfigBackupDataModule,
  UBackupDocumentsClass,
  ClAg5.Common.BackupRestore, UFormMensagemEnvio,
  Vcl.Imaging.pngimage;

type
  TSendDataCDLMain = class(TForm)
    ActionList1: TActionList;
    _actExecBackup: TAction;
    Memo1: TMemo;
    Panel1: TPanel;
    ProgressBar: TProgressBar;
    lblStatus: TLabel;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    Timer1: TTimer;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    _actExecBackupToDocuments: TAction;
    Panel3: TPanel;
    BtnBackup: TBitBtn;
    BtnBackupToDocuments: TBitBtn;
    lbRotina: TLabel;
    procedure _actExecBackupExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DatePath(ADate: TDateTime; var ADatePath: String);
    Procedure DeleteFolder(hHandle: THandle; Const sPath : String; Confirm: boolean);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _actExecBackupToDocumentsExecute(Sender: TObject);
  private
    { Private declarations }
    FPathBackup: String;
    FPathIniSend: String;
    FSectionConnection: String;
    FSectionSendInfo: String;
    FProfile: String;
    FProfileList: TStrings;
    FDateLastUpload: TDateTime;
    FNumberOfDaysToSend: Integer;
    FFormatDateDefault : TFormatSettings;
    BackupDatamodule: TSYS_BackupDatamodule ;
    SendDataModule: TSendDataDatamodule;
    SYS_ConfigBackupDataModule: TSYS_ConfigBackupDataModule;
    DBSession: TDBSession;
    FFormMensagemEnvio: TFormMensagemEnvio;
    procedure Log(ALog: string);
    procedure ShowCompressStatus( const Value, MaxValue: Int64 ) ;
    procedure HideApplicationToTryIcon;
    procedure GetProfileBackup;
    procedure LoadOwnIniFile;
    procedure SaveOwnIniFile;
    procedure LoadDateFormatParams;
    procedure LoadFTPParamsConnect;
    procedure CheckFarmToBackup( ADomainCode: String; AChecked: Boolean);
  public
    { Public declarations }
    procedure Execute( AProfile: String; Sender: TObject = nil );
    procedure ExecuteBackupToDocuments(AProfile: String; Sender: TObject = nil);
  end;

var
  SendDataCDLMain: TSendDataCDLMain;

const
  _STATUS_BACKUP_OK   = 1;
  _STATUS_BACKUP_ERRO = 2;

implementation

{$R *.dfm}

procedure TSendDataCDLMain.DeleteFolder(hHandle: THandle; const sPath: String;
  Confirm: boolean);
var
  OpStruc: TSHFileOpStruct;
  FromBuffer, ToBuffer: Array[0..128] of Char;
begin
  Log(Format('Apagando diretório: %s',[sPath]));
  fillChar( OpStruc, Sizeof(OpStruc), 0 );
  FillChar( FromBuffer, Sizeof(FromBuffer), 0 );
  FillChar( ToBuffer, Sizeof(ToBuffer), 0 );
  StrPCopy( FromBuffer, sPath);
  With OpStruc Do
   Begin
     Wnd:= hHandle;
     wFunc:=FO_DELETE;
     pFrom:= @FromBuffer;
     pTo:= @ToBuffer;
     if not confirm then
      begin
        //Não exibir progresso da exclusão e não perguntar se deseja excluir
        fFlags := FOF_NO_UI;
      end;
     fAnyOperationsAborted:=False;
     hNameMappings:=nil;
   End;
  ShFileOperation(OpStruc);
end;

procedure TSendDataCDLMain.Execute( AProfile: String; Sender: TObject = nil );
var
  BackupModule : TBackupModuleTypes ;
  LLocalSaveFile: String;
  LStatusEnvio, I: Integer;
  LSentFile, LBackup : Boolean;
  LProfile: String;
  LConfirmaEnvio, LLembrarMaisTarde : Boolean;
begin
   try
     try
       LConfirmaEnvio := False;
       LLembrarMaisTarde := False;
       LSentFile := False; //Para saber se algum aquivo foi enviado e depois gravar o arquivo ini
       Memo1.Clear;
       {Para não fazer o backup de um determinado profile, deve existir no arquivo CL.ini
        um parâmetro BACKUPAUTO=0 dentro da sessão do profile}
       Memo1.Lines.Add(Format('Profile: %s',[AProfile]));



       BackupDatamodule.CustomProfile := AProfile;//FProfileList[I];
       if not BackupDatamodule.SQLDB_DOMAINS.Connected then
         BackupDatamodule.SQLDB_DOMAINS.Connected := True;

       BackupDatamodule.Log := Log ;
       BackupDatamodule.CompressStatus := ShowCompressStatus ;
       BackupDatamodule.OpenFazendas ;
       BackupDatamodule.AllFarms := False;

       SYS_ConfigBackupDataModule.CustomProfile := AProfile;//FProfileList[I];
       if SYS_ConfigBackupDataModule.SQLDB_DOMAINS.Connected then
         SYS_ConfigBackupDataModule.SQLDB_DOMAINS.Connected := True;

       SYS_ConfigBackupDataModule.OpenFazendas;

       with SYS_ConfigBackupDataModule.cdsFazendas do
        begin

          First;
          while not Eof do
           begin
             LStatusEnvio:= -1;
             //Verifica se a fazenda está marcada para enviar os backups (A cofiguração é feita no módulo Inicial do controle MDA, na opção de Cópia de segurança.)
             BackupModule := [];
             if ((FieldByName( 'SEND_DAYNUMBER' ).AsString <> '') and
                 (Date >= FieldByName( 'SEND_NEXTDATE' ).AsDateTime)) or
                (Assigned( Sender )) then
              begin
                if ( FieldByName( 'SEND_BKP_ZOO' ).AsBoolean ) then
                  BackupModule := [bmZootecnico];
                if ( FieldByName( 'SEND_BKP_FIN' ).AsBoolean ) then
                  BackupModule := BackupModule + [bmFinanceiro];
              end;

             if (BackupModule = [])then
              begin
                Next;
                Continue;
              end;

             if (not LConfirmaEnvio) and (not LLembrarMaisTarde) then
              begin
                try
                  FFormMensagemEnvio := TFormMensagemEnvio.Create(nil);
                  FFormMensagemEnvio.ShowModal;

                  LConfirmaEnvio := FFormMensagemEnvio.ModalResult = mrOk;
                  LLembrarMaisTarde :=  FFormMensagemEnvio.ModalResult <> mrOk;

                finally
                  FreeAndNil( FFormMensagemEnvio );
                end;
              end;

           if not LConfirmaEnvio then
            begin
             Next;
             Continue;
            end
           else
            begin

              try
                //Cria uma pasta para cada CL na máquina do usuário
                FPathBackup := Format(DatabaseCfgFactory.Path_syncbackup+'%s',[FieldByName('DOMAIN_DESCR').AsString]);

                FPathBackup := RemoveHost( FPathBackup );

                DeleteFolder(Self.Handle,FPathBackup, False);
                LStatusEnvio:= _STATUS_BACKUP_ERRO;

                ProgressBar.visible := True ;
                CheckFarmToBackup( FieldByName('DOMAIN_CODE').AsString, True );
                BackupDatamodule.ExecuteBackup ( FPathBackup, BackupModule ) ;
                ProgressBar.visible := False ;

                lblStatus.Caption := 'Enviando arquivos para o servidor...';
                Application.ProcessMessages ;


                LoadFTPParamsConnect;
                //Cria uma pasta para cada CL no FTP
                SendDataModule.DirectoryPath := Format('BackupFiles_Agenda/%s',[FieldByName('DOMAIN_DESCR').AsString]);
                if SendDataModule.FTPUpload( FPathBackup ) = 0 {Sem erros} then
                 begin
                   LStatusEnvio:= _STATUS_BACKUP_OK;
                   LSentFile := True;
                 end;


              finally
                if LStatusEnvio > -1 then
                 begin
                   Edit;
                   FieldByName( 'SYNC_LASTDATE'  ).AsDateTime := Date;
                   FieldByName( 'SYNC_STATUS'    ).AsInteger  := LStatusEnvio;
                   if (LStatusEnvio = _STATUS_BACKUP_OK) and (not Assigned( Sender )) then
                     FieldByName( 'SEND_NEXTDATE'  ).AsDateTime := SYS_ConfigBackupDataModule.GetNextDateToSend( FieldByName( 'SEND_DAYNUMBER' ).AsInteger, True );
                   Post;
                 end;
                CheckFarmToBackup( FieldByName('DOMAIN_CODE').AsString, False );
                Next;
              end;
            end;

           end;
        end;
      //end;
     except
       on E: Exception do
         begin
           Log(Format('** Erro ao enviar arquivo(Profile: %s). Erro: %s',[AProfile, E.Message]));
         end;
     end;
   finally
     try
       Timer1.Enabled := True;
       if Memo1.Lines.Count > 1 then
        begin
          Log('');
          Log('Exportação terminada.');
          Log('--------------------------------------------');
        end
       else
         Memo1.Clear;
       {Atualiza arquivo INI para atualizar os parâmetros}
       if LSentFile then
        begin
          SaveOwnIniFile;
          LLocalSaveFile := DatabaseCfgFactory.Path_syncbackup+'Log_send_data_'+AProfile+'.txt';
          LLocalSaveFile:= RemoveHost( LLocalSaveFile );
          Memo1.Lines.SaveToFile( LLocalSaveFile );
        end;
       SYS_ConfigBackupDataModule.ApplyUpdates;
       lblStatus.Caption := 'Finalizado.';
       Application.ProcessMessages ;
       SYS_ConfigBackupDataModule.SQLDB_DOMAINS.Close;
       BackupDatamodule.SQLDB_DOMAINS.Close;
     except
        on E: Exception do
         begin
           SYS_ConfigBackupDataModule.SQLDB_DOMAINS.Close;
           BackupDatamodule.SQLDB_DOMAINS.Close;
           Log(Format('** Erro ao finalizar (Profile: %s). Erro: %s',[AProfile, E.Message]));
         end;
     end;
   end;
end;

procedure TSendDataCDLMain.ExecuteBackupToDocuments(AProfile: String; Sender: TObject = nil);
var
  ForceExecuteBackup: Boolean;
  BackupToDocument : TBackupDocuments;
begin
  Memo1.Clear;
  BackupToDocument := TBackupDocuments.Create(Self);
  ForceExecuteBackup := Sender <> nil;
  BackupToDocument.Log := Log;
  BackupToDocument.PathBackup := DatabaseCfgFactory.AutoBackupFolder;
  BackupToDocument.NumberOfDaysToBackup := DatabaseCfgFactory.AutoBackupNumberOfDays;
  BackupToDocument.Execute(AProfile, ForceExecuteBackup);
  FreeAndNil(BackupToDocument);
end;

procedure TSendDataCDLMain.ApplicationEvents1Minimize(Sender: TObject);
begin
  HideApplicationToTryIcon;
end;

procedure TSendDataCDLMain.CheckFarmToBackup(ADomainCode: String; AChecked: Boolean);
var
  ValueBooleanInt: Integer;
begin

  if AChecked then
     ValueBooleanInt:= 1
  else
     ValueBooleanInt:= 0;

  if BackupDatamodule.cdsFazendas.Locate('DOMAIN_CODE', ADomainCode,[]) then
   begin
     BackupDatamodule.cdsFazendas.Edit;
     BackupDatamodule.cdsFazendasCHECKED.AsInteger := ValueBooleanInt;
     BackupDatamodule.cdsFazendas.Post;
   end;
end;


procedure TSendDataCDLMain.DatePath(ADate: TDateTime; var ADatePath: String);
var
  LYear, LMonth, LDay: String;
begin
  LYear:= IntToStr(YearOf(ADate));

  LMonth := IntToStr(MonthOf(ADate));
  if StrToInt(LMonth) < 10 then
     LMonth:= '0'+LMonth;

  LDay:= IntToStr(DayOf(ADate));
  if StrToInt(LDay) < 10 then
     LDay:= '0'+LDay;

  ADatePath := LYear+'-'+LMonth+'-'+LDay;
end;

procedure TSendDataCDLMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja fechar a aplicação ?','Controle MDA - Send Data',
                     MB_ICONQUESTION+MB_YESNO) = IDNO then
    Abort;
  Timer1.Enabled := False ;
end;

procedure TSendDataCDLMain.FormCreate(Sender: TObject);
var
  LPathIni: String;

begin
  lbRotina.Caption := '';
  DBSession := TDBSession.Create(Self);
  GetProfileBackup;

  LoadDateFormatParams;
  //FPathIniSend := Format( ExtractFilePath(Application.Exename)+'%s', ['SendDataCDL.ini'] );
  FSectionSendInfo:= 'SendInfo';

  BackupDatamodule := TSYS_BackupDatamodule.Create ( self ) ;
  BackupDatamodule.Log := Log ;

  SendDataModule:= TSendDataDatamodule.Create(Self);
  SendDataModule.Log := Log;

  SYS_ConfigBackupDataModule:= TSYS_ConfigBackupDataModule.Create( Self );

  HideApplicationToTryIcon;

  Timer1.Enabled := False ;
  _actExecBackupExecute(nil);
  _actExecBackupToDocumentsExecute(nil);
  Timer1.Enabled := True ;
end;

procedure TSendDataCDLMain.GetProfileBackup;
var
  LProfileList : TStrings;
  LPathIniCL, LProfile: String;
  I: Integer;
  IniFile : TIniFile ;
begin
  {Para não fazer o backup de um determinado profile, deve existir no arquivo CL.ini
   um parâmetro BACKUPAUTO=0 dentro da sessão do profile}
  LPathIniCL := Format(ExtractFilePath(Application.ExeName)+'%s', ['CL.ini']);
  IniFile := TIniFile.Create ( LPathIniCL ) ;

  if Assigned( FProfileList ) then
     FProfileList.Clear
  else
    FProfileList:= TStringList.Create;

  LProfileList := DatabaseCfgFactory.GetProfileList;
  for I := 0 to LProfileList.Count-1 do
   begin
      LProfile := Copy(LProfileList[I],1,Pos('=',LProfileList[I])-1);
      if UpperCase( IniFile.ReadString ( LProfile,  Uppercase('BACKUPAUTO'), '1' ) ) = '1' then
         FProfileList.Add( LProfile );
   end;
  IniFile.free ;

end;

procedure TSendDataCDLMain.HideApplicationToTryIcon;
begin
  Self.Hide();
  Self.WindowState := wsMinimized;
  TrayIcon1.Visible := True;
end;

procedure TSendDataCDLMain.LoadDateFormatParams;
begin
  FFormatDateDefault.ShortDateFormat:='dd/mm/yyyy';
  FFormatDateDefault.DateSeparator  :='/';
  FFormatDateDefault.LongTimeFormat :='hh:nn:ss';
  FFormatDateDefault.TimeSeparator  :=':';
end;

procedure TSendDataCDLMain.LoadFTPParamsConnect;
const
   SELECT_FTP_CONNECT =
      'SELECT SYS$VALUE, SYS$DESCRIPTION FROM SYS$TYPES WHERE SYS$VALUE IN (:HOST, :USER, :PASSWD)';
var
  cds: TClientDataSet;
  P: TParams;

begin

  P := TParams.Create(Self);
  P.Clear;
  P.CreateParam(ftString,'HOST'  ,ptInput).AsString := _ST_CFG_LIST_ADDRESS_FTP_SEND_BKP_HOST;
  P.CreateParam(ftString,'USER'  ,ptInput).AsString := _ST_CFG_LIST_ADDRESS_FTP_SEND_BKP_USER;
  P.CreateParam(ftString,'PASSWD',ptInput).AsString := _ST_CFG_LIST_ADDRESS_FTP_SEND_BKP_PASSWORD;

  cds := nil;
  DBSession.ADBSession.populateClientDataSet( cds, SELECT_FTP_CONNECT, P );

  //  showmessage('Quantidade de registros: '+IntToStr(cds.RecordCount));

  if cds.Locate('SYS$VALUE',_ST_CFG_LIST_ADDRESS_FTP_SEND_BKP_HOST,[]) then
     SendDataModule.Host := cds.FieldByName('SYS$DESCRIPTION').AsString;

  if cds.Locate('SYS$VALUE',_ST_CFG_LIST_ADDRESS_FTP_SEND_BKP_USER,[]) then
     SendDataModule.UserName := cds.FieldByName('SYS$DESCRIPTION').AsString;

  if cds.Locate('SYS$VALUE',_ST_CFG_LIST_ADDRESS_FTP_SEND_BKP_PASSWORD,[]) then
     SendDataModule.Password := cds.FieldByName('SYS$DESCRIPTION').AsString;

  P.Free;
  cds.Free;
end;

procedure TSendDataCDLMain.LoadOwnIniFile;
var
  IniFile : TIniFile ;
begin
   {**** Não utiliza mais os parâmetros do arquivo INI.
     Agora o usuário deverá informar no agenda qual dia do mês ele quer
     que o backup seja enviado para a Clínica.
    **** }
   FPathIniSend := DatabaseCfgFactory.DataFolder;

   FPathIniSend:= RemoveHost( FPathIniSend );
   FPathIniSend:= Format( FPathIniSend+'%s',['SendDataCDL.ini'] );

   IniFile := TIniFile.Create ( FPathIniSend ) ;

   FDateLastUpload     := StrToDateTime( IniFile.ReadString ( FSectionConnection{FSectionSendInfo} ,  'DateLastUpload',      '31/12/1999' ), FFormatDateDefault ) ;
   FNumberOfDaysToSend := StrToInt     ( IniFile.ReadString ( FSectionConnection{FSectionSendInfo} ,  'NumberOfDaysToSend',  '30' ) ) ;

   FProfile            := IniFile.ReadString ( FSectionConnection ,  'Profile',      DatabaseCfgFactory.Profile );

   IniFile.free ;
end;

procedure TSendDataCDLMain.Log(ALog: string);
begin
   Memo1.Lines.Add ( ALog ) ;
   lblStatus.Caption := 'Backup: ' + ALog ;
   ProgressBar.StepIt ;
   if ProgressBar.Position =  ProgressBar.Max then
      ProgressBar.Position :=  0 ;
   Application.ProcessMessages ;
end;

procedure TSendDataCDLMain.SaveOwnIniFile;
var
  IniFile : TIniFile ;
  LDateToday: String;
begin

  LDateToday := DateTimeToStr( Date, FFormatDateDefault );

  IniFile := TIniFile.Create ( FPathIniSend ) ;

  IniFile.WriteString ( FSectionConnection , 'Profile'            , FProfile );
  IniFile.WriteString ( FSectionConnection{FSectionSendInfo}   , 'DateLastUpload'     , LDateToday );
  IniFile.WriteInteger( FSectionConnection{FSectionSendInfo}   , 'NumberOfDaysToSend' , FNumberOfDaysToSend );
  IniFile.free ;
end;

procedure TSendDataCDLMain.ShowCompressStatus(const Value, MaxValue: Int64);
begin
  ProgressBar.Min := 0 ;
  ProgressBar.Max := 100 ;
  ProgressBar.Position := Trunc ( ( Value / MaxValue ) * 100 )  ;
  lblStatus.Caption := Format (  'Compactando: %d%%', [ ProgressBar.Position ] );
  Application.ProcessMessages ;
end;

procedure TSendDataCDLMain.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := False ;
 _actExecBackupExecute(nil);
 _actExecBackupToDocumentsExecute(nil);
 Timer1.Enabled := True ;
end;

procedure TSendDataCDLMain.TrayIcon1DblClick(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

procedure TSendDataCDLMain._actExecBackupExecute(Sender: TObject);
var
  BackupModule : TBackupModuleTypes ;
  LLocalSaveFile: String;
  LStatusEnvio, I: Integer;
  LSentFile : Boolean;
  LProfile: String;
begin
   lbRotina.Caption := 'Gerando backup e preparando para envio.';
   Application.ProcessMessages;
   if Sender <> nil then
    begin
      Timer1.Enabled := False ;
      //BtnBackup.Enabled:= False;
      //BtnBackupToDocuments.Enabled := False;
    end;
   _actExecBackup.Enabled := False;
   _actExecBackupToDocuments.Enabled := False;

   //Carrega os parâmetros para saber se será executada a extração de backup e envio dos arquivos para o FTP.
   //LoadOwnIniFile;
   for I := 0 to FProfileList.Count-1 do
    begin
       DatabaseCfgFactory.Profile := FProfileList[I];
       FSectionConnection := FProfileList[I];
       LoadOwnIniFile;
       {if (( ( Date - FDateLastUpload = 0 ) ) or
           ( ( Date - FDateLastUpload ) < FNumberOfDaysToSend )) and
          ( Sender = nil )   then
        begin
          continue;
        end;}
        Execute( FProfileList[I], Sender );
    end;

   if Sender <> nil then
    begin
      //BtnBackupToDocuments.Enabled := True;
      //BtnBackup.Enabled:= True;
      Timer1.Enabled := True ;
    end;
    _actExecBackup.Enabled := True;
    _actExecBackupToDocuments.Enabled := True;

   lbRotina.Caption := '';
   Application.ProcessMessages;
end;

procedure TSendDataCDLMain._actExecBackupToDocumentsExecute(Sender: TObject);
var
 I : Integer;
begin

   lbRotina.Caption := 'Gerando backup para salvar na pasta padrão.';
   Application.ProcessMessages;
   if Sender <> nil then
    begin
      Timer1.Enabled := False ;
      //BtnBackupToDocuments.Enabled:= False;
      //BtnBackup.Enabled := False;
    end;
   _actExecBackup.Enabled := False;
   _actExecBackupToDocuments.Enabled := False;

   for I := 0 to FProfileList.Count-1 do
    begin
       DatabaseCfgFactory.Profile := FProfileList[I];
       FSectionConnection := FProfileList[I];

       ExecuteBackupToDocuments( FProfileList[I], Sender );
    end;

   if Sender <> nil then
    begin
      //BtnBackupToDocuments.Enabled:= True;
      //BtnBackup.Enabled := True;
      Timer1.Enabled := True ;
    end;
   _actExecBackup.Enabled := True;
   _actExecBackupToDocuments.Enabled := True;
   lbRotina.Caption := '';
   Application.ProcessMessages;
end;

end.
