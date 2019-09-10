inherited ReportMemoList: TReportMemoList
  Left = 252
  Caption = 'ReportMemoList'
  ExplicitLeft = 252
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
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
    inherited rbPageHeader: TQRBand
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      inherited _qrsDateTime: TQRSysData
        Size.Values = (
          42.333333333333330000
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
          42.333333333333330000
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
          42.333333333333330000
          859.895833333333300000
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
          60.854166666666670000
          809.625000000000000000
          13.229166666666670000
          277.812500000000000000)
        FontSize = 14
      end
      inherited _qrsDateTimeTitle: TQRSysData
        Size.Values = (
          42.333333333333330000
          1576.916666666667000000
          203.729166666666700000
          322.791666666666700000)
        FontSize = 9
      end
      inherited _qrsPageNumberTitle: TQRSysData
        Size.Values = (
          42.333333333333330000
          1661.583333333333000000
          246.062500000000000000
          238.125000000000000000)
        FontSize = 9
      end
      inherited _qrImageLogo: TQRImage
        Left = 4
        Width = 96
        Size.Values = (
          185.208333333333300000
          10.583333333333330000
          7.937500000000000000
          254.000000000000000000)
        ExplicitLeft = 4
        ExplicitWidth = 96
      end
      inherited _qrlDescricao: TQRLabel
        Left = 330
        Top = 41
        Width = 58
        Height = 13
        Size.Values = (
          34.395833333333330000
          873.125000000000000000
          108.479166666666700000
          153.458333333333300000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 330
        ExplicitTop = 41
        ExplicitWidth = 58
        ExplicitHeight = 13
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
          391.583333333333300000)
        ExplicitLeft = 564
        ExplicitTop = 5
      end
    end
    inherited rbDetail: TQRBand
      Size.Values = (
        89.958333333333330000
        1899.708333333333000000)
      object MemoStringList: TQRMemo
        Left = 8
        Top = 4
        Width = 74
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          10.583333333333330000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Height = 95
      Size.Values = (
        251.354166666666700000
        1899.708333333333000000)
      ExplicitHeight = 95
      inherited _qrlFooter: TQRLabel
        Size.Values = (
          34.395833333333330000
          0.000000000000000000
          0.000000000000000000
          140.229166666666700000)
        FontSize = 7
      end
      inherited QRShapeFooterSeparator1: TQRShape
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          29.104166666666670000
          1791.229166666667000000)
      end
      inherited QRLabelFooterSeparator1: TQRLabel
        Size.Values = (
          34.395833333333330000
          55.562500000000000000
          34.395833333333330000
          518.583333333333300000)
        FontSize = 7
      end
      inherited QRShapeFooterSeparator: TQRShape
        Top = 40
        Size.Values = (
          2.645833333333333000
          502.708333333333300000
          105.833333333333300000
          1341.437500000000000000)
        ExplicitTop = 40
      end
      inherited QRLabelFooterSeparator: TQRLabel
        Size.Values = (
          34.395833333333330000
          508.000000000000000000
          74.083333333333330000
          518.583333333333300000)
        FontSize = 7
      end
      inherited LogoClinica: TQRImage
        Left = 21
        Top = 3
        Size.Values = (
          182.562500000000000000
          55.562500000000000000
          7.937500000000000000
          396.875000000000000000)
        ExplicitLeft = 21
        ExplicitTop = 3
      end
    end
    inherited rbSummary: TQRBand
      Size.Values = (
        89.958333333333330000
        1899.708333333333000000)
    end
    inherited rbColumnHeader: TQRBand
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
    end
  end
end
