inherited FIN_AjustaSaldoWizard: TFIN_AjustaSaldoWizard
  Left = 396
  Top = 233
  Caption = 'Compensa'#231#227'o de cheques'
  ClientWidth = 780
  ExplicitWidth = 796
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlFicha: TPanel
    Width = 780
    ExplicitWidth = 780
    inherited _pnlFooter: TPanel
      Width = 778
      TabOrder = 2
      ExplicitWidth = 778
      inherited _imageBottom: TImage
        Width = 778
        ExplicitWidth = 778
      end
      inherited _ToolBar: TToolBar
        Left = 84
        Top = 3
        ExplicitLeft = 84
        ExplicitTop = 3
      end
    end
    inherited _ScrollBoxFicha: TScrollBox
      Top = 30
      Width = 778
      Height = 437
      TabOrder = 1
      ExplicitTop = 30
      ExplicitWidth = 778
      ExplicitHeight = 437
      inherited _dbgLista: TJvDBUltimGrid
        Width = 778
        Height = 437
        BorderStyle = bsNone
        AutoAppend = False
        BevelKind = bkTile
        OnShowEditor = dbgAjusteSaldoShowEditor
        AlternateRowColor = clBtnFace
        EditControls = <
          item
            ControlName = 'dbDt_Compensacao'
            FieldName = 'DT_COMPENSACAO'
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
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMECONTA'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AGENCIA'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTA_CORRENTE'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VENCTO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAGTO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HISTORICO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOCUMENTO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_CHEQUE'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_COMPENSACAO'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Width = 60
            Visible = True
          end>
      end
      object dbDt_Compensacao: TTcDBDateEdit
        Left = 455
        Top = 40
        Width = 121
        Height = 21
        Checked = False
        DataField = 'DT_COMPENSACAO'
        DataSource = dtsFicha
        CheckOnExit = False
        Color = clWhite
        StartOfWeek = Sun
        TabOrder = 1
        Visible = False
      end
      object DBMemo1: TDBMemo
        Left = 590
        Top = 40
        Width = 185
        Height = 65
        DataField = 'OBS'
        DataSource = dtsFicha
        TabOrder = 2
        Visible = False
      end
    end
    object _pnlSearch: TPanel
      Left = 1
      Top = 1
      Width = 778
      Height = 29
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      Caption = ' '
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object cbCompensados: TCheckBox
        Left = 71
        Top = 7
        Width = 153
        Height = 17
        Caption = 'Exibir compensados'
        TabOrder = 0
        OnClick = cbCompensadosClick
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actNew: TAction
      Enabled = False
    end
    inherited _actDelete: TAction
      Visible = False
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = FIN_AjustaSaldoDatamodule.cdsLstAjustaSaldo
    Left = 488
    Top = 8
  end
end
