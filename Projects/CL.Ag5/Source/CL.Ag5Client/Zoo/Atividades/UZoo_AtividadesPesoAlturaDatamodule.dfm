object Zoo_AtividadesPesoAlturaDatamodule: TZoo_AtividadesPesoAlturaDatamodule
  OldCreateOrder = True
  Height = 257
  Width = 441
  object cdsAPesoMedida: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BEZERRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NOVILHA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAPesoMedida'
    BeforeOpen = cdsAPesoMedidaBeforeOpen
    OnCalcFields = cdsAPesoMedidaCalcFields
    Left = 80
    Top = 12
    object cdsAPesoMedidaKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object cdsAPesoMedidaBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsAPesoMedidaBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsAPesoMedidaNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsAPesoMedidaNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Visible = False
    end
    object cdsAPesoMedidaIDADE: TIntegerField
      DisplayLabel = 'Idade'
      FieldKind = fkInternalCalc
      FieldName = 'IDADE'
    end
    object cdsAPesoMedidaDATA: TSQLTimeStampField
      DisplayLabel = 'Data '#250'ltima medi'#231#227'o'
      FieldName = 'DATA'
    end
    object cdsAPesoMedidaALTURA_ANTERIOR: TIntegerField
      DisplayLabel = 'Altura anterior'
      FieldName = 'ALTURA_ANTERIOR'
    end
    object cdsAPesoMedidaPESO_ANTERIOR: TIntegerField
      DisplayLabel = 'Peso anterior'
      FieldName = 'PESO_ANTERIOR'
    end
  end
  object dspAPesoMedida: TDataSetProvider
    DataSet = sqlAPesoMedida
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 45
    Top = 63
  end
  object sqlAPesoMedida: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BR' +
      'INCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  DAF.NASCIME' +
      'NTO,'#13#10'  AC.DATA,'#13#10'  AC.ALTURA ALTURA_ANTERIOR,'#13#10'  AC.PESO PESO_A' +
      'NTERIOR'#13#10'FROM ZOO_ANIMAIS_FEMEA DAF'#13#10'JOIN ZOO_ANIMAIS AF ON AF.K' +
      'ZOO_ANIMAL = DAF.KZOO_ANIMAL_FEMEA'#13#10'LEFT JOIN ZOO_ANIMAL_CRESCIM' +
      'ENTO AC ON AC.KZOO_ANIMAL_CRESCIMENTO = DAF.KMAIOR_PESO'#13#10'WHERE (' +
      ' AF.KCAD_FAZENDA = :KCAD_FAZENDA )'#13#10'  AND ( AF.STATUS = :BEZERRA' +
      ' )'#13#10'   OR ( AF.STATUS = :NOVILHA )'#13#10'ORDER BY AF.BRINCO_ --DAF.NA' +
      'SCIMENTO, AF.BRINCO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BEZERRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NOVILHA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 80
    Top = 112
    object sqlAPesoMedidaKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object sqlAPesoMedidaBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlAPesoMedidaBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlAPesoMedidaNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlAPesoMedidaNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
    end
    object sqlAPesoMedidaDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlAPesoMedidaALTURA_ANTERIOR: TIntegerField
      FieldName = 'ALTURA_ANTERIOR'
    end
    object sqlAPesoMedidaPESO_ANTERIOR: TIntegerField
      FieldName = 'PESO_ANTERIOR'
    end
  end
end
