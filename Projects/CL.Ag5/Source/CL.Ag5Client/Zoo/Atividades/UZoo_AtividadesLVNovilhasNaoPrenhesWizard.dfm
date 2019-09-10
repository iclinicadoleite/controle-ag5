inherited Zoo_AtividadesLVNovilhasNaoPrenhesWizard: TZoo_AtividadesLVNovilhasNaoPrenhesWizard
  Left = 489
  Top = 247
  Caption = 'Atividades - Novilhas n'#227'o prenhe'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlDetail: TJvPanel
      inherited PageControl: TJvPageControl
        inherited TabSheetParametros: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 527
          ExplicitHeight = 287
          object Label1: TLabel
            Left = 47
            Top = 58
            Width = 121
            Height = 13
            Caption = 'Animais a examinar at'#233' : '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object deAte: TTcDateEdit
            Left = 186
            Top = 55
            Width = 83
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 19
            TabOrder = 0
          end
        end
        inherited TabSheetResultado: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 527
          ExplicitHeight = 287
          inherited DBGridResultados: TJvDBUltimGrid
            Height = 260
            Columns = <
              item
                Expanded = False
                FieldName = 'BRINCOFEMEA'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEFEMEA'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESC_EVENTO'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAEVENTO'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'INTERVALO'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ULTIMO_DIAGNOSTICO'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEFUNCIONARIO'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IDADE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PESO'
                Visible = True
              end>
          end
          object Panel3: TPanel
            Left = 0
            Top = 260
            Width = 527
            Height = 27
            Align = alBottom
            Caption = ' '
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            ExplicitTop = 321
            ExplicitWidth = 928
            object lblTotalLinhas: TLabel
              Left = 16
              Top = 7
              Width = 64
              Height = 13
              Caption = 'lblTotalLinhas'
            end
          end
        end
      end
    end
  end
  inherited dtsResultado: TDataSource
    DataSet = Zoo_AtividadesLVNovilhasNaoPrenhesDatamodule.cdsANovilhasNaoPrenhes
  end
end
