object Zoo_AtividadesLVListagemGeralDatamodule: TZoo_AtividadesLVListagemGeralDatamodule
  OldCreateOrder = True
  Height = 263
  Width = 345
  object cdsAListagemGeral: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAListagemGeral'
    BeforeOpen = cdsAListagemGeralBeforeOpen
    Left = 75
    Top = 11
    object cdsAListagemGeralKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object cdsAListagemGeralBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = []
      Size = 15
    end
    object cdsAListagemGeralBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Visible = False
      Size = 16
    end
    object cdsAListagemGeralNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = []
      Size = 60
    end
    object cdsAListagemGeralLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      ProviderFlags = []
      FixedChar = True
      Size = 32
    end
    object cdsAListagemGeralPROBLEMA: TStringField
      DisplayLabel = 'Problema'
      FieldKind = fkInternalCalc
      FieldName = 'PROBLEMA'
      Size = 100
    end
    object cdsAListagemGeralULTIMO_PARTO: TSQLTimeStampField
      DisplayLabel = 'Data '#218'ltimo Parto'
      FieldName = 'ULTIMO_PARTO'
      ProviderFlags = []
    end
    object cdsAListagemGeralULTIMA_COBERTURA: TSQLTimeStampField
      DisplayLabel = 'Data '#218'ltima Cobertura'
      FieldName = 'ULTIMA_COBERTURA'
      ProviderFlags = []
    end
    object cdsAListagemGeralINTERVALO: TIntegerField
      DisplayLabel = 'Intervalo'
      FieldKind = fkInternalCalc
      FieldName = 'INTERVALO'
    end
    object cdsAListagemGeralULTIMO_TOQUE: TSQLTimeStampField
      DisplayLabel = 'Data '#250'lt toque'
      FieldName = 'ULTIMO_TOQUE'
    end
  end
  object dspAListagemGeral: TDataSetProvider
    DataSet = sqlAListagemGeral
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 41
    Top = 59
  end
  object sqlAListagemGeral: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  AF.KZOO_ANIMAL,'#13#10'  AF.BRINCO,'#13#10'  AF.BRINCO_,'#13#10'  AF.NOM' +
      'EESTABULO,'#13#10'  DAF.LOTE,'#13#10'  DAF.ULTIMA_LACTACAO ULTIMO_PARTO,'#13#10'  ' +
      'DAF.ULTIMA_MONTA ULTIMA_COBERTURA,'#13#10'  EZ.DATATOQUE ULTIMO_TOQUE'#13 +
      #10'FROM ZOO_ANIMAIS AF'#13#10'JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANI' +
      'MAL_FEMEA = AF.KZOO_ANIMAL'#13#10'JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON E' +
      'Z.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO'#13#10'WHERE ' +
      'AF.KCAD_FAZENDA = :KCAD_FAZENDA'#13#10'  AND 1=0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 103
    object sqlAListagemGeralKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
      FixedChar = True
    end
    object sqlAListagemGeralBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlAListagemGeralBRINCO_: TStringField
      FieldName = 'BRINCO_'
      Size = 16
    end
    object sqlAListagemGeralNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object sqlAListagemGeralLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlAListagemGeralULTIMO_PARTO: TSQLTimeStampField
      FieldName = 'ULTIMO_PARTO'
    end
    object sqlAListagemGeralULTIMA_COBERTURA: TSQLTimeStampField
      FieldName = 'ULTIMA_COBERTURA'
    end
    object sqlAListagemGeralULTIMO_TOQUE: TSQLTimeStampField
      FieldName = 'ULTIMO_TOQUE'
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
    Left = 256
    Top = 16
    object cdsTipoEventoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 31
    end
    object cdsTipoEventoVALOR: TStringField
      FieldName = 'VALOR'
      Size = 31
    end
    object cdsTipoEventoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 31
    end
    object cdsTipoEventoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
