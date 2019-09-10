unit USYS_BackupDatamodule;

interface

uses
  WinApi.Windows, System.SysUtils, System.Classes, System.WideStrings, DBXFirebird, Tc.DBRTL.AbstractDB,
  Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Data.FMTBcd, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Tc.DBRTL.AbstractDB.DBX, Tc.RTL.Folders, Tc.RTL.Exceptions, Tc.JVCL.Compressor,
  ShellApi, VCL.Dialogs, ClAg5.DatabaseIntf, ClAg5.Common.BackupRestore;

type
  TBackupModuleType = ( bmZootecnico, bmFinanceiro ) ;

  TBackupModuleTypeHelper = record helper for TBackupModuleType
    function Sufix : string ;
    function DBType : TDBType ;
  end;

  TBackupModuleTypes = set of TBackupModuleType ;

  TLog = procedure ( ALog : string ) of object ;
  TCompressStatus = procedure ( const Value, MaxValue: Int64 ) of object ;

  TSYS_BackupDatamodule = class(TDataModule)
    SQLDB_DOMAINS: TSQLConnection;
    AbstractDBDomains: TTcadb_DBX;
    cdsFazendas: TClientDataSet;
    cdsFazendasKSYSDOMAIN: TStringField;
    cdsFazendasDOMAIN_CODE: TStringField;
    cdsFazendasDOMAIN_NAME: TStringField;
    cdsFazendasDOMAIN_ALIAS: TStringField;
    sqlFazendas: TTcSQLDataSet;
    sqlFazendasKSYSDOMAIN: TStringField;
    sqlFazendasDOMAIN_CODE: TStringField;
    sqlFazendasDOMAIN_NAME: TStringField;
    sqlFazendasDOMAIN_ALIAS: TStringField;
    dspFazendas: TDataSetProvider;
    SQLDB_DATA: TSQLConnection;
    sqlJNL: TTcSQLDataSet;
    sqlJNLJNLTRANSACTION_SEQUENCE: TIntegerField;
    sqlJNLJNLTRANSACTION: TIntegerField;
    sqlJNLJNLSTART: TSQLTimeStampField;
    sqlJNLJNLEND: TSQLTimeStampField;
    sqlJNLJNLUSERNAME: TStringField;
    cdsFazendasCHECKED: TStringField;
    sqlJNLJNLSEQUENCE: TIntegerField;
    sqlJNLJNLSXML: TStringField;
    sqlJNLJNLLXML: TMemoField;
    cdsFazendasCHECKED_COUNT: TAggregateField;
    cdsFazendasCHECKED_INT: TSmallintField;
    AbstractDBEntidades: TTcadb_DBX;
    SQLDB_ENTIDADES: TSQLConnection;
    procedure SQLDB_DOMAINSBeforeConnect(Sender: TObject);
    procedure SQLDB_DOMAINSAfterConnect(Sender: TObject);
    procedure SQLDB_DATABeforeConnect(Sender: TObject);
    procedure cdsFazendasCalcFields(DataSet: TDataSet);
    procedure cdsFazendasCHECKEDGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure SQLDB_ENTIDADESBeforeConnect(Sender: TObject);
  const
      _7z = '7z.dll' ;
  private
    { Private declarations }
    FCustomProfile: String;
    FIDatabaseCfg : IDatabaseCfg ;
    FFirebirdSysUtils : IFirebirdSysUtils ;
    FBackupDate : TDateTime ;
    FBackupDateString : string ;
    FSelectedDomain : Integer ;
    FDomainTempFolder : ITcTempFolder ;
    FBasePath : string ;
    FBackupPath : string ;
    FAllFarms : boolean ;
    FLog: TLog;
    FBackupModuleTypes : TBackupModuleTypes ;
    FExportedEntities : TStringList ;
