object dtmZoo_HistoricoLotes: TdtmZoo_HistoricoLotes
  OldCreateOrder = True
  Left = 564
  Top = 94
  Height = 238
  Width = 469
  object cdsLotes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspLotes'
    Left = 78
    Top = 12
    object cdsLotesLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsLotesDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
  end
  object dspLotes: TDataSetProvider
    DataSet = sqlLotes
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlLotes: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select'#13#10' LOTE,'#13#10' DATA'#13#10'from ZOO_ANIMAL_LOTES'#13#10'WHERE KZOO_ANIMAL ' +
      '= :KZOO_ANIMAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlLotesLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlLotesDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
  end
end
