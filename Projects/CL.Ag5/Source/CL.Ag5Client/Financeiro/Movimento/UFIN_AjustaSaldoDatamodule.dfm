object FIN_AjustaSaldoDatamodule: TFIN_AjustaSaldoDatamodule
  OldCreateOrder = True
  Height = 271
  Width = 365
  object cdsLstAjustaSaldo: TClientDataSet
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
    ProviderName = 'dspLstAjustaSaldo'
    Left = 78
    Top = 12
    object cdsLstAjustaSaldoORIGEM: TIntegerField
      FieldName = 'ORIGEM'
      ProviderFlags = []
      Visible = False
    end
    object cdsLstAjustaSaldoKFIN_PARCELA: TStringField
      FieldName = 'KFIN_PARCELA'
      ProviderFlags = [pfInKey]
      FixedChar = True
    end
    object cdsLstAjustaSaldoKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      ProviderFlags = []
      Visible = False
      FixedChar = True
    end
    object cdsLstAjustaSaldoNOMECONTA: TStringField
      DisplayLabel = 'Nome da conta'
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object cdsLstAjustaSaldoBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = []
      Size = 134
    end
    object cdsLstAjustaSaldoAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = []
      Size = 32
    end
    object cdsLstAjustaSaldoCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta corrente'
      FieldName = 'CONTA_CORRENTE'
      ProviderFlags = []
      Size = 128
    end
    object cdsLstAjustaSaldoPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
      ProviderFlags = []
    end
    object cdsLstAjustaSaldoHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      ProviderFlags = []
      Size = 128
    end
    object cdsLstAjustaSaldoDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      ProviderFlags = []
      Size = 32
    end
    object cdsLstAjustaSaldoCHEQUE: TStringField
      FieldName = 'CHEQUE'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsLstAjustaSaldoCREDITO: TFloatField
      DisplayLabel = 'Cr'#233'dito'
      FieldName = 'CREDITO'
      ProviderFlags = []
      DisplayFormat = '#,0.00'
    end
    object cdsLstAjustaSaldoNUM_CHEQUE: TStringField
      DisplayLabel = 'No. Cheque'
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object cdsLstAjustaSaldoDEBITO: TFloatField
      DisplayLabel = 'D'#233'bito'
      FieldName = 'DEBITO'
      ProviderFlags = []
      DisplayFormat = '#,0.00'
    end
    object cdsLstAjustaSaldoDT_COMPENSACAO: TSQLTimeStampField
      DisplayLabel = 'Data compensa'#231#227'o'
      FieldName = 'DT_COMPENSACAO'
      ProviderFlags = []
      OnValidate = cdsLstAjustaSaldoDT_COMPENSACAOValidate
    end
    object cdsLstAjustaSaldoVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      ProviderFlags = []
    end
    object cdsLstAjustaSaldoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object cdsLstAjustaSaldoDEBITO_CREDITO: TStringField
      FieldName = 'DEBITO_CREDITO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dspLstAjustaSaldo: TDataSetProvider
    DataSet = sqlLstAjustaSaldo
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspLstAjustaSaldoBeforeUpdateRecord
    Left = 38
    Top = 63
  end
  object sqlLstAjustaSaldo: TTcSQLDataSet
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
      '  PR.CHEQUE,PR.NUM_CHEQUE,'
      '  COALESCE ( PR.PAGO, PR.VALOR ) CREDITO,'
      '  CAST( NULL AS FLOAT ) DEBITO,'
      '  PR.DT_COMPENSACAO,'
      '  PR.OBS,'
      '  '#39'C'#39' DEBITO_CREDITO'
      'FROM FIN_ARECEBER_PARCELAS PR'
      'LEFT JOIN FIN_ARECEBER R ON R.KFIN_ARECEBER = PR.KFIN_ARECEBER'
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
      '  PA.CHEQUE,PA.NUM_CHEQUE,'
      '  CAST( NULL AS FLOAT ) CREDITO,'
      '  COALESCE ( PA.PAGO, PA.VALOR ) DEBITO,'
      '  PA.DT_COMPENSACAO,'
      '  PA.OBS,'
      '  '#39'D'#39' DEBITO_CREDITO'
      'FROM FIN_APAGAR_PARCELAS PA'
      'LEFT JOIN FIN_APAGAR A ON A.KFIN_APAGAR = PA.KFIN_APAGAR'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = PA.KFIN_CONTA'
      'LEFT JOIN FIN_BANCOS B ON B.KFIN_BANCO = C.KFIN_BANCO'
      'WHERE A.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND ( :COMPENSADO = '#39'T'#39' OR ( PA.DT_COMPENSACAO IS NULL ) )'
      '  AND A.ATIVO = '#39'T'#39
      '  AND PA.CHEQUE = '#39'T'#39
      'ORDER BY 1, 6')
    Left = 81
    Top = 113
    object sqlLstAjustaSaldoORIGEM: TIntegerField
      FieldName = 'ORIGEM'
      ProviderFlags = []
      Visible = False
    end
    object sqlLstAjustaSaldoKFIN_PARCELA: TStringField
      FieldName = 'KFIN_PARCELA'
      ProviderFlags = [pfInKey]
      FixedChar = True
    end
    object sqlLstAjustaSaldoKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      ProviderFlags = []
      Visible = False
      FixedChar = True
    end
    object sqlLstAjustaSaldoNOMECONTA: TStringField
      DisplayLabel = 'Nome da conta'
      FieldName = 'NOMECONTA'
      ProviderFlags = []
      Size = 64
    end
    object sqlLstAjustaSaldoBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = []
      Size = 134
    end
    object sqlLstAjustaSaldoAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = []
      Size = 32
    end
    object sqlLstAjustaSaldoCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta corrente'
      FieldName = 'CONTA_CORRENTE'
      ProviderFlags = []
      Size = 128
    end
    object sqlLstAjustaSaldoPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
      ProviderFlags = []
    end
    object sqlLstAjustaSaldoHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      ProviderFlags = []
      Size = 128
    end
    object sqlLstAjustaSaldoDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      ProviderFlags = []
      Size = 32
    end
    object sqlLstAjustaSaldoCHEQUE: TStringField
      FieldName = 'CHEQUE'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlLstAjustaSaldoNUM_CHEQUE: TStringField
      DisplayLabel = 'No. Cheque'
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object sqlLstAjustaSaldoCREDITO: TFloatField
      DisplayLabel = 'Cr'#233'dito'
      FieldName = 'CREDITO'
      ProviderFlags = []
      DisplayFormat = '#,0.00'
    end
    object sqlLstAjustaSaldoDEBITO: TFloatField
      DisplayLabel = 'D'#233'bito'
      FieldName = 'DEBITO'
      ProviderFlags = []
      DisplayFormat = '#,0.00'
    end
    object sqlLstAjustaSaldoDT_COMPENSACAO: TSQLTimeStampField
      DisplayLabel = 'Data compensa'#231#227'o'
      FieldName = 'DT_COMPENSACAO'
      ProviderFlags = []
    end
    object sqlLstAjustaSaldoVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      ProviderFlags = []
    end
    object sqlLstAjustaSaldoOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 1
    end
    object sqlLstAjustaSaldoDEBITO_CREDITO: TStringField
      FieldName = 'DEBITO_CREDITO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
