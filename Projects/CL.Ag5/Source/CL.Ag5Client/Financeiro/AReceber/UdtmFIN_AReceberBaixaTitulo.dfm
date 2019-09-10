object dtmFIN_AReceberBaixaTitulo: TdtmFIN_AReceberBaixaTitulo
  OldCreateOrder = True
  Height = 239
  Width = 460
  object cdsAReceberParcela: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'KFIN_ARECEBER_PARCELA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAReceberParcela'
    BeforeOpen = cdsAReceberParcelaBeforeOpen
    OnCalcFields = cdsAReceberParcelaCalcFields
    OnNewRecord = cdsAReceberParcelaNewRecord
    Left = 100
    Top = 12
    object cdsAReceberParcelaKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInWhere, pfInKey]
      FixedChar = True
    end
    object cdsAReceberParcelaKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      FixedChar = True
    end
    object cdsAReceberParcelaTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsAReceberParcelaTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsAReceberParcelaNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsAReceberParcelaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsAReceberParcelaNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      ProviderFlags = [pfInWhere]
      Size = 1024
    end
    object cdsAReceberParcelaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsAReceberParcelaDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Visible = False
      Size = 33
    end
    object cdsAReceberParcelaVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAReceberParcelaVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object cdsAReceberParcelaKFIN_CONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'KFIN_CONTA'
      Required = True
      FixedChar = True
    end
    object cdsAReceberParcelaNOMECONTA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMECONTA'
      LookupDataSet = cdsContas
      LookupKeyFields = 'KFIN_CONTA'
      LookupResultField = 'NOME'
      KeyFields = 'KFIN_CONTA'
      Size = 64
      Lookup = True
    end
    object cdsAReceberParcelaPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
    end
    object cdsAReceberParcelaPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsAReceberParcelaJURO_DESCONTO: TFloatField
      FieldName = 'JURO_DESCONTO'
    end
    object cdsAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO: TStringField
      FieldName = 'KFIN_PLANOCONTA_JURO_DESCONTO'
    end
    object cdsAReceberParcelaOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsAReceberParcelaCHEQUE: TStringField
      DisplayLabel = 'Com cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberParcelaNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      OnSetText = cdsAReceberParcelaNUM_CHEQUESetText
      Size = 32
    end
    object cdsAReceberParcelaDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object cdsAReceberParcela_tmpcalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = '_tmpcalc'
      Calculated = True
    end
    object cdsAReceberParcelaDESCRICAO_JURO_DESCONTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_JURO_DESCONTO'
      Size = 60
      Calculated = True
    end
    object cdsAReceberParcelasqlApropriacaoJuroDesconto: TDataSetField
      FieldName = 'sqlApropriacaoJuroDesconto'
    end
    object cdsAReceberParcelaPROVISAO: TStringField
      FieldName = 'PROVISAO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
  end
  object dspAReceberParcela: TDataSetProvider
    DataSet = sqlAReceberParcela
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 60
    Top = 57
  end
  object sqlAReceberParcela: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'KFIN_ARECEBER_PARCELA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  P.KFIN_ARECEBER_PARCELA,'
      '  P.KFIN_ARECEBER,'
      '  R.NOMEENTIDADE,'
      '  R.HISTORICO,'
      '  R.TABLENAME,'
      '  R.TABLEKEY,'
      '  R.PROVISAO,'
      '  PL.RESULT NOMEPLANO,'
      '  P.DOCUMENTO,'
      '  P.DOCUMENTO_,'
      '  P.VENCTO,'
      '  P.VALOR,'
      '  P.PAGTO,'
      '  P.PAGO,'
      '  P.JURO_DESCONTO,'
      '  P.KFIN_PLANOCONTA_JURO_DESCONTO,'
      '  P.OBS,'
      '  P.KFIN_CONTA, '
      '  P.CHEQUE,P.NUM_CHEQUE, '
      '  P.DT_COMPENSACAO'
      'FROM FIN_ARECEBER_PARCELAS P'
      'LEFT JOIN FIN_ARECEBER R ON ( R.KFIN_ARECEBER = P.KFIN_ARECEBER)'
      
        'LEFT JOIN FIN_GET_STRPLANOCONTAS( R.KFIN_PLANOCONTA ) PL ON ( 1 ' +
        '= 1 )'
      'WHERE P.KFIN_ARECEBER_PARCELA = :KFIN_ARECEBER_PARCELA')
    Left = 95
    Top = 103
    object sqlAReceberParcelaKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInWhere, pfInKey]
      FixedChar = True
    end
    object sqlAReceberParcelaKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      FixedChar = True
    end
    object sqlAReceberParcelaTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlAReceberParcelaTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object sqlAReceberParcelaNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlAReceberParcelaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlAReceberParcelaNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      ProviderFlags = [pfInWhere]
      Size = 1024
    end
    object sqlAReceberParcelaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlAReceberParcelaDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Size = 33
    end
    object sqlAReceberParcelaVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAReceberParcelaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sqlAReceberParcelaKFIN_CONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object sqlAReceberParcelaPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
    end
    object sqlAReceberParcelaPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
    end
    object sqlAReceberParcelaJURO_DESCONTO: TFloatField
      FieldName = 'JURO_DESCONTO'
    end
    object sqlAReceberParcelaKFIN_PLANOCONTA_JURO_DESCONTO: TStringField
      FieldName = 'KFIN_PLANOCONTA_JURO_DESCONTO'
    end
    object sqlAReceberParcelaOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlAReceberParcelaCHEQUE: TStringField
      DisplayLabel = 'Com cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAReceberParcelaNUM_CHEQUE: TStringField
      DisplayLabel = 'No. Cheque'
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object sqlAReceberParcelaDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object sqlAReceberParcelaPROVISAO: TStringField
      FieldName = 'PROVISAO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
  end
  object cdsContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas'
    Left = 357
    Top = 21
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
    Left = 320
    Top = 65
  end
  object sqlContas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    C.KFIN_CONTA'
      ',   C.NOME'
      'FROM FIN_CONTAS C'
      'LEFT JOIN FRISIA_MATRICULA_CONTAS F USING ( KFIN_CONTA )'
      'WHERE C.ATIVA = '#39'T'#39
      '  AND F.KFRISIA_MATRICULA_CONTA IS NULL')
    Left = 355
    Top = 110
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
  object dtsAReceberParcela: TDataSource
    DataSet = cdsAReceberParcela
    OnDataChange = dtsAReceberParcelaDataChange
    Left = 20
    Top = 8
  end
  object cdsApropriacaoJuroDesconto: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsAReceberParcelasqlApropriacaoJuroDesconto
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    OnNewRecord = cdsApropriacaoJuroDescontoNewRecord
    Left = 238
    Top = 9
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
    DataSource = dtsSQLAReceberParcela
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_ARECEBER_PARCELA'
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
      'WHERE A.TABLENAME = '#39'FIN_ARECEBER_PARCELAS'#39' '
      '     AND A.TABLEKEY = :KFIN_ARECEBER_PARCELA')
    Left = 238
    Top = 107
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
  object dtsSQLAReceberParcela: TDataSource
    DataSet = sqlAReceberParcela
    Left = 152
    Top = 160
  end
end
