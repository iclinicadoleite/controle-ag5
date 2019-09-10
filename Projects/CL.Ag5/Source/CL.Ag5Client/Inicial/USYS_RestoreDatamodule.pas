unit USYS_RestoreDatamodule;

interface

uses
  System.SysUtils, System.Classes,
  Tc.DBRTL.AbstractDB.DBX, Tc.RTL.Folders, Tc.RTL.Exceptions, Tc.JVCL.Compressor,
  ClAg5.DatabaseIntf, System.WideStrings, DBXFirebird, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider,
  Tc.DBRTL.AbstractDB, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Dialogs ;

type

  TBackupModuleType = ( bmFull, bmZootecnico, bmFinanceiro ) ;

  TLog = procedure ( ALog : string ) of object ;
  TCompressStatus = procedure ( const Value, MaxValue: Int64 ) of object ;

  TSYS_RestoreDatamodule = class(TDataModule)
    AbstractDBEntidades: TTcadb_DBX;
    SQLDB_ENTIDADES: TSQLConnection;
    SQLDB_DOMAINS: TSQLConnection;
    AbstractDBDomains: TTcadb_DBX;
    procedure SQLDB_ENTIDADESBeforeConnect(Sender: TObject);
    procedure SQLDB_DOMAINSBeforeConnect(Sender: TObject);
  private
  const
      _7z = '7z.dll' ;
  private
    { Private declarations }
    FIDatabaseCfg : IDatabaseCfg ;
    FSelectedDomain : Integer ;
    FDomainTempFolder : ITcTempFolder ;
    FBackupFileName : string ;
    FLogBackup: TLog;
    FLogRestore: TLog;
    FBackupModuleType : TBackupModuleType ;
//    FFBClientPath : string ;
    FCompressStatus: TCompressStatus;
    FDeCompressStatus: TCompressStatus;
    procedure InternalRestore;
    procedure RestoreDB ( ADBType : TDBType ) ;
    procedure ImportJournaling  ;
    procedure ImportEntidades ;
    procedure SetLogBackup(const Value: TLog);
    procedure SetLogRestore(const Value: TLog);
    procedure DoLogBackup ( ALog : string ) ;
    procedure DoLogRestore ( ALog : string ) ;
    procedure CreateRestorePoint ;
    procedure UnCompress ;
    procedure DoDeCompressProcess ( Sender : TObject ; const Value, MaxValue: Int64) ;
    procedure DoCompressStatus (const Value, MaxValue: Int64) ;
    procedure DoDeCompressStatus (const Value, MaxValue: Int64) ;
    procedure SetCompressStatus(const Value: TCompressStatus);
    procedure SetDeCompressStatus(const Value: TCompressStatus);
    procedure UpdateCodigosEntidade;
  public
    { Public declarations }
    procedure RestoreBackup ( ABackupFileName : string ) ;
    property LogBackup  : TLog  read FLogBackup write SetLogBackup;
    property LogRestore : TLog  read FLogRestore write SetLogRestore;
    property CompressStatus : TCompressStatus  read FCompressStatus write SetCompressStatus;
    property DeCompressStatus : TCompressStatus  read FDeCompressStatus write SetDeCompressStatus;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

{$R *.dfm}

uses
    DBXFirebirdSuppl
  , IniFiles
  , ClAg5.Common.RestorePoint
  , ClAg5.Common.BackupRestore
  , WinApi.Windows
  , ShellAPI
  , Tc.VCL.Application
  , CLAg5.CompareDataFromClientDataSet
  , DataSnap.DSConnect
  ;



{ TrdmSYS_RestoreDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TSYS_RestoreDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('SESSION').Connection ) ;
end;
{$ENDIF}


procedure TSYS_RestoreDatamodule.CreateRestorePoint;
var
  RestorePoint : ICreateRestorePoint ;
begin

   RestorePoint := CreateRestorePointFactory ;
   RestorePoint.Log            := LogBackup ;
   RestorePoint.CompressStatus := DoCompressStatus ;
   RestorePoint.DBProfile      := DatabaseCfgFactory.Profile ;
   RestorePoint.DomainCode     := DatabaseCfgFactory.Domain ;
   RestorePoint.Execute ;

