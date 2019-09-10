object Zoo_ProducaoControleLeiteiroDatamodule2: TZoo_ProducaoControleLeiteiroDatamodule2
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsLotePesagem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'RETIRO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspLotePesagem'
    BeforeOpen = cdsLotePesagemBeforeOpen
    OnNewRecord = cdsLotePesagemNewRecord
    Left = 84
    Top = 20
    object cdsLotePesagemKZOO_LOTEPESAGEM_LEITE: TStringField
      FieldName = 'KZOO_LOTEPESAGEM_LEITE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsLotePesagemKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsLotePesagemDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
      OnValidate = cdsLotePesagemDATAValidate
    end
    object cdsLotePesagemNORD: TIntegerField
      FieldName = 'NORD'
    end
    object cdsLotePesagemTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object cdsLotePesagemPROCESSADO: TStringField
      FieldName = 'PROCESSADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsLotePesagemRETIRO: TStringField
      FieldName = 'RETIRO'
      Size = 32
    end
    object cdsLotePesagemsqlPesagens: TDataSetField
      DisplayLabel = 'Pesagens'
      FieldName = 'sqlPesagens'
    end
  end
  object cdsPesagens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLotePesagemsqlPesagens
    Params = <>
    BeforeScroll = cdsPesagensBeforeScroll
    OnCalcFields = cdsPesagensCalcFields
    Left = 197
    Top = 21
    object cdsPesagensKZOO_PESAGEM_LEITE: TStringField
      FieldName = 'KZOO_PESAGEM_LEITE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPesagensKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsPesagensKZOO_LOTEPESAGEM_LEITE: TStringField
      FieldName = 'KZOO_LOTEPESAGEM_LEITE'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPesagensKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object cdsPesagensKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object cdsPesagensDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsPesagensBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsPesagensBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsPesagensNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsPesagensORD1: TFloatField
      DisplayLabel = 'Ord. 1'
      FieldName = 'ORD1'
      OnValidate = cdsPesagensORD1Validate
      DisplayFormat = '#,0.0'
    end
    object cdsPesagensORD2: TFloatField
      DisplayLabel = 'Ord. 2'
      FieldName = 'ORD2'
      OnValidate = cdsPesagensORD1Validate
      DisplayFormat = '#,0.0'
    end
    object cdsPesagensORD3: TFloatField
      DisplayLabel = 'Ord. 3'
      FieldName = 'ORD3'
      OnValidate = cdsPesagensORD1Validate
      DisplayFormat = '#,0.0'
    end
    object cdsPesagensTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsPesagensTOTALGetText
      DisplayFormat = '#,0.0'
    end
    object cdsPesagensANIMAL_DOENTE: TStringField
      DisplayLabel = 'Doente'
      FieldName = 'ANIMAL_DOENTE'
      Required = True
      OnGetText = cdsPesagensANIMAL_DOENTEGetText
      FixedChar = True
      Size = 1
    end
    object cdsPesagensOBSERVACAO: TMemoField
      DisplayLabel = 'Obs.'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPesagensULTIMA_PESAGEM: TFloatField
      FieldName = 'ULTIMA_PESAGEM'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.0'
    end
    object cdsPesagensLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      OnValidate = cdsPesagensLOTEValidate
      Size = 32
    end
    object cdsPesagenstmpCalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'tmpCalc'
      Calculated = True
    end
  end
  object dspLotePesagem: TDataSetProvider
    DataSet = sqlLotePesagem
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspLotePesagemBeforeUpdateRecord
    OnGetTableName = dspLotePesagemGetTableName
    Left = 38
    Top = 65
  end
  object sqlPesagens: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLLotePesagem
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LOTEPESAGEM_LEITE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RETIRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RETIRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RETIRO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'SELECT '
      ' P.KZOO_PESAGEM_LEITE, '
      ' P.KCAD_FAZENDA,'
      ' P.KZOO_LOTEPESAGEM_LEITE,'
      ' P.KZOO_LACTACAO,'
      ' AF.KZOO_ANIMAL,'
      ' P.DATA,'
      ' P.ANIMAL_DOENTE,'
      ' AF.BRINCO,AF.BRINCO_,'
      ' AF.NOMEESTABULO, '
      ' P.LOTE,'
      ' P.ORD1, '
      ' P.ORD2, '
      ' P.ORD3, '
      ' P.TOTAL, '
      'P.ULTIMA_PESAGEM,'
      ' P.OBSERVACAO'
      'FROM ZOO_PESAGEM_LEITE P'
      
        'LEFT JOIN ZOO_LACTACOES L  ON ( L.KZOO_LACTACAO = P.KZOO_LACTACA' +
        'O )'
      
        'LEFT JOIN ZOO_ANIMAIS AF  ON ( AF.KZOO_ANIMAL = L.KZOO_ANIMAL_FE' +
        'MEA )'
      
        'LEFT JOIN ZOO_ANIMAIS_FEMEA DAF  ON ( DAF.KZOO_ANIMAL_FEMEA = AF' +
        '.KZOO_ANIMAL )'
      'WHERE P.KZOO_LOTEPESAGEM_LEITE = :KZOO_LOTEPESAGEM_LEITE'
      '      AND (   '
      '                     (:RETIRO IS NULL) '
      
        '               OR (CAST(:RETIRO AS VARCHAR(32)) = '#39#39' AND (( DAF.' +
        'RETIRO IS NULL ) OR (TRIM(DAF.RETIRO) = '#39#39')))'
      '              OR (TRIM(DAF.RETIRO) = :RETIRO)'
      '            )'
      'ORDER BY BRINCO_')
    Left = 200
    Top = 100
    object sqlPesagensKZOO_PESAGEM_LEITE: TStringField
      FieldName = 'KZOO_PESAGEM_LEITE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlPesagensKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlPesagensKZOO_LOTEPESAGEM_LEITE: TStringField
      FieldName = 'KZOO_LOTEPESAGEM_LEITE'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPesagensKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object sqlPesagensKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlPesagensDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlPesagensBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlPesagensBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlPesagensNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlPesagensORD1: TFloatField
      FieldName = 'ORD1'
      DisplayFormat = '#,0.0'
    end
    object sqlPesagensORD2: TFloatField
      FieldName = 'ORD2'
      DisplayFormat = '#,0.0'
    end
    object sqlPesagensORD3: TFloatField
      FieldName = 'ORD3'
      DisplayFormat = '#,0.0'
    end
    object sqlPesagensTOTAL: TFloatField
      FieldName = 'TOTAL'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.0'
    end
    object sqlPesagensANIMAL_DOENTE: TStringField
      FieldName = 'ANIMAL_DOENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPesagensOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlPesagensULTIMA_PESAGEM: TFloatField
      FieldName = 'ULTIMA_PESAGEM'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,0.0'
    end
    object sqlPesagensLOTE: TStringField
      FieldName = 'LOTE'
      Size = 32
    end
  end
  object sqlLotePesagem: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'RETIRO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'select  '
      ' DATA, '
      ' KCAD_FAZENDA, '
      ' KZOO_LOTEPESAGEM_LEITE, '
      ' NORD, '
      ' TOTAL,'
      ' PROCESSADO,'
      'CAST( :RETIRO AS VARCHAR( 32 ) ) RETIRO'
      'from ZOO_LOTEPESAGEM_LEITE'
      'WHERE KCAD_FAZENDA = :KCAD_FAZENDA'
      ' AND PROCESSADO = '#39'F'#39
      'ORDER BY DATA'
      'ROWS 1')
    Left = 84
    Top = 104
    object sqlLotePesagemKZOO_LOTEPESAGEM_LEITE: TStringField
      FieldName = 'KZOO_LOTEPESAGEM_LEITE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlLotePesagemKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlLotePesagemDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlLotePesagemNORD: TIntegerField
      FieldName = 'NORD'
    end
    object sqlLotePesagemTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object sqlLotePesagemPROCESSADO: TStringField
      FieldName = 'PROCESSADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlLotePesagemRETIRO: TStringField
      FieldName = 'RETIRO'
      Size = 32
    end
  end
  object dtsSQLLotePesagem: TDataSource
    DataSet = sqlLotePesagem
    Left = 148
    Top = 148
  end
  object SMImportFromXLS1: TSMImportFromXLS
    AbortOnProblem = True
    AnimatedStatus = False
    DataFormats.DateOrder = doDMY
    DataFormats.DateSeparator = '/'
    DataFormats.TimeSeparator = ':'
    DataFormats.FourDigitYear = True
    DataFormats.LeadingZerosInDate = True
    DataFormats.ThousandSeparator = '.'
    DataFormats.DecimalSeparator = ','
    DataFormats.CurrencyString = 'R$'
    DataFormats.BooleanTrue = 'True'
    DataFormats.BooleanFalse = 'False'
    DataFormats.UseRegionalSettings = False
    DataSet = cdsImport
    SQLOptions.SQLTerm = ';'
    Mappings.Strings = (
      'BRINCO=A'
      'ORD1=B'
      'ORD2=C'
      'ORD3=D')
    Options = [soExtendedStatistic, soUseAnimatedControl, soWaitCursor, soAutoCloseStatistic]
    Parameters = <>
    TitleStatus = 'Importing...'
    Statistic.TotalCount = 0
    Statistic.Result = irUnknown
    UseDisplayNames = False
    SourceFileName = 'SMImport.XLS'
    RowFirst = 2
    Left = 360
    Top = 20
  end
  object cdsImport: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 369
    Top = 97
    object cdsImportBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsImportORD1: TFloatField
      DisplayLabel = 'Ord. 1'
      FieldName = 'ORD1'
      OnValidate = cdsPesagensORD1Validate
    end
    object cdsImportORD2: TFloatField
      DisplayLabel = 'Ord. 2'
      FieldName = 'ORD2'
      OnValidate = cdsPesagensORD1Validate
    end
    object cdsImportORD3: TFloatField
      DisplayLabel = 'Ord. 3'
      FieldName = 'ORD3'
      OnValidate = cdsPesagensORD1Validate
    end
  end
  object cdsRetiros: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 24
    object cdsRetirosRETIRO: TStringField
      FieldName = 'RETIRO'
      Size = 32
    end
  end
end
