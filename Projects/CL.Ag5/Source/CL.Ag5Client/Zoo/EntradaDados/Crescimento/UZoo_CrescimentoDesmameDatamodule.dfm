object Zoo_CrescimentoDesmameDatamodule: TZoo_CrescimentoDesmameDatamodule
  OldCreateOrder = True
  Height = 282
  Width = 481
  object cdsDesmame: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'STATUS_BEZERRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PESO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDesmame'
    BeforeOpen = cdsDesmameBeforeOpen
    Left = 78
    Top = 12
    object cdsDesmameKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      FixedChar = True
    end
    object cdsDesmameBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 15
    end
    object cdsDesmameNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 60
    end
    object cdsDesmameIDADE: TLargeintField
      DisplayLabel = 'Idade'
      FieldName = 'IDADE'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Required = True
    end
    object cdsDesmameSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
      OnChange = cdsDesmameSTATUSChange
    end
    object cdsDesmameDESCR_STATUS: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusAnimal
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      ProviderFlags = [pfInWhere]
      Size = 31
      Lookup = True
    end
    object cdsDesmamePESO: TIntegerField
      DisplayLabel = #218'timo peso'
      FieldName = 'PESO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsDesmameDATADESMAME: TSQLTimeStampField
      DisplayLabel = 'Data Desmame'
      FieldName = 'DATADESMAME'
      OnChange = cdsDesmameDATADESMAMEChange
    end
  end
  object dspDesmame: TDataSetProvider
    DataSet = sqlDesmame
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspDesmameAfterUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlDesmame: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  E.KZOO_ANIMAL,'#13#10'  E.BRINCO,'#13#10'  E.NOMEESTABULO,'#13#10'  E.S' +
      'TATUS,'#13#10' E.DATADESMAME,'#13#10'  DateDiff(day, A.NASCIMENTO, Current_D' +
      'ate) as Idade,'#13#10'  A.MAIOR_PESO as Peso'#13#10'FROM'#13#10' ZOO_ANIMAIS E'#13#10' I' +
      'NNER JOIN ZOO_ANIMAIS_FEMEA A'#13#10'        ON(A.KZOO_ANIMAL_FEMEA = ' +
      'E.KZOO_ANIMAL)'#13#10'WHERE STATUS = :STATUS_BEZERRA'#13#10'AND ( DateDiff(d' +
      'ay, A.NASCIMENTO, Current_Date)  >= :DIAS'#13#10'       OR A.MAIOR_PES' +
      'O >= :PESO )'#13#10'order by E.BRINCO'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'STATUS_BEZERRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PESO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlDesmameKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDesmameBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlDesmameNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlDesmameIDADE: TLargeintField
      DisplayLabel = 'Idade'
      FieldName = 'IDADE'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sqlDesmameSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object sqlDesmamePESO: TIntegerField
      DisplayLabel = #218'ltimo peso'
      FieldName = 'PESO'
      ProviderFlags = [pfInWhere]
    end
    object sqlDesmameDATADESMAME: TSQLTimeStampField
      FieldName = 'DATADESMAME'
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
    Left = 336
    Top = 23
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