end;

procedure TSYS_RestoreDatamodule.DoCompressStatus(const Value,
  MaxValue: Int64);
begin
   if Assigned ( FCompressStatus  )  then
      FCompressStatus( Value, MaxValue ) ;
end;

procedure TSYS_RestoreDatamodule.DoDeCompressStatus(const Value,
  MaxValue: Int64);
begin
   if Assigned ( FDeCompressStatus  )  then
      FDeCompressStatus( Value, MaxValue ) ;
end;

procedure TSYS_RestoreDatamodule.DoLogBackup(ALog: string);
begin
  if Assigned ( FLogBackup ) then
     FLogBackup ( ALog ) ;
end;

procedure TSYS_RestoreDatamodule.DoLogRestore(ALog: string);
begin
  if Assigned ( FLogRestore ) then
     FLogRestore ( ALog ) ;
end;

procedure TSYS_RestoreDatamodule.DoDeCompressProcess(Sender: TObject; const Value,
  MaxValue: Int64);
begin
   if Assigned ( FDeCompressStatus  )  then
      FDeCompressStatus( Value, MaxValue ) ;
end;

procedure TSYS_RestoreDatamodule.RestoreBackup( ABackupFileName : string ) ;
var
  DBSession, DBEntidades, DBZootecnico, DBFinanceiro : ITcAbstractDB ;
  IsDBSessionConnected, IsDBEntidadesConnected, IsDBZootecnicoConnected, IsDBFinanceiroConnected : boolean ;
begin
//  FFBClientPath := 'fb\fbclient.dll' ;

  FBackupFileName := ABackupFileName ;

  DBSession    := Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias( 'SESSION' ) ;
  DBEntidades  := Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias( 'ENTIDADES' ) ;
  DBZootecnico := Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias( 'ZOOTECNICO' ) ;
  DBFinanceiro := Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias( 'FINANCEIRO' ) ;

  IsDBSessionConnected    := Assigned ( DBSession     ) and DBSession.Connection.Connected     ;
  IsDBEntidadesConnected  := Assigned ( DBEntidades   ) and DBEntidades.Connection.Connected   ;
  IsDBZootecnicoConnected := Assigned ( DBZootecnico  ) and DBZootecnico.Connection.Connected  ;
  ISDBFinanceiroConnected := Assigned ( DBFinanceiro  ) and DBFinanceiro.Connection.Connected  ;

  if IsDBSessionConnected    then
    DBSession.Connection.Close ;
  if IsDBEntidadesConnected  then
    DBEntidades.Connection.Close ;
  if IsDBZootecnicoConnected then
    DBZootecnico.Connection.Close ;
  if ISDBFinanceiroConnected then
    DBFinanceiro.Connection.Close ;

   CreateRestorePoint;
   InternalRestore ;

  if IsDBSessionConnected    then
    DBSession.Connection.Open ;
  if IsDBEntidadesConnected  then
    DBEntidades.Connection.Open ;
  if IsDBZootecnicoConnected then
    DBZootecnico.Connection.Open ;
  if ISDBFinanceiroConnected then
    DBFinanceiro.Connection.Open ;

end;

