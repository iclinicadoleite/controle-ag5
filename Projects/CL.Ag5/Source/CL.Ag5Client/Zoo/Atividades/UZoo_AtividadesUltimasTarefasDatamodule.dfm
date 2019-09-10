object Zoo_AtividadesUltimasTarefasDatamodule: TZoo_AtividadesUltimasTarefasDatamodule
  OldCreateOrder = True
  Height = 250
  Width = 1685
  object cdsEventosZootecnicos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspEventosZootecnicos'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 173
    Top = 41
    object cdsEventosZootecnicosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsEventosZootecnicosBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsEventosZootecnicosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsEventosZootecnicosDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object cdsEventosZootecnicosEVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'EVENTO'
      Size = 15
    end
    object cdsEventosZootecnicosNOMEESTABULO: TStringField
      DisplayLabel = 'Touro/Embri'#227'o'
      DisplayWidth = 10
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
  end
  object dspEventosZootecnicos: TDataSetProvider
    DataSet = sqlEventosZootecnicos
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 146
    Top = 86
  end
  object sqlEventosZootecnicos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', (SELECT CAST' +
      '( SUBSTRING ( SYS$DESCRIPTION FROM 1 FOR 15 ) AS VARCHAR(15))'#13#10' ' +
      '  FROM SYS$TYPES_GETDESCRIPTION( '#39'TIPO_EVENTO_ZOO'#39', E.TIPOEVENTO' +
      ' )'#13#10'  ) EVENTO'#13#10', E.DATAEVENTO'#13#10', M.NOMEESTABULO'#13#10'FROM ZOO_EVENT' +
      'OS_ZOOTECNICOS E'#13#10'LEFT JOIN ZOO_ANIMAIS A ON ( A.KZOO_ANIMAL = E' +
      '.KZOO_ANIMAL_FEMEA )'#13#10'LEFT JOIN ZOO_ANIMAIS M ON ( M.KZOO_ANIMAL' +
      ' = E.KZOO_ANIMAL_MACHO )'#13#10'ORDER BY E.DATAEVENTO DESC'#13#10'ROWS :ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 173
    Top = 131
    object sqlEventosZootecnicosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlEventosZootecnicosBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlEventosZootecnicosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlEventosZootecnicosDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object sqlEventosZootecnicosEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 15
    end
    object sqlEventosZootecnicosNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
  end
  object cdsDiagnosticoGestacao: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KZOO_ANIMAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BRINCO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'BRINCO_'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'DATATOQUE'
        DataType = ftTimeStamp
      end
      item
        Name = 'CONCATENATION'
        DataType = ftString
        Size = 29
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspDiagnosticoGestacao'
    StoreDefs = True
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 321
    Top = 43
    object cdsDiagnosticoGestacaoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsDiagnosticoGestacaoBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsDiagnosticoGestacaoBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsDiagnosticoGestacaoDATATOQUE: TSQLTimeStampField
      DisplayLabel = #218'ltimo toque'
      DisplayWidth = 12
      FieldName = 'DATATOQUE'
    end
    object cdsDiagnosticoGestacaoCONCATENATION: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      DisplayWidth = 15
      FieldName = 'CONCATENATION'
      Size = 29
    end
  end
  object dspDiagnosticoGestacao: TDataSetProvider
    DataSet = sqlDiagnosticoGestacao
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 294
    Top = 88
  end
  object sqlDiagnosticoGestacao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', E.DATATOQUE'#13 +
      #10', (SELECT CAST( SUBSTRING ( SYS$DESCRIPTION FROM 1 FOR 15 ) AS ' +
      'VARCHAR(15))'#13#10'   FROM SYS$TYPES_GETDESCRIPTION( '#39'STATUS_PRENHEZ'#39 +
      ', E.PRENHEZ )'#13#10'  )'#13#10'  || '#39' ('#39' || COALESCE ( NULLIF( E.QTDE_DIAGN' +
      'OSTICO, 0 ), '#39'1'#39' ) || '#39')'#39#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS E'#13#10'LEFT ' +
      'JOIN ZOO_ANIMAIS A ON ( A.KZOO_ANIMAL = E.KZOO_ANIMAL_FEMEA )'#13#10'W' +
      'HERE E.DATATOQUE IS NOT NULL'#13#10'ORDER BY E.DATATOQUE DESC'#13#10'ROWS :R' +
      'OWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 321
    Top = 133
    object sqlDiagnosticoGestacaoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlDiagnosticoGestacaoBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlDiagnosticoGestacaoBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlDiagnosticoGestacaoDATATOQUE: TSQLTimeStampField
      FieldName = 'DATATOQUE'
    end
    object sqlDiagnosticoGestacaoCONCATENATION: TStringField
      FieldName = 'CONCATENATION'
      Size = 29
    end
  end
  object cdsSecagens: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspSecagens'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 537
    Top = 46
    object cdsSecagensKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsSecagensBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsSecagensBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsSecagensDATA_SECAGEM: TSQLTimeStampField
      DisplayLabel = 'Data da secagem'
      DisplayWidth = 12
      FieldName = 'DATA_SECAGEM'
    end
  end
  object dspSecagens: TDataSetProvider
    DataSet = sqlSecagens
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 510
    Top = 91
  end
  object sqlSecagens: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', L.DATA_SECAG' +
      'EM'#13#10'FROM ZOO_LACTACOES L'#13#10'LEFT JOIN ZOO_ANIMAIS A ON ( A.KZOO_AN' +
      'IMAL = L.KZOO_ANIMAL_FEMEA )'#13#10'WHERE L.DATA_SECAGEM IS NOT NULL'#13#10 +
      'ORDER BY L.DATA_SECAGEM DESC'#13#10'ROWS :ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 537
    Top = 136
    object sqlSecagensKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlSecagensBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlSecagensBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlSecagensDATA_SECAGEM: TSQLTimeStampField
      FieldName = 'DATA_SECAGEM'
    end
  end
  object cdsDiagnosticoSanitarios: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspDiagnosticoSanitarios'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 650
    Top = 43
    object cdsDiagnosticoSanitariosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsDiagnosticoSanitariosBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsDiagnosticoSanitariosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsDiagnosticoSanitariosDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATA'
      Required = True
    end
    object cdsDiagnosticoSanitariosDIAGNOSTICO: TStringField
      DisplayLabel = #218'ltimo dian'#243'stico'
      DisplayWidth = 30
      FieldName = 'DIAGNOSTICO'
      Size = 133
    end
  end
  object dspDiagnosticoSanitarios: TDataSetProvider
    DataSet = sqlDiagnosticoSanitarios
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 623
    Top = 88
  end
  object sqlDiagnosticoSanitarios: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', D.DATA'#13#10', D.' +
      'NOME'#13#10'  || COALESCE('#13#10'      (SELECT '#39' - '#39' || CAST( SUBSTRING ( S' +
      'YS$DESCRIPTION FROM 1 FOR 2 ) AS VARCHAR(2))'#13#10'       FROM SYS$TY' +
      'PES_GETDESCRIPTION( '#39'TIPO_SIGLAQUARTO'#39', D.QUARTO )'#13#10'      )'#13#10'   ' +
      ' , '#39#39#13#10'  ) DIAGNOSTICO'#13#10'FROM ZOO_ANIMAL_DIAGNOSTICOS D'#13#10'LEFT JOI' +
      'N ZOO_ANIMAIS A ON ( A.KZOO_ANIMAL = D.KZOO_ANIMAL_FEMEA )'#13#10'ORDE' +
      'R BY D.DATA DESC'#13#10'ROWS :ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 650
    Top = 133
    object sqlDiagnosticoSanitariosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlDiagnosticoSanitariosBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlDiagnosticoSanitariosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlDiagnosticoSanitariosDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlDiagnosticoSanitariosDIAGNOSTICO: TStringField
      FieldName = 'DIAGNOSTICO'
      Size = 133
    end
  end
  object cdsPartos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspPartos'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 437
    Top = 44
    object cdsPartosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsPartosBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsPartosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsPartosDATAABORTOPARTO: TSQLTimeStampField
      DisplayLabel = 'Data aborto/parto'
      DisplayWidth = 12
      FieldName = 'DATAABORTOPARTO'
    end
    object cdsPartosDIAGNOSTICO: TStringField
      DisplayLabel = 'Aborto/Parto'
      FieldName = 'DIAGNOSTICO'
      Size = 15
    end
  end
  object dspPartos: TDataSetProvider
    DataSet = sqlPartos
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 410
    Top = 89
  end
  object sqlPartos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', E.DATAABORTO' +
      'PARTO'#13#10', (SELECT CAST( SUBSTRING ( SYS$DESCRIPTION FROM 1 FOR 15' +
      ' ) AS VARCHAR(15))'#13#10'   FROM SYS$TYPES_GETDESCRIPTION( '#39'TIPO_PART' +
      'OABORTO'#39', E.ABORTOPARTO )'#13#10'  ) DIAGNOSTICO'#13#10'FROM ZOO_EVENTOS_ZOO' +
      'TECNICOS E'#13#10'LEFT JOIN ZOO_ANIMAIS A ON ( A.KZOO_ANIMAL = E.KZOO_' +
      'ANIMAL_FEMEA )'#13#10'LEFT JOIN ZOO_ANIMAIS M ON ( M.KZOO_ANIMAL = E.K' +
      'ZOO_ANIMAL_MACHO )'#13#10'WHERE E.DATAABORTOPARTO IS NOT NULL'#13#10'ORDER B' +
      'Y E.DATAABORTOPARTO DESC'#13#10'ROWS :ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 437
    Top = 134
    object sqlPartosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlPartosBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlPartosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlPartosDATAABORTOPARTO: TSQLTimeStampField
      FieldName = 'DATAABORTOPARTO'
    end
    object sqlPartosDIAGNOSTICO: TStringField
      FieldName = 'DIAGNOSTICO'
      Size = 15
    end
  end
  object cdsCrescimento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspCrescimento'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 757
    Top = 36
    object cdsCrescimentoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsCrescimentoBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsCrescimentoBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsCrescimentoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATA'
      Required = True
    end
    object cdsCrescimentoPESO: TIntegerField
      DisplayLabel = 'Peso'
      DisplayWidth = 8
      FieldName = 'PESO'
    end
    object cdsCrescimentoALTURA: TIntegerField
      DisplayLabel = 'Altura'
      DisplayWidth = 8
      FieldName = 'ALTURA'
    end
  end
  object dspCrescimento: TDataSetProvider
    DataSet = sqlCrescimento
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 730
    Top = 81
  end
  object sqlCrescimento: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', C.DATA'#13#10', C.' +
      'PESO'#13#10', C.ALTURA'#13#10'FROM ZOO_ANIMAL_CRESCIMENTO C'#13#10'LEFT JOIN ZOO_A' +
      'NIMAIS A ON ( A.KZOO_ANIMAL = C.KZOO_ANIMAL )'#13#10'WHERE C.PESO IS N' +
      'OT NULL'#13#10'ORDER BY C.DATA DESC'#13#10'ROWS :ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 757
    Top = 126
  end
  object cdsDesmame: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspDesmame'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 886
    Top = 44
    object cdsDesmameKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDesmameBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsDesmameBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsDesmameDATADESMAME: TSQLTimeStampField
      DisplayLabel = 'Data do desmame'
      DisplayWidth = 12
      FieldName = 'DATADESMAME'
    end
  end
  object dspDesmame: TDataSetProvider
    DataSet = sqlDesmame
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 859
    Top = 89
  end
  object sqlDesmame: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', A.DATADESMAM' +
      'E'#13#10'FROM ZOO_ANIMAIS A'#13#10'WHERE A.DATADESMAME IS NOT NULL'#13#10'ORDER BY' +
      ' A.DATADESMAME DESC'#13#10'ROWS :ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 886
    Top = 134
    object sqlDesmameKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      FixedChar = True
    end
    object sqlDesmameBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlDesmameBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlDesmameDATADESMAME: TSQLTimeStampField
      FieldName = 'DATADESMAME'
    end
  end
  object cdsDescartes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspDescartes'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 998
    Top = 32
    object cdsDescartesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsDescartesBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsDescartesBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsDescartesDATA: TSQLTimeStampField
      DisplayLabel = 'Data do descarte'
      DisplayWidth = 12
      FieldName = 'DATA'
      Required = True
    end
    object cdsDescartesOBS: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      DisplayWidth = 20
      FieldName = 'OBS'
      Size = 50
    end
  end
  object dspDescartes: TDataSetProvider
    DataSet = sqlDescartes
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 971
    Top = 77
  end
  object sqlDescartes: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', D.DATA'#13#10', CA' +
      'ST( SUBSTRING ( D.OBS FROM 1 FOR 50 ) AS VARCHAR( 50 ) ) OBS'#13#10'FR' +
      'OM ZOO_ANIMAL_DESCARTES D'#13#10'LEFT JOIN ZOO_ANIMAIS A ON ( A.KZOO_A' +
      'NIMAL = D.KZOO_ANIMAL )'#13#10'ORDER BY D.DATA DESC'#13#10'ROWS :ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 998
    Top = 122
    object sqlDescartesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlDescartesBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlDescartesBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlDescartesDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlDescartesOBS: TStringField
      FieldName = 'OBS'
      Size = 50
    end
  end
  object cdsResultados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspResultados'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 1264
    Top = 36
    object cdsResultadosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsResultadosBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsResultadosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsResultadosDATASTATUS: TSQLTimeStampField
      DisplayLabel = 'Data exame'
      DisplayWidth = 12
      FieldName = 'DATASTATUS'
    end
    object cdsResultadosEXAME: TStringField
      DisplayLabel = 'Exame'
      DisplayWidth = 15
      FieldName = 'EXAME'
      Required = True
      Size = 30
    end
    object cdsResultadosDATA_RESULTADO: TSQLTimeStampField
      DisplayLabel = 'Data resultado'
      DisplayWidth = 12
      FieldName = 'DATA_RESULTADO'
    end
    object cdsResultadosRESULTADOS: TStringField
      DisplayLabel = 'Resultados'
      DisplayWidth = 25
      FieldName = 'RESULTADOS'
      Size = 100
    end
  end
  object dspResultados: TDataSetProvider
    DataSet = sqlResultados
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 1237
    Top = 81
  end
  object sqlResultados: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', T.DATASTATUS' +
      #13#10', CAST ( SUBSTRING ( T.NOME FROM 1 FOR 30 ) AS VARCHAR( 30 )) ' +
      'EXAME'#13#10', T.DATA_RESULTADO'#13#10', CAST ('#13#10'    SUBSTRING ('#13#10'       COA' +
      'LESCE( RESULTADO1.NOME, '#39#39' )'#13#10'    || COALESCE( '#39' - '#39' || RESULTAD' +
      'O2.NOME, '#39#39' )'#13#10'    || COALESCE( '#39' - '#39' || RESULTADO3.NOME, '#39#39' )'#13#10 +
      '  FROM 1 FOR 100 )'#13#10'  AS VARCHAR( 100 ) ) RESULTADOS'#13#10'FROM ZOO_A' +
      'NIMAL_TAREFAS T'#13#10'LEFT JOIN ZOO_ANIMAIS A ON ( A.KZOO_ANIMAL = T.' +
      'KZOO_ANIMAL )'#13#10'LEFT JOIN ZOO_TAREFA_RESULTADOS RESULTADO1 ON RES' +
      'ULTADO1.KZOO_TAREFA_RESULTADO = T.KZOO_TAREFA_RESULTADO1'#13#10'LEFT J' +
      'OIN ZOO_TAREFA_RESULTADOS RESULTADO2 ON RESULTADO2.KZOO_TAREFA_R' +
      'ESULTADO = T.KZOO_TAREFA_RESULTADO2'#13#10'LEFT JOIN ZOO_TAREFA_RESULT' +
      'ADOS RESULTADO3 ON RESULTADO3.KZOO_TAREFA_RESULTADO = T.KZOO_TAR' +
      'EFA_RESULTADO3'#13#10'WHERE'#13#10'      T.EXAME = '#39'T'#39#13#10'  AND T.EXCLUIDO = '#39 +
      'F'#39#13#10'  AND T.DATA_RESULTADO IS NOT NULL'#13#10'  AND T.STATUS IN'#13#10'   (S' +
      'ELECT SYS$VALUE FROM  SYS$TYPES_GETVALUE( '#39'STATUS_TAREFA'#39', '#39'EXEC' +
      'UTADA'#39' )'#13#10'    UNION ALL'#13#10'    SELECT SYS$VALUE FROM  SYS$TYPES_GE' +
      'TVALUE( '#39'STATUS_TAREFA'#39', '#39'NAO_EXECUTADA'#39' )'#13#10'   )'#13#10'ORDER BY T.DAT' +
      'A_RESULTADO DESC'#13#10'ROWS :ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 1264
    Top = 126
    object sqlResultadosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlResultadosBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlResultadosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlResultadosDATASTATUS: TSQLTimeStampField
      FieldName = 'DATASTATUS'
    end
    object sqlResultadosEXAME: TStringField
      FieldName = 'EXAME'
      Required = True
      Size = 30
    end
    object sqlResultadosDATA_RESULTADO: TSQLTimeStampField
      FieldName = 'DATA_RESULTADO'
    end
    object sqlResultadosRESULTADOS: TStringField
      FieldName = 'RESULTADOS'
      Size = 100
    end
  end
  object cdsExames: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspExames'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 1173
    Top = 37
    object cdsExamesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsExamesBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsExamesBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsExamesDATASTATUS: TSQLTimeStampField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATASTATUS'
    end
    object cdsExamesEXAME: TStringField
      DisplayLabel = 'Exame'
      DisplayWidth = 20
      FieldName = 'EXAME'
      Required = True
      Size = 30
    end
    object cdsExamesSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 15
    end
  end
  object dspExames: TDataSetProvider
    DataSet = sqlExames
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 1146
    Top = 82
  end
  object sqlExames: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', T.DATASTATUS' +
      #13#10', CAST ( SUBSTRING ( T.NOME FROM 1 FOR 30 ) AS VARCHAR( 30 )) ' +
      'EXAME'#13#10', (SELECT CAST( SUBSTRING ( SYS$DESCRIPTION FROM 1 FOR 15' +
      ' ) AS VARCHAR(15))'#13#10'       FROM SYS$TYPES_GETDESCRIPTION( '#39'STATU' +
      'S_TAREFA'#39', T.STATUS )'#13#10'  ) STATUS'#13#10'FROM ZOO_ANIMAL_TAREFAS T'#13#10'LE' +
      'FT JOIN ZOO_ANIMAIS A ON ( A.KZOO_ANIMAL = T.KZOO_ANIMAL )'#13#10'WHER' +
      'E'#13#10'      T.EXAME = '#39'T'#39#13#10'  AND T.EXCLUIDO = '#39'F'#39#13#10'  AND T.DATA_RES' +
      'ULTADO IS NULL'#13#10'  AND T.STATUS IN'#13#10'   (SELECT SYS$VALUE FROM  SY' +
      'S$TYPES_GETVALUE( '#39'STATUS_TAREFA'#39', '#39'EXECUTADA'#39' )'#13#10'    UNION ALL'#13 +
      #10'    SELECT SYS$VALUE FROM  SYS$TYPES_GETVALUE( '#39'STATUS_TAREFA'#39',' +
      ' '#39'NAO_EXECUTADA'#39' )'#13#10'   )'#13#10'ORDER BY T.DATASTATUS DESC'#13#10'ROWS :ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 1173
    Top = 127
    object sqlExamesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlExamesBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlExamesBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlExamesDATASTATUS: TSQLTimeStampField
      FieldName = 'DATASTATUS'
    end
    object sqlExamesEXAME: TStringField
      FieldName = 'EXAME'
      Required = True
      Size = 30
    end
    object sqlExamesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 15
    end
  end
  object cdsTarefas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspTarefas'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 1086
    Top = 36
    object cdsTarefasKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsTarefasBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsTarefasBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsTarefasDATASTATUS: TSQLTimeStampField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATASTATUS'
    end
    object cdsTarefasTAREFA: TStringField
      DisplayLabel = 'Tarefa'
      DisplayWidth = 15
      FieldName = 'TAREFA'
      Required = True
      Size = 30
    end
    object cdsTarefasSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 15
    end
  end
  object dspTarefas: TDataSetProvider
    DataSet = sqlTarefas
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 1059
    Top = 81
  end
  object sqlTarefas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', T.DATASTATUS' +
      #13#10', CAST ( SUBSTRING ( T.CODIGO FROM 1 FOR 30 ) AS VARCHAR( 30 )' +
      ') TAREFA'#13#10', (SELECT CAST( SUBSTRING ( SYS$DESCRIPTION FROM 1 FOR' +
      ' 15 ) AS VARCHAR(15))'#13#10'       FROM SYS$TYPES_GETDESCRIPTION( '#39'ST' +
      'ATUS_TAREFA'#39', T.STATUS )'#13#10'  ) STATUS'#13#10'FROM ZOO_ANIMAL_TAREFAS T'#13 +
      #10'LEFT JOIN ZOO_ANIMAIS A ON ( A.KZOO_ANIMAL = T.KZOO_ANIMAL )'#13#10'W' +
      'HERE'#13#10'      T.EXAME = '#39'F'#39#13#10'  AND T.EXCLUIDO = '#39'F'#39#13#10'  AND T.STATU' +
      'S IN'#13#10'   (SELECT SYS$VALUE FROM  SYS$TYPES_GETVALUE( '#39'STATUS_TAR' +
      'EFA'#39', '#39'EXECUTADA'#39' )'#13#10'    UNION ALL'#13#10'    SELECT SYS$VALUE FROM  S' +
      'YS$TYPES_GETVALUE( '#39'STATUS_TAREFA'#39', '#39'NAO_EXECUTADA'#39' )'#13#10'   )'#13#10'ORD' +
      'ER BY T.DATASTATUS DESC'#13#10'ROWS :ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 1086
    Top = 126
    object sqlTarefasKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlTarefasBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlTarefasBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlTarefasDATASTATUS: TSQLTimeStampField
      FieldName = 'DATASTATUS'
    end
    object sqlTarefasTAREFA: TStringField
      FieldName = 'TAREFA'
      Required = True
      Size = 30
    end
    object sqlTarefasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 15
    end
  end
  object cdsBST: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspBST'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 1350
    Top = 36
    object cdsBSTKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsBSTBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsBSTBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsBSTDATA: TSQLTimeStampField
      DisplayLabel = 'Data do BST'
      DisplayWidth = 12
      FieldName = 'DATA'
      Required = True
    end
    object cdsBSTAPLICADO: TStringField
      DisplayLabel = 'Aplicado'
      FieldName = 'APLICADO'
      Required = True
      Visible = False
      OnGetText = cdsBSTAPLICADOGetText
      FixedChar = True
      Size = 1
    end
  end
  object dspBST: TDataSetProvider
    DataSet = sqlBST
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 1323
    Top = 81
  end
  object sqlBST: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', B.DATA'#13#10', B.' +
      'APLICADO'#13#10'FROM ZOO_ANIMAL_FEMEA_BST B'#13#10'LEFT JOIN ZOO_ANIMAIS A O' +
      'N ( A.KZOO_ANIMAL = B.KZOO_ANIMAL_FEMEA )'#13#10'ORDER BY B.DATA DESC'#13 +
      #10'ROWS :ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 1350
    Top = 126
    object sqlBSTKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlBSTBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlBSTBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlBSTDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlBSTAPLICADO: TStringField
      FieldName = 'APLICADO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsCC: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspCC'
    BeforeOpen = cdsATarefasBeforeOpen
    Left = 825
    Top = 44
    object cdsCCKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsCCBRINCO: TStringField
      DisplayLabel = 'Brinco'
      DisplayWidth = 8
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsCCBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsCCDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATA'
      Required = True
    end
    object cdsCCCC: TFloatField
      DisplayLabel = 'Condi'#231#227'o corporal'
      FieldName = 'CC'
    end
  end
  object dspCC: TDataSetProvider
    DataSet = sqlCC
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 798
    Top = 89
  end
  object sqlCC: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL'#13#10', A.BRINCO'#13#10', A.BRINCO_'#13#10', C.DATA'#13#10', C.' +
      'CC'#13#10'FROM ZOO_ANIMAL_FEMEA_CC C'#13#10'LEFT JOIN ZOO_ANIMAIS A ON ( A.K' +
      'ZOO_ANIMAL = C.KZOO_ANIMAL_FEMEA )'#13#10'ORDER BY C.DATA DESC'#13#10'ROWS :' +
      'ROWS'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 825
    Top = 134
    object sqlCCKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlCCBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlCCBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlCCDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlCCCC: TFloatField
      FieldName = 'CC'
    end
  end
  object cdsControleLeiteiro: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LOTEPESAGEM_LEITE'
        ParamType = ptInput
      end>
    ProviderName = 'dspControleLeiteiro'
    Left = 1445
    Top = 40
    object cdsControleLeiteiroLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'LOTE'
      Size = 32
    end
    object cdsControleLeiteiroPESAGENS: TIntegerField
      DisplayLabel = 'N'#186' de animais'
      DisplayWidth = 5
      FieldName = 'PESAGENS'
      Required = True
    end
    object cdsControleLeiteiroTOTAL: TFloatField
      FieldName = 'TOTAL'
      Visible = False
      DisplayFormat = '#,0.0'
    end
    object cdsControleLeiteiroMEDIA: TFloatField
      DisplayLabel = 'M'#233'dia do lote'
      FieldName = 'MEDIA'
      DisplayFormat = '#,0.0'
    end
  end
  object dspControleLeiteiro: TDataSetProvider
    DataSet = sqlControleLeiteiro
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 1418
    Top = 85
  end
  object sqlControleLeiteiro: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'      LOTE'#13#10'    , COUNT( * ) PESAGENS'#13#10'    , SUM( TOTAL' +
      ' ) TOTAL'#13#10'    , SUM( TOTAL ) / COALESCE( NULLIF( COUNT( * ), 0 )' +
      ', 1 ) MEDIA'#13#10'FROM ZOO_PESAGEM_LEITE'#13#10'WHERE KZOO_LOTEPESAGEM_LEIT' +
      'E = :KZOO_LOTEPESAGEM_LEITE'#13#10'    AND ANIMAL_DOENTE IS DISTINCT F' +
      'ROM '#39'T'#39#13#10'GROUP BY 1'#13#10'HAVING SUM( TOTAL ) > 0'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LOTEPESAGEM_LEITE'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 1445
    Top = 130
    object sqlControleLeiteiroLOTE: TStringField
      FieldName = 'LOTE'
      Size = 32
    end
    object sqlControleLeiteiroPESAGENS: TIntegerField
      FieldName = 'PESAGENS'
      Required = True
    end
    object sqlControleLeiteiroTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object sqlControleLeiteiroMEDIA: TFloatField
      FieldName = 'MEDIA'
    end
  end
  object SQLDataSet1: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'      KZOO_LOTEPESAGEM_LEITE'#13#10'    , DATA'#13#10'    , (SELECT ' +
      #13#10'        SUM( TOTAL ) '#13#10'       FROM ZOO_PESAGEM_LEITE P '#13#10'     ' +
      '  WHERE'#13#10'         P.KZOO_LOTEPESAGEM_LEITE = ZOO_LOTEPESAGEM_LEI' +
      'TE.KZOO_LOTEPESAGEM_LEITE '#13#10'      ) TOTAL'#13#10'    FROM ZOO_LOTEPESA' +
      'GEM_LEITE'#13#10'  WHERE PROCESSADO = '#39'T'#39#13#10'  ORDER BY DATA DESC'#13#10'  ROW' +
      'S 1'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 1553
    Top = 130
    object SQLDataSet1KZOO_LOTEPESAGEM_LEITE: TStringField
      FieldName = 'KZOO_LOTEPESAGEM_LEITE'
      Required = True
      FixedChar = True
    end
    object SQLDataSet1DATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object SQLDataSet1TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
end
