object dtmCustomDBEdit: TdtmCustomDBEdit
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsEdit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEdit'
    OnNewRecord = cdsEditNewRecord
    Left = 78
    Top = 12
  end
  object dspEdit: TDataSetProvider
    DataSet = sqlEdit
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlEdit: TSQLDataSet
    GetMetadata = False
    CommandText = 'SELECT * '#13#10'FROM TABELA'
    MaxBlobSize = -1
    Params = <>
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
    DataSet = sqlEdit
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
