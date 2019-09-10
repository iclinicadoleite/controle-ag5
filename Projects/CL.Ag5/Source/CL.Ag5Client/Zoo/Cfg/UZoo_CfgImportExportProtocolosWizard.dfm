inherited Zoo_CfgImportExportProtocolosWizard: TZoo_CfgImportExportProtocolosWizard
  Left = 857
  Top = 359
  Caption = 'Importa'#231#227'o/Exporta'#231#227'o de Protocolos e Tarefas'
  ClientHeight = 437
  ClientWidth = 682
  ExplicitWidth = 688
  ExplicitHeight = 466
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 682
    Height = 437
    ExplicitWidth = 682
    ExplicitHeight = 437
    inherited _pnlFooter: TJvPanel
      Top = 406
      Width = 678
      ExplicitTop = 406
      ExplicitWidth = 678
      inherited _imageBottom: TImage
        Width = 678
        ExplicitWidth = 678
      end
      inherited _btbPrior: TTcGDIButton
        Left = 487
        ExplicitLeft = 487
      end
      inherited _btbNext: TTcGDIButton
        Left = 578
        ExplicitLeft = 578
      end
      inherited _btbExecute: TTcGDIButton
        Left = 593
        ExplicitLeft = 593
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 678
      Height = 404
      ExplicitWidth = 678
      ExplicitHeight = 404
      inherited PageControl: TJvPageControl
        Width = 678
        Height = 404
        ActivePage = tbsSelect
        ExplicitWidth = 678
        ExplicitHeight = 404
        object tbsSelect: TTabSheet
          Caption = 'tbsSelect'
          object rbImportar: TRadioButton
            Left = 60
            Top = 130
            Width = 201
            Height = 17
            Caption = 'Importar protocolos / tarefas'
            TabOrder = 0
            OnClick = rbImportarClick
          end
          object rbExportar: TRadioButton
            Left = 60
            Top = 24
            Width = 193
            Height = 17
            Caption = 'Exportar protocolos / tarefas'
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = rbExportarClick
          end
          object edtImport: TTcFilenameEdit
            Left = 99
            Top = 166
            Width = 334
            Height = 21
            Checked = False
            AddQuotes = False
            DefaultExt = '.cpt'
            Filter = 'Arquivo de Protocolos e Tarefas |*.cpt'
            DialogTitle = 'Importar arquivos de Protocolos e Tarefas'
            Enabled = False
            TabOrder = 2
            Text = ''
          end
        end
        object tbsSelectExport: TTabSheet
          Caption = 'tbsSelectExport'
          ImageIndex = 2
          object Panel1: TPanel
            Left = 8
            Top = 27
            Width = 320
            Height = 296
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            BorderWidth = 1
            Caption = '_pnldbgLista'
            Color = clSilver
            ParentBackground = False
            TabOrder = 0
            object dbgOutProtocolos: TJvDBUltimGrid
              Left = 2
              Top = 21
              Width = 316
              Height = 273
              Align = alClient
              DataSource = dtsExportProtocolos
              Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = dbgOutProtocolosCellClick
              OnKeyPress = dbgOutProtocolosKeyPress
              OnShowEditor = dbgShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              OnCheckIfBooleanField = dbgCheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EXPORT'
                  Width = 35
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  ReadOnly = True
                  Title.Caption = 'Protocolos a exportar'
                  Width = 77
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  ReadOnly = True
                  Width = 165
                  Visible = True
                end>
            end
            object Panel5: TPanel
              Left = 2
              Top = 2
              Width = 316
              Height = 19
              Align = alTop
              Caption = 'Protocolos a Exportar'
              TabOrder = 1
            end
          end
          object Panel2: TPanel
            Left = 341
            Top = 27
            Width = 315
            Height = 296
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            BorderWidth = 1
            Caption = '_pnldbgLista'
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            object dbgOutTarefas: TJvDBUltimGrid
              Left = 2
              Top = 21
              Width = 311
              Height = 273
              Align = alClient
              DataSource = dtsExportTarefas
              Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = dbgOutTarefasCellClick
              OnKeyPress = dbgOutTarefasKeyPress
              OnShowEditor = dbgShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              OnCheckIfBooleanField = dbgCheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EXPORT'
                  Width = 27
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  ReadOnly = True
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  ReadOnly = True
                  Title.Caption = 'Tarefas a exportar'
                  Width = 204
                  Visible = True
                end>
            end
            object Panel6: TPanel
              Left = 2
              Top = 2
              Width = 311
              Height = 19
              Align = alTop
              Caption = 'Tarefas a Exportar'
              TabOrder = 1
            end
          end
          object cbExportAllProtocolos: TCheckBox
            Left = 12
            Top = 6
            Width = 233
            Height = 17
            Caption = 'Exportar todos protocolos'
            TabOrder = 2
            OnClick = cbExportAllProtocolosClick
          end
          object cbExportAllTarefas: TCheckBox
            Left = 344
            Top = 6
            Width = 233
            Height = 17
            Caption = 'Exportar todas tarefas'
            TabOrder = 3
            OnClick = cbExportAllTarefasClick
          end
        end
        object tbsDoImport: TTabSheet
          Caption = 'tbsDoImport'
          ImageIndex = 4
          object Label1: TLabel
            Left = 12
            Top = 328
            Width = 567
            Height = 13
            Caption = 
              'Protocolos / Tarefas marcados em vermelho j'#225' existem na base de ' +
              'dados e n'#227'o ser'#227'o importados.'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Panel3: TPanel
            Left = 8
            Top = 27
            Width = 320
            Height = 296
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            BorderWidth = 1
            Caption = '_pnldbgLista'
            Color = clSilver
            ParentBackground = False
            TabOrder = 0
            object dbgInProtocolos: TJvDBUltimGrid
              Left = 2
              Top = 21
              Width = 316
              Height = 273
              Align = alClient
              DataSource = dtsImportProtocolos
              Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = dbgInProtocolosCellClick
              OnKeyPress = dbgInProtocolosKeyPress
              OnGetCellProps = dbgGetCellProps
              OnShowEditor = dbgShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              OnCheckIfBooleanField = dbgCheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'IMPORT'
                  Width = 42
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  ReadOnly = True
                  Width = 93
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  ReadOnly = True
                  Title.Caption = 'Protocolos a importar'
                  Width = 158
                  Visible = True
                end>
            end
            object Panel7: TPanel
              Left = 2
              Top = 2
              Width = 316
              Height = 19
              Align = alTop
              Caption = 'Protocolos a Importar'
              TabOrder = 1
            end
          end
          object Panel4: TPanel
            Left = 341
            Top = 27
            Width = 315
            Height = 296
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            BorderWidth = 1
            Caption = '_pnldbgLista'
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            object dbgInTarefas: TJvDBUltimGrid
              Left = 2
              Top = 21
              Width = 311
              Height = 273
              Align = alClient
              DataSource = dtsImportTarefas
              Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = dbgInTarefasCellClick
              OnKeyPress = dbgInTarefasKeyPress
              OnGetCellProps = dbgGetCellProps
              OnShowEditor = dbgShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              OnCheckIfBooleanField = dbgCheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'IMPORT'
                  Title.Caption = 'Ativo'
                  Width = 35
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  ReadOnly = True
                  Width = 71
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  ReadOnly = True
                  Title.Caption = 'Tarefas a importar'
                  Width = 174
                  Visible = True
                end>
            end
            object Panel8: TPanel
              Left = 2
              Top = 2
              Width = 311
              Height = 19
              Align = alTop
              Caption = 'Tarefas a Importar'
              TabOrder = 1
            end
          end
          object cbImportAllProtocolos: TCheckBox
            Left = 12
            Top = 6
            Width = 233
            Height = 17
            Caption = 'Importar todos protocolos'
            TabOrder = 2
            OnClick = cbImportAllProtocolosClick
          end
          object cbImportAllTarefas: TCheckBox
            Left = 344
            Top = 6
            Width = 233
            Height = 17
            Caption = 'Importar todas tarefas'
            TabOrder = 3
            OnClick = cbImportAllTarefasClick
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actNext: TAction
      OnUpdate = _actNextUpdate
    end
  end
  object dtsExportProtocolos: TDataSource
    DataSet = Zoo_CfgImportExportProtocolosDatamodule.cdsProtocolos
    Left = 58
    Top = 187
  end
  object dtsExportTarefas: TDataSource
    DataSet = Zoo_CfgImportExportProtocolosDatamodule.cdsTarefas
    Left = 95
    Top = 187
  end
  object dtsImportProtocolos: TDataSource
    DataSet = Zoo_CfgImportExportProtocolosDatamodule.cdsTmpProtocolos
    Left = 370
    Top = 187
  end
  object dtsImportTarefas: TDataSource
    DataSet = Zoo_CfgImportExportProtocolosDatamodule.cdsTmpTarefas
    Left = 407
    Top = 187
  end
  object JvSaveDialog1X: TJvSaveDialog
    DefaultExt = '.cpt'
    FileName = 'ProtocolosTarefas.cpt'
    Filter = 'Arquivo de Protocolos e Tarefas |*.cpt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Salvar arquivo de Protocolos e Tarefas'
    ActiveStyle = asReport
    DefBtnCaption = 'Salvar'
    Height = 0
    Width = 0
    Left = 494
    Top = 57
  end
  object JvSaveDialog1: TSaveDialog
    DefaultExt = '.cpt'
    FileName = 'ProtocolosTarefas.cpt'
    Filter = 'Arquivo de Protocolos e Tarefas |*.cpt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 536
    Top = 152
  end
end
