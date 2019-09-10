inherited fdrFIN_AReceberEntidade: TfdrFIN_AReceberEntidade
  Left = 421
  Top = 266
  ClientHeight = 242
  ClientWidth = 339
  ActionList.Left = 146
  ActionList.Top = 12
  ExplicitWidth = 345
  ExplicitHeight = 271
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 339
    Height = 242
    ExplicitWidth = 395
    ExplicitHeight = 209
    inherited _pnlFooter: TJvPanel
      Top = 211
      Width = 335
      ExplicitWidth = 391
      inherited _imageBottom: TImage
        Width = 335
        ExplicitWidth = 391
      end
      inherited _btbPrior: TTcGDIButton
        Left = 144
        ExplicitLeft = 200
      end
      inherited _btbNext: TTcGDIButton
        Left = 235
        ExplicitLeft = 291
      end
      inherited _btbExecute: TTcGDIButton
        Left = 250
        ExplicitLeft = 306
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 335
      Height = 209
      ExplicitWidth = 391
      ExplicitHeight = 287
      inherited PageControl: TJvPageControl
        Width = 335
        Height = 209
        ActivePage = TabSheet1
        ExplicitWidth = 391
        ExplicitHeight = 153
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Label3: TLabel
            Left = 20
            Top = 37
            Width = 53
            Height = 13
            Caption = 'Pesquisar :'
          end
          object _edtSearch: TJvComboEdit
            Left = 86
            Top = 33
            Width = 230
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
            Top = 7
            Width = 113
            Height = 17
            Caption = 'Todos os clientes'
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = rbTodosCLientesClick
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
    Top = 12
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
end
