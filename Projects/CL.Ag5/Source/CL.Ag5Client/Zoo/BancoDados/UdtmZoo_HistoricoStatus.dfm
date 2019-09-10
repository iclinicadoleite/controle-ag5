object dtmZoo_HistoricoStatus: TdtmZoo_HistoricoStatus
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsStatus: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspStatus'
    Left = 78
    Top = 12
    object cdsStatusSTATUS: TIntegerField
      FieldName = 'STATUS'
      Visible = False
    end
    object cdsStatusDESCR_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusAnimal
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 31
      Lookup = True
    end
    object cdsStatusDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
  end
  object dspStatus: TDataSetProvider
    DataSet = sqlStatus
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlStatus: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select  '#13#10' STATUS, '#13#10' DATA'#13#10'from ZOO_ANIMAL_STATUS'#13#10'WHERE KZOO_A' +
      'NIMAL = :KZOO_ANIMAL'
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
    object sqlStatusSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object sqlStatusDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
  end
  object cdsStatusAnimal: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 284
    Top = 16
    object cdsStatusAnimalTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
