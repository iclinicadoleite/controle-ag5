object fwzZoo_BSTAnimal: TfwzZoo_BSTAnimal
  Left = 538
  Top = 358
  Caption = 'BST Animal'
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
    object dbgBST: TJvDBUltimGrid
      Left = 1
      Top = 139
      Width = 302
      Height = 61
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtsBST
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnEditButtonClick = dbgBSTEditButtonClick
      OnEnter = dbgBSTEnter
      OnKeyDown = dbgBSTKeyDown
      OnKeyPress = dbgBSTKeyPress
      OnShowEditor = dbgBSTShowEditor
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
      OnCheckIfBooleanField = dbgBSTCheckIfBooleanField
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA'
          Width = 148
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APLICADO'
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'NOMEFUNCIONARIO'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_MOTIVO_INTERRUPCAO'
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBSERVACAO'
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOTE'
          ReadOnly = True
          Width = 37
          Visible = True
        end>
    end
    object DBMemo1: TDBMemo
      Left = 196
      Top = 177
      Width = 279
      Height = 83
      DataField = 'OBSERVACAO'
      DataSource = dtsBST
      TabOrder = 0
      Visible = False
    end
    object JvDBDateEdit1: TTcDBDateEdit
      Left = 50
      Top = 187
      Width = 113
      Height = 21
      Checked = False
      DataField = 'DATA'
      DataSource = dtsBST
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
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 302
      Height = 138
      Align = alTop
      Caption = ' '
      TabOrder = 3
      ExplicitWidth = 622
      object JvDBUltimGrid1: TJvDBUltimGrid
        Left = 1
        Top = 1
        Width = 620
        Height = 136
        Align = alClient
        DataSource = dtsLactacoes
        ReadOnly = True
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
  object ActionList: TInternalActionList
  end
  object dtsBST: TDataSource
    DataSet = dtmZoo_BSTAnimal.cdsBST
    OnDataChange = dtsBSTDataChange
    Left = 461
    Top = 77
  end
  object dtsLactacoes: TDataSource
    DataSet = dtmZoo_BSTAnimal.cdsLactacoes
    Left = 65
    Top = 17
  end
end
