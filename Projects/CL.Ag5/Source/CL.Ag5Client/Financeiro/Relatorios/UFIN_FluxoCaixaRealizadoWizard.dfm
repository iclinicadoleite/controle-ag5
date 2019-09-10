inherited FIN_FluxoCaixaRealizadoWizard: TFIN_FluxoCaixaRealizadoWizard
  Left = 491
  Top = 149
  Caption = 'Fluxo de caixa realizado'
  ClientHeight = 594
  ClientWidth = 751
  OldCreateOrder = False
  ExplicitWidth = 757
  ExplicitHeight = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 751
    Height = 594
    ExplicitWidth = 751
    ExplicitHeight = 594
    inherited _pnlFooter: TJvPanel
      Top = 563
      Width = 747
      ExplicitTop = 563
      ExplicitWidth = 747
      inherited _imageBottom: TImage
        Width = 747
        ExplicitWidth = 747
      end
      inherited _btbPrior: TTcGDIButton
        Left = 542
        ExplicitLeft = 542
      end
      inherited _btbNext: TTcGDIButton
        Left = 633
        ExplicitLeft = 633
      end
      inherited _btbExecute: TTcGDIButton
        Left = 648
        ExplicitLeft = 648
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 747
      Height = 561
      ExplicitWidth = 747
      ExplicitHeight = 561
      inherited PageControl: TJvPageControl
        Width = 747
        Height = 561
        ActivePage = TabSheet2
        ExplicitWidth = 747
        ExplicitHeight = 561
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object dbgResultado: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 747
            Height = 538
            Align = alClient
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            AutoAppend = False
            AutoSizeColumns = True
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
          end
        end
      end
    end
  end
end
