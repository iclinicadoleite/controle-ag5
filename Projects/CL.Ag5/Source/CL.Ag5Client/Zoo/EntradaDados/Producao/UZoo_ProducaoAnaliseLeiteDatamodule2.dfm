object Zoo_ProducaoAnaliseLeiteDatamodule: TZoo_ProducaoAnaliseLeiteDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 469
  object cdsRetiros: TClientDataSet
    PersistDataPacket.Data = {
      350000009619E0BD010000001800000001000000000003000000350006524554
      49524F01004900000001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 316
    Top = 16
    object cdsRetirosRETIRO: TStringField
      FieldName = 'RETIRO'
      Size = 32
    end
  end
  object cdsAnalises: TClientDataSet
    PersistDataPacket.Data = {
      D30100009619E0BD020000001800000011000000000003000000D301124B5A4F
      4F5F5045534147454D5F4C454954450100490000000100055749445448020002
      001400114B5A4F4F5F414E494D414C5F46454D45410100490000000100055749
      4454480200020014000D4B5A4F4F5F4C4143544143414F010049000000010005
      57494454480200020014000C444154414C4143544143414F1000110000000100
      0753554254595045020049000A00466F726D6174746564000444415441100011
      00000001000753554254595045020049000A00466F726D617474656400064252
      494E434F0100490000000100055749445448020002000F000343435308000400
      0000000007474F524455524108000400000000000850524F5445494E41080004
      0000000000074C4143544F534508000400000000000E534F4C49444F535F544F
      5441495308000400000000000555524549410800040000000000034553440800
      040000000000034F425304004B00000001000753554254595045020049000500
      5465787400074252494E434F5F01004900000001000557494454480200020010
      0009494D504F525441444F01004900000001000557494454480200020001000D
      494E534552545F5245434F524404000100000000000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'KZOO_PESAGEM_LEITE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_ANIMAL_FEMEA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_LACTACAO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATALACTACAO'
        DataType = ftTimeStamp
      end
      item
        Name = 'DATA'
        DataType = ftTimeStamp
      end
      item
        Name = 'BRINCO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CCS'
        DataType = ftFloat
      end
      item
        Name = 'GORDURA'
        DataType = ftFloat
      end
      item
        Name = 'PROTEINA'
        DataType = ftFloat
      end
      item
        Name = 'LACTOSE'
        DataType = ftFloat
      end
      item
        Name = 'SOLIDOS_TOTAIS'
        DataType = ftFloat
      end
      item
        Name = 'UREIA'
        DataType = ftFloat
      end
      item
        Name = 'ESD'
        DataType = ftFloat
      end
      item
        Name = 'OBS'
        DataType = ftMemo
      end
      item
        Name = 'BRINCO_'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'IMPORTADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'INSERT_RECORD'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforePost = cdsAnalisesBeforePost
    Left = 384
    Top = 152
    object cdsAnalisesKZOO_PESAGEM_LEITE: TStringField
      FieldName = 'KZOO_PESAGEM_LEITE'
    end
    object cdsAnalisesKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsAnalisesKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Visible = False
    end
    object cdsAnalisesDATALACTACAO: TSQLTimeStampField
      FieldName = 'DATALACTACAO'
      Visible = False
    end
    object cdsAnalisesDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Visible = False
    end
    object cdsAnalisesBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsAnalisesCCS: TFloatField
      FieldName = 'CCS'
      DisplayFormat = '#,##0'
    end
    object cdsAnalisesGORDURA: TFloatField
      DisplayLabel = 'Gordura'
      FieldName = 'GORDURA'
      DisplayFormat = '0.00;;'
    end
    object cdsAnalisesPROTEINA: TFloatField
      DisplayLabel = 'Prote'#237'na'
      FieldName = 'PROTEINA'
      DisplayFormat = '0.00;;'
    end
    object cdsAnalisesLACTOSE: TFloatField
      DisplayLabel = 'Lactose'
      FieldName = 'LACTOSE'
      DisplayFormat = '0.00;; '
    end
    object cdsAnalisesSOLIDOS_TOTAIS: TFloatField
      DisplayLabel = 'S'#243'lidos totais'
      FieldName = 'SOLIDOS_TOTAIS'
      DisplayFormat = '0.00;;'
    end
    object cdsAnalisesUREIA: TFloatField
      DisplayLabel = 'NU'
      FieldName = 'UREIA'
      DisplayFormat = '0.0;;'
    end
    object cdsAnalisesESD: TFloatField
      FieldName = 'ESD'
      Visible = False
      DisplayFormat = '0.00;;'
    end
    object cdsAnalisesOBS: TMemoField
      DisplayLabel = 'Obs.'
      FieldName = 'OBS'
      BlobType = ftMemo
    end
    object cdsAnalisesBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsAnalisesIMPORTADO: TStringField
      FieldName = 'IMPORTADO'
      Visible = False
      Size = 1
    end
    object cdsAnalisesINSERT_RECORD: TIntegerField
      FieldName = 'INSERT_RECORD'
    end
    object cdsAnalisesSOMA_INSERT_RECORDS: TAggregateField
      FieldName = 'SOMA_INSERT_RECORDS'
      Active = True
      DisplayName = ''
      Expression = 'SUM(INSERT_RECORD)'
    end
  end
  object cdsImportAnalises: TClientDataSet
    PersistDataPacket.Data = {
      640100009619E0BD02000000180000000D0000000000030000006401124B5A4F
      4F5F5045534147454D5F4C454954450100490000000100055749445448020002
      001400114B5A4F4F5F414E494D414C5F46454D45410100490000000100055749
      4454480200020014000D4B5A4F4F5F4C4143544143414F010049000000010005
      57494454480200020014000C444154414C4143544143414F1000110000000100
      0753554254595045020049000A00466F726D6174746564000444415441100011
      00000001000753554254595045020049000A00466F726D617474656400064252
      494E434F0100490000000100055749445448020002000F000343435308000400
      0000000007474F524455524108000400000000000850524F5445494E41080004
      0000000000074C4143544F534508000400000000000E534F4C49444F535F544F
      5441495308000400000000000555524549410800040000000000034553440800
      0400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KZOO_PESAGEM_LEITE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_ANIMAL_FEMEA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_LACTACAO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATALACTACAO'
        DataType = ftTimeStamp
      end
      item
        Name = 'DATA'
        DataType = ftTimeStamp
      end
      item
        Name = 'BRINCO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CCS'
        DataType = ftFloat
      end
      item
        Name = 'GORDURA'
        DataType = ftFloat
      end
      item
        Name = 'PROTEINA'
        DataType = ftFloat
      end
      item
        Name = 'LACTOSE'
        DataType = ftFloat
      end
      item
        Name = 'SOLIDOS_TOTAIS'
        DataType = ftFloat
      end
      item
        Name = 'UREIA'
        DataType = ftFloat
      end
      item
        Name = 'ESD'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 384
    Top = 24
    object cdsImportAnalisesKZOO_PESAGEM_LEITE: TStringField
      FieldName = 'KZOO_PESAGEM_LEITE'
    end
    object cdsImportAnalisesKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object cdsImportAnalisesKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
    end
    object cdsImportAnalisesDATALACTACAO: TSQLTimeStampField
      FieldName = 'DATALACTACAO'
    end
    object cdsImportAnalisesDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object cdsImportAnalisesBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsImportAnalisesCCS: TFloatField
      FieldName = 'CCS'
    end
    object cdsImportAnalisesGORDURA: TFloatField
      FieldName = 'GORDURA'
    end
    object cdsImportAnalisesPROTEINA: TFloatField
      FieldName = 'PROTEINA'
    end
    object cdsImportAnalisesLACTOSE: TFloatField
      FieldName = 'LACTOSE'
    end
    object cdsImportAnalisesSOLIDOS_TOTAIS: TFloatField
      FieldName = 'SOLIDOS_TOTAIS'
    end
    object cdsImportAnalisesUREIA: TFloatField
      FieldName = 'UREIA'
    end
    object cdsImportAnalisesESD: TFloatField
      FieldName = 'ESD'
    end
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
    DataSet = cdsImportAnalises
    SQLOptions.SQLTerm = ';'
    Mappings.Strings = (
      'BRINCO=A'
      'CCS=B'
      'GORDURA=C'
      'PROTEINA=D'
      'LACTOSE=E'
      'SOLIDOS_TOTAIS=F'
      'UREIA=G')
    Options = [soExtendedStatistic, soUseAnimatedControl, soWaitCursor, soAutoCloseStatistic]
    Parameters = <>
    TitleStatus = 'Importing...'
    Statistic.TotalCount = 0
    Statistic.Result = irUnknown
    UseDisplayNames = False
    SourceFileName = 'SMImport.XLS'
    RowFirst = 2
    Left = 387
    Top = 65
  end
end
