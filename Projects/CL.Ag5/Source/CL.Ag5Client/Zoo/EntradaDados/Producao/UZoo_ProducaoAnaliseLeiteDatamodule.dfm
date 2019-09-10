object Zoo_ProducaoAnaliseLeiteDatamodule: TZoo_ProducaoAnaliseLeiteDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 469
  object cdsLotes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspLotes'
    Left = 97
    Top = 17
    object cdsLotesKZOO_LOTEPESAGEM_LEITE: TStringField
      FieldName = 'KZOO_LOTEPESAGEM_LEITE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLotesDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object cdsLotessqlPesagens: TDataSetField
      DisplayLabel = 'Pesagens'
      FieldName = 'sqlPesagens'
      Visible = False
    end
  end
  object sqlLotes: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT KZOO_LOTEPESAGEM_LEITE, DATA'#13#10'FROM ('#13#10'  SELECT KZOO_LOTEP' +
      'ESAGEM_LEITE, DATA'#13#10'  FROM (SELECT KZOO_LOTEPESAGEM_LEITE, DATA ' +
      'FROM ZOO_LOTEPESAGEM_LEITE'#13#10'        WHERE KCAD_FAZENDA = :KCAD_F' +
      'AZENDA'#13#10'           AND DATA <= :DATA'#13#10'        ORDER BY DATA DESC' +
      #13#10'        ROWS 3)'#13#10'  UNION ALL'#13#10'  SELECT KZOO_LOTEPESAGEM_LEITE,' +
      ' DATA'#13#10'  FROM (SELECT KZOO_LOTEPESAGEM_LEITE, DATA'#13#10'        FROM' +
      ' ZOO_LOTEPESAGEM_LEITE'#13#10'        WHERE KCAD_FAZENDA = :KCAD_FAZEN' +
      'DA'#13#10'           AND DATA > :DATA'#13#10'        ORDER BY DATA'#13#10'        ' +
      'ROWS 1)'#13#10')'#13#10'ORDER BY DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 99
    Top = 104
    object sqlLotesKZOO_LOTEPESAGEM_LEITE: TStringField
      FieldName = 'KZOO_LOTEPESAGEM_LEITE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlLotesDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
  end
  object dspLotes: TDataSetProvider
    DataSet = sqlLotes
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 62
    Top = 65
  end
  object sqlAnalises: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'select  '#13#10' KZOO_PESAGEM_LEITE, '#13#10' KZOO_LACTACAO, '#13#10' DATA,'#13#10' LACT' +
      'OSE,'#13#10' GORDURA, '#13#10' PROTEINA, '#13#10' SOLIDOS_TOTAIS, '#13#10' CCS,  '#13#10' ESD,' +
      ' '#13#10' UREIA'#13#10'from ZOO_PESAGEM_LEITE_ANALISE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 383
    Top = 136
    object sqlAnalisesKZOO_PESAGEM_LEITE: TStringField
      FieldName = 'KZOO_PESAGEM_LEITE'
      Required = True
      FixedChar = True
    end
    object sqlAnalisesKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object sqlAnalisesDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlAnalisesLACTOSE: TFloatField
      FieldName = 'LACTOSE'
    end
    object sqlAnalisesGORDURA: TFloatField
      FieldName = 'GORDURA'
    end
    object sqlAnalisesPROTEINA: TFloatField
      FieldName = 'PROTEINA'
    end
    object sqlAnalisesSOLIDOS_TOTAIS: TFloatField
      FieldName = 'SOLIDOS_TOTAIS'
    end
    object sqlAnalisesCCS: TIntegerField
      FieldName = 'CCS'
    end
    object sqlAnalisesESD: TFloatField
      FieldName = 'ESD'
    end
    object sqlAnalisesUREIA: TFloatField
      FieldName = 'UREIA'
    end
  end
  object cdsAnalises: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLoteAnaliseANALISES
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 374
    Top = 16
    object cdsAnalisesBRINCO: TStringField
      FieldName = 'BRINCO'
      Required = True
      FixedChar = True
    end
    object cdsAnalisesLACTOSE: TFloatField
      FieldName = 'LACTOSE'
      DisplayFormat = '0.00;; '
    end
    object cdsAnalisesGORDURA: TFloatField
      FieldName = 'GORDURA'
      DisplayFormat = '0.00;; '
    end
    object cdsAnalisesPROTEINA: TFloatField
      FieldName = 'PROTEINA'
      DisplayFormat = '0.00;; '
    end
    object cdsAnalisesSOLIDOS_TOTAIS: TFloatField
      FieldName = 'SOLIDOS_TOTAIS'
      DisplayFormat = '0.00;; '
    end
    object cdsAnalisesCCS: TIntegerField
      FieldName = 'CCS'
      DisplayFormat = '0'
    end
    object cdsAnalisesESD: TFloatField
      FieldName = 'ESD'
      DisplayFormat = '0.00;; '
    end
    object cdsAnalisesUREIA: TFloatField
      FieldName = 'UREIA'
      DisplayFormat = '0.00;; '
    end
  end
  object cdsLoteAnalise: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 297
    Top = 16
    object cdsLoteAnaliseKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
    end
    object cdsLoteAnaliseDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object cdsLoteAnaliseANALISES: TDataSetField
      DisplayLabel = 'An'#225'lises'
      FieldName = 'ANALISES'
    end
  end
  object cdsPesagens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLotessqlPesagens
    Params = <>
    Left = 161
    Top = 17
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
      Visible = False
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
      Visible = False
      FixedChar = True
    end
    object cdsPesagensKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
    end
    object cdsPesagensDATALACTACAO: TSQLTimeStampField
      DisplayLabel = 'Data lacta'#231#227'o'
      FieldName = 'DATALACTACAO'
      Required = True
    end
    object cdsPesagensBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsPesagensBRINCO_: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO_'
      ProviderFlags = []
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
      DisplayFormat = '#,0.0'
    end
    object cdsPesagensORD2: TFloatField
      DisplayLabel = 'Ord. 2'
      FieldName = 'ORD2'
      DisplayFormat = '#,0.0'
    end
    object cdsPesagensORD3: TFloatField
      DisplayLabel = 'Ord. 3'
      FieldName = 'ORD3'
      DisplayFormat = '#,0.0'
    end
    object cdsPesagensTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.0'
    end
    object cdsPesagensGORDURA: TFloatField
      DisplayLabel = '% Gordura'
      FieldKind = fkLookup
      FieldName = 'GORDURA'
      LookupDataSet = cdsAnalises
      LookupKeyFields = 'BRINCO'
      LookupResultField = 'GORDURA'
      KeyFields = 'BRINCO'
      DisplayFormat = '#,0.0'
      Lookup = True
    end
    object cdsPesagensLACTOSE: TFloatField
      DisplayLabel = '% Lactose'
      FieldKind = fkLookup
      FieldName = 'LACTOSE'
      LookupDataSet = cdsAnalises
      LookupKeyFields = 'BRINCO'
      LookupResultField = 'LACTOSE'
      KeyFields = 'BRINCO'
      DisplayFormat = '#,0.0'
      Lookup = True
    end
    object cdsPesagensPROTEINA: TFloatField
      DisplayLabel = '% Proteina'
      FieldKind = fkLookup
      FieldName = 'PROTEINA'
      LookupDataSet = cdsAnalises
      LookupKeyFields = 'BRINCO'
      LookupResultField = 'PROTEINA'
      KeyFields = 'BRINCO'
      DisplayFormat = '#,0.0'
      Lookup = True
    end
    object cdsPesagensSOLIDOS_TOTAIS: TFloatField
      DisplayLabel = '% S'#243'lidos totais'
      FieldKind = fkLookup
      FieldName = 'SOLIDOS_TOTAIS'
      LookupDataSet = cdsAnalises
      LookupKeyFields = 'BRINCO'
      LookupResultField = 'SOLIDOS_TOTAIS'
      KeyFields = 'BRINCO'
      DisplayFormat = '#,0.0'
      Lookup = True
    end
    object cdsPesagensESD: TFloatField
      DisplayLabel = '% ESD'
      FieldKind = fkLookup
      FieldName = 'ESD'
      LookupDataSet = cdsAnalises
      LookupKeyFields = 'BRINCO'
      LookupResultField = 'ESD'
      KeyFields = 'BRINCO'
      DisplayFormat = '#,0.0'
      Lookup = True
    end
    object cdsPesagensCCS: TFloatField
      FieldKind = fkLookup
      FieldName = 'CCS'
      LookupDataSet = cdsAnalises
      LookupKeyFields = 'BRINCO'
      LookupResultField = 'CCS'
      KeyFields = 'BRINCO'
      DisplayFormat = '#,0'
      Lookup = True
    end
    object cdsPesagensUREIA: TFloatField
      FieldKind = fkLookup
      FieldName = 'UREIA'
      LookupDataSet = cdsAnalises
      LookupKeyFields = 'BRINCO'
      LookupResultField = 'UREIA'
      KeyFields = 'BRINCO'
      DisplayFormat = '#,0.0'
      Lookup = True
    end
  end
  object sqlPesagens: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' P.KZOO_PESAGEM_LEITE, '#13#10' P.KCAD_FAZENDA,'#13#10' P.KZOO_LOTE' +
      'PESAGEM_LEITE,'#13#10' P.KZOO_LACTACAO,'#13#10' P.DATALACTACAO,'#13#10' AF.KZOO_AN' +
      'IMAL,'#13#10' AF.BRINCO,'#13#10' AF.BRINCO_,'#13#10' AF.NOMEESTABULO, '#13#10' P.ORD1, '#13 +
      #10' P.ORD2, '#13#10' P.ORD3, '#13#10' P.TOTAL'#13#10'FROM ZOO_PESAGEM_LEITE P'#13#10'LEFT ' +
      'JOIN ZOO_ANIMAIS AF  ON ( AF.KZOO_ANIMAL = P.KZOO_ANIMAL_FEMEA )' +
      #13#10'WHERE P.KZOO_LOTEPESAGEM_LEITE = :KZOO_LOTEPESAGEM_LEITE'#13#10'ORDE' +
      'R BY AF.BRINCO_'
    DataSource = dtsSQLLotePesagem
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LOTEPESAGEM_LEITE'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 164
    Top = 104
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
    object sqlPesagensDATALACTACAO: TSQLTimeStampField
      DisplayLabel = 'Data lacta'#231#227'o'
      FieldName = 'DATALACTACAO'
      Required = True
    end
    object sqlPesagensBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlPesagensBRINCO_: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO_'
      ProviderFlags = []
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
      DisplayFormat = '#,0.0'
    end
  end
  object dtsSQLLotePesagem: TDataSource
    DataSet = sqlLotes
    Left = 127
    Top = 148
  end
  object SMImportAnalises: TSMImportFromXLS
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
    DataSet = cdsAnalises
    SQLOptions.SQLTerm = ';'
    Mappings.Strings = (
      'BRINCO=A'
      'LACTOSE=B'
      'GORDURA=C'
      'PROTEINA=D'
      'SOLIDOS_TOTAIS=E'
      'CCS=F'
      'ESD=G'
      'UREIA=H')
    Options = [soExtendedStatistic, soUseAnimatedControl, soWaitCursor, soAutoCloseStatistic]
    Parameters = <>
    TitleStatus = 'Importing...'
    Statistic.TotalCount = 0
    Statistic.Result = irUnknown
    UseDisplayNames = False
    SourceFileName = 'SMImport.XLS'
    RowFirst = 3
    RowFieldNames = 2
    Left = 387
    Top = 81
  end
  object cdsImport: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 297
    Top = 185
    object cdsImportBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsImportORD1: TFloatField
      DisplayLabel = 'Ord. 1'
      FieldName = 'ORD1'
    end
    object cdsImportORD2: TFloatField
      DisplayLabel = 'Ord. 2'
      FieldName = 'ORD2'
    end
    object cdsImportORD3: TFloatField
      DisplayLabel = 'Ord. 3'
      FieldName = 'ORD3'
    end
  end
  object SMImportLote: TSMImportFromXLS
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
    DataSet = cdsLoteAnalise
    SQLOptions.SQLTerm = ';'
    Mappings.Strings = (
      'DATA=B')
    Options = [soExtendedStatistic, soUseAnimatedControl, soWaitCursor, soAutoCloseStatistic]
    Parameters = <>
    TitleStatus = 'Importing...'
    Statistic.TotalCount = 0
    Statistic.Result = irUnknown
    UseDisplayNames = False
    SourceFileName = 'SMImport.XLS'
    RowLast = 1
    RowFieldNames = 0
    Left = 299
    Top = 81
  end
end
