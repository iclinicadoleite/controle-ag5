object dtmZoo_ResultadoExamesAnimal: TdtmZoo_ResultadoExamesAnimal
  OldCreateOrder = True
  Height = 316
  Width = 615
  object cdsExames: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_EXECUTADA'
        ParamType = ptInput
      end>
    ProviderName = 'dspExames'
    AfterEdit = cdsExamesAfterEdit
    BeforePost = cdsExamesBeforePost
    OnNewRecord = cdsExamesNewRecord
    Left = 120
    Top = 24
    object cdsExamesKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsExamesKZOO_ANIMAL_PROTOCOLO: TStringField
      FieldName = 'KZOO_ANIMAL_PROTOCOLO'
      Visible = False
      FixedChar = True
    end
    object cdsExamesKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Visible = False
      FixedChar = True
    end
    object cdsExamesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsExamesCODIGO: TStringField
      DisplayLabel = 'Exame'
      FieldName = 'CODIGO'
      ReadOnly = True
      Required = True
      Size = 32
    end
    object cdsExamesNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      ReadOnly = True
      Required = True
      Size = 128
    end
    object cdsExamesDATASTATUS: TSQLTimeStampField
      DisplayLabel = 'Data exame'
      FieldName = 'DATASTATUS'
    end
    object cdsExamesPROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 32
    end
    object cdsExamesDIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldName = 'DIAGNOSTICO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 128
    end
    object cdsExamesDATADIAGNOSTICO: TSQLTimeStampField
      DisplayLabel = 'Data diagn'#243'stico'
      FieldName = 'DATADIAGNOSTICO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsExamesQUARTO: TSmallintField
      DisplayLabel = 'Quarto'
      FieldName = 'QUARTO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Visible = False
    end
    object cdsExamesDESCR_QUARTO: TStringField
      DisplayLabel = 'Quarto'
      FieldKind = fkLookup
      FieldName = 'DESCR_QUARTO'
      LookupDataSet = cdsTipoQuarto
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'QUARTO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 160
      Lookup = True
    end
    object cdsExamesDATA_RESULTADO: TSQLTimeStampField
      DisplayLabel = 'Data do resultado'
      FieldName = 'DATA_RESULTADO'
    end
    object cdsExamesKZOO_TAREFA_RESULTADO1: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO1'
      OnValidate = cdsExamesKZOO_TAREFA_RESULTADO1Validate
    end
    object cdsExamesDESCR_RESULTADO1: TStringField
      DisplayLabel = 'Resultado 1'
      FieldName = 'DESCR_RESULTADO1'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsExamesPROTOCOLO_RESULTADO1: TStringField
      DisplayLabel = 'Aplicar protocolo resultado 1'
      FieldName = 'PROTOCOLO_RESULTADO1'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsExamesKZOO_TAREFA_RESULTADO2: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO2'
      OnValidate = cdsExamesKZOO_TAREFA_RESULTADO2Validate
    end
    object cdsExamesDESCR_RESULTADO2: TStringField
      DisplayLabel = 'Resultado 2'
      FieldName = 'DESCR_RESULTADO2'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsExamesPROTOCOLO_RESULTADO2: TStringField
      DisplayLabel = 'Aplicar protocolo resultado 2'
      FieldName = 'PROTOCOLO_RESULTADO2'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsExamesKZOO_TAREFA_RESULTADO3: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO3'
      OnValidate = cdsExamesKZOO_TAREFA_RESULTADO3Validate
    end
    object cdsExamesDESCR_RESULTADO3: TStringField
      DisplayLabel = 'Resultado 3'
      FieldName = 'DESCR_RESULTADO3'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsExamesPROTOCOLO_RESULTADO3: TStringField
      DisplayLabel = 'Aplicar protocolo resultado 3'
      FieldName = 'PROTOCOLO_RESULTADO3'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsExamesKCAD_FUNCIONARIO_EXAME: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO_EXAME'
      Visible = False
      FixedChar = True
    end
    object cdsExamesNOMEFUNCIONARIO_EXAME: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO_EXAME'
      Size = 128
    end
    object cdsExamesOBS_EXAME: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS_EXAME'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspExames: TDataSetProvider
    DataSet = sqlExames
    Options = [poIncFieldProps, poCascadeDeletes, poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspExamesAfterUpdateRecord
    Left = 52
    Top = 68
  end
  object sqlExames: TTcSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select  '#13#10' T.KZOO_ANIMAL_TAREFA, '#13#10' T.KZOO_ANIMAL_PROTOCOLO, '#13#10' ' +
      'T.KZOO_TAREFA, '#13#10' T.KZOO_ANIMAL, '#13#10' T.CODIGO, '#13#10' T.NOME,'#13#10' T.DAT' +
      'ASTATUS,'#13#10' P.CODIGO PROTOCOLO,'#13#10' D.NOME DIAGNOSTICO,'#13#10' D.DATA DA' +
      'TADIAGNOSTICO,'#13#10' D.QUARTO,'#13#10' T.KCAD_FUNCIONARIO_EXAME, '#13#10' T.NOME' +
      'FUNCIONARIO_EXAME, '#13#10' T.OBS_EXAME, '#13#10' T.DATA_RESULTADO,'#13#10' T.KZOO' +
      '_TAREFA_RESULTADO1,  '#13#10' RESULTADO1.NOME DESCR_RESULTADO1,'#13#10' T.PR' +
      'OTOCOLO_RESULTADO1,  '#13#10' T.KZOO_TAREFA_RESULTADO2,'#13#10' RESULTADO2.N' +
      'OME DESCR_RESULTADO2,'#13#10' T.PROTOCOLO_RESULTADO2,  '#13#10' T.KZOO_TAREF' +
      'A_RESULTADO3,'#13#10' RESULTADO3.NOME DESCR_RESULTADO3,'#13#10' T.PROTOCOLO_' +
      'RESULTADO3'#13#10'from ZOO_ANIMAL_TAREFAS T'#13#10'LEFT JOIN ZOO_ANIMAL_PROT' +
      'OCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_ANIMAL_PROTOCOLO'#13#10'L' +
      'EFT JOIN ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_ANIMAL_DIAGNOSTICO ' +
      '= P.KZOO_ANIMAL_DIAGNOSTICO'#13#10'LEFT JOIN ZOO_TAREFA_RESULTADOS RES' +
      'ULTADO1 ON RESULTADO1.KZOO_TAREFA_RESULTADO = T.KZOO_TAREFA_RESU' +
      'LTADO1'#13#10'LEFT JOIN ZOO_TAREFA_RESULTADOS RESULTADO2 ON RESULTADO2' +
      '.KZOO_TAREFA_RESULTADO = T.KZOO_TAREFA_RESULTADO2'#13#10'LEFT JOIN ZOO' +
      '_TAREFA_RESULTADOS RESULTADO3 ON RESULTADO3.KZOO_TAREFA_RESULTAD' +
      'O = T.KZOO_TAREFA_RESULTADO3'#13#10'WHERE  T.KZOO_ANIMAL = :KZOO_ANIMA' +
      'L '#13#10' AND T.EXAME = '#39'T'#39#13#10'AND T.STATUS = :STATUS_EXECUTADA'#13#10'AND T.' +
      'EXCLUIDO = '#39'F'#39
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'STATUS_EXECUTADA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 116
    Top = 116
    object sqlExamesKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlExamesKZOO_ANIMAL_PROTOCOLO: TStringField
      FieldName = 'KZOO_ANIMAL_PROTOCOLO'
      FixedChar = True
    end
    object sqlExamesKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object sqlExamesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      FixedChar = True
    end
    object sqlExamesCODIGO: TStringField
      DisplayLabel = 'Exame'
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlExamesNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlExamesDATASTATUS: TSQLTimeStampField
      DisplayLabel = 'Data exame'
      FieldName = 'DATASTATUS'
    end
    object sqlExamesPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Size = 32
    end
    object sqlExamesDIAGNOSTICO: TStringField
      FieldName = 'DIAGNOSTICO'
      Size = 128
    end
    object sqlExamesDATADIAGNOSTICO: TSQLTimeStampField
      DisplayLabel = 'Data do diagn'#243'stico'
      FieldName = 'DATADIAGNOSTICO'
      ProviderFlags = [pfInWhere]
    end
    object sqlExamesQUARTO: TSmallintField
      DisplayLabel = 'Quarto'
      FieldName = 'QUARTO'
      ProviderFlags = [pfInWhere]
    end
    object sqlExamesDATA_RESULTADO: TSQLTimeStampField
      DisplayLabel = 'Data do resultado'
      FieldName = 'DATA_RESULTADO'
    end
    object sqlExamesKZOO_TAREFA_RESULTADO1: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO1'
    end
    object sqlExamesPROTOCOLO_RESULTADO1: TStringField
      DisplayLabel = 'Aplicar protocolo resultado 1'
      FieldName = 'PROTOCOLO_RESULTADO1'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlExamesKZOO_TAREFA_RESULTADO2: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO2'
    end
    object sqlExamesPROTOCOLO_RESULTADO2: TStringField
      DisplayLabel = 'Aplicar protocolo resultado 2'
      FieldName = 'PROTOCOLO_RESULTADO2'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlExamesKZOO_TAREFA_RESULTADO3: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO3'
    end
    object sqlExamesPROTOCOLO_RESULTADO3: TStringField
      DisplayLabel = 'Aplicar protocolo resultado 3'
      FieldName = 'PROTOCOLO_RESULTADO3'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlExamesKCAD_FUNCIONARIO_EXAME: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO_EXAME'
      FixedChar = True
    end
    object sqlExamesNOMEFUNCIONARIO_EXAME: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO_EXAME'
      Size = 128
    end
    object sqlExamesDESCR_RESULTADO1: TStringField
      DisplayLabel = 'Resultado 1'
      FieldName = 'DESCR_RESULTADO1'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlExamesDESCR_RESULTADO2: TStringField
      DisplayLabel = 'Resultado 2'
      FieldName = 'DESCR_RESULTADO2'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlExamesDESCR_RESULTADO3: TStringField
      DisplayLabel = 'Resultado 3'
      FieldName = 'DESCR_RESULTADO3'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlExamesOBS_EXAME: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS_EXAME'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsTipoResultado1: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KZOO_TAREFA'
    MasterFields = 'KZOO_TAREFA'
    MasterSource = dtsExames
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    Left = 341
    Top = 27
    object cdsTipoResultado1KZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      Required = True
      FixedChar = True
    end
    object cdsTipoResultado1NOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsTipoResultado1KZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      FixedChar = True
    end
  end
  object cdsTipoResultado2: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KZOO_TAREFA'
    MasterFields = 'KZOO_TAREFA'
    MasterSource = dtsExames
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider2'
    Left = 439
    Top = 27
    object cdsTipoResultado2KZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      Required = True
      FixedChar = True
    end
    object cdsTipoResultado2NOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsTipoResultado2KZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      FixedChar = True
    end
  end
  object cdsTipoResultado3: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KZOO_TAREFA'
    MasterFields = 'KZOO_TAREFA'
    MasterSource = dtsExames
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider3'
    Left = 543
    Top = 27
    object cdsTipoResultado3KZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      Required = True
      FixedChar = True
    end
    object cdsTipoResultado3NOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsTipoResultado3KZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      FixedChar = True
    end
  end
  object sqlTipoResultado1: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' '#39#39' KZOO_TAREFA_RESULTADO,'#13#10' CAST ( :KZOO_TAREFA AS SYS' +
      '$FKGUID20 ) KZOO_TAREFA,'#13#10' '#39#39' NOME'#13#10' FROM RDB$DATABASE'#13#10'UNION AL' +
      'L'#13#10'SELECT  '#13#10' KZOO_TAREFA_RESULTADO,'#13#10' KZOO_TAREFA,'#13#10' NOME'#13#10'from' +
      ' ZOO_TAREFA_RESULTADOS'#13#10'Where KZOO_TAREFA =  :KZOO_TAREFA '#13#10'ORDE' +
      'R BY 3'
    DataSource = dtsExames
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 344
    Top = 152
    object sqlTipoResultado1KZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      Required = True
      FixedChar = True
    end
    object sqlTipoResultado1NOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlTipoResultado1KZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      FixedChar = True
    end
  end
  object sqlTipoResultado2: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' '#39#39' KZOO_TAREFA_RESULTADO,'#13#10' CAST ( :KZOO_TAREFA AS SYS' +
      '$FKGUID20 ) KZOO_TAREFA,'#13#10' '#39#39' NOME'#13#10' FROM RDB$DATABASE'#13#10'UNION AL' +
      'L'#13#10'SELECT  '#13#10' KZOO_TAREFA_RESULTADO,'#13#10' KZOO_TAREFA,'#13#10' NOME'#13#10'from' +
      ' ZOO_TAREFA_RESULTADOS'#13#10'Where KZOO_TAREFA =  :KZOO_TAREFA '#13#10'ORDE' +
      'R BY 3'
    DataSource = dtsExames
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 416
    Top = 152
    object sqlTipoResultado2KZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      Required = True
      FixedChar = True
    end
    object sqlTipoResultado2NOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlTipoResultado2KZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      FixedChar = True
    end
  end
  object sqlTipoResultado3: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' '#39#39' KZOO_TAREFA_RESULTADO,'#13#10' CAST ( :KZOO_TAREFA AS SYS' +
      '$FKGUID20 ) KZOO_TAREFA,'#13#10' '#39#39' NOME'#13#10' FROM RDB$DATABASE'#13#10'UNION AL' +
      'L'#13#10'SELECT  '#13#10' KZOO_TAREFA_RESULTADO,'#13#10' KZOO_TAREFA,'#13#10' NOME'#13#10'from' +
      ' ZOO_TAREFA_RESULTADOS'#13#10'Where KZOO_TAREFA =  :KZOO_TAREFA '#13#10'ORDE' +
      'R BY 3'
    DataSource = dtsExames
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 496
    Top = 152
    object sqlTipoResultado3KZOO_TAREFA_RESULTADO: TStringField
      FieldName = 'KZOO_TAREFA_RESULTADO'
      Required = True
      FixedChar = True
    end
    object sqlTipoResultado3NOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlTipoResultado3KZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Required = True
      FixedChar = True
    end
  end
  object dtsExames: TDataSource
    DataSet = cdsExames
    OnDataChange = dtsExamesDataChange
    Left = 248
    Top = 16
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = sqlTipoResultado1
    Left = 304
    Top = 96
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = sqlTipoResultado2
    Left = 424
    Top = 104
  end
  object DataSetProvider3: TDataSetProvider
    DataSet = sqlTipoResultado3
    Left = 520
    Top = 96
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
    Left = 540
    Top = 240
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
