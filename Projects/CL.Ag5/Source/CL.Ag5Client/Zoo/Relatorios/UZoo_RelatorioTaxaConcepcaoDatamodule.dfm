object Zoo_RelatorioTaxaConcepcaoDataModule: TZoo_RelatorioTaxaConcepcaoDataModule
  OldCreateOrder = False
  Height = 319
  Width = 413
  object sqlResultados: TTcSQLDataSet
    CommandText = 
      'WITH EVENTOS AS'#13#10'( SELECT'#13#10'  M.BRINCO,'#13#10'  M.NOMECOMPLETO,'#13#10'  NUL' +
      'LIF ( E.PRENHEZ,  '#39'F'#39' ) PRENHEZ,'#13#10'  IIF( E.ABORTOPARTO IS DISTIN' +
      'CT FROM 3, NULL, 3) PARTOS,'#13#10'  (SELECT'#13#10'    COUNT(*)'#13#10'   FROM ZO' +
      'O_ANIMAL_LINHAGEM L'#13#10'   WHERE'#13#10'         L.KZOO_EVENTO_ZOOTECNICO' +
      ' = E.KZOO_EVENTO_ZOOTECNICO'#13#10'     AND L.SEXO = '#39'F'#39#13#10'  ) FEMEAS'#13#10 +
      '  FROM ZOO_EVENTOS_ZOOTECNICOS E'#13#10'  LEFT JOIN ZOO_ANIMAIS M ON M' +
      '.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO_TOUROSEMEN'#13#10'  LEFT JOIN ZOO_A' +
      'NIMAIS F ON F.KZOO_ANIMAL = E.KZOO_ANIMAL_FEMEA'#13#10'  LEFT JOIN ZOO' +
      '_ANIMAIS_FEMEA AF ON AF.KZOO_ANIMAL_FEMEA = F.KZOO_ANIMAL'#13#10'  WHE' +
      'RE E.KZOO_ANIMAL_MACHO_TOUROSEMEN IS NOT NULL'#13#10'    AND (    (E.D' +
      'ATATOQUE IS NOT NULL)'#13#10'          OR (  :CONSIDERA_NAO_PRENHE_REI' +
      'NSEMINADA = '#39'T'#39#13#10'             AND E.KZOO_EVENTO_ZOOTECNICO <> AF' +
      '.KULTIMA_MONTA'#13#10'             AND EXISTS (SELECT KZOO_EVENTO_ZOOT' +
      'ECNICO'#13#10'                           FROM ZOO_EVENTOS_ZOOTECNICOS'#13 +
      #10'                          WHERE KZOO_ANIMAL_FEMEA = E.KZOO_ANIM' +
      'AL_FEMEA'#13#10'                            AND DATAEVENTO > E.DATAEVE' +
      'NTO'#13#10'                             AND TIPOEVENTO <> :EVENTO_CIO'#13 +
      #10'                            ORDER BY DATAEVENTO ROWS 1)'#13#10'      ' +
      '       AND E.DATATOQUE IS NULL)'#13#10'           OR (  :CONSIDERA_NAO' +
      '_PRENHE_DESCARTADA = '#39'T'#39#13#10'             AND E.KZOO_EVENTO_ZOOTECN' +
      'ICO = AF.KULTIMA_MONTA'#13#10'             AND F.STATUS = :ST_DESCARTA' +
      'DA'#13#10'             AND E.DATATOQUE IS NULL )'#13#10'        )'#13#10'    AND( ' +
      '( :TIPODATA = 0 and E.DATAEVENTO BETWEEN :DATAINI AND :DATAFIM) ' +
      'or '#13#10'             ( :TIPODATA = 1 and E.DATAABORTOPARTO BETWEEN ' +
      ':DATAINI AND :DATAFIM and ABORTOPARTO = IIF( E.ABORTOPARTO IS DI' +
      'STINCT FROM 3, NULL, 3) ))'#13#10') '#13#10'SELECT'#13#10'  BRINCO,'#13#10'  NOMECOMPLET' +
      'O,'#13#10'  COUNT(*) COBERTURAS,'#13#10'  COUNT(PRENHEZ) PRENHEZES,'#13#10'  ((COU' +
      'NT(PRENHEZ)*100) /COUNT(*) ) "TAXACONCEPCAO",'#13#10'  COUNT( PARTOS )' +
      ' PARTOS,'#13#10'  SUM( FEMEAS ) FEMEAS,'#13#10'  ( (SUM( FEMEAS )*100) / IIF' +
      '(COUNT( PARTOS ) = 0, 1,COUNT( PARTOS ) ) ) "TAXAFEMEAS",'#13#10' 1 "T' +
      'IPO_REG"'#13#10'FROM EVENTOS'#13#10'GROUP BY 1,2'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'CONSIDERA_NAO_PRENHE_REINSEMINADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EVENTO_CIO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CONSIDERA_NAO_PRENHE_DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'ST_DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
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
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
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
    Left = 69
    Top = 145
    object sqlResultadosBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlResultadosNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object sqlResultadosCOBERTURAS: TIntegerField
      FieldName = 'COBERTURAS'
      Required = True
    end
    object sqlResultadosPRENHEZES: TIntegerField
      FieldName = 'PRENHEZES'
      Required = True
    end
    object sqlResultadosTAXACONCEPCAO: TLargeintField
      FieldName = 'TAXACONCEPCAO'
      Required = True
    end
    object sqlResultadosPARTOS: TIntegerField
      FieldName = 'PARTOS'
      Required = True
    end
    object sqlResultadosFEMEAS: TLargeintField
      FieldName = 'FEMEAS'
    end
    object sqlResultadosTAXAFEMEAS: TLargeintField
      FieldName = 'TAXAFEMEAS'
    end
    object sqlResultadosTIPO_REG: TIntegerField
      FieldName = 'TIPO_REG'
      Required = True
    end
  end
  object dspResultados: TDataSetProvider
    DataSet = sqlResultados
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 53
    Top = 73
  end
  object cdsResultados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'CONSIDERA_NAO_PRENHE_REINSEMINADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EVENTO_CIO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CONSIDERA_NAO_PRENHE_DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'ST_DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
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
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
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
    ProviderName = 'dspResultados'
    BeforeOpen = cdsResultadosBeforeOpen
    Left = 69
    Top = 17
    object cdsResultadosBRINCO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsResultadosNOMECOMPLETO: TStringField
      DisplayLabel = 'Nome completo'
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object cdsResultadosCOBERTURAS: TIntegerField
      DisplayLabel = 'Coberturas*'
      FieldName = 'COBERTURAS'
      Required = True
    end
    object cdsResultadosPRENHEZES: TIntegerField
      DisplayLabel = 'Prenhezes'
      FieldName = 'PRENHEZES'
      Required = True
    end
    object cdsResultadosTAXACONCEPCAO: TLargeintField
      DisplayLabel = 'Taxa de concep'#231#227'o (%)'
      FieldName = 'TAXACONCEPCAO'
      Required = True
      EditFormat = '0.0'
    end
    object cdsResultadosPARTOS: TIntegerField
      DisplayLabel = 'Partos'
      FieldName = 'PARTOS'
      Required = True
    end
    object cdsResultadosFEMEAS: TLargeintField
      DisplayLabel = 'F'#234'meas**'
      FieldName = 'FEMEAS'
    end
    object cdsResultadosTAXAFEMEAS: TLargeintField
      DisplayLabel = 'Taxa de f'#234'meas (%) **'
      FieldName = 'TAXAFEMEAS'
      EditFormat = '0.0'
    end
    object cdsResultadosTIPO_REG: TIntegerField
      FieldName = 'TIPO_REG'
      Required = True
      Visible = False
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'TIPODATA'
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
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
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
    BeforeOpen = cdsResultadosBeforeOpen
    Left = 237
    Top = 65
    object StringField1: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'BRINCO'
      Size = 15
    end
    object StringField2: TStringField
      DisplayLabel = 'Nome completo'
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Coberturas*'
      FieldName = 'COBERTURAS'
      Required = True
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Prenhezes'
      FieldName = 'PRENHEZES'
      Required = True
    end
    object LargeintField1: TLargeintField
      DisplayLabel = 'Taxa de concep'#231#227'o (%)'
      FieldName = 'TAXACONCEPCAO'
      Required = True
      EditFormat = '0.0'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'Partos'
      FieldName = 'PARTOS'
      Required = True
    end
    object LargeintField2: TLargeintField
      DisplayLabel = 'F'#234'meas**'
      FieldName = 'FEMEAS'
    end
    object LargeintField3: TLargeintField
      DisplayLabel = 'Taxa de f'#234'meas (%) **'
      FieldName = 'TAXAFEMEAS'
      EditFormat = '0.0'
    end
    object IntegerField4: TIntegerField
      FieldName = 'TIPO_REG'
      Required = True
    end
    object AggregateField1: TAggregateField
      FieldName = 'COBERTURAS_SOMA'
      DisplayName = ''
      Expression = 'SUM(COBERTURAS)'
    end
    object AggregateField2: TAggregateField
      FieldName = 'PRENHEZES_SOMA'
      DisplayName = ''
      Expression = 'SUM(PRENHEZES)'
    end
    object AggregateField3: TAggregateField
      FieldName = 'PARTOS_SOMA'
      DisplayName = ''
      Expression = 'SUM(PARTOS)'
    end
    object AggregateField4: TAggregateField
      FieldName = 'FEMEAS_SOMA'
      DisplayName = ''
      Expression = 'SUM(FEMEAS)'
    end
  end
end
