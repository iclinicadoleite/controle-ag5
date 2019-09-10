inherited Zoo_ReproducaoDiagnosticosGestacaoWizard: TZoo_ReproducaoDiagnosticosGestacaoWizard
  Left = 404
  Top = 258
  Caption = 'Diagn'#243'stico Reprodutivo'
  ClientHeight = 430
  ClientWidth = 958
  ExplicitWidth = 964
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 958
    Height = 430
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 958
    ExplicitHeight = 430
    inherited _pnlFooter: TJvPanel
      Top = 399
      Width = 954
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitTop = 399
      ExplicitWidth = 954
      inherited _imageBottom: TImage
        Width = 954
        ExplicitWidth = 746
      end
      inherited _btbPrior: TTcGDIButton
        Left = 763
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 763
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 854
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 854
      end
      inherited _btbExecute: TTcGDIButton
        Left = 870
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 870
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 954
      Height = 397
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 954
      ExplicitHeight = 397
      inherited PageControl: TJvPageControl
        Width = 954
        Height = 397
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ActivePage = tbsDiagnosticosGestacao
        ExplicitWidth = 954
        ExplicitHeight = 397
        object tbsPeriodo: TTabSheet
          Caption = 'tbsPeriodo'
          DesignSize = (
            954
            374)
          object Label3: TLabel
            Left = 48
            Top = 32
            Width = 246
            Height = 13
            Caption = 'Animais para confirmar ou reconfirmar prenhez at'#233' '
          end
          object deAte: TTcDateEdit
            Left = 306
            Top = 29
            Width = 121
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 25
            TabOrder = 0
          end
          object GroupBox1: TGroupBox
            Left = 44
            Top = 63
            Width = 513
            Height = 290
            Anchors = [akLeft, akTop, akBottom]
            Caption = 'Selecionar lotes'
            TabOrder = 1
            object JvDBUltimGrid4: TJvDBUltimGrid
              Left = 2
              Top = 47
              Width = 509
              Height = 241
              Align = alClient
              BorderStyle = bsNone
              DataSource = dsLotes
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentColor = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = JvDBUltimGrid4CellClick
              OnKeyPress = JvDBUltimGrid4KeyPress
              AutoAppend = False
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              OnCheckIfBooleanField = JvDBUltimGrid4CheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SELECTED'
                  Title.Alignment = taCenter
                  Title.Caption = 'Selecionar'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOTE'
                  Title.Caption = 'Lote'
                  Width = 379
                  Visible = True
                end>
            end
            object Panel4: TPanel
              Left = 2
              Top = 15
              Width = 509
              Height = 32
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object cbSelectAll: TCheckBox
                Left = 21
                Top = 4
                Width = 161
                Height = 17
                Caption = 'Todos os lotes'
                Checked = True
                State = cbChecked
                TabOrder = 0
                OnClick = cbSelectAllClick
              end
            end
          end
        end
        object tbsDiagnosticosGestacao: TTabSheet
          Caption = 'tbsDiagnosticosGestacao'
          object gbxEdit: TGroupBox
            Left = 0
            Top = 47
            Width = 954
            Height = 88
            Align = alTop
            Caption = 'Entrada de dados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object pnlExibirCampos: TPanel
              Left = 2
              Top = 15
              Width = 950
              Height = 22
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object cbExibeSexagem: TCheckBox
                Left = 7
                Top = 4
                Width = 134
                Height = 17
                Caption = 'Digitar sexo da cria'
                Checked = True
                State = cbChecked
                TabOrder = 0
                OnClick = cbExibeSexagemClick
              end
            end
            object pnlCamposEntrada: TPanel
              Left = 2
              Top = 37
              Width = 950
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 433
                Height = 41
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 0
                object Label2: TLabel
                  Left = 7
                  Top = 13
                  Width = 38
                  Height = 13
                  Caption = '&F'#234'mea'
                end
                object Label4: TLabel
                  Left = 163
                  Top = 13
                  Width = 139
                  Height = 13
                  Caption = 'Diagn'#243'stico de gesta'#231#227'o'
                end
                object edtBrinco: TJvDBSearchEdit
                  Left = 54
                  Top = 9
                  Width = 94
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataSource = dtsDiagnosticosGestacao
                  DataField = 'BRINCOFEMEA'
                  ClearOnEnter = False
                  TabOrder = 0
                  Text = 'edtBrinco'
                  Visible = False
                  OnEnter = edtBrincoEnter
                  OnExit = edtBrincoExit
                  OnKeyDown = edtBrincoKeyDown
                  OnKeyPress = edtBrincoKeyPress
                end
                object jvedtBrinco: TJvComboEdit
                  Left = 54
                  Top = 9
                  Width = 95
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  ButtonWidth = 15
                  ImageKind = ikEllipsis
                  TabOrder = 1
                  Text = ''
                  OnButtonClick = jvedtBrincoButtonClick
                  OnChange = jvedtBrincoChange
                  OnEnter = jvedtBrincoEnter
                  OnKeyDown = jvedtBrincoKeyDown
                  OnKeyPress = jvedtBrincoKeyPress
                end
                object cbxPrenhez: TDBComboBox
                  Left = 314
                  Top = 9
                  Width = 102
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Style = csDropDownList
                  DataField = 'NOVAPRENHEZ'
                  DataSource = dtsDiagnosticosGestacao
                  Items.Strings = (
                    ''
                    'Prenhe'
                    'N'#227'o prenhe')
                  TabOrder = 2
                  OnChange = cbxPrenhezChange
                  OnKeyDown = cbxPrenhezKeyDown
                  OnKeyPress = cbxPrenhezKeyPress
                end
              end
              object pnlReexaminar: TPanel
                Left = 433
                Top = 0
                Width = 267
                Height = 41
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alLeft
                BevelOuter = bvNone
                Caption = ' '
                ParentColor = True
                TabOrder = 1
                Visible = False
                object Label6: TLabel
                  Left = 5
                  Top = 13
                  Width = 56
                  Height = 13
                  Caption = 'Toque em'
                end
                object deDataNovoToque: TTcDBDateEdit
                  Left = 71
                  Top = 10
                  Width = 98
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Checked = False
                  DataField = 'NOVOTOQUE'
                  DataSource = dtsDiagnosticosGestacao
                  CheckOnExit = False
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ButtonWidth = 17
                  ParentFont = False
                  TabOrder = 0
                  OnKeyPress = deDataNovoToqueKeyPress
                end
                object cbxReexaminar: TJvDBCheckBox
                  Left = 183
                  Top = 10
                  Width = 90
                  Height = 19
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Reexaminar'
                  DataField = 'REEXAMINAR'
                  DataSource = dtsDiagnosticosGestacao
                  TabOrder = 1
                  ValueChecked = 'T'
                  ValueUnchecked = 'F'
                  OnKeyPress = cbxReexaminarKeyPress
                end
              end
              object pnlSexoCria: TPanel
                Left = 700
                Top = 0
                Width = 330
                Height = 41
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 2
                object Label5: TLabel
                  Left = 196
                  Top = 13
                  Width = 49
                  Height = 13
                  Caption = 'Gemelar'
                  Visible = False
                end
                object Label7: TLabel
                  Left = 15
                  Top = 13
                  Width = 72
                  Height = 13
                  Caption = 'Sexo da cria'
                end
                object cbStatusGemelar: TJvDBComboBox
                  Left = 251
                  Top = 9
                  Width = 74
                  Height = 22
                  Style = csOwnerDrawVariable
                  DataField = 'GEMELAR'
                  DataSource = dtsDiagnosticosGestacao
                  DropDownWidth = 100
                  TabOrder = 0
                  Visible = False
                  ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                  ListSettings.OutfilteredValueFont.Color = clRed
                  ListSettings.OutfilteredValueFont.Height = -11
                  ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                  ListSettings.OutfilteredValueFont.Style = []
                  ListSettings.KeyField = 'VALOR'
                  ListSettings.DisplayField = 'DESCRICAO'
                  ListSettings.DataSource = dsStatusGemelar
                end
                object dblcSexoCria: TDBLookupComboBox
                  Left = 100
                  Top = 9
                  Width = 83
                  Height = 21
                  DataField = 'SEXO_CRIA'
                  DataSource = dtsDiagnosticosGestacao
                  KeyField = 'VALOR'
                  ListField = 'DESCRICAO'
                  ListSource = dsSexoCria
                  TabOrder = 1
                  OnKeyPress = dblcSexoCriaKeyPress
                end
              end
            end
          end
          object gbxDefault: TGroupBox
            Left = 0
            Top = 0
            Width = 954
            Height = 47
            Align = alTop
            Caption = 'Digita'#231#227'o de dados comuns'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label1: TLabel
              Left = 19
              Top = 21
              Width = 81
              Height = 13
              Caption = 'Data do toque'
            end
            object lblEdPadraoFuncionario: TLabel
              Left = 221
              Top = 21
              Width = 125
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = '  Nome do veterin'#225'rio'
            end
            object ImgedPadraoVeterinario: TImage
              Left = 563
              Top = 21
              Width = 16
              Height = 16
              Cursor = crHelp
              ParentShowHint = False
              ShowHint = True
              Transparent = True
            end
            object deDataEvento: TTcDateEdit
              Left = 110
              Top = 21
              Width = 104
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 19
              TabOrder = 0
              OnAcceptDate = deDataEventoAcceptDate
              OnInvalidDate = deDataEventoInvalidDate
              OnChange = deDataEventoChange
              OnExit = deDataEventoExit
            end
            object edPadraoVeterinario: TJvComboEdit
              Left = 360
              Top = 21
              Width = 189
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ButtonWidth = 15
              ImageKind = ikEllipsis
              TabOrder = 1
              Text = ''
              OnButtonClick = edPadraoVeterinarioButtonClick
              OnChange = edPadraoVeterinarioChange
              OnKeyPress = edPadraoVeterinarioKeyPress
            end
            object CheckBox1: TCheckBox
              Left = 620
              Top = 21
              Width = 185
              Height = 17
              Caption = 'Aplicar a protocolo a todos'
              Checked = True
              State = cbChecked
              TabOrder = 2
              Visible = False
              OnClick = CheckBox1Click
            end
          end
          object pnlGrid: TPanel
            Left = 0
            Top = 135
            Width = 954
            Height = 239
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
            object JvDBUltimGrid1: TJvDBUltimGrid
              Left = 2
              Top = 2
              Width = 950
              Height = 235
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtsDiagnosticosGestacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentFont = False
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Verdana'
              TitleFont.Style = []
              OnEditButtonClick = JvDBUltimGrid1EditButtonClick
              OnEnter = JvDBUltimGrid1Enter
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
                  ControlName = 'cbgStatusGemelar'
                  FieldName = 'DESC_GEMELAR'
                  FitCell = fcCellSize
                  LeaveOnEnterKey = True
                  LeaveOnUpDownKey = True
                end
                item
                  ControlName = 'dblcgSexoCria'
                  FieldName = 'DESC_SEXO_CRIA'
                  FitCell = fcCellSize
                  LeaveOnEnterKey = True
                  LeaveOnUpDownKey = True
                end
                item
                  ControlName = 'cbxgPrenhez'
                  FieldName = 'NOVAPRENHEZ'
                  FitCell = fcCellSize
                  LeaveOnEnterKey = True
                  LeaveOnUpDownKey = True
                end
                item
                  ControlName = 'dbegDataToque'
                  FieldName = 'NOVOTOQUE'
                  FitCell = fcCellSize
                  LeaveOnEnterKey = True
                  LeaveOnUpDownKey = True
                end>
              AutoSizeRows = False
              RowsHeight = 24
              TitleRowHeight = 24
              OnCheckIfBooleanField = JvDBUltimGrid1CheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'BRINCOFEMEA'
                  ReadOnly = True
                  Width = 58
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMEFEMEA'
                  ReadOnly = True
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'LOTE'
                  ReadOnly = True
                  Title.Caption = 'Lote'
                  Width = 86
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATAEVENTO'
                  ReadOnly = True
                  Title.Caption = #218'ltima cobertura'
                  Width = 124
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_EVENTO'
                  ReadOnly = True
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'NOMEMACHO'
                  ReadOnly = True
                  Title.Caption = 'Touro/Embri'#227'o'
                  Width = 77
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_ULTIMOTOQUE'
                  ReadOnly = True
                  Width = 124
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ULTIMO_DIAGNOSTICO'
                  ReadOnly = True
                  Width = 127
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOVAPRENHEZ'
                  Width = 98
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_SEXO_CRIA'
                  Title.Caption = 'Sexo da cria'
                  Width = 135
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOVOTOQUE'
                  Title.Caption = 'Data do toque'
                  Width = 112
                  Visible = True
                end>
            end
            object cbxgPrenhez: TDBComboBox
              Left = 263
              Top = 127
              Width = 102
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Style = csDropDownList
              DataField = 'NOVAPRENHEZ'
              DataSource = dtsDiagnosticosGestacao
              Items.Strings = (
                ''
                'Prenhe'
                'N'#227'o prenhe')
              TabOrder = 0
              Visible = False
              OnChange = cbxPrenhezChange
              OnEnter = cbxgPrenhezEnter
              OnKeyDown = cbxgPrenhezKeyDown
              OnKeyPress = cbxPrenhezKeyPress
            end
            object dbegDataToque: TTcDBDateEdit
              Left = 252
              Top = 57
              Width = 113
              Height = 21
              Checked = False
              DataField = 'NOVOTOQUE'
              DataSource = dtsDiagnosticosGestacao
              CheckOnExit = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 20
              ParentFont = False
              TabOrder = 1
              Visible = False
            end
            object cbgStatusGemelar: TJvDBComboBox
              Left = 298
              Top = 176
              Width = 145
              Height = 22
              Style = csOwnerDrawVariable
              DataField = 'GEMELAR'
              DataSource = dtsDiagnosticosGestacao
              DropDownWidth = 100
              TabOrder = 3
              Visible = False
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
              ListSettings.KeyField = 'VALOR'
              ListSettings.DisplayField = 'DESCRICAO'
              ListSettings.DataSource = dsStatusGemelar
            end
            object dblcgSexoCria: TDBLookupComboBox
              Left = 528
              Top = 176
              Width = 145
              Height = 21
              DataField = 'SEXO_CRIA'
              DataSource = dtsDiagnosticosGestacao
              KeyField = 'VALOR'
              ListField = 'DESCRICAO'
              ListSource = dsSexoCria
              TabOrder = 4
              Visible = False
            end
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
  object dtsDiagnosticosGestacao: TDataSource
    DataSet = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacao
    OnDataChange = dtsDiagnosticosGestacaoDataChange
    Left = 465
    Top = 77
  end
  object dsStatusGemelar: TDataSource
    DataSet = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsStatusGemelar
    Left = 494
    Top = 184
  end
  object dsSexoCria: TDataSource
    DataSet = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsSexoCria
    Left = 594
    Top = 192
  end
  object dsLotes: TDataSource
    DataSet = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsLotes
    Left = 586
    Top = 261
  end
  object ImageList1: TImageList
    ColorDepth = cd24Bit
    Left = 824
    Top = 39
    Bitmap = {
      494C010104000800600010001000FFFFFFFF1910FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001001800000000000018
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000005A79D00008B70013B50013B60011B7
      000FB30126BA0000000000000000000000000000000000000000007FB7EA60AB
      E963ADEA63ACE963ADE962ADEA63ACE963ACE95CADE95EABE4A7D5EB00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000624400000000000000000000000000000000000000000000000000
      00000000000000000000000000005E76CB0013BB0022BA0328C3092DBD072CC4
      0026BF001EB50928BE000000000000000000000000000000248CE3007DF7007F
      F5007FF50080F50082FF0084FF0082FE0083F5007EF30082F50070EFA9D2E700
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00036B41036F4401644000000000000000000000000000000000000000000000
      00000000000000000000005D78CD001DBF3555CB8CA5DD002CBF0831C60025BB
      4D71CE808FDE0022C10834B90000000000000000000000000079E4048CF3088B
      F5088BF4078EFF1867A74022111174BE0B8DFC0A8BF5068CF50088F660ACE700
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000006E
      43127A53157B59177C5502694600000000000000000000000000000000000000
      00000000000000008C97DA0026C3002AC5FFFFFBFFFFFED5DFF10020C06480DB
      FFFFFFFFFFFE4B6ED1002FCC0E38BA00000000000000000058B2EA0190FA0F90
      F40F90F50E94F7147FCC2746571984DC0B94FB1190F50D91F50087F000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000972491F85
      5F1F866020855F21876120865E026E4A00000000000000000000000000000000
      00000000000000006A85D7043ECE043BCD7898E0FFFFFDFFFFFFDDE8F3FFFFFE
      FFFFF6EBF0F7063FCE1045CE0028C6000000000000000000000000008FEC149A
      F7159AF6149AF51599FB1A6692139EFF0F97F61198F30B97F841A9E900000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000127C552A9067298E
      68298F69228C642A906A2D8D672A916818765400000000000000000000000000
      00000000000000006C8AD70B48D61854CE003FD17D9DE5FFFFFBFFFEFAFEFFFC
      D0E1F40F47D20E4ED71356D00034C60000000000000000000000007CBFE70C9F
      F916A0F421A1FE1884CA4217011498E71BA4F81DA1F50798F100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007BB19F1F93663399733998
      741B90659CC8B51E8A62399D70339A6F31986F1F805E00000000000000000000
      00000000000000006F8EDA0C54D81C59E0054FD45A8EDEFFFFF9FFFDFEFFFFFA
      CED9EE0049D8195BD9195ADF043DC50000000000000000000000000000001B9E
      F01DAAF424ADFF297EB3351F0D2B94D824AAFB15AAF868B8EB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000007DAF9A2BA16D2798
      6CBAD5CB000000D5E3DF23936B3EA77F44A57A35A97A1E885C00000000000000
      00000000000000006F8FD91461DF115FDF7099E9FFFFFCFCFFFCF1F5FBFFFFFE
      FFFFFCE0ECF2105CDE1A6ADC0343CA0000000000000000000000000000008FC9
      E61DAFFB2BB6FF2B7BAB321E0F2989C22AB6FD0FA2EE00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008CBBABBCD8
      D0000000000000000000D1E1D62D9B744FB1874DAD864DB18328926A00000000
      00000000000000007595DC166CED0F65D9FDFFFBFFFFFCE6F0FB0C62D985B6ED
      FFFFFDFFFFFF5B97E4176EE80851D20000000000000000000000000000000000
      0022A7E22FC1FF3274983420103284B223C5FF8EC5E600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000D1E2DA31A2725BB98D50B48F52BD8D3F947200
      00000000000000000000003670D91377EE5A9AEBB6D3F32377E41F75EB0C6DE8
      7AADEEA4CCF41D72E31465E60000000000000000000000000000000000000000
      00ACD5EA28C4FE358FAB2A0A01389CC925AFF100000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C3DFD441A68161C89340A47D00000000
      00000000000000000000000000004575D91A80F11576E9287EE72B80ED2A80EA
      237CE81177EE196DEC0000000000000000000000000000000000000000000000
      000000003CB5E43ACBFF49D7FF25C8FEA7D4E400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000CADBD53FA67C00000000000000
      00000000000000000000000000000000003E77DB208CF6228DF3248CF1258BF4
      258CF61772E60000000000000000000000000000000000000000000000000000
      00000000D1E2ED2AC5EC36D9FC49BCDF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000D8E8EEA1D0E600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF80FE003FFFFFDFFF007C001FFFFF8FFE003C001FFFFF07FC001C003FFFF
      E03FC001E003FFFFC01FC001E007FFFF800FC001F007FFFFC207C001F00FFFFF
      E703C001F80FFFFFFF81E003F81FFFFFFFC3F007FC1FFFFFFFE7F80FFC3FFFFF
      FFFFFFFFFE7FFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
