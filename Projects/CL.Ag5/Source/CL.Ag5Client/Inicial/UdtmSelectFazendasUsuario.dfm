object dtmSelectFazendasUsuario: TdtmSelectFazendasUsuario
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsFazendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'KSYSUSER'
        ParamType = ptInput
      end>
    ProviderName = 'dspFazendas'
    OnNewRecord = cdsFazendasNewRecord
    Left = 78
    Top = 12
    object cdsFazendasKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      FixedChar = True
    end
    object cdsFazendasKSYSUSER: TStringField
      FieldName = 'KSYSUSER'
      FixedChar = True
    end
    object cdsFazendasAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 128
    end
  end
  object dspFazendas: TDataSetProvider
    DataSet = sqlFazendas
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspFazendasBeforeUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlFazendas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'KSYSUSER'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT'
      '  F.KCAD_FAZENDA,'
      '  UF."KSYS$USER" KSYSUSER,'
      '  E.APELIDO'
      'FROM CAD_FAZENDAS  F'
      
        'LEFT JOIN CAD_ENTIDADES E ON ( E.KCAD_ENTIDADE = F.KCAD_FAZENDA ' +
        ')'
      
        'LEFT JOIN CAD_USUARIOS_FAZENDA UF ON ( ( UF."KSYS$USER" = :KSYSU' +
        'SER ) AND ( UF.KCAD_FAZENDA = F.KCAD_FAZENDA ) )')
    Left = 73
    Top = 100
    object sqlFazendasKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      FixedChar = True
    end
    object sqlFazendasKSYSUSER: TStringField
      FieldName = 'KSYSUSER'
      FixedChar = True
    end
    object sqlFazendasAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 128
    end
  end
end
