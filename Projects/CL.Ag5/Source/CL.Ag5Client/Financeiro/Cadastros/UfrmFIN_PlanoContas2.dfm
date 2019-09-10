inherited frmFIN_PlanoContas2: TfrmFIN_PlanoContas2
  Left = 344
  Top = 170
  ActiveControl = dbcbFixaVariavel
  Caption = 'Plano de Contas'
  ClientHeight = 605
  ClientWidth = 1049
  ExplicitWidth = 1065
  ExplicitHeight = 644
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlFicha: TPanel
    Width = 1049
    Height = 605
    Constraints.MinHeight = 217
    ParentColor = True
    ExplicitWidth = 1049
    ExplicitHeight = 605
    inherited _pnlFooter: TPanel
      Top = 539
      Width = 1047
      TabOrder = 2
      ExplicitTop = 539
      ExplicitWidth = 1047
      inherited _imageBottom: TImage
        Width = 1047
        ExplicitWidth = 960
      end
      inherited _ToolBar: TToolBar
        Left = 103
        TabStop = True
        ExplicitLeft = 103
        inherited _ToolButtonNew: TToolButton
          ExplicitWidth = 65
          ExplicitHeight = 52
        end
        inherited _ToolButtonPrint: TToolButton
          ExplicitWidth = 86
        end
        inherited _ToolButtonOther: TToolButton
          ExplicitWidth = 86
        end
      end
    end
    inherited _ScrollBoxFicha: TScrollBox
      Top = 60
      Width = 1047
      Height = 479
      ParentColor = True
      TabOrder = 1
      ExplicitTop = 60
      ExplicitWidth = 1047
      ExplicitHeight = 479
      object Splitter1: TSplitter [0]
        Left = 0
        Top = 360
        Width = 1047
        Height = 5
        Cursor = crVSplit
        Align = alBottom
        ExplicitLeft = -3
        ExplicitTop = 113
        ExplicitWidth = 960
      end
      inherited _dbgLista: TJvDBUltimGrid
        Top = 195
        Width = 1047
        Height = 165
        Align = alBottom
        TabOrder = 2
        Visible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'CLASSIFICACAO'
            Width = 147
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATIVO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANALITICO_SINTETICO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEVEDORA_CREDORA'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FLUXOCAIXA'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_APRD'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FIXA_VARIAVEL'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOVIMENTA_ESTOQUE'
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end>
      end
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 365
        Width = 1047
        Height = 114
        Align = alBottom
        TabOrder = 1
        object Label1: TLabel
          Left = 10
          Top = 13
          Width = 74
          Height = 13
          Caption = 'Classifica'#231#227'o'
          FocusControl = dbClassificacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 244
          Top = 13
          Width = 56
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDescricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 245
          Top = 48
          Width = 82
          Height = 13
          Caption = 'Fixa / Vari'#225'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 866
          Top = 48
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
        object Label3: TLabel
          Left = 465
          Top = 48
          Width = 82
          Height = 13
          Caption = 'Fluxo de caixa'
          FocusControl = dbDescricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 878
          Top = 15
          Width = 24
          Height = 13
          Caption = 'Tipo'
          FocusControl = dbDescricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 10
          Top = 48
          Width = 108
          Height = 13
          Caption = 'Devedora/Credora'
          FocusControl = dbDescricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 650
          Top = 48
          Width = 111
          Height = 13
          Caption = 'Movimenta Estoque'
          FocusControl = dbDescricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lblContaEquivalente: TLabel
          Left = 10
          Top = 83
          Width = 104
          Height = 13
          Caption = 'Conta equivalente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object dbClassificacao: TDBEdit
          Left = 94
          Top = 13
          Width = 118
          Height = 21
          Color = clBtnFace
          DataField = 'CLASSIFICACAO'
          DataSource = dtsFicha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbDescricao: TDBEdit
          Left = 309
          Top = 13
          Width = 545
          Height = 21
          DataField = 'NOME'
          DataSource = dtsFicha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbcbFixaVariavel: TJvDBComboBox
          Left = 339
          Top = 47
          Width = 118
          Height = 21
          DataField = 'FIXA_VARIAVEL'
          DataSource = dtsFicha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Items.Strings = (
            'Fixa'
            'Vari'#225'vel')
          ParentFont = False
          TabOrder = 4
          UpdateFieldImmediatelly = True
          Values.Strings = (
            'F'
            'V')
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object cbStatus: TJvDBComboBox
          Left = 914
          Top = 48
          Width = 85
          Height = 21
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
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
          TabOrder = 7
          UpdateFieldImmediatelly = True
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
        object dbcbFluxoCaixa: TJvDBComboBox
          Left = 557
          Top = 48
          Width = 80
          Height = 21
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'FLUXOCAIXA'
          DataSource = dtsFicha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentFont = False
          TabOrder = 5
          UpdateFieldImmediatelly = True
          Values.Strings = (
            'T'
            'F')
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Verdana'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object dbcbTipo: TJvDBComboBox
          Left = 914
          Top = 15
          Width = 85
          Height = 21
          DataField = 'TIPO_APRD'
          DataSource = dtsFicha
          Enabled = False
          Items.Strings = (
            'Ativo'
            'Passivo'
            'Receita'
            'Despesa')
          TabOrder = 2
          UpdateFieldImmediatelly = True
          Values.Strings = (
            'A'
            'P'
            'R'
            'D')
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
          OnChange = dbcbTipoChange
        end
        object dbcbDevCred: TJvDBComboBox
          Left = 128
          Top = 48
          Width = 103
          Height = 21
          DataField = 'DEVEDORA_CREDORA'
          DataSource = dtsFicha
          Enabled = False
          Items.Strings = (
            'Devedora'
            'Credora')
          TabOrder = 3
          TabStop = False
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
        object dbcbMovimentaEstoque: TJvDBComboBox
          Left = 773
          Top = 48
          Width = 81
          Height = 21
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'MOVIMENTA_ESTOQUE'
          DataSource = dtsFicha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentFont = False
          TabOrder = 6
          UpdateFieldImmediatelly = True
          Values.Strings = (
            'T'
            'F')
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Verdana'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object JvDBCheckBox1: TJvDBCheckBox
          Left = 775
          Top = 81
          Width = 224
          Height = 21
          Caption = 'Ocultar esta conta nas pesquisas.'
          DataField = 'HIDE_BY_USER'
          DataSource = dtsFicha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          ValueChecked = 'T'
          ValueUnchecked = 'F'
        end
        object edContaEquivalente: TJvDBComboEdit
          Left = 128
          Top = 81
          Width = 329
          Height = 21
          Color = clWhite
          DataField = 'NOME_EQUIVALENTE'
          DataSource = dtsFicha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ImageKind = ikEllipsis
          ButtonWidth = 15
          ParentFont = False
          TabOrder = 9
          OnButtonClick = edContaEquivalenteButtonClick
        end
      end
      object dbtreePlanoContas: TDTClientTree
        Left = 0
        Top = 0
        Width = 1047
        Height = 195
        ParentCustomHint = False
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Header.AutoSizeIndex = -1
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        Header.Options = [hoColumnResize, hoDrag, hoShowImages, hoShowSortGlyphs, hoVisible]
        LineMode = lmBands
        LineStyle = lsSolid
        NodeDataSize = 4
        ParentFont = False
        TabOrder = 0
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning]
        TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
        TreeOptions.SelectionOptions = [toExtendedFocus]
        OnClick = dbtreePlanoContasClick
        OnPaintText = dbtreePlanoContasPaintText
        DataSource = dtsFicha
        DBTreeFields.KeyFieldName = 'KFIN_PLANOCONTA'
        DBTreeFields.ParentFieldName = 'KMFIN_PLANOCONTA'
        DBTreeFields.ListFieldName = 'NOME'
        DBTreeFields.ParentOfRootValue = 'NULL'
        DBTreeImages.HasChildrenImageIndex = -1
        DBTreeImages.HasChildrenSelectedIndex = -1
        DBTreeImages.NoChildrenImageIndex = -1
        DBTreeImages.NoChildrenSelectedIndex = -1
        UseFilter = True
        Columns = <
          item
            Position = 0
            Width = 220
            FieldName = 'CLASSIFICACAO'
            WideText = 'Classifica'#231#227'o'
          end
          item
            Position = 1
            Width = 70
            FieldName = 'CODIGO'
            WideText = 'C'#243'digo'
          end
          item
            Position = 2
            Width = 200
            FieldName = 'NOME'
            WideText = 'Descri'#231#227'o'
          end
          item
            Position = 3
            Width = 100
            FieldName = 'ANALITICO_SINTETICO'
            WideText = 'Anal'#237'tica/Sint'#233'tica'
          end
          item
            Position = 4
            Width = 120
            FieldName = 'DEVEDORA_CREDORA'
            WideText = 'Devedora/Credora'
          end
          item
            Position = 5
            Width = 100
            FieldName = 'FLUXOCAIXA'
            WideText = 'Fluxo de Caixa'
          end
          item
            Position = 6
            Width = 100
            FieldName = 'FIXA_VARIAVEL'
            WideText = 'Fixa/Variavel'
          end
          item
            Position = 7
            FieldName = 'MOVIMENTA_ESTOQUE'
            WideText = 'Movimenta estoque'
          end
          item
            Position = 8
            Width = 100
            FieldName = 'TIPO_APRD'
            WideText = 'Tipo'
          end
          item
            Position = 9
            Width = 90
            FieldName = 'ATIVO'
            WideText = 'Status'
          end
          item
            Position = 10
            FieldName = 'HIDE_BY_USER'
            WideText = 'Oculta'
          end
          item
            Position = 11
            FieldName = 'CLASSIFICACAO_EQUIVALENTE'
            WideText = 'Equivalente'
          end>
      end
    end
    object _pnlSearch: TPanel
      Left = 1
      Top = 1
      Width = 1047
      Height = 59
      Align = alTop
      BevelOuter = bvNone
      Caption = ' '
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      DesignSize = (
        1047
        59)
      object _lblPesquisas: TLabel
        Left = 19
        Top = 12
        Width = 60
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Pesquisar:'
        FocusControl = _edtSearch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object lblMascara: TLabel
        Left = 653
        Top = 21
        Width = 43
        Height = 13
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = '0.00.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        OnClick = lblMascaraClick
      end
      object _edtSearch: TJvComboEdit
        Left = 86
        Top = 7
        Width = 221
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ButtonWidth = 15
        ClipboardCommands = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ImageKind = ikEllipsis
        ParentFont = False
        TabOrder = 0
        Text = ''
        OnButtonClick = _edtSearchButtonClick
        OnKeyPress = _edtSearchKeyPress
      end
      object rbRaiz: TRadioButton
        Left = 86
        Top = 36
        Width = 113
        Height = 17
        Caption = 'Novo item'
        TabOrder = 1
      end
      object rbSubitem: TRadioButton
        Left = 222
        Top = 36
        Width = 113
        Height = 17
        Caption = 'Subitem'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object Button1: TButton
        Left = 918
        Top = 16
        Width = 123
        Height = 25
        Action = actAllowEdit
        Anchors = [akTop, akRight]
        TabOrder = 3
      end
      object btDescartarEdicao: TButton
        Left = 918
        Top = 5
        Width = 123
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Descartar edi'#231#227'o'
        TabOrder = 4
        OnClick = btDescartarEdicaoClick
      end
      object btEditarPlanos: TButton
        Left = 790
        Top = 5
        Width = 123
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Editar contas especiais'
        TabOrder = 5
        OnClick = btEditarPlanosClick
      end
    end
  end
  inherited ActionList: TInternalActionList
    object actPrintSelection: TAction
      Category = 'Print'
      Caption = 'A partir da sele'#231#227'o'
      OnExecute = actPrintSelectionExecute
    end
    object actAllowEdit: TAction
      Category = 'Other'
      Caption = 'Permitir edi'#231#227'o'
      OnExecute = actAllowEditExecute
      OnUpdate = actAllowEditUpdate
    end
  end
  inherited dtsFicha: TDataSource
    Left = 730
    Top = 16
  end
  inherited _popMenuPrint: TPopupMenu
    object actPrintSelection1: TMenuItem
      Action = actPrintSelection
    end
  end
end
