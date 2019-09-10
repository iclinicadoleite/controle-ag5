object SYS_ConfigBackupDataModule: TSYS_ConfigBackupDataModule
  OldCreateOrder = False
  Height = 315
  Width = 623
  object AbstractDBConfigDomains: TTcadb_DBX
    Alias = 'CONFIG_BACKUP_DOMAINS'
    Connection = SQLDB_DOMAINS
    Left = 156
    Top = 19
  end
  object SQLDB_DOMAINS: TSQLConnection
    ConnectionName = 'CLINICA DO LEITE'
    DriverName = 'FIREBIRD'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver200.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DB, Data.DBXCommonDriver,Version=20.0.0.0,Culture=neutra' +
        'l,PublicKeyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver200.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DBXFirebirdDriver,Version=20.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      
        'VendorLib=T:\Downloads\Firebird\Firebird-3.0.0.32483-2_Win32\fbc' +
        'lient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      
        'Database=FIREBIRD_SERVER/30250:T:\CDL\Sistemas\ControleLeiteiro\' +
        'Data\Client\CLAG5.DB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=True'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet=ISO8859_1'
      'Trim Char=True')
    BeforeConnect = SQLDB_DOMAINSBeforeConnect
    Left = 36
    Top = 28
  end
  object sqlFazendas: TTcSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLDB_DOMAINS
    SQL = (
      'select D.KSYS$DOMAIN,'
      '       D.DOMAIN_CODEPREFIX || D.DOMAIN_CODE "DOMAIN_DESCR",'
      '      D.DOMAIN_CODE,'
      '       D.DOMAIN_NAME,'
      '       D.SEND_BKP_ZOO,'
      '       D.SEND_BKP_FIN,'
      '       D.SYNC_LASTDATE,'
      '       D.SYNC_STATUS,'
      '       D.SEND_DAYNUMBER,'
      '       D.SEND_NEXTDATE'
      '  from SYS$DOMAINS D'
      'order by D.DOMAIN_CODE')
    Left = 84
    Top = 208
    object sqlFazendasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlFazendasDOMAIN_DESCR: TStringField
      FieldName = 'DOMAIN_DESCR'
      Size = 64
    end
    object sqlFazendasDOMAIN_NAME: TStringField
      FieldName = 'DOMAIN_NAME'
      Required = True
      Size = 128
    end
    object sqlFazendasSEND_BKP_ZOO: TStringField
      FieldName = 'SEND_BKP_ZOO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFazendasSEND_BKP_FIN: TStringField
      FieldName = 'SEND_BKP_FIN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFazendasSYNC_LASTDATE: TSQLTimeStampField
      FieldName = 'SYNC_LASTDATE'
    end
    object sqlFazendasSYNC_STATUS: TIntegerField
      FieldName = 'SYNC_STATUS'
      Required = True
    end
    object sqlFazendasDOMAIN_CODE: TStringField
      FieldName = 'DOMAIN_CODE'
      Size = 32
    end
    object sqlFazendasSEND_DAYNUMBER: TIntegerField
      FieldName = 'SEND_DAYNUMBER'
    end
    object sqlFazendasSEND_NEXTDATE: TSQLTimeStampField
      FieldName = 'SEND_NEXTDATE'
    end
  end
  object dspFazendas: TDataSetProvider
    DataSet = sqlFazendas
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 84
    Top = 148
  end
  object cdsFazendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFazendas'
    BeforePost = cdsFazendasBeforePost
    Left = 88
    Top = 88
    object cdsFazendasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsFazendasDOMAIN_DESCR: TStringField
      FieldName = 'DOMAIN_DESCR'
      Size = 64
    end
    object cdsFazendasDOMAIN_NAME: TStringField
      FieldName = 'DOMAIN_NAME'
      Required = True
      Size = 128
    end
    object cdsFazendasSEND_BKP_ZOO: TStringField
      FieldName = 'SEND_BKP_ZOO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFazendasSEND_BKP_FIN: TStringField
      FieldName = 'SEND_BKP_FIN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFazendasSYNC_LASTDATE: TSQLTimeStampField
      FieldName = 'SYNC_LASTDATE'
    end
    object cdsFazendasSYNC_STATUS: TIntegerField
      FieldName = 'SYNC_STATUS'
      Required = True
      OnGetText = cdsFazendasSYNC_STATUSGetText
    end
    object cdsFazendasDOMAIN_CODE: TStringField
      FieldName = 'DOMAIN_CODE'
      Size = 32
    end
    object cdsFazendasSEND_DAYNUMBER: TIntegerField
      FieldName = 'SEND_DAYNUMBER'
    end
    object cdsFazendasSEND_NEXTDATE: TSQLTimeStampField
      FieldName = 'SEND_NEXTDATE'
    end
  end
end
