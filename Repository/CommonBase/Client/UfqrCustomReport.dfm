inherited fqrCustomReport: TfqrCustomReport
  Left = 762
  Top = 48
  Caption = 'fqrCustomReport'
  ExplicitLeft = 762
  ExplicitTop = 48
  ExplicitWidth = 812
  ExplicitHeight = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited QuickRep: TQuickRep
    DataSet = cdsMaster
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
    inherited rbPageHeader: TQRBand
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      inherited _qrsDateTime: TQRSysData
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          0.000000000000000000
          322.791666666666700000)
        FontSize = 9
      end
      inherited _qrsPageNumber: TQRSysData
        Size.Values = (
          42.333333333333330000
          1661.583333333333000000
          0.000000000000000000
          238.125000000000000000)
        FontSize = 9
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
        Top = 92
        Size.Values = (
          42.333333333333330000
          1661.583333333333000000
          243.416666666666700000
          238.125000000000000000)
        FontSize = 9
        ExplicitTop = 92
      end
      inherited _qrImageLogo: TQRImage
        Size.Values = (
          185.208333333333300000
          10.583333333333330000
          7.937500000000000000
          254.000000000000000000)
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
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          198.437500000000000000
          1889.125000000000000000)
      end
      inherited QRImageDomain: TQRImage
        Size.Values = (
          156.104166666666700000
          1492.250000000000000000
          13.229166666666670000
          391.583333333333300000)
      end
    end
    inherited rbDetail: TQRBand
      Top = 190
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 190
      ExplicitHeight = 17
    end
    inherited rbPageFooter: TQRBand
      Top = 224
      Size.Values = (
        190.500000000000000000
        1899.708333333333000000)
      ExplicitTop = 224
      inherited _qrlFooter: TQRLabel
        Size.Values = (
          34.395833333333330000
          0.000000000000000000
          0.000000000000000000
          140.229166666666700000)
        FontSize = 7
      end
      inherited LogoClinica: TQRImage
        Size.Values = (
          134.937500000000000000
          10.583333333333330000
          34.395833333333330000
          272.520833333333300000)
      end
      inherited QRShapeFooterSeparator: TQRShape
        Size.Values = (
          2.645833333333333000
          298.979166666666700000
          111.125000000000000000
          1553.104166666667000000)
      end
    end
    inherited rbSummary: TQRBand
      Top = 207
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitTop = 207
      ExplicitHeight = 17
    end
    inherited rbColumnHeader: TQRBand
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      ExplicitHeight = 17
    end
  end
  object cdsMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaster'
    Left = 256
    Top = 8
  end
  object dspMaster: TDataSetProvider
    DataSet = sqlMaster
    Options = [poIncFieldProps, poReadOnly, poDisableInserts, poDisableEdits, poDisableDeletes]
    UpdateMode = upWhereKeyOnly
    Left = 224
    Top = 32
  end
  object sqlMaster: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    Left = 254
    Top = 63
  end
  object sqlDetalhes: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsSQLMaster
    MaxBlobSize = -1
    Params = <>
    Left = 318
    Top = 63
  end
  object dtsSQLMaster: TDataSource
    DataSet = sqlMaster
    Left = 286
    Top = 79
  end
  object cdsDetalhes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 8
  end
  object scRdm: TSharedConnection
    Left = 214
    Top = 78
  end
end
