object Zoo_AtividadesDesmameDatamodule: TZoo_AtividadesDesmameDatamodule
  OldCreateOrder = True
  Height = 280
  Width = 387
  object cdsADesmame: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BEZERRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDADE_DESMAME'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PESO_DESMAME'
        ParamType = ptInput
      end>
    ProviderName = 'dspADesmame'
    BeforeOpen = cdsADesmameBeforeOpen
    Left = 78
    Top = 12
    object cdsADesmameKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsADesmameBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsADesmameBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsADesmameNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsADesmameLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsADesmameIDADE: TLargeintField
      DisplayLabel = 'Idade (dias)'
      FieldName = 'IDADE'
      Required = True
    end
    object cdsADesmamePESO: TIntegerField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object cdsADesmamePESO_NASCIMENTO: TIntegerField
      DisplayLabel = 'Peso ao nascimento'
      FieldName = 'PESO_NASCIMENTO'
    end
  end
  object dspADesmame: TDataSetProvider
    DataSet = sqlADesmame
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlADesmame: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA,'#13#10'  AF.BRINCO BRINCOFEMEA,'#13#10'  AF' +
      '.BRINCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  DAF.LOTE' +
      ','#13#10'  DATEDIFF(DAY, CAST(DAF.NASCIMENTO AS DATE), :DATA ) IDADE,'#13 +
      #10'  (  SELECT AC.PESO'#13#10'       FROM ZOO_ANIMAL_CRESCIMENTO AC'#13#10'   ' +
      '   WHERE AC.KZOO_ANIMAL = AF.KZOO_ANIMAL'#13#10'      ORDER BY AC.DATA' +
      ' DESC'#13#10'      ROWS 1'#13#10'   )PESO,'#13#10'   C.PESO PESO_NASCIMENTO'#13#10'FROM ' +
      'ZOO_ANIMAIS_FEMEA DAF'#13#10'JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = D' +
      'AF.KZOO_ANIMAL_FEMEA'#13#10'LEFT JOIN ZOO_ANIMAL_CRESCIMENTO C ON DAF.' +
      'KCRESCIMENTO_NASCIMENTO = C.KZOO_ANIMAL_CRESCIMENTO'#13#10'WHERE AF.KC' +
      'AD_FAZENDA = :KCAD_FAZENDA'#13#10'  AND AF.STATUS = :BEZERRA'#13#10'  AND ( ' +
      '  DATEADD ( :IDADE_DESMAME DAY TO DAF.NASCIMENTO ) <= :DATA'#13#10'   ' +
      '       OR ('#13#10'              ( SELECT AC.PESO'#13#10'                 FR' +
      'OM ZOO_ANIMAL_CRESCIMENTO AC'#13#10'                WHERE AC.KZOO_ANIM' +
      'AL = AF.KZOO_ANIMAL'#13#10'                ORDER BY AC.DATA DESC'#13#10'    ' +
      '            ROWS 1'#13#10'               ) >= :PESO_DESMAME )'#13#10'       ' +
      ')'#13#10'ORDER BY DAF.NASCIMENTO, AF.BRINCO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BEZERRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDADE_DESMAME'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PESO_DESMAME'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlADesmameKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlADesmameBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlADesmameBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlADesmameNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlADesmameLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlADesmameIDADE: TLargeintField
      FieldName = 'IDADE'
      Required = True
    end
    object sqlADesmamePESO: TIntegerField
      FieldName = 'PESO'
    end
    object sqlADesmamePESO_NASCIMENTO: TIntegerField
      DisplayLabel = 'Peso ao nascimento'
      FieldName = 'PESO_NASCIMENTO'
    end
  end
end
