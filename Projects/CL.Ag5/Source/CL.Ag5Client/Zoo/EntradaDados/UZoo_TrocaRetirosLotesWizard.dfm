inherited ZooTrocaRetirosLotesWizard: TZooTrocaRetirosLotesWizard
  Left = 363
  Top = 241
  Caption = 'Troca de retiros e lotes'
  ClientHeight = 446
  ClientWidth = 821
  ExplicitWidth = 827
  ExplicitHeight = 475
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 821
    Height = 446
    ExplicitWidth = 821
    ExplicitHeight = 446
    inherited _pnlFooter: TJvPanel
      Top = 415
      Width = 817
      ExplicitTop = 415
      ExplicitWidth = 817
      inherited _imageBottom: TImage
        Width = 817
        ExplicitWidth = 817
      end
      inherited _btbPrior: TTcGDIButton
        Left = 633
        ExplicitLeft = 633
      end
      inherited _btbNext: TTcGDIButton
        Left = 725
        Top = 1
        ExplicitLeft = 725
        ExplicitTop = 1
      end
      inherited _btbExecute: TTcGDIButton
        Left = 724
        Top = 2
        ExplicitLeft = 724
        ExplicitTop = 2
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 817
      Height = 413
      ExplicitWidth = 817
      ExplicitHeight = 413
      inherited PageControl: TJvPageControl
        Width = 817
        Height = 413
        ActivePage = TabSheet1
        ExplicitWidth = 817
        ExplicitHeight = 413
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object pnlDestino: TPanel
            AlignWithMargins = True
            Left = 434
            Top = 5
            Width = 378
            Height = 380
            Margins.Left = 0
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Align = alClient
            BevelOuter = bvNone
            Caption = 'pnlDestino'
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object gbDestino: TGroupBox
              Left = 0
              Top = 0
              Width = 378
              Height = 380
              Align = alClient
              Caption = 'Destino'
              TabOrder = 0
              DesignSize = (
                378
                380)
              object lblTotalAnimaisDes: TLabel
                Left = 309
                Top = 358
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Anchors = [akRight, akBottom]
                Caption = 'Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblAnimaisSelecionados: TLabel
                Left = 185
                Top = 358
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Anchors = [akRight, akBottom]
                Caption = 'Selecionados:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblExistentesDes: TLabel
                Left = 5
                Top = 358
                Width = 176
                Height = 13
                Anchors = [akLeft, akBottom]
                Caption = 'Existentes no lote/retiro : 5000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblTotal: TLabel
                Left = 345
                Top = 358
                Width = 28
                Height = 13
                Alignment = taRightJustify
                Anchors = [akRight, akBottom]
                Caption = '0000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblSelecionados: TLabel
                Left = 267
                Top = 358
                Width = 28
                Height = 13
                Alignment = taRightJustify
                Anchors = [akRight, akBottom]
                Caption = '0000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Panel1: TPanel
                Left = 2
                Top = 15
                Width = 374
                Height = 119
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object Label1: TLabel
                  Left = 18
                  Top = 7
                  Width = 29
                  Height = 13
                  Caption = 'Retiro'
                end
                object Label2: TLabel
                  Left = 18
                  Top = 43
                  Width = 21
                  Height = 13
                  Caption = 'Lote'
                end
                object Label3: TLabel
                  Left = 18
                  Top = 77
                  Width = 66
                  Height = 13
                  Caption = 'Data de troca'
                end
                object jvcbxRetiroDes: TJvComboBox
                  Left = 63
                  Top = 7
                  Width = 192
                  Height = 21
                  TabOrder = 0
                  Text = ''
                  OnChange = jvcbxRetiroDesChange
                end
                object jvcbxLoteDes: TJvComboBox
                  Left = 63
                  Top = 43
                  Width = 192
                  Height = 21
                  TabOrder = 1
                  Text = ''
                  OnChange = jvcbxLoteDesChange
                end
                object deDataTroca: TTcDateEdit
                  Left = 146
                  Top = 77
                  Width = 104
                  Height = 21
                  Checked = False
                  CheckOnExit = False
                  ButtonWidth = 19
                  TabOrder = 2
                end
              end
              object JvDBUltimGridDestino: TJvDBUltimGrid
                AlignWithMargins = True
                Left = 5
                Top = 137
                Width = 368
                Height = 216
                Margins.Bottom = 25
                Align = alClient
                DataSource = dtsDestino
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDblClick = JvDBUltimGridDestinoDblClick
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
              end
            end
          end
          object pnlBotoes: TPanel
            AlignWithMargins = True
            Left = 382
            Top = 5
            Width = 52
            Height = 380
            Margins.Left = 0
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 5
            Align = alLeft
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object btbSelecionarTodos: TTcGDIButton
              Left = 10
              Top = 129
              Width = 30
              Height = 25
              Hint = 'Selecionar todos'
              Caption = '>>'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btbSelecionarTodosClick
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
            object btbSelecionar: TTcGDIButton
              Left = 10
              Top = 160
              Width = 30
              Height = 25
              Hint = 'Selecionar animal'
              Caption = '>'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = btbSelecionarClick
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
            object btbDesselecionar: TTcGDIButton
              Left = 10
              Top = 191
              Width = 30
              Height = 25
              Hint = 'Desselecionar animal'
              Caption = '<'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = btbDesselecionarClick
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
            object btbDesselecionarTodos: TTcGDIButton
              Left = 10
              Top = 222
              Width = 30
              Height = 25
              Hint = 'Desselecionar todos'
              Caption = '<<'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = btbDesselecionarTodosClick
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
          object pnlOrigem: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 377
            Height = 380
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 5
            Align = alLeft
            BevelOuter = bvNone
            Caption = 'pnlOrigem'
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object gbOrigem: TGroupBox
              Left = 0
              Top = 0
              Width = 377
              Height = 380
              Align = alClient
              Caption = 'Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              DesignSize = (
                377
                380)
              object lblTotalAnimaisOri: TLabel
                Left = 5
                Top = 358
                Width = 93
                Height = 13
                Anchors = [akLeft, akBottom]
                Caption = 'Total de animais'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object pnlFieldsOri: TPanel
                Left = 2
                Top = 15
                Width = 373
                Height = 119
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object lblRetiroOri: TLabel
                  Left = 18
                  Top = 7
                  Width = 29
                  Height = 13
                  Caption = 'Retiro'
                end
                object lblLoteOri: TLabel
                  Left = 18
                  Top = 43
                  Width = 21
                  Height = 13
                  Caption = 'Lote'
                end
                object lblPesquisarOri: TLabel
                  Left = 18
                  Top = 77
                  Width = 73
                  Height = 13
                  Caption = 'Localizar Brinco'
                end
                object jvcbxRetiroOri: TJvComboBox
                  Left = 63
                  Top = 7
                  Width = 192
                  Height = 21
                  Style = csDropDownList
                  TabOrder = 0
                  Text = ''
                  OnChange = jvcbxRetiroOriChange
                  OnKeyPress = jvcbxRetiroOriKeyPress
                end
                object jvcbxLoteOri: TJvComboBox
                  Left = 63
                  Top = 43
                  Width = 192
                  Height = 21
                  Style = csDropDownList
                  TabOrder = 1
                  Text = ''
                  OnChange = jvcbxLoteOriChange
                  OnKeyPress = jvcbxLoteOriKeyPress
                end
                object edtPesqBrincoOri: TEdit
                  Left = 108
                  Top = 77
                  Width = 142
                  Height = 21
                  TabOrder = 2
                  OnChange = edtPesqBrincoOriChange
                end
              end
              object JvDBUltimGridOrigem: TJvDBUltimGrid
                AlignWithMargins = True
                Left = 5
                Top = 137
                Width = 367
                Height = 216
                Margins.Bottom = 25
                Align = alClient
                DataSource = dtsOrigem
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDblClick = JvDBUltimGridOrigemDblClick
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
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object dtsOrigem: TDataSource
    DataSet = ZooTrocaRetirosLotesDatamodule.cdsAnimaisOrigem
    OnDataChange = dtsOrigemDataChange
    Left = 254
    Top = 6
  end
  object dtsDestino: TDataSource
    OnDataChange = dtsDestinoDataChange
    Left = 474
    Top = 10
  end
end
