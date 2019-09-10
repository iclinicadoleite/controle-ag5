object Zoo_RelatorioSISBOVDatamodule: TZoo_RelatorioSISBOVDatamodule
  OldCreateOrder = True
  Height = 233
  Width = 406
  object cdsFazenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspFazenda'
    BeforeOpen = cdsFazendaBeforeOpen
    Left = 78
    Top = 12
    object cdsFazendaKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsFazendaNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsFazendaCERTIFICADORA: TStringField
      FieldName = 'CERTIFICADORA'
      Size = 32
    end
    object cdsFazendaLISTA_CERTIFICADORAS: TStringField
      FieldKind = fkLookup
      FieldName = 'LISTA_CERTIFICADORAS'
      LookupDataSet = cdsCertificadoras
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CERTIFICADORA'
      Size = 32
      Lookup = True
    end
  end
  object dspFazenda: TDataSetProvider
    DataSet = sqlFazenda
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlFazenda: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' F.KCAD_FAZENDA,'#13#10' F.CERTIFICADORA,'#13#10' E.NOME'#13#10'FROM CAD_' +
      'FAZENDAS F'#13#10'LEFT JOIN CAD_ENTIDADES E ON E.KCAD_FAZENDA = F.KCAD' +
      '_FAZENDA'#13#10'WHERE  F.KCAD_FAZENDA = :KCAD_FAZENDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    Left = 73
    Top = 112
    object sqlFazendaKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlFazendaCERTIFICADORA: TStringField
      FieldName = 'CERTIFICADORA'
      Size = 32
    end
    object sqlFazendaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
  end
  object cdsCertificadoras: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 320
    Top = 12
    object cdsCertificadorasTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsCertificadorasVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsCertificadorasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object cdsCertificadorasORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsAnimais: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTADA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnimais'
    BeforeOpen = cdsAnimaisBeforeOpen
    Left = 190
    Top = 12
    object cdsAnimaisBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsAnimaisNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsAnimaisLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object dspAnimais: TDataSetProvider
    DataSet = sqlAnimais
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 150
    Top = 57
  end
  object sqlAnimais: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  AN.BRINCO,'#13#10'  AN.NOMEESTABULO,'#13#10'  AF.LOTE'#13#10'FROM ZOO_AN' +
      'IMAIS AN'#13#10'JOIN ZOO_ANIMAIS_FEMEA AF ON AF.KZOO_ANIMAL_FEMEA = AN' +
      '.KZOO_ANIMAL'#13#10'WHERE AN.KCAD_FAZENDA = :KCAD_FAZENDA'#13#10'  AND AN.ST' +
      'ATUS IS DISTINCT FROM :DESCARTADA'#13#10'  AND AF.INTENCAO_DESCARTE IS' +
      ' DISTINCT FROM '#39'T'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTADA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 185
    Top = 112
    object sqlAnimaisBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlAnimaisNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object sqlAnimaisLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
end