procedure TSYS_RestoreDatamodule.UpdateCodigosEntidade;
const

   _UPDATE_CAD_CLIENTE =
        'EXECUTE BLOCK'
  +#13#10'AS'
  +#13#10'DECLARE KCAD_ENTIDADE SYS$FKGUID20 ;'
  +#13#10'DECLARE CODIGO SYS$CODE ;'
  +#13#10'BEGIN'
  +#13#10'  EXECUTE PROCEDURE SYS$SET_SEQUENCE %s, ''CAD_ENTIDADE_CLIENTE'', 0 ;'
  +#13#10''
  +#13#10'  FOR'
  +#13#10'   SELECT'
  +#13#10'        KCAD_ENTIDADE'
  +#13#10'   FROM CAD_ENTIDADES'
  +#13#10'   WHERE IS_CLIENTE = ''T'''
  +#13#10'    AND CHAR_LENGTH(CODIGO) = 6'
  +#13#10'   ORDER BY SYS$DI'
  +#13#10'  INTO KCAD_ENTIDADE DO'
  +#13#10'    BEGIN'
  +#13#10''
  +#13#10'       SELECT Right ( ''000000'' || SEQUENCE_VALUE, 6 )'
  +#13#10'       FROM  SYS$GET_SEQUENCE( %s, ''CAD_ENTIDADE_CLIENTE''  )'
  +#13#10'       INTO CODIGO ;'
  +#13#10''
  +#13#10'       UPDATE CAD_ENTIDADES'
  +#13#10'       SET'
  +#13#10'          CODIGO = :CODIGO'
  +#13#10'       WHERE KCAD_ENTIDADE = :KCAD_ENTIDADE ;'
  +#13#10'    END'
  +#13#10''
  +#13#10'END' ;

   _UPDATE_CAD_FORNECEDOR =
         'EXECUTE BLOCK'
  +#13#10'AS'
  +#13#10'DECLARE KCAD_ENTIDADE SYS$FKGUID20 ;'
  +#13#10'DECLARE CODIGO SYS$CODE ;'
  +#13#10'BEGIN'
  +#13#10'   EXECUTE PROCEDURE SYS$SET_SEQUENCE %s, ''CAD_ENTIDADE_FORNECEDOR'', 0 ;'
  +#13#10''
  +#13#10'  FOR'
  +#13#10'   SELECT'
  +#13#10'        KCAD_ENTIDADE'
  +#13#10'   FROM CAD_ENTIDADES'
  +#13#10'   WHERE IS_FORNECEDOR = ''T'''
  +#13#10'    AND CHAR_LENGTH(CODIGO) = 6'
  +#13#10'   ORDER BY SYS$DI'
  +#13#10'  INTO KCAD_ENTIDADE DO'
  +#13#10'    BEGIN'
  +#13#10''
  +#13#10'       SELECT Right ( ''000000'' || SEQUENCE_VALUE, 6 )'
  +#13#10'       FROM  SYS$GET_SEQUENCE( %s, ''CAD_ENTIDADE_FORNECEDOR''  )'
  +#13#10'       INTO CODIGO ;'
  +#13#10''
  +#13#10'       UPDATE CAD_ENTIDADES'
  +#13#10'       SET'
  +#13#10'          CODIGO = :CODIGO'
  +#13#10'       WHERE KCAD_ENTIDADE = :KCAD_ENTIDADE ;'
  +#13#10'    END'
  +#13#10''
  +#13#10'END' ;

  _EXISTS_CLIENTE_DUP =
         'SELECT'
  +#13#10'  CODIGO,'
  +#13#10'  COUNT(*)'
  +#13#10'FROM CAD_ENTIDADES'
  +#13#10'WHERE IS_CLIENTE = ''T'''
  +#13#10'  AND CHAR_LENGTH(CODIGO) = 6'
  +#13#10'GROUP BY 1'
  +#13#10'HAVING COUNT(*) > 1'
  +#13#10'ROWS 1' ;

  _EXISTS_FORNECEDOR_DUP =
         'SELECT'
  +#13#10'  CODIGO,'
  +#13#10'  COUNT(*)'
  +#13#10'FROM CAD_ENTIDADES'
  +#13#10'WHERE IS_FORNECEDOR = ''T'''
  +#13#10'  AND CHAR_LENGTH(CODIGO) = 6'
  +#13#10'GROUP BY 1'
  +#13#10'HAVING COUNT(*) > 1'
  +#13#10'ROWS 1' ;

var
   CDS : TCLientdataSet ;
   LNeedUpdate : boolean ;
