inherited EST_ServicosReport: TEST_ServicosReport
  Left = 289
  Top = 122
  Caption = 'Rela'#231#227'o de Servi'#231'os'
  ClientWidth = 1122
  ExplicitWidth = 1138
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    Left = 4
    Top = 0
    Width = 1123
    Height = 794
    DataSet = cdsServico
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
    ExplicitLeft = 4
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
        Width = 1040
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          195.791666666666700000
          2751.666666666667000000)
        ExplicitLeft = 3
        ExplicitTop = 74
        ExplicitWidth = 1040
      end
      inherited QRImageDomain: TQRImage
        Left = 894
        Top = 4
        Size.Values = (
          156.104166666666700000
          2365.375000000000000000
          10.583333333333330000
          391.583333333333400000)
        ExplicitLeft = 894
        ExplicitTop = 4
      end
    end
    inherited rbDetail: TQRBand
      Top = 194
      Width = 1047
      Height = 21
      Size.Values = (
        55.562500000000000000
        2770.187500000000000000)
      ExplicitTop = 194
      ExplicitWidth = 1047
      ExplicitHeight = 21
      object QRDBText1: TQRDBText
        Left = 3
        Top = 2
        Width = 42
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          5.291666666666667000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsServico
        DataField = 'CODIGO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 47
        Top = 2
        Width = 405
        Height = 15
        Size.Values = (
          39.687500000000000000
          124.354166666666700000
          5.291666666666667000
          1071.562500000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsServico
        DataField = 'NOME'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 456
        Top = 2
        Width = 349
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          5.291666666666667000
          923.395833333333200000)
        XLColumn = 4
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsServico
        DataField = 'DESCRICAO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 809
        Top = 2
        Width = 178
        Height = 15
        Size.Values = (
          39.687500000000000000
          2140.479166666667000000
          5.291666666666667000
          470.958333333333300000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsServico
        DataField = 'ULTIMO_FORNECEDOR'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 990
        Top = 2
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          2619.375000000000000000
          5.291666666666667000
          142.875000000000000000)
        XLColumn = 9
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsServico
        DataField = 'UNIDADE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    inherited rbPageFooter: TQRBand
      Top = 232
      Width = 1047
      Height = 72
      Size.Values = (
        190.500000000000000000
        2770.187500000000000000)
      ExplicitTop = 232
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
        Width = 930
        Size.Values = (
          2.645833333333333000
          298.979166666666700000
          111.125000000000000000
          2460.625000000000000000)
        ExplicitLeft = 113
        ExplicitTop = 42
        ExplicitWidth = 930
      end
      inherited QRLabelFooterSeparator: TQRLabel
        Left = 100
        Size.Values = (
          34.395833333333340000
          264.583333333333400000
          89.958333333333340000
          534.458333333333400000)
        FontSize = 7
        ExplicitLeft = 100
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
      Top = 215
      Width = 1047
      Height = 17
      Size.Values = (
        44.979166666666670000
        2770.187500000000000000)
      ExplicitTop = 215
      ExplicitWidth = 1047
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
      Width = 1047
      Height = 21
      Size.Values = (
        55.562500000000000000
        2770.187500000000000000)
      ExplicitWidth = 1047
      ExplicitHeight = 21
      object QRLabel6: TQRLabel
        Left = 3
        Top = 1
        Width = 42
        Height = 16
        Size.Values = (
          42.333333333333330000
          7.937500000000000000
          2.645833333333333000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'C'#243'digo'
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
        Left = 47
        Top = 1
        Width = 405
        Height = 16
        Size.Values = (
          42.333333333333330000
          124.354166666666700000
          2.645833333333333000
          1071.562500000000000000)
        XLColumn = 1
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Nome'
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
        Left = 456
        Top = 1
        Width = 349
        Height = 16
        Size.Values = (
          42.333333333333330000
          1206.500000000000000000
          2.645833333333333000
          923.395833333333200000)
        XLColumn = 4
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
      object QRLabel9: TQRLabel
        Left = 809
        Top = 1
        Width = 178
        Height = 16
        Size.Values = (
          42.333333333333330000
          2140.479166666667000000
          2.645833333333333000
          470.958333333333300000)
        XLColumn = 7
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = #218'ltimo fornecedor'
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
        Left = 990
        Top = 1
        Width = 54
        Height = 16
        Size.Values = (
          42.333333333333330000
          2619.375000000000000000
          2.645833333333333000
          142.875000000000000000)
        XLColumn = 9
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Unidade'
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
  object cdsServico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IS_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IS_INSUMO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IS_SERVICO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end>
    ProviderName = 'dspServico'
    Left = 219
    Top = 3
    object cdsServicoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsServicoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsServicoDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsServicoULTIMO_FORNECEDOR: TStringField
      FieldName = 'ULTIMO_FORNECEDOR'
      Size = 128
    end
    object cdsServicoQTDE_PRODUTO: TFloatField
      FieldName = 'QTDE_PRODUTO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsServicoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsServicoCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
      Required = True
      DisplayFormat = 'R$ #,0.00'
    end
    object cdsServicoTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
      DisplayFormat = 'R$ #,0.00'
    end
    object cdsServicoBAIXA_ESTOQUE: TStringField
      FieldName = 'BAIXA_ESTOQUE'
      OnGetText = cdsServicoBAIXA_ESTOQUEGetText
      FixedChar = True
      Size = 1
    end
    object cdsServicoQTDE_MINIMA: TFloatField
      FieldName = 'QTDE_MINIMA'
    end
  end
  object dspServico: TDataSetProvider
    DataSet = sqlServico
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 46
  end
  object sqlServico: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IS_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IS_INSUMO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IS_SERVICO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT '
      '  P.CODIGO,'
      '  P.NOME,'
      '  P.DESCRICAO,'
      
        '  (  SELECT COALESCE ( OES.NOMEENTIDADE, CP.NOMEENTIDADE ) NOMEE' +
        'NTIDADE'
      '     FROM EST_MOVIMENTO M'
      
        '     LEFT JOIN CMP_PEDIDO_ITENS           CPI ON M.TABLENAME = '#39 +
        'CMP_PEDIDO_ITENS'#39' AND CPI.KCMP_PEDIDO_ITEM = M.TABLEKEY'
      
        '     LEFT JOIN CMP_PEDIDOS                CP  ON CP.KCMP_PEDIDO ' +
        '= CPI.KCMP_PEDIDO'
      
        '     LEFT JOIN EST_OUTRAS_ENTRADAS_SAIDAS OES ON OES.KEST_PRODUT' +
        'O = M.KEST_PRODUTO AND OES.KEST_OUTRA_ENTRADA_SAIDA = M.TABLEKEY'
      '     WHERE M.KEST_PRODUTO = P.KEST_PRODUTO AND M.TIPO = '#39'E'#39
      '     ORDER BY M.DATA DESC'
      '     ROWS 1'
      '   ) ULTIMO_FORNECEDOR,'
      '  P.QTDE_PRODUTO,'
      '  P.UNIDADE,'
      '  P.CUSTO_MEDIO,'
      '  (P.QTDE_PRODUTO*P.CUSTO_MEDIO) TOTAL,'
      '  P.BAIXA_ESTOQUE,'
      '  P.QTDE_MINIMA'
      'FROM EST_PRODUTOS P'
      'WHERE P.KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND (    (:IS_PRODUTO = '#39'T'#39' AND P.PRODUTO_INSUMO_SERVICO = 1 )'
      '        OR (:IS_INSUMO  = '#39'T'#39' AND P.PRODUTO_INSUMO_SERVICO = 2 )'
      '        OR (:IS_SERVICO = '#39'T'#39' AND P.PRODUTO_INSUMO_SERVICO = 3 )'
      '       )'
      '  AND ( :DSP_INATIVO = '#39'T'#39' OR ( P.ATIVO = '#39'T'#39' ) )')
    Left = 224
    Top = 90
    object sqlServicoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlServicoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlServicoDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlServicoULTIMO_FORNECEDOR: TStringField
      FieldName = 'ULTIMO_FORNECEDOR'
      Size = 128
    end
    object sqlServicoQTDE_PRODUTO: TFloatField
      FieldName = 'QTDE_PRODUTO'
      Required = True
    end
    object sqlServicoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlServicoCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
      Required = True
    end
    object sqlServicoTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
    end
    object sqlServicoBAIXA_ESTOQUE: TStringField
      FieldName = 'BAIXA_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sqlServicoQTDE_MINIMA: TFloatField
      FieldName = 'QTDE_MINIMA'
    end
  end
end
