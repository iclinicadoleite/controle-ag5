object Zoo_SanidadeCondicaoCorporalDatamodule: TZoo_SanidadeCondicaoCorporalDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsCC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCC'
    BeforePost = cdsCCBeforePost
    Left = 78
    Top = 8
    object cdsCCKZOO_ANIMAL_FEMEA_CC: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA_CC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsCCKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object cdsCCBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      ProviderFlags = []
      OnValidate = cdsCCBRINCOValidate
      Size = 15
    end
    object cdsCCBRINCO_: TStringField
      DisplayLabel = 'Brinco'
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO_'
      ProviderFlags = []
      Visible = False
      Size = 16
    end
    object cdsCCNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsCCDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
      OnValidate = cdsCCDATAValidate
    end
    object cdsCCCC: TFloatField
      FieldName = 'CC'
      Required = True
      OnValidate = cdsCCCCValidate
    end
    object cdsCCOBSERVACAO: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsCCKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      Required = True
      FixedChar = True
    end
    object cdsCCNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Required = True
      OnSetText = cdsCCNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsCCLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object dspCC: TDataSetProvider
    DataSet = sqlCC
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlCC: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'   KZOO_ANIMAL_FEMEA_CC,'#13#10'   KZOO_ANIMAL_FEMEA,'#13#10'   DAT' +
      'A,  '#13#10'   CC,'#13#10'   OBSERVACAO,'#13#10'  KCAD_FUNCIONARIO, '#13#10'  NOMEFUNCIO' +
      'NARIO, '#13#10'  LOTE'#13#10'FROM '#13#10' ZOO_ANIMAL_FEMEA_CC'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlCCKZOO_ANIMAL_FEMEA_CC: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA_CC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlCCKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlCCDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlCCCC: TFloatField
      DisplayLabel = 'Condi'#231#227'o corporal'
      FieldName = 'CC'
    end
    object sqlCCOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlCCKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlCCNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlCCLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
end
