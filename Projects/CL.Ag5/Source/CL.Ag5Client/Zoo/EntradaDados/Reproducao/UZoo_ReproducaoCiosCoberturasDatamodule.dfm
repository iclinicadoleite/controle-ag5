object Zoo_ReproducaoCiosCoberturasDatamodule: TZoo_ReproducaoCiosCoberturasDatamodule
  OldCreateOrder = True
  Height = 274
  Width = 550
  object cdsEventosReprodutivos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspEventosReprodutivos'
    BeforePost = cdsEventosReprodutivosBeforePost
    OnNewRecord = cdsEventosReprodutivosNewRecord
    Left = 55
    Top = 41
    object cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEventosReprodutivosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEventosReprodutivosKZOO_ANIMAL_MACHO: TStringField
      DisplayLabel = 'Touro'
      FieldName = 'KZOO_ANIMAL_MACHO'
      Visible = False
      FixedChar = True
    end
    object cdsEventosReprodutivosBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = []
      Size = 15
    end
    object cdsEventosReprodutivosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      ProviderFlags = []
      Visible = False
      Size = 16
    end
    object cdsEventosReprodutivosNOMEESTABULO: TStringField
      DisplayLabel = 'Femea'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsEventosReprodutivosDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object cdsEventosReprodutivosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
      Visible = False
      OnSetText = cdsEventosReprodutivosTIPOEVENTOSetText
      OnValidate = cdsEventosReprodutivosTIPOEVENTOValidate
    end
    object cdsEventosReprodutivosDOSES: TIntegerField
      DisplayLabel = 'Doses'
      FieldName = 'DOSES'
      OnGetText = cdsEventosReprodutivosDOSESGetText
    end
    object cdsEventosReprodutivosIATF: TStringField
      FieldName = 'IATF'
      OnGetText = cdsEventosReprodutivosIATFGetText
      OnValidate = cdsEventosReprodutivosIATFValidate
      FixedChar = True
      Size = 1
    end
    object cdsEventosReprodutivosKZOO_PROTOCOLO_IATF: TStringField
      FieldName = 'KZOO_PROTOCOLO_IATF'
      FixedChar = True
    end
    object cdsEventosReprodutivosDESC_PROTOCOLO_IATF: TStringField
      DisplayLabel = 'Protocolo IATF'
      FieldKind = fkLookup
      FieldName = 'DESC_PROTOCOLO_IATF'
      LookupDataSet = cdsProtocolosIATF
      LookupKeyFields = 'KZOO_PROTOCOLO'
      LookupResultField = 'CODIGO'
      KeyFields = 'KZOO_PROTOCOLO_IATF'
      Size = 32
      Lookup = True
    end
    object cdsEventosReprodutivosMUCO: TIntegerField
      FieldName = 'MUCO'
      Visible = False
    end
    object cdsEventosReprodutivosKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object cdsEventosReprodutivosNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsEventosReprodutivosNOMEFUNCIONARIOGetText
      OnSetText = cdsEventosReprodutivosNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsEventosReprodutivosDESC_EVENTO: TStringField
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
    object cdsEventosReprodutivosDESC_MUCO: TStringField
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
    object cdsEventosReprodutivosNOMEMACHO: TStringField
      DisplayLabel = 'Touro/embri'#227'o'
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsEventosReprodutivosNOMEMACHOGetText
      OnSetText = cdsEventosReprodutivosNOMEMACHOSetText
      Size = 60
    end
    object cdsEventosReprodutivosOBS_EVENTO: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS_EVENTO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsEventosReprodutivosKULTIMA_MONTA: TStringField
      FieldName = 'KULTIMA_MONTA'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object cdsEventosReprodutivosABRIRLACTACAO: TStringField
      FieldName = 'ABRIRLACTACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventosReprodutivosULTIMA_MONTA: TSQLTimeStampField
      FieldName = 'ULTIMA_MONTA'
    end
    object cdsEventosReprodutivosPRENHEZ: TStringField
      FieldName = 'PRENHEZ'
      FixedChar = True
      Size = 1
    end
    object cdsEventosReprodutivosLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsEventosReprodutivosTipoMacho: TIntegerField
      DisplayLabel = 'TIPOMACHO'
      FieldKind = fkInternalCalc
      FieldName = 'TipoMacho'
    end
    object cdsEventosReprodutivosDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
      ProviderFlags = []
    end
  end
  object dspEventosReprodutivos: TDataSetProvider
    DataSet = sqlEventosReprodutivos
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspEventosReprodutivosAfterUpdateRecord
    BeforeUpdateRecord = dspEventosReprodutivosBeforeUpdateRecord
    OnGetTableName = dspEventosReprodutivosGetTableName
    Left = 31
    Top = 86
  end
  object sqlEventosReprodutivos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  E.KZOO_EVENTO_ZOOTECNICO,'#13#10'  E.KZOO_ANIMAL_FEMEA, '#13#10' ' +
      ' AF.BRINCO,'#13#10' AF.BRINCO_,'#13#10'  AF.NOMEESTABULO,'#13#10'  E.KZOO_ANIMAL_M' +
      'ACHO, '#13#10'  AM.NOMEESTABULO NOMEMACHO,'#13#10'  E.DATAEVENTO, '#13#10'  E.TIPO' +
      'EVENTO, '#13#10'  E.MUCO, '#13#10'  E.DOSES,'#13#10'  E.KCAD_FUNCIONARIO, '#13#10'  E.NO' +
      'MEFUNCIONARIO,'#13#10'  E.LOTE,'#13#10'  E.OBS_EVENTO,'#13#10'  E.IATF,'#13#10'  E.KZOO_' +
      'PROTOCOLO_IATF,'#13#10'  CAST ( NULL AS CHAR( 22 ) ) KULTIMA_MONTA,'#13#10' ' +
      ' '#39'F'#39' ABRIRLACTACAO,'#13#10' CAST ( NULL AS TIMESTAMP ) ULTIMA_MONTA,'#13#10 +
      ' CAST ( NULL AS CHAR ) PRENHEZ,'#13#10' F.DOADOR_RECEPTOR'#13#10'FROM ZOO_EV' +
      'ENTOS_ZOOTECNICOS e'#13#10'LEFT JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL ' +
      '= E.KZOO_ANIMAL_FEMEA'#13#10'LEFT JOIN ZOO_ANIMAIS_FEMEA F ON F.KZOO_A' +
      'NIMAL_FEMEA = E.KZOO_ANIMAL_FEMEA '#13#10'LEFT JOIN ZOO_ANIMAIS AM ON ' +
      'AM.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO'#13#10'WHERE AF.KCAD_FAZENDA = :K' +
      'CAD_FAZENDA AND 0=1'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 58
    Top = 130
    object sqlEventosReprodutivosKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEventosReprodutivosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlEventosReprodutivosKZOO_ANIMAL_MACHO: TStringField
      DisplayLabel = 'Touro'
      FieldName = 'KZOO_ANIMAL_MACHO'
      Visible = False
      FixedChar = True
    end
    object sqlEventosReprodutivosBRINCO: TStringField
      FieldName = 'BRINCO'
      ProviderFlags = []
      Size = 15
    end
    object sqlEventosReprodutivosBRINCO_: TStringField
      FieldName = 'BRINCO_'
      ProviderFlags = []
      Size = 16
    end
    object sqlEventosReprodutivosNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlEventosReprodutivosNOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlEventosReprodutivosDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object sqlEventosReprodutivosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlEventosReprodutivosDOSES: TIntegerField
      FieldName = 'DOSES'
    end
    object sqlEventosReprodutivosIATF: TStringField
      FieldName = 'IATF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEventosReprodutivosKZOO_PROTOCOLO_IATF: TStringField
      FieldName = 'KZOO_PROTOCOLO_IATF'
      FixedChar = True
    end
    object sqlEventosReprodutivosMUCO: TIntegerField
      FieldName = 'MUCO'
    end
    object sqlEventosReprodutivosKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlEventosReprodutivosNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlEventosReprodutivosOBS_EVENTO: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS_EVENTO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlEventosReprodutivosKULTIMA_MONTA: TStringField
      FieldName = 'KULTIMA_MONTA'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlEventosReprodutivosABRIRLACTACAO: TStringField
      FieldName = 'ABRIRLACTACAO'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEventosReprodutivosULTIMA_MONTA: TSQLTimeStampField
      FieldName = 'ULTIMA_MONTA'
      ProviderFlags = [pfInWhere]
    end
    object sqlEventosReprodutivosPRENHEZ: TStringField
      FieldName = 'PRENHEZ'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlEventosReprodutivosLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlEventosReprodutivosDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
      ProviderFlags = []
    end
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
    Left = 288
    Top = 20
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
    Left = 388
    Top = 24
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
  object cdsTipoMucoPadrao: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 288
    Top = 76
    object StringField1: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object StringField2: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object StringField3: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object IntegerField1: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoEventoPadrao: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 388
    Top = 74
    object StringField4: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object StringField5: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object StringField6: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object IntegerField2: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsContaEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 308
    Top = 192
    object cdsContaEstoqueKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
    end
    object cdsContaEstoqueNOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      Size = 60
    end
    object cdsContaEstoqueQTDEESTOQUE: TIntegerField
      FieldName = 'QTDEESTOQUE'
    end
    object cdsContaEstoqueQTDEUSADA: TIntegerField
      FieldName = 'QTDEUSADA'
    end
  end
  object cdsProtocolosIATF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 289
    Top = 138
    object cdsProtocolosIATFKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
    end
    object cdsProtocolosIATFCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
  end
  object cdsProtocolosIATFPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 401
    Top = 138
    object cdsProtocolosIATFPadraoKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
    end
    object cdsProtocolosIATFPadraoCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsEventosReprodutivos
    OnDataChange = DataSource1DataChange
    Left = 128
    Top = 16
  end
end
