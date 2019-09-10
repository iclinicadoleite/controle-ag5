inherited FIN_FluxoCaixaSinteticoReport: TFIN_FluxoCaixaSinteticoReport
  Left = 335
  Top = 110
  Caption = 'FIN_FluxoCaixaSinteticoReport'
  ClientHeight = 733
  ClientWidth = 809
  ExplicitWidth = 825
  ExplicitHeight = 772
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
    ReportTitle = 'Fluxo de Caixa Sint'#233'tico'
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
      Height = 125
      Frame.Color = 15724527
      Size.Values = (
        330.729166666666700000
        1899.708333333333000000)
      ExplicitHeight = 125
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
          846.666666666666800000
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
      Top = 253
      Height = 22
      Frame.Color = 15724527
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        58.208333333333340000
        1899.708333333333000000)
      ExplicitTop = 253
      ExplicitHeight = 22
      object QRDBText2: TQRDBText
        Left = 25
        Top = 2
        Width = 159
        Height = 15
        Size.Values = (
          39.687500000000000000
          66.145833333333320000
          5.291666666666667000
          420.687500000000000000)
        XLColumn = 1
        XLNumFormat = nfDate2
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 192
        Top = 2
        Width = 163
        Height = 15
        Size.Values = (
          39.687500000000000000
          508.000000000000000000
          5.291666666666667000
          431.270833333333300000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'CREDITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 358
        Top = 2
        Width = 163
        Height = 15
        Size.Values = (
          39.687500000000000000
          947.208333333333200000
          5.291666666666667000
          431.270833333333300000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'DEBITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 525
        Top = 2
        Width = 163
        Height = 15
        Size.Values = (
          39.687500000000000000
          1389.062500000000000000
          5.291666666666667000
          431.270833333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'SALDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 297
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 297
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
          518.583333333333400000)
        FontSize = 7
        ExplicitTop = 13
      end
      inherited QRShapeFooterSeparator: TQRShape
        Size.Values = (
          2.645833333333333000
          261.937500000000000000
          71.437500000000000000
          1579.562500000000000000)
      end
      inherited QRLabelFooterSeparator: TQRLabel
        Size.Values = (
          34.395833333333340000
          264.583333333333400000
          89.958333333333320000
          518.583333333333400000)
        FontSize = 7
      end
      inherited LogoClinica: TQRImage
        Size.Values = (
          92.604166666666680000
          50.270833333333330000
          58.208333333333340000
          198.437500000000000000)
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
      Top = 275
      Height = 22
      Size.Values = (
        58.208333333333340000
        1899.708333333333000000)
      ExplicitTop = 275
      ExplicitHeight = 22
    end
    inherited rbColumnHeader: TQRBand
      Top = 232
      Height = 21
      Frame.Color = 15724527
      ForceNewColumn = True
      Size.Values = (
        55.562500000000000000
        1899.708333333333000000)
      ExplicitTop = 232
      ExplicitHeight = 21
      object QRLabel2: TQRLabel
        Left = 25
        Top = 2
        Width = 159
        Height = 16
        Size.Values = (
          42.333333333333330000
          66.145833333333320000
          5.291666666666667000
          420.687500000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Data'
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
        Left = 192
        Top = 2
        Width = 163
        Height = 16
        Size.Values = (
          42.333333333333330000
          508.000000000000000000
          5.291666666666667000
          431.270833333333300000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cr'#233'dito'
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
        Left = 358
        Top = 2
        Width = 163
        Height = 16
        Size.Values = (
          42.333333333333330000
          947.208333333333200000
          5.291666666666667000
          431.270833333333300000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'D'#233'bito'
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
        Left = 525
        Top = 2
        Width = 163
        Height = 16
        Size.Values = (
          42.333333333333330000
          1389.062500000000000000
          5.291666666666667000
          431.270833333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Saldo'
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
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 187
      Width = 718
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
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = rbTitle
      PrintOrder = cboAfterParent
      object QRLabel14: TQRLabel
        Left = 276
        Top = 5
        Width = 259
        Height = 15
        Size.Values = (
          39.687500000000000000
          730.250000000000000000
          13.229166666666670000
          685.270833333333200000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cheques n'#227'o compensados / t'#237'tulos em atraso'
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
        Left = 547
        Top = 5
        Width = 42
        Height = 15
        Size.Values = (
          39.687500000000000000
          1447.270833333333000000
          13.229166666666670000
          111.125000000000000000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cr'#233'dito'
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
        Left = 602
        Top = 5
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          1592.791666666667000000
          13.229166666666670000
          95.250000000000000000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'D'#233'bito'
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
        Left = 674
        Top = 5
        Width = 31
        Height = 15
        Size.Values = (
          39.687500000000000000
          1783.291666666667000000
          13.229166666666670000
          82.020833333333340000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Saldo'
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
        Top = 5
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          13.229166666666670000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contas'
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
        Left = 211
        Top = 5
        Width = 31
        Height = 15
        Size.Values = (
          39.687500000000000000
          558.270833333333400000
          13.229166666666670000
          82.020833333333340000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Saldo'
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
      object qrmConta: TQRMemo
        Left = 4
        Top = 21
        Width = 185
        Height = 17
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          55.562500000000000000
          489.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrmSaldoConta: TQRMemo
        Left = 193
        Top = 21
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          510.645833333333300000
          55.562500000000000000
          195.791666666666700000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrmTipoSumario: TQRMemo
        Left = 277
        Top = 21
        Width = 30
        Height = 17
        Frame.Color = 15724527
        Frame.DrawLeft = True
        Size.Values = (
          44.979166666666670000
          732.895833333333200000
          55.562500000000000000
          79.375000000000000000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrmDescSumario: TQRMemo
        Left = 309
        Top = 21
        Width = 220
        Height = 17
        Size.Values = (
          44.979166666666670000
          817.562500000000000000
          55.562500000000000000
          582.083333333333200000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrmDebitoSumario: TQRMemo
        Left = 596
        Top = 21
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1576.916666666667000000
          55.562500000000000000
          158.750000000000000000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrmCreditoSumario: TQRMemo
        Left = 535
        Top = 21
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          55.562500000000000000
          158.750000000000000000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrmSaldSumario: TQRMemo
        Left = 657
        Top = 21
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1738.312500000000000000
          55.562500000000000000
          158.750000000000000000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
  end
end
