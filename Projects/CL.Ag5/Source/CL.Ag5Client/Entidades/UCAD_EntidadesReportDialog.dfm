inherited CAD_EntidadesReportDialog: TCAD_EntidadesReportDialog
  Left = 435
  Top = 223
  Caption = 'Selecionar grupo de clientes'
  ClientHeight = 143
  ClientWidth = 342
  ActionList.Left = 122
  ActionList.Top = 4
  ExplicitWidth = 348
  ExplicitHeight = 172
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 342
    Height = 143
    ExplicitWidth = 342
    ExplicitHeight = 143
    inherited _pnlFooter: TJvPanel
      Top = 112
      Width = 338
      ExplicitWidth = 338
      inherited _imageBottom: TImage
        Width = 338
        ExplicitWidth = 338
      end
      inherited _btbPrior: TTcGDIButton
        Left = 147
        ExplicitLeft = 147
      end
      inherited _btbNext: TTcGDIButton
        Left = 238
        ExplicitLeft = 238
      end
      inherited _btbExecute: TTcGDIButton
        Left = 253
        ExplicitLeft = 253
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 338
      Height = 110
      ExplicitWidth = 338
      ExplicitHeight = 110
      inherited PageControl: TJvPageControl
        Width = 338
        Height = 110
        ActivePage = TabSheet1
        ExplicitWidth = 338
        ExplicitHeight = 110
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object lblPesquisar: TLabel
            Left = 8
            Top = 23
            Width = 60
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Pesquisar:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object edSearch: TJvComboEdit
            Left = 75
            Top = 20
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
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 122
    Top = 4
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
end
