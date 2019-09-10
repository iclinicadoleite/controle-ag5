object frmZoo_HistoricoAnimal: TfrmZoo_HistoricoAnimal
  Left = 333
  Top = 204
  Caption = 'frmZoo_HistoricoAnimal'
  ClientHeight = 388
  ClientWidth = 697
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
    Width = 697
    Height = 388
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
    object dbgHistoricoAnimal: TJvDBUltimGrid
      Left = 1
      Top = 1
      Width = 695
      Height = 386
      Align = alClient
      DataSource = dtsHistorico
      GradientEndColor = clSilver
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      TitleButtons = True
      OnGetCellParams = dbgHistoricoAnimalGetCellParams
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      OnCheckIfBooleanField = dbgHistoricoAnimalCheckIfBooleanField
      SortWith = swUserFunc
      OnUserSort = dbgHistoricoAnimalUserSort
      OnGetSortFieldName = dbgHistoricoAnimalGetSortFieldName
      Columns = <
        item
          Expanded = False
          FieldName = 'LACTACAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EVENTO'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 242
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Visible = True
        end
        item
          FieldName = 'DIAS'
          Title.Alignment = taCenter
          Width = -1
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIAS.DIASPARTO'
          Title.Alignment = taCenter
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIAS.DIASEVENTO'
          Title.Alignment = taCenter
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIAS.DIASHOJE'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
  end
  object ActionList: TInternalActionList
  end
  object dtsHistorico: TDataSource
    DataSet = dtmZoo_HistoricoAnimal.cdsHistoricoAnimal
    Left = 387
    Top = 54
  end
end
