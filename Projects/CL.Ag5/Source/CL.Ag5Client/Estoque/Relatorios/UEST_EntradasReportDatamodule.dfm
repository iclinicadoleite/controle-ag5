object EST_EntradasReportDatamodule: TEST_EntradasReportDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 469
  object cdsEntradas: TClientDataSet
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
        DataType = ftInteger
        Name = 'TIPOGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KPRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspEntradas'
    Left = 80
    Top = 12
    object cdsEntradasDOCUMENTO: TStringField
      DisplayLabel = 'Lan'#231'amento'
      DisplayWidth = 9
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsEntradasDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data'
      DisplayWidth = 14
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsEntradasHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 33
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsEntradasCONTACONTABIL: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      DisplayWidth = 16
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object cdsEntradasCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de custo'
      DisplayWidth = 16
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
    object cdsEntradasPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      DisplayWidth = 11
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '0 %'
    end
    object cdsEntradasQTDE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
      DisplayFormat = '#,0.00'
    end
    object cdsEntradasVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 4
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
  end
  object dspEntradas: TDataSetProvider
    DataSet = sqlEntradas
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 43
    Top = 57
  end
  object sqlEntradas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
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
        DataType = ftInteger
        Name = 'TIPOGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KPRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  S.CODIGO_LANCAMENTO DOCUMENTO,'
      '  S.DATA DATALANCTO,'
      '  P.NOME HISTORICO,'
      '  PC.NOME CONTACONTABIL,'
      '  CC.NOME CENTROCUSTO,'
      '  AP.PORCENTAGEM,'
      '  COALESCE( (( AP.PORCENTAGEM * S.QTDE )/100 ), S.QTDE ) QTDE,'
      
        '  COALESCE( (( AP.PORCENTAGEM * S.QTDE * S.CUSTO )/100 ), S.QTDE' +
        ' * S.CUSTO ) VALOR'
      'FROM EST_OUTRAS_ENTRADAS_SAIDAS S'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = S.KFIN_PL' +
        'ANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON AP.TABLENAME = '#39'EST_OUTRAS_ENTR' +
        'ADAS_SAIDAS'#39' AND AP.TABLEKEY = S.KEST_OUTRA_ENTRADA_SAIDA'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN EST_PRODUTOS  P ON P.KEST_PRODUTO = S.KEST_PRODUTO'
      'WHERE ( S.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( S.TIPO = '#39'E'#39' )'
      '  AND ( S.DATA BETWEEN :DI AND :DF )'
      '  AND ( ( :TIPOGRUPO  = 0 ) OR ( P.KTIPO_PRODUTO= :KGRUPO ) )'
      '  AND ( ( :TIPOPRODUTO = 0 ) OR ( S.KEST_PRODUTO = :KPRODUTO ) )'
      'ORDER BY 2')
    Left = 78
    Top = 100
    object sqlEntradasDOCUMENTO: TStringField
      DisplayLabel = 'Lan'#231'amento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlEntradasDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data lan'#231'amento'
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlEntradasHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlEntradasCONTACONTABIL: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object sqlEntradasCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de custo'
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
    object sqlEntradasPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '0 %'
    end
    object sqlEntradasQTDE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
      DisplayFormat = '#,0.00'
    end
    object sqlEntradasVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
  end
end
