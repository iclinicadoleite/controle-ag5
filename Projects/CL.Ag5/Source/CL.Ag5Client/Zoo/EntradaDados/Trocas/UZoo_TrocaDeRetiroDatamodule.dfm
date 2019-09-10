object Zoo_TrocaDeRetiroDatamodule: TZoo_TrocaDeRetiroDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsTrocaRetiro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTrocaRetiro'
    BeforePost = cdsTrocaRetiroBeforePost
    Left = 78
    Top = 12
    object cdsTrocaRetiroKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsTrocaRetiroBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsTrocaRetiroBRINCO_: TStringField
      FieldName = 'BRINCO_'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 32
    end
    object cdsTrocaRetiroNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsTrocaRetiroRETIROORIGEM: TStringField
      DisplayLabel = 'Retiro antigo'
      FieldName = 'RETIROORIGEM'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 32
    end
    object cdsTrocaRetiroRETIRO: TStringField
      DisplayLabel = 'Novo retiro'
      FieldName = 'RETIRO'
      FixedChar = True
      Size = 32
    end
    object cdsTrocaRetiroDATARETIRO: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATARETIRO'
    end
  end
  object dspTrocaRetiro: TDataSetProvider
    DataSet = sqlTrocaRetiro
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspTrocaRetiroBeforeUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlTrocaRetiro: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  AF.KZOO_ANIMAL_FEMEA,'#13#10'  A.BRINCO, '#13#10'  A.BRINCO_,'#13#10'  ' +
      'A.NOMEESTABULO,'#13#10'  AF.RETIRO RETIROORIGEM,'#13#10'  AF.RETIRO,'#13#10'  AF.D' +
      'ATARETIRO'#13#10'FROM ZOO_ANIMAIS_FEMEA AF'#13#10'INNER JOIN ZOO_ANIMAIS A O' +
      'N A.KZOO_ANIMAIS = AF.ZOO_ANIMAL_FEMEA'#13#10'WHERE A.KCAD_FAZENDA = :' +
      'KCAD_FAZENDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlTrocaRetiroKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlTrocaRetiroBRINCO: TStringField
      FieldName = 'BRINCO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlTrocaRetiroBRINCO_: TStringField
      FieldName = 'BRINCO_'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlTrocaRetiroNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlTrocaRetiroRETIROORIGEM: TStringField
      FieldName = 'RETIROORIGEM'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 32
    end
    object sqlTrocaRetiroRETIRO: TStringField
      FieldName = 'RETIRO'
      FixedChar = True
      Size = 32
    end
    object sqlTrocaRetiroDATARETIRO: TSQLTimeStampField
      FieldName = 'DATARETIRO'
    end
  end
end
