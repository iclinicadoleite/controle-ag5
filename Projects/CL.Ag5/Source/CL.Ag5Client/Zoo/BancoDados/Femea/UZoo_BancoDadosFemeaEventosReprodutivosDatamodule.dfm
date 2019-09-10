object Zoo_BancoDadosFemeaEventosReprodutivosDatamodule: TZoo_BancoDadosFemeaEventosReprodutivosDatamodule
  OldCreateOrder = True
  Height = 392
  Width = 640
  object cdsEventosReprodutivos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspEventosReprodutivos'
    BeforeEdit = cdsEventosReprodutivosBeforeEdit
    BeforePost = cdsEventosReprodutivosBeforePost
    BeforeCancel = cdsEventosReprodutivosBeforeCancel
    AfterCancel = cdsEventosReprodutivosAfterCancel
    BeforeDelete = cdsEventosReprodutivosBeforeDelete
    BeforeScroll = cdsEventosReprodutivosBeforeScroll
    OnCalcFields = cdsEventosReprodutivosCalcFields
    OnNewRecord = cdsEventosReprodutivosNewRecord
    Left = 95
    Top = 28
    object cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEventosReprodutivosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsEventosReprodutivosKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      Visible = False
      FixedChar = True
    end
    object cdsEventosReprodutivosRECORDEXISTS: TStringField
      FieldName = 'RECORDEXISTS'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object cdsEventosReprodutivosDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data evento'
      FieldName = 'DATAEVENTO'
      Required = True
      OnValidate = cdsEventosReprodutivosDATAEVENTOValidate
    end
    object cdsEventosReprodutivosTIPOEVENTO: TIntegerField
      DisplayLabel = 'Evento'
      FieldName = 'TIPOEVENTO'
      Visible = False
      OnSetText = cdsEventosReprodutivosTIPOEVENTOSetText
      OnValidate = cdsEventosReprodutivosTIPOEVENTOValidate
    end
    object cdsEventosReprodutivosDESC_EVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldKind = fkLookup
      FieldName = 'DESC_EVENTO'
      LookupDataSet = cdsTipoEvento
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPOEVENTO'
      Size = 31
      Lookup = True
    end
    object cdsEventosReprodutivosIEE: TIntegerField
      DisplayLabel = 'Intervalo'
      FieldName = 'IEE'
      Visible = False
    end
    object cdsEventosReprodutivosMUCO: TIntegerField
      DisplayLabel = 'Muco'
      FieldName = 'MUCO'
      Visible = False
    end
    object cdsEventosReprodutivosDESC_MUCO: TStringField
      DisplayLabel = 'Muco'
      FieldKind = fkLookup
      FieldName = 'DESC_MUCO'
      LookupDataSet = cdsTipoMuco
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'MUCO'
      Visible = False
      Size = 31
      Lookup = True
    end
    object cdsEventosReprodutivosNOMEMACHO: TStringField
      DisplayLabel = 'Touro'
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsEventosReprodutivosNOMEMACHOGetText
      OnSetText = cdsEventosReprodutivosNOMEMACHOSetText
      Size = 60
    end
    object cdsEventosReprodutivosDOSES: TIntegerField
      DisplayLabel = 'Doses'
      FieldName = 'DOSES'
      Visible = False
      OnGetText = cdsEventosReprodutivosDOSESGetText
    end
    object cdsEventosReprodutivosIATF: TStringField
      FieldName = 'IATF'
      Required = True
      OnGetText = cdsEventosReprodutivosIATFGetText
      OnValidate = cdsEventosReprodutivosIATFValidate
      FixedChar = True
      Size = 1
    end
    object cdsEventosReprodutivosKZOO_PROTOCOLO_IATF: TStringField
      FieldName = 'KZOO_PROTOCOLO_IATF'
      Visible = False
      FixedChar = True
    end
    object cdsEventosReprodutivosDESC_PROTOCOLO_IATF: TStringField
      DisplayLabel = 'Protocolo IATF'
      FieldKind = fkLookup
      FieldName = 'DESC_PROTOCOLO_IATF'
      LookupDataSet = cdsProtocolosIATF
      LookupKeyFields = 'KZOO_PROTOCOLO'
      LookupResultField = 'CODIGO'
      KeyFields = 'KZOO_PROTOCOLO_IATF'
      Visible = False
      Size = 32
      Lookup = True
    end
    object cdsEventosReprodutivosDATATOQUE: TSQLTimeStampField
      DisplayLabel = 'Data toque'
      FieldName = 'DATATOQUE'
      OnValidate = cdsEventosReprodutivosDATATOQUEValidate
    end
    object cdsEventosReprodutivosPRENHEZ: TStringField
      DisplayLabel = 'Prenhez'
      FieldName = 'PRENHEZ'
      OnValidate = cdsEventosReprodutivosPRENHEZValidate
      FixedChar = True
      Size = 1
    end
    object cdsEventosReprodutivosDESC_PRENHEZ: TStringField
      DisplayLabel = 'Prenhez'
      FieldKind = fkLookup
      FieldName = 'DESC_PRENHEZ'
      LookupDataSet = cdsStatusPrenhez
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRENHEZ'
      Size = 31
      Lookup = True
    end
    object cdsEventosReprodutivosPROTOCOLO_TOQUE: TStringField
      DisplayLabel = 'Protocolo toque'
      FieldName = 'PROTOCOLO_TOQUE'
      Visible = False
      OnGetText = cdsEventosReprodutivosPROTOCOLO_TOQUEGetText
      FixedChar = True
      Size = 1
    end
    object cdsEventosReprodutivosREEXAMINAR: TStringField
      DisplayLabel = 'Reexaminar'
      FieldName = 'REEXAMINAR'
      Required = True
      OnGetText = cdsEventosReprodutivosREEXAMINARGetText
      FixedChar = True
      Size = 1
    end
    object cdsEventosReprodutivosGEMELAR: TStringField
      FieldName = 'GEMELAR'
      OnValidate = cdsEventosReprodutivosGEMELARValidate
      FixedChar = True
      Size = 1
    end
    object cdsEventosReprodutivosSEXO_CRIA: TIntegerField
      FieldName = 'SEXO_CRIA'
      OnValidate = cdsEventosReprodutivosSEXO_CRIAValidate
    end
    object cdsEventosReprodutivosPREVISAOPARTO: TSQLTimeStampField
      DisplayLabel = 'Previs'#227'o parto'
      FieldKind = fkInternalCalc
      FieldName = 'PREVISAOPARTO'
    end
    object cdsEventosReprodutivosDIAS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DIAS'
    end
    object cdsEventosReprodutivosDATAABORTOPARTO: TSQLTimeStampField
      DisplayLabel = 'Data parto/aborto/coleta'
      FieldName = 'DATAABORTOPARTO'
      OnValidate = cdsEventosReprodutivosDATAABORTOPARTOValidate
    end
    object cdsEventosReprodutivosABORTOPARTO: TIntegerField
      DisplayLabel = 'Parto/aborto/coleta'
      FieldName = 'ABORTOPARTO'
      Visible = False
      OnValidate = cdsEventosReprodutivosABORTOPARTOValidate
    end
    object cdsEventosReprodutivosDESC_PARTOABORTO: TStringField
      DisplayLabel = 'Parto/aborto'
      FieldKind = fkLookup
      FieldName = 'DESC_PARTOABORTO'
      LookupDataSet = cdsTipoPartoAborto
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ABORTOPARTO'
      Size = 31
      Lookup = True
    end
    object cdsEventosReprodutivosPROTOCOLO_PARTO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO_PARTO'
      Visible = False
      OnGetText = cdsEventosReprodutivosPROTOCOLO_PARTOGetText
      FixedChar = True
      Size = 1
    end
    object cdsEventosReprodutivosFUNCIONARIO_EVENTO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'FUNCIONARIO_EVENTO'
      Size = 128
    end
    object cdsEventosReprodutivosKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object cdsEventosReprodutivosNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = cdsEventosReprodutivosNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsEventosReprodutivosKCAD_VETERINARIO: TStringField
      FieldName = 'KCAD_VETERINARIO'
      FixedChar = True
    end
    object cdsEventosReprodutivosNOMEVETERINARIO: TStringField
      DisplayLabel = 'Veterin'#225'rio'
      FieldName = 'NOMEVETERINARIO'
      Size = 128
    end
    object cdsEventosReprodutivosKCAD_FUNCIONARIO_COLETA: TStringField
      FieldName = 'KCAD_FUNCIONARIO_COLETA'
      FixedChar = True
    end
    object cdsEventosReprodutivosNOMEFUNCIONARIO_COLETA: TStringField
      FieldName = 'NOMEFUNCIONARIO_COLETA'
      Size = 128
    end
    object cdsEventosReprodutivosOBS_EVENTO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS_EVENTO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsEventosReprodutivosEMBRIOESCOLETADOS: TIntegerField
      DisplayLabel = 'Embri'#245'es coletados'
      FieldName = 'EMBRIOESCOLETADOS'
      Visible = False
    end
    object cdsEventosReprodutivosKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object cdsEventosReprodutivosNL: TIntegerField
      FieldName = 'NL'
      ProviderFlags = []
      Visible = False
    end
    object cdsEventosReprodutivosINCLUIRCRIA: TStringField
      FieldName = 'INCLUIRCRIA'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventosReprodutivosCOMUNICACAO_COBERTURA: TStringField
      DisplayLabel = 'No comunica'#231#227'o cobertura'
      FieldName = 'COMUNICACAO_COBERTURA'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object cdsEventosReprodutivosTIPOMACHO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TIPOMACHO'
    end
    object cdsEventosReprodutivosFORCEABORTO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'FORCEABORTO'
      Size = 1
    end
    object cdsEventosReprodutivosNUMEROFILHOS: TSmallintField
      DisplayLabel = 'Filhos'
      FieldKind = fkCalculated
      FieldName = 'NUMEROFILHOS'
      OnGetText = cdsEventosReprodutivosNUMEROFILHOSGetText
      Calculated = True
    end
    object cdsEventosReprodutivosIEP_DIAS: TIntegerField
      DisplayLabel = 'IEP'
      FieldName = 'IEP_DIAS'
      ProviderFlags = [pfInWhere]
    end
    object cdsEventosReprodutivosIEP_MESES: TIntegerField
      DisplayLabel = 'IEP'
      FieldName = 'IEP_MESES'
      ProviderFlags = [pfInWhere]
    end
    object cdsEventosReprodutivosIDADE_MESES: TFMTBCDField
      DisplayLabel = 'Idade'
      FieldName = 'IDADE_MESES'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsEventosReprodutivosIDADE_MESESGetText
      Precision = 15
      Size = 1
    end
    object cdsEventosReprodutivosGRAUSANGUEPAI: TStringField
      FieldName = 'GRAUSANGUEPAI'
      FixedChar = True
      Size = 5
    end
    object cdsEventosReprodutivosCOMPOSICAORACAPAI: TStringField
      FieldName = 'COMPOSICAORACAPAI'
      Size = 32
    end
    object cdsEventosReprodutivosGRAUSANGUEMAE: TStringField
      FieldName = 'GRAUSANGUEMAE'
      FixedChar = True
      Size = 5
    end
    object cdsEventosReprodutivosCOMPOSICAORACAMAE: TStringField
      FieldName = 'COMPOSICAORACAMAE'
      Size = 32
    end
    object cdsEventosReprodutivosSYSDI: TSQLTimeStampField
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object cdsEventosReprodutivossqlLinhagem: TDataSetField
      DisplayLabel = 'LLinhagem'
      FieldName = 'sqlLinhagem'
    end
    object cdsEventosReprodutivosDESC_SEXO_CRIA: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_SEXO_CRIA'
      LookupDataSet = cdsSexoCria
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'SEXO_CRIA'
      Size = 15
      Lookup = True
    end
    object cdsEventosReprodutivosDESC_GEMELAR: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_GEMELAR'
      LookupDataSet = cdsStatusGemelar
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'GEMELAR'
      Lookup = True
    end
    object cdsEventosReprodutivosRETIRO: TStringField
      FieldName = 'RETIRO'
      Size = 32
    end
    object cdsEventosReprodutivosQTDE_COBERTURA: TIntegerField
      DisplayLabel = 'N'#250'mero cobertura'
      FieldName = 'QTDE_COBERTURA'
      ProviderFlags = []
    end
    object cdsEventosReprodutivosDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
      ProviderFlags = []
    end
  end
  object sqlEventosReprodutivos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT  '#13#10' E.KZOO_EVENTO_ZOOTECNICO, '#13#10' E.KZOO_ANIMAL_FEMEA, '#13#10' ' +
      'E.KZOO_ANIMAL_MACHO,'#13#10' '#39'T'#39' RECORDEXISTS,'#13#10' AM.NOMEESTABULO NOMEM' +
      'ACHO,'#13#10' E.DATAEVENTO,  '#13#10' E.TIPOEVENTO,'#13#10' E.DOSES,  '#13#10' E.MUCO,  ' +
      #13#10' E.PRENHEZ, '#13#10' E.REEXAMINAR,'#13#10' E.DATATOQUE, '#13#10' E.GEMELAR,'#13#10' E.' +
      'SEXO_CRIA,'#13#10' E.ABORTOPARTO,  '#13#10' E.DATAABORTOPARTO, '#13#10' E.EMBRIOES' +
      'COLETADOS, '#13#10' E.KCAD_FUNCIONARIO, '#13#10' E.NOMEFUNCIONARIO, '#13#10' E.KCA' +
      'D_VETERINARIO,'#13#10' E.NOMEVETERINARIO,'#13#10' E.OBS_EVENTO,'#13#10' E.PROTOCOL' +
      'O_PARTO, '#13#10' E.PROTOCOLO_TOQUE, '#13#10' E.KCAD_FUNCIONARIO_COLETA,'#13#10' E' +
      '.NOMEFUNCIONARIO_COLETA,'#13#10' E.COMUNICACAO_COBERTURA,'#13#10' L.KZOO_LAC' +
      'TACAO, '#13#10' L.NL, '#13#10' L.IEP_DIAS, '#13#10' L.IDADE_LACTACAO_MESES IDADE_M' +
      'ESES,'#13#10' L.IEP_MESES, '#13#10' '#39'F'#39' INCLUIRCRIA, '#13#10' AM.GRAUSANGUE GRAUSA' +
      'NGUEPAI,'#13#10' AM.COMPOSICAORACA COMPOSICAORACAPAI,'#13#10' FE.GRAUSANGUE ' +
      'GRAUSANGUEMAE,'#13#10' FE.COMPOSICAORACA COMPOSICAORACAMAE,'#13#10' E.IEE,'#13#10 +
      ' E.IATF,'#13#10' E.KZOO_PROTOCOLO_IATF,'#13#10' AF.RETIRO,'#13#10' E."SYS$DI",'#13#10'(S' +
      'ELECT QTDE_COBERTURA FROM ZOO_GET_QTDE_COBERTURA_LACTACAO(E.KZOO' +
      '_ANIMAL_FEMEA, E.DATAEVENTO)) QTDE_COBERTURA,'#13#10'AF.DOADOR_RECEPTO' +
      'R'#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS E'#13#10'JOIN ZOO_ANIMAIS_FEMEA AF ON ' +
      'AF.KZOO_ANIMAL_FEMEA = E.KZOO_ANIMAL_FEMEA'#13#10'INNER JOIN ZOO_ANIMA' +
      'IS FE ON FE.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'#13#10'LEFT JOIN ZOO_AN' +
      'IMAIS AM ON AM.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO'#13#10'LEFT JOIN ZOO_' +
      'LACTACOES L ON L.KZOO_EVENTO_ZOOTECNICO = E.KZOO_EVENTO_ZOOTECNI' +
      'CO'#13#10'WHERE E.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'#13#10'ORDER BY E.DATAEVE' +
      'NTO'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 94
    Top = 120
    object sqlEventosReprodutivosKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlEventosReprodutivosKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlEventosReprodutivosKZOO_ANIMAL_MACHO: TStringField
      FieldName = 'KZOO_ANIMAL_MACHO'
      FixedChar = True
    end
    object sqlEventosReprodutivosRECORDEXISTS: TStringField
      FieldName = 'RECORDEXISTS'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlEventosReprodutivosDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object sqlEventosReprodutivosTIPOEVENTO: TIntegerField
      FieldName = 'TIPOEVENTO'
    end
    object sqlEventosReprodutivosMUCO: TIntegerField
      FieldName = 'MUCO'
    end
    object sqlEventosReprodutivosNOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlEventosReprodutivosDOSES: TIntegerField
      FieldName = 'DOSES'
    end
    object sqlEventosReprodutivosIATF: TStringField
      FieldName = 'IATF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEventosReprodutivosKZOO_PROTOCOLO_IATF: TStringField
      FieldName = 'KZOO_PROTOCOLO_IATF'
      FixedChar = True
    end
    object sqlEventosReprodutivosDATATOQUE: TSQLTimeStampField
      FieldName = 'DATATOQUE'
    end
    object sqlEventosReprodutivosPRENHEZ: TStringField
      FieldName = 'PRENHEZ'
      FixedChar = True
      Size = 1
    end
    object sqlEventosReprodutivosPROTOCOLO_TOQUE: TStringField
      FieldName = 'PROTOCOLO_TOQUE'
      FixedChar = True
      Size = 1
    end
    object sqlEventosReprodutivosREEXAMINAR: TStringField
      FieldName = 'REEXAMINAR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEventosReprodutivosDATAABORTOPARTO: TSQLTimeStampField
      FieldName = 'DATAABORTOPARTO'
    end
    object sqlEventosReprodutivosABORTOPARTO: TIntegerField
      FieldName = 'ABORTOPARTO'
    end
    object sqlEventosReprodutivosPROTOCOLO_PARTO: TStringField
      FieldName = 'PROTOCOLO_PARTO'
      FixedChar = True
      Size = 1
    end
    object sqlEventosReprodutivosEMBRIOESCOLETADOS: TIntegerField
      DisplayLabel = 'Embri'#245'es coletados'
      FieldName = 'EMBRIOESCOLETADOS'
    end
    object sqlEventosReprodutivosKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlEventosReprodutivosNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlEventosReprodutivosKCAD_VETERINARIO: TStringField
      FieldName = 'KCAD_VETERINARIO'
      FixedChar = True
    end
    object sqlEventosReprodutivosNOMEVETERINARIO: TStringField
      FieldName = 'NOMEVETERINARIO'
      Size = 128
    end
    object sqlEventosReprodutivosOBS_EVENTO: TMemoField
      FieldName = 'OBS_EVENTO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlEventosReprodutivosKCAD_FUNCIONARIO_COLETA: TStringField
      FieldName = 'KCAD_FUNCIONARIO_COLETA'
      FixedChar = True
    end
    object sqlEventosReprodutivosNOMEFUNCIONARIO_COLETA: TStringField
      FieldName = 'NOMEFUNCIONARIO_COLETA'
      Size = 128
    end
    object sqlEventosReprodutivosNL: TIntegerField
      FieldName = 'NL'
      ProviderFlags = []
      Visible = False
    end
    object sqlEventosReprodutivosINCLUIRCRIA: TStringField
      FieldName = 'INCLUIRCRIA'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEventosReprodutivosCOMUNICACAO_COBERTURA: TStringField
      DisplayLabel = 'No comunica'#231#227'o cobertura'
      FieldName = 'COMUNICACAO_COBERTURA'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object sqlEventosReprodutivosKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlEventosReprodutivosIEP_DIAS: TIntegerField
      FieldName = 'IEP_DIAS'
      ProviderFlags = [pfInWhere]
    end
    object sqlEventosReprodutivosIEP_MESES: TIntegerField
      DisplayLabel = 'IEP'
      FieldName = 'IEP_MESES'
      ProviderFlags = [pfInWhere]
    end
    object sqlEventosReprodutivosIDADE_MESES: TFMTBCDField
      DisplayLabel = 'Idade'
      FieldName = 'IDADE_MESES'
      ProviderFlags = [pfInWhere]
      Precision = 15
      Size = 1
    end
    object sqlEventosReprodutivosGRAUSANGUEPAI: TStringField
      FieldName = 'GRAUSANGUEPAI'
      FixedChar = True
      Size = 5
    end
    object sqlEventosReprodutivosCOMPOSICAORACAPAI: TStringField
      FieldName = 'COMPOSICAORACAPAI'
      Size = 32
    end
    object sqlEventosReprodutivosGRAUSANGUEMAE: TStringField
      FieldName = 'GRAUSANGUEMAE'
      FixedChar = True
      Size = 5
    end
    object sqlEventosReprodutivosCOMPOSICAORACAMAE: TStringField
      FieldName = 'COMPOSICAORACAMAE'
      Size = 32
    end
    object sqlEventosReprodutivosSYSDI: TSQLTimeStampField
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object sqlEventosReprodutivosIEE: TIntegerField
      FieldName = 'IEE'
    end
    object sqlEventosReprodutivosGEMELAR: TStringField
      FieldName = 'GEMELAR'
      FixedChar = True
      Size = 1
    end
    object sqlEventosReprodutivosSEXO_CRIA: TIntegerField
      FieldName = 'SEXO_CRIA'
    end
    object sqlEventosReprodutivosRETIRO: TStringField
      FieldName = 'RETIRO'
      Size = 32
    end
    object sqlEventosReprodutivosQTDE_COBERTURA: TIntegerField
      DisplayLabel = 'N'#250'mero cobertura'
      FieldName = 'QTDE_COBERTURA'
      ProviderFlags = []
    end
    object sqlEventosReprodutivosDOADOR_RECEPTOR: TIntegerField
      FieldName = 'DOADOR_RECEPTOR'
      ProviderFlags = []
    end
  end
  object dspEventosReprodutivos: TDataSetProvider
    DataSet = sqlEventosReprodutivos
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspEventosReprodutivosAfterUpdateRecord
    BeforeUpdateRecord = dspEventosReprodutivosBeforeUpdateRecord
    OnGetTableName = dspEventosReprodutivosGetTableName
    Left = 36
    Top = 88
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
    Left = 393
    Top = 7
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
    Left = 393
    Top = 55
    object cdsTipoEventoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoEventoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoEventoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoEventoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoPartoAborto: TClientDataSet
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
    Top = 104
    object cdsTipoPartoAbortoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoORDEM: TIntegerField
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
    Left = 392
    Top = 168
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
    Left = 393
    Top = 224
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
  object cdsLinhagem: TClientDataSet
    Aggregates = <>
    DataSetField = cdsEventosReprodutivossqlLinhagem
    FetchOnDemand = False
    Params = <>
    BeforeInsert = cdsLinhagemBeforeInsert
    BeforePost = cdsLinhagemBeforePost
    OnCalcFields = cdsLinhagemCalcFields
    OnNewRecord = cdsLinhagemNewRecord
    Left = 173
    Top = 36
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
    object cdsLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
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
      ProviderFlags = [pfInWhere]
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
      Size = 12
    end
    object cdsLinhagemGSR_MAE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'GSR_MAE'
      Size = 12
    end
    object cdsLinhagemRETIRO_CRIA: TStringField
      FieldName = 'RETIRO_CRIA'
      Size = 32
    end
  end
  object sqlLinhagem: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'    L.KZOO_ANIMAL_LINHAGEM,'#13#10'    L.KZOO_ANIMAL,'#13#10'    L.K' +
      'ZOO_EVENTO_ZOOTECNICO,'#13#10'    L.NATIMORTO,'#13#10'    L.BRINCO,'#13#10'    L.N' +
      'OMEANIMAL NOMEESTABULO,'#13#10'    A.NOMECOMPLETO,'#13#10'    L.KZOO_ANIMAL_' +
      'MACHO,'#13#10'    L.NOMEPAI,'#13#10'    L.REGISTROPAI,'#13#10'    L.KZOO_ANIMAL_FE' +
      'MEA,'#13#10'    L.NOMEMAE,'#13#10'    L.REGISTROMAE,'#13#10'    L.KZOO_LACTACAO,'#13#10 +
      '    L.RACA,'#13#10'    L.GRAUSANGUE, '#13#10'    L.COMPOSICAORACA,'#13#10'    L.GR' +
      'AUSANGUEPAI, '#13#10'    L.COMPOSICAORACAPAI,'#13#10'    L.GRAUSANGUEMAE, '#13#10 +
      '    L.COMPOSICAORACAMAE,'#13#10'    L.PESO,'#13#10'    L.ALTURA,'#13#10'    L.SEXO' +
      ','#13#10'    cast ( '#39#39' AS VARCHAR ( 32 )) LOTE,'#13#10'    CAST('#39#39' AS VARCHA' +
      'R(32)) RETIRO_CRIA,'#13#10'    L.NASCIMENTO'#13#10'FROM ZOO_ANIMAL_LINHAGEM ' +
      'L'#13#10'LEFT JOIN ZOO_ANIMAIS A ON  A.KZOO_ANIMAL = L.KZOO_ANIMAL'#13#10'WH' +
      'ERE ( L.KZOO_EVENTO_ZOOTECNICO  = :KZOO_EVENTO_ZOOTECNICO )'
    DataSource = dtsSQLEventosReprodutivos
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_EVENTO_ZOOTECNICO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 172
    Top = 120
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
    object sqlLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField
      FieldName = 'KZOO_EVENTO_ZOOTECNICO'
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
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlLinhagemNOMEESTABULO: TStringField
      FieldName = 'NOMEESTABULO'
      Origin = 'L.NOMEANIMAL'
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
  object dtsSQLEventosReprodutivos: TDataSource
    DataSet = sqlEventosReprodutivos
    Left = 140
    Top = 174
  end
  object cdsStatusPrenhez: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 508
    Top = 4
    object cdsStatusPrenhezTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusPrenhezVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusPrenhezDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsStatusPrenhezORDEM: TIntegerField
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
    Left = 508
    Top = 56
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
    Left = 512
    Top = 115
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
  object cdsProtocolosIATF: TClientDataSet
    PersistDataPacket.Data = {
      580000009619E0BD01000000180000000200000000000300000058000E4B5A4F
      4F5F50524F544F434F4C4F010049000400010005574944544802000200140006
      434F4449474F01004900040001000557494454480200020020000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 393
    Top = 282
    object cdsProtocolosIATFKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Required = True
    end
    object cdsProtocolosIATFCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
  end
  object cdsSexoCria: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 512
    Top = 180
    object StringField1: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object StringField2: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object StringField3: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object IntegerField1: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsStatusGemelar: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 516
    Top = 240
    object StringField4: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object StringField5: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object StringField6: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object IntegerField2: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
