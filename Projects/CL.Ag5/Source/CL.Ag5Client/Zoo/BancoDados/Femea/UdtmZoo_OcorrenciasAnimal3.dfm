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
      Size = 128
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
    SQL = (
      'SELECT '
      '    '#39'D'#39' TIPO,'
      '    D.KZOO_ANIMAL_DIAGNOSTICO   RECORDKEY,'
      '    CAST( D.DATA AS DATE )                      DATA,'
      '    D.NOME OCORRENCIA,'
      '    D.QUARTO QUARTO,'
      '    CAST ( '#39#39' AS SYS$DESCR )    ORIGEM, '
      '    D.STATUS                    STATUS,'
      '    D.DATASTATUS   DATAEXECUCAO,'
      '    CAST ( '#39#39' AS SYS$FKGUID22 ) KCAD_FUNCIONARIO,'
      '    CAST ( '#39#39' AS SYS$DESCR )    NOMEFUNCIONARIO,'
      '    D.OBS                       OBS,'
      '    D.EXCLUIDO             EXCLUIDO,'
      '   CAST( NULL AS SYS$DATE ) REEXECUTAR_EM,'
      '   CAST( 0 AS SYS$INT ) VEZAODIA,'
      '   DZ.POR_QUARTO'
      'FROM ZOO_ANIMAL_DIAGNOSTICOS D'
      
        'LEFT JOIN ZOO_DIAGNOSTICOS DZ ON DZ.KZOO_DIAGNOSTICO = D.KZOO_DI' +
        'AGNOSTICO'
      'WHERE D.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
      ''
      'UNION ALL'
      ''
      'SELECT'
      '    '#39'P'#39' TIPO,'
      '    P.KZOO_ANIMAL_PROTOCOLO     RECORDKEY,'
      '    CAST( P.DATA AS DATE )                    DATA,'
      '    P.CODIGO OCORRENCIA,'
      '    CAST ( NULL AS SMALLINT ) QUARTO,'
      
        '    CAST ( SUBSTRING ( D.NOME FROM 1 FOR 128) AS SYS$DESCR ) ORI' +
        'GEM,'
      '    P.STATUS                    STATUS,'
      '    D.DATASTATUS   DATAEXECUCAO,'
      '    CAST ( '#39#39' AS SYS$FKGUID22 ) KCAD_FUNCIONARIO,'
      '    CAST ( '#39#39' AS SYS$DESCR )    NOMEFUNCIONARIO,'
      '    P.OBS                       OBS,'
      '    P.EXCLUIDO             EXCLUIDO,'
      '   CAST(NULL AS SYS$DATE ) REEXECUTAR_EM,'
      '   CAST( 0 AS SYS$INT ) VEZAODIA,'
      '   '#39'F'#39' POR_QUARTO'
      'FROM ZOO_ANIMAL_PROTOCOLOS P'
      
        'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_ANIMAL_DIAGNOSTICO' +
        ' = P.KZOO_ANIMAL_DIAGNOSTICO'
      'WHERE P.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
      ''
      'UNION ALL'
      ''
      'SELECT DISTINCT'
      '    '#39'T'#39' TIPO,'
      '    T.KZOO_ANIMAL_TAREFA                RECORDKEY,'
      
        '    CAST( T.DATAPREVISTA AS DATE )                              ' +
        'DATA,'
      '    T.CODIGO OCORRENCIA,'
      '    CAST ( NULL AS SMALLINT ) QUARTO,'
      
        '    CAST ( SUBSTRING ( COALESCE ( P.CODIGO, '#39#39' ) || COALESCE ( '#39 +
        ' ('#39' || D.NOME || COALESCE('#39'  no quarto '#39' ||STD.SYS$DESCRIPTION,'#39 +
        #39') || '#39')'#39', '#39#39' ) FROM 1 FOR 128) AS SYS$DESCR ) ORIGEM,'
      '    T.STATUS                                  STATUS,'
      '    T.DATASTATUS                              DATAEXECUCAO,'
      '    T.KCAD_FUNCIONARIO                        KCAD_FUNCIONARIO,'
      '    T.NOMEFUNCIONARIO                         NOMEFUNCIONARIO,'
      '    T.OBS                                     OBS,'
      '    T.EXCLUIDO             EXCLUIDO,'
      '    T.REEXECUTAR_EM REEXECUTAR_EM,'
      '    T.VEZAODIA,'
      '    '#39'F'#39' POR_QUARTO'
      'FROM ZOO_ANIMAL_TAREFAS T'
      
        'LEFT JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO   =' +
        ' T.KZOO_ANIMAL_PROTOCOLO'
      
        'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_ANIMAL_DIAGNOSTICO' +
        ' = P.KZOO_ANIMAL_DIAGNOSTICO'
      
        'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'TIPO_SIGLAQUARTO'#39', D.QUARTO' +
        ' ) STS ON 1=1'
      
        'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'TIPO_QUARTO'#39', D.QUARTO ) ST' +
        'D ON 1=1'
      
        'WHERE T.KZOO_ANIMAL = :KZOO_ANIMAL_FEMEA AND T.KMZOO_ANIMAL_TARE' +
        'FA IS NULL'
      ''
      'UNION ALL'
      ''
      'SELECT DISTINCT -- descartes'
      '    '#39'X'#39' TIPO,'
      '    CAST( NULL AS CHAR(20) ) RECORDKEY,'
      
        '    IIF ( TM.STATUS = 2, CAST( T.DATAPREVISTA AS DATE ), CURRENT' +
        '_DATE + T.DDT ) DATA,'
      '    T.CODIGO  OCORRENCIA,'
      '    CAST ( NULL AS SMALLINT ) QUARTO,'
      '    CAST ( NULL AS VARCHAR(128)) ORIGEM,'
      '    T.STATUS                                  STATUS,'
      '    NULL   DATAEXECUCAO,'
      '    NULL KCAD_FUNCIONARIO,'
      '    NULL NOMEFUNCIONARIO,'
      '    T.OBS                                     OBS,'
      '    T.EXCLUIDO             EXCLUIDO,'
      '    NULL REEXECUTAR_EM,'
      '    NULL VEZAODIA,'
      '    '#39'F'#39' POR_QUARTO'
      'FROM ZOO_ANIMAL_TAREFAS T'
      
        'INNER JOIN ZOO_ANIMAL_TAREFAS TM ON TM.KZOO_ANIMAL_TAREFA = T.KM' +
        'ZOO_ANIMAL_TAREFA'
      
        'LEFT JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO   =' +
        ' T.KZOO_ANIMAL_PROTOCOLO'
      
        'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_ANIMAL_DIAGNOSTICO' +
        ' = P.KZOO_ANIMAL_DIAGNOSTICO'
      
        'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'TIPO_SIGLAQUARTO'#39', D.QUARTO' +
        ' ) STS ON 1=1'
      
        'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'TIPO_QUARTO'#39', D.QUARTO ) ST' +
        'D ON 1=1'
      'WHERE TM.STATUS <= 2 '
      '  AND TM.EXCLUIDO = '#39'F'#39
      '  AND T.KZOO_ANIMAL = :KZOO_ANIMAL_FEMEA '
      '  AND T.KMZOO_ANIMAL_TAREFA IS NOT NULL'
      'ORDER BY 3')
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
      FieldName = 'OCORRENCIA'
      Required = True
      Size = 128
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
    object cdsOcorrenciasGroupTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOcorrenciasGroupKZOO_OCORRENCIA: TStringField
      FieldName = 'KZOO_OCORRENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsOcorrenciasGroupKMZOO_OCORRENCIA: TStringField
      FieldName = 'KMZOO_OCORRENCIA'
      FixedChar = True
    end
    object cdsOcorrenciasGroupCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 304
    end
    object cdsOcorrenciasGroupDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object cdsOcorrenciasGroupDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 395
    end
    object cdsOcorrenciasGroupDESCRICAO_VEZES: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkInternalCalc
      FieldName = 'DESCRICAO_VEZES'
      Size = 128
    end
    object cdsOcorrenciasGroupSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object cdsOcorrenciasGroupDESCR_STATUS: TStringField
      FieldName = 'DESCR_STATUS'
      Size = 255
    end
    object cdsOcorrenciasGroupDATATAREFA: TSQLTimeStampField
      FieldName = 'DATATAREFA'
    end
    object cdsOcorrenciasGroupKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object cdsOcorrenciasGroupKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object cdsOcorrenciasGroupNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object cdsOcorrenciasGroupSTATUSTAREFA: TIntegerField
      FieldName = 'STATUSTAREFA'
    end
    object cdsOcorrenciasGroupVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object cdsOcorrenciasGroupDL: TIntegerField
      FieldName = 'DL'
    end
    object cdsOcorrenciasGroupNDC: TIntegerField
      FieldName = 'NDC'
    end
    object cdsOcorrenciasGroupOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspOcorrenciasGroup: TDataSetProvider
    DataSet = sqlOcorrenciasGroup
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspOcorrenciasGroupBeforeUpdateRecord
    Left = 52
    Top = 84
  end
  object sqlOcorrenciasGroup: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
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
      end>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'SELECT'
      '   '#39'D'#39' TIPO'
      ',   D.KZOO_ANIMAL_DIAGNOSTICO KZOO_OCORRENCIA'
      ',  NULL                      KMZOO_OCORRENCIA'
      ',  D.DATA                    DATA'
      ',  '#39'Diagn'#243'stico: '#39' || D.CODIGO'
      '    || COALESCE('
      '          '#39' ('#39
      '          ||  STS.SYS$DESCRIPTION'
      '          ||  '#39')'#39
      '       , '#39#39
      '    )                         CODIGO'
      ',  '#39'Diagn'#243'stico: '#39' || D.NOME'
      '    || COALESCE('
      '         '#39'  no quarto '#39
      '         || STQ.SYS$DESCRIPTION'
      '        ,'#39#39
      '   )                         DESCRICAO'
      ',  D.STATUS                  STATUS'
      ',  SUBSTRING ( STD.SYS$DESCRIPTION  FROM 1 FOR 15 )DESCR_STATUS'
      ',  NULL DATATAREFA'
      ',  NULL KCAD_FUNCIONARIO -- 20'
      ',  NULL KZOO_TAREFA'
      ',  NULL NOMEFUNCIONARIO'
      ',  NULL STATUSTAREFA'
      ',  NULL VEZAODIA --23'
      ',  NULL DL'
      ',  NULL NDC'
      ',  D.OBS                     OBS'
      'FROM ZOO_ANIMAL_DIAGNOSTICOS D'
      
        'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'TIPO_SIGLAQUARTO'#39',         ' +
        ' D.QUARTO ) STS ON 1=1'
      
        'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'TIPO_QUARTO'#39',              ' +
        '      D.QUARTO ) STQ ON 1=1'
      
        'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'STATUS_DIAGNOSTICO'#39' ,     D' +
        '.STATUS ) STD ON 1=1'
      'WHERE'
      '        D.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
      'AND D.EXCLUIDO = '#39'F'#39
      'UNION ALL'
      'SELECT'
      '  '#39'P'#39' TIPO'
      ', P.KZOO_ANIMAL_PROTOCOLO   KZOO_OCORRENCIA'
      ', P.KZOO_ANIMAL_DIAGNOSTICO KMZOO_OCORRENCIA'
      ', P.DATA                    DATA'
      ', '#39'Protocolo: '#39' || P.CODIGO                  CODIGO'
      ', '#39'Protocolo: '#39' || P.NOME                    DESCRICAO'
      ', P.STATUS                  STATUS'
      ', SUBSTRING (  STP.SYS$DESCRIPTION  FROM 1 FOR 15 ) DESCR_STATUS'
      ',  NULL DATATAREFA'
      ',  NULL KCAD_FUNCIONARIO -- 20'
      ',  NULL KZOO_TAREFA'
      ',  NULL NOMEFUNCIONARIO'
      ',  NULL STATUSTAREFA'
      ',  NULL VEZAODIA --23'
      ',  NULL DL'
      ',  NULL NDC'
      ', P.OBS                     OBS'
      'FROM ZOO_ANIMAL_PROTOCOLOS P'
      
        'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'STATUS_PROTOCOLO'#39' ,     P.S' +
        'TATUS ) STP ON 1=1'
      'WHERE'
      '          P.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
      '  AND P.EXCLUIDO = '#39'F'#39
      'UNION ALL'
      'SELECT'
      '   IIF( T.EXAME = '#39'T'#39', '#39'E'#39', '#39'T'#39' ) TIPO'
      ',  T.KZOO_ANIMAL_TAREFA      KZOO_OCORRENCIA'
      
        ', COALESCE ( T.KZOO_ANIMAL_PROTOCOLO, T.KZOO_ANIMAL_DIAGNOSTICO ' +
        ')   KMZOO_OCORRENCIA'
      ', T.DATAPREVISTA            DATA'
      
        ', IIF( T.EXAME = '#39'T'#39', '#39'Exame: '#39', '#39'Tarefa: '#39' ) || T.CODIGO    COD' +
        'IGO'
      
        ', IIF( T.EXAME = '#39'T'#39', '#39'Exame: '#39', '#39'Tarefa: '#39' ) || T.NOME        D' +
        'ESCRICAO'
      ', T.STATUS                  STATUS'
      
        ', SUBSTRING (  STT.SYS$DESCRIPTION    FROM 1 FOR 15 ) DESCR_STAT' +
        'US'
      ', T.DATASTATUS              DATATAREFA'
      ', T.KCAD_FUNCIONARIO'
      ', T.KZOO_TAREFA'
      ', T.NOMEFUNCIONARIO'
      ', T.STATUS STATUSTAREFA'
      ', T.VEZAODIA --23'
      ', NULLIF( T.DESCARTELEITE, 0 ) DL'
      ', NULLIF( T.DESCARTECARNE, 0 ) NDC'
      ', T.OBS'
      'FROM ZOO_ANIMAL_TAREFAS T'
      
        'LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'STATUS_TAREFA'#39' ,   T.STATUS' +
        ' ) STT ON 1=1'
      'WHERE'
      '          T.KZOO_ANIMAL = :KZOO_ANIMAL_FEMEA'
      '  AND T.KMZOO_ANIMAL_TAREFA IS NULL'
      '  AND T.EXCLUIDO = '#39'F'#39
      'ORDER BY 4,5, 14 NULLS FIRST')
    Left = 88
    Top = 144
    object sqlOcorrenciasGroupTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlOcorrenciasGroupKZOO_OCORRENCIA: TStringField
      FieldName = 'KZOO_OCORRENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlOcorrenciasGroupKMZOO_OCORRENCIA: TStringField
      FieldName = 'KMZOO_OCORRENCIA'
      FixedChar = True
    end
    object sqlOcorrenciasGroupDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlOcorrenciasGroupCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 303
    end
    object sqlOcorrenciasGroupDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 395
    end
    object sqlOcorrenciasGroupSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object sqlOcorrenciasGroupDESCR_STATUS: TStringField
      FieldName = 'DESCR_STATUS'
      Size = 255
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
    object sqlOcorrenciasGroupOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
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
