object dtmZoo_BSTAnimal: TdtmZoo_BSTAnimal
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsLactacoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLactacoes'
    Left = 64
    Top = 24
    object cdsLactacoesKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLactacoesKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLactacoesNL: TIntegerField
      FieldName = 'NL'
      Required = True
    end
    object cdsLactacoesDATALACTACAO: TSQLTimeStampField
      DisplayLabel = 'Data lacta'#231#227'o'
      FieldName = 'DATALACTACAO'
      Required = True
    end
    object cdsLactacoesDATA_SECAGEM: TSQLTimeStampField
      DisplayLabel = 'Data secagem'
      FieldName = 'DATA_SECAGEM'
    end
    object cdsLactacoessqlBST: TDataSetField
      FieldName = 'sqlBST'
      Visible = False
    end
  end
  object dspLactacoes: TDataSetProvider
    DataSet = sqlLactacoes
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 14
    Top = 73
  end
  object sqlLactacoes: TTcSQLDataSet
    CommandText = 
      'SELECT '#13#10'   KZOO_LACTACAO,'#13#10'   KZOO_ANIMAL_FEMEA,'#13#10'   NL,'#13#10'   DA' +
      'TALACTACAO,'#13#10'   DATA_SECAGEM'#13#10'FROM '#13#10' ZOO_LACTACOES'#13#10'WHERE KZOO_' +
      'ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 64
    Top = 120
    object sqlLactacoesKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object sqlLactacoesKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlLactacoesNL: TIntegerField
      FieldName = 'NL'
      Required = True
    end
    object sqlLactacoesDATALACTACAO: TSQLTimeStampField
      DisplayLabel = 'Data lacta'#231#227'o'
      FieldName = 'DATALACTACAO'
      Required = True
    end
    object sqlLactacoesDATA_SECAGEM: TSQLTimeStampField
      DisplayLabel = 'Data secagem'
      FieldName = 'DATA_SECAGEM'
    end
  end
  object dtsSQLLactacoes: TDataSource
    DataSet = sqlLactacoes
    Left = 160
    Top = 160
  end
  object cdsBST: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLactacoessqlBST
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end>
    BeforePost = cdsBSTBeforePost
    OnNewRecord = cdsBSTNewRecord
    Left = 218
    Top = 36
    object cdsBSTKZOO_ANIMAL_FEMEA_BST: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA_BST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsBSTKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object cdsBSTKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object cdsBSTBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsBSTNOMEESTABULO: TStringField
      DisplayLabel = 'Nome Est'#225'bulo'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsBSTDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
      OnValidate = cdsBSTDATAValidate
    end
    object cdsBSTOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsBSTKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object cdsBSTNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = cdsBSTNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsBSTAPLICADO: TStringField
      DisplayLabel = 'Aplicado'
      FieldName = 'APLICADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsBSTMOTIVO_INTERRUPCAO: TIntegerField
      DisplayLabel = 'Motivo interrup'#231#227'o'
      FieldName = 'MOTIVO_INTERRUPCAO'
    end
    object cdsBSTDESC_MOTIVO_INTERRUPCAO: TStringField
      DisplayLabel = 'Motivo da interrup'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'DESC_MOTIVO_INTERRUPCAO'
      LookupDataSet = cdsMotivoInterrupcaoBST
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'MOTIVO_INTERRUPCAO'
      Size = 31
      Lookup = True
    end
    object cdsBSTLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object sqlBST: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'   KZOO_ANIMAL_FEMEA_BST,'#13#10'   KZOO_ANIMAL_FEMEA,'#13#10'  KZO' +
      'O_LACTACAO,'#13#10'   DATA,  '#13#10'   OBSERVACAO, '#13#10'   KCAD_FUNCIONARIO, '#13 +
      #10'   NOMEFUNCIONARIO, '#13#10'   LOTE,'#13#10'   APLICADO,'#13#10'   MOTIVO_INTERRU' +
      'PCAO'#13#10'FROM '#13#10' ZOO_ANIMAL_FEMEA_BST'#13#10'WHERE KZOO_LACTACAO = :KZOO_' +
      'LACTACAO'
    DataSource = dtsSQLLactacoes
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LACTACAO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 218
    Top = 124
    object sqlBSTKZOO_ANIMAL_FEMEA_BST: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA_BST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlBSTKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlBSTKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object sqlBSTDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlBSTOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlBSTKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlBSTNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlBSTLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlBSTAPLICADO: TStringField
      DisplayLabel = 'Aplicado'
      FieldName = 'APLICADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlBSTMOTIVO_INTERRUPCAO: TIntegerField
      DisplayLabel = 'Motivo interrup'#231#227'o'
      FieldName = 'MOTIVO_INTERRUPCAO'
    end
  end
  object cdsMotivoInterrupcaoBST: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 361
    Top = 31
    object cdsMotivoInterrupcaoBSTTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsMotivoInterrupcaoBSTVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsMotivoInterrupcaoBSTDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsMotivoInterrupcaoBSTORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