begin

  DoLogRestore( 'Checando Duplicidade' ) ;

  cds := nil ;
  AbstractDBEntidades.populateClientDataSet ( cds,  _EXISTS_CLIENTE_DUP ) ;
  LNeedUpdate := not cds.IsEmpty ;

  if LNeedUpdate then
   begin
     DoLogRestore( 'Checando Duplicidade - Clientes' ) ;
     AbstractDBEntidades.ExecuteDirect ( Format ( _UPDATE_CAD_CLIENTE,    [ QuotedStr ( LoggedUser.DomainID ), QuotedStr ( LoggedUser.DomainID ) ] ) ) ;
   end ;

  AbstractDBEntidades.populateClientDataSet ( cds,  _EXISTS_FORNECEDOR_DUP ) ;
  LNeedUpdate := not cds.IsEmpty ;

  if LNeedUpdate then
   begin
     DoLogRestore( 'Checando Duplicidade - Fornecedores' ) ;
     AbstractDBEntidades.ExecuteDirect ( Format ( _UPDATE_CAD_FORNECEDOR,  [ QuotedStr ( LoggedUser.DomainID ), QuotedStr ( LoggedUser.DomainID ) ] ) ) ;
   end ;

  cds.Free ;

end;


procedure TSYS_RestoreDatamodule.ImportEntidades ;
const
  _TABLE_LIST : array[0..6] of string =
   (
     'SYS$USERS',
     'CAD_ENTIDADES',
     'CAD_FAZENDAS',
     'CAD_FAZENDA_PARAMETROS',
     'CAD_USUARIOS_FAZENDA',
     'CAD_TIPOS',
     'GLB_ENDERECOS') ;
var
  TableName : string ;
begin


  AbstractDBEntidades.Connection.Open  ;
try
  try

    for TableName in _TABLE_LIST do
       With CLAg5.CompareDataFromClientDataSet.TCompareDataFromClientDataSet.Create do
         try
            Log := self.LogRestore ;
            DoLogRestore ( 'Importando : ' + TableName ) ;
            UpdateTables ( FDomainTempFolder.TempPath, TableName ) ;
         finally ;
            Free ;
         end ;

    UpdateCodigosEntidade ;

  finally
    AbstractDBEntidades.Connection.Close ;
  end;

except On E : Exception do
  ShowMessage ( E.Message ) ;
end;
end;


procedure TSYS_RestoreDatamodule.InternalRestore ;
begin

  FSelectedDomain       := StrToInt ( DatabaseCfgFactory.Domain ) ;
  FDomainTempFolder     := TcTempFolderFactory ;
  FIDatabaseCfg         := DatabaseCfgFactory ( True ) ;
  FIDatabaseCfg.Profile := DatabaseCfgFactory.Profile ;
  FIDatabaseCfg.Domain  := DatabaseCfgFactory.Domain;

  DoLogRestore ( Format ( 'Restore - CL-%6.6d', [ FSelectedDomain ] ) ) ;

  if Pos ( '.ZOO.', FBackupFileName ) <> 0  then
     FBackupModuleType := bmZootecnico
  else if Pos ( '.FIN.', FBackupFileName ) <> 0  then
     FBackupModuleType := bmFinanceiro
  else
     Raise Tc.RTL.Exceptions.Error.Create ( 'arquivo de backup inválido'  ) ;

  UnCompress ;

  if FBackupModuleType = bmFinanceiro then
    RestoreDB ( dbFinanceiro ) ;
  if FBackupModuleType = bmZootecnico then
    RestoreDB ( dbZootecnico ) ;
  ImportEntidades ;

  FIDatabaseCfg     := nil ;
  FDomainTempFolder := nil ;

end;




procedure TSYS_RestoreDatamodule.RestoreDB ( ADBType : TDBType );
var
  LTargetFileName : string ;
  LBackupFileName : string ;
begin

  LTargetFileName := DatabaseCfgFactory.Path[ ADBType ] ;

//  if Pos ( ':',  LTargetFileName ) > 2 then
//     LTargetFileName := Copy ( LTargetFileName, Pos ( ':',  LTargetFileName ) + 1,  LTargetFileName.Length ) ;

  LBackupFileName := FDomainTempFolder.TempPath + ExtractFileName ( LTargetFileName ) + '.FBK' ;

  if not TFirebirdRestore.Execute( {FFBClientPath, }LBackupFileName, LTargetFileName, FLogRestore ) then
    Raise Tc.RTL.Exceptions.Error.Create( 'Restore Error' ) ;

  ImportJournaling  ;

