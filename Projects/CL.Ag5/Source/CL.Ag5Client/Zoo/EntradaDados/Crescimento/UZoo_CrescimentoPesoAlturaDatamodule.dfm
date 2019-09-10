object Zoo_CrescimentoPesoAlturaDatamodule: TZoo_CrescimentoPesoAlturaDatamodule
  OldCreateOrder = True
  Height = 277
  Width = 481
  object cdsPesoAltura: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesoAltura'
    BeforePost = cdsPesoAlturaBeforePost
    OnNewRecord = cdsPesoAlturaNewRecord
    Left = 78
    Top = 12
    object cdsPesoAlturaKZOO_ANIMAL_CRESCIMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_CRESCIMENTO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPesoAlturaKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPesoAlturaBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsPesoAlturaNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsPesoAlturaDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
      OnValidate = cdsPesoAlturaDATAValidate
    end
    object cdsPesoAlturaALTURA: TIntegerField
      DisplayLabel = 'Altura (cm)'
      FieldName = 'ALTURA'
      OnValidate = cdsPesoAlturaALTURAValidate
    end
    object cdsPesoAlturaPESO: TIntegerField
      DisplayLabel = 'Peso (Kg)'
      FieldName = 'PESO'
      OnValidate = cdsPesoAlturaPESOValidate
    end
    object cdsPesoAlturaOBSERVACAO: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspPesoAltura: TDataSetProvider
    DataSet = sqlPesoAltura
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspPesoAlturaBeforeUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlPesoAltura: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'   KZOO_ANIMAL_CRESCIMENTO, '#13#10'   KZOO_ANIMAL, '#13#10'   DATA' +
      ', '#13#10'   ALTURA, '#13#10'   PESO,'#13#10'   OBSERVACAO'#13#10'FROM ZOO_ANIMAL_CRESCI' +
      'MENTO'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlPesoAlturaKZOO_ANIMAL_CRESCIMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_CRESCIMENTO'
      Required = True
      FixedChar = True
    end
    object sqlPesoAlturaKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPesoAlturaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlPesoAlturaALTURA: TIntegerField
      FieldName = 'ALTURA'
    end
    object sqlPesoAlturaPESO: TIntegerField
      FieldName = 'PESO'
    end
    object sqlPesoAlturaOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsImport: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 369
    Top = 97
    object cdsImportBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsImportPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object cdsImportALTURA: TFloatField
      DisplayLabel = 'Altura'
      FieldName = 'ALTURA'
    end
    object cdsImportORD3: TFloatField
      DisplayLabel = 'Ord. 3'
      FieldName = 'ORD3'
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
    DataSet = cdsImport
    SQLOptions.SQLTerm = ';'
    Mappings.Strings = (
      'BRINCO=A'
      'PESO=B'
      'ALTURA=C')
    Options = [soExtendedStatistic, soUseAnimatedControl, soWaitCursor, soAutoCloseStatistic]
    Parameters = <>
    TitleStatus = 'Importing...'
    Statistic.TotalCount = 0
    Statistic.Result = irUnknown
    UseDisplayNames = False
    SourceFileName = 'SMImport.XLS'
    RowFirst = 2
    Left = 360
    Top = 20
  end
end
