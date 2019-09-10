object Zoo_CfgParametrosFazendaDatamodule: TZoo_CfgParametrosFazendaDatamodule
  OldCreateOrder = True
  Height = 239
  Width = 481
  object cdsParametrosFazenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspParametrosFazenda'
    BeforeOpen = cdsParametrosFazendaBeforeOpen
    OnNewRecord = cdsParametrosFazendaNewRecord
    Left = 78
    Top = 12
    object cdsParametrosFazendaKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsParametrosFazendaDSA_ESTQ_MACHO: TStringField
      FieldName = 'DSA_ESTQ_MACHO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParametrosFazendaDIAS_PROX_CIOSCOB: TIntegerField
      DisplayLabel = 'Dias pr'#243'ximo cios/cobertura'
      FieldName = 'DIAS_PROX_CIOSCOB'
      Required = True
      OnValidate = cdsParametrosFazendaDIAS_PROX_CIOSCOBValidate
    end
    object cdsParametrosFazendaDIAS_PROX_TAREFAS: TIntegerField
      DisplayLabel = 'Dias pr'#243'x tarefas'
      FieldName = 'DIAS_PROX_TAREFAS'
      Required = True
      OnValidate = cdsParametrosFazendaDIAS_PROX_TAREFASValidate
    end
    object cdsParametrosFazendaDIAS_PROX_SECAGENS: TIntegerField
      DisplayLabel = 'Dias pr'#243'x secagem'
      FieldName = 'DIAS_PROX_SECAGENS'
      Required = True
      OnValidate = cdsParametrosFazendaDIAS_PROX_SECAGENSValidate
    end
    object cdsParametrosFazendaDIAS_INTERVALO_BST: TIntegerField
      DisplayLabel = 'Dias intervalo de BST'
      FieldName = 'DIAS_INTERVALO_BST'
      Required = True
      OnValidate = cdsParametrosFazendaDIAS_INTERVALO_BSTValidate
    end
    object cdsParametrosFazendaESCALA_PRODUCAO: TIntegerField
      DisplayLabel = 'Escala de produ'#231#227'o'
      FieldName = 'ESCALA_PRODUCAO'
      Required = True
    end
    object cdsParametrosFazendaEXIBIR_PARTOS_SEMCONFIRMACAO: TStringField
      DisplayLabel = 'Exibir parto sem confirma'#231#227'o de prenhez'
      FieldName = 'EXIBIR_PARTOS_SEMCONFIRMACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParametrosFazendaEXCLUIR_TAREFAS_DESCARTE: TStringField
      FieldName = 'EXCLUIR_TAREFAS_DESCARTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParametrosFazendaDIAS_PRE_SECAGEM_BST: TIntegerField
      FieldName = 'DIAS_PRE_SECAGEM_BST'
      Required = True
    end
    object cdsParametrosFazendaCONSIDERAR_NAOPRENHE_SEMCONFIRM: TStringField
      FieldName = 'CONSIDERAR_NAOPRENHE_SEMCONFIRM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsParametrosFazendaCONSIDERAR_NAOPRENHE_DESCARTADO: TStringField
      FieldName = 'CONSIDERAR_NAOPRENHE_DESCARTADO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspParametrosFazenda: TDataSetProvider
    DataSet = sqlParametrosFazenda
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlParametrosFazenda: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'    KCAD_FAZENDA,'#13#10'    DSA_ESTQ_MACHO,'#13#10'    DIAS_PROX_C' +
      'IOSCOB,'#13#10'    DIAS_PROX_TAREFAS,'#13#10'    DIAS_PROX_SECAGENS,'#13#10'    DI' +
      'AS_INTERVALO_BST, ESCALA_PRODUCAO, '#13#10'    EXIBIR_PARTOS_SEMCONFIR' +
      'MACAO, '#13#10'    EXCLUIR_TAREFAS_DESCARTE,'#13#10'    DIAS_PRE_SECAGEM_BST' +
      ','#13#10'    CONSIDERAR_NAOPRENHE_SEMCONFIRM,'#13#10'    CONSIDERAR_NAOPRENH' +
      'E_DESCARTADO'#13#10'FROM CAD_FAZENDA_PARAMETROS'#13#10'WHERE  KCAD_FAZENDA =' +
      ' :KCAD_FAZENDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    Left = 73
    Top = 100
    object sqlParametrosFazendaKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlParametrosFazendaDSA_ESTQ_MACHO: TStringField
      FieldName = 'DSA_ESTQ_MACHO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParametrosFazendaDIAS_PROX_CIOSCOB: TIntegerField
      DisplayLabel = 'Dias pr'#243'ximo cios/cobertura'
      FieldName = 'DIAS_PROX_CIOSCOB'
    end
    object sqlParametrosFazendaDIAS_PROX_TAREFAS: TIntegerField
      DisplayLabel = 'Dias pr'#243'x tarefas'
      FieldName = 'DIAS_PROX_TAREFAS'
    end
    object sqlParametrosFazendaDIAS_PROX_SECAGENS: TIntegerField
      DisplayLabel = 'Dias pr'#243'x secagem'
      FieldName = 'DIAS_PROX_SECAGENS'
    end
    object sqlParametrosFazendaDIAS_INTERVALO_BST: TIntegerField
      DisplayLabel = 'Dias intervalo de BST'
      FieldName = 'DIAS_INTERVALO_BST'
    end
    object sqlParametrosFazendaESCALA_PRODUCAO: TIntegerField
      DisplayLabel = 'Escala de produ'#231#227'o'
      FieldName = 'ESCALA_PRODUCAO'
      Required = True
    end
    object sqlParametrosFazendaEXIBIR_PARTOS_SEMCONFIRMACAO: TStringField
      DisplayLabel = 'Exibir parto sem confirma'#231#227'o de prenhez'
      FieldName = 'EXIBIR_PARTOS_SEMCONFIRMACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParametrosFazendaEXCLUIR_TAREFAS_DESCARTE: TStringField
      FieldName = 'EXCLUIR_TAREFAS_DESCARTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParametrosFazendaDIAS_PRE_SECAGEM_BST: TIntegerField
      FieldName = 'DIAS_PRE_SECAGEM_BST'
      Required = True
    end
    object sqlParametrosFazendaCONSIDERAR_NAOPRENHE_SEMCONFIRM: TStringField
      FieldName = 'CONSIDERAR_NAOPRENHE_SEMCONFIRM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlParametrosFazendaCONSIDERAR_NAOPRENHE_DESCARTADO: TStringField
      FieldName = 'CONSIDERAR_NAOPRENHE_DESCARTADO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
