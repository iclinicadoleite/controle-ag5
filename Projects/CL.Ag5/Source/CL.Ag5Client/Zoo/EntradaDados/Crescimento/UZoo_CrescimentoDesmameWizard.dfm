inherited Zoo_CrescimentoDesmameWizard: TZoo_CrescimentoDesmameWizard
  Left = 559
  Top = 366
  Caption = 'Desmame'
  ClientHeight = 476
  ClientWidth = 748
  ActionList.Left = 250
  ActionList.Top = 4
  ExplicitWidth = 754
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 748
    Height = 476
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 748
    ExplicitHeight = 476
    inherited _pnlFooter: TJvPanel
      Top = 445
      Width = 744
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitTop = 445
      ExplicitWidth = 744
      inherited _imageBottom: TImage
        Width = 744
        ExplicitWidth = 744
      end
      inherited _btbPrior: TTcGDIButton
        Left = 553
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 553
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 644
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 644
      end
      inherited _btbExecute: TTcGDIButton
        Left = 646
        Top = 2
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 646
        ExplicitTop = 2
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 744
      Height = 443
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 744
      ExplicitHeight = 443
      inherited PageControl: TJvPageControl
        Width = 744
        Height = 443
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ActivePage = TabSheet1
        ExplicitWidth = 744
        ExplicitHeight = 443
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object JvDBUltimGrid1: TJvDBUltimGrid
            Left = 0
            Top = 57
            Width = 744
            Height = 309
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtsDesmame
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = JvDBUltimGrid1DblClick
            AutoAppend = False
            OnShowEditor = JvDBUltimGrid1ShowEditor
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <
              item
                ControlName = 'lcStatus'
                FieldName = 'DESCR_STATUS'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'gdeDataDesmame'
                FieldName = 'DATADESMAME'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end>
            RowsHeight = 17
            TitleRowHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'BRINCO'
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEESTABULO'
                Width = 93
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCR_STATUS'
                Title.Caption = 'Status'
                Width = 81
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATADESMAME'
                Title.Caption = 'Data desmame'
                Width = 128
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IDADE'
                Title.Alignment = taRightJustify
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PESO'
                Title.Alignment = taRightJustify
                Visible = True
              end>
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 744
            Height = 57
            Align = alTop
            Caption = 'Animal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label2: TLabel
              Left = 544
              Top = 19
              Width = 45
              Height = 13
              Caption = '&Brinco :'
              Visible = False
            end
            object Label1: TLabel
              Left = 520
              Top = 42
              Width = 62
              Height = 13
              Caption = 'Status(*) :'
              Visible = False
            end
            object Label4: TLabel
              Left = 6
              Top = 19
              Width = 116
              Height = 13
              Caption = 'Data de Desmame :'
            end
            object Label5: TLabel
              Left = 328
              Top = 19
              Width = 45
              Height = 13
              Caption = '&Brinco :'
            end
            object edtBrinco: TJvDBSearchEdit
              Left = 575
              Top = 16
              Width = 98
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataSource = dtsDesmame
              DataField = 'BRINCO'
              ClearOnEnter = False
              TabOrder = 0
              Text = 'edtBrinco'
              Visible = False
              OnKeyPress = edtBrincoKeyPress
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 587
              Top = 34
              Width = 80
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESCR_STATUS'
              DataSource = dtsDesmame
              DropDownRows = 3
              TabOrder = 1
              Visible = False
              OnKeyDown = DBLookupComboBox1KeyDown
              OnKeyPress = DBLookupComboBox1KeyPress
            end
            object deDataPadrao: TTcDateEdit
              Left = 127
              Top = 16
              Width = 92
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 25
              TabOrder = 2
              OnChange = deDataPadraoChange
              OnExit = deDataPadraoExit
            end
            object jvceBrinco: TJvComboEdit
              Left = 379
              Top = 16
              Width = 107
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ButtonWidth = 15
              ImageKind = ikEllipsis
              TabOrder = 3
              Text = ''
              OnButtonClick = jvceBrincoButtonClick
              OnEnter = jvceBrincoEnter
              OnKeyDown = jvceBrincoKeyDown
              OnKeyPress = jvceBrincoKeyPress
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 366
            Width = 744
            Height = 54
            Align = alBottom
            Caption = ' '
            ParentColor = True
            TabOrder = 2
            object lblParamPeso: TLabel
              Left = 20
              Top = 1
              Width = 206
              Height = 13
              Caption = 'Peso das bezerras para desmame : %d  Kg'
            end
            object lblParamDias: TLabel
              Left = 19
              Top = 19
              Width = 219
              Height = 13
              Caption = 'Idade das bezerras para desmame : %d  Dias'
            end
            object Label3: TLabel
              Left = 18
              Top = 35
              Width = 378
              Height = 13
              Caption = 
                '(*) Os animais a serem desmamados, devem ter o status alterado p' +
                'ara Novilha'
            end
          end
          object lcStatus: TDBLookupComboBox
            Left = 194
            Top = 113
            Width = 80
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            DataField = 'DESCR_STATUS'
            DataSource = dtsDesmame
            DropDownRows = 3
            TabOrder = 3
            Visible = False
          end
          object gdeDataDesmame: TTcDBDateEdit
            Left = 300
            Top = 132
            Width = 121
            Height = 21
            Checked = False
            DataField = 'DATADESMAME'
            DataSource = dtsDesmame
            CheckOnExit = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = False
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 250
    Top = 4
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object dtsDesmame: TDataSource
    DataSet = Zoo_CrescimentoDesmameDatamodule.cdsDesmame
    Left = 313
    Top = 5
  end
end
