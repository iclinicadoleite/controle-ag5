inherited Zoo_AtividadesLVCiclosAnormaisWizard: TZoo_AtividadesLVCiclosAnormaisWizard
  Left = 501
  Top = 287
  Caption = 'Atividades - Ciclos Anormais'
  ClientWidth = 663
  ExplicitWidth = 669
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 663
    ExplicitWidth = 663
    inherited _pnlFooter: TJvPanel
      Width = 659
      ExplicitWidth = 659
      inherited _imageBottom: TImage
        Width = 659
        ExplicitWidth = 653
      end
      inherited _btbPrior: TTcGDIButton
        Left = 468
        ExplicitLeft = 468
      end
      inherited _btbNext: TTcGDIButton
        Left = 559
        ExplicitLeft = 559
      end
      inherited _btbExecute: TTcGDIButton
        Left = 574
        ExplicitLeft = 574
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 659
      ExplicitWidth = 659
      inherited PageControl: TJvPageControl
        Width = 659
        ExplicitWidth = 659
        inherited TabSheetParametros: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 659
          ExplicitHeight = 287
        end
        inherited TabSheetResultado: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 659
          ExplicitHeight = 287
          inherited DBGridResultados: TJvDBUltimGrid
            Width = 659
            Height = 260
            EditControls = <
              item
                ControlName = 'DBMemo1'
                FieldName = 'OBS'
                FitCell = fcDesignSize
                LeaveOnEnterKey = True
              end>
            Columns = <
              item
                Expanded = False
                FieldName = 'BRINCO'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EVENTO'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'INTERVALO'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FUNCIONARIO'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIAGNOSTICO'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBS'
                Width = 70
                Visible = True
              end>
          end
          object DBMemo1: TDBMemo
            Left = 252
            Top = 96
            Width = 185
            Height = 89
            DataField = 'OBS'
            DataSource = dtsResultado
            TabOrder = 1
            Visible = False
          end
          object Panel3: TPanel
            Left = 0
            Top = 260
            Width = 659
            Height = 27
            Align = alBottom
            Caption = ' '
            Color = clSilver
            ParentBackground = False
            TabOrder = 2
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
    DataSet = Zoo_AtividadesLVCiclosAnormaisDatamodule.cdsCiclosAnormais
  end
end
