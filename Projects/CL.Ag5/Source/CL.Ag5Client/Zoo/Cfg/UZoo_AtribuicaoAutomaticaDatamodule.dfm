object Zoo_AtribuicaoAutomaticaDatamodule: TZoo_AtribuicaoAutomaticaDatamodule
  OldCreateOrder = True
  Height = 356
  Width = 528
  object cdsProtocolos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_DIAGNOSTICO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspProtocolos'
    Left = 301
    Top = 48
    object cdsProtocolosKZOO_DIAGNOSTICO_PROTOCOLO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object cdsProtocolosKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsProtocolosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object cdsProtocolosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsProtocolosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProtocolosINICIAR: TStringField
      FieldName = 'INICIAR'
      FixedChar = True
      Size = 1
    end
  end
  object dspProtocolos: TDataSetProvider
    DataSet = sqlProtocolos
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspProtocolosBeforeUpdateRecord
    Left = 261
    Top = 93
  end
  object sqlProtocolos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10' DP.KZOO_DIAGNOSTICO_PROTOCOLO, '#13#10' DP.KZOO_DIAGNOSTICO, ' +
      #13#10' P.KZOO_PROTOCOLO,'#13#10' P.NOME,'#13#10' P.ATIVO,'#13#10' DP.INICIAR'#13#10'FROM ZOO' +
      '_PROTOCOLOS P'#13#10'LEFT JOIN   ZOO_DIAGNOSTICO_PROTOCOLOS DP ON ( DP' +
      '.KZOO_DIAGNOSTICO = :KZOO_DIAGNOSTICO ) AND ( DP.KZOO_PROTOCOLO ' +
      '= P.KZOO_PROTOCOLO )'#13#10'WHERE P.KCAD_FAZENDA = :KCAD_FAZENDA AND (' +
      ' P.ATIVO = '#39'T'#39' OR P.KDEF_PROTOCOLO IS NULL )'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_DIAGNOSTICO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 296
    Top = 136
    object sqlProtocolosKZOO_DIAGNOSTICO_PROTOCOLO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object sqlProtocolosKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object sqlProtocolosKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
      FixedChar = True
    end
    object sqlProtocolosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlProtocolosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlProtocolosINICIAR: TStringField
      FieldName = 'INICIAR'
      FixedChar = True
      Size = 1
    end
  end
  object cdsTiposDiagnostico: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 434
    Top = 108
    object cdsTiposDiagnosticoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTiposDiagnosticoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTiposDiagnosticoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTiposDiagnosticoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTiposEvento: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 438
    Top = 164
    object cdsTiposEventoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTiposEventoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTiposEventoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTiposEventoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsLstDiagnosticos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPODIAGNOSTICO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOEVENTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstDiagnosticos'
    Left = 142
    Top = 43
    object cdsLstDiagnosticosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsLstDiagnosticosKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstDiagnosticosCODIGO: TStringField
      DisplayWidth = 11
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsLstDiagnosticosNOME: TStringField
      DisplayWidth = 46
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
  end
  object dspLstDiagnosticos: TDataSetProvider
    DataSet = sqlLstDiagnosticos
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 106
    Top = 88
  end
  object sqlLstDiagnosticos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  KCAD_FAZENDA,'#13#10'  KZOO_DIAGNOSTICO,'#13#10'  CODIGO, '#13#10'  NOM' +
      'E'#13#10'FROM ZOO_DIAGNOSTICOS'#13#10'WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA )' +
      #13#10'  AND (  ATIVO = '#39'T'#39' )'#13#10'  AND (    (( :TD IS NOT NULL) AND ( T' +
      'IPODIAGNOSTICO = :TIPODIAGNOSTICO ))'#13#10'        OR (( :TE IS NOT N' +
      'ULL) AND ( TIPOEVENTO            = :TIPOEVENTO ) )'#13#10'       )'#13#10'OR' +
      'DER BY NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPODIAGNOSTICO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOEVENTO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 141
    Top = 131
    object sqlLstDiagnosticosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlLstDiagnosticosKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlLstDiagnosticosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object sqlLstDiagnosticosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
  end
  object dtsLstDiagnosticos: TDataSource
    DataSet = cdsLstDiagnosticos
    OnDataChange = dtsLstDiagnosticosDataChange
    Left = 211
    Top = 7
  end
  object cdsListaEventos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 34
    Top = 40
    object cdsListaEventosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsListaEventosTIPODIAGNOSTICO: TIntegerField
      DisplayWidth = 5
      FieldName = 'TIPODIAGNOSTICO'
    end
    object cdsListaEventosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
  end
  object dtsListaEventos: TDataSource
    DataSet = cdsListaEventos
    OnDataChange = dtsListaEventosDataChange
    Left = 49
    Top = 3
  end
end