//    FFBClientPath : string ;
    FCompressStatus: TCompressStatus;
    procedure BackupDomains  ;
    procedure BackupDomain( ADomain : integer ) ;
    procedure Backup ( ABackupModule : TBackupModuleType ) ;
    procedure ExportJournaling ( ACompressorEngine : ICompressorEngine ) ;
    procedure ExportTable ( ATableName : string );
    procedure ExportEntidades ;
    procedure SetLog(const Value: TLog);
    procedure DoLog ( ALog : string ) ;
    procedure SetAllFarms(const Value: boolean);
    procedure DoCompressStatus (Sender: TObject; const Value, MaxValue: Int64) ;
    procedure SetCompressStatus(const Value: TCompressStatus);
    procedure SetCustomProfile(const Value: String);
  public
    { Public declarations }
    procedure OpenFazendas ;
    procedure ExecuteBackup ( APath : string ; ABackupModuleTypes : TBackupModuleTypes ) ;
    procedure InvertSelection ;
    procedure InvertAllSelections ;
    property AllFarms : boolean read FAllFarms write SetAllFarms ;
    property Log : TLog  read FLog write SetLog;
    property CompressStatus : TCompressStatus  read FCompressStatus write SetCompressStatus;
    property CustomProfile: String read FCustomProfile write SetCustomProfile;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

{$R *.dfm}

uses
  DBXFirebirdSuppl,
  Data.DBXCommon,
  IniFiles,
//  ClAg5.Common.BackupRestoreAgenda5 ,
  Tc.VCL.Application
     , DataSnap.DSConnect
      ;

{ TrdmSYS_BackupDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TSYS_BackupDatamodule.Create(AOwner: TComponent);
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

  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('SESSION').Connection ) ;

end;
{$ENDIF}



procedure TSYS_BackupDatamodule.cdsFazendasCalcFields(DataSet: TDataSet);
begin
    if ( DataSet.State = dsInternalCalc ) and ( cdsFazendasCHECKED.isNull ) then
      begin
       if cdsFazendasKSYSDOMAIN.asString = Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID then
         begin
           self.cdsFazendasCHECKED.AsInteger     := 1 ;
           self.cdsFazendasCHECKED_INT.AsInteger := 1 ;
         end
       else
         begin
           self.cdsFazendasCHECKED.AsInteger     := 0 ;
           self.cdsFazendasCHECKED_INT.AsInteger := 0 ;
         end ;
      end;
end;

procedure TSYS_BackupDatamodule.cdsFazendasCHECKEDGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if cdsFazendas.IsEmpty then
     exit ;

   if DisplayText then
     begin
        if FAllFarms or ( Sender.asInteger = 1)  then
           Text := 'Sim'
        else
           Text := 'Não'
     end
   else if FAllFarms then
     Text := '1'
   else
     Text := Sender.asString
end;

procedure TSYS_BackupDatamodule.DoLog(ALog: string);
begin
  if Assigned ( FLog ) then
     FLog ( ALog ) ;
end;

procedure TSYS_BackupDatamodule.ExecuteBackup( APath : string  ; ABackupModuleTypes : TBackupModuleTypes ) ;
begin
//   FFBClientPath := 'fb\fbclient.dll' ;
   FBackupModuleTypes := ABackupModuleTypes ;
   FBackupDate   := now ;
   FBackupDateString := FormatDateTime( 'yyyy-mm-dd-hh-nn-ss', FBackupDate ) ;
   FBasePath   := IncludeTrailingPathDelimiter ( APath ) ;
   //FBackupPath := IncludeTrailingPathDelimiter ( APath + 'Sync.' + FBackupDateString + '\Upload' ) ;
   FBackupPath := FBasePath ;


   ForceDirectories ( FBasePath ) ;
   if not DirectoryExists( FBasePath ) then
      raise Error.Create('Não foi possível criar a pasta : ' + FBasePath ) ;

   ForceDirectories ( FBackupPath ) ;
   if not DirectoryExists( FBackupPath ) then
      raise Error.Create('Não foi possível criar a pasta : ' + FBackupPath ) ;


   BackupDomains ;
