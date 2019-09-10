inherited Zoo_ReproducaoCiosCoberturasWizard: TZoo_ReproducaoCiosCoberturasWizard
  Left = 281
  Top = 116
  Caption = 'Cios / Coberturas'
  ClientHeight = 509
  ClientWidth = 1049
  ActionList.Left = 106
  ActionList.Top = 3
  ExplicitLeft = -86
  ExplicitTop = -88
  ExplicitWidth = 1055
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 1049
    Height = 509
    ExplicitWidth = 1049
    ExplicitHeight = 509
    inherited _pnlFooter: TJvPanel
      Top = 478
      Width = 1045
      ExplicitTop = 478
      ExplicitWidth = 1045
      inherited _imageBottom: TImage
        Width = 1045
        ExplicitWidth = 932
      end
      inherited _btbPrior: TTcGDIButton
        Left = 854
        ExplicitLeft = 854
      end
      inherited _btbCancel: TTcGDIButton
        Visible = False
      end
      inherited _btbNext: TTcGDIButton
        Left = 945
        ExplicitLeft = 945
      end
      inherited _btbExecute: TTcGDIButton
        Left = 960
        ExplicitLeft = 960
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 1045
      Height = 476
      ExplicitWidth = 1045
      ExplicitHeight = 476
      inherited PageControl: TJvPageControl
        Width = 1045
        Height = 476
        ActivePage = TabSheet1
        ExplicitWidth = 1045
        ExplicitHeight = 476
        object TabSheet1: TTabSheet
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'TabSheet1'
          object GroupBox1: TGroupBox
            Left = 0
            Top = 17
            Width = 1045
            Height = 76
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            TabOrder = 0
            Visible = False
            object pnlPadraoVariavel: TPanel
              Left = 265
              Top = 15
              Width = 778
              Height = 59
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alClient
              BevelOuter = bvNone
              Caption = ' '
              ParentColor = True
              TabOrder = 1
              object pnlPadraoFuncionario: TPanel
                Left = 191
                Top = 0
                Width = 135
                Height = 59
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alLeft
                BevelOuter = bvNone
                Caption = ' '
                ParentColor = True
                TabOrder = 2
                object lblEdPadraoFuncionario: TLabel
                  Left = 4
                  Top = 4
                  Width = 73
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  AutoSize = False
                  Caption = '  Funcion'#225'rio'
                end
                object edPadraoNomeFuncionario: TJvComboEdit
                  Left = 8
                  Top = 24
                  Width = 116
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  ButtonWidth = 15
                  ImageKind = ikEllipsis
                  TabOrder = 0
                  Text = ''
                  OnButtonClick = edPadraoNomeFuncionarioButtonClick
                  OnChange = edPadraoNomeFuncionarioChange
                  OnKeyPress = edPadraoNomeFuncionarioKeyPress
                end
              end
              object pnlEventoPadrao: TPanel
                Left = 0
                Top = 0
                Width = 124
                Height = 59
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alLeft
                BevelOuter = bvNone
                Caption = ' '
                ParentColor = True
                TabOrder = 0
                object Label2: TLabel
                  Left = 11
                  Top = 4
                  Width = 34
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Evento'
                end
                object lcbPadraoEvento: TDBLookupComboBox
                  Left = 11
                  Top = 24
                  Width = 81
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  KeyField = 'VALOR'
                  ListField = 'DESCRICAO'
                  ListSource = dtsTipoEventoPadrao
                  TabOrder = 0
                  OnCloseUp = lcbPadraoEventoCloseUp
                  OnKeyDown = lcbPadraoEventoKeyDown
                end
              end
              object pnlPadraoDoses: TPanel
                Left = 124
                Top = 0
                Width = 67
                Height = 59
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alLeft
                BevelOuter = bvNone
                Caption = ' '
                ParentColor = True
                TabOrder = 1
                object lblEdPadraoDoses: TLabel
                  Left = 0
                  Top = 4
                  Width = 35
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = '  Doses'
                end
                object edPadraoDoses: TJvSpinEdit
                  Left = 6
                  Top = 22
                  Width = 40
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Value = 1.000000000000000000
                  TabOrder = 0
                end
              end
              object pnlPadraoIATF: TPanel
                Left = 326
                Top = 0
                Width = 152
                Height = 59
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alLeft
                BevelOuter = bvNone
                Caption = ' '
                ParentColor = True
                TabOrder = 3
                object Label1: TLabel
                  Left = 0
                  Top = 0
                  Width = 141
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Alignment = taRightJustify
                  AutoSize = False
                end
                object Label3: TLabel
                  Left = 14
                  Top = 4
                  Width = 71
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Protocolo IATF'
                end
                object chkPadraoIATF: TCheckBox
                  Left = 79
                  Top = 2
                  Width = 112
                  Height = 17
                  TabStop = False
                  Caption = 'Protocolo IATF'
                  TabOrder = 0
                  Visible = False
                end
                object lcbPadraoProtocoloIATF: TDBLookupComboBox
                  Left = 14
                  Top = 24
                  Width = 120
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  KeyField = 'KZOO_PROTOCOLO'
                  ListField = 'CODIGO'
                  ListSource = dtsProtocolosIATFPadrao
                  TabOrder = 1
                  OnKeyDown = lcbPadraoProtocoloIATFKeyDown
                end
              end
            end
            object Panel1: TPanel
              Left = 2
              Top = 15
              Width = 263
              Height = 59
              Align = alLeft
              BevelOuter = bvNone
              Caption = ' '
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object lblEdPadraoData: TLabel
                Left = 13
                Top = 4
                Width = 23
                Height = 13
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = '&Data'
                FocusControl = dePadraoDataEvento
              end
              object _lblEdPadraoMuco: TLabel
                Left = 314
                Top = 0
                Width = 25
                Height = 13
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Muco'
                Visible = False
              end
              object lblEdPadraoMacho: TLabel
                Left = 114
                Top = 4
                Width = 108
                Height = 13
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                AutoSize = False
                Caption = '   Touro (xxxxxxx)'
              end
              object dePadraoDataEvento: TTcDateEdit
                Left = 12
                Top = 24
                Width = 91
                Height = 21
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Checked = False
                CheckOnExit = False
                ButtonWidth = 17
                TabOrder = 0
              end
              object _lcbPadraoMuco: TDBLookupComboBox
                Left = 314
                Top = 17
                Width = 92
                Height = 21
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Enabled = False
                KeyField = 'VALOR'
                ListField = 'DESCRICAO'
                ListSource = dtsTipoMucoPadrao
                TabOrder = 1
                Visible = False
                OnKeyDown = _lcbPadraoMucoKeyDown
              end
              object edPadraoNomeAnimalMacho: TJvComboEdit
                Left = 123
                Top = 24
                Width = 129
                Height = 21
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                ButtonWidth = 15
                ImageKind = ikEllipsis
                TabOrder = 2
                Text = ''
                OnButtonClick = edPadraoNomeAnimalMachoButtonClick
                OnChange = edPadraoNomeAnimalMachoChange
                OnExit = edPadraoNomeAnimalMachoExit
                OnKeyPress = edPadraoNomeAnimalMachoKeyPress
              end
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 93
            Width = 1045
            Height = 71
            Align = alTop
            Caption = ' '
            ParentColor = True
            TabOrder = 1
            object gbxQuickEdit: TGroupBox
              Left = 1
              Top = 1
              Width = 915
              Height = 69
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 5
              Align = alClient
              Caption = 'Entrada de dados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object pnlQuickEdit: TPanel
                Left = 2
                Top = 15
                Width = 243
                Height = 52
                Align = alLeft
                BevelOuter = bvNone
                Caption = ' '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = True
                ParentFont = False
                TabOrder = 0
                object Label12: TLabel
                  Left = 137
                  Top = 2
                  Width = 23
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Data'
                end
                object _Label16: TLabel
                  Left = 356
                  Top = 5
                  Width = 25
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Muco'
                  FocusControl = _lcMuco
                end
                object Label7: TLabel
                  Left = 13
                  Top = 2
                  Width = 32
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = '&F'#234'mea'
                  FocusControl = edtBrinco
                end
                object deData: TTcDBDateEdit
                  Left = 137
                  Top = 21
                  Width = 98
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Checked = False
                  DataField = 'DATAEVENTO'
                  DataSource = dtsEventosReprodutivos
                  CheckOnExit = False
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ButtonWidth = 17
                  ParentFont = False
                  TabOrder = 1
                  OnKeyPress = deDataKeyPress
                end
                object _lcMuco: TDBLookupComboBox
                  Left = 356
                  Top = 21
                  Width = 86
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'DESC_MUCO'
                  DataSource = dtsEventosReprodutivos
                  Enabled = False
                  TabOrder = 2
                  OnKeyDown = _lcMucoKeyDown
                  OnKeyPress = _lcMucoKeyPress
                end
                object edtBrinco: TJvComboEdit
                  Left = 12
                  Top = 21
                  Width = 107
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  ButtonWidth = 15
                  ImageKind = ikEllipsis
                  TabOrder = 0
                  Text = ''
                  OnButtonClick = edtBrincoButtonClick
                  OnChange = edtBrincoChange
                  OnEnter = edtBrincoEnter
                  OnKeyDown = edtBrincoKeyDown
                  OnKeyPress = edtBrincoKeyPress
                end
              end
              object pnlVariavel: TPanel
                Left = 245
                Top = 15
                Width = 668
                Height = 52
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alClient
                BevelOuter = bvNone
                Caption = ' '
                ParentColor = True
                TabOrder = 1
                object pnlFuncionario: TPanel
                  Left = 150
                  Top = 0
                  Width = 153
                  Height = 52
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Align = alLeft
                  BevelOuter = bvNone
                  Caption = ' '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentColor = True
                  ParentFont = False
                  TabOrder = 1
                  object lblEdFuncionario: TLabel
                    Left = 4
                    Top = 2
                    Width = 77
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    AutoSize = False
                    Caption = '   Funcion'#225'rio'
                    FocusControl = edFuncionario
                  end
                  object edFuncionario: TJvDBComboEdit
                    Left = 11
                    Top = 21
                    Width = 133
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DataField = 'NOMEFUNCIONARIO'
                    DataSource = dtsEventosReprodutivos
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    TabOrder = 0
                    OnButtonClick = edFuncionarioButtonClick
                    OnChange = edFuncionarioChange
                    OnKeyPress = edFuncionarioKeyPress
                    OnKeyUp = edFuncionarioKeyUp
                  end
                end
                object pnlEvento: TPanel
                  Left = 303
                  Top = 0
                  Width = 108
                  Height = 52
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Align = alLeft
                  BevelOuter = bvNone
                  Caption = ' '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentColor = True
                  ParentFont = False
                  TabOrder = 2
                  object Label14: TLabel
                    Left = 20
                    Top = 2
                    Width = 34
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Evento'
                  end
                  object lcEvento: TDBLookupComboBox
                    Left = 20
                    Top = 21
                    Width = 80
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DataField = 'DESC_EVENTO'
                    DataSource = dtsEventosReprodutivos
                    TabOrder = 0
                    OnCloseUp = lcEventoCloseUp
                    OnKeyDown = lcEventoKeyDown
                    OnKeyPress = lcEventoKeyPress
                  end
                end
                object pnlDoses: TPanel
                  Left = 411
                  Top = 0
                  Width = 60
                  Height = 52
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Align = alLeft
                  BevelOuter = bvNone
                  Caption = ' '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentColor = True
                  ParentFont = False
                  TabOrder = 3
                  object lblEdDoses: TLabel
                    Left = 4
                    Top = 2
                    Width = 41
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = '    Doses'
                    FocusControl = edDoses
                  end
                  object edDoses: TJvDBCalcEdit
                    Left = 16
                    Top = 21
                    Width = 36
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DecimalPlaces = 0
                    DisplayFormat = '0'
                    MaxValue = 4.000000000000000000
                    ShowButton = False
                    TabOrder = 0
                    DecimalPlacesAlwaysShown = False
                    OnKeyPress = edDosesKeyPress
                    DataField = 'DOSES'
                    DataSource = dtsEventosReprodutivos
                  end
                end
                object pnlIATF: TPanel
                  Left = 471
                  Top = 0
                  Width = 156
                  Height = 52
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Align = alLeft
                  BevelOuter = bvNone
                  Caption = ' '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentColor = True
                  ParentFont = False
                  TabOrder = 4
                  Visible = False
                  object Label4: TLabel
                    Left = 19
                    Top = 2
                    Width = 71
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    Caption = 'Protocolo IATF'
                  end
                  object chkIATF: TDBCheckBox
                    Left = 72
                    Top = -1
                    Width = 89
                    Height = 17
                    Caption = 'Protocolo IATF   '
                    DataField = 'IATF'
                    DataSource = dtsEventosReprodutivos
                    Enabled = False
                    TabOrder = 0
                    ValueChecked = 'T'
                    ValueUnchecked = 'F'
                    Visible = False
                    OnKeyPress = chkIATFKeyPress
                  end
                  object lcProtocoloIATF: TDBLookupComboBox
                    Left = 19
                    Top = 21
                    Width = 120
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DataField = 'DESC_PROTOCOLO_IATF'
                    DataSource = dtsEventosReprodutivos
                    TabOrder = 1
                    OnKeyDown = lcProtocoloIATFKeyDown
                    OnKeyPress = lcProtocoloIATFKeyPress
                  end
                end
                object pnlMacho: TPanel
                  Left = 0
                  Top = 0
                  Width = 150
                  Height = 52
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Align = alLeft
                  BevelOuter = bvNone
                  Caption = ' '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentColor = True
                  ParentFont = False
                  TabOrder = 0
                  object lblEdMacho: TLabel
                    Left = 4
                    Top = 2
                    Width = 97
                    Height = 13
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    AutoSize = False
                    Caption = '   Touro (xxxxxxx)'
                    FocusControl = edMacho
                  end
                  object edMacho: TJvDBComboEdit
                    Left = 11
                    Top = 21
                    Width = 130
                    Height = 21
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    DataField = 'NOMEMACHO'
                    DataSource = dtsEventosReprodutivos
                    ImageKind = ikEllipsis
                    ButtonWidth = 15
                    TabOrder = 0
                    OnButtonClick = edMachoButtonClick
                    OnChange = edMachoChange
                    OnEnter = edMachoEnter
                    OnKeyPress = edMachoKeyPress
                    OnKeyUp = edMachoKeyUp
                  end
                end
              end
            end
            object Panel5: TPanel
              Left = 916
              Top = 1
              Width = 128
              Height = 69
              Align = alRight
              BevelOuter = bvNone
              Caption = ' '
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object BitBtn2: TTcGDIButton
                Left = 2
                Top = 25
                Width = 126
                Height = 29
                Caption = 'Remover evento selecionado'
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
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 164
            Width = 1045
            Height = 289
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alClient
            BorderWidth = 1
            Caption = '_pnldbgLista'
            Color = clSilver
            ParentBackground = False
            TabOrder = 2
            object JvDBUltimGrid1: TJvDBUltimGrid
              Left = 2
              Top = 2
              Width = 1041
              Height = 285
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtsEventosReprodutivos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Verdana'
              TitleFont.Style = []
              OnEditButtonClick = JvDBUltimGrid1EditButtonClick
              OnKeyDown = JvDBUltimGrid1KeyDown
              OnKeyPress = JvDBUltimGrid1KeyPress
              AutoAppend = False
              OnShowEditor = JvDBUltimGrid1ShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <
                item
                  ControlName = 'degData'
                  FieldName = 'DATAEVENTO'
                  FitCell = fcCellSize
                  LeaveOnEnterKey = True
                  LeaveOnUpDownKey = True
                end
                item
                  ControlName = 'DBMemo1'
                  FieldName = 'OBS_EVENTO'
                  FitCell = fcDesignSize
                  LeaveOnEnterKey = True
                end>
              RowsHeight = 17
              TitleRowHeight = 20
              OnCheckIfBooleanField = JvDBUltimGrid1CheckIfBooleanField
              ReadOnlyCellColor = clBtnFace
              Columns = <
                item
                  Expanded = False
                  FieldName = 'BRINCO'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMEESTABULO'
                  ReadOnly = True
                  Title.Caption = 'F'#234'mea'
                  Width = 121
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATAEVENTO'
                  Width = 87
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_EVENTO'
                  Width = 67
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DOSES'
                  Width = 37
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_MUCO'
                  Width = 56
                  Visible = True
                end
                item
                  ButtonStyle = cbsEllipsis
                  Expanded = False
                  FieldName = 'NOMEMACHO'
                  Width = 116
                  Visible = True
                end
                item
                  ButtonStyle = cbsEllipsis
                  Expanded = False
                  FieldName = 'NOMEFUNCIONARIO'
                  Title.Caption = 'Funcion'#225'rio'
                  Width = 126
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBS_EVENTO'
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOTE'
                  ReadOnly = True
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IATF'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'DESC_PROTOCOLO_IATF'
                  Visible = True
                end>
            end
            object degData: TTcDBDateEdit
              Left = 160
              Top = 127
              Width = 98
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Checked = False
              DataField = 'DATAEVENTO'
              DataSource = dtsEventosReprodutivos
              CheckOnExit = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 17
              ParentFont = False
              TabOrder = 1
              Visible = False
            end
            object DBMemo1: TDBMemo
              Left = 302
              Top = 67
              Width = 186
              Height = 89
              DataField = 'OBS_EVENTO'
              DataSource = dtsEventosReprodutivos
              TabOrder = 2
              Visible = False
            end
          end
          object CheckBox1: TCheckBox
            Left = 0
            Top = 0
            Width = 1045
            Height = 17
            Align = alTop
            Caption = 'Informar dados para digita'#231#227'o r'#225'pida'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = CheckBox1Click
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 106
    Top = 3
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object dtsEventosReprodutivos: TDataSource
    DataSet = Zoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivos
    OnDataChange = dtsEventosReprodutivosDataChange
    Left = 305
    Top = 65535
  end
  object dtsTipoEvento: TDataSource
    DataSet = Zoo_ReproducaoCiosCoberturasDatamodule.cdsTipoEvento
    Left = 157
    Top = 201
  end
  object dtsTipoMuco: TDataSource
    DataSet = Zoo_ReproducaoCiosCoberturasDatamodule.cdsTipoMuco
    Left = 553
    Top = 201
  end
  object dtsTipoEventoPadrao: TDataSource
    DataSet = Zoo_ReproducaoCiosCoberturasDatamodule.cdsTipoEventoPadrao
    OnDataChange = dtsTipoEventoPadraoDataChange
    Left = 191
    Top = 65535
  end
  object dtsTipoMucoPadrao: TDataSource
    DataSet = Zoo_ReproducaoCiosCoberturasDatamodule.cdsTipoMucoPadrao
    Left = 417
    Top = 1
  end
  object dtsProtocolosIATFPadrao: TDataSource
    DataSet = Zoo_ReproducaoCiosCoberturasDatamodule.cdsProtocolosIATFPadrao
    Left = 538
    Top = 1
  end
end
