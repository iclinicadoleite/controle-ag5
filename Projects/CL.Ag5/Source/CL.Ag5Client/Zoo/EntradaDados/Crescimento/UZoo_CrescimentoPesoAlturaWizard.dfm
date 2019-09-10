inherited Zoo_CrescimentoPesoAlturaWizard: TZoo_CrescimentoPesoAlturaWizard
  Left = 538
  Top = 238
  Caption = 'Peso / Altura'
  ClientHeight = 372
  ClientWidth = 639
  ExplicitWidth = 645
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 639
    Height = 372
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 639
    ExplicitHeight = 372
    inherited _pnlFooter: TJvPanel
      Top = 341
      Width = 635
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitTop = 341
      ExplicitWidth = 635
      inherited _imageBottom: TImage
        Width = 635
        ExplicitWidth = 635
      end
      inherited _btbPrior: TTcGDIButton
        Left = 444
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 444
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 535
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 535
      end
      inherited _btbExecute: TTcGDIButton
        Left = 551
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 551
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 635
      Height = 339
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 635
      ExplicitHeight = 339
      inherited PageControl: TJvPageControl
        Width = 635
        Height = 339
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ActivePage = TabSheet1
        ExplicitWidth = 635
        ExplicitHeight = 339
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object JvDBUltimGrid1: TJvDBUltimGrid
            Left = 0
            Top = 73
            Width = 635
            Height = 243
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtsPesoAltura
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
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
                ControlName = 'gdeData'
                FieldName = 'DATA'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'mmObs'
                FieldName = 'OBSERVACAO'
                FitCell = fcDesignSize
                LeaveOnEnterKey = True
              end>
            RowsHeight = 17
            TitleRowHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'BRINCO'
                ReadOnly = True
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEESTABULO'
                ReadOnly = True
                Width = 230
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA'
                Width = 158
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PESO'
                Title.Caption = 'Peso'
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALTURA'
                Title.Caption = 'Altura'
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBSERVACAO'
                Width = 63
                Visible = True
              end>
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 635
            Height = 73
            Align = alTop
            TabOrder = 1
            object Label3: TLabel
              Left = 240
              Top = 13
              Width = 80
              Height = 13
              Caption = 'Data da Medi'#231#227'o'
            end
            object Label2: TLabel
              Left = 8
              Top = 45
              Width = 31
              Height = 13
              Caption = '&Animal'
              FocusControl = edtBrinco
            end
            object cbxDigitarPeso: TCheckBox
              Left = 5
              Top = 12
              Width = 97
              Height = 17
              Caption = 'Digitar Peso'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = cbxDigitarPesoClick
            end
            object cbxDigitarAltura: TCheckBox
              Left = 117
              Top = 12
              Width = 97
              Height = 17
              Caption = 'Digitar Altura'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = cbxDigitarAlturaClick
            end
            object deDataPadrao: TTcDateEdit
              Left = 340
              Top = 9
              Width = 92
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 25
              TabOrder = 2
            end
            object edtBrinco: TJvComboEdit
              Left = 68
              Top = 47
              Width = 107
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ButtonWidth = 15
              ImageKind = ikEllipsis
              TabOrder = 3
              Text = ''
              OnButtonClick = edtBrincoButtonClick
              OnChange = edtBrincoChange
              OnEnter = edtBrincoEnter
              OnKeyDown = edtBrincoKeyDown
              OnKeyPress = edtBrincoKeyPress
            end
            object Panel3: TPanel
              Left = 180
              Top = 35
              Width = 322
              Height = 32
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              BevelOuter = bvNone
              Caption = ' '
              ParentColor = True
              TabOrder = 4
              object pnlPeso: TPanel
                Left = 0
                Top = 0
                Width = 155
                Height = 32
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alLeft
                AutoSize = True
                BevelOuter = bvNone
                Caption = ' '
                ParentColor = True
                TabOrder = 0
                object lblPeso: TLabel
                  Left = 0
                  Top = 10
                  Width = 52
                  Height = 13
                  Caption = '  Peso (Kg)'
                  FocusControl = edPeso
                end
                object edPeso: TJvDBCalcEdit
                  Left = 73
                  Top = 7
                  Width = 82
                  Height = 21
                  ShowButton = False
                  TabOrder = 0
                  Visible = False
                  DecimalPlacesAlwaysShown = False
                  OnEnter = edPesoEnter
                  OnKeyPress = edPesoKeyPress
                  DataField = 'PESO'
                  DataSource = dtsPesoAltura
                end
              end
              object pnlAltura: TPanel
                Left = 155
                Top = 0
                Width = 158
                Height = 32
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alLeft
                AutoSize = True
                BevelOuter = bvNone
                Caption = ' '
                ParentColor = True
                TabOrder = 1
                object lblAltura: TLabel
                  Left = 0
                  Top = 10
                  Width = 59
                  Height = 13
                  Caption = '  Altura (cm)'
                end
                object edAltura: TJvDBCalcEdit
                  Left = 76
                  Top = 7
                  Width = 82
                  Height = 21
                  ShowButton = False
                  TabOrder = 0
                  DecimalPlacesAlwaysShown = False
                  OnEnter = edAlturaEnter
                  OnKeyPress = edAlturaKeyPress
                  DataField = 'ALTURA'
                  DataSource = dtsPesoAltura
                end
              end
            end
            object BitBtn2: TTcGDIButton
              Left = 507
              Top = 38
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
            object btnImportarPesagens: TTcGDIButton
              Left = 496
              Top = 5
              Width = 126
              Height = 25
              Caption = 'Importar Pesagens'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 6
              OnClick = btnImportarPesagensClick
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
          object mmObs: TDBMemo
            Left = 144
            Top = 107
            Width = 215
            Height = 82
            DataField = 'OBSERVACAO'
            DataSource = dtsPesoAltura
            TabOrder = 2
            Visible = False
          end
          object gdeData: TTcDBDateEdit
            Left = 252
            Top = 143
            Width = 98
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Checked = False
            DataField = 'DATA'
            DataSource = dtsPesoAltura
            CheckOnExit = False
            Color = clSilver
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
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object dtsPesoAltura: TDataSource
    DataSet = Zoo_CrescimentoPesoAlturaDatamodule.cdsPesoAltura
    OnDataChange = dtsPesoAlturaDataChange
    Left = 481
    Top = 33
  end
end
