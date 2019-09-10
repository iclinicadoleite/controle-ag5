inherited fqrFIN_APagarTitulo: TfqrFIN_APagarTitulo
  Left = 414
  Top = 137
  Caption = 'fqrFIN_APagarTitulo'
  ClientHeight = 685
  ClientWidth = 807
  ExplicitWidth = 823
  ExplicitHeight = 724
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = 0
    Top = -1
    BeforePrint = QuickRepBeforePrint
    DataSet = cdsFIN_APAGAR
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
    ReportTitle = 'T'#237'tulo A Pagar'
    PrevInitialZoom = qrZoomToWidth
    ExplicitLeft = 0
    ExplicitTop = -1
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
        Size.Values = (
          42.333333333333340000
          1661.583333333333000000
          246.062500000000000000
          238.125000000000000000)
        FontSize = 9
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
      Top = 190
      Height = 38
      Size.Values = (
        100.541666666666700000
        1899.708333333333000000)
      ExplicitTop = 190
      ExplicitHeight = 38
      object QRDBText8: TQRDBText
        Left = 73
        Top = 2
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          193.145833333333300000
          5.291666666666667000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'DOCUMENTO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 218
        Top = 2
        Width = 311
        Height = 15
        Size.Values = (
          39.687500000000000000
          576.791666666666800000
          5.291666666666667000
          822.854166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'HISTORICO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 8
        Top = 20
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          52.916666666666670000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Vencimento'
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
      object QRLabel4: TQRLabel
        Left = 89
        Top = 20
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          235.479166666666700000
          52.916666666666670000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '$ Valor'
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
      object QRLabel5: TQRLabel
        Left = 276
        Top = 20
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          730.250000000000000000
          52.916666666666670000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '$ Pago'
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
        Left = 195
        Top = 20
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          515.937500000000000000
          52.916666666666670000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Pagto'
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
        Left = 8
        Top = 2
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          5.291666666666667000
          185.208333333333300000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 162
        Top = 2
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          428.625000000000000000
          5.291666666666667000
          145.520833333333300000)
        XLColumn = 0
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
      object QRLabel7: TQRLabel
        Left = 384
        Top = 20
        Width = 226
        Height = 15
        Size.Values = (
          39.687500000000000000
          1016.000000000000000000
          52.916666666666670000
          597.958333333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Conta banc'#225'ria'
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
      object QRDBText9: TQRDBText
        Left = 594
        Top = 2
        Width = 117
        Height = 15
        Size.Values = (
          39.687500000000000000
          1571.625000000000000000
          5.291666666666667000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'VALOR'
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 544
        Top = 2
        Width = 44
        Height = 15
        Size.Values = (
          39.687500000000000000
          1439.333333333333000000
          5.291666666666667000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total R$'
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
    object QRSubDetail1: TQRSubDetail [3]
      Left = 38
      Top = 228
      Width = 718
      Height = 20
      Frame.Color = 15724527
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep
      DataSet = cdsParcelas
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 8
        Top = 2
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          5.291666666666667000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsParcelas
        DataField = 'VENCTO'
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
      object QRDBText4: TQRDBText
        Left = 89
        Top = 2
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          235.479166666666700000
          5.291666666666667000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsParcelas
        DataField = 'VALOR'
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
      object QRDBText5: TQRDBText
        Left = 276
        Top = 2
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          730.250000000000000000
          5.291666666666667000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsParcelas
        DataField = 'PAGO'
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
      object QRDBText6: TQRDBText
        Left = 195
        Top = 2
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          515.937500000000000000
          5.291666666666667000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsParcelas
        DataField = 'PAGTO'
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
        Left = 384
        Top = 2
        Width = 226
        Height = 15
        Size.Values = (
          39.687500000000000000
          1016.000000000000000000
          5.291666666666667000
          597.958333333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsParcelas
        DataField = 'CONTA'
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
    inherited rbPageFooter: TQRBand
      Top = 267
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 267
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
        Width = 150
        Height = 69
        Size.Values = (
          182.562500000000000000
          10.583333333333330000
          34.395833333333330000
          396.875000000000000000)
        ExplicitLeft = 4
        ExplicitTop = 13
        ExplicitWidth = 150
        ExplicitHeight = 69
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
      Top = 248
      Height = 19
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = rbSummaryBeforePrint
      Enabled = True
      LinkBand = QRSubDetail1
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      ExplicitTop = 248
      ExplicitHeight = 19
      inherited qrQuantidadeRegistros: TQRLabel
        Size.Values = (
          34.395833333333340000
          1611.312500000000000000
          50.270833333333330000
          230.187500000000000000)
        FontSize = 7
      end
      object QRLabel6: TQRLabel
        Left = 534
        Top = 2
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1412.875000000000000000
          5.291666666666667000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'PAGO R$'
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
      object qrlPago: TQRLabel
        Left = 610
        Top = 2
        Width = 104
        Height = 15
        Size.Values = (
          39.687500000000000000
          1613.958333333333000000
          5.291666666666667000
          275.166666666666700000)
        XLColumn = 0
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
      object qrlAPagar: TQRLabel
        Left = 423
        Top = 2
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          1119.187500000000000000
          5.291666666666667000
          280.458333333333300000)
        XLColumn = 0
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
      object QRLabel12: TQRLabel
        Left = 344
        Top = 2
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          910.166666666666800000
          5.291666666666667000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'A PAGAR R$'
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
    inherited rbColumnHeader: TQRBand
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitHeight = 17
    end
  end
  object cdsFIN_APAGAR: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR'
        ParamType = ptInput
      end>
    ProviderName = 'dspFIN_APAGAR'
    Left = 272
    Top = 352
    object cdsFIN_APAGARKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object cdsFIN_APAGARHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsFIN_APAGARDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsFIN_APAGARDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsFIN_APAGARVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,0.00'
    end
    object cdsFIN_APAGARsqlParcelas: TDataSetField
      FieldName = 'sqlParcelas'
    end
  end
  object dspFIN_APAGAR: TDataSetProvider
    DataSet = sqlFIN_APAGAR
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 208
    Top = 392
  end
  object sqlFIN_APAGAR: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    A.KFIN_APAGAR,'
      '    A.HISTORICO,'
      '    A.DOCUMENTO,'
      '    A.DATALANCTO,'
      '    A.VALOR'
      'FROM FIN_APAGAR A'
      'WHERE A.KFIN_APAGAR = :KFIN_APAGAR'
      '  AND A.TABLENAME IS NULL')
    Left = 272
    Top = 424
    object sqlFIN_APAGARKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object sqlFIN_APAGARHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlFIN_APAGARDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlFIN_APAGARDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlFIN_APAGARVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object sqlParcelas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSqlFIN_APAGAR
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_APAGAR'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    P.KFIN_APAGAR_PARCELA,'
      '    P.VENCTO,'
      '    P.VALOR,'
      '    P.PAGTO,'
      '    P.PAGO,'
      '    C.NOME CONTA'
      'FROM FIN_APAGAR_PARCELAS P'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = P.KFIN_CONTA'
      'WHERE P.KFIN_APAGAR = :KFIN_APAGAR')
    Left = 360
    Top = 424
    object sqlParcelasKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      Required = True
    end
    object sqlParcelasVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlParcelasVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlParcelasPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object sqlParcelasPAGO: TFloatField
      FieldName = 'PAGO'
    end
    object sqlParcelasCONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
  end
  object cdsParcelas: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsFIN_APAGARsqlParcelas
    Params = <>
    Left = 358
    Top = 355
    object cdsParcelasKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      Required = True
    end
    object cdsParcelasVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsParcelasVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object cdsParcelasPAGO: TFloatField
      FieldName = 'PAGO'
      DisplayFormat = '#,0.00'
    end
    object cdsParcelasCONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
  end
  object dtsSqlFIN_APAGAR: TDataSource
    DataSet = sqlFIN_APAGAR
    Left = 312
    Top = 464
  end
end
