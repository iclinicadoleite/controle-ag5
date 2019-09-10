object Fin_BaixaAPagarDatamodule: TFin_BaixaAPagarDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsBaixaAPagar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DSP_TITULOS'
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
      end
      item
        DataType = ftInteger
        Name = 'DSP_TITULOS'
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
      end
      item
        DataType = ftInteger
        Name = 'DSP_TITULOS'
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
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspBaixaAPagar'
    OnNewRecord = cdsBaixaAPagarNewRecord
    Left = 78
    Top = 12
    object cdsBaixaAPagarKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAPagarKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAPagarKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAPagarDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsBaixaAPagarHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsBaixaAPagarDATACOMPRA: TSQLTimeStampField
      DisplayLabel = 'Data da compra'
      FieldName = 'DATACOMPRA'
      ProviderFlags = [pfInWhere]
    end
    object cdsBaixaAPagarVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsBaixaAPagarKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAPagarNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsBaixaAPagarPARCELAS: TStringField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      Size = 23
    end
    object cdsBaixaAPagarVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsBaixaAPagarKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAPagarCONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'CONTA'
      Size = 64
    end
    object cdsBaixaAPagarPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
    end
    object cdsBaixaAPagarPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsBaixaAPagarOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspBaixaAPagar: TDataSetProvider
    DataSet = sqlBaixaAPagar
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlBaixaAPagar: TTcSQLDataSet
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
        DataType = ftInteger
        Name = 'DSP_TITULOS'
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
      end
      item
        DataType = ftInteger
        Name = 'DSP_TITULOS'
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
      end
      item
        DataType = ftInteger
        Name = 'DSP_TITULOS'
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
      end
      item
        DataType = ftInteger
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    P.KFIN_APAGAR_PARCELA,'
      '    P.KFIN_APAGAR,'
      '    CMP.KCMP_PEDIDO,'
      
        '    COALESCE( CMP.NOTA_FISCAL, P.DOCUMENTO, AP.DOCUMENTO ) DOCUM' +
        'ENTO,'
      '    AP.HISTORICO,'
      
        '    COALESCE (  CMP.DATA_EMISSAO, IIF( AP.RECORRENCIA = '#39'T'#39', P.V' +
        'ENCTO, AP.DATALANCTO )  ) DATACOMPRA,'
      '    P.VENCTO,'
      '    AP.KCAD_ENTIDADE,'
      '    AP.NOMEENTIDADE,'
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
      '    P.VALOR,'
      '    P.PAGO,'
      '    P.PAGTO,'
      '    P.KFIN_CONTA,'
      '    C.NOME CONTA,'
      '    P.OBS'
      'FROM FIN_APAGAR_PARCELAS P'
      'INNER JOIN FIN_APAGAR AP ON AP.KFIN_APAGAR = P.KFIN_APAGAR'
      
        'LEFT JOIN CMP_PEDIDOS CMP ON AP.TABLENAME = '#39'CMP_PEDIDOS'#39' AND CM' +
        'P.KCMP_PEDIDO = AP.TABLEKEY'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      
        'WHERE  ( AP.KSYS$DOMAIN = :KSYS$DOMAIN ) AND (AP.TABLENAME IS DI' +
        'STINCT FROM '#39'FIN_TRANSFERENCIAS'#39')'
      '  AND  ( AP.SYS$ORIGIN_TYPE <> 2  )'
      '  AND  ('
      
        '             ( :DSP_TITULOS = 1 AND P.VENCTO BETWEEN :DATAINI AN' +
        'D :DATAFIM AND P.PAGTO IS NULL )'
      
        '       OR ( :DSP_TITULOS = 2 AND P.PAGTO  BETWEEN :DATAINI AND :' +
        'DATAFIM)'
      
        '       OR ( :DSP_TITULOS = 3 AND (   (P.VENCTO BETWEEN :DATAINI ' +
        'AND :DATAFIM)'
      
        '                                  OR (P.PAGTO  BETWEEN :DATAINI ' +
        'AND :DATAFIM) )'
      '          ) )'
      '  AND (     ( :DSP_FORNECEDOR = '#39'F'#39' )'
      
        '          OR ( :DSP_FORNECEDOR = '#39'T'#39' AND AP.KCAD_ENTIDADE = :KCA' +
        'D_ENTIDADE )'
      '          )'
      'ORDER BY P.VENCTO')
    Left = 73
    Top = 100
    object sqlBaixaAPagarKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAPagarKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
    end
    object sqlBaixaAPagarKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlBaixaAPagarDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlBaixaAPagarHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlBaixaAPagarDATACOMPRA: TSQLTimeStampField
      DisplayLabel = 'Data da compra'
      FieldName = 'DATACOMPRA'
      ProviderFlags = [pfInWhere]
    end
    object sqlBaixaAPagarVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlBaixaAPagarKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAPagarNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlBaixaAPagarPARCELAS: TStringField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      Size = 23
    end
    object sqlBaixaAPagarVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
    end
    object sqlBaixaAPagarKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAPagarCONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'CONTA'
      Size = 64
    end
    object sqlBaixaAPagarPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data pagamento'
      FieldName = 'PAGTO'
    end
    object sqlBaixaAPagarPAGO: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'PAGO'
    end
    object sqlBaixaAPagarOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsBaixaAPagar: TDataSource
    DataSet = sqlBaixaAPagar
    Left = 114
    Top = 147
  end
end
