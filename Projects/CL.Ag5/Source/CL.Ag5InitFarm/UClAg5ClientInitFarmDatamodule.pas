unit UClAg5ClientInitFarmDatamodule;

interface

uses

   System.SysUtils, System.Classes, System.WideStrings,
   Data.DBXCommon, Data.DBXFirebird,
   Data.SqlExpr,  Tc.RTL.Folders,
   CLAG5.DatabaseIntf, IPPeerClient,
   Tc.DBRTL.AbstractDB,
   Tc.DBRTL.AbstractDB.DBX, Data.DB, Data.DBXDataSnap ;

type

  TLog = procedure ( AMsg : string ) of object ;

  TClAg5ClientInitFarmDatamodule = class(TDataModule)
    SQLDB: TSQLConnection;
    ADB: TTcadb_DBX;
    SQLConnection1: TSQLConnection;
  private
    { Private declarations }
    FDomainID : string ;
    FDomainCode   : string ;
    FDomainName   : string ;
    FIDatabaseCfg   : IDomainPath ;
    FTempFolder : ITcTempFolder ;
    FLog: TLog;
    procedure BackupRestoreLog ( ALog : string ) ;
    procedure ExtractMetaData ;
    procedure InitDBSession ;
    procedure InitDBEntidades ;
    procedure InitDBZootecnico ;
    procedure InitDBFinanceiro ;
    procedure InitDBAnexos ;
    procedure InitDB ;
    procedure OpenDataBase ( ADBPath : string ) ;
    procedure SetLog(const Value: TLog);
    procedure DoLog ( AMsg : string ) ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    property Log : TLog  read FLog write SetLog;
    procedure CreateFarmBase ( AProfile : string ; ADomainCode: string ; ADomainName : string ) ;
    destructor Destroy  ; override ;
  end;

implementation

uses
     DBXFirebirdSuppl,
     WinApi.Windows,
     Tc.RTL.MD5, SQLSuppl,
     Tc.RTL.Files.Scan,
     GuidSuppl, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
//     ClAg5.Common.BackupRestoreAgenda5,
     ClAg5.Common.BackupRestore,
     Tc.JVCL.Compressor,
     Masks
     , DataSnap.DSConnect
     , UDBSession.Update
     , UDBEntidades.Update
     , UDBZootecnico.Update
     , UDBFinanceiro.Update
     , UDBAnexos.Update
     ;

{$R *.dfm}


{ TrdmClAg5ClientInitFarmDatamodule }

{ TClAg5ClientInitFarmDatamodule }

constructor TClAg5ClientInitFarmDatamodule.Create(AOwner: TComponent );
begin
  inherited;
  FTempFolder := TcTempFolderFactory ;
end;


procedure TClAg5ClientInitFarmDatamodule.CreateFarmBase( AProfile : string ; ADomainCode: string ;
  ADomainName: string);
begin
   FDomainCode := ADomainCode ;
   FDomainName := ADomainName ;
   FIDatabaseCfg := DatabaseCfgFactory ( True ) ;
   FIDatabaseCfg.Profile := AProfile ;
   FIDatabaseCfg.Domain  := FDomainCode ;


   if   FileExists ( RemoveHost ( FIDatabaseCfg.Path[ dbEntidades ] ) )
    and FileExists ( RemoveHost ( FIDatabaseCfg.Path[ dbZootecnico ] ) )
    and FileExists ( RemoveHost ( FIDatabaseCfg.Path[ dbFinanceiro ] ) )
    and FileExists ( RemoveHost ( FIDatabaseCfg.Path[ dbAttachments ] ) )
    and FileExists ( RemoveHost ( FIDatabaseCfg.Path[ dbJournaling ] ) ) then
       exit ;


   FDomainID := String ( GuidSuppl.GuidToStr20 ( Tc.RTL.MD5.MD5StringToGUID ( Format ( 'CL-%s', [ FDomainCode ] ) ) ) ) ;

   DoLog ( 'Extract MetaData') ;
   ExtractMetaData ;
//   ShowMessage ( 'INIT' ) ;
   DoLog ( 'Inicializando dominio'    ) ; InitDBSession ;
   DoLog ( 'Inicializando entidades'  ) ; InitDBEntidades ;
   DoLog ( 'Inicializando zootecnico' ) ; InitDBZootecnico ;
   DoLog ( 'Inicializando financeiro' ) ; InitDBFinanceiro ;
   DoLog ( 'Inicializando anexos'     ) ; InitDBAnexos ;
   DoLog ( 'InitDef'                  ) ; InitDB    ;

