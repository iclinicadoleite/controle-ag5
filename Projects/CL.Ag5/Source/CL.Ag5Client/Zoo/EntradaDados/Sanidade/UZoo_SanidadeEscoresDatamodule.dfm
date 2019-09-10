object Zoo_SanidadeEscoresDatamodule: TZoo_SanidadeEscoresDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsEscores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEscores'
    Left = 78
    Top = 12
    object cdsEscoresKZOO_E: TStringField
      FieldName = 'KZOO_E'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEscoresKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEscoresBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsEscoresNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsEscoresDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object cdsEscoresLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsEscoresKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEscoresNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Required = True
      OnSetText = cdsEscoresNOMEFUNCIONARIOSetText
      Size = 128
    end
  end
  object dspEscores: TDataSetProvider
    DataSet = sqlEscores
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlEscores: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'SELECT * '
      'FROM ZOO_E_F0')
    Left = 73
    Top = 100
    object sqlEscoresKZOO_E: TStringField
      FieldName = 'KZOO_E'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEscoresKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEscoresDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlEscoresLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlEscoresKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object sqlEscoresNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
  end
  object cdsListaEscores: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaEscores'
    BeforeOpen = cdsListaEscoresBeforeOpen
    Left = 224
    Top = 20
    object cdsListaEscoresKZOO_CFGESCORE: TStringField
      FieldName = 'KZOO_CFGESCORE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsListaEscoresTABLE_ID: TIntegerField
      FieldName = 'TABLE_ID'
      Visible = False
    end
    object cdsListaEscoresTIPOESCORE: TStringField
      FieldName = 'TIPOESCORE'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsListaEscoresSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 32
    end
    object cdsListaEscoresNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsListaEscoresOBS: TMemoField
      FieldName = 'OBS'
      Visible = False
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspListaEscores: TDataSetProvider
    DataSet = sqlListaEscores
    Options = [poIncFieldProps, poUseQuoteChar]
    Left = 184
    Top = 64
  end
  object sqlListaEscores: TTcSQLDataSet
    SchemaName = 'sysdba'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    SQL = (
      'SELECT'
      ' KZOO_CFGESCORE, '
      ' TABLE_ID, '
      ' TIPOESCORE,'
      ' SIGLA, '
      ' NOME, '
      ' OBS'
      'FROM  ZOO_CFGESCORES'
      'WHERE KCAD_FAZENDA = :KCAD_FAZENDA AND ATIVO = '#39'T'#39)
    Left = 240
    Top = 116
    object sqlListaEscoresKZOO_CFGESCORE: TStringField
      FieldName = 'KZOO_CFGESCORE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlListaEscoresTABLE_ID: TIntegerField
      FieldName = 'TABLE_ID'
      Visible = False
    end
    object sqlListaEscoresTIPOESCORE: TStringField
      FieldName = 'TIPOESCORE'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlListaEscoresSIGLA: TStringField
      DisplayLabel = 'Escore'
      FieldName = 'SIGLA'
      Required = True
      Size = 32
    end
    object sqlListaEscoresNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlListaEscoresOBS: TMemoField
      DisplayLabel = 'Lagenda'
      FieldName = 'OBS'
      Visible = False
      BlobType = ftMemo
      Size = 1
    end
  end
end
