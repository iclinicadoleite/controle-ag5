inherited Zoo_ConfigurarImpressaoAutomatica: TZoo_ConfigurarImpressaoAutomatica
  Left = 363
  Top = 241
  Caption = 'Configurar impress'#227'o autom'#225'tica'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlDetail: TJvPanel
      ExplicitHeight = 287
      inherited PageControl: TJvPageControl
        ActivePage = TabSheet1
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object rbActive: TRadioGroup
            Left = 28
            Top = 13
            Width = 185
            Height = 45
            Caption = 'Impress'#227'o autom'#225'tica'
            Columns = 2
            Items.Strings = (
              'Ligado'
              'Desligado')
            TabOrder = 0
          end
          object GroupBox1: TGroupBox
            Left = 28
            Top = 63
            Width = 486
            Height = 83
            Caption = 'Dias da semana'
            TabOrder = 1
            object cbxTerca: TCheckBox
              Left = 127
              Top = 25
              Width = 98
              Height = 17
              Caption = 'Ter'#231'a-feira'
              TabOrder = 0
              OnClick = cbxDOWChecked
            end
            object cbxQuarta: TCheckBox
              Left = 243
              Top = 28
              Width = 98
              Height = 17
              Caption = 'Quarta-feira'
              TabOrder = 1
              OnClick = cbxDOWChecked
            end
            object cbxQuinta: TCheckBox
              Left = 359
              Top = 28
              Width = 98
              Height = 17
              Caption = 'Quinta-Feira'
              TabOrder = 2
              OnClick = cbxDOWChecked
            end
            object cbxSexta: TCheckBox
              Left = 10
              Top = 56
              Width = 98
              Height = 17
              Caption = 'Sexta-feira'
              TabOrder = 3
              OnClick = cbxDOWChecked
            end
            object cbxSabado: TCheckBox
              Left = 127
              Top = 56
              Width = 58
              Height = 17
              Caption = 'S'#225'bado'
              TabOrder = 4
              OnClick = cbxDOWChecked
            end
            object cbxDomingo: TCheckBox
              Left = 243
              Top = 56
              Width = 64
              Height = 18
              Caption = 'Domingo'
              TabOrder = 5
              OnClick = cbxDOWChecked
            end
            object cbxSegunda: TCheckBox
              Left = 11
              Top = 24
              Width = 98
              Height = 17
              Caption = 'Segunda-feira'
              TabOrder = 6
              OnClick = cbxDOWChecked
            end
            object chkAll: TCheckBox
              Left = 359
              Top = 56
              Width = 64
              Height = 18
              Caption = 'Todos'
              TabOrder = 7
              OnClick = chkAllClick
            end
          end
          object GroupBox2: TGroupBox
            Left = 28
            Top = 153
            Width = 317
            Height = 49
            Caption = 'Hor'#225'rio'
            TabOrder = 2
            object Label3: TLabel
              Left = 82
              Top = 23
              Width = 35
              Height = 13
              Caption = 'hora(s)'
            end
            object Label4: TLabel
              Left = 181
              Top = 23
              Width = 45
              Height = 13
              Caption = 'minuto(s)'
            end
            object speTime: TJvSpinEdit
              Left = 33
              Top = 20
              Width = 45
              Height = 21
              Decimal = 0
              MaxValue = 23.000000000000000000
              TabOrder = 0
            end
            object speMinute: TJvSpinEdit
              Left = 126
              Top = 20
              Width = 45
              Height = 21
              Decimal = 0
              MaxValue = 59.000000000000000000
              TabOrder = 1
            end
          end
          object rgPageBreak: TRadioGroup
            Left = 369
            Top = 208
            Width = 145
            Height = 48
            Caption = 'Quebra de p'#225'gina'
            Columns = 2
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 3
          end
          object GroupBox3: TGroupBox
            Left = 369
            Top = 153
            Width = 145
            Height = 49
            Caption = 'Tarefa(s) do(s) pr'#243'ximo(s)'
            TabOrder = 4
            object Label1: TLabel
              Left = 60
              Top = 24
              Width = 19
              Height = 13
              Caption = 'dias'
            end
            object speNextDays: TJvSpinEdit
              Left = 10
              Top = 20
              Width = 35
              Height = 21
              TabOrder = 0
            end
          end
          object GroupBox4: TGroupBox
            Left = 28
            Top = 207
            Width = 317
            Height = 48
            Caption = 'Ordenado por'
            TabOrder = 5
            object Label2: TLabel
              Left = 36
              Top = 19
              Width = 37
              Height = 13
              Caption = 'Data  +'
            end
            object cbxOrder: TComboBox
              Left = 83
              Top = 16
              Width = 217
              Height = 21
              Style = csDropDownList
              TabOrder = 0
              Items.Strings = (
                'Brinco'
                'Nome'
                'Lote'
                'Tarefa'
                'Protocolo'
                'Responsavel')
            end
          end
          object GroupBox5: TGroupBox
            Left = 219
            Top = 13
            Width = 295
            Height = 45
            Caption = 'Impressora'
            TabOrder = 6
            object PrinterNamesComboBox: TComboBox
              Tag = 2
              Left = 8
              Top = 16
              Width = 273
              Height = 20
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
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
  object JvChangeNotify1: TJvChangeNotify
    Notifications = <
      item
        Actions = [caChangeLastWrite]
      end>
    Left = 226
    Top = 33
  end
end
