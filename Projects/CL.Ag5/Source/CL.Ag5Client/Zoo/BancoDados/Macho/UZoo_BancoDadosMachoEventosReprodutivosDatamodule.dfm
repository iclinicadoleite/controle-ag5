object Zoo_BancoDadosMachoEventosReprodutivosDatamodule: TZoo_BancoDadosMachoEventosReprodutivosDatamodule
  OldCreateOrder = True
  Height = 270
  Width = 605
  object cdsEventosZoo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspEventosZoo'
    Left = 95
    Top = 36
    object cdsEventosZooKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEventosZooKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEventosZooKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Visible = False
      FixedChar = True
    end
    object cdsEventosZooDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data evento'
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object cdsEventosZooTIPOEVENTO: TIntegerField
      DisplayLabel = 'Evento'
      FieldName = 'TIPOEVENTO'
      Visible = False
    end
    object cdsEventosZooDESC_EVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldKind = fkLookup
      FieldName = 'DESC_EVENTO'
      LookupDataSet = cdsTipoEvento
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOEVENTO'
      Size = 31
      Lookup = True
    end
    object cdsEventosZooINTERVALO: TIntegerField
      DisplayLabel = 'Intervalo'
      FieldKind = fkInternalCalc
      FieldName = 'INTERVALO'
    end
    object cdsEventosZooMUCO: TIntegerField
      DisplayLabel = 'Muco'
      FieldName = 'MUCO'
      Visible = False
    end
    object cdsEventosZooDESC_MUCO: TStringField
      DisplayLabel = 'Muco'
      FieldKind = fkLookup
      FieldName = 'DESC_MUCO'
      LookupDataSet = cdsTipoMuco
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'MUCO'
      Size = 31
      Lookup = True
    end
    object cdsEventosZooNOMEFEMEA: TStringField
      DisplayLabel = 'F'#234'mea'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsEventosZooDOSES: TIntegerField
      DisplayLabel = 'Doses'
      FieldName = 'DOSES'
    end
    object cdsEventosZooPRENHEZ: TStringField
      DisplayLabel = 'Prenhez'
      FieldName = 'PRENHEZ'
      FixedChar = True
      Size = 1
    end
    object cdsEventosZooDATAABORTOPARTO: TSQLTimeStampField
      DisplayLabel = 'Data parto/aborto/coleta'
      FieldName = 'DATAABORTOPARTO'
    end
    object cdsEventosZooABORTOPARTO: TIntegerField
      DisplayLabel = 'Parto/aborto/coleta'
      FieldName = 'ABORTOPARTO'
      Visible = False
    end
    object cdsEventosZooDESC_PARTOABORTO: TStringField
      DisplayLabel = 'Parto/aborto'
      FieldKind = fkLookup
      FieldName = 'DESC_PARTOABORTO'
      LookupDataSet = cdsTipoPartoAborto
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ABORTOPARTO'
      Size = 31
      Lookup = True
    end
    object cdsEventosZooEMBRIOESCOLETADOS: TIntegerField
      FieldName = 'EMBRIOESCOLETADOS'
      Visible = False
    end
  end
  object sqlEventosZoo: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select  '#13#10' E.KZOO_EVENTO_ZOOTECNICO, '#13#10' E.KZOO_ANIMAL_FEMEA, '#13#10' ' +
      'E.KZOO_ANIMAL_MACHO,'#13#10' AF.NOMEESTABULO NOMEFEMEA,'#13#10' E.DATAEVENTO' +
      ',  '#13#10' E.TIPOEVENTO,'#13#10' E.DOSES,  '#13#10' E.MUCO,  '#13#10' E.PRENHEZ, '#13#10' E.A' +
      'BORTOPARTO,  '#13#10' E.DATAABORTOPARTO, '#13#10' E.EMBRIOESCOLETADOS'#13#10'from ' +
      'ZOO_EVENTOS_ZOOTECNICOS E'#13#10'LEFT JOIN ZOO_ANIMAIS AF ON AF.KZOO_A' +
      'NIMAL = E.KZOO_ANIMAL_FEMEA'#13#10'WHERE E.KZOO_ANIMAL_MACHO = :KZOO_A' +
      'NIMAL'#13#10'ORDER BY E.DATAEVENTO'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 94
    Top = 120
    object sqlEventosZooKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEventosZooKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEventosZooKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Visible = False
      FixedChar = True
    end
    object sqlEventosZooDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data evento'
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object sqlEventosZooTIPOEVENTO: TIntegerField
      DisplayLabel = 'Evento'
      FieldName = 'TIPOEVENTO'
      Visible = False
    end
    object sqlEventosZooMUCO: TIntegerField
      DisplayLabel = 'Muco'
      FieldName = 'MUCO'
    end
    object sqlEventosZooNOMEFEMEA: TStringField
      DisplayLabel = 'F'#234'mea'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlEventosZooDOSES: TIntegerField
      DisplayLabel = 'Doses'
      FieldName = 'DOSES'
    end
    object sqlEventosZooPRENHEZ: TStringField
      DisplayLabel = 'Prenhez'
      FieldName = 'PRENHEZ'
      FixedChar = True
      Size = 1
    end
    object sqlEventosZooDATAABORTOPARTO: TSQLTimeStampField
      DisplayLabel = 'Data parto/aborto/coleta'
      FieldName = 'DATAABORTOPARTO'
    end
    object sqlEventosZooABORTOPARTO: TIntegerField
      DisplayLabel = 'Parto/aborto/coleta'
      FieldName = 'ABORTOPARTO'
      Visible = False
    end
    object sqlEventosZooEMBRIOESCOLETADOS: TIntegerField
      FieldName = 'EMBRIOESCOLETADOS'
      Visible = False
    end
  end
  object dspEventosZoo: TDataSetProvider
    DataSet = sqlEventosZoo
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 36
    Top = 88
  end
  object cdsTipoMuco: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 201
    Top = 31
    object cdsTipoMucoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoMucoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoMucoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoMucoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoEvento: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 201
    Top = 79
    object cdsTipoEventoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoEventoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoEventoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoEventoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoPartoAborto: TClientDataSet
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
    Top = 128
    object cdsTipoPartoAbortoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
