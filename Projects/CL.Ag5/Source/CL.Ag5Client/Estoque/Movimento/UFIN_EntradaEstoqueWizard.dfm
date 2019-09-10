inherited FIN_EntradaEstoqueWizard: TFIN_EntradaEstoqueWizard
  Left = 212
  Top = 111
  ActiveControl = dbcbProduto
  Caption = 'Entrada de produtos'
  ClientHeight = 404
  ClientWidth = 752
  ActionList.Left = 124
  ActionList.Top = 4
  ExplicitWidth = 768
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Width = 752
    Height = 339
    ActivePage = _tbsFicha
    ExplicitWidth = 752
    ExplicitHeight = 339
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 744
      ExplicitHeight = 311
      inherited _pnlSearch: TPanel
        Width = 744
        Height = 60
        ExplicitWidth = 744
        ExplicitHeight = 60
        object Label16: TLabel [1]
          Left = 1
          Top = 34
          Width = 63
          Height = 13
          Caption = 'Data inicial'
        end
        object Label17: TLabel [2]
          Left = 208
          Top = 34
          Width = 55
          Height = 13
          Caption = 'Data final'
        end
        inherited _edtSearch: TJvComboEdit
          ParentFont = False
        end
        object deDtInicial: TTcDateEdit
          Left = 73
          Top = 31
          Width = 121
          Height = 21
          Checked = False
          CheckOnExit = False
          TabOrder = 1
          OnExit = deDtInicialExit
        end
        object deDtFinal: TTcDateEdit
          Left = 273
          Top = 31
          Width = 121
          Height = 21
          Checked = False
          CheckOnExit = False
          TabOrder = 2
          OnExit = deDtFinalExit
        end
      end
      inherited _pnldbgLista: TPanel
        Top = 60
        Width = 744
        Height = 251
        ExplicitTop = 60
        ExplicitWidth = 744
        ExplicitHeight = 251
        inherited _dbgLista: TJvDBUltimGrid
          Width = 740
          Height = 247
          Constraints.MinHeight = 88
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 744
      ExplicitHeight = 311
      inherited _pnlFicha: TPanel
        Width = 744
        Height = 311
        Constraints.MinHeight = 173
        ExplicitWidth = 744
        ExplicitHeight = 311
        inherited _ScrollBoxFicha: TScrollBox
          Width = 744
          Height = 311
          ExplicitWidth = 744
          ExplicitHeight = 311
          inherited _pnlScroll: TPanel
            Width = 744
            Height = 311
            ExplicitWidth = 744
            ExplicitHeight = 311
            object Label1: TLabel
              Left = 19
              Top = 20
              Width = 110
              Height = 13
              Caption = 'C'#243'digo lan'#231'amento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 381
              Top = 19
              Width = 75
              Height = 13
              Caption = 'Data entrada'
            end
            object Label3: TLabel
              Left = 19
              Top = 52
              Width = 100
              Height = 13
              Caption = 'Produto / Insumo'
            end
            object Label10: TLabel
              Left = 20
              Top = 246
              Width = 142
              Height = 13
              Caption = 'Detalhes / Observa'#231#245'es:'
            end
            object Label7: TLabel
              Left = 19
              Top = 83
              Width = 65
              Height = 13
              Caption = 'Quantidade'
            end
            object Label8: TLabel
              Left = 381
              Top = 83
              Width = 76
              Height = 13
              Caption = 'Valor unit'#225'rio'
            end
            object Label13: TLabel
              Left = 381
              Top = 52
              Width = 64
              Height = 13
              Caption = 'Fornecedor'
            end
            object Label9: TLabel
              Left = 19
              Top = 120
              Width = 27
              Height = 13
              Caption = 'Total'
            end
            object DBText1: TDBText
              Left = 145
              Top = 120
              Width = 127
              Height = 17
              DataField = 'TOTAL'
              DataSource = dtsFicha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 305
              Top = 116
              Width = 82
              Height = 13
              Caption = 'Conta cont'#225'bil'
            end
            object DBEdit1: TDBEdit
              Left = 145
              Top = 17
              Width = 121
              Height = 20
              TabStop = False
              Color = clBtnFace
              DataField = 'CODIGO_LANCAMENTO'
              DataSource = dtsFicha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object TcMPDBDateEdit1: TTcDBDateEdit
              Left = 469
              Top = 16
              Width = 136
              Height = 21
              TabStop = False
              Checked = False
              DataField = 'DATA'
              DataSource = dtsFicha
              CheckOnExit = False
              Color = clWhite
              TabOrder = 1
            end
            object dbcbProduto: TJvDBComboEdit
              Left = 145
              Top = 49
              Width = 191
              Height = 21
              DataField = 'NOME'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              TabOrder = 2
              OnButtonClick = dbcbProdutoButtonClick
              OnKeyPress = dbcbProdutoKeyPress
            end
            object GroupBox1: TGroupBox
              Left = 20
              Top = 148
              Width = 597
              Height = 91
              Caption = ' Posi'#231#227'o atual do estque'
              TabOrder = 7
              object Label4: TLabel
                Left = 9
                Top = 27
                Width = 40
                Height = 13
                Caption = 'C'#243'digo'
              end
              object Label5: TLabel
                Left = 175
                Top = 27
                Width = 33
                Height = 13
                Caption = 'Nome'
              end
              object dbtCodigo: TDBText
                Left = 60
                Top = 27
                Width = 68
                Height = 17
                DataField = 'CODIGO'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbtNome: TDBText
                Left = 219
                Top = 27
                Width = 250
                Height = 17
                DataField = 'NOME'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbtUnidade: TDBText
                Left = 543
                Top = 27
                Width = 42
                Height = 15
                DataField = 'UNIDADE'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label6: TLabel
                Left = 478
                Top = 27
                Width = 46
                Height = 13
                Caption = 'Unidade'
              end
              object Label11: TLabel
                Left = 9
                Top = 56
                Width = 72
                Height = 13
                Caption = 'Custo m'#233'dio'
              end
              object Label14: TLabel
                Left = 175
                Top = 56
                Width = 136
                Height = 13
                Caption = 'Quantidade em estoque'
              end
              object DBText2: TDBText
                Left = 94
                Top = 56
                Width = 77
                Height = 17
                DataField = 'CUSTO_MEDIO'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText3: TDBText
                Left = 318
                Top = 56
                Width = 77
                Height = 17
                DataField = 'QTDE_PRODUTO'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label15: TLabel
                Left = 400
                Top = 56
                Width = 94
                Height = 13
                Caption = 'Total do estoque'
              end
              object DBText4: TDBText
                Left = 499
                Top = 56
                Width = 85
                Height = 17
                Alignment = taRightJustify
                DataField = 'TOTAL_ESTOQUE'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object DBMemo1: TDBMemo
              Left = 20
              Top = 260
              Width = 597
              Height = 41
              DataField = 'OBS'
              DataSource = dtsFicha
              TabOrder = 8
            end
            object JvDBCalcEdit2: TJvDBCalcEdit
              Left = 145
              Top = 80
              Width = 117
              Height = 21
              ShowButton = False
              TabOrder = 4
              DecimalPlacesAlwaysShown = False
              DataField = 'QTDE'
              DataSource = dtsFicha
            end
            object JvDBCalcEdit1: TJvDBCalcEdit
              Left = 469
              Top = 80
              Width = 136
              Height = 21
              DisplayFormat = ',0.00'
              ShowButton = False
              TabOrder = 5
              DecimalPlacesAlwaysShown = True
              DataField = 'CUSTO'
              DataSource = dtsFicha
            end
            object dbcbEntidade: TJvDBComboEdit
              Left = 469
              Top = 49
              Width = 136
              Height = 21
              DataField = 'NOMEENTIDADE'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              TabOrder = 3
              OnButtonClick = dbcbEntidadeButtonClick
              OnEnter = dbcbEntidadeEnter
              OnKeyPress = dbcbEntidadeKeyPress
            end
            object dbcbPlanoConta: TJvDBComboEdit
              Left = 394
              Top = 113
              Width = 211
              Height = 21
              DataField = 'DESCR_PC_NOME'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              TabOrder = 6
              OnButtonClick = dbcbPlanoContaButtonClick
              OnKeyPress = dbcbPlanoContaKeyPress
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 339
    Width = 752
    ExplicitTop = 339
    ExplicitWidth = 752
    inherited _imageBottom: TImage
      Width = 752
      ExplicitWidth = 907
    end
    inherited _ToolBar: TToolBar
      Left = 4
      ExplicitLeft = 4
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 124
    Top = 4
  end
  inherited dtsFicha: TDataSource
    DataSet = FIN_EntradaEstoqueDatamodule.cdsEstoque
    Left = 483
    Top = 4
  end
  inherited dtsLista: TDataSource
    DataSet = FIN_EntradaEstoqueDatamodule.cdsLstEstoque
    Left = 442
    Top = 4
  end
  inherited _popMenuPrint: TPopupMenu
    Left = 266
    Top = 3
  end
  inherited _popMenuOther: TPopupMenu
    Left = 352
    Top = 3
  end
  inherited ToolBarIcons: TImageListProvider
    Left = 559
    Top = 4
  end
end
