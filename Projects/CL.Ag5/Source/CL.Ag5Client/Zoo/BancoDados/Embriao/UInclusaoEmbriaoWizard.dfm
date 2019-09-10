inherited InclusaoEmbriaoWizard: TInclusaoEmbriaoWizard
  Left = 380
  Top = 213
  Caption = 'Inclus'#227'o de embri'#227'o'
  ClientHeight = 380
  ClientWidth = 731
  ExplicitWidth = 737
  ExplicitHeight = 409
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 731
    Height = 380
    ExplicitWidth = 731
    ExplicitHeight = 380
    inherited _pnlFooter: TJvPanel
      Top = 349
      Width = 727
      ExplicitTop = 349
      ExplicitWidth = 727
      inherited _imageBottom: TImage
        Width = 727
        ExplicitWidth = 727
      end
      inherited _btbPrior: TTcGDIButton
        Left = 536
        ExplicitLeft = 536
      end
      inherited _btbNext: TTcGDIButton
        Left = 627
        ExplicitLeft = 627
      end
      inherited _btbExecute: TTcGDIButton
        Left = 642
        ExplicitLeft = 642
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 727
      Height = 347
      ExplicitWidth = 727
      ExplicitHeight = 347
      inherited PageControl: TJvPageControl
        Width = 727
        Height = 347
        ActivePage = TabSheet1
        ExplicitWidth = 727
        ExplicitHeight = 347
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Label21: TLabel
            Left = 8
            Top = 6
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
            Top = 33
            Width = 27
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
            Top = 3
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
            Top = 30
            Width = 365
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
            Left = 409
            Top = 56
            Width = 185
            Height = 91
            Caption = 'Estoque'
            TabOrder = 3
            object Label3: TLabel
              Left = 16
              Top = 18
              Width = 24
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Qtde'
            end
            object JvDBCalcEdit1: TJvDBCalcEdit
              Left = 61
              Top = 15
              Width = 115
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
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 56
            Width = 386
            Height = 91
            Caption = 'Origem'
            TabOrder = 2
            object Label1: TLabel
              Left = 17
              Top = 18
              Width = 23
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Data'
            end
            object Label4: TLabel
              Left = 17
              Top = 44
              Width = 24
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Local'
            end
            object Label5: TLabel
              Left = 17
              Top = 69
              Width = 82
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Pre'#231'o de Compra'
            end
            object JvDBCalcEdit2: TJvDBCalcEdit
              Left = 122
              Top = 66
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
              Top = 15
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
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 24
              ParentFont = False
              TabOrder = 0
            end
            object DBEdit7: TDBEdit
              Left = 62
              Top = 41
              Width = 263
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
            Top = 147
            Width = 324
            Height = 98
            Caption = 'Pedigree'
            TabOrder = 4
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
              Left = 8
              Top = 100
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
            object Label7: TLabel
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
            object Label2: TLabel
              Left = 10
              Top = 69
              Width = 77
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Grau de Sangue'
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
              Left = 52
              Top = 43
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
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 50
              Top = 88
              Width = 269
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
            object DBEdit6: TDBEdit
              Left = 227
              Top = 20
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
              Top = 43
              Width = 92
              Height = 21
              TabStop = False
              DataField = 'GSR_MAE'
              DataSource = dtsLinhagem
              ReadOnly = True
              TabOrder = 3
            end
            object dbxGrauSangue: TDBComboBox
              Left = 110
              Top = 66
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
              TabOrder = 4
              OnKeyPress = dbxGrauSangueKeyPress
            end
            object dbEdtComposicaoRaca: TJvDBComboEdit
              Left = 192
              Top = 66
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
    DataSet = Zoo_BancoDadosEmbriaoDatamodule.cdsLstEmbrioes
    Left = 539
    Top = 24
  end
  object dtsFicha: TDataSource
    DataSet = Zoo_BancoDadosEmbriaoDatamodule.cdsAnimal
    Left = 579
    Top = 24
  end
  object dtsDadosEmbriao: TDataSource
    DataSet = Zoo_BancoDadosEmbriaoDatamodule.cdsDadosEmbriao
    Left = 620
    Top = 24
  end
  object dtsLinhagem: TDataSource
    DataSet = Zoo_BancoDadosEmbriaoDatamodule.cdsLinhagem
    Left = 666
    Top = 41
  end
end
