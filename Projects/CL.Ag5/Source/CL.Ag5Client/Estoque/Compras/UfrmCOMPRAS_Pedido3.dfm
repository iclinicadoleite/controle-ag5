inherited frmCOMPRAS_Pedido: TfrmCOMPRAS_Pedido
  Left = 0
  Top = 0
  Caption = 'Compras - Lan'#231'amentos Completos'
  ClientHeight = 764
  ClientWidth = 984
  ActionList.Left = 104
  ActionList.Top = 94
  ExplicitWidth = 1000
  ExplicitHeight = 803
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Width = 984
    Height = 699
    ActivePage = _tbsFicha
    ExplicitWidth = 984
    ExplicitHeight = 699
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 976
      ExplicitHeight = 671
      inherited _pnlSearch: TPanel
        Width = 976
        Height = 83
        ExplicitWidth = 976
        ExplicitHeight = 83
        inherited _lblPesquisas: TLabel
          Top = 15
          ExplicitTop = 15
        end
        object Label4: TLabel [1]
          Left = 3
          Top = 50
          Width = 63
          Height = 13
          Caption = 'Data inicial'
        end
        object Label5: TLabel [2]
          Left = 254
          Top = 50
          Width = 55
          Height = 13
          Caption = 'Data final'
        end
        inherited _edtSearch: TJvComboEdit
          Left = 84
          Top = 11
          ExplicitLeft = 84
          ExplicitTop = 11
        end
        object cbxInativos: TCheckBox
          Left = 322
          Top = 13
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
          Top = 47
          Width = 121
          Height = 21
          Checked = False
          CheckOnExit = False
          TabOrder = 2
          OnExit = deDtInicialExit
        end
        object deDtFinal: TTcDateEdit
          Left = 320
          Top = 47
          Width = 121
          Height = 21
          Checked = False
          CheckOnExit = False
          TabOrder = 3
          OnExit = deDtFinalExit
        end
      end
      inherited _pnldbgLista: TPanel
        Top = 83
        Width = 976
        Height = 588
        ExplicitTop = 83
        ExplicitWidth = 976
        ExplicitHeight = 588
        inherited _dbgLista: TJvDBUltimGrid
          Width = 972
          Height = 584
          Constraints.MinHeight = 88
          DrawingStyle = gdsThemed
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 671
      inherited _pnlFicha: TPanel
        Width = 976
        Height = 671
        Color = clWhite
        Constraints.MinHeight = 173
        ExplicitWidth = 976
        ExplicitHeight = 671
        inherited _ScrollBoxFicha: TScrollBox
          Top = 74
          Width = 976
          Height = 597
          HorzScrollBar.Visible = False
          VertScrollBar.Increment = 56
          TabStop = True
          ExplicitTop = 74
          ExplicitWidth = 976
          ExplicitHeight = 597
          inherited _pnlScroll: TPanel
            Width = 976
            Height = 9
            Align = alTop
            ExplicitWidth = 976
            ExplicitHeight = 9
          end
          object PageControl1: TPageControl
            Left = 0
            Top = 9
            Width = 976
            Height = 348
            ActivePage = tbsPatrimonios
            Align = alClient
            TabOrder = 1
            object tbsProdutos: TTabSheet
              Caption = 'Produtos'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              DesignSize = (
                968
                320)
              object Label20: TLabel
                Left = 12
                Top = 2
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
              object lblContaContabil: TLabel
                Left = 908
                Top = 2
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
              object lblDesconto: TLabel
                Left = 627
                Top = 2
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
              object lblFrete: TLabel
                Left = 747
                Top = 2
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
              object lblQtdeCompra: TLabel
                Left = 313
                Top = 2
                Width = 65
                Height = 13
                Caption = 'Quantidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblTotalItem: TLabel
                Left = 868
                Top = 2
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
              object lblUnidCompra: TLabel
                Left = 190
                Top = 2
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
              object lblValorUnitario: TLabel
                Left = 431
                Top = 2
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
              object DBCtrlGridItems: TDBCtrlGrid
                Left = 1
                Top = 20
                Width = 968
                Height = 288
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clWhite
                DataSource = dtsItensPedido
                PanelHeight = 48
                PanelWidth = 951
                ParentColor = False
                ParentShowHint = False
                TabOrder = 2
                RowCount = 6
                SelectedColor = 15658734
                ShowFocus = False
                ShowHint = True
                OnPaintPanel = DBCtrlGridItemsPaintPanel
              end
              object pnlTotalItens: TPanel
                Left = 0
                Top = 298
                Width = 968
                Height = 22
                Align = alBottom
                BevelOuter = bvNone
                Caption = ' '
                Color = 15658734
                ParentBackground = False
                TabOrder = 0
                object Label8: TLabel
                  Left = 785
                  Top = 5
                  Width = 84
                  Height = 16
                  AutoSize = False
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
                  Top = 4
                  Width = 90
                  Height = 13
                  Alignment = taRightJustify
                  DataField = 'TOTAL_ITENS'
                  DataSource = dtsFicha
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btnAddProduto: TTcGDIButton
                  Tag = 1
                  Left = 391
                  Top = 0
                  Width = 146
                  Height = 17
                  Caption = 'Cadastrar produtos'
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
              object ItemEditPanel: TPanel
                Left = 1
                Top = 29
                Width = 951
                Height = 72
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                OnResize = ItemEditPanelResize
                DesignSize = (
                  951
                  72)
                object Shape2: TShape
                  Left = 1
                  Top = 1
                  Width = 949
                  Height = 70
                  Align = alClient
                  Brush.Style = bsClear
                  Pen.Color = 16759156
                  Pen.Width = 2
                  ExplicitHeight = 35
                end
                object ItemLayout0: TGridPanel
                  Left = 2
                  Top = 2
                  Width = 917
                  Height = 34
                  Anchors = [akLeft, akTop, akRight]
                  BevelOuter = bvNone
                  Caption = ' '
                  Color = 15658734
                  ColumnCollection = <
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end>
                  ControlCollection = <
                    item
                      Column = 0
                      ColumnSpan = 4
                      Control = edItemCodigo
                      Row = 0
                    end
                    item
                      Column = 4
                      Control = cbxItemUnidadeCompra
                      Row = 0
                    end
                    item
                      Column = 5
                      Control = edItemQtdeCompra
                      Row = 0
                    end
                    item
                      Column = 6
                      Control = edItemValorUnit
                      Row = 0
                    end
                    item
                      Column = 7
                      Control = edItemDesconto
                      Row = 0
                    end
                    item
                      Column = 8
                      Control = edItemFrete
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
                  RowCollection = <
                    item
                      Value = 100.000000000000000000
                    end>
                  TabOrder = 0
                  object edItemCodigo: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 7
                    Top = 7
                    Width = 266
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 0
                    Checked = False
                    DataField = 'CODIGO_NOME'
                    DataSource = dtsItensPedido
                    ImageKind = ikEllipsis
                    ButtonWidth = 17
                    TabOrder = 0
                    OnButtonClick = edItemCodigoButtonClick
                  end
                  object cbxItemUnidadeCompra: TDBEdit
                    AlignWithMargins = True
                    Left = 287
                    Top = 7
                    Width = 56
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 0
                    DataField = 'UNIDADE_COMPRA'
                    DataSource = dtsItensPedido
                    TabOrder = 1
                  end
                  object edItemQtdeCompra: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 357
                    Top = 7
                    Width = 56
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 0
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDE_COMPRA'
                    DataSource = dtsItensPedido
                  end
                  object edItemValorUnit: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 427
                    Top = 7
                    Width = 56
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 0
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    FormatOnEditing = True
                    ShowButton = False
                    TabOrder = 3
                    DecimalPlacesAlwaysShown = False
                    DataField = 'UNITARIO_COMPRA'
                    DataSource = dtsItensPedido
                  end
                  object edItemDesconto: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 497
                    Top = 7
                    Width = 56
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 0
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    FormatOnEditing = True
                    ShowButton = False
                    TabOrder = 4
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'DESCONTO'
                    DataSource = dtsItensPedido
                  end
                  object edItemFrete: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 567
                    Top = 7
                    Width = 56
                    Height = 20
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    FormatOnEditing = True
                    ShowButton = False
                    TabOrder = 5
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'FRETE'
                    DataSource = dtsItensPedido
                  end
                  object edItemTotal: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 637
                    Top = 7
                    Width = 56
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 0
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    FormatOnEditing = True
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 6
                    DecimalPlacesAlwaysShown = False
                    DataField = 'TOTAL'
                    DataSource = dtsItensPedido
                  end
                  object edItemContaContabil: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 707
                    Top = 7
                    Width = 126
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 0
                    Checked = False
                    DataField = 'DESCR_PC_NOME'
                    DataSource = dtsItensPedido
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    TabOrder = 7
                    OnButtonClick = edItemContaContabilButtonClick
                  end
                end
                object btnAdicionaItem: TTcGDIButton
                  Tag = 1
                  AlignWithMargins = True
                  Left = 860
                  Top = 12
                  Width = 21
                  Height = 16
                  Hint = 'Novo item'
                  Margins.Top = 5
                  Action = actAddItemProduto
                  Anchors = [akTop, akRight]
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
                  Left = 886
                  Top = 12
                  Width = 21
                  Height = 16
                  Hint = 'Remover item'
                  Margins.Top = 5
                  Action = actRemoveItemProduto
                  Anchors = [akTop, akRight]
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
                object ItemLayout1: TGridPanel
                  Left = 2
                  Top = 38
                  Width = 917
                  Height = 34
                  Anchors = [akLeft, akTop, akRight]
                  BevelOuter = bvNone
                  Caption = ' '
                  Color = 15658734
                  ColumnCollection = <
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end
                    item
                      Value = 7.692307692307690000
                    end>
                  ControlCollection = <
                    item
                      Column = 9
                      Control = edItemValorIPI
                      Row = 0
                    end
                    item
                      Column = 4
                      Control = cbxItemUnidadeEstoque
                      Row = 0
                    end
                    item
                      Column = 5
                      Control = edItemQtdeEstoque
                      Row = 0
                    end
                    item
                      Column = 6
                      Control = edItemUnitarioEstoque
                      Row = 0
                    end
                    item
                      Column = 2
                      Control = Label32
                      Row = 0
                    end
                    item
                      Column = 8
                      Control = Label29
                      Row = 0
                    end>
                  RowCollection = <
                    item
                      Value = 100.000000000000000000
                    end>
                  TabOrder = 2
                  OnEnter = LayoutEnter
                  DesignSize = (
                    917
                    34)
                  object edItemValorIPI: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 637
                    Top = 7
                    Width = 56
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 0
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    ShowButton = False
                    TabOrder = 3
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'VALOR_IPI'
                    DataSource = dtsItensPedido
                  end
                  object cbxItemUnidadeEstoque: TDBLookupComboBox
                    AlignWithMargins = True
                    Left = 287
                    Top = 7
                    Width = 56
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 0
                    Ctl3D = True
                    DataField = 'DESCR_UNIDADE'
                    DataSource = dtsItensPedido
                    ParentCtl3D = False
                    TabOrder = 0
                    OnKeyDown = dbcbKeyDown
                  end
                  object edItemQtdeEstoque: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 357
                    Top = 7
                    Width = 56
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 0
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    ShowButton = False
                    TabOrder = 1
                    DecimalPlacesAlwaysShown = False
                    DataField = 'QTDE'
                    DataSource = dtsItensPedido
                  end
                  object edItemUnitarioEstoque: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 427
                    Top = 7
                    Width = 56
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 0
                    DecimalPlaces = 7
                    DisplayFormat = ',0.#######'
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    DataField = 'VALOR_UNITARIO'
                    DataSource = dtsItensPedido
                  end
                  object Label32: TLabel
                    AlignWithMargins = True
                    Left = 147
                    Top = 10
                    Width = 45
                    Height = 13
                    Margins.Left = 7
                    Margins.Top = 10
                    Caption = 'Estoque'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label29: TLabel
                    Left = 570
                    Top = 10
                    Width = 50
                    Height = 13
                    Anchors = []
                    Caption = 'Valor IPI'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    ExplicitLeft = 120
                    ExplicitTop = 27
                  end
                end
                object btnExpandItens: TTcGDIButton
                  Tag = 1
                  AlignWithMargins = True
                  Left = 914
                  Top = 12
                  Width = 21
                  Height = 16
                  Hint = 'Expandir itens'
                  Margins.Top = 5
                  Action = actExpandItens
                  Anchors = [akTop, akRight]
                  Caption = '>'
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
              end
            end
            object tbsPatrimonios: TTabSheet
              Caption = 'Patrim'#244'nio'
              ImageIndex = 4
              DesignSize = (
                968
                320)
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
                Width = 65
                Height = 13
                Caption = 'Quantidade'
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
                Left = 1
                Top = 20
                Width = 968
                Height = 295
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clWhite
                DataSource = dtsPatrimoniosPedido
                PanelHeight = 59
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
                Left = 0
                Top = 27
                Width = 951
                Height = 42
                Anchors = [akLeft, akTop, akRight]
                BevelOuter = bvNone
                ShowCaption = False
                TabOrder = 1
                TabStop = True
                OnResize = PatrimonioEditPanelResize
                DesignSize = (
                  951
                  42)
                object Shape1: TShape
                  Left = 0
                  Top = 0
                  Width = 951
                  Height = 42
                  Align = alClient
                  Brush.Style = bsClear
                  Pen.Color = 16759156
                  Pen.Width = 2
                  ExplicitTop = 1
                  ExplicitWidth = 1071
                end
                object PatrimonioLayout0: TGridPanel
                  Left = 2
                  Top = 2
                  Width = 907
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
                  OnEnter = PatrimonioLayout0Enter
                  object edPatrimonioCodigo: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 7
                    Top = 7
                    Width = 286
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    OnEnter = edPatrimonioCodigoEnter
                    Checked = False
                    DataField = 'CODIGO_NOME'
                    DataSource = dtsPatrimoniosPedido
                    ImageKind = ikEllipsis
                    ButtonWidth = 17
                    TabOrder = 0
                    OnButtonClick = edPatrimonioCodigoButtonClick
                  end
                  object cbxPatrimonioUnidadeCompra: TDBComboBox
                    AlignWithMargins = True
                    Left = 307
                    Top = 7
                    Width = 61
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    DataField = 'UNIDADE'
                    DataSource = dtsPatrimoniosPedido
                    TabOrder = 1
                  end
                  object edPatrimonioQtdeCompra: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 382
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
                    DataField = 'QTDE_COMPRA'
                    DataSource = dtsPatrimoniosPedido
                  end
                  object edPatrimonioValorUnit: TJvDBCalcEdit
                    AlignWithMargins = True
                    Left = 457
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
                    DataField = 'UNITARIO_COMPRA'
                    DataSource = dtsPatrimoniosPedido
                  end
                  object edPatrimonioDesconto: TJvDBCalcEdit
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
                    TabOrder = 4
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'DESCONTO'
                    DataSource = dtsPatrimoniosPedido
                  end
                  object edPatrimonioFrete: TJvDBCalcEdit
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
                    TabOrder = 5
                    ZeroEmpty = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'FRETE'
                    DataSource = dtsPatrimoniosPedido
                  end
                  object edPatrimonioTotal: TJvDBCalcEdit
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
                    TabOrder = 6
                    DecimalPlacesAlwaysShown = False
                    DataField = 'TOTAL'
                    DataSource = dtsPatrimoniosPedido
                  end
                  object edPatrimonioContaContabil: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 757
                    Top = 7
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
                    TabOrder = 7
                    OnButtonClick = edPatrimonioContaContabilButtonClick
                  end
                end
                object btnAdicionaPatrimonio: TTcGDIButton
                  Tag = 1
                  AlignWithMargins = True
                  Left = 927
                  Top = 3
                  Width = 21
                  Height = 16
                  Hint = 'Novo item'
                  Margins.Top = 5
                  Action = actAddPatrimonio
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
                object btnRemovePatrimonio: TTcGDIButton
                  Tag = 1
                  AlignWithMargins = True
                  Left = 927
                  Top = 21
                  Width = 21
                  Height = 16
                  Hint = 'Remover item'
                  Margins.Top = 5
                  Action = actRemovePatrimonio
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
                Top = 298
                Width = 968
                Height = 22
                Align = alBottom
                BevelOuter = bvNone
                Caption = ' '
                Color = 15658734
                ParentBackground = False
                TabOrder = 2
                object Label16: TLabel
                  Left = 767
                  Top = 5
                  Width = 102
                  Height = 16
                  AutoSize = False
                  Caption = 'Total patrim'#244'nios'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                end
                object DBText4: TDBText
                  Left = 877
                  Top = 5
                  Width = 90
                  Height = 13
                  Alignment = taRightJustify
                  DataField = 'TOTAL_PATRIMONIOS'
                  DataSource = dtsFicha
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btnAddPatrimonio: TTcGDIButton
                  Tag = 1
                  Left = 391
                  Top = 0
                  Width = 146
                  Height = 17
                  Caption = 'Cadastrar patrim'#244'nio'
                  NotesFont.Charset = DEFAULT_CHARSET
                  NotesFont.Color = clWindowText
                  NotesFont.Height = -11
                  NotesFont.Name = 'Tahoma'
                  NotesFont.Style = []
                  TabOrder = 0
                  Visible = False
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
              DesignSize = (
                968
                320)
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
                Left = 740
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
              object lblQtdeServico: TLabel
                Left = 455
                Top = 4
                Width = 65
                Height = 13
                Caption = 'Quantidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblTotalServico: TLabel
                Left = 625
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
                Left = 1
                Top = 20
                Width = 968
                Height = 270
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clWhite
                DataSource = dtsServicos
                PanelHeight = 54
                PanelWidth = 951
                ParentColor = False
                ParentShowHint = False
                TabOrder = 1
                RowCount = 5
                SelectedColor = 15658734
                ShowFocus = False
                ShowHint = True
                OnPaintPanel = DBCtrlGridServicosPaintPanel
              end
              object pnlTotalServicos: TPanel
                Left = 0
                Top = 298
                Width = 968
                Height = 22
                Align = alBottom
                BevelOuter = bvNone
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object Label10: TLabel
                  Left = 798
                  Top = 3
                  Width = 71
                  Height = 16
                  AutoSize = False
                  Caption = 'Total servi'#231'os'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                end
                object DBText2: TDBText
                  Left = 877
                  Top = 6
                  Width = 90
                  Height = 13
                  Alignment = taRightJustify
                  DataField = 'TOTAL_SERVICOS'
                  DataSource = dtsFicha
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
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
              object ServicoEditPanel: TPanel
                Left = 2
                Top = 22
                Width = 951
                Height = 42
                Anchors = [akLeft, akTop, akRight]
                BevelOuter = bvNone
                ShowCaption = False
                TabOrder = 2
                TabStop = True
                OnResize = ServicoEditPanelResize
                DesignSize = (
                  951
                  42)
                object Shape3: TShape
                  Left = 0
                  Top = 0
                  Width = 951
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
                  Width = 907
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
                      Column = 7
                      Control = edServicoTotal
                      Row = 0
                    end
                    item
                      Column = 8
                      ColumnSpan = 4
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
                    907
                    38)
                  object edServicoCodigo: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 7
                    Top = 7
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
                    TabOrder = 0
                    OnButtonClick = edServicoCodigoButtonClick
                  end
                  object cbxServicoUnidadeCompra: TDBComboBox
                    AlignWithMargins = True
                    Left = 307
                    Top = 7
                    Width = 61
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
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
                    DataSource = dtsServicos
                  end
                  object edServicoTotal: TJvDBCalcEdit
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
                    ReadOnly = True
                    ShowButton = False
                    TabOrder = 4
                    DecimalPlacesAlwaysShown = False
                    DataField = 'TOTAL'
                    DataSource = dtsServicos
                  end
                  object edServicoContaContabil: TTcDBComboEdit
                    AlignWithMargins = True
                    Left = 607
                    Top = 7
                    Width = 156
                    Height = 21
                    Margins.Left = 7
                    Margins.Top = 7
                    Margins.Right = 7
                    Margins.Bottom = 7
                    AutoSize = True
                    Checked = False
                    DataField = 'DESCR_PC_NOME'
                    DataSource = dtsServicos
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    TabOrder = 5
                    OnButtonClick = edServicoContaContabilButtonClick
                  end
                end
                object btnAdicionaServico: TTcGDIButton
                  Tag = 1
                  AlignWithMargins = True
                  Left = 927
                  Top = 3
                  Width = 21
                  Height = 16
                  Hint = 'Novo item'
                  Margins.Top = 5
                  Action = actAddItemServico
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
                  Height = 16
                  Hint = 'Remover item'
                  Margins.Top = 5
                  Action = actRemoveItemServico
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
            end
            object tbsTransporte: TTabSheet
              Caption = 'Frete'
              ImageIndex = 2
              DesignSize = (
                968
                320)
              object Label21: TLabel
                Left = 6
                Top = 59
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
              object Label24: TLabel
                Left = 6
                Top = 95
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
              object Label25: TLabel
                Left = 201
                Top = 95
                Width = 52
                Height = 13
                Caption = 'Todo dia '
              end
              object Label27: TLabel
                Left = 6
                Top = 26
                Width = 87
                Height = 13
                Caption = 'Transportadora'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object dbgParcelasAPagarTransporte: TJvDBUltimGrid
                Left = 315
                Top = 56
                Width = 625
                Height = 229
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataSource = dtsParcelasTransporte
                ParentColor = True
                TabOrder = 7
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnEditButtonClick = dbgParcelasAPagarTransporteEditButtonClick
                OnKeyPress = dbgParcelasAPagarTransporteKeyPress
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
                    ControlName = 'dbeVencimentoTransporte'
                    FieldName = 'VENCTO'
                    FitCell = fcBiggest
                    LeaveOnEnterKey = True
                    LeaveOnUpDownKey = True
                  end
                  item
                    ControlName = 'dbceValorParcelaTransporte'
                    FieldName = 'VALOR'
                    FitCell = fcCellSize
                    LeaveOnEnterKey = True
                  end
                  item
                    ControlName = 'dbmObsParcelaTransporte'
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
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VENCTO'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Width = 62
                    Visible = True
                  end
                  item
                    ButtonStyle = cbsEllipsis
                    Expanded = False
                    FieldName = 'NOMECONTA'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PAGTO'
                    ReadOnly = True
                    Title.Caption = 'Data de pagamento'
                    Width = 86
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PAGO'
                    Width = 32
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBS'
                    Width = 170
                    Visible = True
                  end>
              end
              object btnProgramarParcelasTransporte: TTcGDIButton
                Left = 197
                Top = 160
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
                OnClick = btnProgramarParcelasTransporteClick
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
              object cbProximoMesTransporte: TDBCheckBox
                Left = 6
                Top = 131
                Width = 180
                Height = 17
                Caption = 'A partir do pr'#243'ximo m'#234's '
                DataField = 'PROXIMO_MES'
                DataSource = dtsPagtoTransporte
                TabOrder = 4
                ValueChecked = 'T'
                ValueUnchecked = 'F'
              end
              object dbContaBancariaTransporte: TTcDBComboEdit
                Left = 127
                Top = 57
                Width = 174
                Height = 21
                Checked = False
                DataField = 'NOMECONTA'
                DataSource = dtsPagtoTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageKind = ikEllipsis
                ButtonWidth = 15
                ParentFont = False
                TabOrder = 1
                OnButtonClick = dbContaBancariaTransporteButtonClick
              end
              object dbmObsParcelaTransporte: TDBMemo
                Left = 584
                Top = 133
                Width = 390
                Height = 56
                DataField = 'OBS'
                DataSource = dtsParcelasTransporte
                TabOrder = 13
                Visible = False
              end
              object edtDiaParcelaTransporte: TDBEdit
                Left = 269
                Top = 93
                Width = 32
                Height = 21
                DataField = 'DIA_VENCTO'
                DataSource = dtsPagtoTransporte
                MaxLength = 2
                TabOrder = 3
              end
              object edtParcelasTransporte: TDBEdit
                Left = 127
                Top = 93
                Width = 30
                Height = 21
                DataField = 'NUM_PARCELAS'
                DataSource = dtsPagtoTransporte
                MaxLength = 3
                TabOrder = 2
              end
              object edTransportadora: TTcDBComboEdit
                Left = 127
                Top = 23
                Width = 174
                Height = 21
                Checked = False
                DataField = 'NOMEENTIDADE'
                DataSource = dtsPagtoTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageKind = ikEllipsis
                ButtonWidth = 15
                ParentFont = False
                TabOrder = 0
                OnButtonClick = edTransportadoraButtonClick
              end
              object pnlTotalTransporte: TPanel
                Left = 0
                Top = 298
                Width = 968
                Height = 22
                Align = alBottom
                BevelOuter = bvNone
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 10
                object Label26: TLabel
                  Left = 811
                  Top = 1
                  Width = 58
                  Height = 13
                  Caption = 'Total frete'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                end
                object DBText6: TDBText
                  Left = 877
                  Top = 1
                  Width = 90
                  Height = 17
                  Alignment = taRightJustify
                  DataField = 'SomaValor'
                  DataSource = dtsParcelasTransporte
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
              object TcGDIButton4: TTcGDIButton
                Left = 940
                Top = 78
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
                OnClick = TcGDIButton4Click
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
              object TcGDIButton6: TTcGDIButton
                Left = 940
                Top = 99
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
                OnClick = TcGDIButton6Click
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
              object dbceValorParcelaTransporte: TJvDBCalcEdit
                Left = 569
                Top = 106
                Width = 121
                Height = 21
                DisplayFormat = '#,0.00'
                ShowButton = False
                TabOrder = 12
                Visible = False
                DecimalPlacesAlwaysShown = False
                DataField = 'VALOR'
                DataSource = dtsParcelasTransporte
              end
              object dbeVencimentoTransporte: TTcDBDateEdit
                Left = 427
                Top = 109
                Width = 117
                Height = 21
                Checked = False
                DataField = 'VENCTO'
                DataSource = dtsParcelasTransporte
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
              object GroupBox4: TGroupBox
                Left = 315
                Top = 12
                Width = 734
                Height = 39
                TabOrder = 6
                object Label30: TLabel
                  Left = 419
                  Top = 12
                  Width = 57
                  Height = 13
                  Caption = 'Cheque : '
                end
                object JvDBCheckBox1: TJvDBCheckBox
                  Left = 17
                  Top = 10
                  Width = 167
                  Height = 17
                  Caption = 'Pagamento '#224' vista '
                  DataField = 'PAGTO_AVISTA'
                  DataSource = dtsPagtoTransporte
                  TabOrder = 0
                  ValueChecked = 'T'
                  ValueUnchecked = 'F'
                  OnChange = DBCheckBox1Change
                end
                object DBEdit1: TDBEdit
                  Left = 482
                  Top = 8
                  Width = 135
                  Height = 21
                  DataField = 'NUM_CHEQUE'
                  DataSource = dtsParcelasTransporte
                  TabOrder = 2
                end
                object JvDBCheckBox2: TJvDBCheckBox
                  Left = 235
                  Top = 10
                  Width = 97
                  Height = 17
                  Caption = 'Com cheque '
                  DataField = 'CHEQUE'
                  DataSource = dtsParcelasTransporte
                  TabOrder = 1
                  ValueChecked = 'T'
                  ValueUnchecked = 'F'
                end
              end
              object cbAnualTransporte: TJvDBCheckBox
                Left = 6
                Top = 160
                Width = 60
                Height = 17
                Caption = 'Anual '
                DataField = 'ANUAL'
                DataSource = dtsPagtoTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 14
                ValueChecked = 'T'
                ValueUnchecked = 'F'
              end
            end
            object tbsObservacoes: TTabSheet
              Caption = 'Observa'#231#245'es'
              ImageIndex = 5
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBMemo1: TDBMemo
                Left = 24
                Top = 12
                Width = 925
                Height = 296
                Align = alCustom
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataField = 'OBS'
                DataSource = dtsFicha
                TabOrder = 0
              end
            end
          end
          object gbPagamentos: TGroupBox
            Left = 0
            Top = 357
            Width = 976
            Height = 240
            Align = alBottom
            Caption = 'Pagamentos'
            TabOrder = 2
            DesignSize = (
              976
              240)
            object Label19: TLabel
              Left = 205
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
            object dbgParcelasAPagar: TJvDBUltimGrid
              Left = 319
              Top = 58
              Width = 625
              Height = 151
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataSource = dtsParcelas
              ParentColor = True
              TabOrder = 7
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'Verdana'
              TitleFont.Style = []
              OnEditButtonClick = dbgParcelasAPagarEditButtonClick
              OnKeyPress = dbgParcelasAPagarKeyPress
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
                  Width = 51
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VENCTO'
                  Width = 136
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRORROGACAO'
                  ReadOnly = True
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR'
                  Width = 95
                  Visible = True
                end
                item
                  ButtonStyle = cbsEllipsis
                  Expanded = False
                  FieldName = 'NOMECONTA'
                  Width = 138
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PAGTO'
                  ReadOnly = True
                  Width = 107
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBS'
                  Width = 33
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
              Left = 944
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
            object btnRemoveParcela: TTcGDIButton
              Left = 944
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
            object edtDia: TDBEdit
              Left = 273
              Top = 54
              Width = 32
              Height = 21
              DataField = 'DIA_VENCTO'
              DataSource = dtsAPagar
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
              Left = 581
              Top = 118
              Width = 390
              Height = 56
              DataField = 'OBS'
              DataSource = dtsParcelas
              TabOrder = 13
              Visible = False
            end
            object edtParcelas: TDBEdit
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
              Left = 2
              Top = 218
              Width = 972
              Height = 20
              Align = alBottom
              BevelOuter = bvNone
              Caption = ' '
              Color = clWhite
              ParentBackground = False
              TabOrder = 10
              object Label28: TLabel
                Left = 795
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
              object DBText1: TDBText
                Left = 879
                Top = 1
                Width = 90
                Height = 17
                Alignment = taRightJustify
                DataField = 'SomaValor'
                DataSource = dtsParcelas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object GroupBox1: TGroupBox
              Left = 319
              Top = 15
              Width = 734
              Height = 39
              TabOrder = 6
              object Label12: TLabel
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
                Caption = 'Pagamento '#224' vista '
                DataField = 'PAGTO_AVISTA'
                DataSource = dtsAPagar
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
              Width = 168
              Height = 17
              Caption = 'A partir do pr'#243'ximo m'#234's '
              DataField = 'PROXIMO_MES'
              DataSource = dtsAPagar
              TabOrder = 3
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            object cbAnual: TJvDBCheckBox
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
        object pnInfoNota: TGroupBox
          Left = 0
          Top = 0
          Width = 976
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
            Left = 77
            Top = 11
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
            Left = 214
            Top = 44
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
            Left = 608
            Top = 43
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
          object Label3: TLabel
            Left = 248
            Top = 12
            Width = 74
            Height = 13
            Caption = 'Data compra'
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
          object Label7: TLabel
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
          object Label11: TLabel
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
            Left = 297
            Top = 43
            Width = 59
            Height = 13
            Caption = 'Descontos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 463
            Top = 43
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
          object Label23: TLabel
            Left = 798
            Top = 43
            Width = 75
            Height = 13
            Caption = 'Data entrada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
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
          object Label15: TLabel
            Left = 437
            Top = 11
            Width = 64
            Height = 13
            Caption = 'Fornecedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
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
            Left = 765
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
          object GroupBox3: TGroupBox
            Left = 849
            Top = 121
            Width = 290
            Height = 43
            Caption = ' Fornecedor '
            TabOrder = 18
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
            Left = 252
            Top = 42
            Width = 36
            Height = 21
            DataField = 'SERIE'
            DataSource = dtsFicha
            ParentColor = True
            TabOrder = 7
          end
          object dbDataCompra: TTcDBDateEdit
            Left = 333
            Top = 11
            Width = 90
            Height = 21
            Checked = False
            DataField = 'DATA_COMPRA'
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
            Left = 694
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
            TabOrder = 13
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
            TabOrder = 12
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
            DataField = 'DATA_ENTRADA'
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
            TabOrder = 14
          end
          object dbImpostos: TJvDBCalcEdit
            Left = 904
            Top = 74
            Width = 96
            Height = 21
            DecimalPlaces = 7
            DisplayFormat = ',0.#######'
            ShowButton = False
            TabOrder = 16
            Visible = False
            DecimalPlacesAlwaysShown = False
            DataField = 'IMPOSTOS'
            DataSource = dtsFicha
          end
          object dbDescontos: TJvDBCalcEdit
            Left = 366
            Top = 42
            Width = 63
            Height = 21
            DecimalPlaces = 7
            DisplayFormat = ',0.00#####'
            ShowButton = False
            TabOrder = 8
            DecimalPlacesAlwaysShown = False
            DataField = 'DESCONTOS'
            DataSource = dtsFicha
          end
          object dbFrete: TJvDBCalcEdit
            Left = 501
            Top = 42
            Width = 63
            Height = 21
            DecimalPlaces = 7
            DisplayFormat = ',0.00#####'
            ShowButton = False
            TabOrder = 10
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
            Left = 144
            Top = 11
            Width = 89
            Height = 21
            DataField = 'NOTA_FISCAL'
            DataSource = dtsFicha
            TabOrder = 1
          end
          object btnRatearDesconto: TTcGDIButton
            Tag = 1
            Left = 435
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
            TabOrder = 9
            OnClick = btnRatearDescontoClick
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
            Left = 570
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
            TabOrder = 11
            OnClick = btnRatearFreteClick
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
            TabOrder = 17
            Visible = False
            OnClick = btnRatearImpostoClick
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
            Left = 509
            Top = 10
            Width = 250
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
            TabOrder = 15
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
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 699
    Width = 984
    ExplicitTop = 699
    ExplicitWidth = 984
    inherited _imageBottom: TImage
      Width = 984
      ExplicitWidth = 769
    end
    inherited _ToolBar: TToolBar
      Left = 132
      ExplicitLeft = 132
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  object SelecionarUnidadeEstoque: TPanel [2]
    Left = 256
    Top = 260
    Width = 433
    Height = 145
    Caption = ' '
    TabOrder = 2
    Visible = False
    DesignSize = (
      433
      145)
    object Label31: TLabel
      Left = 109
      Top = 20
      Width = 234
      Height = 13
      Caption = 'O produto n'#227'o possui unidade cadastrada'
    end
    object Label33: TLabel
      Left = 87
      Top = 44
      Width = 273
      Height = 13
      Alignment = taCenter
      Caption = 'Selecione uma unidade para controlar o estoque'
    end
    object dblcUnidadeControlaEstoque: TDBLookupComboBox
      AlignWithMargins = True
      Left = 168
      Top = 81
      Width = 95
      Height = 21
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 0
      Ctl3D = True
      KeyField = 'KCAD_TIPOS'
      ListField = 'DESCRICAO'
      ListSource = dtsUnidadesControlaEstoque
      ParentCtl3D = False
      TabOrder = 0
      OnKeyDown = dbcbKeyDown
    end
    object btbPanelSaveOk: TTcGDIButton
      Left = 357
      Top = 109
      Width = 27
      Height = 24
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -8
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      DisabledPicture.Data = {
        424D4E0100000000000076000000280000001200000012000000010004000000
        0000D80000000000000000000000000000000000000000000000000080000080
        00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
        000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
        000033333F333333333333000000333377F333333333330000003337337F3333
        33333300000033733337F333333333000000373333337F333333330000007F33
        7F3337F33333330000007F3737F337F33333330000007F73337F337F33333300
        000037333337F337F33333000000333333337F337F33330000003333333337F3
        37F33300000033333333337F337F33000000333333333337F337F30000003333
        333333337F37F300000033333333333337F73300000033333333333333733300
        0000333333333333333333000000}
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        424D4E0100000000000076000000280000001200000012000000010004000000
        0000D80000000000000000000000000000000000000000000000000080000080
        00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
        000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
        0000333333333333333333000000333334433333333333000000333342243333
        3333330000003334222243333333330000003342222224333333330000003422
        2A2222433333330000003222A3A222433333330000003A2A333A222433333300
        000033A33333A222433333000000333333333A222433330000003333333333A2
        22433300000033333333333A222433000000333333333333A222430000003333
        333333333A224300000033333333333333A223000000333333333333333A3300
        0000333333333333333333000000}
      TabOrder = 1
      OnClick = btbPanelSaveOkClick
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
    object btbPanelSaveCancel: TTcGDIButton
      Left = 383
      Top = 109
      Width = 27
      Height = 24
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -8
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      DisabledPicture.Data = {
        424D4E0100000000000076000000280000001200000012000000010004000000
        0000D80000000000000000000000000000000000000000000000000080000080
        00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
        000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
        00003333F333333333333300000033377F333333F33333000000337F37F333F7
        7F3333000000337F337F3F7337F333000000337F3337F733337F330000003337
        F33373333F733300000033337F333333F73333000000333337F3333373333300
        00003333337F3337333333000000333333733337F33333000000333337333337
        F33333000000333373337F337F33330000003337F33737F337F3330000003337
        FF73337F337F33000000333377333337FFF73300000033333333333377733300
        0000333333333333333333000000}
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        424D4E0100000000000076000000280000001200000012000000010004000000
        0000D80000000000000000000000000000000000000000000000000080000080
        00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
        000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
        0000333377333333333333000000333911733333973333000000333911173339
        1173330000003339111173911117330000003333911117111117330000003333
        3911111111733300000033333391111117333300000033333331111173333300
        0000333333391111733333000000333333911111733333000000333339111711
        1733330000003333911173911173330000003333911733391117330000003333
        3913333391113300000033333333333339193300000033333333333333333300
        0000333333333333333333000000}
      TabOrder = 2
      OnClick = btbPanelSaveCancelClick
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
  inherited dtsLista: TDataSource [3]
    Left = 862
    Top = 278
  end
  object dtsItensPedido: TDataSource [4]
    DataSet = dtmCOMPRAS_Pedido.cdsItensPedido
    OnDataChange = dtsItensPedidoDataChange
    Left = 800
    Top = 191
  end
  object dtsPatrimoniosPedido: TDataSource [5]
    DataSet = dtmCOMPRAS_Pedido.cdsPatrimoniosPedido
    OnDataChange = dtsPatrimoniosPedidoDataChange
    Left = 800
    Top = 231
  end
  object dtsServicos: TDataSource [6]
    DataSet = dtmCOMPRAS_Pedido.cdsServicosPedido
    OnDataChange = dtsServicosDataChange
    Left = 800
    Top = 243
  end
  object dtsDadosEntidade: TDataSource [7]
    Left = 800
    Top = 347
  end
  object dtsAPagar: TDataSource [8]
    DataSet = dtmCOMPRAS_Pedido.cdsAPagar
    Left = 800
    Top = 401
  end
  object dtsParcelas: TDataSource [9]
    DataSet = dtmCOMPRAS_Pedido.cdsParcelas
    Left = 800
    Top = 294
  end
  object dtsPagtoTransporte: TDataSource [10]
    DataSet = dtmCOMPRAS_Pedido.cdsAPagarTransporte
    Left = 800
    Top = 454
  end
  object dtsParcelasTransporte: TDataSource [11]
    DataSet = dtmCOMPRAS_Pedido.cdsParcelasTransporte
    Left = 800
    Top = 514
  end
  inherited ActionList: TInternalActionList [12]
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
      OnExecute = actPrintComprasCentroCustoExecute
      OnUpdate = actPrintComprasCentroCustoUpdate
    end
    object actPrintPedidoPorPeriodo: TAction
      Category = 'Print'
      Caption = 'Por Per'#237'odo'
      OnExecute = actPrintPedidoPorPeriodoExecute
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
    object actExpandItens: TAction
      Category = 'Edit'
      Caption = 'ExpandItens'
      OnExecute = actExpandItensExecute
    end
  end
  inherited dtsFicha: TDataSource [13]
    DataSet = dtmCOMPRAS_Pedido.cdsPedido
    OnDataChange = dtsFichaDataChange
    Left = 858
    Top = 351
  end
  inherited _popMenuPrint: TPopupMenu
    Left = 163
    Top = 93
    object N5: TMenuItem
      Caption = '-'
    end
    object ComprasdoPeriodo1: TMenuItem
      Action = actPrintComprasCentroCusto
    end
    object PorPerodo1: TMenuItem
      Action = actPrintPedidoPorPeriodo
    end
    object N1: TMenuItem
      Caption = '-'
      Visible = False
    end
    object PedidoEmail1: TMenuItem
      Action = actPrintPedidoEmail
      Visible = False
    end
    object ImprimirPedido1: TMenuItem
      Action = actPrintPedidoFolhaTimbrado
      Visible = False
    end
    object ImprimirPedidoMatricial1: TMenuItem
      Action = actPrintPedidoMatricial
      Visible = False
    end
    object PedidoFolhaBranca1: TMenuItem
      Action = actPrintPedidoPapelBranco
      Visible = False
    end
  end
  inherited _popMenuOther: TPopupMenu
    Left = 249
    Top = 94
    object GerarNotaFiscal1: TMenuItem [0]
      Action = actCopiarPedido
    end
    object N2: TMenuItem [1]
      Caption = '-'
    end
    object ImportarOrcamento1: TMenuItem [2]
      Action = actImportarOrcamento
    end
    object N4: TMenuItem [3]
      Caption = '-'
    end
    object CancelarManual1: TMenuItem [4]
      Action = actCancelarManual
    end
    object N3: TMenuItem [5]
      Caption = '-'
    end
  end
  inherited ToolBarIcons: TImageListProvider
    Left = 760
    Top = 22
  end
  object ImageList1: TImageList
    Left = 436
    Top = 104
    Bitmap = {
      494C01010700F802040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
    Top = 56
  end
  object dtsUnidadesControlaEstoque: TDataSource
    DataSet = dtmCOMPRAS_Pedido.cdsUnidadesControlaEstoque
    Left = 880
    Top = 215
  end
  object PopuperSelecionarUnidadeEstoque: TTcControlPopuper
    Control = SelecionarUnidadeEstoque
    PopupStyle = cpsModal
    EscKeyAction = 2
    Left = 300
    Top = 360
  end
end
