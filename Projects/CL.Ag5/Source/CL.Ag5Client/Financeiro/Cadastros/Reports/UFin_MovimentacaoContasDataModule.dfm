object FIN_MovimentacaoContasDataModule: TFIN_MovimentacaoContasDataModule
  OldCreateOrder = False
  Height = 419
  Width = 609
  object cdsMovimentacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 236
    Top = 20
    object cdsMovimentacaoKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Visible = False
      FixedChar = True
    end
    object cdsMovimentacaoTIPOREG: TIntegerField
      FieldName = 'TIPOREG'
      Visible = False
    end
    object cdsMovimentacaoDT_COMPENSACAO_: TSQLTimeStampField
      DisplayLabel = 'Data Compensado'
      FieldName = 'DT_COMPENSACAO_'
      Visible = False
    end
    object cdsMovimentacaoDB_KEY: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DB_KEY'
      Visible = False
    end
    object cdsMovimentacaoBANCO_: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 110
      FieldKind = fkInternalCalc
      FieldName = 'BANCO_'
      Visible = False
      Size = 134
    end
    object cdsMovimentacaoAGENCIA_: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldKind = fkInternalCalc
      FieldName = 'AGENCIA_'
      Visible = False
      Size = 32
    end
    object cdsMovimentacaoCONTA_CORRENTE_: TStringField
      DisplayLabel = 'Conta Corrente'
      DisplayWidth = 100
      FieldKind = fkInternalCalc
      FieldName = 'CONTA_CORRENTE_'
      Visible = False
      Size = 128
    end
    object cdsMovimentacaoNOMECONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'NOMECONTA'
      OnGetText = cdsMovimentacaoNOMECONTAGetText
      Size = 64
    end
    object cdsMovimentacaoBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 110
      FieldName = 'BANCO'
      OnGetText = cdsMovimentacaoEmptyGetText
      Size = 134
    end
    object cdsMovimentacaoAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      OnGetText = cdsMovimentacaoEmptyGetText
      Size = 32
    end
    object cdsMovimentacaoCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta Corrente'
      DisplayWidth = 100
      FieldName = 'CONTA_CORRENTE'
      OnGetText = cdsMovimentacaoEmptyGetText
      Size = 128
    end
    object cdsMovimentacaoPAGTO: TSQLTimeStampField
      DisplayLabel = 'Data Pagamento'
      FieldName = 'PAGTO'
      OnGetText = cdsMovimentacaoDATAGetText
    end
    object cdsMovimentacaoDT_COMPENSACAO: TSQLTimeStampField
      DisplayLabel = 'Data Compensado'
      FieldName = 'DT_COMPENSACAO'
      OnGetText = cdsMovimentacaoDATAGetText
    end
    object cdsMovimentacaoHISTORICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'HISTORICO'
      Size = 128
    end
    object cdsMovimentacaoDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 32
    end
    object cdsMovimentacaoCHEQUE: TStringField
      DisplayLabel = 'Cheque'
      FieldName = 'CHEQUE'
      OnGetText = cdsMovimentacaoCHEQUEGetText
      FixedChar = True
      Size = 1
    end
    object cdsMovimentacaoCREDITO: TFloatField
      DisplayLabel = 'Cr'#233'dito R$'
      FieldName = 'CREDITO'
      OnGetText = cdsMovimentacaoCREDITODEBITOGetText
      DisplayFormat = '#,0.00'
    end
    object cdsMovimentacaoDEBITO: TFloatField
      DisplayLabel = 'D'#233'bito R$'
      FieldName = 'DEBITO'
      OnGetText = cdsMovimentacaoCREDITODEBITOGetText
      DisplayFormat = '#,0.00'
    end
    object cdsMovimentacaoSALDO: TFloatField
      DisplayLabel = 'Saldo R$'
      DisplayWidth = 10
      FieldName = 'SALDO'
      DisplayFormat = '#,0.00'
    end
  end
  object cdsSaldoContas: TClientDataSet
    PersistDataPacket.Data = {
      770000009619E0BD01000000180000000400000000000300000077000A4B4649
      4E5F434F4E54410100490000000100055749445448020002002000044E4F4D45
      01004900000001000557494454480200020020000C53414C444F494E49434941
      4C08000400000000000753414C444F434308000400000000000000}
    Active = True
    Aggregates = <>
    CommandText = 'SELECT KFIN_CONTA, NOME, SALDOINICIAL, 0 SALDOCC FROM FIN_CONTAS'
    Params = <>
    Left = 516
    Top = 24
    object cdsSaldoContasKFIN_CONTA: TStringField
      FieldName = 'KFIN_CONTA'
      Size = 32
    end
    object cdsSaldoContasNOME: TStringField
      FieldName = 'NOME'
      Size = 32
    end
    object cdsSaldoContasSALDOCC: TFloatField
      FieldName = 'SALDOCC'
    end
  end
end
