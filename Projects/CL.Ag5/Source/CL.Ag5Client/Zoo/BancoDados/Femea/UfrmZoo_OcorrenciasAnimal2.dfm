inherited frmZoo_OcorrenciasAnimal: TfrmZoo_OcorrenciasAnimal
  Left = 336
  Top = 193
  Caption = 'frmZoo_OcorrenciasAnimal'
  ClientHeight = 463
  ClientWidth = 854
  Font.Name = 'Tahoma'
  ExplicitWidth = 870
  ExplicitHeight = 502
  PixelsPerInch = 96
  TextHeight = 13
  object pgcOcorrencias: TPageControl [0]
    Left = 0
    Top = 0
    Width = 854
    Height = 463
    ActivePage = tbsAgrupado
    Align = alClient
    TabOrder = 0
    object tbsAgrupado: TTabSheet
      Caption = 'Lista Agrupada'
      object KDBGrid1: TKDBGrid
        Left = 0
        Top = 0
        Width = 846
        Height = 435
        Align = alClient
        DBOptions = [dboAutoMoveRecord, dboAutoSizeBooleanCells, dboColNamesToHeader, dboDontClearFixedCells, dboIndexFixedCol, dboIndicateActiveRecord]
        Colors.CellBkGnd = clWhite
        Colors.CellLines = clSilver
        Colors.CellText = clBlack
        Colors.FixedCellBkGnd = clSilver
        Colors.FixedThemedCellHighlight = clSilver
        Colors.FixedThemedCellShadow = clGray
        Colors.FocusedCellBkGnd = clSilver
        Colors.FocusedCellText = clWhite
        Colors.FocusedRangeBkGnd = clSilver
        Colors.FocusedRangeText = clWhite
        Colors.SelectedRangeBkGnd = clSilver
        Colors.SelectedFixedCellBkGnd = clWhite
        Colors.ActiveRecord = clSilver
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
    object tbsCronologico: TTabSheet
      Caption = 'Ordem Cronol'#243'gica'
      ImageIndex = 1
      object dbgOcorrenciasCronologica: TJvDBUltimGrid
        Left = 0
        Top = 30
        Width = 846
        Height = 405
        Align = alClient
        DataSource = dtsOcorrenciasCronologica
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnEditButtonClick = dbgOcorrenciasCronologicaEditButtonClick
        OnEnter = dbgOcorrenciasCronologicaEnter
        OnKeyPress = dbgOcorrenciasCronologicaKeyPress
        OnShowEditor = dbgOcorrenciasCronologicaShowEditor
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <
          item
            ControlName = 'dbdeDATA'
            FieldName = 'DATA'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end
          item
            ControlName = 'dbdeEXECUCAO'
            FieldName = 'DATAEXECUCAO'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end
          item
            ControlName = 'DBMemo1'
            FieldName = 'OBS'
            FitCell = fcDesignSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end
          item
            ControlName = 'dblcStatus'
            FieldName = 'DESCR_STATUS'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
          end
          item
            ControlName = 'dbdeREEXECUTAR_EM'
            FieldName = 'REEXECUTAR_EM'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end>
        RowsHeight = 17
        TitleRowHeight = 17
        OnCheckIfBooleanField = dbgOcorrenciasCronologicaCheckIfBooleanField
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCR_TIPO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OCORRENCIA'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCR_QUARTO'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORIGEM'
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCR_STATUS'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAEXECUCAO'
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'NOMEFUNCIONARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REEXECUTAR_EM'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EXCLUIDO'
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 846
        Height = 30
        Align = alTop
        Caption = ' '
        ParentColor = True
        TabOrder = 1
        object CheckBox1: TCheckBox
          Left = 8
          Top = 5
          Width = 181
          Height = 17
          Caption = 'Exibir ocorrencias exclu'#237'das'
          TabOrder = 0
          OnClick = CheckBox1Click
        end
      end
      object DBMemo1: TDBMemo
        Left = 404
        Top = 152
        Width = 217
        Height = 97
        DataField = 'OBS'
        DataSource = dtsOcorrenciasCronologica
        TabOrder = 2
        Visible = False
      end
      object dbdeDATA: TTcDBDateEdit
        Left = 72
        Top = 136
        Width = 121
        Height = 21
        Checked = False
        DataField = 'DATA'
        DataSource = dtsOcorrenciasCronologica
        CheckOnExit = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object dbdeEXECUCAO: TTcDBDateEdit
        Left = 72
        Top = 176
        Width = 121
        Height = 21
        Checked = False
        DataField = 'DATAEXECUCAO'
        DataSource = dtsOcorrenciasCronologica
        CheckOnExit = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
      object dblcStatus: TDBLookupComboBox
        Left = 72
        Top = 248
        Width = 145
        Height = 21
        DataField = 'STATUS'
        DataSource = dtsOcorrenciasCronologica
        KeyField = 'VALOR'
        ListField = 'DESCRICAO'
        ListSource = dtsStatus
        TabOrder = 5
        Visible = False
      end
      object dbdeREEXECUTAR_EM: TTcDBDateEdit
        Left = 72
        Top = 203
        Width = 121
        Height = 21
        Checked = False
        DataField = 'REEXECUTAR_EM'
        DataSource = dtsOcorrenciasCronologica
        CheckOnExit = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Visible = False
      end
    end
  end
  object dtsOcorrenciasGroup: TDataSource
    DataSet = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasGroup
    Left = 156
    Top = 84
  end
  object dtsOcorrenciasCronologica: TDataSource
    DataSet = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologica
    Left = 272
    Top = 92
  end
  object dtsStatus: TDataSource
    Left = 340
    Top = 92
  end
end
