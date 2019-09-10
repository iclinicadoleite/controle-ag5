inherited SYS_ConfigBackupWizard: TSYS_ConfigBackupWizard
  Left = 363
  Top = 241
  Caption = 'Configura'#231#227'o de backup'
  ClientHeight = 475
  ClientWidth = 718
  ExplicitWidth = 724
  ExplicitHeight = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 718
    Height = 475
    ExplicitWidth = 718
    ExplicitHeight = 475
    inherited _pnlFooter: TJvPanel
      Top = 444
      Width = 714
      ExplicitTop = 444
      ExplicitWidth = 714
      inherited _imageBottom: TImage
        Width = 714
        ExplicitWidth = 714
      end
      inherited _btbPrior: TTcGDIButton
        Left = 523
        ExplicitLeft = 523
      end
      inherited _btbNext: TTcGDIButton
        Left = 614
        ExplicitLeft = 614
      end
      inherited _btbExecute: TTcGDIButton
        Left = 612
        Top = 1
        ExplicitLeft = 612
        ExplicitTop = 1
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 714
      Height = 442
      ExplicitWidth = 714
      ExplicitHeight = 442
      inherited PageControl: TJvPageControl
        Width = 714
        Height = 442
        ActivePage = TabSheet1
        ExplicitWidth = 714
        ExplicitHeight = 442
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            714
            419)
          object Label1: TLabel
            Left = 7
            Top = 20
            Width = 366
            Height = 19
            Caption = 'Configura'#231#227'o de envio de backup autom'#225'tico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 7
            Top = 337
            Width = 743
            Height = 13
            Caption = 
              'Marque os m'#243'dulos de cada fazenda que dever'#227'o ser enviados autom' +
              'aticamente  para a Cl'#237'nica do Leite, informando o dia de envio.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object JvDBUltimGrid1: TJvDBUltimGrid
            Left = 7
            Top = 53
            Width = 701
            Height = 264
            Anchors = [akLeft, akTop, akRight]
            DataSource = dtsLstFazendas
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = JvDBUltimGrid1CellClick
            OnKeyPress = JvDBUltimGrid1KeyPress
            OnMouseActivate = JvDBUltimGrid1MouseActivate
            AutoAppend = False
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            OnCheckIfBooleanField = JvDBUltimGrid1CheckIfBooleanField
            Columns = <
              item
                Expanded = False
                FieldName = 'KSYS$DOMAIN'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DOMAIN_DESCR'
                ReadOnly = True
                Title.Caption = 'C'#243'digo'
                Width = 106
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DOMAIN_NAME'
                ReadOnly = True
                Title.Caption = 'Fazenda'
                Width = 225
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SEND_BKP_ZOO'
                Title.Alignment = taCenter
                Title.Caption = 'Zoot'#233'cnico'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SEND_BKP_FIN'
                Title.Alignment = taCenter
                Title.Caption = 'Financeiro'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'SEND_DAYNUMBER'
                Title.Alignment = taCenter
                Title.Caption = 'Dia de envio'
                Width = 65
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'SYNC_LASTDATE'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Data '#218'ltimo Envio'
                Width = 100
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'SYNC_STATUS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Status '#218'ltimo Envio'
                Width = 100
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'SEND_NEXTDATE'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Pr'#243'ximo envio'
                Width = 80
                Visible = True
              end>
          end
        end
      end
    end
  end
  object dtsLstFazendas: TDataSource
    DataSet = SYS_ConfigBackupDataModule.cdsFazendas
    Left = 66
    Top = 124
  end
end
