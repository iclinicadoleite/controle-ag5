inherited Zoo_SanidadeDiagnosticosWizard: TZoo_SanidadeDiagnosticosWizard
  Left = 373
  Top = 190
  ActiveControl = JvDBDateEdit1
  Caption = 'Diagn'#243'sticos'
  ClientHeight = 410
  ClientWidth = 792
  ExplicitWidth = 798
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 792
    Height = 410
    ExplicitWidth = 792
    ExplicitHeight = 410
    inherited _pnlFooter: TJvPanel
      Top = 379
      Width = 788
      ExplicitTop = 379
      ExplicitWidth = 788
      inherited _imageBottom: TImage
        Width = 788
        ExplicitWidth = 788
      end
      inherited _btbPrior: TTcGDIButton
        Left = 597
        ExplicitLeft = 597
      end
      inherited _btbNext: TTcGDIButton
        Left = 688
        ExplicitLeft = 688
      end
      inherited _btbExecute: TTcGDIButton
        Left = 703
        ExplicitLeft = 703
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 788
      Height = 377
      ExplicitWidth = 788
      ExplicitHeight = 377
      inherited PageControl: TJvPageControl
        Width = 788
        Height = 377
        ActivePage = TabSheet1
        ExplicitWidth = 788
        ExplicitHeight = 377
        object TabSheet1: TTabSheet
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'TabSheet1'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 788
            Height = 63
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label1: TLabel
              Left = 8
              Top = 17
              Width = 27
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Data'
            end
            object lblAnimal: TLabel
              Left = 184
              Top = 17
              Width = 39
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Animal'
            end
            object Label3: TLabel
              Left = 394
              Top = 17
              Width = 75
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Diagn'#243'stico :'
            end
            object Label2: TLabel
              Left = 10
              Top = 43
              Width = 136
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Animal Selecionado :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit2: TDBText
              Left = 157
              Top = 43
              Width = 474
              Height = 17
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'NOMEESTABULO'
              DataSource = dtsDiagnosticosAAplicar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblQuarto: TLabel
              Left = 636
              Top = 17
              Width = 48
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Quarto :'
              Visible = False
            end
            object edtBrinco: TJvComboEdit
              Left = 236
              Top = 14
              Width = 151
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ButtonWidth = 15
              ImageKind = ikEllipsis
              TabOrder = 1
              Text = ''
              OnButtonClick = edtBrincoButtonClick
              OnChange = edtBrincoChange
              OnEnter = edtBrincoEnter
              OnKeyPress = edtBrincoKeyPress
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 474
              Top = 14
              Width = 157
              Height = 21
              DataField = 'DIAGNOSTICO'
              DataSource = dtsDiagnosticosAAplicar
              DropDownRows = 10
              DropDownWidth = 300
              TabOrder = 2
              OnKeyDown = DBLookupComboBox1KeyDown
            end
            object JvDBDateEdit1: TTcDBDateEdit
              Left = 58
              Top = 14
              Width = 121
              Height = 21
              Checked = False
              DataField = 'DATA'
              DataSource = dtsDiagnosticosAAplicar
              CheckOnExit = False
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dblcQuarto: TDBLookupComboBox
              Left = 689
              Top = 14
              Width = 101
              Height = 21
              DataField = 'DESC_QUARTO'
              DataSource = dtsDiagnosticosAAplicar
              DropDownRows = 10
              DropDownWidth = 300
              TabOrder = 3
              Visible = False
              OnKeyDown = dblcQuartoKeyDown
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 63
            Width = 788
            Height = 237
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel5'
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object Splitter1: TSplitter
              Left = 0
              Top = 127
              Width = 788
              Height = 4
              Cursor = crVSplit
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alBottom
              Color = clWhite
              ParentColor = False
              ExplicitTop = 119
              ExplicitWidth = 274
            end
            object Panel10: TPanel
              Left = 0
              Top = 131
              Width = 788
              Height = 106
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alBottom
              BevelOuter = bvNone
              BorderWidth = 1
              Caption = ' '
              Color = clSilver
              ParentBackground = False
              TabOrder = 0
              object dbgDiagnosticosAplicados: TJvDBUltimGrid
                Left = 1
                Top = 18
                Width = 786
                Height = 87
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                TabStop = False
                Align = alClient
                DataSource = dtsDiagnosticosAplicados
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = dbgDiagnosticosAplicadosKeyDown
                AutoAppend = False
                OnShowEditor = dbgDiagnosticosAplicadosShowEditor
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
                    FieldName = 'KZOO_ANIMAL_DIAGNOSTICO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'KZOO_ANIMAL_FEMEA'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_PROTOCOLO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_PROTOCOLO'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_PROTOCOLO'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_DIAGNOSTICO'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_DIAGNOSTICO'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_DIAGNOSTICO'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESC_STATUS_DIAGNOSTICO'
                    Width = 64
                    Visible = True
                  end>
              end
              object Panel2: TPanel
                Left = 1
                Top = 1
                Width = 786
                Height = 17
                Align = alTop
                Caption = 'Hist'#243'rico de protocolos'
                ParentBackground = False
                ParentColor = True
                TabOrder = 1
              end
            end
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 788
              Height = 127
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
              object dbgProtocolosAAplicar: TJvDBUltimGrid
                Left = 2
                Top = 19
                Width = 784
                Height = 106
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                TabStop = False
                Align = alClient
                DataSource = dtsProtocolosAAplicar
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = dbgProtocolosAAplicarKeyDown
                OnKeyPress = dbgProtocolosAAplicarKeyPress
                AutoAppend = False
                OnShowEditor = dbgShowEditor
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                CanDelete = False
                EditControls = <>
                RowsHeight = 16
                TitleRowHeight = 17
                OnCheckIfBooleanField = dbgProtocolosAAplicarCheckIfBooleanField
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SELECTED'
                    Width = 20
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PROTOCOLO'
                    ReadOnly = True
                    Title.Caption = 'Protocolos a aplicar'
                    Width = 177
                    Visible = True
                  end>
              end
              object Panel1: TPanel
                Left = 2
                Top = 2
                Width = 784
                Height = 17
                Align = alTop
                Caption = 'Protocolos a aplicar dispon'#237'veis no diagn'#243'stico'
                ParentBackground = False
                ParentColor = True
                TabOrder = 1
              end
            end
          end
          object GroupBox3: TGroupBox
            Left = 0
            Top = 300
            Width = 788
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
            object Label4: TLabel
              Left = 16
              Top = 9
              Width = 36
              Height = 13
              Caption = 'Brinco'
            end
            object Label5: TLabel
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
              Left = 557
              Top = 32
              Width = 109
              Height = 13
              Caption = 'Data '#250'ltimo evento'
            end
            object dbBrinco: TDBText
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
            object dbDPP: TDBText
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
            object dbUltimaPesagem: TDBText
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
            object dbDataUltimaPesagem: TDBText
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
            object dbStatus: TDBText
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
            object dbUltimoEvento: TDBText
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
            object dbDataUltimoEvento: TDBText
              Left = 671
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
  object dtsDiagnosticosAAplicar: TDataSource
    DataSet = Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosAAplicar
    Left = 122
    Top = 19
  end
  object dtsDiagnosticosDisponiveis: TDataSource
    DataSet = Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosDisponiveis
    OnDataChange = dtsDiagnosticosDisponiveisDataChange
    Left = 529
    Top = 19
  end
  object dtsProtocolosAAplicar: TDataSource
    DataSet = Zoo_SanidadeDiagnosticosDatamodule.cdsProtocolosAAplicar
    Left = 353
    Top = 129
  end
  object dtsDiagnosticosAplicados: TDataSource
    DataSet = Zoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosAplicados
    Left = 425
    Top = 228
  end
  object dtsResumoAnimal: TDataSource
    DataSet = Zoo_SanidadeDiagnosticosDatamodule.cdsResumoAnimal
    Left = 121
    Top = 291
  end
end
