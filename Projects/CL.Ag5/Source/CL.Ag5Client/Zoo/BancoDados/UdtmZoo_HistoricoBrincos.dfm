object dtmZoo_HistoricoBrincos: TdtmZoo_HistoricoBrincos
  OldCreateOrder = True
  Left = 811
  Top = 40
  Height = 238
  Width = 469
  object cdsBrincos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspBrincos'
    Left = 78
    Top = 12
    object cdsBrincosBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsBrincosDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
  end
  object dspBrincos: TDataSetProvider
    DataSet = sqlBrincos
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlBrincos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select  '#13#10' BRINCO, '#13#10' DATA'#13#10'from ZOO_ANIMAL_BRINCOS'#13#10'WHERE KZOO_' +
      'ANIMAL = :KZOO_ANIMAL'
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
    object sqlBrincosBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlBrincosDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
  end
end
