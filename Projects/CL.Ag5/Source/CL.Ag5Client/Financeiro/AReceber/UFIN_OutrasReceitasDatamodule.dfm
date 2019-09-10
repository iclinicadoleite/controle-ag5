object FIN_OutrasReceitasDatamodule: TFIN_OutrasReceitasDatamodule
  OldCreateOrder = True
  Height = 292
  Width = 509
  object cdsLstAReceber: TClientDataSet
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
        Name = 'KFIN_ARECEBER'
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
    ProviderName = 'dspLstAReceber'
    BeforeOpen = cdsLstAReceberBeforeOpen
    OnNewRecord = cdsLstAReceberNewRecord
    Left = 100
    Top = 50
    object cdsLstAReceberKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstAReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsLstAReceberDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Visible = False
      Size = 33
    end
    object cdsLstAReceberHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsLstAReceberDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data venda'
      FieldName = 'DATALANCTO'
    end
    object cdsLstAReceberNOMECONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object cdsLstAReceberVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object cdsLstAReceberPROVISAO: TStringField
      DisplayLabel = 'Provis'#227'o'
      FieldName = 'PROVISAO'
      Required = True
      OnGetText = cdsLstAReceberPROVISAOGetText
      FixedChar = True
      Size = 1
    end
    object cdsLstAReceberATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsLstAReceberOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsAReceber: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KFIN_ARECEBER'
    MasterFields = 'KFIN_ARECEBER'
    MasterSource = dtsList
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_ARECEBER'
        ParamType = ptInput
      end>
    ProviderName = 'dspAReceber'
    BeforeInsert = cdsAReceberBeforeInsert
    BeforePost = cdsAReceberBeforePost
    BeforeDelete = cdsAReceberBeforeDelete
    OnNewRecord = cdsAReceberNewRecord
    BeforeApplyUpdates = cdsAReceberBeforeApplyUpdates
    AfterApplyUpdates = cdsAReceberAfterApplyUpdates
    Left = 213
    Top = 50
    object cdsAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAReceberKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsAReceberTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsAReceberTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
    end
    object cdsAReceberKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
    end
    object cdsAReceberNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      OnSetText = cdsAReceberNOMEENTIDADESetText
      Size = 128
    end
    object cdsAReceberHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Required = True
      Size = 128
    end
    object cdsAReceberDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      OnValidate = cdsAReceberDOCUMENTOValidate
      Size = 32
    end
    object cdsAReceberDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data la'#231'amento'
      FieldName = 'DATALANCTO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsAReceberANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object cdsAReceberPROVISAO: TStringField
      DisplayLabel = 'Provis'#227'o'
      FieldName = 'PROVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberRECORRENCIA: TStringField
      DisplayLabel = 'Recorr'#234'ncia'
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object cdsAReceberDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object cdsAReceberPROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
    end
    object cdsAReceberNOMECONTA: TStringField
      DisplayLabel = 'Nome conta'
      FieldName = 'NOMECONTA'
      ProviderFlags = [pfInWhere]
      OnSetText = cdsAReceberNOMECONTASetText
      Size = 64
    end
    object cdsAReceberKFIN_PLANOCONTA: TStringField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'KFIN_PLANOCONTA'
    end
    object cdsAReceberDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      OnSetText = cdsAReceberDESCR_PC_NOMESetText
      Size = 64
    end
    object cdsAReceberDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      OnGetText = cdsAReceberDESCR_PC_CLASSIFICACAOGetText
      Size = 32
    end
    object cdsAReceberDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object cdsAReceberDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsAReceberOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsAReceberATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsARecebersqlParcelas: TDataSetField
      DisplayLabel = 'Parcelas'
      FieldName = 'sqlParcelas'
    end
    object cdsAReceberStatusCadastro: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusCadastro'
      Size = 1
      Calculated = True
    end
    object cdsARecebersqlApropriacaoAReceber: TDataSetField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'sqlApropriacaoAReceber'
    end
    object cdsAReceberPAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      OnChange = cdsAReceberPAGTO_AVISTAChange
      FixedChar = True
      Size = 1
    end
    object cdsAReceberSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstAReceber
    Left = 148
    Top = 8
  end
  object cdsParcelas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsARecebersqlParcelas
    Params = <>
    BeforeInsert = cdsParcelasBeforeInsert
    BeforePost = cdsParcelasBeforePost
    OnNewRecord = cdsParcelasNewRecord
    Left = 410
    Top = 51
    object cdsParcelasKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsParcelasKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
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
    object cdsParcelasOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsParcelasKFIN_CONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'KFIN_CONTA'
      Visible = False
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
    object cdsParcelasCHEQUE: TStringField
      DisplayLabel = 'Pagamento em cheque'
      FieldName = 'CHEQUE'
      Visible = False
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
      Alignment = taRightJustify
      FieldName = 'TOTAL'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VALOR)'
    end
  end
  object dspLstAReceber: TDataSetProvider
    DataSet = sqlLstAReceber
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 62
    Top = 97
  end
  object dspAReceber: TDataSetProvider
    DataSet = sqlAReceber
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 179
    Top = 96
  end
  object sqlLstAReceber: TTcSQLDataSet
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
        Name = 'KFIN_ARECEBER'
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
      '  R.KSYS$DOMAIN,'
      '  R.KFIN_ARECEBER,'
      '  R.DOCUMENTO,'
      '  R.DOCUMENTO_,'
      '  R.HISTORICO,'
      '  R.DATALANCTO,'
      '  PC.NOME NOMECONTA,'
      '  R.PROVISAO,'
      '  R.VALOR,'
      '  R.OBS,'
      '  R.ATIVO'
      'FROM FIN_ARECEBER R'
      
        'LEFT JOIN FIN_PLANOCONTAS PC ON PC.KFIN_PLANOCONTA = R.KFIN_PLAN' +
        'OCONTA'
      'WHERE R.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND (     (   :LISTALL = '#39'F'#39' '
      '                     AND R.KFIN_ARECEBER = :KFIN_ARECEBER'
      '                )'
      '         OR ( :LISTALL = '#39'T'#39' '
      '                 AND R.DATALANCTO BETWEEN :DI AND :DF'
      '                 AND R.RECORRENCIA = '#39'F'#39
      '                 AND R.ATIVO = '#39'T'#39
      '                 AND R.TABLENAME IS NULL '
      '                )'
      '       )'
      'UNION ALL'
      'SELECT DISTINCT'
      '  R.KSYS$DOMAIN,'
      '  R.KFIN_ARECEBER,'
      '  COALESCE( P.DOCUMENTO, R.DOCUMENTO ) DOCUMENTO,'
      '  COALESCE( P.DOCUMENTO_, R.DOCUMENTO_ ) DOCUMENTO_,'
      '  R.HISTORICO,'
      '  P.VENCTO DATALANCTO,'
      '  PC.NOME NOMECONTA,'
      '  R.PROVISAO,'
      '  P.VALOR VALOR,'
      '  R.OBS,'
      '  R.ATIVO'
      'FROM FIN_ARECEBER_PARCELAS P'
      'LEFT JOIN FIN_ARECEBER R ON R.KFIN_ARECEBER = P.KFIN_ARECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS PC ON PC.KFIN_PLANOCONTA = R.KFIN_PLAN' +
        'OCONTA'
      'WHERE'
      '      R.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND :LISTALL = '#39'T'#39' '
      '  AND R.RECORRENCIA = '#39'T'#39
      '  AND R.ATIVO = '#39'T'#39
      '  AND R.TABLENAME IS NULL'
      '  AND P.VENCTO BETWEEN :DI AND :DF'
      'ORDER BY 6')
    Left = 100
    Top = 141
    object sqlLstAReceberKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstAReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlLstAReceberDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Size = 33
    end
    object sqlLstAReceberHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlLstAReceberDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data venda'
      FieldName = 'DATALANCTO'
    end
    object sqlLstAReceberNOMECONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object sqlLstAReceberVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object sqlLstAReceberPROVISAO: TStringField
      DisplayLabel = 'Provis'#227'o'
      FieldName = 'PROVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlLstAReceberATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlLstAReceberOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlAReceber: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftUnknown
        Name = 'KFIN_ARECEBER'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  P.KFIN_ARECEBER,'
      '  P.KSYS$DOMAIN,'
      '  P.TABLENAME,'
      '  P.KCAD_ENTIDADE,'
      '  P.TABLEKEY,'
      '  P.ATIVO,'
      '  P.NOMEENTIDADE,'
      '  P.HISTORICO,'
      '  P.DOCUMENTO,'
      '  P.DATALANCTO,'
      '  P.VALOR,'
      '  P.PROVISAO,'
      '  P.RECORRENCIA,'
      '  P.NUM_PARCELAS,'
      '  P.DIA_VENCTO,'
      '  P.PROXIMO_MES,'
      '  P.ANUAL,'
      '  P.KFIN_CONTA_PREF,'
      '  P.KFIN_PLANOCONTA,'
      '  PL.NOME DESCR_PC_NOME,'
      '  PL.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  PL.CODIGO DESCR_PC_CODIGO,'
      '  PL.TIPO_APRD DESCR_PC_TIPO_APRD,'
      '  C.NOME NOMECONTA,'
      '  CAST(P.OBS AS BLOB) OBS,'
      '  P.PAGTO_AVISTA,'
      '  P.SYS$ORIGIN_TYPE'
      'FROM FIN_ARECEBER P'
      
        'LEFT JOIN FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = P.KFIN_PLAN' +
        'OCONTA'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA_PREF'
      'WHERE P.KFIN_ARECEBER = :KFIN_ARECEBER')
    Left = 213
    Top = 141
    object sqlAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlAReceberKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlAReceberTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlAReceberTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
    end
    object sqlAReceberKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
    end
    object sqlAReceberNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlAReceberHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlAReceberDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlAReceberDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data la'#231'amento'
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlAReceberVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object sqlAReceberPROVISAO: TStringField
      DisplayLabel = 'Provis'#227'o'
      FieldName = 'PROVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAReceberRECORRENCIA: TStringField
      DisplayLabel = 'Recorr'#234'ncia'
      FieldName = 'RECORRENCIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAReceberNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
      Required = True
    end
    object sqlAReceberANUAL: TStringField
      FieldName = 'ANUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAReceberDIA_VENCTO: TIntegerField
      FieldName = 'DIA_VENCTO'
      Required = True
    end
    object sqlAReceberPROXIMO_MES: TStringField
      FieldName = 'PROXIMO_MES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAReceberKFIN_CONTA_PREF: TStringField
      FieldName = 'KFIN_CONTA_PREF'
    end
    object sqlAReceberNOMECONTA: TStringField
      DisplayLabel = 'Nome conta'
      FieldName = 'NOMECONTA'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlAReceberKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
    end
    object sqlAReceberDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlAReceberDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlAReceberDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = []
    end
    object sqlAReceberDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object sqlAReceberOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlAReceberATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlAReceberPAGTO_AVISTA: TStringField
      FieldName = 'PAGTO_AVISTA'
      FixedChar = True
      Size = 1
    end
    object sqlAReceberSYSORIGIN_TYPE: TIntegerField
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
        Name = 'KFIN_ARECEBER'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select  '
      '  P.KFIN_ARECEBER_PARCELA, '
      '  P.KFIN_ARECEBER, '
      '  P.DOCUMENTO, '
      '  P.VENCTO, '
      '  P.VALOR, '
      '  P.PAGTO, '
      '  P.PAGO, '
      '  P.KFIN_CONTA,'
      '  C.NOME NOMECONTA,'
      '  P.PREVISAO, '
      '  P.DUVIDOSO, '
      '  CAST(P.OBS AS BLOB) OBS, '
      '  P.CHEQUE, '
      '  P.NUM_CHEQUE,'
      '  P.DT_COMPENSACAO'
      'from FIN_ARECEBER_PARCELAS P'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      'WHERE   P.KFIN_ARECEBER = :KFIN_ARECEBER')
    Left = 410
    Top = 141
    object sqlParcelasKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlParcelasKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
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
    object sqlParcelasOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlParcelasKFIN_CONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object sqlParcelasNOMECONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOMECONTA'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlParcelasDUVIDOSO: TStringField
      DisplayLabel = 'Duvidoso'
      FieldName = 'DUVIDOSO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlParcelasPREVISAO: TStringField
      DisplayLabel = 'provis'#227'o'
      FieldName = 'PREVISAO'
      Required = True
      Visible = False
      FixedChar = True
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
    DataSet = sqlAReceber
    Left = 247
    Top = 187
  end
  object cdsApropriacaoAReceber: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsARecebersqlApropriacaoAReceber
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    OnNewRecord = cdsApropriacaoAReceberNewRecord
    Left = 314
    Top = 51
    object cdsApropriacaoAReceberKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsApropriacaoAReceberKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object cdsApropriacaoAReceberNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsApropriacaoAReceberCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cdsApropriacaoAReceberCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object cdsApropriacaoAReceberPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object cdsApropriacaoAReceberTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsApropriacaoAReceberTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsApropriacaoAReceberTOTAL_PORCENTAGEM: TAggregateField
      DisplayLabel = 'Total porcentagem'
      FieldName = 'TOTAL_PORCENTAGEM'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PORCENTAGEM)'
    end
  end
  object sqlApropriacaoAReceber: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_ARECEBER'
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
      'WHERE A.TABLENAME = '#39'FIN_ARECEBER'#39' '
      '  AND A.TABLEKEY = :KFIN_ARECEBER')
    Left = 312
    Top = 142
    object sqlApropriacaoAReceberKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApropriacaoAReceberKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object sqlApropriacaoAReceberPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoAReceberNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlApropriacaoAReceberCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object sqlApropriacaoAReceberCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlApropriacaoAReceberTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApropriacaoAReceberTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
  end
end
