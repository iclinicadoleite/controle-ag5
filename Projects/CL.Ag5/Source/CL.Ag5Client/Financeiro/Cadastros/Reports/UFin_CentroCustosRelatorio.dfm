inherited Fin_CentroCustosReport: TFin_CentroCustosReport
  Left = 379
  Top = 148
  Caption = 'Rela'#231#227'o de Centro de Custos'
  ClientWidth = 795
  ExplicitWidth = 811
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = 4
    Top = 0
    DataSet = cdsCentroCustos
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.PrintQuality = 0
    ExplicitLeft = 4
    ExplicitTop = 0
    inherited rbPageHeader: TQRBand
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      inherited _qrsDateTime: TQRSysData
        Size.Values = (
          42.333333333333340000
          1576.916666666667000000
          0.000000000000000000
          322.791666666666700000)
        FontSize = 9
      end
      inherited _qrsPageNumber: TQRSysData
        Left = 628
        Width = 90
        Height = 16
        Size.Values = (
          42.333333333333340000
          1661.583333333333000000
          0.000000000000000000
          238.125000000000000000)
        Font.Height = -12
        FontSize = 9
        ExplicitLeft = 628
        ExplicitWidth = 90
        ExplicitHeight = 16
      end
      inherited QRShapeHeaderSeparator2: TQRShape
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          44.979166666666670000
          1796.520833333333000000)
      end
      inherited _qrsReportTitle2: TQRSysData
        Size.Values = (
          42.333333333333340000
          859.895833333333400000
          0.000000000000000000
          179.916666666666700000)
        FontSize = 9
      end
    end
    inherited rbTitle: TQRBand
      Size.Values = (
        293.687500000000000000
        1899.708333333333000000)
      inherited _qrsReportTitle: TQRSysData
        Size.Values = (
          60.854166666666680000
          809.625000000000000000
          13.229166666666670000
          277.812500000000000000)
        FontSize = 14
      end
      inherited _qrsDateTimeTitle: TQRSysData
        Size.Values = (
          42.333333333333340000
          1576.916666666667000000
          203.729166666666700000
          322.791666666666700000)
        FontSize = 9
      end
      inherited _qrsPageNumberTitle: TQRSysData
        Top = 92
        Size.Values = (
          42.333333333333340000
          1661.583333333333000000
          243.416666666666700000
          238.125000000000000000)
        FontSize = 9
        ExplicitTop = 92
      end
      inherited _qrImageLogo: TQRImage
        Left = 4
        Height = 70
        Size.Values = (
          185.208333333333300000
          10.583333333333330000
          7.937500000000000000
          254.000000000000000000)
        ExplicitLeft = 4
        ExplicitHeight = 70
      end
      inherited _qrlDescricao: TQRLabel
        Size.Values = (
          42.333333333333340000
          846.666666666666600000
          68.791666666666680000
          206.375000000000000000)
        FontSize = 9
      end
      inherited QRShapeHeaderSeparator: TQRShape
        Left = 3
        Width = 714
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          198.437500000000000000
          1889.125000000000000000)
        ExplicitLeft = 3
        ExplicitWidth = 714
      end
      inherited QRImageDomain: TQRImage
        Left = 564
        Top = 5
        Size.Values = (
          156.104166666666700000
          1492.250000000000000000
          13.229166666666670000
          391.583333333333400000)
        ExplicitLeft = 564
        ExplicitTop = 5
      end
    end
    inherited rbDetail: TQRBand
      Top = 193
      Height = 19
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      ExplicitTop = 193
      ExplicitHeight = 19
      object QRDBText1: TQRDBText
        Left = 3
        Top = 3
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          7.937500000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsCentroCustos
        DataField = 'CLASSIFICACAO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 85
        Top = 2
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          224.895833333333300000
          5.291666666666667000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsCentroCustos
        DataField = 'CODIGO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 135
        Top = 2
        Width = 237
        Height = 15
        Size.Values = (
          39.687500000000000000
          357.187500000000000000
          5.291666666666667000
          627.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsCentroCustos
        DataField = 'NOME'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 378
        Top = 2
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          1000.125000000000000000
          5.291666666666667000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsCentroCustos
        DataField = 'ANALITICO_SINTETICO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 472
        Top = 2
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          1248.833333333333000000
          5.291666666666667000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsCentroCustos
        DataField = 'SYS$DI'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 555
        Top = 2
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          1468.437500000000000000
          5.291666666666667000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsCentroCustos
        DataField = 'ATIVO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 608
        Top = 2
        Width = 104
        Height = 15
        Size.Values = (
          39.687500000000000000
          1608.666666666667000000
          5.291666666666667000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsCentroCustos
        DataField = 'DATA_ENCERRAMENTO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 229
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 229
      ExplicitHeight = 72
      inherited _qrlFooter: TQRLabel
        Size.Values = (
          34.395833333333340000
          0.000000000000000000
          0.000000000000000000
          140.229166666666700000)
        FontSize = 7
      end
      inherited QRShapeFooterSeparator1: TQRShape
        Top = 11
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          29.104166666666670000
          1791.229166666667000000)
        ExplicitTop = 11
      end
      inherited QRLabelFooterSeparator1: TQRLabel
        Top = 13
        Size.Values = (
          34.395833333333340000
          55.562500000000000000
          34.395833333333340000
          534.458333333333400000)
        FontSize = 7
        ExplicitTop = 13
      end
      inherited QRShapeFooterSeparator: TQRShape
        Left = 113
        Top = 42
        Width = 587
        Size.Values = (
          2.645833333333333000
          298.979166666666700000
          111.125000000000000000
          1553.104166666667000000)
        ExplicitLeft = 113
        ExplicitTop = 42
        ExplicitWidth = 587
      end
      inherited QRLabelFooterSeparator: TQRLabel
        Left = 192
        Top = 28
        Size.Values = (
          34.395833333333340000
          508.000000000000000000
          74.083333333333340000
          534.458333333333400000)
        FontSize = 7
        ExplicitLeft = 192
        ExplicitTop = 28
      end
      inherited LogoClinica: TQRImage
        Left = 4
        Top = 13
        Width = 75
        Height = 35
        Size.Values = (
          92.604166666666680000
          10.583333333333330000
          34.395833333333340000
          198.437500000000000000)
        ExplicitLeft = 4
        ExplicitTop = 13
        ExplicitWidth = 75
        ExplicitHeight = 35
      end
      inherited _qrlLegenda: TQRLabel
        Size.Values = (
          39.687500000000000000
          44.979166666666670000
          31.750000000000000000
          2.645833333333333000)
        FontSize = 8
      end
      inherited _qrlLegenda1: TQRLabel
        Size.Values = (
          39.687500000000000000
          44.979166666666670000
          7.937500000000000000
          2.645833333333333000)
        FontSize = 8
      end
    end
    inherited rbSummary: TQRBand
      Top = 212
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 212
      ExplicitHeight = 17
      inherited qrQuantidadeRegistros: TQRLabel
        Size.Values = (
          34.395833333333340000
          1611.312500000000000000
          50.270833333333330000
          230.187500000000000000)
        FontSize = 7
      end
    end
    inherited rbColumnHeader: TQRBand
      Height = 20
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      ExplicitHeight = 20
      object QRLabel1: TQRLabel
        Left = 5
        Top = 2
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          5.291666666666667000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Classifica'#231#227'o'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 85
        Top = 2
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          224.895833333333300000
          5.291666666666667000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 135
        Top = 2
        Width = 237
        Height = 15
        Size.Values = (
          39.687500000000000000
          357.187500000000000000
          5.291666666666667000
          627.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 378
        Top = 2
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          1000.125000000000000000
          5.291666666666667000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Anal'#237'tico/Sint'#233'tico'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 472
        Top = 2
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          1248.833333333333000000
          5.291666666666667000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Data cadastro'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 555
        Top = 2
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          1468.437500000000000000
          5.291666666666667000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Status'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 608
        Top = 2
        Width = 104
        Height = 15
        Size.Values = (
          39.687500000000000000
          1608.666666666667000000
          5.291666666666667000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Data encerramento'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object cdsCentroCustos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CENTRO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CENTRO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCentroCustos'
    Left = 228
    Top = 1
    object cdsCentroCustosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCentroCustosCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Required = True
      OnGetText = cdsCentroCustosCLASSIFICACAOGetText
      Size = 32
    end
    object cdsCentroCustosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object cdsCentroCustosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      OnGetText = cdsCentroCustosATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsCentroCustosANALITICO_SINTETICO: TStringField
      FieldName = 'ANALITICO_SINTETICO'
      Required = True
      OnGetText = cdsCentroCustosANALITICO_SINTETICOGetText
      FixedChar = True
      Size = 1
    end
    object cdsCentroCustosDATA_ENCERRAMENTO: TSQLTimeStampField
      FieldName = 'DATA_ENCERRAMENTO'
    end
    object cdsCentroCustosSYSDI: TSQLTimeStampField
      FieldName = 'SYS$DI'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object dspCentroCustos: TDataSetProvider
    DataSet = sqlCentroCustos
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 188
    Top = 43
  end
  object sqlCentroCustos: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CENTRO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CENTRO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      ' CODIGO,'
      ' CLASSIFICACAO,'
      ' NOME, '
      ' ATIVO,'
      ' ANALITICO_SINTETICO,'
      ' DATA_ENCERRAMENTO,'
      ' SYS$DI'
      'FROM FIN_CENTROSCUSTO '
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND ( CLASSIFICACAO LIKE (:CENTRO || '#39'.%'#39' )'
      '        OR ( CLASSIFICACAO = :CENTRO )'
      '       )'
      'ORDER BY CLASSIFICACAO')
    Left = 222
    Top = 88
    object sqlCentroCustosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlCentroCustosCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Required = True
      Size = 32
    end
    object sqlCentroCustosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object sqlCentroCustosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlCentroCustosANALITICO_SINTETICO: TStringField
      FieldName = 'ANALITICO_SINTETICO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlCentroCustosDATA_ENCERRAMENTO: TSQLTimeStampField
      FieldName = 'DATA_ENCERRAMENTO'
    end
    object sqlCentroCustosSYSDI: TSQLTimeStampField
      FieldName = 'SYS$DI'
    end
  end
end
