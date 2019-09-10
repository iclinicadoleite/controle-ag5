object Fin_CadastroPatrimonioDatamodule: TFin_CadastroPatrimonioDatamodule
  OldCreateOrder = True
  Height = 364
  Width = 772
  object cdsLstCadPatrimonio: TClientDataSet
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
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstCadPatrimonio'
    BeforeOpen = cdsLstCadPatrimonioBeforeOpen
    OnCalcFields = cdsLstCadPatrimonioCalcFields
    OnNewRecord = cdsLstCadPatrimonioNewRecord
    Left = 71
    Top = 44
    object cdsLstCadPatrimonioKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstCadPatrimonioKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstCadPatrimonioCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsLstCadPatrimonioCODIGO_: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_'
      Required = True
      Visible = False
      Size = 32
    end
    object cdsLstCadPatrimonioDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object cdsLstCadPatrimonioDATA_COMPRA: TSQLTimeStampField
      DisplayLabel = 'Data compra'
      FieldName = 'DATA_COMPRA'
      Required = True
    end
    object cdsLstCadPatrimonioQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object cdsLstCadPatrimonioVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,0.00'
      currency = True
    end
    object cdsLstCadPatrimonioVALOR_TOTAL: TCurrencyField
      DisplayLabel = 'Valor total'
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '#,0.00'
    end
    object cdsLstCadPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField
      DisplayLabel = 'Imobilizado em'
      FieldName = 'DATA_IMOBILIZADO'
    end
    object cdsLstCadPatrimonioVALOR_FINAL: TFloatField
      DisplayLabel = 'Valor total final'
      FieldName = 'VALOR_FINAL'
      DisplayFormat = '#,0.00'
      currency = True
    end
    object cdsLstCadPatrimonioVIDA_UTIL: TIntegerField
      DisplayLabel = 'Vida '#250'til'
      FieldName = 'VIDA_UTIL'
    end
    object cdsLstCadPatrimonioATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      OnGetText = cdsLstCadPatrimonioATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsLstCadPatrimonioNOMECATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'NOMECATEGORIA'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object cdsLstCadPatrimonioOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsLstCadPatrimonioTOTAL_PATRIMONIO: TAggregateField
      FieldName = 'TOTAL_PATRIMONIO'
      Active = True
      DisplayName = ''
      DisplayFormat = '0.00'
      Expression = 'SUM(VALOR_TOTAL)'
    end
  end
  object cdsCadPatrimonio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_PATRIMONIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCadPatrimonio'
    AfterInsert = cdsCadPatrimonioAfterInsert
    BeforePost = cdsCadPatrimonioBeforePost
    OnCalcFields = cdsCadPatrimonioCalcFields
    OnNewRecord = cdsCadPatrimonioNewRecord
    Left = 199
    Top = 44
    object cdsCadPatrimonioKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsCadPatrimonioKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsCadPatrimonioCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsCadPatrimonioDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object cdsCadPatrimonioDATA_COMPRA: TSQLTimeStampField
      DisplayLabel = 'Data compra'
      FieldName = 'DATA_COMPRA'
      Required = True
      OnChange = cdsCadPatrimonioDATA_COMPRAChange
    end
    object cdsCadPatrimonioATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCadPatrimonioKCAD_UNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'KCAD_UNIDADE'
      Visible = False
      OnChange = cdsCadPatrimonioKCAD_UNIDADEChange
      FixedChar = True
    end
    object cdsCadPatrimonioUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsCadPatrimonioDESC_UNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldKind = fkLookup
      FieldName = 'DESC_UNIDADE'
      LookupDataSet = cdsLstUnidades
      LookupKeyFields = 'KCAD_TIPOS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'KCAD_UNIDADE'
      Size = 32
      Lookup = True
    end
    object cdsCadPatrimonioDATA_BAIXA: TSQLTimeStampField
      DisplayLabel = 'Data baixa'
      FieldName = 'DATA_BAIXA'
    end
    object cdsCadPatrimonioQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object cdsCadPatrimonioVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      Required = True
      OnValidate = cdsCadPatrimonioVALOR_UNITARIOValidate
      DisplayFormat = '#,0.00'
      currency = True
    end
    object cdsCadPatrimonioVALOR_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_TOTAL'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsCadPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField
      DisplayLabel = 'Imobilizado em'
      FieldName = 'DATA_IMOBILIZADO'
    end
    object cdsCadPatrimonioVALOR_FINAL: TFloatField
      DisplayLabel = 'Valor total final'
      FieldName = 'VALOR_FINAL'
      DisplayFormat = '#,0.00'
      currency = True
    end
    object cdsCadPatrimonioVIDA_UTIL: TIntegerField
      DisplayLabel = 'Vida '#250'til'
      FieldName = 'VIDA_UTIL'
      Required = True
    end
    object cdsCadPatrimonioOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsCadPatrimonioKFIN_CATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'KFIN_CATEGORIA'
      Required = True
      FixedChar = True
    end
    object cdsCadPatrimonioNOMECATEGORIA: TStringField
      FieldName = 'NOMECATEGORIA'
      ProviderFlags = [pfInWhere]
      OnSetText = cdsCadPatrimonioNOMECATEGORIASetText
      Size = 64
    end
    object cdsCadPatrimonioKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      Required = True
      OnValidate = cdsCadPatrimonioKFIN_PLANOCONTAValidate
      FixedChar = True
    end
    object cdsCadPatrimonioDESCR_PC_NOME: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = [pfInWhere]
      OnSetText = cdsCadPatrimonioDESCR_PC_NOMESetText
      Size = 64
    end
    object cdsCadPatrimonioDESCR_PC_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = [pfInWhere]
    end
    object cdsCadPatrimonioDESCR_PC_CLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsCadPatrimonioDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object cdsCadPatrimonioKFIN_SETOR: TStringField
      FieldName = 'KFIN_SETOR'
      FixedChar = True
    end
    object cdsCadPatrimonioNOMESETOR: TStringField
      FieldName = 'NOMESETOR'
      OnSetText = cdsCadPatrimonioNOMESETORSetText
      Size = 64
    end
    object cdsCadPatrimoniosqlDepreciacao: TDataSetField
      DisplayLabel = 'Deprecia'#231#227'o'
      FieldName = 'sqlDepreciacao'
    end
    object cdsCadPatrimoniosqlApropriacao: TDataSetField
      FieldName = 'sqlApropriacao'
    end
  end
  object dspLstCadPatrimonio: TDataSetProvider
    DataSet = sqlLstCadPatrimonio
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 47
    Top = 89
  end
  object dspCadPatrimonio: TDataSetProvider
    DataSet = sqlCadPatrimonio
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 159
    Top = 89
  end
  object sqlLstCadPatrimonio: TTcSQLDataSet
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
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '    P.KCAD_PATRIMONIO,'
      '    P.KSYS$DOMAIN,'
      '    P.CODIGO,'
      '    P.CODIGO_,'
      '    P.DESCRICAO,'
      '    P.DATA_COMPRA,'
      '    P.DATA_IMOBILIZADO,'
      '    P.ATIVO,'
      '    P.QUANTIDADE,'
      '    P.VALOR_UNITARIO,'
      '    P.VALOR_FINAL,'
      '    P.VIDA_UTIL,'
      '    CAT.NOME as NOMECATEGORIA,'
      '    P.OBS'
      'FROM CAD_PATRIMONIOS P'
      
        'LEFT JOIN FIN_PLANOCONTAS CAT ON  CAT.KFIN_PLANOCONTA = P.KFIN_C' +
        'ATEGORIA'
      'WHERE P.KSYS$DOMAIN = :KSYS$DOMAIN'
      'AND ( :DSP_INATIVO = '#39'T'#39' OR P.ATIVO = '#39'T'#39' )'
      'ORDER BY     P.CODIGO_')
    Left = 74
    Top = 133
    object sqlLstCadPatrimonioKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstCadPatrimonioKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstCadPatrimonioCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlLstCadPatrimonioCODIGO_: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_'
      Required = True
      Size = 32
    end
    object sqlLstCadPatrimonioDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object sqlLstCadPatrimonioDATA_COMPRA: TSQLTimeStampField
      DisplayLabel = 'Data compra'
      FieldName = 'DATA_COMPRA'
      Required = True
    end
    object sqlLstCadPatrimonioATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlLstCadPatrimonioQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object sqlLstCadPatrimonioVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_UNITARIO'
      Required = True
    end
    object sqlLstCadPatrimonioOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlLstCadPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField
      DisplayLabel = 'Imobilizado em'
      FieldName = 'DATA_IMOBILIZADO'
    end
    object sqlLstCadPatrimonioVALOR_FINAL: TFloatField
      DisplayLabel = 'Valor total final'
      FieldName = 'VALOR_FINAL'
    end
    object sqlLstCadPatrimonioVIDA_UTIL: TIntegerField
      DisplayLabel = 'Vida '#250'til'
      FieldName = 'VIDA_UTIL'
    end
    object sqlLstCadPatrimonioNOMECATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'NOMECATEGORIA'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
  end
  object sqlCadPatrimonio: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftUnknown
        Name = 'KCAD_PATRIMONIOS'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '    P.KCAD_PATRIMONIO,'
      '    P.KSYS$DOMAIN,'
      '    P.CODIGO,'
      '    P.DESCRICAO,'
      '    P.DATA_COMPRA,'
      '    P.DATA_IMOBILIZADO,'
      '    P.ATIVO,'
      '    P.DATA_BAIXA,'
      '    P.QUANTIDADE,'
      '    P.VALOR_UNITARIO,'
      '    P.VALOR_FINAL,'
      '    P.VIDA_UTIL,'
      '    P.OBS,'
      '    P.KCAD_UNIDADE,'
      '    P.KFIN_PLANOCONTA,'
      '    P.KFIN_CATEGORIA,'
      '    P.KFIN_SETOR,'
      '    P.UNIDADE, '
      '    PC.NOME as DESCR_PC_NOME,'
      '    PC.CODIGO as DESCR_PC_CODIGO,'
      '    PC.CLASSIFICACAO as DESCR_PC_CLASSIFICACAO,'
      '    PC.TIPO_APRD as DESCR_PC_TIPO_APRD,'
      '    CAT.NOME as NOMECATEGORIA,'
      '    ST.NOME as NOMESETOR'
      'FROM CAD_PATRIMONIOS P'
      
        'LEFT JOIN FIN_PLANOCONTAS PC ON  PC.KFIN_PLANOCONTA = P.KFIN_PLA' +
        'NOCONTA'
      
        'LEFT JOIN FIN_PLANOCONTAS CAT ON  CAT.KFIN_PLANOCONTA = P.KFIN_C' +
        'ATEGORIA'
      
        'LEFT JOIN FIN_CENTROSCUSTO ST ON  ST.KFIN_CENTROCUSTO = P.KFIN_S' +
        'ETOR'
      'WHERE P.KCAD_PATRIMONIO = :KCAD_PATRIMONIOS')
    Left = 194
    Top = 132
    object sqlCadPatrimonioKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlCadPatrimonioKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlCadPatrimonioCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlCadPatrimonioDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object sqlCadPatrimonioDATA_COMPRA: TSQLTimeStampField
      DisplayLabel = 'Data compra'
      FieldName = 'DATA_COMPRA'
      Required = True
    end
    object sqlCadPatrimonioATIVO: TStringField
      DefaultExpression = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlCadPatrimonioKCAD_UNIDADE: TStringField
      FieldName = 'KCAD_UNIDADE'
      Visible = False
      FixedChar = True
    end
    object sqlCadPatrimonioUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlCadPatrimonioDATA_BAIXA: TSQLTimeStampField
      DisplayLabel = 'Data baixa'
      FieldName = 'DATA_BAIXA'
    end
    object sqlCadPatrimonioQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object sqlCadPatrimonioVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      Required = True
    end
    object sqlCadPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField
      DisplayLabel = 'Imobilizado em'
      FieldName = 'DATA_IMOBILIZADO'
    end
    object sqlCadPatrimonioVALOR_FINAL: TFloatField
      DisplayLabel = 'Valor total final'
      FieldName = 'VALOR_FINAL'
    end
    object sqlCadPatrimonioVIDA_UTIL: TIntegerField
      DisplayLabel = 'Vida '#250'til'
      FieldName = 'VIDA_UTIL'
    end
    object sqlCadPatrimonioOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlCadPatrimonioKFIN_CATEGORIA: TStringField
      FieldName = 'KFIN_CATEGORIA'
      FixedChar = True
    end
    object sqlCadPatrimonioNOMECATEGORIA: TStringField
      FieldName = 'NOMECATEGORIA'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlCadPatrimonioKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlCadPatrimonioDESCR_PC_NOME: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlCadPatrimonioDESCR_PC_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = [pfInWhere]
    end
    object sqlCadPatrimonioDESCR_PC_CLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlCadPatrimonioDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlCadPatrimonioKFIN_SETOR: TStringField
      FieldName = 'KFIN_SETOR'
      FixedChar = True
    end
    object sqlCadPatrimonioNOMESETOR: TStringField
      FieldName = 'NOMESETOR'
      Size = 64
    end
  end
  object dtsLstCadPatrimonio: TDataSource
    DataSet = cdsLstCadPatrimonio
    Left = 136
    Top = 8
  end
  object cdsDepreciacao: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCadPatrimoniosqlDepreciacao
    Params = <>
    OnNewRecord = cdsDepreciacaoNewRecord
    Left = 294
    Top = 45
    object cdsDepreciacaoKCAD_PATRIMONIO_DEPRECIACAO: TStringField
      FieldName = 'KCAD_PATRIMONIO_DEPRECIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDepreciacaoKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDepreciacaoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object cdsDepreciacaoVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      currency = True
    end
    object cdsDepreciacaoVALOR_PATRIMONIO: TFloatField
      DisplayLabel = 'Valor Atual'
      FieldName = 'VALOR_PATRIMONIO'
      ReadOnly = True
      currency = True
    end
  end
  object sqlDepreciacao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSqlCadPatrimonio
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_PATRIMONIO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '    PD.KCAD_PATRIMONIO_DEPRECIACAO,'
      '    PD.KCAD_PATRIMONIO,'
      '    PD.DATA,    '
      '    PD.VALOR,'
      '    PD.VALOR_PATRIMONIO'
      'FROM CAD_PATRIMONIO_DEPRECIACOES PD'
      'WHERE PD.KCAD_PATRIMONIO = :KCAD_PATRIMONIO')
    Left = 298
    Top = 134
    object sqlDepreciacaoKCAD_PATRIMONIO_DEPRECIACAO: TStringField
      FieldName = 'KCAD_PATRIMONIO_DEPRECIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlDepreciacaoKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlDepreciacaoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlDepreciacaoVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
    end
    object sqlDepreciacaoVALOR_PATRIMONIO: TFloatField
      DisplayLabel = 'Valor Atual'
      FieldName = 'VALOR_PATRIMONIO'
    end
  end
  object dtsSqlCadPatrimonio: TDataSource
    DataSet = sqlCadPatrimonio
    Left = 245
    Top = 180
  end
  object sqlApropriacao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSqlCadPatrimonio
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_PATRIMONIO'
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
      'WHERE A.TABLENAME = '#39'CAD_PATRIMONIOS'#39' '
      '  AND A.TABLEKEY = :KCAD_PATRIMONIO')
    Left = 414
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
  object cdsApropriacao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsCadPatrimoniosqlApropriacao
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KITEM'
        ParamType = ptInput
      end>
    OnNewRecord = cdsApropriacaoNewRecord
    Left = 409
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
  object cdsLstUnidades: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstUnidades'
    BeforeOpen = cdsLstUnidadesBeforeOpen
    Left = 667
    Top = 62
    object cdsLstUnidadesKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsLstUnidadesDESCRICAO: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
  end
  object sqlLstUnidades: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftUnknown
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    C.KCAD_TIPOS,'
      '    C.DESCRICAO'
      'FROM CAD_TIPOS C'
      'WHERE C.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND C.TIPO = 2'
      'ORDER BY C.DESCRICAO')
    Left = 672
    Top = 162
    object sqlLstUnidadesKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstUnidadesDESCRICAO: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
  end
  object dspLstUnidades: TDataSetProvider
    DataSet = sqlLstUnidades
    Left = 632
    Top = 110
  end
end
