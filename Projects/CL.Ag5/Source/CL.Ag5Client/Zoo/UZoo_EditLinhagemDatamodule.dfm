object Zoo_EditLinhagemDatamodule: TZoo_EditLinhagemDatamodule
  OldCreateOrder = True
  Height = 270
  Width = 517
  object cdsAnimal: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KZOO_ANIMAL'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BRINCO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOMEESTABULO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOMECOMPLETO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'GRAUSANGUE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'COMPOSICAORACA'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'sqlLinhagem'
        DataType = ftDataSet
      end
      item
        Name = 'BRINCONOME'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnimal'
    StoreDefs = True
    BeforeOpen = cdsAnimalBeforeOpen
    OnCalcFields = cdsAnimalCalcFields
    Left = 79
    Top = 24
    object cdsAnimalKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAnimalBRINCO: TStringField
      FieldName = 'BRINCO'
      Required = True
      Size = 15
    end
    object cdsAnimalNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsAnimalNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object cdsAnimalGRAUSANGUE: TStringField
      FieldName = 'GRAUSANGUE'
      OnSetText = cdsAnimalGRAUSANGUESetText
      OnValidate = cdsAnimalGRAUSANGUEValidate
      FixedChar = True
      Size = 5
    end
    object cdsAnimalCOMPOSICAORACA: TStringField
      FieldName = 'COMPOSICAORACA'
      OnValidate = cdsAnimalCOMPOSICAORACAValidate
      Size = 32
    end
    object cdsAnimalBRINCONOME: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'BRINCONOME'
      Size = 100
    end
    object cdsAnimalsqlLinhagem: TDataSetField
      DisplayLabel = 'Linhagem'
      FieldName = 'sqlLinhagem'
    end
  end
  object dspAnimal: TDataSetProvider
    DataSet = sqlAnimal
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 39
    Top = 69
  end
  object sqlAnimal: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'   KZOO_ANIMAL,  '#13#10'   BRINCO, '#13#10'   NOMEESTABULO, '#13#10'   N' +
      'OMECOMPLETO, '#13#10'  GRAUSANGUE,'#13#10'  COMPOSICAORACA'#13#10'FROM ZOO_ANIMAIS' +
      #13#10'WHERE KZOO_ANIMAL = :KZOO_ANIMAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 74
    Top = 112
    object sqlAnimalKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlAnimalBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlAnimalNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object sqlAnimalNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object sqlAnimalGRAUSANGUE: TStringField
      FieldName = 'GRAUSANGUE'
      FixedChar = True
      Size = 5
    end
    object sqlAnimalCOMPOSICAORACA: TStringField
      FieldName = 'COMPOSICAORACA'
      Size = 32
    end
  end
  object dtsSQLAnimal: TDataSource
    DataSet = sqlAnimal
    Left = 120
    Top = 172
  end
  object cdsLinhagem: TClientDataSet
    Aggregates = <>
    DataSetField = cdsAnimalsqlLinhagem
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    OnCalcFields = cdsLinhagemCalcFields
    OnNewRecord = cdsLinhagemNewRecord
    Left = 171
    Top = 26
    object cdsLinhagemKZOO_ANIMAL_LINHAGEM: TStringField
      FieldName = 'KZOO_ANIMAL_LINHAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLinhagemKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object cdsLinhagemKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      FixedChar = True
    end
    object cdsLinhagemNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      OnSetText = cdsLinhagemNOMEPAISetText
      Size = 60
    end
    object cdsLinhagemKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      FixedChar = True
    end
    object cdsLinhagemNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      OnSetText = cdsLinhagemNOMEMAESetText
      Size = 60
    end
    object cdsLinhagemGRAUSANGUEPAI: TStringField
      FieldName = 'GRAUSANGUEPAI'
      FixedChar = True
      Size = 5
    end
    object cdsLinhagemCOMPOSICAORACAPAI: TStringField
      FieldName = 'COMPOSICAORACAPAI'
      Size = 32
    end
    object cdsLinhagemGRAUSANGUEMAE: TStringField
      FieldName = 'GRAUSANGUEMAE'
      FixedChar = True
      Size = 5
    end
    object cdsLinhagemCOMPOSICAORACAMAE: TStringField
      FieldName = 'COMPOSICAORACAMAE'
      Size = 32
    end
    object cdsLinhagemGSR_PAI: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'GSR_PAI'
      Size = 30
    end
    object cdsLinhagemGSR_MAE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'GSR_MAE'
      Size = 30
    end
  end
  object sqlLinhagem: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select  '#13#10'  KZOO_ANIMAL_LINHAGEM, '#13#10'  KZOO_ANIMAL,'#13#10'  KZOO_ANIMA' +
      'L_MACHO,'#13#10'  NOMEPAI,'#13#10'  GRAUSANGUEPAI, '#13#10'  COMPOSICAORACAPAI,'#13#10' ' +
      ' KZOO_ANIMAL_FEMEA,'#13#10'  NOMEMAE,'#13#10'  GRAUSANGUEMAE, '#13#10'  COMPOSICAO' +
      'RACAMAE'#13#10'from ZOO_ANIMAL_LINHAGEM'#13#10'WHERE KZOO_ANIMAL = :KZOO_ANI' +
      'MAL'
    DataSource = dtsSQLAnimal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 172
    Top = 112
    object sqlLinhagemKZOO_ANIMAL_LINHAGEM: TStringField
      FieldName = 'KZOO_ANIMAL_LINHAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlLinhagemKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlLinhagemKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      FixedChar = True
    end
    object sqlLinhagemNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 60
    end
    object sqlLinhagemKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      FixedChar = True
    end
    object sqlLinhagemNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 60
    end
    object sqlLinhagemGRAUSANGUEPAI: TStringField
      FieldName = 'GRAUSANGUEPAI'
      FixedChar = True
      Size = 5
    end
    object sqlLinhagemCOMPOSICAORACAPAI: TStringField
      FieldName = 'COMPOSICAORACAPAI'
      Size = 32
    end
    object sqlLinhagemGRAUSANGUEMAE: TStringField
      FieldName = 'GRAUSANGUEMAE'
      FixedChar = True
      Size = 5
    end
    object sqlLinhagemCOMPOSICAORACAMAE: TStringField
      FieldName = 'COMPOSICAORACAMAE'
      Size = 32
    end
  end
  object cdsTipoComposicaoRaca: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 392
    Top = 23
    Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    object cdsTipoComposicaoRacaTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoComposicaoRacaVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoComposicaoRacaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoComposicaoRacaORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
