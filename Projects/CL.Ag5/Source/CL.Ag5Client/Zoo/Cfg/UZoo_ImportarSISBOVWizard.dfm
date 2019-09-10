inherited Zoo_ImportarSISBOVWizard: TZoo_ImportarSISBOVWizard
  Left = 451
  Top = 201
  Caption = 'Importa'#231#227'o SISBOV'
  ActionList.Left = 422
  ActionList.Top = 42
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlFooter: TJvPanel
      inherited _btbExecute: TTcGDIButton
        Top = 5
        ExplicitTop = 5
      end
    end
    inherited _pnlDetail: TJvPanel
      inherited PageControl: TJvPageControl
        ActivePage = tbsSelect
        object tbsSelect: TTabSheet
          Caption = 'tbsSelect'
          object Label1: TLabel
            Left = 84
            Top = 76
            Width = 41
            Height = 13
            Caption = 'Fazenda'
          end
          object Label3: TLabel
            Left = 84
            Top = 36
            Width = 62
            Height = 13
            Caption = 'Certificadora'
            FocusControl = DBLookupComboBox1
          end
          object Label2: TLabel
            Left = 84
            Top = 115
            Width = 76
            Height = 13
            Caption = 'Arquivo SISBOV'
          end
          object DBEdit1: TDBEdit
            Left = 188
            Top = 72
            Width = 277
            Height = 21
            DataField = 'NOME'
            DataSource = dtsFazenda
            ReadOnly = True
            TabOrder = 0
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 188
            Top = 34
            Width = 277
            Height = 21
            DataField = 'NOMECERTIFICADORA'
            DataSource = dtsFazenda
            TabOrder = 1
          end
          object edtFileSISBOV: TTcFilenameEdit
            Left = 188
            Top = 112
            Width = 277
            Height = 21
            Checked = False
            AddQuotes = False
            DefaultExt = '.xlsx'
            Filter = 'Arquivo SISBOV (*.xlsx)|*.xlsx'
            TabOrder = 2
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
            TabOrder = 3
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
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object _ScrollBoxFicha: TScrollBox
            Left = 0
            Top = 0
            Width = 527
            Height = 287
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            object _pnldbgLista: TPanel
              Left = 0
              Top = 0
              Width = 527
              Height = 287
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alClient
              BorderWidth = 1
              Caption = '_pnldbgLista'
              Color = clSilver
              ParentBackground = False
              TabOrder = 0
              object JvDBUltimGrid1: TJvDBUltimGrid
                Left = 2
                Top = 2
                Width = 523
                Height = 283
                Align = alClient
                BorderStyle = bsNone
                DataSource = dtsSISBOV
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -9
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                BevelKind = bkTile
                OnShowEditor = JvDBUltimGrid1ShowEditor
                AlternateRowColor = clBtnFace
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 16
                TitleRowHeight = 16
                OnCheckIfBooleanField = JvDBUltimGrid1CheckIfBooleanField
              end
            end
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 422
    Top = 42
    inherited _actNext: TAction
      OnUpdate = _actNextUpdate
    end
  end
  object dtsFazenda: TDataSource
    DataSet = Zoo_ImportarSISBOVDatamodule.cdsFazenda
    Left = 214
    Top = 61
  end
  object dtsSISBOV: TDataSource
    DataSet = Zoo_ImportarSISBOVDatamodule.cdsSISBOV
    Left = 258
    Top = 64
  end
  object JvSaveDialog1: TJvSaveDialog
    DefaultExt = '.xlsx'
    FileName = 'Modelo SISBOV.xlsx'
    Filter = 'Arquivo modelo SISBOV|*.xlsx'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Salvar arquivo modelo SISBOV'
    ActiveStyle = asReport
    DefBtnCaption = 'Salvar'
    Height = 0
    Width = 0
    Left = 494
    Top = 56
  end
end
