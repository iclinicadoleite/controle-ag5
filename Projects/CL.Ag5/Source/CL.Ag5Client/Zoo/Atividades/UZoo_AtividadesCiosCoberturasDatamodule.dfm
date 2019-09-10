object Zoo_AtividadesCiosCoberturasDatamodule: TZoo_AtividadesCiosCoberturasDatamodule
  OldCreateOrder = True
  Height = 247
  Width = 346
  object cdsACioCobertura: TClientDataSet
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
        Name = 'RECEPTORA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NOVILHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDADE_OBS_CIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PESO_OBS_CIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DPP_INSEMINAR_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DPP_INSEMINAR_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspACiosCobertura'
    BeforeOpen = cdsACioCoberturaBeforeOpen
    OnCalcFields = cdsACioCoberturaCalcFields
    Left = 73
    Top = 12
    object cdsACioCoberturaKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsACioCoberturaBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsACioCoberturaBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsACioCoberturaNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsACioCoberturaABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
      Visible = False
    end
    object cdsACioCoberturaTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
      Visible = False
    end
    object cdsACioCoberturaDESC_EVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldKind = fkInternalCalc
      FieldName = 'DESC_EVENTO'
      Size = 32
    end
    object cdsACioCoberturaDATA_EVENTO: TSQLTimeStampField
      DisplayLabel = 'Data evento'
      FieldName = 'DATA_EVENTO'
    end
    object cdsACioCoberturaDIAS_EVENTO: TLargeintField
      DisplayLabel = 'Dias '#250'ltimo evento'
      FieldName = 'DIAS_EVENTO'
    end
    object cdsACioCoberturaULTIMA_LACTACAO: TSQLTimeStampField
      DisplayLabel = #218'ltima lacta'#231#227'o'
      FieldName = 'ULTIMA_LACTACAO'
    end
    object cdsACioCoberturaNUMERO_MONTA: TIntegerField
      DisplayLabel = 'No. coberturas'
      FieldName = 'NUMERO_MONTA'
      Required = True
    end
    object cdsACioCoberturaULTIMO_CIO: TSQLTimeStampField
      DisplayLabel = #218'ltimo CIO'
      FieldName = 'ULTIMO_CIO'
    end
    object cdsACioCoberturaDPP: TLargeintField
      FieldName = 'DPP'
    end
    object cdsACioCoberturaPREVISAO_CIO: TSQLTimeStampField
      DisplayLabel = 'Previs'#227'o CIO'
      FieldName = 'PREVISAO_CIO'
    end
    object cdsACioCoberturaTOURO_1: TStringField
      DisplayLabel = 'Touro 1'
      FieldName = 'TOURO_1'
      Size = 78
    end
    object cdsACioCoberturaTOURO_2: TStringField
      DisplayLabel = 'Touro 2'
      FieldName = 'TOURO_2'
      Size = 78
    end
    object cdsACioCoberturaLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object dspACiosCobertura: TDataSetProvider
    DataSet = sqlACiosCobertura
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlACiosCobertura: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA,'#13#10'  AF.BRINCO BRINCOFEMEA,'#13#10'  AF' +
      '.BRINCO_ BRINCOFEMEA_,'#13#10'  COALESCE( AF.NOMEESTABULO, AF.NOMECOMP' +
      'LETO ) NOMEFEMEA,'#13#10'  EZ.ABORTOPARTO,'#13#10'  EZ.TIPOEVENTO,'#13#10'  COALES' +
      'CE(EZ.DATAABORTOPARTO, EZ.DATAEVENTO) DATA_EVENTO,'#13#10'  DATEDIFF(D' +
      'AY, COALESCE(EZ.DATAABORTOPARTO, EZ.DATAEVENTO), CURRENT_DATE ) ' +
      'DIAS_EVENTO,'#13#10'  DAF.ULTIMA_LACTACAO,'#13#10'(SELECT COUNT(*) FROM ZOO_' +
      'EVENTOS_ZOOTECNICOS E WHERE E.KZOO_ANIMAL_FEMEA = DAF.KZOO_ANIMA' +
      'L_FEMEA AND E.TIPOEVENTO > 1 AND ((DAF.ULTIMA_LACTACAO IS NULL) ' +
      'OR (E.DATAEVENTO > DAF.ULTIMA_LACTACAO))) NUMERO_MONTA,'#13#10'  DAF.U' +
      'LTIMO_CIO,'#13#10'  DATEDIFF(DAY, DAF.ULTIMA_LACTACAO, CURRENT_DATE ) ' +
      'DPP,'#13#10'  (CAST( ((CURRENT_DATE-1)-( CAST(COALESCE(EZ.DATAABORTOPA' +
      'RTO, EZ.DATAEVENTO) AS DATE)) )/21 AS INTEGER)*21+21+COALESCE(EZ' +
      '.DATAABORTOPARTO, EZ.DATAEVENTO)) PREVISAO_CIO,'#13#10'  (   SELECT AM' +
      '.BRINCO || '#39' - '#39' || AM.NOMEESTABULO TOURO'#13#10'       FROM ZOO_ANIMA' +
      'L_ACASALAMENTOS AC'#13#10'       JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL' +
      ' = AC.KZOO_ANIMAL_MACHO'#13#10'      WHERE AC.KZOO_ANIMAL_FEMEA = DAF.' +
      'KZOO_ANIMAL_FEMEA'#13#10'        AND AC.PREFERENCIA = 1'#13#10' ROWS 1 )TOUR' +
      'O_1,'#13#10'  (   SELECT AM.BRINCO || '#39' - '#39' || AM.NOMEESTABULO TOURO'#13#10 +
      '       FROM ZOO_ANIMAL_ACASALAMENTOS AC'#13#10'       JOIN ZOO_ANIMAIS' +
      ' AM ON AM.KZOO_ANIMAL = AC.KZOO_ANIMAL_MACHO'#13#10'      WHERE AC.KZO' +
      'O_ANIMAL_FEMEA = DAF.KZOO_ANIMAL_FEMEA'#13#10'        AND AC.PREFERENC' +
      'IA = 2 '#13#10' ROWS 1 )TOURO_2,'#13#10'  DAF.LOTE'#13#10'FROM ZOO_ANIMAIS AF'#13#10'JOI' +
      'N ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMA' +
      'L'#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTEC' +
      'NICO = DAF.KULTIMO_EVENTO_ZOOTECNICO'#13#10'WHERE AF.KCAD_FAZENDA = :K' +
      'CAD_FAZENDA -- 5SCp]Ih|CUKgOA?h+(Up'#13#10'  AND AF.STATUS IS DISTINCT' +
      ' FROM :DESCARTADA --9'#13#10'  AND DAF.INTENCAO_DESCARTE IS DISTINCT F' +
      'ROM '#39'T'#39#13#10'  AND DAF.DOADOR_RECEPTOR IS DISTINCT FROM :RECEPTORA -' +
      '-3'#13#10'  AND ( DAF.KULTIMO_EVENTO_ZOOTECNICO <> DAF.KULTIMA_MONTA'#13#10 +
      '        OR (EZ.PRENHEZ IS DISTINCT FROM '#39'T'#39')'#13#10'        OR (EZ.DAT' +
      'AABORTOPARTO IS NOT NULL)'#13#10'       )'#13#10'  AND ( AF.STATUS = :NOVILH' +
      'A --5'#13#10'        AND'#13#10'            (  DATEADD(:IDADE_OBS_CIO MONTH ' +
      'TO DAF.NASCIMENTO) <= :DATAFIM --13'#13#10'                 OR (DAF.MA' +
      'IOR_PESO >= :PESO_OBS_CIO) --350'#13#10'             )'#13#10'         OR ( ' +
      ' (IIF(DAF.NUMERO_LACTACAO <= 1, --45'#13#10'                    (DATEA' +
      'DD(:DPP_INSEMINAR_PRIMIPARA DAY TO DAF.ULTIMA_LACTACAO)),'#13#10'     ' +
      '               (DATEADD(:DPP_INSEMINAR_MULTIPARA DAY TO DAF.ULTI' +
      'MA_LACTACAO)))'#13#10'                ) <= :DATAFIM'#13#10'             )'#13#10' ' +
      '      )'#13#10'  AND (  ( DAF.KULTIMO_EVENTO_ZOOTECNICO IS NULL )'#13#10'   ' +
      '      OR ( (  DAF.KULTIMO_EVENTO_ZOOTECNICO = DAF.KULTIMO_CIO'#13#10' ' +
      '                OR ( ( DAF.KULTIMO_EVENTO_ZOOTECNICO = DAF.KULTI' +
      'MA_MONTA'#13#10'                        AND EZ.PRENHEZ IS DISTINCT FRO' +
      'M '#39'T'#39#13#10'                       )'#13#10'                      OR (EZ.DA' +
      'TAABORTOPARTO IS NOT NULL)'#13#10'                     )'#13#10'            ' +
      '   )'#13#10'              AND (CAST(((CURRENT_DATE-1)-(CAST(COALESCE(E' +
      'Z.DATAABORTOPARTO, EZ.DATAEVENTO) AS DATE)))/21 AS INTEGER)*21+2' +
      '1+COALESCE(EZ.DATAABORTOPARTO, EZ.DATAEVENTO)) BETWEEN :DATAINI ' +
      'AND :DATAFIM'#13#10'             )'#13#10'       )'#13#10'ORDER BY AF.BRINCO_'
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
        Name = 'RECEPTORA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NOVILHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDADE_OBS_CIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PESO_OBS_CIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DPP_INSEMINAR_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DPP_INSEMINAR_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 102
    object sqlACioCoberturaKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlACiosCoberturaBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlACiosCoberturaBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlACiosCoberturaNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlACiosCoberturaABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
    end
    object sqlACiosCoberturaTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlACiosCoberturaDATA_EVENTO: TSQLTimeStampField
      FieldName = 'DATA_EVENTO'
    end
    object sqlACiosCoberturaDIAS_EVENTO: TLargeintField
      FieldName = 'DIAS_EVENTO'
    end
    object sqlACiosCoberturaULTIMA_LACTACAO: TSQLTimeStampField
      FieldName = 'ULTIMA_LACTACAO'
    end
    object sqlACiosCoberturaNUMERO_MONTA: TIntegerField
      FieldName = 'NUMERO_MONTA'
      Required = True
    end
    object sqlACiosCoberturaULTIMO_CIO: TSQLTimeStampField
      FieldName = 'ULTIMO_CIO'
    end
    object sqlACiosCoberturaDPP: TLargeintField
      FieldName = 'DPP'
    end
    object sqlACiosCoberturaPREVISAO_CIO: TSQLTimeStampField
      FieldName = 'PREVISAO_CIO'
    end
    object sqlACiosCoberturaTOURO_1: TStringField
      FieldName = 'TOURO_1'
      Size = 78
    end
    object sqlACiosCoberturaTOURO_2: TStringField
      FieldName = 'TOURO_2'
      Size = 78
    end
    object sqlACiosCoberturaLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
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
    Left = 256
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
  object cdsAbortoParto: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 256
    Top = 72
    object cdsAbortoPartoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsAbortoPartoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsAbortoPartoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsAbortoPartoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
