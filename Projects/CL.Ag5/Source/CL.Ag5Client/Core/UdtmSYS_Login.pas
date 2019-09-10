unit UdtmSYS_Login;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider, Data.SqlExpr, Tc.Data.SQLExpr, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
 
  VCL.Graphics,
  Tc.RTL.Exceptions ;


type
  TdtmSYS_Login = class ( TDataModule )
    cdsUsers: TClientDataSet;
    dspDomains: TDataSetProvider;
    sqlUsers: TTcSQLDataSet;
    cdsUsersKSYS_USER: TStringField;
    cdsUsersLOGIN: TStringField;
    cdsUsersSPASSWORD: TStringField;
    cdsDomains: TClientDataSet;
    sqlDomains: TTcSQLDataSet;
    DataSource1: TDataSource;
    cdsDomainssqlUsers: TDataSetField;
    sqlDomainsKSYSDOMAIN: TStringField;
    sqlDomainsDOMAIN_CODE: TStringField;
    sqlDomainsDOMAIN_NAME: TStringField;
    sqlDomainsDOMAIN_ALIAS: TStringField;
    sqlUsersKSYS_USER: TStringField;
    sqlUsersLOGIN: TStringField;
    sqlUsersSPASSWORD: TStringField;
    cdsDomainsKSYSDOMAIN: TStringField;
    cdsDomainsDOMAIN_CODE: TStringField;
    cdsDomainsDOMAIN_NAME: TStringField;
    cdsDomainsDOMAIN_ALIAS: TStringField;
    sqlUsersEMAIL: TStringField;
    cdsUsersEMAIL: TStringField;
    cdsProfiles: TClientDataSet;
    cdsProfilesALIAS: TStringField;
    cdsProfilesDESCRIPTION: TStringField;
    sqlDomainsSYSLICENSE: TStringField;
    cdsDomainsSYSLICENSE: TStringField;
    sqlDomainsDOMAIN_NAME_CODE: TStringField;
    cdsDomainsDOMAIN_NAME_CODE: TStringField;
    procedure cdsDomainsDOMAIN_CODEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    FComputerID: string;
    procedure GetProfiles ;
    function GetComputerID: string;
  public
    { Public declarations }
    procedure ResetPassword ;
    procedure OpenTables ;
    procedure Refresh ;
    property ComputerID : string  read GetComputerID ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;


implementation

uses Tc.RTL.MD5, Tc.DBRTL.AbstractDB, StrUtils, GuidSuppl,
     CLAG5.DatabaseIntf,
     CLAg5.ComputerID, CDSSuppl  ;

{$R *.dfm}

procedure TdtmSYS_Login.cdsDomainsDOMAIN_CODEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text := 'CL-' + Sender.AsString ;
end;

constructor TdtmSYS_Login.Create(AOwner: TComponent);
begin
  inherited;
//  TCDSSuppl.Open ( cdsDomains ) ;
  GetProfiles;
end;



function TdtmSYS_Login.GetComputerID: string;
begin
   Result := CLAg5.ComputerID.ComputerID
end;

procedure TdtmSYS_Login.GetProfiles;
var
  List : TStrings ;
  LIDatabaseCfg : IDatabaseCfg ;
  LProfileItem : string ;
  LProfile : string ;
  LPosDescription : integer ;
  LDescription : string ;
begin
  cdsProfiles.CreateDataSet ;

  LIDatabaseCfg  := DatabaseCfgFactory ;
  List := LIDatabaseCfg.GetProfileList ;
  for LProfileItem in List do
    begin
      LPosDescription := Pos ( '=', LProfileItem ) ;
      if LPosDescription = 0 then
         begin
          LProfile := LProfileItem ;
          LDescription := LProfileItem ;
         end
      else
        begin
          LProfile       := Copy ( LProfileItem, 1, LPosDescription - 1 ) ;
          LDescription := Copy ( LProfileItem, LPosDescription + 1, 64 ) ;
        end;
      cdsProfiles.AppendRecord([LProfile, LDescription]);
    end;

  if cdsProfiles.RecordCount = 1  then
    begin
     LIDatabaseCfg.Profile := cdsProfilesAlias.asString ;
     OpenTables ;
    end;

  List.Free ;