end;

destructor TClAg5ClientInitFarmDatamodule.Destroy;
begin
  inherited;
end;


procedure TClAg5ClientInitFarmDatamodule.DoLog(AMsg: string);
begin
  if Assigned ( FLog ) then
     FLog ( AMsg ) ;
end;

//const
//  _FBCLIENT = 'fb\fbclient.dll' ;



procedure TClAg5ClientInitFarmDatamodule.ExtractMetaData;
var
  FileNAme : string ;
  Decompress : ICompressorEngine ;
  x : integer ;

  function CheckPackedName ( APackedName : string ; ANames : Array of String ) : boolean ;
  var
    x : integer ;
  begin
    Result := False ;
    for x := Low( ANames ) To  High ( ANames ) do
        begin
          Result := (APackedName = ANames[ x ]) ;
          if Result then
             break ;
        end;
  end ;

begin


  FileName := LocalExtractFilePath  ( ParamStr( 0 ) ) + 'CLAg5.mdt' ;

  Decompress := CompressorEngineFactory ;
  Decompress.OpenArchive ( FileName ) ;
  Decompress.TargetFolder := self.FTempFolder.FolderName ;
  for x := 0 to Decompress.ItemCount - 1 do
      Decompress[ x ].Selected := MatchesMask ( Decompress[ x ].PackedName,  'CLAG5.*' ) ;
  Decompress.ExtractSelected ;

  DoLog ( LocalExtractFilePath ( FIDatabaseCfg.Path[ dbEntidades ] ) ) ;

  ForceDirectories ( LocalExtractFilePath ( FIDatabaseCfg.Path[ dbEntidades ] ) ) ;

//  ForceDirectories ( LocalExtractFilePath ( FIDatabaseCfg.Path[ dbFederation ] ) ) ;
//  TFirebirdRestore.Execute( { _FBCLIENT,  }self.FTempFolder.TempPath + 'CLAG5.DB',  RemoveHost ( FIDatabaseCfg.Path[ dbEntidades ]     )+'.XXX',    BackupRestoreLog ) ;

  if not FileExists ( RemoveHost ( FIDatabaseCfg.Path[ dbEntidades ] ) ) then
    TFirebirdRestore.Execute( { _FBCLIENT,  }self.FTempFolder.TempPath + 'CLAG5.ENT', RemoveHost ( FIDatabaseCfg.Path[ dbEntidades ]     ),  BackupRestoreLog ) ;

  if not FileExists ( RemoveHost ( FIDatabaseCfg.Path[ dbZootecnico ] ) ) then
    TFirebirdRestore.Execute( { _FBCLIENT,  }self.FTempFolder.TempPath + 'CLAG5.ZOO', RemoveHost ( FIDatabaseCfg.Path[ dbZootecnico ]     ),  BackupRestoreLog ) ;

  if not FileExists ( RemoveHost ( FIDatabaseCfg.Path[ dbFinanceiro ] ) ) then
    TFirebirdRestore.Execute( { _FBCLIENT,  }self.FTempFolder.TempPath + 'CLAG5.FIN', RemoveHost ( FIDatabaseCfg.Path[ dbFinanceiro ]     ),  BackupRestoreLog ) ;

  if not FileExists ( RemoveHost ( FIDatabaseCfg.Path[ dbAttachments ] ) ) then
    TFirebirdRestore.Execute( { _FBCLIENT,  }self.FTempFolder.TempPath + 'CLAG5.ATT', RemoveHost ( FIDatabaseCfg.Path[ dbAttachments ]     ),  BackupRestoreLog ) ;

  if not FileExists ( RemoveHost ( FIDatabaseCfg.Path[ dbJournaling ] ) ) then
    TFirebirdRestore.Execute( { _FBCLIENT,  }self.FTempFolder.TempPath + 'CLAG5.JNL', RemoveHost ( FIDatabaseCfg.Path[ dbJournaling ]     ),  BackupRestoreLog ) ;

