inherited Zoo_ProducaoControleLeiteiroWizard2: TZoo_ProducaoControleLeiteiroWizard2
  Left = 694
  Top = 171
  Caption = 'Controle leiteiro'
  ClientHeight = 423
  ClientWidth = 1003
  ActionList.Left = 580
  ActionList.Top = 12
  ExplicitWidth = 1009
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 1003
    Height = 423
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 1003
    ExplicitHeight = 423
    inherited _pnlFooter: TJvPanel
      Top = 392
      Width = 999
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitTop = 392
      ExplicitWidth = 999
      inherited _imageBottom: TImage
        Width = 999
        ExplicitWidth = 725
      end
      inherited _btbHelp: TTcGDIButton
        TabOrder = 5
      end
      inherited _btbPrior: TTcGDIButton
        Left = 808
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 808
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 899
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 899
      end
      inherited _btbExecute: TTcGDIButton
        Left = 915
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 915
      end
      object Button3: TTcGDIButton
        Left = 364
        Top = 3
        Width = 75
        Height = 25
        Caption = 'ORD1 = 1'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 4
        OnClick = Button3Click
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
    inherited _pnlDetail: TJvPanel
      Width = 999
      Height = 390
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 999
      ExplicitHeight = 390
      inherited PageControl: TJvPageControl
        Width = 999
        Height = 390
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ActivePage = TabSheet1
        ExplicitWidth = 999
        ExplicitHeight = 390
        object TabSheet1: TTabSheet
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'TabSheet1'
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 999
            Height = 367
            Align = alClient
            Caption = ' '
            ParentBackground = False
            ParentColor = True
            TabOrder = 0
            TabStop = True
            object gbxBuscaRapida: TGroupBox
              Left = 1
              Top = 56
              Width = 997
              Height = 53
              Align = alTop
              Caption = 'Busca r'#225'pida'
              TabOrder = 1
              TabStop = True
              object Label1: TLabel
                Left = 9
                Top = 24
                Width = 29
                Height = 13
                Caption = '&Brinco'
                FocusControl = edtBrinco
              end
              object lbl1Ord: TLabel
                Left = 330
                Top = 24
                Width = 56
                Height = 13
                Caption = '1'#170' Ordenha'
                FocusControl = edOrd1
              end
              object lbl2Ord: TLabel
                Left = 482
                Top = 24
                Width = 56
                Height = 13
                Caption = '2'#170' Ordenha'
                FocusControl = edOrd2
              end
              object lbl3Ord: TLabel
                Left = 635
                Top = 24
                Width = 56
                Height = 13
                Caption = '3'#170' Ordenha'
                FocusControl = edOrd3
              end
              object lbNome: TLabel
                Left = 161
                Top = 24
                Width = 161
                Height = 13
                AutoSize = False
                Caption = 'NomeDaVaca'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edtBrinco: TEdit
                Left = 52
                Top = 21
                Width = 78
                Height = 21
                Hint = 'Digite o brinco e tecle enter'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                TextHint = 'Digite o brinco e tecle enter'
                OnEnter = EditEnter
                OnKeyPress = edtBrincoKeyPress
              end
              object edOrd1: TJvDBCalcEdit
                Left = 396
                Top = 21
                Width = 56
                Height = 21
                DisplayFormat = ',0.0'
                ShowButton = False
                TabOrder = 1
                ZeroEmpty = False
                DecimalPlacesAlwaysShown = False
                OnEnter = EditEnter
                OnKeyPress = edOrd1KeyPress
                DataField = 'ORD1'
                DataSource = dtsPesagens
              end
              object edOrd2: TJvDBCalcEdit
                Left = 551
                Top = 21
                Width = 56
                Height = 21
                DisplayFormat = ',0.0'
                ShowButton = False
                TabOrder = 2
                ZeroEmpty = False
                DecimalPlacesAlwaysShown = False
                OnEnter = EditEnter
                OnKeyPress = edOrd2KeyPress
                DataField = 'ORD2'
                DataSource = dtsPesagens
              end
              object edOrd3: TJvDBCalcEdit
                Left = 706
                Top = 21
                Width = 56
                Height = 21
                DisplayFormat = ',0.0'
                ShowButton = False
                TabOrder = 3
                ZeroEmpty = False
                DecimalPlacesAlwaysShown = False
                OnEnter = EditEnter
                OnKeyPress = edOrd3KeyPress
                DataField = 'ORD3'
                DataSource = dtsPesagens
              end
            end
            object PanelGrid: TPanel
              Left = 1
              Top = 109
              Width = 997
              Height = 257
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
              TabStop = True
              OnEnter = PanelGridEnter
              object PesagensGrid: TJvDBUltimGrid
                Left = 2
                Top = 2
                Width = 993
                Height = 253
                Align = alClient
                BorderStyle = bsNone
                DataSource = dtsPesagens
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = PesagensGridKeyDown
                OnKeyPress = PesagensGridKeyPress
                AutoAppend = False
                BevelKind = bkTile
                OnShowEditor = PesagensGridShowEditor
                AlternateRowColor = clBtnFace
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                CanDelete = False
                EditControls = <
                  item
                    ControlName = 'DBMemo1'
                    FieldName = 'OBSERVACAO'
                    FitCell = fcDesignSize
                    LeaveOnEnterKey = True
                  end
                  item
                    ControlName = 'edtOrd1'
                    FieldName = 'ORD1'
                    FitCell = fcCellSize
                    LeaveOnEnterKey = True
                    LeaveOnUpDownKey = True
                  end
                  item
                    ControlName = 'edtOrd2'
                    FieldName = 'ORD2'
                    FitCell = fcCellSize
                    LeaveOnEnterKey = True
                    LeaveOnUpDownKey = True
                  end
                  item
                    ControlName = 'edtOrd3'
                    FieldName = 'ORD3'
                    FitCell = fcCellSize
                    LeaveOnEnterKey = True
                    LeaveOnUpDownKey = True
                  end>
                RowsHeight = 17
                TitleRowHeight = 17
                OnCheckIfBooleanField = PesagensGridCheckIfBooleanField
                ReadOnlyCellColor = clBtnFace
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'BRINCO'
                    ReadOnly = True
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMEESTABULO'
                    ReadOnly = True
                    Width = 237
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LOTE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORD1'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORD2'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORD3'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ANIMAL_DOENTE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TOTAL'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ULTIMA_PESAGEM'
                    ReadOnly = True
                    Title.Caption = #218'ltima pesagem'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBSERVACAO'
                    Visible = True
                  end>
              end
              object DBMemo1: TDBMemo
                Left = 179
                Top = 59
                Width = 186
                Height = 89
                DataField = 'OBSERVACAO'
                DataSource = dtsPesagens
                TabOrder = 4
                Visible = False
              end
              object edtOrd1: TJvDBCalcEdit
                Left = 448
                Top = 62
                Width = 121
                Height = 21
                DecimalPlaceRound = True
                DecimalPlaces = 1
                DisplayFormat = ',0.0'
                ShowButton = False
                TabOrder = 1
                Visible = False
                DecimalPlacesAlwaysShown = True
                DataField = 'ORD1'
                DataSource = dtsPesagens
              end
              object edtOrd2: TJvDBCalcEdit
                Left = 448
                Top = 89
                Width = 121
                Height = 21
                DecimalPlaceRound = True
                DecimalPlaces = 1
                DisplayFormat = ',0.0'
                ShowButton = False
                TabOrder = 2
                Visible = False
                DecimalPlacesAlwaysShown = True
                DataField = 'ORD2'
                DataSource = dtsPesagens
              end
              object edtOrd3: TJvDBCalcEdit
                Left = 448
                Top = 118
                Width = 121
                Height = 21
                DecimalPlaceRound = True
                DecimalPlaces = 1
                DisplayFormat = ',0.0'
                ShowButton = False
                TabOrder = 3
                Visible = False
                DecimalPlacesAlwaysShown = True
                DataField = 'ORD3'
                DataSource = dtsPesagens
              end
            end
            object gbxSelecao: TGroupBox
              Left = 1
              Top = 1
              Width = 997
              Height = 55
              Align = alTop
              Caption = 'Digita'#231#227'o de dados padr'#227'o'
              TabOrder = 0
              TabStop = True
              object Label2: TLabel
                Left = 20
                Top = 25
                Width = 84
                Height = 13
                Caption = 'Data da pesagem'
              end
              object lblNumeroOrdenhas: TLabel
                Left = 263
                Top = 25
                Width = 102
                Height = 13
                Caption = 'N'#250'mero de Ordenhas'
              end
              object JvDBSpinEdit1: TJvDBSpinEdit
                Left = 402
                Top = 22
                Width = 45
                Height = 21
                Decimal = 0
                MaxValue = 3.000000000000000000
                MinValue = 1.000000000000000000
                TabOrder = 1
                OnKeyPress = JvDBSpinEdit1KeyPress
                DataField = 'NORD'
                DataSource = dtsFicha
              end
              object btnSelecionarAnimais: TTcGDIButton
                Left = 491
                Top = 20
                Width = 129
                Height = 25
                Caption = 'Selecionar Animais'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
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
              object JvDBDateEdit1: TTcDBDateEdit
                Left = 117
                Top = 22
                Width = 120
                Height = 21
                Checked = False
                DataField = 'DATA'
                DataSource = dtsFicha
                CheckOnExit = False
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnKeyPress = JvDBDateEdit1KeyPress
                DisabledColor = clSilver
              end
              object btnImportarPesagens: TTcGDIButton
                Left = 632
                Top = 20
                Width = 126
                Height = 25
                Caption = 'Importar Pesagens'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                TabOrder = 3
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
              object btnCheckDoente: TTcGDIButton
                Left = 765
                Top = 20
                Width = 124
                Height = 25
                Caption = 'Marcar animais sem pesagem como doente'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                TabOrder = 4
                OnClick = btnCheckDoenteClick
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
              object btnExcluirSelecao: TTcGDIButton
                Left = 895
                Top = 21
                Width = 101
                Height = 25
                Caption = 'Excluir todas as pesagens da lista'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                TabOrder = 5
                OnClick = btnExcluirSelecaoClick
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
      end
    end
  end
  object SelectRetiroPanel: TTcCaptionedPanel [1]
    Left = 592
    Top = 193
    Width = 345
    Height = 241
    Caption = 'Selecionar animais em lacta'#231#227'o/retiro'
    BorderStyle = bsSingle
    Constraints.MinHeight = 27
    TabOrder = 1
    Visible = False
    object Panel3: TPanel
      Left = 1
      Top = 205
      Width = 339
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        339
        31)
      object FloatEditorOKButton: TTcGDIButton
        Left = 283
        Top = 1
        Width = 27
        Height = 24
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
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
        OnClick = FloatEditorOKButtonClick
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
        Left = 309
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
    object RetirosGrid: TJvDBUltimGrid
      Left = 1
      Top = 20
      Width = 339
      Height = 185
      Align = alClient
      DataSource = dtsRetiros
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = RetirosGridDblClick
      OnShowEditor = RetirosGridShowEditor
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
    end
  end
  inherited ActionList: TInternalActionList
    Left = 580
    Top = 12
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object dtsFicha: TDataSource
    DataSet = Zoo_ProducaoControleLeiteiroDatamodule2.cdsLotePesagem
    OnDataChange = dtsFichaDataChange
    Left = 391
    Top = 16
  end
  object dtsPesagens: TDataSource
    DataSet = Zoo_ProducaoControleLeiteiroDatamodule2.cdsPesagens
    OnDataChange = dtsPesagensDataChange
    Left = 444
    Top = 16
  end
  object PopuperRetiros: TTcControlPopuper
    Control = SelectRetiroPanel
    PopupStyle = cpsPopup
    OnClose = PopuperRetirosClose
    OnShow = PopuperRetirosShow
    EnterKeyAction = enterKeyDefault
    EscKeyAction = 2
    Left = 484
    Top = 276
  end
  object dtsRetiros: TDataSource
    DataSet = Zoo_ProducaoControleLeiteiroDatamodule2.cdsRetiros
    Left = 490
    Top = 18
  end
end
