inherited fqrFIN_AReceberAtraso: TfqrFIN_AReceberAtraso
  Left = 398
  Top = 461
  Caption = 'fqrFIN_AReceberAtraso'
  ClientHeight = 347
  ClientWidth = 790
  ExplicitWidth = 806
  ExplicitHeight = 386
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = -3
    Top = 0
    BeforePrint = QuickRepBeforePrint
    DataSet = cdsFIN_AReceber
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
    ReportTitle = 'T'#237'tulos a Receber em Atraso'
    PrevFormStyle = fsNormal
    PrevInitialZoom = qrZoomToWidth
    ExplicitLeft = -3
    ExplicitTop = 0
    inherited rbPageHeader: TQRBand
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitHeight = 17
      inherited _qrsDateTime: TQRSysData
        Left = 626
        Width = 92
        Height = 13
        Size.Values = (
          34.395833333333340000
          1656.291666666667000000
          0.000000000000000000
          243.416666666666700000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 626
        ExplicitWidth = 92
        ExplicitHeight = 13
      end
      inherited _qrsPageNumber: TQRSysData
        Size.Values = (
          34.395833333333340000
          1722.437500000000000000
          0.000000000000000000
          177.270833333333300000)
        FontSize = 7
      end
      inherited QRShapeHeaderSeparator2: TQRShape
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          44.979166666666670000
          1796.520833333333000000)
      end
      inherited _qrsReportTitle2: TQRSysData
        Left = 332
        Width = 53
        Height = 13
        Size.Values = (
          34.395833333333340000
          878.416666666666800000
          0.000000000000000000
          140.229166666666700000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 332
        ExplicitWidth = 53
        ExplicitHeight = 13
      end
    end
    inherited rbTitle: TQRBand
      Top = 55
      Height = 77
      Size.Values = (
        203.729166666666700000
        1899.708333333333000000)
      ExplicitTop = 55
      ExplicitHeight = 77
      inherited _qrsReportTitle: TQRSysData
        Size.Values = (
          60.854166666666680000
          809.625000000000000000
          13.229166666666670000
          277.812500000000000000)
        FontSize = 14
      end
      inherited _qrsDateTimeTitle: TQRSysData
        Left = 626
        Width = 92
        Height = 13
        Size.Values = (
          34.395833333333340000
          1656.291666666667000000
          203.729166666666700000
          243.416666666666700000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 626
        ExplicitWidth = 92
        ExplicitHeight = 13
      end
      inherited _qrsPageNumberTitle: TQRSysData
        Left = 651
        Top = 17
        Width = 67
        Height = 13
        Size.Values = (
          34.395833333333340000
          1722.437500000000000000
          44.979166666666670000
          177.270833333333300000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 651
        ExplicitTop = 17
        ExplicitWidth = 67
        ExplicitHeight = 13
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
        Left = 325
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          859.895833333333400000
          68.791666666666680000
          179.916666666666700000)
        Font.Height = -11
        FontSize = 8
        ExplicitLeft = 325
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
    end
    inherited rbDetail: TQRBand
      Top = 156
      Height = 19
      Frame.Color = 15724527
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      ExplicitTop = 156
      ExplicitHeight = 19
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
        DataSet = cdsFIN_AReceber
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
        DataSet = cdsFIN_AReceber
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
        DataSet = cdsFIN_AReceber
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
        DataSet = cdsFIN_AReceber
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
        DataSet = cdsFIN_AReceber
        DataField = 'HISTORICO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 214
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 214
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
      Top = 194
      Height = 20
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = rbSummaryBeforePrint
      Enabled = True
      LinkBand = rbDetail
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      ExplicitTop = 194
      ExplicitHeight = 20
      inherited qrQuantidadeRegistros: TQRLabel
        Size.Values = (
          34.395833333333340000
          1611.312500000000000000
          50.270833333333330000
          230.187500000000000000)
        FontSize = 7
      end
      object QRLabel10: TQRLabel
        Left = 612
        Top = 3
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1619.250000000000000000
          7.937500000000000000
          264.583333333333300000)
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
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 483
        Top = 3
        Width = 124
        Height = 15
        Size.Values = (
          39.687500000000000000
          1277.937500000000000000
          7.937500000000000000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TOTAL A RECEBER R$'
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
    inherited rbColumnHeader: TQRBand
      Top = 132
      Height = 19
      Frame.Color = 15724527
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      ExplicitTop = 132
      ExplicitHeight = 19
      object QRLabel1: TQRLabel
        Left = 351
        Top = 1
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          928.687500000000000000
          2.645833333333333000
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
      object Descricao: TQRLabel
        Left = 84
        Top = 1
        Width = 255
        Height = 15
        Frame.Color = clSilver
        Size.Values = (
          39.687500000000000000
          222.250000000000000000
          2.645833333333333000
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
        Top = 1
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1153.583333333333000000
          2.645833333333333000
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
        Top = 1
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          2.645833333333333000
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
        Top = 1
        Width = 163
        Height = 15
        Size.Values = (
          39.687500000000000000
          1434.041666666667000000
          2.645833333333333000
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
    object QRGroup1: TQRGroup
      Left = 38
      Top = 151
      Width = 718
      Height = 5
      Frame.Color = 15724527
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
    object QRBand7: TQRBand
      Left = 38
      Top = 175
      Width = 718
      Height = 19
      Frame.Color = 15724527
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = QRBand7BeforePrint
      Color = clWhite
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel17: TQRLabel
        Left = 456
        Top = 2
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          5.291666666666667000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TOTAL DO DIA'
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
        Left = 541
        Top = 2
        Width = 100
        Height = 15
        Frame.DrawTop = True
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          5.291666666666667000
          264.583333333333300000)
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
        OnPrint = QRLabel14Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 3
        Top = 17
        Width = 714
        Height = 1
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          44.979166666666670000
          1889.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object cdsFIN_AReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    ProviderName = 'dspFIN_AReceber'
    BeforeOpen = cdsFIN_AReceberBeforeOpen
    Left = 256
    Top = 8
    object cdsFIN_AReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      FixedChar = True
    end
    object cdsFIN_AReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsFIN_AReceberDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsFIN_AReceberKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      Required = True
      FixedChar = True
    end
    object cdsFIN_AReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsFIN_AReceberVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsFIN_AReceberVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsFIN_AReceberPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object cdsFIN_AReceberPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFIN_AReceberCONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
  end
  object dspFIN_AReceber: TDataSetProvider
    DataSet = sqlFIN_AReceber
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 40
  end
  object sqlFIN_AReceber: TTcSQLDataSet
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
      '    A.KFIN_ARECEBER,'
      '    A.HISTORICO,'
      '    A.DATALANCTO,'
      '    P.KFIN_ARECEBER_PARCELA,'
      '    P.DOCUMENTO,'
      '    P.VENCTO,'
      '    P.VALOR,'
      '    p.PAGTO,'
      '    P.PREVISAO,'
      '    C.NOME CONTA'
      'FROM FIN_ARECEBER_PARCELAS P'
      'JOIN FIN_ARECEBER A ON A.KFIN_ARECEBER = P.KFIN_ARECEBER'
      'LEFT JOIN FIN_CONTAS C ON P.KFIN_CONTA = C.KFIN_CONTA'
      'WHERE A.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND P.PAGTO IS NULL'
      '  AND P.VENCTO < CURRENT_DATE'
      '  AND A.TABLENAME IS NULL'
      'ORDER BY P.VENCTO')
    Left = 256
    Top = 64
    object sqlFIN_AReceberKFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      FixedChar = True
    end
    object sqlFIN_AReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlFIN_AReceberDATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlFIN_AReceberKFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      Required = True
      FixedChar = True
    end
    object sqlFIN_AReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlFIN_AReceberVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlFIN_AReceberVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlFIN_AReceberPAGTO: TSQLTimeStampField
      FieldName = 'PAGTO'
    end
    object sqlFIN_AReceberPREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFIN_AReceberCONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
  end
end
