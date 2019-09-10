inherited Fin_ComprasPorPeriodoDialog: TFin_ComprasPorPeriodoDialog
  Left = 424
  Top = 223
  ActionList.Left = 114
  ActionList.Top = 4
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlDetail: TJvPanel
      inherited PageControl: TJvPageControl
        ActivePage = TabSheet1
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object RadioGroup1: TRadioGroup
            Left = 12
            Top = 63
            Width = 360
            Height = 79
            Caption = ' Fornecedor '
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Pesquisar')
            TabOrder = 1
            OnClick = RadioGroup1Click
          end
          object edEntidade: TTcComboEdit
            Left = 107
            Top = 112
            Width = 255
            Height = 20
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
          object GroupBox1: TGroupBox
            Left = 12
            Top = 3
            Width = 360
            Height = 54
            Caption = ' Per'#237'odo '
            TabOrder = 0
            object Label1: TLabel
              Left = 10
              Top = 23
              Width = 27
              Height = 13
              Caption = 'Inicial'
            end
            object Label2: TLabel
              Left = 199
              Top = 23
              Width = 22
              Height = 13
              Caption = 'Final'
            end
            object edInicio: TTcDateEdit
              Left = 49
              Top = 20
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 22
              TabOrder = 0
            end
            object edTermino: TTcDateEdit
              Left = 229
              Top = 20
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 22
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 114
    Top = 4
  end
end
