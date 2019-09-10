object DBAnexos: TDBAnexos
  OldCreateOrder = True
  Height = 261
  Width = 473
  object SQLDB: TSQLConnection
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
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      
        'Database=FIREBIRD_SERVER/30250:T:\CDL\Sistemas\ControleLeiteiro\' +
        'Data\Client\CL-000000\DB\CLAG5.000000.ATT'
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
    AfterConnect = SQLDBAfterConnect
    BeforeConnect = SQLDBBeforeConnect
    Left = 36
    Top = 28
  end
  object ADBAnexos: TTcadb_DBX
    OnInitSystemTypes = ADBAnexosInitSystemTypes
    Alias = 'ATT'
    Connection = SQLDB
    Left = 92
    Top = 28
  end
end
