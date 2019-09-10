inherited Zoo_CfgCategoriasForm: TZoo_CfgCategoriasForm
  Left = 323
  Top = 177
  Caption = 'Categorias'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlFicha: TPanel
    Constraints.MinHeight = 217
    Font.Height = -13
    ParentFont = False
    inherited _pnlFooter: TPanel
      TabOrder = 2
      inherited _ToolBar: TToolBar
        Left = 65
        Top = 0
        ExplicitLeft = 65
        ExplicitTop = 0
      end
    end
    inherited _ScrollBoxFicha: TScrollBox
      Top = 53
      Height = 414
      TabOrder = 1
      ExplicitTop = 53
      ExplicitHeight = 414
      inherited _dbgLista: TJvDBUltimGrid
        Height = 414
        BorderStyle = bsNone
        DataSource = dtsFicha
        Font.Height = -13
        ParentFont = False
        AutoAppend = False
        BevelKind = bkTile
        AlternateRowColor = clBtnFace
        AutoSizeColumns = True
        CanDelete = False
        EditControls = <
          item
            ControlName = 'edIdadeInferior'
            FieldName = 'IDADE_INFERIOR'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end
          item
            ControlName = 'edIdadeSuperior'
            FieldName = 'IDADE_SUPERIOR'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end
          item
            ControlName = 'edDELInferiror'
            FieldName = 'DEL_INFERIOR'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end
          item
            ControlName = 'edDELSuperior'
            FieldName = 'DEL_SUPERIOR'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end
          item
            ControlName = 'edNLInferior'
            FieldName = 'NL_INFERIOR'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end
          item
            ControlName = 'edNLSuperior'
            FieldName = 'NL_SUPERIOR'
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
            Width = 213
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCR_STATUS'
            Title.Caption = 'Status'
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDADE_INFERIOR'
            Title.Caption = 'Idade inferior'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDADE_SUPERIOR'
            Title.Caption = 'Idade superior'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NL_INFERIOR'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NL_SUPERIOR'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEL_INFERIOR'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEL_SUPERIOR'
            Width = 54
            Visible = True
          end>
      end
      object edIdadeInferior: TJvDBCalcEdit
        Left = 508
        Top = 42
        Width = 121
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowButton = False
        TabOrder = 1
        Visible = False
        ZeroEmpty = False
        DecimalPlacesAlwaysShown = False
        OnExit = edIdadeInferiorExit
        OnKeyPress = edIdadeInferiorKeyPress
        DataField = 'IDADE_INFERIOR'
        DataSource = dtsFicha
      end
      object edIdadeSuperior: TJvDBCalcEdit
        Left = 508
        Top = 68
        Width = 121
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowButton = False
        TabOrder = 2
        Visible = False
        ZeroEmpty = False
        DecimalPlacesAlwaysShown = False
        OnKeyPress = edIdadeInferiorKeyPress
        DataField = 'IDADE_SUPERIOR'
        DataSource = dtsFicha
      end
      object edDELInferiror: TJvDBCalcEdit
        Left = 508
        Top = 98
        Width = 121
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowButton = False
        TabOrder = 3
        Visible = False
        ZeroEmpty = False
        DecimalPlacesAlwaysShown = False
        OnKeyPress = edIdadeInferiorKeyPress
        DataField = 'DEL_INFERIOR'
        DataSource = dtsFicha
      end
      object edDELSuperior: TJvDBCalcEdit
        Left = 508
        Top = 132
        Width = 121
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowButton = False
        TabOrder = 4
        Visible = False
        ZeroEmpty = False
        DecimalPlacesAlwaysShown = False
        OnKeyPress = edIdadeInferiorKeyPress
        DataField = 'DEL_SUPERIOR'
        DataSource = dtsFicha
      end
      object edNLInferior: TJvDBCalcEdit
        Left = 508
        Top = 162
        Width = 121
        Height = 24
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowButton = False
        TabOrder = 5
        Visible = False
        ZeroEmpty = False
        DecimalPlacesAlwaysShown = False
        OnKeyPress = edIdadeInferiorKeyPress
        DataField = 'NL_INFERIOR'
        DataSource = dtsFicha
      end
      object edNLSuperior: TJvDBCalcEdit
        Left = 508
        Top = 192
        Width = 121
        Height = 24
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowButton = False
        TabOrder = 6
        Visible = False
        ZeroEmpty = False
        DecimalPlacesAlwaysShown = False
        OnKeyPress = edNLSuperiorKeyPress
        DataField = 'NL_SUPERIOR'
        DataSource = dtsFicha
      end
    end
    object _pnlSearch: TPanel
      Left = 1
      Top = 1
      Width = 730
      Height = 52
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      Caption = ' '
      ParentBackground = False
      TabOrder = 0
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actOther: TAction
      Enabled = False
      OnUpdate = NoAct
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = Zoo_CfgCategoriasDatamodule.cdsCategorias
  end
end
