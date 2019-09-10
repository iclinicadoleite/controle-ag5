inherited frmCustomEditaLista: TfrmCustomEditaLista
  Left = 268
  Top = 153
  Caption = 'frmCustomEditaLista'
  ExplicitLeft = 268
  ExplicitTop = 153
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlFicha: TPanel
    inherited _pnlFooter: TPanel
      TabOrder = 2
    end
    inherited _ScrollBoxFicha: TScrollBox
      Top = 53
      Height = 334
      TabOrder = 1
      ExplicitTop = 53
      ExplicitHeight = 332
      object JvDBUltimGrid1: TJvDBUltimGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 334
        Align = alClient
        BorderStyle = bsNone
        DataSource = dtsFicha
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -9
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        BevelKind = bkTile
        AlternateRowColor = clBtnFace
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 16
        TitleRowHeight = 16
      end
    end
    object _pnlSearch: TPanel
      Left = 1
      Top = 1
      Width = 784
      Height = 52
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      Caption = ' '
      ParentBackground = False
      TabOrder = 0
    end
  end
end
