unit USYS_ConfigBackupDataModule;

interface

uses
  WinApi.Windows, System.SysUtils, System.Classes, System.WideStrings, DBXFirebird, Tc.DBRTL.AbstractDB,
  Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Data.FMTBcd, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, DateUtils,
  Tc.DBRTL.AbstractDB.DBX, Tc.RTL.Folders, Tc.RTL.Exceptions, Tc.JVCL.Compressor,
  ShellApi, VCL.Dialogs, ClAg5.DatabaseIntf, CDSSuppl ;

type
  TSYS_ConfigBackupDataModule = class(TDataModule)
    AbstractDBConfigDomains: TTcadb_DBX;
    SQLDB_DOMAINS: TSQLConnection;
    sqlFazendas: TTcSQLDataSet;
    sqlFazendasKSYSDOMAIN: TStringField;
    sqlFazendasDOMAIN_DESCR: TStringField;
    sqlFazendasDOMAIN_NAME: TStringField;
    sqlFazendasSEND_BKP_ZOO: TStringField;
    sqlFazendasSEND_BKP_FIN: TStringField;
    sqlFazendasSYNC_LASTDATE: TSQLTimeStampField;
    sqlFazendasSYNC_STATUS: TIntegerField;
    dspFazendas: TDataSetProvider;
    cdsFazendas: TClientDataSet;
    cdsFazendasKSYSDOMAIN: TStringField;
    cdsFazendasDOMAIN_DESCR: TStringField;
    cdsFazendasDOMAIN_NAME: TStringField;
    cdsFazendasSEND_BKP_ZOO: TStringField;
    cdsFazendasSEND_BKP_FIN: TStringField;
    cdsFazendasSYNC_LASTDATE: TSQLTimeStampField;
    cdsFazendasSYNC_STATUS: TIntegerField;
    sqlFazendasDOMAIN_CODE: TStringField;
    cdsFazendasDOMAIN_CODE: TStringField;
    sqlFazendasSEND_DAYNUMBER: TIntegerField;
    sqlFazendasSEND_NEXTDATE: TSQLTimeStampField;
    cdsFazendasSEND_DAYNUMBER: TIntegerField;
    cdsFazendasSEND_NEXTDATE: TSQLTimeStampField;
    procedure cdsFazendasSYNC_STATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure SQLDB_DOMAINSBeforeConnect(Sender: TObject);
    procedure cdsFazendasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FCustomProfile: String;
    procedure SetCustomProfile(const Value: String);
  public
    { Public declarations }
    procedure OpenFazendas ;
    constructor Create ( AOwner : TComponent ) ;override ;
    procedure ApplyUpdates;
    procedure InvertSelection( AFieldName: String ) ;
    function GetNextDateToSend(ADayNumber: Integer; AIncMonth: Boolean = False): TDateTime;
    property CustomProfile: String read FCustomProfile write SetCustomProfile;
  end;

//var
//  SYS_ConfigBackupDataModule: TSYS_ConfigBackupDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  DBXFirebirdSuppl,

  IniFiles,
//  ClAg5.Common.BackupRestoreAgenda5 ,
  ClAg5.Common.BackupRestore,
  Tc.VCL.Application
     , DataSnap.DSConnect
      ;

{ TSYS_ConfigBackupDataModule }

procedure TSYS_ConfigBackupDataModule.ApplyUpdates;
begin
  TCDSSuppl.ApplyUpdates( cdsFazendas );
end;

procedure TSYS_ConfigBackupDataModule.cdsFazendasBeforePost(DataSet: TDataSet);
begin

  if cdsFazendasSEND_DAYNUMBER.AsString = '' then
  begin
    cdsFazendasSEND_DAYNUMBER.Clear;
    cdsFazendasSEND_NEXTDATE.Clear;
  end
  else
  begin
    if cdsFazendasSEND_DAYNUMBER.AsInteger <= 0 then
       cdsFazendasSEND_DAYNUMBER.AsInteger := 1
    else
    if cdsFazendasSEND_DAYNUMBER.AsInteger > 31 then
       cdsFazendasSEND_DAYNUMBER.AsInteger := 31;
    {$IFNDEF _BACKUP_MODULE}
     cdsFazendasSEND_NEXTDATE.AsDateTime:= GetNextDateToSend(cdsFazendasSEND_DAYNUMBER.AsInteger)
    {$ENDIF _BACKUP_MODULE}
  end;

end;

procedure TSYS_ConfigBackupDataModule.cdsFazendasSYNC_STATUSGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsString = '0' then
     Text := '-'
  else
  if Sender.AsString = '1' then
     Text := 'OK'
  else
  if Sender.AsString = '2' then
     Text := 'Erro'
end;

constructor TSYS_ConfigBackupDataModule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  {$IFDEF _BACKUP_MODULE}
  if not Assigned ( TTcAbstractDB.GetByAlias('SESSION') ) then
     Exit ;
  {$ENDIF _BACKUP_MODULE}

end;

function TSYS_ConfigBackupDataModule.GetNextDateToSend(
      ADayNumber: Integer; AIncMonth: Boolean = False): TDateTime;
var
  LMonth, LYear, LDay: word;
  LNextDate: TDateTime;

  function CheckLastDayOfMonth(PMonth:Integer): Integer;
  begin
    case PMonth of
      1 : Result:= 31;
      2 : Result:= 28;
      3 : Result:= 31;
      4 : Result:= 30;
      5 : Result:= 31;
      6 : Result:= 30;
      7 : Result:= 31;
      8 : Result:= 31;
      9 : Result:= 30;
      10: Result:= 31;
      11: Result:= 30;
      12: Result:= 31;
    end;
  end;
begin
  {Se o dia de envio é menor do que o dia atual, então joga para o próximo mês}
  Result:= 0;

  DecodeDate(Date, LYear, LMonth, LDay);

  if (ADayNumber < LDay ) or (AIncMonth) then
   begin
     if LMonth >= 12 then
      begin
        LMonth:= 1;
        LYear := YearOf(Date)+1;
      end
     else
       LMonth := LMonth+1
   end;


  if ( ADayNumber > CheckLastDayOfMonth(LMonth)  ) then
     ADayNumber := CheckLastDayOfMonth(LMonth);

  LNextDate:= EncodeDate(LYear, LMonth, ADayNumber);

  Result:= LNextDate;
end;

procedure TSYS_ConfigBackupDataModule.InvertSelection(AFieldName: String);
begin
  cdsFazendas.Edit;
  if cdsFazendas.FieldByName( AFieldName ).AsString = 'T' then
     cdsFazendas.FieldByName( AFieldName ).AsString := 'F'
  else
     cdsFazendas.FieldByName( AFieldName ).AsString := 'T';
  cdsFazendas.Post;
end;

procedure TSYS_ConfigBackupDataModule.OpenFazendas;
begin
  cdsFazendas.Close;
  cdsFazendas.Open;
end;

procedure TSYS_ConfigBackupDataModule.SetCustomProfile(const Value: String);
begin
  FCustomProfile := Value;
end;

procedure TSYS_ConfigBackupDataModule.SQLDB_DOMAINSBeforeConnect(
  Sender: TObject);
begin
  {$IFDEF _BACKUP_MODULE}
   DatabaseCfgFactory.Profile := FCustomProfile ;
  {$ENDIF _BACKUP_MODULE}

   with SQLDB_DOMAINS,Params do
     begin
      DriverName := 'Firebird250' ;
      TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
      Values[ 'Database'      ] := DatabaseCfgFactory.Path[ dbFederation ] ; // usar conexao atual
     end
end;

end.
