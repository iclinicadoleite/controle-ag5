object Zoo_SanidadeDiagnosticosDatamodule: TZoo_SanidadeDiagnosticosDatamodule
  OldCreateOrder = False
  Height = 381
  Width = 672
  object sqlDiagnosticoAplicar: TTcSQLDataSet
    CommandText = 
      'SELECT'#13#10'       AF.KZOO_ANIMAL_FEMEA,'#13#10'       A.BRINCO,'#13#10'       A' +
      'D.KZOO_DIAGNOSTICO,'#13#10'       AD.QUARTO,'#13#10'       AD.DATA,'#13#10'       ' +
      'AP.KZOO_PROTOCOLO'#13#10'  FROM ZOO_ANIMAIS A'#13#10'  INNER JOIN ZOO_ANIMAI' +
      'S_FEMEA AF ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'#13#10'  INNER JOIN' +
      ' ZOO_ANIMAL_DIAGNOSTICOS AD ON A.KZOO_ANIMAL = AD.KZOO_ANIMAL_FE' +
      'MEA'#13#10'  INNER JOIN ZOO_DIAGNOSTICOS D ON AD.KZOO_DIAGNOSTICO = D.' +
      'KZOO_DIAGNOSTICO'#13#10'  INNER JOIN ZOO_ANIMAL_PROTOCOLOS AP ON AP.KZ' +
      'OO_ANIMAL_DIAGNOSTICO = AD.KZOO_ANIMAL_DIAGNOSTICO'#13#10'  INNER JOIN' +
      ' ZOO_PROTOCOLOS P ON AP.KZOO_PROTOCOLO = P.KZOO_PROTOCOLO'#13#10' WHER' +
      'E 1 = 0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 84
    Top = 140
    object sqlDiagnosticoAplicarKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticoAplicarBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlDiagnosticoAplicarKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object sqlDiagnosticoAplicarQUARTO: TSmallintField
      DisplayLabel = 'Teto'
      FieldName = 'QUARTO'
    end
    object sqlDiagnosticoAplicarDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object sqlDiagnosticoAplicarKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
  end
  object dspDiagnosticoAplicar: TDataSetProvider
    DataSet = sqlDiagnosticoAplicar
    BeforeUpdateRecord = dspDiagnosticoAplicarBeforeUpdateRecord
    Left = 44
    Top = 88
  end
  object cdsDiagnosticoAplicar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDiagnosticoAplicar'
    AfterOpen = cdsDiagnosticoAplicarAfterOpen
    BeforePost = cdsDiagnosticoAplicarBeforePost
    AfterPost = cdsDiagnosticoAplicarAfterPost
    OnNewRecord = cdsDiagnosticoAplicarNewRecord
    Left = 84
    Top = 48
    object cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDiagnosticoAplicarBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsDiagnosticoAplicarDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsDiagnosticoAplicarKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      Visible = False
      OnChange = cdsDiagnosticoAplicarKZOO_DIAGNOSTICOChange
      FixedChar = True
    end
    object cdsDiagnosticoAplicarCODIGO_DIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldKind = fkLookup
      FieldName = 'CODIGO_DIAGNOSTICO'
      LookupDataSet = cdsDiagnosticos
      LookupKeyFields = 'KZOO_DIAGNOSTICO'
      LookupResultField = 'CODIGO'
      KeyFields = 'KZOO_DIAGNOSTICO'
      Size = 32
      Lookup = True
    end
    object cdsDiagnosticoAplicarQUARTO: TSmallintField
      DisplayLabel = 'Quarto'
      FieldName = 'QUARTO'
      Visible = False
    end
    object cdsDiagnosticoAplicarKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Visible = False
      OnChange = cdsDiagnosticoAplicarKZOO_PROTOCOLOChange
      FixedChar = True
    end
    object cdsDiagnosticoAplicarCODIGO_PROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldKind = fkLookup
      FieldName = 'CODIGO_PROTOCOLO'
      LookupDataSet = cdsProtocolos
      LookupKeyFields = 'KZOO_PROTOCOLO'
      LookupResultField = 'CODIGO'
      KeyFields = 'KZOO_PROTOCOLO'
      Visible = False
      Size = 32
      Lookup = True
    end
    object cdsDiagnosticoAplicarDESC_PROTOCOLO: TStringField
      DisplayLabel = 'Procotolo'
      FieldKind = fkInternalCalc
      FieldName = 'DESC_PROTOCOLO'
      Size = 50
    end
    object cdsDiagnosticoAplicarQUARTO_DESCR: TStringField
      DisplayLabel = 'Quarto'
      DisplayWidth = 6
      FieldKind = fkLookup
      FieldName = 'QUARTO_DESCR'
      LookupDataSet = cdsQuarto
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'QUARTO'
      Size = 32
      Lookup = True
    end
    object cdsDiagnosticoAplicarGUID20: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'GUID20'
      Visible = False
    end
  end
  object sqlDiagnosticos: TTcSQLDataSet
    CommandText = 
      'select D.KZOO_DIAGNOSTICO,'#13#10'       D.KCAD_FAZENDA,'#13#10'       D.COD' +
      'IGO,'#13#10'       D.TIPODIAGNOSTICO,'#13#10'       D.TIPOEVENTO,'#13#10'       D.' +
      'SYS$EVENTOID,'#13#10'       D.NOME,'#13#10'       D.POR_QUARTO,'#13#10'       D.AT' +
      'IVO,'#13#10'       D.INTERNAL'#13#10'from ZOO_DIAGNOSTICOS D'#13#10'where D.ATIVO ' +
      '= '#39'T'#39#13#10'ORDER BY D.CODIGO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 272
    Top = 148
    object sqlDiagnosticosKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlDiagnosticosTIPODIAGNOSTICO: TIntegerField
      FieldName = 'TIPODIAGNOSTICO'
    end
    object sqlDiagnosticosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlDiagnosticosSYSEVENTOID: TStringField
      FieldName = 'SYS$EVENTOID'
      Size = 31
    end
    object sqlDiagnosticosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlDiagnosticosPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlDiagnosticosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlDiagnosticosINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspDiagnosticos: TDataSetProvider
    DataSet = sqlDiagnosticos
    Left = 244
    Top = 88
  end
  object cdsDiagnosticos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDiagnosticos'
    Left = 276
    Top = 28
    object cdsDiagnosticosKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      Required = True
      FixedChar = True
    end
    object cdsDiagnosticosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsDiagnosticosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsDiagnosticosTIPODIAGNOSTICO: TIntegerField
      FieldName = 'TIPODIAGNOSTICO'
    end
    object cdsDiagnosticosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object cdsDiagnosticosSYSEVENTOID: TStringField
      FieldName = 'SYS$EVENTOID'
      Size = 31
    end
    object cdsDiagnosticosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsDiagnosticosPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDiagnosticosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDiagnosticosINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsProtocolos: TClientDataSet
    Aggregates = <>
    Params = <>
    OnFilterRecord = cdsProtocolosFilterRecord
    Left = 400
    Top = 28
    object cdsProtocolosKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsProtocolosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object cdsProtocolosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 33
    end
    object cdsProtocolosVINCULADO: TStringField
      FieldName = 'VINCULADO'
    end
  end
  object sqlDiagnosticosPadrao: TTcSQLDataSet
    CommandText = 
      'select D.KZOO_DIAGNOSTICO,'#13#10'       D.KCAD_FAZENDA,'#13#10'       D.COD' +
      'IGO,'#13#10'       D.TIPODIAGNOSTICO,'#13#10'       D.TIPOEVENTO,'#13#10'       D.' +
      'SYS$EVENTOID,'#13#10'       D.NOME,'#13#10'       D.POR_QUARTO,'#13#10'       D.AT' +
      'IVO,'#13#10'       D.INTERNAL'#13#10'from ZOO_DIAGNOSTICOS D'#13#10'where D.ATIVO ' +
      '= '#39'T'#39#13#10'ORDER BY D.CODIGO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 207
    Top = 304
    object sqlDiagnosticosPadraoKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosPadraoKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosPadraoCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlDiagnosticosPadraoTIPODIAGNOSTICO: TIntegerField
      FieldName = 'TIPODIAGNOSTICO'
    end
    object sqlDiagnosticosPadraoTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlDiagnosticosPadraoSYSEVENTOID: TStringField
      FieldName = 'SYS$EVENTOID'
      Size = 31
    end
    object sqlDiagnosticosPadraoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlDiagnosticosPadraoPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlDiagnosticosPadraoATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlDiagnosticosPadraoINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspDiagnosticosPadrao: TDataSetProvider
    DataSet = sqlDiagnosticosPadrao
    Left = 171
    Top = 264
  end
  object cdsDiagnosticosPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDiagnosticosPadrao'
    Left = 211
    Top = 220
    object cdsDiagnosticosPadraoKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      Required = True
      FixedChar = True
    end
    object cdsDiagnosticosPadraoKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsDiagnosticosPadraoCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsDiagnosticosPadraoTIPODIAGNOSTICO: TIntegerField
      FieldName = 'TIPODIAGNOSTICO'
    end
    object cdsDiagnosticosPadraoTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object cdsDiagnosticosPadraoSYSEVENTOID: TStringField
      FieldName = 'SYS$EVENTOID'
      Size = 31
    end
    object cdsDiagnosticosPadraoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsDiagnosticosPadraoPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDiagnosticosPadraoATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDiagnosticosPadraoINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsProtocolosPadrao: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    OnFilterRecord = cdsProtocolosPadraoFilterRecord
    Left = 424
    Top = 217
    object cdsProtocolosPadraoKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsProtocolosPadraoKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object cdsProtocolosPadraoCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 33
    end
    object cdsProtocolosPadraoVINCULADO: TStringField
      FieldName = 'VINCULADO'
    end
  end
  object cdsQuarto: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 496
    Top = 32
    object cdsQuartoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 31
    end
    object cdsQuartoVALOR: TStringField
      FieldName = 'VALOR'
      Size = 31
    end
    object cdsQuartoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 31
    end
    object cdsQuartoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsQuartoPadrao: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 576
    Top = 213
    object cdsQuartoPadraoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsQuartoPadraoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsQuartoPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsQuartoPadraoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object SQLDataSet1: TTcSQLDataSet
    CommandText = 
      'SELECT'#13#10'  DP.KZOO_DIAGNOSTICO'#13#10', P.KZOO_PROTOCOLO'#13#10', '#39'*'#39' || P.CO' +
      'DIGO || '#39#39' AS CODIGO'#13#10'FROM ZOO_DIAGNOSTICO_PROTOCOLOS DP'#13#10'INNER ' +
      'JOIN ZOO_PROTOCOLOS P ON DP.KZOO_PROTOCOLO = P.KZOO_PROTOCOLO'#13#10'I' +
      'NNER JOIN ZOO_DIAGNOSTICOS D ON D.KZOO_DIAGNOSTICO = DP.KZOO_DIA' +
      'GNOSTICO'#13#10'WHERE'#13#10'     D.ATIVO = '#39'T'#39#13#10' AND P.ATIVO = '#39'T'#39#13#10'UNION A' +
      'LL'#13#10'SELECT'#13#10'  NULL'#13#10', P.KZOO_PROTOCOLO'#13#10', P.CODIGO'#13#10'FROM ZOO_PRO' +
      'TOCOLOS P'#13#10'WHERE P.ATIVO = '#39'T'#39#13#10'ORDER BY  1, 3'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 452
    Top = 312
    object SQLDataSet1KZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object SQLDataSet1KZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object SQLDataSet1CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 33
    end
  end
  object dtsDiagnosticos: TDataSource
    DataSet = cdsDiagnosticos
    Left = 340
    Top = 4
  end
  object dtsPadroes: TDataSource
    DataSet = cdsPadroes
    OnDataChange = dtsPadroesDataChange
    Left = 20
    Top = 194
  end
  object cdsPadroes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 224
    object cdsPadroesDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsPadroesKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      Visible = False
      FixedChar = True
    end
    object cdsPadroesCODIGO_DIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldKind = fkLookup
      FieldName = 'CODIGO_DIAGNOSTICO'
      LookupDataSet = cdsDiagnosticosPadrao
      LookupKeyFields = 'KZOO_DIAGNOSTICO'
      LookupResultField = 'CODIGO'
      KeyFields = 'KZOO_DIAGNOSTICO'
      Size = 32
      Lookup = True
    end
    object cdsPadroesQUARTO: TSmallintField
      DisplayLabel = 'Teto'
      FieldName = 'QUARTO'
      Visible = False
    end
    object cdsPadroesKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Visible = False
      FixedChar = True
    end
    object cdsPadroesCODIGO_PROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldKind = fkLookup
      FieldName = 'CODIGO_PROTOCOLO'
      LookupDataSet = cdsProtocolosPadrao
      LookupKeyFields = 'KZOO_PROTOCOLO'
      LookupResultField = 'CODIGO'
      KeyFields = 'KZOO_PROTOCOLO'
      Size = 32
      Lookup = True
    end
    object cdsPadroesQUARTO_DESCR: TStringField
      DisplayLabel = 'Teto'
      DisplayWidth = 6
      FieldKind = fkLookup
      FieldName = 'QUARTO_DESCR'
      LookupDataSet = cdsQuartoPadrao
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'QUARTO'
      Size = 32
      Lookup = True
    end
  end
  object dtsDiagnosticoAplicar: TDataSource
    DataSet = cdsDiagnosticoAplicar
    OnDataChange = dtsDiagnosticoAplicarDataChange
    Left = 47
    Top = 16
  end
end
