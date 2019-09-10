object Zoo_SanidadeBSTDatamodule2: TZoo_SanidadeBSTDatamodule2
  OldCreateOrder = True
  Height = 259
  Width = 627
  object cdsBST: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBST'
    BeforePost = cdsBSTBeforePost
    OnNewRecord = cdsBSTNewRecord
    Left = 78
    Top = 12
    object cdsBSTKZOO_ANIMAL_FEMEA_BST: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA_BST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsBSTKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object cdsBSTKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object cdsBSTBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldKind = fkInternalCalc
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsBSTNOMEESTABULO: TStringField
      DisplayLabel = 'Nome'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEESTABULO'
      Size = 60
    end
    object cdsBSTDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsBSTOBSERVACAO: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsBSTKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object cdsBSTNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = cdsBSTNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsBSTLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsBSTAPLICADO: TStringField
      DisplayLabel = 'Aplicado'
      FieldName = 'APLICADO'
      OnGetText = cdsBSTAPLICADOGetText
      FixedChar = True
      Size = 1
    end
    object cdsBSTMOTIVO_INTERRUPCAO: TIntegerField
      DisplayLabel = 'Motivo da interrup'#231#227'o'
      FieldName = 'MOTIVO_INTERRUPCAO'
    end
    object cdsBSTDESC_MOTIVO_INTERRUPCAO: TStringField
      DisplayLabel = 'Motivo da interrup'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'DESC_MOTIVO_INTERRUPCAO'
      LookupDataSet = cdsMotivoInterrupcaoBST
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'MOTIVO_INTERRUPCAO'
      Size = 31
      Lookup = True
    end
  end
  object dspBST: TDataSetProvider
    DataSet = sqlBST
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 57
  end
  object sqlBST: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'   KZOO_ANIMAL_FEMEA_BST,'#13#10'   KZOO_ANIMAL_FEMEA,'#13#10'   KZ' +
      'OO_LACTACAO,'#13#10'   DATA,  '#13#10'   OBSERVACAO, '#13#10'   KCAD_FUNCIONARIO, ' +
      #13#10'   NOMEFUNCIONARIO,'#13#10'   LOTE,'#13#10'   APLICADO,'#13#10'   MOTIVO_INTERRU' +
      'PCAO'#13#10'FROM '#13#10'ZOO_ANIMAL_FEMEA_BST'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = DBZootecnico.SQLDB
    Left = 73
    Top = 100
    object sqlBSTKZOO_ANIMAL_FEMEA_BST: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA_BST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlBSTKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlBSTKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      FixedChar = True
    end
    object sqlBSTDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object sqlBSTOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlBSTKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlBSTNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
    object sqlBSTLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlBSTAPLICADO: TStringField
      DisplayLabel = 'Aplicado'
      FieldName = 'APLICADO'
      FixedChar = True
      Size = 1
    end
    object sqlBSTMOTIVO_INTERRUPCAO: TIntegerField
      DisplayLabel = 'Motivo da interrup'#231#227'o'
      FieldName = 'MOTIVO_INTERRUPCAO'
    end
  end
  object cdsSelectBST: TClientDataSet
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
        DataType = ftFixedChar
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
    ProviderName = 'dspSelectBST'
    BeforeOpen = cdsSelectBSTBeforeOpen
    OnCalcFields = cdsSelectBSTCalcFields
    Left = 306
    Top = 12
    object cdsSelectBSTKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsSelectBSTSELECTED: TStringField
      DisplayLabel = 'Selecionado'
      FieldKind = fkInternalCalc
      FieldName = 'SELECTED'
      OnGetText = cdsSelectBSTSELECTEDGetText
      Size = 1
    end
    object cdsSelectBSTBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsSelectBSTBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsSelectBSTNOMEFEMEA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsSelectBSTLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object cdsSelectBSTKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Visible = False
      FixedChar = True
    end
    object cdsSelectBSTULTIMA_LACTACAO: TSQLTimeStampField
      FieldName = 'ULTIMA_LACTACAO'
      Visible = False
    end
    object cdsSelectBSTDPP: TIntegerField
      FieldName = 'DPP'
    end
    object cdsSelectBSTNCOBERTURAS: TIntegerField
      DisplayLabel = 'N. Coberturas'
      FieldName = 'NCOBERTURAS'
    end
    object cdsSelectBSTPRENHEZ: TStringField
      DisplayLabel = 'Prenhez'
      FieldName = 'PRENHEZ'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsSelectBSTDATA_ULTBST: TSQLTimeStampField
      DisplayLabel = #218'ltima BST'
      FieldName = 'DATA_ULTBST'
    end
    object cdsSelectBSTDATA_PREVISTABST: TSQLTimeStampField
      DisplayLabel = 'Data Prevista'
      FieldName = 'DATA_PREVISTABST'
    end
    object cdsSelectBSTTOTAL: TFloatField
      DisplayLabel = #218'ltima pesagem'
      FieldName = 'TOTAL'
    end
  end
  object dspSelectBST: TDataSetProvider
    DataSet = sqlSelectBST
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 285
    Top = 59
  end
  object sqlSelectBST: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'   DAF.KZOO_ANIMAL_FEMEA,'#13#10'   AF.BRINCO BRINCOFEMEA,'#13#10'  ' +
      ' AF.BRINCO_ BRINCOFEMEA_,'#13#10'   AF.NOMEESTABULO NOMEFEMEA,'#13#10'   DAF' +
      '.LOTE,'#13#10'   DAF.KULTIMA_LACTACAO KZOO_LACTACAO,'#13#10'   DAF.ULTIMA_LA' +
      'CTACAO,'#13#10'  (COALESCE( CAST( L.DATA_SECAGEM AS DATE), CURRENT_DAT' +
      'E) - CAST( L.DATALACTACAO AS DATE )) DPP,'#13#10'   (    SELECT COUNT(' +
      '1)'#13#10'        FROM ZOO_EVENTOS_ZOOTECNICOS Z'#13#10'        WHERE Z.KZOO' +
      '_ANIMAL_FEMEA = DAF.KZOO_ANIMAL_FEMEA'#13#10'          AND Z.DATAEVENT' +
      'O > DAF.ULTIMA_LACTACAO'#13#10'          AND Z.TIPOEVENTO <> :CIO'#13#10'   ' +
      ' ) NCOBERTURAS,'#13#10'   EZ.PRENHEZ,'#13#10'   PL.TOTAL,'#13#10'   IIF(BST.DATA >' +
      '= L.DATALACTACAO, BST.DATA, NULL) DATA_ULTBST,'#13#10'   IIF(BST.KZOO_' +
      'ANIMAL_FEMEA_BST IS NULL,'#13#10'        IIF( DAF.NUMERO_LACTACAO < 2,' +
      #13#10'             DATEADD( :INTBST_PRIM DAY TO L.DATALACTACAO ),'#13#10' ' +
      '            DATEADD( :INTBST_MULT DAY TO L.DATALACTACAO )),'#13#10'   ' +
      '     IIF( DAF.NUMERO_LACTACAO < 2,'#13#10'             DATEADD( :INTBS' +
      'T_PRIM DAY TO BST.DATA ),'#13#10'             DATEADD( :INTBST_MULT DA' +
      'Y TO BST.DATA ))'#13#10'       ) DATA_PREVISTABST'#13#10'FROM ZOO_ANIMAIS_FE' +
      'MEA DAF'#13#10'INNER JOIN ZOO_LACTACOES           L   ON L.KZOO_LACTAC' +
      'AO           = DAF.KULTIMA_LACTACAO'#13#10'INNER JOIN ZOO_PESAGEM_LEIT' +
      'E       PL  ON PL.KZOO_PESAGEM_LEITE     = L.KULTIMA_PESAGEMLEIT' +
      'E'#13#10'INNER JOIN ZOO_ANIMAIS             AF  ON AF.KZOO_ANIMAL     ' +
      '       = DAF.KZOO_ANIMAL_FEMEA'#13#10'LEFT  JOIN ZOO_EVENTOS_ZOOTECNIC' +
      'OS EZ  ON EZ.KZOO_EVENTO_ZOOTECNICO = DAF.KULTIMA_MONTA AND EZ.K' +
      'ZOO_EVENTO_ZOOTECNICO <> L.KZOO_EVENTO_ZOOTECNICO'#13#10'LEFT  JOIN ZO' +
      'O_ANIMAL_FEMEA_BST    BST ON BST.KZOO_ANIMAL_FEMEA     = DAF.KZO' +
      'O_ANIMAL_FEMEA AND BST.KZOO_LACTACAO  = DAF.KULTIMA_LACTACAO'#13#10'WH' +
      'ERE ( AF. KCAD_FAZENDA = :KCAD_FAZENDA ) --hr)\u/F@1JO!0(YZjM,/'#13 +
      #10'  AND (  AF.STATUS IS DISTINCT FROM :DESCARTADA )'#13#10'  AND ( L.DA' +
      'TA_SECAGEM IS NULL )'#13#10'  AND (    ( DAF.NUMERO_LACTACAO <= 1 AND ' +
      'L.PRODUCAO_UC >= :PROD_PRIM )'#13#10'        OR ( DAF.NUMERO_LACTACAO ' +
      '>= 2 AND L.PRODUCAO_UC >= :PROD_MULT )'#13#10'       )'#13#10'AND (     ( DA' +
      'F.NUMERO_LACTACAO <= 1 AND (( CAST( :DATA AS DATE ) - CAST( L.DA' +
      'TALACTACAO AS DATE )) >= :DPP_PRIM ))'#13#10'       OR ( DAF.NUMERO_LA' +
      'CTACAO >= 2 AND (( CAST( :DATA AS DATE ) - CAST( L.DATALACTACAO ' +
      'AS DATE )) >= :DPP_MULT ))'#13#10'     )'#13#10'  AND ( ( BST.KZOO_ANIMAL_FE' +
      'MEA_BST IS NULL )'#13#10'        OR ( ( BST.DATA = ( SELECT MAX( B.DAT' +
      'A ) FROM ZOO_ANIMAL_FEMEA_BST  B'#13#10'                           WHE' +
      'RE B.KZOO_ANIMAL_FEMEA = DAF.KZOO_ANIMAL_FEMEA AND B.KZOO_LACTAC' +
      'AO  = DAF.KULTIMA_LACTACAO)'#13#10'              )'#13#10'             AND B' +
      'ST.MOTIVO_INTERRUPCAO IS NULL'#13#10'             AND IIF( DAF.NUMERO_' +
      'LACTACAO <= 1,'#13#10'                         DATEADD( :INTBST_PRIM D' +
      'AY TO BST.DATA ),'#13#10'                         DATEADD( :INTBST_MUL' +
      'T DAY TO BST.DATA ) ) <= :DATA'#13#10'            )'#13#10'       )'#13#10'  AND (' +
      '   ( EZ.PRENHEZ IS DISTINCT FROM '#39'T'#39' )'#13#10'      OR  (    ( (DAF.NU' +
      'MERO_LACTACAO <= 1) AND (COALESCE( DATEADD( :INTBST_PRIM DAY TO ' +
      'BST.DATA ), CURRENT_TIMESTAMP )  < DATEADD ( :DIAS_ENCERRAR_BST_' +
      'PRIM DAY TO EZ.DATAEVENTO )))'#13#10'            OR ( (DAF.NUMERO_LACT' +
      'ACAO >  1) AND   (COALESCE( DATEADD( :INTBST_MULT DAY TO BST.DAT' +
      'A ), CURRENT_TIMESTAMP ) < DATEADD ( :DIAS_ENCERRAR_BST_MULT DAY' +
      ' TO EZ.DATAEVENTO )))'#13#10'          )'#13#10'      )'#13#10'ORDER BY DAF.ULTIMA' +
      '_LACTACAO'
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
        DataType = ftFixedChar
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
    Left = 306
    Top = 105
    object sqlSelectBSTKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlSelectBSTBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlSelectBSTBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlSelectBSTNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlSelectBSTLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
    object sqlSelectBSTKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Visible = False
      FixedChar = True
    end
    object sqlSelectBSTDPP: TIntegerField
      FieldName = 'DPP'
    end
    object sqlSelectBSTULTIMA_LACTACAO: TSQLTimeStampField
      FieldName = 'ULTIMA_LACTACAO'
    end
    object sqlSelectBSTNCOBERTURAS: TIntegerField
      FieldName = 'NCOBERTURAS'
    end
    object sqlSelectBSTPRENHEZ: TStringField
      FieldName = 'PRENHEZ'
      FixedChar = True
      Size = 1
    end
    object sqlSelectBSTDATA_ULTBST: TSQLTimeStampField
      FieldName = 'DATA_ULTBST'
    end
    object sqlSelectBSTDATA_PREVISTABST: TSQLTimeStampField
      FieldName = 'DATA_PREVISTABST'
    end
    object sqlSelectBSTTOTAL: TFloatField
      DisplayLabel = #218'ltima pesagem'
      FieldName = 'TOTAL'
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
    Left = 449
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
    Left = 449
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
  object cdsMotivoInterrupcaoBST: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 449
    Top = 143
    object cdsMotivoInterrupcaoBSTTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsMotivoInterrupcaoBSTVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsMotivoInterrupcaoBSTDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsMotivoInterrupcaoBSTORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
