object dtmCAD_Fornecedores: TdtmCAD_Fornecedores
  OldCreateOrder = True
  Height = 396
  Width = 1153
  object cdsLstEntidades: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_FUNCIONARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_TRANSPORTADORA'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstEntidades'
    BeforeOpen = cdsLstEntidadesBeforeOpen
    OnNewRecord = cdsLstEntidadesNewRecord
    Left = 55
    Top = 44
    object cdsLstEntidadesKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstEntidadesCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsLstEntidadesAPELIDO: TStringField
      DisplayLabel = 'Apelido/Nome fantasia'
      FieldName = 'APELIDO'
      Size = 128
    end
    object cdsLstEntidadesNOME: TStringField
      DisplayLabel = 'Nome/Raz'#227'o social'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsLstEntidadesCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 18
    end
    object cdsLstEntidadesATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      OnGetText = cdsLstEntidadesATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsLstEntidadesSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstEntidadesSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object cdsLstEntidadesSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsLstEntidadesSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object cdsEntidade: TClientDataSet
    Aggregates = <>
    Constraints = <
      item
        CustomConstraint = 'NOME <> '#39#39
        ErrorMessage = 'O campo '#39'Nome / Raz'#227'o Social'#39' deve ser preenchido'
        FromDictionary = False
      end>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspEntidade'
    BeforeInsert = cdsEntidadeBeforeInsert
    BeforeDelete = cdsEntidadeBeforeDelete
    OnCalcFields = cdsEntidadeCalcFields
    OnNewRecord = cdsEntidadeNewRecord
    Left = 183
    Top = 44
    object cdsEntidadeKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsEntidadeKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsEntidadeCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsEntidadeNOME: TStringField
      DisplayLabel = 'Nome/Raz'#227'o social'
      FieldName = 'NOME'
      Required = True
      OnSetText = cdsEntidadeNOMESetText
      Size = 128
    end
    object cdsEntidadeAPELIDO: TStringField
      DisplayLabel = 'Apelido/Nome Fantasia'
      FieldName = 'APELIDO'
      Required = True
      OnSetText = cdsEntidadeAPELIDOSetText
      Size = 128
    end
    object cdsEntidadeATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEntidadeKENDERECO: TStringField
      FieldName = 'KENDERECO'
      FixedChar = True
    end
    object cdsEntidadePESSOA: TStringField
      DisplayLabel = 'Pessoa'
      FieldName = 'PESSOA'
      Required = True
      OnChange = cdsEntidadePESSOAChange
      FixedChar = True
      Size = 1
    end
    object cdsEntidadeRG_IE: TStringField
      DisplayLabel = 'RG/IE'
      FieldName = 'RG_IE'
    end
    object cdsEntidadeCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      OnValidate = cdsEntidadeCPF_CNPJValidate
      FixedChar = True
      Size = 18
    end
    object cdsEntidadeURL: TStringField
      DisplayLabel = 'Site'
      FieldName = 'URL'
      Size = 64
    end
    object cdsEntidadeEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      OnValidate = cdsEntidadeEMAILValidate
      Size = 64
    end
    object cdsEntidadeIS_CLIENTE: TStringField
      FieldName = 'IS_CLIENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEntidadeIS_FORNECEDOR: TStringField
      FieldName = 'IS_FORNECEDOR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEntidadeIS_FUNCIONARIO: TStringField
      FieldName = 'IS_FUNCIONARIO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEntidadeIS_TRANSPORTADORA: TStringField
      FieldName = 'IS_TRANSPORTADORA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEntidadeOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsEntidadeFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FONE'
      OnSetText = cdsEntidadeFONESetText
      EditMask = '!\(99\)\ 99999-9999;1;_'
      Size = 18
    end
    object cdsEntidadeRAMAL: TStringField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL'
      Size = 18
    end
    object cdsEntidadeFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      EditMask = '!\(99\)\ 99999-9999;1;_'
      Size = 18
    end
    object cdsEntidadesqlEndereco: TDataSetField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'sqlEndereco'
    end
    object cdsEntidadesqlOutrosEnderecos: TDataSetField
      DisplayLabel = 'Outros endere'#231'os'
      FieldName = 'sqlOutrosEnderecos'
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstEntidades
    Left = 120
    Top = 8
  end
  object cdsEndereco: TClientDataSet
    Aggregates = <>
    DataSetField = cdsEntidadesqlEndereco
    Params = <>
    BeforeInsert = cdsEnderecoBeforeInsert
    OnNewRecord = cdsEnderecoNewRecord
    Left = 270
    Top = 45
    object cdsEnderecoKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsEnderecoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsEnderecoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      Required = True
      FixedChar = True
    end
    object cdsEnderecoENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 128
    end
    object cdsEnderecoNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Size = 8
    end
    object cdsEnderecoCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 64
    end
    object cdsEnderecoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 64
    end
    object cdsEnderecoCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99999\-999;1;_'
      FixedChar = True
      Size = 9
    end
    object cdsEnderecoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 64
    end
    object cdsEnderecoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsEnderecoCXPOSTAL: TStringField
      DisplayLabel = 'Cx. Postal'
      FieldName = 'CXPOSTAL'
      Size = 16
    end
    object cdsEnderecoCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 32
    end
    object cdsEnderecoFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FONE'
      EditMask = '(99) 9999-9999'
      Size = 18
    end
  end
  object cdsEnderecoCobranca: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeInsert = cdsEnderecoCobrancaBeforeInsert
    OnNewRecord = cdsEnderecoCobrancaNewRecord
    Left = 366
    Top = 45
    object cdsEnderecoCobrancaKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsEnderecoCobrancaTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsEnderecoCobrancaTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      Required = True
      FixedChar = True
    end
    object cdsEnderecoCobrancaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 128
    end
    object cdsEnderecoCobrancaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object cdsEnderecoCobrancaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 64
    end
    object cdsEnderecoCobrancaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 64
    end
    object cdsEnderecoCobrancaCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsEnderecoCobrancaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 64
    end
    object cdsEnderecoCobrancaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsEnderecoCobrancaCXPOSTAL: TStringField
      FieldName = 'CXPOSTAL'
      Size = 16
    end
  end
  object cdsEnderecoEntrega: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeInsert = cdsEnderecoEntregaBeforeInsert
    OnNewRecord = cdsEnderecoEntregaNewRecord
    Left = 477
    Top = 44
    object cdsEnderecoEntregaKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsEnderecoEntregaTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsEnderecoEntregaTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      Required = True
      FixedChar = True
    end
    object cdsEnderecoEntregaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 128
    end
    object cdsEnderecoEntregaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object cdsEnderecoEntregaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 64
    end
    object cdsEnderecoEntregaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 64
    end
    object cdsEnderecoEntregaCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsEnderecoEntregaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 64
    end
    object cdsEnderecoEntregaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsEnderecoEntregaCXPOSTAL: TStringField
      FieldName = 'CXPOSTAL'
      Size = 16
    end
  end
  object cdsOutrosEnderecos: TClientDataSet
    Aggregates = <>
    DataSetField = cdsEntidadesqlOutrosEnderecos
    Params = <>
    BeforeInsert = cdsOutrosEnderecosBeforeInsert
    OnNewRecord = cdsOutrosEnderecosNewRecord
    Left = 597
    Top = 44
    object cdsOutrosEnderecosKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsOutrosEnderecosTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsOutrosEnderecosTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      Required = True
      FixedChar = True
    end
    object cdsOutrosEnderecosENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 128
    end
    object cdsOutrosEnderecosNUMERO: TStringField
      DisplayLabel = 'No'
      FieldName = 'NUMERO'
      Size = 8
    end
    object cdsOutrosEnderecosCOMPLEMENTO: TStringField
      DisplayLabel = 'Compl.'
      FieldName = 'COMPLEMENTO'
      Size = 64
    end
    object cdsOutrosEnderecosBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 64
    end
    object cdsOutrosEnderecosCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99999\-999;1;_'
      FixedChar = True
      Size = 9
    end
    object cdsOutrosEnderecosCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 64
    end
    object cdsOutrosEnderecosUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsOutrosEnderecosCXPOSTAL: TStringField
      DisplayLabel = 'Cx.Postal'
      FieldName = 'CXPOSTAL'
      Size = 16
    end
    object cdsOutrosEnderecosCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 32
    end
    object cdsOutrosEnderecosFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FONE'
      EditMask = '(99) 9999-9999'
      Size = 18
    end
  end
  object cdsContatos: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeInsert = cdsContatosBeforeInsert
    OnNewRecord = cdsContatosNewRecord
    Left = 693
    Top = 44
    object cdsContatosKCAD_CONTATO: TIntegerField
      FieldName = 'KCAD_CONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContatosKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Required = True
      FixedChar = True
    end
    object cdsContatosNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsContatosDEPTO: TStringField
      FieldName = 'DEPTO'
      Size = 32
    end
    object cdsContatosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 64
    end
    object cdsContatosCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 32
    end
    object cdsContatosFONE1: TStringField
      DisplayLabel = 'Telefone 1'
      FieldName = 'FONE1'
      Size = 32
    end
    object cdsContatosFONE2: TStringField
      DisplayLabel = 'Telefone 2'
      FieldName = 'FONE2'
      Size = 32
    end
    object cdsContatosFAX: TStringField
      FieldName = 'FAX'
      Size = 32
    end
  end
  object sqlLstEntidades: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'DSP_INATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_FUNCIONARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DSP_TRANSPORTADORA'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT  '
      '  KCAD_ENTIDADE, '
      '  CODIGO, '
      '  ATIVO, '
      '  APELIDO, '
      '  NOME,'
      '  CPF_CNPJ,'
      '  SYS$UI, '
      '  SYS$DI, '
      '  SYS$UU,'
      '  SYS$DU'
      'FROM CAD_ENTIDADES'
      'WHERE ( :DSP_INATIVO = '#39'T'#39' OR ATIVO = '#39'T'#39' )'
      '  AND ( SYS$DELETED <> '#39'T'#39' )'
      '  AND ( '
      '             ( :DSP_CLIENTE = '#39'T'#39' AND IS_CLIENTE = '#39'T'#39' )'
      '       OR ( :DSP_FORNECEDOR = '#39'T'#39' AND IS_FORNECEDOR = '#39'T'#39' )'
      '       OR ( :DSP_FUNCIONARIO = '#39'T'#39' AND IS_FUNCIONARIO = '#39'T'#39' )'
      
        '       OR ( :DSP_TRANSPORTADORA = '#39'T'#39' AND IS_TRANSPORTADORA = '#39'T' +
        #39' )'
      '  )')
    Left = 53
    Top = 140
    object sqlLstEntidadesKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlLstEntidadesCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlLstEntidadesATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlLstEntidadesAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 128
    end
    object sqlLstEntidadesNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object sqlLstEntidadesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 18
    end
    object sqlLstEntidadesSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstEntidadesSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object sqlLstEntidadesSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstEntidadesSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object sqlEntidade: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT  '
      '  E.KCAD_ENTIDADE,'
      '  E.KSYS$DOMAIN, '
      '  E.CODIGO, '
      '  E.APELIDO, '
      '  E.NOME, '
      '  E.ATIVO, '
      '  E.KENDERECO, '
      '  E.PESSOA, '
      '  E.CPF_CNPJ, '
      '  E.RG_IE, '
      '  E.URL, '
      '  E.EMAIL, '
      '  E.IS_CLIENTE, '
      '  E.IS_FORNECEDOR,'
      '  E.IS_FUNCIONARIO, '
      '  E.IS_TRANSPORTADORA, '
      '  E.OBS, '
      '  E.FONE, '
      '  E.RAMAL, '
      '  E.FAX'
      'FROM CAD_ENTIDADES E'
      'WHERE E.KCAD_ENTIDADE = :KCAD_ENTIDADE')
    Left = 173
    Top = 139
    object sqlEntidadeKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlEntidadeKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlEntidadeCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlEntidadeNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlEntidadeAPELIDO: TStringField
      DisplayLabel = 'Nome Fantasia/Apelido'
      FieldName = 'APELIDO'
      Required = True
      Size = 128
    end
    object sqlEntidadeATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEntidadeKENDERECO: TStringField
      FieldName = 'KENDERECO'
      FixedChar = True
    end
    object sqlEntidadePESSOA: TStringField
      FieldName = 'PESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEntidadeCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 18
    end
    object sqlEntidadeRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object sqlEntidadeURL: TStringField
      FieldName = 'URL'
      Size = 64
    end
    object sqlEntidadeEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 64
    end
    object sqlEntidadeIS_CLIENTE: TStringField
      FieldName = 'IS_CLIENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEntidadeIS_FORNECEDOR: TStringField
      FieldName = 'IS_FORNECEDOR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEntidadeIS_FUNCIONARIO: TStringField
      FieldName = 'IS_FUNCIONARIO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEntidadeIS_TRANSPORTADORA: TStringField
      FieldName = 'IS_TRANSPORTADORA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEntidadeOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqlEntidadeFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FONE'
      Size = 18
    end
    object sqlEntidadeRAMAL: TStringField
      FieldName = 'RAMAL'
      Size = 18
    end
    object sqlEntidadeFAX: TStringField
      FieldName = 'FAX'
      Size = 18
    end
  end
  object dtsSQLEdit: TDataSource
    DataSet = sqlEntidade
    Left = 214
    Top = 186
  end
  object sqlEndereco: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KENDERECO'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'select '
      '  E.TABLENAME,'
      '  E.TABLEKEY,'
      '  E.KGLB_ENDERECO,  '
      '  E.ENDERECO, '
      '  E.NUMERO, '
      '  E.COMPLEMENTO, '
      '  E.BAIRRO, '
      '  E.CEP,  '
      '  E.CIDADE, '
      '  E.UF, '
      '  E.CXPOSTAL,'
      '  E.CONTATO,'
      '  E.FONE'
      'from GLB_ENDERECOS E'
      'WHERE  E.KGLB_ENDERECO = :KENDERECO')
    Left = 265
    Top = 143
    object sqlEnderecoKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlEnderecoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Required = True
      Size = 32
    end
    object sqlEnderecoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      Required = True
      FixedChar = True
    end
    object sqlEnderecoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 128
    end
    object sqlEnderecoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object sqlEnderecoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 64
    end
    object sqlEnderecoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 64
    end
    object sqlEnderecoCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object sqlEnderecoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 64
    end
    object sqlEnderecoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sqlEnderecoCXPOSTAL: TStringField
      FieldName = 'CXPOSTAL'
      Size = 16
    end
    object sqlEnderecoCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 32
    end
    object sqlEnderecoFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FONE'
      Size = 18
    end
  end
  object sqlEnderecoCobranca: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KENDERECOCOBRANCA'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'select '
      '  E.TABLENAME,'
      '  E.TABLEKEY,'
      '  E.KGLB_ENDERECO,  '
      '  E.ENDERECO, '
      '  E.NUMERO, '
      '  E.COMPLEMENTO, '
      '  E.BAIRRO, '
      '  E.CEP,  '
      '  E.CIDADE, '
      '  E.UF, '
      '  E.CXPOSTAL '
      'from GLB_ENDERECOS E'
      'WHERE  E.KGLB_ENDERECO = :KENDERECOCOBRANCA')
    Left = 365
    Top = 143
    object sqlEnderecoCobrancaKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlEnderecoCobrancaTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Required = True
      Size = 32
    end
    object sqlEnderecoCobrancaTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      Required = True
      FixedChar = True
    end
    object sqlEnderecoCobrancaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 128
    end
    object sqlEnderecoCobrancaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object sqlEnderecoCobrancaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 64
    end
    object sqlEnderecoCobrancaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 64
    end
    object sqlEnderecoCobrancaCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object sqlEnderecoCobrancaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 64
    end
    object sqlEnderecoCobrancaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sqlEnderecoCobrancaCXPOSTAL: TStringField
      FieldName = 'CXPOSTAL'
      Size = 16
    end
  end
  object sqlEnderecoEntrega: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KENDERECOENTREGA'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'select '
      '  E.KGLB_ENDERECO,  '
      '  E.TABLENAME,'
      '  E.TABLEKEY,'
      '  E.ENDERECO, '
      '  E.NUMERO, '
      '  E.COMPLEMENTO, '
      '  E.BAIRRO, '
      '  E.CEP,  '
      '  E.CIDADE, '
      '  E.UF, '
      '  E.CXPOSTAL '
      'from GLB_ENDERECOS E'
      'WHERE  E.KGLB_ENDERECO = :KENDERECOENTREGA')
    Left = 475
    Top = 141
    object sqlEnderecoEntregaKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlEnderecoEntregaTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Required = True
      Size = 32
    end
    object sqlEnderecoEntregaTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      Required = True
      FixedChar = True
    end
    object sqlEnderecoEntregaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 128
    end
    object sqlEnderecoEntregaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object sqlEnderecoEntregaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 64
    end
    object sqlEnderecoEntregaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 64
    end
    object sqlEnderecoEntregaCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object sqlEnderecoEntregaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 64
    end
    object sqlEnderecoEntregaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sqlEnderecoEntregaCXPOSTAL: TStringField
      FieldName = 'CXPOSTAL'
      Size = 16
    end
  end
  object sqlOutrosEnderecos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KENDERECO'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'select '
      '  E.KGLB_ENDERECO,  '
      '  E.TABLENAME,'
      '  E.TABLEKEY,'
      '  E.ENDERECO, '
      '  E.NUMERO, '
      '  E.COMPLEMENTO, '
      '  E.BAIRRO, '
      '  E.CEP,  '
      '  E.CIDADE, '
      '  E.UF, '
      '  E.CXPOSTAL,'
      '  E.CONTATO,'
      '  E.FONE'
      'from GLB_ENDERECOS E'
      'WHERE  '
      '  E.TABLENAME = '#39'CAD_ENTIDADES'#39
      'AND  E.TABLEKEY = :KCAD_ENTIDADE'
      'AND ( '
      'COALESCE ( E.KGLB_ENDERECO, CAST('#39#39' AS CHAR(22)) ) not in ( '
      '   COALESCE ( :KENDERECO, CAST('#39#39' AS CHAR(22)) )'
      '   ) )')
    Left = 595
    Top = 141
    object sqlOutrosEnderecosKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlOutrosEnderecosTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Required = True
      Size = 32
    end
    object sqlOutrosEnderecosTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      Required = True
      FixedChar = True
    end
    object sqlOutrosEnderecosENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 128
    end
    object sqlOutrosEnderecosNUMERO: TStringField
      DisplayLabel = 'No'
      FieldName = 'NUMERO'
      Size = 8
    end
    object sqlOutrosEnderecosCOMPLEMENTO: TStringField
      DisplayLabel = 'Compl.'
      FieldName = 'COMPLEMENTO'
      Size = 64
    end
    object sqlOutrosEnderecosBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 64
    end
    object sqlOutrosEnderecosCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object sqlOutrosEnderecosCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 64
    end
    object sqlOutrosEnderecosUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sqlOutrosEnderecosCXPOSTAL: TStringField
      DisplayLabel = 'Cx.Postal'
      FieldName = 'CXPOSTAL'
      Size = 16
    end
    object sqlOutrosEnderecosCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 32
    end
    object sqlOutrosEnderecosFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FONE'
      Size = 18
    end
  end
  object sqlContatos: TTcSQLDataSet
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
      'select'
      '  KCAD_CONTATO, '
      '  KCAD_ENTIDADE, '
      '  NOME, '
      '  DEPTO, '
      '  EMAIL, '
      '  CELULAR, '
      '  FONE1, '
      '  FONE2, '
      '  FAX'
      'from CAD_CONTATOS'
      'WHERE KCAD_ENTIDADE = :KCAD_ENTIDADE')
    Left = 691
    Top = 141
    object sqlContatosKCAD_CONTATO: TIntegerField
      FieldName = 'KCAD_CONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlContatosKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      Required = True
      FixedChar = True
    end
    object sqlContatosNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object sqlContatosDEPTO: TStringField
      FieldName = 'DEPTO'
      Size = 32
    end
    object sqlContatosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 64
    end
    object sqlContatosCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 32
    end
    object sqlContatosFONE1: TStringField
      DisplayLabel = 'Telefone 1'
      FieldName = 'FONE1'
      Size = 32
    end
    object sqlContatosFONE2: TStringField
      DisplayLabel = 'Telefone 2'
      FieldName = 'FONE2'
      Size = 32
    end
    object sqlContatosFAX: TStringField
      FieldName = 'FAX'
      Size = 32
    end
  end
  object dspLstEntidades: TDataSetProvider
    DataSet = sqlLstEntidades
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 26
    Top = 92
  end
  object dspEntidade: TDataSetProvider
    DataSet = sqlEntidade
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspEntidadeBeforeUpdateRecord
    Left = 138
    Top = 92
  end
  object sqlDadosFinanceiro: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT  '
      '  E.KCAD_ENTIDADE,'
      '  E.CODIGO, '
      '  E.APELIDO, '
      '  E.NOME, '
      '  E.KFIN_PLANOCONTA, '
      '  E.BANCO, '
      '  E.AGENCIA, '
      '  E.CONTA, '
      '  PC.NOME DESCR_PC_NOME,'
      '  PC.CODIGO DESCR_PC_CODIGO,'
      '  PC.CLASSIFICACAO DESCR_PC_CLASSIFICACAO,'
      '  PC.TIPO_APRD DESCR_PC_TIPO_APRD'
      'FROM CAD_ENTIDADES E'
      
        'LEFT JOIN FIN_PLANOCONTAS PC ON PC.KFIN_PLANOCONTA = E.KFIN_PLAN' +
        'OCONTA'
      'WHERE E.KCAD_ENTIDADE = :KCAD_ENTIDADE')
    Left = 936
    Top = 152
    object sqlDadosFinanceiroKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlDadosFinanceiroCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlDadosFinanceiroNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object sqlDadosFinanceiroAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 128
    end
    object sqlDadosFinanceiroKFIN_PLANOCONTA: TStringField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object sqlDadosFinanceiroDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object sqlDadosFinanceiroDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = [pfInWhere]
    end
    object sqlDadosFinanceiroDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlDadosFinanceiroDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object sqlDadosFinanceiroBANCO: TStringField
      FieldName = 'BANCO'
      FixedChar = True
      Size = 3
    end
    object sqlDadosFinanceiroAGENCIA: TStringField
      FieldName = 'AGENCIA'
      FixedChar = True
      Size = 8
    end
    object sqlDadosFinanceiroCONTA: TStringField
      FieldName = 'CONTA'
      FixedChar = True
      Size = 16
    end
  end
  object dspDadosFinanceiro: TDataSetProvider
    DataSet = sqlDadosFinanceiro
    UpdateMode = upWhereKeyOnly
    Left = 896
    Top = 104
  end
  object cdsDadosFinanceiro: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'KCAD_ENTIDADE'
    MasterFields = 'KCAD_ENTIDADE'
    MasterSource = dtsEntidade
    PacketRecords = 0
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspDadosFinanceiro'
    AfterInsert = cdsDadosFinanceiroAfterInsert
    BeforeEdit = cdsDadosFinanceiroBeforeEdit
    BeforePost = cdsDadosFinanceiroBeforePost
    Left = 944
    Top = 44
    object cdsDadosFinanceiroKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsDadosFinanceiroCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsDadosFinanceiroAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 128
    end
    object cdsDadosFinanceiroNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsDadosFinanceiroKFIN_PLANOCONTA: TStringField
      DisplayLabel = 'Apropria'#231#227'o'
      FieldName = 'KFIN_PLANOCONTA'
      FixedChar = True
    end
    object cdsDadosFinanceiroDESCR_PC_NOME: TStringField
      FieldName = 'DESCR_PC_NOME'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object cdsDadosFinanceiroDESCR_PC_CODIGO: TIntegerField
      FieldName = 'DESCR_PC_CODIGO'
      ProviderFlags = [pfInWhere]
    end
    object cdsDadosFinanceiroDESCR_PC_CLASSIFICACAO: TStringField
      FieldName = 'DESCR_PC_CLASSIFICACAO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsDadosFinanceiroDESCR_PC_TIPO_APRD: TStringField
      FieldName = 'DESCR_PC_TIPO_APRD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object cdsDadosFinanceiroBANCO: TStringField
      FieldName = 'BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsDadosFinanceiroAGENCIA: TStringField
      FieldName = 'AGENCIA'
      FixedChar = True
      Size = 8
    end
    object cdsDadosFinanceiroCONTA: TStringField
      FieldName = 'CONTA'
      FixedChar = True
      Size = 16
    end
    object cdsDadosFinanceirosqlApropriacaoEntidade: TDataSetField
      FieldName = 'sqlApropriacaoEntidade'
    end
  end
  object dtsEntidade: TDataSource
    DataSet = cdsEntidade
    Left = 884
    Top = 12
  end
  object cdsApropriacaoEntidade: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsDadosFinanceirosqlApropriacaoEntidade
    Params = <>
    Left = 1057
    Top = 44
    object cdsApropriacaoEntidadeKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsApropriacaoEntidadeKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object cdsApropriacaoEntidadeNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object cdsApropriacaoEntidadeCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object cdsApropriacaoEntidadeCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object cdsApropriacaoEntidadePORCENTAGEM: TFloatField
      DisplayLabel = 'Rateio'
      FieldName = 'PORCENTAGEM'
    end
    object cdsApropriacaoEntidadeTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object cdsApropriacaoEntidadeTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
    object cdsApropriacaoEntidadeTOTAL_PORCENTAGEM: TAggregateField
      DisplayLabel = 'Total porcentagem'
      FieldName = 'TOTAL_PORCENTAGEM'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PORCENTAGEM)'
    end
  end
  object sqlApropriacaoEntidade: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSqlDadosFinanceiro
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_ENTIDADE'
        ParamType = ptInput
      end>
    SQLConnection = DBFinanceiro.SQLDB
    SQL = (
      'SELECT'
      '    A.KFIN_APROPRIACAO,'
      '    A.TABLENAME,'
      '    A.TABLEKEY,'
      '    A.KFIN_CENTROCUSTO,     '
      '    C.NOME,  '
      '    C.CODIGO, '
      '    C.CLASSIFICACAO,  '
      '    A.PORCENTAGEM'
      'FROM FIN_APROPRIACAO A'
      
        'LEFT JOIN FIN_CENTROSCUSTO C ON C.KFIN_CENTROCUSTO = A.KFIN_CENT' +
        'ROCUSTO'
      'WHERE A.TABLENAME = '#39'CAD_FORNECEDORES'#39' '
      '     AND A.TABLEKEY = :KCAD_ENTIDADE')
    Left = 1063
    Top = 148
    object sqlApropriacaoEntidadeKFIN_APROPRIACAO: TStringField
      FieldName = 'KFIN_APROPRIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlApropriacaoEntidadeKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      FixedChar = True
    end
    object sqlApropriacaoEntidadePORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object sqlApropriacaoEntidadeNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 64
    end
    object sqlApropriacaoEntidadeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = []
    end
    object sqlApropriacaoEntidadeCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = []
      Size = 32
    end
    object sqlApropriacaoEntidadeTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object sqlApropriacaoEntidadeTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      FixedChar = True
    end
  end
  object dtsSqlDadosFinanceiro: TDataSource
    DataSet = sqlDadosFinanceiro
    Left = 990
    Top = 202
  end
end
