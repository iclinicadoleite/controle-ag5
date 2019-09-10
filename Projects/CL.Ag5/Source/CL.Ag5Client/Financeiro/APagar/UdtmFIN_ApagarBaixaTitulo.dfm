object dtmFIN_ApagarBaixaTitulo: TdtmFIN_ApagarBaixaTitulo
  OldCreateOrder = True
  Height = 239
  Width = 508
  object cdsAPagarParcela: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR_PARCELA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAPagarParcela'
    BeforeOpen = cdsAPagarParcelaBeforeOpen
    OnCalcFields = cdsAPagarParcelaCalcFields
    OnNewRecord = cdsAPagarParcelaNewRecord
    Left = 120
    Top = 17
    object cdsAPagarParcelaKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsAPagarParcelaKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object cdsAPagarParcelaNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsAPagarParcelaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsAPagarParcelaNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      ProviderFlags = [pfInWhere]
      Size = 1024
    end
    object cdsAPagarParcelaTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsAPagarParcelaTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsAPagarParcelaPROVISAO: TStringField
      FieldName = 'PROVISAO'
      FixedChar = True
      Size = 1
    end
    object cdsAPagarParcelaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAPagarParcelaDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Visible = False
      Size = 33
    end
    object cdsAPagarParcelaVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAPagarParcelaVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object cdsAPagarParcelaKFIN_CONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'KFIN_CONTA'
      Required = True
      FixedChar = True
    end
    object cdsAPagarParcelaPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
    end
    object cdsAPagarParcelaPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsAPagarParcelaJURO_DESCONTO: TFloatField
      FieldName = 'JURO_DESCONTO'
    end
    object cdsAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO: TStringField
      FieldName = 'KFIN_PLANOCONTA_JURO_DESCONTO'
    end
    object cdsAPagarParcelaCHEQUE: TStringField
      DisplayLabel = 'Pagamento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarParcelaNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      OnSetText = cdsAPagarParcelaNUM_CHEQUESetText
      Size = 32
    end
    object cdsAPagarParcelaNOMECONTA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMECONTA'
      LookupDataSet = cdsContas
      LookupKeyFields = 'KFIN_CONTA'
      LookupResultField = 'NOME'
      KeyFields = 'KFIN_CONTA'
      Size = 64
      Lookup = True
    end
    object cdsAPagarParcelaOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsAPagarParcelaDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object cdsAPagarParcela_tmpcalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = '_tmpcalc'
      Calculated = True
    end
    object cdsAPagarParcelasqlApropriacaoJuroDesconto: TDataSetField
      FieldName = 'sqlApropriacaoJuroDesconto'
    end
    object cdsAPagarParcelaDESCRICAO_JURO_DESCONTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_JURO_DESCONTO'
      Size = 60
      Calculated = True
    end
  end
  object dspAPagarParcela: TDataSetProvider
    DataSet = sqlAPagarParcela
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 66
  end
  object sqlAPagarParcela: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR_PARCELA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  P.KFIN_APAGAR_PARCELA, '
      '  P.KFIN_APAGAR, '
      '  A.NOMEENTIDADE,'
      '  A.HISTORICO,'
      '  A.TABLENAME,'
      '  A.TABLEKEY,'
      ' A.PROVISAO,'
      '  PL.RESULT NOMEPLANO,'
      '  P.DOCUMENTO, '
      '  P.DOCUMENTO_, '
      '  P.VENCTO, '
      '  P.VALOR, '
      '  P.PAGTO, '
      '  P.PAGO, '
      '  P.JURO_DESCONTO,'
      '  P.KFIN_PLANOCONTA_JURO_DESCONTO,'
      '  P.CHEQUE, P.NUM_CHEQUE,'
      '  P.OBS, '
      '  P.KFIN_CONTA,'
      '  P.DT_COMPENSACAO'
      'FROM FIN_APAGAR_PARCELAS P'
      'LEFT JOIN FIN_APAGAR A ON ( A.KFIN_APAGAR = P.KFIN_APAGAR)'
      
        'LEFT JOIN FIN_GET_STRPLANOCONTAS( A.KFIN_PLANOCONTA ) PL ON ( 1 ' +
        '= 1 )'
      'WHERE P.KFIN_APAGAR_PARCELA = :KFIN_APAGAR_PARCELA')
    Left = 122
    Top = 114
    object sqlAPagarParcelaKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlAPagarParcelaKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object sqlAPagarParcelaNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlAPagarParcelaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlAPagarParcelaTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlAPagarParcelaTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object sqlAPagarParcelaPROVISAO: TStringField
      FieldName = 'PROVISAO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlAPagarParcelaNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      ProviderFlags = [pfInWhere]
      Size = 1024
    end
    object sqlAPagarParcelaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlAPagarParcelaDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Size = 33
    end
    object sqlAPagarParcelaVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAPagarParcelaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sqlAPagarParcelaKFIN_CONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object sqlAPagarParcelaPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
    end
    object sqlAPagarParcelaPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
    end
    object sqlAPagarParcelaJURO_DESCONTO: TFloatField
      FieldName = 'JURO_DESCONTO'
    end
    object sqlAPagarParcelaKFIN_PLANOCONTA_JURO_DESCONTO: TStringField
      FieldName = 'KFIN_PLANOCONTA_JURO_DESCONTO'
    end
    object sqlAPagarParcelaCHEQUE: TStringField
      DisplayLabel = 'Pagamento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAPagarParcelaNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object sqlAPagarParcelaDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object sqlAPagarParcelaOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas'
    Left = 374
    Top = 20
    object cdsContasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Required = True
      FixedChar = True
    end
    object cdsContasNOME: TStringField
      FieldName = 'NOME'
      Size = 64
    end
  end
  object dspContas: TDataSetProvider
    DataSet = sqlContas
    UpdateMode = upWhereKeyOnly
    Left = 334
    Top = 66
  end
  object sqlContas: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    C.KFIN_CONTA'
      ',  C.NOME'
      'FROM FIN_CONTAS C'
      'LEFT JOIN FRISIA_MATRICULA_CONTAS F USING ( KFIN_CONTA )'
      'WHERE C.ATIVA = '#39'T'#39
      '  AND F.KFRISIA_MATRICULA_CONTA IS NULL')
    Left = 376
    Top = 105
    object sqlContasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Required = True
      FixedChar = True
    end
    object sqlContasNOME: TStringField
      FieldName = 'NOME'
      Size = 64
    end
  end
  object dtsApagarParcela: TDataSource
    DataSet = cdsAPagarParcela
    OnDataChange = dtsApagarParcelaDataChange
    Left = 33
    Top = 6
  end
  object cdsApropriacaoJuroDesconto: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsAPagarParcelasqlApropriacaoJuroDesconto
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    OnNewRecord = cdsApropriacaoJuroDescontoNewRecord
    Left = 248
    Top = 17
    object cdsApropriacaoJuroDescontoKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsApropriacaoJuroDescontoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object cdsApropriacaoJuroDescontoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsApropriacaoJuroDescontoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cdsApropriacaoJuroDescontoCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object cdsApropriacaoJuroDescontoPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object cdsApropriacaoJuroDescontoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsApropriacaoJuroDescontoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsApropriacaoJuroDescontoTOTAL_PORCENTAGEM: TAggregateField
      DisplayLabel = 'Total porcentagem'
      FieldName = 'TOTAL_PORCENTAGEM'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PORCENTAGEM)'
    end
  end
  object sqlApropriacaoJuroDesconto: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLAPagarParcela
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR_PARCELA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    A.KFIN_APROPRIACAO,'
      '    A.TABLENAME,'
      '    A.TABLEKEY,'
      '    A.KFIN_CENTROCUSTO,     '
      '    C.NOME,  '
      '    C.CODIGO, '
      '    C.CLASSIFICACAO,  '
      '    A.PORCENTAGEM'
      'FROM FIN_APROPRIACAO A'
      
        'LEFT JOIN FIN_CENTROSCUSTO C ON C.KFIN_CENTROCUSTO = A.KFIN_CENT' +
        'ROCUSTO'
      'WHERE A.TABLENAME = '#39'FIN_APAGAR_PARCELAS'#39' '
      '     AND A.TABLEKEY = :KFIN_APAGAR_PARCELA')
    Left = 248
    Top = 115
    object sqlApropriacaoJuroDescontoKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApropriacaoJuroDescontoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object sqlApropriacaoJuroDescontoPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoJuroDescontoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlApropriacaoJuroDescontoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object sqlApropriacaoJuroDescontoCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlApropriacaoJuroDescontoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApropriacaoJuroDescontoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
  end
  object dtsSQLAPagarParcela: TDataSource
    DataSet = sqlAPagarParcela
    Left = 168
    Top = 160
  end
end
