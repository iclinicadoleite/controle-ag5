object Zoo_TrocaDeLoteDatamodule: TZoo_TrocaDeLoteDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsTrocaLote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTrocaLote'
    BeforePost = cdsTrocaLoteBeforePost
    Left = 78
    Top = 12
    object cdsTrocaLoteKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsTrocaLoteBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsTrocaLoteBRINCO_: TStringField
      FieldName = 'BRINCO_'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 32
    end
    object cdsTrocaLoteNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsTrocaLoteLOTEORIGEM: TStringField
      DisplayLabel = 'Lote atual'
      FieldName = 'LOTEORIGEM'
      ProviderFlags = [pfInWhere]
      Size = 5
    end
    object cdsTrocaLoteLOTE: TStringField
      DisplayLabel = 'Novo lote'
      FieldName = 'LOTE'
      OnSetText = cdsTrocaLoteLOTESetText
      Size = 5
    end
    object cdsTrocaLoteDATALOTE: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATALOTE'
      Required = True
    end
    object cdsTrocaLotePROCESSAR: TStringField
      FieldName = 'PROCESSAR'
      Size = 1
    end
  end
  object dspTrocaLote: TDataSetProvider
    DataSet = sqlTrocaLote
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspTrocaLoteBeforeUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlTrocaLote: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  AF.KZOO_ANIMAL_FEMEA,'#13#10'  A.BRINCO, '#13#10'  A.BRINCO_, '#13#10' ' +
      ' A.NOMEESTABULO,'#13#10'  AF.LOTE LOTEORIGEM,'#13#10'  AF.LOTE,'#13#10'  AF.DATALO' +
      'TE'#13#10'FROM ZOO_ANIMAIS_FEMEA AF'#13#10'INNER JOIN ZOO_ANIMAIS A ON A.KZO' +
      'O_ANIMAIS = AF.ZOO_ANIMAL_FEMEA'#13#10'WHERE A.KCAD_FAZENDA = :KCAD_FA' +
      'ZENDA'
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
    object sqlTrocaLoteKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlTrocaLoteBRINCO: TStringField
      FieldName = 'BRINCO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlTrocaLoteBRINCO_: TStringField
      FieldName = 'BRINCO_'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlTrocaLoteNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlTrocaLoteLOTEORIGEM: TStringField
      FieldName = 'LOTEORIGEM'
      ProviderFlags = [pfInWhere]
      Size = 5
    end
    object sqlTrocaLoteLOTE: TStringField
      FieldName = 'LOTE'
      Size = 5
    end
    object sqlTrocaLoteDATALOTE: TSQLTimeStampField
      FieldName = 'DATALOTE'
    end
    object sqlTrocaLotePROCESSAR: TStringField
      FieldName = 'PROCESSAR'
      Size = 1
    end
  end
end
