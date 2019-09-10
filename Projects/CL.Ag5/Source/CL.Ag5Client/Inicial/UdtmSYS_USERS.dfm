object dtmSYS_USERS: TdtmSYS_USERS
  OldCreateOrder = True
  Height = 331
  Width = 742
  object cdsLstUsers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLstUsers'
    OnNewRecord = cdsLstUsersNewRecord
    Left = 55
    Top = 44
    object cdsLstUsersKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsLstUsersLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 32
    end
    object cdsLstUsersAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 128
    end
    object cdsLstUsersNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object cdsLstUsersSYSUI: TStringField
      FieldName = 'SYS$UI'
      Size = 32
    end
    object cdsLstUsersSYSDI: TSQLTimeStampField
      FieldName = 'SYS$DI'
    end
    object cdsLstUsersSYSUU: TStringField
      FieldName = 'SYS$UU'
      Size = 32
    end
    object cdsLstUsersSYSDU: TSQLTimeStampField
      FieldName = 'SYS$DU'
    end
  end
  object cdsUser: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS_USER'
        ParamType = ptInput
      end>
    ProviderName = 'dspUser'
    BeforeDelete = cdsUserBeforeDelete
    OnNewRecord = cdsUserNewRecord
    Left = 183
    Top = 44
    object cdsUserKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsUserLOGIN: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'LOGIN'
      Required = True
      OnValidate = cdsUserLOGINValidate
      Size = 32
    end
    object cdsUserPASSWORD: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'USERPASSWORD'
      Required = True
      Size = 32
    end
    object cdsUserUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 128
    end
    object cdsUserEMAIL: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL'
      OnValidate = cdsUserEMAILValidate
      Size = 64
    end
    object cdsUserEXPIRESDATE: TStringField
      FieldName = 'EXPIRESDATE'
      FixedChar = True
      Size = 10
    end
    object cdsUserEXPIREDAYS: TSmallintField
      FieldName = 'EXPIREDAYS'
    end
    object cdsUserPRIVILEGED: TStringField
      FieldName = 'PRIVILEGED'
      FixedChar = True
    end
    object cdsUserTYPEREC: TStringField
      FieldName = 'TYPEREC'
      FixedChar = True
      Size = 1
    end
    object cdsUserPROFILE: TIntegerField
      FieldName = 'PROFILE'
    end
    object cdsUserKEYCHECK: TStringField
      FieldName = 'KEYCHECK'
      FixedChar = True
    end
    object cdsUserINACTIVED: TSmallintField
      FieldName = 'INACTIVED'
      Required = True
    end
    object cdsUserBLOQUED: TStringField
      FieldName = 'BLOQUED'
      FixedChar = True
      Size = 19
    end
    object cdsUsersqlEntidade: TDataSetField
      DisplayLabel = 'Dados da entidade'
      FieldName = 'sqlEntidade'
    end
    object cdsUsersqlFazendas: TDataSetField
      DisplayLabel = 'Fazendas'
      FieldName = 'sqlFazendas'
    end
    object cdsUsersqlWebCaixaFerramentas: TDataSetField
      FieldName = 'sqlWebCaixaFerramentas'
    end
    object cdsUsersqlWebPortal: TDataSetField
      FieldName = 'sqlWebPortal'
    end
    object cdsUsersqlWebIndicadores: TDataSetField
      FieldName = 'sqlWebIndicadores'
    end
    object cdsUsersqlWebMonitoria: TDataSetField
      FieldName = 'sqlWebMonitoria'
    end
    object cdsUsersqlWebGerencialFinanceiro: TDataSetField
      FieldName = 'sqlWebGerencialFinanceiro'
    end
    object cdsUsersqlWebGerencialZootecnico: TDataSetField
      FieldName = 'sqlWebGerencialZootecnico'
    end
  end
  object dtsList: TDataSource
    DataSet = cdsLstUsers
    Left = 120
    Top = 8
  end
  object cdsEntidade: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUsersqlEntidade
    Params = <>
    BeforeInsert = cdsEntidadeBeforeInsert
    OnNewRecord = cdsEntidadeNewRecord
    Left = 249
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
      FieldName = 'CODIGO'
      Size = 32
    end
    object cdsEntidadeAPELIDO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'APELIDO'
      Size = 128
    end
    object cdsEntidadeNOME: TStringField
      DisplayLabel = 'Nome completo'
      FieldName = 'NOME'
      Size = 128
    end
    object cdsEntidadePESSOA: TStringField
      FieldName = 'PESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEntidadeCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 18
    end
    object cdsEntidadeRG_IE: TStringField
      FieldName = 'RG_IE'
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
    object cdsEntidadeKENDERECO: TStringField
      FieldName = 'KENDERECO'
      FixedChar = True
    end
    object cdsEntidadeIS_FUNCIONARIO: TStringField
      FieldName = 'IS_FUNCIONARIO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEntidadeIS_CLIENTE: TStringField
      FieldName = 'IS_CLIENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEntidadesqlEndereco: TDataSetField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'sqlEndereco'
    end
  end
  object cdsEndereco: TClientDataSet
    Aggregates = <>
    DataSetField = cdsEntidadesqlEndereco
    Params = <>
    BeforeInsert = cdsEnderecoBeforeInsert
    OnNewRecord = cdsEnderecoNewRecord
    Left = 335
    Top = 45
    object cdsEnderecoTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Required = True
      Size = 32
    end
    object cdsEnderecoTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      Required = True
      FixedChar = True
    end
    object cdsEnderecoKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
  object dspLstUsers: TDataSetProvider
    DataSet = sqlLstUsers
    Options = [poIncFieldProps]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 97
  end
  object dspUser: TDataSetProvider
    DataSet = sqlUser
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 150
    Top = 97
  end
  object sqlLstUsers: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT'
      '  U."KSYS$USER", '
      '  U.LOGIN, '
      '  E.APELIDO,'
      '  E.NOME,'
      '  U.SYS$UI, '
      '  U.SYS$DI, '
      '  U.SYS$UU,'
      '  U.SYS$DU'
      'FROM SYS$USERS U'
      'LEFT JOIN CAD_ENTIDADES E ON E.KCAD_ENTIDADE = U.KSYS$USER')
    Left = 65
    Top = 141
    object sqlLstUsersKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlLstUsersLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 32
    end
    object sqlLstUsersAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 128
    end
    object sqlLstUsersNOME: TStringField
      FieldName = 'NOME'
      Size = 128
    end
    object sqlLstUsersSYSUI: TStringField
      DisplayLabel = 'Inclu'#237'do por'
      FieldName = 'SYS$UI'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstUsersSYSDI: TSQLTimeStampField
      DisplayLabel = 'Inclu'#237'do em'
      FieldName = 'SYS$DI'
      ProviderFlags = [pfInWhere]
    end
    object sqlLstUsersSYSUU: TStringField
      DisplayLabel = 'Alterado por'
      FieldName = 'SYS$UU'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object sqlLstUsersSYSDU: TSQLTimeStampField
      DisplayLabel = 'Alterado em'
      FieldName = 'SYS$DU'
      ProviderFlags = [pfInWhere]
    end
  end
  object sqlUser: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS_USER'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT'
      '  KSYS$USER, '
      '  LOGIN, '
      '  USERPASSWORD,'
      '  USERNAME, '
      '  EMAIL, '
      '  EXPIRESDATE, '
      '  EXPIREDAYS, '
      '  PRIVILEGED, '
      '  TYPEREC, '
      '  PROFILE, '
      '  KEYCHECK, '
      '  INACTIVED, '
      '  BLOQUED'
      'FROM SYS$USERS'
      'WHERE KSYS$USER = :KSYS_USER')
    Left = 185
    Top = 140
    object sqlUserKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlUserLOGIN: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'LOGIN'
      Required = True
      Size = 32
    end
    object sqlUserPASSWORD: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'USERPASSWORD'
      Required = True
      Size = 32
    end
    object sqlUserUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 128
    end
    object sqlUserEMAIL: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL'
      Size = 64
    end
    object sqlUserEXPIRESDATE: TStringField
      FieldName = 'EXPIRESDATE'
      FixedChar = True
      Size = 10
    end
    object sqlUserEXPIREDAYS: TSmallintField
      FieldName = 'EXPIREDAYS'
    end
    object sqlUserPRIVILEGED: TStringField
      FieldName = 'PRIVILEGED'
      FixedChar = True
    end
    object sqlUserTYPEREC: TStringField
      FieldName = 'TYPEREC'
      FixedChar = True
      Size = 1
    end
    object sqlUserPROFILE: TIntegerField
      FieldName = 'PROFILE'
    end
    object sqlUserKEYCHECK: TStringField
      FieldName = 'KEYCHECK'
      FixedChar = True
    end
    object sqlUserINACTIVED: TSmallintField
      FieldName = 'INACTIVED'
      Required = True
    end
    object sqlUserBLOQUED: TStringField
      FieldName = 'BLOQUED'
      FixedChar = True
      Size = 19
    end
  end
  object dtsSQLUsers: TDataSource
    DataSet = sqlUser
    Left = 226
    Top = 187
  end
  object sqlEntidade: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DataSource = dtsSQLUsers
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$USER'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT  '
      '  KCAD_ENTIDADE, '
      '  KCAD_FAZENDA,'
      '  CODIGO, '
      '  APELIDO, '
      '  NOME, '
      '  PESSOA, '
      '  CPF_CNPJ, '
      '  RG_IE, '
      '  URL, '
      '  EMAIL,  '
      '  IS_FUNCIONARIO, IS_CLIENTE,'
      '  KENDERECO'
      'FROM CAD_ENTIDADES'
      'WHERE KCAD_ENTIDADE = :KSYS$USER')
    Left = 247
    Top = 140
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
      FieldName = 'CODIGO'
      Size = 32
    end
    object sqlEntidadeAPELIDO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'APELIDO'
      Size = 128
    end
    object sqlEntidadeNOME: TStringField
      DisplayLabel = 'Nome completo'
      FieldName = 'NOME'
      Size = 128
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
    object sqlEntidadeKENDERECO: TStringField
      FieldName = 'KENDERECO'
      FixedChar = True
    end
    object sqlEntidadeIS_FUNCIONARIO: TStringField
      FieldName = 'IS_FUNCIONARIO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlEntidadeIS_CLIENTE: TStringField
      FieldName = 'IS_CLIENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsSQLEntidades: TDataSource
    DataSet = sqlEntidade
    Left = 322
    Top = 187
  end
  object sqlEndereco: TTcSQLDataSet
    GetMetadata = False
    DataSource = dtsSQLEntidades
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KENDERECO'
        ParamType = ptInput
        Size = 23
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
    Left = 332
    Top = 140
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
    object sqlEnderecoKGLB_ENDERECO: TStringField
      FieldName = 'KGLB_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
  object sqlProfiles: TTcSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT'
      '  KSYS_USER KPROFILE, '
      '  LOGIN PROFILE'
      'FROM SYS_USERS'
      'WHERE TYPEREC = '#39'P'#39)
    Left = 681
    Top = 167
    object sqlProfilesKPROFILE: TIntegerField
      FieldName = 'KPROFILE'
      Required = True
    end
    object sqlProfilesPROFILE: TStringField
      FieldName = 'PROFILE'
      Size = 128
    end
  end
  object dspProfiles: TDataSetProvider
    DataSet = sqlProfiles
    Left = 655
    Top = 128
  end
  object sqlFazendas: TTcSQLDataSet
    GetMetadata = False
    DataSource = dtsSQLUsers
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$USER'
        ParamType = ptInput
        Size = 23
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT'
      '  E.APELIDO'
      'FROM CAD_USUARIOS_FAZENDA UF'
      
        'LEFT JOIN CAD_ENTIDADES E ON ( E.KCAD_ENTIDADE = UF.KCAD_FAZENDA' +
        ' )'
      'WHERE ( UF."KSYS$USER" = :KSYS$USER )')
    Left = 409
    Top = 140
    object sqlFazendasAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 128
    end
  end
  object cdsFazendas: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUsersqlFazendas
    Params = <>
    Left = 416
    Top = 48
  end
  object cdsWebGerencialZootecnico: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUsersqlWebGerencialZootecnico
    Params = <>
    OnNewRecord = cdsWebGerencialZootecnicoNewRecord
    Left = 208
    Top = 88
    object cdsWebGerencialZootecnicoKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsWebGerencialZootecnicoKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object cdsWebGerencialZootecnicoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsWebGerencialZootecnicoMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object cdsWebGerencialZootecnicoMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object cdsWebGerencialZootecnicoMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object cdsWebGerencialZootecnicoMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
  object cdsWebGerencialFinanceiro: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUsersqlWebGerencialFinanceiro
    Params = <>
    OnNewRecord = cdsWebGerencialFinanceiroNewRecord
    Left = 256
    Top = 88
    object cdsWebGerencialFinanceiroKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsWebGerencialFinanceiroKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object cdsWebGerencialFinanceiroKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsWebGerencialFinanceiroMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object cdsWebGerencialFinanceiroMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object cdsWebGerencialFinanceiroMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object cdsWebGerencialFinanceiroMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
  object cdsWebMonitoria: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUsersqlWebMonitoria
    Params = <>
    OnNewRecord = cdsWebMonitoriaNewRecord
    Left = 304
    Top = 88
    object cdsWebMonitoriaKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsWebMonitoriaKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object cdsWebMonitoriaKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsWebMonitoriaMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object cdsWebMonitoriaMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object cdsWebMonitoriaMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object cdsWebMonitoriaMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
  object cdsWebIndicadores: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUsersqlWebIndicadores
    Params = <>
    OnNewRecord = cdsWebIndicadoresNewRecord
    Left = 352
    Top = 88
    object cdsWebIndicadoresKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsWebIndicadoresKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object cdsWebIndicadoresKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsWebIndicadoresMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object cdsWebIndicadoresMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object cdsWebIndicadoresMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object cdsWebIndicadoresMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
  object cdsWebPortal: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUsersqlWebPortal
    Params = <>
    OnNewRecord = cdsWebPortalNewRecord
    Left = 400
    Top = 88
    object cdsWebPortalKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsWebPortalKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object cdsWebPortalKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsWebPortalMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object cdsWebPortalMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object cdsWebPortalMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object cdsWebPortalMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
  object cdsWebCaixaFerramentas: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUsersqlWebCaixaFerramentas
    Params = <>
    OnNewRecord = cdsWebCaixaFerramentasNewRecord
    Left = 464
    Top = 88
    object cdsWebCaixaFerramentasKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsWebCaixaFerramentasKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object cdsWebCaixaFerramentasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object cdsWebCaixaFerramentasMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object cdsWebCaixaFerramentasMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object cdsWebCaixaFerramentasMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object cdsWebCaixaFerramentasMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
  object sqlWebGerencialZootecnico: TTcSQLDataSet
    BeforeOpen = sqlWebGerencialZootecnicoBeforeOpen
    DataSource = dtsSQLUsers
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$USER'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT '
      '  KSYS$USER_MODULE,'
      '  KSYS$USER,'
      '  KSYS$DOMAIN,'
      '  MODULE,'
      '  MODULE_DOMAIN,'
      '  MODULE_LOGIN,'
      '  MODULE_PASSWORD'
      'FROM SYS$USERS_MODULES'
      'WHERE '
      '         KSYS$USER     =   :KSYS$USER'
      'AND  KSYS$DOMAIN =  :KSYS$DOMAIN'
      'AND  MODULE = 1')
    Left = 216
    Top = 248
    object sqlWebGerencialZootecnicoKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlWebGerencialZootecnicoKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object sqlWebGerencialZootecnicoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlWebGerencialZootecnicoMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object sqlWebGerencialZootecnicoMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object sqlWebGerencialZootecnicoMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object sqlWebGerencialZootecnicoMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
  object sqlWebGerencialFinanceiro: TTcSQLDataSet
    BeforeOpen = sqlWebGerencialFinanceiroBeforeOpen
    DataSource = dtsSQLUsers
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$USER'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT '
      '  KSYS$USER_MODULE,'
      '  KSYS$USER,'
      '  KSYS$DOMAIN,'
      '  MODULE,'
      '  MODULE_DOMAIN,'
      '  MODULE_LOGIN,'
      '  MODULE_PASSWORD'
      'FROM SYS$USERS_MODULES'
      'WHERE '
      '         KSYS$USER     =   :KSYS$USER'
      'AND  KSYS$DOMAIN =  :KSYS$DOMAIN'
      'AND  MODULE = 2')
    Left = 264
    Top = 248
    object sqlWebGerencialFinanceiroKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlWebGerencialFinanceiroKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object sqlWebGerencialFinanceiroKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlWebGerencialFinanceiroMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object sqlWebGerencialFinanceiroMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object sqlWebGerencialFinanceiroMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object sqlWebGerencialFinanceiroMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
  object sqlWebMonitoria: TTcSQLDataSet
    BeforeOpen = sqlWebMonitoriaBeforeOpen
    DataSource = dtsSQLUsers
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$USER'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT '
      '  KSYS$USER_MODULE,'
      '  KSYS$USER,'
      '  KSYS$DOMAIN,'
      '  MODULE,'
      '  MODULE_DOMAIN,'
      '  MODULE_LOGIN,'
      '  MODULE_PASSWORD'
      'FROM SYS$USERS_MODULES'
      'WHERE '
      '         KSYS$USER     =   :KSYS$USER'
      'AND  KSYS$DOMAIN =  :KSYS$DOMAIN'
      'AND  MODULE = 3')
    Left = 320
    Top = 248
    object sqlWebMonitoriaKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlWebMonitoriaKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object sqlWebMonitoriaKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlWebMonitoriaMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object sqlWebMonitoriaMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object sqlWebMonitoriaMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object sqlWebMonitoriaMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
  object sqlWebIndicadores: TTcSQLDataSet
    BeforeOpen = sqlWebIndicadoresBeforeOpen
    DataSource = dtsSQLUsers
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$USER'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT '
      '  KSYS$USER_MODULE,'
      '  KSYS$USER,'
      '  KSYS$DOMAIN,'
      '  MODULE,'
      '  MODULE_DOMAIN,'
      '  MODULE_LOGIN,'
      '  MODULE_PASSWORD'
      'FROM SYS$USERS_MODULES'
      'WHERE '
      '         KSYS$USER     =   :KSYS$USER'
      'AND  KSYS$DOMAIN =  :KSYS$DOMAIN'
      'AND  MODULE = 4')
    Left = 384
    Top = 248
    object sqlWebIndicadoresKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlWebIndicadoresKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object sqlWebIndicadoresKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlWebIndicadoresMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object sqlWebIndicadoresMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object sqlWebIndicadoresMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object sqlWebIndicadoresMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
  object sqlWebPortal: TTcSQLDataSet
    BeforeOpen = sqlWebPortalBeforeOpen
    DataSource = dtsSQLUsers
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$USER'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT '
      '  KSYS$USER_MODULE,'
      '  KSYS$USER,'
      '  KSYS$DOMAIN,'
      '  MODULE,'
      '  MODULE_DOMAIN,'
      '  MODULE_LOGIN,'
      '  MODULE_PASSWORD'
      'FROM SYS$USERS_MODULES'
      'WHERE '
      '         KSYS$USER     =   :KSYS$USER'
      'AND  KSYS$DOMAIN =  :KSYS$DOMAIN'
      'AND  MODULE = 5')
    Left = 440
    Top = 248
    object sqlWebPortalKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlWebPortalKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object sqlWebPortalKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlWebPortalMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object sqlWebPortalMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object sqlWebPortalMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object sqlWebPortalMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
  object sqlWebCaixaFerramentas: TTcSQLDataSet
    NumericMapping = True
    BeforeOpen = sqlWebCaixaFerramentasBeforeOpen
    DataSource = dtsSQLUsers
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$USER'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    SQL = (
      'SELECT '
      '  KSYS$USER_MODULE,'
      '  KSYS$USER,'
      '  KSYS$DOMAIN,'
      '  MODULE,'
      '  MODULE_DOMAIN,'
      '  MODULE_LOGIN,'
      '  MODULE_PASSWORD'
      'FROM SYS$USERS_MODULES'
      'WHERE '
      '         KSYS$USER     =   :KSYS$USER'
      'AND  KSYS$DOMAIN =  :KSYS$DOMAIN'
      'AND  MODULE = 6')
    Left = 488
    Top = 248
    object sqlWebCaixaFerramentasKSYSUSER_MODULE: TStringField
      FieldName = 'KSYS$USER_MODULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlWebCaixaFerramentasKSYSUSER: TStringField
      FieldName = 'KSYS$USER'
      Required = True
      FixedChar = True
    end
    object sqlWebCaixaFerramentasKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      FixedChar = True
    end
    object sqlWebCaixaFerramentasMODULE: TIntegerField
      FieldName = 'MODULE'
      Required = True
    end
    object sqlWebCaixaFerramentasMODULE_DOMAIN: TStringField
      FieldName = 'MODULE_DOMAIN'
      Size = 32
    end
    object sqlWebCaixaFerramentasMODULE_LOGIN: TStringField
      FieldName = 'MODULE_LOGIN'
      Size = 32
    end
    object sqlWebCaixaFerramentasMODULE_PASSWORD: TStringField
      FieldName = 'MODULE_PASSWORD'
      Size = 32
    end
  end
end
