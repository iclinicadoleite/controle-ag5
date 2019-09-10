object dtmCustomListaFicha: TdtmCustomListaFicha
  OldCreateOrder = True
  Height = 274
  Width = 550
  object cdsList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspList'
    OnNewRecord = cdsListNewRecord
    Left = 55
    Top = 44
  end
  object cdsEdit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEdit'
    OnNewRecord = cdsEditNewRecord
    Left = 183
    Top = 44
  end
  object dspList: TDataSetProvider
    DataSet = sqlList
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object dspEdit: TDataSetProvider
    DataSet = sqlEdit
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 89
  end
  object sqlList: TSQLDataSet
    GetMetadata = False
    CommandText = 'SELECT * '#13#10'FROM TABELA'
    MaxBlobSize = -1
    Params = <>
    Left = 58
    Top = 133
  end
  object sqlEdit: TSQLDataSet
    GetMetadata = False
    CommandText = 'SELECT * '#13#10'FROM TABELA'#13#10'WHERE PK = :PK'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'PK'
        ParamType = ptInput
      end>
    Left = 178
    Top = 132
  end
  object dtsList: TDataSource
    DataSet = cdsList
    Left = 120
    Top = 8
  end
  object sqlDetail1: TSQLDataSet
    GetMetadata = False
    CommandText = 'SELECT * '#13#10'FROM TABELA_DETALHE'#13#10'WHERE FK = :FK'
    DataSource = dtsSQLEdit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'FK'
        ParamType = ptInput
      end>
    Left = 272
    Top = 132
  end
  object dtsSQLEdit: TDataSource
    DataSet = sqlEdit
    Left = 219
    Top = 179
  end
  object cdsDetail1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 270
    Top = 45
  end
end
