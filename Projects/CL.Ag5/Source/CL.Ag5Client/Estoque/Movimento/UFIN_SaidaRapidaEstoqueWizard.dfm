inherited FIN_SaidaRapidaEstoqueWizard: TFIN_SaidaRapidaEstoqueWizard
  Left = 363
  Top = 241
  Caption = 'Sa'#237'da r'#225'pida'
  ClientWidth = 849
  ExplicitWidth = 855
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 849
    ExplicitWidth = 849
    inherited _pnlFooter: TJvPanel
      Width = 845
      ExplicitWidth = 845
      inherited _imageBottom: TImage
        Width = 845
        ExplicitWidth = 845
      end
      inherited _btbPrior: TTcGDIButton
        Left = 654
        ExplicitLeft = 654
      end
      inherited _btbNext: TTcGDIButton
        Left = 745
        ExplicitLeft = 745
      end
      inherited _btbExecute: TTcGDIButton
        Left = 760
        ExplicitLeft = 760
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 845
      ExplicitWidth = 845
      inherited PageControl: TJvPageControl
        Width = 845
        ActivePage = TabSheet1
        ExplicitWidth = 845
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object dbgSaidas: TJvDBUltimGrid
            Left = 0
            Top = 41
            Width = 845
            Height = 246
            Align = alClient
            DataSource = DataSource1
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnEditButtonClick = dbgSaidasEditButtonClick
            OnKeyDown = dbgSaidasKeyDown
            OnKeyPress = dbgSaidasKeyPress
            AutoAppend = False
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <
              item
                ControlName = 'dbItensQtde'
                FieldName = 'QTDE'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'DBMemo1'
                FieldName = 'OBS'
                FitCell = fcBiggest
                LeaveOnEnterKey = True
              end>
            RowsHeight = 17
            TitleRowHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                ReadOnly = True
                Width = 102
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME'
                ReadOnly = True
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESC_TIPO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADE'
                ReadOnly = True
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTDE_PRODUTO'
                ReadOnly = True
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTDE_MINIMA'
                ReadOnly = True
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTDE'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCR_PC_NOME'
                Width = 122
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LISTA_CC'
                Title.Caption = 'Centro de Custo'
                Width = 289
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBS'
                Width = 83
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 845
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            Caption = ' '
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object Label1: TLabel
              Left = 11
              Top = 11
              Width = 66
              Height = 13
              Caption = 'Data da sa'#237'da'
            end
            object Button1: TButton
              Left = 244
              Top = 6
              Width = 157
              Height = 25
              Action = actSelecionarItens
              TabOrder = 1
            end
            object deDataMovto: TTcDateEdit
              Left = 92
              Top = 8
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 0
            end
          end
          object dbItensQtde: TJvDBCalcEdit
            Left = 449
            Top = 137
            Width = 121
            Height = 21
            DecimalPlaces = 4
            DisplayFormat = ',0.####'
            ShowButton = False
            TabOrder = 2
            Visible = False
            DecimalPlacesAlwaysShown = False
            DataField = 'QTDE'
            DataSource = DataSource1
          end
          object DBMemo1: TDBMemo
            Left = 632
            Top = 120
            Width = 185
            Height = 89
            DataField = 'OBS'
            DataSource = DataSource1
            TabOrder = 3
            Visible = False
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
    object actSelecionarItens: TAction
      Category = 'Wizard'
      Caption = 'Selecionar itens'
      OnExecute = actSelecionarItensExecute
    end
  end
  object DataSource1: TDataSource
    DataSet = FIN_SaidaRapidaEstoqueDatamodule.cdsEstoque
    Left = 154
    Top = 129
  end
end
