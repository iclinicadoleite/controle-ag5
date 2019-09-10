inherited Zoo_QRDiarioDaMastite: TZoo_QRDiarioDaMastite
  Left = 269
  Top = 208
  Caption = 'Zoo_QRDiarioDaMastite'
  ClientWidth = 1145
  ExplicitWidth = 1161
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Width = 1123
    Height = 794
    DataSet = Zoo_AtividadesDiarioDaMastiteDatamodule.cdsATarefas
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Orientation = poLandscape
    Page.Values = (
      50.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
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
        Width = 999
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          44.979166666666670000
          2643.187500000000000000)
        ExplicitWidth = 999
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
        Size.Values = (
          42.333333333333340000
          2532.062500000000000000
          246.062500000000000000
          238.125000000000000000)
        FontSize = 9
        ExplicitLeft = 957
      end
      inherited _qrImageLogo: TQRImage
        Size.Values = (
          185.208333333333300000
          52.916666666666670000
          7.937500000000000000
          251.354166666666700000)
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
        Width = 999
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          198.437500000000000000
          2643.187500000000000000)
        ExplicitWidth = 999
      end
      inherited QRImageDomain: TQRImage
        Left = 870
        Size.Values = (
          156.104166666666700000
          2301.875000000000000000
          7.937500000000000000
          391.583333333333400000)
        ExplicitLeft = 870
      end
    end
    inherited rbDetail: TQRBand
      Top = 205
      Width = 1047
      Size.Values = (
        89.958333333333320000
        2770.187500000000000000)
      ExplicitTop = 205
      ExplicitWidth = 1047
      object QRDBText1: TQRDBText
        Left = 8
        Top = 2
        Width = 73
        Height = 28
        Size.Values = (
          74.083333333333320000
          21.166666666666670000
          5.291666666666667000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Zoo_AtividadesDiarioDaMastiteDatamodule.cdsATarefas
        DataField = 'BRINCOFEMEA'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 90
        Top = 2
        Width = 64
        Height = 28
        Size.Values = (
          74.083333333333320000
          238.125000000000000000
          5.291666666666667000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Zoo_AtividadesDiarioDaMastiteDatamodule.cdsATarefas
        DataField = 'NOMEFEMEA'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 162
        Top = 2
        Width = 66
        Height = 28
        Size.Values = (
          74.083333333333320000
          428.625000000000000000
          5.291666666666667000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Zoo_AtividadesDiarioDaMastiteDatamodule.cdsATarefas
        DataField = 'LOTE'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 234
        Top = 2
        Width = 84
        Height = 28
        Size.Values = (
          74.083333333333320000
          619.125000000000000000
          5.291666666666667000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Zoo_AtividadesDiarioDaMastiteDatamodule.cdsATarefas
        DataField = 'DATAPROGRAMADA'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 329
        Top = 0
        Width = 185
        Height = 28
        Size.Values = (
          74.083333333333320000
          870.479166666666800000
          0.000000000000000000
          489.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Zoo_AtividadesDiarioDaMastiteDatamodule.cdsATarefas
        DataField = 'TAREFA'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 524
        Top = 2
        Width = 167
        Height = 28
        Size.Values = (
          74.083333333333320000
          1386.416666666667000000
          5.291666666666667000
          441.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Zoo_AtividadesDiarioDaMastiteDatamodule.cdsATarefas
        DataField = 'OBS'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 697
        Top = 2
        Width = 82
        Height = 28
        Size.Values = (
          74.083333333333320000
          1844.145833333333000000
          5.291666666666667000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Zoo_AtividadesDiarioDaMastiteDatamodule.cdsATarefas
        DataField = 'PROTOCOLO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 789
        Top = 2
        Width = 70
        Height = 28
        Size.Values = (
          74.083333333333320000
          2087.562500000000000000
          5.291666666666667000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Zoo_AtividadesDiarioDaMastiteDatamodule.cdsATarefas
        DataField = 'REPONSAVEL'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 86
        Top = 0
        Width = 1
        Height = 32
        Size.Values = (
          84.666666666666680000
          227.541666666666700000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 159
        Top = 0
        Width = 1
        Height = 32
        Size.Values = (
          84.666666666666680000
          420.687500000000000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 229
        Top = 0
        Width = 1
        Height = 32
        Size.Values = (
          84.666666666666680000
          605.895833333333200000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 322
        Top = 0
        Width = 1
        Height = 32
        Size.Values = (
          84.666666666666680000
          851.958333333333200000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 520
        Top = 0
        Width = 1
        Height = 32
        Size.Values = (
          84.666666666666680000
          1375.833333333333000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 694
        Top = 0
        Width = 1
        Height = 32
        Size.Values = (
          84.666666666666680000
          1836.208333333333000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 782
        Top = 0
        Width = 1
        Height = 32
        Size.Values = (
          84.666666666666680000
          2069.041666666667000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 864
        Top = 0
        Width = 1
        Height = 32
        Size.Values = (
          84.666666666666680000
          2286.000000000000000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 957
        Top = 0
        Width = 1
        Height = 32
        Size.Values = (
          84.666666666666680000
          2532.062500000000000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 273
      Width = 1047
      Size.Values = (
        201.083333333333300000
        2770.187500000000000000)
      ExplicitTop = 273
      ExplicitWidth = 1047
      inherited _qrlFooter: TQRLabel
        Size.Values = (
          34.395833333333340000
          0.000000000000000000
          0.000000000000000000
          140.229166666666700000)
        FontSize = 7
      end
      inherited QRShapeFooterSeparator1: TQRShape
        Width = 999
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          29.104166666666670000
          2643.187500000000000000)
        ExplicitWidth = 999
      end
      inherited QRLabelFooterSeparator1: TQRLabel
        Size.Values = (
          34.395833333333340000
          55.562500000000000000
          34.395833333333340000
          518.583333333333400000)
        FontSize = 7
      end
      inherited QRShapeFooterSeparator: TQRShape
        Left = 190
        Width = 829
        Size.Values = (
          2.645833333333333000
          502.708333333333300000
          71.437500000000000000
          2193.395833333333000000)
        ExplicitLeft = 190
        ExplicitWidth = 829
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
        Left = 20
        Top = -4
        Size.Values = (
          92.604166666666680000
          52.916666666666670000
          -10.583333333333330000
          198.437500000000000000)
        ExplicitLeft = 20
        ExplicitTop = -4
      end
    end
    inherited rbSummary: TQRBand
      Top = 239
      Width = 1047
      Size.Values = (
        89.958333333333320000
        2770.187500000000000000)
      ExplicitTop = 239
      ExplicitWidth = 1047
    end
    inherited rbColumnHeader: TQRBand
      Width = 1047
      Height = 24
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      ExplicitWidth = 1047
      ExplicitHeight = 24
      object QRLabel1: TQRLabel
        Left = 8
        Top = 3
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          7.937500000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Brinco'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 90
        Top = 3
        Width = 63
        Height = 15
        Size.Values = (
          39.687500000000000000
          238.125000000000000000
          7.937500000000000000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Nome'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 162
        Top = 3
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          428.625000000000000000
          7.937500000000000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Lote'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 234
        Top = 3
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          619.125000000000000000
          7.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Data programada'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 329
        Top = 3
        Width = 185
        Height = 15
        Size.Values = (
          39.687500000000000000
          870.479166666666800000
          7.937500000000000000
          489.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Tarefa'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 524
        Top = 3
        Width = 167
        Height = 15
        Size.Values = (
          39.687500000000000000
          1386.416666666667000000
          7.937500000000000000
          441.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Obs'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 697
        Top = 3
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          1844.145833333333000000
          7.937500000000000000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Protocolo'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 785
        Top = 3
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          2076.979166666667000000
          7.937500000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Respons'#225'vel'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 870
        Top = 3
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          2301.875000000000000000
          7.937500000000000000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Data execu'#231#227'o'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 962
        Top = 3
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          2545.291666666667000000
          7.937500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Funcion'#225'rio'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 86
        Top = 2
        Width = 1
        Height = 20
        Size.Values = (
          52.916666666666670000
          227.541666666666700000
          5.291666666666667000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 159
        Top = 2
        Width = 1
        Height = 20
        Size.Values = (
          52.916666666666670000
          420.687500000000000000
          5.291666666666667000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 229
        Top = 2
        Width = 1
        Height = 20
        Size.Values = (
          52.916666666666670000
          605.895833333333200000
          5.291666666666667000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 322
        Top = 2
        Width = 1
        Height = 20
        Size.Values = (
          52.916666666666670000
          851.958333333333200000
          5.291666666666667000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 520
        Top = 2
        Width = 1
        Height = 20
        Size.Values = (
          52.916666666666670000
          1375.833333333333000000
          5.291666666666667000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 694
        Top = 2
        Width = 1
        Height = 20
        Size.Values = (
          52.916666666666670000
          1836.208333333333000000
          5.291666666666667000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 782
        Top = 2
        Width = 1
        Height = 20
        Size.Values = (
          52.916666666666670000
          2069.041666666667000000
          5.291666666666667000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 864
        Top = 2
        Width = 1
        Height = 20
        Size.Values = (
          52.916666666666670000
          2286.000000000000000000
          5.291666666666667000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 957
        Top = 2
        Width = 1
        Height = 20
        Size.Values = (
          52.916666666666670000
          2532.062500000000000000
          5.291666666666667000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object QRGroup: TQRGroup
      Left = 38
      Top = 197
      Width = 1047
      Height = 8
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        21.166666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep
      ReprintOnNewPage = False
    end
  end
end
