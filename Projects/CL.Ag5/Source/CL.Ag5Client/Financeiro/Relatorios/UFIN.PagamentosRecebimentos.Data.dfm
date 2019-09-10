object dtmFIN_PagamentosRecebimentos: TdtmFIN_PagamentosRecebimentos
  OldCreateOrder = True
  OnCreate = _dtmBASECreate
  OnDestroy = _dtmBASEDestroy
  Height = 238
  Width = 469
  object cdsPagamentosRecebimentos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftFixedChar
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_PLANOCONTAS'
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
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_PLANOCONTAS'
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
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
    ProviderName = 'dspPagamentosRecebimentos'
    Left = 80
    Top = 12
    object cdsPagamentosRecebimentosKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Visible = False
      FixedChar = True
    end
    object cdsPagamentosRecebimentosDEBITO_CREDITO: TStringField
      FieldName = 'DEBITO_CREDITO'
      Visible = False
      Size = 43
    end
    object cdsPagamentosRecebimentosDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 53
    end
    object cdsPagamentosRecebimentosDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Visible = False
      Size = 54
    end
    object cdsPagamentosRecebimentosDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsPagamentosRecebimentosHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 144
    end
    object cdsPagamentosRecebimentosTIPO_PRODUTO: TStringField
      DisplayLabel = 'Grupo produto'
      FieldName = 'TIPO_PRODUTO'
      Size = 64
    end
    object cdsPagamentosRecebimentosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo cliente/fornecedor'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsPagamentosRecebimentosNOME: TStringField
      DisplayLabel = 'Cliente/Fornecedor'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsPagamentosRecebimentosCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      Size = 18
    end
    object cdsPagamentosRecebimentosCONTACONTABIL: TStringField
      DisplayLabel = 'Conta cont'#225'bil'
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object cdsPagamentosRecebimentosCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de custo'
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
    object cdsPagamentosRecebimentosPORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '0 %'
    end
    object cdsPagamentosRecebimentosQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object cdsPagamentosRecebimentosCONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'CONTA'
      Visible = False
      FixedChar = True
    end
    object cdsPagamentosRecebimentosNOMECONTA: TStringField
      DisplayLabel = 'Conta banc'#225'ria'
      FieldName = 'NOMECONTA'
      ReadOnly = True
      Size = 64
    end
    object cdsPagamentosRecebimentosNUM_CHEQUE: TStringField
      DisplayLabel = 'Cheque'
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object cdsPagamentosRecebimentosPARCELA: TStringField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      Size = 23
    end
    object cdsPagamentosRecebimentosPROVISAO: TStringField
      DisplayLabel = 'Provis'#227'o'
      FieldName = 'PROVISAO'
      OnGetText = cdsPagamentosRecebimentosPROVISAOGetText
      FixedChar = True
      Size = 1
    end
    object cdsPagamentosRecebimentosCREDITO: TFloatField
      DisplayLabel = 'Cr'#233'dito'
      FieldName = 'CREDITO'
      DisplayFormat = '#,0.00'
    end
    object cdsPagamentosRecebimentosDEBITO: TFloatField
      DisplayLabel = 'D'#233'bito'
      FieldName = 'DEBITO'
      DisplayFormat = '#,0.00'
    end
    object cdsPagamentosRecebimentosTOTAL_CREDITO: TAggregateField
      FieldName = 'TOTAL_CREDITO'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(CREDITO)'
    end
    object cdsPagamentosRecebimentosTOTAL_DEBITO: TAggregateField
      FieldName = 'TOTAL_DEBITO'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,0.00'
      Expression = 'SUM(DEBITO)'
    end
  end
  object dspPagamentosRecebimentos: TDataSetProvider
    DataSet = sqlPagamentosRecebimentos
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 43
    Top = 57
  end
  object sqlPagamentosRecebimentos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    OnCalcFields = sqlPagamentosRecebimentosCalcFields
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_PLANOCONTAS'
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
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_PLANOCONTAS'
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
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PLANOCONTA_FINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DEBITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_DEBITO'
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
        Name = 'PROVISAO_DEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'USE_APROPRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
        Name = 'USE_PLANOCONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CREDITOS'
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
        DataType = ftFixedChar
        Name = 'PROGRAMACAO_CREDITO'
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
        Name = 'PROVISAO_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TODAS_CONTAS'
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
      'SELECT -- pagamentos recebimentos'
      '  A.KCAD_ENTIDADE'
      ', '#39'D'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) DATA'
      ', A.HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      ', (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * PA.VALOR) DEBITO'
      'FROM FIN_APAGAR A'
      
        'LEFT JOIN FIN_APAGAR_PARCELAS PA ON PA.KFIN_APAGAR = A.KFIN_APAG' +
        'AR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = A.KFIN_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_APAGAR'#39'   AND AP.TABLEKEY =  A.KFIN_APAGAR'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      
        'LEFT JOIN CMP_PEDIDOS CMP ON A.TABLENAME = '#39'CMP_PEDIDOS'#39' AND CMP' +
        '.KCMP_PEDIDO = A.TABLEKEY'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL )'
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF )'
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
      '  AND ( A.TABLENAME IS NULL'
      '             OR (         A.TABLENAME = '#39'CMP_PEDIDOS'#39
      '                     AND A.SYS$ORIGIN_TYPE = 2 '
      '                     AND A.KFIN_APAGAR <> CMP.KFIN_APAGAR'
      
        '                     AND A.HISTORICO NOT CONTAINING '#39'Nota fiscal' +
        ' de compra'#39
      
        '                     AND A.HISTORICO NOT CONTAINING '#39'DUPLICATA D' +
        'E NOTA FISCAL'#39
      
        '                     AND A.HISTORICO NOT CONTAINING '#39'JUROS DE NO' +
        'TA FISCAL'#39
      '                ) '
      '          )'
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
      ', '#39'D'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', '#39'Juros '#39' || A.HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      
        ', (COALESCE(  AP.PORCENTAGEM / 100.00, 1.00 ) * ABS( PA.JURO_DES' +
        'CONTO )) DEBITO'
      'FROM FIN_APAGAR_PARCELAS PA'
      'INNER JOIN FIN_APAGAR A ON A.KFIN_APAGAR = PA.KFIN_APAGAR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = PA.KFIN_PLANOCONTA_JURO_DESCONTO'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_APAGAR_PARCELAS'#39' AND AP.TABLEKEY =  PA.KFIN_APAG' +
        'AR_PARCELA'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      
        '  AND ( PA.KFIN_PLANOCONTA_JURO_DESCONTO = :PLANOCONTA_DESPESAS ' +
        ')'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL )'
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF )'
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
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
      'SELECT'
      '  A.KCAD_ENTIDADE'
      ', '#39'D'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', '#39'Desconto '#39' || A.HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_ARECEBER_PARCELAS P1'
      '     WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_ARECEBER_PARCELAS P1'
      '      WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      
        ', (COALESCE(  AP.PORCENTAGEM / 100.00, 1.00 ) * ABS( PA.JURO_DES' +
        'CONTO )) DEBITO'
      'FROM FIN_ARECEBER_PARCELAS PA'
      'INNER JOIN FIN_ARECEBER A ON A.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = PA.KFIN_PLANOCONTA_JURO_DESCONTO'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_ARECEBER_PARCELAS'#39' AND AP.TABLEKEY =  PA.KFIN_AR' +
        'ECEBER_PARCELA'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      
        '  AND (  :TIPOPC = 0 ) AND ( PA.KFIN_PLANOCONTA_JURO_DESCONTO = ' +
        ':PLANOCONTA_DESPESAS )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL )'
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF )'
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL )'
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  CMP.KCAD_ENTIDADE'
      ', '#39'D'#39' DEBITO_CREDITO'
      ', '#39'NF COMPRA ('#39' || CMP.NOTA_FISCAL || '#39')'#39
      ', '#39'NF COMPRA ('#39' || CMP.NOTA_FISCAL_ || '#39')'#39
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', COALESCE ( P.NOME, CMPI.NOME )'
      ', P.TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ',   CMPI.QTDE'
      '  * COALESCE( AP.PORCENTAGEM / 100.00, 1.00 )'
      '  * PA.VALOR'
      '  * (CMPI.TOTAL/COALESCE(NULLIF(CMP.TOTAL_NOTA,0),1.00))'
      '  / CMPI.TOTAL'
      '  QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      
        ', (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * (PA.VALOR * (CMPI' +
        '.TOTAL / COALESCE(NULLIF(CMP.TOTAL_NOTA,0),1) )) ) DEBITO'
      'FROM CMP_PEDIDOS CMP'
      
        'LEFT JOIN CMP_PEDIDO_ITENS     CMPI ON CMPI.KCMP_PEDIDO = CMP.KC' +
        'MP_PEDIDO'
      
        'LEFT JOIN FIN_APAGAR           A ON A.TABLENAME = '#39'CMP_PEDIDOS'#39' ' +
        'AND A.TABLEKEY = CMP.KCMP_PEDIDO'
      
        'LEFT JOIN FIN_APAGAR_PARCELAS  PA ON PA.KFIN_APAGAR = A.KFIN_APA' +
        'GAR'
      
        'LEFT JOIN EST_PRODUTOS         P ON P.KEST_PRODUTO = (SELECT * F' +
        'ROM EST_GET_PRODUTO_JUNCTION( CMPI.KEST_PRODUTO ))'
      
        'LEFT JOIN FIN_PLANOCONTAS      PC ON :USE_PLANOCONTAS = '#39'T'#39' AND ' +
        ' PC.KFIN_PLANOCONTA  = CMPI.KFIN_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO      AP ON :USE_APROPRIACAO = '#39'T'#39' AND ' +
        'AP.TABLENAME = '#39'CMP_PEDIDO_ITENS'#39'   AND AP.TABLEKEY =  CMPI.KCMP' +
        '_PEDIDO_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO     CC ON CC.KFIN_CENTROCUSTO = AP.KF' +
        'IN_CENTROCUSTO'
      
        'LEFT JOIN CAD_ENTIDADES        C ON C.KCAD_ENTIDADE = CMP.KCAD_E' +
        'NTIDADE'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      '  AND ( CMP.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( CMP.KCAD_ENTIDADE = ' +
        ':KCAD_FORNECEDOR ) )'
      '  AND ( CMP.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL ) '
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF ) '
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
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
      ', '#39'D'#39' DEBITO_CREDITO'
      ', '#39'FRETE NF COMPRA ('#39' || CMP.NOTA_FISCAL || '#39')'#39
      ', '#39'FRETE NF COMPRA ('#39' || CMP.NOTA_FISCAL_ || '#39')'#39
      ', COALESCE ( PA.PAGTO, PA.VENCTO ) DATA_COMPRA'
      ', '#39'Frete: '#39' || COALESCE ( P.NOME, CMPI.NOME )'
      ', P.TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ',   CMPI.QTDE'
      '  * COALESCE( AP.PORCENTAGEM / 100.00, 1.00 )'
      '  * PA.VALOR'
      '  * (CMPI.TOTAL/COALESCE(NULLIF(CMP.TOTAL_NOTA,0),1.00))'
      '  / CMPI.TOTAL'
      '  QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      
        ', (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * CMPI.FRETE ) DEBI' +
        'TO'
      'FROM CMP_PEDIDOS CMP'
      
        'LEFT JOIN CMP_PEDIDO_ITENS CMPI ON CMPI.KCMP_PEDIDO = CMP.KCMP_P' +
        'EDIDO'
      
        'LEFT JOIN FIN_APAGAR           A ON A.TABLENAME = '#39'CMP_PEDIDOS'#39' ' +
        'AND A.TABLEKEY = CMP.KCMP_PEDIDO'
      
        'LEFT JOIN FIN_APAGAR_PARCELAS  PA ON PA.KFIN_APAGAR = A.KFIN_APA' +
        'GAR'
      
        'LEFT JOIN EST_PRODUTOS P ON P.KEST_PRODUTO = (SELECT * FROM EST_' +
        'GET_PRODUTO_JUNCTION( CMPI.KEST_PRODUTO ))'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = CMPI.KFIN_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'CMP_PEDIDO_ITENS'#39'   AND AP.TABLEKEY =  CMPI.KCMP_PED' +
        'IDO_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = CMP.KCAD_ENTIDADE'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      '  AND ( CMP.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( CMP.KCAD_ENTIDADE = ' +
        ':KCAD_FORNECEDOR ) )'
      '  AND ( CMP.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL ) '
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF ) '
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
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
      ', '#39'D'#39' DEBITO_CREDITO'
      ', '#39'NF COMPRA ('#39' || CMP.NOTA_FISCAL || '#39')'#39
      ', '#39'NF COMPRA ('#39' || CMP.NOTA_FISCAL_ || '#39')'#39
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) DATA_COMPRA'
      ', COALESCE ( P.NOME, CMPS.NOME )'
      ', P.TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ',   CMPS.QTDE'
      '  * COALESCE( AP.PORCENTAGEM / 100.00, 1.00 )'
      '  * PA.VALOR'
      '  * (CMPS.TOTAL/COALESCE(NULLIF(CMP.TOTAL_NOTA,0),1.00))'
      '  / CMPS.TOTAL'
      '  QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      
        ', (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * (PA.VALOR * (CMPS' +
        '.TOTAL / COALESCE(NULLIF(CMP.TOTAL_NOTA,0),1) )) ) DEBITO'
      'FROM CMP_PEDIDOS CMP'
      
        'LEFT JOIN FIN_APAGAR           A ON A.TABLENAME = '#39'CMP_PEDIDOS'#39' ' +
        'AND A.TABLEKEY = CMP.KCMP_PEDIDO'
      
        'LEFT JOIN FIN_APAGAR_PARCELAS  PA ON PA.KFIN_APAGAR = A.KFIN_APA' +
        'GAR'
      
        'LEFT JOIN CMP_PEDIDO_SERVICOS CMPS ON CMPS.KCMP_PEDIDO = CMP.KCM' +
        'P_PEDIDO'
      
        'LEFT JOIN EST_PRODUTOS P ON P.KEST_PRODUTO = (SELECT * FROM EST_' +
        'GET_PRODUTO_JUNCTION( CMPS.KEST_PRODUTO ))'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = CMPS.KFIN_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'CMP_PEDIDO_SERVICOS'#39'   AND AP.TABLEKEY = CMPS.KCMP_P' +
        'EDIDO_SERVICO'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = CMP.KCAD_ENTIDADE'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      '  AND ( CMP.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( CMP.KCAD_ENTIDADE = ' +
        ':KCAD_FORNECEDOR ) )'
      '  AND ( CMP.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL ) '
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF ) '
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
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
      ', '#39'D'#39' DEBITO_CREDITO'
      ', '#39'JUROS COMPRA ('#39' || CMP.NOTA_FISCAL || '#39')'#39
      ', '#39'JUROS COMPRA ('#39' || CMP.NOTA_FISCAL_ || '#39')'#39
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', A.HISTORICO -- CMPI.NOME'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      
        ', (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * (PA.VALOR * (CMPI' +
        '.TOTAL / COALESCE(NULLIF(CMP.TOTAL_NOTA,0),1) )) ) DEBITO'
      'FROM CMP_PEDIDOS CMP'
      
        'LEFT JOIN FIN_APAGAR  A ON A.TABLENAME = '#39'CMP_PEDIDOS'#39' AND A.TAB' +
        'LEKEY =  CMP.KCMP_PEDIDO'
      
        'LEFT JOIN FIN_APAGAR_PARCELAS  PA ON PA.KFIN_APAGAR  = A.KFIN_AP' +
        'AGAR '
      'LEFT JOIN CMP_PEDIDO_ITENS CMPI USING ( KCMP_PEDIDO )'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = A.KFIN_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'CMP_PEDIDO_ITENS'#39'   AND AP.TABLEKEY =  CMPI.KCMP_PED' +
        'IDO_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = CMP.KCAD_ENTIDADE'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      '  AND ( CMP.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.KFIN_PLANOCONTA = :PLANOCONTA_DESPESAS )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( CMP.KCAD_ENTIDADE = ' +
        ':KCAD_FORNECEDOR ) )'
      '  AND ( CMP.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL ) '
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF ) '
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
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
      '  A.KCAD_ENTIDADE'
      ', '#39'D'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', '#39'Juros '#39' || A.HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      
        ', (COALESCE(  AP.PORCENTAGEM / 100.00, 1.00 ) * ABS( PA.JURO_DES' +
        'CONTO )) DEBITO'
      'FROM FIN_APAGAR_PARCELAS PA'
      'INNER JOIN FIN_APAGAR A ON A.KFIN_APAGAR = PA.KFIN_APAGAR'
      
        'LEFT JOIN FIN_FINANCIAMENTOS F ON F.KFIN_APAGAR_AMORTIZACAO = A.' +
        'KFIN_APAGAR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = F.KFIN_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_FINANCIAMENTOS'#39' AND AP.TABLEKEY =  F.KFIN_FINANC' +
        'IAMENTO'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL )'
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF )'
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
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
      'SELECT'
      '  A.KCAD_ENTIDADE'
      ', '#39'D'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', A.HISTORICO || '#39' (Amortiza'#231#227'o)'#39' HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', COALESCE( C.NOME, F.NOMEENTIDADE ) NOME'
      ', PC.NOME CONTACONTABIL'
      ', CAST(NULL AS VARCHAR(64)) "CENTROCUSTO"'
      ', CAST( 100 AS FLOAT ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      ', ABS( PA.VALOR ) DEBITO'
      'FROM FIN_FINANCIAMENTOS F'
      
        'INNER JOIN FIN_APAGAR A ON  A.KFIN_APAGAR = F.KFIN_APAGAR_AMORTI' +
        'ZACAO'
      
        'LEFT JOIN FIN_APAGAR_PARCELAS PA ON PA.KFIN_APAGAR = A.KFIN_APAG' +
        'AR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = :PLANOCONTA_FINANCIAMENTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      
        '  AND ( ( :TIPOPC = 0 ) OR  ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PL' +
        'ANOCONTA = :PLANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO )' +
        ' ) )'
      '  AND (  (  :TIPOCC = 0 )   OR  (  :TIPOCC = 1 ) )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.TABLENAME = '#39'FIN_FINANCIAMENTOS'#39' )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL )'
      '  AND ( PA.PAGTO BETWEEN :DI AND :DF )'
      '  AND ( PA.VALOR > 0.00  )'
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL )'
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
      'UNION ALL'
      'SELECT'
      '  A.KCAD_ENTIDADE'
      ', '#39'D'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', A.HISTORICO || '#39' (Despesas)'#39' HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', COALESCE( C.NOME, F.NOMEENTIDADE ) NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      
        ', (COALESCE(  AP.PORCENTAGEM / 100.00, 1.00 ) * ABS( PA.PAGO )) ' +
        'DEBITO'
      'FROM FIN_FINANCIAMENTOS F'
      
        'INNER JOIN FIN_APAGAR A ON  A.KFIN_APAGAR = F.KFIN_APAGAR_DESPES' +
        'AS'
      
        'LEFT JOIN FIN_APAGAR_PARCELAS PA ON PA.KFIN_APAGAR = A.KFIN_APAG' +
        'AR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = :PLANOCONTA_DESPESAS'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_FINANCIAMENTOS'#39' AND AP.TABLEKEY =  F.KFIN_FINANC' +
        'IAMENTO'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      
        '  AND ( ( :TIPOPC = 0 ) OR  ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PL' +
        'ANOCONTA = :PLANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO )' +
        ' ) )'
      '  AND (  (  :TIPOCC = 0 )   OR  (  :TIPOCC = 1 ) )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.TABLENAME = '#39'FIN_FINANCIAMENTOS'#39' )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL )'
      '  AND ( PA.PAGTO BETWEEN :DI AND :DF )'
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL )'
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
      'UNION ALL'
      'SELECT '
      '  A.KCAD_ENTIDADE'
      ', '#39'D'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', A.HISTORICO || '#39' (Juros)'#39' HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      
        ', (COALESCE(  AP.PORCENTAGEM / 100.00, 1.00 ) * ABS( FP.JUROS ))' +
        ' DEBITO'
      'FROM FIN_APAGAR_PARCELAS PA'
      'INNER JOIN FIN_APAGAR A ON A.KFIN_APAGAR = PA.KFIN_APAGAR'
      
        'INNER JOIN FIN_FINANCIAMENTOS_PARCELAS FP ON PA.KFIN_APAGAR_PARC' +
        'ELA = FP.KFIN_APAGAR_PARCELA'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  =  :PLANOCONTA_JUROS_FINANCIAMENTO'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_APAGAR'#39' AND AP.TABLEKEY =  A.KFIN_APAGAR'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      
        '  AND (  (:TIPOPC = 0 ) OR (  (  :TIPOPC = 1 ) AND (  PC.KFIN_PL' +
        'ANOCONTA = :PLANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO )' +
        ' ) )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :K' +
        'CAD_FORNECEDOR ) )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( FP.JUROS > 0 )'
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL )'
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF )'
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      'UNION ALL'
      'SELECT '
      '  A.KCAD_ENTIDADE'
      ', '#39'D'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', A.HISTORICO || '#39' (Amortiza'#231#227'o)'#39' HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CAST(NULL AS VARCHAR(64)) "CENTROCUSTO"'
      ', CAST( 100 AS FLOAT ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      ', ABS( FP.AMORTIZACAO ) DEBITO'
      'FROM FIN_APAGAR_PARCELAS PA'
      
        'INNER JOIN FIN_FINANCIAMENTOS_PARCELAS FP ON PA.KFIN_APAGAR_PARC' +
        'ELA = FP.KFIN_APAGAR_PARCELA'
      'INNER JOIN FIN_APAGAR A ON A.KFIN_APAGAR = PA.KFIN_APAGAR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  =  :PLANOCONTA_FINANCIAMENTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE '
      '      ( :DEBITOS = '#39'T'#39' )'
      
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
      '  AND ( :PROGRAMACAO_DEBITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL )'
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF )'
      
        '  AND ( :PROVISAO_DEBITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO I' +
        'S NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
      'UNION ALL'
      'SELECT'
      '  DVP.KCAD_ENTIDADE'
      ', '#39'C'#39' DEBITO_CREDITO'
      ', '#39'NF DEVOLU'#199#195'O ('#39' || DVP.NOTA_FISCAL || '#39')'#39
      ', '#39'NF DEVOLU'#199#195'O ('#39' || DVP.NOTA_FISCAL_ || '#39')'#39
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', COALESCE ( P.NOME, DVPI.NOME )'
      ', P.TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ', DVPI.QTDE'
      '  * COALESCE( AP.PORCENTAGEM / 100.00, 1.00 )'
      '  * PA.VALOR'
      '  * (DVPI.TOTAL/COALESCE(NULLIF(DVP.TOTAL_NOTA,0),1.00))'
      '  / DVPI.TOTAL'
      '  QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_ARECEBER_PARCELAS P1'
      '     WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_ARECEBER_PARCELAS P1'
      '      WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      
        ', IIF( (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * DVPI.TOTAL )' +
        ' > 0,'
      
        '     - (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * DVPI.TOTAL )' +
        ','
      
        '       (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * DVPI.TOTAL )' +
        ') CREDITO'
      ', CAST(NULL AS DOUBLE PRECISION) DEBITO'
      'FROM DEV_PEDIDOS DVP'
      
        'LEFT JOIN DEV_PEDIDO_ITENS DVPI ON DVPI.KDEV_PEDIDO = DVP.KDEV_P' +
        'EDIDO'
      
        'LEFT JOIN FIN_ARECEBER  A ON A.TABLENAME = '#39'DEV_PEDIDOS'#39' AND A.T' +
        'ABLEKEY =  DVP.KDEV_PEDIDO'
      
        'LEFT JOIN FIN_ARECEBER_PARCELAS  PA ON PA.KFIN_ARECEBER  = A.KFI' +
        'N_ARECEBER'
      
        'LEFT JOIN EST_PRODUTOS P ON P.KEST_PRODUTO = (SELECT * FROM EST_' +
        'GET_PRODUTO_JUNCTION( DVPI.KEST_PRODUTO ))'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = DVPI.KFIN_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'DEV_PEDIDO_ITENS'#39'   AND AP.TABLEKEY =  DVPI.KDEV_PED' +
        'IDO_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = DVP.KCAD_ENTIDADE'
      'WHERE '
      '      ( :CREDITOS = '#39'T'#39' )'
      '  AND ( DVP.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( DVP.KCAD_ENTIDADE = ' +
        ':KCAD_FORNECEDOR ) )'
      '  AND ( DVP.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_CREDITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL ) '
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF ) '
      
        '  AND ( :PROVISAO_CREDITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO ' +
        'IS NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
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
      '/* REMOVER'
      'UNION ALL'
      'SELECT'
      '    VND.KCAD_ENTIDADE'
      ', '#39'D'#39' DEBITO_CREDITO'
      ', '#39'DEDU'#199#195'O NF VENDA ('#39' || VND.NOTA_FISCAL || '#39')'#39
      ', '#39'DEDU'#199#195'O NF VENDA ('#39' || VND.NOTA_FISCAL_ || '#39')'#39
      ', VND.DATA_VENDA'
      ', '#39'Dedu'#231#245'es| NF '#39' || VND.NOTA_FISCAL'
      ', '#39'Dedu'#231#245'es| NF '#39' || VND.NOTA_FISCAL_'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.NOME'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', CAST ('
      '    SUM ('
      
        '        COALESCE(AP.PORCENTAGEM / 100.00, 1.00 ) * (VND.VALOR_DE' +
        'DUCOES * (VNDI.TOTAL / COALESCE(NULLIF(VND.TOTAL_NOTA,0),1) ))'
      '      / VND.VALOR_DEDUCOES  * 100.00'
      '    ) as NUMERIC(5,2)'
      '  ) PORCENTAGEM'
      ', CAST( NULL AS DOUBLE PRECISION ) QTDE'
      ', '#39#39' CONTA'
      ', '#39#39' NUM_CHEQUE'
      ', '#39'1/1'#39' PARCELA'
      ', CAST('#39'F'#39' AS SYS$BOOL )  PROVISAO'
      ', CAST(NULL AS DOUBLE PRECISION) CREDITO'
      
        ', SUM ( (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * (VND.VALOR_' +
        'DEDUCOES * (VNDI.TOTAL / COALESCE(NULLIF(VND.TOTAL_NOTA,0),1) ))' +
        ' ) ) DEBITO'
      'FROM VND_PEDIDOS VND'
      
        'LEFT JOIN VND_PEDIDO_ITENS VNDI ON VNDI.KVND_PEDIDO = VND.KVND_P' +
        'EDIDO'
      
        'INNER JOIN FIN_PLANOCONTAS  PC ON |USE_PLANOCONTAS = '#39'T'#39' AND  PC' +
        '.KFIN_PLANOCONTA  = |PLANOCONTA_IMPOSTOS_TAXAS'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON |USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'VND_PEDIDO_ITENS'#39'   AND AP.TABLEKEY = VNDI.KVND_PEDI' +
        'DO_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = VND.KCAD_ENTIDADE'
      'WHERE'
      '      ( |DEBITOS = '#39'T'#39' )'
      '  AND ( VND.KSYS$DOMAIN = |KSYS$DOMAIN )'
      
        '  AND ( ( |TODOS_FORNECEDORES = '#39'T'#39'  ) OR ( VND.KCAD_ENTIDADE = ' +
        '|KCAD_FORNECEDOR ) )'
      '  AND ( VND.ATIVO = '#39'T'#39' )'
      '  AND ( DATA_VENDA BETWEEN |DI AND |DF )'
      '  AND ( |TODAS_CONTAS = '#39'T'#39' / *OR_CONTA_IN_LIST* / )'
      '  AND ( VNDI.KVND_PEDIDO_ITEM IS NOT NULL )'
      '  AND ( VND.VALOR_DEDUCOES > 0 )'
      '  AND (        (  |TIPOCC = 0 )'
      
        '            OR ( (  |TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  |TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        '|CC OR CC.CLASSIFICACAO LIKE |CLASSIFICACAOCC ) )'
      '         )'
      '  AND (        (  |TIPOPC = 0 )'
      
        '            OR ( ( |TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = |PL' +
        'ANOCONTA OR PC.CLASSIFICACAO LIKE |CLASSIFICACAO ) )'
      '         )'
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11'
      '*/'
      'UNION ALL'
      'SELECT'
      '  A.KCAD_ENTIDADE'
      ', '#39'C'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', A.HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE( AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ', CAST( NULL AS FLOAT ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_ARECEBER_PARCELAS P1'
      '     WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_ARECEBER_PARCELAS P1'
      '      WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * PA.VALOR) CREDITO'
      ', CAST(NULL AS DOUBLE PRECISION) DEBITO'
      'FROM FIN_ARECEBER A'
      
        'LEFT JOIN FIN_ARECEBER_PARCELAS PA ON PA.KFIN_ARECEBER = A.KFIN_' +
        'ARECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = A.KFIN_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_ARECEBER'#39' AND AP.TABLEKEY  = A.KFIN_ARECEBER'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :CREDITOS = '#39'T'#39')'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :KCAD_' +
        'CLIENTE ) )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( A.TABLENAME IS NULL )'
      '  AND ( :PROGRAMACAO_CREDITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL ) '
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF ) '
      
        '  AND ( :PROVISAO_CREDITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO ' +
        'IS NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
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
      ', '#39'C'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', '#39'Juros '#39' || A.HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ', CAST( NULL AS FLOAT ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_ARECEBER_PARCELAS P1'
      '     WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_ARECEBER_PARCELAS P1'
      '      WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      
        ', (COALESCE(  AP.PORCENTAGEM / 100.00, 1.00 ) * ABS( PA.JURO_DES' +
        'CONTO )) CREDITO'
      ', CAST(NULL AS DOUBLE PRECISION) DEBITO'
      'FROM FIN_ARECEBER_PARCELAS PA'
      'INNER JOIN FIN_ARECEBER A ON A.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = PA.KFIN_PLANOCONTA_JURO_DESCONTO'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_ARECEBER_PARCELAS'#39' AND AP.TABLEKEY =  PA.KFIN_AR' +
        'ECEBER_PARCELA'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :CREDITOS = '#39'T'#39' )'
      '  AND (  :TIPOPC = 0 )'
      
        '  AND ( PA.KFIN_PLANOCONTA_JURO_DESCONTO = :PLANOCONTA_RECEITAS ' +
        ')'
      '  AND ( :CREDITOS = '#39'T'#39')'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :KCAD_' +
        'CLIENTE ) )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_CREDITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL )'
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF )'
      
        '  AND ( :PROVISAO_CREDITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO ' +
        'IS NOT NULL )'
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
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
      ', '#39'C'#39' DEBITO_CREDITO'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', '#39'Desconto '#39' || A.HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE(  AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ', CAST( NULL AS FLOAT ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_APAGAR_PARCELAS P1'
      '     WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_APAGAR_PARCELAS P1'
      '      WHERE P1.KFIN_APAGAR = PA.KFIN_APAGAR'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      
        ', (COALESCE(  AP.PORCENTAGEM / 100.00, 1.00 ) * ABS( PA.JURO_DES' +
        'CONTO )) CREDITO'
      ', CAST(NULL AS DOUBLE PRECISION) DEBITO'
      'FROM FIN_APAGAR_PARCELAS PA'
      'INNER JOIN FIN_APAGAR A ON A.KFIN_APAGAR = PA.KFIN_APAGAR'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = PA.KFIN_PLANOCONTA_JURO_DESCONTO'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'FIN_APAGAR_PARCELAS'#39' AND AP.TABLEKEY =  PA.KFIN_APAG' +
        'AR_PARCELA'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :CREDITOS = '#39'T'#39')'
      '  AND (  :TIPOPC = 0 )'
      
        '  AND ( PA.KFIN_PLANOCONTA_JURO_DESCONTO = :PLANOCONTA_RECEITAS ' +
        ')'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :KCAD_' +
        'CLIENTE ) )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_CREDITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL )'
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF )'
      
        '  AND ( :PROVISAO_CREDITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO ' +
        'IS NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
      '  AND (        (  :TIPOCC = 0 )'
      
        '            OR ( (  :TIPOCC = 1 ) AND (  CC.KFIN_CENTROCUSTO IS ' +
        'NULL ) )'
      
        '            OR ( (  :TIPOCC = 2 ) AND (  CC.KFIN_CENTROCUSTO  = ' +
        ':CC OR CC.CLASSIFICACAO LIKE :CLASSIFICACAOCC ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  VND.KCAD_ENTIDADE'
      ', '#39'C'#39' DEBITO_CREDITO'
      ', '#39'NF VENDA ('#39' || VND.NOTA_FISCAL || '#39')'#39
      ', '#39'NF VENDA ('#39' || VND.NOTA_FISCAL_ || '#39')'#39
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) DATA'
      ', VNDI.NOME'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE( AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ',   VNDI.QTDE'
      
        '  / (VNDI.TOTAL*(1-VND.VALOR_DEDUCOES/COALESCE(NULLIF(VND.TOTAL_' +
        'NOTA,0),1.00)))'
      '  * COALESCE( AP.PORCENTAGEM / 100.00, 1.00 )'
      '  * PA.VALOR'
      '  * VNDI.TOTAL'
      
        '  * (1-VND.VALOR_DEDUCOES/COALESCE(NULLIF(VND.TOTAL_NOTA,0),1.00' +
        '))'
      '  / COALESCE(NULLIF(VND.TOTAL_NOTA-VND.VALOR_DEDUCOES,0),1.00)'
      '  QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_ARECEBER_PARCELAS P1'
      '     WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_ARECEBER_PARCELAS P1'
      '      WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      
        ', (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * (PA.VALOR * (VNDI' +
        '.TOTAL / COALESCE(NULLIF(VND.TOTAL_NOTA,0),1) )) ) CREDITO'
      ', CAST(NULL AS DOUBLE PRECISION) DEBITO'
      'FROM VND_PEDIDOS VND'
      
        'LEFT JOIN VND_PEDIDO_ITENS VNDI ON VNDI.KVND_PEDIDO = VND.KVND_P' +
        'EDIDO'
      
        'LEFT JOIN FIN_ARECEBER           A ON A.TABLENAME = '#39'VND_PEDIDOS' +
        #39' AND A.TABLEKEY = VND.KVND_PEDIDO'
      
        'LEFT JOIN FIN_ARECEBER_PARCELAS  PA ON PA.KFIN_ARECEBER = A.KFIN' +
        '_ARECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = VNDI.KFIN_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'VND_PEDIDO_ITENS'#39' AND AP.TABLEKEY  = VNDI.KVND_PEDID' +
        'O_ITEM'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = VND.KCAD_ENTIDADE'
      'WHERE'
      '      ( :CREDITOS = '#39'T'#39' )'
      '  AND ( VND.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( VND.KCAD_ENTIDADE = :KCA' +
        'D_CLIENTE ) )'
      '  AND ( VND.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_CREDITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL ) '
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF ) '
      
        '  AND ( :PROVISAO_CREDITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO ' +
        'IS NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
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
      ',  '#39'NF VENDA ('#39' || VND.NOTA_FISCAL || '#39')'#39
      ',  '#39'NF VENDA ('#39' || VND.NOTA_FISCAL_ || '#39')'#39
      ', '#39'C'#39' DEBITO_CREDITO'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) DATA'
      ', VNDS.NOME'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CC.NOME CENTROCUSTO'
      ', COALESCE( AP.PORCENTAGEM, 100.00 ) PORCENTAGEM'
      ',   VNDS.QTDE'
      
        '  / (VNDS.TOTAL*(1-VND.VALOR_DEDUCOES/COALESCE(NULLIF(VND.TOTAL_' +
        'NOTA,0),1.00)))'
      '  * COALESCE( AP.PORCENTAGEM / 100.00, 1.00 )'
      '  * PA.VALOR'
      '  * VNDS.TOTAL'
      
        '  * (1-VND.VALOR_DEDUCOES/COALESCE(NULLIF(VND.TOTAL_NOTA,0),1.00' +
        '))'
      '  / COALESCE(NULLIF(VND.TOTAL_NOTA-VND.VALOR_DEDUCOES,0),1.00)'
      '  QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_ARECEBER_PARCELAS P1'
      '     WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_ARECEBER_PARCELAS P1'
      '      WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      
        ', (COALESCE( AP.PORCENTAGEM / 100.00, 1.00 ) * (PA.VALOR * (VNDS' +
        '.TOTAL / COALESCE(NULLIF(VND.TOTAL_NOTA,0),1) )) ) CREDITO'
      ', CAST(NULL AS DOUBLE PRECISION) DEBITO'
      'FROM VND_PEDIDOS VND'
      
        'LEFT JOIN VND_PEDIDO_SERVICOS VNDS ON VNDS.KVND_PEDIDO = VND.KVN' +
        'D_PEDIDO'
      
        'LEFT JOIN FIN_ARECEBER           A ON A.TABLENAME = '#39'VND_PEDIDOS' +
        #39' AND A.TABLEKEY = VND.KVND_PEDIDO'
      
        'LEFT JOIN FIN_ARECEBER_PARCELAS  PA ON PA.KFIN_ARECEBER = A.KFIN' +
        '_ARECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = VNDS.KFIN_PLANOCONTA'
      
        'LEFT JOIN FIN_APROPRIACAO  AP ON :USE_APROPRIACAO = '#39'T'#39' AND AP.T' +
        'ABLENAME = '#39'VND_PEDIDO_SERVICOS'#39' AND AP.TABLEKEY  = VNDS.KVND_PE' +
        'DIDO_SERVICO'
      
        'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_C' +
        'ENTROCUSTO'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = VND.KCAD_ENTIDADE'
      'WHERE       ( :CREDITOS = '#39'T'#39' )'
      '  AND ( VND.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( VND.KCAD_ENTIDADE = :KCA' +
        'D_CLIENTE ) )'
      '  AND ( VND.ATIVO = '#39'T'#39' )'
      '  AND ( :PROGRAMACAO_CREDITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL ) '
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF ) '
      
        '  AND ( :PROVISAO_CREDITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO ' +
        'IS NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
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
      ', '#39'C'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', A.HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CAST(NULL AS VARCHAR(64) ) "CENTROCUSTO"'
      ', CAST(  100 AS FLOAT ) PORCENTAGEM'
      ', (CAST (NULL AS FLOAT) ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_ARECEBER_PARCELAS P1'
      '     WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_ARECEBER_PARCELAS P1'
      '      WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', PA.VALOR CREDITO'
      ', CAST(NULL AS DOUBLE PRECISION) DEBITO'
      'FROM FIN_ARECEBER A'
      
        'LEFT JOIN FIN_ARECEBER_PARCELAS PA ON PA.KFIN_ARECEBER = A.KFIN_' +
        'ARECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = A.KFIN_PLANOCONTA'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :CREDITOS = '#39'T'#39' )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :KCAD_' +
        'CLIENTE ) )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( A.TABLENAME = '#39'FIN_FINANCIAMENTOS_GERAL'#39' )'
      '  AND ( :PROGRAMACAO_CREDITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL ) '
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF ) '
      
        '  AND ( :PROVISAO_CREDITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO ' +
        'IS NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
      '  AND (  :TIPOCC = 0  OR  :TIPOCC = 1 )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '            OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :P' +
        'LANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'UNION ALL'
      'SELECT'
      '  A.KCAD_ENTIDADE'
      ', '#39'C'#39' DEBITO_CREDITO'
      ', A.DOCUMENTO'
      ', A.DOCUMENTO_'
      ', COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO )'
      ', A.HISTORICO'
      ', CAST( NULL AS SYS$SMDESCR ) TIPO_PRODUTO'
      ', C.CODIGO'
      ', C.APELIDO'
      ', PC.NOME CONTACONTABIL'
      ', CAST(NULL AS VARCHAR(64) ) "CENTROCUSTO"'
      ', CAST(  100 AS FLOAT ) PORCENTAGEM'
      ', (CAST (NULL AS FLOAT) ) QTDE'
      ', COALESCE ( PA.KFIN_CONTA, A.KFIN_CONTA_PREF ) CONTA'
      ', PA.NUM_CHEQUE'
      ', ( (SELECT COUNT(1)'
      '     FROM FIN_ARECEBER_PARCELAS P1'
      '     WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '              AND P1.VENCTO <= PA.VENCTO'
      '    ) || '#39'/'#39' ||'
      '    ( SELECT COUNT(1)'
      '      FROM FIN_ARECEBER_PARCELAS P1'
      '      WHERE P1.KFIN_ARECEBER = PA.KFIN_ARECEBER'
      '    )'
      '  ) PARCELA'
      ', A.PROVISAO'
      ', PA.VALOR CREDITO'
      ', CAST(NULL AS DOUBLE PRECISION) DEBITO'
      'FROM FIN_ARECEBER A'
      
        'LEFT JOIN FIN_ARECEBER_PARCELAS PA ON PA.KFIN_ARECEBER = A.KFIN_' +
        'ARECEBER'
      
        'LEFT JOIN FIN_PLANOCONTAS  PC ON :USE_PLANOCONTAS = '#39'T'#39' AND  PC.' +
        'KFIN_PLANOCONTA  = A.KFIN_PLANOCONTA'
      'LEFT JOIN CAD_ENTIDADES C ON C.KCAD_ENTIDADE = A.KCAD_ENTIDADE'
      'WHERE'
      '      ( :CREDITOS = '#39'T'#39' )'
      '  AND ( A.KSYS$DOMAIN = :KSYS$DOMAIN )'
      
        '  AND ( ( :TODOS_CLIENTES = '#39'T'#39'  ) OR ( A.KCAD_ENTIDADE = :KCAD_' +
        'CLIENTE ) )'
      '  AND ( A.ATIVO = '#39'T'#39' )'
      '  AND ( A.TABLENAME = '#39'FIN_FINANCIAMENTOS'#39' )'
      '  AND ( :PROGRAMACAO_CREDITO = '#39'T'#39' OR PA.PAGTO IS NOT NULL ) '
      
        '  AND ( COALESCE ( PA.PAGTO, PA.PRORROGACAO, PA.VENCTO ) BETWEEN' +
        ' :DI AND :DF ) '
      
        '  AND ( :PROVISAO_CREDITO = '#39'T'#39' OR A.PROVISAO = '#39'F'#39' OR PA.PAGTO ' +
        'IS NOT NULL ) '
      '  AND ( :TODAS_CONTAS = '#39'T'#39' /*OR_CONTA_IN_LIST*/ )'
      '  AND ( :TIPOCC = 0  OR  :TIPOCC = 1 )'
      '  AND (        (  :TIPOPC = 0 )'
      
        '           OR ( (  :TIPOPC = 1 ) AND (  PC.KFIN_PLANOCONTA = :PL' +
        'ANOCONTA OR PC.CLASSIFICACAO LIKE :CLASSIFICACAO ) )'
      '         )'
      'ORDER BY 3')
    Left = 78
    Top = 100
    object sqlPagamentosRecebimentosKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      FixedChar = True
    end
    object sqlPagamentosRecebimentosDEBITO_CREDITO: TStringField
      FieldName = 'DEBITO_CREDITO'
      Size = 43
    end
    object sqlPagamentosRecebimentosDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 51
    end
    object sqlPagamentosRecebimentosDOCUMENTO_: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO_'
      Size = 52
    end
    object sqlPagamentosRecebimentosDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlPagamentosRecebimentosHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 142
    end
    object sqlPagamentosRecebimentosTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Size = 64
    end
    object sqlPagamentosRecebimentosCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlPagamentosRecebimentosNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object sqlPagamentosRecebimentosCONTACONTABIL: TStringField
      FieldName = 'CONTACONTABIL'
      Size = 64
    end
    object sqlPagamentosRecebimentosNOMECONTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOMECONTA'
      Size = 64
      Calculated = True
    end
    object sqlPagamentosRecebimentosCENTROCUSTO: TStringField
      FieldName = 'CENTROCUSTO'
      Size = 64
    end
    object sqlPagamentosRecebimentosPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlPagamentosRecebimentosQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object sqlPagamentosRecebimentosCONTA: TStringField
      FieldName = 'CONTA'
      FixedChar = True
    end
    object sqlPagamentosRecebimentosNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 32
    end
    object sqlPagamentosRecebimentosPARCELA: TStringField
      FieldName = 'PARCELA'
      Size = 23
    end
    object sqlPagamentosRecebimentosPROVISAO: TStringField
      FieldName = 'PROVISAO'
      FixedChar = True
      Size = 1
    end
    object sqlPagamentosRecebimentosCREDITO: TFloatField
      FieldName = 'CREDITO'
    end
    object sqlPagamentosRecebimentosDEBITO: TFloatField
      FieldName = 'DEBITO'
    end
    object sqlPagamentosRecebimentosCPF_CNPJ: TStringField
      FieldKind = fkCalculated
      FieldName = 'CPF_CNPJ'
      Size = 18
      Calculated = True
    end
  end
  object cdsLstContas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstContas'
    Left = 403
    Top = 21
    object cdsLstContasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Required = True
      FixedChar = True
    end
    object cdsLstContasKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      FixedChar = True
    end
    object cdsLstContasSELECT: TIntegerField
      DisplayLabel = 'Selecionar'
      FieldKind = fkInternalCalc
      FieldName = 'SELECT'
    end
    object cdsLstContasNOME: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOME'
      ReadOnly = True
      Size = 64
    end
    object cdsLstContasBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ReadOnly = True
      Size = 134
    end
    object cdsLstContasAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ReadOnly = True
      Size = 32
    end
    object cdsLstContasCONTA_CORRENTE: TStringField
      DisplayLabel = 'N'#250'mero da conta'
      FieldName = 'CONTA_CORRENTE'
      ReadOnly = True
      Size = 128
    end
  end
  object dspLstContas: TDataSetProvider
    DataSet = sqlLstContas
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 371
    Top = 69
  end
  object sqlLstContas: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '  C.KFIN_CONTA,'
      '  C.KFIN_BANCO,'
      '  C.NOME,'
      '  B.CODIGO || '#39' - '#39' ||  B.NOME BANCO,'
      '  C.AGENCIA,'
      '  C.CONTA_CORRENTE'
      'FROM FIN_CONTAS C'
      'LEFT JOIN FIN_BANCOS B ON B.KFIN_BANCO = C.KFIN_BANCO'
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      '  AND C.ATIVA = '#39'T'#39)
    Left = 406
    Top = 115
    object sqlLstContasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Required = True
      FixedChar = True
    end
    object sqlLstContasKFIN_BANCO: TStringField
      FieldName = 'KFIN_BANCO'
      FixedChar = True
    end
    object sqlLstContasNOME: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object sqlLstContasBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 134
    end
    object sqlLstContasAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Size = 32
    end
    object sqlLstContasCONTA_CORRENTE: TStringField
      DisplayLabel = 'N'#250'mero da conta'
      FieldName = 'CONTA_CORRENTE'
      Size = 128
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
    Left = 232
    Top = 160
    object sqlInfoEntidadeCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 18
    end
  end
  object sqlInfoContas: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KFIN_CONTA'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT NOME from FIN_CONTAS'
      'WHERE KFIN_CONTA = :KFIN_CONTA')
    Left = 332
    Top = 160
    object sqlInfoContasNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 64
    end
  end
end
