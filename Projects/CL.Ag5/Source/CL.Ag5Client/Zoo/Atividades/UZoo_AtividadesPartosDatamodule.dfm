object Zoo_AtividadesPartosDatamodule: TZoo_AtividadesPartosDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 279
  object cdsAPartos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DOADORA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASPARAPARTO_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASPARAPARTO_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRENHEZ_NAO_CONFIRMADA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAPartos'
    BeforeOpen = cdsAPartosBeforeOpen
    OnCalcFields = cdsAPartosCalcFields
    Left = 73
    Top = 12
    object cdsAPartosKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsAPartosBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsAPartosBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsAPartosNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsAPartosDATACOBERTURA: TSQLTimeStampField
      DisplayLabel = 'Data '#250'lt. cob.'
      FieldName = 'DATACOBERTURA'
    end
    object cdsAPartosPREV_PARTO: TDateField
      DisplayLabel = 'Previs'#227'o parto'
      FieldKind = fkInternalCalc
      FieldName = 'PREV_PARTO'
    end
    object cdsAPartosLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsAPartosNUMERO_LACTACAO: TIntegerField
      FieldName = 'NUMERO_LACTACAO'
      Visible = False
    end
    object cdsAPartosTOURO: TStringField
      DisplayLabel = 'Touro'
      FieldName = 'TOURO'
      Size = 60
    end
  end
  object dspAPartos: TDataSetProvider
    DataSet = sqlAPartos
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlAPartos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BR' +
      'INCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  DAF.ULTIMA_' +
      'MONTA DATACOBERTURA,'#13#10'  DAF.NUMERO_LACTACAO,'#13#10'  DAF.LOTE,'#13#10'  AM.' +
      'NOMEESTABULO AS TOURO'#13#10'FROM ZOO_ANIMAIS AF'#13#10'JOIN ZOO_ANIMAIS_FEM' +
      'EA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'#13#10'JOIN ZOO_EVENT' +
      'OS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVE' +
      'NTO_ZOOTECNICO'#13#10'JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = EZ.KZOO_' +
      'ANIMAL_MACHO'#13#10'WHERE AF. KCAD_FAZENDA = :KCAD_FAZENDA'#13#10'  AND AF.S' +
      'TATUS IS DISTINCT FROM :DESCARTADA'#13#10'  AND DAF.INTENCAO_DESCARTE ' +
      'IS DISTINCT FROM '#39'T'#39#13#10'  AND DAF.DOADOR_RECEPTOR IS DISTINCT FROM' +
      ' :DOADORA'#13#10'  AND DAF.KULTIMO_EVENTO_ZOOTECNICO = DAF.KULTIMA_MON' +
      'TA'#13#10'  AND EZ.ABORTOPARTO IS NULL'#13#10'  AND EZ.ABORTOPARTO IS NULL'#13#10 +
      '  AND ( '#13#10'          (( DAF.NUMERO_LACTACAO > 1 ) AND ( DATEADD( ' +
      ':DIASPARAPARTO_MULTIPARA DAY TO DAF.ULTIMA_MONTA ) <= :DATA ))'#13#10 +
      '    OR (( DAF.NUMERO_LACTACAO <= 1 ) and ( dateadd( :DIASPARAPAR' +
      'TO_PRIMIPARA DAY TO DAF.ULTIMA_MONTA ) <= :DATA ))'#13#10'      )'#13#10' AN' +
      'D ( (DATATOQUE IS NOT NULL AND PRENHEZ = '#39'T'#39') OR (DATATOQUE IS N' +
      'ULL AND 1 = :PRENHEZ_NAO_CONFIRMADA ))'#13#10'ORDER BY AF.BRINCO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DOADORA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASPARAPARTO_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASPARAPARTO_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRENHEZ_NAO_CONFIRMADA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlAPartosKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlAPartosBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlAPartosBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlAPartosNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlAPartosDATACOBERTURA: TSQLTimeStampField
      FieldName = 'DATACOBERTURA'
    end
    object sqlAPartosLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlAPartosNUMERO_LACTACAO: TIntegerField
      FieldName = 'NUMERO_LACTACAO'
    end
    object sqlAPartosTOURO: TStringField
      DisplayLabel = 'Touro'
      FieldName = 'TOURO'
      Size = 60
    end
  end
end
