inherited fwzZoo_EscoreAnimal: TfwzZoo_EscoreAnimal
  Left = 406
  Top = 224
  Caption = 'Escore Animal'
  ExplicitWidth = 640
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 0
    Width = 624
    Height = 333
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
    object dbgEscores: TJvDBUltimGrid
      Left = 1
      Top = 1
      Width = 622
      Height = 331
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtsEscores
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      OnEditButtonClick = dbgEscoresEditButtonClick
      OnKeyPress = dbgEscoresKeyPress
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <
        item
          ControlName = 'JvDBDateEdit1'
          FieldName = 'DATAEVENTO'
          FitCell = fcCellSize
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'JvDBCalcEdit1'
          FieldName = 'DOSES'
          FitCell = fcCellSize
          LeaveOnUpDownKey = True
        end>
      RowsHeight = 17
      TitleRowHeight = 18
    end
    object deData: TTcDBDateEdit
      Left = 92
      Top = 72
      Width = 121
      Height = 21
      Checked = False
      DataField = 'DATA'
      DataSource = dtsEscores
      CheckOnExit = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
  end
  inherited ActionList: TInternalActionList
    Left = 584
    Top = 28
  end
  object dtsEscores: TDataSource
    Left = 466
    Top = 222
  end
end
