inherited Zoo_AnimaisExternosMachoForm: TZoo_AnimaisExternosMachoForm
  Left = 479
  Top = 223
  Caption = 'Animais externos - Machos'
  ClientWidth = 716
  OnShow = TcMPFormShow
  ActionList.OnExecute = _ActionListExecute
  ExplicitWidth = 732
  PixelsPerInch = 96
  TextHeight = 13
  object _PnlForm: TPanel [0]
    Left = 0
    Top = 0
    Width = 716
    Height = 391
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    Caption = ' '
    Color = clNavy
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 345
  end
  inherited _pnlToolButtons: TPanel [1]
    Width = 716
    TabOrder = 0
    ExplicitTop = 345
    ExplicitWidth = 716
    inherited _imageBottom: TImage
      Width = 716
      ExplicitWidth = 815
    end
    inherited _ToolBar: TToolBar
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited _pageControl: TPageControl [2]
    Width = 716
    TabOrder = 2
    ExplicitWidth = 716
    ExplicitHeight = 345
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 708
      ExplicitHeight = 317
      inherited _pnlSearch: TPanel
        Width = 708
        ExplicitWidth = 708
        inherited _edtSearch: TJvComboEdit
          ParentFont = False
        end
      end
      inherited _pnldbgLista: TPanel
        Width = 708
        ExplicitWidth = 708
        ExplicitHeight = 279
        inherited _dbgLista: TJvDBUltimGrid
          Width = 704
          Constraints.MinHeight = 109
          ParentColor = True
          ParentFont = True
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'BRINCO'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMECOMPLETO'
              Width = 219
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGISTRO'
              Width = 165
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCR_STATUS'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UI'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DI'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UU'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DU'
              Width = 72
              Visible = True
            end>
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 708
      ExplicitHeight = 317
      inherited _pnlFicha: TPanel
        Width = 708
        Constraints.MinHeight = 213
        ExplicitWidth = 708
        ExplicitHeight = 317
        inherited _ScrollBoxFicha: TScrollBox
          Width = 708
          AutoScroll = False
          ExplicitWidth = 708
          ExplicitHeight = 317
          inherited _pnlScroll: TPanel
            Width = 708
            ExplicitWidth = 708
            ExplicitHeight = 317
            object Splitter1: TSplitter
              Left = 130
              Top = 0
              Width = 6
              Height = 363
              ExplicitLeft = 65
              ExplicitHeight = 353
            end
            object pgcMain: TJvPageControl
              Left = 136
              Top = 0
              Width = 572
              Height = 363
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
              ExplicitLeft = 316
              ExplicitTop = 16
              object tbsMainCadastro: TTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Cadastro'
                ExplicitLeft = -88
                ExplicitTop = -17
                object Label24: TLabel
                  Left = 334
                  Top = 10
                  Width = 47
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Registro'
                  FocusControl = DBEdit4
                end
                object Label25: TLabel
                  Left = 8
                  Top = 112
                  Width = 66
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Nascimento'
                  FocusControl = JvDBDateEdit2
                end
                object Label21: TLabel
                  Left = 8
                  Top = 10
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
                  Top = 44
                  Width = 33
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Nome'
                  FocusControl = DBEdit3
                end
                object Label36: TLabel
                  Left = 8
                  Top = 78
                  Width = 36
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Status'
                end
                object DBEdit4: TDBEdit
                  Left = 385
                  Top = 7
                  Width = 72
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'REGISTRO'
                  DataSource = dtsFicha
                  TabOrder = 1
                end
                object JvDBDateEdit2: TTcDBDateEdit
                  Left = 102
                  Top = 109
                  Width = 99
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Checked = False
                  DataField = 'NASCIMENTO'
                  DataSource = dtsDadosMacho
                  CheckOnExit = False
                  Color = clWhite
                  ButtonWidth = 24
                  TabOrder = 4
                end
                object DBEdit1: TDBEdit
                  Left = 102
                  Top = 7
                  Width = 115
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'BRINCO'
                  DataSource = dtsFicha
                  TabOrder = 0
                end
                object DBEdit3: TDBEdit
                  Left = 102
                  Top = 41
                  Width = 355
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'NOMECOMPLETO'
                  DataSource = dtsFicha
                  TabOrder = 2
                end
                object DBLookupComboBox1: TDBLookupComboBox
                  Left = 102
                  Top = 74
                  Width = 115
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'DESCR_STATUS'
                  DataSource = dtsFicha
                  TabOrder = 3
                end
                object GroupBox3: TGroupBox
                  Left = 8
                  Top = 176
                  Width = 344
                  Height = 128
                  Caption = 'Pedigree'
                  TabOrder = 5
                  object Label49: TLabel
                    Left = 17
                    Top = 30
                    Width = 17
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Pai'
                  end
                  object Label50: TLabel
                    Left = 17
                    Top = 62
                    Width = 23
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'M'#227'e'
                  end
                  object Label9: TLabel
                    Left = 238
                    Top = 7
                    Width = 92
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'GS/Composi'#231#227'o'
                  end
                  object Label29: TLabel
                    Left = 16
                    Top = 124
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
                  object Label20: TLabel
                    Left = 10
                    Top = 93
                    Width = 93
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Grau de Sangue'
                    FocusControl = DBLookupComboBox2
                  end
                  object edPai: TJvDBComboEdit
                    Left = 53
                    Top = 27
                    Width = 173
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
                    Left = 53
                    Top = 59
                    Width = 173
                    Height = 21
                    Color = clWhite
                    DataField = 'NOMEMAE'
                    DataSource = dtsLinhagem
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    TabOrder = 1
                    OnButtonClick = edMaeButtonClick
                  end
                  object DBEdit9: TDBEdit
                    Left = 240
                    Top = 30
                    Width = 89
                    Height = 21
                    TabStop = False
                    DataField = 'GSR_PAI'
                    DataSource = dtsLinhagem
                    ReadOnly = True
                    TabOrder = 2
                  end
                  object DBEdit16: TDBEdit
                    Left = 240
                    Top = 61
                    Width = 89
                    Height = 21
                    TabStop = False
                    DataField = 'GSR_MAE'
                    DataSource = dtsLinhagem
                    ReadOnly = True
                    TabOrder = 3
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 53
                    Top = 120
                    Width = 266
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DataField = 'DESCR_RACA'
                    DataSource = dtsFicha
                    TabOrder = 4
                    Visible = False
                  end
                  object dbxGrauSangue: TDBComboBox
                    Left = 110
                    Top = 90
                    Width = 76
                    Height = 21
                    DataField = 'GRAUSANGUE'
                    DataSource = dtsFicha
                    Items.Strings = (
                      '1/1 ( 1 )'
                      '1/2 ( 50 ) '
                      '3/4 ( 25 )'
                      '7/8  ( 87 )'
                      '15/16 ( 94 )')
                    TabOrder = 5
                    OnKeyPress = dbxGrauSangueKeyPress
                  end
                  object dbEdtComposicaoRaca: TJvDBComboEdit
                    Left = 201
                    Top = 90
                    Width = 128
                    Height = 21
                    DataField = 'COMPOSICAORACA'
                    DataSource = dtsFicha
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    ReadOnly = True
                    TabOrder = 6
                    OnButtonClick = dbEdtComposicaoRacaButtonClick
                    OnKeyPress = dbEdtComposicaoRacaKeyPress
                  end
                end
                object dbchkOriginadoEmbriao: TDBCheckBox
                  Left = 8
                  Top = 144
                  Width = 147
                  Height = 17
                  Caption = 'Originado de embri'#227'o'
                  DataField = 'ORIGINADO_DE_EMBRIAO'
                  DataSource = dtsFicha
                  TabOrder = 6
                  ValueChecked = 'T'
                  ValueUnchecked = 'F'
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
            end
            object _pnldbgLista2: TPanel
              Left = 0
              Top = 0
              Width = 130
              Height = 363
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
              ExplicitHeight = 317
              object JvDBUltimGrid4: TJvDBUltimGrid
                Left = 1
                Top = 99
                Width = 128
                Height = 263
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
                    FieldName = 'BRINCO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMECOMPLETO'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMEESTABULO'
                    Title.Caption = 'Nome Est'#225'bulo'
                    Width = 64
                    Visible = True
                  end>
              end
              object Panel9: TPanel
                Left = 1
                Top = 1
                Width = 128
                Height = 98
                Align = alTop
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                object rbShowBrinco: TRadioButton
                  Left = 4
                  Top = 2
                  Width = 107
                  Height = 14
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
                object rbShowNomeEstabulo: TRadioButton
                  Left = 4
                  Top = 39
                  Width = 107
                  Height = 15
                  Caption = 'Nome est'#225'bulo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnClick = rbShowColumnClick
                end
                object rbShowNomeCompleto: TRadioButton
                  Left = 4
                  Top = 20
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
                  Left = 3
                  Top = 74
                  Width = 103
                  Height = 21
                  DataSource = dtsLista
                  DataField = 'BRINCO'
                  TabOrder = 3
                  Text = 'edtQuickSearch'
                end
              end
            end
          end
        end
      end
    end
  end
  inherited dtsLista: TDataSource [3]
    DataSet = Zoo_AnimaisExternosMachoDatamodule.cdsLstMachos
    OnDataChange = dtsListaDataChange
    Left = 279
    Top = 12
  end
  inherited _popMenuPrint: TPopupMenu [4]
  end
  inherited dtsFicha: TDataSource [5]
    DataSet = Zoo_AnimaisExternosMachoDatamodule.cdsAnimal
    Left = 319
    Top = 12
  end
  inherited ActionList: TInternalActionList [6]
    OnExecute = _ActionListExecute
  end
  object dtsDadosMacho: TDataSource
    DataSet = Zoo_AnimaisExternosMachoDatamodule.cdsDadosMacho
    Left = 351
    Top = 12
  end
  object dtsLinhagem: TDataSource
    DataSet = Zoo_AnimaisExternosMachoDatamodule.cdsLinhagem
    Left = 226
    Top = 10
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
end
