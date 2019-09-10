object ClAg5ClientInitFarmDatamodule: TClAg5ClientInitFarmDatamodule
  OldCreateOrder = False
  Height = 311
  Width = 629
  object SQLDB: TSQLConnection
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
    Left = 36
    Top = 28
  end
  object ADB: TTcadb_DBX
    Alias = 'DB'
    Connection = SQLDB
    Left = 96
    Top = 28
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    Params.Strings = (
      'DriverUnit=Data.DB, Data.DBXDataSnap'
      'HostName=console.agenda5.com.br'
      'Port=35000'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DB, Tc.Data.DB.HelpersxClientDriver,Version=23.0.0.0,Cultu' +
        're=neutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'ServerConnection=TrdmDBSession.GetConnection("DataServer_CDL")')
    Left = 488
    Top = 128
    UniqueId = '{95EB71C9-0914-4461-94E9-E8A04C6B7EF2}'
  end
end
