object FIN_AnexosDatamodule: TFIN_AnexosDatamodule
  OldCreateOrder = True
  Height = 233
  Width = 392
  object cdsAnexos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'TABLENAME'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TABLEKEY'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnexos'
    AfterInsert = cdsAnexosAfterInsert
    OnNewRecord = cdsAnexosNewRecord
    Left = 78
    Top = 20
    object cdsAnexosKGLB_ATTACHMENT: TStringField
      FieldName = 'KGLB_ATTACHMENT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAnexosTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Required = True
      Visible = False
      Size = 32
    end
    object cdsAnexosTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsAnexosFILENAME: TStringField
      DisplayLabel = 'Nome do arquivo'
      FieldName = 'FILENAME'
      Size = 128
    end
    object cdsAnexosINFO: TMemoField
      DisplayLabel = 'Informa'#231#245'es'
      FieldName = 'INFO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsAnexosDATA: TBlobField
      DisplayLabel = 'Arquivo'
      FieldName = 'DATA'
      Visible = False
      Size = 1
    end
  end
  object sqlAnexos: TTcSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  KGLB_ATTACHMENT,'#13#10'  TABLENAME,'#13#10'  TABLEKEY,'#13#10'  FILENAM' +
      'E,'#13#10'  INFO,'#13#10'  DATA'#13#10'FROM GLB_ATTACHMENTS'#13#10'WHERE TABLENAME = :TA' +
      'BLENAME'#13#10'  AND TABLEKEY  = :TABLEKEY'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'TABLENAME'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TABLEKEY'
        ParamType = ptInput
      end>
    SQLConnection = DBAnexos.SQLDB
    Left = 81
    Top = 116
    object sqlAnexosKGLB_ATTACHMENT: TStringField
      FieldName = 'KGLB_ATTACHMENT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAnexosTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Required = True
      Visible = False
      Size = 32
    end
    object sqlAnexosTABLEKEY: TStringField
      FieldName = 'TABLEKEY'
      Required = True
      Visible = False
      FixedChar = True
    end
    object sqlAnexosFILENAME: TStringField
      DisplayLabel = 'Nome do arquivo'
      FieldName = 'FILENAME'
      Size = 128
    end
    object sqlAnexosINFO: TMemoField
      DisplayLabel = 'Informa'#231#245'es'
      FieldName = 'INFO'
      BlobType = ftMemo
      Size = 1
    end
    object sqlAnexosDATA: TBlobField
      DisplayLabel = 'Arquivo'
      FieldName = 'DATA'
      Visible = False
      Size = 1
    end
  end
  object dspAnexos: TDataSetProvider
    DataSet = sqlAnexos
    Left = 32
    Top = 62
  end
end
