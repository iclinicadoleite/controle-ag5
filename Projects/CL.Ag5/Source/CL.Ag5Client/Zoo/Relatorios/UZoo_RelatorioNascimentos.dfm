inherited Zoo_RelatorioNascimentos: TZoo_RelatorioNascimentos
  Left = 497
  Top = 224
  Caption = 'Relat'#243'rio - Nascimentos'
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
            Left = 269
            Top = 72
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object deIni: TTcDateEdit
            Left = 163
            Top = 69
            Width = 91
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Checked = False
            CheckOnExit = False
            ButtonWidth = 17
            TabOrder = 0
            OnKeyPress = deIniKeyPress
          end
          object deAte: TTcDateEdit
            Left = 293
            Top = 69
            Width = 91
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Checked = False
            CheckOnExit = False
            ButtonWidth = 17
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
            Columns = <
              item
                Expanded = False
                FieldName = 'BRINCO'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEESTABULO'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NASCIMENTO'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATACOBERTURA'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SEXO'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GRAUSANGUE'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEMAE'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REGISTRO_MAE'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEPAI'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REGISTRO_PAI'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NATIMORTO'
                Title.Caption = 'Natimorto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMUNICACAO_COBERTURA'
                Width = 50
                Visible = True
              end>
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
  object dtsResultado: TDataSource
    DataSet = cdsNascimentos
    Left = 468
    Top = 90
  end
  object cdsNascimentos: TClientDataSet
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
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_SEMEM'
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
        DataType = ftString
        Name = 'NATIMORTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspNascimentos'
    Left = 425
    Top = 136
    object cdsNascimentosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsNascimentosBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = []
      Size = 15
    end
    object cdsNascimentosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsNascimentosNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = []
      Size = 60
    end
    object cdsNascimentosNASCIMENTO: TSQLTimeStampField
      DisplayLabel = 'Data nascimento'
      FieldName = 'NASCIMENTO'
      ProviderFlags = []
    end
    object cdsNascimentosDATACOBERTURA: TSQLTimeStampField
      DisplayLabel = 'Data cobertura'
      FieldName = 'DATACOBERTURA'
      ProviderFlags = []
    end
    object cdsNascimentosSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsNascimentosGRAUSANGUE: TStringField
      DisplayLabel = 'Grau sangue'
      FieldName = 'GRAUSANGUE'
      ProviderFlags = []
      FixedChar = True
      Size = 5
    end
    object cdsNascimentosNOMEMAE: TStringField
      DisplayLabel = 'Nome m'#227'e'
      FieldName = 'NOMEMAE'
      ProviderFlags = []
      Size = 60
    end
    object cdsNascimentosREGISTRO_MAE: TStringField
      DisplayLabel = 'Registro m'#227'e'
      FieldName = 'REGISTRO_MAE'
      ProviderFlags = []
    end
    object cdsNascimentosNOMEPAI: TStringField
      DisplayLabel = 'Nome pai'
      FieldName = 'NOMEPAI'
      ProviderFlags = []
      Size = 60
    end
    object cdsNascimentosREGISTRO_PAI: TStringField
      DisplayLabel = 'Registro pai'
      FieldName = 'REGISTRO_PAI'
      ProviderFlags = []
    end
    object cdsNascimentosCOMUNICACAO_COBERTURA: TStringField
      DisplayLabel = 'N'#176' comunica'#231#227'o cob.'
      FieldName = 'COMUNICACAO_COBERTURA'
      ProviderFlags = []
      FixedChar = True
      Size = 32
    end
    object cdsNascimentosNATIMORTO: TStringField
      FieldName = 'NATIMORTO'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dspNascimentos: TDataSetProvider
    DataSet = sqlNascimentos
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 396
    Top = 184
  end
  object sqlNascimentos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.KZOO_ANIMAL, A.BRINCO,'#13#10'  A.BRINCO_,'#13#10'  A.NOMEESTABU' +
      'LO,'#13#10'  FEMEA.NASCIMENTO,'#13#10'  EZ.DATAEVENTO DATACOBERTURA,'#13#10'  '#39'F'#39' ' +
      'SEXO,'#13#10'  LINHAGEM.GRAUSANGUE,'#13#10'  LINHAGEM.NOMEMAE,'#13#10'  MAE.REGIST' +
      'RO REGISTRO_MAE,'#13#10'  LINHAGEM.NOMEPAI,'#13#10'  PAI.REGISTRO REGISTRO_P' +
      'AI,'#13#10'  CASE LINHAGEM.NATIMORTO'#13#10'    WHEN '#39'T'#39' THEN '#39'Sim'#39#13#10'    ELS' +
      'E '#39'N'#227'o'#39#13#10'  END "NATIMORTO",'#13#10'  EZ.COMUNICACAO_COBERTURA'#13#10'FROM ZO' +
      'O_ANIMAIS_FEMEA FEMEA'#13#10'JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = FEM' +
      'EA.KZOO_ANIMAL_FEMEA'#13#10'JOIN ZOO_ANIMAL_LINHAGEM LINHAGEM ON LINHA' +
      'GEM.KZOO_ANIMAL = A.KZOO_ANIMAL'#13#10'LEFT JOIN ZOO_ANIMAIS MAE ON MA' +
      'E.KZOO_ANIMAL = LINHAGEM.KZOO_ANIMAL_FEMEA'#13#10'LEFT JOIN ZOO_EVENTO' +
      'S_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = LINHAGEM.KZOO_EV' +
      'ENTO_ZOOTECNICO'#13#10'LEFT JOIN ZOO_ANIMAIS PAI ON PAI.KZOO_ANIMAL = ' +
      'LINHAGEM.KZOO_ANIMAL_MACHO'#13#10'WHERE A.KCAD_FAZENDA = :KCAD_FAZENDA' +
      #13#10'  AND FEMEA.NASCIMENTO BETWEEN :DATAINI AND :DATAFIM'#13#10'UNION AL' +
      'L'#13#10'SELECT'#13#10'  A.KZOO_ANIMAL, A.BRINCO,'#13#10'  A.BRINCO_,'#13#10'  A.NOMEEST' +
      'ABULO,'#13#10'  MACHO.NASCIMENTO,'#13#10'  EZ.DATAEVENTO DATACOBERTURA,'#13#10'  '#39 +
      'M'#39' SEXO,'#13#10'  LINHAGEM.GRAUSANGUE,'#13#10'  LINHAGEM.NOMEMAE,'#13#10'  MAE.REG' +
      'ISTRO REGISTRO_MAE,'#13#10'  LINHAGEM.NOMEPAI,'#13#10'  PAI.REGISTRO REGISTR' +
      'O_PAI,'#13#10'  CASE LINHAGEM.NATIMORTO'#13#10'    WHEN '#39'T'#39' THEN '#39'Sim'#39#13#10'    ' +
      'ELSE '#39'N'#227'o'#39#13#10'  END "NATIMORTO",'#13#10'  EZ.COMUNICACAO_COBERTURA'#13#10'FROM' +
      ' ZOO_ANIMAIS_MACHO MACHO'#13#10'JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = ' +
      'MACHO.KZOO_ANIMAL_MACHO'#13#10'JOIN ZOO_ANIMAL_LINHAGEM LINHAGEM ON LI' +
      'NHAGEM.KZOO_ANIMAL = A.KZOO_ANIMAL'#13#10'LEFT JOIN ZOO_ANIMAIS MAE ON' +
      ' MAE.KZOO_ANIMAL = LINHAGEM.KZOO_ANIMAL_FEMEA'#13#10'LEFT JOIN ZOO_EVE' +
      'NTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = LINHAGEM.KZOO' +
      '_EVENTO_ZOOTECNICO'#13#10'LEFT JOIN ZOO_ANIMAIS PAI ON PAI.KZOO_ANIMAL' +
      ' = LINHAGEM.KZOO_ANIMAL_MACHO'#13#10'WHERE A.KCAD_FAZENDA = :KCAD_FAZE' +
      'NDA  AND A.STATUS <> :STATUS_SEMEM'#13#10'  AND MACHO.NASCIMENTO BETWE' +
      'EN :DATAINI AND :DATAFIM'#13#10'UNION ALL'#13#10'SELECT'#13#10'  LINHAGEM.KZOO_ANI' +
      'MAL, LINHAGEM.BRINCO,'#13#10'  right('#39'000000000000000000'#39' || LINHAGEM.' +
      'BRINCO, 16) BRINCO_,'#13#10'  LINHAGEM.NOMEANIMAL,'#13#10'  LINHAGEM.NASCIME' +
      'NTO,'#13#10'  EZ.DATAEVENTO DATACOBERTURA,'#13#10'  LINHAGEM.SEXO,'#13#10'  LINHAG' +
      'EM.GRAUSANGUE,'#13#10'  LINHAGEM.NOMEMAE,'#13#10'  MAE.REGISTRO REGISTRO_MAE' +
      ','#13#10'  LINHAGEM.NOMEPAI,'#13#10'  PAI.REGISTRO REGISTRO_PAI,'#13#10'  CASE LIN' +
      'HAGEM.NATIMORTO'#13#10'    WHEN '#39'T'#39' THEN '#39'Sim'#39#13#10'    ELSE '#39'N'#227'o'#39#13#10'  END ' +
      '"NATIMORTO",'#13#10'  EZ.COMUNICACAO_COBERTURA'#13#10'FROM ZOO_ANIMAL_LINHAG' +
      'EM LINHAGEM'#13#10'LEFT JOIN ZOO_ANIMAIS MAE ON MAE.KZOO_ANIMAL = LINH' +
      'AGEM.KZOO_ANIMAL_FEMEA'#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON ' +
      'EZ.KZOO_EVENTO_ZOOTECNICO = LINHAGEM.KZOO_EVENTO_ZOOTECNICO'#13#10'LEF' +
      'T JOIN ZOO_ANIMAIS PAI ON PAI.KZOO_ANIMAL = LINHAGEM.KZOO_ANIMAL' +
      '_MACHO'#13#10'WHERE LINHAGEM.NASCIMENTO BETWEEN :DATAINI AND :DATAFIM'#13 +
      #10'  AND LINHAGEM.NATIMORTO = :NATIMORTO'#13#10'ORDER BY 3'
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
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_SEMEM'
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
        DataType = ftString
        Name = 'NATIMORTO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 417
    Top = 232
    object sqlNascimentosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlNascimentosBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlNascimentosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlNascimentosNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object sqlNascimentosNASCIMENTO: TSQLTimeStampField
      DisplayLabel = 'Data nascimento'
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object sqlNascimentosDATACOBERTURA: TSQLTimeStampField
      DisplayLabel = 'Data cobertura'
      FieldName = 'DATACOBERTURA'
    end
    object sqlNascimentosSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object sqlNascimentosGRAUSANGUE: TStringField
      DisplayLabel = 'Grau sangue'
      FieldName = 'GRAUSANGUE'
      FixedChar = True
      Size = 5
    end
    object sqlNascimentosNOMEMAE: TStringField
      DisplayLabel = 'Nome m'#227'e'
      FieldName = 'NOMEMAE'
      Size = 60
    end
    object sqlNascimentosREGISTRO_MAE: TStringField
      DisplayLabel = 'Registro m'#227'e'
      FieldName = 'REGISTRO_MAE'
    end
    object sqlNascimentosNOMEPAI: TStringField
      DisplayLabel = 'Nome pai'
      FieldName = 'NOMEPAI'
      Size = 60
    end
    object sqlNascimentosREGISTRO_PAI: TStringField
      DisplayLabel = 'Registro pai'
      FieldName = 'REGISTRO_PAI'
    end
    object sqlNascimentosCOMUNICACAO_COBERTURA: TStringField
      DisplayLabel = 'N'#186' comunica'#231#227'o cob.'
      FieldName = 'COMUNICACAO_COBERTURA'
      FixedChar = True
      Size = 32
    end
    object sqlNascimentosNATIMORTO: TStringField
      FieldName = 'NATIMORTO'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
end
