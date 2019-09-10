object Zoo_AtividadesSecagemDatamodule: TZoo_AtividadesSecagemDatamodule
  OldCreateOrder = True
  Height = 246
  Width = 398
  object cdsASecagens: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASSECAGEM_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASSECAGEM_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspASecagens'
    BeforeOpen = cdsASecagensBeforeOpen
    OnCalcFields = cdsASecagensCalcFields
    Left = 73
    Top = 12
    object cdsASecagensKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsASecagensBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsASecagensBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsASecagensNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsASecagensULTIMA_MONTA: TSQLTimeStampField
      FieldName = 'ULTIMA_MONTA'
      Visible = False
    end
    object cdsASecagensDATA_PREVISTA: TDateField
      DisplayLabel = 'Data Prevista'
      FieldKind = fkInternalCalc
      FieldName = 'DATA_PREVISTA'
    end
    object cdsASecagensLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsASecagensNUMERO_LACTACAO: TIntegerField
      FieldName = 'NUMERO_LACTACAO'
      Visible = False
    end
    object cdsASecagensULTIMAPRODUCAO: TFloatField
      DisplayLabel = #218'ltima Produ'#231#227'o'
      FieldName = 'ULTIMAPRODUCAO'
      DisplayFormat = '0.00'
    end
    object cdsASecagensCCS: TIntegerField
      FieldName = 'CCS'
    end
  end
  object dspASecagens: TDataSetProvider
    DataSet = sqlASecagens
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlASecagens: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,' +
      #13#10'  AF.BRINCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  DA' +
      'F.ULTIMA_MONTA,'#13#10'  DAF.LOTE,'#13#10'  DAF.NUMERO_LACTACAO,'#13#10'  P.TOTAL ' +
      'ULTIMAPRODUCAO,'#13#10'  (   SELECT CCS'#13#10'        FROM ZOO_PESAGEM_LEIT' +
      'E_ANALISE'#13#10'       WHERE KZOO_LACTACAO = DAF.KULTIMA_LACTACAO'#13#10'  ' +
      '     ORDER BY DATA DESC'#13#10'        ROWS 1'#13#10'   ) CCS'#13#10'FROM ZOO_ANIM' +
      'AIS AF'#13#10'JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF' +
      '.KZOO_ANIMAL'#13#10'JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_' +
      'ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO'#13#10'LEFT JOIN ZOO_LACTAC' +
      'OES L ON L.KZOO_LACTACAO = DAF.KULTIMA_LACTACAO'#13#10'LEFT JOIN ZOO_P' +
      'ESAGEM_LEITE P ON P.KZOO_PESAGEM_LEITE = L.KULTIMA_PESAGEMLEITE'#13 +
      #10'WHERE AF.KCAD_FAZENDA = :KCAD_FAZENDA'#13#10'  AND (     DAF.KULTIMO_' +
      'EVENTO_ZOOTECNICO = DAF.KULTIMA_MONTA'#13#10'        AND EZ.DATAABORTO' +
      'PARTO IS NULL'#13#10'       )'#13#10'  AND AF.STATUS = :VL'#13#10'  AND EZ.PRENHEZ' +
      ' = '#39'T'#39#13#10'  AND (     (( DAF.NUMERO_LACTACAO >= 2 ) AND ( DATEADD(' +
      ' :DIASSECAGEM_MULTIPARA DAY TO DAF.ULTIMA_MONTA ) <= :DATAFIM))'#13 +
      #10'         OR (( DAF.NUMERO_LACTACAO <= 1 ) AND ( DATEADD( :DIASS' +
      'ECAGEM_PRIMIPARA DAY TO DAF.ULTIMA_MONTA ) <= :DATAFIM))'#13#10'      ' +
      ' )'#13#10'ORDER BY AF.BRINCO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASSECAGEM_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASSECAGEM_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlASecagensKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlASecagensBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlASecagensBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlASecagensNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlASecagensULTIMA_MONTA: TSQLTimeStampField
      FieldName = 'ULTIMA_MONTA'
    end
    object sqlASecagensLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlASecagensNUMERO_LACTACAO: TIntegerField
      FieldName = 'NUMERO_LACTACAO'
    end
    object sqlASecagensULTIMAPRODUCAO: TFloatField
      FieldName = 'ULTIMAPRODUCAO'
      DisplayFormat = '0.00'
    end
    object sqlASecagensCCS: TIntegerField
      FieldName = 'CCS'
    end
  end
end
