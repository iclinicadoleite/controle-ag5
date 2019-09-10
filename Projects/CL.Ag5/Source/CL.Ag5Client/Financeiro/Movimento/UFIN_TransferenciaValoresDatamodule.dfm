object dtmFIN_TransferenciaValores: TdtmFIN_TransferenciaValores
  OldCreateOrder = True
  Height = 274
  Width = 550
  object cdsLstTransferencias: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstTransferencias'
    BeforeOpen = cdsLstTransferenciasBeforeOpen
    OnNewRecord = cdsLstTransferenciasNewRecord
    Left = 55
    Top = 44
    object cdsLstTransferenciasKFIN_TRANSFERENCIA: TStringField
      FieldName = 'KFIN_TRANSFERENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstTransferenciasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Visible = False
      FixedChar = True
    end
    object cdsLstTransferenciasDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object cdsLstTransferenciasNOMECONTA_ORIGEM: TStringField
      DisplayLabel = 'Documento destino'
      FieldName = 'NOMECONTA_ORIGEM'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object cdsLstTransferenciasDOC_ORIGEM: TStringField
      DisplayLabel = 'Documento origem'
      FieldName = 'DOC_ORIGEM'
      Size = 32
    end
    object cdsLstTransferenciasNOMECONTA_DESTINO: TStringField
      DisplayLabel = 'Conta destino'
      FieldName = 'NOMECONTA_DESTINO'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object cdsLstTransferenciasDOC_DESTINO: TStringField
      DisplayLabel = 'Documento destino'
      FieldName = 'DOC_DESTINO'
      Size = 32
    end
    object cdsLstTransferenciasVALOR: TFloatField
      DisplayLabel = '1#,0.00'
      FieldName = 'VALOR'
    end
    object cdsLstTransferenciasSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      DisplayWidth = 32
      FieldName = 'SYS$UI'
      Size = 32
    end
    object cdsLstTransferenciasSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em '
      FieldName = 'SYS$DI'
    end
    object cdsLstTransferenciasSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      Size = 32
    end
    object cdsLstTransferenciasSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
    end
  end
  object cdsTransferencia: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_TRANSFERENCIA'
        ParamType = ptInput
      end>
    ProviderName = 'dspTransferencia'
    BeforePost = cdsTransferenciaBeforePost
    BeforeDelete = cdsTransferenciaBeforeDelete
    OnNewRecord = cdsTransferenciaNewRecord
    Left = 183
    Top = 44
    object cdsTransferenciaKFIN_TRANSFERENCIA: TStringField
      FieldName = 'KFIN_TRANSFERENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsTransferenciaKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      FixedChar = True
    end
    object cdsTransferenciaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsTransferenciaKFIN_CONTA_ORIGEM: TStringField
      FieldName = 'KFIN_CONTA_ORIGEM'
      Required = True
      FixedChar = True
    end
    object cdsTransferenciaNOMECONTA_ORIGEM: TStringField
      FieldName = 'NOMECONTA_ORIGEM'
      ProviderFlags = [pfInWhere]
      OnSetText = cdsTransferenciaNOMECONTA_ORIGEMSetText
      Size = 64
    end
    object cdsTransferenciaKFIN_CONTA_DESTINO: TStringField
      FieldName = 'KFIN_CONTA_DESTINO'
      Required = True
      FixedChar = True
    end
    object cdsTransferenciaNOMECONTA_DESTINO: TStringField
      FieldName = 'NOMECONTA_DESTINO'
      ProviderFlags = [pfInWhere]
      OnSetText = cdsTransferenciaNOMECONTA_DESTINOSetText
      Size = 64
    end
    object cdsTransferenciaDOC_ORIGEM: TStringField
      FieldName = 'DOC_ORIGEM'
      Size = 32
    end
    object cdsTransferenciaDOC_DESTINO: TStringField
      FieldName = 'DOC_DESTINO'
      Size = 32
    end
    object cdsTransferenciaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsTransferenciaOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsTransferenciaSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
  end
  object dspLstTransferencias: TDataSetProvider
    DataSet = sqlLstTransferencias
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object dspTransferencia: TDataSetProvider
    DataSet = sqlTransferencia
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 89
  end
  object sqlLstTransferencias: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select  '
      '  T.KFIN_TRANSFERENCIA,'
      '  T.KSYS$DOMAIN,'
      '  T.DATA, '
      '  CO.NOME NOMECONTA_ORIGEM,'
      '  T.DOC_ORIGEM, '
      '  CD.NOME NOMECONTA_DESTINO,'
      '  T.DOC_DESTINO, '
      '  T.VALOR,'
      '  T.OBS, '
      '  T.SYS$DI, '
      '  T.SYS$DU, '
      '  T.SYS$UI, '
      '  T.SYS$UU'
      'from FIN_TRANSFERENCIAS T'
      'LEFT JOIN FIN_CONTAS CO ON CO.KFIN_CONTA = T.KFIN_CONTA_ORIGEM'
      'LEFT JOIN FIN_CONTAS CD ON CD.KFIN_CONTA = T.KFIN_CONTA_DESTINO'
      'WHERE  T.KSYS$DOMAIN = :KSYS$DOMAIN')
    Left = 58
    Top = 133
    object sqlLstTransferenciasKFIN_TRANSFERENCIA: TStringField
      FieldName = 'KFIN_TRANSFERENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlLstTransferenciasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      FixedChar = True
    end
    object sqlLstTransferenciasDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlLstTransferenciasNOMECONTA_ORIGEM: TStringField
      DisplayLabel = 'Conta origem'
      FieldName = 'NOMECONTA_ORIGEM'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlLstTransferenciasDOC_ORIGEM: TStringField
      DisplayLabel = 'Documento origem'
      FieldName = 'DOC_ORIGEM'
      Size = 32
    end
    object sqlLstTransferenciasNOMECONTA_DESTINO: TStringField
      DisplayLabel = 'Conta destino'
      FieldName = 'NOMECONTA_DESTINO'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlLstTransferenciasDOC_DESTINO: TStringField
      DisplayLabel = 'Documento destino'
      FieldName = 'DOC_DESTINO'
      Size = 32
    end
    object sqlLstTransferenciasVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object sqlLstTransferenciasSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      Size = 32
    end
    object sqlLstTransferenciasSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
    end
    object sqlLstTransferenciasSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      Size = 32
    end
    object sqlLstTransferenciasSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
    end
  end
  object sqlTransferencia: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_TRANSFERENCIA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select  '
      '  T.KFIN_TRANSFERENCIA,'
      '  T.KSYS$DOMAIN,'
      '  T.DATA, '
      '  T.KFIN_CONTA_ORIGEM, '
      '  CO.NOME NOMECONTA_ORIGEM,'
      '  T.KFIN_CONTA_DESTINO, '
      '  CD.NOME NOMECONTA_DESTINO,'
      '  T.DOC_ORIGEM, '
      '  T.DOC_DESTINO, '
      '  T.VALOR,'
      '  T.OBS,'
      '  T.SYS$ORIGIN_TYPE'
      'from FIN_TRANSFERENCIAS T'
      'LEFT JOIN FIN_CONTAS CO ON CO.KFIN_CONTA = T.KFIN_CONTA_ORIGEM'
      'LEFT JOIN FIN_CONTAS CD ON CD.KFIN_CONTA = T.KFIN_CONTA_DESTINO'
      'WHERE  T.KFIN_TRANSFERENCIA = :KFIN_TRANSFERENCIA')
    Left = 178
    Top = 132
    object sqlTransferenciaKFIN_TRANSFERENCIA: TStringField
      FieldName = 'KFIN_TRANSFERENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlTransferenciaKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      FixedChar = True
    end
    object sqlTransferenciaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlTransferenciaKFIN_CONTA_ORIGEM: TStringField
      FieldName = 'KFIN_CONTA_ORIGEM'
      Required = True
      FixedChar = True
    end
    object sqlTransferenciaNOMECONTA_ORIGEM: TStringField
      FieldName = 'NOMECONTA_ORIGEM'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlTransferenciaDOC_ORIGEM: TStringField
      FieldName = 'DOC_ORIGEM'
      Size = 32
    end
    object sqlTransferenciaKFIN_CONTA_DESTINO: TStringField
      FieldName = 'KFIN_CONTA_DESTINO'
      Required = True
      FixedChar = True
    end
    object sqlTransferenciaNOMECONTA_DESTINO: TStringField
      FieldName = 'NOMECONTA_DESTINO'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlTransferenciaDOC_DESTINO: TStringField
      FieldName = 'DOC_DESTINO'
      Size = 32
    end
    object sqlTransferenciaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sqlTransferenciaSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
    object sqlTransferenciaOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsLstTransferencias: TDataSource
    DataSet = cdsLstTransferencias
    Left = 120
    Top = 8
  end
end
