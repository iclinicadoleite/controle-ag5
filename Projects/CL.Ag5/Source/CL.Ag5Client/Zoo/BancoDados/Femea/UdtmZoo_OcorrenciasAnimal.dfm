object dtmZoo_OcorrenciasAnimal: TdtmZoo_OcorrenciasAnimal
  OldCreateOrder = True
  Height = 308
  Width = 476
  object cdsOcorrenciasCronologica: TClientDataSet
    Aggregates = <>
    Filter = 'EXCLUIDO = '#39'F'#39
    Filtered = True
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end>
    ProviderName = 'dspOcorrenciasCronologica'
    BeforeInsert = cdsOcorrenciasCronologicaBeforeInsert
    OnCalcFields = cdsOcorrenciasCronologicaCalcFields
    Left = 256
    Top = 36
    object cdsOcorrenciasCronologicaTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOcorrenciasCronologicaDESCR_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkInternalCalc
      FieldName = 'DESCR_TIPO'
      Size = 15
    end
    object cdsOcorrenciasCronologicaRECORDKEY: TStringField
      FieldName = 'RECORDKEY'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsOcorrenciasCronologicaDATA: TDateField
      DisplayLabel = 'Data (ocorr'#234'ncia/prevista)'
      FieldName = 'DATA'
    end
    object cdsOcorrenciasCronologicaOCORRENCIA: TStringField
      DisplayLabel = 'Ocorr'#234'ncia'
      FieldName = 'OCORRENCIA'
      Required = True
      OnGetText = cdsOcorrenciasCronologicaOCORRENCIAGetText
      Size = 163
    end
    object cdsOcorrenciasCronologicaQUARTO: TSmallintField
      DisplayLabel = 'Quarto'
      FieldName = 'QUARTO'
    end
    object cdsOcorrenciasCronologicaDESCR_QUARTO: TStringField
      DisplayLabel = 'Quarto'
      FieldKind = fkLookup
      FieldName = 'DESCR_QUARTO'
      LookupDataSet = cdsTipoQuarto
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'QUARTO'
      Size = 160
      Lookup = True
    end
    object cdsOcorrenciasCronologicaORIGEM: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      Size = 128
    end
    object cdsOcorrenciasCronologicaSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
      OnValidate = cdsOcorrenciasCronologicaSTATUSValidate
    end
    object cdsOcorrenciasCronologicaDESCR_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkInternalCalc
      FieldName = 'DESCR_STATUS'
      Size = 128
    end
    object cdsOcorrenciasCronologicaDATAEXECUCAO: TSQLTimeStampField
      DisplayLabel = 'Data (execu'#231#227'o)'
      FieldName = 'DATAEXECUCAO'
    end
    object cdsOcorrenciasCronologicaKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Nome funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object cdsOcorrenciasCronologicaNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Nome funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object cdsOcorrenciasCronologicaOBS: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsOcorrenciasCronologicaEXCLUIDO: TStringField
      DisplayLabel = 'Exclu'#237'da'
      FieldName = 'EXCLUIDO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOcorrenciasCronologicaREEXECUTAR_EM: TSQLTimeStampField
      DisplayLabel = 'Repetir em'
      FieldName = 'REEXECUTAR_EM'
    end
    object cdsOcorrenciasCronologicaVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object cdsOcorrenciasCronologicaPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dspOcorrenciasCronologica: TDataSetProvider
    DataSet = sqlOcorrenciasCronologica
    Options = [poIncFieldProps, poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspOcorrenciasCronologicaBeforeUpdateRecord
    Left = 224
    Top = 92
  end
  object sqlOcorrenciasCronologica: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'    '#39'D'#39' TIPO,'#13#10'    D.KZOO_ANIMAL_DIAGNOSTICO   RECORDKE' +
      'Y,'#13#10'    CAST( D.DATA AS DATE )                      DATA,'#13#10'    D' +
      '.CODIGO ||  '#39' - '#39' || D.NOME OCORRENCIA,'#13#10'    D.QUARTO QUARTO,'#13#10' ' +
      '   CAST ( '#39#39' AS SYS$DESCR )    ORIGEM, '#13#10'    D.STATUS           ' +
      '         STATUS,'#13#10'    D.DATASTATUS   DATAEXECUCAO,'#13#10'    CAST ( '#39 +
      #39' AS SYS$FKGUID22 ) KCAD_FUNCIONARIO,'#13#10'    CAST ( '#39#39' AS SYS$DESC' +
      'R )    NOMEFUNCIONARIO,'#13#10'    D.OBS                       OBS,'#13#10' ' +
      '   D.EXCLUIDO             EXCLUIDO,'#13#10'   CAST( NULL AS SYS$DATE )' +
      ' REEXECUTAR_EM,'#13#10'   CAST( 0 AS SYS$INT ) VEZAODIA,'#13#10'   DZ.POR_QU' +
      'ARTO'#13#10'FROM ZOO_ANIMAL_DIAGNOSTICOS D'#13#10'LEFT JOIN ZOO_DIAGNOSTICOS' +
      ' DZ ON DZ.KZOO_DIAGNOSTICO = D.KZOO_DIAGNOSTICO'#13#10'WHERE D.KZOO_AN' +
      'IMAL_FEMEA = :KZOO_ANIMAL_FEMEA'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT'#13#10'    '#39'P'#39' ' +
      'TIPO,'#13#10'    P.KZOO_ANIMAL_PROTOCOLO     RECORDKEY,'#13#10'    CAST( P.D' +
      'ATA AS DATE )                    DATA,'#13#10'    P.CODIGO || '#39' - '#39' ||' +
      ' P.NOME OCORRENCIA,'#13#10'    CAST ( NULL AS SMALLINT ) QUARTO,'#13#10'    ' +
      'CAST ( SUBSTRING ( D.CODIGO || '#39' - '#39' || D.NOME FROM 1 FOR 128) A' +
      'S SYS$DESCR ) ORIGEM,'#13#10'    P.STATUS                    STATUS,'#13#10 +
      '    D.DATASTATUS   DATAEXECUCAO,'#13#10'    CAST ( '#39#39' AS SYS$FKGUID22 ' +
      ') KCAD_FUNCIONARIO,'#13#10'    CAST ( '#39#39' AS SYS$DESCR )    NOMEFUNCION' +
      'ARIO,'#13#10'    P.OBS                       OBS,'#13#10'    P.EXCLUIDO     ' +
      '        EXCLUIDO,'#13#10'   CAST(NULL AS SYS$DATE ) REEXECUTAR_EM,'#13#10'  ' +
      ' CAST( 0 AS SYS$INT ) VEZAODIA,'#13#10'   '#39'F'#39' POR_QUARTO'#13#10'FROM ZOO_ANI' +
      'MAL_PROTOCOLOS P'#13#10'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_' +
      'ANIMAL_DIAGNOSTICO = P.KZOO_ANIMAL_DIAGNOSTICO'#13#10'WHERE P.KZOO_ANI' +
      'MAL_FEMEA = :KZOO_ANIMAL_FEMEA'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT DISTINCT'#13#10 +
      '    '#39'T'#39' TIPO,'#13#10'    T.KZOO_ANIMAL_TAREFA                RECORDKEY' +
      ','#13#10'    CAST( T.DATAPREVISTA AS DATE )                           ' +
      '   DATA,'#13#10'    T.CODIGO || '#39' - '#39' || T.NOME              OCORRENCI' +
      'A,'#13#10'    CAST ( NULL AS SMALLINT ) QUARTO,'#13#10'    CAST ( SUBSTRING ' +
      '( COALESCE ( P.CODIGO || '#39' - '#39' || P.NOME, '#39#39' ) || COALESCE ( '#39' (' +
      #39' || D.CODIGO || COALESCE(  '#39' ('#39' ||  STS.SYS$DESCRIPTION ||  '#39')'#39 +
      ','#39#39') || '#39' - '#39' || D.NOME || COALESCE('#39'  no quarto '#39' ||STD.SYS$DES' +
      'CRIPTION,'#39#39') || '#39')'#39', '#39#39' ) FROM 1 FOR 128) AS SYS$DESCR ) ORIGEM,' +
      #13#10'    T.STATUS                                  STATUS,'#13#10'    T.D' +
      'ATASTATUS                              DATAEXECUCAO,'#13#10'    T.KCAD' +
      '_FUNCIONARIO                        KCAD_FUNCIONARIO,'#13#10'    T.NOM' +
      'EFUNCIONARIO                         NOMEFUNCIONARIO,'#13#10'    T.OBS' +
      '                                     OBS,'#13#10'    T.EXCLUIDO       ' +
      '      EXCLUIDO,'#13#10'    T.REEXECUTAR_EM REEXECUTAR_EM,'#13#10'    T.VEZAO' +
      'DIA,'#13#10'    '#39'F'#39' POR_QUARTO'#13#10'FROM ZOO_ANIMAL_TAREFAS T'#13#10'LEFT JOIN Z' +
      'OO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO   = T.KZOO_ANI' +
      'MAL_PROTOCOLO'#13#10'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_ANI' +
      'MAL_DIAGNOSTICO = P.KZOO_ANIMAL_DIAGNOSTICO'#13#10'LEFT JOIN SYS$TYPES' +
      '_GETDESCRIPTION( '#39'TIPO_SIGLAQUARTO'#39', D.QUARTO ) STS ON 1=1'#13#10'LEFT' +
      ' JOIN SYS$TYPES_GETDESCRIPTION( '#39'TIPO_QUARTO'#39', D.QUARTO ) STD ON' +
      ' 1=1'#13#10'WHERE T.KZOO_ANIMAL = :KZOO_ANIMAL_FEMEA AND T.KMZOO_ANIMA' +
      'L_TAREFA IS NULL'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT DISTINCT -- descartes'#13#10' ' +
      '   '#39'X'#39' TIPO,'#13#10'    CAST( NULL AS CHAR(20) ) RECORDKEY,'#13#10'    IIF (' +
      ' TM.STATUS = 2, CAST( T.DATAPREVISTA AS DATE ), CURRENT_DATE + T' +
      '.DDT ) DATA,'#13#10'    T.CODIGO || '#39' - '#39' || T.NOME              OCORR' +
      'ENCIA,'#13#10'    CAST ( NULL AS SMALLINT ) QUARTO,'#13#10'    CAST ( NULL A' +
      'S VARCHAR(128)) ORIGEM,'#13#10'    T.STATUS                           ' +
      '       STATUS,'#13#10'    NULL   DATAEXECUCAO,'#13#10'    NULL KCAD_FUNCIONA' +
      'RIO,'#13#10'    NULL NOMEFUNCIONARIO,'#13#10'    T.OBS                      ' +
      '               OBS,'#13#10'    T.EXCLUIDO             EXCLUIDO,'#13#10'    N' +
      'ULL REEXECUTAR_EM,'#13#10'    NULL VEZAODIA,'#13#10'    '#39'F'#39' POR_QUARTO'#13#10'FROM' +
      ' ZOO_ANIMAL_TAREFAS T'#13#10'INNER JOIN ZOO_ANIMAL_TAREFAS TM ON TM.KZ' +
      'OO_ANIMAL_TAREFA = T.KMZOO_ANIMAL_TAREFA'#13#10'LEFT JOIN ZOO_ANIMAL_P' +
      'ROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO   = T.KZOO_ANIMAL_PROTOCO' +
      'LO'#13#10'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_ANIMAL_DIAGNOS' +
      'TICO = P.KZOO_ANIMAL_DIAGNOSTICO'#13#10'LEFT JOIN SYS$TYPES_GETDESCRIP' +
      'TION( '#39'TIPO_SIGLAQUARTO'#39', D.QUARTO ) STS ON 1=1'#13#10'LEFT JOIN SYS$T' +
      'YPES_GETDESCRIPTION( '#39'TIPO_QUARTO'#39', D.QUARTO ) STD ON 1=1'#13#10'WHERE' +
      ' TM.STATUS <= 2 '#13#10'  AND TM.EXCLUIDO = '#39'F'#39#13#10'  AND T.KZOO_ANIMAL =' +
      ' :KZOO_ANIMAL_FEMEA '#13#10'  AND T.KMZOO_ANIMAL_TAREFA IS NOT NULL'#13#10'O' +
      'RDER BY 3'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 260
    Top = 152
    object sqlOcorrenciasCronologicaTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlOcorrenciasCronologicaRECORDKEY: TStringField
      FieldName = 'RECORDKEY'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlOcorrenciasCronologicaDATA: TDateField
      FieldName = 'DATA'
    end
    object sqlOcorrenciasCronologicaOCORRENCIA: TStringField
      DisplayLabel = 'Ocorr'#234'ncia'
      FieldName = 'OCORRENCIA'
      Required = True
      Size = 163
    end
    object sqlOcorrenciasCronologicaQUARTO: TSmallintField
      DisplayLabel = 'Quarto'
      FieldName = 'QUARTO'
    end
    object sqlOcorrenciasCronologicaORIGEM: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      Size = 128
    end
    object sqlOcorrenciasCronologicaSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
    end
    object sqlOcorrenciasCronologicaDATAEXECUCAO: TSQLTimeStampField
      DisplayLabel = 'Data (execu'#231#227'o)'
      FieldName = 'DATAEXECUCAO'
    end
    object sqlOcorrenciasCronologicaKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Nome funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object sqlOcorrenciasCronologicaNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Nome funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlOcorrenciasCronologicaOBS: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlOcorrenciasCronologicaEXCLUIDO: TStringField
      DisplayLabel = 'Exclu'#237'da'
      FieldName = 'EXCLUIDO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlOcorrenciasCronologicaREEXECUTAR_EM: TSQLTimeStampField
      DisplayLabel = 'Repetir em'
      FieldName = 'REEXECUTAR_EM'
    end
    object sqlOcorrenciasCronologicaVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object sqlOcorrenciasCronologicaPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
  end
  object cdsOcorrenciasGroup: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end>
    ProviderName = 'dspOcorrenciasGroup'
    OnCalcFields = cdsOcorrenciasGroupCalcFields
    Left = 88
    Top = 32
    object cdsOcorrenciasGroupKZOO_ANIMAL_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_ANIMAL_DIAGNOSTICO'
      Visible = False
      FixedChar = True
    end
    object cdsOcorrenciasGroupCODIGODIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldName = 'CODIGODIAGNOSTICO'
      Size = 32
    end
    object cdsOcorrenciasGroupNOMEDIAGNOSTICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOMEDIAGNOSTICO'
      Size = 128
    end
    object cdsOcorrenciasGroupDATADIAGNOSTICO: TSQLTimeStampField
      DisplayLabel = 'Data Diagnostico'
      FieldName = 'DATADIAGNOSTICO'
    end
    object cdsOcorrenciasGroupSTATUSDIAGNOSTICO: TIntegerField
      FieldName = 'STATUSDIAGNOSTICO'
      Visible = False
    end
    object cdsOcorrenciasGroupDESC_STDIAGNOSTICO: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESC_STDIAGNOSTICO'
      LookupDataSet = cdsStatusDiagnostico
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUSDIAGNOSTICO'
      Size = 32
      Lookup = True
    end
    object cdsOcorrenciasGroupOBSDIAGNOSTICO: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBSDIAGNOSTICO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsOcorrenciasGroupKZOO_ANIMAL_PROTOCOLO: TStringField
      FieldName = 'KZOO_ANIMAL_PROTOCOLO'
      Visible = False
      FixedChar = True
    end
    object cdsOcorrenciasGroupCODIGOPROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'CODIGOPROTOCOLO'
      Size = 32
    end
    object cdsOcorrenciasGroupNOMEPROTOCOLO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOMEPROTOCOLO'
      Size = 128
    end
    object cdsOcorrenciasGroupDATAPROTOCOLO: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATAPROTOCOLO'
    end
    object cdsOcorrenciasGroupSTATUSPROTOCOLO: TIntegerField
      FieldName = 'STATUSPROTOCOLO'
      Visible = False
    end
    object cdsOcorrenciasGroupDESC_STPROTOCOLO: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESC_STPROTOCOLO'
      LookupDataSet = cdsStatusProtocolo
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUSPROTOCOLO'
      Size = 32
      Lookup = True
    end
    object cdsOcorrenciasGroupOBSPROTOCOLO: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBSPROTOCOLO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsOcorrenciasGroupKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsOcorrenciasGroupKZOO_ANIMAL_PROTOCOLO_1: TStringField
      FieldName = 'KZOO_ANIMAL_PROTOCOLO_1'
      Visible = False
      FixedChar = True
    end
    object cdsOcorrenciasGroupDATAPREVISTA: TSQLTimeStampField
      DisplayLabel = 'Tarefa'
      FieldName = 'DATAPREVISTA'
      Required = True
    end
    object cdsOcorrenciasGroupCODIGOTAREFA: TStringField
      DisplayLabel = 'Previs'#227'o'
      FieldName = 'CODIGOTAREFA'
      Required = True
      Size = 32
    end
    object cdsOcorrenciasGroupNOMETAREFA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOMETAREFA'
      Visible = False
      Size = 128
    end
    object cdsOcorrenciasGroupNOMETAREFA_VEZES: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkInternalCalc
      FieldName = 'NOMETAREFA_VEZES'
      Size = 128
    end
    object cdsOcorrenciasGroupDATATAREFA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATATAREFA'
    end
    object cdsOcorrenciasGroupKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object cdsOcorrenciasGroupKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Visible = False
      FixedChar = True
    end
    object cdsOcorrenciasGroupNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object cdsOcorrenciasGroupSTATUSTAREFA: TIntegerField
      FieldName = 'STATUSTAREFA'
      Visible = False
    end
    object cdsOcorrenciasGroupST_TAREFA: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESC_STTAREFA'
      LookupDataSet = cdsStatusTarefas
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUSTAREFA'
      Size = 32
      Lookup = True
    end
    object cdsOcorrenciasGroupOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsOcorrenciasGroupVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
      Visible = False
    end
    object cdsOcorrenciasGroupDL: TIntegerField
      DisplayLabel = 'Dias DL'
      FieldName = 'DL'
    end
    object cdsOcorrenciasGroupNDC: TIntegerField
      DisplayLabel = 'Dias NDC'
      FieldName = 'NDC'
    end
  end
  object dspOcorrenciasGroup: TDataSetProvider
    DataSet = sqlOcorrenciasGroup
    UpdateMode = upWhereKeyOnly
    Left = 52
    Top = 84
  end
  object sqlOcorrenciasGroup: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT -- DIAGNOSTICOS,PROTOCOLOS,TAREFAS SEM DECARTE'#13#10'    COALE' +
      'SCE ( D.KZOO_ANIMAL_DIAGNOSTICO, E.KZOO_ANIMAL_TAREFA ) KZOO_ANI' +
      'MAL_DIAGNOSTICO,'#13#10'    COALESCE ( D.DATA, E.DATA_RESULTADO ) DATA' +
      'DIAGNOSTICO,'#13#10'    COALESCE ( D.CODIGO || COALESCE(  '#39' ('#39' ||  STS' +
      '.SYS$DESCRIPTION ||  '#39')'#39','#39#39'), E.CODIGO ) CODIGODIAGNOSTICO,'#13#10'   ' +
      ' COALESCE ( D.NOME     || COALESCE('#39'  no quarto '#39' ||STD.SYS$DESC' +
      'RIPTION,'#39#39'), '#39'Exame: '#39' || E.NOME   ) NOMEDIAGNOSTICO,'#13#10'    COALE' +
      'SCE ( D.STATUS, E.STATUS ) STATUSDIAGNOSTICO,'#13#10'    COALESCE ( D.' +
      'OBS, E.OBS_EXAME ) OBSDIAGNOSTICO,'#13#10'    P.KZOO_ANIMAL_PROTOCOLO,' +
      #13#10'    P.CODIGO CODIGOPROTOCOLO,     '#13#10'    P.NOME NOMEPROTOCOLO,'#13 +
      #10'    P.DATA DATAPROTOCOLO,              '#13#10'    P.STATUS STATUSPRO' +
      'TOCOLO,'#13#10'    P.OBS OBSPROTOCOLO,'#13#10'    T.KZOO_ANIMAL_TAREFA,     ' +
      '          '#13#10'    T.KZOO_ANIMAL_PROTOCOLO,'#13#10'    T.CODIGO CODIGOTAR' +
      'EFA,             '#13#10'    T.NOME NOMETAREFA,  '#13#10'    T.DATAPREVISTA ' +
      'DATAPREVISTA,   --17'#13#10'    T.DATASTATUS DATATAREFA,'#13#10'    T.KCAD_F' +
      'UNCIONARIO,                   '#13#10'    T.KZOO_TAREFA,'#13#10'    T.NOMEFU' +
      'NCIONARIO,                    '#13#10'    T.STATUS STATUSTAREFA,'#13#10'    ' +
      'T.VEZAODIA, --23'#13#10'    NULLIF( T.DESCARTELEITE, 0 ) DL,'#13#10'    NULL' +
      'IF( T.DESCARTECARNE, 0 ) NDC,'#13#10'    T.OBS'#13#10'FROM ZOO_ANIMAL_PROTOC' +
      'OLOS P'#13#10'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_ANIMAL_DIA' +
      'GNOSTICO = P.KZOO_ANIMAL_DIAGNOSTICO'#13#10'LEFT JOIN ZOO_ANIMAL_TAREF' +
      'AS  E ON E.KZOO_ANIMAL_TAREFA = P.KZOO_ANIMAL_TAREFA'#13#10'LEFT JOIN ' +
      'ZOO_ANIMAL_TAREFAS T ON T.KZOO_ANIMAL_PROTOCOLO = P.KZOO_ANIMAL_' +
      'PROTOCOLO'#13#10'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'TIPO_SIGLAQUARTO' +
      #39', D.QUARTO ) STS ON 1=1'#13#10'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'T' +
      'IPO_QUARTO'#39', D.QUARTO ) STD ON 1=1'#13#10'WHERE P.KZOO_ANIMAL_FEMEA = ' +
      ':KZOO_ANIMAL_FEMEA'#13#10'  AND P.EXCLUIDO = '#39'F'#39' AND COALESCE ( D.EXCL' +
      'UIDO, '#39'F'#39' ) = '#39'F'#39' '#13#10'  AND (  T.KZOO_ANIMAL_TAREFA IS NULL'#13#10'     ' +
      '    OR ( T.EXCLUIDO = '#39'F'#39' AND T.KMZOO_ANIMAL_TAREFA IS NULL  )'#13#10 +
      '      )'#13#10'UNION ALL'#13#10'SELECT -- DIAGNOSTICOS'#13#10'    D.KZOO_ANIMAL_DI' +
      'AGNOSTICO,    --1'#13#10'    D.DATA DATADIAGNOSTICO, --2'#13#10'    D.CODIGO' +
      ' || COALESCE(  '#39' ('#39' ||  STS.SYS$DESCRIPTION ||  '#39')'#39','#39#39') CODIGODI' +
      'AGNOSTICO,  '#13#10'    D.NOME     || COALESCE('#39'  no quarto '#39' ||STD.SY' +
      'S$DESCRIPTION,'#39#39') NOMEDIAGNOSTICO,'#13#10'    D.STATUS STATUSDIAGNOSTI' +
      'CO, --5'#13#10'    D.OBS OBSDIAGNOSTICO,                '#13#10'    NULL KZO' +
      'O_ANIMAL_PROTOCOLO, --7'#13#10'    NULL CODIGOPROTOCOLO,'#13#10'    NULL NOM' +
      'EPROTOCOLO,'#13#10'    NULL DATAPROTOCOLO, --10'#13#10'    NULL STATUSPROTOC' +
      'OLO,'#13#10'    NULL OBSPROTOCOLO,'#13#10'    NULL KZOO_ANIMAL_TAREFA,'#13#10'    ' +
      'NULL KZOO_ANIMAL_PROTOCOLO,'#13#10'    NULL CODIGOTAREFA, --15'#13#10'    NU' +
      'LL NOMETAREFA,'#13#10'    NULL DATAPREVISTA, --17'#13#10'    NULL DATATAREFA' +
      ','#13#10'    NULL KCAD_FUNCIONARIO, -- 20'#13#10'    NULL KZOO_TAREFA,'#13#10'    ' +
      'NULL NOMEFUNCIONARIO,'#13#10'    NULL STATUSTAREFA,'#13#10'    NULL VEZAODIA' +
      ', --23'#13#10'    NULL DL,'#13#10'    NULL NDC,'#13#10'    NULL OBS'#13#10'FROM ZOO_ANIM' +
      'AL_DIAGNOSTICOS D'#13#10'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'TIPO_SIG' +
      'LAQUARTO'#39', D.QUARTO ) STS ON 1=1'#13#10'LEFT JOIN SYS$TYPES_GETDESCRIP' +
      'TION( '#39'TIPO_QUARTO'#39', D.QUARTO ) STD ON 1=1'#13#10'WHERE D.KZOO_ANIMAL_' +
      'FEMEA = :KZOO_ANIMAL_FEMEA'#13#10'  AND D.EXCLUIDO = '#39'F'#39#13#10'  AND NOT EX' +
      'ISTS ( SELECT 1 FROM ZOO_ANIMAL_PROTOCOLOS P WHERE P.KZOO_ANIMAL' +
      '_DIAGNOSTICO = D.KZOO_ANIMAL_DIAGNOSTICO )'#13#10'ORDER BY 2, 1, 10, 7' +
      ', 17, 23'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 88
    Top = 144
    object sqlOcorrenciasGroupKZOO_ANIMAL_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_ANIMAL_DIAGNOSTICO'
      FixedChar = True
    end
    object sqlOcorrenciasGroupDATADIAGNOSTICO: TSQLTimeStampField
      FieldName = 'DATADIAGNOSTICO'
    end
    object sqlOcorrenciasGroupCODIGODIAGNOSTICO: TStringField
      FieldName = 'CODIGODIAGNOSTICO'
      Size = 32
    end
    object sqlOcorrenciasGroupNOMEDIAGNOSTICO: TStringField
      FieldName = 'NOMEDIAGNOSTICO'
      Size = 128
    end
    object sqlOcorrenciasGroupSTATUSDIAGNOSTICO: TIntegerField
      FieldName = 'STATUSDIAGNOSTICO'
      Visible = False
    end
    object sqlOcorrenciasGroupOBSDIAGNOSTICO: TMemoField
      FieldName = 'OBSDIAGNOSTICO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlOcorrenciasGroupKZOO_ANIMAL_PROTOCOLO: TStringField
      FieldName = 'KZOO_ANIMAL_PROTOCOLO'
      FixedChar = True
    end
    object sqlOcorrenciasGroupCODIGOPROTOCOLO: TStringField
      FieldName = 'CODIGOPROTOCOLO'
      Size = 32
    end
    object sqlOcorrenciasGroupNOMEPROTOCOLO: TStringField
      FieldName = 'NOMEPROTOCOLO'
      Size = 128
    end
    object sqlOcorrenciasGroupDATAPROTOCOLO: TSQLTimeStampField
      FieldName = 'DATAPROTOCOLO'
    end
    object sqlOcorrenciasGroupSTATUSPROTOCOLO: TIntegerField
      FieldName = 'STATUSPROTOCOLO'
      Visible = False
    end
    object sqlOcorrenciasGroupOBSPROTOCOLO: TMemoField
      FieldName = 'OBSPROTOCOLO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlOcorrenciasGroupKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      Required = True
      FixedChar = True
    end
    object sqlOcorrenciasGroupKZOO_ANIMAL_PROTOCOLO_1: TStringField
      FieldName = 'KZOO_ANIMAL_PROTOCOLO_1'
      FixedChar = True
    end
    object sqlOcorrenciasGroupDATAPREVISTA: TSQLTimeStampField
      FieldName = 'DATAPREVISTA'
      Required = True
    end
    object sqlOcorrenciasGroupCODIGOTAREFA: TStringField
      FieldName = 'CODIGOTAREFA'
      Required = True
      Size = 32
    end
    object sqlOcorrenciasGroupNOMETAREFA: TStringField
      FieldName = 'NOMETAREFA'
      Required = True
      OnGetText = sqlOcorrenciasGroupNOMETAREFAGetText
      Size = 128
    end
    object sqlOcorrenciasGroupDATATAREFA: TSQLTimeStampField
      FieldName = 'DATATAREFA'
    end
    object sqlOcorrenciasGroupKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlOcorrenciasGroupKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object sqlOcorrenciasGroupNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlOcorrenciasGroupSTATUSTAREFA: TIntegerField
      FieldName = 'STATUSTAREFA'
      Visible = False
    end
    object sqlOcorrenciasGroupOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlOcorrenciasGroupVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object sqlOcorrenciasGroupDL: TIntegerField
      FieldName = 'DL'
    end
    object sqlOcorrenciasGroupNDC: TIntegerField
      FieldName = 'NDC'
    end
  end
  object cdsStatusTarefas: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F02004900040001
      0005574944544802000200FF00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 392
    Top = 116
    object cdsStatusTarefasTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusTarefasVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusTarefasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object cdsStatusTarefasORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsStatusDiagnostico: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F02004900040001
      0005574944544802000200FF00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 392
    Top = 12
    object cdsStatusDiagnosticoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusDiagnosticoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusDiagnosticoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object cdsStatusDiagnosticoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsStatusProtocolo: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F02004900040001
      0005574944544802000200FF00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 392
    Top = 60
    object cdsStatusProtocoloTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusProtocoloVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusProtocoloDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object cdsStatusProtocoloORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoQuarto: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 388
    Top = 184
    object cdsTipoQuartoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoQuartoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoQuartoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoQuartoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
