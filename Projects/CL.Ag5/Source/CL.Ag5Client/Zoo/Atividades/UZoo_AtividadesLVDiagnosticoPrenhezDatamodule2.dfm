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
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DOADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA_1X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA_1X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA_2X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA_2X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMBRIAO'
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
    object cdsADiagnosticoPrenhezQTDE_COBERTURA: TIntegerField
      DisplayLabel = 'N'#250'mero da cobertura'
      FieldName = 'QTDE_COBERTURA'
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
      Visible = False
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
      '  (SELECT QTDE_COBERTURA FROM ZOO_GET_QTDE_COBERTURA_LACTACAO(EZ' +
      '.KZOO_ANIMAL_FEMEA, EZ.DATAEVENTO)) QTDE_COBERTURA,'#13#10'  DAF.ULTIM' +
      'A_MONTA,'#13#10'  DATEDIFF(DAY, CAST(DAF.ULTIMO_EVENTO_ZOOTECNICO AS D' +
      'ATE), CURRENT_DATE) DIAS_DO_EVENTO,'#13#10'  EZ.IATF,'#13#10'  PI.CODIGO DES' +
      'C_PROTOCOLO_IATF'#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS EZ'#13#10'LEFT JOIN ZOO' +
      '_ANIMAIS AF ON AF.KZOO_ANIMAL = EZ.KZOO_ANIMAL_FEMEA'#13#10'LEFT JOIN ' +
      'ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = EZ.KZOO_ANIMAL_' +
      'FEMEA'#13#10'LEFT JOIN ZOO_PROTOCOLOS PI ON PI.KZOO_PROTOCOLO = EZ.KZO' +
      'O_PROTOCOLO_IATF'#13#10'WHERE'#13#10'        ( AF.KCAD_FAZENDA = :KCAD_FAZEN' +
      'DA ) AND (AF.STATUS <> :STATUS_DESCARTADO)'#13#10'AND  ( EZ.KZOO_EVENT' +
      'O_ZOOTECNICO = DAF.KULTIMA_MONTA )'#13#10'AND  ('#13#10'                ( DA' +
      'F.KULTIMO_CIO IS NULL )'#13#10'          OR ( DAF.ULTIMO_CIO < DAF.ULT' +
      'IMA_MONTA  )'#13#10'        )'#13#10'AND ( DAF.DOADOR_RECEPTOR  IS DISTINCT ' +
      'FROM  :DOADOR )'#13#10'AND ( EZ.DATAABORTOPARTO IS NULL )'#13#10'AND ( EZ.PR' +
      'ENHEZ IS DISTINCT FROM '#39'F'#39' )'#13#10'  AND ( DATEADD('#13#10'          (CASE ' +
      'EZ.QTDE_DIAGNOSTICO'#13#10'           WHEN 0 THEN IIF ( DAF.NUMERO_LAC' +
      'TACAO > 1'#13#10'                         , CAST ( :DIAS_CONFIRMAR_MUL' +
      'TIPARA AS INTEGER )'#13#10'                         , CAST ( :DIAS_CON' +
      'FIRMAR_PRIMIPARA AS INTEGER )    )'#13#10'           WHEN 1 THEN IIF (' +
      ' DAF.NUMERO_LACTACAO > 1'#13#10'                         , CAST ( :DIA' +
      'S_CONFIRMAR_MULTIPARA_1X AS INTEGER )'#13#10'                         ' +
      ', CAST ( :DIAS_CONFIRMAR_PRIMIPARA_1X AS INTEGER ) )'#13#10'          ' +
      ' WHEN 2 THEN IIF ( DAF.NUMERO_LACTACAO > 1'#13#10'                    ' +
      '     , CAST ( :DIAS_CONFIRMAR_MULTIPARA_2X AS INTEGER )'#13#10'       ' +
      '                  , CAST ( :DIAS_CONFIRMAR_PRIMIPARA_2X AS INTEG' +
      'ER ) )'#13#10'           END'#13#10'          ) DAY TO (   EZ.DATAEVENTO'#13#10'  ' +
      '                   - IIF( EZ.TIPOEVENTO = :EMBRIAO, 7, 0)'#13#10'     ' +
      '              )'#13#10'        ) <= :DATA'#13#10'      )'#13#10'ORDER BY EZ.DATAEV' +
      'ENTO, AF.BRINCO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DOADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA_1X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA_1X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_MULTIPARA_2X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRIMIPARA_2X'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMBRIAO'
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
    object sqlADiagnosticoPrenhezQTDE_COBERTURA: TIntegerField
      DisplayLabel = 'N'#250'mero da cobertura'
      FieldName = 'QTDE_COBERTURA'
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
