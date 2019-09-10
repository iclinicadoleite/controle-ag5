object FIN_ContasAReceberReportDataModule: TFIN_ContasAReceberReportDataModule
  OldCreateOrder = False
  Height = 360
  Width = 646
  object sqlFIN_AReceber: TTcSQLDataSet
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
      '    A.KFIN_ARECEBER,'
      '    A.HISTORICO,'
      '    A.NOMEENTIDADE,'
      
        '    IIF( A.RECORRENCIA = '#39'T'#39', P.DOCUMENTO, A.DOCUMENTO ) DOCUMEN' +
        'TO,'
      
        '    IIF( A.RECORRENCIA = '#39'T'#39', P.DOCUMENTO_, A.DOCUMENTO_ ) DOCUM' +
        'ENTO_,'
      '    A.DATALANCTO,'
      '    P.KFIN_ARECEBER_PARCELA,'
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
      '    P.VENCTO,'
      '    P.VALOR,'
      '    P.PREVISAO,'
      '    C.NOME CONTA'
      'FROM FIN_ARECEBER_PARCELAS P'
      'JOIN FIN_ARECEBER A ON A.KFIN_ARECEBER = P.KFIN_ARECEBER'
      'LEFT JOIN FIN_CONTAS C ON P.KFIN_CONTA = C.KFIN_CONTA'
      'LEFT JOIN CAD_ENTIDADES E ON E.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( :TODOS = '#39'T'#39' OR ( A.KCAD_ENTIDADE = :KCAD_ENTIDADE ) )'
      '  AND ( P.PAGO IS NULL )'
      '  AND ( P.VENCTO BETWEEN :DATAINI AND :DATAFIM )'
      'ORDER BY P.VENCTO')
    Left = 236
    Top = 96
    object sqlFIN_AReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      FixedChar = True
    end
    object sqlFIN_AReceberKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      Required = True
      FixedChar = True
    end
    object sqlFIN_AReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlFIN_AReceberNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlFIN_AReceberDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlFIN_AReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlFIN_AReceberDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Size = 52
    end
    object sqlFIN_AReceberPARCELAS: TStringField
      FieldName = 'PARCELAS'
      Size = 23
    end
    object sqlFIN_AReceberVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlFIN_AReceberVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlFIN_AReceberPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFIN_AReceberCONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
  end
  object dspFIN_AReceber: TDataSetProvider
    DataSet = sqlFIN_AReceber
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 56
  end
  object cdsFIN_AReceber: TClientDataSet
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
    ProviderName = 'dspFIN_AReceber'
    BeforeOpen = cdsFIN_AReceberBeforeOpen
    Left = 236
    Top = 16
    object cdsFIN_AReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsFIN_AReceberKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsFIN_AReceberDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
    end
    object cdsFIN_AReceberDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Visible = False
      Size = 52
    end
    object cdsFIN_AReceberNOMEENTIDADE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsFIN_AReceberHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Required = True
      Size = 60
    end
    object cdsFIN_AReceberDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
      Visible = False
    end
    object cdsFIN_AReceberPARCELAS: TStringField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      Size = 23
    end
    object cdsFIN_AReceberVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencto'
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsFIN_AReceberVALOR: TFloatField
      DisplayLabel = '$ Valor'
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsFIN_AReceberPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsFIN_AReceberCONTAS: TStringField
      FieldName = 'CONTA'
      Visible = False
      Size = 30
    end
    object cdsFIN_AReceberTOTAL_ARECEBER: TAggregateField
      FieldName = 'TOTAL_ARECEBER'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VALOR)'
    end
  end
end
