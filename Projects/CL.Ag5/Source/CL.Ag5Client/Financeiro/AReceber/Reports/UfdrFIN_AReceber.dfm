inherited fdrFIN_AReceber: TfdrFIN_AReceber
  Left = 389
  Top = 224
  ExplicitLeft = 389
  ExplicitTop = 224
  ExplicitWidth = 531
  ExplicitHeight = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlFooter: TJvPanel
      ExplicitTop = 312
      ExplicitWidth = 527
    end
    inherited _pnlDetail: TJvPanel
      ExplicitWidth = 527
      ExplicitHeight = 287
      inherited PageControl: TJvPageControl
        ActivePage = TabSheet1
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Label2: TLabel
            Left = 34
            Top = 73
            Width = 38
            Height = 13
            Caption = 'Termino'
          end
          object Label1: TLabel
            Left = 32
            Top = 31
            Width = 25
            Height = 13
            Caption = 'Inicio'
          end
          object edTermino: TTcDateEdit
            Left = 144
            Top = 69
            Width = 121
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 22
            TabOrder = 0
          end
          object edInicio: TTcDateEdit
            Left = 144
            Top = 31
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
