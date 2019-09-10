object frmZoo_InformacoesAnimal: TfrmZoo_InformacoesAnimal
  Left = 371
  Top = 262
  Caption = 'frmZoo_InformacoesAnimal'
  ClientHeight = 493
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 782
    Height = 493
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
    ExplicitLeft = -1
    ExplicitHeight = 433
    object Label1: TLabel
      Left = 0
      Top = 480
      Width = 104
      Height = 13
      Align = alBottom
      Caption = '  n/d = n'#227'o dispon'#237'vel'
      Visible = False
    end
    object pnlInfDados: TJvPanel
      Left = 0
      Top = 0
      Width = 782
      Height = 163
      FlatBorder = True
      Align = alTop
      BorderWidth = 1
      Caption = ' '
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 32
        Width = 29
        Height = 13
        Caption = 'Brinco'
      end
      object Label4: TLabel
        Left = 8
        Top = 68
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label5: TLabel
        Left = 405
        Top = 32
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object Label6: TLabel
        Left = 200
        Top = 101
        Width = 80
        Height = 13
        Caption = 'Data nascimento'
      end
      object Label7: TLabel
        Left = 596
        Top = 138
        Width = 36
        Height = 13
        Caption = 'SISBOV'
        Visible = False
      end
      object Label8: TLabel
        Left = 200
        Top = 32
        Width = 40
        Height = 13
        Caption = 'Registro'
      end
      object Label10: TLabel
        Left = 8
        Top = 101
        Width = 24
        Height = 13
        Caption = 'Ra'#231'a'
      end
      object Label35: TLabel
        Left = 354
        Top = 68
        Width = 86
        Height = 13
        Caption = 'Nome de est'#225'bulo'
      end
      object Label53: TLabel
        Left = 9
        Top = 133
        Width = 98
        Height = 13
        Caption = 'Doadora / receptora'
      end
      object Label9: TLabel
        Left = 424
        Top = 101
        Width = 28
        Height = 13
        Caption = 'Idade'
      end
      object Label2: TLabel
        Left = 362
        Top = 133
        Width = 90
        Height = 13
        Caption = 'Status reprodutivo'
      end
      object pnlTitleGeral: TJvPanel
        Left = 2
        Top = 2
        Width = 778
        Height = 15
        Align = alTop
        Caption = 'Geral'
        Color = 15389113
        ParentBackground = False
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 60
        Top = 29
        Width = 109
        Height = 21
        DataField = 'BRINCO'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 60
        Top = 65
        Width = 257
        Height = 21
        DataField = 'NOMECOMPLETO'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit16: TDBEdit
        Left = 462
        Top = 29
        Width = 109
        Height = 21
        DataField = 'DESCR_STATUS'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit21: TDBEdit
        Left = 305
        Top = 98
        Width = 109
        Height = 21
        DataField = 'NASCIMENTO'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit22: TDBEdit
        Left = 648
        Top = 133
        Width = 245
        Height = 21
        DataField = 'SISBOV'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 9
        Visible = False
      end
      object DBEdit23: TDBEdit
        Left = 249
        Top = 29
        Width = 78
        Height = 21
        DataField = 'REGISTRO'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit24: TDBEdit
        Left = 462
        Top = 98
        Width = 52
        Height = 21
        DataField = 'IDADE'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit25: TDBEdit
        Left = 61
        Top = 98
        Width = 128
        Height = 21
        DataField = 'RACA'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit15: TDBEdit
        Left = 462
        Top = 65
        Width = 186
        Height = 21
        DataField = 'NOMEESTABULO'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 131
        Top = 130
        Width = 178
        Height = 21
        DataField = 'DESCR_DOADOR_RECEPTOR'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 10
      end
      object DBEdit1: TDBEdit
        Left = 462
        Top = 130
        Width = 109
        Height = 21
        DataField = 'STATUS_REPRODUTIVO'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 11
      end
      object DBCheckBox1: TJvDBCheckBox
        Left = 526
        Top = 99
        Width = 148
        Height = 17
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Inten'#231#227'o de descarte'
        DataField = 'INTENCAO_DESCARTE'
        DataSource = dtsResumo
        ReadOnly = True
        TabOrder = 12
        ValueChecked = 'T'
        ValueUnchecked = 'F'
      end
    end
    object pnlInfProducao: TJvPanel
      Left = 9
      Top = 170
      Width = 242
      Height = 280
      FlatBorder = True
      BorderWidth = 1
      Caption = ' '
      ParentBackground = False
      ParentColor = True
      TabOrder = 1
      object Label16: TLabel
        Left = 6
        Top = 43
        Width = 12
        Height = 13
        Caption = 'NL'
      end
      object Label17: TLabel
        Left = 6
        Top = 105
        Width = 21
        Height = 13
        Caption = 'Lote'
      end
      object Label18: TLabel
        Left = 6
        Top = 136
        Width = 99
        Height = 13
        Caption = 'Produ'#231#227'o acumulada'
      end
      object Label19: TLabel
        Left = 6
        Top = 167
        Width = 72
        Height = 13
        Caption = 'Produ'#231#227'o 305d'
      end
      object Label20: TLabel
        Left = 6
        Top = 229
        Width = 67
        Height = 13
        Caption = 'M'#233'dia ( Kg/d )'
      end
      object Label36: TLabel
        Left = 6
        Top = 198
        Width = 77
        Height = 13
        Caption = #218'ltima produ'#231#227'o'
      end
      object Label48: TLabel
        Left = 6
        Top = 74
        Width = 98
        Height = 13
        Caption = 'Data do '#250'ltimo parto'
      end
      object pnlTitleProducao: TJvPanel
        Left = 2
        Top = 2
        Width = 238
        Height = 15
        Align = alTop
        Caption = 'Produ'#231#227'o'
        Color = 15389113
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 213
      end
      object DBEdit31: TDBEdit
        Left = 132
        Top = 40
        Width = 81
        Height = 21
        DataField = 'NUMERO_LACTACAO'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit32: TDBEdit
        Left = 132
        Top = 101
        Width = 82
        Height = 21
        DataField = 'LOTE'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit33: TDBEdit
        Left = 131
        Top = 132
        Width = 82
        Height = 21
        DataField = 'PRODUCAO_ACUMULADA'
        DataSource = dtsSanidade
        ParentColor = True
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit34: TDBEdit
        Left = 131
        Top = 163
        Width = 82
        Height = 21
        DataField = 'PL305'
        DataSource = dtsSanidade
        ParentColor = True
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit35: TDBEdit
        Left = 131
        Top = 225
        Width = 82
        Height = 21
        DataField = 'PRODUCAO_MEDIA'
        DataSource = dtsSanidade
        ParentColor = True
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit42: TDBEdit
        Left = 131
        Top = 194
        Width = 82
        Height = 21
        DataField = 'TOTAL'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit43: TDBEdit
        Left = 132
        Top = 70
        Width = 81
        Height = 21
        DataField = 'ULTIMA_LACTACAO'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
      end
    end
    object pnlInfReproducao: TJvPanel
      Left = 263
      Top = 170
      Width = 228
      Height = 193
      FlatBorder = True
      BorderWidth = 1
      Caption = ' '
      ParentBackground = False
      ParentColor = True
      TabOrder = 2
      object Label11: TLabel
        Left = 9
        Top = 35
        Width = 19
        Height = 13
        Caption = 'DPP'
      end
      object Label12: TLabel
        Left = 9
        Top = 66
        Width = 73
        Height = 13
        Caption = 'N'#250'mero de cios'
      end
      object Label13: TLabel
        Left = 9
        Top = 98
        Width = 107
        Height = 13
        Caption = 'N'#250'mero de coberturas'
      end
      object Label14: TLabel
        Left = 9
        Top = 129
        Width = 103
        Height = 13
        Caption = 'Dias do '#250'ltimo evento'
      end
      object Label15: TLabel
        Left = 9
        Top = 159
        Width = 34
        Height = 13
        Caption = 'Prenhe'
      end
      object pnlTitleReproducao: TJvPanel
        Left = 2
        Top = 2
        Width = 224
        Height = 15
        Align = alTop
        Caption = 'Reprodu'#231#227'o'
        Color = 15389113
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 212
      end
      object DBEdit27: TDBEdit
        Left = 142
        Top = 63
        Width = 70
        Height = 21
        DataField = 'NUMERO_CIO'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit28: TDBEdit
        Left = 142
        Top = 95
        Width = 70
        Height = 21
        DataField = 'NUMERO_MONTA'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit30: TDBEdit
        Left = 142
        Top = 156
        Width = 70
        Height = 21
        DataField = 'DESC_PRENHEZ'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit17: TDBEdit
        Left = 142
        Top = 32
        Width = 70
        Height = 21
        DataField = 'DPP'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit18: TDBEdit
        Left = 142
        Top = 126
        Width = 70
        Height = 21
        DataField = 'DIAS_ULTEVENTO'
        DataSource = dtsResumo
        ParentColor = True
        ReadOnly = True
        TabOrder = 4
      end
    end
    object pnlInfSanidade: TJvPanel
      Left = 507
      Top = 170
      Width = 219
      Height = 193
      FlatBorder = True
      BorderWidth = 1
      Caption = ' '
      ParentBackground = False
      ParentColor = True
      TabOrder = 3
      object Label41: TLabel
        Left = 7
        Top = 25
        Width = 66
        Height = 13
        Caption = #218'ltimo evento'
      end
      object Label42: TLabel
        Left = 7
        Top = 53
        Width = 34
        Height = 13
        Caption = 'Evento'
      end
      object Label44: TLabel
        Left = 7
        Top = 83
        Width = 57
        Height = 13
        Caption = 'An'#225'lise CCS'
      end
      object Label45: TLabel
        Left = 7
        Top = 112
        Width = 89
        Height = 13
        Caption = 'An'#225'lise % gordura'
      end
      object Label46: TLabel
        Left = 7
        Top = 141
        Width = 91
        Height = 13
        Caption = 'An'#225'lise % proteina'
      end
      object Label47: TLabel
        Left = 7
        Top = 169
        Width = 61
        Height = 13
        Caption = 'An'#225'lise ur'#233'ia'
      end
      object pnlTitleSanidade: TJvPanel
        Left = 2
        Top = 2
        Width = 215
        Height = 15
        Align = alTop
        Caption = 'Sanidade'
        Color = 15389113
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 203
      end
      object DBEdit36: TDBEdit
        Left = 116
        Top = 22
        Width = 86
        Height = 21
        DataField = 'DT_ULTIMO_EVENTO'
        DataSource = dtsSanidade
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit37: TDBEdit
        Left = 116
        Top = 50
        Width = 86
        Height = 21
        DataField = 'DESC_ULTIMO_EVENTO'
        DataSource = dtsSanidade
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit38: TDBEdit
        Left = 116
        Top = 80
        Width = 86
        Height = 21
        DataField = 'CCS'
        DataSource = dtsSanidade
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit39: TDBEdit
        Left = 116
        Top = 109
        Width = 86
        Height = 21
        DataField = 'GORDURA'
        DataSource = dtsSanidade
        ParentColor = True
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit40: TDBEdit
        Left = 116
        Top = 138
        Width = 86
        Height = 21
        DataField = 'PROTEINA'
        DataSource = dtsSanidade
        ParentColor = True
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit41: TDBEdit
        Left = 116
        Top = 167
        Width = 86
        Height = 21
        DataField = 'UREIA'
        DataSource = dtsSanidade
        ParentColor = True
        ReadOnly = True
        TabOrder = 6
      end
    end
    object pnlInfTarefas: TJvPanel
      Left = 263
      Top = 367
      Width = 463
      Height = 90
      FlatBorder = True
      BorderWidth = 1
      Caption = ' '
      ParentBackground = False
      ParentColor = True
      TabOrder = 4
      object Label51: TLabel
        Left = 5
        Top = 29
        Width = 62
        Height = 13
        Caption = #218'ltima tarefa'
      end
      object Label57: TLabel
        Left = 5
        Top = 62
        Width = 71
        Height = 13
        Caption = 'Pr'#243'xima tarefa'
      end
      object pnlTitleTarefas: TJvPanel
        Left = 2
        Top = 2
        Width = 459
        Height = 15
        Align = alTop
        Caption = 'Tarefas'
        Color = 15389113
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 432
      end
      object DBEdit44: TDBEdit
        Left = 94
        Top = 26
        Width = 260
        Height = 21
        DataField = 'TAREFA'
        DataSource = dtsUltimaTarefa
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit50: TDBEdit
        Left = 94
        Top = 59
        Width = 260
        Height = 21
        DataField = 'TAREFA'
        DataSource = dtsProximaTarefa
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit19: TDBEdit
        Left = 376
        Top = 26
        Width = 70
        Height = 21
        DataField = 'DATATAREFA'
        DataSource = dtsUltimaTarefa
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit20: TDBEdit
        Left = 376
        Top = 59
        Width = 70
        Height = 21
        DataField = 'DATATAREFA'
        DataSource = dtsProximaTarefa
        ParentColor = True
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
  object ActionList: TInternalActionList
  end
  object dtsResumo: TDataSource
    DataSet = dtmZoo_InformacoesAnimal.cdsResumoAnimal
    Left = 322
    Top = 6
  end
  object dtsUltimaTarefa: TDataSource
    DataSet = dtmZoo_InformacoesAnimal.cdsResumoAnimalUltimaTarefa
    Left = 351
    Top = 6
  end
  object dtsProximaTarefa: TDataSource
    DataSet = dtmZoo_InformacoesAnimal.cdsResumoAnimalProximaTarefa
    Left = 379
    Top = 6
  end
  object dtsSanidade: TDataSource
    DataSet = dtmZoo_InformacoesAnimal.cdsResumoAnimalSanidade
    Left = 408
    Top = 6
  end
end
