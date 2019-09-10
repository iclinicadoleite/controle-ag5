object SYS_BackupDatamodule: TSYS_BackupDatamodule
  OldCreateOrder = False
  Height = 345
  Width = 564
  object SQLDB_DOMAINS: TSQLConnection
    ConnectionName = 'CLINICA DO LEITE'
    DriverName = 'FIREBIRD'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver210.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DB, Data.DBXCommonDriver,Version=21.0.0.0,Culture=neutra' +
        'l,PublicKeyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver210.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DBXFirebirdDriver,Version=21.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=database.fdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    AfterConnect = SQLDB_DOMAINSAfterConnect
    BeforeConnect = SQLDB_DOMAINSBeforeConnect
    Left = 44
    Top = 20
  end
  object AbstractDBDomains: TTcadb_DBX
    Alias = 'BACKUP_DOMAINS'
    Connection = SQLDB_DOMAINS
    Left = 156
    Top = 19
  end
  object cdsFazendas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspFazendas'
    OnCalcFields = cdsFazendasCalcFields
    Left = 104
    Top = 132
    object cdsFazendasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsFazendasDOMAIN_CODE: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DOMAIN_CODE'
      Size = 32
    end
    object cdsFazendasDOMAIN_NAME: TStringField
      DisplayLabel = 'Fazenda'
      FieldName = 'DOMAIN_NAME'
      Required = True
      Size = 128
    end
    object cdsFazendasCHECKED: TStringField
      DisplayLabel = 'Selecionar'
      FieldKind = fkInternalCalc
      FieldName = 'CHECKED'
      OnGetText = cdsFazendasCHECKEDGetText
      Size = 1
    end
    object cdsFazendasDOMAIN_ALIAS: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'DOMAIN_ALIAS'
      Required = True
      Size = 128
    end
    object cdsFazendasCHECKED_INT: TSmallintField
      FieldKind = fkInternalCalc
      FieldName = 'CHECKED_INT'
    end
    object cdsFazendasCHECKED_COUNT: TAggregateField
      FieldName = 'CHECKED_COUNT'
      Active = True
      DisplayName = ''
      Expression = 'SUM ( CHECKED_INT )'
    end
  end
  object sqlFazendas: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLDB_DOMAINS
    SQL = (
      
        'SELECT D.KSYS$DOMAIN, D.DOMAIN_CODE, D.DOMAIN_NAME, D.DOMAIN_ALI' +
        'AS'
      'from SYS$ACTIVEDOMAINS D')
    Left = 104
    Top = 228
    object sqlFazendasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlFazendasDOMAIN_CODE: TStringField
      FieldName = 'DOMAIN_CODE'
      Size = 32
    end
    object sqlFazendasDOMAIN_NAME: TStringField
      FieldName = 'DOMAIN_NAME'
      Required = True
      Size = 128
    end
    object sqlFazendasDOMAIN_ALIAS: TStringField
      FieldName = 'DOMAIN_ALIAS'
      Required = True
      Size = 128
    end
  end
  object dspFazendas: TDataSetProvider
    DataSet = sqlFazendas
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 168
  end
  object SQLDB_DATA: TSQLConnection
    ConnectionName = 'CLINICA DO LEITE'
    DriverName = 'FIREBIRD'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver210.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DB, Data.DBXCommonDriver,Version=21.0.0.0,Culture=neutra' +
        'l,PublicKeyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver210.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DBXFirebirdDriver,Version=21.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=database.fdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    BeforeConnect = SQLDB_DATABeforeConnect
    Left = 288
    Top = 28
  end
  object sqlJNL: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLDB_DATA
    SQL = (
      'select '
      ' T.JNL$SEQUENCE,'
      ' T.JNL$TRANSACTION_SEQUENCE,'
      ' T.JNL$TRANSACTION, '
      ' T.JNL$START, '
      ' T.JNL$END, '
      ' SXML.JNL$SXML,'
      ' LXML.JNL$LXML,'
      ' T.JNL$USERNAME'
      'from JNL$TRANSACTIONS T'
      
        'LEFT JOIN JNL$SXML SXML ON ( JNL$XML_SL = '#39'S'#39' AND SXML.JNL$SEQUE' +
        'NCE = T.JNL$SEQUENCE )'
      
        'LEFT JOIN JNL$LXML LXML ON ( JNL$XML_SL = '#39'L'#39' AND LXML.JNL$SEQUE' +
        'NCE = T.JNL$SEQUENCE )'
      'ORDER BY T.JNL$SEQUENCE')
    Left = 376
    Top = 28
    object sqlJNLJNLSEQUENCE: TIntegerField
      FieldName = 'JNL$SEQUENCE'
    end
    object sqlJNLJNLTRANSACTION_SEQUENCE: TIntegerField
      FieldName = 'JNL$TRANSACTION_SEQUENCE'
    end
    object sqlJNLJNLTRANSACTION: TIntegerField
      FieldName = 'JNL$TRANSACTION'
    end
    object sqlJNLJNLSTART: TSQLTimeStampField
      FieldName = 'JNL$START'
    end
    object sqlJNLJNLSXML: TStringField
      FieldName = 'JNL$SXML'
      Size = 10000
    end
    object sqlJNLJNLLXML: TMemoField
      FieldName = 'JNL$LXML'
      BlobType = ftMemo
      Size = 1
    end
    object sqlJNLJNLEND: TSQLTimeStampField
      FieldName = 'JNL$END'
    end
    object sqlJNLJNLUSERNAME: TStringField
      FieldName = 'JNL$USERNAME'
      FixedChar = True
      Size = 31
    end
  end
  object AbstractDBEntidades: TTcadb_DBX
    Alias = 'BACKUP_ENTIDADES'
    Connection = SQLDB_ENTIDADES
    Left = 156
    Top = 76
  end
  object SQLDB_ENTIDADES: TSQLConnection
    ConnectionName = 'CLINICA DO LEITE'
    DriverName = 'FIREBIRD'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver210.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DB, Data.DBXCommonDriver,Version=21.0.0.0,Culture=neutra' +
        'l,PublicKeyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver210.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DBXFirebirdDriver,Version=21.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=database.fdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    BeforeConnect = SQLDB_ENTIDADESBeforeConnect
    Left = 48
    Top = 76
  end
end
