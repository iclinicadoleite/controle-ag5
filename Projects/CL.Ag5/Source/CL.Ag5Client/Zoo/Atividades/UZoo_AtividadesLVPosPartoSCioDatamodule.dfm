object Zoo_AtividadesLVPosPartoSCioDatamodule: TZoo_AtividadesLVPosPartoSCioDatamodule
  OldCreateOrder = True
  Height = 240
  Width = 359
  object cdsAPartosSemCio: TClientDataSet
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
        Name = 'DIASPOSPARTO_SEMCIO_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASPOSPARTO_SEMCIO_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspAPartosSemCio'
    BeforeOpen = cdsAPartosSemCioBeforeOpen
    Left = 81
    Top = 9
    object cdsAPartosSemCioKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsAPartosSemCioBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsAPartosSemCioBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsAPartosSemCioNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsAPartosSemCioLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsAPartosSemCioTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
      Visible = False
    end
    object cdsAPartosSemCioDESC_EVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldKind = fkLookup
      FieldName = 'DESC_EVENTO'
      LookupDataSet = cdsTipoEvento
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOEVENTO'
      Visible = False
      Size = 32
      Lookup = True
    end
    object cdsAPartosSemCioDDP: TLargeintField
      DisplayLabel = 'DPP'
      FieldName = 'DDP'
    end
    object cdsAPartosSemCioDATA: TSQLTimeStampField
      DisplayLabel = 'Data do parto'
      FieldName = 'DATA'
    end
    object cdsAPartosSemCioULTIMO_DIAGNOSTICO: TStringField
      DisplayLabel = #218'lt. Diagn'#243'stico'
      FieldName = 'ULTIMO_DIAGNOSTICO'
      Size = 128
    end
    object cdsAPartosSemCioULTIMO_PROTOCOLO: TStringField
      DisplayLabel = #218'lt. Protocolo'
      FieldName = 'ULTIMO_PROTOCOLO'
      Size = 128
    end
    object cdsAPartosSemCioULTIMA_TAREFA: TStringField
      DisplayLabel = #218'lt. Tarefa'
      FieldName = 'ULTIMA_TAREFA'
      Size = 128
    end
  end
  object dspAPartosSemCio: TDataSetProvider
    DataSet = sqlAPartosSemCio
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 46
    Top = 57
  end
  object sqlAPartosSemCio: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BR' +
      'INCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  DAF.LOTE,'#13#10 +
      '  EZ.TIPOEVENTO,'#13#10'  DATEDIFF(DAY, CAST(DAF.ULTIMA_LACTACAO AS DA' +
      'TE), CURRENT_DATE ) DDP,'#13#10'  DAF.ULTIMA_LACTACAO DATA,'#13#10'  (    SE' +
      'LECT AD.NOME FROM ZOO_ANIMAL_DIAGNOSTICOS AD'#13#10'        WHERE AD.K' +
      'ZOO_ANIMAL_FEMEA = DAF.KZOO_ANIMAL_FEMEA'#13#10'        ORDER BY AD.DA' +
      'TASTATUS DESC'#13#10'         ROWS 1'#13#10'   ) ULTIMO_DIAGNOSTICO,'#13#10'  (   ' +
      ' SELECT AP.NOME FROM ZOO_ANIMAL_PROTOCOLOS AP'#13#10'        WHERE AP.' +
      'KZOO_ANIMAL_FEMEA = DAF.KZOO_ANIMAL_FEMEA'#13#10'        ORDER BY AP.D' +
      'ATASTATUS DESC'#13#10'         ROWS 1'#13#10'   ) ULTIMO_PROTOCOLO,'#13#10'  (    ' +
      'SELECT ATA.NOME'#13#10'         FROM ZOO_ANIMAL_TAREFAS ATA'#13#10'        W' +
      'HERE ATA.KZOO_ANIMAL = DAF.KZOO_ANIMAL_FEMEA'#13#10'        ORDER BY A' +
      'TA.DATASTATUS DESC'#13#10'         ROWS 1'#13#10'   ) ULTIMA_TAREFA'#13#10'FROM ZO' +
      'O_ANIMAIS_FEMEA DAF'#13#10'JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = DAF' +
      '.KZOO_ANIMAL_FEMEA'#13#10'JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_E' +
      'VENTO_ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO'#13#10'WHERE ( AF. KC' +
      'AD_FAZENDA = :KCAD_FAZENDA ) --sz2AmnoiPZzE7N5li_evUl'#13#10'  AND ( A' +
      'F.STATUS IS DISTINCT FROM :DESCARTADA )'#13#10'  AND ( DAF.INTENCAO_DE' +
      'SCARTE IS DISTINCT FROM '#39'T'#39' )'#13#10'  AND ( DAF.KULTIMO_EVENTO_ZOOTEC' +
      'NICO = DAF.KULTIMO_EVENTOLACTACAO )'#13#10'  AND ( IIF( DAF.NUMERO_LAC' +
      'TACAO > 1,'#13#10'             DATEADD(:DIASPOSPARTO_SEMCIO_MULTIPARA ' +
      'DAY TO DAF.ULTIMA_LACTACAO),'#13#10'             DATEADD(:DIASPOSPARTO' +
      '_SEMCIO_PRIMIPARA DAY TO DAF.ULTIMA_LACTACAO)'#13#10'            ) <= ' +
      ':DATAFIM'#13#10'       )'#13#10'ORDER BY EZ.DATAEVENTO, AF.BRINCO_'
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
        Name = 'DIASPOSPARTO_SEMCIO_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASPOSPARTO_SEMCIO_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 81
    Top = 104
    object sqlAPartosSemCioKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlAPartosSemCioBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlAPartosSemCioBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlAPartosSemCioNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlAPartosSemCioLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlAPartosSemCioTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlAPartosSemCioDDP: TLargeintField
      FieldName = 'DDP'
    end
    object sqlAPartosSemCioDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlAPartosSemCioULTIMO_DIAGNOSTICO: TStringField
      FieldName = 'ULTIMO_DIAGNOSTICO'
      Size = 128
    end
    object sqlAPartosSemCioULTIMO_PROTOCOLO: TStringField
      FieldName = 'ULTIMO_PROTOCOLO'
      Size = 128
    end
    object sqlAPartosSemCioULTIMA_TAREFA: TStringField
      FieldName = 'ULTIMA_TAREFA'
      Size = 128
    end
  end
  object cdsTipoEvento: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 280
    Top = 16
    object cdsTipoEventoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 31
    end
    object cdsTipoEventoVALOR: TStringField
      FieldName = 'VALOR'
      Size = 31
    end
    object cdsTipoEventoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 31
    end
    object cdsTipoEventoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
