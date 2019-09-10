object ZooTrocaRetirosLotesDatamodule: TZooTrocaRetirosLotesDatamodule
  OldCreateOrder = False
  Height = 331
  Width = 469
  object sqlAnimaisOrigem: TTcSQLDataSet
    CommandText = 
      'SELECT '#13#10'      A.KZOO_ANIMAL,'#13#10'      A.BRINCO,'#13#10'      AF.LOTE,'#13#10 +
      '      AF.RETIRO,'#13#10'       AF.NUMERO_LACTACAO,'#13#10'       A.STATUS,'#13#10 +
      '       TRUNC ( CURRENT_TIMESTAMP - AF.ULTIMA_LACTACAO ) DPP  ,'#13#10 +
      '       (SELECT CAST( SYS$DESCRIPTION AS VARCHAR ( 50 ) )'#13#10'      ' +
      '    FROM SYS$TYPES_GETDESCRIPTION( '#39'STATUS_REPRODUTIVO'#39','#13#10'      ' +
      '            (SELECT CAST ( STATUS_REPRODUTIVO_ANIMAL AS INTEGER ' +
      ') SYS$VALUE'#13#10'                     FROM ZOO_GET_STATUS_REPRODUTIV' +
      'O( AF.KZOO_ANIMAL_FEMEA ))'#13#10'        ) ) "STATUS_REPRODUTIVO",'#13#10' ' +
      '      UC.PRODUCAO_UC "ULTIMA_PRODUCAO",'#13#10'       ANALISE.CCS,'#13#10'  ' +
      '    IIF ( E.PRENHEZ = '#39'T'#39', COALESCE ( CAST ( E.DATAABORTOPARTO A' +
      'S DATE ), CURRENT_DATE ) - CAST ( E.DATAEVENTO AS DATE ), CAST (' +
      ' NULL AS INTEGER ) )  "DEG"'#13#10' FROM ZOO_ANIMAIS A'#13#10' INNER JOIN ZO' +
      'O_ANIMAIS_FEMEA AF ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'#13#10' LEF' +
      'T  JOIN ZOO_LACTACOES UC ON UC.KZOO_LACTACAO = AF.KULTIMA_LACTAC' +
      'AO'#13#10' LEFT  JOIN VRPT_ANALISE_LEITE ANALISE ON ANALISE.KZOO_LACTA' +
      'CAO = UC.KZOO_LACTACAO'#13#10' LEFT  JOIN ZOO_EVENTOS_ZOOTECNICOS E ON' +
      ' AF.KULTIMA_MONTA = E.KZOO_EVENTO_ZOOTECNICO AND ( AF.KULTIMA_LA' +
      'CTACAO IS NULL OR AF.ULTIMA_MONTA > AF.ULTIMA_LACTACAO )'#13#10' WHERE' +
      ' A.KCAD_FAZENDA = :KCAD_FAZENDA'#13#10'   AND A.STATUS <> :STATUS_DESC' +
      'ARTE'#13#10'   AND ( (:ALL_RETIRO = '#39'T'#39') OR (AF.RETIRO = :RETIRO) OR (' +
      ':RETIRO_NULL = '#39'T'#39' AND (AF.RETIRO IS NULL OR AF.RETIRO = '#39#39' ) ) ' +
      ' )'#13#10'   AND ( (:ALL_LOTES  = '#39'T'#39') OR (AF.LOTE   = :LOTE) OR (:LOT' +
      'E_NULL = '#39'T'#39' AND (AF.LOTE IS NULL OR AF.LOTE = '#39#39' ) )  )'#13#10'  ORDE' +
      'R BY A.BRINCO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ALL_RETIRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RETIRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RETIRO_NULL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ALL_LOTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOTE_NULL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 80
    Top = 128
    object sqlAnimaisOrigemKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      FixedChar = True
    end
    object sqlAnimaisOrigemBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlAnimaisOrigemLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 32
    end
    object sqlAnimaisOrigemRETIRO: TStringField
      DisplayLabel = 'Retiro'
      FieldName = 'RETIRO'
      Size = 32
    end
    object sqlAnimaisOrigemNUMERO_LACTACAO: TIntegerField
      FieldName = 'NUMERO_LACTACAO'
      Required = True
    end
    object sqlAnimaisOrigemSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object sqlAnimaisOrigemDPP: TLargeintField
      FieldName = 'DPP'
    end
    object sqlAnimaisOrigemSTATUS_REPRODUTIVO: TStringField
      FieldName = 'STATUS_REPRODUTIVO'
      Size = 50
    end
    object sqlAnimaisOrigemULTIMA_PRODUCAO: TFloatField
      FieldName = 'ULTIMA_PRODUCAO'
    end
    object sqlAnimaisOrigemCCS: TIntegerField
      FieldName = 'CCS'
    end
    object sqlAnimaisOrigemDEG: TIntegerField
      FieldName = 'DEG'
    end
  end
  object dspAnimaisOrigem: TDataSetProvider
    DataSet = sqlAnimaisOrigem
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 52
    Top = 76
  end
  object cdsAnimaisOrigem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ALL_RETIRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RETIRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RETIRO_NULL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ALL_LOTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOTE_NULL'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnimaisOrigem'
    Left = 76
    Top = 24
    object cdsAnimaisOrigemKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAnimaisOrigemBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsAnimaisOrigemLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 32
    end
    object cdsAnimaisOrigemRETIRO: TStringField
      DisplayLabel = 'Retiro'
      FieldName = 'RETIRO'
      Size = 32
    end
    object cdsAnimaisOrigemDEG: TIntegerField
      FieldName = 'DEG'
    end
    object cdsAnimaisOrigemNUMERO_LACTACAO: TIntegerField
      DisplayLabel = 'NL'
      FieldName = 'NUMERO_LACTACAO'
      Required = True
    end
    object cdsAnimaisOrigemSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
      Visible = False
    end
    object cdsAnimaisOrigemDPP: TLargeintField
      FieldName = 'DPP'
    end
    object cdsAnimaisOrigemSTATUS_REPRODUTIVO: TStringField
      DisplayLabel = 'Status Reprodutivo'
      FieldName = 'STATUS_REPRODUTIVO'
      Size = 50
    end
    object cdsAnimaisOrigemULTIMA_PRODUCAO: TFloatField
      DisplayLabel = #218'ltima produ'#231#227'o'
      FieldName = 'ULTIMA_PRODUCAO'
    end
    object cdsAnimaisOrigemCCS: TIntegerField
      DisplayLabel = #218'ltima CCS'
      FieldName = 'CCS'
    end
  end
  object cdsAnimaisDestino: TClientDataSet
    PersistDataPacket.Data = {
      130100009619E0BD01000000180000000B00000000000300000013010B4B5A4F
      4F5F414E494D414C010049000000010005574944544802000200140006425249
      4E434F0100490000000100055749445448020002000F000F4E554D45524F5F4C
      4143544143414F04000100000000000653544154555304000100000000000344
      50500400010000000000125354415455535F524550524F44555449564F010049
      00000001000557494454480200020032000F554C54494D415F50524F44554341
      4F0800040000000000034343530400010000000000044C4F5445010049000000
      01000557494454480200020020000652455449524F0100490000000100055749
      4454480200020020000344454704000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KZOO_ANIMAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BRINCO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NUMERO_LACTACAO'
        DataType = ftInteger
      end
      item
        Name = 'STATUS'
        DataType = ftInteger
      end
      item
        Name = 'DPP'
        DataType = ftInteger
      end
      item
        Name = 'STATUS_REPRODUTIVO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ULTIMA_PRODUCAO'
        DataType = ftFloat
      end
      item
        Name = 'CCS'
        DataType = ftInteger
      end
      item
        Name = 'LOTE'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'RETIRO'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'DEG'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 320
    Top = 28
    object cdsAnimaisDestinoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Visible = False
    end
    object cdsAnimaisDestinoBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsAnimaisDestinoDEG: TIntegerField
      FieldName = 'DEG'
    end
    object cdsAnimaisDestinoNUMERO_LACTACAO: TIntegerField
      DisplayLabel = 'NL'
      FieldName = 'NUMERO_LACTACAO'
    end
    object cdsAnimaisDestinoSTATUS: TIntegerField
      DisplayLabel = 'Categoria'
      FieldName = 'STATUS'
      Visible = False
    end
    object cdsAnimaisDestinoDPP: TIntegerField
      FieldName = 'DPP'
    end
    object cdsAnimaisDestinoSTATUS_REPRODUTIVO: TStringField
      DisplayLabel = 'Status Reprodutivo'
      FieldName = 'STATUS_REPRODUTIVO'
      Size = 50
    end
    object cdsAnimaisDestinoULTIMA_PRODUCAO: TFloatField
      DisplayLabel = #218'ltima produ'#231#227'o'
      FieldName = 'ULTIMA_PRODUCAO'
    end
    object cdsAnimaisDestinoCCS: TIntegerField
      FieldName = 'CCS'
    end
    object cdsAnimaisDestinoLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Visible = False
      Size = 32
    end
    object cdsAnimaisDestinoRETIRO: TStringField
      DisplayLabel = 'Retiro'
      FieldName = 'RETIRO'
      Visible = False
      Size = 32
    end
  end
end
