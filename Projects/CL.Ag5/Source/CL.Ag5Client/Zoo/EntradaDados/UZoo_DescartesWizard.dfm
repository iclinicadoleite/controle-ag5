inherited Zoo_DescartesWizard: TZoo_DescartesWizard
  Left = 369
  Top = 273
  Caption = 'Descartes'
  ClientHeight = 387
  ClientWidth = 894
  ExplicitWidth = 900
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 894
    Height = 387
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 894
    ExplicitHeight = 387
    inherited _pnlFooter: TJvPanel
      Top = 356
      Width = 890
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitTop = 356
      ExplicitWidth = 890
      inherited _imageBottom: TImage
        Width = 890
        ExplicitWidth = 751
      end
      inherited _btbPrior: TTcGDIButton
        Left = 699
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 699
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 790
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 790
      end
      inherited _btbExecute: TTcGDIButton
        Left = 805
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 805
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 890
      Height = 354
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 890
      ExplicitHeight = 354
      inherited PageControl: TJvPageControl
        Width = 890
        Height = 354
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ActivePage = TabSheet1
        ExplicitWidth = 890
        ExplicitHeight = 354
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object JvDBUltimGrid1: TJvDBUltimGrid
            Left = 0
            Top = 109
            Width = 890
            Height = 222
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtsDescartes
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = JvDBUltimGrid1KeyDown
            AutoAppend = False
            OnShowEditor = JvDBUltimGrid1ShowEditor
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <
              item
                ControlName = 'deGridData'
                FieldName = 'DATA'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'deGridValor'
                FieldName = 'PRECOVENDA'
                FitCell = fcBiggest
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'dbmGridObs'
                FieldName = 'OBS'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
              end>
            RowsHeight = 17
            TitleRowHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'Brinco'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEESTABULO'
                Width = 126
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA'
                Width = 97
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCR_RAZAO'
                Title.Caption = 'Raz'#227'o'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DESCR_MOTIVO'
                Title.Caption = 'Motivo'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMECOMPRADOR'
                Title.Caption = 'Comprador'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECOVENDA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBS'
                Width = 64
                Visible = True
              end>
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 890
            Height = 40
            Align = alTop
            Caption = 'Dados padr'#245'es para o Evento'
            TabOrder = 1
            object Label1: TLabel
              Left = 19
              Top = 19
              Width = 23
              Height = 13
              Caption = '&Data'
              FocusControl = deDataPadrao
            end
            object Label3: TLabel
              Left = 751
              Top = 17
              Width = 30
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Raz'#227'o'
              FocusControl = lcbPadraoRazaoX
              Visible = False
            end
            object Label4: TLabel
              Left = 358
              Top = 19
              Width = 32
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Motivo'
              FocusControl = lcbPadraoMotivo
            end
            object Label10: TLabel
              Left = 194
              Top = 19
              Width = 24
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Valor'
              FocusControl = DBLookupComboBox3
            end
            object Label11: TLabel
              Left = 547
              Top = 19
              Width = 53
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Comprador'
              FocusControl = lcbPadraoRazaoX
            end
            object deDataPadrao: TTcDateEdit
              Left = 57
              Top = 16
              Width = 104
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 19
              TabOrder = 0
            end
            object lcbPadraoRazaoX: TDBLookupComboBox
              Left = 785
              Top = 14
              Width = 103
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              KeyField = 'VALOR'
              ListField = 'DESCRICAO'
              ListSource = dtsTipoRazaoDescartePadrao
              TabOrder = 4
              Visible = False
              OnKeyDown = lcbPadraoRazaoXKeyDown
            end
            object lcbPadraoMotivo: TDBLookupComboBox
              Left = 404
              Top = 14
              Width = 115
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              KeyField = 'VALOR'
              ListField = 'DESCRICAO'
              ListSource = dtsTipoMotivoDescartePadrao
              TabOrder = 2
              OnKeyDown = lcbPadraoMotivoKeyDown
            end
            object edPadraoValor: TJvCalcEdit
              Left = 230
              Top = 14
              Width = 113
              Height = 21
              TabOrder = 1
              DecimalPlacesAlwaysShown = False
            end
            object EdtNomeComprador: TJvEdit
              Left = 608
              Top = 14
              Width = 121
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Text = ''
            end
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 40
            Width = 890
            Height = 69
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Label2: TLabel
              Left = 6
              Top = 19
              Width = 36
              Height = 13
              Caption = '&Brinco'
            end
            object Label5: TLabel
              Left = 561
              Top = 11
              Width = 35
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Raz'#227'o'
              FocusControl = DBLookupComboBox2X
              Visible = False
            end
            object Label6: TLabel
              Left = 11
              Top = 47
              Width = 37
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Motivo'
              FocusControl = DBLookupComboBox3
              Visible = False
            end
            object Label7: TLabel
              Left = 193
              Top = 19
              Width = 27
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Data'
              FocusControl = DBLookupComboBox2X
            end
            object Label8: TLabel
              Left = 181
              Top = 47
              Width = 29
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Valor'
              FocusControl = DBLookupComboBox3
              Visible = False
            end
            object Label9: TLabel
              Left = 350
              Top = 47
              Width = 65
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Comprador'
              FocusControl = DBLookupComboBox3
              Visible = False
            end
            object DBLookupComboBox2X: TDBLookupComboBox
              Left = 608
              Top = 10
              Width = 121
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESCR_RAZAO'
              DataSource = dtsDescartes
              TabOrder = 2
              Visible = False
              OnKeyDown = DBLookupComboBox2XKeyDown
            end
            object DBLookupComboBox3: TDBLookupComboBox
              Left = 57
              Top = 42
              Width = 115
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESCR_MOTIVO'
              DataSource = dtsDescartes
              TabOrder = 3
              Visible = False
              OnKeyDown = DBLookupComboBox3KeyDown
            end
            object deData: TTcDBDateEdit
              Left = 230
              Top = 15
              Width = 121
              Height = 21
              Checked = False
              DataField = 'DATA'
              DataSource = dtsDescartes
              CheckOnExit = False
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnKeyPress = deDataKeyPress
            end
            object edValor: TJvDBCalcEdit
              Left = 223
              Top = 42
              Width = 121
              Height = 21
              TabOrder = 4
              Visible = False
              DecimalPlacesAlwaysShown = False
              DataField = 'PRECOVENDA'
              DataSource = dtsDescartes
            end
            object DBEdit1: TDBEdit
              Left = 424
              Top = 42
              Width = 121
              Height = 21
              DataField = 'NOMECOMPRADOR'
              DataSource = dtsDescartes
              TabOrder = 5
              Visible = False
            end
            object BitBtn2: TTcGDIButton
              Left = 403
              Top = 9
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
              TabOrder = 6
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
            object edtBrinco: TJvComboEdit
              Left = 57
              Top = 15
              Width = 121
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
          object deGridValor: TJvDBCalcEdit
            Left = 279
            Top = 182
            Width = 121
            Height = 21
            TabOrder = 3
            Visible = False
            DecimalPlacesAlwaysShown = False
            DataField = 'PRECOVENDA'
            DataSource = dtsDescartes
          end
          object deGridData: TTcDBDateEdit
            Left = 144
            Top = 182
            Width = 121
            Height = 21
            Checked = False
            DataField = 'DATA'
            DataSource = dtsDescartes
            CheckOnExit = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = False
          end
          object dbmGridObs: TDBMemo
            Left = 448
            Top = 157
            Width = 185
            Height = 89
            DataField = 'OBS'
            DataSource = dtsDescartes
            TabOrder = 5
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
  object dtsDescartes: TDataSource
    DataSet = Zoo_DescartesDatamodule.cdsDescartes
    Left = 334
    Top = 62
  end
  object dtsTipoRazaoDescartePadrao: TDataSource
    DataSet = Zoo_DescartesDatamodule.cdsTipoRazaoDescartePadrao
    Left = 374
    Top = 37
  end
  object dtsTipoMotivoDescartePadrao: TDataSource
    DataSet = Zoo_DescartesDatamodule.cdsTipoMotivoDescartePadrao
    Left = 418
    Top = 37
  end
end
