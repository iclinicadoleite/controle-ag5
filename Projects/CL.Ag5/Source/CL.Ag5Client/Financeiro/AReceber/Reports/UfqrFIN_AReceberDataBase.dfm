inherited fqrFIN_AReceberDataBase: TfqrFIN_AReceberDataBase
  Left = 336
  Top = 198
  Caption = 'fqrFIN_AReceberDataBase'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitLeft = 336
  ExplicitTop = 198
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    DataSet = cdsTitRec
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
    ReportTitle = 'T'#237'tulos A Receber - Data Base'
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
      Top = 210
      Height = 17
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 210
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
        DataSet = cdsTitRec
        DataField = 'VENCTO'
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
        DataSet = cdsTitRec
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
        Width = 90
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
          238.125000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = cdsTitRec
        DataField = 'DOCUMENTO'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 150
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
          396.875000000000000000
          0.000000000000000000
          793.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsTitRec
        DataField = 'NOME'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 450
        Top = 0
        Width = 200
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1190.625000000000000000
          0.000000000000000000
          529.166666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = cdsTitRec
        DataField = 'CONTA'
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 261
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 261
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
    object QRGroup1: TQRGroup [4]
      Left = 38
      Top = 190
      Width = 718
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'cdsTitRec.ENTIDADE'
      FooterBand = QRBand7
      Master = QuickRep
      ReprintOnNewPage = False
      object QRDBText2: TQRDBText
        Left = 0
        Top = 0
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          0.000000000000000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = cdsTitRec
        DataField = 'ENTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object QRBand7: TQRBand [5]
      Left = 38
      Top = 227
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
      object QRLabel16: TQRLabel
        Left = 479
        Top = 1
        Width = 171
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1267.354166666667000000
          2.645833333333333000
          452.437500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TOTAL A RECEBER DA ENTIDADE'
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
    inherited rbSummary: TQRBand
      Top = 244
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 244
      ExplicitHeight = 17
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
      object QRLabel12: TQRLabel
        Left = 512
        Top = 1
        Width = 138
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1354.666666666667000000
          2.645833333333333000
          365.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TOTAL GERAL A RECEBER'
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
        Left = 150
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
          396.875000000000000000
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
      object QRLabel4: TQRLabel
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
        Width = 90
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
          238.125000000000000000)
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
        Caption = 'Conta'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object qryTitRec: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATABASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATABASE'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      '    t.KTITREC,'
      '    t.NOME,'
      '    e.NOME as ENTIDADE,'
      '    t.DOCUMENTO,'
      '    d.KDESDREC,'
      '    d.VENCTO,'
      '    d.VALOR,'
      '    d.PAGTO,'
      '    d.PAGO,'
      '    d.PREVISTO,'
      '    c.NOME as CONTA'
      'FROM TITREC t'
      '  JOIN DESDREC d on (d.KTITREC = t.KTITREC)'
      '    LEFT JOIN CONTA c on (d.KCONTA = c.KCONTA)'
      '  JOIN ENTIDADE e on (e.KENTIDADE = t.KENTIDADE)'
      'Where (d.PAGTO IS NULL) or (d.PAGTO > :DATABASE)'
      '  and t.LANCTO <= :DATABASE'
      '--  and d.PREVISTO <> '#39'S'#39
      'Order By e.NOME, t.KENTIDADE, d.Vencto')
    Left = 312
    Top = 288
    object qryTitRecKTITREC: TIntegerField
      FieldName = 'KTITREC'
      Required = True
    end
    object qryTitRecNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object qryTitRecENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Required = True
      Size = 60
    end
    object qryTitRecDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object qryTitRecKDESDREC: TIntegerField
      FieldName = 'KDESDREC'
      Required = True
    end
    object qryTitRecVENCTO: TDateField
      FieldName = 'VENCTO'
      Required = True
    end
    object qryTitRecVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object qryTitRecPAGTO: TDateField
      FieldName = 'PAGTO'
    end
    object qryTitRecPAGO: TFMTBCDField
      FieldName = 'PAGO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object qryTitRecPREVISTO: TStringField
      FieldName = 'PREVISTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryTitRecCONTA: TStringField
      FieldName = 'CONTA'
      Size = 30
    end
  end
  object cdsTitRec: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATABASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATABASE'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspTitRec'
    Left = 120
    Top = 288
    object cdsTitRecKTITREC: TIntegerField
      FieldName = 'KTITREC'
      Required = True
    end
    object cdsTitRecNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdsTitRecENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Required = True
      Size = 60
    end
    object cdsTitRecDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsTitRecKDESDREC: TIntegerField
      FieldName = 'KDESDREC'
      Required = True
    end
    object cdsTitRecVENCTO: TDateField
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsTitRecVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsTitRecPAGTO: TDateField
      FieldName = 'PAGTO'
    end
    object cdsTitRecPAGO: TFMTBCDField
      FieldName = 'PAGO'
      Precision = 15
      Size = 2
    end
    object cdsTitRecPREVISTO: TStringField
      FieldName = 'PREVISTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTitRecCONTA: TStringField
      FieldName = 'CONTA'
      Size = 30
    end
  end
  object dspTitRec: TDataSetProvider
    DataSet = qryTitRec
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 224
    Top = 288
  end
end
