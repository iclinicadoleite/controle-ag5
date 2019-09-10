object FIN_FinanciamentosDatamodule: TFIN_FinanciamentosDatamodule
  OldCreateOrder = True
  Height = 319
  Width = 506
  object cdsLstFinanciamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LISTALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KFIN_FINANCIAMENTO_GERAL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LISTALL'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstFinanciamento'
    BeforeOpen = cdsLstFinanciamentoBeforeOpen
    OnNewRecord = cdsLstFinanciamentoNewRecord
    Left = 54
    Top = 44
    object cdsLstFinanciamentoKFIN_FINANCIAMENTO_GERAL: TStringField
      FieldName = 'KFIN_FINANCIAMENTO_GERAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstFinanciamentoDOCUMENTO: TStringField
      DisplayLabel = 'Contrato'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsLstFinanciamentoHISTORICO: TStringField
      DisplayLabel = 'Financiamento'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsLstFinanciamentoAPELIDO: TStringField
      FieldName = 'APELIDO'
      Visible = False
      Size = 128
    end
    object cdsLstFinanciamentoDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data do financiamento'
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsLstFinanciamentoVALOR: TFloatField
      DisplayLabel = 'Valor do financiamento'
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object cdsLstFinanciamentoATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsLstFinanciamentoVALOR_PAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'VALOR_PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsLstFinanciamentoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsLstFinanciamentoSYSUI: TStringField
      FieldName = 'SYS$UI'
      Visible = False
      Size = 32
    end
    object cdsLstFinanciamentoSYSDI: TSQLTimeStampField
      FieldName = 'SYS$DI'
      Visible = False
    end
    object cdsLstFinanciamentoSYSUU: TStringField
      FieldName = 'SYS$UU'
      Visible = False
      Size = 32
    end
    object cdsLstFinanciamentoSYSDU: TSQLTimeStampField
      FieldName = 'SYS$DU'
      Visible = False
    end
    object cdsLstFinanciamentoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
  end
  object cdsFinanciamento: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KFIN_FINANCIAMENTO_GERAL'
    MasterFields = 'KFIN_FINANCIAMENTO_GERAL'
    MasterSource = dtsList
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_FINANCIAMENTO_GERAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspFinanciamento'
    BeforeInsert = cdsFinanciamentoBeforeInsert
    BeforeEdit = cdsFinanciamentoBeforeEdit
    BeforePost = cdsFinanciamentoBeforePost
    BeforeDelete = cdsFinanciamentoBeforeDelete
    OnNewRecord = cdsFinanciamentoNewRecord
    BeforeApplyUpdates = cdsFinanciamentoBeforeApplyUpdates
    AfterApplyUpdates = cdsFinanciamentoAfterApplyUpdates
    Left = 183
    Top = 44
    object cdsFinanciamentoKFIN_FINANCIAMENTO_GERAL: TStringField
      FieldName = 'KFIN_FINANCIAMENTO_GERAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsFinanciamentoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsFinanciamentoKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      OnValidate = cdsFinanciamentoKCAD_ENTIDADEValidate
      FixedChar = True
    end
    object cdsFinanciamentoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      OnSetText = cdsFinanciamentoNOMEENTIDADESetText
      Size = 128
    end
    object cdsFinanciamentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsFinanciamentoAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 128
    end
    object cdsFinanciamentoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      OnValidate = cdsFinanciamentoDOCUMENTOValidate
      Size = 32
    end
    object cdsFinanciamentoDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsFinanciamentoANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFinanciamentoVALOR: TFloatField
      DisplayLabel = 'Valor Total Financiado'
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object cdsFinanciamentoNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object cdsFinanciamentoKFIN_APAGAR_JUROS: TStringField
      FieldName = 'KFIN_APAGAR_JUROS'
      FixedChar = True
    end
    object cdsFinanciamentoKFIN_APAGAR_DESPESAS: TStringField
      FieldName = 'KFIN_APAGAR_DESPESAS'
      FixedChar = True
    end
    object cdsFinanciamentoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFinanciamentoATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFinanciamentoIMPORTADO: TStringField
      FieldName = 'IMPORTADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFinanciamentoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
    object cdsFinanciamentosqlParcelas: TDataSetField
      FieldName = 'sqlParcelas'
    end
    object cdsFinanciamentoKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object cdsFinanciamentoKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      OnValidate = cdsFinanciamentoKFIN_PLANOCONTAValidate
      FixedChar = True
    end
    object cdsFinanciamentoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = [pfInWhere]
      OnSetText = cdsFinanciamentoNOMECONTASetText
      Size = 64
    end
    object cdsFinanciamentoDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      OnSetText = cdsFinanciamentoDESCR_PC_NOMESetText
      Size = 64
    end
    object cdsFinanciamentoDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      OnGetText = cdsFinanciamentoDESCR_PC_CLASSIFICACAOGetText
      Size = 32
    end
    object cdsFinanciamentoDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object cdsFinanciamentoDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsFinanciamentoDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object cdsFinanciamentoVALOR_PARCELAS: TFloatField
      DisplayLabel = 'Valor das parcelas'
      FieldName = 'VALOR_PARCELAS'
      DisplayFormat = '#,0.00'
    end
    object cdsFinanciamentoPROVISAO: TStringField
      FieldName = 'PROVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFinanciamentoPROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFinanciamentoKFIN_ARECEBER_FINANCIAMENTO: TStringField
      FieldName = 'KFIN_ARECEBER_FINANCIAMENTO'
      FixedChar = True
    end
    object cdsFinanciamentoKFIN_APAGAR_AMORTIZACAO: TStringField
      FieldName = 'KFIN_APAGAR_AMORTIZACAO'
      FixedChar = True
    end
    object cdsFinanciamentosqlApropriacaoFinanciamento: TDataSetField
      FieldName = 'sqlApropriacaoFinanciamento'
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstFinanciamento
    Left = 120
    Top = 8
  end
  object cdsParcelas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsFinanciamentosqlParcelas
    IndexFieldNames = 'VENCTO'
    Params = <>
    BeforeInsert = cdsParcelasBeforeInsert
    BeforePost = cdsParcelasBeforePost
    OnNewRecord = cdsParcelasNewRecord
    Left = 250
    Top = 45
    object cdsParcelasKFIN_FINANCIAMENTO_PARCELA: TStringField
      FieldName = 'KFIN_FINANCIAMENTO_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsParcelasKFIN_FINANCIAMENTO_GERAL: TStringField
      FieldName = 'KFIN_FINANCIAMENTO_GERAL'
      Required = True
      FixedChar = True
    end
    object cdsParcelasDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsParcelasVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
      OnValidate = cdsParcelasVENCTOValidate
    end
    object cdsParcelasVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      OnValidate = cdsParcelasVALORValidate
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
      ProviderFlags = []
    end
    object cdsParcelasPAGO: TFloatField
      FieldName = 'PAGO'
      ProviderFlags = []
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object cdsParcelasNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object cdsParcelasPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParcelasDUVIDOSO: TStringField
      FieldName = 'DUVIDOSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParcelasOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsParcelasCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParcelasDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
    end
    object cdsParcelasNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object cdsParcelasJUROS: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'JUROS'
      OnChange = cdsParcelasJUROSChange
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasAMORTIZACAO: TFloatField
      DisplayLabel = 'Amortiza'#231#227'o'
      FieldName = 'AMORTIZACAO'
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      FixedChar = True
    end
    object cdsParcelasTOTAL: TAggregateField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VALOR)'
    end
    object cdsParcelasTOTAL_AMORTIZACAO: TAggregateField
      DisplayLabel = 'Total Amortiza'#231#227'o'
      FieldName = 'TOTAL_AMORTIZACAO'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(AMORTIZACAO)'
    end
    object cdsParcelasTOTAL_JUROS: TAggregateField
      DisplayLabel = 'Total Juros'
      FieldName = 'TOTAL_JUROS'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(JUROS)'
    end
    object cdsParcelasTOTAL_PAGO: TAggregateField
      DisplayLabel = 'Total Pago'
      FieldName = 'TOTAL_PAGO'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(PAGO)'
    end
  end
  object dspLstFinanciamento: TDataSetProvider
    DataSet = sqlLstFinanciamento
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 33
    Top = 91
  end
  object dspFinanciamento: TDataSetProvider
    DataSet = sqlFinanciamento
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspFinanciamentoAfterUpdateRecord
    BeforeUpdateRecord = dspFinanciamentoBeforeUpdateRecord
    Left = 145
    Top = 91
  end
  object sqlLstFinanciamento: TTcSQLDataSet
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
        DataType = ftFixedChar
        Name = 'LISTALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KFIN_FINANCIAMENTO_GERAL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LISTALL'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT DISTINCT'
      '  F.KFIN_FINANCIAMENTO_GERAL,'
      '  F.KSYS$DOMAIN,'
      '  F.DOCUMENTO,'
      '  F.HISTORICO,'
      '  F.APELIDO,'
      '  F.DATALANCTO,'
      '  F.VALOR,'
      '  F.ATIVO,'
      '  CAST( (SELECT SUM(PG.PAGO)'
      '           FROM FIN_APAGAR_PARCELAS PG'
      
        '          INNER JOIN FIN_APAGAR_PARCELAS P ON P.KFIN_APAGAR_PARC' +
        'ELA = PG.KFIN_APAGAR_PARCELA'
      
        '                                       AND P.KFIN_APAGAR = F.KFI' +
        'N_APAGAR_DESPESAS  ) AS SYS$FLOAT) "VALOR_PAGO",'
      '  F.OBS, '
      '  F.SYS$UI,'
      '  F.SYS$DI,'
      '  F.SYS$UU,'
      '  F.SYS$DU'
      'FROM FIN_FINANCIAMENTOS_GERAL F'
      'WHERE F.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND (    (:LISTALL = '#39'F'#39' '
      
        '                 AND F.KFIN_FINANCIAMENTO_GERAL = :KFIN_FINANCIA' +
        'MENTO_GERAL'
      '                )'
      '          OR ( :LISTALL = '#39'T'#39
      '                 AND F.ATIVO = '#39'T'#39
      '              )'
      '           )')
    Left = 60
    Top = 135
    object sqlLstFinanciamentoKFIN_FINANCIAMENTO_GERAL: TStringField
      FieldName = 'KFIN_FINANCIAMENTO_GERAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlLstFinanciamentoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlLstFinanciamentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlLstFinanciamentoAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 128
    end
    object sqlLstFinanciamentoDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlLstFinanciamentoVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = []
    end
    object sqlLstFinanciamentoATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlLstFinanciamentoVALOR_PAGO: TFloatField
      FieldName = 'VALOR_PAGO'
    end
    object sqlLstFinanciamentoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlLstFinanciamentoSYSUI: TStringField
      FieldName = 'SYS$UI'
      Size = 32
    end
    object sqlLstFinanciamentoSYSDI: TSQLTimeStampField
      FieldName = 'SYS$DI'
    end
    object sqlLstFinanciamentoSYSUU: TStringField
      FieldName = 'SYS$UU'
      Size = 32
    end
    object sqlLstFinanciamentoSYSDU: TSQLTimeStampField
      FieldName = 'SYS$DU'
    end
    object sqlLstFinanciamentoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
  end
  object sqlFinanciamento: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_FINANCIAMENTO_GERAL'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '     F.KFIN_FINANCIAMENTO_GERAL,'
      '     F.KSYS$DOMAIN,    '
      '     F.KCAD_ENTIDADE,'
      '     F.NOMEENTIDADE,'
      '     F.HISTORICO,'
      '     F.APELIDO,            '
      '     F.DOCUMENTO,'
      '     F.DATALANCTO,    '
      '     F.VALOR,           '
      '    F.PROVISAO,    '
      '    F.VALOR_PARCELAS,'
      '    F.PROXIMO_MES,'
      '    F.ANUAL,'
      '     F.NUM_PARCELAS,'
      '    F.DIA_VENCTO,'
      '     F.KFIN_ARECEBER_FINANCIAMENTO,'
      '     F.KFIN_APAGAR_AMORTIZACAO,'
      '     F.KFIN_APAGAR_JUROS,'
      '     F.KFIN_APAGAR_DESPESAS,'
      '     F.KFIN_CONTA_PREF,'
      '     C.NOME NOMECONTA,'
      '     F.KFIN_PLANOCONTA,'
      '     PL.NOME DESCR_PC_NOME,'
      '    PL.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '    PL.CODIGO DESCR_PC_CODIGO,'
      '    PL.TIPO_APRD DESCR_PC_TIPO_APRD,'
      '     F.OBS,                '
      '     F.ATIVO,               '
      '     F.IMPORTADO,'
      '     F.SYS$ORIGIN_TYPE'
      'FROM FIN_FINANCIAMENTOS_GERAL F'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = F.KFIN_CONTA_PREF'
      
        'LEFT JOIN FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = F.KFIN_PLAN' +
        'OCONTA'
      'WHERE F.KFIN_FINANCIAMENTO_GERAL = :KFIN_FINANCIAMENTO_GERAL')
    Left = 184
    Top = 138
    object sqlFinanciamentoKFIN_FINANCIAMENTO_GERAL: TStringField
      FieldName = 'KFIN_FINANCIAMENTO_GERAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlFinanciamentoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlFinanciamentoKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object sqlFinanciamentoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlFinanciamentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlFinanciamentoAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 128
    end
    object sqlFinanciamentoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlFinanciamentoDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlFinanciamentoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sqlFinanciamentoNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object sqlFinanciamentoKFIN_APAGAR_JUROS: TStringField
      FieldName = 'KFIN_APAGAR_JUROS'
      FixedChar = True
    end
    object sqlFinanciamentoKFIN_APAGAR_DESPESAS: TStringField
      FieldName = 'KFIN_APAGAR_DESPESAS'
      FixedChar = True
    end
    object sqlFinanciamentoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlFinanciamentoATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFinanciamentoIMPORTADO: TStringField
      FieldName = 'IMPORTADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFinanciamentoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
    object sqlFinanciamentoKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object sqlFinanciamentoKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlFinanciamentoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlFinanciamentoDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlFinanciamentoDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlFinanciamentoDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object sqlFinanciamentoDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object sqlFinanciamentoDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object sqlFinanciamentoVALOR_PARCELAS: TFloatField
      FieldName = 'VALOR_PARCELAS'
    end
    object sqlFinanciamentoPROVISAO: TStringField
      FieldName = 'PROVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFinanciamentoANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFinanciamentoPROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFinanciamentoKFIN_ARECEBER_FINANCIAMENTO: TStringField
      FieldName = 'KFIN_ARECEBER_FINANCIAMENTO'
      FixedChar = True
    end
    object sqlFinanciamentoKFIN_APAGAR_AMORTIZACAO: TStringField
      FieldName = 'KFIN_APAGAR_AMORTIZACAO'
      FixedChar = True
    end
  end
  object sqlParcelas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_FINANCIAMENTO_GERAL'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT  '
      '  FP.KFIN_FINANCIAMENTO_PARCELA ,'
      '  FP.KFIN_FINANCIAMENTO_GERAL,'
      '  FP.DOCUMENTO,'
      '  FP.VENCTO,'
      '  FP.VALOR,'
      '  FP.JUROS,'
      '  FP.AMORTIZACAO,'
      '  AP.PAGTO,'
      '  AP.PAGO,'
      '  FP.KFIN_CONTA,'
      '  C.NOME NOMECONTA,'
      '  FP.PREVISAO,'
      '  FP.DUVIDOSO,'
      '  FP.OBS,'
      '  FP.CHEQUE,'
      '  FP.DT_COMPENSACAO,'
      '  FP.NUM_CHEQUE,'
      '  FP.KFIN_APAGAR_PARCELA'
      'FROM FIN_FINANCIAMENTOS_PARCELAS FP'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = FP.KFIN_CONTA'
      
        'LEFT JOIN FIN_APAGAR_PARCELAS AP ON AP.KFIN_APAGAR_PARCELA = FP.' +
        'KFIN_APAGAR_PARCELA'
      'WHERE FP.KFIN_FINANCIAMENTO_GERAL = :KFIN_FINANCIAMENTO_GERAL')
    Left = 254
    Top = 134
    object sqlParcelasKFIN_FINANCIAMENTO_PARCELA: TStringField
      FieldName = 'KFIN_FINANCIAMENTO_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlParcelasKFIN_FINANCIAMENTO_GERAL: TStringField
      FieldName = 'KFIN_FINANCIAMENTO_GERAL'
      Required = True
      FixedChar = True
    end
    object sqlParcelasDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlParcelasVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlParcelasVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlParcelasPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
      ProviderFlags = []
    end
    object sqlParcelasPAGO: TFloatField
      FieldName = 'PAGO'
      ProviderFlags = []
    end
    object sqlParcelasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object sqlParcelasNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlParcelasPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasDUVIDOSO: TStringField
      FieldName = 'DUVIDOSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlParcelasCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParcelasDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
    end
    object sqlParcelasNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object sqlParcelasJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object sqlParcelasAMORTIZACAO: TFloatField
      FieldName = 'AMORTIZACAO'
    end
    object sqlParcelasKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      FixedChar = True
    end
  end
  object dtsSQLEdit: TDataSource
    DataSet = sqlFinanciamento
    Left = 221
    Top = 181
  end
  object cdsApropriacaoFinanciamento: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsFinanciamentosqlApropriacaoFinanciamento
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    OnNewRecord = cdsApropriacaoFinanciamentoNewRecord
    Left = 344
    Top = 44
    object cdsApropriacaoFinanciamentoKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsApropriacaoFinanciamentoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object cdsApropriacaoFinanciamentoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsApropriacaoFinanciamentoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cdsApropriacaoFinanciamentoCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object cdsApropriacaoFinanciamentoPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object cdsApropriacaoFinanciamentoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsApropriacaoFinanciamentoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsApropriacaoFinanciamentoTOTAL_PORCENTAGEM: TAggregateField
      DisplayLabel = 'Total porcentagem'
      FieldName = 'TOTAL_PORCENTAGEM'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PORCENTAGEM)'
    end
  end
  object sqlApropriacaoFinanciamento: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR_DESPESAS'
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
      'WHERE A.TABLENAME = '#39'FIN_APAGAR'#39
      '     AND A.TABLEKEY = :KFIN_APAGAR_DESPESAS')
    Left = 346
    Top = 139
    object sqlApropriacaoFinanciamentoKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApropriacaoFinanciamentoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object sqlApropriacaoFinanciamentoPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoFinanciamentoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlApropriacaoFinanciamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object sqlApropriacaoFinanciamentoCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlApropriacaoFinanciamentoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApropriacaoFinanciamentoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
  end
end
