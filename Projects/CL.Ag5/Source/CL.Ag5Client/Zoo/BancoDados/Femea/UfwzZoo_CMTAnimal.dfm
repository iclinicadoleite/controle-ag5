object fwzZoo_CMTAnimal: TfwzZoo_CMTAnimal
  Left = 535
  Top = 181
  Caption = 'CMT Animal'
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
    object dbgCMT: TJvDBUltimGrid
      Left = 1
      Top = 1
      Width = 302
      Height = 199
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtsCMT
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnEditButtonClick = dbgCMTEditButtonClick
      OnEnter = dbgCMTEnter
      OnKeyDown = dbgCMTKeyDown
      OnKeyPress = dbgCMTKeyPress
      OnShowEditor = dbgCMTShowEditor
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
          Width = 79
          Visible = True
        end
        item
          DropDownRows = 4
          Expanded = False
          FieldName = 'DESC_AD'
          Width = 25
          Visible = True
        end
        item
          DropDownRows = 4
          Expanded = False
          FieldName = 'DESC_AE'
          Width = 25
          Visible = True
        end
        item
          DropDownRows = 4
          Expanded = False
          FieldName = 'DESC_PD'
          Width = 25
          Visible = True
        end
        item
          DropDownRows = 4
          Expanded = False
          FieldName = 'DESC_PE'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBSERVACAO'
          Width = 47
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'NOMEFUNCIONARIO'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOTE'
          ReadOnly = True
          Width = 27
          Visible = True
        end>
    end
    object DBMemo1: TDBMemo
      Left = 252
      Top = 145
      Width = 279
      Height = 83
      DataField = 'OBSERVACAO'
      DataSource = dtsCMT
      TabOrder = 0
      Visible = False
    end
    object JvDBDateEdit1: TTcDBDateEdit
      Left = 293
      Top = 93
      Width = 113
      Height = 21
      Checked = False
      DataField = 'DATA'
      DataSource = dtsCMT
      CheckOnExit = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ButtonWidth = 20
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
  end
  object ActionList: TInternalActionList
  end
  object dtsCMT: TDataSource
    DataSet = dtmZoo_CMTAnimal.cdsCMT
    OnDataChange = dtsCMTDataChange
    Left = 461
    Top = 45
  end
end
