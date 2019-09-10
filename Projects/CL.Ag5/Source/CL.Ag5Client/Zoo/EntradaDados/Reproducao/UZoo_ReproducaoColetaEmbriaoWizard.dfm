inherited Zoo_ReproducaoColetaEmbriaoWizard: TZoo_ReproducaoColetaEmbriaoWizard
  Left = 403
  Top = 262
  Caption = 'Coleta de Embri'#227'o'
  ClientWidth = 826
  ActionList.Left = 242
  ActionList.Top = 20
  ExplicitWidth = 832
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 826
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 826
    inherited _pnlFooter: TJvPanel
      Width = 822
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 822
      inherited _imageBottom: TImage
        Width = 822
        ExplicitWidth = 822
      end
      inherited _btbPrior: TTcGDIButton
        Left = 631
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 631
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 722
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 722
      end
      inherited _btbExecute: TTcGDIButton
        Left = 737
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        Enabled = False
        ExplicitLeft = 737
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 822
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 822
      ExplicitHeight = 310
      inherited PageControl: TJvPageControl
        Width = 822
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ActivePage = TabSheet1
        ExplicitWidth = 822
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object JvDBUltimGrid1: TJvDBUltimGrid
            Left = 0
            Top = 44
            Width = 822
            Height = 243
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtsColetaEmbriao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
            OnCellClick = JvDBUltimGrid1CellClick
            OnEditButtonClick = JvDBUltimGrid1EditButtonClick
            OnEnter = JvDBUltimGrid1Enter
            OnKeyDown = JvDBUltimGrid1KeyDown
            OnKeyPress = JvDBUltimGrid1KeyPress
            AutoAppend = False
            OnShowEditor = JvDBUltimGrid1ShowEditor
            AutoSizeColumns = True
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <
              item
                ControlName = 'JvDBDateEdit1'
                FieldName = 'DATAABORTOPARTO'
                FitCell = fcCellSize
                LeaveOnEnterKey = True
                LeaveOnUpDownKey = True
              end
              item
                ControlName = 'JvDBCalcEdit1'
                FieldName = 'EMBRIOESCOLETADOS'
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
                Width = 125
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEFEMEA'
                ReadOnly = True
                Width = 116
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAEVENTO'
                ReadOnly = True
                Width = 103
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESC_EVENTO'
                ReadOnly = True
                Width = 89
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEMACHO'
                ReadOnly = True
                Width = 81
                Visible = True
              end
              item
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'NOMEFUNCIONARIO_COLETA'
                Width = 71
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAABORTOPARTO'
                Width = 61
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMBRIOESCOLETADOS'
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTEPARTO'
                ReadOnly = True
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DOADOR_RECEPTOR'
                Title.Caption = 'Doadora'
                Width = 58
                Visible = True
              end>
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 822
            Height = 44
            Align = alTop
            Caption = 'Digita'#231#227'o de dados comuns'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label1: TLabel
              Left = 19
              Top = 19
              Width = 88
              Height = 13
              Caption = 'Data da coleta:'
            end
            object lblEdPadraoFuncionario: TLabel
              Left = 249
              Top = 19
              Width = 73
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              Caption = '  Funcion'#225'rio'
            end
            object deDataEvento: TTcDateEdit
              Left = 117
              Top = 16
              Width = 104
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 19
              TabOrder = 0
              OnChange = deDataEventoChange
            end
            object edPadraoNomeFuncionario: TJvComboEdit
              Left = 331
              Top = 16
              Width = 134
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ButtonWidth = 15
              ImageKind = ikEllipsis
              TabOrder = 1
              Text = ''
              OnButtonClick = edPadraoNomeFuncionarioButtonClick
              OnChange = edPadraoNomeFuncionarioChange
              OnKeyPress = edPadraoNomeFuncionarioKeyPress
            end
          end
          object JvDBDateEdit1: TTcDBDateEdit
            Left = 442
            Top = 158
            Width = 113
            Height = 21
            Checked = False
            DataField = 'DATAABORTOPARTO'
            DataSource = dtsColetaEmbriao
            CheckOnExit = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ButtonWidth = 20
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
          object JvDBCalcEdit1: TJvDBCalcEdit
            Left = 393
            Top = 158
            Width = 32
            Height = 21
            DecimalPlaces = 0
            DisplayFormat = '0'
            MaxLength = 2
            ShowButton = False
            TabOrder = 3
            Visible = False
            DecimalPlacesAlwaysShown = False
            DataField = 'EMBRIOESCOLETADOS'
            DataSource = dtsColetaEmbriao
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 242
    Top = 20
    inherited _actExecute: TAction
      OnUpdate = _actExecuteUpdate
    end
  end
  object dtsColetaEmbriao: TDataSource
    DataSet = Zoo_ReproducaoColetaEmbriaoDatamodule.cdsColetaEmbriao
    Left = 49
    Top = 165
  end
end
