object FIN_SaidaEstoqueDatamodule: TFIN_SaidaEstoqueDatamodule
  OldCreateOrder = True
  Height = 281
  Width = 488
  object cdsLstSaidaEstoque: TClientDataSet
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
      end>
    ProviderName = 'dspLstSaidaEstoque'
    OnCalcFields = cdsLstSaidaEstoqueCalcFields
    OnNewRecord = cdsLstSaidaEstoqueNewRecord
    Left = 65
    Top = 44
    object cdsLstSaidaEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField
      DisplayWidth = 7
      FieldName = 'KEST_OUTRA_ENTRADA_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstSaidaEstoqueKSYSDOMAIN: TStringField
      DisplayWidth = 7
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object cdsLstSaidaEstoqueCODIGO_LANCAMENTO: TStringField
      DisplayLabel = 'C'#243'digo lan'#231'amento'
      DisplayWidth = 19
      FieldName = 'CODIGO_LANCAMENTO'
      Size = 32
    end
    object cdsLstSaidaEstoqueDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      DisplayWidth = 14
      FieldName = 'DATA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLstSaidaEstoqueCODIGO: TStringField
      DisplayLabel = 'C'#243'digo produto'
      DisplayWidth = 14
      FieldName = 'CODIGO'
      ProviderFlags = []
      Size = 32
    end
    object cdsLstSaidaEstoqueNOME: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 57
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 128
    end
    object cdsLstSaidaEstoqueDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 10
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 1
    end
    object cdsLstSaidaEstoqueUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 14
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 32
    end
    object cdsLstSaidaEstoqueQTDE: TFloatField
      DisplayLabel = 'Qtde'
      DisplayWidth = 5
      FieldName = 'QTDE'
      Required = True
    end
    object cdsLstSaidaEstoqueCUSTO_MEDIO: TFloatField
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO_MEDIO'
      ProviderFlags = []
      DisplayFormat = '#,0.00'
    end
    object cdsLstSaidaEstoqueQTDE_PRODUTO: TFloatField
      DisplayLabel = 'Estoque atual'
      FieldName = 'QTDE_PRODUTO'
      ProviderFlags = []
      DisplayFormat = '#,0'
    end
    object cdsLstSaidaEstoqueTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00'
    end
    object cdsLstSaidaEstoqueOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      DisplayWidth = 8
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspLstSaidaEstoque: TDataSetProvider
    DataSet = sqlLstSaidaEstoque
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 41
    Top = 89
  end
  object sqlLstSaidaEstoque: TTcSQLDataSet
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
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  OES.KEST_OUTRA_ENTRADA_SAIDA,'
      '  OES.KSYS$DOMAIN,'
      '  OES.CODIGO_LANCAMENTO,'
      '  OES.DATA,'
      '  P.CODIGO,'
      '  P.NOME,'
      '  P.DESCRICAO,'
      '  P.UNIDADE,'
      '  OES.QTDE, '
      '  COALESCE( EMP.CUSTO_MEDIO, M.CUSTO_MEDIO ) CUSTO_MEDIO,'
      '  P.QTDE_PRODUTO,'
      '  OES.OBS '
      'FROM EST_OUTRAS_ENTRADAS_SAIDAS OES'
      
        'LEFT JOIN EST_MOVIMENTO M ON M.KSYS$DOMAIN = OES.KSYS$DOMAIN AND' +
        '  M.TABLENAME = '#39'EST_OUTRAS_ENTRADAS_SAIDAS'#39' AND M.TABLEKEY = OE' +
        'S.KEST_OUTRA_ENTRADA_SAIDA'
      'LEFT JOIN EST_PRODUTOS P ON P.KEST_PRODUTO = OES.KEST_PRODUTO'
      
        'LEFT JOIN EST_ENCERRAMENTO_MES EM ON EM.KSYS$DOMAIN = OES.KSYS$D' +
        'OMAIN AND EM.ANO_MES = M.ANO_MES AND EM.ENCERRADO = '#39'T'#39
      
        'LEFT JOIN EST_ENCERRAMENTO_MES_PRODUTOS EMP ON EMP.KEST_ENCERRAM' +
        'ENTO_MES = EM.KEST_ENCERRAMENTO_MES AND EMP.KEST_PRODUTO = OES.K' +
        'EST_PRODUTO'
      'WHERE OES.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND OES.DATA BETWEEN :DI AND :DF'
      '  AND OES.TIPO = '#39'S'#39)
    Left = 68
    Top = 133
    object sqlLstSaidaEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField
      FieldName = 'KEST_OUTRA_ENTRADA_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstSaidaEstoqueKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlLstSaidaEstoqueCODIGO_LANCAMENTO: TStringField
      DisplayLabel = 'C'#243'digo lan'#231'amento'
      FieldName = 'CODIGO_LANCAMENTO'
      Size = 32
    end
    object sqlLstSaidaEstoqueDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlLstSaidaEstoqueCODIGO: TStringField
      DisplayLabel = 'C'#243'digo produto'
      FieldName = 'CODIGO'
      ProviderFlags = []
      Size = 32
    end
    object sqlLstSaidaEstoqueNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 128
    end
    object sqlLstSaidaEstoqueDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 1
    end
    object sqlLstSaidaEstoqueUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 32
    end
    object sqlLstSaidaEstoqueQTDE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
      Required = True
    end
    object sqlLstSaidaEstoqueCUSTO_MEDIO: TFloatField
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO_MEDIO'
      ProviderFlags = []
    end
    object sqlLstSaidaEstoqueQTDE_PRODUTO: TFloatField
      DisplayLabel = 'Estoque atual'
      FieldName = 'QTDE_PRODUTO'
      ProviderFlags = []
    end
    object sqlLstSaidaEstoqueOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstSaidaEstoque
    Left = 120
    Top = 8
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KEST_OUTRA_ENTRADA_SAIDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspEstoque'
    BeforeInsert = cdsEstoqueBeforeInsert
    BeforePost = cdsEstoqueBeforePost
    AfterCancel = cdsEstoqueAfterCancel
    OnCalcFields = cdsEstoqueCalcFields
    OnNewRecord = cdsEstoqueNewRecord
    Left = 215
    Top = 44
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
      Required = True
      OnValidate = cdsEstoqueDATAValidate
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
      OnSetText = cdsEstoqueCODIGOSetText
      Size = 32
    end
    object cdsEstoqueNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      OnSetText = cdsEstoqueNOMESetText
      Size = 128
    end
    object cdsEstoqueDESCRICAO: TMemoField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 1
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
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Required = True
      OnValidate = cdsEstoqueQTDEValidate
    end
    object cdsEstoqueCUSTO: TFloatField
      DisplayLabel = 'Custo m'#233'dio'
      FieldName = 'CUSTO'
      OnValidate = cdsEstoqueCUSTOValidate
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
      FixedChar = True
    end
    object cdsEstoqueDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object cdsEstoqueDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsEstoqueDESCR_PC_CLASSIFICACAOGetText
      Size = 32
    end
    object cdsEstoqueDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = [pfInWhere]
    end
    object cdsEstoqueDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object cdsEstoqueTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00'
    end
    object cdsEstoqueQTDE_PRODUTO: TFloatField
      DisplayLabel = 'Estoque atual'
      FieldName = 'QTDE_PRODUTO'
      ProviderFlags = [pfInWhere]
    end
    object cdsEstoqueQTDE_MINIMA: TFloatField
      DisplayLabel = 'Quantidade m'#237'nima'
      FieldName = 'QTDE_MINIMA'
      ProviderFlags = [pfInWhere]
    end
    object cdsEstoquesqlApropriacao: TDataSetField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'sqlApropriacao'
    end
    object cdsEstoqueTOTAL_ESTOQUE: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL_ESTOQUE'
      DisplayFormat = '#,0.00'
    end
  end
  object dspEstoque: TDataSetProvider
    DataSet = sqlEstoque
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 175
    Top = 89
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
    Left = 216
    Top = 132
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
      Required = True
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
      DisplayLabel = 'Nome'
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
    object sqlEstoqueTIPO: TStringField
      DisplayLabel = 'Tipo lan'#231'amento'
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlEstoqueQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Required = True
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
    Left = 313
    Top = 46
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
    Left = 315
    Top = 135
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
    Left = 264
    Top = 181
  end
end