end;
 {
uses ShellAPI;
Function DelTree(DirName : string): Boolean;
var
  SHFileOpStruct : TSHFileOpStruct;
  DirBuf : array [0..255] of char;
begin
  try
   Fillchar(SHFileOpStruct,Sizeof(SHFileOpStruct),0) ;
   FillChar(DirBuf, Sizeof(DirBuf), 0 ) ;
   StrPCopy(DirBuf, DirName) ;
   with SHFileOpStruct do begin
    Wnd := 0;
    pFrom := @DirBuf;
    wFunc := FO_DELETE;
    fFlags := FOF_ALLOWUNDO;
    fFlags := fFlags or FOF_NOCONFIRMATION;
    fFlags := fFlags or FOF_SILENT;
   end;
   Result := (SHFileOperation(SHFileOpStruct) = 0) ;
   except
    Result := False;
  end;
end;
  }



procedure TClAg5ClientInitFarmDatamodule.InitDB;
begin
  DoLog ( 'Inicializando tabelas de sistema'  ) ;
  OpenDataBase( FIDatabaseCfg.Path[ dbFederation ] ) ;
end;

procedure TClAg5ClientInitFarmDatamodule.InitDBAnexos;
const
  _UPDATE_SYS_VERSION =
   'INSERT INTO SYS$VERSION (SYS$VERSION, SYS$RELEASE, SYS$REVISION) VALUES( %s )' ;
var
  LDBVersion : string ;
begin
  DoLog ( 'Intiliazing : Anexos ' ) ;

  LDBVersion := TDBAnexosUpdate.GetLastVersion.Replace( '.', ',', [rfReplaceAll]  ) ;
  ADB.ExecuteDirect ( Format ( _UPDATE_SYS_VERSION, [ LDBVersion ] ) ) ;
end;



procedure TClAg5ClientInitFarmDatamodule.InitDBEntidades;
const
  _INSERT_SYS_DOMAINS =
          'INSERT INTO SYS$DOMAINS'
   +#13#10'        ( KSYS$DOMAIN, DOMAIN_APP, DOMAIN_CODEPREFIX, DOMAIN_CODE, DOMAIN_CODESUFFIX, DOMAIN_NAME, DOMAIN_ALIAS )'
   +#13#10' VALUES ( :KSYS$DOMAIN, :DOMAIN_APP, :DOMAIN_CODEPREFIX, :DOMAIN_CODE, :DOMAIN_CODESUFFIX, :DOMAIN_NAME, :DOMAIN_ALIAS )' ;

  _INSERT_USER_ADMIN =
          'INSERT INTO SYS$USERS ( KSYS$USER, LOGIN, USERPASSWORD, INACTIVED, TYPEREC )'
   +#13#10'VALUES ( :KSYS$USER, :LOGIN, :USERPASSWORD, :INACTIVED, :TYPEREC )' ;

  _INSERT_CAD_FAZENDA =
          'INSERT INTO CAD_FAZENDAS ( KCAD_FAZENDA, CODIGOCLINICA )'
   +#13#10'VALUES ( :KCAD_FAZENDA, :CODIGOCLINICA )' ;

  _INSERT_CAD_ENTIDADE =
          'INSERT INTO CAD_ENTIDADES( KCAD_ENTIDADE, KSYS$DOMAIN, KCAD_FAZENDA, APELIDO, NOME, ATIVO, PESSOA, IS_CLIENTE, IS_FORNECEDOR, IS_FUNCIONARIO, IS_TRANSPORTADORA )'
   +#13#10'VALUES( :KCAD_ENTIDADE, :KSYS$DOMAIN, :KCAD_FAZENDA, :APELIDO, :NOME, :ATIVO, :PESSOA, :IS_CLIENTE, :IS_FORNECEDOR, :IS_FUNCIONARIO, :IS_TRANSPORTADORA )' ;

   _INSERT_CAD_FAZENDA_PARAMETROS =
          'INSERT INTO CAD_FAZENDA_PARAMETROS (KCAD_FAZENDA, DSA_ESTQ_MACHO, DIAS_PROX_CIOSCOB, DIAS_PROX_TAREFAS, DIAS_PROX_SECAGENS, DIAS_INTERVALO_BST, ESCALA_PRODUCAO, DIAS_PRE_SECAGEM_BST, EXIBIR_PARTOS_SEMCONFIRMACAO, EXCLUIR_TAREFAS_DESCARTE  )'
   +#13#10'VALUES (:KCAD_FAZENDA, :DSA_ESTQ_MACHO, :DIAS_PROX_CIOSCOB, :DIAS_PROX_TAREFAS, :DIAS_PROX_SECAGENS, :DIAS_INTERVALO_BST, :ESCALA_PRODUCAO, :DIAS_PRE_SECAGEM_BST, :EXIBIR_PARTOS_SEMCONFIRMACAO, :EXCLUIR_TAREFAS_DESCARTE  )' ;

   _ADD_UNIDADE =
          'EXECUTE BLOCK'
   +#13#10'AS'
   +#13#10'DECLARE KSYS$DOMAIN SYS$FKGUID20 = %s ;'
   +#13#10'DECLARE DESCRICAO   SYS$DESCR = %s ;'
   +#13#10'BEGIN'
   +#13#10'  IF ( EXISTS(SELECT 1 FROM CAD_TIPOS WHERE TIPO = 2 AND DESCRICAO = :DESCRICAO ROWS 1) ) THEN'
   +#13#10'   UPDATE  CAD_TIPOS'
   +#13#10'     SET   DESCRICAO = :DESCRICAO'
   +#13#10'   WHERE TIPO = 2 AND DESCRICAO = :DESCRICAO ;'
   +#13#10'  ELSE'
   +#13#10'    INSERT INTO CAD_TIPOS (KCAD_TIPOS, KSYS$DOMAIN, KCAD_FAZENDA, TIPO, DESCRICAO, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
   +#13#10'    VALUES (GUID20(), :KSYS$DOMAIN, :KSYS$DOMAIN, 2, :DESCRICAO, ''SYSTEM'', ''01.04.2016'', NULL, NULL) ;'
   +#13#10'END' ;

  _UPDATE_SYS_VERSION =
         'INSERT INTO SYS$VERSION (SYS$VERSION, SYS$RELEASE, SYS$REVISION) VALUES( %s )' ;


