object Zoo_ReproducaoColetaEmbriaoDatamodule: TZoo_ReproducaoColetaEmbriaoDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 353
  object cdsColetaEmbriao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DOADOR'
        ParamType = ptInput
      end>
    ProviderName = 'dspColetaEmbriao'
    BeforeOpen = cdsColetaEmbriaoBeforeOpen
    BeforePost = cdsColetaEmbriaoBeforePost
    Left = 78
    Top = 12
    object cdsColetaEmbriaoKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsColetaEmbriaoKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object cdsColetaEmbriaoDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data da cobertura'
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object cdsColetaEmbriaoTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object cdsColetaEmbriaoDESC_EVENTO: TStringField
      DisplayLabel = 'Tipo do evento'
      FieldKind = fkLookup
      FieldName = 'DESC_EVENTO'
      LookupDataSet = cdsTipoEvento
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOEVENTO'
      Size = 31
      Lookup = True
    end
    object cdsColetaEmbriaoBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsColetaEmbriaoBRINCOFEMEA_: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA_'
      ProviderFlags = []
      Visible = False
      Size = 16
    end
    object cdsColetaEmbriaoNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsColetaEmbriaoNOMEMACHO: TStringField
      DisplayLabel = 'Touro'
      FieldName = 'NOMEMACHO'
      Size = 60
    end
    object cdsColetaEmbriaoABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
    end
    object cdsColetaEmbriaoDATAABORTOPARTO: TSQLTimeStampField
      DisplayLabel = 'Data da coleta'
      FieldName = 'DATAABORTOPARTO'
      OnValidate = cdsColetaEmbriaoDATAABORTOPARTOValidate
    end
    object cdsColetaEmbriaoEMBRIOESCOLETADOS: TIntegerField
      DisplayLabel = 'No. de embri'#245'es'
      FieldName = 'EMBRIOESCOLETADOS'
      OnValidate = cdsColetaEmbriaoEMBRIOESCOLETADOSValidate
    end
    object cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA: TStringField
      FieldName = 'KCAD_FUNCIONARIO_COLETA'
      FixedChar = True
    end
    object cdsColetaEmbriaoNOMEFUNCIONARIO_COLETA: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO_COLETA'
      OnGetText = cdsColetaEmbriaoNOMEFUNCIONARIO_COLETAGetText
      OnSetText = cdsColetaEmbriaoNOMEFUNCIONARIO_COLETASetText
      Size = 128
    end
    object cdsColetaEmbriaoGRAUSANGUEPAI: TStringField
      FieldName = 'GRAUSANGUEPAI'
      FixedChar = True
      Size = 5
    end
    object cdsColetaEmbriaoCOMPOSICAORACAPAI: TStringField
      FieldName = 'COMPOSICAORACAPAI'
      Size = 32
    end
    object cdsColetaEmbriaoGRAUSANGUEMAE: TStringField
      FieldName = 'GRAUSANGUEMAE'
      FixedChar = True
      Size = 5
    end
    object cdsColetaEmbriaoCOMPOSICAORACAMAE: TStringField
      FieldName = 'COMPOSICAORACAMAE'
      Size = 32
    end
    object cdsColetaEmbriaoLOTEPARTO: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTEPARTO'
      FixedChar = True
      Size = 32
    end
    object cdsColetaEmbriaoLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsColetaEmbriaoDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
      Required = True
      OnGetText = cdsColetaEmbriaoDOADOR_RECEPTORGetText
    end
    object cdsColetaEmbriaoTOTALCOLETADO: TAggregateField
      FieldName = 'TOTALCOLETADO'
      Active = True
      DisplayName = ''
      Expression = 'SUM(EMBRIOESCOLETADOS)'
    end
    object cdsColetaEmbriaoTOTAL_DOADOR_RECEPTOR: TAggregateField
      FieldName = 'TOTAL_DOADOR_RECEPTOR'
      Active = True
      DisplayName = ''
      Expression = 'SUM(DOADOR_RECEPTOR)'
    end
  end
  object dspColetaEmbriao: TDataSetProvider
    DataSet = sqlColetaEmbriao
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspColetaEmbriaoBeforeUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlColetaEmbriao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  E.KZOO_EVENTO_ZOOTECNICO,'#13#10'  E.KZOO_ANIMAL_FEMEA,'#13#10'  A' +
      'F.BRINCO BRINCOFEMEA,'#13#10'AF.BRINCO_ BRINCOFEMEA_,'#13#10'  E.DATAEVENTO,' +
      #13#10'  E.TIPOEVENTO,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  AM.NOMEESTABU' +
      'LO NOMEMACHO,'#13#10'  E.ABORTOPARTO, '#13#10'  E.DATAABORTOPARTO,'#13#10'  E.EMBR' +
      'IOESCOLETADOS,'#13#10'  E.KCAD_FUNCIONARIO_COLETA,'#13#10'  E.NOMEFUNCIONARI' +
      'O_COLETA, '#13#10'  E.LOTEPARTO, '#13#10'  DAF.LOTE, '#13#10'  CAST( 1 AS INTEGER ' +
      ') DOADOR_RECEPTOR ,'#13#10'  AM.GRAUSANGUE GRAUSANGUEPAI,'#13#10'  AM.COMPOS' +
      'ICAORACA COMPOSICAORACAPAI,'#13#10'  AF.GRAUSANGUE GRAUSANGUEMAE,'#13#10'  A' +
      'F.COMPOSICAORACA COMPOSICAORACAMAE'#13#10'FROM ZOO_ANIMAIS AF '#13#10'INNER ' +
      'JOIN  ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_A' +
      'NIMAL'#13#10'INNER JOIN ZOO_EVENTOS_ZOOTECNICOS E ON E.KZOO_EVENTO_ZOO' +
      'TECNICO =  DAF.KULTIMA_MONTA'#13#10'LEFT JOIN ZOO_ANIMAIS AM ON AM.KZO' +
      'O_ANIMAL = E.KZOO_ANIMAL_MACHO'#13#10'WHERE'#13#10' ( AF.KCAD_FAZENDA = :KCA' +
      'D_FAZENDA ) AND (AF.STATUS <> :STATUS_DESCARTADO)'#13#10'AND ( DAF.DOA' +
      'DOR_RECEPTOR = :DOADOR )'#13#10'AND ( E.ABORTOPARTO IS NULL )'#13#10'ORDER B' +
      'Y AF.BRINCO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DOADOR'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 78
    Top = 100
    object sqlColetaEmbriaoKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlColetaEmbriaoKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlColetaEmbriaoDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object sqlColetaEmbriaoTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlColetaEmbriaoBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlColetaEmbriaoBRINCOFEMEA_: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA_'
      ProviderFlags = []
      Size = 16
    end
    object sqlColetaEmbriaoNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlColetaEmbriaoNOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      Size = 60
    end
    object sqlColetaEmbriaoABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
    end
    object sqlColetaEmbriaoDATAABORTOPARTO: TSQLTimeStampField
      FieldName = 'DATAABORTOPARTO'
    end
    object sqlColetaEmbriaoEMBRIOESCOLETADOS: TIntegerField
      FieldName = 'EMBRIOESCOLETADOS'
    end
    object sqlColetaEmbriaoKCAD_FUNCIONARIO_COLETA: TStringField
      FieldName = 'KCAD_FUNCIONARIO_COLETA'
      FixedChar = True
    end
    object sqlColetaEmbriaoNOMEFUNCIONARIO_COLETA: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO_COLETA'
      Size = 128
    end
    object sqlColetaEmbriaoGRAUSANGUEPAI: TStringField
      FieldName = 'GRAUSANGUEPAI'
      FixedChar = True
      Size = 5
    end
    object sqlColetaEmbriaoCOMPOSICAORACAPAI: TStringField
      FieldName = 'COMPOSICAORACAPAI'
      Size = 32
    end
    object sqlColetaEmbriaoGRAUSANGUEMAE: TStringField
      FieldName = 'GRAUSANGUEMAE'
      FixedChar = True
      Size = 5
    end
    object sqlColetaEmbriaoCOMPOSICAORACAMAE: TStringField
      FieldName = 'COMPOSICAORACAMAE'
      Size = 32
    end
    object sqlColetaEmbriaoLOTEPARTO: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTEPARTO'
      FixedChar = True
      Size = 32
    end
    object sqlColetaEmbriaoLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlColetaEmbriaoDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
      Required = True
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
    Left = 264
    Top = 70
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
    Left = 264
    Top = 120
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
    Left = 264
    Top = 20
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
  object dtsColetaEmbriao: TDataSource
    DataSet = cdsColetaEmbriao
    OnDataChange = dtsColetaEmbriaoDataChange
    Left = 156
    Top = 20
  end
end
