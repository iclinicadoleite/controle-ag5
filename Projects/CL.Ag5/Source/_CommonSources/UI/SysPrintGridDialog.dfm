inherited PrintGridDialog: TPrintGridDialog
  Left = 346
  Top = 190
  BorderWidth = 2
  Caption = 'Imprimir...'
  ClientHeight = 470
  ClientWidth = 770
  OldCreateOrder = False
  Scaled = False
  OnPaint = FormPaint
  ActionList.Images = ActionsImageList
  ExplicitWidth = 780
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 770
    Height = 470
    ExplicitWidth = 770
    ExplicitHeight = 470
    inherited _pnlDetail: TJvPanel
      Width = 766
      Height = 431
      ExplicitWidth = 766
      ExplicitHeight = 431
      object PageControl: TJvPageControl
        Left = 0
        Top = 30
        Width = 766
        Height = 378
        ActivePage = TabSheetImprimir
        TabOrder = 1
        object TabSheetImprimir: TTabSheet
          Caption = 'Imprimir'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            758
            350)
          object ScrollBoxImprimir: TScrollBox
            Left = 3
            Top = 200
            Width = 746
            Height = 146
            Anchors = [akLeft, akRight, akBottom]
            BevelOuter = bvNone
            ParentBackground = True
            TabOrder = 1
          end
          object GroupBoxComentarios: TGroupBox
            Left = 271
            Top = 0
            Width = 489
            Height = 195
            Anchors = [akLeft, akTop, akRight, akBottom]
            Caption = 'Coment'#225'rios'
            Enabled = False
            TabOrder = 0
            DesignSize = (
              489
              195)
            object SpeedButton8: TSpeedButton
              Left = 163
              Top = 85
              Width = 22
              Height = 22
              Action = actCommentDown
            end
            object SpeedButton7: TSpeedButton
              Left = 163
              Top = 63
              Width = 22
              Height = 22
              Action = actCommentUp
            end
            object SpeedButton5: TSpeedButton
              Left = 285
              Top = 169
              Width = 115
              Height = 22
              Action = actNewComment
              Anchors = [akRight, akBottom]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ExplicitLeft = 254
              ExplicitTop = 164
            end
            object SpeedButton6: TSpeedButton
              Left = 406
              Top = 169
              Width = 76
              Height = 22
              Action = actDropComment
              Anchors = [akRight, akBottom]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ExplicitLeft = 375
              ExplicitTop = 164
            end
            object Label11: TLabel
              Left = 196
              Top = 29
              Width = 120
              Height = 12
              Caption = 'Alterado em %s por %s'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 197
              Top = 15
              Width = 110
              Height = 12
              Caption = 'Criado em %s por %s'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object CommentsListBox: TCheckListBox
              Left = 7
              Top = 24
              Width = 150
              Height = 160
              Anchors = [akLeft, akTop, akBottom]
              BevelOuter = bvSpace
              BevelKind = bkTile
              BorderStyle = bsNone
              DragMode = dmAutomatic
              ItemHeight = 13
              TabOrder = 0
              OnDragDrop = CommentsListBoxDragDrop
              OnDragOver = CommentsListBoxDragOver
            end
            object Memo1: TMemo
              Left = 196
              Top = 47
              Width = 284
              Height = 111
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object CheckBox3: TCheckBox
              Left = 197
              Top = 164
              Width = 56
              Height = 17
              Hint = 
                'um coment'#225'rio p'#250'blico pode ser visto e alterado por outros usu'#225'r' +
                'ios do sistema'
              Caption = 'P'#250'blico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
          object GroupBox4: TGroupBox
            Left = 4
            Top = 101
            Width = 261
            Height = 94
            Caption = ' '
            TabOrder = 3
            object ExportViewCheckBox: TCheckBox
              Left = 104
              Top = 54
              Width = 149
              Height = 17
              Caption = 'Visualizar ap'#243's exportar'
              TabOrder = 3
            end
            object EmailExportTypeRadioButton: TRadioButton
              Left = 15
              Top = 64
              Width = 86
              Height = 17
              Caption = 'Enviar email'
              TabOrder = 2
            end
            object FileExportTypeRadioButton: TRadioButton
              Left = 15
              Top = 42
              Width = 65
              Height = 17
              Caption = 'Arquivo'
              Checked = True
              TabOrder = 1
              TabStop = True
            end
            object PanelExportTypes: TPanel
              Left = 3
              Top = 15
              Width = 256
              Height = 22
              BevelOuter = bvNone
              Caption = ' '
              TabOrder = 0
              object Label13: TLabel
                Left = 15
                Top = 6
                Width = 40
                Height = 13
                Caption = 'Formato'
              end
              object PDFExportFormatRadioButton: TRadioButton
                Left = 134
                Top = 5
                Width = 67
                Height = 17
                Caption = 'PDF'
                TabOrder = 1
                OnClick = ExcelExportFormatRadioButtonClick
              end
              object ExcelExportFormatRadioButton: TRadioButton
                Left = 69
                Top = 5
                Width = 49
                Height = 17
                Caption = 'Excel'
                Checked = True
                TabOrder = 0
                TabStop = True
                OnClick = ExcelExportFormatRadioButtonClick
              end
            end
          end
          object GroupBoxImpressao: TGroupBox
            Left = 4
            Top = 1
            Width = 261
            Height = 95
            Caption = ' '
            TabOrder = 2
            object Label12: TLabel
              Left = 13
              Top = 43
              Width = 85
              Height = 13
              Caption = 'Numero de c'#243'pias'
            end
            object Label2: TLabel
              Left = 13
              Top = 19
              Width = 54
              Height = 13
              Caption = 'Impressora'
            end
            object Label14: TLabel
              Left = 6
              Top = 62
              Width = 71
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Orienta'#231#227'o'
            end
            object lblOrientacaoImpressao: TLabel
              Left = 7
              Top = 77
              Width = 67
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Retrato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object PrintPreviewCheckBox: TCheckBox
              Left = 104
              Top = 68
              Width = 149
              Height = 17
              Caption = 'Visualizar antes de imprimir'
              TabOrder = 2
            end
            object PrinterNamesComboBox: TComboBox
              Tag = 2
              Left = 79
              Top = 17
              Width = 178
              Height = 20
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnExit = PropertyExit
            end
            object CopiesSpinEdit: TJvSpinEdit
              Left = 109
              Top = 41
              Width = 44
              Height = 20
              MaxValue = 999.000000000000000000
              MinValue = 1.000000000000000000
              Value = 1.000000000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
          end
          object WarningPrintLabel: TStaticText
            Left = 276
            Top = 257
            Width = 238
            Height = 43
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 
              'Algumas colunas selecionadas n'#227'o ser'#227'o impressas corretamente, v' +
              'erifique as configura'#231#245'es'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object RadioButtonPrint: TRadioButton
            Left = 14
            Top = -2
            Width = 63
            Height = 17
            Caption = 'Imprimir'
            Checked = True
            TabOrder = 5
            TabStop = True
          end
          object RadioButtonExport: TRadioButton
            Left = 14
            Top = 99
            Width = 63
            Height = 17
            Caption = 'Exportar'
            TabOrder = 6
          end
        end
        object TabSheetConfigurar: TTabSheet
          Caption = 'Configurar'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object ClientPanel: TPanel
            Left = 184
            Top = 0
            Width = 574
            Height = 350
            Align = alClient
            Caption = ' '
            TabOrder = 0
            object Splitter2: TSplitter
              Left = 568
              Top = 88
              Width = 5
              Height = 261
              Align = alRight
              ExplicitLeft = 378
              ExplicitHeight = 278
            end
            object gbTitle: TGroupBox
              Left = 1
              Top = 1
              Width = 572
              Height = 87
              Align = alTop
              Caption = 'Configurar colunas / dados'
              TabOrder = 0
              object lblTitleCaption: TLabel
                Left = 44
                Top = 21
                Width = 109
                Height = 12
                Alignment = taCenter
                AutoSize = False
                Caption = 'T'#237'tulo'
                FocusControl = edTitleCaption
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblTitleAlignment: TLabel
                Left = 164
                Top = 19
                Width = 63
                Height = 12
                Caption = 'Alinhamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblTitleColor: TLabel
                Left = 392
                Top = 13
                Width = 40
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'cor de fundo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object lblTitleFont: TLabel
                Left = 265
                Top = 19
                Width = 28
                Height = 12
                Caption = 'Fonte'
                FocusControl = edTitleFont
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object Label4: TLabel
                Left = 6
                Top = 39
                Width = 35
                Height = 12
                Caption = 'Coluna'
                FocusControl = edTitleCaption
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object Label5: TLabel
                Left = 6
                Top = 63
                Width = 26
                Height = 12
                Caption = 'Dado'
                FocusControl = edTitleCaption
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object Label6: TLabel
                Left = 476
                Top = 47
                Width = 36
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'fundo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object Label7: TLabel
                Left = 433
                Top = 34
                Width = 79
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'cor alteranada'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object Label8: TLabel
                Left = 433
                Top = 47
                Width = 33
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'fonte'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object Label9: TLabel
                Left = 343
                Top = 13
                Width = 41
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'altura da linha'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object edTitleCaption: TEdit
                Tag = 1
                Left = 44
                Top = 37
                Width = 109
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                Text = 'edTitleCaption'
                OnExit = PropertyExit
              end
              object edTitleFont: TEdit
                Tag = 4
                Left = 235
                Top = 37
                Width = 91
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Text = 'edTitleFont'
                OnExit = PropertyExit
              end
              object cbTitleAlignment: TComboBox
                Tag = 2
                Left = 156
                Top = 37
                Width = 77
                Height = 20
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnExit = PropertyExit
              end
              object TitleColorsCombobox: TComboBox
                Tag = 3
                Left = 391
                Top = 37
                Width = 39
                Height = 22
                Style = csOwnerDrawFixed
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                OnChange = ColorComboboxChange
                OnClick = ColorComboboxClick
                OnDrawItem = ColorComboboxDrawItem
                OnExit = PropertyExit
                Items.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  '')
              end
              object ButtonTitleFont: TTcGDIButton
                Tag = 4
                Left = 326
                Top = 36
                Width = 16
                Height = 21
                Caption = '...'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentFont = False
                TabOrder = 4
                OnClick = SelectFont
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
              object edDataFont: TEdit
                Tag = 7
                Left = 235
                Top = 60
                Width = 91
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
                Text = 'edDataFont'
                OnExit = PropertyExit
              end
              object cbDataAlignment: TComboBox
                Tag = 5
                Left = 156
                Top = 60
                Width = 77
                Height = 20
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
                OnExit = PropertyExit
              end
              object DataColorsCombobox: TComboBox
                Tag = 6
                Left = 391
                Top = 60
                Width = 39
                Height = 22
                Style = csOwnerDrawFixed
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
                OnChange = ColorComboboxChange
                OnClick = ColorComboboxClick
                OnDrawItem = ColorComboboxDrawItem
                OnExit = PropertyExit
                Items.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  '')
              end
              object btnDataFont: TTcGDIButton
                Tag = 7
                Left = 326
                Top = 59
                Width = 16
                Height = 21
                Caption = '...'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentFont = False
                TabOrder = 8
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
              object dbeTitleCaption: TDBEdit
                Left = 44
                Top = 61
                Width = 109
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 9
              end
              object DataColorsAltBackGround: TComboBox
                Tag = 3
                Left = 474
                Top = 61
                Width = 39
                Height = 22
                Style = csOwnerDrawFixed
                TabOrder = 10
                OnChange = ColorComboboxChange
                OnClick = ColorComboboxClick
                OnDrawItem = ColorComboboxDrawItem
                OnExit = PropertyExit
                Items.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  '')
              end
              object DataColorsAltFont: TComboBox
                Tag = 6
                Left = 433
                Top = 60
                Width = 39
                Height = 22
                Style = csOwnerDrawFixed
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 11
                OnChange = ColorComboboxChange
                OnClick = ColorComboboxClick
                OnDrawItem = ColorComboboxDrawItem
                OnExit = PropertyExit
                Items.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  '')
              end
              object JvSpinEdit2: TJvSpinEdit
                Left = 343
                Top = 60
                Width = 44
                Height = 20
                Value = 8.000000000000000000
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 12
              end
              object JvSpinEdit3: TJvSpinEdit
                Left = 343
                Top = 37
                Width = 44
                Height = 20
                Value = 8.000000000000000000
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 13
              end
              object BitBtn5: TTcGDIButton
                Left = 516
                Top = 15
                Width = 54
                Height = 70
                Align = alRight
                Caption = 'Aplicar a todos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                DisabledPicture.Data = {
                  424D4E0100000000000076000000280000001200000012000000010004000000
                  0000D80000000000000000000000000000000000000000000000000080000080
                  00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
                  000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333F7777773F333300
                  0000377F3733333377F33300000037F7733FFFFF337F3300000037F333F77777
                  F337F300000037F33F7333337F337F00000037F33733333337F37F00000037FF
                  FF7F3333377773000000377777773333333333000000333333333333FFFFFF00
                  000033FFFF33333377777700000037777F333337F3333700000037F37F333333
                  733337000000337337FFFFF7733337000000337F3377777333FF370000003337
                  FF333333FF77F7000000333377FFFFFF77337300000033333377777733333300
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
                  000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333344444433333300
                  00003243342222224433330000003224422222222243330000003222222AAAAA
                  222433000000322222A33333A222430000003222223333333A22430000003222
                  222333333A44430000003AAAAAAA333333333300000033333333333333333300
                  00003333333333334444440000003A444333333A2222240000003A2243333333
                  A2222400000033A22433333442222400000033A222444442222224000000333A
                  2222222222AA240000003333AA222222AA33A3000000333333AAAAAA33333300
                  0000333333333333333333000000}
                TabOrder = 14
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
                Layout = blGlyphTop
              end
            end
            object PanelPreview: TPanel
              Left = 1
              Top = 88
              Width = 567
              Height = 261
              Align = alClient
              Caption = ' '
              TabOrder = 1
              object Splitter1: TSplitter
                Left = 1
                Top = 91
                Width = 565
                Height = 5
                Cursor = crVSplit
                Align = alTop
                ExplicitWidth = 373
              end
              object PreviewDBGrid: TJvDBUltimGrid
                Left = 1
                Top = 1
                Width = 565
                Height = 90
                Align = alTop
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnColumnMoved = PreviewDBGridColumnMoved
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                OnColumnResized = PreviewDBGridColumnResized
              end
              object ScrollBoxConfigurar: TScrollBox
                Left = 1
                Top = 96
                Width = 565
                Height = 164
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
              end
            end
          end
          object LeftPanel: TPanel
            Left = 0
            Top = 0
            Width = 184
            Height = 350
            Align = alLeft
            Caption = ' '
            TabOrder = 1
            DesignSize = (
              184
              350)
            object GroupBox1: TGroupBox
              Left = 5
              Top = 77
              Width = 175
              Height = 262
              Anchors = [akLeft, akTop, akRight, akBottom]
              Caption = 'Colunas a imprimir'
              TabOrder = 0
              DesignSize = (
                175
                262)
              object SpeedButton3: TSpeedButton
                Left = 153
                Top = 98
                Width = 22
                Height = 22
                Action = actColumnUp
                Anchors = [akLeft]
                ExplicitTop = 130
              end
              object SpeedButton4: TSpeedButton
                Left = 153
                Top = 121
                Width = 22
                Height = 22
                Action = actColumnDown
                Anchors = [akLeft]
                ExplicitTop = 160
              end
              object SpeedButton1: TSpeedButton
                Left = 2
                Top = 237
                Width = 95
                Height = 22
                Action = actNewColumn
                Anchors = [akLeft, akBottom]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ExplicitTop = 315
              end
              object SpeedButton2: TSpeedButton
                Left = 97
                Top = 237
                Width = 76
                Height = 22
                Action = actDropColumn
                Anchors = [akLeft, akBottom]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ExplicitTop = 315
              end
              object FieldsListBox: TCheckListBox
                Left = 1
                Top = 15
                Width = 151
                Height = 220
                OnClickCheck = FieldsListBoxClickCheck
                Anchors = [akLeft, akTop, akBottom]
                BevelOuter = bvSpace
                BevelKind = bkTile
                BorderStyle = bsNone
                DragMode = dmAutomatic
                ItemHeight = 13
                TabOrder = 0
                OnClick = FieldsListBoxClick
                OnDragDrop = FieldsListBoxDragDrop
                OnDragOver = FieldsListBoxDragOver
              end
            end
            object GroupBox2: TGroupBox
              Left = 4
              Top = 2
              Width = 176
              Height = 76
              Caption = 'Configura'#231#227'o da folha'
              TabOrder = 1
              object PageSizeComboBox: TComboBox
                Tag = 2
                Left = 6
                Top = 15
                Width = 161
                Height = 20
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                OnExit = PropertyExit
              end
              object RetratoRadioButton: TRadioButton
                Left = 8
                Top = 44
                Width = 77
                Height = 17
                Caption = 'Retrato'
                TabOrder = 1
                OnClick = PropertyExit
              end
              object PaisagemRadioButton: TRadioButton
                Left = 90
                Top = 45
                Width = 77
                Height = 17
                Caption = 'Paisagem'
                TabOrder = 2
                OnClick = PropertyExit
              end
            end
          end
        end
      end
      object TopPanel: TPanel
        Left = 0
        Top = 0
        Width = 766
        Height = 30
        Align = alTop
        Caption = ' '
        TabOrder = 0
        object Label1: TLabel
          Left = 395
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Tam. Fonte'
          Visible = False
        end
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 26
          Height = 13
          Caption = 'T'#237'tulo'
        end
        object CheckBox1: TCheckBox
          Left = 521
          Top = 7
          Width = 57
          Height = 17
          Caption = 'Grade'
          TabOrder = 0
          Visible = False
        end
        object CheckBox2: TCheckBox
          Left = 592
          Top = 7
          Width = 129
          Height = 17
          Caption = 'Exibir coment'#225'rios'
          TabOrder = 1
          Visible = False
          OnClick = CheckBox2Click
        end
        object edtTitle: TEdit
          Left = 45
          Top = 5
          Width = 345
          Height = 21
          TabOrder = 2
          Text = 'edtTitle'
          OnExit = PropertyExit
        end
        object JvSpinEdit1: TJvSpinEdit
          Left = 468
          Top = 5
          Width = 40
          Height = 21
          Value = 8.000000000000000000
          TabOrder = 3
          Visible = False
        end
      end
    end
    inherited _pnlFooter: TJvPanel
      Top = 433
      Width = 766
      Height = 35
      ExplicitTop = 433
      ExplicitWidth = 766
      ExplicitHeight = 35
      inherited _imageBottom: TImage
        Width = 766
        Height = 35
        ExplicitWidth = 766
        ExplicitHeight = 35
      end
      object _btbPrior: TTcGDIButton
        Left = 522
        Top = 5
        Width = 98
        Height = 29
        Action = actConfig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
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
      object _btbNext: TTcGDIButton
        Left = 4
        Top = 5
        Width = 75
        Height = 29
        Caption = 'A&juda'
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
        TabOrder = 2
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
      object BitBtn1: TTcGDIButton
        Left = 640
        Top = 4
        Width = 123
        Height = 29
        Action = actPrintExport
        Anchors = [akRight, akBottom]
        Default = True
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
      object BitBtn2: TTcGDIButton
        Left = 83
        Top = 5
        Width = 87
        Height = 29
        Action = actCancel
        Anchors = [akLeft, akBottom]
        Cancel = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
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
      object Button1: TTcGDIButton
        Left = 204
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Export'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 4
        Visible = False
        OnClick = Button1Click
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
    Images = ActionsImageList
    object actNewColumn: TAction
      Caption = 'Nova Coluna'
      Hint = 'criar uma nova coluna para o relat'#243'rio'
      ImageIndex = 0
      OnExecute = actNewColumnExecute
    end
    object actDropColumn: TAction
      Caption = 'Remover'
      Hint = 'remover uma coluna criada para o relat'#243'rio'
      ImageIndex = 1
      OnExecute = actDropColumnExecute
      OnUpdate = actDropColumnUpdate
    end
    object actColumnUp: TAction
      Hint = 'alterar a ordem da coluna'
      ImageIndex = 6
      OnExecute = actColumnUpExecute
      OnUpdate = actColumnUpUpdate
    end
    object actColumnDown: TAction
      Hint = 'alterar a ordem da coluna'
      ImageIndex = 7
      OnExecute = actColumnDownExecute
      OnUpdate = actColumnDownUpdate
    end
    object actNewComment: TAction
      Caption = 'Novo coment'#225'rio'
      Enabled = False
      Hint = 'criar uma novo coment'#225'rio para o relat'#243'rio'
      ImageIndex = 0
      OnExecute = actNewCommentExecute
    end
    object actDropComment: TAction
      Caption = 'Remover'
      Enabled = False
      Hint = 'remover o coment'#225'rio selecionado'
      ImageIndex = 1
      OnExecute = actDropCommentExecute
    end
    object actCommentUp: TAction
      Enabled = False
      Hint = 'alterar a ordem de exibi'#231#227'o do coment'#225'rio'
      ImageIndex = 6
      OnExecute = actCommentUpExecute
      OnUpdate = actCommentUpUpdate
    end
    object actCommentDown: TAction
      Enabled = False
      Hint = 'alterar a ordem de exibi'#231#227'o do coment'#225'rio'
      ImageIndex = 7
      OnExecute = actCommentDownExecute
      OnUpdate = actCommentDownUpdate
    end
    object actPrintExport: TAction
      Caption = 'Imprimir'
      OnExecute = actPrintExportExecute
      OnUpdate = actPrintExportUpdate
    end
    object actConfig: TAction
      Caption = 'Configurar'
      OnExecute = actConfigExecute
    end
    object actCancel: TAction
      Caption = 'Cancelar'
      OnExecute = actCancelExecute
    end
  end
  object ActionsImageList: TImageList
    Left = 704
    Top = 188
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
  object FontDlg: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 704
    Top = 158
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 705
    Top = 127
  end
end
