object Zoo_AtividadesLVReexaminarDatamodule: TZoo_AtividadesLVReexaminarDatamodule
  OldCreateOrder = True
  Height = 235
  Width = 355
  object cdsReexaminarToque: TClientDataSet
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
        Name = 'DIASREEXAMINAR_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASREEXAMINAR_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspReexaminarToque'
    BeforeOpen = cdsReexaminarToqueBeforeOpen
    OnCalcFields = cdsReexaminarToqueCalcFields
    Left = 86
    Top = 15
    object cdsReexaminarToqueKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsReexaminarToqueBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsReexaminarToqueBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsReexaminarToqueNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsReexaminarToqueLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsReexaminarToqueTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
      Visible = False
    end
    object cdsReexaminarToqueDESC_EVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldKind = fkLookup
      FieldName = 'DESC_EVENTO'
      LookupDataSet = cdsTipoEvento
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOEVENTO'
      Size = 32
      Lookup = True
    end
    object cdsReexaminarToqueDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
      Visible = False
    end
    object cdsReexaminarToqueDIAS_ULTEVENTO: TIntegerField
      DisplayLabel = 'Dias '#250'lt. evento'
      FieldKind = fkInternalCalc
      FieldName = 'DIAS_ULTEVENTO'
    end
    object cdsReexaminarToqueDATATOQUE: TSQLTimeStampField
      DisplayLabel = 'Data toque'
      FieldName = 'DATATOQUE'
    end
    object cdsReexaminarToqueDIAS_POSTOQUE: TIntegerField
      DisplayLabel = 'Dias p'#243's toque'
      FieldKind = fkInternalCalc
      FieldName = 'DIAS_POSTOQUE'
    end
    object cdsReexaminarToqueRESPONSAVEL: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'RESPONSAVEL'
      Size = 128
    end
  end
  object dspReexaminarToque: TDataSetProvider
    DataSet = sqlReexaminarToque
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 62
    Top = 65
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
  object sqlReexaminarToque: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BR' +
      'INCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  DAF.LOTE,'#13#10 +
      '  EZ.TIPOEVENTO,'#13#10'  EZ.DATAEVENTO,'#13#10'  EZ.DATATOQUE,'#13#10'  EZ.NOMEVE' +
      'TERINARIO RESPONSAVEL'#13#10'FROM ZOO_ANIMAIS AF'#13#10'JOIN ZOO_ANIMAIS_FEM' +
      'EA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'#13#10'LEFT JOIN ZOO_' +
      'EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIM' +
      'O_EVENTO_ZOOTECNICO'#13#10'WHERE ( AF.KCAD_FAZENDA = :KCAD_FAZENDA ) -' +
      '-sz2AmnoiPZzE7N5li_evUl'#13#10'  AND ( AF.STATUS IS DISTINCT FROM :DES' +
      'CARTADA )'#13#10'  AND ( DAF.INTENCAO_DESCARTE IS DISTINCT FROM '#39'T'#39' )'#13 +
      #10'  AND ( DAF.KULTIMO_EVENTO_ZOOTECNICO = DAF.KULTIMA_MONTA )'#13#10'  ' +
      'AND ( EZ.ABORTOPARTO IS NULL )'#13#10'  AND ( EZ.REEXAMINAR = '#39'T'#39' )'#13#10' ' +
      ' AND (     ( (DAF.NUMERO_LACTACAO >= 2) AND (DATEADD(:DIASREEXAM' +
      'INAR_MULTIPARA DAY TO EZ.DATATOQUE) <= :DATAINICIO) )'#13#10'         ' +
      'OR ( (DAF.NUMERO_LACTACAO <= 1) AND (DATEADD(:DIASREEXAMINAR_PRI' +
      'MIPARA DAY TO EZ.DATATOQUE) <= :DATAINICIO) )'#13#10'        )'#13#10'ORDER ' +
      'BY 2'
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
        Name = 'DIASREEXAMINAR_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIASREEXAMINAR_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 86
    Top = 108
    object sqlReexaminarToqueKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlReexaminarToqueBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlReexaminarToqueBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlReexaminarToqueNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlReexaminarToqueLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlReexaminarToqueTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlReexaminarToqueDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
    end
    object sqlReexaminarToqueDATATOQUE: TSQLTimeStampField
      FieldName = 'DATATOQUE'
    end
    object sqlReexaminarToqueRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 128
    end
  end
end
