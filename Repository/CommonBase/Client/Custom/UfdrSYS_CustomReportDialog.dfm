inherited fdrCustomReportDialog: TfdrCustomReportDialog
  Left = 424
  Top = 223
  ExplicitLeft = 424
  ExplicitTop = 223
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlFooter: TJvPanel
      ExplicitTop = 312
    end
    inherited _pnlDetail: TJvPanel
      ExplicitHeight = 287
      inherited PageControl: TJvPageControl
        ActivePage = TabSheet1
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Label1: TLabel
            Left = 32
            Top = 31
            Width = 25
            Height = 13
            Caption = 'Inicio'
          end
          object Label2: TLabel
            Left = 34
            Top = 73
            Width = 38
            Height = 13
            Caption = 'Termino'
          end
          object edInicio: TTcMPDateEdit
            Left = 144
            Top = 31
            Width = 121
            Height = 21
            Checked = False
            ButtonWidth = 22
            TabOrder = 0
          end
          object edTermino: TTcMPDateEdit
            Left = 144
            Top = 69
            Width = 121
            Height = 21
            Checked = False
            ButtonWidth = 22
            TabOrder = 1
          end
        end
      end
    end
  end
end
