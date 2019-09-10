inherited Zoo_RelatorioPersonalizado: TZoo_RelatorioPersonalizado
  Left = 403
  Top = 139
  Caption = 'Relat'#243'rios Personalizados'
  ClientHeight = 430
  ClientWidth = 771
  Font.Name = 'MS Sans Serif'
  ActionList.Images = ActionsImageList
  ExplicitWidth = 777
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 771
    Height = 430
    ExplicitWidth = 771
    ExplicitHeight = 430
    inherited _pnlFooter: TJvPanel
      Top = 399
      Width = 767
      ExplicitTop = 399
      ExplicitWidth = 767
      inherited _imageBottom: TImage
        Width = 767
        ExplicitWidth = 767
      end
      inherited _btbPrior: TTcGDIButton
        Left = 567
        ExplicitLeft = 567
      end
      inherited _btbNext: TTcGDIButton
        Left = 658
        ExplicitLeft = 658
      end
      inherited _btbExecute: TTcGDIButton
        Left = 674
        Top = 5
        ExplicitLeft = 674
        ExplicitTop = 5
      end
      object btnListResult: TTcGDIButton
        Left = 100
        Top = 2
        Width = 109
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Action = actRetornarDados
        Anchors = [akLeft, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = False
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
      Width = 767
      Height = 308
      ExplicitWidth = 767
      ExplicitHeight = 308
      inherited PageControl: TJvPageControl
        Width = 767
        Height = 308
        ActivePage = TabSheet1
        ExplicitWidth = 767
        ExplicitHeight = 308
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 767
            Height = 285
            Align = alClient
            Caption = 'Panel2'
            ParentColor = True
            TabOrder = 0
            DesignSize = (
              767
              285)
            object Bevel1: TBevel
              Left = 332
              Top = 23
              Width = 34
              Height = 229
              Anchors = [akLeft, akTop, akBottom]
              Shape = bsFrame
              ExplicitHeight = 318
            end
            object FiltrosPanel: TJvPanel
              Left = 8
              Top = 8
              Width = 321
              Height = 247
              FlatBorder = True
              Anchors = [akLeft, akTop, akBottom]
              BorderWidth = 1
              Caption = ' '
              ParentBackground = False
              ParentColor = True
              TabOrder = 0
              DesignSize = (
                321
                247)
              object Label1: TLabel
                Left = 8
                Top = 24
                Width = 56
                Height = 13
                Caption = 'Selecionar :'
              end
              object Label3: TLabel
                Left = 9
                Top = 45
                Width = 52
                Height = 13
                Caption = 'Pesquisar :'
              end
              object JvPanel6: TJvPanel
                Left = 2
                Top = 2
                Width = 317
                Height = 15
                Align = alTop
                Caption = 'Filtros'
                Color = 15389113
                ParentBackground = False
                TabOrder = 0
              end
              object FiltrosPageControl: TPageControl
                Left = 4
                Top = 65
                Width = 312
                Height = 145
                ActivePage = TabSheetCamposFiltro
                Anchors = [akLeft, akTop, akRight, akBottom]
                HotTrack = True
                TabOrder = 5
                OnChange = PageControlChange
                object TabSheetCamposFiltro: TTabSheet
                  Caption = 'Campos'
                  DesignSize = (
                    304
                    117)
                  object TreeMenuPanel: TJvPanel
                    Tag = 99
                    Left = 0
                    Top = 3
                    Width = 303
                    Height = 114
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    BevelOuter = bvNone
                    BorderWidth = 1
                    Caption = ' '
                    Color = 15389113
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentBackground = False
                    ParentFont = False
                    TabOrder = 0
                    DesignSize = (
                      303
                      114)
                    object TreeViewCampos: TVirtualStringTree
                      Left = 1
                      Top = 1
                      Width = 301
                      Height = 112
                      ParentCustomHint = False
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      BiDiMode = bdLeftToRight
                      BevelInner = bvNone
                      BevelOuter = bvNone
                      BevelWidth = 4
                      BorderStyle = bsNone
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'Verdana'
                      Font.Style = []
                      Header.AutoSizeIndex = -1
                      Header.Font.Charset = DEFAULT_CHARSET
                      Header.Font.Color = 12546560
                      Header.Font.Height = -11
                      Header.Font.Name = 'Verdana'
                      Header.Font.Style = [fsBold]
                      Header.MainColumn = -1
                      HintAnimation = hatSlide
                      HintMode = hmHint
                      HotCursor = crHandPoint
                      ParentBiDiMode = False
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 0
                      OnDblClick = TreeViewCamposDblClick
                      OnGetText = TreeViewCamposGetText
                      OnGetHint = TreeViewCamposGetHint
                      OnKeyPress = TreeViewCamposKeyPress
                      Columns = <>
                    end
                  end
                end
              end
              object dblcPersonalizado: TDBLookupComboBox
                Left = 66
                Top = 19
                Width = 250
                Height = 21
                KeyField = 'KZOO_PERSONALIZADO'
                ListField = 'NOME'
                ListSource = dtsListaPersonalizado
                TabOrder = 1
                OnCloseUp = dblcPersonalizadoCloseUp
                OnEnter = dblcPersonalizadoEnter
                OnKeyDown = dblcPersonalizadoKeyDown
              end
              object SaveReporTTcGDIButton: TTcGDIButton
                Left = 184
                Top = 41
                Width = 66
                Height = 24
                Cursor = crHandPoint
                Action = actSave
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentFont = False
                TabOrder = 3
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
              object DropReporTTcGDIButton: TTcGDIButton
                Left = 250
                Top = 41
                Width = 66
                Height = 24
                Cursor = crHandPoint
                Action = actDelete
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentFont = False
                TabOrder = 4
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
              object cbxDescartados: TCheckBox
                Left = 8
                Top = 211
                Width = 158
                Height = 17
                Anchors = [akLeft, akBottom]
                Caption = 'Exibir animais descartados'
                TabOrder = 6
              end
              object cbxUltimaLactacaoSecos: TCheckBox
                Left = 8
                Top = 228
                Width = 265
                Height = 17
                Anchors = [akLeft, akBottom]
                Caption = 'Exibir dados da '#250'ltima lacta'#231#227'o para animais secos'
                TabOrder = 7
              end
              object EdtPesquisa: TButtonedEdit
                Left = 66
                Top = 42
                Width = 114
                Height = 21
                Hint = 'Pesquisar'
                Ctl3D = True
                ParentCtl3D = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 2
                TextHint = 'Pesquisar'
                OnChange = EdtPesquisaChange
                OnKeyDown = EdtPesquisaKeyDown
              end
            end
            object JvPanel1: TJvPanel
              Left = 367
              Top = 8
              Width = 395
              Height = 247
              FlatBorder = True
              Anchors = [akLeft, akTop, akRight, akBottom]
              BorderWidth = 1
              Caption = ' '
              ParentBackground = False
              ParentColor = True
              TabOrder = 1
              DesignSize = (
                395
                247)
              object SpeedButton7: TSpeedButton
                Left = 367
                Top = 107
                Width = 22
                Height = 22
                Action = actMoveUp
                Anchors = [akRight]
                ExplicitLeft = 366
                ExplicitTop = 150
              end
              object SpeedButton8: TSpeedButton
                Left = 367
                Top = 142
                Width = 22
                Height = 22
                Action = actMoveDown
                Anchors = [akRight]
                ExplicitLeft = 366
                ExplicitTop = 199
              end
              object JvPanel2: TJvPanel
                Left = 2
                Top = 2
                Width = 391
                Height = 15
                Align = alTop
                Caption = 'Colunas'
                Color = 15389113
                ParentBackground = False
                TabOrder = 0
              end
              object CondicoesPageControl: TPageControl
                Left = 3
                Top = 50
                Width = 365
                Height = 193
                ActivePage = TabSheetCamposCondicao
                Anchors = [akLeft, akTop, akRight, akBottom]
                HotTrack = True
                TabOrder = 1
                OnChange = PageControlChange
                object TabSheetCamposCondicao: TTabSheet
                  Caption = 'Campos/Condi'#231#227'o'
                  DesignSize = (
                    357
                    165)
                  object GridPanel: TJvPanel
                    Tag = 99
                    Left = 0
                    Top = 2
                    Width = 353
                    Height = 163
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    BevelOuter = bvNone
                    BorderWidth = 1
                    Caption = ' '
                    Color = 15389113
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentBackground = False
                    ParentFont = False
                    TabOrder = 0
                    DesignSize = (
                      353
                      163)
                    object dbgSelection: TJvDBUltimGrid
                      Left = 1
                      Top = 1
                      Width = 351
                      Height = 161
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      BorderStyle = bsNone
                      DataSource = dtsReportCfg
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -9
                      TitleFont.Name = 'Verdana'
                      TitleFont.Style = []
                      OnShowEditor = dbgSelectionShowEditor
                      SelectColumnsDialogStrings.Caption = 'Select columns'
                      SelectColumnsDialogStrings.OK = '&OK'
                      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                      EditControls = <>
                      RowsHeight = 16
                      TitleRowHeight = 16
                      OnCheckIfBooleanField = dbgSelectionCheckIfBooleanField
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'COLUMNTITLE'
                          Width = 107
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VISIBLE'
                          Width = 41
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NOT'
                          Width = 27
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DSPCONDITION'
                          Width = 145
                          Visible = True
                        end>
                    end
                    object EditConditionPanel: TTcCaptionedPanel
                      Left = 80
                      Top = 34
                      Width = 265
                      Height = 101
                      Caption = 'Condi'#231#227'o'
                      BevelInner = bvLowered
                      Color = clWhite
                      Constraints.MinHeight = 27
                      ParentBackground = False
                      TabOrder = 1
                      Visible = False
                      object Panel1: TPanel
                        Left = 2
                        Top = 73
                        Width = 261
                        Height = 26
                        Align = alTop
                        BevelOuter = bvNone
                        ParentColor = True
                        TabOrder = 2
                        DesignSize = (
                          261
                          26)
                        object FloatEditorOKButton: TTcGDIButton
                          Left = 207
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
                          Left = 233
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
                      object SecondParamPanel: TPanel
                        Left = 2
                        Top = 47
                        Width = 261
                        Height = 26
                        Align = alTop
                        BevelOuter = bvNone
                        ParentColor = True
                        TabOrder = 1
                        object Label2: TLabel
                          Left = 0
                          Top = 0
                          Width = 105
                          Height = 26
                          Align = alLeft
                          Alignment = taCenter
                          AutoSize = False
                          Caption = 'e'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Verdana'
                          Font.Style = []
                          ParentFont = False
                          Layout = tlCenter
                        end
                      end
                      object FirstParamPanel: TPanel
                        Left = 2
                        Top = 21
                        Width = 261
                        Height = 26
                        Align = alTop
                        BevelOuter = bvNone
                        ParentColor = True
                        TabOrder = 0
                        object OperatorsComboBox: TComboBox
                          Left = 5
                          Top = 4
                          Width = 100
                          Height = 22
                          Style = csOwnerDrawFixed
                          TabOrder = 0
                          OnCloseUp = OperatorsComboBoxCloseUp
                          OnKeyDown = OperatorsComboBoxKeyDown
                        end
                      end
                    end
                  end
                end
              end
              object ClearConditionsButton: TTcGDIButton
                Left = 5
                Top = 19
                Width = 114
                Height = 25
                Cursor = crHandPoint
                Hint = 'Limpa Filtro Montado'
                Caption = 'Novo relat'#243'rio'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                TabOrder = 2
                OnClick = ClearConditionsButtonClick
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
            object _btnAddAll: TTcGDIButton
              Left = 336
              Top = 96
              Width = 25
              Height = 25
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Action = actAddGroup
              Anchors = [akLeft]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentFont = False
              TabOrder = 2
              Visible = False
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
            object _btnRemoveAll: TTcGDIButton
              Left = 336
              Top = 171
              Width = 25
              Height = 24
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Anchors = [akLeft]
              Caption = '<<'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentFont = False
              TabOrder = 3
              Visible = False
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
            object AddConditionButton: TTcGDIButton
              Left = 336
              Top = 72
              Width = 25
              Height = 25
              Cursor = crHandPoint
              Action = actAddCondition
              Anchors = [akLeft]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
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
            object DropConditionButton: TTcGDIButton
              Left = 336
              Top = 151
              Width = 25
              Height = 25
              Cursor = crHandPoint
              Action = actDropCondition
              Anchors = [akLeft]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
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
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object JvPanel3: TJvPanel
            Tag = 99
            Left = 0
            Top = 0
            Width = 767
            Height = 258
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 1
            Caption = ' '
            Color = 15389113
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              767
              258)
            object DBGridResultados: TJvDBUltimGrid
              Left = 1
              Top = 1
              Width = 765
              Height = 256
              Anchors = [akLeft, akTop, akRight, akBottom]
              BorderStyle = bsNone
              DataSource = dtsResult
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'Verdana'
              TitleFont.Style = []
              OnDblClick = DBGridResultadosDblClick
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 16
              TitleRowHeight = 16
              OnCheckIfBooleanField = dbgSelectionCheckIfBooleanField
              OnAfterSort = DBGridResultadosAfterSort
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 258
            Width = 767
            Height = 27
            Align = alBottom
            Caption = ' '
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            object lblTotalLinhas: TLabel
              Left = 16
              Top = 7
              Width = 65
              Height = 13
              Caption = 'lblTotalLinhas'
            end
          end
        end
      end
    end
    object Memo1: TTcSimpleSyntaxMemo
      Left = 2
      Top = 310
      Width = 767
      Height = 89
      Cursor = crIBeam
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      TabStop = True
      Visible = False
      BlockColor = clHighlight
      BlockFontColor = clHighlightText
      CommentAttr.Charset = DEFAULT_CHARSET
      CommentAttr.Color = clNavy
      CommentAttr.Height = -11
      CommentAttr.Name = 'Courier New'
      CommentAttr.Style = [fsItalic]
      KeywordAttr.Charset = DEFAULT_CHARSET
      KeywordAttr.Color = clWindowText
      KeywordAttr.Height = -11
      KeywordAttr.Name = 'Courier New'
      KeywordAttr.Style = [fsBold]
      StringAttr.Charset = DEFAULT_CHARSET
      StringAttr.Color = clNavy
      StringAttr.Height = -11
      StringAttr.Name = 'Courier New'
      StringAttr.Style = []
      TextAttr.Charset = DEFAULT_CHARSET
      TextAttr.Color = clWindowText
      TextAttr.Height = -11
      TextAttr.Name = 'Courier New'
      TextAttr.Style = []
      Lines.Strings = (
        'Memo1')
      ReadOnly = False
      SyntaxType = stSQL
      ShowFooter = True
      ShowGutter = True
      ExplicitLeft = 0
      ExplicitTop = 285
    end
  end
  object SaveAsPanel: TTcCaptionedPanel [1]
    Left = 203
    Top = 288
    Width = 265
    Height = 101
    Caption = 'Salvar como...'
    BevelInner = bvLowered
    Color = clWhite
    Constraints.MinHeight = 27
    ParentBackground = False
    TabOrder = 1
    Visible = False
    DesignSize = (
      265
      101)
    object btbPanelSaveOk: TTcGDIButton
      Left = 209
      Top = 73
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
      OnClick = btbPanelSaveOkClick
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
    object btbPanelSaveCancel: TTcGDIButton
      Left = 235
      Top = 73
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
    object rbSaveAs: TRadioButton
      Left = 7
      Top = 48
      Width = 16
      Height = 17
      TabOrder = 2
    end
    object edtSaveAs: TEdit
      Left = 35
      Top = 46
      Width = 213
      Height = 21
      TabOrder = 3
      Text = 'edtSaveAs'
    end
    object rbSaveExisting: TRadioButton
      Left = 7
      Top = 26
      Width = 258
      Height = 17
      Caption = 'rbSaveExisting'
      TabOrder = 4
    end
  end
  inherited ActionList: TInternalActionList
    Images = ActionsImageList
    inherited _actExecute: TAction
      Caption = 'V&isualizar'
    end
    object actMoveUp: TAction
      ImageIndex = 6
      OnExecute = actMoveUpExecute
    end
    object actMoveDown: TAction
      ImageIndex = 7
      OnExecute = actMoveDownExecute
    end
    object actAddCondition: TAction
      Caption = '>'
      OnExecute = actAddConditionExecute
      OnUpdate = actAddConditionUpdate
    end
    object actDropCondition: TAction
      Caption = '<'
      OnExecute = actDropConditionExecute
    end
    object actAddGroup: TAction
      Caption = '>>'
      OnExecute = actAddGroupExecute
      OnUpdate = actAddGroupUpdate
    end
    object actSave: TAction
      Category = 'Edit'
      Caption = 'Salvar ...'
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
    end
    object actDelete: TAction
      Category = 'Edit'
      Caption = 'Excluir'
      OnExecute = actDeleteExecute
      OnUpdate = actDeleteUpdate
    end
    object actRetornarDados: TAction
      Caption = 'Retornar dados'
      OnExecute = actRetornarDadosExecute
    end
  end
  object dtsReportCfg: TDataSource
    DataSet = Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg
    Left = 558
    Top = 297
  end
  object ActionsImageList: TImageList
    Left = 584
    Top = 60
    Bitmap = {
      494C010109000D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008B6C60073717300737173007371
      730073717300737173007371730008B6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073717300ADFFFF00ADFFFF00ADFF
      FF00ADFFFF00ADFFFF00ADFFFF00737173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073717300ADFFFF0008B6C6007371
      73007371730073717300ADFFFF00737173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073717300ADFFFF00ADFFFF00ADFF
      FF00ADFFFF00ADFFFF00ADFFFF00737173007371730073717300737173000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073717300ADFFFF0008B6C6007371
      73007371730073717300ADFFFF0073717300A5F7FF00A5F7FF00737173007371
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073717300ADFFFF00ADFFFF00ADFF
      FF00ADFFFF00ADFFFF00ADFFFF0073717300DEFFFF00DEFFFF0073717300A5F7
      FF00737173000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073717300ADFFFF0008B6C6007371
      7300ADFFFF00737173007371730073717300DEFFFF00DEFFFF00737173007371
      7300737173007371730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073717300ADFFFF00ADFFFF00ADFF
      FF00ADFFFF0073717300A5F7FF0073717300DEFFFF00DEFFFF00DEFFFF00DEFF
      FF00A5F7FF007371730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008B6C60073717300737173007371
      7300737173007371730073717300DEFFFF00DEFFFF00DEFFFF00DEFFFF00DEFF
      FF00A5F7FF007371730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000021202100A5F7
      FF00A5F7FF00A5F7FF00A5F7FF00A5F7FF00A5F7FF00A5F7FF0021202100A5F7
      FF00A5F7FF007371730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021202100212021002120
      2100B5B6B500737173007371730073717300B5B6B50021202100212021002120
      2100B5B6B5007371730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002120210021202100FFBE73002120
      210021202100FFBE7300FF9E2900FF9E29002120210021202100FFBE73002120
      210021202100FFBE730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002120210000000000FF9E2900FFBE
      73002120210021202100FFBE7300FF9E290021202100FFBE7300FF9E2900FFBE
      7300212021002120210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF9E2900FF9E
      2900FFBE73002120210021202100FF9E2900FF9E2900FF9E2900FF9E2900FF9E
      2900FFBE73002120210021202100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF9E2900FF9E
      2900FF9E2900FFBE730021202100FF9E2900FF9E2900FF9E2900FF9E2900FF9E
      2900FF9E2900FFBE730021202100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000A5A6A5007371
      7300737173005A595A005A595A004A494A004A494A0039383900313031003130
      310031303100A5A6A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000A5A6A50063300000CECF
      CE00E7E7E700C6C7C600C6C7C600CECFCE00F7F7F700EFEFEF00E7E7E700A5A6
      A5003130310031303100A5A6A500000000000000000000000000000000000000
      000000000000CE9E08007B5900007B5900007B5900007B590000CE9E08000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B590000CE9E080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000633000006330000063300000DEDF
      DE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDF
      DE00CE8E42006330000031303100313031000000000000000000000000000000
      0000000000007B590000F7CF9400F7CF9400F7CF9400FFF7D600CE9E08000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B590000CE9E0800FFF7D600CE9E0800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000063300000CE8E420063300000DEA6
      7B00DEA67B00DEA67B00DEA67B00DEA67B00CE8E4200CE8E4200CE8E4200CE8E
      4200CE8E4200633000007B590000313031000000000000000000000000000000
      0000000000007B590000F7CF9400F7CF9400F7CF9400FFF7D600CE9E08000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B590000CE9E0800F7CF9400F7CF9400FFF7D600CE9E08000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000063300000DEA67B0063300000DEA6
      7B00DEA67B00DEA67B00DEA67B00DEA67B00DEA67B00CE8E4200CE8E4200CE8E
      4200CE8E420063300000CE8E4200313031000000000000000000000000000000
      0000000000007B590000F7CF9400F7CF9400F7CF9400FFF7D600CE9E08000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B590000CE9E0800F7CF9400F7CF9400F7CF9400F7CF9400FFF7D600CE9E
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063300000DEA67B0063300000DEA6
      7B00DEA67B00DEA67B00DEA67B00DEA67B00DEA67B00DEA67B00CE8E4200CE8E
      4200CE8E420063300000CE8E42003938390000000000CE9E08007B5900007B59
      00007B5900007B590000F7CF9400F7CF9400F7CF9400FFF7D6007B5900007B59
      00007B5900007B5900007B590000000000000000000000000000000000007B59
      0000CE9E0800F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400FFF7
      D600CE9E08000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063300000DEA67B0063300000AD38
      2900633000006330000063300000633000006330000063300000633000006330
      0000CE8E420063300000CE8E42004A494A00000000007B590000CE9E0800F7CF
      9400F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400FFF7D600FFF7D600FFF7
      D600FFF7D600FFF7D600CE9E08000000000000000000000000007B590000CE9E
      0800F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400F7CF
      9400FFF7D600CE9E080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063300000DEA67B00633000009C9E
      9C00ADFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF006330000063300000CE8E42004A494A0000000000000000007B590000CE9E
      0800F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400F7CF
      9400FFF7D600CE9E08000000000000000000000000007B590000CE9E0800F7CF
      9400F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400FFF7D600FFF7D600FFF7
      D600FFF7D600FFF7D600CE9E0800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063300000DEA67B0063300000ADFF
      FF00CECFCE00A5A6A500A5A6A500A5A6A500A5A6A500A5A6A500A5A6A500C6C7
      C6009CFFFF0063300000CE8E42004A494A000000000000000000000000007B59
      0000CE9E0800F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400F7CF9400FFF7
      D600CE9E080000000000000000000000000000000000CE9E08007B5900007B59
      00007B5900007B590000F7CF9400F7CF9400F7CF9400FFF7D6007B5900007B59
      00007B5900007B5900007B590000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063300000DEA67B007B590000ADFF
      FF00ADFFFF00ADFFFF00ADFFFF00ADFFFF00ADFFFF00ADFFFF00ADFFFF00ADFF
      FF009CFFFF007B590000CE8E42004A494A000000000000000000000000000000
      00007B590000CE9E0800F7CF9400F7CF9400F7CF9400F7CF9400FFF7D600CE9E
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000007B590000F7CF9400F7CF9400F7CF9400FFF7D600CE9E08000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063300000DEA67B007B590000ADFF
      FF00CECFCE00A5A6A500A5A6A500A5A6A500A5A6A500A5A6A500A5A6A500C6C7
      C6009CFFFF007B590000CE8E42004A494A000000000000000000000000000000
      0000000000007B590000CE9E0800F7CF9400F7CF9400FFF7D600CE9E08000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B590000F7CF9400F7CF9400F7CF9400FFF7D600CE9E08000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063300000DEA67B009C9E9C00ADFF
      FF00ADFFFF00ADFFFF00ADFFFF00ADFFFF00ADFFFF00ADFFFF00ADFFFF00ADFF
      FF009CFFFF009C9E9C00CE8E42005A595A000000000000000000000000000000
      000000000000000000007B590000CE9E0800FFF7D600CE9E0800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B590000F7CF9400F7CF9400F7CF9400FFF7D600CE9E08000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063300000DEA67B00A5A6A5000000
      0000CECFCE00CE8E4200CE8E4200A5A6A500A5A6A500A5A6A500A5A6A500C6C7
      C6009CFFFF00A5A6A500DEA67B00636163000000000000000000000000000000
      00000000000000000000000000007B590000CE9E080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE9E08007B5900007B5900007B5900007B590000CE9E08000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A6A500633000007B5900000000
      000000000000ADFFFF00ADFFFF00ADFFFF00ADFFFF00ADFFFF00ADFFFF00ADFF
      FF00ADFFFF007B59000063300000A5A6A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A6A5006330
      0000633000006330000063300000633000006330000063300000633000006330
      0000633000009C9E9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063616300393839003938
      3900393839003938390039383900393839003938390039383900393839003938
      390039383900A5A6A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A494A004A494A00000000000000000000000000000000000000
      0000000000000000000000000000000000006361630052DFD6003938390052DF
      FF0052DFFF0052DFFF0052DFFF0052DFFF0052DFD60052DFFF0052DFD60052DF
      FF0052C7D60039383900000000000000000000000000000000009C9E9C004A49
      4A004A494A004A494A004A494A004A494A004A494A004A494A004A494A004A49
      4A000000000000000000000000000000000000000000000000009C9E9C004A49
      4A004A494A004A494A004A494A004A494A004A494A004A494A004A494A004A49
      4A00000000000000000000000000000000000000000000000000000000000000
      00000079000000DF000000BE29004A494A000000000000000000000000000000
      0000000000000000000000000000000000006361630000F7FF0052DFD6003938
      3900ADFFFF0052DFFF0052DFFF0052DFFF0052DFFF0052DFFF0052DFFF0052DF
      D60052DFFF0052DFD60039383900000000000000000000000000636163000000
      0000CEFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CCFCE004A49
      4A004A494A000000000000000000000000000000000000000000636163000000
      0000CEFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CCFCE004A49
      4A004A494A000000000000000000000000000000000000000000000000000000
      00000079000000DF000000DF000000BE29004A494A0000000000000000000000
      0000000000000000000000000000000000007371730052FFFF0000F7FF0052DF
      D600393839003938390039383900393839003938390039383900393839003938
      3900393839003938390039383900393839000000000000000000636163000000
      0000CEFFFF00CEFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CCFCE004A49
      4A00639E9C004A494A0000000000000000000000000000000000636163000000
      0000CEFFFF00CEFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CCFCE004A49
      4A00639E9C004A494A0000000000000000000000000000000000000000000000
      00000079000000DF000000DF000000DF000000BE29004A494A00000000000000
      0000000000000000000000000000000000007371730052FFFF0052FFFF0000F7
      FF0052DFD60000F7FF0052DFD6009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF00B5B6B500000000000000000000000000ADAEAD000030
      CE00CEFFFF00CEFFFF009CFFFF00CEFFFF009CFFFF009CFFFF009CCFCE004A49
      4A009CCFCE00639E9C004A494A00000000000000000000000000ADAEAD000000
      0000CEFFFF00CEFFFF009CFFFF00CEFFFF009CFFFF009CFFFF009CCFCE004A49
      4A009CCFCE00639E9C004A494A00000000000000000000000000000000000000
      00000079000000DF000000FF080000DF000000DF000000BE29004A494A000000
      00000000000000000000000000000000000084868400ADFFFF0052FFFF0052FF
      FF0000F7FF00EFAE00007B590000EFAE0000ADFFFF009CFFFF00ADFFFF009CFF
      FF00ADFFFF009CFFFF0073717300000000000000000000000000ADAEAD000030
      CE00CEFFFF00CEFFFF00CEFFFF009CFFFF00CEFFFF009CFFFF009CFFFF009C9E
      9C006361630063616300636163004A494A001841D6000028C60000088C000008
      8C00CEFFFF0000088C0000088C0000088C0000088C009CFFFF009CFFFF009C9E
      9C006361630063616300636163004A494A000000000000000000000000000000
      00000079000000FF290000DF000000FF080000DF000000DF000000BE29004A49
      4A00000000000000000000000000000000008486840052FFFF00ADFFFF0052FF
      FF0052FFFF007B590000DEA67B007B590000FFFFFF00ADFFFF009CFFFF00ADFF
      FF009CFFFF00ADFFFF0073717300000000000069FF0000000000ADAEAD000030
      CE00CEFFFF00CEFFFF000030CE00CEFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF004A494A00000000004269DE001841D6000008
      8C00CEFFFF0000088C000010940018289C009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF004A494A000000000000000000000000000000
      00000079000052FF000000FF290000DF000000FF080000DF000000DF000000BE
      29004A494A000000000000000000000000009C9E9C00ADFFFF0052FFFF00EFAE
      0000A5710000A5710000DEA67B00A57100007B590000EFAE0000ADFFFF009CFF
      FF00ADFFFF009CFFFF007371730000000000000000000030CE00ADAEAD000030
      CE00CEFFFF000061FF00CEFFFF00CEFFFF00CEFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF004A494A0000000000000000005A79E7000020
      B5000010940000109C000018AD00CEFFFF00CEFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF004A494A000000000000000000000000000000
      00000079000052FFAD0000FF080000FF290000DF000000FF080000DF000000DF
      0000007900000000000000000000000000009C9E9C0052FFFF00ADFFFF00AD79
      0000FFFFCE00DEA67B00DEA67B00DEA67B00DEA67B007B590000ADFFFF00ADFF
      FF009CFFFF00ADFFFF00848684000000000000000000000000000061FF000030
      CE000061FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF004A494A000000000000000000ADAEAD002151
      D6000028C6000018A500CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF004A494A000000000000000000000000000000
      00000079000052FFAD0000FF080000FF080000FF290000DF000052FFAD000079
      000000000000000000000000000000000000A5A6A500A5A6A50052C7D600F7D7
      6B00E7B62100E7B62900F7CF6B00AD790000AD790000F7CF6B00ADFFFF009CFF
      FF00ADFFFF009CFFFF008C8E8C00000000000030CE000030CE000030CE0031CF
      FF000030CE000030CE000030CE00000000000000000000000000000000000000
      00000000000000000000000000004A494A000000000000000000ADAEAD002959
      DE000030CE000010940000000000000000000000000000000000000000000000
      00000000000000000000000000004A494A000000000000000000000000000000
      000000790000ADFF290000FF080000FF080000FF080000FF2900007900000000
      00000000000000000000000000000000000000000000A5A6A50000F7FF0000F7
      FF0000F7FF00F7BE2900FFFFCE00AD790000ADFFFF00ADFFFF00ADFFFF0052DF
      FF0052DFFF0052C7D6009C9E9C000000000000000000000000000061FF000030
      CE000061FF00ADAEAD00ADAEAD00636163006361630063616300636163006361
      63006361630063616300636163009C9E9C0000000000000000000838CE002951
      D6002959DE001041D60000088C00ADAEAD006361630063616300636163006361
      63006361630063616300636163009C9E9C000000000000000000000000000000
      000000790000ADFF290000FF080000FF0800ADFF290000790000000000000000
      000000000000000000000000000000000000000000009C9E9C0052FFFF0063F7
      FF0063F7FF00FFD76B00FFCF3100F7CF6B00ADFFFF00ADFFFF00B5B6B500A5A6
      A5008C8E8C0084868400A5A6A50000000000000000000069FF00000000000030
      CE00000000000069FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002951D6003159DE003159
      DE00000000005271E7000020AD0000088C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000790000ADFFAD0000FF0800ADFF29000079000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9E9C008C8E
      8C008C8E8C00B5B6B50094969400FFFFFF00ADFFFF00FFFFFF00A5A6A500E7E7
      E700DEDFDE00DEDFDE00B5B6B500000000000030CE0000000000000000000030
      CE0000000000000000000030CE00000000000000000000000000000000000000
      0000000000000000000000000000000000004A69DE005A79E7004A71DE003159
      DE00000000005A79E7003159DE000030C6000018A50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000790000ADFFAD00ADFFAD00007900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094969400FFFFFF00FFFFFF00ADFFFF00A5A6A500FFFF
      FF00E7E7E700B5B6B50000000000000000000000000000000000000000000030
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000790000ADFFAD0000790000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094969400FFFFFF00FFFFFF00FFFFFF008C8E8C00FFFF
      FF00B5B6B5000000000000000000000000000000000000000000000000000030
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000079000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B6B5009C9E9C009C9E9C008C8E8C0084868400C6C7
      C60000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFF00000000000000FF000000000000
      00FF00000000000000FF000000000000001F000000000000000F000000000000
      0007000000000000000300000000000000030000000000000003000000000000
      C003000000000000800300000000000000030000000000004003000000000000
      C001000000000000C001000000000000FFF9FFFFFFFFFFFFFF90C003FFFFFFFF
      FF808001F81FFE7FFF810000F81FFC3F24830000F81FF81F7F810000F81FF00F
      7F8100008001E007FFFF00008001C0037FEF0000C00380017FEF0000E0078001
      FFFF0000F00FF81F7FEF0000F81FF81F7FEF0000FC3FF81FFFFF1000FE7FF81F
      7FEF1800FFFFFFFF248FC003FFFFFFFFFFFFFFFFFFFF8003FFFFFFFFF9FF0003
      C00FC00FF0FF0001D007D007F07F0000D003D003F03F0001C001D001F01F0001
      C0000000F00F000140008000F00700018000C000F0070001C000C000F00F0001
      01FEC3FEF01F8001C000C000F03F8001ABFF88FFF07FC0016DFF087FF0FFFC03
      EFFFFFFFF1FFFC07EFFFFFFFFBFFFC0F00000000000000000000000000000000
      000000000000}
  end
  object PopuperCondition: TTcControlPopuper
    Control = EditConditionPanel
    PopupStyle = cpsPopup
    OnClose = PopuperConditionClose
    OnShow = PopuperConditionShow
    EscKeyAction = 2
    Left = 484
    Top = 276
  end
  object dtsResult: TDataSource
    Left = 470
    Top = 5
  end
  object dtsListaPersonalizado: TDataSource
    DataSet = Zoo_RelatorioPersonalizadoDatamodule.cdsRelatorioPersonalizados
    Left = 98
    Top = 100
  end
  object PopuperSaveAs: TTcControlPopuper
    Control = SaveAsPanel
    PopupStyle = cpsModal
    EscKeyAction = 2
    Left = 179
    Top = 327
  end
end
