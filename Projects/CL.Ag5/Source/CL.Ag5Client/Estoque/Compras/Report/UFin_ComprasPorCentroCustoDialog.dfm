inherited Fin_ComprasPorCentroCustoDialog: TFin_ComprasPorCentroCustoDialog
  Left = 518
  Top = 210
  Caption = 'Filtro relat'#243'rio'
  ClientHeight = 465
  ClientWidth = 428
  ActionList.Left = 74
  ActionList.Top = 4
  ExplicitWidth = 434
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 428
    Height = 465
    ExplicitWidth = 421
    ExplicitHeight = 310
    inherited _pnlFooter: TJvPanel
      Top = 434
      Width = 424
      ExplicitTop = 434
      ExplicitWidth = 417
      inherited _imageBottom: TImage
        Width = 424
        ExplicitWidth = 417
      end
      inherited _btbPrior: TTcGDIButton
        Left = 233
        ExplicitLeft = 226
      end
      inherited _btbNext: TTcGDIButton
        Left = 324
        ExplicitLeft = 317
      end
      inherited _btbExecute: TTcGDIButton
        Left = 339
        ExplicitLeft = 332
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 424
      Height = 432
      ExplicitTop = 26
      ExplicitWidth = 417
      ExplicitHeight = 357
      inherited PageControl: TJvPageControl
        Width = 424
        Height = 432
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
              Left = 228
              Top = 20
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 23
              TabOrder = 1
            end
          end
          object rgFornecedor: TRadioGroup
            Left = 24
            Top = 59
            Width = 361
            Height = 77
            Caption = ' Fornecedor '
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Fornecedor')
            TabOrder = 1
            OnClick = rgFornecedorClick
          end
          object rgContacontabil: TRadioGroup
            Left = 24
            Top = 152
            Width = 361
            Height = 77
            Caption = ' Conta cont'#225'bil '
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Conta cont'#225'bil')
            TabOrder = 3
            OnClick = rgContacontabilClick
          end
          object rgCentroCusto: TRadioGroup
            Left = 24
            Top = 240
            Width = 361
            Height = 77
            Caption = ' Centro de Custos '
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Centro de custo')
            TabOrder = 5
            OnClick = rgCentroCustoClick
          end
          object edEntidade: TTcComboEdit
            Left = 139
            Top = 105
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
          object edContacontabil: TTcComboEdit
            Left = 139
            Top = 198
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
          object edCentroCusto: TTcComboEdit
            Left = 139
            Top = 288
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
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 74
    Top = 4
  end
end
