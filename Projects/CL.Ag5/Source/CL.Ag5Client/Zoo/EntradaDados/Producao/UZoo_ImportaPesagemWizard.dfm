inherited Zoo_ImportaPesagemWizard: TZoo_ImportaPesagemWizard
  Left = 533
  Top = 312
  ActionList.Left = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlDetail: TJvPanel
      inherited PageControl: TJvPageControl
        ActivePage = TabSheet1
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Label2: TLabel
            Left = 84
            Top = 115
            Width = 86
            Height = 13
            Caption = 'Arquivo Pesagens'
          end
          object edtFilePesagens: TTcFilenameEdit
            Left = 196
            Top = 112
            Width = 277
            Height = 21
            Checked = False
            AddQuotes = False
            DefaultExt = '.xlsx'
            AutoCompleteOptions = [acoAutoSuggest, acoFilterPrefixes]
            Filter = 'Arquivo Pesagens (*.xlsx)|*.xlsx'
            TabOrder = 0
            Text = ''
          end
          object Button1: TTcGDIButton
            Left = 83
            Top = 200
            Width = 142
            Height = 25
            Caption = 'Obter arquivo modelo'
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            TabOrder = 1
            OnClick = Button1Click
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
    end
  end
  inherited ActionList: TInternalActionList
    Left = 452
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object JvSaveDialog1: TJvSaveDialog
    DefaultExt = '.xlsx'
    FileName = 'Modelo Pesagens.xlsx'
    Filter = 'Modelo pesagens|*.xlsx'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Salvar modelo pesagens'
    ActiveStyle = asReport
    DefBtnCaption = 'Salvar'
    Height = 0
    Width = 0
    Left = 494
    Top = 56
  end
end
