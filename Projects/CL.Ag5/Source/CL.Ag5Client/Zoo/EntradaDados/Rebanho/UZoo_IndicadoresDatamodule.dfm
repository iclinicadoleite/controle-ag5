object Zoo_IndicadoresDatamodule: TZoo_IndicadoresDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsIndicadores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIndicadores'
    OnNewRecord = cdsIndicadoresNewRecord
    Left = 78
    Top = 12
    object cdsIndicadoresKZOO_I: TStringField
      FieldName = 'KZOO_I'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsIndicadoresDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object cdsIndicadoresKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object cdsIndicadoresNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = cdsIndicadoresNOMEFUNCIONARIOSetText
      Size = 128
    end
  end
  object dspIndicadores: TDataSetProvider
    DataSet = sqlIndicadores
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlIndicadores: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 'SELECT * '#13#10'FROM ZOO_I_F0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlIndicadoresKZOO_I: TStringField
      FieldName = 'KZOO_I'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlIndicadoresDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlIndicadoresKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object sqlIndicadoresNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
  end
end
