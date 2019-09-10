inherited fqrFIN_APagar: TfqrFIN_APagar
  Left = 256
  Top = 227
  Caption = 'fqrFIN_APagar'
  ClientHeight = 774
  ClientWidth = 1115
  ExplicitWidth = 1131
  ExplicitHeight = 813
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = -4
    Top = 0
    Width = 1123
    Height = 794
    BeforePrint = QuickRepBeforePrint
    DataSet = cdsFIN_APAGAR
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Orientation = poLandscape
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.PrintQuality = 0
    ReportTitle = 'T'#237'tulos A Pagar'
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    ExplicitLeft = -4
    ExplicitTop = 0
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited rbPageHeader: TQRBand
      Width = 1047
      Height = 17
      Size.Values = (
        44.979166666666670000
        2770.187500000000000000)
      ExplicitWidth = 1047
      ExplicitHeight = 17
      inherited _qrsDateTime: TQRSysData
        Left = 955
        Width = 92
        Height = 13
        Size.Values = (
          34.395833333333340000
          2526.770833333333000000
          0.000000000000000000
          243.416666666666700000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 955
        ExplicitWidth = 92
        ExplicitHeight = 13
      end
      inherited _qrsPageNumber: TQRSysData
        Left = 980
        Size.Values = (
          34.395833333333340000
          2592.916666666667000000
          0.000000000000000000
          177.270833333333300000)
        FontSize = 7
        ExplicitLeft = 980
      end
      inherited QRShapeHeaderSeparator2: TQRShape
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          44.979166666666670000
          1796.520833333333000000)
      end
      inherited _qrsReportTitle2: TQRSysData
        Left = 497
        Width = 53
        Height = 13
        Size.Values = (
          34.395833333333340000
          1314.979166666667000000
          0.000000000000000000
          140.229166666666700000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 497
        ExplicitWidth = 53
        ExplicitHeight = 13
      end
    end
    inherited rbTitle: TQRBand
      Top = 55
      Width = 1047
      Height = 48
      Size.Values = (
        127.000000000000000000
        2770.187500000000000000)
      ExplicitTop = 55
      ExplicitWidth = 1047
      ExplicitHeight = 48
      inherited _qrsReportTitle: TQRSysData
        Left = 471
        Size.Values = (
          60.854166666666680000
          1246.187500000000000000
          13.229166666666670000
          277.812500000000000000)
        FontSize = 14
        ExplicitLeft = 471
      end
      inherited _qrsDateTimeTitle: TQRSysData
        Left = 955
        Width = 92
        Height = 13
        Size.Values = (
          34.395833333333340000
          2526.770833333333000000
          203.729166666666700000
          243.416666666666700000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 955
        ExplicitWidth = 92
        ExplicitHeight = 13
      end
      inherited _qrsPageNumberTitle: TQRSysData
        Left = 980
        Top = 17
        Width = 67
        Height = 13
        Size.Values = (
          34.395833333333340000
          2592.916666666667000000
          44.979166666666670000
          177.270833333333300000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 980
        ExplicitTop = 17
        ExplicitWidth = 67
        ExplicitHeight = 13
      end
      inherited _qrImageLogo: TQRImage
        Left = 4
        Width = 115
        Height = 41
        Size.Values = (
          108.479166666666700000
          10.583333333333330000
          7.937500000000000000
          304.270833333333300000)
        ExplicitLeft = 4
        ExplicitWidth = 115
        ExplicitHeight = 41
      end
      inherited _qrlDescricao: TQRLabel
        Left = 489
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          1293.812500000000000000
          68.791666666666680000
          179.916666666666700000)
        Font.Height = -11
        FontSize = 8
        ExplicitLeft = 489
        ExplicitWidth = 68
        ExplicitHeight = 15
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
      Top = 125
      Width = 1047
      Height = 17
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        44.979166666666670000
        2770.187500000000000000)
      ExplicitTop = 125
      ExplicitWidth = 1047
      ExplicitHeight = 17
      object QRDBText1: TQRDBText
        Left = 690
        Top = 0
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          1825.625000000000000000
          0.000000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'VENCTO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 80
        Top = 0
        Width = 300
        Height = 15
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          0.000000000000000000
          793.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'NOMEENTIDADE'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 765
        Top = 0
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2024.062500000000000000
          0.000000000000000000
          264.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'VALOR'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 940
        Top = 0
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2487.083333333333000000
          0.000000000000000000
          264.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'PAGO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 865
        Top = 0
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          2288.645833333333000000
          0.000000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'PAGTO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 0
        Top = 0
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          0.000000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'DOCUMENTO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 385
        Top = 0
        Width = 300
        Height = 15
        Size.Values = (
          39.687500000000000000
          1018.645833333333000000
          0.000000000000000000
          793.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'HISTORICO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 176
      Width = 1047
      Height = 72
      Size.Values = (
        190.500000000000000000
        2770.187500000000000000)
      ExplicitTop = 176
      ExplicitWidth = 1047
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
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          44.979166666666670000
          1791.229166666667000000)
      end
      inherited QRLabelFooterSeparator1: TQRLabel
        Size.Values = (
          34.395833333333340000
          55.562500000000000000
          50.270833333333330000
          534.458333333333400000)
        FontSize = 7
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
        Size.Values = (
          34.395833333333340000
          333.375000000000000000
          89.958333333333340000
          534.458333333333400000)
        FontSize = 7
      end
      inherited LogoClinica: TQRImage
        Left = 4
        Top = 13
        Width = 103
        Height = 51
        Size.Values = (
          134.937500000000000000
          10.583333333333330000
          34.395833333333330000
          272.520833333333300000)
        ExplicitLeft = 4
        ExplicitTop = 13
        ExplicitWidth = 103
        ExplicitHeight = 51
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
      Top = 159
      Width = 1047
      Height = 17
      Size.Values = (
        44.979166666666670000
        2770.187500000000000000)
      ExplicitTop = 159
      ExplicitWidth = 1047
      ExplicitHeight = 17
      inherited qrQuantidadeRegistros: TQRLabel
        Size.Values = (
          34.395833333333340000
          1611.312500000000000000
          50.270833333333330000
          230.187500000000000000)
        FontSize = 7
      end
      object QRLabel6: TQRLabel
        Left = 865
        Top = 1
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          2288.645833333333000000
          2.645833333333333000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'PAGO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 940
        Top = 1
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2487.083333333333000000
          2.645833333333333000
          264.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = ',0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRLabel8Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 765
        Top = 1
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2024.062500000000000000
          2.645833333333333000
          264.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = ',0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRLabel10Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 690
        Top = 1
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          1825.625000000000000000
          2.645833333333333000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'A PAGAR'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 0
        Top = 1
        Width = 98
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'TOTAL DO GERAL:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRGroup1: TQRGroup [5]
      Left = 38
      Top = 120
      Width = 1047
      Height = 5
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = QRBand7
      Master = QuickRep
      ReprintOnNewPage = False
    end
    object QRBand7: TQRBand [6]
      Left = 38
      Top = 142
      Width = 1047
      Height = 17
      AlignToBottom = False
      BeforePrint = QRBand7BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel13: TQRLabel
        Left = 865
        Top = 1
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          2288.645833333333000000
          2.645833333333333000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'PAGO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 690
        Top = 1
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          1825.625000000000000000
          2.645833333333333000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'A PAGAR'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 0
        Top = 1
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'TOTAL DO DIA:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 765
        Top = 1
        Width = 100
        Height = 15
        Frame.DrawTop = True
        Size.Values = (
          39.687500000000000000
          2024.062500000000000000
          2.645833333333333000
          264.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = ',0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRLabel14Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 940
        Top = 1
        Width = 100
        Height = 15
        Frame.DrawTop = True
        Size.Values = (
          39.687500000000000000
          2487.083333333333000000
          2.645833333333333000
          264.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = ',0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRLabel15Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    inherited rbColumnHeader: TQRBand
      Top = 103
      Width = 1047
      Height = 17
      Size.Values = (
        44.979166666666670000
        2770.187500000000000000)
      ExplicitTop = 103
      ExplicitWidth = 1047
      ExplicitHeight = 17
      object QRLabel1: TQRLabel
        Left = 690
        Top = 0
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          1825.625000000000000000
          0.000000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Vencto'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 80
        Top = 0
        Width = 300
        Height = 15
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          0.000000000000000000
          793.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Entidade'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 765
        Top = 0
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2024.062500000000000000
          0.000000000000000000
          264.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '$ Valor'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 940
        Top = 0
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2487.083333333333000000
          0.000000000000000000
          264.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '$ Pago'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 865
        Top = 0
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          2288.645833333333000000
          0.000000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Pagto'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 0
        Top = 0
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          0.000000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Documento'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 385
        Top = 0
        Width = 300
        Height = 15
        Size.Values = (
          39.687500000000000000
          1018.645833333333000000
          0.000000000000000000
          793.750000000000000000)
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
    end
  end
  object cdsFIN_APAGAR: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFIN_APAGAR'
    Left = 160
    Top = 288
    object cdsFIN_APAGARKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
    end
    object cdsFIN_APAGARHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Required = True
      Size = 60
    end
    object cdsFIN_APAGARNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsFIN_APAGARDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsFIN_APAGARDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsFIN_APAGARKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      Required = True
    end
    object cdsFIN_APAGARVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsFIN_APAGARVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsFIN_APAGARPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object cdsFIN_APAGARPAGO: TFloatField
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsFIN_APAGARPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFIN_APAGARCONTAS: TStringField
      FieldName = 'CONTA'
      Size = 30
    end
  end
  object dspFIN_APAGAR: TDataSetProvider
    DataSet = sqlFIN_APAGAR
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 240
    Top = 288
  end
  object sqlFIN_APAGAR: TTcSQLDataSet
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'PAGO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    A.KFIN_APAGAR,'
      '    A.HISTORICO,'
      '    A.NOMEENTIDADE,'
      '    A.DOCUMENTO,'
      '    A.DATALANCTO,'
      '    P.KFIN_APAGAR_PARCELA,'
      '    P.VENCTO,'
      '    P.VALOR,'
      '    P.PAGTO,'
      '    P.PAGO,'
      '    P.PREVISAO,'
      '    c.NOME as CONTA'
      'FROM FIN_APAGAR_PARCELAS P'
      'JOIN FIN_APAGAR A on (A.KFIN_APAGAR = P.KFIN_APAGAR)'
      'LEFT JOIN FIN_CONTAS c on (P.KFIN_CONTA = c.KFIN_CONTA )'
      'LEFT JOIN CAD_ENTIDADES e on (e.KCAD_ENTIDADE = A.KCAD_ENTIDADE)'
      'WHERE (P.PAGO IS NULL or 1 = :PAGO)'
      '%s'
      'Order By %s')
    Left = 392
    Top = 296
    object sqlFIN_APAGARKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
    end
    object sqlFIN_APAGARHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlFIN_APAGARNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlFIN_APAGARDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlFIN_APAGARDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlFIN_APAGARKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      Required = True
    end
    object sqlFIN_APAGARVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlFIN_APAGARVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlFIN_APAGARPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object sqlFIN_APAGARPAGO: TFloatField
      FieldName = 'PAGO'
    end
    object sqlFIN_APAGARPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFIN_APAGARCONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
  end
end
