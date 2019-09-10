inherited Fin_ComprasPorCentroCustoReport: TFin_ComprasPorCentroCustoReport
  Left = 327
  Top = 109
  Caption = 'Compras por centro de custo'
  ClientHeight = 751
  ClientWidth = 816
  ExplicitWidth = 832
  ExplicitHeight = 790
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = 0
    Top = 1
    BeforePrint = QuickRepBeforePrint
    DataSet = cdsNotas
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
    ReportTitle = 'Relat'#243'rio de Compras'
    ExplicitLeft = 0
    ExplicitTop = 1
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
        Size.Values = (
          34.395833333333340000
          1722.437500000000000000
          0.000000000000000000
          177.270833333333300000)
        FontSize = 7
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
      Frame.Color = 15724527
      Frame.DrawBottom = False
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
        Size.Values = (
          42.333333333333340000
          1661.583333333333000000
          246.062500000000000000
          238.125000000000000000)
        FontSize = 9
      end
      inherited _qrImageLogo: TQRImage
        Top = 1
        Width = 95
        Height = 70
        Size.Values = (
          185.208333333333300000
          52.916666666666670000
          2.645833333333333000
          251.354166666666700000)
        ExplicitTop = 1
        ExplicitWidth = 95
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
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          198.437500000000000000
          1796.520833333333000000)
      end
      inherited QRImageDomain: TQRImage
        Size.Values = (
          156.104166666666700000
          1455.208333333333000000
          7.937500000000000000
          391.583333333333400000)
      end
    end
    inherited rbDetail: TQRBand
      Top = 192
      Height = 22
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        58.208333333333340000
        1899.708333333333000000)
      ExplicitTop = 192
      ExplicitHeight = 22
      object QRDBText1: TQRDBText
        Left = 88
        Top = 2
        Width = 88
        Height = 16
        Size.Values = (
          42.333333333333330000
          232.833333333333300000
          5.291666666666667000
          232.833333333333300000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsNotas
        DataField = 'DATA_EMISSAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 240
        Top = 2
        Width = 80
        Height = 16
        Size.Values = (
          42.333333333333330000
          635.000000000000000000
          5.291666666666667000
          211.666666666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsNotas
        DataField = 'NOTA_FISCAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 355
        Top = 2
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          939.270833333333200000
          5.291666666666667000
          89.958333333333320000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsNotas
        DataField = 'SERIE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 576
        Top = 2
        Width = 139
        Height = 16
        Size.Values = (
          42.333333333333330000
          1524.000000000000000000
          5.291666666666667000
          367.770833333333300000)
        XLColumn = 9
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsNotas
        DataField = 'NOMEENTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 7
        Top = 2
        Width = 79
        Height = 16
        Size.Values = (
          42.333333333333340000
          18.520833333333330000
          5.291666666666667000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data emiss'#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 180
        Top = 2
        Width = 59
        Height = 16
        Size.Values = (
          42.333333333333340000
          476.250000000000000000
          5.291666666666667000
          156.104166666666700000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nota fiscal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 324
        Top = 2
        Width = 30
        Height = 16
        Size.Values = (
          42.333333333333340000
          857.250000000000000000
          5.291666666666667000
          79.375000000000000000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'S'#233'rie'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 505
        Top = 2
        Width = 70
        Height = 16
        Size.Values = (
          42.333333333333340000
          1336.145833333333000000
          5.291666666666667000
          185.208333333333300000)
        XLColumn = 8
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fornecedor :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText13: TQRDBText
        Left = 424
        Top = 2
        Width = 75
        Height = 16
        Size.Values = (
          42.333333333333330000
          1121.833333333333000000
          5.291666666666667000
          198.437500000000000000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsNotas
        DataField = 'TOTAL_NOTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 395
        Top = 2
        Width = 28
        Height = 16
        Size.Values = (
          42.333333333333340000
          1045.104166666667000000
          5.291666666666667000
          74.083333333333340000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 252
      Size.Values = (
        201.083333333333300000
        1899.708333333333000000)
      ExplicitTop = 252
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
        Left = 190
        Width = 507
        Size.Values = (
          2.645833333333333000
          502.708333333333300000
          71.437500000000000000
          1341.437500000000000000)
        ExplicitLeft = 190
        ExplicitWidth = 507
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
        Left = 20
        Top = -4
        Width = 75
        Height = 35
        Size.Values = (
          92.604166666666680000
          52.916666666666670000
          -10.583333333333330000
          198.437500000000000000)
        ExplicitLeft = 20
        ExplicitTop = -4
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
      Top = 232
      Height = 20
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = rbSummaryBeforePrint
      Enabled = True
      LinkBand = QRSubDetail1
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      ExplicitTop = 232
      ExplicitHeight = 20
      inherited qrQuantidadeRegistros: TQRLabel
        Size.Values = (
          34.395833333333340000
          1611.312500000000000000
          50.270833333333330000
          230.187500000000000000)
        FontSize = 7
      end
      object QRLabel5: TQRLabel
        Left = 506
        Top = 3
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1338.791666666667000000
          7.937500000000000000
          169.333333333333300000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total R$'
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
      object QRLabel9: TQRLabel
        Left = 573
        Top = 3
        Width = 142
        Height = 15
        Size.Values = (
          39.687500000000000000
          1516.062500000000000000
          7.937500000000000000
          375.708333333333300000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '#,0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    inherited rbColumnHeader: TQRBand
      Height = 19
      Frame.DrawTop = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      TransparentBand = False
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      ExplicitHeight = 19
      object QRLabel1: TQRLabel
        Left = 53
        Top = 1
        Width = 143
        Height = 15
        Size.Values = (
          39.687500000000000000
          140.229166666666700000
          2.645833333333333000
          378.354166666666700000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Produto'
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
      object QRLabel10: TQRLabel
        Left = 199
        Top = 1
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          526.520833333333300000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Quantidade'
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
      object QRLabel11: TQRLabel
        Left = 266
        Top = 1
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          703.791666666666800000
          2.645833333333333000
          174.625000000000000000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor unit'#225'rio'
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
      object QRLabel12: TQRLabel
        Left = 336
        Top = 1
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          889.000000000000000000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total'
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
      object QRLabel7: TQRLabel
        Left = 403
        Top = 1
        Width = 32
        Height = 15
        Size.Values = (
          39.687500000000000000
          1066.270833333333000000
          2.645833333333333000
          84.666666666666680000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '%'
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
      object QRLabel13: TQRLabel
        Left = 437
        Top = 1
        Width = 133
        Height = 15
        Size.Values = (
          39.687500000000000000
          1156.229166666667000000
          2.645833333333333000
          351.895833333333300000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Conta cont'#225'bil'
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
        Left = 573
        Top = 1
        Width = 142
        Height = 15
        Size.Values = (
          39.687500000000000000
          1516.062500000000000000
          2.645833333333333000
          375.708333333333300000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Centro de custo'
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
        Left = 5
        Top = 1
        Width = 45
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          2.645833333333333000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'C'#243'digo'
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
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 214
      Width = 718
      Height = 18
      Frame.Color = 15724527
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep
      DataSet = cdsItens
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText5: TQRDBText
        Left = 5
        Top = 1
        Width = 45
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          2.645833333333333000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsItens
        DataField = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 53
        Top = 1
        Width = 143
        Height = 15
        Size.Values = (
          39.687500000000000000
          140.229166666666700000
          2.645833333333333000
          378.354166666666700000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsItens
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 199
        Top = 1
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          526.520833333333300000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsItens
        DataField = 'QTDE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 266
        Top = 1
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          703.791666666666800000
          2.645833333333333000
          174.625000000000000000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsItens
        DataField = 'CUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 336
        Top = 1
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          889.000000000000000000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsItens
        DataField = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 403
        Top = 1
        Width = 32
        Height = 15
        Size.Values = (
          39.687500000000000000
          1066.270833333333000000
          2.645833333333333000
          84.666666666666680000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsItens
        DataField = 'PORCENTAGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 437
        Top = 1
        Width = 133
        Height = 15
        Size.Values = (
          39.687500000000000000
          1156.229166666667000000
          2.645833333333333000
          351.895833333333300000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsItens
        DataField = 'CONTACONTABIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 573
        Top = 1
        Width = 142
        Height = 15
        Size.Values = (
          39.687500000000000000
          1516.062500000000000000
          2.645833333333333000
          375.708333333333300000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsItens
        DataField = 'CENTROCUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
  end
  object cdsNotas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODASCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KFIN_PLANOCONTA'
        ParamType = ptInput
      end>
    ProviderName = 'dspNotas'
    Left = 231
    Top = 3
    object cdsNotasKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      Required = True
      FixedChar = True
    end
    object cdsNotasNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Required = True
      Size = 128
    end
    object cdsNotasNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 32
    end
    object cdsNotasSERIE: TStringField
      FieldName = 'SERIE'
      Size = 32
    end
    object cdsNotasDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
      Required = True
    end
    object cdsNotasTOTAL_NOTA: TFloatField
      FieldName = 'TOTAL_NOTA'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsNotasOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsNotassqlItens: TDataSetField
      FieldName = 'sqlItens'
    end
  end
  object sqlNotas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODASCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KFIN_PLANOCONTA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT DISTINCT'
      '    C.KCMP_PEDIDO,'
      '    C.NOMEENTIDADE,'
      '    C.NOTA_FISCAL,'
      '    C.SERIE,'
      '    C.DATA_EMISSAO,'
      '    C.TOTAL_NOTA,'
      '    C.OBS'
      'FROM CMP_PEDIDOS C'
      'LEFT JOIN CMP_PEDIDO_ITENS I ON I.KCMP_PEDIDO = C.KCMP_PEDIDO'
      'WHERE ( C.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( C.DATA_EMISSAO BETWEEN :DATAINI AND :DATAFIM )'
      
        '  AND ( ( :TODOS = '#39'T'#39' ) OR ( C.KCAD_ENTIDADE = :KCAD_ENTIDADE )' +
        ' )'
      
        '  AND ( ( :TODASCONTAS = '#39'T'#39' ) OR ( I.KFIN_PLANOCONTA = :KFIN_PL' +
        'ANOCONTA ) )')
    Left = 229
    Top = 91
    object sqlNotasKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      Required = True
      FixedChar = True
    end
    object sqlNotasNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Required = True
      Size = 128
    end
    object sqlNotasNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 32
    end
    object sqlNotasSERIE: TStringField
      FieldName = 'SERIE'
      Size = 32
    end
    object sqlNotasDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
      Required = True
    end
    object sqlNotasTOTAL_NOTA: TFloatField
      FieldName = 'TOTAL_NOTA'
      Required = True
    end
    object sqlNotasOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlItens: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsNotas
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOSCENTROS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KFIN_CENTROCUSTO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  I.KCMP_PEDIDO,'
      '  I.CODIGO,'
      '  I.NOME,'
      '  I.CUSTO,'
      '  (( I.QTDE * COALESCE( A.PORCENTAGEM, 100 ) ) / 100 ) QTDE,'
      '  A.PORCENTAGEM,'
      '  (( I.TOTAL * COALESCE( A.PORCENTAGEM, 100 ) ) / 100 ) TOTAL,'
      '  P.NOME CONTACONTABIL,'
      '  C.NOME CENTROCUSTO'
      'FROM CMP_PEDIDO_ITENS I'
      
        'LEFT JOIN FIN_PLANOCONTAS P ON P.KFIN_PLANOCONTA = I.KFIN_PLANOC' +
        'ONTA'
      
        'LEFT JOIN FIN_APROPRIACAO A ON A.TABLENAME = '#39'CMP_PEDIDO_ITENS'#39' ' +
        'AND A.TABLEKEY = I.KCMP_PEDIDO_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO C ON C.KFIN_CENTROCUSTO = A.KFIN_CENT' +
        'ROCUSTO'
      'WHERE ( I.KCMP_PEDIDO = :KCMP_PEDIDO )'
      
        '  AND ( ( :TODOSCENTROS = '#39'T'#39' ) OR ( C.KFIN_CENTROCUSTO = :KFIN_' +
        'CENTROCUSTO ) )')
    Left = 286
    Top = 92
    object sqlItensKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      Required = True
      FixedChar = True
    end
    object sqlItensCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlItensNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlItensCUSTO: TFloatField
      FieldName = 'CUSTO'
      Required = True
    end
    object sqlItensQTDE: TFloatField
      FieldName = 'QTDE'
      Required = True
    end
    object sqlItensPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlItensTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object sqlItensCONTACONTABIL: TStringField
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object sqlItensCENTROCUSTO: TStringField
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
  end
  object dtsNotas: TDataSource
    DataSet = sqlNotas
    Left = 254
    Top = 48
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsNotassqlItens
    Params = <>
    Left = 293
    Top = 5
    object cdsItensKCMP_PEDIDO: TStringField
      FieldName = 'KCMP_PEDIDO'
      Required = True
      FixedChar = True
    end
    object cdsItensCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsItensNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsItensCUSTO: TFloatField
      FieldName = 'CUSTO'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsItensQTDE: TFloatField
      FieldName = 'QTDE'
      Required = True
      DisplayFormat = '0.##'
    end
    object cdsItensPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '#,0.00 %'
    end
    object cdsItensTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00'
    end
    object cdsItensCONTACONTABIL: TStringField
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object cdsItensCENTROCUSTO: TStringField
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
  end
  object dspNotas: TDataSetProvider
    DataSet = sqlNotas
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 193
    Top = 48
  end
end
