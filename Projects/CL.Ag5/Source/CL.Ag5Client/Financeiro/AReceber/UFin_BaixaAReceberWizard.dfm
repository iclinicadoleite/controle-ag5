inherited Fin_BaixaAReceberWizard: TFin_BaixaAReceberWizard
  Left = 408
  Top = 211
  Caption = 'Recebimentos'
  ClientHeight = 350
  ClientWidth = 836
  ExplicitWidth = 842
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 836
    Height = 350
    ExplicitWidth = 836
    ExplicitHeight = 350
    inherited _pnlFooter: TJvPanel
      Top = 319
      Width = 832
      ExplicitTop = 319
      ExplicitWidth = 832
      inherited _imageBottom: TImage
        Width = 832
        ExplicitWidth = 832
      end
      inherited _btbPrior: TTcGDIButton
        Left = 641
        ExplicitLeft = 641
      end
      inherited _btbNext: TTcGDIButton
        Left = 732
        ExplicitLeft = 732
      end
      inherited _btbExecute: TTcGDIButton
        Left = 747
        ExplicitLeft = 747
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 832
      Height = 317
      ExplicitWidth = 832
      ExplicitHeight = 317
      inherited PageControl: TJvPageControl
        Width = 832
        Height = 317
        ActivePage = TabSheet2
        ExplicitWidth = 832
        ExplicitHeight = 317
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object GroupBox1: TGroupBox
            Left = 32
            Top = 13
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
              Caption = 'A receber'
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
              Caption = 'Recebidos'
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
            Left = 32
            Top = 188
            Width = 350
            Height = 83
            Hint = 'Se n'#227'o selecionar algum fornecedor, trar'#225' todos.'
            Caption = ' Selecionar cliente '
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
              Caption = 'Todos os clientes'
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
            Width = 832
            Height = 294
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
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HISTORICO'
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAVENDA'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VENCTO'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEENTIDADE'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PARCELAS'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONTA'
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAGTO'
                Title.Caption = 'Data pagamento'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAGO'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBS'
                Width = 75
                Visible = True
              end>
          end
        end
      end
    end
  end
  object dtsResultado: TDataSource
    DataSet = Fin_BaixaAReceberDatamodule.cdsBaixaAReceber
    Left = 354
    Top = 10
  end
end
