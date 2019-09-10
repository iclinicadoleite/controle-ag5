object Zoo_SanidadeBaixarTarefasDatamodule: TZoo_SanidadeBaixarTarefasDatamodule
  OldCreateOrder = True
  Left = 470
  Top = 286
  Height = 303
  Width = 681
  object cdsAnimaisTarefa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnimaisTarefa'
    BeforePost = cdsAnimaisTarefaBeforePost
    Left = 194
    Top = 30
    object cdsAnimaisTarefaKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsAnimaisTarefaKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object cdsAnimaisTarefaBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsAnimaisTarefaNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsAnimaisTarefaNOMEESTABULOGetText
      Size = 60
    end
    object cdsAnimaisTarefaCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 32
    end
    object cdsAnimaisTarefaNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Required = True
      OnGetText = cdsAnimaisTarefaNOMEGetText
      Size = 128
    end
    object cdsAnimaisTarefaDATAPREVISTA: TSQLTimeStampField
      DisplayLabel = 'Data prevista'
      FieldName = 'DATAPREVISTA'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object cdsAnimaisTarefaSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
      OnValidate = cdsAnimaisTarefaSTATUSValidate
    end
    object cdsAnimaisTarefaDATASTATUS: TSQLTimeStampField
      DisplayLabel = 'Data baixa'
      FieldName = 'DATASTATUS'
      OnValidate = cdsAnimaisTarefaDATASTATUSValidate
    end
    object cdsAnimaisTarefaKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object cdsAnimaisTarefaNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsAnimaisTarefaDESCR_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusTarefa
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 32
      Lookup = True
    end
    object cdsAnimaisTarefaREEXECUTAR_EM: TSQLTimeStampField
      DisplayLabel = 'Repetir em'
      FieldName = 'REEXECUTAR_EM'
    end
    object cdsAnimaisTarefaVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object cdsAnimaisTarefaOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      OnGetText = cdsAnimaisTarefaOBSGetText
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 502
    Top = 11
    object cdsTmpDATA: TSQLTimeStampField
      FieldName = 'DATA'
      OnValidate = cdsTmpDATAValidate
    end
    object cdsTmpKANIMAL: TStringField
      FieldName = 'KANIMAL'
      OnValidate = cdsTmpKANIMALValidate
    end
    object cdsTmpKTAREFA: TStringField
      FieldName = 'KTAREFA'
      OnValidate = cdsTmpKTAREFAValidate
    end
    object cdsTmpTAREFA: TStringField
      FieldKind = fkLookup
      FieldName = 'TAREFA'
      LookupDataSet = cdsTarefas
      LookupKeyFields = 'KZOO_TAREFA'
      LookupResultField = 'TAREFA'
      KeyFields = 'KTAREFA'
      Size = 128
      Lookup = True
    end
    object cdsTmpKFUNCIONARIO: TStringField
      FieldName = 'KFUNCIONARIO'
      OnValidate = cdsTmpKFUNCIONARIOValidate
    end
    object cdsTmpNOMEFUNCIONARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMEFUNCIONARIO'
      LookupDataSet = cdsFuncionarios
      LookupKeyFields = 'KCAD_FUNCIONARIO'
      LookupResultField = 'NOMEFUNCIONARIO'
      KeyFields = 'KFUNCIONARIO'
      Size = 128
      Lookup = True
    end
    object cdsTmpSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object cdsTmpDESCR_STATUS: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusTarefa
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 32
      Lookup = True
    end
    object cdsTmpNOMEANIMAL: TStringField
      FieldName = 'NOMEANIMAL'
      Size = 60
    end
  end
  object sqlTarefasAnimal: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'T.KZOO_ANIMAL_TAREFA,  T.KZOO_TAREFA,'#13#10'  T.CODIGO,'#13#10'  T.' +
      'NOME,'#13#10' T.VEZAODIA,  T.DATAPREVISTA, '#13#10'  T.STATUS,'#13#10'  T.DATASTAT' +
      'US, '#13#10'  T.KCAD_FUNCIONARIO,'#13#10'  T.NOMEFUNCIONARIO, T.REEXECUTAR_E' +
      'M, T.OBS '#13#10'FROM  ZOO_ANIMAL_TAREFAS T'#13#10'WHERE  KZOO_ANIMAL = :KZO' +
      'O_ANIMAL'#13#10'AND T.STATUS <= :STATUS_PENDENTE'#13#10'AND T.DATAPREVISTA <' +
      '= :DATA'#13#10'AND T.EXCLUIDO = '#39'F'#39
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 92
    Top = 122
    object sqlTarefasAnimalKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlTarefasAnimalKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlTarefasAnimalCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlTarefasAnimalNOME: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlTarefasAnimalKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlTarefasAnimalNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlTarefasAnimalDATAPREVISTA: TSQLTimeStampField
      DisplayLabel = 'Data prevista'
      FieldName = 'DATAPREVISTA'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sqlTarefasAnimalSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
    end
    object sqlTarefasAnimalDATASTATUS: TSQLTimeStampField
      DisplayLabel = 'Data baixa'
      FieldName = 'DATASTATUS'
    end
    object sqlTarefasAnimalREEXECUTAR_EM: TSQLTimeStampField
      DisplayLabel = 'Repetir em'
      FieldName = 'REEXECUTAR_EM'
    end
    object sqlTarefasAnimalVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object sqlTarefasAnimalOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsTarefasAnimal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspTarefasAnimal'
    BeforePost = cdsTarefasAnimalBeforePost
    Left = 90
    Top = 30
    object cdsTarefasAnimalKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsTarefasAnimalKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
    end
    object cdsTarefasAnimalCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsTarefasAnimalNOME: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      OnGetText = cdsTarefasAnimalNOMEGetText
      Size = 128
    end
    object cdsTarefasAnimalKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
    object cdsTarefasAnimalNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsTarefasAnimalDATAPREVISTA: TSQLTimeStampField
      DisplayLabel = 'Data prevista'
      FieldName = 'DATAPREVISTA'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object cdsTarefasAnimalSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
      Visible = False
      OnValidate = cdsTarefasAnimalSTATUSValidate
    end
    object cdsTarefasAnimalDATASTATUS: TSQLTimeStampField
      DisplayLabel = 'Data baixa'
      FieldName = 'DATASTATUS'
      OnValidate = cdsTarefasAnimalDATASTATUSValidate
    end
    object cdsTarefasAnimalDESCR_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusTarefa
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 32
      Lookup = True
    end
    object cdsTarefasAnimalREEXECUTAR_EM: TSQLTimeStampField
      DisplayLabel = 'Repetir em'
      FieldName = 'REEXECUTAR_EM'
    end
    object cdsTarefasAnimalVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object cdsTarefasAnimalOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      OnGetText = cdsTarefasAnimalOBSGetText
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlAnimaisTarefa: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'T.KZOO_ANIMAL_TAREFA,  T.KZOO_TAREFA,'#13#10'  A.BRINCO,'#13#10'  A.' +
      'NOMEESTABULO,'#13#10'  T.CODIGO,'#13#10'  T.NOME,'#13#10' T.VEZAODIA,  T.DATAPREVI' +
      'STA, '#13#10'  T.STATUS,'#13#10'  T.DATASTATUS, '#13#10'  T.KCAD_FUNCIONARIO,'#13#10'  T' +
      '.NOMEFUNCIONARIO, T.REEXECUTAR_EM, T.OBS '#13#10'FROM  ZOO_ANIMAL_TARE' +
      'FAS T'#13#10'LEFT JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = T.KZOO_ANIMAL'#13 +
      #10'WHERE  A.KCAD_FAZENDA = :KCAD_FAZENDA AND A.STATUS <> :STATUS_D' +
      'ESCARTADO'#13#10'  AND T.KZOO_TAREFA = :KZOO_TAREFA'#13#10'  AND T.STATUS = ' +
      ':STATUS_PENDENTE'#13#10'  AND T.DATAPREVISTA <= :DATA'#13#10'  AND T.EXCLUID' +
      'O = '#39'F'#39
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'KZOO_TAREFA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 196
    Top = 122
    object sqlAnimaisTarefaKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlAnimaisTarefaKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlAnimaisTarefaBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlAnimaisTarefaNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlAnimaisTarefaCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 32
    end
    object sqlAnimaisTarefaNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 128
    end
    object sqlAnimaisTarefaDATAPREVISTA: TSQLTimeStampField
      DisplayLabel = 'Data prevista'
      FieldName = 'DATAPREVISTA'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sqlAnimaisTarefaSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
    end
    object sqlAnimaisTarefaDATASTATUS: TSQLTimeStampField
      DisplayLabel = 'Data baixa'
      FieldName = 'DATASTATUS'
    end
    object sqlAnimaisTarefaKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlAnimaisTarefaNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlAnimaisTarefaREEXECUTAR_EM: TSQLTimeStampField
      DisplayLabel = 'Repetir em'
      FieldName = 'REEXECUTAR_EM'
    end
    object sqlAnimaisTarefaVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object sqlAnimaisTarefaOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsTarefasFuncionario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FUNCIONARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspTarefasFuncionario'
    BeforePost = cdsTarefasFuncionarioBeforePost
    Left = 306
    Top = 30
    object cdsTarefasFuncionarioKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsTarefasFuncionarioKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object cdsTarefasFuncionarioBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object cdsTarefasFuncionarioNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsTarefasFuncionarioCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 32
    end
    object cdsTarefasFuncionarioNOME: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Required = True
      OnGetText = cdsTarefasFuncionarioNOMEGetText
      Size = 128
    end
    object cdsTarefasFuncionarioDATAPREVISTA: TSQLTimeStampField
      DisplayLabel = 'Data prevista'
      FieldName = 'DATAPREVISTA'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object cdsTarefasFuncionarioSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
      OnValidate = cdsTarefasFuncionarioSTATUSValidate
    end
    object cdsTarefasFuncionarioDATASTATUS: TSQLTimeStampField
      DisplayLabel = 'Data baixa'
      FieldName = 'DATASTATUS'
      OnValidate = cdsTarefasFuncionarioDATASTATUSValidate
    end
    object cdsTarefasFuncionarioKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object cdsTarefasFuncionarioDESCR_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'DESCR_STATUS'
      LookupDataSet = cdsStatusTarefa
      LookupKeyFields = 'VALOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 32
      Lookup = True
    end
    object cdsTarefasFuncionarioNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object cdsTarefasFuncionarioREEXECUTAR_EM: TSQLTimeStampField
      DisplayLabel = 'Repetir em'
      FieldName = 'REEXECUTAR_EM'
    end
    object cdsTarefasFuncionarioVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object cdsTarefasFuncionarioOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      OnGetText = cdsTarefasFuncionarioOBSGetText
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlTarefasFuncionario: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'T.KZOO_ANIMAL_TAREFA,  T.KZOO_TAREFA,'#13#10'  A.BRINCO,'#13#10'  A.' +
      'NOMEESTABULO,'#13#10'  T.CODIGO,'#13#10'  T.NOME,'#13#10' T.VEZAODIA,  T.DATAPREVI' +
      'STA, '#13#10'  T.STATUS,'#13#10'  T.DATASTATUS, '#13#10'  T.KCAD_FUNCIONARIO,'#13#10'  T' +
      '.NOMEFUNCIONARIO, T.REEXECUTAR_EM, T.OBS '#13#10'FROM  ZOO_ANIMAL_TARE' +
      'FAS T'#13#10'LEFT JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = T.KZOO_ANIMAL'#13 +
      #10'WHERE A.KCAD_FAZENDA = :KCAD_FAZENDA AND A.STATUS <> :STATUS_DE' +
      'SCARTADO AND T.KCAD_FUNCIONARIO = :KCAD_FUNCIONARIO'#13#10'   AND T.ST' +
      'ATUS = :STATUS_PENDENTE'#13#10'   AND T.DATAPREVISTA <= :DATA'#13#10'   AND ' +
      'T.EXCLUIDO = '#39'F'#39
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_DESCARTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FUNCIONARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS_PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 305
    Top = 122
    object sqlTarefasFuncionarioKZOO_ANIMAL_TAREFA: TStringField
      FieldName = 'KZOO_ANIMAL_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlTarefasFuncionarioKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlTarefasFuncionarioBRINCO: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCO'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object sqlTarefasFuncionarioNOMEESTABULO: TStringField
      DisplayLabel = 'Nome est'#225'bulo'
      FieldName = 'NOMEESTABULO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object sqlTarefasFuncionarioCODIGO: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 32
    end
    object sqlTarefasFuncionarioNOME: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 128
    end
    object sqlTarefasFuncionarioDATAPREVISTA: TSQLTimeStampField
      DisplayLabel = 'Data prevista'
      FieldName = 'DATAPREVISTA'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sqlTarefasFuncionarioSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
    end
    object sqlTarefasFuncionarioDATASTATUS: TSQLTimeStampField
      DisplayLabel = 'Data baixa'
      FieldName = 'DATASTATUS'
    end
    object sqlTarefasFuncionarioKCAD_FUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'KCAD_FUNCIONARIO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object sqlTarefasFuncionarioNOMEFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'NOMEFUNCIONARIO'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
    object sqlTarefasFuncionarioREEXECUTAR_EM: TSQLTimeStampField
      DisplayLabel = 'Repetir em'
      FieldName = 'REEXECUTAR_EM'
    end
    object sqlTarefasFuncionarioVEZAODIA: TIntegerField
      FieldName = 'VEZAODIA'
    end
    object sqlTarefasFuncionarioOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlFuncionarios: TTcSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select DISTINCT T.KCAD_FUNCIONARIO, T.NOMEFUNCIONARIO'#13#10'from ZOO_' +
      'ANIMAL_TAREFAS T'#13#10'LEFT JOIN ZOO_ANIMAIS A  ON A.KZOO_ANIMAL = T.' +
      'KZOO_ANIMAL'#13#10'WHERE T.DATAPREVISTA <= :DATA AND A.KCAD_FAZENDA = ' +
      ':KCAD_FAZENDA AND T.STATUS < 2'#13#10'AND T.EXCLUIDO = '#39'F'#39
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 493
    Top = 202
    object sqlFuncionariosKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object sqlFuncionariosNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
  end
  object sqlTarefas: TTcSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select DISTINCT T.KZOO_TAREFA, T.CODIGO || '#39' '#39' || T.NOME TAREFA'#13 +
      #10'from ZOO_ANIMAL_TAREFAS TA'#13#10'INNER JOIN ZOO_TAREFAS  T ON T.KZOO' +
      '_TAREFA = TA.KZOO_TAREFA'#13#10'INNER JOIN ZOO_ANIMAIS A  ON A.KZOO_AN' +
      'IMAL = TA.KZOO_ANIMAL'#13#10'WHERE TA.DATAPREVISTA <= :DATA AND A.KCAD' +
      '_FAZENDA = :KCAD_FAZENDA AND TA.STATUS < 2'#13#10'AND TA.EXCLUIDO = '#39'F' +
      #39
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 581
    Top = 200
    object sqlTarefasKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object sqlTarefasTAREFA: TStringField
      FieldName = 'TAREFA'
      Required = True
      Size = 161
    end
  end
  object dspFuncionarios: TDataSetProvider
    DataSet = sqlFuncionarios
    Left = 437
    Top = 155
  end
  object dspTarefas: TDataSetProvider
    DataSet = sqlTarefas
    Left = 557
    Top = 154
  end
  object cdsFuncionarios: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionarios'
    Left = 493
    Top = 106
    object cdsFuncionariosKCAD_FUNCIONARIO: TStringField
      FieldName = 'KCAD_FUNCIONARIO'
      FixedChar = True
    end
    object cdsFuncionariosNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 128
    end
  end
  object cdsTarefas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspTarefas'
    Left = 593
    Top = 110
    object cdsTarefasKZOO_TAREFA: TStringField
      FieldName = 'KZOO_TAREFA'
      FixedChar = True
    end
    object cdsTarefasTAREFA: TStringField
      FieldName = 'TAREFA'
      Required = True
      Size = 161
    end
  end
  object dspTarefasAnimal: TDataSetProvider
    DataSet = sqlTarefasAnimal
    Options = [poIncFieldProps, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 65
    Top = 77
  end
  object dspAnimaisTarefa: TDataSetProvider
    DataSet = sqlAnimaisTarefa
    Options = [poIncFieldProps, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 170
    Top = 77
  end
  object dspTarefasFuncionario: TDataSetProvider
    DataSet = sqlTarefasFuncionario
    Options = [poIncFieldProps, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 284
    Top = 77
  end
  object cdsStatusTarefa: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 569
    Top = 11
    Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    object cdsStatusTarefaTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsStatusTarefaVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsStatusTarefaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsStatusTarefaORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
