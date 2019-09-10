inherited Zoo_AtribuicaoAutomaticaWizard: TZoo_AtribuicaoAutomaticaWizard
  Left = 321
  Top = 240
  Caption = 'Automa'#231#227'o de Protocolo'
  ClientHeight = 442
  ClientWidth = 701
  Color = clWhite
  ExplicitWidth = 707
  ExplicitHeight = 470
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 701
    Height = 442
    ExplicitWidth = 701
    ExplicitHeight = 442
    inherited _pnlFooter: TJvPanel
      Top = 411
      Width = 697
      Color = clSilver
      ExplicitTop = 411
      ExplicitWidth = 697
      inherited _imageBottom: TImage
        Width = 697
        ExplicitWidth = 697
      end
      inherited _btbPrior: TTcGDIButton
        Left = 500
        TabOrder = 0
        ExplicitLeft = 500
      end
      inherited _btbCancel: TTcGDIButton
        TabOrder = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 591
        TabOrder = 1
        ExplicitLeft = 591
      end
      inherited _btbExecute: TTcGDIButton
        Left = 606
        Top = 2
        Caption = '&Salvar'
        TabOrder = 2
        Visible = False
        ExplicitLeft = 606
        ExplicitTop = 2
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 697
      Height = 409
      ParentColor = True
      ExplicitWidth = 697
      ExplicitHeight = 409
      inherited PageControl: TJvPageControl
        Width = 697
        Height = 409
        ActivePage = TabSheet1
        ExplicitWidth = 697
        ExplicitHeight = 409
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel4: TPanel
            Left = 0
            Top = 52
            Width = 697
            Height = 334
            Align = alClient
            Caption = ' '
            ParentBackground = False
            ParentColor = True
            TabOrder = 0
            object Bevel1: TBevel
              Left = 332
              Top = 16
              Width = 34
              Height = 117
              Shape = bsFrame
            end
            object Bevel2: TBevel
              Left = 332
              Top = 146
              Width = 34
              Height = 117
              Shape = bsFrame
            end
            object Label2: TLabel
              Left = 12
              Top = 284
              Width = 333
              Height = 13
              Caption = 
                'Altera'#231#245'es na automa'#231#227'o de protocolos s'#227'o salvas automaticamente' +
                '.'
            end
            object _btnRemoveAll: TTcGDIButton
              Left = 336
              Top = 232
              Width = 25
              Height = 26
              Action = _actRemoveAll_Termina
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
            object Button1: TTcGDIButton
              Left = 336
              Top = 75
              Width = 25
              Height = 25
              Action = _actRemove_Inicia
              Caption = '<'
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
            object Button2: TTcGDIButton
              Left = 336
              Top = 103
              Width = 25
              Height = 25
              Action = _actRemoveAll_Inicia
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
            object _btnAdd: TTcGDIButton
              Left = 336
              Top = 20
              Width = 25
              Height = 26
              Action = _actAdd_Inicia
              Caption = '>'
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
            object _btnAddAll: TTcGDIButton
              Left = 336
              Top = 47
              Width = 25
              Height = 25
              Action = _actAddAll_Incia
              Caption = '>>'
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
            object _btnRemove: TTcGDIButton
              Left = 336
              Top = 205
              Width = 25
              Height = 25
              Action = _actRemove_Termina
              Caption = '<'
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
            object Button3: TTcGDIButton
              Left = 336
              Top = 150
              Width = 25
              Height = 25
              Action = _actAdd_Termina
              Caption = '>'
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
              TabOrder = 6
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
            object Panel1: TPanel
              Left = 8
              Top = 10
              Width = 320
              Height = 257
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              BorderWidth = 1
              Caption = '_pnldbgLista'
              Color = clSilver
              ParentBackground = False
              TabOrder = 7
              object dbgOut: TJvDBUltimGrid
                Left = 2
                Top = 2
                Width = 316
                Height = 253
                Align = alClient
                DataSource = dtsOut
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
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
                OnCheckIfBooleanField = dbgIn_IniciaCheckIfBooleanField
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    Title.Caption = 'Protocolos Dispon'#237'veis'
                    Width = 280
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ATIVO'
                    Title.Caption = 'Ativo'
                    Width = 35
                    Visible = True
                  end>
              end
            end
            object Button4: TTcGDIButton
              Left = 336
              Top = 177
              Width = 25
              Height = 25
              Action = _actAddAll_Termina
              Caption = '>>'
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
            object Panel2: TPanel
              Left = 369
              Top = 10
              Width = 321
              Height = 127
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              BorderWidth = 1
              Caption = '_pnldbgLista'
              Color = clSilver
              ParentBackground = False
              TabOrder = 9
              object dbgIn_Inicia: TJvDBUltimGrid
                Left = 2
                Top = 2
                Width = 317
                Height = 123
                Align = alClient
                DataSource = dtsIn_Inicia
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDblClick = dbgIn_IniciaDblClick
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                OnCheckIfBooleanField = dbgIn_IniciaCheckIfBooleanField
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    Title.Caption = 'Protocolos a Iniciar'
                    Width = 280
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ATIVO'
                    Title.Caption = 'Ativo'
                    Width = 35
                    Visible = True
                  end>
              end
            end
            object Panel3: TPanel
              Left = 369
              Top = 140
              Width = 321
              Height = 127
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              BorderWidth = 1
              Caption = '_pnldbgLista'
              Color = clSilver
              ParentBackground = False
              TabOrder = 10
              object dbgIn_Termina: TJvDBUltimGrid
                Left = 2
                Top = 2
                Width = 317
                Height = 123
                Align = alClient
                DataSource = dtsIn_Termina
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDblClick = dbgIn_TerminaDblClick
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                OnCheckIfBooleanField = dbgIn_IniciaCheckIfBooleanField
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    Title.Caption = 'Protocolos a Finalizar'
                    Width = 280
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ATIVO'
                    Title.Caption = 'Ativo'
                    Width = 35
                    Visible = True
                  end>
              end
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 697
            Height = 52
            Align = alTop
            Caption = ' '
            ParentBackground = False
            ParentColor = True
            TabOrder = 1
            object Label1: TLabel
              Left = 316
              Top = 8
              Width = 34
              Height = 13
              Caption = 'Evento'
            end
            object dblcListaEventos: TDBLookupComboBox
              Left = 380
              Top = 4
              Width = 252
              Height = 21
              KeyField = 'DESCRICAO'
              ListField = 'DESCRICAO'
              ListSource = dtsListaEventos
              TabOrder = 0
            end
            object dblcDiagnosticos: TDBLookupComboBox
              Left = 380
              Top = 27
              Width = 252
              Height = 21
              DropDownWidth = 300
              KeyField = 'KZOO_DIAGNOSTICO'
              ListField = 'NOME'
              ListSource = dtsDiagnosticos
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actExecute: TAction
      Caption = 'Salvar'
      OnUpdate = _actExecuteUpdate
    end
    object _actAdd_Inicia: TAction
      Caption = 'Incluir'
      OnExecute = _actAdd_IniciaExecute
    end
    object _actAddAll_Incia: TAction
      Caption = 'Incluir Todos'
      OnExecute = _actAddAll_InciaExecute
    end
    object _actRemove_Inicia: TAction
      Caption = 'Remover'
      OnExecute = _actRemove_IniciaExecute
    end
    object _actRemoveAll_Inicia: TAction
      Caption = 'Remover Todos'
      OnExecute = _actRemoveAll_IniciaExecute
    end
    object _actOK: TAction
      Caption = '_actOK'
    end
    object _actAdd_Termina: TAction
      Caption = '_actAdd_Termina'
      OnExecute = _actAdd_TerminaExecute
    end
    object _actAddAll_Termina: TAction
      Caption = '_actAddAll_Termina'
      OnExecute = _actAddAll_TerminaExecute
    end
    object _actRemove_Termina: TAction
      Caption = '_actRemove_Termina'
      OnExecute = _actRemove_TerminaExecute
    end
    object _actRemoveAll_Termina: TAction
      Caption = '_actRemoveAll_Termina'
      OnExecute = _actRemoveAll_TerminaExecute
    end
  end
  object dtsIn_Inicia: TDataSource
    DataSet = cdsIn_Inicia
    Left = 520
    Top = 116
  end
  object dtsOut: TDataSource
    DataSet = cdsOut
    Left = 40
    Top = 136
  end
  object cdsIn_Inicia: TClientDataSet
    Aggregates = <>
    Filter = 'Selected = '#39'T'#39
    Filtered = True
    Params = <>
    Left = 552
    Top = 116
  end
  object cdsOut: TClientDataSet
    Aggregates = <>
    Filter = 'Selected = '#39'F'#39
    Filtered = True
    Params = <>
    Left = 68
    Top = 136
  end
  object dtsIn_Termina: TDataSource
    DataSet = cdsIn_Termina
    Left = 524
    Top = 262
  end
  object cdsIn_Termina: TClientDataSet
    Aggregates = <>
    Filter = 'Selected = '#39'T'#39
    Filtered = True
    Params = <>
    Left = 552
    Top = 262
  end
  object dtsListaEventos: TDataSource
    DataSet = Zoo_AtribuicaoAutomaticaDatamodule.cdsListaEventos
    OnDataChange = dtsListaEventosDataChange
    Left = 446
    Top = 8
  end
  object dtsDiagnosticos: TDataSource
    DataSet = Zoo_AtribuicaoAutomaticaDatamodule.cdsLstDiagnosticos
    OnDataChange = dtsDiagnosticosDataChange
    Left = 558
    Top = 10
  end
end