end;

procedure TdtmSYS_Login.OpenTables;
begin
  TTcAbstractDB.GetByAlias('SESSION').Connection.Close ;
  sqlDomains.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('SESSION').Connection ) ;
  sqlUsers.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('SESSION').Connection ) ;
//  cdsDomains.Params.ParamByName('SERIAL').asString := GuidStrTo20 ( StrToMD5( CLAg5.ComputerID.ComputerID ) ) ;
  TCDSSuppl.Open ( cdsDomains ) ;
end;

procedure TdtmSYS_Login.Refresh;
begin
  TCDSSuppl.Open ( cdsDomains ) ;
end;


function SendMail ( ASMTPServer : PAnsiChar ; APort : Integer ; AUserName, APassword : PAnsiChar ; ANeedAuth, AUseSSL : boolean ;
  AEMailFrom, AEmailTo, AEmailCC, AEmailCCo, ASubject, AMessageBody : PAnsiChar ) : boolean  ; stdcall; external 'TcSMailer.dll';

procedure TdtmSYS_Login.ResetPassword;
const
  _SQL_RESET_PASSWORD = 'EXECUTE PROCEDURE RESET_PASSWORD ( :KSYS$DOMAIN, :KSYS$USER, :NEWPASSWORD )' ;
var
  p : TParams ;
  ActiveFarm : string ;
  ActiveUser : string ;
  h,m,s,ms : word ;
  NewPassword : string ;
  MailTo, msg : AnsiString ;
const
  _SMTP      = 'smtp.gmail.com' ;
  _PORTA     = 587 ; ////465 ; //587 ; //465
  _USER      = 'agenda@ControleLeiteiro.com.br' ;
  _PASSWORD  = '@gend@5123' ;
  _FROM      = 'agenda@ControleLeiteiro.com.br' ;
  _AUTH      = True ;
  _SSL       = True ; //False ;


begin

  DecodeTime ( Time, h,m,s,ms ) ;
  NewPassword := Copy ( StrUtils.DupeString( GuidSuppl.GuidStr32 + StrUtils.ReverseString( GuidSuppl.GuidStr32 ), 1 ), s + 1, 8 ) ;

  MailTo := cdsUsersEMAIL.asString ;

  Msg :=  'A senha de acesso para o usuário ' + cdsUsersLOGIN.asString
   +#13#10'foi redefinida.'
   +#13#10'A nova senha para acesso ao Agenda5 é : ' + NewPassword ;

  if not  SendMail (  PAnsiChar ( _SMTP ), _PORTA,
                      PAnsiChar ( _USER ), PAnsiChar ( _PASSWORD ), _AUTH, _SSL,
                      PAnsiChar ( _FROM ),
                      PAnsiChar ( MailTo ),
                      PAnsiChar ( '' ),
                      PAnsiChar ( 'agenda@ControleLeiteiro.com.br' ),
                      PAnsiChar ( 'Redefinição de senha Agenda5' ),
                      PAnsiChar ( msg ) ) then
    raise Warning.Create('Não foi possível enviar o email de confimação da troca de senha.'#13#10'A senha não foi redefinida.' );



  ActiveFarm := cdsDomainsKSYSDOMAIN.asString ;
  ActiveUser := cdsUsersKSYS_USER.asString ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString := ActiveFarm ;
  p.CreateParam( ftString, 'KSYS$USER', ptInput ).asString   := ActiveUser ;
  p.CreateParam( ftString, 'NEWPASSWORD', ptInput ).asString := newPassword ;

  try
    sqlDomains.SQLConnection.Execute( _SQL_RESET_PASSWORD, p ) ;

    TCDSSuppl.Open ( cdsDomains ) ;
    cdsDomains.Locate('KSYS$DOMAIN', ActiveFarm, [] ) ;
    cdsUsers.Locate('KSYS_USER', ActiveUser, [] ) ;

  finally
    p.free ;
  end;


end;


end.

