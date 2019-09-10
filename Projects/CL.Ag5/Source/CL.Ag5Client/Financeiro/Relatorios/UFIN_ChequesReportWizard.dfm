inherited FIN_ChequesReportWizard: TFIN_ChequesReportWizard
  Left = 461
  Top = 175
  Caption = 'Cheques'
  ClientHeight = 462
  ClientWidth = 618
  ActionList.Left = 178
  ActionList.Top = 4
  ExplicitWidth = 624
  ExplicitHeight = 491
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 618
    Height = 462
    ExplicitWidth = 618
    ExplicitHeight = 462
    inherited _pnlFooter: TJvPanel
      Top = 431
      Width = 614
      ExplicitTop = 431
      ExplicitWidth = 614
      inherited _imageBottom: TImage
        Width = 614
        ExplicitWidth = 614
      end
      inherited _btbPrior: TTcGDIButton
        Left = 423
        ExplicitLeft = 423
      end
      inherited _btbNext: TTcGDIButton
        Left = 514
        ExplicitLeft = 514
      end
      inherited _btbExecute: TTcGDIButton
        Left = 525
        ExplicitLeft = 525
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 614
      Height = 429
      ExplicitWidth = 614
      ExplicitHeight = 429
      inherited PageControl: TJvPageControl
        Width = 614
        Height = 429
        ActivePage = TabSheet1
        ExplicitWidth = 614
        ExplicitHeight = 429
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox1: TGroupBox
            Left = 20
            Top = 16
            Width = 430
            Height = 65
            Caption = ' Per'#237'odo '
            TabOrder = 0
            object Label1: TLabel
              Left = 10
              Top = 27
              Width = 51
              Height = 13
              Caption = 'Data inicial'
            end
            object Label2: TLabel
              Left = 232
              Top = 27
              Width = 46
              Height = 13
              Caption = 'Data final'
            end
            object deDataInicial: TTcDateEdit
              Left = 76
              Top = 24
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 0
            end
            object deDataFinal: TTcDateEdit
              Left = 295
              Top = 24
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 1
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object dbgResultado: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 614
            Height = 406
            Align = alClient
            DataSource = dtsResultado
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            AutoAppend = False
            OnShowEditor = dbgResultadoShowEditor
            AutoSizeColumns = True
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
  inherited ActionList: TInternalActionList
    Left = 178
    Top = 4
  end
  object dtsResultado: TDataSource
    AutoEdit = False
    DataSet = FIN_ChequesReportDatamodule.cdsCheques
    Left = 402
    Top = 8
  end
end
