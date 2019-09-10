object Zoo_AtividadesLVCiclosAnormaisDatamodule: TZoo_AtividadesLVCiclosAnormaisDatamodule
  OldCreateOrder = True
  Height = 250
  Width = 319
  object cdsCiclosAnormais: TClientDataSet
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
        Name = 'RECEPTORA'
        ParamType = ptInput
      end>
    ProviderName = 'dspCiclosAnormais'
    BeforeOpen = cdsCiclosAnormaisBeforeOpen
    AfterOpen = cdsCiclosAnormaisAfterOpen
    Left = 63
    Top = 12
    object cdsCiclosAnormaisKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsCiclosAnormaisBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsCiclosAnormaisBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsCiclosAnormaisDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      DisplayWidth = 34
      FieldName = 'DATA'
    end
    object cdsCiclosAnormaisLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsCiclosAnormaisEVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'EVENTO'
      OnGetText = cdsCiclosAnormaisEVENTOGetText
      Size = 255
    end
    object cdsCiclosAnormaisNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object cdsCiclosAnormaisINTERVALO: TIntegerField
      DisplayLabel = 'Intervalo'
      FieldName = 'INTERVALO'
    end
    object cdsCiclosAnormaisFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'FUNCIONARIO'
      Size = 128
    end
    object cdsCiclosAnormaisDIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldName = 'DIAGNOSTICO'
      FixedChar = True
      Size = 6
    end
    object cdsCiclosAnormaisOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspCiclosAnormais: TDataSetProvider
    DataSet = sqlCiclosAnormais
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlCiclosAnormais: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
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
        Name = 'RECEPTORA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'WITH FEMEAS AS'
      '(SELECT'
      '        AF.KZOO_ANIMAL_FEMEA,'
      '        AN.BRINCO,'
      '        AN.BRINCO_,'
      
        '        COALESCE ( NULLIF ( TRIM ( AN.NOMEESTABULO ), '#39#39' ), AN.N' +
        'OMECOMPLETO ) NOME,'
      '        AF.ULTIMO_EVENTO_ZOOTECNICO,'
      '        AF.ULTIMA_LACTACAO,'
      '        AF.LOTE'
      '   FROM ZOO_ANIMAIS_FEMEA AF'
      
        '  INNER JOIN ZOO_ANIMAIS AN ON AN.KZOO_ANIMAL = AF.KZOO_ANIMAL_F' +
        'EMEA'
      
        '   LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS UEV ON UEV.KZOO_EVENTO_ZOOT' +
        'ECNICO = AF.KULTIMO_EVENTO_ZOOTECNICO'
      '  WHERE AN.KCAD_FAZENDA = :KCAD_FAZENDA'
      '    AND AN.STATUS IS DISTINCT FROM :STATUS_DESCARTADO'
      '    AND AF.INTENCAO_DESCARTE IS DISTINCT FROM '#39'T'#39
      '    AND AF.DOADOR_RECEPTOR IS DISTINCT FROM :RECEPTORA'
      '    AND AF.KULTIMA_LACTACAO IS NOT NULL'
      '    AND AF.KULTIMO_EVENTO_ZOOTECNICO = AF.KULTIMO_CIO'
      '    AND AF.ULTIMO_CIO > AF.ULTIMA_LACTACAO'
      '    AND ( (UEV.IEE >= 1 AND UEV.IEE <= 17 ) OR UEV.IEE > 24 )'
      ')'
      'SELECT'
      
        '   FEMEAS.KZOO_ANIMAL_FEMEA, FEMEAS.BRINCO, FEMEAS.BRINCO_, FEME' +
        'AS.ULTIMA_LACTACAO DATA, FEMEAS.LOTE,'
      '    '#39'Parto'#39' EVENTO,'
      '    FEMEAS.NOME,'
      '    NULL INTERVALO,'
      '    '#39#39' FUNCIONARIO,'
      '    '#39#39' DIAGNOSTICO,'
      '    NULL OBS'
      'FROM FEMEAS'
      'UNION ALL'
      'SELECT'
      
        '  FEMEAS.KZOO_ANIMAL_FEMEA, FEMEAS.BRINCO, FEMEAS.BRINCO_, E.DAT' +
        'AEVENTO, FEMEAS.LOTE,'
      
        '    (SELECT SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION ( '#39'TIP' +
        'O_EVENTO_ZOO'#39', E.TIPOEVENTO )) EVENTO,'
      '    FEMEAS.NOME,'
      '    0 INTERVALO,'
      '    E.NOMEFUNCIONARIO,'
      '    '#39#39' DIAGNOSTICO,'
      '    E.OBS_EVENTO'
      'FROM FEMEAS'
      
        'INNER JOIN ZOO_EVENTOS_ZOOTECNICOS E ON E.KZOO_ANIMAL_FEMEA = FE' +
        'MEAS.KZOO_ANIMAL_FEMEA AND E.DATAEVENTO  >= FEMEAS.ULTIMA_LACTAC' +
        'AO'
      'UNION ALL'
      'SELECT'
      
        '   FEMEAS.KZOO_ANIMAL_FEMEA,  FEMEAS.BRINCO, FEMEAS.BRINCO_, A.D' +
        'ATAABORTOPARTO, FEMEAS.LOTE,'
      '    0 EVENTO,'
      '    FEMEAS.NOME,'
      '    0 INTERVALO,'
      '    A.NOMEVETERINARIO,'
      '    '#39'Aborto'#39' DIAGNOSTICO,'
      '    A.OBS_EVENTO'
      'FROM FEMEAS'
      
        'INNER JOIN ZOO_EVENTOS_ZOOTECNICOS A ON A.KZOO_ANIMAL_FEMEA = FE' +
        'MEAS.KZOO_ANIMAL_FEMEA'
      '    AND A.DATAABORTOPARTO > FEMEAS.ULTIMA_LACTACAO'
      
        '    AND EXISTS (SELECT SYS$VALUE FROM SYS$TYPES_GETVALUE ( '#39'TIPO' +
        '_PARTOABORTO'#39', '#39'ABORTO'#39' ) WHERE SYS$VALUE = A.ABORTOPARTO)'
      'ORDER BY 2,3')
    Left = 63
    Top = 103
    object sqlCiclosAnormaisKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlCiclosAnormaisBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlCiclosAnormaisBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlCiclosAnormaisDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      DisplayWidth = 34
      FieldName = 'DATA'
    end
    object sqlCiclosAnormaisLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlCiclosAnormaisEVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'EVENTO'
      Size = 255
    end
    object sqlCiclosAnormaisNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object sqlCiclosAnormaisINTERVALO: TIntegerField
      DisplayLabel = 'Intervalo'
      FieldName = 'INTERVALO'
    end
    object sqlCiclosAnormaisFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'FUNCIONARIO'
      Size = 128
    end
    object sqlCiclosAnormaisDIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldName = 'DIAGNOSTICO'
      FixedChar = True
      Size = 6
    end
    object sqlCiclosAnormaisOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
end
