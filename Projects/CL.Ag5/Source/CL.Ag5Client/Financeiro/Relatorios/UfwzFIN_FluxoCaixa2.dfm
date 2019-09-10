inherited fwzFIN_FluxoCaixa2: TfwzFIN_FluxoCaixa2
  Left = 403
  Top = 172
  Caption = 'Fluxo de Caixa'
  ClientHeight = 547
  ClientWidth = 851
  ActionList.Left = 58
  ActionList.Top = 4
  ExplicitWidth = 857
  ExplicitHeight = 576
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 851
    Height = 547
    ExplicitWidth = 851
    ExplicitHeight = 547
    inherited _pnlFooter: TJvPanel
      Top = 516
      Width = 847
      ExplicitTop = 516
      ExplicitWidth = 847
      inherited _imageBottom: TImage
        Width = 847
        ExplicitWidth = 757
      end
      inherited _btbPrior: TTcGDIButton
        Left = 656
        ExplicitLeft = 656
      end
      inherited _btbNext: TTcGDIButton
        Left = 747
        ExplicitLeft = 747
      end
      inherited _btbExecute: TTcGDIButton
        Left = 762
        ExplicitLeft = 762
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 847
      Height = 514
      ExplicitWidth = 847
      ExplicitHeight = 514
      inherited PageControl: TJvPageControl
        Width = 847
        Height = 514
        ActivePage = tbsConfig
        ExplicitWidth = 847
        ExplicitHeight = 514
        object tbsConfig: TTabSheet
          Caption = 'tbsConfig'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object gbxAtraso: TGroupBox
            Left = 27
            Top = 134
            Width = 151
            Height = 105
            Caption = 'Incluir t'#237'tulos em atraso'
            TabOrder = 2
            object rbAtrasoAReceber: TCheckBox
              Left = 28
              Top = 28
              Width = 100
              Height = 17
              Caption = #224' receber'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object rbAtrasoAPagar: TCheckBox
              Left = 28
              Top = 61
              Width = 100
              Height = 17
              Caption = #224' pagar'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
          end
          object gbxTipo: TGroupBox
            Left = 27
            Top = 14
            Width = 270
            Height = 114
            Caption = 'Tipo'
            TabOrder = 0
            object rbTipoAnalitico: TRadioButton
              Left = 20
              Top = 23
              Width = 77
              Height = 17
              Caption = 'Anal'#237'tico'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rbTipoAnaliticoClick
            end
            object rbTipoSintetico: TRadioButton
              Left = 19
              Top = 53
              Width = 77
              Height = 17
              Caption = 'Sint'#233'tico'
              TabOrder = 1
              OnClick = rbTipoSinteticoClick
            end
            object cbxTipoSintetico: TComboBox
              Left = 101
              Top = 51
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 2
              Text = 'Semanal'
              OnEnter = cbxTipoSinteticoEnter
              Items.Strings = (
                'Semanal'
                'Quinzenal'
                'Mensal')
            end
            object rbResumoMensal: TRadioButton
              Left = 19
              Top = 81
              Width = 114
              Height = 17
              Caption = 'Resumo Mensal'
              TabOrder = 3
              Visible = False
            end
            object chkAnaliticoSumarios: TCheckBox
              Left = 154
              Top = 83
              Width = 97
              Height = 17
              Caption = 'Exibir sum'#225'rios'
              TabOrder = 4
            end
          end
          object gbxPrevisao: TGroupBox
            Left = 211
            Top = 134
            Width = 133
            Height = 105
            Caption = 'Incluir provis'#245'es'
            TabOrder = 3
            object rbPrevisaoAReceber: TCheckBox
              Left = 28
              Top = 28
              Width = 100
              Height = 17
              Caption = #224' receber'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object rbPrevisaoAPagar: TCheckBox
              Left = 28
              Top = 61
              Width = 100
              Height = 17
              Caption = #224' pagar'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
          end
          object gbxDuvidosos: TGroupBox
            Left = 395
            Top = 134
            Width = 133
            Height = 105
            Caption = 'Duvidosos'
            TabOrder = 4
            Visible = False
            object rbDuvidosoAReceber: TCheckBox
              Left = 28
              Top = 28
              Width = 100
              Height = 17
              Caption = #224' receber'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object rbDuvidosoAPagar: TCheckBox
              Left = 28
              Top = 61
              Width = 100
              Height = 17
              Caption = #224' pagar'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
          end
          object gbxPeriodo: TGroupBox
            Left = 303
            Top = 13
            Width = 225
            Height = 115
            Caption = 'Per'#237'odo'
            TabOrder = 1
            object rbPeriodoTodos: TRadioButton
              Left = 20
              Top = 32
              Width = 121
              Height = 17
              Caption = 'Todos os t'#237'tulos'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rbPeriodoTodosClick
            end
            object rbPeriodoAte: TRadioButton
              Left = 19
              Top = 76
              Width = 77
              Height = 17
              Caption = 'At'#233
              TabOrder = 1
              OnClick = rbPeriodoAteClick
            end
            object deDate: TTcDateEdit
              Left = 88
              Top = 74
              Width = 121
              Height = 21
              OnEnter = deDateEnter
              Checked = False
              CheckOnExit = False
              TabOrder = 2
            end
          end
          object GroupBox1: TGroupBox
            Left = 27
            Top = 240
            Width = 523
            Height = 225
            Caption = 'Selecionar contas'
            TabOrder = 5
            object dbgSelectContas: TJvDBUltimGrid
              Left = 2
              Top = 47
              Width = 519
              Height = 176
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtsContasBancarias
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentColor = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = dbgSelectContasCellClick
              OnKeyPress = dbgSelectContasKeyPress
              AutoAppend = False
              OnShowEditor = dbgSelectContasShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              OnCheckIfBooleanField = dbgSelectContasCheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SELECT'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BANCO'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'AGENCIA'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONTA_CORRENTE'
                  Width = 100
                  Visible = True
                end>
            end
            object Panel4: TPanel
              Left = 2
              Top = 15
              Width = 519
              Height = 32
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object cbSelectAll: TCheckBox
                Left = 21
                Top = 4
                Width = 161
                Height = 17
                Caption = 'Todas as contas'
                TabOrder = 0
                OnClick = cbSelectAllClick
              end
            end
          end
        end
        object tbsAnalitico: TTabSheet
          Caption = 'tbsAnalitico'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            847
            491)
          object Panel3: TPanel
            Left = 12
            Top = 12
            Width = 813
            Height = 433
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Anchors = [akLeft, akTop, akRight, akBottom]
            BorderWidth = 1
            Caption = '_pnldbgLista'
            Color = clSilver
            ParentBackground = False
            TabOrder = 0
            object dbgFluxoAnalitico: TJvDBUltimGrid
              Left = 2
              Top = 2
              Width = 809
              Height = 429
              Align = alClient
              DataSource = dtsFluxoAnalitico
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnGetCellProps = dbgFluxoAnaliticoGetCellProps
              OnShowEditor = dbgFluxoAnaliticoShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
            end
          end
        end
        object tbsSintetico: TTabSheet
          Caption = 'tbsSintetico'
          ImageIndex = 2
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            847
            491)
          object Panel7: TPanel
            Left = 14
            Top = 8
            Width = 818
            Height = 473
            Anchors = [akLeft, akTop, akRight, akBottom]
            Caption = 'Panel7'
            TabOrder = 0
            object Splitter1: TSplitter
              Left = 1
              Top = 173
              Width = 816
              Height = 9
              Cursor = crVSplit
              Align = alBottom
              ExplicitTop = 174
            end
            object Splitter2: TSplitter
              Left = 261
              Top = 1
              Width = 7
              Height = 172
            end
            object Panel1: TPanel
              Left = 1
              Top = 182
              Width = 816
              Height = 290
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alBottom
              BorderWidth = 1
              Caption = '_pnldbgLista'
              Color = clSilver
              ParentBackground = False
              TabOrder = 0
              object dbgFluxoSintetico: TJvDBUltimGrid
                Left = 2
                Top = 2
                Width = 812
                Height = 286
                Align = alClient
                DataSource = dtsFluxoSintetico
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                AutoAppend = False
                OnGetCellProps = dbgFluxoSinteticoGetCellProps
                OnShowEditor = dbgFluxoSinteticoShowEditor
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                Columns = <
                  item
                    Alignment = taLeftJustify
                    Expanded = False
                    FieldName = 'DATA'
                    Width = 387
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CREDITO'
                    Title.Alignment = taCenter
                    Width = 128
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DEBITO'
                    Title.Alignment = taCenter
                    Width = 128
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SALDO'
                    Title.Alignment = taCenter
                    Width = 128
                    Visible = True
                  end>
              end
            end
            object Panel2: TPanel
              Left = 1
              Top = 1
              Width = 260
              Height = 172
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alLeft
              BorderWidth = 1
              Caption = '_pnldbgLista'
              Color = clSilver
              ParentBackground = False
              TabOrder = 1
              object dbgContasSintetico: TJvDBUltimGrid
                Left = 2
                Top = 2
                Width = 256
                Height = 150
                Align = alClient
                DataSource = dtsContas
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                AutoAppend = False
                OnGetCellProps = dbgContasSinteticoGetCellProps
                OnShowEditor = dbgContasSinteticoShowEditor
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    Title.Caption = 'Conta'
                    Width = 128
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SALDOCC'
                    Width = 96
                    Visible = True
                  end>
              end
              object Panel6: TPanel
                Left = 2
                Top = 152
                Width = 256
                Height = 18
                Align = alBottom
                BevelOuter = bvNone
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                object Label1: TLabel
                  Left = 0
                  Top = 0
                  Width = 146
                  Height = 13
                  Align = alLeft
                  Caption = 'Saldo de todas as contas :'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lblSaldoInicial: TLabel
                  Left = 232
                  Top = 0
                  Width = 24
                  Height = 13
                  Align = alRight
                  Caption = '0,00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
            object Panel5: TPanel
              Left = 268
              Top = 1
              Width = 549
              Height = 172
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alClient
              BorderWidth = 1
              Caption = '_pnldbgLista'
              Color = clSilver
              ParentBackground = False
              TabOrder = 2
              object dbgSumarioAtraso: TJvDBUltimGrid
                Left = 2
                Top = 2
                Width = 545
                Height = 168
                Align = alClient
                DataSource = dtsSumarioAtraso
                Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                AutoAppend = False
                OnGetCellProps = dbgSumarioAtrasoGetCellProps
                OnShowEditor = dbgContasSinteticoShowEditor
                AutoSizeColumns = True
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'TIPO'
                    Title.Caption = ' '
                    Width = 36
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    Title.Caption = 'Cheques n'#227'o compensados / t'#237'tulos em atraso'
                    Width = 214
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CREDITO'
                    Width = 96
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DEBITO'
                    Width = 96
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SALDO'
                    Width = 99
                    Visible = True
                  end>
              end
            end
          end
        end
        object tbsResumoMensal: TTabSheet
          Caption = 'tbsResumoMensal'
          ImageIndex = 3
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
      end
    end
  end
  object dtsContasBancarias: TDataSource [1]
    DataSet = dtmFIN_FluxoCaixa2.cdsLstContas
    Left = 482
    Top = 368
  end
  object dtsContas: TDataSource [2]
    DataSet = dtmFIN_FluxoCaixa2.cdsContas
    Left = 346
    Top = 4
  end
  object dtsFluxoAnalitico: TDataSource [3]
    DataSet = dtmFIN_FluxoCaixa2.cdsFluxo
    Left = 384
    Top = 4
  end
  object dtsSumarioAtraso: TDataSource [4]
    DataSet = dtmFIN_FluxoCaixa2.cdsSumarioAtraso
    Left = 458
    Top = 4
  end
  inherited ActionList: TInternalActionList
    Left = 58
    Top = 4
  end
  object dtsFluxoSintetico: TDataSource
    DataSet = dtmFIN_FluxoCaixa2.cdsFluxo
    Left = 418
    Top = 4
  end
end
