object FIN_ChequesReportDatamodule: TFIN_ChequesReportDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 469
  object cdsCheques: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
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
        Name = 'COMPENSADO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCheques'
    Left = 84
    Top = 12
    object cdsChequesORIGEM: TIntegerField
      FieldName = 'ORIGEM'
      Required = True
    end
    object cdsChequesNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object cdsChequesBANCO: TStringField
      FieldName = 'BANCO'
      Size = 134
    end
    object cdsChequesAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 32
    end
    object cdsChequesCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
    object cdsChequesVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
    end
    object cdsChequesPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object cdsChequesHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsChequesDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsChequesCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChequesVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object cdsChequesDT_COMPENSACAO: TSQLTimeStampField
      FieldName = 'DT_COMPENSACAO'
    end
    object cdsChequesOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspCheques: TDataSetProvider
    DataSet = sqlCheques
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 43
    Top = 57
  end
  object sqlCheques: TTcSQLDataSet
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
        Name = 'COMPENSADO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  2 ORIGEM,'
      '  C.NOME NOMECONTA,'
      '  B.CODIGO || '#39' - '#39' || B.NOME BANCO,'
      '  C.AGENCIA,'
      '  C.CONTA_CORRENTE,'
      '  COALESCE( PA.PRORROGACAO, PA.VENCTO ) VENCTO,'
      '  PA.PAGTO,'
      '  A.HISTORICO,'
      '  PA.DOCUMENTO,'
      '  PA.CHEQUE,'
      '  COALESCE ( PA.PAGO, PA.VALOR ) VALOR,'
      '  PA.DT_COMPENSACAO,'
      '  PA.OBS'
      'FROM FIN_APAGAR_PARCELAS PA'
      'LEFT JOIN FIN_APAGAR A ON A.KFIN_APAGAR = PA.KFIN_APAGAR'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = PA.KFIN_CONTA'
      'LEFT JOIN FIN_BANCOS B ON B.KFIN_BANCO = C.KFIN_BANCO'
      'WHERE A.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND (  PA.PAGTO BETWEEN :DI AND :DF )'
      '  AND PA.CHEQUE = '#39'T'#39
      '  AND ( :COMPENSADO = '#39'T'#39' OR ( PA.DT_COMPENSACAO IS NULL ) )'
      '  AND A.ATIVO = '#39'T'#39
      'ORDER BY 1, 6')
    Left = 78
    Top = 100
    object sqlChequesORIGEM: TIntegerField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      Required = True
    end
    object sqlChequesNOMECONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOMECONTA'
      Size = 64
    end
    object sqlChequesBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 134
    end
    object sqlChequesAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Size = 32
    end
    object sqlChequesCONTA_CORRENTE: TStringField
      DisplayLabel = 'CC'
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
    object sqlChequesVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
    end
    object sqlChequesPAGTO: TSQLTimeStampField
      DisplayLabel = 'Pagamento'
      FieldName = 'PAGTO'
    end
    object sqlChequesHISTORICO: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlChequesDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlChequesCHEQUE: TStringField
      DisplayLabel = 'Cheque'
      FieldName = 'CHEQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlChequesVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object sqlChequesDT_COMPENSACAO: TSQLTimeStampField
      DisplayLabel = 'Compensado em'
      FieldName = 'DT_COMPENSACAO'
    end
    object sqlChequesOBS: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
end
