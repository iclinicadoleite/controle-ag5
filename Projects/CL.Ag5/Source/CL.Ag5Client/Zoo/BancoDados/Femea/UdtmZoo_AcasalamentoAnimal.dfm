object dtmZoo_AcasalamentoAnimal: TdtmZoo_AcasalamentoAnimal
  OldCreateOrder = True
  Left = 467
  Top = 192
  Height = 351
  Width = 567
  object cdsAcasalamento1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KZOO_ANIMAL_ACASALAMENTO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_ANIMAL_FEMEA'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_ANIMAL_MACHO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BRINCOMACHO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOMEMACHO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PREFERENCIA'
        DataType = ftInteger
      end
      item
        Name = 'REGISTRO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ESTOQUE'
        DataType = ftInteger
      end
      item
        Name = 'DS_LEITE'
        DataType = ftInteger
      end
      item
        Name = 'DS_TIPO'
        DataType = ftFloat
      end
      item
        Name = 'DS_UBERE'
        DataType = ftFloat
      end
      item
        Name = 'DS_PERNAPE'
        DataType = ftFloat
      end
      item
        Name = 'DS_FACILIDADEPARTO'
        DataType = ftFloat
      end
      item
        Name = 'PRECO_COMPRA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'DS_BOTIJAO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DS_CANECA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DS_HACK'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    IndexFieldNames = 'KZOO_ANIMAL_FEMEA'
    MasterFields = 'KZOO_ANIMAL'
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcasalamento1'
    StoreDefs = True
    OnNewRecord = cdsAcasalamentoNewRecord
    Left = 79
    Top = 14
    object cdsAcasalamento1KZOO_ANIMAL_ACASALAMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_ACASALAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento1KZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento1KZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento1BRINCOMACHO: TStringField
      FieldName = 'BRINCOMACHO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento1NOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsAcasalamento1PREFERENCIA: TIntegerField
      FieldName = 'PREFERENCIA'
    end
    object cdsAcasalamento1REGISTRO: TStringField
      FieldName = 'REGISTRO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento1ESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento1DS_LEITE: TIntegerField
      FieldName = 'DS_LEITE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento1DS_TIPO: TFloatField
      FieldName = 'DS_TIPO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento1DS_UBERE: TFloatField
      FieldName = 'DS_UBERE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento1DS_PERNAPE: TFloatField
      FieldName = 'DS_PERNAPE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento1DS_FACILIDADEPARTO: TFloatField
      FieldName = 'DS_FACILIDADEPARTO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento1PRECO_COMPRA: TFMTBCDField
      FieldName = 'PRECO_COMPRA'
      ProviderFlags = [pfInWhere]
      Precision = 15
      Size = 2
    end
    object cdsAcasalamento1DS_BOTIJAO: TStringField
      FieldName = 'DS_BOTIJAO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento1DS_CANECA: TStringField
      FieldName = 'DS_CANECA'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento1DS_HACK: TStringField
      FieldName = 'DS_HACK'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
  end
  object sqlAcasalamento1: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    ObjectView = True
    CommandText = 
      'SELECT  '#13#10'  AC.KZOO_ANIMAL_ACASALAMENTO,'#13#10'  AC.KZOO_ANIMAL_FEMEA' +
      ','#13#10'  AC.KZOO_ANIMAL_MACHO,'#13#10'  AM.BRINCO BRINCOMACHO,'#13#10'  AM.NOMEE' +
      'STABULO NOMEMACHO,'#13#10'  AC.PREFERENCIA,'#13#10'  AM.REGISTRO,'#13#10'  DAM.QTD' +
      'E_SEMEN ESTOQUE,'#13#10'  DAM.DS_LEITE,'#13#10'  DAM.DS_TIPO,'#13#10'  DAM.DS_UBER' +
      'E,'#13#10'  DAM.DS_PERNAPE,'#13#10'  '#39#39' SANIDADE,'#13#10'--  LONGEVIDADE'#13#10'  DAM.DS' +
      '_FACILIDADEPARTO,'#13#10'  AM.PRECO_COMPRA,'#13#10'  DAM.DS_BOTIJAO,'#13#10'  DAM.' +
      'DS_CANECA,'#13#10'  DAM.DS_HACK'#13#10'FROM ZOO_ANIMAL_ACASALAMENTOS AC'#13#10'LEF' +
      'T JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = AC.KZOO_ANIMAL_MACHO'#13#10 +
      'LEFT JOIN ZOO_ANIMAIS_MACHO DAM ON DAM.KZOO_ANIMAL_MACHO = AM.KZ' +
      'OO_ANIMAL'#13#10'WHERE AC.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'#13#10'  AND AC.P' +
      'REFERENCIA =1'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 79
    Top = 101
    object sqlAcasalamento1KZOO_ANIMAL_ACASALAMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_ACASALAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento1KZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento1KZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento1BRINCOMACHO: TStringField
      FieldName = 'BRINCOMACHO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento1NOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlAcasalamento1PREFERENCIA: TIntegerField
      FieldName = 'PREFERENCIA'
    end
    object sqlAcasalamento1REGISTRO: TStringField
      FieldName = 'REGISTRO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento1ESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento1DS_LEITE: TIntegerField
      FieldName = 'DS_LEITE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento1DS_TIPO: TFloatField
      FieldName = 'DS_TIPO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento1DS_UBERE: TFloatField
      FieldName = 'DS_UBERE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento1DS_PERNAPE: TFloatField
      FieldName = 'DS_PERNAPE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento1DS_FACILIDADEPARTO: TFloatField
      FieldName = 'DS_FACILIDADEPARTO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento1PRECO_COMPRA: TFMTBCDField
      FieldName = 'PRECO_COMPRA'
      ProviderFlags = [pfInWhere]
      Precision = 15
      Size = 2
    end
    object sqlAcasalamento1DS_BOTIJAO: TStringField
      FieldName = 'DS_BOTIJAO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento1DS_CANECA: TStringField
      FieldName = 'DS_CANECA'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento1DS_HACK: TStringField
      FieldName = 'DS_HACK'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
  end
  object dspAcasalamento1: TDataSetProvider
    DataSet = sqlAcasalamento1
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 45
    Top = 57
  end
  object cdsAcasalamento2: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KZOO_ANIMAL_ACASALAMENTO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_ANIMAL_FEMEA'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_ANIMAL_MACHO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BRINCOMACHO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOMEMACHO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PREFERENCIA'
        DataType = ftInteger
      end
      item
        Name = 'REGISTRO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ESTOQUE'
        DataType = ftInteger
      end
      item
        Name = 'DS_LEITE'
        DataType = ftInteger
      end
      item
        Name = 'DS_TIPO'
        DataType = ftFloat
      end
      item
        Name = 'DS_UBERE'
        DataType = ftFloat
      end
      item
        Name = 'DS_PERNAPE'
        DataType = ftFloat
      end
      item
        Name = 'SANIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DS_FACILIDADEPARTO'
        DataType = ftFloat
      end
      item
        Name = 'PRECO_COMPRA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'DS_BOTIJAO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DS_CANECA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DS_HACK'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    IndexFieldNames = 'KZOO_ANIMAL_FEMEA'
    MasterFields = 'KZOO_ANIMAL'
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcasalamento2'
    StoreDefs = True
    OnNewRecord = cdsAcasalamentoNewRecord
    Left = 215
    Top = 14
    object cdsAcasalamento2KZOO_ANIMAL_ACASALAMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_ACASALAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento2KZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento2KZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento2BRINCOMACHO: TStringField
      FieldName = 'BRINCOMACHO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento2NOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsAcasalamento2PREFERENCIA: TIntegerField
      FieldName = 'PREFERENCIA'
    end
    object cdsAcasalamento2REGISTRO: TStringField
      FieldName = 'REGISTRO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento2ESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento2DS_LEITE: TIntegerField
      FieldName = 'DS_LEITE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento2DS_TIPO: TFloatField
      FieldName = 'DS_TIPO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento2DS_UBERE: TFloatField
      FieldName = 'DS_UBERE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento2DS_PERNAPE: TFloatField
      FieldName = 'DS_PERNAPE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento2SANIDADE: TStringField
      FieldName = 'SANIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object cdsAcasalamento2DS_FACILIDADEPARTO: TFloatField
      FieldName = 'DS_FACILIDADEPARTO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento2PRECO_COMPRA: TFMTBCDField
      FieldName = 'PRECO_COMPRA'
      ProviderFlags = [pfInWhere]
      Precision = 15
      Size = 2
    end
    object cdsAcasalamento2DS_BOTIJAO: TStringField
      FieldName = 'DS_BOTIJAO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento2DS_CANECA: TStringField
      FieldName = 'DS_CANECA'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento2DS_HACK: TStringField
      FieldName = 'DS_HACK'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
  end
  object sqlAcasalamento2: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    ObjectView = True
    CommandText = 
      'SELECT  '#13#10'  AC.KZOO_ANIMAL_ACASALAMENTO,'#13#10'  AC.KZOO_ANIMAL_FEMEA' +
      ','#13#10'  AC.KZOO_ANIMAL_MACHO,'#13#10'  AM.BRINCO BRINCOMACHO,'#13#10'  AM.NOMEE' +
      'STABULO NOMEMACHO,'#13#10'  AC.PREFERENCIA,'#13#10'  AM.REGISTRO,'#13#10'  DAM.QTD' +
      'E_SEMEN ESTOQUE,'#13#10'  DAM.DS_LEITE,'#13#10'  DAM.DS_TIPO,'#13#10'  DAM.DS_UBER' +
      'E,'#13#10'  DAM.DS_PERNAPE,'#13#10'  '#39#39' SANIDADE,'#13#10'--  LONGEVIDADE'#13#10'  DAM.DS' +
      '_FACILIDADEPARTO,'#13#10'  AM.PRECO_COMPRA,'#13#10'  DAM.DS_BOTIJAO,'#13#10'  DAM.' +
      'DS_CANECA,'#13#10'  DAM.DS_HACK'#13#10'FROM ZOO_ANIMAL_ACASALAMENTOS AC'#13#10'LEF' +
      'T JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = AC.KZOO_ANIMAL_MACHO'#13#10 +
      'LEFT JOIN ZOO_ANIMAIS_MACHO DAM ON DAM.KZOO_ANIMAL_MACHO = AM.KZ' +
      'OO_ANIMAL'#13#10'WHERE AC.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'#13#10'  AND AC.P' +
      'REFERENCIA =2'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 215
    Top = 101
    object sqlAcasalamento2KZOO_ANIMAL_ACASALAMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_ACASALAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento2KZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento2KZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento2BRINCOMACHO: TStringField
      FieldName = 'BRINCOMACHO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento2NOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlAcasalamento2PREFERENCIA: TIntegerField
      FieldName = 'PREFERENCIA'
    end
    object sqlAcasalamento2REGISTRO: TStringField
      FieldName = 'REGISTRO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento2ESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento2DS_LEITE: TIntegerField
      FieldName = 'DS_LEITE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento2DS_TIPO: TFloatField
      FieldName = 'DS_TIPO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento2DS_UBERE: TFloatField
      FieldName = 'DS_UBERE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento2DS_PERNAPE: TFloatField
      FieldName = 'DS_PERNAPE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento2SANIDADE: TStringField
      FieldName = 'SANIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlAcasalamento2DS_FACILIDADEPARTO: TFloatField
      FieldName = 'DS_FACILIDADEPARTO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento2PRECO_COMPRA: TFMTBCDField
      FieldName = 'PRECO_COMPRA'
      ProviderFlags = [pfInWhere]
      Precision = 15
      Size = 2
    end
    object sqlAcasalamento2DS_BOTIJAO: TStringField
      FieldName = 'DS_BOTIJAO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento2DS_CANECA: TStringField
      FieldName = 'DS_CANECA'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento2DS_HACK: TStringField
      FieldName = 'DS_HACK'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
  end
  object dspAcasalamento2: TDataSetProvider
    DataSet = sqlAcasalamento2
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 181
    Top = 57
  end
  object cdsAcasalamento3: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KZOO_ANIMAL_ACASALAMENTO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_ANIMAL_FEMEA'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_ANIMAL_MACHO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BRINCOMACHO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOMEMACHO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PREFERENCIA'
        DataType = ftInteger
      end
      item
        Name = 'REGISTRO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ESTOQUE'
        DataType = ftInteger
      end
      item
        Name = 'DS_LEITE'
        DataType = ftInteger
      end
      item
        Name = 'DS_TIPO'
        DataType = ftFloat
      end
      item
        Name = 'DS_UBERE'
        DataType = ftFloat
      end
      item
        Name = 'DS_PERNAPE'
        DataType = ftFloat
      end
      item
        Name = 'SANIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DS_FACILIDADEPARTO'
        DataType = ftFloat
      end
      item
        Name = 'PRECO_COMPRA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'DS_BOTIJAO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DS_CANECA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DS_HACK'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    IndexFieldNames = 'KZOO_ANIMAL_FEMEA'
    MasterFields = 'KZOO_ANIMAL'
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcasalamento3'
    StoreDefs = True
    OnNewRecord = cdsAcasalamentoNewRecord
    Left = 327
    Top = 14
    object cdsAcasalamento3KZOO_ANIMAL_ACASALAMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_ACASALAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento3KZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento3KZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento3BRINCOMACHO: TStringField
      FieldName = 'BRINCOMACHO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento3NOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsAcasalamento3PREFERENCIA: TIntegerField
      FieldName = 'PREFERENCIA'
    end
    object cdsAcasalamento3REGISTRO: TStringField
      FieldName = 'REGISTRO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento3ESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento3DS_LEITE: TIntegerField
      FieldName = 'DS_LEITE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento3DS_TIPO: TFloatField
      FieldName = 'DS_TIPO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento3DS_UBERE: TFloatField
      FieldName = 'DS_UBERE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento3DS_PERNAPE: TFloatField
      FieldName = 'DS_PERNAPE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento3SANIDADE: TStringField
      FieldName = 'SANIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object cdsAcasalamento3DS_FACILIDADEPARTO: TFloatField
      FieldName = 'DS_FACILIDADEPARTO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento3PRECO_COMPRA: TFMTBCDField
      FieldName = 'PRECO_COMPRA'
      ProviderFlags = [pfInWhere]
      Precision = 15
      Size = 2
    end
    object cdsAcasalamento3DS_BOTIJAO: TStringField
      FieldName = 'DS_BOTIJAO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento3DS_CANECA: TStringField
      FieldName = 'DS_CANECA'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento3DS_HACK: TStringField
      FieldName = 'DS_HACK'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
  end
  object sqlAcasalamento3: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    ObjectView = True
    CommandText = 
      'SELECT  '#13#10'  AC.KZOO_ANIMAL_ACASALAMENTO,'#13#10'  AC.KZOO_ANIMAL_FEMEA' +
      ','#13#10'  AC.KZOO_ANIMAL_MACHO,'#13#10'  AM.BRINCO BRINCOMACHO,'#13#10'  AM.NOMEE' +
      'STABULO NOMEMACHO,'#13#10'  AC.PREFERENCIA,'#13#10'  AM.REGISTRO,'#13#10'  DAM.QTD' +
      'E_SEMEN ESTOQUE,'#13#10'  DAM.DS_LEITE,'#13#10'  DAM.DS_TIPO,'#13#10'  DAM.DS_UBER' +
      'E,'#13#10'  DAM.DS_PERNAPE,'#13#10'  '#39#39' SANIDADE,'#13#10'--  LONGEVIDADE'#13#10'  DAM.DS' +
      '_FACILIDADEPARTO,'#13#10'  AM.PRECO_COMPRA,'#13#10'  DAM.DS_BOTIJAO,'#13#10'  DAM.' +
      'DS_CANECA,'#13#10'  DAM.DS_HACK'#13#10'FROM ZOO_ANIMAL_ACASALAMENTOS AC'#13#10'LEF' +
      'T JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = AC.KZOO_ANIMAL_MACHO'#13#10 +
      'LEFT JOIN ZOO_ANIMAIS_MACHO DAM ON DAM.KZOO_ANIMAL_MACHO = AM.KZ' +
      'OO_ANIMAL'#13#10'WHERE AC.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'#13#10'  AND AC.P' +
      'REFERENCIA =3'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 327
    Top = 101
    object sqlAcasalamento3KZOO_ANIMAL_ACASALAMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_ACASALAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento3KZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento3KZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento3BRINCOMACHO: TStringField
      FieldName = 'BRINCOMACHO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento3NOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlAcasalamento3PREFERENCIA: TIntegerField
      FieldName = 'PREFERENCIA'
    end
    object sqlAcasalamento3REGISTRO: TStringField
      FieldName = 'REGISTRO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento3ESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento3DS_LEITE: TIntegerField
      FieldName = 'DS_LEITE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento3DS_TIPO: TFloatField
      FieldName = 'DS_TIPO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento3DS_UBERE: TFloatField
      FieldName = 'DS_UBERE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento3DS_PERNAPE: TFloatField
      FieldName = 'DS_PERNAPE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento3SANIDADE: TStringField
      FieldName = 'SANIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlAcasalamento3DS_FACILIDADEPARTO: TFloatField
      FieldName = 'DS_FACILIDADEPARTO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento3PRECO_COMPRA: TFMTBCDField
      FieldName = 'PRECO_COMPRA'
      ProviderFlags = [pfInWhere]
      Precision = 15
      Size = 2
    end
    object sqlAcasalamento3DS_BOTIJAO: TStringField
      FieldName = 'DS_BOTIJAO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento3DS_CANECA: TStringField
      FieldName = 'DS_CANECA'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento3DS_HACK: TStringField
      FieldName = 'DS_HACK'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
  end
  object dspAcasalamento3: TDataSetProvider
    DataSet = sqlAcasalamento3
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 293
    Top = 57
  end
  object cdsAcasalamento4: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KZOO_ANIMAL_ACASALAMENTO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_ANIMAL_FEMEA'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_ANIMAL_MACHO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BRINCOMACHO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOMEMACHO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PREFERENCIA'
        DataType = ftInteger
      end
      item
        Name = 'REGISTRO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ESTOQUE'
        DataType = ftInteger
      end
      item
        Name = 'DS_LEITE'
        DataType = ftInteger
      end
      item
        Name = 'DS_TIPO'
        DataType = ftFloat
      end
      item
        Name = 'DS_UBERE'
        DataType = ftFloat
      end
      item
        Name = 'DS_PERNAPE'
        DataType = ftFloat
      end
      item
        Name = 'SANIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DS_FACILIDADEPARTO'
        DataType = ftFloat
      end
      item
        Name = 'PRECO_COMPRA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'DS_BOTIJAO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DS_CANECA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DS_HACK'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    IndexFieldNames = 'KZOO_ANIMAL_FEMEA'
    MasterFields = 'KZOO_ANIMAL'
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcasalamento4'
    StoreDefs = True
    OnNewRecord = cdsAcasalamentoNewRecord
    Left = 459
    Top = 14
    object cdsAcasalamento4KZOO_ANIMAL_ACASALAMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_ACASALAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento4KZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento4KZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAcasalamento4BRINCOMACHO: TStringField
      FieldName = 'BRINCOMACHO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento4NOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsAcasalamento4PREFERENCIA: TIntegerField
      FieldName = 'PREFERENCIA'
    end
    object cdsAcasalamento4REGISTRO: TStringField
      FieldName = 'REGISTRO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento4ESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento4DS_LEITE: TIntegerField
      FieldName = 'DS_LEITE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento4DS_TIPO: TFloatField
      FieldName = 'DS_TIPO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento4DS_UBERE: TFloatField
      FieldName = 'DS_UBERE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento4DS_PERNAPE: TFloatField
      FieldName = 'DS_PERNAPE'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento4SANIDADE: TStringField
      FieldName = 'SANIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object cdsAcasalamento4DS_FACILIDADEPARTO: TFloatField
      FieldName = 'DS_FACILIDADEPARTO'
      ProviderFlags = [pfInWhere]
    end
    object cdsAcasalamento4PRECO_COMPRA: TFMTBCDField
      FieldName = 'PRECO_COMPRA'
      ProviderFlags = [pfInWhere]
      Precision = 15
      Size = 2
    end
    object cdsAcasalamento4DS_BOTIJAO: TStringField
      FieldName = 'DS_BOTIJAO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento4DS_CANECA: TStringField
      FieldName = 'DS_CANECA'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAcasalamento4DS_HACK: TStringField
      FieldName = 'DS_HACK'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
  end
  object sqlAcasalamento4: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    ObjectView = True
    CommandText = 
      'SELECT  '#13#10'  AC.KZOO_ANIMAL_ACASALAMENTO,'#13#10'  AC.KZOO_ANIMAL_FEMEA' +
      ','#13#10'  AC.KZOO_ANIMAL_MACHO,'#13#10'  AM.BRINCO BRINCOMACHO,'#13#10'  AM.NOMEE' +
      'STABULO NOMEMACHO,'#13#10'  AC.PREFERENCIA,'#13#10'  AM.REGISTRO,'#13#10'  DAM.QTD' +
      'E_SEMEN ESTOQUE,'#13#10'  DAM.DS_LEITE,'#13#10'  DAM.DS_TIPO,'#13#10'  DAM.DS_UBER' +
      'E,'#13#10'  DAM.DS_PERNAPE,'#13#10'  '#39#39' SANIDADE,'#13#10'--  LONGEVIDADE'#13#10'  DAM.DS' +
      '_FACILIDADEPARTO,'#13#10'  AM.PRECO_COMPRA,'#13#10'  DAM.DS_BOTIJAO,'#13#10'  DAM.' +
      'DS_CANECA,'#13#10'  DAM.DS_HACK'#13#10'FROM ZOO_ANIMAL_ACASALAMENTOS AC'#13#10'LEF' +
      'T JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = AC.KZOO_ANIMAL_MACHO'#13#10 +
      'LEFT JOIN ZOO_ANIMAIS_MACHO DAM ON DAM.KZOO_ANIMAL_MACHO = AM.KZ' +
      'OO_ANIMAL'#13#10'WHERE AC.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'#13#10'  AND AC.P' +
      'REFERENCIA =4'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 459
    Top = 101
    object sqlAcasalamento4KZOO_ANIMAL_ACASALAMENTO: TStringField
      FieldName = 'KZOO_ANIMAL_ACASALAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento4KZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento4KZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAcasalamento4BRINCOMACHO: TStringField
      FieldName = 'BRINCOMACHO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento4NOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlAcasalamento4PREFERENCIA: TIntegerField
      FieldName = 'PREFERENCIA'
    end
    object sqlAcasalamento4REGISTRO: TStringField
      FieldName = 'REGISTRO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento4ESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento4DS_LEITE: TIntegerField
      FieldName = 'DS_LEITE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento4DS_TIPO: TFloatField
      FieldName = 'DS_TIPO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento4DS_UBERE: TFloatField
      FieldName = 'DS_UBERE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento4DS_PERNAPE: TFloatField
      FieldName = 'DS_PERNAPE'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento4SANIDADE: TStringField
      FieldName = 'SANIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlAcasalamento4DS_FACILIDADEPARTO: TFloatField
      FieldName = 'DS_FACILIDADEPARTO'
      ProviderFlags = [pfInWhere]
    end
    object sqlAcasalamento4PRECO_COMPRA: TFMTBCDField
      FieldName = 'PRECO_COMPRA'
      ProviderFlags = [pfInWhere]
      Precision = 15
      Size = 2
    end
    object sqlAcasalamento4DS_BOTIJAO: TStringField
      FieldName = 'DS_BOTIJAO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento4DS_CANECA: TStringField
      FieldName = 'DS_CANECA'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAcasalamento4DS_HACK: TStringField
      FieldName = 'DS_HACK'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
  end
  object dspAcasalamento4: TDataSetProvider
    DataSet = sqlAcasalamento4
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 425
    Top = 57
  end
  object cdsListaMacho: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaMacho'
    BeforeOpen = cdsListaMachoBeforeOpen
    Left = 192
    Top = 184
    object cdsListaMachoKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsListaMachoBRINCOMACHO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'BRINCOMACHO'
      Size = 15
    end
    object cdsListaMachoNOMEMACHO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEMACHO'
      Size = 60
    end
    object cdsListaMachoREGISTRO: TStringField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object cdsListaMachoESTOQUE: TIntegerField
      DisplayLabel = 'Estoque'
      FieldName = 'ESTOQUE'
    end
    object cdsListaMachoDS_LEITE: TIntegerField
      DisplayLabel = 'Leite'
      FieldName = 'DS_LEITE'
    end
    object cdsListaMachoDS_TIPO: TFloatField
      DisplayLabel = 'Tipo'
      FieldName = 'DS_TIPO'
    end
    object cdsListaMachoDS_UBERE: TFloatField
      DisplayLabel = 'Ubere'
      FieldName = 'DS_UBERE'
    end
    object cdsListaMachoDS_PERNAPE: TFloatField
      DisplayLabel = 'Pernas e p'#233's'
      FieldName = 'DS_PERNAPE'
    end
    object cdsListaMachoSANIDADE: TStringField
      DisplayLabel = 'Sanidade'
      FieldName = 'SANIDADE'
      Size = 128
    end
    object cdsListaMachoDS_FACILIDADEPARTO: TFloatField
      DisplayLabel = 'Facilidade Parto'
      FieldName = 'DS_FACILIDADEPARTO'
    end
    object cdsListaMachoPRECO_COMPRA: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO_COMPRA'
      Precision = 15
      Size = 2
    end
    object cdsListaMachoDS_BOTIJAO: TStringField
      DisplayLabel = 'Botij'#227'o'
      FieldName = 'DS_BOTIJAO'
    end
    object cdsListaMachoDS_CANECA: TStringField
      DisplayLabel = 'Caneca'
      FieldName = 'DS_CANECA'
    end
    object cdsListaMachoDS_HACK: TStringField
      DisplayLabel = 'Hack'
      FieldName = 'DS_HACK'
      Size = 15
    end
  end
  object dspListaMacho: TDataSetProvider
    DataSet = sqlListaMacho
    UpdateMode = upWhereKeyOnly
    Left = 140
    Top = 224
  end
  object sqlListaMacho: TTcSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT'#13#10'  DAM.KZOO_ANIMAL_MACHO,'#13#10'  AM.BRINCO BRINCOMACHO,'#13#10'  AM' +
      '.NOMEESTABULO NOMEMACHO,'#13#10'  AM.REGISTRO,'#13#10'  DAM.QTDE_SEMEN ESTOQ' +
      'UE,'#13#10'  DAM.DS_LEITE,'#13#10'  DAM.DS_TIPO,'#13#10'  DAM.DS_UBERE,'#13#10'  DAM.DS_' +
      'PERNAPE,'#13#10'    ( SELECT AMS.OCORRENCIA'#13#10'        FROM ZOO_ANIMAL_M' +
      'ACHO_SANIDADE AMS'#13#10'       WHERE AMS.KZOO_ANIMAL_MACHO = DAM.KZOO' +
      '_ANIMAL_MACHO'#13#10'       ORDER BY AMS.DATA DESC'#13#10'        ROWS 1'#13#10'  ' +
      '  )SANIDADE,'#13#10'--  LONGEVIDADE'#13#10'  DAM.DS_FACILIDADEPARTO,'#13#10'  AM.P' +
      'RECO_COMPRA,'#13#10'  DAM.DS_BOTIJAO,'#13#10'  DAM.DS_CANECA,'#13#10'  DAM.DS_HACK' +
      #13#10'FROM ZOO_ANIMAIS_MACHO DAM'#13#10'JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANI' +
      'MAL = DAM.KZOO_ANIMAL_MACHO'#13#10'LEFT JOIN ZOO_ANIMAL_ACASALAMENTOS ' +
      'AC'#13#10'       ON ( AC.KZOO_ANIMAL_MACHO = DAM.KZOO_ANIMAL_MACHO )'#13#10 +
      '      AND ( AC.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA ) '#13#10'WHERE ' +
      'AM.STATUS IS DISTINCT FROM :STATUS_DESCARTADO'#13#10'  AND AC.KZOO_ANI' +
      'MAL_MACHO IS NULL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'STATUS_DESCARTADO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 192
    Top = 252
    object sqlListaMachoKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Required = True
      FixedChar = True
    end
    object sqlListaMachoBRINCOMACHO: TStringField
      FieldName = 'BRINCOMACHO'
      Size = 15
    end
    object sqlListaMachoNOMEMACHO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEMACHO'
      Size = 60
    end
    object sqlListaMachoREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object sqlListaMachoESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
    end
    object sqlListaMachoDS_LEITE: TIntegerField
      FieldName = 'DS_LEITE'
    end
    object sqlListaMachoDS_TIPO: TFloatField
      FieldName = 'DS_TIPO'
    end
    object sqlListaMachoDS_UBERE: TFloatField
      FieldName = 'DS_UBERE'
    end
    object sqlListaMachoDS_PERNAPE: TFloatField
      FieldName = 'DS_PERNAPE'
    end
    object sqlListaMachoSANIDADE: TStringField
      FieldName = 'SANIDADE'
      Size = 128
    end
    object sqlListaMachoDS_FACILIDADEPARTO: TFloatField
      FieldName = 'DS_FACILIDADEPARTO'
    end
    object sqlListaMachoPRECO_COMPRA: TFMTBCDField
      FieldName = 'PRECO_COMPRA'
      Precision = 15
      Size = 2
    end
    object sqlListaMachoDS_BOTIJAO: TStringField
      FieldName = 'DS_BOTIJAO'
    end
    object sqlListaMachoDS_CANECA: TStringField
      FieldName = 'DS_CANECA'
    end
    object sqlListaMachoDS_HACK: TStringField
      FieldName = 'DS_HACK'
      Size = 15
    end
  end
end
