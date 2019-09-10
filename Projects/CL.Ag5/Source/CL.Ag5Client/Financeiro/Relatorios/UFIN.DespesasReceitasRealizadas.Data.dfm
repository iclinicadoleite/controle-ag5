object dtmFin_DespesasReceitasRealizadas: TdtmFin_DespesasReceitasRealizadas
  OldCreateOrder = True
  OnDestroy = _dtmBASEDestroy
  Height = 238
  Width = 469
  object cdsDespesasReceitas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_JUROS_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_JUROS_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_IMPOSTOS_TAXAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDespesasReceitas'
    Left = 88
    Top = 19
    object cdsDespesasReceitasDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 3
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsDespesasReceitasDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Visible = False
      Size = 33
    end
    object cdsDespesasReceitasDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data lan'#231'amento'
      DisplayWidth = 6
      FieldName = 'DATALANCTO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDespesasReceitasHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 14
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsDespesasReceitasCODIGO: TStringField
      DisplayLabel = 'C'#243'digo fornecedor'
      DisplayWidth = 13
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsDespesasReceitasNOME: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 54
      FieldName = 'NOME'
      Size = 128
    end
    object cdsDespesasReceitasCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 18
    end
    object cdsDespesasReceitasCONTACONTABIL: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      DisplayWidth = 6
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object cdsDespesasReceitasCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de custo'
      DisplayWidth = 6
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
    object cdsDespesasReceitasPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      DisplayWidth = 4
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '0 %'
    end
    object cdsDespesasReceitasQTDE: TFloatField
      DisplayLabel = 'Qtde'
      DisplayWidth = 4
      FieldName = 'QTDE'
      DisplayFormat = '#,0.00'
    end
    object cdsDespesasReceitasDESPESA: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 1
      FieldName = 'DESPESA'
      DisplayFormat = '#,0.00'
    end
    object cdsDespesasReceitasRECEITA: TFloatField
      FieldName = 'RECEITA'
    end
    object cdsDespesasReceitasTOTAL_DESPESAS: TAggregateField
      FieldName = 'TOTAL_DESPESAS'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(DESPESA)'
    end
    object cdsDespesasReceitasTOTAL_RECEITAS: TAggregateField
      FieldName = 'TOTAL_RECEITAS'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(RECEITA)'
    end
  end
  object dspDespesasReceitas: TDataSetProvider
    DataSet = sqlDespesasReceitas
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 43
    Top = 59
  end
  object sqlDespesasReceitas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    OnCalcFields = sqlDespesasReceitasCalcFields
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_JUROS_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_JUROS_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_IMPOSTOS_TAXAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_FORNECEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'RECEITAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODOS_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOPC'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSIFICACAO'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT -- despesas realiadas'
      '  A.KCAD_ENTIDADE'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      
        ', IIF ( A.RECORRENCIA = '#39'F'#39', A.DATALANCTO, PA.VENCTO ) DATALANCT' +
        'O'
      ', A.HISTORICO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', AP.PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      
        ', (COALESCE( AP.PORCENTAGEM, 100 ) * IIF ( A.RECORRENCIA = '#39'F'#39', ' +
        'A.VALOR, PA.VALOR  ) / 100) DESPESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM FIN_APAGAR A'
      'LEFT JOIN ( SELECT P.KFIN_APAGAR, P.VENCTO, P.VALOR'
      '              FROM FIN_APAGAR_PARCELAS P'
      '              JOIN FIN_APAGAR C ON C.KFIN_APAGAR = P.KFIN_APAGAR'
      '              WHERE C.RECORRENCIA = '#39'T'#39
      '               AND P.VENCTO BETWEEN :DI AND :DF'
      '           ) PA ON PA.KFIN_APAGAR = A.KFIN_APAGAR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = A.KFIN_PL' +
        'ANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_APAGAR'#39'   AND AP.TABLEKEY =  A.KFIN_APAGAR'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      
        'LEFT JOIN CMP_PEDIDOS CMP ON A.TABLENAME = '#39'CMP_PEDIDOS'#39' AND CMP' +
        '.KCMP_PEDIDO = A.TABLEKEY'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( A.TABLENAME IS NULL '
      '             OR (         A.TABLENAME = '#39'CMP_PEDIDOS'#39
      '                     AND A.SYS$ORIGIN_TYPE = 2 '
      '                     AND A.KFIN_APAGAR <> CMP.KFIN_APAGAR'
      
        '                     AND (( A.RECORRENCIA = '#39'F'#39' AND A.VALOR IS N' +
        'OT NULL ) OR ( A.RECORRENCIA = '#39'T'#39' AND PA.VALOR IS NOT NULL ))  ' +
        '                  '
      
        '                     AND A.HISTORICO NOT CONTAINING '#39'Nota fiscal' +
        ' de compra'#39
      
        '                     AND A.HISTORICO NOT CONTAINING '#39'DUPLICATA D' +
        'E NOTA FISCAL'#39
      
        '                     AND A.HISTORICO NOT CONTAINING '#39'JUROS DE NO' +
        'TA FISCAL'#39
      '                ) '
      '          )'
      
        '  AND ( IIF( A.RECORRENCIA = '#39'F'#39', A.DATALANCTO, PA.VENCTO ) BETW' +
        'EEN :DI AND :DF )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT '
      '  A.KCAD_ENTIDADE'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', P.PAGTO'
      ', '#39'Juros '#39' || A.HISTORICO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      
        ', (COALESCE(  AP.PORCENTAGEM, 100 ) * ABS( P.JURO_DESCONTO ) / 1' +
        '00) DESPESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM FIN_APAGAR_PARCELAS P'
      'INNER JOIN FIN_APAGAR A ON A.KFIN_APAGAR = P.KFIN_APAGAR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = P.KFIN_PL' +
        'ANOCONTA_JURO_DESCONTO'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_APAGAR_PARCELAS'#39' AND AP.TABLEKEY =  P.KFIN_APAGA' +
        'R_PARCELA'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      '  AND ( P.KFIN_PLANOCONTA_JURO_DESCONTO = :PLANOCONTA_DESPESAS )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( P.PAGTO BETWEEN :DI AND :DF )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      '   AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT '
      '  A.KCAD_ENTIDADE'
      ', F.DOCUMENTO'
      ', F.DOCUMENTO_'
      ', P.PAGTO'
      ', '#39'Juros '#39' || A.HISTORICO'
      ', C.CODIGO'
      ', COALESCE( C.NOME, F.NOMEENTIDADE ) NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      
        ', (COALESCE(  AP.PORCENTAGEM, 100 ) * ABS( P.JURO_DESCONTO ) / 1' +
        '00) DESPESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM FIN_FINANCIAMENTOS F'
      
        'INNER JOIN FIN_APAGAR A ON  A.KFIN_APAGAR = F.KFIN_APAGAR_AMORTI' +
        'ZACAO'
      'LEFT JOIN FIN_APAGAR_PARCELAS P ON P.KFIN_APAGAR = A.KFIN_APAGAR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = F.KFIN_PL' +
        'ANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_FINANCIAMENTOS'#39' AND AP.TABLEKEY =  F.KFIN_FINANC' +
        'IAMENTO'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( P.PAGTO BETWEEN :DI AND :DF )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      
        ' AND (        (  :TIPOPC = 0 AND ( PC.KFIN_PLANOCONTA = :PLANOCO' +
        'NTA_JUROS_FINANCIAMENTO ) )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT '
      '  A.KCAD_ENTIDADE'
      ', F.DOCUMENTO'
      ', F.DOCUMENTO_'
      ', P.PAGTO'
      ', '#39'Amortiza'#231#227'o '#39' || A.HISTORICO'
      ', C.CODIGO'
      ', COALESCE( C.NOME, F.NOMEENTIDADE ) NOME'
      ', PC.NOME CONTACONTABIL'
      ', CAST(NULL AS FIN$DESCPLANCONTAS) "CENTROCUSTO"'
      ', CAST(NULL AS DOUBLE PRECISION ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', ABS( P.VALOR ) DESPESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM FIN_FINANCIAMENTOS F'
      
        'INNER JOIN FIN_APAGAR A ON  A.KFIN_APAGAR = F.KFIN_APAGAR_AMORTI' +
        'ZACAO'
      'LEFT JOIN FIN_APAGAR_PARCELAS P ON P.KFIN_APAGAR = A.KFIN_APAGAR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = :PLANOCON' +
        'TA_FINANCIAMENTO --F.KFIN_PLANOCONTA'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '       ( :DESPESAS = '#39'T'#39' )'
      
        '  AND  ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :' +
        'KCAD_FORNECEDOR ) )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( P.PAGTO BETWEEN :DI AND :DF )'
      '  AND ( P.VALOR > 0.00 )'
      '  AND (  (  :TIPOCC = 0 )   OR  (  :TIPOCC = 1 ) )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '      )'
      'UNION ALL'
      'SELECT '
      '  A.KCAD_ENTIDADE'
      ', F.DOCUMENTO'
      ', F.DOCUMENTO_'
      ', P.PAGTO'
      ', '#39'Despesas '#39' || A.HISTORICO'
      ', C.CODIGO'
      ', COALESCE( C.NOME, F.NOMEENTIDADE ) NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      
        ', (COALESCE(  AP.PORCENTAGEM, 100 ) * ABS( P.VALOR ) / 100) DESP' +
        'ESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM FIN_FINANCIAMENTOS F'
      
        'INNER JOIN FIN_APAGAR A ON A.KFIN_APAGAR = F.KFIN_APAGAR_DESPESA' +
        'S'
      
        'LEFT JOIN  FIN_APAGAR_PARCELAS P ON P.KFIN_APAGAR = A.KFIN_APAGA' +
        'R'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = :PLANOCON' +
        'TA_DESPESAS --F.KFIN_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_FINANCIAMENTOS'#39' AND AP.TABLEKEY =  F.KFIN_FINANC' +
        'IAMENTO'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( P.PAGTO BETWEEN :DI AND :DF )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      ' AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT '
      '  A.KCAD_ENTIDADE'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', P.VENCTO'
      ', '#39'Juros '#39' || A.HISTORICO HISTORICO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      
        ', (COALESCE(  AP.PORCENTAGEM, 100 ) * ABS( FP.JUROS ) / 100) DES' +
        'PESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM FIN_APAGAR_PARCELAS P'
      'INNER JOIN FIN_APAGAR A ON A.KFIN_APAGAR = P.KFIN_APAGAR'
      
        'INNER JOIN FIN_FINANCIAMENTOS_PARCELAS FP ON P.KFIN_APAGAR_PARCE' +
        'LA = FP.KFIN_APAGAR_PARCELA'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  =  :PLANOCO' +
        'NTA_JUROS_FINANCIAMENTO'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_APAGAR'#39' AND AP.TABLEKEY =  A.KFIN_APAGAR'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      
        '  AND (  (:TIPOPC = 0 ) OR (  (  :TIPOPC = 1 ) AND (  PC.KFIN_PL' +
        'ANOCONTA = :PLANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO )' +
        ' ) )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( FP.JUROS > 0 )'
      '  AND ( P.VENCTO BETWEEN :DI AND :DF )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      'UNION ALL'
      'SELECT '
      '  A.KCAD_ENTIDADE'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', P.VENCTO'
      ', '#39'Amortiza'#231#227'o '#39' || A.HISTORICO HISTORICO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CAST(NULL AS VARCHAR(64)) "CENTROCUSTO"'
      ', CAST( 100 AS FLOAT ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', ABS( FP.AMORTIZACAO ) DESPESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM FIN_APAGAR_PARCELAS P'
      
        'INNER JOIN FIN_FINANCIAMENTOS_PARCELAS FP ON P.KFIN_APAGAR_PARCE' +
        'LA = FP.KFIN_APAGAR_PARCELA'
      'INNER JOIN FIN_APAGAR A ON A.KFIN_APAGAR = P.KFIN_APAGAR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  =  :PLANOCO' +
        'NTA_FINANCIAMENTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      
        '  AND ( ( :TIPOPC = 0 ) OR  ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PL' +
        'ANOCONTA = :PLANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO )' +
        ' ) )'
      '  AND (  (  :TIPOCC = 0 )   OR  (  :TIPOCC = 1 ) )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.TABLENAME = '#39'FIN_FINANCIAMENTOS_GERAL'#39' )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( FP.AMORTIZACAO > 0 )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( P.VENCTO BETWEEN :DI AND :DF )'
      'UNION ALL'
      'SELECT'
      '  R.KCAD_ENTIDADE'
      ', R.DOCUMENTO'
      ', R.DOCUMENTO_'
      ', P.PAGTO'
      ', '#39'Desconto '#39' || R.HISTORICO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      
        ', (COALESCE(  AP.PORCENTAGEM, 100 ) * ABS( P.JURO_DESCONTO ) / 1' +
        '00) DESPESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM FIN_ARECEBER_PARCELAS P'
      'INNER JOIN FIN_ARECEBER R ON R.KFIN_ARECEBER = P.KFIN_ARECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = P.KFIN_PL' +
        'ANOCONTA_JURO_DESCONTO'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_ARECEBER_PARCELAS'#39' AND AP.TABLEKEY =  P.KFIN_ARE' +
        'CEBER_PARCELA'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = R.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      
        '  AND (  :TIPOPC = 0 ) AND ( P.KFIN_PLANOCONTA_JURO_DESCONTO = :' +
        'PLANOCONTA_DESPESAS )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( R.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( R.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( R.ATIVO = '#39'T'#39' )'
      '  AND ( P.PAGTO BETWEEN :DI AND :DF )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  CMP.KCAD_ENTIDADE'
      ', '#39'NF COMPRA ('#39' || CMP.NOTA_FISCAL || '#39')'#39
      ', '#39'NF COMPRA ('#39' || CMP.NOTA_FISCAL_ || '#39')'#39
      ', CMP.DATA_COMPRA'
      ', COALESCE ( P.NOME, CMPI.NOME )'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', (COALESCE( AP.PORCENTAGEM, 100 ) * CMPI.QTDE   / 100 ) QTDE'
      ', (COALESCE( AP.PORCENTAGEM, 100 ) * CMPI.TOTAL / 100 ) DESPESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM CMP_PEDIDOS CMP'
      
        'LEFT JOIN CMP_PEDIDO_ITENS CMPI ON CMPI.KCMP_PEDIDO = CMP.KCMP_P' +
        'EDIDO'
      
        'LEFT JOIN EST_PRODUTOS P ON P.KEST_PRODUTO = (SELECT * FROM EST_' +
        'GET_PRODUTO_JUNCTION( CMPI.KEST_PRODUTO ))'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = CMPI.KFIN' +
        '_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'CMP_PEDIDO_ITENS'#39'   AND AP.TABLEKEY =  CMPI.KCMP_PED' +
        'IDO_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = CMP.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      '  AND ( CMP.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( CMP.KCAD_ENTIDADE = ' +
        ':KCAD_FORNECEDOR ) )'
      '  AND ( CMP.ATIVO = '#39'T'#39' )'
      '  AND ( CMP.DATA_COMPRA BETWEEN :DI AND :DF )'
      '  AND ( CMPI.KCMP_PEDIDO_ITEM IS NOT NULL )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  CMP.KCAD_ENTIDADE'
      ', '#39'FRETE NF COMPRA ('#39' || CMP.NOTA_FISCAL || '#39')'#39
      ', '#39'FRETE NF COMPRA ('#39' || CMP.NOTA_FISCAL_ || '#39')'#39
      ', CMP.DATA_COMPRA'
      ', '#39'Frete: '#39' || COALESCE ( P.NOME, CMPI.NOME )'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', (COALESCE( AP.PORCENTAGEM, 100 ) * CMPI.QTDE  / 100 ) QTDE'
      ', (COALESCE( AP.PORCENTAGEM, 100 ) * CMPI.FRETE / 100 ) DESPESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM CMP_PEDIDOS CMP'
      
        'LEFT JOIN CMP_PEDIDO_ITENS CMPI ON CMPI.KCMP_PEDIDO = CMP.KCMP_P' +
        'EDIDO'
      
        'LEFT JOIN EST_PRODUTOS P ON P.KEST_PRODUTO = (SELECT * FROM EST_' +
        'GET_PRODUTO_JUNCTION( CMPI.KEST_PRODUTO ))'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = CMPI.KFIN' +
        '_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'CMP_PEDIDO_ITENS'#39'   AND AP.TABLEKEY =  CMPI.KCMP_PED' +
        'IDO_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = CMP.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      '  AND ( CMP.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( CMP.KCAD_ENTIDADE = ' +
        ':KCAD_FORNECEDOR ) )'
      '  AND ( CMP.ATIVO = '#39'T'#39' )'
      '  AND ( CMP.DATA_COMPRA BETWEEN :DI AND :DF )'
      '  AND ( CMPI.KCMP_PEDIDO_ITEM IS NOT NULL )'
      '  AND ( CMPI.FRETE > 0 )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  CMP.KCAD_ENTIDADE'
      ', '#39'NF COMPRA ('#39' || CMP.NOTA_FISCAL || '#39')'#39
      ', '#39'NF COMPRA ('#39' || CMP.NOTA_FISCAL_ || '#39')'#39
      ', CMP.DATA_COMPRA'
      ', COALESCE ( P.NOME, CMPS.NOME )'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', (COALESCE( AP.PORCENTAGEM, 100 ) * CMPS.QTDE  /100  ) QTDE'
      ', (COALESCE( AP.PORCENTAGEM, 100 ) * CMPS.TOTAL /100 ) DESPESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM CMP_PEDIDOS CMP'
      
        'LEFT JOIN CMP_PEDIDO_SERVICOS CMPS ON CMPS.KCMP_PEDIDO = CMP.KCM' +
        'P_PEDIDO'
      
        'LEFT JOIN EST_PRODUTOS P ON P.KEST_PRODUTO = (SELECT * FROM EST_' +
        'GET_PRODUTO_JUNCTION( CMPS.KEST_PRODUTO ))'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = CMPS.KFIN' +
        '_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'CMP_PEDIDO_SERVICOS'#39'   AND AP.TABLEKEY = CMPS.KCMP_P' +
        'EDIDO_SERVICO'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = CMP.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      '  AND ( CMP.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( CMP.KCAD_ENTIDADE = ' +
        ':KCAD_FORNECEDOR ) )'
      '  AND ( CMP.ATIVO = '#39'T'#39' )'
      '  AND ( CMP.DATA_COMPRA BETWEEN :DI AND :DF )'
      '  AND ( CMPS.KCMP_PEDIDO_SERVICO IS NOT NULL )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  CMP.KCAD_ENTIDADE'
      ', '#39'JUROS COMPRA ('#39' || CMP.NOTA_FISCAL || '#39')'#39
      ', '#39'JUROS COMPRA ('#39' || CMP.NOTA_FISCAL_ || '#39')'#39
      ', PA.PAGTO'
      ', A.HISTORICO -- CMPI.NOME'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      
        ', (COALESCE( AP.PORCENTAGEM, 100 ) * (PA.VALOR * (CMPI.TOTAL / C' +
        'OALESCE(NULLIF(CMP.TOTAL_NOTA,0),1) )) / 100 ) DESPESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM CMP_PEDIDOS CMP'
      
        'LEFT JOIN FIN_APAGAR  A ON A.TABLENAME = '#39'CMP_PEDIDOS'#39' AND A.TAB' +
        'LEKEY =  CMP.KCMP_PEDIDO'
      
        'LEFT JOIN FIN_APAGAR_PARCELAS  PA ON PA.KFIN_APAGAR  = A.KFIN_AP' +
        'AGAR '
      'LEFT JOIN CMP_PEDIDO_ITENS CMPI USING ( KCMP_PEDIDO )'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = A.KFIN_PL' +
        'ANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'CMP_PEDIDO_ITENS'#39'   AND AP.TABLEKEY =  CMPI.KCMP_PED' +
        'IDO_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = CMP.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      '  AND ( CMP.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.KFIN_PLANOCONTA = :PLANOCONTA_DESPESAS )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( CMP.KCAD_ENTIDADE = ' +
        ':KCAD_FORNECEDOR ) )'
      '  AND ( CMP.ATIVO = '#39'T'#39' )'
      '  AND ( PA.PAGTO BETWEEN :DI AND :DF )'
      '  AND ( CMPI.KCMP_PEDIDO_ITEM IS NOT NULL )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  DVP.KCAD_ENTIDADE'
      ', '#39'NF DEVOLU'#199#195'O ('#39' || DVP.NOTA_FISCAL || '#39')'#39
      ', '#39'NF DEVOLU'#199#195'O ('#39' || DVP.NOTA_FISCAL_ || '#39')'#39
      ', DVP.DATA_ENTRADA'
      ', COALESCE ( P.NOME, DVPI.NOME )'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', (COALESCE( AP.PORCENTAGEM, 100 ) * DVPI.QTDE   / 100 ) QTDE'
      
        ', IIF( (COALESCE( AP.PORCENTAGEM, 100 ) * DVPI.TOTAL / 100 ) > 0' +
        ','
      '     - (COALESCE( AP.PORCENTAGEM, 100 ) * DVPI.TOTAL / 100 ),'
      
        '       (COALESCE( AP.PORCENTAGEM, 100 ) * DVPI.TOTAL / 100 )) DE' +
        'SPESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM DEV_PEDIDOS DVP'
      
        'LEFT JOIN DEV_PEDIDO_ITENS DVPI ON DVPI.KDEV_PEDIDO = DVP.KDEV_P' +
        'EDIDO'
      
        'LEFT JOIN EST_PRODUTOS P ON P.KEST_PRODUTO = (SELECT * FROM EST_' +
        'GET_PRODUTO_JUNCTION( DVPI.KEST_PRODUTO ))'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = DVPI.KFIN' +
        '_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'DEV_PEDIDO_ITENS'#39'   AND AP.TABLEKEY =  DVPI.KDEV_PED' +
        'IDO_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = DVP.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      '  AND ( DVP.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( DVP.KCAD_ENTIDADE = ' +
        ':KCAD_FORNECEDOR ) )'
      '  AND ( DVP.ATIVO = '#39'T'#39' )'
      '  AND ( DVP.DATA_ENTRADA BETWEEN :DI AND :DF )'
      '  AND ( DVPI.KDEV_PEDIDO_ITEM IS NOT NULL )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  VND.KCAD_ENTIDADE'
      ', '#39'DEDU'#199#195'O NF VENDA ('#39' || VND.NOTA_FISCAL || '#39')'#39
      ', '#39'DEDU'#199#195'O NF VENDA ('#39' || VND.NOTA_FISCAL_ || '#39')'#39
      ', VND.DATA_VENDA'
      ', '#39'Dedu'#231#245'es: NF '#39' || VND.NOTA_FISCAL'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', CAST('
      '    SUM ('
      
        '            COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * (VND.VAL' +
        'OR_DEDUCOES * (VNDI.TOTAL / COALESCE(NULLIF(VND.TOTAL_NOTA,0),1)' +
        ' ))'
      '          / VND.VALOR_DEDUCOES'
      '          * 100'
      '    ) as NUMERIC(5,2)'
      '  ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      
        ', SUM (COALESCE( AP.PORCENTAGEM, 100 ) * (VND.VALOR_DEDUCOES * (' +
        'VNDI.TOTAL / COALESCE(NULLIF(VND.TOTAL_NOTA,0),1) )) / 100 ) DES' +
        'PESA'
      ', CAST( NULL AS DOUBLE PRECISION ) RECEITA'
      'FROM VND_PEDIDOS VND'
      
        'LEFT JOIN VND_PEDIDO_ITENS VNDI ON VNDI.KVND_PEDIDO = VND.KVND_P' +
        'EDIDO'
      
        'INNER JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = :PLANOCO' +
        'NTA_IMPOSTOS_TAXAS'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'VND_PEDIDO_ITENS'#39'   AND AP.TABLEKEY = VNDI.KVND_PEDI' +
        'DO_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = VND.KCAD_ENTIDADE'
      'WHERE'
      '      ( :DESPESAS = '#39'T'#39' )'
      '  AND ( VND.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( VND.KCAD_ENTIDADE = ' +
        ':KCAD_FORNECEDOR ) )'
      '  AND ( VND.ATIVO = '#39'T'#39' )'
      '  AND ( VND.DATA_VENDA BETWEEN :DI AND :DF )'
      '  AND ( VNDI.KVND_PEDIDO_ITEM IS NOT NULL )'
      '  AND ( VND.VALOR_DEDUCOES > 0 )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( ( :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :PL' +
        'ANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'GROUP BY 1,2,3,4,5,6,7,8,9'
      'UNION ALL'
      'SELECT    --   receitas realizadas'
      '  A.KCAD_ENTIDADE'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      
        ', IIF ( A.RECORRENCIA = '#39'F'#39', A.DATALANCTO, PA.VENCTO ) DATALANCT' +
        'O'
      ', A.HISTORICO'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE( AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', CAST( NULL AS FLOAT ) QTDE'
      ', (CAST (NULL AS FLOAT) ) DESPESA'
      
        ', (COALESCE( AP.PORCENTAGEM, 100 ) * IIF ( A.RECORRENCIA = '#39'F'#39', ' +
        'A.VALOR, PA.VALOR ) /100) RECEITA'
      'FROM FIN_ARECEBER A'
      'LEFT JOIN ( SELECT P.KFIN_ARECEBER, P.VENCTO, P.VALOR'
      '              FROM FIN_ARECEBER_PARCELAS P'
      
        '              JOIN FIN_ARECEBER C ON C.KFIN_ARECEBER = P.KFIN_AR' +
        'ECEBER'
      '             WHERE C.RECORRENCIA = '#39'T'#39
      '               AND P.VENCTO BETWEEN :DI AND :DF'
      '           ) PA ON PA.KFIN_ARECEBER = A.KFIN_ARECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = A.KFIN_PL' +
        'ANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_ARECEBER'#39' AND AP.TABLEKEY  = A.KFIN_ARECEBER'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :RECEITAS = '#39'T'#39' )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :KCAD_' +
        'CLIENTE ) )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( A.TABLENAME IS NULL )'
      
        '  AND ( IIF( A.RECORRENCIA = '#39'F'#39', A.DATALANCTO, PA.VENCTO ) BETW' +
        'EEN :DI AND :DF )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  R.KCAD_ENTIDADE'
      ', R.DOCUMENTO'
      ', R.DOCUMENTO_'
      ', P.PAGTO'
      ', '#39'Juros '#39' || R.HISTORICO'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', CAST( NULL AS FLOAT ) QTDE'
      ', (CAST (NULL AS FLOAT) ) DESPESA'
      
        ', (COALESCE(  AP.PORCENTAGEM, 100 ) * ABS( P.JURO_DESCONTO ) / 1' +
        '00) RECEITA'
      'FROM FIN_ARECEBER_PARCELAS P'
      'INNER JOIN FIN_ARECEBER R ON R.KFIN_ARECEBER = P.KFIN_ARECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = P.KFIN_PL' +
        'ANOCONTA_JURO_DESCONTO'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_ARECEBER_PARCELAS'#39' AND AP.TABLEKEY =  P.KFIN_ARE' +
        'CEBER_PARCELA'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = R.KCAD_ENTIDADE'
      'WHERE'
      '      ( :RECEITAS = '#39'T'#39' )'
      
        '  AND (  :TIPOPC = 0 ) AND ( P.KFIN_PLANOCONTA_JURO_DESCONTO = :' +
        'PLANOCONTA_RECEITAS )'
      '  AND ( R.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( R.KCAD_ENTIDADE = :KCAD_' +
        'CLIENTE ) )'
      '  AND ( R.ATIVO = '#39'T'#39' )'
      '  AND ( P.PAGTO BETWEEN :DI AND :DF )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  A.KCAD_ENTIDADE'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', P.PAGTO'
      ', '#39'Desconto '#39' || A.HISTORICO'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', CAST( NULL AS FLOAT ) QTDE'
      ', (CAST (NULL AS FLOAT) ) DESPESA'
      
        ', (COALESCE(  AP.PORCENTAGEM, 100 ) * ABS( P.JURO_DESCONTO ) / 1' +
        '00) RECEITA'
      'FROM FIN_APAGAR_PARCELAS P'
      'INNER JOIN FIN_APAGAR A ON A.KFIN_APAGAR = P.KFIN_APAGAR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = P.KFIN_PL' +
        'ANOCONTA_JURO_DESCONTO'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_APAGAR_PARCELAS'#39' AND AP.TABLEKEY =  P.KFIN_APAGA' +
        'R_PARCELA'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :RECEITAS = '#39'T'#39' )'
      
        '  AND (  :TIPOPC = 0 ) AND ( P.KFIN_PLANOCONTA_JURO_DESCONTO = :' +
        'PLANOCONTA_RECEITAS )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :KCAD_' +
        'CLIENTE ) )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( P.PAGTO BETWEEN :DI AND :DF )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  VND.KCAD_ENTIDADE'
      ', '#39'NF VENDA ('#39' || VND.NOTA_FISCAL || '#39')'#39
      ', '#39'NF VENDA ('#39' || VND.NOTA_FISCAL_ || '#39')'#39
      ', VND.DATA_VENDA'
      ', VNDI.NOME'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE( AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', (COALESCE(  AP.PORCENTAGEM, 100 ) * VNDI.QTDE / 100 ) QTDE'
      ', (CAST (NULL AS FLOAT) ) DESPESA'
      
        '--,  (COALESCE( AP.PORCENTAGEM, 100 ) * VNDI.QTDE *  MV.CUSTO_ME' +
        'DIO  / 100 ) RECEITA'
      ', (COALESCE( AP.PORCENTAGEM, 100 ) * VNDI.TOTAL /100) RECEITA'
      'FROM VND_PEDIDOS VND'
      
        'LEFT JOIN VND_PEDIDO_ITENS VNDI ON VNDI.KVND_PEDIDO = VND.KVND_P' +
        'EDIDO'
      
        '-- LEFT JOIN EST_MOVIMENTO    MV ON MV.TABLENAME  = '#39'VND_PEDIDO_' +
        'ITENS'#39' AND MV.TABLEKEY = VNDI.KVND_PEDIDO_ITEM '
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = VNDI.KFIN' +
        '_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'VND_PEDIDO_ITENS'#39' AND AP.TABLEKEY  = VNDI.KVND_PEDID' +
        'O_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = VND.KCAD_ENTIDADE'
      'WHERE'
      '      ( :RECEITAS = '#39'T'#39' )'
      '  AND ( VND.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( VND.KCAD_ENTIDADE = :KCA' +
        'D_CLIENTE ) )'
      '  AND ( VND.ATIVO = '#39'T'#39' )'
      '  AND ( VND.DATA_VENDA BETWEEN :DI AND :DF )'
      '  AND ( VNDI.KVND_PEDIDO_ITEM IS NOT NULL )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  VND.KCAD_ENTIDADE'
      ', '#39'NF VENDA ('#39' || VND.NOTA_FISCAL || '#39')'#39
      ', '#39'NF VENDA ('#39' || VND.NOTA_FISCAL_ || '#39')'#39
      ', VND.DATA_VENDA'
      ', VNDS.NOME'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE( AP.PORCENTAGEM, 100 ) PORCENTAGEM'
      ', (COALESCE( AP.PORCENTAGEM, 100 ) * VNDS.QTDE  /100 ) QTDE'
      ', (CAST (NULL AS FLOAT) ) DESPESA'
      ', (COALESCE( AP.PORCENTAGEM, 100 ) * VNDS.TOTAL /100 ) RECEITA'
      'FROM VND_PEDIDOS VND'
      
        'LEFT JOIN VND_PEDIDO_SERVICOS VNDS ON VNDS.KVND_PEDIDO = VND.KVN' +
        'D_PEDIDO'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = VNDS.KFIN' +
        '_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'VND_PEDIDO_SERVICOS'#39' AND AP.TABLEKEY  = VNDS.KVND_PE' +
        'DIDO_SERVICO'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = VND.KCAD_ENTIDADE'
      'WHERE'
      '      ( :RECEITAS = '#39'T'#39' )'
      '  AND ( VND.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( VND.KCAD_ENTIDADE = :KCA' +
        'D_CLIENTE ) )'
      '  AND ( VND.ATIVO = '#39'T'#39' )'
      '  AND ( VND.DATA_VENDA BETWEEN :DI AND :DF )'
      '  AND ( VNDS.KVND_PEDIDO_SERVICO IS NOT NULL )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  A.KCAD_ENTIDADE'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', A.DATALANCTO'
      ', A.HISTORICO'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CAST(NULL AS VARCHAR(64) ) "CENTROCUSTO"'
      ', CAST(  100 AS FLOAT ) PORCENTAGEM'
      ', (CAST (NULL AS FLOAT) ) QTDE'
      ', (CAST (NULL AS FLOAT) ) DESPESA'
      ', A.VALOR RECEITA'
      'FROM FIN_ARECEBER A'
      
        'LEFT JOIN FIN_ARECEBER_PARCELAS P ON P.KFIN_ARECEBER  = A.KFIN_A' +
        'RECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON PC.KFIN_PLANOCONTA  = A.KFIN_PL' +
        'ANOCONTA'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :RECEITAS = '#39'T'#39' )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :KCAD_' +
        'CLIENTE ) )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND (   ( A.TABLENAME = '#39'FIN_FINANCIAMENTOS'#39' )'
      '       OR ( A.TABLENAME = '#39'FIN_FINANCIAMENTOS_GERAL'#39' )'
      '      )'
      '  AND ( A.DATALANCTO BETWEEN :DI AND :DF )'
      '  AND  (  :TIPOCC = 0  OR  :TIPOCC = 1 )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'ORDER BY 2')
    Left = 86
    Top = 104
    object sqlDespesasReceitasKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object sqlDespesasReceitasDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object sqlDespesasReceitasDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Size = 33
    end
    object sqlDespesasReceitasDATALANCTO: TSQLTimeStampField
      DisplayLabel = 'Data lan'#231'amento'
      FieldName = 'DATALANCTO'
      Required = True
    end
    object sqlDespesasReceitasHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object sqlDespesasReceitasCODIGO: TStringField
      DisplayLabel = 'C'#243'digo fornecedor'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlDespesasReceitasNOME: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlDespesasReceitasCONTACONTABIL: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object sqlDespesasReceitasCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de custo'
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
    object sqlDespesasReceitasPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object sqlDespesasReceitasQTDE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
    end
    object sqlDespesasReceitasDESPESA: TFloatField
      DisplayLabel = 'Despesa'
      FieldName = 'DESPESA'
      DisplayFormat = '#,0.00'
    end
    object sqlDespesasReceitasRECEITA: TFloatField
      DisplayLabel = 'Receita'
      FieldName = 'RECEITA'
      DisplayFormat = '#,0.00'
    end
    object sqlDespesasReceitasCPF_CNPJ: TStringField
      FieldKind = fkCalculated
      FieldName = 'CPF_CNPJ'
      Size = 18
      Calculated = True
    end
  end
  object sqlInfoEntidade: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT CPF_CNPJ from CAD_ENTIDADES'
      'WHERE KCAD_ENTIDADE = :KCAD_ENTIDADE')
    Left = 368
    Top = 120
    object sqlInfoEntidadeCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 18
    end
  end
end
