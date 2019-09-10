inherited Zoo_BancoDadosFemeaForm: TZoo_BancoDadosFemeaForm
  Left = 395
  Top = 176
  BorderIcons = [biSystemMenu]
  Caption = 'F'#234'meas'
  ClientHeight = 688
  ClientWidth = 962
  OnShow = TcMPFormShow
  ActionList.OnExecute = _ActionListExecute
  ActionList.OnUpdate = _ActionListUpdate
  ExplicitWidth = 978
  ExplicitHeight = 727
  PixelsPerInch = 96
  TextHeight = 13
  object _PnlForm: TPanel [0]
    Left = 0
    Top = 0
    Width = 962
    Height = 623
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    Caption = ' '
    Color = clNavy
    ParentBackground = False
    TabOrder = 2
  end
  inherited _pageControl: TPageControl
    Width = 962
    Height = 623
    ActivePage = _tbsFicha
    ExplicitWidth = 962
    ExplicitHeight = 623
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 954
      ExplicitHeight = 595
      inherited _pnlSearch: TPanel
        Width = 954
        ExplicitWidth = 954
        inherited _edtSearch: TJvComboEdit
          ParentFont = False
        end
        object cbxExibirDescartados1: TCheckBox
          Left = 320
          Top = 3
          Width = 121
          Height = 17
          Caption = 'Exibir descartados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = cbxExibirDescartadosClick
        end
      end
      inherited _pnldbgLista: TPanel
        Width = 954
        Height = 557
        BevelOuter = bvNone
        ExplicitWidth = 954
        ExplicitHeight = 557
        inherited _dbgLista: TJvDBUltimGrid
          Left = 1
          Top = 1
          Width = 952
          Height = 555
          Constraints.MinHeight = 109
          DrawingStyle = gdsThemed
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 954
      ExplicitHeight = 595
      inherited _pnlFicha: TPanel
        Width = 954
        Height = 595
        Constraints.MinHeight = 213
        ExplicitWidth = 954
        ExplicitHeight = 595
        inherited _ScrollBoxFicha: TScrollBox
          Width = 954
          Height = 595
          AutoScroll = False
          ExplicitWidth = 954
          ExplicitHeight = 595
          inherited _pnlScroll: TPanel
            Width = 954
            Height = 595
            AutoSize = False
            ExplicitWidth = 954
            ExplicitHeight = 595
            object Splitter1: TSplitter
              Left = 140
              Top = 0
              Width = 6
              Height = 595
              ExplicitLeft = 65
              ExplicitHeight = 353
            end
            object _pnldbgLista2: TPanel
              Left = 0
              Top = 0
              Width = 140
              Height = 595
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
              object JvDBUltimGrid4: TJvDBUltimGrid
                Left = 1
                Top = 124
                Width = 138
                Height = 470
                Align = alClient
                DataSource = dtsLista
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMEESTABULO'
                    Title.Caption = 'Nome Est'#225'bulo'
                    Visible = True
                  end>
              end
              object Panel9: TPanel
                Left = 1
                Top = 1
                Width = 138
                Height = 123
                Align = alTop
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                object Image1: TImage
                  Left = 118
                  Top = 96
                  Width = 16
                  Height = 16
                  Cursor = crHelp
                  ParentCustomHint = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object rbShowBrinco: TRadioButton
                  Left = 4
                  Top = 6
                  Width = 130
                  Height = 15
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
                  Top = 49
                  Width = 130
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
                  Top = 27
                  Width = 130
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
                  Left = 8
                  Top = 94
                  Width = 103
                  Height = 21
                  DataSource = dtsLista
                  DataField = 'BRINCO'
                  TabOrder = 3
                  Text = 'edtQuickSearch'
                  OnChange = edtQuickSearchChange
                end
                object cbxExibirDescartados2: TCheckBox
                  Left = 4
                  Top = 70
                  Width = 132
                  Height = 17
                  Caption = 'Exibir descartados'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnClick = cbxExibirDescartadosClick
                end
              end
            end
            object Panel5: TPanel
              Left = 146
              Top = 0
              Width = 808
              Height = 595
              Align = alClient
              BorderWidth = 1
              Caption = 'Panel5'
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object Panel3: TPanel
                Left = 2
                Top = 2
                Width = 804
                Height = 591
                Align = alClient
                Caption = 'Panel3'
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object Panel4: TPanel
                  Left = 1
                  Top = 1
                  Width = 802
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
                    Caption = 'Nome de est'#225'bulo'
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
                object pgcMain: TJvPageControl
                  Left = 1
                  Top = 33
                  Width = 802
                  Height = 557
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  ActivePage = tbsMainGenealogia
                  Align = alClient
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  OwnerDraw = True
                  ParentFont = False
                  Style = tsButtons
                  TabOrder = 1
                  TabWidth = 85
                  OnChange = pgcMainChange
                  OnChanging = pgcMainChanging
                  TabPainter = JvTabDefaultPainter1
                  ClientBorderWidth = 2
                  object tbsMainInformacao: TTabSheet
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = '&Informa'#231#227'o'
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                  end
                  object tbsMainHistorico: TTabSheet
                    Caption = '&Hist'#243'rico'
                    ImageIndex = 5
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                  end
                  object tbsMainReproducao: TTabSheet
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = '&Reprodu'#231#227'o'
                    ImageIndex = 3
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                  end
                  object tbsMainProducao: TTabSheet
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = '&Produ'#231#227'o'
                    ImageIndex = 5
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                  end
                  object tbsMainSanidade: TTabSheet
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = '&Sanidade'
                    ImageIndex = 2
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                  end
                  object tbsMainGenealogia: TTabSheet
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = '&Genealogia'
                    object pgcGenealogia: TJvPageControl
                      Left = 0
                      Top = 0
                      Width = 798
                      Height = 530
                      ActivePage = tbsGenealogiaCadastro
                      Align = alClient
                      OwnerDraw = True
                      Style = tsButtons
                      TabOrder = 0
                      TabWidth = 100
                      OnChange = pgcGenealogiaChange
                      OnChanging = pgcGenealogiaChanging
                      TabPainter = JvTabDefaultPainter1
                      object tbsGenealogiaPedigree: TTabSheet
                        Caption = '&Pedigree'
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                      end
                      object tbsGenealogiaCadastro: TTabSheet
                        Caption = '&Cadastro'
                        ImageIndex = 1
                        object ScrollBox1: TScrollBox
                          Left = 0
                          Top = 0
                          Width = 790
                          Height = 499
                          Align = alClient
                          BorderStyle = bsNone
                          TabOrder = 0
                          object gbxControleLeiteiro: TGroupBox
                            Left = 433
                            Top = 143
                            Width = 298
                            Height = 69
                            Caption = 'Controle Leiteiro'
                            TabOrder = 2
                            object Label6: TLabel
                              Left = 19
                              Top = 21
                              Width = 46
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'SISBOV'
                              FocusControl = dbeSISBOV
                              Visible = False
                            end
                            object Label7: TLabel
                              Left = 19
                              Top = 34
                              Width = 23
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'SCL'
                              FocusControl = dbeSCL
                            end
                            object dbeSISBOV: TDBEdit
                              Left = 77
                              Top = 17
                              Width = 158
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              DataField = 'SISBOV'
                              DataSource = dtsFicha
                              TabOrder = 0
                              Visible = False
                            end
                            object dbeSCL: TDBEdit
                              Left = 77
                              Top = 31
                              Width = 158
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              DataField = 'SCL'
                              DataSource = dtsDadosFemea
                              TabOrder = 1
                            end
                          end
                          object gbxPedigree: TGroupBox
                            Left = 8
                            Top = 281
                            Width = 414
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
                              Top = 73
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
                              Top = 128
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
                              Top = 105
                              Width = 91
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Grau de sangue'
                              FocusControl = DBLookupComboBox2
                            end
                            object Label4: TLabel
                              Left = 276
                              Top = 14
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
                              Top = 36
                              Width = 199
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
                            object dbEdtComposicaoRaca: TJvDBComboEdit
                              Left = 292
                              Top = 102
                              Width = 107
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
                              Left = 112
                              Top = 102
                              Width = 140
                              Height = 21
                              DataField = 'GRAUSANGUE'
                              DataSource = dtsFicha
                              Items.Strings = (
                                '1/1 ( 1 )'
                                '1/2 ( 50 ) '
                                '5/8 ( 62 )'
                                '3/4 ( 75 )'
                                '7/8  ( 87 )'
                                '15/16 ( 94 )')
                              TabOrder = 5
                              OnKeyPress = dbxGrauSangueKeyPress
                            end
                            object DBLookupComboBox2: TDBLookupComboBox
                              Left = 52
                              Top = 126
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
                              Left = 292
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
                              Left = 292
                              Top = 70
                              Width = 107
                              Height = 21
                              TabStop = False
                              DataField = 'GSR_MAE'
                              DataSource = dtsLinhagem
                              ReadOnly = True
                              TabOrder = 3
                            end
                          end
                          object gbxOrigem: TGroupBox
                            Left = 8
                            Top = 221
                            Width = 723
                            Height = 50
                            Caption = 'Origem'
                            TabOrder = 3
                            object Label26: TLabel
                              Left = 11
                              Top = 22
                              Width = 27
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Data'
                              FocusControl = JvDBDateEdit1
                            end
                            object Label27: TLabel
                              Left = 204
                              Top = 22
                              Width = 29
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Local'
                              FocusControl = DBEdit7
                            end
                            object Label28: TLabel
                              Left = 479
                              Top = 22
                              Width = 97
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Pre'#231'o de compra'
                            end
                            object DBEdit7: TDBEdit
                              Left = 239
                              Top = 20
                              Width = 198
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              DataField = 'LOCAL_ORIGEM'
                              DataSource = dtsFicha
                              TabOrder = 1
                            end
                            object JvDBDateEdit1: TTcDBDateEdit
                              Left = 46
                              Top = 21
                              Width = 108
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
                              ButtonWidth = 24
                              TabOrder = 0
                            end
                            object JvDBCalcEdit2: TJvDBCalcEdit
                              Left = 586
                              Top = 20
                              Width = 101
                              Height = 21
                              ShowButton = False
                              TabOrder = 2
                              DecimalPlacesAlwaysShown = False
                              DataField = 'PRECO_COMPRA'
                              DataSource = dtsFicha
                            end
                          end
                          object gbxDescarte: TGroupBox
                            Left = 428
                            Top = 281
                            Width = 303
                            Height = 219
                            Caption = 'Descarte'
                            TabOrder = 5
                            object Label34: TLabel
                              Left = 14
                              Top = 139
                              Width = 35
                              Height = 13
                              Caption = 'Raz'#227'o'
                              FocusControl = DBLookupComboBox4
                              Visible = False
                            end
                            object Label37: TLabel
                              Left = 11
                              Top = 72
                              Width = 37
                              Height = 13
                              Caption = 'Motivo'
                            end
                            object Label38: TLabel
                              Left = 11
                              Top = 99
                              Width = 99
                              Height = 13
                              Caption = 'Nome comprador'
                              FocusControl = DBEdit14
                            end
                            object Label39: TLabel
                              Left = 11
                              Top = 126
                              Width = 68
                              Height = 13
                              Caption = 'Valor venda'
                              FocusControl = DBEdit14
                            end
                            object Label40: TLabel
                              Left = 11
                              Top = 43
                              Width = 27
                              Height = 13
                              Caption = 'Data'
                              FocusControl = DBLookupComboBox4
                            end
                            object DBLookupComboBox4: TDBLookupComboBox
                              Left = 69
                              Top = 130
                              Width = 150
                              Height = 21
                              DataField = 'DESCR_RAZAO'
                              DataSource = dtsDescartes
                              TabOrder = 3
                              Visible = False
                            end
                            object DBEdit14: TDBEdit
                              Left = 117
                              Top = 96
                              Width = 150
                              Height = 21
                              DataField = 'NOMECOMPRADOR'
                              DataSource = dtsDescartes
                              TabOrder = 4
                            end
                            object JvDBCalcEdit1: TJvDBCalcEdit
                              Left = 117
                              Top = 123
                              Width = 121
                              Height = 21
                              TabOrder = 5
                              DecimalPlacesAlwaysShown = False
                              DataField = 'PRECOVENDA'
                              DataSource = dtsDescartes
                            end
                            object TcMPDBDateEdit1: TTcDBDateEdit
                              Left = 117
                              Top = 39
                              Width = 121
                              Height = 21
                              Checked = False
                              DataField = 'DATA'
                              DataSource = dtsDescartes
                              CheckOnExit = False
                              Color = clWhite
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clBlack
                              Font.Height = -11
                              Font.Name = 'Verdana'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 1
                            end
                            object DBMemo1: TDBMemo
                              Left = 12
                              Top = 161
                              Width = 257
                              Height = 51
                              DataField = 'OBS'
                              DataSource = dtsDescartes
                              TabOrder = 6
                            end
                            object DBCheckBox1: TJvDBCheckBox
                              Left = 11
                              Top = 17
                              Width = 150
                              Height = 17
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Inten'#231#227'o de descarte'
                              DataField = 'INTENCAO_DESCARTE'
                              DataSource = dtsDadosFemea
                              TabOrder = 0
                              ValueChecked = 'T'
                              ValueUnchecked = 'F'
                            end
                            object JvDBComboBox1: TJvDBComboBox
                              Left = 117
                              Top = 67
                              Width = 150
                              Height = 22
                              Style = csOwnerDrawVariable
                              DataField = 'MOTIVO'
                              DataSource = dtsDescartes
                              TabOrder = 2
                              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                              ListSettings.OutfilteredValueFont.Color = clRed
                              ListSettings.OutfilteredValueFont.Height = -11
                              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                              ListSettings.OutfilteredValueFont.Style = []
                              ListSettings.KeyField = 'VALOR'
                              ListSettings.DisplayField = 'DESCRICAO'
                              ListSettings.DataSource = dtsTipoDescarte
                              OnKeyDown = JvDBComboBox1KeyDown
                            end
                          end
                          object gbxDadosCadastrais: TGroupBox
                            Left = 8
                            Top = 0
                            Width = 414
                            Height = 212
                            Caption = 'Dados cadastrais'
                            TabOrder = 0
                            object Label1: TLabel
                              Left = 251
                              Top = 139
                              Width = 33
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Idade'
                              FocusControl = deNascimento
                            end
                            object Label2: TLabel
                              Left = 15
                              Top = 111
                              Width = 56
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Categoria'
                              FocusControl = dblcStatus
                            end
                            object Label21: TLabel
                              Left = 16
                              Top = 22
                              Width = 36
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Brinco'
                              FocusControl = dbeBrinco
                            end
                            object Label23: TLabel
                              Left = 16
                              Top = 53
                              Width = 33
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Nome'
                              FocusControl = dbeNome
                            end
                            object Label24: TLabel
                              Left = 273
                              Top = 22
                              Width = 47
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Registro'
                              FocusControl = dbeRegistro
                            end
                            object Label25: TLabel
                              Left = 15
                              Top = 139
                              Width = 66
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Nascimento'
                              FocusControl = deNascimento
                            end
                            object Label5: TLabel
                              Left = 15
                              Top = 83
                              Width = 85
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Nome est'#225'bulo'
                              FocusControl = dbeNomeEstabulo
                            end
                            object Label52: TLabel
                              Left = 16
                              Top = 168
                              Width = 109
                              Height = 13
                              Caption = 'Doadora/receptora'
                              FocusControl = dblcDoadoraReceptora
                            end
                            object LinkLabel1: TLabel
                              Left = 211
                              Top = 22
                              Width = 58
                              Height = 13
                              Cursor = crHandPoint
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = '(hist'#243'rico)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clNavy
                              Font.Height = -11
                              Font.Name = 'Verdana'
                              Font.Style = [fsUnderline]
                              ParentFont = False
                              OnClick = LinkLabel1Click
                            end
                            object LinkLabel4: TLabel
                              Left = 298
                              Top = 112
                              Width = 58
                              Height = 13
                              Cursor = crHandPoint
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = '(hist'#243'rico)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clNavy
                              Font.Height = -11
                              Font.Name = 'Verdana'
                              Font.Style = [fsUnderline]
                              ParentFont = False
                              OnClick = LinkLabel4Click
                            end
                            object dbchkOriginadoEmbriao: TDBCheckBox
                              Left = 17
                              Top = 187
                              Width = 150
                              Height = 22
                              Caption = 'originado de embri'#227'o'
                              DataField = 'ORIGINADO_DE_EMBRIAO'
                              DataSource = dtsFicha
                              TabOrder = 8
                              ValueChecked = 'T'
                              ValueUnchecked = 'F'
                            end
                            object dbeBrinco: TDBEdit
                              Left = 112
                              Top = 19
                              Width = 85
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              DataField = 'BRINCO'
                              DataSource = dtsFicha
                              TabOrder = 0
                            end
                            object dbeIdade: TDBEdit
                              Left = 300
                              Top = 136
                              Width = 50
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              TabStop = False
                              DataField = 'IDADE'
                              DataSource = dtsDadosFemea
                              ReadOnly = True
                              TabOrder = 6
                            end
                            object dbeNome: TDBEdit
                              Left = 111
                              Top = 50
                              Width = 288
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              DataField = 'NOMECOMPLETO'
                              DataSource = dtsFicha
                              TabOrder = 2
                            end
                            object dbeNomeEstabulo: TDBEdit
                              Left = 110
                              Top = 80
                              Width = 288
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              DataField = 'NOMEESTABULO'
                              DataSource = dtsFicha
                              TabOrder = 3
                            end
                            object dbeRegistro: TDBEdit
                              Left = 327
                              Top = 19
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
                            object dblcDoadoraReceptora: TDBLookupComboBox
                              Left = 144
                              Top = 165
                              Width = 193
                              Height = 21
                              DataField = 'DESCR_DOADOR_RECEPTOR'
                              DataSource = dtsDadosFemea
                              TabOrder = 7
                            end
                            object dblcStatus: TDBLookupComboBox
                              Left = 110
                              Top = 108
                              Width = 157
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              BevelInner = bvNone
                              BevelOuter = bvNone
                              BevelKind = bkFlat
                              DataField = 'DESCR_STATUS'
                              DataSource = dtsFicha
                              TabOrder = 4
                            end
                            object deNascimento: TTcDBDateEdit
                              Left = 110
                              Top = 136
                              Width = 120
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
                              TabOrder = 5
                            end
                            object dbchkAnimalDeTerceiro: TDBCheckBox
                              Left = 204
                              Top = 187
                              Width = 150
                              Height = 22
                              Caption = 'Animal de terceiro'
                              DataField = 'ANIMAL_DE_TERCEIRO'
                              DataSource = dtsFicha
                              TabOrder = 9
                              ValueChecked = 'T'
                              ValueUnchecked = 'F'
                            end
                          end
                          object gbxManejo: TGroupBox
                            Left = 433
                            Top = -1
                            Width = 298
                            Height = 142
                            Caption = 'Manejo'
                            TabOrder = 1
                            object Label30: TLabel
                              Left = 17
                              Top = 23
                              Width = 34
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Retiro'
                              FocusControl = dbeRetiro
                            end
                            object Label31: TLabel
                              Left = 19
                              Top = 54
                              Width = 24
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Lote'
                              FocusControl = dbeLote
                            end
                            object Label32: TLabel
                              Left = 9
                              Top = 89
                              Width = 76
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = 'Lotes virtuais'
                              FocusControl = dbeLoteVirtual1
                            end
                            object Label33: TLabel
                              Left = 5
                              Top = 114
                              Width = 7
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = '1'
                              FocusControl = dbeLoteVirtual1
                            end
                            object Label8: TLabel
                              Left = 102
                              Top = 114
                              Width = 7
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = '2'
                              FocusControl = dbeLoteVirtual2
                            end
                            object LinkLabel2: TLabel
                              Left = 155
                              Top = 20
                              Width = 58
                              Height = 13
                              Cursor = crHandPoint
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = '(hist'#243'rico)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clNavy
                              Font.Height = -11
                              Font.Name = 'Verdana'
                              Font.Style = [fsUnderline]
                              ParentFont = False
                              OnClick = LinkLabel2Click
                            end
                            object LinkLabel3: TLabel
                              Left = 155
                              Top = 51
                              Width = 58
                              Height = 13
                              Cursor = crHandPoint
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = '(hist'#243'rico)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clNavy
                              Font.Height = -11
                              Font.Name = 'Verdana'
                              Font.Style = [fsUnderline]
                              ParentFont = False
                              OnClick = LinkLabel3Click
                            end
                            object Label9: TLabel
                              Left = 195
                              Top = 114
                              Width = 7
                              Height = 13
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = '3'
                              FocusControl = dbeLoteVirtual3
                            end
                            object Bevel1: TBevel
                              Left = 91
                              Top = 95
                              Width = 197
                              Height = 1
                              Margins.Left = 0
                              Margins.Top = 0
                              Margins.Right = 0
                              Margins.Bottom = 0
                              Shape = bsTopLine
                            end
                            object LinkLabelHistToque: TLabel
                              Left = 155
                              Top = 75
                              Width = 118
                              Height = 13
                              Cursor = crHandPoint
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              Caption = '(hist'#243'rico de toques)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clNavy
                              Font.Height = -11
                              Font.Name = 'Verdana'
                              Font.Style = [fsUnderline]
                              ParentFont = False
                              OnClick = LinkLabelHistToqueClick
                            end
                            object dbeLote: TDBEdit
                              Left = 62
                              Top = 51
                              Width = 80
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              DataField = 'LOTE'
                              DataSource = dtsDadosFemea
                              TabOrder = 1
                            end
                            object dbeLoteVirtual1: TDBEdit
                              Left = 18
                              Top = 111
                              Width = 59
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              DataField = 'VLOTE1'
                              DataSource = dtsDadosFemea
                              TabOrder = 2
                            end
                            object dbeLoteVirtual2: TDBEdit
                              Left = 117
                              Top = 111
                              Width = 59
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              DataField = 'VLOTE2'
                              DataSource = dtsDadosFemea
                              TabOrder = 3
                            end
                            object dbeLoteVirtual3: TDBEdit
                              Left = 212
                              Top = 111
                              Width = 59
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              DataField = 'VLOTE3'
                              DataSource = dtsDadosFemea
                              TabOrder = 4
                            end
                            object dbeRetiro: TDBEdit
                              Left = 62
                              Top = 20
                              Width = 80
                              Height = 21
                              Margins.Left = 2
                              Margins.Top = 2
                              Margins.Right = 2
                              Margins.Bottom = 2
                              DataField = 'RETIRO'
                              DataSource = dtsDadosFemea
                              TabOrder = 0
                            end
                          end
                          object gbxCrescimento: TGroupBox
                            Left = 8
                            Top = 440
                            Width = 414
                            Height = 60
                            Caption = 'Peso / Altura nascimento'
                            TabOrder = 6
                            object Label10: TLabel
                              Left = 11
                              Top = 32
                              Width = 27
                              Height = 13
                              Caption = 'Peso'
                              FocusControl = dbePeso
                            end
                            object Label11: TLabel
                              Left = 188
                              Top = 32
                              Width = 34
                              Height = 13
                              Caption = 'Altura'
                              FocusControl = dbeAltura
                            end
                            object dbePeso: TDBEdit
                              Left = 52
                              Top = 28
                              Width = 109
                              Height = 21
                              DataField = 'PESO'
                              DataSource = dsCrescimento
                              TabOrder = 0
                            end
                            object dbeAltura: TDBEdit
                              Left = 241
                              Top = 28
                              Width = 93
                              Height = 21
                              DataField = 'ALTURA'
                              DataSource = dsCrescimento
                              TabOrder = 1
                            end
                          end
                        end
                      end
                      object tbsGenealogiaFilhos: TTabSheet
                        Caption = 'Fi&lhos'
                        ImageIndex = 2
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                      end
                      object tbsGenealogiaClassificacao: TTabSheet
                        Caption = 'Class&ifica'#231#227'o'
                        ImageIndex = 3
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                      end
                      object tbsGenealogiaAcasalamento: TTabSheet
                        Caption = 'Acasala&mento'
                        ImageIndex = 4
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                      end
                      object tbsGenealogiaCrescimento: TTabSheet
                        Caption = 'Crescim&ento'
                        ImageIndex = 5
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                      end
                    end
                  end
                  object tbsMainGrafico: TTabSheet
                    Caption = 'Gr'#225'&fico'
                    ImageIndex = 6
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
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
    Top = 623
    Width = 962
    ExplicitTop = 623
    ExplicitWidth = 962
    inherited _imageBottom: TImage
      Width = 962
      ExplicitWidth = 739
    end
    inherited _ToolBar: TToolBar
      Left = 104
      ExplicitLeft = 104
      inherited ToolButton1: TToolButton
        ExplicitWidth = 65
        ExplicitHeight = 52
      end
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
    OnUpdate = _ActionListUpdate
  end
  inherited dtsFicha: TDataSource
    Left = 578
  end
  inherited dtsLista: TDataSource
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
    Left = 414
    Top = 54
  end
  object dtsDadosFemea: TDataSource
    Left = 620
    Top = 24
  end
  object dtsDescartes: TDataSource
    DataSet = Zoo_BancoDadosFemeaDatamodule.cdsDescartes
    Left = 744
    Top = 310
  end
  object dtsTipoDescarte: TDataSource
    Left = 505
    Top = 210
  end
  object ImageList1: TImageList
    Left = 764
    Top = 24
    Bitmap = {
      494C010103000800040110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object dsCrescimento: TDataSource
    DataSet = Zoo_BancoDadosFemeaDatamodule.cdsCrescimento
    Left = 532
    Top = 288
  end
end
