inherited frmVENDAS_Pedido: TfrmVENDAS_Pedido
  Left = 344
  Top = 105
  Caption = 'Vendas - Lan'#231'amentos Completos'
  ClientHeight = 811
  ClientWidth = 987
  OnMouseWheelDown = TcMPFormMouseWheelDown
  OnMouseWheelUp = TcMPFormMouseWheelUp
  ActionList.Left = 104
  ActionList.Top = 94
  ExplicitWidth = 1003
  ExplicitHeight = 850
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Width = 987
    Height = 746
    ActivePage = _tbsFicha
    ExplicitWidth = 987
    ExplicitHeight = 746
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 979
      ExplicitHeight = 718
      inherited _pnlSearch: TPanel
        Width = 979
        Height = 69
        ExplicitWidth = 979
        ExplicitHeight = 69
        inherited _lblPesquisas: TLabel
          Left = 8
          Top = 10
          ExplicitLeft = 8
          ExplicitTop = 10
        end
        object Label4: TLabel [1]
          Left = 5
          Top = 40
          Width = 63
          Height = 13
          Caption = 'Data inicial'
        end
        object Label5: TLabel [2]
          Left = 254
          Top = 40
          Width = 55
          Height = 13
          Caption = 'Data final'
        end
        inherited _edtSearch: TJvComboEdit
          Left = 83
          Top = 7
          ExplicitLeft = 83
          ExplicitTop = 7
        end
        object cbxInativos: TCheckBox
          Left = 328
          Top = 10
          Width = 64
          Height = 17
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Inativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Visible = False
          OnClick = cbxInativosClick
        end
        object deDtInicial: TTcDateEdit
          Left = 84
          Top = 37
          Width = 121
          Height = 21
          Checked = False
          CheckOnExit = False
          TabOrder = 2
          OnExit = deDtInicialExit
        end
        object deDtFinal: TTcDateEdit
          Left = 320
          Top = 37
          Width = 121
          Height = 21
          Checked = False
          CheckOnExit = False
          TabOrder = 3
          OnExit = deDtFinalExit
        end
      end
      inherited _pnldbgLista: TPanel
        Top = 69
        Width = 979
        Height = 649
        ExplicitTop = 69
        ExplicitWidth = 979
        ExplicitHeight = 649
        inherited _dbgLista: TJvDBUltimGrid
          Width = 975
          Height = 645
          Constraints.MinHeight = 88
          DrawingStyle = gdsThemed
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 979
      ExplicitHeight = 718
      inherited _pnlFicha: TPanel
        Width = 979
        Height = 718
        Color = clWhite
        Constraints.MinHeight = 173
        ExplicitWidth = 979
        ExplicitHeight = 718
        inherited _ScrollBoxFicha: TScrollBox
          Top = 74
          Width = 979
          Height = 644
          ExplicitTop = 74
          ExplicitWidth = 979
          ExplicitHeight = 644
          inherited _pnlScroll: TPanel
            Width = 979
            Height = 9
            Align = alTop
            ExplicitWidth = 979
            ExplicitHeight = 9
          end
          object PageControl1: TPageControl
            Left = 0
            Top = 9
            Width = 979
            Height = 395
            ActivePage = tbsProdutos
            Align = alClient
            TabOrder = 1
            object tbsProdutos: TTabSheet
              Caption = 'Produtos'
              DesignSize = (
                971
                367)
              object lblDescricaoItem: TLabel
                Left = 18
                Top = 7
                Width = 97
                Height = 13
                Caption = 'C'#243'digo - Produto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblContaContabilItem: TLabel
                Left = 865
                Top = 7
                Width = 82
                Height = 13
                AutoSize = False
                Caption = 'Conta cont'#225'bil'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblQtdeItem: TLabel
                Left = 459
                Top = 7
                Width = 27
                Height = 13
                Caption = 'Qtde'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblTotalItem: TLabel
                Left = 794
                Top = 7
                Width = 27
                Height = 13
                Caption = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblUnidadeItem: TLabel
                Left = 360
                Top = 7
                Width = 46
                Height = 13
                Caption = 'Unidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblValorUnitarioItem: TLabel
                Left = 526
                Top = 7
                Width = 76
                Height = 13
                Caption = 'Valor unit'#225'rio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object DBCtrlGridItens: TDBCtrlGrid
                Left = 4
                Top = 28
                Width = 967
                Height = 310
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clWhite
                DataSource = dtsItensPedido
                PanelHeight = 62
                PanelWidth = 950
                ParentColor = False
                ParentShowHint = False
                TabOrder = 0
                RowCount = 5
                SelectedColor = 15658734
                ShowFocus = False
                ShowHint = True
                OnPaintPanel = DBCtrlGridItensPaintPanel
              end
              object ItemEditPanel: TPanel
                Left = 5
                Top = 31
                Width = 950
                Height = 42
                Anchors = [akLeft, akTop, akRight]
                BevelOuter = bvNone
                ShowCaption = False
                TabOrder = 1
                TabStop = True
                OnResize = ItemEditPanelResize
                DesignSize = (
                  950
                  42)
                object Shape2: TShape
                  Left = 0
                  Top = 0
                  Width = 950
                  Height = 42
                  Align = alClient
                  Brush.Style = bsClear
                  Pen.Color = 16759156
                  Pen.Width = 2
                  ExplicitLeft = 504
                  ExplicitTop = -12
                  ExplicitWidth = 65
                  ExplicitHeight = 65
                end
                object ItemLayout0: TGridPanel
                  Left = 2
                  Top = 2
                  Width = 906
                  Height = 38
                  Anchors = [akLeft, akTop, akRight]
                  BevelEdges = []
                  BevelOuter = bvNone
                  Caption = ' '
                  Color = clWhite
                  ColumnCollection = <
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end>
                  ControlCollection = <
                    item
                      Column = 0
                      ColumnSpan = 6
                      Control = edItemCodigo
                      Row = 0
                    end
                    item
                      Column = 6
                      Control = cbxItemUnidadeCompra
                      Row = 0
                    end
                    item
                      Column = 7
                      Control = edItemQtdeCompra
                      Row = 0
                    end
                    item
                      Column = 8
                      Control = edItemValorUnit
                      Row = 0
                    end
                    item
                      Column = 9
                      Control = edItemTotal
                      Row = 0
                    end
                    item
                      Column = 10
                      ColumnSpan = 2
                      Control = edItemContaContabil
                      Row = 0
                    end>
                  ParentBackground = False
                  RowCollection = <
                    item
                      Value = 100.000000000000000000
                    end>
                  TabOrder = 0
                  TabStop = True
                  object edItemCodigo: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 7
                    Top = 7
                    Width = 436
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    Checked = False
                    DataField = 'NOME'
                    DataSource = dtsItensPedido
                    ImageKind = ikEllipsis
                    ButtonWidth = 17
                    TabOrder = 0
                    OnButtonClick = edItemCodigoButtonClick
                  end
                  object cbxItemUnidadeCompra: TDBComboBox
                    AlignWithMargins = True
                    Left = 457
                    Top = 7
                    Width = 61
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DataField = 'UNIDADE'
                    DataSource = dtsItensPedido
                    TabOrder = 1
                  end
                  object edItemQtdeCompra: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 532
                    Top = 7
                    Width = 61
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDE'
                    DataSource = dtsItensPedido
                  end
                  object edItemValorUnit: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 607
                    Top = 7
                    Width = 61
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    ShowButton = False
                    TabOrder = 3
                    DecimalPlacesAlwaysShown = False
                    DataField = 'CUSTO'
                    DataSource = dtsItensPedido
                  end
                  object edItemTotal: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 682
                    Top = 7
                    Width = 61
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 4
                    DecimalPlacesAlwaysShown = False
                    DataField = 'TOTAL'
                    DataSource = dtsItensPedido
                  end
                  object edItemContaContabil: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 757
                    Top = 7
                    Width = 139
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    Checked = False
                    DataField = 'DESCR_PC_NOME'
                    DataSource = dtsItensPedido
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    TabOrder = 5
                    OnButtonClick = edItemContaContabilButtonClick
                  end
                end
                object btnAdicionaItem: TTcGDIButton
                  Tag = 1
                  AlignWithMargins = True
                  Left = 925
                  Top = 4
                  Width = 21
                  Height = 16
                  Margins.Top = 5
                  Action = actAddItemProduto
                  Anchors = [akTop]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  OfficeHint.Notes.Strings = (
                    'aaa'
                    'a'
                    'aa'
                    'a'
                    'a')
                  OfficeHint.ShowHelp = True
                  ParentFont = False
                  Picture.Data = {
                    424D360300000000000036000000280000001000000010000000010018000000
                    000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFF3535351A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
                    1A1A1A1A1A1A1A1A1A1A1A1A1A353535FFFFFFFFFFFFFFFFFFFFFFFF1C1C1CFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1A
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFF0000000000000000000000
                    00000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7F000000FFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFF1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFF0000000000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3535351A
                    1A1A1A1A1A0000001A1A1A1A1A1A1A1A1A1A1A1A000000FFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  ShowCaption = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
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
                object btnRemoveItem: TTcGDIButton
                  Tag = 1
                  AlignWithMargins = True
                  Left = 925
                  Top = 21
                  Width = 21
                  Height = 16
                  Margins.Top = 5
                  Action = actRemoveItemProduto
                  Anchors = [akTop]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  OfficeHint.Notes.Strings = (
                    'aaa'
                    'a'
                    'aa'
                    'a'
                    'a')
                  OfficeHint.ShowHelp = True
                  ParentFont = False
                  Picture.Data = {
                    424D360300000000000036000000280000001000000010000000010018000000
                    000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                    00000000000000000000FFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                    FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF00
                    0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF000000FFFFFF
                    FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                    FF7F7F7FFFFFFFFFFFFF000000FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF00
                    0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF000000FFFFFF
                    FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                    FF7F7F7FFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F00
                    0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF0000007F7F7F
                    FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                    FF7F7F7FFFFFFFFFFFFF000000000000FFFFFFFCFDFDFFFFFF000000000000FF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    000000FFFFFFFFFFFF7F7F7F0000000000000000000000000000000000000000
                    000000000000000000000000000000007F7F7FFFFFFFFFFFFFFFFFFF000000FF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
                    00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFF0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  ShowCaption = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
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
              object Panel1: TPanel
                Left = 0
                Top = 345
                Width = 971
                Height = 22
                Align = alBottom
                BevelOuter = bvNone
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 2
                object LabelX10: TLabel
                  Left = 785
                  Top = 2
                  Width = 81
                  Height = 13
                  Caption = 'Total produtos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                end
                object DBText3: TDBText
                  Left = 877
                  Top = 2
                  Width = 90
                  Height = 17
                  Alignment = taRightJustify
                  Color = clBtnFace
                  DataField = 'TOTAL_ITENS'
                  DataSource = dtsFicha
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                end
                object btnAddProduto: TTcGDIButton
                  Left = 391
                  Top = 1
                  Width = 140
                  Height = 17
                  Caption = 'Cadastrar Produtos'
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  TabOrder = 0
                  Visible = False
                  OnClick = btnAddProdutoClick
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
            end
            object tbsPatrimonios: TTabSheet
              Caption = 'Patrim'#244'nios'
              ImageIndex = 4
              TabVisible = False
              DesignSize = (
                971
                367)
              object lblDescricaoPatrimonio: TLabel
                Left = 10
                Top = -1
                Width = 61
                Height = 13
                Caption = 'Patrim'#244'nio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblContaContabilPatrimonio: TLabel
                Left = 861
                Top = 0
                Width = 82
                Height = 13
                AutoSize = False
                Caption = 'Conta cont'#225'bil'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblDescontoPatrimonio: TLabel
                Left = 603
                Top = 0
                Width = 53
                Height = 13
                Caption = 'Desconto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblFretePatrimonio: TLabel
                Left = 709
                Top = 0
                Width = 29
                Height = 13
                Caption = 'Frete'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblQtdePatrimonio: TLabel
                Left = 451
                Top = 0
                Width = 27
                Height = 13
                Caption = 'Qtde'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblTotalPatrimonio: TLabel
                Left = 786
                Top = 1
                Width = 27
                Height = 13
                Caption = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblUnidadePatrimonio: TLabel
                Left = 352
                Top = 0
                Width = 46
                Height = 13
                Caption = 'Unidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblValorUnitarioPatrimonio: TLabel
                Left = 518
                Top = 0
                Width = 76
                Height = 13
                Caption = 'Valor unit'#225'rio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object DBCtrlGridPatrimonios: TDBCtrlGrid
                Left = 3
                Top = 20
                Width = 968
                Height = 310
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clWhite
                DataSource = dtsPatrimoniosPedido
                PanelHeight = 62
                PanelWidth = 951
                ParentColor = False
                ParentShowHint = False
                TabOrder = 0
                RowCount = 5
                SelectedColor = 15658734
                ShowFocus = False
                ShowHint = True
                OnPaintPanel = DBCtrlGridPatrimoniosPaintPanel
              end
              object PatrimonioEditPanel: TPanel
                Left = 5
                Top = 27
                Width = 944
                Height = 42
                Anchors = [akLeft, akTop, akRight]
                BevelOuter = bvNone
                ShowCaption = False
                TabOrder = 1
                TabStop = True
                OnResize = PatrimonioEditPanelResize
                DesignSize = (
                  944
                  42)
                object Shape1: TShape
                  Left = 0
                  Top = 0
                  Width = 944
                  Height = 42
                  Align = alClient
                  Brush.Style = bsClear
                  Pen.Color = 16759156
                  Pen.Width = 2
                  ExplicitLeft = 504
                  ExplicitTop = -12
                  ExplicitWidth = 65
                  ExplicitHeight = 65
                end
                object PatrimonioLayout0: TGridPanel
                  Left = 2
                  Top = 2
                  Width = 900
                  Height = 38
                  Anchors = [akLeft, akTop, akRight]
                  BevelEdges = []
                  BevelOuter = bvNone
                  Caption = ' '
                  Color = clWhite
                  ColumnCollection = <
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end>
                  ControlCollection = <
                    item
                      Column = 0
                      ColumnSpan = 4
                      Control = edPatrimonioCodigo
                      Row = 0
                    end
                    item
                      Column = 4
                      Control = cbxPatrimonioUnidadeCompra
                      Row = 0
                    end
                    item
                      Column = 5
                      Control = edPatrimonioQtdeCompra
                      Row = 0
                    end
                    item
                      Column = 6
                      Control = edPatrimonioValorUnit
                      Row = 0
                    end
                    item
                      Column = 7
                      Control = edPatrimonioDesconto
                      Row = 0
                    end
                    item
                      Column = 8
                      Control = edPatrimonioFrete
                      Row = 0
                    end
                    item
                      Column = 9
                      Control = edPatrimonioTotal
                      Row = 0
                    end
                    item
                      Column = 10
                      ColumnSpan = 2
                      Control = edPatrimonioContaContabil
                      Row = 0
                    end>
                  ParentBackground = False
                  RowCollection = <
                    item
                      Value = 100.000000000000000000
                    end>
                  TabOrder = 0
                  TabStop = True
                  DesignSize = (
                    900
                    38)
                  object edPatrimonioCodigo: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 7
                    Top = 8
                    Width = 282
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    OnEnter = edPatrimonioCodigoEnter
                    Checked = False
                    DataField = 'NOME'
                    DataSource = dtsPatrimoniosPedido
                    ImageKind = ikEllipsis
                    ButtonWidth = 17
                    Anchors = [akLeft, akTop, akBottom]
                    TabOrder = 0
                    OnButtonClick = edPatrimonioCodigoButtonClick
                  end
                  object cbxPatrimonioUnidadeCompra: TDBComboBox
                    AlignWithMargins = True
                    Left = 303
                    Top = 8
                    Width = 60
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    Anchors = [akLeft, akTop, akBottom]
                    DataField = 'UNIDADE'
                    DataSource = dtsPatrimoniosPedido
                    TabOrder = 1
                  end
                  object edPatrimonioQtdeCompra: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 377
                    Top = 8
                    Width = 60
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    Anchors = [akLeft, akTop, akBottom]
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDE'
                    DataSource = dtsPatrimoniosPedido
                  end
                  object edPatrimonioValorUnit: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 451
                    Top = 8
                    Width = 60
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    Anchors = [akLeft, akTop, akBottom]
                    ShowButton = False
                    TabOrder = 3
                    DecimalPlacesAlwaysShown = False
                    DataField = 'CUSTO'
                    DataSource = dtsPatrimoniosPedido
                  end
                  object edPatrimonioDesconto: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 525
                    Top = 8
                    Width = 60
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    Anchors = [akLeft, akTop, akBottom]
                    ShowButton = False
                    TabOrder = 4
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataSource = dtsPatrimoniosPedido
                  end
                  object edPatrimonioFrete: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 600
                    Top = 8
                    Width = 60
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    Anchors = [akLeft, akTop, akBottom]
                    ShowButton = False
                    TabOrder = 5
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataSource = dtsPatrimoniosPedido
                  end
                  object edPatrimonioTotal: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 675
                    Top = 8
                    Width = 60
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    Anchors = [akLeft, akTop, akBottom]
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 6
                    DecimalPlacesAlwaysShown = False
                    DataField = 'TOTAL'
                    DataSource = dtsPatrimoniosPedido
                  end
                  object edPatrimonioContaContabil: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 750
                    Top = 8
                    Width = 143
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    Checked = False
                    DataField = 'DESCR_PC_NOME'
                    DataSource = dtsPatrimoniosPedido
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    Anchors = [akLeft, akTop, akBottom]
                    TabOrder = 7
                  end
                end
                object btnAdicionaPatrimonio: TTcGDIButton
                  Tag = 1
                  AlignWithMargins = True
                  Left = 919
                  Top = 0
                  Width = 21
                  Height = 21
                  Margins.Top = 5
                  Anchors = [akTop]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  OfficeHint.Notes.Strings = (
                    'aaa'
                    'a'
                    'aa'
                    'a'
                    'a')
                  OfficeHint.ShowHelp = True
                  ParentFont = False
                  Picture.Data = {
                    424D060300000000000036000000280000000F0000000F000000010018000000
                    0000D0020000120B0000120B000000000000000000008300E5EEEDECEEEDECEE
                    EDECEEEDECEEEDECEEEDECEDECEBEBEAE9EDECEBE8E6E5AFACAB8300E58300E5
                    8300E5000000EEEDECECEBEBEEEDECEEEDECEEEDECEDECEBEBEAE9EDECEBE8E6
                    E5C2BFBEB7B3B2A8A4A48300E58300E58300E5000000EEEDECEEEDECEEEDECEB
                    EAE9EDECEBE8E6E5CCC9C7C0BCBBB4B0AFA6A2A19692929692928300E58300E5
                    8300E5000000EEEDECEEEDECEEEDECE8E6E5E8E6E5CAC8C6C0BCBB7CAE8643BC
                    6478B785BFBDBCB3B0AF8300E58300E58300E5000000ECEBEBEDECEBEBEAE9CC
                    C9C7C0BCBBBBB7B682C08E55C87783D49D77CB8AE4E3E2C6C3C38300E58300E5
                    8300E5000000EEEDECEDECEBE8E6E5CCC9C7BCB8B785C1915ACA7D8FD8A87CD2
                    985FCA77AFD6B595BC9BACD3B2ACD3B2BAD7BE000000EEEDECEEEDECCCC9C7C0
                    BCBB88C29465CD8682D39E82D39E79D39863CD8663CD8663CD8663CD8663CD86
                    5AC877000000EEEDECEEEDECBEBBB999C7A560CC8372D19272D19272D19272D1
                    9272D19272D19272D19272D19272D19261CB7C000000EDECEBEBEAE9A2C6A965
                    CD8A65CD8A65CD8A65CD8A65CD8A65CD8A65CD8A65CD8A65CD8A65CD8A65CD8A
                    68CE83000000EDECEBE8E6E5D4D2D078CC8D63CD8657CA7D57CA7D57CA7D57CA
                    7D57CA7D57CA7D57CA7D57CA7D57CA7D6ECF89000000EEEDECECEBEBEEEDECE2
                    E1E082D39660CC8549C67249C6724DC87459CB7F59CB7F59CB7F59CB7F59CB7F
                    77D08E000000EBEAE9ECEBEBEEEDECE8E7E6EBEAE98AD59D5FCB823EC26854C7
                    7893D6A5CFE0D3B4C5B8CFE0D3CFE0D3CADFCE000000E8E6E5EEEDECEEEDECEB
                    EAEAEDECECEEEDECC4E4CC53C6734DC67195D6A3DFDEDCBFBCBB8300E58300E5
                    8300E5000000EEEDECEEEDECEEEDECEEEDECEEEDECEEEDECECEBEAAEDCB86ECF
                    8999D3A4D8D6D4BAB8B78300E58300E58300E5000000EEEDECEEEDECEEEDECEE
                    EDECEDECECECEBEAE8E7E6E4E3E1DEDDDBD7D5D4CFCCCBB5B2B28300E58300E5
                    8300E5000000}
                  ShowCaption = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
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
                object btnRemovePatrimonio: TTcGDIButton
                  Tag = 1
                  AlignWithMargins = True
                  Left = 919
                  Top = 21
                  Width = 21
                  Height = 21
                  Margins.Top = 5
                  Anchors = [akTop]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  OfficeHint.Notes.Strings = (
                    'aaa'
                    'a'
                    'aa'
                    'a'
                    'a')
                  OfficeHint.ShowHelp = True
                  ParentFont = False
                  Picture.Data = {
                    424D06030000000000003600000028000000100000000F000000010018000000
                    0000D0020000120B0000120B000000000000000000008300E5E9E8E7ECEBEAEE
                    EDECEEEDECEDECECECEBEAE8E7E6E4E3E1DEDDDBD7D5D4CFCCCBB5B2B28300E5
                    8300E58300E5EAE9E7ECEBEBEEEDECEEEDECEDECECEBEAE9E8E7E6E3E2E1DDDC
                    DAD6D4D3CECBCAC3C0BFAFACAB8300E58300E58300E5EEEDECEDECECECEBEAE8
                    E7E6E4E3E1DEDDDBD7D5D4CFCCCBB5B2B23636B16967A8BFBDBCB3B0AF8300E5
                    8300E58300E5EDECECEBEAE9E8E7E6E3E2E1DDDCDAD6D4D3CECBCAC3C0BFAFAC
                    AB5757D46060D67171BFC6C3C38300E58300E58300E5C2BFBD7D787A908B8C98
                    949A8B889E9592A89D9BB0A5A2B78887AD5555D37D7DDD6D6DD96867B78300E5
                    8300E58300E5CDCBC9918D8EA29E9E6D6BA84C4CD15151D25151D25151D25151
                    D25F5FD66F6FDA6F6FDA6464D77676D0D9D8DC8300E5D7D5D3A4A09FB2AEAD75
                    74B25A5AD46060D66060D66060D66060D66060D66060D66060D66060D65A5AD4
                    5555CDD9D8DCDFDDDCB3AFAFC0BCBB7C7BBC5454D35454D35454D35454D35454
                    D35454D35454D35454D35454D35454D35252D27575CDE5E4E3C1BDBCCBC9C782
                    81C44D4DD14747D04747D04747D04747D04747D04747D04747D04747D04949D0
                    5E5ED1D9D8DCEAE9E7CCCAC8D5D3D28786CC5252D24949D04949D04949D04949
                    D04141CE3939CC3939CC4141CE6262D3D9D8DC8300E5EDECEBD6D4D2DDDCDACD
                    CCDDCCCBE3CECDE6D0CFE8D0D0E89F9EDE5555D33232C23D3DCD6968CFD9D8DC
                    8300E58300E5EEEDECDEDCDBE4E2E1E8E7E6EBEAEAEDECECEEEDECEEEDECB9B8
                    CE5757D43737CB7574D6B5B2B78300E58300E58300E5EEEDECE5E4E3E9E8E7EC
                    EBEAEEEDECEEEDECEEEDECECEBEAD0CFD96F6FDA9493DACCCBCEBAB8B78300E5
                    8300E58300E5EDECEBE9E8E7ECEBEAEEEDECEEEDECEDECECECEBEAE8E7E6E4E3
                    E1DEDDDBD7D5D4CFCCCBB5B2B28300E58300E58300E5EDECEBE9E8E7ECEBEAEE
                    EDECEEEDECEDECECECEBEAE8E7E6E4E3E1DEDDDBD7D5D4CFCCCBB5B2B28300E5
                    8300E58300E5}
                  ShowCaption = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
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
              object pnlTotalServicos: TPanel
                Left = 0
                Top = 345
                Width = 971
                Height = 22
                Align = alBottom
                BevelOuter = bvNone
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 2
                object Label10: TLabel
                  Left = 794
                  Top = 3
                  Width = 98
                  Height = 13
                  Caption = 'Total patrim'#244'nios'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                end
                object DBText2: TDBText
                  Left = 900
                  Top = 3
                  Width = 108
                  Height = 17
                  Alignment = taCenter
                  Color = clBtnFace
                  DataField = 'TOTAL_SERVICOS'
                  DataSource = dtsFicha
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                end
                object btnAddPatrimonio: TTcGDIButton
                  Left = 391
                  Top = 1
                  Width = 140
                  Height = 17
                  Caption = 'Cadastrar patrim'#244'nio'
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  TabOrder = 0
                  OnClick = btnAddPatrimonioClick
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
            end
            object tbsServicos: TTabSheet
              Caption = 'Servi'#231'os'
              ImageIndex = 1
              TabVisible = False
              DesignSize = (
                971
                367)
              object lblDescricaoServico: TLabel
                Left = 14
                Top = 3
                Width = 43
                Height = 13
                Caption = 'Servi'#231'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblContaContabilServico: TLabel
                Left = 865
                Top = 5
                Width = 82
                Height = 13
                AutoSize = False
                Caption = 'Conta cont'#225'bil'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblDescontoServico: TLabel
                Left = 607
                Top = 4
                Width = 53
                Height = 13
                Caption = 'Desconto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblFreteServico: TLabel
                Left = 713
                Top = 4
                Width = 29
                Height = 13
                Caption = 'Frete'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblQtdeServico: TLabel
                Left = 455
                Top = 4
                Width = 27
                Height = 13
                Caption = 'Qtde'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblTotalServico: TLabel
                Left = 790
                Top = 5
                Width = 27
                Height = 13
                Caption = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblUnidadeServico: TLabel
                Left = 356
                Top = 4
                Width = 46
                Height = 13
                Caption = 'Unidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblValorUnitarioServico: TLabel
                Left = 522
                Top = 4
                Width = 76
                Height = 13
                Caption = 'Valor unit'#225'rio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object DBCtrlGridServicos: TDBCtrlGrid
                Left = 0
                Top = 20
                Width = 970
                Height = 335
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clWhite
                DataSource = dtsServicos
                PanelHeight = 67
                PanelWidth = 953
                ParentColor = False
                ParentShowHint = False
                TabOrder = 0
                RowCount = 5
                SelectedColor = 15658734
                ShowFocus = False
                ShowHint = True
                OnPaintPanel = DBCtrlGridServicosPaintPanel
              end
              object ServicoEditPanel: TPanel
                Left = 1
                Top = 26
                Width = 952
                Height = 42
                Anchors = [akLeft, akTop, akRight]
                BevelOuter = bvNone
                ShowCaption = False
                TabOrder = 1
                TabStop = True
                OnResize = ServicoEditPanelResize
                DesignSize = (
                  952
                  42)
                object Shape3: TShape
                  Left = 0
                  Top = 0
                  Width = 952
                  Height = 42
                  Align = alClient
                  Brush.Style = bsClear
                  Pen.Color = 16759156
                  Pen.Width = 2
                  ExplicitTop = -1
                  ExplicitWidth = 1071
                end
                object ServicoLayout0: TGridPanel
                  Left = 1
                  Top = 2
                  Width = 908
                  Height = 38
                  Anchors = [akLeft, akTop, akRight]
                  BevelEdges = []
                  BevelOuter = bvNone
                  Caption = ' '
                  Color = clWhite
                  ColumnCollection = <
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333330000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end
                    item
                      Value = 8.333333333333336000
                    end>
                  ControlCollection = <
                    item
                      Column = 0
                      ColumnSpan = 4
                      Control = edServicoCodigo
                      Row = 0
                    end
                    item
                      Column = 4
                      Control = cbxServicoUnidadeCompra
                      Row = 0
                    end
                    item
                      Column = 5
                      Control = edServicoQtdeCompra
                      Row = 0
                    end
                    item
                      Column = 6
                      Control = edServicoValorUnit
                      Row = 0
                    end
                    item
                      Column = 9
                      Control = edServicoTotal
                      Row = 0
                    end
                    item
                      Column = 10
                      ColumnSpan = 2
                      Control = edServicoContaContabil
                      Row = 0
                    end>
                  ParentBackground = False
                  RowCollection = <
                    item
                      Value = 100.000000000000000000
                    end>
                  TabOrder = 0
                  TabStop = True
                  DesignSize = (
                    908
                    38)
                  object edServicoCodigo: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 7
                    Top = 8
                    Width = 286
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    OnEnter = edServicoCodigoEnter
                    Checked = False
                    DataField = 'CODIGO'
                    DataSource = dtsServicos
                    ImageKind = ikEllipsis
                    ButtonWidth = 17
                    Anchors = [akLeft, akTop, akBottom]
                    TabOrder = 0
                    OnButtonClick = edServicoCodigoButtonClick
                  end
                  object cbxServicoUnidadeCompra: TDBComboBox
                    AlignWithMargins = True
                    Left = 307
                    Top = 8
                    Width = 61
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    Anchors = [akLeft, akTop, akBottom]
                    DataField = 'UNIDADE'
                    DataSource = dtsServicos
                    TabOrder = 1
                  end
                  object edServicoQtdeCompra: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 382
                    Top = 8
                    Width = 61
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    Anchors = [akLeft, akTop, akBottom]
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDE'
                    DataSource = dtsServicos
                  end
                  object edServicoValorUnit: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 457
                    Top = 8
                    Width = 61
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    Anchors = [akLeft, akTop, akBottom]
                    ShowButton = False
                    TabOrder = 3
                    DecimalPlacesAlwaysShown = False
                    DataField = 'CUSTO'
                    DataSource = dtsServicos
                  end
                  object edServicoTotal: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 682
                    Top = 8
                    Width = 61
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    Anchors = [akLeft, akTop, akBottom]
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 4
                    DecimalPlacesAlwaysShown = False
                    DataField = 'TOTAL'
                    DataSource = dtsServicos
                  end
                  object edServicoContaContabil: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 757
                    Top = 8
                    Width = 141
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    Checked = False
                    DataField = 'DESCR_PC_NOME'
                    DataSource = dtsServicos
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    Anchors = [akLeft, akTop, akBottom]
                    TabOrder = 5
                  end
                end
                object btnAdicionaServico: TTcGDIButton
                  Tag = 1
                  AlignWithMargins = True
                  Left = 927
                  Top = 0
                  Width = 21
                  Height = 21
                  Margins.Top = 5
                  Anchors = [akTop]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  OfficeHint.Notes.Strings = (
                    'aaa'
                    'a'
                    'aa'
                    'a'
                    'a')
                  OfficeHint.ShowHelp = True
                  ParentFont = False
                  Picture.Data = {
                    424D360300000000000036000000280000001000000010000000010018000000
                    000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFF3535351A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
                    1A1A1A1A1A1A1A1A1A1A1A1A1A353535FFFFFFFFFFFFFFFFFFFFFFFF1C1C1CFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1A
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFF0000000000000000000000
                    00000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7F000000FFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFF1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFF0000000000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3535351A
                    1A1A1A1A1A0000001A1A1A1A1A1A1A1A1A1A1A1A000000FFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  ShowCaption = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
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
                object btnRemoveServico: TTcGDIButton
                  Tag = 1
                  AlignWithMargins = True
                  Left = 927
                  Top = 21
                  Width = 21
                  Height = 21
                  Margins.Top = 5
                  Anchors = [akTop]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  OfficeHint.Notes.Strings = (
                    'aaa'
                    'a'
                    'aa'
                    'a'
                    'a')
                  OfficeHint.ShowHelp = True
                  ParentFont = False
                  Picture.Data = {
                    424D06030000000000003600000028000000100000000F000000010018000000
                    0000D0020000120B0000120B000000000000000000008300E5E9E8E7ECEBEAEE
                    EDECEEEDECEDECECECEBEAE8E7E6E4E3E1DEDDDBD7D5D4CFCCCBB5B2B28300E5
                    8300E58300E5EAE9E7ECEBEBEEEDECEEEDECEDECECEBEAE9E8E7E6E3E2E1DDDC
                    DAD6D4D3CECBCAC3C0BFAFACAB8300E58300E58300E5EEEDECEDECECECEBEAE8
                    E7E6E4E3E1DEDDDBD7D5D4CFCCCBB5B2B23636B16967A8BFBDBCB3B0AF8300E5
                    8300E58300E5EDECECEBEAE9E8E7E6E3E2E1DDDCDAD6D4D3CECBCAC3C0BFAFAC
                    AB5757D46060D67171BFC6C3C38300E58300E58300E5C2BFBD7D787A908B8C98
                    949A8B889E9592A89D9BB0A5A2B78887AD5555D37D7DDD6D6DD96867B78300E5
                    8300E58300E5CDCBC9918D8EA29E9E6D6BA84C4CD15151D25151D25151D25151
                    D25F5FD66F6FDA6F6FDA6464D77676D0D9D8DC8300E5D7D5D3A4A09FB2AEAD75
                    74B25A5AD46060D66060D66060D66060D66060D66060D66060D66060D65A5AD4
                    5555CDD9D8DCDFDDDCB3AFAFC0BCBB7C7BBC5454D35454D35454D35454D35454
                    D35454D35454D35454D35454D35454D35252D27575CDE5E4E3C1BDBCCBC9C782
                    81C44D4DD14747D04747D04747D04747D04747D04747D04747D04747D04949D0
                    5E5ED1D9D8DCEAE9E7CCCAC8D5D3D28786CC5252D24949D04949D04949D04949
                    D04141CE3939CC3939CC4141CE6262D3D9D8DC8300E5EDECEBD6D4D2DDDCDACD
                    CCDDCCCBE3CECDE6D0CFE8D0D0E89F9EDE5555D33232C23D3DCD6968CFD9D8DC
                    8300E58300E5EEEDECDEDCDBE4E2E1E8E7E6EBEAEAEDECECEEEDECEEEDECB9B8
                    CE5757D43737CB7574D6B5B2B78300E58300E58300E5EEEDECE5E4E3E9E8E7EC
                    EBEAEEEDECEEEDECEEEDECECEBEAD0CFD96F6FDA9493DACCCBCEBAB8B78300E5
                    8300E58300E5EDECEBE9E8E7ECEBEAEEEDECEEEDECEDECECECEBEAE8E7E6E4E3
                    E1DEDDDBD7D5D4CFCCCBB5B2B28300E58300E58300E5EDECEBE9E8E7ECEBEAEE
                    EDECEEEDECEDECECECEBEAE8E7E6E4E3E1DEDDDBD7D5D4CFCCCBB5B2B28300E5
                    8300E58300E5}
                  ShowCaption = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
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
              object Panel2: TPanel
                Left = 0
                Top = 345
                Width = 971
                Height = 22
                Align = alBottom
                BevelOuter = bvNone
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 2
                object Label3: TLabel
                  Left = 799
                  Top = 2
                  Width = 78
                  Height = 13
                  Caption = 'Total servi'#231'os'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                end
                object DBText4: TDBText
                  Left = 896
                  Top = 2
                  Width = 108
                  Height = 17
                  Alignment = taCenter
                  Color = clBtnFace
                  DataField = 'TOTAL_SERVICOS'
                  DataSource = dtsFicha
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                end
                object btnAddServico: TTcGDIButton
                  Left = 391
                  Top = 1
                  Width = 140
                  Height = 17
                  Caption = 'Cadastrar servi'#231'os'
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  TabOrder = 0
                  OnClick = btnAddServicoClick
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
            end
            object TabSheet1: TTabSheet
              Caption = 'Descontos'
              ImageIndex = 4
              object Panel555: TPanel
                Left = 0
                Top = 0
                Width = 971
                Height = 367
                Align = alClient
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 0
                DesignSize = (
                  971
                  367)
                object Label19: TLabel
                  Left = 205
                  Top = 56
                  Width = 48
                  Height = 13
                  Caption = 'Todo dia'
                end
                object Label20: TLabel
                  Left = 5
                  Top = 56
                  Width = 115
                  Height = 13
                  Caption = 'N'#250'mero de parcelas'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                end
                object Label21: TLabel
                  Left = 5
                  Top = 22
                  Width = 87
                  Height = 13
                  Caption = 'Conta banc'#225'ria'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                end
                object Label27: TLabel
                  Left = 0
                  Top = 0
                  Width = 971
                  Height = 13
                  Align = alTop
                  Caption = ' * Dados da sincroniza'#231#227'o, n'#227'o '#233' poss'#237'vel alterar.'
                  ExplicitWidth = 284
                end
                object dbgParcelasAPagar: TJvDBUltimGrid
                  Left = 319
                  Top = 58
                  Width = 643
                  Height = 280
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  DataSource = dtsParcelasAPagar
                  ParentColor = True
                  TabOrder = 7
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clBlack
                  TitleFont.Height = -11
                  TitleFont.Name = 'Verdana'
                  TitleFont.Style = []
                  BevelKind = bkFlat
                  BevelOuter = bvNone
                  AlternateRowColor = 15920101
                  ScrollBars = ssHorizontal
                  AutoSizeColumns = True
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  EditControls = <
                    item
                      ControlName = 'dbVencimento'
                      FieldName = 'VENCTO'
                      FitCell = fcBiggest
                      LeaveOnEnterKey = True
                      LeaveOnUpDownKey = True
                    end
                    item
                      ControlName = 'dbceValorParcela'
                      FieldName = 'VALOR'
                      FitCell = fcCellSize
                      LeaveOnEnterKey = True
                    end
                    item
                      ControlName = 'dbmObsParcela'
                      FieldName = 'OBS'
                      FitCell = fcBiggest
                      LeaveOnEnterKey = True
                    end>
                  RowsHeight = 17
                  TitleRowHeight = 17
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'DOCUMENTO'
                      Width = 12
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VENCTO'
                      Width = 12
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRORROGACAO'
                      ReadOnly = True
                      Width = 12
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR'
                      Width = 12
                      Visible = True
                    end
                    item
                      ButtonStyle = cbsEllipsis
                      Expanded = False
                      FieldName = 'NOMECONTA'
                      Width = 12
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PAGTO'
                      ReadOnly = True
                      Width = 12
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'OBS'
                      Width = 546
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NUM_CHEQUE'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'CHEQUE'
                      Visible = False
                    end>
                end
                object TcGDIButton1: TTcGDIButton
                  Left = 1733
                  Top = 76
                  Width = 21
                  Height = 21
                  Hint = 'Nova parcela'
                  Anchors = [akTop, akRight]
                  Caption = 'Adicionar parcela'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  ParentFont = False
                  Picture.Data = {
                    424D360300000000000036000000280000001000000010000000010018000000
                    000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFF3535351A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
                    1A1A1A1A1A1A1A1A1A1A1A1A1A353535FFFFFFFFFFFFFFFFFFFFFFFF1C1C1CFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1A
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFF0000000000000000000000
                    00000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7F000000FFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFF1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFF0000000000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3535351A
                    1A1A1A1A1A0000001A1A1A1A1A1A1A1A1A1A1A1A000000FFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  ShowCaption = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 8
                  OnClick = btnAdicionaParcelaClick
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
                object TcGDIButton2: TTcGDIButton
                  Left = 1733
                  Top = 97
                  Width = 21
                  Height = 21
                  Hint = 'Remover parcela'
                  Anchors = [akTop, akRight]
                  Caption = 'Remover parcela'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  ParentFont = False
                  Picture.Data = {
                    424D360300000000000036000000280000001000000010000000010018000000
                    000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                    00000000000000000000FFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                    FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF00
                    0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF000000FFFFFF
                    FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                    FF7F7F7FFFFFFFFFFFFF000000FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF00
                    0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF000000FFFFFF
                    FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                    FF7F7F7FFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F00
                    0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF0000007F7F7F
                    FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                    FF7F7F7FFFFFFFFFFFFF000000000000FFFFFFFCFDFDFFFFFF000000000000FF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    000000FFFFFFFFFFFF7F7F7F0000000000000000000000000000000000000000
                    000000000000000000000000000000007F7F7FFFFFFFFFFFFFFFFFFF000000FF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
                    00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFF0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  ShowCaption = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 9
                  OnClick = btnRemoveParcelaClick
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
                object DBEdit1: TDBEdit
                  Left = 273
                  Top = 54
                  Width = 32
                  Height = 21
                  DataField = 'DIA_VENCTO'
                  DataSource = dtsAPagar
                  MaxLength = 2
                  TabOrder = 2
                end
                object TcDBDateEdit1: TTcDBDateEdit
                  Left = 499
                  Top = 90
                  Width = 119
                  Height = 21
                  Checked = False
                  DataField = 'VENCTO'
                  DataSource = dtsParcelasAPagar
                  CheckOnExit = False
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 11
                  Visible = False
                end
                object DBMemo2: TDBMemo
                  Left = 581
                  Top = 118
                  Width = 390
                  Height = 56
                  DataField = 'OBS'
                  DataSource = dtsParcelasAPagar
                  TabOrder = 13
                  Visible = False
                end
                object DBEdit2: TDBEdit
                  Left = 131
                  Top = 54
                  Width = 30
                  Height = 21
                  DataField = 'NUM_PARCELAS'
                  DataSource = dtsAPagar
                  MaxLength = 3
                  TabOrder = 1
                end
                object pnlTotalAPagar: TPanel
                  Left = 0
                  Top = 347
                  Width = 971
                  Height = 20
                  Align = alBottom
                  BevelOuter = bvNone
                  Caption = ' '
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 10
                  object Label24: TLabel
                    Left = 778
                    Top = 1
                    Width = 79
                    Height = 13
                    Caption = 'Total Parcelas'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                  end
                  object DBText5: TDBText
                    Left = 864
                    Top = 1
                    Width = 90
                    Height = 17
                    Alignment = taRightJustify
                    DataField = 'SomaValor'
                    DataSource = dtsParcelasAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object GroupBox2: TGroupBox
                  Left = 319
                  Top = 15
                  Width = 644
                  Height = 39
                  TabOrder = 6
                  object Label25: TLabel
                    Left = 419
                    Top = 12
                    Width = 57
                    Height = 13
                    Caption = 'Cheque : '
                  end
                  object JvDBCheckBox1: TJvDBCheckBox
                    Left = 17
                    Top = 10
                    Width = 172
                    Height = 17
                    Caption = 'Pagamento '#224' vista '
                    DataField = 'PAGTO_AVISTA'
                    DataSource = dtsAPagar
                    TabOrder = 0
                    ValueChecked = 'T'
                    ValueUnchecked = 'F'
                    OnChange = DBCheckBox1Change
                  end
                  object DBEdit3: TDBEdit
                    Left = 482
                    Top = 8
                    Width = 135
                    Height = 21
                    DataField = 'NUM_CHEQUE'
                    DataSource = dtsParcelasAPagar
                    TabOrder = 2
                  end
                  object JvDBCheckBox2: TJvDBCheckBox
                    Left = 235
                    Top = 10
                    Width = 97
                    Height = 17
                    Caption = 'Com cheque '
                    DataField = 'CHEQUE'
                    DataSource = dtsParcelasAPagar
                    TabOrder = 1
                    ValueChecked = 'T'
                    ValueUnchecked = 'F'
                  end
                end
                object TcGDIButton3: TTcGDIButton
                  Left = 201
                  Top = 117
                  Width = 108
                  Height = 21
                  Caption = 'Programar...'
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  Picture.Data = {
                    424D360300000000000036000000280000001000000010000000010018000000
                    000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                    FFFFF5F5F55F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D52A2A2A000000FFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F0A
                    0A0A0000000000000000000000000000000C0C0C3737379A9A9AFEFEFEFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFF9F9F9F0A0A0A0000000000000000000000000000
                    00000000000000000000434343E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5
                    D5D52A2A2A000000FFFFFFFFFFFFFFFFFFE6E6E6A6A6A61C1C1C000000434343
                    FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F55F5F5FFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFEDEDED1C1C1C0000009A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6A6A6000000
                    373737FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFE6E6E60000000C0C0CFFFFFFFFFFFF0C0C0C000000E6
                    E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFF373737000000A6A6A6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A0000001C
                    1C1CEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060F5F5F5FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFEFEFE4343430000001C1C1CA6A6A6E6E6E6FFFFFFFFFF
                    FFFFFFFF0000002A2A2AD5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E743
                    43430000000000000000000000000000000000000000000000000A0A0AA0A0A0
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE9A9A9A3737370D0D0D0000000000
                    000000000000000000000A0A0AA0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000002A2A2AD5D5D5FFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFF606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  TabOrder = 5
                  OnClick = TcGDIButton3Click
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
                object TcDBComboEdit1: TTcDBComboEdit
                  Left = 131
                  Top = 18
                  Width = 174
                  Height = 21
                  Checked = False
                  DataField = 'NOMECONTA'
                  DataSource = dtsAPagar
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ImageKind = ikEllipsis
                  ButtonWidth = 15
                  ParentFont = False
                  TabOrder = 0
                  OnButtonClick = TcDBComboEdit1ButtonClick
                end
                object JvDBCalcEdit1: TJvDBCalcEdit
                  Left = 637
                  Top = 91
                  Width = 121
                  Height = 21
                  ShowButton = False
                  TabOrder = 12
                  Visible = False
                  DecimalPlacesAlwaysShown = False
                  DataField = 'VALOR'
                  DataSource = dtsParcelasAPagar
                end
                object DBCheckBox2: TDBCheckBox
                  Left = 7
                  Top = 89
                  Width = 168
                  Height = 17
                  Caption = 'A partir do pr'#243'ximo m'#234's '
                  DataField = 'PROXIMO_MES'
                  DataSource = dtsAPagar
                  TabOrder = 3
                  ValueChecked = 'T'
                  ValueUnchecked = 'F'
                end
                object cbAnualDescontos: TJvDBCheckBox
                  Left = 7
                  Top = 117
                  Width = 60
                  Height = 17
                  Caption = 'Anual '
                  DataField = 'ANUAL'
                  DataSource = dtsAPagar
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  ValueChecked = 'T'
                  ValueUnchecked = 'F'
                end
              end
            end
            object tbsObservacoes: TTabSheet
              Caption = 'Observa'#231#245'es'
              ImageIndex = 3
              DesignSize = (
                971
                367)
              object DBMemo1: TDBMemo
                Left = 12
                Top = 13
                Width = 943
                Height = 341
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataField = 'OBS'
                DataSource = dtsFicha
                TabOrder = 0
              end
            end
          end
          object gbRecebimentos: TGroupBox
            Left = 0
            Top = 404
            Width = 979
            Height = 240
            Align = alBottom
            Caption = 'Recebimentos'
            TabOrder = 2
            DesignSize = (
              979
              240)
            object Label11: TLabel
              Left = 195
              Top = 56
              Width = 48
              Height = 13
              Caption = 'Todo dia'
            end
            object Label18: TLabel
              Left = 5
              Top = 56
              Width = 115
              Height = 13
              Caption = 'N'#250'mero de parcelas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 5
              Top = 22
              Width = 87
              Height = 13
              Caption = 'Conta banc'#225'ria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object dbgParcelasAReceber: TJvDBUltimGrid
              Left = 304
              Top = 58
              Width = 649
              Height = 153
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataSource = dtsParcelas
              ParentColor = True
              TabOrder = 7
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'Verdana'
              TitleFont.Style = []
              OnEditButtonClick = dbgParcelasAReceberEditButtonClick
              OnKeyPress = dbgParcelasAReceberKeyPress
              BevelKind = bkFlat
              BevelOuter = bvNone
              AlternateRowColor = 15920101
              ScrollBars = ssHorizontal
              AutoSizeColumns = True
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <
                item
                  ControlName = 'dbVencimento'
                  FieldName = 'VENCTO'
                  FitCell = fcBiggest
                  LeaveOnEnterKey = True
                  LeaveOnUpDownKey = True
                end
                item
                  ControlName = 'dbceValorParcela'
                  FieldName = 'VALOR'
                  FitCell = fcCellSize
                  LeaveOnEnterKey = True
                end
                item
                  ControlName = 'dbmObsParcela'
                  FieldName = 'OBS'
                  FitCell = fcBiggest
                  LeaveOnEnterKey = True
                end>
              RowsHeight = 17
              TitleRowHeight = 17
              Columns = <
                item
                  Expanded = False
                  FieldName = 'DOCUMENTO'
                  Width = 11
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VENCTO'
                  Width = 11
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR'
                  Width = 11
                  Visible = True
                end
                item
                  ButtonStyle = cbsEllipsis
                  Expanded = False
                  FieldName = 'NOMECONTA'
                  Width = 11
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PAGTO'
                  ReadOnly = True
                  Width = 11
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBS'
                  Width = 570
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_CHEQUE'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'CHEQUE'
                  Visible = False
                end>
            end
            object btnAdicionaParcela: TTcGDIButton
              Left = 955
              Top = 76
              Width = 21
              Height = 21
              Hint = 'Nova parcela'
              Anchors = [akTop, akRight]
              Caption = 'Adiciona parcela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentFont = False
              Picture.Data = {
                424D360300000000000036000000280000001000000010000000010018000000
                000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFF3535351A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
                1A1A1A1A1A1A1A1A1A1A1A1A1A353535FFFFFFFFFFFFFFFFFFFFFFFF1C1C1CFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1A
                FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFF0000000000000000000000
                00000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7F000000FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFF1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF0000000000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3535351A
                1A1A1A1A1A0000001A1A1A1A1A1A1A1A1A1A1A1A000000FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              ShowCaption = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 8
              OnClick = btnAdicionaParcelaClick
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
            object btnRemoveParcela: TTcGDIButton
              Left = 955
              Top = 97
              Width = 21
              Height = 21
              Hint = 'Remover parcela'
              Anchors = [akTop, akRight]
              Caption = 'Remove parcela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentFont = False
              Picture.Data = {
                424D360300000000000036000000280000001000000010000000010018000000
                000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                00000000000000000000FFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF000000FFFFFF
                FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                FF7F7F7FFFFFFFFFFFFF000000FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF000000FFFFFF
                FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                FF7F7F7FFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F00
                0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF0000007F7F7F
                FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                FF7F7F7FFFFFFFFFFFFF000000000000FFFFFFFCFDFDFFFFFF000000000000FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                000000FFFFFFFFFFFF7F7F7F0000000000000000000000000000000000000000
                000000000000000000000000000000007F7F7FFFFFFFFFFFFFFFFFFF000000FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
                00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              ShowCaption = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
              OnClick = btnRemoveParcelaClick
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
            object edtDia: TDBEdit
              Left = 257
              Top = 54
              Width = 32
              Height = 21
              DataField = 'DIA_VENCTO'
              DataSource = dtsAReceber
              MaxLength = 2
              TabOrder = 2
            end
            object dbVencimento: TTcDBDateEdit
              Left = 499
              Top = 90
              Width = 119
              Height = 21
              Checked = False
              DataField = 'VENCTO'
              DataSource = dtsParcelas
              CheckOnExit = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
              Visible = False
            end
            object dbmObsParcela: TDBMemo
              Left = 603
              Top = 118
              Width = 390
              Height = 56
              DataField = 'OBS'
              DataSource = dtsParcelas
              TabOrder = 13
              Visible = False
            end
            object edtParcelas: TDBEdit
              Left = 129
              Top = 54
              Width = 30
              Height = 21
              DataField = 'NUM_PARCELAS'
              DataSource = dtsAReceber
              MaxLength = 3
              TabOrder = 1
            end
            object pnlTotalAReceber: TPanel
              Left = 2
              Top = 218
              Width = 975
              Height = 20
              Align = alBottom
              BevelOuter = bvNone
              Caption = ' '
              Color = clWhite
              ParentBackground = False
              TabOrder = 10
              DesignSize = (
                975
                20)
              object Label28: TLabel
                Left = 769
                Top = 1
                Width = 79
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Total parcelas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ExplicitLeft = 766
              end
              object DBText1: TDBText
                Left = 861
                Top = 1
                Width = 90
                Height = 17
                Alignment = taRightJustify
                Anchors = [akTop, akRight]
                DataField = 'SomaValor'
                DataSource = dtsParcelas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitLeft = 858
              end
            end
            object GroupBox1: TGroupBox
              Left = 304
              Top = 15
              Width = 646
              Height = 39
              TabOrder = 6
              object Label15: TLabel
                Left = 419
                Top = 12
                Width = 57
                Height = 13
                Caption = 'Cheque : '
              end
              object DBCheckBox1: TJvDBCheckBox
                Left = 17
                Top = 10
                Width = 172
                Height = 17
                Caption = 'Recebimento '#224' vista '
                DataField = 'PAGTO_AVISTA'
                DataSource = dtsAReceber
                TabOrder = 0
                ValueChecked = 'T'
                ValueUnchecked = 'F'
                OnChange = DBCheckBox1Change
              end
              object edtCheque: TDBEdit
                Left = 482
                Top = 8
                Width = 135
                Height = 21
                DataField = 'NUM_CHEQUE'
                DataSource = dtsParcelas
                TabOrder = 2
              end
              object dbcheckComCheque: TJvDBCheckBox
                Left = 235
                Top = 10
                Width = 97
                Height = 17
                Caption = 'Com cheque '
                DataField = 'CHEQUE'
                DataSource = dtsParcelas
                TabOrder = 1
                ValueChecked = 'T'
                ValueUnchecked = 'F'
              end
            end
            object btbProgramar: TTcGDIButton
              Left = 188
              Top = 121
              Width = 104
              Height = 21
              Caption = 'Programar...'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              Picture.Data = {
                424D360300000000000036000000280000001000000010000000010018000000
                000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                FFFFF5F5F55F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D52A2A2A000000FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F0A
                0A0A0000000000000000000000000000000C0C0C3737379A9A9AFEFEFEFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFF9F9F9F0A0A0A0000000000000000000000000000
                00000000000000000000434343E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5
                D5D52A2A2A000000FFFFFFFFFFFFFFFFFFE6E6E6A6A6A61C1C1C000000434343
                FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F55F5F5FFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFEDEDED1C1C1C0000009A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6A6A6000000
                373737FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFE6E6E60000000C0C0CFFFFFFFFFFFF0C0C0C000000E6
                E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF373737000000A6A6A6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A0000001C
                1C1CEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060F5F5F5FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFEFEFE4343430000001C1C1CA6A6A6E6E6E6FFFFFFFFFF
                FFFFFFFF0000002A2A2AD5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E743
                43430000000000000000000000000000000000000000000000000A0A0AA0A0A0
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE9A9A9A3737370D0D0D0000000000
                000000000000000000000A0A0AA0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000002A2A2AD5D5D5FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              TabOrder = 5
              OnClick = btbProgramarClick
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
            object dbContaBancaria: TTcDBComboEdit
              Left = 129
              Top = 18
              Width = 160
              Height = 21
              Checked = False
              DataField = 'NOMECONTA'
              DataSource = dtsAReceber
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ImageKind = ikEllipsis
              ButtonWidth = 15
              ParentFont = False
              TabOrder = 0
              OnButtonClick = dbContaBancariaButtonClick
            end
            object dbceValorParcela: TJvDBCalcEdit
              Left = 637
              Top = 91
              Width = 121
              Height = 21
              ShowButton = False
              TabOrder = 12
              Visible = False
              DecimalPlacesAlwaysShown = False
              DataField = 'VALOR'
              DataSource = dtsParcelas
            end
            object cbProximoMes: TDBCheckBox
              Left = 7
              Top = 90
              Width = 160
              Height = 17
              Caption = 'A partir do pr'#243'ximo m'#234's '
              DataField = 'PROXIMO_MES'
              DataSource = dtsAReceber
              TabOrder = 3
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            object cbAnual: TJvDBCheckBox
              Left = 7
              Top = 121
              Width = 60
              Height = 17
              Caption = 'Anual '
              DataField = 'ANUAL'
              DataSource = dtsAReceber
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
          end
        end
        object pnInfoNota: TGroupBox
          Left = 0
          Top = 0
          Width = 979
          Height = 74
          Align = alTop
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object Label1: TLabel
            Left = 7
            Top = 13
            Width = 59
            Height = 13
            Caption = 'Nota fiscal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 227
            Top = 42
            Width = 30
            Height = 13
            Caption = 'S'#233'rie'
            FocusControl = dbSerie
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 329
            Top = 41
            Width = 78
            Height = 13
            Caption = 'Data emiss'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 191
            Top = 11
            Width = 66
            Height = 13
            Caption = 'Data Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 793
            Top = 10
            Width = 80
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Total da nota'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 531
            Top = 104
            Width = 36
            Height = 13
            Caption = 'Status'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label9: TLabel
            Left = 815
            Top = 77
            Width = 53
            Height = 13
            Caption = 'Impostos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label13: TLabel
            Left = 614
            Top = 36
            Width = 59
            Height = 13
            Caption = 'Descontos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label14: TLabel
            Left = 656
            Top = 41
            Width = 29
            Height = 13
            Caption = 'Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label23: TLabel
            Left = 798
            Top = 41
            Width = 75
            Height = 13
            Caption = 'Data entrada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object dbTotalNota: TDBText
            Left = 881
            Top = 10
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Color = clBtnHighlight
            DataField = 'TOTAL_NOTA'
            DataSource = dtsFicha
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label12: TLabel
            Left = 409
            Top = 10
            Width = 40
            Height = 13
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 10
            Top = 77
            Width = 62
            Height = 13
            Caption = 'Chave NFe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Image1: TImage
            Left = 755
            Top = 13
            Width = 16
            Height = 16
            Cursor = crHelp
            ParentShowHint = False
            ShowHint = True
          end
          object lblAviso: TLabel
            Left = 478
            Top = 101
            Width = 340
            Height = 43
            AutoSize = False
            Caption = '1 Aviso'#13#10'2 Aviso'#13#10'3 Aviso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'DINPro-Regular'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            Visible = False
            WordWrap = True
            StyleElements = [seClient, seBorder]
          end
          object Label26: TLabel
            Left = 524
            Top = 45
            Width = 56
            Height = 13
            Caption = 'Dedu'#231#245'es'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object GroupBox3: TGroupBox
            Left = 849
            Top = 121
            Width = 290
            Height = 43
            Caption = ' Cliente  '
            TabOrder = 19
            Visible = False
            object DBMemo3: TDBMemo
              Left = -3
              Top = 34
              Width = 280
              Height = 45
              TabStop = False
              BorderStyle = bsNone
              Color = clBtnFace
              DataField = 'DADOSENTIDADE'
              DataSource = dtsDadosEntidade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object dbSerie: TDBEdit
            Left = 279
            Top = 42
            Width = 36
            Height = 21
            DataField = 'SERIE'
            DataSource = dtsFicha
            ParentColor = True
            TabOrder = 7
          end
          object dbDataVenda: TTcDBDateEdit
            Left = 279
            Top = 11
            Width = 90
            Height = 21
            Checked = False
            DataField = 'DATA_VENDA'
            DataSource = dtsFicha
            CheckOnExit = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ButtonWidth = 19
            ParentFont = False
            TabOrder = 2
            DisabledTextColor = clWhite
          end
          object dbDataEmissao: TTcDBDateEdit
            Left = 421
            Top = 42
            Width = 90
            Height = 21
            Checked = False
            DataField = 'DATA_EMISSAO'
            DataSource = dtsFicha
            CheckOnExit = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ButtonWidth = 19
            ParentFont = False
            TabOrder = 8
          end
          object dbcbStatus: TJvDBComboBox
            Left = 583
            Top = 101
            Width = 90
            Height = 21
            DataField = 'ATIVO'
            DataSource = dtsFicha
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Items.Strings = (
              'Ativo'
              'Inativo')
            ParentFont = False
            TabOrder = 14
            TabStop = False
            Values.Strings = (
              'T'
              'F')
            Visible = False
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Verdana'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object dbDataEntrada: TTcDBDateEdit
            Left = 881
            Top = 42
            Width = 90
            Height = 21
            Checked = False
            DataSource = dtsFicha
            CheckOnExit = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ButtonWidth = 19
            ParentFont = False
            TabOrder = 15
            Visible = False
          end
          object dbImpostos: TJvDBCalcEdit
            Left = 904
            Top = 74
            Width = 96
            Height = 21
            DecimalPlaces = 7
            DisplayFormat = ',0.#######'
            ShowButton = False
            TabOrder = 17
            Visible = False
            DecimalPlacesAlwaysShown = False
            DataField = 'IMPOSTOS'
            DataSource = dtsFicha
          end
          object dbDescontos: TJvDBCalcEdit
            Left = 619
            Top = 49
            Width = 63
            Height = 21
            DecimalPlaces = 7
            DisplayFormat = ',0.00#####'
            ShowButton = False
            TabOrder = 10
            Visible = False
            ZeroEmpty = False
            DecimalPlacesAlwaysShown = False
            DataField = 'DESCONTOS'
            DataSource = dtsFicha
          end
          object dbFrete: TJvDBCalcEdit
            Left = 696
            Top = 42
            Width = 63
            Height = 21
            DecimalPlaces = 7
            DisplayFormat = ',0.00#####'
            ShowButton = False
            TabOrder = 12
            Visible = False
            ZeroEmpty = False
            DecimalPlacesAlwaysShown = False
            DataField = 'FRETE'
            DataSource = dtsFicha
          end
          object btnAnexos: TTcGDIButton
            Left = 136
            Top = 42
            Width = 71
            Height = 21
            Caption = 'Anexos'
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            Picture.Data = {
              424D360300000000000036000000280000001000000010000000010018000000
              00000003000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000C3C3C3FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C3C3C3FFFFFFFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C3C3C3FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000C3
              C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              000000FFFFFFFFFFFF000000C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3
              000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFC3C3C3000000FFFFFFFFFFFFFFFFFF000000FFFFFFFF
              FFFF0C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3000000FFFFFF
              FFFFFFFFFFFFFFFFFF000000FFFFFFC3C3C30000000C0C0CFFFFFFFFFFFFFFFF
              FFFFFFFFC3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
              FFFFC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFC3C3C3000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF000000C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3
              C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C300000000
              0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            TabOrder = 6
            OnClick = btnAnexosClick
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
            Enabled = False
          end
          object dbNotaFiscal: TDBEdit
            Left = 85
            Top = 11
            Width = 89
            Height = 21
            DataField = 'NOTA_FISCAL'
            DataSource = dtsFicha
            TabOrder = 1
          end
          object btnRatearDesconto: TTcGDIButton
            Tag = 1
            Left = 671
            Top = 40
            Width = 21
            Height = 21
            Hint = 'ratear descontos nos itens'
            Caption = 'descontos'
            ImageIndex = 3
            Images = ImageList1
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ShowCaption = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            Visible = False
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
          object btnRatearFrete: TTcGDIButton
            Tag = 1
            Left = 765
            Top = 40
            Width = 21
            Height = 21
            Hint = 'ratear frete nos '#237'tens'
            Caption = 'ratear frete'
            ImageIndex = 3
            Images = ImageList1
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ShowCaption = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
            Visible = False
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
          object btnRatearImposto: TTcGDIButton
            Tag = 1
            Left = 1014
            Top = 74
            Width = 21
            Height = 21
            Hint = 'ratear impostos nos itens'
            Caption = 'ratear impostos'
            ImageIndex = 3
            Images = ImageList1
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ShowCaption = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 18
            Visible = False
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
          object edEntidade: TTcDBComboEdit
            Left = 486
            Top = 10
            Width = 263
            Height = 21
            Checked = False
            DataField = 'NOMEENTIDADE'
            DataSource = dtsFicha
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ImageKind = ikEllipsis
            ButtonWidth = 15
            ParentFont = False
            TabOrder = 3
            OnButtonClick = edEntidadeButtonClick
            OnChange = edEntidadeChange
          end
          object dbChaveNFe: TDBEdit
            Left = 85
            Top = 74
            Width = 387
            Height = 21
            DataField = 'CHAVENFE'
            DataSource = dtsFicha
            TabOrder = 16
            Visible = False
          end
          object btnImportarNFe: TTcGDIButton
            Left = 3
            Top = 11
            Width = 62
            Height = 21
            Action = actImportarNFe
            Caption = 'NFe'
            Images = ImageList1
            DisabledImages = ImageList1
            HotImages = ImageList1
            ImageListType = ipOwnLists
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            Picture.Data = {
              424D360300000000000036000000280000001000000010000000010018000000
              00000003000000000000000000000000000000000000EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD9
              99EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD9
              99060B0AEAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999EAD999EAD999060B0A222323EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999060B0A060B0A060B0A060B0A060B0A060B0A060B
              0A060B0A000201000000EAD999EAD999EAD999EAD999EAD999EAD999060B0A06
              0B0A000000000000000000060B0A060B0A060B0A040B08060B0A000000EAD999
              EAD999EAD999EAD999EAD999060B0A060B0A000000000000000000060B0A060B
              0A060B0A070B0A000504000000060B0AEAD999EAD999EAD999EAD999060B0A06
              0B0A000000000000000000060B0A060B0A060B0A070B0A000504000000EAD999
              EAD999EAD999EAD999EAD999060B0A060B0A060B0A060B0A060B0A060B0A060B
              0A060B0A000000000302EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999EAD999EAD999060B0A060B0AEAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD9
              99060B0AEAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD9
              99EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD9
              99EAD999EAD999EAD999EAD999EAD999EAD999EAD999}
            TabOrder = 0
            Visible = False
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
          object btnVisualziarDANFe: TTcGDIButton
            Left = 3
            Top = 42
            Width = 62
            Height = 21
            Action = actVisualizarDANFe
            Caption = 'DANFe'
            Images = ImageList1
            DisabledImages = ImageList1
            HotImages = ImageList1
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            Picture.Data = {
              424D360300000000000036000000280000001000000010000000010018000000
              00000003000000000000000000000000000000000000EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD9
              99EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999000000EA
              D999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999
              EAD999EAD999EAD9997F7F7F7F7F7F000000EAD999EAD999EAD999EAD999EAD9
              99EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD9997F7F7FFF
              FFFF000000EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD9997F7F7FFFFFFF000000EAD999EAD999EAD9
              99EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D9997F7F7FFFFFFF000000EAD999EAD999000000000000000000EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD9997F7F7FFFFFFF0000000000
              00FFFFFFFFFFFFFFFFFF000000C3C3C3EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999EAD9997F7F7F000000FFFFFF7F7F7F7F7F7F7F7F7FFFFFFF000000
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999000000FFFFFF7F7F
              7FEAD999EAD999EAD999C3C3C3FFFFFF000000EAD999EAD999EAD999EAD999EA
              D999EAD999EAD999000000FFFFFF7F7F7FEAD999EAD999EAD999C3C3C3FFFFFF
              000000EAD999EAD999EAD999EAD999EAD999EAD999EAD999000000FFFFFF7F7F
              7FEAD999EAD999EAD999C3C3C3FFFFFF000000EAD999EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999000000FFFFFFC3C3C3C3C3C3C3C3C3FFFFFF000000
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999C3C3C30000
              00FFFFFFFFFFFFFFFFFF000000C3C3C3EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999EAD999EAD999000000000000000000EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD9
              99EAD999EAD999EAD999EAD999EAD999EAD999EAD999}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
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
          object btnSavarXML: TTcGDIButton
            Left = 70
            Top = 42
            Width = 61
            Height = 21
            Action = actSalvarXMLNFe
            Caption = 'XML...'
            Images = ImageList1
            DisabledImages = ImageList1
            HotImages = ImageList1
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            Picture.Data = {
              424D360300000000000036000000280000001000000010000000010018000000
              00000003000000000000000000000000000000000000EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD9990000000000000000000000000000000000
              00000000000000000000EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD9990000000000000000
              00EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999000000060B0A000504000504000302EAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999222323000201040B08070B0A070B
              0A000000060B0AEAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD99906
              0B0A060B0A060B0A060B0A060B0A060B0A060B0A060B0A060B0AEAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999060B0A060B0A060B0A060B
              0A060B0AEAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999060B0A060B0A060B0A060B0A060B0AEAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999060B0A0000000000000000
              00060B0AEAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999060B0A000000000000000000060B0AEAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999060B0A0000000000000000
              00060B0AEAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999060B0A060B0A060B0A060B0A060B0AEAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999060B0A060B0A060B0A060B
              0A060B0AEAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EA
              D999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999
              EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD999EAD9
              99EAD999EAD999EAD999EAD999EAD999EAD999EAD999}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
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
          object dbDeducoes: TJvDBCalcEdit
            Left = 591
            Top = 42
            Width = 63
            Height = 21
            DecimalPlaces = 7
            DisplayFormat = ',0.00#####'
            ShowButton = False
            TabOrder = 9
            DecimalPlacesAlwaysShown = False
            DataField = 'VALOR_DEDUCOES'
            DataSource = dtsFicha
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 746
    Width = 987
    ExplicitTop = 746
    ExplicitWidth = 987
    inherited _imageBottom: TImage
      Width = 987
      ExplicitWidth = 1081
    end
    inherited _ToolBar: TToolBar
      Left = 138
      ExplicitLeft = 138
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 104
    Top = 94
    object actPrintPedidoFolhaTimbrado: TAction
      Category = 'Print'
      Caption = 'Pedido (Folha Timbrada)'
      OnExecute = actPrintPedidoFolhaTimbradoExecute
    end
    object actCopiarPedido: TAction
      Category = 'Other'
      Caption = 'Copia Pedido'
      OnExecute = actCopiarPedidoExecute
    end
    object actCancelarManual: TAction
      Category = 'Other'
      Caption = 'Cancelar Manual'
    end
    object actImportarOrcamento: TAction
      Category = 'Other'
      Caption = 'Importar Orcamento'
      OnExecute = actImportarOrcamentoExecute
    end
    object actPrintPedidoPapelBranco: TAction
      Category = 'Print'
      Caption = 'Pedido (Folha Branca)'
      OnExecute = actPrintPedidoPapelBrancoExecute
    end
    object actPrintPedidoEmail: TAction
      Category = 'Print'
      Caption = 'Pedido (Email)'
      OnExecute = actPrintPedidoEmailExecute
    end
    object actPrintPedidoMatricial: TAction
      Category = 'Print'
      Caption = 'Imprimir Pedido (Matricial)'
      OnExecute = actPrintPedidoMatricialExecute
    end
    object actPrintTermoGarantia: TAction
      Category = 'Print'
      Caption = 'Termo de Garantia'
    end
    object actPrintFichaEntrega: TAction
      Category = 'Print'
      Caption = 'Ficha de Entrega'
    end
    object actPrintFichaChecagem: TAction
      Category = 'Print'
      Caption = 'Ficha de Checagem'
    end
    object actPrintFichaMontagem: TAction
      Category = 'Print'
      Caption = 'Ficha de Montagem'
    end
    object actPrintRecibo: TAction
      Category = 'Print'
      Caption = 'Recibo'
      OnExecute = actPrintReciboExecute
    end
    object actPrintComprasCentroCusto: TAction
      Category = 'Print'
      Caption = 'Por centro de custo'
    end
    object actPrintPedidoPorPeriodo: TAction
      Category = 'Print'
      Caption = 'Por Per'#237'odo'
    end
    object actImportarNFe: TAction
      Category = 'Other'
      Caption = 'Importar NFe'
      OnExecute = actImportarNFeExecute
      OnUpdate = actImportarNFeUpdate
    end
    object actVisualizarDANFe: TAction
      Category = 'Other'
      Caption = 'Visualizar DANFe'
      OnExecute = actVisualizarDANFeExecute
      OnUpdate = actVisualizarDANFeUpdate
    end
    object actAddItemProduto: TAction
      Category = 'Other'
      Caption = 'Adicionar item'
      OnExecute = actAddItemProdutoExecute
      OnUpdate = actAddItemProdutoUpdate
    end
    object actRemoveItemProduto: TAction
      Category = 'Other'
      Caption = 'Remover item'
      OnExecute = actRemoveItemProdutoExecute
      OnUpdate = actRemoveItemProdutoUpdate
    end
    object actAddItemServico: TAction
      Category = 'Other'
      Caption = 'Adicionar servi'#231'o'
      OnExecute = actAddItemServicoExecute
      OnUpdate = actAddItemServicoUpdate
    end
    object actRemoveItemServico: TAction
      Category = 'Other'
      Caption = 'Remover servi'#231'o'
      OnExecute = actRemoveItemServicoExecute
      OnUpdate = actRemoveItemServicoUpdate
    end
    object Action1: TAction
      Category = 'Edit'
      Caption = 'Action1'
      ShortCut = 120
    end
    object actSalvarXMLNFe: TAction
      Category = 'Other'
      Caption = 'Salvar XML ...'
      OnExecute = actSalvarXMLNFeExecute
      OnUpdate = actSalvarXMLNFeUpdate
    end
    object actAddPatrimonio: TAction
      Category = 'Other'
      Caption = 'Adicionar patrom'#244'nio'
      OnExecute = actAddPatrimonioExecute
      OnUpdate = actAddPatrimonioUpdate
    end
    object actRemovePatrimonio: TAction
      Category = 'Other'
      Caption = 'Remover patri'#244'nio'
      OnExecute = actRemovePatrimonioExecute
      OnUpdate = actRemovePatrimonioUpdate
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = dtmVENDAS_Pedido.cdsPedido
    OnDataChange = dtsFichaDataChange
  end
  object ImageList1: TImageList
    Left = 440
    Top = 90
    Bitmap = {
      494C01010700F802700210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000060B0A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060B0A00000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060B0A00222323000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000060B0A00000504000005040000030200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060B0A00060B
      0A00060B0A00060B0A00060B0A00060B0A00060B0A00060B0A00000201000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002223230000020100040B0800070B0A00070B0A0000000000060B0A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060B0A00060B
      0A00000000000000000000000000060B0A00060B0A00060B0A00040B0800060B
      0A00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000060B
      0A00060B0A00060B0A00060B0A00060B0A00060B0A00060B0A00060B0A00060B
      0A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060B0A00060B
      0A00000000000000000000000000060B0A00060B0A00060B0A00070B0A000005
      040000000000060B0A0000000000000000000000000000000000000000000000
      0000000000007F7F7F00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000C3C3C30000000000000000000000000000000000000000000000
      000000000000060B0A00060B0A00060B0A00060B0A00060B0A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060B0A00060B
      0A00000000000000000000000000060B0A00060B0A00060B0A00070B0A000005
      0400000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000FFFFFF007F7F7F007F7F7F007F7F
      7F00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000060B0A00060B0A00060B0A00060B0A00060B0A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060B0A00060B
      0A00060B0A00060B0A00060B0A00060B0A00060B0A00060B0A00000000000003
      0200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF007F7F7F0000000000000000000000
      0000C3C3C300FFFFFF0000000000000000000000000000000000000000000000
      000000000000060B0A00000000000000000000000000060B0A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060B0A00060B0A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF007F7F7F0000000000000000000000
      0000C3C3C300FFFFFF0000000000000000000000000000000000000000000000
      000000000000060B0A00000000000000000000000000060B0A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060B0A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF007F7F7F0000000000000000000000
      0000C3C3C300FFFFFF0000000000000000000000000000000000000000000000
      000000000000060B0A00000000000000000000000000060B0A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C3C3C300C3C3C300C3C3
      C300FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000060B0A00060B0A00060B0A00060B0A00060B0A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3C3C30000000000FFFFFF00FFFFFF00FFFF
      FF0000000000C3C3C30000000000000000000000000000000000000000000000
      000000000000060B0A00060B0A00060B0A00060B0A00060B0A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFCFCFCFFFEFEFDFFFCFDFBFFFBFCFCFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFCFDFCFFFFFFFBFFDFE6EFFFE3E7F3FFE2E7F3FFE5E7F5FFE2E6F2FFFBFE
      FDFFFFFFFBFFFAFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFDFFFFFF
      FBFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFBFEFAFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFEFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF5A79D0FF0008B7FF0013B5FF0013B6FF0011B7FF000FB3FF0126
      BAFFF5FCF9FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAFF7FB7
      EAFF60ABE9FF63ADEAFF63ACE9FF63ADE9FF62ADEAFF63ACE9FF63ACE9FF5CAD
      E9FF5EABE4FFA7D5EBFFFFFFF9FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFFCFE
      FDFFFFFFFFFFE4EFE9FF006244FFCEE4DBFFFFFFFFFFFCFEFDFFFFFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFBFDFFFFFF
      FFFF5E76CBFF0013BBFF0022BAFF0328C3FF092DBDFF072CC4FF0026BFFF001E
      B5FF0928BEFFF3F4FAFFFFFFFDFFFFFDFEFFFFFFFFFFFFFFFFFF248CE3FF007D
      F7FF007FF5FF007FF5FF0080F5FF0082FFFF0084FFFF0082FEFF0083F5FF007E
      F3FF0082F5FF0070EFFFA9D2E7FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFDFFFFFF
      FFFFE4ECEBFF036B41FF036F44FF016440FFD0E3DEFFFFFFFFFFFAFBFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFF5D78
      CDFF001DBFFF3555CBFF8CA5DDFF002CBFFF0831C6FF0025BBFF4D71CEFF808F
      DEFF0022C1FF0834B9FFF0F2F8FFFBFEFEFFFFFFFFFFFFFFFFFF0079E4FF048C
      F3FF088BF5FF088BF4FF078EFFFF1867A7FF402211FF1174BEFF0B8DFCFF0A8B
      F5FF068CF5FF0088F6FF60ACE7FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFE9EF
      EFFF006E43FF127A53FF157B59FF177C55FF026946FFCCE7DEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFF8C97DAFF0026
      C3FF002AC5FFFFFFFBFFFFFFFEFFD5DFF1FF0020C0FF6480DBFFFFFFFFFFFFFF
      FEFF4B6ED1FF002FCCFF0E38BAFFFFFFFDFFFFFFFFFFFFFFFFFF58B2EAFF0190
      FAFF0F90F4FF0F90F5FF0E94F7FF147FCCFF274657FF1984DCFF0B94FBFF1190
      F5FF0D91F5FF0087F0FFD1E8F3FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFDFDFDFFD9EAE6FF0972
      49FF1F855FFF1F8660FF20855FFF218761FF20865EFF026E4AFFCFE5DDFFFFFF
      FFFFFBF9F8FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A85D7FF043E
      CEFF043BCDFF7898E0FFFFFFFDFFFFFFFFFFDDE8F3FFFFFFFEFFFFFFF6FFEBF0
      F7FF063FCEFF1045CEFF0028C6FFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F5FF008F
      ECFF149AF7FF159AF6FF149AF5FF1599FBFF1A6692FF139EFFFF0F97F6FF1198
      F3FF0B97F8FF41A9E9FFFFFFFAFFFFFFFFFF00000000DBFFFF0090669000FFFF
      DB00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFD6E7E4FF127C55FF2A90
      67FF298E68FF298F69FF228C64FF2A906AFF2D8D67FF2A9168FF187654FFC8E1
      DAFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6C8AD7FF0B48
      D6FF1854CEFF003FD1FF7D9DE5FFFFFFFBFFFFFEFAFFFEFFFCFFD0E1F4FF0F47
      D2FF0E4ED7FF1356D0FF0034C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFF7CBF
      E7FF0C9FF9FF16A0F4FF21A1FEFF1884CAFF421701FF1498E7FF1BA4F8FF1DA1
      F5FF0798F1FFE4F0F5FFFFFEFBFFFFFFFFFF00000000DBFFFF0090669000FFFF
      DB00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF7BB19FFF1F9366FF3399
      73FF399874FF1B9065FF9CC8B5FF1E8A62FF399D70FF339A6FFF31986FFF1F80
      5EFFD0E0DBFFFFFFFFFFFBFFFEFFFBFDFDFFFFFFFFFFFFFFFFFF6F8EDAFF0C54
      D8FF1C59E0FF054FD4FF5A8EDEFFFFFFF9FFFFFDFEFFFFFFFAFFCED9EEFF0049
      D8FF195BD9FF195ADFFF043DC5FFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFDFFFFFC
      FBFF1B9EF0FF1DAAF4FF24ADFFFF297EB3FF351F0DFF2B94D8FF24AAFBFF15AA
      F8FF68B8EBFFFFFFFBFFF9FEFEFFFFFFFFFF0000660000000000000000000000
      0000FFB666000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFEFEFEFF7DAF9AFF2BA1
      6DFF27986CFFBAD5CBFFFFFFFFFFD5E3DFFF23936BFF3EA77FFF44A57AFF35A9
      7AFF1E885CFFCEDFDCFFFFFFFFFFFEFBFEFFFFFFFFFFFFFFFFFF6F8FD9FF1461
      DFFF115FDFFF7099E9FFFFFFFCFFFCFFFCFFF1F5FBFFFFFFFEFFFFFFFCFFE0EC
      F2FF105CDEFF1A6ADCFF0343CAFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFEFFFFFF
      FFFF8FC9E6FF1DAFFBFF2BB6FFFF2B7BABFF321E0FFF2989C2FF2AB6FDFF0FA2
      EEFFFEF8F8FFFCFEFAFFFFFFFFFFFFFFFFFFDB906600DBFFFF0090669000DBFF
      DB003A3A9000FFDB900000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFBFCFFFFFFFFFFFF8CBB
      ABFFBCD8D0FFFFFFFFFFFBFDFCFFFFFFFFFFD1E1D6FF2D9B74FF4FB187FF4DAD
      86FF4DB183FF28926AFFC3DDD0FFFFFFFFFFFFFFFFFFFFFFFFFF7595DCFF166C
      EDFF0F65D9FFFDFFFBFFFFFFFCFFE6F0FBFF0C62D9FF85B6EDFFFFFFFDFFFFFF
      FFFF5B97E4FF176EE8FF0851D2FFFFFFFEFFFFFFFFFFFFFFFFFFFEFEFEFFFEFE
      FEFFFFFFFBFF22A7E2FF2FC1FFFF327498FF342010FF3284B2FF23C5FFFF8EC5
      E6FFFFFFFFFFF8FEFBFFFFFFFFFFFFFFFFFF00000000DBFFFF0090669000B6FF
      DB003A006600FFDB900000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1E2DAFF31A272FF5BB9
      8DFF50B48FFF52BD8DFF3F9472FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFCFF3670
      D9FF1377EEFF5A9AEBFFB6D3F3FF2377E4FF1F75EBFF0C6DE8FF7AADEEFFA4CC
      F4FF1D72E3FF1465E6FFC7CDEFFFFFFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FEFFFFFFFEFFACD5EAFF28C4FEFF358FABFF2A0A01FF389CC9FF25AFF1FFFFFF
      FDFFFFFFFAFFFCFDFFFFFFFFFFFFFFFFFFFF90DBFF0000003A00000000000000
      0000FFB666000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFFFFFFFFFFC3DFD4FF41A6
      81FF61C893FF40A47DFFF0F5F3FFFFFEFEFFFFFFFFFFFFFFFFFFF9FEF9FFFFFF
      FBFF4575D9FF1A80F1FF1576E9FF287EE7FF2B80EDFF2A80EAFF237CE8FF1177
      EEFF196DECFFCBD1E8FFFFFFFAFFF7FDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
      FDFFFBFBFCFFFFFFFCFF3CB5E4FF3ACBFFFF49D7FFFF25C8FEFFA7D4E4FFFFFF
      FDFFFCFDFDFFFFFDFFFFFFFFFFFFFFFFFFFF3A006600DBDB900090669000FFFF
      DB00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFFFFFFFFFFFFFFCADB
      D5FF3FA67CFFF1F0F2FFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFDFFFFFFFF
      FFFFFFFFFBFF3E77DBFF208CF6FF228DF3FF248CF1FF258BF4FF258CF6FF1772
      E6FFC5CFE8FFFFFFFDFFFFFEFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
      FEFFFEFEFFFFFFFFFFFFD1E2EDFF2AC5ECFF36D9FCFF49BCDFFFFFFEFCFFFEFF
      FFFFFFFEFEFFFFFFFEFFFFFFFFFFFFFFFFFF66006600DBFFB60090669000FFFF
      DB00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFEFFFFFDFFFFFFFF
      FFFFFEFFFFFFFEFEFEFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF8FFFCFAF7FFA4B7DEFFA8BAE6FFA8BBE6FFA8B8E6FFA2B4E3FFD3DC
      F1FFFFFFF9FFFAFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFAFFD8E8EEFFA1D0E6FFFFFAFDFFFBFBF7FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66B6FF0000000000000000000000
      000066000000FFFFB60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFFFCFEFEFFFEFF
      FCFFFDFEFEFFFEFDFDFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFBFDFDFFFFFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
      FFFFFBFDFDFFFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFCFDFFFFFEFFFFFFFFFAFFFFFEFDFFFDFCFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000DBFFFF0090669000FFFF
      DB00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFDFFFFEFF0000FFBF8FFFFC7F0000FF9FC7FFF83F0000C00FE3FFF01F0000
      C007F18FE00F0000C003F803F83F0000C007FC03F83F0000C00FFC71F83F0000
      FF9FFC71F83F0000FFBFFC71F83F0000FFFFFE03F83F0000FFFFFE03F83F0000
      FFFFFF8FFFFF0000FFFFFFFFFFFF0000000000000000FF7F000000000000FF41
      000000000000BF7F000000000000DF41000000000000EF7F000000000000F741
      0000000000008B7F0000000000008DFF0000000000000680000000000000037F
      00000000000083BF00000000000007DF0000000000000FEF0000000000000FF7
      00000000000003FB0000000000008FFF00000000000000000000000000000000
      000000000000}
  end
  object dtsItensPedido: TDataSource
    DataSet = dtmVENDAS_Pedido.cdsItensPedido
    OnDataChange = dtsItensPedidoDataChange
    Left = 901
    Top = 183
  end
  object dtsPatrimoniosPedido: TDataSource
    DataSet = dtmVENDAS_Pedido.cdsPatrimoniosPedido
    OnDataChange = dtsPatrimoniosPedidoDataChange
    Left = 896
    Top = 231
  end
  object dtsServicos: TDataSource
    DataSet = dtmVENDAS_Pedido.cdsServicosPedido
    OnDataChange = dtsServicosDataChange
    Left = 940
    Top = 243
  end
  object dtsParcelas: TDataSource
    DataSet = dtmVENDAS_Pedido.cdsParcelas
    Left = 935
    Top = 294
  end
  object dtsDadosEntidade: TDataSource
    DataSet = dtmVENDAS_Pedido.cdsDadosEntidade
    Left = 929
    Top = 347
  end
  object dtsAReceber: TDataSource
    DataSet = dtmVENDAS_Pedido.cdsAReceber
    Left = 928
    Top = 401
  end
  object dtsPagtoTransporte: TDataSource
    Left = 997
    Top = 454
  end
  object dtsParcelasTransporte: TDataSource
    AutoEdit = False
    Left = 994
    Top = 514
  end
  object JvSaveDialog1: TJvSaveDialog
    Ctl3D = False
    DefaultExt = '.xml'
    FileName = 'NFe-.xml'
    Filter = 'Arquivo xlm NFe |*.xml'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Salvar xlm NFe'
    ActiveStyle = asReport
    DefBtnCaption = 'Salvar'
    Height = 0
    Width = 0
    Left = 572
    Top = 91
  end
  object dtsParcelasAPagar: TDataSource
    DataSet = dtmVENDAS_Pedido.cdsParcelasApagar
    Left = 800
    Top = 294
  end
  object dtsAPagar: TDataSource
    DataSet = dtmVENDAS_Pedido.cdsAPagar
    Left = 800
    Top = 401
  end
end
