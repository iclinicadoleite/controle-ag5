inherited Zoo_BancoDadosEmbriaoForm: TZoo_BancoDadosEmbriaoForm
  Left = 343
  Top = 221
  Caption = 'Embri'#245'es'
  ClientHeight = 534
  ClientWidth = 799
  OnShow = TcMPFormShow
  ActionList.OnExecute = _ActionListExecute
  ExplicitWidth = 815
  ExplicitHeight = 573
  PixelsPerInch = 96
  TextHeight = 13
  object _PnlForm: TPanel [0]
    Left = 0
    Top = 0
    Width = 799
    Height = 469
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    Caption = ' '
    Color = clNavy
    ParentBackground = False
    TabOrder = 2
  end
  inherited _pageControl: TPageControl
    Width = 799
    Height = 469
    ActivePage = _tbsFicha
    ExplicitWidth = 799
    ExplicitHeight = 469
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 791
      ExplicitHeight = 441
      inherited _pnlSearch: TPanel
        Width = 791
        ExplicitWidth = 791
        inherited _lblPesquisas: TLabel
          Top = 12
          ExplicitTop = 12
        end
        inherited _edtSearch: TJvComboEdit
          Top = 7
          ParentFont = False
          ExplicitTop = 7
        end
      end
      inherited _pnldbgLista: TPanel
        Width = 791
        Height = 403
        ExplicitWidth = 791
        ExplicitHeight = 403
        inherited _dbgLista: TJvDBUltimGrid
          Width = 787
          Height = 399
          Constraints.MinHeight = 109
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO_EMBRIAO'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BRINCO'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMECOMPLETO'
              Title.Caption = 'Nome completo'
              Width = 226
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGISTRO'
              Title.Caption = 'Registro'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE_EMBRIAO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UI'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DI'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UU'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DU'
              Width = 70
              Visible = True
            end>
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 791
      ExplicitHeight = 441
      inherited _pnlFicha: TPanel
        Width = 791
        Height = 441
        Constraints.MinHeight = 213
        ExplicitWidth = 791
        ExplicitHeight = 441
        inherited _ScrollBoxFicha: TScrollBox
          Width = 791
          Height = 441
          AutoScroll = False
          ExplicitWidth = 791
          ExplicitHeight = 441
          inherited _pnlScroll: TPanel
            Width = 791
            Height = 441
            ExplicitWidth = 791
            ExplicitHeight = 441
            object Splitter1: TSplitter
              Left = 140
              Top = 0
              Width = 6
              Height = 441
              ExplicitLeft = 65
              ExplicitHeight = 353
            end
            object pgcMain: TJvPageControl
              Left = 146
              Top = 0
              Width = 645
              Height = 441
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ActivePage = tbsMainCadastro
              Align = alClient
              OwnerDraw = True
              Style = tsButtons
              TabOrder = 0
              OnChange = pgcMainChange
              TabPainter = JvTabDefaultPainter1
              object tbsMainCadastro: TTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Cadastro'
                object Label21: TLabel
                  Left = 8
                  Top = 12
                  Width = 40
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'C'#243'digo'
                  FocusControl = DBEdit1
                end
                object Label23: TLabel
                  Left = 8
                  Top = 47
                  Width = 33
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Nome'
                  FocusControl = DBEdit3
                end
                object DBEdit1: TDBEdit
                  Left = 58
                  Top = 9
                  Width = 115
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'CODIGO_EMBRIAO'
                  DataSource = dtsDadosEmbriao
                  TabOrder = 0
                end
                object DBEdit3: TDBEdit
                  Left = 58
                  Top = 44
                  Width = 355
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'NOMECOMPLETO'
                  DataSource = dtsFicha
                  TabOrder = 1
                end
                object GroupBox2: TGroupBox
                  Left = 426
                  Top = 88
                  Width = 223
                  Height = 117
                  Caption = 'Estoque'
                  TabOrder = 3
                  object Label3: TLabel
                    Left = 11
                    Top = 91
                    Width = 98
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Qtde em estoque'
                  end
                  object Label2: TLabel
                    Left = 11
                    Top = 20
                    Width = 63
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Qtde inicial'
                  end
                  object Label6: TLabel
                    Left = 11
                    Top = 55
                    Width = 78
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Qtde utilizada'
                  end
                  object JvDBCalcEdit1: TJvDBCalcEdit
                    Left = 121
                    Top = 88
                    Width = 81
                    Height = 21
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDE_EMBRIAO'
                    DataSource = dtsDadosEmbriao
                  end
                  object JvDBCalcEdit3: TJvDBCalcEdit
                    Left = 121
                    Top = 17
                    Width = 81
                    Height = 21
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    ShowButton = False
                    TabOrder = 0
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDEINICIAL_EMBRIAO'
                    DataSource = dtsDadosEmbriao
                  end
                  object JvDBCalcEdit4: TJvDBCalcEdit
                    Left = 121
                    Top = 52
                    Width = 81
                    Height = 21
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 1
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDEUTILIZADA_EMBRIAO'
                    DataSource = dtsDadosEmbriao
                  end
                end
                object GroupBox1: TGroupBox
                  Left = 8
                  Top = 88
                  Width = 405
                  Height = 117
                  Caption = 'Origem'
                  TabOrder = 2
                  object Label1: TLabel
                    Left = 17
                    Top = 22
                    Width = 27
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Data'
                  end
                  object Label4: TLabel
                    Left = 17
                    Top = 55
                    Width = 29
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Local'
                  end
                  object Label5: TLabel
                    Left = 17
                    Top = 89
                    Width = 100
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Pre'#231'o de Compra'
                  end
                  object JvDBCalcEdit2: TJvDBCalcEdit
                    Left = 138
                    Top = 86
                    Width = 121
                    Height = 21
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    DataField = 'PRECO_COMPRA'
                    DataSource = dtsFicha
                  end
                  object JvDBDateEdit1: TTcDBDateEdit
                    Left = 62
                    Top = 19
                    Width = 111
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Checked = False
                    DataField = 'DTORIGEM'
                    DataSource = dtsFicha
                    CheckOnExit = False
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ButtonWidth = 24
                    ParentFont = False
                    TabOrder = 0
                  end
                  object DBEdit7: TDBEdit
                    Left = 62
                    Top = 52
                    Width = 322
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DataField = 'LOCAL_ORIGEM'
                    DataSource = dtsFicha
                    TabOrder = 1
                  end
                end
                object GroupBox3: TGroupBox
                  Left = 8
                  Top = 220
                  Width = 405
                  Height = 148
                  Caption = 'Pedigree'
                  TabOrder = 4
                  object Label49: TLabel
                    Left = 10
                    Top = 39
                    Width = 17
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Pai'
                  end
                  object Label50: TLabel
                    Left = 10
                    Top = 74
                    Width = 23
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'M'#227'e'
                  end
                  object Label7: TLabel
                    Left = 276
                    Top = 14
                    Width = 92
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'GS/Composi'#231#227'o'
                  end
                  object Label29: TLabel
                    Left = 10
                    Top = 138
                    Width = 28
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Ra'#231'a'
                    FocusControl = DBLookupComboBox2
                    Visible = False
                  end
                  object Label8: TLabel
                    Left = 10
                    Top = 105
                    Width = 93
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Grau de Sangue'
                  end
                  object edPai: TJvDBComboEdit
                    Left = 52
                    Top = 36
                    Width = 200
                    Height = 21
                    Color = clWhite
                    DataField = 'NOMEPAI'
                    DataSource = dtsLinhagem
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    TabOrder = 0
                    OnButtonClick = edPaiButtonClick
                  end
                  object edMae: TJvDBComboEdit
                    Left = 52
                    Top = 70
                    Width = 200
                    Height = 21
                    Color = clWhite
                    DataField = 'NOMEMAE'
                    DataSource = dtsLinhagem
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    TabOrder = 2
                    OnButtonClick = edMaeButtonClick
                  end
                  object DBEdit6: TDBEdit
                    Left = 277
                    Top = 36
                    Width = 107
                    Height = 21
                    TabStop = False
                    DataField = 'GSR_PAI'
                    DataSource = dtsLinhagem
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object DBEdit8: TDBEdit
                    Left = 277
                    Top = 71
                    Width = 107
                    Height = 21
                    TabStop = False
                    DataField = 'GSR_MAE'
                    DataSource = dtsLinhagem
                    ReadOnly = True
                    TabOrder = 3
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 52
                    Top = 131
                    Width = 266
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DataField = 'DESCR_RACA'
                    DataSource = dtsFicha
                    TabOrder = 6
                    TabStop = False
                    Visible = False
                  end
                  object dbxGrauSangue: TDBComboBox
                    Left = 112
                    Top = 102
                    Width = 112
                    Height = 21
                    DataField = 'GRAUSANGUE'
                    DataSource = dtsFicha
                    Items.Strings = (
                      '1/1 ( 1 )'
                      '1/2 ( 50 ) '
                      '3/4 ( 25 )'
                      '7/8  ( 87 )'
                      '15/16 ( 94 )')
                    TabOrder = 4
                    OnKeyPress = dbxGrauSangueKeyPress
                  end
                  object dbEdtComposicaoRaca: TJvDBComboEdit
                    Left = 256
                    Top = 102
                    Width = 128
                    Height = 21
                    DataField = 'COMPOSICAORACA'
                    DataSource = dtsFicha
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    ReadOnly = True
                    TabOrder = 5
                    OnButtonClick = dbEdtComposicaoRacaButtonClick
                    OnKeyPress = dbEdtComposicaoRacaKeyPress
                  end
                end
              end
              object tbsPedigree: TTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Pedigree'
                ImageIndex = 4
              end
              object tbsMainReproducao: TTabSheet
                Caption = 'Hist'#243'rico de utiliza'#231#227'o'
                ImageIndex = 2
              end
            end
            object _pnldbgLista2: TPanel
              Left = 0
              Top = 0
              Width = 140
              Height = 441
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alLeft
              BevelOuter = bvNone
              BorderWidth = 1
              Caption = '_pnldbgLista2'
              Color = clSilver
              ParentBackground = False
              TabOrder = 1
              object JvDBUltimGrid4: TJvDBUltimGrid
                Left = 1
                Top = 80
                Width = 138
                Height = 360
                Align = alClient
                DataSource = dtsLista
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CODIGO_EMBRIAO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMECOMPLETO'
                    Title.Caption = 'Nome completo'
                    Width = 64
                    Visible = True
                  end>
              end
              object Panel9: TPanel
                Left = 1
                Top = 1
                Width = 138
                Height = 79
                Align = alTop
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                object Image1: TImage
                  Left = 115
                  Top = 52
                  Width = 16
                  Height = 16
                  Cursor = crHelp
                  ParentCustomHint = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object rbShowBrinco: TRadioButton
                  Left = 4
                  Top = -1
                  Width = 107
                  Height = 15
                  Caption = 'C'#243'digo'
                  Checked = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  OnClick = rbShowColumnClick
                end
                object rbShowNomeCompleto: TRadioButton
                  Left = 4
                  Top = 25
                  Width = 107
                  Height = 15
                  Caption = 'Nome completo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnClick = rbShowColumnClick
                end
                object edtQuickSearch: TJvDBSearchEdit
                  Left = 9
                  Top = 49
                  Width = 89
                  Height = 21
                  DataSource = dtsLista
                  DataField = 'CODIGO_EMBRIAO'
                  TabOrder = 2
                  Text = 'edtQuickSearch'
                  OnChange = edtQuickSearchChange
                end
              end
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 469
    Width = 799
    ExplicitTop = 469
    ExplicitWidth = 799
    inherited _imageBottom: TImage
      Width = 799
      ExplicitWidth = 799
    end
    inherited _ToolBar: TToolBar
      Left = 26
      ExplicitLeft = 26
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited ActionList: TInternalActionList
    OnExecute = _ActionListExecute
  end
  inherited dtsFicha: TDataSource
    DataSet = Zoo_BancoDadosEmbriaoDatamodule.cdsAnimal
  end
  inherited dtsLista: TDataSource
    DataSet = Zoo_BancoDadosEmbriaoDatamodule.cdsLstEmbrioes
    OnDataChange = dtsListaDataChange
  end
  inherited ToolBarIcons: TImageListProvider
    Left = 708
    Top = 54
  end
  object dtsDadosEmbriao: TDataSource
    DataSet = Zoo_BancoDadosEmbriaoDatamodule.cdsDadosEmbriao
    Left = 620
    Top = 24
  end
  object dtsLinhagem: TDataSource
    DataSet = Zoo_BancoDadosEmbriaoDatamodule.cdsLinhagem
    Left = 414
    Top = 54
  end
  object JvTabDefaultPainter1: TJvTabDefaultPainter
    ActiveFont.Charset = DEFAULT_CHARSET
    ActiveFont.Color = 12546560
    ActiveFont.Height = -11
    ActiveFont.Name = 'Verdana'
    ActiveFont.Style = [fsBold]
    ActiveColorTo = 15389113
    InactiveFont.Charset = DEFAULT_CHARSET
    InactiveFont.Color = clWindowText
    InactiveFont.Height = -11
    InactiveFont.Name = 'Verdana'
    InactiveFont.Style = []
    InactiveColorFrom = 15389113
    InactiveColorTo = clWhite
    DisabledFont.Charset = DEFAULT_CHARSET
    DisabledFont.Color = clGrayText
    DisabledFont.Height = -11
    DisabledFont.Name = 'Verdana'
    DisabledFont.Style = []
    DisabledColorFrom = 14145495
    DisabledColorTo = 11382189
    Left = 558
    Top = 7
  end
  object ImageList1: TImageList
    Left = 771
    Top = 32
    Bitmap = {
      494C010103000800000110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFCFCFCFFFEFEFDFFFCFDFBFFFBFCFCFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFCFDFCFFFFFFFBFFDFE6EFFFE3E7F3FFE2E7F3FFE5E7F5FFE2E6F2FFFBFE
      FDFFFFFFFBFFFAFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFDFFFFFF
      FBFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFBFEFAFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFEFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF5A79D0FF0008B7FF0013B5FF0013B6FF0011B7FF000FB3FF0126
      BAFFF5FCF9FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAFF7FB7
      EAFF60ABE9FF63ADEAFF63ACE9FF63ADE9FF62ADEAFF63ACE9FF63ACE9FF5CAD
      E9FF5EABE4FFA7D5EBFFFFFFF9FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFFCFE
      FDFFFFFFFFFFE4EFE9FF006244FFCEE4DBFFFFFFFFFFFCFEFDFFFFFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFBFDFFFFFF
      FFFF5E76CBFF0013BBFF0022BAFF0328C3FF092DBDFF072CC4FF0026BFFF001E
      B5FF0928BEFFF3F4FAFFFFFFFDFFFFFDFEFFFFFFFFFFFFFFFFFF248CE3FF007D
      F7FF007FF5FF007FF5FF0080F5FF0082FFFF0084FFFF0082FEFF0083F5FF007E
      F3FF0082F5FF0070EFFFA9D2E7FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFDFFFFFF
      FFFFE4ECEBFF036B41FF036F44FF016440FFD0E3DEFFFFFFFFFFFAFBFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFF5D78
      CDFF001DBFFF3555CBFF8CA5DDFF002CBFFF0831C6FF0025BBFF4D71CEFF808F
      DEFF0022C1FF0834B9FFF0F2F8FFFBFEFEFFFFFFFFFFFFFFFFFF0079E4FF048C
      F3FF088BF5FF088BF4FF078EFFFF1867A7FF402211FF1174BEFF0B8DFCFF0A8B
      F5FF068CF5FF0088F6FF60ACE7FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFE9EF
      EFFF006E43FF127A53FF157B59FF177C55FF026946FFCCE7DEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFF8C97DAFF0026
      C3FF002AC5FFFFFFFBFFFFFFFEFFD5DFF1FF0020C0FF6480DBFFFFFFFFFFFFFF
      FEFF4B6ED1FF002FCCFF0E38BAFFFFFFFDFFFFFFFFFFFFFFFFFF58B2EAFF0190
      FAFF0F90F4FF0F90F5FF0E94F7FF147FCCFF274657FF1984DCFF0B94FBFF1190
      F5FF0D91F5FF0087F0FFD1E8F3FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFDFDFDFFD9EAE6FF0972
      49FF1F855FFF1F8660FF20855FFF218761FF20865EFF026E4AFFCFE5DDFFFFFF
      FFFFFBF9F8FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A85D7FF043E
      CEFF043BCDFF7898E0FFFFFFFDFFFFFFFFFFDDE8F3FFFFFFFEFFFFFFF6FFEBF0
      F7FF063FCEFF1045CEFF0028C6FFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F5FF008F
      ECFF149AF7FF159AF6FF149AF5FF1599FBFF1A6692FF139EFFFF0F97F6FF1198
      F3FF0B97F8FF41A9E9FFFFFFFAFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFD6E7E4FF127C55FF2A90
      67FF298E68FF298F69FF228C64FF2A906AFF2D8D67FF2A9168FF187654FFC8E1
      DAFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6C8AD7FF0B48
      D6FF1854CEFF003FD1FF7D9DE5FFFFFFFBFFFFFEFAFFFEFFFCFFD0E1F4FF0F47
      D2FF0E4ED7FF1356D0FF0034C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFF7CBF
      E7FF0C9FF9FF16A0F4FF21A1FEFF1884CAFF421701FF1498E7FF1BA4F8FF1DA1
      F5FF0798F1FFE4F0F5FFFFFEFBFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF7BB19FFF1F9366FF3399
      73FF399874FF1B9065FF9CC8B5FF1E8A62FF399D70FF339A6FFF31986FFF1F80
      5EFFD0E0DBFFFFFFFFFFFBFFFEFFFBFDFDFFFFFFFFFFFFFFFFFF6F8EDAFF0C54
      D8FF1C59E0FF054FD4FF5A8EDEFFFFFFF9FFFFFDFEFFFFFFFAFFCED9EEFF0049
      D8FF195BD9FF195ADFFF043DC5FFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFDFFFFFC
      FBFF1B9EF0FF1DAAF4FF24ADFFFF297EB3FF351F0DFF2B94D8FF24AAFBFF15AA
      F8FF68B8EBFFFFFFFBFFF9FEFEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFEFEFEFF7DAF9AFF2BA1
      6DFF27986CFFBAD5CBFFFFFFFFFFD5E3DFFF23936BFF3EA77FFF44A57AFF35A9
      7AFF1E885CFFCEDFDCFFFFFFFFFFFEFBFEFFFFFFFFFFFFFFFFFF6F8FD9FF1461
      DFFF115FDFFF7099E9FFFFFFFCFFFCFFFCFFF1F5FBFFFFFFFEFFFFFFFCFFE0EC
      F2FF105CDEFF1A6ADCFF0343CAFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFEFFFFFF
      FFFF8FC9E6FF1DAFFBFF2BB6FFFF2B7BABFF321E0FFF2989C2FF2AB6FDFF0FA2
      EEFFFEF8F8FFFCFEFAFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFBFCFFFFFFFFFFFF8CBB
      ABFFBCD8D0FFFFFFFFFFFBFDFCFFFFFFFFFFD1E1D6FF2D9B74FF4FB187FF4DAD
      86FF4DB183FF28926AFFC3DDD0FFFFFFFFFFFFFFFFFFFFFFFFFF7595DCFF166C
      EDFF0F65D9FFFDFFFBFFFFFFFCFFE6F0FBFF0C62D9FF85B6EDFFFFFFFDFFFFFF
      FFFF5B97E4FF176EE8FF0851D2FFFFFFFEFFFFFFFFFFFFFFFFFFFEFEFEFFFEFE
      FEFFFFFFFBFF22A7E2FF2FC1FFFF327498FF342010FF3284B2FF23C5FFFF8EC5
      E6FFFFFFFFFFF8FEFBFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1E2DAFF31A272FF5BB9
      8DFF50B48FFF52BD8DFF3F9472FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFCFF3670
      D9FF1377EEFF5A9AEBFFB6D3F3FF2377E4FF1F75EBFF0C6DE8FF7AADEEFFA4CC
      F4FF1D72E3FF1465E6FFC7CDEFFFFFFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FEFFFFFFFEFFACD5EAFF28C4FEFF358FABFF2A0A01FF389CC9FF25AFF1FFFFFF
      FDFFFFFFFAFFFCFDFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFFFFFFFFFFC3DFD4FF41A6
      81FF61C893FF40A47DFFF0F5F3FFFFFEFEFFFFFFFFFFFFFFFFFFF9FEF9FFFFFF
      FBFF4575D9FF1A80F1FF1576E9FF287EE7FF2B80EDFF2A80EAFF237CE8FF1177
      EEFF196DECFFCBD1E8FFFFFFFAFFF7FDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
      FDFFFBFBFCFFFFFFFCFF3CB5E4FF3ACBFFFF49D7FFFF25C8FEFFA7D4E4FFFFFF
      FDFFFCFDFDFFFFFDFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFFFFFFFFFFFFFFCADB
      D5FF3FA67CFFF1F0F2FFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFDFFFFFFFF
      FFFFFFFFFBFF3E77DBFF208CF6FF228DF3FF248CF1FF258BF4FF258CF6FF1772
      E6FFC5CFE8FFFFFFFDFFFFFEFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
      FEFFFEFEFFFFFFFFFFFFD1E2EDFF2AC5ECFF36D9FCFF49BCDFFFFFFEFCFFFEFF
      FFFFFFFEFEFFFFFFFEFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFEFFFFFDFFFFFFFF
      FFFFFEFFFFFFFEFEFEFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF8FFFCFAF7FFA4B7DEFFA8BAE6FFA8BBE6FFA8B8E6FFA2B4E3FFD3DC
      F1FFFFFFF9FFFAFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFAFFD8E8EEFFA1D0E6FFFFFAFDFFFBFBF7FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFFFCFEFEFFFEFF
      FCFFFDFEFEFFFEFDFDFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFBFDFDFFFFFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
      FFFFFBFDFDFFFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFCFDFFFFFEFFFFFFFFFAFFFFFEFDFFFDFCFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
