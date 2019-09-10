object Zoo_RelatorioPersonalizadoDatamodule: TZoo_RelatorioPersonalizadoDatamodule
  OldCreateOrder = False
  Height = 435
  Width = 647
  object cdsRelatorioPersonalizados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspRelatorioPersonalizados'
    BeforeOpen = cdsRelatorioPersonalizadosBeforeOpen
    OnNewRecord = cdsRelatorioPersonalizadosNewRecord
    Left = 111
    Top = 16
    object cdsRelatorioPersonalizadosKZOO_PERSONALIZADO: TStringField
      FieldName = 'KZOO_PERSONALIZADO'
      Required = True
      FixedChar = True
    end
    object cdsRelatorioPersonalizadosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object cdsRelatorioPersonalizadosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object cdsRelatorioPersonalizadosCONTENT_VERSION: TIntegerField
      FieldName = 'CONTENT_VERSION'
    end
  end
  object dspRelatorioPersonalizados: TDataSetProvider
    DataSet = sqlRelatorioPersonalizados
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poRetainServerOrder]
    UpdateMode = upWhereKeyOnly
    Left = 71
    Top = 57
  end
  object sqlRelatorioPersonalizados: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10' P.KCAD_FAZENDA, '#13#10' P.KZOO_PERSONALIZADO, '#13#10' P.NOME,'#13#10' ' +
      'P.CONTENT_VERSION'#13#10'FROM ZOO_PERSONALIZADO P'#13#10'WHERE  P.KCAD_FAZEN' +
      'DA = :KCAD_FAZENDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'KCAD_FAZENDA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 106
    Top = 112
    object sqlRelatorioPersonalizadosKZOO_PERSONALIZADO: TStringField
      FieldName = 'KZOO_PERSONALIZADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object sqlRelatorioPersonalizadosKCAD_FAZENDA: TStringField
      FieldName = 'KCAD_FAZENDA'
      Required = True
      FixedChar = True
    end
    object sqlRelatorioPersonalizadosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 128
    end
    object sqlRelatorioPersonalizadosCONTENT_VERSION: TIntegerField
      FieldName = 'CONTENT_VERSION'
    end
  end
  object cdsReportCfg: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeInsert = cdsReportCfgBeforeInsert
    BeforePost = cdsReportCfgBeforePost
    OnCalcFields = cdsReportCfgCalcFields
    OnNewRecord = cdsReportCfgNewRecord
    Left = 230
    Top = 16
    object cdsReportCfgID: TStringField
      FieldName = 'ID'
    end
    object cdsReportCfgWHEREGROUP: TSmallintField
      FieldName = 'WHEREGROUP'
    end
    object cdsReportCfgCOLUMNORDER: TSmallintField
      FieldName = 'COLUMNORDER'
    end
    object cdsReportCfgTABLEALIAS: TStringField
      FieldName = 'TABLEALIAS'
      Size = 31
    end
    object cdsReportCfgCOLUMN: TStringField
      FieldName = 'COLUMN'
      Visible = False
      Size = 2048
    end
    object cdsReportCfgCOLUMNTYPE: TSmallintField
      FieldName = 'COLUMNTYPE'
    end
    object cdsReportCfgCOLUMNDATATYPE: TSmallintField
      FieldName = 'COLUMNDATATYPE'
    end
    object cdsReportCfgCOLUMNTITLE: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'COLUMNTITLE'
      Visible = False
      Size = 100
    end
    object cdsReportCfgVISIBLE: TStringField
      DisplayLabel = 'Exibir'
      FieldName = 'VISIBLE'
      Size = 1
    end
    object cdsReportCfgOPERATOR: TSmallintField
      DisplayLabel = 'Condi'#231#227'o'
      FieldName = 'OPERATOR'
      Visible = False
    end
    object cdsReportCfgNOT: TStringField
      DisplayLabel = 'N'#227'o'
      FieldName = 'NOT'
      OnValidate = cdsReportCfgNOTValidate
      Size = 1
    end
    object cdsReportCfgPARAM1: TStringField
      DisplayLabel = 'Conte'#250'do'
      FieldName = 'PARAM1'
      Visible = False
      Size = 50
    end
    object cdsReportCfgPARAM2: TStringField
      DisplayLabel = 'Conte'#250'do 2'
      FieldName = 'PARAM2'
      Visible = False
      Size = 50
    end
    object cdsReportCfgDSPCONDITION: TStringField
      DisplayLabel = 'Condi'#231#227'o'
      FieldKind = fkInternalCalc
      FieldName = 'DSPCONDITION'
      Size = 100
    end
    object cdsReportCfgLISTVALUES: TStringField
      DisplayWidth = 2000
      FieldName = 'LISTVALUES'
      Size = 2000
    end
  end
end
