inherited Zoo_RelatorioRastreamentoFormDialog: TZoo_RelatorioRastreamentoFormDialog
  Left = 402
  Top = 214
  Caption = ' Rastreamento  - Lista de animais'
  ClientHeight = 430
  ClientWidth = 725
  ExplicitWidth = 731
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 725
    Height = 430
    ExplicitWidth = 725
    ExplicitHeight = 430
    inherited _pnlDetail: TJvPanel
      Width = 721
      Height = 393
      ExplicitWidth = 721
      ExplicitHeight = 393
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 721
        Height = 393
        Align = alClient
        TabOrder = 0
        object JvDBUltimGrid1: TJvDBUltimGrid
          Left = 0
          Top = 0
          Width = 717
          Height = 234
          Align = alClient
          DataSource = dtsListaAnimais
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = JvDBUltimGrid1DblClick
          OnShowEditor = JvDBUltimGrid1ShowEditor
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'BRINCO'
              Title.Caption = 'Brinco'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMEESTABULO'
              Title.Caption = 'Nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE'
              Title.Caption = 'Lote'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_EVENTO'
              Title.Caption = 'Data'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS'
              Title.Caption = 'Status reprodutivo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ULTIMA_PESAGEM'
              Title.Caption = #218'ltima pesagem'
              Visible = True
            end>
        end
        object Memo1: TMemo
          Left = 0
          Top = 234
          Width = 717
          Height = 155
          Align = alBottom
          Lines.Strings = (
            'Memo1')
          TabOrder = 1
          Visible = False
        end
      end
    end
    inherited _pnlFooter: TJvPanel
      Top = 395
      Width = 721
      Height = 33
      ExplicitTop = 395
      ExplicitWidth = 721
      ExplicitHeight = 33
      inherited _imageBottom: TImage
        Width = 721
        Height = 33
        ExplicitWidth = 645
        ExplicitHeight = 33
      end
      object _btbSave: TTcGDIButton
        Left = 619
        Top = 3
        Width = 100
        Height = 29
        Anchors = [akRight, akBottom]
        Caption = '&OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ModalResult = 1
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 0
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
      object _btbCancel: TTcGDIButton
        Left = 503
        Top = 3
        Width = 100
        Height = 29
        Anchors = [akRight, akBottom]
        Caption = 'Cancela&r'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ModalResult = 2
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
    end
  end
  object dtsListaAnimais: TDataSource
    Left = 586
    Top = 57
  end
end
