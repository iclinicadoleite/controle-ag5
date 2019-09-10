object Zoo_ImportarSISBOVDatamodule: TZoo_ImportarSISBOVDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsFazenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspFazenda'
    BeforeOpen = cdsFazendaBeforeOpen
    Left = 78
    Top = 12
    object cdsFazendaKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsFazendaCERTIFICADORA: TStringField
      DisplayLabel = 'C'#243'd Certificadora'
      FieldName = 'CERTIFICADORA'
      Size = 32
    end
    object cdsFazendaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsFazendaNOMECERTIFICADORA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMECERTIFICADORA'
      LookupDataSet = cdsCertificadoras
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CERTIFICADORA'
      Size = 255
      Lookup = True
    end
  end
  object dspFazenda: TDataSetProvider
    DataSet = sqlFazenda
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlFazenda: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' F.KCAD_FAZENDA,'#13#10' F.CERTIFICADORA,'#13#10' E.NOME'#13#10'FROM CAD_' +
      'FAZENDAS F'#13#10'LEFT JOIN CAD_ENTIDADES E ON E.KCAD_FAZENDA = F.KCAD' +
      '_FAZENDA'#13#10'WHERE  F.KCAD_FAZENDA = :KCAD_FAZENDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    Left = 73
    Top = 112
    object sqlFazendaKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlFazendaCERTIFICADORA: TStringField
      FieldName = 'CERTIFICADORA'
      Size = 32
    end
    object sqlFazendaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
  end
  object cdsSISBOV: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 165
    Top = 13
    object cdsSISBOVEXISTS: TStringField
      DisplayLabel = 'Encontrado'
      FieldName = 'EXISTS'
      Size = 1
    end
    object cdsSISBOVCODFAZENDA: TStringField
      DisplayLabel = 'C'#243'd Fazenda'
      FieldName = 'CODFAZENDA'
      Size = 32
    end
    object cdsSISBOVCODCERTFICADORA: TStringField
      DisplayLabel = 'C'#243'd Certificadora'
      FieldName = 'CODCERTFICADORA'
      Size = 32
    end
    object cdsSISBOVBRINCOAGENDA: TStringField
      DisplayLabel = 'Brinco Agenda'
      FieldName = 'BRINCOAGENDA'
      Size = 32
    end
    object cdsSISBOVNUMERO_SISBOV: TStringField
      DisplayLabel = 'N'#250'mero SISBOV'
      FieldName = 'NUMERO_SISBOV'
      Size = 32
    end
    object cdsSISBOVKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
    end
  end
  object cdsCertificadoras: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 360
    Top = 108
    object cdsCertificadorasTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsCertificadorasVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsCertificadorasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object cdsCertificadorasORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object SMImportFromXLS1: TSMImportFromXLS
    AbortOnProblem = True
    AnimatedStatus = False
    DataFormats.DateOrder = doDMY
    DataFormats.DateSeparator = '/'
    DataFormats.TimeSeparator = ':'
    DataFormats.FourDigitYear = True
    DataFormats.LeadingZerosInDate = True
    DataFormats.ThousandSeparator = '.'
    DataFormats.DecimalSeparator = ','
    DataFormats.CurrencyString = 'R$'
    DataFormats.BooleanTrue = 'True'
    DataFormats.BooleanFalse = 'False'
    DataFormats.UseRegionalSettings = False
    DataSet = cdsSISBOV
    SQLOptions.SQLTerm = ';'
    Mappings.Strings = (
      'CODFAZENDA=A'
      'CODCERTFICADORA=B'
      'BRINCOAGENDA=C'
      'NUMERO_SISBOV=D')
    Options = [soExtendedStatistic, soUseAnimatedControl, soWaitCursor, soAutoCloseStatistic]
    Parameters = <>
    TitleStatus = 'Importing...'
    Statistic.TotalCount = 0
    Statistic.Result = irUnknown
    UseDisplayNames = False
    SourceFileName = 'SMImport.XLS'
    RowFirst = 2
    Left = 312
    Top = 20
  end
end
