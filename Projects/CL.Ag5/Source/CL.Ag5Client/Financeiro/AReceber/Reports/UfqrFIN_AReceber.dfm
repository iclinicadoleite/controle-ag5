inherited fqrFIN_AReceber: TfqrFIN_AReceber
  Left = 76
  Top = 203
  Caption = 'fqrFIN_AReceber'
  ClientHeight = 774
  ClientWidth = 1115
  OnDestroy = FormDestroy
  ExplicitLeft = 76
  ExplicitTop = 203
  ExplicitWidth = 1131
  ExplicitHeight = 812
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Width = 1123
    Height = 794
    BeforePrint = QuickRepBeforePrint
    DataSet = cdsAReceber
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
    ReportTitle = 'T'#237'tulos A Receber'
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited rbPageHeader: TQRBand
      Width = 1047
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      ExplicitWidth = 1047
      inherited _qrsDateTime: TQRSysData
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          0.000000000000000000
          322.791666666666700000)
        FontSize = 9
      end
      inherited _qrsPageNumber: TQRSysData
        Left = 957
        Size.Values = (
          42.333333333333330000
          2532.062500000000000000
          0.000000000000000000
          238.125000000000000000)
        FontSize = 9
        ExplicitLeft = 957
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
          60.854166666666670000
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
        Size.Values = (
          42.333333333333330000
          2532.062500000000000000
          246.062500000000000000
          238.125000000000000000)
        FontSize = 9
        ExplicitLeft = 957
      end
      inherited _qrImageLogo: TQRImage
        Size.Values = (
          185.208333333333300000
          10.583333333333330000
          7.937500000000000000
          254.000000000000000000)
      end
      inherited _qrlDescricao: TQRLabel
        Left = 484
        Size.Values = (
          42.333333333333330000
          1280.583333333333000000
          68.791666666666670000
          206.375000000000000000)
        FontSize = 9
        ExplicitLeft = 484
      end
      inherited QRShapeHeaderSeparator: TQRShape
        Width = 1029
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          198.437500000000000000
          2722.562500000000000000)
        ExplicitWidth = 1029
      end
      inherited QRImageDomain: TQRImage
        Size.Values = (
          156.104166666666700000
          1492.250000000000000000
          13.229166666666670000
          391.583333333333300000)
      end
    end
    inherited rbDetail: TQRBand
      Top = 202
      Width = 1047
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        89.958333333333330000
        2770.187500000000000000)
      ExplicitTop = 202
      ExplicitWidth = 1047
      object QRDBText1: TQRDBText
        Left = 690
        Top = 0
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1825.625000000000000000
          0.000000000000000000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = cdsAReceber
        DataField = 'VENCTO'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 80
        Top = 0
        Width = 300
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          0.000000000000000000
          793.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsAReceber
        DataField = 'ENTIDADE'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 765
        Top = 0
        Width = 100
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2024.062500000000000000
          0.000000000000000000
          264.583333333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = cdsAReceber
        DataField = 'VALOR'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 940
        Top = 0
        Width = 100
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2487.083333333333000000
          0.000000000000000000
          264.583333333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = cdsAReceber
        DataField = 'PAGO'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 865
        Top = 0
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2288.645833333333000000
          0.000000000000000000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsAReceber
        DataField = 'PAGTO'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 0
        Top = 0
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          0.000000000000000000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = cdsAReceber
        DataField = 'DOCUMENTO'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 385
        Top = 0
        Width = 300
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1018.645833333333000000
          0.000000000000000000
          793.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsAReceber
        DataField = 'HISTORICO'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 287
      Width = 1047
      Size.Values = (
        190.500000000000000000
        2770.187500000000000000)
      ExplicitTop = 287
      ExplicitWidth = 1047
      inherited _qrlFooter: TQRLabel
        Size.Values = (
          34.395833333333330000
          0.000000000000000000
          0.000000000000000000
          140.229166666666700000)
        FontSize = 7
      end
      inherited LogoClinica: TQRImage
        Size.Values = (
          134.937500000000000000
          10.583333333333330000
          34.395833333333330000
          272.520833333333300000)
      end
      inherited QRShapeFooterSeparator: TQRShape
        Size.Values = (
          2.645833333333333000
          298.979166666666700000
          111.125000000000000000
          1553.104166666667000000)
      end
    end
    inherited rbSummary: TQRBand
      Top = 253
      Width = 1047
      Size.Values = (
        89.958333333333330000
        2770.187500000000000000)
      ExplicitTop = 253
      ExplicitWidth = 1047
      object QRLabel6: TQRLabel
        Left = 865
        Top = 1
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2288.645833333333000000
          2.645833333333333000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'RECEBIDO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 940
        Top = 1
        Width = 100
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2487.083333333333000000
          2.645833333333333000
          264.583333333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ',0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRLabel8Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 765
        Top = 1
        Width = 100
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2024.062500000000000000
          2.645833333333333000
          264.583333333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ',0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRLabel10Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 690
        Top = 1
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1825.625000000000000000
          2.645833333333333000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'A RECEBER'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 0
        Top = 1
        Width = 98
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          259.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'TOTAL DO GERAL:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRGroup1: TQRGroup [5]
      Left = 38
      Top = 197
      Width = 1047
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryTitRec.PAGTO'
      FooterBand = QRBand7
      Master = QuickRep
      ReprintOnNewPage = False
    end
    object QRBand7: TQRBand [6]
      Left = 38
      Top = 236
      Width = 1047
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand7BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel13: TQRLabel
        Left = 865
        Top = 1
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2288.645833333333000000
          2.645833333333333000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'RECEBIDO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 690
        Top = 1
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1825.625000000000000000
          2.645833333333333000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'A RECEBER'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 0
        Top = 1
        Width = 80
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'TOTAL DO DIA:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 765
        Top = 1
        Width = 100
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2024.062500000000000000
          2.645833333333333000
          264.583333333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ',0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRLabel14Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 940
        Top = 1
        Width = 100
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2487.083333333333000000
          2.645833333333333000
          264.583333333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ',0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRLabel15Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    inherited rbColumnHeader: TQRBand
      Width = 1047
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      ExplicitWidth = 1047
      object QRLabel1: TQRLabel
        Left = 690
        Top = 0
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1825.625000000000000000
          0.000000000000000000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Vencto'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 80
        Top = 0
        Width = 300
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          0.000000000000000000
          793.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Entidade'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 765
        Top = 0
        Width = 100
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2024.062500000000000000
          0.000000000000000000
          264.583333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '$ Valor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 940
        Top = 0
        Width = 100
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2487.083333333333000000
          0.000000000000000000
          264.583333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '$ Recebido'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 865
        Top = 0
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2288.645833333333000000
          0.000000000000000000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Recto'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 0
        Top = 0
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          0.000000000000000000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Documento'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 385
        Top = 0
        Width = 300
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1018.645833333333000000
          0.000000000000000000
          793.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object qryAreceber: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PAGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '    t.KFIN_ARECEBER,'
      '    t.HISTORICO,'
      '    e.NOME as ENTIDADE,'
      '    t.DOCUMENTO,'
      '    d.KFIN_ARECEBER_PARCELA,'
      '    d.VENCTO,'
      '    d.VALOR,'
      '    d.PAGTO,'
      '    d.PAGO,'
      '    '#39'N'#39' PREVISTO,'
      '    c.NOME as CONTA'
      'FROM FIN_ARECEBER t'
      
        '  JOIN FIN_ARECEBER_PARCELAS d on (d.KFIN_ARECEBER = t.KFIN_AREC' +
        'EBER)'
      '    LEFT JOIN FIN_CONTAS c on (d.KFIN_CONTA = c.KFIN_CONTA)'
      '  JOIN CAD_ENTIDADES e on (e.KCAD_ENTIDADE = t.KCAD_ENTIDADE)'
      ' Where (D.PAGO IS NULL or 1 = :PAGO)'
      '%s'
      'Order By %s')
    SQLConnection = DBFinanceiro.SQLDB
    Left = 120
    Top = 336
    object qryAreceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      Size = 20
    end
    object qryAreceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Required = True
      Size = 60
    end
    object qryAreceberENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Required = True
      Size = 60
    end
    object qryAreceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object qryAreceberKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      Required = True
      Size = 20
    end
    object qryAreceberVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object qryAreceberVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryAreceberPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object qryAreceberPAGO: TFloatField
      FieldName = 'PAGO'
      DisplayFormat = ',0.00'
    end
    object qryAreceberPREVISTO: TStringField
      FieldName = 'PREVISTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryAreceberCONTA: TStringField
      FieldName = 'CONTA'
      Size = 30
    end
  end
  object cdsAReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAreceber'
    Left = 120
    Top = 256
    object cdsAReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      Size = 20
    end
    object cdsAReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Required = True
      Size = 60
    end
    object cdsAReceberENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Required = True
      Size = 60
    end
    object cdsAReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsAReceberKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      Required = True
      Size = 20
    end
    object cdsAReceberVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsAReceberVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object cdsAReceberPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object cdsAReceberPAGO: TFloatField
      FieldName = 'PAGO'
    end
    object cdsAReceberPREVISTO: TStringField
      FieldName = 'PREVISTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAReceberCONTA: TStringField
      FieldName = 'CONTA'
      Size = 30
    end
  end
  object dspAreceber: TDataSetProvider
    DataSet = qryAreceber
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 296
  end
end
