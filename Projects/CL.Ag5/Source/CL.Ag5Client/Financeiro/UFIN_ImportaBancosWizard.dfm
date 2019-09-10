inherited FIN_ImportaBancosWizard: TFIN_ImportaBancosWizard
  Left = 461
  Top = 255
  Caption = 'Importa lista de bancos'
  ExplicitLeft = 461
  ExplicitTop = 255
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlFooter: TJvPanel
      ExplicitTop = 312
    end
    inherited _pnlDetail: TJvPanel
      ExplicitHeight = 287
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 527
        Height = 287
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 1
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Label1: TLabel
            Left = 25
            Top = 51
            Width = 95
            Height = 13
            Caption = 'Caminho do arquivo'
          end
          object edtFileBancos: TTcFilenameEdit
            Left = 133
            Top = 48
            Width = 277
            Height = 21
            AddQuotes = False
            DefaultExt = '.xls'
            AutoCompleteOptions = [acoAutoSuggest, acoFilterPrefixes]
            Filter = 'Arquivo Pesagens (*.xls)|*.xls'
            TabOrder = 0
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          object JvDBUltimGrid1: TJvDBUltimGrid
            Left = 0
            Top = 41
            Width = 519
            Height = 218
            Align = alClient
            DataSource = dtsImportaBancos
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
            Columns = <
              item
                Expanded = False
                FieldName = 'KFIN_BANCO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HOMEPAGE'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FEBRABAN'
                Width = 64
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 519
            Height = 41
            Align = alTop
            TabOrder = 1
            object cbImportAllProtocolos: TCheckBox
              Left = 12
              Top = 6
              Width = 233
              Height = 17
              Caption = 'Importar todos bancos'
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object JvSaveDialog1: TJvSaveDialog
    DefaultExt = '.cpt'
    FileName = 'ProtocolosTarefas.cpt'
    Filter = 'Arquivo de Protocolos e Tarefas |*.cpt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Salvar arquivo de Protocolos e Tarefas'
    ActiveStyle = asReport
    DefBtnCaption = 'Salvar'
    Height = 0
    Width = 0
    Left = 390
    Top = 161
  end
  object dtsImportaBancos: TDataSource
    DataSet = dtmFIN_Bancos.cdsImportaBancos
    Left = 166
    Top = 161
  end
end
