inherited fqrFIN_APagarAtraso: TfqrFIN_APagarAtraso
  Left = 393
  Top = 15
  Caption = 'fqrFIN_APagarAtraso'
  ClientHeight = 389
  ClientWidth = 796
  ExplicitWidth = 812
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = 4
    Top = 0
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
    ReportTitle = 'Contas a Pagar'
    PrevFormStyle = fsNormal
    PrevInitialZoom = qrZoomToWidth
    ExplicitLeft = 4
    ExplicitTop = 0
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
      Top = 197
      Height = 20
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      ExplicitTop = 197
      ExplicitHeight = 20
      object QRDBText1: TQRDBText
        Left = 351
        Top = 2
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          928.687500000000000000
          5.291666666666667000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'VENCTO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 436
        Top = 2
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1153.583333333333000000
          5.291666666666667000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'VALOR'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 3
        Top = 2
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          5.291666666666667000
          198.437500000000000000)
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
        Left = 82
        Top = 2
        Width = 255
        Height = 15
        Size.Values = (
          39.687500000000000000
          216.958333333333300000
          5.291666666666667000
          674.687500000000000000)
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
      object QRDBText2: TQRDBText
        Left = 542
        Top = 2
        Width = 163
        Height = 15
        Size.Values = (
          39.687500000000000000
          1434.041666666667000000
          5.291666666666667000
          431.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsFIN_APAGAR
        DataField = 'CONTA'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object QRGroup1: TQRGroup [3]
      Left = 38
      Top = 192
      Width = 718
      Height = 5
      AlignToBottom = False
      Color = clWhite
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = QRBand7
      Master = QuickRep
      ReprintOnNewPage = False
    end
    object QRBand7: TQRBand [4]
      Left = 38
      Top = 217
      Width = 718
      Height = 17
      Frame.Color = clSilver
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = QRBand7BeforePrint
      Color = clWhite
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel17: TQRLabel
        Left = 528
        Top = 0
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          0.000000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TOTAL DO DIA:'
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
        Left = 608
        Top = 0
        Width = 100
        Height = 15
        Frame.DrawTop = True
        Size.Values = (
          39.687500000000000000
          1608.666666666667000000
          0.000000000000000000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
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
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 3
        Top = 15
        Width = 714
        Height = 1
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          39.687500000000000000
          1889.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 251
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 251
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
      Top = 234
      Height = 17
      AlignToBottom = False
      Enabled = True
      LinkBand = rbDetail
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 234
      ExplicitHeight = 17
      inherited qrQuantidadeRegistros: TQRLabel
        Size.Values = (
          34.395833333333340000
          1611.312500000000000000
          50.270833333333330000
          230.187500000000000000)
        FontSize = 7
      end
      object QRLabel10: TQRLabel
        Left = 608
        Top = 1
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1608.666666666667000000
          2.645833333333333000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
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
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 502
        Top = 1
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          1328.208333333333000000
          2.645833333333333000
          280.458333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TOTAL A PAGAR R$'
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
      Height = 19
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      ExplicitHeight = 19
      object QRLabel1: TQRLabel
        Left = 351
        Top = 2
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          928.687500000000000000
          5.291666666666667000
          211.666666666666700000)
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
      object Descriçlão: TQRLabel
        Left = 84
        Top = 2
        Width = 255
        Height = 15
        Frame.Color = clSilver
        Size.Values = (
          39.687500000000000000
          222.250000000000000000
          5.291666666666667000
          674.687500000000000000)
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
      object QRLabel4: TQRLabel
        Left = 436
        Top = 2
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1153.583333333333000000
          5.291666666666667000
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
      object QRLabel11: TQRLabel
        Left = 3
        Top = 2
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          5.291666666666667000
          198.437500000000000000)
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
      object QRLabel2: TQRLabel
        Left = 542
        Top = 2
        Width = 163
        Height = 15
        Size.Values = (
          39.687500000000000000
          1434.041666666667000000
          5.291666666666667000
          431.270833333333300000)
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
    end
  end
  object cdsFIN_APAGAR: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    ProviderName = 'dspFIN_APAGAR'
    BeforeOpen = cdsFIN_APAGARBeforeOpen
    Left = 236
    Top = 16
    object cdsFIN_APAGARKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object cdsFIN_APAGARHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsFIN_APAGARDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsFIN_APAGARKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      Required = True
      FixedChar = True
    end
    object cdsFIN_APAGARDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsFIN_APAGARVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsFIN_APAGARVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsFIN_APAGARPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object cdsFIN_APAGARPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFIN_APAGARCONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
  end
  object dspFIN_APAGAR: TDataSetProvider
    DataSet = sqlFIN_APAGAR
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 56
  end
  object sqlFIN_APAGAR: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    A.KFIN_APAGAR,'
      '    A.HISTORICO,'
      '    A.DATALANCTO,'
      '    P.KFIN_APAGAR_PARCELA,'
      '    P.DOCUMENTO,'
      '    P.VENCTO,'
      '    P.VALOR,'
      '    P.PAGTO,'
      '    P.PREVISAO,'
      '    C.NOME CONTA'
      'FROM FIN_APAGAR_PARCELAS P'
      'JOIN FIN_APAGAR A ON A.KFIN_APAGAR = P.KFIN_APAGAR'
      'LEFT JOIN FIN_CONTAS C ON P.KFIN_CONTA = C.KFIN_CONTA'
      'WHERE A.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND P.PAGTO IS NULL'
      '  AND P.VENCTO < CURRENT_DATE'
      '  AND A.TABLENAME IS NULL'
      'ORDER BY P.VENCTO')
    Left = 236
    Top = 88
    object sqlFIN_APAGARKFIN_APAGAR: TStringField
      FieldName = 'KFIN_APAGAR'
      Required = True
      FixedChar = True
    end
    object sqlFIN_APAGARHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlFIN_APAGARDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlFIN_APAGARKFIN_APAGAR_PARCELA: TStringField
      FieldName = 'KFIN_APAGAR_PARCELA'
      Required = True
      FixedChar = True
    end
    object sqlFIN_APAGARDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlFIN_APAGARVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlFIN_APAGARVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlFIN_APAGARPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object sqlFIN_APAGARPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFIN_APAGARCONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
  end
end
