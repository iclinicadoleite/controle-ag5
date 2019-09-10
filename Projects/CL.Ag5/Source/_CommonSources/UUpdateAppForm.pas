unit UUpdateAppForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, IniFiles,
  ClAg5.DatabaseIntf, Tc.DBRTL.AbstractDB, Tc.DBRTL.AbstractDB.DBX, DBClient, DB,
  AppProfile;

type
  TUpdateAppForm = class(TForm)
    Panel1: TPanel;
    LbInfo: TLabel;
    Shape1: TShape;
    BtnYes: TBitBtn;
    BtnNo: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FPathFile: String;
    FDescrVersion : String;
    FCloseApp: Boolean;
    function CheckForUpdate: Boolean;
    function RemoveLocalServer ( AFileName : string ) : string ;
    function GetPathFile: String;
    function GetCloseApp: Boolean;
    function GetDescrVersion: String;
  public
    { Public declarations }
    class function ShowMessageUpdate(out APathFile: String): Boolean;
    property PathFile: String read GetPathFile;
    property CloseApp: Boolean read GetCloseApp;
    property DescrVersion: String read GetDescrVersion;
  end;

//var
  //UpdateAppForm: TUpdateAppForm;

implementation

{$R *.dfm}

{ TUpdateAppForm }

function TUpdateAppForm.CheckForUpdate: Boolean;
const
  SQL_APPVERSION =
         'select V.SYS$VERSION, V.SYS$RELEASE, V.SYS$REVISION, V.SYS$APPVERSION'
  +#13#10'  from SYS$VERSION V';

  UPDATE_APPVERSION =
         'UPDATE SYS$VERSION SET SYS$APPVERSION = :APPVERSION';
var
  LPathUpdatedApp, LStatusDownload, LVersionDownload,
  LCurrentVersion: String;
  LIniFile: TIniFile;
  DatabaseCfgUpdate: IDatabaseCfg;
  cds: TClientDataSet;
  p: TParams;
  AppProfile : IAppProfile ;
begin
  Result:= False;
  FDescrVersion := '';
  DatabaseCfgUpdate :=  DatabaseCfgFactory( True );
  DatabaseCfgUpdate.Profile := 'DataServer';
  AppProfile := AppProfileFactory ;

  {Para não atualizar se o cliente utiliza em rede}
  {if not ( ((DatabaseCfgUpdate.ServerAddress = '') or (DatabaseCfgUpdate.ServerAddress = '127.0.0.1')) and
           ((DatabaseCfgUpdate.ServerName    = '') or (DatabaseCfgUpdate.ServerName.ToLower = 'localhost')) ) then
    Exit;}


  LPathUpdatedApp:= AppProfile.ReadString('App', 'PathDownload', RemoveLocalServer( DatabaseCfgUpdate.Path_update_application )) ;
  if Copy(LPathUpdatedApp, Length(LPathUpdatedApp), 1) <> '\' then
    LPathUpdatedApp := LPathUpdatedApp + '\';


  //Se a versão que consta no arquivo INI for maior do que a registrada no banco, então a atualiza a versão no banco
  cds:= nil;
  TTcAbstractDB.GetByAlias('SESSION').populateClientDataSet(cds, SQL_APPVERSION);
  LCurrentVersion := AppProfile.ReadString('App', 'Version', '0') ; //{DatabaseCfgFactory}DatabaseCfgUpdate.CurrentVersion;
  FCloseApp := False;

  if StrToInt(LCurrentVersion) > cds.FieldByName('SYS$APPVERSION').AsInteger then
   begin
     p:= TParams.Create(nil);
     p.CreateParam(ftInteger, 'APPVERSION' ,ptInput).AsInteger := StrToInt(LCurrentVersion);
     TTcAbstractDB.GetByAlias('SESSION').Execute(UPDATE_APPVERSION, p);
     p.Free;
   end
  else
  if StrToInt(LCurrentVersion) < cds.FieldByName('SYS$APPVERSION').AsInteger then
   begin
     Application.MessageBox(
             pChar('O banco de dados foi atualizado por outro computador.'
           +#13#10'Para continuar será necessário instalar a nova versão do Controle MDA.'),
           'Aviso', MB_ICONEXCLAMATION );
     FCloseApp := True;
   end;

  if Assigned(cds) then
    cds.Free;

  if not FileExists(LPathUpdatedApp+'Download_Info.ini') then
    exit;

  LIniFile:= TIniFile.Create(LPathUpdatedApp+'Download_Info.ini');
  LStatusDownload  := LIniFile.ReadString ( 'App' ,  'DownloadOK'      ,  '0' );
  LVersionDownload := LIniFile.ReadString ( 'App' ,  'VersionDownload' ,  '0' );
  FDescrVersion    := LIniFile.ReadString ( 'App' ,  'Description'     ,  ''  );
  FPathFile        := LIniFile.ReadString ( 'App' ,  'FileName' ,         ''  );
  FPathFile        := LPathUpdatedApp+FPathFile;
  LIniFile.Free;

  if (LStatusDownload = '1') and
     (StrToInt(LCurrentVersion) < StrToInt(LVersionDownload)) then
   begin
     Result:= True;
   end;

end;

procedure TUpdateAppForm.FormCreate(Sender: TObject);
begin
  Self.Left := Screen.Width - (Self.Width + 5);
  Self.Top  := Screen.Height - (Self.Height + 110);
end;

procedure TUpdateAppForm.FormShow(Sender: TObject);
begin
  AnimateWindow(Self.Handle,200,AW_HOR_POSITIVE);
end;

function TUpdateAppForm.GetCloseApp: Boolean;
begin
  Result := FCloseApp;
end;

function TUpdateAppForm.GetDescrVersion: String;
begin
  Result := FDescrVersion;
end;

function TUpdateAppForm.GetPathFile: String;
begin
  Result:= FPathFile;
end;

function TUpdateAppForm.RemoveLocalServer(AFileName: string): string;
begin
  if Pos ( ':', AFileName ) > 2 then
   Result := Copy ( AFileName, Pos ( ':', AFileName ) + 1, MaxInt )
  else
   Result := AFileName ;
end;

class function TUpdateAppForm.ShowMessageUpdate(out APathFile: String): Boolean;
var
  LFormUpdate: TUpdateAppForm;
begin
  Result := False;

  LFormUpdate := nil;
  if not Assigned( LFormUpdate ) then
    LFormUpdate := TUpdateAppForm.Create(nil);

  if not LFormUpdate.CheckForUpdate then
   begin
     Result :=  LFormUpdate.CloseApp;
     APathFile := '';
     FreeAndNil( LFormUpdate );
     exit;
   end;

  APathFile:= LFormUpdate.PathFile;

  if LFormUpdate.GetDescrVersion <> '' then
     LFormUpdate.lbInfo.Caption :=
         Format('A versão %s está pronta para ser instalada.'
         +#13#10'Deseja instalar agora ?',[LFormUpdate.DescrVersion])
  else
     LFormUpdate.lbInfo.Caption :=
         Format('Há uma nova versão do sistema pronta para ser instalada.'
         +#13#10'Deseja instalar agora ?',[]);


  LFormUpdate.ShowModal;
  if LFormUpdate.ModalResult = mrOK then
   begin
     Result := True;
     LFormUpdate.Close;
     LFormUpdate.Free;
   end
  else
  if LFormUpdate.ModalResult = mrCancel then
   begin
     //Result := False;
     Result :=  LFormUpdate.CloseApp;
     APathFile := '';
     LFormUpdate.Close;
     LFormUpdate.Free;
   end
end;

end.
