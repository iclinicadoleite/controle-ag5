object Zoo_RelatorioEventosReprodutivosDataModule: TZoo_RelatorioEventosReprodutivosDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 288
  Width = 603
  object sqlResultados: TTcSQLDataSet
    CommandText = 
      'SELECT EV.KZOO_EVENTO_ZOOTECNICO,'#13#10'       EV.KZOO_ANIMAL_FEMEA,'#13 +
      #10'       ANF.BRINCO BRINCO_FEMEA,'#13#10'       ANF.NOMEESTABULO NOME_F' +
      'EMEA,'#13#10'(SELECT QTDE_COBERTURA FROM ZOO_GET_QTDE_COBERTURA_LACTAC' +
      'AO(EV.KZOO_ANIMAL_FEMEA, EV.DATAEVENTO)) QTDE_COBERTURA,'#13#10'      ' +
      ' EV.DATAEVENTO,'#13#10'       EV.TIPOEVENTO,'#13#10'       (SELECT CAST( SYS' +
      '$DESCRIPTION AS VARCHAR ( 20 ) ) '#13#10'          FROM SYS$TYPES_GETD' +
      'ESCRIPTION( '#39'TIPO_EVENTO_ZOO'#39', EV.TIPOEVENTO )) "DESC_TIPOEVENTO' +
      '",'#13#10'       EV.KZOO_ANIMAL_MACHO,'#13#10'       ANM.BRINCO BRINCO_MACHO' +
      ','#13#10'       ANM.NOMEESTABULO NOME_MACHO,'#13#10'       EV.KCAD_FUNCIONAR' +
      'IO,'#13#10'       EV.NOMEFUNCIONARIO,'#13#10'       IIF( (:CONSIDERA_NAO_PRE' +
      'NHE_REINSEMINADA = '#39'T'#39' AND EV.DATATOQUE IS NULL AND EV.TIPOEVENT' +
      'O <> :EVENTO_CIO AND ZANF.KULTIMA_MONTA <> EV.KZOO_EVENTO_ZOOTEC' +
      'NICO),'#13#10'            (SELECT DATAEVENTO'#13#10'               FROM ZOO_' +
      'EVENTOS_ZOOTECNICOS'#13#10'              WHERE KZOO_ANIMAL_FEMEA = EV.' +
      'KZOO_ANIMAL_FEMEA'#13#10'                AND DATAEVENTO > EV.DATAEVENT' +
      'O'#13#10'                AND TIPOEVENTO <> :EVENTO_CIO'#13#10'              ' +
      'ORDER BY DATAEVENTO ROWS 1) ,'#13#10'            ( IIF ((:CONSIDERA_NA' +
      'O_PRENHE_DESCARTADA = '#39'T'#39' AND EV.DATATOQUE IS NULL AND EV.TIPOEV' +
      'ENTO <> :EVENTO_CIO AND ZANF.KULTIMA_MONTA = EV.KZOO_EVENTO_ZOOT' +
      'ECNICO AND ANF.STATUS = :ST_DESCARTADA) ,'#13#10'                  (SE' +
      'LECT DATA FROM ZOO_ANIMAL_DESCARTES WHERE KZOO_ANIMAL = EV.KZOO_' +
      'ANIMAL_FEMEA),'#13#10'                  EV.DATATOQUE ))'#13#10'       ) DATA' +
      'TOQUE,'#13#10'       CASE'#13#10'       IIF( (:CONSIDERA_NAO_PRENHE_REINSEMI' +
      'NADA = '#39'T'#39' AND EV.DATATOQUE IS NULL AND EV.TIPOEVENTO <> :EVENTO' +
      '_CIO AND ZANF.KULTIMA_MONTA <> EV.KZOO_EVENTO_ZOOTECNICO),'#13#10'    ' +
      '        ( IIF ((EXISTS (SELECT KZOO_EVENTO_ZOOTECNICO'#13#10'         ' +
      '                      FROM ZOO_EVENTOS_ZOOTECNICOS'#13#10'            ' +
      '                  WHERE KZOO_ANIMAL_FEMEA = EV.KZOO_ANIMAL_FEMEA' +
      #13#10'                                AND DATAEVENTO > EV.DATAEVENTO' +
      #13#10'                                AND TIPOEVENTO <> :EVENTO_CIO'#13 +
      #10'                              ORDER BY DATAEVENTO ROWS 1)) ,'#13#10' ' +
      '                   '#39'F'#39','#13#10'                    EV.PRENHEZ )),'#13#10'   ' +
      '         ( IIF ((:CONSIDERA_NAO_PRENHE_DESCARTADA = '#39'T'#39' AND EV.D' +
      'ATATOQUE IS NULL AND EV.TIPOEVENTO <> :EVENTO_CIO AND ZANF.KULTI' +
      'MA_MONTA = EV.KZOO_EVENTO_ZOOTECNICO AND ANF.STATUS = :ST_DESCAR' +
      'TADA) ,'#13#10'                    '#39'F'#39','#13#10'                    EV.PRENHE' +
      'Z ))'#13#10'            )'#13#10'         WHEN '#39'T'#39' THEN '#39'Sim'#39#13#10'         WHEN' +
      ' '#39'F'#39' THEN '#39'N'#227'o'#39#13#10'         ELSE null'#13#10'       end PRENHEZ,'#13#10'      ' +
      ' EV.IATF,'#13#10'       EV.KZOO_PROTOCOLO_IATF,'#13#10'       PRI.NOME DESC_' +
      'PROTOCOLO_IATF,'#13#10'       EV.ABORTOPARTO,'#13#10'       (SELECT CAST( SY' +
      'S$DESCRIPTION AS VARCHAR ( 20 ) ) FROM SYS$TYPES_GETDESCRIPTION(' +
      ' '#39'TIPO_PARTOABORTO'#39', EV.ABORTOPARTO )'#13#10'       ) TIPO_ABORTOPARTO' +
      ','#13#10'       EV.DATAABORTOPARTO,'#13#10'       (SELECT COUNT(*) '#13#10'       ' +
      '   FROM ZOO_ANIMAL_LINHAGEM '#13#10'        WHERE EV.KZOO_EVENTO_ZOOTE' +
      'CNICO = KZOO_EVENTO_ZOOTECNICO'#13#10'        ) CRIAS,'#13#10'       (SELECT' +
      ' CAST(LIST(SEXO,'#39'; '#39') AS VARCHAR ( 30 ) )'#13#10'          FROM ZOO_AN' +
      'IMAL_LINHAGEM '#13#10'         WHERE EV.KZOO_EVENTO_ZOOTECNICO = KZOO_' +
      'EVENTO_ZOOTECNICO'#13#10'        ) SEXO_CRIAS,'#13#10'       (SELECT CAST(LI' +
      'ST(CASE NATIMORTO WHEN '#39'T'#39' THEN '#39'Sim'#39' ELSE '#39'N'#227'o'#39' END ,'#39'; '#39') AS V' +
      'ARCHAR ( 30 ) ) '#13#10'          FROM ZOO_ANIMAL_LINHAGEM '#13#10'        W' +
      'HERE EV.KZOO_EVENTO_ZOOTECNICO = KZOO_EVENTO_ZOOTECNICO'#13#10'       ' +
      ') NATIMORTO'#13#10'  FROM ZOO_EVENTOS_ZOOTECNICOS EV'#13#10'     INNER JOIN ' +
      'ZOO_ANIMAIS ANF ON EV.KZOO_ANIMAL_FEMEA = ANF.KZOO_ANIMAL'#13#10'     ' +
      'INNER JOIN ZOO_ANIMAIS_FEMEA ZANF ON ANF.KZOO_ANIMAL = ZANF.KZOO' +
      '_ANIMAL_FEMEA'#13#10'     LEFT JOIN ZOO_ANIMAIS ANM ON EV.KZOO_ANIMAL_' +
      'MACHO = ANM.KZOO_ANIMAL'#13#10'     LEFT JOIN ZOO_ANIMAIS_MACHO ZANM O' +
      'N ANM.KZOO_ANIMAL = ZANM.KZOO_ANIMAL_MACHO'#13#10'     LEFT  JOIN ZOO_' +
      'PROTOCOLOS PRI ON EV.KZOO_PROTOCOLO_IATF = PRI.KZOO_PROTOCOLO'#13#10' ' +
      'where (( :PESQDATAOCORRENCIA = '#39'C'#39' and EV.DATAEVENTO BETWEEN :DA' +
      'TAINI AND :DATAFIM )'#13#10'   or ( :PESQDATAOCORRENCIA = '#39'P'#39' and EV.D' +
      'ATAABORTOPARTO BETWEEN :DATAINI AND :DATAFIM ))'#13#10'   and ( :PESQT' +
      'IPOABORTOPARTO = '#39'T'#39' or EV.ABORTOPARTO = :ABORTOPARTO )'#13#10'   and ' +
      '( :PESQTIPOEVENTO = '#39'T'#39' or EV.TIPOEVENTO = :TIPOEVENTO )'#13#10' ORDER' +
      ' BY 5'
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
        Name = 'EVENTO_CIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_DESCARTADA'
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
        Name = 'EVENTO_CIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PESQDATAOCORRENCIA'
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
        DataType = ftFixedChar
        Name = 'PESQDATAOCORRENCIA'
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
        DataType = ftFixedChar
        Name = 'PESQTIPOABORTOPARTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ABORTOPARTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PESQTIPOEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOEVENTO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 136
    Top = 192
    object sqlResultadosKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      Required = True
      FixedChar = True
    end
    object sqlResultadosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlResultadosBRINCO_FEMEA: TStringField
      FieldName = 'BRINCO_FEMEA'
      Size = 15
    end
    object sqlResultadosNOME_FEMEA: TStringField
      FieldName = 'NOME_FEMEA'
      Size = 60
    end
    object sqlResultadosQTDE_COBERTURA: TIntegerField
      DisplayLabel = 'N'#250'mero da cobertura'
      FieldName = 'QTDE_COBERTURA'
    end
    object sqlResultadosDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object sqlResultadosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlResultadosDESC_TIPOEVENTO: TStringField
      FieldName = 'DESC_TIPOEVENTO'
    end
    object sqlResultadosKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      FixedChar = True
    end
    object sqlResultadosBRINCO_MACHO: TStringField
      FieldName = 'BRINCO_MACHO'
      Size = 15
    end
    object sqlResultadosNOME_MACHO: TStringField
      FieldName = 'NOME_MACHO'
      Size = 60
    end
    object sqlResultadosKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlResultadosNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlResultadosDATATOQUE: TSQLTimeStampField
      FieldName = 'DATATOQUE'
    end
    object sqlResultadosPRENHEZ: TStringField
      FieldName = 'PRENHEZ'
      FixedChar = True
      Size = 3
    end
    object sqlResultadosIATF: TStringField
      FieldName = 'IATF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlResultadosKZOO_PROTOCOLO_IATF: TStringField
      FieldName = 'KZOO_PROTOCOLO_IATF'
      FixedChar = True
    end
    object sqlResultadosDESC_PROTOCOLO_IATF: TStringField
      FieldName = 'DESC_PROTOCOLO_IATF'
      Size = 128
    end
    object sqlResultadosABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
    end
    object sqlResultadosTIPO_ABORTOPARTO: TStringField
      FieldName = 'TIPO_ABORTOPARTO'
    end
    object sqlResultadosDATAABORTOPARTO: TSQLTimeStampField
      FieldName = 'DATAABORTOPARTO'
    end
    object sqlResultadosCRIAS: TIntegerField
      FieldName = 'CRIAS'
    end
    object sqlResultadosSEXO_CRIAS: TStringField
      FieldName = 'SEXO_CRIAS'
      Size = 30
    end
    object sqlResultadosNATIMORTO: TStringField
      FieldName = 'NATIMORTO'
      Size = 30
    end
  end
  object dspResultados: TDataSetProvider
    DataSet = sqlResultados
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 128
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
        Name = 'EVENTO_CIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_DESCARTADA'
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
        Name = 'EVENTO_CIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PESQDATAOCORRENCIA'
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
        DataType = ftFixedChar
        Name = 'PESQDATAOCORRENCIA'
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
        DataType = ftFixedChar
        Name = 'PESQTIPOABORTOPARTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ABORTOPARTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PESQTIPOEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOEVENTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspResultados'
    BeforeOpen = cdsResultadosBeforeOpen
    Left = 136
    Top = 56
    object cdsResultadosKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsResultadosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsResultadosBRINCO_FEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO_FEMEA'
      Size = 15
    end
    object cdsResultadosNOME_FEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_FEMEA'
      Size = 60
    end
    object cdsResultadosQTDE_COBERTURA: TIntegerField
      DisplayLabel = 'N'#250'mero da cobertura'
      FieldName = 'QTDE_COBERTURA'
    end
    object cdsResultadosDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data da cobertura'
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object cdsResultadosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
      Visible = False
    end
    object cdsResultadosDESC_TIPOEVENTO: TStringField
      DisplayLabel = 'Tipo de cobertura'
      FieldName = 'DESC_TIPOEVENTO'
    end
    object cdsResultadosKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Visible = False
      FixedChar = True
    end
    object cdsResultadosBRINCO_MACHO: TStringField
      DisplayLabel = 'C'#243'digo Touro'
      FieldName = 'BRINCO_MACHO'
      Size = 15
    end
    object cdsResultadosNOME_MACHO: TStringField
      DisplayLabel = 'Nome do Touro'
      FieldName = 'NOME_MACHO'
      Size = 60
    end
    object cdsResultadosKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object cdsResultadosNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Inseminador'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object cdsResultadosDATATOQUE: TSQLTimeStampField
      DisplayLabel = 'Data do toque'
      FieldName = 'DATATOQUE'
    end
    object cdsResultadosPRENHEZ: TStringField
      DisplayLabel = 'Prenhez'
      FieldName = 'PRENHEZ'
      FixedChar = True
      Size = 3
    end
    object cdsResultadosIATF: TStringField
      FieldName = 'IATF'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsResultadosKZOO_PROTOCOLO_IATF: TStringField
      FieldName = 'KZOO_PROTOCOLO_IATF'
      Visible = False
      FixedChar = True
    end
    object cdsResultadosDESC_PROTOCOLO_IATF: TStringField
      DisplayLabel = 'Protocolo IATF'
      FieldName = 'DESC_PROTOCOLO_IATF'
      Size = 128
    end
    object cdsResultadosABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
      Visible = False
    end
    object cdsResultadosTIPO_ABORTOPARTO: TStringField
      DisplayLabel = 'Parto/aborto'
      FieldName = 'TIPO_ABORTOPARTO'
    end
    object cdsResultadosDATAABORTOPARTO: TSQLTimeStampField
      DisplayLabel = 'Data do parto/aborto'
      FieldName = 'DATAABORTOPARTO'
    end
    object cdsResultadosCRIAS: TIntegerField
      DisplayLabel = 'Cria(s)'
      FieldName = 'CRIAS'
    end
    object cdsResultadosSEXO_CRIAS: TStringField
      DisplayLabel = 'Sexo da(s) cria(s)'
      FieldName = 'SEXO_CRIAS'
      Size = 30
    end
    object cdsResultadosNATIMORTO: TStringField
      DisplayLabel = 'Natimorto(s)'
      FieldName = 'NATIMORTO'
      Size = 30
    end
  end
  object cdsTipoPartoAborto: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 392
    Top = 104
    object cdsTipoPartoAbortoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoEvento: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 392
    Top = 176
    object cdsTipoEventoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoEventoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoEventoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoEventoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
