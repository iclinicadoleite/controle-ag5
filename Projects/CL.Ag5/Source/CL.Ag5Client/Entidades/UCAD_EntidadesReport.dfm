inherited qrCAD_EntidadesReport: TqrCAD_EntidadesReport
  Left = 337
  Top = 113
  Caption = 'Lista de Entidades'
  ClientHeight = 643
  ClientWidth = 791
  ExplicitWidth = 807
  ExplicitHeight = 682
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = 2
    Top = 0
    DataSet = cdsEntidade
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
    ExplicitLeft = 2
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
      Frame.Color = 15724527
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
      Height = 62
      Frame.DrawTop = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psSolid
      BeforePrint = rbDetailBeforePrint
      Size.Values = (
        164.041666666666700000
        1899.708333333333000000)
      ExplicitTop = 190
      ExplicitHeight = 62
      object QRLabel1: TQRLabel
        Left = 9
        Top = 6
        Width = 37
        Height = 15
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          15.875000000000000000
          97.895833333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Codigo:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 111
        Top = 6
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          293.687500000000000000
          15.875000000000000000
          174.625000000000000000)
        XLColumn = 3
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Raz'#227'o social:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 9
        Top = 25
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          66.145833333333340000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nome fantasia:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 51
        Top = 6
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          134.937500000000000000
          15.875000000000000000
          108.479166666666700000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsEntidade
        DataField = 'CODIGO'
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 182
        Top = 6
        Width = 416
        Height = 15
        Size.Values = (
          39.687500000000000000
          481.541666666666700000
          15.875000000000000000
          1100.666666666667000000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEntidade
        DataField = 'NOME'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 90
        Top = 25
        Width = 249
        Height = 15
        Size.Values = (
          39.687500000000000000
          238.125000000000000000
          66.145833333333320000
          658.812500000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEntidade
        DataField = 'APELIDO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrlGrupo: TQRLabel
        Left = 417
        Top = 42
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1103.312500000000000000
          111.125000000000000000
          89.958333333333340000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Grupo:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrDBGrupo: TQRDBText
        Left = 457
        Top = 42
        Width = 153
        Height = 15
        Size.Values = (
          39.687500000000000000
          1209.145833333333000000
          111.125000000000000000
          404.812500000000000000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEntidade
        DataField = 'GRUPO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 451
        Top = 25
        Width = 143
        Height = 15
        Size.Values = (
          39.687500000000000000
          1193.270833333333000000
          66.145833333333320000
          378.354166666666700000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEntidade
        DataField = 'CPF_CNPJ'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 417
        Top = 25
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          1103.312500000000000000
          66.145833333333340000
          76.729166666666680000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 652
        Top = 6
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          15.875000000000000000
          161.395833333333300000)
        XLColumn = 8
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEntidade
        DataField = 'ATIVO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 611
        Top = 6
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          1616.604166666667000000
          15.875000000000000000
          92.604166666666680000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 51
        Top = 42
        Width = 121
        Height = 15
        Size.Values = (
          39.687500000000000000
          134.937500000000000000
          111.125000000000000000
          320.145833333333300000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEntidade
        DataField = 'FONE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 9
        Top = 42
        Width = 28
        Height = 15
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          111.125000000000000000
          74.083333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fone:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRHRule2: TQRHRule
        Left = 0
        Top = -3
        Width = 718
        Height = 5
        Size.Values = (
          13.229166666666670000
          0.000000000000000000
          -7.937500000000000000
          1899.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        VertAdjust = 0
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 314
      Height = 72
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 314
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
          34.395833333333330000
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
      Top = 297
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 297
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
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitHeight = 17
    end
    object qrsEnderecos: TQRSubDetail
      Left = 38
      Top = 252
      Width = 718
      Height = 45
      Frame.Color = 15724527
      Frame.DrawTop = True
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        119.062500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep
      DataSet = cdsEndereco
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel3: TQRLabel
        Left = 9
        Top = 3
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          7.937500000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endereco:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 61
        Top = 3
        Width = 375
        Height = 17
        Size.Values = (
          44.979166666666670000
          161.395833333333300000
          7.937500000000000000
          992.187500000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEndereco
        DataField = 'ENDERECO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 442
        Top = 3
        Width = 20
        Height = 17
        Size.Values = (
          44.979166666666670000
          1169.458333333333000000
          7.937500000000000000
          52.916666666666670000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 466
        Top = 3
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          1232.958333333333000000
          7.937500000000000000
          89.958333333333320000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEndereco
        DataField = 'NUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptNumeric
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 9
        Top = 24
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          63.500000000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bairro:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 45
        Top = 24
        Width = 222
        Height = 17
        Size.Values = (
          44.979166666666670000
          119.062500000000000000
          63.500000000000000000
          587.375000000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEndereco
        DataField = 'BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 508
        Top = 3
        Width = 37
        Height = 17
        Size.Values = (
          44.979166666666670000
          1344.083333333333000000
          7.937500000000000000
          97.895833333333340000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cidade:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 546
        Top = 3
        Width = 122
        Height = 17
        Size.Values = (
          44.979166666666670000
          1444.625000000000000000
          7.937500000000000000
          322.791666666666700000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEndereco
        DataField = 'CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 298
        Top = 24
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          788.458333333333200000
          63.500000000000000000
          164.041666666666700000)
        XLColumn = 5
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEndereco
        DataField = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 273
        Top = 24
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          722.312500000000000000
          63.500000000000000000
          60.854166666666680000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cep:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 674
        Top = 3
        Width = 17
        Height = 17
        Size.Values = (
          44.979166666666670000
          1783.291666666667000000
          7.937500000000000000
          44.979166666666670000)
        XLColumn = 8
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'UF:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 695
        Top = 3
        Width = 18
        Height = 17
        Size.Values = (
          44.979166666666670000
          1838.854166666667000000
          7.937500000000000000
          47.625000000000000000)
        XLColumn = 9
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEndereco
        DataField = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText15: TQRDBText
        Left = 409
        Top = 24
        Width = 164
        Height = 17
        Size.Values = (
          44.979166666666670000
          1082.145833333333000000
          63.500000000000000000
          433.916666666666700000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEndereco
        DataField = 'CONTATO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 367
        Top = 24
        Width = 41
        Height = 17
        Size.Values = (
          44.979166666666670000
          971.020833333333400000
          63.500000000000000000
          108.479166666666700000)
        XLColumn = 6
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contato:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 579
        Top = 24
        Width = 28
        Height = 17
        Size.Values = (
          44.979166666666670000
          1531.937500000000000000
          63.500000000000000000
          74.083333333333340000)
        XLColumn = 8
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fone:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText16: TQRDBText
        Left = 609
        Top = 24
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          1611.312500000000000000
          63.500000000000000000
          275.166666666666700000)
        XLColumn = 9
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsEndereco
        DataField = 'FONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
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
  end
  object dspEntidade: TDataSetProvider
    DataSet = sqlEntidade
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 171
    Top = 48
  end
  object dtsEntidades: TDataSource
    DataSet = sqlEntidade
    Left = 251
    Top = 113
  end
  object cdsEntidade: TClientDataSet
    Aggregates = <>
    Constraints = <
      item
        CustomConstraint = 'NOME <> '#39#39
        ErrorMessage = 'O campo '#39'Nome / Raz'#227'o Social'#39' deve ser preenchido'
        FromDictionary = False
      end
      item
        CustomConstraint = 
          'CPF_CNPJ <> '#39#39' AND CPF_CNPJ <> '#39'   .   .   -  '#39' AND CPF_CNPJ <> ' +
          #39'___.___.___-__'#39
        ErrorMessage = 'O Campo '#39'CPF'#39' deve Ser preenchido'
        FromDictionary = False
      end
      item
        CustomConstraint = 
          'CPF_CNPJ <> '#39#39' AND CPF_CNPJ <> '#39'  .   .   /    -  '#39' AND CPF_CNPJ' +
          ' <> '#39'__.___.___/____-__'#39
        ErrorMessage = 'O campo '#39'CNPJ'#39' deve ser preenchido'
        FromDictionary = False
      end>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'ALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'POR_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'GRUPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspEntidade'
    Left = 205
    Top = 5
    object cdsEntidadeKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsEntidadeCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsEntidadeATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      OnGetText = cdsEntidadeATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsEntidadeAPELIDO: TStringField
      FieldName = 'APELIDO'
      Required = True
      Size = 128
    end
    object cdsEntidadeNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsEntidadeCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 18
    end
    object cdsEntidadePESSOA: TStringField
      FieldName = 'PESSOA'
      Required = True
      OnGetText = cdsEntidadePESSOAGetText
      FixedChar = True
      Size = 1
    end
    object cdsEntidadeGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 128
    end
    object cdsEntidadeFONE: TStringField
      FieldName = 'FONE'
      Size = 18
    end
    object cdsEntidadeFAX: TStringField
      FieldName = 'FAX'
      Size = 18
    end
    object cdsEntidadeKENDERECO: TStringField
      FieldName = 'KENDERECO'
      FixedChar = True
    end
    object cdsEntidadesqlEndereco: TDataSetField
      FieldName = 'sqlEndereco'
    end
  end
  object cdsEndereco: TClientDataSet
    Aggregates = <>
    DataSetField = cdsEntidadesqlEndereco
    Params = <>
    Left = 302
    Top = 5
    object cdsEnderecoKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsEnderecoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 128
    end
    object cdsEnderecoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object cdsEnderecoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 64
    end
    object cdsEnderecoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 64
    end
    object cdsEnderecoCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99999\-999;1;_'
      FixedChar = True
      Size = 9
    end
    object cdsEnderecoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 64
    end
    object cdsEnderecoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsEnderecoCXPOSTAL: TStringField
      FieldName = 'CXPOSTAL'
      Size = 16
    end
    object cdsEnderecoCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 32
    end
    object cdsEnderecoFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      EditMask = '(99) 9999-9999'
      Size = 18
    end
  end
  object sqlEntidade: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'ALL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'POR_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'GRUPO'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT  '
      '  E.KCAD_ENTIDADE,'
      '  E.CODIGO, '
      '  E.ATIVO, '
      '  E.APELIDO, '
      '  E.NOME,'
      '  E.CPF_CNPJ,'
      '  E.PESSOA,'
      '  T.DESCRICAO GRUPO,'
      '  E.FONE,'
      '  E.FAX,'
      '  E.KENDERECO'
      'FROM CAD_ENTIDADES E'
      'LEFT JOIN CAD_TIPOS T ON T.KCAD_TIPOS = E.GRUPO_CLIENTE'
      'WHERE ( (:ALL = '#39'T'#39' ) OR ( E.KCAD_ENTIDADE = :KCAD_ENTIDADE ) )'
      '  AND ( :DSP_INATIVO = '#39'T'#39' OR E.ATIVO = '#39'T'#39' )'
      '  AND (    ( :DSP_CLIENTE    = '#39'T'#39' AND E.IS_CLIENTE    = '#39'T'#39' )'
      '        OR ( :DSP_FORNECEDOR = '#39'T'#39' AND E.IS_FORNECEDOR = '#39'T'#39' )'
      '       )'
      '  AND ( ( :POR_GRUPO = '#39'F'#39' ) OR ( E.GRUPO_CLIENTE = :GRUPO ) )'
      'ORDER BY E.GRUPO_CLIENTE')
    Left = 207
    Top = 89
    object sqlEntidadeKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlEntidadeCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlEntidadeATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEntidadeAPELIDO: TStringField
      FieldName = 'APELIDO'
      Required = True
      Size = 128
    end
    object sqlEntidadeNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlEntidadeCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 18
    end
    object sqlEntidadePESSOA: TStringField
      FieldName = 'PESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEntidadeGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 128
    end
    object sqlEntidadeFONE: TStringField
      FieldName = 'FONE'
      Size = 18
    end
    object sqlEntidadeFAX: TStringField
      FieldName = 'FAX'
      Size = 18
    end
    object sqlEntidadeKENDERECO: TStringField
      FieldName = 'KENDERECO'
      FixedChar = True
    end
  end
  object sqlEndereco: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsEntidades
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT '
      '  KGLB_ENDERECO,'
      '  ENDERECO,'
      '  NUMERO,'
      '  COMPLEMENTO,'
      '  BAIRRO,'
      '  CEP,'
      '  CIDADE,'
      '  UF,'
      '  CXPOSTAL,'
      '  CONTATO,'
      '  FONE'
      'FROM GLB_ENDERECOS'
      'WHERE TABLENAME = '#39'CAD_ENTIDADES'#39
      '  AND TABLEKEY = :KCAD_ENTIDADE')
    Left = 297
    Top = 87
    object sqlEnderecoKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlEnderecoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 128
    end
    object sqlEnderecoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object sqlEnderecoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 64
    end
    object sqlEnderecoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 64
    end
    object sqlEnderecoCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object sqlEnderecoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 64
    end
    object sqlEnderecoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sqlEnderecoCXPOSTAL: TStringField
      FieldName = 'CXPOSTAL'
      Size = 16
    end
    object sqlEnderecoCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 32
    end
    object sqlEnderecoFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Size = 18
    end
  end
end