var
  LDBVersion : string ;
  CDS : TClientDataSet ;
  p : TParams ;
begin
  CDS := nil ;
  DoLog ( 'Intiliazing : Entidades ' ) ;

  try
    OpenDataBase( FIDatabaseCfg.Path[ dbEntidades ] ) ;

    ADB.populateClientDataSet( CDS, 'FIRST 1 1 FROM SYS$DOMAINS' );

    if CDS.IsEmpty then
      begin
       //DoLog ( 'Initializing SYS$LICENSE' ) ;
       //ADB.ExecuteDirect( Format ( 'INSERT INTO SYS$LICENSE   ( KSYS$LICENSE, SYS$LICENSEDATE,   SYS$TOKEN, SYS$VALIDADE, SYS$LASTSYNC,      SYS$EXPIRESDATE ) ' +
       //                                                        'VALUES ( %s,           CURRENT_TIMESTAMP, NULL,      30,           CURRENT_TIMESTAMP, CURRENT_TIMESTAMP+30)', [ QuotedStr( License ) ] ) ) ;

      p := TParams.Create ;
      p.CreateParam( ftString, 'KSYS$DOMAIN',       ptInput ).AsString :=  FDomainID ;
      p.CreateParam( ftString, 'DOMAIN_APP',        ptInput ).AsString :=  'CLAG5' ;
      p.CreateParam( ftString, 'DOMAIN_CODEPREFIX', ptInput ).AsString :=  'CL-' ;
      p.CreateParam( ftString, 'DOMAIN_CODE',       ptInput ).AsString :=  FDomainCode ;
      p.CreateParam( ftString, 'DOMAIN_CODESUFFIX', ptInput ).AsString :=  '' ;
      p.CreateParam( ftString, 'DOMAIN_NAME',       ptInput ).AsString :=  FDomainName ;
      p.CreateParam( ftString, 'DOMAIN_ALIAS',      ptInput ).AsString :=  FDomainName ;
      ADB.Execute ( _INSERT_SYS_DOMAINS, p ) ;


       DoLog ( 'Initializing Usuários' ) ;
       p.Clear ;
       p.CreateParam( ftString, 'KSYS$USER',     ptInput ).AsString :=  GuidStr20 ;
       p.CreateParam( ftString, 'LOGIN',         ptInput ).AsString :=  'admin' ;
       p.CreateParam( ftString, 'USERPASSWORD',  ptInput ).AsString :=  'admin'  ;
       p.CreateParam( ftString, 'INACTIVED',     ptInput ).AsInteger :=  0;
       p.CreateParam( ftString, 'TYPEREC',       ptInput ).AsString :=  'U' ;
       ADB.Execute( _INSERT_USER_ADMIN, p ) ;

       DoLog ( 'Initializing Fazenda' ) ;
       p.Clear ;
       p.CreateParam( ftString, 'KCAD_FAZENDA',  ptInput ).AsString := FDomainID ;
       p.CreateParam( ftString, 'CODIGOCLINICA', ptInput ).AsString := FDomainCode ;
       ADB.Execute( _INSERT_CAD_FAZENDA, p ) ;

       DoLog ( 'Initializing Domínio' ) ;
       p.Clear ;
       p.CreateParam( ftString, 'KCAD_ENTIDADE',     ptInput ).AsString := FDomainID   ;
       p.CreateParam( ftString, 'KSYS$DOMAIN',       ptInput ).AsString := FDomainID   ;
       p.CreateParam( ftString, 'KCAD_FAZENDA',      ptInput ).AsString := FDomainID   ;
       p.CreateParam( ftString, 'APELIDO',           ptInput ).AsString := FDomainName   ;
       p.CreateParam( ftString, 'NOME',              ptInput ).AsString := FDomainName   ;
       p.CreateParam( ftString, 'ATIVO',             ptInput ).AsString := 'T' ;
       p.CreateParam( ftString, 'PESSOA',            ptInput ).AsString := 'J' ;
       p.CreateParam( ftString, 'IS_CLIENTE',        ptInput ).AsString := 'F' ;
       p.CreateParam( ftString, 'IS_FORNECEDOR',     ptInput ).AsString := 'F' ;
       p.CreateParam( ftString, 'IS_FUNCIONARIO',    ptInput ).AsString := 'F' ;
       p.CreateParam( ftString, 'IS_TRANSPORTADORA', ptInput ).AsString := 'F' ;
       ADB.Execute( _INSERT_CAD_ENTIDADE, p ) ;


       DoLog ( 'Initializing Parâmetros' ) ;
       p.Clear;
       p.CreateParam( ftString,  'KCAD_FAZENDA',                 ptInput ).asString := FDomainID ;
       p.CreateParam( ftString,  'DSA_ESTQ_MACHO',               ptInput ).asString := 'T' ;
       p.CreateParam( ftInteger, 'DIAS_PROX_CIOSCOB',            ptInput ).asInteger := 7 ;
       p.CreateParam( ftInteger, 'DIAS_PROX_TAREFAS',            ptInput ).asInteger := 7 ;
       p.CreateParam( ftInteger, 'DIAS_PROX_SECAGENS',           ptInput ).asInteger := 7 ;
       p.CreateParam( ftInteger, 'DIAS_INTERVALO_BST',           ptInput ).asInteger := 12 ;
       p.CreateParam( ftInteger, 'ESCALA_PRODUCAO',              ptInput ).asInteger := 50 ;
       p.CreateParam( ftInteger, 'DIAS_PRE_SECAGEM_BST',         ptInput ).asInteger := 20 ;
       p.CreateParam( ftString,  'EXIBIR_PARTOS_SEMCONFIRMACAO', ptInput  ).asString := 'F' ;
       p.CreateParam( ftString,  'EXCLUIR_TAREFAS_DESCARTE',     ptInput  ).asString := 'F' ;
       ADB.Execute( _INSERT_CAD_FAZENDA_PARAMETROS, p ) ;
       p.Free ;

      end ;
  except on e : exception do ;// showMessage ( e.Message ) ;
  end;

  CDS.Free ;

  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'Un'  ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'kg'  ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'L'   ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'ha'  ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 't'   ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'Sc.' ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'Cx.' ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'Fr.' ) ] ) ) ;

  LDBVersion := TDBEntidadesUpdate.GetLastVersion.Replace( '.', ',', [rfReplaceAll]  ) ;
  ADB.ExecuteDirect ( Format ( _UPDATE_SYS_VERSION, [ LDBVersion ] ) ) ;

