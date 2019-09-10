inherited FIN_ProdutosInsumosMovimentoReport: TFIN_ProdutosInsumosMovimentoReport
  Left = 520
  Top = 106
  Caption = 'FIN_ProdutosInsumosMovimentoReport'
  ClientWidth = 840
  OnCreate = TcMPFormCreate
  ExplicitWidth = 856
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    DataSet = cdsProdutosInsumos
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
    PrevInitialZoom = qrZoomToWidth
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
      Frame.Color = 15724527
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
      Top = 194
      Height = 46
      Frame.Color = 15724527
      Frame.DrawLeft = False
      Frame.DrawRight = False
      BeforePrint = rbDetailBeforePrint
      Font.Height = -12
      Size.Values = (
        121.708333333333300000
        1899.708333333333000000)
      ExplicitTop = 194
      ExplicitHeight = 46
      object QRLabel1: TQRLabel
        Left = 4
        Top = 5
        Width = 42
        Height = 17
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          13.229166666666670000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 51
        Top = 5
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          134.937500000000000000
          13.229166666666670000
          246.062500000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumos
        DataField = 'DESC_GRUPO'
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
        Left = 302
        Top = 5
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          799.041666666666800000
          13.229166666666670000
          89.958333333333340000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nome :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 337
        Top = 5
        Width = 130
        Height = 17
        Size.Values = (
          44.979166666666670000
          891.645833333333200000
          13.229166666666670000
          343.958333333333300000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumos
        DataField = 'NOME'
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
      object QRLabel3: TQRLabel
        Left = 153
        Top = 5
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          404.812500000000000000
          13.229166666666670000
          105.833333333333300000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 194
        Top = 5
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          513.291666666666700000
          13.229166666666670000
          171.979166666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumos
        DataField = 'CODIGO'
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
      object QRLabel4: TQRLabel
        Left = 474
        Top = 5
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          1254.125000000000000000
          13.229166666666670000
          148.166666666666700000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descri'#231#227'o :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 531
        Top = 5
        Width = 181
        Height = 17
        Size.Values = (
          44.979166666666670000
          1404.937500000000000000
          13.229166666666670000
          478.895833333333300000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumos
        DataField = 'DESCRICAO'
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
      object QRLabel5: TQRLabel
        Left = 4
        Top = 27
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          71.437500000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estoque :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 51
        Top = 27
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          134.937500000000000000
          71.437500000000000000
          198.437500000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumos
        DataField = 'ESTOQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 153
        Top = 27
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          404.812500000000000000
          71.437500000000000000
          174.625000000000000000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Custo m'#233'dio :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 220
        Top = 27
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          582.083333333333200000
          71.437500000000000000
          153.458333333333300000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumos
        DataField = 'CUSTO_MEDIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 302
        Top = 27
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666670000
          799.041666666666800000
          71.437500000000000000
          79.375000000000000000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 333
        Top = 27
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          881.062500000000000000
          71.437500000000000000
          185.208333333333300000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumos
        DataField = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 474
        Top = 27
        Width = 92
        Height = 17
        Size.Values = (
          44.979166666666670000
          1254.125000000000000000
          71.437500000000000000
          243.416666666666700000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #218'ltimo fornecedor :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 567
        Top = 27
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666670000
          1500.187500000000000000
          71.437500000000000000
          383.645833333333300000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsProdutosInsumos
        DataField = 'ULTIMO_FORNECEDOR'
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
    end
    inherited rbPageFooter: TQRBand
      Top = 325
      Height = 72
      Frame.Color = 15724527
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 325
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
      Top = 306
      Height = 19
      Frame.DrawBottom = True
      BeforePrint = rbSummaryBeforePrint
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      ExplicitTop = 306
      ExplicitHeight = 19
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
      Height = 21
      Frame.Color = 15724527
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Enabled = False
      Size.Values = (
        55.562500000000000000
        1899.708333333333000000)
      ExplicitHeight = 21
      object QRLabel16: TQRLabel
        Left = 596
        Top = 3
        Width = 120
        Height = 15
        Size.Values = (
          39.687500000000000000
          1576.916666666667000000
          7.937500000000000000
          317.500000000000000000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Centro de Custo'
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
        Left = 461
        Top = 3
        Width = 132
        Height = 15
        Size.Values = (
          39.687500000000000000
          1219.729166666667000000
          7.937500000000000000
          349.250000000000000000)
        XLColumn = 6
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
      object QRLabel14: TQRLabel
        Left = 385
        Top = 3
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1018.645833333333000000
          7.937500000000000000
          195.791666666666700000)
        XLColumn = 5
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
      object QRLabel13: TQRLabel
        Left = 309
        Top = 3
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          817.562500000000000000
          7.937500000000000000
          195.791666666666700000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor Sa'#237'da'
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
        Left = 240
        Top = 3
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          635.000000000000000000
          7.937500000000000000
          171.979166666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Qtde Sa'#237'da'
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
        Left = 146
        Top = 3
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          386.291666666666700000
          7.937500000000000000
          243.416666666666700000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor Entrada'
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
        Left = 62
        Top = 3
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          164.041666666666700000
          7.937500000000000000
          216.958333333333300000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Qtde Entrada'
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
        Left = 4
        Top = 3
        Width = 53
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          7.937500000000000000
          140.229166666666700000)
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
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 260
      Width = 718
      Height = 21
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
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
      DataSet = cdsMovimento
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText9: TQRDBText
        Left = 2
        Top = 3
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          7.937500000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfDate2
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMovimento
        DataField = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 68
        Top = 3
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          179.916666666666700000
          7.937500000000000000
          206.375000000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMovimento
        DataField = 'QTE_ENTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 148
        Top = 3
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          391.583333333333300000
          7.937500000000000000
          243.416666666666700000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMovimento
        DataField = 'VALOR_ENTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 242
        Top = 3
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          640.291666666666800000
          7.937500000000000000
          171.979166666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMovimento
        DataField = 'QTE_SAIDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 309
        Top = 3
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          817.562500000000000000
          7.937500000000000000
          195.791666666666700000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMovimento
        DataField = 'VALOR_SAIDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 385
        Top = 3
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1018.645833333333000000
          7.937500000000000000
          195.791666666666700000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMovimento
        DataField = 'TOTAL_LANCAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText15: TQRDBText
        Left = 461
        Top = 3
        Width = 132
        Height = 15
        Size.Values = (
          39.687500000000000000
          1219.729166666667000000
          7.937500000000000000
          349.250000000000000000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMovimento
        DataField = 'PLANO_CONTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText16: TQRDBText
        Left = 596
        Top = 3
        Width = 120
        Height = 15
        Size.Values = (
          39.687500000000000000
          1576.916666666667000000
          7.937500000000000000
          317.500000000000000000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMovimento
        DataField = 'CENTRO_CUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object QRSubDetail2: TQRSubDetail
      Left = 38
      Top = 281
      Width = 718
      Height = 25
      Frame.Color = clSilver
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = QRSubDetail2BeforePrint
      Color = clWhite
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRSubDetail1
      Size.Values = (
        66.145833333333340000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel17: TQRLabel
        Left = 472
        Top = 4
        Width = 221
        Height = 16
        Size.Values = (
          42.333333333333340000
          1248.833333333333000000
          10.583333333333330000
          584.729166666666800000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total movimento do produto no per'#237'odo'
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
      object QRLabel19: TQRLabel
        Left = 62
        Top = 4
        Width = 82
        Height = 16
        Size.Values = (
          42.333333333333330000
          164.041666666666700000
          10.583333333333330000
          216.958333333333300000)
        XLColumn = 1
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
      object QRLabel20: TQRLabel
        Left = 146
        Top = 4
        Width = 92
        Height = 16
        Size.Values = (
          42.333333333333330000
          386.291666666666700000
          10.583333333333330000
          243.416666666666700000)
        XLColumn = 2
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
      object QRLabel21: TQRLabel
        Left = 240
        Top = 4
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333330000
          635.000000000000000000
          10.583333333333330000
          171.979166666666700000)
        XLColumn = 3
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
      object QRLabel22: TQRLabel
        Left = 309
        Top = 4
        Width = 74
        Height = 16
        Size.Values = (
          42.333333333333330000
          817.562500000000000000
          10.583333333333330000
          195.791666666666700000)
        XLColumn = 4
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
      object QRLabel23: TQRLabel
        Left = 385
        Top = 4
        Width = 74
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333330000
          1018.645833333333000000
          10.583333333333330000
          195.791666666666700000)
        XLColumn = 5
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
      object QRShape1: TQRShape
        Left = 3
        Top = 23
        Width = 714
        Height = 1
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          60.854166666666680000
          1889.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 240
      Width = 718
      Height = 20
      Frame.Color = 15724527
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = rbDetail
      PrintOrder = cboAfterParent
      object QRLabel31: TQRLabel
        Left = 596
        Top = 2
        Width = 120
        Height = 15
        Size.Values = (
          39.687500000000000000
          1576.916666666667000000
          5.291666666666667000
          317.500000000000000000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Centro de Custo'
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
      object QRLabel32: TQRLabel
        Left = 461
        Top = 2
        Width = 132
        Height = 15
        Size.Values = (
          39.687500000000000000
          1219.729166666667000000
          5.291666666666667000
          349.250000000000000000)
        XLColumn = 6
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
      object QRLabel33: TQRLabel
        Left = 385
        Top = 2
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1018.645833333333000000
          5.291666666666667000
          195.791666666666700000)
        XLColumn = 5
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
      object QRLabel34: TQRLabel
        Left = 309
        Top = 2
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          817.562500000000000000
          5.291666666666667000
          195.791666666666700000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor Sa'#237'da'
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
      object QRLabel35: TQRLabel
        Left = 242
        Top = 2
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          640.291666666666800000
          5.291666666666667000
          171.979166666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Qtde Sa'#237'da'
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
      object QRLabel36: TQRLabel
        Left = 148
        Top = 2
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          391.583333333333300000
          5.291666666666667000
          243.416666666666700000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor Entrada'
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
      object QRLabel37: TQRLabel
        Left = 68
        Top = 2
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          179.916666666666700000
          5.291666666666667000
          206.375000000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Qtde Entrada'
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
      object QRLabel38: TQRLabel
        Left = 2
        Top = 2
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          5.291666666666667000
          169.333333333333300000)
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
    end
  end
  object cdsProdutosInsumos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KEST_PRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutosInsumos'
    Left = 216
    Top = 11
    object cdsProdutosInsumosKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsProdutosInsumosKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      FixedChar = True
    end
    object cdsProdutosInsumosDESC_GRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_GRUPO'
      LookupDataSet = cdsTiposProduto
      LookupKeyFields = 'KCAD_TIPOS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'KTIPO_PRODUTO'
      Size = 32
      Lookup = True
    end
    object cdsProdutosInsumosCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsProdutosInsumosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsProdutosInsumosDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProdutosInsumosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsProdutosInsumosULTIMO_FORNECEDOR: TStringField
      FieldName = 'ULTIMO_FORNECEDOR'
      Size = 128
    end
    object cdsProdutosInsumosESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
      Required = True
    end
    object cdsProdutosInsumosCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsProdutosInsumosTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsProdutosInsumossqlMovimento: TDataSetField
      FieldName = 'sqlMovimento'
    end
  end
  object dspProdutosInsumos: TDataSetProvider
    DataSet = sqlProdutosInsumos
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 56
  end
  object sqlProdutosInsumos: TTcSQLDataSet
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
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KEST_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT DISTINCT'
      '  P.KSYS$DOMAIN,'
      '  P.KEST_PRODUTO,'
      '  P.KTIPO_PRODUTO,'
      '  P.CODIGO,'
      '  P.NOME,'
      '  P.DESCRICAO,'
      '  P.UNIDADE,'
      '  P.ULTIMO_FORNECEDOR,'
      '  P.QTDE_PRODUTO ESTOQUE,'
      '  P.CUSTO_MEDIO CUSTO_MEDIO,'
      '  ( P.QTDE_PRODUTO * P.CUSTO_MEDIO ) TOTAL'
      'FROM EST_PRODUTOS P'
      'WHERE P.KSYS$DOMAIN = :KSYS$DOMAIN'
      '   AND (      (  ( :TIPO = 0 )'
      '                    AND (        (:TIPO_PRODUTO = 2  )'
      
        '                               OR (:TIPO_PRODUTO = 0  AND P.PROD' +
        'UTO_INSUMO_SERVICO = 1 )'
      
        '                               OR (:TIPO_PRODUTO = 1  AND P.PROD' +
        'UTO_INSUMO_SERVICO = 2 )'
      '                            )'
      '                 )'
      
        '                  OR ( ( :TIPO = 1 )  AND ( P.KTIPO_PRODUTO = :K' +
        'GRUPO ) )'
      
        '                  OR ( ( :TIPO = 2 ) AND ( P.KEST_PRODUTO = :KES' +
        'T_PRODUTO ) )'
      '       )'
      'ORDER BY P.KTIPO_PRODUTO, P.NOME')
    Left = 214
    Top = 111
  end
  object sqlMovimento: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsProdutos
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KEST_PRODUTO'
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
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  M.KEST_PRODUTO,'
      '  M.DATA,'
      '  M.TIPO,'
      '  IIF( M.TABLENAME = '#39'EST_PRODUTOS'#39', M.QTDE,'
      
        '       IIF( M.TIPO = '#39'E'#39', ( M.QTDE  * COALESCE( AP.PORCENTAGEM, ' +
        '100 ))/ 100, CAST( NULL AS FLOAT ))) QTE_ENTRADA,'
      '  IIF( M.TABLENAME = '#39'EST_PRODUTOS'#39', M.CUSTO,'
      
        '       IIF( M.TIPO = '#39'E'#39', ( M.CUSTO * COALESCE( AP.PORCENTAGEM, ' +
        '100 ))/ 100, CAST( NULL AS FLOAT ))) VALOR_ENTRADA,'
      
        '  IIF( M.TIPO IN ( '#39'D'#39', '#39'S'#39' ), ( M.QTDE  * COALESCE( AP.PORCENTA' +
        'GEM, 100 ))/ 100, CAST( NULL AS FLOAT )) QTE_SAIDA,'
      
        '--  IIF( M.TIPO IN ( '#39'D'#39', '#39'S'#39' ), ( COALESCE ( EMP.CUSTO_MEDIO, M' +
        '.CUSTO_MEDIO ) * COALESCE( AP.PORCENTAGEM, 100 ))/ 100, CAST( NU' +
        'LL AS FLOAT )) VALOR_SAIDA,'
      
        '  IIF( M.TIPO IN ( '#39'D'#39', '#39'S'#39' ), COALESCE ( EMP.CUSTO_MEDIO, M.CUS' +
        'TO_MEDIO ), CAST( NULL AS FLOAT )) VALOR_SAIDA,'
      '  CASE M.TIPO'
      '    WHEN  '#39'C'#39' THEN M.QTDE * M.CUSTO'
      
        '    WHEN  '#39'E'#39' THEN ((M.QTDE * COALESCE( AP.PORCENTAGEM, 100 ))/1' +
        '00)  * (( M.CUSTO * COALESCE( AP.PORCENTAGEM, 100 ) )/100)'
      
        '    WHEN  '#39'D'#39' THEN ((M.QTDE * COALESCE( AP.PORCENTAGEM, 100 ))/ ' +
        '100) * COALESCE ( EMP.CUSTO_MEDIO, M.CUSTO_MEDIO )'
      
        '    WHEN  '#39'S'#39' THEN ((M.QTDE * COALESCE( AP.PORCENTAGEM, 100 ))/ ' +
        '100) * COALESCE ( EMP.CUSTO_MEDIO, M.CUSTO_MEDIO )'
      '  END TOTAL_LANCAMENTO,'
      '  PL.CODIGO || '#39' - '#39' || PL.NOME PLANO_CONTA,'
      '  CC.CODIGO || '#39' - '#39' || CC.NOME CENTRO_CUSTO'
      'FROM EST_MOVIMENTO M'
      
        'LEFT JOIN CMP_PEDIDO_ITENS  CPI ON M.TABLENAME = '#39'CMP_PEDIDO_ITE' +
        'NS'#39' AND CPI.KCMP_PEDIDO_ITEM = M.TABLEKEY'
      
        'LEFT JOIN VND_PEDIDO_ITENS  VPI ON M.TABLENAME = '#39'VND_PEDIDO_ITE' +
        'NS'#39' AND VPI.KVND_PEDIDO_ITEM = M.TABLEKEY'
      
        'LEFT JOIN EST_OUTRAS_ENTRADAS_SAIDAS OES ON M.TABLENAME = '#39'EST_O' +
        'UTRAS_ENTRADAS_SAIDAS'#39' AND OES.KEST_OUTRA_ENTRADA_SAIDA = M.TABL' +
        'EKEY'
      
        'LEFT JOIN FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = CPI.KFIN_PL' +
        'ANOCONTA OR  PL.KFIN_PLANOCONTA = VPI.KFIN_PLANOCONTA OR PL.KFIN' +
        '_PLANOCONTA = OES.KFIN_PLANOCONTA'
      'LEFT JOIN FIN_APROPRIACAO AP ON AP.TABLEKEY = M.TABLEKEY'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      
        'LEFT JOIN EST_ENCERRAMENTO_MES EM ON EM.KSYS$DOMAIN = M.KSYS$DOM' +
        'AIN AND EM.ANO_MES = M.ANO_MES AND ENCERRADO = '#39'T'#39
      
        'LEFT JOIN EST_ENCERRAMENTO_MES_PRODUTOS EMP ON EMP.KEST_ENCERRAM' +
        'ENTO_MES = EM.KEST_ENCERRAMENTO_MES AND EMP.KEST_PRODUTO = M.KES' +
        'T_PRODUTO'
      'WHERE M.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND M.KEST_PRODUTO = :KEST_PRODUTO'
      '  AND M.DATA BETWEEN :DATAINI AND :DATAFIM'
      'ORDER BY M.KEST_PRODUTO, CAST ( M.DATA AS DATE ), M.MOVTO_ID')
    Left = 317
    Top = 111
    object sqlMovimentoKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      Required = True
      FixedChar = True
    end
    object sqlMovimentoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlMovimentoQTE_ENTRADA: TFloatField
      FieldName = 'QTE_ENTRADA'
    end
    object sqlMovimentoVALOR_ENTRADA: TFloatField
      FieldName = 'VALOR_ENTRADA'
    end
    object sqlMovimentoQTE_SAIDA: TFloatField
      FieldName = 'QTE_SAIDA'
    end
    object sqlMovimentoVALOR_SAIDA: TFloatField
      FieldName = 'VALOR_SAIDA'
    end
    object sqlMovimentoTOTAL_LANCAMENTO: TFloatField
      FieldName = 'TOTAL_LANCAMENTO'
    end
    object sqlMovimentoPLANO_CONTA: TStringField
      FieldName = 'PLANO_CONTA'
      Size = 78
    end
    object sqlMovimentoCENTRO_CUSTO: TStringField
      FieldName = 'CENTRO_CUSTO'
      Size = 78
    end
    object sqlMovimentoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsProdutos: TDataSource
    DataSet = sqlProdutosInsumos
    Left = 265
    Top = 129
  end
  object cdsMovimento: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProdutosInsumossqlMovimento
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
    Left = 318
    Top = 10
    object cdsMovimentoKEST_PRODUTO: TStringField
      FieldName = 'KEST_PRODUTO'
      Required = True
      FixedChar = True
    end
    object cdsMovimentoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsMovimentoQTE_ENTRADA: TFloatField
      FieldName = 'QTE_ENTRADA'
      DisplayFormat = '#,0.##'
    end
    object cdsMovimentoVALOR_ENTRADA: TFloatField
      FieldName = 'VALOR_ENTRADA'
      DisplayFormat = '#,0.00'
    end
    object cdsMovimentoQTE_SAIDA: TFloatField
      FieldName = 'QTE_SAIDA'
      DisplayFormat = '#,0.##'
    end
    object cdsMovimentoVALOR_SAIDA: TFloatField
      FieldName = 'VALOR_SAIDA'
      DisplayFormat = '#,0.00'
    end
    object cdsMovimentoTOTAL_LANCAMENTO: TFloatField
      FieldName = 'TOTAL_LANCAMENTO'
      DisplayFormat = '#,0.00'
    end
    object cdsMovimentoPLANO_CONTA: TStringField
      FieldName = 'PLANO_CONTA'
      Size = 78
    end
    object cdsMovimentoCENTRO_CUSTO: TStringField
      FieldName = 'CENTRO_CUSTO'
      Size = 78
    end
    object cdsMovimentoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
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
    Left = 549
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
