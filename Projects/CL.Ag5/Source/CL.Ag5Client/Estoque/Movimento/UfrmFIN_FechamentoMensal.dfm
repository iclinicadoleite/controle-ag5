inherited frmFIN_FechamentoMensal: TfrmFIN_FechamentoMensal
  Left = 219
  Top = 185
  Caption = 'Encerramento mensal'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    ActivePage = _tbsFicha
    inherited _tbsLista: TTabSheet
      inherited _pnlSearch: TPanel
        inherited _edtSearch: TJvComboEdit
          ParentFont = False
        end
      end
      inherited _pnldbgLista: TPanel
        inherited _dbgLista: TJvDBUltimGrid
          Constraints.MinHeight = 88
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 763
      ExplicitHeight = 363
      inherited _pnlFicha: TPanel
        Constraints.MinHeight = 173
        inherited _ScrollBoxFicha: TScrollBox
          inherited _pnlScroll: TPanel
            object Label1: TLabel
              Left = 20
              Top = 24
              Width = 225
              Height = 13
              Caption = 'Fechamento selecionado ( mm / yyyy )'
            end
            object DBText1: TDBText
              Left = 381
              Top = 24
              Width = 120
              Height = 17
              DataField = 'ENCERRADO'
              DataSource = dtsLista
            end
            object Label2: TLabel
              Left = 301
              Top = 339
              Width = 148
              Height = 16
              Anchors = [akRight, akBottom]
              Caption = 'Total em estoque R$'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              StyleElements = [seClient, seBorder]
            end
            object DBText2: TDBText
              Left = 537
              Top = 339
              Width = 187
              Height = 17
              Alignment = taRightJustify
              Anchors = [akRight, akBottom]
              DataField = 'SOMA_VALOR_ESTOQUE'
              DataSource = dtsFechamentoProdutos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              StyleElements = [seClient, seBorder]
            end
            object TcGDIButton1: TTcGDIButton
              Left = 512
              Top = 16
              Width = 100
              Height = 27
              Action = actEncerrar
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
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
            object TcGDIButton2: TTcGDIButton
              Left = 624
              Top = 16
              Width = 100
              Height = 27
              Action = actReabrirMes
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
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
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 261
              Top = 22
              Width = 109
              Height = 21
              DropDownWidth = 200
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              KeyField = 'KEST_ENCERRAMENTO_MES'
              ListField = 'ANO_MES;ENCERRADO'
              ListSource = dtsLista
              ParentFont = False
              TabOrder = 2
            end
            object Panel1: TPanel
              Left = 20
              Top = 60
              Width = 717
              Height = 271
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Anchors = [akLeft, akTop, akRight, akBottom]
              BorderWidth = 1
              Caption = 'M'#234's n'#227'o encerrado'
              Color = clSilver
              ParentBackground = False
              TabOrder = 3
              object dbgProdutos: TJvDBUltimGrid
                Left = 2
                Top = 2
                Width = 713
                Height = 267
                Align = alClient
                DataSource = dtsFechamentoProdutos
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                AutoAppend = False
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
  inherited _pnlToolButtons: TPanel
    inherited _ToolBar: TToolBar
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actNew: TAction
      Enabled = False
    end
    inherited _actEdit: TAction
      Enabled = False
    end
    inherited _actDelete: TAction
      Enabled = False
    end
    inherited _actSave: TAction
      Enabled = False
    end
    inherited _actCancel: TAction
      Enabled = False
    end
    inherited _actRefresh: TAction
      Enabled = False
    end
    object actEncerrar: TAction
      Category = 'Edit'
      Caption = 'Encerrar...'
      OnExecute = actEncerrarExecute
      OnUpdate = actEncerrarUpdate
    end
    object actReabrirMes: TAction
      Category = 'Edit'
      Caption = 'Reabrir...'
      OnExecute = actReabrirMesExecute
      OnUpdate = actReabrirMesUpdate
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = dtmFIN_FechamentoMensal.cdsFechamentoMensal
  end
  inherited dtsLista: TDataSource
    DataSet = dtmFIN_FechamentoMensal.cdsLstFechamentoMensal
    OnDataChange = dtsListaDataChange
    Left = 538
  end
  object dtsFechamentoProdutos: TDataSource
    DataSet = dtmFIN_FechamentoMensal.cdsFechamentoProdutos
    Left = 616
    Top = 24
  end
end
