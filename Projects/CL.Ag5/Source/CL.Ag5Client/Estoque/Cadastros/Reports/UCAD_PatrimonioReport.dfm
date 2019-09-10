inherited qrCAD_PatrimonioReport: TqrCAD_PatrimonioReport
  Left = 386
  Top = 138
  Caption = 'Rela'#231#227'o patrim'#244'nio'
  ClientHeight = 676
  ClientWidth = 800
  ExplicitWidth = 816
  ExplicitHeight = 715
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = -2
    Top = 0
    DataSet = cdsPatrimonio
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
    ReportTitle = 'Rela'#231#227'o de patrim'#244'nios'
    PrevInitialZoom = qrZoomToWidth
    ExplicitLeft = -2
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
        Left = 4
        Top = 77
        Width = 714
        Size.Values = (
          2.645833333333333000
          10.583333333333330000
          203.729166666666700000
          1889.125000000000000000)
        ExplicitLeft = 4
        ExplicitTop = 77
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
      Top = 197
      Height = 84
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        222.250000000000000000
        1899.708333333333000000)
      ExplicitTop = 197
      ExplicitHeight = 84
      object QRShape2: TQRShape
        Left = 0
        Top = -1
        Width = 718
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          -2.645833333333333000
          1899.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 4
        Top = 3
        Width = 43
        Height = 16
        Size.Values = (
          42.333333333333340000
          10.583333333333330000
          7.937500000000000000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 4
        Top = 42
        Width = 92
        Height = 16
        Size.Values = (
          42.333333333333340000
          10.583333333333330000
          111.125000000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Imobilizado em :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 141
        Top = 3
        Width = 62
        Height = 16
        Size.Values = (
          42.333333333333340000
          373.062500000000000000
          7.937500000000000000
          164.041666666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descri'#231#227'o:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 4
        Top = 22
        Width = 69
        Height = 16
        Size.Values = (
          42.333333333333340000
          10.583333333333330000
          58.208333333333340000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantidade:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 462
        Top = 42
        Width = 49
        Height = 16
        Size.Values = (
          42.333333333333340000
          1222.375000000000000000
          111.125000000000000000
          129.645833333333300000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vida '#250'til:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 48
        Top = 3
        Width = 86
        Height = 16
        Size.Values = (
          42.333333333333330000
          127.000000000000000000
          7.937500000000000000
          227.541666666666700000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPatrimonio
        DataField = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 205
        Top = 3
        Width = 410
        Height = 16
        Size.Values = (
          42.333333333333330000
          542.395833333333300000
          7.937500000000000000
          1084.791666666667000000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPatrimonio
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText3: TQRDBText
        Left = 101
        Top = 42
        Width = 97
        Height = 16
        Size.Values = (
          42.333333333333330000
          267.229166666666700000
          111.125000000000000000
          256.645833333333300000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPatrimonio
        DataField = 'DATA_IMOBILIZADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText4: TQRDBText
        Left = 101
        Top = 22
        Width = 103
        Height = 16
        Size.Values = (
          42.333333333333330000
          267.229166666666700000
          58.208333333333320000
          272.520833333333300000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPatrimonio
        DataField = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText6: TQRDBText
        Left = 530
        Top = 42
        Width = 66
        Height = 16
        Size.Values = (
          42.333333333333330000
          1402.291666666667000000
          111.125000000000000000
          174.625000000000000000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPatrimonio
        DataField = 'VIDA_UTIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText7: TQRDBText
        Left = 664
        Top = 3
        Width = 50
        Height = 16
        Size.Values = (
          42.333333333333330000
          1756.833333333333000000
          7.937500000000000000
          132.291666666666700000)
        XLColumn = 8
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPatrimonio
        DataField = 'ATIVO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 621
        Top = 3
        Width = 41
        Height = 16
        Size.Values = (
          42.333333333333340000
          1643.062500000000000000
          7.937500000000000000
          108.479166666666700000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 78
        Top = 64
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          206.375000000000000000
          169.333333333333300000
          235.479166666666700000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Deprecia'#231#227'o'
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
        Left = 172
        Top = 64
        Width = 131
        Height = 17
        Size.Values = (
          44.979166666666670000
          455.083333333333300000
          169.333333333333300000
          346.604166666666700000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor p'#243's deprecia'#231#227'o'
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
        Left = 308
        Top = 64
        Width = 166
        Height = 17
        Size.Values = (
          44.979166666666670000
          814.916666666666800000
          169.333333333333300000
          439.208333333333300000)
        XLColumn = 3
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
      object QRShape1: TQRShape
        Left = 9
        Top = 61
        Width = 706
        Height = 1
        Size.Values = (
          2.645833333333333000
          23.812500000000000000
          161.395833333333300000
          1867.958333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 9
        Top = 81
        Width = 706
        Height = 1
        Size.Values = (
          2.645833333333333000
          23.812500000000000000
          214.312500000000000000
          1867.958333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 233
        Top = 42
        Width = 61
        Height = 16
        Size.Values = (
          42.333333333333340000
          616.479166666666800000
          111.125000000000000000
          161.395833333333300000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor final:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText11: TQRDBText
        Left = 316
        Top = 42
        Width = 98
        Height = 16
        Size.Values = (
          42.333333333333330000
          836.083333333333200000
          111.125000000000000000
          259.291666666666700000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPatrimonio
        DataField = 'VALOR_FINAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel13: TQRLabel
        Left = 4
        Top = 64
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          169.333333333333300000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Data'
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
        Left = 477
        Top = 64
        Width = 154
        Height = 17
        Size.Values = (
          44.979166666666670000
          1262.062500000000000000
          169.333333333333300000
          407.458333333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Centro de Custos'
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
      object QRLabel15: TQRLabel
        Left = 633
        Top = 64
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1674.812500000000000000
          169.333333333333300000
          209.020833333333300000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Rateio'
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
        Left = 602
        Top = 42
        Width = 112
        Height = 16
        Size.Values = (
          42.333333333333340000
          1592.791666666667000000
          111.125000000000000000
          296.333333333333400000)
        XLColumn = 8
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Deprecia'#231#227'o Linear'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 233
        Top = 22
        Width = 80
        Height = 16
        Size.Values = (
          42.333333333333340000
          616.479166666666800000
          58.208333333333340000
          211.666666666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor unit'#225'rio:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText5: TQRDBText
        Left = 316
        Top = 22
        Width = 118
        Height = 16
        Size.Values = (
          42.333333333333330000
          836.083333333333200000
          58.208333333333320000
          312.208333333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPatrimonio
        DataField = 'VALOR_UNITARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel16: TQRLabel
        Left = 462
        Top = 22
        Width = 62
        Height = 16
        Size.Values = (
          42.333333333333340000
          1222.375000000000000000
          58.208333333333340000
          164.041666666666700000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor total:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText15: TQRDBText
        Left = 530
        Top = 22
        Width = 118
        Height = 16
        Size.Values = (
          42.333333333333330000
          1402.291666666667000000
          58.208333333333320000
          312.208333333333300000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPatrimonio
        DataField = 'VALOR_TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 319
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 319
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
      Top = 302
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 302
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
    object QRSubDetail1: TQRSubDetail [5]
      Left = 38
      Top = 281
      Width = 718
      Height = 21
      Frame.Color = 15724527
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep
      DataSet = cdsDepreciacao
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText8: TQRDBText
        Left = 78
        Top = 2
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          206.375000000000000000
          5.291666666666667000
          235.479166666666700000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsDepreciacao
        DataField = 'VALOR'
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
        Left = 172
        Top = 2
        Width = 126
        Height = 17
        Size.Values = (
          44.979166666666670000
          455.083333333333300000
          5.291666666666667000
          333.375000000000000000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsDepreciacao
        DataField = 'VALOR_DEPRECIACAO'
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
        Left = 308
        Top = 2
        Width = 166
        Height = 17
        Size.Values = (
          44.979166666666670000
          814.916666666666800000
          5.291666666666667000
          439.208333333333300000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsDepreciacao
        DataField = 'PLANO_CONTA'
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
        Left = 4
        Top = 2
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          5.291666666666667000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsDepreciacao
        DataField = 'DATA'
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
      object QRDBText13: TQRDBText
        Left = 477
        Top = 2
        Width = 154
        Height = 17
        Size.Values = (
          44.979166666666670000
          1262.062500000000000000
          5.291666666666667000
          407.458333333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsDepreciacao
        DataField = 'CENTRO_CUSTO'
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
      object QRDBText14: TQRDBText
        Left = 633
        Top = 2
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1674.812500000000000000
          5.291666666666667000
          209.020833333333300000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsDepreciacao
        DataField = 'PORCENTAGEM'
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
    end
    inherited rbColumnHeader: TQRBand
      Height = 24
      Frame.Color = 15724527
      Enabled = False
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      ExplicitHeight = 24
    end
  end
  object cdsPatrimonio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'ALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_PATRIMONIO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPatrimonio'
    OnCalcFields = cdsPatrimonioCalcFields
    Left = 216
    Top = 4
    object cdsPatrimonioKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      Required = True
      FixedChar = True
    end
    object cdsPatrimonioCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField
      FieldName = 'DATA_IMOBILIZADO'
    end
    object cdsPatrimonioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object cdsPatrimonioQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,0.##'
    end
    object cdsPatrimonioVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = 'R$ #,0.00'
    end
    object cdsPatrimonioVALOR_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = 'R$ #,0.00'
    end
    object cdsPatrimonioVALOR_FINAL: TFloatField
      FieldName = 'VALOR_FINAL'
      DisplayFormat = 'R$ #,0.00'
    end
    object cdsPatrimonioVIDA_UTIL: TIntegerField
      FieldName = 'VIDA_UTIL'
      DisplayFormat = '00 anos'
    end
    object cdsPatrimonioATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      OnGetText = cdsPatrimonioATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsPatrimonioOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPatrimoniosqlDepreciacao: TDataSetField
      FieldName = 'sqlDepreciacao'
    end
  end
  object dspPatrimonio: TDataSetProvider
    DataSet = sqlPatrimonio
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 174
    Top = 45
  end
  object sqlPatrimonio: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'ALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_PATRIMONIO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  KCAD_PATRIMONIO,'
      '  CODIGO,'
      '  DATA_IMOBILIZADO,'
      '  DESCRICAO,'
      '  QUANTIDADE,'
      '  VALOR_UNITARIO,'
      '  VALOR_FINAL,'
      '  VIDA_UTIL,'
      '  ATIVO,'
      '  OBS'
      'FROM CAD_PATRIMONIOS'
      'WHERE ( KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( (:ALL = '#39'T'#39' ) OR ( KCAD_PATRIMONIO = :KCAD_PATRIMONIO ) ' +
        ')'
      '  AND ( :DSP_INATIVO = '#39'T'#39' OR ATIVO = '#39'T'#39' )')
    Left = 214
    Top = 92
    object sqlPatrimonioKCAD_PATRIMONIO: TStringField
      FieldName = 'KCAD_PATRIMONIO'
      Required = True
      FixedChar = True
    end
    object sqlPatrimonioCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField
      FieldName = 'DATA_IMOBILIZADO'
    end
    object sqlPatrimonioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object sqlPatrimonioQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object sqlPatrimonioVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Required = True
    end
    object sqlPatrimonioVALOR_FINAL: TFloatField
      FieldName = 'VALOR_FINAL'
    end
    object sqlPatrimonioVIDA_UTIL: TIntegerField
      FieldName = 'VIDA_UTIL'
    end
    object sqlPatrimonioATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPatrimonioOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlDepreciacao: TTcSQLDataSet
    SchemaName = 'sysdba'
    DataSource = dtsPatrimonio
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'KCAD_PATRIMONIO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    PD.DATA,'
      '    PD.VALOR,'
      
        '    ( IIF(AP.PORCENTAGEM IS NOT NULL, (PD.VALOR_PATRIMONIO*AP.PO' +
        'RCENTAGEM)/100, PD.VALOR_PATRIMONIO)'
      '     ) VALOR_DEPRECIACAO,'
      '    PC.NOME PLANO_CONTA,'
      '    CC.NOME CENTRO_CUSTO,'
      '    AP.PORCENTAGEM'
      'FROM CAD_PATRIMONIO_DEPRECIACOES PD'
      
        'LEFT JOIN CAD_PATRIMONIOS P ON P.KCAD_PATRIMONIO =  PD.KCAD_PATR' +
        'IMONIO'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = P.KFIN_PL' +
        'ANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON AP.TABLENAME = '#39'CAD_PATRIMONIOS' +
        #39' AND AP.TABLEKEY = P.KCAD_PATRIMONIO'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'WHERE PD.KCAD_PATRIMONIO = :KCAD_PATRIMONIO')
    Left = 301
    Top = 92
    object sqlDepreciacaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlDepreciacaoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlDepreciacaoVALOR_DEPRECIACAO: TFloatField
      FieldName = 'VALOR_DEPRECIACAO'
    end
    object sqlDepreciacaoPLANO_CONTA: TStringField
      FieldName = 'PLANO_CONTA'
      Size = 64
    end
    object sqlDepreciacaoCENTRO_CUSTO: TStringField
      FieldName = 'CENTRO_CUSTO'
      Size = 64
    end
    object sqlDepreciacaoPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
  end
  object dtsPatrimonio: TDataSource
    DataSet = sqlPatrimonio
    Left = 256
    Top = 49
  end
  object cdsDepreciacao: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPatrimoniosqlDepreciacao
    Params = <>
    Left = 307
    Top = 4
    object cdsDepreciacaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDepreciacaoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = 'R$ #,0.00'
    end
    object cdsDepreciacaoVALOR_DEPRECIACAO: TFloatField
      FieldName = 'VALOR_DEPRECIACAO'
      DisplayFormat = 'R$ #,0.00'
    end
    object cdsDepreciacaoPLANO_CONTA: TStringField
      FieldName = 'PLANO_CONTA'
      Size = 64
    end
    object cdsDepreciacaoCENTRO_CUSTO: TStringField
      FieldName = 'CENTRO_CUSTO'
      Size = 64
    end
    object cdsDepreciacaoPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '00.## %'
    end
  end
end
