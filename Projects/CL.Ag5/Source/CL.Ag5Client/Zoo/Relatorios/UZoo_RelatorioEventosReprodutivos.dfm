inherited Zoo_RelatorioEventosReprodutivos: TZoo_RelatorioEventosReprodutivos
  Left = 363
  Top = 241
  Caption = 'Eventos reprodutivos'
  ClientHeight = 462
  ClientWidth = 623
  OnClick = _actNextExecute
  ExplicitWidth = 629
  ExplicitHeight = 491
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 623
    Height = 462
    ExplicitWidth = 623
    ExplicitHeight = 462
    inherited _pnlFooter: TJvPanel
      Top = 431
      Width = 619
      ExplicitTop = 431
      ExplicitWidth = 619
      inherited _imageBottom: TImage
        Width = 619
        ExplicitWidth = 619
      end
      inherited _btbPrior: TTcGDIButton
        Left = 428
        ExplicitLeft = 428
      end
      inherited _btbNext: TTcGDIButton
        Left = 519
        ExplicitLeft = 519
      end
      inherited _btbExecute: TTcGDIButton
        Left = 534
        Caption = 'Visualizar'
        ExplicitLeft = 534
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 619
      Height = 429
      ExplicitWidth = 619
      ExplicitHeight = 429
      inherited PageControl: TJvPageControl
        Width = 619
        Height = 429
        ActivePage = TabSheet1
        ExplicitWidth = 619
        ExplicitHeight = 429
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object rgTipoAbortoParto: TRadioGroup
            Left = 3
            Top = 252
            Width = 454
            Height = 111
            Caption = 'Aborto / parto'
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Tipo')
            TabOrder = 3
            OnClick = rgTipoAbortoPartoClick
          end
          object gbOpcoes: TGroupBox
            Left = 3
            Top = 3
            Width = 454
            Height = 121
            TabOrder = 0
            object Label1: TLabel
              Left = 10
              Top = 89
              Width = 13
              Height = 13
              Caption = 'De'
            end
            object Label2: TLabel
              Left = 181
              Top = 89
              Width = 6
              Height = 13
              Caption = 'a'
            end
            object Label4: TLabel
              Left = 10
              Top = 62
              Width = 114
              Height = 13
              Caption = 'Ocorr'#234'ncias no per'#237'odo '
            end
            object rgTipoData: TRadioGroup
              Left = 10
              Top = 5
              Width = 209
              Height = 49
              Caption = 'Tipo de ocorr'#234'ncia'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Cobertura'
                'Parto')
              TabOrder = 0
            end
            object deInicial: TTcDateEdit
              Left = 42
              Top = 81
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 1
            end
            object deFinal: TTcDateEdit
              Left = 202
              Top = 81
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 2
            end
          end
          object dblcDescPartoAborto: TDBLookupComboBox
            Left = 88
            Top = 326
            Width = 119
            Height = 21
            KeyField = 'VALOR'
            ListField = 'DESCRICAO'
            ListSource = dtsTipoPartoAborto
            TabOrder = 4
          end
          object rgTipoEvento: TRadioGroup
            Left = 3
            Top = 132
            Width = 454
            Height = 111
            Caption = 'Tipo cobertura'
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Tipo')
            TabOrder = 1
            OnClick = rgTipoAbortoPartoClick
          end
          object dblcDescTipoEvento: TDBLookupComboBox
            Left = 88
            Top = 204
            Width = 119
            Height = 21
            KeyField = 'VALOR'
            ListField = 'DESCRICAO'
            ListSource = dsTipoEvento
            TabOrder = 2
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          object DBGridResultados: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 619
            Height = 379
            Align = alClient
            DataSource = dtsResultados
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = DBGridResultadosDblClick
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
          end
          object Panel3: TPanel
            Left = 0
            Top = 379
            Width = 619
            Height = 27
            Align = alBottom
            Caption = ' '
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            object lblTotalLinhas: TLabel
              Left = 16
              Top = 7
              Width = 64
              Height = 13
              Caption = 'lblTotalLinhas'
            end
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
  object dtsResultados: TDataSource
    DataSet = Zoo_RelatorioEventosReprodutivosDataModule.cdsResultados
    Left = 333
    Top = 28
  end
  object dtsTipoPartoAborto: TDataSource
    DataSet = Zoo_RelatorioEventosReprodutivosDataModule.cdsTipoPartoAborto
    Left = 429
    Top = 28
  end
  object dsTipoEvento: TDataSource
    DataSet = Zoo_RelatorioEventosReprodutivosDataModule.cdsTipoEvento
    Left = 525
    Top = 28
  end
end
