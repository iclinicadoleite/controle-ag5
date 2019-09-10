object FIN_OutrasDespesasDatamodule: TFIN_OutrasDespesasDatamodule
  OldCreateOrder = True
  Height = 319
  Width = 506
  object cdsLstAPagar: TClientDataSet
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
        Name = 'KFIN_APAGAR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LISTALL'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
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
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstApagar'
    BeforeOpen = cdsLstAPagarBeforeOpen
    OnNewRecord = cdsLstAPagarNewRecord
    Left = 55
    Top = 44
    object cdsLstAPagarKSYSDOMAIN: TStringField
      DisplayWidth = 10
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstAPagarKFIN_APAGAR: TStringField
      DisplayWidth = 10
      FieldName = 'KFIN_APAGAR'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstAPagarDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsLstAPagarDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Visible = False
      Size = 33
    end
    object cdsLstAPagarHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 71
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsLstAPagarDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data compra'
      DisplayWidth = 19
      FieldName = 'DATALANCTO'
    end
    object cdsLstAPagarNOMECONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      DisplayWidth = 35
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object cdsLstAPagarPROVISAO: TStringField
      DisplayLabel = 'Provis'#227'o'
      DisplayWidth = 7
      FieldName = 'PROVISAO'
      Required = True
      OnGetText = cdsLstAPagarPROVISAOGetText
      FixedChar = True
      Size = 1
    end
    object cdsLstAPagarVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 6
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object cdsLstAPagarOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      DisplayWidth = 9
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsLstAPagarATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object cdsAPagar: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KFIN_APAGAR'
    MasterFields = 'KFIN_APAGAR'
    MasterSource = dtsList
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR'
        ParamType = ptInput
      end>
    ProviderName = 'dspApagar'
    BeforeInsert = cdsAPagarBeforeInsert
    BeforePost = cdsAPagarBeforePost
    BeforeDelete = cdsAPagarBeforeDelete
    OnNewRecord = cdsAPagarNewRecord
    BeforeApplyUpdates = cdsAPagarBeforeApplyUpdates
    AfterApplyUpdates = cdsAPagarAfterApplyUpdates
    Left = 183
    Top = 44
    object cdsAPagarKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsAPagarKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsAPagarTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsAPagarTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsAPagarKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      OnValidate = cdsAPagarKCAD_ENTIDADEValidate
      FixedChar = True
    end
    object cdsAPagarNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      OnSetText = cdsAPagarNOMEENTIDADESetText
      Size = 128
    end
    object cdsAPagarHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Required = True
      Size = 128
    end
    object cdsAPagarDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      OnValidate = cdsAPagarDOCUMENTOValidate
      Size = 32
    end
    object cdsAPagarDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data lan'#231'amento'
      FieldName = 'DATALANCTO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsAPagarVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object cdsAPagarPROVISAO: TStringField
      DisplayLabel = 'Provis'#227'o'
      FieldName = 'PROVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarRECORRENCIA: TStringField
      DisplayLabel = 'Recorr'#234'ncia'
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarNUM_PARCELAS: TIntegerField
      DisplayLabel = 'N'#250'mero parcelas'
      FieldName = 'NUM_PARCELAS'
      Required = True
      DisplayFormat = '00'
    end
    object cdsAPagarDIA_VENCTO: TIntegerField
      DisplayLabel = 'Dia vencimento'
      FieldName = 'DIA_VENCTO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsAPagarPROXIMO_MES: TStringField
      DisplayLabel = 'Pr'#243'ximo m'#234's ?'
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarKFIN_CONTA_PREF: TStringField
      DisplayLabel = 'Conta prefer'#234'ncial'
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object cdsAPagarNOMECONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOMECONTA'
      ProviderFlags = [pfInWhere]
      OnSetText = cdsAPagarNOMECONTASetText
      Size = 64
    end
    object cdsAPagarKFIN_PLANOCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object cdsAPagarDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      OnSetText = cdsAPagarDESCR_PC_NOMESetText
      Size = 64
    end
    object cdsAPagarDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      OnGetText = cdsAPagarDESCR_PC_CLASSIFICACAOGetText
      Size = 32
    end
    object cdsAPagarDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object cdsAPagarDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsAPagarOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsAPagarATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAPagarPAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      OnChange = cdsAPagarPAGTO_AVISTAChange
      FixedChar = True
      Size = 1
    end
    object cdsAPagarsqlParcelas: TDataSetField
      DisplayLabel = 'Parcelas'
      FieldName = 'sqlParcelas'
    end
    object cdsAPagarsqlApropriacaoAPagar: TDataSetField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'sqlApropriacaoAPagar'
    end
    object cdsAPagarSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstAPagar
    Left = 120
    Top = 8
  end
  object cdsParcelas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsAPagarsqlParcelas
    IndexFieldNames = 'VENCTO'
    Params = <>
    BeforeInsert = cdsParcelasBeforeInsert
    BeforePost = cdsParcelasBeforePost
    OnNewRecord = cdsParcelasNewRecord
    Left = 250
    Top = 45
    object cdsParcelasKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsParcelasKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object cdsParcelasDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsParcelasVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
      OnValidate = cdsParcelasVENCTOValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsParcelasVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      OnValidate = cdsParcelasVALORValidate
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsParcelasPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasKFIN_CONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object cdsParcelasNOMECONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOMECONTA'
      ProviderFlags = [pfInWhere]
      OnSetText = cdsParcelasNOMECONTASetText
      Size = 64
    end
    object cdsParcelasPREVISAO: TStringField
      DisplayLabel = 'provis'#227'o'
      FieldName = 'PREVISAO'
      Required = True
      Visible = False
      OnGetText = cdsParcelasPREVISAOGetText
      FixedChar = True
      Size = 1
    end
    object cdsParcelasDUVIDOSO: TStringField
      DisplayLabel = 'Duvidoso'
      FieldName = 'DUVIDOSO'
      Required = True
      Visible = False
      OnGetText = cdsParcelasDUVIDOSOGetText
      FixedChar = True
      Size = 1
    end
    object cdsParcelasOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsParcelasCHEQUE: TStringField
      DisplayLabel = 'Pagamento em cheque'
      FieldName = 'CHEQUE'
      OnChange = cdsParcelasCHEQUEChange
      FixedChar = True
      Size = 1
    end
    object cdsParcelasDT_COMPENSACAO: TSQLTimeStampField
      DisplayLabel = 'Data compensa'#231#227'o'
      FieldName = 'DT_COMPENSACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsParcelasNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object cdsParcelasTOTAL: TAggregateField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VALOR)'
    end
  end
  object dspLstApagar: TDataSetProvider
    DataSet = sqlLstApagar
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 33
    Top = 91
  end
  object dspApagar: TDataSetProvider
    DataSet = sqlApagar
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 145
    Top = 91
  end
  object sqlLstApagar: TTcSQLDataSet
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
        Name = 'KFIN_APAGAR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'LISTALL'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
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
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT DISTINCT'
      '  A.KSYS$DOMAIN,'
      '  A.KFIN_APAGAR,'
      '  A.DOCUMENTO,'
      '  A.DOCUMENTO_,'
      '  A.HISTORICO,'
      '  A.DATALANCTO,'
      '  PC.NOME NOMECONTA,'
      '  A.PROVISAO,'
      '  A.VALOR,'
      '  A.OBS,'
      '  A.ATIVO'
      'FROM FIN_APAGAR A'
      
        'LEFT JOIN FIN_PLANOCONTAS PC ON PC.KFIN_PLANOCONTA = A.KFIN_PLAN' +
        'OCONTA'
      'WHERE A.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND (    (:LISTALL = '#39'F'#39' '
      '                 AND A.KFIN_APAGAR = :KFIN_APAGAR '
      '                )'
      '          OR ( :LISTALL = '#39'T'#39
      '                 AND A.DATALANCTO BETWEEN :DI AND :DF'
      '                 AND A.RECORRENCIA = '#39'F'#39
      '                 AND A.ATIVO = '#39'T'#39
      '                AND A.TABLENAME IS NULL'
      '              )'
      '           )'
      'UNION ALL'
      'SELECT DISTINCT'
      '  A.KSYS$DOMAIN,'
      '  A.KFIN_APAGAR,'
      ' COALESCE( P.DOCUMENTO, A.DOCUMENTO ) DOCUMENTO,'
      ' COALESCE( P.DOCUMENTO_, A.DOCUMENTO_ ) DOCUMENTO_,'
      '  A.HISTORICO,'
      '  P.VENCTO DATALANCTO,'
      '  PC.NOME NOMECONTA,'
      '  A.PROVISAO,'
      '  P.VALOR VALOR,'
      '  A.OBS,'
      '  A.ATIVO'
      'FROM FIN_APAGAR_PARCELAS P'
      'LEFT JOIN FIN_APAGAR A ON A.KFIN_APAGAR = P.KFIN_APAGAR'
      
        'LEFT JOIN FIN_PLANOCONTAS PC ON PC.KFIN_PLANOCONTA = A.KFIN_PLAN' +
        'OCONTA'
      'WHERE'
      '      A.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND  :LISTALL = '#39'T'#39' '
      '  AND A.RECORRENCIA = '#39'T'#39
      '  AND A.ATIVO = '#39'T'#39
      '  AND A.TABLENAME IS NULL'
      '  AND P.VENCTO BETWEEN :DI AND :DF'
      'ORDER BY 6')
    Left = 60
    Top = 135
    object sqlLstApagarKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstApagarKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstApagarDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlLstApagarDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Size = 33
    end
    object sqlLstApagarHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlLstApagarDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data compra'
      FieldName = 'DATALANCTO'
    end
    object sqlLstApagarNOMECONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object sqlLstApagarPROVISAO: TStringField
      DisplayLabel = 'Provis'#227'o'
      FieldName = 'PROVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlLstApagarVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object sqlLstApagarOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlLstApagarATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object sqlApagar: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select  '
      '  P.KFIN_APAGAR, '
      '  P.KSYS$DOMAIN,'
      '  P.TABLENAME, '
      '  P.TABLEKEY, '
      '  P.KCAD_ENTIDADE, '
      '  P.ATIVO,'
      '  P.NOMEENTIDADE, '
      '  P.HISTORICO, '
      '  P.DOCUMENTO, '
      '  P.DATALANCTO, '
      '  P.VALOR,  '
      '  P.PROVISAO,'
      '  P.RECORRENCIA,'
      '  P.NUM_PARCELAS,'
      '  P.DIA_VENCTO,'
      '  P.PROXIMO_MES,'
      '  P.ANUAL,'
      '  P.KFIN_CONTA_PREF, '
      '  P.KFIN_PLANOCONTA, '
      '  PL.NOME DESCR_PC_NOME,'
      '  PL.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  PL.CODIGO DESCR_PC_CODIGO,'
      '  PL.TIPO_APRD DESCR_PC_TIPO_APRD,'
      '  C.NOME NOMECONTA,'
      '  P.OBS,'
      '  P.PAGTO_AVISTA,'
      '  P.SYS$ORIGIN_TYPE'
      'from FIN_APAGAR P'
      
        'LEFT JOIN FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = P.KFIN_PLAN' +
        'OCONTA'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA_PREF'
      'WHERE P.KFIN_APAGAR = :KFIN_APAGAR')
    Left = 180
    Top = 134
    object sqlApagarKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApagarKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlApagarTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApagarKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object sqlApagarTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object sqlApagarNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlApagarANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlApagarDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlApagarDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data lan'#231'amento'
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlApagarVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object sqlApagarPROVISAO: TStringField
      DisplayLabel = 'Provis'#227'o'
      FieldName = 'PROVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarRECORRENCIA: TStringField
      DisplayLabel = 'Recorr'#234'ncia'
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarNUM_PARCELAS: TIntegerField
      DisplayLabel = 'N'#250'mero parcelas'
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object sqlApagarDIA_VENCTO: TIntegerField
      DisplayLabel = 'Dia vencimento'
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object sqlApagarPROXIMO_MES: TStringField
      DisplayLabel = 'Pr'#243'ximo m'#234's ?'
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarKFIN_CONTA_PREF: TStringField
      DisplayLabel = 'Conta prefer'#234'ncial'
      FieldName = 'KFIN_CONTA_PREF'
      FixedChar = True
    end
    object sqlApagarNOMECONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOMECONTA'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlApagarKFIN_PLANOCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlApagarDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlApagarDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlApagarDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object sqlApagarDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object sqlApagarOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlApagarATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlApagarPAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      FixedChar = True
      Size = 1
    end
    object sqlApagarSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
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
        Name = 'KFIN_APAGAR'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select  '
      '  P.KFIN_APAGAR_PARCELA, '
      '  P.KFIN_APAGAR, '
      '  P.DOCUMENTO, '
      '  P.VENCTO, '
      '  P.VALOR, '
      '  P.PAGTO, '
      '  P.PAGO, '
      '  P.KFIN_CONTA,'
      '  C.NOME NOMECONTA,'
      '  P.PREVISAO, '
      '  P.DUVIDOSO, '
      '  P.OBS, '
      '  P.CHEQUE, '
      '  P.DT_COMPENSACAO,'
      '  P.NUM_CHEQUE'
      'from FIN_APAGAR_PARCELAS P'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      'WHERE   P.KFIN_APAGAR = :KFIN_APAGAR')
    Left = 254
    Top = 134
    object sqlParcelasKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlParcelasKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object sqlParcelasDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlParcelasVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlParcelasVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
    end
    object sqlParcelasPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
    end
    object sqlParcelasPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
    end
    object sqlParcelasKFIN_CONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object sqlParcelasNOMECONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOMECONTA'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlParcelasPREVISAO: TStringField
      DisplayLabel = 'provis'#227'o'
      FieldName = 'PREVISAO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlParcelasDUVIDOSO: TStringField
      DisplayLabel = 'Duvidoso'
      FieldName = 'DUVIDOSO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlParcelasOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlParcelasCHEQUE: TStringField
      DisplayLabel = 'Pagamento em cheque'
      FieldName = 'CHEQUE'
      FixedChar = True
      Size = 1
    end
    object sqlParcelasDT_COMPENSACAO: TSQLTimeStampField
      DisplayLabel = 'Data compensa'#231#227'o'
      FieldName = 'DT_COMPENSACAO'
    end
    object sqlParcelasNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
  end
  object dtsSQLEdit: TDataSource
    DataSet = sqlApagar
    Left = 221
    Top = 181
  end
  object cdsApropriacaoAPagar: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsAPagarsqlApropriacaoAPagar
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    OnNewRecord = cdsApropriacaoAPagarNewRecord
    Left = 344
    Top = 44
    object cdsApropriacaoAPagarKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsApropriacaoAPagarKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object cdsApropriacaoAPagarNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsApropriacaoAPagarCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cdsApropriacaoAPagarCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object cdsApropriacaoAPagarPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object cdsApropriacaoAPagarTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsApropriacaoAPagarTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsApropriacaoAPagarTOTAL_PORCENTAGEM: TAggregateField
      DisplayLabel = 'Total porcentagem'
      FieldName = 'TOTAL_PORCENTAGEM'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PORCENTAGEM)'
    end
  end
  object sqlApropriacaoAPagar: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR'
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
      'WHERE A.TABLENAME = '#39'FIN_APAGAR'#39' '
      '     AND A.TABLEKEY = :KFIN_APAGAR')
    Left = 342
    Top = 135
    object sqlApropriacaoAPagarKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApropriacaoAPagarKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object sqlApropriacaoAPagarPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoAPagarNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlApropriacaoAPagarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object sqlApropriacaoAPagarCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlApropriacaoAPagarTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApropriacaoAPagarTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
  end
end
