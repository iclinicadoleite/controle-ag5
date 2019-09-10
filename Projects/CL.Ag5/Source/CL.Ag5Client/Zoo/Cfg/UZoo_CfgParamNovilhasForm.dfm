inherited Zoo_CfgParamNovilhasForm: TZoo_CfgParamNovilhasForm
  Left = 394
  Top = 218
  Caption = 'Par'#226'metros Novilhas'
  Font.Height = -13
  PixelsPerInch = 96
  TextHeight = 16
  inherited _pnlFicha: TPanel
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
            ControlName = 'edValor'
            FieldName = 'VALOR'
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
            ReadOnly = True
            Width = 495
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SYS$UU'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SYS$DU'
            Width = 71
            Visible = True
          end>
      end
      object edValor: TJvDBCalcEdit
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
        OnKeyPress = edValorKeyPress
        DataField = 'VALOR'
        DataSource = dtsFicha
      end
    end
  end
  object JvSaveDialog1: TJvSaveDialog [1]
    Height = 0
    Width = 0
    Left = 717
    Top = 54
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
  inherited dtsFicha: TDataSource
    DataSet = Zoo_CfgParamNovilhasDatamodule.cdsEdit
  end
end
