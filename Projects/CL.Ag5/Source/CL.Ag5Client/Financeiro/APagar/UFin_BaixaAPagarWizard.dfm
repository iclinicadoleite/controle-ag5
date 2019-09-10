inherited FIN_BaixaAPagarWizard: TFIN_BaixaAPagarWizard
  Left = 359
  Top = 359
  Caption = 'Pagamentos'
  ClientHeight = 374
  ClientWidth = 809
  ActionList.Left = 290
  ActionList.Top = 4
  ExplicitWidth = 815
  ExplicitHeight = 403
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 809
    Height = 374
    ExplicitWidth = 809
    ExplicitHeight = 374
    inherited _pnlFooter: TJvPanel
      Top = 343
      Width = 805
      ExplicitTop = 343
      ExplicitWidth = 805
      inherited _imageBottom: TImage
        Width = 805
        ExplicitWidth = 805
      end
      inherited _btbPrior: TTcGDIButton
        Left = 614
        ExplicitLeft = 614
      end
      inherited _btbNext: TTcGDIButton
        Left = 705
        ExplicitLeft = 705
      end
      inherited _btbExecute: TTcGDIButton
        Left = 720
        ExplicitLeft = 720
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 805
      Height = 341
      ExplicitWidth = 805
      ExplicitHeight = 341
      inherited PageControl: TJvPageControl
        Width = 805
        Height = 341
        ActivePage = TabSheet2
        ExplicitWidth = 805
        ExplicitHeight = 341
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object GroupBox1: TGroupBox
            Left = 22
            Top = 21
            Width = 350
            Height = 140
            Caption = ' Selecionar per'#237'odo '
            TabOrder = 0
            object Label1: TLabel
              Left = 10
              Top = 21
              Width = 15
              Height = 13
              Caption = 'de '
            end
            object Label2: TLabel
              Left = 165
              Top = 21
              Width = 16
              Height = 13
              Caption = 'at'#233
            end
            object edDataInicial: TTcDateEdit
              Left = 40
              Top = 18
              Width = 102
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 0
            end
            object edDataFinal: TTcDateEdit
              Left = 207
              Top = 18
              Width = 102
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 1
            end
            object RadioButton1: TRadioButton
              Left = 16
              Top = 56
              Width = 113
              Height = 17
              Caption = 'A pagar'
              Checked = True
              TabOrder = 2
              TabStop = True
              OnClick = RadioButton1Click
            end
            object RadioButton2: TRadioButton
              Left = 16
              Top = 80
              Width = 113
              Height = 17
              Caption = 'Pagos'
              TabOrder = 3
              OnClick = RadioButton2Click
            end
            object RadioButton3: TRadioButton
              Left = 16
              Top = 104
              Width = 113
              Height = 17
              Caption = 'Ambos'
              TabOrder = 4
              OnClick = RadioButton3Click
            end
          end
          object GroupBox2: TGroupBox
            Left = 22
            Top = 188
            Width = 350
            Height = 83
            Hint = 'Se n'#227'o selecionar algum fornecedor, trar'#225' todos.'
            Caption = ' Selecionar Fornecedores '
            TabOrder = 1
            object edEntidade: TJvComboEdit
              Left = 83
              Top = 50
              Width = 254
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ButtonWidth = 17
              ClickKey = 0
              ClipboardCommands = []
              ImageKind = ikEllipsis
              TabOrder = 2
              Text = ''
              OnButtonClick = edEntidadeButtonClick
              OnKeyPress = edEntidadeKeyPress
            end
            object rbTodos: TRadioButton
              Left = 10
              Top = 21
              Width = 136
              Height = 17
              Caption = 'Todos os Fornecedores'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rbTodosClick
            end
            object rbEntidade: TRadioButton
              Left = 10
              Top = 52
              Width = 69
              Height = 17
              Caption = 'Pesquisar:'
              TabOrder = 1
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object DBGridResultados: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 805
            Height = 318
            Align = alClient
            DataSource = dtsResultado
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = DBGridResultadosDblClick
            OnKeyDown = DBGridResultadosKeyDown
            OnGetCellParams = DBGridResultadosGetCellParams
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
                FieldName = 'DOCUMENTO'
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HISTORICO'
                Width = 71
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATACOMPRA'
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VENCTO'
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEENTIDADE'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PARCELAS'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Width = 71
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONTA'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAGTO'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAGO'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBS'
                Width = 73
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 290
    Top = 4
  end
  object dtsResultado: TDataSource
    DataSet = Fin_BaixaAPagarDatamodule.cdsBaixaAPagar
    Left = 370
    Top = 4
  end
end
