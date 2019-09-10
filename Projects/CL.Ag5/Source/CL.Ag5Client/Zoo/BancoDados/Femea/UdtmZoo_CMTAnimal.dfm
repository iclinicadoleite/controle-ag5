object dtmZoo_CMTAnimal: TdtmZoo_CMTAnimal
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsCMT: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end>
    ProviderName = 'dspCMT'
    BeforePost = cdsCMTBeforePost
    OnNewRecord = cdsCMTNewRecord
    Left = 78
    Top = 12
    object cdsCMTKZOO_ANIMAL_FEMEA_CMT: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA_CMT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsCMTKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object cdsCMTBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsCMTNOMEESTABULO: TStringField
      DisplayLabel = 'Nome Estabulo'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsCMTDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
      OnValidate = cdsCMTDATAValidate
    end
    object cdsCMTAD: TStringField
      FieldName = 'AD'
      Size = 4
    end
    object cdsCMTAE: TStringField
      FieldName = 'AE'
      Size = 4
    end
    object cdsCMTPD: TStringField
      FieldName = 'PD'
      Size = 4
    end
    object cdsCMTPE: TStringField
      FieldName = 'PE'
      Size = 4
    end
    object cdsCMTWMT: TIntegerField
      FieldName = 'WMT'
    end
    object cdsCMTKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object cdsCMTNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = cdsCMTNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsCMTDESC_AD: TStringField
      DisplayLabel = 'AD'
      FieldKind = fkLookup
      FieldName = 'DESC_AD'
      LookupDataSet = cdsTipoCMTAD
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'AD'
      Size = 32
      Lookup = True
    end
    object cdsCMTDESC_AE: TStringField
      DisplayLabel = 'AE'
      FieldKind = fkLookup
      FieldName = 'DESC_AE'
      LookupDataSet = cdsTipoCMTAE
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'AE'
      Size = 32
      Lookup = True
    end
    object cdsCMTDESC_PD: TStringField
      DisplayLabel = 'PD'
      FieldKind = fkLookup
      FieldName = 'DESC_PD'
      LookupDataSet = cdsTipoCMTPD
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PD'
      Size = 32
      Lookup = True
    end
    object cdsCMTDESC_PE: TStringField
      DisplayLabel = 'PE'
      FieldKind = fkLookup
      FieldName = 'DESC_PE'
      LookupDataSet = cdsTipoCMTPD
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PE'
      Size = 32
      Lookup = True
    end
    object cdsCMTOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsCMTLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object dspCMT: TDataSetProvider
    DataSet = sqlCMT
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlCMT: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'   KZOO_ANIMAL_FEMEA_CMT,'#13#10'   KZOO_ANIMAL_FEMEA,'#13#10'   DA' +
      'TA,  '#13#10'   AD, '#13#10'   AE, '#13#10'   PD, '#13#10'   PE, '#13#10'   WMT,'#13#10'   LOTE,'#13#10'  ' +
      ' KCAD_FUNCIONARIO, '#13#10'   NOMEFUNCIONARIO,'#13#10'   OBSERVACAO'#13#10'FROM '#13#10 +
      ' ZOO_ANIMAL_FEMEA_CMT'#13#10'WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FE' +
      'MEA'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlCMTKZOO_ANIMAL_FEMEA_CMT: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA_CMT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlCMTKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlCMTDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object sqlCMTAD: TStringField
      FieldName = 'AD'
      Size = 4
    end
    object sqlCMTAE: TStringField
      FieldName = 'AE'
      Size = 4
    end
    object sqlCMTPD: TStringField
      FieldName = 'PD'
      Size = 4
    end
    object sqlCMTPE: TStringField
      FieldName = 'PE'
      Size = 4
    end
    object sqlCMTWMT: TIntegerField
      FieldName = 'WMT'
    end
    object sqlCMTKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlCMTNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlCMTOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      GraphicHeader = False
      Size = 1
    end
    object sqlCMTLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object cdsTipoCMTAD: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 303
    Top = 7
    object cdsTipoCMTADTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoCMTADVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoCMTADDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoCMTADORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoCMTAE: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 303
    Top = 55
    object cdsTipoCMTAETIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoCMTAEVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoCMTAEDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoCMTAEORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoCMTPE: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 304
    Top = 103
    object cdsTipoCMTPETIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoCMTPEVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoCMTPEDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoCMTPEORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoCMTPD: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 304
    Top = 155
    object cdsTipoCMTPDTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoCMTPDVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoCMTPDDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoCMTPDORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
