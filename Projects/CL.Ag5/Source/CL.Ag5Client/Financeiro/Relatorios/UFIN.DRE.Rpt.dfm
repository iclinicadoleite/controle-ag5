inherited rptFIN_DRE: TrptFIN_DRE
  Left = 314
  Top = 116
  Caption = 'rptFIN_DRE'
  ClientHeight = 708
  ClientWidth = 1254
  ExplicitWidth = 1270
  ExplicitHeight = 747
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = 2
    Top = 8
    Width = 1123
    Height = 794
    BeforePrint = QuickRepBeforePrint
    DataSet = dtmFIN_DRE.cdsDRE_Caixa
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
    ExplicitLeft = 2
    ExplicitTop = 8
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
          42.333333333333330000
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
          42.333333333333330000
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
          42.333333333333330000
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
          60.854166666666660000
          1246.187500000000000000
          13.229166666666670000
          277.812500000000000000)
        FontSize = 14
        ExplicitLeft = 471
      end
      inherited _qrsDateTimeTitle: TQRSysData
        Left = 925
        Size.Values = (
          42.333333333333330000
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
          42.333333333333330000
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
          42.333333333333330000
          1280.583333333333000000
          68.791666666666660000
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
          391.583333333333300000)
        ExplicitLeft = 892
        ExplicitTop = 6
      end
    end
    inherited rbDetail: TQRBand
      Top = 193
      Width = 1047
      Height = 17
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        44.979166666666670000
        2770.187500000000000000)
      ExplicitTop = 193
      ExplicitWidth = 1047
      ExplicitHeight = 17
      object qrDBDocumento: TQRDBText
        Left = 3
        Top = 2
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          5.291666666666667000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'DOCUMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBData: TQRDBText
        Left = 70
        Top = 2
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          185.208333333333300000
          5.291666666666667000
          209.020833333333300000)
        XLColumn = 1
        XLNumFormat = nfDate2
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
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
        Left = 395
        Top = 2
        Width = 90
        Height = 15
        Size.Values = (
          39.687500000000000000
          1045.104166666667000000
          5.291666666666667000
          238.125000000000000000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'HISTORICO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
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
        Left = 557
        Top = 2
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          1473.729166666667000000
          5.291666666666667000
          201.083333333333300000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'CONTACONTABIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
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
        Left = 636
        Top = 2
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          1682.750000000000000000
          5.291666666666667000
          206.375000000000000000)
        XLColumn = 8
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'CENTROCUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBRateio: TQRDBText
        Left = 716
        Top = 2
        Width = 39
        Height = 15
        Size.Values = (
          39.687500000000000000
          1894.416666666667000000
          5.291666666666667000
          103.187500000000000000)
        XLColumn = 9
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'PORCENTAGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBCredito: TQRDBText
        Left = 876
        Top = 2
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          2317.750000000000000000
          5.291666666666667000
          219.604166666666700000)
        XLColumn = 14
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'CREDITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBDebito: TQRDBText
        Left = 961
        Top = 2
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          2542.645833333333000000
          5.291666666666667000
          222.250000000000000000)
        XLColumn = 15
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'DEBITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBGrupoProduto: TQRDBText
        Left = 485
        Top = 2
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          1283.229166666667000000
          5.291666666666667000
          185.208333333333300000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'TIPO_PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBCodigo: TQRDBText
        Left = 152
        Top = 2
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          5.291666666666667000
          124.354166666666700000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBFornecedor: TQRDBText
        Left = 200
        Top = 2
        Width = 90
        Height = 15
        Size.Values = (
          39.687500000000000000
          529.166666666666800000
          5.291666666666667000
          238.125000000000000000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBCPFCNPJ: TQRDBText
        Left = 291
        Top = 2
        Width = 102
        Height = 15
        Size.Values = (
          39.687500000000000000
          769.937500000000000000
          5.291666666666667000
          269.875000000000000000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'CPF_CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBConta: TQRDBText
        Left = 754
        Top = 2
        Width = 38
        Height = 15
        Size.Values = (
          39.687500000000000000
          1994.958333333334000000
          5.291666666666667000
          100.541666666666700000)
        XLColumn = 10
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'NOMECONTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBCheque: TQRDBText
        Left = 798
        Top = 2
        Width = 38
        Height = 15
        Size.Values = (
          39.687500000000000000
          2111.375000000000000000
          5.291666666666667000
          100.541666666666700000)
        XLColumn = 11
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'NUM_CHEQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBProvisao: TQRDBText
        Left = 862
        Top = 2
        Width = 16
        Height = 15
        Size.Values = (
          39.687500000000000000
          2280.708333333333000000
          5.291666666666667000
          42.333333333333340000)
        XLColumn = 13
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'NUM_CHEQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDBParcela: TQRDBText
        Left = 838
        Top = 2
        Width = 23
        Height = 15
        Size.Values = (
          39.687500000000000000
          2217.208333333333000000
          5.291666666666667000
          60.854166666666680000)
        XLColumn = 12
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dtmFIN_DRE.cdsDRE_Caixa
        DataField = 'PARCELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
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
      Top = 230
      Width = 1047
      Height = 72
      Size.Values = (
        190.500000000000000000
        2770.187500000000000000)
      ExplicitTop = 230
      ExplicitWidth = 1047
      ExplicitHeight = 72
      inherited _qrlFooter: TQRLabel
        Size.Values = (
          34.395833333333330000
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
          34.395833333333330000
          55.562500000000000000
          34.395833333333330000
          534.458333333333300000)
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
          34.395833333333330000
          508.000000000000000000
          74.083333333333340000
          534.458333333333300000)
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
      Top = 210
      Width = 1047
      Height = 20
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = rbSummaryBeforePrint
      Enabled = True
      Size.Values = (
        52.916666666666670000
        2770.187500000000000000)
      ExplicitTop = 210
      ExplicitWidth = 1047
      ExplicitHeight = 20
      inherited qrQuantidadeRegistros: TQRLabel
        Size.Values = (
          34.395833333333330000
          1611.312500000000000000
          50.270833333333330000
          230.187500000000000000)
        FontSize = 7
      end
      object QRLabel10: TQRLabel
        Left = 690
        Top = 2
        Width = 29
        Height = 17
        Size.Values = (
          44.979166666666670000
          1825.625000000000000000
          5.291666666666667000
          76.729166666666660000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlTotalCredito: TQRLabel
        Left = 768
        Top = 2
        Width = 123
        Height = 17
        Size.Values = (
          44.979166666666670000
          2032.000000000000000000
          5.291666666666667000
          325.437500000000000000)
        XLColumn = 14
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '#,0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlTotalDebito: TQRLabel
        Left = 920
        Top = 2
        Width = 123
        Height = 17
        Size.Values = (
          44.979166666666670000
          2434.166666666667000000
          5.291666666666667000
          325.437500000000000000)
        XLColumn = 15
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '#,0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
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
        Left = 3
        Top = 3
        Width = 67
        Height = 19
        Size.Values = (
          50.270833333333330000
          7.937500000000000000
          7.937500000000000000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Documento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 70
        Top = 3
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          185.208333333333300000
          7.937500000000000000
          209.020833333333300000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Data'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 394
        Top = 3
        Width = 90
        Height = 15
        Size.Values = (
          39.687500000000000000
          1042.458333333333000000
          7.937500000000000000
          238.125000000000000000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 555
        Top = 3
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          1468.437500000000000000
          7.937500000000000000
          206.375000000000000000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Conta cont'#225'bil'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 633
        Top = 3
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1674.812500000000000000
          7.937500000000000000
          211.666666666666700000)
        XLColumn = 8
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Centro de custo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 714
        Top = 3
        Width = 39
        Height = 15
        Size.Values = (
          39.687500000000000000
          1889.125000000000000000
          7.937500000000000000
          103.187500000000000000)
        XLColumn = 9
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Rateio'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 966
        Top = 3
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          2555.875000000000000000
          7.937500000000000000
          211.666666666666700000)
        XLColumn = 15
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Debito'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 887
        Top = 3
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          2346.854166666667000000
          7.937500000000000000
          211.666666666666700000)
        XLColumn = 14
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cr'#233'dito'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 484
        Top = 3
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          1280.583333333333000000
          7.937500000000000000
          185.208333333333300000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 151
        Top = 3
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          399.520833333333400000
          7.937500000000000000
          124.354166666666700000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 199
        Top = 3
        Width = 90
        Height = 15
        Size.Values = (
          39.687500000000000000
          526.520833333333400000
          7.937500000000000000
          238.125000000000000000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Fornecedor'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 290
        Top = 3
        Width = 102
        Height = 15
        Size.Values = (
          39.687500000000000000
          767.291666666666800000
          7.937500000000000000
          269.875000000000000000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'CPF/CNPJ'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 754
        Top = 3
        Width = 39
        Height = 15
        Size.Values = (
          39.687500000000000000
          1994.958333333334000000
          7.937500000000000000
          103.187500000000000000)
        XLColumn = 10
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Conta'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 794
        Top = 3
        Width = 44
        Height = 15
        Size.Values = (
          39.687500000000000000
          2100.791666666667000000
          7.937500000000000000
          116.416666666666700000)
        XLColumn = 11
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cheque'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 860
        Top = 3
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          2275.416666666667000000
          7.937500000000000000
          76.729166666666680000)
        XLColumn = 13
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Prov.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 835
        Top = 3
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          2209.270833333333000000
          7.937500000000000000
          76.729166666666680000)
        XLColumn = 12
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Parc.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
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
