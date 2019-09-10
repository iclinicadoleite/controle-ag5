object Zoo_CfgParamNovilhasDatamodule: TZoo_CfgParamNovilhasDatamodule
  OldCreateOrder = True
  Left = 518
  Top = 161
  Height = 239
  Width = 481
  object cdsEdit: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspEdit'
    BeforeOpen = cdsEditBeforeOpen
    BeforeInsert = cdsEditBeforeInsert
    BeforeDelete = cdsEditBeforeDelete
    OnNewRecord = cdsEditNewRecord
    Left = 78
    Top = 12
    object cdsEditKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEditSYS_VALUE: TStringField
      FieldName = 'SYS$VALUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 31
    end
    object cdsEditDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 255
    end
    object cdsEditVALOR: TIntegerField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object cdsEditATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEditINTERNAL: TStringField
      DisplayLabel = 'Interno'
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEditSYSUU: TStringField
      FieldName = 'SYS$UU'
      ReadOnly = True
      Size = 32
    end
    object cdsEditSYSDU: TSQLTimeStampField
      FieldName = 'SYS$DU'
      ReadOnly = True
    end
  end
  object dspEdit: TDataSetProvider
    DataSet = sqlEdit
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlEdit: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  C.KCAD_FAZENDA, '#13#10'  C.SYS$VALUE,'#13#10'  T.SYS$DESCRIPTION' +
      ' DESCRICAO,'#13#10'  C.VALOR, '#13#10'  C.ATIVO, '#13#10'  C.INTERNAL,'#13#10'  C.SYS$UU' +
      ','#13#10'  C.SYS$DU'#13#10'FROM ZOO_CFGPARAMNOVILHAS C'#13#10'LEFT JOIN SYS$TYPES ' +
      'T ON  T.SYS$TYPE = '#39'PARAM_NOVILHAS'#39' AND T.SYS$VALUE = C.SYS$VALU' +
      'E'#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlEditKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlEditSYS_VALUE: TStringField
      FieldName = 'SYS$VALUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 31
    end
    object sqlEditDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 255
    end
    object sqlEditVALOR: TIntegerField
      FieldName = 'VALOR'
    end
    object sqlEditATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEditINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEditSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 32
    end
    object sqlEditSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
  end
end
