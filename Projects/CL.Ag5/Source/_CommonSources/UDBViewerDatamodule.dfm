object dtmDBViewer: TdtmDBViewer
  OldCreateOrder = False
  Height = 264
  Width = 484
  object ResultSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 95
    Top = 24
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Options = [poIncFieldProps, poRetainServerOrder, poUseQuoteChar]
    Left = 55
    Top = 64
  end
  object SQLDataSet1: TTcSQLDataSet
    GetMetadata = False
    AfterOpen = SQLDataSet1AfterOpen
    MaxBlobSize = -1
    Params = <>
    Left = 95
    Top = 136
  end
end
