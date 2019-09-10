inherited _CustomQuickReport: T_CustomQuickReport
  Left = 448
  Top = 75
  Caption = '_CustomQuickReport'
  ClientWidth = 796
  OldCreateOrder = False
  ExplicitWidth = 812
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [LastPageFooter]
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    ReportTitle = 'Titulo'
    object rbPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 17
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object _qrsDateTime: TQRSysData
        Left = 0
        Top = 0
        Width = 92
        Height = 13
        Size.Values = (
          34.395833333333340000
          0.000000000000000000
          0.000000000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Emiss'#227'o: '
        Transparent = False
        ExportAs = exptText
        FontSize = 7
      end
      object _qrsPageNumber: TQRSysData
        Left = 651
        Top = 0
        Width = 67
        Height = 13
        Size.Values = (
          34.395833333333340000
          1722.437500000000000000
          0.000000000000000000
          177.270833333333300000)
        XLColumn = 10
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina: '
        Transparent = False
        ExportAs = exptText
        FontSize = 7
      end
      object _qrsReportTitle2: TQRSysData
        Left = 332
        Top = 0
        Width = 53
        Height = 13
        Size.Values = (
          34.395833333333340000
          878.416666666666800000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = True
        Color = clWhite
        Data = qrsReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        FontSize = 7
      end
    end
    object rbTitle: TQRBand
      Left = 38
      Top = 55
      Width = 718
      Height = 45
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        119.062500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object _qrsReportTitle: TQRSysData
        Left = 306
        Top = 5
        Width = 105
        Height = 23
        Size.Values = (
          60.854166666666680000
          809.625000000000000000
          13.229166666666670000
          277.812500000000000000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = True
        Color = clWhite
        Data = qrsReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        FontSize = 14
      end
      object _qrsDateTimeTitle: TQRSysData
        Left = 0
        Top = 0
        Width = 92
        Height = 13
        Size.Values = (
          34.395833333333340000
          0.000000000000000000
          0.000000000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Emiss'#227'o: '
        Transparent = False
        ExportAs = exptText
        FontSize = 7
      end
      object _qrsPageNumberTitle: TQRSysData
        Left = 651
        Top = 0
        Width = 67
        Height = 13
        Size.Values = (
          34.395833333333340000
          1722.437500000000000000
          0.000000000000000000
          177.270833333333300000)
        XLColumn = 10
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina: '
        Transparent = False
        ExportAs = exptText
        FontSize = 7
      end
      object _qrlDescricao: TQRLabel
        Left = 325
        Top = 26
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          859.895833333333400000
          68.791666666666680000
          179.916666666666700000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = True
        Caption = '_qrlDescricao'
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
    end
    object rbDetail: TQRBand
      Left = 38
      Top = 117
      Width = 718
      Height = 17
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
    end
    object rbPageFooter: TQRBand
      Left = 38
      Top = 151
      Width = 718
      Height = 40
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        105.833333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object _qrlFooter: TQRLabel
        Left = 0
        Top = 0
        Width = 53
        Height = 13
        Size.Values = (
          34.395833333333340000
          0.000000000000000000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'TurboCode'#174
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
    end
    object rbSummary: TQRBand
      Left = 38
      Top = 134
      Width = 718
      Height = 17
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
    end
    object rbColumnHeader: TQRBand
      Left = 38
      Top = 100
      Width = 718
      Height = 17
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
    end
  end
end
