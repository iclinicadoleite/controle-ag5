object Zoo_SanidadeDiagnosticosDatamodule: TZoo_SanidadeDiagnosticosDatamodule
  OldCreateOrder = False
  Height = 381
  Width = 672
  object cdsDiagnosticoAplicar: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforePost = cdsDiagnosticoAplicarBeforePost
    OnNewRecord = cdsDiagnosticoAplicarNewRecord
    Left = 47
    Top = 63
    object cdsDiagnosticoAplicarKZOO_DIAGNOSTICO_APLICAR: TStringField
      FieldName = 'KZOO_DIAGNOSTICO_APLICAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsDiagnosticoAplicarBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      Size = 15
    end
    object cdsDiagnosticoAplicarDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsDiagnosticoAplicarKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      Visible = False
      OnChange = cdsDiagnosticoAplicarKZOO_DIAGNOSTICOChange
      FixedChar = True
    end
    object cdsDiagnosticoAplicarNOME_DIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldKind = fkLookup
      FieldName = 'NOME_DIAGNOSTICO'
      LookupDataSet = cdsDiagnosticosDisponiveis
      LookupKeyFields = 'KZOO_DIAGNOSTICO'
      LookupResultField = 'NOME'
      KeyFields = 'KZOO_DIAGNOSTICO'
      Size = 32
      Lookup = True
    end
    object cdsDiagnosticoAplicarQUARTO: TSmallintField
      DisplayLabel = 'Quarto'
      FieldName = 'QUARTO'
      Visible = False
    end
    object cdsDiagnosticoAplicarKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Visible = False
      OnChange = cdsDiagnosticoAplicarKZOO_PROTOCOLOChange
      FixedChar = True
    end
    object cdsDiagnosticoAplicarCODIGO_PROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldKind = fkLookup
      FieldName = 'CODIGO_PROTOCOLO'
      LookupDataSet = cdsProtocolosDisponiveis
      LookupKeyFields = 'KZOO_PROTOCOLO'
      LookupResultField = 'CODIGO'
      KeyFields = 'KZOO_PROTOCOLO'
      Visible = False
      Size = 32
      Lookup = True
    end
    object cdsDiagnosticoAplicarDESC_PROTOCOLO: TStringField
      DisplayLabel = 'Procotolo'
      FieldKind = fkInternalCalc
      FieldName = 'DESC_PROTOCOLO'
      Size = 50
    end
    object cdsDiagnosticoAplicarQUARTO_DESCR: TStringField
      DisplayLabel = 'Quarto'
      DisplayWidth = 6
      FieldKind = fkLookup
      FieldName = 'QUARTO_DESCR'
      LookupDataSet = cdsQuartoDisponiveis
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'QUARTO'
      Size = 32
      Lookup = True
    end
    object cdsDiagnosticoAplicarKLAST_PROTOCOLO: TStringField
      FieldName = 'KLAST_PROTOCOLO'
      Visible = False
    end
    object cdsDiagnosticoAplicarCOUNT_TAREFAS: TIntegerField
      FieldName = 'COUNT_TAREFAS'
      Visible = False
    end
    object cdsDiagnosticoAplicarDESCR_TAREFAS: TStringField
      DisplayLabel = 'Tarefas'
      DisplayWidth = 100
      FieldName = 'DESCR_TAREFAS'
      Size = 500
    end
    object cdsDiagnosticoAplicarKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'KCAD_FUNCIONARIO'
      Visible = False
    end
    object cdsDiagnosticoAplicarNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = cdsDiagnosticoAplicarNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsDiagnosticoAplicarPROCESSED: TStringField
      FieldName = 'PROCESSED'
      Visible = False
      Size = 1
    end
    object cdsDiagnosticoAplicarTarefas: TDataSetField
      FieldName = 'Tarefas'
      Visible = False
    end
  end
  object cdsDiagnosticosDisponiveis: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDiagnosticos'
    Left = 584
    Top = 9
    object cdsDiagnosticosDisponiveisKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsDiagnosticosDisponiveisCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsDiagnosticosDisponiveisNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsDiagnosticosDisponiveisPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsProtocolosDisponiveis: TClientDataSet
    Aggregates = <>
    Params = <>
    OnFilterRecord = cdsProtocolosDisponiveisFilterRecord
    Left = 586
    Top = 58
    object cdsProtocolosDisponiveisKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsProtocolosDisponiveisKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object cdsProtocolosDisponiveisCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 33
    end
    object cdsProtocolosDisponiveisVINCULADO: TStringField
      FieldName = 'VINCULADO'
    end
  end
  object cdsDiagnosticosPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDiagnosticosPadrao'
    Left = 211
    Top = 220
    object cdsDiagnosticosPadraoKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsDiagnosticosPadraoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsDiagnosticosPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsDiagnosticosPadraoPOR_QUARTO: TStringField
      FieldName = 'POR_QUARTO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsProtocolosPadrao: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    OnFilterRecord = cdsProtocolosPadraoFilterRecord
    Left = 332
    Top = 221
    object cdsProtocolosPadraoKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      FixedChar = True
    end
    object cdsProtocolosPadraoKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      FixedChar = True
    end
    object cdsProtocolosPadraoCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 33
    end
    object cdsProtocolosPadraoVINCULADO: TStringField
      FieldName = 'VINCULADO'
    end
  end
  object cdsQuartoDisponiveis: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 584
    Top = 109
    object cdsQuartoDisponiveisTIPO: TStringField
      FieldName = 'TIPO'
      Size = 31
    end
    object cdsQuartoDisponiveisVALOR: TStringField
      FieldName = 'VALOR'
      Size = 31
    end
    object cdsQuartoDisponiveisDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 31
    end
    object cdsQuartoDisponiveisORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsQuartoPadrao: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 437
    Top = 221
    object cdsQuartoPadraoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsQuartoPadraoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsQuartoPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsQuartoPadraoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object dtsDiagnosticos: TDataSource
    DataSet = cdsDiagnosticosDisponiveis
    Left = 474
    Top = 8
  end
  object dtsPadroes: TDataSource
    DataSet = cdsPadroes
    OnDataChange = dtsPadroesDataChange
    Left = 24
    Top = 234
  end
  object cdsPadroes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 280
    object cdsPadroesDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsPadroesKZOO_DIAGNOSTICO: TStringField
      FieldName = 'KZOO_DIAGNOSTICO'
      Visible = False
      FixedChar = True
    end
    object cdsPadroesNOME_DIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldKind = fkLookup
      FieldName = 'NOME_DIAGNOSTICO'
      LookupDataSet = cdsDiagnosticosPadrao
      LookupKeyFields = 'KZOO_DIAGNOSTICO'
      LookupResultField = 'NOME'
      KeyFields = 'KZOO_DIAGNOSTICO'
      Size = 32
      Lookup = True
    end
    object cdsPadroesQUARTOS: TStringField
      DisplayLabel = 'Quarto'
      DisplayWidth = 11
      FieldName = 'QUARTOS'
      Size = 11
    end
    object cdsPadroesKZOO_PROTOCOLO: TStringField
      FieldName = 'KZOO_PROTOCOLO'
      Visible = False
      FixedChar = True
    end
    object cdsPadroesCODIGO_PROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldKind = fkLookup
      FieldName = 'CODIGO_PROTOCOLO'
      LookupDataSet = cdsProtocolosPadrao
      LookupKeyFields = 'KZOO_PROTOCOLO'
      LookupResultField = 'CODIGO'
      KeyFields = 'KZOO_PROTOCOLO'
      Size = 32
      Lookup = True
    end
    object cdsPadroesKLAST_PROTOCOLO: TStringField
      FieldName = 'KLAST_PROTOCOLO'
    end
    object cdsPadroesKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
    end
    object cdsPadroesNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      OnSetText = cdsPadroesNOMEFUNCIONARIOSetText
      Size = 128
    end
    object cdsPadroesCOUNT_TAREFAS: TIntegerField
      FieldName = 'COUNT_TAREFAS'
    end
    object cdsPadroesDESCR_TAREFAS: TStringField
      FieldName = 'DESCR_TAREFAS'
      Size = 500
    end
  end
  object dtsDiagnosticoAplicar: TDataSource
    DataSet = cdsDiagnosticoAplicar
    OnDataChange = dtsDiagnosticoAplicarDataChange
    Left = 47
    Top = 16
  end
  object cdsTarefasPadrao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 532
    Top = 223
    object cdsTarefasPadraoKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      Visible = False
      FixedChar = True
    end
    object cdsTarefasPadraoCHECKED: TIntegerField
      DisplayLabel = ' '
      FieldName = 'CHECKED'
      OnChange = cdsTarefasPadraoCHECKEDChange
    end
    object cdsTarefasPadraoDEFAULT: TStringField
      FieldName = 'DEFAULT'
      Size = 1
    end
    object cdsTarefasPadraoEXAME: TStringField
      FieldName = 'EXAME'
      Size = 1
    end
    object cdsTarefasPadraoCODIGO: TStringField
      FieldName = 'CODIGO'
      Visible = False
      Size = 32
    end
    object cdsTarefasPadraoNOME: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsTarefasPadraoDIA: TSmallintField
      DisplayLabel = 'Dia'
      FieldName = 'DIA'
    end
    object cdsTarefasPadraoVEZES: TIntegerField
      FieldName = 'VEZES'
    end
    object cdsTarefasPadraoREPLICAR: TIntegerField
      FieldName = 'REPLICAR'
    end
    object cdsTarefasPadraoINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object cdsTarefasPadraoDESCARTELEITE: TSmallintField
      DisplayLabel = 'Descarte leite/carne'
      FieldName = 'DESCARTELEITE'
    end
    object cdsTarefasPadraoDESCARTECARNE: TSmallintField
      DisplayLabel = 'Descarte carne'
      FieldName = 'DESCARTECARNE'
    end
  end
  object cdsTarefas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsDiagnosticoAplicarTarefas
    Params = <>
    Left = 140
    Top = 62
    object cdsTarefasKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object cdsTarefasCHECKED: TIntegerField
      DisplayLabel = ' '
      FieldName = 'CHECKED'
      OnChange = cdsTarefasCHECKEDChange
    end
    object cdsTarefasDEFAULT: TStringField
      FieldName = 'DEFAULT'
      Size = 1
    end
    object cdsTarefasEXAME: TStringField
      FieldName = 'EXAME'
      Size = 1
    end
    object cdsTarefasCODIGO: TStringField
      FieldName = 'CODIGO'
      Visible = False
      Size = 32
    end
    object cdsTarefasNOME: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsTarefasDIA: TSmallintField
      DisplayLabel = 'Dia'
      FieldName = 'DIA'
    end
    object cdsTarefasVEZES: TIntegerField
      FieldName = 'VEZES'
    end
    object cdsTarefasREPLICAR: TIntegerField
      FieldName = 'REPLICAR'
    end
    object cdsTarefasINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object cdsTarefasDESCARTELEITE: TSmallintField
      DisplayLabel = 'Descarte leite/carne'
      FieldName = 'DESCARTELEITE'
    end
    object cdsTarefasDESCARTECARNE: TSmallintField
      DisplayLabel = 'Descarte carne'
      FieldName = 'DESCARTECARNE'
    end
    object cdsTarefasOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
end
