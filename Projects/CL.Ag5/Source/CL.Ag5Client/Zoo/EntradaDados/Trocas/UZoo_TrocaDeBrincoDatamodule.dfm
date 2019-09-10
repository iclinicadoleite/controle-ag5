object Zoo_TrocaDeBrincoDatamodule: TZoo_TrocaDeBrincoDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsTrocaBrinco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspTrocaBrinco'
    BeforePost = cdsTrocaBrincoBeforePost
    Left = 78
    Top = 12
    object cdsTrocaBrincoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsTrocaBrincoBRINCOORIGEM: TStringField
      DisplayLabel = 'Brinco antigo'
      FieldName = 'BRINCOORIGEM'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsTrocaBrincoBRINCOORIGEM_: TStringField
      FieldName = 'BRINCOORIGEM_'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 32
    end
    object cdsTrocaBrincoNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsTrocaBrincoBRINCO: TStringField
      DisplayLabel = 'Brinco novo'
      FieldName = 'BRINCO'
      Required = True
      OnValidate = cdsTrocaBrincoBRINCOValidate
      Size = 15
    end
    object cdsTrocaBrincoDATABRINCO: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATABRINCO'
      Required = True
    end
  end
  object dspTrocaBrinco: TDataSetProvider
    DataSet = sqlTrocaBrinco
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspTrocaBrincoBeforeUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlTrocaBrinco: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  KZOO_ANIMAL,'#13#10'  BRINCO BRINCOORIGEM, '#13#10'  BRINCO_ BRIN' +
      'COORIGEM_, '#13#10'  NOMEESTABULO,'#13#10'  BRINCO, '#13#10'  DATABRINCO'#13#10'FROM ZOO' +
      '_ANIMAIS'#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA'
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
    object sqlTrocaBrincoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlTrocaBrincoBRINCOORIGEM: TStringField
      FieldName = 'BRINCOORIGEM'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlTrocaBrincoBRINCOORIGEM_: TStringField
      FieldName = 'BRINCOORIGEM_'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlTrocaBrincoNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlTrocaBrincoBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlTrocaBrincoDATABRINCO: TSQLTimeStampField
      FieldName = 'DATABRINCO'
    end
  end
end
