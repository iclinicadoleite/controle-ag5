object Zoo_AtividadesLVRecemParidosDatamodule: TZoo_AtividadesLVRecemParidosDatamodule
  OldCreateOrder = True
  Height = 232
  Width = 319
  object cdsARecemParidos: TClientDataSet
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
        Name = 'MAX_DEL_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MAX_DEL_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspARecemParidos'
    BeforeOpen = cdsARecemParidosBeforeOpen
    Left = 78
    Top = 12
    object cdsARecemParidosKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsARecemParidosBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsARecemParidosBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsARecemParidosNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsARecemParidosDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATAEVENTO'
      Visible = False
    end
    object cdsARecemParidosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
      Visible = False
    end
    object cdsARecemParidosDESC_EVENTO: TStringField
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
    object cdsARecemParidosLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsARecemParidosNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object cdsARecemParidosULTIMO_DIAGNOSTICO: TStringField
      DisplayLabel = #218'lt. Diagn'#243'stico'
      FieldName = 'ULTIMO_DIAGNOSTICO'
      Size = 128
    end
    object cdsARecemParidosULTIMO_PROTOCOLO: TStringField
      DisplayLabel = #218'lt. Protocolo'
      FieldName = 'ULTIMO_PROTOCOLO'
      Size = 128
    end
  end
  object dspARecemParidos: TDataSetProvider
    DataSet = sqlARecemParidos
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlARecemParidos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BR' +
      'INCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  EZ.DATAEVEN' +
      'TO,'#13#10'  EZ.TIPOEVENTO,'#13#10'  DAF.LOTE,'#13#10'  EZ.NOMEFUNCIONARIO,'#13#10'  (SE' +
      'LECT AD.NOME FROM ZOO_ANIMAL_DIAGNOSTICOS AD'#13#10'    WHERE AD.KZOO_' +
      'ANIMAL_FEMEA = DAF.KZOO_ANIMAL_FEMEA'#13#10'    ORDER BY AD.DATA DESC'#13 +
      #10'     ROWS 1) ULTIMO_DIAGNOSTICO,'#13#10'  (SELECT AP.NOME FROM ZOO_AN' +
      'IMAL_PROTOCOLOS AP'#13#10'    WHERE AP.KZOO_ANIMAL_FEMEA = DAF.KZOO_AN' +
      'IMAL_FEMEA'#13#10'    ORDER BY AP.DATA DESC'#13#10'     ROWS 1 ) ULTIMO_PROT' +
      'OCOLO'#13#10'FROM ZOO_ANIMAIS AF'#13#10'JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZ' +
      'OO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'#13#10'JOIN ZOO_EVENTOS_ZOOTECNICOS E' +
      'Z ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO'#13#10 +
      'WHERE ( AF.KCAD_FAZENDA = :KCAD_FAZENDA ) --sz2AmnoiPZzE7N5li_ev' +
      'Ul'#13#10'  AND ( AF.STATUS IS DISTINCT FROM :DESCARTADA )'#13#10'  AND ( DA' +
      'F.INTENCAO_DESCARTE IS DISTINCT FROM '#39'T'#39' )'#13#10'  AND ( DAF.KULTIMO_' +
      'EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTOLACTACAO )'#13#10'  AND ( (IIF( ' +
      'DAF.NUMERO_LACTACAO <= 1,'#13#10'              DATEADD(:MAX_DEL_PRIMIP' +
      'ARA DAY TO DAF.ULTIMA_LACTACAO),'#13#10'              DATEADD(:MAX_DEL' +
      '_MULTIPARA DAY TO DAF.ULTIMA_LACTACAO) )  >= :DATAINICIO )'#13#10'    ' +
      '   )'#13#10'ORDER BY EZ.DATAEVENTO, AF.BRINCO_'
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
        Name = 'MAX_DEL_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MAX_DEL_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlARecemParidosKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlARecemParidosBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlARecemParidosBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlARecemParidosNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlARecemParidosDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
    end
    object sqlARecemParidosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlARecemParidosLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlARecemParidosNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlARecemParidosULTIMO_DIAGNOSTICO: TStringField
      FieldName = 'ULTIMO_DIAGNOSTICO'
      Size = 128
    end
    object sqlARecemParidosULTIMO_PROTOCOLO: TStringField
      FieldName = 'ULTIMO_PROTOCOLO'
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
    Left = 212
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
