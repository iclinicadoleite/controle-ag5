inherited Zoo_CfgParamMatrizesForm: TZoo_CfgParamMatrizesForm
  Left = 303
  Top = 162
  Caption = 'Par'#226'metros Matrizes'
  Font.Height = -13
  PixelsPerInch = 96
  TextHeight = 16
  inherited _pnlFicha: TPanel
    inherited _pnlFooter: TPanel
      inherited _ToolBar: TToolBar
        Top = 0
        ExplicitTop = 0
      end
    end
    inherited _ScrollBoxFicha: TScrollBox
      inherited _dbgLista: TJvDBUltimGrid
        BorderStyle = bsNone
        Font.Height = -13
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        AutoAppend = False
        BevelKind = bkTile
        OnShowEditor = JvDBUltimGrid1ShowEditor
        AlternateRowColor = clBtnFace
        AutoSizeColumns = True
        CanDelete = False
        EditControls = <
          item
            ControlName = 'edValorPrimipara'
            FieldName = 'PRIMIPARA'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end
          item
            ControlName = 'edValorMultipara'
            FieldName = 'MULTIPARA'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end>
        RowsHeight = 20
        OnCheckIfBooleanField = JvDBUltimGrid1CheckIfBooleanField
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 323
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIMIPARA'
            PickList.Strings = (
              '5.000'
              '7.000'
              '10.000')
            Title.Alignment = taCenter
            Title.Caption = 'Prim'#237'para'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MULTIPARA'
            Title.Alignment = taCenter
            Title.Caption = 'Mult'#237'para'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SYS$UU'
            Width = 192
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SYS$DU'
            Width = 51
            Visible = True
          end>
      end
      object edValorPrimipara: TJvDBCalcEdit
        Left = 500
        Top = 64
        Width = 121
        Height = 24
        DecimalPlaceRound = True
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        MinValue = 1.000000000000000000
        ParentFont = False
        ShowButton = False
        TabOrder = 1
        Value = 1.000000000000000000
        Visible = False
        ZeroEmpty = False
        DecimalPlacesAlwaysShown = False
        OnKeyPress = edValorPrimiparaKeyPress
        DataField = 'PRIMIPARA'
        DataSource = dtsFicha
      end
      object edValorMultipara: TJvDBCalcEdit
        Left = 627
        Top = 64
        Width = 121
        Height = 24
        DecimalPlaceRound = True
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        MinValue = 1.000000000000000000
        ParentFont = False
        ShowButton = False
        TabOrder = 2
        Value = 1.000000000000000000
        Visible = False
        ZeroEmpty = False
        DecimalPlacesAlwaysShown = False
        OnKeyPress = edValorPrimiparaKeyPress
        DataField = 'MULTIPARA'
        DataSource = dtsFicha
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actNew: TAction
      Enabled = False
      OnUpdate = NoAct
    end
    inherited _actDelete: TAction
      Enabled = False
      OnUpdate = NoAct
    end
    inherited _actOther: TAction
      Enabled = False
      OnUpdate = NoAct
    end
  end
  object JvPopupMenu1: TJvPopupMenu [2]
    Alignment = paRight
    MenuAnimation = [maTopToBottom]
    Style = msXP
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 50
    TextMargin = 50
    OnMeasureItem = JvPopupMenu1MeasureItem
    Left = 469
    Top = 160
  end
  inherited dtsFicha: TDataSource
    DataSet = Zoo_CfgParamMatrizesDatamodule.cdsEdit
  end
end
