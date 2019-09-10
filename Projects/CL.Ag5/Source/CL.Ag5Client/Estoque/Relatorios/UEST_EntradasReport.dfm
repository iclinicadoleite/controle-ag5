inherited EST_EntradasReport: TEST_EntradasReport
  Left = 314
  Top = 116
  Caption = 'EST_EntradasReport'
  ClientHeight = 708
  ClientWidth = 1145
  ExplicitWidth = 1161
  ExplicitHeight = 747
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = 14
    Width = 1123
    Height = 794
    BeforePrint = QuickRepBeforePrint
    DataSet = EST_EntradasReportDatamodule.cdsEntradas
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
    ExplicitLeft = 14
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited rbPageHeader: TQRBand
      Width = 1047
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      ExplicitWidth = 1047
      inherited _qrsDateTime: TQRSysData
        Left = 925
        Size.Values = (
          42.333333333333340000
          2447.395833333333000000
          0.000000000000000000
          322.791666666666700000)
        FontSize = 9
        ExplicitLeft = 925
      end
      inherited _qrsPageNumber: TQRSysData
        Left = 957
        Width = 90
        Height = 16
        Size.Values = (
          42.333333333333340000
          2532.062500000000000000
          0.000000000000000000
          238.125000000000000000)
        Font.Height = -12
        FontSize = 9
        ExplicitLeft = 957
        ExplicitWidth = 90
        ExplicitHeight = 16
      end
      inherited QRShapeHeaderSeparator2: TQRShape
        Width = 1008
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          44.979166666666670000
          2667.000000000000000000)
        ExplicitWidth = 1008
      end
      inherited _qrsReportTitle2: TQRSysData
        Left = 489
        Size.Values = (
          42.333333333333340000
          1293.812500000000000000
          0.000000000000000000
          179.916666666666700000)
        FontSize = 9
        ExplicitLeft = 489
      end
    end
    inherited rbTitle: TQRBand
      Width = 1047
      Size.Values = (
        293.687500000000000000
        2770.187500000000000000)
      ExplicitWidth = 1047
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
        Left = 925
        Size.Values = (
          42.333333333333340000
          2447.395833333333000000
          203.729166666666700000
          322.791666666666700000)
        FontSize = 9
        ExplicitLeft = 925
      end
      inherited _qrsPageNumberTitle: TQRSysData
        Left = 957
        Top = 92
        Size.Values = (
          42.333333333333340000
          2532.062500000000000000
          243.416666666666700000
          238.125000000000000000)
        FontSize = 9
        ExplicitLeft = 957
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
        Left = 484
        Size.Values = (
          42.333333333333340000
          1280.583333333333000000
          68.791666666666680000
          206.375000000000000000)
        FontSize = 9
        ExplicitLeft = 484
      end
      inherited QRShapeHeaderSeparator: TQRShape
        Left = 3
        Top = 74
        Width = 1039
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          195.791666666666700000
          2749.020833333333000000)
        ExplicitLeft = 3
        ExplicitTop = 74
        ExplicitWidth = 1039
      end
      inherited QRImageDomain: TQRImage
        Left = 892
        Top = 6
        Size.Values = (
          156.104166666666700000
          2360.083333333333000000
          15.875000000000000000
          391.583333333333400000)
        ExplicitLeft = 892
        ExplicitTop = 6
      end
    end
    inherited rbDetail: TQRBand
      Top = 193
      Width = 1047
      Height = 19
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        50.270833333333330000
        2770.187500000000000000)
      ExplicitTop = 193
      ExplicitWidth = 1047
      ExplicitHeight = 19
      object qrDBDocumento: TQRDBText
        Left = 3
        Top = 2
        Width = 91
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          5.291666666666667000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = EST_EntradasReportDatamodule.cdsEntradas
        DataField = 'DOCUMENTO'
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
      object QRDBText2: TQRDBText
        Left = 97
        Top = 2
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          256.645833333333300000
          5.291666666666667000
          222.250000000000000000)
        XLColumn = 1
        XLNumFormat = nfDate2
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = EST_EntradasReportDatamodule.cdsEntradas
        DataField = 'DATALANCTO'
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
      object qrDBDescricao: TQRDBText
        Left = 183
        Top = 2
        Width = 123
        Height = 15
        Size.Values = (
          39.687500000000000000
          484.187500000000000000
          5.291666666666667000
          325.437500000000000000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = EST_EntradasReportDatamodule.cdsEntradas
        DataField = 'HISTORICO'
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
      object qrDBContaContabil: TQRDBText
        Left = 309
        Top = 2
        Width = 206
        Height = 15
        Size.Values = (
          39.687500000000000000
          817.562500000000000000
          5.291666666666667000
          545.041666666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = EST_EntradasReportDatamodule.cdsEntradas
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
      object qrDBCentroCusto: TQRDBText
        Left = 519
        Top = 2
        Width = 205
        Height = 15
        Size.Values = (
          39.687500000000000000
          1373.187500000000000000
          5.291666666666667000
          542.395833333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = EST_EntradasReportDatamodule.cdsEntradas
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
      object QRDBText6: TQRDBText
        Left = 740
        Top = 2
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          1957.916666666667000000
          5.291666666666667000
          214.312500000000000000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = EST_EntradasReportDatamodule.cdsEntradas
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
      object QRDBText8: TQRDBText
        Left = 835
        Top = 2
        Width = 89
        Height = 15
        Size.Values = (
          39.687500000000000000
          2209.270833333333000000
          5.291666666666667000
          235.479166666666700000)
        XLColumn = 6
        XLNumFormat = nfDec2
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = EST_EntradasReportDatamodule.cdsEntradas
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
      object QRDBText7: TQRDBText
        Left = 948
        Top = 2
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          2508.250000000000000000
          5.291666666666667000
          224.895833333333300000)
        XLColumn = 7
        XLNumFormat = nfDec2
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = EST_EntradasReportDatamodule.cdsEntradas
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
    end
    inherited rbPageFooter: TQRBand
      Top = 232
      Width = 1047
      Height = 72
      Size.Values = (
        190.500000000000000000
        2770.187500000000000000)
      ExplicitTop = 232
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
        Top = 11
        Width = 1008
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          29.104166666666670000
          2667.000000000000000000)
        ExplicitTop = 11
        ExplicitWidth = 1008
      end
      inherited QRLabelFooterSeparator1: TQRLabel
        Top = 13
        Size.Values = (
          34.395833333333340000
          55.562500000000000000
          34.395833333333340000
          518.583333333333400000)
        FontSize = 7
        ExplicitTop = 13
      end
      inherited QRShapeFooterSeparator: TQRShape
        Left = 125
        Top = 42
        Width = 917
        Size.Values = (
          2.645833333333333000
          330.729166666666700000
          111.125000000000000000
          2426.229166666667000000)
        ExplicitLeft = 125
        ExplicitTop = 42
        ExplicitWidth = 917
      end
      inherited QRLabelFooterSeparator: TQRLabel
        Left = 192
        Top = 28
        Size.Values = (
          34.395833333333340000
          508.000000000000000000
          74.083333333333340000
          518.583333333333400000)
        FontSize = 7
        ExplicitLeft = 192
        ExplicitTop = 28
      end
      inherited LogoClinica: TQRImage
        Left = 4
        Top = 13
        Size.Values = (
          92.604166666666680000
          10.583333333333330000
          34.395833333333340000
          198.437500000000000000)
        ExplicitLeft = 4
        ExplicitTop = 13
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
      Width = 1047
      Height = 20
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = rbSummaryBeforePrint
      Enabled = True
      Size.Values = (
        52.916666666666670000
        2770.187500000000000000)
      ExplicitTop = 212
      ExplicitWidth = 1047
      ExplicitHeight = 20
      object QRLabel10: TQRLabel
        Left = 803
        Top = 2
        Width = 116
        Height = 17
        Size.Values = (
          44.979166666666670000
          2124.604166666667000000
          5.291666666666667000
          306.916666666666700000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total no per'#237'odo : R$ '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 920
        Top = 2
        Width = 123
        Height = 17
        Size.Values = (
          44.979166666666670000
          2434.166666666667000000
          5.291666666666667000
          325.437500000000000000)
        XLColumn = 7
        XLNumFormat = nfDec2
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
        Transparent = True
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    inherited rbColumnHeader: TQRBand
      Width = 1047
      Height = 20
      Frame.DrawTop = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        2770.187500000000000000)
      ExplicitWidth = 1047
      ExplicitHeight = 20
      object QRLabel1: TQRLabel
        Left = 4
        Top = 3
        Width = 90
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          7.937500000000000000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Lan'#231'amento'
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
      object QRLabel2: TQRLabel
        Left = 97
        Top = 3
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          256.645833333333300000
          7.937500000000000000
          222.250000000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Data lan'#231'amento'
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
      object QRLabel3: TQRLabel
        Left = 183
        Top = 3
        Width = 122
        Height = 15
        Size.Values = (
          39.687500000000000000
          484.187500000000000000
          7.937500000000000000
          322.791666666666700000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Descri'#231#227'o'
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
      object QRLabel4: TQRLabel
        Left = 309
        Top = 3
        Width = 206
        Height = 15
        Size.Values = (
          39.687500000000000000
          817.562500000000000000
          7.937500000000000000
          545.041666666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taCenter
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
      object QRLabel5: TQRLabel
        Left = 519
        Top = 3
        Width = 205
        Height = 15
        Size.Values = (
          39.687500000000000000
          1373.187500000000000000
          7.937500000000000000
          542.395833333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taCenter
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
      object QRLabel6: TQRLabel
        Left = 740
        Top = 3
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          1957.916666666667000000
          7.937500000000000000
          214.312500000000000000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
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
      object QRLabel7: TQRLabel
        Left = 948
        Top = 3
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          2508.250000000000000000
          7.937500000000000000
          224.895833333333300000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor'
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
        Left = 836
        Top = 3
        Width = 87
        Height = 15
        Size.Values = (
          39.687500000000000000
          2211.916666666667000000
          7.937500000000000000
          230.187500000000000000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taCenter
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
    end
  end
end
