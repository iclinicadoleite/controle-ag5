object frmZoo_CrescimentoAnimal: TfrmZoo_CrescimentoAnimal
  Left = 510
  Top = 316
  Caption = 'frmZoo_CrescimentoAnimal'
  ClientHeight = 246
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel9: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 246
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
    object JvDBUltimGrid10: TJvDBUltimGrid
      Left = 1
      Top = 1
      Width = 604
      Height = 244
      Align = alClient
      DataSource = dtsCrescimento
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <
        item
          ControlName = 'deDtCrescimento'
          FieldName = 'DATA'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'DBMemo1'
          FieldName = 'OBSERVACAO'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDADE'
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESO'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GANHOPESO'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALTURA'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBSERVACAO'
          Width = 80
          Visible = True
        end>
    end
    object deDtCrescimento: TTcDBDateEdit
      Left = 15
      Top = 70
      Width = 106
      Height = 21
      Checked = False
      DataField = 'DATA'
      DataSource = dtsCrescimento
      CheckOnExit = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object DBMemo1: TDBMemo
      Left = 254
      Top = 51
      Width = 186
      Height = 89
      DataField = 'OBSERVACAO'
      DataSource = dtsCrescimento
      TabOrder = 2
      Visible = False
    end
  end
  object ActionList: TInternalActionList
  end
  object dtsCrescimento: TDataSource
    DataSet = dtmZoo_CrescimentoAnimal.cdsCrescimento
    Left = 120
    Top = 10
  end
end
