object EST_ProdutosInsumosReportDatamodule: TEST_ProdutosInsumosReportDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 438
  object cdsProdutosInsumos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
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
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KEST_PRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutosInsumos'
    Left = 78
    Top = 12
    object cdsProdutosInsumosKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsProdutosInsumosKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object cdsProdutosInsumosDESCR_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      FieldKind = fkLookup
      FieldName = 'DESCR_GRUPO'
      LookupDataSet = cdsTiposProduto
      LookupKeyFields = 'KCAD_TIPOS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'KTIPO_PRODUTO'
      Size = 32
      Lookup = True
    end
    object cdsProdutosInsumosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsProdutosInsumosNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsProdutosInsumosDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProdutosInsumosUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsProdutosInsumosNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor/Cliente'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsProdutosInsumosDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object cdsProdutosInsumosQTDE_ENTRADA: TFloatField
      DisplayLabel = 'Qtde entrada'
      FieldName = 'QTDE_ENTRADA'
      DisplayFormat = '#,0.##'
    end
    object cdsProdutosInsumosVALOR_ENTRADA: TFloatField
      DisplayLabel = 'Valor entrada'
      FieldName = 'VALOR_ENTRADA'
      DisplayFormat = '#,0.00'
    end
    object cdsProdutosInsumosQTDE_SAIDA: TFloatField
      DisplayLabel = 'Qtde sa'#237'da'
      FieldName = 'QTDE_SAIDA'
      DisplayFormat = '#,0.##'
    end
    object cdsProdutosInsumosVALOR_SAIDA: TFloatField
      DisplayLabel = 'Valor sa'#237'da'
      FieldName = 'VALOR_SAIDA'
      DisplayFormat = '#,0.00'
    end
    object cdsProdutosInsumosBAIXA_ESTOQUE: TStringField
      DisplayLabel = 'Baixa estoque (S/N)'
      FieldName = 'BAIXA_ESTOQUE'
      OnGetText = cdsProdutosInsumosBAIXA_ESTOQUEGetText
      FixedChar = True
      Size = 1
    end
    object cdsProdutosInsumosTOTAL_LANCAMENTO: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL_LANCAMENTO'
      DisplayFormat = '#,0.00'
    end
    object cdsProdutosInsumosPLANO_CONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'PLANO_CONTA'
      Size = 78
    end
    object cdsProdutosInsumosCENTRO_CUSTO: TStringField
      DisplayLabel = 'Centro de custo'
      FieldName = 'CENTRO_CUSTO'
      Size = 78
    end
  end
  object dspProdutosInsumos: TDataSetProvider
    DataSet = sqlProdutosInsumos
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 43
    Top = 57
  end
  object sqlProdutosInsumos: TTcSQLDataSet
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
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KEST_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  M.KEST_PRODUTO,'
      '  P.KTIPO_PRODUTO,'
      '  P.CODIGO,'
      '  P.NOME,'
      '  P.DESCRICAO,'
      '  P.UNIDADE,'
      '  CASE M.TABLENAME'
      '    WHEN '#39'CMP_PEDIDO_ITENS'#39' THEN CP.NOMEENTIDADE'
      '    WHEN '#39'VND_PEDIDO_ITENS'#39' THEN VP.NOMEENTIDADE'
      '    WHEN '#39'EST_OUTRAS_ENTRADAS_SAIDAS'#39' THEN OES.NOMEENTIDADE'
      '  END NOMEENTIDADE,'
      '  M.DATA,'
      '  IIF( M.TABLENAME = '#39'EST_PRODUTOS'#39', M.QTDE,'
      
        '       IIF( M.TIPO = '#39'E'#39', ( M.QTDE  * COALESCE( AP.PORCENTAGEM, ' +
        '100 ))/ 100, CAST( NULL AS FLOAT ))) QTDE_ENTRADA,'
      '  IIF( M.TABLENAME = '#39'EST_PRODUTOS'#39', M.CUSTO,'
      
        '       IIF( M.TIPO = '#39'E'#39', ( M.CUSTO * COALESCE( AP.PORCENTAGEM, ' +
        '100 ))/ 100, CAST( NULL AS FLOAT ))) VALOR_ENTRADA,'
      
        '  IIF( M.TIPO IN ( '#39'D'#39', '#39'S'#39' ), ( M.QTDE  * COALESCE( AP.PORCENTA' +
        'GEM, 100 ))/ 100, CAST( NULL AS FLOAT )) QTDE_SAIDA,'
      
        '--  IIF( M.TIPO IN ( '#39'D'#39', '#39'S'#39' ), ( COALESCE ( EMP.CUSTO_MEDIO, M' +
        '.CUSTO_MEDIO ) * COALESCE( AP.PORCENTAGEM, 100 ))/ 100, CAST( NU' +
        'LL AS FLOAT )) VALOR_SAIDA,'
      
        '  IIF( M.TIPO IN ( '#39'D'#39', '#39'S'#39' ), COALESCE ( EMP.CUSTO_MEDIO, M.CUS' +
        'TO_MEDIO ), CAST( NULL AS FLOAT )) VALOR_SAIDA,'
      '  CASE M.TIPO'
      '    WHEN  '#39'C'#39' THEN M.QTDE * M.CUSTO'
      
        '    WHEN  '#39'E'#39' THEN ((M.QTDE * COALESCE( AP.PORCENTAGEM, 100 ))/1' +
        '00)  * (( M.CUSTO * COALESCE( AP.PORCENTAGEM, 100 ) )/100)'
      
        '    WHEN  '#39'D'#39' THEN ((M.QTDE * COALESCE( AP.PORCENTAGEM, 100 ))/ ' +
        '100) * COALESCE ( EMP.CUSTO_MEDIO, M.CUSTO_MEDIO )'
      
        '    WHEN  '#39'S'#39' THEN ((M.QTDE * COALESCE( AP.PORCENTAGEM, 100 ))/ ' +
        '100) * COALESCE ( EMP.CUSTO_MEDIO, M.CUSTO_MEDIO )'
      '  END TOTAL_LANCAMENTO,'
      '  PL.CODIGO || '#39' - '#39' || PL.NOME PLANO_CONTA,'
      '  CC.CODIGO || '#39' - '#39' || CC.NOME CENTRO_CUSTO,'
      '  P.BAIXA_ESTOQUE'
      'FROM EST_MOVIMENTO M '
      'JOIN EST_PRODUTOS  P ON P.KEST_PRODUTO = M.KEST_PRODUTO'
      
        'LEFT JOIN CMP_PEDIDO_ITENS  CPI ON M.TABLENAME = '#39'CMP_PEDIDO_ITE' +
        'NS'#39' AND CPI.KCMP_PEDIDO_ITEM = M.TABLEKEY'
      'LEFT JOIN CMP_PEDIDOS  CP ON CP.KCMP_PEDIDO = CPI.KCMP_PEDIDO'
      
        'LEFT JOIN VND_PEDIDO_ITENS  VPI ON M.TABLENAME = '#39'VND_PEDIDO_ITE' +
        'NS'#39' AND VPI.KVND_PEDIDO_ITEM = M.TABLEKEY'
      'LEFT JOIN VND_PEDIDOS  VP ON VP.KVND_PEDIDO = VPI.KVND_PEDIDO'
      
        'LEFT JOIN EST_OUTRAS_ENTRADAS_SAIDAS OES ON M.TABLENAME = '#39'EST_O' +
        'UTRAS_ENTRADAS_SAIDAS'#39' AND OES.KEST_OUTRA_ENTRADA_SAIDA = M.TABL' +
        'EKEY'
      
        'LEFT JOIN FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = CPI.KFIN_PL' +
        'ANOCONTA OR  PL.KFIN_PLANOCONTA = VPI.KFIN_PLANOCONTA OR PL.KFIN' +
        '_PLANOCONTA = OES.KFIN_PLANOCONTA'
      'LEFT JOIN FIN_APROPRIACAO AP ON AP.TABLEKEY = M.TABLEKEY'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      
        'LEFT JOIN EST_ENCERRAMENTO_MES EM ON EM.KSYS$DOMAIN = M.KSYS$DOM' +
        'AIN AND EM.ANO_MES = M.ANO_MES AND ENCERRADO = '#39'T'#39
      
        'LEFT JOIN EST_ENCERRAMENTO_MES_PRODUTOS EMP ON EMP.KEST_ENCERRAM' +
        'ENTO_MES = EM.KEST_ENCERRAMENTO_MES AND EMP.KEST_PRODUTO = M.KES' +
        'T_PRODUTO'
      'WHERE P.KSYS$DOMAIN = :KSYS$DOMAIN'
      '   AND ( M.DATA BETWEEN :DATAINI AND :DATAFIM )'
      '   AND (      (  ( :TIPO = 0 )'
      '                    AND (        (:TIPO_PRODUTO = 2  )'
      
        '                               OR (:TIPO_PRODUTO = 0  AND P.PROD' +
        'UTO_INSUMO_SERVICO = 1 )'
      
        '                               OR (:TIPO_PRODUTO = 1  AND P.PROD' +
        'UTO_INSUMO_SERVICO = 2 )'
      '                            )'
      '                 )'
      
        '                  OR ( ( :TIPO = 1 )  AND ( P.KTIPO_PRODUTO = :K' +
        'GRUPO ) )'
      
        '                  OR ( ( :TIPO = 2 ) AND  ( M.KEST_PRODUTO = :KE' +
        'ST_PRODUTO ) )'
      '       )'
      'ORDER BY CAST ( M.DATA AS DATE ), M.MOVTO_ID')
    Left = 73
    Top = 100
    object sqlProdutosInsumosKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlProdutosInsumosKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object sqlProdutosInsumosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlProdutosInsumosNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlProdutosInsumosDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlProdutosInsumosUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlProdutosInsumosNOMEENTIDADE: TStringField
      DisplayLabel = 'Fornecedor/Cliente'
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlProdutosInsumosDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlProdutosInsumosQTDE_ENTRADA: TFloatField
      DisplayLabel = 'Qtde entrada'
      FieldName = 'QTDE_ENTRADA'
    end
    object sqlProdutosInsumosVALOR_ENTRADA: TFloatField
      DisplayLabel = 'Valor entrada'
      FieldName = 'VALOR_ENTRADA'
    end
    object sqlProdutosInsumosQTDE_SAIDA: TFloatField
      DisplayLabel = 'Qtde sa'#237'da'
      FieldName = 'QTDE_SAIDA'
    end
    object sqlProdutosInsumosVALOR_SAIDA: TFloatField
      DisplayLabel = 'Valor sa'#237'da'
      FieldName = 'VALOR_SAIDA'
    end
    object sqlProdutosInsumosBAIXA_ESTOQUE: TStringField
      DisplayLabel = 'Baixa estoque (S/N)'
      FieldName = 'BAIXA_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sqlProdutosInsumosTOTAL_LANCAMENTO: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL_LANCAMENTO'
    end
    object sqlProdutosInsumosPLANO_CONTA: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'PLANO_CONTA'
      Size = 78
    end
    object sqlProdutosInsumosCENTRO_CUSTO: TStringField
      DisplayLabel = 'Centro de custo'
      FieldName = 'CENTRO_CUSTO'
      Size = 78
    end
  end
  object cdsTiposProduto: TClientDataSet
    PersistDataPacket.Data = {
      570000009619E0BD01000000180000000200000000000300000057000A4B4341
      445F5449504F5301004900000001000557494454480200020020000944455343
      524943414F01004900000001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 229
    Top = 12
    object cdsTiposProdutoKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      Size = 32
    end
    object cdsTiposProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
  end
end
