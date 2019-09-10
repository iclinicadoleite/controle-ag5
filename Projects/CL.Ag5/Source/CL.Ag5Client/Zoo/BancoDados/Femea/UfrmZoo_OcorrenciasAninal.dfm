inherited frmZoo_OcorrenciasAninal: TfrmZoo_OcorrenciasAninal
  Left = 353
  Top = 208
  Caption = 'frmZoo_OcorrenciasAninal'
  ClientHeight = 462
  ClientWidth = 854
  Font.Name = 'Tahoma'
  ExplicitLeft = 353
  ExplicitTop = 208
  ExplicitWidth = 870
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl [0]
    Left = 0
    Top = 0
    Width = 854
    Height = 462
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Lista Agrupada'
      object KDBGrid1: TKDBGrid
        Left = 0
        Top = 0
        Width = 846
        Height = 434
        Align = alClient
        DBOptions = [dboAutoMoveRecord, dboAutoSizeBooleanCells, dboColNamesToHeader, dboDontClearFixedCells, dboIndexFixedCol, dboIndicateActiveRecord]
        DataSource = dtsOcorrenciasGroup
        FixedCols = 0
        FixedRows = 2
        MinColWidth = 30
        Options = [goAlwaysShowEditor, goClippedCells, goColSizing, goDrawFocusSelected, goEnterMoves, goFixedHorzLine, goFixedVertLine, goHeader, goHeaderAlignment, goHorzLine, goIndicateHiddenCells, goIndicateSelection, goMouseCanHideCells, goMouseOverCells, goRangeSelect, goRowSelect, goThemes, goThemedCells, goVertLine]
        RowCount = 3
        TabOrder = 0
        OnDrawCell = KDBGrid1DrawCell
        ColWidths = (
          64
          64
          64
          64
          64)
        RowHeights = (
          21
          21
          21)
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ordem Cronol'#243'gica'
      ImageIndex = 1
      object JvDBUltimGrid1: TJvDBUltimGrid
        Left = 0
        Top = 0
        Width = 846
        Height = 434
        Align = alClient
        DataSource = dtsOcorrenciasCronologica
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
  object dtsOcorrenciasGroup: TDataSource
    DataSet = dtmZoo_OcorrenciasAninal.cdsOcorrenciasGroup
    Left = 156
    Top = 84
  end
  object dtsOcorrenciasCronologica: TDataSource
    DataSet = dtmZoo_OcorrenciasAninal.cdsOcorrenciasCronologica
    Left = 272
    Top = 92
  end
end
