object ZooRelatotioAvaliacaoBezerras_dtm: TZooRelatotioAvaliacaoBezerras_dtm
  OldCreateOrder = False
  Height = 356
  Width = 544
  object sqlResultados: TTcSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 52
    Top = 212
  end
  object dspResultados: TDataSetProvider
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 156
  end
  object cdsResultados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspResultados'
    Left = 48
    Top = 100
  end
  object cdsCategoria: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 364
    Top = 112
    object cdsCategoriaTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsCategoriaVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsCategoriaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsCategoriaORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
