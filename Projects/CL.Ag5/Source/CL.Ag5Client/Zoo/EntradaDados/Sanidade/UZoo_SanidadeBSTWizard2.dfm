inherited Zoo_SanidadeBSTWizard2: TZoo_SanidadeBSTWizard2
  Left = 371
  Top = 203
  Caption = 'BST'
  ClientHeight = 454
  ClientWidth = 995
  ExplicitWidth = 1001
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 995
    Height = 454
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 995
    ExplicitHeight = 454
    inherited _pnlFooter: TJvPanel
      Top = 423
      Width = 991
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitTop = 423
      ExplicitWidth = 991
      inherited _imageBottom: TImage
        Width = 991
        ExplicitWidth = 732
      end
      inherited _btbPrior: TTcGDIButton
        Left = 800
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 800
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 891
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 891
      end
      inherited _btbExecute: TTcGDIButton
        Left = 906
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 906
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 991
      Height = 421
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 991
      ExplicitHeight = 421
      inherited PageControl: TJvPageControl
        Width = 991
        Height = 421
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ActivePage = TabSheet1
        ExplicitWidth = 991
        ExplicitHeight = 421
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Panel2: TPanel
            Left = 0
            Top = 112
            Width = 991
            Height = 286
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 1
            Caption = '_pnldbgLista'
            Color = clSilver
            ParentBackground = False
            TabOrder = 0
            object JvDBUltimGrid1: TJvDBUltimGrid
              Left = 1
              Top = 1
              Width = 989
              Height = 138
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtsBST
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnEditButtonClick = JvDBUltimGrid1EditButtonClick
              OnEnter = JvDBUltimGrid1Enter
              OnKeyDown = JvDBUltimGrid1KeyDown
              OnKeyPress = JvDBUltimGrid1KeyPress
              AutoAppend = False
              OnShowEditor = JvDBUltimGrid1ShowEditor
              AutoSizeColumns = True
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <
                item
                  ControlName = 'JvDBDateEdit1'
                  FieldName = 'DATA'
                  FitCell = fcCellSize
                  LeaveOnEnterKey = True
                  LeaveOnUpDownKey = True
                end
                item
                  ControlName = 'DBMemo1'
                  FieldName = 'OBSERVACAO'
                  FitCell = fcBiggest
                  LeaveOnEnterKey = True
                  LeaveOnUpDownKey = True
                end>
              RowsHeight = 17
              TitleRowHeight = 17
              OnCheckIfBooleanField = JvDBUltimGrid1CheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'BRINCO'
                  ReadOnly = True
                  Width = 73
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMEESTABULO'
                  ReadOnly = True
                  Width = 355
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA'
                  Width = 143
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOTE'
                  ReadOnly = True
                  Width = 72
                  Visible = True
                end
                item
                  ButtonStyle = cbsEllipsis
                  Expanded = False
                  FieldName = 'NOMEFUNCIONARIO'
                  Width = 81
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'APLICADO'
                  Width = 56
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_MOTIVO_INTERRUPCAO'
                  Width = 61
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBSERVACAO'
                  Width = 140
                  Visible = True
                end>
            end
            object DBMemo1: TDBMemo
              Left = 248
              Top = 98
              Width = 279
              Height = 83
              DataField = 'OBSERVACAO'
              DataSource = dtsBST
              TabOrder = 0
              Visible = False
            end
            object JvDBDateEdit1: TTcDBDateEdit
              Left = 282
              Top = 119
              Width = 113
              Height = 21
              Checked = False
              DataField = 'DATA'
              DataSource = dtsBST
              CheckOnExit = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 20
              ParentFont = False
              TabOrder = 1
              Visible = False
            end
            object gbMensagem: TGroupBox
              Left = 1
              Top = 139
              Width = 989
              Height = 146
              Align = alBottom
              Enabled = False
              TabOrder = 3
              ExplicitTop = 138
              object lbBST: TLabel
                Left = 130
                Top = 25
                Width = 125
                Height = 13
                Caption = 'Descri'#231#227'o parametros BST'
              end
              object lbDPP: TLabel
                Left = 130
                Top = 48
                Width = 126
                Height = 13
                Caption = 'Descricao parametros DPP'
              end
              object lbProd: TLabel
                Left = 130
                Top = 72
                Width = 190
                Height = 13
                Caption = 'Descricao parametros Produ'#231#227'o de leite'
              end
              object lblRetiradaBST: TLabel
                Left = 130
                Top = 119
                Width = 198
                Height = 13
                Caption = 'Descricao antes da secagem retirada BST'
              end
              object lblDiasSecagem: TLabel
                Left = 130
                Top = 98
                Width = 196
                Height = 13
                Caption = 'Descricao parametros dias para secagem'
              end
              object GroupBox3: TGroupBox
                Left = 10
                Top = 4
                Width = 54
                Height = 136
                TabOrder = 0
                object Label6: TLabel
                  Left = 5
                  Top = 0
                  Width = 44
                  Height = 13
                  Caption = 'Prim'#237'para'
                end
                object edDPPPrimipara: TEdit
                  Left = 5
                  Top = 44
                  Width = 44
                  Height = 14
                  TabStop = False
                  Alignment = taCenter
                  BorderStyle = bsNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                  Text = '100'
                  Visible = False
                end
                object edProdPrimipara: TEdit
                  Left = 5
                  Top = 68
                  Width = 44
                  Height = 14
                  TabStop = False
                  Alignment = taCenter
                  BorderStyle = bsNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                  Text = '100'
                  Visible = False
                end
                object edBSTPrim: TEdit
                  Left = 5
                  Top = 21
                  Width = 44
                  Height = 14
                  TabStop = False
                  Alignment = taCenter
                  BorderStyle = bsNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  Text = '100'
                  Visible = False
                end
                object edtDiasPreSecagemPrimipara: TEdit
                  Left = 5
                  Top = 115
                  Width = 44
                  Height = 14
                  TabStop = False
                  Alignment = taCenter
                  BorderStyle = bsNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                  Text = '100'
                  Visible = False
                end
                object edtDiasSecagemPrimipara: TEdit
                  Left = 5
                  Top = 91
                  Width = 44
                  Height = 14
                  TabStop = False
                  Alignment = taCenter
                  BorderStyle = bsNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                  Text = '100'
                  Visible = False
                end
              end
              object GroupBox4: TGroupBox
                Left = 70
                Top = 4
                Width = 54
                Height = 136
                TabOrder = 1
                object Label7: TLabel
                  Left = 5
                  Top = 0
                  Width = 44
                  Height = 13
                  Caption = 'Mult'#237'para'
                end
                object edDPPMultipara: TEdit
                  Left = 5
                  Top = 44
                  Width = 44
                  Height = 14
                  TabStop = False
                  Alignment = taCenter
                  BorderStyle = bsNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                  Text = '100'
                  Visible = False
                end
                object edProdMultipara: TEdit
                  Left = 5
                  Top = 68
                  Width = 44
                  Height = 14
                  TabStop = False
                  Alignment = taCenter
                  BorderStyle = bsNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                  Text = '100'
                  Visible = False
                end
                object edBSTMult: TEdit
                  Left = 5
                  Top = 21
                  Width = 44
                  Height = 14
                  TabStop = False
                  Alignment = taCenter
                  BorderStyle = bsNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  Text = '100'
                  Visible = False
                end
                object edtDiasPreSecagemMultipara: TEdit
                  Left = 5
                  Top = 115
                  Width = 44
                  Height = 14
                  TabStop = False
                  Alignment = taCenter
                  BorderStyle = bsNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                  Text = '100'
                  Visible = False
                end
                object edtDiasSecagemMultipara: TEdit
                  Left = 5
                  Top = 91
                  Width = 44
                  Height = 14
                  TabStop = False
                  Alignment = taCenter
                  BorderStyle = bsNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                  Text = '100'
                  Visible = False
                end
              end
            end
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 64
            Width = 991
            Height = 48
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label2: TLabel
              Left = 168
              Top = 3
              Width = 85
              Height = 13
              Caption = 'Data Aplica'#231#227'o'
            end
            object Label3: TLabel
              Left = 330
              Top = 3
              Width = 65
              Height = 13
              Caption = 'Funcion'#225'rio'
            end
            object Label4: TLabel
              Left = 15
              Top = 3
              Width = 39
              Height = 13
              Caption = 'Animal'
            end
            object Label9: TLabel
              Left = 601
              Top = 3
              Width = 124
              Height = 13
              Caption = 'Motivo da interrup'#231#227'o'
            end
            object Label10: TLabel
              Left = 530
              Top = 3
              Width = 23
              Height = 13
              Caption = 'BST'
            end
            object BitBtn2: TTcGDIButton
              Left = 852
              Top = 11
              Width = 126
              Height = 29
              Caption = 'Remover registro selecionado'
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
              TabOrder = 5
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
            object deData: TTcDBDateEdit
              Left = 168
              Top = 20
              Width = 112
              Height = 21
              Checked = False
              DataField = 'DATA'
              DataSource = dtsBST
              CheckOnExit = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnKeyPress = deDataKeyPress
            end
            object edFuncionario: TJvDBComboEdit
              Left = 330
              Top = 20
              Width = 140
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'NOMEFUNCIONARIO'
              DataSource = dtsBST
              ImageKind = ikEllipsis
              ButtonWidth = 15
              TabOrder = 2
              OnKeyPress = edFuncionarioKeyPress
            end
            object lcMotivoInterrupcao: TDBLookupComboBox
              Left = 600
              Top = 20
              Width = 120
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESC_MOTIVO_INTERRUPCAO'
              DataSource = dtsBST
              TabOrder = 4
              OnKeyDown = lcMotivoInterrupcaoKeyDown
              OnKeyPress = lcMotivoInterrupcaoKeyPress
            end
            object chkAplicado: TJvDBCheckBox
              Left = 502
              Top = 22
              Width = 69
              Height = 17
              Caption = 'Aplicado'
              DataField = 'APLICADO'
              DataSource = dtsBST
              TabOrder = 3
              ValueChecked = 'T'
              ValueUnchecked = 'F'
              OnKeyPress = chkAplicadoKeyPress
            end
            object edtBrinco: TJvComboEdit
              Left = 18
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
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 991
            Height = 64
            Align = alTop
            Caption = 'Digita'#231#227'o r'#225'pida'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Label1: TLabel
              Left = 15
              Top = 17
              Width = 85
              Height = 13
              Caption = 'Data Aplica'#231#227'o'
            end
            object Label5: TLabel
              Left = 168
              Top = 17
              Width = 65
              Height = 13
              Caption = 'Funcion'#225'rio'
            end
            object deDataDefault: TTcDateEdit
              Left = 16
              Top = 36
              Width = 112
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 20
              TabOrder = 0
            end
            object btnSelecionarAnimais: TTcGDIButton
              Left = 331
              Top = 28
              Width = 126
              Height = 29
              Caption = 'Selecionar animais'
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
                000002050000120B0000120B000000000000000000008300E58300E58300E5DD
                DBDBBAB8B8B4B2B1BBB8B89491927D797A837E7F8F8B8B9A9696A4A09F7CAE86
                43BC6478B785BFBDBCB3B0AF8300E58300E58300E5008300E58300E5C4C2C1AD
                AAA9E4E2E1D4D3D2716C6D7B76788D898A9E9A9AADA9A9BBB7B682C08E55C877
                83D49D77CB8AE4E3E2C6C3C38300E58300E58300E5008300E5C2C0C0C1BEBDE5
                E4E3F1F1F09894957D787A908B8CA09C9CAFABAABCB8B785C1915ACA7D8FD8A8
                7CD2985FCA77AFD6B595BC9BACD3B2ACD3B2BAD7BE00D4D3D2AEABAAE7E6E5F2
                F2F1FAF9F9A09D9E918D8EA29E9EB0ACACBDB9B888C29465CD8682D39E82D39E
                79D39863CD8663CD8663CD8663CD8663CD865AC87700AAA8A7E8E7E6E1E0E0D9
                D7D8E0DFE0BDBABBA4A09FB2AEADBEBBB999C7A560CC8372D19272D19272D192
                72D19272D19272D19272D19272D19272D19261CB7C00B8B5B5A09E9E706B6D83
                7E80959192A5A1A1B3AFAFC0BCBBA2C6A965CD8A65CD8A65CD8A65CD8A65CD8A
                65CD8A65CD8A65CD8A65CD8A65CD8A65CD8A68CE8300ADAAAA726D6F86818297
                9394A7A3A2B5B1B0C1BDBCCBC9C7D4D2D078CC8D63CD8657CA7D57CA7D57CA7D
                57CA7D57CA7D57CA7D57CA7D57CA7D57CA7D6ECF89007A7577878384999595A8
                A4A4B6B2B1C2BFBDCCCAC8D5D3D2DCDBD9E2E1E082D39660CC8549C67249C672
                4DC87459CB7F59CB7F59CB7F59CB7F59CB7F77D08E00817C7D9B9797AAA6A6B8
                B4B3C3C0BFCDCBC9D6D4D2DDDCDAE3E2E1E8E7E6EBEAE98AD59D5FCB823EC268
                54C77893D6A5CFE0D3B4C5B8CFE0D3CFE0D3CADFCE008F8B8BACA8A7B9B5B4C4
                C1C0CFCCCAD7D5D3DEDCDBE4E2E1E8E7E6EBEAEAEDECECEEEDECC4E4CC53C673
                4DC67195D6A3DFDEDCBFBCBB8300E58300E58300E5009B9797BAB7B6C6C3C1CF
                CDCBD8D6D4DFDDDCE4E3E2E9E8E7ECEBEAEEEDECEEEDECEEEDECECEBEAAEDCB8
                6ECF8999D3A4D8D6D4BAB8B78300E58300E58300E500A6A2A1C7C4C2D1CECCD9
                D7D5DFDEDCE5E4E2E9E8E7ECEBEAEEEDECEEEDECEDECECECEBEAE8E7E6E4E3E1
                DEDDDBD7D5D4CFCCCBB5B2B28300E58300E58300E500AFACABD1CFCDD9D8D6E0
                DFDDE5E4E3EAE9E7ECEBEBEEEDECEEEDECEDECECEBEAE9E8E7E6E3E2E1DDDCDA
                D6D4D3CECBCAC3C0BFAFACAB8300E58300E58300E500B7B4B3DAD9D7E1DFDEE6
                E5E4EAE9E8EDECEBEEEDECEEEDECEDECEBEBEAE9E8E6E5E3E1E0DDDBDAD5D3D2
                CCCAC8C2BFBEB7B3B2A8A4A48300E58300E58300E500BDBABAE1E0DEE6E5E4EA
                E9E8EDECEBEEEDECEEEDECEDECEBEBEAE9E7E6E5E2E1DFDCDAD9D5D3D1CCC9C7
                C1BEBCB5B1B0A7A3A39F9C9C8300E58300E58300E500C2C0BFE7E6E5EBEAE9ED
                ECEBEEEDECEEEDECEDECEBEAE9E8E6E5E4E2E0DFDBDAD8D4D2D0CAC8C6C0BCBB
                B4B0AFA6A2A19692929692928300E58300E58300E500C6C4C3EBEAE9EDECEBEE
                EDECEEEDECEDECEBEAE9E8E6E5E4E1DFDEDAD9D7D3D1CFC9C7C5BEBBBAB2AEAE
                A4A0A0949090827D7F8B87888300E58300E58300E500C9C7C6EDECECEEEDECEE
                EDECECEBEBEAE9E7E6E4E3E0DFDDDAD8D6D2D0CEC8C6C4BDBAB9B1ADACA29E9E
                928E8E807B7D6C6769807C7C8300E58300E58300E500CAC8C8EEEDECEEEDECEC
                EBEAE9E8E7E5E4E2DFDEDCD9D7D5D1CFCDC7C4C2BCB8B7AFABABA19D9C908C8D
                7D797A6A6566555051736F708300E58300E58300E500B0ADADCAC8C8C9C7C7C7
                C5C4C4C2C1C0BDBDBBB8B7B5B2B1AEAAA9A5A1A19C9897918D8D858081777273
                6863645853544642436D6A6A8300E58300E58300E5000000}
              TabOrder = 2
              OnClick = btnSelecionarAnimaisClick
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
            object edNomeFuncionarioDefault: TJvComboEdit
              Left = 168
              Top = 36
              Width = 143
              Height = 21
              ButtonWidth = 15
              ImageKind = ikEllipsis
              TabOrder = 1
              Text = ''
              OnButtonClick = edNomeFuncionarioDefaultButtonClick
              OnChange = edNomeFuncionarioDefaultChange
              OnKeyPress = edNomeFuncionarioDefaultKeyPress
            end
          end
        end
      end
    end
  end
  object pnlSelecaoAnimais: TTcCaptionedPanel [1]
    Left = 554
    Top = 188
    Width = 433
    Height = 200
    Caption = 'Selecionar animais'
    BorderStyle = bsSingle
    Constraints.MinHeight = 20
    TabOrder = 1
    Visible = False
    object JvDBUltimGrid2: TJvDBUltimGrid
      Left = 1
      Top = 61
      Width = 427
      Height = 103
      Align = alClient
      DataSource = dtsSelectAnimais
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      AutoAppend = False
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      CanDelete = False
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      OnCheckIfBooleanField = JvDBUltimGrid2CheckIfBooleanField
    end
    object Panel3: TPanel
      Left = 1
      Top = 164
      Width = 427
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        427
        31)
      object FloatEditorOKButton: TTcGDIButton
        Left = 371
        Top = 1
        Width = 27
        Height = 24
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Action = actDoSelect
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
      object FloatEditorCancelButton: TTcGDIButton
        Left = 397
        Top = 1
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
        ModalResult = 2
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
        TabOrder = 1
        OnClick = FloatEditorCancelButtonClick
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
      Left = 1
      Top = 20
      Width = 427
      Height = 41
      Align = alTop
      Caption = ' '
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object Label8: TLabel
        Left = 8
        Top = 9
        Width = 119
        Height = 13
        Caption = 'Animais a aplicar BST at'#233
      end
      object deBSTAte: TTcDateEdit
        Left = 134
        Top = 6
        Width = 112
        Height = 21
        Checked = False
        CheckOnExit = False
        ButtonWidth = 20
        TabOrder = 0
      end
      object btnListarAnimaisBST: TTcGDIButton
        Left = 269
        Top = 3
        Width = 126
        Height = 29
        Caption = 'Listar animais'
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
          424DF60600000000000036000000280000001800000018000000010018000000
          0000C0060000C40E0000C40E00000000000000000000FEFEFEF8F8F8F2F2F2ED
          EDEDE9E9E9E5E5E5E1E1E1E1E1E1E0E0E0DBDBDBD9D9D9D9D9D9D8D8D8D9D9D9
          DADADAE1E1E1E1E1E1E0E0E0E6E6E6E9E9E9EDEDEDF2F2F2F8F8F8FEFEFEF2F2
          F2CCCCCCBDBDBDB6B6B6B2B2B2ACACACACACACA9A9A9A7A7A7A7A7A7A7A7A7A7
          A7A7A6A6A6A7A7A7A7A7A7A7A7A7A9A9A9ABABABADADADB2B2B2B5B5B5BEBEBE
          CCCCCCF1F1F1FFFFFFFFFFFFEDEDEDD9D9D9D7D7D7D5D5D5D6D6D6D2D2D2D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D2D2D2D6D6D6D5D5D5D7
          D7D7D9D9D9E7E7E7FFFFFFFFFFFFFFFFFFF2F2F2BEBEBEBDBDBDBDBDBDBDBDBD
          BDBDBDBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
          BEBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDE9E9E9FFFFFFFFFFFFE4E4E4BFBFBFBF
          BFBFBFBFBFC0C0C0BFBFBFBFBFBFC0C0C0BFBFBFBFBFBFBFBFBFC0C0C0BFBFBF
          C0C0C0BFBFBFBFBFBFC0C0C0BFBFBFBFBFBFC0C0C0BFBFBFDADADAFFFFFFFFFF
          FFE5E5E5C1C1C1C1C1C1C2C2C2C2C2C2C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1
          C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1
          DCDCDCFFFFFFFFFFFFE6E6E6C3C3C3BFBFBFACACACADADADB8B8B8C4C4C4C2C2
          C2BEBEBEBEBEBEBEBEBEBFBFBFBEBEBEBFBFBFBEBEBEBEBEBEBFBFBFBEBEBEBE
          BEBEC2C2C2C3C3C3DDDDDDFFFFFFFFFFFFE7E7E7C6C6C6B1B1B1C5C5C5C5C5C5
          B0B0B0C8C8C8B1B1B1A0A0A0A2A2A2A2A2A2A1A1A1A2A2A2A1A1A1A2A2A2A2A2
          A2A1A1A1A2A2A2A1A1A1AFAFAFC6C6C6DFDFDFFFFFFFFFFFFFE8E8E8C7C7C7BC
          BCBCBABABABCBCBCB6B6B6C8C8C8C6C6C6C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2
          C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C6C6C6C7C7C7E0E0E0FFFFFFFFFF
          FFEAEAEAC9C9C9C9C9C9C9C9C9C9C9C9CACACAC9C9C9C9C9C9C9C9C9C9C9C9C9
          C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9
          E2E2E2FFFFFFFFFFFFEAEAEACBCBCBCCCCCCCECECECCCCCCCECECECBCBCBCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCBCBCBCBCBCBCB
          CBCBCBCBCBCBCBCBE2E2E2FFFFFFFFFFFFEBEBEBCDCDCDBEBEBEA2A2A2A6A6A6
          B2B2B2CFCFCFC0C0C0B3B3B3B4B4B4B4B4B4B5B5B5B4B4B4B5B5B5B3B3B3C0C0
          C0CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCE4E4E4FFFFFFFFFFFFECECECCECECEB7
          B7B7D2D2D2D2D2D2B9B9B9D0D0D0B9B9B9A6A6A6A8A8A8A8A8A8A7A7A7A8A8A8
          A7A7A7A6A6A6BABABACECECECCCCCCCCCCCCCCCCCCCCCCCCE5E5E5FFFFFFFFFF
          FFEDEDEDCFCFCFCACACAB8B8B8BABABAC2C2C2D3D3D1D2D2D1D2D2D2D2D2D2D2
          D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0D0CFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
          E6E6E6FFFFFFFFFFFFEDEDEDD0D0D0D0D0D0D3D5D7D3D5D8D9D9D5ADADC1CBCB
          CDD1D1D0CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFD0
          D0D0D0D0D0D0D0D0E7E7E7FFFFFFFFFFFFEEEEEED1D1D1D3D4D6B5A98EC0B189
          BCBABE00008244449EE9E9DBD6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
          D6D6D6D6D6D6D6D1D1D1D1D1D1D1D1D1E7E7E7FFFFFFFFFFFFEFEFEFD3D4D6B9
          B2A8B5882275594D0000864848B103039268689BAFAFA5A3A3A3A4A4A4A3A3A3
          A4A4A4A3A3A3A3A3A3A4A4A4A0A0A0C7C7C7D2D2D2D2D2D2E8E8E8FFFFFFFFFF
          FFEFEFEFD4D5D6BCB7ADD1A6555E52971112ABC7C7D36161BA0202938B8BAEC9
          C9C0BBBBBBBCBCBCBBBBBBBCBCBCBCBCBCBBBBBBBABABACDCDCDD3D3D3D3D3D3
          E9E9E9FFFFFFFFFFFFF0F0F0D4D4D4D6D7D8C0BAB0CFC8AEB3B2C6DDDDD6D1D1
          D41616AA00009C8585C2DADAD7D6D6D6D6D6D6D5D5D5D5D5D5D6D6D6D5D5D5D4
          D4D4D4D4D4D4D4D4EAEAEAFFFFFFFFFFFFF0F0F0D3D3D3D5D5D5D6D7D8D4D5D7
          D8D8D6D5D5D5DCDCD49D9DCF0C0CAB0000A3D5D5D3D6D6D5D3D3D3D5D5D5D5D5
          D5D3D3D3D5D5D5D5D5D5D3D3D3D5D5D5E9E9E9FFFFFFFFFFFFF2F2F2D5D5D5D3
          D3D3D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4E1E1D67E7ECE0202B1E8E8D7D4D4D4
          D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D3D3D3EDEDEDFFFFFFFFFF
          FFF8F8F8E0E0E0DCDCDCDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBEBEBDD82
          82CFD6D6DBDCDCDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDCDCDCE0E0E0
          F3F3F3FFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F2F2F2F2F2F2F2F2F2F2F2F2F2F2
          F2F2F2F2F2F2F2F6F6F3F3F3F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
          F2F2F1F1F1F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 1
        OnClick = btnListarAnimaisBSTClick
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
  inherited ActionList: TInternalActionList
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
    object actDoSelect: TAction
      Category = 'FloatEditor'
      OnExecute = actDoSelectExecute
    end
  end
  object dtsBST: TDataSource
    AutoEdit = False
    DataSet = Zoo_SanidadeBSTDatamodule2.cdsBST
    OnDataChange = dtsBSTDataChange
    Left = 461
    Top = 78
  end
  object TcControlPopuper1: TTcControlPopuper
    Control = pnlSelecaoAnimais
    PopupStyle = cpsPopup
    Left = 946
    Top = 2
  end
  object dtsSelectAnimais: TDataSource
    DataSet = Zoo_SanidadeBSTDatamodule2.cdsSelectBST
    Left = 936
    Top = 128
  end
end
