inherited Zoo_SanidadeDiagnosticosWizard: TZoo_SanidadeDiagnosticosWizard
  Left = 363
  Top = 241
  Caption = 'Diagnosticos'
  ClientHeight = 485
  ClientWidth = 865
  ExplicitWidth = 871
  ExplicitHeight = 514
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 865
    Height = 485
    ExplicitWidth = 865
    ExplicitHeight = 485
    inherited _pnlFooter: TJvPanel
      Top = 454
      Width = 861
      ExplicitTop = 454
      ExplicitWidth = 861
      inherited _imageBottom: TImage
        Width = 861
        ExplicitWidth = 861
      end
      inherited _btbPrior: TTcGDIButton
        Left = 670
        ExplicitLeft = 670
      end
      inherited _btbNext: TTcGDIButton
        Left = 761
        ExplicitLeft = 761
      end
      inherited _btbExecute: TTcGDIButton
        Left = 776
        ExplicitLeft = 776
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 861
      Height = 452
      ExplicitWidth = 861
      ExplicitHeight = 452
      inherited PageControl: TJvPageControl
        Width = 861
        Height = 452
        ActivePage = TabSheet1
        ExplicitWidth = 861
        ExplicitHeight = 452
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object chkQuickInput: TCheckBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 855
            Height = 17
            Align = alTop
            Caption = 'Informar dados para digita'#231#227'o r'#225'pida'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = chkQuickInputClick
          end
          object pnlQuickInput: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 26
            Width = 855
            Height = 74
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object gbQuickFields: TGroupBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 849
              Height = 68
              Align = alClient
              TabOrder = 0
              object lblEdPadraoData: TLabel
                Left = 15
                Top = 11
                Width = 23
                Height = 13
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = '&Data'
                FocusControl = dePadraoDiagnostico
              end
              object lblDiagnosticoPadrao: TLabel
                Left = 150
                Top = 11
                Width = 55
                Height = 13
                Caption = 'Diagn'#243'stico'
              end
              object lblProtocolosPadrao: TLabel
                Left = 348
                Top = 11
                Width = 45
                Height = 13
                Caption = 'Protocolo'
              end
              object dePadraoDiagnostico: TTcDateEdit
                Left = 14
                Top = 31
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
              object dblcDiagnosticoPadrao: TDBLookupComboBox
                Left = 150
                Top = 31
                Width = 157
                Height = 21
                DataField = 'CODIGO_DIAGNOSTICO'
                DataSource = dtsPadroes
                DropDownRows = 10
                DropDownWidth = 300
                TabOrder = 1
                OnKeyDown = dblcDiagnosticoPadraoKeyDown
              end
              object dblcProtocoloPadrao: TDBLookupComboBox
                Left = 348
                Top = 31
                Width = 143
                Height = 21
                DataField = 'CODIGO_PROTOCOLO'
                DataSource = dtsPadroes
                DropDownWidth = 160
                TabOrder = 2
                OnKeyDown = dblcProtocoloPadraoKeyDown
              end
              object pnlQuartoPadrao: TPanel
                Left = 499
                Top = 3
                Width = 113
                Height = 59
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 3
                object lblQuartoPadrao: TLabel
                  Left = 25
                  Top = 8
                  Width = 34
                  Height = 13
                  Caption = 'Quarto'
                end
                object dblcQuartoPadrao: TDBLookupComboBox
                  Left = 24
                  Top = 28
                  Width = 73
                  Height = 21
                  DataField = 'QUARTO_DESCR'
                  DataSource = dtsPadroes
                  TabOrder = 0
                  OnKeyDown = dblcQuartoPadraoKeyDown
                end
              end
            end
          end
          object pnlIput: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 106
            Width = 855
            Height = 76
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            DesignSize = (
              855
              76)
            object gbFields: TGroupBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 710
              Height = 70
              Anchors = [akLeft, akTop, akRight]
              Caption = 'Entrada de dados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object Label7: TLabel
                Left = 15
                Top = 17
                Width = 32
                Height = 13
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = '&F'#234'mea'
                FocusControl = edtBrinco
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label12: TLabel
                Left = 150
                Top = 17
                Width = 23
                Height = 13
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label1: TLabel
                Left = 270
                Top = 17
                Width = 55
                Height = 13
                Caption = 'Diagn'#243'stico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label2: TLabel
                Left = 450
                Top = 17
                Width = 45
                Height = 13
                Caption = 'Protocolo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object edtBrinco: TJvComboEdit
                Left = 14
                Top = 37
                Width = 107
                Height = 21
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                ButtonWidth = 15
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ImageKind = ikEllipsis
                ParentFont = False
                TabOrder = 0
                Text = ''
                OnButtonClick = edtBrincoButtonClick
                OnEnter = edtBrincoEnter
                OnKeyDown = edtBrincoKeyDown
                OnKeyPress = edtBrincoKeyPress
              end
              object deData: TTcDBDateEdit
                Left = 150
                Top = 37
                Width = 98
                Height = 21
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Checked = False
                DataField = 'DATA'
                DataSource = dtsDiagnosticosAplicar
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
                OnKeyDown = deDataKeyDown
              end
              object dblcDiagnostico: TDBLookupComboBox
                Left = 270
                Top = 37
                Width = 157
                Height = 21
                DataField = 'CODIGO_DIAGNOSTICO'
                DataSource = dtsDiagnosticosAplicar
                DropDownRows = 10
                DropDownWidth = 300
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                OnKeyDown = dblcDiagnosticoKeyDown
              end
              object dblcProtocolo: TDBLookupComboBox
                Left = 450
                Top = 37
                Width = 145
                Height = 21
                DataField = 'CODIGO_PROTOCOLO'
                DataSource = dtsDiagnosticosAplicar
                DropDownWidth = 160
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                OnCloseUp = dblcProtocoloCloseUp
                OnKeyDown = dblcProtocoloKeyDown
              end
              object pnlQuarto: TPanel
                Left = 601
                Top = 13
                Width = 106
                Height = 51
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 4
                object lblQuarto: TLabel
                  Left = 23
                  Top = 4
                  Width = 34
                  Height = 13
                  Caption = 'Quarto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object dblcQuarto: TDBLookupComboBox
                  Left = 20
                  Top = 24
                  Width = 73
                  Height = 21
                  DataField = 'QUARTO_DESCR'
                  DataSource = dtsDiagnosticosAplicar
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnKeyDown = dblcQuartoKeyDown
                end
              end
            end
            object BitBtn2: TTcGDIButton
              Left = 726
              Top = 21
              Width = 126
              Height = 29
              Anchors = [akTop, akRight]
              Caption = 'Remover diagn'#243'stico selecionado'
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
          object JvDBUltimGrid1: TJvDBUltimGrid
            AlignWithMargins = True
            Left = 2
            Top = 187
            Width = 857
            Height = 240
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtsDiagnosticosAplicar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
            AutoAppend = False
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <
              item
                ControlName = 'dblcProtocoloGrid'
                FieldName = 'DESC_PROTOCOLO'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
              end
              item
                ControlName = 'deDataGrid'
                FieldName = 'DATA'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'dblcDiagnosticoGrid'
                FieldName = 'CODIGO_DIAGNOSTICO'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
              end>
            RowsHeight = 17
            TitleRowHeight = 20
            ReadOnlyCellColor = clBtnFace
          end
          object dblcProtocoloGrid: TDBLookupComboBox
            Left = 598
            Top = 257
            Width = 145
            Height = 21
            DataField = 'CODIGO_PROTOCOLO'
            DataSource = dtsDiagnosticosAplicar
            DropDownWidth = 160
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = False
            OnCloseUp = dblcProtocoloCloseUp
            OnDropDown = dblcProtocoloGridDropDown
            OnKeyDown = dblcProtocoloGridKeyDown
          end
          object deDataGrid: TTcDBDateEdit
            Left = 466
            Top = 349
            Width = 98
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Checked = False
            DataField = 'DATA'
            DataSource = dtsDiagnosticosAplicar
            CheckOnExit = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ButtonWidth = 17
            ParentFont = False
            TabOrder = 5
            Visible = False
            OnKeyDown = deDataKeyDown
          end
          object dblcDiagnosticoGrid: TDBLookupComboBox
            Left = 514
            Top = 221
            Width = 157
            Height = 21
            DataField = 'CODIGO_DIAGNOSTICO'
            DataSource = dtsDiagnosticosAplicar
            DropDownRows = 10
            DropDownWidth = 300
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'KZOO_DIAGNOSTICO'
            ListField = 'CODIGO'
            ParentFont = False
            TabOrder = 6
            Visible = False
            OnKeyDown = dblcDiagnosticoGridKeyDown
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
  object dtsDiagnosticosAplicar: TDataSource
    DataSet = Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicar
    OnDataChange = dtsDiagnosticosAplicarDataChange
    Left = 358
    Top = 9
  end
  object dtsPadroes: TDataSource
    DataSet = Zoo_SanidadeDiagnosticosDatamodule.cdsPadroes
    OnDataChange = dtsPadroesDataChange
    Left = 280
    Top = 2
  end
end