end;


procedure TSYS_BackupDatamodule.ExportEntidades ;
const
  _TABLE_LIST : array[0..6] of string =
   ( 'CAD_ENTIDADES',
     'CAD_FAZENDAS',
     'CAD_FAZENDA_PARAMETROS',
     'CAD_USUARIOS_FAZENDA',
     'CAD_TIPOS',
     'SYS$USERS',
     'GLB_ENDERECOS'  ) ;
var
  TableName : string ;
begin
  AbstractDBEntidades.Connection.Open  ;

  try
    if Assigned ( FExportedEntities )  then
       FExportedEntities.Clear
    else
       FExportedEntities := TStringList.Create ;

    for TableName in _TABLE_LIST do
       ExportTable ( TableName ) ;

  finally
    AbstractDBEntidades.Connection.Close ;
  end;
end;

procedure TSYS_BackupDatamodule.ExportTable( ATableName : string );
const
  _SQL_STMT = 'SELECT * FROM %s' ;
var
  cds : TClientDataSet ;
  LTargetName : string ;
begin
  cds := nil ;
  AbstractDBEntidades.populateClientDataSet( cds, Format ( _SQL_STMT, [ ATableName ] ) );
  LTargetName := FDomainTempFolder.TempPath + ATableName ;
  cds.SaveToFile( LTargetName, dfXML );
  cds.free ;
  FExportedEntities.Add ( LTargetName )
end;


procedure TSYS_BackupDatamodule.BackupDomain ( ADomain : integer ) ;
var
 FBackupModule : TBackupModuleType ;
begin

  FSelectedDomain       := ADomain ;
  FDomainTempFolder     := TcTempFolderFactory ;
  FIDatabaseCfg         := DatabaseCfgFactory ( True ) ;
  FIDatabaseCfg.Profile := DatabaseCfgFactory.Profile ;
  FIDatabaseCfg.Domain  := Format ( '%.6d', [ ADomain ] ) ;

  FFirebirdSysUtils := FirebirdSysUtilsFactory( FIDatabaseCfg.Path[dbSysUtils] ) ;

  DoLog ( Format ( 'Backup CL-%6.6d', [ FSelectedDomain ] ) ) ;

  ExportEntidades ;

  for FBackupModule in FBackupModuleTypes do
    Backup( FBackupModule ) ;

  FFirebirdSysUtils := nil ;
  FIDatabaseCfg     := nil ;
end;


procedure TSYS_BackupDatamodule.BackupDomains ;
begin

   with cdsFazendas do
     try
       DisableControls ;
       First ;
       while not eof  do
           begin
             if FAllFarms or ( cdsFazendasCHECKED.asInteger = 1 ) then
                BackupDomain( cdsFazendasDOMAIN_CODE.asInteger ) ;
             next ;
           end;
     finally
        EnableControls ;
     end;

end;


procedure TSYS_BackupDatamodule.Backup( ABackupModule : TBackupModuleType ) ;
var
  FileName : string ;
  TargetFileName : string ;
  TempFileName : string ;
  LCompressorEngine : ICompressorEngine ;
  FBBackupName, LLocalBackupName : string ;
  TableName : string ;
  LSourceDB : string ;
  LIsLocalDB  : boolean ;
