inherited Fin_RelatoriosBaseWizard: TFin_RelatoriosBaseWizard
  Left = 474
  Top = 248
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlDetail: TJvPanel
      inherited PageControl: TJvPageControl
        ActivePage = TabSheetResultado
        object TabSheetParametros: TTabSheet
          Caption = 'TabSheetParametros'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object TabSheetResultado: TTabSheet
          Caption = 'TabSheetResultado'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object DBGridResultados: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 527
            Height = 287
            Align = alClient
            DataSource = dtsResultado
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
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
  inherited ActionList: TInternalActionList
    inherited _actExecute: TAction
      Caption = 'V&isualizar'
    end
  end
  object dtsResultado: TDataSource
    Left = 338
    Top = 64
  end
end
