inherited fqrVENDAS_Pedido: TfqrVENDAS_Pedido
  Left = 335
  Top = -10
  Caption = 'fqrVENDAS_Pedido'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = -4
    Top = 8
    BackImageControl = 'QRImage1'
    DataSet = cdsPedido
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      330.000000000000000000
      2100.000000000000000000
      150.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.PrintMetaFile = True
    PrinterSettings.PrintQuality = 0
    ReportTitle = 'Pedido de Compra'
    SnapToGrid = False
    ExplicitLeft = -4
    ExplicitTop = 8
    object QRImage1: TQRImage [0]
      Left = 20
      Top = 0
      Width = 789
      Height = 1000
      Size.Values = (
        2645.833333333333000000
        52.916666666666670000
        0.000000000000000000
        2087.562500000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      AutoSize = True
    end
    inherited rbPageHeader: TQRBand
      Left = 57
      Top = 125
      Width = 700
      Height = 17
      TransparentBand = True
      Size.Values = (
        44.979166666666670000
        1852.083333333333000000)
      ExplicitLeft = 57
      ExplicitTop = 125
      ExplicitWidth = 700
      ExplicitHeight = 17
      inherited _qrsDateTime: TQRSysData
        Left = 608
        Width = 92
        Height = 13
        Size.Values = (
          34.395833333333340000
          1608.666666666667000000
          0.000000000000000000
          243.416666666666700000)
        Font.Height = -9
        Transparent = True
        FontSize = 7
        ExplicitLeft = 608
        ExplicitWidth = 92
        ExplicitHeight = 13
      end
      inherited _qrsPageNumber: TQRSysData
        Left = 633
        Size.Values = (
          34.395833333333340000
          1674.812500000000000000
          0.000000000000000000
          177.270833333333300000)
        Transparent = True
        FontSize = 7
        ExplicitLeft = 633
      end
      inherited QRShapeHeaderSeparator2: TQRShape
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          44.979166666666670000
          1796.520833333333000000)
      end
      inherited _qrsReportTitle2: TQRSysData
        Left = 323
        Width = 53
        Height = 13
        Size.Values = (
          34.395833333333340000
          854.604166666666800000
          0.000000000000000000
          140.229166666666700000)
        Font.Height = -9
        Transparent = True
        FontSize = 7
        ExplicitLeft = 323
        ExplicitWidth = 53
        ExplicitHeight = 13
      end
    end
    inherited rbTitle: TQRBand
      Left = 57
      Top = 142
      Width = 700
      Height = 75
      TransparentBand = True
      Size.Values = (
        198.437500000000000000
        1852.083333333333000000)
      ExplicitLeft = 57
      ExplicitTop = 142
      ExplicitWidth = 700
      ExplicitHeight = 75
      inherited _qrsReportTitle: TQRSysData
        Left = 297
        Size.Values = (
          60.854166666666680000
          785.812500000000000000
          13.229166666666670000
          277.812500000000000000)
        Transparent = True
        FontSize = 14
        ExplicitLeft = 297
      end
      inherited _qrsDateTimeTitle: TQRSysData
        Left = 598
        Width = 102
        Height = 15
        Size.Values = (
          39.687500000000000000
          1582.208333333333000000
          203.729166666666700000
          269.875000000000000000)
        Font.Height = -11
        Transparent = True
        FontSize = 8
        ExplicitLeft = 598
        ExplicitWidth = 102
        ExplicitHeight = 15
      end
      inherited _qrsPageNumberTitle: TQRSysData
        Left = 623
        Top = 17
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          1648.354166666667000000
          44.979166666666670000
          203.729166666666700000)
        Font.Height = -11
        Transparent = True
        FontSize = 8
        ExplicitLeft = 623
        ExplicitTop = 17
        ExplicitWidth = 77
        ExplicitHeight = 15
      end
      inherited _qrImageLogo: TQRImage
        Left = 4
        Width = 157
        Height = 46
        Size.Values = (
          121.708333333333300000
          10.583333333333330000
          7.937500000000000000
          415.395833333333300000)
        ExplicitLeft = 4
        ExplicitWidth = 157
        ExplicitHeight = 46
      end
      inherited _qrlDescricao: TQRLabel
        Left = 316
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          836.083333333333400000
          68.791666666666680000
          179.916666666666700000)
        Font.Height = -11
        FontSize = 8
        ExplicitLeft = 316
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
      object QRLabel12: TQRLabel
        Left = 13
        Top = 41
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          34.395833333333340000
          108.479166666666700000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #192' :'
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
      object QRLabel13: TQRLabel
        Left = 7
        Top = 57
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          150.812500000000000000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'A/C:'
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
        Left = 33
        Top = 41
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          87.312500000000000000
          108.479166666666700000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsPedido
        DataField = 'NOMEENTIDADE'
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
      object QRDBText7: TQRDBText
        Left = 33
        Top = 56
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          87.312500000000000000
          148.166666666666700000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsPedido
        DataField = 'NOMECONTATO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText7Print
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 553
        Top = 41
        Width = 28
        Height = 15
        Size.Values = (
          39.687500000000000000
          1463.145833333333000000
          108.479166666666700000
          74.083333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fone:'
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
      object QRLabel19: TQRLabel
        Left = 524
        Top = 56
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          1386.416666666667000000
          148.166666666666700000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Comprador:'
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
      object QRDBText14: TQRDBText
        Left = 586
        Top = 56
        Width = 96
        Height = 15
        Size.Values = (
          39.687500000000000000
          1550.458333333333000000
          148.166666666666700000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsPedido
        DataField = 'NOMECOMPRADOR'
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
      object QRDBText15: TQRDBText
        Left = 586
        Top = 40
        Width = 28
        Height = 15
        Size.Values = (
          39.687500000000000000
          1550.458333333333000000
          105.833333333333300000
          74.083333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsPedido
        DataField = 'FONE'
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
    inherited rbDetail: TQRBand
      Left = 57
      Top = 234
      Width = 700
      Height = 16
      Enabled = False
      TransparentBand = True
      Size.Values = (
        42.333333333333340000
        1852.083333333333000000)
      ExplicitLeft = 57
      ExplicitTop = 234
      ExplicitWidth = 700
      ExplicitHeight = 16
    end
    inherited rbPageFooter: TQRBand
      Left = 57
      Top = 641
      Width = 700
      Height = 62
      Frame.DrawTop = False
      Size.Values = (
        164.041666666666700000
        1852.083333333333000000)
      ExplicitLeft = 57
      ExplicitTop = 641
      ExplicitWidth = 700
      ExplicitHeight = 62
      inherited _qrlFooter: TQRLabel
        Top = 47
        Size.Values = (
          34.395833333333340000
          0.000000000000000000
          124.354166666666700000
          140.229166666666700000)
        FontSize = 7
        ExplicitTop = 47
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
      Left = 57
      Top = 491
      Width = 700
      Height = 26
      TransparentBand = True
      Size.Values = (
        68.791666666666680000
        1852.083333333333000000)
      ExplicitLeft = 57
      ExplicitTop = 491
      ExplicitWidth = 700
      ExplicitHeight = 26
      inherited qrQuantidadeRegistros: TQRLabel
        Size.Values = (
          34.395833333333340000
          1611.312500000000000000
          50.270833333333330000
          230.187500000000000000)
        FontSize = 7
      end
      object QRShape14: TQRShape
        Left = 390
        Top = 4
        Width = 252
        Height = 19
        Size.Values = (
          50.270833333333330000
          1031.875000000000000000
          10.583333333333330000
          666.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel29: TQRLabel
        Left = 400
        Top = 6
        Width = 94
        Height = 16
        Size.Values = (
          42.333333333333340000
          1058.333333333333000000
          15.875000000000000000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total do Pedido :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText10: TQRDBText
        Left = 597
        Top = 6
        Width = 39
        Height = 16
        Size.Values = (
          42.333333333333340000
          1579.562500000000000000
          15.875000000000000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsItensPedido
        DataField = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRDBText10Print
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    inherited rbColumnHeader: TQRBand
      Left = 57
      Top = 217
      Width = 700
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666670000
        1852.083333333333000000)
      ExplicitLeft = 57
      ExplicitTop = 217
      ExplicitWidth = 700
      ExplicitHeight = 17
    end
    object ChildBand1: TQRChildBand
      Left = 57
      Top = 517
      Width = 700
      Height = 55
      AlignToBottom = False
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        145.520833333333300000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = rbSummary
      PrintOrder = cboAfterParent
      object QRShape4: TQRShape
        Left = 3
        Top = 5
        Width = 292
        Height = 47
        Size.Values = (
          124.354166666666700000
          7.937500000000000000
          13.229166666666670000
          772.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 303
        Top = 5
        Width = 391
        Height = 47
        Size.Values = (
          124.354166666666700000
          801.687500000000100000
          13.229166666666670000
          1034.520833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 442
        Top = 6
        Width = 123
        Height = 15
        Size.Values = (
          39.687500000000000000
          1169.458333333333000000
          15.875000000000000000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Condi'#231#245'es de Pagamento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 113
        Top = 6
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          298.979166666666700000
          15.875000000000000000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Considera'#231#245'es'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape6: TQRShape
        Left = 3
        Top = 20
        Width = 292
        Height = 1
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          52.916666666666660000
          772.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 303
        Top = 20
        Width = 391
        Height = 1
        Size.Values = (
          2.645833333333333000
          801.687500000000100000
          52.916666666666660000
          1034.520833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object ChildBand2: TQRChildBand
      Left = 57
      Top = 572
      Width = 700
      Height = 69
      AlignToBottom = False
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        182.562500000000000000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = ChildBand1
      PrintOrder = cboAfterParent
      object QRShape1: TQRShape
        Left = 3
        Top = 17
        Width = 712
        Height = 36
        Enabled = False
        Size.Values = (
          95.250000000000000000
          7.937500000000000000
          44.979166666666670000
          1883.833333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 536
        Top = 18
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          1418.166666666667000000
          47.625000000000000000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Assinatura'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 282
        Top = 17
        Width = 143
        Height = 36
        Enabled = False
        Size.Values = (
          95.250000000000000000
          746.125000000000000000
          44.979166666666670000
          378.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 4
        Top = 54
        Width = 429
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          142.875000000000000000
          1135.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Para confirma'#231#227'o da proposta, favor carimbar, assinar e retornar' +
          ' via via (19) 3406-4445'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 343
        Top = 18
        Width = 23
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          907.520833333333400000
          47.625000000000000000
          60.854166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 114
        Top = 19
        Width = 28
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          301.625000000000000000
          50.270833333333330000
          74.083333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nome'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 3
        Top = 32
        Width = 712
        Height = 1
        Enabled = False
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          84.666666666666680000
          1883.833333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 4
        Top = 1
        Width = 140
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          2.645833333333333000
          370.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Confirma'#231#227'o da Proposta'
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
    end
    object GroupHeaderBand1: TQRBand
      Left = 57
      Top = 250
      Width = 700
      Height = 31
      AlignToBottom = False
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.020833333333340000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object QRLabel6: TQRLabel
        Left = 32
        Top = 16
        Width = 34
        Height = 12
        Size.Values = (
          31.750000000000000000
          84.666666666666680000
          42.333333333333340000
          89.958333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel8: TQRLabel
        Left = 400
        Top = 16
        Width = 22
        Height = 12
        Size.Values = (
          31.750000000000000000
          1058.333333333333000000
          42.333333333333340000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Qtde'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel10: TQRLabel
        Left = 600
        Top = 16
        Width = 23
        Height = 12
        Size.Values = (
          31.750000000000000000
          1587.500000000000000000
          42.333333333333340000
          60.854166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel7: TQRLabel
        Left = 80
        Top = 16
        Width = 46
        Height = 12
        Size.Values = (
          31.750000000000000000
          211.666666666666700000
          42.333333333333340000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel9: TQRLabel
        Left = 504
        Top = 16
        Width = 32
        Height = 12
        Size.Values = (
          31.750000000000000000
          1333.500000000000000000
          42.333333333333340000
          84.666666666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vl.Unit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel20: TQRLabel
        Left = 8
        Top = 16
        Width = 7
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          42.333333333333340000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '#'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape11: TQRShape
        Left = 3
        Top = 29
        Width = 710
        Height = 1
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          76.729166666666680000
          1878.541666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Brush.Color = 15790320
        Brush.Style = bsFDiagonal
        Pen.Color = clGray
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel30: TQRLabel
        Left = 5
        Top = 1
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          2.645833333333333000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Produtos'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object ChildBand3: TQRChildBand
      Left = 57
      Top = 703
      Width = 700
      Height = 17
      AlignToBottom = False
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      PrintOrder = cboAfterParent
    end
    object QRSubDetail1: TQRSubDetail
      Left = 57
      Top = 281
      Width = 700
      Height = 16
      AlignToBottom = False
      Color = clWhite
      TransparentBand = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        42.333333333333340000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep
      DataSet = cdsItensPedido
      FooterBand = GroupFooterBand1
      HeaderBand = GroupHeaderBand1
      PrintBefore = False
      PrintIfEmpty = False
      object QRShape8: TQRShape
        Left = 25
        Top = 1
        Width = 616
        Height = 1
        Size.Values = (
          2.645833333333333000
          66.145833333333340000
          2.645833333333333000
          1629.833333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Brush.Color = 15790320
        Brush.Style = bsFDiagonal
        Pen.Color = clGray
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText1: TQRDBText
        Left = 27
        Top = 1
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          71.437500000000000000
          2.645833333333333000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsItensPedido
        DataField = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 78
        Top = 1
        Width = 32
        Height = 15
        Size.Values = (
          39.687500000000000000
          206.375000000000000000
          2.645833333333333000
          84.666666666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsItensPedido
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 400
        Top = 1
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          1058.333333333333000000
          2.645833333333333000
          76.729166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsItensPedido
        DataField = 'QTDE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 506
        Top = 1
        Width = 39
        Height = 15
        Size.Values = (
          39.687500000000000000
          1338.791666666667000000
          2.645833333333333000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsItensPedido
        DataField = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 598
        Top = 1
        Width = 38
        Height = 15
        Size.Values = (
          39.687500000000000000
          1582.208333333333000000
          2.645833333333333000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsItensPedido
        DataField = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object GroupFooterBand1: TQRBand
      Left = 57
      Top = 319
      Width = 700
      Height = 25
      AlignToBottom = False
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333340000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape9: TQRShape
        Left = 390
        Top = 1
        Width = 252
        Height = 19
        Size.Values = (
          50.270833333333330000
          1031.875000000000000000
          2.645833333333333000
          666.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 400
        Top = 3
        Width = 91
        Height = 16
        Size.Values = (
          42.333333333333340000
          1058.333333333333000000
          7.937500000000000000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total do Pedido:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText8: TQRDBText
        Left = 597
        Top = 3
        Width = 39
        Height = 16
        Size.Values = (
          42.333333333333340000
          1579.562500000000000000
          7.937500000000000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsItensPedido
        DataField = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRDBText8Print
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object ChildBand4: TQRChildBand
      Left = 57
      Top = 344
      Width = 700
      Height = 20
      AlignToBottom = False
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = GroupFooterBand1
      PrintOrder = cboAfterParent
    end
    object ChildBand5: TQRChildBand
      Left = 57
      Top = 297
      Width = 700
      Height = 11
      AlignToBottom = False
      BeforePrint = ChildBand5BeforePrint
      Color = clWhite
      TransparentBand = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        29.104166666666670000
        1852.083333333333000000)
      PreCaluculateBandHeight = True
      KeepOnOnePage = False
      ParentBand = QRSubDetail1
      PrintOrder = cboAfterParent
      object qrmDescricaoItens: TQRMemo
        Left = 80
        Top = 0
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          0.000000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
    end
    object QRSubDetail3: TQRSubDetail
      Left = 57
      Top = 364
      Width = 700
      Height = 33
      AlignToBottom = False
      BeforePrint = QRSubDetail3BeforePrint
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        87.312500000000000000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep
      PrintBefore = False
      PrintIfEmpty = True
      object qrmObservacoesPedido: TQRMemo
        Left = 29
        Top = 17
        Width = 135
        Height = 15
        Size.Values = (
          39.687500000000000000
          76.729166666666680000
          44.979166666666670000
          357.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel21: TQRLabel
        Left = 6
        Top = 1
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          2.645833333333333000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Observa'#231#245'es'
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
    end
    object ChildBand6: TQRChildBand
      Left = 57
      Top = 308
      Width = 700
      Height = 11
      AlignToBottom = False
      BeforePrint = ChildBand6BeforePrint
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        29.104166666666670000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = ChildBand5
      PrintOrder = cboAfterParent
      object QRLabel22: TQRLabel
        Left = 53
        Top = 1
        Width = 19
        Height = 13
        Size.Values = (
          34.395833333333340000
          140.229166666666700000
          2.645833333333333000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'obs:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrmObservacaoItens: TQRMemo
        Left = 80
        Top = 1
        Width = 318
        Height = 17
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          2.645833333333333000
          841.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRShape13: TQRShape
        Left = 82
        Top = 0
        Width = 315
        Height = 1
        Size.Values = (
          2.645833333333333000
          216.958333333333400000
          0.000000000000000000
          833.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRSubDetail2: TQRSubDetail
      Left = 57
      Top = 428
      Width = 700
      Height = 16
      AlignToBottom = False
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333340000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep
      DataSet = cdsServicosPedido
      FooterBand = GroupFooterBand2
      HeaderBand = GroupHeaderBand2
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText11: TQRDBText
        Left = 27
        Top = 1
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          71.437500000000000000
          2.645833333333333000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsServicosPedido
        DataField = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 78
        Top = 1
        Width = 32
        Height = 15
        Size.Values = (
          39.687500000000000000
          206.375000000000000000
          2.645833333333333000
          84.666666666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsServicosPedido
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 400
        Top = 1
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          1058.333333333333000000
          2.645833333333333000
          76.729166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsServicosPedido
        DataField = 'QTDE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText16: TQRDBText
        Left = 506
        Top = 1
        Width = 39
        Height = 15
        Size.Values = (
          39.687500000000000000
          1338.791666666667000000
          2.645833333333333000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsServicosPedido
        DataField = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText17: TQRDBText
        Left = 598
        Top = 1
        Width = 38
        Height = 15
        Size.Values = (
          39.687500000000000000
          1582.208333333333000000
          2.645833333333333000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsServicosPedido
        DataField = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object GroupFooterBand2: TQRBand
      Left = 57
      Top = 466
      Width = 700
      Height = 25
      AlignToBottom = False
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333340000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape12: TQRShape
        Left = 390
        Top = 1
        Width = 252
        Height = 19
        Size.Values = (
          50.270833333333330000
          1031.875000000000000000
          2.645833333333333000
          666.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel28: TQRLabel
        Left = 400
        Top = 3
        Width = 102
        Height = 16
        Size.Values = (
          42.333333333333340000
          1058.333333333333000000
          7.937500000000000000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total do Servi'#231'os:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText9: TQRDBText
        Left = 597
        Top = 3
        Width = 39
        Height = 16
        Size.Values = (
          42.333333333333340000
          1579.562500000000000000
          7.937500000000000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsItensPedido
        DataField = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRDBText9Print
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object GroupHeaderBand2: TQRBand
      Left = 57
      Top = 397
      Width = 700
      Height = 31
      AlignToBottom = False
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.020833333333340000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object QRLabel11: TQRLabel
        Left = 5
        Top = 1
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          2.645833333333333000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Servi'#231'os'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 32
        Top = 17
        Width = 34
        Height = 12
        Size.Values = (
          31.750000000000000000
          84.666666666666680000
          44.979166666666670000
          89.958333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel23: TQRLabel
        Left = 400
        Top = 17
        Width = 22
        Height = 12
        Size.Values = (
          31.750000000000000000
          1058.333333333333000000
          44.979166666666670000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Qtde'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel24: TQRLabel
        Left = 600
        Top = 17
        Width = 23
        Height = 12
        Size.Values = (
          31.750000000000000000
          1587.500000000000000000
          44.979166666666670000
          60.854166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel25: TQRLabel
        Left = 80
        Top = 17
        Width = 46
        Height = 12
        Size.Values = (
          31.750000000000000000
          211.666666666666700000
          44.979166666666670000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel26: TQRLabel
        Left = 504
        Top = 17
        Width = 32
        Height = 12
        Size.Values = (
          31.750000000000000000
          1333.500000000000000000
          44.979166666666670000
          84.666666666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vl.Unit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel27: TQRLabel
        Left = 8
        Top = 17
        Width = 7
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          44.979166666666670000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '#'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape10: TQRShape
        Left = 3
        Top = 29
        Width = 710
        Height = 1
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          76.729166666666680000
          1878.541666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Brush.Color = 15790320
        Brush.Style = bsFDiagonal
        Pen.Color = clGray
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object ChildBand7: TQRChildBand
      Left = 57
      Top = 444
      Width = 700
      Height = 11
      AlignToBottom = False
      BeforePrint = ChildBand7BeforePrint
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        29.104166666666670000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRSubDetail2
      PrintOrder = cboAfterParent
      object qrmDescricaoServicos: TQRMemo
        Left = 80
        Top = 0
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          0.000000000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
    end
    object ChildBand8: TQRChildBand
      Left = 57
      Top = 455
      Width = 700
      Height = 11
      AlignToBottom = False
      BeforePrint = ChildBand8BeforePrint
      Color = clWhite
      TransparentBand = True
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        29.104166666666670000
        1852.083333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = ChildBand7
      PrintOrder = cboAfterParent
      object QRLabel31: TQRLabel
        Left = 53
        Top = 1
        Width = 19
        Height = 13
        Size.Values = (
          34.395833333333340000
          140.229166666666700000
          2.645833333333333000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'obs:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrmObservacaoServicos: TQRMemo
        Left = 80
        Top = 1
        Width = 318
        Height = 17
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          2.645833333333333000
          841.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRShape15: TQRShape
        Left = 82
        Top = 0
        Width = 315
        Height = 1
        Size.Values = (
          2.645833333333333000
          216.958333333333400000
          0.000000000000000000
          833.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
  end
  object dspPedido: TDataSetProvider
    DataSet = sqlPedido
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 247
    Top = 41
  end
  object sqlPedido: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select'
      '  KCMP_PEDIDO, '
      '  KCAD_ENTIDADE, '
      '  CODIGO, '
      '  STATUS, '
      '  DATA, '
      '  NOMEENTIDADE, '
      '  KCAD_CONTATO, '
      '  NOMECONTATO, '
      '  FONE,'
      '  EMAIL, '
      '  DEPTO,'
      '  NOMECOMPRADOR, '
      '  OBS'
      'from CMP_PEDIDOS'
      'WHERE KCMP_PEDIDO  = :KCMP_PEDIDO')
    Left = 282
    Top = 69
    object sqlPedidoKCMP_PEDIDO: TIntegerField
      FieldName = 'KCMP_PEDIDO'
      Required = True
    end
    object sqlPedidoSTATUS: TSmallintField
      FieldName = 'STATUS'
      Required = True
    end
    object sqlPedidoKCAD_ENTIDADE: TIntegerField
      FieldName = 'KCAD_ENTIDADE'
    end
    object sqlPedidoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlPedidoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlPedidoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlPedidoKCAD_CONTATO: TIntegerField
      FieldName = 'KCAD_CONTATO'
    end
    object sqlPedidoNOMECONTATO: TStringField
      FieldName = 'NOMECONTATO'
      Size = 128
    end
    object sqlPedidoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 64
    end
    object sqlPedidoDEPTO: TStringField
      FieldName = 'DEPTO'
      Size = 32
    end
    object sqlPedidoFONE: TStringField
      FieldName = 'FONE'
      Size = 32
    end
    object sqlPedidoNOMECOMPRADOR: TStringField
      FieldName = 'NOMECOMPRADOR'
      Size = 128
    end
    object sqlPedidoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsSQLPedido: TDataSource
    DataSet = sqlPedido
    Left = 323
    Top = 107
  end
  object sqlItensPedido: TTcSQLDataSet
    GetMetadata = False
    DataSource = dtsSQLPedido
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select '
      '  KCMP_PEDIDO_ITENS, '
      '  KCMP_PEDIDO, '
      '  KEST_PRODUTO, '
      '  CODIGO,'
      '  NOME, '
      '  QTDE, '
      '  CUSTO, '
      '  TOTAL,'
      '  IPI, '
      '  DETALHES,'
      '  OBS '
      'from CMP_PEDIDO_ITENS'
      'WHERE'
      '  KCMP_PEDIDO = :KCMP_PEDIDO')
    Left = 352
    Top = 69
    object sqlItensPedidoKCMP_PEDIDO_ITENS: TIntegerField
      FieldName = 'KCMP_PEDIDO_ITENS'
      Required = True
    end
    object sqlItensPedidoKCMP_PEDIDO: TIntegerField
      FieldName = 'KCMP_PEDIDO'
      Required = True
    end
    object sqlItensPedidoKEST_PRODUTO: TIntegerField
      FieldName = 'KEST_PRODUTO'
    end
    object sqlItensPedidoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlItensPedidoNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object sqlItensPedidoQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object sqlItensPedidoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object sqlItensPedidoCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object sqlItensPedidoIPI: TFloatField
      FieldName = 'IPI'
    end
    object sqlItensPedidoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlItensPedidoDETALHES: TMemoField
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPedido'
    Left = 279
    Top = 12
    object cdsPedidoKCMP_PEDIDO: TIntegerField
      FieldName = 'KCMP_PEDIDO'
      Required = True
    end
    object cdsPedidoSTATUS: TSmallintField
      FieldName = 'STATUS'
      Required = True
    end
    object cdsPedidoKCAD_ENTIDADE: TIntegerField
      FieldName = 'KCAD_ENTIDADE'
    end
    object cdsPedidoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsPedidoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsPedidoNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsPedidoKCAD_CONTATO: TIntegerField
      FieldName = 'KCAD_CONTATO'
    end
    object cdsPedidoNOMECONTATO: TStringField
      FieldName = 'NOMECONTATO'
      Size = 128
    end
    object cdsPedidoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 64
    end
    object cdsPedidoDEPTO: TStringField
      FieldName = 'DEPTO'
      Size = 32
    end
    object cdsPedidoFONE: TStringField
      FieldName = 'FONE'
      Size = 32
    end
    object cdsPedidoNOMECOMPRADOR: TStringField
      FieldName = 'NOMECOMPRADOR'
      Size = 128
    end
    object cdsPedidoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPedidosqlItensPedido: TDataSetField
      FieldName = 'sqlItensPedido'
    end
    object cdsPedidosqlServicosPedido: TDataSetField
      FieldName = 'sqlServicosPedido'
    end
  end
  object cdsItensPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsPedidosqlItensPedido
    Params = <>
    Left = 352
    Top = 12
    object cdsItensPedidoKCMP_PEDIDO: TIntegerField
      FieldName = 'KCMP_PEDIDO'
      Required = True
    end
    object cdsItensPedidoKCMP_PEDIDO_ITENS: TIntegerField
      FieldName = 'KCMP_PEDIDO_ITENS'
      Required = True
    end
    object cdsItensPedidoKEST_PRODUTO: TIntegerField
      FieldName = 'KEST_PRODUTO'
    end
    object cdsItensPedidoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsItensPedidoNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsItensPedidoQTDE: TFloatField
      FieldName = 'QTDE'
      DisplayFormat = '#,0.00'
    end
    object cdsItensPedidoCUSTO: TFloatField
      FieldName = 'CUSTO'
      DisplayFormat = '#,0.00'
    end
    object cdsItensPedidoTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '#,0.00'
    end
    object cdsItensPedidoIPI: TFloatField
      FieldName = 'IPI'
    end
    object cdsItensPedidoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsItensPedidoDETALHES: TMemoField
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsItensPedidoSomaTotal: TAggregateField
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM( TOTAL )'
    end
  end
  object sqlServicosPedido: TTcSQLDataSet
    GetMetadata = False
    DataSource = dtsSQLPedido
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'KCMP_PEDIDO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'select '
      '  KCMP_PEDIDO_SERVICO, '
      '  KCMP_PEDIDO, '
      '  KEST_PRODUTO, '
      '  CODIGO,'
      '  NOME, '
      '  QTDE, '
      '  TOTAL,'
      '  CUSTO, '
      '  DETALHES,'
      '  OBS '
      'from  CMP_PEDIDO_SERVICOS'
      'WHERE'
      '  KCMP_PEDIDO = :KCMP_PEDIDO')
    Left = 432
    Top = 72
    object sqlServicosPedidoKCMP_PEDIDO_SERVICO: TIntegerField
      FieldName = 'KCMP_PEDIDO_SERVICO'
      Required = True
    end
    object sqlServicosPedidoKCMP_PEDIDO: TIntegerField
      FieldName = 'KCMP_PEDIDO'
      Required = True
    end
    object sqlServicosPedidoKEST_PRODUTO: TIntegerField
      FieldName = 'KEST_PRODUTO'
    end
    object sqlServicosPedidoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlServicosPedidoNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object sqlServicosPedidoQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object sqlServicosPedidoCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object sqlServicosPedidoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object sqlServicosPedidoDETALHES: TMemoField
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object sqlServicosPedidoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsServicosPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsPedidosqlServicosPedido
    Params = <>
    Left = 432
    Top = 16
    object cdsServicosPedidoKCMP_PEDIDO_SERVICO: TIntegerField
      FieldName = 'KCMP_PEDIDO_SERVICO'
      Required = True
    end
    object cdsServicosPedidoKCMP_PEDIDO: TIntegerField
      FieldName = 'KCMP_PEDIDO'
      Required = True
    end
    object cdsServicosPedidoKEST_PRODUTO: TIntegerField
      FieldName = 'KEST_PRODUTO'
    end
    object cdsServicosPedidoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsServicosPedidoNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsServicosPedidoQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object cdsServicosPedidoCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object cdsServicosPedidoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object cdsServicosPedidoDETALHES: TMemoField
      FieldName = 'DETALHES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsServicosPedidoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsServicosPedidoSomaTotal: TAggregateField
      FieldName = 'SomaTotal'
      Active = True
      DisplayName = ''
      Expression = 'Sum ( TOTAL )'
    end
  end
end
