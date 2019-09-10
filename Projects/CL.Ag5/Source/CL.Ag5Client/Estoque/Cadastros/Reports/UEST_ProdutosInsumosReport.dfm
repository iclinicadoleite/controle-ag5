inherited EST_ProdutosInsumosReport: TEST_ProdutosInsumosReport
  Left = 247
  Top = 220
  Caption = 'Rela'#231#227'o de produtos '
  ClientHeight = 765
  ClientWidth = 1121
  ExplicitWidth = 1137
  ExplicitHeight = 804
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = 0
    Top = 0
    Width = 1123
    Height = 794
    DataSet = cdsProdutosInsumo
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
    PrevInitialZoom = qrZoomToWidth
    ExplicitLeft = 0
    ExplicitTop = 0
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
        Left = 3
        Width = 1040
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          44.979166666666670000
          2751.666666666667000000)
        ExplicitLeft = 3
        ExplicitWidth = 1040
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
      Frame.Color = 15724527
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
        Width = 1040
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          195.791666666666700000
          2751.666666666667000000)
        ExplicitLeft = 3
        ExplicitTop = 74
        ExplicitWidth = 1040
      end
      inherited QRImageDomain: TQRImage
        Left = 894
        Top = 4
        Size.Values = (
          156.104166666666700000
          2365.375000000000000000
          10.583333333333330000
          391.583333333333400000)
        ExplicitLeft = 894
        ExplicitTop = 4
      end
    end
    inherited rbDetail: TQRBand
      Top = 239
      Width = 1047
      Height = 22
      Frame.Color = 15724527
      Size.Values = (
        58.208333333333340000
        2770.187500000000000000)
      ExplicitTop = 239
      ExplicitWidth = 1047
      ExplicitHeight = 22
      object QRDBText1: TQRDBText
        Left = 3
        Top = 3
        Width = 42
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          7.937500000000000000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumo
        DataField = 'CODIGO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 47
        Top = 3
        Width = 135
        Height = 15
        Size.Values = (
          39.687500000000000000
          124.354166666666700000
          7.937500000000000000
          357.187500000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumo
        DataField = 'NOME'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 183
        Top = 3
        Width = 228
        Height = 15
        Size.Values = (
          39.687500000000000000
          484.187500000000000000
          7.937500000000000000
          603.250000000000000000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumo
        DataField = 'DESCRICAO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 412
        Top = 3
        Width = 144
        Height = 15
        Size.Values = (
          39.687500000000000000
          1090.083333333333000000
          7.937500000000000000
          381.000000000000000000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumo
        DataField = 'ULTIMO_FORNECEDOR'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 557
        Top = 3
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1473.729166666667000000
          7.937500000000000000
          211.666666666666700000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumo
        DataField = 'QTDE_PRODUTO'
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 638
        Top = 3
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          1688.041666666667000000
          7.937500000000000000
          142.875000000000000000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumo
        DataField = 'UNIDADE'
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 694
        Top = 3
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          1836.208333333333000000
          7.937500000000000000
          222.250000000000000000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumo
        DataField = 'CUSTO_MEDIO'
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 779
        Top = 3
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          2061.104166666667000000
          7.937500000000000000
          214.312500000000000000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumo
        DataField = 'TOTAL'
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 862
        Top = 3
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2280.708333333333000000
          7.937500000000000000
          264.583333333333300000)
        XLColumn = 8
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumo
        DataField = 'BAIXA_ESTOQUE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 964
        Top = 3
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          2550.583333333333000000
          7.937500000000000000
          206.375000000000000000)
        XLColumn = 9
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumo
        DataField = 'QTDE_MINIMA'
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 278
      Width = 1047
      Height = 72
      Size.Values = (
        190.500000000000000000
        2770.187500000000000000)
      ExplicitTop = 278
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
        Left = 3
        Top = 11
        Width = 1040
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          29.104166666666670000
          2751.666666666667000000)
        ExplicitLeft = 3
        ExplicitTop = 11
        ExplicitWidth = 1040
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
        Width = 930
        Size.Values = (
          2.645833333333333000
          298.979166666666700000
          111.125000000000000000
          2460.625000000000000000)
        ExplicitLeft = 113
        ExplicitTop = 42
        ExplicitWidth = 930
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
        Left = 1
        Top = 13
        Width = 75
        Height = 35
        Size.Values = (
          92.604166666666680000
          2.645833333333333000
          34.395833333333340000
          198.437500000000000000)
        ExplicitLeft = 1
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
      Top = 261
      Width = 1047
      Height = 17
      Size.Values = (
        44.979166666666670000
        2770.187500000000000000)
      ExplicitTop = 261
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
    end
    inherited rbColumnHeader: TQRBand
      Width = 1047
      Height = 21
      Frame.Color = 15724527
      Enabled = False
      Size.Values = (
        55.562500000000000000
        2770.187500000000000000)
      ExplicitWidth = 1047
      ExplicitHeight = 21
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 194
      Width = 1047
      Height = 45
      Frame.Color = 15724527
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        119.062500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'cdsProdutosInsumo.KTIPO_PRODUTO'
      Master = QuickRep
      ReprintOnNewPage = False
      object QRLabel1: TQRLabel
        Left = 4
        Top = 1
        Width = 110
        Height = 16
        Size.Values = (
          42.333333333333340000
          10.583333333333330000
          2.645833333333333000
          291.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Grupo de produtos :'
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
      object QRDBText11: TQRDBText
        Left = 124
        Top = 1
        Width = 131
        Height = 16
        Size.Values = (
          42.333333333333340000
          328.083333333333400000
          2.645833333333333000
          346.604166666666700000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsProdutosInsumo
        DataField = 'DESCR_TIPOPRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 3
        Top = 27
        Width = 42
        Height = 16
        Size.Values = (
          42.333333333333330000
          7.937500000000000000
          71.437500000000000000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
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
      object QRLabel7: TQRLabel
        Left = 47
        Top = 27
        Width = 135
        Height = 16
        Size.Values = (
          42.333333333333330000
          124.354166666666700000
          71.437500000000000000
          357.187500000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Nome'
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
        Left = 183
        Top = 27
        Width = 228
        Height = 16
        Size.Values = (
          42.333333333333330000
          484.187500000000000000
          71.437500000000000000
          603.250000000000000000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
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
      object QRLabel9: TQRLabel
        Left = 412
        Top = 27
        Width = 144
        Height = 16
        Size.Values = (
          42.333333333333330000
          1090.083333333333000000
          71.437500000000000000
          381.000000000000000000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = #218'ltimo fornecedor'
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
        Left = 557
        Top = 27
        Width = 80
        Height = 16
        Size.Values = (
          42.333333333333330000
          1473.729166666667000000
          71.437500000000000000
          211.666666666666700000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Saldo estoque'
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
        Left = 638
        Top = 27
        Width = 54
        Height = 16
        Size.Values = (
          42.333333333333330000
          1688.041666666667000000
          71.437500000000000000
          142.875000000000000000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Unidade'
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
        Left = 694
        Top = 27
        Width = 84
        Height = 16
        Size.Values = (
          42.333333333333330000
          1836.208333333333000000
          71.437500000000000000
          222.250000000000000000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taCenter
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
      object QRLabel13: TQRLabel
        Left = 779
        Top = 27
        Width = 81
        Height = 16
        Size.Values = (
          42.333333333333330000
          2061.104166666667000000
          71.437500000000000000
          214.312500000000000000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taCenter
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
      object QRLabel14: TQRLabel
        Left = 862
        Top = 27
        Width = 100
        Height = 16
        Size.Values = (
          42.333333333333330000
          2280.708333333333000000
          71.437500000000000000
          264.583333333333300000)
        XLColumn = 8
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Controle estoque'
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
        Left = 964
        Top = 27
        Width = 78
        Height = 16
        Size.Values = (
          42.333333333333330000
          2550.583333333333000000
          71.437500000000000000
          206.375000000000000000)
        XLColumn = 9
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Qtde m'#237'nima'
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
  object cdsProdutosInsumo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IS_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IS_INSUMO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IS_SERVICO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'POR_TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutosInsumo'
    Left = 219
    Top = 3
    object cdsProdutosInsumoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsProdutosInsumoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsProdutosInsumoDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProdutosInsumoULTIMO_FORNECEDOR: TStringField
      FieldName = 'ULTIMO_FORNECEDOR'
      Size = 128
    end
    object cdsProdutosInsumoKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      FixedChar = True
    end
    object cdsProdutosInsumoDESCR_TIPOPRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_TIPOPRODUTO'
      LookupDataSet = cdsTiposProduto
      LookupKeyFields = 'KCAD_TIPOS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'KTIPO_PRODUTO'
      Size = 32
      Lookup = True
    end
    object cdsProdutosInsumoQTDE_PRODUTO: TFloatField
      FieldName = 'QTDE_PRODUTO'
      Required = True
      DisplayFormat = '0'
    end
    object cdsProdutosInsumoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsProdutosInsumoCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
      Required = True
      DisplayFormat = 'R$ #,0.00'
    end
    object cdsProdutosInsumoTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
      DisplayFormat = 'R$ #,0.00'
    end
    object cdsProdutosInsumoBAIXA_ESTOQUE: TStringField
      FieldName = 'BAIXA_ESTOQUE'
      OnGetText = cdsProdutosInsumoBAIXA_ESTOQUEGetText
      FixedChar = True
      Size = 1
    end
    object cdsProdutosInsumoQTDE_MINIMA: TFloatField
      FieldName = 'QTDE_MINIMA'
    end
  end
  object dspProdutosInsumo: TDataSetProvider
    DataSet = sqlProdutosInsumo
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 46
  end
  object sqlProdutosInsumo: TTcSQLDataSet
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
        Name = 'IS_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IS_INSUMO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IS_SERVICO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'POR_TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TIPO'
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
      '  CODIGO,'
      '  NOME,'
      '  DESCRICAO,'
      '  ULTIMO_FORNECEDOR,'
      '  QTDE_PRODUTO,'
      '  KTIPO_PRODUTO,'
      '  UNIDADE,'
      '  CUSTO_MEDIO,'
      '  (  QTDE_PRODUTO *  CUSTO_MEDIO ) TOTAL,'
      '  BAIXA_ESTOQUE,'
      '  QTDE_MINIMA'
      'FROM EST_PRODUTOS'
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND (    ( :IS_PRODUTO = '#39'T'#39' AND PRODUTO_INSUMO_SERVICO = 1 )'
      '        OR ( :IS_INSUMO  = '#39'T'#39' AND PRODUTO_INSUMO_SERVICO = 2 )'
      '        OR ( :IS_SERVICO = '#39'T'#39' AND PRODUTO_INSUMO_SERVICO = 3 )'
      '       )'
      '  AND ( ( :POR_TIPO = '#39'F'#39' ) OR ( KTIPO_PRODUTO = :TIPO ) )'
      '  AND ( :DSP_INATIVO = '#39'T'#39' OR ( ATIVO = '#39'T'#39' ) )'
      'ORDER BY   KTIPO_PRODUTO')
    Left = 232
    Top = 102
    object sqlProdutosInsumoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlProdutosInsumoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlProdutosInsumoDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlProdutosInsumoULTIMO_FORNECEDOR: TStringField
      FieldName = 'ULTIMO_FORNECEDOR'
      Size = 128
    end
    object sqlProdutosInsumoKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      FixedChar = True
    end
    object sqlProdutosInsumoQTDE_PRODUTO: TFloatField
      FieldName = 'QTDE_PRODUTO'
      Required = True
    end
    object sqlProdutosInsumoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlProdutosInsumoCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
      Required = True
    end
    object sqlProdutosInsumoTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
    end
    object sqlProdutosInsumoBAIXA_ESTOQUE: TStringField
      FieldName = 'BAIXA_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sqlProdutosInsumoQTDE_MINIMA: TFloatField
      FieldName = 'QTDE_MINIMA'
    end
  end
  object cdsTiposProduto: TClientDataSet
    PersistDataPacket.Data = {
      570000009619E0BD01000000180000000200000000000300000057000A4B4341
      445F5449504F5301004900000001000557494454480200020020000944455343
      524943414F01004900000001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 349
    Top = 12
    object cdsTiposProdutoKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      Size = 32
    end
    object cdsTiposProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
  end
end
