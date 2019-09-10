inherited Zoo_CfgParametrosFazendaWizard: TZoo_CfgParametrosFazendaWizard
  Left = 356
  Top = 276
  Caption = 'Par'#226'metros da Fazenda'
  ClientHeight = 396
  ClientWidth = 896
  ExplicitWidth = 902
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 896
    Height = 396
    ExplicitWidth = 896
    ExplicitHeight = 396
    inherited _pnlFooter: TJvPanel
      Top = 365
      Width = 892
      ExplicitTop = 365
      ExplicitWidth = 892
      inherited _imageBottom: TImage
        Width = 892
        ExplicitWidth = 892
      end
      inherited _btbPrior: TTcGDIButton
        Left = 701
        ExplicitLeft = 701
      end
      inherited _btbNext: TTcGDIButton
        Left = 792
        ExplicitLeft = 792
      end
      inherited _btbExecute: TTcGDIButton
        Left = 807
        ExplicitLeft = 807
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 892
      Height = 363
      ExplicitWidth = 892
      ExplicitHeight = 363
      inherited PageControl: TJvPageControl
        Width = 892
        Height = 363
        ActivePage = TabSheet1
        ExplicitWidth = 892
        ExplicitHeight = 363
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Label1: TLabel
            Left = 500
            Top = 40
            Width = 170
            Height = 13
            Caption = 'Cios/Coberturas para os pr'#243'ximos :'
            Visible = False
          end
          object Label2: TLabel
            Left = 779
            Top = 40
            Width = 23
            Height = 13
            Caption = 'dias.'
            Visible = False
          end
          object Label3: TLabel
            Left = 44
            Top = 269
            Width = 129
            Height = 13
            Caption = 'Tarefas para os pr'#243'ximos :'
          end
          object Label4: TLabel
            Left = 322
            Top = 269
            Width = 23
            Height = 13
            Caption = 'dias.'
          end
          object Label5: TLabel
            Left = 500
            Top = 105
            Width = 138
            Height = 13
            Caption = 'Secagens para os pr'#243'ximos :'
            Visible = False
          end
          object Label6: TLabel
            Left = 779
            Top = 105
            Width = 23
            Height = 13
            Caption = 'dias.'
            Visible = False
          end
          object Label7: TLabel
            Left = 44
            Top = 211
            Width = 149
            Height = 13
            Caption = 'Intervalo de aplica'#231#227'o de BST :'
            Visible = False
          end
          object Label8: TLabel
            Left = 323
            Top = 211
            Width = 23
            Height = 13
            Caption = 'dias.'
            Visible = False
          end
          object Label9: TLabel
            Left = 44
            Top = 40
            Width = 205
            Height = 13
            Caption = 'Escala para gr'#225'fico produ'#231#227'o (leite/ur'#233'ia) :'
          end
          object Label10: TLabel
            Left = 323
            Top = 40
            Width = 58
            Height = 13
            Caption = '( 50 - 100 ).'
          end
          object Label11: TLabel
            Left = 44
            Top = 241
            Width = 218
            Height = 13
            Caption = 'dias antes da secagem para retirada do BST :'
            Visible = False
          end
          object Label12: TLabel
            Left = 323
            Top = 241
            Width = 23
            Height = 13
            Caption = 'dias.'
            Visible = False
          end
          object JvDBCalcEdit1: TJvDBCalcEdit
            Left = 728
            Top = 37
            Width = 44
            Height = 21
            MinValue = 1.000000000000000000
            ShowButton = False
            TabOrder = 7
            Value = 1.000000000000000000
            Visible = False
            DecimalPlacesAlwaysShown = False
            DataField = 'DIAS_PROX_CIOSCOB'
            DataSource = dtsParametrosFazenda
          end
          object JvDBCalcEdit2: TJvDBCalcEdit
            Left = 272
            Top = 266
            Width = 44
            Height = 21
            MinValue = 1.000000000000000000
            ShowButton = False
            TabOrder = 6
            Value = 1.000000000000000000
            DecimalPlacesAlwaysShown = False
            DataField = 'DIAS_PROX_TAREFAS'
            DataSource = dtsParametrosFazenda
          end
          object JvDBCalcEdit3: TJvDBCalcEdit
            Left = 728
            Top = 102
            Width = 44
            Height = 21
            MinValue = 1.000000000000000000
            ShowButton = False
            TabOrder = 8
            Value = 1.000000000000000000
            Visible = False
            DecimalPlacesAlwaysShown = False
            DataField = 'DIAS_PROX_SECAGENS'
            DataSource = dtsParametrosFazenda
          end
          object DBCheckBox1: TDBCheckBox
            Left = 44
            Top = 70
            Width = 373
            Height = 17
            Caption = 'N'#227'o exibir mensagem de estoque negativo para s'#234'mem/embri'#227'o.'
            DataField = 'DSA_ESTQ_MACHO'
            DataSource = dtsParametrosFazenda
            TabOrder = 1
            ValueChecked = 'T'
            ValueUnchecked = 'F'
          end
          object JvDBCalcEdit4: TJvDBCalcEdit
            Left = 272
            Top = 208
            Width = 44
            Height = 21
            MinValue = 1.000000000000000000
            ShowButton = False
            TabOrder = 4
            Value = 1.000000000000000000
            Visible = False
            DecimalPlacesAlwaysShown = False
            DataField = 'DIAS_INTERVALO_BST'
            DataSource = dtsParametrosFazenda
          end
          object JvDBCalcEdit5: TJvDBCalcEdit
            Left = 272
            Top = 37
            Width = 44
            Height = 21
            MaxValue = 100.000000000000000000
            MinValue = 50.000000000000000000
            ShowButton = False
            TabOrder = 0
            Value = 80.000000000000000000
            DecimalPlacesAlwaysShown = False
            DataField = 'ESCALA_PRODUCAO'
            DataSource = dtsParametrosFazenda
          end
          object DBCheckBox2: TDBCheckBox
            Left = 44
            Top = 96
            Width = 373
            Height = 17
            Caption = 'Considerar prenhe, animais sem confirma'#231#227'o de prenhez.'
            DataField = 'EXIBIR_PARTOS_SEMCONFIRMACAO'
            DataSource = dtsParametrosFazenda
            TabOrder = 2
            ValueChecked = 'T'
            ValueUnchecked = 'F'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 44
            Top = 174
            Width = 373
            Height = 17
            Caption = 'Permitir excluir dados de descarte de leite/carne'
            DataField = 'EXCLUIR_TAREFAS_DESCARTE'
            DataSource = dtsParametrosFazenda
            TabOrder = 3
            ValueChecked = 'T'
            ValueUnchecked = 'F'
          end
          object JvDBCalcEdit6: TJvDBCalcEdit
            Left = 272
            Top = 238
            Width = 44
            Height = 21
            MinValue = 1.000000000000000000
            ShowButton = False
            TabOrder = 5
            Value = 1.000000000000000000
            Visible = False
            DecimalPlacesAlwaysShown = False
            DataField = 'DIAS_PRE_SECAGEM_BST'
            DataSource = dtsParametrosFazenda
          end
          object dbckConsiderarNaoPrenheSemDiagnostico: TDBCheckBox
            Left = 44
            Top = 122
            Width = 413
            Height = 17
            Caption = 
              'Considerar como n'#227'o prenhe animais sem diagn'#243'stico de gesta'#231#227'o r' +
              'einseminados.'
            DataField = 'CONSIDERAR_NAOPRENHE_SEMCONFIRM'
            DataSource = dtsParametrosFazenda
            TabOrder = 9
            ValueChecked = 'T'
            ValueUnchecked = 'F'
          end
          object dbckConsiderarNaoPrenheDescartado: TDBCheckBox
            Left = 44
            Top = 148
            Width = 413
            Height = 17
            Caption = 
              'Considerar como n'#227'o prenhe animais sem diagn'#243'stico de gesta'#231#227'o d' +
              'escartados.'
            DataField = 'CONSIDERAR_NAOPRENHE_DESCARTADO'
            DataSource = dtsParametrosFazenda
            TabOrder = 10
            ValueChecked = 'T'
            ValueUnchecked = 'F'
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actExecute: TAction
      Caption = '&Salvar'
    end
  end
  object dtsParametrosFazenda: TDataSource
    DataSet = Zoo_CfgParametrosFazendaDatamodule.cdsParametrosFazenda
    Left = 370
    Top = 68
  end
end
