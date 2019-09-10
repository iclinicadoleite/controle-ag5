object fwzZoo_CondicaoCorporalAnimal: TfwzZoo_CondicaoCorporalAnimal
  Left = 433
  Top = 315
  Caption = 'Condi'#231#227'o Corporal Animal'
  ClientHeight = 201
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 304
    Height = 201
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    Caption = '_pnldbgLista'
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object dbgCC: TJvDBUltimGrid
      Left = 1
      Top = 1
      Width = 302
      Height = 199
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource1
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnEditButtonClick = dbgCCEditButtonClick
      OnEnter = dbgCCEnter
      OnKeyDown = dbgCCKeyDown
      OnKeyPress = dbgCCKeyPress
      OnShowEditor = dbgCCShowEditor
      AutoSizeColumns = True
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <
        item
          ControlName = 'JvDBDateEdit1'
          FieldName = 'DATA'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'JvDBCalcEdit1'
          FieldName = 'CC'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'DBMemo1'
          FieldName = 'OBSERVACAO'
          FitCell = fcBiggest
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA'
          Width = 195
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CC'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBSERVACAO'
          Width = 185
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'NOMEFUNCIONARIO'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOTE'
          ReadOnly = True
          Width = 58
          Visible = True
        end>
    end
    object DBMemo1: TDBMemo
      Left = 252
      Top = 145
      Width = 279
      Height = 83
      DataField = 'OBSERVACAO'
      DataSource = DataSource1
      TabOrder = 0
      Visible = False
    end
    object JvDBCalcEdit1: TJvDBCalcEdit
      Left = 419
      Top = 104
      Width = 112
      Height = 21
      DisplayFormat = '0.##'
      ShowButton = False
      TabOrder = 1
      Visible = False
      DecimalPlacesAlwaysShown = False
      DataField = 'CC'
      DataSource = DataSource1
    end
    object JvDBDateEdit1: TTcDBDateEdit
      Left = 293
      Top = 93
      Width = 113
      Height = 21
      Checked = False
      DataField = 'DATA'
      DataSource = DataSource1
      CheckOnExit = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ButtonWidth = 20
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
  object ActionList: TInternalActionList
  end
  object DataSource1: TDataSource
    DataSet = dtmZoo_CondicaoCorporalAnimal.cdsCC
    Left = 461
    Top = 77
  end
end
