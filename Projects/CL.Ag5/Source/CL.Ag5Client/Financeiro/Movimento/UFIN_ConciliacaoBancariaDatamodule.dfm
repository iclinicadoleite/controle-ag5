object FIN_ConciliacaoBancariaDatamodule: TFIN_ConciliacaoBancariaDatamodule
  OldCreateOrder = True
  Height = 274
  Width = 361
  object cdsLstConciliacao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'COMPENSADO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'COMPENSADO'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstConciliacao'
    OnNewRecord = cdsLstConciliacaoNewRecord
    Left = 87
    Top = 41
    object cdsLstConciliacaoKFIN_PARCELA: TStringField
      FieldName = 'KFIN_PARCELA'
      Visible = False
      FixedChar = True
    end
    object cdsLstConciliacaoORIGEM: TIntegerField
      FieldName = 'ORIGEM'
    end
    object cdsLstConciliacaoKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object cdsLstConciliacaoNOMECONTA: TStringField
      DisplayLabel = 'Nome conta'
      DisplayWidth = 11
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object cdsLstConciliacaoBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 26
      FieldName = 'BANCO'
      Size = 134
    end
    object cdsLstConciliacaoAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      DisplayWidth = 6
      FieldName = 'AGENCIA'
      Size = 32
    end
    object cdsLstConciliacaoCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta corrente'
      DisplayWidth = 25
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
    object cdsLstConciliacaoVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 8
      FieldName = 'VENCTO'
    end
    object cdsLstConciliacaoPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      DisplayWidth = 12
      FieldName = 'PAGTO'
    end
    object cdsLstConciliacaoHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      DisplayWidth = 25
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsLstConciliacaoDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 8
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsLstConciliacaoCHEQUE: TStringField
      DisplayLabel = 'Cheque'
      DisplayWidth = 5
      FieldName = 'CHEQUE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsLstConciliacaoCREDITO: TFloatField
      DisplayLabel = 'Cr'#233'dito'
      DisplayWidth = 5
      FieldName = 'CREDITO'
      DisplayFormat = '#,0.00'
    end
    object cdsLstConciliacaoDEBITO: TFloatField
      DisplayLabel = 'D'#233'bito'
      DisplayWidth = 5
      FieldName = 'DEBITO'
      DisplayFormat = '#,0.00'
    end
    object cdsLstConciliacaoDT_COMPENSACAO: TSQLTimeStampField
      DisplayLabel = 'Data Compensa'#231#227'o'
      DisplayWidth = 13
      FieldName = 'DT_COMPENSACAO'
    end
    object cdsLstConciliacaoDEBITO_CREDITO: TStringField
      DisplayWidth = 3
      FieldName = 'DEBITO_CREDITO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsLstConciliacaoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspLstConciliacao: TDataSetProvider
    DataSet = sqLstConciliacao
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspLstConciliacaoBeforeUpdateRecord
    Left = 63
    Top = 89
  end
  object sqLstConciliacao: TTcSQLDataSet
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
        Name = 'COMPENSADO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'COMPENSADO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  1 ORIGEM,'
      '  PR.KFIN_ARECEBER_PARCELA KFIN_PARCELA,'
      '  C.KFIN_CONTA,'
      '  C.NOME NOMECONTA,'
      '  B.CODIGO || '#39' - '#39' || B.NOME BANCO,'
      '  C.AGENCIA,'
      '  C.CONTA_CORRENTE,'
      '  COALESCE( PR.PRORROGACAO, PR.VENCTO ) VENCTO,'
      '  PR.PAGTO,'
      '  R.HISTORICO,'
      '  PR.DOCUMENTO,'
      '  PR.CHEQUE,'
      '  COALESCE ( PR.PAGO, PR.VALOR ) CREDITO,'
      '  CAST( NULL AS FLOAT ) DEBITO,'
      '  PR.DT_COMPENSACAO,'
      '  PR.OBS,'
      '  '#39'C'#39' DEBITO_CREDITO'
      'FROM FIN_ARECEBER R'
      
        'LEFT JOIN FIN_ARECEBER_PARCELAS PR ON PR.KFIN_ARECEBER = R.KFIN_' +
        'ARECEBER'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = PR.KFIN_CONTA'
      'LEFT JOIN FIN_BANCOS B ON B.KFIN_BANCO = C.KFIN_BANCO'
      'WHERE R.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND ( :COMPENSADO = '#39'T'#39' OR ( PR.DT_COMPENSACAO IS NULL ) )'
      '  AND R.ATIVO = '#39'T'#39
      '  AND PR.CHEQUE = '#39'T'#39
      'UNION ALL'
      'SELECT'
      '  2 ORIGEM,'
      '  PA.KFIN_APAGAR_PARCELA KFIN_PARCELA,'
      '  C.KFIN_CONTA,'
      '  C.NOME NOMECONTA,'
      '  B.CODIGO || '#39' - '#39' || B.NOME BANCO,'
      '  C.AGENCIA,'
      '  C.CONTA_CORRENTE,'
      '  COALESCE( PA.PRORROGACAO, PA.VENCTO ) VENCTO,'
      '  PA.PAGTO,'
      '  A.HISTORICO,'
      '  PA.DOCUMENTO,'
      '  PA.CHEQUE,'
      '  CAST( NULL AS FLOAT ) CREDITO,'
      '  COALESCE ( PA.PAGO, PA.VALOR ) DEBITO,'
      '  PA.DT_COMPENSACAO,'
      '  PA.OBS,'
      '  '#39'D'#39' DEBITO_CREDITO'
      'FROM  FIN_APAGAR A'
      
        'LEFT JOIN FIN_APAGAR_PARCELAS PA ON PA.KFIN_APAGAR = A.KFIN_APAG' +
        'AR'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = PA.KFIN_CONTA'
      'LEFT JOIN FIN_BANCOS B ON B.KFIN_BANCO = C.KFIN_BANCO'
      'WHERE A.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND ( :COMPENSADO = '#39'T'#39' OR ( PA.DT_COMPENSACAO IS NULL ) )'
      '  AND A.ATIVO = '#39'T'#39
      '  AND PA.CHEQUE = '#39'T'#39
      'ORDER BY 1, 6')
    Left = 90
    Top = 137
    object sqLstConciliacaoORIGEM: TIntegerField
      FieldName = 'ORIGEM'
      Visible = False
    end
    object sqLstConciliacaoKFIN_PARCELA: TStringField
      FieldName = 'KFIN_PARCELA'
      FixedChar = True
    end
    object sqLstConciliacaoKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object sqLstConciliacaoNOMECONTA: TStringField
      DisplayLabel = 'Nome conta'
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object sqLstConciliacaoBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 134
    end
    object sqLstConciliacaoAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Size = 32
    end
    object sqLstConciliacaoCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta corrente'
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
    object sqLstConciliacaoVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
    end
    object sqLstConciliacaoPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
    end
    object sqLstConciliacaoHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqLstConciliacaoDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqLstConciliacaoCHEQUE: TStringField
      DisplayLabel = 'Cheque'
      FieldName = 'CHEQUE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqLstConciliacaoCREDITO: TFloatField
      DisplayLabel = 'Cr'#233'dito'
      FieldName = 'CREDITO'
    end
    object sqLstConciliacaoDEBITO: TFloatField
      DisplayLabel = 'D'#233'bito'
      FieldName = 'DEBITO'
    end
    object sqLstConciliacaoDT_COMPENSACAO: TSQLTimeStampField
      DisplayLabel = 'Data Compensa'#231#227'o'
      FieldName = 'DT_COMPENSACAO'
    end
    object sqLstConciliacaoDEBITO_CREDITO: TStringField
      FieldName = 'DEBITO_CREDITO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqLstConciliacaoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstConciliacao
    Left = 152
    Top = 8
  end
  object cdsConciliacao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_CONTA'
        ParamType = ptInput
      end>
    ProviderName = 'dspConciliacao'
    Left = 226
    Top = 44
    object cdsConciliacaoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      FixedChar = True
    end
    object cdsConciliacaoKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object cdsConciliacaoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object cdsConciliacaoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 134
    end
    object cdsConciliacaoAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 32
    end
    object cdsConciliacaoCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
    object cdsConciliacaoPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object cdsConciliacaoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsConciliacaoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsConciliacaoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsConciliacaoCHEQUE: TStringField
      FieldName = 'CHEQUE'
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
    end
    object cdsConciliacaoDEBITO_CREDITO: TStringField
      FieldName = 'DEBITO_CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspConciliacao: TDataSetProvider
    DataSet = sqlConciliacao
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 196
    Top = 89
  end
  object sqlConciliacao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_CONTA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  C.KSYS$DOMAIN,'
      '  C.KFIN_CONTA,'
      '  C.NOME NOMECONTA,'
      '  B.CODIGO || '#39' - '#39' || B.NOME BANCO,'
      '  C.AGENCIA,'
      '  C.CONTA_CORRENTE,'
      '  P.PAGTO,'
      '  R.HISTORICO,'
      '  P.DOCUMENTO,'
      '  P.VALOR,'
      '  P.CHEQUE,'
      '  P.DT_COMPENSACAO,'
      '  '#39#39' DEBITO_CREDITO,'
      '  P.OBS'
      'FROM FIN_ARECEBER R'
      
        'LEFT JOIN FIN_ARECEBER_PARCELAS P ON P.KFIN_ARECEBER = R.KFIN_AR' +
        'ECEBER'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      'LEFT JOIN FIN_BANCOS B ON B.KFIN_BANCO = C.KFIN_BANCO'
      'WHERE C.KFIN_CONTA = :KFIN_CONTA')
    Left = 228
    Top = 134
    object sqlConciliacaoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      FixedChar = True
    end
    object sqlConciliacaoKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      FixedChar = True
    end
    object sqlConciliacaoNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object sqlConciliacaoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 134
    end
    object sqlConciliacaoAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 32
    end
    object sqlConciliacaoCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
    object sqlConciliacaoPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object sqlConciliacaoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlConciliacaoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlConciliacaoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sqlConciliacaoCHEQUE: TStringField
      FieldName = 'CHEQUE'
      FixedChar = True
      Size = 1
    end
    object sqlConciliacaoDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
    end
    object sqlConciliacaoDEBITO_CREDITO: TStringField
      FieldName = 'DEBITO_CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlConciliacaoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
end
