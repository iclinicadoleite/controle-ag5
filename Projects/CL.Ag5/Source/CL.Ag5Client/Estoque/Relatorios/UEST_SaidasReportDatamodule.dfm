object EST_SaidasReportDatamodule: TEST_SaidasReportDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 469
  object cdsSaidas: TClientDataSet
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
      end
      item
        DataType = ftInteger
        Name = 'TIPOCENTROCUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCENTROCUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCENTROCUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO_CC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCONTACONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCONTACONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCONTACONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO_PC'
        ParamType = ptInput
      end>
    ProviderName = 'dspSaidas'
    Left = 80
    Top = 12
    object cdsSaidasDOCUMENTO: TStringField
      DisplayLabel = 'Lan'#231'amento'
      DisplayWidth = 9
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsSaidasDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data lan'#231'amento'
      DisplayWidth = 14
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsSaidasHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 33
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsSaidasCONTACONTABIL: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      DisplayWidth = 16
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object cdsSaidasCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de custo'
      DisplayWidth = 16
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
    object cdsSaidasPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      DisplayWidth = 11
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '0 %'
    end
    object cdsSaidasQTDE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
      DisplayFormat = '#,0.00'
    end
    object cdsSaidasVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 4
      FieldName = 'VALOR'
      Visible = False
      DisplayFormat = '#,0.00'
    end
    object cdsSaidasCUSTO_MEDIO: TFloatField
      DisplayLabel = 'Valor total'
      FieldName = 'CUSTO_MEDIO'
      DisplayFormat = '#,0.00'
    end
  end
  object dspSaidas: TDataSetProvider
    DataSet = sqlSaidas
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 43
    Top = 57
  end
  object sqlSaidas: TTcSQLDataSet
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
      end
      item
        DataType = ftInteger
        Name = 'TIPOCENTROCUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCENTROCUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCENTROCUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO_CC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCONTACONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCONTACONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCONTACONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO_PC'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  S.CODIGO_LANCAMENTO  DOCUMENTO,'
      '  S.DATA DATALANCTO,'
      '  P.NOME HISTORICO,'
      '  PC.NOME CONTACONTABIL,'
      '  CC.NOME CENTROCUSTO,'
      '  AP.PORCENTAGEM,'
      '  ap.TABLENAME,'
      '  COALESCE( (( AP.PORCENTAGEM * S.QTDE )/100 ), S.QTDE  ) QTDE,'
      
        '  COALESCE( (( AP.PORCENTAGEM * S.QTDE * S.CUSTO)/100 ), S.QTDE ' +
        '* S.CUSTO ) VALOR,'
      
        '  COALESCE( (( AP.PORCENTAGEM * S.QTDE * COALESCE ( EMP.CUSTO_ME' +
        'DIO, MV.CUSTO_MEDIO ) )/100 ), S.QTDE * COALESCE ( EMP.CUSTO_MED' +
        'IO, MV.CUSTO_MEDIO ) ) CUSTO_MEDIO'
      'FROM EST_OUTRAS_ENTRADAS_SAIDAS S'
      
        'LEFT JOIN EST_MOVIMENTO MV ON MV.KSYS$DOMAIN = S.KSYS$DOMAIN AND' +
        '  MV.TABLENAME = '#39'EST_OUTRAS_ENTRADAS_SAIDAS'#39' AND MV.TABLEKEY = ' +
        'S.KEST_OUTRA_ENTRADA_SAIDA'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = S.KFIN_PL' +
        'ANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON AP.TABLENAME = '#39'EST_OUTRAS_ENTR' +
        'ADAS_SAIDAS'#39' AND AP.TABLEKEY = S.KEST_OUTRA_ENTRADA_SAIDA'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN EST_PRODUTOS  P ON P.KEST_PRODUTO = S.KEST_PRODUTO'
      
        'LEFT JOIN EST_ENCERRAMENTO_MES EM ON EM.KSYS$DOMAIN = MV.KSYS$DO' +
        'MAIN AND EM.ANO_MES = MV.ANO_MES AND ENCERRADO = '#39'T'#39
      
        'LEFT JOIN EST_ENCERRAMENTO_MES_PRODUTOS EMP ON EMP.KEST_ENCERRAM' +
        'ENTO_MES = EM.KEST_ENCERRAMENTO_MES AND EMP.KEST_PRODUTO = MV.KE' +
        'ST_PRODUTO'
      'WHERE ( S.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( S.TIPO = '#39'S'#39' )'
      '  AND ( S.DATA BETWEEN :DI AND :DF )'
      '  AND ( ( :TIPOGRUPO  = 0 ) OR ( P.KTIPO_PRODUTO= :KGRUPO ) )'
      '  AND ( ( :TIPOPRODUTO = 0 ) OR ( S.KEST_PRODUTO = :KPRODUTO ) )'
      
        '  AND ( ( :TIPOCENTROCUSTO = 0  ) OR ( (  :TIPOCENTROCUSTO <> 0)' +
        ' AND ( (CC.KFIN_CENTROCUSTO = :KCENTROCUSTO) OR ( CC.CLASSIFICAC' +
        'AO LIKE :CLASSIFICACAO_CC ) ) ) )'
      
        '  AND ( ( :TIPOCONTACONTABIL = 0 ) OR ( ( :TIPOCONTACONTABIL <> ' +
        '0 ) AND ( (PC.KFIN_PLANOCONTA = :KCONTACONTABIL) OR (PC.CLASSIFI' +
        'CACAO LIKE :CLASSIFICACAO_PC ) )) )'
      'ORDER BY 2')
    Left = 78
    Top = 100
    object sqlSaidasDOCUMENTO: TStringField
      DisplayLabel = 'Lan'#231'amento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlSaidasDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data lan'#231'amento'
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlSaidasHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlSaidasCONTACONTABIL: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object sqlSaidasCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de custo'
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
    object sqlSaidasPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '0 %'
    end
    object sqlSaidasQTDE: TFloatField
      FieldName = 'QTDE'
      DisplayFormat = '#,0.00'
    end
    object sqlSaidasVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object sqlSaidasCUSTO_MEDIO: TFloatField
      DisplayLabel = 'Valor total'
      FieldName = 'CUSTO_MEDIO'
      DisplayFormat = '#,0.00'
    end
  end
end
