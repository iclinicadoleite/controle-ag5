object dtmSYS_Login: TdtmSYS_Login
  OldCreateOrder = False
  Height = 287
  Width = 404
  object cdsDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomains'
    Left = 252
    Top = 36
    object cdsDomainsKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsDomainsDOMAIN_CODE: TStringField
      DisplayWidth = 10
      FieldName = 'DOMAIN_CODE'
      OnGetText = cdsDomainsDOMAIN_CODEGetText
      Size = 32
    end
    object cdsDomainsDOMAIN_NAME: TStringField
      DisplayWidth = 32
      FieldName = 'DOMAIN_NAME'
      Required = True
      Size = 128
    end
    object cdsDomainsDOMAIN_ALIAS: TStringField
      DisplayWidth = 32
      FieldName = 'DOMAIN_ALIAS'
      Required = True
      Size = 128
    end
    object cdsDomainsSYSLICENSE: TStringField
      FieldName = 'SYS$LICENSE'
      Size = 128
    end
    object cdsDomainsDOMAIN_NAME_CODE: TStringField
      FieldName = 'DOMAIN_NAME_CODE'
      Size = 161
    end
    object cdsDomainssqlUsers: TDataSetField
      DisplayLabel = 'Usu'#225'rios'
      FieldName = 'sqlUsers'
    end
  end
  object sqlDomains: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBSession.SQLDB
    SQL = (
      'SELECT DISTINCT'
      '  D.KSYS$DOMAIN, '
      '  D.DOMAIN_CODE, '
      '  D.DOMAIN_NAME,  '
      
        '  D.DOMAIN_NAME ||  '#39' (CL-'#39' || D.DOMAIN_CODE || '#39')'#39' DOMAIN_NAME_' +
        'CODE, '
      '  D.DOMAIN_ALIAS,'
      '  '#39'10000-07695-20650-07388-67007-00006'#39' SYS$LICENSE'
      'from SYS$ACTIVEDOMAINS D'
      'INNER JOIN SYS$DOMAIN_LICENSE L ON L.KSYS$DOMAIN = D.KSYS$DOMAIN'
      '--WHERE L.SYS$SERIAL = |SERIAL'
      'ORDER BY D.DOMAIN_NAME')
    Left = 248
    Top = 116
    object sqlDomainsKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlDomainsDOMAIN_CODE: TStringField
      FieldName = 'DOMAIN_CODE'
      Size = 32
    end
    object sqlDomainsDOMAIN_NAME: TStringField
      FieldName = 'DOMAIN_NAME'
      Required = True
      Size = 128
    end
    object sqlDomainsDOMAIN_ALIAS: TStringField
      FieldName = 'DOMAIN_ALIAS'
      Required = True
      Size = 128
    end
    object sqlDomainsDOMAIN_NAME_CODE: TStringField
      FieldName = 'DOMAIN_NAME_CODE'
      Size = 161
    end
    object sqlDomainsSYSLICENSE: TStringField
      FieldName = 'SYS$LICENSE'
      Size = 128
    end
  end
  object cdsUsers: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDomainssqlUsers
    Params = <>
    Left = 316
    Top = 37
    object cdsUsersKSYS_USER: TStringField
      FieldName = 'KSYS_USER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsUsersLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 32
    end
    object cdsUsersSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 32
    end
    object cdsUsersEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 64
    end
  end
  object dspDomains: TDataSetProvider
    DataSet = sqlDomains
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 180
    Top = 76
  end
  object sqlUsers: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = DataSource1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBSession.SQLDB
    SQL = (
      'SELECT'
      '  AU."KSYS$USER" KSYS_USER,'
      '  AU.LOGIN,'
      '  AU.USERPASSWORD SPASSWORD,'
      '  AU.EMAIL EMAIL'
      'FROM  SYS$ACTIVEUSERS AU'
      'WHERE            '
      '        ( AU."KSYS$DOMAIN"  = :KSYS$DOMAIN )')
    Left = 312
    Top = 116
    object sqlUsersKSYS_USER: TStringField
      FieldName = 'KSYS_USER'
      Required = True
      FixedChar = True
    end
    object sqlUsersLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 32
    end
    object sqlUsersSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 32
    end
    object sqlUsersEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 64
    end
  end
  object DataSource1: TDataSource
    DataSet = sqlDomains
    Left = 296
    Top = 172
  end
  object cdsProfiles: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 28
    object cdsProfilesALIAS: TStringField
      FieldName = 'ALIAS'
      Size = 64
    end
    object cdsProfilesDESCRIPTION: TStringField
      DisplayWidth = 32
      FieldName = 'DESCRIPTION'
      Size = 64
    end
  end
end
