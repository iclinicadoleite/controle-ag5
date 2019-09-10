inherited Zoo_AnimaisExternosFemeaForm: TZoo_AnimaisExternosFemeaForm
  Left = 520
  Top = 172
  Caption = 'Animais externos - F'#234'meas'
  ClientHeight = 480
  ClientWidth = 716
  OnShow = TcMPFormShow
  ActionList.OnExecute = _ActionListExecute
  ExplicitWidth = 732
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 13
  object _PnlForm: TPanel [0]
    Left = 0
    Top = 0
    Width = 716
    Height = 415
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    Caption = ' '
    Color = clNavy
    ParentBackground = False
    TabOrder = 2
    ExplicitHeight = 369
  end
  inherited _pageControl: TPageControl
    Width = 716
    Height = 415
    ExplicitWidth = 716
    ExplicitHeight = 369
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 708
      ExplicitHeight = 387
      inherited _pnlSearch: TPanel
        Width = 708
        ExplicitWidth = 708
        inherited _edtSearch: TJvComboEdit
          ParentFont = False
        end
      end
      inherited _pnldbgLista: TPanel
        Width = 708
        Height = 349
        BevelOuter = bvNone
        ExplicitWidth = 708
        ExplicitHeight = 349
        inherited _dbgLista: TJvDBUltimGrid
          Left = 1
          Top = 1
          Width = 706
          Height = 347
          Constraints.MinHeight = 109
          DrawingStyle = gdsThemed
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 708
      ExplicitHeight = 341
      inherited _pnlFicha: TPanel
        Width = 708
        Height = 387
        Constraints.MinHeight = 213
        ExplicitWidth = 708
        ExplicitHeight = 341
        inherited _ScrollBoxFicha: TScrollBox
          Width = 708
          Height = 387
          AutoScroll = False
          ExplicitWidth = 708
          ExplicitHeight = 341
          inherited _pnlScroll: TPanel
            Width = 708
            Height = 387
            AutoSize = False
            ExplicitWidth = 708
            ExplicitHeight = 341
            object Splitter1: TSplitter
              Left = 130
              Top = 0
              Width = 6
              Height = 387
              ExplicitLeft = 65
              ExplicitHeight = 353
            end
            object _pnldbgLista2: TPanel
              Left = 0
              Top = 0
              Width = 130
              Height = 387
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
              TabOrder = 0
              ExplicitHeight = 341
              object JvDBUltimGrid4: TJvDBUltimGrid
                Left = 1
                Top = 99
                Width = 128
                Height = 287
                Align = alClient
                DataSource = dtsLista
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnResize = JvDBUltimGrid4Resize
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
                  Caption = 'Brinco'
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
            object Panel5: TPanel
              Left = 136
              Top = 0
              Width = 572
              Height = 387
              Align = alClient
              BorderWidth = 1
              Caption = 'Panel5'
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              ExplicitHeight = 341
              object Panel3: TPanel
                Left = 2
                Top = 2
                Width = 568
                Height = 383
                Align = alClient
                Caption = 'Panel3'
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                ExplicitHeight = 337
                object pgcMain: TJvPageControl
                  Left = 1
                  Top = 33
                  Width = 566
                  Height = 349
                  ActivePage = tbsGenealogiaCadastro
                  Align = alClient
                  OwnerDraw = True
                  Style = tsButtons
                  TabOrder = 1
                  TabWidth = 100
                  OnChange = pgcGenealogiaChange
                  TabPainter = JvTabDefaultPainter1
                  ExplicitHeight = 303
                  object tbsGenealogiaCadastro: TTabSheet
                    Caption = '&Cadastro'
                    ImageIndex = 1
                    ExplicitLeft = 3
                    ExplicitTop = 33
                    object Label24: TLabel
                      Left = 250
                      Top = 8
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
                      Left = 9
                      Top = 104
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
                      Left = 9
                      Top = 9
                      Width = 36
                      Height = 13
                      Margins.Left = 2
                      Margins.Top = 2
                      Margins.Right = 2
                      Margins.Bottom = 2
                      Caption = 'Brinco'
                      FocusControl = DBEdit1
                    end
                    object Label23: TLabel
                      Left = 9
                      Top = 41
                      Width = 33
                      Height = 13
                      Margins.Left = 2
                      Margins.Top = 2
                      Margins.Right = 2
                      Margins.Bottom = 2
                      Caption = 'Nome'
                      FocusControl = DBEdit3
                    end
                    object Label5: TLabel
                      Left = 9
                      Top = 72
                      Width = 85
                      Height = 13
                      Margins.Left = 2
                      Margins.Top = 2
                      Margins.Right = 2
                      Margins.Bottom = 2
                      Caption = 'Nome est'#225'bulo'
                      FocusControl = DBEdit9
                    end
                    object DBEdit4: TDBEdit
                      Left = 301
                      Top = 6
                      Width = 80
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
                      Left = 98
                      Top = 101
                      Width = 115
                      Height = 21
                      Margins.Left = 2
                      Margins.Top = 2
                      Margins.Right = 2
                      Margins.Bottom = 2
                      Checked = False
                      DataField = 'NASCIMENTO'
                      DataSource = dtsDadosFemea
                      CheckOnExit = False
                      Color = clWhite
                      ButtonWidth = 24
                      TabOrder = 4
                    end
                    object DBEdit3: TDBEdit
                      Left = 98
                      Top = 38
                      Width = 286
                      Height = 21
                      Margins.Left = 2
                      Margins.Top = 2
                      Margins.Right = 2
                      Margins.Bottom = 2
                      DataField = 'NOMECOMPLETO'
                      DataSource = dtsFicha
                      TabOrder = 2
                    end
                    object DBEdit1: TDBEdit
                      Left = 98
                      Top = 6
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
                    object GroupBox3: TGroupBox
                      Left = 3
                      Top = 156
                      Width = 344
                      Height = 135
                      Caption = 'Pedigree'
                      TabOrder = 5
                      object Label49: TLabel
                        Left = 21
                        Top = 34
                        Width = 17
                        Height = 13
                        Margins.Left = 2
                        Margins.Top = 2
                        Margins.Right = 2
                        Margins.Bottom = 2
                        Caption = 'Pai'
                      end
                      object Label50: TLabel
                        Left = 15
                        Top = 68
                        Width = 23
                        Height = 13
                        Margins.Left = 2
                        Margins.Top = 2
                        Margins.Right = 2
                        Margins.Bottom = 2
                        Caption = 'M'#227'e'
                      end
                      object Label29: TLabel
                        Left = 10
                        Top = 129
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
                      object Label3: TLabel
                        Left = 10
                        Top = 102
                        Width = 93
                        Height = 13
                        Margins.Left = 2
                        Margins.Top = 2
                        Margins.Right = 2
                        Margins.Bottom = 2
                        Caption = 'Grau de Sangue'
                        FocusControl = DBLookupComboBox2
                      end
                      object Label4: TLabel
                        Left = 238
                        Top = 9
                        Width = 92
                        Height = 13
                        Margins.Left = 2
                        Margins.Top = 2
                        Margins.Right = 2
                        Margins.Bottom = 2
                        Caption = 'GS/Composi'#231#227'o'
                        FocusControl = DBLookupComboBox2
                      end
                      object edPai: TJvDBComboEdit
                        Left = 52
                        Top = 31
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
                        Left = 52
                        Top = 65
                        Width = 173
                        Height = 21
                        Color = clWhite
                        DataField = 'NOMEMAE'
                        DataSource = dtsLinhagem
                        ImageKind = ikEllipsis
                        ButtonWidth = 15
                        TabOrder = 2
                        OnButtonClick = edMaeButtonClick
                      end
                      object dbEdtComposicaoRaca: TJvDBComboEdit
                        Left = 192
                        Top = 99
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
                      object dbxGrauSangue: TDBComboBox
                        Left = 110
                        Top = 99
                        Width = 74
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
                      object DBLookupComboBox2: TDBLookupComboBox
                        Left = 52
                        Top = 127
                        Width = 267
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
                      object DBEdit6: TDBEdit
                        Left = 239
                        Top = 32
                        Width = 89
                        Height = 21
                        TabStop = False
                        DataField = 'GSR_PAI'
                        DataSource = dtsLinhagem
                        ReadOnly = True
                        TabOrder = 1
                      end
                      object DBEdit8: TDBEdit
                        Left = 239
                        Top = 65
                        Width = 89
                        Height = 21
                        TabStop = False
                        DataField = 'GSR_MAE'
                        DataSource = dtsLinhagem
                        ReadOnly = True
                        TabOrder = 3
                      end
                    end
                    object DBEdit9: TDBEdit
                      Left = 98
                      Top = 69
                      Width = 286
                      Height = 21
                      Margins.Left = 2
                      Margins.Top = 2
                      Margins.Right = 2
                      Margins.Bottom = 2
                      DataField = 'NOMEESTABULO'
                      DataSource = dtsFicha
                      TabOrder = 3
                    end
                    object dbchkOriginadoEmbriao: TDBCheckBox
                      Left = 9
                      Top = 132
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
                  object tbsGenealogiaPedigree: TTabSheet
                    Caption = '&Pedigree'
                  end
                  object tbsGenealogiaFilhos: TTabSheet
                    Caption = 'Fi&lhos'
                    ImageIndex = 2
                    TabVisible = False
                  end
                end
                object Panel4: TPanel
                  Left = 1
                  Top = 1
                  Width = 566
                  Height = 32
                  Align = alTop
                  Caption = ' '
                  ParentColor = True
                  TabOrder = 0
                  object Label22: TLabel
                    Left = 3
                    Top = 7
                    Width = 103
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Nome de &est'#225'bulo'
                    FocusControl = DBEdit2
                  end
                  object DBEdit2: TDBEdit
                    Left = 116
                    Top = 4
                    Width = 372
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DataField = 'NOMEESTABULO'
                    DataSource = dtsFicha
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 415
    Width = 716
    ExplicitTop = 369
    ExplicitWidth = 716
    inherited _imageBottom: TImage
      Width = 716
      ExplicitWidth = 739
    end
    inherited _ToolBar: TToolBar
      Left = 3
      ExplicitLeft = 3
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
    DataSet = Zoo_AnimaisExternosFemeaDatamodule.cdsAnimal
    Left = 578
  end
  inherited dtsLista: TDataSource
    DataSet = Zoo_AnimaisExternosFemeaDatamodule.cdsLstFemeas
    OnDataChange = dtsListaDataChange
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
    Left = 462
    Top = 27
  end
  object dtsLinhagem: TDataSource
    DataSet = Zoo_AnimaisExternosFemeaDatamodule.cdsLinhagem
    Left = 414
    Top = 54
  end
  object dtsDadosFemea: TDataSource
    DataSet = Zoo_AnimaisExternosFemeaDatamodule.cdsDadosFemea
    Left = 620
    Top = 24
  end
  object dtsDescartes: TDataSource
    Left = 744
    Top = 310
  end
  object DataSource1: TDataSource
    DataSet = Zoo_AnimaisExternosFemeaDatamodule.cdsTipoMotivoDescarte
    Left = 505
    Top = 210
  end
end
