inherited InclusaoFemeaExtWizard: TInclusaoFemeaExtWizard
  Left = 263
  Top = 154
  Caption = 'Inclus'#227'o de f'#234'mea ( externo )'
  ClientHeight = 401
  ClientWidth = 727
  ExplicitLeft = 263
  ExplicitTop = 154
  ExplicitWidth = 743
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 727
    Height = 401
    ExplicitWidth = 722
    ExplicitHeight = 472
    inherited _pnlFooter: TJvPanel
      Top = 370
      Width = 723
      ExplicitTop = 370
      ExplicitWidth = 718
      inherited _imageBottom: TImage
        Width = 723
        ExplicitWidth = 723
      end
      inherited _btbPrior: TTcGDIButton
        Left = 532
        ExplicitLeft = 527
      end
      inherited _btbNext: TTcGDIButton
        Left = 623
        ExplicitLeft = 618
      end
      inherited _btbExecute: TTcGDIButton
        Left = 638
        ExplicitLeft = 633
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 723
      Height = 368
      ExplicitWidth = 718
      ExplicitHeight = 287
      inherited PageControl: TJvPageControl
        Width = 723
        Height = 368
        ActivePage = TabSheet1
        ExplicitWidth = 718
        ExplicitHeight = 416
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          ExplicitLeft = -1
          ExplicitTop = 22
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label21: TLabel
            Left = 16
            Top = 21
            Width = 29
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Brinco'
            FocusControl = DBEdit1
          end
          object Label52: TLabel
            Left = 433
            Top = 131
            Width = 80
            Height = 13
            Caption = 'Doador/receptor'
            FocusControl = DBLookupComboBox3
          end
          object Label2: TLabel
            Left = 16
            Top = 105
            Width = 31
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Status'
            FocusControl = DBLookupComboBox1
          end
          object Label33: TLabel
            Left = 433
            Top = 105
            Width = 43
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Rebanho'
            FocusControl = DBEdit13
          end
          object Label32: TLabel
            Left = 433
            Top = 78
            Width = 32
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'N'#250'cleo'
            FocusControl = DBEdit12
          end
          object Label31: TLabel
            Left = 434
            Top = 51
            Width = 21
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Lote'
            FocusControl = DBEdit11
          end
          object Label30: TLabel
            Left = 433
            Top = 21
            Width = 29
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Retiro'
            FocusControl = DBEdit10
          end
          object Label23: TLabel
            Left = 16
            Top = 51
            Width = 27
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Nome'
            FocusControl = DBEdit3
          end
          object Label25: TLabel
            Left = 16
            Top = 131
            Width = 55
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Nascimento'
            FocusControl = JvDBDateEdit2
          end
          object Label24: TLabel
            Left = 267
            Top = 21
            Width = 47
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Registro :'
            FocusControl = DBEdit4
          end
          object Label1: TLabel
            Left = 16
            Top = 78
            Width = 71
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Nome estabulo'
            FocusControl = DBEdit2
          end
          object Label6: TLabel
            Left = 16
            Top = 157
            Width = 36
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'SISBOV'
            FocusControl = DBEdit5
          end
          object Label7: TLabel
            Left = 433
            Top = 157
            Width = 18
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'SCL'
            FocusControl = DBEdit9
          end
          object GroupBox2: TGroupBox
            Left = 12
            Top = 182
            Width = 324
            Height = 125
            Caption = 'Origem'
            TabOrder = 14
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
              Top = 58
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
              Top = 96
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
              Top = 55
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
            object JvDBCalcEdit2: TJvDBCalcEdit
              Left = 123
              Top = 93
              Width = 121
              Height = 21
              ShowButton = False
              TabOrder = 2
              DecimalPlacesAlwaysShown = False
              DataField = 'PRECO_COMPRA'
              DataSource = dtsFicha
            end
          end
          object DBLookupComboBox3: TDBLookupComboBox
            Left = 532
            Top = 128
            Width = 134
            Height = 21
            DataField = 'DESCR_DOADOR_RECEPTOR'
            DataSource = dtsDadosFemea
            TabOrder = 11
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 97
            Top = 102
            Width = 115
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'DESCR_STATUS'
            DataSource = dtsFicha
            TabOrder = 7
          end
          object DBEdit10: TDBEdit
            Left = 488
            Top = 18
            Width = 30
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'RETIRO'
            DataSource = dtsDadosFemea
            TabOrder = 2
          end
          object DBEdit13: TDBEdit
            Left = 488
            Top = 102
            Width = 134
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'REBANHO'
            DataSource = dtsDadosFemea
            TabOrder = 8
          end
          object DBEdit11: TDBEdit
            Left = 488
            Top = 48
            Width = 69
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'LOTE'
            DataSource = dtsDadosFemea
            TabOrder = 4
          end
          object DBEdit1: TDBEdit
            Left = 97
            Top = 18
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
            Left = 97
            Top = 48
            Width = 307
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'NOMECOMPLETO'
            DataSource = dtsFicha
            TabOrder = 3
          end
          object JvDBDateEdit2: TTcDBDateEdit
            Left = 97
            Top = 128
            Width = 93
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Checked = False
            DataField = 'NASCIMENTO'
            DataSource = dtsDadosFemea
            CheckOnExit = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ButtonWidth = 24
            ParentFont = False
            TabOrder = 9
          end
          object DBEdit12: TDBEdit
            Left = 488
            Top = 75
            Width = 69
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'NUCLEO'
            DataSource = dtsDadosFemea
            TabOrder = 6
          end
          object DBEdit4: TDBEdit
            Left = 324
            Top = 18
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
          object GroupBox3: TGroupBox
            Left = 367
            Top = 182
            Width = 324
            Height = 106
            Caption = 'Pedigree'
            TabOrder = 15
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
          object DBEdit2: TDBEdit
            Left = 97
            Top = 75
            Width = 307
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'NOMEESTABULO'
            DataSource = dtsFicha
            TabOrder = 5
          end
          object DBEdit5: TDBEdit
            Left = 97
            Top = 154
            Width = 159
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'SISBOV'
            DataSource = dtsFicha
            TabOrder = 12
          end
          object DBEdit9: TDBEdit
            Left = 488
            Top = 154
            Width = 69
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'SCL'
            DataSource = dtsDadosFemea
            MaxLength = 4
            TabOrder = 13
          end
          object dbchkOriginadoEmbriao: TDBCheckBox
            Left = 267
            Top = 127
            Width = 147
            Height = 17
            Caption = 'Originado de embri'#227'o'
            DataField = 'ORIGINADO_DE_EMBRIAO'
            DataSource = dtsFicha
            TabOrder = 10
            ValueChecked = 'T'
            ValueUnchecked = 'F'
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
    DataSet = Zoo_AnimaisExternosFemeaDatamodule.cdsAnimal
    Left = 415
    Top = 16
  end
  object dtsDadosFemea: TDataSource
    DataSet = Zoo_AnimaisExternosFemeaDatamodule.cdsDadosFemea
    Left = 482
    Top = 16
  end
  object dtsLinhagem: TDataSource
    DataSet = Zoo_AnimaisExternosFemeaDatamodule.cdsLinhagem
    Left = 558
    Top = 14
  end
end
