inherited frmFIN_PlanoContasEspeciais: TfrmFIN_PlanoContasEspeciais
  Left = 363
  Top = 241
  Caption = 'Plano de contas especiais equivalentes'
  ClientHeight = 577
  ClientWidth = 797
  ExplicitWidth = 803
  ExplicitHeight = 606
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 797
    Height = 577
    ExplicitWidth = 797
    ExplicitHeight = 577
    inherited _pnlFooter: TJvPanel
      Top = 546
      Width = 793
      ExplicitTop = 546
      ExplicitWidth = 793
      inherited _imageBottom: TImage
        Width = 793
        ExplicitWidth = 780
      end
      inherited _btbPrior: TTcGDIButton
        Left = 602
        ExplicitLeft = 602
      end
      inherited _btbNext: TTcGDIButton
        Left = 693
        ExplicitLeft = 693
      end
      inherited _btbExecute: TTcGDIButton
        Left = 708
        ExplicitLeft = 708
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 793
      Height = 544
      ExplicitWidth = 793
      ExplicitHeight = 544
      inherited PageControl: TJvPageControl
        Width = 793
        Height = 544
        ActivePage = TabSheet1
        ExplicitWidth = 793
        ExplicitHeight = 544
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object GridPlanoContasEspeciais: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 793
            Height = 268
            Align = alClient
            DataSource = dsPlanoContasEspeciais
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GridPlanoContasEspeciaisDrawColumnCell
            OnShowEditor = GridPlanoContasEspeciaisShowEditor
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <
              item
                ControlName = 'edtPlanoContaEqv'
                FieldName = 'DESCR_PC_NOME'
                FitCell = fcCellSize
                LeaveOnUpDownKey = True
              end>
            RowsHeight = 17
            TitleRowHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'KFIN_PLANOCONTA_ESPECIAL'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'NOME'
                Width = 279
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KDEF_PLANOCONTA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'TIPO_PLANOCONTAS'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CLASSIFICACAO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'KFIN_PLANOCONTA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DESCR_PC_CODIGO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DESCR_PC_NOME'
                Width = 283
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCR_PC_CLASSIFICACAO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'EQV_TIPO_PLANOCONTAS'
                Visible = False
              end>
          end
          object edtPlanoContaEqv: TTcDBComboEdit
            AlignWithMargins = True
            Left = 382
            Top = 87
            Width = 126
            Height = 21
            Margins.Left = 7
            Margins.Top = 7
            Margins.Right = 7
            Margins.Bottom = 0
            Checked = False
            DataField = 'DESCR_PC_NOME'
            DataSource = dsPlanoContasEspeciais
            ImageKind = ikEllipsis
            ButtonWidth = 15
            TabOrder = 1
            Visible = False
            OnButtonClick = edtPlanoContaEqvButtonClick
            OnKeyPress = edtPlanoContaEqvKeyPress
          end
          object Panel1: TPanel
            Left = 0
            Top = 268
            Width = 793
            Height = 253
            Align = alBottom
            Caption = ' '
            ShowCaption = False
            TabOrder = 2
            object Label1: TLabel
              Left = 12
              Top = 7
              Width = 84
              Height = 13
              Caption = 'Contas do D.R.E.'
            end
            object Label2: TLabel
              Left = 39
              Top = 34
              Width = 65
              Height = 13
              Caption = 'Receita Bruta'
            end
            object Label3: TLabel
              Left = 39
              Top = 60
              Width = 95
              Height = 13
              Caption = 'Deducoes de Venda'
            end
            object Label4: TLabel
              Left = 40
              Top = 87
              Width = 166
              Height = 13
              Caption = 'Despesa Total / Custo Operacional'
            end
            object Label5: TLabel
              Left = 40
              Top = 114
              Width = 59
              Height = 13
              Caption = 'Amortiza'#231#227'o'
            end
            object Label6: TLabel
              Left = 40
              Top = 141
              Width = 68
              Height = 13
              Caption = 'Investimentos'
            end
            object Label7: TLabel
              Left = 40
              Top = 168
              Width = 59
              Height = 13
              Caption = 'Deprecia'#231#227'o'
            end
            object Label8: TLabel
              Left = 40
              Top = 195
              Width = 100
              Height = 13
              Caption = 'Resultado Financeiro'
            end
            object Label9: TLabel
              Left = 39
              Top = 222
              Width = 130
              Height = 13
              Caption = 'Resultado N'#227'o Operacional'
            end
            object edtReceitaBruta: TEdit
              Left = 224
              Top = 31
              Width = 242
              Height = 21
              TabOrder = 0
              Text = 'edtReceitaBruta'
            end
            object edtDeducoesVenda: TEdit
              Left = 224
              Top = 57
              Width = 242
              Height = 21
              TabOrder = 1
              Text = 'edtDeducoesVenda'
            end
            object edtDespesaCusto: TEdit
              Left = 224
              Top = 84
              Width = 242
              Height = 21
              TabOrder = 2
              Text = 'edtDespesaCusto'
            end
            object edtInvestimentos: TEdit
              Left = 224
              Top = 138
              Width = 242
              Height = 21
              TabOrder = 4
              Text = 'edtInvestimentos'
            end
            object edtAmortizacao: TEdit
              Left = 224
              Top = 111
              Width = 242
              Height = 21
              TabOrder = 3
              Text = 'edtAmortizacao'
            end
            object edtDepreciacao: TEdit
              Left = 224
              Top = 165
              Width = 242
              Height = 21
              TabOrder = 5
              Text = 'edtDepreciacao'
            end
            object edtResultadoFinanceiro: TEdit
              Left = 224
              Top = 192
              Width = 242
              Height = 21
              TabOrder = 6
              Text = 'edtResultadoFinanceiro'
            end
            object edtResultadoNaoOperacional: TEdit
              Left = 223
              Top = 219
              Width = 242
              Height = 21
              TabOrder = 7
              Text = 'edtResultadoNaoOperacional'
            end
          end
        end
      end
    end
  end
  object dsPlanoContasEspeciais: TDataSource
    DataSet = dtmFIN_PlanoContasEspeciais.cdsPlanoContasEspeciais
    Left = 226
    Top = 125
  end
end
