object dtmZoo_HistoricoRetiros: TdtmZoo_HistoricoRetiros
  OldCreateOrder = True
  Height = 238
  Width = 469
  object cdsRetiros: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspRetiros'
    Left = 78
    Top = 12
    object cdsRetirosRETIRO: TStringField
      DisplayLabel = 'Retiro'
      FieldName = 'RETIRO'
      FixedChar = True
      Size = 32
    end
    object cdsRetirosDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
  end
  object dspRetiros: TDataSetProvider
    DataSet = sqlRetiros
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlRetiros: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select'#13#10' RETIRO,'#13#10' DATA'#13#10'from ZOO_ANIMAL_RETIROS'#13#10'WHERE KZOO_ANI' +
      'MAL = :KZOO_ANIMAL'
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
    object sqlRetirosRETIRO: TStringField
      FieldName = 'RETIRO'
      FixedChar = True
      Size = 32
    end
    object sqlRetirosDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
  end
end
