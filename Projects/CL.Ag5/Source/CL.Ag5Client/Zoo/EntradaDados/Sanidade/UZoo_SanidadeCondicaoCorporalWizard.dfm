inherited Zoo_SanidadeCondicaoCorporalWizard: TZoo_SanidadeCondicaoCorporalWizard
  Left = 417
  Top = 277
  Caption = 'Condi'#231#227'o Corporal'
  ClientHeight = 350
  ClientWidth = 771
  ActionList.Left = 564
  ActionList.Top = 84
  ExplicitWidth = 777
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 56
    Top = -28
    Width = 14
    Height = 13
    Caption = 'CC'
  end
  inherited _pnlForm: TJvPanel
    Width = 771
    Height = 350
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 771
    ExplicitHeight = 350
    inherited _pnlFooter: TJvPanel
      Top = 319
      Width = 767
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitTop = 319
      ExplicitWidth = 767
      inherited _imageBottom: TImage
        Width = 767
        ExplicitWidth = 767
      end
      inherited _btbPrior: TTcGDIButton
        Left = 576
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 576
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 667
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 667
      end
      inherited _btbExecute: TTcGDIButton
        Left = 682
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 682
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 767
      Height = 317
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 767
      ExplicitHeight = 317
      inherited PageControl: TJvPageControl
        Width = 767
        Height = 317
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ActivePage = TabSheet1
        ExplicitWidth = 767
        ExplicitHeight = 317
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 767
            Height = 40
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label1: TLabel
              Left = 8
              Top = 11
              Width = 27
              Height = 13
              Caption = 'Data'
            end
            object Label3: TLabel
              Left = 158
              Top = 11
              Width = 65
              Height = 13
              Caption = 'Funcion'#225'rio'
            end
            object Label2: TLabel
              Left = 395
              Top = 11
              Width = 39
              Height = 13
              Caption = 'Animal'
              FocusControl = edtBrinco
            end
            object Label4: TLabel
              Left = 572
              Top = 11
              Width = 18
              Height = 13
              Caption = 'CC'
              FocusControl = edtBrinco
            end
            object deData: TTcDateEdit
              Left = 46
              Top = 8
              Width = 104
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 19
              TabOrder = 0
            end
            object edNomeFuncionario: TJvComboEdit
              Left = 231
              Top = 8
              Width = 156
              Height = 21
              ButtonWidth = 15
              ImageKind = ikEllipsis
              TabOrder = 1
              Text = ''
              OnButtonClick = edNomeFuncionarioButtonClick
              OnChange = edNomeFuncionarioChange
              OnKeyPress = edNomeFuncionarioKeyPress
            end
            object edtBrinco: TEdit
              Left = 451
              Top = 8
              Width = 111
              Height = 21
              Hint = 'Digite o brinco e tecle enter'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              TextHint = 'Digite o brinco e tecle enter'
              OnEnter = edtBrincoEnter
              OnKeyPress = edtBrincoKeyPress
            end
            object edtCC: TJvDBCalcEdit
              Left = 597
              Top = 8
              Width = 82
              Height = 21
              DisplayFormat = '0.0#'
              MaxLength = 4
              MaxValue = 5.000000000000000000
              MinValue = 0.250000000000000000
              ShowButton = False
              TabOrder = 3
              Value = 0.250000000000000000
              DecimalPlacesAlwaysShown = False
              OnKeyPress = edtCCKeyPress
              DataField = 'CC'
              DataSource = DataSource1
            end
            object BitBtn2: TTcGDIButton
              Left = 697
              Top = 5
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
              TabOrder = 4
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
          object Panel2: TPanel
            Left = 0
            Top = 40
            Width = 767
            Height = 254
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
            TabOrder = 1
            object JvDBUltimGrid1: TJvDBUltimGrid
              Left = 1
              Top = 1
              Width = 765
              Height = 252
              Align = alClient
              BorderStyle = bsNone
              DataSource = DataSource1
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
              TabOrder = 3
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
                  ControlName = 'JvDBCalcEdit1'
                  FieldName = 'CC'
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
              Columns = <
                item
                  Expanded = False
                  FieldName = 'BRINCO'
                  ReadOnly = True
                  Width = 86
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMEESTABULO'
                  ReadOnly = True
                  Width = 206
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA'
                  Width = 95
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CC'
                  Width = 35
                  Visible = True
                end
                item
                  ButtonStyle = cbsEllipsis
                  Expanded = False
                  FieldName = 'NOMEFUNCIONARIO'
                  Width = 186
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBSERVACAO'
                  Width = 92
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOTE'
                  ReadOnly = True
                  Width = 58
                  Visible = True
                end>
            end
            object DBMemo1: TDBMemo
              Left = 368
              Top = 98
              Width = 159
              Height = 83
              DataField = 'OBSERVACAO'
              DataSource = DataSource1
              TabOrder = 0
              Visible = False
            end
            object JvDBCalcEdit1: TJvDBCalcEdit
              Left = 478
              Top = 133
              Width = 112
              Height = 21
              DisplayFormat = '0.00'
              MaxValue = 5.000000000000000000
              MinValue = 1.000000000000000000
              ShowButton = False
              TabOrder = 1
              Value = 1.000000000000000000
              Visible = False
              DecimalPlacesAlwaysShown = False
              DataField = 'CC'
              DataSource = DataSource1
            end
            object JvDBDateEdit1: TTcDBDateEdit
              Left = 321
              Top = 133
              Width = 113
              Height = 21
              Checked = False
              DataField = 'DATA'
              DataSource = DataSource1
              CheckOnExit = False
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 20
              ParentFont = False
              TabOrder = 2
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 564
    Top = 84
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = Zoo_SanidadeCondicaoCorporalDatamodule.cdsCC
    OnDataChange = DataSource1DataChange
    Left = 461
    Top = 77
  end
end
