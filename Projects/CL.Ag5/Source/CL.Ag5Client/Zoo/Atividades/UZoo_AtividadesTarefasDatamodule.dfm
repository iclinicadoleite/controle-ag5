object Zoo_AtividadesTarefasDatamodule: TZoo_AtividadesTarefasDatamodule
  OldCreateOrder = True
  Height = 250
  Width = 340
  object cdsATarefas: TClientDataSet
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
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
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
        Name = 'DESCARTE_LEITE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTE_CARNE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspATarefas'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 65
    Top = 12
    object cdsATarefasKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsATarefasBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsATarefasBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsATarefasNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsATarefasLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 32
    end
    object cdsATarefasDATAPROGRAMADA: TSQLTimeStampField
      DisplayLabel = 'Data programada'
      FieldName = 'DATAPROGRAMADA'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsATarefasDATAPROGRAMADAGetText
    end
    object cdsATarefasATRASADA: TStringField
      DisplayLabel = 'Atrasada'
      FieldName = 'ATRASADA'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsATarefasTAREFA: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'TAREFA'
      ProviderFlags = [pfInWhere]
      Size = 51
    end
    object cdsATarefasOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsATarefasPROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsATarefasREPONSAVEL: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'REPONSAVEL'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
  end
  object dspATarefas: TDataSetProvider
    DataSet = sqlATarefas
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlATarefas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  AF.KZOO_ANIMAL KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEME' +
      'A,'#13#10'  AF.BRINCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  ' +
      'DAF.LOTE,'#13#10'  T.DATAPREVISTA DATAPROGRAMADA,'#13#10'   (IIF (T.VEZAODIA' +
      ' = 1, T.CODIGO,'#13#10'        T.CODIGO || '#39' ('#39' || T.VEZAODIA || '#39#170' ve' +
      'z)'#39')'#13#10'    ) TAREFA,'#13#10'  T.OBS,'#13#10'  P.CODIGO PROTOCOLO,'#13#10'  T.NOMEFU' +
      'NCIONARIO REPONSAVEL,'#13#10' CAST(  '#39'F'#39' AS CHAR ) ATRASADA'#13#10'FROM ZOO_' +
      'ANIMAL_TAREFAS T'#13#10'LEFT JOIN  ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_A' +
      'NIMAL_PROTOCOLO = T.KZOO_ANIMAL_PROTOCOLO'#13#10'LEFT JOIN ZOO_ANIMAIS' +
      ' AF ON AF.KZOO_ANIMAL = T.KZOO_ANIMAL'#13#10'LEFT JOIN ZOO_ANIMAIS_FEM' +
      'EA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'#13#10'WHERE AF.KCAD_' +
      'FAZENDA = :KCAD_FAZENDA AND AF.STATUS <> :STATUS_DESCARTADO '#13#10'  ' +
      'AND T.DATAPREVISTA <= :DATAFIM'#13#10'  AND T.STATUS = :PENDENTE'#13#10' AND' +
      ' (T.EXCLUIDO = '#39'F'#39' )'#13#10'UNION ALL'#13#10'SELECT DISTINCT'#13#10'  AF.KZOO_ANIM' +
      'AL KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BRINCO_ BRINC' +
      'OFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  DAF.LOTE,'#13#10'  CASE '#13#10'  ' +
      '  WHEN TM.STATUS = :EXECUTADO THEN T.DATASTATUS'#13#10'    WHEN CAST( ' +
      'TM.DATAPREVISTA AS DATE ) < CURRENT_DATE THEN DATEADD( DAY, DATE' +
      'DIFF( DAY, TM.DATAPREVISTA, CURRENT_TIMESTAMP ), T.DATAPREVISTA ' +
      ')'#13#10'    ELSE T.DATAPREVISTA'#13#10'  END DATAPROGRAMADA,'#13#10'  T.CODIGO TA' +
      'REFA,'#13#10'  TM.OBS,'#13#10'  T.CODIGO PROTOCOLO,'#13#10'  '#39#39' REPONSAVEL,'#13#10'  CAS' +
      'E'#13#10'   WHEN TM.STATUS = :EXECUTADO THEN '#39'F'#39'  '#13#10'   WHEN CAST( TM.D' +
      'ATAPREVISTA AS DATE ) < CURRENT_DATE THEN '#39'T'#39#13#10'   ELSE '#39'F'#39#13#10'  EN' +
      'D'#13#10'FROM ZOO_ANIMAL_TAREFAS T'#13#10'LEFT JOIN ZOO_ANIMAIS AF ON AF.KZO' +
      'O_ANIMAL = T.KZOO_ANIMAL'#13#10'LEFT JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF' +
      '.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'#13#10'LEFT JOIN ZOO_ANIMAL_TAREFA' +
      'S TM ON TM.KZOO_ANIMAL_TAREFA = T.KMZOO_ANIMAL_TAREFA'#13#10'WHERE'#13#10'  ' +
      '       AF.KCAD_FAZENDA = :KCAD_FAZENDA'#13#10' AND AF.STATUS <> :STATU' +
      'S_DESCARTADO'#13#10' AND  ( T.STATUS = :DESCARTE_LEITE OR T.STATUS = :' +
      'DESCARTE_CARNE )'#13#10' AND (TM.STATUS = :EXECUTADO OR TM.STATUS = :P' +
      'ENDENTE)'#13#10' AND (TM.EXCLUIDO = '#39'F'#39' )'#13#10' AND CASE'#13#10'       WHEN TM.S' +
      'TATUS = :EXECUTADO THEN T.DATASTATUS'#13#10'       WHEN CAST( TM.DATAP' +
      'REVISTA AS DATE ) < CURRENT_DATE THEN DATEADD( DAY, DATEDIFF( DA' +
      'Y, TM.DATAPREVISTA, CURRENT_DATE ), T.DATAPREVISTA )'#13#10'       ELS' +
      'E T.DATAPREVISTA'#13#10'     END BETWEEN CURRENT_DATE AND  :DATAFIM'#13#10'O' +
      'RDER BY 5, 2 --T.DATAPREVISTA'
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
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
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
        Name = 'DESCARTE_LEITE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTE_CARNE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 65
    Top = 102
    object sqlATarefasKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlATarefasBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlATarefasBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlATarefasNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlATarefasLOTE: TStringField
      FieldName = 'LOTE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 32
    end
    object sqlATarefasDATAPROGRAMADA: TSQLTimeStampField
      FieldName = 'DATAPROGRAMADA'
      ProviderFlags = [pfInWhere]
    end
    object sqlATarefasATRASADA: TStringField
      DisplayLabel = 'Atrasada'
      FieldName = 'ATRASADA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlATarefasTAREFA: TStringField
      FieldName = 'TAREFA'
      ProviderFlags = [pfInWhere]
      Size = 51
    end
    object sqlATarefasOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlATarefasPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlATarefasREPONSAVEL: TStringField
      FieldName = 'REPONSAVEL'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
  end
end
