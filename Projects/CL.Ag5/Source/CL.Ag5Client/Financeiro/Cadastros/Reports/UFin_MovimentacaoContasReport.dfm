inherited FIN_MovimentacaoContasReport: TFIN_MovimentacaoContasReport
  Left = 335
  Top = 108
  Caption = 'FIN_MovimentacaoContasReport'
  ClientWidth = 813
  ExplicitWidth = 829
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = 11
    Top = 8
    BeforePrint = QuickRepBeforePrint
    DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
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
    ExplicitLeft = 11
    ExplicitTop = 8
    inherited rbPageHeader: TQRBand
      Frame.Color = 15724527
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
      object qrlPeriodo: TQRLabel
        Left = 15
        Top = 77
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          203.729166666666700000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Per'#237'odo'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    inherited rbDetail: TQRBand
      Top = 275
      Height = 22
      Frame.Color = 15724527
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        58.208333333333340000
        1899.708333333333000000)
      ExplicitTop = 275
      ExplicitHeight = 22
      object QRDBText5: TQRDBText
        Left = 4
        Top = 3
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          7.937500000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfDate2
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
        DataField = 'PAGTO'
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
        Left = 161
        Top = 3
        Width = 162
        Height = 15
        Size.Values = (
          39.687500000000000000
          425.979166666666700000
          7.937500000000000000
          428.625000000000000000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
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
      object QRDBText7: TQRDBText
        Left = 414
        Top = 3
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1095.375000000000000000
          7.937500000000000000
          145.520833333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
        DataField = 'CHEQUE'
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
      object qrCredito: TQRDBText
        Left = 471
        Top = 3
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          1246.187500000000000000
          7.937500000000000000
          214.312500000000000000)
        XLColumn = 5
        XLNumFormat = nfDec2
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
        DataField = 'CREDITO'
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
      object qrDebito: TQRDBText
        Left = 554
        Top = 3
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          1465.791666666667000000
          7.937500000000000000
          198.437500000000000000)
        XLColumn = 6
        XLNumFormat = nfDec2
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
        DataField = 'DEBITO'
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
      object qrlSaldo: TQRLabel
        Left = 631
        Top = 3
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          1669.520833333333000000
          7.937500000000000000
          216.958333333333300000)
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
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 325
        Top = 3
        Width = 86
        Height = 15
        Size.Values = (
          39.687500000000000000
          859.895833333333200000
          7.937500000000000000
          227.541666666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
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
      object QRDBText8: TQRDBText
        Left = 82
        Top = 3
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          216.958333333333300000
          7.937500000000000000
          203.729166666666700000)
        XLColumn = 1
        XLNumFormat = nfDate2
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
        DataField = 'DT_COMPENSACAO'
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
    inherited rbPageFooter: TQRBand
      Top = 344
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 344
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
      Top = 320
      Height = 24
      AlignToBottom = False
      BeforePrint = rbSummaryBeforePrint
      Enabled = True
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 320
      ExplicitHeight = 24
      inherited qrQuantidadeRegistros: TQRLabel
        Size.Values = (
          34.395833333333340000
          1611.312500000000000000
          50.270833333333330000
          230.187500000000000000)
        FontSize = 7
      end
      object QRLabel13: TQRLabel
        Left = 388
        Top = 2
        Width = 164
        Height = 17
        Size.Values = (
          44.979166666666670000
          1026.583333333333000000
          5.291666666666667000
          433.916666666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total de todas as contas  R$:'
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
      object qrlSaldoGeral: TQRLabel
        Left = 554
        Top = 2
        Width = 158
        Height = 17
        Size.Values = (
          44.979166666666670000
          1465.791666666667000000
          5.291666666666667000
          418.041666666666700000)
        XLColumn = 7
        XLNumFormat = nfDec2
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '#,0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
    end
    inherited rbColumnHeader: TQRBand
      Height = 20
      Frame.Color = 15724527
      Enabled = False
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      ExplicitHeight = 20
    end
    object qrGroup: TQRGroup
      Left = 38
      Top = 193
      Width = 718
      Height = 82
      Frame.Color = 15724527
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = qrGroupBeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        216.958333333333400000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'cdsMovimentacao.KFIN_CONTA'
      FooterBand = qrGroupFooter
      Master = QuickRep
      ReprintOnNewPage = True
      object QRLabel8: TQRLabel
        Left = 13
        Top = 4
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          34.395833333333340000
          10.583333333333330000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Conta : '
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
      object QRLabel9: TQRLabel
        Left = 312
        Top = 4
        Width = 42
        Height = 17
        Size.Values = (
          44.979166666666670000
          825.500000000000000000
          10.583333333333330000
          111.125000000000000000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Banco :'
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
      object QRLabel10: TQRLabel
        Left = 13
        Top = 25
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          34.395833333333340000
          66.145833333333340000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Ag'#234'ncia :'
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
      object QRLabel11: TQRLabel
        Left = 243
        Top = 25
        Width = 91
        Height = 17
        Size.Values = (
          44.979166666666670000
          642.937500000000000000
          66.145833333333340000
          240.770833333333300000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Conta Corrente :'
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
      object QRDBText1: TQRDBText
        Left = 62
        Top = 4
        Width = 244
        Height = 17
        Size.Values = (
          44.979166666666670000
          164.041666666666700000
          10.583333333333330000
          645.583333333333200000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
        DataField = 'NOMECONTA'
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
      object QRDBText2: TQRDBText
        Left = 362
        Top = 4
        Width = 351
        Height = 17
        Size.Values = (
          44.979166666666670000
          957.791666666666800000
          10.583333333333330000
          928.687500000000000000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
        DataField = 'BANCO'
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
      object QRDBText3: TQRDBText
        Left = 75
        Top = 25
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666670000
          198.437500000000000000
          66.145833333333320000
          383.645833333333300000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
        DataField = 'AGENCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText4: TQRDBText
        Left = 342
        Top = 25
        Width = 134
        Height = 17
        Size.Values = (
          44.979166666666670000
          904.875000000000000000
          66.145833333333320000
          354.541666666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
        DataField = 'CONTA_CORRENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 481
        Top = 25
        Width = 103
        Height = 17
        Size.Values = (
          44.979166666666670000
          1272.645833333333000000
          66.145833333333320000
          272.520833333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Saldo Anterior R$: '
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
      object qrlSaldoAnterior: TQRLabel
        Left = 587
        Top = 25
        Width = 126
        Height = 17
        Size.Values = (
          44.979166666666670000
          1553.104166666667000000
          66.145833333333320000
          333.375000000000000000)
        XLColumn = 5
        XLNumFormat = nfDec2
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '#,0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel1: TQRLabel
        Left = 4
        Top = 65
        Width = 74
        Height = 16
        Size.Values = (
          42.333333333333330000
          10.583333333333330000
          171.979166666666700000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Pagamento'
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
        Left = 161
        Top = 65
        Width = 162
        Height = 16
        Size.Values = (
          42.333333333333330000
          425.979166666666700000
          171.979166666666700000
          428.625000000000000000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Descri'#231#227'o'
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
        Left = 414
        Top = 65
        Width = 55
        Height = 16
        Size.Values = (
          42.333333333333330000
          1095.375000000000000000
          171.979166666666700000
          145.520833333333300000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cheque'
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
        Left = 471
        Top = 65
        Width = 81
        Height = 16
        Size.Values = (
          42.333333333333330000
          1246.187500000000000000
          171.979166666666700000
          214.312500000000000000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cr'#233'ditos R$'
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
        Left = 554
        Top = 65
        Width = 75
        Height = 16
        Size.Values = (
          42.333333333333330000
          1465.791666666667000000
          171.979166666666700000
          198.437500000000000000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'D'#233'bitos R$'
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
        Left = 631
        Top = 65
        Width = 82
        Height = 16
        Size.Values = (
          42.333333333333330000
          1669.520833333333000000
          171.979166666666700000
          216.958333333333300000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Saldo R$'
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
      object QRLabel12: TQRLabel
        Left = 325
        Top = 65
        Width = 86
        Height = 16
        Size.Values = (
          42.333333333333330000
          859.895833333333200000
          171.979166666666700000
          227.541666666666700000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Documento'
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
      object QRShape1: TQRShape
        Left = 3
        Top = 45
        Width = 711
        Height = 1
        Frame.Color = clSilver
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          119.062500000000000000
          1881.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Pen.Color = clSilver
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 82
        Top = 65
        Width = 77
        Height = 16
        Size.Values = (
          42.333333333333330000
          216.958333333333300000
          171.979166666666700000
          203.729166666666700000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Compensado'
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
      object QRLabel16: TQRLabel
        Left = 4
        Top = 48
        Width = 74
        Height = 16
        Size.Values = (
          42.333333333333330000
          10.583333333333330000
          127.000000000000000000
          195.791666666666700000)
        XLColumn = 0
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
      object QRLabel17: TQRLabel
        Left = 82
        Top = 48
        Width = 77
        Height = 16
        Size.Values = (
          42.333333333333330000
          216.958333333333300000
          127.000000000000000000
          203.729166666666700000)
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
    end
    object qrGroupFooter: TQRBand
      Left = 38
      Top = 297
      Width = 718
      Height = 23
      Frame.Color = clSilver
      Frame.DrawTop = True
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = qrGroupFooterBeforePrint
      Color = clWhite
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        60.854166666666680000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlTotalCreditos: TQRLabel
        Left = 471
        Top = 2
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1246.187500000000000000
          5.291666666666667000
          214.312500000000000000)
        XLColumn = 5
        XLNumFormat = nfDec2
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '#,0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object qrlTotalDebitos: TQRLabel
        Left = 554
        Top = 2
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          1465.791666666667000000
          5.291666666666667000
          198.437500000000000000)
        XLColumn = 6
        XLNumFormat = nfDec2
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '#,0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object qrlTotalSaldo: TQRLabel
        Left = 631
        Top = 2
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1669.520833333333000000
          5.291666666666667000
          214.312500000000000000)
        XLColumn = 7
        XLNumFormat = nfDec2
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '#,0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel14: TQRLabel
        Left = 358
        Top = 2
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          947.208333333333400000
          5.291666666666667000
          232.833333333333400000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total conta  R$:'
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
  end
end
