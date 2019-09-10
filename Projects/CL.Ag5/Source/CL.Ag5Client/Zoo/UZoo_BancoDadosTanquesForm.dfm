inherited Zoo_BancoDadosTanquesForm: TZoo_BancoDadosTanquesForm
  Left = 219
  Top = 185
  Caption = 'Tanques'
  ClientHeight = 509
  ClientWidth = 914
  ExplicitWidth = 930
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Width = 914
    Height = 444
    ActivePage = _tbsFicha
    ExplicitWidth = 914
    ExplicitHeight = 444
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 906
      ExplicitHeight = 416
      inherited _pnlSearch: TPanel
        Width = 906
        ExplicitWidth = 906
        inherited _edtSearch: TJvComboEdit
          ParentFont = False
        end
      end
      inherited _pnldbgLista: TPanel
        Width = 906
        Height = 378
        ExplicitWidth = 906
        ExplicitHeight = 378
        inherited _dbgLista: TJvDBUltimGrid
          Width = 902
          Height = 374
          Constraints.MinHeight = 88
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 906
      ExplicitHeight = 416
      inherited _pnlFicha: TPanel
        Width = 906
        Height = 416
        Constraints.MinHeight = 173
        ExplicitWidth = 906
        ExplicitHeight = 416
        inherited _ScrollBoxFicha: TScrollBox
          Width = 906
          Height = 416
          ExplicitWidth = 906
          ExplicitHeight = 416
          inherited _pnlScroll: TPanel
            Width = 906
            Height = 416
            ExplicitWidth = 906
            ExplicitHeight = 416
            object Splitter1: TSplitter
              Left = 130
              Top = 0
              Width = 6
              Height = 416
              ExplicitLeft = 65
              ExplicitHeight = 353
            end
            object _pnldbgLista2: TPanel
              Left = 0
              Top = 0
              Width = 130
              Height = 416
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alLeft
              BevelOuter = bvNone
              BorderWidth = 1
              Caption = '_pnldbgLista2'
              Color = clSilver
              ParentBackground = False
              TabOrder = 0
              object JvDBUltimGrid4: TJvDBUltimGrid
                Left = 1
                Top = 99
                Width = 128
                Height = 316
                Align = alClient
                DataSource = dtsLista
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CODIGOTANQUE'
                    Visible = True
                  end>
              end
              object Panel9: TPanel
                Left = 1
                Top = 1
                Width = 128
                Height = 98
                Align = alTop
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                object rbShowBrinco: TRadioButton
                  Left = 4
                  Top = 2
                  Width = 107
                  Height = 14
                  Caption = 'C'#243'digo'
                  Checked = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                end
                object rbShowNomeEstabulo: TRadioButton
                  Left = 4
                  Top = 39
                  Width = 107
                  Height = 15
                  Caption = 'Nome est'#225'bulo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  Visible = False
                end
                object rbShowNomeCompleto: TRadioButton
                  Left = 4
                  Top = 20
                  Width = 107
                  Height = 15
                  Caption = 'Nome completo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  Visible = False
                end
                object edtQuickSearch: TJvDBSearchEdit
                  Left = 3
                  Top = 74
                  Width = 103
                  Height = 21
                  DataSource = dtsLista
                  DataField = 'CODIGOTANQUE'
                  TabOrder = 3
                  Text = 'edtQuickSearch'
                end
                object cbxExibirDescartados2: TCheckBox
                  Left = 4
                  Top = 55
                  Width = 121
                  Height = 17
                  Caption = 'Exibir descartados/inativos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  Visible = False
                end
              end
            end
            object PageControl: TJvPageControl
              Left = 136
              Top = 0
              Width = 770
              Height = 416
              ActivePage = tbsDados
              Align = alClient
              DoubleBuffered = True
              OwnerDraw = True
              ParentDoubleBuffered = False
              Style = tsButtons
              TabOrder = 1
              TabWidth = 150
              OnChange = PageControlChange
              TabPainter = JvTabDefaultPainter1
              object tbsDados: TTabSheet
                Caption = 'Dados do tanque'
                DesignSize = (
                  762
                  385)
                object Label1: TLabel
                  Left = 3
                  Top = 6
                  Width = 41
                  Height = 13
                  Caption = 'Tanque'
                  FocusControl = DBEdit1
                end
                object DBEdit1: TDBEdit
                  Left = 51
                  Top = 3
                  Width = 199
                  Height = 21
                  DataField = 'CODIGOTANQUE'
                  DataSource = dtsFicha
                  TabOrder = 0
                end
                object Panel3: TPanel
                  Left = 3
                  Top = 30
                  Width = 757
                  Height = 352
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Caption = 'Panel3'
                  TabOrder = 1
                  object Panel1: TPanel
                    Left = 1
                    Top = 279
                    Width = 755
                    Height = 72
                    Align = alBottom
                    BevelOuter = bvNone
                    Caption = ' '
                    Color = 15724527
                    Constraints.MaxHeight = 72
                    ParentBackground = False
                    TabOrder = 0
                    object Label2: TLabel
                      Left = 5
                      Top = 5
                      Width = 105
                      Height = 24
                      Caption = 'G = Teor de Gordura '#13'P = Teor de Protei'#769'na '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label3: TLabel
                      Left = 179
                      Top = 5
                      Width = 141
                      Height = 24
                      Caption = 'L   = Teor de Lactose'#13'ST = Teor de  S'#243'lidos Totais'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label4: TLabel
                      Left = 5
                      Top = 33
                      Width = 228
                      Height = 36
                      Caption = 
                        'ESD = Teor de Extrato Seco Desengordurado '#13'CCS = Contagem C'#233'lula' +
                        's Som'#225'ticas'#13'NU = Teor de Nitrog'#234'nio Ur'#233'ico'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                    end
                  end
                  object dbgAnalises: TJvDBUltimGrid
                    Left = 1
                    Top = 41
                    Width = 755
                    Height = 238
                    Align = alClient
                    DataSource = dtsAnalises
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clBlack
                    TitleFont.Height = -11
                    TitleFont.Name = 'Verdana'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <
                      item
                        ControlName = 'edData'
                        FieldName = 'DATA'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'edGordura'
                        FieldName = 'GORDURA'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'edProteina'
                        FieldName = 'PROTEINA'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'edLactose'
                        FieldName = 'LACTOSE'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'edSolidos'
                        FieldName = 'SOLIDOS_TOTAIS'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'edESD'
                        FieldName = 'ESD'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'edCCS'
                        FieldName = 'CCS'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'edUreia'
                        FieldName = 'UREIA'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end
                      item
                        ControlName = 'edCBT'
                        FieldName = 'CBT'
                        FitCell = fcCellSize
                        LeaveOnEnterKey = True
                        LeaveOnUpDownKey = True
                      end>
                    RowsHeight = 17
                    TitleRowHeight = 17
                  end
                  object edData: TTcDBDateEdit
                    Left = 48
                    Top = 16
                    Width = 121
                    Height = 21
                    Checked = False
                    DataField = 'DATA'
                    DataSource = dtsAnalises
                    CheckOnExit = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                    Visible = False
                  end
                  object edProteina: TTcDBCalcEdit
                    Left = 64
                    Top = 40
                    Width = 121
                    Height = 21
                    Checked = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = False
                    TabOrder = 3
                    Visible = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'PROTEINA'
                    DataSource = dtsAnalises
                  end
                  object edGordura: TTcDBCalcEdit
                    Left = 64
                    Top = 65
                    Width = 121
                    Height = 21
                    Checked = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = False
                    TabOrder = 4
                    Visible = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'GORDURA'
                    DataSource = dtsAnalises
                  end
                  object edLactose: TTcDBCalcEdit
                    Left = 64
                    Top = 90
                    Width = 121
                    Height = 21
                    Checked = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = False
                    TabOrder = 5
                    Visible = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'LACTOSE'
                    DataSource = dtsAnalises
                  end
                  object edSolidos: TTcDBCalcEdit
                    Left = 64
                    Top = 115
                    Width = 121
                    Height = 21
                    Checked = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = False
                    TabOrder = 6
                    Visible = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'SOLIDOS_TOTAIS'
                    DataSource = dtsAnalises
                  end
                  object edESD: TTcDBCalcEdit
                    Left = 64
                    Top = 140
                    Width = 121
                    Height = 21
                    Checked = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = False
                    TabOrder = 7
                    Visible = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'ESD'
                    DataSource = dtsAnalises
                  end
                  object edCCS: TTcDBCalcEdit
                    Left = 64
                    Top = 165
                    Width = 121
                    Height = 21
                    Checked = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = False
                    TabOrder = 8
                    Visible = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'CCS'
                    DataSource = dtsAnalises
                  end
                  object edUreia: TTcDBCalcEdit
                    Left = 64
                    Top = 191
                    Width = 121
                    Height = 21
                    Checked = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = False
                    TabOrder = 9
                    Visible = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'UREIA'
                    DataSource = dtsAnalises
                  end
                  object edCBT: TTcDBCalcEdit
                    Left = 64
                    Top = 215
                    Width = 121
                    Height = 21
                    Checked = False
                    Color = clSilver
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = False
                    TabOrder = 10
                    Visible = False
                    DecimalPlacesAlwaysShown = False
                    DataField = 'CBT'
                    DataSource = dtsAnalises
                  end
                  object GroupBox1: TGroupBox
                    Left = 1
                    Top = 1
                    Width = 755
                    Height = 40
                    Align = alTop
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 11
                    DesignSize = (
                      755
                      40)
                    object BitBtn2: TTcGDIButton
                      Left = 626
                      Top = 5
                      Width = 126
                      Height = 29
                      Anchors = [akTop, akRight]
                      Caption = 'Remover an'#225'lise selecionada'
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
                        424D380500000000000036000000280000001500000014000000010018000000
                        000002050000120B0000120B000000000000000000008300E58300E58300E5B3
                        B0AFBFBDBC6967A83636B1A3A0A5A4A09F9A96968F8B8B837E7F7D797A949192
                        BBB8B8B4B2B1BAB8B8DDDBDB8300E58300E58300E5008300E58300E58300E5C6
                        C3C37171BF6060D65757D4A3A2B7C6C3C1BBB7B6ADA9A99E9A9A8D898A7B7678
                        716C6DD4D3D2E4E2E1ADAAA9C4C2C18300E58300E5008300E58300E58300E568
                        67B76D6DD97D7DDD5555D38887ADA5A2B79D9BB09592A88B889E98949A908B8C
                        7D787A989495F1F1F0E5E4E3C1BEBDC2C0C08300E5008300E5D9D8DC7676D064
                        64D76F6FDA6F6FDA5F5FD65151D25151D25151D25151D24C4CD16D6BA8A29E9E
                        918D8EA09D9EFAF9F9F2F2F1E7E6E5AEABAAD4D3D200D9D8DC5555CD5A5AD460
                        60D66060D66060D66060D66060D66060D66060D66060D65A5AD47574B2B2AEAD
                        A4A09FBDBABBE0DFE0D9D7D8E1E0E0E8E7E6AAA8A7007575CD5252D25454D354
                        54D35454D35454D35454D35454D35454D35454D35454D35454D37C7BBCC0BCBB
                        B3AFAFA5A1A1959192837E80706B6DA09E9EB8B5B500D9D8DC5E5ED14949D047
                        47D04747D04747D04747D04747D04747D04747D04747D04D4DD18281C4CBC9C7
                        C1BDBCB5B1B0A7A3A2979394868182726D6FADAAAA008300E5D9D8DC6262D341
                        41CE3939CC3939CC4141CE4949D04949D04949D04949D05252D28786CCD5D3D2
                        CCCAC8C2BFBDB6B2B1A8A4A49995958783847A7577008300E58300E5D9D8DC69
                        68CF3D3DCD3232C25555D39F9EDED0D0E8D0CFE8CECDE6CCCBE3CDCCDDDDDCDA
                        D6D4D2CDCBC9C3C0BFB8B4B3AAA6A69B9797817C7D008300E58300E58300E5B5
                        B2B77574D63737CB5757D4B9B8CEEEEDECEEEDECEDECECEBEAEAE8E7E6E4E2E1
                        DEDCDBD7D5D3CFCCCAC4C1C0B9B5B4ACA8A78F8B8B008300E58300E58300E5BA
                        B8B7CCCBCE9493DA6F6FDAD0CFD9ECEBEAEEEDECEEEDECEEEDECECEBEAE9E8E7
                        E5E4E3DFDDDCD8D6D4CFCDCBC6C3C1BAB7B69B9797008300E58300E58300E5B5
                        B2B2CFCCCBD7D5D4DEDDDBE4E3E1E8E7E6ECEBEAEDECECEEEDECEEEDECECEBEA
                        E9E8E7E5E4E3DFDEDCD9D7D5D1CECCC7C4C2A6A2A1008300E58300E58300E5AF
                        ACABC3C0BFCECBCAD6D4D3DDDCDAE3E2E1E8E7E6EBEAE9EDECECEEEDECEEEDEC
                        ECEBEBEAE9E7E5E4E3E0DFDDD9D8D6D1CFCDAFACAB008300E58300E58300E5A8
                        A4A4B7B3B2C2BFBECCCAC8D5D3D2DDDBDAE3E1E0E8E6E5EBEAE9EDECEBEEEDEC
                        EEEDECEDECEBEAE9E8E5E4E3E1DFDEDAD9D7B7B4B3008300E58300E58300E59F
                        9C9CA7A3A3B5B1B0C1BEBCCCC9C7D5D3D1DCDAD9E2E1DFE7E6E5EBEAE9EDECEB
                        EEEDECEEEDECEDECEBEAE9E8E5E4E3E1E0DEBDBABA008300E58300E58300E596
                        9292969292A6A2A1B4B0AFC0BCBBCAC8C6D4D2D0DBDAD8E2E0DFE5E4E3EAE9E8
                        EDECEBEEEDECEEEDECEDECEBEBEAE9E7E6E5C2C0BF008300E58300E58300E58B
                        8788827D7F949090A4A0A0B2AEAEBEBBBAC9C7C5D3D1CFDAD9D7E1DFDEE5E4E3
                        EAE9E8EDECEBEEEDECEEEDECEDECEBEBEAE9C6C4C3008300E58300E58300E580
                        7C7C6C6769807B7D928E8EA29E9EB1ADACBDBAB9C8C6C4D2D0CEDAD8D6E0DFDD
                        E5E4E3EAE9E7ECEBEBEEEDECEEEDECEDECECC9C7C6008300E58300E58300E573
                        6F705550516A65667D797A908C8DA19D9CAFABABBCB8B7C7C4C2D1CFCDD9D7D5
                        DFDEDCE5E4E3E9E8E7ECEBEAEEEDECEEEDECCAC8C8008300E58300E58300E56D
                        6A6A464243585354686364777273858081918D8D9C9897A5A1A1AEAAA9B5B2B1
                        BBB8B7C0BDBDC4C2C1C7C5C4C9C7C7CAC8C8B0ADAD000000}
                      TabOrder = 0
                      OnClick = BitBtn2Click
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
                    object TcGDIButton1: TTcGDIButton
                      Left = 494
                      Top = 5
                      Width = 126
                      Height = 29
                      Anchors = [akTop, akRight]
                      Caption = 'Adicionar an'#225'lise'
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
                        424D380500000000000036000000280000001500000014000000010018000000
                        000002050000120B0000120B000000000000000000008300E58300E58300E5B3
                        B0AFBFBDBC78B78543BC647CAE86A4A09F9A96968F8B8B837E7F7D797A949192
                        BBB8B8B4B2B1BAB8B8DDDBDB8300E58300E58300E5008300E58300E58300E5C6
                        C3C3E4E3E277CB8A83D49D55C87782C08EBBB7B6ADA9A99E9A9A8D898A7B7678
                        716C6DD4D3D2E4E2E1ADAAA9C4C2C18300E58300E500BAD7BEACD3B2ACD3B295
                        BC9BAFD6B55FCA777CD2988FD8A85ACA7D85C191BCB8B7AFABAAA09C9C908B8C
                        7D787A989495F1F1F0E5E4E3C1BEBDC2C0C08300E5005AC87763CD8663CD8663
                        CD8663CD8663CD8679D39882D39E82D39E65CD8688C294BDB9B8B0ACACA29E9E
                        918D8EA09D9EFAF9F9F2F2F1E7E6E5AEABAAD4D3D20061CB7C72D19272D19272
                        D19272D19272D19272D19272D19272D19272D19260CC8399C7A5BEBBB9B2AEAD
                        A4A09FBDBABBE0DFE0D9D7D8E1E0E0E8E7E6AAA8A70068CE8365CD8A65CD8A65
                        CD8A65CD8A65CD8A65CD8A65CD8A65CD8A65CD8A65CD8A65CD8AA2C6A9C0BCBB
                        B3AFAFA5A1A1959192837E80706B6DA09E9EB8B5B5006ECF8957CA7D57CA7D57
                        CA7D57CA7D57CA7D57CA7D57CA7D57CA7D57CA7D63CD8678CC8DD4D2D0CBC9C7
                        C1BDBCB5B1B0A7A3A2979394868182726D6FADAAAA0077D08E59CB7F59CB7F59
                        CB7F59CB7F59CB7F4DC87449C67249C67260CC8582D396E2E1E0DCDBD9D5D3D2
                        CCCAC8C2BFBDB6B2B1A8A4A49995958783847A757700CADFCECFE0D3CFE0D3B4
                        C5B8CFE0D393D6A554C7783EC2685FCB828AD59DEBEAE9E8E7E6E3E2E1DDDCDA
                        D6D4D2CDCBC9C3C0BFB8B4B3AAA6A69B9797817C7D008300E58300E58300E5BF
                        BCBBDFDEDC95D6A34DC67153C673C4E4CCEEEDECEDECECEBEAEAE8E7E6E4E2E1
                        DEDCDBD7D5D3CFCCCAC4C1C0B9B5B4ACA8A78F8B8B008300E58300E58300E5BA
                        B8B7D8D6D499D3A46ECF89AEDCB8ECEBEAEEEDECEEEDECEEEDECECEBEAE9E8E7
                        E4E3E2DFDDDCD8D6D4CFCDCBC6C3C1BAB7B69B9797008300E58300E58300E5B5
                        B2B2CFCCCBD7D5D4DEDDDBE4E3E1E8E7E6ECEBEAEDECECEEEDECEEEDECECEBEA
                        E9E8E7E5E4E2DFDEDCD9D7D5D1CECCC7C4C2A6A2A1008300E58300E58300E5AF
                        ACABC3C0BFCECBCAD6D4D3DDDCDAE3E2E1E8E7E6EBEAE9EDECECEEEDECEEEDEC
                        ECEBEBEAE9E7E5E4E3E0DFDDD9D8D6D1CFCDAFACAB008300E58300E58300E5A8
                        A4A4B7B3B2C2BFBECCCAC8D5D3D2DDDBDAE3E1E0E8E6E5EBEAE9EDECEBEEEDEC
                        EEEDECEDECEBEAE9E8E6E5E4E1DFDEDAD9D7B7B4B3008300E58300E58300E59F
                        9C9CA7A3A3B5B1B0C1BEBCCCC9C7D5D3D1DCDAD9E2E1DFE7E6E5EBEAE9EDECEB
                        EEEDECEEEDECEDECEBEAE9E8E6E5E4E1E0DEBDBABA008300E58300E58300E596
                        9292969292A6A2A1B4B0AFC0BCBBCAC8C6D4D2D0DBDAD8E2E0DFE6E5E4EAE9E8
                        EDECEBEEEDECEEEDECEDECEBEBEAE9E7E6E5C2C0BF008300E58300E58300E58B
                        8788827D7F949090A4A0A0B2AEAEBEBBBAC9C7C5D3D1CFDAD9D7E1DFDEE6E5E4
                        EAE9E8EDECEBEEEDECEEEDECEDECEBEBEAE9C6C4C3008300E58300E58300E580
                        7C7C6C6769807B7D928E8EA29E9EB1ADACBDBAB9C8C6C4D2D0CEDAD8D6E0DFDD
                        E6E4E3EAE9E7ECEBEBEEEDECEEEDECEDECECC9C7C6008300E58300E58300E573
                        6F705550516A65667D797A908C8DA19D9CAFABABBCB8B7C7C4C2D1CFCDD9D7D5
                        DFDEDCE5E4E2E9E8E7ECEBEAEEEDECEEEDECCAC8C8008300E58300E58300E56D
                        6A6A464243585354686364777273858081918D8D9C9897A5A1A1AEAAA9B5B2B1
                        BBB8B7C0BDBDC4C2C1C7C5C4C9C7C7CAC8C8B0ADAD000000}
                      TabOrder = 1
                      OnClick = TcGDIButton1Click
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
              object tbsGrafico: TTabSheet
                Caption = 'Gr'#225'fico'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Panel2: TScrollBox
                  Left = 567
                  Top = 0
                  Width = 195
                  Height = 385
                  Align = alRight
                  BorderStyle = bsNone
                  TabOrder = 1
                  object gbxItensGrafico: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 195
                    Height = 298
                    Align = alTop
                    Caption = 'An'#225'lise do tanque'
                    Color = clWhite
                    ParentBackground = False
                    ParentColor = False
                    TabOrder = 0
                    object ImageProteina: TImage
                      Left = 4
                      Top = 103
                      Width = 15
                      Height = 15
                      Picture.Data = {
                        07544269746D617006030000424D060300000000000036000000280000000F00
                        00000F0000000100180000000000D00200000000000000000000000000000000
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF6600
                        00FFFFB6FFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF3A003AFFDB90FFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000
                        3A000000000000000000903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF000066FFB666FFFFFFFFFFFF0066B6903A00
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF003A
                        90DB903AFFFFFFFFFFFF3A90DB903A00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF0066B6000000000000000000000000FFB666
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
                      Transparent = True
                    end
                    object ImageProducao: TImage
                      Left = 4
                      Top = 64
                      Width = 15
                      Height = 15
                      Picture.Data = {
                        07544269746D617006030000424D060300000000000036000000280000000F00
                        00000F0000000100180000000000D00200000000000000000000000000000000
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003A90DB903A000000000000000000
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FF0066B6B66600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0066B6B66600FFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FF3A90DB903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66B6FF903A00FFFFDBFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FF66B6FF660000FFFFB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66B6FF000000FFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
                      Transparent = True
                    end
                    object ImageCCS: TImage
                      Left = 4
                      Top = 134
                      Width = 15
                      Height = 15
                      Picture.Data = {
                        07544269746D617006030000424D060300000000000036000000280000000F00
                        00000F0000000100180000000000D00200000000000000000000000000000000
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF000000000000FFFFFF
                        FFFFFFFFFFFF000000000000FFFFFF000000FFFFFF000000FFFFFFFFFFFF0000
                        00FFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF00000000
                        0000FFFFFF3A003AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF00003AFFFFFFFFFFFFFFFF
                        FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF00
                        0000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF0000
                        00FFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF00000000
                        0000FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF000000000000FFFFFF
                        FFFFFFFFFFFF000000000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
                      Proportional = True
                      Transparent = True
                    end
                    object ImageGordura: TImage
                      Left = 5
                      Top = 83
                      Width = 15
                      Height = 15
                      Picture.Data = {
                        07544269746D617006030000424D060300000000000036000000280000000F00
                        00000F0000000100180000000000D00200000000000000000000000000000000
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000
                        00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000
                        00FFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000
                        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
                      Transparent = True
                    end
                    object ImageUreia: TImage
                      Left = 4
                      Top = 192
                      Width = 15
                      Height = 15
                      Picture.Data = {
                        07544269746D617006030000424D060300000000000036000000280000000F00
                        00000F0000000100180000000000D00200000000000000000000000000000000
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000
                        00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000
                        00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000
                        00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
                      Transparent = True
                    end
                    object shpProducao: TShape
                      Left = 121
                      Top = 70
                      Width = 65
                      Height = 2
                      Pen.Color = clBlue
                    end
                    object shpGordura: TShape
                      Left = 121
                      Top = 90
                      Width = 65
                      Height = 2
                    end
                    object shpProteina: TShape
                      Left = 121
                      Top = 109
                      Width = 65
                      Height = 2
                    end
                    object shpUreia: TShape
                      Left = 121
                      Top = 199
                      Width = 65
                      Height = 2
                    end
                    object shpCCS: TShape
                      Left = 121
                      Top = 142
                      Width = 65
                      Height = 2
                    end
                    object ImageESD: TImage
                      Left = 4
                      Top = 248
                      Width = 15
                      Height = 15
                      Picture.Data = {
                        07544269746D617006030000424D060300000000000036000000280000000F00
                        00000F0000000100180000000000D00200000000000000000000000000000000
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFF000000000000000000000000FFFFFFFFFFFF000000000000FFFFFF
                        FFFFFF000000000000000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFF
                        FFFFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF00000000
                        0000FFFFFF3A003AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                        FFFFFF3A003AFFFFFFFFFFFF000000000000FFFFFF00003A000000000000FFFF
                        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00003AFFFFFFFFFFFF00000000
                        0000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                        FFFFFF000000FFFFFFFFFFFF000000000000FFFFFF000000FFFFFFFFFFFFFFFF
                        FFFFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF00000000
                        0000FFFFFF000000000000000000000000FFFFFFFFFFFF000000000000FFFFFF
                        FFFFFF000000000000000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
                      Proportional = True
                      Transparent = True
                    end
                    object ImageSolidos: TImage
                      Left = 4
                      Top = 227
                      Width = 15
                      Height = 15
                      Picture.Data = {
                        07544269746D617006030000424D060300000000000036000000280000000F00
                        00000F0000000100180000000000D00200000000000000000000000000000000
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF
                        000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
                        FFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
                        3A003AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
                        FFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF000000000000
                        000000000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
                      Transparent = True
                    end
                    object shpST: TShape
                      Left = 121
                      Top = 234
                      Width = 65
                      Height = 2
                    end
                    object shpESD: TShape
                      Left = 121
                      Top = 254
                      Width = 65
                      Height = 2
                    end
                    object Shape1: TShape
                      Left = 11
                      Top = 126
                      Width = 174
                      Height = 1
                      Pen.Color = clSilver
                    end
                    object Shape2: TShape
                      Left = 11
                      Top = 184
                      Width = 174
                      Height = 1
                      Pen.Color = clSilver
                    end
                    object Shape3: TShape
                      Left = 11
                      Top = 216
                      Width = 174
                      Height = 1
                      Pen.Color = clSilver
                    end
                    object Shape4: TShape
                      Left = 11
                      Top = 48
                      Width = 174
                      Height = 1
                      Pen.Color = clSilver
                    end
                    object Label5: TLabel
                      Left = 8
                      Top = 22
                      Width = 113
                      Height = 13
                      Caption = 'N'#250'mero de an'#225'lises'
                    end
                    object ImageCBT: TImage
                      Left = 4
                      Top = 155
                      Width = 15
                      Height = 15
                      Picture.Data = {
                        07544269746D617006030000424D060300000000000036000000280000000F00
                        00000F0000000100180000000000D00200000000000000000000000000000000
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFF000000000000FFFFFFFFFFFF000000000000000000FFFFFFFFFFFF
                        FFFFFFFFFFFF000000FFFFFFFFFFFF000000000000FFFFFFFFFFFF000000FFFF
                        FF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00
                        00003A003AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF
                        FFFFFFFFFFFF000000FFFFFFFFFFFF00000000003AFFFFFFFFFFFFFFFFFFFFFF
                        FF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00
                        0000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF
                        FFFFFFFFFFFF000000FFFFFFFFFFFF000000000000FFFFFFFFFFFF000000FFFF
                        FF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00
                        0000FFFFFF000000000000FFFFFFFFFFFF000000000000000000FFFFFFFFFFFF
                        000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
                      Proportional = True
                      Transparent = True
                    end
                    object shpCBT: TShape
                      Left = 121
                      Top = 163
                      Width = 65
                      Height = 2
                    end
                    object cbxLactose: TCheckBox
                      Left = 25
                      Top = 62
                      Width = 97
                      Height = 17
                      Caption = 'Lactose'
                      TabOrder = 1
                    end
                    object cbxGordura: TCheckBox
                      Left = 25
                      Top = 81
                      Width = 97
                      Height = 17
                      Caption = 'Gordura'
                      TabOrder = 2
                    end
                    object cbxProteina: TCheckBox
                      Left = 25
                      Top = 101
                      Width = 97
                      Height = 17
                      Caption = 'Prote'#237'na'
                      TabOrder = 3
                    end
                    object cbxUreia: TCheckBox
                      Left = 25
                      Top = 190
                      Width = 97
                      Height = 17
                      Caption = 'Ureia'
                      TabOrder = 6
                    end
                    object cbxCCS: TCheckBox
                      Left = 25
                      Top = 134
                      Width = 97
                      Height = 17
                      Caption = 'CCS'
                      TabOrder = 4
                    end
                    object cbxST: TCheckBox
                      Left = 25
                      Top = 225
                      Width = 97
                      Height = 17
                      Caption = 'Solidos totais'
                      TabOrder = 7
                    end
                    object cbxESD: TCheckBox
                      Left = 25
                      Top = 246
                      Width = 97
                      Height = 17
                      Caption = 'ESD'
                      TabOrder = 8
                    end
                    object edNumAnalises: TJvSpinEdit
                      Left = 129
                      Top = 18
                      Width = 55
                      Height = 21
                      Decimal = 0
                      MaxValue = 60.000000000000000000
                      MinValue = 1.000000000000000000
                      Value = 60.000000000000000000
                      TabOrder = 0
                      OnChange = edNumAnalisesChange
                    end
                    object cbxCBT: TCheckBox
                      Left = 25
                      Top = 155
                      Width = 97
                      Height = 17
                      Caption = 'CBT'
                      TabOrder = 5
                    end
                  end
                end
                object Grafico: TDBChart
                  Left = 0
                  Top = 0
                  Width = 567
                  Height = 385
                  BackWall.Pen.Visible = False
                  Border.Color = clNone
                  Border.Style = psClear
                  BottomWall.Pen.Visible = False
                  BottomWall.Size = 4
                  Foot.Alignment = taLeftJustify
                  Foot.Brush.Style = bsHorizontal
                  Foot.Font.Color = clNavy
                  Foot.Visible = False
                  LeftWall.Pen.Visible = False
                  LeftWall.Size = 4
                  MarginBottom = 10
                  MarginLeft = 0
                  MarginRight = 200
                  MarginTop = 10
                  MarginUnits = muPixels
                  PrintProportional = False
                  Title.Alignment = taLeftJustify
                  Title.AutoSize = False
                  Title.Color = clInfoBk
                  Title.Font.Color = clNavy
                  Title.Font.Height = -19
                  Title.Frame.Color = -8355712
                  Title.Frame.Width = 12
                  Title.Shadow.HorizSize = 0
                  Title.Shadow.VertSize = 0
                  Title.Text.Strings = (
                    'An'#225'lise do Tanque')
                  Title.Transparent = False
                  Title.AdjustFrame = False
                  BottomAxis.Axis.Color = clSilver
                  BottomAxis.DateTimeFormat = 'dd/MM/yyyy'
                  BottomAxis.ExactDateTime = False
                  BottomAxis.Grid.Color = 13421772
                  BottomAxis.Grid.Visible = False
                  BottomAxis.LabelsAngle = 20
                  BottomAxis.LabelsBehind = True
                  BottomAxis.LabelsFormat.Font.Color = clSilver
                  BottomAxis.LabelsFormat.Margins.Left = 0
                  BottomAxis.LabelsFormat.Margins.Top = 0
                  BottomAxis.LabelsFormat.Margins.Right = 0
                  BottomAxis.LabelsFormat.Margins.Bottom = 0
                  BottomAxis.LabelsFormat.Margins.Units = maPercentSize
                  BottomAxis.MinorTicks.Color = clSilver
                  BottomAxis.RoundFirstLabel = False
                  BottomAxis.Ticks.Color = clSilver
                  BottomAxis.TicksInner.Color = clSilver
                  BottomAxis.Title.Caption = 'Data da an'#225'lise'
                  BottomAxis.Title.Font.Color = clGray
                  BottomAxis.Title.Font.Style = [fsBold]
                  Chart3DPercent = 6
                  CustomAxes = <
                    item
                      Axis.Color = clRed
                      Axis.EndStyle = esSquare
                      ExactDateTime = False
                      Grid.Visible = False
                      Horizontal = False
                      OtherSide = True
                      LabelsFormat.Font.Color = clSilver
                      LabelsFormat.Frame.Width = 0
                      LabelsFormat.Margins.Left = 100
                      LabelsFormat.Margins.Top = 100
                      LabelsFormat.Margins.Right = 100
                      LabelsFormat.Margins.Bottom = 100
                      LabelsFormat.Margins.Units = maPixels
                      LabelsSize = 9
                      LogarithmicBase = 2.718281828459050000
                      MinorTickCount = 0
                      MinorTicks.Visible = False
                      PositionPercent = -10.000000000000000000
                      PositionUnits = muPixels
                      Ticks.Color = clRed
                      Ticks.Width = 2
                      Title.Angle = 90
                      Title.Caption = 'CCS'
                      Title.Font.Color = clRed
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Title.Font.Emboss.Color = 7039851
                      Title.Font.Emboss.HorizSize = -1
                      Title.Font.Emboss.VertSize = -1
                      Title.Font.Shadow.Smooth = False
                      Title.Font.Shadow.Visible = False
                      Title.Brush.Style = bsClear
                      Title.Pen.Color = clScrollBar
                      Title.Pen.Style = psDash
                      Title.Pen.Width = 20
                      Title.Pen.EndStyle = esFlat
                      Title.Pen.JoinStyle = jsMitter
                      Title.Shadow.Visible = False
                      Title.ShapeCallout.Size = 17
                      Title.Transparent = False
                      ZPosition = 0.010000000000000000
                    end
                    item
                      Axis.Color = clMaroon
                      Axis.EndStyle = esSquare
                      ExactDateTime = False
                      Grid.Visible = False
                      Horizontal = False
                      OtherSide = True
                      LabelsFormat.Font.Color = clSilver
                      LabelsSize = 9
                      MinorTicks.Visible = False
                      PositionPercent = -60.000000000000000000
                      PositionUnits = muPixels
                      Ticks.Color = clMaroon
                      Ticks.Width = 2
                      TicksInner.Width = 2
                      TicksInner.SmallDots = True
                      Title.Angle = 90
                      Title.Caption = 'Ur'#233'ia'
                      Title.Font.Color = clMaroon
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Title.Brush.Style = bsClear
                      Title.Pen.Color = clScrollBar
                      Title.Pen.Width = 20
                      Title.Transparent = False
                      ZPosition = 0.010000000000000000
                    end
                    item
                      Axis.Color = 51400
                      Axis.EndStyle = esSquare
                      ExactDateTime = False
                      Grid.Visible = False
                      Horizontal = False
                      OtherSide = True
                      LabelsFormat.Font.Color = clSilver
                      LabelsSize = 9
                      LabelStyle = talValue
                      MaximumOffset = 6
                      MinorTicks.Visible = False
                      PositionPercent = -110.000000000000000000
                      PositionUnits = muPixels
                      Ticks.Color = clNavy
                      Ticks.Width = 2
                      Title.Angle = 90
                      Title.Caption = 'S'#243'lidos totais / ESD'
                      Title.Font.Color = clOlive
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Title.Brush.Style = bsClear
                      Title.Pen.Color = clScrollBar
                      Title.Pen.Width = 20
                      Title.Transparent = False
                      ZPosition = 0.010000000000000000
                    end>
                  DepthAxis.Grid.Color = clGray
                  DepthTopAxis.Grid.Color = clGray
                  Frame.Visible = False
                  LeftAxis.Axis.Color = clSilver
                  LeftAxis.ExactDateTime = False
                  LeftAxis.Grid.Color = clGray
                  LeftAxis.Grid.Visible = False
                  LeftAxis.LabelsFormat.Font.Color = clSilver
                  LeftAxis.LogarithmicBase = 2.718281828459050000
                  LeftAxis.MinorTicks.Color = clSilver
                  LeftAxis.Ticks.Color = clSilver
                  LeftAxis.TicksInner.Color = clSilver
                  LeftAxis.Title.Caption = 'Lactose / Gordura / Prote'#237'na'
                  LeftAxis.Title.Font.Color = clGray
                  LeftAxis.Title.Font.Style = [fsBold]
                  LeftAxis.Title.ShapeCallout.Position = 0
                  LeftAxis.TitleSize = 25
                  Legend.Alignment = laBottom
                  Legend.Color = clInfoBk
                  Legend.ColorWidth = 27
                  Legend.DividingLines.Color = clWhite
                  Legend.Font.Color = clNavy
                  Legend.Font.Height = -13
                  Legend.Frame.Color = clGray
                  Legend.Frame.Visible = False
                  Legend.LegendStyle = lsSeries
                  Legend.Shadow.Color = 13421772
                  Legend.Shadow.HorizSize = 0
                  Legend.Shadow.Transparency = 0
                  Legend.Shadow.VertSize = 0
                  Legend.Symbol.Width = 27
                  Legend.TextStyle = ltsPlain
                  Legend.TopPos = 20
                  Legend.Visible = False
                  RightAxis.Grid.Color = clGray
                  TopAxis.Grid.Color = clGray
                  View3D = False
                  View3DWalls = False
                  Zoom.Animated = True
                  OnAfterDraw = GraficoAfterDraw
                  Align = alClient
                  BevelOuter = bvNone
                  Color = clWhite
                  TabOrder = 0
                  OnMouseMove = GraficoMouseMove
                  DefaultCanvas = 'TGDIPlusCanvas'
                  PrintMargins = (
                    15
                    5
                    21
                    5)
                  ColorPaletteIndex = 0
                  object Lactose: TLineSeries
                    SeriesColor = clBlue
                    Title = 'Lactose'
                    Brush.Color = clBlue
                    Brush.BackColor = clDefault
                    ClickableLine = False
                    Dark3D = False
                    LinePen.Color = clBlue
                    LinePen.Width = 2
                    Pointer.InflateMargins = True
                    Pointer.Style = psRectangle
                    XValues.DateTime = True
                    XValues.Name = 'X'
                    XValues.Order = loAscending
                    YValues.Name = 'Y'
                    YValues.Order = loNone
                    YValues.ValueSource = 'Y'
                    object TeeFunction1: TExpMovAveFunction
                      Period = 3.000000000000000000
                      PeriodStyle = psRange
                    end
                  end
                  object Gordura: TLineSeries
                    SeriesColor = 33023
                    Title = 'Gordura'
                    Brush.Color = clBlue
                    Brush.BackColor = clDefault
                    ClickableLine = False
                    Dark3D = False
                    LinePen.Color = clBlue
                    LinePen.Width = 2
                    Pointer.InflateMargins = True
                    Pointer.Style = psRectangle
                    XValues.DateTime = True
                    XValues.Name = 'X'
                    XValues.Order = loAscending
                    YValues.Name = 'Y'
                    YValues.Order = loNone
                    YValues.ValueSource = 'Y'
                    object TeeFunction2: TExpMovAveFunction
                      Period = 10.000000000000000000
                    end
                  end
                  object Proteina: TLineSeries
                    SeriesColor = clAqua
                    Title = 'Proteina'
                    Brush.Color = clBlue
                    Brush.BackColor = clDefault
                    ClickableLine = False
                    Dark3D = False
                    LinePen.Color = clBlue
                    LinePen.Width = 2
                    Pointer.InflateMargins = True
                    Pointer.Style = psRectangle
                    XValues.DateTime = True
                    XValues.Name = 'X'
                    XValues.Order = loAscending
                    YValues.Name = 'Y'
                    YValues.Order = loNone
                    YValues.ValueSource = 'Y'
                    object TeeFunction3: TExpMovAveFunction
                      Period = 10.000000000000000000
                    end
                  end
                  object CCS: TLineSeries
                    Marks.Callout.Length = 0
                    VertAxis = aCustomVertAxis
                    Brush.BackColor = clDefault
                    ClickableLine = False
                    LinePen.Width = 2
                    Pointer.InflateMargins = True
                    Pointer.Style = psSmallDot
                    XValues.DateTime = True
                    XValues.Name = 'X'
                    XValues.Order = loAscending
                    YValues.Name = 'Y'
                    YValues.Order = loNone
                    CustomVertAxis = 0
                    Data = {
                      001900000000000000002072400000000000D076400000000000087640000000
                      0000706C4000000000007072400000000000F876400000000000607840000000
                      0000A07E400000000000CC804000000000004882400000000000B88540000000
                      00002884400000000000BC86400000000000E486400000000000948640000000
                      000070874000000000002488400000000000BC8B400000000000D48740000000
                      00002889400000000000E4864000000000003C844000000000006C8640000000
                      00003C89400000000000288940}
                  end
                  object CBT: TLineSeries
                    Marks.Callout.Length = 0
                    SeriesColor = 16711808
                    Title = 'CBT'
                    VertAxis = aCustomVertAxis
                    Brush.BackColor = clDefault
                    ClickableLine = False
                    LinePen.Width = 2
                    Pointer.InflateMargins = True
                    Pointer.Style = psSmallDot
                    XValues.DateTime = True
                    XValues.Name = 'X'
                    XValues.Order = loAscending
                    YValues.Name = 'Y'
                    YValues.Order = loNone
                    CustomVertAxis = 0
                    Data = {
                      001900000000000000002072400000000000D076400000000000087640000000
                      0000706C4000000000007072400000000000F876400000000000607840000000
                      0000A07E400000000000CC804000000000004882400000000000B88540000000
                      00002884400000000000BC86400000000000E486400000000000948640000000
                      000070874000000000002488400000000000BC8B400000000000D48740000000
                      00002889400000000000E4864000000000003C844000000000006C8640000000
                      00003C89400000000000288940}
                  end
                  object Ureia: TLineSeries
                    Marks.Shadow.Color = 8618883
                    Marks.Transparent = True
                    Marks.Style = smsValue
                    Marks.Callout.Length = 23
                    Marks.Clip = True
                    DataSource = Zoo_BancoDadosTanquesDatamodule.cdsAnalisesPeriodo
                    VertAxis = aCustomVertAxis
                    Brush.BackColor = clDefault
                    ClickableLine = False
                    LinePen.Width = 2
                    Pointer.InflateMargins = True
                    Pointer.Style = psSmallDot
                    XValues.DateTime = True
                    XValues.Name = 'X'
                    XValues.Order = loAscending
                    XValues.ValueSource = 'DATA'
                    YValues.Name = 'Y'
                    YValues.Order = loNone
                    YValues.ValueSource = 'UREIA'
                    CustomVertAxis = 1
                  end
                  object Solidos: TLineSeries
                    Marks.Shadow.Color = 8618883
                    Marks.Transparent = True
                    Marks.Style = smsValue
                    Marks.Callout.Length = 23
                    Marks.Clip = True
                    DataSource = Zoo_BancoDadosTanquesDatamodule.cdsAnalisesPeriodo
                    Title = 'S'#243'lidos totais'
                    VertAxis = aCustomVertAxis
                    Brush.BackColor = clDefault
                    ClickableLine = False
                    LinePen.Width = 2
                    Pointer.HorizSize = 5
                    Pointer.InflateMargins = True
                    Pointer.Style = psSmallDot
                    Pointer.VertSize = 5
                    XValues.DateTime = True
                    XValues.Name = 'X'
                    XValues.Order = loAscending
                    XValues.ValueSource = 'DATA'
                    YValues.Name = 'Y'
                    YValues.Order = loNone
                    YValues.ValueSource = 'GORDURA'
                    CustomVertAxis = 2
                  end
                  object ESD: TLineSeries
                    Marks.Callout.Length = 0
                    SeriesColor = 51400
                    Title = 'ESD'
                    VertAxis = aCustomVertAxis
                    Brush.BackColor = clDefault
                    ClickableLine = False
                    LinePen.Width = 2
                    Pointer.HorizSize = 5
                    Pointer.InflateMargins = True
                    Pointer.Style = psSmallDot
                    Pointer.VertSize = 5
                    XValues.DateTime = True
                    XValues.Name = 'X'
                    XValues.Order = loAscending
                    XValues.ValueSource = 'DATA'
                    YValues.Name = 'Y'
                    YValues.Order = loNone
                    YValues.ValueSource = 'PROTEINA'
                    CustomVertAxis = 2
                    Data = {
                      00190000000000000000A8714000000000009872400000000000787940000000
                      0000F079400000000000E0754000000000000871400000000000087140000000
                      0000B063400000000000806B400000000000A871400000000000087640000000
                      0000B06D400000000000005E400000000000405A400000000000206240000000
                      0000E06A400000000000605D400000000000C057400000000000206740000000
                      000090704000000000004075400000000000F079400000000000A48040000000
                      0000107D400000000000D07640}
                  end
                  object GridBandTool1: TGridBandTool
                    Band1.Color = 15329769
                    AxisID = 2
                  end
                  object ChartTool1: TGridBandTool
                    Band1.Color = 15329769
                    AxisID = 6
                  end
                  object ChartTool2: TGridBandTool
                    Band1.Color = 552200681
                    AxisID = 7
                  end
                  object ChartTool3: TGridBandTool
                    Band1.Color = 552200681
                    AxisID = 8
                  end
                end
                object TcMPFloatingPanel1: TTcFloatingPanel
                  Left = 494
                  Top = 304
                  Width = 593
                  Height = 200
                  Caption = ''
                  BevelOuter = bvNone
                  BorderWidth = 1
                  Constraints.MinHeight = 27
                  Constraints.MinWidth = 120
                  DoubleBuffered = True
                  DragMode = dmAutomatic
                  ParentBackground = False
                  ParentDoubleBuffered = False
                  TabOrder = 2
                  object JvDBUltimGrid2: TJvDBUltimGrid
                    Left = 1
                    Top = 20
                    Width = 577
                    Height = 165
                    Align = alClient
                    DataSource = dtsAnalisesPeriodo
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clBlack
                    TitleFont.Height = -11
                    TitleFont.Name = 'Verdana'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 444
    Width = 914
    ExplicitTop = 444
    ExplicitWidth = 914
    inherited _imageBottom: TImage
      Width = 914
      ExplicitWidth = 913
    end
    inherited _ToolBar: TToolBar
      Left = 110
      ExplicitLeft = 110
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = Zoo_BancoDadosTanquesDatamodule.cdsTanque
    OnDataChange = dtsFichaDataChange
    Left = 571
    Top = 4
  end
  inherited dtsLista: TDataSource
    DataSet = Zoo_BancoDadosTanquesDatamodule.cdsLstTanques
    Left = 523
    Top = 2
  end
  inherited ToolBarIcons: TImageListProvider
    Left = 471
    Top = 4
  end
  object dtsAnalises: TDataSource
    DataSet = Zoo_BancoDadosTanquesDatamodule.cdsAnalises
    Left = 628
    Top = 2
  end
  object JvTabDefaultPainter1: TJvTabDefaultPainter
    ActiveFont.Charset = DEFAULT_CHARSET
    ActiveFont.Color = 12546560
    ActiveFont.Height = -11
    ActiveFont.Name = 'Verdana'
    ActiveFont.Style = [fsBold]
    ActiveColorTo = 15389113
    InactiveFont.Charset = DEFAULT_CHARSET
    InactiveFont.Color = clWindowText
    InactiveFont.Height = -11
    InactiveFont.Name = 'Verdana'
    InactiveFont.Style = []
    InactiveColorFrom = 15389113
    InactiveColorTo = clWhite
    DisabledFont.Charset = DEFAULT_CHARSET
    DisabledFont.Color = clGrayText
    DisabledFont.Height = -11
    DisabledFont.Name = 'Verdana'
    DisabledFont.Style = []
    DisabledColorFrom = 14145495
    DisabledColorTo = 11382189
    Left = 686
    Top = 1
  end
  object dtsAnalisesPeriodo: TDataSource
    DataSet = Zoo_BancoDadosTanquesDatamodule.cdsAnalisesPeriodo
    Left = 65520
    Top = 65515
  end
  object TeeGDIPlus1: TTeeGDIPlus
    Active = True
    AntiAliasText = gpfClearType
    TeePanel = Grafico
    Left = 344
    Top = 91
  end
end
