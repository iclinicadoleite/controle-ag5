inherited Fin_ComprasPorPeriodoReport: TFin_ComprasPorPeriodoReport
  Left = 286
  Top = 123
  Caption = 'Compras por per'#237'odo'
  ClientHeight = 680
  ClientWidth = 1143
  ExplicitWidth = 1159
  ExplicitHeight = 719
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = -4
    Top = 0
    Width = 1123
    Height = 794
    BeforePrint = QuickRepBeforePrint
    DataSet = cdsMaster
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
    ReportTitle = 'Notas Fiscais de Compras'
    ExplicitLeft = -4
    ExplicitTop = 0
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
          42.333333333333340000
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
          42.333333333333340000
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
        Size.Values = (
          2.645833333333333000
          52.916666666666670000
          44.979166666666670000
          1796.520833333333000000)
      end
      inherited _qrsReportTitle2: TQRSysData
        Left = 489
        Size.Values = (
          42.333333333333340000
          1293.812500000000000000
          0.000000000000000000
          179.916666666666700000)
        FontSize = 9
        ExplicitLeft = 489
      end
    end
    inherited rbTitle: TQRBand
      Width = 1047
      Frame.DrawBottom = False
      Size.Values = (
        293.687500000000000000
        2770.187500000000000000)
      ExplicitWidth = 1047
      inherited _qrsReportTitle: TQRSysData
        Left = 471
        Size.Values = (
          60.854166666666680000
          1246.187500000000000000
          13.229166666666670000
          277.812500000000000000)
        FontSize = 14
        ExplicitLeft = 471
      end
      inherited _qrsDateTimeTitle: TQRSysData
        Left = 925
        Size.Values = (
          42.333333333333340000
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
          42.333333333333340000
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
          42.333333333333340000
          1280.583333333333000000
          68.791666666666680000
          206.375000000000000000)
        FontSize = 9
        ExplicitLeft = 484
      end
      inherited QRShapeHeaderSeparator: TQRShape
        Left = 3
        Top = 74
        Width = 1038
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          195.791666666666700000
          2746.375000000000000000)
        ExplicitLeft = 3
        ExplicitTop = 74
        ExplicitWidth = 1038
      end
      inherited QRImageDomain: TQRImage
        Left = 892
        Top = 6
        Size.Values = (
          156.104166666666700000
          2360.083333333333000000
          15.875000000000000000
          391.583333333333400000)
        ExplicitLeft = 892
        ExplicitTop = 6
      end
    end
    inherited rbDetail: TQRBand
      Top = 193
      Width = 1047
      Height = 21
      Frame.Color = 15724527
      Frame.DrawLeft = False
      Frame.DrawRight = False
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        55.562500000000000000
        2770.187500000000000000)
      ExplicitTop = 193
      ExplicitWidth = 1047
      ExplicitHeight = 21
      object QRDBText1: TQRDBText
        Left = 3
        Top = 2
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          5.291666666666667000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMaster
        DataField = 'NOTA_FISCAL'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 131
        Top = 2
        Width = 93
        Height = 15
        Size.Values = (
          39.687500000000000000
          346.604166666666700000
          5.291666666666667000
          246.062500000000000000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMaster
        DataField = 'DATA_EMISSAO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 230
        Top = 2
        Width = 248
        Height = 15
        Size.Values = (
          39.687500000000000000
          608.541666666666800000
          5.291666666666667000
          656.166666666666800000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMaster
        DataField = 'NOMEENTIDADE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 484
        Top = 2
        Width = 132
        Height = 15
        Size.Values = (
          39.687500000000000000
          1280.583333333333000000
          5.291666666666667000
          349.250000000000000000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMaster
        DataField = 'CPF_CNPJ'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 622
        Top = 2
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          1645.708333333333000000
          5.291666666666667000
          179.916666666666700000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMaster
        DataField = 'PARCELAS'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 696
        Top = 2
        Width = 88
        Height = 15
        Size.Values = (
          39.687500000000000000
          1841.500000000000000000
          5.291666666666667000
          232.833333333333300000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMaster
        DataField = 'TOTAL_NOTA'
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 790
        Top = 2
        Width = 251
        Height = 15
        Size.Values = (
          39.687500000000000000
          2090.208333333333000000
          5.291666666666667000
          664.104166666666800000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMaster
        DataField = 'NOMECONTA'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 88
        Top = 2
        Width = 37
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333300000
          5.291666666666667000
          97.895833333333320000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsMaster
        DataField = 'SERIE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 235
      Width = 1047
      Height = 72
      Size.Values = (
        190.500000000000000000
        2770.187500000000000000)
      ExplicitTop = 235
      ExplicitWidth = 1047
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
        Left = 16
        Top = 3
        Width = 1021
        Size.Values = (
          2.645833333333333000
          42.333333333333330000
          7.937500000000000000
          2701.395833333333000000)
        ExplicitLeft = 16
        ExplicitTop = 3
        ExplicitWidth = 1021
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
        Top = 41
        Width = 928
        Size.Values = (
          2.645833333333333000
          298.979166666666700000
          108.479166666666700000
          2455.333333333333000000)
        ExplicitLeft = 113
        ExplicitTop = 41
        ExplicitWidth = 928
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
      Top = 214
      Width = 1047
      Height = 21
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = rbSummaryBeforePrint
      Enabled = True
      LinkBand = _CustomQuickReport.rbDetail
      Size.Values = (
        55.562500000000000000
        2770.187500000000000000)
      ExplicitTop = 214
      ExplicitWidth = 1047
      ExplicitHeight = 21
      inherited qrQuantidadeRegistros: TQRLabel
        Size.Values = (
          34.395833333333340000
          1611.312500000000000000
          50.270833333333330000
          230.187500000000000000)
        FontSize = 7
      end
      object QRLabel12: TQRLabel
        Left = 819
        Top = 3
        Width = 90
        Height = 15
        Size.Values = (
          39.687500000000000000
          2166.937500000000000000
          7.937500000000000000
          238.125000000000000000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total per'#237'odo R$'
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
      object QRLabel13: TQRLabel
        Left = 911
        Top = 3
        Width = 130
        Height = 15
        Size.Values = (
          39.687500000000000000
          2410.354166666667000000
          7.937500000000000000
          343.958333333333300000)
        XLColumn = 7
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
        Top = 2
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          5.291666666666667000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Nota Fiscal'
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
        Left = 131
        Top = 2
        Width = 93
        Height = 15
        Size.Values = (
          39.687500000000000000
          346.604166666666700000
          5.291666666666667000
          246.062500000000000000)
        XLColumn = 2
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Data emiss'#227'o'
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
        Left = 230
        Top = 2
        Width = 248
        Height = 15
        Size.Values = (
          39.687500000000000000
          608.541666666666800000
          5.291666666666667000
          656.166666666666800000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fornecedor'
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
        Left = 484
        Top = 2
        Width = 132
        Height = 15
        Size.Values = (
          39.687500000000000000
          1280.583333333333000000
          5.291666666666667000
          349.250000000000000000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'CNPJ'
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
        Left = 622
        Top = 2
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          1645.708333333333000000
          5.291666666666667000
          179.916666666666700000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Parcelas'
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
        Left = 696
        Top = 2
        Width = 88
        Height = 15
        Size.Values = (
          39.687500000000000000
          1841.500000000000000000
          5.291666666666667000
          232.833333333333300000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Total nota'
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
        Left = 790
        Top = 2
        Width = 251
        Height = 15
        Size.Values = (
          39.687500000000000000
          2090.208333333333000000
          5.291666666666667000
          664.104166666666800000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Conta'
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
        Left = 88
        Top = 2
        Width = 37
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333300000
          5.291666666666667000
          97.895833333333320000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'S'#233'rie'
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
  object cdsMaster: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
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
      end>
    ProviderName = 'dspMaster'
    OnCalcFields = cdsMasterCalcFields
    Left = 216
    Top = 8
    object cdsMasterNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 32
    end
    object cdsMasterSERIE: TStringField
      FieldName = 'SERIE'
      Size = 32
    end
    object cdsMasterDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
      Required = True
    end
    object cdsMasterKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object cdsMasterNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Required = True
      Size = 128
    end
    object cdsMasterCPF_CNPJ: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CPF_CNPJ'
      Size = 15
    end
    object cdsMasterPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object cdsMasterTOTAL_NOTA: TFloatField
      FieldName = 'TOTAL_NOTA'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsMasterNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
  end
  object dspMaster: TDataSetProvider
    DataSet = sqlMaster
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 56
  end
  object sqlMaster: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
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
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '    CP.NOTA_FISCAL,'
      '    CP.SERIE,'
      '    CP.DATA_EMISSAO,'
      '    CP.KCAD_ENTIDADE,'
      '    CP.NOMEENTIDADE,'
      '    ( SELECT COUNT(1) FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = AP.KFIN_APAGAR'
      '     ) PARCELAS,'
      '    CP.TOTAL_NOTA,'
      '    COALESCE( C.NOME, '#39'<< N'#227'o definida >>'#39') NOMECONTA'
      'FROM CMP_PEDIDOS CP'
      'LEFT JOIN FIN_APAGAR AP ON AP.KFIN_APAGAR = CP.KFIN_APAGAR'
      'LEFT JOIN FIN_CONTAS C ON C.KFIN_CONTA = AP.KFIN_CONTA_PREF'
      'WHERE ( CP.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( CP.DATA_EMISSAO BETWEEN :DATAINI AND :DATAFIM )'
      '  AND ( :TODOS = '#39'T'#39' OR ( CP.KCAD_ENTIDADE = :KCAD_ENTIDADE ) )'
      'ORDER BY CP.DATA_EMISSAO')
    Left = 214
    Top = 103
    object sqlMasterNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 32
    end
    object sqlMasterSERIE: TStringField
      FieldName = 'SERIE'
      Size = 32
    end
    object sqlMasterDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
      Required = True
    end
    object sqlMasterKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object sqlMasterNOMEENTIDADE: TStringField
      FieldName = 'NOMEENTIDADE'
      Required = True
      Size = 128
    end
    object sqlMasterPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object sqlMasterTOTAL_NOTA: TFloatField
      FieldName = 'TOTAL_NOTA'
      Required = True
    end
    object sqlMasterNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
      Size = 64
    end
  end
end
