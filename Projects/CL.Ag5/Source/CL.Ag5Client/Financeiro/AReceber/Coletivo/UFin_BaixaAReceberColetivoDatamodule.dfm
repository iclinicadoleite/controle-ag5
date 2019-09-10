object Fin_BaixaAReceberColetivoDatamodule: TFin_BaixaAReceberColetivoDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsBaixaAReceber: TClientDataSet
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
        Name = 'DSP_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspBaixaAReceber'
    BeforePost = cdsBaixaAReceberBeforePost
    OnCalcFields = cdsBaixaAReceberCalcFields
    Left = 78
    Top = 20
    object cdsBaixaAReceberKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAReceberBAIXADO: TStringField
      FieldName = 'BAIXADO'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsBaixaAReceberBAIXAR: TStringField
      DisplayLabel = 'Baixar'
      FieldName = 'BAIXAR'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsBaixaAReceberBAIXARGetText
      Size = 1
    end
    object cdsBaixaAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAReceberKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAReceberTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsBaixaAReceberTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsBaixaAReceberPROVISAO: TStringField
      DisplayLabel = 'Provis'#227'o'
      FieldName = 'PROVISAO'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsBaixaAReceberPROVISAOGetText
      Size = 1
    end
    object cdsBaixaAReceberDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsBaixaAReceberDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Visible = False
      Size = 33
    end
    object cdsBaixaAReceberHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsBaixaAReceberDATACOMPRA: TSQLTimeStampField
      DisplayLabel = 'Data da compra'
      FieldName = 'DATACOMPRA'
      ProviderFlags = [pfInWhere]
    end
    object cdsBaixaAReceberVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsBaixaAReceberKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAReceberNOMEENTIDADE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsBaixaAReceberPARCELAS: TStringField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      Size = 23
    end
    object cdsBaixaAReceberVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      OnChange = cdsBaixaAReceberVALORChange
      DisplayFormat = '#,0.00'
    end
    object cdsBaixaAReceberKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAReceberCONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'CONTA'
      Size = 64
    end
    object cdsBaixaAReceberNOMECONTA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMECONTA'
      LookupDataSet = cdsContas
      LookupKeyFields = 'KFIN_CONTA'
      LookupResultField = 'NOME'
      KeyFields = 'KFIN_CONTA'
      Size = 64
      Lookup = True
    end
    object cdsBaixaAReceberNOMECONTA_: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOMECONTA_'
      Size = 64
    end
    object cdsBaixaAReceberPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data recebimento'
      FieldName = 'PAGTO'
    end
    object cdsBaixaAReceberPAGO: TFloatField
      DisplayLabel = 'Valor recebido'
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsBaixaAReceberJURO_DESCONTO: TFloatField
      FieldName = 'JURO_DESCONTO'
      DisplayFormat = '#,0.00'
    end
    object cdsBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO: TStringField
      FieldName = 'KFIN_PLANOCONTA_JURO_DESCONTO'
    end
    object cdsBaixaAReceberCHEQUE: TStringField
      DisplayLabel = 'Recebimento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsBaixaAReceberDESCRICAO_JURO_DESCONTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_JURO_DESCONTO'
      Size = 60
      Calculated = True
    end
    object cdsBaixaAReceberDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object cdsBaixaAReceberKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object cdsBaixaAReceberOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsBaixaAReceberNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      OnSetText = cdsBaixaAReceberNUM_CHEQUESetText
      Size = 32
    end
    object cdsBaixaARecebersqlApropriacaoJuroDesconto: TDataSetField
      FieldName = 'sqlApropriacaoJuroDesconto'
    end
    object cdsBaixaAReceber_tmpcalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = '_tmpcalc'
      Calculated = True
    end
  end
  object dspBaixaAReceber: TDataSetProvider
    DataSet = sqlBaixaAReceber
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspBaixaAReceberAfterUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlBaixaAReceber: TTcSQLDataSet
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
        DataType = ftFixedChar
        Name = 'DSP_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_CLIENTE'
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
      '    P.KFIN_ARECEBER_PARCELA,'
      '    P.KFIN_ARECEBER,'
      '    IIF ( P.PAGTO IS NULL, '#39'F'#39', '#39'T'#39' ) BAIXADO,'
      '    IIF ( P.PAGTO IS NULL, '#39'F'#39', '#39'T'#39' ) BAIXAR,'
      '    VND.KVND_PEDIDO,'
      
        '    COALESCE( VND.NOTA_FISCAL, P.DOCUMENTO, AP.DOCUMENTO ) DOCUM' +
        'ENTO,'
      
        '    COALESCE( VND.NOTA_FISCAL_, P.DOCUMENTO_, AP.DOCUMENTO_ ) DO' +
        'CUMENTO_,'
      '    AP.HISTORICO,'
      '    AP.KFIN_CONTA_PREF,'
      '    AP.TABLENAME,'
      '    AP.TABLEKEY,'
      '    AP.PROVISAO,'
      
        '    COALESCE (  VND.DATA_EMISSAO, IIF( AP.RECORRENCIA = '#39'T'#39', P.V' +
        'ENCTO, AP.DATALANCTO )  ) DATACOMPRA,'
      '    P.VENCTO,'
      '    AP.KCAD_ENTIDADE,'
      '    AP.NOMEENTIDADE,'
      '    (    ( SELECT COUNT(1)'
      '             FROM FIN_ARECEBER_PARCELAS P1'
      '            WHERE P1.KFIN_ARECEBER = P.KFIN_ARECEBER'
      '              AND P1.VENCTO <= P.VENCTO'
      '          ) || '#39'/'#39' ||'
      '         ( SELECT COUNT(1)'
      '             FROM FIN_ARECEBER_PARCELAS P1'
      '            WHERE P1.KFIN_ARECEBER = P.KFIN_ARECEBER'
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
      'FROM FIN_ARECEBER_PARCELAS P'
      'INNER JOIN FIN_ARECEBER AP ON AP.KFIN_ARECEBER = P.KFIN_ARECEBER'
      
        'LEFT JOIN VND_PEDIDOS VND ON AP.TABLENAME = '#39'VND_PEDIDOS'#39' AND VN' +
        'D.KVND_PEDIDO = AP.TABLEKEY'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      
        'WHERE  ( AP.KSYS$DOMAIN = :KSYS$DOMAIN ) AND (AP.TABLENAME IS DI' +
        'STINCT FROM '#39'FIN_TRANSFERENCIAS'#39')'
      '  AND ( AP.SYS$ORIGIN_TYPE<>2 )'
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
      '  AND (     ( :DSP_CLIENTE = '#39'F'#39' )'
      
        '          OR ( :DSP_CLIENTE = '#39'T'#39' AND AP.KCAD_ENTIDADE = :KCAD_E' +
        'NTIDADE )'
      '          )'
      'ORDER BY P.VENCTO')
    Left = 73
    Top = 100
    object sqlBaixaAReceberKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAReceberBAIXADO: TStringField
      FieldName = 'BAIXADO'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlBaixaAReceberBAIXAR: TStringField
      FieldName = 'BAIXAR'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlBaixaAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
    end
    object sqlBaixaAReceberKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlBaixaAReceberTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlBaixaAReceberTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object sqlBaixaAReceberPROVISAO: TStringField
      FieldName = 'PROVISAO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlBaixaAReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlBaixaAReceberDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Size = 33
    end
    object sqlBaixaAReceberHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlBaixaAReceberDATACOMPRA: TSQLTimeStampField
      DisplayLabel = 'Data da compra'
      FieldName = 'DATACOMPRA'
      ProviderFlags = [pfInWhere]
    end
    object sqlBaixaAReceberVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlBaixaAReceberKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAReceberNOMEENTIDADE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlBaixaAReceberPARCELAS: TStringField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      Size = 23
    end
    object sqlBaixaAReceberVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
    end
    object sqlBaixaAReceberKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAReceberCONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
    object sqlBaixaAReceberPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data recebimento'
      FieldName = 'PAGTO'
    end
    object sqlBaixaAReceberPAGO: TFloatField
      DisplayLabel = 'Valor recebido'
      FieldName = 'PAGO'
    end
    object sqlBaixaAReceberJURO_DESCONTO: TFloatField
      FieldName = 'JURO_DESCONTO'
    end
    object sqlBaixaAReceberKFIN_PLANOCONTA_JURO_DESCONTO: TStringField
      FieldName = 'KFIN_PLANOCONTA_JURO_DESCONTO'
    end
    object sqlBaixaAReceberCHEQUE: TStringField
      DisplayLabel = 'Recebimento com cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlBaixaAReceberDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
      Visible = False
    end
    object sqlBaixaAReceberKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object sqlBaixaAReceberOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlBaixaAReceberNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
  end
  object dtsBaixaAReceber: TDataSource
    DataSet = sqlBaixaAReceber
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
    DataSetField = cdsBaixaARecebersqlApropriacaoJuroDesconto
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
    DataSource = dtsBaixaAReceber
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
    DataSet = cdsBaixaAReceber
    OnDataChange = DataSource1DataChange
    Left = 136
    Top = 16
  end
end
