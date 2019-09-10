object CAD_TiposDatamodule: TCAD_TiposDatamodule
  OldCreateOrder = True
  Height = 274
  Width = 550
  object cdsLstTiposCadastros: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCRICAO'
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspLsttiposCadastros'
    OnNewRecord = cdsLstTiposCadastrosNewRecord
    Left = 77
    Top = 44
    object cdsLstTiposCadastrosKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstTiposCadastrosKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsLstTiposCadastrosTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Visible = False
    end
    object cdsLstTiposCadastrosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
  end
  object cdsTiposCadastros: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_TIPOS'
        ParamType = ptInput
      end>
    ProviderName = 'dspTiposCadastros'
    BeforePost = cdsTiposCadastrosBeforePost
    OnNewRecord = cdsTiposCadastrosNewRecord
    Left = 226
    Top = 44
    object cdsTiposCadastrosKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsTiposCadastrosKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsTiposCadastrosTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
    end
    object cdsTiposCadastrosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
  end
  object dspLsttiposCadastros: TDataSetProvider
    DataSet = sqlLstTiposCadastro
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 89
  end
  object dspTiposCadastros: TDataSetProvider
    DataSet = sqlTiposCadastros
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 196
    Top = 89
  end
  object sqlLstTiposCadastro: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT'
      '    KCAD_TIPOS,'
      '    KSYS$DOMAIN,'
      '    TIPO,'
      '    DESCRICAO'
      'FROM CAD_TIPOS'
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND TIPO = :TIPO'
      'ORDER BY DESCRICAO')
    Left = 71
    Top = 133
    object sqlLstTiposCadastroKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLstTiposCadastroKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlLstTiposCadastroTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Visible = False
    end
    object sqlLstTiposCadastroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
  end
  object sqlTiposCadastros: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_TIPOS'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT'
      '    KCAD_TIPOS,'
      '    KSYS$DOMAIN,'
      '    TIPO,'
      '    DESCRICAO'
      'FROM CAD_TIPOS'
      'WHERE KCAD_TIPOS = :KCAD_TIPOS')
    Left = 228
    Top = 134
    object sqlTiposCadastrosKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlTiposCadastrosKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlTiposCadastrosTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
    end
    object sqlTiposCadastrosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstTiposCadastros
    Left = 132
    Top = 8
  end
end
