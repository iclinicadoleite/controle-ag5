inherited _FormPesquisaFicha: T_FormPesquisaFicha
  Left = 311
  Top = 248
  ActiveControl = _edtSearch
  Caption = '_FormPesquisaFicha'
  ClientWidth = 855
  Font.Height = -9
  ExplicitWidth = 871
  PixelsPerInch = 96
  TextHeight = 11
  object _pnlToolBar: TPanel [0]
    Left = 0
    Top = 0
    Width = 855
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      855
      27)
    object _pnlToolButtons: TPanel
      Left = 963
      Top = 0
      Width = 641
      Height = 24
      Anchors = [akTop]
      BevelOuter = bvNone
      Caption = ' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object _ToolBar: TToolBar
        Tag = 99
        Left = 0
        Top = 0
        Width = 425
        Height = 26
        Align = alNone
        AutoSize = True
        ButtonHeight = 26
        ButtonWidth = 63
        Caption = '_ToolBar'
        EdgeOuter = esNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        List = True
        ParentFont = False
        ParentShowHint = False
        ShowCaptions = True
        ShowHint = True
        TabOrder = 0
        Wrapable = False
        object _ToolButtonNew: TToolButton
          Left = 0
          Top = 0
          Action = _actNew
          AutoSize = True
        end
        object _ToolButtonEdit: TToolButton
          Left = 42
          Top = 0
          Action = _actEdit
          AutoSize = True
        end
        object _ToolButtonDelete: TToolButton
          Left = 88
          Top = 0
          Action = _actDelete
          AutoSize = True
        end
        object _ToolButtonSeparator1: TToolButton
          Left = 140
          Top = 0
          Width = 8
          Caption = '_ToolButtonSeparator1'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object _ToolButtonSave: TToolButton
          Left = 148
          Top = 0
          Action = _actSave
          AutoSize = True
        end
        object _ToolButtonCancel: TToolButton
          Left = 196
          Top = 0
          Action = _actCancel
          AutoSize = True
        end
        object _ToolButtonSeparator2: TToolButton
          Left = 257
          Top = 0
          Width = 8
          Caption = '_ToolButtonSeparator2'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object _ToolButtonPrint: TToolButton
          Left = 265
          Top = 0
          Action = _actPrint
          AutoSize = True
          Caption = '&Imprimir'
          DropdownMenu = _popMenuPrint
          Style = tbsDropDown
        end
        object _ToolButtonSeparator3: TToolButton
          Left = 345
          Top = 0
          Width = 8
          Caption = '_ToolButtonSeparator3'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object _ToolButtonOther: TToolButton
          Left = 353
          Top = 0
          Action = _actOther
          AutoSize = True
          Caption = '&Outros'
          DropdownMenu = _popMenuOther
          Style = tbsDropDown
        end
      end
    end
  end
  object _pnlFicha: TPanel [1]
    Left = 0
    Top = 27
    Width = 855
    Height = 402
    Align = alClient
    Caption = ' '
    Constraints.MinHeight = 200
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      855
      402)
    object _pnlFooter: TPanel
      Left = 723
      Top = 405
      Width = 771
      Height = 32
      Anchors = [akBottom]
      BevelOuter = bvNone
      Caption = ' '
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        771
        32)
      object _btbCancel: TTcGDIButton
        Left = 663
        Top = 1
        Width = 100
        Height = 29
        Action = _actCancel
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ImageIndex = 5
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
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
      object _btbSave: TTcGDIButton
        Left = 561
        Top = 1
        Width = 100
        Height = 29
        Action = _actSave
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ImageIndex = 4
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
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
    end
    object _ScrollBoxFicha: TScrollBox
      Left = 723
      Top = 29
      Width = 771
      Height = 375
      Anchors = [akTop, akBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object _pnlSearch: TPanel
      Left = 0
      Top = -4
      Width = 771
      Height = 27
      Anchors = [akTop]
      BevelInner = bvRaised
      BevelOuter = bvNone
      Caption = ' '
      ParentBackground = False
      TabOrder = 0
      object _lblPesquisas: TLabel
        Left = 5
        Top = 7
        Width = 52
        Height = 11
        Caption = 'Pesquisar:'
        FocusControl = _edtSearch
      end
      object _edtSearch: TJvComboEdit
        Left = 61
        Top = 3
        Width = 237
        Height = 19
        ButtonWidth = 15
        ClipboardCommands = []
        ImageKind = ikEllipsis
        TabOrder = 0
        Text = ''
        OnButtonClick = _edtSearchButtonClick
        OnKeyPress = _edtSearchKeyPress
      end
    end
  end
  inherited ActionList: TInternalActionList
    object _actPrint: TAction
      Category = 'Print'
      Caption = 'Imprimir'
      Hint = 'Op'#231#245'es de Impress'#227'o'
      ImageIndex = 6
      ShortCut = 16457
      OnExecute = _actPrintExecute
    end
    object _actOther: TAction
      Category = 'Other'
      Caption = 'Outros'
      Hint = 'Outras op'#231#245'es'
      ImageIndex = 9
      ShortCut = 16463
      OnExecute = _actOtherExecute
    end
    object _actRefresh: TAction
      Category = 'Edit'
      Caption = 'Atualizar dados'
      ImageIndex = 16
      ShortCut = 116
    end
  end
  object _popMenuPrint: TPopupMenu
    OnPopup = _popMenuPrintPopup
    Left = 312
    Top = 8
    object _ImprimirLista: TMenuItem
      Caption = 'Imprimir Lista...'
    end
  end
  object _popMenuOther: TPopupMenu
    OnPopup = _popMenuOtherPopup
    Left = 356
    Top = 8
    object _AtualizarLista: TMenuItem
      Action = _actRefresh
    end
  end
end