begin
  FileName := Format ( 'CLAG5.%6.6d.%s.%s.backup', [ FSelectedDomain, FBackupDateString, ABackupModule.Sufix  ] ) ;
  TargetFileName := FBackupPath + FileName ;

  if DebugHook <> 0  then  //*****-----
     shellExecute ( 0, 'open', PChar ( FDomainTempFolder.TempPath ), nil, nil, SW_SHOW ) ;

  LSourceDB  := FIDatabaseCfg.Path[ ABackupModule.DBType ] ;
  LIsLocalDB := IsLocalHost ( LSourceDB ) ;

  DoLog ( '' ) ;
  DoLog ( LSourceDB ) ;
  DoLog ( '' ) ;


  LLocalBackupName := FDomainTempFolder.TempPath + ExtractFileName ( LSourceDB ) + '.FBK' ;

  if LIsLocalDB then
     FBBackupName := LLocalBackupName
  else
    begin
     FFirebirdSysUtils.ForceDirectories( RemoveHost( FIDatabaseCfg.BackupFolder ) ) ;
     FBBackupName := RemoveHost( FIDatabaseCfg.BackupFolder ) + ExtractFileName ( LSourceDB  ) + '.FBK' ;
    end ;
  (*
  if not TFirebirdBackup.Execute( FFBClientPath, FIDatabaseCfg.Path[ dbFinanceiro ], BackupName, FLog ) then
  begin
       DoLog ( 'abort' ) ;
       Abort ;
  end;
  *)
  TFirebirdBackup.Execute( {FFBClientPath,} LSourceDB, FBBackupName, FLog ) ;

  if not LIsLocalDB then
    begin
     FFirebirdSysUtils.CopyFromServer( FBBackupName, LLocalBackupName ) ;
     FFirebirdSysUtils.DeleteFromServer ( FBBackupName  ) ;
    end;

  TempFileName   := FDomainTempFolder.TempPath + FileName ;
  LCompressorEngine := Tc.JVCL.Compressor.CompressorEngineFactory ;
  LCompressorEngine.CreateArchive( TargetFileName ) ;
  LCompressorEngine.OnProgress := DoCompressStatus ;
  LCompressorEngine.CompressionLevel := 3 ;

  for TableName in  FExportedEntities do
  begin
       DoLog ( 'add : ' + TableName ) ;
       LCompressorEngine.AddFile( TableName  ) ;
  end;

  LCompressorEngine.AddFile( LLocalBackupName ) ;

  DoLog ( 'export jnl' ) ;
  ExportJournaling ( LCompressorEngine ) ;

  DoLog ( 'compressing...' ) ;
  LCompressorEngine.Compress ;

  if not LIsLocalDB then
    begin
      FFirebirdSysUtils
        .CopyToServer (
            TargetFileName
         ,  ExtractFilePath ( FBBackupName )
          + ExtractFileName ( TargetFileName )
      ) ;
    end;

end;

procedure TSYS_BackupDatamodule.ExportJournaling ( ACompressorEngine : ICompressorEngine ) ;

  function IterateRecord : boolean ;
  var
    FileName : string ;
  begin
    Result := not sqlJNL.Eof ;

    if not Result then
       exit ;

    DoLog ( Format ( 'exportando transaçao : %d', [ sqlJNLJNLSEQUENCE.asInteger ] ) ) ;

    FileName := Format ( '%s%s%15.15d.jnl.xml', [ FDomainTempFolder.TempPath, ExtractFileName ( FIDatabaseCfg.Path[ dbJournaling ] ), sqlJNLJNLSEQUENCE.asInteger ] ) ;
    if not sqlJNLJNLLXML.isNull then
      begin
        sqlJNLJNLLXML.SaveToFile( FileName ) ;
        ACompressorEngine.AddFile( FileName  ) ;
      end
    else if ( sqlJNLJNLSXML.asString <> '' ) then
        with TStringStream.Create ( sqlJNLJNLSXML.AsString ) do
          try
            SaveToFile ( FileName ) ;
            ACompressorEngine.AddFile( FileName  ) ;
          finally
            Free ;
          end;
    sqlJNL.next;
  end;

begin
exit ; //++KIQ need review...
  try
  SQLDB_DATA.Open ;
  sqlJNL.Open ;
  Repeat Until not IterateRecord ;
  sqlJNL.Close ;
  SQLDB_DATA.Close ;
  except On E : Exception do
     //DoLog ( E.Message ) ;
     ShowMessage ( E.Message ) ;
  end ;
