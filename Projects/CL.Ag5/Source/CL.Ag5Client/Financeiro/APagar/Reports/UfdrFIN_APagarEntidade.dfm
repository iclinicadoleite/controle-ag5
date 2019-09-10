inherited fdrFIN_APagarEntidade: TfdrFIN_APagarEntidade
  Left = 870
  Top = 301
  Caption = 'Selecionar cliente'
  ClientHeight = 248
  ClientWidth = 339
  ActionList.Left = 146
  ActionList.Top = 4
  ExplicitWidth = 345
  ExplicitHeight = 277
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 339
    Height = 248
    ExplicitWidth = 339
    ExplicitHeight = 248
    inherited _pnlFooter: TJvPanel
      Top = 217
      Width = 335
      ExplicitWidth = 335
      inherited _imageBottom: TImage
        Width = 335
        ExplicitWidth = 356
      end
      inherited _btbPrior: TTcGDIButton
        Left = 144
        ExplicitLeft = 144
      end
      inherited _btbNext: TTcGDIButton
        Left = 235
        ExplicitLeft = 235
      end
      inherited _btbExecute: TTcGDIButton
        Left = 250
        ExplicitLeft = 250
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 335
      Height = 215
      ExplicitWidth = 335
      ExplicitHeight = 215
      inherited PageControl: TJvPageControl
        Width = 335
        Height = 215
        ActivePage = TabSheet1
        ExplicitWidth = 335
        ExplicitHeight = 215
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Label3: TLabel
            Left = 20
            Top = 32
            Width = 53
            Height = 13
            Caption = 'Pesquisar :'
          end
          object _edtSearch: TJvComboEdit
            Left = 79
            Top = 26
            Width = 237
            Height = 21
            ButtonWidth = 15
            ClipboardCommands = []
            ImageKind = ikEllipsis
            TabOrder = 0
            Text = ''
            OnButtonClick = _edtSearchButtonClick
            OnChange = _edtSearchChange
            OnKeyPress = _edtSearchKeyPress
          end
          object rbTodosCLientes: TRadioButton
            Left = 20
            Top = 3
            Width = 137
            Height = 17
            Caption = 'Todos os fornecedores'
            Checked = True
            TabOrder = 1
            TabStop = True
          end
          object GroupBox1: TGroupBox
            Left = 20
            Top = 64
            Width = 296
            Height = 89
            Caption = ' Per'#237'odo '
            TabOrder = 2
            object Label2: TLabel
              Left = 15
              Top = 57
              Width = 38
              Height = 13
              Caption = 'T'#233'rmino'
            end
            object Label1: TLabel
              Left = 28
              Top = 23
              Width = 25
              Height = 13
              Caption = 'In'#237'cio'
            end
            object edTermino: TTcDateEdit
              Left = 98
              Top = 54
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 23
              TabOrder = 0
            end
            object edInicio: TTcDateEdit
              Left = 98
              Top = 23
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
  inherited ActionList: TInternalActionList
    Left = 146
    Top = 4
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
end
