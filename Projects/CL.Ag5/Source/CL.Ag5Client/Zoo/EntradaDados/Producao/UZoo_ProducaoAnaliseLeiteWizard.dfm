inherited Zoo_ProducaoAnaliseLeiteWizard: TZoo_ProducaoAnaliseLeiteWizard
  Left = 258
  Top = 213
  Caption = 'An'#225'lise de Leite'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlDetail: TJvPanel
      ExplicitHeight = 310
      inherited PageControl: TJvPageControl
        ActivePage = TabSheet2
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Label3: TLabel
            Left = 15
            Top = 62
            Width = 37
            Height = 13
            Caption = 'Arquivo'
          end
          object edFileName: TTcFilenameEdit
            Left = 68
            Top = 59
            Width = 437
            Height = 21
            Checked = False
            AddQuotes = False
            Filter = 
              'Arquivos de an'#225'lise (*.cdla ; *.sql ; *.xls*)|*.cdla;*.sql;*.xls' +
              '*|Arquivo de an'#225'lise (*.cdla )|*.cdla|Arquivo de an'#225'lise (*.sql)' +
              '|*.sql|Arquivo de an'#225'lise (*.xls)|*.xls*'
            TabOrder = 0
            Text = ''
          end
          object pnlTeste: TPanel
            Left = 15
            Top = 153
            Width = 329
            Height = 132
            Caption = ' '
            TabOrder = 1
            object Label1: TLabel
              Left = 15
              Top = 30
              Width = 76
              Height = 13
              Caption = 'Data para teste'
            end
            object Label2: TLabel
              Left = 17
              Top = 66
              Width = 37
              Height = 13
              Caption = 'Arquivo'
            end
            object Label4: TLabel
              Left = 17
              Top = 2
              Width = 232
              Height = 13
              Caption = 'Gerador de teste - apenas com o delphi rodando'
            end
            object Button1: TTcGDIButton
              Left = 220
              Top = 98
              Width = 75
              Height = 25
              Caption = 'Gerar teste'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 0
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
            object edtFileTeste: TTcFilenameEdit
              Left = 75
              Top = 62
              Width = 220
              Height = 21
              Checked = False
              AddQuotes = False
              Filter = 'Arquivos clla (*.clla)|*.clla|Arquivos sql (*.sql)|*.sql'
              TabOrder = 1
              Text = ''
            end
            object deTeste: TTcDateEdit
              Left = 174
              Top = 27
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 2
            end
          end
          object TcGDIButton1: TTcGDIButton
            Left = 68
            Top = 110
            Width = 142
            Height = 25
            Caption = 'Obter arquivo modelo'
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            TabOrder = 2
            OnClick = TcGDIButton1Click
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
          DesignSize = (
            527
            287)
          object Label5: TLabel
            Left = 7
            Top = 15
            Width = 172
            Height = 13
            Caption = 'Data de processamento da an'#225'lise :'
          end
          object Label6: TLabel
            Left = 7
            Top = 39
            Width = 272
            Height = 13
            Caption = 'Selecione uma pesagem de leite para importar a an'#225'lise :'
          end
          object Panel1: TPanel
            Left = 7
            Top = 62
            Width = 124
            Height = 116
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            BevelOuter = bvNone
            BorderWidth = 1
            Caption = '_pnldbgLista'
            Color = clSilver
            ParentBackground = False
            TabOrder = 0
            object JvDBUltimGrid1: TJvDBUltimGrid
              Left = 1
              Top = 1
              Width = 122
              Height = 114
              Align = alClient
              DataSource = dtsLotes
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
            end
          end
          object Panel2: TPanel
            Left = 137
            Top = 62
            Width = 385
            Height = 198
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            BorderWidth = 1
            Caption = '_pnldbgLista'
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            object JvDBUltimGrid2: TJvDBUltimGrid
              Left = 1
              Top = 1
              Width = 383
              Height = 196
              Align = alClient
              DataSource = dtsPesagens
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnShowEditor = JvDBUltimGrid2ShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
            end
          end
          object DBEdit1: TDBEdit
            Left = 225
            Top = 12
            Width = 121
            Height = 21
            DataField = 'DATA'
            DataSource = dtsLoteAnalise
            ReadOnly = True
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actNext: TAction
      OnUpdate = _actNextUpdate
    end
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object dtsLotes: TDataSource
    AutoEdit = False
    DataSet = Zoo_ProducaoAnaliseLeiteDatamodule.cdsLotes
    Left = 58
    Top = 116
  end
  object dtsPesagens: TDataSource
    AutoEdit = False
    DataSet = Zoo_ProducaoAnaliseLeiteDatamodule.cdsPesagens
    Left = 194
    Top = 116
  end
  object dtsLoteAnalise: TDataSource
    DataSet = Zoo_ProducaoAnaliseLeiteDatamodule.cdsLoteAnalise
    Left = 366
    Top = 56
  end
  object JvSaveDialog1: TJvSaveDialog
    DefaultExt = '.xls'
    FileName = 'Modelo An'#225'lises.xlsx'
    Filter = 'modelo an'#225'lises|*.xlsx'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Salvar modelo an'#225'lises'
    ActiveStyle = asReport
    DefBtnCaption = 'Salvar'
    Height = 0
    Width = 0
    Left = 494
    Top = 56
  end
end
