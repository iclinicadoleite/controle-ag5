inherited FIN_ConciliacaoBancariaWizard: TFIN_ConciliacaoBancariaWizard
  Left = 431
  Top = 216
  Caption = 'Concilia'#231#227'o banc'#225'ria'
  ClientHeight = 518
  ClientWidth = 798
  ActionList.Left = 152
  ActionList.Top = 4
  ExplicitWidth = 814
  ExplicitHeight = 557
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Width = 798
    Height = 453
    ExplicitWidth = 798
    ExplicitHeight = 453
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 790
      ExplicitHeight = 425
      inherited _pnlSearch: TPanel
        Width = 790
        Height = 57
        ExplicitWidth = 790
        ExplicitHeight = 57
        inherited _edtSearch: TJvComboEdit
          ParentFont = False
        end
        object cbCompensados: TCheckBox
          Left = 72
          Top = 34
          Width = 153
          Height = 17
          Caption = 'Exibir compensados'
          TabOrder = 1
          OnClick = cbCompensadosClick
        end
      end
      inherited _pnldbgLista: TPanel
        Top = 57
        Width = 790
        Height = 368
        ExplicitTop = 57
        ExplicitWidth = 790
        ExplicitHeight = 368
        inherited _dbgLista: TJvDBUltimGrid
          Width = 786
          Height = 364
          Constraints.MinHeight = 88
          Columns = <
            item
              Expanded = False
              FieldName = 'NOMECONTA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANCO'
              Width = 165
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGENCIA'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTA_CORRENTE'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENCTO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGTO'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HISTORICO'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOCUMENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CREDITO'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEBITO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_COMPENSACAO'
              Width = 74
              Visible = True
            end>
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 790
      ExplicitHeight = 425
      inherited _pnlFicha: TPanel
        Width = 790
        Height = 425
        Constraints.MinHeight = 173
        ExplicitWidth = 790
        ExplicitHeight = 425
        inherited _ScrollBoxFicha: TScrollBox
          Width = 790
          Height = 425
          ExplicitWidth = 790
          ExplicitHeight = 425
          inherited _pnlScroll: TPanel
            Width = 790
            Height = 425
            ExplicitWidth = 790
            ExplicitHeight = 425
            object GroupBox1: TGroupBox
              Left = 0
              Top = 0
              Width = 790
              Height = 93
              Align = alTop
              TabOrder = 0
              object Label1: TLabel
                Left = 14
                Top = 40
                Width = 48
                Height = 13
                Caption = 'Banco : '
              end
              object Label2: TLabel
                Left = 201
                Top = 62
                Width = 99
                Height = 13
                Caption = 'Conta corrente : '
              end
              object Label3: TLabel
                Left = 14
                Top = 14
                Width = 43
                Height = 13
                Caption = 'Conta :'
              end
              object dbtCodigo: TDBText
                Left = 77
                Top = 40
                Width = 382
                Height = 17
                DataField = 'BANCO'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText1: TDBText
                Left = 305
                Top = 62
                Width = 48
                Height = 13
                AutoSize = True
                DataField = 'CONTA_CORRENTE'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText2: TDBText
                Left = 77
                Top = 62
                Width = 48
                Height = 13
                AutoSize = True
                DataField = 'AGENCIA'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label9: TLabel
                Left = 14
                Top = 62
                Width = 58
                Height = 13
                Caption = 'Ag'#234'ncia : '
              end
              object JvDBComboEdit1: TJvDBComboEdit
                Left = 77
                Top = 11
                Width = 308
                Height = 21
                DataField = 'NOMECONTA'
                DataSource = dtsFicha
                ImageKind = ikEllipsis
                ReadOnly = True
                TabOrder = 0
                OnButtonClick = JvDBComboEdit1ButtonClick
                OnKeyPress = JvDBComboEdit1KeyPress
              end
            end
            object Panel1: TPanel
              Left = 0
              Top = 93
              Width = 790
              Height = 169
              Align = alTop
              ParentColor = True
              TabOrder = 1
              object Label4: TLabel
                Left = 14
                Top = 78
                Width = 90
                Height = 13
                Caption = 'N'#250'mero cheque'
              end
              object Label5: TLabel
                Left = 349
                Top = 44
                Width = 29
                Height = 13
                Caption = 'Valor'
                FocusControl = DBEdit5
              end
              object Label6: TLabel
                Left = 523
                Top = 12
                Width = 84
                Height = 13
                Caption = 'D'#233'bito/Cr'#233'dito'
              end
              object Label7: TLabel
                Left = 14
                Top = 44
                Width = 95
                Height = 13
                Caption = 'Data pagamento'
              end
              object Label10: TLabel
                Left = 14
                Top = 12
                Width = 56
                Height = 13
                Caption = 'Descri'#231#227'o'
              end
              object Label8: TLabel
                Left = 267
                Top = 78
                Width = 112
                Height = 13
                Caption = 'Data Compensa'#231#227'o'
              end
              object Label11: TLabel
                Left = 16
                Top = 100
                Width = 74
                Height = 13
                Caption = 'Observa'#231#245'es'
              end
              object DBEdit5: TDBEdit
                Left = 115
                Top = 75
                Width = 124
                Height = 21
                DataField = 'DOCUMENTO'
                DataSource = dtsFicha
                MaxLength = 10
                TabOrder = 4
              end
              object JvDBCalcEdit1: TJvDBCalcEdit
                Left = 385
                Top = 41
                Width = 121
                Height = 21
                ReadOnly = True
                TabOrder = 3
                DecimalPlacesAlwaysShown = False
                DataField = 'VALOR'
                DataSource = dtsFicha
              end
              object JvDBComboBox1: TJvDBComboBox
                Left = 613
                Top = 9
                Width = 121
                Height = 21
                DataField = 'DEBITO_CREDITO'
                DataSource = dtsFicha
                Items.Strings = (
                  'D'#233'bito'
                  'Cr'#233'dito')
                ReadOnly = True
                TabOrder = 1
                UpdateFieldImmediatelly = True
                Values.Strings = (
                  'D'
                  'C')
                ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                ListSettings.OutfilteredValueFont.Color = clRed
                ListSettings.OutfilteredValueFont.Height = -11
                ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                ListSettings.OutfilteredValueFont.Style = []
              end
              object dbDt_Emissao: TTcDBDateEdit
                Left = 115
                Top = 41
                Width = 121
                Height = 21
                Checked = False
                DataField = 'PAGTO'
                DataSource = dtsFicha
                ReadOnly = True
                CheckOnExit = False
                Color = clSilver
                TabOrder = 2
              end
              object DBEdit1: TDBEdit
                Left = 115
                Top = 9
                Width = 391
                Height = 21
                DataField = 'HISTORICO'
                DataSource = dtsFicha
                ReadOnly = True
                TabOrder = 0
              end
              object dbDt_Compensacao: TTcDBDateEdit
                Left = 385
                Top = 75
                Width = 121
                Height = 21
                Checked = False
                DataField = 'DT_COMPENSACAO'
                DataSource = dtsFicha
                CheckOnExit = False
                Color = clSilver
                TabOrder = 5
              end
              object DBMemo1: TDBMemo
                Left = 14
                Top = 116
                Width = 720
                Height = 46
                DataField = 'OBS'
                DataSource = dtsFicha
                TabOrder = 6
              end
              object dbrgTipoPagamento: TDBRadioGroup
                Left = 523
                Top = 37
                Width = 211
                Height = 64
                Caption = ' Tipo de pagamento '
                DataField = 'CHEQUE'
                DataSource = dtsFicha
                Items.Strings = (
                  'Pagamento com cheque'
                  'Tarifa banc'#225'ria')
                TabOrder = 7
                Values.Strings = (
                  'T'
                  'F')
                OnChange = dbrgTipoPagamentoChange
              end
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 453
    Width = 798
    ExplicitTop = 453
    ExplicitWidth = 798
    inherited _imageBottom: TImage
      Width = 798
      ExplicitWidth = 798
    end
    inherited _ToolBar: TToolBar
      Left = 26
      ExplicitLeft = 26
      inherited ToolButton1: TToolButton
        ExplicitHeight = 64
      end
      inherited _ToolButtonSeparator4: TToolButton
        ExplicitHeight = 64
      end
      inherited _ToolButtonNew: TToolButton
        ExplicitHeight = 64
      end
      inherited _ToolButtonEdit: TToolButton
        ExplicitHeight = 64
      end
      inherited _ToolButtonDelete: TToolButton
        ExplicitHeight = 64
      end
      inherited _ToolButtonSeparator1: TToolButton
        ExplicitHeight = 64
      end
      inherited _ToolButtonSave: TToolButton
        ExplicitHeight = 64
      end
      inherited _ToolButtonCancel: TToolButton
        ExplicitHeight = 64
      end
      inherited _ToolButtonSeparator2: TToolButton
        ExplicitHeight = 64
      end
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonSeparator3: TToolButton
        ExplicitHeight = 64
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonSeparator0: TToolButton
        ExplicitHeight = 64
      end
      inherited _ToolButtonHelp: TToolButton
        ExplicitHeight = 64
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 152
    Top = 4
  end
  inherited dtsLista: TDataSource
    DataSet = FIN_ConciliacaoBancariaDatamodule.cdsLstConciliacao
  end
  inherited _popMenuPrint: TPopupMenu
    Left = 368
    Top = 408
  end
end
