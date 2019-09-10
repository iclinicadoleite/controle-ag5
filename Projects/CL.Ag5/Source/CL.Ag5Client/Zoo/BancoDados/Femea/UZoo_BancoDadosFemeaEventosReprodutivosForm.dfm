object Zoo_BancoDadosFemeaEventosReprodutivosForm: TZoo_BancoDadosFemeaEventosReprodutivosForm
  Left = 287
  Top = 266
  Caption = 'Zoo_BancoDadosFemeaEventosReprodutivosForm'
  ClientHeight = 462
  ClientWidth = 1070
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel11: TPanel
    Left = 0
    Top = 0
    Width = 1070
    Height = 462
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    Caption = '_pnldbgLista'
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object dbgEventosReprodutivos: TJvDBUltimGrid
      Left = 1
      Top = 1
      Width = 1068
      Height = 460
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtsEventosZootecnicos
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnEditButtonClick = dbgEventosReprodutivosEditButtonClick
      OnKeyDown = dbgEventosReprodutivosKeyDown
      OnKeyPress = dbgEventosReprodutivosKeyPress
      OnGetCellParams = dbgEventosReprodutivosGetCellParams
      OnShowEditor = dbgEventosReprodutivosShowEditor
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <
        item
          ControlName = 'deDataEvento'
          FieldName = 'DATAEVENTO'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'deDataToque'
          FieldName = 'DATATOQUE'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'deDataAbortoParto'
          FieldName = 'DATAABORTOPARTO'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'dbmObsEvento'
          FieldName = 'OBS_EVENTO'
          FitCell = fcDesignSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'dblcDescPartoAborto'
          FieldName = 'DESC_PARTOABORTO'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
        end
        item
          ControlName = 'cbStatusPrenhez'
          FieldName = 'DESC_PRENHEZ'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
        end
        item
          ControlName = 'dblcProtocoloIATF'
          FieldName = 'DESC_PROTOCOLO_IATF'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
        end
        item
          ControlName = 'dblcSexoCria'
          FieldName = 'DESC_SEXO_CRIA'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
        end
        item
          ControlName = 'cbStatusGemelar'
          FieldName = 'DESC_GEMELAR'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
        end>
      RowsHeight = 17
      TitleRowHeight = 17
      OnCheckIfBooleanField = dbgEventosReprodutivosCheckIfBooleanField
      Columns = <
        item
          Expanded = False
          FieldName = 'QTDE_COBERTURA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAEVENTO'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_EVENTO'
          Width = 57
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'NOMEMACHO'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATATOQUE'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_PRENHEZ'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REEXAMINAR'
          Width = -1
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESC_GEMELAR'
          Title.Caption = 'Gemelar'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESC_SEXO_CRIA'
          Title.Caption = 'Sexo da Cria'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PREVISAOPARTO'
          ReadOnly = True
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAABORTOPARTO'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_PARTOABORTO'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IATF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESC_PROTOCOLO_IATF'
          Width = 72
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'NUMEROFILHOS'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMBRIOESCOLETADOS'
          Width = 72
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'NOMEFUNCIONARIO'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMUNICACAO_COBERTURA'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_EVENTO'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IEE'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESC_MUCO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DOSES'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PROTOCOLO_TOQUE'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PROTOCOLO_PARTO'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IEP_MESES'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDADE_MESES'
          ReadOnly = True
          Visible = False
        end>
    end
    object deDataEvento: TTcDBDateEdit
      Left = 48
      Top = 64
      Width = 121
      Height = 21
      Checked = False
      DataField = 'DATAEVENTO'
      DataSource = dtsEventosZootecnicos
      CheckOnExit = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object deDataToque: TTcDBDateEdit
      Left = 288
      Top = 72
      Width = 121
      Height = 21
      Checked = False
      DataField = 'DATATOQUE'
      DataSource = dtsEventosZootecnicos
      CheckOnExit = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object deDataAbortoParto: TTcDBDateEdit
      Left = 528
      Top = 104
      Width = 121
      Height = 21
      Checked = False
      DataField = 'DATAABORTOPARTO'
      DataSource = dtsEventosZootecnicos
      CheckOnExit = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object dbmObsEvento: TDBMemo
      Left = 724
      Top = 248
      Width = 185
      Height = 89
      DataField = 'OBS_EVENTO'
      DataSource = dtsEventosZootecnicos
      TabOrder = 4
      Visible = False
    end
    object dblcDescPartoAborto: TDBLookupComboBox
      Left = 528
      Top = 140
      Width = 119
      Height = 21
      DataField = 'ABORTOPARTO'
      DataSource = dtsEventosZootecnicos
      KeyField = 'VALOR'
      ListField = 'DESCRICAO'
      ListSource = dtsStatusGestacao
      TabOrder = 5
      Visible = False
    end
    object cbStatusPrenhez: TJvDBComboBox
      Left = 298
      Top = 139
      Width = 145
      Height = 22
      Style = csOwnerDrawVariable
      DataField = 'PRENHEZ'
      DataSource = dtsEventosZootecnicos
      DropDownWidth = 250
      TabOrder = 6
      Visible = False
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.KeyField = 'VALOR'
      ListSettings.DisplayField = 'DESCRICAO'
      ListSettings.DataSource = dtsStatusPrenhez
      OnEnter = cbStatusPrenhezEnter
      OnExit = cbStatusPrenhezExit
      OnKeyDown = cbStatusPrenhezKeyDown
    end
    object dblcProtocoloIATF: TDBLookupComboBox
      Left = 530
      Top = 220
      Width = 119
      Height = 21
      DataField = 'DESC_PROTOCOLO_IATF'
      DataSource = dtsEventosZootecnicos
      TabOrder = 7
      Visible = False
    end
    object dblcSexoCria: TDBLookupComboBox
      Left = 528
      Top = 176
      Width = 145
      Height = 21
      DataField = 'SEXO_CRIA'
      DataSource = dtsEventosZootecnicos
      KeyField = 'VALOR'
      ListField = 'DESCRICAO'
      ListSource = dsSexoCria
      TabOrder = 8
      Visible = False
    end
    object cbStatusGemelar: TJvDBComboBox
      Left = 298
      Top = 176
      Width = 145
      Height = 22
      Style = csOwnerDrawVariable
      DataField = 'GEMELAR'
      DataSource = dtsEventosZootecnicos
      DropDownWidth = 100
      TabOrder = 9
      Visible = False
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.KeyField = 'VALOR'
      ListSettings.DisplayField = 'DESCRICAO'
      ListSettings.DataSource = dsStatusGemelar
    end
  end
  object ActionList: TInternalActionList
  end
  object dtsEventosZootecnicos: TDataSource
    DataSet = Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivos
    OnDataChange = dtsEventosZootecnicosDataChange
    Left = 613
    Top = 54
  end
  object dtsStatusPrenhez: TDataSource
    DataSet = Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsStatusPrenhez
    Left = 652
    Top = 56
  end
  object dtsStatusGestacao: TDataSource
    DataSet = Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsStatusGestacao
    Left = 724
    Top = 72
  end
  object dtsProtocolosIATF: TDataSource
    Left = 840
    Top = 64
  end
  object dsSexoCria: TDataSource
    DataSet = Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsSexoCria
    Left = 796
    Top = 124
  end
  object dsStatusGemelar: TDataSource
    DataSet = Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsStatusGemelar
    Left = 792
    Top = 176
  end
end
