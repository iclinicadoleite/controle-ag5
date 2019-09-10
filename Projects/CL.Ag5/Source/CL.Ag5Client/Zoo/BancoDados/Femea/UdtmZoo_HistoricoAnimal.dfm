object dtmZoo_HistoricoAnimal: TdtmZoo_HistoricoAnimal
  OldCreateOrder = True
  Height = 231
  Width = 410
  object cdsHistoricoAnimal: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeOpen = cdsHistoricoAnimalBeforeOpen
    OnNewRecord = cdsHistoricoAnimalNewRecord
    Left = 90
    Top = 22
    object cdsHistoricoAnimalLACTACAO: TIntegerField
      DisplayLabel = 'Lacta'#231#227'o'
      FieldName = 'LACTACAO'
      OnGetText = cdsHistoricoAnimalLACTACAOGetText
    end
    object cdsHistoricoAnimalEVENTO: TStringField
      DisplayLabel = 'Eventos'
      FieldName = 'EVENTO'
      Size = 60
    end
    object cdsHistoricoAnimalDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 250
    end
    object cdsHistoricoAnimalDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsHistoricoAnimalDIAS: TADTField
      DisplayLabel = 'Dias'
      FieldName = 'DIAS'
      object cdsHistoricoAnimalDIASPARTO: TIntegerField
        DisplayLabel = 'do '#250'ltimo parto'
        FieldName = 'DIASPARTO'
        OnGetText = cdsHistoricoAnimalDIASPARTOGetText
      end
      object cdsHistoricoAnimalDIASEVENTO: TIntegerField
        DisplayLabel = 'entre eventos'
        FieldName = 'DIASEVENTO'
      end
      object cdsHistoricoAnimalDIASHOJE: TIntegerField
        DisplayLabel = 'do evento'
        FieldName = 'DIASHOJE'
      end
    end
  end
  object cdsTipoEvento: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 284
    Top = 16
    object cdsTipoEventoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoEventoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoEventoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoEventoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object cdsTipoPartoAborto: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000004000000000003000000790004544950
      4F0100490004000100055749445448020002001F000556414C4F520100490004
      000100055749445448020002001F000944455343524943414F01004900040001
      00055749445448020002001F00054F5244454D04000100000000000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO;ORDEM;VALOR'
    Params = <>
    Left = 288
    Top = 68
    object cdsTipoPartoAbortoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 31
    end
    object cdsTipoPartoAbortoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
end
