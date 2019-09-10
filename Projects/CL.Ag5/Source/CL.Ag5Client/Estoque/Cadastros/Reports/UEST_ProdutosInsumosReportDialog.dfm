inherited EST_ProdutosInsumosReportDialog: TEST_ProdutosInsumosReportDialog
  Left = 432
  Top = 223
  Caption = 'Selecionar grupo de produtos/insumos'
  ClientHeight = 171
  ClientWidth = 359
  ActionList.Left = 130
  ActionList.Top = 12
  ExplicitWidth = 365
  ExplicitHeight = 200
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 359
    Height = 171
    ExplicitWidth = 359
    ExplicitHeight = 171
    inherited _pnlFooter: TJvPanel
      Top = 140
      Width = 355
      ExplicitTop = 140
      ExplicitWidth = 355
      inherited _imageBottom: TImage
        Width = 355
        ExplicitWidth = 331
      end
      inherited _btbPrior: TTcGDIButton
        Left = 164
        ExplicitLeft = 164
      end
      inherited _btbNext: TTcGDIButton
        Left = 255
        ExplicitLeft = 255
      end
      inherited _btbExecute: TTcGDIButton
        Left = 270
        ExplicitLeft = 270
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 355
      Height = 138
      ExplicitWidth = 355
      ExplicitHeight = 138
      inherited PageControl: TJvPageControl
        Width = 355
        Height = 138
        ActivePage = TabSheet1
        ExplicitWidth = 355
        ExplicitHeight = 138
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object lblPesquisar: TLabel
            Left = 22
            Top = 58
            Width = 44
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Grupo :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object edSearch: TJvComboEdit
            Left = 91
            Top = 56
            Width = 235
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ButtonWidth = 15
            ClipboardCommands = []
            ImageKind = ikEllipsis
            TabOrder = 0
            Text = ''
            OnButtonClick = edSearchButtonClick
            OnChange = edSearchChange
            OnKeyPress = edSearchKeyPress
          end
          object rgTipo: TRadioGroup
            Left = 12
            Top = 2
            Width = 314
            Height = 42
            Caption = ' Tipo de relat'#243'rio '
            Columns = 3
            ItemIndex = 2
            Items.Strings = (
              'Produtos'
              'Insumos'
              'Ambos')
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 130
    Top = 12
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
end
