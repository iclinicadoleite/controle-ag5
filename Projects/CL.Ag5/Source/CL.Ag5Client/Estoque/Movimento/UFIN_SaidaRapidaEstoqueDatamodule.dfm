object FIN_SaidaRapidaEstoqueDatamodule: TFIN_SaidaRapidaEstoqueDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KEST_OUTRA_ENTRADA_SAIDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspEstoque'
    BeforePost = cdsEstoqueBeforePost
    OnCalcFields = cdsEstoqueCalcFields
    OnNewRecord = cdsEstoqueNewRecord
    Left = 87
    Top = 28
    object cdsEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField
      FieldName = 'KEST_OUTRA_ENTRADA_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEstoqueKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object cdsEstoqueCODIGO_LANCAMENTO: TStringField
      DisplayLabel = 'C'#243'digo lan'#231'amento'
      FieldName = 'CODIGO_LANCAMENTO'
      Size = 32
    end
    object cdsEstoqueDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsEstoqueKEST_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'KEST_PRODUTO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEstoqueCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
      Size = 32
    end
    object cdsEstoqueNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 128
    end
    object cdsEstoqueDESCRICAO: TMemoField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 1
    end
    object cdsEstoqueKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
    end
    object cdsEstoqueDESC_TIPO: TStringField
      DisplayLabel = 'Grupo'
      FieldKind = fkLookup
      FieldName = 'DESC_TIPO'
      LookupDataSet = cdsTiposProduto
      LookupKeyFields = 'KCAD_TIPOS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'KTIPO_PRODUTO'
      ProviderFlags = [pfInWhere]
      Size = 30
      Lookup = True
    end
    object cdsEstoqueUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 32
    end
    object cdsEstoqueTIPO: TStringField
      DisplayLabel = 'Tipo lan'#231'amento'
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEstoqueQTDE: TFloatField
      DisplayLabel = 'Quantidade sa'#237'da'
      FieldName = 'QTDE'
    end
    object cdsEstoqueCUSTO: TFloatField
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO'
      DisplayFormat = '#,0.00'
    end
    object cdsEstoqueOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsEstoqueKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object cdsEstoqueDESCR_PC_NOME: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object cdsEstoqueDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 32
    end
    object cdsEstoqueDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
    object cdsEstoqueDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEstoqueQTDE_PRODUTO: TFloatField
      DisplayLabel = 'Estoque atual'
      FieldName = 'QTDE_PRODUTO'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0'
    end
    object cdsEstoqueQTDE_MINIMA: TFloatField
      DisplayLabel = 'Quantidade m'#237'nima'
      FieldName = 'QTDE_MINIMA'
      ProviderFlags = [pfInWhere]
    end
    object cdsEstoqueTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00'
    end
    object cdsEstoquesqlApropriacao: TDataSetField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'sqlApropriacao'
      Visible = False
    end
    object cdsEstoqueLISTA_CC: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'LISTA_CC'
      Size = 300
    end
  end
  object dspEstoque: TDataSetProvider
    DataSet = sqlEstoque
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspEstoqueGetTableName
    Left = 47
    Top = 73
  end
  object sqlEstoque: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KEST_OUTRA_ENTRADA_SAIDA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  M.KEST_OUTRA_ENTRADA_SAIDA,'
      '  M.KSYS$DOMAIN,'
      '  M.CODIGO_LANCAMENTO,'
      '  M.DATA,'
      '  M.KEST_PRODUTO,'
      '  P.CODIGO,'
      '  P.NOME,'
      '  P.KTIPO_PRODUTO,'
      '  P.DESCRICAO,'
      '  P.UNIDADE,'
      '  M.TIPO,'
      '  M.QTDE, '
      '  P.CUSTO_MEDIO CUSTO,'
      '  P.QTDE_PRODUTO,'
      '  P.QTDE_MINIMA,'
      '  M.OBS, '
      '  M.KFIN_PLANOCONTA,'
      '  PL.NOME DESCR_PC_NOME,'
      '  PL.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  PL.CODIGO DESCR_PC_CODIGO,'
      '  PL.TIPO_APRD DESCR_PC_TIPO_APRD'
      'FROM EST_OUTRAS_ENTRADAS_SAIDAS M'
      'LEFT JOIN EST_PRODUTOS P ON P.KEST_PRODUTO = M.KEST_PRODUTO'
      
        'LEFT JOIN FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = M.KFIN_PLAN' +
        'OCONTA'
      'WHERE KEST_OUTRA_ENTRADA_SAIDA = :KEST_OUTRA_ENTRADA_SAIDA')
    Left = 88
    Top = 108
    object sqlEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField
      FieldName = 'KEST_OUTRA_ENTRADA_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEstoqueKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object sqlEstoqueCODIGO_LANCAMENTO: TStringField
      DisplayLabel = 'C'#243'digo lan'#231'amento'
      FieldName = 'CODIGO_LANCAMENTO'
      Size = 32
    end
    object sqlEstoqueDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object sqlEstoqueKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEstoqueCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
      Size = 32
    end
    object sqlEstoqueNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 128
    end
    object sqlEstoqueDESCRICAO: TMemoField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 1
    end
    object sqlEstoqueUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 32
    end
    object sqlEstoqueKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlEstoqueTIPO: TStringField
      DisplayLabel = 'Tipo lan'#231'amento'
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlEstoqueQTDE: TFloatField
      DisplayLabel = 'Quantidade sa'#237'da'
      FieldName = 'QTDE'
    end
    object sqlEstoqueCUSTO: TFloatField
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO'
    end
    object sqlEstoqueOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlEstoqueKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlEstoqueDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlEstoqueDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlEstoqueDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = [pfInWhere]
    end
    object sqlEstoqueDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlEstoqueQTDE_PRODUTO: TFloatField
      DisplayLabel = 'Estoque atual'
      FieldName = 'QTDE_PRODUTO'
      ProviderFlags = [pfInWhere]
    end
    object sqlEstoqueQTDE_MINIMA: TFloatField
      DisplayLabel = 'Quantidade m'#237'nima'
      FieldName = 'QTDE_MINIMA'
      ProviderFlags = [pfInWhere]
    end
  end
  object cdsApropriacao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsEstoquesqlApropriacao
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    OnNewRecord = cdsApropriacaoNewRecord
    Left = 185
    Top = 30
    object cdsApropriacaoKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsApropriacaoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object cdsApropriacaoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cdsApropriacaoCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object cdsApropriacaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsApropriacaoPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object cdsApropriacaoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsApropriacaoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsApropriacaoTOTAL_PORCENTAGEM: TAggregateField
      DisplayLabel = 'Total porcentagem'
      FieldName = 'TOTAL_PORCENTAGEM'
      ProviderFlags = [pfInWhere]
      Active = True
      DisplayName = ''
      Expression = 'SUM(PORCENTAGEM)'
    end
  end
  object sqlApropriacao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsEstoque
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'KEST_OUTRA_ENTRADA_SAIDA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    A.KFIN_APROPRIACAO,'
      '    A.TABLENAME,'
      '    A.TABLEKEY,'
      '    A.KFIN_CENTROCUSTO,     '
      '    C.NOME,  '
      '    C.CODIGO, '
      '    C.CLASSIFICACAO,  '
      '    A.PORCENTAGEM'
      'FROM FIN_APROPRIACAO A'
      
        'LEFT JOIN FIN_CENTROSCUSTO C ON C.KFIN_CENTROCUSTO = A.KFIN_CENT' +
        'ROCUSTO'
      'WHERE A.TABLENAME = '#39'EST_OUTRAS_ENTRADAS_SAIDAS'#39' '
      '  AND A.TABLEKEY = :KEST_OUTRA_ENTRADA_SAIDA')
    Left = 187
    Top = 119
    object sqlApropriacaoKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApropriacaoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object sqlApropriacaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object sqlApropriacaoCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlApropriacaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlApropriacaoPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApropriacaoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
  end
  object dtsEstoque: TDataSource
    DataSet = sqlEstoque
    Left = 136
    Top = 165
  end
  object cdsTiposProduto: TClientDataSet
    PersistDataPacket.Data = {
      570000009619E0BD01000000180000000200000000000300000057000A4B4341
      445F5449504F5301004900000001000557494454480200020020000944455343
      524943414F01004900000001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 365
    Top = 20
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
