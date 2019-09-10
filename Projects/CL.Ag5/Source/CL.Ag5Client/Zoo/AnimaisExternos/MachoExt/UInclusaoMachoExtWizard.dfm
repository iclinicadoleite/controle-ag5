inherited InclusaoMachoExtWizard: TInclusaoMachoExtWizard
  Left = 444
  Top = 287
  Caption = 'Animais externos - Inclus'#227'o de macho'
  ClientHeight = 445
  ClientWidth = 693
  ExplicitWidth = 699
  ExplicitHeight = 473
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 693
    Height = 445
    ExplicitWidth = 693
    ExplicitHeight = 445
    inherited _pnlFooter: TJvPanel
      Top = 414
      Width = 689
      ExplicitTop = 414
      ExplicitWidth = 689
      inherited _imageBottom: TImage
        Width = 689
        ExplicitWidth = 689
      end
      inherited _btbPrior: TTcGDIButton
        Left = 498
        ExplicitLeft = 498
      end
      inherited _btbNext: TTcGDIButton
        Left = 589
        ExplicitLeft = 589
      end
      inherited _btbExecute: TTcGDIButton
        Left = 604
        ExplicitLeft = 604
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 689
      Height = 412
      ExplicitWidth = 689
      ExplicitHeight = 412
      inherited PageControl: TJvPageControl
        Width = 689
        Height = 412
        ActivePage = TabSheet1
        ExplicitWidth = 689
        ExplicitHeight = 412
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label24: TLabel
            Left = 330
            Top = 9
            Width = 40
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
            Top = 89
            Width = 55
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
            Top = 9
            Width = 33
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
            Top = 37
            Width = 27
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
            Top = 62
            Width = 31
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
            TabOrder = 2
          end
          object JvDBDateEdit2: TTcDBDateEdit
            Left = 102
            Top = 86
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
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ButtonWidth = 24
            ParentFont = False
            TabOrder = 5
          end
          object LinkLabel1: TLinkLabel
            Left = 223
            Top = 9
            Width = 71
            Height = 17
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '(<a>Ver hist'#243'rico</a>)'
            TabOrder = 1
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
            Top = 33
            Width = 355
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'NOMECOMPLETO'
            DataSource = dtsFicha
            TabOrder = 3
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 102
            Top = 60
            Width = 115
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'DESCR_STATUS'
            DataSource = dtsFicha
            TabOrder = 4
          end
          object GroupBox1: TGroupBox
            Left = 7
            Top = 112
            Width = 388
            Height = 97
            Caption = 'Origem'
            TabOrder = 6
            object Label26: TLabel
              Left = 17
              Top = 15
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
              Top = 37
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
              Top = 65
              Width = 82
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Pre'#231'o de Compra'
            end
            object JvDBDateEdit1: TTcDBDateEdit
              Left = 110
              Top = 12
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
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 24
              ParentFont = False
              TabOrder = 0
            end
            object DBEdit7: TDBEdit
              Left = 109
              Top = 37
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
              Left = 110
              Top = 63
              Width = 121
              Height = 21
              ShowButton = False
              TabOrder = 2
              DecimalPlacesAlwaysShown = False
              DataField = 'PRECO_COMPRA'
              DataSource = dtsFicha
            end
          end
          object GroupBox2: TGroupBox
            Left = 424
            Top = 112
            Width = 221
            Height = 91
            Caption = 'Estoque'
            TabOrder = 7
            object Label3: TLabel
              Left = 16
              Top = 18
              Width = 52
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Qtde inicial'
              FocusControl = JvDBDateEdit1
            end
            object JvDBCalcEdit1: TJvDBCalcEdit
              Left = 78
              Top = 17
              Width = 116
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
          end
          object GroupBox3: TGroupBox
            Left = 8
            Top = 212
            Width = 324
            Height = 97
            Caption = 'Pedigree'
            TabOrder = 8
            object Label49: TLabel
              Left = 17
              Top = 22
              Width = 14
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Pai'
            end
            object Label50: TLabel
              Left = 17
              Top = 46
              Width = 20
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'M'#227'e'
            end
            object Label29: TLabel
              Left = 13
              Top = 102
              Width = 24
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Ra'#231'a'
              FocusControl = DBLookupComboBox2
              Visible = False
            end
            object Label4: TLabel
              Left = 10
              Top = 71
              Width = 77
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Grau de Sangue'
            end
            object Label5: TLabel
              Left = 226
              Top = 5
              Width = 74
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'GS/Composi'#231#227'o'
            end
            object edPai: TJvDBComboEdit
              Left = 53
              Top = 19
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
              Top = 43
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
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 53
              Top = 97
              Width = 259
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESCR_RACA'
              DataSource = dtsFicha
              TabOrder = 2
              Visible = False
            end
            object dbxGrauSangue: TDBComboBox
              Left = 102
              Top = 68
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
              TabOrder = 3
              OnKeyPress = dbxGrauSangueKeyPress
            end
            object dbEdtComposicaoRaca: TJvDBComboEdit
              Left = 184
              Top = 68
              Width = 128
              Height = 21
              DataField = 'COMPOSICAORACA'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              ButtonWidth = 15
              ReadOnly = True
              TabOrder = 4
              OnButtonClick = dbEdtComposicaoRacaButtonClick
              OnKeyPress = dbEdtComposicaoRacaKeyPress
            end
            object DBEdit6: TDBEdit
              Left = 227
              Top = 20
              Width = 92
              Height = 21
              TabStop = False
              DataField = 'GSR_PAI'
              DataSource = dtsLinhagem
              TabOrder = 5
            end
            object DBEdit8: TDBEdit
              Left = 227
              Top = 43
              Width = 92
              Height = 21
              TabStop = False
              DataField = 'GSR_MAE'
              DataSource = dtsLinhagem
              TabOrder = 6
            end
          end
          object dbchkOriginadoEmbriao: TDBCheckBox
            Left = 248
            Top = 88
            Width = 147
            Height = 17
            Caption = 'Originado de embri'#227'o'
            DataField = 'ORIGINADO_DE_EMBRIAO'
            DataSource = dtsFicha
            TabOrder = 9
            ValueChecked = 'T'
            ValueUnchecked = 'F'
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actExecute: TAction
      Caption = '&Salvar'
    end
  end
  object dtsLista: TDataSource
    AutoEdit = False
    DataSet = Zoo_AnimaisExternosMachoDatamodule.cdsLstMachos
    Left = 539
    Top = 24
  end
  object dtsFicha: TDataSource
    DataSet = Zoo_AnimaisExternosMachoDatamodule.cdsAnimal
    Left = 579
    Top = 24
  end
  object dtsDadosMacho: TDataSource
    DataSet = Zoo_AnimaisExternosMachoDatamodule.cdsDadosMacho
    Left = 631
    Top = 24
  end
  object dtsLinhagem: TDataSource
    DataSet = Zoo_AnimaisExternosMachoDatamodule.cdsLinhagem
    Left = 642
    Top = 58
  end
end
