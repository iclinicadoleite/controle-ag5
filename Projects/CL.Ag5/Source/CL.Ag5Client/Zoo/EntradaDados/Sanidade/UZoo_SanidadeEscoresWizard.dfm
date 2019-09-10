inherited Zoo_SanidadeEscoresWizard: TZoo_SanidadeEscoresWizard
  Left = 466
  Top = 239
  Caption = 'Escore'
  ClientWidth = 669
  ActionList.Left = 584
  ActionList.Top = 28
  ExplicitWidth = 675
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 669
    ExplicitWidth = 669
    inherited _pnlFooter: TJvPanel
      Width = 665
      ExplicitWidth = 665
      inherited _imageBottom: TImage
        Width = 665
        ExplicitWidth = 665
      end
      inherited _btbPrior: TTcGDIButton
        Left = 474
        ExplicitLeft = 474
      end
      inherited _btbNext: TTcGDIButton
        Left = 565
        ExplicitLeft = 565
      end
      inherited _btbExecute: TTcGDIButton
        Left = 580
        ExplicitLeft = 580
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 665
      ExplicitWidth = 665
      ExplicitHeight = 310
      inherited PageControl: TJvPageControl
        Width = 665
        ActivePage = TabSheet1
        ExplicitWidth = 665
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label2: TLabel
            Left = 326
            Top = 16
            Width = 41
            Height = 13
            Caption = 'Legenda'
          end
          object Panel3: TPanel
            Left = 9
            Top = 13
            Width = 312
            Height = 247
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            BorderWidth = 1
            Caption = '_pnldbgLista'
            Color = clSilver
            ParentBackground = False
            TabOrder = 0
            object dbgListaEscores: TJvDBUltimGrid
              Left = 2
              Top = 2
              Width = 308
              Height = 243
              Align = alClient
              DataSource = dtsListaEscores
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              AutoAppend = False
              OnShowEditor = dbgListaEscoresShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
            end
          end
          object DBMemo1: TDBMemo
            Left = 326
            Top = 36
            Width = 200
            Height = 223
            DataField = 'OBS'
            DataSource = dtsListaEscores
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Label4: TLabel
            Left = 0
            Top = 0
            Width = 665
            Height = 13
            Align = alTop
            Caption = '  Legenda'
            ExplicitWidth = 47
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 114
            Width = 665
            Height = 40
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label7: TLabel
              Left = 15
              Top = 14
              Width = 39
              Height = 13
              Caption = '&Animal'
              FocusControl = edtBrinco
            end
            object edtBrinco: TJvComboEdit
              Left = 63
              Top = 11
              Width = 185
              Height = 21
              ButtonWidth = 15
              ImageKind = ikEllipsis
              TabOrder = 0
              Text = ''
              OnButtonClick = edtBrincoButtonClick
              OnChange = edtBrincoChange
              OnEnter = edtBrincoEnter
              OnKeyDown = edtBrincoKeyDown
              OnKeyPress = edNomeAnimalFemeaKeyPress
            end
            object BitBtn2: TTcGDIButton
              Left = 507
              Top = 8
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
              TabOrder = 1
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
          object dbgEscores: TJvDBUltimGrid
            Left = 0
            Top = 154
            Width = 665
            Height = 133
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtsEscores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
            OnEditButtonClick = dbgEscoresEditButtonClick
            OnKeyDown = dbgEscoresKeyDown
            OnKeyPress = dbgEscoresKeyPress
            AutoAppend = False
            OnShowEditor = dbgEscoresShowEditor
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 18
          end
          object degData: TTcDBDateEdit
            Left = 164
            Top = 167
            Width = 98
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Checked = False
            DataField = 'DATA'
            DataSource = dtsEscores
            CheckOnExit = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ButtonWidth = 17
            ParentFont = False
            TabOrder = 3
            Visible = False
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 69
            Width = 665
            Height = 45
            Align = alTop
            Caption = 'Digita'#231#227'o de dados padr'#227'o'
            TabOrder = 0
            object Label1: TLabel
              Left = 27
              Top = 18
              Width = 23
              Height = 13
              Caption = '&Data'
              FocusControl = deDataEvento
            end
            object Label3: TLabel
              Left = 219
              Top = 19
              Width = 55
              Height = 13
              Caption = 'Funcion'#225'rio'
            end
            object deDataEvento: TTcDateEdit
              Left = 63
              Top = 15
              Width = 113
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 0
              OnKeyPress = deDataEventoKeyPress
            end
            object edNomeFuncionario: TJvComboEdit
              Left = 296
              Top = 16
              Width = 185
              Height = 21
              ButtonWidth = 15
              ImageKind = ikEllipsis
              TabOrder = 1
              Text = ''
              OnButtonClick = edNomeFuncionarioButtonClick
              OnChange = edNomeFuncionarioChange
              OnKeyPress = edNomeFuncionarioKeyPress
            end
          end
          object DBMemo2: TDBMemo
            Left = 0
            Top = 13
            Width = 665
            Height = 56
            Align = alTop
            DataField = 'OBS'
            DataSource = dtsListaEscores
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 4
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 584
    Top = 28
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object dtsEscores: TDataSource
    AutoEdit = False
    DataSet = Zoo_SanidadeEscoresDatamodule.cdsEscores
    OnDataChange = dtsEscoresDataChange
    Left = 466
    Top = 222
  end
  object dtsListaEscores: TDataSource
    AutoEdit = False
    DataSet = Zoo_SanidadeEscoresDatamodule.cdsListaEscores
    Left = 295
    Top = 193
  end
end
