object Fin_BaixaAPagarColetivoDatamodule: TFin_BaixaAPagarColetivoDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsBaixaAPagar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DSP_TITULOS'
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
        Name = 'DSP_TITULOS'
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
        Name = 'DSP_TITULOS'
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
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspBaixaAPagar'
    BeforePost = cdsBaixaAPagarBeforePost
    OnCalcFields = cdsBaixaAPagarCalcFields
    Left = 78
    Top = 20
    object cdsBaixaAPagarKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAPagarBAIXADO: TStringField
      FieldName = 'BAIXADO'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsBaixaAPagarBAIXAR: TStringField
      DisplayLabel = 'Baixar'
      FieldName = 'BAIXAR'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsBaixaAPagarBAIXARGetText
      Size = 1
    end
    object cdsBaixaAPagarKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAPagarKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAPagarTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsBaixaAPagarTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsBaixaAPagarPROVISAO: TStringField
      DisplayLabel = 'Provis'#227'o'
      FieldName = 'PROVISAO'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsBaixaAPagarPROVISAOGetText
      Size = 1
    end
    object cdsBaixaAPagarDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsBaixaAPagarDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Visible = False
      Size = 33
    end
    object cdsBaixaAPagarHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsBaixaAPagarDATACOMPRA: TSQLTimeStampField
      DisplayLabel = 'Data da compra'
      FieldName = 'DATACOMPRA'
      ProviderFlags = [pfInWhere]
    end
    object cdsBaixaAPagarVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsBaixaAPagarKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAPagarNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsBaixaAPagarPARCELAS: TStringField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      Size = 23
    end
    object cdsBaixaAPagarVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      OnChange = cdsBaixaAPagarVALORChange
      DisplayFormat = '#,0.00'
    end
    object cdsBaixaAPagarKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAPagarCONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'CONTA'
      Size = 64
    end
    object cdsBaixaAPagarNOMECONTA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMECONTA'
      LookupDataSet = cdsContas
      LookupKeyFields = 'KFIN_CONTA'
      LookupResultField = 'NOME'
      KeyFields = 'KFIN_CONTA'
      Size = 64
      Lookup = True
    end
    object cdsBaixaAPagarNOMECONTA_: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOMECONTA_'
      Size = 64
    end
    object cdsBaixaAPagarPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
    end
    object cdsBaixaAPagarPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsBaixaAPagarJURO_DESCONTO: TFloatField
      FieldName = 'JURO_DESCONTO'
      DisplayFormat = '#,0.00'
    end
    object cdsBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO: TStringField
      FieldName = 'KFIN_PLANOCONTA_JURO_DESCONTO'
    end
    object cdsBaixaAPagarCHEQUE: TStringField
      DisplayLabel = 'Pagamento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsBaixaAPagarDESCRICAO_JURO_DESCONTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_JURO_DESCONTO'
      Size = 60
      Calculated = True
    end
    object cdsBaixaAPagarDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object cdsBaixaAPagarKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object cdsBaixaAPagarOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsBaixaAPagarNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      OnSetText = cdsBaixaAPagarNUM_CHEQUESetText
      Size = 32
    end
    object cdsBaixaAPagarsqlApropriacaoJuroDesconto: TDataSetField
      FieldName = 'sqlApropriacaoJuroDesconto'
    end
    object cdsBaixaAPagar_tmpcalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = '_tmpcalc'
      Calculated = True
    end
  end
  object dspBaixaAPagar: TDataSetProvider
    DataSet = sqlBaixaAPagar
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspBaixaAPagarAfterUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlBaixaAPagar: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DSP_TITULOS'
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
        Name = 'DSP_TITULOS'
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
        Name = 'DSP_TITULOS'
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
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    P.KFIN_APAGAR_PARCELA,'
      '    P.KFIN_APAGAR,'
      '    IIF ( P.PAGTO IS NULL, '#39'F'#39', '#39'T'#39' ) BAIXADO,'
      '    IIF ( P.PAGTO IS NULL, '#39'F'#39', '#39'T'#39' ) BAIXAR,'
      '    CMP.KCMP_PEDIDO,'
      
        '    COALESCE( CMP.NOTA_FISCAL, P.DOCUMENTO, AP.DOCUMENTO ) DOCUM' +
        'ENTO,'
      
        '    COALESCE( CMP.NOTA_FISCAL_, P.DOCUMENTO_, AP.DOCUMENTO_ ) DO' +
        'CUMENTO_,'
      '    AP.HISTORICO,'
      '    AP.KFIN_CONTA_PREF,'
      '    AP.TABLENAME,'
      '    AP.TABLEKEY,'
      '    AP.PROVISAO,'
      
        '    COALESCE (  CMP.DATA_EMISSAO, IIF( AP.RECORRENCIA = '#39'T'#39', P.V' +
        'ENCTO, AP.DATALANCTO )  ) DATACOMPRA,'
      '    P.VENCTO,'
      '    AP.KCAD_ENTIDADE,'
      '    AP.NOMEENTIDADE,'
      '    (    ( SELECT COUNT(1)'
      '             FROM FIN_APAGAR_PARCELAS P1'
      '            WHERE P1.KFIN_APAGAR = P.KFIN_APAGAR'
      '              AND P1.VENCTO <= P.VENCTO'
      '          ) || '#39'/'#39' ||'
      '         ( SELECT COUNT(1)'
      '             FROM FIN_APAGAR_PARCELAS P1'
      '            WHERE P1.KFIN_APAGAR = P.KFIN_APAGAR'
      '          )'
      '     ) PARCELAS,'
      '    P.VALOR,'
      '    P.PAGO,'
      '    P.PAGTO,'
      '    P.JURO_DESCONTO,'
      '    P.KFIN_PLANOCONTA_JURO_DESCONTO,'
      '    P.CHEQUE,    P.NUM_CHEQUE,'
      '    P.DT_COMPENSACAO,'
      '    P.KFIN_CONTA,'
      '    C.NOME CONTA,'
      '    P.OBS'
      'FROM FIN_APAGAR_PARCELAS P'
      'INNER JOIN FIN_APAGAR AP ON AP.KFIN_APAGAR = P.KFIN_APAGAR'
      
        'LEFT JOIN CMP_PEDIDOS CMP ON AP.TABLENAME = '#39'CMP_PEDIDOS'#39' AND CM' +
        'P.KCMP_PEDIDO = AP.TABLEKEY'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      
        'WHERE  ( AP.KSYS$DOMAIN = :KSYS$DOMAIN ) AND (AP.TABLENAME IS DI' +
        'STINCT FROM '#39'FIN_TRANSFERENCIAS'#39')'
      '  AND (AP.SYS$ORIGIN_TYPE <> 2)'
      '  AND  ('
      
        '             ( :DSP_TITULOS = 1 AND P.VENCTO BETWEEN :DATAINI AN' +
        'D :DATAFIM AND P.PAGTO IS NULL )'
      
        '       OR ( :DSP_TITULOS = 2 AND P.PAGTO  BETWEEN :DATAINI AND :' +
        'DATAFIM)'
      
        '       OR ( :DSP_TITULOS = 3 AND (   (P.VENCTO BETWEEN :DATAINI ' +
        'AND :DATAFIM)'
      
        '                                  OR (P.PAGTO  BETWEEN :DATAINI ' +
        'AND :DATAFIM) )'
      '          ) )'
      '  AND (     ( :DSP_FORNECEDOR = '#39'F'#39' )'
      
        '          OR ( :DSP_FORNECEDOR = '#39'T'#39' AND AP.KCAD_ENTIDADE = :KCA' +
        'D_ENTIDADE )'
      '          )'
      'ORDER BY P.VENCTO')
    Left = 81
    Top = 100
    object sqlBaixaAPagarKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAPagarBAIXADO: TStringField
      FieldName = 'BAIXADO'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlBaixaAPagarBAIXAR: TStringField
      FieldName = 'BAIXAR'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlBaixaAPagarKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
    end
    object sqlBaixaAPagarKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlBaixaAPagarTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlBaixaAPagarTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object sqlBaixaAPagarPROVISAO: TStringField
      FieldName = 'PROVISAO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlBaixaAPagarDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlBaixaAPagarDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Size = 33
    end
    object sqlBaixaAPagarHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlBaixaAPagarDATACOMPRA: TSQLTimeStampField
      DisplayLabel = 'Data da compra'
      FieldName = 'DATACOMPRA'
      ProviderFlags = [pfInWhere]
    end
    object sqlBaixaAPagarVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlBaixaAPagarKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAPagarNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlBaixaAPagarPARCELAS: TStringField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      Size = 23
    end
    object sqlBaixaAPagarVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
    end
    object sqlBaixaAPagarKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAPagarCONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
    object sqlBaixaAPagarPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
    end
    object sqlBaixaAPagarPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
    end
    object sqlBaixaAPagarJURO_DESCONTO: TFloatField
      FieldName = 'JURO_DESCONTO'
    end
    object sqlBaixaAPagarKFIN_PLANOCONTA_JURO_DESCONTO: TStringField
      FieldName = 'KFIN_PLANOCONTA_JURO_DESCONTO'
    end
    object sqlBaixaAPagarCHEQUE: TStringField
      DisplayLabel = 'Pagamento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlBaixaAPagarDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object sqlBaixaAPagarKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object sqlBaixaAPagarOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlBaixaAPagarNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
  end
  object dtsBaixaAPagar: TDataSource
    DataSet = sqlBaixaAPagar
    Left = 114
    Top = 147
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
      ',   C.NOME'
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
  object cdsApropriacaoJuroDesconto: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsBaixaAPagarsqlApropriacaoJuroDesconto
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
    DataSource = dtsBaixaAPagar
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
  object DataSource1: TDataSource
    DataSet = cdsBaixaAPagar
    OnDataChange = DataSource1DataChange
    Left = 136
    Top = 16
  end
end
