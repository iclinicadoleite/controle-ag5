object frmZoo_ProducaoAnimal: TfrmZoo_ProducaoAnimal
  Left = 399
  Top = 223
  Caption = 'frmZoo_ProducaoAnimal'
  ClientHeight = 381
  ClientWidth = 843
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SplitterPanelLactacoes_Detail: TSplitter
    Left = 0
    Top = 139
    Width = 843
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Color = clWhite
    ParentColor = False
    ExplicitLeft = 3
    ExplicitTop = 122
  end
  object PanelLactacoes: TJvPanel
    Left = 0
    Top = 0
    Width = 843
    Height = 139
    FlatBorder = True
    Align = alTop
    BorderWidth = 1
    Caption = ' '
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object JvPanel12: TJvPanel
      Left = 2
      Top = 2
      Width = 839
      Height = 19
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Align = alTop
      Alignment = taLeftJustify
      Caption = ' Lacta'#231#245'es'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12546560
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object dbgLactacao: TJvDBUltimGrid
      Left = 2
      Top = 21
      Width = 839
      Height = 116
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtsLactacoes
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnEnter = dbgLactacaoEnter
      AutoAppend = False
      OnShowEditor = dbgLactacaoShowEditor
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <
        item
          ControlName = 'deDtSecagem'
          FieldName = 'DATA_SECAGEM'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'cbCausaSecagem'
          FieldName = 'DESC_SECAGEM'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
        end
        item
          ControlName = 'dbMemoObsSecagem'
          FieldName = 'OBS_SECAGEM'
          FitCell = fcBiggest
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end>
      RowsHeight = 17
      TitleRowHeight = 17
      OnCheckIfBooleanField = dbgLactacaoCheckIfBooleanField
      Columns = <
        item
          Expanded = False
          FieldName = 'NL'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATALACTACAO'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ABORTOU'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEL'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUCAO_MEDIA_DIARIA'
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUCAO_PICO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PL305'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GORDURA_MEDIA'
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROTEINA_MEDIA'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PLT'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PGT'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PPT'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_SECAGEM'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IEP_MESES'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEL_PICO'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MAX_ORDENHAS_DIA'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PL365'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQA_LEITE'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESVIO_EQA_LEITE'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_SECAGEM'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_SECAGEM'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APLICADO_PROTOCOLO_SECAGEM'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ULTIMA_PESAGEMLEITE'
          Width = 40
          Visible = True
        end>
    end
    object deDtSecagem: TTcDBDateEdit
      Left = 367
      Top = 70
      Width = 106
      Height = 21
      Checked = False
      DataField = 'DATA_SECAGEM'
      DataSource = dtsLactacoes
      CheckOnExit = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object dbMemoObsSecagem: TDBMemo
      Left = 552
      Top = 60
      Width = 184
      Height = 89
      DataField = 'OBS_SECAGEM'
      DataSource = dtsLactacoes
      TabOrder = 3
      Visible = False
    end
    object cbCausaSecagem: TJvDBComboBox
      Left = 210
      Top = 70
      Width = 145
      Height = 22
      Style = csOwnerDrawVariable
      DataField = 'CAUSA_SECAGEM'
      DataSource = dtsLactacoes
      DropDownWidth = 250
      TabOrder = 4
      Visible = False
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.KeyField = 'VALOR'
      ListSettings.DisplayField = 'DESCRICAO'
      ListSettings.DataSource = dtsMotivoSecagem
      OnEnter = cbCausaSecagemEnter
      OnKeyDown = cbCausaSecagemKeyDown
    end
  end
  object PanelLactacoesDetail: TJvPanel
    Left = 0
    Top = 144
    Width = 843
    Height = 237
    FlatBorder = True
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object SplitterPanelLactacoesDetailA: TSplitter
      Left = 487
      Top = 20
      Width = 5
      Height = 216
      Align = alRight
      Color = clWhite
      ParentColor = False
      ExplicitLeft = 486
      ExplicitHeight = 215
    end
    object PanelLactacoesDetailPesagens: TPanel
      Left = 1
      Top = 20
      Width = 486
      Height = 216
      Align = alClient
      Caption = ' '
      TabOrder = 0
      object PanelTitlePesagens: TJvPanel
        Left = 1
        Top = 1
        Width = 484
        Height = 19
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        Align = alTop
        Alignment = taLeftJustify
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        BevelOuter = bvNone
        Caption = ' Pesagens'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12546560
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object dbgProducao: TJvDBUltimGrid
        Left = 1
        Top = 20
        Width = 484
        Height = 195
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        BorderStyle = bsNone
        DataSource = dtsPesagens
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnEnter = dbgProducaoEnter
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <
          item
            ControlName = 'deDtPesagens'
            FieldName = 'DATA'
            FitCell = fcCellSize
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end
          item
            ControlName = 'dbMemoPesagens'
            FieldName = 'OBSERVACAO'
            FitCell = fcBiggest
            LeaveOnEnterKey = True
            LeaveOnUpDownKey = True
          end>
        RowsHeight = 17
        TitleRowHeight = 17
        OnCheckIfBooleanField = dbgProducaoCheckIfBooleanField
        Columns = <
          item
            Expanded = False
            FieldName = 'DATA'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEL'
            ReadOnly = True
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NORD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORD1'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORD2'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORD3'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VARIACAO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOTE'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANIMAL_DOENTE'
            Width = 50
            Visible = True
          end>
      end
      object dbMemoPesagens: TDBMemo
        Left = 49
        Top = 91
        Width = 169
        Height = 50
        DataField = 'OBSERVACAO'
        DataSource = dtsPesagens
        TabOrder = 2
        Visible = False
      end
      object deDtPesagens: TTcDBDateEdit
        Left = 48
        Top = 65
        Width = 98
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Checked = False
        DataField = 'DATA'
        DataSource = dtsPesagens
        CheckOnExit = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ButtonWidth = 17
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
    end
    object PanelLactacoesDetail_PesagensAnalises: TPanel
      Left = 492
      Top = 20
      Width = 350
      Height = 216
      Align = alRight
      Caption = ' '
      ParentBackground = False
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 1
        Top = 138
        Width = 348
        Height = 5
        Cursor = crVSplit
        Align = alBottom
        Color = clWhite
        ParentColor = False
        ExplicitTop = 136
      end
      object PanelTitleAnalises: TJvPanel
        Left = 1
        Top = 1
        Width = 348
        Height = 19
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' An'#225'lises'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12546560
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object dbgAnalises: TJvDBUltimGrid
        Left = 1
        Top = 20
        Width = 348
        Height = 118
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        BorderStyle = bsNone
        DataSource = dtsAnalises
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnEnter = dbgAnalisesEnter
        AutoAppend = False
        OnShowEditor = dbgAnalisesShowEditor
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
      end
      object Panel1: TPanel
        Left = 1
        Top = 143
        Width = 348
        Height = 72
        Align = alBottom
        BevelOuter = bvNone
        Caption = ' '
        Color = 15724527
        Constraints.MaxHeight = 72
        ParentBackground = False
        TabOrder = 2
        object Label1: TLabel
          Left = 5
          Top = 5
          Width = 105
          Height = 24
          Caption = 'G = Teor de Gordura '#13'P = Teor de Protei'#769'na '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 179
          Top = 5
          Width = 141
          Height = 24
          Caption = 'L   = Teor de Lactose'#13'ST = Teor de  S'#243'lidos Totais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 5
          Top = 33
          Width = 228
          Height = 36
          Caption = 
            'ESD = Teor de Extrato Seco Desengordurado '#13'CCS = Contagem C'#233'lula' +
            's Som'#225'ticas'#13'NU = Teor de Nitrog'#234'nio Ur'#233'ico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object JvPanel1: TJvPanel
      Left = 1
      Top = 1
      Width = 841
      Height = 19
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Align = alTop
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      BevelOuter = bvNone
      Caption = ' Dados da lacta'#231#227'o'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12546560
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object DBText3: TDBText
        Left = 132
        Top = 3
        Width = 65
        Height = 16
        DataField = 'NL'
        DataSource = dtsLactacoes
      end
    end
  end
  object ActionList: TInternalActionList
  end
  object dtsLactacoes: TDataSource
    DataSet = dtmZoo_ProducaoAnimal.cdsLactacoes
    Left = 768
    Top = 62
  end
  object dtsPesagens: TDataSource
    DataSet = dtmZoo_ProducaoAnimal.cdsPesagemLeite
    Left = 768
    Top = 182
  end
  object dtsAnalises: TDataSource
    DataSet = dtmZoo_ProducaoAnimal.cdsAnalises
    Left = 768
    Top = 294
  end
  object dtsMotivoSecagem: TDataSource
    DataSet = dtmZoo_ProducaoAnimal.cdsMotivoSecagem
    Left = 812
    Top = 84
  end
end
