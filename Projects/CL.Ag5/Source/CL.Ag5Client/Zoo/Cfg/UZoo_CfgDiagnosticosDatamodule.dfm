object Zoo_CfgDiagnosticosDatamodule: TZoo_CfgDiagnosticosDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsDiagnosticos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspDiagnosticos'
    BeforeOpen = cdsDiagnosticosBeforeOpen
    BeforeDelete = cdsDiagnosticosBeforeDelete
    OnNewRecord = cdsDiagnosticosNewRecord
    Left = 94
    Top = 19
    object cdsDiagnosticosKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDiagnosticosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDiagnosticosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 11
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 32
    end
    object cdsDiagnosticosCODIGO_: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Visible = False
      Size = 33
    end
    object cdsDiagnosticosNOME: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      DisplayWidth = 46
      FieldName = 'NOME'
      Required = True
      OnValidate = cdsDiagnosticosNOMEValidate
      Size = 128
    end
    object cdsDiagnosticosTIPODIAGNOSTICO: TIntegerField
      DisplayLabel = 'Tipo Diagnostico'
      DisplayWidth = 5
      FieldName = 'TIPODIAGNOSTICO'
      LookupDataSet = cdsTiposDiagnostico
      Required = True
      Visible = False
    end
    object cdsDiagnosticosDESC_TIPODIAGNOSTICO: TStringField
      DisplayLabel = 'Tipo Diagn'#243'stico'
      DisplayWidth = 11
      FieldKind = fkLookup
      FieldName = 'DESC_TIPODIAGNOSTICO'
      LookupDataSet = cdsTiposDiagnostico
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPODIAGNOSTICO'
      Size = 31
      Lookup = True
    end
    object cdsDiagnosticosPOR_QUARTO: TStringField
      DisplayLabel = 'Controla por quarto'
      FieldName = 'POR_QUARTO'
      Size = 1
    end
    object cdsDiagnosticosPERMITE_EDICAO: TStringField
      DisplayLabel = 'Permite edi'#231#227'o'
      FieldName = 'PERMITE_EDICAO'
      Size = 1
    end
  end
  object dspDiagnosticos: TDataSetProvider
    DataSet = sqlDiagnosticos
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 58
    Top = 64
  end
  object sqlDiagnosticos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'   KZOO_DIAGNOSTICO'#13#10' , KCAD_FAZENDA'#13#10' , CODIGO'#13#10' , COD' +
      'IGO_'#13#10' , NOME'#13#10' , POR_QUARTO'#13#10' , PERMITE_EDICAO'#13#10' , ATIVO'#13#10' , TI' +
      'PODIAGNOSTICO'#13#10'FROM ZOO_DIAGNOSTICOS'#13#10'WHERE  '#13#10' KCAD_FAZENDA = :' +
      'KCAD_FAZENDA AND TIPODIAGNOSTICO IS NOT NULL AND ATIVO='#39'T'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 93
    Top = 107
    object sqlDiagnosticosKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlDiagnosticosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 32
    end
    object sqlDiagnosticosCODIGO_: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 33
    end
    object sqlDiagnosticosNOME: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlDiagnosticosTIPODIAGNOSTICO: TIntegerField
      DisplayLabel = 'Tipo Diagnostico'
      FieldName = 'TIPODIAGNOSTICO'
      Required = True
    end
    object sqlDiagnosticosPOR_QUARTO: TStringField
      DisplayLabel = 'Controla por quarto'
      FieldName = 'POR_QUARTO'
      Size = 1
    end
    object sqlDiagnosticosPERMITE_EDICAO: TStringField
      DisplayLabel = 'Permite edi'#231#227'o'
      FieldName = 'PERMITE_EDICAO'
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
    Left = 356
    Top = 16
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
end
