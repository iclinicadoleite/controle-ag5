inherited Zoo_SanidadeBaixarTarefasWizard: TZoo_SanidadeBaixarTarefasWizard
  Left = 360
  Top = 139
  Caption = 'Baixar Tarefas'
  ClientHeight = 458
  ClientWidth = 750
  ExplicitWidth = 756
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 750
    Height = 458
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 750
    ExplicitHeight = 458
    inherited _pnlFooter: TJvPanel
      Top = 427
      Width = 746
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitTop = 427
      ExplicitWidth = 746
      inherited _imageBottom: TImage
        Width = 746
        ExplicitWidth = 746
      end
      inherited _btbPrior: TTcGDIButton
        Left = 555
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 555
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 646
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 646
      end
      inherited _btbExecute: TTcGDIButton
        Left = 661
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 661
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 746
      Height = 425
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 746
      ExplicitHeight = 425
      inherited PageControl: TJvPageControl
        Width = 746
        Height = 399
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ActivePage = tbsTarefa
        ExplicitWidth = 746
        ExplicitHeight = 399
        object tbsTipoLancto: TTabSheet
          Caption = 'tbsTipoLancto'
          ImageIndex = 2
          object Label6: TLabel
            Left = 348
            Top = 122
            Width = 141
            Height = 13
            Caption = 'Com  execu'#231#227'o prevista at'#233' :'
          end
          object rbLancamentoAnimal: TRadioButton
            Left = 92
            Top = 76
            Width = 222
            Height = 17
            Caption = 'de um animal'
            TabOrder = 0
          end
          object rbLancamentoTarefa: TRadioButton
            Left = 92
            Top = 121
            Width = 222
            Height = 17
            Caption = 'de v'#225'rios animais '
            TabOrder = 1
          end
          object JvDateEdit1: TTcDateEdit
            Left = 524
            Top = 119
            Width = 106
            Height = 21
            Checked = False
            CheckOnExit = False
            TabOrder = 2
          end
          object rbLancamentoFuncionario: TRadioButton
            Left = 94
            Top = 166
            Width = 222
            Height = 17
            Caption = 'por funcion'#225'rio'
            TabOrder = 3
          end
        end
        object tbsAnimal: TTabSheet
          Caption = 'tbsAnimal'
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 746
            Height = 49
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label7: TLabel
              Left = 15
              Top = 18
              Width = 48
              Height = 13
              Caption = 'Animal :'
            end
            object Label4: TLabel
              Left = 283
              Top = 18
              Width = 27
              Height = 13
              Caption = 'Data'
            end
            object edtBrincoIndividual: TJvComboEdit
              Left = 78
              Top = 15
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
            object JvDBDateEdit2: TTcDBDateEdit
              Left = 320
              Top = 15
              Width = 121
              Height = 21
              Checked = False
              DataField = 'DATA'
              DataSource = dtsTmp
              CheckOnExit = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 49
            Width = 746
            Height = 327
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
            object Panel11: TPanel
              Left = 0
              Top = 21
              Width = 746
              Height = 306
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 1
              Caption = ' '
              Color = clSilver
              ParentBackground = False
              TabOrder = 0
              object dbgTarefasAnimal: TJvDBUltimGrid
                Left = 1
                Top = 1
                Width = 744
                Height = 304
                TabStop = False
                Align = alClient
                DataSource = dtsTarefasAnimal
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = dbgDrawColumnCell
                OnKeyDown = dbgKeyDown
                OnKeyPress = dbgKeyPress
                AutoAppend = False
                OnShowEditor = dbgShowEditor
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                CanDelete = False
                EditControls = <
                  item
                    ControlName = 'DBLookupComboBox2'
                    FieldName = 'DESCR_STATUS'
                    FitCell = fcCellSize
                    LeaveOnEnterKey = True
                    LeaveOnUpDownKey = True
                  end
                  item
                    ControlName = 'deDataIndividual'
                    FieldName = 'DATASTATUS'
                    FitCell = fcCellSize
                    LeaveOnEnterKey = True
                    LeaveOnUpDownKey = True
                  end
                  item
                    ControlName = 'deReExecutarIndividual'
                    FieldName = 'REEXECUTAR_EM'
                    FitCell = fcCellSize
                    LeaveOnEnterKey = True
                    LeaveOnUpDownKey = True
                  end>
                RowsHeight = 16
                TitleRowHeight = 17
                OnCheckIfBooleanField = dbgCheckIfBooleanField
                Columns = <
                  item
                    Expanded = False
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO'
                    ReadOnly = True
                    Width = 117
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    ReadOnly = True
                    Width = 168
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATAPREVISTA'
                    ReadOnly = True
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCR_STATUS'
                    Width = 88
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATASTATUS'
                    Title.Caption = 'Data'
                    Width = 96
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'REEXECUTAR_EM'
                    Width = 107
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBS'
                    ReadOnly = True
                    Visible = True
                  end>
              end
              object DBLookupComboBox2: TDBLookupComboBox
                Left = 410
                Top = 93
                Width = 117
                Height = 21
                DataField = 'DESCR_STATUS'
                DataSource = dtsTarefasAnimal
                TabOrder = 1
                Visible = False
                OnKeyDown = DBLookupComboBox2KeyDown
              end
              object deDataIndividual: TTcDBDateEdit
                Left = 548
                Top = 152
                Width = 121
                Height = 21
                Checked = False
                DataField = 'DATASTATUS'
                DataSource = dtsTarefasAnimal
                CheckOnExit = False
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                Visible = False
              end
              object deReExecutarIndividual: TTcDBDateEdit
                Left = 555
                Top = 188
                Width = 121
                Height = 21
                Checked = False
                DataField = 'REEXECUTAR_EM'
                DataSource = dtsTarefasAnimal
                CheckOnExit = False
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                Visible = False
              end
            end
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 746
              Height = 21
              Align = alTop
              BevelOuter = bvNone
              Caption = ' '
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
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
                Width = 475
                Height = 15
                DataField = 'NOMEANIMAL'
                DataSource = dtsTmp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
        end
        object tbsTarefa: TTabSheet
          Caption = 'tbsTarefa'
          ImageIndex = 1
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 746
            Height = 376
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel5'
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 746
              Height = 376
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel7'
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 746
                Height = 61
                Align = alTop
                BevelOuter = bvNone
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object Label10: TLabel
                  Left = 5
                  Top = 41
                  Width = 60
                  Height = 13
                  Caption = 'Animais :'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox3: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 746
                  Height = 57
                  Align = alTop
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object Label8: TLabel
                    Left = 219
                    Top = 12
                    Width = 27
                    Height = 13
                    Caption = 'Data'
                  end
                  object Label5: TLabel
                    Left = 10
                    Top = 12
                    Width = 36
                    Height = 13
                    Caption = 'Tarefa'
                    FocusControl = dblcTarefaColetivo
                  end
                  object dblcTarefaColetivo: TDBLookupComboBox
                    Left = 62
                    Top = 14
                    Width = 136
                    Height = 21
                    DataField = 'TAREFA'
                    DataSource = dtsTmp
                    DropDownRows = 15
                    TabOrder = 0
                    OnKeyDown = dblcTarefaColetivoKeyDown
                  end
                  object JvDBDateEdit1: TTcDBDateEdit
                    Left = 252
                    Top = 14
                    Width = 121
                    Height = 21
                    Checked = False
                    DataField = 'DATA'
                    DataSource = dtsTmp
                    CheckOnExit = False
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                  end
                  object dblcStatusTarefasColetivo: TDBLookupComboBox
                    Left = 585
                    Top = 14
                    Width = 117
                    Height = 21
                    DataField = 'DESCR_STATUS'
                    DataSource = dtsTmp
                    TabOrder = 2
                  end
                  object btbSelectAllColetivo: TTcGDIButton
                    Left = 413
                    Top = 11
                    Width = 155
                    Height = 31
                    Caption = 'selecionar todos como :'
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
                      424DF60600000000000036000000280000001800000018000000010018000000
                      0000C0060000C40E0000C40E00000000000000000000FEFEFEF8F8F8F2F2F2ED
                      EDEDE9E9E9E5E5E5E1E1E1E1E1E1E0E0E0DBDBDBD9D9D9D9D9D9D8D8D8D9D9D9
                      DADADAE1E1E1E1E1E1E0E0E0E6E6E6E9E9E9EDEDEDF2F2F2F8F8F8FEFEFEF2F2
                      F2CCCCCCBDBDBDB6B6B6B2B2B2ACACACACACACA9A9A9A7A7A7A7A7A7A7A7A7A7
                      A7A7A6A6A6A7A7A7A7A7A7A7A7A7A9A9A9ABABABADADADB2B2B2B5B5B5BEBEBE
                      CCCCCCF1F1F1FFFFFFFFFFFFEDEDEDD9D9D9D7D7D7D5D5D5D6D6D6D2D2D2D1D1
                      D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D2D2D2D6D6D6D5D5D5D7
                      D7D7D9D9D9E7E7E7FFFFFFFFFFFFFFFFFFF2F2F2BEBEBEBDBDBDBDBDBDBDBDBD
                      BDBDBDBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
                      BEBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDE9E9E9FFFFFFFFFFFFE4E4E4BFBFBFBF
                      BFBFBFBFBFC0C0C0BFBFBFBFBFBFC0C0C0BFBFBFBFBFBFBFBFBFC0C0C0BFBFBF
                      C0C0C0BFBFBFBFBFBFC0C0C0BFBFBFBFBFBFC0C0C0BFBFBFDADADAFFFFFFFFFF
                      FFE5E5E5C1C1C1C1C1C1C2C2C2C2C2C2C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1
                      C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1
                      DCDCDCFFFFFFFFFFFFE6E6E6C3C3C3BFBFBFACACACADADADB8B8B8C4C4C4C2C2
                      C2BEBEBEBEBEBEBEBEBEBFBFBFBEBEBEBFBFBFBEBEBEBEBEBEBFBFBFBEBEBEBE
                      BEBEC2C2C2C3C3C3DDDDDDFFFFFFFFFFFFE7E7E7C6C6C6B1B1B1C5C5C5C5C5C5
                      B0B0B0C8C8C8B1B1B1A0A0A0A2A2A2A2A2A2A1A1A1A2A2A2A1A1A1A2A2A2A2A2
                      A2A1A1A1A2A2A2A1A1A1AFAFAFC6C6C6DFDFDFFFFFFFFFFFFFE8E8E8C7C7C7BC
                      BCBCBABABABCBCBCB6B6B6C8C8C8C6C6C6C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2
                      C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C6C6C6C7C7C7E0E0E0FFFFFFFFFF
                      FFEAEAEAC9C9C9C9C9C9C9C9C9C9C9C9CACACAC9C9C9C9C9C9C9C9C9C9C9C9C9
                      C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9
                      E2E2E2FFFFFFFFFFFFEAEAEACBCBCBCCCCCCCECECECCCCCCCECECECBCBCBCCCC
                      CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCBCBCBCBCBCBCB
                      CBCBCBCBCBCBCBCBE2E2E2FFFFFFFFFFFFEBEBEBCDCDCDBEBEBEA2A2A2A6A6A6
                      B2B2B2CFCFCFC0C0C0B3B3B3B4B4B4B4B4B4B5B5B5B4B4B4B5B5B5B3B3B3C0C0
                      C0CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCE4E4E4FFFFFFFFFFFFECECECCECECEB7
                      B7B7D2D2D2D2D2D2B9B9B9D0D0D0B9B9B9A6A6A6A8A8A8A8A8A8A7A7A7A8A8A8
                      A7A7A7A6A6A6BABABACECECECCCCCCCCCCCCCCCCCCCCCCCCE5E5E5FFFFFFFFFF
                      FFEDEDEDCFCFCFCACACAB8B8B8BABABAC2C2C2D3D3D1D2D2D1D2D2D2D2D2D2D2
                      D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0D0CFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
                      E6E6E6FFFFFFFFFFFFEDEDEDD0D0D0D0D0D0D3D5D7D3D5D8D9D9D5ADADC1CBCB
                      CDD1D1D0CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFD0
                      D0D0D0D0D0D0D0D0E7E7E7FFFFFFFFFFFFEEEEEED1D1D1D3D4D6B5A98EC0B189
                      BCBABE00008244449EE9E9DBD6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
                      D6D6D6D6D6D6D6D1D1D1D1D1D1D1D1D1E7E7E7FFFFFFFFFFFFEFEFEFD3D4D6B9
                      B2A8B5882275594D0000864848B103039268689BAFAFA5A3A3A3A4A4A4A3A3A3
                      A4A4A4A3A3A3A3A3A3A4A4A4A0A0A0C7C7C7D2D2D2D2D2D2E8E8E8FFFFFFFFFF
                      FFEFEFEFD4D5D6BCB7ADD1A6555E52971112ABC7C7D36161BA0202938B8BAEC9
                      C9C0BBBBBBBCBCBCBBBBBBBCBCBCBCBCBCBBBBBBBABABACDCDCDD3D3D3D3D3D3
                      E9E9E9FFFFFFFFFFFFF0F0F0D4D4D4D6D7D8C0BAB0CFC8AEB3B2C6DDDDD6D1D1
                      D41616AA00009C8585C2DADAD7D6D6D6D6D6D6D5D5D5D5D5D5D6D6D6D5D5D5D4
                      D4D4D4D4D4D4D4D4EAEAEAFFFFFFFFFFFFF0F0F0D3D3D3D5D5D5D6D7D8D4D5D7
                      D8D8D6D5D5D5DCDCD49D9DCF0C0CAB0000A3D5D5D3D6D6D5D3D3D3D5D5D5D5D5
                      D5D3D3D3D5D5D5D5D5D5D3D3D3D5D5D5E9E9E9FFFFFFFFFFFFF2F2F2D5D5D5D3
                      D3D3D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4E1E1D67E7ECE0202B1E8E8D7D4D4D4
                      D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D3D3D3EDEDEDFFFFFFFFFF
                      FFF8F8F8E0E0E0DCDCDCDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBEBEBDD82
                      82CFD6D6DBDCDCDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDCDCDCE0E0E0
                      F3F3F3FFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F2F2F2F2F2F2F2F2F2F2F2F2F2F2
                      F2F2F2F2F2F2F2F6F6F3F3F3F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
                      F2F2F1F1F1F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    TabOrder = 3
                    OnClick = btbSelectAllColetivoClick
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
              object Panel12: TPanel
                Left = 0
                Top = 61
                Width = 746
                Height = 315
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alClient
                BorderWidth = 1
                Caption = ' '
                Color = clSilver
                ParentBackground = False
                TabOrder = 1
                object dbgTarefas: TJvDBUltimGrid
                  Left = 2
                  Top = 2
                  Width = 742
                  Height = 311
                  TabStop = False
                  Align = alClient
                  DataSource = dtsAnimaisTarefa
                  Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = dbgDrawColumnCell
                  OnKeyDown = dbgKeyDown
                  OnKeyPress = dbgKeyPress
                  AutoAppend = False
                  OnShowEditor = dbgShowEditor
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  CanDelete = False
                  EditControls = <
                    item
                      ControlName = 'deDataAnimais'
                      FieldName = 'DATASTATUS'
                      FitCell = fcCellSize
                      LeaveOnEnterKey = True
                      LeaveOnUpDownKey = True
                    end
                    item
                      ControlName = 'deReExecutarAnimais'
                      FieldName = 'REEXECUTAR_EM'
                      FitCell = fcCellSize
                      LeaveOnEnterKey = True
                      LeaveOnUpDownKey = True
                    end>
                  RowsHeight = 16
                  TitleRowHeight = 17
                  Columns = <
                    item
                      Expanded = False
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'BRINCO'
                      ReadOnly = True
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOMEESTABULO'
                      ReadOnly = True
                      Width = 118
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DATAPREVISTA'
                      ReadOnly = True
                      Width = 74
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCR_STATUS'
                      Width = 141
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DATASTATUS'
                      Title.Caption = 'Data'
                      Width = 103
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'REEXECUTAR_EM'
                      Width = 106
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'OBS'
                      ReadOnly = True
                      Visible = True
                    end>
                end
                object deDataAnimais: TTcDBDateEdit
                  Left = 548
                  Top = 152
                  Width = 121
                  Height = 21
                  Checked = False
                  DataField = 'DATASTATUS'
                  DataSource = dtsAnimaisTarefa
                  CheckOnExit = False
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  Visible = False
                end
                object deReExecutarAnimais: TTcDBDateEdit
                  Left = 548
                  Top = 179
                  Width = 121
                  Height = 21
                  Checked = False
                  DataField = 'REEXECUTAR_EM'
                  DataSource = dtsAnimaisTarefa
                  CheckOnExit = False
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  Visible = False
                end
              end
            end
          end
        end
        object tbsFuncionario: TTabSheet
          Caption = 'tbsFuncionario'
          ImageIndex = 3
          object GroupBox5: TGroupBox
            Left = 0
            Top = 0
            Width = 746
            Height = 57
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label9: TLabel
              Left = 234
              Top = 14
              Width = 27
              Height = 13
              Caption = 'Data'
            end
            object Label23: TLabel
              Left = 10
              Top = 14
              Width = 65
              Height = 13
              Caption = 'Funcion'#31#31#225'rio'
              FocusControl = DBLookupComboBox1
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 85
              Top = 16
              Width = 136
              Height = 21
              DataField = 'NOMEFUNCIONARIO'
              DataSource = dtsTmp
              TabOrder = 0
              OnKeyDown = dblcTarefaColetivoKeyDown
            end
            object JvDBDateEdit3: TTcDBDateEdit
              Left = 269
              Top = 16
              Width = 121
              Height = 21
              Checked = False
              DataField = 'DATA'
              DataSource = dtsTmp
              CheckOnExit = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object btbSelectAllFuncionario: TTcGDIButton
              Left = 413
              Top = 11
              Width = 155
              Height = 31
              Caption = 'selecionar todos como :'
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
                424DF60600000000000036000000280000001800000018000000010018000000
                0000C0060000C40E0000C40E00000000000000000000FEFEFEF8F8F8F2F2F2ED
                EDEDE9E9E9E5E5E5E1E1E1E1E1E1E0E0E0DBDBDBD9D9D9D9D9D9D8D8D8D9D9D9
                DADADAE1E1E1E1E1E1E0E0E0E6E6E6E9E9E9EDEDEDF2F2F2F8F8F8FEFEFEF2F2
                F2CCCCCCBDBDBDB6B6B6B2B2B2ACACACACACACA9A9A9A7A7A7A7A7A7A7A7A7A7
                A7A7A6A6A6A7A7A7A7A7A7A7A7A7A9A9A9ABABABADADADB2B2B2B5B5B5BEBEBE
                CCCCCCF1F1F1FFFFFFFFFFFFEDEDEDD9D9D9D7D7D7D5D5D5D6D6D6D2D2D2D1D1
                D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D2D2D2D6D6D6D5D5D5D7
                D7D7D9D9D9E7E7E7FFFFFFFFFFFFFFFFFFF2F2F2BEBEBEBDBDBDBDBDBDBDBDBD
                BDBDBDBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
                BEBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDE9E9E9FFFFFFFFFFFFE4E4E4BFBFBFBF
                BFBFBFBFBFC0C0C0BFBFBFBFBFBFC0C0C0BFBFBFBFBFBFBFBFBFC0C0C0BFBFBF
                C0C0C0BFBFBFBFBFBFC0C0C0BFBFBFBFBFBFC0C0C0BFBFBFDADADAFFFFFFFFFF
                FFE5E5E5C1C1C1C1C1C1C2C2C2C2C2C2C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1
                C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1
                DCDCDCFFFFFFFFFFFFE6E6E6C3C3C3BFBFBFACACACADADADB8B8B8C4C4C4C2C2
                C2BEBEBEBEBEBEBEBEBEBFBFBFBEBEBEBFBFBFBEBEBEBEBEBEBFBFBFBEBEBEBE
                BEBEC2C2C2C3C3C3DDDDDDFFFFFFFFFFFFE7E7E7C6C6C6B1B1B1C5C5C5C5C5C5
                B0B0B0C8C8C8B1B1B1A0A0A0A2A2A2A2A2A2A1A1A1A2A2A2A1A1A1A2A2A2A2A2
                A2A1A1A1A2A2A2A1A1A1AFAFAFC6C6C6DFDFDFFFFFFFFFFFFFE8E8E8C7C7C7BC
                BCBCBABABABCBCBCB6B6B6C8C8C8C6C6C6C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2
                C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C6C6C6C7C7C7E0E0E0FFFFFFFFFF
                FFEAEAEAC9C9C9C9C9C9C9C9C9C9C9C9CACACAC9C9C9C9C9C9C9C9C9C9C9C9C9
                C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9
                E2E2E2FFFFFFFFFFFFEAEAEACBCBCBCCCCCCCECECECCCCCCCECECECBCBCBCCCC
                CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCBCBCBCBCBCBCB
                CBCBCBCBCBCBCBCBE2E2E2FFFFFFFFFFFFEBEBEBCDCDCDBEBEBEA2A2A2A6A6A6
                B2B2B2CFCFCFC0C0C0B3B3B3B4B4B4B4B4B4B5B5B5B4B4B4B5B5B5B3B3B3C0C0
                C0CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCE4E4E4FFFFFFFFFFFFECECECCECECEB7
                B7B7D2D2D2D2D2D2B9B9B9D0D0D0B9B9B9A6A6A6A8A8A8A8A8A8A7A7A7A8A8A8
                A7A7A7A6A6A6BABABACECECECCCCCCCCCCCCCCCCCCCCCCCCE5E5E5FFFFFFFFFF
                FFEDEDEDCFCFCFCACACAB8B8B8BABABAC2C2C2D3D3D1D2D2D1D2D2D2D2D2D2D2
                D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0D0CFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
                E6E6E6FFFFFFFFFFFFEDEDEDD0D0D0D0D0D0D3D5D7D3D5D8D9D9D5ADADC1CBCB
                CDD1D1D0CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFD0
                D0D0D0D0D0D0D0D0E7E7E7FFFFFFFFFFFFEEEEEED1D1D1D3D4D6B5A98EC0B189
                BCBABE00008244449EE9E9DBD6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
                D6D6D6D6D6D6D6D1D1D1D1D1D1D1D1D1E7E7E7FFFFFFFFFFFFEFEFEFD3D4D6B9
                B2A8B5882275594D0000864848B103039268689BAFAFA5A3A3A3A4A4A4A3A3A3
                A4A4A4A3A3A3A3A3A3A4A4A4A0A0A0C7C7C7D2D2D2D2D2D2E8E8E8FFFFFFFFFF
                FFEFEFEFD4D5D6BCB7ADD1A6555E52971112ABC7C7D36161BA0202938B8BAEC9
                C9C0BBBBBBBCBCBCBBBBBBBCBCBCBCBCBCBBBBBBBABABACDCDCDD3D3D3D3D3D3
                E9E9E9FFFFFFFFFFFFF0F0F0D4D4D4D6D7D8C0BAB0CFC8AEB3B2C6DDDDD6D1D1
                D41616AA00009C8585C2DADAD7D6D6D6D6D6D6D5D5D5D5D5D5D6D6D6D5D5D5D4
                D4D4D4D4D4D4D4D4EAEAEAFFFFFFFFFFFFF0F0F0D3D3D3D5D5D5D6D7D8D4D5D7
                D8D8D6D5D5D5DCDCD49D9DCF0C0CAB0000A3D5D5D3D6D6D5D3D3D3D5D5D5D5D5
                D5D3D3D3D5D5D5D5D5D5D3D3D3D5D5D5E9E9E9FFFFFFFFFFFFF2F2F2D5D5D5D3
                D3D3D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4E1E1D67E7ECE0202B1E8E8D7D4D4D4
                D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D3D3D3EDEDEDFFFFFFFFFF
                FFF8F8F8E0E0E0DCDCDCDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBEBEBDD82
                82CFD6D6DBDCDCDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDCDCDCE0E0E0
                F3F3F3FFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F2F2F2F2F2F2F2F2F2F2F2F2F2F2
                F2F2F2F2F2F2F2F6F6F3F3F3F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
                F2F2F1F1F1F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              TabOrder = 3
              OnClick = btbSelectAllFuncionarioClick
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
              Enabled = False
            end
            object dblcStatusTarefasFuncionario: TDBLookupComboBox
              Left = 579
              Top = 16
              Width = 117
              Height = 21
              DataField = 'DESCR_STATUS'
              DataSource = dtsTmp
              Enabled = False
              TabOrder = 2
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 57
            Width = 746
            Height = 319
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel5'
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 746
              Height = 319
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel7'
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object Panel13: TPanel
                Left = 0
                Top = 0
                Width = 746
                Height = 21
                Align = alTop
                BevelOuter = bvNone
                Caption = ' '
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object Label24: TLabel
                  Left = 5
                  Top = 3
                  Width = 60
                  Height = 13
                  Caption = 'Animais :'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
              object Panel14: TPanel
                Left = 0
                Top = 21
                Width = 746
                Height = 298
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alClient
                BorderWidth = 1
                Caption = ' '
                Color = clSilver
                ParentBackground = False
                TabOrder = 1
                object dbgTarefasFuncionarios: TJvDBUltimGrid
                  Left = 2
                  Top = 2
                  Width = 742
                  Height = 294
                  TabStop = False
                  Align = alClient
                  DataSource = dtsTarefasFuncionario
                  Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = dbgDrawColumnCell
                  OnKeyDown = dbgKeyDown
                  OnKeyPress = dbgKeyPress
                  AutoAppend = False
                  OnShowEditor = dbgShowEditor
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  CanDelete = False
                  EditControls = <
                    item
                      ControlName = 'deDataFuncionario'
                      FieldName = 'DATASTATUS'
                      FitCell = fcCellSize
                      LeaveOnEnterKey = True
                      LeaveOnUpDownKey = True
                    end
                    item
                      ControlName = 'deReExecutarFuncionario'
                      FieldName = 'REEXECUTAR_EM'
                      FitCell = fcCellSize
                      LeaveOnEnterKey = True
                      LeaveOnUpDownKey = True
                    end>
                  RowsHeight = 16
                  TitleRowHeight = 17
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'BRINCO'
                      ReadOnly = True
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOMEESTABULO'
                      ReadOnly = True
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOME'
                      ReadOnly = True
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DATAPREVISTA'
                      ReadOnly = True
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCR_STATUS'
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DATASTATUS'
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOMEFUNCIONARIO'
                      ReadOnly = True
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'REEXECUTAR_EM'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'OBS'
                      ReadOnly = True
                      Visible = True
                    end>
                end
                object deDataFuncionario: TTcDBDateEdit
                  Left = 548
                  Top = 152
                  Width = 121
                  Height = 21
                  Checked = False
                  DataField = 'DATASTATUS'
                  DataSource = dtsTarefasFuncionario
                  CheckOnExit = False
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  Visible = False
                end
                object deReExecutarFuncionario: TTcDBDateEdit
                  Left = 548
                  Top = 184
                  Width = 121
                  Height = 21
                  Checked = False
                  DataField = 'REEXECUTAR_EM'
                  DataSource = dtsTarefasFuncionario
                  CheckOnExit = False
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  Visible = False
                end
              end
            end
          end
        end
      end
      object pnlLegenda: TPanel
        Left = 0
        Top = 399
        Width = 746
        Height = 26
        Align = alBottom
        Caption = ' '
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object Image1: TImage
          Left = 8
          Top = 6
          Width = 17
          Height = 14
          AutoSize = True
          Picture.Data = {
            07544269746D61700E030000424D0E0300000000000036000000280000001100
            00000E0000000100180000000000D80200000000000000000000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF90DBFF00003A00
            0000000000000000000000000000000000000000000000000000000000000000
            3A0000FFDB90FFFFFF00DBFFFF003A90903A00FFFFDBFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBFFFF003A90903A00FFFFDB00DBFF
            FF003A90903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
            FFFFFFFFFFDBFFFF003A90903A00FFFFDB00FFFFFF3A90DB000000FFB666FFFF
            FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF66B6FF000000DB
            903AFFFFFF00FFFFFFDBFFFF003A90903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFDBFFFF003A90903A00FFFFDBFFFFFF00FFFFFFFFFFFF
            90DBFF00003AFFB666FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF66B6
            FF3A0000FFDB90FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF0066B6660000FFFFB6
            FFFFFFFFFFFF000000FFFFFFFFFFFFB6FFFF000066B66600FFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFB6FFFF000066DB903AFFFFFFFFFFFF000000FFFFFF
            FFFFFF3A90DB660000FFFFB6FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFF3A90DB660000FFFFB6FFFFFF000000FFFFFFB6FFFF000066DB903AFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFDBFFFF003A90B66600FF
            FFFF000000FFFFFF0066B6903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF90DBFF3A003AFFDB90FFFFFF90DBFF3A003AFF
            DB90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF0066B6903A00DBFFDB003A90B66600FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBFFFF003A900000
            00903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          Transparent = True
        end
        object Label11: TLabel
          Left = 32
          Top = 6
          Width = 113
          Height = 13
          Caption = '- Tarefas em atraso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actNext: TAction
      OnUpdate = _actNextUpdate
    end
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object dtsAnimaisTarefa: TDataSource
    DataSet = Zoo_SanidadeBaixarTarefasDatamodule.cdsAnimaisTarefa
    Left = 677
    Top = 73
  end
  object dtsTarefasAnimal: TDataSource
    DataSet = Zoo_SanidadeBaixarTarefasDatamodule.cdsTarefasAnimal
    Left = 677
    Top = 141
  end
  object dtsTmp: TDataSource
    DataSet = Zoo_SanidadeBaixarTarefasDatamodule.cdsTmp
    Left = 40
    Top = 40
  end
  object dtsTarefasFuncionario: TDataSource
    DataSet = Zoo_SanidadeBaixarTarefasDatamodule.cdsTarefasFuncionario
    OnDataChange = dtsTarefasFuncionarioDataChange
    Left = 677
    Top = 184
  end
end
