inherited ZooRelatotioAvaliacaoBezerras_frm: TZooRelatotioAvaliacaoBezerras_frm
  Left = 363
  Top = 241
  Caption = 'Bezerras'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlFooter: TJvPanel
      inherited _btbPrior: TTcGDIButton
        Visible = False
      end
      inherited _btbExecute: TTcGDIButton
        Left = 435
        Top = 2
        Caption = 'V&isualizar'
        ExplicitLeft = 435
        ExplicitTop = 2
      end
    end
    inherited _pnlDetail: TJvPanel
      inherited PageControl: TJvPageControl
        ActivePage = TabSheet2
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          object DBGridResultados: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 527
            Height = 260
            Align = alClient
            DataSource = dtsResultado
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            TitleButtons = True
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            SortWith = swUserFunc
          end
          object Panel3: TPanel
            Left = 0
            Top = 260
            Width = 527
            Height = 27
            Align = alBottom
            Caption = ' '
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            object lblTotalLinhas: TLabel
              Left = 16
              Top = 7
              Width = 64
              Height = 13
              Caption = 'lblTotalLinhas'
            end
          end
        end
      end
    end
  end
  object dtsResultado: TDataSource
    DataSet = ZooRelatotioAvaliacaoBezerras_dtm.cdsResultados
    Left = 294
    Top = 141
  end
  object dtsCategoria: TDataSource
    DataSet = ZooRelatotioAvaliacaoBezerras_dtm.cdsCategoria
    Left = 366
    Top = 65
  end
end
