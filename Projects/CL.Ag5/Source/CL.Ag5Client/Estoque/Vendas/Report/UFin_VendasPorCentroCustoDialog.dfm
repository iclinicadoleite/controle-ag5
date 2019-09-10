inherited Fin_VendasPorCentroCustoDialog: TFin_VendasPorCentroCustoDialog
  Left = 512
  Top = 159
  Caption = 'Filtro relat'#243'rio'
  ClientHeight = 512
  ClientWidth = 474
  ActionList.Left = 74
  ActionList.Top = 4
  ExplicitWidth = 480
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 474
    Height = 512
    ExplicitWidth = 421
    ExplicitHeight = 310
    inherited _pnlFooter: TJvPanel
      Top = 481
      Width = 470
      ExplicitTop = 481
      ExplicitWidth = 417
      inherited _imageBottom: TImage
        Width = 470
        ExplicitWidth = 417
      end
      inherited _btbPrior: TTcGDIButton
        Left = 279
        ExplicitLeft = 226
      end
      inherited _btbNext: TTcGDIButton
        Left = 370
        ExplicitLeft = 317
      end
      inherited _btbExecute: TTcGDIButton
        Left = 385
        ExplicitLeft = 332
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 470
      Height = 479
      ExplicitTop = 26
      ExplicitWidth = 417
      ExplicitHeight = 357
      inherited PageControl: TJvPageControl
        Width = 470
        Height = 479
        ActivePage = TabSheet1
        ExplicitWidth = 417
        ExplicitHeight = 253
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object GroupBox1: TGroupBox
            Left = 24
            Top = 0
            Width = 361
            Height = 57
            Caption = 'Per'#237'odo'
            TabOrder = 0
            object Label1: TLabel
              Left = 8
              Top = 23
              Width = 25
              Height = 13
              Caption = 'In'#237'cio'
            end
            object Label2: TLabel
              Left = 181
              Top = 23
              Width = 38
              Height = 13
              Caption = 'T'#233'rmino'
            end
            object edInicio: TTcDateEdit
              Left = 49
              Top = 20
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 23
              TabOrder = 0
            end
            object edTermino: TTcDateEdit
              Left = 225
              Top = 20
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 23
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object rgFornecedor: TRadioGroup [1]
    Left = 26
    Top = 112
    Width = 361
    Height = 77
    Caption = ' Cliente'
    Color = clWhite
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Cliente')
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
  end
  object rgContacontabil: TRadioGroup [2]
    Left = 26
    Top = 205
    Width = 361
    Height = 77
    Caption = ' Conta cont'#225'bil '
    Color = clWhite
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Conta cont'#225'bil')
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
  end
  object rgCentroCusto: TRadioGroup [3]
    Left = 26
    Top = 293
    Width = 361
    Height = 77
    Caption = ' Centro de Custos '
    Color = clWhite
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Centro de custo')
    ParentBackground = False
    ParentColor = False
    TabOrder = 5
  end
  object edEntidade: TTcComboEdit [4]
    Left = 141
    Top = 158
    Width = 234
    Height = 21
    Checked = False
    ButtonWidth = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    ImageKind = ikEllipsis
    ParentFont = False
    TabOrder = 2
    Text = ''
    OnButtonClick = edEntidadeButtonClick
    OnKeyPress = edEntidadeKeyPress
  end
  object edContacontabil: TTcComboEdit [5]
    Left = 141
    Top = 251
    Width = 234
    Height = 21
    Checked = False
    ButtonWidth = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    ImageKind = ikEllipsis
    ParentFont = False
    TabOrder = 4
    Text = ''
    OnButtonClick = edContacontabilButtonClick
    OnKeyPress = edContacontabilKeyPress
  end
  object edCentroCusto: TTcComboEdit [6]
    Left = 141
    Top = 341
    Width = 234
    Height = 21
    Checked = False
    ButtonWidth = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    ImageKind = ikEllipsis
    ParentFont = False
    TabOrder = 6
    Text = ''
    OnButtonClick = edCentroCustoButtonClick
    OnKeyPress = edCentroCustoKeyPress
  end
  inherited ActionList: TInternalActionList
    Left = 74
    Top = 4
  end
end
