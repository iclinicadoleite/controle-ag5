object frmZoo_FilhosAnimal: TfrmZoo_FilhosAnimal
  Left = 441
  Top = 232
  ActiveControl = JvDBUltimGrid7
  Caption = 'frmZoo_FilhosAnimal'
  ClientHeight = 165
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 509
    Height = 165
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
    object JvDBUltimGrid7: TJvDBUltimGrid
      Left = 1
      Top = 1
      Width = 507
      Height = 163
      Align = alClient
      DataSource = dtsFilhos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      AutoAppend = False
      OnShowEditor = JvDBUltimGrid7ShowEditor
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <
        item
          ControlName = 'edNatimorto'
          FieldName = 'NATIMORTO'
          FitCell = fcCellSize
        end>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'NASCIMENTO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BRINCO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEANIMAL'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEXO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NATIMORTO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRAUSANGUE'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RACA'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEPAI'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESO'
          Width = 50
          Visible = True
        end>
    end
    object edNatimorto: TJvDBComboBox
      Left = 309
      Top = 54
      Width = 84
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'NATIMORTO'
      DataSource = dtsFilhos
      Items.Strings = (
        'Sim'
        'N'#227'o')
      TabOrder = 1
      Values.Strings = (
        'T'
        'F')
      Visible = False
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Verdana'
      ListSettings.OutfilteredValueFont.Style = []
      OnEnter = edNatimortoEnter
    end
  end
  object ActionList: TInternalActionList
  end
  object dtsFilhos: TDataSource
    DataSet = dtmZoo_FilhosAnimal.cdsFilhos
    Left = 413
    Top = 22
  end
end