end;
(*
procedure TSYS_RestoreDatamodule.RestoreZootecnico;
var
  LTargetFileName : string ;
  LBackupFileName : string ;
begin

  LTargetFileName := DatabaseCfgFactory.Path[ dbZootecnico ] ;

  if Pos ( ':',  LTargetFileName ) > 2 then
     LTargetFileName := Copy ( LTargetFileName, Pos ( ':',  LTargetFileName ) + 1,  LTargetFileName.Length ) ;

  LBackupFileName := FDomainTempFolder.TempPath + ExtractFileName ( LTargetFileName ) + '.FBK' ;

  if not TFirebirdRestore.Execute( {FFBClientPath, }LBackupFileName, LTargetFileName, FLogRestore ) then
    Raise Tc.RTL.Exceptions.Error.Create( 'Restore Erro' ) ;

  ImportJournaling  ;

end;
*)

procedure TSYS_RestoreDatamodule.ImportJournaling ;
begin
(*
  function IterateRecord : boolean ;
  var
    FileName : string ;
  begin
    Result := not sqlJNL.Eof ;

    if not Result then
       exit ;

    DoLog ( Format ( 'exportando transaçao : %d', [ sqlJNLJNLSEQUENCE.asInteger ] ) ) ;

    FileName := Format ( '%s%s%15.15d.jnl.xml', [ FDomainTempFolder.TempPath, ExtractFileName ( FIDatabaseCfg.Path_JNL ), sqlJNLJNLSEQUENCE.asInteger ] ) ;
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
  try
    SQLDB_DATA.Open ;
    sqlJNL.Open ;
    Repeat Until not IterateRecord ;
    sqlJNL.Close ;
    SQLDB_DATA.Close ;
  except On E : Exception do
     DoLog ( E.Message ) ;
  end ;

  *)
end;


procedure TSYS_RestoreDatamodule.SetCompressStatus(
  const Value: TCompressStatus);
begin
  FCompressStatus := Value;
end;

procedure TSYS_RestoreDatamodule.SetDeCompressStatus(
  const Value: TCompressStatus);
begin
  FDeCompressStatus := Value;
end;

procedure TSYS_RestoreDatamodule.SetLogBackup(const Value: TLog);
begin
  FLogBackup := Value;
end;

procedure TSYS_RestoreDatamodule.SetLogRestore(const Value: TLog);
begin
  FLogRestore := Value;
end;


procedure TSYS_RestoreDatamodule.SQLDB_DOMAINSBeforeConnect(Sender: TObject);
begin
   // 'TC-NBDV71/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\Client\CLAG5.DB'

   with SQLDB_DOMAINS,Params do
     begin
       DriverName := 'Firebird250' ;
       TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
       Values[ 'Database'      ] := DatabaseCfgFactory.Path[ dbFederation ] ;
      //kiq exf
      //raise Exception.Create('Error Message - REVISAR UExportDatamodule');
      //Values[ 'Database' ] := FederationPathFactory( '' ).Path_Federation ;
     end
end;

procedure TSYS_RestoreDatamodule.SQLDB_ENTIDADESBeforeConnect(Sender: TObject);
begin
   // 'TC-NBDV71/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\Client\CL-%s\DB\CLAG5.%s.ENT'
   with SQLDB_Entidades,Params do
     begin
       DriverName := 'Firebird250' ;
       TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
       Values[ 'Database'      ] := DatabaseCfgFactory.Path[ dbEntidades ] ;
     end ;
end;

procedure TSYS_RestoreDatamodule.UnCompress;
var
  LCompressorEngine : ICompressorEngine ;
begin
  LCompressorEngine := Tc.JVCL.Compressor.CompressorEngineFactory ;
  LCompressorEngine.OpenArchive( FBackupFileName ) ;
  LCompressorEngine.TargetFolder := FDomainTempFolder.FolderName ;
  LCompressorEngine.OnProgress   := DoDeCompressProcess ; { InternalCompressStatus } ;
  LCompressorEngine.ExtractAll ;
end;


end.
