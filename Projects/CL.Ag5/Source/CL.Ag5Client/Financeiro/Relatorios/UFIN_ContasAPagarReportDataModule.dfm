object FIN_ContasAPagarReportDataModule: TFIN_ContasAPagarReportDataModule
  OldCreateOrder = False
  Height = 305
  Width = 519
  object sqlFIN_APAGAR: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
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
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    A.KFIN_APAGAR,'
      '    A.HISTORICO,'
      '    A.NOMEENTIDADE,'
      
        '   IIF( A.RECORRENCIA = '#39'T'#39', P.DOCUMENTO, A.DOCUMENTO ) DOCUMENT' +
        'O,'
      
        '   IIF( A.RECORRENCIA = '#39'T'#39', P.DOCUMENTO_, A.DOCUMENTO_ ) DOCUME' +
        'NTO_,'
      '    A.DATALANCTO,'
      '    P.KFIN_APAGAR_PARCELA,'
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
      '    P.VENCTO,'
      '    P.VALOR,'
      '    P.PREVISAO,'
      '    C.NOME AS CONTA'
      'FROM FIN_APAGAR_PARCELAS P'
      'JOIN FIN_APAGAR A ON A.KFIN_APAGAR = P.KFIN_APAGAR'
      'LEFT JOIN FIN_CONTAS C ON P.KFIN_CONTA = C.KFIN_CONTA'
      'LEFT JOIN CAD_ENTIDADES E ON E.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( :TODOS = '#39'T'#39' OR ( A.KCAD_ENTIDADE = :KCAD_ENTIDADE ) )'
      '  AND ( P.PAGO IS NULL )'
      '  AND ( P.VENCTO BETWEEN :DATAINI AND :DATAFIM )'
      'ORDER BY P.VENCTO')
    Left = 236
    Top = 88
    object sqlFIN_APAGARKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
    end
    object sqlFIN_APAGARHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlFIN_APAGARNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlFIN_APAGARDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlFIN_APAGARDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlFIN_APAGARDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Size = 52
    end
    object sqlFIN_APAGARKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      Required = True
    end
    object sqlFIN_APAGARPARCELAS: TStringField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      Size = 23
    end
    object sqlFIN_APAGARVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlFIN_APAGARVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlFIN_APAGARPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFIN_APAGARCONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
  end
  object dspFIN_APAGAR: TDataSetProvider
    DataSet = sqlFIN_APAGAR
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 56
  end
  object cdsFIN_APAGAR: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
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
      end>
    ProviderName = 'dspFIN_APAGAR'
    BeforeOpen = cdsFIN_APAGARBeforeOpen
    Left = 236
    Top = 16
    object cdsFIN_APAGARKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      Visible = False
    end
    object cdsFIN_APAGARDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
    end
    object cdsFIN_APAGARDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Visible = False
      Size = 52
    end
    object cdsFIN_APAGARNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsFIN_APAGARHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Required = True
      Size = 60
    end
    object cdsFIN_APAGARPARCELAS: TStringField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      Size = 23
    end
    object cdsFIN_APAGARVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencto'
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsFIN_APAGARVALOR: TFloatField
      DisplayLabel = '$ Valor'
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsFIN_APAGARDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
      Visible = False
    end
    object cdsFIN_APAGARKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      Required = True
      Visible = False
    end
    object cdsFIN_APAGARPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsFIN_APAGARCONTAS: TStringField
      FieldName = 'CONTA'
      Visible = False
      Size = 30
    end
    object cdsFIN_APAGARTOTAL_APAGAR: TAggregateField
      FieldName = 'TOTAL_APAGAR'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VALOR)'
    end
  end
end
