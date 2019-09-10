inherited Zoo_SanidadeDiagnosticosWizard: TZoo_SanidadeDiagnosticosWizard
  Left = 363
  Top = 241
  Caption = 'Dados sanit'#225'rios'
  ClientHeight = 485
  ClientWidth = 1170
  ExplicitWidth = 1176
  ExplicitHeight = 514
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 1170
    Height = 485
    ExplicitWidth = 1170
    ExplicitHeight = 485
    inherited _pnlFooter: TJvPanel
      Top = 454
      Width = 1166
      ExplicitTop = 454
      ExplicitWidth = 1166
      inherited _imageBottom: TImage
        Width = 1166
        ExplicitWidth = 861
      end
      inherited _btbPrior: TTcGDIButton
        Left = 975
        ExplicitLeft = 975
      end
      inherited _btbNext: TTcGDIButton
        Left = 1066
        ExplicitLeft = 1066
      end
      inherited _btbExecute: TTcGDIButton
        Left = 1081
        ExplicitLeft = 1081
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 1166
      Height = 452
      ExplicitWidth = 1166
      ExplicitHeight = 452
      inherited PageControl: TJvPageControl
        Width = 1166
        Height = 452
        ActivePage = TabSheet1
        ExplicitWidth = 1166
        ExplicitHeight = 452
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object chkQuickInput: TCheckBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 1160
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
            Width = 1160
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
              Width = 1154
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
              end
              object lblDiagnosticoPadrao: TLabel
                Left = 150
                Top = 11
                Width = 55
                Height = 13
                Caption = 'Diagn'#243'stico'
              end
              object lblProtocolosPadrao: TLabel
                Left = 445
                Top = 11
                Width = 45
                Height = 13
                Caption = 'Protocolo'
              end
              object Label3: TLabel
                Left = 631
                Top = 11
                Width = 37
                Height = 13
                Caption = 'Tarefas'
              end
              object Label22: TLabel
                Left = 785
                Top = 11
                Width = 61
                Height = 13
                Caption = '&Respons'#225'vel'
                FocusControl = edFuncionarioPadrao
              end
              object lblQuartoPadrao: TLabel
                Left = 326
                Top = 11
                Width = 34
                Height = 13
                Caption = 'Quarto'
              end
              object imgFuncionarioPadrao: TImage
                Left = 935
                Top = 33
                Width = 16
                Height = 16
                Cursor = crHelp
                ParentShowHint = False
                ShowHint = True
              end
              object CheckListBox1: TCheckListBox
                Left = 350
                Top = 4
                Width = 100
                Height = 77
                ItemHeight = 13
                Items.Strings = (
                  'AD'
                  'AE'
                  'PD'
                  'PE')
                TabOrder = 6
                Visible = False
              end
              object edQuartoPadrao: TJvDBComboEdit
                Left = 325
                Top = 31
                Width = 88
                Height = 21
                DataField = 'QUARTOS'
                DataSource = dtsPadroes
                ImageKind = ikDropDown
                ReadOnly = True
                TabOrder = 2
                OnButtonClick = edQuartoPadraoButtonClick
                OnChange = edQuartoPadraoChange
                OnClick = edQuartoPadraoClick
                OnKeyDown = edQuartoPadraoKeyDown
                TextHint = ' '
              end
              object dblcDiagnosticoPadrao: TDBLookupComboBox
                Left = 150
                Top = 31
                Width = 140
                Height = 21
                DataField = 'NOME_DIAGNOSTICO'
                DataSource = dtsPadroes
                DropDownRows = 10
                DropDownWidth = 300
                TabOrder = 1
                OnKeyDown = dblcDiagnosticoPadraoKeyDown
              end
              object dblcProtocoloPadrao: TDBLookupComboBox
                Left = 444
                Top = 31
                Width = 143
                Height = 21
                DataField = 'CODIGO_PROTOCOLO'
                DataSource = dtsPadroes
                DropDownWidth = 160
                TabOrder = 3
                OnKeyDown = dblcProtocoloPadraoKeyDown
              end
              object edTarefasPadrao: TJvDBComboEdit
                Left = 626
                Top = 31
                Width = 125
                Height = 21
                DataField = 'DESCR_TAREFAS'
                DataSource = dtsPadroes
                ImageKind = ikDropDown
                ReadOnly = True
                TabOrder = 4
                OnButtonClick = edTarefasPadraoButtonClick
                OnChange = edTarefasPadraoChange
                OnClick = edTarefasPadraoClick
                OnKeyDown = edTarefasPadraoKeyDown
              end
              object edFuncionarioPadrao: TJvDBComboEdit
                Left = 785
                Top = 31
                Width = 137
                Height = 21
                DataField = 'NOMEFUNCIONARIO'
                DataSource = dtsPadroes
                ImageKind = ikEllipsis
                ButtonWidth = 15
                TabOrder = 5
                OnButtonClick = edFuncionarioPadraoButtonClick
                OnChange = edFuncionarioPadraoChange
                OnKeyPress = edFuncionarioPadraoKeyPress
              end
              object edDataPadrao: TTcDBDateEdit
                Left = 11
                Top = 31
                Width = 98
                Height = 21
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Checked = False
                DataField = 'DATA'
                DataSource = dtsPadroes
                CheckOnExit = False
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ButtonWidth = 17
                ParentFont = False
                TabOrder = 0
                OnKeyDown = edDataPadraoKeyDown
              end
              object btnAddDiagnosticoPadrao: TTcGDIButton
                Left = 295
                Top = 27
                Width = 20
                Height = 21
                Hint = 'Adicionar diagn'#243'stico'
                Caption = '+'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentShowHint = False
                ShowHint = True
                TabOrder = 7
                OnClick = btnAddDiagnosticoPadraoClick
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
              object btnAddProtocoloPadrao: TTcGDIButton
                Left = 593
                Top = 27
                Width = 20
                Height = 21
                Hint = 'Adicionar protocolo'
                Caption = '+'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentShowHint = False
                ShowHint = True
                TabOrder = 8
                OnClick = btnAddProtocoloPadraoClick
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
              object BtnAddTarefaPadrao: TTcGDIButton
                Left = 757
                Top = 27
                Width = 20
                Height = 21
                Hint = 'Adicionar tarefa'
                Caption = '+'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentShowHint = False
                ShowHint = True
                TabOrder = 9
                OnClick = BtnAddTarefaPadraoClick
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
          object pnlIput: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 106
            Width = 1160
            Height = 76
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            DesignSize = (
              1160
              76)
            object gbFields: TGroupBox
              AlignWithMargins = True
              Left = 3
              Top = 2
              Width = 1015
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
                FocusControl = edBrinco
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label12: TLabel
                Left = 140
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
                Left = 256
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
                Left = 522
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
              object Label4: TLabel
                Left = 692
                Top = 17
                Width = 37
                Height = 13
                Caption = 'Tarefas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label5: TLabel
                Left = 851
                Top = 17
                Width = 61
                Height = 13
                Caption = '&Respons'#225'vel'
                FocusControl = edFuncionario
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblQuarto: TLabel
                Left = 430
                Top = 17
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
              object imgFuncionario: TImage
                Left = 993
                Top = 38
                Width = 16
                Height = 16
                Cursor = crHelp
                ParentShowHint = False
                ShowHint = True
              end
              object imgValidateResponsavel: TImage
                Left = 993
                Top = 16
                Width = 16
                Height = 16
                Cursor = crHelp
                ParentShowHint = False
                ShowHint = True
              end
              object edBrinco: TJvComboEdit
                Left = 14
                Top = 37
                Width = 107
                Height = 21
                Hint = 'Utilize Ctrl + Enter para incluir o animal mais de uma vez'
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
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = ''
                OnButtonClick = edBrincoButtonClick
                OnChange = edBrincoChange
                OnEnter = edBrincoEnter
                OnKeyPress = edBrincoKeyPress
                OnKeyUp = edBrincoKeyUp
              end
              object deData: TTcDBDateEdit
                Left = 140
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
                Left = 256
                Top = 37
                Width = 135
                Height = 21
                DataField = 'NOME_DIAGNOSTICO'
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
                Left = 522
                Top = 37
                Width = 132
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
                OnCloseUp = dblcProtocoloCloseUp
                OnKeyDown = dblcProtocoloKeyDown
              end
              object edTarefas: TJvDBComboEdit
                Left = 692
                Top = 37
                Width = 123
                Height = 21
                DataField = 'DESCR_TAREFAS'
                DataSource = dtsDiagnosticosAplicar
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ImageKind = ikDropDown
                ParentFont = False
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 5
                OnButtonClick = edTarefasButtonClick
                OnChange = edTarefasChange
                OnClick = edTarefasClick
                OnKeyDown = edTarefasKeyDown
              end
              object edFuncionario: TJvDBComboEdit
                Left = 851
                Top = 37
                Width = 133
                Height = 21
                DataField = 'NOMEFUNCIONARIO'
                DataSource = dtsDiagnosticosAplicar
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ImageKind = ikEllipsis
                ButtonWidth = 15
                ParentFont = False
                TabOrder = 6
                OnButtonClick = edFuncionarioButtonClick
                OnChange = edFuncionarioChange
                OnKeyPress = edFuncionarioKeyPress
              end
              object dblcQuarto: TDBLookupComboBox
                Left = 430
                Top = 37
                Width = 76
                Height = 21
                DataField = 'QUARTO_DESCR'
                DataSource = dtsDiagnosticosAplicar
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                OnKeyDown = dblcQuartoKeyDown
              end
              object btnAddDiagnostico: TTcGDIButton
                Left = 397
                Top = 33
                Width = 20
                Height = 21
                Hint = 'Adicionar diagn'#243'stico'
                Caption = '+'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentShowHint = False
                ShowHint = True
                TabOrder = 7
                OnClick = btnAddDiagnosticoClick
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
              object btnAddProtocolo: TTcGDIButton
                Left = 660
                Top = 33
                Width = 20
                Height = 21
                Hint = 'Adicionar protocolo'
                Caption = '+'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentShowHint = False
                ShowHint = True
                TabOrder = 8
                OnClick = btnAddProtocoloClick
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
              object btnAddTarefa: TTcGDIButton
                Left = 821
                Top = 33
                Width = 20
                Height = 21
                Hint = 'Adicionar tarefa'
                Caption = '+'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentShowHint = False
                ShowHint = True
                TabOrder = 9
                OnClick = btnAddTarefaClick
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
            object BitBtn2: TTcGDIButton
              Left = 1021
              Top = 43
              Width = 137
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
              TabOrder = 2
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
              Left = 1021
              Top = 8
              Width = 137
              Height = 29
              Action = actSelectByPersonalizado
              Anchors = [akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
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
          object dbgDiagnosticosAplicar: TJvDBUltimGrid
            AlignWithMargins = True
            Left = 2
            Top = 187
            Width = 1162
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
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
            OnEditButtonClick = dbgDiagnosticosAplicarEditButtonClick
            OnKeyPress = dbgDiagnosticosAplicarKeyPress
            AutoAppend = False
            OnGetCellParams = dbgDiagnosticosAplicarGetCellParams
            OnShowEditor = dbgDiagnosticosAplicarShowEditor
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
                ControlName = 'edTarefasGrid'
                FieldName = 'DESCR_TAREFAS'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
              end
              item
                ControlName = 'dblcDiagnosticoGrid'
                FieldName = 'NOME_DIAGNOSTICO'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
              end>
            RowsHeight = 17
            TitleRowHeight = 20
            ReadOnlyCellColor = clBtnFace
          end
          object dblcProtocoloGrid: TDBLookupComboBox
            Left = 298
            Top = 188
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
            Top = 309
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
            Left = 114
            Top = 188
            Width = 157
            Height = 21
            DataField = 'NOME_DIAGNOSTICO'
            DataSource = dtsDiagnosticosAplicar
            DropDownRows = 10
            DropDownWidth = 300
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Visible = False
            OnKeyDown = dblcDiagnosticoGridKeyDown
          end
          object PanelTarefasPadrao: TPanel
            Left = 100
            Top = 260
            Width = 513
            Height = 219
            Caption = 'PanelTarefasPadrao'
            TabOrder = 7
            Visible = False
            object dbgTarefasPadrao: TJvDBUltimGrid
              Left = 1
              Top = 1
              Width = 511
              Height = 217
              Align = alClient
              DataSource = dtsTarefasPadrao
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = dbgTarefasPadraoCellClick
              OnKeyPress = dbgTarefasPadraoKeyPress
              AutoAppend = False
              OnGetCellParams = dbgTarefasPadraoGetCellParams
              OnShowEditor = dbgTarefasPadraoShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              OnCheckIfBooleanField = dbgTarefasPadraoCheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CHECKED'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  ReadOnly = True
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'Tarefa'
                  Width = 388
                  Visible = True
                end>
            end
          end
          object PanelTarefas: TPanel
            Left = 700
            Top = 258
            Width = 513
            Height = 219
            Caption = 'PanelTarefas'
            TabOrder = 8
            Visible = False
            object dbgTarefas: TJvDBUltimGrid
              Left = 1
              Top = 1
              Width = 511
              Height = 217
              Align = alClient
              DataSource = dtsTarefas
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = dbgTarefasCellClick
              OnKeyPress = dbgTarefasKeyPress
              AutoAppend = False
              OnGetCellParams = dbgTarefasGetCellParams
              OnShowEditor = dbgTarefasShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              OnCheckIfBooleanField = dbgTarefasCheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CHECKED'
                  Width = 62
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  ReadOnly = True
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'Tarefa'
                  Width = 378
                  Visible = True
                end>
            end
          end
          object edTarefasGrid: TJvDBComboEdit
            Left = 480
            Top = 188
            Width = 125
            Height = 21
            DataField = 'DESCR_TAREFAS'
            DataSource = dtsDiagnosticosAplicar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageKind = ikDropDown
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
            Visible = False
            OnButtonClick = edTarefasGridButtonClick
            OnClick = edTarefasGridClick
            OnKeyDown = edTarefasGridKeyDown
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
    object actSelectByPersonalizado: TAction
      Caption = 'Selecionar animais via relat'#243'rio personalizado'
      OnExecute = actSelectByPersonalizadoExecute
      OnUpdate = actSelectByPersonalizadoUpdate
    end
  end
  object dtsDiagnosticosAplicar: TDataSource
    DataSet = Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicar
    OnDataChange = dtsDiagnosticosAplicarDataChange
    Left = 378
    Top = 5
  end
  object dtsPadroes: TDataSource
    DataSet = Zoo_SanidadeDiagnosticosDatamodule.cdsPadroes
    OnDataChange = dtsPadroesDataChange
    Left = 280
    Top = 2
  end
  object ControlPopuperTarefasPadrao: TTcControlPopuper
    Control = PanelTarefasPadrao
    PopupStyle = cpsPopup
    OnClose = ControlPopuperTarefasPadraoClose
    Left = 878
    Top = 213
  end
  object ControlPopuperTarefas: TTcControlPopuper
    Control = PanelTarefas
    PopupStyle = cpsPopup
    OnClose = ControlPopuperTarefasClose
    Left = 930
    Top = 277
  end
  object dtsTarefas: TDataSource
    DataSet = Zoo_SanidadeDiagnosticosDatamodule.cdsTarefas
    Left = 658
    Top = 321
  end
  object dtsTarefasPadrao: TDataSource
    DataSet = Zoo_SanidadeDiagnosticosDatamodule.cdsTarefasPadrao
    Left = 290
    Top = 309
  end
  object ImageList1: TImageList
    Left = 1007
    Top = 52
    Bitmap = {
      494C010103000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFCFCFCFFFEFEFDFFFCFDFBFFFBFCFCFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFCFDFCFFFFFFFBFFDFE6EFFFE3E7F3FFE2E7F3FFE5E7F5FFE2E6F2FFFBFE
      FDFFFFFFFBFFFAFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFDFFFFFF
      FBFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFBFEFAFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFEFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF5A79D0FF0008B7FF0013B5FF0013B6FF0011B7FF000FB3FF0126
      BAFFF5FCF9FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAFF7FB7
      EAFF60ABE9FF63ADEAFF63ACE9FF63ADE9FF62ADEAFF63ACE9FF63ACE9FF5CAD
      E9FF5EABE4FFA7D5EBFFFFFFF9FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFFCFE
      FDFFFFFFFFFFE4EFE9FF006244FFCEE4DBFFFFFFFFFFFCFEFDFFFFFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFBFDFFFFFF
      FFFF5E76CBFF0013BBFF0022BAFF0328C3FF092DBDFF072CC4FF0026BFFF001E
      B5FF0928BEFFF3F4FAFFFFFFFDFFFFFDFEFFFFFFFFFFFFFFFFFF248CE3FF007D
      F7FF007FF5FF007FF5FF0080F5FF0082FFFF0084FFFF0082FEFF0083F5FF007E
      F3FF0082F5FF0070EFFFA9D2E7FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFDFFFFFF
      FFFFE4ECEBFF036B41FF036F44FF016440FFD0E3DEFFFFFFFFFFFAFBFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFF5D78
      CDFF001DBFFF3555CBFF8CA5DDFF002CBFFF0831C6FF0025BBFF4D71CEFF808F
      DEFF0022C1FF0834B9FFF0F2F8FFFBFEFEFFFFFFFFFFFFFFFFFF0079E4FF048C
      F3FF088BF5FF088BF4FF078EFFFF1867A7FF402211FF1174BEFF0B8DFCFF0A8B
      F5FF068CF5FF0088F6FF60ACE7FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFE9EF
      EFFF006E43FF127A53FF157B59FF177C55FF026946FFCCE7DEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFF8C97DAFF0026
      C3FF002AC5FFFFFFFBFFFFFFFEFFD5DFF1FF0020C0FF6480DBFFFFFFFFFFFFFF
      FEFF4B6ED1FF002FCCFF0E38BAFFFFFFFDFFFFFFFFFFFFFFFFFF58B2EAFF0190
      FAFF0F90F4FF0F90F5FF0E94F7FF147FCCFF274657FF1984DCFF0B94FBFF1190
      F5FF0D91F5FF0087F0FFD1E8F3FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFDFDFDFFD9EAE6FF0972
      49FF1F855FFF1F8660FF20855FFF218761FF20865EFF026E4AFFCFE5DDFFFFFF
      FFFFFBF9F8FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A85D7FF043E
      CEFF043BCDFF7898E0FFFFFFFDFFFFFFFFFFDDE8F3FFFFFFFEFFFFFFF6FFEBF0
      F7FF063FCEFF1045CEFF0028C6FFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F5FF008F
      ECFF149AF7FF159AF6FF149AF5FF1599FBFF1A6692FF139EFFFF0F97F6FF1198
      F3FF0B97F8FF41A9E9FFFFFFFAFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFD6E7E4FF127C55FF2A90
      67FF298E68FF298F69FF228C64FF2A906AFF2D8D67FF2A9168FF187654FFC8E1
      DAFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6C8AD7FF0B48
      D6FF1854CEFF003FD1FF7D9DE5FFFFFFFBFFFFFEFAFFFEFFFCFFD0E1F4FF0F47
      D2FF0E4ED7FF1356D0FF0034C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFF7CBF
      E7FF0C9FF9FF16A0F4FF21A1FEFF1884CAFF421701FF1498E7FF1BA4F8FF1DA1
      F5FF0798F1FFE4F0F5FFFFFEFBFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF7BB19FFF1F9366FF3399
      73FF399874FF1B9065FF9CC8B5FF1E8A62FF399D70FF339A6FFF31986FFF1F80
      5EFFD0E0DBFFFFFFFFFFFBFFFEFFFBFDFDFFFFFFFFFFFFFFFFFF6F8EDAFF0C54
      D8FF1C59E0FF054FD4FF5A8EDEFFFFFFF9FFFFFDFEFFFFFFFAFFCED9EEFF0049
      D8FF195BD9FF195ADFFF043DC5FFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFDFFFFFC
      FBFF1B9EF0FF1DAAF4FF24ADFFFF297EB3FF351F0DFF2B94D8FF24AAFBFF15AA
      F8FF68B8EBFFFFFFFBFFF9FEFEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFEFEFEFF7DAF9AFF2BA1
      6DFF27986CFFBAD5CBFFFFFFFFFFD5E3DFFF23936BFF3EA77FFF44A57AFF35A9
      7AFF1E885CFFCEDFDCFFFFFFFFFFFEFBFEFFFFFFFFFFFFFFFFFF6F8FD9FF1461
      DFFF115FDFFF7099E9FFFFFFFCFFFCFFFCFFF1F5FBFFFFFFFEFFFFFFFCFFE0EC
      F2FF105CDEFF1A6ADCFF0343CAFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFEFFFFFF
      FFFF8FC9E6FF1DAFFBFF2BB6FFFF2B7BABFF321E0FFF2989C2FF2AB6FDFF0FA2
      EEFFFEF8F8FFFCFEFAFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFBFCFFFFFFFFFFFF8CBB
      ABFFBCD8D0FFFFFFFFFFFBFDFCFFFFFFFFFFD1E1D6FF2D9B74FF4FB187FF4DAD
      86FF4DB183FF28926AFFC3DDD0FFFFFFFFFFFFFFFFFFFFFFFFFF7595DCFF166C
      EDFF0F65D9FFFDFFFBFFFFFFFCFFE6F0FBFF0C62D9FF85B6EDFFFFFFFDFFFFFF
      FFFF5B97E4FF176EE8FF0851D2FFFFFFFEFFFFFFFFFFFFFFFFFFFEFEFEFFFEFE
      FEFFFFFFFBFF22A7E2FF2FC1FFFF327498FF342010FF3284B2FF23C5FFFF8EC5
      E6FFFFFFFFFFF8FEFBFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1E2DAFF31A272FF5BB9
      8DFF50B48FFF52BD8DFF3F9472FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFCFF3670
      D9FF1377EEFF5A9AEBFFB6D3F3FF2377E4FF1F75EBFF0C6DE8FF7AADEEFFA4CC
      F4FF1D72E3FF1465E6FFC7CDEFFFFFFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FEFFFFFFFEFFACD5EAFF28C4FEFF358FABFF2A0A01FF389CC9FF25AFF1FFFFFF
      FDFFFFFFFAFFFCFDFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFFFFFFFFFFC3DFD4FF41A6
      81FF61C893FF40A47DFFF0F5F3FFFFFEFEFFFFFFFFFFFFFFFFFFF9FEF9FFFFFF
      FBFF4575D9FF1A80F1FF1576E9FF287EE7FF2B80EDFF2A80EAFF237CE8FF1177
      EEFF196DECFFCBD1E8FFFFFFFAFFF7FDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
      FDFFFBFBFCFFFFFFFCFF3CB5E4FF3ACBFFFF49D7FFFF25C8FEFFA7D4E4FFFFFF
      FDFFFCFDFDFFFFFDFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFFFFFFFFFFFFFFCADB
      D5FF3FA67CFFF1F0F2FFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFDFFFFFFFF
      FFFFFFFFFBFF3E77DBFF208CF6FF228DF3FF248CF1FF258BF4FF258CF6FF1772
      E6FFC5CFE8FFFFFFFDFFFFFEFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
      FEFFFEFEFFFFFFFFFFFFD1E2EDFF2AC5ECFF36D9FCFF49BCDFFFFFFEFCFFFEFF
      FFFFFFFEFEFFFFFFFEFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFEFFFFFDFFFFFFFF
      FFFFFEFFFFFFFEFEFEFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF8FFFCFAF7FFA4B7DEFFA8BAE6FFA8BBE6FFA8B8E6FFA2B4E3FFD3DC
      F1FFFFFFF9FFFAFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFAFFD8E8EEFFA1D0E6FFFFFAFDFFFBFBF7FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFFFCFEFEFFFEFF
      FCFFFDFEFEFFFEFDFDFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFBFDFDFFFFFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
      FFFFFBFDFDFFFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFCFDFFFFFEFFFFFFFFFAFFFFFEFDFFFDFCFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ControlPopuperQuartosPadrao: TTcControlPopuper
    Control = CheckListBox1
    PopupStyle = cpsPopup
    OnClose = ControlPopuperQuartosPadraoClose
    OnKeyPress = ControlPopuperQuartosPadraoKeyPress
    Left = 586
    Top = 53
  end
end
