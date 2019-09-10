object dtmFIN_Bancos: TdtmFIN_Bancos
  OldCreateOrder = True
  Height = 285
  Width = 550
  object cdsLstBancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLstBancos'
    BeforeOpen = cdsLstBancosBeforeOpen
    OnNewRecord = cdsLstBancosNewRecord
    Left = 55
    Top = 44
    object cdsLstBancosKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsLstBancosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsLstBancosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsLstBancosHOMEPAGE: TStringField
      DisplayLabel = 'Homepage'
      FieldName = 'HOMEPAGE'
      Size = 128
    end
    object cdsLstBancosFEBRABAN: TStringField
      DisplayLabel = 'Febraban'
      FieldName = 'FEBRABAN'
      Required = True
      OnGetText = cdsLstBancosFEBRABANGetText
      FixedChar = True
      Size = 1
    end
  end
  object cdsBanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBanco'
    OnNewRecord = cdsBancoNewRecord
    Left = 183
    Top = 44
    object cdsBancoKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBancoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
      OnValidate = cdsBancoCODIGOValidate
      FixedChar = True
      Size = 3
    end
    object cdsBancoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsBancoHOMEPAGE: TStringField
      DisplayLabel = 'Site'
      FieldName = 'HOMEPAGE'
      Size = 128
    end
    object cdsBancoFEBRABAN: TStringField
      FieldName = 'FEBRABAN'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstBancos
    Left = 120
    Top = 8
  end
  object dspLstBancos: TDataSetProvider
    DataSet = sqlLstBancos
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 39
    Top = 97
  end
  object dspBanco: TDataSetProvider
    DataSet = sqlBanco
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 151
    Top = 97
  end
  object sqlLstBancos: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select'
      '  KFIN_BANCO, '
      '  CODIGO, '
      '  NOME, '
      '  HOMEPAGE, '
      '  FEBRABAN '
      'from FIN_BANCOS')
    Left = 66
    Top = 141
    object sqlLstBancosKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlLstBancosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object sqlLstBancosNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object sqlLstBancosHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 128
    end
    object sqlLstBancosFEBRABAN: TStringField
      FieldName = 'FEBRABAN'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object sqlBanco: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'KFIN_BANCO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select'
      '  KFIN_BANCO, '
      '  CODIGO, '
      '  NOME, '
      '  HOMEPAGE, '
      '  FEBRABAN '
      'from FIN_BANCOS'
      'WHERE  KFIN_BANCO = :KFIN_BANCO')
    Left = 186
    Top = 140
    object sqlBancoKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlBancoCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object sqlBancoNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object sqlBancoHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 128
    end
    object sqlBancoFEBRABAN: TStringField
      FieldName = 'FEBRABAN'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsSQLEdit: TDataSource
    DataSet = sqlBanco
    Left = 227
    Top = 187
  end
  object cdsImportaBancos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'KFIN_BANCO'
        ParamType = ptInput
      end>
    Left = 416
    Top = 32
    object cdsImportaBancosKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      Required = True
    end
    object cdsImportaBancosIMPORT: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'IMPORT'
    end
    object cdsImportaBancosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsImportaBancosNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsImportaBancosHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 128
    end
    object cdsImportaBancosFEBRABAN: TStringField
      FieldName = 'FEBRABAN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsImportaBancosEXISTS: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'EXISTS'
    end
  end
end
