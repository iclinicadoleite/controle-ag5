object EST_CompraEstoqueMinimoDatamodule: TEST_CompraEstoqueMinimoDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 469
  object cdsProdutosQtdeMinima: TClientDataSet
    Aggregates = <>
    Filter = 'SELECTED = '#39'T'#39
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutosQtdeMinima'
    BeforeOpen = cdsProdutosQtdeMinimaBeforeOpen
    Left = 78
    Top = 12
    object cdsProdutosQtdeMinimaCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsProdutosQtdeMinimaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsProdutosQtdeMinimaUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 32
    end
    object cdsProdutosQtdeMinimaKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      Visible = False
      FixedChar = True
    end
    object cdsProdutosQtdeMinimaDESC_TIPO: TStringField
      DisplayLabel = 'Grupo'
      FieldKind = fkLookup
      FieldName = 'DESC_TIPO'
      LookupDataSet = cdsTiposProduto
      LookupKeyFields = 'KCAD_TIPOS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'KTIPO_PRODUTO'
      Size = 30
      Lookup = True
    end
    object cdsProdutosQtdeMinimaQTDE_MINIMA: TFloatField
      DisplayLabel = 'M'#237'nimo'
      FieldName = 'QTDE_MINIMA'
    end
    object cdsProdutosQtdeMinimaQTDE_PRODUTO: TFloatField
      DisplayLabel = 'Em estoque'
      FieldName = 'QTDE_PRODUTO'
    end
    object cdsProdutosQtdeMinimaQTDE_COMPRAR: TFloatField
      DisplayLabel = 'Qtde a Comprar'
      FieldKind = fkInternalCalc
      FieldName = 'QTDE_COMPRAR'
    end
    object cdsProdutosQtdeMinimaSELECTED: TStringField
      DisplayLabel = 'Selecionado'
      FieldName = 'SELECTED'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspProdutosQtdeMinima: TDataSetProvider
    DataSet = sqlProdutosQtdeMinima
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlProdutosQtdeMinima: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  CAST( '#39'T'#39' as Char ( 1 ) ) SELECTED,'
      '  P.CODIGO,'
      '  P.NOME,'
      '  P.UNIDADE,'
      '  P.KTIPO_PRODUTO,'
      '  P.QTDE_MINIMA,'
      '  P.QTDE_PRODUTO'
      'FROM EST_PRODUTOS P'
      'WHERE P.KSYS$DOMAIN = :KSYS$DOMAIN '
      '  AND P.ATIVO = '#39'T'#39
      '  AND P.BAIXA_ESTOQUE = '#39'T'#39
      '  AND P.QTDE_PRODUTO <= P.QTDE_MINIMA')
    Left = 73
    Top = 100
    object sqlProdutosQtdeMinimaCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlProdutosQtdeMinimaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlProdutosQtdeMinimaUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 32
    end
    object sqlProdutosQtdeMinimaKTIPO_PRODUTO: TStringField
      FieldName = 'KTIPO_PRODUTO'
      FixedChar = True
    end
    object sqlProdutosQtdeMinimaQTDE_MINIMA: TFloatField
      FieldName = 'QTDE_MINIMA'
    end
    object sqlProdutosQtdeMinimaQTDE_PRODUTO: TFloatField
      FieldName = 'QTDE_PRODUTO'
    end
    object sqlProdutosQtdeMinimaSELECTED: TStringField
      FieldName = 'SELECTED'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsTiposProduto: TClientDataSet
    PersistDataPacket.Data = {
      570000009619E0BD01000000180000000200000000000300000057000A4B4341
      445F5449504F5301004900000001000557494454480200020020000944455343
      524943414F01004900000001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 365
    Top = 20
    object cdsTiposProdutoKCAD_TIPOS: TStringField
      FieldName = 'KCAD_TIPOS'
      Size = 32
    end
    object cdsTiposProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
  end
end
