inherited FIN_BaixaAPagarColetivo: TFIN_BaixaAPagarColetivo
  Left = 359
  Top = 359
  Caption = 'Pagamentos'
  ClientHeight = 374
  ClientWidth = 809
  ActionList.Left = 298
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
            Top = 187
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
          object DBGridResultados: TJvDBUltimGrid
            Left = 0
            Top = 68
            Width = 805
            Height = 250
            Align = alClient
            DataSource = dtsResultado
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = DBGridResultadosDblClick
            OnEditButtonClick = DBGridResultadosEditButtonClick
            AutoAppend = False
            OnCheckButton = DBGridResultadosCheckButton
            OnGetCellParams = DBGridResultadosGetCellParams
            OnShowEditor = DBGridResultadosShowEditor
            AutoSizeColumns = True
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <
              item
                ControlName = 'edValor'
                FieldName = 'VALOR'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'edPago'
                FieldName = 'PAGO'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'edPagto'
                FieldName = 'PAGTO'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'edVencto'
                FieldName = 'VENCTO'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end>
            RowsHeight = 17
            TitleRowHeight = 17
            OnCheckIfBooleanField = DBGridResultadosCheckIfBooleanField
            Columns = <
              item
                Expanded = False
                FieldName = 'BAIXAR'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DOCUMENTO'
                ReadOnly = True
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HISTORICO'
                ReadOnly = True
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VENCTO'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEENTIDADE'
                ReadOnly = True
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PARCELAS'
                ReadOnly = True
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMECONTA'
                Title.Caption = 'Conta'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAGO'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAGTO'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_CHEQUE'
                Title.Caption = 'No.cheque'
                Width = 53
                Visible = True
              end
              item
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'JURO_DESCONTO'
                ReadOnly = True
                Title.Caption = 'Juros/Desconto'
                Width = 62
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROVISAO'
                ReadOnly = True
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBS'
                Width = 60
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 805
            Height = 68
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            DesignSize = (
              805
              68)
            object TcDateEdit1: TTcDateEdit
              Left = 150
              Top = 8
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 0
              OnChange = TcDateEdit1Change
              OnExit = TcDateEdit1Exit
            end
            object rbBaixarNaData: TRadioButton
              Left = 8
              Top = 10
              Width = 128
              Height = 17
              Caption = 'Baixar t'#237'tulos na data'
              Checked = True
              TabOrder = 1
              TabStop = True
              OnClick = rbBaixarNaDataClick
            end
            object rbBaixarNoVencimento: TRadioButton
              Left = 8
              Top = 39
              Width = 249
              Height = 17
              Caption = 'Baixar t'#237'tulos na data do vencimento'
              TabOrder = 2
              OnClick = rbBaixarNaDataClick
            end
            object BitBtn3: TTcGDIButton
              Left = 287
              Top = 7
              Width = 121
              Height = 25
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Action = actBaixarTodosTitulos
              Anchors = [akLeft, akBottom]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              DisabledPicture.Data = {
                424D4E0100000000000076000000280000001200000012000000010004000000
                0000D80000000000000000000000000000000000000000000000000080000080
                00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
                000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333F7777773F333300
                0000377F3733333377F33300000037F7733FFFFF337F3300000037F333F77777
                F337F300000037F33F7333337F337F00000037F33733333337F37F00000037FF
                FF7F3333377773000000377777773333333333000000333333333333FFFFFF00
                000033FFFF33333377777700000037777F333337F3333700000037F37F333333
                733337000000337337FFFFF7733337000000337F3377777333FF370000003337
                FF333333FF77F7000000333377FFFFFF77337300000033333377777733333300
                0000333333333333333333000000}
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentFont = False
              Picture.Data = {
                89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                61000000097048597300000B1300000B1301009A9C180000000467414D410000
                B18E7CFB5193000000206348524D00007A25000080830000F9FF000080E90000
                75300000EA6000003A980000176F925FC546000001754944415478DA94923148
                42511486BFF79EDA12414341B54825561008892881B9084D2234B45410D11004
                E5D21286D81A69A14445536B41D9585312B4140D35081542B43548E012F96E83
                5A5EAF6FE8870BEFFE9CF771EE7F8E26840020B593AB7E5828B61AD124A3566D
                6BF4BC9188F2E3D3ED25CEDE3E52E99C502080DE78B119EA0108F85C0C7B0649
                A5D52E25805D574F5D019F8BD0C4A802B13577D02C7F28CC76F648F252E99C58
                7646B1174D4D02D88DD6017675F720440521044B8928961DD875708F255B42DA
                2873AE1D0290899D115BA9062A3FA1F666B318570095B920225FE2EDDE84E39C
                5588B57CDE5FA1F0F0EB9BFB4944FE8630937F35566304A8ACCDF03D358E7975
                02A50FCCBD2D34BF976BE1538256C60860ACEFA20DF4632E4E53990DC2671923
                B18F409746AB02EAF4112FC6E91DDAFC02E2B180361104B7A7E5A4ACF7C0E6C0
                D838C0ECE884218FE5AE4800476DD375E76683DB0E3C039B524D4B00C0D74B9C
                FF480264B217FC573F0300919266E8E587706C0000000049454E44AE426082}
              TabOrder = 3
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
          object edValor: TTcDBCalcEdit
            Left = 536
            Top = 136
            Width = 121
            Height = 21
            Checked = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = False
            DecimalPlacesAlwaysShown = False
            DataField = 'VALOR'
            DataSource = dtsResultado
          end
          object edVencto: TTcDBDateEdit
            Left = 152
            Top = 136
            Width = 121
            Height = 21
            Checked = False
            DataField = 'VENCTO'
            DataSource = dtsResultado
            CheckOnExit = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = False
          end
          object edPago: TTcDBCalcEdit
            Left = 536
            Top = 184
            Width = 121
            Height = 21
            Checked = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = False
            DecimalPlacesAlwaysShown = False
            DataField = 'PAGO'
            DataSource = dtsResultado
          end
          object edPagto: TTcDBDateEdit
            Left = 296
            Top = 136
            Width = 121
            Height = 21
            Checked = False
            DataField = 'PAGTO'
            DataSource = dtsResultado
            CheckOnExit = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Visible = False
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 298
    Top = 4
    object actBaixarTodosTitulos: TAction
      Category = 'Wizard'
      Caption = 'Baixar todos'
      OnExecute = actBaixarTodosTitulosExecute
    end
  end
  object dtsResultado: TDataSource
    DataSet = Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagar
    Left = 439
    Top = 4
  end
end
