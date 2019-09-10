object frmZoo_OcorrenciasAnimal: TfrmZoo_OcorrenciasAnimal
  Left = 336
  Top = 193
  ActiveControl = dbgOcorrenciasCronologica
  Caption = 'frmZoo_OcorrenciasAnimal'
  ClientHeight = 463
  ClientWidth = 1267
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pgcOcorrencias: TPageControl
    Left = 0
    Top = 0
    Width = 1267
    Height = 463
    ActivePage = tbsCronologico
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Style = tsButtons
    TabOrder = 0
    object tbsAgrupado: TTabSheet
      Caption = 'Lista Agrupada'
      object dbtreeOcorrencias: TDTClientTree
        Left = 0
        Top = 0
        Width = 1259
        Height = 398
        ParentCustomHint = False
        Align = alClient
        DefaultNodeHeight = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Header.AutoSizeIndex = -1
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Verdana'
        Header.Font.Style = [fsBold]
        Header.Height = 21
        Header.Options = [hoColumnResize, hoDrag, hoShowImages, hoShowSortGlyphs, hoVisible]
        LineMode = lmBands
        LineStyle = lsSolid
        NodeDataSize = 4
        ParentFont = False
        TabOrder = 1
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoSpanColumns, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning]
        TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
        TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect]
        DataSource = dtsOcorrenciasGroup
        DBTreeFields.KeyFieldName = 'KZOO_OCORRENCIA'
        DBTreeFields.ParentFieldName = 'KMZOO_OCORRENCIA'
        DBTreeFields.ListFieldName = 'DESCRICAO'
        DBTreeFields.ParentOfRootValue = 'NULL'
        DBTreeImages.HasChildrenImageIndex = -1
        DBTreeImages.HasChildrenSelectedIndex = -1
        DBTreeImages.NoChildrenImageIndex = -1
        DBTreeImages.NoChildrenSelectedIndex = -1
        UseFilter = True
        Columns = <
          item
            Position = 0
            Width = 400
            FieldName = 'DESCRICAO_VEZES'
            WideText = 'Ocorr'#234'ncia'
          end
          item
            Position = 1
            Width = 118
            FieldName = 'DATA'
            WideText = 'Data'
          end
          item
            Position = 2
            Width = 116
            FieldName = 'DESCR_STATUS'
            WideText = 'Status'
          end
          item
            Position = 3
            Width = 109
            FieldName = 'DATATAREFA'
            WideText = 'Data'
          end
          item
            Position = 4
            Width = 167
            FieldName = 'NOMEFUNCIONARIO'
            WideText = 'Funcion'#225'rio'
          end
          item
            Position = 5
            Width = 121
            FieldName = 'OBS'
            WideText = 'Observa'#231#245'es'
          end
          item
            Position = 6
            Width = 72
            FieldName = 'DL'
            WideText = 'Dias DL'
          end
          item
            Position = 7
            Width = 71
            FieldName = 'NDC'
            WideText = 'Dias NDC'
          end>
      end
      object gbMensagem: TPanel
        Left = 0
        Top = 398
        Width = 1259
        Height = 34
        Align = alBottom
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Image1: TImage
          Left = 553
          Top = 12
          Width = 17
          Height = 14
          AutoSize = True
          ParentShowHint = False
          Picture.Data = {
            07544269746D61700E030000424D0E0300000000000036000000280000001100
            00000E0000000100180000000000D80200000000000000000000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF90DBFF00003A00
            0000000000000000000000000000000000000000000000000000000000000000
            3A0000FFDB90FFFFFF00DBFFFF003A90903A00FFFFDBFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBFFFF003A90903A00FFFFDB00DBFF
            FF003A90903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
            FFFFFFFFFFDBFFFF003A90903A00FFFFDB00FFFFFF3A90DB000000FFB666FFFF
            FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF66B6FF000000DB
            903AFFFFFF00FFFFFFDBFFFF003A90903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFDBFFFF003A90903A00FFFFDBFFFFFF00FFFFFFFFFFFF
            90DBFF00003AFFB666FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF66B6
            FF3A0000FFDB90FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF0066B6660000FFFFB6
            FFFFFFFFFFFF000000FFFFFFFFFFFFB6FFFF000066B66600FFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFB6FFFF000066DB903AFFFFFFFFFFFF000000FFFFFF
            FFFFFF3A90DB660000FFFFB6FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFF3A90DB660000FFFFB6FFFFFF000000FFFFFFB6FFFF000066DB903AFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFDBFFFF003A90B66600FF
            FFFF000000FFFFFF0066B6903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF90DBFF3A003AFFDB90FFFFFF90DBFF3A003AFF
            DB90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF0066B6903A00DBFFDB003A90B66600FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBFFFF003A900000
            00903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          ShowHint = False
          Transparent = True
          Visible = False
        end
        object Label17: TLabel
          Left = 574
          Top = 11
          Width = 106
          Height = 14
          Caption = '- Tarefas em atraso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object Label19: TLabel
          Left = 17
          Top = 11
          Width = 108
          Height = 14
          Caption = 'DL - Descartar Leite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label23: TLabel
          Left = 199
          Top = 11
          Width = 146
          Height = 14
          Caption = 'NDC - N'#227'o Descartar Carne'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
      end
    end
    object tbsCronologico: TTabSheet
      Caption = 'Ordem Cronol'#243'gica'
      ImageIndex = 1
      object dbgOcorrenciasCronologica: TJvDBUltimGrid
        Left = 0
        Top = 0
        Width = 1259
        Height = 432
        Align = alClient
        DataSource = dtsOcorrenciasCronologica
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnEditButtonClick = dbgOcorrenciasCronologicaEditButtonClick
        OnEnter = dbgOcorrenciasCronologicaEnter
        OnKeyPress = dbgOcorrenciasCronologicaKeyPress
        AutoAppend = False
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
            Width = 64
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
            Width = 64
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'NOMEFUNCIONARIO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REEXECUTAR_EM'
            Width = 100
            Visible = True
          end>
      end
      object DBMemo1: TDBMemo
        Left = 404
        Top = 152
        Width = 217
        Height = 97
        DataField = 'OBS'
        DataSource = dtsOcorrenciasCronologica
        TabOrder = 1
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
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
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
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
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
        TabOrder = 4
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
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = False
      end
    end
  end
  object ActionList: TInternalActionList
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
