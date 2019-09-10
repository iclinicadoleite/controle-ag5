object DomainListDatamodule: TDomainListDatamodule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 297
  Width = 463
  object cdsDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomains'
    OnCalcFields = cdsDomainsCalcFields
    OnFilterRecord = cdsDomainsFilterRecord
    Left = 84
    Top = 48
    object cdsDomainsKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsDomainsDOMAIN_NAME: TStringField
      DisplayLabel = 'Nome da fazenda'
      FieldName = 'DOMAIN_NAME'
      Required = True
      Size = 128
    end
    object cdsDomainsDOMAIN_CODE: TStringField
      DisplayLabel = 'C'#243'digo da fazenda'
      FieldName = 'DOMAIN_CODE'
      Size = 32
    end
    object cdsDomainsDOMAIN_ALIAS: TStringField
      DisplayLabel = 'Nome da fazenda'
      FieldName = 'DOMAIN_ALIAS'
      Required = True
      Size = 128
    end
    object cdsDomainsVALIDADE: TDateField
      DisplayLabel = 'Expira em'
      FieldKind = fkInternalCalc
      FieldName = 'VALIDADE'
    end
    object cdsDomainsISVALID: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkInternalCalc
      FieldName = 'ISVALID'
      OnGetText = cdsDomainsISVALIDGetText
      Size = 1
    end
    object cdsDomainsDBINITIALIZED: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'DBINITIALIZED'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspDomains: TDataSetProvider
    DataSet = sqlDomains
    UpdateMode = upWhereKeyOnly
    Left = 44
    Top = 100
  end
  object sqlDomains: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBSession.SQLDB
    SQL = (
      'SELECT DISTINCT'
      '  D.KSYS$DOMAIN,'
      '  D.DOMAIN_ALIAS, '
      '  D.DOMAIN_CODE, '
      '  D.DOMAIN_NAME,'
      '  --L.SYS$LICENSE, '
      
        '  CAST ( IIF (  A.KSYS$DOMAIN IS NULL, '#39'F'#39', '#39'T'#39' ) AS CHAR ) DBIN' +
        'ITIALIZED'
      'from SYS$DOMAIN_LICENSE L'
      'INNER JOIN SYS$DOMAINS D ON D.KSYS$DOMAIN = L.KSYS$DOMAIN'
      'LEFT JOIN  SYS$ACTIVEDOMAINS A ON A.KSYS$DOMAIN= D.KSYS$DOMAIN'
      '--WHERE L.SYS$SERIAL = |SERIAL '
      'ORDER BY D.DOMAIN_CODE')
    Left = 68
    Top = 168
    object sqlDomainsKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDomainsDOMAIN_ALIAS: TStringField
      FieldName = 'DOMAIN_ALIAS'
      Required = True
      Size = 128
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
    object sqlDomainsDBINITIALIZED: TStringField
      FieldName = 'DBINITIALIZED'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
