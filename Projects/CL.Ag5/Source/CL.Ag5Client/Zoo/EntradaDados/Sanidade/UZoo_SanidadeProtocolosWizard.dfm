inherited Zoo_SanidadeProtocolosWizard: TZoo_SanidadeProtocolosWizard
  Left = 318
  Top = 205
  Caption = 'Protocolos'
  ClientHeight = 540
  ClientWidth = 961
  ActionList.Left = 102
  ActionList.Top = 4
  ExplicitWidth = 967
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 961
    Height = 540
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 961
    ExplicitHeight = 540
    inherited _pnlFooter: TJvPanel
      Top = 509
      Width = 957
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitTop = 509
      ExplicitWidth = 957
      inherited _imageBottom: TImage
        Width = 957
        ExplicitWidth = 957
      end
      inherited _btbPrior: TTcGDIButton
        Left = 766
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 766
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 857
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 857
      end
      inherited _btbExecute: TTcGDIButton
        Left = 872
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 872
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 957
      Height = 507
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 957
      ExplicitHeight = 507
      inherited PageControl: TJvPageControl
        Width = 957
        Height = 507
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ActivePage = tbsColetivo
        ExplicitWidth = 957
        ExplicitHeight = 507
        object tbsTipoLancto: TTabSheet
          Caption = 'tbsTipoLancto'
          ImageIndex = 2
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object rbLancamentoIndividual: TRadioButton
            Left = 92
            Top = 76
            Width = 329
            Height = 17
            Caption = 'Lan'#231'ar protocolo para um animal...'
            TabOrder = 0
          end
          object rbLancamentoColetivo: TRadioButton
            Left = 92
            Top = 128
            Width = 329
            Height = 17
            Caption = 'Lan'#231'ar protocolo para um grupo de animais...'
            TabOrder = 1
          end
        end
        object tbsIndividual: TTabSheet
          Caption = 'tbsIndividual'
          object Splitter2: TSplitter
            Left = 449
            Top = 0
            Width = 5
            Height = 430
            ExplicitHeight = 407
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 449
            Height = 430
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Splitter1: TSplitter
              Left = 2
              Top = 273
              Width = 445
              Height = 5
              Cursor = crVSplit
              Align = alBottom
              ExplicitTop = 314
            end
            object Panel1: TPanel
              Left = 2
              Top = 15
              Width = 445
              Height = 28
              Align = alTop
              BevelOuter = bvNone
              Caption = ' '
              ParentColor = True
              TabOrder = 0
              object Label4: TLabel
                Left = 264
                Top = 5
                Width = 27
                Height = 13
                Caption = 'Data'
              end
              object Label7: TLabel
                Left = 15
                Top = 5
                Width = 48
                Height = 13
                Caption = 'Animal :'
              end
              object dbdeIndividual: TTcDBDateEdit
                Left = 299
                Top = 2
                Width = 133
                Height = 21
                Checked = False
                DataField = 'DATA'
                DataSource = dtsProtocoloIndividual
                CheckOnExit = False
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ButtonWidth = 25
                ParentFont = False
                TabOrder = 1
              end
              object edtBrincoIndividual: TJvComboEdit
                Left = 70
                Top = 2
                Width = 185
                Height = 21
                ButtonWidth = 15
                ImageKind = ikEllipsis
                TabOrder = 0
                Text = ''
                OnButtonClick = edtBrincoIndividualButtonClick
                OnChange = edtBrincoIndividualChange
                OnKeyPress = edtBrincoIndividualKeyPress
              end
            end
            object Panel7: TPanel
              Left = 2
              Top = 64
              Width = 445
              Height = 209
              Align = alClient
              Caption = ' '
              ParentColor = True
              TabOrder = 1
              object dbgProtocolosDisponiveisIndividual: TJvDBUltimGrid
                Left = 1
                Top = 16
                Width = 443
                Height = 192
                Align = alClient
                DataSource = dtsProtocolosDisponiveis
                Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
              end
              object JvPanel1: TJvPanel
                Left = 1
                Top = 1
                Width = 443
                Height = 15
                Align = alTop
                Caption = 'Protocolos dispon'#237'veis'
                Color = 15389113
                ParentBackground = False
                TabOrder = 1
              end
            end
            object Panel8: TPanel
              Left = 2
              Top = 278
              Width = 445
              Height = 150
              Align = alBottom
              Caption = ' '
              ParentColor = True
              TabOrder = 2
              object dbgProtocolosAplicadosIndividual: TJvDBUltimGrid
                Left = 1
                Top = 16
                Width = 443
                Height = 133
                TabStop = False
                Align = alClient
                DataSource = dtsProtocolosAplicados
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnKeyDown = dbgKeyDown
                OnKeyPress = dbgKeyPress
                AutoAppend = False
                OnShowEditor = dbgShowEditor
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                CanDelete = False
                EditControls = <>
                RowsHeight = 16
                TitleRowHeight = 17
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CODIGO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    Width = 80
                    Visible = True
                  end>
              end
              object JvPanel2: TJvPanel
                Left = 1
                Top = 1
                Width = 443
                Height = 15
                Align = alTop
                Caption = 'Hist'#243'rico de protocolos j'#225' aplicados ao animal'
                Color = 15389113
                ParentBackground = False
                TabOrder = 1
              end
            end
            object Panel2: TPanel
              Left = 2
              Top = 43
              Width = 445
              Height = 21
              Align = alTop
              BevelOuter = bvNone
              Caption = ' '
              Color = clWhite
              ParentBackground = False
              TabOrder = 3
              object Label2: TLabel
                Left = 5
                Top = 3
                Width = 136
                Height = 13
                Caption = 'Animal Selecionado :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBEdit1: TDBText
                Left = 146
                Top = 3
                Width = 121
                Height = 15
                DataField = 'NOMEESTABULO'
                DataSource = dtsProtocoloIndividual
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label25: TLabel
                Left = 538
                Top = 3
                Width = 24
                Height = 13
                Caption = 'Lote'
              end
            end
          end
          object Panel5: TPanel
            Left = 454
            Top = 0
            Width = 503
            Height = 430
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelOuter = bvNone
            Caption = ' '
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object gbxFuncionario: TGroupBox
              Left = 0
              Top = 387
              Width = 503
              Height = 43
              Align = alBottom
              Caption = 'Alterar funcion'#225'rio'
              TabOrder = 0
              DesignSize = (
                503
                43)
              object Label22: TLabel
                Left = 15
                Top = 19
                Width = 55
                Height = 13
                Caption = '&Funcion'#225'rio'
                FocusControl = edFuncionarioIndividual
              end
              object edFuncionarioIndividual: TJvComboEdit
                Left = 93
                Top = 16
                Width = 137
                Height = 21
                ButtonWidth = 15
                ImageKind = ikEllipsis
                TabOrder = 0
                Text = ''
                OnButtonClick = edFuncionarioIndividualButtonClick
                OnChange = edFuncionarioIndividualChange
                OnKeyPress = edFuncionarioIndividualKeyPress
              end
              object BitBtn1: TTcGDIButton
                Left = 235
                Top = 14
                Width = 98
                Height = 25
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Action = actAlterarFuncionarioIndividual
                Anchors = [akLeft, akBottom]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
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
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 503
              Height = 387
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 1
              Caption = ' '
              ParentBackground = False
              ParentColor = True
              TabOrder = 1
              object dbgTarefasAAplicarIndividual: TJvDBUltimGrid
                Left = 1
                Top = 16
                Width = 501
                Height = 370
                TabStop = False
                Align = alClient
                DataSource = dtsTarefasIndividual
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnEditButtonClick = dbgTarefasAAplicarIndividualEditButtonClick
                OnKeyDown = dbgKeyDown
                OnKeyPress = dbgKeyPress
                AutoAppend = False
                OnShowEditor = dbgShowEditor
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                CanDelete = False
                EditControls = <>
                RowsHeight = 16
                TitleRowHeight = 17
                OnCheckIfBooleanField = dbgCheckIfBooleanField
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PREVISAO'
                    ReadOnly = True
                    Width = 84
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'DESCARTELEITE'
                    ReadOnly = True
                    Width = 112
                    Visible = True
                  end
                  item
                    ButtonStyle = cbsEllipsis
                    Expanded = False
                    FieldName = 'NOMEFUNCIONARIO'
                    Width = 96
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBS'
                    Width = 79
                    Visible = True
                  end>
              end
              object JvPanel3: TJvPanel
                Left = 1
                Top = 1
                Width = 501
                Height = 15
                Align = alTop
                Caption = 'Tarefas do protocolo'
                Color = 15389113
                ParentBackground = False
                TabOrder = 1
              end
            end
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 430
            Width = 957
            Height = 54
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Label1: TLabel
              Left = 16
              Top = 9
              Width = 36
              Height = 13
              Caption = 'Brinco'
            end
            object Label3: TLabel
              Left = 29
              Top = 32
              Width = 23
              Height = 13
              Caption = 'DPP'
            end
            object Label11: TLabel
              Left = 154
              Top = 9
              Width = 92
              Height = 13
              Caption = #218'ltima pesagem'
            end
            object Label12: TLabel
              Left = 154
              Top = 32
              Width = 100
              Height = 13
              Caption = 'Data '#250'ltimo parto'
            end
            object Label13: TLabel
              Left = 363
              Top = 9
              Width = 36
              Height = 13
              Caption = 'Status'
            end
            object Label14: TLabel
              Left = 363
              Top = 32
              Width = 79
              Height = 13
              Caption = #218'ltimo evento'
            end
            object Label15: TLabel
              Left = 579
              Top = 31
              Width = 109
              Height = 13
              Caption = 'Data '#250'ltimo evento'
            end
            object DBText10: TDBText
              Left = 447
              Top = 32
              Width = 105
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESC_EVENTO'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText11: TDBText
              Left = 690
              Top = 31
              Width = 104
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DATAULTIMOEVENTO'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText12: TDBText
              Left = 403
              Top = 9
              Width = 214
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESC_STATUS'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText13: TDBText
              Left = 251
              Top = 9
              Width = 105
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'ULTIMAPESAGEM'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText14: TDBText
              Left = 259
              Top = 32
              Width = 100
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DATAULTIMOPARTO'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText15: TDBText
              Left = 57
              Top = 32
              Width = 93
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DPP'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText16: TDBText
              Left = 57
              Top = 9
              Width = 90
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'BRINCO'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 579
              Top = 9
              Width = 24
              Height = 13
              Caption = 'Lote'
            end
            object DBText19: TDBText
              Left = 610
              Top = 9
              Width = 75
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'LOTE'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object tbsColetivo: TTabSheet
          Caption = 'tbsColetivo'
          ImageIndex = 1
          object Panel4: TPanel
            Left = 0
            Top = 45
            Width = 957
            Height = 385
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel5'
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 957
              Height = 385
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel7'
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object Splitter6: TSplitter
                Left = 0
                Top = 192
                Width = 957
                Height = 5
                Cursor = crVSplit
                Align = alBottom
                ExplicitTop = 217
              end
              object Panel10: TPanel
                Left = 0
                Top = 197
                Width = 957
                Height = 188
                Align = alBottom
                BevelOuter = bvNone
                BorderWidth = 1
                Caption = ' '
                ParentBackground = False
                ParentColor = True
                TabOrder = 0
                object Splitter5: TSplitter
                  Left = 290
                  Top = 52
                  Width = 5
                  Height = 135
                  ExplicitLeft = 259
                  ExplicitTop = 22
                  ExplicitHeight = 121
                end
                object Panel14: TPanel
                  Left = 1
                  Top = 52
                  Width = 289
                  Height = 135
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Align = alLeft
                  BorderWidth = 1
                  Caption = ' '
                  ParentBackground = False
                  ParentColor = True
                  TabOrder = 1
                  object dbgAnimaisColetivo: TJvDBUltimGrid
                    Left = 2
                    Top = 17
                    Width = 285
                    Height = 116
                    TabStop = False
                    Align = alClient
                    DataSource = dtsFichaAnimalColetivo
                    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                    ReadOnly = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnKeyDown = dbgKeyDown
                    OnKeyPress = dbgKeyPress
                    AutoAppend = False
                    OnShowEditor = dbgShowEditor
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    CanDelete = False
                    EditControls = <>
                    RowsHeight = 16
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'BRINCO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOMEESTABULO'
                        Width = 211
                        Visible = True
                      end>
                  end
                  object JvPanel6: TJvPanel
                    Left = 2
                    Top = 2
                    Width = 285
                    Height = 15
                    Align = alTop
                    Caption = 'Lista de animais a aplicar o protocolo'
                    Color = 15389113
                    ParentBackground = False
                    TabOrder = 1
                  end
                end
                object Panel9: TPanel
                  Left = 1
                  Top = 16
                  Width = 955
                  Height = 36
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = ' '
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 0
                  DesignSize = (
                    955
                    36)
                  object Label6: TLabel
                    Left = 8
                    Top = 8
                    Width = 77
                    Height = 13
                    Caption = '&Adicionar animal'
                    FocusControl = edtBrincoColetivo
                  end
                  object edtBrincoColetivo: TJvComboEdit
                    Left = 109
                    Top = 5
                    Width = 117
                    Height = 21
                    ButtonWidth = 15
                    ImageKind = ikEllipsis
                    TabOrder = 0
                    Text = ''
                    OnButtonClick = edtBrincoColetivoButtonClick
                    OnChange = edtBrincoColetivoChange
                    OnKeyPress = edtBrincoColetivoKeyPress
                  end
                  object BitBtn2: TTcGDIButton
                    Left = 230
                    Top = 2
                    Width = 136
                    Height = 29
                    Anchors = []
                    Caption = 'Remover animal selecionado'
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
                  object TcGDIButton1: TTcGDIButton
                    Left = 372
                    Top = 2
                    Width = 136
                    Height = 29
                    Action = actSelectByPersonalizado
                    Anchors = []
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
                end
                object JvPanel4: TJvPanel
                  Left = 1
                  Top = 1
                  Width = 955
                  Height = 15
                  Align = alTop
                  Caption = 'Sele'#231#227'o de animais para aplicar o protocolo'
                  Color = 15389113
                  ParentBackground = False
                  TabOrder = 2
                end
                object Panel13: TPanel
                  Left = 295
                  Top = 52
                  Width = 661
                  Height = 135
                  Align = alClient
                  Caption = ' '
                  ParentColor = True
                  TabOrder = 3
                  object dbgProtocolosAplicadosColetivo: TJvDBUltimGrid
                    Left = 1
                    Top = 16
                    Width = 659
                    Height = 118
                    TabStop = False
                    Align = alClient
                    DataSource = dtsProtocolosAplicados
                    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                    ReadOnly = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnKeyDown = dbgKeyDown
                    OnKeyPress = dbgKeyPress
                    AutoAppend = False
                    OnShowEditor = dbgShowEditor
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    CanDelete = False
                    EditControls = <>
                    RowsHeight = 16
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'CODIGO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME'
                        Width = 64
                        Visible = True
                      end>
                  end
                  object JvPanel7: TJvPanel
                    Left = 1
                    Top = 1
                    Width = 659
                    Height = 15
                    Align = alTop
                    Caption = 'Hist'#243'rico de protocolos j'#225' aplicados ao animal selecionado'
                    Color = 15389113
                    ParentBackground = False
                    TabOrder = 1
                  end
                end
              end
              object Panel12: TPanel
                Left = 0
                Top = 0
                Width = 957
                Height = 192
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alClient
                BorderWidth = 1
                Caption = ' '
                ParentBackground = False
                ParentColor = True
                TabOrder = 1
                object dbgTarefasAAplicarColetivo: TJvDBUltimGrid
                  Left = 2
                  Top = 17
                  Width = 953
                  Height = 173
                  TabStop = False
                  Align = alClient
                  DataSource = dtsTarefasColetivo
                  Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnEditButtonClick = dbgTarefasAAplicarColetivoEditButtonClick
                  OnKeyDown = dbgKeyDown
                  OnKeyPress = dbgKeyPress
                  AutoAppend = False
                  OnShowEditor = dbgShowEditor
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  CanDelete = False
                  EditControls = <>
                  RowsHeight = 16
                  TitleRowHeight = 17
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'NOME'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PREVISAO'
                      ReadOnly = True
                      Width = 124
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCARTELEITE'
                      ReadOnly = True
                      Width = 149
                      Visible = True
                    end
                    item
                      ButtonStyle = cbsEllipsis
                      Expanded = False
                      FieldName = 'NOMEFUNCIONARIO'
                      Width = 194
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'OBS'
                      Width = 229
                      Visible = True
                    end>
                end
                object JvPanel5: TJvPanel
                  Left = 2
                  Top = 2
                  Width = 953
                  Height = 15
                  Align = alTop
                  Caption = 'Tarefas do protocolo'
                  Color = 15389113
                  ParentBackground = False
                  TabOrder = 1
                end
              end
            end
          end
          object GroupBox4: TGroupBox
            Left = 0
            Top = 430
            Width = 957
            Height = 54
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Label9: TLabel
              Left = 16
              Top = 9
              Width = 36
              Height = 13
              Caption = 'Brinco'
            end
            object Label16: TLabel
              Left = 29
              Top = 32
              Width = 23
              Height = 13
              Caption = 'DPP'
            end
            object Label17: TLabel
              Left = 154
              Top = 9
              Width = 92
              Height = 13
              Caption = #218'ltima pesagem'
            end
            object Label18: TLabel
              Left = 154
              Top = 32
              Width = 100
              Height = 13
              Caption = 'Data '#250'ltimo parto'
            end
            object Label19: TLabel
              Left = 363
              Top = 9
              Width = 36
              Height = 13
              Caption = 'Status'
            end
            object Label20: TLabel
              Left = 363
              Top = 32
              Width = 79
              Height = 13
              Caption = #218'ltimo evento'
            end
            object Label21: TLabel
              Left = 579
              Top = 32
              Width = 109
              Height = 13
              Caption = 'Data '#250'ltimo evento'
            end
            object DBText3: TDBText
              Left = 447
              Top = 32
              Width = 105
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESC_EVENTO'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText4: TDBText
              Left = 690
              Top = 32
              Width = 104
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DATAULTIMOEVENTO'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText5: TDBText
              Left = 403
              Top = 9
              Width = 154
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESC_STATUS'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText6: TDBText
              Left = 251
              Top = 9
              Width = 105
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'ULTIMAPESAGEM'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText7: TDBText
              Left = 259
              Top = 32
              Width = 100
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DATAULTIMOPARTO'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText8: TDBText
              Left = 57
              Top = 32
              Width = 93
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DPP'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText9: TDBText
              Left = 57
              Top = 9
              Width = 90
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'BRINCO'
              DataSource = dtsResumoAnimal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label24: TLabel
              Left = 579
              Top = 9
              Width = 24
              Height = 13
              Caption = 'Lote'
            end
            object DBText17: TDBText
              Left = 616
              Top = 9
              Width = 139
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'LOTE'
              DataSource = dtsFichaAnimalColetivo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 957
            Height = 45
            Align = alTop
            BevelOuter = bvNone
            Caption = ' '
            ParentColor = True
            TabOrder = 0
            object GroupBox6: TGroupBox
              Left = 472
              Top = 0
              Width = 485
              Height = 45
              Align = alClient
              Caption = '&Alterar funcion'#225'rio'
              TabOrder = 1
              DesignSize = (
                485
                45)
              object Label10: TLabel
                Left = 16
                Top = 21
                Width = 55
                Height = 13
                Caption = 'Funcion'#225'rio'
                FocusControl = edFuncionarioColetivo
              end
              object edFuncionarioColetivo: TJvComboEdit
                Left = 87
                Top = 18
                Width = 127
                Height = 21
                ButtonWidth = 15
                ImageKind = ikEllipsis
                TabOrder = 0
                Text = ''
                OnButtonClick = edFuncionarioColetivoButtonClick
                OnChange = edFuncionarioColetivoChange
                OnKeyPress = edFuncionarioColetivoKeyPress
              end
              object BitBtn3: TTcGDIButton
                Left = 219
                Top = 16
                Width = 98
                Height = 25
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Action = actAlterarFuncionarioColetivo
                Anchors = [akLeft, akBottom]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
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
            object GroupBox3: TGroupBox
              Left = 0
              Top = 0
              Width = 472
              Height = 45
              Align = alLeft
              Caption = 'Protocolo a aplicar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object Label8: TLabel
                Left = 227
                Top = 21
                Width = 78
                Height = 13
                Caption = 'Data de in'#237'cio'
              end
              object Label5: TLabel
                Left = 16
                Top = 21
                Width = 53
                Height = 13
                Caption = 'Protocolo'
                FocusControl = dblcProtocoloColetivo
              end
              object JvDBDateEdit2: TTcDBDateEdit
                Left = 313
                Top = 18
                Width = 121
                Height = 21
                Checked = False
                DataField = 'DATA'
                DataSource = dtsProtocoloColetivo
                CheckOnExit = False
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ButtonWidth = 25
                ParentFont = False
                TabOrder = 1
              end
              object dblcProtocoloColetivo: TDBLookupComboBox
                Left = 76
                Top = 18
                Width = 136
                Height = 21
                DataField = 'PROTOCOLO'
                DataSource = dtsProtocoloColetivo
                DropDownRows = 15
                DropDownWidth = 500
                TabOrder = 0
                OnKeyDown = dblcProtocoloColetivoKeyDown
              end
            end
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 102
    Top = 4
    inherited _actNext: TAction
      OnUpdate = _actNextUpdate
    end
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
    object actAlterarFuncionarioIndividual: TAction
      Caption = 'Aplicar'
      OnExecute = actAlterarFuncionarioIndividualExecute
      OnUpdate = actAlterarFuncionarioIndividualUpdate
    end
    object actAlterarFuncionarioColetivo: TAction
      Caption = 'Aplicar'
      OnExecute = actAlterarFuncionarioColetivoExecute
      OnUpdate = actAlterarFuncionarioColetivoUpdate
    end
    object actSelectByPersonalizado: TAction
      Category = 'Wizard'
      Caption = 'Selecionar animais via relat'#243'rio personalizado'
      OnExecute = actSelectByPersonalizadoExecute
      OnUpdate = actSelectByPersonalizadoUpdate
    end
  end
  object dtsFichaAnimalColetivo: TDataSource
    DataSet = Zoo_SanidadeProtocolosDatamodule.cdsFichaAnimalColetivo
    Left = 66
    Top = 217
  end
  object dtsTarefasIndividual: TDataSource
    DataSet = Zoo_SanidadeProtocolosDatamodule.cdsTarefasIndividual
    Left = 521
    Top = 145
  end
  object dtsTarefasColetivo: TDataSource
    DataSet = Zoo_SanidadeProtocolosDatamodule.cdsTarefasColetivo
    Left = 485
    Top = 144
  end
  object dtsProtocoloIndividual: TDataSource
    DataSet = Zoo_SanidadeProtocolosDatamodule.cdsProtocoloIndividual
    OnDataChange = dtsProtocoloIndividualDataChange
    Left = 20
  end
  object dtsProtocoloColetivo: TDataSource
    DataSet = Zoo_SanidadeProtocolosDatamodule.cdsProtocoloColetivo
    OnDataChange = dtsProtocoloColetivoDataChange
    Left = 52
  end
  object dtsProtocolosAplicados: TDataSource
    DataSet = Zoo_SanidadeProtocolosDatamodule.cdsProtocolosAplicados
    Left = 562
    Top = 341
  end
  object dtsResumoAnimal: TDataSource
    DataSet = Zoo_SanidadeProtocolosDatamodule.cdsResumoAnimal
    Left = 901
    Top = 463
  end
  object dtsProtocolosDisponiveis: TDataSource
    DataSet = Zoo_SanidadeProtocolosDatamodule.cdsProtocolosDisponiveis
    Left = 320
    Top = 208
  end
end
