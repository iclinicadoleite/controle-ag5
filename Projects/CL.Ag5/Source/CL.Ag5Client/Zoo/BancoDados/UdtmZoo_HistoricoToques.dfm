object dtmZoo_HistoricoToques: TdtmZoo_HistoricoToques
  OldCreateOrder = False
  Height = 230
  Width = 286
  object sqlHistoricoToques: TTcSQLDataSet
    CommandText = 
      'SELECT '#13#10'  E.KZOO_ANIMAL_FEMEA,'#13#10'  AF.BRINCO BRINCOFEMEA,'#13#10'  AF.' +
      'BRINCO_ BRINCOFEMEA_,'#13#10'  E.DATAEVENTO,'#13#10'  (SELECT CAST ( SYS$DES' +
      'CRIPTION AS VARCHAR ( 30 ) ) SYS$DESCRIPTION FROM SYS$TYPES_GETD' +
      'ESCRIPTION( '#39'TIPO_EVENTO_ZOO'#39', E.TIPOEVENTO )) "DESC_TIPOEVENTO"' +
      ','#13#10'  AF.NOMEESTABULO NOMEFEMEA,'#13#10'  AM.NOMEESTABULO NOMEMACHO,'#13#10' ' +
      ' H.DATATOQUE,'#13#10'  (SELECT CAST ( SYS$DESCRIPTION AS VARCHAR ( 15 ' +
      ') ) SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( '#39'STATUS_PRENH' +
      'EZ'#39', H.PRENHEZ )) "DIAGNOSTICO",'#13#10'  H.KCAD_VETERINARIO,'#13#10'  H.NOM' +
      'EVETERINARIO'#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS E'#13#10'INNER JOIN ZOO_HIS' +
      'TORICO_TOQUE H ON H.KZOO_EVENTO_ZOOTECNICO = E.KZOO_EVENTO_ZOOTE' +
      'CNICO'#13#10'LEFT JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = E.KZOO_ANIMA' +
      'L_FEMEA'#13#10'LEFT JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = E.KZOO_ANI' +
      'MAL_MACHO'#13#10'LEFT JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FE' +
      'MEA = E.KZOO_ANIMAL_FEMEA'#13#10'WHERE E.KZOO_ANIMAL_FEMEA = :KZOO_ANI' +
      'MAL_FEMEA'#13#10'  AND DAF.KULTIMO_EVENTO_ZOOTECNICO = E.KZOO_EVENTO_Z' +
      'OOTECNICO'#13#10' ORDER BY H.DATATOQUE DESC'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end>
    SQLConnection = DBZootecnico.SQLDB
    Left = 60
    Top = 136
    object sqlHistoricoToquesKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      FixedChar = True
    end
    object sqlHistoricoToquesBRINCOFEMEA: TStringField
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object sqlHistoricoToquesBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Size = 16
    end
    object sqlHistoricoToquesDATAEVENTO: TSQLTimeStampField
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object sqlHistoricoToquesDESC_TIPOEVENTO: TStringField
      FieldName = 'DESC_TIPOEVENTO'
      Size = 30
    end
    object sqlHistoricoToquesNOMEFEMEA: TStringField
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object sqlHistoricoToquesNOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      Size = 60
    end
    object sqlHistoricoToquesDATATOQUE: TSQLTimeStampField
      FieldName = 'DATATOQUE'
    end
    object sqlHistoricoToquesDIAGNOSTICO: TStringField
      FieldName = 'DIAGNOSTICO'
      Size = 15
    end
    object sqlHistoricoToquesKCAD_VETERINARIO: TStringField
      FieldName = 'KCAD_VETERINARIO'
      FixedChar = True
    end
    object sqlHistoricoToquesNOMEVETERINARIO: TStringField
      FieldName = 'NOMEVETERINARIO'
      Size = 128
    end
  end
  object dspHistoricoToques: TDataSetProvider
    DataSet = sqlHistoricoToques
    Options = [poIncFieldProps, poRetainServerOrder]
    Left = 52
    Top = 88
  end
  object cdsHistoricoToques: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KZOO_ANIMAL_FEMEA'
        ParamType = ptInput
      end>
    ProviderName = 'dspHistoricoToques'
    Left = 60
    Top = 36
    object cdsHistoricoToquesKZOO_ANIMAL_FEMEA: TStringField
      FieldName = 'KZOO_ANIMAL_FEMEA'
      Required = True
      Visible = False
      FixedChar = True
    end
    object cdsHistoricoToquesBRINCOFEMEA: TStringField
      DisplayLabel = 'Brinco'
      FieldName = 'BRINCOFEMEA'
      Size = 15
    end
    object cdsHistoricoToquesBRINCOFEMEA_: TStringField
      FieldName = 'BRINCOFEMEA_'
      Visible = False
      Size = 16
    end
    object cdsHistoricoToquesDATAEVENTO: TSQLTimeStampField
      DisplayLabel = 'Data Evento'
      DisplayWidth = 20
      FieldName = 'DATAEVENTO'
      Required = True
    end
    object cdsHistoricoToquesDESC_TIPOEVENTO: TStringField
      DisplayLabel = 'Tipo Evento'
      FieldName = 'DESC_TIPOEVENTO'
      Size = 30
    end
    object cdsHistoricoToquesNOMEFEMEA: TStringField
      DisplayLabel = 'Nome Estabulo'
      DisplayWidth = 30
      FieldName = 'NOMEFEMEA'
      Size = 60
    end
    object cdsHistoricoToquesNOMEMACHO: TStringField
      FieldName = 'NOMEMACHO'
      Visible = False
      Size = 60
    end
    object cdsHistoricoToquesDATATOQUE: TSQLTimeStampField
      DisplayLabel = 'Data Toque'
      DisplayWidth = 20
      FieldName = 'DATATOQUE'
    end
    object cdsHistoricoToquesDIAGNOSTICO: TStringField
      DisplayLabel = 'Diagn'#243'stico'
      FieldName = 'DIAGNOSTICO'
      Size = 15
    end
    object cdsHistoricoToquesKCAD_VETERINARIO: TStringField
      FieldName = 'KCAD_VETERINARIO'
      Visible = False
      FixedChar = True
    end
    object cdsHistoricoToquesNOMEVETERINARIO: TStringField
      DisplayLabel = 'Veterin'#225'rio'
      DisplayWidth = 30
      FieldName = 'NOMEVETERINARIO'
      Size = 128
    end
  end
end
