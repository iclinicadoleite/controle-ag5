inherited FIN_AReceberReport: TFIN_AReceberReport
  Left = 336
  Top = 113
  Caption = 'Contas a receber'
  ClientHeight = 774
  ClientWidth = 844
  ExplicitWidth = 860
  ExplicitHeight = 813
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = -4
    Top = 0
    BeforePrint = QuickRepBeforePrint
    DataSet = FIN_ContasAReceberReportDataModule.cdsFIN_AReceber
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
    ReportTitle = 'Contas a Receber'
    PrevFormStyle = fsNormal
    PrevInitialZoom = qrZoomToWidth
    ExplicitLeft = -4
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
        Height = 25
        Size.Values = (
          66.145833333333340000
          809.625000000000000000
          13.229166666666670000
          277.812500000000000000)
        FontSize = 14
        ExplicitHeight = 25
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
        Top = 29
        Size.Values = (
          42.333333333333340000
          846.666666666666600000
          76.729166666666680000
          206.375000000000000000)
        FontSize = 9
        ExplicitTop = 29
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
      Top = 195
      Height = 18
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        47.625000000000000000
        1899.708333333333000000)
      ExplicitTop = 195
      ExplicitHeight = 18
      object QRDBText1: TQRDBText
        Left = 533
        Top = 0
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          1410.229166666667000000
          0.000000000000000000
          198.437500000000000000)
        XLColumn = 7
        XLNumFormat = nfDate2
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_ContasAReceberReportDataModule.cdsFIN_AReceber
        DataField = 'VENCTO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 80
        Top = 0
        Width = 185
        Height = 15
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          0.000000000000000000
          489.479166666666700000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = FIN_ContasAReceberReportDataModule.cdsFIN_AReceber
        DataField = 'NOMEENTIDADE'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 608
        Top = 0
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1608.666666666667000000
          0.000000000000000000
          264.583333333333300000)
        XLColumn = 9
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_ContasAReceberReportDataModule.cdsFIN_AReceber
        DataField = 'VALOR'
        Transparent = True
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 0
        Top = 0
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          0.000000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_ContasAReceberReportDataModule.cdsFIN_AReceber
        DataField = 'DOCUMENTO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 271
        Top = 1
        Width = 186
        Height = 15
        Size.Values = (
          39.687500000000000000
          717.020833333333200000
          2.645833333333333000
          492.125000000000000000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = FIN_ContasAReceberReportDataModule.cdsFIN_AReceber
        DataField = 'HISTORICO'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 463
        Top = 1
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1225.020833333333000000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FIN_ContasAReceberReportDataModule.cdsFIN_AReceber
        DataField = 'PARCELAS'
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
      Top = 190
      Width = 718
      Height = 5
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
      FooterBand = QRBand7
      Master = QuickRep
      ReprintOnNewPage = False
    end
    object QRBand7: TQRBand [4]
      Left = 38
      Top = 213
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
        XLColumn = 8
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
        XLColumn = 9
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
        ExportAs = exptNumeric
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
      Top = 247
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 247
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
      Top = 230
      Height = 17
      AlignToBottom = False
      Enabled = True
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 230
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
        XLColumn = 9
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
        OnPrint = QRLabel10Print
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 487
        Top = 1
        Width = 121
        Height = 15
        Size.Values = (
          39.687500000000000000
          1288.520833333333000000
          2.645833333333333000
          320.145833333333400000)
        XLColumn = 8
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TOTAL A RECEBER : R$'
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
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitHeight = 17
      object QRLabel1: TQRLabel
        Left = 533
        Top = 1
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          1410.229166666667000000
          2.645833333333333000
          198.437500000000000000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Vencto'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 271
        Top = 1
        Width = 186
        Height = 15
        Size.Values = (
          39.687500000000000000
          717.020833333333200000
          2.645833333333333000
          492.125000000000000000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 608
        Top = 1
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1608.666666666667000000
          2.645833333333333000
          264.583333333333300000)
        XLColumn = 9
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '$ Valor'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 0
        Top = 1
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Documento'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 80
        Top = 1
        Width = 185
        Height = 15
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          2.645833333333333000
          489.479166666666700000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cliente'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 463
        Top = 1
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1225.020833333333000000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Parcelas'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object cdsFIN_AReceber2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspFIN_AReceber'
    Left = 236
    Top = 16
    object cdsFIN_AReceber2KFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      FixedChar = True
    end
    object cdsFIN_AReceber2KFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      Required = True
      FixedChar = True
    end
    object cdsFIN_AReceber2HISTORICO: TStringField
      FieldName = 'HISTORICO'
      Required = True
      Size = 60
    end
    object cdsFIN_AReceber2NOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object cdsFIN_AReceber2DATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object cdsFIN_AReceber2DOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsFIN_AReceber2PARCELAS: TStringField
      FieldName = 'PARCELAS'
      Size = 23
    end
    object cdsFIN_AReceber2VENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object cdsFIN_AReceber2VALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsFIN_AReceber2PREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsFIN_AReceber2CONTAS: TStringField
      FieldName = 'CONTA'
      Size = 30
    end
  end
  object dspFIN_AReceber2: TDataSetProvider
    DataSet = sqlFIN_AReceber2
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 56
  end
  object sqlFIN_AReceber2: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    A.KFIN_ARECEBER,'
      '    A.HISTORICO,'
      '    A.NOMEENTIDADE,'
      
        '    IIF( A.RECORRENCIA = '#39'T'#39', P.DOCUMENTO, A.DOCUMENTO ) DOCUMEN' +
        'TO,'
      '    A.DATALANCTO,'
      '    P.KFIN_ARECEBER_PARCELA,'
      '    (    ( SELECT COUNT(1)'
      '             FROM FIN_ARECEBER_PARCELAS P1'
      '            WHERE P1.KFIN_ARECEBER = P.KFIN_ARECEBER'
      '              AND P1.VENCTO <= P.VENCTO'
      '          ) || '#39'/'#39' ||'
      '         ( SELECT COUNT(1)'
      '             FROM FIN_ARECEBER_PARCELAS P1'
      '            WHERE P1.KFIN_ARECEBER = P.KFIN_ARECEBER'
      '          )'
      '     ) PARCELAS,'
      '    P.VENCTO,'
      '    P.VALOR,'
      '    P.PREVISAO,'
      '    C.NOME CONTA'
      'FROM FIN_ARECEBER_PARCELAS P'
      'JOIN FIN_ARECEBER A ON A.KFIN_ARECEBER = P.KFIN_ARECEBER'
      'LEFT JOIN FIN_CONTAS C ON P.KFIN_CONTA = C.KFIN_CONTA'
      'LEFT JOIN CAD_ENTIDADES E ON E.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( :TODOS = '#39'T'#39' OR ( A.KCAD_ENTIDADE = :KCAD_ENTIDADE ) )'
      '  AND ( P.PAGO IS NULL )'
      '  AND ( P.VENCTO BETWEEN :DATAINI AND :DATAFIM )'
      'ORDER BY P.VENCTO')
    Left = 236
    Top = 96
    object sqlFIN_AReceber2KFIN_ARECEBER: TStringField
      FieldName = 'KFIN_ARECEBER'
      Required = True
      FixedChar = True
    end
    object sqlFIN_AReceber2KFIN_ARECEBER_PARCELA: TStringField
      FieldName = 'KFIN_ARECEBER_PARCELA'
      Required = True
      FixedChar = True
    end
    object sqlFIN_AReceber2HISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlFIN_AReceber2NOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Size = 128
    end
    object sqlFIN_AReceber2DATALANCTO: TSQLTimeStampField
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlFIN_AReceber2DOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlFIN_AReceber2PARCELAS: TStringField
      FieldName = 'PARCELAS'
      Size = 23
    end
    object sqlFIN_AReceber2VENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      Required = True
    end
    object sqlFIN_AReceber2VALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sqlFIN_AReceber2PREVISAO: TStringField
      FieldName = 'PREVISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFIN_AReceber2CONTA: TStringField
      FieldName = 'CONTA'
      Size = 64
    end
  end
end
