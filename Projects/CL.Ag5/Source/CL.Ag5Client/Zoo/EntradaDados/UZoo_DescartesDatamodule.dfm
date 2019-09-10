object Zoo_DescartesDatamodule: TZoo_DescartesDatamodule
  OldCreateOrder = True
  Height = 294
  Width = 639
  object dspDescartes: TDataSetProvider
    DataSet = sqlDescartes
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspDescartesBeforeUpdateRecord
    Left = 38
    Top = 57
  end
  object cdsTipoRazaoDescarte: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    OnFilterRecord = cdsTipoRazaoDescarteFilterRecord
    Left = 384
    Top = 19
    object cdsTipoRazaoDescarteTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoRazaoDescarteVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoRazaoDescarteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoRazaoDescarteORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoMotivoDescarte: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    OnFilterRecord = cdsTipoMotivoDescarteFilterRecord
    Left = 384
    Top = 79
    object cdsTipoMotivoDescarteTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoMotivoDescarteVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoMotivoDescarteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoMotivoDescarteORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsDescartes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDescartes'
    Left = 92
    Top = 14
    object cdsDescartesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsDescartesKCAD_COMPRADOR: TStringField
      FieldName = 'KCAD_COMPRADOR'
      FixedChar = True
    end
    object cdsDescartesDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object cdsDescartesBRINCO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'Brinco'
      Required = True
      Size = 32
    end
    object cdsDescartesNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsDescartesRAZAO: TIntegerField
      DisplayLabel = 'Raz'#227'o'
      FieldName = 'RAZAO'
    end
    object cdsDescartesMOTIVO: TIntegerField
      DisplayLabel = 'Motivo'
      FieldName = 'MOTIVO'
    end
    object cdsDescartesNOMECOMPRADOR: TStringField
      DisplayLabel = 'Nome do Comprador'
      FieldName = 'NOMECOMPRADOR'
      Size = 128
    end
    object cdsDescartesDESCR_RAZAO: TStringField
      DisplayLabel = 'Raz'#227'o descarte'
      FieldKind = fkLookup
      FieldName = 'DESCR_RAZAO'
      LookupDataSet = cdsTipoRazaoDescarte
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'RAZAO'
      Size = 31
      Lookup = True
    end
    object cdsDescartesDESCR_MOTIVO: TStringField
      DisplayLabel = 'Motivo descarte'
      FieldKind = fkLookup
      FieldName = 'DESCR_MOTIVO'
      LookupDataSet = cdsTipoMotivoDescarte
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'MOTIVO'
      Size = 31
      Lookup = True
    end
    object cdsDescartesPRECOVENDA: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'PRECOVENDA'
    end
    object cdsDescartesOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlDescartes: TTcSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select  '#13#10'  KZOO_ANIMAL, '#13#10'  KCAD_COMPRADOR, '#13#10'  DATA, '#13#10'  RAZAO' +
      ','#13#10'  MOTIVO, '#13#10'  NOMECOMPRADOR, '#13#10'  PRECOVENDA,'#13#10'  OBS'#13#10'from ZOO' +
      '_ANIMAL_DESCARTES'#13#10'where KZOO_ANIMAL = :KZOO_ANIMAL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 91
    Top = 103
    object sqlDescartesKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDescartesKCAD_COMPRADOR: TStringField
      FieldName = 'KCAD_COMPRADOR'
      FixedChar = True
    end
    object sqlDescartesDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlDescartesRAZAO: TIntegerField
      DisplayLabel = 'Raz'#227'o'
      FieldName = 'RAZAO'
    end
    object sqlDescartesMOTIVO: TIntegerField
      FieldName = 'MOTIVO'
    end
    object sqlDescartesNOMECOMPRADOR: TStringField
      FieldName = 'NOMECOMPRADOR'
      Size = 128
    end
    object sqlDescartesPRECOVENDA: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'PRECOVENDA'
    end
    object sqlDescartesOBS: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsTipoRazaoDescartePadrao: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    OnFilterRecord = cdsTipoRazaoDescartePadraoFilterRecord
    Left = 516
    Top = 19
    object cdsTipoRazaoDescartePadraoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoRazaoDescartePadraoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoRazaoDescartePadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoRazaoDescartePadraoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoMotivoDescartePadrao: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    OnFilterRecord = cdsTipoMotivoDescartePadraoFilterRecord
    Left = 516
    Top = 79
    object cdsTipoMotivoDescartePadraoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoMotivoDescartePadraoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoMotivoDescartePadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoMotivoDescartePadraoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
