object dtmFIN_PlanoContas2: TdtmFIN_PlanoContas2
  OldCreateOrder = True
  Height = 326
  Width = 476
  object dspPlanoContas: TDataSetProvider
    DataSet = sqlPlanoContas
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates]
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspPlanoContasUpdateError
    Left = 94
    Top = 57
  end
  object cdsPlanoContas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PLANOCONTAS'
        ParamType = ptInput
      end>
    ProviderName = 'dspPlanoContas'
    BeforeOpen = cdsPlanoContasBeforeOpen
    BeforeEdit = cdsPlanoContasBeforeEdit
    BeforePost = cdsPlanoContasBeforePost
    BeforeDelete = cdsPlanoContasBeforeDelete
    AfterDelete = cdsPlanoContasAfterDelete
    OnCalcFields = cdsPlanoContasCalcFields
    OnNewRecord = cdsPlanoContasNewRecord
    Left = 147
    Top = 14
    object cdsPlanoContasKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPlanoContasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPlanoContasORDENA: TStringField
      DisplayLabel = 'Ordena'
      FieldKind = fkInternalCalc
      FieldName = 'ORDENA'
      Visible = False
      Size = 32
    end
    object cdsPlanoContasCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPlanoContasCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      DisplayWidth = 32
      FieldName = 'CLASSIFICACAO'
      Required = True
      OnGetText = cdsPlanoContasCLASSIFICACAOGetText
      Size = 32
    end
    object cdsPlanoContasNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      OnValidate = cdsPlanoContasNOMEValidate
      Size = 64
    end
    object cdsPlanoContasATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      OnGetText = cdsPlanoContasATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasHIDE_BY_USER: TStringField
      FieldName = 'HIDE_BY_USER'
      Required = True
      OnGetText = cdsPlanoContasHIDE_BY_USERGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasANALITICO_SINTETICO: TStringField
      DisplayLabel = 'Anal'#237'tico/Sint'#233'tico'
      FieldName = 'ANALITICO_SINTETICO'
      Required = True
      Visible = False
      OnGetText = cdsPlanoContasANALITICO_SINTETICOGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasDEVEDORA_CREDORA: TStringField
      DisplayLabel = 'Devedora/Credora'
      FieldName = 'DEVEDORA_CREDORA'
      Required = True
      Visible = False
      OnGetText = cdsPlanoContasDEVEDORA_CREDORAGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasFLUXOCAIXA: TStringField
      DisplayLabel = 'Fluxo de Caixa'
      FieldName = 'FLUXOCAIXA'
      Required = True
      OnGetText = cdsPlanoContasFLUXOCAIXAGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasTIPO_APRD: TStringField
      DisplayLabel = 'Tipo '
      FieldName = 'TIPO_APRD'
      Required = True
      OnChange = cdsPlanoContasTIPO_APRDChange
      OnGetText = cdsPlanoContasTIPO_APRDGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasFIXA_VARIAVEL: TStringField
      DisplayLabel = 'Fixa/Vari'#225'vel'
      FieldName = 'FIXA_VARIAVEL'
      Visible = False
      OnGetText = cdsPlanoContasFIXA_VARIAVELGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasMOVIMENTA_ESTOQUE: TStringField
      DisplayLabel = 'Movimenta estoque'
      FieldName = 'MOVIMENTA_ESTOQUE'
      Required = True
      OnGetText = cdsPlanoContasMOVIMENTA_ESTOQUEGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasKMFIN_PLANOCONTA: TStringField
      FieldName = 'KMFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object cdsPlanoContasKDEF_PLANOCONTA: TStringField
      FieldName = 'KDEF_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object cdsPlanoContasTIPO_PLANOCONTAS: TIntegerField
      FieldName = 'TIPO_PLANOCONTAS'
      Required = True
    end
    object cdsPlanoContasKEQV_PLANOCONTA: TStringField
      FieldName = 'KEQV_PLANOCONTA'
      FixedChar = True
    end
    object cdsPlanoContasCLASSIFICACAO_EQUIVALENTE: TStringField
      FieldName = 'CLASSIFICACAO_EQUIVALENTE'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsPlanoContasCLASSIFICACAO_EQUIVALENTEGetText
      Size = 32
    end
    object cdsPlanoContasNOME_EQUIVALENTE: TStringField
      FieldName = 'NOME_EQUIVALENTE'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
  end
  object sqlPlanoContas: TTcSQLDataSet
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
        Name = 'TIPO_PLANOCONTAS'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      ' P.KFIN_PLANOCONTA, '
      ' P.KSYS$DOMAIN, '
      ' P.TIPO_PLANOCONTAS,'
      ' P.CODIGO,'
      ' P.CLASSIFICACAO,'
      ' P.NOME, '
      ' P.ATIVO,'
      ' P.ANALITICO_SINTETICO, '
      ' P.DEVEDORA_CREDORA, '
      ' P.FLUXOCAIXA, '
      ' P.TIPO_APRD, '
      ' P.FIXA_VARIAVEL,'
      ' P.MOVIMENTA_ESTOQUE,'
      ' P.KMFIN_PLANOCONTA,'
      ' P.KDEF_PLANOCONTA,'
      ' P.HIDE_BY_USER,'
      ' P.KEQV_PLANOCONTA,'
      ' EQV.CLASSIFICACAO CLASSIFICACAO_EQUIVALENTE,'
      ' EQV.NOME NOME_EQUIVALENTE'
      'FROM FIN_PLANOCONTAS P'
      
        'LEFT JOIN FIN_PLANOCONTAS EQV ON EQV.KFIN_PLANOCONTA = P.KEQV_PL' +
        'ANOCONTA '
      'WHERE P.KSYS$DOMAIN = :KSYS$DOMAIN'
      ' AND P.TIPO_PLANOCONTAS = :TIPO_PLANOCONTAS'
      'ORDER BY P.CODIGO')
    Left = 137
    Top = 116
    object sqlPlanoContasKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPlanoContasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPlanoContasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlPlanoContasCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Required = True
      Size = 32
    end
    object sqlPlanoContasNOME: TStringField
      FieldName = 'NOME'
      Size = 64
    end
    object sqlPlanoContasATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasTIPO_PLANOCONTAS: TIntegerField
      FieldName = 'TIPO_PLANOCONTAS'
      Required = True
    end
    object sqlPlanoContasANALITICO_SINTETICO: TStringField
      FieldName = 'ANALITICO_SINTETICO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasDEVEDORA_CREDORA: TStringField
      FieldName = 'DEVEDORA_CREDORA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasFLUXOCAIXA: TStringField
      FieldName = 'FLUXOCAIXA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasTIPO_APRD: TStringField
      FieldName = 'TIPO_APRD'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasFIXA_VARIAVEL: TStringField
      FieldName = 'FIXA_VARIAVEL'
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasKMFIN_PLANOCONTA: TStringField
      FieldName = 'KMFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object sqlPlanoContasKDEF_PLANOCONTA: TStringField
      FieldName = 'KDEF_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object sqlPlanoContasMOVIMENTA_ESTOQUE: TStringField
      FieldName = 'MOVIMENTA_ESTOQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasHIDE_BY_USER: TStringField
      FieldName = 'HIDE_BY_USER'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasKEQV_PLANOCONTA: TStringField
      FieldName = 'KEQV_PLANOCONTA'
      FixedChar = True
    end
    object sqlPlanoContasCLASSIFICACAO_EQUIVALENTE: TStringField
      FieldName = 'CLASSIFICACAO_EQUIVALENTE'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlPlanoContasNOME_EQUIVALENTE: TStringField
      FieldName = 'NOME_EQUIVALENTE'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
  end
end
