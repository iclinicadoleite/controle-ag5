unit USendDataDatamodule;

interface

uses
  System.SysUtils, System.Classes, IdBaseComponent, IdComponent, Dialogs,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, IdftpList,
  IdFTPCommon, USYS_BackupDatamodule;

type
  TSendDataDatamodule = class(TDataModule)
    IdFTP1: TIdFTP;
  private
    { Private declarations }
    FLog: TLog;
    FDirectoryPath: String;
    FHost: String;
    FUserName: String;
    FPassword: String;
    function FTPConnect: Boolean;
    procedure SetLog(const Value: TLog);
    procedure DoLog ( ALog : string );
    procedure FTPMakeDir;
    procedure SetDirectoryPath(const Value: string);
    procedure SetHost(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetUserName(const Value: String);
  public
    { Public declarations }
    function FTPUpload( APathFiles: String ): Integer;
    property Log : TLog  read FLog write SetLog;
    property DirectoryPath: string read FDirectoryPath write SetDirectoryPath;
    property Host: String read FHost write SetHost;
    property UserName: String read FUserName write SetUserName;
    property Password: String read FPassword write SetPassword;

  end;

//var
//  SendDataDatamodule: TSendDataDatamodule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TSendDataDatamodule.DoLog(ALog: string);
begin
  if Assigned ( FLog ) then
     FLog ( ALog ) ;
end;

function TSendDataDatamodule.FTPConnect: Boolean;
begin
  Result := False;
  with IdFTP1 do
   begin
     Host := FHost;
     Username := FUserName;
     Password := FPassword;
     ProxySettings.ProxyType := fpcmNone ;
     ProxySettings.Port := 21;
     AutoLogin := True ;
     Passive := True ;
     TransferType := ftBinary ;

     try
       Connect;
       Result:= True;
       DoLog(Format('Conectado ao servidor %s',[Host]));
     except
      on E: Exception do
       begin
         Result := False;
         DoLog(Format('Erro ao conectar: %s',[E.Message]));
       end;
     end;
   end;

end;


procedure TSendDataDatamodule.FTPMakeDir;
begin

   try

     if FDirectoryPath = EmptyStr then
       Exit;

     IdFTP1.MakeDir( FDirectoryPath );
     DoLog(Format('Diretório %s criado com sucesso',[FDirectoryPath]));
   except
     on E: Exception do
      begin
        if Pos('Directory already exists', E.Message) > 0 then
          DoLog(Format('Diretório já criado no servidor',[FDirectoryPath]))
        else
          DoLog(E.Message);
      end;

   end;

end;

function TSendDataDatamodule.FTPUpload(APathFiles: String): Integer;
const
  _STATUS_OK = 0;
  _STATUS_ERRO_CONEXAO = 1;
  _STATUS_ERRO_ENVIO   = 2;
var
  SR: TSearchRec;
  I: Integer;
  f, m: TStream;
  FileName, LFilePathName: String;
  t: Cardinal;
begin

  if not FTPConnect then
   begin
    Result:= _STATUS_ERRO_CONEXAO;
    Exit;
   end;

  f:= nil;
  m:= nil;

  //Procura Arquivos na pasta
  I := FindFirst(APathFiles+'\*.*', faAnyFile, SR);
  while I = 0 do
   begin

     try
       try
         FileName := APathFiles+'\'+ SR.Name;
         f := TFileStream.Create(FileName, fmOpenRead);
         m := TMemoryStream.Create;
         m.CopyFrom(f, f.Size);
         m.Seek(0,0);
         LFilePathName := SR.Name;
         if FDirectoryPath <> '' then
          begin
            FTPMakeDir;
            LFilePathName := FDirectoryPath+'/'+SR.Name;// '\'
          end;
         DoLog(Format('Enviando arquivo: %s ',[SR.Name]));
         IdFTP1.Put(m,LFilePathName);
         DoLog(Format('Arquivo %s enviado com sucesso. Tamanho: %d bytes',[SR.Name, m.Size]));
         Result := _STATUS_OK;
       except
         on E: Exception do
         begin
           DoLog(Format('Erro ao enviar arquivo %s. Erro: %s',[SR.Name, E.Message]));
           Result:= _STATUS_ERRO_ENVIO;
         end;
       end;
     finally
       m.Free;
       f.Free;
     end;

     I := FindNext(SR);
   end;

   IdFTP1.Disconnect;
   DoLog('Finalizado.');

end;

procedure TSendDataDatamodule.SetDirectoryPath(const Value: string);
begin
  FDirectoryPath := Value;
end;

procedure TSendDataDatamodule.SetHost(const Value: String);
begin
  FHost := Value;
end;

procedure TSendDataDatamodule.SetLog(const Value: TLog);
begin
  FLog := Value;
end;

procedure TSendDataDatamodule.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TSendDataDatamodule.SetUserName(const Value: String);
begin
  FUserName := Value;
end;

end.
