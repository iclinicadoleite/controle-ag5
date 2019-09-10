inherited FIN_PlanoContasRelatorio: TFIN_PlanoContasRelatorio
  Left = 368
  Top = 112
  Caption = 'Plano de Contas'
  ClientWidth = 793
  ExplicitWidth = 809
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = 0
    Top = 0
    DataSet = cdsPlanoContas
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
    ExplicitLeft = 0
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
        Width = 1042
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          198.437500000000000000
          2756.958333333333000000)
        ExplicitLeft = 3
        ExplicitWidth = 1042
      end
      inherited QRImageDomain: TQRImage
        Left = 566
        Top = 4
        Size.Values = (
          156.104166666666700000
          1497.541666666667000000
          10.583333333333330000
          391.583333333333400000)
        ExplicitLeft = 566
        ExplicitTop = 4
      end
    end
    inherited rbDetail: TQRBand
      Top = 207
      Height = 22
      Size.Values = (
        58.208333333333340000
        1899.708333333333000000)
      ExplicitTop = 207
      ExplicitHeight = 22
      object QRDBText1: TQRDBText
        Left = 3
        Top = 2
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          5.291666666666667000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPlanoContas
        DataField = 'CLASSIFICACAO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 100
        Top = 2
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          264.583333333333300000
          5.291666666666667000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPlanoContas
        DataField = 'CODIGO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 150
        Top = 2
        Width = 119
        Height = 15
        Size.Values = (
          39.687500000000000000
          396.875000000000000000
          5.291666666666667000
          314.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPlanoContas
        DataField = 'NOME'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 272
        Top = 2
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          719.666666666666800000
          5.291666666666667000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPlanoContas
        DataField = 'ANALITICO_SINTETICO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 353
        Top = 2
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          933.979166666666800000
          5.291666666666667000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPlanoContas
        DataField = 'DEVEDORA_CREDORA'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 434
        Top = 2
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          1148.291666666667000000
          5.291666666666667000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPlanoContas
        DataField = 'FLUXOCAIXA'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 486
        Top = 2
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          1285.875000000000000000
          5.291666666666667000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPlanoContas
        DataField = 'TIPO_APRD'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 535
        Top = 2
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          1415.520833333333000000
          5.291666666666667000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPlanoContas
        DataField = 'FIXA_VARIAVEL'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 664
        Top = 2
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          1756.833333333333000000
          5.291666666666667000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPlanoContas
        DataField = 'ATIVO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 593
        Top = 2
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          1568.979166666667000000
          5.291666666666667000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsPlanoContas
        DataField = 'MOVIMENTA_ESTOQUE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 246
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 246
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
        Top = 41
        Width = 932
        Size.Values = (
          2.645833333333333000
          298.979166666666700000
          108.479166666666700000
          2465.916666666667000000)
        ExplicitLeft = 113
        ExplicitTop = 41
        ExplicitWidth = 932
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
      Top = 229
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 229
      ExplicitHeight = 17
      inherited qrQuantidadeRegistros: TQRLabel
        Size.Values = (
          34.395833333333340000
          1611.312500000000000000
          50.270833333333330000
          230.187500000000000000)
        FontSize = 7
      end
    end
    inherited rbColumnHeader: TQRBand
      Height = 34
      Size.Values = (
        89.958333333333340000
        1899.708333333333000000)
      ExplicitHeight = 34
      object QRLabel1: TQRLabel
        Left = 3
        Top = 0
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          0.000000000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Classifica'#231#227'o'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 100
        Top = 0
        Width = 42
        Height = 15
        Size.Values = (
          39.687500000000000000
          264.583333333333300000
          0.000000000000000000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 150
        Top = 0
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          396.875000000000000000
          0.000000000000000000
          298.979166666666700000)
        XLColumn = 0
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
        Left = 272
        Top = 0
        Width = 73
        Height = 29
        Size.Values = (
          76.729166666666680000
          719.666666666666800000
          0.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Anal'#237'tica / Sint'#233'tica'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 352
        Top = 0
        Width = 76
        Height = 29
        Size.Values = (
          76.729166666666680000
          931.333333333333200000
          0.000000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Devedora / Credora'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 433
        Top = 0
        Width = 52
        Height = 29
        Size.Values = (
          76.729166666666680000
          1145.645833333333000000
          0.000000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Fluxo de caixa'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 489
        Top = 0
        Width = 41
        Height = 29
        Size.Values = (
          76.729166666666680000
          1293.812500000000000000
          0.000000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Tipo'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 535
        Top = 0
        Width = 61
        Height = 29
        Size.Values = (
          76.729166666666680000
          1415.520833333333000000
          0.000000000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Fixa / Vari'#225'vel'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 664
        Top = 0
        Width = 44
        Height = 29
        Size.Values = (
          76.729166666666680000
          1756.833333333333000000
          0.000000000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Status'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 593
        Top = 0
        Width = 61
        Height = 29
        Size.Values = (
          76.729166666666680000
          1568.979166666667000000
          0.000000000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Movimenta estoque'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object cdsPlanoContas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPlanoContas'
    Left = 256
    Top = 3
    object cdsPlanoContasKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      Required = True
      FixedChar = True
    end
    object cdsPlanoContasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsPlanoContasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPlanoContasCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Required = True
      OnGetText = cdsPlanoContasCLASSIFICACAOGetText
      Size = 32
    end
    object cdsPlanoContasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object cdsPlanoContasATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      OnGetText = cdsPlanoContasATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasANALITICO_SINTETICO: TStringField
      FieldName = 'ANALITICO_SINTETICO'
      Required = True
      OnGetText = cdsPlanoContasANALITICO_SINTETICOGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasDEVEDORA_CREDORA: TStringField
      FieldName = 'DEVEDORA_CREDORA'
      Required = True
      OnGetText = cdsPlanoContasDEVEDORA_CREDORAGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasFLUXOCAIXA: TStringField
      FieldName = 'FLUXOCAIXA'
      Required = True
      OnGetText = cdsPlanoContasFLUXOCAIXAGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasTIPO_APRD: TStringField
      FieldName = 'TIPO_APRD'
      Required = True
      OnGetText = cdsPlanoContasTIPO_APRDGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasFIXA_VARIAVEL: TStringField
      FieldName = 'FIXA_VARIAVEL'
      Required = True
      OnGetText = cdsPlanoContasFIXA_VARIAVELGetText
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasKMFIN_PLANOCONTA: TStringField
      FieldName = 'KMFIN_PLANOCONTA'
      FixedChar = True
    end
    object cdsPlanoContasKDEF_PLANOCONTA: TStringField
      FieldName = 'KDEF_PLANOCONTA'
      FixedChar = True
    end
    object cdsPlanoContasMOVIMENTA_ESTOQUE: TStringField
      FieldName = 'MOVIMENTA_ESTOQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspPlanoContas: TDataSetProvider
    DataSet = sqlPlanoContas
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 208
    Top = 48
  end
  object sqlPlanoContas: TTcSQLDataSet
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
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      ' KFIN_PLANOCONTA, '
      ' KSYS$DOMAIN, '
      ' CODIGO,'
      ' CLASSIFICACAO,'
      ' NOME, '
      ' ATIVO,'
      ' ANALITICO_SINTETICO, '
      ' DEVEDORA_CREDORA, '
      ' FLUXOCAIXA, '
      ' TIPO_APRD, '
      ' FIXA_VARIAVEL,'
      ' MOVIMENTA_ESTOQUE,'
      ' KMFIN_PLANOCONTA,'
      ' KDEF_PLANOCONTA'
      'FROM FIN_PLANOCONTAS'
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND ( CLASSIFICACAO LIKE (:PLANO || '#39'.%'#39' )'
      '        OR ( CLASSIFICACAO = :PLANO )'
      '       )'
      'ORDER BY CLASSIFICACAO')
    Left = 246
    Top = 95
    object sqlPlanoContasKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      Required = True
      FixedChar = True
    end
    object sqlPlanoContasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlPlanoContasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlPlanoContasCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Required = True
      Size = 32
    end
    object sqlPlanoContasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object sqlPlanoContasATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasANALITICO_SINTETICO: TStringField
      FieldName = 'ANALITICO_SINTETICO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasDEVEDORA_CREDORA: TStringField
      FieldName = 'DEVEDORA_CREDORA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasFLUXOCAIXA: TStringField
      FieldName = 'FLUXOCAIXA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasTIPO_APRD: TStringField
      FieldName = 'TIPO_APRD'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasFIXA_VARIAVEL: TStringField
      FieldName = 'FIXA_VARIAVEL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasKMFIN_PLANOCONTA: TStringField
      FieldName = 'KMFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlPlanoContasKDEF_PLANOCONTA: TStringField
      FieldName = 'KDEF_PLANOCONTA'
      FixedChar = True
    end
    object sqlPlanoContasMOVIMENTA_ESTOQUE: TStringField
      FieldName = 'MOVIMENTA_ESTOQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
