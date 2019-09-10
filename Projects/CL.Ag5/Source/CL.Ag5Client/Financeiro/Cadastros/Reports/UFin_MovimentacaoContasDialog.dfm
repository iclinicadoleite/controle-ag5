inherited FIN_MovimentacaoContasDialog: TFIN_MovimentacaoContasDialog
  Left = 542
  Top = 256
  Caption = 'Movimenta'#231#227'o banc'#225'ria'
  ClientHeight = 396
  ClientWidth = 564
  ActionList.Left = 106
  ActionList.Top = 4
  ExplicitWidth = 570
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 564
    Height = 396
    ExplicitWidth = 564
    ExplicitHeight = 396
    inherited _pnlFooter: TJvPanel
      Top = 365
      Width = 560
      ExplicitTop = 365
      ExplicitWidth = 560
      inherited _imageBottom: TImage
        Width = 560
        ExplicitWidth = 560
      end
      inherited _btbPrior: TTcGDIButton
        Left = 369
        ExplicitLeft = 369
      end
      inherited _btbNext: TTcGDIButton
        Left = 460
        ExplicitLeft = 460
      end
      inherited _btbExecute: TTcGDIButton
        Left = 475
        ExplicitLeft = 475
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 560
      Height = 363
      ExplicitWidth = 560
      ExplicitHeight = 363
      inherited PageControl: TJvPageControl
        Width = 560
        Height = 363
        ActivePage = TabSheet1
        ExplicitWidth = 560
        ExplicitHeight = 363
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object GroupBox1: TGroupBox
            Left = 22
            Top = 71
            Width = 523
            Height = 225
            Caption = 'Selecionar contas'
            TabOrder = 1
            object JvDBUltimGrid4: TJvDBUltimGrid
              Left = 2
              Top = 47
              Width = 519
              Height = 176
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtsContas
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentColor = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = JvDBUltimGrid4CellClick
              OnKeyPress = JvDBUltimGrid4KeyPress
              AutoAppend = False
              OnShowEditor = JvDBUltimGrid4ShowEditor
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              OnCheckIfBooleanField = JvDBUltimGrid4CheckIfBooleanField
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SELECT'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BANCO'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'AGENCIA'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONTA_CORRENTE'
                  Width = 100
                  Visible = True
                end>
            end
            object Panel4: TPanel
              Left = 2
              Top = 15
              Width = 519
              Height = 32
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object cbSelectAll: TCheckBox
                Left = 21
                Top = 4
                Width = 161
                Height = 17
                Caption = 'Todas as contas'
                TabOrder = 0
                OnClick = cbSelectAllClick
              end
            end
          end
          object GroupBox2: TGroupBox
            Left = 22
            Top = 3
            Width = 523
            Height = 62
            Caption = 'Per'#237'odo'
            TabOrder = 0
            object Label1: TLabel
              Left = 23
              Top = 25
              Width = 25
              Height = 13
              Caption = 'Inicio'
            end
            object Label2: TLabel
              Left = 283
              Top = 25
              Width = 38
              Height = 13
              Caption = 'Termino'
            end
            object edInicio: TTcDateEdit
              Left = 77
              Top = 22
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 22
              TabOrder = 0
            end
            object edTermino: TTcDateEdit
              Left = 359
              Top = 22
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              ButtonWidth = 22
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
          object DBGridMovimentacao: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 560
            Height = 306
            Align = alClient
            DataSource = dtsMovimentacao
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            TitleButtons = True
            OnGetCellProps = DBGridMovimentacaoGetCellProps
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            SortWith = swUserFunc
            OnUserSort = DBGridMovimentacaoUserSort
          end
          object Panel1: TPanel
            Left = 0
            Top = 306
            Width = 560
            Height = 34
            Align = alBottom
            Caption = ' '
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            DesignSize = (
              560
              34)
            object Label32: TLabel
              Left = 230
              Top = 8
              Width = 163
              Height = 15
              Anchors = [akTop, akRight]
              Caption = 'Total de todas as contas  R$ :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'DINPro-Regular'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              StyleElements = [seClient, seBorder]
            end
            object TotalContasLabel: TLabel
              Left = 404
              Top = 9
              Width = 134
              Height = 15
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              AutoSize = False
              Caption = '9.999.999.999,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'DINPro-Regular'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              StyleElements = [seClient, seBorder]
            end
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 106
    Top = 4
    inherited _actNext: TAction
      OnUpdate = _actNextUpdate
    end
  end
  object dtsContas: TDataSource
    DataSet = cdsLstContas
    Left = 111
    Top = 248
  end
  object cdsLstContas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstContas'
    BeforeOpen = cdsLstContasBeforeOpen
    OnCalcFields = cdsLstContasCalcFields
    Left = 60
    Top = 197
    object cdsLstContasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Required = True
      FixedChar = True
    end
    object cdsLstContasKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      FixedChar = True
    end
    object cdsLstContasSELECT: TIntegerField
      DisplayLabel = 'Selecionar'
      FieldKind = fkInternalCalc
      FieldName = 'SELECT'
    end
    object cdsLstContasNOME: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOME'
      ReadOnly = True
      Size = 64
    end
    object cdsLstContasBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ReadOnly = True
      Size = 134
    end
    object cdsLstContasAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ReadOnly = True
      Size = 32
    end
    object cdsLstContasCONTA_CORRENTE: TStringField
      DisplayLabel = 'N'#250'mero da conta'
      FieldName = 'CONTA_CORRENTE'
      ReadOnly = True
      Size = 128
    end
  end
  object dspLstContas: TDataSetProvider
    DataSet = sqlLstContas
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 36
    Top = 249
  end
  object sqlLstContas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  C.KFIN_CONTA,'
      '  C.KFIN_BANCO,'
      '  C.NOME,'
      '  B.CODIGO || '#39' - '#39' ||  B.NOME BANCO,'
      '  C.AGENCIA,'
      '  C.CONTA_CORRENTE'
      'FROM FIN_CONTAS C'
      'LEFT JOIN FIN_BANCOS B ON B.KFIN_BANCO = C.KFIN_BANCO'
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND C.ATIVA = '#39'T'#39)
    Left = 63
    Top = 303
    object sqlLstContasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Required = True
      FixedChar = True
    end
    object sqlLstContasKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      FixedChar = True
    end
    object sqlLstContasNOME: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object sqlLstContasBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 134
    end
    object sqlLstContasAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Size = 32
    end
    object sqlLstContasCONTA_CORRENTE: TStringField
      DisplayLabel = 'N'#250'mero da conta'
      FieldName = 'CONTA_CORRENTE'
      Size = 128
    end
  end
  object dtsMovimentacao: TDataSource
    DataSet = FIN_MovimentacaoContasDataModule.cdsMovimentacao
    Left = 490
    Top = 73
  end
end
