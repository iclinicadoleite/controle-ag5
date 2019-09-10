inherited Zoo_ProducaoAnaliseLeiteWizard: TZoo_ProducaoAnaliseLeiteWizard
  Left = 258
  Top = 213
  Caption = 'An'#225'lise de Leite'
  ClientHeight = 396
  ClientWidth = 940
  ExplicitWidth = 946
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 940
    Height = 396
    ExplicitWidth = 940
    ExplicitHeight = 396
    inherited _pnlFooter: TJvPanel
      Top = 365
      Width = 936
      ExplicitTop = 365
      ExplicitWidth = 936
      inherited _imageBottom: TImage
        Width = 936
        ExplicitWidth = 936
      end
      inherited _btbPrior: TTcGDIButton
        Left = 745
        ExplicitLeft = 745
      end
      inherited _btbNext: TTcGDIButton
        Left = 836
        ExplicitLeft = 836
      end
      inherited _btbExecute: TTcGDIButton
        Left = 851
        ExplicitLeft = 851
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 936
      Height = 363
      ExplicitWidth = 936
      ExplicitHeight = 363
      inherited PageControl: TJvPageControl
        Width = 936
        Height = 363
        ActivePage = TabSheet1
        ExplicitWidth = 936
        ExplicitHeight = 363
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object pnlTeste: TPanel
            Left = 801
            Top = -75
            Width = 329
            Height = 132
            Caption = ' '
            TabOrder = 0
            object Label1: TLabel
              Left = 15
              Top = 30
              Width = 76
              Height = 13
              Caption = 'Data para teste'
            end
            object Label2: TLabel
              Left = 17
              Top = 66
              Width = 37
              Height = 13
              Caption = 'Arquivo'
            end
            object Label4: TLabel
              Left = 17
              Top = 2
              Width = 232
              Height = 13
              Caption = 'Gerador de teste - apenas com o delphi rodando'
            end
            object Button1: TTcGDIButton
              Left = 220
              Top = 98
              Width = 75
              Height = 25
              Caption = 'Gerar teste'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 0
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
            object edtFileTeste: TTcFilenameEdit
              Left = 75
              Top = 62
              Width = 220
              Height = 21
              Checked = False
              AddQuotes = False
              Filter = 'Arquivos clla (*.clla)|*.clla|Arquivos sql (*.sql)|*.sql'
              TabOrder = 1
              Text = ''
            end
            object deTeste: TTcDateEdit
              Left = 174
              Top = 27
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 2
            end
          end
          object gbDadosPadrao: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 930
            Height = 62
            Align = alTop
            Caption = 'Digita'#231#227'o de dados padr'#227'o'
            TabOrder = 1
            object lbDataPadrao: TLabel
              Left = 14
              Top = 29
              Width = 74
              Height = 13
              Caption = 'Data da an'#225'lise'
            end
            object edDataPadrao: TTcDateEdit
              Left = 105
              Top = 29
              Width = 98
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 19
              TabOrder = 0
            end
            object btSelecionarAnimais: TTcGDIButton
              Left = 216
              Top = 26
              Width = 125
              Height = 25
              Caption = 'Selecionar Animais'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 1
              OnClick = btSelecionarAnimaisClick
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
            object btImportarAnalises: TTcGDIButton
              Left = 348
              Top = 26
              Width = 125
              Height = 25
              Caption = 'Importar an'#225'lises'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 2
              OnClick = btImportarAnalisesClick
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
            object cbDigitarCCS: TCheckBox
              Left = 489
              Top = 29
              Width = 80
              Height = 17
              Caption = 'Digitar CCS'
              Checked = True
              State = cbChecked
              TabOrder = 3
              OnClick = cbDigitarCCSClick
            end
            object cbDigitarComposicao: TCheckBox
              Left = 581
              Top = 29
              Width = 120
              Height = 17
              Caption = 'Digitar Composi'#231#227'o'
              Checked = True
              State = cbChecked
              TabOrder = 4
              OnClick = cbDigitarComposicaoClick
            end
            object cbDigitarNU: TCheckBox
              Left = 704
              Top = 29
              Width = 80
              Height = 17
              Caption = 'Digitar NU'
              Checked = True
              State = cbChecked
              TabOrder = 5
              OnClick = cbDigitarNUClick
            end
          end
          object pnlImportarArquivo: TPanel
            Left = 550
            Top = 3
            Width = 411
            Height = 120
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            Visible = False
            object Label3: TLabel
              Left = 32
              Top = 27
              Width = 37
              Height = 13
              Caption = 'Arquivo'
            end
            object edFileName: TTcFilenameEdit
              Left = 80
              Top = 27
              Width = 313
              Height = 21
              Checked = False
              AddQuotes = False
              Filter = 
                'Arquivos de an'#225'lise (*.cdla ; *.sql ; *.xls*)|*.cdla;*.sql;*.xls' +
                '*|Arquivo de an'#225'lise (*.cdla )|*.cdla|Arquivo de an'#225'lise (*.sql)' +
                '|*.sql|Arquivo de an'#225'lise (*.xls)|*.xls*'
              TabOrder = 0
              Text = ''
            end
            object TcGDIButton1: TTcGDIButton
              Left = 32
              Top = 54
              Width = 142
              Height = 25
              Caption = 'Obter arquivo modelo'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 1
              OnClick = TcGDIButton1Click
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
            object btImportar: TTcGDIButton
              Left = 266
              Top = 54
              Width = 125
              Height = 25
              Caption = 'Importar'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 2
              OnClick = btImportarClick
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
          object gbDados: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 71
            Width = 930
            Height = 62
            Align = alTop
            Caption = 'Busca r'#225'pida'
            TabOrder = 3
            object pnlBrinco: TPanel
              Left = 2
              Top = 15
              Width = 148
              Height = 45
              Align = alLeft
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object lbBrinco: TLabel
                Left = 14
                Top = 11
                Width = 29
                Height = 13
                Caption = 'Brinco'
              end
              object edtBrinco: TEdit
                Left = 55
                Top = 10
                Width = 78
                Height = 21
                Hint = 'Digite o brinco e tecle enter'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                TextHint = 'Digite o brinco e tecle enter'
                OnEnter = edtBrincoEnter
                OnKeyDown = edtBrincoKeyDown
                OnKeyPress = edtBrincoKeyPress
              end
            end
            object pnlCCS: TPanel
              Left = 150
              Top = 15
              Width = 103
              Height = 45
              Align = alLeft
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object lbCCS: TLabel
                Left = 3
                Top = 11
                Width = 20
                Height = 13
                Caption = 'CCS'
              end
              object edCCS: TTcDBCalcEdit
                Left = 35
                Top = 10
                Width = 56
                Height = 21
                Checked = False
                DecimalPlaces = 0
                DisplayFormat = '#,##0;;'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ShowButton = False
                TabOrder = 0
                ZeroEmpty = False
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edCCSKeyPress
                DataField = 'CCS'
                DataSource = dtsAnalises
                EmptyIsNull = True
              end
            end
            object pnlComposicao: TPanel
              Left = 253
              Top = 15
              Width = 500
              Height = 45
              Align = alLeft
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 2
              object lbGordura: TLabel
                Left = 2
                Top = 11
                Width = 39
                Height = 13
                Caption = 'Gordura'
              end
              object lbProteina: TLabel
                Left = 117
                Top = 11
                Width = 40
                Height = 13
                Caption = 'Prote'#237'na'
              end
              object lbLactose: TLabel
                Left = 238
                Top = 11
                Width = 37
                Height = 13
                Caption = 'Lactose'
              end
              object lbSolidosTotais: TLabel
                Left = 354
                Top = 11
                Width = 65
                Height = 13
                Caption = 'S'#243'lidos Totais'
              end
              object edGordura: TTcDBCalcEdit
                Left = 47
                Top = 10
                Width = 56
                Height = 21
                Checked = False
                DisplayFormat = '0.00;;'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ShowButton = False
                TabOrder = 0
                ZeroEmpty = False
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edGorduraKeyPress
                DataField = 'GORDURA'
                DataSource = dtsAnalises
                EmptyIsNull = True
              end
              object edProteina: TTcDBCalcEdit
                Left = 169
                Top = 10
                Width = 56
                Height = 21
                Checked = False
                DisplayFormat = '0.00;;'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ShowButton = False
                TabOrder = 1
                ZeroEmpty = False
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edProteinaKeyPress
                DataField = 'PROTEINA'
                DataSource = dtsAnalises
                EmptyIsNull = True
              end
              object edLactose: TTcDBCalcEdit
                Left = 284
                Top = 10
                Width = 56
                Height = 21
                Checked = False
                DisplayFormat = '0.00;; '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ShowButton = False
                TabOrder = 2
                ZeroEmpty = False
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edLactoseKeyPress
                DataField = 'LACTOSE'
                DataSource = dtsAnalises
                EmptyIsNull = True
              end
              object edSolidosTotais: TTcDBCalcEdit
                Left = 429
                Top = 10
                Width = 56
                Height = 21
                Checked = False
                DisplayFormat = '0.00;;'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ShowButton = False
                TabOrder = 3
                ZeroEmpty = False
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edSolidosTotaisKeyPress
                DataField = 'SOLIDOS_TOTAIS'
                DataSource = dtsAnalises
                EmptyIsNull = True
              end
            end
            object pnlNU: TPanel
              Left = 753
              Top = 15
              Width = 97
              Height = 45
              Align = alLeft
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 3
              object lbNU: TLabel
                Left = 6
                Top = 11
                Width = 14
                Height = 13
                Caption = 'NU'
              end
              object edNU: TTcDBCalcEdit
                Left = 32
                Top = 10
                Width = 56
                Height = 21
                Checked = False
                DisplayFormat = '0.0;;'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ShowButton = False
                TabOrder = 0
                ZeroEmpty = False
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edNUKeyPress
                DataField = 'UREIA'
                DataSource = dtsAnalises
                EmptyIsNull = True
              end
            end
          end
          object JvDBUltimGrid3: TJvDBUltimGrid
            AlignWithMargins = True
            Left = 3
            Top = 139
            Width = 930
            Height = 198
            Align = alClient
            DataSource = dtsAnalises
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = JvDBUltimGrid3DrawColumnCell
            OnShowEditor = JvDBUltimGrid3ShowEditor
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <
              item
                ControlName = 'edCCSGrid'
                FieldName = 'CCS'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'edGorduraGrid'
                FieldName = 'GORDURA'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'edProteinaGrid'
                FieldName = 'PROTEINA'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'edLactoseGrid'
                FieldName = 'LACTOSE'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'edSolidosTotaisGrid'
                FieldName = 'SOLIDOS_TOTAIS'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'edNUGrid'
                FieldName = 'UREIA'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'DBMemo1'
                FieldName = 'OBS'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end>
            RowsHeight = 17
            TitleRowHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'KZOO_ANIMAL_ANALISE_LEITE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'KZOO_ANIMAL_FEMEA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'KZOO_LACTACAO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DATALACTACAO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DATA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'BRINCO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CCS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GORDURA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROTEINA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LACTOSE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SOLIDOS_TOTAIS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UREIA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ESD'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'OBS'
                Width = 318
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BRINCO_'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IMPORTADO'
                Visible = False
              end>
          end
          object edCCSGrid: TTcDBCalcEdit
            Left = 237
            Top = 169
            Width = 56
            Height = 21
            Checked = False
            DecimalPlaces = 0
            DisplayFormat = '#,##0;;'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowButton = False
            TabOrder = 5
            Visible = False
            ZeroEmpty = False
            DecimalPlacesAlwaysShown = False
            DataField = 'CCS'
            DataSource = dtsAnalises
            EmptyIsNull = True
          end
          object edGorduraGrid: TTcDBCalcEdit
            Left = 362
            Top = 174
            Width = 56
            Height = 21
            Checked = False
            DisplayFormat = '0.00;;'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowButton = False
            TabOrder = 6
            Visible = False
            ZeroEmpty = False
            DecimalPlacesAlwaysShown = False
            DataField = 'GORDURA'
            DataSource = dtsAnalises
            EmptyIsNull = True
          end
          object edProteinaGrid: TTcDBCalcEdit
            Left = 482
            Top = 174
            Width = 56
            Height = 21
            Checked = False
            DisplayFormat = '0.00;;'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowButton = False
            TabOrder = 7
            Visible = False
            ZeroEmpty = False
            DecimalPlacesAlwaysShown = False
            DataField = 'PROTEINA'
            DataSource = dtsAnalises
            EmptyIsNull = True
          end
          object edLactoseGrid: TTcDBCalcEdit
            Left = 601
            Top = 174
            Width = 56
            Height = 21
            Checked = False
            DisplayFormat = '0.00;; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowButton = False
            TabOrder = 8
            Visible = False
            ZeroEmpty = False
            DecimalPlacesAlwaysShown = False
            DataField = 'LACTOSE'
            DataSource = dtsAnalises
            EmptyIsNull = True
          end
          object edSolidosTotaisGrid: TTcDBCalcEdit
            Left = 745
            Top = 174
            Width = 56
            Height = 21
            Checked = False
            DisplayFormat = '0.00;;'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowButton = False
            TabOrder = 9
            Visible = False
            ZeroEmpty = False
            DecimalPlacesAlwaysShown = False
            DataField = 'SOLIDOS_TOTAIS'
            DataSource = dtsAnalises
            EmptyIsNull = True
          end
          object edNUGrid: TTcDBCalcEdit
            Left = 849
            Top = 169
            Width = 56
            Height = 21
            Checked = False
            DisplayFormat = ',0.0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowButton = False
            TabOrder = 10
            Visible = False
            ZeroEmpty = False
            DecimalPlacesAlwaysShown = False
            DataField = 'UREIA'
            DataSource = dtsAnalises
            EmptyIsNull = True
          end
          object DBMemo1: TDBMemo
            Left = 601
            Top = 213
            Width = 186
            Height = 89
            DataField = 'OBS'
            DataSource = dtsAnalises
            TabOrder = 11
            Visible = False
          end
        end
      end
    end
    object SelectRetiroPanel: TTcCaptionedPanel
      Left = -8
      Top = 238
      Width = 345
      Height = 241
      Caption = 'Selecionar animais em lacta'#231#227'o/retiro'
      BorderStyle = bsSingle
      Constraints.MinHeight = 27
      TabOrder = 2
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
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
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
  object JvSaveDialog1: TJvSaveDialog
    DefaultExt = '.xls'
    FileName = 'Modelo An'#225'lises.xlsx'
    Filter = 'modelo an'#225'lises|*.xlsx'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Salvar modelo an'#225'lises'
    ActiveStyle = asReport
    DefBtnCaption = 'Salvar'
    Height = 0
    Width = 0
    Left = 522
    Top = 144
  end
  object dtsAnalises: TDataSource
    DataSet = Zoo_ProducaoAnaliseLeiteDatamodule.cdsAnalises
    OnDataChange = dtsAnalisesDataChange
    Left = 302
    Top = 217
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
    DataSet = Zoo_ProducaoAnaliseLeiteDatamodule.cdsRetiros
    Left = 426
    Top = 197
  end
  object PopuperImportar: TTcControlPopuper
    BorderStyle = bsDialog
    BorderIcons = [biSystemMenu]
    Control = pnlImportarArquivo
    PopupStyle = cpsModal
    OnClose = PopuperImportarClose
    EnterKeyAction = enterKeyDefault
    EscKeyAction = 2
    Left = 280
    Top = 284
  end
end
