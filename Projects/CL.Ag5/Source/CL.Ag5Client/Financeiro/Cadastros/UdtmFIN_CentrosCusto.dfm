object dtmFIN_CentrosCusto: TdtmFIN_CentrosCusto
  OldCreateOrder = True
  Height = 246
  Width = 477
  object cdsCentrosCusto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    ProviderName = 'dspCentrosCusto'
    BeforeOpen = cdsCentrosCustoBeforeOpen
    BeforeEdit = cdsCentrosCustoBeforeEdit
    BeforeDelete = cdsCentrosCustoBeforeDelete
    AfterDelete = cdsCentrosCustoAfterDelete
    OnCalcFields = cdsCentrosCustoCalcFields
    OnNewRecord = cdsCentrosCustoNewRecord
    Left = 99
    Top = 12
    object cdsCentrosCustoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsCentrosCustoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsCentrosCustoORDENA: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'ORDENA'
      Visible = False
      Size = 32
    end
    object cdsCentrosCustoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCentrosCustoCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      Required = True
      OnGetText = cdsCentrosCustoCLASSIFICACAOGetText
      Size = 32
    end
    object cdsCentrosCustoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      OnValidate = cdsCentrosCustoNOMEValidate
      Size = 64
    end
    object cdsCentrosCustoATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      OnGetText = cdsCentrosCustoATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsCentrosCustoANALITICO_SINTETICO: TStringField
      DisplayLabel = 'Anal'#237'tico/Sint'#233'tico'
      FieldName = 'ANALITICO_SINTETICO'
      Required = True
      OnGetText = cdsCentrosCustoANALITICO_SINTETICOGetText
      FixedChar = True
      Size = 1
    end
    object cdsCentrosCustoKMFIN_CENTROCUSTO: TStringField
      FieldName = 'KMFIN_CENTROCUSTO'
      Visible = False
      FixedChar = True
    end
    object cdsCentrosCustoKDEF_CENTROCUSTO: TStringField
      DisplayLabel = 'Pecu'#225'ria de leite'
      FieldName = 'KDEF_CENTROCUSTO'
      Visible = False
      OnGetText = cdsCentrosCustoKDEF_CENTROCUSTOGetText
      FixedChar = True
    end
    object cdsCentrosCustoDATA_ENCERRAMENTO: TSQLTimeStampField
      Alignment = taCenter
      DisplayLabel = 'Data Encerramento'
      FieldName = 'DATA_ENCERRAMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCentrosCustoSYSDI: TSQLTimeStampField
      Alignment = taRightJustify
      DisplayLabel = 'Data Inser'#231#227'o'
      FieldName = 'SYS$DI'
      OnGetText = cdsCentrosCustoSYSDIGetText
      DisplayFormat = 'DD/MM/YYYY'
    end
    object cdsCentrosCustoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
  end
  object dspCentrosCusto: TDataSetProvider
    DataSet = sqlCentrosCusto
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 65
  end
  object sqlCentrosCusto: TTcSQLDataSet
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
      'SELECT '
      ' KFIN_CENTROCUSTO, '
      ' KSYS$DOMAIN, '
      ' CODIGO,'
      ' CLASSIFICACAO,'
      ' NOME, '
      ' ATIVO,'
      ' ANALITICO_SINTETICO,'
      ' KMFIN_CENTROCUSTO,'
      ' KDEF_CENTROCUSTO,'
      ' DATA_ENCERRAMENTO,'
      ' SYS$DI,'
      ' SYS$ORIGIN_TYPE'
      'FROM FIN_CENTROSCUSTO '
      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      'ORDER BY CODIGO')
    Left = 97
    Top = 108
    object sqlCentrosCustoKFIN_CENTROCUSTO: TStringField
      FieldName = 'KFIN_CENTROCUSTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlCentrosCustoKSYSDOMAIN: TStringField
      FieldName = 'KSYS$DOMAIN'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlCentrosCustoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlCentrosCustoCLASSIFICACAO: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      Required = True
      Size = 32
    end
    object sqlCentrosCustoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 64
    end
    object sqlCentrosCustoATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlCentrosCustoANALITICO_SINTETICO: TStringField
      DisplayLabel = 'Anal'#237'tico/Sint'#233'tico'
      FieldName = 'ANALITICO_SINTETICO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlCentrosCustoKMFIN_CENTROCUSTO: TStringField
      FieldName = 'KMFIN_CENTROCUSTO'
      Visible = False
      FixedChar = True
    end
    object sqlCentrosCustoKDEF_CENTROCUSTO: TStringField
      FieldName = 'KDEF_CENTROCUSTO'
      Visible = False
      FixedChar = True
    end
    object sqlCentrosCustoDATA_ENCERRAMENTO: TSQLTimeStampField
      DisplayLabel = 'Data Encerramento'
      FieldName = 'DATA_ENCERRAMENTO'
    end
    object sqlCentrosCustoSYSDI: TSQLTimeStampField
      DisplayLabel = 'Data Inser'#231#227'o'
      FieldName = 'SYS$DI'
    end
    object sqlCentrosCustoSYSORIGIN_TYPE: TIntegerField
      FieldName = 'SYS$ORIGIN_TYPE'
      Required = True
    end
  end
end
