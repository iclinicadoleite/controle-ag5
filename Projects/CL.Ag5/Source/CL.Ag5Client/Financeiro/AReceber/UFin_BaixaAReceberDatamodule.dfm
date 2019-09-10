object Fin_BaixaAReceberDatamodule: TFin_BaixaAReceberDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 469
  object cdsBaixaAReceber: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KFIN_ARECEBER_PARCELA'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KFIN_ARECEBER'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KVND_PEDIDO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'DATAVENDA'
        DataType = ftTimeStamp
      end
      item
        Name = 'VENCTO'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'KCAD_ENTIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMEENTIDADE'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'PARCELAS'
        DataType = ftString
        Size = 23
      end
      item
        Name = 'VALOR'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'KFIN_CONTA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONTA'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'PAGTO'
        DataType = ftTimeStamp
      end
      item
        Name = 'PAGO'
        DataType = ftFloat
      end
      item
        Name = 'OBS'
        DataType = ftMemo
        Size = 1
      end>
    IndexDefs = <>
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
        Name = 'DSP_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspBaixaAReceber'
    StoreDefs = True
    Left = 78
    Top = 12
    object cdsBaixaAReceberKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAReceberKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAReceberDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsBaixaAReceberHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsBaixaAReceberDATAVENDA: TSQLTimeStampField
      DisplayLabel = 'Data da venda'
      FieldName = 'DATAVENDA'
      ProviderFlags = [pfInWhere]
    end
    object cdsBaixaAReceberVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsBaixaAReceberKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = []
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAReceberNOMEENTIDADE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsBaixaAReceberPARCELAS: TStringField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      Size = 23
    end
    object cdsBaixaAReceberVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsBaixaAReceberKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object cdsBaixaAReceberCONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'CONTA'
      Size = 64
    end
    object cdsBaixaAReceberPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data recebimento'
      FieldName = 'PAGTO'
    end
    object cdsBaixaAReceberPAGO: TFloatField
      DisplayLabel = 'Valor recebido'
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsBaixaAReceberOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspBaixaAReceber: TDataSetProvider
    DataSet = sqlBaixaAReceber
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlBaixaAReceber: TTcSQLDataSet
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
        Name = 'DSP_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DSP_CLIENTE'
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
      '    R.KFIN_ARECEBER_PARCELA,'
      '    R.KFIN_ARECEBER,'
      '    VND.KVND_PEDIDO,'
      
        '    COALESCE( VND.NOTA_FISCAL, R.DOCUMENTO, AR.DOCUMENTO ) DOCUM' +
        'ENTO,'
      '    AR.HISTORICO,'
      
        '    COALESCE (  VND.DATA_EMISSAO, IIF( AR.RECORRENCIA = '#39'T'#39', R.V' +
        'ENCTO, AR.DATALANCTO )  ) DATAVENDA,'
      '    R.VENCTO,'
      '    AR.KCAD_ENTIDADE,'
      '    AR.NOMEENTIDADE,'
      '    (    ( SELECT COUNT(1)'
      '             FROM FIN_ARECEBER_PARCELAS P1'
      '            WHERE P1.KFIN_ARECEBER = R.KFIN_ARECEBER'
      '              AND P1.VENCTO <= R.VENCTO'
      '          ) || '#39'/'#39' ||'
      '         ( SELECT COUNT(1)'
      '             FROM FIN_ARECEBER_PARCELAS P2'
      '            WHERE P2.KFIN_ARECEBER = R.KFIN_ARECEBER'
      '          )'
      '     ) PARCELAS,'
      '    R.VALOR,'
      '    R.PAGO,'
      '    R.PAGTO,'
      '    R.KFIN_CONTA,'
      '    C.NOME CONTA,'
      '    R.OBS'
      'FROM FIN_ARECEBER_PARCELAS R'
      'INNER JOIN FIN_ARECEBER AR ON AR.KFIN_ARECEBER = R.KFIN_ARECEBER'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = R.KFIN_CONTA'
      
        'LEFT JOIN VND_PEDIDOS VND ON AR.TABLENAME = '#39'VND_PEDIDOS'#39' AND VN' +
        'D.KVND_PEDIDO = AR.TABLEKEY'
      
        'WHERE  ( AR.KSYS$DOMAIN = :KSYS$DOMAIN ) AND (AR.TABLENAME IS DI' +
        'STINCT FROM '#39'FIN_TRANSFERENCIAS'#39')'
      '  AND  ( AR.SYS$ORIGIN_TYPE <> 2 )'
      '  AND  ('
      
        '             ( :DSP_TITULOS = 1 AND R.VENCTO BETWEEN :DATAINI AN' +
        'D :DATAFIM AND R.PAGTO IS NULL)'
      
        '       OR ( :DSP_TITULOS = 2 AND R.PAGTO  BETWEEN :DATAINI AND :' +
        'DATAFIM)'
      
        '       OR ( :DSP_TITULOS = 3 AND (   (R.VENCTO BETWEEN :DATAINI ' +
        'AND :DATAFIM)'
      
        '                                  OR (R.PAGTO  BETWEEN :DATAINI ' +
        'AND :DATAFIM) )'
      '         ) )'
      '  AND (     ( :DSP_CLIENTE = '#39'F'#39' )'
      
        '          OR ( :DSP_CLIENTE = '#39'T'#39' AND AR.KCAD_ENTIDADE = :KCAD_E' +
        'NTIDADE )'
      '          )'
      'ORDER BY R.VENCTO')
    Left = 73
    Top = 100
    object sqlBaixaAReceberKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlBaixaAReceberKVND_PEDIDO: TStringField
      FieldName = 'KVND_PEDIDO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlBaixaAReceberDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlBaixaAReceberHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlBaixaAReceberDATAVENDA: TSQLTimeStampField
      DisplayLabel = 'Data venda'
      FieldName = 'DATAVENDA'
      ProviderFlags = [pfInWhere]
    end
    object sqlBaixaAReceberVENCTO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlBaixaAReceberKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = []
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAReceberNOMEENTIDADE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlBaixaAReceberPARCELAS: TStringField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      Size = 23
    end
    object sqlBaixaAReceberVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object sqlBaixaAReceberKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object sqlBaixaAReceberCONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'CONTA'
      Size = 64
    end
    object sqlBaixaAReceberPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data recebimento'
      FieldName = 'PAGTO'
    end
    object sqlBaixaAReceberPAGO: TFloatField
      DisplayLabel = 'Valor recebido'
      FieldName = 'PAGO'
    end
    object sqlBaixaAReceberOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dstBaixaAReceber: TDataSource
    Left = 114
    Top = 147
  end
end
