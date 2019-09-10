object dtmZoo_FilhosAnimal: TdtmZoo_FilhosAnimal
  OldCreateOrder = True
  Height = 184
  Width = 352
  object sqlFilhos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT  '#13#10'  L.KZOO_ANIMAL_LINHAGEM, '#13#10'  L.KZOO_ANIMAL,'#13#10'  L.KZOO' +
      '_ANIMAL_FEMEA,'#13#10'  COALESCE ( A.BRINCO, L.BRINCO ) BRINCO,'#13#10'  COA' +
      'LESCE ( F.NASCIMENTO, M.NASCIMENTO, L.NASCIMENTO ) NASCIMENTO,'#13#10 +
      '  COALESCE ( A.NOMEESTABULO, L.NOMEANIMAL ) NOMEANIMAL,'#13#10'  CASE'#13 +
      #10'    WHEN F.KZOO_ANIMAL_FEMEA IS NOT NULL THEN '#39'F'#39#13#10'    WHEN M.K' +
      'ZOO_ANIMAL_MACHO IS NOT NULL THEN '#39'M'#39#13#10'    ELSE L.SEXO'#13#10'  END SE' +
      'XO,'#13#10'  L.NATIMORTO,'#13#10'  COALESCE ( A.GRAUSANGUE, L.GRAUSANGUE ) G' +
      'RAUSANGUE,'#13#10'  COALESCE ( A.RACA, L.RACA ) RACA,'#13#10'  COALESCE ( P.' +
      'NOMEESTABULO, L.NOMEPAI ) NOMEPAI,'#13#10'  L.PESO'#13#10'FROM ZOO_ANIMAL_LI' +
      'NHAGEM L'#13#10'LEFT JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = L.KZOO_ANIM' +
      'AL'#13#10'LEFT JOIN ZOO_ANIMAIS_FEMEA F ON F.KZOO_ANIMAL_FEMEA = A.KZO' +
      'O_ANIMAL'#13#10'LEFT JOIN ZOO_ANIMAIS_MACHO M ON M.KZOO_ANIMAL_MACHO =' +
      ' A.KZOO_ANIMAL'#13#10'LEFT JOIN ZOO_ANIMAIS P ON A.KZOO_ANIMAL = L.KZO' +
      'O_ANIMAL_MACHO'#13#10'WHERE L.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 82
    Top = 80
    object sqlFilhosKZOO_ANIMAL_LINHAGEM: TStringField
      FieldName = 'KZOO_ANIMAL_LINHAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlFilhosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlFilhosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
      FixedChar = True
    end
    object sqlFilhosNASCIMENTO: TSQLTimeStampField
      DisplayLabel = 'Data do parto'
      FieldName = 'NASCIMENTO'
    end
    object sqlFilhosBRINCO: TStringField
      DisplayLabel = 'Brinco filho(a)'
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlFilhosNOMEANIMAL: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEANIMAL'
      Size = 60
    end
    object sqlFilhosSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object sqlFilhosNATIMORTO: TStringField
      DisplayLabel = 'Natimorto'
      FieldName = 'NATIMORTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlFilhosGRAUSANGUE: TStringField
      DisplayLabel = 'Grau de sangue'
      FieldName = 'GRAUSANGUE'
      FixedChar = True
      Size = 5
    end
    object sqlFilhosRACA: TIntegerField
      DisplayLabel = 'Ra'#231'a'
      FieldName = 'RACA'
    end
    object sqlFilhosNOMEPAI: TStringField
      DisplayLabel = 'Pai'
      FieldName = 'NOMEPAI'
      Size = 60
    end
    object sqlFilhosPESO: TIntegerField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
  end
  object cdsFilhos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspFilhos'
    BeforeInsert = cdsFilhosBeforeInsert
    OnNewRecord = cdsFilhosNewRecord
    Left = 83
    Top = 11
    object cdsFilhosKZOO_ANIMAL_LINHAGEM: TStringField
      FieldName = 'KZOO_ANIMAL_LINHAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsFilhosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
      FixedChar = True
    end
    object cdsFilhosKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object cdsFilhosNASCIMENTO: TSQLTimeStampField
      DisplayLabel = 'Data do parto'
      FieldName = 'NASCIMENTO'
    end
    object cdsFilhosBRINCO: TStringField
      DisplayLabel = 'Brinco filho(a)'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsFilhosNOMEANIMAL: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEANIMAL'
      Size = 60
    end
    object cdsFilhosSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object cdsFilhosNATIMORTO: TStringField
      DisplayLabel = 'Natimorto'
      FieldName = 'NATIMORTO'
      Required = True
      OnGetText = cdsFilhosNATIMORTOGetText
      FixedChar = True
      Size = 1
    end
    object cdsFilhosGRAUSANGUE: TStringField
      DisplayLabel = 'Grau de sangue'
      FieldName = 'GRAUSANGUE'
      FixedChar = True
      Size = 5
    end
    object cdsFilhosRACA: TIntegerField
      DisplayLabel = 'Ra'#231'a'
      FieldName = 'RACA'
    end
    object cdsFilhosNOMEPAI: TStringField
      DisplayLabel = 'Pai'
      FieldName = 'NOMEPAI'
      Size = 60
    end
    object cdsFilhosPESO: TIntegerField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
  end
  object dspFilhos: TDataSetProvider
    DataSet = sqlFilhos
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 32
    Top = 44
  end
end
