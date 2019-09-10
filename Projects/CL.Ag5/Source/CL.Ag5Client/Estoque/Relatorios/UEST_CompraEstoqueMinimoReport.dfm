inherited EST_CompraEstoqueMinimoReport: TEST_CompraEstoqueMinimoReport
  Left = 363
  Top = 241
  Caption = 'Compra estoque m'#237'nimo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlDetail: TJvPanel
      inherited PageControl: TJvPageControl
        ActivePage = TabSheet1
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object JvDBUltimGrid1: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 527
            Height = 287
            Align = alClient
            DataSource = DataSource1
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
            OnCheckIfBooleanField = JvDBUltimGrid1CheckIfBooleanField
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = EST_CompraEstoqueMinimoDatamodule.cdsProdutosQtdeMinima
    Left = 82
    Top = 97
  end
end