(*
     ADB.ExecuteDirect (
        Format (  'INSERT INTO SYS$DOMAINS'
        +#13#10'        ( KSYS$DOMAIN, DOMAIN_APP, DOMAIN_CODEPREFIX, DOMAIN_CODE, DOMAIN_CODESUFFIX, DOMAIN_NAME, DOMAIN_ALIAS, SYNC_STATUS )'
        +#13#10' VALUES ( %s, %s, %s, %s, %s, %s, %s,  0)',
          [ QuotedStr( FDomainID ), QuotedStr ( 'CLAG5' ), QuotedStr( 'CL-' ), QuotedStr( Format ( '%s', [ FDomainCode ] ) ), QuotedStr( '' ), QuotedStr( FDomainName ), QuotedStr( FDomainName ) ] ) ) ;
*)
end;



procedure TClAg5ClientInitFarmDatamodule.InitDBZootecnico;
const
  _INSERT_SYS_DOMAINS =
         'INSERT INTO SYS$DOMAINS'
  +#13#10'        ( KSYS$DOMAIN, DOMAIN_APP, DOMAIN_CODEPREFIX, DOMAIN_CODE, DOMAIN_CODESUFFIX, DOMAIN_NAME, DOMAIN_ALIAS )'
  +#13#10' VALUES ( :KSYS$DOMAIN, :DOMAIN_APP, :DOMAIN_CODEPREFIX, :DOMAIN_CODE, :DOMAIN_CODESUFFIX, :DOMAIN_NAME, :DOMAIN_ALIAS )' ;

  _UPDATE_SYS_VERSION =
     'INSERT INTO SYS$VERSION (SYS$VERSION, SYS$RELEASE, SYS$REVISION) VALUES( %s )' ;

 _EXECUTE_BLOCK_INSERT_ZOO_PESOALTURA_REFERENCIA =
             'EXECUTE BLOCK'
      +#13#10'AS'
      +#13#10'BEGIN'
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (0, 1, 60, 70, 81, 84, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE );  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (1, 2, 81, 95, 85, 89, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (2, 3, 102, 119, 89, 94, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (3, 4, 123, 145, 94, 99, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (4, 5, 145, 170, 98, 103, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (5, 6, 167, 195, 101, 107, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (6, 7, 189, 220, 104, 110, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (7, 8, 211, 245, 107, 113, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (8, 9, 233, 271, 110, 116, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (9, 10, 255, 296, 113, 119, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (10, 11, 277, 321, 115, 121, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (11, 12, 299, 345, 118, 123, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (12, 13, 320, 369, 120, 125, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (13, 14, 341, 393, 121, 127, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (14, 15, 362, 416, 123, 129, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (15, 16, 368, 438, 125, 130, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (16, 17, 388, 460, 126, 131, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (17, 18, 420, 481, 128, 132, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (18, 19, 438, 502, 129, 134, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (19, 20, 456, 521, 130, 135, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (20, 21, 472, 539, 131, 135, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (21, 22, 488, 557, 131, 136, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (22, 23, 502, 573, 132, 137, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (23, 24, 516, 588, 133, 138, ''HPB'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (0, 1, 42, 49, 74, 81, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (1, 2, 55, 66, 76, 84, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (2, 3, 70, 80, 81, 86, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (3, 4, 83, 98, 86, 91, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (4, 5, 106, 126, 89, 97, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (5, 6, 118, 146, 91, 98, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (6, 7, 137, 164, 97, 102, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (7, 8, 152, 187, 99, 104, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (8, 9, 169, 198, 100, 105, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (9, 10, 177, 219, 102, 107, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (10, 11, 194, 226, 104, 109, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (11, 12, 214, 249, 107, 112, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (12, 13, 227, 259, 108, 113, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (13, 14, 243, 273, 112, 114, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (14, 15, 256, 290, 113, 117, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (15, 16, 264, 300, 113, 118, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (16, 17, 276, 316, 114, 118, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (17, 18, 290, 342, 115, 119, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (18, 19, 295, 349, 116, 120, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (19, 20, 317, 369, 117, 121, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (20, 21, 326, 375, 118, 122, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (21, 22, 344, 390, 119, 125, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (22, 23, 345, 398, 121, 125, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'     UPDATE OR INSERT INTO ZOO_PESOALTURA_REFERENCIA (MIN_IDADE, MAX_IDADE, MIN_PESO, MAX_PESO, MIN_ALTURA, MAX_ALTURA, RACA_PRINCIPAL) VALUES (23, 24, 358, 405, 122, 126, ''JER'') MATCHING( RACA_PRINCIPAL, MIN_IDADE, MAX_IDADE ) ;  '
      +#13#10'END' ;
var
  LDBVersion : string ;
  p : TParams ;
begin
  DoLog ( 'Intiliazing : Zootécnico ' ) ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN',       ptInput ).AsString :=  FDomainID ;
  p.CreateParam( ftString, 'DOMAIN_APP',        ptInput ).AsString :=  'CLAG5' ;
  p.CreateParam( ftString, 'DOMAIN_CODEPREFIX', ptInput ).AsString :=  'CL-' ;
  p.CreateParam( ftString, 'DOMAIN_CODE',       ptInput ).AsString :=  FDomainCode ;
  p.CreateParam( ftString, 'DOMAIN_CODESUFFIX', ptInput ).AsString :=  '' ;
  p.CreateParam( ftString, 'DOMAIN_NAME',       ptInput ).AsString :=  FDomainName ;
  p.CreateParam( ftString, 'DOMAIN_ALIAS',      ptInput ).AsString :=  FDomainName ;

  OpenDataBase( FIDatabaseCfg.Path[ dbZootecnico ] ) ;
  ADB.Execute ( _INSERT_SYS_DOMAINS, p ) ;

  p.free ;

     ADB.ExecuteDirect (
        Format (  'INSERT INTO CAD_FAZENDAS'
        +#13#10'        ( KCAD_FAZENDA, CODIGOCLINICA )'
        +#13#10' VALUES ( %s, %s  )',
          [ QuotedStr( FDomainID ),
            QuotedStr( Format ( '%s', [ FDomainCode ] ) )
          ] ) ) ;

  LDBVersion := TDBZootecnicoUpdate.GetLastVersion.Replace( '.', ',', [rfReplaceAll]  ) ;
  ADB.ExecuteDirect ( Format ( _UPDATE_SYS_VERSION, [ LDBVersion ] ) ) ;

  ADB.ExecuteDirect ( _EXECUTE_BLOCK_INSERT_ZOO_PESOALTURA_REFERENCIA );

end;

procedure TClAg5ClientInitFarmDatamodule.InitDBFinanceiro;
const
  _INSERT_SYS_DOMAINS =
         'INSERT INTO SYS$DOMAINS'
  +#13#10'        ( KSYS$DOMAIN, DOMAIN_APP, DOMAIN_CODEPREFIX, DOMAIN_CODE, DOMAIN_CODESUFFIX, DOMAIN_NAME, DOMAIN_ALIAS )'
  +#13#10' VALUES ( :KSYS$DOMAIN, :DOMAIN_APP, :DOMAIN_CODEPREFIX, :DOMAIN_CODE, :DOMAIN_CODESUFFIX, :DOMAIN_NAME, :DOMAIN_ALIAS )' ;

   _ADD_UNIDADE =
          'EXECUTE BLOCK'
   +#13#10'AS'
   +#13#10'DECLARE KSYS$DOMAIN SYS$FKGUID20 = %s ;'
   +#13#10'DECLARE DESCRICAO   SYS$DESCR = %s ;'
   +#13#10'BEGIN'
   +#13#10'  IF ( EXISTS(SELECT 1 FROM CAD_TIPOS WHERE TIPO = 2 AND DESCRICAO = :DESCRICAO ROWS 1) ) THEN'
   +#13#10'   UPDATE  CAD_TIPOS'
   +#13#10'     SET   DESCRICAO = :DESCRICAO'
   +#13#10'   WHERE TIPO = 2 AND DESCRICAO = :DESCRICAO ;'
   +#13#10'  ELSE'
   +#13#10'    INSERT INTO CAD_TIPOS (KCAD_TIPOS, KSYS$DOMAIN, KCAD_FAZENDA, TIPO, DESCRICAO, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
   +#13#10'    VALUES (GUID20(), :KSYS$DOMAIN, :KSYS$DOMAIN, 2, :DESCRICAO, ''SYSTEM'', ''01.04.2016'', NULL, NULL) ;'
   +#13#10'END' ;

  _UPDATE_SYS_VERSION =
     'INSERT INTO SYS$VERSION (SYS$VERSION, SYS$RELEASE, SYS$REVISION) VALUES( %s )' ;
var
  LDBVersion : string ;
  p : TParams ;
begin
  DoLog ( 'Intiliazing : Financeiro ' ) ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN',       ptInput ).AsString :=  FDomainID ;
  p.CreateParam( ftString, 'DOMAIN_APP',        ptInput ).AsString :=  'CLAG5' ;
  p.CreateParam( ftString, 'DOMAIN_CODEPREFIX', ptInput ).AsString :=  'CL-' ;
  p.CreateParam( ftString, 'DOMAIN_CODE',       ptInput ).AsString :=  FDomainCode ;
  p.CreateParam( ftString, 'DOMAIN_CODESUFFIX', ptInput ).AsString :=  '' ;
  p.CreateParam( ftString, 'DOMAIN_NAME',       ptInput ).AsString :=  FDomainName ;
  p.CreateParam( ftString, 'DOMAIN_ALIAS',      ptInput ).AsString :=  FDomainName ;

  OpenDataBase( FIDatabaseCfg.Path[ dbFinanceiro ] ) ;
  ADB.Execute ( _INSERT_SYS_DOMAINS, p ) ;

  p.free ;

  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'Un'  ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'kg'  ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'L'   ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'ha'  ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 't'   ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'Sc.' ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'Cx.' ) ] ) ) ;
  ADB.ExecuteDirect ( Format( _ADD_UNIDADE, [ QuotedStr( FDomainID ), QuotedStr( 'Fr.' ) ] ) ) ;

  LDBVersion := TDBFinanceiroUpdate.GetLastVersion.Replace( '.', ',', [rfReplaceAll]  ) ;
  ADB.ExecuteDirect ( Format ( _UPDATE_SYS_VERSION, [ LDBVersion ] ) ) ;
end;


procedure TClAg5ClientInitFarmDatamodule.InitDBSession ;
const
  _UPDATE_SYS_VERSION =
         'INSERT INTO SYS$VERSION (SYS$VERSION, SYS$RELEASE, SYS$REVISION) VALUES( %s )' ;
var
  CDS : TClientDataSet ;
  LDBVersion : string ;
begin
  CDS := nil ;

  OpenDataBase( FIDatabaseCfg.Path[ dbFederation ] ) ;

  ADB.populateClientDataSet( CDS, '1 FROM SYS$VERSION ROWS 1' );

  if CDS.IsEmpty then
   begin
    LDBVersion := TDBSessionUpdate.GetLastVersion.Replace( '.', ',', [rfReplaceAll]  ) ;
    ADB.ExecuteDirect ( Format ( _UPDATE_SYS_VERSION, [ LDBVersion ] ) ) ;
   end;

  cds.Free ;

     (*
    SYS$LICENSEDATE  SYS$DATE_NN /* SYS$DATE_NN = TIMESTAMP NOT NULL */,
    SYS$TOKEN        SYS$TOKEN22 /* SYS$TOKEN22 = CHAR(22) */,
    SYS$VALIDADE     SYS$VALIDADE_NN /* SYS$VALIDADE_NN = SMALLINT NOT NULL */,
    SYS$LASTSYNC     SYS$DATE /* SYS$DATE = TIMESTAMP */,
    SYS$EXPIRESDATE  SYS$DATE_NN /* SYS$DATE_NN = TIMESTAMP NOT NULL */,
    SYS$PUBLICKEY    SYS$MD522 /* SYS$MD522 = CHAR(22) */,

    *)


end;

procedure TClAg5ClientInitFarmDatamodule.OpenDataBase(ADBPath: string);
begin

  with TSQLConnection ( ADB.Connection ) do
    begin
       if Connected then
          Close ;
       DriverName := 'Firebird250' ;
       TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
       with Params do
           begin
             {$IFNDEF _DSServer}
             if not FileExists ( RemoveHost ( ADBPath ) ) then
                raise Exception.Create('Error Message : não encontrado ' + ADBPath );
             {$ENDIF}
             Values[ 'Database' ] := ADBPath ;
           end ;
       Open ;
    end;

end;

procedure TClAg5ClientInitFarmDatamodule.SetLog(const Value: TLog);
begin
  FLog := Value;
end;

procedure TClAg5ClientInitFarmDatamodule.BackupRestoreLog(ALog: string);
begin
   DoLog ( ALog ) ;
end;


end.



