object dtmFIN_PlanoContasEspeciais: TdtmFIN_PlanoContasEspeciais
  OldCreateOrder = False
  Height = 339
  Width = 439
  object sqlPlanoContasEspeciais: TTcSQLDataSet
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'TIPO_PLANOCONTAS_PADRAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PLANOCONTAS_PADRAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PLANOCONTAS_PADRAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_BANCOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_ESTOQUE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_FINANCIAMENTOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_LEITE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_OUTRAS_RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_IMPOSTOS_TAXAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_DEPRECIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_JUROS_FINANCIAMENTOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PLANOCONTAS_PADRAO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '         PC.KFIN_PLANOCONTA AS KFIN_PLANOCONTA_ESPECIAL'
      '       , PC.NOME'
      '       , PC.KDEF_PLANOCONTA'
      '       , PC.TIPO_PLANOCONTAS'
      '       , PC.CLASSIFICACAO'
      '       , EQPC.KFIN_PLANOCONTA'
      '       , EQPC.CODIGO AS DESCR_PC_CODIGO'
      '       , EQPC.NOME AS DESCR_PC_NOME'
      '       , EQPC.CLASSIFICACAO AS DESCR_PC_CLASSIFICACAO'
      '       , EQPC.TIPO_PLANOCONTAS AS EQV_TIPO_PLANOCONTAS'
      '       , CAST(NULL AS VARCHAR(5)) AS DESCR_PC_TIPO_APRD'
      '       , EQPC.KFIN_PLANOCONTA AS KFIN_PLANOCONTA_OLD'
      '       , EQPC.NOME AS DESCR_PC_NOME_OLD'
      '  FROM FIN_PLANOCONTAS PC'
      '  LEFT JOIN FIN_PLANOCONTAS EQPC ON'
      
        '          (PC.KFIN_PLANOCONTA = EQPC.KEQV_PLANOCONTA AND EQPC.TI' +
        'PO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0)' +
        ', 0 ), :TIPO_PLANOCONTAS_PADRAO ))'
      '          OR'
      
        '          (PC.KFIN_PLANOCONTA = EQPC.KFIN_PLANOCONTA AND EQPC.TI' +
        'PO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0)' +
        ', 0 ), :TIPO_PLANOCONTAS_PADRAO ) AND'
      
        '           COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ),' +
        ' :TIPO_PLANOCONTAS_PADRAO ) < 1 )'
      ' WHERE'
      '          ('
      '               PC.KDEF_PLANOCONTA in ('
      '                      :_DEF_BANCOS              '
      '                    , :_DEF_ESTOQUE             '
      '                    , :_DEF_FINANCIAMENTOS      '
      '                    , :_DEF_LEITE               '
      '                    , :_DEF_OUTRAS_RECEITAS     '
      '                    , :_DEF_IMPOSTOS_TAXAS      '
      '                    , :_DEF_DEPRECIACAO         '
      '                    , :_DEF_RECEITAS            '
      '                    , :_DEF_DESPESAS            '
      '                    , :_DEF_JUROS_FINANCIAMENTOS'
      '                  )'
      ''
      '           AND PC.TIPO_PLANOCONTAS = :TIPO_PLANOCONTAS_PADRAO'
      '          )'
      '  ORDER BY PC.NOME, PC.TIPO_PLANOCONTAS')
    Left = 80
    Top = 156
    object sqlPlanoContasEspeciaisKFIN_PLANOCONTA_ESPECIAL: TStringField
      FieldName = 'KFIN_PLANOCONTA_ESPECIAL'
      Required = True
      FixedChar = True
    end
    object sqlPlanoContasEspeciaisNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object sqlPlanoContasEspeciaisKDEF_PLANOCONTA: TStringField
      FieldName = 'KDEF_PLANOCONTA'
      FixedChar = True
    end
    object sqlPlanoContasEspeciaisTIPO_PLANOCONTAS: TIntegerField
      FieldName = 'TIPO_PLANOCONTAS'
      Required = True
    end
    object sqlPlanoContasEspeciaisCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Required = True
      Size = 32
    end
    object sqlPlanoContasEspeciaisKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlPlanoContasEspeciaisDESCR_PC_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DESCR_PC_CODIGO'
    end
    object sqlPlanoContasEspeciaisDESCR_PC_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'DESCR_PC_NOME'
      Size = 64
    end
    object sqlPlanoContasEspeciaisDESCR_PC_CLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      Size = 32
    end
    object sqlPlanoContasEspeciaisEQV_TIPO_PLANOCONTAS: TIntegerField
      FieldName = 'EQV_TIPO_PLANOCONTAS'
    end
    object sqlPlanoContasEspeciaisDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      Size = 5
    end
    object sqlPlanoContasEspeciaisKFIN_PLANOCONTA_OLD: TStringField
      FieldName = 'KFIN_PLANOCONTA_OLD'
      FixedChar = True
    end
    object sqlPlanoContasEspeciaisDESCR_PC_NOME_OLD: TStringField
      FieldName = 'DESCR_PC_NOME_OLD'
      Size = 64
    end
  end
  object dspPlanoContasEspeciais: TDataSetProvider
    DataSet = sqlPlanoContasEspeciais
    Left = 56
    Top = 104
  end
  object cdsPlanoContasEspeciais: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KFIN_PLANOCONTA_ESPECIAL'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'KDEF_PLANOCONTA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TIPO_PLANOCONTAS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CLASSIFICACAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 32
      end
      item
        Name = 'KFIN_PLANOCONTA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCR_PC_CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'DESCR_PC_NOME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'DESCR_PC_CLASSIFICACAO'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'EQV_TIPO_PLANOCONTAS'
        DataType = ftInteger
      end
      item
        Name = 'DESCR_PC_TIPO_APRD'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'KFIN_PLANOCONTA_OLD'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCR_PC_NOME_OLD'
        DataType = ftString
        Size = 64
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'TIPO_PLANOCONTAS_PADRAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PLANOCONTAS_PADRAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PLANOCONTAS_PADRAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_BANCOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_ESTOQUE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_FINANCIAMENTOS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_LEITE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_OUTRAS_RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_IMPOSTOS_TAXAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_DEPRECIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = '_DEF_JUROS_FINANCIAMENTOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_PLANOCONTAS_PADRAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPlanoContasEspeciais'
    StoreDefs = True
    BeforePost = cdsPlanoContasEspeciaisBeforePost
    Left = 84
    Top = 40
    object cdsPlanoContasEspeciaisKFIN_PLANOCONTA_ESPECIAL: TStringField
      FieldName = 'KFIN_PLANOCONTA_ESPECIAL'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsPlanoContasEspeciaisNOME: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object cdsPlanoContasEspeciaisKDEF_PLANOCONTA: TStringField
      FieldName = 'KDEF_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object cdsPlanoContasEspeciaisTIPO_PLANOCONTAS: TIntegerField
      FieldName = 'TIPO_PLANOCONTAS'
      Required = True
      Visible = False
    end
    object cdsPlanoContasEspeciaisCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Required = True
      Visible = False
      Size = 32
    end
    object cdsPlanoContasEspeciaisKFIN_PLANOCONTA: TStringField
      FieldName = 'KFIN_PLANOCONTA'
      Visible = False
      FixedChar = True
    end
    object cdsPlanoContasEspeciaisDESCR_PC_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DESCR_PC_CODIGO'
    end
    object cdsPlanoContasEspeciaisDESCR_PC_NOME: TStringField
      DisplayLabel = 'Equivalente'
      FieldName = 'DESCR_PC_NOME'
      Size = 64
    end
    object cdsPlanoContasEspeciaisDESCR_PC_CLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      Size = 32
    end
    object cdsPlanoContasEspeciaisEQV_TIPO_PLANOCONTAS: TIntegerField
      FieldName = 'EQV_TIPO_PLANOCONTAS'
      Visible = False
    end
    object cdsPlanoContasEspeciaisDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      Visible = False
      Size = 5
    end
    object cdsPlanoContasEspeciaisKFIN_PLANOCONTA_OLD: TStringField
      FieldName = 'KFIN_PLANOCONTA_OLD'
      FixedChar = True
    end
    object cdsPlanoContasEspeciaisDESCR_PC_NOME_OLD: TStringField
      FieldName = 'DESCR_PC_NOME_OLD'
      Size = 64
    end
  end
end
