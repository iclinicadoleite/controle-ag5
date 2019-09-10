object dtmSelectUsuariosFazenda: TdtmSelectUsuariosFazenda
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspUsuarios'
    OnNewRecord = cdsUsuariosNewRecord
    Left = 78
    Top = 12
    object cdsUsuariosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object cdsUsuariosKSYSUSER: TStringField
      FieldName = 'KSYSUSER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsUsuariosNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = sqlUsuarios
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspUsuariosBeforeUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlUsuarios: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT '
      '  U."KSYS$USER" KSYSUSER,'
      '  UF.KCAD_FAZENDA, '
      '  U.LOGIN,'
      '  E.NOME'
      'FROM "SYS$USERS"  U'
      
        'LEFT JOIN CAD_USUARIOS_FAZENDA UF ON ( ( UF.KCAD_FAZENDA = :KCAD' +
        '_FAZENDA ) AND ( UF."KSYS$USER" = U."KSYS$USER")  )'
      'LEFT JOIN CAD_ENTIDADES E ON E.KCAD_ENTIDADE = U.KSYS$USER')
    Left = 73
    Top = 100
    object sqlUsuariosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object sqlUsuariosKSYSUSER: TStringField
      FieldName = 'KSYSUSER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlUsuariosNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
  end
end
