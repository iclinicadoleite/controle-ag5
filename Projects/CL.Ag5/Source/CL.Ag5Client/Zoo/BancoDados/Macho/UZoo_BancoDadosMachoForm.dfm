inherited Zoo_BancoDadosMachoForm: TZoo_BancoDadosMachoForm
  Left = 278
  Top = 165
  Caption = 'Machos'
  ClientHeight = 651
  ClientWidth = 981
  OnShow = TcMPFormShow
  ActionList.OnExecute = _ActionListExecute
  ExplicitWidth = 997
  ExplicitHeight = 690
  PixelsPerInch = 96
  TextHeight = 13
  object _PnlForm: TPanel [0]
    Left = 0
    Top = 0
    Width = 981
    Height = 586
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    Caption = ' '
    Color = clNavy
    ParentBackground = False
    TabOrder = 2
  end
  inherited _pageControl: TPageControl
    Width = 981
    Height = 586
    ActivePage = _tbsFicha
    ExplicitWidth = 981
    ExplicitHeight = 586
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 973
      ExplicitHeight = 558
      inherited _pnlSearch: TPanel
        Width = 973
        ExplicitWidth = 973
        inherited _edtSearch: TJvComboEdit
          Top = 7
          ParentFont = False
          ExplicitTop = 7
        end
        object cbxExibirDescartados1: TCheckBox
          Left = 320
          Top = 6
          Width = 185
          Height = 17
          Caption = 'Exibir descartados/inativos'
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
        Width = 973
        Height = 520
        ExplicitWidth = 973
        ExplicitHeight = 520
        inherited _dbgLista: TJvDBUltimGrid
          Width = 969
          Height = 516
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
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMECOMPLETO'
              Width = 181
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGISTRO'
              Width = 135
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCR_STATUS'
              Width = 179
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE_SEMEN'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INSEMINACOES'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRENHEZES'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LACTACOES'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UI'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DI'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UU'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DU'
              Width = 46
              Visible = True
            end>
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 973
      ExplicitHeight = 558
      inherited _pnlFicha: TPanel
        Width = 973
        Height = 558
        Constraints.MinHeight = 213
        ExplicitWidth = 973
        ExplicitHeight = 558
        inherited _ScrollBoxFicha: TScrollBox
          Width = 973
          Height = 558
          AutoScroll = False
          ExplicitWidth = 973
          ExplicitHeight = 558
          inherited _pnlScroll: TPanel
            Width = 973
            Height = 558
            ExplicitWidth = 973
            ExplicitHeight = 558
            object Splitter1: TSplitter
              Left = 140
              Top = 0
              Width = 6
              Height = 558
              ExplicitLeft = 65
              ExplicitHeight = 353
            end
            object pgcMain: TJvPageControl
              Left = 146
              Top = 0
              Width = 827
              Height = 558
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ActivePage = tbsMainCadastro
              Align = alClient
              OwnerDraw = True
              Style = tsButtons
              TabOrder = 0
              TabWidth = 155
              OnChange = pgcMainChange
              TabPainter = JvTabDefaultPainter1
              object tbsMainCadastro: TTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Cadastro'
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
                object Label36: TLabel
                  Left = 8
                  Top = 72
                  Width = 36
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Status'
                end
                object Label1: TLabel
                  Left = 211
                  Top = 104
                  Width = 33
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Idade'
                  FocusControl = JvDBDateEdit2
                end
                object LinkLabel1: TLabel
                  Left = 231
                  Top = 9
                  Width = 58
                  Height = 13
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
                object DBEdit4: TDBEdit
                  Left = 392
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
                  Top = 101
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
                  TabOrder = 5
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
                  Top = 38
                  Width = 362
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'NOMECOMPLETO'
                  DataSource = dtsFicha
                  TabOrder = 2
                end
                object DBEdit5: TDBEdit
                  Left = 252
                  Top = 101
                  Width = 36
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'IDADE'
                  DataSource = dtsDadosMacho
                  TabOrder = 6
                end
                object DBLookupComboBox1: TDBLookupComboBox
                  Left = 102
                  Top = 68
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
                object GroupBox1: TGroupBox
                  Left = 7
                  Top = 162
                  Width = 403
                  Height = 107
                  Caption = 'Origem'
                  TabOrder = 8
                  object Label26: TLabel
                    Left = 17
                    Top = 20
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
                    Left = 17
                    Top = 49
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
                    Left = 17
                    Top = 79
                    Width = 100
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Pre'#231'o de Compra'
                  end
                  object JvDBDateEdit1: TTcDBDateEdit
                    Left = 110
                    Top = 16
                    Width = 112
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
                    Left = 109
                    Top = 46
                    Width = 264
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DataField = 'LOCAL_ORIGEM'
                    DataSource = dtsFicha
                    TabOrder = 1
                  end
                  object JvDBCalcEdit2: TJvDBCalcEdit
                    Left = 129
                    Top = 76
                    Width = 121
                    Height = 21
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    DataField = 'PRECO_COMPRA'
                    DataSource = dtsFicha
                  end
                end
                object gbxEstoque: TGroupBox
                  Left = 431
                  Top = 121
                  Width = 287
                  Height = 148
                  Caption = 'Estoque'
                  TabOrder = 9
                  object Label3: TLabel
                    Left = 12
                    Top = 54
                    Width = 88
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Qtde comprada'
                    FocusControl = JvDBDateEdit1
                  end
                  object Label4: TLabel
                    Left = 12
                    Top = 23
                    Width = 63
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Qtde inicial'
                    FocusControl = JvDBDateEdit1
                  end
                  object Label5: TLabel
                    Left = 13
                    Top = 116
                    Width = 98
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Qtde em estoque'
                    FocusControl = JvDBDateEdit1
                  end
                  object Label6: TLabel
                    Left = 12
                    Top = 85
                    Width = 78
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Qtde utilizada'
                    FocusControl = JvDBDateEdit1
                  end
                  object JvDBCalcEdit1: TJvDBCalcEdit
                    Left = 149
                    Top = 51
                    Width = 107
                    Height = 21
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 1
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDECOMPRADA_SEMEN'
                    DataSource = dtsDadosMacho
                  end
                  object JvDBCalcEdit3: TJvDBCalcEdit
                    Left = 149
                    Top = 20
                    Width = 107
                    Height = 21
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    ShowButton = False
                    TabOrder = 0
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDEINICIAL_SEMEN'
                    DataSource = dtsDadosMacho
                  end
                  object JvDBCalcEdit4: TJvDBCalcEdit
                    Left = 149
                    Top = 113
                    Width = 107
                    Height = 21
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 3
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDE_SEMEN'
                    DataSource = dtsDadosMacho
                  end
                  object JvDBCalcEdit5: TJvDBCalcEdit
                    Left = 149
                    Top = 82
                    Width = 107
                    Height = 21
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 2
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDEUTILIZADA_SEMEN'
                    DataSource = dtsDadosMacho
                  end
                end
                object GroupBox3: TGroupBox
                  Left = 8
                  Top = 282
                  Width = 405
                  Height = 148
                  Caption = 'Pedigree'
                  TabOrder = 10
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
                  object Label9: TLabel
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
                    Left = 16
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
                  object Label20: TLabel
                    Left = 10
                    Top = 105
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
                    Left = 53
                    Top = 70
                    Width = 200
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
                    Left = 277
                    Top = 36
                    Width = 107
                    Height = 21
                    TabStop = False
                    DataField = 'GSR_PAI'
                    DataSource = dtsLinhagem
                    ReadOnly = True
                    TabOrder = 2
                  end
                  object DBEdit16: TDBEdit
                    Left = 277
                    Top = 66
                    Width = 107
                    Height = 21
                    TabStop = False
                    DataField = 'GSR_MAE'
                    DataSource = dtsLinhagem
                    ReadOnly = True
                    TabOrder = 3
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 53
                    Top = 125
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
                    Left = 112
                    Top = 102
                    Width = 141
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
                    Left = 277
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
                end
                object dbchkOriginadoEmbriao: TDBCheckBox
                  Left = 8
                  Top = 135
                  Width = 147
                  Height = 17
                  Caption = 'Originado de embri'#227'o'
                  DataField = 'ORIGINADO_DE_EMBRIAO'
                  DataSource = dtsFicha
                  TabOrder = 12
                  ValueChecked = 'T'
                  ValueUnchecked = 'F'
                end
                object gbxDescarte: TGroupBox
                  Left = 431
                  Top = 282
                  Width = 287
                  Height = 146
                  Caption = 'Descarte'
                  TabOrder = 11
                  object Label34: TLabel
                    Left = 20
                    Top = 129
                    Width = 35
                    Height = 13
                    Caption = 'Raz'#227'o'
                    FocusControl = DBLookupComboBox4
                    Visible = False
                  end
                  object Label37: TLabel
                    Left = 11
                    Top = 51
                    Width = 37
                    Height = 13
                    Caption = 'Motivo'
                  end
                  object Label38: TLabel
                    Left = 11
                    Top = 82
                    Width = 99
                    Height = 13
                    Caption = 'Nome comprador'
                    FocusControl = DBEdit2
                  end
                  object Label39: TLabel
                    Left = 11
                    Top = 111
                    Width = 68
                    Height = 13
                    Caption = 'Valor venda'
                    FocusControl = DBEdit2
                  end
                  object Label40: TLabel
                    Left = 11
                    Top = 23
                    Width = 27
                    Height = 13
                    Caption = 'Data'
                    FocusControl = DBLookupComboBox4
                  end
                  object DBLookupComboBox4: TDBLookupComboBox
                    Left = 69
                    Top = 127
                    Width = 150
                    Height = 21
                    DataField = 'DESCR_RAZAO'
                    DataSource = dtsDescartes
                    TabOrder = 2
                    Visible = False
                  end
                  object DBEdit2: TDBEdit
                    Left = 117
                    Top = 79
                    Width = 150
                    Height = 21
                    DataField = 'NOMECOMPRADOR'
                    DataSource = dtsDescartes
                    TabOrder = 3
                  end
                  object JvDBCalcEdit12: TJvDBCalcEdit
                    Left = 117
                    Top = 108
                    Width = 121
                    Height = 21
                    TabOrder = 4
                    DecimalPlacesAlwaysShown = False
                    DataField = 'PRECOVENDA'
                    DataSource = dtsDescartes
                  end
                  object TcMPDBDateEdit1: TTcDBDateEdit
                    Left = 117
                    Top = 19
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
                    TabOrder = 0
                  end
                  object DBMemo1: TDBMemo
                    Left = 161
                    Top = 115
                    Width = 245
                    Height = 91
                    TabOrder = 5
                    Visible = False
                  end
                  object JvDBComboBox1: TJvDBComboBox
                    Left = 117
                    Top = 48
                    Width = 150
                    Height = 22
                    Style = csOwnerDrawVariable
                    DataField = 'MOTIVO'
                    DataSource = dtsDescartes
                    TabOrder = 1
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
                object cbxSememAtivo: TDBCheckBox
                  Left = 252
                  Top = 70
                  Width = 113
                  Height = 17
                  Caption = 'Ativo'
                  DataField = 'DS_ATIVO'
                  DataSource = dtsDadosMacho
                  TabOrder = 4
                  ValueChecked = 'T'
                  ValueUnchecked = 'F'
                end
                object gbxManejo: TGroupBox
                  Left = 431
                  Top = 65
                  Width = 287
                  Height = 52
                  Caption = 'Manejo'
                  TabOrder = 7
                  object Label30: TLabel
                    Left = 8
                    Top = 20
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
                    Left = 152
                    Top = 20
                    Width = 24
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Lote'
                    FocusControl = dbeLote
                  end
                  object dbeRetiro: TDBEdit
                    Left = 53
                    Top = 20
                    Width = 80
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DataField = 'RETIRO'
                    DataSource = dtsDadosMacho
                    TabOrder = 0
                  end
                  object dbeLote: TDBEdit
                    Left = 195
                    Top = 20
                    Width = 80
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DataField = 'LOTE'
                    DataSource = dtsDadosMacho
                    TabOrder = 1
                  end
                end
                object dbchkAnimalDeTerceiro: TDBCheckBox
                  Left = 200
                  Top = 133
                  Width = 150
                  Height = 22
                  Caption = 'Animal de terceiro'
                  DataField = 'ANIMAL_DE_TERCEIRO'
                  DataSource = dtsFicha
                  TabOrder = 13
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
              object tbsSemen: TTabSheet
                Caption = 'S'#234'men'
                ImageIndex = 5
                object GroupBox4: TGroupBox
                  Left = 3
                  Top = 9
                  Width = 219
                  Height = 217
                  Caption = 'Caracteristicas'
                  TabOrder = 0
                  object Label10: TLabel
                    Left = 15
                    Top = 134
                    Width = 115
                    Height = 13
                    Caption = 'Facilidade parto (%)'
                    FocusControl = DBEdit10
                  end
                  object Label12: TLabel
                    Left = 104
                    Top = 20
                    Width = 27
                    Height = 13
                    Caption = 'Leite'
                    FocusControl = DBEdit12
                  end
                  object Label13: TLabel
                    Left = 63
                    Top = 106
                    Width = 68
                    Height = 13
                    Caption = 'Perna e p'#233's'
                    FocusControl = DBEdit13
                  end
                  object Label14: TLabel
                    Left = 107
                    Top = 48
                    Width = 24
                    Height = 13
                    Caption = 'Tipo'
                    FocusControl = DBEdit14
                  end
                  object Label15: TLabel
                    Left = 97
                    Top = 77
                    Width = 34
                    Height = 13
                    Caption = #218'bere'
                    FocusControl = DBEdit15
                  end
                  object Label2: TLabel
                    Left = 84
                    Top = 163
                    Width = 47
                    Height = 13
                    Caption = 'Gordura'
                    FocusControl = JvDBCalcEdit10
                  end
                  object Label22: TLabel
                    Left = 84
                    Top = 192
                    Width = 47
                    Height = 13
                    Caption = 'Prote'#237'na'
                    FocusControl = JvDBCalcEdit11
                  end
                  object DBEdit10: TJvDBCalcEdit
                    Left = 142
                    Top = 131
                    Width = 71
                    Height = 21
                    MaxValue = 100.000000000000000000
                    ShowButton = False
                    TabOrder = 4
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'DS_FACILIDADEPARTO'
                    DataSource = dtsDadosMacho
                  end
                  object DBEdit12: TJvDBCalcEdit
                    Left = 142
                    Top = 17
                    Width = 71
                    Height = 21
                    ShowButton = False
                    TabOrder = 0
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'DS_LEITE'
                    DataSource = dtsDadosMacho
                  end
                  object DBEdit13: TJvDBCalcEdit
                    Left = 142
                    Top = 103
                    Width = 71
                    Height = 21
                    ShowButton = False
                    TabOrder = 3
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'DS_PERNAPE'
                    DataSource = dtsDadosMacho
                  end
                  object DBEdit14: TJvDBCalcEdit
                    Left = 142
                    Top = 45
                    Width = 71
                    Height = 21
                    ShowButton = False
                    TabOrder = 1
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'DS_TIPO'
                    DataSource = dtsDadosMacho
                  end
                  object DBEdit15: TJvDBCalcEdit
                    Left = 142
                    Top = 74
                    Width = 71
                    Height = 21
                    ShowButton = False
                    TabOrder = 2
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'DS_UBERE'
                    DataSource = dtsDadosMacho
                  end
                  object JvDBCalcEdit10: TJvDBCalcEdit
                    Left = 142
                    Top = 160
                    Width = 71
                    Height = 21
                    ShowButton = False
                    TabOrder = 5
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'DS_GORDURA'
                    DataSource = dtsDadosMacho
                  end
                  object JvDBCalcEdit11: TJvDBCalcEdit
                    Left = 142
                    Top = 189
                    Width = 71
                    Height = 21
                    ShowButton = False
                    TabOrder = 6
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'DS_PROTEINA'
                    DataSource = dtsDadosMacho
                  end
                end
                object GroupBox5: TGroupBox
                  Left = 234
                  Top = 9
                  Width = 193
                  Height = 130
                  Caption = 'Estoque'
                  TabOrder = 1
                  object Label16: TLabel
                    Left = 18
                    Top = 48
                    Width = 88
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Qtde comprada'
                    FocusControl = JvDBDateEdit1
                  end
                  object Label17: TLabel
                    Left = 43
                    Top = 20
                    Width = 63
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Qtde inicial'
                    FocusControl = JvDBDateEdit1
                  end
                  object Label18: TLabel
                    Left = 8
                    Top = 106
                    Width = 98
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Qtde em estoque'
                    FocusControl = JvDBDateEdit1
                  end
                  object Label19: TLabel
                    Left = 28
                    Top = 77
                    Width = 78
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Qtde utilizada'
                    FocusControl = JvDBDateEdit1
                  end
                  object JvDBCalcEdit6: TJvDBCalcEdit
                    Left = 121
                    Top = 45
                    Width = 61
                    Height = 21
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 1
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDECOMPRADA_SEMEN'
                    DataSource = dtsDadosMacho
                  end
                  object JvDBCalcEdit7: TJvDBCalcEdit
                    Left = 121
                    Top = 17
                    Width = 61
                    Height = 21
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    ShowButton = False
                    TabOrder = 0
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDEINICIAL_SEMEN'
                    DataSource = dtsDadosMacho
                  end
                  object JvDBCalcEdit8: TJvDBCalcEdit
                    Left = 121
                    Top = 103
                    Width = 61
                    Height = 21
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 3
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDE_SEMEN'
                    DataSource = dtsDadosMacho
                  end
                  object JvDBCalcEdit9: TJvDBCalcEdit
                    Left = 121
                    Top = 74
                    Width = 61
                    Height = 21
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 2
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDEUTILIZADA_SEMEN'
                    DataSource = dtsDadosMacho
                  end
                end
                object GroupBox6: TGroupBox
                  Left = 434
                  Top = 9
                  Width = 219
                  Height = 130
                  Caption = 'Localiza'#231#227'o'
                  TabOrder = 2
                  object Label7: TLabel
                    Left = 12
                    Top = 20
                    Width = 40
                    Height = 13
                    Caption = 'Botij'#227'o'
                    FocusControl = DBEdit6
                  end
                  object Label8: TLabel
                    Left = 9
                    Top = 48
                    Width = 43
                    Height = 13
                    Caption = 'Caneca'
                    FocusControl = DBEdit8
                  end
                  object Label11: TLabel
                    Left = 24
                    Top = 77
                    Width = 28
                    Height = 13
                    Caption = 'Hack'
                  end
                  object DBEdit6: TDBEdit
                    Left = 61
                    Top = 17
                    Width = 103
                    Height = 21
                    DataField = 'DS_BOTIJAO'
                    DataSource = dtsDadosMacho
                    TabOrder = 0
                  end
                  object DBEdit8: TDBEdit
                    Left = 61
                    Top = 45
                    Width = 103
                    Height = 21
                    DataField = 'DS_CANECA'
                    DataSource = dtsDadosMacho
                    TabOrder = 1
                  end
                  object DBEdit11: TDBEdit
                    Left = 61
                    Top = 74
                    Width = 153
                    Height = 21
                    DataField = 'DS_HACK'
                    DataSource = dtsDadosMacho
                    TabOrder = 2
                  end
                end
              end
              object tbsCrescimento: TTabSheet
                Caption = 'Crescimento'
                ImageIndex = 6
                object Panel2: TPanel
                  Left = 0
                  Top = 0
                  Width = 819
                  Height = 527
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Align = alLeft
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  BevelOuter = bvNone
                  BorderWidth = 1
                  Caption = ' '
                  Color = clSilver
                  ParentBackground = False
                  TabOrder = 0
                  object dbgCrescimento: TJvDBUltimGrid
                    Left = 1
                    Top = 1
                    Width = 817
                    Height = 525
                    Align = alClient
                    DataSource = dtsCrescimento
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clBlack
                    TitleFont.Height = -11
                    TitleFont.Name = 'Verdana'
                    TitleFont.Style = []
                    OnKeyDown = dbgCrescimentoKeyDown
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <
                      item
                        ControlName = 'deDataCrescimento'
                        FieldName = 'DATA'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'dbMemoCrescimento'
                        FieldName = 'OBSERVACAO'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'DATA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PESO'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ALTURA'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'IDADE'
                        ReadOnly = True
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'GANHOPESO'
                        ReadOnly = True
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OBSERVACAO'
                        Width = 100
                        Visible = True
                      end>
                  end
                  object deDataCrescimento: TTcDBDateEdit
                    Left = 64
                    Top = 103
                    Width = 98
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Checked = False
                    DataField = 'DATA'
                    DataSource = dtsCrescimento
                    CheckOnExit = False
                    Color = clSilver
                    ButtonWidth = 17
                    TabOrder = 1
                    Visible = False
                  end
                  object dbMemoCrescimento: TDBMemo
                    Left = 363
                    Top = 59
                    Width = 186
                    Height = 89
                    DataField = 'OBSERVACAO'
                    DataSource = dtsCrescimento
                    TabOrder = 2
                    Visible = False
                  end
                end
              end
              object tbsSanidade: TTabSheet
                Caption = 'Sanidade'
                ImageIndex = 4
                object Panel3: TPanel
                  Left = 0
                  Top = 0
                  Width = 819
                  Height = 527
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Align = alLeft
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  BevelOuter = bvNone
                  BorderWidth = 1
                  Caption = ' '
                  Color = clSilver
                  ParentBackground = False
                  TabOrder = 0
                  object dbgSanidade: TJvDBUltimGrid
                    Left = 1
                    Top = 1
                    Width = 817
                    Height = 525
                    Align = alClient
                    DataSource = dtsSanidade
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clBlack
                    TitleFont.Height = -11
                    TitleFont.Name = 'Verdana'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <
                      item
                        ControlName = 'deDataSanidade'
                        FieldName = 'DATA'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'dbMemoSanidade'
                        FieldName = 'OCORRENCIA'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'DATA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OCORRENCIA'
                        Width = 100
                        Visible = True
                      end>
                  end
                  object deDataSanidade: TTcDBDateEdit
                    Left = 64
                    Top = 103
                    Width = 98
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Checked = False
                    DataField = 'DATA'
                    DataSource = dtsSanidade
                    CheckOnExit = False
                    Color = clSilver
                    ButtonWidth = 17
                    TabOrder = 1
                    Visible = False
                  end
                  object dbMemoSanidade: TDBMemo
                    Left = 363
                    Top = 59
                    Width = 186
                    Height = 89
                    DataField = 'OCORRENCIA'
                    DataSource = dtsSanidade
                    TabOrder = 2
                    Visible = False
                  end
                end
              end
              object tbsCompra: TTabSheet
                Caption = 'Hist'#243'rico de compra'
                ImageIndex = 3
                object Panel4: TPanel
                  Left = 0
                  Top = 0
                  Width = 818
                  Height = 527
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Align = alLeft
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  BevelOuter = bvNone
                  BorderWidth = 1
                  Caption = ' '
                  Color = clSilver
                  ParentBackground = False
                  TabOrder = 0
                  object dbgCompra: TJvDBUltimGrid
                    Left = 1
                    Top = 1
                    Width = 816
                    Height = 525
                    Align = alClient
                    DataSource = dtsCompra
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clBlack
                    TitleFont.Height = -11
                    TitleFont.Name = 'Verdana'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <
                      item
                        ControlName = 'edDataCompraSemen'
                        FieldName = 'DATA'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'edDoses'
                        FieldName = 'DOSES'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'edValorDose'
                        FieldName = 'VALORDOSE'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'DATA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DOSES'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALORDOSE'
                        Width = 64
                        Visible = True
                      end>
                  end
                  object edValorDose: TTcDBCalcEdit
                    Left = 96
                    Top = 48
                    Width = 121
                    Height = 21
                    Checked = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                    Visible = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'VALORDOSE'
                    DataSource = dtsCompra
                  end
                  object edDoses: TTcDBCalcEdit
                    Left = 260
                    Top = 48
                    Width = 121
                    Height = 21
                    Checked = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                    Visible = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'DOSES'
                    DataSource = dtsCompra
                  end
                  object edDataCompraSemen: TTcDBDateEdit
                    Left = 88
                    Top = 88
                    Width = 120
                    Height = 21
                    Checked = False
                    DataField = 'DATA'
                    DataSource = dtsCompra
                    CheckOnExit = False
                    Color = clSilver
                    TabOrder = 3
                    Visible = False
                  end
                end
              end
              object tbsMontaUtilizacao: TTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Hist'#243'rico de utiliza'#231#227'o'
                ImageIndex = 3
              end
            end
            object _pnldbgLista2: TPanel
              Left = 0
              Top = 0
              Width = 140
              Height = 558
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
                Top = 124
                Width = 138
                Height = 433
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
                  Width = 121
                  Height = 17
                  Caption = 'Exibir descartados/inativos'
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
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 586
    Width = 981
    ExplicitTop = 586
    ExplicitWidth = 981
    inherited _imageBottom: TImage
      Width = 981
      ExplicitWidth = 815
    end
    inherited _ToolBar: TToolBar
      Left = 112
      ExplicitLeft = 112
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
  inherited dtsLista: TDataSource [3]
    OnDataChange = dtsListaDataChange
    Left = 275
    Top = 65533
  end
  inherited _popMenuPrint: TPopupMenu [4]
  end
  inherited dtsFicha: TDataSource [5]
    OnDataChange = dtsFichaDataChange
    Left = 323
    Top = 65533
  end
  inherited ActionList: TInternalActionList [6]
    OnExecute = _ActionListExecute
  end
  object dtsDadosMacho: TDataSource
    DataSet = Zoo_BancoDadosMachoDatamodule.cdsDadosMacho
    Left = 371
    Top = 65533
  end
  object dtsLinhagem: TDataSource
    DataSet = Zoo_BancoDadosMachoDatamodule.cdsLinhagem
    Left = 426
    Top = 1
  end
  object dtsCrescimento: TDataSource
    DataSet = Zoo_BancoDadosMachoDatamodule.cdsCrescimento
    Left = 476
    Top = 65533
  end
  object dtsSanidade: TDataSource
    DataSet = Zoo_BancoDadosMachoDatamodule.cdsSanidade
    Left = 532
    Top = 1
  end
  object dtsCompra: TDataSource
    DataSet = Zoo_BancoDadosMachoDatamodule.cdsCompras
    Left = 576
    Top = 5
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
    Top = 53
  end
  object dtsDescartes: TDataSource
    DataSet = Zoo_BancoDadosMachoDatamodule.cdsDescartes
    Left = 744
    Top = 310
  end
  object dtsTipoDescarte: TDataSource
    Left = 709
    Top = 310
  end
  object ImageList1: TImageList
    Left = 764
    Top = 24
    Bitmap = {
      494C010103000800100110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
