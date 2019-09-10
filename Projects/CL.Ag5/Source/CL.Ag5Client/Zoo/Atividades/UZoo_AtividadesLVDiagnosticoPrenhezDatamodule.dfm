object Zoo_AtividadesLVDiagnosticoPrenhezDatamodule: TZoo_AtividadesLVDiagnosticoPrenhezDatamodule
  OldCreateOrder = True
  Height = 249
  Width = 382
  object cdsADiagnosticoPrenhez: TClientDataSet
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
        Name = 'ANIMAL_DOADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_PRENHEZ_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_PRENHEZ_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspADiagnosticoPrenhez'
    BeforeOpen = cdsADiagnosticoPrenhezBeforeOpen
    Left = 80
    Top = 7
    object cdsADiagnosticoPrenhezKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsADiagnosticoPrenhezBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsADiagnosticoPrenhezBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsADiagnosticoPrenhezNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsADiagnosticoPrenhezLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsADiagnosticoPrenhezULTIMA_MONTA: TSQLTimeStampField
      DisplayLabel = #218'ltima cobertura'
      FieldName = 'ULTIMA_MONTA'
    end
    object cdsADiagnosticoPrenhezDIAS_DO_EVENTO: TLargeintField
      DisplayLabel = 'Dias da '#250'lt. cobertura'
      FieldName = 'DIAS_DO_EVENTO'
    end
    object cdsADiagnosticoPrenhezIATF: TStringField
      FieldName = 'IATF'
      Required = True
      OnGetText = cdsADiagnosticoPrenhezIATFGetText
      FixedChar = True
      Size = 1
    end
    object cdsADiagnosticoPrenhezDESC_PROTOCOLO_IATF: TStringField
      DisplayLabel = 'Protocolo IATF'
      FieldName = 'DESC_PROTOCOLO_IATF'
      Size = 32
    end
  end
  object dspADiagnosticoPrenhez: TDataSetProvider
    DataSet = sqlADiagnosticoPrenhez
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 54
    Top = 57
  end
  object sqlADiagnosticoPrenhez: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BR' +
      'INCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  DAF.LOTE,'#13#10 +
      '  DAF.ULTIMA_MONTA,'#13#10'  DATEDIFF(DAY, CAST(DAF.ULTIMO_EVENTO_ZOOT' +
      'ECNICO AS DATE), CURRENT_DATE) DIAS_DO_EVENTO, '#13#10'  EZ.IATF, '#13#10'  ' +
      'PI.CODIGO DESC_PROTOCOLO_IATF'#13#10'FROM ZOO_ANIMAIS_FEMEA DAF'#13#10'JOIN ' +
      'ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = DAF.KZOO_ANIMAL_FEMEA'#13#10'JOIN Z' +
      'OO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KUL' +
      'TIMO_EVENTO_ZOOTECNICO'#13#10'LEFT JOIN ZOO_PROTOCOLOS PI ON PI.KZOO_P' +
      'ROTOCOLO = EZ.KZOO_PROTOCOLO_IATF'#13#10'WHERE AF.KCAD_FAZENDA = :KCAD' +
      '_FAZENDA --hr)\u/F@1JO!0(YZjM,/'#13#10'  AND AF.STATUS IS DISTINCT FRO' +
      'M :DESCARTADA'#13#10'  AND DAF.DOADOR_RECEPTOR IS DISTINCT FROM :ANIMA' +
      'L_DOADOR'#13#10'  AND (   DAF.KULTIMO_EVENTO_ZOOTECNICO = DAF.KULTIMA_' +
      'MONTA'#13#10'          AND ( EZ.PRENHEZ IS NULL OR EZ.DATATOQUE IS NUL' +
      'L )'#13#10'          AND ( DAF.KULTIMA_MONTA > DAF.KULTIMA_LACTACAO'#13#10' ' +
      '               OR (EZ.ABORTOPARTO IS NULL)'#13#10'               )'#13#10'  ' +
      '     )'#13#10'  AND (  IIF (  DAF.NUMERO_LACTACAO > 1,'#13#10'              ' +
      '  DATEADD(:DIAS_PRENHEZ_MULTIPARA DAY TO EZ.DATAEVENTO),'#13#10'      ' +
      '          DATEADD(:DIAS_PRENHEZ_PRIMIPARA DAY TO EZ.DATAEVENTO)'#13 +
      #10'              ) <= :DATA'#13#10'       )'#13#10'ORDER BY EZ.DATAEVENTO, AF.' +
      'BRINCO_'
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
        Name = 'ANIMAL_DOADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_PRENHEZ_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_PRENHEZ_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 88
    Top = 114
    object sqlADiagnosticoPrenhezKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlADiagnosticoPrenhezBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlADiagnosticoPrenhezBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlADiagnosticoPrenhezNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlADiagnosticoPrenhezLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlADiagnosticoPrenhezULTIMA_MONTA: TSQLTimeStampField
      FieldName = 'ULTIMA_MONTA'
    end
    object sqlADiagnosticoPrenhezDIAS_DO_EVENTO: TLargeintField
      FieldName = 'DIAS_DO_EVENTO'
    end
    object sqlADiagnosticoPrenhezIATF: TStringField
      FieldName = 'IATF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlADiagnosticoPrenhezDESC_PROTOCOLO_IATF: TStringField
      DisplayLabel = 'Protocolo IATF'
      FieldName = 'DESC_PROTOCOLO_IATF'
      Size = 32
    end
  end
end
