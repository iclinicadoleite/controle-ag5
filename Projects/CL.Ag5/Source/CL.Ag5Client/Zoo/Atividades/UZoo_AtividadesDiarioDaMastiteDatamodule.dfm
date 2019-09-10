object Zoo_AtividadesDiarioDaMastiteDatamodule: TZoo_AtividadesDiarioDaMastiteDatamodule
  OldCreateOrder = True
  Height = 250
  Width = 340
  object cdsTarefas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DATAPROGRAMADA'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'RESPONSAVEL'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'BRINCOFEMEA_'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'TIPOTAREFA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATA_MASTITE'
        DataType = ftTimeStamp
      end
      item
        Name = 'CODIGO_MASTITE'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'QUARTO'
        DataType = ftSmallint
      end
      item
        Name = 'DATAPREVISTA'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'NOME_MASTITE'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'TAREFA'
        DataType = ftString
        Size = 147
      end
      item
        Name = 'BRINCOFEMEA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'LOTE'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'DEL'
        DataType = ftInteger
      end
      item
        Name = 'NL'
        DataType = ftInteger
      end
      item
        Name = 'ATRASADA'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DPP'
        DataType = ftLargeint
      end
      item
        Name = 'DIAS_SECAR'
        DataType = ftLargeint
      end
      item
        Name = 'NOMEFEMEA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ULTIMA_CULTURA'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'DATA_CULTURA'
        DataType = ftTimeStamp
      end
      item
        Name = 'DATA_ULTIMO_DESCARTE'
        DataType = ftTimeStamp
      end
      item
        Name = 'DESCARTELEITE'
        DataType = ftInteger
      end
      item
        Name = 'PENULTIMA_CCS'
        DataType = ftInteger
      end
      item
        Name = 'ULTIMA_CCS'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'DESCONSIDERAR_PRENHEZ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PREV_SECAGEM_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PREV_SECAGEM_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_MASTITE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_MASTITE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTE_LEITE'
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
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_MASTITE'
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
        Name = 'TODOS_FUNCIONARIOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FUNCIONARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESCONSIDERAR_PRENHEZ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PREV_SECAGEM_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PREV_SECAGEM_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_MASTITE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_MASTITE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTE_LEITE'
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
        Name = 'DESCARTE_LEITE'
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
    ProviderName = 'dspTarefas'
    StoreDefs = True
    BeforeOpen = cdsTarefasBeforeOpen
    Left = 72
    Top = 24
    object cdsTarefasKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsTarefasBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsTarefasBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsTarefasNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsTarefasLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 32
    end
    object cdsTarefasDEL: TIntegerField
      FieldName = 'DEL'
      Visible = False
    end
    object cdsTarefasNL: TIntegerField
      FieldName = 'NL'
    end
    object cdsTarefasDPP: TLargeintField
      FieldName = 'DPP'
    end
    object cdsTarefasDIAS_SECAR: TLargeintField
      DisplayLabel = 'DPS'
      FieldName = 'DIAS_SECAR'
    end
    object cdsTarefasDATA_MASTITE: TSQLTimeStampField
      DisplayLabel = 'Data mastite'
      FieldName = 'DATA_MASTITE'
    end
    object cdsTarefasCODIGO_MASTITE: TStringField
      DisplayLabel = 'Severidade'
      FieldName = 'CODIGO_MASTITE'
      OnGetText = cdsTarefasCODIGO_MASTITEGetText
      Size = 32
    end
    object cdsTarefasNOME_MASTITE: TStringField
      DisplayLabel = 'Severidade'
      FieldName = 'NOME_MASTITE'
      Visible = False
      Size = 128
    end
    object cdsTarefasQUARTO: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Quarto'
      FieldName = 'QUARTO'
      OnGetText = cdsTarefasQUARTOGetText
    end
    object cdsTarefasDATAPROGRAMADA: TDateField
      DisplayLabel = 'Data tarefa'
      FieldName = 'DATAPROGRAMADA'
      Visible = False
    end
    object cdsTarefasDATAPREVISTA: TSQLTimeStampField
      Alignment = taRightJustify
      DisplayLabel = 'Data prevista'
      FieldName = 'DATAPREVISTA'
    end
    object cdsTarefasTIPOTAREFA: TIntegerField
      FieldName = 'TIPOTAREFA'
      Visible = False
    end
    object cdsTarefasTAREFA: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'TAREFA'
      Size = 51
    end
    object cdsTarefasATRASADA: TStringField
      FieldName = 'ATRASADA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsTarefasULTIMA_CULTURA: TStringField
      DisplayLabel = #218'ltima cultura'
      FieldName = 'ULTIMA_CULTURA'
      Size = 128
    end
    object cdsTarefasDATA_CULTURA: TSQLTimeStampField
      DisplayLabel = 'Data cultura'
      FieldName = 'DATA_CULTURA'
    end
    object cdsTarefasPENULTIMA_CCS: TIntegerField
      DisplayLabel = 'Pen'#250'ltima CCS'
      FieldName = 'PENULTIMA_CCS'
    end
    object cdsTarefasULTIMA_CCS: TIntegerField
      DisplayLabel = #218'ltima CCS'
      FieldName = 'ULTIMA_CCS'
    end
    object cdsTarefasDATA_ULTIMO_DESCARTE: TSQLTimeStampField
      DisplayLabel = 'Descartar at'#233
      FieldName = 'DATA_ULTIMO_DESCARTE'
    end
    object cdsTarefasDESCARTELEITE: TIntegerField
      FieldName = 'DESCARTELEITE'
      Visible = False
    end
    object cdsTarefasRESPONSAVEL: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'RESPONSAVEL'
      Size = 128
    end
  end
  object dspTarefas: TDataSetProvider
    DataSet = sqlTarefas
    Options = [poIncFieldProps, poDisableInserts, poDisableEdits]
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 48
  end
  object sqlTarefas: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  IIF( CAST( T.DATAPREVISTA AS DATE ) < CURRENT_DATE, CU' +
      'RRENT_DATE, CAST( T.DATAPREVISTA AS DATE ) ) DATAPROGRAMADA,'#13#10'  ' +
      'T.NOMEFUNCIONARIO RESPONSAVEL,'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRIN' +
      'CO_ BRINCOFEMEA_,'#13#10'  T.STATUS TIPOTAREFA,'#13#10'  AD.DATA DATA_MASTIT' +
      'E,'#13#10'  D.CODIGO CODIGO_MASTITE,'#13#10'  AD.QUARTO,'#13#10'  T.DATAPREVISTA,'#13 +
      #10'  D.NOME NOME_MASTITE,'#13#10'   (IIF (T.VEZAODIA IS NULL OR T.VEZAOD' +
      'IA = 1, T.CODIGO,'#13#10'        T.CODIGO || '#39' ('#39' || T.VEZAODIA || '#39#170' ' +
      'vez)'#39')'#13#10'    ) TAREFA,'#13#10'  AF.BRINCO BRINCOFEMEA,'#13#10'  DAF.LOTE,'#13#10'  ' +
      'L.DEL,'#13#10'  L.NL,'#13#10'  IIF( CAST( T.DATAPREVISTA AS DATE ) < CURRENT' +
      '_DATE,  CAST(  '#39'T'#39' AS CHAR ), CAST(  '#39'F'#39' AS CHAR ) ) ATRASADA,'#13#10 +
      '  DATEDIFF(DAY,L.DATALACTACAO, CURRENT_TIMESTAMP) DPP,'#13#10'  IIF(  ' +
      '         EZ.KZOO_EVENTO_ZOOTECNICO IS NOT NULL'#13#10'        AND  ( E' +
      'Z.PRENHEZ = '#39'T'#39#13#10'               OR :DESCONSIDERAR_PRENHEZ = '#39'T'#39#13 +
      #10'                 ) ,'#13#10'       IIF( L.NL = 1,'#13#10'            DATEDI' +
      'FF( DAY, CURRENT_TIMESTAMP, DATEADD ( DAY, :PREV_SECAGEM_PRIMIPA' +
      'RA, EZ.DATAEVENTO ) ),'#13#10'            DATEDIFF( DAY, CURRENT_TIMES' +
      'TAMP, DATEADD ( DAY, :PREV_SECAGEM_MULTIPARA, EZ.DATAEVENTO ) )'#13 +
      #10'          ),'#13#10'       CAST( NULL AS INTEGER ) ) DIAS_SECAR,'#13#10' AF' +
      '.NOMEESTABULO NOMEFEMEA,'#13#10' (SELECT R.NOME FROM ZOO_ANIMAL_TAREFA' +
      'S  T'#13#10'   LEFT JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROT' +
      'OCOLO = T.KZOO_ANIMAL_PROTOCOLO'#13#10'   LEFT JOIN ZOO_ANIMAL_DIAGNOS' +
      'TICOS ADX ON ADX.KZOO_ANIMAL_DIAGNOSTICO = P.KZOO_ANIMAL_DIAGNOS' +
      'TICO AND ADX.QUARTO = AD.QUARTO'#13#10'   LEFT JOIN ZOO_DIAGNOSTICOS D' +
      ' ON D.KZOO_DIAGNOSTICO = AD.KZOO_DIAGNOSTICO'#13#10'   LEFT JOIN ZOO_T' +
      'AREFA_RESULTADOS R ON R.KZOO_TAREFA_RESULTADO = COALESCE ( T.KZO' +
      'O_TAREFA_RESULTADO1,T.KZOO_TAREFA_RESULTADO2,T.KZOO_TAREFA_RESUL' +
      'TADO3 )'#13#10'   WHERE T.KZOO_ANIMAL = AF.KZOO_ANIMAL AND T.EXAME = '#39 +
      'T'#39' AND'#13#10'     (    T.KZOO_TAREFA_RESULTADO1 IS NOT NULL'#13#10'       O' +
      'R T.KZOO_TAREFA_RESULTADO2 IS NOT NULL'#13#10'       OR T.KZOO_TAREFA_' +
      'RESULTADO3 IS NOT NULL) AND D.TIPODIAGNOSTICO = :TIPO_MASTITE'#13#10' ' +
      '  ORDER BY T.DATASTATUS DESC'#13#10'   ROWS 1'#13#10'  ) ULTIMA_CULTURA,'#13#10'  ' +
      '(SELECT T.DATA_RESULTADO FROM ZOO_ANIMAL_TAREFAS  T'#13#10'   LEFT JOI' +
      'N ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_AN' +
      'IMAL_PROTOCOLO'#13#10'   LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS ADX ON ADX.' +
      'KZOO_ANIMAL_DIAGNOSTICO = P.KZOO_ANIMAL_DIAGNOSTICO AND ADX.QUAR' +
      'TO = AD.QUARTO'#13#10'   LEFT JOIN ZOO_DIAGNOSTICOS D ON D.KZOO_DIAGNO' +
      'STICO = AD.KZOO_DIAGNOSTICO'#13#10'   LEFT JOIN ZOO_TAREFA_RESULTADOS ' +
      'R ON R.KZOO_TAREFA_RESULTADO = COALESCE ( T.KZOO_TAREFA_RESULTAD' +
      'O1,T.KZOO_TAREFA_RESULTADO2,T.KZOO_TAREFA_RESULTADO3 )'#13#10'   WHERE' +
      ' T.KZOO_ANIMAL = AF.KZOO_ANIMAL AND T.EXAME = '#39'T'#39' AND'#13#10'     (   ' +
      ' T.KZOO_TAREFA_RESULTADO1 IS NOT NULL'#13#10'       OR T.KZOO_TAREFA_R' +
      'ESULTADO2 IS NOT NULL'#13#10'       OR T.KZOO_TAREFA_RESULTADO3 IS NOT' +
      ' NULL) AND D.TIPODIAGNOSTICO = :TIPO_MASTITE'#13#10'   ORDER BY T.DATA' +
      'STATUS DESC'#13#10'   ROWS 1'#13#10'  ) DATA_CULTURA,'#13#10'  (SELECT '#13#10'      CAS' +
      'E '#13#10'       WHEN TM.STATUS = :EXECUTADO THEN T.DATASTATUS'#13#10'      ' +
      ' WHEN CAST( TM.DATAPREVISTA AS DATE ) < CURRENT_DATE THEN DATEAD' +
      'D( DAY, DATEDIFF( DAY, TM.DATAPREVISTA, CURRENT_TIMESTAMP ), T.D' +
      'ATAPREVISTA )'#13#10'       ELSE T.DATAPREVISTA'#13#10'      END'#13#10'   FROM ZO' +
      'O_ANIMAL_TAREFAS  T'#13#10'   LEFT JOIN ZOO_ANIMAL_TAREFAS  TM ON TM.K' +
      'ZOO_ANIMAL_TAREFA = T.KMZOO_ANIMAL_TAREFA'#13#10'   WHERE ( T.KZOO_ANI' +
      'MAL = AF.KZOO_ANIMAL )'#13#10'     AND ( T.STATUS = :DESCARTE_LEITE )'#13 +
      #10'     AND (TM.STATUS = :EXECUTADO OR TM.STATUS = :PENDENTE )'#13#10'  ' +
      ' ORDER BY 1 DESC'#13#10'   ROWS 1'#13#10'  ) DATA_ULTIMO_DESCARTE,'#13#10'  (SELEC' +
      'T A.CCS FROM ZOO_PESAGEM_LEITE_ANALISE A WHERE A.KZOO_LACTACAO =' +
      ' L.KZOO_LACTACAO AND A.CCS > 0 ORDER BY A.KZOO_LACTACAO, A.DATA ' +
      'DESC ROWS 2 TO 2) PENULTIMA_CCS,'#13#10'  (SELECT A.CCS FROM ZOO_PESAG' +
      'EM_LEITE_ANALISE A WHERE A.KZOO_LACTACAO = L.KZOO_LACTACAO AND A' +
      '.CCS > 0 ORDER BY A.KZOO_LACTACAO, A.DATA DESC ROWS 1) ULTIMA_CC' +
      'S ,'#13#10'  T.DESCARTELEITE'#13#10'FROM ZOO_ANIMAL_TAREFAS T'#13#10'INNER JOIN ZO' +
      'O_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_ANIMAL' +
      '_PROTOCOLO'#13#10'INNER JOIN ZOO_ANIMAL_DIAGNOSTICOS AD ON AD.KZOO_ANI' +
      'MAL_DIAGNOSTICO = P.KZOO_ANIMAL_DIAGNOSTICO'#13#10'INNER JOIN ZOO_DIAG' +
      'NOSTICOS D ON D.KZOO_DIAGNOSTICO = AD.KZOO_DIAGNOSTICO'#13#10'LEFT JOI' +
      'N ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = T.KZOO_ANIMAL'#13#10'LEFT JOIN ZO' +
      'O_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'#13#10'L' +
      'EFT JOIN ZOO_LACTACOES L ON L.KZOO_LACTACAO = DAF.KULTIMA_LACTAC' +
      'AO'#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ  ON EZ.KZOO_EVENTO_ZOOT' +
      'ECNICO = DAF.KULTIMA_MONTA AND EZ.KZOO_EVENTO_ZOOTECNICO <> L.KZ' +
      'OO_EVENTO_ZOOTECNICO'#13#10'WHERE AF.KCAD_FAZENDA = :KCAD_FAZENDA'#13#10'  A' +
      'ND D.TIPODIAGNOSTICO = :TIPO_MASTITE'#13#10'  AND AF.STATUS <> :STATUS' +
      '_DESCARTADO'#13#10'  AND (T.EXCLUIDO = '#39'F'#39')'#13#10'  AND T.DATAPREVISTA <= :' +
      'DATAFIM'#13#10'  AND T.STATUS = :PENDENTE'#13#10'  AND ( :TODOS_FUNCIONARIOS' +
      ' = '#39'T'#39' OR T.KCAD_FUNCIONARIO = :KCAD_FUNCIONARIO )'#13#10'UNION ALL'#13#10'S' +
      'ELECT DISTINCT'#13#10'  IIF( CAST( TD.DATAPREVISTA AS DATE ) < CURRENT' +
      '_DATE, CURRENT_DATE, CAST( TD.DATAPREVISTA AS DATE ) ) DATAPROGR' +
      'AMADA,'#13#10'  '#39#39' RESPONSAVEL,'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO_ B' +
      'RINCOFEMEA_,'#13#10'  TD.STATUS TIPOTAREFA,'#13#10'  AD.DATA DATA_MASTITE,'#13#10 +
      '  D.CODIGO CODIGO_MASTITE,'#13#10'  AD.QUARTO,'#13#10'  TD.DATAPREVISTA,'#13#10'  ' +
      'D.NOME NOME_MASTITE,'#13#10'   (IIF (TD.VEZAODIA IS NULL OR TD.VEZAODI' +
      'A = 1, TD.NOME,'#13#10'        TD.NOME || '#39' ('#39' || TD.VEZAODIA || '#39#170' ve' +
      'z)'#39')'#13#10'    ) TAREFA,'#13#10'  AF.BRINCO BRINCOFEMEA,'#13#10'  DAF.LOTE,'#13#10'  L.' +
      'DEL,'#13#10'  L.NL,'#13#10'  CAST(  '#39'F'#39' AS CHAR ) ATRASADA,'#13#10'  DATEDIFF(DAY,' +
      'L.DATALACTACAO, CURRENT_TIMESTAMP) DPP,'#13#10'  IIF(           EZ.KZO' +
      'O_EVENTO_ZOOTECNICO IS NOT NULL'#13#10'        AND  ( EZ.PRENHEZ = '#39'T'#39 +
      #13#10'               OR :DESCONSIDERAR_PRENHEZ = '#39'T'#39#13#10'              ' +
      '   ) ,'#13#10'       IIF( L.NL = 1,'#13#10'            DATEDIFF( DAY, CURREN' +
      'T_TIMESTAMP, DATEADD ( DAY, :PREV_SECAGEM_PRIMIPARA, EZ.DATAEVEN' +
      'TO ) ),'#13#10'            DATEDIFF( DAY, CURRENT_TIMESTAMP, DATEADD (' +
      ' DAY, :PREV_SECAGEM_MULTIPARA, EZ.DATAEVENTO ) )'#13#10'          ),'#13#10 +
      '       CAST( NULL AS INTEGER ) ) DIAS_SECAR,'#13#10'  AF.NOMEESTABULO ' +
      'NOMEFEMEA,'#13#10' (SELECT R.NOME FROM ZOO_ANIMAL_TAREFAS  T'#13#10'   LEFT ' +
      'JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO' +
      '_ANIMAL_PROTOCOLO'#13#10'   LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS ADX ON A' +
      'DX.KZOO_ANIMAL_DIAGNOSTICO = P.KZOO_ANIMAL_DIAGNOSTICO AND ADX.Q' +
      'UARTO = AD.QUARTO'#13#10'   LEFT JOIN ZOO_DIAGNOSTICOS D ON D.KZOO_DIA' +
      'GNOSTICO = AD.KZOO_DIAGNOSTICO'#13#10'   LEFT JOIN ZOO_TAREFA_RESULTAD' +
      'OS R ON R.KZOO_TAREFA_RESULTADO = COALESCE ( T.KZOO_TAREFA_RESUL' +
      'TADO1,T.KZOO_TAREFA_RESULTADO2,T.KZOO_TAREFA_RESULTADO3 )'#13#10'   WH' +
      'ERE T.KZOO_ANIMAL = AF.KZOO_ANIMAL AND T.EXAME = '#39'T'#39' AND'#13#10'     (' +
      '    T.KZOO_TAREFA_RESULTADO1 IS NOT NULL'#13#10'       OR T.KZOO_TAREF' +
      'A_RESULTADO2 IS NOT NULL'#13#10'       OR T.KZOO_TAREFA_RESULTADO3 IS ' +
      'NOT NULL) AND D.TIPODIAGNOSTICO = :TIPO_MASTITE'#13#10'   ORDER BY T.D' +
      'ATASTATUS DESC'#13#10'   ROWS 1'#13#10'  ) ULTIMA_CULTURA,'#13#10'  (SELECT T.DATA' +
      '_RESULTADO FROM ZOO_ANIMAL_TAREFAS  T'#13#10'   LEFT JOIN ZOO_ANIMAL_P' +
      'ROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_ANIMAL_PROTOCOLO' +
      #13#10'   LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS ADX ON ADX.KZOO_ANIMAL_DI' +
      'AGNOSTICO = P.KZOO_ANIMAL_DIAGNOSTICO AND ADX.QUARTO = AD.QUARTO' +
      #13#10'   LEFT JOIN ZOO_DIAGNOSTICOS D ON D.KZOO_DIAGNOSTICO = AD.KZO' +
      'O_DIAGNOSTICO'#13#10'   LEFT JOIN ZOO_TAREFA_RESULTADOS R ON R.KZOO_TA' +
      'REFA_RESULTADO = COALESCE ( T.KZOO_TAREFA_RESULTADO1,T.KZOO_TARE' +
      'FA_RESULTADO2,T.KZOO_TAREFA_RESULTADO3 )'#13#10'   WHERE T.KZOO_ANIMAL' +
      ' = AF.KZOO_ANIMAL AND T.EXAME = '#39'T'#39' AND'#13#10'     (    T.KZOO_TAREFA' +
      '_RESULTADO1 IS NOT NULL'#13#10'       OR T.KZOO_TAREFA_RESULTADO2 IS N' +
      'OT NULL'#13#10'       OR T.KZOO_TAREFA_RESULTADO3 IS NOT NULL) AND D.T' +
      'IPODIAGNOSTICO = :TIPO_MASTITE'#13#10'   ORDER BY T.DATASTATUS DESC'#13#10' ' +
      '  ROWS 1'#13#10'  ) DATA_CULTURA,'#13#10'  (SELECT '#13#10'      CASE '#13#10'       WHE' +
      'N TM.STATUS = :EXECUTADO THEN T.DATASTATUS'#13#10'       WHEN CAST( TM' +
      '.DATAPREVISTA AS DATE ) < CURRENT_DATE THEN DATEADD( DAY, DATEDI' +
      'FF( DAY, TM.DATAPREVISTA, CURRENT_TIMESTAMP ), T.DATAPREVISTA )'#13 +
      #10'       ELSE T.DATAPREVISTA'#13#10'      END'#13#10'   FROM ZOO_ANIMAL_TAREF' +
      'AS  T'#13#10'   LEFT JOIN ZOO_ANIMAL_TAREFAS  TM ON TM.KZOO_ANIMAL_TAR' +
      'EFA = T.KMZOO_ANIMAL_TAREFA'#13#10'   WHERE ( T.KZOO_ANIMAL = AF.KZOO_' +
      'ANIMAL )'#13#10'     AND ( T.STATUS = :DESCARTE_LEITE )'#13#10'     AND (TM.' +
      'STATUS = :EXECUTADO OR TM.STATUS = :PENDENTE )'#13#10'   ORDER BY 1 DE' +
      'SC'#13#10'   ROWS 1'#13#10'  ) DATA_ULTIMO_DESCARTE,'#13#10'  (SELECT A.CCS FROM Z' +
      'OO_PESAGEM_LEITE_ANALISE A WHERE A.KZOO_LACTACAO = L.KZOO_LACTAC' +
      'AO AND A.CCS > 0 ORDER BY A.KZOO_LACTACAO, A.DATA DESC ROWS 2 TO' +
      ' 2) PENULTIMA_CCS,'#13#10'  (SELECT A.CCS FROM ZOO_PESAGEM_LEITE_ANALI' +
      'SE A WHERE A.KZOO_LACTACAO = L.KZOO_LACTACAO AND A.CCS > 0 ORDER' +
      ' BY A.KZOO_LACTACAO, A.DATA DESC ROWS 1) ULTIMA_CCS ,'#13#10'  TM.DESC' +
      'ARTELEITE'#13#10'FROM ZOO_ANIMAL_TAREFAS TD'#13#10'LEFT JOIN ZOO_ANIMAL_TARE' +
      'FAS TM ON TM.KZOO_ANIMAL_TAREFA  = TD.KMZOO_ANIMAL_TAREFA'#13#10'LEFT ' +
      'JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = TM.KZO' +
      'O_ANIMAL_PROTOCOLO'#13#10'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS AD ON AD.K' +
      'ZOO_ANIMAL_DIAGNOSTICO = P.KZOO_ANIMAL_DIAGNOSTICO'#13#10'LEFT JOIN ZO' +
      'O_DIAGNOSTICOS D ON D.KZOO_DIAGNOSTICO = AD.KZOO_DIAGNOSTICO'#13#10'LE' +
      'FT JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = TM.KZOO_ANIMAL'#13#10'LEFT ' +
      'JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_AN' +
      'IMAL'#13#10'LEFT JOIN ZOO_LACTACOES L ON L.KZOO_LACTACAO = DAF.KULTIMA' +
      '_LACTACAO'#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ  ON EZ.KZOO_EVEN' +
      'TO_ZOOTECNICO = DAF.KULTIMA_MONTA AND EZ.KZOO_EVENTO_ZOOTECNICO ' +
      '<> L.KZOO_EVENTO_ZOOTECNICO'#13#10'WHERE'#13#10'     TD.STATUS = :DESCARTE_L' +
      'EITE'#13#10' AND AF.KCAD_FAZENDA = :KCAD_FAZENDA'#13#10' AND AF.STATUS <> :S' +
      'TATUS_DESCARTADO'#13#10' AND (TM.EXCLUIDO = '#39'F'#39')'#13#10' AND (TM.STATUS = :E' +
      'XECUTADO OR TM.STATUS = :PENDENTE)'#13#10' AND CASE'#13#10'       WHEN TM.ST' +
      'ATUS = :EXECUTADO THEN TD.DATASTATUS'#13#10'       WHEN CAST( TM.DATAP' +
      'REVISTA AS DATE ) < CURRENT_DATE THEN DATEADD( DAY, DATEDIFF( DA' +
      'Y, TM.DATAPREVISTA, CURRENT_DATE ), TD.DATAPREVISTA )'#13#10'       EL' +
      'SE TD.DATAPREVISTA'#13#10'     END BETWEEN CURRENT_DATE AND :DATAFIM'#13#10 +
      'ORDER BY 1,2,3,4,5,6,7'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'DESCONSIDERAR_PRENHEZ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PREV_SECAGEM_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PREV_SECAGEM_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_MASTITE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_MASTITE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTE_LEITE'
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
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_MASTITE'
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
        Name = 'TODOS_FUNCIONARIOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FUNCIONARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESCONSIDERAR_PRENHEZ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PREV_SECAGEM_PRIMIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PREV_SECAGEM_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_MASTITE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_MASTITE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXECUTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTE_LEITE'
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
        Name = 'DESCARTE_LEITE'
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
    Left = 70
    Top = 79
    object sqlTarefasKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlTarefasDATAPROGRAMADA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATAPROGRAMADA'
      Required = True
    end
    object sqlTarefasRESPONSAVEL: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'RESPONSAVEL'
      Size = 128
    end
    object sqlTarefasBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlTarefasTIPOTAREFA: TIntegerField
      FieldName = 'TIPOTAREFA'
      Required = True
    end
    object sqlTarefasDATA_MASTITE: TSQLTimeStampField
      DisplayLabel = 'Data mastite'
      FieldName = 'DATA_MASTITE'
    end
    object sqlTarefasCODIGO_MASTITE: TStringField
      FieldName = 'CODIGO_MASTITE'
      Size = 32
    end
    object sqlTarefasQUARTO: TSmallintField
      DisplayLabel = 'Quarto'
      FieldName = 'QUARTO'
    end
    object sqlTarefasDATAPREVISTA: TSQLTimeStampField
      FieldName = 'DATAPREVISTA'
      Required = True
    end
    object sqlTarefasNOME_MASTITE: TStringField
      DisplayLabel = 'Severidade'
      FieldName = 'NOME_MASTITE'
      Size = 128
    end
    object sqlTarefasTAREFA: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'TAREFA'
      Size = 51
    end
    object sqlTarefasBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlTarefasLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 32
    end
    object sqlTarefasDEL: TIntegerField
      FieldName = 'DEL'
    end
    object sqlTarefasNL: TIntegerField
      FieldName = 'NL'
    end
    object sqlTarefasATRASADA: TStringField
      FieldName = 'ATRASADA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlTarefasDPP: TLargeintField
      FieldName = 'DPP'
    end
    object sqlTarefasDIAS_SECAR: TLargeintField
      DisplayLabel = 'DPS'
      FieldName = 'DIAS_SECAR'
    end
    object sqlTarefasNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlTarefasULTIMA_CULTURA: TStringField
      DisplayLabel = #218'ltima cultura'
      FieldName = 'ULTIMA_CULTURA'
      Size = 128
    end
    object sqlTarefasDATA_CULTURA: TSQLTimeStampField
      FieldName = 'DATA_CULTURA'
    end
    object sqlTarefasDATA_ULTIMO_DESCARTE: TSQLTimeStampField
      DisplayLabel = 'Descartar at'#233
      FieldName = 'DATA_ULTIMO_DESCARTE'
    end
    object sqlTarefasDESCARTELEITE: TIntegerField
      FieldName = 'DESCARTELEITE'
    end
    object sqlTarefasPENULTIMA_CCS: TIntegerField
      FieldName = 'PENULTIMA_CCS'
    end
    object sqlTarefasULTIMA_CCS: TIntegerField
      FieldName = 'ULTIMA_CCS'
    end
  end
end
