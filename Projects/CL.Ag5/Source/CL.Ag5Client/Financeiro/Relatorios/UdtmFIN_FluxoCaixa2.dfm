object dtmFIN_FluxoCaixa2: TdtmFIN_FluxoCaixa2
  OldCreateOrder = False
  OnCreate = dtmFluxoCreate
  OnDestroy = dtmFluxoDestroy
  Height = 255
  Width = 465
  object cdsFluxo: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 44
    Top = 168
    object cdsFluxoTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Visible = False
    end
    object cdsFluxoDATA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
      DisplayFormat = 'dd/mmm/yyyy'
    end
    object cdsFluxoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 128
    end
    object cdsFluxoCREDITO: TFloatField
      DisplayLabel = 'Cr'#233'dito'
      FieldName = 'CREDITO'
      DisplayFormat = '#,0.00 ;#,0.00 ;-         '
    end
    object cdsFluxoDEBITO: TFloatField
      DisplayLabel = 'D'#233'bito'
      FieldName = 'DEBITO'
      DisplayFormat = '#,0.00 ;#,0.00 ;-         '
    end
    object cdsFluxoSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      DisplayFormat = '#,0.00 ;(#,0.00) ;-'
    end
  end
  object cdsSumarioAtraso: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 136
    Top = 164
    object cdsSumarioAtrasoTIPO: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Visible = False
      OnGetText = cdsSumarioAtrasoTIPOGetText
    end
    object cdsSumarioAtrasoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 128
    end
    object cdsSumarioAtrasoCREDITO: TFloatField
      DisplayLabel = 'Cr'#233'dito'
      FieldName = 'CREDITO'
      DisplayFormat = '#,0.00 ;#,0.00 ;-         '
    end
    object cdsSumarioAtrasoDEBITO: TFloatField
      DisplayLabel = 'D'#233'bito'
      FieldName = 'DEBITO'
      DisplayFormat = '#,0.00 ;#,0.00 ;-         '
    end
    object cdsSumarioAtrasoSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      DisplayFormat = '#,0.00 ;(#,0.00) ;-         '
    end
  end
  object cdsContas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 164
    object cdsContasNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 64
    end
    object cdsContasSALDOCC: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDOCC'
      DisplayFormat = '#,0.00 ;(#,0.00) ;- '
    end
  end
  object cdsLstContas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstContas'
    BeforeOpen = cdsLstContasBeforeOpen
    OnCalcFields = cdsLstContasCalcFields
    Left = 51
    Top = 5
    object cdsLstContasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Required = True
      FixedChar = True
    end
    object cdsLstContasKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      FixedChar = True
    end
    object cdsLstContasSELECT: TIntegerField
      DisplayLabel = 'Selecionar'
      FieldKind = fkInternalCalc
      FieldName = 'SELECT'
      OnGetText = cdsLstContasSELECTGetText
    end
    object cdsLstContasNOME: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOME'
      ReadOnly = True
      Size = 64
    end
    object cdsLstContasBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ReadOnly = True
      Size = 134
    end
    object cdsLstContasAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ReadOnly = True
      Size = 32
    end
    object cdsLstContasCONTA_CORRENTE: TStringField
      DisplayLabel = 'N'#250'mero da conta'
      FieldName = 'CONTA_CORRENTE'
      ReadOnly = True
      Size = 128
    end
  end
  object dspLstContas: TDataSetProvider
    DataSet = sqlLstContas
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 19
    Top = 53
  end
  object sqlLstContas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  C.KFIN_CONTA,'
      '  C.KFIN_BANCO,'
      '  C.NOME,'
      '  B.CODIGO || '#39' - '#39' ||  B.NOME BANCO,'
      '  C.AGENCIA,'
      '  C.CONTA_CORRENTE'
      'FROM FIN_CONTAS C'
      'LEFT JOIN FIN_BANCOS B ON B.KFIN_BANCO = C.KFIN_BANCO'
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND C.ATIVA = '#39'T'#39)
    Left = 55
    Top = 99
    object sqlLstContasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Required = True
      FixedChar = True
    end
    object sqlLstContasKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      FixedChar = True
    end
    object sqlLstContasNOME: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object sqlLstContasBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 134
    end
    object sqlLstContasAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Size = 32
    end
    object sqlLstContasCONTA_CORRENTE: TStringField
      DisplayLabel = 'N'#250'mero da conta'
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
  end
end
