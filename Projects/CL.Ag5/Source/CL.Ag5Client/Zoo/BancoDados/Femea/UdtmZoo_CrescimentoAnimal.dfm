object dtmZoo_CrescimentoAnimal: TdtmZoo_CrescimentoAnimal
  OldCreateOrder = True
  Height = 209
  Width = 307
  object cdsCrescimento: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KZOO_ANIMAL'
    MasterFields = 'KZOO_ANIMAL'
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspCrescimento'
    BeforePost = cdsCrescimentoBeforePost
    OnCalcFields = cdsCrescimentoCalcFields
    OnNewRecord = cdsCrescimentoNewRecord
    Left = 97
    Top = 14
    object cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_CRESCIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsCrescimentoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsCrescimentoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
      OnValidate = cdsCrescimentoDATAValidate
    end
    object cdsCrescimentoIDADE: TIntegerField
      DisplayLabel = 'Idade'
      FieldKind = fkCalculated
      FieldName = 'IDADE'
      Calculated = True
    end
    object cdsCrescimentoPESO: TIntegerField
      DisplayLabel = 'Peso (kg)'
      FieldName = 'PESO'
      OnValidate = cdsCrescimentoPESOValidate
    end
    object cdsCrescimentoGANHOPESO: TFloatField
      DisplayLabel = 'GPD'
      FieldName = 'GANHOPESO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '#,0.00'
    end
    object cdsCrescimentoALTURA: TIntegerField
      DisplayLabel = 'Altura (cm)'
      FieldName = 'ALTURA'
      OnValidate = cdsCrescimentoALTURAValidate
    end
    object cdsCrescimentoOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlCrescimento: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT  '#13#10'  KZOO_ANIMAL_CRESCIMENTO,'#13#10'  KZOO_ANIMAL,'#13#10'  DATA,'#13#10' ' +
      '  PESO,'#13#10'  GANHOPESO,'#13#10'  ALTURA,'#13#10'  OBSERVACAO'#13#10'FROM ZOO_ANIMAL_' +
      'CRESCIMENTO'#13#10'WHERE KZOO_ANIMAL = :KZOO_ANIMAL'#13#10'ORDER BY DATA'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 95
    Top = 101
    object sqlCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_CRESCIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlCrescimentoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlCrescimentoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlCrescimentoPESO: TIntegerField
      DisplayLabel = 'Peso (kg)'
      FieldName = 'PESO'
    end
    object sqlCrescimentoGANHOPESO: TFloatField
      DisplayLabel = 'GPD'
      FieldName = 'GANHOPESO'
      ProviderFlags = [pfInWhere]
    end
    object sqlCrescimentoALTURA: TIntegerField
      DisplayLabel = 'Altura (cm)'
      FieldName = 'ALTURA'
    end
    object sqlCrescimentoOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspCrescimento: TDataSetProvider
    DataSet = sqlCrescimento
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspCrescimentoAfterUpdateRecord
    Left = 49
    Top = 57
  end
end
