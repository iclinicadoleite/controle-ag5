inherited InclusaoFemeaWizard: TInclusaoFemeaWizard
  Left = 436
  Top = 78
  Caption = 'Inclus'#227'o de f'#234'mea'
  ClientHeight = 401
  ClientWidth = 727
  ActionList.Left = 90
  ActionList.Top = 4
  ExplicitWidth = 733
  ExplicitHeight = 430
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 727
    Height = 401
    ExplicitWidth = 727
    ExplicitHeight = 401
    inherited _pnlFooter: TJvPanel
      Top = 370
      Width = 723
      ExplicitTop = 370
      ExplicitWidth = 723
      inherited _imageBottom: TImage
        Width = 723
        ExplicitWidth = 723
      end
      inherited _btbPrior: TTcGDIButton
        Left = 532
        ExplicitLeft = 532
      end
      inherited _btbNext: TTcGDIButton
        Left = 623
        ExplicitLeft = 623
      end
      inherited _btbExecute: TTcGDIButton
        Left = 638
        ExplicitLeft = 638
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 723
      Height = 368
      ExplicitWidth = 723
      ExplicitHeight = 368
      inherited PageControl: TJvPageControl
        Width = 723
        Height = 368
        ActivePage = TabSheet1
        ExplicitWidth = 723
        ExplicitHeight = 368
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object gbxOrigem: TGroupBox
            Left = 12
            Top = 196
            Width = 379
            Height = 110
            Caption = 'Origem'
            TabOrder = 3
            object Label26: TLabel
              Left = 17
              Top = 21
              Width = 23
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
              Top = 51
              Width = 24
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
              Top = 78
              Width = 82
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Pre'#231'o de Compra'
            end
            object DBEdit7: TDBEdit
              Left = 58
              Top = 48
              Width = 259
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
              Left = 58
              Top = 18
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
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 24
              ParentFont = False
              TabOrder = 0
            end
            object JvDBCalcEdit2: TJvDBCalcEdit
              Left = 123
              Top = 75
              Width = 121
              Height = 21
              ShowButton = False
              TabOrder = 2
              DecimalPlacesAlwaysShown = False
              DataField = 'PRECO_COMPRA'
              DataSource = dtsFicha
            end
          end
          object gbxPedigree: TGroupBox
            Left = 394
            Top = 196
            Width = 324
            Height = 110
            Caption = 'Pedigree'
            TabOrder = 4
            object Label49: TLabel
              Left = 21
              Top = 26
              Width = 14
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Pai'
            end
            object Label50: TLabel
              Left = 15
              Top = 50
              Width = 20
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'M'#227'e'
            end
            object Label3: TLabel
              Left = 11
              Top = 108
              Width = 24
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Ra'#231'a'
              FocusControl = DBLookupComboBox4
              Visible = False
            end
            object Label4: TLabel
              Left = 10
              Top = 74
              Width = 77
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Grau de Sangue'
              FocusControl = DBLookupComboBox4
            end
            object Label5: TLabel
              Left = 226
              Top = 8
              Width = 74
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'GS/Composi'#231#227'o'
              FocusControl = DBLookupComboBox4
            end
            object edPai: TJvDBComboEdit
              Left = 52
              Top = 23
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
              Top = 47
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
              Top = 71
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
              Top = 71
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
            object DBLookupComboBox4: TDBLookupComboBox
              Left = 52
              Top = 106
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
              Left = 227
              Top = 23
              Width = 92
              Height = 21
              TabStop = False
              DataField = 'GSR_PAI'
              DataSource = dtsLinhagem
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit8: TDBEdit
              Left = 227
              Top = 47
              Width = 92
              Height = 21
              TabStop = False
              DataField = 'GSR_MAE'
              DataSource = dtsLinhagem
              ReadOnly = True
              TabOrder = 3
            end
          end
          object gbxDadosCadastrais: TGroupBox
            Left = 0
            Top = -1
            Width = 463
            Height = 193
            Caption = 'Dados cadastrais'
            TabOrder = 0
            object Label1: TLabel
              Left = 231
              Top = 123
              Width = 28
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Idade'
              FocusControl = deNascimento
            end
            object Label2: TLabel
              Left = 16
              Top = 96
              Width = 31
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Status'
              FocusControl = dblcStatus
            end
            object Label21: TLabel
              Left = 16
              Top = 19
              Width = 29
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
              Top = 46
              Width = 27
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Nome'
              FocusControl = dbeNome
            end
            object Label24: TLabel
              Left = 259
              Top = 19
              Width = 40
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Registro'
              FocusControl = dbeRegistro
            end
            object Label25: TLabel
              Left = 16
              Top = 123
              Width = 55
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Nascimento'
              FocusControl = deNascimento
            end
            object Label6: TLabel
              Left = 16
              Top = 72
              Width = 71
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
              Top = 149
              Width = 92
              Height = 13
              Caption = 'Doadora/receptora'
              FocusControl = dblcDoadoraReceptora
            end
            object dbchkOriginadoEmbriao: TDBCheckBox
              Left = 17
              Top = 168
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
              Left = 105
              Top = 16
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
              Left = 269
              Top = 120
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
              Left = 104
              Top = 43
              Width = 282
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
              Left = 104
              Top = 69
              Width = 282
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
              Left = 314
              Top = 16
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
              Left = 128
              Top = 146
              Width = 193
              Height = 21
              DataField = 'DESCR_DOADOR_RECEPTOR'
              DataSource = dtsDadosFemea
              TabOrder = 7
            end
            object dblcStatus: TDBLookupComboBox
              Left = 104
              Top = 93
              Width = 120
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESCR_STATUS'
              DataSource = dtsFicha
              TabOrder = 4
            end
            object deNascimento: TTcDBDateEdit
              Left = 104
              Top = 120
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 24
              ParentFont = False
              TabOrder = 5
            end
          end
          object gbxManejo: TGroupBox
            Left = 472
            Top = -1
            Width = 246
            Height = 122
            Caption = 'Manejo'
            TabOrder = 1
            object Label30: TLabel
              Left = 17
              Top = 21
              Width = 29
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
              Top = 45
              Width = 21
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
              Top = 70
              Width = 64
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Lotes virtuais'
              FocusControl = dbeLoteVirtual1
            end
            object Label33: TLabel
              Left = 9
              Top = 91
              Width = 6
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = '1'
              FocusControl = dbeLoteVirtual1
            end
            object Label8: TLabel
              Left = 87
              Top = 91
              Width = 6
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = '2'
              FocusControl = dbeLoteVirtual2
            end
            object Label9: TLabel
              Left = 167
              Top = 91
              Width = 6
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = '3'
              FocusControl = dbeLoteVirtual3
            end
            object Bevel1: TBevel
              Left = 77
              Top = 77
              Width = 157
              Height = 2
            end
            object dbeLote: TDBEdit
              Left = 62
              Top = 42
              Width = 69
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
              Top = 88
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
              Left = 98
              Top = 88
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
              Left = 176
              Top = 88
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
              Top = 18
              Width = 30
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
          object gbxControleLeiteiro: TGroupBox
            Left = 472
            Top = 123
            Width = 246
            Height = 69
            Caption = 'Controle Leiteiro'
            TabOrder = 2
            object Label7: TLabel
              Left = 19
              Top = 21
              Width = 36
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'SISBOV'
              FocusControl = dbeSISBOV
              Visible = False
            end
            object Label10: TLabel
              Left = 19
              Top = 35
              Width = 18
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
              Top = 32
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
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 90
    Top = 4
    inherited _actExecute: TAction
      Caption = '&Salvar'
    end
  end
  object dtsFicha: TDataSource
    Left = 415
    Top = 16
  end
  object dtsDadosFemea: TDataSource
    Left = 482
    Top = 16
  end
  object dtsLinhagem: TDataSource
    Left = 558
    Top = 14
  end
end
