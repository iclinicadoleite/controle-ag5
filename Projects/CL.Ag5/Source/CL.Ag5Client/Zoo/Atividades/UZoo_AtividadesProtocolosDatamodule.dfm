object Zoo_AtividadesProtocolosDatamodule: TZoo_AtividadesProtocolosDatamodule
  OldCreateOrder = True
  Height = 238
  Width = 344
  object cdsAProtocolos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENDENTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspAProtocolos'
    BeforeOpen = cdsAProtocolosBeforeOpen
    Left = 73
    Top = 10
    object cdsAProtocolosKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object cdsAProtocolosBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsAProtocolosBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsAProtocolosNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsAProtocolosTIPO_PROTOCOLO: TStringField
      DisplayLabel = 'Tipo protocolo'
      FieldName = 'TIPO_PROTOCOLO'
      Required = True
      Size = 32
    end
    object cdsAProtocolosTAREFAS: TStringField
      DisplayLabel = 'Tarefas'
      FieldName = 'TAREFAS'
      Size = 147
    end
    object cdsAProtocolosRESPONSAVEL: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'RESPONSAVEL'
      Size = 128
    end
    object cdsAProtocolosOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspAProtocolos: TDataSetProvider
    DataSet = sqlAProtocolos
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 59
  end
  object sqlAProtocolos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BR' +
      'INCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  AP.CODIGO T' +
      'IPO_PROTOCOLO,'#13#10'   (IIF (TP.VEZAODIA = 1, TP.NOME,'#13#10'        TP.N' +
      'OME || '#39' ('#39' || TP.VEZAODIA || '#39#170' vez)'#39')'#13#10'    ) TAREFAS,'#13#10'  TP.NO' +
      'MEFUNCIONARIO RESPONSAVEL,'#13#10'  TP.OBS'#13#10'FROM ZOO_ANIMAIS_FEMEA DAF' +
      #13#10'JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = DAF.KZOO_ANIMAL_FEMEA'#13 +
      #10'JOIN ZOO_ANIMAL_PROTOCOLOS AP ON AP.KZOO_ANIMAL_FEMEA =  DAF.KZ' +
      'OO_ANIMAL_FEMEA'#13#10'JOIN ZOO_ANIMAL_TAREFAS TP ON TP.KZOO_ANIMAL_PR' +
      'OTOCOLO = AP.KZOO_ANIMAL_PROTOCOLO'#13#10'WHERE ( AF.KCAD_FAZENDA = :K' +
      'CAD_FAZENDA )'#13#10'  AND ( TP.DATAPREVISTA <= :DATA )'#13#10'  AND ( TP.ST' +
      'ATUS = :PENDENTE )'#13#10'ORDER BY TP.DATAPREVISTA, AF.BRINCO_'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENDENTE'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 105
    object sqlAProtocolosKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlAProtocolosBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlAProtocolosBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlAProtocolosNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlAProtocolosTIPO_PROTOCOLO: TStringField
      DisplayLabel = 'Tipo protocolo'
      FieldName = 'TIPO_PROTOCOLO'
      Required = True
      Size = 32
    end
    object sqlAProtocolosTAREFAS: TStringField
      DisplayLabel = 'Tarefas'
      FieldName = 'TAREFAS'
      Size = 147
    end
    object sqlAProtocolosRESPONSAVEL: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'RESPONSAVEL'
      Size = 128
    end
    object sqlAProtocolosOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
end
