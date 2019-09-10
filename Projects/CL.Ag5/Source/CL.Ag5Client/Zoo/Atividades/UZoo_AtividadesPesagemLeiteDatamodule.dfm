object Zoo_AtividadesPesagemLeiteDatamodule: TZoo_AtividadesPesagemLeiteDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 389
  object cdsAPesagemLeite: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VL'
        ParamType = ptInput
      end>
    ProviderName = 'dspAPesagemLeite'
    BeforeOpen = cdsAPesagemLeiteBeforeOpen
    Left = 79
    Top = 14
    object cdsAPesagemLeiteKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsAPesagemLeiteBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsAPesagemLeiteBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsAPesagemLeiteNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsAPesagemLeiteLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsAPesagemLeiteRETIRO: TStringField
      DisplayLabel = 'Retiro'
      FieldName = 'RETIRO'
      FixedChar = True
      Size = 32
    end
    object cdsAPesagemLeiteTOTAL: TFloatField
      DisplayLabel = #218'ltima pesagem'
      FieldName = 'TOTAL'
    end
  end
  object dspAPesagemLeite: TDataSetProvider
    DataSet = sqlAPesagemLeite
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 30
    Top = 65
  end
  object sqlAPesagemLeite: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BR' +
      'INCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  DAF.LOTE,'#13#10 +
      '  DAF.RETIRO,'#13#10'  P.TOTAL'#13#10'FROM ZOO_ANIMAIS AF'#13#10'JOIN ZOO_ANIMAIS_' +
      'FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'#13#10'LEFT JOIN Z' +
      'OO_LACTACOES L ON L.KZOO_LACTACAO = DAF.KULTIMA_LACTACAO'#13#10'LEFT J' +
      'OIN ZOO_PESAGEM_LEITE P ON P.KZOO_PESAGEM_LEITE = L.KULTIMA_PESA' +
      'GEMLEITE'#13#10'WHERE ( AF. KCAD_FAZENDA = :KCAD_FAZENDA )'#13#10'  AND ( AF' +
      '.STATUS = :VL )'#13#10'ORDER BY AF.BRINCO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 79
    Top = 102
    object sqlAPesagemLeiteKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlAPesagemLeiteBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlAPesagemLeiteBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlAPesagemLeiteNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlAPesagemLeiteLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlAPesagemLeiteRETIRO: TStringField
      DisplayLabel = 'Retiro'
      FieldName = 'RETIRO'
      FixedChar = True
      Size = 32
    end
    object sqlAPesagemLeiteTOTAL: TFloatField
      DisplayLabel = #218'ltima pesagem'
      FieldName = 'TOTAL'
    end
  end
end
