inherited fqrFIN_APagarCompensacao: TfqrFIN_APagarCompensacao
  Left = 279
  Top = 235
  Caption = 'fqrFIN_APagarCompensacao'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitLeft = 279
  ExplicitTop = 235
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    DataSet = cdsTitPag
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
    ReportTitle = 'T'#237'tulos A Pagar para Compensa'#231#227'o'
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
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
        Size.Values = (
          42.333333333333330000
          846.666666666666700000
          68.791666666666670000
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
          391.583333333333300000)
        ExplicitLeft = 564
        ExplicitTop = 5
      end
    end
    inherited rbDetail: TQRBand
      Top = 215
      Height = 17
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 215
      ExplicitHeight = 17
      object QRDBText1: TQRDBText
        Left = 0
        Top = 0
        Width = 60
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
          158.750000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = cdsTitPag
        DataField = 'VENCTO'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 120
        Top = 0
        Width = 330
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          317.500000000000000000
          0.000000000000000000
          873.124999999999900000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsTitPag
        DataField = 'ENTIDADE'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 650
        Top = 0
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          0.000000000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = cdsTitPag
        DataField = 'VALOR'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 60
        Top = 0
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          158.750000000000000000
          0.000000000000000000
          158.750000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = cdsTitPag
        DataField = 'DOCUMENTO'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 450
        Top = 0
        Width = 200
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1190.625000000000000000
          0.000000000000000000
          529.166666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsTitPag
        DataField = 'NOME'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 283
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 283
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
          34.395833333333330000
          508.000000000000000000
          74.083333333333330000
          518.583333333333300000)
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
    end
    object QRBand7: TQRBand [4]
      Left = 38
      Top = 232
      Width = 718
      Height = 17
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
        44.979166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
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
        Left = 650
        Top = 1
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          2.645833333333333000
          158.750000000000000000)
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
    end
    object QRGroup2: TQRGroup [5]
      Left = 38
      Top = 190
      Width = 718
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'cdsTitPag.CONTA'
      FooterBand = QRBand6
      Master = QuickRep
      ReprintOnNewPage = False
      object QRDBText6: TQRDBText
        Left = 0
        Top = 0
        Width = 58
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          0.000000000000000000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = cdsTitPag
        DataField = 'CONTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
    object QRGroup1: TQRGroup [6]
      Left = 38
      Top = 210
      Width = 718
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
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'cdsTitPag.VENCTO'
      FooterBand = QRBand7
      Master = QuickRep
      ReprintOnNewPage = False
    end
    object QRBand6: TQRBand [7]
      Left = 38
      Top = 249
      Width = 718
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
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
      BandType = rbGroupFooter
      object QRLabel10: TQRLabel
        Left = 650
        Top = 1
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          2.645833333333333000
          158.750000000000000000)
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
    inherited rbSummary: TQRBand
      Top = 266
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 266
      ExplicitHeight = 17
    end
    inherited rbColumnHeader: TQRBand
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitHeight = 17
      object QRLabel1: TQRLabel
        Left = 0
        Top = 0
        Width = 60
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
          158.750000000000000000)
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
        Left = 120
        Top = 0
        Width = 330
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          317.500000000000000000
          0.000000000000000000
          873.124999999999900000)
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
        Left = 655
        Top = 0
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1733.020833333333000000
          0.000000000000000000
          158.750000000000000000)
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
      object QRLabel11: TQRLabel
        Left = 60
        Top = 0
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          158.750000000000000000
          0.000000000000000000
          158.750000000000000000)
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
        Left = 450
        Top = 0
        Width = 200
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1190.625000000000000000
          0.000000000000000000
          529.166666666666800000)
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
  object qryTitPag: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '    t.KTITPAG,'
      '    t.NOME,'
      '    e.NOME as ENTIDADE,'
      '    t.DOCUMENTO,'
      '    t.LANCTO, '
      '    d.KDESDPAG,'
      '    d.VENCTO,'
      '    d.VALOR,'
      '    d.PAGTO,'
      '    d.PAGO,'
      '    d.PREVISTO,'
      '    c.NOME as CONTA'
      'FROM TITPAG t'
      '  JOIN DESDPAG d on (d.KTITPAG = t.KTITPAG)'
      '    LEFT JOIN CONTA c on (d.KCONTA = c.KCONTA)'
      '  JOIN ENTIDADE e on (e.KENTIDADE = t.KENTIDADE)'
      'Where d.PAGO IS NULL and d.COMPENSACAO = '#39'S'#39
      '%s'
      'Order By c.NOME, d.VENCTO'
      '')
    Left = 312
    Top = 288
    object qryTitPagKTITPAG: TIntegerField
      FieldName = 'KTITPAG'
      Required = True
    end
    object qryTitPagNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object qryTitPagENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Required = True
      Size = 60
    end
    object qryTitPagDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object qryTitPagLANCTO: TDateField
      FieldName = 'LANCTO'
    end
    object qryTitPagKDESDPAG: TIntegerField
      FieldName = 'KDESDPAG'
      Required = True
    end
    object qryTitPagVENCTO: TDateField
      FieldName = 'VENCTO'
      Required = True
    end
    object qryTitPagVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object qryTitPagPAGTO: TDateField
      FieldName = 'PAGTO'
    end
    object qryTitPagPAGO: TFMTBCDField
      FieldName = 'PAGO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object qryTitPagPREVISTO: TStringField
      FieldName = 'PREVISTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryTitPagCONTA: TStringField
      FieldName = 'CONTA'
      Size = 30
    end
  end
  object cdsTitPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTitPag'
    Left = 160
    Top = 288
    object cdsTitPagKTITPAG: TIntegerField
      FieldName = 'KTITPAG'
      Required = True
    end
    object cdsTitPagNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdsTitPagENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Required = True
      Size = 60
    end
    object cdsTitPagDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsTitPagLANCTO: TDateField
      FieldName = 'LANCTO'
    end
    object cdsTitPagKDESDPAG: TIntegerField
      FieldName = 'KDESDPAG'
      Required = True
    end
    object cdsTitPagVENCTO: TDateField
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsTitPagVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsTitPagPAGTO: TDateField
      FieldName = 'PAGTO'
    end
    object cdsTitPagPAGO: TFMTBCDField
      FieldName = 'PAGO'
      Precision = 15
      Size = 2
    end
    object cdsTitPagPREVISTO: TStringField
      FieldName = 'PREVISTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTitPagCONTA: TStringField
      FieldName = 'CONTA'
      Size = 30
    end
  end
  object dspTitPag: TDataSetProvider
    DataSet = qryTitPag
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 240
    Top = 288
  end
end
