object Zoo_CfgCategoriasDatamodule: TZoo_CfgCategoriasDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsCategorias: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspCategorias'
    BeforeOpen = cdsCategoriasBeforeOpen
    BeforePost = cdsCategoriasBeforePost
    OnNewRecord = cdsCategoriasNewRecord
    Left = 78
    Top = 12
    object cdsCategoriasKZOO_CFGCATEGORIA: TStringField
      FieldName = 'KZOO_CFGCATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsCategoriasKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsCategoriasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object cdsCategoriasSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object cdsCategoriasIDADE_INFERIOR: TIntegerField
      DisplayLabel = 'Idade inferior (dias)'
      FieldName = 'IDADE_INFERIOR'
    end
    object cdsCategoriasIDADE_SUPERIOR: TIntegerField
      DisplayLabel = 'Idade superior (dias)'
      FieldName = 'IDADE_SUPERIOR'
    end
    object cdsCategoriasDEL_INFERIOR: TIntegerField
      DisplayLabel = 'DEL inferior'
      FieldName = 'DEL_INFERIOR'
    end
    object cdsCategoriasDEL_SUPERIOR: TIntegerField
      DisplayLabel = 'DEL superior'
      FieldName = 'DEL_SUPERIOR'
    end
    object cdsCategoriasNL_INFERIOR: TIntegerField
      DisplayLabel = 'NL inferior'
      FieldName = 'NL_INFERIOR'
      OnGetText = cdsCategoriasNL_INFERIORGetText
    end
    object cdsCategoriasNL_SUPERIOR: TIntegerField
      DisplayLabel = 'NL superior'
      FieldName = 'NL_SUPERIOR'
      OnGetText = cdsCategoriasNL_SUPERIORGetText
    end
    object cdsCategoriasATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCategoriasVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsCategoriasINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCategoriasDESCR_STATUS: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusAnimal
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 31
      Lookup = True
    end
  end
  object dspCategorias: TDataSetProvider
    DataSet = sqlCategorias
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspCategoriasBeforeUpdateRecord
    Left = 38
    Top = 57
  end
  object sqlCategorias: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  KZOO_CFGCATEGORIA, '#13#10'  KCAD_FAZENDA, '#13#10'  DESCRICAO, '#13 +
      #10'  STATUS, '#13#10'  IDADE_INFERIOR, '#13#10'  IDADE_SUPERIOR, '#13#10'  DEL_INFER' +
      'IOR, '#13#10'  DEL_SUPERIOR, '#13#10'  NL_INFERIOR,'#13#10'  NL_SUPERIOR, '#13#10'  VALO' +
      'R, '#13#10'  ATIVO, '#13#10'  INTERNAL'#13#10'FROM ZOO_CFGCATEGORIAS'#13#10'WHERE KCAD_F' +
      'AZENDA = :KCAD_FAZENDA'#13#10'ORDER BY STATUS, IDADE_INFERIOR'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlCategoriasKZOO_CFGCATEGORIA: TStringField
      FieldName = 'KZOO_CFGCATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlCategoriasKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlCategoriasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 128
    end
    object sqlCategoriasSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object sqlCategoriasIDADE_INFERIOR: TIntegerField
      DisplayLabel = 'Idade inferior (dias)'
      FieldName = 'IDADE_INFERIOR'
    end
    object sqlCategoriasIDADE_SUPERIOR: TIntegerField
      DisplayLabel = 'Idade superior (dias)'
      FieldName = 'IDADE_SUPERIOR'
    end
    object sqlCategoriasDEL_INFERIOR: TIntegerField
      DisplayLabel = 'DEL inferior'
      FieldName = 'DEL_INFERIOR'
    end
    object sqlCategoriasDEL_SUPERIOR: TIntegerField
      DisplayLabel = 'DEL superior'
      FieldName = 'DEL_SUPERIOR'
    end
    object sqlCategoriasNL_INFERIOR: TIntegerField
      DisplayLabel = 'NL inferior'
      FieldName = 'NL_INFERIOR'
    end
    object sqlCategoriasNL_SUPERIOR: TIntegerField
      DisplayLabel = 'NL superior'
      FieldName = 'NL_SUPERIOR'
    end
    object sqlCategoriasVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sqlCategoriasATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlCategoriasINTERNAL: TStringField
      FieldName = 'INTERNAL'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsStatusAnimal: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 252
    Top = 16
    Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    object cdsStatusAnimalTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
