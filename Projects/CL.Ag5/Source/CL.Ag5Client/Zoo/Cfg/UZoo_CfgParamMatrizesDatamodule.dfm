object Zoo_CfgParamMatrizesDatamodule: TZoo_CfgParamMatrizesDatamodule
  OldCreateOrder = True
  Height = 321
  Width = 481
  object cdsEdit: TClientDataSet
    Aggregates = <>
    Filtered = True
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
    OnFilterRecord = cdsEditFilterRecord
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
      Visible = False
      Size = 31
    end
    object cdsEditDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Required = True
      Size = 255
    end
    object cdsEditPRIMIPARA: TIntegerField
      FieldName = 'PRIMIPARA'
      Required = True
      DisplayFormat = '#,0'
    end
    object cdsEditMULTIPARA: TIntegerField
      FieldName = 'MULTIPARA'
      Required = True
      DisplayFormat = '#,0'
    end
    object cdsEditATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEditINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEditSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Visible = False
      Size = 32
    end
    object cdsEditSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Visible = False
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
      ' DESCRICAO, '#13#10'  C.PRIMIPARA, '#13#10'  C.MULTIPARA, '#13#10'  C.ATIVO, '#13#10'  C' +
      '.INTERNAL,'#13#10'  C.SYS$UU,'#13#10'  C.SYS$DU'#13#10'FROM ZOO_CFGPARAMMATRIZES C' +
      #13#10'LEFT JOIN SYS$TYPES T ON T.SYS$TYPE = '#39'PARAM_MATRIZES'#39' AND T.S' +
      'YS$VALUE = C.SYS$VALUE'#13#10'WHERE C.KCAD_FAZENDA = :KCAD_FAZENDA'#13#10'  ' +
      '     AND C.ATIVO = '#39'T'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
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
    object sqlEditPRIMIPARA: TIntegerField
      FieldName = 'PRIMIPARA'
      DisplayFormat = '#,0'
    end
    object sqlEditMULTIPARA: TIntegerField
      FieldName = 'MULTIPARA'
      DisplayFormat = '#,0'
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
  object cdsEQAPADRAO: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 200
    Top = 12
    object cdsEQAPADRAOTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsEQAPADRAOVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsEQAPADRAODESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsEQAPADRAOORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
