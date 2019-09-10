inherited frmCustomSearch: TfrmCustomSearch
  Left = 256
  Top = 201
  ActiveControl = edtSearch
  Caption = 'Pesquisar ...'
  ClientHeight = 415
  ClientWidth = 851
  ActionList.Left = 65
  ExplicitWidth = 857
  ExplicitHeight = 444
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 851
    Height = 415
    ExplicitWidth = 851
    ExplicitHeight = 415
    inherited _pnlDetail: TJvPanel
      Width = 847
      Height = 372
      ExplicitWidth = 847
      ExplicitHeight = 372
      object dbgSearch: TJvDBUltimGrid
        Left = 0
        Top = 41
        Width = 847
        Height = 331
        Hint = 'grid'
        Align = alClient
        BorderStyle = bsNone
        Color = 15920101
        Ctl3D = False
        DataSource = dtsSearch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -9
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgSearchDrawColumnCell
        OnDblClick = dbgSearchDblClick
        OnKeyPress = dbgSearchKeyPress
        TitleButtons = True
        AlternateRowColor = clWhite
        SelectColumn = scGrid
        TitleArrow = True
        AutoSizeColumns = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 15
        SortWith = swUserFunc
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 847
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          Left = 5
          Top = 9
          Width = 162
          Height = 13
          Caption = 'Informe o Texto a &Pesquisar'
          Color = clBtnFace
          FocusControl = edtSearch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object edtSearch: TEdit
          Left = 193
          Top = 9
          Width = 250
          Height = 21
          Hint = 'Digite a pesquisa e tecle Enter...'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'edtSearch'
          TextHint = 'Digite a pesquisa e tecle Enter...'
          StyleElements = [seBorder]
          OnKeyPress = edtSearchKeyPress
        end
        object btnNovo: TTcGDIButton
          Left = 471
          Top = 7
          Width = 150
          Height = 25
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Novo ...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
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
          Spacing = 10
          TabOrder = 1
          Visible = False
          OnClick = btnNovoClick
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
    inherited _pnlFooter: TJvPanel
      Top = 374
      Width = 847
      Height = 39
      ExplicitTop = 374
      ExplicitWidth = 847
      ExplicitHeight = 39
      inherited _imageBottom: TImage
        Width = 847
        Height = 39
        ExplicitWidth = 847
        ExplicitHeight = 30
      end
      object Image2: TImage
        Left = 6
        Top = 7
        Width = 24
        Height = 24
        AutoSize = True
        Center = True
        Picture.Data = {
          07544269746D6170F6060000424DF60600000000000036000000280000001800
          0000180000000100180000000000C00600000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF6A6A6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000001010100
          0000000000919191FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000000000FFFFFF3636360000000000007F7F7FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          7272727D7D7D8D8D8D000000000000FFFFFFFFFFFFFFFFFF3333330000000000
          008A8A8A7E7E7E7C7C7C7C7C7C7C7C7C7F7F7F7E7E7E777777C6C6C6FFFFFFFF
          FFFFD1D1D1000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF6C6C6C0000000000000000000000000000000000000000000000
          000000001C1C1CFFFFFF313131010101FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFA0A0A0000000737373000000888888FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007D7D7D0000007D7D7D
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007D
          7D7D0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000007F7F7F000000818181FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000008080800000007C7C7CFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007C7C7C0000007F7F7F
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F
          7F7F0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000007F7F7F0000007D7D7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000007D7D7D0000007F7F7FFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7F0000008C8C8C
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080
          8080333333000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9E9E000000707070C9C9C900000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000141414FFFFFFFFFFFFD0D0D07474747C7C7C7C7C
          7C7D7D7D8080807F7F7F8080807D7D7D7E7E7E7E7E7E7F7F7F7C7C7C7C7C7C7D
          7D7D7D7D7D7D7D7D8080807D7D7D7D7D7D707070FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        Transparent = True
      end
      object Label16: TLabel
        Left = 40
        Top = 4
        Width = 402
        Height = 12
        Caption = 
          'Para selecionar o registro desejado, utilize um duplo clique ou ' +
          'pressione [ENTER]'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 40
        Top = 20
        Width = 313
        Height = 12
        Caption = 'Para cancelar, clique no bot'#227'o fechar [X] fechar ou tecle [ESC]'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 65
  end
  object dtsSearch: TDataSource
    DataSet = cdsSearch
    Left = 552
    Top = 125
  end
  object cdsSearch: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    AfterClose = cdsSearchAfterClose
    Left = 584
    Top = 136
  end
end
