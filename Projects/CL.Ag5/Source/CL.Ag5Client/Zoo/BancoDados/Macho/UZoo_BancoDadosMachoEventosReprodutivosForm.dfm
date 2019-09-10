object Zoo_BancoDadosMachoEventosReprodutivosForm: TZoo_BancoDadosMachoEventosReprodutivosForm
  Left = 316
  Top = 300
  Caption = 'Zoo_BancoDadosMachoEventosReprodutivosForm'
  ClientHeight = 462
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel11: TPanel
    Left = 0
    Top = 0
    Width = 854
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
    object dbgEventosReprodutivos: TJvDBUltimGrid
      Left = 1
      Top = 1
      Width = 852
      Height = 460
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtsEventosZootecnicos
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnShowEditor = dbgEventosReprodutivosShowEditor
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      OnCheckIfBooleanField = dbgEventosReprodutivosCheckIfBooleanField
      Columns = <
        item
          Expanded = False
          FieldName = 'DATAEVENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_EVENTO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEFEMEA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOSES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRENHEZ'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAABORTOPARTO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_PARTOABORTO'
          Title.Caption = 'Parto/aborto/coleta'
          Width = 64
          Visible = True
        end>
    end
  end
  object ActionList: TInternalActionList
  end
  object dtsEventosZootecnicos: TDataSource
    DataSet = Zoo_BancoDadosMachoEventosReprodutivosDatamodule.cdsEventosZoo
    Left = 613
    Top = 54
  end
end
