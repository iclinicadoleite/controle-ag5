object frmZoo_ResultadoExamesAnimal: TfrmZoo_ResultadoExamesAnimal
  Left = 490
  Top = 331
  Caption = 'frmZoo_ResultadoExamesAnimal'
  ClientHeight = 462
  ClientWidth = 1061
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ActionList.Top = 48
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1061
    Height = 462
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
    object dbgResultadoExames: TJvDBUltimGrid
      Left = 1
      Top = 1
      Width = 1059
      Height = 460
      Align = alClient
      DataSource = dtsExames
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnEditButtonClick = dbgResultadoExamesEditButtonClick
      OnKeyDown = dbgResultadoExamesKeyDown
      OnKeyPress = dbgResultadoExamesKeyPress
      AutoAppend = False
      OnShowEditor = dbgResultadoExamesShowEditor
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <
        item
          ControlName = 'DBMemo1'
          FieldName = 'OBS_EXAME'
          FitCell = fcCellSize
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'TcDBDateEdit1'
          FieldName = 'DATA_RESULTADO'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'dblcResultado1'
          FieldName = 'DESCR_RESULTADO1'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
        end
        item
          ControlName = 'dblcResultado2'
          FieldName = 'DESCR_RESULTADO2'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
        end
        item
          ControlName = 'dblcResultado3'
          FieldName = 'DESCR_RESULTADO3'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
        end>
      RowsHeight = 17
      TitleRowHeight = 17
      OnCheckIfBooleanField = dbgResultadoExamesCheckIfBooleanField
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROTOCOLO'
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIAGNOSTICO'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATADIAGNOSTICO'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCR_QUARTO'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATASTATUS'
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_RESULTADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCR_RESULTADO1'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROTOCOLO_RESULTADO1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCR_RESULTADO2'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROTOCOLO_RESULTADO2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCR_RESULTADO3'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROTOCOLO_RESULTADO3'
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'NOMEFUNCIONARIO_EXAME'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_EXAME'
          Width = 66
          Visible = True
        end>
    end
    object DBMemo1: TDBMemo
      Left = 253
      Top = 148
      Width = 185
      Height = 89
      DataField = 'OBS_EXAME'
      DataSource = dtsExames
      TabOrder = 1
      Visible = False
    end
    object TcDBDateEdit1: TTcDBDateEdit
      Left = 232
      Top = 96
      Width = 121
      Height = 21
      Checked = False
      DataField = 'DATA_RESULTADO'
      DataSource = dtsExames
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
    object dblcResultado1: TDBLookupComboBox
      Left = 528
      Top = 140
      Width = 119
      Height = 21
      DataField = 'KZOO_TAREFA_RESULTADO1'
      DataSource = dtsExames
      DropDownRows = 15
      DropDownWidth = 200
      KeyField = 'KZOO_TAREFA_RESULTADO'
      ListField = 'NOME'
      ListSource = dtsListaResultado1
      TabOrder = 3
      Visible = False
      OnEnter = dblcResultadoEnter
      OnExit = dblcResultadoExit
      OnKeyDown = dblcResultadoKeyDown
    end
    object dblcResultado2: TDBLookupComboBox
      Left = 528
      Top = 167
      Width = 119
      Height = 21
      DataField = 'KZOO_TAREFA_RESULTADO2'
      DataSource = dtsExames
      DropDownRows = 15
      DropDownWidth = 200
      KeyField = 'KZOO_TAREFA_RESULTADO'
      ListField = 'NOME'
      ListSource = dtsListaResultado2
      TabOrder = 4
      Visible = False
      OnEnter = dblcResultadoEnter
      OnExit = dblcResultadoExit
      OnKeyDown = dblcResultadoKeyDown
    end
    object dblcResultado3: TDBLookupComboBox
      Left = 528
      Top = 194
      Width = 116
      Height = 21
      DataField = 'KZOO_TAREFA_RESULTADO3'
      DataSource = dtsExames
      DropDownRows = 15
      DropDownWidth = 200
      KeyField = 'KZOO_TAREFA_RESULTADO'
      ListField = 'NOME'
      ListSource = dtsListaResultado3
      TabOrder = 5
      Visible = False
      OnEnter = dblcResultadoEnter
      OnExit = dblcResultadoExit
      OnKeyDown = dblcResultadoKeyDown
    end
  end
  object ActionList: TInternalActionList
    Top = 48
  end
  object dtsExames: TDataSource
    DataSet = dtmZoo_ResultadoExamesAnimal.cdsExames
    Left = 413
    Top = 77
  end
  object dtsListaResultado1: TDataSource
    DataSet = dtmZoo_ResultadoExamesAnimal.cdsTipoResultado1
    Left = 680
    Top = 136
  end
  object dtsListaResultado2: TDataSource
    DataSet = dtmZoo_ResultadoExamesAnimal.cdsTipoResultado2
    Left = 680
    Top = 184
  end
  object dtsListaResultado3: TDataSource
    DataSet = dtmZoo_ResultadoExamesAnimal.cdsTipoResultado3
    Left = 680
    Top = 232
  end
end
