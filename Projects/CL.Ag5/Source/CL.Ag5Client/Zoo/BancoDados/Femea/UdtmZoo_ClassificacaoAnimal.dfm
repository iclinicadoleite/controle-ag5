object dtmZoo_ClassificacaoAnimal: TdtmZoo_ClassificacaoAnimal
  OldCreateOrder = True
  Left = 488
  Top = 320
  Height = 271
  Width = 469
  object cdsClassificacao: TClientDataSet
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
    ProviderName = 'dspClassificacao'
    OnNewRecord = cdsClassificacaoNewRecord
    Left = 83
    Top = 22
    object cdsClassificacaoKZOO_ANIMAL_CLASSIFICACAO: TStringField
      FieldName = 'KZOO_ANIMAL_CLASSIFICACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsClassificacaoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsClassificacaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsClassificacaoFL_ESTATURA: TStringField
      DisplayLabel = 'Estatura'
      FieldName = 'FL_ESTATURA'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoFL_NIVELAMENTOLINHASUPERIOR: TStringField
      DisplayLabel = 'Nivelamento Linha Superior'
      FieldName = 'FL_NIVELAMENTOLINHASUPERIOR'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoFL_LARGURAPEITO: TStringField
      DisplayLabel = 'Largura de Peito'
      FieldName = 'FL_LARGURAPEITO'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoFL_PROFUNDIDADECORPORAL: TStringField
      DisplayLabel = 'Profundidade Corporal'
      FieldName = 'FL_PROFUNDIDADECORPORAL'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoFL_ANGULOSIDADE: TStringField
      DisplayLabel = 'Angulosidade'
      FieldName = 'FL_ANGULOSIDADE'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoFL_ESCORECORPORAL: TStringField
      DisplayLabel = 'Escore Corporal'
      FieldName = 'FL_ESCORECORPORAL'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoFL_PONTUACAO: TStringField
      DisplayLabel = 'Pontua'#231#227'o da Se'#231#227'o'
      FieldName = 'FL_PONTUACAO'
      EditMask = 'aaa'
      Size = 3
    end
    object cdsClassificacaoGP_ANGULOGARUPA: TStringField
      DisplayLabel = #194'ngulo de Garupa'
      FieldName = 'GP_ANGULOGARUPA'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoGP_LARGURAGARUPA: TStringField
      DisplayLabel = 'Largura de Garupa'
      FieldName = 'GP_LARGURAGARUPA'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoGP_FORCALOMBO: TStringField
      DisplayLabel = 'For'#231'a de Lombo'
      FieldName = 'GP_FORCALOMBO'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoGP_PONTUACAO: TStringField
      DisplayLabel = 'Pontua'#231#227'o da Se'#231#227'o'
      FieldName = 'GP_PONTUACAO'
      EditMask = 'aaa'
      Size = 3
    end
    object cdsClassificacaoPP_ANGULOCASCO: TStringField
      DisplayLabel = #194'ngulo de Casco'
      FieldName = 'PP_ANGULOCASCO'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoPP_PROFUNDIDADETALAO: TStringField
      DisplayLabel = 'Profundidade de Tal'#227'o'
      FieldName = 'PP_PROFUNDIDADETALAO'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoPP_QTDEOSSEA: TStringField
      DisplayLabel = 'Qualidade '#211'ssea'
      FieldName = 'PP_QTDEOSSEA'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoPP_POSTERIORVISTALATERAL: TStringField
      DisplayLabel = 'Pernas Posteriores - Vista Lateral'
      FieldName = 'PP_POSTERIORVISTALATERAL'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoPP_POSTERIORVISTAPOSTERIOR: TStringField
      DisplayLabel = 'Pernas Posteriores - Vista Posterior'
      FieldName = 'PP_POSTERIORVISTAPOSTERIOR'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoPP_PONTUACAO: TStringField
      DisplayLabel = 'Pontua'#231#227'o da Se'#231#227'o'
      FieldName = 'PP_PONTUACAO'
      EditMask = 'aaa'
      Size = 3
    end
    object cdsClassificacaoSM_PROFUNDIDADEUBERE: TStringField
      DisplayLabel = 'Profundidade de '#218'bere'
      FieldName = 'SM_PROFUNDIDADEUBERE'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoSM_TEXTURAUBERE: TStringField
      DisplayLabel = 'Textura de '#218'bere'
      FieldName = 'SM_TEXTURAUBERE'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoSM_LIGAMENTOMEDIO: TStringField
      DisplayLabel = 'Ligamento M'#233'dio'
      FieldName = 'SM_LIGAMENTOMEDIO'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoSM_INSERCAOUBEREANTERIOR: TStringField
      DisplayLabel = 'Inser'#231#227'o '#218'bere Anterior'
      FieldName = 'SM_INSERCAOUBEREANTERIOR'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoSM_COLOCACAOTETOSANTERIRORES: TStringField
      DisplayLabel = 'Coloca'#231#227'o Tetos Anteriores'
      FieldName = 'SM_COLOCACAOTETOSANTERIRORES'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoSM_ALTURAUBEREPOSTERIOR: TStringField
      DisplayLabel = 'Altura do '#218'bere Posterior'
      FieldName = 'SM_ALTURAUBEREPOSTERIOR'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoSM_LARGURAUBEREPOSTERIOR: TStringField
      DisplayLabel = 'Largura do '#218'bere Posterior'
      FieldName = 'SM_LARGURAUBEREPOSTERIOR'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoSM_COLOCACAOTETOSPOSTERIORES: TStringField
      DisplayLabel = 'Coloca'#231#227'o de Tetos Posteriores'
      FieldName = 'SM_COLOCACAOTETOSPOSTERIORES'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoSM_COMPRIMENTOTETOS: TStringField
      DisplayLabel = 'Comprimento Testos'
      FieldName = 'SM_COMPRIMENTOTETOS'
      OnValidate = OnValidate
      EditMask = '9'
      Size = 3
    end
    object cdsClassificacaoSM_PONTUACAO: TStringField
      DisplayLabel = 'Pontua'#231#227'o da Se'#231#227'o'
      FieldName = 'SM_PONTUACAO'
      EditMask = 'aaa'
      Size = 3
    end
    object cdsClassificacaoAF_DEFEITOS: TMemoField
      DisplayLabel = 'Defeitos'
      FieldName = 'AF_DEFEITOS'
      BlobType = ftMemo
      Size = 3
    end
    object cdsClassificacaoAF_PONTUACAOFINAL: TSmallintField
      DisplayLabel = 'Pontua'#231#227'o Final'
      FieldName = 'AF_PONTUACAOFINAL'
    end
    object cdsClassificacaoAF_ENQUADRAMENTOCLASSE: TStringField
      DisplayLabel = 'Enquadramento na Classe'
      FieldName = 'AF_ENQUADRAMENTOCLASSE'
      EditMask = 'aaa'
      Size = 3
    end
    object cdsClassificacaoAF_OBS: TMemoField
      DisplayLabel = 'Obs.'
      FieldName = 'AF_OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlClassificacao: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select  '#13#10' KZOO_ANIMAL_CLASSIFICACAO, '#13#10' KZOO_ANIMAL, '#13#10' DATA, '#13 +
      #10'    FL_ESTATURA,'#13#10'    FL_NIVELAMENTOLINHASUPERIOR,'#13#10'    FL_LARG' +
      'URAPEITO,'#13#10'    FL_PROFUNDIDADECORPORAL,'#13#10'    FL_ANGULOSIDADE,'#13#10' ' +
      '   FL_ESCORECORPORAL,'#13#10'    FL_PONTUACAO,'#13#10'    GP_ANGULOGARUPA,'#13#10 +
      '    GP_LARGURAGARUPA,'#13#10'    GP_FORCALOMBO,'#13#10'    GP_PONTUACAO,'#13#10'  ' +
      '  PP_ANGULOCASCO,'#13#10'    PP_PROFUNDIDADETALAO,'#13#10'    PP_QTDEOSSEA,'#13 +
      #10'    PP_POSTERIORVISTALATERAL,'#13#10'    PP_POSTERIORVISTAPOSTERIOR,'#13 +
      #10'    PP_PONTUACAO,'#13#10'    SM_PROFUNDIDADEUBERE,'#13#10'    SM_TEXTURAUBE' +
      'RE,'#13#10'    SM_LIGAMENTOMEDIO,'#13#10'    SM_INSERCAOUBEREANTERIOR,'#13#10'    ' +
      'SM_COLOCACAOTETOSANTERIRORES,'#13#10'    SM_ALTURAUBEREPOSTERIOR,'#13#10'   ' +
      ' SM_LARGURAUBEREPOSTERIOR,'#13#10'    SM_COLOCACAOTETOSPOSTERIORES,'#13#10' ' +
      '   SM_COMPRIMENTOTETOS,'#13#10'    SM_PONTUACAO,'#13#10'    AF_DEFEITOS,'#13#10'  ' +
      '  AF_PONTUACAOFINAL,'#13#10'    AF_ENQUADRAMENTOCLASSE,'#13#10'    AF_OBS'#13#10'f' +
      'rom ZOO_ANIMAL_CLASSIFICACOES'#13#10'WHERE KZOO_ANIMAL = :KZOO_ANIMAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 83
    Top = 109
    object sqlClassificacaoKZOO_ANIMAL_CLASSIFICACAO: TStringField
      FieldName = 'KZOO_ANIMAL_CLASSIFICACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlClassificacaoKZOO_ANIMAL: TStringField
      FieldName = 'KZOO_ANIMAL'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlClassificacaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sqlClassificacaoFL_ESTATURA: TStringField
      FieldName = 'FL_ESTATURA'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoFL_NIVELAMENTOLINHASUPERIOR: TStringField
      FieldName = 'FL_NIVELAMENTOLINHASUPERIOR'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoFL_LARGURAPEITO: TStringField
      FieldName = 'FL_LARGURAPEITO'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoFL_PROFUNDIDADECORPORAL: TStringField
      FieldName = 'FL_PROFUNDIDADECORPORAL'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoFL_ANGULOSIDADE: TStringField
      FieldName = 'FL_ANGULOSIDADE'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoFL_ESCORECORPORAL: TStringField
      FieldName = 'FL_ESCORECORPORAL'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoFL_PONTUACAO: TStringField
      FieldName = 'FL_PONTUACAO'
      EditMask = 'aaa'
      Size = 3
    end
    object sqlClassificacaoGP_ANGULOGARUPA: TStringField
      FieldName = 'GP_ANGULOGARUPA'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoGP_LARGURAGARUPA: TStringField
      FieldName = 'GP_LARGURAGARUPA'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoGP_FORCALOMBO: TStringField
      FieldName = 'GP_FORCALOMBO'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoGP_PONTUACAO: TStringField
      FieldName = 'GP_PONTUACAO'
      EditMask = 'aaa'
      Size = 3
    end
    object sqlClassificacaoPP_ANGULOCASCO: TStringField
      FieldName = 'PP_ANGULOCASCO'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoPP_PROFUNDIDADETALAO: TStringField
      FieldName = 'PP_PROFUNDIDADETALAO'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoPP_QTDEOSSEA: TStringField
      FieldName = 'PP_QTDEOSSEA'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoPP_POSTERIORVISTALATERAL: TStringField
      FieldName = 'PP_POSTERIORVISTALATERAL'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoPP_POSTERIORVISTAPOSTERIOR: TStringField
      FieldName = 'PP_POSTERIORVISTAPOSTERIOR'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoPP_PONTUACAO: TStringField
      FieldName = 'PP_PONTUACAO'
      EditMask = 'aaa'
      Size = 3
    end
    object sqlClassificacaoSM_PROFUNDIDADEUBERE: TStringField
      FieldName = 'SM_PROFUNDIDADEUBERE'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoSM_TEXTURAUBERE: TStringField
      FieldName = 'SM_TEXTURAUBERE'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoSM_LIGAMENTOMEDIO: TStringField
      FieldName = 'SM_LIGAMENTOMEDIO'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoSM_INSERCAOUBEREANTERIOR: TStringField
      FieldName = 'SM_INSERCAOUBEREANTERIOR'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoSM_COLOCACAOTETOSANTERIRORES: TStringField
      FieldName = 'SM_COLOCACAOTETOSANTERIRORES'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoSM_ALTURAUBEREPOSTERIOR: TStringField
      FieldName = 'SM_ALTURAUBEREPOSTERIOR'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoSM_LARGURAUBEREPOSTERIOR: TStringField
      FieldName = 'SM_LARGURAUBEREPOSTERIOR'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoSM_COLOCACAOTETOSPOSTERIORES: TStringField
      FieldName = 'SM_COLOCACAOTETOSPOSTERIORES'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoSM_COMPRIMENTOTETOS: TStringField
      FieldName = 'SM_COMPRIMENTOTETOS'
      EditMask = '9'
      Size = 3
    end
    object sqlClassificacaoSM_PONTUACAO: TStringField
      FieldName = 'SM_PONTUACAO'
      EditMask = 'aaa'
      Size = 3
    end
    object sqlClassificacaoAF_DEFEITOS: TMemoField
      FieldName = 'AF_DEFEITOS'
      BlobType = ftMemo
      Size = 3
    end
    object sqlClassificacaoAF_PONTUACAOFINAL: TSmallintField
      FieldName = 'AF_PONTUACAOFINAL'
    end
    object sqlClassificacaoAF_ENQUADRAMENTOCLASSE: TStringField
      FieldName = 'AF_ENQUADRAMENTOCLASSE'
      EditMask = 'aaa'
      Size = 3
    end
    object sqlClassificacaoAF_OBS: TMemoField
      FieldName = 'AF_OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspClassificacao: TDataSetProvider
    DataSet = sqlClassificacao
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 43
    Top = 65
  end
end
