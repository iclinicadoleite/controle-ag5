object dtmZoo_GraficoLactacaoAnimal: TdtmZoo_GraficoLactacaoAnimal
  OldCreateOrder = True
  Height = 556
  Width = 1319
  object cdsLactacoes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KZOO_ANIMAL_FEMEA'
    MasterFields = 'KZOO_ANIMAL_FEMEA'
    MasterSource = dtsDadosAnimal
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspLactacoes'
    Left = 183
    Top = 52
    object cdsLactacoesKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object cdsLactacoesKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object cdsLactacoesNL: TIntegerField
      FieldName = 'NL'
    end
    object cdsLactacoesINICIO: TSQLTimeStampField
      FieldName = 'INICIO'
      Required = True
    end
    object cdsLactacoesFIM: TSQLTimeStampField
      FieldName = 'FIM'
    end
  end
  object dspLactacoes: TDataSetProvider
    DataSet = sqlLactacoes
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 165
    Top = 97
  end
  object sqlLactacoes: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  KZOO_LACTACAO, '#13#10'  KZOO_ANIMAL_FEMEA,'#13#10' NL, '#13#10' DATALA' +
      'CTACAO INICIO,'#13#10' DATA_SECAGEM FIM'#13#10'FROM ZOO_LACTACOES'#13#10'WHERE KZO' +
      'O_ANIMAL_FEMEA = :KZOO_ANIMAL'#13#10'ORDER BY NL DESC'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 179
    Top = 148
    object sqlLactacoesKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlLactacoesKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object sqlLactacoesNL: TIntegerField
      FieldName = 'NL'
    end
    object sqlLactacoesINICIO: TSQLTimeStampField
      FieldName = 'INICIO'
      Required = True
    end
    object sqlLactacoesFIM: TSQLTimeStampField
      FieldName = 'FIM'
    end
  end
  object sqlPesagensLactacao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' P.KZOO_LACTACAO,'#13#10' P.DEL,'#13#10' P.DATA,'#13#10' P.TOTAL'#13#10'FROM ZO' +
      'O_PESAGEM_LEITE P'#13#10'LEFT JOIN ZOO_LOTEPESAGEM_LEITE LP ON LP.KZOO' +
      '_LOTEPESAGEM_LEITE = P.KZOO_LOTEPESAGEM_LEITE'#13#10'WHERE  KZOO_LACTA' +
      'CAO = :KZOO_LACTACAO AND ( LP.KZOO_LOTEPESAGEM_LEITE IS NULL OR ' +
      'LP.PROCESSADO = '#39'T'#39' )'#13#10'ORDER BY P.DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LACTACAO'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 290
    Top = 145
    object sqlPesagensLactacaoKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object sqlPesagensLactacaoDEL: TIntegerField
      FieldName = 'DEL'
    end
    object sqlPesagensLactacaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlPesagensLactacaoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object cdsPesagensLactacao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LACTACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesagensLactacao'
    Left = 290
    Top = 53
    object cdsPesagensLactacaoKZOO_LACTACAO: TStringField
      FieldName = 'KZOO_LACTACAO'
      Required = True
      FixedChar = True
    end
    object cdsPesagensLactacaoDEL: TIntegerField
      FieldName = 'DEL'
    end
    object cdsPesagensLactacaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsPesagensLactacaoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object dtsLactacoes: TDataSource
    DataSet = cdsLactacoes
    Left = 264
    Top = 8
  end
  object dspPesagensLactacao: TDataSetProvider
    DataSet = sqlPesagensLactacao
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 99
  end
  object cdsAnalisesLactacao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LACTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnalisesLactacao'
    OnCalcFields = cdsCalcFields
    Left = 423
    Top = 52
    object cdsAnalisesLactacaoDEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DEL'
    end
    object cdsAnalisesLactacaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object cdsAnalisesLactacaoGORDURA: TFloatField
      FieldName = 'GORDURA'
    end
    object cdsAnalisesLactacaoPROTEINA: TFloatField
      FieldName = 'PROTEINA'
    end
    object cdsAnalisesLactacaoUREIA: TFloatField
      FieldName = 'UREIA'
    end
    object cdsAnalisesLactacaoCCS: TIntegerField
      FieldName = 'CCS'
    end
  end
  object cdsCrescimentoPeso: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspCrescimentoPeso'
    OnCalcFields = cdsCalcFields
    Left = 670
    Top = 256
    object cdsCrescimentoPesoDEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DEL'
    end
    object cdsCrescimentoPesoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsCrescimentoPesoPESO: TIntegerField
      FieldName = 'PESO'
    end
  end
  object cdsReprodutivo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspReprodutivo'
    OnCalcFields = cdsCalcFields
    Left = 774
    Top = 256
    object cdsReprodutivoDEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DEL'
    end
    object cdsReprodutivoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsReprodutivoREPRODUCAO: TIntegerField
      FieldName = 'REPRODUCAO'
      Required = True
    end
    object cdsReprodutivoEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 255
    end
  end
  object cdsSanidadeDiagnosticos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspSanidadeDiagnosticos'
    OnCalcFields = cdsCalcFields
    Left = 1045
    Top = 255
    object cdsSanidadeDiagnosticosDEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DEL'
    end
    object cdsSanidadeDiagnosticosDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsSanidadeDiagnosticosOCORRENCIA: TIntegerField
      FieldName = 'OCORRENCIA'
      Required = True
    end
    object cdsSanidadeDiagnosticosDIAGNOSTICO: TStringField
      FieldName = 'DIAGNOSTICO'
      Required = True
      Size = 163
    end
  end
  object cdsSanidadeCondicaoCorporal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspSanidadeCondicaoCorporal'
    OnCalcFields = cdsCalcFields
    Left = 891
    Top = 255
    object cdsSanidadeCondicaoCorporalDEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DEL'
    end
    object cdsSanidadeCondicaoCorporalDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsSanidadeCondicaoCorporalCC: TFloatField
      FieldName = 'CC'
    end
  end
  object dspCrescimentoPeso: TDataSetProvider
    DataSet = sqlCrescimentoPeso
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 656
    Top = 302
  end
  object dspAnalisesLactacao: TDataSetProvider
    DataSet = sqlAnalisesLactacao
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 98
  end
  object dspReprodutivo: TDataSetProvider
    DataSet = sqlReprodutivo
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 752
    Top = 302
  end
  object dspSanidadeDiagnosticos: TDataSetProvider
    DataSet = sqlSanidadeDiagnosticos
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 1027
    Top = 301
  end
  object dspSanidadeCondicaoCorporal: TDataSetProvider
    DataSet = sqlSanidadeCondicaoCorporal
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 877
    Top = 301
  end
  object sqlAnalisesLactacao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select '#13#10'  A.DATA, '#13#10'  A.GORDURA, '#13#10'  A.PROTEINA, '#13#10'  A.UREIA, '#13 +
      #10'  A.CCS '#13#10'from ZOO_PESAGEM_LEITE_ANALISE A'#13#10'WHERE '#13#10'        A.K' +
      'ZOO_LACTACAO         = :KZOO_LACTACAO'#13#10'AND A.KZOO_ANIMAL_FEMEA =' +
      ' :KZOO_ANIMAL_FEMEA '#13#10'AND A.DATA BETWEEN :DATAINICIO AND :DATAFI' +
      'M'#13#10'ORDER BY A.DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_LACTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 423
    Top = 144
    object sqlAnalisesLactacaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlAnalisesLactacaoGORDURA: TFloatField
      FieldName = 'GORDURA'
    end
    object sqlAnalisesLactacaoPROTEINA: TFloatField
      FieldName = 'PROTEINA'
    end
    object sqlAnalisesLactacaoUREIA: TFloatField
      FieldName = 'UREIA'
    end
    object sqlAnalisesLactacaoCCS: TIntegerField
      FieldName = 'CCS'
    end
  end
  object sqlCrescimentoPeso: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  DATA, '#13#10'  PESO '#13#10'FROM ZOO_ANIMAL_CRESCIMENTO '#13#10'WHERE ' +
      #13#10'        KZOO_ANIMAL = :KZOO_ANIMAL_FEMEA '#13#10'AND DATA BETWEEN :D' +
      'ATAINICIO AND :DATAFIM'#13#10'AND PESO IS NOT NULL '#13#10'AND PESO > 0'#13#10'ORD' +
      'ER BY DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 670
    Top = 348
    object sqlCrescimentoPesoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlCrescimentoPesoPESO: TIntegerField
      FieldName = 'PESO'
    end
  end
  object sqlReprodutivo: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  DATAEVENTO DATA, '#13#10' 1 REPRODUCAO, '#13#10' (SELECT SYS$DESC' +
      'RIPTION FROM SYS$TYPES_GETDESCRIPTION ( '#39'TIPO_EVENTO_ZOO'#39',  TIPO' +
      'EVENTO )) EVENTO'#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS '#13#10'WHERE '#13#10'       ' +
      '      KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA '#13#10'     AND DATAEVEN' +
      'TO BETWEEN :DATAINICIO AND :DATAFIM'#13#10'ORDER BY DATAEVENTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 774
    Top = 348
    object sqlReprodutivoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlReprodutivoREPRODUCAO: TIntegerField
      FieldName = 'REPRODUCAO'
      Required = True
    end
    object sqlReprodutivoEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 255
    end
  end
  object sqlSanidadeDiagnosticos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  DATA, '#13#10'  1 OCORRENCIA,'#13#10'  COALESCE ( CODIGO || '#39' - '#39 +
      ', '#39#39' ) || COALESCE ( NOME, '#39#39' ) DIAGNOSTICO '#13#10'FROM  ZOO_ANIMAL_D' +
      'IAGNOSTICOS '#13#10'WHERE '#13#10'           KZOO_ANIMAL_FEMEA = :KZOO_ANIMA' +
      'L_FEMEA '#13#10'  AND DATA BETWEEN :DATAINICIO AND :DATAFIM'#13#10'ORDER BY ' +
      'DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 1045
    Top = 347
    object sqlSanidadeDiagnosticosDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlSanidadeDiagnosticosOCORRENCIA: TIntegerField
      FieldName = 'OCORRENCIA'
      Required = True
    end
    object sqlSanidadeDiagnosticosDIAGNOSTICO: TStringField
      FieldName = 'DIAGNOSTICO'
      Required = True
      Size = 163
    end
  end
  object sqlSanidadeCondicaoCorporal: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'   DATA, '#13#10'   CC               '#13#10'FROM ZOO_ANIMAL_FEMEA_' +
      'CC '#13#10'WHERE '#13#10'          KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA '#13#10 +
      '  AND DATA BETWEEN :DATAINICIO AND :DATAFIM'#13#10'ORDER BY DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 891
    Top = 347
    object sqlSanidadeCondicaoCorporalDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlSanidadeCondicaoCorporalCC: TFloatField
      FieldName = 'CC'
    end
  end
  object cdsCrescimentoAltura: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspCrescimentoAltura'
    OnCalcFields = cdsCalcFields
    Left = 557
    Top = 255
    object cdsCrescimentoAlturaDEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DEL'
    end
    object cdsCrescimentoAlturaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsCrescimentoAlturaALTURA: TIntegerField
      FieldName = 'ALTURA'
    end
  end
  object dspCrescimentoAltura: TDataSetProvider
    DataSet = sqlCrescimentoAltura
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 545
    Top = 301
  end
  object sqlCrescimentoAltura: TTcSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  DATA, '#13#10'  ALTURA '#13#10'FROM ZOO_ANIMAL_CRESCIMENTO '#13#10'WHER' +
      'E '#13#10'        KZOO_ANIMAL = :KZOO_ANIMAL_FEMEA '#13#10'AND DATA BETWEEN ' +
      ':DATAINICIO AND :DATAFIM'#13#10'AND ALTURA IS NOT NULL '#13#10'AND ALTURA > ' +
      '0'#13#10'ORDER BY DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 557
    Top = 347
    object sqlCrescimentoAlturaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlCrescimentoAlturaALTURA: TIntegerField
      FieldName = 'ALTURA'
    end
  end
  object sqlBST: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DATA, 1 BST '#13#10'FROM ZOO_ANIMAL_FEMEA_BST '#13#10'WHERE '#13#10'       ' +
      ' KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA '#13#10'AND DATA BETWEEN :DATA' +
      'INICIO AND :DATAFIM'#13#10'ORDER BY DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 331
    Top = 345
    object sqlBSTDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlBSTBST: TIntegerField
      FieldName = 'BST'
      Required = True
    end
  end
  object dspBST: TDataSetProvider
    DataSet = sqlBST
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 315
    Top = 299
  end
  object cdsBST: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspBST'
    OnCalcFields = cdsCalcFields
    Left = 331
    Top = 253
    object cdsBSTDEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DEL'
    end
    object cdsBSTDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsBSTBST: TIntegerField
      FieldName = 'BST'
      Required = True
    end
  end
  object cdsDadosAnimal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDadosAnimal'
    Left = 41
    Top = 40
    object cdsDadosAnimalKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object cdsDadosAnimalNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object cdsDadosAnimalPRIMEIRA_LACTACAO: TSQLTimeStampField
      FieldName = 'PRIMEIRA_LACTACAO'
    end
    object cdsDadosAnimalDATADESCARTE: TSQLTimeStampField
      FieldName = 'DATADESCARTE'
    end
  end
  object dspDadosAnimal: TDataSetProvider
    DataSet = sqlDadosAnimal
    Left = 17
    Top = 84
  end
  object sqlDadosAnimal: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select '#13#10' F.KZOO_ANIMAL_FEMEA,'#13#10' F.NASCIMENTO,'#13#10' F.PRIMEIRA_LACT' +
      'ACAO,'#13#10' D.DATA DATADESCARTE'#13#10'from ZOO_ANIMAIS_FEMEA F'#13#10'LEFT JOIN' +
      '  ZOO_ANIMAL_DESCARTES D ON D.KZOO_ANIMAL =  F.KZOO_ANIMAL_FEMEA' +
      #13#10'WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 45
    Top = 132
    object sqlDadosAnimalKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlDadosAnimalNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object sqlDadosAnimalPRIMEIRA_LACTACAO: TSQLTimeStampField
      FieldName = 'PRIMEIRA_LACTACAO'
    end
    object sqlDadosAnimalDATADESCARTE: TSQLTimeStampField
      FieldName = 'DATADESCARTE'
    end
  end
  object dtsDadosAnimal: TDataSource
    DataSet = cdsDadosAnimal
    Left = 96
    Top = 16
  end
  object cdsTrocaLote: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspTrocaLote'
    OnCalcFields = cdsCalcFields
    Left = 440
    Top = 254
    object cdsTrocaLoteDEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DEL'
    end
    object cdsTrocaLoteDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsTrocaLoteOCORRENCIA: TIntegerField
      FieldName = 'OCORRENCIA'
      Required = True
    end
    object cdsTrocaLoteANTERIOR: TStringField
      FieldName = 'ANTERIOR'
      FixedChar = True
      Size = 32
    end
    object cdsTrocaLoteLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object dspTrocaLote: TDataSetProvider
    DataSet = sqlTrocaLote
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 424
    Top = 301
  end
  object sqlTrocaLote: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10'  DATA, '#13#10'  1 OCORRENCIA, '#13#10'  ANTERIOR,'#13#10'  LOTE'#13#10'FROM Z' +
      'OO_ANIMAL_LOTES '#13#10'WHERE KZOO_ANIMAL = :KZOO_ANIMAL_FEMEA '#13#10'  AND' +
      ' DATA BETWEEN :DATAINICIO AND :DATAFIM'#13#10'ORDER BY DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 436
    Top = 347
    object sqlTrocaLoteDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlTrocaLoteOCORRENCIA: TIntegerField
      FieldName = 'OCORRENCIA'
      Required = True
    end
    object sqlTrocaLoteANTERIOR: TStringField
      FieldName = 'ANTERIOR'
      FixedChar = True
      Size = 32
    end
    object sqlTrocaLoteLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 32
    end
  end
  object sqlPesagensPeriodo: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' DATA, '#13#10' TOTAL'#13#10'FROM ZOO_PESAGEM_LEITE'#13#10'WHERE  KZOO_AN' +
      'IMAL_FEMEA = :KZOO_ANIMAL'#13#10'AND DATA BETWEEN :DATAINICIO AND :DAT' +
      'AFIM'#13#10'AND ANIMAL_DOENTE = '#39'F'#39#13#10'ORDER BY DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 74
    Top = 349
    object sqlPesagensPeriodoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlPesagensPeriodoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object dspPesagensPeriodo: TDataSetProvider
    DataSet = sqlPesagensPeriodo
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 304
  end
  object cdsPesagensPeriodo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesagensPeriodo'
    OnCalcFields = cdsCalcFields
    Left = 92
    Top = 252
    object cdsPesagensPeriodoDEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DEL'
    end
    object cdsPesagensPeriodoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsPesagensPeriodoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object cdsAnalisesPeriodo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnalisesPeriodo'
    OnCalcFields = cdsCalcFields
    Left = 215
    Top = 260
    object cdsAnalisesPeriodoDEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DEL'
    end
    object cdsAnalisesPeriodoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object cdsAnalisesPeriodoGORDURA: TFloatField
      FieldName = 'GORDURA'
    end
    object cdsAnalisesPeriodoPROTEINA: TFloatField
      FieldName = 'PROTEINA'
    end
    object cdsAnalisesPeriodoUREIA: TFloatField
      FieldName = 'UREIA'
    end
    object cdsAnalisesPeriodoCCS: TIntegerField
      FieldName = 'CCS'
    end
  end
  object dspAnalisesPeriodo: TDataSetProvider
    DataSet = sqlAnalisesPeriodo
    Options = [poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 306
  end
  object sqlAnalisesPeriodo: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select A.DATA, A.GORDURA, A.PROTEINA, A.UREIA, A.CCS from ZOO_PE' +
      'SAGEM_LEITE_ANALISE A'#13#10'WHERE A.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_' +
      'FEMEA AND A.DATA BETWEEN :DATAINICIO AND :DATAFIM'#13#10'ORDER BY A.DA' +
      'TA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 215
    Top = 352
    object sqlAnalisesPeriodoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlAnalisesPeriodoGORDURA: TFloatField
      FieldName = 'GORDURA'
    end
    object sqlAnalisesPeriodoPROTEINA: TFloatField
      FieldName = 'PROTEINA'
    end
    object sqlAnalisesPeriodoUREIA: TFloatField
      FieldName = 'UREIA'
    end
    object sqlAnalisesPeriodoCCS: TIntegerField
      FieldName = 'CCS'
    end
  end
end
