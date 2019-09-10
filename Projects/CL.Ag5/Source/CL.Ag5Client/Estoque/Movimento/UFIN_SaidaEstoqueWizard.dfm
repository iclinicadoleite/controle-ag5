inherited FIN_SaidaEstoqueWizard: TFIN_SaidaEstoqueWizard
  Left = 703
  Top = 50
  Caption = 'Sa'#237'da de produtos'
  ClientHeight = 400
  ClientWidth = 754
  ExplicitWidth = 770
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Width = 754
    Height = 335
    ActivePage = _tbsFicha
    ExplicitWidth = 754
    ExplicitHeight = 335
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 746
      ExplicitHeight = 307
      inherited _pnlSearch: TPanel
        Width = 746
        Height = 60
        ExplicitWidth = 746
        ExplicitHeight = 60
        object Label14: TLabel [1]
          Left = 1
          Top = 34
          Width = 63
          Height = 13
          Caption = 'Data inicial'
        end
        object Label15: TLabel [2]
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
        Width = 746
        Height = 247
        ExplicitTop = 60
        ExplicitWidth = 746
        ExplicitHeight = 247
        inherited _dbgLista: TJvDBUltimGrid
          Width = 742
          Height = 243
          Constraints.MinHeight = 88
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 746
      ExplicitHeight = 307
      inherited _pnlFicha: TPanel
        Width = 746
        Height = 307
        Constraints.MinHeight = 173
        ExplicitWidth = 746
        ExplicitHeight = 307
        inherited _ScrollBoxFicha: TScrollBox
          Width = 746
          Height = 307
          ExplicitWidth = 746
          ExplicitHeight = 307
          inherited _pnlScroll: TPanel
            Width = 746
            Height = 307
            ExplicitWidth = 746
            ExplicitHeight = 307
            object Label1: TLabel
              Left = 16
              Top = 19
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
              Left = 411
              Top = 19
              Width = 61
              Height = 13
              Caption = 'Data sa'#237'da'
            end
            object Label3: TLabel
              Left = 16
              Top = 64
              Width = 100
              Height = 13
              Caption = 'Produto / Insumo'
            end
            object Label10: TLabel
              Left = 7
              Top = 229
              Width = 142
              Height = 13
              Caption = 'Detalhes / Observa'#231#245'es:'
            end
            object Label7: TLabel
              Left = 407
              Top = 64
              Width = 65
              Height = 13
              Caption = 'Quantidade'
            end
            object Label13: TLabel
              Left = 16
              Top = 102
              Width = 27
              Height = 13
              Caption = 'Total'
            end
            object DBText4: TDBText
              Left = 132
              Top = 102
              Width = 85
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
            object Label8: TLabel
              Left = 330
              Top = 102
              Width = 82
              Height = 13
              Caption = 'Conta cont'#225'bil'
            end
            object DBEdit1: TDBEdit
              Left = 132
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
              Left = 482
              Top = 16
              Width = 109
              Height = 21
              TabStop = False
              Checked = False
              DataField = 'DATA'
              DataSource = dtsFicha
              CheckOnExit = False
              Color = clWhite
              TabOrder = 1
            end
            object JvDBComboEdit1: TJvDBComboEdit
              Left = 132
              Top = 61
              Width = 210
              Height = 21
              DataField = 'NOME'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              TabOrder = 2
              OnButtonClick = JvDBComboEdit1ButtonClick
            end
            object GroupBox1: TGroupBox
              Left = 7
              Top = 132
              Width = 597
              Height = 91
              Caption = ' Posi'#231#227'o atual do estque'
              TabOrder = 5
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
                Width = 72
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
                Left = 221
                Top = 27
                Width = 247
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
                Left = 532
                Top = 27
                Width = 52
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
                Left = 475
                Top = 27
                Width = 46
                Height = 13
                Caption = 'Unidade'
              end
              object DBText1: TDBText
                Left = 94
                Top = 56
                Width = 77
                Height = 17
                DataField = 'CUSTO'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText2: TDBText
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
              object Label9: TLabel
                Left = 9
                Top = 56
                Width = 72
                Height = 13
                Caption = 'Custo m'#233'dio'
              end
              object Label12: TLabel
                Left = 400
                Top = 56
                Width = 94
                Height = 13
                Caption = 'Total do estoque'
              end
              object Label11: TLabel
                Left = 175
                Top = 56
                Width = 136
                Height = 13
                Caption = 'Quantidade em estoque'
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
            end
            object DBMemo1: TDBMemo
              Left = 7
              Top = 249
              Width = 597
              Height = 41
              DataField = 'OBS'
              DataSource = dtsFicha
              TabOrder = 6
            end
            object JvDBCalcEdit2: TJvDBCalcEdit
              Left = 482
              Top = 61
              Width = 109
              Height = 21
              ShowButton = False
              TabOrder = 3
              DecimalPlacesAlwaysShown = False
              DataField = 'QTDE'
              DataSource = dtsFicha
            end
            object JvDBComboEdit2: TJvDBComboEdit
              Left = 423
              Top = 99
              Width = 168
              Height = 21
              DataField = 'DESCR_PC_NOME'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              TabOrder = 4
              OnButtonClick = JvDBComboEdit2ButtonClick
              OnKeyPress = JvDBComboEdit2KeyPress
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 335
    Width = 754
    ExplicitTop = 335
    ExplicitWidth = 754
    inherited _imageBottom: TImage
      Width = 754
      ExplicitWidth = 754
    end
    inherited _ToolBar: TToolBar
      Left = 5
      ExplicitLeft = 5
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = FIN_SaidaEstoqueDatamodule.cdsEstoque
    Top = 8
  end
  inherited dtsLista: TDataSource
    DataSet = FIN_SaidaEstoqueDatamodule.cdsLstSaidaEstoque
    Left = 537
    Top = 8
  end
  inherited _popMenuPrint: TPopupMenu
    Left = 272
    Top = 3
  end
  inherited _popMenuOther: TPopupMenu
    Left = 356
    Top = 3
  end
  inherited ToolBarIcons: TImageListProvider
    Left = 447
    Top = 4
  end
end
