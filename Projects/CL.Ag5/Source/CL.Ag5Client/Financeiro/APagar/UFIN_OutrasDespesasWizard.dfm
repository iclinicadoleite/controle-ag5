inherited FIN_OutrasDespesasWizard: TFIN_OutrasDespesasWizard
  Left = 413
  Top = 204
  Caption = 'Compras - Lan'#231'amentos Simplificados'
  ClientHeight = 712
  ClientWidth = 896
  ActionList.Left = 138
  ActionList.Top = 2
  ExplicitWidth = 912
  ExplicitHeight = 751
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Width = 896
    Height = 647
    ActivePage = _tbsFicha
    ExplicitWidth = 896
    ExplicitHeight = 647
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 888
      ExplicitHeight = 619
      inherited _pnlSearch: TPanel
        Width = 888
        Height = 72
        ExplicitWidth = 888
        ExplicitHeight = 72
        inherited _lblPesquisas: TLabel
          Left = 6
          Top = 13
          ExplicitLeft = 6
          ExplicitTop = 13
        end
        object Label13: TLabel [1]
          Left = 3
          Top = 44
          Width = 63
          Height = 13
          Caption = 'Data inicial'
        end
        object Label14: TLabel [2]
          Left = 210
          Top = 44
          Width = 55
          Height = 13
          Caption = 'Data final'
        end
        inherited _edtSearch: TJvComboEdit
          Left = 75
          Top = 10
          ExplicitLeft = 75
          ExplicitTop = 10
        end
        object chkContasPagas: TCheckBox
          Left = 503
          Top = 41
          Width = 126
          Height = 17
          Hint = 'Exibe contas pagas do per'#237'odo'
          TabStop = False
          Caption = 'Exibir contas pagas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Visible = False
          OnClick = chkContasPagasClick
        end
        object chkContasEmAtraso: TCheckBox
          Left = 648
          Top = 14
          Width = 141
          Height = 18
          Hint = 'Exibe contas em atraso de per'#237'odos anteriores'
          TabStop = False
          Caption = 'Exibir contas em atraso'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          State = cbChecked
          TabOrder = 3
          Visible = False
          OnClick = chkContasEmAtrasoClick
        end
        object chkDuvidosos: TCheckBox
          Left = 503
          Top = 15
          Width = 141
          Height = 17
          Hint = 'Exibe contas pagas do per'#237'odo'
          TabStop = False
          Caption = 'Exibir contas duvidosas'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          State = cbChecked
          TabOrder = 2
          Visible = False
          OnClick = chkDuvidososClick
        end
        object chkProvisionadas: TCheckBox
          Left = 648
          Top = 41
          Width = 160
          Height = 17
          Hint = 'Exibe contas pagas do per'#237'odo'
          Caption = 'Exibir contas provisionadas'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          State = cbChecked
          TabOrder = 6
          Visible = False
          OnClick = chkProvisionadasClick
        end
        object deDtInicial: TTcDateEdit
          Left = 75
          Top = 41
          Width = 121
          Height = 21
          Checked = False
          CheckOnExit = False
          TabOrder = 4
          OnExit = deDtInicialExit
        end
        object deDtFinal: TTcDateEdit
          Left = 271
          Top = 41
          Width = 121
          Height = 21
          Checked = False
          CheckOnExit = False
          TabOrder = 5
          OnExit = deDtFinalExit
        end
      end
      inherited _pnldbgLista: TPanel
        Top = 72
        Width = 888
        Height = 547
        ExplicitTop = 72
        ExplicitWidth = 888
        ExplicitHeight = 547
        inherited _dbgLista: TJvDBUltimGrid
          Width = 884
          Height = 543
          Constraints.MinHeight = 88
          DrawingStyle = gdsThemed
          OnGetCellParams = _dbgListaGetCellParams
          OnCheckIfBooleanField = _dbgListaCheckIfBooleanField
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 888
      ExplicitHeight = 619
      inherited _pnlFicha: TPanel
        Width = 888
        Height = 619
        Constraints.MinHeight = 173
        ExplicitWidth = 888
        ExplicitHeight = 619
        inherited _ScrollBoxFicha: TScrollBox
          Width = 888
          Height = 619
          ExplicitWidth = 888
          ExplicitHeight = 619
          inherited _pnlScroll: TPanel
            Width = 888
            Height = 619
            AutoSize = False
            ExplicitWidth = 888
            ExplicitHeight = 619
            object Label1: TLabel
              Left = 7
              Top = 42
              Width = 64
              Height = 13
              Caption = 'Fornecedor'
            end
            object Label2: TLabel
              Left = 7
              Top = 10
              Width = 56
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 548
              Top = 44
              Width = 65
              Height = 13
              Caption = 'Documento'
              FocusControl = DBEdit3
            end
            object Label4: TLabel
              Left = 548
              Top = 10
              Width = 92
              Height = 13
              Caption = 'Data de compra'
            end
            object Label6: TLabel
              Left = 548
              Top = 77
              Width = 106
              Height = 13
              Caption = 'Conta preferencial'
            end
            object Label7: TLabel
              Left = 7
              Top = 77
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Apropria'#231#227'o'
            end
            object Label10: TLabel
              Left = 12
              Top = 513
              Width = 74
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Observa'#231#245'es'
              FocusControl = DBEdit2
              ExplicitTop = 459
            end
            object Label11: TLabel
              Left = 674
              Top = 466
              Width = 79
              Height = 13
              Alignment = taRightJustify
              Anchors = [akLeft, akBottom]
              Caption = 'Total parcelas'
              ExplicitTop = 412
            end
            object DBText1: TDBText
              Left = 756
              Top = 466
              Width = 120
              Height = 13
              Alignment = taRightJustify
              Anchors = [akLeft, akBottom]
              Color = clBtnFace
              DataField = 'TOTAL'
              DataSource = dtsParcelas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              ExplicitTop = 412
            end
            object Image1: TImage
              Left = 495
              Top = 41
              Width = 16
              Height = 16
              Cursor = crHelp
              ParentShowHint = False
              ShowHint = True
            end
            object Image2: TImage
              Left = 495
              Top = 77
              Width = 16
              Height = 16
              Cursor = crHelp
              ParentShowHint = False
              ShowHint = True
            end
            object Image3: TImage
              Left = 858
              Top = 77
              Width = 16
              Height = 16
              Cursor = crHelp
              ParentShowHint = False
              ShowHint = True
            end
            object dbgParcelas: TJvDBUltimGrid
              Left = 8
              Top = 279
              Width = 874
              Height = 180
              Anchors = [akLeft, akTop, akBottom]
              DataSource = dtsParcelas
              TabOrder = 11
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'Verdana'
              TitleFont.Style = []
              OnEditButtonClick = dbgParcelasEditButtonClick
              OnKeyPress = dbgParcelasKeyPress
              OnShowEditor = dbgParcelasShowEditor
              AlternateRowColor = clBtnFace
              AutoSizeColumns = True
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <
                item
                  ControlName = 'dbDtVencimento'
                  FieldName = 'VENCTO'
                  FitCell = fcCellSize
                  LeaveOnEnterKey = True
                  LeaveOnUpDownKey = True
                end
                item
                  ControlName = 'dbedValor'
                  FieldName = 'VALOR'
                  FitCell = fcCellSize
                  LeaveOnEnterKey = True
                  LeaveOnUpDownKey = True
                end
                item
                  ControlName = 'DBMemo1'
                  FieldName = 'OBS'
                  FitCell = fcBiggest
                  LeaveOnEnterKey = True
                end>
              RowsHeight = 17
              TitleRowHeight = 17
              OnCheckIfBooleanField = dbgParcelasCheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'DOCUMENTO'
                  Width = 103
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VENCTO'
                  Width = 85
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR'
                  Width = 137
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PREVISAO'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'DUVIDOSO'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'PAGTO'
                  ReadOnly = True
                  Title.Caption = 'Dt. Pagamento'
                  Width = 220
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PAGO'
                  ReadOnly = True
                  Title.Caption = 'Vl.Pago'
                  Width = 133
                  Visible = True
                end
                item
                  ButtonStyle = cbsEllipsis
                  Expanded = False
                  FieldName = 'NOMECONTA'
                  Width = 78
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBS'
                  Width = 95
                  Visible = True
                end>
            end
            object Button2: TTcGDIButton
              Left = 350
              Top = 494
              Width = 111
              Height = 21
              Anchors = [akLeft, akBottom]
              Caption = 'Efetuar baixa'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 12
              Visible = False
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
            object DBEdit2: TDBEdit
              Left = 97
              Top = 7
              Width = 390
              Height = 21
              AutoSize = False
              DataField = 'HISTORICO'
              DataSource = dtsFicha
              TabOrder = 0
            end
            object DBEdit3: TDBEdit
              Left = 674
              Top = 41
              Width = 176
              Height = 21
              AutoSize = False
              DataField = 'DOCUMENTO'
              DataSource = dtsFicha
              TabOrder = 3
            end
            object edConta: TJvDBComboEdit
              Left = 674
              Top = 74
              Width = 176
              Height = 21
              AutoSize = False
              DataField = 'NOMECONTA'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              ButtonWidth = 15
              TabOrder = 5
              OnButtonClick = edContaButtonClick
              OnChange = edContaChange
              OnEnter = edContaEnter
              OnKeyPress = edContaKeyPress
            end
            object edEntidade: TJvDBComboEdit
              Left = 97
              Top = 39
              Width = 390
              Height = 21
              AutoSize = False
              Color = clWhite
              DataField = 'NOMEENTIDADE'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              ButtonWidth = 15
              TabOrder = 2
              OnButtonClick = edEntidadeButtonClick
              OnChange = edEntidadeChange
              OnEnter = edEntidadeEnter
              OnKeyPress = edEntidadeKeyPress
            end
            object DBMemo3: TDBMemo
              Left = 9
              Top = 533
              Width = 869
              Height = 82
              Anchors = [akLeft, akBottom]
              BevelKind = bkTile
              BorderStyle = bsNone
              DataField = 'OBS'
              DataSource = dtsFicha
              TabOrder = 15
            end
            object edNaturezaFinanceira: TJvDBComboEdit
              Left = 97
              Top = 74
              Width = 390
              Height = 21
              AutoSize = False
              DataField = 'DESCR_PC_NOME'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              ButtonWidth = 15
              TabOrder = 4
              OnButtonClick = edNaturezaFinanceiraButtonClick
              OnChange = edNaturezaFinanceiraChange
              OnEnter = edNaturezaFinanceiraEnter
              OnKeyPress = edNaturezaFinanceiraKeyPress
            end
            object gbxProgramarParcelas: TGroupBox
              Left = 7
              Top = 129
              Width = 876
              Height = 78
              Caption = ' Programar parcelas '
              TabOrder = 9
              DesignSize = (
                876
                78)
              object Label9: TLabel
                Left = 245
                Top = 21
                Width = 89
                Height = 13
                Caption = 'Dia vencimento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblTipoDespesa1: TLabel
                Left = 400
                Top = 21
                Width = 72
                Height = 13
                Caption = 'Dividido em '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblTipoDespesa2: TLabel
                Left = 527
                Top = 21
                Width = 58
                Height = 13
                Caption = 'parcela(s)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object lblTipoValorDespesa: TLabel
                Left = 7
                Top = 21
                Width = 98
                Height = 13
                Caption = 'Valor da despesa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object btbProgramar: TTcGDIButton
                Left = 747
                Top = 46
                Width = 108
                Height = 27
                Anchors = [akTop]
                Caption = 'Programar...'
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
                  424D360300000000000036000000280000001000000010000000010018000000
                  000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                  FFFFF5F5F55F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D52A2A2A000000FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F0A
                  0A0A0000000000000000000000000000000C0C0C3737379A9A9AFEFEFEFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFF9F9F9F0A0A0A0000000000000000000000000000
                  00000000000000000000434343E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5
                  D5D52A2A2A000000FFFFFFFFFFFFFFFFFFE6E6E6A6A6A61C1C1C000000434343
                  FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F55F5F5FFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFEDEDED1C1C1C0000009A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6A6A6000000
                  373737FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFE6E6E60000000C0C0CFFFFFFFFFFFF0C0C0C000000E6
                  E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF373737000000A6A6A6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A0000001C
                  1C1CEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060F5F5F5FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFEFEFE4343430000001C1C1CA6A6A6E6E6E6FFFFFFFFFF
                  FFFFFFFF0000002A2A2AD5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E743
                  43430000000000000000000000000000000000000000000000000A0A0AA0A0A0
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE9A9A9A3737370D0D0D0000000000
                  000000000000000000000A0A0AA0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000002A2A2AD5D5D5FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                TabOrder = 5
                OnClick = btbProgramarClick
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
              object cbProximoMes: TJvDBCheckBox
                Left = 612
                Top = 21
                Width = 167
                Height = 17
                Caption = 'A partir do pr'#243'ximo m'#234's '
                DataField = 'PROXIMO_MES'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                ValueChecked = 'T'
                ValueUnchecked = 'F'
              end
              object dbValorDespesa: TJvDBCalcEdit
                Left = 119
                Top = 19
                Width = 98
                Height = 21
                AutoSize = False
                DisplayFormat = ',0.00'
                ShowButton = False
                TabOrder = 0
                DecimalPlacesAlwaysShown = True
                DataField = 'VALOR'
                DataSource = dtsFicha
              end
              object edtDia: TJvDBCalcEdit
                Left = 347
                Top = 19
                Width = 36
                Height = 21
                Alignment = taCenter
                AutoSize = False
                DecimalPlaces = 0
                DisplayFormat = '0'
                MaxLength = 2
                MaxValue = 31.000000000000000000
                MinValue = 1.000000000000000000
                ShowButton = False
                TabOrder = 1
                Value = 1.000000000000000000
                ZeroEmpty = False
                DecimalPlacesAlwaysShown = False
                DataField = 'DIA_VENCTO'
                DataSource = dtsFicha
              end
              object edtMeses: TJvDBCalcEdit
                Left = 480
                Top = 19
                Width = 37
                Height = 21
                Alignment = taCenter
                AutoSize = False
                DecimalPlaces = 0
                DisplayFormat = '0'
                MaxLength = 3
                MaxValue = 999.000000000000000000
                MinValue = 1.000000000000000000
                ShowButton = False
                TabOrder = 2
                Value = 1.000000000000000000
                ZeroEmpty = False
                DecimalPlacesAlwaysShown = False
                DataField = 'NUM_PARCELAS'
                DataSource = dtsFicha
              end
              object cbAnual: TJvDBCheckBox
                Left = 800
                Top = 21
                Width = 60
                Height = 17
                Caption = 'Anual '
                DataField = 'ANUAL'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                ValueChecked = 'T'
                ValueUnchecked = 'F'
              end
            end
            object btnAdicionaParcela: TTcGDIButton
              Left = 630
              Top = 491
              Width = 120
              Height = 30
              Anchors = [akLeft, akBottom]
              Caption = 'Adiciona parcela'
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
                424D360300000000000036000000280000001000000010000000010018000000
                000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFF3535351A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
                1A1A1A1A1A1A1A1A1A1A1A1A1A353535FFFFFFFFFFFFFFFFFFFFFFFF1C1C1CFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1A
                FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFF0000000000000000000000
                00000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7F000000FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFF1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF0000000000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3535351A
                1A1A1A1A1A0000001A1A1A1A1A1A1A1A1A1A1A1A000000FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              TabOrder = 13
              OnClick = btnAdicionaParcelaClick
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
            object btnRemoveParcela: TTcGDIButton
              Left = 756
              Top = 491
              Width = 120
              Height = 30
              Anchors = [akLeft, akBottom]
              Caption = 'Remove parcela'
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
                424D360300000000000036000000280000001000000010000000010018000000
                000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                00000000000000000000FFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF000000FFFFFF
                FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                FF7F7F7FFFFFFFFFFFFF000000FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF000000FFFFFF
                FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                FF7F7F7FFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F00
                0000FFFFFF7F7F7FFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF0000007F7F7F
                FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF7F7F7FFFFFFF7F7F7FFFFF
                FF7F7F7FFFFFFFFFFFFF000000000000FFFFFFFCFDFDFFFFFF000000000000FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                000000FFFFFFFFFFFF7F7F7F0000000000000000000000000000000000000000
                000000000000000000000000000000007F7F7FFFFFFFFFFFFFFFFFFF000000FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
                00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              TabOrder = 14
              OnClick = btnRemoveParcelaClick
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
            object deDataCompra: TTcDBDateEdit
              Left = 674
              Top = 7
              Width = 133
              Height = 21
              Checked = False
              DataField = 'DATALANCTO'
              DataSource = dtsFicha
              CheckOnExit = False
              Color = clWhite
              TabOrder = 1
            end
            object dbcbProvisao: TJvDBCheckBox
              Left = 682
              Top = 108
              Width = 97
              Height = 17
              Caption = 'Provis'#227'o '
              DataField = 'PROVISAO'
              DataSource = dtsFicha
              TabOrder = 7
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            object btnAnexos: TTcGDIButton
              Left = 798
              Top = 105
              Width = 84
              Height = 20
              Caption = 'Anexos'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              Picture.Data = {
                424D360300000000000036000000280000001000000010000000010018000000
                00000003000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
                00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFF000000C3C3C3FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C3C3C3FFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C3C3C3FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000C3
                C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                000000FFFFFFFFFFFF000000C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3
                000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFC3C3C3000000FFFFFFFFFFFFFFFFFF000000FFFFFFFF
                FFFF0C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3000000FFFFFF
                FFFFFFFFFFFFFFFFFF000000FFFFFFC3C3C30000000C0C0CFFFFFFFFFFFFFFFF
                FFFFFFFFC3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
                FFFFC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFC3C3C3000000FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF000000C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3
                C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C300000000
                0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              TabOrder = 8
              OnClick = btnAnexosClick
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
            object DBMemo1: TDBMemo
              Left = 472
              Top = 315
              Width = 308
              Height = 71
              DataField = 'OBS'
              DataSource = dtsParcelas
              TabOrder = 18
              Visible = False
            end
            object dbcbRecorrencia: TJvDBCheckBox
              Left = 547
              Top = 108
              Width = 97
              Height = 17
              Caption = 'Recorrente '
              DataField = 'RECORRENCIA'
              DataSource = dtsFicha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            object gbxPagamentoAVista: TGroupBox
              Left = 7
              Top = 223
              Width = 877
              Height = 43
              TabOrder = 10
              object Label5: TLabel
                Left = 419
                Top = 17
                Width = 44
                Height = 13
                Caption = 'Cheque'
              end
              object DBCheckBox1: TJvDBCheckBox
                Left = 20
                Top = 16
                Width = 129
                Height = 17
                Caption = 'Pagamento '#224' vista '
                DataField = 'PAGTO_AVISTA'
                DataSource = dtsFicha
                TabOrder = 0
                ValueChecked = 'T'
                ValueUnchecked = 'F'
                OnChange = DBCheckBox1Change
              end
              object edtCheque: TDBEdit
                Left = 482
                Top = 14
                Width = 135
                Height = 21
                AutoSize = False
                DataField = 'NUM_CHEQUE'
                DataSource = dtsParcelas
                TabOrder = 2
              end
              object dbcheckComCheque: TJvDBCheckBox
                Left = 235
                Top = 16
                Width = 97
                Height = 17
                Caption = 'Com cheque '
                DataField = 'CHEQUE'
                DataSource = dtsParcelas
                TabOrder = 1
                ValueChecked = 'T'
                ValueUnchecked = 'F'
              end
            end
            object dbDtVencimento: TTcDBDateEdit
              Left = 110
              Top = 317
              Width = 117
              Height = 21
              Checked = False
              DataField = 'VENCTO'
              DataSource = dtsParcelas
              CheckOnExit = False
              Color = clWhite
              ButtonWidth = 20
              TabOrder = 16
              Visible = False
            end
            object dbedValor: TJvDBCalcEdit
              Left = 242
              Top = 333
              Width = 121
              Height = 21
              ShowButton = False
              TabOrder = 17
              Visible = False
              DecimalPlacesAlwaysShown = False
              OnEnter = dbedValorEnter
              DataField = 'VALOR'
              DataSource = dtsParcelas
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 647
    Width = 896
    ExplicitTop = 647
    ExplicitWidth = 896
    inherited _imageBottom: TImage
      Width = 896
      ExplicitWidth = 769
    end
    inherited _ToolBar: TToolBar
      Left = 72
      ExplicitLeft = 72
    end
  end
  object dtsParcelas: TDataSource [2]
    DataSet = FIN_OutrasDespesasDatamodule.cdsParcelas
    Left = 562
    Top = 2
  end
  inherited ActionList: TInternalActionList
    Left = 138
    Top = 2
    object actPrintDesdobramento: TAction
      Category = 'Print'
      Caption = 'T'#237'tulo/Parcelas'
      OnExecute = actPrintDesdobramentoExecute
    end
    object actPrintVencimento: TAction
      Category = 'Print'
      Caption = 'por Vencimento'
      OnExecute = actPrintVencimentoExecute
    end
    object actPrintDocumento: TAction
      Category = 'Print'
      Caption = 'por Documento'
      OnExecute = actPrintDocumentoExecute
    end
    object actPrintPagamento: TAction
      Category = 'Print'
      Caption = 'por Pagamento'
      OnExecute = actPrintPagamentoExecute
    end
    object actPrintLancamento: TAction
      Category = 'Print'
      Caption = 'por Lan'#231'amento'
      OnExecute = actPrintLancamentoExecute
    end
    object actPrintEntidade: TAction
      Category = 'Print'
      Caption = 'por Fornecedor'
      OnExecute = actPrintEntidadeExecute
    end
    object actPrintDataBase: TAction
      Category = 'Print'
      Caption = 'por Data base'
      Enabled = False
      OnExecute = actPrintDataBaseExecute
    end
    object actPrintCompensacao: TAction
      Category = 'Print'
      Caption = 'Compensa'#231#227'o'
      Visible = False
      OnExecute = actPrintCompensacaoExecute
    end
    object actPrintPlanoContas: TAction
      Category = 'Print'
      Caption = 'Plano de Contas'
      Enabled = False
      OnExecute = actPrintPlanoContasExecute
    end
    object actIncrementaAno: TAction
      Category = 'Navigate'
      Hint = 'Pr'#243'ximo Ano'
      OnExecute = actIncrementaAnoExecute
    end
    object acDecrementaAno: TAction
      Category = 'Navigate'
      Hint = 'Ano Anterior'
      OnExecute = acDecrementaAnoExecute
    end
    object actIncrementaMes: TAction
      Category = 'Navigate'
      Hint = 'Pr'#243'ximo M'#234's'
      OnExecute = actIncrementaMesExecute
    end
    object actDecrementaMes: TAction
      Category = 'Navigate'
      Hint = 'M'#234's Anterior'
      OnExecute = actDecrementaMesExecute
    end
    object actPrintEmAtraso: TAction
      Category = 'Print'
      Caption = 'em Atraso'
      OnExecute = actPrintEmAtrasoExecute
    end
  end
  inherited dtsFicha: TDataSource
    OnDataChange = dtsFichaDataChange
    Left = 491
    Top = 1
  end
  inherited dtsLista: TDataSource
    Left = 451
    Top = 2
  end
  inherited _popMenuPrint: TPopupMenu
    Left = 288
    Top = 2
    object N3: TMenuItem
      Caption = '-'
    end
    object Desdobramento1: TMenuItem
      Action = actPrintDesdobramento
      Caption = 'Titulo/Parcelas'
      Visible = False
    end
    object porFornecedor1: TMenuItem
      Action = actPrintEntidade
      Visible = False
    end
    object emAtraso1: TMenuItem
      Action = actPrintEmAtraso
      Visible = False
    end
  end
  inherited _popMenuOther: TPopupMenu
    Left = 372
    Top = 2
  end
  inherited ToolBarIcons: TImageListProvider
    Left = 631
    Top = 1
  end
  object ImageList1: TImageList
    Left = 459
    Top = 80
    Bitmap = {
      494C010103000800D40010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
end
