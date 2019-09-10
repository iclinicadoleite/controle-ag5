inherited Zoo_RelatorioInventario: TZoo_RelatorioInventario
  Left = 633
  Top = 176
  Caption = 'Relat'#243'rio - Invent'#225'rio'
  ClientHeight = 376
  ClientWidth = 736
  ExplicitWidth = 742
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 736
    Height = 376
    ExplicitWidth = 736
    ExplicitHeight = 376
    inherited _pnlFooter: TJvPanel
      Top = 345
      Width = 732
      ExplicitTop = 345
      ExplicitWidth = 732
      inherited _imageBottom: TImage
        Width = 732
        ExplicitWidth = 732
      end
      inherited _btbPrior: TTcGDIButton
        Left = 541
        ExplicitLeft = 541
      end
      inherited _btbNext: TTcGDIButton
        Left = 632
        ExplicitLeft = 632
      end
      inherited _btbExecute: TTcGDIButton
        Left = 647
        Caption = 'V&isualizar'
        ExplicitLeft = 647
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 732
      Height = 343
      ExplicitWidth = 732
      ExplicitHeight = 343
      inherited PageControl: TJvPageControl
        Width = 732
        Height = 343
        ActivePage = TabSheet1
        ExplicitWidth = 732
        ExplicitHeight = 343
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 732
            Height = 320
            Align = alClient
            TabOrder = 0
            object DBGridResultados: TJvDBUltimGrid
              Left = 2
              Top = 15
              Width = 728
              Height = 276
              Align = alClient
              DataSource = dtsInventario
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnDblClick = DBGridResultadosDblClick
              AutoAppend = False
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
            end
            object Panel3: TPanel
              Left = 2
              Top = 291
              Width = 728
              Height = 27
              Align = alBottom
              Caption = ' '
              Color = clSilver
              ParentBackground = False
              TabOrder = 1
              object lblTotalLinhas: TLabel
                Left = 16
                Top = 7
                Width = 64
                Height = 13
                Caption = 'lblTotalLinhas'
              end
            end
          end
        end
      end
    end
  end
  object dtsInventario: TDataSource
    DataSet = cdsInventario
    Left = 289
    Top = 64
  end
  object dspInventario: TDataSetProvider
    DataSet = sqlInventario
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 212
    Top = 153
  end
  object sqlInventario: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'SELECT * FROM ZOO_INVENTARIO_SUMMARY ;')
    Left = 242
    Top = 200
    object sqlInventarioSUMMARY_TYPE: TIntegerField
      FieldName = 'SUMMARY_TYPE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlInventarioKZOO_CFGCATEGORIA: TStringField
      FieldName = 'KZOO_CFGCATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object sqlInventarioDESCRICAO: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'DESCRICAO'
      Size = 128
    end
    object sqlInventarioSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
    object sqlInventarioIDADE_INFERIOR: TIntegerField
      DisplayLabel = 'Idade inferior (dias)'
      FieldName = 'IDADE_INFERIOR'
    end
    object sqlInventarioIDADE_SUPERIOR: TIntegerField
      DisplayLabel = 'Idade superiror (dias)'
      FieldName = 'IDADE_SUPERIOR'
    end
    object sqlInventarioNL_INFERIOR: TIntegerField
      DisplayLabel = 'NL inferior'
      FieldName = 'NL_INFERIOR'
    end
    object sqlInventarioNL_SUPERIOR: TIntegerField
      DisplayLabel = 'NL superior'
      FieldName = 'NL_SUPERIOR'
    end
    object sqlInventarioDEL_INFERIOR: TIntegerField
      DisplayLabel = 'DEL inferior'
      FieldName = 'DEL_INFERIOR'
    end
    object sqlInventarioDEL_SUPERIOR: TIntegerField
      DisplayLabel = 'DEL superior'
      FieldName = 'DEL_SUPERIOR'
    end
    object sqlInventarioITEMCOUNT: TIntegerField
      DisplayLabel = 'Qtde'
      FieldName = 'ITEMCOUNT'
    end
    object sqlInventarioREPEAT: TStringField
      DisplayLabel = 'Repete'
      FieldName = 'REPEAT'
      FixedChar = True
      Size = 1
    end
  end
  object cdsInventario: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SUMMARY_TYPE'
        DataType = ftInteger
      end
      item
        Name = 'KZOO_CFGCATEGORIA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'STATUS'
        DataType = ftInteger
      end
      item
        Name = 'IDADE_INFERIOR'
        DataType = ftInteger
      end
      item
        Name = 'IDADE_SUPERIOR'
        DataType = ftInteger
      end
      item
        Name = 'NL_INFERIOR'
        DataType = ftInteger
      end
      item
        Name = 'NL_SUPERIOR'
        DataType = ftInteger
      end
      item
        Name = 'DEL_INFERIOR'
        DataType = ftInteger
      end
      item
        Name = 'DEL_SUPERIOR'
        DataType = ftInteger
      end
      item
        Name = 'ITEMCOUNT'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'REPEAT'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspInventario'
    StoreDefs = True
    BeforeOpen = cdsInventarioBeforeOpen
    Left = 245
    Top = 107
    object cdsInventarioSUMMARY_TYPE: TIntegerField
      FieldName = 'SUMMARY_TYPE'
      Visible = False
    end
    object cdsInventarioKZOO_CFGCATEGORIA: TStringField
      FieldName = 'KZOO_CFGCATEGORIA'
      Visible = False
      FixedChar = True
    end
    object cdsInventarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      OnGetText = cdsInventarioDESCRICAOGetText
      Size = 128
    end
    object cdsInventarioSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Visible = False
    end
    object cdsInventarioDESCR_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusAnimal
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 30
      Lookup = True
    end
    object cdsInventarioIDADE_INFERIOR: TIntegerField
      FieldName = 'IDADE_INFERIOR'
    end
    object cdsInventarioIDADE_SUPERIOR: TIntegerField
      FieldName = 'IDADE_SUPERIOR'
    end
    object cdsInventarioNL_INFERIOR: TIntegerField
      FieldName = 'NL_INFERIOR'
    end
    object cdsInventarioNL_SUPERIOR: TIntegerField
      FieldName = 'NL_SUPERIOR'
    end
    object cdsInventarioDEL_INFERIOR: TIntegerField
      FieldName = 'DEL_INFERIOR'
    end
    object cdsInventarioDEL_SUPERIOR: TIntegerField
      FieldName = 'DEL_SUPERIOR'
    end
    object cdsInventarioITEMCOUNT: TIntegerField
      FieldName = 'ITEMCOUNT'
    end
    object cdsInventarioREPEAT: TStringField
      FieldName = 'REPEAT'
      OnGetText = cdsInventarioREPEATGetText
      FixedChar = True
      Size = 1
    end
  end
  object cdsStatusAnimal: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 384
    Top = 112
    object cdsStatusAnimalTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
