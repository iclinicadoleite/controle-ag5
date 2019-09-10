inherited Zoo_ReproducaoPartosAbortosWizard: TZoo_ReproducaoPartosAbortosWizard
  Left = 406
  Top = 252
  Caption = 'Partos / Abortos'
  ClientHeight = 378
  ClientWidth = 813
  ActionList.Left = 540
  ActionList.Top = 48
  ExplicitWidth = 819
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 813
    Height = 378
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 813
    ExplicitHeight = 378
    inherited _pnlFooter: TJvPanel
      Top = 347
      Width = 809
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitTop = 347
      ExplicitWidth = 809
      inherited _imageBottom: TImage
        Width = 809
        ExplicitWidth = 809
      end
      inherited _btbPrior: TTcGDIButton
        Left = 590
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 590
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 694
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 694
      end
      inherited _btbExecute: TTcGDIButton
        Left = 712
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 712
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 809
      Height = 345
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 809
      ExplicitHeight = 345
      inherited PageControl: TJvPageControl
        Width = 809
        Height = 345
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ActivePage = TabSheet2
        ParentFont = False
        ExplicitWidth = 809
        ExplicitHeight = 345
        object tbsPeriodo: TTabSheet
          Caption = 'tbsPeriodo'
          object lblA: TLabel
            Left = 439
            Top = 112
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object rbTodos: TRadioButton
            Left = 112
            Top = 150
            Width = 202
            Height = 15
            Caption = 'Todas as Prenhez Confirmadas'
            TabOrder = 5
          end
          object rbPrenhezPeriodo: TRadioButton
            Left = 112
            Top = 111
            Width = 202
            Height = 17
            Caption = 'Todas as Prenhez no Per'#237'odo'
            TabOrder = 2
          end
          object rbPrevisaoParto: TRadioButton
            Left = 111
            Top = 72
            Width = 202
            Height = 17
            Caption = 'Animais com parto previsto at'#233
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object deInicioPrenhez: TTcDateEdit
            Left = 328
            Top = 110
            Width = 105
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 19
            TabOrder = 3
          end
          object deFimPrenhez: TTcDateEdit
            Left = 454
            Top = 110
            Width = 105
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 19
            TabOrder = 4
          end
          object dePrevisaoParto: TTcDateEdit
            Left = 328
            Top = 71
            Width = 105
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 19
            TabOrder = 1
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          object dbgPartosAbortos: TJvDBUltimGrid
            Left = 0
            Top = 51
            Width = 809
            Height = 271
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtsPartosAbortos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
            OnEditButtonClick = dbgPartosAbortosEditButtonClick
            OnKeyDown = dbgPartosAbortosKeyDown
            OnKeyPress = dbgPartosAbortosKeyPress
            AutoAppend = False
            ClearSelection = False
            OnShowEditor = dbgPartosAbortosShowEditor
            AutoSizeColumns = True
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <
              item
                ControlName = 'deDataGrid'
                FieldName = 'DATAABORTOPARTO'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'dblcOcorrenciaGrid'
                FieldName = 'DESC_PARTOABORTO'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
              end
              item
                ControlName = 'edProtocolosGrid'
                FieldName = 'DESCR_PROTOCOLOS'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end>
            RowsHeight = 16
            TitleRowHeight = 16
            OnCheckIfBooleanField = dbgPartosAbortosCheckIfBooleanField
            Columns = <
              item
                Expanded = False
                FieldName = 'BRINCOFEMEA'
                ReadOnly = True
                Width = 84
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEFEMEA'
                ReadOnly = True
                Width = 86
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREVISAOPARTO'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Previs'#227'o parto'
                Width = 92
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAABORTOPARTO'
                Title.Alignment = taCenter
                Width = 114
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESC_PARTOABORTO'
                Title.Alignment = taCenter
                Width = 101
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'INCLUIRCRIA'
                Title.Alignment = taCenter
                Title.Caption = 'Cadastrar cria(s)'
                Width = 133
                Visible = True
              end
              item
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'NUMEROFILHOS'
                Title.Caption = 'Cria(s)'
                Width = 66
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCR_PROTOCOLOS'
                Title.Caption = 'Protocolos'
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROTOCOLO_PARTO'
                Title.Caption = 'Aplicar Protocolo'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'LOTEPARTO'
                ReadOnly = True
                Width = 60
                Visible = True
              end>
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 809
            Height = 51
            Align = alTop
            Caption = 'Digita'#231#227'o de dados comuns'
            TabOrder = 1
            object Label5: TLabel
              Left = 12
              Top = 23
              Width = 29
              Height = 13
              Caption = '&Brinco'
            end
            object Label6: TLabel
              Left = 419
              Top = 24
              Width = 34
              Height = 13
              Caption = 'Evento'
            end
            object Label7: TLabel
              Left = 181
              Top = 23
              Width = 60
              Height = 13
              Caption = 'Data evento'
            end
            object lcOcorrencia: TDBLookupComboBox
              Left = 496
              Top = 20
              Width = 119
              Height = 21
              DataField = 'DESC_PARTOABORTO'
              DataSource = dtsPartosAbortos
              TabOrder = 2
              OnKeyPress = lcOcorrenciaKeyPress
            end
            object deData: TTcDBDateEdit
              Left = 295
              Top = 20
              Width = 105
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Checked = False
              DataField = 'DATAABORTOPARTO'
              DataSource = dtsPartosAbortos
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
            object edtBrinco: TJvComboEdit
              Left = 53
              Top = 19
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
            object BitBtn2: TTcGDIButton
              Left = 655
              Top = 16
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
              TabOrder = 3
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
          object deDataGrid: TTcDBDateEdit
            Left = 295
            Top = 128
            Width = 105
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Checked = False
            DataField = 'DATAABORTOPARTO'
            DataSource = dtsPartosAbortos
            CheckOnExit = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ButtonWidth = 17
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
          object dblcOcorrenciaGrid: TDBLookupComboBox
            Left = 472
            Top = 136
            Width = 119
            Height = 21
            DataField = 'DESC_PARTOABORTO'
            DataSource = dtsPartosAbortos
            TabOrder = 3
            Visible = False
            OnEnter = dblcOcorrenciaGridEnter
            OnExit = dblcOcorrenciaGridExit
            OnKeyDown = dblcOcorrenciaGridKeyDown
          end
          object PanelSelectProtocolos: TPanel
            Left = 152
            Top = 69
            Width = 515
            Height = 254
            Color = clWhite
            ParentBackground = False
            TabOrder = 4
            Visible = False
            object Shape1: TShape
              Left = 256
              Top = 1
              Width = 1
              Height = 252
              Align = alRight
              Brush.Style = bsClear
              Pen.Color = clGray
              ExplicitLeft = 255
            end
            object PanelSelectProtocolosParto: TPanel
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 249
              Height = 246
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object dbgProtocolosParto: TJvDBUltimGrid
                AlignWithMargins = True
                Left = 3
                Top = 38
                Width = 243
                Height = 205
                Align = alClient
                DataSource = dtsProtocolosParto
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnCellClick = dbgProtocolosPartoCellClick
                OnKeyPress = dbgProtocolosPartoKeyPress
                AutoAppend = False
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                CanDelete = False
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                OnCheckIfBooleanField = dbgProtocolosPartoCheckIfBooleanField
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SELECTED'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    ReadOnly = True
                    Title.Caption = 'Protocolo'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO'
                    Title.Caption = 'Protocolo'
                    Width = 150
                    Visible = True
                  end>
              end
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 249
                Height = 35
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                DesignSize = (
                  249
                  35)
                object lbProtocolosParto: TLabel
                  Left = 37
                  Top = 1
                  Width = 198
                  Height = 13
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  Caption = 'Protocolos aplicados '#224' matriz'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ExplicitWidth = 199
                end
                object chkSelectAllProtocolosParto: TCheckBox
                  Left = 16
                  Top = 17
                  Width = 105
                  Height = 17
                  Caption = 'Selecionar Todos'
                  State = cbGrayed
                  TabOrder = 0
                  OnClick = chkSelectAllProtocolosPartoClick
                end
              end
            end
            object PanelSelectProtocolosCria: TPanel
              AlignWithMargins = True
              Left = 260
              Top = 4
              Width = 251
              Height = 246
              Align = alRight
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object dbgProtocolosCria: TJvDBUltimGrid
                AlignWithMargins = True
                Left = 3
                Top = 38
                Width = 245
                Height = 205
                Align = alClient
                DataSource = dtsProtocolosCria
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnCellClick = dbgProtocolosCriaCellClick
                OnKeyPress = dbgProtocolosCriaKeyPress
                AutoAppend = False
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                CanDelete = False
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                OnCheckIfBooleanField = dbgProtocolosCriaCheckIfBooleanField
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SELECTED'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    ReadOnly = True
                    Title.Caption = 'Protocolo'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO'
                    Title.Caption = 'Protocolo'
                    Width = 160
                    Visible = True
                  end>
              end
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 251
                Height = 35
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                DesignSize = (
                  251
                  35)
                object Label1: TLabel
                  Left = 29
                  Top = 1
                  Width = 208
                  Height = 13
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  Caption = 'Protocolos aplicados '#224' cria(s)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object chkSelectAllProtocolosCria: TCheckBox
                  Left = 16
                  Top = 17
                  Width = 104
                  Height = 17
                  Caption = 'Selecionar Todos'
                  State = cbGrayed
                  TabOrder = 0
                  OnClick = chkSelectAllProtocolosCriaClick
                end
              end
            end
          end
          object edProtocolosGrid: TJvDBComboEdit
            Left = 53
            Top = 168
            Width = 125
            Height = 21
            DataField = 'DESCR_PROTOCOLOS'
            DataSource = dtsPartosAbortos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageKind = ikDropDown
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            Visible = False
            OnButtonClick = edProtocolosGridButtonClick
            OnKeyDown = edProtocolosGridKeyDown
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 540
    Top = 48
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object dtsPartosAbortos: TDataSource
    DataSet = Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortos
    OnDataChange = dtsPartosAbortosDataChange
    Left = 493
    Top = 45
  end
  object ControlPopuperProtocolos: TTcControlPopuper
    Control = PanelSelectProtocolos
    PopupStyle = cpsPopup
    OnClose = ControlPopuperProtocolosClose
    Left = 645
    Top = 133
  end
  object dtsProtocolosParto: TDataSource
    DataSet = Zoo_ReproducaoPartosAbortosDatamodule.cdsProtocolosParto
    Left = 650
    Top = 193
  end
  object dtsProtocolosCria: TDataSource
    DataSet = Zoo_ReproducaoPartosAbortosDatamodule.cdsProtocolosCria
    Left = 650
    Top = 245
  end
end
