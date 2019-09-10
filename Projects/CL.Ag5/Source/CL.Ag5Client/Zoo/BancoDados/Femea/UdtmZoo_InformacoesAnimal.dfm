object dtmZoo_InformacoesAnimal: TdtmZoo_InformacoesAnimal
  OldCreateOrder = True
  Height = 274
  Width = 857
  object cdsResumoAnimal: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KZOO_ANIMAL'
    MasterFields = 'KZOO_ANIMAL'
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspResumoAnimal'
    ReadOnly = True
    OnCalcFields = cdsResumoAnimalCalcFields
    Left = 109
    Top = 26
    object cdsResumoAnimalKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      FixedChar = True
    end
    object cdsResumoAnimalBRINCO: TStringField
      FieldName = 'BRINCO'
      OnGetText = cdsResumoAnimalDefaultText
      Size = 15
    end
    object cdsResumoAnimalNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      OnGetText = cdsResumoAnimalDefaultText
      Size = 60
    end
    object cdsResumoAnimalNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      OnGetText = cdsResumoAnimalDefaultText
      Size = 60
    end
    object cdsAnimalSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalDESCR_STATUS: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusAnimal
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      OnGetText = cdsResumoAnimalDefaultText
      Size = 31
      Lookup = True
    end
    object cdsResumoAnimalREGISTRO: TStringField
      FieldName = 'REGISTRO'
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Required = True
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalIDADE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'IDADE'
      Size = 5
    end
    object cdsResumoAnimalULTIMA_LACTACAO: TSQLTimeStampField
      FieldName = 'ULTIMA_LACTACAO'
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalULTIMA_MONTA: TSQLTimeStampField
      FieldName = 'ULTIMA_MONTA'
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalULTIMA_PESAGEMLEITE: TSQLTimeStampField
      FieldName = 'ULTIMA_PESAGEMLEITE'
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalULTIMO_CIO: TSQLTimeStampField
      FieldName = 'ULTIMO_CIO'
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalDIAS_ULTEVENTO: TLargeintField
      FieldName = 'DIAS_ULTEVENTO'
    end
    object cdsResumoAnimalNUMERO_LACTACAO: TIntegerField
      FieldName = 'NUMERO_LACTACAO'
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalDPP: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DPP'
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalNUMERO_MONTA: TIntegerField
      FieldName = 'NUMERO_MONTA'
      Required = True
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalNUMERO_CIO: TIntegerField
      FieldName = 'NUMERO_CIO'
      Required = True
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalLOTE: TStringField
      FieldName = 'LOTE'
      OnGetText = cdsResumoAnimalDefaultText
      FixedChar = True
      Size = 32
    end
    object cdsResumoAnimalPRENHEZ: TStringField
      FieldName = 'PRENHEZ'
      OnGetText = cdsResumoAnimalDefaultText
      FixedChar = True
      Size = 1
    end
    object cdsResumoAnimalDESC_PRENHEZ: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'DESC_PRENHEZ'
      OnGetText = cdsResumoAnimalDefaultText
      Size = 5
    end
    object cdsResumoAnimalDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsDadosFemeaDESCR_DOADOR_RECEPTOR: TStringField
      DisplayLabel = 'Animal doador/receptor'
      FieldKind = fkLookup
      FieldName = 'DESCR_DOADOR_RECEPTOR'
      LookupDataSet = cdsTipoDoadorReceptor
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'DOADOR_RECEPTOR'
      OnGetText = cdsResumoAnimalDefaultText
      Size = 31
      Lookup = True
    end
    object cdsResumoAnimalRACA: TStringField
      FieldName = 'RACA'
      Size = 37
    end
    object cdsResumoAnimalSISBOV: TStringField
      FieldName = 'SISBOV'
      OnGetText = cdsResumoAnimalDefaultText
    end
    object cdsResumoAnimalKULTIMO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KULTIMO_EVENTO_ZOOTECNICO'
      FixedChar = True
    end
    object cdsResumoAnimalKULTIMA_MONTA: TStringField
      FieldName = 'KULTIMA_MONTA'
      FixedChar = True
    end
    object cdsResumoAnimalABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
    end
    object cdsResumoAnimalKULTIMO_PARTO: TStringField
      FieldName = 'KULTIMO_PARTO'
      FixedChar = True
    end
    object cdsResumoAnimalSTATUS_VACA: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'STATUS_VACA'
      Size = 32
    end
    object cdsResumoAnimalINTENCAO_DESCARTE: TStringField
      FieldName = 'INTENCAO_DESCARTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsResumoAnimalsqlResumoAnimalProximaTarefa: TDataSetField
      DisplayLabel = 'Pr'#243'xima tarefa'
      FieldName = 'sqlResumoAnimalProximaTarefa'
    end
    object cdsResumoAnimalsqlResumoAnimalUltimaTarefa: TDataSetField
      DisplayLabel = #218'ltima tarefa'
      FieldName = 'sqlResumoAnimalUltimaTarefa'
    end
    object cdsResumoAnimalsqlResumoAnimalSanidade: TDataSetField
      DisplayLabel = 'Sanidade'
      FieldName = 'sqlResumoAnimalSanidade'
    end
    object cdsResumoAnimalTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object cdsResumoAnimalSTATUS_REPRODUTIVO: TStringField
      FieldName = 'STATUS_REPRODUTIVO'
      Size = 50
    end
  end
  object dspResumoAnimal: TDataSetProvider
    DataSet = sqlResumoAnimal
    Left = 65
    Top = 73
  end
  object sqlResumoAnimal: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'   A.KZOO_ANIMAL,'#13#10'   A.BRINCO,'#13#10'   A.NOMEESTABULO, '#13#10' ' +
      '  A.NOMECOMPLETO, '#13#10'   A.STATUS,'#13#10'   A.REGISTRO,'#13#10'   COALESCE ( ' +
      'A.GRAUSANGUE, '#39#39' ) || COALESCE ( A.COMPOSICAORACA, '#39#39' ) RACA,'#13#10' ' +
      '  A.SISBOV,'#13#10'   DAF.LOTE,'#13#10'   DAF.DOADOR_RECEPTOR,'#13#10'   DAF.NASCI' +
      'MENTO,'#13#10'   DAF.ULTIMA_LACTACAO,'#13#10'   DAF.ULTIMA_MONTA,'#13#10'   DATEDI' +
      'FF(DAY, CAST(EZ.DATAEVENTO AS DATE), CURRENT_DATE) DIAS_ULTEVENT' +
      'O,'#13#10'   ( IIF(DAF.KULTIMA_LACTACAO IS NOT NULL,'#13#10'            ( SE' +
      'LECT COUNT (1) NUM_COB'#13#10'                FROM ZOO_ANIMAIS_FEMEA A' +
      'F'#13#10'                LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZ' +
      'OO_ANIMAL_FEMEA = AF.KZOO_ANIMAL_FEMEA'#13#10'               WHERE AF.' +
      'KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'#13#10'                 AND EZ.DATAE' +
      'VENTO >= AF.ULTIMA_LACTACAO'#13#10'                 AND EZ.TIPOEVENTO ' +
      'IS DISTINCT FROM 1), DAF.NUMERO_MONTA)'#13#10'   ) NUMERO_MONTA,'#13#10'   L' +
      'C.ULTIMA_PESAGEMLEITE,'#13#10'   PL.TOTAL,'#13#10'   DAF.ULTIMO_CIO, '#13#10'   DA' +
      'F.NUMERO_CIO,'#13#10'   DAF.NUMERO_LACTACAO, '#13#10'   EZ.PRENHEZ,'#13#10'   DAF.' +
      'KULTIMO_EVENTO_ZOOTECNICO,'#13#10'   DAF.KULTIMA_MONTA,'#13#10'   DAF.KULTIM' +
      'O_PARTO,'#13#10'   EZ.ABORTOPARTO,'#13#10'   DAF.INTENCAO_DESCARTE,'#13#10'  (SELE' +
      'CT SUBSTRING( SYS$DESCRIPTION FROM 1 FOR 50 )    '#13#10'          FRO' +
      'M SYS$TYPES_GETDESCRIPTION( '#39'STATUS_REPRODUTIVO'#39',(SELECT CAST ( ' +
      'STATUS_REPRODUTIVO_ANIMAL AS INTEGER ) SYS$VALUE FROM ZOO_GET_ST' +
      'ATUS_REPRODUTIVO( A.KZOO_ANIMAL )) ) )  "STATUS_REPRODUTIVO"'#13#10'FR' +
      'OM ZOO_ANIMAIS A'#13#10'INNER JOIN ZOO_ANIMAIS_FEMEA DAF ON  DAF.KZOO_' +
      'ANIMAL_FEMEA = A.KZOO_ANIMAL'#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS ' +
      'EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMO_EVENTO_ZOOTECNICO'#13 +
      #10'LEFT JOIN ZOO_LACTACOES LC ON LC.KZOO_LACTACAO = DAF.KULTIMA_LA' +
      'CTACAO'#13#10'LEFT JOIN ZOO_PESAGEM_LEITE PL ON PL.KZOO_PESAGEM_LEITE ' +
      '= LC.KULTIMA_PESAGEMLEITE'#13#10'WHERE A.KZOO_ANIMAL = :KZOO_ANIMAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 101
    Top = 117
    object sqlResumoAnimalKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      FixedChar = True
    end
    object sqlResumoAnimalBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlResumoAnimalNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object sqlResumoAnimalNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
    object sqlResumoAnimalREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object sqlResumoAnimalNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object sqlResumoAnimalULTIMA_LACTACAO: TSQLTimeStampField
      FieldName = 'ULTIMA_LACTACAO'
    end
    object sqlResumoAnimalULTIMA_MONTA: TSQLTimeStampField
      FieldName = 'ULTIMA_MONTA'
    end
    object sqlResumoAnimalULTIMA_PESAGEMLEITE: TSQLTimeStampField
      FieldName = 'ULTIMA_PESAGEMLEITE'
    end
    object sqlResumoAnimalULTIMO_CIO: TSQLTimeStampField
      FieldName = 'ULTIMO_CIO'
    end
    object sqlResumoAnimalNUMERO_LACTACAO: TIntegerField
      FieldName = 'NUMERO_LACTACAO'
    end
    object sqlResumoAnimalNUMERO_MONTA: TIntegerField
      FieldName = 'NUMERO_MONTA'
      Required = True
    end
    object sqlResumoAnimalNUMERO_CIO: TIntegerField
      FieldName = 'NUMERO_CIO'
      Required = True
    end
    object sqlResumoAnimalDIAS_ULTEVENTO: TLargeintField
      FieldName = 'DIAS_ULTEVENTO'
    end
    object sqlResumoAnimalLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlResumoAnimalDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
    end
    object sqlResumoAnimalRACA: TStringField
      FieldName = 'RACA'
      Size = 37
    end
    object sqlResumoAnimalSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object sqlResumoAnimalSISBOV: TStringField
      FieldName = 'SISBOV'
    end
    object sqlResumoAnimalPRENHEZ: TStringField
      FieldName = 'PRENHEZ'
      FixedChar = True
      Size = 1
    end
    object sqlResumoAnimalKULTIMO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KULTIMO_EVENTO_ZOOTECNICO'
      FixedChar = True
    end
    object sqlResumoAnimalKULTIMA_MONTA: TStringField
      FieldName = 'KULTIMA_MONTA'
      FixedChar = True
    end
    object sqlResumoAnimalKULTIMO_PARTO: TStringField
      FieldName = 'KULTIMO_PARTO'
      FixedChar = True
    end
    object sqlResumoAnimalINTENCAO_DESCARTE: TStringField
      FieldName = 'INTENCAO_DESCARTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlResumoAnimalABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
    end
    object sqlResumoAnimalTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object sqlResumoAnimalSTATUS_REPRODUTIVO: TStringField
      FieldName = 'STATUS_REPRODUTIVO'
      Size = 50
    end
  end
  object cdsResumoAnimalUltimaTarefa: TClientDataSet
    Aggregates = <>
    DataSetField = cdsResumoAnimalsqlResumoAnimalUltimaTarefa
    Params = <>
    ReadOnly = True
    Left = 232
    Top = 26
    object cdsResumoAnimalUltimaTarefaKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      Required = True
      FixedChar = True
    end
    object cdsResumoAnimalUltimaTarefaDATATAREFA: TSQLTimeStampField
      FieldName = 'DATATAREFA'
    end
    object cdsResumoAnimalUltimaTarefaSTATUSTAREFA: TIntegerField
      FieldName = 'STATUSTAREFA'
      Required = True
    end
    object cdsResumoAnimalUltimaTarefaTAREFA: TStringField
      FieldName = 'TAREFA'
      Required = True
      OnGetText = cdsResumoAnimalDefaultText
      Size = 163
    end
  end
  object sqlResumoAnimalUltimaTarefa: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'    T.KZOO_ANIMAL_TAREFA,    '#13#10'    T.DATASTATUS DATATAR' +
      'EFA,'#13#10'    T.STATUS STATUSTAREFA,'#13#10'    T.kzoo_animal,'#13#10'    T.CODI' +
      'GO || '#39' - '#39' || T.NOME TAREFA'#13#10'FROM ZOO_ANIMAL_TAREFAS T'#13#10'WHERE T' +
      '.KZOO_ANIMAL = :KZOO_ANIMAL'#13#10'  AND T.STATUS = :STATUS_EXECUTADA'#13 +
      #10'  AND T.EXCLUIDO = '#39'F'#39#13#10'ORDER BY T.DATASTATUS DESC'#13#10'ROWS 1'
    DataSource = dtsSQLResumoAnimal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_EXECUTADA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 232
    Top = 115
    object sqlResumoAnimalUltimaTarefaKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      Required = True
      FixedChar = True
    end
    object sqlResumoAnimalUltimaTarefaDATATAREFA: TSQLTimeStampField
      FieldName = 'DATATAREFA'
    end
    object sqlResumoAnimalUltimaTarefaSTATUSTAREFA: TIntegerField
      FieldName = 'STATUSTAREFA'
      Required = True
    end
    object sqlResumoAnimalUltimaTarefaTAREFA: TStringField
      FieldName = 'TAREFA'
      Required = True
      Size = 163
    end
  end
  object sqlResumoAnimalProximaTarefa: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'    T.KZOO_ANIMAL_TAREFA,    '#13#10'    T.DATAPREVISTA DATAT' +
      'AREFA,'#13#10'    T.STATUS STATUSTAREFA,'#13#10'    T.CODIGO || '#39' - '#39' || T.N' +
      'OME TAREFA'#13#10'FROM ZOO_ANIMAL_TAREFAS T'#13#10'WHERE T.KZOO_ANIMAL = :KZ' +
      'OO_ANIMAL'#13#10'  AND T.EXCLUIDO = '#39'F'#39#13#10'  AND (  ( T.STATUS = :STATUS' +
      '_PENDENTE )'#13#10'         OR ( T.STATUS = :STATUS_NAOEXECUTADA )'#13#10'  ' +
      '     )'#13#10'ORDER BY T.DATAPREVISTA'#13#10'ROWS 1'
    DataSource = dtsSQLResumoAnimal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_NAOEXECUTADA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 396
    Top = 115
    object sqlResumoAnimalProximaTarefaKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      Required = True
      FixedChar = True
    end
    object sqlResumoAnimalProximaTarefaDATATAREFA: TSQLTimeStampField
      FieldName = 'DATATAREFA'
      Required = True
    end
    object sqlResumoAnimalProximaTarefaSTATUSTAREFA: TIntegerField
      FieldName = 'STATUSTAREFA'
      Required = True
    end
    object sqlResumoAnimalProximaTarefaTAREFA: TStringField
      FieldName = 'TAREFA'
      Required = True
      Size = 163
    end
  end
  object cdsResumoAnimalProximaTarefa: TClientDataSet
    Aggregates = <>
    DataSetField = cdsResumoAnimalsqlResumoAnimalProximaTarefa
    Params = <>
    ReadOnly = True
    Left = 396
    Top = 26
    object cdsResumoAnimalProximaTarefaKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      Required = True
      FixedChar = True
    end
    object cdsResumoAnimalProximaTarefaDATATAREFA: TSQLTimeStampField
      FieldName = 'DATATAREFA'
      Required = True
    end
    object cdsResumoAnimalProximaTarefaSTATUSTAREFA: TIntegerField
      FieldName = 'STATUSTAREFA'
      Required = True
    end
    object cdsResumoAnimalProximaTarefaTAREFA: TStringField
      FieldName = 'TAREFA'
      Required = True
      OnGetText = cdsResumoAnimalDefaultText
      Size = 163
    end
  end
  object dtsSQLResumoAnimal: TDataSource
    DataSet = sqlResumoAnimal
    Left = 176
    Top = 172
  end
  object cdsTipoDoadorReceptor: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 764
    Top = 116
    object cdsTipoDoadorReceptorTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoDoadorReceptorVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoDoadorReceptorDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoDoadorReceptorORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoRacasAnimais: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 764
    Top = 64
    object cdsTipoRacasAnimaisTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoRacasAnimaisVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoRacasAnimaisDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoRacasAnimaisORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsStatusAnimal: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 764
    Top = 16
    object cdsStatusAnimalTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsStatusAnimalORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object sqlResumoAnimalSanidade: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  AN.KZOO_ANIMAL,'#13#10'  EZ.DATAEVENTO,'#13#10'  EZ.TIPOEVENTO,'#13#10 +
      '  (SELECT PLA.CCS FROM ZOO_PESAGEM_LEITE_ANALISE PLA WHERE PLA.K' +
      'ZOO_LACTACAO = DAF.KULTIMA_LACTACAO ORDER BY DATA DESC ROWS 1) C' +
      'CS,'#13#10'  (SELECT PLA.GORDURA FROM ZOO_PESAGEM_LEITE_ANALISE PLA WH' +
      'ERE PLA.KZOO_LACTACAO = DAF.KULTIMA_LACTACAO ORDER BY DATA DESC ' +
      'ROWS 1) GORDURA,'#13#10'  (SELECT MAX(DATA) FROM ZOO_ANIMAL_DIAGNOSTIC' +
      'OS ES'#13#10'  WHERE ES.KZOO_ANIMAL_FEMEA = AN.KZOO_ANIMAL AND ES.EXCL' +
      'UIDO = '#39'F'#39') DT_DIAGNOSTICO,'#13#10'  (SELECT FIRST 1 ES.NOME || COALES' +
      'CE('#39'  no quarto '#39' ||STD.SYS$DESCRIPTION,'#39#39') FROM ZOO_ANIMAL_DIAG' +
      'NOSTICOS ES'#13#10'   LEFT JOIN SYS$TYPES_GETDESCRIPTION( '#39'TIPO_QUARTO' +
      #39', ES.QUARTO ) STD ON 1=1'#13#10'  WHERE ES.KZOO_ANIMAL_FEMEA = AN.KZO' +
      'O_ANIMAL  AND ES.EXCLUIDO = '#39'F'#39#13#10'  ORDER BY ES.DATA DESC) DSC_DI' +
      'AGNOSTICO,'#13#10'  (SELECT PLA.PROTEINA FROM ZOO_PESAGEM_LEITE_ANALIS' +
      'E PLA WHERE PLA.KZOO_LACTACAO = DAF.KULTIMA_LACTACAO ORDER BY DA' +
      'TA DESC ROWS 1) PROTEINA,'#13#10'  (SELECT PLA.UREIA FROM ZOO_PESAGEM_' +
      'LEITE_ANALISE PLA WHERE PLA.KZOO_LACTACAO = DAF.KULTIMA_LACTACAO' +
      ' ORDER BY DATA DESC ROWS 1) UREIA,'#13#10'  LC.PLT PRODUCAO_ACUMULADA,' +
      #13#10'  LC.PL305,'#13#10'  LC.PLT / IIF( LC.DATA_SECAGEM IS NULL, IIF( LC.' +
      'DEL < 1, 1, LC.DEL ) + LC.INTERVALO_SECAGEM, IIF( LC.DEL < 1, 1,' +
      ' LC.DEL ) ) PRODUCAO_MEDIA'#13#10'FROM ZOO_ANIMAIS AN'#13#10'JOIN ZOO_ANIMAI' +
      'S_FEMEA DAF ON  DAF.KZOO_ANIMAL_FEMEA = AN.KZOO_ANIMAL'#13#10'LEFT JOI' +
      'N ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.' +
      'KULTIMO_EVENTO_ZOOTECNICO'#13#10'LEFT JOIN ZOO_LACTACOES LC ON LC.KZOO' +
      '_LACTACAO = DAF.KULTIMA_LACTACAO'#13#10'WHERE AN.KZOO_ANIMAL = :KZOO_A' +
      'NIMAL'
    DataSource = dtsSQLResumoAnimal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 548
    Top = 115
    object sqlResumoAnimalSanidadeKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      FixedChar = True
    end
    object sqlResumoAnimalSanidadeDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
    end
    object sqlResumoAnimalSanidadeTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlResumoAnimalSanidadeCCS: TIntegerField
      FieldName = 'CCS'
      DisplayFormat = '#,0'
    end
    object sqlResumoAnimalSanidadeGORDURA: TFloatField
      FieldName = 'GORDURA'
      DisplayFormat = '#,0.00'
    end
    object sqlResumoAnimalSanidadePROTEINA: TFloatField
      FieldName = 'PROTEINA'
      DisplayFormat = '#,0.00'
    end
    object sqlResumoAnimalSanidadeUREIA: TFloatField
      FieldName = 'UREIA'
      DisplayFormat = '#,0.00'
    end
    object sqlResumoAnimalSanidadePRODUCAO_ACUMULADA: TFloatField
      FieldName = 'PRODUCAO_ACUMULADA'
      DisplayFormat = '#,0.00'
    end
    object sqlResumoAnimalSanidadePL305: TFloatField
      FieldName = 'PL305'
      DisplayFormat = '#,0.00'
    end
    object sqlResumoAnimalSanidadePRODUCAO_MEDIA: TFloatField
      FieldName = 'PRODUCAO_MEDIA'
      DisplayFormat = '#,0.00'
    end
    object sqlResumoAnimalSanidadeDT_DIAGNOSTICO: TSQLTimeStampField
      FieldName = 'DT_DIAGNOSTICO'
    end
    object sqlResumoAnimalSanidadeDSC_DIAGNOSTICO: TStringField
      FieldName = 'DSC_DIAGNOSTICO'
      Size = 128
    end
  end
  object cdsResumoAnimalSanidade: TClientDataSet
    Aggregates = <>
    DataSetField = cdsResumoAnimalsqlResumoAnimalSanidade
    Params = <>
    ReadOnly = True
    OnCalcFields = cdsResumoAnimalSanidadeCalcFields
    Left = 548
    Top = 26
    object cdsResumoAnimalSanidadeKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsResumoAnimalSanidadeDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
    end
    object cdsResumoAnimalSanidadeTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
      Visible = False
    end
    object cdsResumoAnimalSanidadeDESC_EVENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_EVENTO'
      LookupDataSet = cdsTipoEvento
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOEVENTO'
      Size = 32
      Lookup = True
    end
    object cdsResumoAnimalSanidadeCCS: TIntegerField
      FieldName = 'CCS'
      DisplayFormat = '#,0'
    end
    object cdsResumoAnimalSanidadeGORDURA: TFloatField
      FieldName = 'GORDURA'
      DisplayFormat = '#,0.00'
    end
    object cdsResumoAnimalSanidadePROTEINA: TFloatField
      FieldName = 'PROTEINA'
      DisplayFormat = '#,0.00'
    end
    object cdsResumoAnimalSanidadeUREIA: TFloatField
      FieldName = 'UREIA'
      DisplayFormat = '#,0.00'
    end
    object cdsResumoAnimalSanidadePRODUCAO_ACUMULADA: TFloatField
      FieldName = 'PRODUCAO_ACUMULADA'
      DisplayFormat = '#,0.00'
    end
    object cdsResumoAnimalSanidadePL305: TFloatField
      FieldName = 'PL305'
      DisplayFormat = '#,0.00'
    end
    object cdsResumoAnimalSanidadePRODUCAO_MEDIA: TFloatField
      FieldName = 'PRODUCAO_MEDIA'
      DisplayFormat = '#,0.0'
    end
    object cdsResumoAnimalSanidadeDT_DIAGNOSTICO: TSQLTimeStampField
      FieldName = 'DT_DIAGNOSTICO'
    end
    object cdsResumoAnimalSanidadeDSC_DIAGNOSTICO: TStringField
      FieldName = 'DSC_DIAGNOSTICO'
      Size = 128
    end
    object cdsResumoAnimalSanidadeDT_ULTIMO_EVENTO: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DT_ULTIMO_EVENTO'
      Calculated = True
    end
    object cdsResumoAnimalSanidadeDESC_ULTIMO_EVENTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESC_ULTIMO_EVENTO'
      Size = 128
      Calculated = True
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
    Left = 765
    Top = 163
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
