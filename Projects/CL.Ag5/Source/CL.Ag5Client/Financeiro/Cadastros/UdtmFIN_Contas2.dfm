object dtmFIN_Contas2: TdtmFIN_Contas2
  OldCreateOrder = True
  Height = 274
  Width = 395
  object cdsLstContas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'SYS_TYPE'
        ParamType = ptInput
      end
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
    ProviderName = 'dspLstContas'
    BeforeOpen = cdsLstContasBeforeOpen
    OnNewRecord = cdsLstContasNewRecord
    Left = 55
    Top = 43
    object cdsLstContasKFIN_CONTA: TStringField
      DisplayWidth = 5
      FieldName = 'KFIN_CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstContasKSYSDOMAIN: TStringField
      DisplayWidth = 5
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstContasKFIN_BANCO: TStringField
      DisplayWidth = 5
      FieldName = 'KFIN_BANCO'
      Visible = False
      FixedChar = True
    end
    object cdsLstContasNOME: TStringField
      DisplayLabel = 'Nome da conta'
      DisplayWidth = 17
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object cdsLstContasCONTA_BANCARIA: TStringField
      DisplayWidth = 4
      FieldName = 'CONTA_BANCARIA'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsLstContasCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 6
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object cdsLstContasBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 34
      FieldName = 'BANCO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsLstContasAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      DisplayWidth = 9
      FieldName = 'AGENCIA'
      Size = 32
    end
    object cdsLstContasCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta corrente'
      DisplayWidth = 34
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
    object cdsLstContasDATA_SALDO: TSQLTimeStampField
      DisplayLabel = 'Data saldo'
      DisplayWidth = 9
      FieldName = 'DATA_SALDO'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLstContasSALDO_ATUAL: TFloatField
      DisplayLabel = 'Saldo atual'
      DisplayWidth = 9
      FieldName = 'SALDO_ATUAL'
      DisplayFormat = 'R$ #,0.00'
    end
    object cdsLstContasATIVA: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 6
      FieldName = 'ATIVA'
      Required = True
      OnGetText = cdsLstContasATIVAGetText
      FixedChar = True
      Size = 1
    end
    object cdsLstContasCONTA_FAVORITA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Conta Favorita'
      FieldName = 'CONTA_FAVORITA'
      OnGetText = cdsLstContasCONTA_FAVORITAGetText
      FixedChar = True
      Size = 1
    end
  end
  object cdsConta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_CONTA'
        ParamType = ptInput
      end>
    ProviderName = 'dspConta'
    BeforeInsert = cdsContaBeforeInsert
    OnNewRecord = cdsContaNewRecord
    Left = 183
    Top = 43
    object cdsContaKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsContaKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsContaKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      Visible = False
      FixedChar = True
    end
    object cdsContaCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cdsContaBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = []
      OnSetText = cdsContaBANCOSetText
      Size = 128
    end
    object cdsContaCONTA_BANCARIA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'CONTA_BANCARIA'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsContaAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Size = 32
    end
    object cdsContaNOME: TStringField
      DisplayLabel = 'Nome conta'
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object cdsContaCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta corrente'
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
    object cdsContaDATASALDOINICIAL: TSQLTimeStampField
      DisplayLabel = 'Data saldo inicial'
      FieldName = 'DATASALDOINICIAL'
      Required = True
    end
    object cdsContaSALDOINICIAL: TFloatField
      DisplayLabel = 'Saldo inicial'
      FieldName = 'SALDOINICIAL'
      Required = True
      OnValidate = cdsContaSALDOINICIALValidate
      DisplayFormat = '#,0.00'
    end
    object cdsContaSALDO_ATUAL: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Saldo atual'
      FieldName = 'SALDO_ATUAL'
      DisplayFormat = '#,0.00'
    end
    object cdsContaATIVA: TStringField
      DisplayLabel = 'Status'
      FieldName = 'ATIVA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspLstContas: TDataSetProvider
    DataSet = sqlLstContas
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 88
  end
  object dspConta: TDataSetProvider
    DataSet = sqlConta
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 88
  end
  object sqlLstContas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'SYS_TYPE'
        ParamType = ptInput
      end
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
      'SELECT'
      '  C.KFIN_CONTA,'
      '  C.KSYS$DOMAIN,'
      '  C.KFIN_BANCO,'
      '  B.CODIGO,'
      '  B.NOME BANCO,'
      '  C.CONTA_BANCARIA,'
      '  C.AGENCIA,'
      '  C.CONTA_CORRENTE,'
      '  C.NOME,'
      '  C.SALDO_ATUAL,'
      '  COALESCE( C.DATASALDOINICIAL, C.SYS$DI ) DATA_SALDO,'
      '  C.ATIVA,'
      '  IIF(T.SYS$VALUE IS NOT NULL, '#39'T'#39','#39'F'#39') "CONTA_FAVORITA"'
      'FROM FIN_CONTAS C'
      'LEFT JOIN FIN_BANCOS B ON B.KFIN_BANCO = C.KFIN_BANCO'
      
        'LEFT JOIN SYS$DOMAIN_TYPES T ON T.SYS$VALUE = C.KFIN_CONTA AND T' +
        '.SYS$TYPE = :SYS_TYPE'
      'WHERE C.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND ( :DSP_INATIVO = '#39'T'#39' OR C.ATIVA = '#39'T'#39' )')
    Left = 58
    Top = 132
    object sqlLstContasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstContasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstContasKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      Visible = False
      FixedChar = True
    end
    object sqlLstContasCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object sqlLstContasBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlLstContasCONTA_BANCARIA: TStringField
      FieldName = 'CONTA_BANCARIA'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlLstContasAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Size = 32
    end
    object sqlLstContasCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta corrente'
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
    object sqlLstContasNOME: TStringField
      DisplayLabel = 'Nome da conta'
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object sqlLstContasDATA_SALDO: TSQLTimeStampField
      DisplayLabel = 'Data saldo'
      FieldName = 'DATA_SALDO'
      Visible = False
    end
    object sqlLstContasSALDO_ATUAL: TFloatField
      DisplayLabel = 'Saldo atual'
      FieldName = 'SALDO_ATUAL'
    end
    object sqlLstContasATIVA: TStringField
      DisplayLabel = 'Status'
      FieldName = 'ATIVA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlLstContasCONTA_FAVORITA: TStringField
      DisplayLabel = 'Conta Favorita'
      FieldName = 'CONTA_FAVORITA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object sqlConta: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_CONTA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  C.KFIN_CONTA,'
      '  C.KSYS$DOMAIN,'
      '  C.KFIN_BANCO,'
      '  B.CODIGO,'
      '  B.NOME BANCO,'
      '  C.CONTA_BANCARIA,'
      '  C.AGENCIA,'
      '  C.CONTA_CORRENTE,'
      '  C.NOME,'
      '  C.SALDOINICIAL,'
      '  C.SALDO_ATUAL,'
      '  C.DATASALDOINICIAL,'
      '  C.ATIVA'
      'FROM FIN_CONTAS C'
      'LEFT JOIN FIN_BANCOS B ON B.KFIN_BANCO = C.KFIN_BANCO'
      'WHERE C.KFIN_CONTA = :KFIN_CONTA')
    Left = 178
    Top = 131
    object sqlContaKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlContaKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlContaKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      Visible = False
      FixedChar = True
    end
    object sqlContaCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object sqlContaBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = []
      Size = 128
    end
    object sqlContaCONTA_BANCARIA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'CONTA_BANCARIA'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlContaAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Size = 32
    end
    object sqlContaNOME: TStringField
      DisplayLabel = 'Nome conta'
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object sqlContaCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta corrente'
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
    object sqlContaDATASALDOINICIAL: TSQLTimeStampField
      DisplayLabel = 'Data saldo inicial'
      FieldName = 'DATASALDOINICIAL'
      Required = True
    end
    object sqlContaSALDOINICIAL: TFloatField
      DisplayLabel = 'Saldo inicial'
      FieldName = 'SALDOINICIAL'
      Required = True
    end
    object sqlContaSALDO_ATUAL: TFloatField
      DisplayLabel = 'Saldo atual'
      FieldName = 'SALDO_ATUAL'
    end
    object sqlContaATIVA: TStringField
      DisplayLabel = 'Status'
      FieldName = 'ATIVA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstContas
    Left = 120
    Top = 8
  end
end
