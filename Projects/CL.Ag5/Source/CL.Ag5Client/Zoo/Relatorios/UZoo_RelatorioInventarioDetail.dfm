inherited Zoo_RelatorioInventarioDetail: TZoo_RelatorioInventarioDetail
  Left = 409
  Top = 149
  Caption = 'Detalhes invent'#225'rio'
  ClientHeight = 525
  ClientWidth = 804
  OldCreateOrder = False
  ExplicitWidth = 810
  ExplicitHeight = 554
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 804
    Height = 525
    ExplicitWidth = 804
    ExplicitHeight = 525
    inherited _pnlDetail: TJvPanel
      Width = 800
      Height = 484
      ExplicitWidth = 800
      ExplicitHeight = 484
      object JvDBUltimGrid1: TJvDBUltimGrid
        Left = 0
        Top = 0
        Width = 800
        Height = 484
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = JvDBUltimGrid1DblClick
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
      end
    end
    inherited _pnlFooter: TJvPanel
      Top = 486
      Width = 800
      Height = 37
      ExplicitTop = 486
      ExplicitWidth = 800
      ExplicitHeight = 37
      inherited _imageBottom: TImage
        Width = 800
        Height = 37
        ExplicitWidth = 880
        ExplicitHeight = 30
      end
      object _btbCancel: TTcGDIButton
        Left = 576
        Top = 5
        Width = 100
        Height = 29
        Anchors = [akRight, akBottom]
        Caption = 'Cancela&r'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ModalResult = 2
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
      object _btbSave: TTcGDIButton
        Left = 692
        Top = 5
        Width = 100
        Height = 29
        Anchors = [akRight, akBottom]
        Caption = '&OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ModalResult = 1
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 1
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
    end
  end
  object cdsInventario: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KZOO_CFGCATEGORIA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_ANIMAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BRINCO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOMECOMPLETO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOMEESTABULO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'STATUS_ANIMAL'
        DataType = ftInteger
      end
      item
        Name = 'SEXO_ANIMAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IDADE_DIAS'
        DataType = ftInteger
      end
      item
        Name = 'NL'
        DataType = ftInteger
      end
      item
        Name = 'DEL'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_CFGCATEGORIA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_CFGCATEGORIA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_CFGCATEGORIA'
        ParamType = ptInput
      end>
    ProviderName = 'dspInventario'
    StoreDefs = True
    Left = 245
    Top = 107
    object cdsInventarioKZOO_CFGCATEGORIA: TStringField
      FieldName = 'KZOO_CFGCATEGORIA'
      Visible = False
      FixedChar = True
    end
    object cdsInventarioKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsInventarioBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsInventarioNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object cdsInventarioNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsInventarioDESCR_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusAnimal
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS_ANIMAL'
      Lookup = True
    end
    object cdsInventarioSTATUS_ANIMAL: TIntegerField
      FieldName = 'STATUS_ANIMAL'
      Visible = False
    end
    object cdsInventarioSEXO_ANIMAL: TStringField
      FieldName = 'SEXO_ANIMAL'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioIDADE_DIAS: TIntegerField
      FieldName = 'IDADE_DIAS'
    end
    object cdsInventarioNL: TIntegerField
      FieldName = 'NL'
    end
    object cdsInventarioDEL: TIntegerField
      FieldName = 'DEL'
    end
  end
  object dspInventario: TDataSetProvider
    DataSet = sqlInventario
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 212
    Top = 153
  end
  object sqlInventario: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' D.KZOO_CFGCATEGORIA, '#13#10' D.KZOO_ANIMAL, '#13#10' D.BRINCO, '#13#10 +
      ' A.NOMECOMPLETO, '#13#10' A.NOMEESTABULO,'#13#10' D.DEL, '#13#10' D.IDADE_DIAS, '#13#10 +
      ' D.NL, '#13#10' D.SEXO_ANIMAL, '#13#10' D.STATUS_ANIMAL'#13#10' FROM ZOO_INVENTARI' +
      'O_DETAIL D'#13#10'LEFT JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = D.KZOO_AN' +
      'IMAL'#13#10'WHERE ( :KZOO_CFGCATEGORIA  IS NULL  AND KZOO_CFGCATEGORIA' +
      ' IS NULL )'#13#10'     OR   ( :KZOO_CFGCATEGORIA  IS NOT NULL  AND KZO' +
      'O_CFGCATEGORIA = :KZOO_CFGCATEGORIA )'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_CFGCATEGORIA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_CFGCATEGORIA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_CFGCATEGORIA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 242
    Top = 200
    object sqlInventarioKZOO_CFGCATEGORIA: TStringField
      FieldName = 'KZOO_CFGCATEGORIA'
      FixedChar = True
    end
    object sqlInventarioKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlInventarioBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlInventarioNOMECOMPLETO: TStringField
      DisplayLabel = 'Nome completo'
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object sqlInventarioNOMEESTABULO: TStringField
      DisplayLabel = 'Nome estabulo'
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object sqlInventarioSTATUS_ANIMAL: TIntegerField
      FieldName = 'STATUS_ANIMAL'
    end
    object sqlInventarioSEXO_ANIMAL: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO_ANIMAL'
      FixedChar = True
      Size = 1
    end
    object sqlInventarioIDADE_DIAS: TIntegerField
      DisplayLabel = 'Idade (dias)'
      FieldName = 'IDADE_DIAS'
    end
    object sqlInventarioNL: TIntegerField
      FieldName = 'NL'
    end
    object sqlInventarioDEL: TIntegerField
      FieldName = 'DEL'
    end
  end
  object cdsStatusAnimal: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 384
    Top = 112
    object cdsStatusAnimalTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsInventario
    Left = 318
    Top = 77
  end
end
