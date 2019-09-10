object dtmCAD_Funcionarios: TdtmCAD_Funcionarios
  OldCreateOrder = True
  Height = 289
  Width = 900
  object cdsLstEntidades: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
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
      Visible = False
      FixedChar = True
    end
    object cdsLstEntidadesCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsLstEntidadesATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      OnGetText = cdsLstEntidadesATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsLstEntidadesAPELIDO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'APELIDO'
      Size = 128
    end
    object cdsLstEntidadesNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsLstEntidadesCPF_CNPJ: TStringField
      DisplayLabel = 'CPF CNPJ'
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 18
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
    BeforePost = cdsEntidadeBeforePost
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
    object cdsEntidadeKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object cdsEntidadeCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsEntidadeNOME: TStringField
      DisplayLabel = 'Nome/Raz'#227'o Social'
      FieldName = 'NOME'
      Required = True
      OnSetText = cdsEntidadeNOMESetText
      Size = 128
    end
    object cdsEntidadeAPELIDO: TStringField
      DisplayLabel = 'Apelido/Nome fantasia'
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
      DisplayLabel = 'RG IE'
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
      FieldName = 'URL'
      Size = 64
    end
    object cdsEntidadeEMAIL: TStringField
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
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsEntidadeFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
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
      FieldName = 'ENDERECO'
      Size = 128
    end
    object cdsEnderecoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object cdsEnderecoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 64
    end
    object cdsEnderecoBAIRRO: TStringField
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
      FieldName = 'CIDADE'
      Size = 64
    end
    object cdsEnderecoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsEnderecoCXPOSTAL: TStringField
      FieldName = 'CXPOSTAL'
      Size = 16
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
      FieldName = 'FONE1'
      Size = 32
    end
    object cdsContatosFONE2: TStringField
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
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end
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
      'WHERE KCAD_FAZENDA = :KCAD_FAZENDA'
      '  AND ( :DSP_INATIVO = '#39'T'#39' OR ATIVO = '#39'T'#39' )'
      '  AND (   ( :DSP_CLIENTE = '#39'T'#39' AND IS_CLIENTE = '#39'T'#39' )'
      '       OR ( :DSP_FORNECEDOR = '#39'T'#39' AND IS_FORNECEDOR = '#39'T'#39' )'
      '       OR ( :DSP_FUNCIONARIO = '#39'T'#39' AND IS_FUNCIONARIO = '#39'T'#39' )'
      
        '       OR ( :DSP_TRANSPORTADORA = '#39'T'#39' AND IS_TRANSPORTADORA = '#39'T' +
        #39' )'
      '       )')
    Left = 53
    Top = 140
    object sqlLstEntidadesKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
    end
    object sqlLstEntidadesCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlLstEntidadesATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object sqlLstEntidadesAPELIDO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'APELIDO'
      Size = 128
    end
    object sqlLstEntidadesNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 128
    end
    object sqlLstEntidadesCPF_CNPJ: TStringField
      DisplayLabel = 'CPF CNPJ'
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
      ' KCAD_ENTIDADE, '
      '  KCAD_FAZENDA, '
      '  CODIGO, '
      '  APELIDO, '
      '  NOME, '
      '  ATIVO, '
      '  KENDERECO, '
      '  PESSOA, '
      '  CPF_CNPJ, '
      '  RG_IE, '
      '  URL, '
      '  EMAIL, '
      '  IS_CLIENTE, '
      '  IS_FORNECEDOR, '
      '  IS_FUNCIONARIO, '
      '  IS_TRANSPORTADORA, '
      '  OBS, '
      '  FONE, '
      '  RAMAL, '
      '  FAX'
      'FROM CAD_ENTIDADES'
      'WHERE KCAD_ENTIDADE = :KCAD_ENTIDADE')
    Left = 173
    Top = 139
    object sqlEntidadeKCAD_ENTIDADE: TStringField
      FieldName = 'KCAD_ENTIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlEntidadeKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlEntidadeCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlEntidadeNOME: TStringField
      DisplayLabel = 'Nome/Raz'#227'o Social'
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlEntidadeAPELIDO: TStringField
      DisplayLabel = 'Apelido/Nome Fantasia'
      FieldName = 'APELIDO'
      Required = True
      Size = 128
    end
    object sqlEntidadeATIVO: TStringField
      DisplayLabel = 'Ativo'
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
      DisplayLabel = 'Pessoa'
      FieldName = 'PESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEntidadeCPF_CNPJ: TStringField
      DisplayLabel = 'CPF CNPJ'
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 18
    end
    object sqlEntidadeRG_IE: TStringField
      DisplayLabel = 'RG IE'
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
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Size = 18
    end
    object sqlEntidadeRAMAL: TStringField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL'
      Size = 18
    end
    object sqlEntidadeFAX: TStringField
      DisplayLabel = 'Fax'
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
    GetMetadata = False
    DataSource = dtsSQLEdit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
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
      '  E.CXPOSTAL '
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
      '  E.CXPOSTAL '
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
      FieldName = 'FONE1'
      Size = 32
    end
    object sqlContatosFONE2: TStringField
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
    Left = 138
    Top = 92
  end
end
