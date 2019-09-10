object Zoo_BancoDadosTanquesDatamodule: TZoo_BancoDadosTanquesDatamodule
  OldCreateOrder = True
  Height = 274
  Width = 550
  object cdsLstTanques: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstTanques'
    BeforeOpen = cdsLstTanquesBeforeOpen
    OnNewRecord = cdsLstTanquesNewRecord
    Left = 55
    Top = 44
    object cdsLstTanquesKZOO_TANQUE: TStringField
      FieldName = 'KZOO_TANQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstTanquesCODIGOTANQUE: TStringField
      DisplayLabel = 'Tanque'
      FieldName = 'CODIGOTANQUE'
      Size = 15
    end
    object cdsLstTanquesSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstTanquesSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object cdsLstTanquesSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstTanquesSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object cdsTanque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTanque'
    OnNewRecord = cdsTanqueNewRecord
    Left = 183
    Top = 44
    object cdsTanqueKZOO_TANQUE: TStringField
      FieldName = 'KZOO_TANQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsTanqueKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsTanqueCODIGOTANQUE: TStringField
      DisplayLabel = 'Tanque'
      FieldName = 'CODIGOTANQUE'
      Size = 15
    end
    object cdsTanqueSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsTanqueSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object cdsTanqueSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsTanqueSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
    object cdsTanquesqlAnalises: TDataSetField
      FieldName = 'sqlAnalises'
    end
  end
  object dspLstTanques: TDataSetProvider
    DataSet = sqlLstTanques
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 89
  end
  object dspTanque: TDataSetProvider
    DataSet = sqlTanque
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 89
  end
  object sqlLstTanques: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' KZOO_TANQUE, '#13#10' CODIGOTANQUE, '#13#10' SYS$UI, '#13#10' SYS$DI, '#13#10 +
      ' SYS$UU,'#13#10' SYS$DU '#13#10'FROM ZOO_TANQUES'#13#10'WHERE KCAD_FAZENDA = :KCAD' +
      '_FAZENDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 58
    Top = 133
    object sqlLstTanquesKZOO_TANQUE: TStringField
      FieldName = 'KZOO_TANQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstTanquesCODIGOTANQUE: TStringField
      FieldName = 'CODIGOTANQUE'
      Size = 15
    end
    object sqlLstTanquesSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstTanquesSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object sqlLstTanquesSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstTanquesSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object sqlTanque: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' KZOO_TANQUE, '#13#10' KCAD_FAZENDA,'#13#10' CODIGOTANQUE, '#13#10' SYS$U' +
      'I, '#13#10' SYS$DI, '#13#10' SYS$UU,'#13#10' SYS$DU '#13#10'FROM ZOO_TANQUES'#13#10'WHERE KZOO' +
      '_TANQUE = :KZOO_TANQUE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TANQUE'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 178
    Top = 132
    object sqlTanqueKZOO_TANQUE: TStringField
      FieldName = 'KZOO_TANQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlTanqueKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlTanqueCODIGOTANQUE: TStringField
      FieldName = 'CODIGOTANQUE'
      Size = 15
    end
    object sqlTanqueSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlTanqueSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object sqlTanqueSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlTanqueSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object dtsLstTanques: TDataSource
    DataSet = cdsLstTanques
    Left = 120
    Top = 8
  end
  object sqlAnalises: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' KZOO_TANQUE_ANALISE, '#13#10' KZOO_TANQUE,  '#13#10' DATA, '#13#10' CCS,' +
      ' '#13#10' ESD, '#13#10' GORDURA, '#13#10' LACTOSE, '#13#10' PROTEINA, '#13#10' SOLIDOS_TOTAIS,' +
      #13#10' UREIA,'#13#10' CBT,'#13#10' SYS$DI, '#13#10' SYS$UI, '#13#10' SYS$UU, '#13#10' SYS$DU '#13#10'FRO' +
      'M ZOO_TANQUE_ANALISES'#13#10'WHERE KZOO_TANQUE = :KZOO_TANQUE'#13#10'ORDER B' +
      'Y DATA DESC'
    DataSource = dtsSQLTanque
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TANQUE'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 272
    Top = 132
    object sqlAnalisesKZOO_TANQUE_ANALISE: TStringField
      FieldName = 'KZOO_TANQUE_ANALISE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlAnalisesKZOO_TANQUE: TStringField
      FieldName = 'KZOO_TANQUE'
      Required = True
      FixedChar = True
    end
    object sqlAnalisesDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object sqlAnalisesGORDURA: TFloatField
      DisplayLabel = '% G'
      FieldName = 'GORDURA'
      DisplayFormat = '#,0.00'
    end
    object sqlAnalisesPROTEINA: TFloatField
      DisplayLabel = '% P'
      FieldName = 'PROTEINA'
      DisplayFormat = '#,0.00'
    end
    object sqlAnalisesLACTOSE: TFloatField
      DisplayLabel = '% L'
      FieldName = 'LACTOSE'
      DisplayFormat = '#,0.00'
    end
    object sqlAnalisesSOLIDOS_TOTAIS: TFloatField
      DisplayLabel = '% ST'
      FieldName = 'SOLIDOS_TOTAIS'
      DisplayFormat = '#,0.00'
    end
    object sqlAnalisesESD: TFloatField
      DisplayLabel = '% ESD'
      FieldName = 'ESD'
      DisplayFormat = '#,0.00'
    end
    object sqlAnalisesCCS: TIntegerField
      FieldName = 'CCS'
      DisplayFormat = '#,0'
    end
    object sqlAnalisesCBT: TIntegerField
      FieldName = 'CBT'
      DisplayFormat = '#,0'
    end
    object sqlAnalisesUREIA: TFloatField
      DisplayLabel = 'NU'
      FieldName = 'UREIA'
      DisplayFormat = '#,0.00'
    end
    object sqlAnalisesSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlAnalisesSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object sqlAnalisesSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlAnalisesSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object dtsSQLTanque: TDataSource
    DataSet = sqlTanque
    Left = 219
    Top = 179
  end
  object cdsAnalises: TClientDataSet
    Aggregates = <>
    DataSetField = cdsTanquesqlAnalises
    Params = <>
    OnNewRecord = cdsAnalisesNewRecord
    Left = 270
    Top = 45
    object cdsAnalisesKZOO_TANQUE_ANALISE: TStringField
      FieldName = 'KZOO_TANQUE_ANALISE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAnalisesKZOO_TANQUE: TStringField
      FieldName = 'KZOO_TANQUE'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAnalisesDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsAnalisesGORDURA: TFloatField
      DisplayLabel = '% G'
      FieldName = 'GORDURA'
      DisplayFormat = '#,0.00'
    end
    object cdsAnalisesPROTEINA: TFloatField
      DisplayLabel = '% P'
      FieldName = 'PROTEINA'
      DisplayFormat = '#,0.00'
    end
    object cdsAnalisesLACTOSE: TFloatField
      DisplayLabel = '% L'
      FieldName = 'LACTOSE'
      DisplayFormat = '#,0.00'
    end
    object cdsAnalisesSOLIDOS_TOTAIS: TFloatField
      DisplayLabel = '% ST'
      FieldName = 'SOLIDOS_TOTAIS'
      DisplayFormat = '#,0.00'
    end
    object cdsAnalisesESD: TFloatField
      DisplayLabel = '% ESD'
      FieldName = 'ESD'
      DisplayFormat = '#,0.00'
    end
    object cdsAnalisesCCS: TIntegerField
      FieldName = 'CCS'
      DisplayFormat = '#,0'
    end
    object cdsAnalisesCBT: TIntegerField
      FieldName = 'CBT'
      DisplayFormat = '#,0'
    end
    object cdsAnalisesUREIA: TFloatField
      DisplayLabel = 'NU'
      FieldName = 'UREIA'
      DisplayFormat = '#,0.00'
    end
    object cdsAnalisesSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsAnalisesSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object cdsAnalisesSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsAnalisesSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object cdsAnalisesPeriodo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TANQUE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnalisesPeriodo'
    Left = 439
    Top = 34
    object cdsAnalisesPeriodoDEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DEL'
    end
    object cdsAnalisesPeriodoLACTOSE: TFloatField
      FieldName = 'LACTOSE'
    end
    object cdsAnalisesPeriodoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object cdsAnalisesPeriodoGORDURA: TFloatField
      FieldName = 'GORDURA'
    end
    object cdsAnalisesPeriodoPROTEINA: TFloatField
      FieldName = 'PROTEINA'
    end
    object cdsAnalisesPeriodoCCS: TIntegerField
      FieldName = 'CCS'
    end
    object cdsAnalisesPeriodoCBT: TIntegerField
      FieldName = 'CBT'
      DisplayFormat = '#,0.00'
    end
    object cdsAnalisesPeriodoUREIA: TFloatField
      FieldName = 'UREIA'
    end
    object cdsAnalisesPeriodoST: TFloatField
      FieldName = 'ST'
    end
    object cdsAnalisesPeriodoESD: TFloatField
      FieldName = 'ESD'
    end
  end
  object dspAnalisesPeriodo: TDataSetProvider
    DataSet = sqlAnalisesPeriodo
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 400
    Top = 66
  end
  object sqlAnalisesPeriodo: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  T.DATA, '#13#10'  T.LACTOSE, '#13#10'  T.GORDURA, '#13#10'  T.PROTEINA, ' +
      #13#10'  T.CCS,'#13#10'  T.CBT,'#13#10'  T.UREIA, '#13#10'  T.SOLIDOS_TOTAIS ST,'#13#10'  T.E' +
      'SD'#13#10'from ZOO_TANQUE_ANALISES T'#13#10'WHERE T.KZOO_TANQUE = :KZOO_TANQ' +
      'UE'#13#10'ORDER BY T.DATA DESC'#13#10'ROWS :ROWS'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_TANQUE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ROWS'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 439
    Top = 90
    object sqlAnalisesPeriodoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlAnalisesPeriodoLACTOSE: TFloatField
      FieldName = 'LACTOSE'
    end
    object sqlAnalisesPeriodoGORDURA: TFloatField
      FieldName = 'GORDURA'
    end
    object sqlAnalisesPeriodoPROTEINA: TFloatField
      FieldName = 'PROTEINA'
    end
    object sqlAnalisesPeriodoCCS: TIntegerField
      FieldName = 'CCS'
    end
    object sqlAnalisesPeriodoCBT: TIntegerField
      FieldName = 'CBT'
      DisplayFormat = '#,0.00'
    end
    object sqlAnalisesPeriodoUREIA: TFloatField
      FieldName = 'UREIA'
    end
    object sqlAnalisesPeriodoST: TFloatField
      FieldName = 'ST'
    end
    object sqlAnalisesPeriodoESD: TFloatField
      FieldName = 'ESD'
    end
  end
end
