inherited Zoo_RelatorioRastreamento: TZoo_RelatorioRastreamento
  Left = 420
  Top = 124
  Caption = 'Relat'#243'rio - Rastreamento'
  ClientHeight = 677
  ClientWidth = 617
  ExplicitWidth = 623
  ExplicitHeight = 706
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 617
    Height = 677
    ExplicitWidth = 617
    ExplicitHeight = 677
    inherited _pnlFooter: TJvPanel
      Top = 646
      Width = 613
      ExplicitTop = 646
      ExplicitWidth = 613
      inherited _imageBottom: TImage
        Width = 613
        ExplicitWidth = 726
      end
      inherited _btbPrior: TTcGDIButton
        Left = 422
        ExplicitLeft = 422
      end
      inherited _btbNext: TTcGDIButton
        Left = 513
        ExplicitLeft = 513
      end
      inherited _btbExecute: TTcGDIButton
        Left = 528
        Caption = 'V&isualizar'
        ExplicitLeft = 528
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 613
      Height = 644
      ExplicitWidth = 613
      ExplicitHeight = 644
      inherited PageControl: TJvPageControl
        Width = 613
        Height = 644
        ActivePage = TabSheet1
        ExplicitWidth = 613
        ExplicitHeight = 644
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnRelatorios: TPanel
            Left = 0
            Top = 0
            Width = 613
            Height = 68
            Align = alTop
            BevelInner = bvLowered
            ParentColor = True
            TabOrder = 0
            object Label3: TLabel
              Left = 26
              Top = 17
              Width = 98
              Height = 13
              Caption = 'Selecionar Relat'#243'rio '
            end
            object btnSalvarRelatorio: TTcGDIButton
              Left = 386
              Top = 41
              Width = 69
              Height = 21
              Caption = '&Salvar...'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 0
              OnClick = btnSalvarRelatorioClick
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
            object btnDelete: TTcGDIButton
              Left = 467
              Top = 41
              Width = 69
              Height = 21
              Caption = '&Excluir'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 1
              OnClick = btnDeleteClick
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
            object dblcRastreamento: TDBLookupComboBox
              Left = 128
              Top = 14
              Width = 408
              Height = 21
              KeyField = 'KZOO_RASTREAMENTO'
              ListField = 'NOME'
              ListSource = dtsRelatorios
              ParentColor = True
              TabOrder = 2
              OnCloseUp = dblcRastreamentoCloseUp
              OnEnter = dblcRastreamentoEnter
              OnKeyDown = dblcRastreamentoKeyDown
            end
          end
          object ScrollBox1: TScrollBox
            Left = 0
            Top = 68
            Width = 613
            Height = 553
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 1
            object GroupBox2: TGroupBox
              Left = 232
              Top = 4
              Width = 364
              Height = 73
              Caption = ' Categorias '
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 1
              object cbCategoriaCondicao: TComboBox
                Left = 152
                Top = 43
                Width = 131
                Height = 21
                AutoComplete = False
                AutoDropDown = True
                Style = csDropDownList
                ItemIndex = 1
                ParentColor = True
                TabOrder = 0
                Text = '>= - Maior ou igual a'
                Items.Strings = (
                  '>    - Maior que'
                  '>= - Maior ou igual a'
                  '<    - Menor que'
                  '<= - Menor ou igual a'
                  '=    - Igual a '
                  '<> - Diferente de')
              end
              object seCategoriaValor: TJvSpinEdit
                Left = 305
                Top = 43
                Width = 43
                Height = 21
                MaxValue = 10.000000000000000000
                MinValue = 1.000000000000000000
                Value = 1.000000000000000000
                MaxLength = 2
                TabOrder = 1
              end
              object rbCategoriaNovilhas: TCheckBox
                Left = 16
                Top = 19
                Width = 113
                Height = 17
                Caption = 'Novilhas'
                TabOrder = 2
              end
              object rbCategoriaVacas: TCheckBox
                Left = 16
                Top = 45
                Width = 130
                Height = 17
                Caption = 'Vacas com lacta'#231#245'es '
                Checked = True
                State = cbChecked
                TabOrder = 3
                OnClick = rbCategoriaVacasClick
              end
            end
            object GroupBox3: TGroupBox
              Left = 11
              Top = 81
              Width = 585
              Height = 94
              Caption = ' Data refer'#234'ncia '
              TabOrder = 2
              object rbDataPeriodo: TRadioButton
                Left = 13
                Top = 19
                Width = 137
                Height = 17
                Caption = 'Per'#237'odo espec'#237'fico'
                Checked = True
                TabOrder = 0
                TabStop = True
                OnClick = rbDataReferenciaClick
              end
              object rbDataRelativa: TRadioButton
                Left = 200
                Top = 19
                Width = 161
                Height = 17
                Caption = 'Per'#237'odo relativo a data atual'
                TabOrder = 1
                OnClick = rbDataReferenciaClick
              end
              object rbDataUltimaPesagem: TRadioButton
                Left = 388
                Top = 19
                Width = 185
                Height = 17
                Caption = 'Per'#237'odo relativo a '#250'ltima pesagem'
                TabOrder = 2
                OnClick = rbDataReferenciaClick
              end
              object GroupBox6: TGroupBox
                Left = 2
                Top = 43
                Width = 581
                Height = 49
                Align = alBottom
                Caption = ' Especificar o per'#237'odo '
                TabOrder = 3
                object Label1: TLabel
                  Left = 116
                  Top = 22
                  Width = 6
                  Height = 13
                  Caption = 'a'
                end
                object seDiasDataRelativa: TJvSpinEdit
                  Left = 364
                  Top = 19
                  Width = 55
                  Height = 21
                  MaxValue = 999.000000000000000000
                  MinValue = 1.000000000000000000
                  Value = 1.000000000000000000
                  MaxLength = 3
                  TabOrder = 0
                  OnChange = seDiasDataRelativaChange
                end
                object cbTipoDataRelativa: TComboBox
                  Left = 430
                  Top = 19
                  Width = 102
                  Height = 21
                  AutoComplete = False
                  AutoDropDown = True
                  Style = csDropDownList
                  ParentColor = True
                  TabOrder = 1
                  OnChange = cbTipoDataRelativaChange
                  Items.Strings = (
                    'Dias'
                    'Semanas'
                    'Meses')
                end
                object deDataInicial: TTcDateEdit
                  Left = 11
                  Top = 19
                  Width = 88
                  Height = 21
                  Checked = False
                  CheckOnExit = False
                  TabOrder = 2
                end
                object deDataFinal: TTcDateEdit
                  Left = 139
                  Top = 19
                  Width = 87
                  Height = 21
                  Checked = False
                  CheckOnExit = False
                  TabOrder = 3
                end
              end
            end
            object GroupBox5: TGroupBox
              Left = 11
              Top = 232
              Width = 585
              Height = 295
              Caption = ' Filtros Rastreamento '
              TabOrder = 4
              object Panel3: TPanel
                Left = 2
                Top = 15
                Width = 581
                Height = 25
                Align = alTop
                BevelOuter = bvNone
                ParentColor = True
                TabOrder = 0
                object cbFiltroRepeteAnimal: TCheckBox
                  Left = 11
                  Top = 1
                  Width = 162
                  Height = 17
                  Caption = 'Repetir animal na contagem'
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                end
              end
              object Panel4: TPanel
                Left = 2
                Top = 40
                Width = 581
                Height = 253
                Align = alClient
                BevelOuter = bvNone
                ParentColor = True
                TabOrder = 1
                object Panel5: TPanel
                  Left = 216
                  Top = 0
                  Width = 148
                  Height = 253
                  Align = alLeft
                  BevelOuter = bvNone
                  ParentColor = True
                  TabOrder = 1
                  object Button3: TTcGDIButton
                    Left = 10
                    Top = 91
                    Width = 127
                    Height = 25
                    Caption = 'Adiciona todas >>'
                    NotesFont.Charset = DEFAULT_CHARSET
                    NotesFont.Color = clWindowText
                    NotesFont.Height = -11
                    NotesFont.Name = 'Tahoma'
                    NotesFont.Style = []
                    TabOrder = 0
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
                  object Button4: TTcGDIButton
                    Left = 10
                    Top = 24
                    Width = 127
                    Height = 25
                    Caption = 'Adiciona selecionada >'
                    NotesFont.Charset = DEFAULT_CHARSET
                    NotesFont.Color = clWindowText
                    NotesFont.Height = -11
                    NotesFont.Name = 'Tahoma'
                    NotesFont.Style = []
                    TabOrder = 1
                    OnClick = Button4Click
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
                  object Button2: TTcGDIButton
                    Left = 10
                    Top = 186
                    Width = 127
                    Height = 25
                    Caption = '< Remove selecionada'
                    NotesFont.Charset = DEFAULT_CHARSET
                    NotesFont.Color = clWindowText
                    NotesFont.Height = -11
                    NotesFont.Name = 'Tahoma'
                    NotesFont.Style = []
                    TabOrder = 2
                    OnClick = Button2Click
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
                    Left = 10
                    Top = 124
                    Width = 127
                    Height = 25
                    Caption = '<< Remove todas'
                    NotesFont.Charset = DEFAULT_CHARSET
                    NotesFont.Color = clWindowText
                    NotesFont.Height = -11
                    NotesFont.Name = 'Tahoma'
                    NotesFont.Style = []
                    TabOrder = 3
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
                object Panel7: TPanel
                  Left = 0
                  Top = 0
                  Width = 216
                  Height = 253
                  Align = alLeft
                  BevelOuter = bvNone
                  TabOrder = 0
                  object dbgAtividades: TJvDBUltimGrid
                    Left = 0
                    Top = 0
                    Width = 216
                    Height = 253
                    Align = alClient
                    DataSource = dtsAtividades
                    DrawingStyle = gdsClassic
                    ReadOnly = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    AutoAppend = False
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'TIPO'
                        Title.Caption = 'Tipo'
                        Visible = False
                      end
                      item
                        ButtonStyle = cbsNone
                        Expanded = False
                        FieldName = 'NOME'
                        ReadOnly = False
                        Title.Alignment = taCenter
                        Title.Caption = 'Dispon'#237'veis'
                        Width = 180
                        Visible = True
                      end>
                  end
                end
                object Panel8: TPanel
                  Left = 364
                  Top = 0
                  Width = 217
                  Height = 253
                  Align = alLeft
                  BevelOuter = bvNone
                  TabOrder = 2
                  object dbgSelecionadas: TJvDBUltimGrid
                    Left = 0
                    Top = 0
                    Width = 217
                    Height = 253
                    Align = alClient
                    DataSource = dtsSelecionados
                    DrawingStyle = gdsClassic
                    ReadOnly = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    AutoAppend = False
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'NOME'
                        Title.Alignment = taCenter
                        Title.Caption = 'Selecionados'
                        Width = 180
                        Visible = True
                      end>
                  end
                end
              end
            end
            object rgStatusAnimal: TRadioGroup
              Left = 11
              Top = 178
              Width = 585
              Height = 44
              Caption = ' Status'
              Columns = 4
              Items.Strings = (
                'Todos'
                'Prenhe'
                'Coberta'
                'Vazia')
              TabOrder = 3
              OnClick = rgStatusAnimalClick
            end
            object rgTipoRelatorio: TRadioGroup
              Left = 11
              Top = 4
              Width = 201
              Height = 73
              Caption = ' Tipo relat'#243'rio'
              Items.Strings = (
                'Mensal'
                'Dias em lacta'#231#227'o')
              TabOrder = 0
              OnClick = rgTipoRelatorioClick
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel6: TPanel
            Left = 0
            Top = 539
            Width = 613
            Height = 82
            Align = alBottom
            ParentColor = True
            TabOrder = 0
            object Label2: TLabel
              Left = 8
              Top = 5
              Width = 88
              Height = 13
              Caption = '** M'#234's incompleto'
            end
            object Label4: TLabel
              Left = 8
              Top = 24
              Width = 85
              Height = 13
              Caption = 'Tipo de relat'#243'rio :'
            end
            object lbTiporelatorio: TLabel
              Left = 99
              Top = 24
              Width = 83
              Height = 13
              Caption = 'lbTiporelatorio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 36
              Top = 43
              Width = 57
              Height = 13
              Caption = 'Categoria  :'
            end
            object lbCategoria: TLabel
              Left = 99
              Top = 43
              Width = 65
              Height = 13
              Caption = 'lbCategoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 11
              Top = 61
              Width = 82
              Height = 13
              Caption = 'Data refer'#234'ncia :'
            end
            object lbDataRelativa: TLabel
              Left = 99
              Top = 61
              Width = 84
              Height = 13
              Caption = 'lbDataRelativa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 444
              Top = 24
              Width = 38
              Height = 13
              Caption = 'Status :'
            end
            object lbStatus: TLabel
              Left = 485
              Top = 24
              Width = 47
              Height = 13
              Caption = 'lbStatus'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 342
              Top = 43
              Width = 140
              Height = 13
              Caption = 'Repete animal na contagem :'
            end
            object lbRepete: TLabel
              Left = 485
              Top = 43
              Width = 51
              Height = 13
              Caption = 'lbRepete'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object Memo1: TMemo
            Left = 0
            Top = 314
            Width = 613
            Height = 225
            Align = alBottom
            Lines.Strings = (
              'Memo1')
            TabOrder = 1
            Visible = False
          end
          object dbgRelatorioRastreamento: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 613
            Height = 314
            Align = alClient
            DataSource = dtsRelatorioRastreamento
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = dbgRelatorioRastreamentoDblClick
            OnMouseUp = dbgRelatorioRastreamentoMouseUp
            OnShowEditor = dbgRelatorioRastreamentoShowEditor
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
          end
        end
      end
    end
  end
  object SaveAsPanel: TTcCaptionedPanel [1]
    Left = 344
    Top = 542
    Width = 256
    Height = 101
    Caption = 'Salvar ...'
    BevelInner = bvLowered
    Color = clWhite
    Constraints.MinHeight = 27
    ParentBackground = False
    TabOrder = 1
    Visible = False
    DesignSize = (
      256
      101)
    object btbPanelSaveOk: TTcGDIButton
      Left = 198
      Top = 72
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
      Left = 226
      Top = 72
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
        000033333F333333333333000000333377F333333333330000003337337F3333
        33333300000033733337F333333333000000373333337F333333330000007F33
        7F3337F33333330000007F3737F337F33333330000007F73337F337F33333300
        000037333337F337F33333000000333333337F337F33330000003333333337F3
        37F33300000033333333337F337F33000000333333333337F337F30000003333
        333333337F37F300000033333333333337F73300000033333333333333733300
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
      Left = 24
      Top = 46
      Width = 227
      Height = 21
      Anchors = [akLeft, akTop, akRight]
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
    inherited _actNext: TAction
      OnUpdate = _actNextUpdate
    end
  end
  object dtsRelatorioRastreamento: TDataSource
    Left = 474
    Top = 4
  end
  object dtsAtividades: TDataSource
    Left = 165
    Top = 422
  end
  object dtsSelecionados: TDataSource
    Left = 525
    Top = 422
  end
  object dtsRelatorios: TDataSource
    Left = 266
    Top = 52
  end
  object PopuperSaveAs: TTcControlPopuper
    Control = SaveAsPanel
    PopupStyle = cpsModal
    EscKeyAction = 2
    Left = 467
    Top = 591
  end
end
