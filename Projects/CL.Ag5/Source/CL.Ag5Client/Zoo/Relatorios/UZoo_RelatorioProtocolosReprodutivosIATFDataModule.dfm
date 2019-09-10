object Zoo_RelatorioProtocolosReprodutivosIATFDataModule: TZoo_RelatorioProtocolosReprodutivosIATFDataModule
  OldCreateOrder = False
  Height = 269
  Width = 489
  object sqlResultados: TTcSQLDataSet
    CommandText = 
      'SELECT '#13#10'      CAST(1 AS INTEGER) AS TIPO_REG,'#13#10'       P.KZOO_PR' +
      'OTOCOLO,                                                        ' +
      #13#10'       P.CODIGO,'#13#10'       P.TIPOPROTOCOLO,'#13#10'       ((SELECT COU' +
      'NT(*)'#13#10'           FROM ZOO_ANIMAL_PROTOCOLOS AP'#13#10'          WHERE' +
      ' AP.KZOO_PROTOCOLO = P.KZOO_PROTOCOLO'#13#10'            AND AP.DATA B' +
      'ETWEEN :DATAINI AND :DATAFIM'#13#10'            AND 0 = (SELECT COUNT(' +
      '*)'#13#10'                          FROM ZOO_EVENTOS_ZOOTECNICOS E1'#13#10' ' +
      '                        WHERE E1.KZOO_PROTOCOLO_IATF = P.KZOO_PR' +
      'OTOCOLO'#13#10'                           AND E1.KZOO_ANIMAL_FEMEA = A' +
      'P.KZOO_ANIMAL_FEMEA'#13#10'                           AND E1.DATAEVENT' +
      'O >= AP.DATA'#13#10'                           AND (E1.DATAEVENTO - AP' +
      '.DATA ) <= :DIAS_ENTRE_IATF1_E_IATF2  ))'#13#10'        +(SELECT COUNT' +
      '(*)  /*PROTOCOLO IATF*/'#13#10'            FROM ZOO_EVENTOS_ZOOTECNICO' +
      'S E'#13#10'           WHERE E.KZOO_PROTOCOLO_IATF = P.KZOO_PROTOCOLO'#13#10 +
      '             AND E.DATAEVENTO BETWEEN :DATAINI AND :DATAFIM'#13#10'   ' +
      '          AND 0 = (SELECT COUNT(*)'#13#10'                        FROM' +
      ' ZOO_EVENTOS_ZOOTECNICOS E1'#13#10'                       WHERE E1.KZO' +
      'O_ANIMAL_FEMEA = E.KZOO_ANIMAL_FEMEA'#13#10'                         A' +
      'ND E1.KZOO_PROTOCOLO_IATF = E.KZOO_PROTOCOLO_IATF'#13#10'             ' +
      '            AND E1.DATAEVENTO < E.DATAEVENTO'#13#10'                  ' +
      '       AND (E.DATAEVENTO - E1.DATAEVENTO) <= :DIAS_ENTRE_IATF1_E' +
      '_IATF2)'#13#10'           )'#13#10'        ) AS NUMEROS_TRATAMENTOS,'#13#10'      ' +
      ' ((SELECT COUNT(*)'#13#10'           FROM ZOO_EVENTOS_ZOOTECNICOS E'#13#10' ' +
      '          INNER JOIN ZOO_ANIMAIS_FEMEA AF ON E.KZOO_ANIMAL_FEMEA' +
      ' = AF.KZOO_ANIMAL_FEMEA'#13#10'           INNER JOIN ZOO_ANIMAL_PROTOC' +
      'OLOS AP ON E.KZOO_ANIMAL_FEMEA = AP.KZOO_ANIMAL_FEMEA'#13#10'         ' +
      '        AND E.DATAEVENTO = (SELECT MIN(E2.DATAEVENTO)'#13#10'         ' +
      '                              FROM ZOO_EVENTOS_ZOOTECNICOS E2'#13#10' ' +
      '                                      WHERE E2.KZOO_ANIMAL_FEMEA' +
      ' = E.KZOO_ANIMAL_FEMEA'#13#10'                                        ' +
      ' AND E2.TIPOEVENTO <> 1'#13#10'                                       ' +
      '  AND E2.DATAEVENTO >= AP.DATA'#13#10'                                ' +
      '         AND ( (E2.DATAEVENTO - AP.DATA) <= CAST( IIF(AF.NUMERO_' +
      'LACTACAO > 1,'#13#10'                                                 ' +
      '        CAST(:DIAS_ENTRE_PROTOCOLO_E_COBERTURA_MULTIPARA AS INTE' +
      'GER),'#13#10'                                                         ' +
      'CAST(  :DIAS_ENTRE_PROTOCOLO_E_COBERTURA_PRIMIPARA AS INTEGER))'#13 +
      #10'                                                      AS INTEGE' +
      'R) )'#13#10'                                         )'#13#10'           WHE' +
      'RE AP.KZOO_PROTOCOLO = P.KZOO_PROTOCOLO'#13#10'             AND E.TIPO' +
      'EVENTO <> 1 /*CIO*/'#13#10'             AND AP.DATA BETWEEN :DATAINI A' +
      'ND :DATAFIM'#13#10'             AND 0 = (SELECT COUNT(*)'#13#10'            ' +
      '              FROM ZOO_EVENTOS_ZOOTECNICOS E1'#13#10'                 ' +
      '        WHERE E1.KZOO_PROTOCOLO_IATF = P.KZOO_PROTOCOLO'#13#10'       ' +
      '                    AND E1.KZOO_ANIMAL_FEMEA = AP.KZOO_ANIMAL_FE' +
      'MEA'#13#10'                           AND E1.DATAEVENTO >= AP.DATA'#13#10'  ' +
      '                         AND (E1.DATAEVENTO - AP.DATA ) <= :DIAS' +
      '_ENTRE_IATF1_E_IATF2  ))'#13#10'        +(SELECT COUNT(*)  /*PROTOCOLO' +
      ' IATF*/'#13#10'            FROM ZOO_EVENTOS_ZOOTECNICOS E'#13#10'           ' +
      'WHERE E.KZOO_PROTOCOLO_IATF = P.KZOO_PROTOCOLO'#13#10'             AND' +
      ' E.DATAEVENTO BETWEEN :DATAINI AND :DATAFIM'#13#10'             AND 0 ' +
      '= (SELECT COUNT(*)'#13#10'                        FROM ZOO_EVENTOS_ZOO' +
      'TECNICOS E1'#13#10'                       WHERE E1.KZOO_ANIMAL_FEMEA =' +
      ' E.KZOO_ANIMAL_FEMEA'#13#10'                         AND E1.KZOO_PROTO' +
      'COLO_IATF = E.KZOO_PROTOCOLO_IATF'#13#10'                         AND ' +
      'E1.DATAEVENTO < E.DATAEVENTO'#13#10'                         AND (E.DA' +
      'TAEVENTO - E1.DATAEVENTO) <= :DIAS_ENTRE_IATF1_E_IATF2 )'#13#10'      ' +
      '      AND E.TIPOEVENTO <> 1/*CIO*/'#13#10'          )'#13#10#13#10'        ) AS ' +
      'COBERTURA_APOS_PROTOCOLO ,'#13#10'       ((SELECT COUNT(*)'#13#10'          ' +
      'FROM ZOO_EVENTOS_ZOOTECNICOS E'#13#10'          INNER JOIN ZOO_ANIMAIS' +
      '_FEMEA AF ON E.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL_FEMEA'#13#10'       ' +
      '   INNER JOIN ZOO_ANIMAIS F ON E.KZOO_ANIMAL_FEMEA = F.KZOO_ANIM' +
      'AL'#13#10'          INNER JOIN ZOO_ANIMAL_PROTOCOLOS AP ON E.KZOO_ANIM' +
      'AL_FEMEA = AP.KZOO_ANIMAL_FEMEA'#13#10'                  AND E.DATAEVE' +
      'NTO = (SELECT MIN(E2.DATAEVENTO)'#13#10'                              ' +
      '         FROM ZOO_EVENTOS_ZOOTECNICOS E2'#13#10'                      ' +
      '                 WHERE E2.KZOO_ANIMAL_FEMEA = E.KZOO_ANIMAL_FEME' +
      'A'#13#10'                                         AND E2.TIPOEVENTO <>' +
      ' 1'#13#10'                                         AND E2.DATAEVENTO >' +
      '= AP.DATA'#13#10'                                         AND ( (E2.DA' +
      'TAEVENTO - AP.DATA) <= CAST( IIF(AF.NUMERO_LACTACAO > 1,'#13#10'      ' +
      '                                                   CAST(:DIAS_EN' +
      'TRE_PROTOCOLO_E_COBERTURA_MULTIPARA AS INTEGER),'#13#10'              ' +
      '                                           CAST(  :DIAS_ENTRE_PR' +
      'OTOCOLO_E_COBERTURA_PRIMIPARA AS INTEGER))'#13#10'                    ' +
      '                                  AS INTEGER) ))'#13#10'          WHER' +
      'E AP.KZOO_PROTOCOLO = P.KZOO_PROTOCOLO'#13#10'            AND E.TIPOEV' +
      'ENTO <> 1 /*CIO*/'#13#10'            AND ((E.PRENHEZ IS NOT NULL AND E' +
      '.PRENHEZ <> '#39#39')'#13#10'                OR (  :CONSIDERA_NAO_PRENHE_REI' +
      'NSEMINADA = '#39'T'#39#13#10'                  AND E.KZOO_EVENTO_ZOOTECNICO ' +
      '<> AF.KULTIMA_MONTA'#13#10'                  AND EXISTS (SELECT KZOO_E' +
      'VENTO_ZOOTECNICO'#13#10'                                FROM ZOO_EVENT' +
      'OS_ZOOTECNICOS'#13#10'                               WHERE KZOO_ANIMAL' +
      '_FEMEA = E.KZOO_ANIMAL_FEMEA'#13#10'                                 A' +
      'ND DATAEVENTO > E.DATAEVENTO'#13#10'                                  ' +
      'AND TIPOEVENTO <> :EVENTO_CIO'#13#10'                                O' +
      'RDER BY DATAEVENTO ROWS 1)'#13#10'                  AND E.DATATOQUE IS' +
      ' NULL)'#13#10'                 OR (  :CONSIDERA_NAO_PRENHE_DESCARTADA ' +
      '= '#39'T'#39#13#10'                  AND E.KZOO_EVENTO_ZOOTECNICO = AF.KULTI' +
      'MA_MONTA'#13#10'                  AND F.STATUS = :ST_DESCARTADA'#13#10'     ' +
      '             AND E.DATATOQUE IS NULL )'#13#10#13#10'            )'#13#10'       ' +
      '     AND AP.DATA BETWEEN :DATAINI AND :DATAFIM'#13#10'            AND ' +
      '0 = (SELECT COUNT(*)'#13#10'                          FROM ZOO_EVENTOS' +
      '_ZOOTECNICOS E1'#13#10'                         WHERE E1.KZOO_PROTOCOL' +
      'O_IATF = P.KZOO_PROTOCOLO'#13#10'                           AND E1.KZO' +
      'O_ANIMAL_FEMEA = AP.KZOO_ANIMAL_FEMEA'#13#10'                         ' +
      '  AND E1.DATAEVENTO >= AP.DATA'#13#10'                           AND (' +
      'E1.DATAEVENTO - AP.DATA ) <= :DIAS_ENTRE_IATF1_E_IATF2  ))'#13#10'    ' +
      '    +(SELECT COUNT(*)  /*PROTOCOLO IATF*/'#13#10'            FROM ZOO_' +
      'EVENTOS_ZOOTECNICOS E'#13#10'            INNER JOIN ZOO_ANIMAIS_FEMEA ' +
      'AF ON E.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL_FEMEA'#13#10'            IN' +
      'NER JOIN ZOO_ANIMAIS F ON E.KZOO_ANIMAL_FEMEA = F.KZOO_ANIMAL'#13#10' ' +
      '          WHERE E.KZOO_PROTOCOLO_IATF = P.KZOO_PROTOCOLO'#13#10'      ' +
      '       AND E.DATAEVENTO BETWEEN :DATAINI AND :DATAFIM'#13#10'         ' +
      '    AND 0 = (SELECT COUNT(*)'#13#10'                        FROM ZOO_E' +
      'VENTOS_ZOOTECNICOS E1'#13#10'                       WHERE E1.KZOO_ANIM' +
      'AL_FEMEA = E.KZOO_ANIMAL_FEMEA'#13#10'                         AND E1.' +
      'KZOO_PROTOCOLO_IATF = E.KZOO_PROTOCOLO_IATF'#13#10'                   ' +
      '      AND E1.DATAEVENTO < E.DATAEVENTO'#13#10'                        ' +
      ' AND (E.DATAEVENTO - E1.DATAEVENTO) <= :DIAS_ENTRE_IATF1_E_IATF2' +
      ' )'#13#10'            AND E.TIPOEVENTO <> 1/*CIO*/'#13#10'              AND ' +
      '((E.PRENHEZ IS NOT NULL AND E.PRENHEZ <> '#39#39')'#13#10'                OR' +
      ' (  :CONSIDERA_NAO_PRENHE_REINSEMINADA = '#39'T'#39#13#10'                  ' +
      'AND E.KZOO_EVENTO_ZOOTECNICO <> AF.KULTIMA_MONTA'#13#10'              ' +
      '    AND EXISTS (SELECT KZOO_EVENTO_ZOOTECNICO'#13#10'                 ' +
      '               FROM ZOO_EVENTOS_ZOOTECNICOS'#13#10'                   ' +
      '            WHERE KZOO_ANIMAL_FEMEA = E.KZOO_ANIMAL_FEMEA'#13#10'     ' +
      '                            AND DATAEVENTO > E.DATAEVENTO'#13#10'     ' +
      '                             AND TIPOEVENTO <> :EVENTO_CIO'#13#10'    ' +
      '                            ORDER BY DATAEVENTO ROWS 1)'#13#10'       ' +
      '           AND E.DATATOQUE IS NULL)'#13#10'                 OR (  :CON' +
      'SIDERA_NAO_PRENHE_DESCARTADA = '#39'T'#39#13#10'                  AND E.KZOO' +
      '_EVENTO_ZOOTECNICO = AF.KULTIMA_MONTA'#13#10'                  AND F.S' +
      'TATUS = :ST_DESCARTADA'#13#10'                  AND E.DATATOQUE IS NUL' +
      'L )'#13#10#13#10'            )'#13#10'          )'#13#10'        ) AS COBERTURA_COM_DI' +
      'AGNOSTICO,'#13#10'       ((SELECT COUNT(*)'#13#10'          FROM ZOO_EVENTOS' +
      '_ZOOTECNICOS E'#13#10'           INNER JOIN ZOO_ANIMAIS_FEMEA AF ON E.' +
      'KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL_FEMEA'#13#10'          INNER JOIN Z' +
      'OO_ANIMAL_PROTOCOLOS AP ON E.KZOO_ANIMAL_FEMEA = AP.KZOO_ANIMAL_' +
      'FEMEA'#13#10'                  AND E.DATAEVENTO = (SELECT MIN(E2.DATAE' +
      'VENTO)'#13#10'                                       FROM ZOO_EVENTOS_' +
      'ZOOTECNICOS E2'#13#10'                                       WHERE E2.' +
      'KZOO_ANIMAL_FEMEA = E.KZOO_ANIMAL_FEMEA'#13#10'                       ' +
      '                  AND E2.TIPOEVENTO <> 1'#13#10'                      ' +
      '                   AND E2.DATAEVENTO >= AP.DATA'#13#10'               ' +
      '                          AND ( (E2.DATAEVENTO - AP.DATA) <= CAS' +
      'T( IIF(AF.NUMERO_LACTACAO > 1,'#13#10'                                ' +
      '                         CAST(:DIAS_ENTRE_PROTOCOLO_E_COBERTURA_' +
      'MULTIPARA AS INTEGER),'#13#10'                                        ' +
      '                 CAST(  :DIAS_ENTRE_PROTOCOLO_E_COBERTURA_PRIMIP' +
      'ARA AS INTEGER))'#13#10'                                              ' +
      '        AS INTEGER) ))'#13#10'          WHERE AP.KZOO_PROTOCOLO = P.KZ' +
      'OO_PROTOCOLO'#13#10'            AND E.TIPOEVENTO <> 1 /*CIO*/'#13#10'       ' +
      '     AND E.PRENHEZ IS NOT DISTINCT FROM '#39'T'#39#13#10'            AND AP.' +
      'DATA BETWEEN :DATAINI AND :DATAFIM'#13#10'            AND 0 = (SELECT ' +
      'COUNT(*)'#13#10'                          FROM ZOO_EVENTOS_ZOOTECNICOS' +
      ' E1'#13#10'                         WHERE E1.KZOO_PROTOCOLO_IATF = P.K' +
      'ZOO_PROTOCOLO'#13#10'                           AND E1.KZOO_ANIMAL_FEM' +
      'EA = AP.KZOO_ANIMAL_FEMEA'#13#10'                           AND E1.DAT' +
      'AEVENTO >= AP.DATA'#13#10'                           AND (E1.DATAEVENT' +
      'O - AP.DATA ) <= :DIAS_ENTRE_IATF1_E_IATF2  ))'#13#10'        +(SELECT' +
      ' COUNT(*)  /*PROTOCOLO IATF*/'#13#10'            FROM ZOO_EVENTOS_ZOOT' +
      'ECNICOS E'#13#10'           WHERE E.KZOO_PROTOCOLO_IATF = P.KZOO_PROTO' +
      'COLO'#13#10'             AND E.DATAEVENTO BETWEEN :DATAINI AND :DATAFI' +
      'M'#13#10'             AND 0 = (SELECT COUNT(*)'#13#10'                      ' +
      '  FROM ZOO_EVENTOS_ZOOTECNICOS E1'#13#10'                       WHERE ' +
      'E1.KZOO_ANIMAL_FEMEA = E.KZOO_ANIMAL_FEMEA'#13#10'                    ' +
      '     AND E1.KZOO_PROTOCOLO_IATF = E.KZOO_PROTOCOLO_IATF'#13#10'       ' +
      '                  AND E1.DATAEVENTO < E.DATAEVENTO'#13#10'            ' +
      '             AND (E.DATAEVENTO - E1.DATAEVENTO) <= :DIAS_ENTRE_I' +
      'ATF1_E_IATF2 )'#13#10'            AND E.TIPOEVENTO <> 1/*CIO*/'#13#10'      ' +
      '        AND E.PRENHEZ IS NOT DISTINCT FROM '#39'T'#39#13#10'          )'#13#10'   ' +
      '    ) AS PRENHEZES'#13#10'  FROM ZOO_PROTOCOLOS P'#13#10' WHERE P.ATIVO = '#39'T' +
      #39#13#10'   AND P.TIPOPROTOCOLO IN ( :TIPO_REPRODUTIVO, :TIPO_IATF)'#13#10' ' +
      '  AND 0 < ((SELECT COUNT(*)'#13#10'           FROM ZOO_ANIMAL_PROTOCOL' +
      'OS AP'#13#10'          WHERE AP.KZOO_PROTOCOLO = P.KZOO_PROTOCOLO'#13#10'   ' +
      '         AND AP.DATA BETWEEN :DATAINI AND :DATAFIM'#13#10'            ' +
      'AND 0 = (SELECT COUNT(*)'#13#10'                          FROM ZOO_EVE' +
      'NTOS_ZOOTECNICOS E1'#13#10'                         WHERE E1.KZOO_PROT' +
      'OCOLO_IATF = P.KZOO_PROTOCOLO'#13#10'                           AND E1' +
      '.DATAEVENTO >= AP.DATA'#13#10'                           AND (E1.DATAE' +
      'VENTO - AP.DATA ) <= :DIAS_ENTRE_IATF1_E_IATF2  ))'#13#10'        +(SE' +
      'LECT COUNT(*)  /*PROTOCOLO IATF*/'#13#10'            FROM ZOO_EVENTOS_' +
      'ZOOTECNICOS E'#13#10'           WHERE E.KZOO_PROTOCOLO_IATF = P.KZOO_P' +
      'ROTOCOLO'#13#10'             AND E.DATAEVENTO BETWEEN :DATAINI AND :DA' +
      'TAFIM'#13#10'             AND 0 = (SELECT COUNT(*)'#13#10'                  ' +
      '      FROM ZOO_EVENTOS_ZOOTECNICOS E1'#13#10'                       WH' +
      'ERE E1.KZOO_ANIMAL_FEMEA = E.KZOO_ANIMAL_FEMEA'#13#10'                ' +
      '         AND E1.KZOO_PROTOCOLO_IATF = E.KZOO_PROTOCOLO_IATF'#13#10'   ' +
      '                      AND E1.DATAEVENTO < E.DATAEVENTO'#13#10'        ' +
      '                 AND (E.DATAEVENTO - E1.DATAEVENTO) <= :DIAS_ENT' +
      'RE_IATF1_E_IATF2)'#13#10'           )'#13#10'        )'
    MaxBlobSize = -1
    Params = <
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_PRIMIPARA'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_PRIMIPARA'
        ParamType = ptInput
      end
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
        DataType = ftInteger
        Name = 'ST_DESCARTADA'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
        ParamType = ptInput
      end
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
        DataType = ftInteger
        Name = 'ST_DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_PRIMIPARA'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_REPRODUTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_IATF'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 68
    Top = 176
    object sqlResultadosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object sqlResultadosCODIGO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlResultadosTIPOPROTOCOLO: TIntegerField
      DisplayLabel = 'Tipo Protocolo'
      FieldName = 'TIPOPROTOCOLO'
    end
    object sqlResultadosNUMEROS_TRATAMENTOS: TLargeintField
      DisplayLabel = 'N'#250'mero de tratamentos'
      FieldName = 'NUMEROS_TRATAMENTOS'
    end
    object sqlResultadosCOBERTURA_APOS_PROTOCOLO: TLargeintField
      DisplayLabel = 'Coberturas ap'#243's protocolos'
      FieldName = 'COBERTURA_APOS_PROTOCOLO'
    end
    object sqlResultadosCOBERTURA_COM_DIAGNOSTICO: TLargeintField
      DisplayLabel = 'Coberturas com diagn'#243'stico de gesta'#231#227'o'
      FieldName = 'COBERTURA_COM_DIAGNOSTICO'
    end
    object sqlResultadosPRENHEZES: TLargeintField
      DisplayLabel = 'Prenhezes'
      FieldName = 'PRENHEZES'
    end
    object sqlResultadosTIPO_REG: TIntegerField
      FieldName = 'TIPO_REG'
      Required = True
    end
  end
  object dspResultados: TDataSetProvider
    DataSet = sqlResultados
    Left = 44
    Top = 108
  end
  object cdsResultados: TClientDataSet
    Aggregates = <>
    Params = <
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_PRIMIPARA'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_PRIMIPARA'
        ParamType = ptInput
      end
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
        DataType = ftInteger
        Name = 'ST_DESCARTADA'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
        ParamType = ptInput
      end
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
        DataType = ftInteger
        Name = 'ST_DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_MULTIPARA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_PRIMIPARA'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_REPRODUTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_IATF'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
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
        Name = 'DIAS_ENTRE_IATF1_E_IATF2'
        ParamType = ptInput
      end>
    ProviderName = 'dspResultados'
    OnCalcFields = cdsResultadosCalcFields
    Left = 68
    Top = 48
    object cdsResultadosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Visible = False
      FixedChar = True
    end
    object cdsResultadosCODIGO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsResultadosTIPOPROTOCOLO: TIntegerField
      DisplayLabel = 'Tipo protocolo'
      FieldName = 'TIPOPROTOCOLO'
      Visible = False
    end
    object cdsResultadosNUMEROS_TRATAMENTOS: TLargeintField
      DisplayLabel = 'N'#250'mero de tratamentos'
      FieldName = 'NUMEROS_TRATAMENTOS'
      DisplayFormat = '0'
    end
    object cdsResultadosCOBERTURA_APOS_PROTOCOLO: TLargeintField
      DisplayLabel = 'Coberturas ap'#243's protocolo'
      FieldName = 'COBERTURA_APOS_PROTOCOLO'
      DisplayFormat = '0'
    end
    object cdsResultadosCOBERTURA_COM_DIAGNOSTICO: TLargeintField
      DisplayLabel = 'Coberturas com diagn'#243'stico de gesta'#231#227'o'
      FieldName = 'COBERTURA_COM_DIAGNOSTICO'
      DisplayFormat = '0'
    end
    object cdsResultadosPRENHEZES: TLargeintField
      DisplayLabel = 'Prenhezes'
      FieldName = 'PRENHEZES'
      DisplayFormat = '0'
    end
    object cdsResultadosTIPO_REG: TIntegerField
      FieldName = 'TIPO_REG'
      Required = True
      Visible = False
    end
    object cdsResultadosTAXA_CONCEPCAO: TFloatField
      DisplayLabel = 'Taxa de concep'#231#227'o (%)'
      FieldKind = fkCalculated
      FieldName = 'TAXA_CONCEPCAO'
      DisplayFormat = '0'
      Calculated = True
    end
  end
end
