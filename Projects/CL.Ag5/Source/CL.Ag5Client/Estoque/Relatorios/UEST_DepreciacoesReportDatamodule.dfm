object EST_DepreciacoesReportDatamodule: TEST_DepreciacoesReportDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 469
  object cdsDepreciacoes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
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
    ProviderName = 'dspDepreciacoes'
    Left = 80
    Top = 12
    object cdsDepreciacoesDOCUMENTO: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 9
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsDepreciacoesDATA_IMOBILIZADO: TSQLTimeStampField
      DisplayLabel = 'Data imobiliza'#231#227'o'
      FieldName = 'DATA_IMOBILIZADO'
    end
    object cdsDepreciacoesDATA_DEPRECIACAO: TSQLTimeStampField
      DisplayLabel = 'Data deprecia'#231#227'o'
      FieldName = 'DATA_DEPRECIACAO'
      DisplayFormat = 'mmm/yyyy'
    end
    object cdsDepreciacoesHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 33
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsDepreciacoesCONTACONTABIL: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      DisplayWidth = 16
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object cdsDepreciacoesCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de custo'
      DisplayWidth = 16
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
    object cdsDepreciacoesPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      DisplayWidth = 11
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '0.00 %'
    end
    object cdsDepreciacoesVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 4
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
  end
  object dspDepreciacoes: TDataSetProvider
    DataSet = sqlDepreciacoes
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 43
    Top = 57
  end
  object sqlDepreciacoes: TTcSQLDataSet
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
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
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
      'SELECT *  FROM'
      '(SELECT'
      '  P.CODIGO DOCUMENTO,'
      '  p.data_imobilizado,'
      
        '--  dateadd ( month,  -(cast( st.sys$value as integer ) -1) , da' +
        'teadd ( month, iif ( Extract ( day from d.data  ) > 15, 1, 0 ), ' +
        'd.data - EXTRACT ( DAY FROM d.data ) + 1 ) - 1 ) DATA_DEPRECIACA' +
        'O,'
      
        '  dateadd ( month,  -(cast( st.sys$value as integer )), D.DATA )' +
        ' DATA_DEPRECIACAO,'
      '  P.DESCRICAO HISTORICO,'
      '  PC.NOME CONTACONTABIL,'
      '  CC.NOME CENTROCUSTO,'
      '  AP.PORCENTAGEM,'
      
        '  COALESCE( (( AP.PORCENTAGEM * D.VALOR / 12 )/100 ), D.VALOR / ' +
        '12 ) VALOR'
      'FROM CAD_PATRIMONIOS P'
      
        'LEFT JOIN CAD_PATRIMONIO_DEPRECIACOES  D ON D.KCAD_PATRIMONIO  =' +
        ' P.KCAD_PATRIMONIO'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = P.KFIN_PL' +
        'ANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON AP.TABLENAME = '#39'CAD_PATRIMONIOS' +
        #39' AND AP.TABLEKEY = P.KCAD_PATRIMONIO'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN SYS$TYPES ST ON ST.SYS$TYPE = '#39'MONTH'#39
      'WHERE ( P.KSYS$DOMAIN = :KSYS$DOMAIN AND P.ATIVO = '#39'T'#39')'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC ) )'
      '         )'
      ')'
      'WHERE ( DATA_DEPRECIACAO BETWEEN :DI AND :DF )'
      'ORDER BY 1,2,3')
    Left = 78
    Top = 100
    object sqlDepreciacoesDOCUMENTO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlDepreciacoesDATA_IMOBILIZADO: TSQLTimeStampField
      DisplayLabel = 'Data imobiliza'#231#227'o'
      FieldName = 'DATA_IMOBILIZADO'
    end
    object sqlDepreciacoesDATA_DEPRECIACAO: TSQLTimeStampField
      DisplayLabel = 'Data deprecia'#231#227'o'
      FieldName = 'DATA_DEPRECIACAO'
      DisplayFormat = 'mmm/yyyy'
    end
    object sqlDepreciacoesHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlDepreciacoesCONTACONTABIL: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object sqlDepreciacoesCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de custo'
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
    object sqlDepreciacoesPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object sqlDepreciacoesVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
  end
end
