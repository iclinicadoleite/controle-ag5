object frmZoo_ClassificacaoAnimal: TfrmZoo_ClassificacaoAnimal
  Left = 386
  Top = 219
  Caption = 'frmZoo_ClassificacaoAnimal'
  ClientHeight = 185
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 620
    Height = 185
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    Caption = '_pnldbgLista'
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object dbgClassificacao: TJvDBUltimGrid
      Left = 1
      Top = 1
      Width = 618
      Height = 183
      Align = alClient
      DataSource = dtsDadosClassificacao
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = dbgClassificacaoKeyDown
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <
        item
          ControlName = 'TcMPDBDateEdit1'
          FieldName = 'DATA'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'DBMemo1'
          FieldName = 'AF_OBS'
          FitCell = fcBiggest
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'dbePontuacaoFinal'
          FieldName = 'AF_PONTUACAOFINAL'
          FitCell = fcCellSize
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end
        item
          ControlName = 'DBMemo2'
          FieldName = 'AF_DEFEITOS'
          FitCell = fcBiggest
          LeaveOnEnterKey = True
          LeaveOnUpDownKey = True
        end>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FL_ESTATURA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FL_NIVELAMENTOLINHASUPERIOR'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FL_LARGURAPEITO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FL_PROFUNDIDADECORPORAL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FL_ANGULOSIDADE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FL_ESCORECORPORAL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FL_PONTUACAO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GP_ANGULOGARUPA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GP_LARGURAGARUPA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GP_FORCALOMBO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GP_PONTUACAO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PP_ANGULOCASCO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PP_PROFUNDIDADETALAO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PP_QTDEOSSEA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PP_POSTERIORVISTALATERAL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PP_POSTERIORVISTAPOSTERIOR'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PP_PONTUACAO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SM_PROFUNDIDADEUBERE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SM_TEXTURAUBERE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SM_LIGAMENTOMEDIO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SM_INSERCAOUBEREANTERIOR'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SM_COLOCACAOTETOSANTERIRORES'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SM_ALTURAUBEREPOSTERIOR'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SM_LARGURAUBEREPOSTERIOR'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SM_COLOCACAOTETOSPOSTERIORES'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SM_COMPRIMENTOTETOS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SM_PONTUACAO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AF_DEFEITOS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AF_PONTUACAOFINAL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AF_ENQUADRAMENTOCLASSE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AF_OBS'
          Visible = True
        end>
    end
    object TcMPDBDateEdit1: TTcDBDateEdit
      Left = 56
      Top = 68
      Width = 121
      Height = 21
      Checked = False
      DataField = 'DATA'
      DataSource = dtsDadosClassificacao
      CheckOnExit = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object dbePontuacaoFinal: TJvDBCalcEdit
      Left = 120
      Top = 100
      Width = 121
      Height = 21
      DecimalPlaces = 0
      DisplayFormat = '0'
      MaxValue = 100.000000000000000000
      MinValue = 40.000000000000000000
      TabOrder = 2
      Value = 40.000000000000000000
      Visible = False
      ZeroEmpty = False
      DecimalPlacesAlwaysShown = False
      DataField = 'AF_PONTUACAOFINAL'
      DataSource = dtsDadosClassificacao
    end
    object DBMemo1: TDBMemo
      Left = 296
      Top = 58
      Width = 279
      Height = 83
      DataField = 'AF_OBS'
      DataSource = dtsDadosClassificacao
      TabOrder = 3
      Visible = False
    end
    object DBMemo2: TDBMemo
      Left = 332
      Top = 78
      Width = 279
      Height = 83
      DataField = 'AF_DEFEITOS'
      DataSource = dtsDadosClassificacao
      TabOrder = 4
      Visible = False
    end
  end
  object ActionList: TInternalActionList
  end
  object dtsDadosClassificacao: TDataSource
    DataSet = dtmZoo_ClassificacaoAnimal.cdsClassificacao
    Left = 489
    Top = 18
  end
end
