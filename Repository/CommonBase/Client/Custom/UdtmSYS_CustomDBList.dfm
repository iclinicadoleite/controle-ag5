object dtmCustomDBList: TdtmCustomDBList
  OldCreateOrder = True
  Height = 238
  Width = 469
  object cdsList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspList'
    Left = 78
    Top = 12
  end
  object dspList: TDataSetProvider
    DataSet = sqlList
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlList: TSQLDataSet
    GetMetadata = False
    CommandText = 'SELECT * '#13#10'FROM TABELA'#13#10'WHERE PK = :PK'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'PK'
        ParamType = ptInput
      end>
    Left = 73
    Top = 100
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
    Left = 167
    Top = 100
  end
  object dtsSQLEdit: TDataSource
    DataSet = sqlList
    Left = 114
    Top = 147
  end
  object cdsDetail1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 165
    Top = 13
  end
end
