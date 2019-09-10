inherited frmFIN_Contas2: TfrmFIN_Contas2
  Left = 382
  Top = 231
  Caption = 'Contas'
  ClientWidth = 767
  ExplicitWidth = 783
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Width = 767
    ActivePage = _tbsFicha
    ExplicitWidth = 767
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 759
      inherited _pnlSearch: TPanel
        Width = 759
        Height = 53
        ExplicitWidth = 759
        ExplicitHeight = 53
        inherited _edtSearch: TJvComboEdit
          ParentFont = False
        end
        object cbxInativos: TCheckBox
          Left = 72
          Top = 30
          Width = 64
          Height = 17
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Inativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = cbxInativosClick
        end
        object TcGDIButton1: TTcGDIButton
          Left = 606
          Top = 5
          Width = 145
          Height = 41
          Anchors = [akTop, akRight]
          Caption = 'Atribuir esta conta como favorita'
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 2
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
      end
      inherited _pnldbgLista: TPanel
        Top = 53
        Width = 759
        Height = 310
        ExplicitTop = 53
        ExplicitWidth = 759
        ExplicitHeight = 310
        inherited _dbgLista: TJvDBUltimGrid
          Width = 755
          Height = 306
          Constraints.MinHeight = 88
          DrawingStyle = gdsThemed
          ParentColor = True
          ParentFont = True
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Style = []
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 11
      ExplicitTop = 26
      ExplicitWidth = 759
      ExplicitHeight = 363
      inherited _pnlFicha: TPanel
        Width = 759
        Constraints.MinHeight = 173
        ExplicitWidth = 759
        inherited _ScrollBoxFicha: TScrollBox
          Width = 759
          ExplicitWidth = 759
          inherited _pnlScroll: TPanel
            Width = 759
            ExplicitWidth = 759
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 759
              Height = 363
              Align = alClient
              ParentColor = True
              TabOrder = 0
              object Label1: TLabel
                Left = 7
                Top = 10
                Width = 33
                Height = 13
                Caption = 'Nome'
                FocusControl = dbNomeConta
              end
              object Label10: TLabel
                Left = 7
                Top = 109
                Width = 92
                Height = 13
                Caption = 'Saldo atual : R$'
                Color = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label24: TLabel
                Left = 394
                Top = 10
                Width = 36
                Height = 13
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Status'
              end
              object DBText2: TDBText
                Left = 100
                Top = 109
                Width = 54
                Height = 13
                AutoSize = True
                DataField = 'SALDO_ATUAL'
                DataSource = dtsFicha
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbNomeConta: TDBEdit
                Left = 53
                Top = 7
                Width = 315
                Height = 21
                DataField = 'NOME'
                DataSource = dtsFicha
                TabOrder = 0
              end
              object GroupBox1: TGroupBox
                Left = 7
                Top = 38
                Width = 514
                Height = 60
                Caption = 'Saldo Inicial'
                TabOrder = 2
                object Label2: TLabel
                  Left = 24
                  Top = 26
                  Width = 27
                  Height = 13
                  Caption = 'Data'
                end
                object Label3: TLabel
                  Left = 287
                  Top = 26
                  Width = 29
                  Height = 13
                  Caption = 'Valor'
                end
                object dbDataInicial: TTcDBDateEdit
                  Left = 68
                  Top = 23
                  Width = 120
                  Height = 21
                  Checked = False
                  DataField = 'DATASALDOINICIAL'
                  DataSource = dtsFicha
                  CheckOnExit = False
                  Color = clSilver
                  TabOrder = 0
                end
                object TcDBCalcEdit1: TTcDBCalcEdit
                  Left = 331
                  Top = 23
                  Width = 121
                  Height = 21
                  OnEnter = TcDBCalcEdit1Enter
                  Checked = False
                  Color = clSilver
                  DisplayFormat = ',0.00'
                  ShowButton = False
                  TabOrder = 1
                  ZeroEmpty = False
                  DecimalPlacesAlwaysShown = False
                  DataField = 'SALDOINICIAL'
                  DataSource = dtsFicha
                end
              end
              object GroupBox2: TGroupBox
                Left = 7
                Top = 134
                Width = 514
                Height = 87
                Caption = ' Banco '
                TabOrder = 3
                object Label8: TLabel
                  Left = 206
                  Top = 23
                  Width = 35
                  Height = 13
                  Caption = 'Banco'
                end
                object Label6: TLabel
                  Left = 10
                  Top = 58
                  Width = 45
                  Height = 13
                  Caption = 'Ag'#234'ncia'
                end
                object Label7: TLabel
                  Left = 206
                  Top = 58
                  Width = 86
                  Height = 13
                  Caption = 'Conta corrente'
                  FocusControl = dbCC
                end
                object DBText1: TDBText
                  Left = 64
                  Top = 23
                  Width = 50
                  Height = 17
                  DataField = 'CODIGO'
                  DataSource = dtsFicha
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label4: TLabel
                  Left = 10
                  Top = 23
                  Width = 40
                  Height = 13
                  Caption = 'C'#243'digo'
                end
                object dbCC: TDBEdit
                  Left = 305
                  Top = 55
                  Width = 107
                  Height = 21
                  DataField = 'CONTA_CORRENTE'
                  DataSource = dtsFicha
                  MaxLength = 15
                  TabOrder = 2
                end
                object edtBancos: TJvDBComboEdit
                  Left = 252
                  Top = 20
                  Width = 252
                  Height = 21
                  Color = clWhite
                  DataField = 'BANCO'
                  DataSource = dtsFicha
                  ImageKind = ikEllipsis
                  ButtonWidth = 15
                  TabOrder = 0
                  OnButtonClick = edtBancosButtonClick
                  OnEnter = edtBancosEnter
                  OnKeyPress = edtBancosKeyPress
                end
                object dbAgencia: TDBEdit
                  Left = 61
                  Top = 55
                  Width = 99
                  Height = 21
                  DataField = 'AGENCIA'
                  DataSource = dtsFicha
                  MaxLength = 10
                  TabOrder = 1
                end
              end
              object cbStatus: TJvDBComboBox
                Left = 436
                Top = 7
                Width = 85
                Height = 21
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                DataField = 'ATIVA'
                DataSource = dtsFicha
                Items.Strings = (
                  'Ativo'
                  'Inativo')
                TabOrder = 1
                TabStop = False
                Values.Strings = (
                  'T'
                  'F')
                ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                ListSettings.OutfilteredValueFont.Color = clRed
                ListSettings.OutfilteredValueFont.Height = -11
                ListSettings.OutfilteredValueFont.Name = 'Verdana'
                ListSettings.OutfilteredValueFont.Style = []
              end
              object btnBancos: TTcGDIButton
                Left = 393
                Top = 227
                Width = 128
                Height = 25
                Caption = 'Cadastrar banco'
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                TabOrder = 4
                Visible = False
                OnClick = btnBancosClick
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
  inherited _pnlToolButtons: TPanel
    Width = 767
    ExplicitWidth = 767
    inherited _imageBottom: TImage
      Width = 767
      ExplicitWidth = 841
    end
    inherited _ToolBar: TToolBar
      Left = 11
      ExplicitLeft = 11
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited ActionList: TInternalActionList
    object _actPrintMovimentacao: TAction
      Category = 'Print'
      Caption = 'Movimenta'#231#227'o'
      OnExecute = _actPrintMovimentacaoExecute
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = dtmFIN_Contas2.cdsConta
    Left = 283
    Top = 2
  end
  inherited dtsLista: TDataSource
    DataSet = dtmFIN_Contas2.cdsLstContas
    Left = 243
    Top = 2
  end
  inherited _popMenuPrint: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Action = _actPrintMovimentacao
    end
  end
  inherited ToolBarIcons: TImageListProvider
    Left = 399
    Top = 1
  end
end
