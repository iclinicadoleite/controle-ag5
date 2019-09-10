object dtmFIN_FluxoCaixaDetalhe: TdtmFIN_FluxoCaixaDetalhe
  OldCreateOrder = False
  Height = 349
  Width = 890
  object cdsAPagarPrevisto: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspAPagarPrevisto'
    Left = 97
    Top = 8
    object cdsAPagarPrevistoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsAPagarPrevistoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfHidden]
      Size = 128
    end
    object cdsAPagarPrevistoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAPagarPrevistoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object cdsAPagarPrevistoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object cdsAPagarPrevistoSomaTotal: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      Expression = 'SUM( VALOR )'
    end
  end
  object dspAPagarPrevisto: TDataSetProvider
    DataSet = sqlAPagarPrevisto
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 72
  end
  object sqlAPagarPrevisto: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT -- APAGAR PREVISTO'
      
        '    CAST ( COALESCE ( P.PRORROGACAO, P.VENCTO ) AS DATE ) AS DAT' +
        'A,'
      '    P.VALOR,'
      
        '    CAST ( A.NOMEENTIDADE || ASCII_CHAR( 13 ) || ASCII_CHAR( 10 ' +
        ') || A.HISTORICO as VARCHAR ( 128 ) ) NOMEENTIDADE,'
      '    P.DOCUMENTO, '
      '    CPREF.NOME NOMECONTA'
      'FROM FIN_APAGAR_PARCELAS P'
      'LEFT JOIN  FIN_APAGAR A  ON ( P.KFIN_APAGAR = A.KFIN_APAGAR)'
      
        'LEFT JOIN FIN_CONTAS CPREF ON CPREF.KFIN_CONTA = A.KFIN_CONTA_PR' +
        'EF'
      
        'WHERE ( ( P.VENCTO BETWEEN :DATAINICIO AND :DATAFIM AND  P.PRORR' +
        'OGACAO IS NULL ) OR (  P.PRORROGACAO BETWEEN :DATAINICIO AND :DA' +
        'TAFIM) )'
      '         AND P.PAGTO IS NULL AND P.PREVISAO = '#39'T'#39
      'ORDER BY A.NOMEENTIDADE')
    Left = 100
    Top = 136
    object sqlAPagarPrevistoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqlAPagarPrevistoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlAPagarPrevistoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlAPagarPrevistoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlAPagarPrevistoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
  end
  object SharedConnection1: TSharedConnection
    Left = 24
    Top = 176
  end
  object cdsAPagarEfetivo: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspAPagarEfetivo'
    Left = 231
    Top = 8
    object cdsAPagarEfetivoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsAPagarEfetivoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsAPagarEfetivoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAPagarEfetivoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object cdsAPagarEfetivoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object cdsAPagarEfetivoSomaTotal: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      Expression = 'SUM ( VALOR )'
    end
  end
  object dspAPagarEfetivo: TDataSetProvider
    DataSet = sqlAPagarEfetivo
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 72
  end
  object sqlAPagarEfetivo: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT -- APAGAR PREVISTO'
      
        '    CAST ( COALESCE ( P.PRORROGACAO, P.VENCTO ) AS DATE ) AS DAT' +
        'A,'
      '    P.VALOR,'
      
        '    CAST ( A.NOMEENTIDADE || ASCII_CHAR( 13 ) || ASCII_CHAR( 10 ' +
        ') || A.HISTORICO as VARCHAR ( 128 ) ) NOMEENTIDADE,'
      '    P.DOCUMENTO, '
      '    CPREF.NOME NOMECONTA'
      'FROM FIN_APAGAR_PARCELAS P'
      'LEFT JOIN  FIN_APAGAR A  ON ( P.KFIN_APAGAR = A.KFIN_APAGAR)'
      
        'LEFT JOIN FIN_CONTAS CPREF ON CPREF.KFIN_CONTA = A.KFIN_CONTA_PR' +
        'EF'
      
        'WHERE ( ( P.VENCTO BETWEEN :DATAINICIO AND :DATAFIM AND  P.PRORR' +
        'OGACAO IS NULL ) OR (  P.PRORROGACAO BETWEEN :DATAINICIO AND :DA' +
        'TAFIM ) )'
      '         AND P.PAGTO IS NULL AND P.PREVISAO = '#39'F'#39
      'ORDER BY A.NOMEENTIDADE')
    Left = 234
    Top = 136
    object sqlAPagarEfetivoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqlAPagarEfetivoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlAPagarEfetivoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlAPagarEfetivoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object sqlAPagarEfetivoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
  end
  object cdsAPagarQuitado: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspAPagarQuitado'
    Left = 357
    Top = 8
    object cdsAPagarQuitadoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsAPagarQuitadoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsAPagarQuitadoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAPagarQuitadoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object cdsAPagarQuitadoSomaTotal: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      Expression = 'SUM ( VALOR )'
    end
  end
  object dspAPagarQuitado: TDataSetProvider
    DataSet = sqlAPagarQuitado
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 320
    Top = 72
  end
  object sqlAPagarQuitado: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT -- APAGAR QUITADO'
      '    CAST( P.PAGTO AS DATE ) AS DATA,'
      '    P.VALOR,'
      
        '    CAST ( A.NOMEENTIDADE || ASCII_CHAR( 13 ) || ASCII_CHAR( 10 ' +
        ') || A.HISTORICO as VARCHAR ( 128 ) ) NOMEENTIDADE,'
      '    A.HISTORICO,'
      '    P.DOCUMENTO,'
      '    C.NOME NOMECONTA'
      'FROM FIN_APAGAR_PARCELAS P'
      'LEFT JOIN  FIN_APAGAR A  ON ( P.KFIN_APAGAR = A.KFIN_APAGAR )'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      'WHERE ( P.PAGTO BETWEEN :DATAINICIO AND :DATAFIM )'
      'ORDER BY A.NOMEENTIDADE')
    Left = 360
    Top = 136
    object sqlAPagarQuitadoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqlAPagarQuitadoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlAPagarQuitadoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlAPagarQuitadoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
  end
  object cdsAReceberPrevisto: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAReceberPrevisto'
    Left = 505
    Top = 8
    object cdsAReceberPrevistoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsAReceberPrevistoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsAReceberPrevistoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAReceberPrevistoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object cdsAReceberPrevistoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object cdsAReceberPrevistoSomaTotal: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      Expression = 'SUM(VALOR)'
    end
  end
  object dspAReceberPrevisto: TDataSetProvider
    DataSet = sqlAReceberPrevisto
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 464
    Top = 72
  end
  object sqlAReceberPrevisto: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT -- ARECEBER PREVISTO'
      
        '    CAST ( COALESCE ( P.PRORROGACAO, P.VENCTO ) AS DATE ) AS DAT' +
        'A,'
      '    P.VALOR,'
      
        '    CAST ( R.NOMEENTIDADE || ASCII_CHAR( 13 ) || ASCII_CHAR( 10 ' +
        ') || R.HISTORICO as VARCHAR ( 128 ) ) NOMEENTIDADE,'
      '    P.DOCUMENTO,'
      '    CPREF.NOME NOMECONTA'
      'FROM FIN_ARECEBER_PARCELAS P'
      
        'LEFT JOIN  FIN_ARECEBER R ON ( P.KFIN_ARECEBER = R.KFIN_ARECEBER' +
        ')'
      
        'LEFT JOIN FIN_CONTAS CPREF ON CPREF.KFIN_CONTA = R.KFIN_CONTA_PR' +
        'EF'
      
        'WHERE ( ( P.VENCTO = :DATA AND  P.PRORROGACAO IS NULL ) OR (  P.' +
        'PRORROGACAO = :DATA ) )'
      '         AND P.PAGTO IS NULL AND P.PREVISAO = '#39'T'#39
      'ORDER BY R.NOMEENTIDADE')
    Left = 508
    Top = 136
    object sqlAReceberPrevistoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqlAReceberPrevistoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlAReceberPrevistoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlAReceberPrevistoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlAReceberPrevistoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
  end
  object cdsAReceberFaturado: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAReceberFaturado'
    Left = 640
    Top = 8
    object cdsAReceberFaturadoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsAReceberFaturadoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsAReceberFaturadoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAReceberFaturadoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object cdsAReceberFaturadoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object cdsAReceberFaturadoSomaTotal: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      Expression = 'SUM(VALOR)'
    end
  end
  object dspAReceberFaturado: TDataSetProvider
    DataSet = sqlAReceberFaturado
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 600
    Top = 72
  end
  object sqlAReceberFaturado: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT -- ARECEBER PREVISTO'
      
        '    CAST ( COALESCE ( P.PRORROGACAO, P.VENCTO ) AS DATE ) AS DAT' +
        'A,'
      '    P.VALOR,'
      
        '    CAST ( R.NOMEENTIDADE || ASCII_CHAR( 13 ) || ASCII_CHAR( 10 ' +
        ') || R.HISTORICO as VARCHAR ( 128 ) ) NOMEENTIDADE,'
      '    P.DOCUMENTO,'
      '    CPREF.NOME NOMECONTA'
      'FROM FIN_ARECEBER_PARCELAS P'
      
        'LEFT JOIN  FIN_ARECEBER R  ON ( P.KFIN_ARECEBER = R.KFIN_ARECEBE' +
        'R)'
      
        'LEFT JOIN FIN_CONTAS CPREF ON CPREF.KFIN_CONTA = R.KFIN_CONTA_PR' +
        'EF'
      
        'WHERE ( ( P.VENCTO = :DATA AND  P.PRORROGACAO IS NULL ) OR (  P.' +
        'PRORROGACAO = :DATA ) )'
      '         AND P.PAGTO IS NULL AND P.PREVISAO = '#39'F'#39
      'ORDER BY R.NOMEENTIDADE')
    Left = 643
    Top = 136
    object sqlAReceberFaturadoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqlAReceberFaturadoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlAReceberFaturadoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlAReceberFaturadoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlAReceberFaturadoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
  end
  object cdsAReceberQuitado: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAReceberQuitado'
    Left = 765
    Top = 8
    object cdsAReceberQuitadoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsAReceberQuitadoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsAReceberQuitadoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAReceberQuitadoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object cdsAReceberQuitadoSomaTotal: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      Expression = 'SUM(VALOR)'
    end
  end
  object dspAReceberQuitado: TDataSetProvider
    DataSet = sqlAReceberQuitado
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 72
  end
  object sqlAReceberQuitado: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT -- ARECEBER RECEBIDO'
      '    CAST( P.PAGTO AS DATE ) AS DATA,'
      '    P.VALOR,'
      
        '    CAST ( R.NOMEENTIDADE || ASCII_CHAR( 13 ) || ASCII_CHAR( 10 ' +
        ') || R.HISTORICO as VARCHAR ( 128 ) ) NOMEENTIDADE,'
      '    P.DOCUMENTO,'
      '    C.NOME NOMECONTA'
      'FROM FIN_ARECEBER_PARCELAS P'
      
        'LEFT JOIN  FIN_ARECEBER R  ON ( P.KFIN_ARECEBER = R.KFIN_ARECEBE' +
        'R )'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      'WHERE ( P.PAGTO = :DATA )'
      'ORDER BY R.NOMEENTIDADE')
    Left = 768
    Top = 136
    object sqlAReceberQuitadoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqlAReceberQuitadoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlAReceberQuitadoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlAReceberQuitadoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
  end
end
