object DomainValidateDatamodule: TDomainValidateDatamodule
  OldCreateOrder = False
  Height = 382
  Width = 351
  object cdsDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomains'
    Left = 68
    Top = 36
  end
  object dspDomains: TDataSetProvider
    DataSet = sqlDomains
    UpdateMode = upWhereKeyOnly
    Left = 44
    Top = 100
  end
  object sqlDomains: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBSession.SQLDB
    SQL = (
      'select '
      '  KSYS$DOMAIN,'
      '  DOMAIN_ALIAS, '
      '  DOMAIN_CODE, '
      ' DOMAIN_NAME '
      'from SYS$DOMAINS')
    Left = 68
    Top = 168
  end
end
