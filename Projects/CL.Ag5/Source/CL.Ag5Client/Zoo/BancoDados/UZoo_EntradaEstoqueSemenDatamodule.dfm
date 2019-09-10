object Zoo_EntradaEstoqueSemenDatamodule: TZoo_EntradaEstoqueSemenDatamodule
  OldCreateOrder = True
  Height = 247
  Width = 413
  object cdsEstoqueSemen: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoqueSemen'
    OnNewRecord = cdsEstoqueSemenNewRecord
    Left = 76
    Top = 9
    object cdsEstoqueSemenKZOO_ANIMAL_SEMEN_COMPRA: TStringField
      FieldName = 'KZOO_ANIMAL_SEMEN_COMPRA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEstoqueSemenKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEstoqueSemenBRINCO: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 13
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      Size = 32
    end
    object cdsEstoqueSemenNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 13
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      Size = 32
    end
    object cdsEstoqueSemenDATA: TSQLTimeStampField
      DisplayLabel = 'Data da compra'
      DisplayWidth = 14
      FieldName = 'DATA'
      Required = True
    end
    object cdsEstoqueSemenDOSES: TIntegerField
      DisplayLabel = 'N'#186' doses compradas'
      FieldName = 'DOSES'
      Required = True
      OnValidate = cdsEstoqueSemenDOSESValidate
    end
    object cdsEstoqueSemenVALORDOSE: TFloatField
      DisplayLabel = 'Valor / dose (R$)'
      FieldName = 'VALORDOSE'
      OnValidate = cdsEstoqueSemenVALORDOSEValidate
    end
  end
  object dspEstoqueSemen: TDataSetProvider
    DataSet = sqlEstoqueSemen
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlEstoqueSemen: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  KZOO_ANIMAL_SEMEN_COMPRA,'#13#10'  KZOO_ANIMAL_MACHO,'#13#10'  DAT' +
      'A,'#13#10'  DOSES,'#13#10'  VALORDOSE'#13#10'FROM ZOO_ANIMAL_SEMEN_COMPRA'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 76
    Top = 105
    object sqlEstoqueSemenKZOO_ANIMAL_SEMEN_COMPRA: TStringField
      FieldName = 'KZOO_ANIMAL_SEMEN_COMPRA'
      Required = True
      FixedChar = True
    end
    object sqlEstoqueSemenKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      FixedChar = True
    end
    object sqlEstoqueSemenDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlEstoqueSemenDOSES: TIntegerField
      FieldName = 'DOSES'
      Required = True
    end
    object sqlEstoqueSemenVALORDOSE: TFloatField
      FieldName = 'VALORDOSE'
    end
  end
end
