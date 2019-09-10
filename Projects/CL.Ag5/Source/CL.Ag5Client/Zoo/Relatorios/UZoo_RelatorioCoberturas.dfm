inherited Zoo_RelatorioCoberturas: TZoo_RelatorioCoberturas
  Left = 37
  Top = 178
  Caption = 'Relat'#243'rio - Coberturas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlFooter: TJvPanel
      inherited _btbExecute: TTcGDIButton
        Caption = 'V&isualizar'
      end
    end
    inherited _pnlDetail: TJvPanel
      inherited PageControl: TJvPageControl
        ActivePage = TabSheetResultado
        object TabSheetParametros: TTabSheet
          Caption = 'TabSheetParametros'
          object Label1: TLabel
            Left = 45
            Top = 72
            Width = 111
            Height = 13
            Caption = 'Selecione um per'#237'odo : '
          end
          object Label2: TLabel
            Left = 258
            Top = 72
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object deIni: TTcDateEdit
            Left = 162
            Top = 69
            Width = 88
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 19
            TabOrder = 0
            OnKeyPress = deIniKeyPress
          end
          object deAte: TTcDateEdit
            Left = 271
            Top = 69
            Width = 86
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 19
            TabOrder = 1
            OnKeyPress = deAteKeyPress
          end
        end
        object TabSheetResultado: TTabSheet
          Caption = 'TabSheetResultado'
          object DBGridResultados: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 527
            Height = 260
            Align = alClient
            DataSource = dtsResultado
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = DBGridResultadosDblClick
            OnShowEditor = DBGridResultadosShowEditor
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
          end
          object Panel3: TPanel
            Left = 0
            Top = 260
            Width = 527
            Height = 27
            Align = alBottom
            Caption = ' '
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            object lblTotalLinhas: TLabel
              Left = 16
              Top = 7
              Width = 64
              Height = 13
              Caption = 'lblTotalLinhas'
            end
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actNext: TAction
      OnUpdate = _actNextUpdate
    end
  end
  object sqlCoberturas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  AN.KZOO_ANIMAL, AN.BRINCO,'#13#10'  AN.BRINCO_,'#13#10'  AN.NOMEES' +
      'TABULO,'#13#10'  AN.REGISTRO,'#13#10'  AM.NOMEESTABULO TOURO,'#13#10'  AM.REGISTRO' +
      ' REGISTRO_TOURO,'#13#10'  EZ.DATAEVENTO,'#13#10'  EZ.COMUNICACAO_COBERTURA,'#13 +
      #10'  (SELECT QTDE_COBERTURA FROM ZOO_GET_QTDE_COBERTURA_LACTACAO(E' +
      'Z.KZOO_ANIMAL_FEMEA, EZ.DATAEVENTO)) QTDE_COBERTURA'#13#10'FROM ZOO_EV' +
      'ENTOS_ZOOTECNICOS EZ'#13#10'INNER JOIN ZOO_ANIMAIS AN ON AN.kzoo_anima' +
      'l = EZ.kzoo_animal_femea'#13#10'LEFT JOIN ZOO_ANIMAIS AM ON AM.kzoo_an' +
      'imal = EZ.kzoo_animal_macho'#13#10'WHERE AN.KCAD_FAZENDA = :KCAD_FAZEN' +
      'DA'#13#10'  AND EZ.TIPOEVENTO <> 1'#13#10'  AND EZ.DATAEVENTO BETWEEN :DATAI' +
      'NI AND :DATAFIM'#13#10'  AND AN.STATUS <> :STATUS_DESCARTADO'#13#10'ORDER BY' +
      ' EZ.DATAEVENTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 429
    Top = 165
    object sqlCoberturasKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      FixedChar = True
    end
    object sqlCoberturasBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlCoberturasBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlCoberturasNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object sqlCoberturasREGISTRO: TStringField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object sqlCoberturasTOURO: TStringField
      DisplayLabel = 'Touro'
      FieldName = 'TOURO'
      Size = 60
    end
    object sqlCoberturasREGISTRO_TOURO: TStringField
      DisplayLabel = 'Registro touro'
      FieldName = 'REGISTRO_TOURO'
    end
    object sqlCoberturasDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data cobertura'
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object sqlCoberturasCOMUNICACAO_COBERTURA: TStringField
      DisplayLabel = 'N'#176' comunicado cob.'
      FieldName = 'COMUNICACAO_COBERTURA'
      FixedChar = True
      Size = 32
    end
    object sqlCoberturasQTDE_COBERTURA: TIntegerField
      DisplayLabel = 'N'#250'mero da cobertura'
      FieldName = 'QTDE_COBERTURA'
    end
  end
  object dspCoberturas: TDataSetProvider
    DataSet = sqlCoberturas
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 396
    Top = 117
  end
  object cdsCoberturas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCoberturas'
    AfterClose = cdsCoberturasAfterClose
    Left = 429
    Top = 68
    object cdsCoberturasKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsCoberturasBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsCoberturasBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsCoberturasNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object cdsCoberturasREGISTRO: TStringField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsCoberturasTOURO: TStringField
      DisplayLabel = 'Touro'
      FieldName = 'TOURO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object cdsCoberturasREGISTRO_TOURO: TStringField
      DisplayLabel = 'Resgistro touro'
      FieldName = 'REGISTRO_TOURO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsCoberturasDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data cobertura'
      FieldName = 'DATAEVENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsCoberturasCOMUNICACAO_COBERTURA: TStringField
      DisplayLabel = 'N'#176' comunicado cob.'
      FieldName = 'COMUNICACAO_COBERTURA'
      ProviderFlags = []
      FixedChar = True
      Size = 32
    end
    object cdsCoberturasQTDE_COBERTURA: TIntegerField
      DisplayLabel = 'N'#250'mero da cobertura'
      FieldName = 'QTDE_COBERTURA'
    end
  end
  object dtsResultado: TDataSource
    DataSet = cdsCoberturas
    Left = 467
    Top = 22
  end
end
