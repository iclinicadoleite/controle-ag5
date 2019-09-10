object Zoo_AtividadesLVNovilhasNaoPrenhesDatamodule: TZoo_AtividadesLVNovilhasNaoPrenhesDatamodule
  OldCreateOrder = True
  Height = 250
  Width = 361
  object cdsANovilhasNaoPrenhes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NOVILHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRENHEZ_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDADEMAXIMA_SEMCOBERTURA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspANovilhasNaoPrenhes'
    BeforeOpen = cdsANovilhasNaoPrenhesBeforeOpen
    OnCalcFields = cdsANovilhasNaoPrenhesCalcFields
    Left = 89
    Top = 10
    object cdsANovilhasNaoPrenhesKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsANovilhasNaoPrenhesBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsANovilhasNaoPrenhesBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsANovilhasNaoPrenhesNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsANovilhasNaoPrenhesLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsANovilhasNaoPrenhesTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
      Visible = False
    end
    object cdsANovilhasNaoPrenhesDESC_EVENTO: TStringField
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
    object cdsANovilhasNaoPrenhesDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATAEVENTO'
    end
    object cdsANovilhasNaoPrenhesINTERVALO: TIntegerField
      DisplayLabel = 'Intervalo'
      FieldKind = fkInternalCalc
      FieldName = 'INTERVALO'
    end
    object cdsANovilhasNaoPrenhesULTIMO_DIAGNOSTICO: TStringField
      DisplayLabel = #218'lt Diagn'#243'stico'
      FieldName = 'ULTIMO_DIAGNOSTICO'
      Size = 128
    end
    object cdsANovilhasNaoPrenhesNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object cdsANovilhasNaoPrenhesNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object cdsANovilhasNaoPrenhesIDADE: TStringField
      DisplayLabel = 'Idade'
      FieldKind = fkInternalCalc
      FieldName = 'IDADE'
    end
    object cdsANovilhasNaoPrenhesPESO: TIntegerField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
  end
  object dspANovilhasNaoPrenhes: TDataSetProvider
    DataSet = sqlANovilhasNaoPrenhes
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 54
    Top = 62
  end
  object sqlANovilhasNaoPrenhes: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BR' +
      'INCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  DAF.LOTE,'#13#10 +
      '  DAF.NASCIMENTO,'#13#10'  EZ.TIPOEVENTO,'#13#10'  EZ.DATAEVENTO,'#13#10'  (SELECT' +
      ' FIRST 1 PESO'#13#10'  FROM ZOO_ANIMAL_CRESCIMENTO'#13#10'  WHERE KZOO_ANIMA' +
      'L = DAF.KZOO_ANIMAL_FEMEA'#13#10'  ORDER BY DATA DESC) PESO,'#13#10'  (    S' +
      'ELECT FIRST 1 AD.NOME FROM ZOO_ANIMAL_DIAGNOSTICOS AD'#13#10'        W' +
      'HERE AD.KZOO_ANIMAL_FEMEA = DAF.KZOO_ANIMAL_FEMEA'#13#10'          AND' +
      ' ( AD.DATASTATUS IS NOT NULL )'#13#10'        ORDER BY AD.DATA DESC'#13#10' ' +
      '  ) ULTIMO_DIAGNOSTICO,'#13#10'  EZ.NOMEFUNCIONARIO'#13#10'FROM ZOO_ANIMAIS_' +
      'FEMEA DAF'#13#10'JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = DAF.KZOO_ANIM' +
      'AL_FEMEA'#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO' +
      '_ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO'#13#10'WHERE AF.KCAD_FAZEN' +
      'DA = :KCAD_FAZENDA --sz2AmnoiPZzE7N5li_evUl'#13#10'  AND AF.STATUS = :' +
      'NOVILHA'#13#10'  AND ( EZ.PRENHEZ IS DISTINCT FROM '#39'T'#39#13#10'        OR ( E' +
      'Z.DATATOQUE IS NULL )'#13#10'       )'#13#10'  AND ( ( DAF.KULTIMO_EVENTO_ZO' +
      'OTECNICO = DAF.KULTIMA_MONTA'#13#10'          AND (DATEADD( :DIAS_CONF' +
      'IRMAR_PRENHEZ_PRIMIPARA DAY TO DAF.ULTIMA_MONTA ) <= :DATAFIM)'#13#10 +
      '         )'#13#10'        OR ( DAF.KULTIMA_MONTA IS NULL'#13#10'            ' +
      ' AND (DATEADD( :IDADEMAXIMA_SEMCOBERTURA MONTH TO DAF.NASCIMENTO' +
      ' ) <= :DATAFIM)'#13#10'            )'#13#10'       )'#13#10'ORDER BY AF.BRINCO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NOVILHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_CONFIRMAR_PRENHEZ_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDADEMAXIMA_SEMCOBERTURA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 89
    Top = 111
    object sqlANovilhasNaoPrenhesKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlANovilhasNaoPrenhesBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlANovilhasNaoPrenhesBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlANovilhasNaoPrenhesNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlANovilhasNaoPrenhesLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlANovilhasNaoPrenhesTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlANovilhasNaoPrenhesDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
    end
    object sqlANovilhasNaoPrenhesULTIMO_DIAGNOSTICO: TStringField
      FieldName = 'ULTIMO_DIAGNOSTICO'
      Size = 128
    end
    object sqlANovilhasNaoPrenhesNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlANovilhasNaoPrenhesNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object sqlANovilhasNaoPrenhesPESO: TIntegerField
      FieldName = 'PESO'
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