end;

procedure TSYS_BackupDatamodule.DoCompressStatus(Sender: TObject;
  const Value, MaxValue: Int64);
begin
   if Assigned ( FCompressStatus  )  then
      FCompressStatus( Value, MaxValue ) ;
end;

procedure TSYS_BackupDatamodule.InvertAllSelections;
var
   LBookmark : TBytes ;
begin
  with cdsFazendas do
    begin
      DisableControls ;
      LBookMark := Bookmark ;
      First ;
      while not eof do
        begin
          InvertSelection ;
          next ;
        end;
      Bookmark := LBookMark ;
      EnableControls ;
    end;
end;

procedure TSYS_BackupDatamodule.InvertSelection;
begin
  cdsFazendas.Edit ;
  if cdsFazendasCHECKED.asInteger = 0 then
    begin
     cdsFazendasCHECKED.asInteger := 1 ;
     cdsFazendasCHECKED_INT.asInteger := 1
    end
  else
    begin
     cdsFazendasCHECKED.asInteger := 0 ;
     cdsFazendasCHECKED_INT.asInteger := 0
    end;
  cdsFazendas.Post ;

  FAllFarms := cdsFazendas.RecordCount = ( cdsFazendasCHECKED_COUNT.Value )
end;

procedure TSYS_BackupDatamodule.OpenFazendas;
begin
   cdsFazendas.Open ;
end;


procedure TSYS_BackupDatamodule.SQLDB_DOMAINSAfterConnect(Sender: TObject);
begin
  SQLDB_DOMAINS.ExecuteDirect ( 'EXECUTE PROCEDURE GETUSERS' ) ;
end;

procedure TSYS_BackupDatamodule.SQLDB_DOMAINSBeforeConnect(Sender: TObject);
begin
   // 'TC-NBDV71/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\Client\CLAG5.DB'

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



procedure TSYS_BackupDatamodule.SQLDB_ENTIDADESBeforeConnect(Sender: TObject);
begin
   // 'TC-NBDV71/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\Client\CL-%s\DB\CLAG5.%s.ENT'
   with SQLDB_Entidades,Params do
     begin
       DriverName := 'Firebird250' ;
       TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
       Values[ 'Database'      ] := FIDatabaseCfg.Path[ dbEntidades ] ;
     end ;
end;


procedure TSYS_BackupDatamodule.SetAllFarms(const Value: boolean);
begin
  if Value <> FAllFarms then
    FAllFarms := Value;
end;

procedure TSYS_BackupDatamodule.SetCompressStatus(const Value: TCompressStatus);
begin
  FCompressStatus := Value;
end;

procedure TSYS_BackupDatamodule.SetCustomProfile(const Value: String);
begin
  FCustomProfile := Value;
end;

procedure TSYS_BackupDatamodule.SetLog(const Value: TLog);
begin
  FLog := Value;
end;

procedure TSYS_BackupDatamodule.SQLDB_DATABeforeConnect(Sender: TObject);
begin
   // 'TC-NBDV71/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\Client\CL-%s\DB\CLAG5.%s.ENT'
   with SQLDB_DATA,Params do
     begin
       DriverName := 'Firebird250' ;
       TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
       Values[ 'Database'      ] := FIDatabaseCfg.Path[ dbJournaling ] ;
     end ;

end;


{ TBackupModuleTypeHelper }

function TBackupModuleTypeHelper.DBType: TDBType;
begin
   case self of
     bmZootecnico : result := dbZootecnico ;
     bmFinanceiro : result := dbFinanceiro ;
   end;
end;

function TBackupModuleTypeHelper.Sufix: string;
begin
   case self of
     bmZootecnico : result := 'ZOO' ;
     bmFinanceiro : result := 'FIN' ;
   end;
end;


end.


