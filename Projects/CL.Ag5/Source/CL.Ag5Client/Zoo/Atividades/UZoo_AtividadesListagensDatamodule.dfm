object Zoo_AtividadesListagensDataModule: TZoo_AtividadesListagensDataModule
  OldCreateOrder = True
  Height = 294
  Width = 940
  object cdsAListagensBST: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_MULT'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PROD_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PROD_MULT'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DPP_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DPP_MULT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_MULT'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENCERRAR_BST_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_MULT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENCERRAR_BST_MULT'
        ParamType = ptInput
      end>
    ProviderName = 'dspAListagensBST'
    BeforeOpen = cdsAListagensBSTBeforeOpen
    OnCalcFields = cdsAListagensBSTCalcFields
    OnNewRecord = cdsAListagensBSTNewRecord
    Left = 66
    Top = 12
    object cdsAListagensBSTKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsAListagensBSTBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsAListagensBSTBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsAListagensBSTNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsAListagensBSTLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsAListagensBSTULTIMA_LACTACAO: TSQLTimeStampField
      FieldName = 'ULTIMA_LACTACAO'
      Visible = False
    end
    object cdsAListagensBSTDPP: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DPP'
    end
    object cdsAListagensBSTNCOBERTURAS: TIntegerField
      DisplayLabel = 'N. Coberturas'
      FieldName = 'NCOBERTURAS'
    end
    object cdsAListagensBSTPRENHEZ: TStringField
      DisplayLabel = 'Prenhez'
      FieldName = 'PRENHEZ'
      Visible = False
      OnGetText = cdsAListagensBSTPRENHEZGetText
      FixedChar = True
      Size = 1
    end
    object cdsAListagensBSTDATA_ULTBST: TSQLTimeStampField
      DisplayLabel = #218'ltima BST'
      FieldName = 'DATA_ULTBST'
    end
    object cdsAListagensBSTDATA_PREVISTABST: TSQLTimeStampField
      DisplayLabel = 'Data Prevista'
      FieldName = 'DATA_PREVISTABST'
    end
    object cdsAListagensBSTTOTAL: TFloatField
      DisplayLabel = #218'ltima pesagem'
      FieldName = 'TOTAL'
    end
  end
  object dspAListagensBST: TDataSetProvider
    DataSet = sqlAListagensBST
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 45
    Top = 59
  end
  object sqlAListagensBST: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'   DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'   AF.' +
      'BRINCO_ BRINCOFEMEA_,'#13#10'   AF.NOMEESTABULO NOMEFEMEA,'#13#10'   DAF.LOT' +
      'E,'#13#10'   DAF.ULTIMA_LACTACAO,'#13#10'   (    SELECT COUNT(1)'#13#10'        FR' +
      'OM ZOO_EVENTOS_ZOOTECNICOS Z'#13#10'        WHERE Z.KZOO_ANIMAL_FEMEA ' +
      '= DAF.KZOO_ANIMAL_FEMEA'#13#10'          AND Z.DATAEVENTO > DAF.ULTIMA' +
      '_LACTACAO'#13#10'          AND Z.TIPOEVENTO <> :CIO'#13#10'    ) NCOBERTURAS' +
      ','#13#10'   EZ.PRENHEZ,'#13#10'   PL.TOTAL,'#13#10'   IIF(BST.DATA >= L.DATALACTAC' +
      'AO, BST.DATA, NULL) DATA_ULTBST,'#13#10'   IIF(BST.DATA >= L.DATALACTA' +
      'CAO,'#13#10'        IIF( DAF.NUMERO_LACTACAO < 2,'#13#10'             DATEAD' +
      'D( :INTBST_PRIM DAY TO BST.DATA ),'#13#10'             DATEADD( :INTBS' +
      'T_MULT DAY TO BST.DATA )), NULL'#13#10'       ) DATA_PREVISTABST'#13#10'FROM' +
      ' ZOO_ANIMAIS_FEMEA DAF'#13#10'INNER JOIN ZOO_LACTACOES           L   O' +
      'N L.KZOO_LACTACAO           = DAF.KULTIMA_LACTACAO'#13#10'INNER JOIN Z' +
      'OO_PESAGEM_LEITE       PL  ON PL.KZOO_PESAGEM_LEITE     = L.KULT' +
      'IMA_PESAGEMLEITE'#13#10'INNER JOIN ZOO_ANIMAIS             AF  ON AF.K' +
      'ZOO_ANIMAL            = DAF.KZOO_ANIMAL_FEMEA'#13#10'LEFT  JOIN ZOO_EV' +
      'ENTOS_ZOOTECNICOS EZ  ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMA' +
      '_MONTA AND EZ.KZOO_EVENTO_ZOOTECNICO <> L.KZOO_EVENTO_ZOOTECNICO' +
      #13#10'LEFT  JOIN ZOO_ANIMAL_FEMEA_BST    BST ON BST.KZOO_ANIMAL_FEME' +
      'A     = DAF.KZOO_ANIMAL_FEMEA'#13#10'WHERE ( AF. KCAD_FAZENDA = :KCAD_' +
      'FAZENDA ) --hr)\u/F@1JO!0(YZjM,/'#13#10'  AND (  AF.STATUS IS DISTINCT' +
      ' FROM :DESCARTADA )'#13#10'  AND ( L.DATA_SECAGEM IS NULL )'#13#10'  AND (  ' +
      '  ( DAF.NUMERO_LACTACAO <= 1 AND L.PRODUCAO_UC >= :PROD_PRIM )'#13#10 +
      '        OR ( DAF.NUMERO_LACTACAO >= 2 AND L.PRODUCAO_UC >= :PROD' +
      '_MULT )'#13#10'       )'#13#10'  AND (     ( DAF.NUMERO_LACTACAO <= 1 AND  (' +
      ' CAST( :DATA AS DATE ) - CAST( L.DATALACTACAO AS DATE )) >= :DPP' +
      '_PRIM )'#13#10'      OR ( DAF.NUMERO_LACTACAO >= 2 AND ( CAST( :DATA A' +
      'S DATE ) - CAST( L.DATALACTACAO AS DATE )) >= :DPP_MULT )'#13#10'     ' +
      ')'#13#10'  AND ( ( BST.KZOO_ANIMAL_FEMEA_BST IS NULL )'#13#10'        OR ( (' +
      ' BST.DATA = ( SELECT MAX( B.DATA ) FROM ZOO_ANIMAL_FEMEA_BST  B'#13 +
      #10'                           WHERE B.KZOO_ANIMAL_FEMEA = DAF.KZOO' +
      '_ANIMAL_FEMEA )'#13#10'              )'#13#10'             AND BST.MOTIVO_IN' +
      'TERRUPCAO IS NULL'#13#10'             AND IIF( DAF.NUMERO_LACTACAO <= ' +
      '1,'#13#10'                         DATEADD( :INTBST_PRIM DAY TO BST.DA' +
      'TA ),'#13#10'                         DATEADD( :INTBST_MULT DAY TO BST' +
      '.DATA ) ) <= :DATA'#13#10'            )'#13#10'       )'#13#10'  AND (   ( EZ.PREN' +
      'HEZ IS DISTINCT FROM '#39'T'#39' )'#13#10'      OR  (    ( (DAF.NUMERO_LACTACA' +
      'O <= 1) AND (COALESCE( DATEADD( :INTBST_PRIM DAY TO BST.DATA ), ' +
      'CURRENT_TIMESTAMP )  < DATEADD ( :DIAS_ENCERRAR_BST_PRIM DAY TO ' +
      'EZ.DATAEVENTO )))'#13#10'            OR ( (DAF.NUMERO_LACTACAO >  1) A' +
      'ND   (COALESCE( DATEADD( :INTBST_MULT DAY TO BST.DATA ), CURRENT' +
      '_TIMESTAMP ) < DATEADD ( :DIAS_ENCERRAR_BST_MULT DAY TO EZ.DATAE' +
      'VENTO )))'#13#10'          )'#13#10'      )'#13#10'ORDER BY DAF.ULTIMA_LACTACAO,AF' +
      '.BRINCO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_MULT'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PROD_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PROD_MULT'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DPP_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DPP_MULT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_MULT'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENCERRAR_BST_PRIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTBST_MULT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAS_ENCERRAR_BST_MULT'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 66
    Top = 105
    object sqlAListagensBSTKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlAListagensBSTBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlAListagensBSTBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlAListagensBSTNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlAListagensBSTLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlAListagensBSTULTIMA_LACTACAO: TSQLTimeStampField
      FieldName = 'ULTIMA_LACTACAO'
    end
    object sqlAListagensBSTNCOBERTURAS: TIntegerField
      FieldName = 'NCOBERTURAS'
    end
    object sqlAListagensBSTPRENHEZ: TStringField
      FieldName = 'PRENHEZ'
      FixedChar = True
      Size = 1
    end
    object sqlAListagensBSTDATA_ULTBST: TSQLTimeStampField
      FieldName = 'DATA_ULTBST'
    end
    object sqlAListagensBSTDATA_PREVISTABST: TSQLTimeStampField
      FieldName = 'DATA_PREVISTABST'
    end
    object sqlAListagensBSTTOTAL: TFloatField
      DisplayLabel = #218'ltima pesagem'
      FieldName = 'TOTAL'
    end
  end
  object cdsAListagensCC: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BEZ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTADA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAListagensCC'
    BeforeOpen = cdsAListagensCCBeforeOpen
    OnNewRecord = cdsAListagensBSTNewRecord
    Left = 210
    Top = 12
    object cdsAListagensCCKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsAListagensCCBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsAListagensCCBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsAListagensCCNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsAListagensCCSTATUS: TIntegerField
      FieldName = 'STATUS'
      Visible = False
    end
    object cdsAListagensCCDESC_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESC_STATUS'
      LookupDataSet = cdsStatusVaca
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 32
      Lookup = True
    end
    object cdsAListagensCCLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object dspAListagensCC: TDataSetProvider
    DataSet = sqlAListagensCC
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 189
    Top = 59
  end
  object sqlAListagensCC: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BR' +
      'INCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  AF.STATUS,'#13 +
      #10'  DAF.LOTE'#13#10'FROM ZOO_ANIMAIS AF '#13#10'JOIN ZOO_ANIMAIS_FEMEA DAF ON' +
      ' DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'#13#10'WHERE ( AF. KCAD_FAZEND' +
      'A = :KCAD_FAZENDA )'#13#10'  AND (  (AF.STATUS IS DISTINCT FROM :BEZ)'#13 +
      #10'        AND'#13#10'         (AF.STATUS IS DISTINCT FROM :DESCARTADA)'#13 +
      #10'       )'#13#10'ORDER BY  AF.BRINCO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BEZ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DESCARTADA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 210
    Top = 105
    object sqlAListagensCCKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlAListagensCCBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlAListagensCCBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlAListagensCCNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlAListagensCCSTATUS: TIntegerField
      FieldName = 'STATUS'
      Visible = False
    end
    object sqlAListagensCCLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object cdsAListagensCMT: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VL'
        ParamType = ptInput
      end>
    ProviderName = 'dspAListagensCMT'
    BeforeOpen = cdsAListagensCMTBeforeOpen
    OnNewRecord = cdsAListagensBSTNewRecord
    Left = 354
    Top = 12
    object cdsAListagensCMTKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
    end
    object cdsAListagensCMTBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsAListagensCMTBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsAListagensCMTNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsAListagensCMTSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Visible = False
    end
    object cdsAListagensCMTDESC_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESC_STATUS'
      LookupDataSet = cdsStatusVaca
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 32
      Lookup = True
    end
    object cdsAListagensCMTLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object dspAListagensCMT: TDataSetProvider
    DataSet = sqlAListagensCMT
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 333
    Top = 59
  end
  object sqlAListagensCMT: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  DAF.KZOO_ANIMAL_FEMEA, AF.BRINCO BRINCOFEMEA,'#13#10'  AF.BR' +
      'INCO_ BRINCOFEMEA_,'#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  AF.STATUS,'#13 +
      #10'  DAF.LOTE'#13#10'FROM ZOO_ANIMAIS AF '#13#10'JOIN ZOO_ANIMAIS_FEMEA DAF ON' +
      ' DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'#13#10'WHERE ( AF. KCAD_FAZEND' +
      'A = :KCAD_FAZENDA )'#13#10'  AND ( AF.STATUS = :VL)'#13#10'ORDER BY  AF.BRIN' +
      'CO_'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 354
    Top = 105
    object sqlAListagensCMTKZOO_ANIMAL_FEMEA: TStringField
      DisplayLabel = 'Animal'
      FieldName = 'KZOO_ANIMAL_FEMEA'
    end
    object sqlAListagensCMTBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlAListagensCMTBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlAListagensCMTNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlAListagensCMTSTATUS: TIntegerField
      FieldName = 'STATUS'
      Visible = False
    end
    object sqlAListagensCMTLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object cdsStatusVaca: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 744
    Top = 12
    object cdsStatusVacaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 31
    end
    object cdsStatusVacaVALOR: TStringField
      FieldName = 'VALOR'
      Size = 31
    end
    object cdsStatusVacaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 31
    end
    object cdsStatusVacaORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsListaEscores: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaEscores'
    BeforeOpen = cdsListaEscoresBeforeOpen
    Left = 624
    Top = 16
    object cdsListaEscoresKZOO_CFGESCORE: TStringField
      FieldName = 'KZOO_CFGESCORE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object cdsListaEscoresTABLE_ID: TIntegerField
      FieldName = 'TABLE_ID'
      Visible = False
    end
    object cdsListaEscoresTIPOESCORE: TStringField
      FieldName = 'TIPOESCORE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsListaEscoresSIGLA: TStringField
      DisplayLabel = 'Escore'
      FieldName = 'SIGLA'
      Size = 32
    end
    object cdsListaEscoresNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsListaEscoresOBS: TMemoField
      DisplayLabel = 'Lagenda'
      FieldName = 'OBS'
      Visible = False
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspListaEscores: TDataSetProvider
    DataSet = sqlListaEscores
    Options = [poIncFieldProps, poRetainServerOrder]
    Left = 584
    Top = 60
  end
  object sqlListaEscores: TTcSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT'#13#10' KZOO_CFGESCORE, '#13#10' TABLE_ID, '#13#10' TIPOESCORE,'#13#10' SIGLA, '#13#10 +
      ' NOME, '#13#10' OBS'#13#10'FROM  ZOO_CFGESCORES'#13#10'WHERE KCAD_FAZENDA = :KCAD_' +
      'FAZENDA AND ATIVO = '#39'T'#39
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 640
    Top = 112
    object sqlListaEscoresKZOO_CFGESCORE: TStringField
      FieldName = 'KZOO_CFGESCORE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object sqlListaEscoresTABLE_ID: TIntegerField
      FieldName = 'TABLE_ID'
      Visible = False
    end
    object sqlListaEscoresTIPOESCORE: TStringField
      FieldName = 'TIPOESCORE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object sqlListaEscoresSIGLA: TStringField
      DisplayLabel = 'Escore'
      FieldName = 'SIGLA'
      Size = 32
    end
    object sqlListaEscoresNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlListaEscoresOBS: TMemoField
      DisplayLabel = 'Lagenda'
      FieldName = 'OBS'
      Visible = False
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsEscores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEscores'
    Left = 498
    Top = 16
    object cdsEscoresKZOO_E: TStringField
      FieldName = 'KZOO_E'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object cdsEscoresKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
      FixedChar = True
    end
    object cdsEscoresBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsEscoresNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsEscoresDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsEscoresLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsEscoresKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object cdsEscoresNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
  end
  object dspEscores: TDataSetProvider
    DataSet = sqlEscores
    Options = [poIncFieldProps, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 458
    Top = 61
  end
  object sqlEscores: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 'SELECT * '#13#10'FROM ZOO_E_F0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 493
    Top = 104
    object sqlEscoresKZOO_E: TStringField
      FieldName = 'KZOO_E'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object sqlEscoresKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Visible = False
      FixedChar = True
    end
    object sqlEscoresDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object sqlEscoresLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlEscoresKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
      FixedChar = True
    end
    object sqlEscoresNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
  end
  object cdsDescricaoBST: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 747
    Top = 71
    object cdsDescricaoBSTTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsDescricaoBSTVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsDescricaoBSTDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsDescricaoBSTORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
