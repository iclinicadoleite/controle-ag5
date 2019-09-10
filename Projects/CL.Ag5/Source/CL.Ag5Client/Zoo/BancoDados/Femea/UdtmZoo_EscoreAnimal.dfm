object dtmZoo_EscoreAnimal: TdtmZoo_EscoreAnimal
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsEscores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEscores'
    OnNewRecord = cdsEscoresNewRecord
    Left = 78
    Top = 12
    object cdsEscoresKZOO_E: TStringField
      FieldName = 'KZOO_E'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEscoresKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEscoresBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      Visible = False
      Size = 15
    end
    object cdsEscoresNOMEESTABULO: TStringField
      DisplayLabel = 'Nome Estabulo'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      Visible = False
      Size = 60
    end
    object cdsEscoresDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsEscoresLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsEscoresKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object cdsEscoresNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
  end
  object dspEscores: TDataSetProvider
    DataSet = sqlEscores
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlEscores: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 'SELECT * '#13#10'FROM ZOO_E_F0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlEscoresKZOO_E: TStringField
      FieldName = 'KZOO_E'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEscoresKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEscoresDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlEscoresLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlEscoresKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object sqlEscoresNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
  end
end
