object Zoo_ReproducaoPartosAbortosDatamodule: TZoo_ReproducaoPartosAbortosDatamodule
  OldCreateOrder = True
  Height = 430
  Width = 592
  object cdsPartosAbortos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPartosAbortos'
    BeforeOpen = cdsPartosAbortosBeforeOpen
    BeforePost = cdsPartosAbortosBeforePost
    OnCalcFields = cdsPartosAbortosCalcFields
    Left = 71
    Top = 32
    object cdsPartosAbortosKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPartosAbortosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPartosAbortosBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsPartosAbortosBRINCOFEMEA_: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA_'
      ProviderFlags = []
      Visible = False
      Size = 16
    end
    object cdsPartosAbortosNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsPartosAbortosABORTOPARTO: TIntegerField
      DisplayLabel = 'Parto/aborto'
      FieldName = 'ABORTOPARTO'
      OnValidate = cdsPartosAbortosABORTOPARTOValidate
    end
    object cdsPartosAbortosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object cdsPartosAbortosDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object cdsPartosAbortosDATAABORTOPARTO: TSQLTimeStampField
      DisplayLabel = 'Data parto/aborto'
      FieldName = 'DATAABORTOPARTO'
      OnValidate = cdsPartosAbortosDATAABORTOPARTOValidate
    end
    object cdsPartosAbortosPREVISAOPARTO: TSQLTimeStampField
      DisplayLabel = 'Previs'#227'o de parto'
      FieldKind = fkInternalCalc
      FieldName = 'PREVISAOPARTO'
    end
    object cdsPartosAbortosSELECTED: TStringField
      FieldName = 'SELECTED'
      Required = True
      OnValidate = cdsPartosAbortosSELECTEDValidate
      FixedChar = True
      Size = 1
    end
    object cdsPartosAbortosABRIRLACTACAO: TStringField
      DisplayLabel = 'Abrir lacta'#231#227'o'
      FieldName = 'ABRIRLACTACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPartosAbortosINCLUIRCRIA: TStringField
      DisplayLabel = 'Cadastrar filhos'
      FieldName = 'INCLUIRCRIA'
      Required = True
      OnChange = cdsPartosAbortosINCLUIRCRIAChange
      OnGetText = cdsPartosAbortosINCLUIRCRIAGetText
      FixedChar = True
      Size = 1
    end
    object cdsPartosAbortosSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object cdsPartosAbortosNUMERO_LACTACAO: TIntegerField
      FieldName = 'NUMERO_LACTACAO'
    end
    object cdsPartosAbortosDESC_PARTOABORTO: TStringField
      DisplayLabel = 'Parto/aborto'
      FieldKind = fkLookup
      FieldName = 'DESC_PARTOABORTO'
      LookupDataSet = cdsStatusGestacao
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ABORTOPARTO'
      Size = 31
      Lookup = True
    end
    object cdsPartosAbortosDIAS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DIAS'
    end
    object cdsPartosAbortosDATATOQUE: TSQLTimeStampField
      FieldName = 'DATATOQUE'
    end
    object cdsPartosAbortosCHAVELACTACAO: TStringField
      FieldName = 'CHAVELACTACAO'
      FixedChar = True
    end
    object cdsPartosAbortosPROTOCOLO_PARTO: TStringField
      DisplayLabel = 'Aplicar protocolo'
      FieldName = 'PROTOCOLO_PARTO'
      OnGetText = cdsPartosAbortosPROTOCOLO_PARTOGetText
      FixedChar = True
      Size = 1
    end
    object cdsPartosAbortosGRAUSANGUEPAI: TStringField
      FieldName = 'GRAUSANGUEPAI'
      FixedChar = True
      Size = 5
    end
    object cdsPartosAbortosCOMPOSICAORACAPAI: TStringField
      FieldName = 'COMPOSICAORACAPAI'
      Size = 32
    end
    object cdsPartosAbortosGRAUSANGUEMAE: TStringField
      FieldName = 'GRAUSANGUEMAE'
      FixedChar = True
      Size = 5
    end
    object cdsPartosAbortosCOMPOSICAORACAMAE: TStringField
      FieldName = 'COMPOSICAORACAMAE'
      Size = 32
    end
    object cdsPartosAbortosFORCEABORTO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'FORCEABORTO'
      Size = 1
    end
    object cdsPartosAbortosLOTEPARTO: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTEPARTO'
      FixedChar = True
      Size = 32
    end
    object cdsPartosAbortosLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsPartosAbortosNUMEROFILHOS: TSmallintField
      DisplayLabel = 'Filhos'
      FieldKind = fkCalculated
      FieldName = 'NUMEROFILHOS'
      OnGetText = cdsPartosAbortosNUMEROFILHOSGetText
      Calculated = True
    end
    object cdsPartosAbortosRETIRO: TStringField
      FieldName = 'RETIRO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsPartosAbortossqlLinhagem: TDataSetField
      DisplayLabel = 'Linhagem'
      FieldName = 'sqlLinhagem'
    end
    object cdsPartosAbortosDESCR_PROTOCOLOS: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'DESCR_PROTOCOLOS'
      ProviderFlags = []
      Size = 128
    end
  end
  object dspPartosAbortos: TDataSetProvider
    DataSet = sqlPartosAbortos
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspPartosAbortosBeforeUpdateRecord
    Left = 47
    Top = 77
  end
  object sqlPartosAbortos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  E.KZOO_EVENTO_ZOOTECNICO,'#13#10'  E.KZOO_ANIMAL_FEMEA,'#13#10'  A' +
      'F.BRINCO BRINCOFEMEA,'#13#10'AF.BRINCO_ BRINCOFEMEA_,'#13#10'  E.TIPOEVENTO,' +
      #13#10'  E.DATAEVENTO,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  AF.STATUS,'#13#10' ' +
      ' DAF.LOTE,'#13#10'  DAF.NUMERO_LACTACAO,'#13#10'  DAF.RETIRO,'#13#10'--  AM.NOMEES' +
      'TABULO NOMEMACHO,'#13#10'--  E.PRENHEZ, '#13#10'--  E.REEXAMINAR, '#13#10'  E.DATA' +
      'TOQUE,'#13#10'  E.ABORTOPARTO, '#13#10'  E.LOTEPARTO,'#13#10'  E.DATAABORTOPARTO,'#13 +
      #10'  Cast ( '#39#39' as CHAR(22) ) CHAVELACTACAO,'#13#10'  '#39'F'#39' SELECTED,'#13#10'  '#39'F' +
      #39' ABRIRLACTACAO,'#13#10'  '#39'F'#39' INCLUIRCRIA,'#13#10'  AM.GRAUSANGUE GRAUSANGUE' +
      'PAI,'#13#10'  AM.COMPOSICAORACA COMPOSICAORACAPAI,'#13#10'  AF.GRAUSANGUE GR' +
      'AUSANGUEMAE,'#13#10'  AF.COMPOSICAORACA COMPOSICAORACAMAE,'#13#10'  PROTOCOL' +
      'O_PARTO'#13#10'FROM ZOO_ANIMAIS_FEMEA DAF'#13#10'INNER JOIN ZOO_EVENTOS_ZOOT' +
      'ECNICOS E ON E.KZOO_EVENTO_ZOOTECNICO =  DAF.KULTIMA_MONTA'#13#10'INNE' +
      'R JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = E.KZOO_ANIMAL_FEMEA'#13#10'L' +
      'EFT JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO'#13 +
      #10'WHERE  ( E.ABORTOPARTO IS NULL )'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 74
    Top = 121
    object sqlPartosAbortosKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPartosAbortosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlPartosAbortosBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlPartosAbortosBRINCOFEMEA_: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA_'
      ProviderFlags = []
      Size = 16
    end
    object sqlPartosAbortosNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlPartosAbortosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlPartosAbortosABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
    end
    object sqlPartosAbortosDATAABORTOPARTO: TSQLTimeStampField
      FieldName = 'DATAABORTOPARTO'
    end
    object sqlPartosAbortosSELECTED: TStringField
      FieldName = 'SELECTED'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPartosAbortosABRIRLACTACAO: TStringField
      FieldName = 'ABRIRLACTACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPartosAbortosINCLUIRCRIA: TStringField
      DisplayLabel = 'Cadastrar filhos'
      FieldName = 'INCLUIRCRIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlPartosAbortosCHAVELACTACAO: TStringField
      FieldName = 'CHAVELACTACAO'
      FixedChar = True
    end
    object sqlPartosAbortosSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object sqlPartosAbortosNUMERO_LACTACAO: TIntegerField
      FieldName = 'NUMERO_LACTACAO'
    end
    object sqlPartosAbortosDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object sqlPartosAbortosDATATOQUE: TSQLTimeStampField
      FieldName = 'DATATOQUE'
    end
    object sqlPartosAbortosGRAUSANGUEPAI: TStringField
      FieldName = 'GRAUSANGUEPAI'
      FixedChar = True
      Size = 5
    end
    object sqlPartosAbortosCOMPOSICAORACAPAI: TStringField
      FieldName = 'COMPOSICAORACAPAI'
      Size = 32
    end
    object sqlPartosAbortosGRAUSANGUEMAE: TStringField
      FieldName = 'GRAUSANGUEMAE'
      FixedChar = True
      Size = 5
    end
    object sqlPartosAbortosCOMPOSICAORACAMAE: TStringField
      FieldName = 'COMPOSICAORACAMAE'
      Size = 32
    end
    object sqlPartosAbortosPROTOCOLO_PARTO: TStringField
      DisplayLabel = 'Aplicar protocolo'
      FieldName = 'PROTOCOLO_PARTO'
      FixedChar = True
      Size = 1
    end
    object sqlPartosAbortosLOTEPARTO: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTEPARTO'
      FixedChar = True
      Size = 32
    end
    object sqlPartosAbortosLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlPartosAbortosRETIRO: TStringField
      FieldName = 'RETIRO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
  end
  object cdsLinhagem: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPartosAbortossqlLinhagem
    Params = <>
    BeforeInsert = cdsLinhagemBeforeInsert
    BeforePost = cdsLinhagemBeforePost
    OnCalcFields = cdsLinhagemCalcFields
    OnNewRecord = cdsLinhagemNewRecord
    Left = 157
    Top = 32
    object cdsLinhagemKZOO_ANIMAL_LINHAGEM: TStringField
      FieldName = 'KZOO_ANIMAL_LINHAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsLinhagemKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object cdsLinhagemNATIMORTO: TStringField
      FieldName = 'NATIMORTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsLinhagemBRINCO: TStringField
      FieldName = 'BRINCO'
      OnValidate = cdsLinhagemBRINCOValidate
      Size = 15
    end
    object cdsLinhagemNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsLinhagemNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsLinhagemKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
    end
    object cdsLinhagemNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 60
    end
    object cdsLinhagemREGISTROPAI: TStringField
      FieldName = 'REGISTROPAI'
    end
    object cdsLinhagemKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      FixedChar = True
    end
    object cdsLinhagemNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 60
    end
    object cdsLinhagemREGISTROMAE: TStringField
      FieldName = 'REGISTROMAE'
    end
    object cdsLinhagemPESO: TIntegerField
      FieldName = 'PESO'
      OnValidate = cdsLinhagemPESOValidate
    end
    object cdsLinhagemALTURA: TIntegerField
      FieldName = 'ALTURA'
      OnValidate = cdsLinhagemALTURAValidate
    end
    object cdsLinhagemSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object cdsLinhagemNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
    end
    object cdsLinhagemNUMERO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NUMERO'
      Size = 10
    end
    object cdsLinhagemRACA: TIntegerField
      FieldName = 'RACA'
    end
    object cdsLinhagemLOTE: TStringField
      FieldName = 'LOTE'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLinhagemDESCR_RACA: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_RACA'
      LookupDataSet = cdsTipoRacasAnimais
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'RACA'
      Size = 31
      Lookup = True
    end
    object cdsLinhagemKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      FixedChar = True
    end
    object cdsLinhagemGRAUSANGUE: TStringField
      FieldName = 'GRAUSANGUE'
      OnSetText = cdsLinhagemGRAUSANGUESetText
      OnValidate = cdsLinhagemGRAUSANGUEValidate
      FixedChar = True
      Size = 5
    end
    object cdsLinhagemCOMPOSICAORACA: TStringField
      FieldName = 'COMPOSICAORACA'
      OnValidate = cdsLinhagemCOMPOSICAORACAValidate
      Size = 32
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
    object cdsLinhagemRETIRO_CRIA: TStringField
      FieldName = 'RETIRO_CRIA'
      Size = 32
    end
  end
  object cdsTipoMuco: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 392
    Top = 60
    object cdsTipoMucoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoMucoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoMucoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoMucoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsStatusGestacao: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 396
    Top = 116
    object cdsStatusGestacaoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusGestacaoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusGestacaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsStatusGestacaoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object sqlLinhagem: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'    KZOO_ANIMAL_LINHAGEM,'#13#10'    KZOO_ANIMAL,'#13#10'    NATIMOR' +
      'TO,'#13#10'    BRINCO,'#13#10'    NOMEANIMAL NOMEESTABULO,'#13#10'    CAST('#39#39' AS V' +
      'ARCHAR(60)) NOMECOMPLETO,'#13#10'    KZOO_ANIMAL_MACHO,'#13#10'    NOMEPAI,'#13 +
      #10'    REGISTROPAI,'#13#10'    KZOO_ANIMAL_FEMEA,'#13#10'    NOMEMAE,'#13#10'    REG' +
      'ISTROMAE,'#13#10'    KZOO_LACTACAO,'#13#10'    RACA,'#13#10'    GRAUSANGUE, COMPOS' +
      'ICAORACA,GRAUSANGUEPAI, COMPOSICAORACAPAI,GRAUSANGUEMAE, COMPOSI' +
      'CAORACAMAE,'#13#10'    PESO,'#13#10'    ALTURA,'#13#10'    SEXO,'#13#10'    CAST('#39#39' AS V' +
      'ARCHAR(32)) LOTE,'#13#10'    CAST('#39#39' AS VARCHAR(32)) RETIRO_CRIA,'#13#10'   ' +
      ' NASCIMENTO'#13#10'FROM ZOO_ANIMAL_LINHAGEM'#13#10'WHERE ( 0 = 1 )'
    DataSource = dtsSQLPartosAbortos
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 156
    Top = 121
    object sqlLinhagemKZOO_ANIMAL_LINHAGEM: TStringField
      FieldName = 'KZOO_ANIMAL_LINHAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlLinhagemKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      FixedChar = True
    end
    object sqlLinhagemNATIMORTO: TStringField
      FieldName = 'NATIMORTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlLinhagemBRINCO: TStringField
      FieldName = 'BRINCO'
      Size = 15
    end
    object sqlLinhagemNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlLinhagemNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlLinhagemKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
    end
    object sqlLinhagemNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 60
    end
    object sqlLinhagemREGISTROPAI: TStringField
      FieldName = 'REGISTROPAI'
    end
    object sqlLinhagemKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      FixedChar = True
    end
    object sqlLinhagemNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 60
    end
    object sqlLinhagemREGISTROMAE: TStringField
      FieldName = 'REGISTROMAE'
    end
    object sqlLinhagemRACA: TIntegerField
      FieldName = 'RACA'
    end
    object sqlLinhagemPESO: TIntegerField
      FieldName = 'PESO'
    end
    object sqlLinhagemALTURA: TIntegerField
      FieldName = 'ALTURA'
    end
    object sqlLinhagemSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object sqlLinhagemNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
    end
    object sqlLinhagemLOTE: TStringField
      FieldName = 'LOTE'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLinhagemKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      FixedChar = True
    end
    object sqlLinhagemGRAUSANGUE: TStringField
      FieldName = 'GRAUSANGUE'
      FixedChar = True
      Size = 5
    end
    object sqlLinhagemCOMPOSICAORACA: TStringField
      FieldName = 'COMPOSICAORACA'
      Size = 32
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
    object sqlLinhagemRETIRO_CRIA: TStringField
      FieldName = 'RETIRO_CRIA'
      Size = 32
    end
  end
  object dtsSQLPartosAbortos: TDataSource
    DataSet = sqlPartosAbortos
    Left = 124
    Top = 180
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
    Left = 392
    Top = 8
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
    Left = 397
    Top = 172
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
  object cdsTipoComposicaoRaca: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 400
    Top = 227
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
  object cdsListaProtocolos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 276
    Top = 296
  end
  object cdsProtocolosParto: TClientDataSet
    PersistDataPacket.Data = {
      AD0000009619E0BD010000001800000005000000000003000000AD000853454C
      45435445440400010000000000164B5A4F4F5F4556454E544F5F5A4F4F544543
      4E49434F01004900000001000557494454480200020014000E4B5A4F4F5F5052
      4F544F434F4C4F010049000000010005574944544802000200140006434F4449
      474F0100490000000100055749445448020002002000044E4F4D450100490000
      0001000557494454480200020080000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'SELECTED'
        DataType = ftInteger
      end
      item
        Name = 'KZOO_EVENTO_ZOOTECNICO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KZOO_PROTOCOLO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 128
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 276
    Top = 352
    object cdsProtocolosPartoSELECTED: TIntegerField
      DisplayLabel = 'Selecionado'
      FieldName = 'SELECTED'
    end
    object cdsProtocolosPartoKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
    end
    object cdsProtocolosPartoKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
    end
    object cdsProtocolosPartoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsProtocolosPartoNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsProtocolosPartoSOMA_SELECTED: TAggregateField
      FieldName = 'SOMA_SELECTED'
      Active = True
      DisplayName = ''
      Expression = 'SUM(SELECTED)'
    end
  end
  object cdsProtocolosCria: TClientDataSet
    PersistDataPacket.Data = {
      AD0000009619E0BD010000001800000005000000000003000000AD000853454C
      45435445440400010000000000164B5A4F4F5F4556454E544F5F5A4F4F544543
      4E49434F01004900000001000557494454480200020014000E4B5A4F4F5F5052
      4F544F434F4C4F010049000000010005574944544802000200140006434F4449
      474F0100490000000100055749445448020002002000044E4F4D450100490000
      0001000557494454480200020080000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 368
    Top = 352
    object cdsProtocolosCriaSELECTED: TIntegerField
      DisplayLabel = 'Selecionado'
      FieldName = 'SELECTED'
    end
    object cdsProtocolosCriaKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
    end
    object cdsProtocolosCriaKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
    end
    object cdsProtocolosCriaCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsProtocolosCriaNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsProtocolosCriaSOMA_SELECTED: TAggregateField
      FieldName = 'SOMA_SELECTED'
      Active = True
      DisplayName = ''
      Expression = 'SUM(SELECTED)'
    end
  end
end
